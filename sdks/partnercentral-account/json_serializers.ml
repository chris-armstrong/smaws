open Smaws_Lib.Json.SerializeHelpers
open Types

let business_validation_code_to_yojson (x : business_validation_code) =
  match x with
  | INCOMPATIBLE_CONNECTION_INVITATION_REQUEST ->
      `String "INCOMPATIBLE_CONNECTION_INVITATION_REQUEST"
  | INCOMPATIBLE_LEGAL_NAME -> `String "INCOMPATIBLE_LEGAL_NAME"
  | INCOMPATIBLE_KNOW_YOUR_BUSINESS_STATUS -> `String "INCOMPATIBLE_KNOW_YOUR_BUSINESS_STATUS"
  | INCOMPATIBLE_IDENTITY_VERIFICATION_STATUS -> `String "INCOMPATIBLE_IDENTITY_VERIFICATION_STATUS"
  | INVALID_ACCOUNT_LINKING_STATUS -> `String "INVALID_ACCOUNT_LINKING_STATUS"
  | INVALID_ACCOUNT_STATE -> `String "INVALID_ACCOUNT_STATE"
  | INCOMPATIBLE_DOMAIN -> `String "INCOMPATIBLE_DOMAIN"
  | INELIGIBLE_ACCOUNT_TIER -> `String "INELIGIBLE_ACCOUNT_TIER"

let business_validation_error_to_yojson (x : business_validation_error) =
  assoc_to_yojson
    [
      ("Message", Some (Smaws_Lib.Smithy_api.Json_serializers.string__to_yojson x.message));
      ("Code", Some (business_validation_code_to_yojson x.code));
    ]

let field_validation_code_to_yojson (x : field_validation_code) =
  match x with
  | REQUIRED_FIELD_MISSING -> `String "REQUIRED_FIELD_MISSING"
  | DUPLICATE_VALUE -> `String "DUPLICATE_VALUE"
  | INVALID_VALUE -> `String "INVALID_VALUE"
  | INVALID_STRING_FORMAT -> `String "INVALID_STRING_FORMAT"
  | TOO_MANY_VALUES -> `String "TOO_MANY_VALUES"
  | ACTION_NOT_PERMITTED -> `String "ACTION_NOT_PERMITTED"
  | INVALID_ENUM_VALUE -> `String "INVALID_ENUM_VALUE"

let field_validation_error_to_yojson (x : field_validation_error) =
  assoc_to_yojson
    [
      ("Name", Some (Smaws_Lib.Smithy_api.Json_serializers.string__to_yojson x.name));
      ("Message", Some (Smaws_Lib.Smithy_api.Json_serializers.string__to_yojson x.message));
      ("Code", Some (field_validation_code_to_yojson x.code));
    ]

let validation_error_to_yojson (x : validation_error) =
  match x with
  | FieldValidationError arg ->
      assoc_to_yojson [ ("FieldValidationError", Some (field_validation_error_to_yojson arg)) ]
  | BusinessValidationError arg ->
      assoc_to_yojson
        [ ("BusinessValidationError", Some (business_validation_error_to_yojson arg)) ]

let validation_error_list_to_yojson tree = list_to_yojson validation_error_to_yojson tree

let validation_exception_reason_to_yojson (x : validation_exception_reason) =
  match x with
  | REQUEST_VALIDATION_FAILED -> `String "REQUEST_VALIDATION_FAILED"
  | BUSINESS_VALIDATION_FAILED -> `String "BUSINESS_VALIDATION_FAILED"

let validation_exception_to_yojson (x : validation_exception) =
  assoc_to_yojson
    [
      ("Message", Some (Smaws_Lib.Smithy_api.Json_serializers.string__to_yojson x.message));
      ("Reason", Some (validation_exception_reason_to_yojson x.reason));
      ("ErrorDetails", option_to_yojson validation_error_list_to_yojson x.error_details);
    ]

let throttling_exception_to_yojson (x : throttling_exception) =
  assoc_to_yojson
    [
      ("Message", Some (Smaws_Lib.Smithy_api.Json_serializers.string__to_yojson x.message));
      ( "ServiceCode",
        option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.string__to_yojson x.service_code );
      ( "QuotaCode",
        option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.string__to_yojson x.quota_code );
    ]

let service_quota_exceeded_exception_reason_to_yojson (x : service_quota_exceeded_exception_reason)
    =
  match x with
  | LIMIT_EXCEEDED_NUMBER_OF_EMAIL -> `String "LIMIT_EXCEEDED_NUMBER_OF_EMAIL"
  | LIMIT_EXCEEDED_NUMBER_OF_DOMAIN -> `String "LIMIT_EXCEEDED_NUMBER_OF_DOMAIN"
  | LIMIT_EXCEEDED_NUMBER_OF_CONNECTION_INVITATION_PER_DAY ->
      `String "LIMIT_EXCEEDED_NUMBER_OF_CONNECTION_INVITATION_PER_DAY"
  | LIMIT_EXCEEDED_NUMBER_OF_ACTIVE_CONNECTION ->
      `String "LIMIT_EXCEEDED_NUMBER_OF_ACTIVE_CONNECTION"
  | LIMIT_EXCEEDED_NUMBER_OF_OPEN_CONNECTION_INVITATION ->
      `String "LIMIT_EXCEEDED_NUMBER_OF_OPEN_CONNECTION_INVITATION"
  | LIMIT_EXCEEDED_NUMBER_OF_PROFILE_UPDATE_PER_DAY ->
      `String "LIMIT_EXCEEDED_NUMBER_OF_PROFILE_UPDATE_PER_DAY"
  | LIMIT_EXCEEDED_NUMBER_OF_PROFILE_VISIBILITY_UPDATE_PER_DAY ->
      `String "LIMIT_EXCEEDED_NUMBER_OF_PROFILE_VISIBILITY_UPDATE_PER_DAY"

let service_quota_exceeded_exception_to_yojson (x : service_quota_exceeded_exception) =
  assoc_to_yojson
    [
      ("Message", Some (Smaws_Lib.Smithy_api.Json_serializers.string__to_yojson x.message));
      ("Reason", Some (service_quota_exceeded_exception_reason_to_yojson x.reason));
    ]

