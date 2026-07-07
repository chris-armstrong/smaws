open Smaws_Lib.Json.SerializeHelpers
open Types

let voice_message_origination_identity_to_yojson = string_to_yojson

let voice_message_body_text_type_to_yojson (x : voice_message_body_text_type) =
  match x with TEXT -> `String "TEXT" | SSML -> `String "SSML"

let voice_message_body_to_yojson = string_to_yojson

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
let phone_number_to_yojson = string_to_yojson

let verification_status_to_yojson (x : verification_status) =
  match x with
  | PENDING -> `String "PENDING"
  | VERIFIED -> `String "VERIFIED"
  | UNSUPPORTED -> `String "UNSUPPORTED"

let verify_destination_number_result_to_yojson (x : verify_destination_number_result) =
  assoc_to_yojson
    [
      ( "CreatedTimestamp",
        Some
          (Smaws_Lib.Smithy_api.Json_serializers.timestamp_epoch_seconds_to_yojson
             x.created_timestamp) );
      ("Status", Some (verification_status_to_yojson x.status));
      ("DestinationPhoneNumber", Some (phone_number_to_yojson x.destination_phone_number));
      ( "VerifiedDestinationNumberId",
        Some
          (Smaws_Lib.Smithy_api.Json_serializers.string__to_yojson x.verified_destination_number_id)
      );
      ( "VerifiedDestinationNumberArn",
        Some
          (Smaws_Lib.Smithy_api.Json_serializers.string__to_yojson x.verified_destination_number_arn)
      );
    ]

let verified_destination_number_id_or_arn_to_yojson = string_to_yojson
let verification_code_to_yojson = string_to_yojson

let verify_destination_number_request_to_yojson (x : verify_destination_number_request) =
  assoc_to_yojson
    [
      ("VerificationCode", Some (verification_code_to_yojson x.verification_code));
      ( "VerifiedDestinationNumberId",
        Some (verified_destination_number_id_or_arn_to_yojson x.verified_destination_number_id) );
    ]

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

let validation_exception_field_to_yojson (x : validation_exception_field) =
  assoc_to_yojson
    [
      ("Message", Some (Smaws_Lib.Smithy_api.Json_serializers.string__to_yojson x.message));
      ("Name", Some (Smaws_Lib.Smithy_api.Json_serializers.string__to_yojson x.name));
    ]

let validation_exception_field_list_to_yojson tree =
  list_to_yojson validation_exception_field_to_yojson tree

let validation_exception_to_yojson (x : validation_exception) =
  assoc_to_yojson
    [
      ("Fields", option_to_yojson validation_exception_field_list_to_yojson x.fields);
      ("Reason", option_to_yojson validation_exception_reason_to_yojson x.reason);
      ("Message", option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.string__to_yojson x.message);
    ]

let throttling_exception_to_yojson (x : throttling_exception) =
  assoc_to_yojson
    [
      ("Message", option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.string__to_yojson x.message);
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
      ( "ResourceId",
        option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.string__to_yojson x.resource_id );
      ("ResourceType", option_to_yojson resource_type_to_yojson x.resource_type);
      ("Message", option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.string__to_yojson x.message);
    ]

let internal_server_exception_to_yojson (x : internal_server_exception) =
  assoc_to_yojson
    [
      ( "RequestId",
        option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.string__to_yojson x.request_id );
      ("Message", option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.string__to_yojson x.message);
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
      ( "ResourceId",
        option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.string__to_yojson x.resource_id );
      ("ResourceType", option_to_yojson resource_type_to_yojson x.resource_type);
      ("Reason", option_to_yojson conflict_exception_reason_to_yojson x.reason);
      ("Message", option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.string__to_yojson x.message);
    ]

let access_denied_exception_reason_to_yojson (x : access_denied_exception_reason) =
  match x with
  | INSUFFICIENT_ACCOUNT_REPUTATION -> `String "INSUFFICIENT_ACCOUNT_REPUTATION"
  | ACCOUNT_DISABLED -> `String "ACCOUNT_DISABLED"

let access_denied_exception_to_yojson (x : access_denied_exception) =
  assoc_to_yojson
    [
      ("Reason", option_to_yojson access_denied_exception_reason_to_yojson x.reason);
      ("Message", option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.string__to_yojson x.message);
    ]

let verified_destination_number_information_to_yojson (x : verified_destination_number_information)
    =
  assoc_to_yojson
    [
      ( "CreatedTimestamp",
        Some
          (Smaws_Lib.Smithy_api.Json_serializers.timestamp_epoch_seconds_to_yojson
             x.created_timestamp) );
      ( "RcsAgentId",
        option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.string__to_yojson x.rcs_agent_id );
      ("Status", Some (verification_status_to_yojson x.status));
      ("DestinationPhoneNumber", Some (phone_number_to_yojson x.destination_phone_number));
      ( "VerifiedDestinationNumberId",
        Some
          (Smaws_Lib.Smithy_api.Json_serializers.string__to_yojson x.verified_destination_number_id)
      );
      ( "VerifiedDestinationNumberArn",
        Some
          (Smaws_Lib.Smithy_api.Json_serializers.string__to_yojson x.verified_destination_number_arn)
      );
    ]

let verified_destination_number_information_list_to_yojson tree =
  list_to_yojson verified_destination_number_information_to_yojson tree

let verified_destination_number_id_list_to_yojson tree =
  list_to_yojson verified_destination_number_id_or_arn_to_yojson tree

let verified_destination_number_filter_name_to_yojson (x : verified_destination_number_filter_name)
    =
  match x with STATUS -> `String "status" | RCS_AGENT_ID -> `String "rcs-agent-id"

let filter_value_to_yojson = string_to_yojson
let filter_value_list_to_yojson tree = list_to_yojson filter_value_to_yojson tree

let verified_destination_number_filter_to_yojson (x : verified_destination_number_filter) =
  assoc_to_yojson
    [
      ("Values", Some (filter_value_list_to_yojson x.values));
      ("Name", Some (verified_destination_number_filter_name_to_yojson x.name));
    ]

let verified_destination_number_filter_list_to_yojson tree =
  list_to_yojson verified_destination_number_filter_to_yojson tree

let verification_message_origination_identity_to_yojson = string_to_yojson

let verification_channel_to_yojson (x : verification_channel) =
  match x with TEXT -> `String "TEXT" | VOICE -> `String "VOICE"

let sender_id_to_yojson = string_to_yojson
let iso_country_code_to_yojson = string_to_yojson

let message_type_to_yojson (x : message_type) =
  match x with TRANSACTIONAL -> `String "TRANSACTIONAL" | PROMOTIONAL -> `String "PROMOTIONAL"

let message_type_list_to_yojson tree = list_to_yojson message_type_to_yojson tree

let update_sender_id_result_to_yojson (x : update_sender_id_result) =
  assoc_to_yojson
    [
      ( "RegistrationId",
        option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.string__to_yojson x.registration_id
      );
      ( "Registered",
        Some (Smaws_Lib.Smithy_api.Json_serializers.primitive_boolean_to_yojson x.registered) );
      ( "DeletionProtectionEnabled",
        Some
          (Smaws_Lib.Smithy_api.Json_serializers.primitive_boolean_to_yojson
             x.deletion_protection_enabled) );
      ( "MonthlyLeasingPrice",
        Some (Smaws_Lib.Smithy_api.Json_serializers.string__to_yojson x.monthly_leasing_price) );
      ("MessageTypes", Some (message_type_list_to_yojson x.message_types));
      ("IsoCountryCode", Some (iso_country_code_to_yojson x.iso_country_code));
      ("SenderId", Some (sender_id_to_yojson x.sender_id));
      ("SenderIdArn", Some (Smaws_Lib.Smithy_api.Json_serializers.string__to_yojson x.sender_id_arn));
    ]

let sender_id_or_arn_to_yojson = string_to_yojson

let update_sender_id_request_to_yojson (x : update_sender_id_request) =
  assoc_to_yojson
    [
      ( "DeletionProtectionEnabled",
        option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.boolean__to_yojson
          x.deletion_protection_enabled );
      ("IsoCountryCode", Some (iso_country_code_to_yojson x.iso_country_code));
      ("SenderId", Some (sender_id_or_arn_to_yojson x.sender_id));
    ]

let rcs_agent_status_to_yojson (x : rcs_agent_status) =
  match x with
  | CREATED -> `String "CREATED"
  | PENDING -> `String "PENDING"
  | TESTING -> `String "TESTING"
  | PARTIAL -> `String "PARTIAL"
  | ACTIVE -> `String "ACTIVE"
  | DELETED -> `String "DELETED"

let opt_out_list_name_to_yojson = string_to_yojson
let two_way_channel_arn_to_yojson = string_to_yojson
let iam_role_arn_to_yojson = string_to_yojson
let two_way_media_s3_bucket_name_to_yojson = string_to_yojson
let two_way_media_s3_key_prefix_to_yojson = string_to_yojson
let rcs_event_type_to_yojson = string_to_yojson
let rcs_event_type_list_to_yojson tree = list_to_yojson rcs_event_type_to_yojson tree

let update_rcs_agent_result_to_yojson (x : update_rcs_agent_result) =
  assoc_to_yojson
    [
      ( "TwoWayRcsEventsEnabled",
        option_to_yojson rcs_event_type_list_to_yojson x.two_way_rcs_events_enabled );
      ("TwoWayMediaS3Role", option_to_yojson iam_role_arn_to_yojson x.two_way_media_s3_role);
      ( "TwoWayMediaS3KeyPrefix",
        option_to_yojson two_way_media_s3_key_prefix_to_yojson x.two_way_media_s3_key_prefix );
      ( "TwoWayMediaS3BucketName",
        option_to_yojson two_way_media_s3_bucket_name_to_yojson x.two_way_media_s3_bucket_name );
      ( "TwoWayEnabled",
        Some (Smaws_Lib.Smithy_api.Json_serializers.primitive_boolean_to_yojson x.two_way_enabled)
      );
      ("TwoWayChannelRole", option_to_yojson iam_role_arn_to_yojson x.two_way_channel_role);
      ("TwoWayChannelArn", option_to_yojson two_way_channel_arn_to_yojson x.two_way_channel_arn);
      ( "SelfManagedOptOutsEnabled",
        Some
          (Smaws_Lib.Smithy_api.Json_serializers.primitive_boolean_to_yojson
             x.self_managed_opt_outs_enabled) );
      ("OptOutListName", option_to_yojson opt_out_list_name_to_yojson x.opt_out_list_name);
      ( "DeletionProtectionEnabled",
        Some
          (Smaws_Lib.Smithy_api.Json_serializers.primitive_boolean_to_yojson
             x.deletion_protection_enabled) );
      ( "CreatedTimestamp",
        Some
          (Smaws_Lib.Smithy_api.Json_serializers.timestamp_epoch_seconds_to_yojson
             x.created_timestamp) );
      ("Status", Some (rcs_agent_status_to_yojson x.status));
      ("RcsAgentId", Some (Smaws_Lib.Smithy_api.Json_serializers.string__to_yojson x.rcs_agent_id));
      ("RcsAgentArn", Some (Smaws_Lib.Smithy_api.Json_serializers.string__to_yojson x.rcs_agent_arn));
    ]

let rcs_agent_id_or_arn_to_yojson = string_to_yojson
let opt_out_list_name_or_arn_to_yojson = string_to_yojson
let two_way_media_s3_bucket_name_or_unset_to_yojson = string_to_yojson
let iam_role_arn_or_unset_to_yojson = string_to_yojson

let update_rcs_agent_request_to_yojson (x : update_rcs_agent_request) =
  assoc_to_yojson
    [
      ( "TwoWayRcsEventsEnabled",
        option_to_yojson rcs_event_type_list_to_yojson x.two_way_rcs_events_enabled );
      ("TwoWayMediaS3Role", option_to_yojson iam_role_arn_or_unset_to_yojson x.two_way_media_s3_role);
      ( "TwoWayMediaS3KeyPrefix",
        option_to_yojson two_way_media_s3_key_prefix_to_yojson x.two_way_media_s3_key_prefix );
      ( "TwoWayMediaS3BucketName",
        option_to_yojson two_way_media_s3_bucket_name_or_unset_to_yojson
          x.two_way_media_s3_bucket_name );
      ( "TwoWayEnabled",
        option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.boolean__to_yojson x.two_way_enabled
      );
      ("TwoWayChannelRole", option_to_yojson iam_role_arn_to_yojson x.two_way_channel_role);
      ("TwoWayChannelArn", option_to_yojson two_way_channel_arn_to_yojson x.two_way_channel_arn);
      ( "SelfManagedOptOutsEnabled",
        option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.boolean__to_yojson
          x.self_managed_opt_outs_enabled );
      ("OptOutListName", option_to_yojson opt_out_list_name_or_arn_to_yojson x.opt_out_list_name);
      ( "DeletionProtectionEnabled",
        option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.boolean__to_yojson
          x.deletion_protection_enabled );
      ("RcsAgentId", Some (rcs_agent_id_or_arn_to_yojson x.rcs_agent_id));
    ]

let protect_configuration_arn_to_yojson = string_to_yojson
let protect_configuration_id_to_yojson = string_to_yojson

let update_protect_configuration_result_to_yojson (x : update_protect_configuration_result) =
  assoc_to_yojson
    [
      ( "DeletionProtectionEnabled",
        Some
          (Smaws_Lib.Smithy_api.Json_serializers.primitive_boolean_to_yojson
             x.deletion_protection_enabled) );
      ( "AccountDefault",
        Some (Smaws_Lib.Smithy_api.Json_serializers.primitive_boolean_to_yojson x.account_default)
      );
      ( "CreatedTimestamp",
        Some
          (Smaws_Lib.Smithy_api.Json_serializers.timestamp_epoch_seconds_to_yojson
             x.created_timestamp) );
      ( "ProtectConfigurationId",
        Some (protect_configuration_id_to_yojson x.protect_configuration_id) );
      ( "ProtectConfigurationArn",
        Some (protect_configuration_arn_to_yojson x.protect_configuration_arn) );
    ]

let protect_configuration_id_or_arn_to_yojson = string_to_yojson

let update_protect_configuration_request_to_yojson (x : update_protect_configuration_request) =
  assoc_to_yojson
    [
      ( "DeletionProtectionEnabled",
        option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.boolean__to_yojson
          x.deletion_protection_enabled );
      ( "ProtectConfigurationId",
        Some (protect_configuration_id_or_arn_to_yojson x.protect_configuration_id) );
    ]

let number_capability_to_yojson (x : number_capability) =
  match x with
  | SMS -> `String "SMS"
  | VOICE -> `String "VOICE"
  | MMS -> `String "MMS"
  | RCS -> `String "RCS"

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

let update_protect_configuration_country_rule_set_result_to_yojson
    (x : update_protect_configuration_country_rule_set_result) =
  assoc_to_yojson
    [
      ("CountryRuleSet", Some (protect_configuration_country_rule_set_to_yojson x.country_rule_set));
      ("NumberCapability", Some (number_capability_to_yojson x.number_capability));
      ( "ProtectConfigurationId",
        Some (protect_configuration_id_to_yojson x.protect_configuration_id) );
      ( "ProtectConfigurationArn",
        Some (protect_configuration_arn_to_yojson x.protect_configuration_arn) );
    ]

let update_protect_configuration_country_rule_set_request_to_yojson
    (x : update_protect_configuration_country_rule_set_request) =
  assoc_to_yojson
    [
      ( "CountryRuleSetUpdates",
        Some (protect_configuration_country_rule_set_to_yojson x.country_rule_set_updates) );
      ("NumberCapability", Some (number_capability_to_yojson x.number_capability));
      ( "ProtectConfigurationId",
        Some (protect_configuration_id_or_arn_to_yojson x.protect_configuration_id) );
    ]

let pool_status_to_yojson (x : pool_status) =
  match x with
  | CREATING -> `String "CREATING"
  | ACTIVE -> `String "ACTIVE"
  | DELETING -> `String "DELETING"

let update_pool_result_to_yojson (x : update_pool_result) =
  assoc_to_yojson
    [
      ( "CreatedTimestamp",
        option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.timestamp_epoch_seconds_to_yojson
          x.created_timestamp );
      ( "DeletionProtectionEnabled",
        option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.primitive_boolean_to_yojson
          x.deletion_protection_enabled );
      ( "SharedRoutesEnabled",
        option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.primitive_boolean_to_yojson
          x.shared_routes_enabled );
      ("OptOutListName", option_to_yojson opt_out_list_name_to_yojson x.opt_out_list_name);
      ( "SelfManagedOptOutsEnabled",
        option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.primitive_boolean_to_yojson
          x.self_managed_opt_outs_enabled );
      ("TwoWayChannelRole", option_to_yojson iam_role_arn_to_yojson x.two_way_channel_role);
      ("TwoWayChannelArn", option_to_yojson two_way_channel_arn_to_yojson x.two_way_channel_arn);
      ( "TwoWayEnabled",
        option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.primitive_boolean_to_yojson
          x.two_way_enabled );
      ("MessageType", option_to_yojson message_type_to_yojson x.message_type);
      ("Status", option_to_yojson pool_status_to_yojson x.status);
      ("PoolId", option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.string__to_yojson x.pool_id);
      ( "PoolArn",
        option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.string__to_yojson x.pool_arn );
    ]

let pool_id_or_arn_to_yojson = string_to_yojson

let update_pool_request_to_yojson (x : update_pool_request) =
  assoc_to_yojson
    [
      ( "DeletionProtectionEnabled",
        option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.boolean__to_yojson
          x.deletion_protection_enabled );
      ( "SharedRoutesEnabled",
        option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.boolean__to_yojson
          x.shared_routes_enabled );
      ("OptOutListName", option_to_yojson opt_out_list_name_or_arn_to_yojson x.opt_out_list_name);
      ( "SelfManagedOptOutsEnabled",
        option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.boolean__to_yojson
          x.self_managed_opt_outs_enabled );
      ("TwoWayChannelRole", option_to_yojson iam_role_arn_to_yojson x.two_way_channel_role);
      ("TwoWayChannelArn", option_to_yojson two_way_channel_arn_to_yojson x.two_way_channel_arn);
      ( "TwoWayEnabled",
        option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.boolean__to_yojson x.two_way_enabled
      );
      ("PoolId", Some (pool_id_or_arn_to_yojson x.pool_id));
    ]

let number_status_to_yojson (x : number_status) =
  match x with
  | PENDING -> `String "PENDING"
  | ACTIVE -> `String "ACTIVE"
  | ASSOCIATING -> `String "ASSOCIATING"
  | DISASSOCIATING -> `String "DISASSOCIATING"
  | DELETED -> `String "DELETED"

let number_capability_list_to_yojson tree = list_to_yojson number_capability_to_yojson tree

let number_type_to_yojson (x : number_type) =
  match x with
  | SHORT_CODE -> `String "SHORT_CODE"
  | LONG_CODE -> `String "LONG_CODE"
  | TOLL_FREE -> `String "TOLL_FREE"
  | TEN_DLC -> `String "TEN_DLC"
  | SIMULATOR -> `String "SIMULATOR"

let update_phone_number_result_to_yojson (x : update_phone_number_result) =
  assoc_to_yojson
    [
      ( "CreatedTimestamp",
        option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.timestamp_epoch_seconds_to_yojson
          x.created_timestamp );
      ( "RegistrationId",
        option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.string__to_yojson x.registration_id
      );
      ( "DeletionProtectionEnabled",
        option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.primitive_boolean_to_yojson
          x.deletion_protection_enabled );
      ( "InternationalSendingEnabled",
        option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.primitive_boolean_to_yojson
          x.international_sending_enabled );
      ("OptOutListName", option_to_yojson opt_out_list_name_to_yojson x.opt_out_list_name);
      ( "SelfManagedOptOutsEnabled",
        option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.primitive_boolean_to_yojson
          x.self_managed_opt_outs_enabled );
      ("TwoWayChannelRole", option_to_yojson iam_role_arn_to_yojson x.two_way_channel_role);
      ("TwoWayChannelArn", option_to_yojson two_way_channel_arn_to_yojson x.two_way_channel_arn);
      ( "TwoWayEnabled",
        option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.primitive_boolean_to_yojson
          x.two_way_enabled );
      ( "MonthlyLeasingPrice",
        option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.string__to_yojson
          x.monthly_leasing_price );
      ("NumberType", option_to_yojson number_type_to_yojson x.number_type);
      ("NumberCapabilities", option_to_yojson number_capability_list_to_yojson x.number_capabilities);
      ("MessageType", option_to_yojson message_type_to_yojson x.message_type);
      ("IsoCountryCode", option_to_yojson iso_country_code_to_yojson x.iso_country_code);
      ("Status", option_to_yojson number_status_to_yojson x.status);
      ("PhoneNumber", option_to_yojson phone_number_to_yojson x.phone_number);
      ( "PhoneNumberId",
        option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.string__to_yojson x.phone_number_id
      );
      ( "PhoneNumberArn",
        option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.string__to_yojson x.phone_number_arn
      );
    ]

let phone_number_id_or_arn_to_yojson = string_to_yojson

let update_phone_number_request_to_yojson (x : update_phone_number_request) =
  assoc_to_yojson
    [
      ( "DeletionProtectionEnabled",
        option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.boolean__to_yojson
          x.deletion_protection_enabled );
      ( "InternationalSendingEnabled",
        option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.boolean__to_yojson
          x.international_sending_enabled );
      ("OptOutListName", option_to_yojson opt_out_list_name_or_arn_to_yojson x.opt_out_list_name);
      ( "SelfManagedOptOutsEnabled",
        option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.boolean__to_yojson
          x.self_managed_opt_outs_enabled );
      ("TwoWayChannelRole", option_to_yojson iam_role_arn_to_yojson x.two_way_channel_role);
      ("TwoWayChannelArn", option_to_yojson two_way_channel_arn_to_yojson x.two_way_channel_arn);
      ( "TwoWayEnabled",
        option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.boolean__to_yojson x.two_way_enabled
      );
      ("PhoneNumberId", Some (phone_number_id_or_arn_to_yojson x.phone_number_id));
    ]

let notify_configuration_arn_to_yojson = string_to_yojson
let notify_configuration_id_to_yojson = string_to_yojson
let notify_configuration_display_name_to_yojson = string_to_yojson

