open Smaws_Lib.Json.SerializeHelpers
open Types

let access_denied_exception_reason_to_yojson (x : access_denied_exception_reason) =
  match x with
  | INSUFFICIENT_ACCOUNT_REPUTATION -> `String "INSUFFICIENT_ACCOUNT_REPUTATION"
  | ACCOUNT_DISABLED -> `String "ACCOUNT_DISABLED"

let access_denied_exception_to_yojson (x : access_denied_exception) =
  assoc_to_yojson
    [
      ("Message", option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.string__to_yojson x.message);
      ("Reason", option_to_yojson access_denied_exception_reason_to_yojson x.reason);
    ]

let account_attribute_name_to_yojson (x : account_attribute_name) =
  match x with
  | ACCOUNT_TIER -> `String "ACCOUNT_TIER"
  | DEFAULT_PROTECT_CONFIGURATION_ID -> `String "DEFAULT_PROTECT_CONFIGURATION_ID"

let account_attribute_to_yojson (x : account_attribute) =
  assoc_to_yojson
    [
      ("Name", Some (account_attribute_name_to_yojson x.name));
      ("Value", Some (Smaws_Lib.Smithy_api.Json_serializers.string__to_yojson x.value));
    ]

let account_attribute_list_to_yojson tree = list_to_yojson account_attribute_to_yojson tree

let account_limit_name_to_yojson (x : account_limit_name) =
  match x with
  | PHONE_NUMBERS -> `String "PHONE_NUMBERS"
  | POOLS -> `String "POOLS"
  | CONFIGURATION_SETS -> `String "CONFIGURATION_SETS"
  | OPT_OUT_LISTS -> `String "OPT_OUT_LISTS"
  | SENDER_IDS -> `String "SENDER_IDS"
  | REGISTRATIONS -> `String "REGISTRATIONS"
  | REGISTRATION_ATTACHMENTS -> `String "REGISTRATION_ATTACHMENTS"
  | VERIFIED_DESTINATION_NUMBERS -> `String "VERIFIED_DESTINATION_NUMBERS"

let account_limit_to_yojson (x : account_limit) =
  assoc_to_yojson
    [
      ("Name", Some (account_limit_name_to_yojson x.name));
      ("Used", Some (Smaws_Lib.Smithy_api.Json_serializers.primitive_long_to_yojson x.used));
      ("Max", Some (Smaws_Lib.Smithy_api.Json_serializers.primitive_long_to_yojson x.max));
    ]

let account_limit_list_to_yojson tree = list_to_yojson account_limit_to_yojson tree
let amazon_resource_name_to_yojson = string_to_yojson

let validation_exception_field_to_yojson (x : validation_exception_field) =
  assoc_to_yojson
    [
      ("Name", Some (Smaws_Lib.Smithy_api.Json_serializers.string__to_yojson x.name));
      ("Message", Some (Smaws_Lib.Smithy_api.Json_serializers.string__to_yojson x.message));
    ]

let validation_exception_field_list_to_yojson tree =
  list_to_yojson validation_exception_field_to_yojson tree

let validation_exception_reason_to_yojson (x : validation_exception_reason) =
  match x with
  | CANNOT_ADD_OPTED_OUT_NUMBER -> `String "CANNOT_ADD_OPTED_OUT_NUMBER"
  | CANNOT_PARSE -> `String "CANNOT_PARSE"
  | CHANNEL_NOT_ENABLED -> `String "CHANNEL_NOT_ENABLED"
  | COUNTRY_CODE_MISMATCH -> `String "COUNTRY_CODE_MISMATCH"
  | COUNTRY_NOT_ENABLED -> `String "COUNTRY_NOT_ENABLED"
  | DESTINATION_COUNTRY_BLOCKED -> `String "DESTINATION_COUNTRY_BLOCKED"
  | FIELD_VALIDATION_FAILED -> `String "FIELD_VALIDATION_FAILED"
  | ATTACHMENT_TYPE_NOT_SUPPORTED -> `String "ATTACHMENT_TYPE_NOT_SUPPORTED"
  | INTERNATIONAL_SENDING_NOT_SUPPORTED -> `String "INTERNATIONAL_SENDING_NOT_SUPPORTED"
  | INVALID_ARN -> `String "INVALID_ARN"
  | INVALID_FILTER_VALUES -> `String "INVALID_FILTER_VALUES"
  | INVALID_IDENTITY_FOR_DESTINATION_COUNTRY -> `String "INVALID_IDENTITY_FOR_DESTINATION_COUNTRY"
  | INVALID_NEXT_TOKEN -> `String "INVALID_NEXT_TOKEN"
  | INVALID_PARAMETER -> `String "INVALID_PARAMETER"
  | INVALID_REQUEST -> `String "INVALID_REQUEST"
  | INVALID_REGISTRATION_ASSOCIATION -> `String "INVALID_REGISTRATION_ASSOCIATION"
  | MAXIMUM_SIZE_EXCEEDED -> `String "MAXIMUM_SIZE_EXCEEDED"
  | MEDIA_TYPE_NOT_SUPPORTED -> `String "MEDIA_TYPE_NOT_SUPPORTED"
  | MISSING_PARAMETER -> `String "MISSING_PARAMETER"
  | PARAMETERS_CANNOT_BE_USED_TOGETHER -> `String "PARAMETERS_CANNOT_BE_USED_TOGETHER"
  | PHONE_NUMBER_CANNOT_BE_OPTED_IN -> `String "PHONE_NUMBER_CANNOT_BE_OPTED_IN"
  | PHONE_NUMBER_CANNOT_BE_RELEASED -> `String "PHONE_NUMBER_CANNOT_BE_RELEASED"
  | PRICE_OVER_THRESHOLD -> `String "PRICE_OVER_THRESHOLD"
  | RESOURCE_NOT_ACCESSIBLE -> `String "RESOURCE_NOT_ACCESSIBLE"
  | REQUESTED_SPEND_LIMIT_HIGHER_THAN_SERVICE_LIMIT ->
      `String "REQUESTED_SPEND_LIMIT_HIGHER_THAN_SERVICE_LIMIT"
  | SENDER_ID_NOT_REGISTERED -> `String "SENDER_ID_NOT_REGISTERED"
  | SENDER_ID_NOT_SUPPORTED -> `String "SENDER_ID_NOT_SUPPORTED"
  | SENDER_ID_REQUIRES_REGISTRATION -> `String "SENDER_ID_REQUIRES_REGISTRATION"
  | TWO_WAY_TOPIC_NOT_PRESENT -> `String "TWO_WAY_TOPIC_NOT_PRESENT"
  | TWO_WAY_NOT_ENABLED -> `String "TWO_WAY_NOT_ENABLED"
  | TWO_WAY_NOT_SUPPORTED_IN_COUNTRY -> `String "TWO_WAY_NOT_SUPPORTED_IN_COUNTRY"
  | TWO_WAY_NOT_SUPPORTED_IN_REGION -> `String "TWO_WAY_NOT_SUPPORTED_IN_REGION"
  | TWO_WAY_CHANNEL_NOT_PRESENT -> `String "TWO_WAY_CHANNEL_NOT_PRESENT"
  | UNKNOWN_REGISTRATION_FIELD -> `String "UNKNOWN_REGISTRATION_FIELD"
  | UNKNOWN_REGISTRATION_SECTION -> `String "UNKNOWN_REGISTRATION_SECTION"
  | UNKNOWN_REGISTRATION_TYPE -> `String "UNKNOWN_REGISTRATION_TYPE"
  | UNKNOWN_REGISTRATION_VERSION -> `String "UNKNOWN_REGISTRATION_VERSION"
  | UNKNOWN_OPERATION -> `String "UNKNOWN_OPERATION"
  | REGISTRATION_FIELD_CANNOT_BE_DELETED -> `String "REGISTRATION_FIELD_CANNOT_BE_DELETED"
  | VERIFICATION_CODE_MISMATCH -> `String "VERIFICATION_CODE_MISMATCH"
  | VOICE_CAPABILITY_NOT_AVAILABLE -> `String "VOICE_CAPABILITY_NOT_AVAILABLE"
  | UNSPECIFIED_PARAMETER_NOT_SUPPORTED -> `String "UNSPECIFIED_PARAMETER_NOT_SUPPORTED"
  | OTHER -> `String "OTHER"

let validation_exception_to_yojson (x : validation_exception) =
  assoc_to_yojson
    [
      ("Message", option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.string__to_yojson x.message);
      ("Reason", option_to_yojson validation_exception_reason_to_yojson x.reason);
      ("Fields", option_to_yojson validation_exception_field_list_to_yojson x.fields);
    ]

let throttling_exception_to_yojson (x : throttling_exception) =
  assoc_to_yojson
    [
      ("Message", option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.string__to_yojson x.message);
    ]

let service_quota_exceeded_exception_reason_to_yojson (x : service_quota_exceeded_exception_reason)
    =
  match x with
  | ASSOCIATIONS_PER_REGISTRATION -> `String "ASSOCIATIONS_PER_REGISTRATION"
  | CONFIGURATION_SETS_PER_ACCOUNT -> `String "CONFIGURATION_SETS_PER_ACCOUNT"
  | DAILY_DESTINATION_CALL_LIMIT -> `String "DAILY_DESTINATION_CALL_LIMIT"
  | DAILY_NOTIFY_TIER_MESSAGE_LIMIT -> `String "DAILY_NOTIFY_TIER_MESSAGE_LIMIT"
  | EVENT_DESTINATIONS_PER_CONFIGURATION_SET -> `String "EVENT_DESTINATIONS_PER_CONFIGURATION_SET"
  | KEYWORDS_PER_PHONE_NUMBER -> `String "KEYWORDS_PER_PHONE_NUMBER"
  | KEYWORDS_PER_POOL -> `String "KEYWORDS_PER_POOL"
  | MONTHLY_SPEND_LIMIT_REACHED_FOR_MEDIA -> `String "MONTHLY_SPEND_LIMIT_REACHED_FOR_MEDIA"
  | MONTHLY_SPEND_LIMIT_REACHED_FOR_NOTIFY -> `String "MONTHLY_SPEND_LIMIT_REACHED_FOR_NOTIFY"
  | MONTHLY_SPEND_LIMIT_REACHED_FOR_RCS -> `String "MONTHLY_SPEND_LIMIT_REACHED_FOR_RCS"
  | MONTHLY_SPEND_LIMIT_REACHED_FOR_TEXT -> `String "MONTHLY_SPEND_LIMIT_REACHED_FOR_TEXT"
  | MONTHLY_SPEND_LIMIT_REACHED_FOR_VOICE -> `String "MONTHLY_SPEND_LIMIT_REACHED_FOR_VOICE"
  | NOTIFY_CONFIGURATIONS_PER_ACCOUNT -> `String "NOTIFY_CONFIGURATIONS_PER_ACCOUNT"
  | OPT_OUT_LISTS_PER_ACCOUNT -> `String "OPT_OUT_LISTS_PER_ACCOUNT"
  | ORIGINATION_IDENTITIES_PER_POOL -> `String "ORIGINATION_IDENTITIES_PER_POOL"
  | PHONE_NUMBERS_PER_ACCOUNT -> `String "PHONE_NUMBERS_PER_ACCOUNT"
  | PHONE_NUMBERS_PER_REGISTRATION -> `String "PHONE_NUMBERS_PER_REGISTRATION"
  | POOLS_PER_ACCOUNT -> `String "POOLS_PER_ACCOUNT"
  | RCS_AGENTS_PER_ACCOUNT -> `String "RCS_AGENTS_PER_ACCOUNT"
  | REGISTRATION_ATTACHMENTS_CREATED_PER_DAY -> `String "REGISTRATION_ATTACHMENTS_CREATED_PER_DAY"
  | REGISTRATION_ATTACHMENTS_PER_ACCOUNT -> `String "REGISTRATION_ATTACHMENTS_PER_ACCOUNT"
  | REGISTRATION_VERSIONS_CREATED_PER_DAY -> `String "REGISTRATION_VERSIONS_CREATED_PER_DAY"
  | REGISTRATIONS_PER_ACCOUNT -> `String "REGISTRATIONS_PER_ACCOUNT"
  | SENDER_IDS_PER_ACCOUNT -> `String "SENDER_IDS_PER_ACCOUNT"
  | TAGS_PER_RESOURCE -> `String "TAGS_PER_RESOURCE"
  | VERIFIED_DESTINATION_NUMBERS_PER_ACCOUNT -> `String "VERIFIED_DESTINATION_NUMBERS_PER_ACCOUNT"
  | VERIFICATION_ATTEMPTS_PER_DAY -> `String "VERIFICATION_ATTEMPTS_PER_DAY"
  | PROTECT_CONFIGURATIONS_PER_ACCOUNT -> `String "PROTECT_CONFIGURATIONS_PER_ACCOUNT"

let service_quota_exceeded_exception_to_yojson (x : service_quota_exceeded_exception) =
  assoc_to_yojson
    [
      ("Message", option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.string__to_yojson x.message);
      ("Reason", option_to_yojson service_quota_exceeded_exception_reason_to_yojson x.reason);
    ]

let resource_type_to_yojson (x : resource_type) =
  match x with
  | ACCOUNT -> `String "account"
  | PHONE_NUMBER -> `String "phone-number"
  | SENDER_ID -> `String "sender-id"
  | POOL -> `String "pool"
  | CONFIGURATION_SET -> `String "configuration-set"
  | OPT_OUT_LIST -> `String "opt-out-list"
  | EVENT_DESTINATION -> `String "event-destination"
  | KEYWORD -> `String "keyword"
  | OPTED_OUT_NUMBER -> `String "opted-out-number"
  | REGISTRATION -> `String "registration"
  | REGISTRATION_ATTACHMENT -> `String "registration-attachment"
  | VERIFIED_DESTINATION_NUMBER -> `String "verified-destination-number"
  | PROTECT_CONFIGURATION -> `String "protect-configuration"
  | NOTIFY_CONFIGURATION -> `String "notify-configuration"
  | NOTIFY_TEMPLATE -> `String "notify-template"
  | MESSAGE_TEMPLATE -> `String "message-template"
  | POLICY -> `String "policy"
  | MESSAGE -> `String "message"
  | RCS_AGENT -> `String "rcs-agent"

let resource_not_found_exception_to_yojson (x : resource_not_found_exception) =
  assoc_to_yojson
    [
      ("Message", option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.string__to_yojson x.message);
      ("ResourceType", option_to_yojson resource_type_to_yojson x.resource_type);
      ( "ResourceId",
        option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.string__to_yojson x.resource_id );
    ]

let internal_server_exception_to_yojson (x : internal_server_exception) =
  assoc_to_yojson
    [
      ("Message", option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.string__to_yojson x.message);
      ( "RequestId",
        option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.string__to_yojson x.request_id );
    ]

let conflict_exception_reason_to_yojson (x : conflict_exception_reason) =
  match x with
  | CREATE_REGISTRATION_VERSION_NOT_ALLOWED -> `String "CREATE_REGISTRATION_VERSION_NOT_ALLOWED"
  | DELETION_PROTECTION_ENABLED -> `String "DELETION_PROTECTION_ENABLED"
  | DESTINATION_PHONE_NUMBER_NOT_VERIFIED -> `String "DESTINATION_PHONE_NUMBER_NOT_VERIFIED"
  | DESTINATION_PHONE_NUMBER_OPTED_OUT -> `String "DESTINATION_PHONE_NUMBER_OPTED_OUT"
  | DISASSOCIATE_REGISTRATION_NOT_ALLOWED -> `String "DISASSOCIATE_REGISTRATION_NOT_ALLOWED"
  | DISCARD_REGISTRATION_VERSION_NOT_ALLOWED -> `String "DISCARD_REGISTRATION_VERSION_NOT_ALLOWED"
  | EDIT_REGISTRATION_FIELD_VALUES_NOT_ALLOWED ->
      `String "EDIT_REGISTRATION_FIELD_VALUES_NOT_ALLOWED"
  | EVENT_DESTINATION_MISMATCH -> `String "EVENT_DESTINATION_MISMATCH"
  | KEYWORD_MISMATCH -> `String "KEYWORD_MISMATCH"
  | LAST_PHONE_NUMBER -> `String "LAST_PHONE_NUMBER"
  | NUMBER_CAPABILITIES_MISMATCH -> `String "NUMBER_CAPABILITIES_MISMATCH"
  | MESSAGE_TYPE_MISMATCH -> `String "MESSAGE_TYPE_MISMATCH"
  | NO_ORIGINATION_IDENTITIES_FOUND -> `String "NO_ORIGINATION_IDENTITIES_FOUND"
  | OPT_OUT_LIST_MISMATCH -> `String "OPT_OUT_LIST_MISMATCH"
  | PHONE_NUMBER_ASSOCIATED_TO_POOL -> `String "PHONE_NUMBER_ASSOCIATED_TO_POOL"
  | PHONE_NUMBER_ASSOCIATED_TO_REGISTRATION -> `String "PHONE_NUMBER_ASSOCIATED_TO_REGISTRATION"
  | PHONE_NUMBER_NOT_ASSOCIATED_TO_POOL -> `String "PHONE_NUMBER_NOT_ASSOCIATED_TO_POOL"
  | PHONE_NUMBER_NOT_IN_REGISTRATION_REGION -> `String "PHONE_NUMBER_NOT_IN_REGISTRATION_REGION"
  | REGISTRATION_ALREADY_SUBMITTED -> `String "REGISTRATION_ALREADY_SUBMITTED"
  | REGISTRATION_NOT_COMPLETE -> `String "REGISTRATION_NOT_COMPLETE"
  | RESOURCE_ALREADY_ASSOCIATED -> `String "RESOURCE_ALREADY_ASSOCIATED"
  | SENDER_ID_ASSOCIATED_TO_POOL -> `String "SENDER_ID_ASSOCIATED_TO_POOL"
  | RCS_AGENT_ASSOCIATED_TO_POOL -> `String "RCS_AGENT_ASSOCIATED_TO_POOL"
  | POOL_ASSOCIATED_TO_NOTIFY_CONFIGURATION -> `String "POOL_ASSOCIATED_TO_NOTIFY_CONFIGURATION"
  | RESOURCE_ALREADY_EXISTS -> `String "RESOURCE_ALREADY_EXISTS"
  | RESOURCE_DELETION_NOT_ALLOWED -> `String "RESOURCE_DELETION_NOT_ALLOWED"
  | RESOURCE_MODIFICATION_NOT_ALLOWED -> `String "RESOURCE_MODIFICATION_NOT_ALLOWED"
  | RESOURCE_NOT_ACTIVE -> `String "RESOURCE_NOT_ACTIVE"
  | RESOURCE_NOT_EMPTY -> `String "RESOURCE_NOT_EMPTY"
  | SELF_MANAGED_OPT_OUTS_MISMATCH -> `String "SELF_MANAGED_OPT_OUTS_MISMATCH"
  | SUBMIT_REGISTRATION_VERSION_NOT_ALLOWED -> `String "SUBMIT_REGISTRATION_VERSION_NOT_ALLOWED"
  | TWO_WAY_CONFIG_MISMATCH -> `String "TWO_WAY_CONFIG_MISMATCH"
  | VERIFICATION_CODE_EXPIRED -> `String "VERIFICATION_CODE_EXPIRED"
  | VERIFICATION_ALREADY_COMPLETE -> `String "VERIFICATION_ALREADY_COMPLETE"
  | PROTECT_CONFIGURATION_IS_ACCOUNT_DEFAULT -> `String "PROTECT_CONFIGURATION_IS_ACCOUNT_DEFAULT"
  | PROTECT_CONFIGURATION_ASSOCIATED_WITH_CONFIGURATION_SET ->
      `String "PROTECT_CONFIGURATION_ASSOCIATED_WITH_CONFIGURATION_SET"
  | PROTECT_CONFIGURATION_NOT_ASSOCIATED_WITH_CONFIGURATION_SET ->
      `String "PROTECT_CONFIGURATION_NOT_ASSOCIATED_WITH_CONFIGURATION_SET"
  | DESTINATION_COUNTRY_BLOCKED_BY_PROTECT_CONFIGURATION ->
      `String "DESTINATION_COUNTRY_BLOCKED_BY_PROTECT_CONFIGURATION"
  | DESTINATION_PHONE_NUMBER_BLOCKED_BY_PROTECT_NUMBER_OVERRIDE ->
      `String "DESTINATION_PHONE_NUMBER_BLOCKED_BY_PROTECT_NUMBER_OVERRIDE"
  | RCS_AGENT_ALREADY_ASSOCIATED_TO_REGISTRATION_TYPE ->
      `String "RCS_AGENT_ALREADY_ASSOCIATED_TO_REGISTRATION_TYPE"
  | NOTIFY_CONFIGURATION_NOT_ACTIVE -> `String "NOTIFY_CONFIGURATION_NOT_ACTIVE"

let conflict_exception_to_yojson (x : conflict_exception) =
  assoc_to_yojson
    [
      ("Message", option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.string__to_yojson x.message);
      ("Reason", option_to_yojson conflict_exception_reason_to_yojson x.reason);
      ("ResourceType", option_to_yojson resource_type_to_yojson x.resource_type);
      ( "ResourceId",
        option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.string__to_yojson x.resource_id );
    ]

let iso_country_code_to_yojson = string_to_yojson

let associate_origination_identity_result_to_yojson (x : associate_origination_identity_result) =
  assoc_to_yojson
    [
      ( "PoolArn",
        option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.string__to_yojson x.pool_arn );
      ("PoolId", option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.string__to_yojson x.pool_id);
      ( "OriginationIdentityArn",
        option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.string__to_yojson
          x.origination_identity_arn );
      ( "OriginationIdentity",
        option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.string__to_yojson
          x.origination_identity );
      ("IsoCountryCode", option_to_yojson iso_country_code_to_yojson x.iso_country_code);
    ]

let client_token_to_yojson = string_to_yojson
let phone_or_sender_id_or_arn_to_yojson = string_to_yojson
let pool_id_or_arn_to_yojson = string_to_yojson

let associate_origination_identity_request_to_yojson (x : associate_origination_identity_request) =
  assoc_to_yojson
    [
      ("PoolId", Some (pool_id_or_arn_to_yojson x.pool_id));
      ("OriginationIdentity", Some (phone_or_sender_id_or_arn_to_yojson x.origination_identity));
      ("IsoCountryCode", option_to_yojson iso_country_code_to_yojson x.iso_country_code);
      ( "ClientToken",
        Some
          (client_token_to_yojson
             (Option.value x.client_token ~default:(Smaws_Lib.Uuid.generate ()))) );
    ]

let protect_configuration_id_to_yojson = string_to_yojson
let protect_configuration_arn_to_yojson = string_to_yojson
let configuration_set_name_to_yojson = string_to_yojson

let associate_protect_configuration_result_to_yojson (x : associate_protect_configuration_result) =
  assoc_to_yojson
    [
      ( "ConfigurationSetArn",
        Some (Smaws_Lib.Smithy_api.Json_serializers.string__to_yojson x.configuration_set_arn) );
      ("ConfigurationSetName", Some (configuration_set_name_to_yojson x.configuration_set_name));
      ( "ProtectConfigurationArn",
        Some (protect_configuration_arn_to_yojson x.protect_configuration_arn) );
      ( "ProtectConfigurationId",
        Some (protect_configuration_id_to_yojson x.protect_configuration_id) );
    ]

let configuration_set_name_or_arn_to_yojson = string_to_yojson
let protect_configuration_id_or_arn_to_yojson = string_to_yojson

let associate_protect_configuration_request_to_yojson (x : associate_protect_configuration_request)
    =
  assoc_to_yojson
    [
      ( "ProtectConfigurationId",
        Some (protect_configuration_id_or_arn_to_yojson x.protect_configuration_id) );
      ( "ConfigurationSetName",
        Some (configuration_set_name_or_arn_to_yojson x.configuration_set_name) );
    ]

let attachment_body_to_yojson = blob_to_yojson

let attachment_status_to_yojson (x : attachment_status) =
  match x with
  | UPLOAD_IN_PROGRESS -> `String "UPLOAD_IN_PROGRESS"
  | UPLOAD_COMPLETE -> `String "UPLOAD_COMPLETE"
  | UPLOAD_FAILED -> `String "UPLOAD_FAILED"
  | DELETED -> `String "DELETED"

let attachment_upload_error_reason_to_yojson (x : attachment_upload_error_reason) =
  match x with INTERNAL_ERROR -> `String "INTERNAL_ERROR"

let attachment_url_to_yojson = string_to_yojson

let phone_number_type_to_yojson (x : phone_number_type) =
  match x with
  | MOBILE -> `String "MOBILE"
  | LANDLINE -> `String "LANDLINE"
  | OTHER -> `String "OTHER"
  | INVALID -> `String "INVALID"

let mnc_type_to_yojson = string_to_yojson
let mcc_type_to_yojson = string_to_yojson
let dialing_country_code_type_to_yojson = string_to_yojson
let e164_phone_number_type_to_yojson = string_to_yojson

let carrier_lookup_result_to_yojson (x : carrier_lookup_result) =
  assoc_to_yojson
    [
      ("E164PhoneNumber", Some (e164_phone_number_type_to_yojson x.e164_phone_number));
      ( "DialingCountryCode",
        option_to_yojson dialing_country_code_type_to_yojson x.dialing_country_code );
      ("IsoCountryCode", option_to_yojson iso_country_code_to_yojson x.iso_country_code);
      ("Country", option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.string__to_yojson x.country);
      ("MCC", option_to_yojson mcc_type_to_yojson x.mc_c);
      ("MNC", option_to_yojson mnc_type_to_yojson x.mn_c);
      ("Carrier", option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.string__to_yojson x.carrier);
      ("PhoneNumberType", Some (phone_number_type_to_yojson x.phone_number_type));
    ]

let carrier_lookup_input_phone_number_type_to_yojson = string_to_yojson

let carrier_lookup_request_to_yojson (x : carrier_lookup_request) =
  assoc_to_yojson
    [ ("PhoneNumber", Some (carrier_lookup_input_phone_number_type_to_yojson x.phone_number)) ]

