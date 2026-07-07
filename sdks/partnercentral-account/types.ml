type nonrec verification_type =
  | REGISTRANT_VERIFICATION [@ocaml.doc ""]
  | BUSINESS_VERIFICATION [@ocaml.doc ""]
[@@ocaml.doc ""]

type nonrec verification_status_reason = string [@@ocaml.doc ""]

type nonrec verification_status =
  | REJECTED [@ocaml.doc ""]
  | SUCCEEDED [@ocaml.doc ""]
  | FAILED [@ocaml.doc ""]
  | IN_PROGRESS [@ocaml.doc ""]
  | PENDING_CUSTOMER_ACTION [@ocaml.doc ""]
[@@ocaml.doc ""]

type nonrec legal_name = string [@@ocaml.doc ""]

type nonrec registration_id = string [@@ocaml.doc ""]

type nonrec country_code = string [@@ocaml.doc ""]

type nonrec jurisdiction_code = string [@@ocaml.doc ""]

type nonrec business_verification_details = {
  jurisdiction_of_incorporation : jurisdiction_code option;
      [@ocaml.doc
        "The specific legal jurisdiction or state where the business was incorporated or \
         registered, providing additional location context beyond the country code.\n"]
  country_code : country_code;
      [@ocaml.doc
        "The ISO 3166-1 alpha-2 country code where the business is legally registered and operates.\n"]
  registration_id : registration_id;
      [@ocaml.doc
        "The unique business registration identifier assigned by the government or regulatory \
         authority, such as a company registration number or tax identification number.\n"]
  legal_name : legal_name;
      [@ocaml.doc
        "The official legal name of the business as registered with the appropriate government \
         authorities.\n"]
}
[@@ocaml.doc
  "Contains the business information required for verifying a company's legal status and \
   registration details within AWS Partner Central.\n"]

type nonrec completion_url = string [@@ocaml.doc ""]

type nonrec date_time = Smaws_Lib.CoreTypes.Timestamp.t [@@ocaml.doc ""]

type nonrec business_verification_response = {
  completion_url_expires_at : date_time option;
      [@ocaml.doc
        "The timestamp when the completion URL expires and is no longer valid for accessing the \
         verification workflow.\n"]
  completion_url : completion_url option;
      [@ocaml.doc
        "A secure URL where the registrant can complete additional verification steps, such as \
         document upload or identity confirmation through a third-party verification service.\n"]
  business_verification_details : business_verification_details;
      [@ocaml.doc
        "The business verification details that were processed and verified, potentially including \
         additional information discovered during the verification process.\n"]
}
[@@ocaml.doc
  "Contains the response information and results from a business verification process, including \
   any verification-specific data returned by the verification service.\n"]

type nonrec registrant_verification_response = {
  completion_url_expires_at : date_time;
      [@ocaml.doc
        "The timestamp when the completion URL expires and is no longer valid for accessing the \
         verification workflow.\n"]
  completion_url : completion_url;
      [@ocaml.doc
        "A secure URL where the registrant can complete additional verification steps, such as \
         document upload or identity confirmation through a third-party verification service.\n"]
}
[@@ocaml.doc
  "Contains the response information from a registrant verification process, including any \
   verification-specific data and next steps for the individual verification workflow.\n"]

type nonrec verification_response_details =
  | RegistrantVerificationResponse of registrant_verification_response
      [@ocaml.doc
        "The response details from a registrant verification process, including verification \
         results and any additional steps required for identity confirmation.\n"]
  | BusinessVerificationResponse of business_verification_response
      [@ocaml.doc
        "The response details from a business verification process, including verification results \
         and any additional business information discovered.\n"]
[@@ocaml.doc
  "A union structure containing the response details specific to different types of verification \
   processes, providing type-specific information and results.\n"]

type nonrec registrant_verification_details = unit [@@ocaml.doc ""]

type nonrec verification_details =
  | RegistrantVerificationDetails of registrant_verification_details
      [@ocaml.doc
        "The registrant verification details to be used when starting an individual identity \
         verification process.\n"]
  | BusinessVerificationDetails of business_verification_details
      [@ocaml.doc
        "The business verification details to be used when starting a business verification process.\n"]
[@@ocaml.doc
  "A union structure containing the specific details required for different types of verification \
   processes supported by AWS Partner Central.\n"]

type nonrec validation_exception_reason =
  | BUSINESS_VALIDATION_FAILED [@ocaml.doc ""]
  | REQUEST_VALIDATION_FAILED [@ocaml.doc ""]
[@@ocaml.doc ""]

type nonrec field_validation_code =
  | INVALID_ENUM_VALUE [@ocaml.doc ""]
  | ACTION_NOT_PERMITTED [@ocaml.doc ""]
  | TOO_MANY_VALUES [@ocaml.doc ""]
  | INVALID_STRING_FORMAT [@ocaml.doc ""]
  | INVALID_VALUE [@ocaml.doc ""]
  | DUPLICATE_VALUE [@ocaml.doc ""]
  | REQUIRED_FIELD_MISSING [@ocaml.doc ""]
[@@ocaml.doc ""]

type nonrec field_validation_error = {
  code : field_validation_code;
      [@ocaml.doc "A code identifying the specific field validation error.\n"]
  message : Smaws_Lib.Smithy_api.Types.string_;
      [@ocaml.doc "A description of the field validation error.\n"]
  name : Smaws_Lib.Smithy_api.Types.string_;
      [@ocaml.doc "The name of the field that failed validation.\n"]
}
[@@ocaml.doc
  "Contains information about a field-level validation error that occurred during an operation.\n"]

type nonrec business_validation_code =
  | INELIGIBLE_ACCOUNT_TIER [@ocaml.doc ""]
  | INCOMPATIBLE_DOMAIN [@ocaml.doc ""]
  | INVALID_ACCOUNT_STATE [@ocaml.doc ""]
  | INVALID_ACCOUNT_LINKING_STATUS [@ocaml.doc ""]
  | INCOMPATIBLE_IDENTITY_VERIFICATION_STATUS [@ocaml.doc ""]
  | INCOMPATIBLE_KNOW_YOUR_BUSINESS_STATUS [@ocaml.doc ""]
  | INCOMPATIBLE_LEGAL_NAME [@ocaml.doc ""]
  | INCOMPATIBLE_CONNECTION_INVITATION_REQUEST [@ocaml.doc ""]
[@@ocaml.doc ""]

type nonrec business_validation_error = {
  code : business_validation_code;
      [@ocaml.doc "A code identifying the specific business validation error.\n"]
  message : Smaws_Lib.Smithy_api.Types.string_;
      [@ocaml.doc "A description of the business validation error.\n"]
}
[@@ocaml.doc
  "Contains information about a business rule validation error that occurred during an operation.\n"]

type nonrec validation_error =
  | BusinessValidationError of business_validation_error
      [@ocaml.doc "Details about a business rule validation error, if applicable.\n"]
  | FieldValidationError of field_validation_error
      [@ocaml.doc "Details about a field-level validation error, if applicable.\n"]
[@@ocaml.doc
  "Contains information about a validation error, which can be either a field-level or business \
   rule validation error.\n"]

type nonrec validation_error_list = validation_error list [@@ocaml.doc ""]

type nonrec validation_exception = {
  error_details : validation_error_list option;
      [@ocaml.doc "A list of detailed validation errors that occurred during request processing.\n"]
  reason : validation_exception_reason; [@ocaml.doc "The reason for the validation failure.\n"]
  message : Smaws_Lib.Smithy_api.Types.string_; [@ocaml.doc ""]
}
[@@ocaml.doc
  "The request failed validation. One or more input parameters are invalid, missing, or do not \
   meet the required format or constraints.\n"]

type nonrec url = string [@@ocaml.doc ""]

type nonrec catalog = string [@@ocaml.doc ""]

type nonrec connection_preferences_arn = string [@@ocaml.doc ""]

type nonrec access_type =
  | ALLOW_BY_DEFAULT_DENY_SOME [@ocaml.doc ""]
  | DENY_ALL [@ocaml.doc ""]
  | ALLOW_ALL [@ocaml.doc ""]
[@@ocaml.doc ""]

type nonrec participant_identifier = string [@@ocaml.doc ""]

type nonrec participant_identifier_list = participant_identifier list [@@ocaml.doc ""]

type nonrec revision = Smaws_Lib.CoreTypes.Int64.t [@@ocaml.doc ""]