let notify_configuration_use_case_to_yojson (x : notify_configuration_use_case) =
  match x with CODE_VERIFICATION -> `String "CODE_VERIFICATION"

let notify_template_id_to_yojson = string_to_yojson
let iso_country_code_list_to_yojson tree = list_to_yojson iso_country_code_to_yojson tree
let notify_enabled_channels_list_to_yojson tree = list_to_yojson number_capability_to_yojson tree

let notify_configuration_tier_to_yojson (x : notify_configuration_tier) =
  match x with BASIC -> `String "BASIC" | ADVANCED -> `String "ADVANCED"

let tier_upgrade_status_to_yojson (x : tier_upgrade_status) =
  match x with
  | BASIC -> `String "BASIC"
  | PENDING_UPGRADE -> `String "PENDING_UPGRADE"
  | ADVANCED -> `String "ADVANCED"
  | REJECTED -> `String "REJECTED"

let notify_configuration_status_to_yojson (x : notify_configuration_status) =
  match x with
  | PENDING -> `String "PENDING"
  | ACTIVE -> `String "ACTIVE"
  | REJECTED -> `String "REJECTED"
  | REQUIRES_VERIFICATION -> `String "REQUIRES_VERIFICATION"

let update_notify_configuration_result_to_yojson (x : update_notify_configuration_result) =
  assoc_to_yojson
    [
      ( "CreatedTimestamp",
        Some
          (Smaws_Lib.Smithy_api.Json_serializers.timestamp_epoch_seconds_to_yojson
             x.created_timestamp) );
      ( "DeletionProtectionEnabled",
        Some
          (Smaws_Lib.Smithy_api.Json_serializers.primitive_boolean_to_yojson
             x.deletion_protection_enabled) );
      ( "RejectionReason",
        option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.string__to_yojson x.rejection_reason
      );
      ("Status", Some (notify_configuration_status_to_yojson x.status));
      ("TierUpgradeStatus", Some (tier_upgrade_status_to_yojson x.tier_upgrade_status));
      ("Tier", Some (notify_configuration_tier_to_yojson x.tier));
      ("EnabledChannels", Some (notify_enabled_channels_list_to_yojson x.enabled_channels));
      ("EnabledCountries", option_to_yojson iso_country_code_list_to_yojson x.enabled_countries);
      ("PoolId", option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.string__to_yojson x.pool_id);
      ("DefaultTemplateId", option_to_yojson notify_template_id_to_yojson x.default_template_id);
      ("UseCase", Some (notify_configuration_use_case_to_yojson x.use_case));
      ("DisplayName", Some (notify_configuration_display_name_to_yojson x.display_name));
      ("NotifyConfigurationId", Some (notify_configuration_id_to_yojson x.notify_configuration_id));
      ( "NotifyConfigurationArn",
        Some (notify_configuration_arn_to_yojson x.notify_configuration_arn) );
    ]

let notify_configuration_id_or_arn_to_yojson = string_to_yojson
let notify_pool_id_or_unset_to_yojson = string_to_yojson

let update_notify_configuration_request_to_yojson (x : update_notify_configuration_request) =
  assoc_to_yojson
    [
      ( "DeletionProtectionEnabled",
        option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.boolean__to_yojson
          x.deletion_protection_enabled );
      ("EnabledChannels", option_to_yojson notify_enabled_channels_list_to_yojson x.enabled_channels);
      ("EnabledCountries", option_to_yojson iso_country_code_list_to_yojson x.enabled_countries);
      ("PoolId", option_to_yojson notify_pool_id_or_unset_to_yojson x.pool_id);
      ("DefaultTemplateId", option_to_yojson notify_template_id_to_yojson x.default_template_id);
      ( "NotifyConfigurationId",
        Some (notify_configuration_id_or_arn_to_yojson x.notify_configuration_id) );
    ]

let configuration_set_name_to_yojson = string_to_yojson
let event_destination_name_to_yojson = string_to_yojson

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
let log_group_arn_to_yojson = string_to_yojson

let cloud_watch_logs_destination_to_yojson (x : cloud_watch_logs_destination) =
  assoc_to_yojson
    [
      ("LogGroupArn", Some (log_group_arn_to_yojson x.log_group_arn));
      ("IamRoleArn", Some (iam_role_arn_to_yojson x.iam_role_arn));
    ]

let delivery_stream_arn_to_yojson = string_to_yojson

let kinesis_firehose_destination_to_yojson (x : kinesis_firehose_destination) =
  assoc_to_yojson
    [
      ("DeliveryStreamArn", Some (delivery_stream_arn_to_yojson x.delivery_stream_arn));
      ("IamRoleArn", Some (iam_role_arn_to_yojson x.iam_role_arn));
    ]

let sns_topic_arn_to_yojson = string_to_yojson

let sns_destination_to_yojson (x : sns_destination) =
  assoc_to_yojson [ ("TopicArn", Some (sns_topic_arn_to_yojson x.topic_arn)) ]

let event_destination_to_yojson (x : event_destination) =
  assoc_to_yojson
    [
      ("SnsDestination", option_to_yojson sns_destination_to_yojson x.sns_destination);
      ( "KinesisFirehoseDestination",
        option_to_yojson kinesis_firehose_destination_to_yojson x.kinesis_firehose_destination );
      ( "CloudWatchLogsDestination",
        option_to_yojson cloud_watch_logs_destination_to_yojson x.cloud_watch_logs_destination );
      ("MatchingEventTypes", Some (event_type_list_to_yojson x.matching_event_types));
      ("Enabled", Some (Smaws_Lib.Smithy_api.Json_serializers.boolean__to_yojson x.enabled));
      ("EventDestinationName", Some (event_destination_name_to_yojson x.event_destination_name));
    ]

let update_event_destination_result_to_yojson (x : update_event_destination_result) =
  assoc_to_yojson
    [
      ("EventDestination", option_to_yojson event_destination_to_yojson x.event_destination);
      ( "ConfigurationSetName",
        option_to_yojson configuration_set_name_to_yojson x.configuration_set_name );
      ( "ConfigurationSetArn",
        option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.string__to_yojson
          x.configuration_set_arn );
    ]

let configuration_set_name_or_arn_to_yojson = string_to_yojson

let update_event_destination_request_to_yojson (x : update_event_destination_request) =
  assoc_to_yojson
    [
      ("SnsDestination", option_to_yojson sns_destination_to_yojson x.sns_destination);
      ( "KinesisFirehoseDestination",
        option_to_yojson kinesis_firehose_destination_to_yojson x.kinesis_firehose_destination );
      ( "CloudWatchLogsDestination",
        option_to_yojson cloud_watch_logs_destination_to_yojson x.cloud_watch_logs_destination );
      ("MatchingEventTypes", option_to_yojson event_type_list_to_yojson x.matching_event_types);
      ( "Enabled",
        option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.boolean__to_yojson x.enabled );
      ("EventDestinationName", Some (event_destination_name_to_yojson x.event_destination_name));
      ( "ConfigurationSetName",
        Some (configuration_set_name_or_arn_to_yojson x.configuration_set_name) );
    ]

let untag_resource_result_to_yojson = unit_to_yojson
let amazon_resource_name_to_yojson = string_to_yojson
let tag_key_to_yojson = string_to_yojson
let tag_key_list_to_yojson tree = list_to_yojson tag_key_to_yojson tree

let untag_resource_request_to_yojson (x : untag_resource_request) =
  assoc_to_yojson
    [
      ("TagKeys", Some (tag_key_list_to_yojson x.tag_keys));
      ("ResourceArn", Some (amazon_resource_name_to_yojson x.resource_arn));
    ]

let time_to_live_to_yojson = int_to_yojson
let text_value_to_yojson = string_to_yojson

let text_validation_to_yojson (x : text_validation) =
  assoc_to_yojson
    [
      ("Pattern", Some (Smaws_Lib.Smithy_api.Json_serializers.string__to_yojson x.pattern));
      ("MaxLength", Some (Smaws_Lib.Smithy_api.Json_serializers.integer_to_yojson x.max_length));
      ("MinLength", Some (Smaws_Lib.Smithy_api.Json_serializers.integer_to_yojson x.min_length));
    ]

let text_message_origination_identity_to_yojson = string_to_yojson
let text_message_body_to_yojson = string_to_yojson

let testing_agent_status_to_yojson (x : testing_agent_status) =
  match x with
  | CREATED -> `String "CREATED"
  | PENDING -> `String "PENDING"
  | ACTIVE -> `String "ACTIVE"

let testing_agent_information_to_yojson (x : testing_agent_information) =
  assoc_to_yojson
    [
      ( "RegistrationId",
        Some (Smaws_Lib.Smithy_api.Json_serializers.string__to_yojson x.registration_id) );
      ( "TestingAgentId",
        option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.string__to_yojson x.testing_agent_id
      );
      ("Status", Some (testing_agent_status_to_yojson x.status));
    ]

let template_variable_type_to_yojson (x : template_variable_type) =
  match x with
  | STRING -> `String "STRING"
  | INTEGER -> `String "INTEGER"
  | BOOLEAN -> `String "BOOLEAN"

let template_variable_source_to_yojson (x : template_variable_source) =
  match x with CUSTOMER -> `String "CUSTOMER" | SYSTEM -> `String "SYSTEM"

let template_variable_metadata_to_yojson (x : template_variable_metadata) =
  assoc_to_yojson
    [
      ("Source", option_to_yojson template_variable_source_to_yojson x.source);
      ("Sample", option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.string__to_yojson x.sample);
      ("Pattern", option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.string__to_yojson x.pattern);
      ( "DefaultValue",
        option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.string__to_yojson x.default_value );
      ( "MaxValue",
        option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.integer_to_yojson x.max_value );
      ( "MinValue",
        option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.integer_to_yojson x.min_value );
      ( "MaxLength",
        option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.integer_to_yojson x.max_length );
      ( "Description",
        option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.string__to_yojson x.description );
      ( "Required",
        Some (Smaws_Lib.Smithy_api.Json_serializers.primitive_boolean_to_yojson x.required) );
      ("Type", Some (template_variable_type_to_yojson x.type_));
    ]

let template_variables_map_to_yojson tree =
  map_to_yojson Smaws_Lib.Smithy_api.Json_serializers.string__to_yojson
    template_variable_metadata_to_yojson tree

let template_variable_value_to_yojson = string_to_yojson
let template_variable_name_to_yojson = string_to_yojson

let template_variable_substitution_map_to_yojson tree =
  map_to_yojson template_variable_name_to_yojson template_variable_value_to_yojson tree

let template_content_to_yojson = string_to_yojson
let tag_value_to_yojson = string_to_yojson
let tag_resource_result_to_yojson = unit_to_yojson

let tag_to_yojson (x : tag) =
  assoc_to_yojson
    [ ("Value", Some (tag_value_to_yojson x.value)); ("Key", Some (tag_key_to_yojson x.key)) ]

let non_empty_tag_list_to_yojson tree = list_to_yojson tag_to_yojson tree

let tag_resource_request_to_yojson (x : tag_resource_request) =
  assoc_to_yojson
    [
      ("Tags", Some (non_empty_tag_list_to_yojson x.tags));
      ("ResourceArn", Some (amazon_resource_name_to_yojson x.resource_arn));
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
      ("Reason", option_to_yojson service_quota_exceeded_exception_reason_to_yojson x.reason);
      ("Message", option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.string__to_yojson x.message);
    ]

let tag_list_to_yojson tree = list_to_yojson tag_to_yojson tree

let registration_association_behavior_to_yojson (x : registration_association_behavior) =
  match x with
  | ASSOCIATE_BEFORE_SUBMIT -> `String "ASSOCIATE_BEFORE_SUBMIT"
  | ASSOCIATE_ON_APPROVAL -> `String "ASSOCIATE_ON_APPROVAL"
  | ASSOCIATE_AFTER_COMPLETE -> `String "ASSOCIATE_AFTER_COMPLETE"