let carrier_status_to_yojson (x : carrier_status) =
  match x with
  | PENDING -> `String "PENDING"
  | ACTIVE -> `String "ACTIVE"
  | REJECTED -> `String "REJECTED"

let carrier_status_information_to_yojson (x : carrier_status_information) =
  assoc_to_yojson
    [
      ("CarrierName", Some (Smaws_Lib.Smithy_api.Json_serializers.string__to_yojson x.carrier_name));
      ("Status", Some (carrier_status_to_yojson x.status));
    ]

let carrier_status_information_list_to_yojson tree =
  list_to_yojson carrier_status_information_to_yojson tree

let log_group_arn_to_yojson = string_to_yojson
let iam_role_arn_to_yojson = string_to_yojson

let cloud_watch_logs_destination_to_yojson (x : cloud_watch_logs_destination) =
  assoc_to_yojson
    [
      ("IamRoleArn", Some (iam_role_arn_to_yojson x.iam_role_arn));
      ("LogGroupArn", Some (log_group_arn_to_yojson x.log_group_arn));
    ]

let filter_value_to_yojson = string_to_yojson
let filter_value_list_to_yojson tree = list_to_yojson filter_value_to_yojson tree

let configuration_set_filter_name_to_yojson (x : configuration_set_filter_name) =
  match x with
  | EVENT_DESTINATION_NAME -> `String "event-destination-name"
  | MATCHING_EVENT_TYPES -> `String "matching-event-types"
  | DEFAULT_MESSAGE_TYPE -> `String "default-message-type"
  | DEFAULT_SENDER_ID -> `String "default-sender-id"
  | DEFAULT_MESSAGE_FEEDBACK_ENABLED -> `String "default-message-feedback-enabled"
  | PROTECT_CONFIGURATION_ID -> `String "protect-configuration-id"

let configuration_set_filter_to_yojson (x : configuration_set_filter) =
  assoc_to_yojson
    [
      ("Name", Some (configuration_set_filter_name_to_yojson x.name));
      ("Values", Some (filter_value_list_to_yojson x.values));
    ]

let configuration_set_filter_list_to_yojson tree =
  list_to_yojson configuration_set_filter_to_yojson tree

let sender_id_to_yojson = string_to_yojson

let message_type_to_yojson (x : message_type) =
  match x with TRANSACTIONAL -> `String "TRANSACTIONAL" | PROMOTIONAL -> `String "PROMOTIONAL"

let sns_topic_arn_to_yojson = string_to_yojson

let sns_destination_to_yojson (x : sns_destination) =
  assoc_to_yojson [ ("TopicArn", Some (sns_topic_arn_to_yojson x.topic_arn)) ]

let delivery_stream_arn_to_yojson = string_to_yojson

let kinesis_firehose_destination_to_yojson (x : kinesis_firehose_destination) =
  assoc_to_yojson
    [
      ("IamRoleArn", Some (iam_role_arn_to_yojson x.iam_role_arn));
      ("DeliveryStreamArn", Some (delivery_stream_arn_to_yojson x.delivery_stream_arn));
    ]

let event_type_to_yojson (x : event_type) =
  match x with
  | ALL -> `String "ALL"
  | TEXT_ALL -> `String "TEXT_ALL"
  | TEXT_SENT -> `String "TEXT_SENT"
  | TEXT_PENDING -> `String "TEXT_PENDING"
  | TEXT_QUEUED -> `String "TEXT_QUEUED"
  | TEXT_SUCCESSFUL -> `String "TEXT_SUCCESSFUL"
  | TEXT_DELIVERED -> `String "TEXT_DELIVERED"
  | TEXT_INVALID -> `String "TEXT_INVALID"
  | TEXT_INVALID_MESSAGE -> `String "TEXT_INVALID_MESSAGE"
  | TEXT_UNREACHABLE -> `String "TEXT_UNREACHABLE"
  | TEXT_CARRIER_UNREACHABLE -> `String "TEXT_CARRIER_UNREACHABLE"
  | TEXT_BLOCKED -> `String "TEXT_BLOCKED"
  | TEXT_CARRIER_BLOCKED -> `String "TEXT_CARRIER_BLOCKED"
  | TEXT_SPAM -> `String "TEXT_SPAM"
  | TEXT_UNKNOWN -> `String "TEXT_UNKNOWN"
  | TEXT_TTL_EXPIRED -> `String "TEXT_TTL_EXPIRED"
  | TEXT_PROTECT_BLOCKED -> `String "TEXT_PROTECT_BLOCKED"
  | VOICE_ALL -> `String "VOICE_ALL"
  | VOICE_INITIATED -> `String "VOICE_INITIATED"
  | VOICE_RINGING -> `String "VOICE_RINGING"
  | VOICE_ANSWERED -> `String "VOICE_ANSWERED"
  | VOICE_COMPLETED -> `String "VOICE_COMPLETED"
  | VOICE_BUSY -> `String "VOICE_BUSY"
  | VOICE_NO_ANSWER -> `String "VOICE_NO_ANSWER"
  | VOICE_FAILED -> `String "VOICE_FAILED"
  | VOICE_TTL_EXPIRED -> `String "VOICE_TTL_EXPIRED"
  | MEDIA_ALL -> `String "MEDIA_ALL"
  | MEDIA_PENDING -> `String "MEDIA_PENDING"
  | MEDIA_QUEUED -> `String "MEDIA_QUEUED"
  | MEDIA_SUCCESSFUL -> `String "MEDIA_SUCCESSFUL"
  | MEDIA_DELIVERED -> `String "MEDIA_DELIVERED"
  | MEDIA_INVALID -> `String "MEDIA_INVALID"
  | MEDIA_INVALID_MESSAGE -> `String "MEDIA_INVALID_MESSAGE"
  | MEDIA_UNREACHABLE -> `String "MEDIA_UNREACHABLE"
  | MEDIA_CARRIER_UNREACHABLE -> `String "MEDIA_CARRIER_UNREACHABLE"
  | MEDIA_BLOCKED -> `String "MEDIA_BLOCKED"
  | MEDIA_CARRIER_BLOCKED -> `String "MEDIA_CARRIER_BLOCKED"
  | MEDIA_SPAM -> `String "MEDIA_SPAM"
  | MEDIA_UNKNOWN -> `String "MEDIA_UNKNOWN"
  | MEDIA_TTL_EXPIRED -> `String "MEDIA_TTL_EXPIRED"
  | MEDIA_FILE_INACCESSIBLE -> `String "MEDIA_FILE_INACCESSIBLE"
  | MEDIA_FILE_TYPE_UNSUPPORTED -> `String "MEDIA_FILE_TYPE_UNSUPPORTED"
  | MEDIA_FILE_SIZE_EXCEEDED -> `String "MEDIA_FILE_SIZE_EXCEEDED"
  | RCS_ALL -> `String "RCS_ALL"
  | RCS_QUEUED -> `String "RCS_QUEUED"
  | RCS_SENT -> `String "RCS_SENT"
  | RCS_DELIVERED -> `String "RCS_DELIVERED"
  | RCS_READ -> `String "RCS_READ"
  | RCS_FAILED -> `String "RCS_FAILED"
  | RCS_TTL_EXPIRED -> `String "RCS_TTL_EXPIRED"
  | RCS_PROTECT_BLOCKED -> `String "RCS_PROTECT_BLOCKED"
  | RCS_FALLEN_BACK_TO_SMS -> `String "RCS_FALLEN_BACK_TO_SMS"

let event_type_list_to_yojson tree = list_to_yojson event_type_to_yojson tree
let event_destination_name_to_yojson = string_to_yojson

let event_destination_to_yojson (x : event_destination) =
  assoc_to_yojson
    [
      ("EventDestinationName", Some (event_destination_name_to_yojson x.event_destination_name));
      ("Enabled", Some (Smaws_Lib.Smithy_api.Json_serializers.boolean__to_yojson x.enabled));
      ("MatchingEventTypes", Some (event_type_list_to_yojson x.matching_event_types));
      ( "CloudWatchLogsDestination",
        option_to_yojson cloud_watch_logs_destination_to_yojson x.cloud_watch_logs_destination );
      ( "KinesisFirehoseDestination",
        option_to_yojson kinesis_firehose_destination_to_yojson x.kinesis_firehose_destination );
      ("SnsDestination", option_to_yojson sns_destination_to_yojson x.sns_destination);
    ]

let event_destination_list_to_yojson tree = list_to_yojson event_destination_to_yojson tree

let configuration_set_information_to_yojson (x : configuration_set_information) =
  assoc_to_yojson
    [
      ( "ConfigurationSetArn",
        Some (Smaws_Lib.Smithy_api.Json_serializers.string__to_yojson x.configuration_set_arn) );
      ("ConfigurationSetName", Some (configuration_set_name_to_yojson x.configuration_set_name));
      ("EventDestinations", Some (event_destination_list_to_yojson x.event_destinations));
      ("DefaultMessageType", option_to_yojson message_type_to_yojson x.default_message_type);
      ("DefaultSenderId", option_to_yojson sender_id_to_yojson x.default_sender_id);
      ( "DefaultMessageFeedbackEnabled",
        option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.boolean__to_yojson
          x.default_message_feedback_enabled );
      ( "CreatedTimestamp",
        Some
          (Smaws_Lib.Smithy_api.Json_serializers.timestamp_epoch_seconds_to_yojson
             x.created_timestamp) );
      ( "ProtectConfigurationId",
        option_to_yojson protect_configuration_id_or_arn_to_yojson x.protect_configuration_id );
    ]

let configuration_set_information_list_to_yojson tree =
  list_to_yojson configuration_set_information_to_yojson tree

let configuration_set_name_list_to_yojson tree =
  list_to_yojson configuration_set_name_or_arn_to_yojson tree

let context_key_to_yojson = string_to_yojson
let context_value_to_yojson = string_to_yojson
let context_map_to_yojson tree = map_to_yojson context_key_to_yojson context_value_to_yojson tree

let country_launch_status_to_yojson (x : country_launch_status) =
  match x with
  | CREATED -> `String "CREATED"
  | PENDING -> `String "PENDING"
  | PARTIAL -> `String "PARTIAL"
  | ACTIVE -> `String "ACTIVE"
  | REJECTED -> `String "REJECTED"

let country_launch_status_filter_name_to_yojson (x : country_launch_status_filter_name) =
  match x with COUNTRY_LAUNCH_STATUS -> `String "country-launch-status"

let country_launch_status_filter_to_yojson (x : country_launch_status_filter) =
  assoc_to_yojson
    [
      ("Name", Some (country_launch_status_filter_name_to_yojson x.name));
      ("Values", Some (filter_value_list_to_yojson x.values));
    ]

let country_launch_status_filter_list_to_yojson tree =
  list_to_yojson country_launch_status_filter_to_yojson tree

let country_launch_status_information_to_yojson (x : country_launch_status_information) =
  assoc_to_yojson
    [
      ("IsoCountryCode", Some (iso_country_code_to_yojson x.iso_country_code));
      ("Status", Some (country_launch_status_to_yojson x.status));
      ( "RcsPlatformId",
        option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.string__to_yojson x.rcs_platform_id
      );
      ( "RegistrationId",
        Some (Smaws_Lib.Smithy_api.Json_serializers.string__to_yojson x.registration_id) );
      ("CarrierStatus", Some (carrier_status_information_list_to_yojson x.carrier_status));
    ]

let country_launch_status_information_list_to_yojson tree =
  list_to_yojson country_launch_status_information_to_yojson tree

let tag_value_to_yojson = string_to_yojson
let tag_key_to_yojson = string_to_yojson

let tag_to_yojson (x : tag) =
  assoc_to_yojson
    [ ("Key", Some (tag_key_to_yojson x.key)); ("Value", Some (tag_value_to_yojson x.value)) ]

let tag_list_to_yojson tree = list_to_yojson tag_to_yojson tree

let create_configuration_set_result_to_yojson (x : create_configuration_set_result) =
  assoc_to_yojson
    [
      ( "ConfigurationSetArn",
        option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.string__to_yojson
          x.configuration_set_arn );
      ( "ConfigurationSetName",
        option_to_yojson configuration_set_name_to_yojson x.configuration_set_name );
      ("Tags", option_to_yojson tag_list_to_yojson x.tags);
      ( "CreatedTimestamp",
        option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.timestamp_epoch_seconds_to_yojson
          x.created_timestamp );
    ]

let create_configuration_set_request_to_yojson (x : create_configuration_set_request) =
  assoc_to_yojson
    [
      ("ConfigurationSetName", Some (configuration_set_name_to_yojson x.configuration_set_name));
      ("Tags", option_to_yojson tag_list_to_yojson x.tags);
      ( "ClientToken",
        Some
          (client_token_to_yojson
             (Option.value x.client_token ~default:(Smaws_Lib.Uuid.generate ()))) );
    ]

let create_event_destination_result_to_yojson (x : create_event_destination_result) =
  assoc_to_yojson
    [
      ( "ConfigurationSetArn",
        option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.string__to_yojson
          x.configuration_set_arn );
      ( "ConfigurationSetName",
        option_to_yojson configuration_set_name_to_yojson x.configuration_set_name );
      ("EventDestination", option_to_yojson event_destination_to_yojson x.event_destination);
    ]

let create_event_destination_request_to_yojson (x : create_event_destination_request) =
  assoc_to_yojson
    [
      ( "ConfigurationSetName",
        Some (configuration_set_name_or_arn_to_yojson x.configuration_set_name) );
      ("EventDestinationName", Some (event_destination_name_to_yojson x.event_destination_name));
      ("MatchingEventTypes", Some (event_type_list_to_yojson x.matching_event_types));
      ( "CloudWatchLogsDestination",
        option_to_yojson cloud_watch_logs_destination_to_yojson x.cloud_watch_logs_destination );
      ( "KinesisFirehoseDestination",
        option_to_yojson kinesis_firehose_destination_to_yojson x.kinesis_firehose_destination );
      ("SnsDestination", option_to_yojson sns_destination_to_yojson x.sns_destination);
      ( "ClientToken",
        Some
          (client_token_to_yojson
             (Option.value x.client_token ~default:(Smaws_Lib.Uuid.generate ()))) );
    ]

let notify_configuration_status_to_yojson (x : notify_configuration_status) =
  match x with
  | PENDING -> `String "PENDING"
  | ACTIVE -> `String "ACTIVE"
  | REJECTED -> `String "REJECTED"
  | REQUIRES_VERIFICATION -> `String "REQUIRES_VERIFICATION"

let tier_upgrade_status_to_yojson (x : tier_upgrade_status) =
  match x with
  | BASIC -> `String "BASIC"
  | PENDING_UPGRADE -> `String "PENDING_UPGRADE"
  | ADVANCED -> `String "ADVANCED"
  | REJECTED -> `String "REJECTED"

let notify_configuration_tier_to_yojson (x : notify_configuration_tier) =
  match x with BASIC -> `String "BASIC" | ADVANCED -> `String "ADVANCED"

let number_capability_to_yojson (x : number_capability) =
  match x with
  | SMS -> `String "SMS"
  | VOICE -> `String "VOICE"
  | MMS -> `String "MMS"
  | RCS -> `String "RCS"

let notify_enabled_channels_list_to_yojson tree = list_to_yojson number_capability_to_yojson tree
let iso_country_code_list_to_yojson tree = list_to_yojson iso_country_code_to_yojson tree
let notify_template_id_to_yojson = string_to_yojson

let notify_configuration_use_case_to_yojson (x : notify_configuration_use_case) =
  match x with CODE_VERIFICATION -> `String "CODE_VERIFICATION"

let notify_configuration_display_name_to_yojson = string_to_yojson
let notify_configuration_id_to_yojson = string_to_yojson
let notify_configuration_arn_to_yojson = string_to_yojson

let create_notify_configuration_result_to_yojson (x : create_notify_configuration_result) =
  assoc_to_yojson
    [
      ( "NotifyConfigurationArn",
        Some (notify_configuration_arn_to_yojson x.notify_configuration_arn) );
      ("NotifyConfigurationId", Some (notify_configuration_id_to_yojson x.notify_configuration_id));
      ("DisplayName", Some (notify_configuration_display_name_to_yojson x.display_name));
      ("UseCase", Some (notify_configuration_use_case_to_yojson x.use_case));
      ("DefaultTemplateId", option_to_yojson notify_template_id_to_yojson x.default_template_id);
      ("PoolId", option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.string__to_yojson x.pool_id);
      ("EnabledCountries", option_to_yojson iso_country_code_list_to_yojson x.enabled_countries);
      ("EnabledChannels", Some (notify_enabled_channels_list_to_yojson x.enabled_channels));
      ("Tier", Some (notify_configuration_tier_to_yojson x.tier));
      ("TierUpgradeStatus", Some (tier_upgrade_status_to_yojson x.tier_upgrade_status));
      ("Status", Some (notify_configuration_status_to_yojson x.status));
      ( "RejectionReason",
        option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.string__to_yojson x.rejection_reason
      );
      ( "DeletionProtectionEnabled",
        Some
          (Smaws_Lib.Smithy_api.Json_serializers.primitive_boolean_to_yojson
             x.deletion_protection_enabled) );
      ("Tags", option_to_yojson tag_list_to_yojson x.tags);
      ( "CreatedTimestamp",
        Some
          (Smaws_Lib.Smithy_api.Json_serializers.timestamp_epoch_seconds_to_yojson
             x.created_timestamp) );
    ]

let create_notify_configuration_request_to_yojson (x : create_notify_configuration_request) =
  assoc_to_yojson
    [
      ("DisplayName", Some (notify_configuration_display_name_to_yojson x.display_name));
      ("UseCase", Some (notify_configuration_use_case_to_yojson x.use_case));
      ("DefaultTemplateId", option_to_yojson notify_template_id_to_yojson x.default_template_id);
      ("PoolId", option_to_yojson pool_id_or_arn_to_yojson x.pool_id);
      ("EnabledCountries", option_to_yojson iso_country_code_list_to_yojson x.enabled_countries);
      ("EnabledChannels", Some (notify_enabled_channels_list_to_yojson x.enabled_channels));
      ( "DeletionProtectionEnabled",
        option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.boolean__to_yojson
          x.deletion_protection_enabled );
      ( "ClientToken",
        Some
          (client_token_to_yojson
             (Option.value x.client_token ~default:(Smaws_Lib.Uuid.generate ()))) );
      ("Tags", option_to_yojson tag_list_to_yojson x.tags);
    ]

let opt_out_list_name_to_yojson = string_to_yojson

let create_opt_out_list_result_to_yojson (x : create_opt_out_list_result) =
  assoc_to_yojson
    [
      ( "OptOutListArn",
        option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.string__to_yojson x.opt_out_list_arn
      );
      ("OptOutListName", option_to_yojson opt_out_list_name_to_yojson x.opt_out_list_name);
      ("Tags", option_to_yojson tag_list_to_yojson x.tags);
      ( "CreatedTimestamp",
        option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.timestamp_epoch_seconds_to_yojson
          x.created_timestamp );
    ]

let create_opt_out_list_request_to_yojson (x : create_opt_out_list_request) =
  assoc_to_yojson
    [
      ("OptOutListName", Some (opt_out_list_name_to_yojson x.opt_out_list_name));
      ("Tags", option_to_yojson tag_list_to_yojson x.tags);
      ( "ClientToken",
        Some
          (client_token_to_yojson
             (Option.value x.client_token ~default:(Smaws_Lib.Uuid.generate ()))) );
    ]

let two_way_channel_arn_to_yojson = string_to_yojson

let pool_status_to_yojson (x : pool_status) =
  match x with
  | CREATING -> `String "CREATING"
  | ACTIVE -> `String "ACTIVE"
  | DELETING -> `String "DELETING"

let create_pool_result_to_yojson (x : create_pool_result) =
  assoc_to_yojson
    [
      ( "PoolArn",
        option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.string__to_yojson x.pool_arn );
      ("PoolId", option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.string__to_yojson x.pool_id);
      ("Status", option_to_yojson pool_status_to_yojson x.status);
      ("MessageType", option_to_yojson message_type_to_yojson x.message_type);
      ( "TwoWayEnabled",
        option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.primitive_boolean_to_yojson
          x.two_way_enabled );
      ("TwoWayChannelArn", option_to_yojson two_way_channel_arn_to_yojson x.two_way_channel_arn);
      ("TwoWayChannelRole", option_to_yojson iam_role_arn_to_yojson x.two_way_channel_role);
      ( "SelfManagedOptOutsEnabled",
        option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.primitive_boolean_to_yojson
          x.self_managed_opt_outs_enabled );
      ("OptOutListName", option_to_yojson opt_out_list_name_to_yojson x.opt_out_list_name);
      ( "SharedRoutesEnabled",
        option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.primitive_boolean_to_yojson
          x.shared_routes_enabled );
      ( "DeletionProtectionEnabled",
        option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.primitive_boolean_to_yojson
          x.deletion_protection_enabled );
      ("Tags", option_to_yojson tag_list_to_yojson x.tags);
      ( "CreatedTimestamp",
        option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.timestamp_epoch_seconds_to_yojson
          x.created_timestamp );
    ]

let create_pool_request_to_yojson (x : create_pool_request) =
  assoc_to_yojson
    [
      ("OriginationIdentity", Some (phone_or_sender_id_or_arn_to_yojson x.origination_identity));
      ("IsoCountryCode", option_to_yojson iso_country_code_to_yojson x.iso_country_code);
      ("MessageType", Some (message_type_to_yojson x.message_type));
      ( "DeletionProtectionEnabled",
        option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.boolean__to_yojson
          x.deletion_protection_enabled );
      ("Tags", option_to_yojson tag_list_to_yojson x.tags);
      ( "ClientToken",
        Some
          (client_token_to_yojson
             (Option.value x.client_token ~default:(Smaws_Lib.Uuid.generate ()))) );
    ]

let create_protect_configuration_result_to_yojson (x : create_protect_configuration_result) =
  assoc_to_yojson
    [
      ( "ProtectConfigurationArn",
        Some (protect_configuration_arn_to_yojson x.protect_configuration_arn) );
      ( "ProtectConfigurationId",
        Some (protect_configuration_id_to_yojson x.protect_configuration_id) );
      ( "CreatedTimestamp",
        Some
          (Smaws_Lib.Smithy_api.Json_serializers.timestamp_epoch_seconds_to_yojson
             x.created_timestamp) );
      ( "AccountDefault",
        Some (Smaws_Lib.Smithy_api.Json_serializers.primitive_boolean_to_yojson x.account_default)
      );
      ( "DeletionProtectionEnabled",
        Some
          (Smaws_Lib.Smithy_api.Json_serializers.primitive_boolean_to_yojson
             x.deletion_protection_enabled) );
      ("Tags", option_to_yojson tag_list_to_yojson x.tags);
    ]

let create_protect_configuration_request_to_yojson (x : create_protect_configuration_request) =
  assoc_to_yojson
    [
      ( "ClientToken",
        Some
          (client_token_to_yojson
             (Option.value x.client_token ~default:(Smaws_Lib.Uuid.generate ()))) );
      ( "DeletionProtectionEnabled",
        option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.boolean__to_yojson
          x.deletion_protection_enabled );
      ("Tags", option_to_yojson tag_list_to_yojson x.tags);
    ]

let rcs_event_type_to_yojson = string_to_yojson
let rcs_event_type_list_to_yojson tree = list_to_yojson rcs_event_type_to_yojson tree
let two_way_media_s3_key_prefix_to_yojson = string_to_yojson
let two_way_media_s3_bucket_name_to_yojson = string_to_yojson

let rcs_agent_status_to_yojson (x : rcs_agent_status) =
  match x with
  | CREATED -> `String "CREATED"
  | PENDING -> `String "PENDING"
  | TESTING -> `String "TESTING"
  | PARTIAL -> `String "PARTIAL"
  | ACTIVE -> `String "ACTIVE"
  | DELETED -> `String "DELETED"

let create_rcs_agent_result_to_yojson (x : create_rcs_agent_result) =
  assoc_to_yojson
    [
      ("RcsAgentArn", Some (Smaws_Lib.Smithy_api.Json_serializers.string__to_yojson x.rcs_agent_arn));
      ("RcsAgentId", Some (Smaws_Lib.Smithy_api.Json_serializers.string__to_yojson x.rcs_agent_id));
      ("Status", Some (rcs_agent_status_to_yojson x.status));
      ( "DeletionProtectionEnabled",
        Some
          (Smaws_Lib.Smithy_api.Json_serializers.primitive_boolean_to_yojson
             x.deletion_protection_enabled) );
      ("OptOutListName", option_to_yojson opt_out_list_name_to_yojson x.opt_out_list_name);
      ( "CreatedTimestamp",
        Some
          (Smaws_Lib.Smithy_api.Json_serializers.timestamp_epoch_seconds_to_yojson
             x.created_timestamp) );
      ( "SelfManagedOptOutsEnabled",
        Some
          (Smaws_Lib.Smithy_api.Json_serializers.primitive_boolean_to_yojson
             x.self_managed_opt_outs_enabled) );
      ("TwoWayChannelArn", option_to_yojson two_way_channel_arn_to_yojson x.two_way_channel_arn);
      ("TwoWayChannelRole", option_to_yojson iam_role_arn_to_yojson x.two_way_channel_role);
      ( "TwoWayEnabled",
        Some (Smaws_Lib.Smithy_api.Json_serializers.primitive_boolean_to_yojson x.two_way_enabled)
      );
      ( "TwoWayMediaS3BucketName",
        option_to_yojson two_way_media_s3_bucket_name_to_yojson x.two_way_media_s3_bucket_name );
      ( "TwoWayMediaS3KeyPrefix",
        option_to_yojson two_way_media_s3_key_prefix_to_yojson x.two_way_media_s3_key_prefix );
      ("TwoWayMediaS3Role", option_to_yojson iam_role_arn_to_yojson x.two_way_media_s3_role);
      ( "TwoWayRcsEventsEnabled",
        option_to_yojson rcs_event_type_list_to_yojson x.two_way_rcs_events_enabled );
      ("Tags", option_to_yojson tag_list_to_yojson x.tags);
    ]

let opt_out_list_name_or_arn_to_yojson = string_to_yojson

let create_rcs_agent_request_to_yojson (x : create_rcs_agent_request) =
  assoc_to_yojson
    [
      ( "DeletionProtectionEnabled",
        option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.boolean__to_yojson
          x.deletion_protection_enabled );
      ("OptOutListName", option_to_yojson opt_out_list_name_or_arn_to_yojson x.opt_out_list_name);
      ("Tags", option_to_yojson tag_list_to_yojson x.tags);
      ( "ClientToken",
        Some
          (client_token_to_yojson
             (Option.value x.client_token ~default:(Smaws_Lib.Uuid.generate ()))) );
    ]

let string_map_to_yojson tree =
  map_to_yojson Smaws_Lib.Smithy_api.Json_serializers.string__to_yojson
    Smaws_Lib.Smithy_api.Json_serializers.string__to_yojson tree

let registration_version_number_to_yojson = long_to_yojson

let registration_status_to_yojson (x : registration_status) =
  match x with
  | CREATED -> `String "CREATED"
  | SUBMITTED -> `String "SUBMITTED"
  | AWS_REVIEWING -> `String "AWS_REVIEWING"
  | REVIEWING -> `String "REVIEWING"
  | REQUIRES_AUTHENTICATION -> `String "REQUIRES_AUTHENTICATION"
  | PROVISIONING -> `String "PROVISIONING"
  | COMPLETE -> `String "COMPLETE"
  | REQUIRES_UPDATES -> `String "REQUIRES_UPDATES"
  | CLOSED -> `String "CLOSED"
  | DELETED -> `String "DELETED"

let registration_type_to_yojson = string_to_yojson

let create_registration_result_to_yojson (x : create_registration_result) =
  assoc_to_yojson
    [
      ( "RegistrationArn",
        Some (Smaws_Lib.Smithy_api.Json_serializers.string__to_yojson x.registration_arn) );
      ( "RegistrationId",
        Some (Smaws_Lib.Smithy_api.Json_serializers.string__to_yojson x.registration_id) );
      ("RegistrationType", Some (registration_type_to_yojson x.registration_type));
      ("RegistrationStatus", Some (registration_status_to_yojson x.registration_status));
      ("CurrentVersionNumber", Some (registration_version_number_to_yojson x.current_version_number));
      ("AdditionalAttributes", option_to_yojson string_map_to_yojson x.additional_attributes);
      ("Tags", option_to_yojson tag_list_to_yojson x.tags);
      ( "CreatedTimestamp",
        Some
          (Smaws_Lib.Smithy_api.Json_serializers.timestamp_epoch_seconds_to_yojson
             x.created_timestamp) );
    ]

let create_registration_request_to_yojson (x : create_registration_request) =
  assoc_to_yojson
    [
      ("RegistrationType", Some (registration_type_to_yojson x.registration_type));
      ("Tags", option_to_yojson tag_list_to_yojson x.tags);
      ( "ClientToken",
        Some
          (client_token_to_yojson
             (Option.value x.client_token ~default:(Smaws_Lib.Uuid.generate ()))) );
    ]

let phone_number_to_yojson = string_to_yojson

let create_registration_association_result_to_yojson (x : create_registration_association_result) =
  assoc_to_yojson
    [
      ( "RegistrationArn",
        Some (Smaws_Lib.Smithy_api.Json_serializers.string__to_yojson x.registration_arn) );
      ( "RegistrationId",
        Some (Smaws_Lib.Smithy_api.Json_serializers.string__to_yojson x.registration_id) );
      ("RegistrationType", Some (registration_type_to_yojson x.registration_type));
      ("ResourceArn", Some (Smaws_Lib.Smithy_api.Json_serializers.string__to_yojson x.resource_arn));
      ("ResourceId", Some (Smaws_Lib.Smithy_api.Json_serializers.string__to_yojson x.resource_id));
      ( "ResourceType",
        Some (Smaws_Lib.Smithy_api.Json_serializers.string__to_yojson x.resource_type) );
      ("IsoCountryCode", option_to_yojson iso_country_code_to_yojson x.iso_country_code);
      ("PhoneNumber", option_to_yojson phone_number_to_yojson x.phone_number);
    ]

let resource_id_or_arn_to_yojson = string_to_yojson
let registration_id_or_arn_to_yojson = string_to_yojson

let create_registration_association_request_to_yojson (x : create_registration_association_request)
    =
  assoc_to_yojson
    [
      ("RegistrationId", Some (registration_id_or_arn_to_yojson x.registration_id));
      ("ResourceId", Some (resource_id_or_arn_to_yojson x.resource_id));
    ]

let create_registration_attachment_result_to_yojson (x : create_registration_attachment_result) =
  assoc_to_yojson
    [
      ( "RegistrationAttachmentArn",
        Some (Smaws_Lib.Smithy_api.Json_serializers.string__to_yojson x.registration_attachment_arn)
      );
      ( "RegistrationAttachmentId",
        Some (Smaws_Lib.Smithy_api.Json_serializers.string__to_yojson x.registration_attachment_id)
      );
      ("AttachmentStatus", Some (attachment_status_to_yojson x.attachment_status));
      ("Tags", option_to_yojson tag_list_to_yojson x.tags);
      ( "CreatedTimestamp",
        Some
          (Smaws_Lib.Smithy_api.Json_serializers.timestamp_epoch_seconds_to_yojson
             x.created_timestamp) );
    ]

let create_registration_attachment_request_to_yojson (x : create_registration_attachment_request) =
  assoc_to_yojson
    [
      ("AttachmentBody", option_to_yojson attachment_body_to_yojson x.attachment_body);
      ("AttachmentUrl", option_to_yojson attachment_url_to_yojson x.attachment_url);
      ("Tags", option_to_yojson tag_list_to_yojson x.tags);
      ( "ClientToken",
        Some
          (client_token_to_yojson
             (Option.value x.client_token ~default:(Smaws_Lib.Uuid.generate ()))) );
    ]

let registration_version_status_history_to_yojson (x : registration_version_status_history) =
  assoc_to_yojson
    [
      ( "DraftTimestamp",
        Some
          (Smaws_Lib.Smithy_api.Json_serializers.timestamp_epoch_seconds_to_yojson x.draft_timestamp)
      );
      ( "SubmittedTimestamp",
        option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.timestamp_epoch_seconds_to_yojson
          x.submitted_timestamp );
      ( "AwsReviewingTimestamp",
        option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.timestamp_epoch_seconds_to_yojson
          x.aws_reviewing_timestamp );
      ( "ReviewingTimestamp",
        option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.timestamp_epoch_seconds_to_yojson
          x.reviewing_timestamp );
      ( "RequiresAuthenticationTimestamp",
        option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.timestamp_epoch_seconds_to_yojson
          x.requires_authentication_timestamp );
      ( "ApprovedTimestamp",
        option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.timestamp_epoch_seconds_to_yojson
          x.approved_timestamp );
      ( "DiscardedTimestamp",
        option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.timestamp_epoch_seconds_to_yojson
          x.discarded_timestamp );
      ( "DeniedTimestamp",
        option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.timestamp_epoch_seconds_to_yojson
          x.denied_timestamp );
      ( "RevokedTimestamp",
        option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.timestamp_epoch_seconds_to_yojson
          x.revoked_timestamp );
      ( "ArchivedTimestamp",
        option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.timestamp_epoch_seconds_to_yojson
          x.archived_timestamp );
    ]

let registration_version_status_to_yojson (x : registration_version_status) =
  match x with
  | DRAFT -> `String "DRAFT"
  | SUBMITTED -> `String "SUBMITTED"
  | AWS_REVIEWING -> `String "AWS_REVIEWING"
  | REVIEWING -> `String "REVIEWING"
  | REQUIRES_AUTHENTICATION -> `String "REQUIRES_AUTHENTICATION"
  | APPROVED -> `String "APPROVED"
  | DISCARDED -> `String "DISCARDED"
  | DENIED -> `String "DENIED"
  | REVOKED -> `String "REVOKED"
  | ARCHIVED -> `String "ARCHIVED"
  | REQUIRES_OFFLINE_REVIEW -> `String "REQUIRES_OFFLINE_REVIEW"