type nonrec update_connection_preferences_response = {
  revision : revision; [@ocaml.doc "The updated revision number of the connection preferences.\n"]
  updated_at : date_time;
      [@ocaml.doc "The timestamp when the connection preferences were last updated.\n"]
  excluded_participant_ids : participant_identifier_list option;
      [@ocaml.doc
        "A list of participant IDs that are excluded from connection requests or interactions.\n"]
  access_type : access_type; [@ocaml.doc "The updated access type setting for connections.\n"]
  arn : connection_preferences_arn;
      [@ocaml.doc "The Amazon Resource Name (ARN) of the updated connection preferences.\n"]
  catalog : catalog; [@ocaml.doc "The catalog identifier for the partner account.\n"]
}
[@@ocaml.doc ""]

type nonrec update_connection_preferences_request = {
  excluded_participant_identifiers : participant_identifier_list option;
      [@ocaml.doc "The updated list of participant identifiers to exclude from connections.\n"]
  access_type : access_type;
      [@ocaml.doc
        "The access type setting for connections (e.g., open, restricted, invitation-only).\n"]
  revision : revision;
      [@ocaml.doc "The revision number of the connection preferences for optimistic locking.\n"]
  catalog : catalog; [@ocaml.doc "The catalog identifier for the partner account.\n"]
}
[@@ocaml.doc ""]

type nonrec throttling_exception = {
  quota_code : Smaws_Lib.Smithy_api.Types.string_ option;
      [@ocaml.doc "The quota code associated with the throttling error.\n"]
  service_code : Smaws_Lib.Smithy_api.Types.string_ option;
      [@ocaml.doc "The service code associated with the throttling error.\n"]
  message : Smaws_Lib.Smithy_api.Types.string_; [@ocaml.doc ""]
}
[@@ocaml.doc
  "The request was throttled due to too many requests being sent in a short period of time. The \
   client should implement exponential backoff and retry the request.\n"]

type nonrec internal_server_exception = {
  message : Smaws_Lib.Smithy_api.Types.string_; [@ocaml.doc ""]
}
[@@ocaml.doc
  "An internal server error occurred while processing the request. This is typically a temporary \
   condition and the request may be retried.\n"]

type nonrec conflict_exception_reason =
  | VERIFICATION_ALREADY_IN_PROGRESS [@ocaml.doc ""]
  | ACCOUNT_ALREADY_VERIFIED [@ocaml.doc ""]
  | INCOMPATIBLE_CONNECTION_PREFERENCES_REVISION [@ocaml.doc ""]
  | INCOMPATIBLE_CONNECTION_STATE [@ocaml.doc ""]
  | DUPLICATE_CONNECTION [@ocaml.doc ""]
  | INCOMPATIBLE_CONNECTION_INVITATION_RECEIVER [@ocaml.doc ""]
  | INCOMPATIBLE_CONNECTION_INVITATION_STATE [@ocaml.doc ""]
  | DUPLICATE_CONNECTION_INVITATION [@ocaml.doc ""]
  | INCOMPATIBLE_PARTNER_PROFILE_TASK_STATE [@ocaml.doc ""]
  | INCOMPATIBLE_PROFILE_STATE [@ocaml.doc ""]
  | DUPLICATE_PARTNER [@ocaml.doc ""]
  | CONFLICT_CLIENT_TOKEN [@ocaml.doc ""]
[@@ocaml.doc ""]

type nonrec conflict_exception = {
  reason : conflict_exception_reason; [@ocaml.doc "The specific reason for the conflict.\n"]
  message : Smaws_Lib.Smithy_api.Types.string_; [@ocaml.doc ""]
}
[@@ocaml.doc
  "The request could not be completed due to a conflict with the current state of the resource. \
   This typically occurs when trying to create a resource that already exists or modify a resource \
   that has been changed by another process.\n"]

type nonrec access_denied_exception_reason =
  | INCOMPATIBLE_BENEFIT_AWS_PARTNER_STATE [@ocaml.doc ""]
  | ACCESS_DENIED [@ocaml.doc ""]
[@@ocaml.doc ""]

type nonrec access_denied_exception = {
  reason : access_denied_exception_reason;
      [@ocaml.doc "The specific reason for the access denial.\n"]
  message : Smaws_Lib.Smithy_api.Types.string_; [@ocaml.doc ""]
}
[@@ocaml.doc
  "The request was denied due to insufficient permissions. The caller does not have the required \
   permissions to perform this operation.\n"]

type nonrec untag_resource_response = unit [@@ocaml.doc ""]

type nonrec taggable_resource_arn = string [@@ocaml.doc ""]

type nonrec tag_key = string [@@ocaml.doc ""]

type nonrec tag_key_list = tag_key list [@@ocaml.doc ""]

type nonrec untag_resource_request = {
  tag_keys : tag_key_list;
      [@ocaml.doc "A list of tag keys to remove from the specified resource.\n"]
  resource_arn : taggable_resource_arn;
      [@ocaml.doc "The Amazon Resource Name (ARN) of the resource to remove tags from.\n"]
}
[@@ocaml.doc ""]

type nonrec resource_not_found_exception_reason =
  | VERIFICATION_NOT_FOUND [@ocaml.doc ""]
  | CONNECTION_NOT_FOUND [@ocaml.doc ""]
  | CONNECTION_INVITATION_NOT_FOUND [@ocaml.doc ""]
  | RECEIVER_PROFILE_NOT_FOUND [@ocaml.doc ""]
  | SENDER_PROFILE_NOT_FOUND [@ocaml.doc ""]
  | PARTNER_DOMAIN_NOT_FOUND [@ocaml.doc ""]
  | PARTNER_PROFILE_TASK_NOT_FOUND [@ocaml.doc ""]
  | PARTNER_PROFILE_NOT_FOUND [@ocaml.doc ""]
  | PARTNER_NOT_FOUND [@ocaml.doc ""]
[@@ocaml.doc ""]

type nonrec resource_not_found_exception = {
  reason : resource_not_found_exception_reason;
      [@ocaml.doc "The specific reason why the resource was not found.\n"]
  message : Smaws_Lib.Smithy_api.Types.string_; [@ocaml.doc ""]
}
[@@ocaml.doc
  "The specified resource could not be found. This may occur when referencing a resource that does \
   not exist or has been deleted.\n"]

type nonrec unicode_string_including_new_line = string [@@ocaml.doc ""]

type nonrec unicode_string = string [@@ocaml.doc ""]

type nonrec primary_solution_type =
  | TRAINING_SERVICES [@ocaml.doc ""]
  | VALUE_ADDED_RESALE_AWS_SERVICES [@ocaml.doc ""]
  | COMMUNICATION_SERVICES [@ocaml.doc ""]
  | HARDWARE_PRODUCTS [@ocaml.doc ""]
  | MANAGED_SERVICES [@ocaml.doc ""]
  | PROFESSIONAL_SERVICES [@ocaml.doc ""]
  | CONSULTING_SERVICES [@ocaml.doc ""]
  | SOFTWARE_PRODUCTS [@ocaml.doc ""]
[@@ocaml.doc ""]

type nonrec industry_segment =
  | WHOLESALE_DISTRIBUTION [@ocaml.doc ""]
  | TRAVEL_HOSPITALITY [@ocaml.doc ""]
  | TRANSPORTATION_LOGISTICS [@ocaml.doc ""]
  | TELECOMMUNICATIONS [@ocaml.doc ""]
  | SOFTWARE_INTERNET [@ocaml.doc ""]
  | SEMICONDUCTOR_ELECTR [@ocaml.doc ""]
  | RETAIL_WHOLESALE_DISTRIBUTION [@ocaml.doc ""]
  | RETAIL [@ocaml.doc ""]
  | REAL_ESTATE_CONSTRUCTION [@ocaml.doc ""]
  | PROFESSIONAL_SERVICES [@ocaml.doc ""]
  | OTHER [@ocaml.doc ""]
  | NON_PROFIT_ORGANIZATION [@ocaml.doc ""]
  | MEDICAL_HEALTH [@ocaml.doc ""]
  | MEDIA_ENTERTAINMENT [@ocaml.doc ""]
  | MEDIA_ENTERTAINMENT_LEISURE [@ocaml.doc ""]
  | MANUFACTURING [@ocaml.doc ""]
  | LIFE_SCIENCES [@ocaml.doc ""]
  | INTERNET_SPECIFIC [@ocaml.doc ""]
  | INDUSTRIAL_ENERGY [@ocaml.doc ""]
  | HEALTHCARE_PHARMACEUTICALS_BIOTECH [@ocaml.doc ""]
  | HEALTHCARE [@ocaml.doc ""]
  | GOVERNMENT_EDUCATION_PUBLIC_SERVICES [@ocaml.doc ""]
  | GOVERNMENT [@ocaml.doc ""]
  | GAMING [@ocaml.doc ""]
  | FINANCIAL_SERVICES [@ocaml.doc ""]
  | ENERGY_UTILITIES [@ocaml.doc ""]
  | EDUCATION [@ocaml.doc ""]
  | CONSUMER_RELATED [@ocaml.doc ""]
  | CONSUMER_GOODS [@ocaml.doc ""]
  | COMPUTER_SOFTWARE [@ocaml.doc ""]
  | COMPUTERS_ELECTRONICS [@ocaml.doc ""]
  | COMPUTER_HARDWARE [@ocaml.doc ""]
  | COMMUNICATIONS [@ocaml.doc ""]
  | BUSINESS_SERV [@ocaml.doc ""]
  | BUSINESS_CONSUMER_SERVICES [@ocaml.doc ""]
  | BIOTECHNOLOGY [@ocaml.doc ""]
  | AGRICULTURE_MINING [@ocaml.doc ""]