let resource_not_found_exception_reason_to_yojson (x : resource_not_found_exception_reason) =
  match x with
  | PARTNER_NOT_FOUND -> `String "PARTNER_NOT_FOUND"
  | PARTNER_PROFILE_NOT_FOUND -> `String "PARTNER_PROFILE_NOT_FOUND"
  | PARTNER_PROFILE_TASK_NOT_FOUND -> `String "PARTNER_PROFILE_TASK_NOT_FOUND"
  | PARTNER_DOMAIN_NOT_FOUND -> `String "PARTNER_DOMAIN_NOT_FOUND"
  | SENDER_PROFILE_NOT_FOUND -> `String "SENDER_PROFILE_NOT_FOUND"
  | RECEIVER_PROFILE_NOT_FOUND -> `String "RECEIVER_PROFILE_NOT_FOUND"
  | CONNECTION_INVITATION_NOT_FOUND -> `String "CONNECTION_INVITATION_NOT_FOUND"
  | CONNECTION_NOT_FOUND -> `String "CONNECTION_NOT_FOUND"
  | VERIFICATION_NOT_FOUND -> `String "VERIFICATION_NOT_FOUND"

let resource_not_found_exception_to_yojson (x : resource_not_found_exception) =
  assoc_to_yojson
    [
      ("Message", Some (Smaws_Lib.Smithy_api.Json_serializers.string__to_yojson x.message));
      ("Reason", Some (resource_not_found_exception_reason_to_yojson x.reason));
    ]

let internal_server_exception_to_yojson (x : internal_server_exception) =
  assoc_to_yojson
    [ ("Message", Some (Smaws_Lib.Smithy_api.Json_serializers.string__to_yojson x.message)) ]

let conflict_exception_reason_to_yojson (x : conflict_exception_reason) =
  match x with
  | CONFLICT_CLIENT_TOKEN -> `String "CONFLICT_CLIENT_TOKEN"
  | DUPLICATE_PARTNER -> `String "DUPLICATE_PARTNER"
  | INCOMPATIBLE_PROFILE_STATE -> `String "INCOMPATIBLE_PROFILE_STATE"
  | INCOMPATIBLE_PARTNER_PROFILE_TASK_STATE -> `String "INCOMPATIBLE_PARTNER_PROFILE_TASK_STATE"
  | DUPLICATE_CONNECTION_INVITATION -> `String "DUPLICATE_CONNECTION_INVITATION"
  | INCOMPATIBLE_CONNECTION_INVITATION_STATE -> `String "INCOMPATIBLE_CONNECTION_INVITATION_STATE"
  | INCOMPATIBLE_CONNECTION_INVITATION_RECEIVER ->
      `String "INCOMPATIBLE_CONNECTION_INVITATION_RECEIVER"
  | DUPLICATE_CONNECTION -> `String "DUPLICATE_CONNECTION"
  | INCOMPATIBLE_CONNECTION_STATE -> `String "INCOMPATIBLE_CONNECTION_STATE"
  | INCOMPATIBLE_CONNECTION_PREFERENCES_REVISION ->
      `String "INCOMPATIBLE_CONNECTION_PREFERENCES_REVISION"
  | ACCOUNT_ALREADY_VERIFIED -> `String "ACCOUNT_ALREADY_VERIFIED"
  | VERIFICATION_ALREADY_IN_PROGRESS -> `String "VERIFICATION_ALREADY_IN_PROGRESS"

let conflict_exception_to_yojson (x : conflict_exception) =
  assoc_to_yojson
    [
      ("Message", Some (Smaws_Lib.Smithy_api.Json_serializers.string__to_yojson x.message));
      ("Reason", Some (conflict_exception_reason_to_yojson x.reason));
    ]

let access_denied_exception_reason_to_yojson (x : access_denied_exception_reason) =
  match x with
  | ACCESS_DENIED -> `String "ACCESS_DENIED"
  | INCOMPATIBLE_BENEFIT_AWS_PARTNER_STATE -> `String "INCOMPATIBLE_BENEFIT_AWS_PARTNER_STATE"

let access_denied_exception_to_yojson (x : access_denied_exception) =
  assoc_to_yojson
    [
      ("Message", Some (Smaws_Lib.Smithy_api.Json_serializers.string__to_yojson x.message));
      ("Reason", Some (access_denied_exception_reason_to_yojson x.reason));
    ]

let unicode_string_to_yojson = string_to_yojson

let account_summary_to_yojson (x : account_summary) =
  assoc_to_yojson [ ("Name", Some (unicode_string_to_yojson x.name)) ]

let seller_profile_id_to_yojson = string_to_yojson

let seller_profile_summary_to_yojson (x : seller_profile_summary) =
  assoc_to_yojson
    [
      ("Id", Some (seller_profile_id_to_yojson x.id));
      ("Name", Some (unicode_string_to_yojson x.name));
    ]

let partner_profile_id_to_yojson = string_to_yojson

let partner_profile_summary_to_yojson (x : partner_profile_summary) =
  assoc_to_yojson
    [
      ("Id", Some (partner_profile_id_to_yojson x.id));
      ("Name", Some (unicode_string_to_yojson x.name));
    ]

let participant_to_yojson (x : participant) =
  match x with
  | PartnerProfile arg ->
      assoc_to_yojson [ ("PartnerProfile", Some (partner_profile_summary_to_yojson arg)) ]
  | SellerProfile arg ->
      assoc_to_yojson [ ("SellerProfile", Some (seller_profile_summary_to_yojson arg)) ]
  | Account arg -> assoc_to_yojson [ ("Account", Some (account_summary_to_yojson arg)) ]

let aws_account_id_to_yojson = string_to_yojson
let date_time_to_yojson = timestamp_iso_8601_to_yojson

let connection_type_status_to_yojson (x : connection_type_status) =
  match x with ACTIVE -> `String "ACTIVE" | CANCELED -> `String "CANCELED"

let sensitive_unicode_string_to_yojson = string_to_yojson
let email_to_yojson = string_to_yojson

let connection_type_detail_to_yojson (x : connection_type_detail) =
  assoc_to_yojson
    [
      ("CreatedAt", Some (date_time_to_yojson x.created_at));
      ("InviterEmail", Some (email_to_yojson x.inviter_email));
      ("InviterName", Some (sensitive_unicode_string_to_yojson x.inviter_name));
      ("Status", Some (connection_type_status_to_yojson x.status));
      ("CanceledAt", option_to_yojson date_time_to_yojson x.canceled_at);
      ("CanceledBy", option_to_yojson aws_account_id_to_yojson x.canceled_by);
      ("OtherParticipant", Some (participant_to_yojson x.other_participant));
    ]

let connection_type_to_yojson (x : connection_type) =
  match x with
  | OPPORTUNITY_COLLABORATION -> `String "OPPORTUNITY_COLLABORATION"
  | SUBSIDIARY -> `String "SUBSIDIARY"

let connection_type_detail_map_to_yojson tree =
  map_to_yojson connection_type_to_yojson connection_type_detail_to_yojson tree

let connection_arn_to_yojson = string_to_yojson
let connection_id_to_yojson = string_to_yojson
let catalog_to_yojson = string_to_yojson

let connection_to_yojson (x : connection) =
  assoc_to_yojson
    [
      ("Catalog", Some (catalog_to_yojson x.catalog));
      ("Id", Some (connection_id_to_yojson x.id));
      ("Arn", Some (connection_arn_to_yojson x.arn));
      ("OtherParticipantAccountId", Some (aws_account_id_to_yojson x.other_participant_account_id));
      ("UpdatedAt", Some (date_time_to_yojson x.updated_at));
      ("ConnectionTypes", Some (connection_type_detail_map_to_yojson x.connection_types));
    ]

let accept_connection_invitation_response_to_yojson (x : accept_connection_invitation_response) =
  assoc_to_yojson [ ("Connection", Some (connection_to_yojson x.connection)) ]

let client_token_to_yojson = string_to_yojson
let connection_invitation_id_to_yojson = string_to_yojson

let accept_connection_invitation_request_to_yojson (x : accept_connection_invitation_request) =
  assoc_to_yojson
    [
      ("Catalog", Some (catalog_to_yojson x.catalog));
      ("Identifier", Some (connection_invitation_id_to_yojson x.identifier));
      ("ClientToken", Some (client_token_to_yojson x.client_token));
    ]

let access_type_to_yojson (x : access_type) =
  match x with
  | ALLOW_ALL -> `String "ALLOW_ALL"
  | DENY_ALL -> `String "DENY_ALL"
  | ALLOW_BY_DEFAULT_DENY_SOME -> `String "ALLOW_BY_DEFAULT_DENY_SOME"

