open Smaws_Lib.Json.DeserializeHelpers
open Types

let access_denied_exception_reason_of_yojson (tree : t) path =
  ((match tree with
    | `String "INSUFFICIENT_ACCOUNT_REPUTATION" -> INSUFFICIENT_ACCOUNT_REPUTATION
    | `String "ACCOUNT_DISABLED" -> ACCOUNT_DISABLED
    | `String value ->
        raise (deserialize_unknown_enum_value_error path "AccessDeniedExceptionReason" value)
    | _ -> raise (deserialize_wrong_type_error path "AccessDeniedExceptionReason")
     : access_denied_exception_reason)
    : access_denied_exception_reason)

let access_denied_exception_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     message =
       option_of_yojson
         (value_for_key Smaws_Lib.Smithy_api.Json_deserializers.string__of_yojson "Message")
         _list path;
     reason =
       option_of_yojson (value_for_key access_denied_exception_reason_of_yojson "Reason") _list path;
   }
    : access_denied_exception)

let account_attribute_name_of_yojson (tree : t) path =
  ((match tree with
    | `String "ACCOUNT_TIER" -> ACCOUNT_TIER
    | `String "DEFAULT_PROTECT_CONFIGURATION_ID" -> DEFAULT_PROTECT_CONFIGURATION_ID
    | `String value ->
        raise (deserialize_unknown_enum_value_error path "AccountAttributeName" value)
    | _ -> raise (deserialize_wrong_type_error path "AccountAttributeName")
     : account_attribute_name)
    : account_attribute_name)

let account_attribute_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     name = value_for_key account_attribute_name_of_yojson "Name" _list path;
     value =
       value_for_key Smaws_Lib.Smithy_api.Json_deserializers.string__of_yojson "Value" _list path;
   }
    : account_attribute)

let account_attribute_list_of_yojson tree path =
  list_of_yojson account_attribute_of_yojson tree path

let account_limit_name_of_yojson (tree : t) path =
  ((match tree with
    | `String "PHONE_NUMBERS" -> PHONE_NUMBERS
    | `String "POOLS" -> POOLS
    | `String "CONFIGURATION_SETS" -> CONFIGURATION_SETS
    | `String "OPT_OUT_LISTS" -> OPT_OUT_LISTS
    | `String "SENDER_IDS" -> SENDER_IDS
    | `String "REGISTRATIONS" -> REGISTRATIONS
    | `String "REGISTRATION_ATTACHMENTS" -> REGISTRATION_ATTACHMENTS
    | `String "VERIFIED_DESTINATION_NUMBERS" -> VERIFIED_DESTINATION_NUMBERS
    | `String value -> raise (deserialize_unknown_enum_value_error path "AccountLimitName" value)
    | _ -> raise (deserialize_wrong_type_error path "AccountLimitName")
     : account_limit_name)
    : account_limit_name)

let account_limit_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     name = value_for_key account_limit_name_of_yojson "Name" _list path;
     used =
       value_for_key Smaws_Lib.Smithy_api.Json_deserializers.primitive_long_of_yojson "Used" _list
         path;
     max =
       value_for_key Smaws_Lib.Smithy_api.Json_deserializers.primitive_long_of_yojson "Max" _list
         path;
   }
    : account_limit)

let account_limit_list_of_yojson tree path = list_of_yojson account_limit_of_yojson tree path
let amazon_resource_name_of_yojson = string_of_yojson

let validation_exception_field_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     name =
       value_for_key Smaws_Lib.Smithy_api.Json_deserializers.string__of_yojson "Name" _list path;
     message =
       value_for_key Smaws_Lib.Smithy_api.Json_deserializers.string__of_yojson "Message" _list path;
   }
    : validation_exception_field)

let validation_exception_field_list_of_yojson tree path =
  list_of_yojson validation_exception_field_of_yojson tree path

let validation_exception_reason_of_yojson (tree : t) path =
  ((match tree with
    | `String "CANNOT_ADD_OPTED_OUT_NUMBER" -> CANNOT_ADD_OPTED_OUT_NUMBER
    | `String "CANNOT_PARSE" -> CANNOT_PARSE
    | `String "CHANNEL_NOT_ENABLED" -> CHANNEL_NOT_ENABLED
    | `String "COUNTRY_CODE_MISMATCH" -> COUNTRY_CODE_MISMATCH
    | `String "COUNTRY_NOT_ENABLED" -> COUNTRY_NOT_ENABLED
    | `String "DESTINATION_COUNTRY_BLOCKED" -> DESTINATION_COUNTRY_BLOCKED
    | `String "FIELD_VALIDATION_FAILED" -> FIELD_VALIDATION_FAILED
    | `String "ATTACHMENT_TYPE_NOT_SUPPORTED" -> ATTACHMENT_TYPE_NOT_SUPPORTED
    | `String "INTERNATIONAL_SENDING_NOT_SUPPORTED" -> INTERNATIONAL_SENDING_NOT_SUPPORTED
    | `String "INVALID_ARN" -> INVALID_ARN
    | `String "INVALID_FILTER_VALUES" -> INVALID_FILTER_VALUES
    | `String "INVALID_IDENTITY_FOR_DESTINATION_COUNTRY" -> INVALID_IDENTITY_FOR_DESTINATION_COUNTRY
    | `String "INVALID_NEXT_TOKEN" -> INVALID_NEXT_TOKEN
    | `String "INVALID_PARAMETER" -> INVALID_PARAMETER
    | `String "INVALID_REQUEST" -> INVALID_REQUEST
    | `String "INVALID_REGISTRATION_ASSOCIATION" -> INVALID_REGISTRATION_ASSOCIATION
    | `String "MAXIMUM_SIZE_EXCEEDED" -> MAXIMUM_SIZE_EXCEEDED
    | `String "MEDIA_TYPE_NOT_SUPPORTED" -> MEDIA_TYPE_NOT_SUPPORTED
    | `String "MISSING_PARAMETER" -> MISSING_PARAMETER
    | `String "PARAMETERS_CANNOT_BE_USED_TOGETHER" -> PARAMETERS_CANNOT_BE_USED_TOGETHER
    | `String "PHONE_NUMBER_CANNOT_BE_OPTED_IN" -> PHONE_NUMBER_CANNOT_BE_OPTED_IN
    | `String "PHONE_NUMBER_CANNOT_BE_RELEASED" -> PHONE_NUMBER_CANNOT_BE_RELEASED
    | `String "PRICE_OVER_THRESHOLD" -> PRICE_OVER_THRESHOLD
    | `String "RESOURCE_NOT_ACCESSIBLE" -> RESOURCE_NOT_ACCESSIBLE
    | `String "REQUESTED_SPEND_LIMIT_HIGHER_THAN_SERVICE_LIMIT" ->
        REQUESTED_SPEND_LIMIT_HIGHER_THAN_SERVICE_LIMIT
    | `String "SENDER_ID_NOT_REGISTERED" -> SENDER_ID_NOT_REGISTERED
    | `String "SENDER_ID_NOT_SUPPORTED" -> SENDER_ID_NOT_SUPPORTED
    | `String "SENDER_ID_REQUIRES_REGISTRATION" -> SENDER_ID_REQUIRES_REGISTRATION
    | `String "TWO_WAY_TOPIC_NOT_PRESENT" -> TWO_WAY_TOPIC_NOT_PRESENT
    | `String "TWO_WAY_NOT_ENABLED" -> TWO_WAY_NOT_ENABLED
    | `String "TWO_WAY_NOT_SUPPORTED_IN_COUNTRY" -> TWO_WAY_NOT_SUPPORTED_IN_COUNTRY
    | `String "TWO_WAY_NOT_SUPPORTED_IN_REGION" -> TWO_WAY_NOT_SUPPORTED_IN_REGION
    | `String "TWO_WAY_CHANNEL_NOT_PRESENT" -> TWO_WAY_CHANNEL_NOT_PRESENT
    | `String "UNKNOWN_REGISTRATION_FIELD" -> UNKNOWN_REGISTRATION_FIELD
    | `String "UNKNOWN_REGISTRATION_SECTION" -> UNKNOWN_REGISTRATION_SECTION
    | `String "UNKNOWN_REGISTRATION_TYPE" -> UNKNOWN_REGISTRATION_TYPE
    | `String "UNKNOWN_REGISTRATION_VERSION" -> UNKNOWN_REGISTRATION_VERSION
    | `String "UNKNOWN_OPERATION" -> UNKNOWN_OPERATION
    | `String "REGISTRATION_FIELD_CANNOT_BE_DELETED" -> REGISTRATION_FIELD_CANNOT_BE_DELETED
    | `String "VERIFICATION_CODE_MISMATCH" -> VERIFICATION_CODE_MISMATCH
    | `String "VOICE_CAPABILITY_NOT_AVAILABLE" -> VOICE_CAPABILITY_NOT_AVAILABLE
    | `String "UNSPECIFIED_PARAMETER_NOT_SUPPORTED" -> UNSPECIFIED_PARAMETER_NOT_SUPPORTED
    | `String "OTHER" -> OTHER
    | `String value ->
        raise (deserialize_unknown_enum_value_error path "ValidationExceptionReason" value)
    | _ -> raise (deserialize_wrong_type_error path "ValidationExceptionReason")
     : validation_exception_reason)
    : validation_exception_reason)

let validation_exception_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     message =
       option_of_yojson
         (value_for_key Smaws_Lib.Smithy_api.Json_deserializers.string__of_yojson "Message")
         _list path;
     reason =
       option_of_yojson (value_for_key validation_exception_reason_of_yojson "Reason") _list path;
     fields =
       option_of_yojson
         (value_for_key validation_exception_field_list_of_yojson "Fields")
         _list path;
   }
    : validation_exception)

let throttling_exception_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     message =
       option_of_yojson
         (value_for_key Smaws_Lib.Smithy_api.Json_deserializers.string__of_yojson "Message")
         _list path;
   }
    : throttling_exception)

let service_quota_exceeded_exception_reason_of_yojson (tree : t) path =
  ((match tree with
    | `String "ASSOCIATIONS_PER_REGISTRATION" -> ASSOCIATIONS_PER_REGISTRATION
    | `String "CONFIGURATION_SETS_PER_ACCOUNT" -> CONFIGURATION_SETS_PER_ACCOUNT
    | `String "DAILY_DESTINATION_CALL_LIMIT" -> DAILY_DESTINATION_CALL_LIMIT
    | `String "DAILY_NOTIFY_TIER_MESSAGE_LIMIT" -> DAILY_NOTIFY_TIER_MESSAGE_LIMIT
    | `String "EVENT_DESTINATIONS_PER_CONFIGURATION_SET" -> EVENT_DESTINATIONS_PER_CONFIGURATION_SET
    | `String "KEYWORDS_PER_PHONE_NUMBER" -> KEYWORDS_PER_PHONE_NUMBER
    | `String "KEYWORDS_PER_POOL" -> KEYWORDS_PER_POOL
    | `String "MONTHLY_SPEND_LIMIT_REACHED_FOR_MEDIA" -> MONTHLY_SPEND_LIMIT_REACHED_FOR_MEDIA
    | `String "MONTHLY_SPEND_LIMIT_REACHED_FOR_NOTIFY" -> MONTHLY_SPEND_LIMIT_REACHED_FOR_NOTIFY
    | `String "MONTHLY_SPEND_LIMIT_REACHED_FOR_RCS" -> MONTHLY_SPEND_LIMIT_REACHED_FOR_RCS
    | `String "MONTHLY_SPEND_LIMIT_REACHED_FOR_TEXT" -> MONTHLY_SPEND_LIMIT_REACHED_FOR_TEXT
    | `String "MONTHLY_SPEND_LIMIT_REACHED_FOR_VOICE" -> MONTHLY_SPEND_LIMIT_REACHED_FOR_VOICE
    | `String "NOTIFY_CONFIGURATIONS_PER_ACCOUNT" -> NOTIFY_CONFIGURATIONS_PER_ACCOUNT
    | `String "OPT_OUT_LISTS_PER_ACCOUNT" -> OPT_OUT_LISTS_PER_ACCOUNT
    | `String "ORIGINATION_IDENTITIES_PER_POOL" -> ORIGINATION_IDENTITIES_PER_POOL
    | `String "PHONE_NUMBERS_PER_ACCOUNT" -> PHONE_NUMBERS_PER_ACCOUNT
    | `String "PHONE_NUMBERS_PER_REGISTRATION" -> PHONE_NUMBERS_PER_REGISTRATION
    | `String "POOLS_PER_ACCOUNT" -> POOLS_PER_ACCOUNT
    | `String "RCS_AGENTS_PER_ACCOUNT" -> RCS_AGENTS_PER_ACCOUNT
    | `String "REGISTRATION_ATTACHMENTS_CREATED_PER_DAY" -> REGISTRATION_ATTACHMENTS_CREATED_PER_DAY
    | `String "REGISTRATION_ATTACHMENTS_PER_ACCOUNT" -> REGISTRATION_ATTACHMENTS_PER_ACCOUNT
    | `String "REGISTRATION_VERSIONS_CREATED_PER_DAY" -> REGISTRATION_VERSIONS_CREATED_PER_DAY
    | `String "REGISTRATIONS_PER_ACCOUNT" -> REGISTRATIONS_PER_ACCOUNT
    | `String "SENDER_IDS_PER_ACCOUNT" -> SENDER_IDS_PER_ACCOUNT
    | `String "TAGS_PER_RESOURCE" -> TAGS_PER_RESOURCE
    | `String "VERIFIED_DESTINATION_NUMBERS_PER_ACCOUNT" -> VERIFIED_DESTINATION_NUMBERS_PER_ACCOUNT
    | `String "VERIFICATION_ATTEMPTS_PER_DAY" -> VERIFICATION_ATTEMPTS_PER_DAY
    | `String "PROTECT_CONFIGURATIONS_PER_ACCOUNT" -> PROTECT_CONFIGURATIONS_PER_ACCOUNT
    | `String value ->
        raise
          (deserialize_unknown_enum_value_error path "ServiceQuotaExceededExceptionReason" value)
    | _ -> raise (deserialize_wrong_type_error path "ServiceQuotaExceededExceptionReason")
     : service_quota_exceeded_exception_reason)
    : service_quota_exceeded_exception_reason)

let service_quota_exceeded_exception_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     message =
       option_of_yojson
         (value_for_key Smaws_Lib.Smithy_api.Json_deserializers.string__of_yojson "Message")
         _list path;
     reason =
       option_of_yojson
         (value_for_key service_quota_exceeded_exception_reason_of_yojson "Reason")
         _list path;
   }
    : service_quota_exceeded_exception)

let resource_type_of_yojson (tree : t) path =
  ((match tree with
    | `String "account" -> ACCOUNT
    | `String "phone-number" -> PHONE_NUMBER
    | `String "sender-id" -> SENDER_ID
    | `String "pool" -> POOL
    | `String "configuration-set" -> CONFIGURATION_SET
    | `String "opt-out-list" -> OPT_OUT_LIST
    | `String "event-destination" -> EVENT_DESTINATION
    | `String "keyword" -> KEYWORD
    | `String "opted-out-number" -> OPTED_OUT_NUMBER
    | `String "registration" -> REGISTRATION
    | `String "registration-attachment" -> REGISTRATION_ATTACHMENT
    | `String "verified-destination-number" -> VERIFIED_DESTINATION_NUMBER
    | `String "protect-configuration" -> PROTECT_CONFIGURATION
    | `String "notify-configuration" -> NOTIFY_CONFIGURATION
    | `String "notify-template" -> NOTIFY_TEMPLATE
    | `String "message-template" -> MESSAGE_TEMPLATE
    | `String "policy" -> POLICY
    | `String "message" -> MESSAGE
    | `String "rcs-agent" -> RCS_AGENT
    | `String value -> raise (deserialize_unknown_enum_value_error path "ResourceType" value)
    | _ -> raise (deserialize_wrong_type_error path "ResourceType")
     : resource_type)
    : resource_type)

let resource_not_found_exception_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     message =
       option_of_yojson
         (value_for_key Smaws_Lib.Smithy_api.Json_deserializers.string__of_yojson "Message")
         _list path;
     resource_type =
       option_of_yojson (value_for_key resource_type_of_yojson "ResourceType") _list path;
     resource_id =
       option_of_yojson
         (value_for_key Smaws_Lib.Smithy_api.Json_deserializers.string__of_yojson "ResourceId")
         _list path;
   }
    : resource_not_found_exception)

let internal_server_exception_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     message =
       option_of_yojson
         (value_for_key Smaws_Lib.Smithy_api.Json_deserializers.string__of_yojson "Message")
         _list path;
     request_id =
       option_of_yojson
         (value_for_key Smaws_Lib.Smithy_api.Json_deserializers.string__of_yojson "RequestId")
         _list path;
   }
    : internal_server_exception)

let conflict_exception_reason_of_yojson (tree : t) path =
  ((match tree with
    | `String "CREATE_REGISTRATION_VERSION_NOT_ALLOWED" -> CREATE_REGISTRATION_VERSION_NOT_ALLOWED
    | `String "DELETION_PROTECTION_ENABLED" -> DELETION_PROTECTION_ENABLED
    | `String "DESTINATION_PHONE_NUMBER_NOT_VERIFIED" -> DESTINATION_PHONE_NUMBER_NOT_VERIFIED
    | `String "DESTINATION_PHONE_NUMBER_OPTED_OUT" -> DESTINATION_PHONE_NUMBER_OPTED_OUT
    | `String "DISASSOCIATE_REGISTRATION_NOT_ALLOWED" -> DISASSOCIATE_REGISTRATION_NOT_ALLOWED
    | `String "DISCARD_REGISTRATION_VERSION_NOT_ALLOWED" -> DISCARD_REGISTRATION_VERSION_NOT_ALLOWED
    | `String "EDIT_REGISTRATION_FIELD_VALUES_NOT_ALLOWED" ->
        EDIT_REGISTRATION_FIELD_VALUES_NOT_ALLOWED
    | `String "EVENT_DESTINATION_MISMATCH" -> EVENT_DESTINATION_MISMATCH
    | `String "KEYWORD_MISMATCH" -> KEYWORD_MISMATCH
    | `String "LAST_PHONE_NUMBER" -> LAST_PHONE_NUMBER
    | `String "NUMBER_CAPABILITIES_MISMATCH" -> NUMBER_CAPABILITIES_MISMATCH
    | `String "MESSAGE_TYPE_MISMATCH" -> MESSAGE_TYPE_MISMATCH
    | `String "NO_ORIGINATION_IDENTITIES_FOUND" -> NO_ORIGINATION_IDENTITIES_FOUND
    | `String "OPT_OUT_LIST_MISMATCH" -> OPT_OUT_LIST_MISMATCH
    | `String "PHONE_NUMBER_ASSOCIATED_TO_POOL" -> PHONE_NUMBER_ASSOCIATED_TO_POOL
    | `String "PHONE_NUMBER_ASSOCIATED_TO_REGISTRATION" -> PHONE_NUMBER_ASSOCIATED_TO_REGISTRATION
    | `String "PHONE_NUMBER_NOT_ASSOCIATED_TO_POOL" -> PHONE_NUMBER_NOT_ASSOCIATED_TO_POOL
    | `String "PHONE_NUMBER_NOT_IN_REGISTRATION_REGION" -> PHONE_NUMBER_NOT_IN_REGISTRATION_REGION
    | `String "REGISTRATION_ALREADY_SUBMITTED" -> REGISTRATION_ALREADY_SUBMITTED
    | `String "REGISTRATION_NOT_COMPLETE" -> REGISTRATION_NOT_COMPLETE
    | `String "RESOURCE_ALREADY_ASSOCIATED" -> RESOURCE_ALREADY_ASSOCIATED
    | `String "SENDER_ID_ASSOCIATED_TO_POOL" -> SENDER_ID_ASSOCIATED_TO_POOL
    | `String "RCS_AGENT_ASSOCIATED_TO_POOL" -> RCS_AGENT_ASSOCIATED_TO_POOL
    | `String "POOL_ASSOCIATED_TO_NOTIFY_CONFIGURATION" -> POOL_ASSOCIATED_TO_NOTIFY_CONFIGURATION
    | `String "RESOURCE_ALREADY_EXISTS" -> RESOURCE_ALREADY_EXISTS
    | `String "RESOURCE_DELETION_NOT_ALLOWED" -> RESOURCE_DELETION_NOT_ALLOWED
    | `String "RESOURCE_MODIFICATION_NOT_ALLOWED" -> RESOURCE_MODIFICATION_NOT_ALLOWED
    | `String "RESOURCE_NOT_ACTIVE" -> RESOURCE_NOT_ACTIVE
    | `String "RESOURCE_NOT_EMPTY" -> RESOURCE_NOT_EMPTY
    | `String "SELF_MANAGED_OPT_OUTS_MISMATCH" -> SELF_MANAGED_OPT_OUTS_MISMATCH
    | `String "SUBMIT_REGISTRATION_VERSION_NOT_ALLOWED" -> SUBMIT_REGISTRATION_VERSION_NOT_ALLOWED
    | `String "TWO_WAY_CONFIG_MISMATCH" -> TWO_WAY_CONFIG_MISMATCH
    | `String "VERIFICATION_CODE_EXPIRED" -> VERIFICATION_CODE_EXPIRED
    | `String "VERIFICATION_ALREADY_COMPLETE" -> VERIFICATION_ALREADY_COMPLETE
    | `String "PROTECT_CONFIGURATION_IS_ACCOUNT_DEFAULT" -> PROTECT_CONFIGURATION_IS_ACCOUNT_DEFAULT
    | `String "PROTECT_CONFIGURATION_ASSOCIATED_WITH_CONFIGURATION_SET" ->
        PROTECT_CONFIGURATION_ASSOCIATED_WITH_CONFIGURATION_SET
    | `String "PROTECT_CONFIGURATION_NOT_ASSOCIATED_WITH_CONFIGURATION_SET" ->
        PROTECT_CONFIGURATION_NOT_ASSOCIATED_WITH_CONFIGURATION_SET
    | `String "DESTINATION_COUNTRY_BLOCKED_BY_PROTECT_CONFIGURATION" ->
        DESTINATION_COUNTRY_BLOCKED_BY_PROTECT_CONFIGURATION
    | `String "DESTINATION_PHONE_NUMBER_BLOCKED_BY_PROTECT_NUMBER_OVERRIDE" ->
        DESTINATION_PHONE_NUMBER_BLOCKED_BY_PROTECT_NUMBER_OVERRIDE
    | `String "RCS_AGENT_ALREADY_ASSOCIATED_TO_REGISTRATION_TYPE" ->
        RCS_AGENT_ALREADY_ASSOCIATED_TO_REGISTRATION_TYPE
    | `String "NOTIFY_CONFIGURATION_NOT_ACTIVE" -> NOTIFY_CONFIGURATION_NOT_ACTIVE
    | `String value ->
        raise (deserialize_unknown_enum_value_error path "ConflictExceptionReason" value)
    | _ -> raise (deserialize_wrong_type_error path "ConflictExceptionReason")
     : conflict_exception_reason)
    : conflict_exception_reason)

let conflict_exception_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     message =
       option_of_yojson
         (value_for_key Smaws_Lib.Smithy_api.Json_deserializers.string__of_yojson "Message")
         _list path;
     reason =
       option_of_yojson (value_for_key conflict_exception_reason_of_yojson "Reason") _list path;
     resource_type =
       option_of_yojson (value_for_key resource_type_of_yojson "ResourceType") _list path;
     resource_id =
       option_of_yojson
         (value_for_key Smaws_Lib.Smithy_api.Json_deserializers.string__of_yojson "ResourceId")
         _list path;
   }
    : conflict_exception)

let iso_country_code_of_yojson = string_of_yojson

let associate_origination_identity_result_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     pool_arn =
       option_of_yojson
         (value_for_key Smaws_Lib.Smithy_api.Json_deserializers.string__of_yojson "PoolArn")
         _list path;
     pool_id =
       option_of_yojson
         (value_for_key Smaws_Lib.Smithy_api.Json_deserializers.string__of_yojson "PoolId")
         _list path;
     origination_identity_arn =
       option_of_yojson
         (value_for_key Smaws_Lib.Smithy_api.Json_deserializers.string__of_yojson
            "OriginationIdentityArn")
         _list path;
     origination_identity =
       option_of_yojson
         (value_for_key Smaws_Lib.Smithy_api.Json_deserializers.string__of_yojson
            "OriginationIdentity")
         _list path;
     iso_country_code =
       option_of_yojson (value_for_key iso_country_code_of_yojson "IsoCountryCode") _list path;
   }
    : associate_origination_identity_result)

let client_token_of_yojson = string_of_yojson
let phone_or_sender_id_or_arn_of_yojson = string_of_yojson
let pool_id_or_arn_of_yojson = string_of_yojson

let associate_origination_identity_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     pool_id = value_for_key pool_id_or_arn_of_yojson "PoolId" _list path;
     origination_identity =
       value_for_key phone_or_sender_id_or_arn_of_yojson "OriginationIdentity" _list path;
     iso_country_code =
       option_of_yojson (value_for_key iso_country_code_of_yojson "IsoCountryCode") _list path;
     client_token = option_of_yojson (value_for_key client_token_of_yojson "ClientToken") _list path;
   }
    : associate_origination_identity_request)

let protect_configuration_id_of_yojson = string_of_yojson
let protect_configuration_arn_of_yojson = string_of_yojson
let configuration_set_name_of_yojson = string_of_yojson

let associate_protect_configuration_result_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     configuration_set_arn =
       value_for_key Smaws_Lib.Smithy_api.Json_deserializers.string__of_yojson "ConfigurationSetArn"
         _list path;
     configuration_set_name =
       value_for_key configuration_set_name_of_yojson "ConfigurationSetName" _list path;
     protect_configuration_arn =
       value_for_key protect_configuration_arn_of_yojson "ProtectConfigurationArn" _list path;
     protect_configuration_id =
       value_for_key protect_configuration_id_of_yojson "ProtectConfigurationId" _list path;
   }
    : associate_protect_configuration_result)

let configuration_set_name_or_arn_of_yojson = string_of_yojson
let protect_configuration_id_or_arn_of_yojson = string_of_yojson

let associate_protect_configuration_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     protect_configuration_id =
       value_for_key protect_configuration_id_or_arn_of_yojson "ProtectConfigurationId" _list path;
     configuration_set_name =
       value_for_key configuration_set_name_or_arn_of_yojson "ConfigurationSetName" _list path;
   }
    : associate_protect_configuration_request)

let attachment_body_of_yojson = blob_of_yojson

let attachment_status_of_yojson (tree : t) path =
  ((match tree with
    | `String "UPLOAD_IN_PROGRESS" -> UPLOAD_IN_PROGRESS
    | `String "UPLOAD_COMPLETE" -> UPLOAD_COMPLETE
    | `String "UPLOAD_FAILED" -> UPLOAD_FAILED
    | `String "DELETED" -> DELETED
    | `String value -> raise (deserialize_unknown_enum_value_error path "AttachmentStatus" value)
    | _ -> raise (deserialize_wrong_type_error path "AttachmentStatus")
     : attachment_status)
    : attachment_status)

let attachment_upload_error_reason_of_yojson (tree : t) path =
  ((match tree with
    | `String "INTERNAL_ERROR" -> INTERNAL_ERROR
    | `String value ->
        raise (deserialize_unknown_enum_value_error path "AttachmentUploadErrorReason" value)
    | _ -> raise (deserialize_wrong_type_error path "AttachmentUploadErrorReason")
     : attachment_upload_error_reason)
    : attachment_upload_error_reason)

let attachment_url_of_yojson = string_of_yojson

let phone_number_type_of_yojson (tree : t) path =
  ((match tree with
    | `String "MOBILE" -> MOBILE
    | `String "LANDLINE" -> LANDLINE
    | `String "OTHER" -> OTHER
    | `String "INVALID" -> INVALID
    | `String value -> raise (deserialize_unknown_enum_value_error path "PhoneNumberType" value)
    | _ -> raise (deserialize_wrong_type_error path "PhoneNumberType")
     : phone_number_type)
    : phone_number_type)

let mnc_type_of_yojson = string_of_yojson
let mcc_type_of_yojson = string_of_yojson
let dialing_country_code_type_of_yojson = string_of_yojson
let e164_phone_number_type_of_yojson = string_of_yojson

let carrier_lookup_result_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     e164_phone_number = value_for_key e164_phone_number_type_of_yojson "E164PhoneNumber" _list path;
     dialing_country_code =
       option_of_yojson
         (value_for_key dialing_country_code_type_of_yojson "DialingCountryCode")
         _list path;
     iso_country_code =
       option_of_yojson (value_for_key iso_country_code_of_yojson "IsoCountryCode") _list path;
     country =
       option_of_yojson
         (value_for_key Smaws_Lib.Smithy_api.Json_deserializers.string__of_yojson "Country")
         _list path;
     mc_c = option_of_yojson (value_for_key mcc_type_of_yojson "MCC") _list path;
     mn_c = option_of_yojson (value_for_key mnc_type_of_yojson "MNC") _list path;
     carrier =
       option_of_yojson
         (value_for_key Smaws_Lib.Smithy_api.Json_deserializers.string__of_yojson "Carrier")
         _list path;
     phone_number_type = value_for_key phone_number_type_of_yojson "PhoneNumberType" _list path;
   }
    : carrier_lookup_result)

let carrier_lookup_input_phone_number_type_of_yojson = string_of_yojson

let carrier_lookup_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     phone_number =
       value_for_key carrier_lookup_input_phone_number_type_of_yojson "PhoneNumber" _list path;
   }
    : carrier_lookup_request)

let carrier_status_of_yojson (tree : t) path =
  ((match tree with
    | `String "PENDING" -> PENDING
    | `String "ACTIVE" -> ACTIVE
    | `String "REJECTED" -> REJECTED
    | `String value -> raise (deserialize_unknown_enum_value_error path "CarrierStatus" value)
    | _ -> raise (deserialize_wrong_type_error path "CarrierStatus")
     : carrier_status)
    : carrier_status)

let carrier_status_information_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     carrier_name =
       value_for_key Smaws_Lib.Smithy_api.Json_deserializers.string__of_yojson "CarrierName" _list
         path;
     status = value_for_key carrier_status_of_yojson "Status" _list path;
   }
    : carrier_status_information)

let carrier_status_information_list_of_yojson tree path =
  list_of_yojson carrier_status_information_of_yojson tree path

let log_group_arn_of_yojson = string_of_yojson
let iam_role_arn_of_yojson = string_of_yojson

let cloud_watch_logs_destination_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     iam_role_arn = value_for_key iam_role_arn_of_yojson "IamRoleArn" _list path;
     log_group_arn = value_for_key log_group_arn_of_yojson "LogGroupArn" _list path;
   }
    : cloud_watch_logs_destination)

let filter_value_of_yojson = string_of_yojson
let filter_value_list_of_yojson tree path = list_of_yojson filter_value_of_yojson tree path

let configuration_set_filter_name_of_yojson (tree : t) path =
  ((match tree with
    | `String "event-destination-name" -> EVENT_DESTINATION_NAME
    | `String "matching-event-types" -> MATCHING_EVENT_TYPES
    | `String "default-message-type" -> DEFAULT_MESSAGE_TYPE
    | `String "default-sender-id" -> DEFAULT_SENDER_ID
    | `String "default-message-feedback-enabled" -> DEFAULT_MESSAGE_FEEDBACK_ENABLED
    | `String "protect-configuration-id" -> PROTECT_CONFIGURATION_ID
    | `String value ->
        raise (deserialize_unknown_enum_value_error path "ConfigurationSetFilterName" value)
    | _ -> raise (deserialize_wrong_type_error path "ConfigurationSetFilterName")
     : configuration_set_filter_name)
    : configuration_set_filter_name)

let configuration_set_filter_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     name = value_for_key configuration_set_filter_name_of_yojson "Name" _list path;
     values = value_for_key filter_value_list_of_yojson "Values" _list path;
   }
    : configuration_set_filter)

let configuration_set_filter_list_of_yojson tree path =
  list_of_yojson configuration_set_filter_of_yojson tree path

let sender_id_of_yojson = string_of_yojson

let message_type_of_yojson (tree : t) path =
  ((match tree with
    | `String "TRANSACTIONAL" -> TRANSACTIONAL
    | `String "PROMOTIONAL" -> PROMOTIONAL
    | `String value -> raise (deserialize_unknown_enum_value_error path "MessageType" value)
    | _ -> raise (deserialize_wrong_type_error path "MessageType")
     : message_type)
    : message_type)

let sns_topic_arn_of_yojson = string_of_yojson

let sns_destination_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({ topic_arn = value_for_key sns_topic_arn_of_yojson "TopicArn" _list path } : sns_destination)

let delivery_stream_arn_of_yojson = string_of_yojson