let create_registration_version_result_to_yojson (x : create_registration_version_result) =
  assoc_to_yojson
    [
      ( "RegistrationArn",
        Some (Smaws_Lib.Smithy_api.Json_serializers.string__to_yojson x.registration_arn) );
      ( "RegistrationId",
        Some (Smaws_Lib.Smithy_api.Json_serializers.string__to_yojson x.registration_id) );
      ("VersionNumber", Some (registration_version_number_to_yojson x.version_number));
      ( "RegistrationVersionStatus",
        Some (registration_version_status_to_yojson x.registration_version_status) );
      ( "RegistrationVersionStatusHistory",
        Some (registration_version_status_history_to_yojson x.registration_version_status_history)
      );
    ]

let create_registration_version_request_to_yojson (x : create_registration_version_request) =
  assoc_to_yojson [ ("RegistrationId", Some (registration_id_or_arn_to_yojson x.registration_id)) ]

let verification_status_to_yojson (x : verification_status) =
  match x with
  | PENDING -> `String "PENDING"
  | VERIFIED -> `String "VERIFIED"
  | UNSUPPORTED -> `String "UNSUPPORTED"

let create_verified_destination_number_result_to_yojson
    (x : create_verified_destination_number_result) =
  assoc_to_yojson
    [
      ( "VerifiedDestinationNumberArn",
        Some
          (Smaws_Lib.Smithy_api.Json_serializers.string__to_yojson x.verified_destination_number_arn)
      );
      ( "VerifiedDestinationNumberId",
        Some
          (Smaws_Lib.Smithy_api.Json_serializers.string__to_yojson x.verified_destination_number_id)
      );
      ("DestinationPhoneNumber", Some (phone_number_to_yojson x.destination_phone_number));
      ("Status", Some (verification_status_to_yojson x.status));
      ( "RcsAgentId",
        option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.string__to_yojson x.rcs_agent_id );
      ("Tags", option_to_yojson tag_list_to_yojson x.tags);
      ( "CreatedTimestamp",
        Some
          (Smaws_Lib.Smithy_api.Json_serializers.timestamp_epoch_seconds_to_yojson
             x.created_timestamp) );
    ]

let rcs_agent_id_or_arn_to_yojson = string_to_yojson

let create_verified_destination_number_request_to_yojson
    (x : create_verified_destination_number_request) =
  assoc_to_yojson
    [
      ("DestinationPhoneNumber", Some (phone_number_to_yojson x.destination_phone_number));
      ("RcsAgentId", option_to_yojson rcs_agent_id_or_arn_to_yojson x.rcs_agent_id);
      ("Tags", option_to_yojson tag_list_to_yojson x.tags);
      ( "ClientToken",
        Some
          (client_token_to_yojson
             (Option.value x.client_token ~default:(Smaws_Lib.Uuid.generate ()))) );
    ]

let delete_account_default_protect_configuration_result_to_yojson
    (x : delete_account_default_protect_configuration_result) =
  assoc_to_yojson
    [
      ( "DefaultProtectConfigurationArn",
        Some (protect_configuration_arn_to_yojson x.default_protect_configuration_arn) );
      ( "DefaultProtectConfigurationId",
        Some (protect_configuration_id_to_yojson x.default_protect_configuration_id) );
    ]

let delete_account_default_protect_configuration_request_to_yojson = unit_to_yojson

let delete_configuration_set_result_to_yojson (x : delete_configuration_set_result) =
  assoc_to_yojson
    [
      ( "ConfigurationSetArn",
        option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.string__to_yojson
          x.configuration_set_arn );
      ( "ConfigurationSetName",
        option_to_yojson configuration_set_name_to_yojson x.configuration_set_name );
      ("EventDestinations", option_to_yojson event_destination_list_to_yojson x.event_destinations);
      ("DefaultMessageType", option_to_yojson message_type_to_yojson x.default_message_type);
      ("DefaultSenderId", option_to_yojson sender_id_to_yojson x.default_sender_id);
      ( "DefaultMessageFeedbackEnabled",
        option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.boolean__to_yojson
          x.default_message_feedback_enabled );
      ( "CreatedTimestamp",
        option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.timestamp_epoch_seconds_to_yojson
          x.created_timestamp );
    ]

let delete_configuration_set_request_to_yojson (x : delete_configuration_set_request) =
  assoc_to_yojson
    [
      ( "ConfigurationSetName",
        Some (configuration_set_name_or_arn_to_yojson x.configuration_set_name) );
    ]

let delete_default_message_type_result_to_yojson (x : delete_default_message_type_result) =
  assoc_to_yojson
    [
      ( "ConfigurationSetArn",
        option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.string__to_yojson
          x.configuration_set_arn );
      ( "ConfigurationSetName",
        option_to_yojson configuration_set_name_to_yojson x.configuration_set_name );
      ("MessageType", option_to_yojson message_type_to_yojson x.message_type);
    ]

let delete_default_message_type_request_to_yojson (x : delete_default_message_type_request) =
  assoc_to_yojson
    [
      ( "ConfigurationSetName",
        Some (configuration_set_name_or_arn_to_yojson x.configuration_set_name) );
    ]

let delete_default_sender_id_result_to_yojson (x : delete_default_sender_id_result) =
  assoc_to_yojson
    [
      ( "ConfigurationSetArn",
        option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.string__to_yojson
          x.configuration_set_arn );
      ( "ConfigurationSetName",
        option_to_yojson configuration_set_name_to_yojson x.configuration_set_name );
      ("SenderId", option_to_yojson sender_id_to_yojson x.sender_id);
    ]

let delete_default_sender_id_request_to_yojson (x : delete_default_sender_id_request) =
  assoc_to_yojson
    [
      ( "ConfigurationSetName",
        Some (configuration_set_name_or_arn_to_yojson x.configuration_set_name) );
    ]

let delete_event_destination_result_to_yojson (x : delete_event_destination_result) =
  assoc_to_yojson
    [
      ( "ConfigurationSetArn",
        option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.string__to_yojson
          x.configuration_set_arn );
      ( "ConfigurationSetName",
        option_to_yojson configuration_set_name_to_yojson x.configuration_set_name );
      ("EventDestination", option_to_yojson event_destination_to_yojson x.event_destination);
    ]

let delete_event_destination_request_to_yojson (x : delete_event_destination_request) =
  assoc_to_yojson
    [
      ( "ConfigurationSetName",
        Some (configuration_set_name_or_arn_to_yojson x.configuration_set_name) );
      ("EventDestinationName", Some (event_destination_name_to_yojson x.event_destination_name));
    ]

let keyword_action_to_yojson (x : keyword_action) =
  match x with
  | AUTOMATIC_RESPONSE -> `String "AUTOMATIC_RESPONSE"
  | OPT_OUT -> `String "OPT_OUT"
  | OPT_IN -> `String "OPT_IN"

let keyword_message_to_yojson = string_to_yojson
let keyword_to_yojson = string_to_yojson

let delete_keyword_result_to_yojson (x : delete_keyword_result) =
  assoc_to_yojson
    [
      ( "OriginationIdentityArn",
        option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.string__to_yojson
          x.origination_identity_arn );
      ( "OriginationIdentity",
        option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.string__to_yojson
          x.origination_identity );
      ("Keyword", option_to_yojson keyword_to_yojson x.keyword);
      ("KeywordMessage", option_to_yojson keyword_message_to_yojson x.keyword_message);
      ("KeywordAction", option_to_yojson keyword_action_to_yojson x.keyword_action);
    ]

let phone_or_pool_id_or_arn_to_yojson = string_to_yojson

let delete_keyword_request_to_yojson (x : delete_keyword_request) =
  assoc_to_yojson
    [
      ("OriginationIdentity", Some (phone_or_pool_id_or_arn_to_yojson x.origination_identity));
      ("Keyword", Some (keyword_to_yojson x.keyword));
    ]

let monthly_limit_to_yojson = long_to_yojson

let delete_media_message_spend_limit_override_result_to_yojson
    (x : delete_media_message_spend_limit_override_result) =
  assoc_to_yojson [ ("MonthlyLimit", option_to_yojson monthly_limit_to_yojson x.monthly_limit) ]

let delete_media_message_spend_limit_override_request_to_yojson = unit_to_yojson

let delete_notify_configuration_result_to_yojson (x : delete_notify_configuration_result) =
  assoc_to_yojson
    [
      ( "NotifyConfigurationArn",
        Some (notify_configuration_arn_to_yojson x.notify_configuration_arn) );
      ("NotifyConfigurationId", Some (notify_configuration_id_to_yojson x.notify_configuration_id));
      ("DisplayName", Some (notify_configuration_display_name_to_yojson x.display_name));
      ("UseCase", Some (notify_configuration_use_case_to_yojson x.use_case));
      ("DefaultTemplateId", option_to_yojson notify_template_id_to_yojson x.default_template_id);
      ("PoolId", option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.string__to_yojson x.pool_id);
      ("EnabledCountries", option_to_yojson iso_country_code_list_to_yojson x.enabled_countries);
      ("EnabledChannels", Some (notify_enabled_channels_list_to_yojson x.enabled_channels));
      ("Tier", Some (notify_configuration_tier_to_yojson x.tier));
      ("TierUpgradeStatus", Some (tier_upgrade_status_to_yojson x.tier_upgrade_status));
      ("Status", Some (notify_configuration_status_to_yojson x.status));
      ( "RejectionReason",
        option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.string__to_yojson x.rejection_reason
      );
      ( "DeletionProtectionEnabled",
        Some
          (Smaws_Lib.Smithy_api.Json_serializers.primitive_boolean_to_yojson
             x.deletion_protection_enabled) );
      ( "CreatedTimestamp",
        Some
          (Smaws_Lib.Smithy_api.Json_serializers.timestamp_epoch_seconds_to_yojson
             x.created_timestamp) );
    ]

let notify_configuration_id_or_arn_to_yojson = string_to_yojson

let delete_notify_configuration_request_to_yojson (x : delete_notify_configuration_request) =
  assoc_to_yojson
    [
      ( "NotifyConfigurationId",
        Some (notify_configuration_id_or_arn_to_yojson x.notify_configuration_id) );
    ]

let delete_notify_message_spend_limit_override_result_to_yojson
    (x : delete_notify_message_spend_limit_override_result) =
  assoc_to_yojson [ ("MonthlyLimit", option_to_yojson monthly_limit_to_yojson x.monthly_limit) ]

let delete_notify_message_spend_limit_override_request_to_yojson = unit_to_yojson

let delete_opt_out_list_result_to_yojson (x : delete_opt_out_list_result) =
  assoc_to_yojson
    [
      ( "OptOutListArn",
        option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.string__to_yojson x.opt_out_list_arn
      );
      ("OptOutListName", option_to_yojson opt_out_list_name_to_yojson x.opt_out_list_name);
      ( "CreatedTimestamp",
        option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.timestamp_epoch_seconds_to_yojson
          x.created_timestamp );
    ]

let delete_opt_out_list_request_to_yojson (x : delete_opt_out_list_request) =
  assoc_to_yojson
    [ ("OptOutListName", Some (opt_out_list_name_or_arn_to_yojson x.opt_out_list_name)) ]

let delete_opted_out_number_result_to_yojson (x : delete_opted_out_number_result) =
  assoc_to_yojson
    [
      ( "OptOutListArn",
        option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.string__to_yojson x.opt_out_list_arn
      );
      ("OptOutListName", option_to_yojson opt_out_list_name_to_yojson x.opt_out_list_name);
      ("OptedOutNumber", option_to_yojson phone_number_to_yojson x.opted_out_number);
      ( "OptedOutTimestamp",
        option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.timestamp_epoch_seconds_to_yojson
          x.opted_out_timestamp );
      ( "EndUserOptedOut",
        option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.primitive_boolean_to_yojson
          x.end_user_opted_out );
    ]

let delete_opted_out_number_request_to_yojson (x : delete_opted_out_number_request) =
  assoc_to_yojson
    [
      ("OptOutListName", Some (opt_out_list_name_or_arn_to_yojson x.opt_out_list_name));
      ("OptedOutNumber", Some (phone_number_to_yojson x.opted_out_number));
    ]

let delete_pool_result_to_yojson (x : delete_pool_result) =
  assoc_to_yojson
    [
      ( "PoolArn",
        option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.string__to_yojson x.pool_arn );
      ("PoolId", option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.string__to_yojson x.pool_id);
      ("Status", option_to_yojson pool_status_to_yojson x.status);
      ("MessageType", option_to_yojson message_type_to_yojson x.message_type);
      ( "TwoWayEnabled",
        option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.primitive_boolean_to_yojson
          x.two_way_enabled );
      ("TwoWayChannelArn", option_to_yojson two_way_channel_arn_to_yojson x.two_way_channel_arn);
      ("TwoWayChannelRole", option_to_yojson iam_role_arn_to_yojson x.two_way_channel_role);
      ( "SelfManagedOptOutsEnabled",
        option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.primitive_boolean_to_yojson
          x.self_managed_opt_outs_enabled );
      ("OptOutListName", option_to_yojson opt_out_list_name_to_yojson x.opt_out_list_name);
      ( "SharedRoutesEnabled",
        option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.primitive_boolean_to_yojson
          x.shared_routes_enabled );
      ( "CreatedTimestamp",
        option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.timestamp_epoch_seconds_to_yojson
          x.created_timestamp );
    ]

let delete_pool_request_to_yojson (x : delete_pool_request) =
  assoc_to_yojson [ ("PoolId", Some (pool_id_or_arn_to_yojson x.pool_id)) ]

let delete_protect_configuration_result_to_yojson (x : delete_protect_configuration_result) =
  assoc_to_yojson
    [
      ( "ProtectConfigurationArn",
        Some (protect_configuration_arn_to_yojson x.protect_configuration_arn) );
      ( "ProtectConfigurationId",
        Some (protect_configuration_id_to_yojson x.protect_configuration_id) );
      ( "CreatedTimestamp",
        Some
          (Smaws_Lib.Smithy_api.Json_serializers.timestamp_epoch_seconds_to_yojson
             x.created_timestamp) );
      ( "AccountDefault",
        Some (Smaws_Lib.Smithy_api.Json_serializers.primitive_boolean_to_yojson x.account_default)
      );
      ( "DeletionProtectionEnabled",
        Some
          (Smaws_Lib.Smithy_api.Json_serializers.primitive_boolean_to_yojson
             x.deletion_protection_enabled) );
    ]

let delete_protect_configuration_request_to_yojson (x : delete_protect_configuration_request) =
  assoc_to_yojson
    [
      ( "ProtectConfigurationId",
        Some (protect_configuration_id_or_arn_to_yojson x.protect_configuration_id) );
    ]

let protect_configuration_rule_override_action_to_yojson
    (x : protect_configuration_rule_override_action) =
  match x with ALLOW -> `String "ALLOW" | BLOCK -> `String "BLOCK"

let delete_protect_configuration_rule_set_number_override_result_to_yojson
    (x : delete_protect_configuration_rule_set_number_override_result) =
  assoc_to_yojson
    [
      ( "ProtectConfigurationArn",
        Some (protect_configuration_arn_to_yojson x.protect_configuration_arn) );
      ( "ProtectConfigurationId",
        Some (protect_configuration_id_to_yojson x.protect_configuration_id) );
      ("DestinationPhoneNumber", Some (phone_number_to_yojson x.destination_phone_number));
      ( "CreatedTimestamp",
        Some
          (Smaws_Lib.Smithy_api.Json_serializers.timestamp_epoch_seconds_to_yojson
             x.created_timestamp) );
      ("Action", Some (protect_configuration_rule_override_action_to_yojson x.action));
      ("IsoCountryCode", option_to_yojson iso_country_code_to_yojson x.iso_country_code);
      ( "ExpirationTimestamp",
        option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.timestamp_epoch_seconds_to_yojson
          x.expiration_timestamp );
    ]

let delete_protect_configuration_rule_set_number_override_request_to_yojson
    (x : delete_protect_configuration_rule_set_number_override_request) =
  assoc_to_yojson
    [
      ( "ProtectConfigurationId",
        Some (protect_configuration_id_or_arn_to_yojson x.protect_configuration_id) );
      ("DestinationPhoneNumber", Some (phone_number_to_yojson x.destination_phone_number));
    ]

let delete_rcs_agent_result_to_yojson (x : delete_rcs_agent_result) =
  assoc_to_yojson
    [
      ("RcsAgentArn", Some (Smaws_Lib.Smithy_api.Json_serializers.string__to_yojson x.rcs_agent_arn));
      ("RcsAgentId", Some (Smaws_Lib.Smithy_api.Json_serializers.string__to_yojson x.rcs_agent_id));
      ("Status", Some (rcs_agent_status_to_yojson x.status));
      ( "CreatedTimestamp",
        Some
          (Smaws_Lib.Smithy_api.Json_serializers.timestamp_epoch_seconds_to_yojson
             x.created_timestamp) );
      ( "DeletionProtectionEnabled",
        Some
          (Smaws_Lib.Smithy_api.Json_serializers.primitive_boolean_to_yojson
             x.deletion_protection_enabled) );
      ("OptOutListName", option_to_yojson opt_out_list_name_to_yojson x.opt_out_list_name);
      ( "SelfManagedOptOutsEnabled",
        Some
          (Smaws_Lib.Smithy_api.Json_serializers.primitive_boolean_to_yojson
             x.self_managed_opt_outs_enabled) );
      ("TwoWayChannelArn", option_to_yojson two_way_channel_arn_to_yojson x.two_way_channel_arn);
      ("TwoWayChannelRole", option_to_yojson iam_role_arn_to_yojson x.two_way_channel_role);
      ( "TwoWayEnabled",
        Some (Smaws_Lib.Smithy_api.Json_serializers.primitive_boolean_to_yojson x.two_way_enabled)
      );
      ( "TwoWayRcsEventsEnabled",
        option_to_yojson rcs_event_type_list_to_yojson x.two_way_rcs_events_enabled );
    ]

let delete_rcs_agent_request_to_yojson (x : delete_rcs_agent_request) =
  assoc_to_yojson [ ("RcsAgentId", Some (rcs_agent_id_or_arn_to_yojson x.rcs_agent_id)) ]

let delete_rcs_message_spend_limit_override_result_to_yojson
    (x : delete_rcs_message_spend_limit_override_result) =
  assoc_to_yojson [ ("MonthlyLimit", option_to_yojson monthly_limit_to_yojson x.monthly_limit) ]

let delete_rcs_message_spend_limit_override_request_to_yojson = unit_to_yojson

let delete_registration_result_to_yojson (x : delete_registration_result) =
  assoc_to_yojson
    [
      ( "RegistrationArn",
        Some (Smaws_Lib.Smithy_api.Json_serializers.string__to_yojson x.registration_arn) );
      ( "RegistrationId",
        Some (Smaws_Lib.Smithy_api.Json_serializers.string__to_yojson x.registration_id) );
      ("RegistrationType", Some (registration_type_to_yojson x.registration_type));
      ("RegistrationStatus", Some (registration_status_to_yojson x.registration_status));
      ("CurrentVersionNumber", Some (registration_version_number_to_yojson x.current_version_number));
      ( "ApprovedVersionNumber",
        option_to_yojson registration_version_number_to_yojson x.approved_version_number );
      ( "LatestDeniedVersionNumber",
        option_to_yojson registration_version_number_to_yojson x.latest_denied_version_number );
      ("AdditionalAttributes", option_to_yojson string_map_to_yojson x.additional_attributes);
      ( "CreatedTimestamp",
        Some
          (Smaws_Lib.Smithy_api.Json_serializers.timestamp_epoch_seconds_to_yojson
             x.created_timestamp) );
    ]

let delete_registration_request_to_yojson (x : delete_registration_request) =
  assoc_to_yojson [ ("RegistrationId", Some (registration_id_or_arn_to_yojson x.registration_id)) ]

let delete_registration_attachment_result_to_yojson (x : delete_registration_attachment_result) =
  assoc_to_yojson
    [
      ( "RegistrationAttachmentArn",
        Some (Smaws_Lib.Smithy_api.Json_serializers.string__to_yojson x.registration_attachment_arn)
      );
      ( "RegistrationAttachmentId",
        Some (Smaws_Lib.Smithy_api.Json_serializers.string__to_yojson x.registration_attachment_id)
      );
      ("AttachmentStatus", Some (attachment_status_to_yojson x.attachment_status));
      ( "AttachmentUploadErrorReason",
        option_to_yojson attachment_upload_error_reason_to_yojson x.attachment_upload_error_reason
      );
      ( "CreatedTimestamp",
        Some
          (Smaws_Lib.Smithy_api.Json_serializers.timestamp_epoch_seconds_to_yojson
             x.created_timestamp) );
    ]

let registration_attachment_id_or_arn_to_yojson = string_to_yojson

let delete_registration_attachment_request_to_yojson (x : delete_registration_attachment_request) =
  assoc_to_yojson
    [
      ( "RegistrationAttachmentId",
        Some (registration_attachment_id_or_arn_to_yojson x.registration_attachment_id) );
    ]

let text_value_to_yojson = string_to_yojson
let select_choice_to_yojson = string_to_yojson
let select_choice_list_to_yojson tree = list_to_yojson select_choice_to_yojson tree
let field_path_to_yojson = string_to_yojson

let delete_registration_field_value_result_to_yojson (x : delete_registration_field_value_result) =
  assoc_to_yojson
    [
      ( "RegistrationArn",
        Some (Smaws_Lib.Smithy_api.Json_serializers.string__to_yojson x.registration_arn) );
      ( "RegistrationId",
        Some (Smaws_Lib.Smithy_api.Json_serializers.string__to_yojson x.registration_id) );
      ("VersionNumber", Some (registration_version_number_to_yojson x.version_number));
      ("FieldPath", Some (field_path_to_yojson x.field_path));
      ("SelectChoices", option_to_yojson select_choice_list_to_yojson x.select_choices);
      ("TextValue", option_to_yojson text_value_to_yojson x.text_value);
      ( "RegistrationAttachmentId",
        option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.string__to_yojson
          x.registration_attachment_id );
    ]

let delete_registration_field_value_request_to_yojson (x : delete_registration_field_value_request)
    =
  assoc_to_yojson
    [
      ("RegistrationId", Some (registration_id_or_arn_to_yojson x.registration_id));
      ("FieldPath", Some (field_path_to_yojson x.field_path));
    ]

let resource_policy_to_yojson = string_to_yojson

let delete_resource_policy_result_to_yojson (x : delete_resource_policy_result) =
  assoc_to_yojson
    [
      ("ResourceArn", option_to_yojson amazon_resource_name_to_yojson x.resource_arn);
      ("Policy", option_to_yojson resource_policy_to_yojson x.policy);
      ( "CreatedTimestamp",
        option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.timestamp_epoch_seconds_to_yojson
          x.created_timestamp );
    ]

let delete_resource_policy_request_to_yojson (x : delete_resource_policy_request) =
  assoc_to_yojson [ ("ResourceArn", Some (amazon_resource_name_to_yojson x.resource_arn)) ]

let delete_text_message_spend_limit_override_result_to_yojson
    (x : delete_text_message_spend_limit_override_result) =
  assoc_to_yojson [ ("MonthlyLimit", option_to_yojson monthly_limit_to_yojson x.monthly_limit) ]

let delete_text_message_spend_limit_override_request_to_yojson = unit_to_yojson

let delete_verified_destination_number_result_to_yojson
    (x : delete_verified_destination_number_result) =
  assoc_to_yojson
    [
      ( "VerifiedDestinationNumberArn",
        Some
          (Smaws_Lib.Smithy_api.Json_serializers.string__to_yojson x.verified_destination_number_arn)
      );
      ( "VerifiedDestinationNumberId",
        Some
          (Smaws_Lib.Smithy_api.Json_serializers.string__to_yojson x.verified_destination_number_id)
      );
      ("DestinationPhoneNumber", Some (phone_number_to_yojson x.destination_phone_number));
      ( "CreatedTimestamp",
        Some
          (Smaws_Lib.Smithy_api.Json_serializers.timestamp_epoch_seconds_to_yojson
             x.created_timestamp) );
    ]

let verified_destination_number_id_or_arn_to_yojson = string_to_yojson

let delete_verified_destination_number_request_to_yojson
    (x : delete_verified_destination_number_request) =
  assoc_to_yojson
    [
      ( "VerifiedDestinationNumberId",
        Some (verified_destination_number_id_or_arn_to_yojson x.verified_destination_number_id) );
    ]

let delete_voice_message_spend_limit_override_result_to_yojson
    (x : delete_voice_message_spend_limit_override_result) =
  assoc_to_yojson [ ("MonthlyLimit", option_to_yojson monthly_limit_to_yojson x.monthly_limit) ]

let delete_voice_message_spend_limit_override_request_to_yojson = unit_to_yojson
let next_token_to_yojson = string_to_yojson

let describe_account_attributes_result_to_yojson (x : describe_account_attributes_result) =
  assoc_to_yojson
    [
      ("AccountAttributes", option_to_yojson account_attribute_list_to_yojson x.account_attributes);
      ("NextToken", option_to_yojson next_token_to_yojson x.next_token);
    ]

let max_results_to_yojson = int_to_yojson

let describe_account_attributes_request_to_yojson (x : describe_account_attributes_request) =
  assoc_to_yojson
    [
      ("NextToken", option_to_yojson next_token_to_yojson x.next_token);
      ("MaxResults", option_to_yojson max_results_to_yojson x.max_results);
    ]

let describe_account_limits_result_to_yojson (x : describe_account_limits_result) =
  assoc_to_yojson
    [
      ("AccountLimits", option_to_yojson account_limit_list_to_yojson x.account_limits);
      ("NextToken", option_to_yojson next_token_to_yojson x.next_token);
    ]

