open Smaws_Lib.Json.DeserializeHelpers
open Types

let business_validation_code_of_yojson (tree : t) path =
  ((match tree with
    | `String "INCOMPATIBLE_CONNECTION_INVITATION_REQUEST" ->
        INCOMPATIBLE_CONNECTION_INVITATION_REQUEST
    | `String "INCOMPATIBLE_LEGAL_NAME" -> INCOMPATIBLE_LEGAL_NAME
    | `String "INCOMPATIBLE_KNOW_YOUR_BUSINESS_STATUS" -> INCOMPATIBLE_KNOW_YOUR_BUSINESS_STATUS
    | `String "INCOMPATIBLE_IDENTITY_VERIFICATION_STATUS" ->
        INCOMPATIBLE_IDENTITY_VERIFICATION_STATUS
    | `String "INVALID_ACCOUNT_LINKING_STATUS" -> INVALID_ACCOUNT_LINKING_STATUS
    | `String "INVALID_ACCOUNT_STATE" -> INVALID_ACCOUNT_STATE
    | `String "INCOMPATIBLE_DOMAIN" -> INCOMPATIBLE_DOMAIN
    | `String "INELIGIBLE_ACCOUNT_TIER" -> INELIGIBLE_ACCOUNT_TIER
    | `String value ->
        raise (deserialize_unknown_enum_value_error path "BusinessValidationCode" value)
    | _ -> raise (deserialize_wrong_type_error path "BusinessValidationCode")
     : business_validation_code)
    : business_validation_code)

let business_validation_error_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     message =
       value_for_key Smaws_Lib.Smithy_api.Json_deserializers.string__of_yojson "Message" _list path;
     code = value_for_key business_validation_code_of_yojson "Code" _list path;
   }
    : business_validation_error)

let field_validation_code_of_yojson (tree : t) path =
  ((match tree with
    | `String "REQUIRED_FIELD_MISSING" -> REQUIRED_FIELD_MISSING
    | `String "DUPLICATE_VALUE" -> DUPLICATE_VALUE
    | `String "INVALID_VALUE" -> INVALID_VALUE
    | `String "INVALID_STRING_FORMAT" -> INVALID_STRING_FORMAT
    | `String "TOO_MANY_VALUES" -> TOO_MANY_VALUES
    | `String "ACTION_NOT_PERMITTED" -> ACTION_NOT_PERMITTED
    | `String "INVALID_ENUM_VALUE" -> INVALID_ENUM_VALUE
    | `String value -> raise (deserialize_unknown_enum_value_error path "FieldValidationCode" value)
    | _ -> raise (deserialize_wrong_type_error path "FieldValidationCode")
     : field_validation_code)
    : field_validation_code)

let field_validation_error_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     name =
       value_for_key Smaws_Lib.Smithy_api.Json_deserializers.string__of_yojson "Name" _list path;
     message =
       value_for_key Smaws_Lib.Smithy_api.Json_deserializers.string__of_yojson "Message" _list path;
     code = value_for_key field_validation_code_of_yojson "Code" _list path;
   }
    : field_validation_error)

let validation_error_of_yojson (tree : t) path =
  let _list = assoc_of_yojson tree path in
  let key, value_ =
    match _list with
    | (key, value_) :: _ -> (key, value_)
    | _ -> raise (deserialize_wrong_type_error path "union")
  in
  (match key with
   | "FieldValidationError" -> FieldValidationError (field_validation_error_of_yojson value_ path)
   | "BusinessValidationError" ->
       BusinessValidationError (business_validation_error_of_yojson value_ path)
   | _ as unknown -> raise (deserialize_unknown_enum_value_error path "ValidationError" unknown)
    : validation_error)

let validation_error_list_of_yojson tree path = list_of_yojson validation_error_of_yojson tree path

let validation_exception_reason_of_yojson (tree : t) path =
  ((match tree with
    | `String "REQUEST_VALIDATION_FAILED" -> REQUEST_VALIDATION_FAILED
    | `String "BUSINESS_VALIDATION_FAILED" -> BUSINESS_VALIDATION_FAILED
    | `String value ->
        raise (deserialize_unknown_enum_value_error path "ValidationExceptionReason" value)
    | _ -> raise (deserialize_wrong_type_error path "ValidationExceptionReason")
     : validation_exception_reason)
    : validation_exception_reason)

let validation_exception_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     message =
       value_for_key Smaws_Lib.Smithy_api.Json_deserializers.string__of_yojson "Message" _list path;
     reason = value_for_key validation_exception_reason_of_yojson "Reason" _list path;
     error_details =
       option_of_yojson (value_for_key validation_error_list_of_yojson "ErrorDetails") _list path;
   }
    : validation_exception)

let throttling_exception_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     message =
       value_for_key Smaws_Lib.Smithy_api.Json_deserializers.string__of_yojson "Message" _list path;
     service_code =
       option_of_yojson
         (value_for_key Smaws_Lib.Smithy_api.Json_deserializers.string__of_yojson "ServiceCode")
         _list path;
     quota_code =
       option_of_yojson
         (value_for_key Smaws_Lib.Smithy_api.Json_deserializers.string__of_yojson "QuotaCode")
         _list path;
   }
    : throttling_exception)