let kinesis_firehose_destination_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     iam_role_arn = value_for_key iam_role_arn_of_yojson "IamRoleArn" _list path;
     delivery_stream_arn =
       value_for_key delivery_stream_arn_of_yojson "DeliveryStreamArn" _list path;
   }
    : kinesis_firehose_destination)

let event_type_of_yojson (tree : t) path =
  ((match tree with
    | `String "ALL" -> ALL
    | `String "TEXT_ALL" -> TEXT_ALL
    | `String "TEXT_SENT" -> TEXT_SENT
    | `String "TEXT_PENDING" -> TEXT_PENDING
    | `String "TEXT_QUEUED" -> TEXT_QUEUED
    | `String "TEXT_SUCCESSFUL" -> TEXT_SUCCESSFUL
    | `String "TEXT_DELIVERED" -> TEXT_DELIVERED
    | `String "TEXT_INVALID" -> TEXT_INVALID
    | `String "TEXT_INVALID_MESSAGE" -> TEXT_INVALID_MESSAGE
    | `String "TEXT_UNREACHABLE" -> TEXT_UNREACHABLE
    | `String "TEXT_CARRIER_UNREACHABLE" -> TEXT_CARRIER_UNREACHABLE
    | `String "TEXT_BLOCKED" -> TEXT_BLOCKED
    | `String "TEXT_CARRIER_BLOCKED" -> TEXT_CARRIER_BLOCKED
    | `String "TEXT_SPAM" -> TEXT_SPAM
    | `String "TEXT_UNKNOWN" -> TEXT_UNKNOWN
    | `String "TEXT_TTL_EXPIRED" -> TEXT_TTL_EXPIRED
    | `String "TEXT_PROTECT_BLOCKED" -> TEXT_PROTECT_BLOCKED
    | `String "VOICE_ALL" -> VOICE_ALL
    | `String "VOICE_INITIATED" -> VOICE_INITIATED
    | `String "VOICE_RINGING" -> VOICE_RINGING
    | `String "VOICE_ANSWERED" -> VOICE_ANSWERED
    | `String "VOICE_COMPLETED" -> VOICE_COMPLETED
    | `String "VOICE_BUSY" -> VOICE_BUSY
    | `String "VOICE_NO_ANSWER" -> VOICE_NO_ANSWER
    | `String "VOICE_FAILED" -> VOICE_FAILED
    | `String "VOICE_TTL_EXPIRED" -> VOICE_TTL_EXPIRED
    | `String "MEDIA_ALL" -> MEDIA_ALL
    | `String "MEDIA_PENDING" -> MEDIA_PENDING
    | `String "MEDIA_QUEUED" -> MEDIA_QUEUED
    | `String "MEDIA_SUCCESSFUL" -> MEDIA_SUCCESSFUL
    | `String "MEDIA_DELIVERED" -> MEDIA_DELIVERED
    | `String "MEDIA_INVALID" -> MEDIA_INVALID
    | `String "MEDIA_INVALID_MESSAGE" -> MEDIA_INVALID_MESSAGE
    | `String "MEDIA_UNREACHABLE" -> MEDIA_UNREACHABLE
    | `String "MEDIA_CARRIER_UNREACHABLE" -> MEDIA_CARRIER_UNREACHABLE
    | `String "MEDIA_BLOCKED" -> MEDIA_BLOCKED
    | `String "MEDIA_CARRIER_BLOCKED" -> MEDIA_CARRIER_BLOCKED
    | `String "MEDIA_SPAM" -> MEDIA_SPAM
    | `String "MEDIA_UNKNOWN" -> MEDIA_UNKNOWN
    | `String "MEDIA_TTL_EXPIRED" -> MEDIA_TTL_EXPIRED
    | `String "MEDIA_FILE_INACCESSIBLE" -> MEDIA_FILE_INACCESSIBLE
    | `String "MEDIA_FILE_TYPE_UNSUPPORTED" -> MEDIA_FILE_TYPE_UNSUPPORTED
    | `String "MEDIA_FILE_SIZE_EXCEEDED" -> MEDIA_FILE_SIZE_EXCEEDED
    | `String "RCS_ALL" -> RCS_ALL
    | `String "RCS_QUEUED" -> RCS_QUEUED
    | `String "RCS_SENT" -> RCS_SENT
    | `String "RCS_DELIVERED" -> RCS_DELIVERED
    | `String "RCS_READ" -> RCS_READ
    | `String "RCS_FAILED" -> RCS_FAILED
    | `String "RCS_TTL_EXPIRED" -> RCS_TTL_EXPIRED
    | `String "RCS_PROTECT_BLOCKED" -> RCS_PROTECT_BLOCKED
    | `String "RCS_FALLEN_BACK_TO_SMS" -> RCS_FALLEN_BACK_TO_SMS
    | `String value -> raise (deserialize_unknown_enum_value_error path "EventType" value)
    | _ -> raise (deserialize_wrong_type_error path "EventType")
     : event_type)
    : event_type)

let event_type_list_of_yojson tree path = list_of_yojson event_type_of_yojson tree path
let event_destination_name_of_yojson = string_of_yojson

let event_destination_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     event_destination_name =
       value_for_key event_destination_name_of_yojson "EventDestinationName" _list path;
     enabled =
       value_for_key Smaws_Lib.Smithy_api.Json_deserializers.boolean__of_yojson "Enabled" _list path;
     matching_event_types = value_for_key event_type_list_of_yojson "MatchingEventTypes" _list path;
     cloud_watch_logs_destination =
       option_of_yojson
         (value_for_key cloud_watch_logs_destination_of_yojson "CloudWatchLogsDestination")
         _list path;
     kinesis_firehose_destination =
       option_of_yojson
         (value_for_key kinesis_firehose_destination_of_yojson "KinesisFirehoseDestination")
         _list path;
     sns_destination =
       option_of_yojson (value_for_key sns_destination_of_yojson "SnsDestination") _list path;
   }
    : event_destination)

let event_destination_list_of_yojson tree path =
  list_of_yojson event_destination_of_yojson tree path

let configuration_set_information_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     configuration_set_arn =
       value_for_key Smaws_Lib.Smithy_api.Json_deserializers.string__of_yojson "ConfigurationSetArn"
         _list path;
     configuration_set_name =
       value_for_key configuration_set_name_of_yojson "ConfigurationSetName" _list path;
     event_destinations =
       value_for_key event_destination_list_of_yojson "EventDestinations" _list path;
     default_message_type =
       option_of_yojson (value_for_key message_type_of_yojson "DefaultMessageType") _list path;
     default_sender_id =
       option_of_yojson (value_for_key sender_id_of_yojson "DefaultSenderId") _list path;
     default_message_feedback_enabled =
       option_of_yojson
         (value_for_key Smaws_Lib.Smithy_api.Json_deserializers.boolean__of_yojson
            "DefaultMessageFeedbackEnabled")
         _list path;
     created_timestamp =
       value_for_key Smaws_Lib.Smithy_api.Json_deserializers.timestamp_epoch_seconds_of_yojson
         "CreatedTimestamp" _list path;
     protect_configuration_id =
       option_of_yojson
         (value_for_key protect_configuration_id_or_arn_of_yojson "ProtectConfigurationId")
         _list path;
   }
    : configuration_set_information)

let configuration_set_information_list_of_yojson tree path =
  list_of_yojson configuration_set_information_of_yojson tree path

let configuration_set_name_list_of_yojson tree path =
  list_of_yojson configuration_set_name_or_arn_of_yojson tree path

let context_key_of_yojson = string_of_yojson
let context_value_of_yojson = string_of_yojson

let context_map_of_yojson tree path =
  map_of_yojson context_key_of_yojson context_value_of_yojson tree path

let country_launch_status_of_yojson (tree : t) path =
  ((match tree with
    | `String "CREATED" -> CREATED
    | `String "PENDING" -> PENDING
    | `String "PARTIAL" -> PARTIAL
    | `String "ACTIVE" -> ACTIVE
    | `String "REJECTED" -> REJECTED
    | `String value -> raise (deserialize_unknown_enum_value_error path "CountryLaunchStatus" value)
    | _ -> raise (deserialize_wrong_type_error path "CountryLaunchStatus")
     : country_launch_status)
    : country_launch_status)

let country_launch_status_filter_name_of_yojson (tree : t) path =
  ((match tree with
    | `String "country-launch-status" -> COUNTRY_LAUNCH_STATUS
    | `String value ->
        raise (deserialize_unknown_enum_value_error path "CountryLaunchStatusFilterName" value)
    | _ -> raise (deserialize_wrong_type_error path "CountryLaunchStatusFilterName")
     : country_launch_status_filter_name)
    : country_launch_status_filter_name)

let country_launch_status_filter_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     name = value_for_key country_launch_status_filter_name_of_yojson "Name" _list path;
     values = value_for_key filter_value_list_of_yojson "Values" _list path;
   }
    : country_launch_status_filter)

let country_launch_status_filter_list_of_yojson tree path =
  list_of_yojson country_launch_status_filter_of_yojson tree path

let country_launch_status_information_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     iso_country_code = value_for_key iso_country_code_of_yojson "IsoCountryCode" _list path;
     status = value_for_key country_launch_status_of_yojson "Status" _list path;
     rcs_platform_id =
       option_of_yojson
         (value_for_key Smaws_Lib.Smithy_api.Json_deserializers.string__of_yojson "RcsPlatformId")
         _list path;
     registration_id =
       value_for_key Smaws_Lib.Smithy_api.Json_deserializers.string__of_yojson "RegistrationId"
         _list path;
     carrier_status =
       value_for_key carrier_status_information_list_of_yojson "CarrierStatus" _list path;
   }
    : country_launch_status_information)

let country_launch_status_information_list_of_yojson tree path =
  list_of_yojson country_launch_status_information_of_yojson tree path

let tag_value_of_yojson = string_of_yojson
let tag_key_of_yojson = string_of_yojson

let tag_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     key = value_for_key tag_key_of_yojson "Key" _list path;
     value = value_for_key tag_value_of_yojson "Value" _list path;
   }
    : tag)

let tag_list_of_yojson tree path = list_of_yojson tag_of_yojson tree path

let create_configuration_set_result_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     configuration_set_arn =
       option_of_yojson
         (value_for_key Smaws_Lib.Smithy_api.Json_deserializers.string__of_yojson
            "ConfigurationSetArn")
         _list path;
     configuration_set_name =
       option_of_yojson
         (value_for_key configuration_set_name_of_yojson "ConfigurationSetName")
         _list path;
     tags = option_of_yojson (value_for_key tag_list_of_yojson "Tags") _list path;
     created_timestamp =
       option_of_yojson
         (value_for_key Smaws_Lib.Smithy_api.Json_deserializers.timestamp_epoch_seconds_of_yojson
            "CreatedTimestamp")
         _list path;
   }
    : create_configuration_set_result)

let create_configuration_set_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     configuration_set_name =
       value_for_key configuration_set_name_of_yojson "ConfigurationSetName" _list path;
     tags = option_of_yojson (value_for_key tag_list_of_yojson "Tags") _list path;
     client_token = option_of_yojson (value_for_key client_token_of_yojson "ClientToken") _list path;
   }
    : create_configuration_set_request)

let create_event_destination_result_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     configuration_set_arn =
       option_of_yojson
         (value_for_key Smaws_Lib.Smithy_api.Json_deserializers.string__of_yojson
            "ConfigurationSetArn")
         _list path;
     configuration_set_name =
       option_of_yojson
         (value_for_key configuration_set_name_of_yojson "ConfigurationSetName")
         _list path;
     event_destination =
       option_of_yojson (value_for_key event_destination_of_yojson "EventDestination") _list path;
   }
    : create_event_destination_result)

let create_event_destination_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     configuration_set_name =
       value_for_key configuration_set_name_or_arn_of_yojson "ConfigurationSetName" _list path;
     event_destination_name =
       value_for_key event_destination_name_of_yojson "EventDestinationName" _list path;
     matching_event_types = value_for_key event_type_list_of_yojson "MatchingEventTypes" _list path;
     cloud_watch_logs_destination =
       option_of_yojson
         (value_for_key cloud_watch_logs_destination_of_yojson "CloudWatchLogsDestination")
         _list path;
     kinesis_firehose_destination =
       option_of_yojson
         (value_for_key kinesis_firehose_destination_of_yojson "KinesisFirehoseDestination")
         _list path;
     sns_destination =
       option_of_yojson (value_for_key sns_destination_of_yojson "SnsDestination") _list path;
     client_token = option_of_yojson (value_for_key client_token_of_yojson "ClientToken") _list path;
   }
    : create_event_destination_request)

let notify_configuration_status_of_yojson (tree : t) path =
  ((match tree with
    | `String "PENDING" -> PENDING
    | `String "ACTIVE" -> ACTIVE
    | `String "REJECTED" -> REJECTED
    | `String "REQUIRES_VERIFICATION" -> REQUIRES_VERIFICATION
    | `String value ->
        raise (deserialize_unknown_enum_value_error path "NotifyConfigurationStatus" value)
    | _ -> raise (deserialize_wrong_type_error path "NotifyConfigurationStatus")
     : notify_configuration_status)
    : notify_configuration_status)

let tier_upgrade_status_of_yojson (tree : t) path =
  ((match tree with
    | `String "BASIC" -> BASIC
    | `String "PENDING_UPGRADE" -> PENDING_UPGRADE
    | `String "ADVANCED" -> ADVANCED
    | `String "REJECTED" -> REJECTED
    | `String value -> raise (deserialize_unknown_enum_value_error path "TierUpgradeStatus" value)
    | _ -> raise (deserialize_wrong_type_error path "TierUpgradeStatus")
     : tier_upgrade_status)
    : tier_upgrade_status)

let notify_configuration_tier_of_yojson (tree : t) path =
  ((match tree with
    | `String "BASIC" -> BASIC
    | `String "ADVANCED" -> ADVANCED
    | `String value ->
        raise (deserialize_unknown_enum_value_error path "NotifyConfigurationTier" value)
    | _ -> raise (deserialize_wrong_type_error path "NotifyConfigurationTier")
     : notify_configuration_tier)
    : notify_configuration_tier)

let number_capability_of_yojson (tree : t) path =
  ((match tree with
    | `String "SMS" -> SMS
    | `String "VOICE" -> VOICE
    | `String "MMS" -> MMS
    | `String "RCS" -> RCS
    | `String value -> raise (deserialize_unknown_enum_value_error path "NumberCapability" value)
    | _ -> raise (deserialize_wrong_type_error path "NumberCapability")
     : number_capability)
    : number_capability)

let notify_enabled_channels_list_of_yojson tree path =
  list_of_yojson number_capability_of_yojson tree path

let iso_country_code_list_of_yojson tree path = list_of_yojson iso_country_code_of_yojson tree path
let notify_template_id_of_yojson = string_of_yojson

let notify_configuration_use_case_of_yojson (tree : t) path =
  ((match tree with
    | `String "CODE_VERIFICATION" -> CODE_VERIFICATION
    | `String value ->
        raise (deserialize_unknown_enum_value_error path "NotifyConfigurationUseCase" value)
    | _ -> raise (deserialize_wrong_type_error path "NotifyConfigurationUseCase")
     : notify_configuration_use_case)
    : notify_configuration_use_case)

let notify_configuration_display_name_of_yojson = string_of_yojson
let notify_configuration_id_of_yojson = string_of_yojson
let notify_configuration_arn_of_yojson = string_of_yojson

let create_notify_configuration_result_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     notify_configuration_arn =
       value_for_key notify_configuration_arn_of_yojson "NotifyConfigurationArn" _list path;
     notify_configuration_id =
       value_for_key notify_configuration_id_of_yojson "NotifyConfigurationId" _list path;
     display_name =
       value_for_key notify_configuration_display_name_of_yojson "DisplayName" _list path;
     use_case = value_for_key notify_configuration_use_case_of_yojson "UseCase" _list path;
     default_template_id =
       option_of_yojson (value_for_key notify_template_id_of_yojson "DefaultTemplateId") _list path;
     pool_id =
       option_of_yojson
         (value_for_key Smaws_Lib.Smithy_api.Json_deserializers.string__of_yojson "PoolId")
         _list path;
     enabled_countries =
       option_of_yojson
         (value_for_key iso_country_code_list_of_yojson "EnabledCountries")
         _list path;
     enabled_channels =
       value_for_key notify_enabled_channels_list_of_yojson "EnabledChannels" _list path;
     tier = value_for_key notify_configuration_tier_of_yojson "Tier" _list path;
     tier_upgrade_status =
       value_for_key tier_upgrade_status_of_yojson "TierUpgradeStatus" _list path;
     status = value_for_key notify_configuration_status_of_yojson "Status" _list path;
     rejection_reason =
       option_of_yojson
         (value_for_key Smaws_Lib.Smithy_api.Json_deserializers.string__of_yojson "RejectionReason")
         _list path;
     deletion_protection_enabled =
       value_for_key Smaws_Lib.Smithy_api.Json_deserializers.primitive_boolean_of_yojson
         "DeletionProtectionEnabled" _list path;
     tags = option_of_yojson (value_for_key tag_list_of_yojson "Tags") _list path;
     created_timestamp =
       value_for_key Smaws_Lib.Smithy_api.Json_deserializers.timestamp_epoch_seconds_of_yojson
         "CreatedTimestamp" _list path;
   }
    : create_notify_configuration_result)

let create_notify_configuration_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     display_name =
       value_for_key notify_configuration_display_name_of_yojson "DisplayName" _list path;
     use_case = value_for_key notify_configuration_use_case_of_yojson "UseCase" _list path;
     default_template_id =
       option_of_yojson (value_for_key notify_template_id_of_yojson "DefaultTemplateId") _list path;
     pool_id = option_of_yojson (value_for_key pool_id_or_arn_of_yojson "PoolId") _list path;
     enabled_countries =
       option_of_yojson
         (value_for_key iso_country_code_list_of_yojson "EnabledCountries")
         _list path;
     enabled_channels =
       value_for_key notify_enabled_channels_list_of_yojson "EnabledChannels" _list path;
     deletion_protection_enabled =
       option_of_yojson
         (value_for_key Smaws_Lib.Smithy_api.Json_deserializers.boolean__of_yojson
            "DeletionProtectionEnabled")
         _list path;
     client_token = option_of_yojson (value_for_key client_token_of_yojson "ClientToken") _list path;
     tags = option_of_yojson (value_for_key tag_list_of_yojson "Tags") _list path;
   }
    : create_notify_configuration_request)

let opt_out_list_name_of_yojson = string_of_yojson

let create_opt_out_list_result_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     opt_out_list_arn =
       option_of_yojson
         (value_for_key Smaws_Lib.Smithy_api.Json_deserializers.string__of_yojson "OptOutListArn")
         _list path;
     opt_out_list_name =
       option_of_yojson (value_for_key opt_out_list_name_of_yojson "OptOutListName") _list path;
     tags = option_of_yojson (value_for_key tag_list_of_yojson "Tags") _list path;
     created_timestamp =
       option_of_yojson
         (value_for_key Smaws_Lib.Smithy_api.Json_deserializers.timestamp_epoch_seconds_of_yojson
            "CreatedTimestamp")
         _list path;
   }
    : create_opt_out_list_result)

let create_opt_out_list_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     opt_out_list_name = value_for_key opt_out_list_name_of_yojson "OptOutListName" _list path;
     tags = option_of_yojson (value_for_key tag_list_of_yojson "Tags") _list path;
     client_token = option_of_yojson (value_for_key client_token_of_yojson "ClientToken") _list path;
   }
    : create_opt_out_list_request)

let two_way_channel_arn_of_yojson = string_of_yojson

let pool_status_of_yojson (tree : t) path =
  ((match tree with
    | `String "CREATING" -> CREATING
    | `String "ACTIVE" -> ACTIVE
    | `String "DELETING" -> DELETING
    | `String value -> raise (deserialize_unknown_enum_value_error path "PoolStatus" value)
    | _ -> raise (deserialize_wrong_type_error path "PoolStatus")
     : pool_status)
    : pool_status)

let create_pool_result_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     pool_arn =
       option_of_yojson
         (value_for_key Smaws_Lib.Smithy_api.Json_deserializers.string__of_yojson "PoolArn")
         _list path;
     pool_id =
       option_of_yojson
         (value_for_key Smaws_Lib.Smithy_api.Json_deserializers.string__of_yojson "PoolId")
         _list path;
     status = option_of_yojson (value_for_key pool_status_of_yojson "Status") _list path;
     message_type = option_of_yojson (value_for_key message_type_of_yojson "MessageType") _list path;
     two_way_enabled =
       option_of_yojson
         (value_for_key Smaws_Lib.Smithy_api.Json_deserializers.primitive_boolean_of_yojson
            "TwoWayEnabled")
         _list path;
     two_way_channel_arn =
       option_of_yojson (value_for_key two_way_channel_arn_of_yojson "TwoWayChannelArn") _list path;
     two_way_channel_role =
       option_of_yojson (value_for_key iam_role_arn_of_yojson "TwoWayChannelRole") _list path;
     self_managed_opt_outs_enabled =
       option_of_yojson
         (value_for_key Smaws_Lib.Smithy_api.Json_deserializers.primitive_boolean_of_yojson
            "SelfManagedOptOutsEnabled")
         _list path;
     opt_out_list_name =
       option_of_yojson (value_for_key opt_out_list_name_of_yojson "OptOutListName") _list path;
     shared_routes_enabled =
       option_of_yojson
         (value_for_key Smaws_Lib.Smithy_api.Json_deserializers.primitive_boolean_of_yojson
            "SharedRoutesEnabled")
         _list path;
     deletion_protection_enabled =
       option_of_yojson
         (value_for_key Smaws_Lib.Smithy_api.Json_deserializers.primitive_boolean_of_yojson
            "DeletionProtectionEnabled")
         _list path;
     tags = option_of_yojson (value_for_key tag_list_of_yojson "Tags") _list path;
     created_timestamp =
       option_of_yojson
         (value_for_key Smaws_Lib.Smithy_api.Json_deserializers.timestamp_epoch_seconds_of_yojson
            "CreatedTimestamp")
         _list path;
   }
    : create_pool_result)

let create_pool_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     origination_identity =
       value_for_key phone_or_sender_id_or_arn_of_yojson "OriginationIdentity" _list path;
     iso_country_code =
       option_of_yojson (value_for_key iso_country_code_of_yojson "IsoCountryCode") _list path;
     message_type = value_for_key message_type_of_yojson "MessageType" _list path;
     deletion_protection_enabled =
       option_of_yojson
         (value_for_key Smaws_Lib.Smithy_api.Json_deserializers.boolean__of_yojson
            "DeletionProtectionEnabled")
         _list path;
     tags = option_of_yojson (value_for_key tag_list_of_yojson "Tags") _list path;
     client_token = option_of_yojson (value_for_key client_token_of_yojson "ClientToken") _list path;
   }
    : create_pool_request)

let create_protect_configuration_result_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     protect_configuration_arn =
       value_for_key protect_configuration_arn_of_yojson "ProtectConfigurationArn" _list path;
     protect_configuration_id =
       value_for_key protect_configuration_id_of_yojson "ProtectConfigurationId" _list path;
     created_timestamp =
       value_for_key Smaws_Lib.Smithy_api.Json_deserializers.timestamp_epoch_seconds_of_yojson
         "CreatedTimestamp" _list path;
     account_default =
       value_for_key Smaws_Lib.Smithy_api.Json_deserializers.primitive_boolean_of_yojson
         "AccountDefault" _list path;
     deletion_protection_enabled =
       value_for_key Smaws_Lib.Smithy_api.Json_deserializers.primitive_boolean_of_yojson
         "DeletionProtectionEnabled" _list path;
     tags = option_of_yojson (value_for_key tag_list_of_yojson "Tags") _list path;
   }
    : create_protect_configuration_result)

let create_protect_configuration_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     client_token = option_of_yojson (value_for_key client_token_of_yojson "ClientToken") _list path;
     deletion_protection_enabled =
       option_of_yojson
         (value_for_key Smaws_Lib.Smithy_api.Json_deserializers.boolean__of_yojson
            "DeletionProtectionEnabled")
         _list path;
     tags = option_of_yojson (value_for_key tag_list_of_yojson "Tags") _list path;
   }
    : create_protect_configuration_request)

let rcs_event_type_of_yojson = string_of_yojson
let rcs_event_type_list_of_yojson tree path = list_of_yojson rcs_event_type_of_yojson tree path
let two_way_media_s3_key_prefix_of_yojson = string_of_yojson
let two_way_media_s3_bucket_name_of_yojson = string_of_yojson

let rcs_agent_status_of_yojson (tree : t) path =
  ((match tree with
    | `String "CREATED" -> CREATED
    | `String "PENDING" -> PENDING
    | `String "TESTING" -> TESTING
    | `String "PARTIAL" -> PARTIAL
    | `String "ACTIVE" -> ACTIVE
    | `String "DELETED" -> DELETED
    | `String value -> raise (deserialize_unknown_enum_value_error path "RcsAgentStatus" value)
    | _ -> raise (deserialize_wrong_type_error path "RcsAgentStatus")
     : rcs_agent_status)
    : rcs_agent_status)

let create_rcs_agent_result_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     rcs_agent_arn =
       value_for_key Smaws_Lib.Smithy_api.Json_deserializers.string__of_yojson "RcsAgentArn" _list
         path;
     rcs_agent_id =
       value_for_key Smaws_Lib.Smithy_api.Json_deserializers.string__of_yojson "RcsAgentId" _list
         path;
     status = value_for_key rcs_agent_status_of_yojson "Status" _list path;
     deletion_protection_enabled =
       value_for_key Smaws_Lib.Smithy_api.Json_deserializers.primitive_boolean_of_yojson
         "DeletionProtectionEnabled" _list path;
     opt_out_list_name =
       option_of_yojson (value_for_key opt_out_list_name_of_yojson "OptOutListName") _list path;
     created_timestamp =
       value_for_key Smaws_Lib.Smithy_api.Json_deserializers.timestamp_epoch_seconds_of_yojson
         "CreatedTimestamp" _list path;
     self_managed_opt_outs_enabled =
       value_for_key Smaws_Lib.Smithy_api.Json_deserializers.primitive_boolean_of_yojson
         "SelfManagedOptOutsEnabled" _list path;
     two_way_channel_arn =
       option_of_yojson (value_for_key two_way_channel_arn_of_yojson "TwoWayChannelArn") _list path;
     two_way_channel_role =
       option_of_yojson (value_for_key iam_role_arn_of_yojson "TwoWayChannelRole") _list path;
     two_way_enabled =
       value_for_key Smaws_Lib.Smithy_api.Json_deserializers.primitive_boolean_of_yojson
         "TwoWayEnabled" _list path;
     two_way_media_s3_bucket_name =
       option_of_yojson
         (value_for_key two_way_media_s3_bucket_name_of_yojson "TwoWayMediaS3BucketName")
         _list path;
     two_way_media_s3_key_prefix =
       option_of_yojson
         (value_for_key two_way_media_s3_key_prefix_of_yojson "TwoWayMediaS3KeyPrefix")
         _list path;
     two_way_media_s3_role =
       option_of_yojson (value_for_key iam_role_arn_of_yojson "TwoWayMediaS3Role") _list path;
     two_way_rcs_events_enabled =
       option_of_yojson
         (value_for_key rcs_event_type_list_of_yojson "TwoWayRcsEventsEnabled")
         _list path;
     tags = option_of_yojson (value_for_key tag_list_of_yojson "Tags") _list path;
   }
    : create_rcs_agent_result)

let opt_out_list_name_or_arn_of_yojson = string_of_yojson

let create_rcs_agent_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     deletion_protection_enabled =
       option_of_yojson
         (value_for_key Smaws_Lib.Smithy_api.Json_deserializers.boolean__of_yojson
            "DeletionProtectionEnabled")
         _list path;
     opt_out_list_name =
       option_of_yojson
         (value_for_key opt_out_list_name_or_arn_of_yojson "OptOutListName")
         _list path;
     tags = option_of_yojson (value_for_key tag_list_of_yojson "Tags") _list path;
     client_token = option_of_yojson (value_for_key client_token_of_yojson "ClientToken") _list path;
   }
    : create_rcs_agent_request)

let string_map_of_yojson tree path =
  map_of_yojson Smaws_Lib.Smithy_api.Json_deserializers.string__of_yojson
    Smaws_Lib.Smithy_api.Json_deserializers.string__of_yojson tree path

let registration_version_number_of_yojson = long_of_yojson

