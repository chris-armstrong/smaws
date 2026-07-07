open Smaws_Lib.Json.SerializeHelpers
open Types

let verification_type_to_yojson (x : verification_type) =
  match x with
  | REGISTRANT_VERIFICATION -> `String "REGISTRANT_VERIFICATION"
  | BUSINESS_VERIFICATION -> `String "BUSINESS_VERIFICATION"

let verification_status_reason_to_yojson = string_to_yojson

let verification_status_to_yojson (x : verification_status) =
  match x with
  | REJECTED -> `String "REJECTED"
  | SUCCEEDED -> `String "SUCCEEDED"
  | FAILED -> `String "FAILED"
  | IN_PROGRESS -> `String "IN_PROGRESS"
  | PENDING_CUSTOMER_ACTION -> `String "PENDING_CUSTOMER_ACTION"

let legal_name_to_yojson = string_to_yojson
let registration_id_to_yojson = string_to_yojson
let country_code_to_yojson = string_to_yojson
let jurisdiction_code_to_yojson = string_to_yojson

let business_verification_details_to_yojson (x : business_verification_details) =
  assoc_to_yojson
    [
      ( "JurisdictionOfIncorporation",
        option_to_yojson jurisdiction_code_to_yojson x.jurisdiction_of_incorporation );
      ("CountryCode", Some (country_code_to_yojson x.country_code));
      ("RegistrationId", Some (registration_id_to_yojson x.registration_id));
      ("LegalName", Some (legal_name_to_yojson x.legal_name));
    ]

let completion_url_to_yojson = string_to_yojson
let date_time_to_yojson = timestamp_iso_8601_to_yojson

let business_verification_response_to_yojson (x : business_verification_response) =
  assoc_to_yojson
    [
      ("CompletionUrlExpiresAt", option_to_yojson date_time_to_yojson x.completion_url_expires_at);
      ("CompletionUrl", option_to_yojson completion_url_to_yojson x.completion_url);
      ( "BusinessVerificationDetails",
        Some (business_verification_details_to_yojson x.business_verification_details) );
    ]

let registrant_verification_response_to_yojson (x : registrant_verification_response) =
  assoc_to_yojson
    [
      ("CompletionUrlExpiresAt", Some (date_time_to_yojson x.completion_url_expires_at));
      ("CompletionUrl", Some (completion_url_to_yojson x.completion_url));
    ]

let verification_response_details_to_yojson (x : verification_response_details) =
  match x with
  | RegistrantVerificationResponse arg ->
      assoc_to_yojson
        [
          ("RegistrantVerificationResponse", Some (registrant_verification_response_to_yojson arg));
        ]
  | BusinessVerificationResponse arg ->
      assoc_to_yojson
        [ ("BusinessVerificationResponse", Some (business_verification_response_to_yojson arg)) ]

let registrant_verification_details_to_yojson = unit_to_yojson

let verification_details_to_yojson (x : verification_details) =
  match x with
  | RegistrantVerificationDetails arg ->
      assoc_to_yojson
        [ ("RegistrantVerificationDetails", Some (registrant_verification_details_to_yojson arg)) ]
  | BusinessVerificationDetails arg ->
      assoc_to_yojson
        [ ("BusinessVerificationDetails", Some (business_verification_details_to_yojson arg)) ]

let validation_exception_reason_to_yojson (x : validation_exception_reason) =
  match x with
  | BUSINESS_VALIDATION_FAILED -> `String "BUSINESS_VALIDATION_FAILED"
  | REQUEST_VALIDATION_FAILED -> `String "REQUEST_VALIDATION_FAILED"

let field_validation_code_to_yojson (x : field_validation_code) =
  match x with
  | INVALID_ENUM_VALUE -> `String "INVALID_ENUM_VALUE"
  | ACTION_NOT_PERMITTED -> `String "ACTION_NOT_PERMITTED"
  | TOO_MANY_VALUES -> `String "TOO_MANY_VALUES"
  | INVALID_STRING_FORMAT -> `String "INVALID_STRING_FORMAT"
  | INVALID_VALUE -> `String "INVALID_VALUE"
  | DUPLICATE_VALUE -> `String "DUPLICATE_VALUE"
  | REQUIRED_FIELD_MISSING -> `String "REQUIRED_FIELD_MISSING"

let field_validation_error_to_yojson (x : field_validation_error) =
  assoc_to_yojson
    [
      ("Code", Some (field_validation_code_to_yojson x.code));
      ("Message", Some (Smaws_Lib.Smithy_api.Json_serializers.string__to_yojson x.message));
      ("Name", Some (Smaws_Lib.Smithy_api.Json_serializers.string__to_yojson x.name));
    ]

let business_validation_code_to_yojson (x : business_validation_code) =
  match x with
  | INELIGIBLE_ACCOUNT_TIER -> `String "INELIGIBLE_ACCOUNT_TIER"
  | INCOMPATIBLE_DOMAIN -> `String "INCOMPATIBLE_DOMAIN"
  | INVALID_ACCOUNT_STATE -> `String "INVALID_ACCOUNT_STATE"
  | INVALID_ACCOUNT_LINKING_STATUS -> `String "INVALID_ACCOUNT_LINKING_STATUS"
  | INCOMPATIBLE_IDENTITY_VERIFICATION_STATUS -> `String "INCOMPATIBLE_IDENTITY_VERIFICATION_STATUS"
  | INCOMPATIBLE_KNOW_YOUR_BUSINESS_STATUS -> `String "INCOMPATIBLE_KNOW_YOUR_BUSINESS_STATUS"
  | INCOMPATIBLE_LEGAL_NAME -> `String "INCOMPATIBLE_LEGAL_NAME"
  | INCOMPATIBLE_CONNECTION_INVITATION_REQUEST ->
      `String "INCOMPATIBLE_CONNECTION_INVITATION_REQUEST"

let business_validation_error_to_yojson (x : business_validation_error) =
  assoc_to_yojson
    [
      ("Code", Some (business_validation_code_to_yojson x.code));
      ("Message", Some (Smaws_Lib.Smithy_api.Json_serializers.string__to_yojson x.message));
    ]

let validation_error_to_yojson (x : validation_error) =
  match x with
  | BusinessValidationError arg ->
      assoc_to_yojson
        [ ("BusinessValidationError", Some (business_validation_error_to_yojson arg)) ]
  | FieldValidationError arg ->
      assoc_to_yojson [ ("FieldValidationError", Some (field_validation_error_to_yojson arg)) ]

let validation_error_list_to_yojson tree = list_to_yojson validation_error_to_yojson tree

let validation_exception_to_yojson (x : validation_exception) =
  assoc_to_yojson
    [
      ("ErrorDetails", option_to_yojson validation_error_list_to_yojson x.error_details);
      ("Reason", Some (validation_exception_reason_to_yojson x.reason));
      ("Message", Some (Smaws_Lib.Smithy_api.Json_serializers.string__to_yojson x.message));
    ]

let url_to_yojson = string_to_yojson
let catalog_to_yojson = string_to_yojson
let connection_preferences_arn_to_yojson = string_to_yojson