let service_quota_exceeded_exception_reason_of_yojson (tree : t) path =
  ((match tree with
    | `String "LIMIT_EXCEEDED_NUMBER_OF_EMAIL" -> LIMIT_EXCEEDED_NUMBER_OF_EMAIL
    | `String "LIMIT_EXCEEDED_NUMBER_OF_DOMAIN" -> LIMIT_EXCEEDED_NUMBER_OF_DOMAIN
    | `String "LIMIT_EXCEEDED_NUMBER_OF_CONNECTION_INVITATION_PER_DAY" ->
        LIMIT_EXCEEDED_NUMBER_OF_CONNECTION_INVITATION_PER_DAY
    | `String "LIMIT_EXCEEDED_NUMBER_OF_ACTIVE_CONNECTION" ->
        LIMIT_EXCEEDED_NUMBER_OF_ACTIVE_CONNECTION
    | `String "LIMIT_EXCEEDED_NUMBER_OF_OPEN_CONNECTION_INVITATION" ->
        LIMIT_EXCEEDED_NUMBER_OF_OPEN_CONNECTION_INVITATION
    | `String "LIMIT_EXCEEDED_NUMBER_OF_PROFILE_UPDATE_PER_DAY" ->
        LIMIT_EXCEEDED_NUMBER_OF_PROFILE_UPDATE_PER_DAY
    | `String "LIMIT_EXCEEDED_NUMBER_OF_PROFILE_VISIBILITY_UPDATE_PER_DAY" ->
        LIMIT_EXCEEDED_NUMBER_OF_PROFILE_VISIBILITY_UPDATE_PER_DAY
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
       value_for_key Smaws_Lib.Smithy_api.Json_deserializers.string__of_yojson "Message" _list path;
     reason = value_for_key service_quota_exceeded_exception_reason_of_yojson "Reason" _list path;
   }
    : service_quota_exceeded_exception)

let resource_not_found_exception_reason_of_yojson (tree : t) path =
  ((match tree with
    | `String "PARTNER_NOT_FOUND" -> PARTNER_NOT_FOUND
    | `String "PARTNER_PROFILE_NOT_FOUND" -> PARTNER_PROFILE_NOT_FOUND
    | `String "PARTNER_PROFILE_TASK_NOT_FOUND" -> PARTNER_PROFILE_TASK_NOT_FOUND
    | `String "PARTNER_DOMAIN_NOT_FOUND" -> PARTNER_DOMAIN_NOT_FOUND
    | `String "SENDER_PROFILE_NOT_FOUND" -> SENDER_PROFILE_NOT_FOUND
    | `String "RECEIVER_PROFILE_NOT_FOUND" -> RECEIVER_PROFILE_NOT_FOUND
    | `String "CONNECTION_INVITATION_NOT_FOUND" -> CONNECTION_INVITATION_NOT_FOUND
    | `String "CONNECTION_NOT_FOUND" -> CONNECTION_NOT_FOUND
    | `String "VERIFICATION_NOT_FOUND" -> VERIFICATION_NOT_FOUND
    | `String value ->
        raise (deserialize_unknown_enum_value_error path "ResourceNotFoundExceptionReason" value)
    | _ -> raise (deserialize_wrong_type_error path "ResourceNotFoundExceptionReason")
     : resource_not_found_exception_reason)
    : resource_not_found_exception_reason)

let resource_not_found_exception_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     message =
       value_for_key Smaws_Lib.Smithy_api.Json_deserializers.string__of_yojson "Message" _list path;
     reason = value_for_key resource_not_found_exception_reason_of_yojson "Reason" _list path;
   }
    : resource_not_found_exception)

let internal_server_exception_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     message =
       value_for_key Smaws_Lib.Smithy_api.Json_deserializers.string__of_yojson "Message" _list path;
   }
    : internal_server_exception)

let conflict_exception_reason_of_yojson (tree : t) path =
  ((match tree with
    | `String "CONFLICT_CLIENT_TOKEN" -> CONFLICT_CLIENT_TOKEN
    | `String "DUPLICATE_PARTNER" -> DUPLICATE_PARTNER
    | `String "INCOMPATIBLE_PROFILE_STATE" -> INCOMPATIBLE_PROFILE_STATE
    | `String "INCOMPATIBLE_PARTNER_PROFILE_TASK_STATE" -> INCOMPATIBLE_PARTNER_PROFILE_TASK_STATE
    | `String "DUPLICATE_CONNECTION_INVITATION" -> DUPLICATE_CONNECTION_INVITATION
    | `String "INCOMPATIBLE_CONNECTION_INVITATION_STATE" -> INCOMPATIBLE_CONNECTION_INVITATION_STATE
    | `String "INCOMPATIBLE_CONNECTION_INVITATION_RECEIVER" ->
        INCOMPATIBLE_CONNECTION_INVITATION_RECEIVER
    | `String "DUPLICATE_CONNECTION" -> DUPLICATE_CONNECTION
    | `String "INCOMPATIBLE_CONNECTION_STATE" -> INCOMPATIBLE_CONNECTION_STATE
    | `String "INCOMPATIBLE_CONNECTION_PREFERENCES_REVISION" ->
        INCOMPATIBLE_CONNECTION_PREFERENCES_REVISION
    | `String "ACCOUNT_ALREADY_VERIFIED" -> ACCOUNT_ALREADY_VERIFIED
    | `String "VERIFICATION_ALREADY_IN_PROGRESS" -> VERIFICATION_ALREADY_IN_PROGRESS
    | `String value ->
        raise (deserialize_unknown_enum_value_error path "ConflictExceptionReason" value)
    | _ -> raise (deserialize_wrong_type_error path "ConflictExceptionReason")
     : conflict_exception_reason)
    : conflict_exception_reason)

let conflict_exception_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     message =
       value_for_key Smaws_Lib.Smithy_api.Json_deserializers.string__of_yojson "Message" _list path;
     reason = value_for_key conflict_exception_reason_of_yojson "Reason" _list path;
   }
    : conflict_exception)

let access_denied_exception_reason_of_yojson (tree : t) path =
  ((match tree with
    | `String "ACCESS_DENIED" -> ACCESS_DENIED
    | `String "INCOMPATIBLE_BENEFIT_AWS_PARTNER_STATE" -> INCOMPATIBLE_BENEFIT_AWS_PARTNER_STATE
    | `String value ->
        raise (deserialize_unknown_enum_value_error path "AccessDeniedExceptionReason" value)
    | _ -> raise (deserialize_wrong_type_error path "AccessDeniedExceptionReason")
     : access_denied_exception_reason)
    : access_denied_exception_reason)

let access_denied_exception_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     message =
       value_for_key Smaws_Lib.Smithy_api.Json_deserializers.string__of_yojson "Message" _list path;
     reason = value_for_key access_denied_exception_reason_of_yojson "Reason" _list path;
   }
    : access_denied_exception)

let unicode_string_of_yojson = string_of_yojson

let account_summary_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({ name = value_for_key unicode_string_of_yojson "Name" _list path } : account_summary)

let seller_profile_id_of_yojson = string_of_yojson

let seller_profile_summary_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     id = value_for_key seller_profile_id_of_yojson "Id" _list path;
     name = value_for_key unicode_string_of_yojson "Name" _list path;
   }
    : seller_profile_summary)

let partner_profile_id_of_yojson = string_of_yojson

let partner_profile_summary_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     id = value_for_key partner_profile_id_of_yojson "Id" _list path;
     name = value_for_key unicode_string_of_yojson "Name" _list path;
   }
    : partner_profile_summary)

let participant_of_yojson (tree : t) path =
  let _list = assoc_of_yojson tree path in
  let key, value_ =
    match _list with
    | (key, value_) :: _ -> (key, value_)
    | _ -> raise (deserialize_wrong_type_error path "union")
  in
  (match key with
   | "PartnerProfile" -> PartnerProfile (partner_profile_summary_of_yojson value_ path)
   | "SellerProfile" -> SellerProfile (seller_profile_summary_of_yojson value_ path)
   | "Account" -> Account (account_summary_of_yojson value_ path)
   | _ as unknown -> raise (deserialize_unknown_enum_value_error path "Participant" unknown)
    : participant)

let aws_account_id_of_yojson = string_of_yojson
let date_time_of_yojson = timestamp_iso_8601_of_yojson

let connection_type_status_of_yojson (tree : t) path =
  ((match tree with
    | `String "ACTIVE" -> ACTIVE
    | `String "CANCELED" -> CANCELED
    | `String value ->
        raise (deserialize_unknown_enum_value_error path "ConnectionTypeStatus" value)
    | _ -> raise (deserialize_wrong_type_error path "ConnectionTypeStatus")
     : connection_type_status)
    : connection_type_status)

let sensitive_unicode_string_of_yojson = string_of_yojson
let email_of_yojson = string_of_yojson

let connection_type_detail_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     created_at = value_for_key date_time_of_yojson "CreatedAt" _list path;
     inviter_email = value_for_key email_of_yojson "InviterEmail" _list path;
     inviter_name = value_for_key sensitive_unicode_string_of_yojson "InviterName" _list path;
     status = value_for_key connection_type_status_of_yojson "Status" _list path;
     canceled_at = option_of_yojson (value_for_key date_time_of_yojson "CanceledAt") _list path;
     canceled_by = option_of_yojson (value_for_key aws_account_id_of_yojson "CanceledBy") _list path;
     other_participant = value_for_key participant_of_yojson "OtherParticipant" _list path;
   }
    : connection_type_detail)