[@@ocaml.doc ""]

type nonrec industry_segment_list = industry_segment list [@@ocaml.doc ""]

type nonrec locale = string [@@ocaml.doc ""]

type nonrec localized_content = {
  locale : locale; [@ocaml.doc "The locale or language code for the localized content.\n"]
  logo_url : url; [@ocaml.doc "The URL to the partner's logo image for this locale.\n"]
  website_url : url; [@ocaml.doc "The localized website URL for the partner.\n"]
  description : unicode_string;
      [@ocaml.doc "The localized description of the partner's business and services.\n"]
  display_name : unicode_string; [@ocaml.doc "The localized display name for the partner.\n"]
}
[@@ocaml.doc "Contains localized content for a partner profile in a specific language or locale.\n"]

type nonrec localized_content_list = localized_content list [@@ocaml.doc ""]

type nonrec task_details = {
  localized_contents : localized_content_list option;
      [@ocaml.doc "The updated localized content for the partner profile.\n"]
  translation_source_locale : locale;
      [@ocaml.doc "The updated translation source locale for the partner profile.\n"]
  industry_segments : industry_segment_list;
      [@ocaml.doc "The updated industry segments for the partner profile.\n"]
  primary_solution_type : primary_solution_type;
      [@ocaml.doc "The updated primary solution type for the partner profile.\n"]
  logo_url : url; [@ocaml.doc "The updated logo URL for the partner profile.\n"]
  website_url : url; [@ocaml.doc "The updated website URL for the partner profile.\n"]
  description : unicode_string; [@ocaml.doc "The updated description for the partner profile.\n"]
  display_name : unicode_string; [@ocaml.doc "The updated display name for the partner profile.\n"]
}
[@@ocaml.doc
  "Contains detailed information about a profile update task including the changes to be made.\n"]

type nonrec tag_value = string [@@ocaml.doc ""]

type nonrec tag_resource_response = unit [@@ocaml.doc ""]

type nonrec tag = {
  value : tag_value;
      [@ocaml.doc "The value associated with the tag key. Tag values are case-sensitive.\n"]
  key : tag_key; [@ocaml.doc "The key name of the tag. Tag keys are case-sensitive.\n"]
}
[@@ocaml.doc
  "A key-value pair used to associate metadata with AWS Partner Central Account resources.\n"]

type nonrec tag_list = tag list [@@ocaml.doc ""]

type nonrec tag_resource_request = {
  tags : tag_list; [@ocaml.doc "A list of tags to add or update for the specified resource.\n"]
  resource_arn : taggable_resource_arn;
      [@ocaml.doc "The Amazon Resource Name (ARN) of the resource to tag.\n"]
}
[@@ocaml.doc ""]

type nonrec start_verification_response = {
  completed_at : date_time option;
      [@ocaml.doc
        "The timestamp when the verification process was completed. This field is typically null \
         for newly started verifications unless they complete immediately.\n"]
  started_at : date_time;
      [@ocaml.doc "The timestamp when the verification process was successfully initiated.\n"]
  verification_response_details : verification_response_details;
      [@ocaml.doc
        "Initial response details specific to the type of verification started, which may include \
         next steps or additional requirements.\n"]
  verification_status_reason : verification_status_reason option;
      [@ocaml.doc
        "Additional information about the initial verification status, including any immediate \
         feedback about the submitted verification details.\n"]
  verification_status : verification_status;
      [@ocaml.doc
        "The initial status of the verification process after it has been started. Typically this \
         will be pending or in-progress.\n"]
  verification_type : verification_type;
      [@ocaml.doc
        "The type of verification that was started based on the provided verification details.\n"]
}
[@@ocaml.doc ""]

type nonrec client_token = string [@@ocaml.doc ""]

type nonrec start_verification_request = {
  verification_details : verification_details option;
      [@ocaml.doc
        "The specific details required for the verification process, including business \
         information for business verification or personal information for registrant verification.\n"]
  client_token : client_token option;
      [@ocaml.doc
        "A unique, case-sensitive identifier that you provide to ensure the idempotency of the \
         request. This prevents duplicate verification processes from being started accidentally.\n"]
}
[@@ocaml.doc ""]

type nonrec service_quota_exceeded_exception_reason =
  | LIMIT_EXCEEDED_NUMBER_OF_PROFILE_VISIBILITY_UPDATE_PER_DAY [@ocaml.doc ""]
  | LIMIT_EXCEEDED_NUMBER_OF_PROFILE_UPDATE_PER_DAY [@ocaml.doc ""]
  | LIMIT_EXCEEDED_NUMBER_OF_OPEN_CONNECTION_INVITATION [@ocaml.doc ""]
  | LIMIT_EXCEEDED_NUMBER_OF_ACTIVE_CONNECTION [@ocaml.doc ""]
  | LIMIT_EXCEEDED_NUMBER_OF_CONNECTION_INVITATION_PER_DAY [@ocaml.doc ""]
  | LIMIT_EXCEEDED_NUMBER_OF_DOMAIN [@ocaml.doc ""]
  | LIMIT_EXCEEDED_NUMBER_OF_EMAIL [@ocaml.doc ""]
[@@ocaml.doc ""]

type nonrec service_quota_exceeded_exception = {
  reason : service_quota_exceeded_exception_reason;
      [@ocaml.doc "The specific reason for the service quota being exceeded.\n"]
  message : Smaws_Lib.Smithy_api.Types.string_; [@ocaml.doc ""]
}
[@@ocaml.doc
  "The request was rejected because it would exceed a service quota or limit. This may occur when \
   trying to create more resources than allowed by the service limits.\n"]

type nonrec partner_arn = string [@@ocaml.doc ""]

type nonrec partner_id = string [@@ocaml.doc ""]

type nonrec profile_task_id = string [@@ocaml.doc ""]

type nonrec profile_task_status =
  | FAILED [@ocaml.doc ""]
  | SUCCEEDED [@ocaml.doc ""]
  | CANCELED [@ocaml.doc ""]
  | IN_PROGRESS [@ocaml.doc ""]
[@@ocaml.doc ""]

type nonrec profile_validation_error_reason =
  | INVALID_WEBSITE_URL [@ocaml.doc ""]
  | INVALID_LOGO_SIZE [@ocaml.doc ""]
  | INVALID_LOGO_FILE [@ocaml.doc ""]
  | INVALID_LOGO_URL [@ocaml.doc ""]
  | INVALID_LOGO [@ocaml.doc ""]
  | DUPLICATE_PROFILE [@ocaml.doc ""]
  | INVALID_CONTENT [@ocaml.doc ""]
[@@ocaml.doc ""]

type nonrec error_detail = {
  reason : profile_validation_error_reason;
      [@ocaml.doc "A machine-readable code or reason for the error.\n"]
  message : Smaws_Lib.Smithy_api.Types.string_;
      [@ocaml.doc "A human-readable description of the error.\n"]
  locale : Smaws_Lib.Smithy_api.Types.string_;
      [@ocaml.doc "The locale or language code for the error message.\n"]
}
[@@ocaml.doc "Contains detailed information about an error that occurred during an operation.\n"]

type nonrec error_detail_list = error_detail list [@@ocaml.doc ""]