let access_type_to_yojson (x : access_type) =
  match x with
  | ALLOW_BY_DEFAULT_DENY_SOME -> `String "ALLOW_BY_DEFAULT_DENY_SOME"
  | DENY_ALL -> `String "DENY_ALL"
  | ALLOW_ALL -> `String "ALLOW_ALL"

let participant_identifier_to_yojson = string_to_yojson

let participant_identifier_list_to_yojson tree =
  list_to_yojson participant_identifier_to_yojson tree

let revision_to_yojson = long_to_yojson

let update_connection_preferences_response_to_yojson (x : update_connection_preferences_response) =
  assoc_to_yojson
    [
      ("Revision", Some (revision_to_yojson x.revision));
      ("UpdatedAt", Some (date_time_to_yojson x.updated_at));
      ( "ExcludedParticipantIds",
        option_to_yojson participant_identifier_list_to_yojson x.excluded_participant_ids );
      ("AccessType", Some (access_type_to_yojson x.access_type));
      ("Arn", Some (connection_preferences_arn_to_yojson x.arn));
      ("Catalog", Some (catalog_to_yojson x.catalog));
    ]

let update_connection_preferences_request_to_yojson (x : update_connection_preferences_request) =
  assoc_to_yojson
    [
      ( "ExcludedParticipantIdentifiers",
        option_to_yojson participant_identifier_list_to_yojson x.excluded_participant_identifiers );
      ("AccessType", Some (access_type_to_yojson x.access_type));
      ("Revision", Some (revision_to_yojson x.revision));
      ("Catalog", Some (catalog_to_yojson x.catalog));
    ]

let throttling_exception_to_yojson (x : throttling_exception) =
  assoc_to_yojson
    [
      ( "QuotaCode",
        option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.string__to_yojson x.quota_code );
      ( "ServiceCode",
        option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.string__to_yojson x.service_code );
      ("Message", Some (Smaws_Lib.Smithy_api.Json_serializers.string__to_yojson x.message));
    ]

let internal_server_exception_to_yojson (x : internal_server_exception) =
  assoc_to_yojson
    [ ("Message", Some (Smaws_Lib.Smithy_api.Json_serializers.string__to_yojson x.message)) ]

let conflict_exception_reason_to_yojson (x : conflict_exception_reason) =
  match x with
  | VERIFICATION_ALREADY_IN_PROGRESS -> `String "VERIFICATION_ALREADY_IN_PROGRESS"
  | ACCOUNT_ALREADY_VERIFIED -> `String "ACCOUNT_ALREADY_VERIFIED"
  | INCOMPATIBLE_CONNECTION_PREFERENCES_REVISION ->
      `String "INCOMPATIBLE_CONNECTION_PREFERENCES_REVISION"
  | INCOMPATIBLE_CONNECTION_STATE -> `String "INCOMPATIBLE_CONNECTION_STATE"
  | DUPLICATE_CONNECTION -> `String "DUPLICATE_CONNECTION"
  | INCOMPATIBLE_CONNECTION_INVITATION_RECEIVER ->
      `String "INCOMPATIBLE_CONNECTION_INVITATION_RECEIVER"
  | INCOMPATIBLE_CONNECTION_INVITATION_STATE -> `String "INCOMPATIBLE_CONNECTION_INVITATION_STATE"
  | DUPLICATE_CONNECTION_INVITATION -> `String "DUPLICATE_CONNECTION_INVITATION"
  | INCOMPATIBLE_PARTNER_PROFILE_TASK_STATE -> `String "INCOMPATIBLE_PARTNER_PROFILE_TASK_STATE"
  | INCOMPATIBLE_PROFILE_STATE -> `String "INCOMPATIBLE_PROFILE_STATE"
  | DUPLICATE_PARTNER -> `String "DUPLICATE_PARTNER"
  | CONFLICT_CLIENT_TOKEN -> `String "CONFLICT_CLIENT_TOKEN"

let conflict_exception_to_yojson (x : conflict_exception) =
  assoc_to_yojson
    [
      ("Reason", Some (conflict_exception_reason_to_yojson x.reason));
      ("Message", Some (Smaws_Lib.Smithy_api.Json_serializers.string__to_yojson x.message));
    ]

let access_denied_exception_reason_to_yojson (x : access_denied_exception_reason) =
  match x with
  | INCOMPATIBLE_BENEFIT_AWS_PARTNER_STATE -> `String "INCOMPATIBLE_BENEFIT_AWS_PARTNER_STATE"
  | ACCESS_DENIED -> `String "ACCESS_DENIED"

let access_denied_exception_to_yojson (x : access_denied_exception) =
  assoc_to_yojson
    [
      ("Reason", Some (access_denied_exception_reason_to_yojson x.reason));
      ("Message", Some (Smaws_Lib.Smithy_api.Json_serializers.string__to_yojson x.message));
    ]

let untag_resource_response_to_yojson = unit_to_yojson
let taggable_resource_arn_to_yojson = string_to_yojson
let tag_key_to_yojson = string_to_yojson
let tag_key_list_to_yojson tree = list_to_yojson tag_key_to_yojson tree

let untag_resource_request_to_yojson (x : untag_resource_request) =
  assoc_to_yojson
    [
      ("TagKeys", Some (tag_key_list_to_yojson x.tag_keys));
      ("ResourceArn", Some (taggable_resource_arn_to_yojson x.resource_arn));
    ]

let resource_not_found_exception_reason_to_yojson (x : resource_not_found_exception_reason) =
  match x with
  | VERIFICATION_NOT_FOUND -> `String "VERIFICATION_NOT_FOUND"
  | CONNECTION_NOT_FOUND -> `String "CONNECTION_NOT_FOUND"
  | CONNECTION_INVITATION_NOT_FOUND -> `String "CONNECTION_INVITATION_NOT_FOUND"
  | RECEIVER_PROFILE_NOT_FOUND -> `String "RECEIVER_PROFILE_NOT_FOUND"
  | SENDER_PROFILE_NOT_FOUND -> `String "SENDER_PROFILE_NOT_FOUND"
  | PARTNER_DOMAIN_NOT_FOUND -> `String "PARTNER_DOMAIN_NOT_FOUND"
  | PARTNER_PROFILE_TASK_NOT_FOUND -> `String "PARTNER_PROFILE_TASK_NOT_FOUND"
  | PARTNER_PROFILE_NOT_FOUND -> `String "PARTNER_PROFILE_NOT_FOUND"
  | PARTNER_NOT_FOUND -> `String "PARTNER_NOT_FOUND"

let resource_not_found_exception_to_yojson (x : resource_not_found_exception) =
  assoc_to_yojson
    [
      ("Reason", Some (resource_not_found_exception_reason_to_yojson x.reason));
      ("Message", Some (Smaws_Lib.Smithy_api.Json_serializers.string__to_yojson x.message));
    ]

let unicode_string_including_new_line_to_yojson = string_to_yojson
let unicode_string_to_yojson = string_to_yojson

let primary_solution_type_to_yojson (x : primary_solution_type) =
  match x with
  | TRAINING_SERVICES -> `String "TRAINING_SERVICES"
  | VALUE_ADDED_RESALE_AWS_SERVICES -> `String "VALUE_ADDED_RESALE_AWS_SERVICES"
  | COMMUNICATION_SERVICES -> `String "COMMUNICATION_SERVICES"
  | HARDWARE_PRODUCTS -> `String "HARDWARE_PRODUCTS"
  | MANAGED_SERVICES -> `String "MANAGED_SERVICES"
  | PROFESSIONAL_SERVICES -> `String "PROFESSIONAL_SERVICES"
  | CONSULTING_SERVICES -> `String "CONSULTING_SERVICES"
  | SOFTWARE_PRODUCTS -> `String "SOFTWARE_PRODUCTS"