let connection_type_of_yojson (tree : t) path =
  ((match tree with
    | `String "OPPORTUNITY_COLLABORATION" -> OPPORTUNITY_COLLABORATION
    | `String "SUBSIDIARY" -> SUBSIDIARY
    | `String value -> raise (deserialize_unknown_enum_value_error path "ConnectionType" value)
    | _ -> raise (deserialize_wrong_type_error path "ConnectionType")
     : connection_type)
    : connection_type)

let connection_type_detail_map_of_yojson tree path =
  map_of_yojson connection_type_of_yojson connection_type_detail_of_yojson tree path

let connection_arn_of_yojson = string_of_yojson
let connection_id_of_yojson = string_of_yojson
let catalog_of_yojson = string_of_yojson

let connection_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     catalog = value_for_key catalog_of_yojson "Catalog" _list path;
     id = value_for_key connection_id_of_yojson "Id" _list path;
     arn = value_for_key connection_arn_of_yojson "Arn" _list path;
     other_participant_account_id =
       value_for_key aws_account_id_of_yojson "OtherParticipantAccountId" _list path;
     updated_at = value_for_key date_time_of_yojson "UpdatedAt" _list path;
     connection_types =
       value_for_key connection_type_detail_map_of_yojson "ConnectionTypes" _list path;
   }
    : connection)

let accept_connection_invitation_response_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({ connection = value_for_key connection_of_yojson "Connection" _list path }
    : accept_connection_invitation_response)

let client_token_of_yojson = string_of_yojson
let connection_invitation_id_of_yojson = string_of_yojson

let accept_connection_invitation_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     catalog = value_for_key catalog_of_yojson "Catalog" _list path;
     identifier = value_for_key connection_invitation_id_of_yojson "Identifier" _list path;
     client_token = value_for_key client_token_of_yojson "ClientToken" _list path;
   }
    : accept_connection_invitation_request)

let access_type_of_yojson (tree : t) path =
  ((match tree with
    | `String "ALLOW_ALL" -> ALLOW_ALL
    | `String "DENY_ALL" -> DENY_ALL
    | `String "ALLOW_BY_DEFAULT_DENY_SOME" -> ALLOW_BY_DEFAULT_DENY_SOME
    | `String value -> raise (deserialize_unknown_enum_value_error path "AccessType" value)
    | _ -> raise (deserialize_wrong_type_error path "AccessType")
     : access_type)
    : access_type)

let alliance_lead_contact_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     first_name = value_for_key sensitive_unicode_string_of_yojson "FirstName" _list path;
     last_name = value_for_key sensitive_unicode_string_of_yojson "LastName" _list path;
     email = value_for_key email_of_yojson "Email" _list path;
     business_title = value_for_key sensitive_unicode_string_of_yojson "BusinessTitle" _list path;
   }
    : alliance_lead_contact)

let associate_aws_training_certification_email_domain_response_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  (() : unit)

let email_verification_code_of_yojson = string_of_yojson
let partner_identifier_of_yojson = string_of_yojson

let associate_aws_training_certification_email_domain_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     catalog = value_for_key catalog_of_yojson "Catalog" _list path;
     identifier = value_for_key partner_identifier_of_yojson "Identifier" _list path;
     client_token = option_of_yojson (value_for_key client_token_of_yojson "ClientToken") _list path;
     email = value_for_key email_of_yojson "Email" _list path;
     email_verification_code =
       value_for_key email_verification_code_of_yojson "EmailVerificationCode" _list path;
   }
    : associate_aws_training_certification_email_domain_request)

let jurisdiction_code_of_yojson = string_of_yojson
let country_code_of_yojson = string_of_yojson
let registration_id_of_yojson = string_of_yojson
let legal_name_of_yojson = string_of_yojson

let business_verification_details_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     legal_name = value_for_key legal_name_of_yojson "LegalName" _list path;
     registration_id = value_for_key registration_id_of_yojson "RegistrationId" _list path;
     country_code = value_for_key country_code_of_yojson "CountryCode" _list path;
     jurisdiction_of_incorporation =
       option_of_yojson
         (value_for_key jurisdiction_code_of_yojson "JurisdictionOfIncorporation")
         _list path;
   }
    : business_verification_details)

let completion_url_of_yojson = string_of_yojson

let business_verification_response_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     business_verification_details =
       value_for_key business_verification_details_of_yojson "BusinessVerificationDetails" _list
         path;
     completion_url =
       option_of_yojson (value_for_key completion_url_of_yojson "CompletionUrl") _list path;
     completion_url_expires_at =
       option_of_yojson (value_for_key date_time_of_yojson "CompletionUrlExpiresAt") _list path;
   }
    : business_verification_response)

let cancel_connection_response_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     catalog = value_for_key catalog_of_yojson "Catalog" _list path;
     id = value_for_key connection_id_of_yojson "Id" _list path;
     arn = value_for_key connection_arn_of_yojson "Arn" _list path;
     other_participant_account_id =
       value_for_key aws_account_id_of_yojson "OtherParticipantAccountId" _list path;
     updated_at = value_for_key date_time_of_yojson "UpdatedAt" _list path;
     connection_types =
       value_for_key connection_type_detail_map_of_yojson "ConnectionTypes" _list path;
   }
    : cancel_connection_response)

let cancel_connection_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     catalog = value_for_key catalog_of_yojson "Catalog" _list path;
     identifier = value_for_key connection_id_of_yojson "Identifier" _list path;
     connection_type = value_for_key connection_type_of_yojson "ConnectionType" _list path;
     reason =
       value_for_key Smaws_Lib.Smithy_api.Json_deserializers.string__of_yojson "Reason" _list path;
     client_token = value_for_key client_token_of_yojson "ClientToken" _list path;
   }
    : cancel_connection_request)

let unicode_string_including_new_line_of_yojson = string_of_yojson

let invitation_status_of_yojson (tree : t) path =
  ((match tree with
    | `String "PENDING" -> PENDING
    | `String "ACCEPTED" -> ACCEPTED
    | `String "REJECTED" -> REJECTED
    | `String "CANCELED" -> CANCELED
    | `String "EXPIRED" -> EXPIRED
    | `String value -> raise (deserialize_unknown_enum_value_error path "InvitationStatus" value)
    | _ -> raise (deserialize_wrong_type_error path "InvitationStatus")
     : invitation_status)
    : invitation_status)

let participant_type_of_yojson (tree : t) path =
  ((match tree with
    | `String "SENDER" -> SENDER
    | `String "RECEIVER" -> RECEIVER
    | `String value -> raise (deserialize_unknown_enum_value_error path "ParticipantType" value)
    | _ -> raise (deserialize_wrong_type_error path "ParticipantType")
     : participant_type)
    : participant_type)

let participant_identifier_of_yojson = string_of_yojson
let connection_invitation_arn_of_yojson = string_of_yojson

let cancel_connection_invitation_response_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     catalog = value_for_key catalog_of_yojson "Catalog" _list path;
     id = value_for_key connection_invitation_id_of_yojson "Id" _list path;
     arn = value_for_key connection_invitation_arn_of_yojson "Arn" _list path;
     connection_id =
       option_of_yojson (value_for_key connection_id_of_yojson "ConnectionId") _list path;
     connection_type = value_for_key connection_type_of_yojson "ConnectionType" _list path;
     created_at = value_for_key date_time_of_yojson "CreatedAt" _list path;
     updated_at = value_for_key date_time_of_yojson "UpdatedAt" _list path;
     expires_at = option_of_yojson (value_for_key date_time_of_yojson "ExpiresAt") _list path;
     other_participant_identifier =
       value_for_key participant_identifier_of_yojson "OtherParticipantIdentifier" _list path;
     participant_type = value_for_key participant_type_of_yojson "ParticipantType" _list path;
     status = value_for_key invitation_status_of_yojson "Status" _list path;
     invitation_message =
       value_for_key unicode_string_including_new_line_of_yojson "InvitationMessage" _list path;
     inviter_email = value_for_key email_of_yojson "InviterEmail" _list path;
     inviter_name = value_for_key sensitive_unicode_string_of_yojson "InviterName" _list path;
   }
    : cancel_connection_invitation_response)

let cancel_connection_invitation_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     catalog = value_for_key catalog_of_yojson "Catalog" _list path;
     identifier = value_for_key connection_invitation_id_of_yojson "Identifier" _list path;
     client_token = value_for_key client_token_of_yojson "ClientToken" _list path;
   }
    : cancel_connection_invitation_request)