let alliance_lead_contact_to_yojson (x : alliance_lead_contact) =
  assoc_to_yojson
    [
      ("FirstName", Some (sensitive_unicode_string_to_yojson x.first_name));
      ("LastName", Some (sensitive_unicode_string_to_yojson x.last_name));
      ("Email", Some (email_to_yojson x.email));
      ("BusinessTitle", Some (sensitive_unicode_string_to_yojson x.business_title));
    ]

let associate_aws_training_certification_email_domain_response_to_yojson = unit_to_yojson
let email_verification_code_to_yojson = string_to_yojson
let partner_identifier_to_yojson = string_to_yojson

let associate_aws_training_certification_email_domain_request_to_yojson
    (x : associate_aws_training_certification_email_domain_request) =
  assoc_to_yojson
    [
      ("Catalog", Some (catalog_to_yojson x.catalog));
      ("Identifier", Some (partner_identifier_to_yojson x.identifier));
      ( "ClientToken",
        Some
          (client_token_to_yojson
             (Option.value x.client_token ~default:(Smaws_Lib.Uuid.generate ()))) );
      ("Email", Some (email_to_yojson x.email));
      ("EmailVerificationCode", Some (email_verification_code_to_yojson x.email_verification_code));
    ]

let jurisdiction_code_to_yojson = string_to_yojson
let country_code_to_yojson = string_to_yojson
let registration_id_to_yojson = string_to_yojson
let legal_name_to_yojson = string_to_yojson

let business_verification_details_to_yojson (x : business_verification_details) =
  assoc_to_yojson
    [
      ("LegalName", Some (legal_name_to_yojson x.legal_name));
      ("RegistrationId", Some (registration_id_to_yojson x.registration_id));
      ("CountryCode", Some (country_code_to_yojson x.country_code));
      ( "JurisdictionOfIncorporation",
        option_to_yojson jurisdiction_code_to_yojson x.jurisdiction_of_incorporation );
    ]

let completion_url_to_yojson = string_to_yojson

let business_verification_response_to_yojson (x : business_verification_response) =
  assoc_to_yojson
    [
      ( "BusinessVerificationDetails",
        Some (business_verification_details_to_yojson x.business_verification_details) );
      ("CompletionUrl", option_to_yojson completion_url_to_yojson x.completion_url);
      ("CompletionUrlExpiresAt", option_to_yojson date_time_to_yojson x.completion_url_expires_at);
    ]

let cancel_connection_response_to_yojson (x : cancel_connection_response) =
  assoc_to_yojson
    [
      ("Catalog", Some (catalog_to_yojson x.catalog));
      ("Id", Some (connection_id_to_yojson x.id));
      ("Arn", Some (connection_arn_to_yojson x.arn));
      ("OtherParticipantAccountId", Some (aws_account_id_to_yojson x.other_participant_account_id));
      ("UpdatedAt", Some (date_time_to_yojson x.updated_at));
      ("ConnectionTypes", Some (connection_type_detail_map_to_yojson x.connection_types));
    ]

let cancel_connection_request_to_yojson (x : cancel_connection_request) =
  assoc_to_yojson
    [
      ("Catalog", Some (catalog_to_yojson x.catalog));
      ("Identifier", Some (connection_id_to_yojson x.identifier));
      ("ConnectionType", Some (connection_type_to_yojson x.connection_type));
      ("Reason", Some (Smaws_Lib.Smithy_api.Json_serializers.string__to_yojson x.reason));
      ("ClientToken", Some (client_token_to_yojson x.client_token));
    ]

let unicode_string_including_new_line_to_yojson = string_to_yojson

let invitation_status_to_yojson (x : invitation_status) =
  match x with
  | PENDING -> `String "PENDING"
  | ACCEPTED -> `String "ACCEPTED"
  | REJECTED -> `String "REJECTED"
  | CANCELED -> `String "CANCELED"
  | EXPIRED -> `String "EXPIRED"

let participant_type_to_yojson (x : participant_type) =
  match x with SENDER -> `String "SENDER" | RECEIVER -> `String "RECEIVER"

let participant_identifier_to_yojson = string_to_yojson
let connection_invitation_arn_to_yojson = string_to_yojson

let cancel_connection_invitation_response_to_yojson (x : cancel_connection_invitation_response) =
  assoc_to_yojson
    [
      ("Catalog", Some (catalog_to_yojson x.catalog));
      ("Id", Some (connection_invitation_id_to_yojson x.id));
      ("Arn", Some (connection_invitation_arn_to_yojson x.arn));
      ("ConnectionId", option_to_yojson connection_id_to_yojson x.connection_id);
      ("ConnectionType", Some (connection_type_to_yojson x.connection_type));
      ("CreatedAt", Some (date_time_to_yojson x.created_at));
      ("UpdatedAt", Some (date_time_to_yojson x.updated_at));
      ("ExpiresAt", option_to_yojson date_time_to_yojson x.expires_at);
      ( "OtherParticipantIdentifier",
        Some (participant_identifier_to_yojson x.other_participant_identifier) );
      ("ParticipantType", Some (participant_type_to_yojson x.participant_type));
      ("Status", Some (invitation_status_to_yojson x.status));
      ("InvitationMessage", Some (unicode_string_including_new_line_to_yojson x.invitation_message));
      ("InviterEmail", Some (email_to_yojson x.inviter_email));
      ("InviterName", Some (sensitive_unicode_string_to_yojson x.inviter_name));
    ]

let cancel_connection_invitation_request_to_yojson (x : cancel_connection_invitation_request) =
  assoc_to_yojson
    [
      ("Catalog", Some (catalog_to_yojson x.catalog));
      ("Identifier", Some (connection_invitation_id_to_yojson x.identifier));
      ("ClientToken", Some (client_token_to_yojson x.client_token));
    ]

let profile_validation_error_reason_to_yojson (x : profile_validation_error_reason) =
  match x with
  | INVALID_CONTENT -> `String "INVALID_CONTENT"
  | DUPLICATE_PROFILE -> `String "DUPLICATE_PROFILE"
  | INVALID_LOGO -> `String "INVALID_LOGO"
  | INVALID_LOGO_URL -> `String "INVALID_LOGO_URL"
  | INVALID_LOGO_FILE -> `String "INVALID_LOGO_FILE"
  | INVALID_LOGO_SIZE -> `String "INVALID_LOGO_SIZE"
  | INVALID_WEBSITE_URL -> `String "INVALID_WEBSITE_URL"

let error_detail_to_yojson (x : error_detail) =
  assoc_to_yojson
    [
      ("Locale", Some (Smaws_Lib.Smithy_api.Json_serializers.string__to_yojson x.locale));
      ("Message", Some (Smaws_Lib.Smithy_api.Json_serializers.string__to_yojson x.message));
      ("Reason", Some (profile_validation_error_reason_to_yojson x.reason));
    ]

let error_detail_list_to_yojson tree = list_to_yojson error_detail_to_yojson tree