let industry_segment_to_yojson (x : industry_segment) =
  match x with
  | WHOLESALE_DISTRIBUTION -> `String "WHOLESALE_DISTRIBUTION"
  | TRAVEL_HOSPITALITY -> `String "TRAVEL_HOSPITALITY"
  | TRANSPORTATION_LOGISTICS -> `String "TRANSPORTATION_LOGISTICS"
  | TELECOMMUNICATIONS -> `String "TELECOMMUNICATIONS"
  | SOFTWARE_INTERNET -> `String "SOFTWARE_INTERNET"
  | SEMICONDUCTOR_ELECTR -> `String "SEMICONDUCTOR_ELECTR"
  | RETAIL_WHOLESALE_DISTRIBUTION -> `String "RETAIL_WHOLESALE_DISTRIBUTION"
  | RETAIL -> `String "RETAIL"
  | REAL_ESTATE_CONSTRUCTION -> `String "REAL_ESTATE_CONSTRUCTION"
  | PROFESSIONAL_SERVICES -> `String "PROFESSIONAL_SERVICES"
  | OTHER -> `String "OTHER"
  | NON_PROFIT_ORGANIZATION -> `String "NON_PROFIT_ORGANIZATION"
  | MEDICAL_HEALTH -> `String "MEDICAL_HEALTH"
  | MEDIA_ENTERTAINMENT -> `String "MEDIA_ENTERTAINMENT"
  | MEDIA_ENTERTAINMENT_LEISURE -> `String "MEDIA_ENTERTAINMENT_LEISURE"
  | MANUFACTURING -> `String "MANUFACTURING"
  | LIFE_SCIENCES -> `String "LIFE_SCIENCES"
  | INTERNET_SPECIFIC -> `String "INTERNET_SPECIFIC"
  | INDUSTRIAL_ENERGY -> `String "INDUSTRIAL_ENERGY"
  | HEALTHCARE_PHARMACEUTICALS_BIOTECH -> `String "HEALTHCARE_PHARMACEUTICALS_BIOTECH"
  | HEALTHCARE -> `String "HEALTHCARE"
  | GOVERNMENT_EDUCATION_PUBLIC_SERVICES -> `String "GOVERNMENT_EDUCATION_PUBLIC_SERVICES"
  | GOVERNMENT -> `String "GOVERNMENT"
  | GAMING -> `String "GAMING"
  | FINANCIAL_SERVICES -> `String "FINANCIAL_SERVICES"
  | ENERGY_UTILITIES -> `String "ENERGY_UTILITIES"
  | EDUCATION -> `String "EDUCATION"
  | CONSUMER_RELATED -> `String "CONSUMER_RELATED"
  | CONSUMER_GOODS -> `String "CONSUMER_GOODS"
  | COMPUTER_SOFTWARE -> `String "COMPUTER_SOFTWARE"
  | COMPUTERS_ELECTRONICS -> `String "COMPUTERS_ELECTRONICS"
  | COMPUTER_HARDWARE -> `String "COMPUTER_HARDWARE"
  | COMMUNICATIONS -> `String "COMMUNICATIONS"
  | BUSINESS_SERV -> `String "BUSINESS_SERV"
  | BUSINESS_CONSUMER_SERVICES -> `String "BUSINESS_CONSUMER_SERVICES"
  | BIOTECHNOLOGY -> `String "BIOTECHNOLOGY"
  | AGRICULTURE_MINING -> `String "AGRICULTURE_MINING"

let industry_segment_list_to_yojson tree = list_to_yojson industry_segment_to_yojson tree
let locale_to_yojson = string_to_yojson

let localized_content_to_yojson (x : localized_content) =
  assoc_to_yojson
    [
      ("Locale", Some (locale_to_yojson x.locale));
      ("LogoUrl", Some (url_to_yojson x.logo_url));
      ("WebsiteUrl", Some (url_to_yojson x.website_url));
      ("Description", Some (unicode_string_to_yojson x.description));
      ("DisplayName", Some (unicode_string_to_yojson x.display_name));
    ]

let localized_content_list_to_yojson tree = list_to_yojson localized_content_to_yojson tree

let task_details_to_yojson (x : task_details) =
  assoc_to_yojson
    [
      ("LocalizedContents", option_to_yojson localized_content_list_to_yojson x.localized_contents);
      ("TranslationSourceLocale", Some (locale_to_yojson x.translation_source_locale));
      ("IndustrySegments", Some (industry_segment_list_to_yojson x.industry_segments));
      ("PrimarySolutionType", Some (primary_solution_type_to_yojson x.primary_solution_type));
      ("LogoUrl", Some (url_to_yojson x.logo_url));
      ("WebsiteUrl", Some (url_to_yojson x.website_url));
      ("Description", Some (unicode_string_to_yojson x.description));
      ("DisplayName", Some (unicode_string_to_yojson x.display_name));
    ]

let tag_value_to_yojson = string_to_yojson
let tag_resource_response_to_yojson = unit_to_yojson

let tag_to_yojson (x : tag) =
  assoc_to_yojson
    [ ("Value", Some (tag_value_to_yojson x.value)); ("Key", Some (tag_key_to_yojson x.key)) ]

let tag_list_to_yojson tree = list_to_yojson tag_to_yojson tree

let tag_resource_request_to_yojson (x : tag_resource_request) =
  assoc_to_yojson
    [
      ("Tags", Some (tag_list_to_yojson x.tags));
      ("ResourceArn", Some (taggable_resource_arn_to_yojson x.resource_arn));
    ]

let start_verification_response_to_yojson (x : start_verification_response) =
  assoc_to_yojson
    [
      ("CompletedAt", option_to_yojson date_time_to_yojson x.completed_at);
      ("StartedAt", Some (date_time_to_yojson x.started_at));
      ( "VerificationResponseDetails",
        Some (verification_response_details_to_yojson x.verification_response_details) );
      ( "VerificationStatusReason",
        option_to_yojson verification_status_reason_to_yojson x.verification_status_reason );
      ("VerificationStatus", Some (verification_status_to_yojson x.verification_status));
      ("VerificationType", Some (verification_type_to_yojson x.verification_type));
    ]

let client_token_to_yojson = string_to_yojson

let start_verification_request_to_yojson (x : start_verification_request) =
  assoc_to_yojson
    [
      ("VerificationDetails", option_to_yojson verification_details_to_yojson x.verification_details);
      ( "ClientToken",
        Some
          (client_token_to_yojson
             (Option.value x.client_token ~default:(Smaws_Lib.Uuid.generate ()))) );
    ]

let service_quota_exceeded_exception_reason_to_yojson (x : service_quota_exceeded_exception_reason)
    =
  match x with
  | LIMIT_EXCEEDED_NUMBER_OF_PROFILE_VISIBILITY_UPDATE_PER_DAY ->
      `String "LIMIT_EXCEEDED_NUMBER_OF_PROFILE_VISIBILITY_UPDATE_PER_DAY"
  | LIMIT_EXCEEDED_NUMBER_OF_PROFILE_UPDATE_PER_DAY ->
      `String "LIMIT_EXCEEDED_NUMBER_OF_PROFILE_UPDATE_PER_DAY"
  | LIMIT_EXCEEDED_NUMBER_OF_OPEN_CONNECTION_INVITATION ->
      `String "LIMIT_EXCEEDED_NUMBER_OF_OPEN_CONNECTION_INVITATION"
  | LIMIT_EXCEEDED_NUMBER_OF_ACTIVE_CONNECTION ->
      `String "LIMIT_EXCEEDED_NUMBER_OF_ACTIVE_CONNECTION"
  | LIMIT_EXCEEDED_NUMBER_OF_CONNECTION_INVITATION_PER_DAY ->
      `String "LIMIT_EXCEEDED_NUMBER_OF_CONNECTION_INVITATION_PER_DAY"
  | LIMIT_EXCEEDED_NUMBER_OF_DOMAIN -> `String "LIMIT_EXCEEDED_NUMBER_OF_DOMAIN"
  | LIMIT_EXCEEDED_NUMBER_OF_EMAIL -> `String "LIMIT_EXCEEDED_NUMBER_OF_EMAIL"