let profile_validation_error_reason_of_yojson (tree : t) path =
  ((match tree with
    | `String "INVALID_CONTENT" -> INVALID_CONTENT
    | `String "DUPLICATE_PROFILE" -> DUPLICATE_PROFILE
    | `String "INVALID_LOGO" -> INVALID_LOGO
    | `String "INVALID_LOGO_URL" -> INVALID_LOGO_URL
    | `String "INVALID_LOGO_FILE" -> INVALID_LOGO_FILE
    | `String "INVALID_LOGO_SIZE" -> INVALID_LOGO_SIZE
    | `String "INVALID_WEBSITE_URL" -> INVALID_WEBSITE_URL
    | `String value ->
        raise (deserialize_unknown_enum_value_error path "ProfileValidationErrorReason" value)
    | _ -> raise (deserialize_wrong_type_error path "ProfileValidationErrorReason")
     : profile_validation_error_reason)
    : profile_validation_error_reason)

let error_detail_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     locale =
       value_for_key Smaws_Lib.Smithy_api.Json_deserializers.string__of_yojson "Locale" _list path;
     message =
       value_for_key Smaws_Lib.Smithy_api.Json_deserializers.string__of_yojson "Message" _list path;
     reason = value_for_key profile_validation_error_reason_of_yojson "Reason" _list path;
   }
    : error_detail)

let error_detail_list_of_yojson tree path = list_of_yojson error_detail_of_yojson tree path

let profile_task_status_of_yojson (tree : t) path =
  ((match tree with
    | `String "IN_PROGRESS" -> IN_PROGRESS
    | `String "CANCELED" -> CANCELED
    | `String "SUCCEEDED" -> SUCCEEDED
    | `String "FAILED" -> FAILED
    | `String value -> raise (deserialize_unknown_enum_value_error path "ProfileTaskStatus" value)
    | _ -> raise (deserialize_wrong_type_error path "ProfileTaskStatus")
     : profile_task_status)
    : profile_task_status)

let locale_of_yojson = string_of_yojson
let url_of_yojson = string_of_yojson

let localized_content_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     display_name = value_for_key unicode_string_of_yojson "DisplayName" _list path;
     description = value_for_key unicode_string_of_yojson "Description" _list path;
     website_url = value_for_key url_of_yojson "WebsiteUrl" _list path;
     logo_url = value_for_key url_of_yojson "LogoUrl" _list path;
     locale = value_for_key locale_of_yojson "Locale" _list path;
   }
    : localized_content)

let localized_content_list_of_yojson tree path =
  list_of_yojson localized_content_of_yojson tree path

let industry_segment_of_yojson (tree : t) path =
  ((match tree with
    | `String "AGRICULTURE_MINING" -> AGRICULTURE_MINING
    | `String "BIOTECHNOLOGY" -> BIOTECHNOLOGY
    | `String "BUSINESS_CONSUMER_SERVICES" -> BUSINESS_CONSUMER_SERVICES
    | `String "BUSINESS_SERV" -> BUSINESS_SERV
    | `String "COMMUNICATIONS" -> COMMUNICATIONS
    | `String "COMPUTER_HARDWARE" -> COMPUTER_HARDWARE
    | `String "COMPUTERS_ELECTRONICS" -> COMPUTERS_ELECTRONICS
    | `String "COMPUTER_SOFTWARE" -> COMPUTER_SOFTWARE
    | `String "CONSUMER_GOODS" -> CONSUMER_GOODS
    | `String "CONSUMER_RELATED" -> CONSUMER_RELATED
    | `String "EDUCATION" -> EDUCATION
    | `String "ENERGY_UTILITIES" -> ENERGY_UTILITIES
    | `String "FINANCIAL_SERVICES" -> FINANCIAL_SERVICES
    | `String "GAMING" -> GAMING
    | `String "GOVERNMENT" -> GOVERNMENT
    | `String "GOVERNMENT_EDUCATION_PUBLIC_SERVICES" -> GOVERNMENT_EDUCATION_PUBLIC_SERVICES
    | `String "HEALTHCARE" -> HEALTHCARE
    | `String "HEALTHCARE_PHARMACEUTICALS_BIOTECH" -> HEALTHCARE_PHARMACEUTICALS_BIOTECH
    | `String "INDUSTRIAL_ENERGY" -> INDUSTRIAL_ENERGY
    | `String "INTERNET_SPECIFIC" -> INTERNET_SPECIFIC
    | `String "LIFE_SCIENCES" -> LIFE_SCIENCES
    | `String "MANUFACTURING" -> MANUFACTURING
    | `String "MEDIA_ENTERTAINMENT_LEISURE" -> MEDIA_ENTERTAINMENT_LEISURE
    | `String "MEDIA_ENTERTAINMENT" -> MEDIA_ENTERTAINMENT
    | `String "MEDICAL_HEALTH" -> MEDICAL_HEALTH
    | `String "NON_PROFIT_ORGANIZATION" -> NON_PROFIT_ORGANIZATION
    | `String "OTHER" -> OTHER
    | `String "PROFESSIONAL_SERVICES" -> PROFESSIONAL_SERVICES
    | `String "REAL_ESTATE_CONSTRUCTION" -> REAL_ESTATE_CONSTRUCTION
    | `String "RETAIL" -> RETAIL
    | `String "RETAIL_WHOLESALE_DISTRIBUTION" -> RETAIL_WHOLESALE_DISTRIBUTION
    | `String "SEMICONDUCTOR_ELECTR" -> SEMICONDUCTOR_ELECTR
    | `String "SOFTWARE_INTERNET" -> SOFTWARE_INTERNET
    | `String "TELECOMMUNICATIONS" -> TELECOMMUNICATIONS
    | `String "TRANSPORTATION_LOGISTICS" -> TRANSPORTATION_LOGISTICS
    | `String "TRAVEL_HOSPITALITY" -> TRAVEL_HOSPITALITY
    | `String "WHOLESALE_DISTRIBUTION" -> WHOLESALE_DISTRIBUTION
    | `String value -> raise (deserialize_unknown_enum_value_error path "IndustrySegment" value)
    | _ -> raise (deserialize_wrong_type_error path "IndustrySegment")
     : industry_segment)
    : industry_segment)

let industry_segment_list_of_yojson tree path = list_of_yojson industry_segment_of_yojson tree path

let primary_solution_type_of_yojson (tree : t) path =
  ((match tree with
    | `String "SOFTWARE_PRODUCTS" -> SOFTWARE_PRODUCTS
    | `String "CONSULTING_SERVICES" -> CONSULTING_SERVICES
    | `String "PROFESSIONAL_SERVICES" -> PROFESSIONAL_SERVICES
    | `String "MANAGED_SERVICES" -> MANAGED_SERVICES
    | `String "HARDWARE_PRODUCTS" -> HARDWARE_PRODUCTS
    | `String "COMMUNICATION_SERVICES" -> COMMUNICATION_SERVICES
    | `String "VALUE_ADDED_RESALE_AWS_SERVICES" -> VALUE_ADDED_RESALE_AWS_SERVICES
    | `String "TRAINING_SERVICES" -> TRAINING_SERVICES
    | `String value -> raise (deserialize_unknown_enum_value_error path "PrimarySolutionType" value)
    | _ -> raise (deserialize_wrong_type_error path "PrimarySolutionType")
     : primary_solution_type)
    : primary_solution_type)

let task_details_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     display_name = value_for_key unicode_string_of_yojson "DisplayName" _list path;
     description = value_for_key unicode_string_of_yojson "Description" _list path;
     website_url = value_for_key url_of_yojson "WebsiteUrl" _list path;
     logo_url = value_for_key url_of_yojson "LogoUrl" _list path;
     primary_solution_type =
       value_for_key primary_solution_type_of_yojson "PrimarySolutionType" _list path;
     industry_segments = value_for_key industry_segment_list_of_yojson "IndustrySegments" _list path;
     translation_source_locale = value_for_key locale_of_yojson "TranslationSourceLocale" _list path;
     localized_contents =
       option_of_yojson
         (value_for_key localized_content_list_of_yojson "LocalizedContents")
         _list path;
   }
    : task_details)