let registration_disassociation_behavior_to_yojson (x : registration_disassociation_behavior) =
  match x with
  | DISASSOCIATE_ALL_CLOSES_REGISTRATION -> `String "DISASSOCIATE_ALL_CLOSES_REGISTRATION"
  | DISASSOCIATE_ALL_ALLOWS_DELETE_REGISTRATION ->
      `String "DISASSOCIATE_ALL_ALLOWS_DELETE_REGISTRATION"
  | DELETE_REGISTRATION_DISASSOCIATES -> `String "DELETE_REGISTRATION_DISASSOCIATES"

let supported_association_to_yojson (x : supported_association) =
  assoc_to_yojson
    [
      ( "DisassociationBehavior",
        Some (registration_disassociation_behavior_to_yojson x.disassociation_behavior) );
      ( "AssociationBehavior",
        Some (registration_association_behavior_to_yojson x.association_behavior) );
      ("IsoCountryCode", option_to_yojson iso_country_code_to_yojson x.iso_country_code);
      ( "ResourceType",
        Some (Smaws_Lib.Smithy_api.Json_serializers.string__to_yojson x.resource_type) );
    ]

let supported_association_list_to_yojson tree = list_to_yojson supported_association_to_yojson tree
let registration_version_number_to_yojson = long_to_yojson

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

let registration_version_status_history_to_yojson (x : registration_version_status_history) =
  assoc_to_yojson
    [
      ( "ArchivedTimestamp",
        option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.timestamp_epoch_seconds_to_yojson
          x.archived_timestamp );
      ( "RevokedTimestamp",
        option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.timestamp_epoch_seconds_to_yojson
          x.revoked_timestamp );
      ( "DeniedTimestamp",
        option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.timestamp_epoch_seconds_to_yojson
          x.denied_timestamp );
      ( "DiscardedTimestamp",
        option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.timestamp_epoch_seconds_to_yojson
          x.discarded_timestamp );
      ( "ApprovedTimestamp",
        option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.timestamp_epoch_seconds_to_yojson
          x.approved_timestamp );
      ( "RequiresAuthenticationTimestamp",
        option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.timestamp_epoch_seconds_to_yojson
          x.requires_authentication_timestamp );
      ( "ReviewingTimestamp",
        option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.timestamp_epoch_seconds_to_yojson
          x.reviewing_timestamp );
      ( "AwsReviewingTimestamp",
        option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.timestamp_epoch_seconds_to_yojson
          x.aws_reviewing_timestamp );
      ( "SubmittedTimestamp",
        option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.timestamp_epoch_seconds_to_yojson
          x.submitted_timestamp );
      ( "DraftTimestamp",
        Some
          (Smaws_Lib.Smithy_api.Json_serializers.timestamp_epoch_seconds_to_yojson x.draft_timestamp)
      );
    ]

let submit_registration_version_result_to_yojson (x : submit_registration_version_result) =
  assoc_to_yojson
    [
      ( "AwsReview",
        Some (Smaws_Lib.Smithy_api.Json_serializers.primitive_boolean_to_yojson x.aws_review) );
      ( "RegistrationVersionStatusHistory",
        Some (registration_version_status_history_to_yojson x.registration_version_status_history)
      );
      ( "RegistrationVersionStatus",
        Some (registration_version_status_to_yojson x.registration_version_status) );
      ("VersionNumber", Some (registration_version_number_to_yojson x.version_number));
      ( "RegistrationId",
        Some (Smaws_Lib.Smithy_api.Json_serializers.string__to_yojson x.registration_id) );
      ( "RegistrationArn",
        Some (Smaws_Lib.Smithy_api.Json_serializers.string__to_yojson x.registration_arn) );
    ]

let registration_id_or_arn_to_yojson = string_to_yojson

let submit_registration_version_request_to_yojson (x : submit_registration_version_request) =
  assoc_to_yojson
    [
      ( "AwsReview",
        option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.primitive_boolean_to_yojson
          x.aws_review );
      ("RegistrationId", Some (registration_id_or_arn_to_yojson x.registration_id));
    ]

let string_map_to_yojson tree =
  map_to_yojson Smaws_Lib.Smithy_api.Json_serializers.string__to_yojson
    Smaws_Lib.Smithy_api.Json_serializers.string__to_yojson tree

let string_list_to_yojson tree =
  list_to_yojson Smaws_Lib.Smithy_api.Json_serializers.string__to_yojson tree

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
      ( "Overridden",
        Some (Smaws_Lib.Smithy_api.Json_serializers.primitive_boolean_to_yojson x.overridden) );
      ("MaxLimit", Some (Smaws_Lib.Smithy_api.Json_serializers.primitive_long_to_yojson x.max_limit));
      ( "EnforcedLimit",
        Some (Smaws_Lib.Smithy_api.Json_serializers.primitive_long_to_yojson x.enforced_limit) );
      ("Name", Some (spend_limit_name_to_yojson x.name));
    ]

let spend_limit_list_to_yojson tree = list_to_yojson spend_limit_to_yojson tree
let monthly_limit_to_yojson = long_to_yojson

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
      ("SenderId", option_to_yojson sender_id_to_yojson x.sender_id);
      ( "ConfigurationSetName",
        option_to_yojson configuration_set_name_to_yojson x.configuration_set_name );
      ( "ConfigurationSetArn",
        option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.string__to_yojson
          x.configuration_set_arn );
    ]

let set_default_sender_id_request_to_yojson (x : set_default_sender_id_request) =
  assoc_to_yojson
    [
      ("SenderId", Some (sender_id_to_yojson x.sender_id));
      ( "ConfigurationSetName",
        Some (configuration_set_name_or_arn_to_yojson x.configuration_set_name) );
    ]

let set_default_message_type_result_to_yojson (x : set_default_message_type_result) =
  assoc_to_yojson
    [
      ("MessageType", option_to_yojson message_type_to_yojson x.message_type);
      ( "ConfigurationSetName",
        option_to_yojson configuration_set_name_to_yojson x.configuration_set_name );
      ( "ConfigurationSetArn",
        option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.string__to_yojson
          x.configuration_set_arn );
    ]

let set_default_message_type_request_to_yojson (x : set_default_message_type_request) =
  assoc_to_yojson
    [
      ("MessageType", Some (message_type_to_yojson x.message_type));
      ( "ConfigurationSetName",
        Some (configuration_set_name_or_arn_to_yojson x.configuration_set_name) );
    ]

let set_default_message_feedback_enabled_result_to_yojson
    (x : set_default_message_feedback_enabled_result) =
  assoc_to_yojson
    [
      ( "MessageFeedbackEnabled",
        option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.boolean__to_yojson
          x.message_feedback_enabled );
      ( "ConfigurationSetName",
        option_to_yojson configuration_set_name_to_yojson x.configuration_set_name );
      ( "ConfigurationSetArn",
        option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.string__to_yojson
          x.configuration_set_arn );
    ]

let set_default_message_feedback_enabled_request_to_yojson
    (x : set_default_message_feedback_enabled_request) =
  assoc_to_yojson
    [
      ( "MessageFeedbackEnabled",
        Some (Smaws_Lib.Smithy_api.Json_serializers.boolean__to_yojson x.message_feedback_enabled)
      );
      ( "ConfigurationSetName",
        Some (configuration_set_name_or_arn_to_yojson x.configuration_set_name) );
    ]

let set_account_default_protect_configuration_result_to_yojson
    (x : set_account_default_protect_configuration_result) =
  assoc_to_yojson
    [
      ( "DefaultProtectConfigurationId",
        Some (protect_configuration_id_to_yojson x.default_protect_configuration_id) );
      ( "DefaultProtectConfigurationArn",
        Some (protect_configuration_arn_to_yojson x.default_protect_configuration_arn) );
    ]

let set_account_default_protect_configuration_request_to_yojson
    (x : set_account_default_protect_configuration_request) =
  assoc_to_yojson
    [
      ( "ProtectConfigurationId",
        Some (protect_configuration_id_or_arn_to_yojson x.protect_configuration_id) );
    ]

let sender_id_and_country_to_yojson (x : sender_id_and_country) =
  assoc_to_yojson
    [
      ("IsoCountryCode", Some (iso_country_code_to_yojson x.iso_country_code));
      ("SenderId", Some (sender_id_or_arn_to_yojson x.sender_id));
    ]

let sender_id_list_to_yojson tree = list_to_yojson sender_id_and_country_to_yojson tree

let sender_id_information_to_yojson (x : sender_id_information) =
  assoc_to_yojson
    [
      ( "RegistrationId",
        option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.string__to_yojson x.registration_id
      );
      ( "Registered",
        Some (Smaws_Lib.Smithy_api.Json_serializers.primitive_boolean_to_yojson x.registered) );
      ( "DeletionProtectionEnabled",
        Some
          (Smaws_Lib.Smithy_api.Json_serializers.primitive_boolean_to_yojson
             x.deletion_protection_enabled) );
      ( "MonthlyLeasingPrice",
        Some (Smaws_Lib.Smithy_api.Json_serializers.string__to_yojson x.monthly_leasing_price) );
      ("MessageTypes", Some (message_type_list_to_yojson x.message_types));
      ("IsoCountryCode", Some (iso_country_code_to_yojson x.iso_country_code));
      ("SenderId", Some (sender_id_to_yojson x.sender_id));
      ("SenderIdArn", Some (Smaws_Lib.Smithy_api.Json_serializers.string__to_yojson x.sender_id_arn));
    ]

let sender_id_information_list_to_yojson tree = list_to_yojson sender_id_information_to_yojson tree

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
      ("Values", Some (filter_value_list_to_yojson x.values));
      ("Name", Some (sender_id_filter_name_to_yojson x.name));
    ]

let sender_id_filter_list_to_yojson tree = list_to_yojson sender_id_filter_to_yojson tree

let send_voice_message_result_to_yojson (x : send_voice_message_result) =
  assoc_to_yojson
    [
      ( "MessageId",
        option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.string__to_yojson x.message_id );
    ]

let max_price_to_yojson = string_to_yojson
let context_value_to_yojson = string_to_yojson
let context_key_to_yojson = string_to_yojson
let context_map_to_yojson tree = map_to_yojson context_key_to_yojson context_value_to_yojson tree

let send_voice_message_request_to_yojson (x : send_voice_message_request) =
  assoc_to_yojson
    [
      ( "MessageFeedbackEnabled",
        option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.boolean__to_yojson
          x.message_feedback_enabled );
      ( "ProtectConfigurationId",
        option_to_yojson protect_configuration_id_or_arn_to_yojson x.protect_configuration_id );
      ( "DryRun",
        option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.primitive_boolean_to_yojson x.dry_run
      );
      ("Context", option_to_yojson context_map_to_yojson x.context);
      ("TimeToLive", option_to_yojson time_to_live_to_yojson x.time_to_live);
      ("MaxPricePerMinute", option_to_yojson max_price_to_yojson x.max_price_per_minute);
      ( "ConfigurationSetName",
        option_to_yojson configuration_set_name_or_arn_to_yojson x.configuration_set_name );
      ("VoiceId", option_to_yojson voice_id_to_yojson x.voice_id);
      ( "MessageBodyTextType",
        option_to_yojson voice_message_body_text_type_to_yojson x.message_body_text_type );
      ("MessageBody", option_to_yojson voice_message_body_to_yojson x.message_body);
      ( "OriginationIdentity",
        Some (voice_message_origination_identity_to_yojson x.origination_identity) );
      ("DestinationPhoneNumber", Some (phone_number_to_yojson x.destination_phone_number));
    ]

let send_text_message_result_to_yojson (x : send_text_message_result) =
  assoc_to_yojson
    [
      ( "MessageId",
        option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.string__to_yojson x.message_id );
    ]

let keyword_to_yojson = string_to_yojson
let destination_country_parameter_value_to_yojson = string_to_yojson

let destination_country_parameter_key_to_yojson (x : destination_country_parameter_key) =
  match x with IN_TEMPLATE_ID -> `String "IN_TEMPLATE_ID" | IN_ENTITY_ID -> `String "IN_ENTITY_ID"

let destination_country_parameters_to_yojson tree =
  map_to_yojson destination_country_parameter_key_to_yojson
    destination_country_parameter_value_to_yojson tree

let send_text_message_request_to_yojson (x : send_text_message_request) =
  assoc_to_yojson
    [
      ( "MessageFeedbackEnabled",
        option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.boolean__to_yojson
          x.message_feedback_enabled );
      ( "ProtectConfigurationId",
        option_to_yojson protect_configuration_id_or_arn_to_yojson x.protect_configuration_id );
      ( "DryRun",
        option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.primitive_boolean_to_yojson x.dry_run
      );
      ( "DestinationCountryParameters",
        option_to_yojson destination_country_parameters_to_yojson x.destination_country_parameters
      );
      ("Context", option_to_yojson context_map_to_yojson x.context);
      ("TimeToLive", option_to_yojson time_to_live_to_yojson x.time_to_live);
      ("MaxPrice", option_to_yojson max_price_to_yojson x.max_price);
      ( "ConfigurationSetName",
        option_to_yojson configuration_set_name_or_arn_to_yojson x.configuration_set_name );
      ("Keyword", option_to_yojson keyword_to_yojson x.keyword);
      ("MessageType", option_to_yojson message_type_to_yojson x.message_type);
      ("MessageBody", option_to_yojson text_message_body_to_yojson x.message_body);
      ( "OriginationIdentity",
        option_to_yojson text_message_origination_identity_to_yojson x.origination_identity );
      ("DestinationPhoneNumber", Some (phone_number_to_yojson x.destination_phone_number));
    ]

let send_rcs_message_result_to_yojson (x : send_rcs_message_result) =
  assoc_to_yojson
    [
      ( "MessageId",
        option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.string__to_yojson x.message_id );
    ]

let rcs_message_origination_identity_to_yojson = string_to_yojson
let rcs_text_body_to_yojson = string_to_yojson

let rcs_text_message_to_yojson (x : rcs_text_message) =
  assoc_to_yojson [ ("Body", Some (rcs_text_body_to_yojson x.body)) ]

let rcs_media_url_to_yojson = string_to_yojson

let rcs_file_message_to_yojson (x : rcs_file_message) =
  assoc_to_yojson
    [
      ("ThumbnailUrl", option_to_yojson rcs_media_url_to_yojson x.thumbnail_url);
      ("FileUrl", Some (rcs_media_url_to_yojson x.file_url));
    ]

let rcs_card_title_to_yojson = string_to_yojson
let rcs_card_description_to_yojson = string_to_yojson

let rcs_card_media_to_yojson (x : rcs_card_media) =
  assoc_to_yojson
    [
      ("Height", option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.string__to_yojson x.height);
      ("ThumbnailUrl", option_to_yojson rcs_media_url_to_yojson x.thumbnail_url);
      ("FileUrl", Some (rcs_media_url_to_yojson x.file_url));
    ]

let rcs_suggested_action_text_to_yojson = string_to_yojson
let rcs_postback_data_to_yojson = string_to_yojson

let rcs_reply_action_to_yojson (x : rcs_reply_action) =
  assoc_to_yojson
    [
      ("PostbackData", Some (rcs_postback_data_to_yojson x.postback_data));
      ("Text", Some (rcs_suggested_action_text_to_yojson x.text));
    ]

let rcs_open_url_value_to_yojson = string_to_yojson

let rcs_open_url_action_to_yojson (x : rcs_open_url_action) =
  assoc_to_yojson
    [
      ( "WebviewViewMode",
        option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.string__to_yojson x.webview_view_mode
      );
      ( "Application",
        option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.string__to_yojson x.application );
      ("Url", Some (rcs_open_url_value_to_yojson x.url));
      ("PostbackData", Some (rcs_postback_data_to_yojson x.postback_data));
      ("Text", Some (rcs_suggested_action_text_to_yojson x.text));
    ]

let rcs_dial_phone_action_to_yojson (x : rcs_dial_phone_action) =
  assoc_to_yojson
    [
      ("PhoneNumber", Some (phone_number_to_yojson x.phone_number));
      ("PostbackData", Some (rcs_postback_data_to_yojson x.postback_data));
      ("Text", Some (rcs_suggested_action_text_to_yojson x.text));
    ]

let rcs_location_label_to_yojson = string_to_yojson

let rcs_show_location_action_to_yojson (x : rcs_show_location_action) =
  assoc_to_yojson
    [
      ("Label", option_to_yojson rcs_location_label_to_yojson x.label);
      ("Longitude", Some (Smaws_Lib.Smithy_api.Json_serializers.double_to_yojson x.longitude));
      ("Latitude", Some (Smaws_Lib.Smithy_api.Json_serializers.double_to_yojson x.latitude));
      ("PostbackData", Some (rcs_postback_data_to_yojson x.postback_data));
      ("Text", Some (rcs_suggested_action_text_to_yojson x.text));
    ]

let rcs_request_location_action_to_yojson (x : rcs_request_location_action) =
  assoc_to_yojson
    [
      ("PostbackData", Some (rcs_postback_data_to_yojson x.postback_data));
      ("Text", Some (rcs_suggested_action_text_to_yojson x.text));
    ]

let rcs_calendar_event_title_to_yojson = string_to_yojson
let rcs_calendar_event_description_to_yojson = string_to_yojson

let rcs_create_calendar_event_action_to_yojson (x : rcs_create_calendar_event_action) =
  assoc_to_yojson
    [
      ("Description", option_to_yojson rcs_calendar_event_description_to_yojson x.description);
      ( "EndTime",
        Some (Smaws_Lib.Smithy_api.Json_serializers.timestamp_epoch_seconds_to_yojson x.end_time) );
      ( "StartTime",
        Some (Smaws_Lib.Smithy_api.Json_serializers.timestamp_epoch_seconds_to_yojson x.start_time)
      );
      ("Title", Some (rcs_calendar_event_title_to_yojson x.title));
      ("PostbackData", Some (rcs_postback_data_to_yojson x.postback_data));
      ("Text", Some (rcs_suggested_action_text_to_yojson x.text));
    ]

let rcs_suggested_action_to_yojson (x : rcs_suggested_action) =
  match x with
  | CreateCalendarEvent arg ->
      assoc_to_yojson
        [ ("CreateCalendarEvent", Some (rcs_create_calendar_event_action_to_yojson arg)) ]
  | RequestLocation arg ->
      assoc_to_yojson [ ("RequestLocation", Some (rcs_request_location_action_to_yojson arg)) ]
  | ShowLocation arg ->
      assoc_to_yojson [ ("ShowLocation", Some (rcs_show_location_action_to_yojson arg)) ]
  | DialPhone arg -> assoc_to_yojson [ ("DialPhone", Some (rcs_dial_phone_action_to_yojson arg)) ]
  | OpenUrl arg -> assoc_to_yojson [ ("OpenUrl", Some (rcs_open_url_action_to_yojson arg)) ]
  | Reply arg -> assoc_to_yojson [ ("Reply", Some (rcs_reply_action_to_yojson arg)) ]

let rcs_card_suggested_action_list_to_yojson tree =
  list_to_yojson rcs_suggested_action_to_yojson tree

let rcs_card_content_to_yojson (x : rcs_card_content) =
  assoc_to_yojson
    [
      ("Suggestions", option_to_yojson rcs_card_suggested_action_list_to_yojson x.suggestions);
      ("Media", option_to_yojson rcs_card_media_to_yojson x.media);
      ("Description", option_to_yojson rcs_card_description_to_yojson x.description);
      ("Title", option_to_yojson rcs_card_title_to_yojson x.title);
    ]

let rcs_standalone_card_to_yojson (x : rcs_standalone_card) =
  assoc_to_yojson
    [
      ("CardContent", Some (rcs_card_content_to_yojson x.card_content));
      ( "ThumbnailImageAlignment",
        option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.string__to_yojson
          x.thumbnail_image_alignment );
      ( "CardOrientation",
        Some (Smaws_Lib.Smithy_api.Json_serializers.string__to_yojson x.card_orientation) );
    ]

let rcs_carousel_card_media_to_yojson (x : rcs_carousel_card_media) =
  assoc_to_yojson
    [
      ("Height", option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.string__to_yojson x.height);
      ("ThumbnailUrl", option_to_yojson rcs_media_url_to_yojson x.thumbnail_url);
      ("FileUrl", Some (rcs_media_url_to_yojson x.file_url));
    ]

let rcs_carousel_card_content_to_yojson (x : rcs_carousel_card_content) =
  assoc_to_yojson
    [
      ("Suggestions", option_to_yojson rcs_card_suggested_action_list_to_yojson x.suggestions);
      ("Media", option_to_yojson rcs_carousel_card_media_to_yojson x.media);
      ("Description", option_to_yojson rcs_card_description_to_yojson x.description);
      ("Title", option_to_yojson rcs_card_title_to_yojson x.title);
    ]

let rcs_carousel_card_content_list_to_yojson tree =
  list_to_yojson rcs_carousel_card_content_to_yojson tree

let rcs_carousel_to_yojson (x : rcs_carousel) =
  assoc_to_yojson
    [
      ("CardContents", Some (rcs_carousel_card_content_list_to_yojson x.card_contents));
      ("CardWidth", Some (Smaws_Lib.Smithy_api.Json_serializers.string__to_yojson x.card_width));
    ]

let rcs_content_to_yojson (x : rcs_content) =
  match x with
  | Carousel arg -> assoc_to_yojson [ ("Carousel", Some (rcs_carousel_to_yojson arg)) ]
  | RichCard arg -> assoc_to_yojson [ ("RichCard", Some (rcs_standalone_card_to_yojson arg)) ]
  | FileMessage arg -> assoc_to_yojson [ ("FileMessage", Some (rcs_file_message_to_yojson arg)) ]
  | TextMessage arg -> assoc_to_yojson [ ("TextMessage", Some (rcs_text_message_to_yojson arg)) ]

let rcs_suggested_action_list_to_yojson tree = list_to_yojson rcs_suggested_action_to_yojson tree

let rcs_message_content_to_yojson (x : rcs_message_content) =
  assoc_to_yojson
    [
      ("Suggestions", option_to_yojson rcs_suggested_action_list_to_yojson x.suggestions);
      ("Content", Some (rcs_content_to_yojson x.content));
    ]

let rcs_time_to_live_to_yojson = int_to_yojson
let rcs_message_traffic_type_to_yojson = string_to_yojson

let rcs_fallback_channel_to_yojson (x : rcs_fallback_channel) =
  match x with SMS -> `String "SMS" | MMS -> `String "MMS"

let rcs_fallback_message_body_to_yojson = string_to_yojson
let media_url_value_to_yojson = string_to_yojson
let media_url_list_to_yojson tree = list_to_yojson media_url_value_to_yojson tree
let rcs_fallback_origination_identity_to_yojson = string_to_yojson

let rcs_fallback_configuration_to_yojson (x : rcs_fallback_configuration) =
  assoc_to_yojson
    [
      ( "OriginationIdentity",
        option_to_yojson rcs_fallback_origination_identity_to_yojson x.origination_identity );
      ("MediaUrls", option_to_yojson media_url_list_to_yojson x.media_urls);
      ("MessageBody", option_to_yojson rcs_fallback_message_body_to_yojson x.message_body);
      ("Channel", Some (rcs_fallback_channel_to_yojson x.channel));
    ]

let send_rcs_message_request_to_yojson (x : send_rcs_message_request) =
  assoc_to_yojson
    [
      ( "MessageFeedbackEnabled",
        option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.boolean__to_yojson
          x.message_feedback_enabled );
      ("Context", option_to_yojson context_map_to_yojson x.context);
      ( "DryRun",
        option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.primitive_boolean_to_yojson x.dry_run
      );
      ("MaxPrice", option_to_yojson max_price_to_yojson x.max_price);
      ( "ConfigurationSetName",
        option_to_yojson configuration_set_name_or_arn_to_yojson x.configuration_set_name );
      ( "ProtectConfigurationId",
        option_to_yojson protect_configuration_id_or_arn_to_yojson x.protect_configuration_id );
      ( "FallbackConfiguration",
        option_to_yojson rcs_fallback_configuration_to_yojson x.fallback_configuration );
      ( "MessageTrafficType",
        option_to_yojson rcs_message_traffic_type_to_yojson x.message_traffic_type );
      ("TimeToLive", option_to_yojson rcs_time_to_live_to_yojson x.time_to_live);
      ("RcsMessageContent", option_to_yojson rcs_message_content_to_yojson x.rcs_message_content);
      ( "OriginationIdentity",
        Some (rcs_message_origination_identity_to_yojson x.origination_identity) );
      ("DestinationPhoneNumber", Some (phone_number_to_yojson x.destination_phone_number));
    ]

let send_notify_voice_message_result_to_yojson (x : send_notify_voice_message_result) =
  assoc_to_yojson
    [
      ( "ResolvedMessageBody",
        option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.string__to_yojson
          x.resolved_message_body );
      ("TemplateId", option_to_yojson notify_template_id_to_yojson x.template_id);
      ( "MessageId",
        option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.string__to_yojson x.message_id );
    ]

let send_notify_voice_message_request_to_yojson (x : send_notify_voice_message_request) =
  assoc_to_yojson
    [
      ( "MessageFeedbackEnabled",
        option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.boolean__to_yojson
          x.message_feedback_enabled );
      ( "DryRun",
        option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.primitive_boolean_to_yojson x.dry_run
      );
      ( "ConfigurationSetName",
        option_to_yojson configuration_set_name_or_arn_to_yojson x.configuration_set_name );
      ("Context", option_to_yojson context_map_to_yojson x.context);
      ("TimeToLive", option_to_yojson time_to_live_to_yojson x.time_to_live);
      ("VoiceId", option_to_yojson voice_id_to_yojson x.voice_id);
      ("TemplateVariables", Some (template_variable_substitution_map_to_yojson x.template_variables));
      ("TemplateId", option_to_yojson notify_template_id_to_yojson x.template_id);
      ("DestinationPhoneNumber", Some (phone_number_to_yojson x.destination_phone_number));
      ( "NotifyConfigurationId",
        Some (notify_configuration_id_or_arn_to_yojson x.notify_configuration_id) );
    ]

let send_notify_text_message_result_to_yojson (x : send_notify_text_message_result) =
  assoc_to_yojson
    [
      ( "ResolvedMessageBody",
        option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.string__to_yojson
          x.resolved_message_body );
      ("TemplateId", option_to_yojson notify_template_id_to_yojson x.template_id);
      ( "MessageId",
        option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.string__to_yojson x.message_id );
    ]

let send_notify_text_message_request_to_yojson (x : send_notify_text_message_request) =
  assoc_to_yojson
    [
      ( "MessageFeedbackEnabled",
        option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.boolean__to_yojson
          x.message_feedback_enabled );
      ( "DryRun",
        option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.primitive_boolean_to_yojson x.dry_run
      );
      ( "ConfigurationSetName",
        option_to_yojson configuration_set_name_or_arn_to_yojson x.configuration_set_name );
      ("Context", option_to_yojson context_map_to_yojson x.context);
      ("TimeToLive", option_to_yojson time_to_live_to_yojson x.time_to_live);
      ("TemplateVariables", Some (template_variable_substitution_map_to_yojson x.template_variables));
      ("TemplateId", option_to_yojson notify_template_id_to_yojson x.template_id);
      ("DestinationPhoneNumber", Some (phone_number_to_yojson x.destination_phone_number));
      ( "NotifyConfigurationId",
        Some (notify_configuration_id_or_arn_to_yojson x.notify_configuration_id) );
    ]

let send_media_message_result_to_yojson (x : send_media_message_result) =
  assoc_to_yojson
    [
      ( "MessageId",
        option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.string__to_yojson x.message_id );
    ]

let media_message_origination_identity_to_yojson = string_to_yojson

let send_media_message_request_to_yojson (x : send_media_message_request) =
  assoc_to_yojson
    [
      ( "MessageFeedbackEnabled",
        option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.boolean__to_yojson
          x.message_feedback_enabled );
      ( "ProtectConfigurationId",
        option_to_yojson protect_configuration_id_or_arn_to_yojson x.protect_configuration_id );
      ( "DryRun",
        option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.primitive_boolean_to_yojson x.dry_run
      );
      ("Context", option_to_yojson context_map_to_yojson x.context);
      ("TimeToLive", option_to_yojson time_to_live_to_yojson x.time_to_live);
      ("MaxPrice", option_to_yojson max_price_to_yojson x.max_price);
      ( "ConfigurationSetName",
        option_to_yojson configuration_set_name_or_arn_to_yojson x.configuration_set_name );
      ("MediaUrls", option_to_yojson media_url_list_to_yojson x.media_urls);
      ("MessageBody", option_to_yojson text_message_body_to_yojson x.message_body);
      ( "OriginationIdentity",
        Some (media_message_origination_identity_to_yojson x.origination_identity) );
      ("DestinationPhoneNumber", Some (phone_number_to_yojson x.destination_phone_number));
    ]

let send_destination_number_verification_code_result_to_yojson
    (x : send_destination_number_verification_code_result) =
  assoc_to_yojson
    [ ("MessageId", Some (Smaws_Lib.Smithy_api.Json_serializers.string__to_yojson x.message_id)) ]

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

let send_destination_number_verification_code_request_to_yojson
    (x : send_destination_number_verification_code_request) =
  assoc_to_yojson
    [
      ( "DestinationCountryParameters",
        option_to_yojson destination_country_parameters_to_yojson x.destination_country_parameters
      );
      ("Context", option_to_yojson context_map_to_yojson x.context);
      ( "ConfigurationSetName",
        option_to_yojson configuration_set_name_or_arn_to_yojson x.configuration_set_name );
      ( "OriginationIdentity",
        option_to_yojson verification_message_origination_identity_to_yojson x.origination_identity
      );
      ("LanguageCode", option_to_yojson language_code_to_yojson x.language_code);
      ("VerificationChannel", Some (verification_channel_to_yojson x.verification_channel));
      ( "VerifiedDestinationNumberId",
        Some (verified_destination_number_id_or_arn_to_yojson x.verified_destination_number_id) );
    ]

let select_validation_to_yojson (x : select_validation) =
  assoc_to_yojson
    [
      ("Options", Some (string_list_to_yojson x.options));
      ("MaxChoices", Some (Smaws_Lib.Smithy_api.Json_serializers.integer_to_yojson x.max_choices));
      ("MinChoices", Some (Smaws_Lib.Smithy_api.Json_serializers.integer_to_yojson x.min_choices));
    ]

let select_option_description_to_yojson (x : select_option_description) =
  assoc_to_yojson
    [
      ( "Description",
        option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.string__to_yojson x.description );
      ("Title", option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.string__to_yojson x.title);
      ("Option", Some (Smaws_Lib.Smithy_api.Json_serializers.string__to_yojson x.option_));
    ]

let select_option_descriptions_list_to_yojson tree =
  list_to_yojson select_option_description_to_yojson tree

let select_choice_to_yojson = string_to_yojson
let select_choice_list_to_yojson tree = list_to_yojson select_choice_to_yojson tree
let section_path_to_yojson = string_to_yojson
let section_path_list_to_yojson tree = list_to_yojson section_path_to_yojson tree
let resource_policy_to_yojson = string_to_yojson
let resource_id_or_arn_to_yojson = string_to_yojson

let requestable_number_type_to_yojson (x : requestable_number_type) =
  match x with
  | LONG_CODE -> `String "LONG_CODE"
  | TOLL_FREE -> `String "TOLL_FREE"
  | TEN_DLC -> `String "TEN_DLC"
  | SIMULATOR -> `String "SIMULATOR"

let request_sender_id_result_to_yojson (x : request_sender_id_result) =
  assoc_to_yojson
    [
      ("Tags", option_to_yojson tag_list_to_yojson x.tags);
      ( "Registered",
        Some (Smaws_Lib.Smithy_api.Json_serializers.primitive_boolean_to_yojson x.registered) );
      ( "DeletionProtectionEnabled",
        Some
          (Smaws_Lib.Smithy_api.Json_serializers.primitive_boolean_to_yojson
             x.deletion_protection_enabled) );
      ( "MonthlyLeasingPrice",
        Some (Smaws_Lib.Smithy_api.Json_serializers.string__to_yojson x.monthly_leasing_price) );
      ("MessageTypes", Some (message_type_list_to_yojson x.message_types));
      ("IsoCountryCode", Some (iso_country_code_to_yojson x.iso_country_code));
      ("SenderId", Some (sender_id_to_yojson x.sender_id));
      ("SenderIdArn", Some (Smaws_Lib.Smithy_api.Json_serializers.string__to_yojson x.sender_id_arn));
    ]

let client_token_to_yojson = string_to_yojson

let request_sender_id_request_to_yojson (x : request_sender_id_request) =
  assoc_to_yojson
    [
      ( "ClientToken",
        Some
          (client_token_to_yojson
             (Option.value x.client_token ~default:(Smaws_Lib.Uuid.generate ()))) );
      ("Tags", option_to_yojson tag_list_to_yojson x.tags);
      ( "DeletionProtectionEnabled",
        option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.boolean__to_yojson
          x.deletion_protection_enabled );
      ("MessageTypes", option_to_yojson message_type_list_to_yojson x.message_types);
      ("IsoCountryCode", Some (iso_country_code_to_yojson x.iso_country_code));
      ("SenderId", Some (sender_id_to_yojson x.sender_id));
    ]

let request_phone_number_result_to_yojson (x : request_phone_number_result) =
  assoc_to_yojson
    [
      ( "CreatedTimestamp",
        option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.timestamp_epoch_seconds_to_yojson
          x.created_timestamp );
      ("Tags", option_to_yojson tag_list_to_yojson x.tags);
      ( "RegistrationId",
        option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.string__to_yojson x.registration_id
      );
      ("PoolId", option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.string__to_yojson x.pool_id);
      ( "DeletionProtectionEnabled",
        option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.primitive_boolean_to_yojson
          x.deletion_protection_enabled );
      ( "InternationalSendingEnabled",
        option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.primitive_boolean_to_yojson
          x.international_sending_enabled );
      ("OptOutListName", option_to_yojson opt_out_list_name_to_yojson x.opt_out_list_name);
      ( "SelfManagedOptOutsEnabled",
        option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.primitive_boolean_to_yojson
          x.self_managed_opt_outs_enabled );
      ("TwoWayChannelRole", option_to_yojson iam_role_arn_to_yojson x.two_way_channel_role);
      ("TwoWayChannelArn", option_to_yojson two_way_channel_arn_to_yojson x.two_way_channel_arn);
      ( "TwoWayEnabled",
        option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.primitive_boolean_to_yojson
          x.two_way_enabled );
      ( "MonthlyLeasingPrice",
        option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.string__to_yojson
          x.monthly_leasing_price );
      ("NumberType", option_to_yojson requestable_number_type_to_yojson x.number_type);
      ("NumberCapabilities", option_to_yojson number_capability_list_to_yojson x.number_capabilities);
      ("MessageType", option_to_yojson message_type_to_yojson x.message_type);
      ("IsoCountryCode", option_to_yojson iso_country_code_to_yojson x.iso_country_code);
      ("Status", option_to_yojson number_status_to_yojson x.status);
      ("PhoneNumber", option_to_yojson phone_number_to_yojson x.phone_number);
      ( "PhoneNumberId",
        option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.string__to_yojson x.phone_number_id
      );
      ( "PhoneNumberArn",
        option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.string__to_yojson x.phone_number_arn
      );
    ]

let request_phone_number_request_to_yojson (x : request_phone_number_request) =
  assoc_to_yojson
    [
      ( "ClientToken",
        Some
          (client_token_to_yojson
             (Option.value x.client_token ~default:(Smaws_Lib.Uuid.generate ()))) );
      ("Tags", option_to_yojson tag_list_to_yojson x.tags);
      ( "DeletionProtectionEnabled",
        option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.boolean__to_yojson
          x.deletion_protection_enabled );
      ( "InternationalSendingEnabled",
        option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.boolean__to_yojson
          x.international_sending_enabled );
      ("RegistrationId", option_to_yojson registration_id_or_arn_to_yojson x.registration_id);
      ("PoolId", option_to_yojson pool_id_or_arn_to_yojson x.pool_id);
      ("OptOutListName", option_to_yojson opt_out_list_name_or_arn_to_yojson x.opt_out_list_name);
      ("NumberType", Some (requestable_number_type_to_yojson x.number_type));
      ("NumberCapabilities", Some (number_capability_list_to_yojson x.number_capabilities));
      ("MessageType", Some (message_type_to_yojson x.message_type));
      ("IsoCountryCode", Some (iso_country_code_to_yojson x.iso_country_code));
    ]

let release_sender_id_result_to_yojson (x : release_sender_id_result) =
  assoc_to_yojson
    [
      ( "RegistrationId",
        option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.string__to_yojson x.registration_id
      );
      ( "Registered",
        Some (Smaws_Lib.Smithy_api.Json_serializers.primitive_boolean_to_yojson x.registered) );
      ( "MonthlyLeasingPrice",
        Some (Smaws_Lib.Smithy_api.Json_serializers.string__to_yojson x.monthly_leasing_price) );
      ("MessageTypes", Some (message_type_list_to_yojson x.message_types));
      ("IsoCountryCode", Some (iso_country_code_to_yojson x.iso_country_code));
      ("SenderId", Some (sender_id_to_yojson x.sender_id));
      ("SenderIdArn", Some (Smaws_Lib.Smithy_api.Json_serializers.string__to_yojson x.sender_id_arn));
    ]

let release_sender_id_request_to_yojson (x : release_sender_id_request) =
  assoc_to_yojson
    [
      ("IsoCountryCode", Some (iso_country_code_to_yojson x.iso_country_code));
      ("SenderId", Some (sender_id_or_arn_to_yojson x.sender_id));
    ]

let release_phone_number_result_to_yojson (x : release_phone_number_result) =
  assoc_to_yojson
    [
      ( "CreatedTimestamp",
        option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.timestamp_epoch_seconds_to_yojson
          x.created_timestamp );
      ( "RegistrationId",
        option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.string__to_yojson x.registration_id
      );
      ("OptOutListName", option_to_yojson opt_out_list_name_to_yojson x.opt_out_list_name);
      ( "SelfManagedOptOutsEnabled",
        option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.primitive_boolean_to_yojson
          x.self_managed_opt_outs_enabled );
      ("TwoWayChannelRole", option_to_yojson iam_role_arn_to_yojson x.two_way_channel_role);
      ("TwoWayChannelArn", option_to_yojson two_way_channel_arn_to_yojson x.two_way_channel_arn);
      ( "TwoWayEnabled",
        option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.primitive_boolean_to_yojson
          x.two_way_enabled );
      ( "MonthlyLeasingPrice",
        option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.string__to_yojson
          x.monthly_leasing_price );
      ("NumberType", option_to_yojson number_type_to_yojson x.number_type);
      ("NumberCapabilities", option_to_yojson number_capability_list_to_yojson x.number_capabilities);
      ("MessageType", option_to_yojson message_type_to_yojson x.message_type);
      ("IsoCountryCode", option_to_yojson iso_country_code_to_yojson x.iso_country_code);
      ("Status", option_to_yojson number_status_to_yojson x.status);
      ("PhoneNumber", option_to_yojson phone_number_to_yojson x.phone_number);
      ( "PhoneNumberId",
        option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.string__to_yojson x.phone_number_id
      );
      ( "PhoneNumberArn",
        option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.string__to_yojson x.phone_number_arn
      );
    ]

let release_phone_number_request_to_yojson (x : release_phone_number_request) =
  assoc_to_yojson [ ("PhoneNumberId", Some (phone_number_id_or_arn_to_yojson x.phone_number_id)) ]

let registration_version_number_list_to_yojson tree =
  list_to_yojson registration_version_number_to_yojson tree

let registration_denied_reason_information_to_yojson (x : registration_denied_reason_information) =
  assoc_to_yojson
    [
      ( "DocumentationLink",
        option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.string__to_yojson
          x.documentation_link );
      ( "DocumentationTitle",
        option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.string__to_yojson
          x.documentation_title );
      ( "LongDescription",
        option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.string__to_yojson x.long_description
      );
      ( "ShortDescription",
        Some (Smaws_Lib.Smithy_api.Json_serializers.string__to_yojson x.short_description) );
      ("Reason", Some (Smaws_Lib.Smithy_api.Json_serializers.string__to_yojson x.reason));
    ]

let registration_denied_reason_information_list_to_yojson tree =
  list_to_yojson registration_denied_reason_information_to_yojson tree

let registration_version_information_to_yojson (x : registration_version_information) =
  assoc_to_yojson
    [
      ( "Feedback",
        option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.string__to_yojson x.feedback );
      ( "DeniedReasons",
        option_to_yojson registration_denied_reason_information_list_to_yojson x.denied_reasons );
      ( "RegistrationVersionStatusHistory",
        Some (registration_version_status_history_to_yojson x.registration_version_status_history)
      );
      ( "RegistrationVersionStatus",
        Some (registration_version_status_to_yojson x.registration_version_status) );
      ("VersionNumber", Some (registration_version_number_to_yojson x.version_number));
    ]

let registration_version_information_list_to_yojson tree =
  list_to_yojson registration_version_information_to_yojson tree

let registration_version_filter_name_to_yojson (x : registration_version_filter_name) =
  match x with REGISTRATION_VERSION_STATUS -> `String "registration-version-status"