let service_quota_exceeded_exception_to_yojson (x : service_quota_exceeded_exception) =
  assoc_to_yojson
    [
      ("Reason", Some (service_quota_exceeded_exception_reason_to_yojson x.reason));
      ("Message", Some (Smaws_Lib.Smithy_api.Json_serializers.string__to_yojson x.message));
    ]

let partner_arn_to_yojson = string_to_yojson
let partner_id_to_yojson = string_to_yojson
let profile_task_id_to_yojson = string_to_yojson

let profile_task_status_to_yojson (x : profile_task_status) =
  match x with
  | FAILED -> `String "FAILED"
  | SUCCEEDED -> `String "SUCCEEDED"
  | CANCELED -> `String "CANCELED"
  | IN_PROGRESS -> `String "IN_PROGRESS"

let profile_validation_error_reason_to_yojson (x : profile_validation_error_reason) =
  match x with
  | INVALID_WEBSITE_URL -> `String "INVALID_WEBSITE_URL"
  | INVALID_LOGO_SIZE -> `String "INVALID_LOGO_SIZE"
  | INVALID_LOGO_FILE -> `String "INVALID_LOGO_FILE"
  | INVALID_LOGO_URL -> `String "INVALID_LOGO_URL"
  | INVALID_LOGO -> `String "INVALID_LOGO"
  | DUPLICATE_PROFILE -> `String "DUPLICATE_PROFILE"
  | INVALID_CONTENT -> `String "INVALID_CONTENT"

let error_detail_to_yojson (x : error_detail) =
  assoc_to_yojson
    [
      ("Reason", Some (profile_validation_error_reason_to_yojson x.reason));
      ("Message", Some (Smaws_Lib.Smithy_api.Json_serializers.string__to_yojson x.message));
      ("Locale", Some (Smaws_Lib.Smithy_api.Json_serializers.string__to_yojson x.locale));
    ]

let error_detail_list_to_yojson tree = list_to_yojson error_detail_to_yojson tree

let start_profile_update_task_response_to_yojson (x : start_profile_update_task_response) =
  assoc_to_yojson
    [
      ("ErrorDetailList", option_to_yojson error_detail_list_to_yojson x.error_detail_list);
      ("EndedAt", option_to_yojson date_time_to_yojson x.ended_at);
      ("Status", Some (profile_task_status_to_yojson x.status));
      ("StartedAt", Some (date_time_to_yojson x.started_at));
      ("TaskDetails", Some (task_details_to_yojson x.task_details));
      ("TaskId", Some (profile_task_id_to_yojson x.task_id));
      ("Id", Some (partner_id_to_yojson x.id));
      ("Arn", Some (partner_arn_to_yojson x.arn));
      ("Catalog", Some (catalog_to_yojson x.catalog));
    ]

let partner_identifier_to_yojson = string_to_yojson

let start_profile_update_task_request_to_yojson (x : start_profile_update_task_request) =
  assoc_to_yojson
    [
      ("TaskDetails", Some (task_details_to_yojson x.task_details));
      ( "ClientToken",
        Some
          (client_token_to_yojson
             (Option.value x.client_token ~default:(Smaws_Lib.Uuid.generate ()))) );
      ("Identifier", Some (partner_identifier_to_yojson x.identifier));
      ("Catalog", Some (catalog_to_yojson x.catalog));
    ]

let sensitive_unicode_string_to_yojson = string_to_yojson
let send_email_verification_code_response_to_yojson = unit_to_yojson
let email_to_yojson = string_to_yojson

let send_email_verification_code_request_to_yojson (x : send_email_verification_code_request) =
  assoc_to_yojson
    [ ("Email", Some (email_to_yojson x.email)); ("Catalog", Some (catalog_to_yojson x.catalog)) ]

let seller_profile_id_to_yojson = string_to_yojson

let seller_profile_summary_to_yojson (x : seller_profile_summary) =
  assoc_to_yojson
    [
      ("Name", Some (unicode_string_to_yojson x.name));
      ("Id", Some (seller_profile_id_to_yojson x.id));
    ]

let connection_invitation_id_to_yojson = string_to_yojson
let connection_invitation_arn_to_yojson = string_to_yojson
let connection_id_to_yojson = string_to_yojson

let connection_type_to_yojson (x : connection_type) =
  match x with
  | SUBSIDIARY -> `String "SUBSIDIARY"
  | OPPORTUNITY_COLLABORATION -> `String "OPPORTUNITY_COLLABORATION"

let participant_type_to_yojson (x : participant_type) =
  match x with RECEIVER -> `String "RECEIVER" | SENDER -> `String "SENDER"

let invitation_status_to_yojson (x : invitation_status) =
  match x with
  | EXPIRED -> `String "EXPIRED"
  | CANCELED -> `String "CANCELED"
  | REJECTED -> `String "REJECTED"
  | ACCEPTED -> `String "ACCEPTED"
  | PENDING -> `String "PENDING"

let reject_connection_invitation_response_to_yojson (x : reject_connection_invitation_response) =
  assoc_to_yojson
    [
      ("InviterName", Some (sensitive_unicode_string_to_yojson x.inviter_name));
      ("InviterEmail", Some (email_to_yojson x.inviter_email));
      ("InvitationMessage", Some (unicode_string_including_new_line_to_yojson x.invitation_message));
      ("Status", Some (invitation_status_to_yojson x.status));
      ("ParticipantType", Some (participant_type_to_yojson x.participant_type));
      ( "OtherParticipantIdentifier",
        Some (participant_identifier_to_yojson x.other_participant_identifier) );
      ("ExpiresAt", option_to_yojson date_time_to_yojson x.expires_at);
      ("UpdatedAt", Some (date_time_to_yojson x.updated_at));
      ("CreatedAt", Some (date_time_to_yojson x.created_at));
      ("ConnectionType", Some (connection_type_to_yojson x.connection_type));
      ("ConnectionId", option_to_yojson connection_id_to_yojson x.connection_id);
      ("Arn", Some (connection_invitation_arn_to_yojson x.arn));
      ("Id", Some (connection_invitation_id_to_yojson x.id));
      ("Catalog", Some (catalog_to_yojson x.catalog));
    ]