let profile_task_id_of_yojson = string_of_yojson
let partner_id_of_yojson = string_of_yojson
let partner_arn_of_yojson = string_of_yojson

let cancel_profile_update_task_response_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     catalog = value_for_key catalog_of_yojson "Catalog" _list path;
     arn = value_for_key partner_arn_of_yojson "Arn" _list path;
     id = value_for_key partner_id_of_yojson "Id" _list path;
     task_id = value_for_key profile_task_id_of_yojson "TaskId" _list path;
     task_details = value_for_key task_details_of_yojson "TaskDetails" _list path;
     started_at = value_for_key date_time_of_yojson "StartedAt" _list path;
     status = value_for_key profile_task_status_of_yojson "Status" _list path;
     ended_at = option_of_yojson (value_for_key date_time_of_yojson "EndedAt") _list path;
     error_detail_list =
       option_of_yojson (value_for_key error_detail_list_of_yojson "ErrorDetailList") _list path;
   }
    : cancel_profile_update_task_response)

let cancel_profile_update_task_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     catalog = value_for_key catalog_of_yojson "Catalog" _list path;
     identifier = value_for_key partner_identifier_of_yojson "Identifier" _list path;
     client_token = option_of_yojson (value_for_key client_token_of_yojson "ClientToken") _list path;
     task_id = value_for_key profile_task_id_of_yojson "TaskId" _list path;
   }
    : cancel_profile_update_task_request)

let connection_invitation_summary_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     catalog = value_for_key catalog_of_yojson "Catalog" _list path;
     id = value_for_key connection_invitation_id_of_yojson "Id" _list path;
     arn = value_for_key connection_invitation_arn_of_yojson "Arn" _list path;
     connection_id =
       option_of_yojson (value_for_key connection_id_of_yojson "ConnectionId") _list path;
     connection_type = value_for_key connection_type_of_yojson "ConnectionType" _list path;
     created_at = value_for_key date_time_of_yojson "CreatedAt" _list path;
     updated_at = value_for_key date_time_of_yojson "UpdatedAt" _list path;
     expires_at = option_of_yojson (value_for_key date_time_of_yojson "ExpiresAt") _list path;
     other_participant_identifier =
       value_for_key participant_identifier_of_yojson "OtherParticipantIdentifier" _list path;
     participant_type = value_for_key participant_type_of_yojson "ParticipantType" _list path;
     status = value_for_key invitation_status_of_yojson "Status" _list path;
   }
    : connection_invitation_summary)

let connection_invitation_summary_list_of_yojson tree path =
  list_of_yojson connection_invitation_summary_of_yojson tree path

let connection_preferences_arn_of_yojson = string_of_yojson

let connection_type_summary_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     status = value_for_key connection_type_status_of_yojson "Status" _list path;
     other_participant = value_for_key participant_of_yojson "OtherParticipant" _list path;
   }
    : connection_type_summary)

let connection_type_summary_map_of_yojson tree path =
  map_of_yojson connection_type_of_yojson connection_type_summary_of_yojson tree path

let connection_summary_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     catalog = value_for_key catalog_of_yojson "Catalog" _list path;
     id = value_for_key connection_id_of_yojson "Id" _list path;
     arn = value_for_key connection_arn_of_yojson "Arn" _list path;
     other_participant_account_id =
       value_for_key aws_account_id_of_yojson "OtherParticipantAccountId" _list path;
     updated_at = value_for_key date_time_of_yojson "UpdatedAt" _list path;
     connection_types =
       value_for_key connection_type_summary_map_of_yojson "ConnectionTypes" _list path;
   }
    : connection_summary)

let connection_summary_list_of_yojson tree path =
  list_of_yojson connection_summary_of_yojson tree path

let connection_type_filter_of_yojson = string_of_yojson

let create_connection_invitation_response_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     catalog = value_for_key catalog_of_yojson "Catalog" _list path;
     id = value_for_key connection_invitation_id_of_yojson "Id" _list path;
     arn = value_for_key connection_invitation_arn_of_yojson "Arn" _list path;
     connection_id =
       option_of_yojson (value_for_key connection_id_of_yojson "ConnectionId") _list path;
     connection_type = value_for_key connection_type_of_yojson "ConnectionType" _list path;
     created_at = value_for_key date_time_of_yojson "CreatedAt" _list path;
     updated_at = value_for_key date_time_of_yojson "UpdatedAt" _list path;
     expires_at = option_of_yojson (value_for_key date_time_of_yojson "ExpiresAt") _list path;
     other_participant_identifier =
       value_for_key participant_identifier_of_yojson "OtherParticipantIdentifier" _list path;
     participant_type = value_for_key participant_type_of_yojson "ParticipantType" _list path;
     status = value_for_key invitation_status_of_yojson "Status" _list path;
     invitation_message =
       value_for_key unicode_string_including_new_line_of_yojson "InvitationMessage" _list path;
     inviter_email = value_for_key email_of_yojson "InviterEmail" _list path;
     inviter_name = value_for_key sensitive_unicode_string_of_yojson "InviterName" _list path;
   }
    : create_connection_invitation_response)

let create_connection_invitation_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     catalog = value_for_key catalog_of_yojson "Catalog" _list path;
     client_token = value_for_key client_token_of_yojson "ClientToken" _list path;
     connection_type = value_for_key connection_type_of_yojson "ConnectionType" _list path;
     email = value_for_key email_of_yojson "Email" _list path;
     message = value_for_key unicode_string_including_new_line_of_yojson "Message" _list path;
     name = value_for_key sensitive_unicode_string_of_yojson "Name" _list path;
     receiver_identifier =
       value_for_key participant_identifier_of_yojson "ReceiverIdentifier" _list path;
   }
    : create_connection_invitation_request)

let domain_name_of_yojson = string_of_yojson

let partner_domain_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     domain_name = value_for_key domain_name_of_yojson "DomainName" _list path;
     registered_at = value_for_key date_time_of_yojson "RegisteredAt" _list path;
   }
    : partner_domain)

let partner_domain_list_of_yojson tree path = list_of_yojson partner_domain_of_yojson tree path

let partner_profile_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     display_name = value_for_key unicode_string_of_yojson "DisplayName" _list path;
     description = value_for_key unicode_string_of_yojson "Description" _list path;
     website_url = value_for_key url_of_yojson "WebsiteUrl" _list path;
     logo_url = value_for_key url_of_yojson "LogoUrl" _list path;
     primary_solution_type =
       value_for_key primary_solution_type_of_yojson "PrimarySolutionType" _list path;
     industry_segments = value_for_key industry_segment_list_of_yojson "IndustrySegments" _list path;
     translation_source_locale = value_for_key locale_of_yojson "TranslationSourceLocale" _list path;
     localized_contents =
       option_of_yojson
         (value_for_key localized_content_list_of_yojson "LocalizedContents")
         _list path;
     profile_id =
       option_of_yojson (value_for_key partner_profile_id_of_yojson "ProfileId") _list path;
   }
    : partner_profile)

let create_partner_response_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     catalog = value_for_key catalog_of_yojson "Catalog" _list path;
     arn = value_for_key partner_arn_of_yojson "Arn" _list path;
     id = value_for_key partner_id_of_yojson "Id" _list path;
     legal_name = value_for_key sensitive_unicode_string_of_yojson "LegalName" _list path;
     created_at = value_for_key date_time_of_yojson "CreatedAt" _list path;
     profile = value_for_key partner_profile_of_yojson "Profile" _list path;
     aws_training_certification_email_domains =
       option_of_yojson
         (value_for_key partner_domain_list_of_yojson "AwsTrainingCertificationEmailDomains")
         _list path;
     alliance_lead_contact =
       value_for_key alliance_lead_contact_of_yojson "AllianceLeadContact" _list path;
   }
    : create_partner_response)

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