let describe_account_limits_request_to_yojson (x : describe_account_limits_request) =
  assoc_to_yojson
    [
      ("NextToken", option_to_yojson next_token_to_yojson x.next_token);
      ("MaxResults", option_to_yojson max_results_to_yojson x.max_results);
    ]

let describe_configuration_sets_result_to_yojson (x : describe_configuration_sets_result) =
  assoc_to_yojson
    [
      ( "ConfigurationSets",
        option_to_yojson configuration_set_information_list_to_yojson x.configuration_sets );
      ("NextToken", option_to_yojson next_token_to_yojson x.next_token);
    ]

let describe_configuration_sets_request_to_yojson (x : describe_configuration_sets_request) =
  assoc_to_yojson
    [
      ( "ConfigurationSetNames",
        option_to_yojson configuration_set_name_list_to_yojson x.configuration_set_names );
      ("Filters", option_to_yojson configuration_set_filter_list_to_yojson x.filters);
      ("NextToken", option_to_yojson next_token_to_yojson x.next_token);
      ("MaxResults", option_to_yojson max_results_to_yojson x.max_results);
    ]

let keyword_information_to_yojson (x : keyword_information) =
  assoc_to_yojson
    [
      ("Keyword", Some (keyword_to_yojson x.keyword));
      ("KeywordMessage", Some (keyword_message_to_yojson x.keyword_message));
      ("KeywordAction", Some (keyword_action_to_yojson x.keyword_action));
    ]

let keyword_information_list_to_yojson tree = list_to_yojson keyword_information_to_yojson tree

let describe_keywords_result_to_yojson (x : describe_keywords_result) =
  assoc_to_yojson
    [
      ( "OriginationIdentityArn",
        option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.string__to_yojson
          x.origination_identity_arn );
      ( "OriginationIdentity",
        option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.string__to_yojson
          x.origination_identity );
      ("Keywords", option_to_yojson keyword_information_list_to_yojson x.keywords);
      ("NextToken", option_to_yojson next_token_to_yojson x.next_token);
    ]

let keyword_filter_name_to_yojson (x : keyword_filter_name) =
  match x with KEYWORD_ACTION -> `String "keyword-action"

let keyword_filter_to_yojson (x : keyword_filter) =
  assoc_to_yojson
    [
      ("Name", Some (keyword_filter_name_to_yojson x.name));
      ("Values", Some (filter_value_list_to_yojson x.values));
    ]

let keyword_filter_list_to_yojson tree = list_to_yojson keyword_filter_to_yojson tree
let keyword_list_to_yojson tree = list_to_yojson keyword_to_yojson tree

let describe_keywords_request_to_yojson (x : describe_keywords_request) =
  assoc_to_yojson
    [
      ("OriginationIdentity", Some (phone_or_pool_id_or_arn_to_yojson x.origination_identity));
      ("Keywords", option_to_yojson keyword_list_to_yojson x.keywords);
      ("Filters", option_to_yojson keyword_filter_list_to_yojson x.filters);
      ("NextToken", option_to_yojson next_token_to_yojson x.next_token);
      ("MaxResults", option_to_yojson max_results_to_yojson x.max_results);
    ]

let notify_configuration_information_to_yojson (x : notify_configuration_information) =
  assoc_to_yojson
    [
      ( "NotifyConfigurationArn",
        Some (notify_configuration_arn_to_yojson x.notify_configuration_arn) );
      ("NotifyConfigurationId", Some (notify_configuration_id_to_yojson x.notify_configuration_id));
      ("DisplayName", Some (notify_configuration_display_name_to_yojson x.display_name));
      ("UseCase", Some (notify_configuration_use_case_to_yojson x.use_case));
      ("DefaultTemplateId", option_to_yojson notify_template_id_to_yojson x.default_template_id);
      ("PoolId", option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.string__to_yojson x.pool_id);
      ("EnabledCountries", option_to_yojson iso_country_code_list_to_yojson x.enabled_countries);
      ("EnabledChannels", Some (notify_enabled_channels_list_to_yojson x.enabled_channels));
      ("Tier", Some (notify_configuration_tier_to_yojson x.tier));
      ("TierUpgradeStatus", Some (tier_upgrade_status_to_yojson x.tier_upgrade_status));
      ("Status", Some (notify_configuration_status_to_yojson x.status));
      ( "RejectionReason",
        option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.string__to_yojson x.rejection_reason
      );
      ( "DeletionProtectionEnabled",
        Some
          (Smaws_Lib.Smithy_api.Json_serializers.primitive_boolean_to_yojson
             x.deletion_protection_enabled) );
      ( "CreatedTimestamp",
        Some
          (Smaws_Lib.Smithy_api.Json_serializers.timestamp_epoch_seconds_to_yojson
             x.created_timestamp) );
    ]

let notify_configuration_information_list_to_yojson tree =
  list_to_yojson notify_configuration_information_to_yojson tree

let describe_notify_configurations_result_to_yojson (x : describe_notify_configurations_result) =
  assoc_to_yojson
    [
      ( "NotifyConfigurations",
        option_to_yojson notify_configuration_information_list_to_yojson x.notify_configurations );
      ("NextToken", option_to_yojson next_token_to_yojson x.next_token);
    ]

let notify_configuration_filter_name_to_yojson (x : notify_configuration_filter_name) =
  match x with
  | DISPLAY_NAME -> `String "display-name"
  | ENABLED_COUNTRIES -> `String "enabled-countries"
  | ENABLED_CHANNELS -> `String "enabled-channels"
  | DEFAULT_TEMPLATE -> `String "default-template"
  | DEFAULT_POOL -> `String "default-pool"
  | USE_CASE -> `String "use-case"
  | STATUS -> `String "status"
  | DELETION_PROTECTION_ENABLED -> `String "deletion-protection-enabled"
  | TIER_UPGRADE_STATUS -> `String "tier-upgrade-status"

let notify_configuration_filter_to_yojson (x : notify_configuration_filter) =
  assoc_to_yojson
    [
      ("Name", Some (notify_configuration_filter_name_to_yojson x.name));
      ("Values", Some (filter_value_list_to_yojson x.values));
    ]

let notify_configuration_filter_list_to_yojson tree =
  list_to_yojson notify_configuration_filter_to_yojson tree

let notify_configuration_id_list_to_yojson tree =
  list_to_yojson notify_configuration_id_or_arn_to_yojson tree

let describe_notify_configurations_request_to_yojson (x : describe_notify_configurations_request) =
  assoc_to_yojson
    [
      ( "NotifyConfigurationIds",
        option_to_yojson notify_configuration_id_list_to_yojson x.notify_configuration_ids );
      ("Filters", option_to_yojson notify_configuration_filter_list_to_yojson x.filters);
      ("NextToken", option_to_yojson next_token_to_yojson x.next_token);
      ("MaxResults", option_to_yojson max_results_to_yojson x.max_results);
    ]

let voice_id_to_yojson (x : voice_id) =
  match x with
  | AMY -> `String "AMY"
  | ASTRID -> `String "ASTRID"
  | BIANCA -> `String "BIANCA"
  | BRIAN -> `String "BRIAN"
  | CAMILA -> `String "CAMILA"
  | CARLA -> `String "CARLA"
  | CARMEN -> `String "CARMEN"
  | CELINE -> `String "CELINE"
  | CHANTAL -> `String "CHANTAL"
  | CONCHITA -> `String "CONCHITA"
  | CRISTIANO -> `String "CRISTIANO"
  | DORA -> `String "DORA"
  | EMMA -> `String "EMMA"
  | ENRIQUE -> `String "ENRIQUE"
  | EWA -> `String "EWA"
  | FILIZ -> `String "FILIZ"
  | GERAINT -> `String "GERAINT"
  | GIORGIO -> `String "GIORGIO"
  | GWYNETH -> `String "GWYNETH"
  | HANS -> `String "HANS"
  | INES -> `String "INES"
  | IVY -> `String "IVY"
  | JACEK -> `String "JACEK"
  | JAN -> `String "JAN"
  | JOANNA -> `String "JOANNA"
  | JOEY -> `String "JOEY"
  | JUSTIN -> `String "JUSTIN"
  | KARL -> `String "KARL"
  | KENDRA -> `String "KENDRA"
  | KIMBERLY -> `String "KIMBERLY"
  | LEA -> `String "LEA"
  | LIV -> `String "LIV"
  | LOTTE -> `String "LOTTE"
  | LUCIA -> `String "LUCIA"
  | LUPE -> `String "LUPE"
  | MADS -> `String "MADS"
  | MAJA -> `String "MAJA"
  | MARLENE -> `String "MARLENE"
  | MATHIEU -> `String "MATHIEU"
  | MATTHEW -> `String "MATTHEW"
  | MAXIM -> `String "MAXIM"
  | MIA -> `String "MIA"
  | MIGUEL -> `String "MIGUEL"
  | MIZUKI -> `String "MIZUKI"
  | NAJA -> `String "NAJA"
  | NICOLE -> `String "NICOLE"
  | PENELOPE -> `String "PENELOPE"
  | RAVEENA -> `String "RAVEENA"
  | RICARDO -> `String "RICARDO"
  | RUBEN -> `String "RUBEN"
  | RUSSELL -> `String "RUSSELL"
  | SALLI -> `String "SALLI"
  | SEOYEON -> `String "SEOYEON"
  | TAKUMI -> `String "TAKUMI"
  | TATYANA -> `String "TATYANA"
  | VICKI -> `String "VICKI"
  | VITORIA -> `String "VITORIA"
  | ZEINA -> `String "ZEINA"
  | ZHIYU -> `String "ZHIYU"

let voice_id_list_to_yojson tree = list_to_yojson voice_id_to_yojson tree

let template_variable_source_to_yojson (x : template_variable_source) =
  match x with CUSTOMER -> `String "CUSTOMER" | SYSTEM -> `String "SYSTEM"

let template_variable_type_to_yojson (x : template_variable_type) =
  match x with
  | STRING -> `String "STRING"
  | INTEGER -> `String "INTEGER"
  | BOOLEAN -> `String "BOOLEAN"

let template_variable_metadata_to_yojson (x : template_variable_metadata) =
  assoc_to_yojson
    [
      ("Type", Some (template_variable_type_to_yojson x.type_));
      ( "Required",
        Some (Smaws_Lib.Smithy_api.Json_serializers.primitive_boolean_to_yojson x.required) );
      ( "Description",
        option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.string__to_yojson x.description );
      ( "MaxLength",
        option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.integer_to_yojson x.max_length );
      ( "MinValue",
        option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.integer_to_yojson x.min_value );
      ( "MaxValue",
        option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.integer_to_yojson x.max_value );
      ( "DefaultValue",
        option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.string__to_yojson x.default_value );
      ("Pattern", option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.string__to_yojson x.pattern);
      ("Sample", option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.string__to_yojson x.sample);
      ("Source", option_to_yojson template_variable_source_to_yojson x.source);
    ]

let template_variables_map_to_yojson tree =
  map_to_yojson Smaws_Lib.Smithy_api.Json_serializers.string__to_yojson
    template_variable_metadata_to_yojson tree

let template_content_to_yojson = string_to_yojson
let notify_language_code_to_yojson = string_to_yojson

let notify_template_status_to_yojson (x : notify_template_status) =
  match x with ACTIVE -> `String "ACTIVE" | INACTIVE -> `String "INACTIVE"

let notify_configuration_tier_list_to_yojson tree =
  list_to_yojson notify_configuration_tier_to_yojson tree

let number_capability_list_to_yojson tree = list_to_yojson number_capability_to_yojson tree

let notify_template_type_to_yojson (x : notify_template_type) =
  match x with OTP_VERIFICATION -> `String "OTP_VERIFICATION"

let notify_template_version_to_yojson = int_to_yojson

let notify_template_information_to_yojson (x : notify_template_information) =
  assoc_to_yojson
    [
      ("TemplateId", Some (notify_template_id_to_yojson x.template_id));
      ("Version", Some (notify_template_version_to_yojson x.version));
      ("TemplateType", Some (notify_template_type_to_yojson x.template_type));
      ("Channels", Some (number_capability_list_to_yojson x.channels));
      ("TierAccess", option_to_yojson notify_configuration_tier_list_to_yojson x.tier_access);
      ("Status", option_to_yojson notify_template_status_to_yojson x.status);
      ("SupportedCountries", option_to_yojson iso_country_code_list_to_yojson x.supported_countries);
      ("LanguageCode", option_to_yojson notify_language_code_to_yojson x.language_code);
      ("Content", option_to_yojson template_content_to_yojson x.content);
      ("Variables", option_to_yojson template_variables_map_to_yojson x.variables);
      ("SupportedVoiceIds", option_to_yojson voice_id_list_to_yojson x.supported_voice_ids);
      ( "CreatedTimestamp",
        Some
          (Smaws_Lib.Smithy_api.Json_serializers.timestamp_epoch_seconds_to_yojson
             x.created_timestamp) );
    ]

let notify_template_information_list_to_yojson tree =
  list_to_yojson notify_template_information_to_yojson tree

let describe_notify_templates_result_to_yojson (x : describe_notify_templates_result) =
  assoc_to_yojson
    [
      ( "NotifyTemplates",
        option_to_yojson notify_template_information_list_to_yojson x.notify_templates );
      ("NextToken", option_to_yojson next_token_to_yojson x.next_token);
    ]

let notify_template_filter_name_to_yojson (x : notify_template_filter_name) =
  match x with
  | TEMPLATE_TYPE -> `String "template-type"
  | CHANNELS -> `String "channels"
  | TIER_ACCESS -> `String "tier-access"
  | SUPPORTED_COUNTRIES -> `String "supported-countries"
  | LANGUAGE_CODE -> `String "language-code"
  | SUPPORTED_VOICE_IDS -> `String "supported-voice-ids"

let notify_template_filter_to_yojson (x : notify_template_filter) =
  assoc_to_yojson
    [
      ("Name", Some (notify_template_filter_name_to_yojson x.name));
      ("Values", Some (filter_value_list_to_yojson x.values));
    ]

let notify_template_filter_list_to_yojson tree =
  list_to_yojson notify_template_filter_to_yojson tree

let notify_template_id_list_to_yojson tree = list_to_yojson notify_template_id_to_yojson tree

let describe_notify_templates_request_to_yojson (x : describe_notify_templates_request) =
  assoc_to_yojson
    [
      ("TemplateIds", option_to_yojson notify_template_id_list_to_yojson x.template_ids);
      ("Filters", option_to_yojson notify_template_filter_list_to_yojson x.filters);
      ("NextToken", option_to_yojson next_token_to_yojson x.next_token);
      ("MaxResults", option_to_yojson max_results_to_yojson x.max_results);
    ]

let opt_out_list_information_to_yojson (x : opt_out_list_information) =
  assoc_to_yojson
    [
      ( "OptOutListArn",
        Some (Smaws_Lib.Smithy_api.Json_serializers.string__to_yojson x.opt_out_list_arn) );
      ("OptOutListName", Some (opt_out_list_name_to_yojson x.opt_out_list_name));
      ( "CreatedTimestamp",
        Some
          (Smaws_Lib.Smithy_api.Json_serializers.timestamp_epoch_seconds_to_yojson
             x.created_timestamp) );
    ]

let opt_out_list_information_list_to_yojson tree =
  list_to_yojson opt_out_list_information_to_yojson tree

let describe_opt_out_lists_result_to_yojson (x : describe_opt_out_lists_result) =
  assoc_to_yojson
    [
      ("OptOutLists", option_to_yojson opt_out_list_information_list_to_yojson x.opt_out_lists);
      ("NextToken", option_to_yojson next_token_to_yojson x.next_token);
    ]

let owner_to_yojson (x : owner) = match x with SELF -> `String "SELF" | SHARED -> `String "SHARED"
let opt_out_list_name_list_to_yojson tree = list_to_yojson opt_out_list_name_or_arn_to_yojson tree

let describe_opt_out_lists_request_to_yojson (x : describe_opt_out_lists_request) =
  assoc_to_yojson
    [
      ("OptOutListNames", option_to_yojson opt_out_list_name_list_to_yojson x.opt_out_list_names);
      ("NextToken", option_to_yojson next_token_to_yojson x.next_token);
      ("MaxResults", option_to_yojson max_results_to_yojson x.max_results);
      ("Owner", option_to_yojson owner_to_yojson x.owner);
    ]

let opted_out_number_information_to_yojson (x : opted_out_number_information) =
  assoc_to_yojson
    [
      ("OptedOutNumber", Some (phone_number_to_yojson x.opted_out_number));
      ( "OptedOutTimestamp",
        Some
          (Smaws_Lib.Smithy_api.Json_serializers.timestamp_epoch_seconds_to_yojson
             x.opted_out_timestamp) );
      ( "EndUserOptedOut",
        Some
          (Smaws_Lib.Smithy_api.Json_serializers.primitive_boolean_to_yojson x.end_user_opted_out)
      );
    ]

let opted_out_number_information_list_to_yojson tree =
  list_to_yojson opted_out_number_information_to_yojson tree

let describe_opted_out_numbers_result_to_yojson (x : describe_opted_out_numbers_result) =
  assoc_to_yojson
    [
      ( "OptOutListArn",
        option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.string__to_yojson x.opt_out_list_arn
      );
      ("OptOutListName", option_to_yojson opt_out_list_name_to_yojson x.opt_out_list_name);
      ( "OptedOutNumbers",
        option_to_yojson opted_out_number_information_list_to_yojson x.opted_out_numbers );
      ("NextToken", option_to_yojson next_token_to_yojson x.next_token);
    ]

let opted_out_filter_name_to_yojson (x : opted_out_filter_name) =
  match x with END_USER_OPTED_OUT -> `String "end-user-opted-out"

let opted_out_filter_to_yojson (x : opted_out_filter) =
  assoc_to_yojson
    [
      ("Name", Some (opted_out_filter_name_to_yojson x.name));
      ("Values", Some (filter_value_list_to_yojson x.values));
    ]

let opted_out_filter_list_to_yojson tree = list_to_yojson opted_out_filter_to_yojson tree
let opted_out_number_list_to_yojson tree = list_to_yojson phone_number_to_yojson tree

let describe_opted_out_numbers_request_to_yojson (x : describe_opted_out_numbers_request) =
  assoc_to_yojson
    [
      ("OptOutListName", Some (opt_out_list_name_or_arn_to_yojson x.opt_out_list_name));
      ("OptedOutNumbers", option_to_yojson opted_out_number_list_to_yojson x.opted_out_numbers);
      ("Filters", option_to_yojson opted_out_filter_list_to_yojson x.filters);
      ("NextToken", option_to_yojson next_token_to_yojson x.next_token);
      ("MaxResults", option_to_yojson max_results_to_yojson x.max_results);
    ]

let number_type_to_yojson (x : number_type) =
  match x with
  | SHORT_CODE -> `String "SHORT_CODE"
  | LONG_CODE -> `String "LONG_CODE"
  | TOLL_FREE -> `String "TOLL_FREE"
  | TEN_DLC -> `String "TEN_DLC"
  | SIMULATOR -> `String "SIMULATOR"

let number_status_to_yojson (x : number_status) =
  match x with
  | PENDING -> `String "PENDING"
  | ACTIVE -> `String "ACTIVE"
  | ASSOCIATING -> `String "ASSOCIATING"
  | DISASSOCIATING -> `String "DISASSOCIATING"
  | DELETED -> `String "DELETED"

let phone_number_information_to_yojson (x : phone_number_information) =
  assoc_to_yojson
    [
      ( "PhoneNumberArn",
        Some (Smaws_Lib.Smithy_api.Json_serializers.string__to_yojson x.phone_number_arn) );
      ( "PhoneNumberId",
        option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.string__to_yojson x.phone_number_id
      );
      ("PhoneNumber", Some (phone_number_to_yojson x.phone_number));
      ("Status", Some (number_status_to_yojson x.status));
      ("IsoCountryCode", Some (iso_country_code_to_yojson x.iso_country_code));
      ("MessageType", Some (message_type_to_yojson x.message_type));
      ("NumberCapabilities", Some (number_capability_list_to_yojson x.number_capabilities));
      ("NumberType", Some (number_type_to_yojson x.number_type));
      ( "MonthlyLeasingPrice",
        Some (Smaws_Lib.Smithy_api.Json_serializers.string__to_yojson x.monthly_leasing_price) );
      ( "TwoWayEnabled",
        Some (Smaws_Lib.Smithy_api.Json_serializers.primitive_boolean_to_yojson x.two_way_enabled)
      );
      ("TwoWayChannelArn", option_to_yojson two_way_channel_arn_to_yojson x.two_way_channel_arn);
      ("TwoWayChannelRole", option_to_yojson iam_role_arn_to_yojson x.two_way_channel_role);
      ( "SelfManagedOptOutsEnabled",
        Some
          (Smaws_Lib.Smithy_api.Json_serializers.primitive_boolean_to_yojson
             x.self_managed_opt_outs_enabled) );
      ("OptOutListName", Some (opt_out_list_name_to_yojson x.opt_out_list_name));
      ( "InternationalSendingEnabled",
        option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.primitive_boolean_to_yojson
          x.international_sending_enabled );
      ( "DeletionProtectionEnabled",
        Some
          (Smaws_Lib.Smithy_api.Json_serializers.primitive_boolean_to_yojson
             x.deletion_protection_enabled) );
      ("PoolId", option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.string__to_yojson x.pool_id);
      ( "RegistrationId",
        option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.string__to_yojson x.registration_id
      );
      ( "CreatedTimestamp",
        Some
          (Smaws_Lib.Smithy_api.Json_serializers.timestamp_epoch_seconds_to_yojson
             x.created_timestamp) );
    ]

let phone_number_information_list_to_yojson tree =
  list_to_yojson phone_number_information_to_yojson tree

let describe_phone_numbers_result_to_yojson (x : describe_phone_numbers_result) =
  assoc_to_yojson
    [
      ("PhoneNumbers", option_to_yojson phone_number_information_list_to_yojson x.phone_numbers);
      ("NextToken", option_to_yojson next_token_to_yojson x.next_token);
    ]

let phone_number_filter_name_to_yojson (x : phone_number_filter_name) =
  match x with
  | STATUS -> `String "status"
  | ISO_COUNTRY_CODE -> `String "iso-country-code"
  | MESSAGE_TYPE -> `String "message-type"
  | NUMBER_CAPABILITY -> `String "number-capability"
  | NUMBER_TYPE -> `String "number-type"
  | TWO_WAY_ENABLED -> `String "two-way-enabled"
  | SELF_MANAGED_OPT_OUTS_ENABLED -> `String "self-managed-opt-outs-enabled"
  | OPT_OUT_LIST_NAME -> `String "opt-out-list-name"
  | DELETION_PROTECTION_ENABLED -> `String "deletion-protection-enabled"
  | TWO_WAY_CHANNEL_ARN -> `String "two-way-channel-arn"

let phone_number_filter_to_yojson (x : phone_number_filter) =
  assoc_to_yojson
    [
      ("Name", Some (phone_number_filter_name_to_yojson x.name));
      ("Values", Some (filter_value_list_to_yojson x.values));
    ]

let phone_number_filter_list_to_yojson tree = list_to_yojson phone_number_filter_to_yojson tree
let phone_number_id_or_arn_to_yojson = string_to_yojson
let phone_number_id_list_to_yojson tree = list_to_yojson phone_number_id_or_arn_to_yojson tree

let describe_phone_numbers_request_to_yojson (x : describe_phone_numbers_request) =
  assoc_to_yojson
    [
      ("PhoneNumberIds", option_to_yojson phone_number_id_list_to_yojson x.phone_number_ids);
      ("Filters", option_to_yojson phone_number_filter_list_to_yojson x.filters);
      ("NextToken", option_to_yojson next_token_to_yojson x.next_token);
      ("MaxResults", option_to_yojson max_results_to_yojson x.max_results);
      ("Owner", option_to_yojson owner_to_yojson x.owner);
    ]

let pool_information_to_yojson (x : pool_information) =
  assoc_to_yojson
    [
      ("PoolArn", Some (Smaws_Lib.Smithy_api.Json_serializers.string__to_yojson x.pool_arn));
      ("PoolId", Some (Smaws_Lib.Smithy_api.Json_serializers.string__to_yojson x.pool_id));
      ("Status", Some (pool_status_to_yojson x.status));
      ("MessageType", Some (message_type_to_yojson x.message_type));
      ( "TwoWayEnabled",
        Some (Smaws_Lib.Smithy_api.Json_serializers.primitive_boolean_to_yojson x.two_way_enabled)
      );
      ("TwoWayChannelArn", option_to_yojson two_way_channel_arn_to_yojson x.two_way_channel_arn);
      ("TwoWayChannelRole", option_to_yojson iam_role_arn_to_yojson x.two_way_channel_role);
      ( "SelfManagedOptOutsEnabled",
        Some
          (Smaws_Lib.Smithy_api.Json_serializers.primitive_boolean_to_yojson
             x.self_managed_opt_outs_enabled) );
      ("OptOutListName", Some (opt_out_list_name_to_yojson x.opt_out_list_name));
      ( "SharedRoutesEnabled",
        Some
          (Smaws_Lib.Smithy_api.Json_serializers.primitive_boolean_to_yojson x.shared_routes_enabled)
      );
      ( "DeletionProtectionEnabled",
        Some
          (Smaws_Lib.Smithy_api.Json_serializers.primitive_boolean_to_yojson
             x.deletion_protection_enabled) );
      ( "CreatedTimestamp",
        Some
          (Smaws_Lib.Smithy_api.Json_serializers.timestamp_epoch_seconds_to_yojson
             x.created_timestamp) );
    ]

let pool_information_list_to_yojson tree = list_to_yojson pool_information_to_yojson tree

let describe_pools_result_to_yojson (x : describe_pools_result) =
  assoc_to_yojson
    [
      ("Pools", option_to_yojson pool_information_list_to_yojson x.pools);
      ("NextToken", option_to_yojson next_token_to_yojson x.next_token);
    ]

let pool_filter_name_to_yojson (x : pool_filter_name) =
  match x with
  | STATUS -> `String "status"
  | MESSAGE_TYPE -> `String "message-type"
  | TWO_WAY_ENABLED -> `String "two-way-enabled"
  | SELF_MANAGED_OPT_OUTS_ENABLED -> `String "self-managed-opt-outs-enabled"
  | OPT_OUT_LIST_NAME -> `String "opt-out-list-name"
  | SHARED_ROUTES_ENABLED -> `String "shared-routes-enabled"
  | DELETION_PROTECTION_ENABLED -> `String "deletion-protection-enabled"
  | TWO_WAY_CHANNEL_ARN -> `String "two-way-channel-arn"

let pool_filter_to_yojson (x : pool_filter) =
  assoc_to_yojson
    [
      ("Name", Some (pool_filter_name_to_yojson x.name));
      ("Values", Some (filter_value_list_to_yojson x.values));
    ]

let pool_filter_list_to_yojson tree = list_to_yojson pool_filter_to_yojson tree
let pool_id_list_to_yojson tree = list_to_yojson pool_id_or_arn_to_yojson tree

let describe_pools_request_to_yojson (x : describe_pools_request) =
  assoc_to_yojson
    [
      ("PoolIds", option_to_yojson pool_id_list_to_yojson x.pool_ids);
      ("Filters", option_to_yojson pool_filter_list_to_yojson x.filters);
      ("NextToken", option_to_yojson next_token_to_yojson x.next_token);
      ("MaxResults", option_to_yojson max_results_to_yojson x.max_results);
      ("Owner", option_to_yojson owner_to_yojson x.owner);
    ]

let protect_configuration_information_to_yojson (x : protect_configuration_information) =
  assoc_to_yojson
    [
      ( "ProtectConfigurationArn",
        Some (protect_configuration_arn_to_yojson x.protect_configuration_arn) );
      ( "ProtectConfigurationId",
        Some (protect_configuration_id_to_yojson x.protect_configuration_id) );
      ( "CreatedTimestamp",
        Some
          (Smaws_Lib.Smithy_api.Json_serializers.timestamp_epoch_seconds_to_yojson
             x.created_timestamp) );
      ( "AccountDefault",
        Some (Smaws_Lib.Smithy_api.Json_serializers.primitive_boolean_to_yojson x.account_default)
      );
      ( "DeletionProtectionEnabled",
        Some
          (Smaws_Lib.Smithy_api.Json_serializers.primitive_boolean_to_yojson
             x.deletion_protection_enabled) );
    ]

let protect_configuration_information_list_to_yojson tree =
  list_to_yojson protect_configuration_information_to_yojson tree

let describe_protect_configurations_result_to_yojson (x : describe_protect_configurations_result) =
  assoc_to_yojson
    [
      ( "ProtectConfigurations",
        option_to_yojson protect_configuration_information_list_to_yojson x.protect_configurations
      );
      ("NextToken", option_to_yojson next_token_to_yojson x.next_token);
    ]