let registration_version_filter_to_yojson (x : registration_version_filter) =
  assoc_to_yojson
    [
      ("Values", Some (filter_value_list_to_yojson x.values));
      ("Name", Some (registration_version_filter_name_to_yojson x.name));
    ]

let registration_version_filter_list_to_yojson tree =
  list_to_yojson registration_version_filter_to_yojson tree

let registration_type_to_yojson = string_to_yojson
let registration_type_list_to_yojson tree = list_to_yojson registration_type_to_yojson tree

let registration_type_filter_name_to_yojson (x : registration_type_filter_name) =
  match x with
  | SUPPORTED_ASSOCIATION_RESOURCE_TYPE -> `String "supported-association-resource-type"
  | SUPPORTED_ASSOCIATION_ISO_COUNTRY_CODE -> `String "supported-association-iso-country-code"

let registration_type_filter_to_yojson (x : registration_type_filter) =
  assoc_to_yojson
    [
      ("Values", Some (filter_value_list_to_yojson x.values));
      ("Name", Some (registration_type_filter_name_to_yojson x.name));
    ]

let registration_type_filter_list_to_yojson tree =
  list_to_yojson registration_type_filter_to_yojson tree

let registration_type_display_hints_to_yojson (x : registration_type_display_hints) =
  assoc_to_yojson
    [
      ( "DocumentationLink",
        option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.string__to_yojson
          x.documentation_link );
      ( "DocumentationTitle",
        option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.string__to_yojson
          x.documentation_title );
      ( "LongDescription",
        option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.string__to_yojson x.long_description
      );
      ( "ShortDescription",
        option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.string__to_yojson x.short_description
      );
      ("Title", Some (Smaws_Lib.Smithy_api.Json_serializers.string__to_yojson x.title));
    ]

let registration_type_definition_to_yojson (x : registration_type_definition) =
  assoc_to_yojson
    [
      ("DisplayHints", Some (registration_type_display_hints_to_yojson x.display_hints));
      ( "SupportedAssociations",
        option_to_yojson supported_association_list_to_yojson x.supported_associations );
      ("RegistrationType", Some (registration_type_to_yojson x.registration_type));
    ]

let registration_type_definition_list_to_yojson tree =
  list_to_yojson registration_type_definition_to_yojson tree

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

let registration_section_display_hints_to_yojson (x : registration_section_display_hints) =
  assoc_to_yojson
    [
      ( "DocumentationLink",
        option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.string__to_yojson
          x.documentation_link );
      ( "DocumentationTitle",
        option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.string__to_yojson
          x.documentation_title );
      ( "LongDescription",
        option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.string__to_yojson x.long_description
      );
      ( "ShortDescription",
        Some (Smaws_Lib.Smithy_api.Json_serializers.string__to_yojson x.short_description) );
      ("Title", Some (Smaws_Lib.Smithy_api.Json_serializers.string__to_yojson x.title));
    ]

let registration_section_definition_to_yojson (x : registration_section_definition) =
  assoc_to_yojson
    [
      ("DisplayHints", Some (registration_section_display_hints_to_yojson x.display_hints));
      ("SectionPath", Some (section_path_to_yojson x.section_path));
    ]

let registration_section_definition_list_to_yojson tree =
  list_to_yojson registration_section_definition_to_yojson tree

let registration_information_to_yojson (x : registration_information) =
  assoc_to_yojson
    [
      ( "CreatedTimestamp",
        Some
          (Smaws_Lib.Smithy_api.Json_serializers.timestamp_epoch_seconds_to_yojson
             x.created_timestamp) );
      ("AdditionalAttributes", option_to_yojson string_map_to_yojson x.additional_attributes);
      ( "LatestDeniedVersionNumber",
        option_to_yojson registration_version_number_to_yojson x.latest_denied_version_number );
      ( "ApprovedVersionNumber",
        option_to_yojson registration_version_number_to_yojson x.approved_version_number );
      ("CurrentVersionNumber", Some (registration_version_number_to_yojson x.current_version_number));
      ("RegistrationStatus", Some (registration_status_to_yojson x.registration_status));
      ("RegistrationType", Some (registration_type_to_yojson x.registration_type));
      ( "RegistrationId",
        Some (Smaws_Lib.Smithy_api.Json_serializers.string__to_yojson x.registration_id) );
      ( "RegistrationArn",
        Some (Smaws_Lib.Smithy_api.Json_serializers.string__to_yojson x.registration_arn) );
    ]

let registration_information_list_to_yojson tree =
  list_to_yojson registration_information_to_yojson tree

let registration_id_list_to_yojson tree = list_to_yojson registration_id_or_arn_to_yojson tree

let registration_filter_name_to_yojson (x : registration_filter_name) =
  match x with
  | REGISTRATION_TYPE -> `String "registration-type"
  | REGISTRATION_STATUS -> `String "registration-status"

let registration_filter_to_yojson (x : registration_filter) =
  assoc_to_yojson
    [
      ("Values", Some (filter_value_list_to_yojson x.values));
      ("Name", Some (registration_filter_name_to_yojson x.name));
    ]

let registration_filter_list_to_yojson tree = list_to_yojson registration_filter_to_yojson tree
let field_path_to_yojson = string_to_yojson
let registration_attachment_id_or_arn_to_yojson = string_to_yojson

let registration_field_value_information_to_yojson (x : registration_field_value_information) =
  assoc_to_yojson
    [
      ( "Feedback",
        option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.string__to_yojson x.feedback );
      ( "DeniedReason",
        option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.string__to_yojson x.denied_reason );
      ( "RegistrationAttachmentId",
        option_to_yojson registration_attachment_id_or_arn_to_yojson x.registration_attachment_id );
      ("TextValue", option_to_yojson text_value_to_yojson x.text_value);
      ("SelectChoices", option_to_yojson select_choice_list_to_yojson x.select_choices);
      ("FieldPath", Some (field_path_to_yojson x.field_path));
    ]

let registration_field_value_information_list_to_yojson tree =
  list_to_yojson registration_field_value_information_to_yojson tree

let registration_field_display_hints_to_yojson (x : registration_field_display_hints) =
  assoc_to_yojson
    [
      ( "ExampleTextValue",
        option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.string__to_yojson
          x.example_text_value );
      ( "TextValidationDescription",
        option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.string__to_yojson
          x.text_validation_description );
      ( "SelectOptionDescriptions",
        option_to_yojson select_option_descriptions_list_to_yojson x.select_option_descriptions );
      ( "DocumentationLink",
        option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.string__to_yojson
          x.documentation_link );
      ( "DocumentationTitle",
        option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.string__to_yojson
          x.documentation_title );
      ( "LongDescription",
        option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.string__to_yojson x.long_description
      );
      ( "ShortDescription",
        Some (Smaws_Lib.Smithy_api.Json_serializers.string__to_yojson x.short_description) );
      ("Title", Some (Smaws_Lib.Smithy_api.Json_serializers.string__to_yojson x.title));
    ]

let field_type_to_yojson (x : field_type) =
  match x with
  | SELECT -> `String "SELECT"
  | TEXT -> `String "TEXT"
  | ATTACHMENT -> `String "ATTACHMENT"

let field_requirement_to_yojson (x : field_requirement) =
  match x with
  | REQUIRED -> `String "REQUIRED"
  | CONDITIONAL -> `String "CONDITIONAL"
  | OPTIONAL -> `String "OPTIONAL"

let registration_field_definition_to_yojson (x : registration_field_definition) =
  assoc_to_yojson
    [
      ("DisplayHints", Some (registration_field_display_hints_to_yojson x.display_hints));
      ("TextValidation", option_to_yojson text_validation_to_yojson x.text_validation);
      ("SelectValidation", option_to_yojson select_validation_to_yojson x.select_validation);
      ("FieldRequirement", Some (field_requirement_to_yojson x.field_requirement));
      ("FieldType", Some (field_type_to_yojson x.field_type));
      ("FieldPath", Some (field_path_to_yojson x.field_path));
      ("SectionPath", Some (section_path_to_yojson x.section_path));
    ]

let registration_field_definition_list_to_yojson tree =
  list_to_yojson registration_field_definition_to_yojson tree

let attachment_status_to_yojson (x : attachment_status) =
  match x with
  | UPLOAD_IN_PROGRESS -> `String "UPLOAD_IN_PROGRESS"
  | UPLOAD_COMPLETE -> `String "UPLOAD_COMPLETE"
  | UPLOAD_FAILED -> `String "UPLOAD_FAILED"
  | DELETED -> `String "DELETED"

let attachment_upload_error_reason_to_yojson (x : attachment_upload_error_reason) =
  match x with INTERNAL_ERROR -> `String "INTERNAL_ERROR"

let registration_attachments_information_to_yojson (x : registration_attachments_information) =
  assoc_to_yojson
    [
      ( "AttachmentUrl",
        option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.string__to_yojson x.attachment_url );
      ( "CreatedTimestamp",
        Some
          (Smaws_Lib.Smithy_api.Json_serializers.timestamp_epoch_seconds_to_yojson
             x.created_timestamp) );
      ( "AttachmentUploadErrorReason",
        option_to_yojson attachment_upload_error_reason_to_yojson x.attachment_upload_error_reason
      );
      ("AttachmentStatus", Some (attachment_status_to_yojson x.attachment_status));
      ( "RegistrationAttachmentId",
        Some (Smaws_Lib.Smithy_api.Json_serializers.string__to_yojson x.registration_attachment_id)
      );
      ( "RegistrationAttachmentArn",
        Some (Smaws_Lib.Smithy_api.Json_serializers.string__to_yojson x.registration_attachment_arn)
      );
    ]

let registration_attachments_information_list_to_yojson tree =
  list_to_yojson registration_attachments_information_to_yojson tree

let registration_attachment_id_list_to_yojson tree =
  list_to_yojson registration_id_or_arn_to_yojson tree

let registration_attachment_filter_name_to_yojson (x : registration_attachment_filter_name) =
  match x with ATTACHMENT_STATUS -> `String "attachment-status"

let registration_attachment_filter_to_yojson (x : registration_attachment_filter) =
  assoc_to_yojson
    [
      ("Values", Some (filter_value_list_to_yojson x.values));
      ("Name", Some (registration_attachment_filter_name_to_yojson x.name));
    ]

let registration_attachment_filter_list_to_yojson tree =
  list_to_yojson registration_attachment_filter_to_yojson tree

let registration_association_metadata_to_yojson (x : registration_association_metadata) =
  assoc_to_yojson
    [
      ("PhoneNumber", option_to_yojson phone_number_to_yojson x.phone_number);
      ("IsoCountryCode", option_to_yojson iso_country_code_to_yojson x.iso_country_code);
      ( "ResourceType",
        Some (Smaws_Lib.Smithy_api.Json_serializers.string__to_yojson x.resource_type) );
      ("ResourceId", Some (Smaws_Lib.Smithy_api.Json_serializers.string__to_yojson x.resource_id));
      ("ResourceArn", Some (Smaws_Lib.Smithy_api.Json_serializers.string__to_yojson x.resource_arn));
    ]

let registration_association_metadata_list_to_yojson tree =
  list_to_yojson registration_association_metadata_to_yojson tree

let registration_association_filter_name_to_yojson (x : registration_association_filter_name) =
  match x with
  | RESOURCE_TYPE -> `String "resource-type"
  | ISO_COUNTRY_CODE -> `String "iso-country-code"

let registration_association_filter_to_yojson (x : registration_association_filter) =
  assoc_to_yojson
    [
      ("Values", Some (filter_value_list_to_yojson x.values));
      ("Name", Some (registration_association_filter_name_to_yojson x.name));
    ]

let registration_association_filter_list_to_yojson tree =
  list_to_yojson registration_association_filter_to_yojson tree

let rcs_agent_information_to_yojson (x : rcs_agent_information) =
  assoc_to_yojson
    [
      ("TestingAgent", option_to_yojson testing_agent_information_to_yojson x.testing_agent);
      ( "TwoWayRcsEventsEnabled",
        option_to_yojson rcs_event_type_list_to_yojson x.two_way_rcs_events_enabled );
      ("TwoWayMediaS3Role", option_to_yojson iam_role_arn_to_yojson x.two_way_media_s3_role);
      ( "TwoWayMediaS3KeyPrefix",
        option_to_yojson two_way_media_s3_key_prefix_to_yojson x.two_way_media_s3_key_prefix );
      ( "TwoWayMediaS3BucketName",
        option_to_yojson two_way_media_s3_bucket_name_to_yojson x.two_way_media_s3_bucket_name );
      ("PoolId", option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.string__to_yojson x.pool_id);
      ( "TwoWayEnabled",
        Some (Smaws_Lib.Smithy_api.Json_serializers.primitive_boolean_to_yojson x.two_way_enabled)
      );
      ("TwoWayChannelRole", option_to_yojson iam_role_arn_to_yojson x.two_way_channel_role);
      ("TwoWayChannelArn", option_to_yojson two_way_channel_arn_to_yojson x.two_way_channel_arn);
      ( "SelfManagedOptOutsEnabled",
        Some
          (Smaws_Lib.Smithy_api.Json_serializers.primitive_boolean_to_yojson
             x.self_managed_opt_outs_enabled) );
      ("OptOutListName", option_to_yojson opt_out_list_name_to_yojson x.opt_out_list_name);
      ( "DeletionProtectionEnabled",
        Some
          (Smaws_Lib.Smithy_api.Json_serializers.primitive_boolean_to_yojson
             x.deletion_protection_enabled) );
      ( "CreatedTimestamp",
        Some
          (Smaws_Lib.Smithy_api.Json_serializers.timestamp_epoch_seconds_to_yojson
             x.created_timestamp) );
      ("Status", Some (rcs_agent_status_to_yojson x.status));
      ("RcsAgentId", Some (Smaws_Lib.Smithy_api.Json_serializers.string__to_yojson x.rcs_agent_id));
      ("RcsAgentArn", Some (Smaws_Lib.Smithy_api.Json_serializers.string__to_yojson x.rcs_agent_arn));
    ]

let rcs_agent_information_list_to_yojson tree = list_to_yojson rcs_agent_information_to_yojson tree
let rcs_agent_id_list_to_yojson tree = list_to_yojson rcs_agent_id_or_arn_to_yojson tree

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
      ("Values", Some (filter_value_list_to_yojson x.values));
      ("Name", Some (rcs_agent_filter_name_to_yojson x.name));
    ]

let rcs_agent_filter_list_to_yojson tree = list_to_yojson rcs_agent_filter_to_yojson tree

let put_resource_policy_result_to_yojson (x : put_resource_policy_result) =
  assoc_to_yojson
    [
      ( "CreatedTimestamp",
        option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.timestamp_epoch_seconds_to_yojson
          x.created_timestamp );
      ("Policy", option_to_yojson resource_policy_to_yojson x.policy);
      ("ResourceArn", option_to_yojson amazon_resource_name_to_yojson x.resource_arn);
    ]

let put_resource_policy_request_to_yojson (x : put_resource_policy_request) =
  assoc_to_yojson
    [
      ("Policy", Some (resource_policy_to_yojson x.policy));
      ("ResourceArn", Some (amazon_resource_name_to_yojson x.resource_arn));
    ]

let put_registration_field_value_result_to_yojson (x : put_registration_field_value_result) =
  assoc_to_yojson
    [
      ( "RegistrationAttachmentId",
        option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.string__to_yojson
          x.registration_attachment_id );
      ("TextValue", option_to_yojson text_value_to_yojson x.text_value);
      ("SelectChoices", option_to_yojson select_choice_list_to_yojson x.select_choices);
      ("FieldPath", Some (field_path_to_yojson x.field_path));
      ("VersionNumber", Some (registration_version_number_to_yojson x.version_number));
      ( "RegistrationId",
        Some (Smaws_Lib.Smithy_api.Json_serializers.string__to_yojson x.registration_id) );
      ( "RegistrationArn",
        Some (Smaws_Lib.Smithy_api.Json_serializers.string__to_yojson x.registration_arn) );
    ]

let put_registration_field_value_request_to_yojson (x : put_registration_field_value_request) =
  assoc_to_yojson
    [
      ( "RegistrationAttachmentId",
        option_to_yojson registration_attachment_id_or_arn_to_yojson x.registration_attachment_id );
      ("TextValue", option_to_yojson text_value_to_yojson x.text_value);
      ("SelectChoices", option_to_yojson select_choice_list_to_yojson x.select_choices);
      ("FieldPath", Some (field_path_to_yojson x.field_path));
      ("RegistrationId", Some (registration_id_or_arn_to_yojson x.registration_id));
    ]

let protect_configuration_rule_override_action_to_yojson
    (x : protect_configuration_rule_override_action) =
  match x with ALLOW -> `String "ALLOW" | BLOCK -> `String "BLOCK"

let put_protect_configuration_rule_set_number_override_result_to_yojson
    (x : put_protect_configuration_rule_set_number_override_result) =
  assoc_to_yojson
    [
      ( "ExpirationTimestamp",
        option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.timestamp_epoch_seconds_to_yojson
          x.expiration_timestamp );
      ("IsoCountryCode", option_to_yojson iso_country_code_to_yojson x.iso_country_code);
      ("Action", Some (protect_configuration_rule_override_action_to_yojson x.action));
      ( "CreatedTimestamp",
        Some
          (Smaws_Lib.Smithy_api.Json_serializers.timestamp_epoch_seconds_to_yojson
             x.created_timestamp) );
      ("DestinationPhoneNumber", Some (phone_number_to_yojson x.destination_phone_number));
      ( "ProtectConfigurationId",
        Some (protect_configuration_id_to_yojson x.protect_configuration_id) );
      ( "ProtectConfigurationArn",
        Some (protect_configuration_arn_to_yojson x.protect_configuration_arn) );
    ]

let put_protect_configuration_rule_set_number_override_request_to_yojson
    (x : put_protect_configuration_rule_set_number_override_request) =
  assoc_to_yojson
    [
      ( "ExpirationTimestamp",
        option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.timestamp_epoch_seconds_to_yojson
          x.expiration_timestamp );
      ("Action", Some (protect_configuration_rule_override_action_to_yojson x.action));
      ("DestinationPhoneNumber", Some (phone_number_to_yojson x.destination_phone_number));
      ( "ProtectConfigurationId",
        Some (protect_configuration_id_or_arn_to_yojson x.protect_configuration_id) );
      ( "ClientToken",
        Some
          (client_token_to_yojson
             (Option.value x.client_token ~default:(Smaws_Lib.Uuid.generate ()))) );
    ]

let put_opted_out_number_result_to_yojson (x : put_opted_out_number_result) =
  assoc_to_yojson
    [
      ( "EndUserOptedOut",
        option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.primitive_boolean_to_yojson
          x.end_user_opted_out );
      ( "OptedOutTimestamp",
        option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.timestamp_epoch_seconds_to_yojson
          x.opted_out_timestamp );
      ("OptedOutNumber", option_to_yojson phone_number_to_yojson x.opted_out_number);
      ("OptOutListName", option_to_yojson opt_out_list_name_to_yojson x.opt_out_list_name);
      ( "OptOutListArn",
        option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.string__to_yojson x.opt_out_list_arn
      );
    ]

let put_opted_out_number_request_to_yojson (x : put_opted_out_number_request) =
  assoc_to_yojson
    [
      ("OptedOutNumber", Some (phone_number_to_yojson x.opted_out_number));
      ("OptOutListName", Some (opt_out_list_name_or_arn_to_yojson x.opt_out_list_name));
    ]

let message_id_to_yojson = string_to_yojson

let message_feedback_status_to_yojson (x : message_feedback_status) =
  match x with RECEIVED -> `String "RECEIVED" | FAILED -> `String "FAILED"

let put_message_feedback_result_to_yojson (x : put_message_feedback_result) =
  assoc_to_yojson
    [
      ("MessageFeedbackStatus", Some (message_feedback_status_to_yojson x.message_feedback_status));
      ("MessageId", Some (message_id_to_yojson x.message_id));
    ]

let put_message_feedback_request_to_yojson (x : put_message_feedback_request) =
  assoc_to_yojson
    [
      ("MessageFeedbackStatus", Some (message_feedback_status_to_yojson x.message_feedback_status));
      ("MessageId", Some (message_id_to_yojson x.message_id));
    ]

let keyword_message_to_yojson = string_to_yojson