let profile_task_status_to_yojson (x : profile_task_status) =
  match x with
  | IN_PROGRESS -> `String "IN_PROGRESS"
  | CANCELED -> `String "CANCELED"
  | SUCCEEDED -> `String "SUCCEEDED"
  | FAILED -> `String "FAILED"

let locale_to_yojson = string_to_yojson
let url_to_yojson = string_to_yojson

let localized_content_to_yojson (x : localized_content) =
  assoc_to_yojson
    [
      ("DisplayName", Some (unicode_string_to_yojson x.display_name));
      ("Description", Some (unicode_string_to_yojson x.description));
      ("WebsiteUrl", Some (url_to_yojson x.website_url));
      ("LogoUrl", Some (url_to_yojson x.logo_url));
      ("Locale", Some (locale_to_yojson x.locale));
    ]

let localized_content_list_to_yojson tree = list_to_yojson localized_content_to_yojson tree

let industry_segment_to_yojson (x : industry_segment) =
  match x with
  | AGRICULTURE_MINING -> `String "AGRICULTURE_MINING"
  | BIOTECHNOLOGY -> `String "BIOTECHNOLOGY"
  | BUSINESS_CONSUMER_SERVICES -> `String "BUSINESS_CONSUMER_SERVICES"
  | BUSINESS_SERV -> `String "BUSINESS_SERV"
  | COMMUNICATIONS -> `String "COMMUNICATIONS"
  | COMPUTER_HARDWARE -> `String "COMPUTER_HARDWARE"
  | COMPUTERS_ELECTRONICS -> `String "COMPUTERS_ELECTRONICS"
  | COMPUTER_SOFTWARE -> `String "COMPUTER_SOFTWARE"
  | CONSUMER_GOODS -> `String "CONSUMER_GOODS"
  | CONSUMER_RELATED -> `String "CONSUMER_RELATED"
  | EDUCATION -> `String "EDUCATION"
  | ENERGY_UTILITIES -> `String "ENERGY_UTILITIES"
  | FINANCIAL_SERVICES -> `String "FINANCIAL_SERVICES"
  | GAMING -> `String "GAMING"
  | GOVERNMENT -> `String "GOVERNMENT"
  | GOVERNMENT_EDUCATION_PUBLIC_SERVICES -> `String "GOVERNMENT_EDUCATION_PUBLIC_SERVICES"
  | HEALTHCARE -> `String "HEALTHCARE"
  | HEALTHCARE_PHARMACEUTICALS_BIOTECH -> `String "HEALTHCARE_PHARMACEUTICALS_BIOTECH"
  | INDUSTRIAL_ENERGY -> `String "INDUSTRIAL_ENERGY"
  | INTERNET_SPECIFIC -> `String "INTERNET_SPECIFIC"
  | LIFE_SCIENCES -> `String "LIFE_SCIENCES"
  | MANUFACTURING -> `String "MANUFACTURING"
  | MEDIA_ENTERTAINMENT_LEISURE -> `String "MEDIA_ENTERTAINMENT_LEISURE"
  | MEDIA_ENTERTAINMENT -> `String "MEDIA_ENTERTAINMENT"
  | MEDICAL_HEALTH -> `String "MEDICAL_HEALTH"
  | NON_PROFIT_ORGANIZATION -> `String "NON_PROFIT_ORGANIZATION"
  | OTHER -> `String "OTHER"
  | PROFESSIONAL_SERVICES -> `String "PROFESSIONAL_SERVICES"
  | REAL_ESTATE_CONSTRUCTION -> `String "REAL_ESTATE_CONSTRUCTION"
  | RETAIL -> `String "RETAIL"
  | RETAIL_WHOLESALE_DISTRIBUTION -> `String "RETAIL_WHOLESALE_DISTRIBUTION"
  | SEMICONDUCTOR_ELECTR -> `String "SEMICONDUCTOR_ELECTR"
  | SOFTWARE_INTERNET -> `String "SOFTWARE_INTERNET"
  | TELECOMMUNICATIONS -> `String "TELECOMMUNICATIONS"
  | TRANSPORTATION_LOGISTICS -> `String "TRANSPORTATION_LOGISTICS"
  | TRAVEL_HOSPITALITY -> `String "TRAVEL_HOSPITALITY"
  | WHOLESALE_DISTRIBUTION -> `String "WHOLESALE_DISTRIBUTION"

let industry_segment_list_to_yojson tree = list_to_yojson industry_segment_to_yojson tree

let primary_solution_type_to_yojson (x : primary_solution_type) =
  match x with
  | SOFTWARE_PRODUCTS -> `String "SOFTWARE_PRODUCTS"
  | CONSULTING_SERVICES -> `String "CONSULTING_SERVICES"
  | PROFESSIONAL_SERVICES -> `String "PROFESSIONAL_SERVICES"
  | MANAGED_SERVICES -> `String "MANAGED_SERVICES"
  | HARDWARE_PRODUCTS -> `String "HARDWARE_PRODUCTS"
  | COMMUNICATION_SERVICES -> `String "COMMUNICATION_SERVICES"
  | VALUE_ADDED_RESALE_AWS_SERVICES -> `String "VALUE_ADDED_RESALE_AWS_SERVICES"
  | TRAINING_SERVICES -> `String "TRAINING_SERVICES"

let task_details_to_yojson (x : task_details) =
  assoc_to_yojson
    [
      ("DisplayName", Some (unicode_string_to_yojson x.display_name));
      ("Description", Some (unicode_string_to_yojson x.description));
      ("WebsiteUrl", Some (url_to_yojson x.website_url));
      ("LogoUrl", Some (url_to_yojson x.logo_url));
      ("PrimarySolutionType", Some (primary_solution_type_to_yojson x.primary_solution_type));
      ("IndustrySegments", Some (industry_segment_list_to_yojson x.industry_segments));
      ("TranslationSourceLocale", Some (locale_to_yojson x.translation_source_locale));
      ("LocalizedContents", option_to_yojson localized_content_list_to_yojson x.localized_contents);
    ]

let profile_task_id_to_yojson = string_to_yojson
let partner_id_to_yojson = string_to_yojson
let partner_arn_to_yojson = string_to_yojson

let cancel_profile_update_task_response_to_yojson (x : cancel_profile_update_task_response) =
  assoc_to_yojson
    [
      ("Catalog", Some (catalog_to_yojson x.catalog));
      ("Arn", Some (partner_arn_to_yojson x.arn));
      ("Id", Some (partner_id_to_yojson x.id));
      ("TaskId", Some (profile_task_id_to_yojson x.task_id));
      ("TaskDetails", Some (task_details_to_yojson x.task_details));
      ("StartedAt", Some (date_time_to_yojson x.started_at));
      ("Status", Some (profile_task_status_to_yojson x.status));
      ("EndedAt", option_to_yojson date_time_to_yojson x.ended_at);
      ("ErrorDetailList", option_to_yojson error_detail_list_to_yojson x.error_detail_list);
    ]

let cancel_profile_update_task_request_to_yojson (x : cancel_profile_update_task_request) =
  assoc_to_yojson
    [
      ("Catalog", Some (catalog_to_yojson x.catalog));
      ("Identifier", Some (partner_identifier_to_yojson x.identifier));
      ( "ClientToken",
        Some
          (client_token_to_yojson
             (Option.value x.client_token ~default:(Smaws_Lib.Uuid.generate ()))) );
      ("TaskId", Some (profile_task_id_to_yojson x.task_id));
    ]

let connection_invitation_summary_to_yojson (x : connection_invitation_summary) =
  assoc_to_yojson
    [
      ("Catalog", Some (catalog_to_yojson x.catalog));
      ("Id", Some (connection_invitation_id_to_yojson x.id));
      ("Arn", Some (connection_invitation_arn_to_yojson x.arn));
      ("ConnectionId", option_to_yojson connection_id_to_yojson x.connection_id);
      ("ConnectionType", Some (connection_type_to_yojson x.connection_type));
      ("CreatedAt", Some (date_time_to_yojson x.created_at));
      ("UpdatedAt", Some (date_time_to_yojson x.updated_at));
      ("ExpiresAt", option_to_yojson date_time_to_yojson x.expires_at);
      ( "OtherParticipantIdentifier",
        Some (participant_identifier_to_yojson x.other_participant_identifier) );
      ("ParticipantType", Some (participant_type_to_yojson x.participant_type));
      ("Status", Some (invitation_status_to_yojson x.status));
    ]

let connection_invitation_summary_list_to_yojson tree =
  list_to_yojson connection_invitation_summary_to_yojson tree

let connection_preferences_arn_to_yojson = string_to_yojson

let connection_type_summary_to_yojson (x : connection_type_summary) =
  assoc_to_yojson
    [
      ("Status", Some (connection_type_status_to_yojson x.status));
      ("OtherParticipant", Some (participant_to_yojson x.other_participant));
    ]

let connection_type_summary_map_to_yojson tree =
  map_to_yojson connection_type_to_yojson connection_type_summary_to_yojson tree

let connection_summary_to_yojson (x : connection_summary) =
  assoc_to_yojson
    [
      ("Catalog", Some (catalog_to_yojson x.catalog));
      ("Id", Some (connection_id_to_yojson x.id));
      ("Arn", Some (connection_arn_to_yojson x.arn));
      ("OtherParticipantAccountId", Some (aws_account_id_to_yojson x.other_participant_account_id));
      ("UpdatedAt", Some (date_time_to_yojson x.updated_at));
      ("ConnectionTypes", Some (connection_type_summary_map_to_yojson x.connection_types));
    ]

let connection_summary_list_to_yojson tree = list_to_yojson connection_summary_to_yojson tree
let connection_type_filter_to_yojson = string_to_yojson

let create_connection_invitation_response_to_yojson (x : create_connection_invitation_response) =
  assoc_to_yojson
    [
      ("Catalog", Some (catalog_to_yojson x.catalog));
      ("Id", Some (connection_invitation_id_to_yojson x.id));
      ("Arn", Some (connection_invitation_arn_to_yojson x.arn));
      ("ConnectionId", option_to_yojson connection_id_to_yojson x.connection_id);
      ("ConnectionType", Some (connection_type_to_yojson x.connection_type));
      ("CreatedAt", Some (date_time_to_yojson x.created_at));
      ("UpdatedAt", Some (date_time_to_yojson x.updated_at));
      ("ExpiresAt", option_to_yojson date_time_to_yojson x.expires_at);
      ( "OtherParticipantIdentifier",
        Some (participant_identifier_to_yojson x.other_participant_identifier) );
      ("ParticipantType", Some (participant_type_to_yojson x.participant_type));
      ("Status", Some (invitation_status_to_yojson x.status));
      ("InvitationMessage", Some (unicode_string_including_new_line_to_yojson x.invitation_message));
      ("InviterEmail", Some (email_to_yojson x.inviter_email));
      ("InviterName", Some (sensitive_unicode_string_to_yojson x.inviter_name));
    ]

let create_connection_invitation_request_to_yojson (x : create_connection_invitation_request) =
  assoc_to_yojson
    [
      ("Catalog", Some (catalog_to_yojson x.catalog));
      ("ClientToken", Some (client_token_to_yojson x.client_token));
      ("ConnectionType", Some (connection_type_to_yojson x.connection_type));
      ("Email", Some (email_to_yojson x.email));
      ("Message", Some (unicode_string_including_new_line_to_yojson x.message));
      ("Name", Some (sensitive_unicode_string_to_yojson x.name));
      ("ReceiverIdentifier", Some (participant_identifier_to_yojson x.receiver_identifier));
    ]

let domain_name_to_yojson = string_to_yojson

let partner_domain_to_yojson (x : partner_domain) =
  assoc_to_yojson
    [
      ("DomainName", Some (domain_name_to_yojson x.domain_name));
      ("RegisteredAt", Some (date_time_to_yojson x.registered_at));
    ]

let partner_domain_list_to_yojson tree = list_to_yojson partner_domain_to_yojson tree

let partner_profile_to_yojson (x : partner_profile) =
  assoc_to_yojson
    [
      ("DisplayName", Some (unicode_string_to_yojson x.display_name));
      ("Description", Some (unicode_string_to_yojson x.description));
      ("WebsiteUrl", Some (url_to_yojson x.website_url));
      ("LogoUrl", Some (url_to_yojson x.logo_url));
      ("PrimarySolutionType", Some (primary_solution_type_to_yojson x.primary_solution_type));
      ("IndustrySegments", Some (industry_segment_list_to_yojson x.industry_segments));
      ("TranslationSourceLocale", Some (locale_to_yojson x.translation_source_locale));
      ("LocalizedContents", option_to_yojson localized_content_list_to_yojson x.localized_contents);
      ("ProfileId", option_to_yojson partner_profile_id_to_yojson x.profile_id);
    ]

let create_partner_response_to_yojson (x : create_partner_response) =
  assoc_to_yojson
    [
      ("Catalog", Some (catalog_to_yojson x.catalog));
      ("Arn", Some (partner_arn_to_yojson x.arn));
      ("Id", Some (partner_id_to_yojson x.id));
      ("LegalName", Some (sensitive_unicode_string_to_yojson x.legal_name));
      ("CreatedAt", Some (date_time_to_yojson x.created_at));
      ("Profile", Some (partner_profile_to_yojson x.profile));
      ( "AwsTrainingCertificationEmailDomains",
        option_to_yojson partner_domain_list_to_yojson x.aws_training_certification_email_domains );
      ("AllianceLeadContact", Some (alliance_lead_contact_to_yojson x.alliance_lead_contact));
    ]

let tag_value_to_yojson = string_to_yojson
let tag_key_to_yojson = string_to_yojson

let tag_to_yojson (x : tag) =
  assoc_to_yojson
    [ ("Key", Some (tag_key_to_yojson x.key)); ("Value", Some (tag_value_to_yojson x.value)) ]

let tag_list_to_yojson tree = list_to_yojson tag_to_yojson tree

let create_partner_request_to_yojson (x : create_partner_request) =
  assoc_to_yojson
    [
      ("Catalog", Some (catalog_to_yojson x.catalog));
      ( "ClientToken",
        Some
          (client_token_to_yojson
             (Option.value x.client_token ~default:(Smaws_Lib.Uuid.generate ()))) );
      ("LegalName", Some (sensitive_unicode_string_to_yojson x.legal_name));
      ("PrimarySolutionType", Some (primary_solution_type_to_yojson x.primary_solution_type));
      ("AllianceLeadContact", Some (alliance_lead_contact_to_yojson x.alliance_lead_contact));
      ("EmailVerificationCode", Some (email_verification_code_to_yojson x.email_verification_code));
      ("Tags", option_to_yojson tag_list_to_yojson x.tags);
    ]

let disassociate_aws_training_certification_email_domain_response_to_yojson = unit_to_yojson

let disassociate_aws_training_certification_email_domain_request_to_yojson
    (x : disassociate_aws_training_certification_email_domain_request) =
  assoc_to_yojson
    [
      ("Catalog", Some (catalog_to_yojson x.catalog));
      ("Identifier", Some (partner_identifier_to_yojson x.identifier));
      ( "ClientToken",
        Some
          (client_token_to_yojson
             (Option.value x.client_token ~default:(Smaws_Lib.Uuid.generate ()))) );
      ("DomainName", Some (domain_name_to_yojson x.domain_name));
    ]

let get_alliance_lead_contact_response_to_yojson (x : get_alliance_lead_contact_response) =
  assoc_to_yojson
    [
      ("Catalog", Some (catalog_to_yojson x.catalog));
      ("Arn", Some (partner_arn_to_yojson x.arn));
      ("Id", Some (partner_id_to_yojson x.id));
      ("AllianceLeadContact", Some (alliance_lead_contact_to_yojson x.alliance_lead_contact));
    ]

let get_alliance_lead_contact_request_to_yojson (x : get_alliance_lead_contact_request) =
  assoc_to_yojson
    [
      ("Catalog", Some (catalog_to_yojson x.catalog));
      ("Identifier", Some (partner_identifier_to_yojson x.identifier));
    ]

let get_connection_response_to_yojson (x : get_connection_response) =
  assoc_to_yojson
    [
      ("Catalog", Some (catalog_to_yojson x.catalog));
      ("Id", Some (connection_id_to_yojson x.id));
      ("Arn", Some (connection_arn_to_yojson x.arn));
      ("OtherParticipantAccountId", Some (aws_account_id_to_yojson x.other_participant_account_id));
      ("UpdatedAt", Some (date_time_to_yojson x.updated_at));
      ("ConnectionTypes", Some (connection_type_detail_map_to_yojson x.connection_types));
    ]

let get_connection_request_to_yojson (x : get_connection_request) =
  assoc_to_yojson
    [
      ("Catalog", Some (catalog_to_yojson x.catalog));
      ("Identifier", Some (connection_id_to_yojson x.identifier));
    ]

let get_connection_invitation_response_to_yojson (x : get_connection_invitation_response) =
  assoc_to_yojson
    [
      ("Catalog", Some (catalog_to_yojson x.catalog));
      ("Id", Some (connection_invitation_id_to_yojson x.id));
      ("Arn", Some (connection_invitation_arn_to_yojson x.arn));
      ("ConnectionId", option_to_yojson connection_id_to_yojson x.connection_id);
      ("ConnectionType", Some (connection_type_to_yojson x.connection_type));
      ("CreatedAt", Some (date_time_to_yojson x.created_at));
      ("UpdatedAt", Some (date_time_to_yojson x.updated_at));
      ("ExpiresAt", option_to_yojson date_time_to_yojson x.expires_at);
      ( "OtherParticipantIdentifier",
        Some (participant_identifier_to_yojson x.other_participant_identifier) );
      ("ParticipantType", Some (participant_type_to_yojson x.participant_type));
      ("Status", Some (invitation_status_to_yojson x.status));
      ("InvitationMessage", Some (unicode_string_including_new_line_to_yojson x.invitation_message));
      ("InviterEmail", Some (email_to_yojson x.inviter_email));
      ("InviterName", Some (sensitive_unicode_string_to_yojson x.inviter_name));
    ]

let get_connection_invitation_request_to_yojson (x : get_connection_invitation_request) =
  assoc_to_yojson
    [
      ("Catalog", Some (catalog_to_yojson x.catalog));
      ("Identifier", Some (connection_invitation_id_to_yojson x.identifier));
    ]

let revision_to_yojson = long_to_yojson

let participant_identifier_list_to_yojson tree =
  list_to_yojson participant_identifier_to_yojson tree

let get_connection_preferences_response_to_yojson (x : get_connection_preferences_response) =
  assoc_to_yojson
    [
      ("Catalog", Some (catalog_to_yojson x.catalog));
      ("Arn", Some (connection_preferences_arn_to_yojson x.arn));
      ("AccessType", Some (access_type_to_yojson x.access_type));
      ( "ExcludedParticipantIds",
        option_to_yojson participant_identifier_list_to_yojson x.excluded_participant_ids );
      ("UpdatedAt", Some (date_time_to_yojson x.updated_at));
      ("Revision", Some (revision_to_yojson x.revision));
    ]

let get_connection_preferences_request_to_yojson (x : get_connection_preferences_request) =
  assoc_to_yojson [ ("Catalog", Some (catalog_to_yojson x.catalog)) ]

let get_partner_response_to_yojson (x : get_partner_response) =
  assoc_to_yojson
    [
      ("Catalog", Some (catalog_to_yojson x.catalog));
      ("Arn", Some (partner_arn_to_yojson x.arn));
      ("Id", Some (partner_id_to_yojson x.id));
      ("LegalName", Some (sensitive_unicode_string_to_yojson x.legal_name));
      ("CreatedAt", Some (date_time_to_yojson x.created_at));
      ("Profile", Some (partner_profile_to_yojson x.profile));
      ( "AwsTrainingCertificationEmailDomains",
        option_to_yojson partner_domain_list_to_yojson x.aws_training_certification_email_domains );
    ]

let get_partner_request_to_yojson (x : get_partner_request) =
  assoc_to_yojson
    [
      ("Catalog", Some (catalog_to_yojson x.catalog));
      ("Identifier", Some (partner_identifier_to_yojson x.identifier));
    ]

let get_profile_update_task_response_to_yojson (x : get_profile_update_task_response) =
  assoc_to_yojson
    [
      ("Catalog", Some (catalog_to_yojson x.catalog));
      ("Arn", Some (partner_arn_to_yojson x.arn));
      ("Id", Some (partner_id_to_yojson x.id));
      ("TaskId", Some (profile_task_id_to_yojson x.task_id));
      ("TaskDetails", Some (task_details_to_yojson x.task_details));
      ("StartedAt", Some (date_time_to_yojson x.started_at));
      ("Status", Some (profile_task_status_to_yojson x.status));
      ("EndedAt", option_to_yojson date_time_to_yojson x.ended_at);
      ("ErrorDetailList", option_to_yojson error_detail_list_to_yojson x.error_detail_list);
    ]

let get_profile_update_task_request_to_yojson (x : get_profile_update_task_request) =
  assoc_to_yojson
    [
      ("Catalog", Some (catalog_to_yojson x.catalog));
      ("Identifier", Some (partner_identifier_to_yojson x.identifier));
    ]

let profile_visibility_to_yojson (x : profile_visibility) =
  match x with PRIVATE -> `String "PRIVATE" | PUBLIC -> `String "PUBLIC"

let get_profile_visibility_response_to_yojson (x : get_profile_visibility_response) =
  assoc_to_yojson
    [
      ("Catalog", Some (catalog_to_yojson x.catalog));
      ("Arn", Some (partner_arn_to_yojson x.arn));
      ("Id", Some (partner_id_to_yojson x.id));
      ("Visibility", Some (profile_visibility_to_yojson x.visibility));
      ("ProfileId", Some (partner_profile_id_to_yojson x.profile_id));
    ]

let get_profile_visibility_request_to_yojson (x : get_profile_visibility_request) =
  assoc_to_yojson
    [
      ("Catalog", Some (catalog_to_yojson x.catalog));
      ("Identifier", Some (partner_identifier_to_yojson x.identifier));
    ]

let registrant_verification_response_to_yojson (x : registrant_verification_response) =
  assoc_to_yojson
    [
      ("CompletionUrl", Some (completion_url_to_yojson x.completion_url));
      ("CompletionUrlExpiresAt", Some (date_time_to_yojson x.completion_url_expires_at));
    ]

let verification_response_details_to_yojson (x : verification_response_details) =
  match x with
  | BusinessVerificationResponse arg ->
      assoc_to_yojson
        [ ("BusinessVerificationResponse", Some (business_verification_response_to_yojson arg)) ]
  | RegistrantVerificationResponse arg ->
      assoc_to_yojson
        [
          ("RegistrantVerificationResponse", Some (registrant_verification_response_to_yojson arg));
        ]

let verification_status_reason_to_yojson = string_to_yojson

let verification_status_to_yojson (x : verification_status) =
  match x with
  | PENDING_CUSTOMER_ACTION -> `String "PENDING_CUSTOMER_ACTION"
  | IN_PROGRESS -> `String "IN_PROGRESS"
  | FAILED -> `String "FAILED"
  | SUCCEEDED -> `String "SUCCEEDED"
  | REJECTED -> `String "REJECTED"