let registration_status_of_yojson (tree : t) path =
  ((match tree with
    | `String "CREATED" -> CREATED
    | `String "SUBMITTED" -> SUBMITTED
    | `String "AWS_REVIEWING" -> AWS_REVIEWING
    | `String "REVIEWING" -> REVIEWING
    | `String "REQUIRES_AUTHENTICATION" -> REQUIRES_AUTHENTICATION
    | `String "PROVISIONING" -> PROVISIONING
    | `String "COMPLETE" -> COMPLETE
    | `String "REQUIRES_UPDATES" -> REQUIRES_UPDATES
    | `String "CLOSED" -> CLOSED
    | `String "DELETED" -> DELETED
    | `String value -> raise (deserialize_unknown_enum_value_error path "RegistrationStatus" value)
    | _ -> raise (deserialize_wrong_type_error path "RegistrationStatus")
     : registration_status)
    : registration_status)

let registration_type_of_yojson = string_of_yojson

let create_registration_result_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     registration_arn =
       value_for_key Smaws_Lib.Smithy_api.Json_deserializers.string__of_yojson "RegistrationArn"
         _list path;
     registration_id =
       value_for_key Smaws_Lib.Smithy_api.Json_deserializers.string__of_yojson "RegistrationId"
         _list path;
     registration_type = value_for_key registration_type_of_yojson "RegistrationType" _list path;
     registration_status =
       value_for_key registration_status_of_yojson "RegistrationStatus" _list path;
     current_version_number =
       value_for_key registration_version_number_of_yojson "CurrentVersionNumber" _list path;
     additional_attributes =
       option_of_yojson (value_for_key string_map_of_yojson "AdditionalAttributes") _list path;
     tags = option_of_yojson (value_for_key tag_list_of_yojson "Tags") _list path;
     created_timestamp =
       value_for_key Smaws_Lib.Smithy_api.Json_deserializers.timestamp_epoch_seconds_of_yojson
         "CreatedTimestamp" _list path;
   }
    : create_registration_result)

let create_registration_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     registration_type = value_for_key registration_type_of_yojson "RegistrationType" _list path;
     tags = option_of_yojson (value_for_key tag_list_of_yojson "Tags") _list path;
     client_token = option_of_yojson (value_for_key client_token_of_yojson "ClientToken") _list path;
   }
    : create_registration_request)

let phone_number_of_yojson = string_of_yojson

let create_registration_association_result_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     registration_arn =
       value_for_key Smaws_Lib.Smithy_api.Json_deserializers.string__of_yojson "RegistrationArn"
         _list path;
     registration_id =
       value_for_key Smaws_Lib.Smithy_api.Json_deserializers.string__of_yojson "RegistrationId"
         _list path;
     registration_type = value_for_key registration_type_of_yojson "RegistrationType" _list path;
     resource_arn =
       value_for_key Smaws_Lib.Smithy_api.Json_deserializers.string__of_yojson "ResourceArn" _list
         path;
     resource_id =
       value_for_key Smaws_Lib.Smithy_api.Json_deserializers.string__of_yojson "ResourceId" _list
         path;
     resource_type =
       value_for_key Smaws_Lib.Smithy_api.Json_deserializers.string__of_yojson "ResourceType" _list
         path;
     iso_country_code =
       option_of_yojson (value_for_key iso_country_code_of_yojson "IsoCountryCode") _list path;
     phone_number = option_of_yojson (value_for_key phone_number_of_yojson "PhoneNumber") _list path;
   }
    : create_registration_association_result)

let resource_id_or_arn_of_yojson = string_of_yojson
let registration_id_or_arn_of_yojson = string_of_yojson

let create_registration_association_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     registration_id = value_for_key registration_id_or_arn_of_yojson "RegistrationId" _list path;
     resource_id = value_for_key resource_id_or_arn_of_yojson "ResourceId" _list path;
   }
    : create_registration_association_request)

let create_registration_attachment_result_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     registration_attachment_arn =
       value_for_key Smaws_Lib.Smithy_api.Json_deserializers.string__of_yojson
         "RegistrationAttachmentArn" _list path;
     registration_attachment_id =
       value_for_key Smaws_Lib.Smithy_api.Json_deserializers.string__of_yojson
         "RegistrationAttachmentId" _list path;
     attachment_status = value_for_key attachment_status_of_yojson "AttachmentStatus" _list path;
     tags = option_of_yojson (value_for_key tag_list_of_yojson "Tags") _list path;
     created_timestamp =
       value_for_key Smaws_Lib.Smithy_api.Json_deserializers.timestamp_epoch_seconds_of_yojson
         "CreatedTimestamp" _list path;
   }
    : create_registration_attachment_result)

let create_registration_attachment_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     attachment_body =
       option_of_yojson (value_for_key attachment_body_of_yojson "AttachmentBody") _list path;
     attachment_url =
       option_of_yojson (value_for_key attachment_url_of_yojson "AttachmentUrl") _list path;
     tags = option_of_yojson (value_for_key tag_list_of_yojson "Tags") _list path;
     client_token = option_of_yojson (value_for_key client_token_of_yojson "ClientToken") _list path;
   }
    : create_registration_attachment_request)

let registration_version_status_history_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     draft_timestamp =
       value_for_key Smaws_Lib.Smithy_api.Json_deserializers.timestamp_epoch_seconds_of_yojson
         "DraftTimestamp" _list path;
     submitted_timestamp =
       option_of_yojson
         (value_for_key Smaws_Lib.Smithy_api.Json_deserializers.timestamp_epoch_seconds_of_yojson
            "SubmittedTimestamp")
         _list path;
     aws_reviewing_timestamp =
       option_of_yojson
         (value_for_key Smaws_Lib.Smithy_api.Json_deserializers.timestamp_epoch_seconds_of_yojson
            "AwsReviewingTimestamp")
         _list path;
     reviewing_timestamp =
       option_of_yojson
         (value_for_key Smaws_Lib.Smithy_api.Json_deserializers.timestamp_epoch_seconds_of_yojson
            "ReviewingTimestamp")
         _list path;
     requires_authentication_timestamp =
       option_of_yojson
         (value_for_key Smaws_Lib.Smithy_api.Json_deserializers.timestamp_epoch_seconds_of_yojson
            "RequiresAuthenticationTimestamp")
         _list path;
     approved_timestamp =
       option_of_yojson
         (value_for_key Smaws_Lib.Smithy_api.Json_deserializers.timestamp_epoch_seconds_of_yojson
            "ApprovedTimestamp")
         _list path;
     discarded_timestamp =
       option_of_yojson
         (value_for_key Smaws_Lib.Smithy_api.Json_deserializers.timestamp_epoch_seconds_of_yojson
            "DiscardedTimestamp")
         _list path;
     denied_timestamp =
       option_of_yojson
         (value_for_key Smaws_Lib.Smithy_api.Json_deserializers.timestamp_epoch_seconds_of_yojson
            "DeniedTimestamp")
         _list path;
     revoked_timestamp =
       option_of_yojson
         (value_for_key Smaws_Lib.Smithy_api.Json_deserializers.timestamp_epoch_seconds_of_yojson
            "RevokedTimestamp")
         _list path;
     archived_timestamp =
       option_of_yojson
         (value_for_key Smaws_Lib.Smithy_api.Json_deserializers.timestamp_epoch_seconds_of_yojson
            "ArchivedTimestamp")
         _list path;
   }
    : registration_version_status_history)

let registration_version_status_of_yojson (tree : t) path =
  ((match tree with
    | `String "DRAFT" -> DRAFT
    | `String "SUBMITTED" -> SUBMITTED
    | `String "AWS_REVIEWING" -> AWS_REVIEWING
    | `String "REVIEWING" -> REVIEWING
    | `String "REQUIRES_AUTHENTICATION" -> REQUIRES_AUTHENTICATION
    | `String "APPROVED" -> APPROVED
    | `String "DISCARDED" -> DISCARDED
    | `String "DENIED" -> DENIED
    | `String "REVOKED" -> REVOKED
    | `String "ARCHIVED" -> ARCHIVED
    | `String "REQUIRES_OFFLINE_REVIEW" -> REQUIRES_OFFLINE_REVIEW
    | `String value ->
        raise (deserialize_unknown_enum_value_error path "RegistrationVersionStatus" value)
    | _ -> raise (deserialize_wrong_type_error path "RegistrationVersionStatus")
     : registration_version_status)
    : registration_version_status)

let create_registration_version_result_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     registration_arn =
       value_for_key Smaws_Lib.Smithy_api.Json_deserializers.string__of_yojson "RegistrationArn"
         _list path;
     registration_id =
       value_for_key Smaws_Lib.Smithy_api.Json_deserializers.string__of_yojson "RegistrationId"
         _list path;
     version_number = value_for_key registration_version_number_of_yojson "VersionNumber" _list path;
     registration_version_status =
       value_for_key registration_version_status_of_yojson "RegistrationVersionStatus" _list path;
     registration_version_status_history =
       value_for_key registration_version_status_history_of_yojson
         "RegistrationVersionStatusHistory" _list path;
   }
    : create_registration_version_result)

let create_registration_version_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({ registration_id = value_for_key registration_id_or_arn_of_yojson "RegistrationId" _list path }
    : create_registration_version_request)

let verification_status_of_yojson (tree : t) path =
  ((match tree with
    | `String "PENDING" -> PENDING
    | `String "VERIFIED" -> VERIFIED
    | `String "UNSUPPORTED" -> UNSUPPORTED
    | `String value -> raise (deserialize_unknown_enum_value_error path "VerificationStatus" value)
    | _ -> raise (deserialize_wrong_type_error path "VerificationStatus")
     : verification_status)
    : verification_status)

let create_verified_destination_number_result_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     verified_destination_number_arn =
       value_for_key Smaws_Lib.Smithy_api.Json_deserializers.string__of_yojson
         "VerifiedDestinationNumberArn" _list path;
     verified_destination_number_id =
       value_for_key Smaws_Lib.Smithy_api.Json_deserializers.string__of_yojson
         "VerifiedDestinationNumberId" _list path;
     destination_phone_number =
       value_for_key phone_number_of_yojson "DestinationPhoneNumber" _list path;
     status = value_for_key verification_status_of_yojson "Status" _list path;
     rcs_agent_id =
       option_of_yojson
         (value_for_key Smaws_Lib.Smithy_api.Json_deserializers.string__of_yojson "RcsAgentId")
         _list path;
     tags = option_of_yojson (value_for_key tag_list_of_yojson "Tags") _list path;
     created_timestamp =
       value_for_key Smaws_Lib.Smithy_api.Json_deserializers.timestamp_epoch_seconds_of_yojson
         "CreatedTimestamp" _list path;
   }
    : create_verified_destination_number_result)

let rcs_agent_id_or_arn_of_yojson = string_of_yojson

let create_verified_destination_number_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     destination_phone_number =
       value_for_key phone_number_of_yojson "DestinationPhoneNumber" _list path;
     rcs_agent_id =
       option_of_yojson (value_for_key rcs_agent_id_or_arn_of_yojson "RcsAgentId") _list path;
     tags = option_of_yojson (value_for_key tag_list_of_yojson "Tags") _list path;
     client_token = option_of_yojson (value_for_key client_token_of_yojson "ClientToken") _list path;
   }
    : create_verified_destination_number_request)

let delete_account_default_protect_configuration_result_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     default_protect_configuration_arn =
       value_for_key protect_configuration_arn_of_yojson "DefaultProtectConfigurationArn" _list path;
     default_protect_configuration_id =
       value_for_key protect_configuration_id_of_yojson "DefaultProtectConfigurationId" _list path;
   }
    : delete_account_default_protect_configuration_result)

let delete_account_default_protect_configuration_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  (() : unit)

let delete_configuration_set_result_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     configuration_set_arn =
       option_of_yojson
         (value_for_key Smaws_Lib.Smithy_api.Json_deserializers.string__of_yojson
            "ConfigurationSetArn")
         _list path;
     configuration_set_name =
       option_of_yojson
         (value_for_key configuration_set_name_of_yojson "ConfigurationSetName")
         _list path;
     event_destinations =
       option_of_yojson
         (value_for_key event_destination_list_of_yojson "EventDestinations")
         _list path;
     default_message_type =
       option_of_yojson (value_for_key message_type_of_yojson "DefaultMessageType") _list path;
     default_sender_id =
       option_of_yojson (value_for_key sender_id_of_yojson "DefaultSenderId") _list path;
     default_message_feedback_enabled =
       option_of_yojson
         (value_for_key Smaws_Lib.Smithy_api.Json_deserializers.boolean__of_yojson
            "DefaultMessageFeedbackEnabled")
         _list path;
     created_timestamp =
       option_of_yojson
         (value_for_key Smaws_Lib.Smithy_api.Json_deserializers.timestamp_epoch_seconds_of_yojson
            "CreatedTimestamp")
         _list path;
   }
    : delete_configuration_set_result)

let delete_configuration_set_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     configuration_set_name =
       value_for_key configuration_set_name_or_arn_of_yojson "ConfigurationSetName" _list path;
   }
    : delete_configuration_set_request)

let delete_default_message_type_result_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     configuration_set_arn =
       option_of_yojson
         (value_for_key Smaws_Lib.Smithy_api.Json_deserializers.string__of_yojson
            "ConfigurationSetArn")
         _list path;
     configuration_set_name =
       option_of_yojson
         (value_for_key configuration_set_name_of_yojson "ConfigurationSetName")
         _list path;
     message_type = option_of_yojson (value_for_key message_type_of_yojson "MessageType") _list path;
   }
    : delete_default_message_type_result)

let delete_default_message_type_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     configuration_set_name =
       value_for_key configuration_set_name_or_arn_of_yojson "ConfigurationSetName" _list path;
   }
    : delete_default_message_type_request)

let delete_default_sender_id_result_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     configuration_set_arn =
       option_of_yojson
         (value_for_key Smaws_Lib.Smithy_api.Json_deserializers.string__of_yojson
            "ConfigurationSetArn")
         _list path;
     configuration_set_name =
       option_of_yojson
         (value_for_key configuration_set_name_of_yojson "ConfigurationSetName")
         _list path;
     sender_id = option_of_yojson (value_for_key sender_id_of_yojson "SenderId") _list path;
   }
    : delete_default_sender_id_result)

let delete_default_sender_id_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     configuration_set_name =
       value_for_key configuration_set_name_or_arn_of_yojson "ConfigurationSetName" _list path;
   }
    : delete_default_sender_id_request)

let delete_event_destination_result_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     configuration_set_arn =
       option_of_yojson
         (value_for_key Smaws_Lib.Smithy_api.Json_deserializers.string__of_yojson
            "ConfigurationSetArn")
         _list path;
     configuration_set_name =
       option_of_yojson
         (value_for_key configuration_set_name_of_yojson "ConfigurationSetName")
         _list path;
     event_destination =
       option_of_yojson (value_for_key event_destination_of_yojson "EventDestination") _list path;
   }
    : delete_event_destination_result)

let delete_event_destination_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     configuration_set_name =
       value_for_key configuration_set_name_or_arn_of_yojson "ConfigurationSetName" _list path;
     event_destination_name =
       value_for_key event_destination_name_of_yojson "EventDestinationName" _list path;
   }
    : delete_event_destination_request)

let keyword_action_of_yojson (tree : t) path =
  ((match tree with
    | `String "AUTOMATIC_RESPONSE" -> AUTOMATIC_RESPONSE
    | `String "OPT_OUT" -> OPT_OUT
    | `String "OPT_IN" -> OPT_IN
    | `String value -> raise (deserialize_unknown_enum_value_error path "KeywordAction" value)
    | _ -> raise (deserialize_wrong_type_error path "KeywordAction")
     : keyword_action)
    : keyword_action)

let keyword_message_of_yojson = string_of_yojson
let keyword_of_yojson = string_of_yojson

let delete_keyword_result_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     origination_identity_arn =
       option_of_yojson
         (value_for_key Smaws_Lib.Smithy_api.Json_deserializers.string__of_yojson
            "OriginationIdentityArn")
         _list path;
     origination_identity =
       option_of_yojson
         (value_for_key Smaws_Lib.Smithy_api.Json_deserializers.string__of_yojson
            "OriginationIdentity")
         _list path;
     keyword = option_of_yojson (value_for_key keyword_of_yojson "Keyword") _list path;
     keyword_message =
       option_of_yojson (value_for_key keyword_message_of_yojson "KeywordMessage") _list path;
     keyword_action =
       option_of_yojson (value_for_key keyword_action_of_yojson "KeywordAction") _list path;
   }
    : delete_keyword_result)

let phone_or_pool_id_or_arn_of_yojson = string_of_yojson

let delete_keyword_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     origination_identity =
       value_for_key phone_or_pool_id_or_arn_of_yojson "OriginationIdentity" _list path;
     keyword = value_for_key keyword_of_yojson "Keyword" _list path;
   }
    : delete_keyword_request)

let monthly_limit_of_yojson = long_of_yojson

let delete_media_message_spend_limit_override_result_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     monthly_limit =
       option_of_yojson (value_for_key monthly_limit_of_yojson "MonthlyLimit") _list path;
   }
    : delete_media_message_spend_limit_override_result)

let delete_media_message_spend_limit_override_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  (() : unit)

let delete_notify_configuration_result_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     notify_configuration_arn =
       value_for_key notify_configuration_arn_of_yojson "NotifyConfigurationArn" _list path;
     notify_configuration_id =
       value_for_key notify_configuration_id_of_yojson "NotifyConfigurationId" _list path;
     display_name =
       value_for_key notify_configuration_display_name_of_yojson "DisplayName" _list path;
     use_case = value_for_key notify_configuration_use_case_of_yojson "UseCase" _list path;
     default_template_id =
       option_of_yojson (value_for_key notify_template_id_of_yojson "DefaultTemplateId") _list path;
     pool_id =
       option_of_yojson
         (value_for_key Smaws_Lib.Smithy_api.Json_deserializers.string__of_yojson "PoolId")
         _list path;
     enabled_countries =
       option_of_yojson
         (value_for_key iso_country_code_list_of_yojson "EnabledCountries")
         _list path;
     enabled_channels =
       value_for_key notify_enabled_channels_list_of_yojson "EnabledChannels" _list path;
     tier = value_for_key notify_configuration_tier_of_yojson "Tier" _list path;
     tier_upgrade_status =
       value_for_key tier_upgrade_status_of_yojson "TierUpgradeStatus" _list path;
     status = value_for_key notify_configuration_status_of_yojson "Status" _list path;
     rejection_reason =
       option_of_yojson
         (value_for_key Smaws_Lib.Smithy_api.Json_deserializers.string__of_yojson "RejectionReason")
         _list path;
     deletion_protection_enabled =
       value_for_key Smaws_Lib.Smithy_api.Json_deserializers.primitive_boolean_of_yojson
         "DeletionProtectionEnabled" _list path;
     created_timestamp =
       value_for_key Smaws_Lib.Smithy_api.Json_deserializers.timestamp_epoch_seconds_of_yojson
         "CreatedTimestamp" _list path;
   }
    : delete_notify_configuration_result)

let notify_configuration_id_or_arn_of_yojson = string_of_yojson

let delete_notify_configuration_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     notify_configuration_id =
       value_for_key notify_configuration_id_or_arn_of_yojson "NotifyConfigurationId" _list path;
   }
    : delete_notify_configuration_request)

let delete_notify_message_spend_limit_override_result_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     monthly_limit =
       option_of_yojson (value_for_key monthly_limit_of_yojson "MonthlyLimit") _list path;
   }
    : delete_notify_message_spend_limit_override_result)

let delete_notify_message_spend_limit_override_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  (() : unit)

let delete_opt_out_list_result_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     opt_out_list_arn =
       option_of_yojson
         (value_for_key Smaws_Lib.Smithy_api.Json_deserializers.string__of_yojson "OptOutListArn")
         _list path;
     opt_out_list_name =
       option_of_yojson (value_for_key opt_out_list_name_of_yojson "OptOutListName") _list path;
     created_timestamp =
       option_of_yojson
         (value_for_key Smaws_Lib.Smithy_api.Json_deserializers.timestamp_epoch_seconds_of_yojson
            "CreatedTimestamp")
         _list path;
   }
    : delete_opt_out_list_result)

let delete_opt_out_list_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     opt_out_list_name =
       value_for_key opt_out_list_name_or_arn_of_yojson "OptOutListName" _list path;
   }
    : delete_opt_out_list_request)

let delete_opted_out_number_result_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     opt_out_list_arn =
       option_of_yojson
         (value_for_key Smaws_Lib.Smithy_api.Json_deserializers.string__of_yojson "OptOutListArn")
         _list path;
     opt_out_list_name =
       option_of_yojson (value_for_key opt_out_list_name_of_yojson "OptOutListName") _list path;
     opted_out_number =
       option_of_yojson (value_for_key phone_number_of_yojson "OptedOutNumber") _list path;
     opted_out_timestamp =
       option_of_yojson
         (value_for_key Smaws_Lib.Smithy_api.Json_deserializers.timestamp_epoch_seconds_of_yojson
            "OptedOutTimestamp")
         _list path;
     end_user_opted_out =
       option_of_yojson
         (value_for_key Smaws_Lib.Smithy_api.Json_deserializers.primitive_boolean_of_yojson
            "EndUserOptedOut")
         _list path;
   }
    : delete_opted_out_number_result)

let delete_opted_out_number_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     opt_out_list_name =
       value_for_key opt_out_list_name_or_arn_of_yojson "OptOutListName" _list path;
     opted_out_number = value_for_key phone_number_of_yojson "OptedOutNumber" _list path;
   }
    : delete_opted_out_number_request)

let delete_pool_result_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     pool_arn =
       option_of_yojson
         (value_for_key Smaws_Lib.Smithy_api.Json_deserializers.string__of_yojson "PoolArn")
         _list path;
     pool_id =
       option_of_yojson
         (value_for_key Smaws_Lib.Smithy_api.Json_deserializers.string__of_yojson "PoolId")
         _list path;
     status = option_of_yojson (value_for_key pool_status_of_yojson "Status") _list path;
     message_type = option_of_yojson (value_for_key message_type_of_yojson "MessageType") _list path;
     two_way_enabled =
       option_of_yojson
         (value_for_key Smaws_Lib.Smithy_api.Json_deserializers.primitive_boolean_of_yojson
            "TwoWayEnabled")
         _list path;
     two_way_channel_arn =
       option_of_yojson (value_for_key two_way_channel_arn_of_yojson "TwoWayChannelArn") _list path;
     two_way_channel_role =
       option_of_yojson (value_for_key iam_role_arn_of_yojson "TwoWayChannelRole") _list path;
     self_managed_opt_outs_enabled =
       option_of_yojson
         (value_for_key Smaws_Lib.Smithy_api.Json_deserializers.primitive_boolean_of_yojson
            "SelfManagedOptOutsEnabled")
         _list path;
     opt_out_list_name =
       option_of_yojson (value_for_key opt_out_list_name_of_yojson "OptOutListName") _list path;
     shared_routes_enabled =
       option_of_yojson
         (value_for_key Smaws_Lib.Smithy_api.Json_deserializers.primitive_boolean_of_yojson
            "SharedRoutesEnabled")
         _list path;
     created_timestamp =
       option_of_yojson
         (value_for_key Smaws_Lib.Smithy_api.Json_deserializers.timestamp_epoch_seconds_of_yojson
            "CreatedTimestamp")
         _list path;
   }
    : delete_pool_result)

let delete_pool_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({ pool_id = value_for_key pool_id_or_arn_of_yojson "PoolId" _list path } : delete_pool_request)

let delete_protect_configuration_result_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     protect_configuration_arn =
       value_for_key protect_configuration_arn_of_yojson "ProtectConfigurationArn" _list path;
     protect_configuration_id =
       value_for_key protect_configuration_id_of_yojson "ProtectConfigurationId" _list path;
     created_timestamp =
       value_for_key Smaws_Lib.Smithy_api.Json_deserializers.timestamp_epoch_seconds_of_yojson
         "CreatedTimestamp" _list path;
     account_default =
       value_for_key Smaws_Lib.Smithy_api.Json_deserializers.primitive_boolean_of_yojson
         "AccountDefault" _list path;
     deletion_protection_enabled =
       value_for_key Smaws_Lib.Smithy_api.Json_deserializers.primitive_boolean_of_yojson
         "DeletionProtectionEnabled" _list path;
   }
    : delete_protect_configuration_result)

let delete_protect_configuration_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     protect_configuration_id =
       value_for_key protect_configuration_id_or_arn_of_yojson "ProtectConfigurationId" _list path;
   }
    : delete_protect_configuration_request)

let protect_configuration_rule_override_action_of_yojson (tree : t) path =
  ((match tree with
    | `String "ALLOW" -> ALLOW
    | `String "BLOCK" -> BLOCK
    | `String value ->
        raise
          (deserialize_unknown_enum_value_error path "ProtectConfigurationRuleOverrideAction" value)
    | _ -> raise (deserialize_wrong_type_error path "ProtectConfigurationRuleOverrideAction")
     : protect_configuration_rule_override_action)
    : protect_configuration_rule_override_action)

let delete_protect_configuration_rule_set_number_override_result_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     protect_configuration_arn =
       value_for_key protect_configuration_arn_of_yojson "ProtectConfigurationArn" _list path;
     protect_configuration_id =
       value_for_key protect_configuration_id_of_yojson "ProtectConfigurationId" _list path;
     destination_phone_number =
       value_for_key phone_number_of_yojson "DestinationPhoneNumber" _list path;
     created_timestamp =
       value_for_key Smaws_Lib.Smithy_api.Json_deserializers.timestamp_epoch_seconds_of_yojson
         "CreatedTimestamp" _list path;
     action = value_for_key protect_configuration_rule_override_action_of_yojson "Action" _list path;
     iso_country_code =
       option_of_yojson (value_for_key iso_country_code_of_yojson "IsoCountryCode") _list path;
     expiration_timestamp =
       option_of_yojson
         (value_for_key Smaws_Lib.Smithy_api.Json_deserializers.timestamp_epoch_seconds_of_yojson
            "ExpirationTimestamp")
         _list path;
   }
    : delete_protect_configuration_rule_set_number_override_result)

let delete_protect_configuration_rule_set_number_override_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     protect_configuration_id =
       value_for_key protect_configuration_id_or_arn_of_yojson "ProtectConfigurationId" _list path;
     destination_phone_number =
       value_for_key phone_number_of_yojson "DestinationPhoneNumber" _list path;
   }
    : delete_protect_configuration_rule_set_number_override_request)

let delete_rcs_agent_result_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     rcs_agent_arn =
       value_for_key Smaws_Lib.Smithy_api.Json_deserializers.string__of_yojson "RcsAgentArn" _list
         path;
     rcs_agent_id =
       value_for_key Smaws_Lib.Smithy_api.Json_deserializers.string__of_yojson "RcsAgentId" _list
         path;
     status = value_for_key rcs_agent_status_of_yojson "Status" _list path;
     created_timestamp =
       value_for_key Smaws_Lib.Smithy_api.Json_deserializers.timestamp_epoch_seconds_of_yojson
         "CreatedTimestamp" _list path;
     deletion_protection_enabled =
       value_for_key Smaws_Lib.Smithy_api.Json_deserializers.primitive_boolean_of_yojson
         "DeletionProtectionEnabled" _list path;
     opt_out_list_name =
       option_of_yojson (value_for_key opt_out_list_name_of_yojson "OptOutListName") _list path;
     self_managed_opt_outs_enabled =
       value_for_key Smaws_Lib.Smithy_api.Json_deserializers.primitive_boolean_of_yojson
         "SelfManagedOptOutsEnabled" _list path;
     two_way_channel_arn =
       option_of_yojson (value_for_key two_way_channel_arn_of_yojson "TwoWayChannelArn") _list path;
     two_way_channel_role =
       option_of_yojson (value_for_key iam_role_arn_of_yojson "TwoWayChannelRole") _list path;
     two_way_enabled =
       value_for_key Smaws_Lib.Smithy_api.Json_deserializers.primitive_boolean_of_yojson
         "TwoWayEnabled" _list path;
     two_way_rcs_events_enabled =
       option_of_yojson
         (value_for_key rcs_event_type_list_of_yojson "TwoWayRcsEventsEnabled")
         _list path;
   }
    : delete_rcs_agent_result)

let delete_rcs_agent_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({ rcs_agent_id = value_for_key rcs_agent_id_or_arn_of_yojson "RcsAgentId" _list path }
    : delete_rcs_agent_request)

let delete_rcs_message_spend_limit_override_result_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     monthly_limit =
       option_of_yojson (value_for_key monthly_limit_of_yojson "MonthlyLimit") _list path;
   }
    : delete_rcs_message_spend_limit_override_result)

let delete_rcs_message_spend_limit_override_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  (() : unit)

let delete_registration_result_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     registration_arn =
       value_for_key Smaws_Lib.Smithy_api.Json_deserializers.string__of_yojson "RegistrationArn"
         _list path;
     registration_id =
       value_for_key Smaws_Lib.Smithy_api.Json_deserializers.string__of_yojson "RegistrationId"
         _list path;
     registration_type = value_for_key registration_type_of_yojson "RegistrationType" _list path;
     registration_status =
       value_for_key registration_status_of_yojson "RegistrationStatus" _list path;
     current_version_number =
       value_for_key registration_version_number_of_yojson "CurrentVersionNumber" _list path;
     approved_version_number =
       option_of_yojson
         (value_for_key registration_version_number_of_yojson "ApprovedVersionNumber")
         _list path;
     latest_denied_version_number =
       option_of_yojson
         (value_for_key registration_version_number_of_yojson "LatestDeniedVersionNumber")
         _list path;
     additional_attributes =
       option_of_yojson (value_for_key string_map_of_yojson "AdditionalAttributes") _list path;
     created_timestamp =
       value_for_key Smaws_Lib.Smithy_api.Json_deserializers.timestamp_epoch_seconds_of_yojson
         "CreatedTimestamp" _list path;
   }
    : delete_registration_result)

let delete_registration_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({ registration_id = value_for_key registration_id_or_arn_of_yojson "RegistrationId" _list path }
    : delete_registration_request)

let delete_registration_attachment_result_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     registration_attachment_arn =
       value_for_key Smaws_Lib.Smithy_api.Json_deserializers.string__of_yojson
         "RegistrationAttachmentArn" _list path;
     registration_attachment_id =
       value_for_key Smaws_Lib.Smithy_api.Json_deserializers.string__of_yojson
         "RegistrationAttachmentId" _list path;
     attachment_status = value_for_key attachment_status_of_yojson "AttachmentStatus" _list path;
     attachment_upload_error_reason =
       option_of_yojson
         (value_for_key attachment_upload_error_reason_of_yojson "AttachmentUploadErrorReason")
         _list path;
     created_timestamp =
       value_for_key Smaws_Lib.Smithy_api.Json_deserializers.timestamp_epoch_seconds_of_yojson
         "CreatedTimestamp" _list path;
   }
    : delete_registration_attachment_result)

let registration_attachment_id_or_arn_of_yojson = string_of_yojson

let delete_registration_attachment_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     registration_attachment_id =
       value_for_key registration_attachment_id_or_arn_of_yojson "RegistrationAttachmentId" _list
         path;
   }
    : delete_registration_attachment_request)

let text_value_of_yojson = string_of_yojson
let select_choice_of_yojson = string_of_yojson
let select_choice_list_of_yojson tree path = list_of_yojson select_choice_of_yojson tree path
let field_path_of_yojson = string_of_yojson

let delete_registration_field_value_result_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     registration_arn =
       value_for_key Smaws_Lib.Smithy_api.Json_deserializers.string__of_yojson "RegistrationArn"
         _list path;
     registration_id =
       value_for_key Smaws_Lib.Smithy_api.Json_deserializers.string__of_yojson "RegistrationId"
         _list path;
     version_number = value_for_key registration_version_number_of_yojson "VersionNumber" _list path;
     field_path = value_for_key field_path_of_yojson "FieldPath" _list path;
     select_choices =
       option_of_yojson (value_for_key select_choice_list_of_yojson "SelectChoices") _list path;
     text_value = option_of_yojson (value_for_key text_value_of_yojson "TextValue") _list path;
     registration_attachment_id =
       option_of_yojson
         (value_for_key Smaws_Lib.Smithy_api.Json_deserializers.string__of_yojson
            "RegistrationAttachmentId")
         _list path;
   }
    : delete_registration_field_value_result)

let delete_registration_field_value_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     registration_id = value_for_key registration_id_or_arn_of_yojson "RegistrationId" _list path;
     field_path = value_for_key field_path_of_yojson "FieldPath" _list path;
   }
    : delete_registration_field_value_request)

let resource_policy_of_yojson = string_of_yojson

let delete_resource_policy_result_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     resource_arn =
       option_of_yojson (value_for_key amazon_resource_name_of_yojson "ResourceArn") _list path;
     policy = option_of_yojson (value_for_key resource_policy_of_yojson "Policy") _list path;
     created_timestamp =
       option_of_yojson
         (value_for_key Smaws_Lib.Smithy_api.Json_deserializers.timestamp_epoch_seconds_of_yojson
            "CreatedTimestamp")
         _list path;
   }
    : delete_resource_policy_result)

let delete_resource_policy_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({ resource_arn = value_for_key amazon_resource_name_of_yojson "ResourceArn" _list path }
    : delete_resource_policy_request)

let delete_text_message_spend_limit_override_result_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     monthly_limit =
       option_of_yojson (value_for_key monthly_limit_of_yojson "MonthlyLimit") _list path;
   }
    : delete_text_message_spend_limit_override_result)

let delete_text_message_spend_limit_override_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  (() : unit)

let delete_verified_destination_number_result_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     verified_destination_number_arn =
       value_for_key Smaws_Lib.Smithy_api.Json_deserializers.string__of_yojson
         "VerifiedDestinationNumberArn" _list path;
     verified_destination_number_id =
       value_for_key Smaws_Lib.Smithy_api.Json_deserializers.string__of_yojson
         "VerifiedDestinationNumberId" _list path;
     destination_phone_number =
       value_for_key phone_number_of_yojson "DestinationPhoneNumber" _list path;
     created_timestamp =
       value_for_key Smaws_Lib.Smithy_api.Json_deserializers.timestamp_epoch_seconds_of_yojson
         "CreatedTimestamp" _list path;
   }
    : delete_verified_destination_number_result)

let verified_destination_number_id_or_arn_of_yojson = string_of_yojson

let delete_verified_destination_number_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     verified_destination_number_id =
       value_for_key verified_destination_number_id_or_arn_of_yojson "VerifiedDestinationNumberId"
         _list path;
   }
    : delete_verified_destination_number_request)

let delete_voice_message_spend_limit_override_result_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     monthly_limit =
       option_of_yojson (value_for_key monthly_limit_of_yojson "MonthlyLimit") _list path;
   }
    : delete_voice_message_spend_limit_override_result)

let delete_voice_message_spend_limit_override_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  (() : unit)

let next_token_of_yojson = string_of_yojson

let describe_account_attributes_result_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     account_attributes =
       option_of_yojson
         (value_for_key account_attribute_list_of_yojson "AccountAttributes")
         _list path;
     next_token = option_of_yojson (value_for_key next_token_of_yojson "NextToken") _list path;
   }
    : describe_account_attributes_result)

let max_results_of_yojson = int_of_yojson

let describe_account_attributes_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     next_token = option_of_yojson (value_for_key next_token_of_yojson "NextToken") _list path;
     max_results = option_of_yojson (value_for_key max_results_of_yojson "MaxResults") _list path;
   }
    : describe_account_attributes_request)

let describe_account_limits_result_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     account_limits =
       option_of_yojson (value_for_key account_limit_list_of_yojson "AccountLimits") _list path;
     next_token = option_of_yojson (value_for_key next_token_of_yojson "NextToken") _list path;
   }
    : describe_account_limits_result)

let describe_account_limits_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     next_token = option_of_yojson (value_for_key next_token_of_yojson "NextToken") _list path;
     max_results = option_of_yojson (value_for_key max_results_of_yojson "MaxResults") _list path;
   }
    : describe_account_limits_request)

let describe_configuration_sets_result_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     configuration_sets =
       option_of_yojson
         (value_for_key configuration_set_information_list_of_yojson "ConfigurationSets")
         _list path;
     next_token = option_of_yojson (value_for_key next_token_of_yojson "NextToken") _list path;
   }
    : describe_configuration_sets_result)

let describe_configuration_sets_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     configuration_set_names =
       option_of_yojson
         (value_for_key configuration_set_name_list_of_yojson "ConfigurationSetNames")
         _list path;
     filters =
       option_of_yojson (value_for_key configuration_set_filter_list_of_yojson "Filters") _list path;
     next_token = option_of_yojson (value_for_key next_token_of_yojson "NextToken") _list path;
     max_results = option_of_yojson (value_for_key max_results_of_yojson "MaxResults") _list path;
   }
    : describe_configuration_sets_request)

let keyword_information_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     keyword = value_for_key keyword_of_yojson "Keyword" _list path;
     keyword_message = value_for_key keyword_message_of_yojson "KeywordMessage" _list path;
     keyword_action = value_for_key keyword_action_of_yojson "KeywordAction" _list path;
   }
    : keyword_information)

let keyword_information_list_of_yojson tree path =
  list_of_yojson keyword_information_of_yojson tree path