let keyword_action_to_yojson (x : keyword_action) =
  match x with
  | AUTOMATIC_RESPONSE -> `String "AUTOMATIC_RESPONSE"
  | OPT_OUT -> `String "OPT_OUT"
  | OPT_IN -> `String "OPT_IN"

let put_keyword_result_to_yojson (x : put_keyword_result) =
  assoc_to_yojson
    [
      ("KeywordAction", option_to_yojson keyword_action_to_yojson x.keyword_action);
      ("KeywordMessage", option_to_yojson keyword_message_to_yojson x.keyword_message);
      ("Keyword", option_to_yojson keyword_to_yojson x.keyword);
      ( "OriginationIdentity",
        option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.string__to_yojson
          x.origination_identity );
      ( "OriginationIdentityArn",
        option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.string__to_yojson
          x.origination_identity_arn );
    ]

let phone_or_pool_id_or_arn_to_yojson = string_to_yojson

let put_keyword_request_to_yojson (x : put_keyword_request) =
  assoc_to_yojson
    [
      ("KeywordAction", option_to_yojson keyword_action_to_yojson x.keyword_action);
      ("KeywordMessage", Some (keyword_message_to_yojson x.keyword_message));
      ("Keyword", Some (keyword_to_yojson x.keyword));
      ("OriginationIdentity", Some (phone_or_pool_id_or_arn_to_yojson x.origination_identity));
    ]

let protect_configuration_rule_set_number_override_to_yojson
    (x : protect_configuration_rule_set_number_override) =
  assoc_to_yojson
    [
      ( "ExpirationTimestamp",
        option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.timestamp_epoch_seconds_to_yojson
          x.expiration_timestamp );
      ("IsoCountryCode", option_to_yojson iso_country_code_to_yojson x.iso_country_code);
      ("Action", Some (protect_configuration_rule_override_action_to_yojson x.action));
      ( "CreatedTimestamp",
        Some
          (Smaws_Lib.Smithy_api.Json_serializers.timestamp_epoch_seconds_to_yojson
             x.created_timestamp) );
      ("DestinationPhoneNumber", Some (phone_number_to_yojson x.destination_phone_number));
    ]

let protect_configuration_rule_set_number_override_list_to_yojson tree =
  list_to_yojson protect_configuration_rule_set_number_override_to_yojson tree

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
      ("Values", Some (filter_value_list_to_yojson x.values));
      ("Name", Some (protect_configuration_rule_set_number_override_filter_name_to_yojson x.name));
    ]

let protect_configuration_information_to_yojson (x : protect_configuration_information) =
  assoc_to_yojson
    [
      ( "DeletionProtectionEnabled",
        Some
          (Smaws_Lib.Smithy_api.Json_serializers.primitive_boolean_to_yojson
             x.deletion_protection_enabled) );
      ( "AccountDefault",
        Some (Smaws_Lib.Smithy_api.Json_serializers.primitive_boolean_to_yojson x.account_default)
      );
      ( "CreatedTimestamp",
        Some
          (Smaws_Lib.Smithy_api.Json_serializers.timestamp_epoch_seconds_to_yojson
             x.created_timestamp) );
      ( "ProtectConfigurationId",
        Some (protect_configuration_id_to_yojson x.protect_configuration_id) );
      ( "ProtectConfigurationArn",
        Some (protect_configuration_arn_to_yojson x.protect_configuration_arn) );
    ]

let protect_configuration_information_list_to_yojson tree =
  list_to_yojson protect_configuration_information_to_yojson tree

let protect_configuration_id_list_to_yojson tree =
  list_to_yojson protect_configuration_id_or_arn_to_yojson tree

let protect_configuration_filter_name_to_yojson (x : protect_configuration_filter_name) =
  match x with
  | ACCOUNT_DEFAULT -> `String "account-default"
  | DELETION_PROTECTION_ENABLED -> `String "deletion-protection-enabled"

let protect_configuration_filter_to_yojson (x : protect_configuration_filter) =
  assoc_to_yojson
    [
      ("Values", Some (filter_value_list_to_yojson x.values));
      ("Name", Some (protect_configuration_filter_name_to_yojson x.name));
    ]

let protect_configuration_filter_list_to_yojson tree =
  list_to_yojson protect_configuration_filter_to_yojson tree

let pool_origination_identities_filter_name_to_yojson (x : pool_origination_identities_filter_name)
    =
  match x with
  | ISO_COUNTRY_CODE -> `String "iso-country-code"
  | NUMBER_CAPABILITY -> `String "number-capability"

let pool_origination_identities_filter_to_yojson (x : pool_origination_identities_filter) =
  assoc_to_yojson
    [
      ("Values", Some (filter_value_list_to_yojson x.values));
      ("Name", Some (pool_origination_identities_filter_name_to_yojson x.name));
    ]

let pool_origination_identities_filter_list_to_yojson tree =
  list_to_yojson pool_origination_identities_filter_to_yojson tree

let pool_information_to_yojson (x : pool_information) =
  assoc_to_yojson
    [
      ( "CreatedTimestamp",
        Some
          (Smaws_Lib.Smithy_api.Json_serializers.timestamp_epoch_seconds_to_yojson
             x.created_timestamp) );
      ( "DeletionProtectionEnabled",
        Some
          (Smaws_Lib.Smithy_api.Json_serializers.primitive_boolean_to_yojson
             x.deletion_protection_enabled) );
      ( "SharedRoutesEnabled",
        Some
          (Smaws_Lib.Smithy_api.Json_serializers.primitive_boolean_to_yojson x.shared_routes_enabled)
      );
      ("OptOutListName", Some (opt_out_list_name_to_yojson x.opt_out_list_name));
      ( "SelfManagedOptOutsEnabled",
        Some
          (Smaws_Lib.Smithy_api.Json_serializers.primitive_boolean_to_yojson
             x.self_managed_opt_outs_enabled) );
      ("TwoWayChannelRole", option_to_yojson iam_role_arn_to_yojson x.two_way_channel_role);
      ("TwoWayChannelArn", option_to_yojson two_way_channel_arn_to_yojson x.two_way_channel_arn);
      ( "TwoWayEnabled",
        Some (Smaws_Lib.Smithy_api.Json_serializers.primitive_boolean_to_yojson x.two_way_enabled)
      );
      ("MessageType", Some (message_type_to_yojson x.message_type));
      ("Status", Some (pool_status_to_yojson x.status));
      ("PoolId", Some (Smaws_Lib.Smithy_api.Json_serializers.string__to_yojson x.pool_id));
      ("PoolArn", Some (Smaws_Lib.Smithy_api.Json_serializers.string__to_yojson x.pool_arn));
    ]

let pool_information_list_to_yojson tree = list_to_yojson pool_information_to_yojson tree
let pool_id_list_to_yojson tree = list_to_yojson pool_id_or_arn_to_yojson tree

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
      ("Values", Some (filter_value_list_to_yojson x.values));
      ("Name", Some (pool_filter_name_to_yojson x.name));
    ]

let pool_filter_list_to_yojson tree = list_to_yojson pool_filter_to_yojson tree

let list_tags_for_resource_result_to_yojson (x : list_tags_for_resource_result) =
  assoc_to_yojson
    [
      ("Tags", option_to_yojson tag_list_to_yojson x.tags);
      ("ResourceArn", option_to_yojson amazon_resource_name_to_yojson x.resource_arn);
    ]

let list_tags_for_resource_request_to_yojson (x : list_tags_for_resource_request) =
  assoc_to_yojson [ ("ResourceArn", Some (amazon_resource_name_to_yojson x.resource_arn)) ]

let next_token_to_yojson = string_to_yojson

let list_registration_associations_result_to_yojson (x : list_registration_associations_result) =
  assoc_to_yojson
    [
      ("NextToken", option_to_yojson next_token_to_yojson x.next_token);
      ( "RegistrationAssociations",
        Some (registration_association_metadata_list_to_yojson x.registration_associations) );
      ("RegistrationType", Some (registration_type_to_yojson x.registration_type));
      ( "RegistrationId",
        Some (Smaws_Lib.Smithy_api.Json_serializers.string__to_yojson x.registration_id) );
      ( "RegistrationArn",
        Some (Smaws_Lib.Smithy_api.Json_serializers.string__to_yojson x.registration_arn) );
    ]

let max_results_to_yojson = int_to_yojson

let list_registration_associations_request_to_yojson (x : list_registration_associations_request) =
  assoc_to_yojson
    [
      ("MaxResults", option_to_yojson max_results_to_yojson x.max_results);
      ("NextToken", option_to_yojson next_token_to_yojson x.next_token);
      ("Filters", option_to_yojson registration_association_filter_list_to_yojson x.filters);
      ("RegistrationId", Some (registration_id_or_arn_to_yojson x.registration_id));
    ]

let list_protect_configuration_rule_set_number_overrides_result_to_yojson
    (x : list_protect_configuration_rule_set_number_overrides_result) =
  assoc_to_yojson
    [
      ("NextToken", option_to_yojson next_token_to_yojson x.next_token);
      ( "RuleSetNumberOverrides",
        option_to_yojson protect_configuration_rule_set_number_override_list_to_yojson
          x.rule_set_number_overrides );
      ( "ProtectConfigurationId",
        Some (protect_configuration_id_to_yojson x.protect_configuration_id) );
      ( "ProtectConfigurationArn",
        Some (protect_configuration_arn_to_yojson x.protect_configuration_arn) );
    ]

let list_protect_configuration_rule_set_number_override_filter_to_yojson tree =
  list_to_yojson protect_configuration_rule_set_number_override_filter_item_to_yojson tree

let list_protect_configuration_rule_set_number_overrides_request_to_yojson
    (x : list_protect_configuration_rule_set_number_overrides_request) =
  assoc_to_yojson
    [
      ("MaxResults", option_to_yojson max_results_to_yojson x.max_results);
      ("NextToken", option_to_yojson next_token_to_yojson x.next_token);
      ( "Filters",
        option_to_yojson list_protect_configuration_rule_set_number_override_filter_to_yojson
          x.filters );
      ( "ProtectConfigurationId",
        Some (protect_configuration_id_or_arn_to_yojson x.protect_configuration_id) );
    ]

let origination_identity_metadata_to_yojson (x : origination_identity_metadata) =
  assoc_to_yojson
    [
      ("PhoneNumber", option_to_yojson phone_number_to_yojson x.phone_number);
      ("NumberCapabilities", Some (number_capability_list_to_yojson x.number_capabilities));
      ("IsoCountryCode", Some (iso_country_code_to_yojson x.iso_country_code));
      ( "OriginationIdentity",
        Some (Smaws_Lib.Smithy_api.Json_serializers.string__to_yojson x.origination_identity) );
      ( "OriginationIdentityArn",
        Some (Smaws_Lib.Smithy_api.Json_serializers.string__to_yojson x.origination_identity_arn) );
    ]

let origination_identity_metadata_list_to_yojson tree =
  list_to_yojson origination_identity_metadata_to_yojson tree

let list_pool_origination_identities_result_to_yojson (x : list_pool_origination_identities_result)
    =
  assoc_to_yojson
    [
      ("NextToken", option_to_yojson next_token_to_yojson x.next_token);
      ( "OriginationIdentities",
        option_to_yojson origination_identity_metadata_list_to_yojson x.origination_identities );
      ("PoolId", option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.string__to_yojson x.pool_id);
      ( "PoolArn",
        option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.string__to_yojson x.pool_arn );
    ]

let list_pool_origination_identities_request_to_yojson
    (x : list_pool_origination_identities_request) =
  assoc_to_yojson
    [
      ("MaxResults", option_to_yojson max_results_to_yojson x.max_results);
      ("NextToken", option_to_yojson next_token_to_yojson x.next_token);
      ("Filters", option_to_yojson pool_origination_identities_filter_list_to_yojson x.filters);
      ("PoolId", Some (pool_id_or_arn_to_yojson x.pool_id));
    ]

let notify_use_case_list_to_yojson tree =
  list_to_yojson notify_configuration_use_case_to_yojson tree

let notify_tier_list_to_yojson tree = list_to_yojson notify_configuration_tier_to_yojson tree

let notify_country_information_to_yojson (x : notify_country_information) =
  assoc_to_yojson
    [
      ( "CustomerOwnedIdentityRequired",
        Some
          (Smaws_Lib.Smithy_api.Json_serializers.primitive_boolean_to_yojson
             x.customer_owned_identity_required) );
      ("SupportedTiers", Some (notify_tier_list_to_yojson x.supported_tiers));
      ("SupportedUseCases", Some (notify_use_case_list_to_yojson x.supported_use_cases));
      ("SupportedChannels", Some (notify_enabled_channels_list_to_yojson x.supported_channels));
      ("CountryName", Some (Smaws_Lib.Smithy_api.Json_serializers.string__to_yojson x.country_name));
      ("IsoCountryCode", Some (iso_country_code_to_yojson x.iso_country_code));
    ]

let notify_country_information_list_to_yojson tree =
  list_to_yojson notify_country_information_to_yojson tree

let list_notify_countries_result_to_yojson (x : list_notify_countries_result) =
  assoc_to_yojson
    [
      ("NextToken", option_to_yojson next_token_to_yojson x.next_token);
      ( "NotifyCountries",
        option_to_yojson notify_country_information_list_to_yojson x.notify_countries );
    ]

let list_notify_countries_request_to_yojson (x : list_notify_countries_request) =
  assoc_to_yojson
    [
      ("MaxResults", option_to_yojson max_results_to_yojson x.max_results);
      ("NextToken", option_to_yojson next_token_to_yojson x.next_token);
      ("Tier", option_to_yojson notify_configuration_tier_to_yojson x.tier);
      ("UseCases", option_to_yojson notify_use_case_list_to_yojson x.use_cases);
      ("Channels", option_to_yojson notify_enabled_channels_list_to_yojson x.channels);
    ]

let get_resource_policy_result_to_yojson (x : get_resource_policy_result) =
  assoc_to_yojson
    [
      ( "CreatedTimestamp",
        option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.timestamp_epoch_seconds_to_yojson
          x.created_timestamp );
      ("Policy", option_to_yojson resource_policy_to_yojson x.policy);
      ("ResourceArn", option_to_yojson amazon_resource_name_to_yojson x.resource_arn);
    ]

let get_resource_policy_request_to_yojson (x : get_resource_policy_request) =
  assoc_to_yojson [ ("ResourceArn", Some (amazon_resource_name_to_yojson x.resource_arn)) ]

let get_protect_configuration_country_rule_set_result_to_yojson
    (x : get_protect_configuration_country_rule_set_result) =
  assoc_to_yojson
    [
      ("CountryRuleSet", Some (protect_configuration_country_rule_set_to_yojson x.country_rule_set));
      ("NumberCapability", Some (number_capability_to_yojson x.number_capability));
      ( "ProtectConfigurationId",
        Some (protect_configuration_id_to_yojson x.protect_configuration_id) );
      ( "ProtectConfigurationArn",
        Some (protect_configuration_arn_to_yojson x.protect_configuration_arn) );
    ]

let get_protect_configuration_country_rule_set_request_to_yojson
    (x : get_protect_configuration_country_rule_set_request) =
  assoc_to_yojson
    [
      ("NumberCapability", Some (number_capability_to_yojson x.number_capability));
      ( "ProtectConfigurationId",
        Some (protect_configuration_id_or_arn_to_yojson x.protect_configuration_id) );
    ]

let discard_registration_version_result_to_yojson (x : discard_registration_version_result) =
  assoc_to_yojson
    [
      ( "RegistrationVersionStatusHistory",
        Some (registration_version_status_history_to_yojson x.registration_version_status_history)
      );
      ( "RegistrationVersionStatus",
        Some (registration_version_status_to_yojson x.registration_version_status) );
      ("VersionNumber", Some (registration_version_number_to_yojson x.version_number));
      ( "RegistrationId",
        Some (Smaws_Lib.Smithy_api.Json_serializers.string__to_yojson x.registration_id) );
      ( "RegistrationArn",
        Some (Smaws_Lib.Smithy_api.Json_serializers.string__to_yojson x.registration_arn) );
    ]

let discard_registration_version_request_to_yojson (x : discard_registration_version_request) =
  assoc_to_yojson [ ("RegistrationId", Some (registration_id_or_arn_to_yojson x.registration_id)) ]

let disassociate_protect_configuration_result_to_yojson
    (x : disassociate_protect_configuration_result) =
  assoc_to_yojson
    [
      ( "ProtectConfigurationId",
        Some (protect_configuration_id_to_yojson x.protect_configuration_id) );
      ( "ProtectConfigurationArn",
        Some (protect_configuration_arn_to_yojson x.protect_configuration_arn) );
      ("ConfigurationSetName", Some (configuration_set_name_to_yojson x.configuration_set_name));
      ( "ConfigurationSetArn",
        Some (Smaws_Lib.Smithy_api.Json_serializers.string__to_yojson x.configuration_set_arn) );
    ]

let disassociate_protect_configuration_request_to_yojson
    (x : disassociate_protect_configuration_request) =
  assoc_to_yojson
    [
      ( "ConfigurationSetName",
        Some (configuration_set_name_or_arn_to_yojson x.configuration_set_name) );
      ( "ProtectConfigurationId",
        Some (protect_configuration_id_or_arn_to_yojson x.protect_configuration_id) );
    ]

let disassociate_origination_identity_result_to_yojson
    (x : disassociate_origination_identity_result) =
  assoc_to_yojson
    [
      ("IsoCountryCode", option_to_yojson iso_country_code_to_yojson x.iso_country_code);
      ( "OriginationIdentity",
        option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.string__to_yojson
          x.origination_identity );
      ( "OriginationIdentityArn",
        option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.string__to_yojson
          x.origination_identity_arn );
      ("PoolId", option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.string__to_yojson x.pool_id);
      ( "PoolArn",
        option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.string__to_yojson x.pool_arn );
    ]

let phone_or_sender_id_or_arn_to_yojson = string_to_yojson

let disassociate_origination_identity_request_to_yojson
    (x : disassociate_origination_identity_request) =
  assoc_to_yojson
    [
      ( "ClientToken",
        Some
          (client_token_to_yojson
             (Option.value x.client_token ~default:(Smaws_Lib.Uuid.generate ()))) );
      ("IsoCountryCode", option_to_yojson iso_country_code_to_yojson x.iso_country_code);
      ("OriginationIdentity", Some (phone_or_sender_id_or_arn_to_yojson x.origination_identity));
      ("PoolId", Some (pool_id_or_arn_to_yojson x.pool_id));
    ]

let describe_verified_destination_numbers_result_to_yojson
    (x : describe_verified_destination_numbers_result) =
  assoc_to_yojson
    [
      ("NextToken", option_to_yojson next_token_to_yojson x.next_token);
      ( "VerifiedDestinationNumbers",
        Some (verified_destination_number_information_list_to_yojson x.verified_destination_numbers)
      );
    ]

let destination_phone_number_list_to_yojson tree = list_to_yojson phone_number_to_yojson tree

let describe_verified_destination_numbers_request_to_yojson
    (x : describe_verified_destination_numbers_request) =
  assoc_to_yojson
    [
      ("MaxResults", option_to_yojson max_results_to_yojson x.max_results);
      ("NextToken", option_to_yojson next_token_to_yojson x.next_token);
      ("Filters", option_to_yojson verified_destination_number_filter_list_to_yojson x.filters);
      ( "DestinationPhoneNumbers",
        option_to_yojson destination_phone_number_list_to_yojson x.destination_phone_numbers );
      ( "VerifiedDestinationNumberIds",
        option_to_yojson verified_destination_number_id_list_to_yojson
          x.verified_destination_number_ids );
    ]

let describe_spend_limits_result_to_yojson (x : describe_spend_limits_result) =
  assoc_to_yojson
    [
      ("NextToken", option_to_yojson next_token_to_yojson x.next_token);
      ("SpendLimits", option_to_yojson spend_limit_list_to_yojson x.spend_limits);
    ]

let describe_spend_limits_request_to_yojson (x : describe_spend_limits_request) =
  assoc_to_yojson
    [
      ("MaxResults", option_to_yojson max_results_to_yojson x.max_results);
      ("NextToken", option_to_yojson next_token_to_yojson x.next_token);
    ]

let describe_sender_ids_result_to_yojson (x : describe_sender_ids_result) =
  assoc_to_yojson
    [
      ("NextToken", option_to_yojson next_token_to_yojson x.next_token);
      ("SenderIds", option_to_yojson sender_id_information_list_to_yojson x.sender_ids);
    ]

let owner_to_yojson (x : owner) = match x with SELF -> `String "SELF" | SHARED -> `String "SHARED"

let describe_sender_ids_request_to_yojson (x : describe_sender_ids_request) =
  assoc_to_yojson
    [
      ("Owner", option_to_yojson owner_to_yojson x.owner);
      ("MaxResults", option_to_yojson max_results_to_yojson x.max_results);
      ("NextToken", option_to_yojson next_token_to_yojson x.next_token);
      ("Filters", option_to_yojson sender_id_filter_list_to_yojson x.filters);
      ("SenderIds", option_to_yojson sender_id_list_to_yojson x.sender_ids);
    ]

let describe_registration_versions_result_to_yojson (x : describe_registration_versions_result) =
  assoc_to_yojson
    [
      ("NextToken", option_to_yojson next_token_to_yojson x.next_token);
      ( "RegistrationVersions",
        Some (registration_version_information_list_to_yojson x.registration_versions) );
      ( "RegistrationId",
        Some (Smaws_Lib.Smithy_api.Json_serializers.string__to_yojson x.registration_id) );
      ( "RegistrationArn",
        Some (Smaws_Lib.Smithy_api.Json_serializers.string__to_yojson x.registration_arn) );
    ]

let describe_registration_versions_request_to_yojson (x : describe_registration_versions_request) =
  assoc_to_yojson
    [
      ("MaxResults", option_to_yojson max_results_to_yojson x.max_results);
      ("NextToken", option_to_yojson next_token_to_yojson x.next_token);
      ("Filters", option_to_yojson registration_version_filter_list_to_yojson x.filters);
      ( "VersionNumbers",
        option_to_yojson registration_version_number_list_to_yojson x.version_numbers );
      ("RegistrationId", Some (registration_id_or_arn_to_yojson x.registration_id));
    ]

let describe_registration_type_definitions_result_to_yojson
    (x : describe_registration_type_definitions_result) =
  assoc_to_yojson
    [
      ("NextToken", option_to_yojson next_token_to_yojson x.next_token);
      ( "RegistrationTypeDefinitions",
        Some (registration_type_definition_list_to_yojson x.registration_type_definitions) );
    ]

let describe_registration_type_definitions_request_to_yojson
    (x : describe_registration_type_definitions_request) =
  assoc_to_yojson
    [
      ("MaxResults", option_to_yojson max_results_to_yojson x.max_results);
      ("NextToken", option_to_yojson next_token_to_yojson x.next_token);
      ("Filters", option_to_yojson registration_type_filter_list_to_yojson x.filters);
      ("RegistrationTypes", option_to_yojson registration_type_list_to_yojson x.registration_types);
    ]

let describe_registration_section_definitions_result_to_yojson
    (x : describe_registration_section_definitions_result) =
  assoc_to_yojson
    [
      ("NextToken", option_to_yojson next_token_to_yojson x.next_token);
      ( "RegistrationSectionDefinitions",
        Some (registration_section_definition_list_to_yojson x.registration_section_definitions) );
      ("RegistrationType", Some (registration_type_to_yojson x.registration_type));
    ]

let describe_registration_section_definitions_request_to_yojson
    (x : describe_registration_section_definitions_request) =
  assoc_to_yojson
    [
      ("MaxResults", option_to_yojson max_results_to_yojson x.max_results);
      ("NextToken", option_to_yojson next_token_to_yojson x.next_token);
      ("SectionPaths", option_to_yojson section_path_list_to_yojson x.section_paths);
      ("RegistrationType", Some (registration_type_to_yojson x.registration_type));
    ]

let describe_registrations_result_to_yojson (x : describe_registrations_result) =
  assoc_to_yojson
    [
      ("NextToken", option_to_yojson next_token_to_yojson x.next_token);
      ("Registrations", Some (registration_information_list_to_yojson x.registrations));
    ]

let describe_registrations_request_to_yojson (x : describe_registrations_request) =
  assoc_to_yojson
    [
      ("MaxResults", option_to_yojson max_results_to_yojson x.max_results);
      ("NextToken", option_to_yojson next_token_to_yojson x.next_token);
      ("Filters", option_to_yojson registration_filter_list_to_yojson x.filters);
      ("RegistrationIds", option_to_yojson registration_id_list_to_yojson x.registration_ids);
    ]

let describe_registration_field_values_result_to_yojson
    (x : describe_registration_field_values_result) =
  assoc_to_yojson
    [
      ("NextToken", option_to_yojson next_token_to_yojson x.next_token);
      ( "RegistrationFieldValues",
        Some (registration_field_value_information_list_to_yojson x.registration_field_values) );
      ("VersionNumber", Some (registration_version_number_to_yojson x.version_number));
      ( "RegistrationId",
        Some (Smaws_Lib.Smithy_api.Json_serializers.string__to_yojson x.registration_id) );
      ( "RegistrationArn",
        Some (Smaws_Lib.Smithy_api.Json_serializers.string__to_yojson x.registration_arn) );
    ]

let field_path_list_to_yojson tree = list_to_yojson field_path_to_yojson tree

let describe_registration_field_values_request_to_yojson
    (x : describe_registration_field_values_request) =
  assoc_to_yojson
    [
      ("MaxResults", option_to_yojson max_results_to_yojson x.max_results);
      ("NextToken", option_to_yojson next_token_to_yojson x.next_token);
      ("FieldPaths", option_to_yojson field_path_list_to_yojson x.field_paths);
      ("SectionPath", option_to_yojson section_path_to_yojson x.section_path);
      ("VersionNumber", option_to_yojson registration_version_number_to_yojson x.version_number);
      ("RegistrationId", Some (registration_id_or_arn_to_yojson x.registration_id));
    ]

let describe_registration_field_definitions_result_to_yojson
    (x : describe_registration_field_definitions_result) =
  assoc_to_yojson
    [
      ("NextToken", option_to_yojson next_token_to_yojson x.next_token);
      ( "RegistrationFieldDefinitions",
        Some (registration_field_definition_list_to_yojson x.registration_field_definitions) );
      ("RegistrationType", Some (registration_type_to_yojson x.registration_type));
    ]

let describe_registration_field_definitions_request_to_yojson
    (x : describe_registration_field_definitions_request) =
  assoc_to_yojson
    [
      ("MaxResults", option_to_yojson max_results_to_yojson x.max_results);
      ("NextToken", option_to_yojson next_token_to_yojson x.next_token);
      ("FieldPaths", option_to_yojson field_path_list_to_yojson x.field_paths);
      ("SectionPath", option_to_yojson section_path_to_yojson x.section_path);
      ("RegistrationType", Some (registration_type_to_yojson x.registration_type));
    ]

let describe_registration_attachments_result_to_yojson
    (x : describe_registration_attachments_result) =
  assoc_to_yojson
    [
      ("NextToken", option_to_yojson next_token_to_yojson x.next_token);
      ( "RegistrationAttachments",
        Some (registration_attachments_information_list_to_yojson x.registration_attachments) );
    ]

let describe_registration_attachments_request_to_yojson
    (x : describe_registration_attachments_request) =
  assoc_to_yojson
    [
      ("MaxResults", option_to_yojson max_results_to_yojson x.max_results);
      ("NextToken", option_to_yojson next_token_to_yojson x.next_token);
      ("Filters", option_to_yojson registration_attachment_filter_list_to_yojson x.filters);
      ( "RegistrationAttachmentIds",
        option_to_yojson registration_attachment_id_list_to_yojson x.registration_attachment_ids );
    ]

let describe_rcs_agents_result_to_yojson (x : describe_rcs_agents_result) =
  assoc_to_yojson
    [
      ("NextToken", option_to_yojson next_token_to_yojson x.next_token);
      ("RcsAgents", option_to_yojson rcs_agent_information_list_to_yojson x.rcs_agents);
    ]

let describe_rcs_agents_request_to_yojson (x : describe_rcs_agents_request) =
  assoc_to_yojson
    [
      ("MaxResults", option_to_yojson max_results_to_yojson x.max_results);
      ("NextToken", option_to_yojson next_token_to_yojson x.next_token);
      ("Filters", option_to_yojson rcs_agent_filter_list_to_yojson x.filters);
      ("Owner", option_to_yojson owner_to_yojson x.owner);
      ("RcsAgentIds", option_to_yojson rcs_agent_id_list_to_yojson x.rcs_agent_ids);
    ]

let country_launch_status_to_yojson (x : country_launch_status) =
  match x with
  | CREATED -> `String "CREATED"
  | PENDING -> `String "PENDING"
  | PARTIAL -> `String "PARTIAL"
  | ACTIVE -> `String "ACTIVE"
  | REJECTED -> `String "REJECTED"