let create_partner_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     catalog = value_for_key catalog_of_yojson "Catalog" _list path;
     client_token = option_of_yojson (value_for_key client_token_of_yojson "ClientToken") _list path;
     legal_name = value_for_key sensitive_unicode_string_of_yojson "LegalName" _list path;
     primary_solution_type =
       value_for_key primary_solution_type_of_yojson "PrimarySolutionType" _list path;
     alliance_lead_contact =
       value_for_key alliance_lead_contact_of_yojson "AllianceLeadContact" _list path;
     email_verification_code =
       value_for_key email_verification_code_of_yojson "EmailVerificationCode" _list path;
     tags = option_of_yojson (value_for_key tag_list_of_yojson "Tags") _list path;
   }
    : create_partner_request)

let disassociate_aws_training_certification_email_domain_response_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  (() : unit)

let disassociate_aws_training_certification_email_domain_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     catalog = value_for_key catalog_of_yojson "Catalog" _list path;
     identifier = value_for_key partner_identifier_of_yojson "Identifier" _list path;
     client_token = option_of_yojson (value_for_key client_token_of_yojson "ClientToken") _list path;
     domain_name = value_for_key domain_name_of_yojson "DomainName" _list path;
   }
    : disassociate_aws_training_certification_email_domain_request)

let get_alliance_lead_contact_response_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     catalog = value_for_key catalog_of_yojson "Catalog" _list path;
     arn = value_for_key partner_arn_of_yojson "Arn" _list path;
     id = value_for_key partner_id_of_yojson "Id" _list path;
     alliance_lead_contact =
       value_for_key alliance_lead_contact_of_yojson "AllianceLeadContact" _list path;
   }
    : get_alliance_lead_contact_response)

let get_alliance_lead_contact_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     catalog = value_for_key catalog_of_yojson "Catalog" _list path;
     identifier = value_for_key partner_identifier_of_yojson "Identifier" _list path;
   }
    : get_alliance_lead_contact_request)

let get_connection_response_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     catalog = value_for_key catalog_of_yojson "Catalog" _list path;
     id = value_for_key connection_id_of_yojson "Id" _list path;
     arn = value_for_key connection_arn_of_yojson "Arn" _list path;
     other_participant_account_id =
       value_for_key aws_account_id_of_yojson "OtherParticipantAccountId" _list path;
     updated_at = value_for_key date_time_of_yojson "UpdatedAt" _list path;
     connection_types =
       value_for_key connection_type_detail_map_of_yojson "ConnectionTypes" _list path;
   }
    : get_connection_response)

let get_connection_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     catalog = value_for_key catalog_of_yojson "Catalog" _list path;
     identifier = value_for_key connection_id_of_yojson "Identifier" _list path;
   }
    : get_connection_request)

let get_connection_invitation_response_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     catalog = value_for_key catalog_of_yojson "Catalog" _list path;
     id = value_for_key connection_invitation_id_of_yojson "Id" _list path;
     arn = value_for_key connection_invitation_arn_of_yojson "Arn" _list path;
     connection_id =
       option_of_yojson (value_for_key connection_id_of_yojson "ConnectionId") _list path;
     connection_type = value_for_key connection_type_of_yojson "ConnectionType" _list path;
     created_at = value_for_key date_time_of_yojson "CreatedAt" _list path;
     updated_at = value_for_key date_time_of_yojson "UpdatedAt" _list path;
     expires_at = option_of_yojson (value_for_key date_time_of_yojson "ExpiresAt") _list path;
     other_participant_identifier =
       value_for_key participant_identifier_of_yojson "OtherParticipantIdentifier" _list path;
     participant_type = value_for_key participant_type_of_yojson "ParticipantType" _list path;
     status = value_for_key invitation_status_of_yojson "Status" _list path;
     invitation_message =
       value_for_key unicode_string_including_new_line_of_yojson "InvitationMessage" _list path;
     inviter_email = value_for_key email_of_yojson "InviterEmail" _list path;
     inviter_name = value_for_key sensitive_unicode_string_of_yojson "InviterName" _list path;
   }
    : get_connection_invitation_response)

let get_connection_invitation_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     catalog = value_for_key catalog_of_yojson "Catalog" _list path;
     identifier = value_for_key connection_invitation_id_of_yojson "Identifier" _list path;
   }
    : get_connection_invitation_request)

let revision_of_yojson = long_of_yojson

let participant_identifier_list_of_yojson tree path =
  list_of_yojson participant_identifier_of_yojson tree path

let get_connection_preferences_response_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     catalog = value_for_key catalog_of_yojson "Catalog" _list path;
     arn = value_for_key connection_preferences_arn_of_yojson "Arn" _list path;
     access_type = value_for_key access_type_of_yojson "AccessType" _list path;
     excluded_participant_ids =
       option_of_yojson
         (value_for_key participant_identifier_list_of_yojson "ExcludedParticipantIds")
         _list path;
     updated_at = value_for_key date_time_of_yojson "UpdatedAt" _list path;
     revision = value_for_key revision_of_yojson "Revision" _list path;
   }
    : get_connection_preferences_response)

let get_connection_preferences_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({ catalog = value_for_key catalog_of_yojson "Catalog" _list path }
    : get_connection_preferences_request)

let get_partner_response_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     catalog = value_for_key catalog_of_yojson "Catalog" _list path;
     arn = value_for_key partner_arn_of_yojson "Arn" _list path;
     id = value_for_key partner_id_of_yojson "Id" _list path;
     legal_name = value_for_key sensitive_unicode_string_of_yojson "LegalName" _list path;
     created_at = value_for_key date_time_of_yojson "CreatedAt" _list path;
     profile = value_for_key partner_profile_of_yojson "Profile" _list path;
     aws_training_certification_email_domains =
       option_of_yojson
         (value_for_key partner_domain_list_of_yojson "AwsTrainingCertificationEmailDomains")
         _list path;
   }
    : get_partner_response)

let get_partner_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     catalog = value_for_key catalog_of_yojson "Catalog" _list path;
     identifier = value_for_key partner_identifier_of_yojson "Identifier" _list path;
   }
    : get_partner_request)

let get_profile_update_task_response_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     catalog = value_for_key catalog_of_yojson "Catalog" _list path;
     arn = value_for_key partner_arn_of_yojson "Arn" _list path;
     id = value_for_key partner_id_of_yojson "Id" _list path;
     task_id = value_for_key profile_task_id_of_yojson "TaskId" _list path;
     task_details = value_for_key task_details_of_yojson "TaskDetails" _list path;
     started_at = value_for_key date_time_of_yojson "StartedAt" _list path;
     status = value_for_key profile_task_status_of_yojson "Status" _list path;
     ended_at = option_of_yojson (value_for_key date_time_of_yojson "EndedAt") _list path;
     error_detail_list =
       option_of_yojson (value_for_key error_detail_list_of_yojson "ErrorDetailList") _list path;
   }
    : get_profile_update_task_response)

let get_profile_update_task_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     catalog = value_for_key catalog_of_yojson "Catalog" _list path;
     identifier = value_for_key partner_identifier_of_yojson "Identifier" _list path;
   }
    : get_profile_update_task_request)