let describe_keywords_result_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     origination_identity_arn =
       option_of_yojson
         (value_for_key Smaws_Lib.Smithy_api.Json_deserializers.string__of_yojson
            "OriginationIdentityArn")
         _list path;
     origination_identity =
       option_of_yojson
         (value_for_key Smaws_Lib.Smithy_api.Json_deserializers.string__of_yojson
            "OriginationIdentity")
         _list path;
     keywords =
       option_of_yojson (value_for_key keyword_information_list_of_yojson "Keywords") _list path;
     next_token = option_of_yojson (value_for_key next_token_of_yojson "NextToken") _list path;
   }
    : describe_keywords_result)

let keyword_filter_name_of_yojson (tree : t) path =
  ((match tree with
    | `String "keyword-action" -> KEYWORD_ACTION
    | `String value -> raise (deserialize_unknown_enum_value_error path "KeywordFilterName" value)
    | _ -> raise (deserialize_wrong_type_error path "KeywordFilterName")
     : keyword_filter_name)
    : keyword_filter_name)

let keyword_filter_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     name = value_for_key keyword_filter_name_of_yojson "Name" _list path;
     values = value_for_key filter_value_list_of_yojson "Values" _list path;
   }
    : keyword_filter)

let keyword_filter_list_of_yojson tree path = list_of_yojson keyword_filter_of_yojson tree path
let keyword_list_of_yojson tree path = list_of_yojson keyword_of_yojson tree path

let describe_keywords_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     origination_identity =
       value_for_key phone_or_pool_id_or_arn_of_yojson "OriginationIdentity" _list path;
     keywords = option_of_yojson (value_for_key keyword_list_of_yojson "Keywords") _list path;
     filters = option_of_yojson (value_for_key keyword_filter_list_of_yojson "Filters") _list path;
     next_token = option_of_yojson (value_for_key next_token_of_yojson "NextToken") _list path;
     max_results = option_of_yojson (value_for_key max_results_of_yojson "MaxResults") _list path;
   }
    : describe_keywords_request)

let notify_configuration_information_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     notify_configuration_arn =
       value_for_key notify_configuration_arn_of_yojson "NotifyConfigurationArn" _list path;
     notify_configuration_id =
       value_for_key notify_configuration_id_of_yojson "NotifyConfigurationId" _list path;
     display_name =
       value_for_key notify_configuration_display_name_of_yojson "DisplayName" _list path;
     use_case = value_for_key notify_configuration_use_case_of_yojson "UseCase" _list path;
     default_template_id =
       option_of_yojson (value_for_key notify_template_id_of_yojson "DefaultTemplateId") _list path;
     pool_id =
       option_of_yojson
         (value_for_key Smaws_Lib.Smithy_api.Json_deserializers.string__of_yojson "PoolId")
         _list path;
     enabled_countries =
       option_of_yojson
         (value_for_key iso_country_code_list_of_yojson "EnabledCountries")
         _list path;
     enabled_channels =
       value_for_key notify_enabled_channels_list_of_yojson "EnabledChannels" _list path;
     tier = value_for_key notify_configuration_tier_of_yojson "Tier" _list path;
     tier_upgrade_status =
       value_for_key tier_upgrade_status_of_yojson "TierUpgradeStatus" _list path;
     status = value_for_key notify_configuration_status_of_yojson "Status" _list path;
     rejection_reason =
       option_of_yojson
         (value_for_key Smaws_Lib.Smithy_api.Json_deserializers.string__of_yojson "RejectionReason")
         _list path;
     deletion_protection_enabled =
       value_for_key Smaws_Lib.Smithy_api.Json_deserializers.primitive_boolean_of_yojson
         "DeletionProtectionEnabled" _list path;
     created_timestamp =
       value_for_key Smaws_Lib.Smithy_api.Json_deserializers.timestamp_epoch_seconds_of_yojson
         "CreatedTimestamp" _list path;
   }
    : notify_configuration_information)

let notify_configuration_information_list_of_yojson tree path =
  list_of_yojson notify_configuration_information_of_yojson tree path

let describe_notify_configurations_result_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     notify_configurations =
       option_of_yojson
         (value_for_key notify_configuration_information_list_of_yojson "NotifyConfigurations")
         _list path;
     next_token = option_of_yojson (value_for_key next_token_of_yojson "NextToken") _list path;
   }
    : describe_notify_configurations_result)

let notify_configuration_filter_name_of_yojson (tree : t) path =
  ((match tree with
    | `String "display-name" -> DISPLAY_NAME
    | `String "enabled-countries" -> ENABLED_COUNTRIES
    | `String "enabled-channels" -> ENABLED_CHANNELS
    | `String "default-template" -> DEFAULT_TEMPLATE
    | `String "default-pool" -> DEFAULT_POOL
    | `String "use-case" -> USE_CASE
    | `String "status" -> STATUS
    | `String "deletion-protection-enabled" -> DELETION_PROTECTION_ENABLED
    | `String "tier-upgrade-status" -> TIER_UPGRADE_STATUS
    | `String value ->
        raise (deserialize_unknown_enum_value_error path "NotifyConfigurationFilterName" value)
    | _ -> raise (deserialize_wrong_type_error path "NotifyConfigurationFilterName")
     : notify_configuration_filter_name)
    : notify_configuration_filter_name)

let notify_configuration_filter_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     name = value_for_key notify_configuration_filter_name_of_yojson "Name" _list path;
     values = value_for_key filter_value_list_of_yojson "Values" _list path;
   }
    : notify_configuration_filter)

let notify_configuration_filter_list_of_yojson tree path =
  list_of_yojson notify_configuration_filter_of_yojson tree path

let notify_configuration_id_list_of_yojson tree path =
  list_of_yojson notify_configuration_id_or_arn_of_yojson tree path

let describe_notify_configurations_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     notify_configuration_ids =
       option_of_yojson
         (value_for_key notify_configuration_id_list_of_yojson "NotifyConfigurationIds")
         _list path;
     filters =
       option_of_yojson
         (value_for_key notify_configuration_filter_list_of_yojson "Filters")
         _list path;
     next_token = option_of_yojson (value_for_key next_token_of_yojson "NextToken") _list path;
     max_results = option_of_yojson (value_for_key max_results_of_yojson "MaxResults") _list path;
   }
    : describe_notify_configurations_request)

let voice_id_of_yojson (tree : t) path =
  ((match tree with
    | `String "AMY" -> AMY
    | `String "ASTRID" -> ASTRID
    | `String "BIANCA" -> BIANCA
    | `String "BRIAN" -> BRIAN
    | `String "CAMILA" -> CAMILA
    | `String "CARLA" -> CARLA
    | `String "CARMEN" -> CARMEN
    | `String "CELINE" -> CELINE
    | `String "CHANTAL" -> CHANTAL
    | `String "CONCHITA" -> CONCHITA
    | `String "CRISTIANO" -> CRISTIANO
    | `String "DORA" -> DORA
    | `String "EMMA" -> EMMA
    | `String "ENRIQUE" -> ENRIQUE
    | `String "EWA" -> EWA
    | `String "FILIZ" -> FILIZ
    | `String "GERAINT" -> GERAINT
    | `String "GIORGIO" -> GIORGIO
    | `String "GWYNETH" -> GWYNETH
    | `String "HANS" -> HANS
    | `String "INES" -> INES
    | `String "IVY" -> IVY
    | `String "JACEK" -> JACEK
    | `String "JAN" -> JAN
    | `String "JOANNA" -> JOANNA
    | `String "JOEY" -> JOEY
    | `String "JUSTIN" -> JUSTIN
    | `String "KARL" -> KARL
    | `String "KENDRA" -> KENDRA
    | `String "KIMBERLY" -> KIMBERLY
    | `String "LEA" -> LEA
    | `String "LIV" -> LIV
    | `String "LOTTE" -> LOTTE
    | `String "LUCIA" -> LUCIA
    | `String "LUPE" -> LUPE
    | `String "MADS" -> MADS
    | `String "MAJA" -> MAJA
    | `String "MARLENE" -> MARLENE
    | `String "MATHIEU" -> MATHIEU
    | `String "MATTHEW" -> MATTHEW
    | `String "MAXIM" -> MAXIM
    | `String "MIA" -> MIA
    | `String "MIGUEL" -> MIGUEL
    | `String "MIZUKI" -> MIZUKI
    | `String "NAJA" -> NAJA
    | `String "NICOLE" -> NICOLE
    | `String "PENELOPE" -> PENELOPE
    | `String "RAVEENA" -> RAVEENA
    | `String "RICARDO" -> RICARDO
    | `String "RUBEN" -> RUBEN
    | `String "RUSSELL" -> RUSSELL
    | `String "SALLI" -> SALLI
    | `String "SEOYEON" -> SEOYEON
    | `String "TAKUMI" -> TAKUMI
    | `String "TATYANA" -> TATYANA
    | `String "VICKI" -> VICKI
    | `String "VITORIA" -> VITORIA
    | `String "ZEINA" -> ZEINA
    | `String "ZHIYU" -> ZHIYU
    | `String value -> raise (deserialize_unknown_enum_value_error path "VoiceId" value)
    | _ -> raise (deserialize_wrong_type_error path "VoiceId")
     : voice_id)
    : voice_id)

let voice_id_list_of_yojson tree path = list_of_yojson voice_id_of_yojson tree path

let template_variable_source_of_yojson (tree : t) path =
  ((match tree with
    | `String "CUSTOMER" -> CUSTOMER
    | `String "SYSTEM" -> SYSTEM
    | `String value ->
        raise (deserialize_unknown_enum_value_error path "TemplateVariableSource" value)
    | _ -> raise (deserialize_wrong_type_error path "TemplateVariableSource")
     : template_variable_source)
    : template_variable_source)

let template_variable_type_of_yojson (tree : t) path =
  ((match tree with
    | `String "STRING" -> STRING
    | `String "INTEGER" -> INTEGER
    | `String "BOOLEAN" -> BOOLEAN
    | `String value ->
        raise (deserialize_unknown_enum_value_error path "TemplateVariableType" value)
    | _ -> raise (deserialize_wrong_type_error path "TemplateVariableType")
     : template_variable_type)
    : template_variable_type)

let template_variable_metadata_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     type_ = value_for_key template_variable_type_of_yojson "Type" _list path;
     required =
       value_for_key Smaws_Lib.Smithy_api.Json_deserializers.primitive_boolean_of_yojson "Required"
         _list path;
     description =
       option_of_yojson
         (value_for_key Smaws_Lib.Smithy_api.Json_deserializers.string__of_yojson "Description")
         _list path;
     max_length =
       option_of_yojson
         (value_for_key Smaws_Lib.Smithy_api.Json_deserializers.integer_of_yojson "MaxLength")
         _list path;
     min_value =
       option_of_yojson
         (value_for_key Smaws_Lib.Smithy_api.Json_deserializers.integer_of_yojson "MinValue")
         _list path;
     max_value =
       option_of_yojson
         (value_for_key Smaws_Lib.Smithy_api.Json_deserializers.integer_of_yojson "MaxValue")
         _list path;
     default_value =
       option_of_yojson
         (value_for_key Smaws_Lib.Smithy_api.Json_deserializers.string__of_yojson "DefaultValue")
         _list path;
     pattern =
       option_of_yojson
         (value_for_key Smaws_Lib.Smithy_api.Json_deserializers.string__of_yojson "Pattern")
         _list path;
     sample =
       option_of_yojson
         (value_for_key Smaws_Lib.Smithy_api.Json_deserializers.string__of_yojson "Sample")
         _list path;
     source =
       option_of_yojson (value_for_key template_variable_source_of_yojson "Source") _list path;
   }
    : template_variable_metadata)

let template_variables_map_of_yojson tree path =
  map_of_yojson Smaws_Lib.Smithy_api.Json_deserializers.string__of_yojson
    template_variable_metadata_of_yojson tree path

let template_content_of_yojson = string_of_yojson
let notify_language_code_of_yojson = string_of_yojson

let notify_template_status_of_yojson (tree : t) path =
  ((match tree with
    | `String "ACTIVE" -> ACTIVE
    | `String "INACTIVE" -> INACTIVE
    | `String value ->
        raise (deserialize_unknown_enum_value_error path "NotifyTemplateStatus" value)
    | _ -> raise (deserialize_wrong_type_error path "NotifyTemplateStatus")
     : notify_template_status)
    : notify_template_status)

let notify_configuration_tier_list_of_yojson tree path =
  list_of_yojson notify_configuration_tier_of_yojson tree path

let number_capability_list_of_yojson tree path =
  list_of_yojson number_capability_of_yojson tree path

let notify_template_type_of_yojson (tree : t) path =
  ((match tree with
    | `String "OTP_VERIFICATION" -> OTP_VERIFICATION
    | `String value -> raise (deserialize_unknown_enum_value_error path "NotifyTemplateType" value)
    | _ -> raise (deserialize_wrong_type_error path "NotifyTemplateType")
     : notify_template_type)
    : notify_template_type)

let notify_template_version_of_yojson = int_of_yojson

let notify_template_information_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     template_id = value_for_key notify_template_id_of_yojson "TemplateId" _list path;
     version = value_for_key notify_template_version_of_yojson "Version" _list path;
     template_type = value_for_key notify_template_type_of_yojson "TemplateType" _list path;
     channels = value_for_key number_capability_list_of_yojson "Channels" _list path;
     tier_access =
       option_of_yojson
         (value_for_key notify_configuration_tier_list_of_yojson "TierAccess")
         _list path;
     status = option_of_yojson (value_for_key notify_template_status_of_yojson "Status") _list path;
     supported_countries =
       option_of_yojson
         (value_for_key iso_country_code_list_of_yojson "SupportedCountries")
         _list path;
     language_code =
       option_of_yojson (value_for_key notify_language_code_of_yojson "LanguageCode") _list path;
     content = option_of_yojson (value_for_key template_content_of_yojson "Content") _list path;
     variables =
       option_of_yojson (value_for_key template_variables_map_of_yojson "Variables") _list path;
     supported_voice_ids =
       option_of_yojson (value_for_key voice_id_list_of_yojson "SupportedVoiceIds") _list path;
     created_timestamp =
       value_for_key Smaws_Lib.Smithy_api.Json_deserializers.timestamp_epoch_seconds_of_yojson
         "CreatedTimestamp" _list path;
   }
    : notify_template_information)

let notify_template_information_list_of_yojson tree path =
  list_of_yojson notify_template_information_of_yojson tree path

let describe_notify_templates_result_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     notify_templates =
       option_of_yojson
         (value_for_key notify_template_information_list_of_yojson "NotifyTemplates")
         _list path;
     next_token = option_of_yojson (value_for_key next_token_of_yojson "NextToken") _list path;
   }
    : describe_notify_templates_result)

let notify_template_filter_name_of_yojson (tree : t) path =
  ((match tree with
    | `String "template-type" -> TEMPLATE_TYPE
    | `String "channels" -> CHANNELS
    | `String "tier-access" -> TIER_ACCESS
    | `String "supported-countries" -> SUPPORTED_COUNTRIES
    | `String "language-code" -> LANGUAGE_CODE
    | `String "supported-voice-ids" -> SUPPORTED_VOICE_IDS
    | `String value ->
        raise (deserialize_unknown_enum_value_error path "NotifyTemplateFilterName" value)
    | _ -> raise (deserialize_wrong_type_error path "NotifyTemplateFilterName")
     : notify_template_filter_name)
    : notify_template_filter_name)

let notify_template_filter_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     name = value_for_key notify_template_filter_name_of_yojson "Name" _list path;
     values = value_for_key filter_value_list_of_yojson "Values" _list path;
   }
    : notify_template_filter)

let notify_template_filter_list_of_yojson tree path =
  list_of_yojson notify_template_filter_of_yojson tree path

let notify_template_id_list_of_yojson tree path =
  list_of_yojson notify_template_id_of_yojson tree path

let describe_notify_templates_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     template_ids =
       option_of_yojson (value_for_key notify_template_id_list_of_yojson "TemplateIds") _list path;
     filters =
       option_of_yojson (value_for_key notify_template_filter_list_of_yojson "Filters") _list path;
     next_token = option_of_yojson (value_for_key next_token_of_yojson "NextToken") _list path;
     max_results = option_of_yojson (value_for_key max_results_of_yojson "MaxResults") _list path;
   }
    : describe_notify_templates_request)

let opt_out_list_information_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     opt_out_list_arn =
       value_for_key Smaws_Lib.Smithy_api.Json_deserializers.string__of_yojson "OptOutListArn" _list
         path;
     opt_out_list_name = value_for_key opt_out_list_name_of_yojson "OptOutListName" _list path;
     created_timestamp =
       value_for_key Smaws_Lib.Smithy_api.Json_deserializers.timestamp_epoch_seconds_of_yojson
         "CreatedTimestamp" _list path;
   }
    : opt_out_list_information)

let opt_out_list_information_list_of_yojson tree path =
  list_of_yojson opt_out_list_information_of_yojson tree path

let describe_opt_out_lists_result_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     opt_out_lists =
       option_of_yojson
         (value_for_key opt_out_list_information_list_of_yojson "OptOutLists")
         _list path;
     next_token = option_of_yojson (value_for_key next_token_of_yojson "NextToken") _list path;
   }
    : describe_opt_out_lists_result)

let owner_of_yojson (tree : t) path =
  ((match tree with
    | `String "SELF" -> SELF
    | `String "SHARED" -> SHARED
    | `String value -> raise (deserialize_unknown_enum_value_error path "Owner" value)
    | _ -> raise (deserialize_wrong_type_error path "Owner")
     : owner)
    : owner)

let opt_out_list_name_list_of_yojson tree path =
  list_of_yojson opt_out_list_name_or_arn_of_yojson tree path

let describe_opt_out_lists_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     opt_out_list_names =
       option_of_yojson
         (value_for_key opt_out_list_name_list_of_yojson "OptOutListNames")
         _list path;
     next_token = option_of_yojson (value_for_key next_token_of_yojson "NextToken") _list path;
     max_results = option_of_yojson (value_for_key max_results_of_yojson "MaxResults") _list path;
     owner = option_of_yojson (value_for_key owner_of_yojson "Owner") _list path;
   }
    : describe_opt_out_lists_request)

let opted_out_number_information_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     opted_out_number = value_for_key phone_number_of_yojson "OptedOutNumber" _list path;
     opted_out_timestamp =
       value_for_key Smaws_Lib.Smithy_api.Json_deserializers.timestamp_epoch_seconds_of_yojson
         "OptedOutTimestamp" _list path;
     end_user_opted_out =
       value_for_key Smaws_Lib.Smithy_api.Json_deserializers.primitive_boolean_of_yojson
         "EndUserOptedOut" _list path;
   }
    : opted_out_number_information)

let opted_out_number_information_list_of_yojson tree path =
  list_of_yojson opted_out_number_information_of_yojson tree path

let describe_opted_out_numbers_result_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     opt_out_list_arn =
       option_of_yojson
         (value_for_key Smaws_Lib.Smithy_api.Json_deserializers.string__of_yojson "OptOutListArn")
         _list path;
     opt_out_list_name =
       option_of_yojson (value_for_key opt_out_list_name_of_yojson "OptOutListName") _list path;
     opted_out_numbers =
       option_of_yojson
         (value_for_key opted_out_number_information_list_of_yojson "OptedOutNumbers")
         _list path;
     next_token = option_of_yojson (value_for_key next_token_of_yojson "NextToken") _list path;
   }
    : describe_opted_out_numbers_result)

let opted_out_filter_name_of_yojson (tree : t) path =
  ((match tree with
    | `String "end-user-opted-out" -> END_USER_OPTED_OUT
    | `String value -> raise (deserialize_unknown_enum_value_error path "OptedOutFilterName" value)
    | _ -> raise (deserialize_wrong_type_error path "OptedOutFilterName")
     : opted_out_filter_name)
    : opted_out_filter_name)

let opted_out_filter_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     name = value_for_key opted_out_filter_name_of_yojson "Name" _list path;
     values = value_for_key filter_value_list_of_yojson "Values" _list path;
   }
    : opted_out_filter)

let opted_out_filter_list_of_yojson tree path = list_of_yojson opted_out_filter_of_yojson tree path
let opted_out_number_list_of_yojson tree path = list_of_yojson phone_number_of_yojson tree path

let describe_opted_out_numbers_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     opt_out_list_name =
       value_for_key opt_out_list_name_or_arn_of_yojson "OptOutListName" _list path;
     opted_out_numbers =
       option_of_yojson (value_for_key opted_out_number_list_of_yojson "OptedOutNumbers") _list path;
     filters = option_of_yojson (value_for_key opted_out_filter_list_of_yojson "Filters") _list path;
     next_token = option_of_yojson (value_for_key next_token_of_yojson "NextToken") _list path;
     max_results = option_of_yojson (value_for_key max_results_of_yojson "MaxResults") _list path;
   }
    : describe_opted_out_numbers_request)

let number_type_of_yojson (tree : t) path =
  ((match tree with
    | `String "SHORT_CODE" -> SHORT_CODE
    | `String "LONG_CODE" -> LONG_CODE
    | `String "TOLL_FREE" -> TOLL_FREE
    | `String "TEN_DLC" -> TEN_DLC
    | `String "SIMULATOR" -> SIMULATOR
    | `String value -> raise (deserialize_unknown_enum_value_error path "NumberType" value)
    | _ -> raise (deserialize_wrong_type_error path "NumberType")
     : number_type)
    : number_type)

let number_status_of_yojson (tree : t) path =
  ((match tree with
    | `String "PENDING" -> PENDING
    | `String "ACTIVE" -> ACTIVE
    | `String "ASSOCIATING" -> ASSOCIATING
    | `String "DISASSOCIATING" -> DISASSOCIATING
    | `String "DELETED" -> DELETED
    | `String value -> raise (deserialize_unknown_enum_value_error path "NumberStatus" value)
    | _ -> raise (deserialize_wrong_type_error path "NumberStatus")
     : number_status)
    : number_status)

let phone_number_information_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     phone_number_arn =
       value_for_key Smaws_Lib.Smithy_api.Json_deserializers.string__of_yojson "PhoneNumberArn"
         _list path;
     phone_number_id =
       option_of_yojson
         (value_for_key Smaws_Lib.Smithy_api.Json_deserializers.string__of_yojson "PhoneNumberId")
         _list path;
     phone_number = value_for_key phone_number_of_yojson "PhoneNumber" _list path;
     status = value_for_key number_status_of_yojson "Status" _list path;
     iso_country_code = value_for_key iso_country_code_of_yojson "IsoCountryCode" _list path;
     message_type = value_for_key message_type_of_yojson "MessageType" _list path;
     number_capabilities =
       value_for_key number_capability_list_of_yojson "NumberCapabilities" _list path;
     number_type = value_for_key number_type_of_yojson "NumberType" _list path;
     monthly_leasing_price =
       value_for_key Smaws_Lib.Smithy_api.Json_deserializers.string__of_yojson "MonthlyLeasingPrice"
         _list path;
     two_way_enabled =
       value_for_key Smaws_Lib.Smithy_api.Json_deserializers.primitive_boolean_of_yojson
         "TwoWayEnabled" _list path;
     two_way_channel_arn =
       option_of_yojson (value_for_key two_way_channel_arn_of_yojson "TwoWayChannelArn") _list path;
     two_way_channel_role =
       option_of_yojson (value_for_key iam_role_arn_of_yojson "TwoWayChannelRole") _list path;
     self_managed_opt_outs_enabled =
       value_for_key Smaws_Lib.Smithy_api.Json_deserializers.primitive_boolean_of_yojson
         "SelfManagedOptOutsEnabled" _list path;
     opt_out_list_name = value_for_key opt_out_list_name_of_yojson "OptOutListName" _list path;
     international_sending_enabled =
       option_of_yojson
         (value_for_key Smaws_Lib.Smithy_api.Json_deserializers.primitive_boolean_of_yojson
            "InternationalSendingEnabled")
         _list path;
     deletion_protection_enabled =
       value_for_key Smaws_Lib.Smithy_api.Json_deserializers.primitive_boolean_of_yojson
         "DeletionProtectionEnabled" _list path;
     pool_id =
       option_of_yojson
         (value_for_key Smaws_Lib.Smithy_api.Json_deserializers.string__of_yojson "PoolId")
         _list path;
     registration_id =
       option_of_yojson
         (value_for_key Smaws_Lib.Smithy_api.Json_deserializers.string__of_yojson "RegistrationId")
         _list path;
     created_timestamp =
       value_for_key Smaws_Lib.Smithy_api.Json_deserializers.timestamp_epoch_seconds_of_yojson
         "CreatedTimestamp" _list path;
   }
    : phone_number_information)

let phone_number_information_list_of_yojson tree path =
  list_of_yojson phone_number_information_of_yojson tree path

let describe_phone_numbers_result_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     phone_numbers =
       option_of_yojson
         (value_for_key phone_number_information_list_of_yojson "PhoneNumbers")
         _list path;
     next_token = option_of_yojson (value_for_key next_token_of_yojson "NextToken") _list path;
   }
    : describe_phone_numbers_result)

let phone_number_filter_name_of_yojson (tree : t) path =
  ((match tree with
    | `String "status" -> STATUS
    | `String "iso-country-code" -> ISO_COUNTRY_CODE
    | `String "message-type" -> MESSAGE_TYPE
    | `String "number-capability" -> NUMBER_CAPABILITY
    | `String "number-type" -> NUMBER_TYPE
    | `String "two-way-enabled" -> TWO_WAY_ENABLED
    | `String "self-managed-opt-outs-enabled" -> SELF_MANAGED_OPT_OUTS_ENABLED
    | `String "opt-out-list-name" -> OPT_OUT_LIST_NAME
    | `String "deletion-protection-enabled" -> DELETION_PROTECTION_ENABLED
    | `String "two-way-channel-arn" -> TWO_WAY_CHANNEL_ARN
    | `String value ->
        raise (deserialize_unknown_enum_value_error path "PhoneNumberFilterName" value)
    | _ -> raise (deserialize_wrong_type_error path "PhoneNumberFilterName")
     : phone_number_filter_name)
    : phone_number_filter_name)

let phone_number_filter_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     name = value_for_key phone_number_filter_name_of_yojson "Name" _list path;
     values = value_for_key filter_value_list_of_yojson "Values" _list path;
   }
    : phone_number_filter)

let phone_number_filter_list_of_yojson tree path =
  list_of_yojson phone_number_filter_of_yojson tree path

let phone_number_id_or_arn_of_yojson = string_of_yojson

let phone_number_id_list_of_yojson tree path =
  list_of_yojson phone_number_id_or_arn_of_yojson tree path

let describe_phone_numbers_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     phone_number_ids =
       option_of_yojson (value_for_key phone_number_id_list_of_yojson "PhoneNumberIds") _list path;
     filters =
       option_of_yojson (value_for_key phone_number_filter_list_of_yojson "Filters") _list path;
     next_token = option_of_yojson (value_for_key next_token_of_yojson "NextToken") _list path;
     max_results = option_of_yojson (value_for_key max_results_of_yojson "MaxResults") _list path;
     owner = option_of_yojson (value_for_key owner_of_yojson "Owner") _list path;
   }
    : describe_phone_numbers_request)

let pool_information_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     pool_arn =
       value_for_key Smaws_Lib.Smithy_api.Json_deserializers.string__of_yojson "PoolArn" _list path;
     pool_id =
       value_for_key Smaws_Lib.Smithy_api.Json_deserializers.string__of_yojson "PoolId" _list path;
     status = value_for_key pool_status_of_yojson "Status" _list path;
     message_type = value_for_key message_type_of_yojson "MessageType" _list path;
     two_way_enabled =
       value_for_key Smaws_Lib.Smithy_api.Json_deserializers.primitive_boolean_of_yojson
         "TwoWayEnabled" _list path;
     two_way_channel_arn =
       option_of_yojson (value_for_key two_way_channel_arn_of_yojson "TwoWayChannelArn") _list path;
     two_way_channel_role =
       option_of_yojson (value_for_key iam_role_arn_of_yojson "TwoWayChannelRole") _list path;
     self_managed_opt_outs_enabled =
       value_for_key Smaws_Lib.Smithy_api.Json_deserializers.primitive_boolean_of_yojson
         "SelfManagedOptOutsEnabled" _list path;
     opt_out_list_name = value_for_key opt_out_list_name_of_yojson "OptOutListName" _list path;
     shared_routes_enabled =
       value_for_key Smaws_Lib.Smithy_api.Json_deserializers.primitive_boolean_of_yojson
         "SharedRoutesEnabled" _list path;
     deletion_protection_enabled =
       value_for_key Smaws_Lib.Smithy_api.Json_deserializers.primitive_boolean_of_yojson
         "DeletionProtectionEnabled" _list path;
     created_timestamp =
       value_for_key Smaws_Lib.Smithy_api.Json_deserializers.timestamp_epoch_seconds_of_yojson
         "CreatedTimestamp" _list path;
   }
    : pool_information)

let pool_information_list_of_yojson tree path = list_of_yojson pool_information_of_yojson tree path

let describe_pools_result_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     pools = option_of_yojson (value_for_key pool_information_list_of_yojson "Pools") _list path;
     next_token = option_of_yojson (value_for_key next_token_of_yojson "NextToken") _list path;
   }
    : describe_pools_result)

let pool_filter_name_of_yojson (tree : t) path =
  ((match tree with
    | `String "status" -> STATUS
    | `String "message-type" -> MESSAGE_TYPE
    | `String "two-way-enabled" -> TWO_WAY_ENABLED
    | `String "self-managed-opt-outs-enabled" -> SELF_MANAGED_OPT_OUTS_ENABLED
    | `String "opt-out-list-name" -> OPT_OUT_LIST_NAME
    | `String "shared-routes-enabled" -> SHARED_ROUTES_ENABLED
    | `String "deletion-protection-enabled" -> DELETION_PROTECTION_ENABLED
    | `String "two-way-channel-arn" -> TWO_WAY_CHANNEL_ARN
    | `String value -> raise (deserialize_unknown_enum_value_error path "PoolFilterName" value)
    | _ -> raise (deserialize_wrong_type_error path "PoolFilterName")
     : pool_filter_name)
    : pool_filter_name)

let pool_filter_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     name = value_for_key pool_filter_name_of_yojson "Name" _list path;
     values = value_for_key filter_value_list_of_yojson "Values" _list path;
   }
    : pool_filter)

let pool_filter_list_of_yojson tree path = list_of_yojson pool_filter_of_yojson tree path
let pool_id_list_of_yojson tree path = list_of_yojson pool_id_or_arn_of_yojson tree path

let describe_pools_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     pool_ids = option_of_yojson (value_for_key pool_id_list_of_yojson "PoolIds") _list path;
     filters = option_of_yojson (value_for_key pool_filter_list_of_yojson "Filters") _list path;
     next_token = option_of_yojson (value_for_key next_token_of_yojson "NextToken") _list path;
     max_results = option_of_yojson (value_for_key max_results_of_yojson "MaxResults") _list path;
     owner = option_of_yojson (value_for_key owner_of_yojson "Owner") _list path;
   }
    : describe_pools_request)

let protect_configuration_information_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     protect_configuration_arn =
       value_for_key protect_configuration_arn_of_yojson "ProtectConfigurationArn" _list path;
     protect_configuration_id =
       value_for_key protect_configuration_id_of_yojson "ProtectConfigurationId" _list path;
     created_timestamp =
       value_for_key Smaws_Lib.Smithy_api.Json_deserializers.timestamp_epoch_seconds_of_yojson
         "CreatedTimestamp" _list path;
     account_default =
       value_for_key Smaws_Lib.Smithy_api.Json_deserializers.primitive_boolean_of_yojson
         "AccountDefault" _list path;
     deletion_protection_enabled =
       value_for_key Smaws_Lib.Smithy_api.Json_deserializers.primitive_boolean_of_yojson
         "DeletionProtectionEnabled" _list path;
   }
    : protect_configuration_information)

let protect_configuration_information_list_of_yojson tree path =
  list_of_yojson protect_configuration_information_of_yojson tree path

let describe_protect_configurations_result_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     protect_configurations =
       option_of_yojson
         (value_for_key protect_configuration_information_list_of_yojson "ProtectConfigurations")
         _list path;
     next_token = option_of_yojson (value_for_key next_token_of_yojson "NextToken") _list path;
   }
    : describe_protect_configurations_result)