type nonrec start_profile_update_task_response = {
  error_detail_list : error_detail_list option;
      [@ocaml.doc
        "A list of error details if any errors occurred during the profile update task.\n"]
  ended_at : date_time option;
      [@ocaml.doc
        "The timestamp when the profile update task ended (null for in-progress tasks).\n"]
  status : profile_task_status;
      [@ocaml.doc "The current status of the profile update task (in progress).\n"]
  started_at : date_time; [@ocaml.doc "The timestamp when the profile update task was started.\n"]
  task_details : task_details;
      [@ocaml.doc "The details of the profile update task that was started.\n"]
  task_id : profile_task_id;
      [@ocaml.doc "The unique identifier of the started profile update task.\n"]
  id : partner_id; [@ocaml.doc "The unique identifier of the partner account.\n"]
  arn : partner_arn;
      [@ocaml.doc "The Amazon Resource Name (ARN) of the started profile update task.\n"]
  catalog : catalog; [@ocaml.doc "The catalog identifier for the partner account.\n"]
}
[@@ocaml.doc ""]

type nonrec partner_identifier = string [@@ocaml.doc ""]

type nonrec start_profile_update_task_request = {
  task_details : task_details; [@ocaml.doc "The details of the profile updates to be performed.\n"]
  client_token : client_token option;
      [@ocaml.doc
        "A unique, case-sensitive identifier that you provide to ensure the idempotency of the \
         request.\n"]
  identifier : partner_identifier; [@ocaml.doc "The unique identifier of the partner account.\n"]
  catalog : catalog; [@ocaml.doc "The catalog identifier for the partner account.\n"]
}
[@@ocaml.doc ""]

type nonrec sensitive_unicode_string = string [@@ocaml.doc ""]

type nonrec send_email_verification_code_response = unit [@@ocaml.doc ""]

type nonrec email = string [@@ocaml.doc ""]

type nonrec send_email_verification_code_request = {
  email : email; [@ocaml.doc "The email address to send the verification code to.\n"]
  catalog : catalog; [@ocaml.doc "The catalog identifier for the partner account.\n"]
}
[@@ocaml.doc ""]

type nonrec seller_profile_id = string [@@ocaml.doc ""]

type nonrec seller_profile_summary = {
  name : unicode_string; [@ocaml.doc "The display name of the seller.\n"]
  id : seller_profile_id; [@ocaml.doc "The unique identifier of the seller profile.\n"]
}
[@@ocaml.doc "A summary view of a seller profile containing basic identifying information.\n"]

type nonrec connection_invitation_id = string [@@ocaml.doc ""]

type nonrec connection_invitation_arn = string [@@ocaml.doc ""]

type nonrec connection_id = string [@@ocaml.doc ""]

type nonrec connection_type =
  | SUBSIDIARY [@ocaml.doc ""]
  | OPPORTUNITY_COLLABORATION [@ocaml.doc ""]
[@@ocaml.doc ""]

type nonrec participant_type = RECEIVER [@ocaml.doc ""] | SENDER [@ocaml.doc ""] [@@ocaml.doc ""]

type nonrec invitation_status =
  | EXPIRED [@ocaml.doc ""]
  | CANCELED [@ocaml.doc ""]
  | REJECTED [@ocaml.doc ""]
  | ACCEPTED [@ocaml.doc ""]
  | PENDING [@ocaml.doc ""]
[@@ocaml.doc ""]

type nonrec reject_connection_invitation_response = {
  inviter_name : sensitive_unicode_string;
      [@ocaml.doc "The name of the person who sent the connection invitation.\n"]
  inviter_email : email;
      [@ocaml.doc "The email address of the person who sent the connection invitation.\n"]
  invitation_message : unicode_string_including_new_line;
      [@ocaml.doc "The message that was included with the original connection invitation.\n"]
  status : invitation_status;
      [@ocaml.doc "The current status of the connection invitation (rejected).\n"]
  participant_type : participant_type;
      [@ocaml.doc "The type of participant (inviter or invitee) in the connection invitation.\n"]
  other_participant_identifier : participant_identifier;
      [@ocaml.doc "The identifier of the other participant who sent the invitation.\n"]
  expires_at : date_time option;
      [@ocaml.doc "The timestamp when the connection invitation would have expired.\n"]
  updated_at : date_time;
      [@ocaml.doc "The timestamp when the connection invitation was last updated (rejected).\n"]
  created_at : date_time;
      [@ocaml.doc "The timestamp when the connection invitation was originally created.\n"]
  connection_type : connection_type;
      [@ocaml.doc "The type of connection that was being invited for.\n"]
  connection_id : connection_id option;
      [@ocaml.doc "The identifier of the connection associated with the rejected invitation.\n"]
  arn : connection_invitation_arn;
      [@ocaml.doc "The Amazon Resource Name (ARN) of the rejected connection invitation.\n"]
  id : connection_invitation_id;
      [@ocaml.doc "The unique identifier of the rejected connection invitation.\n"]
  catalog : catalog;
      [@ocaml.doc "The catalog identifier where the connection invitation was rejected.\n"]
}
[@@ocaml.doc ""]

type nonrec reject_connection_invitation_request = {
  reason : Smaws_Lib.Smithy_api.Types.string_ option;
      [@ocaml.doc "The reason for rejecting the connection invitation.\n"]
  client_token : client_token;
      [@ocaml.doc
        "A unique, case-sensitive identifier that you provide to ensure the idempotency of the \
         request.\n"]
  identifier : connection_invitation_id;
      [@ocaml.doc "The unique identifier of the connection invitation to reject.\n"]
  catalog : catalog; [@ocaml.doc "The catalog identifier where the connection invitation exists.\n"]
}
[@@ocaml.doc ""]

type nonrec profile_visibility = PUBLIC [@ocaml.doc ""] | PRIVATE [@ocaml.doc ""] [@@ocaml.doc ""]

type nonrec partner_profile_id = string [@@ocaml.doc ""]

type nonrec put_profile_visibility_response = {
  profile_id : partner_profile_id; [@ocaml.doc "The unique identifier of the partner profile.\n"]
  visibility : profile_visibility;
      [@ocaml.doc "The updated visibility setting for the partner profile.\n"]
  id : partner_id; [@ocaml.doc "The unique identifier of the partner account.\n"]
  arn : partner_arn; [@ocaml.doc "The Amazon Resource Name (ARN) of the partner account.\n"]
  catalog : catalog; [@ocaml.doc "The catalog identifier for the partner account.\n"]
}
[@@ocaml.doc ""]

type nonrec put_profile_visibility_request = {
  visibility : profile_visibility;
      [@ocaml.doc "The visibility setting to apply to the partner profile.\n"]
  identifier : partner_identifier; [@ocaml.doc "The unique identifier of the partner account.\n"]
  catalog : catalog; [@ocaml.doc "The catalog identifier for the partner account.\n"]
}
[@@ocaml.doc ""]

type nonrec alliance_lead_contact = {
  business_title : sensitive_unicode_string;
      [@ocaml.doc "The business title or role of the alliance lead contact person.\n"]
  email : email; [@ocaml.doc "The email address of the alliance lead contact person.\n"]
  last_name : sensitive_unicode_string;
      [@ocaml.doc "The last name of the alliance lead contact person.\n"]
  first_name : sensitive_unicode_string;
      [@ocaml.doc "The first name of the alliance lead contact person.\n"]
}
[@@ocaml.doc
  "Contains contact information for the primary alliance lead responsible for partnership \
   activities.\n"]

type nonrec put_alliance_lead_contact_response = {
  alliance_lead_contact : alliance_lead_contact;
      [@ocaml.doc "The updated alliance lead contact information.\n"]
  id : partner_id; [@ocaml.doc "The unique identifier of the partner account.\n"]
  arn : partner_arn; [@ocaml.doc "The Amazon Resource Name (ARN) of the partner account.\n"]
  catalog : catalog; [@ocaml.doc "The catalog identifier for the partner account.\n"]
}
[@@ocaml.doc ""]

type nonrec email_verification_code = string [@@ocaml.doc ""]

type nonrec put_alliance_lead_contact_request = {
  email_verification_code : email_verification_code option;
      [@ocaml.doc
        "The verification code sent to the alliance lead contact's email to confirm the update.\n"]
  alliance_lead_contact : alliance_lead_contact;
      [@ocaml.doc "The alliance lead contact information to set for the partner account.\n"]
  identifier : partner_identifier; [@ocaml.doc "The unique identifier of the partner account.\n"]
  catalog : catalog; [@ocaml.doc "The catalog identifier for the partner account.\n"]
}
[@@ocaml.doc ""]