let verification_type_to_yojson (x : verification_type) =
  match x with
  | BUSINESS_VERIFICATION -> `String "BUSINESS_VERIFICATION"
  | REGISTRANT_VERIFICATION -> `String "REGISTRANT_VERIFICATION"

let get_verification_response_to_yojson (x : get_verification_response) =
  assoc_to_yojson
    [
      ("VerificationType", Some (verification_type_to_yojson x.verification_type));
      ("VerificationStatus", Some (verification_status_to_yojson x.verification_status));
      ( "VerificationStatusReason",
        option_to_yojson verification_status_reason_to_yojson x.verification_status_reason );
      ( "VerificationResponseDetails",
        Some (verification_response_details_to_yojson x.verification_response_details) );
      ("StartedAt", Some (date_time_to_yojson x.started_at));
      ("CompletedAt", option_to_yojson date_time_to_yojson x.completed_at);
    ]

let get_verification_request_to_yojson (x : get_verification_request) =
  assoc_to_yojson [ ("VerificationType", Some (verification_type_to_yojson x.verification_type)) ]

let next_token_to_yojson = string_to_yojson

let list_connection_invitations_response_to_yojson (x : list_connection_invitations_response) =
  assoc_to_yojson
    [
      ( "ConnectionInvitationSummaries",
        Some (connection_invitation_summary_list_to_yojson x.connection_invitation_summaries) );
      ("NextToken", option_to_yojson next_token_to_yojson x.next_token);
    ]