let protect_configuration_filter_name_of_yojson (tree : t) path =
  ((match tree with
    | `String "account-default" -> ACCOUNT_DEFAULT
    | `String "deletion-protection-enabled" -> DELETION_PROTECTION_ENABLED
    | `String value ->
        raise (deserialize_unknown_enum_value_error path "ProtectConfigurationFilterName" value)
    | _ -> raise (deserialize_wrong_type_error path "ProtectConfigurationFilterName")
     : protect_configuration_filter_name)
    : protect_configuration_filter_name)

let protect_configuration_filter_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     name = value_for_key protect_configuration_filter_name_of_yojson "Name" _list path;
     values = value_for_key filter_value_list_of_yojson "Values" _list path;
   }
    : protect_configuration_filter)

let protect_configuration_filter_list_of_yojson tree path =
  list_of_yojson protect_configuration_filter_of_yojson tree path

let protect_configuration_id_list_of_yojson tree path =
  list_of_yojson protect_configuration_id_or_arn_of_yojson tree path

let describe_protect_configurations_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     protect_configuration_ids =
       option_of_yojson
         (value_for_key protect_configuration_id_list_of_yojson "ProtectConfigurationIds")
         _list path;
     filters =
       option_of_yojson
         (value_for_key protect_configuration_filter_list_of_yojson "Filters")
         _list path;
     next_token = option_of_yojson (value_for_key next_token_of_yojson "NextToken") _list path;
     max_results = option_of_yojson (value_for_key max_results_of_yojson "MaxResults") _list path;
   }
    : describe_protect_configurations_request)

let describe_rcs_agent_country_launch_status_result_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     rcs_agent_id =
       value_for_key Smaws_Lib.Smithy_api.Json_deserializers.string__of_yojson "RcsAgentId" _list
         path;
     rcs_agent_arn =
       value_for_key Smaws_Lib.Smithy_api.Json_deserializers.string__of_yojson "RcsAgentArn" _list
         path;
     country_launch_status =
       option_of_yojson
         (value_for_key country_launch_status_information_list_of_yojson "CountryLaunchStatus")
         _list path;
     next_token = option_of_yojson (value_for_key next_token_of_yojson "NextToken") _list path;
   }
    : describe_rcs_agent_country_launch_status_result)

let describe_rcs_agent_country_launch_status_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     rcs_agent_id = value_for_key rcs_agent_id_or_arn_of_yojson "RcsAgentId" _list path;
     iso_country_codes =
       option_of_yojson (value_for_key iso_country_code_list_of_yojson "IsoCountryCodes") _list path;
     filters =
       option_of_yojson
         (value_for_key country_launch_status_filter_list_of_yojson "Filters")
         _list path;
     max_results = option_of_yojson (value_for_key max_results_of_yojson "MaxResults") _list path;
     next_token = option_of_yojson (value_for_key next_token_of_yojson "NextToken") _list path;
   }
    : describe_rcs_agent_country_launch_status_request)

let testing_agent_status_of_yojson (tree : t) path =
  ((match tree with
    | `String "CREATED" -> CREATED
    | `String "PENDING" -> PENDING
    | `String "ACTIVE" -> ACTIVE
    | `String value -> raise (deserialize_unknown_enum_value_error path "TestingAgentStatus" value)
    | _ -> raise (deserialize_wrong_type_error path "TestingAgentStatus")
     : testing_agent_status)
    : testing_agent_status)

let testing_agent_information_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     status = value_for_key testing_agent_status_of_yojson "Status" _list path;
     testing_agent_id =
       option_of_yojson
         (value_for_key Smaws_Lib.Smithy_api.Json_deserializers.string__of_yojson "TestingAgentId")
         _list path;
     registration_id =
       value_for_key Smaws_Lib.Smithy_api.Json_deserializers.string__of_yojson "RegistrationId"
         _list path;
   }
    : testing_agent_information)

let rcs_agent_information_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     rcs_agent_arn =
       value_for_key Smaws_Lib.Smithy_api.Json_deserializers.string__of_yojson "RcsAgentArn" _list
         path;
     rcs_agent_id =
       value_for_key Smaws_Lib.Smithy_api.Json_deserializers.string__of_yojson "RcsAgentId" _list
         path;
     status = value_for_key rcs_agent_status_of_yojson "Status" _list path;
     created_timestamp =
       value_for_key Smaws_Lib.Smithy_api.Json_deserializers.timestamp_epoch_seconds_of_yojson
         "CreatedTimestamp" _list path;
     deletion_protection_enabled =
       value_for_key Smaws_Lib.Smithy_api.Json_deserializers.primitive_boolean_of_yojson
         "DeletionProtectionEnabled" _list path;
     opt_out_list_name =
       option_of_yojson (value_for_key opt_out_list_name_of_yojson "OptOutListName") _list path;
     self_managed_opt_outs_enabled =
       value_for_key Smaws_Lib.Smithy_api.Json_deserializers.primitive_boolean_of_yojson
         "SelfManagedOptOutsEnabled" _list path;
     two_way_channel_arn =
       option_of_yojson (value_for_key two_way_channel_arn_of_yojson "TwoWayChannelArn") _list path;
     two_way_channel_role =
       option_of_yojson (value_for_key iam_role_arn_of_yojson "TwoWayChannelRole") _list path;
     two_way_enabled =
       value_for_key Smaws_Lib.Smithy_api.Json_deserializers.primitive_boolean_of_yojson
         "TwoWayEnabled" _list path;
     pool_id =
       option_of_yojson
         (value_for_key Smaws_Lib.Smithy_api.Json_deserializers.string__of_yojson "PoolId")
         _list path;
     two_way_media_s3_bucket_name =
       option_of_yojson
         (value_for_key two_way_media_s3_bucket_name_of_yojson "TwoWayMediaS3BucketName")
         _list path;
     two_way_media_s3_key_prefix =
       option_of_yojson
         (value_for_key two_way_media_s3_key_prefix_of_yojson "TwoWayMediaS3KeyPrefix")
         _list path;
     two_way_media_s3_role =
       option_of_yojson (value_for_key iam_role_arn_of_yojson "TwoWayMediaS3Role") _list path;
     two_way_rcs_events_enabled =
       option_of_yojson
         (value_for_key rcs_event_type_list_of_yojson "TwoWayRcsEventsEnabled")
         _list path;
     testing_agent =
       option_of_yojson
         (value_for_key testing_agent_information_of_yojson "TestingAgent")
         _list path;
   }
    : rcs_agent_information)

let rcs_agent_information_list_of_yojson tree path =
  list_of_yojson rcs_agent_information_of_yojson tree path

let describe_rcs_agents_result_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     rcs_agents =
       option_of_yojson (value_for_key rcs_agent_information_list_of_yojson "RcsAgents") _list path;
     next_token = option_of_yojson (value_for_key next_token_of_yojson "NextToken") _list path;
   }
    : describe_rcs_agents_result)

let rcs_agent_filter_name_of_yojson (tree : t) path =
  ((match tree with
    | `String "status" -> STATUS
    | `String "two-way-enabled" -> TWO_WAY_ENABLED
    | `String "self-managed-opt-outs-enabled" -> SELF_MANAGED_OPT_OUTS_ENABLED
    | `String "opt-out-list-name" -> OPT_OUT_LIST_NAME
    | `String "deletion-protection-enabled" -> DELETION_PROTECTION_ENABLED
    | `String "two-way-channel-arn" -> TWO_WAY_CHANNEL_ARN
    | `String value -> raise (deserialize_unknown_enum_value_error path "RcsAgentFilterName" value)
    | _ -> raise (deserialize_wrong_type_error path "RcsAgentFilterName")
     : rcs_agent_filter_name)
    : rcs_agent_filter_name)

let rcs_agent_filter_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     name = value_for_key rcs_agent_filter_name_of_yojson "Name" _list path;
     values = value_for_key filter_value_list_of_yojson "Values" _list path;
   }
    : rcs_agent_filter)

let rcs_agent_filter_list_of_yojson tree path = list_of_yojson rcs_agent_filter_of_yojson tree path
let rcs_agent_id_list_of_yojson tree path = list_of_yojson rcs_agent_id_or_arn_of_yojson tree path

let describe_rcs_agents_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     rcs_agent_ids =
       option_of_yojson (value_for_key rcs_agent_id_list_of_yojson "RcsAgentIds") _list path;
     owner = option_of_yojson (value_for_key owner_of_yojson "Owner") _list path;
     filters = option_of_yojson (value_for_key rcs_agent_filter_list_of_yojson "Filters") _list path;
     next_token = option_of_yojson (value_for_key next_token_of_yojson "NextToken") _list path;
     max_results = option_of_yojson (value_for_key max_results_of_yojson "MaxResults") _list path;
   }
    : describe_rcs_agents_request)

let registration_attachments_information_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     registration_attachment_arn =
       value_for_key Smaws_Lib.Smithy_api.Json_deserializers.string__of_yojson
         "RegistrationAttachmentArn" _list path;
     registration_attachment_id =
       value_for_key Smaws_Lib.Smithy_api.Json_deserializers.string__of_yojson
         "RegistrationAttachmentId" _list path;
     attachment_status = value_for_key attachment_status_of_yojson "AttachmentStatus" _list path;
     attachment_upload_error_reason =
       option_of_yojson
         (value_for_key attachment_upload_error_reason_of_yojson "AttachmentUploadErrorReason")
         _list path;
     created_timestamp =
       value_for_key Smaws_Lib.Smithy_api.Json_deserializers.timestamp_epoch_seconds_of_yojson
         "CreatedTimestamp" _list path;
     attachment_url =
       option_of_yojson
         (value_for_key Smaws_Lib.Smithy_api.Json_deserializers.string__of_yojson "AttachmentUrl")
         _list path;
   }
    : registration_attachments_information)

let registration_attachments_information_list_of_yojson tree path =
  list_of_yojson registration_attachments_information_of_yojson tree path

let describe_registration_attachments_result_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     registration_attachments =
       value_for_key registration_attachments_information_list_of_yojson "RegistrationAttachments"
         _list path;
     next_token = option_of_yojson (value_for_key next_token_of_yojson "NextToken") _list path;
   }
    : describe_registration_attachments_result)

let registration_attachment_filter_name_of_yojson (tree : t) path =
  ((match tree with
    | `String "attachment-status" -> ATTACHMENT_STATUS
    | `String value ->
        raise (deserialize_unknown_enum_value_error path "RegistrationAttachmentFilterName" value)
    | _ -> raise (deserialize_wrong_type_error path "RegistrationAttachmentFilterName")
     : registration_attachment_filter_name)
    : registration_attachment_filter_name)

let registration_attachment_filter_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     name = value_for_key registration_attachment_filter_name_of_yojson "Name" _list path;
     values = value_for_key filter_value_list_of_yojson "Values" _list path;
   }
    : registration_attachment_filter)

let registration_attachment_filter_list_of_yojson tree path =
  list_of_yojson registration_attachment_filter_of_yojson tree path

let registration_attachment_id_list_of_yojson tree path =
  list_of_yojson registration_id_or_arn_of_yojson tree path

let describe_registration_attachments_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     registration_attachment_ids =
       option_of_yojson
         (value_for_key registration_attachment_id_list_of_yojson "RegistrationAttachmentIds")
         _list path;
     filters =
       option_of_yojson
         (value_for_key registration_attachment_filter_list_of_yojson "Filters")
         _list path;
     next_token = option_of_yojson (value_for_key next_token_of_yojson "NextToken") _list path;
     max_results = option_of_yojson (value_for_key max_results_of_yojson "MaxResults") _list path;
   }
    : describe_registration_attachments_request)

let select_option_description_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     option_ =
       value_for_key Smaws_Lib.Smithy_api.Json_deserializers.string__of_yojson "Option" _list path;
     title =
       option_of_yojson
         (value_for_key Smaws_Lib.Smithy_api.Json_deserializers.string__of_yojson "Title")
         _list path;
     description =
       option_of_yojson
         (value_for_key Smaws_Lib.Smithy_api.Json_deserializers.string__of_yojson "Description")
         _list path;
   }
    : select_option_description)

let select_option_descriptions_list_of_yojson tree path =
  list_of_yojson select_option_description_of_yojson tree path

let registration_field_display_hints_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     title =
       value_for_key Smaws_Lib.Smithy_api.Json_deserializers.string__of_yojson "Title" _list path;
     short_description =
       value_for_key Smaws_Lib.Smithy_api.Json_deserializers.string__of_yojson "ShortDescription"
         _list path;
     long_description =
       option_of_yojson
         (value_for_key Smaws_Lib.Smithy_api.Json_deserializers.string__of_yojson "LongDescription")
         _list path;
     documentation_title =
       option_of_yojson
         (value_for_key Smaws_Lib.Smithy_api.Json_deserializers.string__of_yojson
            "DocumentationTitle")
         _list path;
     documentation_link =
       option_of_yojson
         (value_for_key Smaws_Lib.Smithy_api.Json_deserializers.string__of_yojson
            "DocumentationLink")
         _list path;
     select_option_descriptions =
       option_of_yojson
         (value_for_key select_option_descriptions_list_of_yojson "SelectOptionDescriptions")
         _list path;
     text_validation_description =
       option_of_yojson
         (value_for_key Smaws_Lib.Smithy_api.Json_deserializers.string__of_yojson
            "TextValidationDescription")
         _list path;
     example_text_value =
       option_of_yojson
         (value_for_key Smaws_Lib.Smithy_api.Json_deserializers.string__of_yojson "ExampleTextValue")
         _list path;
   }
    : registration_field_display_hints)

let text_validation_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     min_length =
       value_for_key Smaws_Lib.Smithy_api.Json_deserializers.integer_of_yojson "MinLength" _list
         path;
     max_length =
       value_for_key Smaws_Lib.Smithy_api.Json_deserializers.integer_of_yojson "MaxLength" _list
         path;
     pattern =
       value_for_key Smaws_Lib.Smithy_api.Json_deserializers.string__of_yojson "Pattern" _list path;
   }
    : text_validation)

let string_list_of_yojson tree path =
  list_of_yojson Smaws_Lib.Smithy_api.Json_deserializers.string__of_yojson tree path

let select_validation_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     min_choices =
       value_for_key Smaws_Lib.Smithy_api.Json_deserializers.integer_of_yojson "MinChoices" _list
         path;
     max_choices =
       value_for_key Smaws_Lib.Smithy_api.Json_deserializers.integer_of_yojson "MaxChoices" _list
         path;
     options = value_for_key string_list_of_yojson "Options" _list path;
   }
    : select_validation)

let field_requirement_of_yojson (tree : t) path =
  ((match tree with
    | `String "REQUIRED" -> REQUIRED
    | `String "CONDITIONAL" -> CONDITIONAL
    | `String "OPTIONAL" -> OPTIONAL
    | `String value -> raise (deserialize_unknown_enum_value_error path "FieldRequirement" value)
    | _ -> raise (deserialize_wrong_type_error path "FieldRequirement")
     : field_requirement)
    : field_requirement)

let field_type_of_yojson (tree : t) path =
  ((match tree with
    | `String "SELECT" -> SELECT
    | `String "TEXT" -> TEXT
    | `String "ATTACHMENT" -> ATTACHMENT
    | `String value -> raise (deserialize_unknown_enum_value_error path "FieldType" value)
    | _ -> raise (deserialize_wrong_type_error path "FieldType")
     : field_type)
    : field_type)

let section_path_of_yojson = string_of_yojson

let registration_field_definition_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     section_path = value_for_key section_path_of_yojson "SectionPath" _list path;
     field_path = value_for_key field_path_of_yojson "FieldPath" _list path;
     field_type = value_for_key field_type_of_yojson "FieldType" _list path;
     field_requirement = value_for_key field_requirement_of_yojson "FieldRequirement" _list path;
     select_validation =
       option_of_yojson (value_for_key select_validation_of_yojson "SelectValidation") _list path;
     text_validation =
       option_of_yojson (value_for_key text_validation_of_yojson "TextValidation") _list path;
     display_hints =
       value_for_key registration_field_display_hints_of_yojson "DisplayHints" _list path;
   }
    : registration_field_definition)

let registration_field_definition_list_of_yojson tree path =
  list_of_yojson registration_field_definition_of_yojson tree path

let describe_registration_field_definitions_result_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     registration_type = value_for_key registration_type_of_yojson "RegistrationType" _list path;
     registration_field_definitions =
       value_for_key registration_field_definition_list_of_yojson "RegistrationFieldDefinitions"
         _list path;
     next_token = option_of_yojson (value_for_key next_token_of_yojson "NextToken") _list path;
   }
    : describe_registration_field_definitions_result)

let field_path_list_of_yojson tree path = list_of_yojson field_path_of_yojson tree path

let describe_registration_field_definitions_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     registration_type = value_for_key registration_type_of_yojson "RegistrationType" _list path;
     section_path = option_of_yojson (value_for_key section_path_of_yojson "SectionPath") _list path;
     field_paths =
       option_of_yojson (value_for_key field_path_list_of_yojson "FieldPaths") _list path;
     next_token = option_of_yojson (value_for_key next_token_of_yojson "NextToken") _list path;
     max_results = option_of_yojson (value_for_key max_results_of_yojson "MaxResults") _list path;
   }
    : describe_registration_field_definitions_request)

let registration_field_value_information_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     field_path = value_for_key field_path_of_yojson "FieldPath" _list path;
     select_choices =
       option_of_yojson (value_for_key select_choice_list_of_yojson "SelectChoices") _list path;
     text_value = option_of_yojson (value_for_key text_value_of_yojson "TextValue") _list path;
     registration_attachment_id =
       option_of_yojson
         (value_for_key registration_attachment_id_or_arn_of_yojson "RegistrationAttachmentId")
         _list path;
     denied_reason =
       option_of_yojson
         (value_for_key Smaws_Lib.Smithy_api.Json_deserializers.string__of_yojson "DeniedReason")
         _list path;
     feedback =
       option_of_yojson
         (value_for_key Smaws_Lib.Smithy_api.Json_deserializers.string__of_yojson "Feedback")
         _list path;
   }
    : registration_field_value_information)

let registration_field_value_information_list_of_yojson tree path =
  list_of_yojson registration_field_value_information_of_yojson tree path

let describe_registration_field_values_result_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     registration_arn =
       value_for_key Smaws_Lib.Smithy_api.Json_deserializers.string__of_yojson "RegistrationArn"
         _list path;
     registration_id =
       value_for_key Smaws_Lib.Smithy_api.Json_deserializers.string__of_yojson "RegistrationId"
         _list path;
     version_number = value_for_key registration_version_number_of_yojson "VersionNumber" _list path;
     registration_field_values =
       value_for_key registration_field_value_information_list_of_yojson "RegistrationFieldValues"
         _list path;
     next_token = option_of_yojson (value_for_key next_token_of_yojson "NextToken") _list path;
   }
    : describe_registration_field_values_result)

let describe_registration_field_values_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     registration_id = value_for_key registration_id_or_arn_of_yojson "RegistrationId" _list path;
     version_number =
       option_of_yojson
         (value_for_key registration_version_number_of_yojson "VersionNumber")
         _list path;
     section_path = option_of_yojson (value_for_key section_path_of_yojson "SectionPath") _list path;
     field_paths =
       option_of_yojson (value_for_key field_path_list_of_yojson "FieldPaths") _list path;
     next_token = option_of_yojson (value_for_key next_token_of_yojson "NextToken") _list path;
     max_results = option_of_yojson (value_for_key max_results_of_yojson "MaxResults") _list path;
   }
    : describe_registration_field_values_request)

let registration_section_display_hints_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     title =
       value_for_key Smaws_Lib.Smithy_api.Json_deserializers.string__of_yojson "Title" _list path;
     short_description =
       value_for_key Smaws_Lib.Smithy_api.Json_deserializers.string__of_yojson "ShortDescription"
         _list path;
     long_description =
       option_of_yojson
         (value_for_key Smaws_Lib.Smithy_api.Json_deserializers.string__of_yojson "LongDescription")
         _list path;
     documentation_title =
       option_of_yojson
         (value_for_key Smaws_Lib.Smithy_api.Json_deserializers.string__of_yojson
            "DocumentationTitle")
         _list path;
     documentation_link =
       option_of_yojson
         (value_for_key Smaws_Lib.Smithy_api.Json_deserializers.string__of_yojson
            "DocumentationLink")
         _list path;
   }
    : registration_section_display_hints)

let registration_section_definition_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     section_path = value_for_key section_path_of_yojson "SectionPath" _list path;
     display_hints =
       value_for_key registration_section_display_hints_of_yojson "DisplayHints" _list path;
   }
    : registration_section_definition)

let registration_section_definition_list_of_yojson tree path =
  list_of_yojson registration_section_definition_of_yojson tree path

let describe_registration_section_definitions_result_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     registration_type = value_for_key registration_type_of_yojson "RegistrationType" _list path;
     registration_section_definitions =
       value_for_key registration_section_definition_list_of_yojson "RegistrationSectionDefinitions"
         _list path;
     next_token = option_of_yojson (value_for_key next_token_of_yojson "NextToken") _list path;
   }
    : describe_registration_section_definitions_result)

let section_path_list_of_yojson tree path = list_of_yojson section_path_of_yojson tree path

let describe_registration_section_definitions_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     registration_type = value_for_key registration_type_of_yojson "RegistrationType" _list path;
     section_paths =
       option_of_yojson (value_for_key section_path_list_of_yojson "SectionPaths") _list path;
     next_token = option_of_yojson (value_for_key next_token_of_yojson "NextToken") _list path;
     max_results = option_of_yojson (value_for_key max_results_of_yojson "MaxResults") _list path;
   }
    : describe_registration_section_definitions_request)

let registration_type_display_hints_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     title =
       value_for_key Smaws_Lib.Smithy_api.Json_deserializers.string__of_yojson "Title" _list path;
     short_description =
       option_of_yojson
         (value_for_key Smaws_Lib.Smithy_api.Json_deserializers.string__of_yojson "ShortDescription")
         _list path;
     long_description =
       option_of_yojson
         (value_for_key Smaws_Lib.Smithy_api.Json_deserializers.string__of_yojson "LongDescription")
         _list path;
     documentation_title =
       option_of_yojson
         (value_for_key Smaws_Lib.Smithy_api.Json_deserializers.string__of_yojson
            "DocumentationTitle")
         _list path;
     documentation_link =
       option_of_yojson
         (value_for_key Smaws_Lib.Smithy_api.Json_deserializers.string__of_yojson
            "DocumentationLink")
         _list path;
   }
    : registration_type_display_hints)

let registration_disassociation_behavior_of_yojson (tree : t) path =
  ((match tree with
    | `String "DISASSOCIATE_ALL_CLOSES_REGISTRATION" -> DISASSOCIATE_ALL_CLOSES_REGISTRATION
    | `String "DISASSOCIATE_ALL_ALLOWS_DELETE_REGISTRATION" ->
        DISASSOCIATE_ALL_ALLOWS_DELETE_REGISTRATION
    | `String "DELETE_REGISTRATION_DISASSOCIATES" -> DELETE_REGISTRATION_DISASSOCIATES
    | `String value ->
        raise (deserialize_unknown_enum_value_error path "RegistrationDisassociationBehavior" value)
    | _ -> raise (deserialize_wrong_type_error path "RegistrationDisassociationBehavior")
     : registration_disassociation_behavior)
    : registration_disassociation_behavior)

let registration_association_behavior_of_yojson (tree : t) path =
  ((match tree with
    | `String "ASSOCIATE_BEFORE_SUBMIT" -> ASSOCIATE_BEFORE_SUBMIT
    | `String "ASSOCIATE_ON_APPROVAL" -> ASSOCIATE_ON_APPROVAL
    | `String "ASSOCIATE_AFTER_COMPLETE" -> ASSOCIATE_AFTER_COMPLETE
    | `String value ->
        raise (deserialize_unknown_enum_value_error path "RegistrationAssociationBehavior" value)
    | _ -> raise (deserialize_wrong_type_error path "RegistrationAssociationBehavior")
     : registration_association_behavior)
    : registration_association_behavior)

let supported_association_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     resource_type =
       value_for_key Smaws_Lib.Smithy_api.Json_deserializers.string__of_yojson "ResourceType" _list
         path;
     iso_country_code =
       option_of_yojson (value_for_key iso_country_code_of_yojson "IsoCountryCode") _list path;
     association_behavior =
       value_for_key registration_association_behavior_of_yojson "AssociationBehavior" _list path;
     disassociation_behavior =
       value_for_key registration_disassociation_behavior_of_yojson "DisassociationBehavior" _list
         path;
   }
    : supported_association)

let supported_association_list_of_yojson tree path =
  list_of_yojson supported_association_of_yojson tree path

let registration_type_definition_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     registration_type = value_for_key registration_type_of_yojson "RegistrationType" _list path;
     supported_associations =
       option_of_yojson
         (value_for_key supported_association_list_of_yojson "SupportedAssociations")
         _list path;
     display_hints =
       value_for_key registration_type_display_hints_of_yojson "DisplayHints" _list path;
   }
    : registration_type_definition)

let registration_type_definition_list_of_yojson tree path =
  list_of_yojson registration_type_definition_of_yojson tree path

let describe_registration_type_definitions_result_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     registration_type_definitions =
       value_for_key registration_type_definition_list_of_yojson "RegistrationTypeDefinitions" _list
         path;
     next_token = option_of_yojson (value_for_key next_token_of_yojson "NextToken") _list path;
   }
    : describe_registration_type_definitions_result)

let registration_type_filter_name_of_yojson (tree : t) path =
  ((match tree with
    | `String "supported-association-resource-type" -> SUPPORTED_ASSOCIATION_RESOURCE_TYPE
    | `String "supported-association-iso-country-code" -> SUPPORTED_ASSOCIATION_ISO_COUNTRY_CODE
    | `String value ->
        raise (deserialize_unknown_enum_value_error path "RegistrationTypeFilterName" value)
    | _ -> raise (deserialize_wrong_type_error path "RegistrationTypeFilterName")
     : registration_type_filter_name)
    : registration_type_filter_name)

let registration_type_filter_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     name = value_for_key registration_type_filter_name_of_yojson "Name" _list path;
     values = value_for_key filter_value_list_of_yojson "Values" _list path;
   }
    : registration_type_filter)

let registration_type_filter_list_of_yojson tree path =
  list_of_yojson registration_type_filter_of_yojson tree path

let registration_type_list_of_yojson tree path =
  list_of_yojson registration_type_of_yojson tree path

let describe_registration_type_definitions_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     registration_types =
       option_of_yojson
         (value_for_key registration_type_list_of_yojson "RegistrationTypes")
         _list path;
     filters =
       option_of_yojson (value_for_key registration_type_filter_list_of_yojson "Filters") _list path;
     next_token = option_of_yojson (value_for_key next_token_of_yojson "NextToken") _list path;
     max_results = option_of_yojson (value_for_key max_results_of_yojson "MaxResults") _list path;
   }
    : describe_registration_type_definitions_request)

let registration_denied_reason_information_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     reason =
       value_for_key Smaws_Lib.Smithy_api.Json_deserializers.string__of_yojson "Reason" _list path;
     short_description =
       value_for_key Smaws_Lib.Smithy_api.Json_deserializers.string__of_yojson "ShortDescription"
         _list path;
     long_description =
       option_of_yojson
         (value_for_key Smaws_Lib.Smithy_api.Json_deserializers.string__of_yojson "LongDescription")
         _list path;
     documentation_title =
       option_of_yojson
         (value_for_key Smaws_Lib.Smithy_api.Json_deserializers.string__of_yojson
            "DocumentationTitle")
         _list path;
     documentation_link =
       option_of_yojson
         (value_for_key Smaws_Lib.Smithy_api.Json_deserializers.string__of_yojson
            "DocumentationLink")
         _list path;
   }
    : registration_denied_reason_information)

let registration_denied_reason_information_list_of_yojson tree path =
  list_of_yojson registration_denied_reason_information_of_yojson tree path

let registration_version_information_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     version_number = value_for_key registration_version_number_of_yojson "VersionNumber" _list path;
     registration_version_status =
       value_for_key registration_version_status_of_yojson "RegistrationVersionStatus" _list path;
     registration_version_status_history =
       value_for_key registration_version_status_history_of_yojson
         "RegistrationVersionStatusHistory" _list path;
     denied_reasons =
       option_of_yojson
         (value_for_key registration_denied_reason_information_list_of_yojson "DeniedReasons")
         _list path;
     feedback =
       option_of_yojson
         (value_for_key Smaws_Lib.Smithy_api.Json_deserializers.string__of_yojson "Feedback")
         _list path;
   }
    : registration_version_information)

let registration_version_information_list_of_yojson tree path =
  list_of_yojson registration_version_information_of_yojson tree path

let describe_registration_versions_result_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     registration_arn =
       value_for_key Smaws_Lib.Smithy_api.Json_deserializers.string__of_yojson "RegistrationArn"
         _list path;
     registration_id =
       value_for_key Smaws_Lib.Smithy_api.Json_deserializers.string__of_yojson "RegistrationId"
         _list path;
     registration_versions =
       value_for_key registration_version_information_list_of_yojson "RegistrationVersions" _list
         path;
     next_token = option_of_yojson (value_for_key next_token_of_yojson "NextToken") _list path;
   }
    : describe_registration_versions_result)

let registration_version_filter_name_of_yojson (tree : t) path =
  ((match tree with
    | `String "registration-version-status" -> REGISTRATION_VERSION_STATUS
    | `String value ->
        raise (deserialize_unknown_enum_value_error path "RegistrationVersionFilterName" value)
    | _ -> raise (deserialize_wrong_type_error path "RegistrationVersionFilterName")
     : registration_version_filter_name)
    : registration_version_filter_name)

let registration_version_filter_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     name = value_for_key registration_version_filter_name_of_yojson "Name" _list path;
     values = value_for_key filter_value_list_of_yojson "Values" _list path;
   }
    : registration_version_filter)

let registration_version_filter_list_of_yojson tree path =
  list_of_yojson registration_version_filter_of_yojson tree path

let registration_version_number_list_of_yojson tree path =
  list_of_yojson registration_version_number_of_yojson tree path

let describe_registration_versions_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     registration_id = value_for_key registration_id_or_arn_of_yojson "RegistrationId" _list path;
     version_numbers =
       option_of_yojson
         (value_for_key registration_version_number_list_of_yojson "VersionNumbers")
         _list path;
     filters =
       option_of_yojson
         (value_for_key registration_version_filter_list_of_yojson "Filters")
         _list path;
     next_token = option_of_yojson (value_for_key next_token_of_yojson "NextToken") _list path;
     max_results = option_of_yojson (value_for_key max_results_of_yojson "MaxResults") _list path;
   }
    : describe_registration_versions_request)

let registration_information_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     registration_arn =
       value_for_key Smaws_Lib.Smithy_api.Json_deserializers.string__of_yojson "RegistrationArn"
         _list path;
     registration_id =
       value_for_key Smaws_Lib.Smithy_api.Json_deserializers.string__of_yojson "RegistrationId"
         _list path;
     registration_type = value_for_key registration_type_of_yojson "RegistrationType" _list path;
     registration_status =
       value_for_key registration_status_of_yojson "RegistrationStatus" _list path;
     current_version_number =
       value_for_key registration_version_number_of_yojson "CurrentVersionNumber" _list path;
     approved_version_number =
       option_of_yojson
         (value_for_key registration_version_number_of_yojson "ApprovedVersionNumber")
         _list path;
     latest_denied_version_number =
       option_of_yojson
         (value_for_key registration_version_number_of_yojson "LatestDeniedVersionNumber")
         _list path;
     additional_attributes =
       option_of_yojson (value_for_key string_map_of_yojson "AdditionalAttributes") _list path;
     created_timestamp =
       value_for_key Smaws_Lib.Smithy_api.Json_deserializers.timestamp_epoch_seconds_of_yojson
         "CreatedTimestamp" _list path;
   }
    : registration_information)

let registration_information_list_of_yojson tree path =
  list_of_yojson registration_information_of_yojson tree path

let describe_registrations_result_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     registrations =
       value_for_key registration_information_list_of_yojson "Registrations" _list path;
     next_token = option_of_yojson (value_for_key next_token_of_yojson "NextToken") _list path;
   }
    : describe_registrations_result)

let registration_filter_name_of_yojson (tree : t) path =
  ((match tree with
    | `String "registration-type" -> REGISTRATION_TYPE
    | `String "registration-status" -> REGISTRATION_STATUS
    | `String value ->
        raise (deserialize_unknown_enum_value_error path "RegistrationFilterName" value)
    | _ -> raise (deserialize_wrong_type_error path "RegistrationFilterName")
     : registration_filter_name)
    : registration_filter_name)

let registration_filter_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     name = value_for_key registration_filter_name_of_yojson "Name" _list path;
     values = value_for_key filter_value_list_of_yojson "Values" _list path;
   }
    : registration_filter)

let registration_filter_list_of_yojson tree path =
  list_of_yojson registration_filter_of_yojson tree path

let registration_id_list_of_yojson tree path =
  list_of_yojson registration_id_or_arn_of_yojson tree path

let describe_registrations_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     registration_ids =
       option_of_yojson (value_for_key registration_id_list_of_yojson "RegistrationIds") _list path;
     filters =
       option_of_yojson (value_for_key registration_filter_list_of_yojson "Filters") _list path;
     next_token = option_of_yojson (value_for_key next_token_of_yojson "NextToken") _list path;
     max_results = option_of_yojson (value_for_key max_results_of_yojson "MaxResults") _list path;
   }
    : describe_registrations_request)