let profile_visibility_of_yojson (tree : t) path =
  ((match tree with
    | `String "PRIVATE" -> PRIVATE
    | `String "PUBLIC" -> PUBLIC
    | `String value -> raise (deserialize_unknown_enum_value_error path "ProfileVisibility" value)
    | _ -> raise (deserialize_wrong_type_error path "ProfileVisibility")
     : profile_visibility)
    : profile_visibility)

let get_profile_visibility_response_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     catalog = value_for_key catalog_of_yojson "Catalog" _list path;
     arn = value_for_key partner_arn_of_yojson "Arn" _list path;
     id = value_for_key partner_id_of_yojson "Id" _list path;
     visibility = value_for_key profile_visibility_of_yojson "Visibility" _list path;
     profile_id = value_for_key partner_profile_id_of_yojson "ProfileId" _list path;
   }
    : get_profile_visibility_response)

let get_profile_visibility_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     catalog = value_for_key catalog_of_yojson "Catalog" _list path;
     identifier = value_for_key partner_identifier_of_yojson "Identifier" _list path;
   }
    : get_profile_visibility_request)

let registrant_verification_response_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     completion_url = value_for_key completion_url_of_yojson "CompletionUrl" _list path;
     completion_url_expires_at =
       value_for_key date_time_of_yojson "CompletionUrlExpiresAt" _list path;
   }
    : registrant_verification_response)

let verification_response_details_of_yojson (tree : t) path =
  let _list = assoc_of_yojson tree path in
  let key, value_ =
    match _list with
    | (key, value_) :: _ -> (key, value_)
    | _ -> raise (deserialize_wrong_type_error path "union")
  in
  (match key with
   | "BusinessVerificationResponse" ->
       BusinessVerificationResponse (business_verification_response_of_yojson value_ path)
   | "RegistrantVerificationResponse" ->
       RegistrantVerificationResponse (registrant_verification_response_of_yojson value_ path)
   | _ as unknown ->
       raise (deserialize_unknown_enum_value_error path "VerificationResponseDetails" unknown)
    : verification_response_details)

let verification_status_reason_of_yojson = string_of_yojson

let verification_status_of_yojson (tree : t) path =
  ((match tree with
    | `String "PENDING_CUSTOMER_ACTION" -> PENDING_CUSTOMER_ACTION
    | `String "IN_PROGRESS" -> IN_PROGRESS
    | `String "FAILED" -> FAILED
    | `String "SUCCEEDED" -> SUCCEEDED
    | `String "REJECTED" -> REJECTED
    | `String value -> raise (deserialize_unknown_enum_value_error path "VerificationStatus" value)
    | _ -> raise (deserialize_wrong_type_error path "VerificationStatus")
     : verification_status)
    : verification_status)

let verification_type_of_yojson (tree : t) path =
  ((match tree with
    | `String "BUSINESS_VERIFICATION" -> BUSINESS_VERIFICATION
    | `String "REGISTRANT_VERIFICATION" -> REGISTRANT_VERIFICATION
    | `String value -> raise (deserialize_unknown_enum_value_error path "VerificationType" value)
    | _ -> raise (deserialize_wrong_type_error path "VerificationType")
     : verification_type)
    : verification_type)

let get_verification_response_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     verification_type = value_for_key verification_type_of_yojson "VerificationType" _list path;
     verification_status =
       value_for_key verification_status_of_yojson "VerificationStatus" _list path;
     verification_status_reason =
       option_of_yojson
         (value_for_key verification_status_reason_of_yojson "VerificationStatusReason")
         _list path;
     verification_response_details =
       value_for_key verification_response_details_of_yojson "VerificationResponseDetails" _list
         path;
     started_at = value_for_key date_time_of_yojson "StartedAt" _list path;
     completed_at = option_of_yojson (value_for_key date_time_of_yojson "CompletedAt") _list path;
   }
    : get_verification_response)

let get_verification_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({ verification_type = value_for_key verification_type_of_yojson "VerificationType" _list path }
    : get_verification_request)

let next_token_of_yojson = string_of_yojson

let list_connection_invitations_response_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     connection_invitation_summaries =
       value_for_key connection_invitation_summary_list_of_yojson "ConnectionInvitationSummaries"
         _list path;
     next_token = option_of_yojson (value_for_key next_token_of_yojson "NextToken") _list path;
   }
    : list_connection_invitations_response)

let max_results_of_yojson = int_of_yojson

let list_connection_invitations_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     catalog = value_for_key catalog_of_yojson "Catalog" _list path;
     next_token = option_of_yojson (value_for_key next_token_of_yojson "NextToken") _list path;
     connection_type =
       option_of_yojson (value_for_key connection_type_of_yojson "ConnectionType") _list path;
     max_results = option_of_yojson (value_for_key max_results_of_yojson "MaxResults") _list path;
     other_participant_identifiers =
       option_of_yojson
         (value_for_key participant_identifier_list_of_yojson "OtherParticipantIdentifiers")
         _list path;
     participant_type =
       option_of_yojson (value_for_key participant_type_of_yojson "ParticipantType") _list path;
     status = option_of_yojson (value_for_key invitation_status_of_yojson "Status") _list path;
   }
    : list_connection_invitations_request)

let list_connections_response_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     connection_summaries =
       value_for_key connection_summary_list_of_yojson "ConnectionSummaries" _list path;
     next_token = option_of_yojson (value_for_key next_token_of_yojson "NextToken") _list path;
   }
    : list_connections_response)

let list_connections_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     catalog = value_for_key catalog_of_yojson "Catalog" _list path;
     next_token = option_of_yojson (value_for_key next_token_of_yojson "NextToken") _list path;
     connection_type =
       option_of_yojson (value_for_key connection_type_filter_of_yojson "ConnectionType") _list path;
     max_results = option_of_yojson (value_for_key max_results_of_yojson "MaxResults") _list path;
     other_participant_identifiers =
       option_of_yojson
         (value_for_key participant_identifier_list_of_yojson "OtherParticipantIdentifiers")
         _list path;
   }
    : list_connections_request)

let partner_summary_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     catalog = value_for_key catalog_of_yojson "Catalog" _list path;
     arn = value_for_key partner_arn_of_yojson "Arn" _list path;
     id = value_for_key partner_id_of_yojson "Id" _list path;
     legal_name = value_for_key sensitive_unicode_string_of_yojson "LegalName" _list path;
     created_at = value_for_key date_time_of_yojson "CreatedAt" _list path;
   }
    : partner_summary)

let partner_summary_list_of_yojson tree path = list_of_yojson partner_summary_of_yojson tree path

let list_partners_response_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     partner_summary_list =
       value_for_key partner_summary_list_of_yojson "PartnerSummaryList" _list path;
     next_token = option_of_yojson (value_for_key next_token_of_yojson "NextToken") _list path;
   }
    : list_partners_response)

let list_partners_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     catalog = value_for_key catalog_of_yojson "Catalog" _list path;
     next_token = option_of_yojson (value_for_key next_token_of_yojson "NextToken") _list path;
   }
    : list_partners_request)

let taggable_resource_arn_of_yojson = string_of_yojson

let list_tags_for_resource_response_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     resource_arn = value_for_key taggable_resource_arn_of_yojson "ResourceArn" _list path;
     tags = option_of_yojson (value_for_key tag_list_of_yojson "Tags") _list path;
   }
    : list_tags_for_resource_response)

let list_tags_for_resource_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({ resource_arn = value_for_key taggable_resource_arn_of_yojson "ResourceArn" _list path }
    : list_tags_for_resource_request)

let untag_resource_response_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  (() : unit)

let tag_key_list_of_yojson tree path = list_of_yojson tag_key_of_yojson tree path

let untag_resource_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     resource_arn = value_for_key taggable_resource_arn_of_yojson "ResourceArn" _list path;
     tag_keys = value_for_key tag_key_list_of_yojson "TagKeys" _list path;
   }
    : untag_resource_request)

let tag_resource_response_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  (() : unit)

let tag_resource_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     resource_arn = value_for_key taggable_resource_arn_of_yojson "ResourceArn" _list path;
     tags = value_for_key tag_list_of_yojson "Tags" _list path;
   }
    : tag_resource_request)