let reject_connection_invitation_request_to_yojson (x : reject_connection_invitation_request) =
  assoc_to_yojson
    [
      ("Reason", option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.string__to_yojson x.reason);
      ("ClientToken", Some (client_token_to_yojson x.client_token));
      ("Identifier", Some (connection_invitation_id_to_yojson x.identifier));
      ("Catalog", Some (catalog_to_yojson x.catalog));
    ]

let profile_visibility_to_yojson (x : profile_visibility) =
  match x with PUBLIC -> `String "PUBLIC" | PRIVATE -> `String "PRIVATE"

let partner_profile_id_to_yojson = string_to_yojson

let put_profile_visibility_response_to_yojson (x : put_profile_visibility_response) =
  assoc_to_yojson
    [
      ("ProfileId", Some (partner_profile_id_to_yojson x.profile_id));
      ("Visibility", Some (profile_visibility_to_yojson x.visibility));
      ("Id", Some (partner_id_to_yojson x.id));
      ("Arn", Some (partner_arn_to_yojson x.arn));
      ("Catalog", Some (catalog_to_yojson x.catalog));
    ]

let put_profile_visibility_request_to_yojson (x : put_profile_visibility_request) =
  assoc_to_yojson
    [
      ("Visibility", Some (profile_visibility_to_yojson x.visibility));
      ("Identifier", Some (partner_identifier_to_yojson x.identifier));
      ("Catalog", Some (catalog_to_yojson x.catalog));
    ]

let alliance_lead_contact_to_yojson (x : alliance_lead_contact) =
  assoc_to_yojson
    [
      ("BusinessTitle", Some (sensitive_unicode_string_to_yojson x.business_title));
      ("Email", Some (email_to_yojson x.email));
      ("LastName", Some (sensitive_unicode_string_to_yojson x.last_name));
      ("FirstName", Some (sensitive_unicode_string_to_yojson x.first_name));
    ]

let put_alliance_lead_contact_response_to_yojson (x : put_alliance_lead_contact_response) =
  assoc_to_yojson
    [
      ("AllianceLeadContact", Some (alliance_lead_contact_to_yojson x.alliance_lead_contact));
      ("Id", Some (partner_id_to_yojson x.id));
      ("Arn", Some (partner_arn_to_yojson x.arn));
      ("Catalog", Some (catalog_to_yojson x.catalog));
    ]

let email_verification_code_to_yojson = string_to_yojson

let put_alliance_lead_contact_request_to_yojson (x : put_alliance_lead_contact_request) =
  assoc_to_yojson
    [
      ( "EmailVerificationCode",
        option_to_yojson email_verification_code_to_yojson x.email_verification_code );
      ("AllianceLeadContact", Some (alliance_lead_contact_to_yojson x.alliance_lead_contact));
      ("Identifier", Some (partner_identifier_to_yojson x.identifier));
      ("Catalog", Some (catalog_to_yojson x.catalog));
    ]

let partner_summary_to_yojson (x : partner_summary) =
  assoc_to_yojson
    [
      ("CreatedAt", Some (date_time_to_yojson x.created_at));
      ("LegalName", Some (sensitive_unicode_string_to_yojson x.legal_name));
      ("Id", Some (partner_id_to_yojson x.id));
      ("Arn", Some (partner_arn_to_yojson x.arn));
      ("Catalog", Some (catalog_to_yojson x.catalog));
    ]

let partner_summary_list_to_yojson tree = list_to_yojson partner_summary_to_yojson tree

let partner_profile_summary_to_yojson (x : partner_profile_summary) =
  assoc_to_yojson
    [
      ("Name", Some (unicode_string_to_yojson x.name));
      ("Id", Some (partner_profile_id_to_yojson x.id));
    ]

let partner_profile_to_yojson (x : partner_profile) =
  assoc_to_yojson
    [
      ("ProfileId", option_to_yojson partner_profile_id_to_yojson x.profile_id);
      ("LocalizedContents", option_to_yojson localized_content_list_to_yojson x.localized_contents);
      ("TranslationSourceLocale", Some (locale_to_yojson x.translation_source_locale));
      ("IndustrySegments", Some (industry_segment_list_to_yojson x.industry_segments));
      ("PrimarySolutionType", Some (primary_solution_type_to_yojson x.primary_solution_type));
      ("LogoUrl", Some (url_to_yojson x.logo_url));
      ("WebsiteUrl", Some (url_to_yojson x.website_url));
      ("Description", Some (unicode_string_to_yojson x.description));
      ("DisplayName", Some (unicode_string_to_yojson x.display_name));
    ]

let domain_name_to_yojson = string_to_yojson

let partner_domain_to_yojson (x : partner_domain) =
  assoc_to_yojson
    [
      ("RegisteredAt", Some (date_time_to_yojson x.registered_at));
      ("DomainName", Some (domain_name_to_yojson x.domain_name));
    ]

let partner_domain_list_to_yojson tree = list_to_yojson partner_domain_to_yojson tree

let list_tags_for_resource_response_to_yojson (x : list_tags_for_resource_response) =
  assoc_to_yojson
    [
      ("Tags", option_to_yojson tag_list_to_yojson x.tags);
      ("ResourceArn", Some (taggable_resource_arn_to_yojson x.resource_arn));
    ]

let list_tags_for_resource_request_to_yojson (x : list_tags_for_resource_request) =
  assoc_to_yojson [ ("ResourceArn", Some (taggable_resource_arn_to_yojson x.resource_arn)) ]

let get_verification_response_to_yojson (x : get_verification_response) =
  assoc_to_yojson
    [
      ("CompletedAt", option_to_yojson date_time_to_yojson x.completed_at);
      ("StartedAt", Some (date_time_to_yojson x.started_at));
      ( "VerificationResponseDetails",
        Some (verification_response_details_to_yojson x.verification_response_details) );
      ( "VerificationStatusReason",
        option_to_yojson verification_status_reason_to_yojson x.verification_status_reason );
      ("VerificationStatus", Some (verification_status_to_yojson x.verification_status));
      ("VerificationType", Some (verification_type_to_yojson x.verification_type));
    ]

let get_verification_request_to_yojson (x : get_verification_request) =
  assoc_to_yojson [ ("VerificationType", Some (verification_type_to_yojson x.verification_type)) ]

let account_summary_to_yojson (x : account_summary) =
  assoc_to_yojson [ ("Name", Some (unicode_string_to_yojson x.name)) ]

let participant_to_yojson (x : participant) =
  match x with
  | Account arg -> assoc_to_yojson [ ("Account", Some (account_summary_to_yojson arg)) ]
  | SellerProfile arg ->
      assoc_to_yojson [ ("SellerProfile", Some (seller_profile_summary_to_yojson arg)) ]
  | PartnerProfile arg ->
      assoc_to_yojson [ ("PartnerProfile", Some (partner_profile_summary_to_yojson arg)) ]

let next_token_to_yojson = string_to_yojson
let max_results_to_yojson = int_to_yojson

let list_partners_response_to_yojson (x : list_partners_response) =
  assoc_to_yojson
    [
      ("NextToken", option_to_yojson next_token_to_yojson x.next_token);
      ("PartnerSummaryList", Some (partner_summary_list_to_yojson x.partner_summary_list));
    ]