let max_results_to_yojson = int_to_yojson

let list_connection_invitations_request_to_yojson (x : list_connection_invitations_request) =
  assoc_to_yojson
    [
      ("Catalog", Some (catalog_to_yojson x.catalog));
      ("NextToken", option_to_yojson next_token_to_yojson x.next_token);
      ("ConnectionType", option_to_yojson connection_type_to_yojson x.connection_type);
      ("MaxResults", option_to_yojson max_results_to_yojson x.max_results);
      ( "OtherParticipantIdentifiers",
        option_to_yojson participant_identifier_list_to_yojson x.other_participant_identifiers );
      ("ParticipantType", option_to_yojson participant_type_to_yojson x.participant_type);
      ("Status", option_to_yojson invitation_status_to_yojson x.status);
    ]

let list_connections_response_to_yojson (x : list_connections_response) =
  assoc_to_yojson
    [
      ("ConnectionSummaries", Some (connection_summary_list_to_yojson x.connection_summaries));
      ("NextToken", option_to_yojson next_token_to_yojson x.next_token);
    ]

let list_connections_request_to_yojson (x : list_connections_request) =
  assoc_to_yojson
    [
      ("Catalog", Some (catalog_to_yojson x.catalog));
      ("NextToken", option_to_yojson next_token_to_yojson x.next_token);
      ("ConnectionType", option_to_yojson connection_type_filter_to_yojson x.connection_type);
      ("MaxResults", option_to_yojson max_results_to_yojson x.max_results);
      ( "OtherParticipantIdentifiers",
        option_to_yojson participant_identifier_list_to_yojson x.other_participant_identifiers );
    ]