let protect_configuration_filter_name_to_yojson (x : protect_configuration_filter_name) =
  match x with
  | ACCOUNT_DEFAULT -> `String "account-default"
  | DELETION_PROTECTION_ENABLED -> `String "deletion-protection-enabled"

let protect_configuration_filter_to_yojson (x : protect_configuration_filter) =
  assoc_to_yojson
    [
      ("Name", Some (protect_configuration_filter_name_to_yojson x.name));
      ("Values", Some (filter_value_list_to_yojson x.values));
    ]

let protect_configuration_filter_list_to_yojson tree =
  list_to_yojson protect_configuration_filter_to_yojson tree

let protect_configuration_id_list_to_yojson tree =
  list_to_yojson protect_configuration_id_or_arn_to_yojson tree

let describe_protect_configurations_request_to_yojson (x : describe_protect_configurations_request)
    =
  assoc_to_yojson
    [
      ( "ProtectConfigurationIds",
        option_to_yojson protect_configuration_id_list_to_yojson x.protect_configuration_ids );
      ("Filters", option_to_yojson protect_configuration_filter_list_to_yojson x.filters);
      ("NextToken", option_to_yojson next_token_to_yojson x.next_token);
      ("MaxResults", option_to_yojson max_results_to_yojson x.max_results);
    ]

let describe_rcs_agent_country_launch_status_result_to_yojson
    (x : describe_rcs_agent_country_launch_status_result) =
  assoc_to_yojson
    [
      ("RcsAgentId", Some (Smaws_Lib.Smithy_api.Json_serializers.string__to_yojson x.rcs_agent_id));
      ("RcsAgentArn", Some (Smaws_Lib.Smithy_api.Json_serializers.string__to_yojson x.rcs_agent_arn));
      ( "CountryLaunchStatus",
        option_to_yojson country_launch_status_information_list_to_yojson x.country_launch_status );
      ("NextToken", option_to_yojson next_token_to_yojson x.next_token);
    ]

let describe_rcs_agent_country_launch_status_request_to_yojson
    (x : describe_rcs_agent_country_launch_status_request) =
  assoc_to_yojson
    [
      ("RcsAgentId", Some (rcs_agent_id_or_arn_to_yojson x.rcs_agent_id));
      ("IsoCountryCodes", option_to_yojson iso_country_code_list_to_yojson x.iso_country_codes);
      ("Filters", option_to_yojson country_launch_status_filter_list_to_yojson x.filters);
      ("MaxResults", option_to_yojson max_results_to_yojson x.max_results);
      ("NextToken", option_to_yojson next_token_to_yojson x.next_token);
    ]

let testing_agent_status_to_yojson (x : testing_agent_status) =
  match x with
  | CREATED -> `String "CREATED"
  | PENDING -> `String "PENDING"
  | ACTIVE -> `String "ACTIVE"

let testing_agent_information_to_yojson (x : testing_agent_information) =
  assoc_to_yojson
    [
      ("Status", Some (testing_agent_status_to_yojson x.status));
      ( "TestingAgentId",
        option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.string__to_yojson x.testing_agent_id
      );
      ( "RegistrationId",
        Some (Smaws_Lib.Smithy_api.Json_serializers.string__to_yojson x.registration_id) );
    ]

let rcs_agent_information_to_yojson (x : rcs_agent_information) =
  assoc_to_yojson
    [
      ("RcsAgentArn", Some (Smaws_Lib.Smithy_api.Json_serializers.string__to_yojson x.rcs_agent_arn));
      ("RcsAgentId", Some (Smaws_Lib.Smithy_api.Json_serializers.string__to_yojson x.rcs_agent_id));
      ("Status", Some (rcs_agent_status_to_yojson x.status));
      ( "CreatedTimestamp",
        Some
          (Smaws_Lib.Smithy_api.Json_serializers.timestamp_epoch_seconds_to_yojson
             x.created_timestamp) );
      ( "DeletionProtectionEnabled",
        Some
          (Smaws_Lib.Smithy_api.Json_serializers.primitive_boolean_to_yojson
             x.deletion_protection_enabled) );
      ("OptOutListName", option_to_yojson opt_out_list_name_to_yojson x.opt_out_list_name);
      ( "SelfManagedOptOutsEnabled",
        Some
          (Smaws_Lib.Smithy_api.Json_serializers.primitive_boolean_to_yojson
             x.self_managed_opt_outs_enabled) );
      ("TwoWayChannelArn", option_to_yojson two_way_channel_arn_to_yojson x.two_way_channel_arn);
      ("TwoWayChannelRole", option_to_yojson iam_role_arn_to_yojson x.two_way_channel_role);
      ( "TwoWayEnabled",
        Some (Smaws_Lib.Smithy_api.Json_serializers.primitive_boolean_to_yojson x.two_way_enabled)
      );
      ("PoolId", option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.string__to_yojson x.pool_id);
      ( "TwoWayMediaS3BucketName",
        option_to_yojson two_way_media_s3_bucket_name_to_yojson x.two_way_media_s3_bucket_name );
      ( "TwoWayMediaS3KeyPrefix",
        option_to_yojson two_way_media_s3_key_prefix_to_yojson x.two_way_media_s3_key_prefix );
      ("TwoWayMediaS3Role", option_to_yojson iam_role_arn_to_yojson x.two_way_media_s3_role);
      ( "TwoWayRcsEventsEnabled",
        option_to_yojson rcs_event_type_list_to_yojson x.two_way_rcs_events_enabled );
      ("TestingAgent", option_to_yojson testing_agent_information_to_yojson x.testing_agent);
    ]

let rcs_agent_information_list_to_yojson tree = list_to_yojson rcs_agent_information_to_yojson tree

let describe_rcs_agents_result_to_yojson (x : describe_rcs_agents_result) =
  assoc_to_yojson
    [
      ("RcsAgents", option_to_yojson rcs_agent_information_list_to_yojson x.rcs_agents);
      ("NextToken", option_to_yojson next_token_to_yojson x.next_token);
    ]

let rcs_agent_filter_name_to_yojson (x : rcs_agent_filter_name) =
  match x with
  | STATUS -> `String "status"
  | TWO_WAY_ENABLED -> `String "two-way-enabled"
  | SELF_MANAGED_OPT_OUTS_ENABLED -> `String "self-managed-opt-outs-enabled"
  | OPT_OUT_LIST_NAME -> `String "opt-out-list-name"
  | DELETION_PROTECTION_ENABLED -> `String "deletion-protection-enabled"
  | TWO_WAY_CHANNEL_ARN -> `String "two-way-channel-arn"

let rcs_agent_filter_to_yojson (x : rcs_agent_filter) =
  assoc_to_yojson
    [
      ("Name", Some (rcs_agent_filter_name_to_yojson x.name));
      ("Values", Some (filter_value_list_to_yojson x.values));
    ]

let rcs_agent_filter_list_to_yojson tree = list_to_yojson rcs_agent_filter_to_yojson tree
let rcs_agent_id_list_to_yojson tree = list_to_yojson rcs_agent_id_or_arn_to_yojson tree

let describe_rcs_agents_request_to_yojson (x : describe_rcs_agents_request) =
  assoc_to_yojson
    [
      ("RcsAgentIds", option_to_yojson rcs_agent_id_list_to_yojson x.rcs_agent_ids);
      ("Owner", option_to_yojson owner_to_yojson x.owner);
      ("Filters", option_to_yojson rcs_agent_filter_list_to_yojson x.filters);
      ("NextToken", option_to_yojson next_token_to_yojson x.next_token);
      ("MaxResults", option_to_yojson max_results_to_yojson x.max_results);
    ]

let registration_attachments_information_to_yojson (x : registration_attachments_information) =
  assoc_to_yojson
    [
      ( "RegistrationAttachmentArn",
        Some (Smaws_Lib.Smithy_api.Json_serializers.string__to_yojson x.registration_attachment_arn)
      );
      ( "RegistrationAttachmentId",
        Some (Smaws_Lib.Smithy_api.Json_serializers.string__to_yojson x.registration_attachment_id)
      );
      ("AttachmentStatus", Some (attachment_status_to_yojson x.attachment_status));
      ( "AttachmentUploadErrorReason",
        option_to_yojson attachment_upload_error_reason_to_yojson x.attachment_upload_error_reason
      );
      ( "CreatedTimestamp",
        Some
          (Smaws_Lib.Smithy_api.Json_serializers.timestamp_epoch_seconds_to_yojson
             x.created_timestamp) );
      ( "AttachmentUrl",
        option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.string__to_yojson x.attachment_url );
    ]

let registration_attachments_information_list_to_yojson tree =
  list_to_yojson registration_attachments_information_to_yojson tree

let describe_registration_attachments_result_to_yojson
    (x : describe_registration_attachments_result) =
  assoc_to_yojson
    [
      ( "RegistrationAttachments",
        Some (registration_attachments_information_list_to_yojson x.registration_attachments) );
      ("NextToken", option_to_yojson next_token_to_yojson x.next_token);
    ]

let registration_attachment_filter_name_to_yojson (x : registration_attachment_filter_name) =
  match x with ATTACHMENT_STATUS -> `String "attachment-status"

let registration_attachment_filter_to_yojson (x : registration_attachment_filter) =
  assoc_to_yojson
    [
      ("Name", Some (registration_attachment_filter_name_to_yojson x.name));
      ("Values", Some (filter_value_list_to_yojson x.values));
    ]

let registration_attachment_filter_list_to_yojson tree =
  list_to_yojson registration_attachment_filter_to_yojson tree

let registration_attachment_id_list_to_yojson tree =
  list_to_yojson registration_id_or_arn_to_yojson tree

let describe_registration_attachments_request_to_yojson
    (x : describe_registration_attachments_request) =
  assoc_to_yojson
    [
      ( "RegistrationAttachmentIds",
        option_to_yojson registration_attachment_id_list_to_yojson x.registration_attachment_ids );
      ("Filters", option_to_yojson registration_attachment_filter_list_to_yojson x.filters);
      ("NextToken", option_to_yojson next_token_to_yojson x.next_token);
      ("MaxResults", option_to_yojson max_results_to_yojson x.max_results);
    ]

let select_option_description_to_yojson (x : select_option_description) =
  assoc_to_yojson
    [
      ("Option", Some (Smaws_Lib.Smithy_api.Json_serializers.string__to_yojson x.option_));
      ("Title", option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.string__to_yojson x.title);
      ( "Description",
        option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.string__to_yojson x.description );
    ]

let select_option_descriptions_list_to_yojson tree =
  list_to_yojson select_option_description_to_yojson tree

let registration_field_display_hints_to_yojson (x : registration_field_display_hints) =
  assoc_to_yojson
    [
      ("Title", Some (Smaws_Lib.Smithy_api.Json_serializers.string__to_yojson x.title));
      ( "ShortDescription",
        Some (Smaws_Lib.Smithy_api.Json_serializers.string__to_yojson x.short_description) );
      ( "LongDescription",
        option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.string__to_yojson x.long_description
      );
      ( "DocumentationTitle",
        option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.string__to_yojson
          x.documentation_title );
      ( "DocumentationLink",
        option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.string__to_yojson
          x.documentation_link );
      ( "SelectOptionDescriptions",
        option_to_yojson select_option_descriptions_list_to_yojson x.select_option_descriptions );
      ( "TextValidationDescription",
        option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.string__to_yojson
          x.text_validation_description );
      ( "ExampleTextValue",
        option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.string__to_yojson
          x.example_text_value );
    ]

let text_validation_to_yojson (x : text_validation) =
  assoc_to_yojson
    [
      ("MinLength", Some (Smaws_Lib.Smithy_api.Json_serializers.integer_to_yojson x.min_length));
      ("MaxLength", Some (Smaws_Lib.Smithy_api.Json_serializers.integer_to_yojson x.max_length));
      ("Pattern", Some (Smaws_Lib.Smithy_api.Json_serializers.string__to_yojson x.pattern));
    ]

let string_list_to_yojson tree =
  list_to_yojson Smaws_Lib.Smithy_api.Json_serializers.string__to_yojson tree

let select_validation_to_yojson (x : select_validation) =
  assoc_to_yojson
    [
      ("MinChoices", Some (Smaws_Lib.Smithy_api.Json_serializers.integer_to_yojson x.min_choices));
      ("MaxChoices", Some (Smaws_Lib.Smithy_api.Json_serializers.integer_to_yojson x.max_choices));
      ("Options", Some (string_list_to_yojson x.options));
    ]

let field_requirement_to_yojson (x : field_requirement) =
  match x with
  | REQUIRED -> `String "REQUIRED"
  | CONDITIONAL -> `String "CONDITIONAL"
  | OPTIONAL -> `String "OPTIONAL"

let field_type_to_yojson (x : field_type) =
  match x with
  | SELECT -> `String "SELECT"
  | TEXT -> `String "TEXT"
  | ATTACHMENT -> `String "ATTACHMENT"

let section_path_to_yojson = string_to_yojson

let registration_field_definition_to_yojson (x : registration_field_definition) =
  assoc_to_yojson
    [
      ("SectionPath", Some (section_path_to_yojson x.section_path));
      ("FieldPath", Some (field_path_to_yojson x.field_path));
      ("FieldType", Some (field_type_to_yojson x.field_type));
      ("FieldRequirement", Some (field_requirement_to_yojson x.field_requirement));
      ("SelectValidation", option_to_yojson select_validation_to_yojson x.select_validation);
      ("TextValidation", option_to_yojson text_validation_to_yojson x.text_validation);
      ("DisplayHints", Some (registration_field_display_hints_to_yojson x.display_hints));
    ]

let registration_field_definition_list_to_yojson tree =
  list_to_yojson registration_field_definition_to_yojson tree

let describe_registration_field_definitions_result_to_yojson
    (x : describe_registration_field_definitions_result) =
  assoc_to_yojson
    [
      ("RegistrationType", Some (registration_type_to_yojson x.registration_type));
      ( "RegistrationFieldDefinitions",
        Some (registration_field_definition_list_to_yojson x.registration_field_definitions) );
      ("NextToken", option_to_yojson next_token_to_yojson x.next_token);
    ]

let field_path_list_to_yojson tree = list_to_yojson field_path_to_yojson tree

let describe_registration_field_definitions_request_to_yojson
    (x : describe_registration_field_definitions_request) =
  assoc_to_yojson
    [
      ("RegistrationType", Some (registration_type_to_yojson x.registration_type));
      ("SectionPath", option_to_yojson section_path_to_yojson x.section_path);
      ("FieldPaths", option_to_yojson field_path_list_to_yojson x.field_paths);
      ("NextToken", option_to_yojson next_token_to_yojson x.next_token);
      ("MaxResults", option_to_yojson max_results_to_yojson x.max_results);
    ]

let registration_field_value_information_to_yojson (x : registration_field_value_information) =
  assoc_to_yojson
    [
      ("FieldPath", Some (field_path_to_yojson x.field_path));
      ("SelectChoices", option_to_yojson select_choice_list_to_yojson x.select_choices);
      ("TextValue", option_to_yojson text_value_to_yojson x.text_value);
      ( "RegistrationAttachmentId",
        option_to_yojson registration_attachment_id_or_arn_to_yojson x.registration_attachment_id );
      ( "DeniedReason",
        option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.string__to_yojson x.denied_reason );
      ( "Feedback",
        option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.string__to_yojson x.feedback );
    ]

let registration_field_value_information_list_to_yojson tree =
  list_to_yojson registration_field_value_information_to_yojson tree

let describe_registration_field_values_result_to_yojson
    (x : describe_registration_field_values_result) =
  assoc_to_yojson
    [
      ( "RegistrationArn",
        Some (Smaws_Lib.Smithy_api.Json_serializers.string__to_yojson x.registration_arn) );
      ( "RegistrationId",
        Some (Smaws_Lib.Smithy_api.Json_serializers.string__to_yojson x.registration_id) );
      ("VersionNumber", Some (registration_version_number_to_yojson x.version_number));
      ( "RegistrationFieldValues",
        Some (registration_field_value_information_list_to_yojson x.registration_field_values) );
      ("NextToken", option_to_yojson next_token_to_yojson x.next_token);
    ]

let describe_registration_field_values_request_to_yojson
    (x : describe_registration_field_values_request) =
  assoc_to_yojson
    [
      ("RegistrationId", Some (registration_id_or_arn_to_yojson x.registration_id));
      ("VersionNumber", option_to_yojson registration_version_number_to_yojson x.version_number);
      ("SectionPath", option_to_yojson section_path_to_yojson x.section_path);
      ("FieldPaths", option_to_yojson field_path_list_to_yojson x.field_paths);
      ("NextToken", option_to_yojson next_token_to_yojson x.next_token);
      ("MaxResults", option_to_yojson max_results_to_yojson x.max_results);
    ]

let registration_section_display_hints_to_yojson (x : registration_section_display_hints) =
  assoc_to_yojson
    [
      ("Title", Some (Smaws_Lib.Smithy_api.Json_serializers.string__to_yojson x.title));
      ( "ShortDescription",
        Some (Smaws_Lib.Smithy_api.Json_serializers.string__to_yojson x.short_description) );
      ( "LongDescription",
        option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.string__to_yojson x.long_description
      );
      ( "DocumentationTitle",
        option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.string__to_yojson
          x.documentation_title );
      ( "DocumentationLink",
        option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.string__to_yojson
          x.documentation_link );
    ]

let registration_section_definition_to_yojson (x : registration_section_definition) =
  assoc_to_yojson
    [
      ("SectionPath", Some (section_path_to_yojson x.section_path));
      ("DisplayHints", Some (registration_section_display_hints_to_yojson x.display_hints));
    ]

let registration_section_definition_list_to_yojson tree =
  list_to_yojson registration_section_definition_to_yojson tree

let describe_registration_section_definitions_result_to_yojson
    (x : describe_registration_section_definitions_result) =
  assoc_to_yojson
    [
      ("RegistrationType", Some (registration_type_to_yojson x.registration_type));
      ( "RegistrationSectionDefinitions",
        Some (registration_section_definition_list_to_yojson x.registration_section_definitions) );
      ("NextToken", option_to_yojson next_token_to_yojson x.next_token);
    ]

let section_path_list_to_yojson tree = list_to_yojson section_path_to_yojson tree

let describe_registration_section_definitions_request_to_yojson
    (x : describe_registration_section_definitions_request) =
  assoc_to_yojson
    [
      ("RegistrationType", Some (registration_type_to_yojson x.registration_type));
      ("SectionPaths", option_to_yojson section_path_list_to_yojson x.section_paths);
      ("NextToken", option_to_yojson next_token_to_yojson x.next_token);
      ("MaxResults", option_to_yojson max_results_to_yojson x.max_results);
    ]

let registration_type_display_hints_to_yojson (x : registration_type_display_hints) =
  assoc_to_yojson
    [
      ("Title", Some (Smaws_Lib.Smithy_api.Json_serializers.string__to_yojson x.title));
      ( "ShortDescription",
        option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.string__to_yojson x.short_description
      );
      ( "LongDescription",
        option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.string__to_yojson x.long_description
      );
      ( "DocumentationTitle",
        option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.string__to_yojson
          x.documentation_title );
      ( "DocumentationLink",
        option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.string__to_yojson
          x.documentation_link );
    ]

let registration_disassociation_behavior_to_yojson (x : registration_disassociation_behavior) =
  match x with
  | DISASSOCIATE_ALL_CLOSES_REGISTRATION -> `String "DISASSOCIATE_ALL_CLOSES_REGISTRATION"
  | DISASSOCIATE_ALL_ALLOWS_DELETE_REGISTRATION ->
      `String "DISASSOCIATE_ALL_ALLOWS_DELETE_REGISTRATION"
  | DELETE_REGISTRATION_DISASSOCIATES -> `String "DELETE_REGISTRATION_DISASSOCIATES"

let registration_association_behavior_to_yojson (x : registration_association_behavior) =
  match x with
  | ASSOCIATE_BEFORE_SUBMIT -> `String "ASSOCIATE_BEFORE_SUBMIT"
  | ASSOCIATE_ON_APPROVAL -> `String "ASSOCIATE_ON_APPROVAL"
  | ASSOCIATE_AFTER_COMPLETE -> `String "ASSOCIATE_AFTER_COMPLETE"

let supported_association_to_yojson (x : supported_association) =
  assoc_to_yojson
    [
      ( "ResourceType",
        Some (Smaws_Lib.Smithy_api.Json_serializers.string__to_yojson x.resource_type) );
      ("IsoCountryCode", option_to_yojson iso_country_code_to_yojson x.iso_country_code);
      ( "AssociationBehavior",
        Some (registration_association_behavior_to_yojson x.association_behavior) );
      ( "DisassociationBehavior",
        Some (registration_disassociation_behavior_to_yojson x.disassociation_behavior) );
    ]

let supported_association_list_to_yojson tree = list_to_yojson supported_association_to_yojson tree

let registration_type_definition_to_yojson (x : registration_type_definition) =
  assoc_to_yojson
    [
      ("RegistrationType", Some (registration_type_to_yojson x.registration_type));
      ( "SupportedAssociations",
        option_to_yojson supported_association_list_to_yojson x.supported_associations );
      ("DisplayHints", Some (registration_type_display_hints_to_yojson x.display_hints));
    ]

let registration_type_definition_list_to_yojson tree =
  list_to_yojson registration_type_definition_to_yojson tree

let describe_registration_type_definitions_result_to_yojson
    (x : describe_registration_type_definitions_result) =
  assoc_to_yojson
    [
      ( "RegistrationTypeDefinitions",
        Some (registration_type_definition_list_to_yojson x.registration_type_definitions) );
      ("NextToken", option_to_yojson next_token_to_yojson x.next_token);
    ]

let registration_type_filter_name_to_yojson (x : registration_type_filter_name) =
  match x with
  | SUPPORTED_ASSOCIATION_RESOURCE_TYPE -> `String "supported-association-resource-type"
  | SUPPORTED_ASSOCIATION_ISO_COUNTRY_CODE -> `String "supported-association-iso-country-code"

let registration_type_filter_to_yojson (x : registration_type_filter) =
  assoc_to_yojson
    [
      ("Name", Some (registration_type_filter_name_to_yojson x.name));
      ("Values", Some (filter_value_list_to_yojson x.values));
    ]

let registration_type_filter_list_to_yojson tree =
  list_to_yojson registration_type_filter_to_yojson tree

let registration_type_list_to_yojson tree = list_to_yojson registration_type_to_yojson tree

let describe_registration_type_definitions_request_to_yojson
    (x : describe_registration_type_definitions_request) =
  assoc_to_yojson
    [
      ("RegistrationTypes", option_to_yojson registration_type_list_to_yojson x.registration_types);
      ("Filters", option_to_yojson registration_type_filter_list_to_yojson x.filters);
      ("NextToken", option_to_yojson next_token_to_yojson x.next_token);
      ("MaxResults", option_to_yojson max_results_to_yojson x.max_results);
    ]

let registration_denied_reason_information_to_yojson (x : registration_denied_reason_information) =
  assoc_to_yojson
    [
      ("Reason", Some (Smaws_Lib.Smithy_api.Json_serializers.string__to_yojson x.reason));
      ( "ShortDescription",
        Some (Smaws_Lib.Smithy_api.Json_serializers.string__to_yojson x.short_description) );
      ( "LongDescription",
        option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.string__to_yojson x.long_description
      );
      ( "DocumentationTitle",
        option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.string__to_yojson
          x.documentation_title );
      ( "DocumentationLink",
        option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.string__to_yojson
          x.documentation_link );
    ]

let registration_denied_reason_information_list_to_yojson tree =
  list_to_yojson registration_denied_reason_information_to_yojson tree

let registration_version_information_to_yojson (x : registration_version_information) =
  assoc_to_yojson
    [
      ("VersionNumber", Some (registration_version_number_to_yojson x.version_number));
      ( "RegistrationVersionStatus",
        Some (registration_version_status_to_yojson x.registration_version_status) );
      ( "RegistrationVersionStatusHistory",
        Some (registration_version_status_history_to_yojson x.registration_version_status_history)
      );
      ( "DeniedReasons",
        option_to_yojson registration_denied_reason_information_list_to_yojson x.denied_reasons );
      ( "Feedback",
        option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.string__to_yojson x.feedback );
    ]

let registration_version_information_list_to_yojson tree =
  list_to_yojson registration_version_information_to_yojson tree

let describe_registration_versions_result_to_yojson (x : describe_registration_versions_result) =
  assoc_to_yojson
    [
      ( "RegistrationArn",
        Some (Smaws_Lib.Smithy_api.Json_serializers.string__to_yojson x.registration_arn) );
      ( "RegistrationId",
        Some (Smaws_Lib.Smithy_api.Json_serializers.string__to_yojson x.registration_id) );
      ( "RegistrationVersions",
        Some (registration_version_information_list_to_yojson x.registration_versions) );
      ("NextToken", option_to_yojson next_token_to_yojson x.next_token);
    ]

let registration_version_filter_name_to_yojson (x : registration_version_filter_name) =
  match x with REGISTRATION_VERSION_STATUS -> `String "registration-version-status"

let registration_version_filter_to_yojson (x : registration_version_filter) =
  assoc_to_yojson
    [
      ("Name", Some (registration_version_filter_name_to_yojson x.name));
      ("Values", Some (filter_value_list_to_yojson x.values));
    ]

let registration_version_filter_list_to_yojson tree =
  list_to_yojson registration_version_filter_to_yojson tree

let registration_version_number_list_to_yojson tree =
  list_to_yojson registration_version_number_to_yojson tree

let describe_registration_versions_request_to_yojson (x : describe_registration_versions_request) =
  assoc_to_yojson
    [
      ("RegistrationId", Some (registration_id_or_arn_to_yojson x.registration_id));
      ( "VersionNumbers",
        option_to_yojson registration_version_number_list_to_yojson x.version_numbers );
      ("Filters", option_to_yojson registration_version_filter_list_to_yojson x.filters);
      ("NextToken", option_to_yojson next_token_to_yojson x.next_token);
      ("MaxResults", option_to_yojson max_results_to_yojson x.max_results);
    ]

let registration_information_to_yojson (x : registration_information) =
  assoc_to_yojson
    [
      ( "RegistrationArn",
        Some (Smaws_Lib.Smithy_api.Json_serializers.string__to_yojson x.registration_arn) );
      ( "RegistrationId",
        Some (Smaws_Lib.Smithy_api.Json_serializers.string__to_yojson x.registration_id) );
      ("RegistrationType", Some (registration_type_to_yojson x.registration_type));
      ("RegistrationStatus", Some (registration_status_to_yojson x.registration_status));
      ("CurrentVersionNumber", Some (registration_version_number_to_yojson x.current_version_number));
      ( "ApprovedVersionNumber",
        option_to_yojson registration_version_number_to_yojson x.approved_version_number );
      ( "LatestDeniedVersionNumber",
        option_to_yojson registration_version_number_to_yojson x.latest_denied_version_number );
      ("AdditionalAttributes", option_to_yojson string_map_to_yojson x.additional_attributes);
      ( "CreatedTimestamp",
        Some
          (Smaws_Lib.Smithy_api.Json_serializers.timestamp_epoch_seconds_to_yojson
             x.created_timestamp) );
    ]

let registration_information_list_to_yojson tree =
  list_to_yojson registration_information_to_yojson tree

let describe_registrations_result_to_yojson (x : describe_registrations_result) =
  assoc_to_yojson
    [
      ("Registrations", Some (registration_information_list_to_yojson x.registrations));
      ("NextToken", option_to_yojson next_token_to_yojson x.next_token);
    ]

let registration_filter_name_to_yojson (x : registration_filter_name) =
  match x with
  | REGISTRATION_TYPE -> `String "registration-type"
  | REGISTRATION_STATUS -> `String "registration-status"

let registration_filter_to_yojson (x : registration_filter) =
  assoc_to_yojson
    [
      ("Name", Some (registration_filter_name_to_yojson x.name));
      ("Values", Some (filter_value_list_to_yojson x.values));
    ]

let registration_filter_list_to_yojson tree = list_to_yojson registration_filter_to_yojson tree
let registration_id_list_to_yojson tree = list_to_yojson registration_id_or_arn_to_yojson tree

let describe_registrations_request_to_yojson (x : describe_registrations_request) =
  assoc_to_yojson
    [
      ("RegistrationIds", option_to_yojson registration_id_list_to_yojson x.registration_ids);
      ("Filters", option_to_yojson registration_filter_list_to_yojson x.filters);
      ("NextToken", option_to_yojson next_token_to_yojson x.next_token);
      ("MaxResults", option_to_yojson max_results_to_yojson x.max_results);
    ]

let message_type_list_to_yojson tree = list_to_yojson message_type_to_yojson tree

let sender_id_information_to_yojson (x : sender_id_information) =
  assoc_to_yojson
    [
      ("SenderIdArn", Some (Smaws_Lib.Smithy_api.Json_serializers.string__to_yojson x.sender_id_arn));
      ("SenderId", Some (sender_id_to_yojson x.sender_id));
      ("IsoCountryCode", Some (iso_country_code_to_yojson x.iso_country_code));
      ("MessageTypes", Some (message_type_list_to_yojson x.message_types));
      ( "MonthlyLeasingPrice",
        Some (Smaws_Lib.Smithy_api.Json_serializers.string__to_yojson x.monthly_leasing_price) );
      ( "DeletionProtectionEnabled",
        Some
          (Smaws_Lib.Smithy_api.Json_serializers.primitive_boolean_to_yojson
             x.deletion_protection_enabled) );
      ( "Registered",
        Some (Smaws_Lib.Smithy_api.Json_serializers.primitive_boolean_to_yojson x.registered) );
      ( "RegistrationId",
        option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.string__to_yojson x.registration_id
      );
    ]

let sender_id_information_list_to_yojson tree = list_to_yojson sender_id_information_to_yojson tree

let describe_sender_ids_result_to_yojson (x : describe_sender_ids_result) =
  assoc_to_yojson
    [
      ("SenderIds", option_to_yojson sender_id_information_list_to_yojson x.sender_ids);
      ("NextToken", option_to_yojson next_token_to_yojson x.next_token);
    ]

let sender_id_filter_name_to_yojson (x : sender_id_filter_name) =
  match x with
  | SENDER_ID -> `String "sender-id"
  | ISO_COUNTRY_CODE -> `String "iso-country-code"
  | MESSAGE_TYPE -> `String "message-type"
  | DELETION_PROTECTION_ENABLED -> `String "deletion-protection-enabled"
  | REGISTERED -> `String "registered"