let carrier_status_to_yojson (x : carrier_status) =
  match x with
  | PENDING -> `String "PENDING"
  | ACTIVE -> `String "ACTIVE"
  | REJECTED -> `String "REJECTED"

let carrier_status_information_to_yojson (x : carrier_status_information) =
  assoc_to_yojson
    [
      ("Status", Some (carrier_status_to_yojson x.status));
      ("CarrierName", Some (Smaws_Lib.Smithy_api.Json_serializers.string__to_yojson x.carrier_name));
    ]

let carrier_status_information_list_to_yojson tree =
  list_to_yojson carrier_status_information_to_yojson tree

let country_launch_status_information_to_yojson (x : country_launch_status_information) =
  assoc_to_yojson
    [
      ("CarrierStatus", Some (carrier_status_information_list_to_yojson x.carrier_status));
      ( "RegistrationId",
        Some (Smaws_Lib.Smithy_api.Json_serializers.string__to_yojson x.registration_id) );
      ( "RcsPlatformId",
        option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.string__to_yojson x.rcs_platform_id
      );
      ("Status", Some (country_launch_status_to_yojson x.status));
      ("IsoCountryCode", Some (iso_country_code_to_yojson x.iso_country_code));
    ]

let country_launch_status_information_list_to_yojson tree =
  list_to_yojson country_launch_status_information_to_yojson tree

let describe_rcs_agent_country_launch_status_result_to_yojson
    (x : describe_rcs_agent_country_launch_status_result) =
  assoc_to_yojson
    [
      ("NextToken", option_to_yojson next_token_to_yojson x.next_token);
      ( "CountryLaunchStatus",
        option_to_yojson country_launch_status_information_list_to_yojson x.country_launch_status );
      ("RcsAgentArn", Some (Smaws_Lib.Smithy_api.Json_serializers.string__to_yojson x.rcs_agent_arn));
      ("RcsAgentId", Some (Smaws_Lib.Smithy_api.Json_serializers.string__to_yojson x.rcs_agent_id));
    ]

let country_launch_status_filter_name_to_yojson (x : country_launch_status_filter_name) =
  match x with COUNTRY_LAUNCH_STATUS -> `String "country-launch-status"

let country_launch_status_filter_to_yojson (x : country_launch_status_filter) =
  assoc_to_yojson
    [
      ("Values", Some (filter_value_list_to_yojson x.values));
      ("Name", Some (country_launch_status_filter_name_to_yojson x.name));
    ]

let country_launch_status_filter_list_to_yojson tree =
  list_to_yojson country_launch_status_filter_to_yojson tree

let describe_rcs_agent_country_launch_status_request_to_yojson
    (x : describe_rcs_agent_country_launch_status_request) =
  assoc_to_yojson
    [
      ("NextToken", option_to_yojson next_token_to_yojson x.next_token);
      ("MaxResults", option_to_yojson max_results_to_yojson x.max_results);
      ("Filters", option_to_yojson country_launch_status_filter_list_to_yojson x.filters);
      ("IsoCountryCodes", option_to_yojson iso_country_code_list_to_yojson x.iso_country_codes);
      ("RcsAgentId", Some (rcs_agent_id_or_arn_to_yojson x.rcs_agent_id));
    ]

let describe_protect_configurations_result_to_yojson (x : describe_protect_configurations_result) =
  assoc_to_yojson
    [
      ("NextToken", option_to_yojson next_token_to_yojson x.next_token);
      ( "ProtectConfigurations",
        option_to_yojson protect_configuration_information_list_to_yojson x.protect_configurations
      );
    ]

let describe_protect_configurations_request_to_yojson (x : describe_protect_configurations_request)
    =
  assoc_to_yojson
    [
      ("MaxResults", option_to_yojson max_results_to_yojson x.max_results);
      ("NextToken", option_to_yojson next_token_to_yojson x.next_token);
      ("Filters", option_to_yojson protect_configuration_filter_list_to_yojson x.filters);
      ( "ProtectConfigurationIds",
        option_to_yojson protect_configuration_id_list_to_yojson x.protect_configuration_ids );
    ]

let describe_pools_result_to_yojson (x : describe_pools_result) =
  assoc_to_yojson
    [
      ("NextToken", option_to_yojson next_token_to_yojson x.next_token);
      ("Pools", option_to_yojson pool_information_list_to_yojson x.pools);
    ]

let describe_pools_request_to_yojson (x : describe_pools_request) =
  assoc_to_yojson
    [
      ("Owner", option_to_yojson owner_to_yojson x.owner);
      ("MaxResults", option_to_yojson max_results_to_yojson x.max_results);
      ("NextToken", option_to_yojson next_token_to_yojson x.next_token);
      ("Filters", option_to_yojson pool_filter_list_to_yojson x.filters);
      ("PoolIds", option_to_yojson pool_id_list_to_yojson x.pool_ids);
    ]

let phone_number_information_to_yojson (x : phone_number_information) =
  assoc_to_yojson
    [
      ( "CreatedTimestamp",
        Some
          (Smaws_Lib.Smithy_api.Json_serializers.timestamp_epoch_seconds_to_yojson
             x.created_timestamp) );
      ( "RegistrationId",
        option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.string__to_yojson x.registration_id
      );
      ("PoolId", option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.string__to_yojson x.pool_id);
      ( "DeletionProtectionEnabled",
        Some
          (Smaws_Lib.Smithy_api.Json_serializers.primitive_boolean_to_yojson
             x.deletion_protection_enabled) );
      ( "InternationalSendingEnabled",
        option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.primitive_boolean_to_yojson
          x.international_sending_enabled );
      ("OptOutListName", Some (opt_out_list_name_to_yojson x.opt_out_list_name));
      ( "SelfManagedOptOutsEnabled",
        Some
          (Smaws_Lib.Smithy_api.Json_serializers.primitive_boolean_to_yojson
             x.self_managed_opt_outs_enabled) );
      ("TwoWayChannelRole", option_to_yojson iam_role_arn_to_yojson x.two_way_channel_role);
      ("TwoWayChannelArn", option_to_yojson two_way_channel_arn_to_yojson x.two_way_channel_arn);
      ( "TwoWayEnabled",
        Some (Smaws_Lib.Smithy_api.Json_serializers.primitive_boolean_to_yojson x.two_way_enabled)
      );
      ( "MonthlyLeasingPrice",
        Some (Smaws_Lib.Smithy_api.Json_serializers.string__to_yojson x.monthly_leasing_price) );
      ("NumberType", Some (number_type_to_yojson x.number_type));
      ("NumberCapabilities", Some (number_capability_list_to_yojson x.number_capabilities));
      ("MessageType", Some (message_type_to_yojson x.message_type));
      ("IsoCountryCode", Some (iso_country_code_to_yojson x.iso_country_code));
      ("Status", Some (number_status_to_yojson x.status));
      ("PhoneNumber", Some (phone_number_to_yojson x.phone_number));
      ( "PhoneNumberId",
        option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.string__to_yojson x.phone_number_id
      );
      ( "PhoneNumberArn",
        Some (Smaws_Lib.Smithy_api.Json_serializers.string__to_yojson x.phone_number_arn) );
    ]

let phone_number_information_list_to_yojson tree =
  list_to_yojson phone_number_information_to_yojson tree

let describe_phone_numbers_result_to_yojson (x : describe_phone_numbers_result) =
  assoc_to_yojson
    [
      ("NextToken", option_to_yojson next_token_to_yojson x.next_token);
      ("PhoneNumbers", option_to_yojson phone_number_information_list_to_yojson x.phone_numbers);
    ]

let phone_number_id_list_to_yojson tree = list_to_yojson phone_number_id_or_arn_to_yojson tree

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
      ("Values", Some (filter_value_list_to_yojson x.values));
      ("Name", Some (phone_number_filter_name_to_yojson x.name));
    ]

let phone_number_filter_list_to_yojson tree = list_to_yojson phone_number_filter_to_yojson tree

let describe_phone_numbers_request_to_yojson (x : describe_phone_numbers_request) =
  assoc_to_yojson
    [
      ("Owner", option_to_yojson owner_to_yojson x.owner);
      ("MaxResults", option_to_yojson max_results_to_yojson x.max_results);
      ("NextToken", option_to_yojson next_token_to_yojson x.next_token);
      ("Filters", option_to_yojson phone_number_filter_list_to_yojson x.filters);
      ("PhoneNumberIds", option_to_yojson phone_number_id_list_to_yojson x.phone_number_ids);
    ]

let opt_out_list_information_to_yojson (x : opt_out_list_information) =
  assoc_to_yojson
    [
      ( "CreatedTimestamp",
        Some
          (Smaws_Lib.Smithy_api.Json_serializers.timestamp_epoch_seconds_to_yojson
             x.created_timestamp) );
      ("OptOutListName", Some (opt_out_list_name_to_yojson x.opt_out_list_name));
      ( "OptOutListArn",
        Some (Smaws_Lib.Smithy_api.Json_serializers.string__to_yojson x.opt_out_list_arn) );
    ]

let opt_out_list_information_list_to_yojson tree =
  list_to_yojson opt_out_list_information_to_yojson tree

let describe_opt_out_lists_result_to_yojson (x : describe_opt_out_lists_result) =
  assoc_to_yojson
    [
      ("NextToken", option_to_yojson next_token_to_yojson x.next_token);
      ("OptOutLists", option_to_yojson opt_out_list_information_list_to_yojson x.opt_out_lists);
    ]

let opt_out_list_name_list_to_yojson tree = list_to_yojson opt_out_list_name_or_arn_to_yojson tree

let describe_opt_out_lists_request_to_yojson (x : describe_opt_out_lists_request) =
  assoc_to_yojson
    [
      ("Owner", option_to_yojson owner_to_yojson x.owner);
      ("MaxResults", option_to_yojson max_results_to_yojson x.max_results);
      ("NextToken", option_to_yojson next_token_to_yojson x.next_token);
      ("OptOutListNames", option_to_yojson opt_out_list_name_list_to_yojson x.opt_out_list_names);
    ]

let opted_out_number_information_to_yojson (x : opted_out_number_information) =
  assoc_to_yojson
    [
      ( "EndUserOptedOut",
        Some
          (Smaws_Lib.Smithy_api.Json_serializers.primitive_boolean_to_yojson x.end_user_opted_out)
      );
      ( "OptedOutTimestamp",
        Some
          (Smaws_Lib.Smithy_api.Json_serializers.timestamp_epoch_seconds_to_yojson
             x.opted_out_timestamp) );
      ("OptedOutNumber", Some (phone_number_to_yojson x.opted_out_number));
    ]

let opted_out_number_information_list_to_yojson tree =
  list_to_yojson opted_out_number_information_to_yojson tree

let describe_opted_out_numbers_result_to_yojson (x : describe_opted_out_numbers_result) =
  assoc_to_yojson
    [
      ("NextToken", option_to_yojson next_token_to_yojson x.next_token);
      ( "OptedOutNumbers",
        option_to_yojson opted_out_number_information_list_to_yojson x.opted_out_numbers );
      ("OptOutListName", option_to_yojson opt_out_list_name_to_yojson x.opt_out_list_name);
      ( "OptOutListArn",
        option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.string__to_yojson x.opt_out_list_arn
      );
    ]

let opted_out_number_list_to_yojson tree = list_to_yojson phone_number_to_yojson tree

let opted_out_filter_name_to_yojson (x : opted_out_filter_name) =
  match x with END_USER_OPTED_OUT -> `String "end-user-opted-out"

let opted_out_filter_to_yojson (x : opted_out_filter) =
  assoc_to_yojson
    [
      ("Values", Some (filter_value_list_to_yojson x.values));
      ("Name", Some (opted_out_filter_name_to_yojson x.name));
    ]

let opted_out_filter_list_to_yojson tree = list_to_yojson opted_out_filter_to_yojson tree

let describe_opted_out_numbers_request_to_yojson (x : describe_opted_out_numbers_request) =
  assoc_to_yojson
    [
      ("MaxResults", option_to_yojson max_results_to_yojson x.max_results);
      ("NextToken", option_to_yojson next_token_to_yojson x.next_token);
      ("Filters", option_to_yojson opted_out_filter_list_to_yojson x.filters);
      ("OptedOutNumbers", option_to_yojson opted_out_number_list_to_yojson x.opted_out_numbers);
      ("OptOutListName", Some (opt_out_list_name_or_arn_to_yojson x.opt_out_list_name));
    ]

let notify_template_version_to_yojson = int_to_yojson

let notify_template_type_to_yojson (x : notify_template_type) =
  match x with OTP_VERIFICATION -> `String "OTP_VERIFICATION"

let notify_configuration_tier_list_to_yojson tree =
  list_to_yojson notify_configuration_tier_to_yojson tree

let notify_template_status_to_yojson (x : notify_template_status) =
  match x with ACTIVE -> `String "ACTIVE" | INACTIVE -> `String "INACTIVE"

let notify_language_code_to_yojson = string_to_yojson

let notify_template_information_to_yojson (x : notify_template_information) =
  assoc_to_yojson
    [
      ( "CreatedTimestamp",
        Some
          (Smaws_Lib.Smithy_api.Json_serializers.timestamp_epoch_seconds_to_yojson
             x.created_timestamp) );
      ("SupportedVoiceIds", option_to_yojson voice_id_list_to_yojson x.supported_voice_ids);
      ("Variables", option_to_yojson template_variables_map_to_yojson x.variables);
      ("Content", option_to_yojson template_content_to_yojson x.content);
      ("LanguageCode", option_to_yojson notify_language_code_to_yojson x.language_code);
      ("SupportedCountries", option_to_yojson iso_country_code_list_to_yojson x.supported_countries);
      ("Status", option_to_yojson notify_template_status_to_yojson x.status);
      ("TierAccess", option_to_yojson notify_configuration_tier_list_to_yojson x.tier_access);
      ("Channels", Some (number_capability_list_to_yojson x.channels));
      ("TemplateType", Some (notify_template_type_to_yojson x.template_type));
      ("Version", Some (notify_template_version_to_yojson x.version));
      ("TemplateId", Some (notify_template_id_to_yojson x.template_id));
    ]

let notify_template_information_list_to_yojson tree =
  list_to_yojson notify_template_information_to_yojson tree

let describe_notify_templates_result_to_yojson (x : describe_notify_templates_result) =
  assoc_to_yojson
    [
      ("NextToken", option_to_yojson next_token_to_yojson x.next_token);
      ( "NotifyTemplates",
        option_to_yojson notify_template_information_list_to_yojson x.notify_templates );
    ]

let notify_template_id_list_to_yojson tree = list_to_yojson notify_template_id_to_yojson tree

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
      ("Values", Some (filter_value_list_to_yojson x.values));
      ("Name", Some (notify_template_filter_name_to_yojson x.name));
    ]

let notify_template_filter_list_to_yojson tree =
  list_to_yojson notify_template_filter_to_yojson tree

let describe_notify_templates_request_to_yojson (x : describe_notify_templates_request) =
  assoc_to_yojson
    [
      ("MaxResults", option_to_yojson max_results_to_yojson x.max_results);
      ("NextToken", option_to_yojson next_token_to_yojson x.next_token);
      ("Filters", option_to_yojson notify_template_filter_list_to_yojson x.filters);
      ("TemplateIds", option_to_yojson notify_template_id_list_to_yojson x.template_ids);
    ]

let notify_configuration_information_to_yojson (x : notify_configuration_information) =
  assoc_to_yojson
    [
      ( "CreatedTimestamp",
        Some
          (Smaws_Lib.Smithy_api.Json_serializers.timestamp_epoch_seconds_to_yojson
             x.created_timestamp) );
      ( "DeletionProtectionEnabled",
        Some
          (Smaws_Lib.Smithy_api.Json_serializers.primitive_boolean_to_yojson
             x.deletion_protection_enabled) );
      ( "RejectionReason",
        option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.string__to_yojson x.rejection_reason
      );
      ("Status", Some (notify_configuration_status_to_yojson x.status));
      ("TierUpgradeStatus", Some (tier_upgrade_status_to_yojson x.tier_upgrade_status));
      ("Tier", Some (notify_configuration_tier_to_yojson x.tier));
      ("EnabledChannels", Some (notify_enabled_channels_list_to_yojson x.enabled_channels));
      ("EnabledCountries", option_to_yojson iso_country_code_list_to_yojson x.enabled_countries);
      ("PoolId", option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.string__to_yojson x.pool_id);
      ("DefaultTemplateId", option_to_yojson notify_template_id_to_yojson x.default_template_id);
      ("UseCase", Some (notify_configuration_use_case_to_yojson x.use_case));
      ("DisplayName", Some (notify_configuration_display_name_to_yojson x.display_name));
      ("NotifyConfigurationId", Some (notify_configuration_id_to_yojson x.notify_configuration_id));
      ( "NotifyConfigurationArn",
        Some (notify_configuration_arn_to_yojson x.notify_configuration_arn) );
    ]

let notify_configuration_information_list_to_yojson tree =
  list_to_yojson notify_configuration_information_to_yojson tree

let describe_notify_configurations_result_to_yojson (x : describe_notify_configurations_result) =
  assoc_to_yojson
    [
      ("NextToken", option_to_yojson next_token_to_yojson x.next_token);
      ( "NotifyConfigurations",
        option_to_yojson notify_configuration_information_list_to_yojson x.notify_configurations );
    ]

let notify_configuration_id_list_to_yojson tree =
  list_to_yojson notify_configuration_id_or_arn_to_yojson tree

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
      ("Values", Some (filter_value_list_to_yojson x.values));
      ("Name", Some (notify_configuration_filter_name_to_yojson x.name));
    ]

let notify_configuration_filter_list_to_yojson tree =
  list_to_yojson notify_configuration_filter_to_yojson tree

let describe_notify_configurations_request_to_yojson (x : describe_notify_configurations_request) =
  assoc_to_yojson
    [
      ("MaxResults", option_to_yojson max_results_to_yojson x.max_results);
      ("NextToken", option_to_yojson next_token_to_yojson x.next_token);
      ("Filters", option_to_yojson notify_configuration_filter_list_to_yojson x.filters);
      ( "NotifyConfigurationIds",
        option_to_yojson notify_configuration_id_list_to_yojson x.notify_configuration_ids );
    ]

let keyword_information_to_yojson (x : keyword_information) =
  assoc_to_yojson
    [
      ("KeywordAction", Some (keyword_action_to_yojson x.keyword_action));
      ("KeywordMessage", Some (keyword_message_to_yojson x.keyword_message));
      ("Keyword", Some (keyword_to_yojson x.keyword));
    ]

let keyword_information_list_to_yojson tree = list_to_yojson keyword_information_to_yojson tree

let describe_keywords_result_to_yojson (x : describe_keywords_result) =
  assoc_to_yojson
    [
      ("NextToken", option_to_yojson next_token_to_yojson x.next_token);
      ("Keywords", option_to_yojson keyword_information_list_to_yojson x.keywords);
      ( "OriginationIdentity",
        option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.string__to_yojson
          x.origination_identity );
      ( "OriginationIdentityArn",
        option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.string__to_yojson
          x.origination_identity_arn );
    ]

let keyword_list_to_yojson tree = list_to_yojson keyword_to_yojson tree