let partner_summary_to_yojson (x : partner_summary) =
  assoc_to_yojson
    [
      ("Catalog", Some (catalog_to_yojson x.catalog));
      ("Arn", Some (partner_arn_to_yojson x.arn));
      ("Id", Some (partner_id_to_yojson x.id));
      ("LegalName", Some (sensitive_unicode_string_to_yojson x.legal_name));
      ("CreatedAt", Some (date_time_to_yojson x.created_at));
    ]

let partner_summary_list_to_yojson tree = list_to_yojson partner_summary_to_yojson tree

let list_partners_response_to_yojson (x : list_partners_response) =
  assoc_to_yojson
    [
      ("PartnerSummaryList", Some (partner_summary_list_to_yojson x.partner_summary_list));
      ("NextToken", option_to_yojson next_token_to_yojson x.next_token);
    ]

let list_partners_request_to_yojson (x : list_partners_request) =
  assoc_to_yojson
    [
      ("Catalog", Some (catalog_to_yojson x.catalog));
      ("NextToken", option_to_yojson next_token_to_yojson x.next_token);
    ]

let taggable_resource_arn_to_yojson = string_to_yojson

let list_tags_for_resource_response_to_yojson (x : list_tags_for_resource_response) =
  assoc_to_yojson
    [
      ("ResourceArn", Some (taggable_resource_arn_to_yojson x.resource_arn));
      ("Tags", option_to_yojson tag_list_to_yojson x.tags);
    ]

let list_tags_for_resource_request_to_yojson (x : list_tags_for_resource_request) =
  assoc_to_yojson [ ("ResourceArn", Some (taggable_resource_arn_to_yojson x.resource_arn)) ]

let untag_resource_response_to_yojson = unit_to_yojson
let tag_key_list_to_yojson tree = list_to_yojson tag_key_to_yojson tree

let untag_resource_request_to_yojson (x : untag_resource_request) =
  assoc_to_yojson
    [
      ("ResourceArn", Some (taggable_resource_arn_to_yojson x.resource_arn));
      ("TagKeys", Some (tag_key_list_to_yojson x.tag_keys));
    ]

let tag_resource_response_to_yojson = unit_to_yojson

let tag_resource_request_to_yojson (x : tag_resource_request) =
  assoc_to_yojson
    [
      ("ResourceArn", Some (taggable_resource_arn_to_yojson x.resource_arn));
      ("Tags", Some (tag_list_to_yojson x.tags));
    ]