let list_partners_request_to_yojson (x : list_partners_request) =
  assoc_to_yojson
    [
      ("NextToken", option_to_yojson next_token_to_yojson x.next_token);
      ("Catalog", Some (catalog_to_yojson x.catalog));
    ]

let connection_arn_to_yojson = string_to_yojson
let aws_account_id_to_yojson = string_to_yojson

let connection_type_status_to_yojson (x : connection_type_status) =
  match x with CANCELED -> `String "CANCELED" | ACTIVE -> `String "ACTIVE"

let connection_type_summary_to_yojson (x : connection_type_summary) =
  assoc_to_yojson
    [
      ("OtherParticipant", Some (participant_to_yojson x.other_participant));
      ("Status", Some (connection_type_status_to_yojson x.status));
    ]

let connection_type_summary_map_to_yojson tree =
  map_to_yojson connection_type_to_yojson connection_type_summary_to_yojson tree

let connection_summary_to_yojson (x : connection_summary) =
  assoc_to_yojson
    [
      ("ConnectionTypes", Some (connection_type_summary_map_to_yojson x.connection_types));
      ("UpdatedAt", Some (date_time_to_yojson x.updated_at));
      ("OtherParticipantAccountId", Some (aws_account_id_to_yojson x.other_participant_account_id));
      ("Arn", Some (connection_arn_to_yojson x.arn));
      ("Id", Some (connection_id_to_yojson x.id));
      ("Catalog", Some (catalog_to_yojson x.catalog));
    ]

let connection_summary_list_to_yojson tree = list_to_yojson connection_summary_to_yojson tree

let list_connections_response_to_yojson (x : list_connections_response) =
  assoc_to_yojson
    [
      ("NextToken", option_to_yojson next_token_to_yojson x.next_token);
      ("ConnectionSummaries", Some (connection_summary_list_to_yojson x.connection_summaries));
    ]

let connection_type_filter_to_yojson = string_to_yojson

let list_connections_request_to_yojson (x : list_connections_request) =
  assoc_to_yojson
    [
      ( "OtherParticipantIdentifiers",
        option_to_yojson participant_identifier_list_to_yojson x.other_participant_identifiers );
      ("MaxResults", option_to_yojson max_results_to_yojson x.max_results);
      ("ConnectionType", option_to_yojson connection_type_filter_to_yojson x.connection_type);
      ("NextToken", option_to_yojson next_token_to_yojson x.next_token);
      ("Catalog", Some (catalog_to_yojson x.catalog));
    ]

let connection_invitation_summary_to_yojson (x : connection_invitation_summary) =
  assoc_to_yojson
    [
      ("Status", Some (invitation_status_to_yojson x.status));
      ("ParticipantType", Some (participant_type_to_yojson x.participant_type));
      ( "OtherParticipantIdentifier",
        Some (participant_identifier_to_yojson x.other_participant_identifier) );
      ("ExpiresAt", option_to_yojson date_time_to_yojson x.expires_at);
      ("UpdatedAt", Some (date_time_to_yojson x.updated_at));
      ("CreatedAt", Some (date_time_to_yojson x.created_at));
      ("ConnectionType", Some (connection_type_to_yojson x.connection_type));
      ("ConnectionId", option_to_yojson connection_id_to_yojson x.connection_id);
      ("Arn", Some (connection_invitation_arn_to_yojson x.arn));
      ("Id", Some (connection_invitation_id_to_yojson x.id));
      ("Catalog", Some (catalog_to_yojson x.catalog));
    ]

let connection_invitation_summary_list_to_yojson tree =
  list_to_yojson connection_invitation_summary_to_yojson tree

let list_connection_invitations_response_to_yojson (x : list_connection_invitations_response) =
  assoc_to_yojson
    [
      ("NextToken", option_to_yojson next_token_to_yojson x.next_token);
      ( "ConnectionInvitationSummaries",
        Some (connection_invitation_summary_list_to_yojson x.connection_invitation_summaries) );
    ]

let list_connection_invitations_request_to_yojson (x : list_connection_invitations_request) =
  assoc_to_yojson
    [
      ("Status", option_to_yojson invitation_status_to_yojson x.status);
      ("ParticipantType", option_to_yojson participant_type_to_yojson x.participant_type);
      ( "OtherParticipantIdentifiers",
        option_to_yojson participant_identifier_list_to_yojson x.other_participant_identifiers );
      ("MaxResults", option_to_yojson max_results_to_yojson x.max_results);
      ("ConnectionType", option_to_yojson connection_type_to_yojson x.connection_type);
      ("NextToken", option_to_yojson next_token_to_yojson x.next_token);
      ("Catalog", Some (catalog_to_yojson x.catalog));
    ]

let get_profile_visibility_response_to_yojson (x : get_profile_visibility_response) =
  assoc_to_yojson
    [
      ("ProfileId", Some (partner_profile_id_to_yojson x.profile_id));
      ("Visibility", Some (profile_visibility_to_yojson x.visibility));
      ("Id", Some (partner_id_to_yojson x.id));
      ("Arn", Some (partner_arn_to_yojson x.arn));
      ("Catalog", Some (catalog_to_yojson x.catalog));
    ]

let get_profile_visibility_request_to_yojson (x : get_profile_visibility_request) =
  assoc_to_yojson
    [
      ("Identifier", Some (partner_identifier_to_yojson x.identifier));
      ("Catalog", Some (catalog_to_yojson x.catalog));
    ]

let get_profile_update_task_response_to_yojson (x : get_profile_update_task_response) =
  assoc_to_yojson
    [
      ("ErrorDetailList", option_to_yojson error_detail_list_to_yojson x.error_detail_list);
      ("EndedAt", option_to_yojson date_time_to_yojson x.ended_at);
      ("Status", Some (profile_task_status_to_yojson x.status));
      ("StartedAt", Some (date_time_to_yojson x.started_at));
      ("TaskDetails", Some (task_details_to_yojson x.task_details));
      ("TaskId", Some (profile_task_id_to_yojson x.task_id));
      ("Id", Some (partner_id_to_yojson x.id));
      ("Arn", Some (partner_arn_to_yojson x.arn));
      ("Catalog", Some (catalog_to_yojson x.catalog));
    ]

let get_profile_update_task_request_to_yojson (x : get_profile_update_task_request) =
  assoc_to_yojson
    [
      ("Identifier", Some (partner_identifier_to_yojson x.identifier));
      ("Catalog", Some (catalog_to_yojson x.catalog));
    ]

let get_partner_response_to_yojson (x : get_partner_response) =
  assoc_to_yojson
    [
      ( "AwsTrainingCertificationEmailDomains",
        option_to_yojson partner_domain_list_to_yojson x.aws_training_certification_email_domains );
      ("Profile", Some (partner_profile_to_yojson x.profile));
      ("CreatedAt", Some (date_time_to_yojson x.created_at));
      ("LegalName", Some (sensitive_unicode_string_to_yojson x.legal_name));
      ("Id", Some (partner_id_to_yojson x.id));
      ("Arn", Some (partner_arn_to_yojson x.arn));
      ("Catalog", Some (catalog_to_yojson x.catalog));
    ]

let get_partner_request_to_yojson (x : get_partner_request) =
  assoc_to_yojson
    [
      ("Identifier", Some (partner_identifier_to_yojson x.identifier));
      ("Catalog", Some (catalog_to_yojson x.catalog));
    ]