let start_verification_response_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     verification_type = value_for_key verification_type_of_yojson "VerificationType" _list path;
     verification_status =
       value_for_key verification_status_of_yojson "VerificationStatus" _list path;
     verification_status_reason =
       option_of_yojson
         (value_for_key verification_status_reason_of_yojson "VerificationStatusReason")
         _list path;
     verification_response_details =
       value_for_key verification_response_details_of_yojson "VerificationResponseDetails" _list
         path;
     started_at = value_for_key date_time_of_yojson "StartedAt" _list path;
     completed_at = option_of_yojson (value_for_key date_time_of_yojson "CompletedAt") _list path;
   }
    : start_verification_response)

let registrant_verification_details_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  (() : unit)

let verification_details_of_yojson (tree : t) path =
  let _list = assoc_of_yojson tree path in
  let key, value_ =
    match _list with
    | (key, value_) :: _ -> (key, value_)
    | _ -> raise (deserialize_wrong_type_error path "union")
  in
  (match key with
   | "BusinessVerificationDetails" ->
       BusinessVerificationDetails (business_verification_details_of_yojson value_ path)
   | "RegistrantVerificationDetails" ->
       RegistrantVerificationDetails (registrant_verification_details_of_yojson value_ path)
   | _ as unknown -> raise (deserialize_unknown_enum_value_error path "VerificationDetails" unknown)
    : verification_details)

let start_verification_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     client_token = option_of_yojson (value_for_key client_token_of_yojson "ClientToken") _list path;
     verification_details =
       option_of_yojson
         (value_for_key verification_details_of_yojson "VerificationDetails")
         _list path;
   }
    : start_verification_request)

let send_email_verification_code_response_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  (() : unit)

let send_email_verification_code_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     catalog = value_for_key catalog_of_yojson "Catalog" _list path;
     email = value_for_key email_of_yojson "Email" _list path;
   }
    : send_email_verification_code_request)

let put_alliance_lead_contact_response_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     catalog = value_for_key catalog_of_yojson "Catalog" _list path;
     arn = value_for_key partner_arn_of_yojson "Arn" _list path;
     id = value_for_key partner_id_of_yojson "Id" _list path;
     alliance_lead_contact =
       value_for_key alliance_lead_contact_of_yojson "AllianceLeadContact" _list path;
   }
    : put_alliance_lead_contact_response)

let put_alliance_lead_contact_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     catalog = value_for_key catalog_of_yojson "Catalog" _list path;
     identifier = value_for_key partner_identifier_of_yojson "Identifier" _list path;
     alliance_lead_contact =
       value_for_key alliance_lead_contact_of_yojson "AllianceLeadContact" _list path;
     email_verification_code =
       option_of_yojson
         (value_for_key email_verification_code_of_yojson "EmailVerificationCode")
         _list path;
   }
    : put_alliance_lead_contact_request)

let put_profile_visibility_response_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     catalog = value_for_key catalog_of_yojson "Catalog" _list path;
     arn = value_for_key partner_arn_of_yojson "Arn" _list path;
     id = value_for_key partner_id_of_yojson "Id" _list path;
     visibility = value_for_key profile_visibility_of_yojson "Visibility" _list path;
     profile_id = value_for_key partner_profile_id_of_yojson "ProfileId" _list path;
   }
    : put_profile_visibility_response)

let put_profile_visibility_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     catalog = value_for_key catalog_of_yojson "Catalog" _list path;
     identifier = value_for_key partner_identifier_of_yojson "Identifier" _list path;
     visibility = value_for_key profile_visibility_of_yojson "Visibility" _list path;
   }
    : put_profile_visibility_request)

let reject_connection_invitation_response_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     catalog = value_for_key catalog_of_yojson "Catalog" _list path;
     id = value_for_key connection_invitation_id_of_yojson "Id" _list path;
     arn = value_for_key connection_invitation_arn_of_yojson "Arn" _list path;
     connection_id =
       option_of_yojson (value_for_key connection_id_of_yojson "ConnectionId") _list path;
     connection_type = value_for_key connection_type_of_yojson "ConnectionType" _list path;
     created_at = value_for_key date_time_of_yojson "CreatedAt" _list path;
     updated_at = value_for_key date_time_of_yojson "UpdatedAt" _list path;
     expires_at = option_of_yojson (value_for_key date_time_of_yojson "ExpiresAt") _list path;
     other_participant_identifier =
       value_for_key participant_identifier_of_yojson "OtherParticipantIdentifier" _list path;
     participant_type = value_for_key participant_type_of_yojson "ParticipantType" _list path;
     status = value_for_key invitation_status_of_yojson "Status" _list path;
     invitation_message =
       value_for_key unicode_string_including_new_line_of_yojson "InvitationMessage" _list path;
     inviter_email = value_for_key email_of_yojson "InviterEmail" _list path;
     inviter_name = value_for_key sensitive_unicode_string_of_yojson "InviterName" _list path;
   }
    : reject_connection_invitation_response)

let reject_connection_invitation_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     catalog = value_for_key catalog_of_yojson "Catalog" _list path;
     identifier = value_for_key connection_invitation_id_of_yojson "Identifier" _list path;
     client_token = value_for_key client_token_of_yojson "ClientToken" _list path;
     reason =
       option_of_yojson
         (value_for_key Smaws_Lib.Smithy_api.Json_deserializers.string__of_yojson "Reason")
         _list path;
   }
    : reject_connection_invitation_request)

let start_profile_update_task_response_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     catalog = value_for_key catalog_of_yojson "Catalog" _list path;
     arn = value_for_key partner_arn_of_yojson "Arn" _list path;
     id = value_for_key partner_id_of_yojson "Id" _list path;
     task_id = value_for_key profile_task_id_of_yojson "TaskId" _list path;
     task_details = value_for_key task_details_of_yojson "TaskDetails" _list path;
     started_at = value_for_key date_time_of_yojson "StartedAt" _list path;
     status = value_for_key profile_task_status_of_yojson "Status" _list path;
     ended_at = option_of_yojson (value_for_key date_time_of_yojson "EndedAt") _list path;
     error_detail_list =
       option_of_yojson (value_for_key error_detail_list_of_yojson "ErrorDetailList") _list path;
   }
    : start_profile_update_task_response)

let start_profile_update_task_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     catalog = value_for_key catalog_of_yojson "Catalog" _list path;
     identifier = value_for_key partner_identifier_of_yojson "Identifier" _list path;
     client_token = option_of_yojson (value_for_key client_token_of_yojson "ClientToken") _list path;
     task_details = value_for_key task_details_of_yojson "TaskDetails" _list path;
   }
    : start_profile_update_task_request)

let update_connection_preferences_response_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     catalog = value_for_key catalog_of_yojson "Catalog" _list path;
     arn = value_for_key connection_preferences_arn_of_yojson "Arn" _list path;
     access_type = value_for_key access_type_of_yojson "AccessType" _list path;
     excluded_participant_ids =
       option_of_yojson
         (value_for_key participant_identifier_list_of_yojson "ExcludedParticipantIds")
         _list path;
     updated_at = value_for_key date_time_of_yojson "UpdatedAt" _list path;
     revision = value_for_key revision_of_yojson "Revision" _list path;
   }
    : update_connection_preferences_response)

let update_connection_preferences_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     catalog = value_for_key catalog_of_yojson "Catalog" _list path;
     revision = value_for_key revision_of_yojson "Revision" _list path;
     access_type = value_for_key access_type_of_yojson "AccessType" _list path;
     excluded_participant_identifiers =
       option_of_yojson
         (value_for_key participant_identifier_list_of_yojson "ExcludedParticipantIdentifiers")
         _list path;
   }
    : update_connection_preferences_request)