let sender_id_filter_to_yojson (x : sender_id_filter) =
  assoc_to_yojson
    [
      ("Name", Some (sender_id_filter_name_to_yojson x.name));
      ("Values", Some (filter_value_list_to_yojson x.values));
    ]

let sender_id_filter_list_to_yojson tree = list_to_yojson sender_id_filter_to_yojson tree
let sender_id_or_arn_to_yojson = string_to_yojson

let sender_id_and_country_to_yojson (x : sender_id_and_country) =
  assoc_to_yojson
    [
      ("SenderId", Some (sender_id_or_arn_to_yojson x.sender_id));
      ("IsoCountryCode", Some (iso_country_code_to_yojson x.iso_country_code));
    ]

let sender_id_list_to_yojson tree = list_to_yojson sender_id_and_country_to_yojson tree

let describe_sender_ids_request_to_yojson (x : describe_sender_ids_request) =
  assoc_to_yojson
    [
      ("SenderIds", option_to_yojson sender_id_list_to_yojson x.sender_ids);
      ("Filters", option_to_yojson sender_id_filter_list_to_yojson x.filters);
      ("NextToken", option_to_yojson next_token_to_yojson x.next_token);
      ("MaxResults", option_to_yojson max_results_to_yojson x.max_results);
      ("Owner", option_to_yojson owner_to_yojson x.owner);
    ]

let spend_limit_name_to_yojson (x : spend_limit_name) =
  match x with
  | TEXT_MESSAGE_MONTHLY_SPEND_LIMIT -> `String "TEXT_MESSAGE_MONTHLY_SPEND_LIMIT"
  | VOICE_MESSAGE_MONTHLY_SPEND_LIMIT -> `String "VOICE_MESSAGE_MONTHLY_SPEND_LIMIT"
  | MEDIA_MESSAGE_MONTHLY_SPEND_LIMIT -> `String "MEDIA_MESSAGE_MONTHLY_SPEND_LIMIT"
  | NOTIFY_MESSAGE_MONTHLY_SPEND_LIMIT -> `String "NOTIFY_MESSAGE_MONTHLY_SPEND_LIMIT"
  | RCS_MESSAGE_MONTHLY_SPEND_LIMIT -> `String "RCS_MESSAGE_MONTHLY_SPEND_LIMIT"

let spend_limit_to_yojson (x : spend_limit) =
  assoc_to_yojson
    [
      ("Name", Some (spend_limit_name_to_yojson x.name));
      ( "EnforcedLimit",
        Some (Smaws_Lib.Smithy_api.Json_serializers.primitive_long_to_yojson x.enforced_limit) );
      ("MaxLimit", Some (Smaws_Lib.Smithy_api.Json_serializers.primitive_long_to_yojson x.max_limit));
      ( "Overridden",
        Some (Smaws_Lib.Smithy_api.Json_serializers.primitive_boolean_to_yojson x.overridden) );
    ]

let spend_limit_list_to_yojson tree = list_to_yojson spend_limit_to_yojson tree

let describe_spend_limits_result_to_yojson (x : describe_spend_limits_result) =
  assoc_to_yojson
    [
      ("SpendLimits", option_to_yojson spend_limit_list_to_yojson x.spend_limits);
      ("NextToken", option_to_yojson next_token_to_yojson x.next_token);
    ]

let describe_spend_limits_request_to_yojson (x : describe_spend_limits_request) =
  assoc_to_yojson
    [
      ("NextToken", option_to_yojson next_token_to_yojson x.next_token);
      ("MaxResults", option_to_yojson max_results_to_yojson x.max_results);
    ]

let verified_destination_number_information_to_yojson (x : verified_destination_number_information)
    =
  assoc_to_yojson
    [
      ( "VerifiedDestinationNumberArn",
        Some
          (Smaws_Lib.Smithy_api.Json_serializers.string__to_yojson x.verified_destination_number_arn)
      );
      ( "VerifiedDestinationNumberId",
        Some
          (Smaws_Lib.Smithy_api.Json_serializers.string__to_yojson x.verified_destination_number_id)
      );
      ("DestinationPhoneNumber", Some (phone_number_to_yojson x.destination_phone_number));
      ("Status", Some (verification_status_to_yojson x.status));
      ( "RcsAgentId",
        option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.string__to_yojson x.rcs_agent_id );
      ( "CreatedTimestamp",
        Some
          (Smaws_Lib.Smithy_api.Json_serializers.timestamp_epoch_seconds_to_yojson
             x.created_timestamp) );
    ]

let verified_destination_number_information_list_to_yojson tree =
  list_to_yojson verified_destination_number_information_to_yojson tree

let describe_verified_destination_numbers_result_to_yojson
    (x : describe_verified_destination_numbers_result) =
  assoc_to_yojson
    [
      ( "VerifiedDestinationNumbers",
        Some (verified_destination_number_information_list_to_yojson x.verified_destination_numbers)
      );
      ("NextToken", option_to_yojson next_token_to_yojson x.next_token);
    ]

let verified_destination_number_filter_name_to_yojson (x : verified_destination_number_filter_name)
    =
  match x with STATUS -> `String "status" | RCS_AGENT_ID -> `String "rcs-agent-id"

let verified_destination_number_filter_to_yojson (x : verified_destination_number_filter) =
  assoc_to_yojson
    [
      ("Name", Some (verified_destination_number_filter_name_to_yojson x.name));
      ("Values", Some (filter_value_list_to_yojson x.values));
    ]

let verified_destination_number_filter_list_to_yojson tree =
  list_to_yojson verified_destination_number_filter_to_yojson tree

let destination_phone_number_list_to_yojson tree = list_to_yojson phone_number_to_yojson tree

let verified_destination_number_id_list_to_yojson tree =
  list_to_yojson verified_destination_number_id_or_arn_to_yojson tree

let describe_verified_destination_numbers_request_to_yojson
    (x : describe_verified_destination_numbers_request) =
  assoc_to_yojson
    [
      ( "VerifiedDestinationNumberIds",
        option_to_yojson verified_destination_number_id_list_to_yojson
          x.verified_destination_number_ids );
      ( "DestinationPhoneNumbers",
        option_to_yojson destination_phone_number_list_to_yojson x.destination_phone_numbers );
      ("Filters", option_to_yojson verified_destination_number_filter_list_to_yojson x.filters);
      ("NextToken", option_to_yojson next_token_to_yojson x.next_token);
      ("MaxResults", option_to_yojson max_results_to_yojson x.max_results);
    ]

let destination_country_parameter_key_to_yojson (x : destination_country_parameter_key) =
  match x with IN_TEMPLATE_ID -> `String "IN_TEMPLATE_ID" | IN_ENTITY_ID -> `String "IN_ENTITY_ID"

let destination_country_parameter_value_to_yojson = string_to_yojson

let destination_country_parameters_to_yojson tree =
  map_to_yojson destination_country_parameter_key_to_yojson
    destination_country_parameter_value_to_yojson tree

let disassociate_origination_identity_result_to_yojson
    (x : disassociate_origination_identity_result) =
  assoc_to_yojson
    [
      ( "PoolArn",
        option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.string__to_yojson x.pool_arn );
      ("PoolId", option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.string__to_yojson x.pool_id);
      ( "OriginationIdentityArn",
        option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.string__to_yojson
          x.origination_identity_arn );
      ( "OriginationIdentity",
        option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.string__to_yojson
          x.origination_identity );
      ("IsoCountryCode", option_to_yojson iso_country_code_to_yojson x.iso_country_code);
    ]

let disassociate_origination_identity_request_to_yojson
    (x : disassociate_origination_identity_request) =
  assoc_to_yojson
    [
      ("PoolId", Some (pool_id_or_arn_to_yojson x.pool_id));
      ("OriginationIdentity", Some (phone_or_sender_id_or_arn_to_yojson x.origination_identity));
      ("IsoCountryCode", option_to_yojson iso_country_code_to_yojson x.iso_country_code);
      ( "ClientToken",
        Some
          (client_token_to_yojson
             (Option.value x.client_token ~default:(Smaws_Lib.Uuid.generate ()))) );
    ]

let disassociate_protect_configuration_result_to_yojson
    (x : disassociate_protect_configuration_result) =
  assoc_to_yojson
    [
      ( "ConfigurationSetArn",
        Some (Smaws_Lib.Smithy_api.Json_serializers.string__to_yojson x.configuration_set_arn) );
      ("ConfigurationSetName", Some (configuration_set_name_to_yojson x.configuration_set_name));
      ( "ProtectConfigurationArn",
        Some (protect_configuration_arn_to_yojson x.protect_configuration_arn) );
      ( "ProtectConfigurationId",
        Some (protect_configuration_id_to_yojson x.protect_configuration_id) );
    ]

let disassociate_protect_configuration_request_to_yojson
    (x : disassociate_protect_configuration_request) =
  assoc_to_yojson
    [
      ( "ProtectConfigurationId",
        Some (protect_configuration_id_or_arn_to_yojson x.protect_configuration_id) );
      ( "ConfigurationSetName",
        Some (configuration_set_name_or_arn_to_yojson x.configuration_set_name) );
    ]

let discard_registration_version_result_to_yojson (x : discard_registration_version_result) =
  assoc_to_yojson
    [
      ( "RegistrationArn",
        Some (Smaws_Lib.Smithy_api.Json_serializers.string__to_yojson x.registration_arn) );
      ( "RegistrationId",
        Some (Smaws_Lib.Smithy_api.Json_serializers.string__to_yojson x.registration_id) );
      ("VersionNumber", Some (registration_version_number_to_yojson x.version_number));
      ( "RegistrationVersionStatus",
        Some (registration_version_status_to_yojson x.registration_version_status) );
      ( "RegistrationVersionStatusHistory",
        Some (registration_version_status_history_to_yojson x.registration_version_status_history)
      );
    ]

let discard_registration_version_request_to_yojson (x : discard_registration_version_request) =
  assoc_to_yojson [ ("RegistrationId", Some (registration_id_or_arn_to_yojson x.registration_id)) ]

let protect_status_to_yojson (x : protect_status) =
  match x with
  | ALLOW -> `String "ALLOW"
  | BLOCK -> `String "BLOCK"
  | MONITOR -> `String "MONITOR"
  | FILTER -> `String "FILTER"

let protect_configuration_country_rule_set_information_to_yojson
    (x : protect_configuration_country_rule_set_information) =
  assoc_to_yojson [ ("ProtectStatus", Some (protect_status_to_yojson x.protect_status)) ]

let protect_configuration_country_rule_set_to_yojson tree =
  map_to_yojson iso_country_code_to_yojson
    protect_configuration_country_rule_set_information_to_yojson tree

let get_protect_configuration_country_rule_set_result_to_yojson
    (x : get_protect_configuration_country_rule_set_result) =
  assoc_to_yojson
    [
      ( "ProtectConfigurationArn",
        Some (protect_configuration_arn_to_yojson x.protect_configuration_arn) );
      ( "ProtectConfigurationId",
        Some (protect_configuration_id_to_yojson x.protect_configuration_id) );
      ("NumberCapability", Some (number_capability_to_yojson x.number_capability));
      ("CountryRuleSet", Some (protect_configuration_country_rule_set_to_yojson x.country_rule_set));
    ]

let get_protect_configuration_country_rule_set_request_to_yojson
    (x : get_protect_configuration_country_rule_set_request) =
  assoc_to_yojson
    [
      ( "ProtectConfigurationId",
        Some (protect_configuration_id_or_arn_to_yojson x.protect_configuration_id) );
      ("NumberCapability", Some (number_capability_to_yojson x.number_capability));
    ]

let get_resource_policy_result_to_yojson (x : get_resource_policy_result) =
  assoc_to_yojson
    [
      ("ResourceArn", option_to_yojson amazon_resource_name_to_yojson x.resource_arn);
      ("Policy", option_to_yojson resource_policy_to_yojson x.policy);
      ( "CreatedTimestamp",
        option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.timestamp_epoch_seconds_to_yojson
          x.created_timestamp );
    ]

let get_resource_policy_request_to_yojson (x : get_resource_policy_request) =
  assoc_to_yojson [ ("ResourceArn", Some (amazon_resource_name_to_yojson x.resource_arn)) ]

let iam_role_arn_or_unset_to_yojson = string_to_yojson

let language_code_to_yojson (x : language_code) =
  match x with
  | DE_DE -> `String "DE_DE"
  | EN_GB -> `String "EN_GB"
  | EN_US -> `String "EN_US"
  | ES_419 -> `String "ES_419"
  | ES_ES -> `String "ES_ES"
  | FR_CA -> `String "FR_CA"
  | FR_FR -> `String "FR_FR"
  | IT_IT -> `String "IT_IT"
  | JA_JP -> `String "JA_JP"
  | KO_KR -> `String "KO_KR"
  | PT_BR -> `String "PT_BR"
  | ZH_CN -> `String "ZH_CN"
  | ZH_TW -> `String "ZH_TW"

let notify_tier_list_to_yojson tree = list_to_yojson notify_configuration_tier_to_yojson tree

let notify_use_case_list_to_yojson tree =
  list_to_yojson notify_configuration_use_case_to_yojson tree

let notify_country_information_to_yojson (x : notify_country_information) =
  assoc_to_yojson
    [
      ("IsoCountryCode", Some (iso_country_code_to_yojson x.iso_country_code));
      ("CountryName", Some (Smaws_Lib.Smithy_api.Json_serializers.string__to_yojson x.country_name));
      ("SupportedChannels", Some (notify_enabled_channels_list_to_yojson x.supported_channels));
      ("SupportedUseCases", Some (notify_use_case_list_to_yojson x.supported_use_cases));
      ("SupportedTiers", Some (notify_tier_list_to_yojson x.supported_tiers));
      ( "CustomerOwnedIdentityRequired",
        Some
          (Smaws_Lib.Smithy_api.Json_serializers.primitive_boolean_to_yojson
             x.customer_owned_identity_required) );
    ]

let notify_country_information_list_to_yojson tree =
  list_to_yojson notify_country_information_to_yojson tree

let list_notify_countries_result_to_yojson (x : list_notify_countries_result) =
  assoc_to_yojson
    [
      ( "NotifyCountries",
        option_to_yojson notify_country_information_list_to_yojson x.notify_countries );
      ("NextToken", option_to_yojson next_token_to_yojson x.next_token);
    ]

let list_notify_countries_request_to_yojson (x : list_notify_countries_request) =
  assoc_to_yojson
    [
      ("Channels", option_to_yojson notify_enabled_channels_list_to_yojson x.channels);
      ("UseCases", option_to_yojson notify_use_case_list_to_yojson x.use_cases);
      ("Tier", option_to_yojson notify_configuration_tier_to_yojson x.tier);
      ("NextToken", option_to_yojson next_token_to_yojson x.next_token);
      ("MaxResults", option_to_yojson max_results_to_yojson x.max_results);
    ]

let origination_identity_metadata_to_yojson (x : origination_identity_metadata) =
  assoc_to_yojson
    [
      ( "OriginationIdentityArn",
        Some (Smaws_Lib.Smithy_api.Json_serializers.string__to_yojson x.origination_identity_arn) );
      ( "OriginationIdentity",
        Some (Smaws_Lib.Smithy_api.Json_serializers.string__to_yojson x.origination_identity) );
      ("IsoCountryCode", Some (iso_country_code_to_yojson x.iso_country_code));
      ("NumberCapabilities", Some (number_capability_list_to_yojson x.number_capabilities));
      ("PhoneNumber", option_to_yojson phone_number_to_yojson x.phone_number);
    ]

let origination_identity_metadata_list_to_yojson tree =
  list_to_yojson origination_identity_metadata_to_yojson tree

let list_pool_origination_identities_result_to_yojson (x : list_pool_origination_identities_result)
    =
  assoc_to_yojson
    [
      ( "PoolArn",
        option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.string__to_yojson x.pool_arn );
      ("PoolId", option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.string__to_yojson x.pool_id);
      ( "OriginationIdentities",
        option_to_yojson origination_identity_metadata_list_to_yojson x.origination_identities );
      ("NextToken", option_to_yojson next_token_to_yojson x.next_token);
    ]

let pool_origination_identities_filter_name_to_yojson (x : pool_origination_identities_filter_name)
    =
  match x with
  | ISO_COUNTRY_CODE -> `String "iso-country-code"
  | NUMBER_CAPABILITY -> `String "number-capability"

let pool_origination_identities_filter_to_yojson (x : pool_origination_identities_filter) =
  assoc_to_yojson
    [
      ("Name", Some (pool_origination_identities_filter_name_to_yojson x.name));
      ("Values", Some (filter_value_list_to_yojson x.values));
    ]

let pool_origination_identities_filter_list_to_yojson tree =
  list_to_yojson pool_origination_identities_filter_to_yojson tree

let list_pool_origination_identities_request_to_yojson
    (x : list_pool_origination_identities_request) =
  assoc_to_yojson
    [
      ("PoolId", Some (pool_id_or_arn_to_yojson x.pool_id));
      ("Filters", option_to_yojson pool_origination_identities_filter_list_to_yojson x.filters);
      ("NextToken", option_to_yojson next_token_to_yojson x.next_token);
      ("MaxResults", option_to_yojson max_results_to_yojson x.max_results);
    ]