type nonrec partner_summary = {
  created_at : date_time; [@ocaml.doc "The timestamp when the partner account was created.\n"]
  legal_name : sensitive_unicode_string;
      [@ocaml.doc "The legal name of the partner organization.\n"]
  id : partner_id; [@ocaml.doc "The unique identifier of the partner account.\n"]
  arn : partner_arn; [@ocaml.doc "The Amazon Resource Name (ARN) of the partner account.\n"]
  catalog : catalog; [@ocaml.doc "The catalog identifier for the partner account.\n"]
}
[@@ocaml.doc
  "A summary view of a partner account containing basic information for listing purposes.\n"]

type nonrec partner_summary_list = partner_summary list [@@ocaml.doc ""]

type nonrec partner_profile_summary = {
  name : unicode_string; [@ocaml.doc "The display name of the partner.\n"]
  id : partner_profile_id; [@ocaml.doc "The unique identifier of the partner profile.\n"]
}
[@@ocaml.doc "A summary view of a partner profile containing basic identifying information.\n"]

type nonrec partner_profile = {
  profile_id : partner_profile_id option;
      [@ocaml.doc "The unique identifier of the partner profile.\n"]
  localized_contents : localized_content_list option;
      [@ocaml.doc "A list of localized content versions for different languages and regions.\n"]
  translation_source_locale : locale;
      [@ocaml.doc "The source locale used for automatic translation of profile content.\n"]
  industry_segments : industry_segment_list;
      [@ocaml.doc "The industry segments or verticals that the partner serves.\n"]
  primary_solution_type : primary_solution_type;
      [@ocaml.doc "The primary type of solution or service the partner provides.\n"]
  logo_url : url; [@ocaml.doc "The URL to the partner's logo image.\n"]
  website_url : url; [@ocaml.doc "The partner's primary website URL.\n"]
  description : unicode_string;
      [@ocaml.doc "A description of the partner's business, services, and capabilities.\n"]
  display_name : unicode_string;
      [@ocaml.doc "The public display name for the partner organization.\n"]
}
[@@ocaml.doc
  "Contains comprehensive profile information for a partner including public-facing details.\n"]

type nonrec domain_name = string [@@ocaml.doc ""]

type nonrec partner_domain = {
  registered_at : date_time;
      [@ocaml.doc
        "The timestamp when the domain was registered and verified for the partner account.\n"]
  domain_name : domain_name;
      [@ocaml.doc "The domain name that has been verified for the partner account.\n"]
}
[@@ocaml.doc "Represents a verified domain associated with a partner account.\n"]

type nonrec partner_domain_list = partner_domain list [@@ocaml.doc ""]

type nonrec list_tags_for_resource_response = {
  tags : tag_list option; [@ocaml.doc "A list of tags associated with the specified resource.\n"]
  resource_arn : taggable_resource_arn;
      [@ocaml.doc
        "The Amazon Resource Name (ARN) of the resource that the tags are associated with.\n"]
}
[@@ocaml.doc ""]

type nonrec list_tags_for_resource_request = {
  resource_arn : taggable_resource_arn;
      [@ocaml.doc "The Amazon Resource Name (ARN) of the resource to list tags for.\n"]
}
[@@ocaml.doc ""]

type nonrec get_verification_response = {
  completed_at : date_time option;
      [@ocaml.doc
        "The timestamp when the verification process was completed. This field is null if the \
         verification is still in progress.\n"]
  started_at : date_time;
      [@ocaml.doc "The timestamp when the verification process was initiated.\n"]
  verification_response_details : verification_response_details;
      [@ocaml.doc
        "Detailed response information specific to the type of verification performed, including \
         any verification-specific data or results.\n"]
  verification_status_reason : verification_status_reason option;
      [@ocaml.doc
        "Additional information explaining the current verification status, particularly useful \
         when the status indicates a failure or requires additional action.\n"]
  verification_status : verification_status;
      [@ocaml.doc
        "The current status of the verification process. Possible values include pending, \
         in-progress, completed, failed, or expired.\n"]
  verification_type : verification_type;
      [@ocaml.doc "The type of verification that was requested and processed.\n"]
}
[@@ocaml.doc ""]

type nonrec get_verification_request = {
  verification_type : verification_type;
      [@ocaml.doc
        "The type of verification to retrieve information for. Valid values include business \
         verification for company registration details and registrant verification for individual \
         identity confirmation.\n"]
}
[@@ocaml.doc ""]

type nonrec partner = Smaws_Lib.CoreTypes.Resource.t [@@ocaml.doc ""]

type nonrec account_summary = {
  name : unicode_string; [@ocaml.doc "The name associated with the AWS account.\n"]
}
[@@ocaml.doc "Summary information about an AWS account.\n"]

type nonrec participant =
  | Account of account_summary [@ocaml.doc "The AWS account information for the participant.\n"]
  | SellerProfile of seller_profile_summary
      [@ocaml.doc "The seller profile information for the participant.\n"]
  | PartnerProfile of partner_profile_summary
      [@ocaml.doc "The partner profile information for the participant.\n"]
[@@ocaml.doc
  "Represents a participant in a partner connection, containing their profile and account \
   information.\n"]

type nonrec next_token = string [@@ocaml.doc ""]

type nonrec max_results = int [@@ocaml.doc ""]

type nonrec list_partners_response = {
  next_token : next_token option;
      [@ocaml.doc
        "The token for retrieving the next page of results if more results are available.\n"]
  partner_summary_list : partner_summary_list;
      [@ocaml.doc
        "A list of partner summaries including basic information about each partner account.\n"]
}
[@@ocaml.doc ""]

type nonrec list_partners_request = {
  next_token : next_token option;
      [@ocaml.doc "The token for retrieving the next page of results in paginated responses.\n"]
  catalog : catalog; [@ocaml.doc "The catalog identifier to list partners from.\n"]
}
[@@ocaml.doc ""]

type nonrec connection_arn = string [@@ocaml.doc ""]

type nonrec aws_account_id = string [@@ocaml.doc ""]

type nonrec connection_type_status = CANCELED [@ocaml.doc ""] | ACTIVE [@ocaml.doc ""]
[@@ocaml.doc ""]

type nonrec connection_type_summary = {
  other_participant : participant;
      [@ocaml.doc "Information about the other participant in this connection type.\n"]
  status : connection_type_status;
      [@ocaml.doc "The current status of this connection type (active, canceled, etc.).\n"]
}
[@@ocaml.doc "Summary information about a specific connection type between partners.\n"]

type nonrec connection_type_summary_map = (connection_type * connection_type_summary) list
[@@ocaml.doc ""]

type nonrec connection_summary = {
  connection_types : connection_type_summary_map;
      [@ocaml.doc "A map of connection types and their summary information for this connection.\n"]
  updated_at : date_time; [@ocaml.doc "The timestamp when the connection was last updated.\n"]
  other_participant_account_id : aws_account_id;
      [@ocaml.doc "The AWS account ID of the other participant in the connection.\n"]
  arn : connection_arn; [@ocaml.doc "The Amazon Resource Name (ARN) of the connection.\n"]
  id : connection_id; [@ocaml.doc "The unique identifier of the connection.\n"]
  catalog : catalog; [@ocaml.doc "The catalog identifier where the connection exists.\n"]
}
[@@ocaml.doc
  "A summary view of an active connection between partners containing key information.\n"]

type nonrec connection_summary_list = connection_summary list [@@ocaml.doc ""]

type nonrec list_connections_response = {
  next_token : next_token option;
      [@ocaml.doc
        "The token for retrieving the next page of results if more results are available.\n"]
  connection_summaries : connection_summary_list;
      [@ocaml.doc "A list of connection summaries matching the specified criteria.\n"]
}
[@@ocaml.doc ""]

type nonrec connection_type_filter = string [@@ocaml.doc ""]

type nonrec list_connections_request = {
  other_participant_identifiers : participant_identifier_list option;
      [@ocaml.doc "Filter results by specific participant identifiers.\n"]
  max_results : max_results option;
      [@ocaml.doc "The maximum number of connections to return in a single response.\n"]
  connection_type : connection_type_filter option;
      [@ocaml.doc
        "Filter results by connection type (e.g., reseller, distributor, technology partner).\n"]
  next_token : next_token option;
      [@ocaml.doc "The token for retrieving the next page of results in paginated responses.\n"]
  catalog : catalog; [@ocaml.doc "The catalog identifier for the partner account.\n"]
}
[@@ocaml.doc ""]