let start_verification_response_to_yojson (x : start_verification_response) =
  assoc_to_yojson
    [
      ("VerificationType", Some (verification_type_to_yojson x.verification_type));
      ("VerificationStatus", Some (verification_status_to_yojson x.verification_status));
      ( "VerificationStatusReason",
        option_to_yojson verification_status_reason_to_yojson x.verification_status_reason );
      ( "VerificationResponseDetails",
        Some (verification_response_details_to_yojson x.verification_response_details) );
      ("StartedAt", Some (date_time_to_yojson x.started_at));
      ("CompletedAt", option_to_yojson date_time_to_yojson x.completed_at);
    ]

let registrant_verification_details_to_yojson = unit_to_yojson

let verification_details_to_yojson (x : verification_details) =
  match x with
  | BusinessVerificationDetails arg ->
      assoc_to_yojson
        [ ("BusinessVerificationDetails", Some (business_verification_details_to_yojson arg)) ]
  | RegistrantVerificationDetails arg ->
      assoc_to_yojson
        [ ("RegistrantVerificationDetails", Some (registrant_verification_details_to_yojson arg)) ]

let start_verification_request_to_yojson (x : start_verification_request) =
  assoc_to_yojson
    [
      ( "ClientToken",
        Some
          (client_token_to_yojson
             (Option.value x.client_token ~default:(Smaws_Lib.Uuid.generate ()))) );
      ("VerificationDetails", option_to_yojson verification_details_to_yojson x.verification_details);
    ]

let send_email_verification_code_response_to_yojson = unit_to_yojson

let send_email_verification_code_request_to_yojson (x : send_email_verification_code_request) =
  assoc_to_yojson
    [ ("Catalog", Some (catalog_to_yojson x.catalog)); ("Email", Some (email_to_yojson x.email)) ]

let put_alliance_lead_contact_response_to_yojson (x : put_alliance_lead_contact_response) =
  assoc_to_yojson
    [
      ("Catalog", Some (catalog_to_yojson x.catalog));
      ("Arn", Some (partner_arn_to_yojson x.arn));
      ("Id", Some (partner_id_to_yojson x.id));
      ("AllianceLeadContact", Some (alliance_lead_contact_to_yojson x.alliance_lead_contact));
    ]

let put_alliance_lead_contact_request_to_yojson (x : put_alliance_lead_contact_request) =
  assoc_to_yojson
    [
      ("Catalog", Some (catalog_to_yojson x.catalog));
      ("Identifier", Some (partner_identifier_to_yojson x.identifier));
      ("AllianceLeadContact", Some (alliance_lead_contact_to_yojson x.alliance_lead_contact));
      ( "EmailVerificationCode",
        option_to_yojson email_verification_code_to_yojson x.email_verification_code );
    ]

let put_profile_visibility_response_to_yojson (x : put_profile_visibility_response) =
  assoc_to_yojson
    [
      ("Catalog", Some (catalog_to_yojson x.catalog));
      ("Arn", Some (partner_arn_to_yojson x.arn));
      ("Id", Some (partner_id_to_yojson x.id));
      ("Visibility", Some (profile_visibility_to_yojson x.visibility));
      ("ProfileId", Some (partner_profile_id_to_yojson x.profile_id));
    ]

let put_profile_visibility_request_to_yojson (x : put_profile_visibility_request) =
  assoc_to_yojson
    [
      ("Catalog", Some (catalog_to_yojson x.catalog));
      ("Identifier", Some (partner_identifier_to_yojson x.identifier));
      ("Visibility", Some (profile_visibility_to_yojson x.visibility));
    ]

let reject_connection_invitation_response_to_yojson (x : reject_connection_invitation_response) =
  assoc_to_yojson
    [
      ("Catalog", Some (catalog_to_yojson x.catalog));
      ("Id", Some (connection_invitation_id_to_yojson x.id));
      ("Arn", Some (connection_invitation_arn_to_yojson x.arn));
      ("ConnectionId", option_to_yojson connection_id_to_yojson x.connection_id);
      ("ConnectionType", Some (connection_type_to_yojson x.connection_type));
      ("CreatedAt", Some (date_time_to_yojson x.created_at));
      ("UpdatedAt", Some (date_time_to_yojson x.updated_at));
      ("ExpiresAt", option_to_yojson date_time_to_yojson x.expires_at);
      ( "OtherParticipantIdentifier",
        Some (participant_identifier_to_yojson x.other_participant_identifier) );
      ("ParticipantType", Some (participant_type_to_yojson x.participant_type));
      ("Status", Some (invitation_status_to_yojson x.status));
      ("InvitationMessage", Some (unicode_string_including_new_line_to_yojson x.invitation_message));
      ("InviterEmail", Some (email_to_yojson x.inviter_email));
      ("InviterName", Some (sensitive_unicode_string_to_yojson x.inviter_name));
    ]

let reject_connection_invitation_request_to_yojson (x : reject_connection_invitation_request) =
  assoc_to_yojson
    [
      ("Catalog", Some (catalog_to_yojson x.catalog));
      ("Identifier", Some (connection_invitation_id_to_yojson x.identifier));
      ("ClientToken", Some (client_token_to_yojson x.client_token));
      ("Reason", option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.string__to_yojson x.reason);
    ]

let start_profile_update_task_response_to_yojson (x : start_profile_update_task_response) =
  assoc_to_yojson
    [
      ("Catalog", Some (catalog_to_yojson x.catalog));
      ("Arn", Some (partner_arn_to_yojson x.arn));
      ("Id", Some (partner_id_to_yojson x.id));
      ("TaskId", Some (profile_task_id_to_yojson x.task_id));
      ("TaskDetails", Some (task_details_to_yojson x.task_details));
      ("StartedAt", Some (date_time_to_yojson x.started_at));
      ("Status", Some (profile_task_status_to_yojson x.status));
      ("EndedAt", option_to_yojson date_time_to_yojson x.ended_at);
      ("ErrorDetailList", option_to_yojson error_detail_list_to_yojson x.error_detail_list);
    ]

let start_profile_update_task_request_to_yojson (x : start_profile_update_task_request) =
  assoc_to_yojson
    [
      ("Catalog", Some (catalog_to_yojson x.catalog));
      ("Identifier", Some (partner_identifier_to_yojson x.identifier));
      ( "ClientToken",
        Some
          (client_token_to_yojson
             (Option.value x.client_token ~default:(Smaws_Lib.Uuid.generate ()))) );
      ("TaskDetails", Some (task_details_to_yojson x.task_details));
    ]

let update_connection_preferences_response_to_yojson (x : update_connection_preferences_response) =
  assoc_to_yojson
    [
      ("Catalog", Some (catalog_to_yojson x.catalog));
      ("Arn", Some (connection_preferences_arn_to_yojson x.arn));
      ("AccessType", Some (access_type_to_yojson x.access_type));
      ( "ExcludedParticipantIds",
        option_to_yojson participant_identifier_list_to_yojson x.excluded_participant_ids );
      ("UpdatedAt", Some (date_time_to_yojson x.updated_at));
      ("Revision", Some (revision_to_yojson x.revision));
    ]

let update_connection_preferences_request_to_yojson (x : update_connection_preferences_request) =
  assoc_to_yojson
    [
      ("Catalog", Some (catalog_to_yojson x.catalog));
      ("Revision", Some (revision_to_yojson x.revision));
      ("AccessType", Some (access_type_to_yojson x.access_type));
      ( "ExcludedParticipantIdentifiers",
        option_to_yojson participant_identifier_list_to_yojson x.excluded_participant_identifiers );
    ]