let message_type_list_of_yojson tree path = list_of_yojson message_type_of_yojson tree path

let sender_id_information_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     sender_id_arn =
       value_for_key Smaws_Lib.Smithy_api.Json_deserializers.string__of_yojson "SenderIdArn" _list
         path;
     sender_id = value_for_key sender_id_of_yojson "SenderId" _list path;
     iso_country_code = value_for_key iso_country_code_of_yojson "IsoCountryCode" _list path;
     message_types = value_for_key message_type_list_of_yojson "MessageTypes" _list path;
     monthly_leasing_price =
       value_for_key Smaws_Lib.Smithy_api.Json_deserializers.string__of_yojson "MonthlyLeasingPrice"
         _list path;
     deletion_protection_enabled =
       value_for_key Smaws_Lib.Smithy_api.Json_deserializers.primitive_boolean_of_yojson
         "DeletionProtectionEnabled" _list path;
     registered =
       value_for_key Smaws_Lib.Smithy_api.Json_deserializers.primitive_boolean_of_yojson
         "Registered" _list path;
     registration_id =
       option_of_yojson
         (value_for_key Smaws_Lib.Smithy_api.Json_deserializers.string__of_yojson "RegistrationId")
         _list path;
   }
    : sender_id_information)

let sender_id_information_list_of_yojson tree path =
  list_of_yojson sender_id_information_of_yojson tree path

let describe_sender_ids_result_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     sender_ids =
       option_of_yojson (value_for_key sender_id_information_list_of_yojson "SenderIds") _list path;
     next_token = option_of_yojson (value_for_key next_token_of_yojson "NextToken") _list path;
   }
    : describe_sender_ids_result)

let sender_id_filter_name_of_yojson (tree : t) path =
  ((match tree with
    | `String "sender-id" -> SENDER_ID
    | `String "iso-country-code" -> ISO_COUNTRY_CODE
    | `String "message-type" -> MESSAGE_TYPE
    | `String "deletion-protection-enabled" -> DELETION_PROTECTION_ENABLED
    | `String "registered" -> REGISTERED
    | `String value -> raise (deserialize_unknown_enum_value_error path "SenderIdFilterName" value)
    | _ -> raise (deserialize_wrong_type_error path "SenderIdFilterName")
     : sender_id_filter_name)
    : sender_id_filter_name)

let sender_id_filter_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     name = value_for_key sender_id_filter_name_of_yojson "Name" _list path;
     values = value_for_key filter_value_list_of_yojson "Values" _list path;
   }
    : sender_id_filter)

let sender_id_filter_list_of_yojson tree path = list_of_yojson sender_id_filter_of_yojson tree path
let sender_id_or_arn_of_yojson = string_of_yojson

let sender_id_and_country_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     sender_id = value_for_key sender_id_or_arn_of_yojson "SenderId" _list path;
     iso_country_code = value_for_key iso_country_code_of_yojson "IsoCountryCode" _list path;
   }
    : sender_id_and_country)

let sender_id_list_of_yojson tree path = list_of_yojson sender_id_and_country_of_yojson tree path

let describe_sender_ids_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     sender_ids = option_of_yojson (value_for_key sender_id_list_of_yojson "SenderIds") _list path;
     filters = option_of_yojson (value_for_key sender_id_filter_list_of_yojson "Filters") _list path;
     next_token = option_of_yojson (value_for_key next_token_of_yojson "NextToken") _list path;
     max_results = option_of_yojson (value_for_key max_results_of_yojson "MaxResults") _list path;
     owner = option_of_yojson (value_for_key owner_of_yojson "Owner") _list path;
   }
    : describe_sender_ids_request)

let spend_limit_name_of_yojson (tree : t) path =
  ((match tree with
    | `String "TEXT_MESSAGE_MONTHLY_SPEND_LIMIT" -> TEXT_MESSAGE_MONTHLY_SPEND_LIMIT
    | `String "VOICE_MESSAGE_MONTHLY_SPEND_LIMIT" -> VOICE_MESSAGE_MONTHLY_SPEND_LIMIT
    | `String "MEDIA_MESSAGE_MONTHLY_SPEND_LIMIT" -> MEDIA_MESSAGE_MONTHLY_SPEND_LIMIT
    | `String "NOTIFY_MESSAGE_MONTHLY_SPEND_LIMIT" -> NOTIFY_MESSAGE_MONTHLY_SPEND_LIMIT
    | `String "RCS_MESSAGE_MONTHLY_SPEND_LIMIT" -> RCS_MESSAGE_MONTHLY_SPEND_LIMIT
    | `String value -> raise (deserialize_unknown_enum_value_error path "SpendLimitName" value)
    | _ -> raise (deserialize_wrong_type_error path "SpendLimitName")
     : spend_limit_name)
    : spend_limit_name)

let spend_limit_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     name = value_for_key spend_limit_name_of_yojson "Name" _list path;
     enforced_limit =
       value_for_key Smaws_Lib.Smithy_api.Json_deserializers.primitive_long_of_yojson
         "EnforcedLimit" _list path;
     max_limit =
       value_for_key Smaws_Lib.Smithy_api.Json_deserializers.primitive_long_of_yojson "MaxLimit"
         _list path;
     overridden =
       value_for_key Smaws_Lib.Smithy_api.Json_deserializers.primitive_boolean_of_yojson
         "Overridden" _list path;
   }
    : spend_limit)

let spend_limit_list_of_yojson tree path = list_of_yojson spend_limit_of_yojson tree path

let describe_spend_limits_result_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     spend_limits =
       option_of_yojson (value_for_key spend_limit_list_of_yojson "SpendLimits") _list path;
     next_token = option_of_yojson (value_for_key next_token_of_yojson "NextToken") _list path;
   }
    : describe_spend_limits_result)

let describe_spend_limits_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     next_token = option_of_yojson (value_for_key next_token_of_yojson "NextToken") _list path;
     max_results = option_of_yojson (value_for_key max_results_of_yojson "MaxResults") _list path;
   }
    : describe_spend_limits_request)

let verified_destination_number_information_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     verified_destination_number_arn =
       value_for_key Smaws_Lib.Smithy_api.Json_deserializers.string__of_yojson
         "VerifiedDestinationNumberArn" _list path;
     verified_destination_number_id =
       value_for_key Smaws_Lib.Smithy_api.Json_deserializers.string__of_yojson
         "VerifiedDestinationNumberId" _list path;
     destination_phone_number =
       value_for_key phone_number_of_yojson "DestinationPhoneNumber" _list path;
     status = value_for_key verification_status_of_yojson "Status" _list path;
     rcs_agent_id =
       option_of_yojson
         (value_for_key Smaws_Lib.Smithy_api.Json_deserializers.string__of_yojson "RcsAgentId")
         _list path;
     created_timestamp =
       value_for_key Smaws_Lib.Smithy_api.Json_deserializers.timestamp_epoch_seconds_of_yojson
         "CreatedTimestamp" _list path;
   }
    : verified_destination_number_information)

let verified_destination_number_information_list_of_yojson tree path =
  list_of_yojson verified_destination_number_information_of_yojson tree path

let describe_verified_destination_numbers_result_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     verified_destination_numbers =
       value_for_key verified_destination_number_information_list_of_yojson
         "VerifiedDestinationNumbers" _list path;
     next_token = option_of_yojson (value_for_key next_token_of_yojson "NextToken") _list path;
   }
    : describe_verified_destination_numbers_result)

let verified_destination_number_filter_name_of_yojson (tree : t) path =
  ((match tree with
    | `String "status" -> STATUS
    | `String "rcs-agent-id" -> RCS_AGENT_ID
    | `String value ->
        raise
          (deserialize_unknown_enum_value_error path "VerifiedDestinationNumberFilterName" value)
    | _ -> raise (deserialize_wrong_type_error path "VerifiedDestinationNumberFilterName")
     : verified_destination_number_filter_name)
    : verified_destination_number_filter_name)

let verified_destination_number_filter_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     name = value_for_key verified_destination_number_filter_name_of_yojson "Name" _list path;
     values = value_for_key filter_value_list_of_yojson "Values" _list path;
   }
    : verified_destination_number_filter)

let verified_destination_number_filter_list_of_yojson tree path =
  list_of_yojson verified_destination_number_filter_of_yojson tree path

let destination_phone_number_list_of_yojson tree path =
  list_of_yojson phone_number_of_yojson tree path

let verified_destination_number_id_list_of_yojson tree path =
  list_of_yojson verified_destination_number_id_or_arn_of_yojson tree path

let describe_verified_destination_numbers_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     verified_destination_number_ids =
       option_of_yojson
         (value_for_key verified_destination_number_id_list_of_yojson "VerifiedDestinationNumberIds")
         _list path;
     destination_phone_numbers =
       option_of_yojson
         (value_for_key destination_phone_number_list_of_yojson "DestinationPhoneNumbers")
         _list path;
     filters =
       option_of_yojson
         (value_for_key verified_destination_number_filter_list_of_yojson "Filters")
         _list path;
     next_token = option_of_yojson (value_for_key next_token_of_yojson "NextToken") _list path;
     max_results = option_of_yojson (value_for_key max_results_of_yojson "MaxResults") _list path;
   }
    : describe_verified_destination_numbers_request)

let destination_country_parameter_key_of_yojson (tree : t) path =
  ((match tree with
    | `String "IN_TEMPLATE_ID" -> IN_TEMPLATE_ID
    | `String "IN_ENTITY_ID" -> IN_ENTITY_ID
    | `String value ->
        raise (deserialize_unknown_enum_value_error path "DestinationCountryParameterKey" value)
    | _ -> raise (deserialize_wrong_type_error path "DestinationCountryParameterKey")
     : destination_country_parameter_key)
    : destination_country_parameter_key)

let destination_country_parameter_value_of_yojson = string_of_yojson

let destination_country_parameters_of_yojson tree path =
  map_of_yojson destination_country_parameter_key_of_yojson
    destination_country_parameter_value_of_yojson tree path

let disassociate_origination_identity_result_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     pool_arn =
       option_of_yojson
         (value_for_key Smaws_Lib.Smithy_api.Json_deserializers.string__of_yojson "PoolArn")
         _list path;
     pool_id =
       option_of_yojson
         (value_for_key Smaws_Lib.Smithy_api.Json_deserializers.string__of_yojson "PoolId")
         _list path;
     origination_identity_arn =
       option_of_yojson
         (value_for_key Smaws_Lib.Smithy_api.Json_deserializers.string__of_yojson
            "OriginationIdentityArn")
         _list path;
     origination_identity =
       option_of_yojson
         (value_for_key Smaws_Lib.Smithy_api.Json_deserializers.string__of_yojson
            "OriginationIdentity")
         _list path;
     iso_country_code =
       option_of_yojson (value_for_key iso_country_code_of_yojson "IsoCountryCode") _list path;
   }
    : disassociate_origination_identity_result)

let disassociate_origination_identity_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     pool_id = value_for_key pool_id_or_arn_of_yojson "PoolId" _list path;
     origination_identity =
       value_for_key phone_or_sender_id_or_arn_of_yojson "OriginationIdentity" _list path;
     iso_country_code =
       option_of_yojson (value_for_key iso_country_code_of_yojson "IsoCountryCode") _list path;
     client_token = option_of_yojson (value_for_key client_token_of_yojson "ClientToken") _list path;
   }
    : disassociate_origination_identity_request)

let disassociate_protect_configuration_result_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     configuration_set_arn =
       value_for_key Smaws_Lib.Smithy_api.Json_deserializers.string__of_yojson "ConfigurationSetArn"
         _list path;
     configuration_set_name =
       value_for_key configuration_set_name_of_yojson "ConfigurationSetName" _list path;
     protect_configuration_arn =
       value_for_key protect_configuration_arn_of_yojson "ProtectConfigurationArn" _list path;
     protect_configuration_id =
       value_for_key protect_configuration_id_of_yojson "ProtectConfigurationId" _list path;
   }
    : disassociate_protect_configuration_result)

let disassociate_protect_configuration_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     protect_configuration_id =
       value_for_key protect_configuration_id_or_arn_of_yojson "ProtectConfigurationId" _list path;
     configuration_set_name =
       value_for_key configuration_set_name_or_arn_of_yojson "ConfigurationSetName" _list path;
   }
    : disassociate_protect_configuration_request)

let discard_registration_version_result_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     registration_arn =
       value_for_key Smaws_Lib.Smithy_api.Json_deserializers.string__of_yojson "RegistrationArn"
         _list path;
     registration_id =
       value_for_key Smaws_Lib.Smithy_api.Json_deserializers.string__of_yojson "RegistrationId"
         _list path;
     version_number = value_for_key registration_version_number_of_yojson "VersionNumber" _list path;
     registration_version_status =
       value_for_key registration_version_status_of_yojson "RegistrationVersionStatus" _list path;
     registration_version_status_history =
       value_for_key registration_version_status_history_of_yojson
         "RegistrationVersionStatusHistory" _list path;
   }
    : discard_registration_version_result)

let discard_registration_version_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({ registration_id = value_for_key registration_id_or_arn_of_yojson "RegistrationId" _list path }
    : discard_registration_version_request)

let protect_status_of_yojson (tree : t) path =
  ((match tree with
    | `String "ALLOW" -> ALLOW
    | `String "BLOCK" -> BLOCK
    | `String "MONITOR" -> MONITOR
    | `String "FILTER" -> FILTER
    | `String value -> raise (deserialize_unknown_enum_value_error path "ProtectStatus" value)
    | _ -> raise (deserialize_wrong_type_error path "ProtectStatus")
     : protect_status)
    : protect_status)

let protect_configuration_country_rule_set_information_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({ protect_status = value_for_key protect_status_of_yojson "ProtectStatus" _list path }
    : protect_configuration_country_rule_set_information)

let protect_configuration_country_rule_set_of_yojson tree path =
  map_of_yojson iso_country_code_of_yojson
    protect_configuration_country_rule_set_information_of_yojson tree path

let get_protect_configuration_country_rule_set_result_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     protect_configuration_arn =
       value_for_key protect_configuration_arn_of_yojson "ProtectConfigurationArn" _list path;
     protect_configuration_id =
       value_for_key protect_configuration_id_of_yojson "ProtectConfigurationId" _list path;
     number_capability = value_for_key number_capability_of_yojson "NumberCapability" _list path;
     country_rule_set =
       value_for_key protect_configuration_country_rule_set_of_yojson "CountryRuleSet" _list path;
   }
    : get_protect_configuration_country_rule_set_result)

let get_protect_configuration_country_rule_set_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     protect_configuration_id =
       value_for_key protect_configuration_id_or_arn_of_yojson "ProtectConfigurationId" _list path;
     number_capability = value_for_key number_capability_of_yojson "NumberCapability" _list path;
   }
    : get_protect_configuration_country_rule_set_request)

let get_resource_policy_result_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     resource_arn =
       option_of_yojson (value_for_key amazon_resource_name_of_yojson "ResourceArn") _list path;
     policy = option_of_yojson (value_for_key resource_policy_of_yojson "Policy") _list path;
     created_timestamp =
       option_of_yojson
         (value_for_key Smaws_Lib.Smithy_api.Json_deserializers.timestamp_epoch_seconds_of_yojson
            "CreatedTimestamp")
         _list path;
   }
    : get_resource_policy_result)

let get_resource_policy_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({ resource_arn = value_for_key amazon_resource_name_of_yojson "ResourceArn" _list path }
    : get_resource_policy_request)

let iam_role_arn_or_unset_of_yojson = string_of_yojson

let language_code_of_yojson (tree : t) path =
  ((match tree with
    | `String "DE_DE" -> DE_DE
    | `String "EN_GB" -> EN_GB
    | `String "EN_US" -> EN_US
    | `String "ES_419" -> ES_419
    | `String "ES_ES" -> ES_ES
    | `String "FR_CA" -> FR_CA
    | `String "FR_FR" -> FR_FR
    | `String "IT_IT" -> IT_IT
    | `String "JA_JP" -> JA_JP
    | `String "KO_KR" -> KO_KR
    | `String "PT_BR" -> PT_BR
    | `String "ZH_CN" -> ZH_CN
    | `String "ZH_TW" -> ZH_TW
    | `String value -> raise (deserialize_unknown_enum_value_error path "LanguageCode" value)
    | _ -> raise (deserialize_wrong_type_error path "LanguageCode")
     : language_code)
    : language_code)

let notify_tier_list_of_yojson tree path =
  list_of_yojson notify_configuration_tier_of_yojson tree path

let notify_use_case_list_of_yojson tree path =
  list_of_yojson notify_configuration_use_case_of_yojson tree path

let notify_country_information_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     iso_country_code = value_for_key iso_country_code_of_yojson "IsoCountryCode" _list path;
     country_name =
       value_for_key Smaws_Lib.Smithy_api.Json_deserializers.string__of_yojson "CountryName" _list
         path;
     supported_channels =
       value_for_key notify_enabled_channels_list_of_yojson "SupportedChannels" _list path;
     supported_use_cases =
       value_for_key notify_use_case_list_of_yojson "SupportedUseCases" _list path;
     supported_tiers = value_for_key notify_tier_list_of_yojson "SupportedTiers" _list path;
     customer_owned_identity_required =
       value_for_key Smaws_Lib.Smithy_api.Json_deserializers.primitive_boolean_of_yojson
         "CustomerOwnedIdentityRequired" _list path;
   }
    : notify_country_information)

let notify_country_information_list_of_yojson tree path =
  list_of_yojson notify_country_information_of_yojson tree path

let list_notify_countries_result_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     notify_countries =
       option_of_yojson
         (value_for_key notify_country_information_list_of_yojson "NotifyCountries")
         _list path;
     next_token = option_of_yojson (value_for_key next_token_of_yojson "NextToken") _list path;
   }
    : list_notify_countries_result)

let list_notify_countries_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     channels =
       option_of_yojson (value_for_key notify_enabled_channels_list_of_yojson "Channels") _list path;
     use_cases =
       option_of_yojson (value_for_key notify_use_case_list_of_yojson "UseCases") _list path;
     tier = option_of_yojson (value_for_key notify_configuration_tier_of_yojson "Tier") _list path;
     next_token = option_of_yojson (value_for_key next_token_of_yojson "NextToken") _list path;
     max_results = option_of_yojson (value_for_key max_results_of_yojson "MaxResults") _list path;
   }
    : list_notify_countries_request)

let origination_identity_metadata_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     origination_identity_arn =
       value_for_key Smaws_Lib.Smithy_api.Json_deserializers.string__of_yojson
         "OriginationIdentityArn" _list path;
     origination_identity =
       value_for_key Smaws_Lib.Smithy_api.Json_deserializers.string__of_yojson "OriginationIdentity"
         _list path;
     iso_country_code = value_for_key iso_country_code_of_yojson "IsoCountryCode" _list path;
     number_capabilities =
       value_for_key number_capability_list_of_yojson "NumberCapabilities" _list path;
     phone_number = option_of_yojson (value_for_key phone_number_of_yojson "PhoneNumber") _list path;
   }
    : origination_identity_metadata)

let origination_identity_metadata_list_of_yojson tree path =
  list_of_yojson origination_identity_metadata_of_yojson tree path

let list_pool_origination_identities_result_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     pool_arn =
       option_of_yojson
         (value_for_key Smaws_Lib.Smithy_api.Json_deserializers.string__of_yojson "PoolArn")
         _list path;
     pool_id =
       option_of_yojson
         (value_for_key Smaws_Lib.Smithy_api.Json_deserializers.string__of_yojson "PoolId")
         _list path;
     origination_identities =
       option_of_yojson
         (value_for_key origination_identity_metadata_list_of_yojson "OriginationIdentities")
         _list path;
     next_token = option_of_yojson (value_for_key next_token_of_yojson "NextToken") _list path;
   }
    : list_pool_origination_identities_result)

let pool_origination_identities_filter_name_of_yojson (tree : t) path =
  ((match tree with
    | `String "iso-country-code" -> ISO_COUNTRY_CODE
    | `String "number-capability" -> NUMBER_CAPABILITY
    | `String value ->
        raise
          (deserialize_unknown_enum_value_error path "PoolOriginationIdentitiesFilterName" value)
    | _ -> raise (deserialize_wrong_type_error path "PoolOriginationIdentitiesFilterName")
     : pool_origination_identities_filter_name)
    : pool_origination_identities_filter_name)

let pool_origination_identities_filter_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     name = value_for_key pool_origination_identities_filter_name_of_yojson "Name" _list path;
     values = value_for_key filter_value_list_of_yojson "Values" _list path;
   }
    : pool_origination_identities_filter)

let pool_origination_identities_filter_list_of_yojson tree path =
  list_of_yojson pool_origination_identities_filter_of_yojson tree path

let list_pool_origination_identities_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     pool_id = value_for_key pool_id_or_arn_of_yojson "PoolId" _list path;
     filters =
       option_of_yojson
         (value_for_key pool_origination_identities_filter_list_of_yojson "Filters")
         _list path;
     next_token = option_of_yojson (value_for_key next_token_of_yojson "NextToken") _list path;
     max_results = option_of_yojson (value_for_key max_results_of_yojson "MaxResults") _list path;
   }
    : list_pool_origination_identities_request)

let protect_configuration_rule_set_number_override_filter_name_of_yojson (tree : t) path =
  ((match tree with
    | `String "iso-country-code" -> ISO_COUNTRY_CODE
    | `String "destination-phone-number-begins-with" -> DESTINATION_PHONE_NUMBER_BEGINS_WITH
    | `String "action" -> ACTION
    | `String "expires-before" -> EXPIRES_BEFORE
    | `String "expires-after" -> EXPIRES_AFTER
    | `String "created-before" -> CREATED_BEFORE
    | `String "created-after" -> CREATED_AFTER
    | `String value ->
        raise
          (deserialize_unknown_enum_value_error path
             "ProtectConfigurationRuleSetNumberOverrideFilterName" value)
    | _ ->
        raise
          (deserialize_wrong_type_error path "ProtectConfigurationRuleSetNumberOverrideFilterName")
     : protect_configuration_rule_set_number_override_filter_name)
    : protect_configuration_rule_set_number_override_filter_name)

let protect_configuration_rule_set_number_override_filter_item_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     name =
       value_for_key protect_configuration_rule_set_number_override_filter_name_of_yojson "Name"
         _list path;
     values = value_for_key filter_value_list_of_yojson "Values" _list path;
   }
    : protect_configuration_rule_set_number_override_filter_item)

let list_protect_configuration_rule_set_number_override_filter_of_yojson tree path =
  list_of_yojson protect_configuration_rule_set_number_override_filter_item_of_yojson tree path

let protect_configuration_rule_set_number_override_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     destination_phone_number =
       value_for_key phone_number_of_yojson "DestinationPhoneNumber" _list path;
     created_timestamp =
       value_for_key Smaws_Lib.Smithy_api.Json_deserializers.timestamp_epoch_seconds_of_yojson
         "CreatedTimestamp" _list path;
     action = value_for_key protect_configuration_rule_override_action_of_yojson "Action" _list path;
     iso_country_code =
       option_of_yojson (value_for_key iso_country_code_of_yojson "IsoCountryCode") _list path;
     expiration_timestamp =
       option_of_yojson
         (value_for_key Smaws_Lib.Smithy_api.Json_deserializers.timestamp_epoch_seconds_of_yojson
            "ExpirationTimestamp")
         _list path;
   }
    : protect_configuration_rule_set_number_override)

let protect_configuration_rule_set_number_override_list_of_yojson tree path =
  list_of_yojson protect_configuration_rule_set_number_override_of_yojson tree path

let list_protect_configuration_rule_set_number_overrides_result_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     protect_configuration_arn =
       value_for_key protect_configuration_arn_of_yojson "ProtectConfigurationArn" _list path;
     protect_configuration_id =
       value_for_key protect_configuration_id_of_yojson "ProtectConfigurationId" _list path;
     rule_set_number_overrides =
       option_of_yojson
         (value_for_key protect_configuration_rule_set_number_override_list_of_yojson
            "RuleSetNumberOverrides")
         _list path;
     next_token = option_of_yojson (value_for_key next_token_of_yojson "NextToken") _list path;
   }
    : list_protect_configuration_rule_set_number_overrides_result)

let list_protect_configuration_rule_set_number_overrides_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     protect_configuration_id =
       value_for_key protect_configuration_id_or_arn_of_yojson "ProtectConfigurationId" _list path;
     filters =
       option_of_yojson
         (value_for_key list_protect_configuration_rule_set_number_override_filter_of_yojson
            "Filters")
         _list path;
     next_token = option_of_yojson (value_for_key next_token_of_yojson "NextToken") _list path;
     max_results = option_of_yojson (value_for_key max_results_of_yojson "MaxResults") _list path;
   }
    : list_protect_configuration_rule_set_number_overrides_request)

let registration_association_metadata_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     resource_arn =
       value_for_key Smaws_Lib.Smithy_api.Json_deserializers.string__of_yojson "ResourceArn" _list
         path;
     resource_id =
       value_for_key Smaws_Lib.Smithy_api.Json_deserializers.string__of_yojson "ResourceId" _list
         path;
     resource_type =
       value_for_key Smaws_Lib.Smithy_api.Json_deserializers.string__of_yojson "ResourceType" _list
         path;
     iso_country_code =
       option_of_yojson (value_for_key iso_country_code_of_yojson "IsoCountryCode") _list path;
     phone_number = option_of_yojson (value_for_key phone_number_of_yojson "PhoneNumber") _list path;
   }
    : registration_association_metadata)

let registration_association_metadata_list_of_yojson tree path =
  list_of_yojson registration_association_metadata_of_yojson tree path

let list_registration_associations_result_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     registration_arn =
       value_for_key Smaws_Lib.Smithy_api.Json_deserializers.string__of_yojson "RegistrationArn"
         _list path;
     registration_id =
       value_for_key Smaws_Lib.Smithy_api.Json_deserializers.string__of_yojson "RegistrationId"
         _list path;
     registration_type = value_for_key registration_type_of_yojson "RegistrationType" _list path;
     registration_associations =
       value_for_key registration_association_metadata_list_of_yojson "RegistrationAssociations"
         _list path;
     next_token = option_of_yojson (value_for_key next_token_of_yojson "NextToken") _list path;
   }
    : list_registration_associations_result)

let registration_association_filter_name_of_yojson (tree : t) path =
  ((match tree with
    | `String "resource-type" -> RESOURCE_TYPE
    | `String "iso-country-code" -> ISO_COUNTRY_CODE
    | `String value ->
        raise (deserialize_unknown_enum_value_error path "RegistrationAssociationFilterName" value)
    | _ -> raise (deserialize_wrong_type_error path "RegistrationAssociationFilterName")
     : registration_association_filter_name)
    : registration_association_filter_name)

let registration_association_filter_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     name = value_for_key registration_association_filter_name_of_yojson "Name" _list path;
     values = value_for_key filter_value_list_of_yojson "Values" _list path;
   }
    : registration_association_filter)

let registration_association_filter_list_of_yojson tree path =
  list_of_yojson registration_association_filter_of_yojson tree path

let list_registration_associations_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     registration_id = value_for_key registration_id_or_arn_of_yojson "RegistrationId" _list path;
     filters =
       option_of_yojson
         (value_for_key registration_association_filter_list_of_yojson "Filters")
         _list path;
     next_token = option_of_yojson (value_for_key next_token_of_yojson "NextToken") _list path;
     max_results = option_of_yojson (value_for_key max_results_of_yojson "MaxResults") _list path;
   }
    : list_registration_associations_request)

let list_tags_for_resource_result_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     resource_arn =
       option_of_yojson (value_for_key amazon_resource_name_of_yojson "ResourceArn") _list path;
     tags = option_of_yojson (value_for_key tag_list_of_yojson "Tags") _list path;
   }
    : list_tags_for_resource_result)

let list_tags_for_resource_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({ resource_arn = value_for_key amazon_resource_name_of_yojson "ResourceArn" _list path }
    : list_tags_for_resource_request)

let max_price_of_yojson = string_of_yojson
let media_message_origination_identity_of_yojson = string_of_yojson
let media_url_value_of_yojson = string_of_yojson
let media_url_list_of_yojson tree path = list_of_yojson media_url_value_of_yojson tree path

let message_feedback_status_of_yojson (tree : t) path =
  ((match tree with
    | `String "RECEIVED" -> RECEIVED
    | `String "FAILED" -> FAILED
    | `String value ->
        raise (deserialize_unknown_enum_value_error path "MessageFeedbackStatus" value)
    | _ -> raise (deserialize_wrong_type_error path "MessageFeedbackStatus")
     : message_feedback_status)
    : message_feedback_status)

let message_id_of_yojson = string_of_yojson
let non_empty_tag_list_of_yojson tree path = list_of_yojson tag_of_yojson tree path
let notify_pool_id_or_unset_of_yojson = string_of_yojson

let verify_destination_number_result_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     verified_destination_number_arn =
       value_for_key Smaws_Lib.Smithy_api.Json_deserializers.string__of_yojson
         "VerifiedDestinationNumberArn" _list path;
     verified_destination_number_id =
       value_for_key Smaws_Lib.Smithy_api.Json_deserializers.string__of_yojson
         "VerifiedDestinationNumberId" _list path;
     destination_phone_number =
       value_for_key phone_number_of_yojson "DestinationPhoneNumber" _list path;
     status = value_for_key verification_status_of_yojson "Status" _list path;
     created_timestamp =
       value_for_key Smaws_Lib.Smithy_api.Json_deserializers.timestamp_epoch_seconds_of_yojson
         "CreatedTimestamp" _list path;
   }
    : verify_destination_number_result)

let verification_code_of_yojson = string_of_yojson

let verify_destination_number_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     verified_destination_number_id =
       value_for_key verified_destination_number_id_or_arn_of_yojson "VerifiedDestinationNumberId"
         _list path;
     verification_code = value_for_key verification_code_of_yojson "VerificationCode" _list path;
   }
    : verify_destination_number_request)

let update_sender_id_result_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     sender_id_arn =
       value_for_key Smaws_Lib.Smithy_api.Json_deserializers.string__of_yojson "SenderIdArn" _list
         path;
     sender_id = value_for_key sender_id_of_yojson "SenderId" _list path;
     iso_country_code = value_for_key iso_country_code_of_yojson "IsoCountryCode" _list path;
     message_types = value_for_key message_type_list_of_yojson "MessageTypes" _list path;
     monthly_leasing_price =
       value_for_key Smaws_Lib.Smithy_api.Json_deserializers.string__of_yojson "MonthlyLeasingPrice"
         _list path;
     deletion_protection_enabled =
       value_for_key Smaws_Lib.Smithy_api.Json_deserializers.primitive_boolean_of_yojson
         "DeletionProtectionEnabled" _list path;
     registered =
       value_for_key Smaws_Lib.Smithy_api.Json_deserializers.primitive_boolean_of_yojson
         "Registered" _list path;
     registration_id =
       option_of_yojson
         (value_for_key Smaws_Lib.Smithy_api.Json_deserializers.string__of_yojson "RegistrationId")
         _list path;
   }
    : update_sender_id_result)

let update_sender_id_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     sender_id = value_for_key sender_id_or_arn_of_yojson "SenderId" _list path;
     iso_country_code = value_for_key iso_country_code_of_yojson "IsoCountryCode" _list path;
     deletion_protection_enabled =
       option_of_yojson
         (value_for_key Smaws_Lib.Smithy_api.Json_deserializers.boolean__of_yojson
            "DeletionProtectionEnabled")
         _list path;
   }
    : update_sender_id_request)

let update_rcs_agent_result_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     rcs_agent_arn =
       value_for_key Smaws_Lib.Smithy_api.Json_deserializers.string__of_yojson "RcsAgentArn" _list
         path;
     rcs_agent_id =
       value_for_key Smaws_Lib.Smithy_api.Json_deserializers.string__of_yojson "RcsAgentId" _list
         path;
     status = value_for_key rcs_agent_status_of_yojson "Status" _list path;
     created_timestamp =
       value_for_key Smaws_Lib.Smithy_api.Json_deserializers.timestamp_epoch_seconds_of_yojson
         "CreatedTimestamp" _list path;
     deletion_protection_enabled =
       value_for_key Smaws_Lib.Smithy_api.Json_deserializers.primitive_boolean_of_yojson
         "DeletionProtectionEnabled" _list path;
     opt_out_list_name =
       option_of_yojson (value_for_key opt_out_list_name_of_yojson "OptOutListName") _list path;
     self_managed_opt_outs_enabled =
       value_for_key Smaws_Lib.Smithy_api.Json_deserializers.primitive_boolean_of_yojson
         "SelfManagedOptOutsEnabled" _list path;
     two_way_channel_arn =
       option_of_yojson (value_for_key two_way_channel_arn_of_yojson "TwoWayChannelArn") _list path;
     two_way_channel_role =
       option_of_yojson (value_for_key iam_role_arn_of_yojson "TwoWayChannelRole") _list path;
     two_way_enabled =
       value_for_key Smaws_Lib.Smithy_api.Json_deserializers.primitive_boolean_of_yojson
         "TwoWayEnabled" _list path;
     two_way_media_s3_bucket_name =
       option_of_yojson
         (value_for_key two_way_media_s3_bucket_name_of_yojson "TwoWayMediaS3BucketName")
         _list path;
     two_way_media_s3_key_prefix =
       option_of_yojson
         (value_for_key two_way_media_s3_key_prefix_of_yojson "TwoWayMediaS3KeyPrefix")
         _list path;
     two_way_media_s3_role =
       option_of_yojson (value_for_key iam_role_arn_of_yojson "TwoWayMediaS3Role") _list path;
     two_way_rcs_events_enabled =
       option_of_yojson
         (value_for_key rcs_event_type_list_of_yojson "TwoWayRcsEventsEnabled")
         _list path;
   }
    : update_rcs_agent_result)