type nonrec connection_invitation_summary = {
  status : invitation_status; [@ocaml.doc "The current status of the connection invitation.\n"]
  participant_type : participant_type;
      [@ocaml.doc "The type of participant (inviter or invitee) in the connection invitation.\n"]
  other_participant_identifier : participant_identifier;
      [@ocaml.doc "The identifier of the other participant in the connection invitation.\n"]
  expires_at : date_time option;
      [@ocaml.doc "The timestamp when the connection invitation will expire.\n"]
  updated_at : date_time;
      [@ocaml.doc "The timestamp when the connection invitation was last updated.\n"]
  created_at : date_time; [@ocaml.doc "The timestamp when the connection invitation was created.\n"]
  connection_type : connection_type;
      [@ocaml.doc "The type of connection being requested in the invitation.\n"]
  connection_id : connection_id option;
      [@ocaml.doc "The identifier of the connection associated with this invitation.\n"]
  arn : connection_invitation_arn;
      [@ocaml.doc "The Amazon Resource Name (ARN) of the connection invitation.\n"]
  id : connection_invitation_id;
      [@ocaml.doc "The unique identifier of the connection invitation.\n"]
  catalog : catalog; [@ocaml.doc "The catalog identifier where the connection invitation exists.\n"]
}
[@@ocaml.doc
  "A summary view of a connection invitation containing key information without full details.\n"]

type nonrec connection_invitation_summary_list = connection_invitation_summary list [@@ocaml.doc ""]

type nonrec list_connection_invitations_response = {
  next_token : next_token option;
      [@ocaml.doc
        "The token for retrieving the next page of results if more results are available.\n"]
  connection_invitation_summaries : connection_invitation_summary_list;
      [@ocaml.doc "A list of connection invitation summaries matching the specified criteria.\n"]
}
[@@ocaml.doc ""]

type nonrec list_connection_invitations_request = {
  status : invitation_status option;
      [@ocaml.doc
        "Filter results by invitation status (pending, accepted, rejected, canceled, expired).\n"]
  participant_type : participant_type option;
      [@ocaml.doc "Filter results by participant type (inviter or invitee).\n"]
  other_participant_identifiers : participant_identifier_list option;
      [@ocaml.doc "Filter results by specific participant identifiers.\n"]
  max_results : max_results option;
      [@ocaml.doc "The maximum number of connection invitations to return in a single response.\n"]
  connection_type : connection_type option;
      [@ocaml.doc
        "Filter results by connection type (e.g., reseller, distributor, technology partner).\n"]
  next_token : next_token option;
      [@ocaml.doc "The token for retrieving the next page of results in paginated responses.\n"]
  catalog : catalog; [@ocaml.doc "The catalog identifier for the partner account.\n"]
}
[@@ocaml.doc ""]

type nonrec get_profile_visibility_response = {
  profile_id : partner_profile_id; [@ocaml.doc "The unique identifier of the partner profile.\n"]
  visibility : profile_visibility;
      [@ocaml.doc
        "The visibility setting for the partner profile (public, private, restricted, etc.).\n"]
  id : partner_id; [@ocaml.doc "The unique identifier of the partner account.\n"]
  arn : partner_arn; [@ocaml.doc "The Amazon Resource Name (ARN) of the partner account.\n"]
  catalog : catalog; [@ocaml.doc "The catalog identifier for the partner account.\n"]
}
[@@ocaml.doc ""]

type nonrec get_profile_visibility_request = {
  identifier : partner_identifier; [@ocaml.doc "The unique identifier of the partner account.\n"]
  catalog : catalog; [@ocaml.doc "The catalog identifier for the partner account.\n"]
}
[@@ocaml.doc ""]

type nonrec get_profile_update_task_response = {
  error_detail_list : error_detail_list option;
      [@ocaml.doc
        "A list of error details if any errors occurred during the profile update task.\n"]
  ended_at : date_time option;
      [@ocaml.doc "The timestamp when the profile update task was completed or failed.\n"]
  status : profile_task_status;
      [@ocaml.doc
        "The current status of the profile update task (in progress, completed, failed, etc.).\n"]
  started_at : date_time; [@ocaml.doc "The timestamp when the profile update task was started.\n"]
  task_details : task_details;
      [@ocaml.doc "The details of the profile update task including what changes are being made.\n"]
  task_id : profile_task_id; [@ocaml.doc "The unique identifier of the profile update task.\n"]
  id : partner_id; [@ocaml.doc "The unique identifier of the partner account.\n"]
  arn : partner_arn; [@ocaml.doc "The Amazon Resource Name (ARN) of the profile update task.\n"]
  catalog : catalog; [@ocaml.doc "The catalog identifier for the partner account.\n"]
}
[@@ocaml.doc ""]

type nonrec get_profile_update_task_request = {
  identifier : partner_identifier; [@ocaml.doc "The unique identifier of the partner account.\n"]
  catalog : catalog; [@ocaml.doc "The catalog identifier for the partner account.\n"]
}
[@@ocaml.doc ""]

type nonrec get_partner_response = {
  aws_training_certification_email_domains : partner_domain_list option;
      [@ocaml.doc
        "The list of verified email domains associated with AWS training and certification \
         credentials for the partner organization.\n"]
  profile : partner_profile;
      [@ocaml.doc
        "The partner profile information including display name, description, and other public \
         details.\n"]
  created_at : date_time; [@ocaml.doc "The timestamp when the partner account was created.\n"]
  legal_name : sensitive_unicode_string;
      [@ocaml.doc "The legal name of the partner organization.\n"]
  id : partner_id; [@ocaml.doc "The unique identifier of the partner account.\n"]
  arn : partner_arn; [@ocaml.doc "The Amazon Resource Name (ARN) of the partner account.\n"]
  catalog : catalog; [@ocaml.doc "The catalog identifier for the partner account.\n"]
}
[@@ocaml.doc ""]

type nonrec get_partner_request = {
  identifier : partner_identifier;
      [@ocaml.doc "The unique identifier of the partner account to retrieve.\n"]
  catalog : catalog; [@ocaml.doc "The catalog identifier for the partner account.\n"]
}
[@@ocaml.doc ""]

type nonrec connection_type_detail = {
  other_participant : participant;
      [@ocaml.doc "Information about the other participant in this connection type.\n"]
  canceled_by : aws_account_id option;
      [@ocaml.doc "The AWS account ID of the participant who cancelled this connection type.\n"]
  canceled_at : date_time option;
      [@ocaml.doc "The timestamp when this connection type was cancelled, if applicable.\n"]
  status : connection_type_status; [@ocaml.doc "The current status of this connection type.\n"]
  inviter_name : sensitive_unicode_string;
      [@ocaml.doc "The name of the person who initiated this connection type.\n"]
  inviter_email : email;
      [@ocaml.doc "The email address of the person who initiated this connection type.\n"]
  created_at : date_time; [@ocaml.doc "The timestamp when this connection type was created.\n"]
}
[@@ocaml.doc "Detailed information about a specific connection type within a connection.\n"]

type nonrec connection_type_detail_map = (connection_type * connection_type_detail) list
[@@ocaml.doc ""]

type nonrec get_connection_response = {
  connection_types : connection_type_detail_map;
      [@ocaml.doc "The list of connection types active between the partners.\n"]
  updated_at : date_time; [@ocaml.doc "The timestamp when the connection was last updated.\n"]
  other_participant_account_id : aws_account_id;
      [@ocaml.doc "The AWS account ID of the other participant in the connection.\n"]
  arn : connection_arn; [@ocaml.doc "The Amazon Resource Name (ARN) of the connection.\n"]
  id : connection_id; [@ocaml.doc "The unique identifier of the connection.\n"]
  catalog : catalog; [@ocaml.doc "The catalog identifier where the connection exists.\n"]
}
[@@ocaml.doc ""]

type nonrec get_connection_request = {
  identifier : connection_id; [@ocaml.doc "The unique identifier of the connection to retrieve.\n"]
  catalog : catalog; [@ocaml.doc "The catalog identifier where the connection exists.\n"]
}
[@@ocaml.doc ""]