let keyword_filter_name_to_yojson (x : keyword_filter_name) =
  match x with KEYWORD_ACTION -> `String "keyword-action"

let keyword_filter_to_yojson (x : keyword_filter) =
  assoc_to_yojson
    [
      ("Values", Some (filter_value_list_to_yojson x.values));
      ("Name", Some (keyword_filter_name_to_yojson x.name));
    ]

let keyword_filter_list_to_yojson tree = list_to_yojson keyword_filter_to_yojson tree

let describe_keywords_request_to_yojson (x : describe_keywords_request) =
  assoc_to_yojson
    [
      ("MaxResults", option_to_yojson max_results_to_yojson x.max_results);
      ("NextToken", option_to_yojson next_token_to_yojson x.next_token);
      ("Filters", option_to_yojson keyword_filter_list_to_yojson x.filters);
      ("Keywords", option_to_yojson keyword_list_to_yojson x.keywords);
      ("OriginationIdentity", Some (phone_or_pool_id_or_arn_to_yojson x.origination_identity));
    ]

let event_destination_list_to_yojson tree = list_to_yojson event_destination_to_yojson tree

let configuration_set_information_to_yojson (x : configuration_set_information) =
  assoc_to_yojson
    [
      ( "ProtectConfigurationId",
        option_to_yojson protect_configuration_id_or_arn_to_yojson x.protect_configuration_id );
      ( "CreatedTimestamp",
        Some
          (Smaws_Lib.Smithy_api.Json_serializers.timestamp_epoch_seconds_to_yojson
             x.created_timestamp) );
      ( "DefaultMessageFeedbackEnabled",
        option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.boolean__to_yojson
          x.default_message_feedback_enabled );
      ("DefaultSenderId", option_to_yojson sender_id_to_yojson x.default_sender_id);
      ("DefaultMessageType", option_to_yojson message_type_to_yojson x.default_message_type);
      ("EventDestinations", Some (event_destination_list_to_yojson x.event_destinations));
      ("ConfigurationSetName", Some (configuration_set_name_to_yojson x.configuration_set_name));
      ( "ConfigurationSetArn",
        Some (Smaws_Lib.Smithy_api.Json_serializers.string__to_yojson x.configuration_set_arn) );
    ]

let configuration_set_information_list_to_yojson tree =
  list_to_yojson configuration_set_information_to_yojson tree

let describe_configuration_sets_result_to_yojson (x : describe_configuration_sets_result) =
  assoc_to_yojson
    [
      ("NextToken", option_to_yojson next_token_to_yojson x.next_token);
      ( "ConfigurationSets",
        option_to_yojson configuration_set_information_list_to_yojson x.configuration_sets );
    ]

let configuration_set_name_list_to_yojson tree =
  list_to_yojson configuration_set_name_or_arn_to_yojson tree

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
      ("Values", Some (filter_value_list_to_yojson x.values));
      ("Name", Some (configuration_set_filter_name_to_yojson x.name));
    ]

let configuration_set_filter_list_to_yojson tree =
  list_to_yojson configuration_set_filter_to_yojson tree

let describe_configuration_sets_request_to_yojson (x : describe_configuration_sets_request) =
  assoc_to_yojson
    [
      ("MaxResults", option_to_yojson max_results_to_yojson x.max_results);
      ("NextToken", option_to_yojson next_token_to_yojson x.next_token);
      ("Filters", option_to_yojson configuration_set_filter_list_to_yojson x.filters);
      ( "ConfigurationSetNames",
        option_to_yojson configuration_set_name_list_to_yojson x.configuration_set_names );
    ]

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
      ("Max", Some (Smaws_Lib.Smithy_api.Json_serializers.primitive_long_to_yojson x.max));
      ("Used", Some (Smaws_Lib.Smithy_api.Json_serializers.primitive_long_to_yojson x.used));
      ("Name", Some (account_limit_name_to_yojson x.name));
    ]

let account_limit_list_to_yojson tree = list_to_yojson account_limit_to_yojson tree

let describe_account_limits_result_to_yojson (x : describe_account_limits_result) =
  assoc_to_yojson
    [
      ("NextToken", option_to_yojson next_token_to_yojson x.next_token);
      ("AccountLimits", option_to_yojson account_limit_list_to_yojson x.account_limits);
    ]

let describe_account_limits_request_to_yojson (x : describe_account_limits_request) =
  assoc_to_yojson
    [
      ("MaxResults", option_to_yojson max_results_to_yojson x.max_results);
      ("NextToken", option_to_yojson next_token_to_yojson x.next_token);
    ]

let account_attribute_name_to_yojson (x : account_attribute_name) =
  match x with
  | ACCOUNT_TIER -> `String "ACCOUNT_TIER"
  | DEFAULT_PROTECT_CONFIGURATION_ID -> `String "DEFAULT_PROTECT_CONFIGURATION_ID"

let account_attribute_to_yojson (x : account_attribute) =
  assoc_to_yojson
    [
      ("Value", Some (Smaws_Lib.Smithy_api.Json_serializers.string__to_yojson x.value));
      ("Name", Some (account_attribute_name_to_yojson x.name));
    ]

let account_attribute_list_to_yojson tree = list_to_yojson account_attribute_to_yojson tree

let describe_account_attributes_result_to_yojson (x : describe_account_attributes_result) =
  assoc_to_yojson
    [
      ("NextToken", option_to_yojson next_token_to_yojson x.next_token);
      ("AccountAttributes", option_to_yojson account_attribute_list_to_yojson x.account_attributes);
    ]

let describe_account_attributes_request_to_yojson (x : describe_account_attributes_request) =
  assoc_to_yojson
    [
      ("MaxResults", option_to_yojson max_results_to_yojson x.max_results);
      ("NextToken", option_to_yojson next_token_to_yojson x.next_token);
    ]

let delete_voice_message_spend_limit_override_result_to_yojson
    (x : delete_voice_message_spend_limit_override_result) =
  assoc_to_yojson [ ("MonthlyLimit", option_to_yojson monthly_limit_to_yojson x.monthly_limit) ]

let delete_voice_message_spend_limit_override_request_to_yojson = unit_to_yojson

let delete_verified_destination_number_result_to_yojson
    (x : delete_verified_destination_number_result) =
  assoc_to_yojson
    [
      ( "CreatedTimestamp",
        Some
          (Smaws_Lib.Smithy_api.Json_serializers.timestamp_epoch_seconds_to_yojson
             x.created_timestamp) );
      ("DestinationPhoneNumber", Some (phone_number_to_yojson x.destination_phone_number));
      ( "VerifiedDestinationNumberId",
        Some
          (Smaws_Lib.Smithy_api.Json_serializers.string__to_yojson x.verified_destination_number_id)
      );
      ( "VerifiedDestinationNumberArn",
        Some
          (Smaws_Lib.Smithy_api.Json_serializers.string__to_yojson x.verified_destination_number_arn)
      );
    ]

let delete_verified_destination_number_request_to_yojson
    (x : delete_verified_destination_number_request) =
  assoc_to_yojson
    [
      ( "VerifiedDestinationNumberId",
        Some (verified_destination_number_id_or_arn_to_yojson x.verified_destination_number_id) );
    ]

let delete_text_message_spend_limit_override_result_to_yojson
    (x : delete_text_message_spend_limit_override_result) =
  assoc_to_yojson [ ("MonthlyLimit", option_to_yojson monthly_limit_to_yojson x.monthly_limit) ]

let delete_text_message_spend_limit_override_request_to_yojson = unit_to_yojson

let delete_resource_policy_result_to_yojson (x : delete_resource_policy_result) =
  assoc_to_yojson
    [
      ( "CreatedTimestamp",
        option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.timestamp_epoch_seconds_to_yojson
          x.created_timestamp );
      ("Policy", option_to_yojson resource_policy_to_yojson x.policy);
      ("ResourceArn", option_to_yojson amazon_resource_name_to_yojson x.resource_arn);
    ]

let delete_resource_policy_request_to_yojson (x : delete_resource_policy_request) =
  assoc_to_yojson [ ("ResourceArn", Some (amazon_resource_name_to_yojson x.resource_arn)) ]

let delete_registration_field_value_result_to_yojson (x : delete_registration_field_value_result) =
  assoc_to_yojson
    [
      ( "RegistrationAttachmentId",
        option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.string__to_yojson
          x.registration_attachment_id );
      ("TextValue", option_to_yojson text_value_to_yojson x.text_value);
      ("SelectChoices", option_to_yojson select_choice_list_to_yojson x.select_choices);
      ("FieldPath", Some (field_path_to_yojson x.field_path));
      ("VersionNumber", Some (registration_version_number_to_yojson x.version_number));
      ( "RegistrationId",
        Some (Smaws_Lib.Smithy_api.Json_serializers.string__to_yojson x.registration_id) );
      ( "RegistrationArn",
        Some (Smaws_Lib.Smithy_api.Json_serializers.string__to_yojson x.registration_arn) );
    ]

let delete_registration_field_value_request_to_yojson (x : delete_registration_field_value_request)
    =
  assoc_to_yojson
    [
      ("FieldPath", Some (field_path_to_yojson x.field_path));
      ("RegistrationId", Some (registration_id_or_arn_to_yojson x.registration_id));
    ]

let delete_registration_attachment_result_to_yojson (x : delete_registration_attachment_result) =
  assoc_to_yojson
    [
      ( "CreatedTimestamp",
        Some
          (Smaws_Lib.Smithy_api.Json_serializers.timestamp_epoch_seconds_to_yojson
             x.created_timestamp) );
      ( "AttachmentUploadErrorReason",
        option_to_yojson attachment_upload_error_reason_to_yojson x.attachment_upload_error_reason
      );
      ("AttachmentStatus", Some (attachment_status_to_yojson x.attachment_status));
      ( "RegistrationAttachmentId",
        Some (Smaws_Lib.Smithy_api.Json_serializers.string__to_yojson x.registration_attachment_id)
      );
      ( "RegistrationAttachmentArn",
        Some (Smaws_Lib.Smithy_api.Json_serializers.string__to_yojson x.registration_attachment_arn)
      );
    ]

let delete_registration_attachment_request_to_yojson (x : delete_registration_attachment_request) =
  assoc_to_yojson
    [
      ( "RegistrationAttachmentId",
        Some (registration_attachment_id_or_arn_to_yojson x.registration_attachment_id) );
    ]

let delete_registration_result_to_yojson (x : delete_registration_result) =
  assoc_to_yojson
    [
      ( "CreatedTimestamp",
        Some
          (Smaws_Lib.Smithy_api.Json_serializers.timestamp_epoch_seconds_to_yojson
             x.created_timestamp) );
      ("AdditionalAttributes", option_to_yojson string_map_to_yojson x.additional_attributes);
      ( "LatestDeniedVersionNumber",
        option_to_yojson registration_version_number_to_yojson x.latest_denied_version_number );
      ( "ApprovedVersionNumber",
        option_to_yojson registration_version_number_to_yojson x.approved_version_number );
      ("CurrentVersionNumber", Some (registration_version_number_to_yojson x.current_version_number));
      ("RegistrationStatus", Some (registration_status_to_yojson x.registration_status));
      ("RegistrationType", Some (registration_type_to_yojson x.registration_type));
      ( "RegistrationId",
        Some (Smaws_Lib.Smithy_api.Json_serializers.string__to_yojson x.registration_id) );
      ( "RegistrationArn",
        Some (Smaws_Lib.Smithy_api.Json_serializers.string__to_yojson x.registration_arn) );
    ]

let delete_registration_request_to_yojson (x : delete_registration_request) =
  assoc_to_yojson [ ("RegistrationId", Some (registration_id_or_arn_to_yojson x.registration_id)) ]

let delete_rcs_message_spend_limit_override_result_to_yojson
    (x : delete_rcs_message_spend_limit_override_result) =
  assoc_to_yojson [ ("MonthlyLimit", option_to_yojson monthly_limit_to_yojson x.monthly_limit) ]

let delete_rcs_message_spend_limit_override_request_to_yojson = unit_to_yojson

let delete_rcs_agent_result_to_yojson (x : delete_rcs_agent_result) =
  assoc_to_yojson
    [
      ( "TwoWayRcsEventsEnabled",
        option_to_yojson rcs_event_type_list_to_yojson x.two_way_rcs_events_enabled );
      ( "TwoWayEnabled",
        Some (Smaws_Lib.Smithy_api.Json_serializers.primitive_boolean_to_yojson x.two_way_enabled)
      );
      ("TwoWayChannelRole", option_to_yojson iam_role_arn_to_yojson x.two_way_channel_role);
      ("TwoWayChannelArn", option_to_yojson two_way_channel_arn_to_yojson x.two_way_channel_arn);
      ( "SelfManagedOptOutsEnabled",
        Some
          (Smaws_Lib.Smithy_api.Json_serializers.primitive_boolean_to_yojson
             x.self_managed_opt_outs_enabled) );
      ("OptOutListName", option_to_yojson opt_out_list_name_to_yojson x.opt_out_list_name);
      ( "DeletionProtectionEnabled",
        Some
          (Smaws_Lib.Smithy_api.Json_serializers.primitive_boolean_to_yojson
             x.deletion_protection_enabled) );
      ( "CreatedTimestamp",
        Some
          (Smaws_Lib.Smithy_api.Json_serializers.timestamp_epoch_seconds_to_yojson
             x.created_timestamp) );
      ("Status", Some (rcs_agent_status_to_yojson x.status));
      ("RcsAgentId", Some (Smaws_Lib.Smithy_api.Json_serializers.string__to_yojson x.rcs_agent_id));
      ("RcsAgentArn", Some (Smaws_Lib.Smithy_api.Json_serializers.string__to_yojson x.rcs_agent_arn));
    ]

let delete_rcs_agent_request_to_yojson (x : delete_rcs_agent_request) =
  assoc_to_yojson [ ("RcsAgentId", Some (rcs_agent_id_or_arn_to_yojson x.rcs_agent_id)) ]

let delete_protect_configuration_rule_set_number_override_result_to_yojson
    (x : delete_protect_configuration_rule_set_number_override_result) =
  assoc_to_yojson
    [
      ( "ExpirationTimestamp",
        option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.timestamp_epoch_seconds_to_yojson
          x.expiration_timestamp );
      ("IsoCountryCode", option_to_yojson iso_country_code_to_yojson x.iso_country_code);
      ("Action", Some (protect_configuration_rule_override_action_to_yojson x.action));
      ( "CreatedTimestamp",
        Some
          (Smaws_Lib.Smithy_api.Json_serializers.timestamp_epoch_seconds_to_yojson
             x.created_timestamp) );
      ("DestinationPhoneNumber", Some (phone_number_to_yojson x.destination_phone_number));
      ( "ProtectConfigurationId",
        Some (protect_configuration_id_to_yojson x.protect_configuration_id) );
      ( "ProtectConfigurationArn",
        Some (protect_configuration_arn_to_yojson x.protect_configuration_arn) );
    ]

let delete_protect_configuration_rule_set_number_override_request_to_yojson
    (x : delete_protect_configuration_rule_set_number_override_request) =
  assoc_to_yojson
    [
      ("DestinationPhoneNumber", Some (phone_number_to_yojson x.destination_phone_number));
      ( "ProtectConfigurationId",
        Some (protect_configuration_id_or_arn_to_yojson x.protect_configuration_id) );
    ]

let delete_protect_configuration_result_to_yojson (x : delete_protect_configuration_result) =
  assoc_to_yojson
    [
      ( "DeletionProtectionEnabled",
        Some
          (Smaws_Lib.Smithy_api.Json_serializers.primitive_boolean_to_yojson
             x.deletion_protection_enabled) );
      ( "AccountDefault",
        Some (Smaws_Lib.Smithy_api.Json_serializers.primitive_boolean_to_yojson x.account_default)
      );
      ( "CreatedTimestamp",
        Some
          (Smaws_Lib.Smithy_api.Json_serializers.timestamp_epoch_seconds_to_yojson
             x.created_timestamp) );
      ( "ProtectConfigurationId",
        Some (protect_configuration_id_to_yojson x.protect_configuration_id) );
      ( "ProtectConfigurationArn",
        Some (protect_configuration_arn_to_yojson x.protect_configuration_arn) );
    ]

let delete_protect_configuration_request_to_yojson (x : delete_protect_configuration_request) =
  assoc_to_yojson
    [
      ( "ProtectConfigurationId",
        Some (protect_configuration_id_or_arn_to_yojson x.protect_configuration_id) );
    ]

let delete_pool_result_to_yojson (x : delete_pool_result) =
  assoc_to_yojson
    [
      ( "CreatedTimestamp",
        option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.timestamp_epoch_seconds_to_yojson
          x.created_timestamp );
      ( "SharedRoutesEnabled",
        option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.primitive_boolean_to_yojson
          x.shared_routes_enabled );
      ("OptOutListName", option_to_yojson opt_out_list_name_to_yojson x.opt_out_list_name);
      ( "SelfManagedOptOutsEnabled",
        option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.primitive_boolean_to_yojson
          x.self_managed_opt_outs_enabled );
      ("TwoWayChannelRole", option_to_yojson iam_role_arn_to_yojson x.two_way_channel_role);
      ("TwoWayChannelArn", option_to_yojson two_way_channel_arn_to_yojson x.two_way_channel_arn);
      ( "TwoWayEnabled",
        option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.primitive_boolean_to_yojson
          x.two_way_enabled );
      ("MessageType", option_to_yojson message_type_to_yojson x.message_type);
      ("Status", option_to_yojson pool_status_to_yojson x.status);
      ("PoolId", option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.string__to_yojson x.pool_id);
      ( "PoolArn",
        option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.string__to_yojson x.pool_arn );
    ]

let delete_pool_request_to_yojson (x : delete_pool_request) =
  assoc_to_yojson [ ("PoolId", Some (pool_id_or_arn_to_yojson x.pool_id)) ]

let delete_opt_out_list_result_to_yojson (x : delete_opt_out_list_result) =
  assoc_to_yojson
    [
      ( "CreatedTimestamp",
        option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.timestamp_epoch_seconds_to_yojson
          x.created_timestamp );
      ("OptOutListName", option_to_yojson opt_out_list_name_to_yojson x.opt_out_list_name);
      ( "OptOutListArn",
        option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.string__to_yojson x.opt_out_list_arn
      );
    ]

let delete_opt_out_list_request_to_yojson (x : delete_opt_out_list_request) =
  assoc_to_yojson
    [ ("OptOutListName", Some (opt_out_list_name_or_arn_to_yojson x.opt_out_list_name)) ]

let delete_opted_out_number_result_to_yojson (x : delete_opted_out_number_result) =
  assoc_to_yojson
    [
      ( "EndUserOptedOut",
        option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.primitive_boolean_to_yojson
          x.end_user_opted_out );
      ( "OptedOutTimestamp",
        option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.timestamp_epoch_seconds_to_yojson
          x.opted_out_timestamp );
      ("OptedOutNumber", option_to_yojson phone_number_to_yojson x.opted_out_number);
      ("OptOutListName", option_to_yojson opt_out_list_name_to_yojson x.opt_out_list_name);
      ( "OptOutListArn",
        option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.string__to_yojson x.opt_out_list_arn
      );
    ]

let delete_opted_out_number_request_to_yojson (x : delete_opted_out_number_request) =
  assoc_to_yojson
    [
      ("OptedOutNumber", Some (phone_number_to_yojson x.opted_out_number));
      ("OptOutListName", Some (opt_out_list_name_or_arn_to_yojson x.opt_out_list_name));
    ]

let delete_notify_message_spend_limit_override_result_to_yojson
    (x : delete_notify_message_spend_limit_override_result) =
  assoc_to_yojson [ ("MonthlyLimit", option_to_yojson monthly_limit_to_yojson x.monthly_limit) ]

let delete_notify_message_spend_limit_override_request_to_yojson = unit_to_yojson

let delete_notify_configuration_result_to_yojson (x : delete_notify_configuration_result) =
  assoc_to_yojson
    [
      ( "CreatedTimestamp",
        Some
          (Smaws_Lib.Smithy_api.Json_serializers.timestamp_epoch_seconds_to_yojson
             x.created_timestamp) );
      ( "DeletionProtectionEnabled",
        Some
          (Smaws_Lib.Smithy_api.Json_serializers.primitive_boolean_to_yojson
             x.deletion_protection_enabled) );
      ( "RejectionReason",
        option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.string__to_yojson x.rejection_reason
      );
      ("Status", Some (notify_configuration_status_to_yojson x.status));
      ("TierUpgradeStatus", Some (tier_upgrade_status_to_yojson x.tier_upgrade_status));
      ("Tier", Some (notify_configuration_tier_to_yojson x.tier));
      ("EnabledChannels", Some (notify_enabled_channels_list_to_yojson x.enabled_channels));
      ("EnabledCountries", option_to_yojson iso_country_code_list_to_yojson x.enabled_countries);
      ("PoolId", option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.string__to_yojson x.pool_id);
      ("DefaultTemplateId", option_to_yojson notify_template_id_to_yojson x.default_template_id);
      ("UseCase", Some (notify_configuration_use_case_to_yojson x.use_case));
      ("DisplayName", Some (notify_configuration_display_name_to_yojson x.display_name));
      ("NotifyConfigurationId", Some (notify_configuration_id_to_yojson x.notify_configuration_id));
      ( "NotifyConfigurationArn",
        Some (notify_configuration_arn_to_yojson x.notify_configuration_arn) );
    ]

let delete_notify_configuration_request_to_yojson (x : delete_notify_configuration_request) =
  assoc_to_yojson
    [
      ( "NotifyConfigurationId",
        Some (notify_configuration_id_or_arn_to_yojson x.notify_configuration_id) );
    ]

let delete_media_message_spend_limit_override_result_to_yojson
    (x : delete_media_message_spend_limit_override_result) =
  assoc_to_yojson [ ("MonthlyLimit", option_to_yojson monthly_limit_to_yojson x.monthly_limit) ]

let delete_media_message_spend_limit_override_request_to_yojson = unit_to_yojson

let delete_keyword_result_to_yojson (x : delete_keyword_result) =
  assoc_to_yojson
    [
      ("KeywordAction", option_to_yojson keyword_action_to_yojson x.keyword_action);
      ("KeywordMessage", option_to_yojson keyword_message_to_yojson x.keyword_message);
      ("Keyword", option_to_yojson keyword_to_yojson x.keyword);
      ( "OriginationIdentity",
        option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.string__to_yojson
          x.origination_identity );
      ( "OriginationIdentityArn",
        option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.string__to_yojson
          x.origination_identity_arn );
    ]

let delete_keyword_request_to_yojson (x : delete_keyword_request) =
  assoc_to_yojson
    [
      ("Keyword", Some (keyword_to_yojson x.keyword));
      ("OriginationIdentity", Some (phone_or_pool_id_or_arn_to_yojson x.origination_identity));
    ]

let delete_event_destination_result_to_yojson (x : delete_event_destination_result) =
  assoc_to_yojson
    [
      ("EventDestination", option_to_yojson event_destination_to_yojson x.event_destination);
      ( "ConfigurationSetName",
        option_to_yojson configuration_set_name_to_yojson x.configuration_set_name );
      ( "ConfigurationSetArn",
        option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.string__to_yojson
          x.configuration_set_arn );
    ]

let delete_event_destination_request_to_yojson (x : delete_event_destination_request) =
  assoc_to_yojson
    [
      ("EventDestinationName", Some (event_destination_name_to_yojson x.event_destination_name));
      ( "ConfigurationSetName",
        Some (configuration_set_name_or_arn_to_yojson x.configuration_set_name) );
    ]

let delete_default_sender_id_result_to_yojson (x : delete_default_sender_id_result) =
  assoc_to_yojson
    [
      ("SenderId", option_to_yojson sender_id_to_yojson x.sender_id);
      ( "ConfigurationSetName",
        option_to_yojson configuration_set_name_to_yojson x.configuration_set_name );
      ( "ConfigurationSetArn",
        option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.string__to_yojson
          x.configuration_set_arn );
    ]

let delete_default_sender_id_request_to_yojson (x : delete_default_sender_id_request) =
  assoc_to_yojson
    [
      ( "ConfigurationSetName",
        Some (configuration_set_name_or_arn_to_yojson x.configuration_set_name) );
    ]

let delete_default_message_type_result_to_yojson (x : delete_default_message_type_result) =
  assoc_to_yojson
    [
      ("MessageType", option_to_yojson message_type_to_yojson x.message_type);
      ( "ConfigurationSetName",
        option_to_yojson configuration_set_name_to_yojson x.configuration_set_name );
      ( "ConfigurationSetArn",
        option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.string__to_yojson
          x.configuration_set_arn );
    ]

let delete_default_message_type_request_to_yojson (x : delete_default_message_type_request) =
  assoc_to_yojson
    [
      ( "ConfigurationSetName",
        Some (configuration_set_name_or_arn_to_yojson x.configuration_set_name) );
    ]

let delete_configuration_set_result_to_yojson (x : delete_configuration_set_result) =
  assoc_to_yojson
    [
      ( "CreatedTimestamp",
        option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.timestamp_epoch_seconds_to_yojson
          x.created_timestamp );
      ( "DefaultMessageFeedbackEnabled",
        option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.boolean__to_yojson
          x.default_message_feedback_enabled );
      ("DefaultSenderId", option_to_yojson sender_id_to_yojson x.default_sender_id);
      ("DefaultMessageType", option_to_yojson message_type_to_yojson x.default_message_type);
      ("EventDestinations", option_to_yojson event_destination_list_to_yojson x.event_destinations);
      ( "ConfigurationSetName",
        option_to_yojson configuration_set_name_to_yojson x.configuration_set_name );
      ( "ConfigurationSetArn",
        option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.string__to_yojson
          x.configuration_set_arn );
    ]

let delete_configuration_set_request_to_yojson (x : delete_configuration_set_request) =
  assoc_to_yojson
    [
      ( "ConfigurationSetName",
        Some (configuration_set_name_or_arn_to_yojson x.configuration_set_name) );
    ]

let delete_account_default_protect_configuration_result_to_yojson
    (x : delete_account_default_protect_configuration_result) =
  assoc_to_yojson
    [
      ( "DefaultProtectConfigurationId",
        Some (protect_configuration_id_to_yojson x.default_protect_configuration_id) );
      ( "DefaultProtectConfigurationArn",
        Some (protect_configuration_arn_to_yojson x.default_protect_configuration_arn) );
    ]

let delete_account_default_protect_configuration_request_to_yojson = unit_to_yojson

let create_verified_destination_number_result_to_yojson
    (x : create_verified_destination_number_result) =
  assoc_to_yojson
    [
      ( "CreatedTimestamp",
        Some
          (Smaws_Lib.Smithy_api.Json_serializers.timestamp_epoch_seconds_to_yojson
             x.created_timestamp) );
      ("Tags", option_to_yojson tag_list_to_yojson x.tags);
      ( "RcsAgentId",
        option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.string__to_yojson x.rcs_agent_id );
      ("Status", Some (verification_status_to_yojson x.status));
      ("DestinationPhoneNumber", Some (phone_number_to_yojson x.destination_phone_number));
      ( "VerifiedDestinationNumberId",
        Some
          (Smaws_Lib.Smithy_api.Json_serializers.string__to_yojson x.verified_destination_number_id)
      );
      ( "VerifiedDestinationNumberArn",
        Some
          (Smaws_Lib.Smithy_api.Json_serializers.string__to_yojson x.verified_destination_number_arn)
      );
    ]

let create_verified_destination_number_request_to_yojson
    (x : create_verified_destination_number_request) =
  assoc_to_yojson
    [
      ( "ClientToken",
        Some
          (client_token_to_yojson
             (Option.value x.client_token ~default:(Smaws_Lib.Uuid.generate ()))) );
      ("Tags", option_to_yojson tag_list_to_yojson x.tags);
      ("RcsAgentId", option_to_yojson rcs_agent_id_or_arn_to_yojson x.rcs_agent_id);
      ("DestinationPhoneNumber", Some (phone_number_to_yojson x.destination_phone_number));
    ]

let create_registration_version_result_to_yojson (x : create_registration_version_result) =
  assoc_to_yojson
    [
      ( "RegistrationVersionStatusHistory",
        Some (registration_version_status_history_to_yojson x.registration_version_status_history)
      );
      ( "RegistrationVersionStatus",
        Some (registration_version_status_to_yojson x.registration_version_status) );
      ("VersionNumber", Some (registration_version_number_to_yojson x.version_number));
      ( "RegistrationId",
        Some (Smaws_Lib.Smithy_api.Json_serializers.string__to_yojson x.registration_id) );
      ( "RegistrationArn",
        Some (Smaws_Lib.Smithy_api.Json_serializers.string__to_yojson x.registration_arn) );
    ]

let create_registration_version_request_to_yojson (x : create_registration_version_request) =
  assoc_to_yojson [ ("RegistrationId", Some (registration_id_or_arn_to_yojson x.registration_id)) ]

let create_registration_attachment_result_to_yojson (x : create_registration_attachment_result) =
  assoc_to_yojson
    [
      ( "CreatedTimestamp",
        Some
          (Smaws_Lib.Smithy_api.Json_serializers.timestamp_epoch_seconds_to_yojson
             x.created_timestamp) );
      ("Tags", option_to_yojson tag_list_to_yojson x.tags);
      ("AttachmentStatus", Some (attachment_status_to_yojson x.attachment_status));
      ( "RegistrationAttachmentId",
        Some (Smaws_Lib.Smithy_api.Json_serializers.string__to_yojson x.registration_attachment_id)
      );
      ( "RegistrationAttachmentArn",
        Some (Smaws_Lib.Smithy_api.Json_serializers.string__to_yojson x.registration_attachment_arn)
      );
    ]

let attachment_body_to_yojson = blob_to_yojson
let attachment_url_to_yojson = string_to_yojson

let create_registration_attachment_request_to_yojson (x : create_registration_attachment_request) =
  assoc_to_yojson
    [
      ( "ClientToken",
        Some
          (client_token_to_yojson
             (Option.value x.client_token ~default:(Smaws_Lib.Uuid.generate ()))) );
      ("Tags", option_to_yojson tag_list_to_yojson x.tags);
      ("AttachmentUrl", option_to_yojson attachment_url_to_yojson x.attachment_url);
      ("AttachmentBody", option_to_yojson attachment_body_to_yojson x.attachment_body);
    ]

let create_registration_association_result_to_yojson (x : create_registration_association_result) =
  assoc_to_yojson
    [
      ("PhoneNumber", option_to_yojson phone_number_to_yojson x.phone_number);
      ("IsoCountryCode", option_to_yojson iso_country_code_to_yojson x.iso_country_code);
      ( "ResourceType",
        Some (Smaws_Lib.Smithy_api.Json_serializers.string__to_yojson x.resource_type) );
      ("ResourceId", Some (Smaws_Lib.Smithy_api.Json_serializers.string__to_yojson x.resource_id));
      ("ResourceArn", Some (Smaws_Lib.Smithy_api.Json_serializers.string__to_yojson x.resource_arn));
      ("RegistrationType", Some (registration_type_to_yojson x.registration_type));
      ( "RegistrationId",
        Some (Smaws_Lib.Smithy_api.Json_serializers.string__to_yojson x.registration_id) );
      ( "RegistrationArn",
        Some (Smaws_Lib.Smithy_api.Json_serializers.string__to_yojson x.registration_arn) );
    ]

let create_registration_association_request_to_yojson (x : create_registration_association_request)
    =
  assoc_to_yojson
    [
      ("ResourceId", Some (resource_id_or_arn_to_yojson x.resource_id));
      ("RegistrationId", Some (registration_id_or_arn_to_yojson x.registration_id));
    ]

let create_registration_result_to_yojson (x : create_registration_result) =
  assoc_to_yojson
    [
      ( "CreatedTimestamp",
        Some
          (Smaws_Lib.Smithy_api.Json_serializers.timestamp_epoch_seconds_to_yojson
             x.created_timestamp) );
      ("Tags", option_to_yojson tag_list_to_yojson x.tags);
      ("AdditionalAttributes", option_to_yojson string_map_to_yojson x.additional_attributes);
      ("CurrentVersionNumber", Some (registration_version_number_to_yojson x.current_version_number));
      ("RegistrationStatus", Some (registration_status_to_yojson x.registration_status));
      ("RegistrationType", Some (registration_type_to_yojson x.registration_type));
      ( "RegistrationId",
        Some (Smaws_Lib.Smithy_api.Json_serializers.string__to_yojson x.registration_id) );
      ( "RegistrationArn",
        Some (Smaws_Lib.Smithy_api.Json_serializers.string__to_yojson x.registration_arn) );
    ]

let create_registration_request_to_yojson (x : create_registration_request) =
  assoc_to_yojson
    [
      ( "ClientToken",
        Some
          (client_token_to_yojson
             (Option.value x.client_token ~default:(Smaws_Lib.Uuid.generate ()))) );
      ("Tags", option_to_yojson tag_list_to_yojson x.tags);
      ("RegistrationType", Some (registration_type_to_yojson x.registration_type));
    ]

let create_rcs_agent_result_to_yojson (x : create_rcs_agent_result) =
  assoc_to_yojson
    [
      ("Tags", option_to_yojson tag_list_to_yojson x.tags);
      ( "TwoWayRcsEventsEnabled",
        option_to_yojson rcs_event_type_list_to_yojson x.two_way_rcs_events_enabled );
      ("TwoWayMediaS3Role", option_to_yojson iam_role_arn_to_yojson x.two_way_media_s3_role);
      ( "TwoWayMediaS3KeyPrefix",
        option_to_yojson two_way_media_s3_key_prefix_to_yojson x.two_way_media_s3_key_prefix );
      ( "TwoWayMediaS3BucketName",
        option_to_yojson two_way_media_s3_bucket_name_to_yojson x.two_way_media_s3_bucket_name );
      ( "TwoWayEnabled",
        Some (Smaws_Lib.Smithy_api.Json_serializers.primitive_boolean_to_yojson x.two_way_enabled)
      );
      ("TwoWayChannelRole", option_to_yojson iam_role_arn_to_yojson x.two_way_channel_role);
      ("TwoWayChannelArn", option_to_yojson two_way_channel_arn_to_yojson x.two_way_channel_arn);
      ( "SelfManagedOptOutsEnabled",
        Some
          (Smaws_Lib.Smithy_api.Json_serializers.primitive_boolean_to_yojson
             x.self_managed_opt_outs_enabled) );
      ( "CreatedTimestamp",
        Some
          (Smaws_Lib.Smithy_api.Json_serializers.timestamp_epoch_seconds_to_yojson
             x.created_timestamp) );
      ("OptOutListName", option_to_yojson opt_out_list_name_to_yojson x.opt_out_list_name);
      ( "DeletionProtectionEnabled",
        Some
          (Smaws_Lib.Smithy_api.Json_serializers.primitive_boolean_to_yojson
             x.deletion_protection_enabled) );
      ("Status", Some (rcs_agent_status_to_yojson x.status));
      ("RcsAgentId", Some (Smaws_Lib.Smithy_api.Json_serializers.string__to_yojson x.rcs_agent_id));
      ("RcsAgentArn", Some (Smaws_Lib.Smithy_api.Json_serializers.string__to_yojson x.rcs_agent_arn));
    ]

let create_rcs_agent_request_to_yojson (x : create_rcs_agent_request) =
  assoc_to_yojson
    [
      ( "ClientToken",
        Some
          (client_token_to_yojson
             (Option.value x.client_token ~default:(Smaws_Lib.Uuid.generate ()))) );
      ("Tags", option_to_yojson tag_list_to_yojson x.tags);
      ("OptOutListName", option_to_yojson opt_out_list_name_or_arn_to_yojson x.opt_out_list_name);
      ( "DeletionProtectionEnabled",
        option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.boolean__to_yojson
          x.deletion_protection_enabled );
    ]

let create_protect_configuration_result_to_yojson (x : create_protect_configuration_result) =
  assoc_to_yojson
    [
      ("Tags", option_to_yojson tag_list_to_yojson x.tags);
      ( "DeletionProtectionEnabled",
        Some
          (Smaws_Lib.Smithy_api.Json_serializers.primitive_boolean_to_yojson
             x.deletion_protection_enabled) );
      ( "AccountDefault",
        Some (Smaws_Lib.Smithy_api.Json_serializers.primitive_boolean_to_yojson x.account_default)
      );
      ( "CreatedTimestamp",
        Some
          (Smaws_Lib.Smithy_api.Json_serializers.timestamp_epoch_seconds_to_yojson
             x.created_timestamp) );
      ( "ProtectConfigurationId",
        Some (protect_configuration_id_to_yojson x.protect_configuration_id) );
      ( "ProtectConfigurationArn",
        Some (protect_configuration_arn_to_yojson x.protect_configuration_arn) );
    ]

let create_protect_configuration_request_to_yojson (x : create_protect_configuration_request) =
  assoc_to_yojson
    [
      ("Tags", option_to_yojson tag_list_to_yojson x.tags);
      ( "DeletionProtectionEnabled",
        option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.boolean__to_yojson
          x.deletion_protection_enabled );
      ( "ClientToken",
        Some
          (client_token_to_yojson
             (Option.value x.client_token ~default:(Smaws_Lib.Uuid.generate ()))) );
    ]

let create_pool_result_to_yojson (x : create_pool_result) =
  assoc_to_yojson
    [
      ( "CreatedTimestamp",
        option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.timestamp_epoch_seconds_to_yojson
          x.created_timestamp );
      ("Tags", option_to_yojson tag_list_to_yojson x.tags);
      ( "DeletionProtectionEnabled",
        option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.primitive_boolean_to_yojson
          x.deletion_protection_enabled );
      ( "SharedRoutesEnabled",
        option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.primitive_boolean_to_yojson
          x.shared_routes_enabled );
      ("OptOutListName", option_to_yojson opt_out_list_name_to_yojson x.opt_out_list_name);
      ( "SelfManagedOptOutsEnabled",
        option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.primitive_boolean_to_yojson
          x.self_managed_opt_outs_enabled );
      ("TwoWayChannelRole", option_to_yojson iam_role_arn_to_yojson x.two_way_channel_role);
      ("TwoWayChannelArn", option_to_yojson two_way_channel_arn_to_yojson x.two_way_channel_arn);
      ( "TwoWayEnabled",
        option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.primitive_boolean_to_yojson
          x.two_way_enabled );
      ("MessageType", option_to_yojson message_type_to_yojson x.message_type);
      ("Status", option_to_yojson pool_status_to_yojson x.status);
      ("PoolId", option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.string__to_yojson x.pool_id);
      ( "PoolArn",
        option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.string__to_yojson x.pool_arn );
    ]

let create_pool_request_to_yojson (x : create_pool_request) =
  assoc_to_yojson
    [
      ( "ClientToken",
        Some
          (client_token_to_yojson
             (Option.value x.client_token ~default:(Smaws_Lib.Uuid.generate ()))) );
      ("Tags", option_to_yojson tag_list_to_yojson x.tags);
      ( "DeletionProtectionEnabled",
        option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.boolean__to_yojson
          x.deletion_protection_enabled );
      ("MessageType", Some (message_type_to_yojson x.message_type));
      ("IsoCountryCode", option_to_yojson iso_country_code_to_yojson x.iso_country_code);
      ("OriginationIdentity", Some (phone_or_sender_id_or_arn_to_yojson x.origination_identity));
    ]

let create_opt_out_list_result_to_yojson (x : create_opt_out_list_result) =
  assoc_to_yojson
    [
      ( "CreatedTimestamp",
        option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.timestamp_epoch_seconds_to_yojson
          x.created_timestamp );
      ("Tags", option_to_yojson tag_list_to_yojson x.tags);
      ("OptOutListName", option_to_yojson opt_out_list_name_to_yojson x.opt_out_list_name);
      ( "OptOutListArn",
        option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.string__to_yojson x.opt_out_list_arn
      );
    ]

let create_opt_out_list_request_to_yojson (x : create_opt_out_list_request) =
  assoc_to_yojson
    [
      ( "ClientToken",
        Some
          (client_token_to_yojson
             (Option.value x.client_token ~default:(Smaws_Lib.Uuid.generate ()))) );
      ("Tags", option_to_yojson tag_list_to_yojson x.tags);
      ("OptOutListName", Some (opt_out_list_name_to_yojson x.opt_out_list_name));
    ]

let create_notify_configuration_result_to_yojson (x : create_notify_configuration_result) =
  assoc_to_yojson
    [
      ( "CreatedTimestamp",
        Some
          (Smaws_Lib.Smithy_api.Json_serializers.timestamp_epoch_seconds_to_yojson
             x.created_timestamp) );
      ("Tags", option_to_yojson tag_list_to_yojson x.tags);
      ( "DeletionProtectionEnabled",
        Some
          (Smaws_Lib.Smithy_api.Json_serializers.primitive_boolean_to_yojson
             x.deletion_protection_enabled) );
      ( "RejectionReason",
        option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.string__to_yojson x.rejection_reason
      );
      ("Status", Some (notify_configuration_status_to_yojson x.status));
      ("TierUpgradeStatus", Some (tier_upgrade_status_to_yojson x.tier_upgrade_status));
      ("Tier", Some (notify_configuration_tier_to_yojson x.tier));
      ("EnabledChannels", Some (notify_enabled_channels_list_to_yojson x.enabled_channels));
      ("EnabledCountries", option_to_yojson iso_country_code_list_to_yojson x.enabled_countries);
      ("PoolId", option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.string__to_yojson x.pool_id);
      ("DefaultTemplateId", option_to_yojson notify_template_id_to_yojson x.default_template_id);
      ("UseCase", Some (notify_configuration_use_case_to_yojson x.use_case));
      ("DisplayName", Some (notify_configuration_display_name_to_yojson x.display_name));
      ("NotifyConfigurationId", Some (notify_configuration_id_to_yojson x.notify_configuration_id));
      ( "NotifyConfigurationArn",
        Some (notify_configuration_arn_to_yojson x.notify_configuration_arn) );
    ]

let create_notify_configuration_request_to_yojson (x : create_notify_configuration_request) =
  assoc_to_yojson
    [
      ("Tags", option_to_yojson tag_list_to_yojson x.tags);
      ( "ClientToken",
        Some
          (client_token_to_yojson
             (Option.value x.client_token ~default:(Smaws_Lib.Uuid.generate ()))) );
      ( "DeletionProtectionEnabled",
        option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.boolean__to_yojson
          x.deletion_protection_enabled );
      ("EnabledChannels", Some (notify_enabled_channels_list_to_yojson x.enabled_channels));
      ("EnabledCountries", option_to_yojson iso_country_code_list_to_yojson x.enabled_countries);
      ("PoolId", option_to_yojson pool_id_or_arn_to_yojson x.pool_id);
      ("DefaultTemplateId", option_to_yojson notify_template_id_to_yojson x.default_template_id);
      ("UseCase", Some (notify_configuration_use_case_to_yojson x.use_case));
      ("DisplayName", Some (notify_configuration_display_name_to_yojson x.display_name));
    ]

let create_event_destination_result_to_yojson (x : create_event_destination_result) =
  assoc_to_yojson
    [
      ("EventDestination", option_to_yojson event_destination_to_yojson x.event_destination);
      ( "ConfigurationSetName",
        option_to_yojson configuration_set_name_to_yojson x.configuration_set_name );
      ( "ConfigurationSetArn",
        option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.string__to_yojson
          x.configuration_set_arn );
    ]

let create_event_destination_request_to_yojson (x : create_event_destination_request) =
  assoc_to_yojson
    [
      ( "ClientToken",
        Some
          (client_token_to_yojson
             (Option.value x.client_token ~default:(Smaws_Lib.Uuid.generate ()))) );
      ("SnsDestination", option_to_yojson sns_destination_to_yojson x.sns_destination);
      ( "KinesisFirehoseDestination",
        option_to_yojson kinesis_firehose_destination_to_yojson x.kinesis_firehose_destination );
      ( "CloudWatchLogsDestination",
        option_to_yojson cloud_watch_logs_destination_to_yojson x.cloud_watch_logs_destination );
      ("MatchingEventTypes", Some (event_type_list_to_yojson x.matching_event_types));
      ("EventDestinationName", Some (event_destination_name_to_yojson x.event_destination_name));
      ( "ConfigurationSetName",
        Some (configuration_set_name_or_arn_to_yojson x.configuration_set_name) );
    ]

let create_configuration_set_result_to_yojson (x : create_configuration_set_result) =
  assoc_to_yojson
    [
      ( "CreatedTimestamp",
        option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.timestamp_epoch_seconds_to_yojson
          x.created_timestamp );
      ("Tags", option_to_yojson tag_list_to_yojson x.tags);
      ( "ConfigurationSetName",
        option_to_yojson configuration_set_name_to_yojson x.configuration_set_name );
      ( "ConfigurationSetArn",
        option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.string__to_yojson
          x.configuration_set_arn );
    ]

let create_configuration_set_request_to_yojson (x : create_configuration_set_request) =
  assoc_to_yojson
    [
      ( "ClientToken",
        Some
          (client_token_to_yojson
             (Option.value x.client_token ~default:(Smaws_Lib.Uuid.generate ()))) );
      ("Tags", option_to_yojson tag_list_to_yojson x.tags);
      ("ConfigurationSetName", Some (configuration_set_name_to_yojson x.configuration_set_name));
    ]

let e164_phone_number_type_to_yojson = string_to_yojson
let dialing_country_code_type_to_yojson = string_to_yojson
let mcc_type_to_yojson = string_to_yojson
let mnc_type_to_yojson = string_to_yojson

let phone_number_type_to_yojson (x : phone_number_type) =
  match x with
  | MOBILE -> `String "MOBILE"
  | LANDLINE -> `String "LANDLINE"
  | OTHER -> `String "OTHER"
  | INVALID -> `String "INVALID"

let carrier_lookup_result_to_yojson (x : carrier_lookup_result) =
  assoc_to_yojson
    [
      ("PhoneNumberType", Some (phone_number_type_to_yojson x.phone_number_type));
      ("Carrier", option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.string__to_yojson x.carrier);
      ("MNC", option_to_yojson mnc_type_to_yojson x.mn_c);
      ("MCC", option_to_yojson mcc_type_to_yojson x.mc_c);
      ("Country", option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.string__to_yojson x.country);
      ("IsoCountryCode", option_to_yojson iso_country_code_to_yojson x.iso_country_code);
      ( "DialingCountryCode",
        option_to_yojson dialing_country_code_type_to_yojson x.dialing_country_code );
      ("E164PhoneNumber", Some (e164_phone_number_type_to_yojson x.e164_phone_number));
    ]

let carrier_lookup_input_phone_number_type_to_yojson = string_to_yojson

let carrier_lookup_request_to_yojson (x : carrier_lookup_request) =
  assoc_to_yojson
    [ ("PhoneNumber", Some (carrier_lookup_input_phone_number_type_to_yojson x.phone_number)) ]

let associate_protect_configuration_result_to_yojson (x : associate_protect_configuration_result) =
  assoc_to_yojson
    [
      ( "ProtectConfigurationId",
        Some (protect_configuration_id_to_yojson x.protect_configuration_id) );
      ( "ProtectConfigurationArn",
        Some (protect_configuration_arn_to_yojson x.protect_configuration_arn) );
      ("ConfigurationSetName", Some (configuration_set_name_to_yojson x.configuration_set_name));
      ( "ConfigurationSetArn",
        Some (Smaws_Lib.Smithy_api.Json_serializers.string__to_yojson x.configuration_set_arn) );
    ]

let associate_protect_configuration_request_to_yojson (x : associate_protect_configuration_request)
    =
  assoc_to_yojson
    [
      ( "ConfigurationSetName",
        Some (configuration_set_name_or_arn_to_yojson x.configuration_set_name) );
      ( "ProtectConfigurationId",
        Some (protect_configuration_id_or_arn_to_yojson x.protect_configuration_id) );
    ]

let associate_origination_identity_result_to_yojson (x : associate_origination_identity_result) =
  assoc_to_yojson
    [
      ("IsoCountryCode", option_to_yojson iso_country_code_to_yojson x.iso_country_code);
      ( "OriginationIdentity",
        option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.string__to_yojson
          x.origination_identity );
      ( "OriginationIdentityArn",
        option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.string__to_yojson
          x.origination_identity_arn );
      ("PoolId", option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.string__to_yojson x.pool_id);
      ( "PoolArn",
        option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.string__to_yojson x.pool_arn );
    ]

let associate_origination_identity_request_to_yojson (x : associate_origination_identity_request) =
  assoc_to_yojson
    [
      ( "ClientToken",
        Some
          (client_token_to_yojson
             (Option.value x.client_token ~default:(Smaws_Lib.Uuid.generate ()))) );
      ("IsoCountryCode", option_to_yojson iso_country_code_to_yojson x.iso_country_code);
      ("OriginationIdentity", Some (phone_or_sender_id_or_arn_to_yojson x.origination_identity));
      ("PoolId", Some (pool_id_or_arn_to_yojson x.pool_id));
    ]