let two_way_media_s3_bucket_name_or_unset_of_yojson = string_of_yojson

let update_rcs_agent_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     rcs_agent_id = value_for_key rcs_agent_id_or_arn_of_yojson "RcsAgentId" _list path;
     deletion_protection_enabled =
       option_of_yojson
         (value_for_key Smaws_Lib.Smithy_api.Json_deserializers.boolean__of_yojson
            "DeletionProtectionEnabled")
         _list path;
     opt_out_list_name =
       option_of_yojson
         (value_for_key opt_out_list_name_or_arn_of_yojson "OptOutListName")
         _list path;
     self_managed_opt_outs_enabled =
       option_of_yojson
         (value_for_key Smaws_Lib.Smithy_api.Json_deserializers.boolean__of_yojson
            "SelfManagedOptOutsEnabled")
         _list path;
     two_way_channel_arn =
       option_of_yojson (value_for_key two_way_channel_arn_of_yojson "TwoWayChannelArn") _list path;
     two_way_channel_role =
       option_of_yojson (value_for_key iam_role_arn_of_yojson "TwoWayChannelRole") _list path;
     two_way_enabled =
       option_of_yojson
         (value_for_key Smaws_Lib.Smithy_api.Json_deserializers.boolean__of_yojson "TwoWayEnabled")
         _list path;
     two_way_media_s3_bucket_name =
       option_of_yojson
         (value_for_key two_way_media_s3_bucket_name_or_unset_of_yojson "TwoWayMediaS3BucketName")
         _list path;
     two_way_media_s3_key_prefix =
       option_of_yojson
         (value_for_key two_way_media_s3_key_prefix_of_yojson "TwoWayMediaS3KeyPrefix")
         _list path;
     two_way_media_s3_role =
       option_of_yojson
         (value_for_key iam_role_arn_or_unset_of_yojson "TwoWayMediaS3Role")
         _list path;
     two_way_rcs_events_enabled =
       option_of_yojson
         (value_for_key rcs_event_type_list_of_yojson "TwoWayRcsEventsEnabled")
         _list path;
   }
    : update_rcs_agent_request)

let update_protect_configuration_country_rule_set_result_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     protect_configuration_arn =
       value_for_key protect_configuration_arn_of_yojson "ProtectConfigurationArn" _list path;
     protect_configuration_id =
       value_for_key protect_configuration_id_of_yojson "ProtectConfigurationId" _list path;
     number_capability = value_for_key number_capability_of_yojson "NumberCapability" _list path;
     country_rule_set =
       value_for_key protect_configuration_country_rule_set_of_yojson "CountryRuleSet" _list path;
   }
    : update_protect_configuration_country_rule_set_result)

let update_protect_configuration_country_rule_set_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     protect_configuration_id =
       value_for_key protect_configuration_id_or_arn_of_yojson "ProtectConfigurationId" _list path;
     number_capability = value_for_key number_capability_of_yojson "NumberCapability" _list path;
     country_rule_set_updates =
       value_for_key protect_configuration_country_rule_set_of_yojson "CountryRuleSetUpdates" _list
         path;
   }
    : update_protect_configuration_country_rule_set_request)

let update_protect_configuration_result_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     protect_configuration_arn =
       value_for_key protect_configuration_arn_of_yojson "ProtectConfigurationArn" _list path;
     protect_configuration_id =
       value_for_key protect_configuration_id_of_yojson "ProtectConfigurationId" _list path;
     created_timestamp =
       value_for_key Smaws_Lib.Smithy_api.Json_deserializers.timestamp_epoch_seconds_of_yojson
         "CreatedTimestamp" _list path;
     account_default =
       value_for_key Smaws_Lib.Smithy_api.Json_deserializers.primitive_boolean_of_yojson
         "AccountDefault" _list path;
     deletion_protection_enabled =
       value_for_key Smaws_Lib.Smithy_api.Json_deserializers.primitive_boolean_of_yojson
         "DeletionProtectionEnabled" _list path;
   }
    : update_protect_configuration_result)

let update_protect_configuration_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     protect_configuration_id =
       value_for_key protect_configuration_id_or_arn_of_yojson "ProtectConfigurationId" _list path;
     deletion_protection_enabled =
       option_of_yojson
         (value_for_key Smaws_Lib.Smithy_api.Json_deserializers.boolean__of_yojson
            "DeletionProtectionEnabled")
         _list path;
   }
    : update_protect_configuration_request)

let update_pool_result_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     pool_arn =
       option_of_yojson
         (value_for_key Smaws_Lib.Smithy_api.Json_deserializers.string__of_yojson "PoolArn")
         _list path;
     pool_id =
       option_of_yojson
         (value_for_key Smaws_Lib.Smithy_api.Json_deserializers.string__of_yojson "PoolId")
         _list path;
     status = option_of_yojson (value_for_key pool_status_of_yojson "Status") _list path;
     message_type = option_of_yojson (value_for_key message_type_of_yojson "MessageType") _list path;
     two_way_enabled =
       option_of_yojson
         (value_for_key Smaws_Lib.Smithy_api.Json_deserializers.primitive_boolean_of_yojson
            "TwoWayEnabled")
         _list path;
     two_way_channel_arn =
       option_of_yojson (value_for_key two_way_channel_arn_of_yojson "TwoWayChannelArn") _list path;
     two_way_channel_role =
       option_of_yojson (value_for_key iam_role_arn_of_yojson "TwoWayChannelRole") _list path;
     self_managed_opt_outs_enabled =
       option_of_yojson
         (value_for_key Smaws_Lib.Smithy_api.Json_deserializers.primitive_boolean_of_yojson
            "SelfManagedOptOutsEnabled")
         _list path;
     opt_out_list_name =
       option_of_yojson (value_for_key opt_out_list_name_of_yojson "OptOutListName") _list path;
     shared_routes_enabled =
       option_of_yojson
         (value_for_key Smaws_Lib.Smithy_api.Json_deserializers.primitive_boolean_of_yojson
            "SharedRoutesEnabled")
         _list path;
     deletion_protection_enabled =
       option_of_yojson
         (value_for_key Smaws_Lib.Smithy_api.Json_deserializers.primitive_boolean_of_yojson
            "DeletionProtectionEnabled")
         _list path;
     created_timestamp =
       option_of_yojson
         (value_for_key Smaws_Lib.Smithy_api.Json_deserializers.timestamp_epoch_seconds_of_yojson
            "CreatedTimestamp")
         _list path;
   }
    : update_pool_result)

let update_pool_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     pool_id = value_for_key pool_id_or_arn_of_yojson "PoolId" _list path;
     two_way_enabled =
       option_of_yojson
         (value_for_key Smaws_Lib.Smithy_api.Json_deserializers.boolean__of_yojson "TwoWayEnabled")
         _list path;
     two_way_channel_arn =
       option_of_yojson (value_for_key two_way_channel_arn_of_yojson "TwoWayChannelArn") _list path;
     two_way_channel_role =
       option_of_yojson (value_for_key iam_role_arn_of_yojson "TwoWayChannelRole") _list path;
     self_managed_opt_outs_enabled =
       option_of_yojson
         (value_for_key Smaws_Lib.Smithy_api.Json_deserializers.boolean__of_yojson
            "SelfManagedOptOutsEnabled")
         _list path;
     opt_out_list_name =
       option_of_yojson
         (value_for_key opt_out_list_name_or_arn_of_yojson "OptOutListName")
         _list path;
     shared_routes_enabled =
       option_of_yojson
         (value_for_key Smaws_Lib.Smithy_api.Json_deserializers.boolean__of_yojson
            "SharedRoutesEnabled")
         _list path;
     deletion_protection_enabled =
       option_of_yojson
         (value_for_key Smaws_Lib.Smithy_api.Json_deserializers.boolean__of_yojson
            "DeletionProtectionEnabled")
         _list path;
   }
    : update_pool_request)

let update_phone_number_result_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     phone_number_arn =
       option_of_yojson
         (value_for_key Smaws_Lib.Smithy_api.Json_deserializers.string__of_yojson "PhoneNumberArn")
         _list path;
     phone_number_id =
       option_of_yojson
         (value_for_key Smaws_Lib.Smithy_api.Json_deserializers.string__of_yojson "PhoneNumberId")
         _list path;
     phone_number = option_of_yojson (value_for_key phone_number_of_yojson "PhoneNumber") _list path;
     status = option_of_yojson (value_for_key number_status_of_yojson "Status") _list path;
     iso_country_code =
       option_of_yojson (value_for_key iso_country_code_of_yojson "IsoCountryCode") _list path;
     message_type = option_of_yojson (value_for_key message_type_of_yojson "MessageType") _list path;
     number_capabilities =
       option_of_yojson
         (value_for_key number_capability_list_of_yojson "NumberCapabilities")
         _list path;
     number_type = option_of_yojson (value_for_key number_type_of_yojson "NumberType") _list path;
     monthly_leasing_price =
       option_of_yojson
         (value_for_key Smaws_Lib.Smithy_api.Json_deserializers.string__of_yojson
            "MonthlyLeasingPrice")
         _list path;
     two_way_enabled =
       option_of_yojson
         (value_for_key Smaws_Lib.Smithy_api.Json_deserializers.primitive_boolean_of_yojson
            "TwoWayEnabled")
         _list path;
     two_way_channel_arn =
       option_of_yojson (value_for_key two_way_channel_arn_of_yojson "TwoWayChannelArn") _list path;
     two_way_channel_role =
       option_of_yojson (value_for_key iam_role_arn_of_yojson "TwoWayChannelRole") _list path;
     self_managed_opt_outs_enabled =
       option_of_yojson
         (value_for_key Smaws_Lib.Smithy_api.Json_deserializers.primitive_boolean_of_yojson
            "SelfManagedOptOutsEnabled")
         _list path;
     opt_out_list_name =
       option_of_yojson (value_for_key opt_out_list_name_of_yojson "OptOutListName") _list path;
     international_sending_enabled =
       option_of_yojson
         (value_for_key Smaws_Lib.Smithy_api.Json_deserializers.primitive_boolean_of_yojson
            "InternationalSendingEnabled")
         _list path;
     deletion_protection_enabled =
       option_of_yojson
         (value_for_key Smaws_Lib.Smithy_api.Json_deserializers.primitive_boolean_of_yojson
            "DeletionProtectionEnabled")
         _list path;
     registration_id =
       option_of_yojson
         (value_for_key Smaws_Lib.Smithy_api.Json_deserializers.string__of_yojson "RegistrationId")
         _list path;
     created_timestamp =
       option_of_yojson
         (value_for_key Smaws_Lib.Smithy_api.Json_deserializers.timestamp_epoch_seconds_of_yojson
            "CreatedTimestamp")
         _list path;
   }
    : update_phone_number_result)

let update_phone_number_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     phone_number_id = value_for_key phone_number_id_or_arn_of_yojson "PhoneNumberId" _list path;
     two_way_enabled =
       option_of_yojson
         (value_for_key Smaws_Lib.Smithy_api.Json_deserializers.boolean__of_yojson "TwoWayEnabled")
         _list path;
     two_way_channel_arn =
       option_of_yojson (value_for_key two_way_channel_arn_of_yojson "TwoWayChannelArn") _list path;
     two_way_channel_role =
       option_of_yojson (value_for_key iam_role_arn_of_yojson "TwoWayChannelRole") _list path;
     self_managed_opt_outs_enabled =
       option_of_yojson
         (value_for_key Smaws_Lib.Smithy_api.Json_deserializers.boolean__of_yojson
            "SelfManagedOptOutsEnabled")
         _list path;
     opt_out_list_name =
       option_of_yojson
         (value_for_key opt_out_list_name_or_arn_of_yojson "OptOutListName")
         _list path;
     international_sending_enabled =
       option_of_yojson
         (value_for_key Smaws_Lib.Smithy_api.Json_deserializers.boolean__of_yojson
            "InternationalSendingEnabled")
         _list path;
     deletion_protection_enabled =
       option_of_yojson
         (value_for_key Smaws_Lib.Smithy_api.Json_deserializers.boolean__of_yojson
            "DeletionProtectionEnabled")
         _list path;
   }
    : update_phone_number_request)

let update_notify_configuration_result_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     notify_configuration_arn =
       value_for_key notify_configuration_arn_of_yojson "NotifyConfigurationArn" _list path;
     notify_configuration_id =
       value_for_key notify_configuration_id_of_yojson "NotifyConfigurationId" _list path;
     display_name =
       value_for_key notify_configuration_display_name_of_yojson "DisplayName" _list path;
     use_case = value_for_key notify_configuration_use_case_of_yojson "UseCase" _list path;
     default_template_id =
       option_of_yojson (value_for_key notify_template_id_of_yojson "DefaultTemplateId") _list path;
     pool_id =
       option_of_yojson
         (value_for_key Smaws_Lib.Smithy_api.Json_deserializers.string__of_yojson "PoolId")
         _list path;
     enabled_countries =
       option_of_yojson
         (value_for_key iso_country_code_list_of_yojson "EnabledCountries")
         _list path;
     enabled_channels =
       value_for_key notify_enabled_channels_list_of_yojson "EnabledChannels" _list path;
     tier = value_for_key notify_configuration_tier_of_yojson "Tier" _list path;
     tier_upgrade_status =
       value_for_key tier_upgrade_status_of_yojson "TierUpgradeStatus" _list path;
     status = value_for_key notify_configuration_status_of_yojson "Status" _list path;
     rejection_reason =
       option_of_yojson
         (value_for_key Smaws_Lib.Smithy_api.Json_deserializers.string__of_yojson "RejectionReason")
         _list path;
     deletion_protection_enabled =
       value_for_key Smaws_Lib.Smithy_api.Json_deserializers.primitive_boolean_of_yojson
         "DeletionProtectionEnabled" _list path;
     created_timestamp =
       value_for_key Smaws_Lib.Smithy_api.Json_deserializers.timestamp_epoch_seconds_of_yojson
         "CreatedTimestamp" _list path;
   }
    : update_notify_configuration_result)

let update_notify_configuration_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     notify_configuration_id =
       value_for_key notify_configuration_id_or_arn_of_yojson "NotifyConfigurationId" _list path;
     default_template_id =
       option_of_yojson (value_for_key notify_template_id_of_yojson "DefaultTemplateId") _list path;
     pool_id =
       option_of_yojson (value_for_key notify_pool_id_or_unset_of_yojson "PoolId") _list path;
     enabled_countries =
       option_of_yojson
         (value_for_key iso_country_code_list_of_yojson "EnabledCountries")
         _list path;
     enabled_channels =
       option_of_yojson
         (value_for_key notify_enabled_channels_list_of_yojson "EnabledChannels")
         _list path;
     deletion_protection_enabled =
       option_of_yojson
         (value_for_key Smaws_Lib.Smithy_api.Json_deserializers.boolean__of_yojson
            "DeletionProtectionEnabled")
         _list path;
   }
    : update_notify_configuration_request)

let update_event_destination_result_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     configuration_set_arn =
       option_of_yojson
         (value_for_key Smaws_Lib.Smithy_api.Json_deserializers.string__of_yojson
            "ConfigurationSetArn")
         _list path;
     configuration_set_name =
       option_of_yojson
         (value_for_key configuration_set_name_of_yojson "ConfigurationSetName")
         _list path;
     event_destination =
       option_of_yojson (value_for_key event_destination_of_yojson "EventDestination") _list path;
   }
    : update_event_destination_result)

let update_event_destination_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     configuration_set_name =
       value_for_key configuration_set_name_or_arn_of_yojson "ConfigurationSetName" _list path;
     event_destination_name =
       value_for_key event_destination_name_of_yojson "EventDestinationName" _list path;
     enabled =
       option_of_yojson
         (value_for_key Smaws_Lib.Smithy_api.Json_deserializers.boolean__of_yojson "Enabled")
         _list path;
     matching_event_types =
       option_of_yojson (value_for_key event_type_list_of_yojson "MatchingEventTypes") _list path;
     cloud_watch_logs_destination =
       option_of_yojson
         (value_for_key cloud_watch_logs_destination_of_yojson "CloudWatchLogsDestination")
         _list path;
     kinesis_firehose_destination =
       option_of_yojson
         (value_for_key kinesis_firehose_destination_of_yojson "KinesisFirehoseDestination")
         _list path;
     sns_destination =
       option_of_yojson (value_for_key sns_destination_of_yojson "SnsDestination") _list path;
   }
    : update_event_destination_request)

let untag_resource_result_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  (() : unit)

let tag_key_list_of_yojson tree path = list_of_yojson tag_key_of_yojson tree path

let untag_resource_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     resource_arn = value_for_key amazon_resource_name_of_yojson "ResourceArn" _list path;
     tag_keys = value_for_key tag_key_list_of_yojson "TagKeys" _list path;
   }
    : untag_resource_request)

let tag_resource_result_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  (() : unit)

let tag_resource_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     resource_arn = value_for_key amazon_resource_name_of_yojson "ResourceArn" _list path;
     tags = value_for_key non_empty_tag_list_of_yojson "Tags" _list path;
   }
    : tag_resource_request)

let submit_registration_version_result_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     registration_arn =
       value_for_key Smaws_Lib.Smithy_api.Json_deserializers.string__of_yojson "RegistrationArn"
         _list path;
     registration_id =
       value_for_key Smaws_Lib.Smithy_api.Json_deserializers.string__of_yojson "RegistrationId"
         _list path;
     version_number = value_for_key registration_version_number_of_yojson "VersionNumber" _list path;
     registration_version_status =
       value_for_key registration_version_status_of_yojson "RegistrationVersionStatus" _list path;
     registration_version_status_history =
       value_for_key registration_version_status_history_of_yojson
         "RegistrationVersionStatusHistory" _list path;
     aws_review =
       value_for_key Smaws_Lib.Smithy_api.Json_deserializers.primitive_boolean_of_yojson "AwsReview"
         _list path;
   }
    : submit_registration_version_result)

let submit_registration_version_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     registration_id = value_for_key registration_id_or_arn_of_yojson "RegistrationId" _list path;
     aws_review =
       option_of_yojson
         (value_for_key Smaws_Lib.Smithy_api.Json_deserializers.primitive_boolean_of_yojson
            "AwsReview")
         _list path;
   }
    : submit_registration_version_request)

let set_voice_message_spend_limit_override_result_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     monthly_limit =
       option_of_yojson (value_for_key monthly_limit_of_yojson "MonthlyLimit") _list path;
   }
    : set_voice_message_spend_limit_override_result)

let set_voice_message_spend_limit_override_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({ monthly_limit = value_for_key monthly_limit_of_yojson "MonthlyLimit" _list path }
    : set_voice_message_spend_limit_override_request)

let set_text_message_spend_limit_override_result_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     monthly_limit =
       option_of_yojson (value_for_key monthly_limit_of_yojson "MonthlyLimit") _list path;
   }
    : set_text_message_spend_limit_override_result)

let set_text_message_spend_limit_override_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({ monthly_limit = value_for_key monthly_limit_of_yojson "MonthlyLimit" _list path }
    : set_text_message_spend_limit_override_request)

let set_rcs_message_spend_limit_override_result_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     monthly_limit =
       option_of_yojson (value_for_key monthly_limit_of_yojson "MonthlyLimit") _list path;
   }
    : set_rcs_message_spend_limit_override_result)

let set_rcs_message_spend_limit_override_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({ monthly_limit = value_for_key monthly_limit_of_yojson "MonthlyLimit" _list path }
    : set_rcs_message_spend_limit_override_request)

let set_notify_message_spend_limit_override_result_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     monthly_limit =
       option_of_yojson (value_for_key monthly_limit_of_yojson "MonthlyLimit") _list path;
   }
    : set_notify_message_spend_limit_override_result)

let set_notify_message_spend_limit_override_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({ monthly_limit = value_for_key monthly_limit_of_yojson "MonthlyLimit" _list path }
    : set_notify_message_spend_limit_override_request)

let set_media_message_spend_limit_override_result_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     monthly_limit =
       option_of_yojson (value_for_key monthly_limit_of_yojson "MonthlyLimit") _list path;
   }
    : set_media_message_spend_limit_override_result)

let set_media_message_spend_limit_override_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({ monthly_limit = value_for_key monthly_limit_of_yojson "MonthlyLimit" _list path }
    : set_media_message_spend_limit_override_request)

let set_default_sender_id_result_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     configuration_set_arn =
       option_of_yojson
         (value_for_key Smaws_Lib.Smithy_api.Json_deserializers.string__of_yojson
            "ConfigurationSetArn")
         _list path;
     configuration_set_name =
       option_of_yojson
         (value_for_key configuration_set_name_of_yojson "ConfigurationSetName")
         _list path;
     sender_id = option_of_yojson (value_for_key sender_id_of_yojson "SenderId") _list path;
   }
    : set_default_sender_id_result)

let set_default_sender_id_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     configuration_set_name =
       value_for_key configuration_set_name_or_arn_of_yojson "ConfigurationSetName" _list path;
     sender_id = value_for_key sender_id_of_yojson "SenderId" _list path;
   }
    : set_default_sender_id_request)

let set_default_message_type_result_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     configuration_set_arn =
       option_of_yojson
         (value_for_key Smaws_Lib.Smithy_api.Json_deserializers.string__of_yojson
            "ConfigurationSetArn")
         _list path;
     configuration_set_name =
       option_of_yojson
         (value_for_key configuration_set_name_of_yojson "ConfigurationSetName")
         _list path;
     message_type = option_of_yojson (value_for_key message_type_of_yojson "MessageType") _list path;
   }
    : set_default_message_type_result)

let set_default_message_type_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     configuration_set_name =
       value_for_key configuration_set_name_or_arn_of_yojson "ConfigurationSetName" _list path;
     message_type = value_for_key message_type_of_yojson "MessageType" _list path;
   }
    : set_default_message_type_request)

let set_default_message_feedback_enabled_result_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     configuration_set_arn =
       option_of_yojson
         (value_for_key Smaws_Lib.Smithy_api.Json_deserializers.string__of_yojson
            "ConfigurationSetArn")
         _list path;
     configuration_set_name =
       option_of_yojson
         (value_for_key configuration_set_name_of_yojson "ConfigurationSetName")
         _list path;
     message_feedback_enabled =
       option_of_yojson
         (value_for_key Smaws_Lib.Smithy_api.Json_deserializers.boolean__of_yojson
            "MessageFeedbackEnabled")
         _list path;
   }
    : set_default_message_feedback_enabled_result)

let set_default_message_feedback_enabled_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     configuration_set_name =
       value_for_key configuration_set_name_or_arn_of_yojson "ConfigurationSetName" _list path;
     message_feedback_enabled =
       value_for_key Smaws_Lib.Smithy_api.Json_deserializers.boolean__of_yojson
         "MessageFeedbackEnabled" _list path;
   }
    : set_default_message_feedback_enabled_request)

let set_account_default_protect_configuration_result_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     default_protect_configuration_arn =
       value_for_key protect_configuration_arn_of_yojson "DefaultProtectConfigurationArn" _list path;
     default_protect_configuration_id =
       value_for_key protect_configuration_id_of_yojson "DefaultProtectConfigurationId" _list path;
   }
    : set_account_default_protect_configuration_result)

let set_account_default_protect_configuration_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     protect_configuration_id =
       value_for_key protect_configuration_id_or_arn_of_yojson "ProtectConfigurationId" _list path;
   }
    : set_account_default_protect_configuration_request)

let send_voice_message_result_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     message_id =
       option_of_yojson
         (value_for_key Smaws_Lib.Smithy_api.Json_deserializers.string__of_yojson "MessageId")
         _list path;
   }
    : send_voice_message_result)

let time_to_live_of_yojson = int_of_yojson

let voice_message_body_text_type_of_yojson (tree : t) path =
  ((match tree with
    | `String "TEXT" -> TEXT
    | `String "SSML" -> SSML
    | `String value ->
        raise (deserialize_unknown_enum_value_error path "VoiceMessageBodyTextType" value)
    | _ -> raise (deserialize_wrong_type_error path "VoiceMessageBodyTextType")
     : voice_message_body_text_type)
    : voice_message_body_text_type)

let voice_message_body_of_yojson = string_of_yojson
let voice_message_origination_identity_of_yojson = string_of_yojson

let send_voice_message_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     destination_phone_number =
       value_for_key phone_number_of_yojson "DestinationPhoneNumber" _list path;
     origination_identity =
       value_for_key voice_message_origination_identity_of_yojson "OriginationIdentity" _list path;
     message_body =
       option_of_yojson (value_for_key voice_message_body_of_yojson "MessageBody") _list path;
     message_body_text_type =
       option_of_yojson
         (value_for_key voice_message_body_text_type_of_yojson "MessageBodyTextType")
         _list path;
     voice_id = option_of_yojson (value_for_key voice_id_of_yojson "VoiceId") _list path;
     configuration_set_name =
       option_of_yojson
         (value_for_key configuration_set_name_or_arn_of_yojson "ConfigurationSetName")
         _list path;
     max_price_per_minute =
       option_of_yojson (value_for_key max_price_of_yojson "MaxPricePerMinute") _list path;
     time_to_live = option_of_yojson (value_for_key time_to_live_of_yojson "TimeToLive") _list path;
     context = option_of_yojson (value_for_key context_map_of_yojson "Context") _list path;
     dry_run =
       option_of_yojson
         (value_for_key Smaws_Lib.Smithy_api.Json_deserializers.primitive_boolean_of_yojson "DryRun")
         _list path;
     protect_configuration_id =
       option_of_yojson
         (value_for_key protect_configuration_id_or_arn_of_yojson "ProtectConfigurationId")
         _list path;
     message_feedback_enabled =
       option_of_yojson
         (value_for_key Smaws_Lib.Smithy_api.Json_deserializers.boolean__of_yojson
            "MessageFeedbackEnabled")
         _list path;
   }
    : send_voice_message_request)

let send_text_message_result_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     message_id =
       option_of_yojson
         (value_for_key Smaws_Lib.Smithy_api.Json_deserializers.string__of_yojson "MessageId")
         _list path;
   }
    : send_text_message_result)

let text_message_body_of_yojson = string_of_yojson
let text_message_origination_identity_of_yojson = string_of_yojson

let send_text_message_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     destination_phone_number =
       value_for_key phone_number_of_yojson "DestinationPhoneNumber" _list path;
     origination_identity =
       option_of_yojson
         (value_for_key text_message_origination_identity_of_yojson "OriginationIdentity")
         _list path;
     message_body =
       option_of_yojson (value_for_key text_message_body_of_yojson "MessageBody") _list path;
     message_type = option_of_yojson (value_for_key message_type_of_yojson "MessageType") _list path;
     keyword = option_of_yojson (value_for_key keyword_of_yojson "Keyword") _list path;
     configuration_set_name =
       option_of_yojson
         (value_for_key configuration_set_name_or_arn_of_yojson "ConfigurationSetName")
         _list path;
     max_price = option_of_yojson (value_for_key max_price_of_yojson "MaxPrice") _list path;
     time_to_live = option_of_yojson (value_for_key time_to_live_of_yojson "TimeToLive") _list path;
     context = option_of_yojson (value_for_key context_map_of_yojson "Context") _list path;
     destination_country_parameters =
       option_of_yojson
         (value_for_key destination_country_parameters_of_yojson "DestinationCountryParameters")
         _list path;
     dry_run =
       option_of_yojson
         (value_for_key Smaws_Lib.Smithy_api.Json_deserializers.primitive_boolean_of_yojson "DryRun")
         _list path;
     protect_configuration_id =
       option_of_yojson
         (value_for_key protect_configuration_id_or_arn_of_yojson "ProtectConfigurationId")
         _list path;
     message_feedback_enabled =
       option_of_yojson
         (value_for_key Smaws_Lib.Smithy_api.Json_deserializers.boolean__of_yojson
            "MessageFeedbackEnabled")
         _list path;
   }
    : send_text_message_request)

let send_rcs_message_result_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     message_id =
       option_of_yojson
         (value_for_key Smaws_Lib.Smithy_api.Json_deserializers.string__of_yojson "MessageId")
         _list path;
   }
    : send_rcs_message_result)

let rcs_fallback_origination_identity_of_yojson = string_of_yojson
let rcs_fallback_message_body_of_yojson = string_of_yojson

let rcs_fallback_channel_of_yojson (tree : t) path =
  ((match tree with
    | `String "SMS" -> SMS
    | `String "MMS" -> MMS
    | `String value -> raise (deserialize_unknown_enum_value_error path "RcsFallbackChannel" value)
    | _ -> raise (deserialize_wrong_type_error path "RcsFallbackChannel")
     : rcs_fallback_channel)
    : rcs_fallback_channel)

let rcs_fallback_configuration_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     channel = value_for_key rcs_fallback_channel_of_yojson "Channel" _list path;
     message_body =
       option_of_yojson (value_for_key rcs_fallback_message_body_of_yojson "MessageBody") _list path;
     media_urls = option_of_yojson (value_for_key media_url_list_of_yojson "MediaUrls") _list path;
     origination_identity =
       option_of_yojson
         (value_for_key rcs_fallback_origination_identity_of_yojson "OriginationIdentity")
         _list path;
   }
    : rcs_fallback_configuration)

let rcs_message_traffic_type_of_yojson = string_of_yojson
let rcs_time_to_live_of_yojson = int_of_yojson
let rcs_calendar_event_description_of_yojson = string_of_yojson
let rcs_calendar_event_title_of_yojson = string_of_yojson
let rcs_postback_data_of_yojson = string_of_yojson
let rcs_suggested_action_text_of_yojson = string_of_yojson

let rcs_create_calendar_event_action_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     text = value_for_key rcs_suggested_action_text_of_yojson "Text" _list path;
     postback_data = value_for_key rcs_postback_data_of_yojson "PostbackData" _list path;
     title = value_for_key rcs_calendar_event_title_of_yojson "Title" _list path;
     start_time =
       value_for_key Smaws_Lib.Smithy_api.Json_deserializers.timestamp_epoch_seconds_of_yojson
         "StartTime" _list path;
     end_time =
       value_for_key Smaws_Lib.Smithy_api.Json_deserializers.timestamp_epoch_seconds_of_yojson
         "EndTime" _list path;
     description =
       option_of_yojson
         (value_for_key rcs_calendar_event_description_of_yojson "Description")
         _list path;
   }
    : rcs_create_calendar_event_action)

let rcs_request_location_action_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     text = value_for_key rcs_suggested_action_text_of_yojson "Text" _list path;
     postback_data = value_for_key rcs_postback_data_of_yojson "PostbackData" _list path;
   }
    : rcs_request_location_action)

let rcs_location_label_of_yojson = string_of_yojson

let rcs_show_location_action_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     text = value_for_key rcs_suggested_action_text_of_yojson "Text" _list path;
     postback_data = value_for_key rcs_postback_data_of_yojson "PostbackData" _list path;
     latitude =
       value_for_key Smaws_Lib.Smithy_api.Json_deserializers.double_of_yojson "Latitude" _list path;
     longitude =
       value_for_key Smaws_Lib.Smithy_api.Json_deserializers.double_of_yojson "Longitude" _list path;
     label = option_of_yojson (value_for_key rcs_location_label_of_yojson "Label") _list path;
   }
    : rcs_show_location_action)

let rcs_dial_phone_action_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     text = value_for_key rcs_suggested_action_text_of_yojson "Text" _list path;
     postback_data = value_for_key rcs_postback_data_of_yojson "PostbackData" _list path;
     phone_number = value_for_key phone_number_of_yojson "PhoneNumber" _list path;
   }
    : rcs_dial_phone_action)

let rcs_open_url_value_of_yojson = string_of_yojson