type nonrec get_connection_preferences_response = {
  revision : revision;
      [@ocaml.doc "The revision number of the connection preferences for optimistic locking.\n"]
  updated_at : date_time;
      [@ocaml.doc "The timestamp when the connection preferences were last updated.\n"]
  excluded_participant_ids : participant_identifier_list option;
      [@ocaml.doc
        "A list of participant IDs that are excluded from connection requests or interactions.\n"]
  access_type : access_type;
      [@ocaml.doc
        "The access type setting for connections (e.g., open, restricted, invitation-only).\n"]
  arn : connection_preferences_arn;
      [@ocaml.doc "The Amazon Resource Name (ARN) of the connection preferences.\n"]
  catalog : catalog; [@ocaml.doc "The catalog identifier for the partner account.\n"]
}
[@@ocaml.doc ""]

type nonrec get_connection_preferences_request = {
  catalog : catalog; [@ocaml.doc "The catalog identifier for the partner account.\n"]
}
[@@ocaml.doc ""]

type nonrec get_connection_invitation_response = {
  inviter_name : sensitive_unicode_string;
      [@ocaml.doc "The name of the person who sent the connection invitation.\n"]
  inviter_email : email;
      [@ocaml.doc "The email address of the person who sent the connection invitation.\n"]
  invitation_message : unicode_string_including_new_line;
      [@ocaml.doc "The custom message included with the connection invitation.\n"]
  status : invitation_status; [@ocaml.doc "The current status of the connection invitation.\n"]
  participant_type : participant_type;
      [@ocaml.doc "The type of participant (inviter or invitee) in the connection invitation.\n"]
  other_participant_identifier : participant_identifier;
      [@ocaml.doc "The identifier of the other participant in the connection invitation.\n"]
  expires_at : date_time option;
      [@ocaml.doc "The timestamp when the connection invitation will expire.\n"]
  updated_at : date_time;
      [@ocaml.doc "The timestamp when the connection invitation was last updated.\n"]
  created_at : date_time; [@ocaml.doc "The timestamp when the connection invitation was created.\n"]
  connection_type : connection_type;
      [@ocaml.doc "The type of connection being requested in the invitation.\n"]
  connection_id : connection_id option;
      [@ocaml.doc "The identifier of the connection associated with this invitation.\n"]
  arn : connection_invitation_arn;
      [@ocaml.doc "The Amazon Resource Name (ARN) of the connection invitation.\n"]
  id : connection_invitation_id;
      [@ocaml.doc "The unique identifier of the connection invitation.\n"]
  catalog : catalog; [@ocaml.doc "The catalog identifier where the connection invitation exists.\n"]
}
[@@ocaml.doc ""]

type nonrec get_connection_invitation_request = {
  identifier : connection_invitation_id;
      [@ocaml.doc "The unique identifier of the connection invitation to retrieve.\n"]
  catalog : catalog; [@ocaml.doc "The catalog identifier where the connection invitation exists.\n"]
}
[@@ocaml.doc ""]

type nonrec get_alliance_lead_contact_response = {
  alliance_lead_contact : alliance_lead_contact;
      [@ocaml.doc
        "The alliance lead contact information including name, email, and business title.\n"]
  id : partner_id; [@ocaml.doc "The unique identifier of the partner account.\n"]
  arn : partner_arn; [@ocaml.doc "The Amazon Resource Name (ARN) of the partner account.\n"]
  catalog : catalog; [@ocaml.doc "The catalog identifier for the partner account.\n"]
}
[@@ocaml.doc ""]

type nonrec get_alliance_lead_contact_request = {
  identifier : partner_identifier; [@ocaml.doc "The unique identifier of the partner account.\n"]
  catalog : catalog; [@ocaml.doc "The catalog identifier for the partner account.\n"]
}
[@@ocaml.doc ""]

type nonrec disassociate_aws_training_certification_email_domain_response = unit [@@ocaml.doc ""]

type nonrec disassociate_aws_training_certification_email_domain_request = {
  domain_name : domain_name;
      [@ocaml.doc "The domain name to disassociate from AWS training and certification.\n"]
  client_token : client_token option;
      [@ocaml.doc
        "A unique, case-sensitive identifier that you provide to ensure the idempotency of the \
         request.\n"]
  identifier : partner_identifier; [@ocaml.doc "The unique identifier of the partner account.\n"]
  catalog : catalog; [@ocaml.doc "The catalog identifier for the partner account.\n"]
}
[@@ocaml.doc ""]

type nonrec create_partner_response = {
  alliance_lead_contact : alliance_lead_contact;
      [@ocaml.doc "The alliance lead contact information for the partner account.\n"]
  aws_training_certification_email_domains : partner_domain_list option;
      [@ocaml.doc
        "The list of verified email domains associated with AWS training and certification \
         credentials for the partner organization.\n"]
  profile : partner_profile;
      [@ocaml.doc
        "The partner profile information including display name, description, and other public \
         details.\n"]
  created_at : date_time; [@ocaml.doc "The timestamp when the partner account was created.\n"]
  legal_name : sensitive_unicode_string;
      [@ocaml.doc "The legal name of the partner organization.\n"]
  id : partner_id; [@ocaml.doc "The unique identifier of the created partner account.\n"]
  arn : partner_arn; [@ocaml.doc "The Amazon Resource Name (ARN) of the created partner account.\n"]
  catalog : catalog; [@ocaml.doc "The catalog identifier where the partner account was created.\n"]
}
[@@ocaml.doc ""]

type nonrec create_partner_request = {
  tags : tag_list option;
      [@ocaml.doc
        "A list of tags to associate with the partner account for organization and billing purposes.\n"]
  email_verification_code : email_verification_code;
      [@ocaml.doc
        "The verification code sent to the alliance lead contact's email to confirm account \
         creation.\n"]
  alliance_lead_contact : alliance_lead_contact;
      [@ocaml.doc "The primary contact person for alliance and partnership matters.\n"]
  primary_solution_type : primary_solution_type;
      [@ocaml.doc
        "The primary type of solution or service the partner provides (e.g., consulting, software, \
         managed services).\n"]
  legal_name : sensitive_unicode_string;
      [@ocaml.doc "The legal name of the organization becoming a partner.\n"]
  client_token : client_token option;
      [@ocaml.doc
        "A unique, case-sensitive identifier that you provide to ensure the idempotency of the \
         request.\n"]
  catalog : catalog;
      [@ocaml.doc "The catalog identifier where the partner account will be created.\n"]
}
[@@ocaml.doc ""]

type nonrec create_connection_invitation_response = {
  inviter_name : sensitive_unicode_string;
      [@ocaml.doc "The name of the person who sent the connection invitation.\n"]
  inviter_email : email;
      [@ocaml.doc "The email address of the person who sent the connection invitation.\n"]
  invitation_message : unicode_string_including_new_line;
      [@ocaml.doc "The custom message included with the connection invitation.\n"]
  status : invitation_status;
      [@ocaml.doc
        "The current status of the connection invitation (pending, accepted, rejected, etc.).\n"]
  participant_type : participant_type;
      [@ocaml.doc "The type of participant (inviter or invitee) in the connection invitation.\n"]
  other_participant_identifier : participant_identifier;
      [@ocaml.doc "The identifier of the organization or partner being invited.\n"]
  expires_at : date_time option;
      [@ocaml.doc "The timestamp when the connection invitation will expire if not responded to.\n"]
  updated_at : date_time;
      [@ocaml.doc "The timestamp when the connection invitation was last updated.\n"]
  created_at : date_time; [@ocaml.doc "The timestamp when the connection invitation was created.\n"]
  connection_type : connection_type;
      [@ocaml.doc "The type of connection being requested in the invitation.\n"]
  connection_id : connection_id option;
      [@ocaml.doc "The identifier of the connection associated with this invitation.\n"]
  arn : connection_invitation_arn;
      [@ocaml.doc "The Amazon Resource Name (ARN) of the created connection invitation.\n"]
  id : connection_invitation_id;
      [@ocaml.doc "The unique identifier of the created connection invitation.\n"]
  catalog : catalog;
      [@ocaml.doc "The catalog identifier where the connection invitation was created.\n"]
}
[@@ocaml.doc ""]