let protect_configuration_rule_set_number_override_filter_name_to_yojson
    (x : protect_configuration_rule_set_number_override_filter_name) =
  match x with
  | ISO_COUNTRY_CODE -> `String "iso-country-code"
  | DESTINATION_PHONE_NUMBER_BEGINS_WITH -> `String "destination-phone-number-begins-with"
  | ACTION -> `String "action"
  | EXPIRES_BEFORE -> `String "expires-before"
  | EXPIRES_AFTER -> `String "expires-after"
  | CREATED_BEFORE -> `String "created-before"
  | CREATED_AFTER -> `String "created-after"

let protect_configuration_rule_set_number_override_filter_item_to_yojson
    (x : protect_configuration_rule_set_number_override_filter_item) =
  assoc_to_yojson
    [
      ("Name", Some (protect_configuration_rule_set_number_override_filter_name_to_yojson x.name));
      ("Values", Some (filter_value_list_to_yojson x.values));
    ]

let list_protect_configuration_rule_set_number_override_filter_to_yojson tree =
  list_to_yojson protect_configuration_rule_set_number_override_filter_item_to_yojson tree

let protect_configuration_rule_set_number_override_to_yojson
    (x : protect_configuration_rule_set_number_override) =
  assoc_to_yojson
    [
      ("DestinationPhoneNumber", Some (phone_number_to_yojson x.destination_phone_number));
      ( "CreatedTimestamp",
        Some
          (Smaws_Lib.Smithy_api.Json_serializers.timestamp_epoch_seconds_to_yojson
             x.created_timestamp) );
      ("Action", Some (protect_configuration_rule_override_action_to_yojson x.action));
      ("IsoCountryCode", option_to_yojson iso_country_code_to_yojson x.iso_country_code);
      ( "ExpirationTimestamp",
        option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.timestamp_epoch_seconds_to_yojson
          x.expiration_timestamp );
    ]

let protect_configuration_rule_set_number_override_list_to_yojson tree =
  list_to_yojson protect_configuration_rule_set_number_override_to_yojson tree

let list_protect_configuration_rule_set_number_overrides_result_to_yojson
    (x : list_protect_configuration_rule_set_number_overrides_result) =
  assoc_to_yojson
    [
      ( "ProtectConfigurationArn",
        Some (protect_configuration_arn_to_yojson x.protect_configuration_arn) );
      ( "ProtectConfigurationId",
        Some (protect_configuration_id_to_yojson x.protect_configuration_id) );
      ( "RuleSetNumberOverrides",
        option_to_yojson protect_configuration_rule_set_number_override_list_to_yojson
          x.rule_set_number_overrides );
      ("NextToken", option_to_yojson next_token_to_yojson x.next_token);
    ]

let list_protect_configuration_rule_set_number_overrides_request_to_yojson
    (x : list_protect_configuration_rule_set_number_overrides_request) =
  assoc_to_yojson
    [
      ( "ProtectConfigurationId",
        Some (protect_configuration_id_or_arn_to_yojson x.protect_configuration_id) );
      ( "Filters",
        option_to_yojson list_protect_configuration_rule_set_number_override_filter_to_yojson
          x.filters );
      ("NextToken", option_to_yojson next_token_to_yojson x.next_token);
      ("MaxResults", option_to_yojson max_results_to_yojson x.max_results);
    ]

let registration_association_metadata_to_yojson (x : registration_association_metadata) =
  assoc_to_yojson
    [
      ("ResourceArn", Some (Smaws_Lib.Smithy_api.Json_serializers.string__to_yojson x.resource_arn));
      ("ResourceId", Some (Smaws_Lib.Smithy_api.Json_serializers.string__to_yojson x.resource_id));
      ( "ResourceType",
        Some (Smaws_Lib.Smithy_api.Json_serializers.string__to_yojson x.resource_type) );
      ("IsoCountryCode", option_to_yojson iso_country_code_to_yojson x.iso_country_code);
      ("PhoneNumber", option_to_yojson phone_number_to_yojson x.phone_number);
    ]

let registration_association_metadata_list_to_yojson tree =
  list_to_yojson registration_association_metadata_to_yojson tree

let list_registration_associations_result_to_yojson (x : list_registration_associations_result) =
  assoc_to_yojson
    [
      ( "RegistrationArn",
        Some (Smaws_Lib.Smithy_api.Json_serializers.string__to_yojson x.registration_arn) );
      ( "RegistrationId",
        Some (Smaws_Lib.Smithy_api.Json_serializers.string__to_yojson x.registration_id) );
      ("RegistrationType", Some (registration_type_to_yojson x.registration_type));
      ( "RegistrationAssociations",
        Some (registration_association_metadata_list_to_yojson x.registration_associations) );
      ("NextToken", option_to_yojson next_token_to_yojson x.next_token);
    ]

let registration_association_filter_name_to_yojson (x : registration_association_filter_name) =
  match x with
  | RESOURCE_TYPE -> `String "resource-type"
  | ISO_COUNTRY_CODE -> `String "iso-country-code"

let registration_association_filter_to_yojson (x : registration_association_filter) =
  assoc_to_yojson
    [
      ("Name", Some (registration_association_filter_name_to_yojson x.name));
      ("Values", Some (filter_value_list_to_yojson x.values));
    ]

let registration_association_filter_list_to_yojson tree =
  list_to_yojson registration_association_filter_to_yojson tree

let list_registration_associations_request_to_yojson (x : list_registration_associations_request) =
  assoc_to_yojson
    [
      ("RegistrationId", Some (registration_id_or_arn_to_yojson x.registration_id));
      ("Filters", option_to_yojson registration_association_filter_list_to_yojson x.filters);
      ("NextToken", option_to_yojson next_token_to_yojson x.next_token);
      ("MaxResults", option_to_yojson max_results_to_yojson x.max_results);
    ]

let list_tags_for_resource_result_to_yojson (x : list_tags_for_resource_result) =
  assoc_to_yojson
    [
      ("ResourceArn", option_to_yojson amazon_resource_name_to_yojson x.resource_arn);
      ("Tags", option_to_yojson tag_list_to_yojson x.tags);
    ]

let list_tags_for_resource_request_to_yojson (x : list_tags_for_resource_request) =
  assoc_to_yojson [ ("ResourceArn", Some (amazon_resource_name_to_yojson x.resource_arn)) ]

let max_price_to_yojson = string_to_yojson
let media_message_origination_identity_to_yojson = string_to_yojson
let media_url_value_to_yojson = string_to_yojson
let media_url_list_to_yojson tree = list_to_yojson media_url_value_to_yojson tree

let message_feedback_status_to_yojson (x : message_feedback_status) =
  match x with RECEIVED -> `String "RECEIVED" | FAILED -> `String "FAILED"

let message_id_to_yojson = string_to_yojson
let non_empty_tag_list_to_yojson tree = list_to_yojson tag_to_yojson tree
let notify_pool_id_or_unset_to_yojson = string_to_yojson

let verify_destination_number_result_to_yojson (x : verify_destination_number_result) =
  assoc_to_yojson
    [
      ( "VerifiedDestinationNumberArn",
        Some
          (Smaws_Lib.Smithy_api.Json_serializers.string__to_yojson x.verified_destination_number_arn)
      );
      ( "VerifiedDestinationNumberId",
        Some
          (Smaws_Lib.Smithy_api.Json_serializers.string__to_yojson x.verified_destination_number_id)
      );
      ("DestinationPhoneNumber", Some (phone_number_to_yojson x.destination_phone_number));
      ("Status", Some (verification_status_to_yojson x.status));
      ( "CreatedTimestamp",
        Some
          (Smaws_Lib.Smithy_api.Json_serializers.timestamp_epoch_seconds_to_yojson
             x.created_timestamp) );
    ]

let verification_code_to_yojson = string_to_yojson

let verify_destination_number_request_to_yojson (x : verify_destination_number_request) =
  assoc_to_yojson
    [
      ( "VerifiedDestinationNumberId",
        Some (verified_destination_number_id_or_arn_to_yojson x.verified_destination_number_id) );
      ("VerificationCode", Some (verification_code_to_yojson x.verification_code));
    ]

let update_sender_id_result_to_yojson (x : update_sender_id_result) =
  assoc_to_yojson
    [
      ("SenderIdArn", Some (Smaws_Lib.Smithy_api.Json_serializers.string__to_yojson x.sender_id_arn));
      ("SenderId", Some (sender_id_to_yojson x.sender_id));
      ("IsoCountryCode", Some (iso_country_code_to_yojson x.iso_country_code));
      ("MessageTypes", Some (message_type_list_to_yojson x.message_types));
      ( "MonthlyLeasingPrice",
        Some (Smaws_Lib.Smithy_api.Json_serializers.string__to_yojson x.monthly_leasing_price) );
      ( "DeletionProtectionEnabled",
        Some
          (Smaws_Lib.Smithy_api.Json_serializers.primitive_boolean_to_yojson
             x.deletion_protection_enabled) );
      ( "Registered",
        Some (Smaws_Lib.Smithy_api.Json_serializers.primitive_boolean_to_yojson x.registered) );
      ( "RegistrationId",
        option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.string__to_yojson x.registration_id
      );
    ]

let update_sender_id_request_to_yojson (x : update_sender_id_request) =
  assoc_to_yojson
    [
      ("SenderId", Some (sender_id_or_arn_to_yojson x.sender_id));
      ("IsoCountryCode", Some (iso_country_code_to_yojson x.iso_country_code));
      ( "DeletionProtectionEnabled",
        option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.boolean__to_yojson
          x.deletion_protection_enabled );
    ]

let update_rcs_agent_result_to_yojson (x : update_rcs_agent_result) =
  assoc_to_yojson
    [
      ("RcsAgentArn", Some (Smaws_Lib.Smithy_api.Json_serializers.string__to_yojson x.rcs_agent_arn));
      ("RcsAgentId", Some (Smaws_Lib.Smithy_api.Json_serializers.string__to_yojson x.rcs_agent_id));
      ("Status", Some (rcs_agent_status_to_yojson x.status));
      ( "CreatedTimestamp",
        Some
          (Smaws_Lib.Smithy_api.Json_serializers.timestamp_epoch_seconds_to_yojson
             x.created_timestamp) );
      ( "DeletionProtectionEnabled",
        Some
          (Smaws_Lib.Smithy_api.Json_serializers.primitive_boolean_to_yojson
             x.deletion_protection_enabled) );
      ("OptOutListName", option_to_yojson opt_out_list_name_to_yojson x.opt_out_list_name);
      ( "SelfManagedOptOutsEnabled",
        Some
          (Smaws_Lib.Smithy_api.Json_serializers.primitive_boolean_to_yojson
             x.self_managed_opt_outs_enabled) );
      ("TwoWayChannelArn", option_to_yojson two_way_channel_arn_to_yojson x.two_way_channel_arn);
      ("TwoWayChannelRole", option_to_yojson iam_role_arn_to_yojson x.two_way_channel_role);
      ( "TwoWayEnabled",
        Some (Smaws_Lib.Smithy_api.Json_serializers.primitive_boolean_to_yojson x.two_way_enabled)
      );
      ( "TwoWayMediaS3BucketName",
        option_to_yojson two_way_media_s3_bucket_name_to_yojson x.two_way_media_s3_bucket_name );
      ( "TwoWayMediaS3KeyPrefix",
        option_to_yojson two_way_media_s3_key_prefix_to_yojson x.two_way_media_s3_key_prefix );
      ("TwoWayMediaS3Role", option_to_yojson iam_role_arn_to_yojson x.two_way_media_s3_role);
      ( "TwoWayRcsEventsEnabled",
        option_to_yojson rcs_event_type_list_to_yojson x.two_way_rcs_events_enabled );
    ]

let two_way_media_s3_bucket_name_or_unset_to_yojson = string_to_yojson

let update_rcs_agent_request_to_yojson (x : update_rcs_agent_request) =
  assoc_to_yojson
    [
      ("RcsAgentId", Some (rcs_agent_id_or_arn_to_yojson x.rcs_agent_id));
      ( "DeletionProtectionEnabled",
        option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.boolean__to_yojson
          x.deletion_protection_enabled );
      ("OptOutListName", option_to_yojson opt_out_list_name_or_arn_to_yojson x.opt_out_list_name);
      ( "SelfManagedOptOutsEnabled",
        option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.boolean__to_yojson
          x.self_managed_opt_outs_enabled );
      ("TwoWayChannelArn", option_to_yojson two_way_channel_arn_to_yojson x.two_way_channel_arn);
      ("TwoWayChannelRole", option_to_yojson iam_role_arn_to_yojson x.two_way_channel_role);
      ( "TwoWayEnabled",
        option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.boolean__to_yojson x.two_way_enabled
      );
      ( "TwoWayMediaS3BucketName",
        option_to_yojson two_way_media_s3_bucket_name_or_unset_to_yojson
          x.two_way_media_s3_bucket_name );
      ( "TwoWayMediaS3KeyPrefix",
        option_to_yojson two_way_media_s3_key_prefix_to_yojson x.two_way_media_s3_key_prefix );
      ("TwoWayMediaS3Role", option_to_yojson iam_role_arn_or_unset_to_yojson x.two_way_media_s3_role);
      ( "TwoWayRcsEventsEnabled",
        option_to_yojson rcs_event_type_list_to_yojson x.two_way_rcs_events_enabled );
    ]

let update_protect_configuration_country_rule_set_result_to_yojson
    (x : update_protect_configuration_country_rule_set_result) =
  assoc_to_yojson
    [
      ( "ProtectConfigurationArn",
        Some (protect_configuration_arn_to_yojson x.protect_configuration_arn) );
      ( "ProtectConfigurationId",
        Some (protect_configuration_id_to_yojson x.protect_configuration_id) );
      ("NumberCapability", Some (number_capability_to_yojson x.number_capability));
      ("CountryRuleSet", Some (protect_configuration_country_rule_set_to_yojson x.country_rule_set));
    ]

let update_protect_configuration_country_rule_set_request_to_yojson
    (x : update_protect_configuration_country_rule_set_request) =
  assoc_to_yojson
    [
      ( "ProtectConfigurationId",
        Some (protect_configuration_id_or_arn_to_yojson x.protect_configuration_id) );
      ("NumberCapability", Some (number_capability_to_yojson x.number_capability));
      ( "CountryRuleSetUpdates",
        Some (protect_configuration_country_rule_set_to_yojson x.country_rule_set_updates) );
    ]

let update_protect_configuration_result_to_yojson (x : update_protect_configuration_result) =
  assoc_to_yojson
    [
      ( "ProtectConfigurationArn",
        Some (protect_configuration_arn_to_yojson x.protect_configuration_arn) );
      ( "ProtectConfigurationId",
        Some (protect_configuration_id_to_yojson x.protect_configuration_id) );
      ( "CreatedTimestamp",
        Some
          (Smaws_Lib.Smithy_api.Json_serializers.timestamp_epoch_seconds_to_yojson
             x.created_timestamp) );
      ( "AccountDefault",
        Some (Smaws_Lib.Smithy_api.Json_serializers.primitive_boolean_to_yojson x.account_default)
      );
      ( "DeletionProtectionEnabled",
        Some
          (Smaws_Lib.Smithy_api.Json_serializers.primitive_boolean_to_yojson
             x.deletion_protection_enabled) );
    ]

let update_protect_configuration_request_to_yojson (x : update_protect_configuration_request) =
  assoc_to_yojson
    [
      ( "ProtectConfigurationId",
        Some (protect_configuration_id_or_arn_to_yojson x.protect_configuration_id) );
      ( "DeletionProtectionEnabled",
        option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.boolean__to_yojson
          x.deletion_protection_enabled );
    ]

let update_pool_result_to_yojson (x : update_pool_result) =
  assoc_to_yojson
    [
      ( "PoolArn",
        option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.string__to_yojson x.pool_arn );
      ("PoolId", option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.string__to_yojson x.pool_id);
      ("Status", option_to_yojson pool_status_to_yojson x.status);
      ("MessageType", option_to_yojson message_type_to_yojson x.message_type);
      ( "TwoWayEnabled",
        option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.primitive_boolean_to_yojson
          x.two_way_enabled );
      ("TwoWayChannelArn", option_to_yojson two_way_channel_arn_to_yojson x.two_way_channel_arn);
      ("TwoWayChannelRole", option_to_yojson iam_role_arn_to_yojson x.two_way_channel_role);
      ( "SelfManagedOptOutsEnabled",
        option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.primitive_boolean_to_yojson
          x.self_managed_opt_outs_enabled );
      ("OptOutListName", option_to_yojson opt_out_list_name_to_yojson x.opt_out_list_name);
      ( "SharedRoutesEnabled",
        option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.primitive_boolean_to_yojson
          x.shared_routes_enabled );
      ( "DeletionProtectionEnabled",
        option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.primitive_boolean_to_yojson
          x.deletion_protection_enabled );
      ( "CreatedTimestamp",
        option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.timestamp_epoch_seconds_to_yojson
          x.created_timestamp );
    ]

let update_pool_request_to_yojson (x : update_pool_request) =
  assoc_to_yojson
    [
      ("PoolId", Some (pool_id_or_arn_to_yojson x.pool_id));
      ( "TwoWayEnabled",
        option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.boolean__to_yojson x.two_way_enabled
      );
      ("TwoWayChannelArn", option_to_yojson two_way_channel_arn_to_yojson x.two_way_channel_arn);
      ("TwoWayChannelRole", option_to_yojson iam_role_arn_to_yojson x.two_way_channel_role);
      ( "SelfManagedOptOutsEnabled",
        option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.boolean__to_yojson
          x.self_managed_opt_outs_enabled );
      ("OptOutListName", option_to_yojson opt_out_list_name_or_arn_to_yojson x.opt_out_list_name);
      ( "SharedRoutesEnabled",
        option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.boolean__to_yojson
          x.shared_routes_enabled );
      ( "DeletionProtectionEnabled",
        option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.boolean__to_yojson
          x.deletion_protection_enabled );
    ]

let update_phone_number_result_to_yojson (x : update_phone_number_result) =
  assoc_to_yojson
    [
      ( "PhoneNumberArn",
        option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.string__to_yojson x.phone_number_arn
      );
      ( "PhoneNumberId",
        option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.string__to_yojson x.phone_number_id
      );
      ("PhoneNumber", option_to_yojson phone_number_to_yojson x.phone_number);
      ("Status", option_to_yojson number_status_to_yojson x.status);
      ("IsoCountryCode", option_to_yojson iso_country_code_to_yojson x.iso_country_code);
      ("MessageType", option_to_yojson message_type_to_yojson x.message_type);
      ("NumberCapabilities", option_to_yojson number_capability_list_to_yojson x.number_capabilities);
      ("NumberType", option_to_yojson number_type_to_yojson x.number_type);
      ( "MonthlyLeasingPrice",
        option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.string__to_yojson
          x.monthly_leasing_price );
      ( "TwoWayEnabled",
        option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.primitive_boolean_to_yojson
          x.two_way_enabled );
      ("TwoWayChannelArn", option_to_yojson two_way_channel_arn_to_yojson x.two_way_channel_arn);
      ("TwoWayChannelRole", option_to_yojson iam_role_arn_to_yojson x.two_way_channel_role);
      ( "SelfManagedOptOutsEnabled",
        option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.primitive_boolean_to_yojson
          x.self_managed_opt_outs_enabled );
      ("OptOutListName", option_to_yojson opt_out_list_name_to_yojson x.opt_out_list_name);
      ( "InternationalSendingEnabled",
        option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.primitive_boolean_to_yojson
          x.international_sending_enabled );
      ( "DeletionProtectionEnabled",
        option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.primitive_boolean_to_yojson
          x.deletion_protection_enabled );
      ( "RegistrationId",
        option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.string__to_yojson x.registration_id
      );
      ( "CreatedTimestamp",
        option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.timestamp_epoch_seconds_to_yojson
          x.created_timestamp );
    ]

let update_phone_number_request_to_yojson (x : update_phone_number_request) =
  assoc_to_yojson
    [
      ("PhoneNumberId", Some (phone_number_id_or_arn_to_yojson x.phone_number_id));
      ( "TwoWayEnabled",
        option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.boolean__to_yojson x.two_way_enabled
      );
      ("TwoWayChannelArn", option_to_yojson two_way_channel_arn_to_yojson x.two_way_channel_arn);
      ("TwoWayChannelRole", option_to_yojson iam_role_arn_to_yojson x.two_way_channel_role);
      ( "SelfManagedOptOutsEnabled",
        option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.boolean__to_yojson
          x.self_managed_opt_outs_enabled );
      ("OptOutListName", option_to_yojson opt_out_list_name_or_arn_to_yojson x.opt_out_list_name);
      ( "InternationalSendingEnabled",
        option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.boolean__to_yojson
          x.international_sending_enabled );
      ( "DeletionProtectionEnabled",
        option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.boolean__to_yojson
          x.deletion_protection_enabled );
    ]

let update_notify_configuration_result_to_yojson (x : update_notify_configuration_result) =
  assoc_to_yojson
    [
      ( "NotifyConfigurationArn",
        Some (notify_configuration_arn_to_yojson x.notify_configuration_arn) );
      ("NotifyConfigurationId", Some (notify_configuration_id_to_yojson x.notify_configuration_id));
      ("DisplayName", Some (notify_configuration_display_name_to_yojson x.display_name));
      ("UseCase", Some (notify_configuration_use_case_to_yojson x.use_case));
      ("DefaultTemplateId", option_to_yojson notify_template_id_to_yojson x.default_template_id);
      ("PoolId", option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.string__to_yojson x.pool_id);
      ("EnabledCountries", option_to_yojson iso_country_code_list_to_yojson x.enabled_countries);
      ("EnabledChannels", Some (notify_enabled_channels_list_to_yojson x.enabled_channels));
      ("Tier", Some (notify_configuration_tier_to_yojson x.tier));
      ("TierUpgradeStatus", Some (tier_upgrade_status_to_yojson x.tier_upgrade_status));
      ("Status", Some (notify_configuration_status_to_yojson x.status));
      ( "RejectionReason",
        option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.string__to_yojson x.rejection_reason
      );
      ( "DeletionProtectionEnabled",
        Some
          (Smaws_Lib.Smithy_api.Json_serializers.primitive_boolean_to_yojson
             x.deletion_protection_enabled) );
      ( "CreatedTimestamp",
        Some
          (Smaws_Lib.Smithy_api.Json_serializers.timestamp_epoch_seconds_to_yojson
             x.created_timestamp) );
    ]

let update_notify_configuration_request_to_yojson (x : update_notify_configuration_request) =
  assoc_to_yojson
    [
      ( "NotifyConfigurationId",
        Some (notify_configuration_id_or_arn_to_yojson x.notify_configuration_id) );
      ("DefaultTemplateId", option_to_yojson notify_template_id_to_yojson x.default_template_id);
      ("PoolId", option_to_yojson notify_pool_id_or_unset_to_yojson x.pool_id);
      ("EnabledCountries", option_to_yojson iso_country_code_list_to_yojson x.enabled_countries);
      ("EnabledChannels", option_to_yojson notify_enabled_channels_list_to_yojson x.enabled_channels);
      ( "DeletionProtectionEnabled",
        option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.boolean__to_yojson
          x.deletion_protection_enabled );
    ]

let update_event_destination_result_to_yojson (x : update_event_destination_result) =
  assoc_to_yojson
    [
      ( "ConfigurationSetArn",
        option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.string__to_yojson
          x.configuration_set_arn );
      ( "ConfigurationSetName",
        option_to_yojson configuration_set_name_to_yojson x.configuration_set_name );
      ("EventDestination", option_to_yojson event_destination_to_yojson x.event_destination);
    ]

let update_event_destination_request_to_yojson (x : update_event_destination_request) =
  assoc_to_yojson
    [
      ( "ConfigurationSetName",
        Some (configuration_set_name_or_arn_to_yojson x.configuration_set_name) );
      ("EventDestinationName", Some (event_destination_name_to_yojson x.event_destination_name));
      ( "Enabled",
        option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.boolean__to_yojson x.enabled );
      ("MatchingEventTypes", option_to_yojson event_type_list_to_yojson x.matching_event_types);
      ( "CloudWatchLogsDestination",
        option_to_yojson cloud_watch_logs_destination_to_yojson x.cloud_watch_logs_destination );
      ( "KinesisFirehoseDestination",
        option_to_yojson kinesis_firehose_destination_to_yojson x.kinesis_firehose_destination );
      ("SnsDestination", option_to_yojson sns_destination_to_yojson x.sns_destination);
    ]

let untag_resource_result_to_yojson = unit_to_yojson
let tag_key_list_to_yojson tree = list_to_yojson tag_key_to_yojson tree

let untag_resource_request_to_yojson (x : untag_resource_request) =
  assoc_to_yojson
    [
      ("ResourceArn", Some (amazon_resource_name_to_yojson x.resource_arn));
      ("TagKeys", Some (tag_key_list_to_yojson x.tag_keys));
    ]

let tag_resource_result_to_yojson = unit_to_yojson

let tag_resource_request_to_yojson (x : tag_resource_request) =
  assoc_to_yojson
    [
      ("ResourceArn", Some (amazon_resource_name_to_yojson x.resource_arn));
      ("Tags", Some (non_empty_tag_list_to_yojson x.tags));
    ]

let submit_registration_version_result_to_yojson (x : submit_registration_version_result) =
  assoc_to_yojson
    [
      ( "RegistrationArn",
        Some (Smaws_Lib.Smithy_api.Json_serializers.string__to_yojson x.registration_arn) );
      ( "RegistrationId",
        Some (Smaws_Lib.Smithy_api.Json_serializers.string__to_yojson x.registration_id) );
      ("VersionNumber", Some (registration_version_number_to_yojson x.version_number));
      ( "RegistrationVersionStatus",
        Some (registration_version_status_to_yojson x.registration_version_status) );
      ( "RegistrationVersionStatusHistory",
        Some (registration_version_status_history_to_yojson x.registration_version_status_history)
      );
      ( "AwsReview",
        Some (Smaws_Lib.Smithy_api.Json_serializers.primitive_boolean_to_yojson x.aws_review) );
    ]

let submit_registration_version_request_to_yojson (x : submit_registration_version_request) =
  assoc_to_yojson
    [
      ("RegistrationId", Some (registration_id_or_arn_to_yojson x.registration_id));
      ( "AwsReview",
        option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.primitive_boolean_to_yojson
          x.aws_review );
    ]

let set_voice_message_spend_limit_override_result_to_yojson
    (x : set_voice_message_spend_limit_override_result) =
  assoc_to_yojson [ ("MonthlyLimit", option_to_yojson monthly_limit_to_yojson x.monthly_limit) ]

let set_voice_message_spend_limit_override_request_to_yojson
    (x : set_voice_message_spend_limit_override_request) =
  assoc_to_yojson [ ("MonthlyLimit", Some (monthly_limit_to_yojson x.monthly_limit)) ]

let set_text_message_spend_limit_override_result_to_yojson
    (x : set_text_message_spend_limit_override_result) =
  assoc_to_yojson [ ("MonthlyLimit", option_to_yojson monthly_limit_to_yojson x.monthly_limit) ]

let set_text_message_spend_limit_override_request_to_yojson
    (x : set_text_message_spend_limit_override_request) =
  assoc_to_yojson [ ("MonthlyLimit", Some (monthly_limit_to_yojson x.monthly_limit)) ]

let set_rcs_message_spend_limit_override_result_to_yojson
    (x : set_rcs_message_spend_limit_override_result) =
  assoc_to_yojson [ ("MonthlyLimit", option_to_yojson monthly_limit_to_yojson x.monthly_limit) ]

let set_rcs_message_spend_limit_override_request_to_yojson
    (x : set_rcs_message_spend_limit_override_request) =
  assoc_to_yojson [ ("MonthlyLimit", Some (monthly_limit_to_yojson x.monthly_limit)) ]

let set_notify_message_spend_limit_override_result_to_yojson
    (x : set_notify_message_spend_limit_override_result) =
  assoc_to_yojson [ ("MonthlyLimit", option_to_yojson monthly_limit_to_yojson x.monthly_limit) ]

let set_notify_message_spend_limit_override_request_to_yojson
    (x : set_notify_message_spend_limit_override_request) =
  assoc_to_yojson [ ("MonthlyLimit", Some (monthly_limit_to_yojson x.monthly_limit)) ]

let set_media_message_spend_limit_override_result_to_yojson
    (x : set_media_message_spend_limit_override_result) =
  assoc_to_yojson [ ("MonthlyLimit", option_to_yojson monthly_limit_to_yojson x.monthly_limit) ]

let set_media_message_spend_limit_override_request_to_yojson
    (x : set_media_message_spend_limit_override_request) =
  assoc_to_yojson [ ("MonthlyLimit", Some (monthly_limit_to_yojson x.monthly_limit)) ]

let set_default_sender_id_result_to_yojson (x : set_default_sender_id_result) =
  assoc_to_yojson
    [
      ( "ConfigurationSetArn",
        option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.string__to_yojson
          x.configuration_set_arn );
      ( "ConfigurationSetName",
        option_to_yojson configuration_set_name_to_yojson x.configuration_set_name );
      ("SenderId", option_to_yojson sender_id_to_yojson x.sender_id);
    ]

let set_default_sender_id_request_to_yojson (x : set_default_sender_id_request) =
  assoc_to_yojson
    [
      ( "ConfigurationSetName",
        Some (configuration_set_name_or_arn_to_yojson x.configuration_set_name) );
      ("SenderId", Some (sender_id_to_yojson x.sender_id));
    ]

let set_default_message_type_result_to_yojson (x : set_default_message_type_result) =
  assoc_to_yojson
    [
      ( "ConfigurationSetArn",
        option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.string__to_yojson
          x.configuration_set_arn );
      ( "ConfigurationSetName",
        option_to_yojson configuration_set_name_to_yojson x.configuration_set_name );
      ("MessageType", option_to_yojson message_type_to_yojson x.message_type);
    ]

let set_default_message_type_request_to_yojson (x : set_default_message_type_request) =
  assoc_to_yojson
    [
      ( "ConfigurationSetName",
        Some (configuration_set_name_or_arn_to_yojson x.configuration_set_name) );
      ("MessageType", Some (message_type_to_yojson x.message_type));
    ]

let set_default_message_feedback_enabled_result_to_yojson
    (x : set_default_message_feedback_enabled_result) =
  assoc_to_yojson
    [
      ( "ConfigurationSetArn",
        option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.string__to_yojson
          x.configuration_set_arn );
      ( "ConfigurationSetName",
        option_to_yojson configuration_set_name_to_yojson x.configuration_set_name );
      ( "MessageFeedbackEnabled",
        option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.boolean__to_yojson
          x.message_feedback_enabled );
    ]

let set_default_message_feedback_enabled_request_to_yojson
    (x : set_default_message_feedback_enabled_request) =
  assoc_to_yojson
    [
      ( "ConfigurationSetName",
        Some (configuration_set_name_or_arn_to_yojson x.configuration_set_name) );
      ( "MessageFeedbackEnabled",
        Some (Smaws_Lib.Smithy_api.Json_serializers.boolean__to_yojson x.message_feedback_enabled)
      );
    ]

let set_account_default_protect_configuration_result_to_yojson
    (x : set_account_default_protect_configuration_result) =
  assoc_to_yojson
    [
      ( "DefaultProtectConfigurationArn",
        Some (protect_configuration_arn_to_yojson x.default_protect_configuration_arn) );
      ( "DefaultProtectConfigurationId",
        Some (protect_configuration_id_to_yojson x.default_protect_configuration_id) );
    ]

let set_account_default_protect_configuration_request_to_yojson
    (x : set_account_default_protect_configuration_request) =
  assoc_to_yojson
    [
      ( "ProtectConfigurationId",
        Some (protect_configuration_id_or_arn_to_yojson x.protect_configuration_id) );
    ]

let send_voice_message_result_to_yojson (x : send_voice_message_result) =
  assoc_to_yojson
    [
      ( "MessageId",
        option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.string__to_yojson x.message_id );
    ]

let time_to_live_to_yojson = int_to_yojson

let voice_message_body_text_type_to_yojson (x : voice_message_body_text_type) =
  match x with TEXT -> `String "TEXT" | SSML -> `String "SSML"

let voice_message_body_to_yojson = string_to_yojson
let voice_message_origination_identity_to_yojson = string_to_yojson

let send_voice_message_request_to_yojson (x : send_voice_message_request) =
  assoc_to_yojson
    [
      ("DestinationPhoneNumber", Some (phone_number_to_yojson x.destination_phone_number));
      ( "OriginationIdentity",
        Some (voice_message_origination_identity_to_yojson x.origination_identity) );
      ("MessageBody", option_to_yojson voice_message_body_to_yojson x.message_body);
      ( "MessageBodyTextType",
        option_to_yojson voice_message_body_text_type_to_yojson x.message_body_text_type );
      ("VoiceId", option_to_yojson voice_id_to_yojson x.voice_id);
      ( "ConfigurationSetName",
        option_to_yojson configuration_set_name_or_arn_to_yojson x.configuration_set_name );
      ("MaxPricePerMinute", option_to_yojson max_price_to_yojson x.max_price_per_minute);
      ("TimeToLive", option_to_yojson time_to_live_to_yojson x.time_to_live);
      ("Context", option_to_yojson context_map_to_yojson x.context);
      ( "DryRun",
        option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.primitive_boolean_to_yojson x.dry_run
      );
      ( "ProtectConfigurationId",
        option_to_yojson protect_configuration_id_or_arn_to_yojson x.protect_configuration_id );
      ( "MessageFeedbackEnabled",
        option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.boolean__to_yojson
          x.message_feedback_enabled );
    ]

let send_text_message_result_to_yojson (x : send_text_message_result) =
  assoc_to_yojson
    [
      ( "MessageId",
        option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.string__to_yojson x.message_id );
    ]

let text_message_body_to_yojson = string_to_yojson
let text_message_origination_identity_to_yojson = string_to_yojson

let send_text_message_request_to_yojson (x : send_text_message_request) =
  assoc_to_yojson
    [
      ("DestinationPhoneNumber", Some (phone_number_to_yojson x.destination_phone_number));
      ( "OriginationIdentity",
        option_to_yojson text_message_origination_identity_to_yojson x.origination_identity );
      ("MessageBody", option_to_yojson text_message_body_to_yojson x.message_body);
      ("MessageType", option_to_yojson message_type_to_yojson x.message_type);
      ("Keyword", option_to_yojson keyword_to_yojson x.keyword);
      ( "ConfigurationSetName",
        option_to_yojson configuration_set_name_or_arn_to_yojson x.configuration_set_name );
      ("MaxPrice", option_to_yojson max_price_to_yojson x.max_price);
      ("TimeToLive", option_to_yojson time_to_live_to_yojson x.time_to_live);
      ("Context", option_to_yojson context_map_to_yojson x.context);
      ( "DestinationCountryParameters",
        option_to_yojson destination_country_parameters_to_yojson x.destination_country_parameters
      );
      ( "DryRun",
        option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.primitive_boolean_to_yojson x.dry_run
      );
      ( "ProtectConfigurationId",
        option_to_yojson protect_configuration_id_or_arn_to_yojson x.protect_configuration_id );
      ( "MessageFeedbackEnabled",
        option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.boolean__to_yojson
          x.message_feedback_enabled );
    ]

let send_rcs_message_result_to_yojson (x : send_rcs_message_result) =
  assoc_to_yojson
    [
      ( "MessageId",
        option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.string__to_yojson x.message_id );
    ]

let rcs_fallback_origination_identity_to_yojson = string_to_yojson
let rcs_fallback_message_body_to_yojson = string_to_yojson

let rcs_fallback_channel_to_yojson (x : rcs_fallback_channel) =
  match x with SMS -> `String "SMS" | MMS -> `String "MMS"

let rcs_fallback_configuration_to_yojson (x : rcs_fallback_configuration) =
  assoc_to_yojson
    [
      ("Channel", Some (rcs_fallback_channel_to_yojson x.channel));
      ("MessageBody", option_to_yojson rcs_fallback_message_body_to_yojson x.message_body);
      ("MediaUrls", option_to_yojson media_url_list_to_yojson x.media_urls);
      ( "OriginationIdentity",
        option_to_yojson rcs_fallback_origination_identity_to_yojson x.origination_identity );
    ]

let rcs_message_traffic_type_to_yojson = string_to_yojson
let rcs_time_to_live_to_yojson = int_to_yojson
let rcs_calendar_event_description_to_yojson = string_to_yojson
let rcs_calendar_event_title_to_yojson = string_to_yojson
let rcs_postback_data_to_yojson = string_to_yojson
let rcs_suggested_action_text_to_yojson = string_to_yojson

let rcs_create_calendar_event_action_to_yojson (x : rcs_create_calendar_event_action) =
  assoc_to_yojson
    [
      ("Text", Some (rcs_suggested_action_text_to_yojson x.text));
      ("PostbackData", Some (rcs_postback_data_to_yojson x.postback_data));
      ("Title", Some (rcs_calendar_event_title_to_yojson x.title));
      ( "StartTime",
        Some (Smaws_Lib.Smithy_api.Json_serializers.timestamp_epoch_seconds_to_yojson x.start_time)
      );
      ( "EndTime",
        Some (Smaws_Lib.Smithy_api.Json_serializers.timestamp_epoch_seconds_to_yojson x.end_time) );
      ("Description", option_to_yojson rcs_calendar_event_description_to_yojson x.description);
    ]

let rcs_request_location_action_to_yojson (x : rcs_request_location_action) =
  assoc_to_yojson
    [
      ("Text", Some (rcs_suggested_action_text_to_yojson x.text));
      ("PostbackData", Some (rcs_postback_data_to_yojson x.postback_data));
    ]

let rcs_location_label_to_yojson = string_to_yojson

let rcs_show_location_action_to_yojson (x : rcs_show_location_action) =
  assoc_to_yojson
    [
      ("Text", Some (rcs_suggested_action_text_to_yojson x.text));
      ("PostbackData", Some (rcs_postback_data_to_yojson x.postback_data));
      ("Latitude", Some (Smaws_Lib.Smithy_api.Json_serializers.double_to_yojson x.latitude));
      ("Longitude", Some (Smaws_Lib.Smithy_api.Json_serializers.double_to_yojson x.longitude));
      ("Label", option_to_yojson rcs_location_label_to_yojson x.label);
    ]

let rcs_dial_phone_action_to_yojson (x : rcs_dial_phone_action) =
  assoc_to_yojson
    [
      ("Text", Some (rcs_suggested_action_text_to_yojson x.text));
      ("PostbackData", Some (rcs_postback_data_to_yojson x.postback_data));
      ("PhoneNumber", Some (phone_number_to_yojson x.phone_number));
    ]

let rcs_open_url_value_to_yojson = string_to_yojson

let rcs_open_url_action_to_yojson (x : rcs_open_url_action) =
  assoc_to_yojson
    [
      ("Text", Some (rcs_suggested_action_text_to_yojson x.text));
      ("PostbackData", Some (rcs_postback_data_to_yojson x.postback_data));
      ("Url", Some (rcs_open_url_value_to_yojson x.url));
      ( "Application",
        option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.string__to_yojson x.application );
      ( "WebviewViewMode",
        option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.string__to_yojson x.webview_view_mode
      );
    ]

let rcs_reply_action_to_yojson (x : rcs_reply_action) =
  assoc_to_yojson
    [
      ("Text", Some (rcs_suggested_action_text_to_yojson x.text));
      ("PostbackData", Some (rcs_postback_data_to_yojson x.postback_data));
    ]

let rcs_suggested_action_to_yojson (x : rcs_suggested_action) =
  match x with
  | Reply arg -> assoc_to_yojson [ ("Reply", Some (rcs_reply_action_to_yojson arg)) ]
  | OpenUrl arg -> assoc_to_yojson [ ("OpenUrl", Some (rcs_open_url_action_to_yojson arg)) ]
  | DialPhone arg -> assoc_to_yojson [ ("DialPhone", Some (rcs_dial_phone_action_to_yojson arg)) ]
  | ShowLocation arg ->
      assoc_to_yojson [ ("ShowLocation", Some (rcs_show_location_action_to_yojson arg)) ]
  | RequestLocation arg ->
      assoc_to_yojson [ ("RequestLocation", Some (rcs_request_location_action_to_yojson arg)) ]
  | CreateCalendarEvent arg ->
      assoc_to_yojson
        [ ("CreateCalendarEvent", Some (rcs_create_calendar_event_action_to_yojson arg)) ]

let rcs_suggested_action_list_to_yojson tree = list_to_yojson rcs_suggested_action_to_yojson tree

let rcs_card_suggested_action_list_to_yojson tree =
  list_to_yojson rcs_suggested_action_to_yojson tree

let rcs_media_url_to_yojson = string_to_yojson

let rcs_carousel_card_media_to_yojson (x : rcs_carousel_card_media) =
  assoc_to_yojson
    [
      ("FileUrl", Some (rcs_media_url_to_yojson x.file_url));
      ("ThumbnailUrl", option_to_yojson rcs_media_url_to_yojson x.thumbnail_url);
      ("Height", option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.string__to_yojson x.height);
    ]

let rcs_card_description_to_yojson = string_to_yojson
let rcs_card_title_to_yojson = string_to_yojson

let rcs_carousel_card_content_to_yojson (x : rcs_carousel_card_content) =
  assoc_to_yojson
    [
      ("Title", option_to_yojson rcs_card_title_to_yojson x.title);
      ("Description", option_to_yojson rcs_card_description_to_yojson x.description);
      ("Media", option_to_yojson rcs_carousel_card_media_to_yojson x.media);
      ("Suggestions", option_to_yojson rcs_card_suggested_action_list_to_yojson x.suggestions);
    ]

let rcs_carousel_card_content_list_to_yojson tree =
  list_to_yojson rcs_carousel_card_content_to_yojson tree

let rcs_carousel_to_yojson (x : rcs_carousel) =
  assoc_to_yojson
    [
      ("CardWidth", Some (Smaws_Lib.Smithy_api.Json_serializers.string__to_yojson x.card_width));
      ("CardContents", Some (rcs_carousel_card_content_list_to_yojson x.card_contents));
    ]

let rcs_card_media_to_yojson (x : rcs_card_media) =
  assoc_to_yojson
    [
      ("FileUrl", Some (rcs_media_url_to_yojson x.file_url));
      ("ThumbnailUrl", option_to_yojson rcs_media_url_to_yojson x.thumbnail_url);
      ("Height", option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.string__to_yojson x.height);
    ]

let rcs_card_content_to_yojson (x : rcs_card_content) =
  assoc_to_yojson
    [
      ("Title", option_to_yojson rcs_card_title_to_yojson x.title);
      ("Description", option_to_yojson rcs_card_description_to_yojson x.description);
      ("Media", option_to_yojson rcs_card_media_to_yojson x.media);
      ("Suggestions", option_to_yojson rcs_card_suggested_action_list_to_yojson x.suggestions);
    ]

let rcs_standalone_card_to_yojson (x : rcs_standalone_card) =
  assoc_to_yojson
    [
      ( "CardOrientation",
        Some (Smaws_Lib.Smithy_api.Json_serializers.string__to_yojson x.card_orientation) );
      ( "ThumbnailImageAlignment",
        option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.string__to_yojson
          x.thumbnail_image_alignment );
      ("CardContent", Some (rcs_card_content_to_yojson x.card_content));
    ]

let rcs_file_message_to_yojson (x : rcs_file_message) =
  assoc_to_yojson
    [
      ("FileUrl", Some (rcs_media_url_to_yojson x.file_url));
      ("ThumbnailUrl", option_to_yojson rcs_media_url_to_yojson x.thumbnail_url);
    ]

let rcs_text_body_to_yojson = string_to_yojson

let rcs_text_message_to_yojson (x : rcs_text_message) =
  assoc_to_yojson [ ("Body", Some (rcs_text_body_to_yojson x.body)) ]

let rcs_content_to_yojson (x : rcs_content) =
  match x with
  | TextMessage arg -> assoc_to_yojson [ ("TextMessage", Some (rcs_text_message_to_yojson arg)) ]
  | FileMessage arg -> assoc_to_yojson [ ("FileMessage", Some (rcs_file_message_to_yojson arg)) ]
  | RichCard arg -> assoc_to_yojson [ ("RichCard", Some (rcs_standalone_card_to_yojson arg)) ]
  | Carousel arg -> assoc_to_yojson [ ("Carousel", Some (rcs_carousel_to_yojson arg)) ]

let rcs_message_content_to_yojson (x : rcs_message_content) =
  assoc_to_yojson
    [
      ("Content", Some (rcs_content_to_yojson x.content));
      ("Suggestions", option_to_yojson rcs_suggested_action_list_to_yojson x.suggestions);
    ]

let rcs_message_origination_identity_to_yojson = string_to_yojson

let send_rcs_message_request_to_yojson (x : send_rcs_message_request) =
  assoc_to_yojson
    [
      ("DestinationPhoneNumber", Some (phone_number_to_yojson x.destination_phone_number));
      ( "OriginationIdentity",
        Some (rcs_message_origination_identity_to_yojson x.origination_identity) );
      ("RcsMessageContent", option_to_yojson rcs_message_content_to_yojson x.rcs_message_content);
      ("TimeToLive", option_to_yojson rcs_time_to_live_to_yojson x.time_to_live);
      ( "MessageTrafficType",
        option_to_yojson rcs_message_traffic_type_to_yojson x.message_traffic_type );
      ( "FallbackConfiguration",
        option_to_yojson rcs_fallback_configuration_to_yojson x.fallback_configuration );
      ( "ProtectConfigurationId",
        option_to_yojson protect_configuration_id_or_arn_to_yojson x.protect_configuration_id );
      ( "ConfigurationSetName",
        option_to_yojson configuration_set_name_or_arn_to_yojson x.configuration_set_name );
      ("MaxPrice", option_to_yojson max_price_to_yojson x.max_price);
      ( "DryRun",
        option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.primitive_boolean_to_yojson x.dry_run
      );
      ("Context", option_to_yojson context_map_to_yojson x.context);
      ( "MessageFeedbackEnabled",
        option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.boolean__to_yojson
          x.message_feedback_enabled );
    ]

let send_notify_voice_message_result_to_yojson (x : send_notify_voice_message_result) =
  assoc_to_yojson
    [
      ( "MessageId",
        option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.string__to_yojson x.message_id );
      ("TemplateId", option_to_yojson notify_template_id_to_yojson x.template_id);
      ( "ResolvedMessageBody",
        option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.string__to_yojson
          x.resolved_message_body );
    ]

let template_variable_value_to_yojson = string_to_yojson
let template_variable_name_to_yojson = string_to_yojson

let template_variable_substitution_map_to_yojson tree =
  map_to_yojson template_variable_name_to_yojson template_variable_value_to_yojson tree

let send_notify_voice_message_request_to_yojson (x : send_notify_voice_message_request) =
  assoc_to_yojson
    [
      ( "NotifyConfigurationId",
        Some (notify_configuration_id_or_arn_to_yojson x.notify_configuration_id) );
      ("DestinationPhoneNumber", Some (phone_number_to_yojson x.destination_phone_number));
      ("TemplateId", option_to_yojson notify_template_id_to_yojson x.template_id);
      ("TemplateVariables", Some (template_variable_substitution_map_to_yojson x.template_variables));
      ("VoiceId", option_to_yojson voice_id_to_yojson x.voice_id);
      ("TimeToLive", option_to_yojson time_to_live_to_yojson x.time_to_live);
      ("Context", option_to_yojson context_map_to_yojson x.context);
      ( "ConfigurationSetName",
        option_to_yojson configuration_set_name_or_arn_to_yojson x.configuration_set_name );
      ( "DryRun",
        option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.primitive_boolean_to_yojson x.dry_run
      );
      ( "MessageFeedbackEnabled",
        option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.boolean__to_yojson
          x.message_feedback_enabled );
    ]

let send_notify_text_message_result_to_yojson (x : send_notify_text_message_result) =
  assoc_to_yojson
    [
      ( "MessageId",
        option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.string__to_yojson x.message_id );
      ("TemplateId", option_to_yojson notify_template_id_to_yojson x.template_id);
      ( "ResolvedMessageBody",
        option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.string__to_yojson
          x.resolved_message_body );
    ]

let send_notify_text_message_request_to_yojson (x : send_notify_text_message_request) =
  assoc_to_yojson
    [
      ( "NotifyConfigurationId",
        Some (notify_configuration_id_or_arn_to_yojson x.notify_configuration_id) );
      ("DestinationPhoneNumber", Some (phone_number_to_yojson x.destination_phone_number));
      ("TemplateId", option_to_yojson notify_template_id_to_yojson x.template_id);
      ("TemplateVariables", Some (template_variable_substitution_map_to_yojson x.template_variables));
      ("TimeToLive", option_to_yojson time_to_live_to_yojson x.time_to_live);
      ("Context", option_to_yojson context_map_to_yojson x.context);
      ( "ConfigurationSetName",
        option_to_yojson configuration_set_name_or_arn_to_yojson x.configuration_set_name );
      ( "DryRun",
        option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.primitive_boolean_to_yojson x.dry_run
      );
      ( "MessageFeedbackEnabled",
        option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.boolean__to_yojson
          x.message_feedback_enabled );
    ]

let send_media_message_result_to_yojson (x : send_media_message_result) =
  assoc_to_yojson
    [
      ( "MessageId",
        option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.string__to_yojson x.message_id );
    ]

let send_media_message_request_to_yojson (x : send_media_message_request) =
  assoc_to_yojson
    [
      ("DestinationPhoneNumber", Some (phone_number_to_yojson x.destination_phone_number));
      ( "OriginationIdentity",
        Some (media_message_origination_identity_to_yojson x.origination_identity) );
      ("MessageBody", option_to_yojson text_message_body_to_yojson x.message_body);
      ("MediaUrls", option_to_yojson media_url_list_to_yojson x.media_urls);
      ( "ConfigurationSetName",
        option_to_yojson configuration_set_name_or_arn_to_yojson x.configuration_set_name );
      ("MaxPrice", option_to_yojson max_price_to_yojson x.max_price);
      ("TimeToLive", option_to_yojson time_to_live_to_yojson x.time_to_live);
      ("Context", option_to_yojson context_map_to_yojson x.context);
      ( "DryRun",
        option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.primitive_boolean_to_yojson x.dry_run
      );
      ( "ProtectConfigurationId",
        option_to_yojson protect_configuration_id_or_arn_to_yojson x.protect_configuration_id );
      ( "MessageFeedbackEnabled",
        option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.boolean__to_yojson
          x.message_feedback_enabled );
    ]

let send_destination_number_verification_code_result_to_yojson
    (x : send_destination_number_verification_code_result) =
  assoc_to_yojson
    [ ("MessageId", Some (Smaws_Lib.Smithy_api.Json_serializers.string__to_yojson x.message_id)) ]

let verification_message_origination_identity_to_yojson = string_to_yojson

let verification_channel_to_yojson (x : verification_channel) =
  match x with TEXT -> `String "TEXT" | VOICE -> `String "VOICE"

let send_destination_number_verification_code_request_to_yojson
    (x : send_destination_number_verification_code_request) =
  assoc_to_yojson
    [
      ( "VerifiedDestinationNumberId",
        Some (verified_destination_number_id_or_arn_to_yojson x.verified_destination_number_id) );
      ("VerificationChannel", Some (verification_channel_to_yojson x.verification_channel));
      ("LanguageCode", option_to_yojson language_code_to_yojson x.language_code);
      ( "OriginationIdentity",
        option_to_yojson verification_message_origination_identity_to_yojson x.origination_identity
      );
      ( "ConfigurationSetName",
        option_to_yojson configuration_set_name_or_arn_to_yojson x.configuration_set_name );
      ("Context", option_to_yojson context_map_to_yojson x.context);
      ( "DestinationCountryParameters",
        option_to_yojson destination_country_parameters_to_yojson x.destination_country_parameters
      );
    ]

let request_sender_id_result_to_yojson (x : request_sender_id_result) =
  assoc_to_yojson
    [
      ("SenderIdArn", Some (Smaws_Lib.Smithy_api.Json_serializers.string__to_yojson x.sender_id_arn));
      ("SenderId", Some (sender_id_to_yojson x.sender_id));
      ("IsoCountryCode", Some (iso_country_code_to_yojson x.iso_country_code));
      ("MessageTypes", Some (message_type_list_to_yojson x.message_types));
      ( "MonthlyLeasingPrice",
        Some (Smaws_Lib.Smithy_api.Json_serializers.string__to_yojson x.monthly_leasing_price) );
      ( "DeletionProtectionEnabled",
        Some
          (Smaws_Lib.Smithy_api.Json_serializers.primitive_boolean_to_yojson
             x.deletion_protection_enabled) );
      ( "Registered",
        Some (Smaws_Lib.Smithy_api.Json_serializers.primitive_boolean_to_yojson x.registered) );
      ("Tags", option_to_yojson tag_list_to_yojson x.tags);
    ]

let request_sender_id_request_to_yojson (x : request_sender_id_request) =
  assoc_to_yojson
    [
      ("SenderId", Some (sender_id_to_yojson x.sender_id));
      ("IsoCountryCode", Some (iso_country_code_to_yojson x.iso_country_code));
      ("MessageTypes", option_to_yojson message_type_list_to_yojson x.message_types);
      ( "DeletionProtectionEnabled",
        option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.boolean__to_yojson
          x.deletion_protection_enabled );
      ("Tags", option_to_yojson tag_list_to_yojson x.tags);
      ( "ClientToken",
        Some
          (client_token_to_yojson
             (Option.value x.client_token ~default:(Smaws_Lib.Uuid.generate ()))) );
    ]

let requestable_number_type_to_yojson (x : requestable_number_type) =
  match x with
  | LONG_CODE -> `String "LONG_CODE"
  | TOLL_FREE -> `String "TOLL_FREE"
  | TEN_DLC -> `String "TEN_DLC"
  | SIMULATOR -> `String "SIMULATOR"

let request_phone_number_result_to_yojson (x : request_phone_number_result) =
  assoc_to_yojson
    [
      ( "PhoneNumberArn",
        option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.string__to_yojson x.phone_number_arn
      );
      ( "PhoneNumberId",
        option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.string__to_yojson x.phone_number_id
      );
      ("PhoneNumber", option_to_yojson phone_number_to_yojson x.phone_number);
      ("Status", option_to_yojson number_status_to_yojson x.status);
      ("IsoCountryCode", option_to_yojson iso_country_code_to_yojson x.iso_country_code);
      ("MessageType", option_to_yojson message_type_to_yojson x.message_type);
      ("NumberCapabilities", option_to_yojson number_capability_list_to_yojson x.number_capabilities);
      ("NumberType", option_to_yojson requestable_number_type_to_yojson x.number_type);
      ( "MonthlyLeasingPrice",
        option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.string__to_yojson
          x.monthly_leasing_price );
      ( "TwoWayEnabled",
        option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.primitive_boolean_to_yojson
          x.two_way_enabled );
      ("TwoWayChannelArn", option_to_yojson two_way_channel_arn_to_yojson x.two_way_channel_arn);
      ("TwoWayChannelRole", option_to_yojson iam_role_arn_to_yojson x.two_way_channel_role);
      ( "SelfManagedOptOutsEnabled",
        option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.primitive_boolean_to_yojson
          x.self_managed_opt_outs_enabled );
      ("OptOutListName", option_to_yojson opt_out_list_name_to_yojson x.opt_out_list_name);
      ( "InternationalSendingEnabled",
        option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.primitive_boolean_to_yojson
          x.international_sending_enabled );
      ( "DeletionProtectionEnabled",
        option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.primitive_boolean_to_yojson
          x.deletion_protection_enabled );
      ("PoolId", option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.string__to_yojson x.pool_id);
      ( "RegistrationId",
        option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.string__to_yojson x.registration_id
      );
      ("Tags", option_to_yojson tag_list_to_yojson x.tags);
      ( "CreatedTimestamp",
        option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.timestamp_epoch_seconds_to_yojson
          x.created_timestamp );
    ]

let request_phone_number_request_to_yojson (x : request_phone_number_request) =
  assoc_to_yojson
    [
      ("IsoCountryCode", Some (iso_country_code_to_yojson x.iso_country_code));
      ("MessageType", Some (message_type_to_yojson x.message_type));
      ("NumberCapabilities", Some (number_capability_list_to_yojson x.number_capabilities));
      ("NumberType", Some (requestable_number_type_to_yojson x.number_type));
      ("OptOutListName", option_to_yojson opt_out_list_name_or_arn_to_yojson x.opt_out_list_name);
      ("PoolId", option_to_yojson pool_id_or_arn_to_yojson x.pool_id);
      ("RegistrationId", option_to_yojson registration_id_or_arn_to_yojson x.registration_id);
      ( "InternationalSendingEnabled",
        option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.boolean__to_yojson
          x.international_sending_enabled );
      ( "DeletionProtectionEnabled",
        option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.boolean__to_yojson
          x.deletion_protection_enabled );
      ("Tags", option_to_yojson tag_list_to_yojson x.tags);
      ( "ClientToken",
        Some
          (client_token_to_yojson
             (Option.value x.client_token ~default:(Smaws_Lib.Uuid.generate ()))) );
    ]

let release_sender_id_result_to_yojson (x : release_sender_id_result) =
  assoc_to_yojson
    [
      ("SenderIdArn", Some (Smaws_Lib.Smithy_api.Json_serializers.string__to_yojson x.sender_id_arn));
      ("SenderId", Some (sender_id_to_yojson x.sender_id));
      ("IsoCountryCode", Some (iso_country_code_to_yojson x.iso_country_code));
      ("MessageTypes", Some (message_type_list_to_yojson x.message_types));
      ( "MonthlyLeasingPrice",
        Some (Smaws_Lib.Smithy_api.Json_serializers.string__to_yojson x.monthly_leasing_price) );
      ( "Registered",
        Some (Smaws_Lib.Smithy_api.Json_serializers.primitive_boolean_to_yojson x.registered) );
      ( "RegistrationId",
        option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.string__to_yojson x.registration_id
      );
    ]

let release_sender_id_request_to_yojson (x : release_sender_id_request) =
  assoc_to_yojson
    [
      ("SenderId", Some (sender_id_or_arn_to_yojson x.sender_id));
      ("IsoCountryCode", Some (iso_country_code_to_yojson x.iso_country_code));
    ]

let release_phone_number_result_to_yojson (x : release_phone_number_result) =
  assoc_to_yojson
    [
      ( "PhoneNumberArn",
        option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.string__to_yojson x.phone_number_arn
      );
      ( "PhoneNumberId",
        option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.string__to_yojson x.phone_number_id
      );
      ("PhoneNumber", option_to_yojson phone_number_to_yojson x.phone_number);
      ("Status", option_to_yojson number_status_to_yojson x.status);
      ("IsoCountryCode", option_to_yojson iso_country_code_to_yojson x.iso_country_code);
      ("MessageType", option_to_yojson message_type_to_yojson x.message_type);
      ("NumberCapabilities", option_to_yojson number_capability_list_to_yojson x.number_capabilities);
      ("NumberType", option_to_yojson number_type_to_yojson x.number_type);
      ( "MonthlyLeasingPrice",
        option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.string__to_yojson
          x.monthly_leasing_price );
      ( "TwoWayEnabled",
        option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.primitive_boolean_to_yojson
          x.two_way_enabled );
      ("TwoWayChannelArn", option_to_yojson two_way_channel_arn_to_yojson x.two_way_channel_arn);
      ("TwoWayChannelRole", option_to_yojson iam_role_arn_to_yojson x.two_way_channel_role);
      ( "SelfManagedOptOutsEnabled",
        option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.primitive_boolean_to_yojson
          x.self_managed_opt_outs_enabled );
      ("OptOutListName", option_to_yojson opt_out_list_name_to_yojson x.opt_out_list_name);
      ( "RegistrationId",
        option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.string__to_yojson x.registration_id
      );
      ( "CreatedTimestamp",
        option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.timestamp_epoch_seconds_to_yojson
          x.created_timestamp );
    ]

let release_phone_number_request_to_yojson (x : release_phone_number_request) =
  assoc_to_yojson [ ("PhoneNumberId", Some (phone_number_id_or_arn_to_yojson x.phone_number_id)) ]

let put_resource_policy_result_to_yojson (x : put_resource_policy_result) =
  assoc_to_yojson
    [
      ("ResourceArn", option_to_yojson amazon_resource_name_to_yojson x.resource_arn);
      ("Policy", option_to_yojson resource_policy_to_yojson x.policy);
      ( "CreatedTimestamp",
        option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.timestamp_epoch_seconds_to_yojson
          x.created_timestamp );
    ]

let put_resource_policy_request_to_yojson (x : put_resource_policy_request) =
  assoc_to_yojson
    [
      ("ResourceArn", Some (amazon_resource_name_to_yojson x.resource_arn));
      ("Policy", Some (resource_policy_to_yojson x.policy));
    ]

let put_registration_field_value_result_to_yojson (x : put_registration_field_value_result) =
  assoc_to_yojson
    [
      ( "RegistrationArn",
        Some (Smaws_Lib.Smithy_api.Json_serializers.string__to_yojson x.registration_arn) );
      ( "RegistrationId",
        Some (Smaws_Lib.Smithy_api.Json_serializers.string__to_yojson x.registration_id) );
      ("VersionNumber", Some (registration_version_number_to_yojson x.version_number));
      ("FieldPath", Some (field_path_to_yojson x.field_path));
      ("SelectChoices", option_to_yojson select_choice_list_to_yojson x.select_choices);
      ("TextValue", option_to_yojson text_value_to_yojson x.text_value);
      ( "RegistrationAttachmentId",
        option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.string__to_yojson
          x.registration_attachment_id );
    ]

let put_registration_field_value_request_to_yojson (x : put_registration_field_value_request) =
  assoc_to_yojson
    [
      ("RegistrationId", Some (registration_id_or_arn_to_yojson x.registration_id));
      ("FieldPath", Some (field_path_to_yojson x.field_path));
      ("SelectChoices", option_to_yojson select_choice_list_to_yojson x.select_choices);
      ("TextValue", option_to_yojson text_value_to_yojson x.text_value);
      ( "RegistrationAttachmentId",
        option_to_yojson registration_attachment_id_or_arn_to_yojson x.registration_attachment_id );
    ]

let put_protect_configuration_rule_set_number_override_result_to_yojson
    (x : put_protect_configuration_rule_set_number_override_result) =
  assoc_to_yojson
    [
      ( "ProtectConfigurationArn",
        Some (protect_configuration_arn_to_yojson x.protect_configuration_arn) );
      ( "ProtectConfigurationId",
        Some (protect_configuration_id_to_yojson x.protect_configuration_id) );
      ("DestinationPhoneNumber", Some (phone_number_to_yojson x.destination_phone_number));
      ( "CreatedTimestamp",
        Some
          (Smaws_Lib.Smithy_api.Json_serializers.timestamp_epoch_seconds_to_yojson
             x.created_timestamp) );
      ("Action", Some (protect_configuration_rule_override_action_to_yojson x.action));
      ("IsoCountryCode", option_to_yojson iso_country_code_to_yojson x.iso_country_code);
      ( "ExpirationTimestamp",
        option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.timestamp_epoch_seconds_to_yojson
          x.expiration_timestamp );
    ]

let put_protect_configuration_rule_set_number_override_request_to_yojson
    (x : put_protect_configuration_rule_set_number_override_request) =
  assoc_to_yojson
    [
      ( "ClientToken",
        Some
          (client_token_to_yojson
             (Option.value x.client_token ~default:(Smaws_Lib.Uuid.generate ()))) );
      ( "ProtectConfigurationId",
        Some (protect_configuration_id_or_arn_to_yojson x.protect_configuration_id) );
      ("DestinationPhoneNumber", Some (phone_number_to_yojson x.destination_phone_number));
      ("Action", Some (protect_configuration_rule_override_action_to_yojson x.action));
      ( "ExpirationTimestamp",
        option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.timestamp_epoch_seconds_to_yojson
          x.expiration_timestamp );
    ]

let put_opted_out_number_result_to_yojson (x : put_opted_out_number_result) =
  assoc_to_yojson
    [
      ( "OptOutListArn",
        option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.string__to_yojson x.opt_out_list_arn
      );
      ("OptOutListName", option_to_yojson opt_out_list_name_to_yojson x.opt_out_list_name);
      ("OptedOutNumber", option_to_yojson phone_number_to_yojson x.opted_out_number);
      ( "OptedOutTimestamp",
        option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.timestamp_epoch_seconds_to_yojson
          x.opted_out_timestamp );
      ( "EndUserOptedOut",
        option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.primitive_boolean_to_yojson
          x.end_user_opted_out );
    ]

let put_opted_out_number_request_to_yojson (x : put_opted_out_number_request) =
  assoc_to_yojson
    [
      ("OptOutListName", Some (opt_out_list_name_or_arn_to_yojson x.opt_out_list_name));
      ("OptedOutNumber", Some (phone_number_to_yojson x.opted_out_number));
    ]

let put_message_feedback_result_to_yojson (x : put_message_feedback_result) =
  assoc_to_yojson
    [
      ("MessageId", Some (message_id_to_yojson x.message_id));
      ("MessageFeedbackStatus", Some (message_feedback_status_to_yojson x.message_feedback_status));
    ]

let put_message_feedback_request_to_yojson (x : put_message_feedback_request) =
  assoc_to_yojson
    [
      ("MessageId", Some (message_id_to_yojson x.message_id));
      ("MessageFeedbackStatus", Some (message_feedback_status_to_yojson x.message_feedback_status));
    ]

let put_keyword_result_to_yojson (x : put_keyword_result) =
  assoc_to_yojson
    [
      ( "OriginationIdentityArn",
        option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.string__to_yojson
          x.origination_identity_arn );
      ( "OriginationIdentity",
        option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.string__to_yojson
          x.origination_identity );
      ("Keyword", option_to_yojson keyword_to_yojson x.keyword);
      ("KeywordMessage", option_to_yojson keyword_message_to_yojson x.keyword_message);
      ("KeywordAction", option_to_yojson keyword_action_to_yojson x.keyword_action);
    ]

let put_keyword_request_to_yojson (x : put_keyword_request) =
  assoc_to_yojson
    [
      ("OriginationIdentity", Some (phone_or_pool_id_or_arn_to_yojson x.origination_identity));
      ("Keyword", Some (keyword_to_yojson x.keyword));
      ("KeywordMessage", Some (keyword_message_to_yojson x.keyword_message));
      ("KeywordAction", option_to_yojson keyword_action_to_yojson x.keyword_action);
    ]