let rcs_open_url_action_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     text = value_for_key rcs_suggested_action_text_of_yojson "Text" _list path;
     postback_data = value_for_key rcs_postback_data_of_yojson "PostbackData" _list path;
     url = value_for_key rcs_open_url_value_of_yojson "Url" _list path;
     application =
       option_of_yojson
         (value_for_key Smaws_Lib.Smithy_api.Json_deserializers.string__of_yojson "Application")
         _list path;
     webview_view_mode =
       option_of_yojson
         (value_for_key Smaws_Lib.Smithy_api.Json_deserializers.string__of_yojson "WebviewViewMode")
         _list path;
   }
    : rcs_open_url_action)

let rcs_reply_action_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     text = value_for_key rcs_suggested_action_text_of_yojson "Text" _list path;
     postback_data = value_for_key rcs_postback_data_of_yojson "PostbackData" _list path;
   }
    : rcs_reply_action)

let rcs_suggested_action_of_yojson (tree : t) path =
  let _list = assoc_of_yojson tree path in
  let key, value_ =
    match _list with
    | (key, value_) :: _ -> (key, value_)
    | _ -> raise (deserialize_wrong_type_error path "union")
  in
  (match key with
   | "Reply" -> Reply (rcs_reply_action_of_yojson value_ path)
   | "OpenUrl" -> OpenUrl (rcs_open_url_action_of_yojson value_ path)
   | "DialPhone" -> DialPhone (rcs_dial_phone_action_of_yojson value_ path)
   | "ShowLocation" -> ShowLocation (rcs_show_location_action_of_yojson value_ path)
   | "RequestLocation" -> RequestLocation (rcs_request_location_action_of_yojson value_ path)
   | "CreateCalendarEvent" ->
       CreateCalendarEvent (rcs_create_calendar_event_action_of_yojson value_ path)
   | _ as unknown -> raise (deserialize_unknown_enum_value_error path "RcsSuggestedAction" unknown)
    : rcs_suggested_action)

let rcs_suggested_action_list_of_yojson tree path =
  list_of_yojson rcs_suggested_action_of_yojson tree path

let rcs_card_suggested_action_list_of_yojson tree path =
  list_of_yojson rcs_suggested_action_of_yojson tree path

let rcs_media_url_of_yojson = string_of_yojson

let rcs_carousel_card_media_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     file_url = value_for_key rcs_media_url_of_yojson "FileUrl" _list path;
     thumbnail_url =
       option_of_yojson (value_for_key rcs_media_url_of_yojson "ThumbnailUrl") _list path;
     height =
       option_of_yojson
         (value_for_key Smaws_Lib.Smithy_api.Json_deserializers.string__of_yojson "Height")
         _list path;
   }
    : rcs_carousel_card_media)

let rcs_card_description_of_yojson = string_of_yojson
let rcs_card_title_of_yojson = string_of_yojson

let rcs_carousel_card_content_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     title = option_of_yojson (value_for_key rcs_card_title_of_yojson "Title") _list path;
     description =
       option_of_yojson (value_for_key rcs_card_description_of_yojson "Description") _list path;
     media = option_of_yojson (value_for_key rcs_carousel_card_media_of_yojson "Media") _list path;
     suggestions =
       option_of_yojson
         (value_for_key rcs_card_suggested_action_list_of_yojson "Suggestions")
         _list path;
   }
    : rcs_carousel_card_content)

let rcs_carousel_card_content_list_of_yojson tree path =
  list_of_yojson rcs_carousel_card_content_of_yojson tree path

let rcs_carousel_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     card_width =
       value_for_key Smaws_Lib.Smithy_api.Json_deserializers.string__of_yojson "CardWidth" _list
         path;
     card_contents =
       value_for_key rcs_carousel_card_content_list_of_yojson "CardContents" _list path;
   }
    : rcs_carousel)

let rcs_card_media_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     file_url = value_for_key rcs_media_url_of_yojson "FileUrl" _list path;
     thumbnail_url =
       option_of_yojson (value_for_key rcs_media_url_of_yojson "ThumbnailUrl") _list path;
     height =
       option_of_yojson
         (value_for_key Smaws_Lib.Smithy_api.Json_deserializers.string__of_yojson "Height")
         _list path;
   }
    : rcs_card_media)

let rcs_card_content_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     title = option_of_yojson (value_for_key rcs_card_title_of_yojson "Title") _list path;
     description =
       option_of_yojson (value_for_key rcs_card_description_of_yojson "Description") _list path;
     media = option_of_yojson (value_for_key rcs_card_media_of_yojson "Media") _list path;
     suggestions =
       option_of_yojson
         (value_for_key rcs_card_suggested_action_list_of_yojson "Suggestions")
         _list path;
   }
    : rcs_card_content)

let rcs_standalone_card_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     card_orientation =
       value_for_key Smaws_Lib.Smithy_api.Json_deserializers.string__of_yojson "CardOrientation"
         _list path;
     thumbnail_image_alignment =
       option_of_yojson
         (value_for_key Smaws_Lib.Smithy_api.Json_deserializers.string__of_yojson
            "ThumbnailImageAlignment")
         _list path;
     card_content = value_for_key rcs_card_content_of_yojson "CardContent" _list path;
   }
    : rcs_standalone_card)

let rcs_file_message_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     file_url = value_for_key rcs_media_url_of_yojson "FileUrl" _list path;
     thumbnail_url =
       option_of_yojson (value_for_key rcs_media_url_of_yojson "ThumbnailUrl") _list path;
   }
    : rcs_file_message)

let rcs_text_body_of_yojson = string_of_yojson

let rcs_text_message_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({ body = value_for_key rcs_text_body_of_yojson "Body" _list path } : rcs_text_message)

let rcs_content_of_yojson (tree : t) path =
  let _list = assoc_of_yojson tree path in
  let key, value_ =
    match _list with
    | (key, value_) :: _ -> (key, value_)
    | _ -> raise (deserialize_wrong_type_error path "union")
  in
  (match key with
   | "TextMessage" -> TextMessage (rcs_text_message_of_yojson value_ path)
   | "FileMessage" -> FileMessage (rcs_file_message_of_yojson value_ path)
   | "RichCard" -> RichCard (rcs_standalone_card_of_yojson value_ path)
   | "Carousel" -> Carousel (rcs_carousel_of_yojson value_ path)
   | _ as unknown -> raise (deserialize_unknown_enum_value_error path "RcsContent" unknown)
    : rcs_content)

let rcs_message_content_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     content = value_for_key rcs_content_of_yojson "Content" _list path;
     suggestions =
       option_of_yojson (value_for_key rcs_suggested_action_list_of_yojson "Suggestions") _list path;
   }
    : rcs_message_content)

let rcs_message_origination_identity_of_yojson = string_of_yojson

let send_rcs_message_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     destination_phone_number =
       value_for_key phone_number_of_yojson "DestinationPhoneNumber" _list path;
     origination_identity =
       value_for_key rcs_message_origination_identity_of_yojson "OriginationIdentity" _list path;
     rcs_message_content =
       option_of_yojson (value_for_key rcs_message_content_of_yojson "RcsMessageContent") _list path;
     time_to_live =
       option_of_yojson (value_for_key rcs_time_to_live_of_yojson "TimeToLive") _list path;
     message_traffic_type =
       option_of_yojson
         (value_for_key rcs_message_traffic_type_of_yojson "MessageTrafficType")
         _list path;
     fallback_configuration =
       option_of_yojson
         (value_for_key rcs_fallback_configuration_of_yojson "FallbackConfiguration")
         _list path;
     protect_configuration_id =
       option_of_yojson
         (value_for_key protect_configuration_id_or_arn_of_yojson "ProtectConfigurationId")
         _list path;
     configuration_set_name =
       option_of_yojson
         (value_for_key configuration_set_name_or_arn_of_yojson "ConfigurationSetName")
         _list path;
     max_price = option_of_yojson (value_for_key max_price_of_yojson "MaxPrice") _list path;
     dry_run =
       option_of_yojson
         (value_for_key Smaws_Lib.Smithy_api.Json_deserializers.primitive_boolean_of_yojson "DryRun")
         _list path;
     context = option_of_yojson (value_for_key context_map_of_yojson "Context") _list path;
     message_feedback_enabled =
       option_of_yojson
         (value_for_key Smaws_Lib.Smithy_api.Json_deserializers.boolean__of_yojson
            "MessageFeedbackEnabled")
         _list path;
   }
    : send_rcs_message_request)

let send_notify_voice_message_result_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     message_id =
       option_of_yojson
         (value_for_key Smaws_Lib.Smithy_api.Json_deserializers.string__of_yojson "MessageId")
         _list path;
     template_id =
       option_of_yojson (value_for_key notify_template_id_of_yojson "TemplateId") _list path;
     resolved_message_body =
       option_of_yojson
         (value_for_key Smaws_Lib.Smithy_api.Json_deserializers.string__of_yojson
            "ResolvedMessageBody")
         _list path;
   }
    : send_notify_voice_message_result)

let template_variable_value_of_yojson = string_of_yojson
let template_variable_name_of_yojson = string_of_yojson

let template_variable_substitution_map_of_yojson tree path =
  map_of_yojson template_variable_name_of_yojson template_variable_value_of_yojson tree path

let send_notify_voice_message_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     notify_configuration_id =
       value_for_key notify_configuration_id_or_arn_of_yojson "NotifyConfigurationId" _list path;
     destination_phone_number =
       value_for_key phone_number_of_yojson "DestinationPhoneNumber" _list path;
     template_id =
       option_of_yojson (value_for_key notify_template_id_of_yojson "TemplateId") _list path;
     template_variables =
       value_for_key template_variable_substitution_map_of_yojson "TemplateVariables" _list path;
     voice_id = option_of_yojson (value_for_key voice_id_of_yojson "VoiceId") _list path;
     time_to_live = option_of_yojson (value_for_key time_to_live_of_yojson "TimeToLive") _list path;
     context = option_of_yojson (value_for_key context_map_of_yojson "Context") _list path;
     configuration_set_name =
       option_of_yojson
         (value_for_key configuration_set_name_or_arn_of_yojson "ConfigurationSetName")
         _list path;
     dry_run =
       option_of_yojson
         (value_for_key Smaws_Lib.Smithy_api.Json_deserializers.primitive_boolean_of_yojson "DryRun")
         _list path;
     message_feedback_enabled =
       option_of_yojson
         (value_for_key Smaws_Lib.Smithy_api.Json_deserializers.boolean__of_yojson
            "MessageFeedbackEnabled")
         _list path;
   }
    : send_notify_voice_message_request)

let send_notify_text_message_result_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     message_id =
       option_of_yojson
         (value_for_key Smaws_Lib.Smithy_api.Json_deserializers.string__of_yojson "MessageId")
         _list path;
     template_id =
       option_of_yojson (value_for_key notify_template_id_of_yojson "TemplateId") _list path;
     resolved_message_body =
       option_of_yojson
         (value_for_key Smaws_Lib.Smithy_api.Json_deserializers.string__of_yojson
            "ResolvedMessageBody")
         _list path;
   }
    : send_notify_text_message_result)

let send_notify_text_message_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     notify_configuration_id =
       value_for_key notify_configuration_id_or_arn_of_yojson "NotifyConfigurationId" _list path;
     destination_phone_number =
       value_for_key phone_number_of_yojson "DestinationPhoneNumber" _list path;
     template_id =
       option_of_yojson (value_for_key notify_template_id_of_yojson "TemplateId") _list path;
     template_variables =
       value_for_key template_variable_substitution_map_of_yojson "TemplateVariables" _list path;
     time_to_live = option_of_yojson (value_for_key time_to_live_of_yojson "TimeToLive") _list path;
     context = option_of_yojson (value_for_key context_map_of_yojson "Context") _list path;
     configuration_set_name =
       option_of_yojson
         (value_for_key configuration_set_name_or_arn_of_yojson "ConfigurationSetName")
         _list path;
     dry_run =
       option_of_yojson
         (value_for_key Smaws_Lib.Smithy_api.Json_deserializers.primitive_boolean_of_yojson "DryRun")
         _list path;
     message_feedback_enabled =
       option_of_yojson
         (value_for_key Smaws_Lib.Smithy_api.Json_deserializers.boolean__of_yojson
            "MessageFeedbackEnabled")
         _list path;
   }
    : send_notify_text_message_request)

let send_media_message_result_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     message_id =
       option_of_yojson
         (value_for_key Smaws_Lib.Smithy_api.Json_deserializers.string__of_yojson "MessageId")
         _list path;
   }
    : send_media_message_result)

let send_media_message_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     destination_phone_number =
       value_for_key phone_number_of_yojson "DestinationPhoneNumber" _list path;
     origination_identity =
       value_for_key media_message_origination_identity_of_yojson "OriginationIdentity" _list path;
     message_body =
       option_of_yojson (value_for_key text_message_body_of_yojson "MessageBody") _list path;
     media_urls = option_of_yojson (value_for_key media_url_list_of_yojson "MediaUrls") _list path;
     configuration_set_name =
       option_of_yojson
         (value_for_key configuration_set_name_or_arn_of_yojson "ConfigurationSetName")
         _list path;
     max_price = option_of_yojson (value_for_key max_price_of_yojson "MaxPrice") _list path;
     time_to_live = option_of_yojson (value_for_key time_to_live_of_yojson "TimeToLive") _list path;
     context = option_of_yojson (value_for_key context_map_of_yojson "Context") _list path;
     dry_run =
       option_of_yojson
         (value_for_key Smaws_Lib.Smithy_api.Json_deserializers.primitive_boolean_of_yojson "DryRun")
         _list path;
     protect_configuration_id =
       option_of_yojson
         (value_for_key protect_configuration_id_or_arn_of_yojson "ProtectConfigurationId")
         _list path;
     message_feedback_enabled =
       option_of_yojson
         (value_for_key Smaws_Lib.Smithy_api.Json_deserializers.boolean__of_yojson
            "MessageFeedbackEnabled")
         _list path;
   }
    : send_media_message_request)

let send_destination_number_verification_code_result_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     message_id =
       value_for_key Smaws_Lib.Smithy_api.Json_deserializers.string__of_yojson "MessageId" _list
         path;
   }
    : send_destination_number_verification_code_result)

let verification_message_origination_identity_of_yojson = string_of_yojson

let verification_channel_of_yojson (tree : t) path =
  ((match tree with
    | `String "TEXT" -> TEXT
    | `String "VOICE" -> VOICE
    | `String value -> raise (deserialize_unknown_enum_value_error path "VerificationChannel" value)
    | _ -> raise (deserialize_wrong_type_error path "VerificationChannel")
     : verification_channel)
    : verification_channel)

let send_destination_number_verification_code_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     verified_destination_number_id =
       value_for_key verified_destination_number_id_or_arn_of_yojson "VerifiedDestinationNumberId"
         _list path;
     verification_channel =
       value_for_key verification_channel_of_yojson "VerificationChannel" _list path;
     language_code =
       option_of_yojson (value_for_key language_code_of_yojson "LanguageCode") _list path;
     origination_identity =
       option_of_yojson
         (value_for_key verification_message_origination_identity_of_yojson "OriginationIdentity")
         _list path;
     configuration_set_name =
       option_of_yojson
         (value_for_key configuration_set_name_or_arn_of_yojson "ConfigurationSetName")
         _list path;
     context = option_of_yojson (value_for_key context_map_of_yojson "Context") _list path;
     destination_country_parameters =
       option_of_yojson
         (value_for_key destination_country_parameters_of_yojson "DestinationCountryParameters")
         _list path;
   }
    : send_destination_number_verification_code_request)

let request_sender_id_result_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     sender_id_arn =
       value_for_key Smaws_Lib.Smithy_api.Json_deserializers.string__of_yojson "SenderIdArn" _list
         path;
     sender_id = value_for_key sender_id_of_yojson "SenderId" _list path;
     iso_country_code = value_for_key iso_country_code_of_yojson "IsoCountryCode" _list path;
     message_types = value_for_key message_type_list_of_yojson "MessageTypes" _list path;
     monthly_leasing_price =
       value_for_key Smaws_Lib.Smithy_api.Json_deserializers.string__of_yojson "MonthlyLeasingPrice"
         _list path;
     deletion_protection_enabled =
       value_for_key Smaws_Lib.Smithy_api.Json_deserializers.primitive_boolean_of_yojson
         "DeletionProtectionEnabled" _list path;
     registered =
       value_for_key Smaws_Lib.Smithy_api.Json_deserializers.primitive_boolean_of_yojson
         "Registered" _list path;
     tags = option_of_yojson (value_for_key tag_list_of_yojson "Tags") _list path;
   }
    : request_sender_id_result)

let request_sender_id_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     sender_id = value_for_key sender_id_of_yojson "SenderId" _list path;
     iso_country_code = value_for_key iso_country_code_of_yojson "IsoCountryCode" _list path;
     message_types =
       option_of_yojson (value_for_key message_type_list_of_yojson "MessageTypes") _list path;
     deletion_protection_enabled =
       option_of_yojson
         (value_for_key Smaws_Lib.Smithy_api.Json_deserializers.boolean__of_yojson
            "DeletionProtectionEnabled")
         _list path;
     tags = option_of_yojson (value_for_key tag_list_of_yojson "Tags") _list path;
     client_token = option_of_yojson (value_for_key client_token_of_yojson "ClientToken") _list path;
   }
    : request_sender_id_request)

let requestable_number_type_of_yojson (tree : t) path =
  ((match tree with
    | `String "LONG_CODE" -> LONG_CODE
    | `String "TOLL_FREE" -> TOLL_FREE
    | `String "TEN_DLC" -> TEN_DLC
    | `String "SIMULATOR" -> SIMULATOR
    | `String value ->
        raise (deserialize_unknown_enum_value_error path "RequestableNumberType" value)
    | _ -> raise (deserialize_wrong_type_error path "RequestableNumberType")
     : requestable_number_type)
    : requestable_number_type)

let request_phone_number_result_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     phone_number_arn =
       option_of_yojson
         (value_for_key Smaws_Lib.Smithy_api.Json_deserializers.string__of_yojson "PhoneNumberArn")
         _list path;
     phone_number_id =
       option_of_yojson
         (value_for_key Smaws_Lib.Smithy_api.Json_deserializers.string__of_yojson "PhoneNumberId")
         _list path;
     phone_number = option_of_yojson (value_for_key phone_number_of_yojson "PhoneNumber") _list path;
     status = option_of_yojson (value_for_key number_status_of_yojson "Status") _list path;
     iso_country_code =
       option_of_yojson (value_for_key iso_country_code_of_yojson "IsoCountryCode") _list path;
     message_type = option_of_yojson (value_for_key message_type_of_yojson "MessageType") _list path;
     number_capabilities =
       option_of_yojson
         (value_for_key number_capability_list_of_yojson "NumberCapabilities")
         _list path;
     number_type =
       option_of_yojson (value_for_key requestable_number_type_of_yojson "NumberType") _list path;
     monthly_leasing_price =
       option_of_yojson
         (value_for_key Smaws_Lib.Smithy_api.Json_deserializers.string__of_yojson
            "MonthlyLeasingPrice")
         _list path;
     two_way_enabled =
       option_of_yojson
         (value_for_key Smaws_Lib.Smithy_api.Json_deserializers.primitive_boolean_of_yojson
            "TwoWayEnabled")
         _list path;
     two_way_channel_arn =
       option_of_yojson (value_for_key two_way_channel_arn_of_yojson "TwoWayChannelArn") _list path;
     two_way_channel_role =
       option_of_yojson (value_for_key iam_role_arn_of_yojson "TwoWayChannelRole") _list path;
     self_managed_opt_outs_enabled =
       option_of_yojson
         (value_for_key Smaws_Lib.Smithy_api.Json_deserializers.primitive_boolean_of_yojson
            "SelfManagedOptOutsEnabled")
         _list path;
     opt_out_list_name =
       option_of_yojson (value_for_key opt_out_list_name_of_yojson "OptOutListName") _list path;
     international_sending_enabled =
       option_of_yojson
         (value_for_key Smaws_Lib.Smithy_api.Json_deserializers.primitive_boolean_of_yojson
            "InternationalSendingEnabled")
         _list path;
     deletion_protection_enabled =
       option_of_yojson
         (value_for_key Smaws_Lib.Smithy_api.Json_deserializers.primitive_boolean_of_yojson
            "DeletionProtectionEnabled")
         _list path;
     pool_id =
       option_of_yojson
         (value_for_key Smaws_Lib.Smithy_api.Json_deserializers.string__of_yojson "PoolId")
         _list path;
     registration_id =
       option_of_yojson
         (value_for_key Smaws_Lib.Smithy_api.Json_deserializers.string__of_yojson "RegistrationId")
         _list path;
     tags = option_of_yojson (value_for_key tag_list_of_yojson "Tags") _list path;
     created_timestamp =
       option_of_yojson
         (value_for_key Smaws_Lib.Smithy_api.Json_deserializers.timestamp_epoch_seconds_of_yojson
            "CreatedTimestamp")
         _list path;
   }
    : request_phone_number_result)

let request_phone_number_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     iso_country_code = value_for_key iso_country_code_of_yojson "IsoCountryCode" _list path;
     message_type = value_for_key message_type_of_yojson "MessageType" _list path;
     number_capabilities =
       value_for_key number_capability_list_of_yojson "NumberCapabilities" _list path;
     number_type = value_for_key requestable_number_type_of_yojson "NumberType" _list path;
     opt_out_list_name =
       option_of_yojson
         (value_for_key opt_out_list_name_or_arn_of_yojson "OptOutListName")
         _list path;
     pool_id = option_of_yojson (value_for_key pool_id_or_arn_of_yojson "PoolId") _list path;
     registration_id =
       option_of_yojson (value_for_key registration_id_or_arn_of_yojson "RegistrationId") _list path;
     international_sending_enabled =
       option_of_yojson
         (value_for_key Smaws_Lib.Smithy_api.Json_deserializers.boolean__of_yojson
            "InternationalSendingEnabled")
         _list path;
     deletion_protection_enabled =
       option_of_yojson
         (value_for_key Smaws_Lib.Smithy_api.Json_deserializers.boolean__of_yojson
            "DeletionProtectionEnabled")
         _list path;
     tags = option_of_yojson (value_for_key tag_list_of_yojson "Tags") _list path;
     client_token = option_of_yojson (value_for_key client_token_of_yojson "ClientToken") _list path;
   }
    : request_phone_number_request)

let release_sender_id_result_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     sender_id_arn =
       value_for_key Smaws_Lib.Smithy_api.Json_deserializers.string__of_yojson "SenderIdArn" _list
         path;
     sender_id = value_for_key sender_id_of_yojson "SenderId" _list path;
     iso_country_code = value_for_key iso_country_code_of_yojson "IsoCountryCode" _list path;
     message_types = value_for_key message_type_list_of_yojson "MessageTypes" _list path;
     monthly_leasing_price =
       value_for_key Smaws_Lib.Smithy_api.Json_deserializers.string__of_yojson "MonthlyLeasingPrice"
         _list path;
     registered =
       value_for_key Smaws_Lib.Smithy_api.Json_deserializers.primitive_boolean_of_yojson
         "Registered" _list path;
     registration_id =
       option_of_yojson
         (value_for_key Smaws_Lib.Smithy_api.Json_deserializers.string__of_yojson "RegistrationId")
         _list path;
   }
    : release_sender_id_result)

let release_sender_id_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     sender_id = value_for_key sender_id_or_arn_of_yojson "SenderId" _list path;
     iso_country_code = value_for_key iso_country_code_of_yojson "IsoCountryCode" _list path;
   }
    : release_sender_id_request)

let release_phone_number_result_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     phone_number_arn =
       option_of_yojson
         (value_for_key Smaws_Lib.Smithy_api.Json_deserializers.string__of_yojson "PhoneNumberArn")
         _list path;
     phone_number_id =
       option_of_yojson
         (value_for_key Smaws_Lib.Smithy_api.Json_deserializers.string__of_yojson "PhoneNumberId")
         _list path;
     phone_number = option_of_yojson (value_for_key phone_number_of_yojson "PhoneNumber") _list path;
     status = option_of_yojson (value_for_key number_status_of_yojson "Status") _list path;
     iso_country_code =
       option_of_yojson (value_for_key iso_country_code_of_yojson "IsoCountryCode") _list path;
     message_type = option_of_yojson (value_for_key message_type_of_yojson "MessageType") _list path;
     number_capabilities =
       option_of_yojson
         (value_for_key number_capability_list_of_yojson "NumberCapabilities")
         _list path;
     number_type = option_of_yojson (value_for_key number_type_of_yojson "NumberType") _list path;
     monthly_leasing_price =
       option_of_yojson
         (value_for_key Smaws_Lib.Smithy_api.Json_deserializers.string__of_yojson
            "MonthlyLeasingPrice")
         _list path;
     two_way_enabled =
       option_of_yojson
         (value_for_key Smaws_Lib.Smithy_api.Json_deserializers.primitive_boolean_of_yojson
            "TwoWayEnabled")
         _list path;
     two_way_channel_arn =
       option_of_yojson (value_for_key two_way_channel_arn_of_yojson "TwoWayChannelArn") _list path;
     two_way_channel_role =
       option_of_yojson (value_for_key iam_role_arn_of_yojson "TwoWayChannelRole") _list path;
     self_managed_opt_outs_enabled =
       option_of_yojson
         (value_for_key Smaws_Lib.Smithy_api.Json_deserializers.primitive_boolean_of_yojson
            "SelfManagedOptOutsEnabled")
         _list path;
     opt_out_list_name =
       option_of_yojson (value_for_key opt_out_list_name_of_yojson "OptOutListName") _list path;
     registration_id =
       option_of_yojson
         (value_for_key Smaws_Lib.Smithy_api.Json_deserializers.string__of_yojson "RegistrationId")
         _list path;
     created_timestamp =
       option_of_yojson
         (value_for_key Smaws_Lib.Smithy_api.Json_deserializers.timestamp_epoch_seconds_of_yojson
            "CreatedTimestamp")
         _list path;
   }
    : release_phone_number_result)

let release_phone_number_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({ phone_number_id = value_for_key phone_number_id_or_arn_of_yojson "PhoneNumberId" _list path }
    : release_phone_number_request)

let put_resource_policy_result_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     resource_arn =
       option_of_yojson (value_for_key amazon_resource_name_of_yojson "ResourceArn") _list path;
     policy = option_of_yojson (value_for_key resource_policy_of_yojson "Policy") _list path;
     created_timestamp =
       option_of_yojson
         (value_for_key Smaws_Lib.Smithy_api.Json_deserializers.timestamp_epoch_seconds_of_yojson
            "CreatedTimestamp")
         _list path;
   }
    : put_resource_policy_result)

let put_resource_policy_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     resource_arn = value_for_key amazon_resource_name_of_yojson "ResourceArn" _list path;
     policy = value_for_key resource_policy_of_yojson "Policy" _list path;
   }
    : put_resource_policy_request)

let put_registration_field_value_result_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     registration_arn =
       value_for_key Smaws_Lib.Smithy_api.Json_deserializers.string__of_yojson "RegistrationArn"
         _list path;
     registration_id =
       value_for_key Smaws_Lib.Smithy_api.Json_deserializers.string__of_yojson "RegistrationId"
         _list path;
     version_number = value_for_key registration_version_number_of_yojson "VersionNumber" _list path;
     field_path = value_for_key field_path_of_yojson "FieldPath" _list path;
     select_choices =
       option_of_yojson (value_for_key select_choice_list_of_yojson "SelectChoices") _list path;
     text_value = option_of_yojson (value_for_key text_value_of_yojson "TextValue") _list path;
     registration_attachment_id =
       option_of_yojson
         (value_for_key Smaws_Lib.Smithy_api.Json_deserializers.string__of_yojson
            "RegistrationAttachmentId")
         _list path;
   }
    : put_registration_field_value_result)

let put_registration_field_value_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     registration_id = value_for_key registration_id_or_arn_of_yojson "RegistrationId" _list path;
     field_path = value_for_key field_path_of_yojson "FieldPath" _list path;
     select_choices =
       option_of_yojson (value_for_key select_choice_list_of_yojson "SelectChoices") _list path;
     text_value = option_of_yojson (value_for_key text_value_of_yojson "TextValue") _list path;
     registration_attachment_id =
       option_of_yojson
         (value_for_key registration_attachment_id_or_arn_of_yojson "RegistrationAttachmentId")
         _list path;
   }
    : put_registration_field_value_request)

let put_protect_configuration_rule_set_number_override_result_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     protect_configuration_arn =
       value_for_key protect_configuration_arn_of_yojson "ProtectConfigurationArn" _list path;
     protect_configuration_id =
       value_for_key protect_configuration_id_of_yojson "ProtectConfigurationId" _list path;
     destination_phone_number =
       value_for_key phone_number_of_yojson "DestinationPhoneNumber" _list path;
     created_timestamp =
       value_for_key Smaws_Lib.Smithy_api.Json_deserializers.timestamp_epoch_seconds_of_yojson
         "CreatedTimestamp" _list path;
     action = value_for_key protect_configuration_rule_override_action_of_yojson "Action" _list path;
     iso_country_code =
       option_of_yojson (value_for_key iso_country_code_of_yojson "IsoCountryCode") _list path;
     expiration_timestamp =
       option_of_yojson
         (value_for_key Smaws_Lib.Smithy_api.Json_deserializers.timestamp_epoch_seconds_of_yojson
            "ExpirationTimestamp")
         _list path;
   }
    : put_protect_configuration_rule_set_number_override_result)

let put_protect_configuration_rule_set_number_override_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     client_token = option_of_yojson (value_for_key client_token_of_yojson "ClientToken") _list path;
     protect_configuration_id =
       value_for_key protect_configuration_id_or_arn_of_yojson "ProtectConfigurationId" _list path;
     destination_phone_number =
       value_for_key phone_number_of_yojson "DestinationPhoneNumber" _list path;
     action = value_for_key protect_configuration_rule_override_action_of_yojson "Action" _list path;
     expiration_timestamp =
       option_of_yojson
         (value_for_key Smaws_Lib.Smithy_api.Json_deserializers.timestamp_epoch_seconds_of_yojson
            "ExpirationTimestamp")
         _list path;
   }
    : put_protect_configuration_rule_set_number_override_request)

let put_opted_out_number_result_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     opt_out_list_arn =
       option_of_yojson
         (value_for_key Smaws_Lib.Smithy_api.Json_deserializers.string__of_yojson "OptOutListArn")
         _list path;
     opt_out_list_name =
       option_of_yojson (value_for_key opt_out_list_name_of_yojson "OptOutListName") _list path;
     opted_out_number =
       option_of_yojson (value_for_key phone_number_of_yojson "OptedOutNumber") _list path;
     opted_out_timestamp =
       option_of_yojson
         (value_for_key Smaws_Lib.Smithy_api.Json_deserializers.timestamp_epoch_seconds_of_yojson
            "OptedOutTimestamp")
         _list path;
     end_user_opted_out =
       option_of_yojson
         (value_for_key Smaws_Lib.Smithy_api.Json_deserializers.primitive_boolean_of_yojson
            "EndUserOptedOut")
         _list path;
   }
    : put_opted_out_number_result)

let put_opted_out_number_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     opt_out_list_name =
       value_for_key opt_out_list_name_or_arn_of_yojson "OptOutListName" _list path;
     opted_out_number = value_for_key phone_number_of_yojson "OptedOutNumber" _list path;
   }
    : put_opted_out_number_request)

let put_message_feedback_result_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     message_id = value_for_key message_id_of_yojson "MessageId" _list path;
     message_feedback_status =
       value_for_key message_feedback_status_of_yojson "MessageFeedbackStatus" _list path;
   }
    : put_message_feedback_result)

let put_message_feedback_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     message_id = value_for_key message_id_of_yojson "MessageId" _list path;
     message_feedback_status =
       value_for_key message_feedback_status_of_yojson "MessageFeedbackStatus" _list path;
   }
    : put_message_feedback_request)

let put_keyword_result_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     origination_identity_arn =
       option_of_yojson
         (value_for_key Smaws_Lib.Smithy_api.Json_deserializers.string__of_yojson
            "OriginationIdentityArn")
         _list path;
     origination_identity =
       option_of_yojson
         (value_for_key Smaws_Lib.Smithy_api.Json_deserializers.string__of_yojson
            "OriginationIdentity")
         _list path;
     keyword = option_of_yojson (value_for_key keyword_of_yojson "Keyword") _list path;
     keyword_message =
       option_of_yojson (value_for_key keyword_message_of_yojson "KeywordMessage") _list path;
     keyword_action =
       option_of_yojson (value_for_key keyword_action_of_yojson "KeywordAction") _list path;
   }
    : put_keyword_result)

let put_keyword_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     origination_identity =
       value_for_key phone_or_pool_id_or_arn_of_yojson "OriginationIdentity" _list path;
     keyword = value_for_key keyword_of_yojson "Keyword" _list path;
     keyword_message = value_for_key keyword_message_of_yojson "KeywordMessage" _list path;
     keyword_action =
       option_of_yojson (value_for_key keyword_action_of_yojson "KeywordAction") _list path;
   }
    : put_keyword_request)