type nonrec create_connection_invitation_request = {
  receiver_identifier : participant_identifier;
      [@ocaml.doc "The identifier of the organization or partner to invite for connection.\n"]
  name : sensitive_unicode_string;
      [@ocaml.doc "The name of the person sending the connection invitation.\n"]
  message : unicode_string_including_new_line;
      [@ocaml.doc "A custom message to include with the connection invitation.\n"]
  email : email;
      [@ocaml.doc "The email address of the person to send the connection invitation to.\n"]
  connection_type : connection_type;
      [@ocaml.doc
        "The type of connection being requested (e.g., reseller, distributor, technology partner).\n"]
  client_token : client_token;
      [@ocaml.doc
        "A unique, case-sensitive identifier that you provide to ensure the idempotency of the \
         request.\n"]
  catalog : catalog;
      [@ocaml.doc "The catalog identifier where the connection invitation will be created.\n"]
}
[@@ocaml.doc ""]

type nonrec connection_resource = Smaws_Lib.CoreTypes.Resource.t [@@ocaml.doc ""]

type nonrec connection_preferences = Smaws_Lib.CoreTypes.Resource.t [@@ocaml.doc ""]

type nonrec connection_invitation = Smaws_Lib.CoreTypes.Resource.t [@@ocaml.doc ""]

type nonrec connection = {
  connection_types : connection_type_detail_map; [@ocaml.doc "The type of connection.\n"]
  updated_at : date_time; [@ocaml.doc "The timestamp when the connection was last updated.\n"]
  other_participant_account_id : aws_account_id;
      [@ocaml.doc "The AWS account ID of the other participant in the connection.\n"]
  arn : connection_arn; [@ocaml.doc "The AWS Resource Name (ARN) of the connection.\n"]
  id : connection_id; [@ocaml.doc "The unique identifier of the connection.\n"]
  catalog : catalog; [@ocaml.doc "The catalog identifier that the connection belongs to.\n"]
}
[@@ocaml.doc "Base structure containing common connection properties.\n"]

type nonrec cancel_profile_update_task_response = {
  error_detail_list : error_detail_list option;
      [@ocaml.doc
        "A list of error details if any errors occurred during the profile update task.\n"]
  ended_at : date_time option;
      [@ocaml.doc "The timestamp when the profile update task was ended (canceled).\n"]
  status : profile_task_status;
      [@ocaml.doc "The current status of the profile update task (canceled).\n"]
  started_at : date_time; [@ocaml.doc "The timestamp when the profile update task was started.\n"]
  task_details : task_details;
      [@ocaml.doc "The details of the profile update task that was canceled.\n"]
  task_id : profile_task_id;
      [@ocaml.doc "The unique identifier of the canceled profile update task.\n"]
  id : partner_id; [@ocaml.doc "The unique identifier of the partner account.\n"]
  arn : partner_arn;
      [@ocaml.doc "The Amazon Resource Name (ARN) of the canceled profile update task.\n"]
  catalog : catalog; [@ocaml.doc "The catalog identifier for the partner account.\n"]
}
[@@ocaml.doc ""]

type nonrec cancel_profile_update_task_request = {
  task_id : profile_task_id;
      [@ocaml.doc "The unique identifier of the profile update task to cancel.\n"]
  client_token : client_token option;
      [@ocaml.doc
        "A unique, case-sensitive identifier that you provide to ensure the idempotency of the \
         request.\n"]
  identifier : partner_identifier; [@ocaml.doc "The unique identifier of the partner account.\n"]
  catalog : catalog; [@ocaml.doc "The catalog identifier for the partner account.\n"]
}
[@@ocaml.doc ""]

type nonrec cancel_connection_response = {
  connection_types : connection_type_detail_map;
      [@ocaml.doc "The list of connection types that were active before cancellation.\n"]
  updated_at : date_time;
      [@ocaml.doc "The timestamp when the connection was last updated (canceled).\n"]
  other_participant_account_id : aws_account_id;
      [@ocaml.doc "The AWS account ID of the other participant in the canceled connection.\n"]
  arn : connection_arn; [@ocaml.doc "The Amazon Resource Name (ARN) of the canceled connection.\n"]
  id : connection_id; [@ocaml.doc "The unique identifier of the canceled connection.\n"]
  catalog : catalog; [@ocaml.doc "The catalog identifier where the connection was canceled.\n"]
}
[@@ocaml.doc ""]

type nonrec cancel_connection_request = {
  client_token : client_token;
      [@ocaml.doc
        "A unique, case-sensitive identifier that you provide to ensure the idempotency of the \
         request.\n"]
  reason : Smaws_Lib.Smithy_api.Types.string_;
      [@ocaml.doc
        "The reason for canceling the connection, providing context for the termination.\n"]
  connection_type : connection_type;
      [@ocaml.doc
        "The type of connection to cancel (e.g., reseller, distributor, technology partner).\n"]
  identifier : connection_id; [@ocaml.doc "The unique identifier of the connection to cancel.\n"]
  catalog : catalog; [@ocaml.doc "The catalog identifier where the connection exists.\n"]
}
[@@ocaml.doc ""]

type nonrec cancel_connection_invitation_response = {
  inviter_name : sensitive_unicode_string;
      [@ocaml.doc "The name of the person who sent the connection invitation.\n"]
  inviter_email : email;
      [@ocaml.doc "The email address of the person who sent the connection invitation.\n"]
  invitation_message : unicode_string_including_new_line;
      [@ocaml.doc "The message that was included with the original connection invitation.\n"]
  status : invitation_status;
      [@ocaml.doc "The current status of the connection invitation (canceled).\n"]
  participant_type : participant_type;
      [@ocaml.doc "The type of participant (inviter or invitee) in the connection invitation.\n"]
  other_participant_identifier : participant_identifier;
      [@ocaml.doc "The identifier of the other participant who was invited to connect.\n"]
  expires_at : date_time option;
      [@ocaml.doc
        "The timestamp when the connection invitation would have expired if not canceled.\n"]
  updated_at : date_time;
      [@ocaml.doc "The timestamp when the connection invitation was last updated (canceled).\n"]
  created_at : date_time;
      [@ocaml.doc "The timestamp when the connection invitation was originally created.\n"]
  connection_type : connection_type;
      [@ocaml.doc "The type of connection that was being invited for.\n"]
  connection_id : connection_id option;
      [@ocaml.doc "The identifier of the connection associated with the canceled invitation.\n"]
  arn : connection_invitation_arn;
      [@ocaml.doc "The Amazon Resource Name (ARN) of the canceled connection invitation.\n"]
  id : connection_invitation_id;
      [@ocaml.doc "The unique identifier of the canceled connection invitation.\n"]
  catalog : catalog;
      [@ocaml.doc "The catalog identifier where the connection invitation was canceled.\n"]
}
[@@ocaml.doc ""]

type nonrec cancel_connection_invitation_request = {
  client_token : client_token;
      [@ocaml.doc
        "A unique, case-sensitive identifier that you provide to ensure the idempotency of the \
         request.\n"]
  identifier : connection_invitation_id;
      [@ocaml.doc "The unique identifier of the connection invitation to cancel.\n"]
  catalog : catalog; [@ocaml.doc "The catalog identifier where the connection invitation exists.\n"]
}
[@@ocaml.doc ""]

type nonrec associate_aws_training_certification_email_domain_response = unit [@@ocaml.doc ""]

type nonrec associate_aws_training_certification_email_domain_request = {
  email_verification_code : email_verification_code;
      [@ocaml.doc "The verification code sent to the email address to confirm domain ownership.\n"]
  email : email;
      [@ocaml.doc
        "The email address used to verify domain ownership for AWS training and certification \
         association.\n"]
  client_token : client_token option;
      [@ocaml.doc
        "A unique, case-sensitive identifier that you provide to ensure the idempotency of the \
         request.\n"]
  identifier : partner_identifier; [@ocaml.doc "The unique identifier of the partner account.\n"]
  catalog : catalog; [@ocaml.doc "The catalog identifier for the partner account.\n"]
}
[@@ocaml.doc ""]

type nonrec accept_connection_invitation_response = {
  connection : connection;
      [@ocaml.doc "The details of the accepted connection between the two partners.\n"]
}
[@@ocaml.doc ""]

type nonrec accept_connection_invitation_request = {
  client_token : client_token;
      [@ocaml.doc
        "A unique, case-sensitive identifier that you provide to ensure the idempotency of the \
         request.\n"]
  identifier : connection_invitation_id;
      [@ocaml.doc "The unique identifier of the connection invitation to accept.\n"]
  catalog : catalog; [@ocaml.doc "The catalog identifier where the connection invitation exists.\n"]
}
[@@ocaml.doc ""]