let connection_type_detail_to_yojson (x : connection_type_detail) =
  assoc_to_yojson
    [
      ("OtherParticipant", Some (participant_to_yojson x.other_participant));
      ("CanceledBy", option_to_yojson aws_account_id_to_yojson x.canceled_by);
      ("CanceledAt", option_to_yojson date_time_to_yojson x.canceled_at);
      ("Status", Some (connection_type_status_to_yojson x.status));
      ("InviterName", Some (sensitive_unicode_string_to_yojson x.inviter_name));
      ("InviterEmail", Some (email_to_yojson x.inviter_email));
      ("CreatedAt", Some (date_time_to_yojson x.created_at));
    ]

let connection_type_detail_map_to_yojson tree =
  map_to_yojson connection_type_to_yojson connection_type_detail_to_yojson tree

let get_connection_response_to_yojson (x : get_connection_response) =
  assoc_to_yojson
    [
      ("ConnectionTypes", Some (connection_type_detail_map_to_yojson x.connection_types));
      ("UpdatedAt", Some (date_time_to_yojson x.updated_at));
      ("OtherParticipantAccountId", Some (aws_account_id_to_yojson x.other_participant_account_id));
      ("Arn", Some (connection_arn_to_yojson x.arn));
      ("Id", Some (connection_id_to_yojson x.id));
      ("Catalog", Some (catalog_to_yojson x.catalog));
    ]

let get_connection_request_to_yojson (x : get_connection_request) =
  assoc_to_yojson
    [
      ("Identifier", Some (connection_id_to_yojson x.identifier));
      ("Catalog", Some (catalog_to_yojson x.catalog));
    ]

let get_connection_preferences_response_to_yojson (x : get_connection_preferences_response) =
  assoc_to_yojson
    [
      ("Revision", Some (revision_to_yojson x.revision));
      ("UpdatedAt", Some (date_time_to_yojson x.updated_at));
      ( "ExcludedParticipantIds",
        option_to_yojson participant_identifier_list_to_yojson x.excluded_participant_ids );
      ("AccessType", Some (access_type_to_yojson x.access_type));
      ("Arn", Some (connection_preferences_arn_to_yojson x.arn));
      ("Catalog", Some (catalog_to_yojson x.catalog));
    ]

let get_connection_preferences_request_to_yojson (x : get_connection_preferences_request) =
  assoc_to_yojson [ ("Catalog", Some (catalog_to_yojson x.catalog)) ]

let get_connection_invitation_response_to_yojson (x : get_connection_invitation_response) =
  assoc_to_yojson
    [
      ("InviterName", Some (sensitive_unicode_string_to_yojson x.inviter_name));
      ("InviterEmail", Some (email_to_yojson x.inviter_email));
      ("InvitationMessage", Some (unicode_string_including_new_line_to_yojson x.invitation_message));
      ("Status", Some (invitation_status_to_yojson x.status));
      ("ParticipantType", Some (participant_type_to_yojson x.participant_type));
      ( "OtherParticipantIdentifier",
        Some (participant_identifier_to_yojson x.other_participant_identifier) );
      ("ExpiresAt", option_to_yojson date_time_to_yojson x.expires_at);
      ("UpdatedAt", Some (date_time_to_yojson x.updated_at));
      ("CreatedAt", Some (date_time_to_yojson x.created_at));
      ("ConnectionType", Some (connection_type_to_yojson x.connection_type));
      ("ConnectionId", option_to_yojson connection_id_to_yojson x.connection_id);
      ("Arn", Some (connection_invitation_arn_to_yojson x.arn));
      ("Id", Some (connection_invitation_id_to_yojson x.id));
      ("Catalog", Some (catalog_to_yojson x.catalog));
    ]

let get_connection_invitation_request_to_yojson (x : get_connection_invitation_request) =
  assoc_to_yojson
    [
      ("Identifier", Some (connection_invitation_id_to_yojson x.identifier));
      ("Catalog", Some (catalog_to_yojson x.catalog));
    ]

let get_alliance_lead_contact_response_to_yojson (x : get_alliance_lead_contact_response) =
  assoc_to_yojson
    [
      ("AllianceLeadContact", Some (alliance_lead_contact_to_yojson x.alliance_lead_contact));
      ("Id", Some (partner_id_to_yojson x.id));
      ("Arn", Some (partner_arn_to_yojson x.arn));
      ("Catalog", Some (catalog_to_yojson x.catalog));
    ]

let get_alliance_lead_contact_request_to_yojson (x : get_alliance_lead_contact_request) =
  assoc_to_yojson
    [
      ("Identifier", Some (partner_identifier_to_yojson x.identifier));
      ("Catalog", Some (catalog_to_yojson x.catalog));
    ]

let disassociate_aws_training_certification_email_domain_response_to_yojson = unit_to_yojson

let disassociate_aws_training_certification_email_domain_request_to_yojson
    (x : disassociate_aws_training_certification_email_domain_request) =
  assoc_to_yojson
    [
      ("DomainName", Some (domain_name_to_yojson x.domain_name));
      ( "ClientToken",
        Some
          (client_token_to_yojson
             (Option.value x.client_token ~default:(Smaws_Lib.Uuid.generate ()))) );
      ("Identifier", Some (partner_identifier_to_yojson x.identifier));
      ("Catalog", Some (catalog_to_yojson x.catalog));
    ]

let create_partner_response_to_yojson (x : create_partner_response) =
  assoc_to_yojson
    [
      ("AllianceLeadContact", Some (alliance_lead_contact_to_yojson x.alliance_lead_contact));
      ( "AwsTrainingCertificationEmailDomains",
        option_to_yojson partner_domain_list_to_yojson x.aws_training_certification_email_domains );
      ("Profile", Some (partner_profile_to_yojson x.profile));
      ("CreatedAt", Some (date_time_to_yojson x.created_at));
      ("LegalName", Some (sensitive_unicode_string_to_yojson x.legal_name));
      ("Id", Some (partner_id_to_yojson x.id));
      ("Arn", Some (partner_arn_to_yojson x.arn));
      ("Catalog", Some (catalog_to_yojson x.catalog));
    ]

let create_partner_request_to_yojson (x : create_partner_request) =
  assoc_to_yojson
    [
      ("Tags", option_to_yojson tag_list_to_yojson x.tags);
      ("EmailVerificationCode", Some (email_verification_code_to_yojson x.email_verification_code));
      ("AllianceLeadContact", Some (alliance_lead_contact_to_yojson x.alliance_lead_contact));
      ("PrimarySolutionType", Some (primary_solution_type_to_yojson x.primary_solution_type));
      ("LegalName", Some (sensitive_unicode_string_to_yojson x.legal_name));
      ( "ClientToken",
        Some
          (client_token_to_yojson
             (Option.value x.client_token ~default:(Smaws_Lib.Uuid.generate ()))) );
      ("Catalog", Some (catalog_to_yojson x.catalog));
    ]

let create_connection_invitation_response_to_yojson (x : create_connection_invitation_response) =
  assoc_to_yojson
    [
      ("InviterName", Some (sensitive_unicode_string_to_yojson x.inviter_name));
      ("InviterEmail", Some (email_to_yojson x.inviter_email));
      ("InvitationMessage", Some (unicode_string_including_new_line_to_yojson x.invitation_message));
      ("Status", Some (invitation_status_to_yojson x.status));
      ("ParticipantType", Some (participant_type_to_yojson x.participant_type));
      ( "OtherParticipantIdentifier",
        Some (participant_identifier_to_yojson x.other_participant_identifier) );
      ("ExpiresAt", option_to_yojson date_time_to_yojson x.expires_at);
      ("UpdatedAt", Some (date_time_to_yojson x.updated_at));
      ("CreatedAt", Some (date_time_to_yojson x.created_at));
      ("ConnectionType", Some (connection_type_to_yojson x.connection_type));
      ("ConnectionId", option_to_yojson connection_id_to_yojson x.connection_id);
      ("Arn", Some (connection_invitation_arn_to_yojson x.arn));
      ("Id", Some (connection_invitation_id_to_yojson x.id));
      ("Catalog", Some (catalog_to_yojson x.catalog));
    ]

let create_connection_invitation_request_to_yojson (x : create_connection_invitation_request) =
  assoc_to_yojson
    [
      ("ReceiverIdentifier", Some (participant_identifier_to_yojson x.receiver_identifier));
      ("Name", Some (sensitive_unicode_string_to_yojson x.name));
      ("Message", Some (unicode_string_including_new_line_to_yojson x.message));
      ("Email", Some (email_to_yojson x.email));
      ("ConnectionType", Some (connection_type_to_yojson x.connection_type));
      ("ClientToken", Some (client_token_to_yojson x.client_token));
      ("Catalog", Some (catalog_to_yojson x.catalog));
    ]

let connection_to_yojson (x : connection) =
  assoc_to_yojson
    [
      ("ConnectionTypes", Some (connection_type_detail_map_to_yojson x.connection_types));
      ("UpdatedAt", Some (date_time_to_yojson x.updated_at));
      ("OtherParticipantAccountId", Some (aws_account_id_to_yojson x.other_participant_account_id));
      ("Arn", Some (connection_arn_to_yojson x.arn));
      ("Id", Some (connection_id_to_yojson x.id));
      ("Catalog", Some (catalog_to_yojson x.catalog));
    ]

let cancel_profile_update_task_response_to_yojson (x : cancel_profile_update_task_response) =
  assoc_to_yojson
    [
      ("ErrorDetailList", option_to_yojson error_detail_list_to_yojson x.error_detail_list);
      ("EndedAt", option_to_yojson date_time_to_yojson x.ended_at);
      ("Status", Some (profile_task_status_to_yojson x.status));
      ("StartedAt", Some (date_time_to_yojson x.started_at));
      ("TaskDetails", Some (task_details_to_yojson x.task_details));
      ("TaskId", Some (profile_task_id_to_yojson x.task_id));
      ("Id", Some (partner_id_to_yojson x.id));
      ("Arn", Some (partner_arn_to_yojson x.arn));
      ("Catalog", Some (catalog_to_yojson x.catalog));
    ]

let cancel_profile_update_task_request_to_yojson (x : cancel_profile_update_task_request) =
  assoc_to_yojson
    [
      ("TaskId", Some (profile_task_id_to_yojson x.task_id));
      ( "ClientToken",
        Some
          (client_token_to_yojson
             (Option.value x.client_token ~default:(Smaws_Lib.Uuid.generate ()))) );
      ("Identifier", Some (partner_identifier_to_yojson x.identifier));
      ("Catalog", Some (catalog_to_yojson x.catalog));
    ]

let cancel_connection_response_to_yojson (x : cancel_connection_response) =
  assoc_to_yojson
    [
      ("ConnectionTypes", Some (connection_type_detail_map_to_yojson x.connection_types));
      ("UpdatedAt", Some (date_time_to_yojson x.updated_at));
      ("OtherParticipantAccountId", Some (aws_account_id_to_yojson x.other_participant_account_id));
      ("Arn", Some (connection_arn_to_yojson x.arn));
      ("Id", Some (connection_id_to_yojson x.id));
      ("Catalog", Some (catalog_to_yojson x.catalog));
    ]

let cancel_connection_request_to_yojson (x : cancel_connection_request) =
  assoc_to_yojson
    [
      ("ClientToken", Some (client_token_to_yojson x.client_token));
      ("Reason", Some (Smaws_Lib.Smithy_api.Json_serializers.string__to_yojson x.reason));
      ("ConnectionType", Some (connection_type_to_yojson x.connection_type));
      ("Identifier", Some (connection_id_to_yojson x.identifier));
      ("Catalog", Some (catalog_to_yojson x.catalog));
    ]

let cancel_connection_invitation_response_to_yojson (x : cancel_connection_invitation_response) =
  assoc_to_yojson
    [
      ("InviterName", Some (sensitive_unicode_string_to_yojson x.inviter_name));
      ("InviterEmail", Some (email_to_yojson x.inviter_email));
      ("InvitationMessage", Some (unicode_string_including_new_line_to_yojson x.invitation_message));
      ("Status", Some (invitation_status_to_yojson x.status));
      ("ParticipantType", Some (participant_type_to_yojson x.participant_type));
      ( "OtherParticipantIdentifier",
        Some (participant_identifier_to_yojson x.other_participant_identifier) );
      ("ExpiresAt", option_to_yojson date_time_to_yojson x.expires_at);
      ("UpdatedAt", Some (date_time_to_yojson x.updated_at));
      ("CreatedAt", Some (date_time_to_yojson x.created_at));
      ("ConnectionType", Some (connection_type_to_yojson x.connection_type));
      ("ConnectionId", option_to_yojson connection_id_to_yojson x.connection_id);
      ("Arn", Some (connection_invitation_arn_to_yojson x.arn));
      ("Id", Some (connection_invitation_id_to_yojson x.id));
      ("Catalog", Some (catalog_to_yojson x.catalog));
    ]

let cancel_connection_invitation_request_to_yojson (x : cancel_connection_invitation_request) =
  assoc_to_yojson
    [
      ("ClientToken", Some (client_token_to_yojson x.client_token));
      ("Identifier", Some (connection_invitation_id_to_yojson x.identifier));
      ("Catalog", Some (catalog_to_yojson x.catalog));
    ]

let associate_aws_training_certification_email_domain_response_to_yojson = unit_to_yojson

let associate_aws_training_certification_email_domain_request_to_yojson
    (x : associate_aws_training_certification_email_domain_request) =
  assoc_to_yojson
    [
      ("EmailVerificationCode", Some (email_verification_code_to_yojson x.email_verification_code));
      ("Email", Some (email_to_yojson x.email));
      ( "ClientToken",
        Some
          (client_token_to_yojson
             (Option.value x.client_token ~default:(Smaws_Lib.Uuid.generate ()))) );
      ("Identifier", Some (partner_identifier_to_yojson x.identifier));
      ("Catalog", Some (catalog_to_yojson x.catalog));
    ]

let accept_connection_invitation_response_to_yojson (x : accept_connection_invitation_response) =
  assoc_to_yojson [ ("Connection", Some (connection_to_yojson x.connection)) ]

let accept_connection_invitation_request_to_yojson (x : accept_connection_invitation_request) =
  assoc_to_yojson
    [
      ("ClientToken", Some (client_token_to_yojson x.client_token));
      ("Identifier", Some (connection_invitation_id_to_yojson x.identifier));
      ("Catalog", Some (catalog_to_yojson x.catalog));
    ]
