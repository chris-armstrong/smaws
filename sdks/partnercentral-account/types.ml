type nonrec business_validation_code =
  | INCOMPATIBLE_CONNECTION_INVITATION_REQUEST [@ocaml.doc ""]
  | INCOMPATIBLE_LEGAL_NAME [@ocaml.doc ""]
  | INCOMPATIBLE_KNOW_YOUR_BUSINESS_STATUS [@ocaml.doc ""]
  | INCOMPATIBLE_IDENTITY_VERIFICATION_STATUS [@ocaml.doc ""]
  | INVALID_ACCOUNT_LINKING_STATUS [@ocaml.doc ""]
  | INVALID_ACCOUNT_STATE [@ocaml.doc ""]
  | INCOMPATIBLE_DOMAIN [@ocaml.doc ""]
  | INELIGIBLE_ACCOUNT_TIER [@ocaml.doc ""]
[@@ocaml.doc ""]

type nonrec business_validation_error = {
  message : Smaws_Lib.Smithy_api.Types.string_;
      [@ocaml.doc "A description of the business validation error.\n"]
  code : business_validation_code;
      [@ocaml.doc "A code identifying the specific business validation error.\n"]
}
[@@ocaml.doc
  "Contains information about a business rule validation error that occurred during an operation.\n"]

type nonrec field_validation_code =
  | REQUIRED_FIELD_MISSING [@ocaml.doc ""]
  | DUPLICATE_VALUE [@ocaml.doc ""]
  | INVALID_VALUE [@ocaml.doc ""]
  | INVALID_STRING_FORMAT [@ocaml.doc ""]
  | TOO_MANY_VALUES [@ocaml.doc ""]
  | ACTION_NOT_PERMITTED [@ocaml.doc ""]
  | INVALID_ENUM_VALUE [@ocaml.doc ""]
[@@ocaml.doc ""]

type nonrec field_validation_error = {
  name : Smaws_Lib.Smithy_api.Types.string_;
      [@ocaml.doc "The name of the field that failed validation.\n"]
  message : Smaws_Lib.Smithy_api.Types.string_;
      [@ocaml.doc "A description of the field validation error.\n"]
  code : field_validation_code;
      [@ocaml.doc "A code identifying the specific field validation error.\n"]
}
[@@ocaml.doc
  "Contains information about a field-level validation error that occurred during an operation.\n"]

type nonrec validation_error =
  | FieldValidationError of field_validation_error
      [@ocaml.doc "Details about a field-level validation error, if applicable.\n"]
  | BusinessValidationError of business_validation_error
      [@ocaml.doc "Details about a business rule validation error, if applicable.\n"]
[@@ocaml.doc
  "Contains information about a validation error, which can be either a field-level or business \
   rule validation error.\n"]

type nonrec validation_error_list = validation_error list [@@ocaml.doc ""]

type nonrec validation_exception_reason =
  | REQUEST_VALIDATION_FAILED [@ocaml.doc ""]
  | BUSINESS_VALIDATION_FAILED [@ocaml.doc ""]
[@@ocaml.doc ""]

type nonrec validation_exception = {
  message : Smaws_Lib.Smithy_api.Types.string_; [@ocaml.doc ""]
  reason : validation_exception_reason; [@ocaml.doc "The reason for the validation failure.\n"]
  error_details : validation_error_list option;
      [@ocaml.doc "A list of detailed validation errors that occurred during request processing.\n"]
}
[@@ocaml.doc
  "The request failed validation. One or more input parameters are invalid, missing, or do not \
   meet the required format or constraints.\n"]

type nonrec throttling_exception = {
  message : Smaws_Lib.Smithy_api.Types.string_; [@ocaml.doc ""]
  service_code : Smaws_Lib.Smithy_api.Types.string_ option;
      [@ocaml.doc "The service code associated with the throttling error.\n"]
  quota_code : Smaws_Lib.Smithy_api.Types.string_ option;
      [@ocaml.doc "The quota code associated with the throttling error.\n"]
}
[@@ocaml.doc
  "The request was throttled due to too many requests being sent in a short period of time. The \
   client should implement exponential backoff and retry the request.\n"]

type nonrec service_quota_exceeded_exception_reason =
  | LIMIT_EXCEEDED_NUMBER_OF_EMAIL [@ocaml.doc ""]
  | LIMIT_EXCEEDED_NUMBER_OF_DOMAIN [@ocaml.doc ""]
  | LIMIT_EXCEEDED_NUMBER_OF_CONNECTION_INVITATION_PER_DAY [@ocaml.doc ""]
  | LIMIT_EXCEEDED_NUMBER_OF_ACTIVE_CONNECTION [@ocaml.doc ""]
  | LIMIT_EXCEEDED_NUMBER_OF_OPEN_CONNECTION_INVITATION [@ocaml.doc ""]
  | LIMIT_EXCEEDED_NUMBER_OF_PROFILE_UPDATE_PER_DAY [@ocaml.doc ""]
  | LIMIT_EXCEEDED_NUMBER_OF_PROFILE_VISIBILITY_UPDATE_PER_DAY [@ocaml.doc ""]
[@@ocaml.doc ""]

type nonrec service_quota_exceeded_exception = {
  message : Smaws_Lib.Smithy_api.Types.string_; [@ocaml.doc ""]
  reason : service_quota_exceeded_exception_reason;
      [@ocaml.doc "The specific reason for the service quota being exceeded.\n"]
}
[@@ocaml.doc
  "The request was rejected because it would exceed a service quota or limit. This may occur when \
   trying to create more resources than allowed by the service limits.\n"]

type nonrec resource_not_found_exception_reason =
  | PARTNER_NOT_FOUND [@ocaml.doc ""]
  | PARTNER_PROFILE_NOT_FOUND [@ocaml.doc ""]
  | PARTNER_PROFILE_TASK_NOT_FOUND [@ocaml.doc ""]
  | PARTNER_DOMAIN_NOT_FOUND [@ocaml.doc ""]
  | SENDER_PROFILE_NOT_FOUND [@ocaml.doc ""]
  | RECEIVER_PROFILE_NOT_FOUND [@ocaml.doc ""]
  | CONNECTION_INVITATION_NOT_FOUND [@ocaml.doc ""]
  | CONNECTION_NOT_FOUND [@ocaml.doc ""]
  | VERIFICATION_NOT_FOUND [@ocaml.doc ""]
[@@ocaml.doc ""]

type nonrec resource_not_found_exception = {
  message : Smaws_Lib.Smithy_api.Types.string_; [@ocaml.doc ""]
  reason : resource_not_found_exception_reason;
      [@ocaml.doc "The specific reason why the resource was not found.\n"]
}
[@@ocaml.doc
  "The specified resource could not be found. This may occur when referencing a resource that does \
   not exist or has been deleted.\n"]

type nonrec internal_server_exception = {
  message : Smaws_Lib.Smithy_api.Types.string_; [@ocaml.doc ""]
}
[@@ocaml.doc
  "An internal server error occurred while processing the request. This is typically a temporary \
   condition and the request may be retried.\n"]

type nonrec conflict_exception_reason =
  | CONFLICT_CLIENT_TOKEN [@ocaml.doc ""]
  | DUPLICATE_PARTNER [@ocaml.doc ""]
  | INCOMPATIBLE_PROFILE_STATE [@ocaml.doc ""]
  | INCOMPATIBLE_PARTNER_PROFILE_TASK_STATE [@ocaml.doc ""]
  | DUPLICATE_CONNECTION_INVITATION [@ocaml.doc ""]
  | INCOMPATIBLE_CONNECTION_INVITATION_STATE [@ocaml.doc ""]
  | INCOMPATIBLE_CONNECTION_INVITATION_RECEIVER [@ocaml.doc ""]
  | DUPLICATE_CONNECTION [@ocaml.doc ""]
  | INCOMPATIBLE_CONNECTION_STATE [@ocaml.doc ""]
  | INCOMPATIBLE_CONNECTION_PREFERENCES_REVISION [@ocaml.doc ""]
  | ACCOUNT_ALREADY_VERIFIED [@ocaml.doc ""]
  | VERIFICATION_ALREADY_IN_PROGRESS [@ocaml.doc ""]
[@@ocaml.doc ""]

type nonrec conflict_exception = {
  message : Smaws_Lib.Smithy_api.Types.string_; [@ocaml.doc ""]
  reason : conflict_exception_reason; [@ocaml.doc "The specific reason for the conflict.\n"]
}
[@@ocaml.doc
  "The request could not be completed due to a conflict with the current state of the resource. \
   This typically occurs when trying to create a resource that already exists or modify a resource \
   that has been changed by another process.\n"]

type nonrec access_denied_exception_reason =
  | ACCESS_DENIED [@ocaml.doc ""]
  | INCOMPATIBLE_BENEFIT_AWS_PARTNER_STATE [@ocaml.doc ""]
[@@ocaml.doc ""]

type nonrec access_denied_exception = {
  message : Smaws_Lib.Smithy_api.Types.string_; [@ocaml.doc ""]
  reason : access_denied_exception_reason;
      [@ocaml.doc "The specific reason for the access denial.\n"]
}
[@@ocaml.doc
  "The request was denied due to insufficient permissions. The caller does not have the required \
   permissions to perform this operation.\n"]

type nonrec unicode_string = string [@@ocaml.doc ""]

type nonrec account_summary = {
  name : unicode_string; [@ocaml.doc "The name associated with the AWS account.\n"]
}
[@@ocaml.doc "Summary information about an AWS account.\n"]

type nonrec seller_profile_id = string [@@ocaml.doc ""]

type nonrec seller_profile_summary = {
  id : seller_profile_id; [@ocaml.doc "The unique identifier of the seller profile.\n"]
  name : unicode_string; [@ocaml.doc "The display name of the seller.\n"]
}
[@@ocaml.doc "A summary view of a seller profile containing basic identifying information.\n"]

type nonrec partner_profile_id = string [@@ocaml.doc ""]

type nonrec partner_profile_summary = {
  id : partner_profile_id; [@ocaml.doc "The unique identifier of the partner profile.\n"]
  name : unicode_string; [@ocaml.doc "The display name of the partner.\n"]
}
[@@ocaml.doc "A summary view of a partner profile containing basic identifying information.\n"]

type nonrec participant =
  | PartnerProfile of partner_profile_summary
      [@ocaml.doc "The partner profile information for the participant.\n"]
  | SellerProfile of seller_profile_summary
      [@ocaml.doc "The seller profile information for the participant.\n"]
  | Account of account_summary [@ocaml.doc "The AWS account information for the participant.\n"]
[@@ocaml.doc
  "Represents a participant in a partner connection, containing their profile and account \
   information.\n"]

type nonrec aws_account_id = string [@@ocaml.doc ""]

type nonrec date_time = Smaws_Lib.CoreTypes.Timestamp.t [@@ocaml.doc ""]

type nonrec connection_type_status = ACTIVE [@ocaml.doc ""] | CANCELED [@ocaml.doc ""]
[@@ocaml.doc ""]

type nonrec sensitive_unicode_string = string [@@ocaml.doc ""]

type nonrec email = string [@@ocaml.doc ""]

type nonrec connection_type_detail = {
  created_at : date_time; [@ocaml.doc "The timestamp when this connection type was created.\n"]
  inviter_email : email;
      [@ocaml.doc "The email address of the person who initiated this connection type.\n"]
  inviter_name : sensitive_unicode_string;
      [@ocaml.doc "The name of the person who initiated this connection type.\n"]
  status : connection_type_status; [@ocaml.doc "The current status of this connection type.\n"]
  canceled_at : date_time option;
      [@ocaml.doc "The timestamp when this connection type was cancelled, if applicable.\n"]
  canceled_by : aws_account_id option;
      [@ocaml.doc "The AWS account ID of the participant who cancelled this connection type.\n"]
  other_participant : participant;
      [@ocaml.doc "Information about the other participant in this connection type.\n"]
}
[@@ocaml.doc "Detailed information about a specific connection type within a connection.\n"]

type nonrec connection_type =
  | OPPORTUNITY_COLLABORATION [@ocaml.doc ""]
  | SUBSIDIARY [@ocaml.doc ""]
[@@ocaml.doc ""]

type nonrec connection_type_detail_map = (connection_type * connection_type_detail) list
[@@ocaml.doc ""]

type nonrec connection_arn = string [@@ocaml.doc ""]

type nonrec connection_id = string [@@ocaml.doc ""]

type nonrec catalog = string [@@ocaml.doc ""]

type nonrec connection = {
  catalog : catalog; [@ocaml.doc "The catalog identifier that the connection belongs to.\n"]
  id : connection_id; [@ocaml.doc "The unique identifier of the connection.\n"]
  arn : connection_arn; [@ocaml.doc "The AWS Resource Name (ARN) of the connection.\n"]
  other_participant_account_id : aws_account_id;
      [@ocaml.doc "The AWS account ID of the other participant in the connection.\n"]
  updated_at : date_time; [@ocaml.doc "The timestamp when the connection was last updated.\n"]
  connection_types : connection_type_detail_map; [@ocaml.doc "The type of connection.\n"]
}
[@@ocaml.doc "Base structure containing common connection properties.\n"]

type nonrec accept_connection_invitation_response = {
  connection : connection;
      [@ocaml.doc "The details of the accepted connection between the two partners.\n"]
}
[@@ocaml.doc ""]

type nonrec client_token = string [@@ocaml.doc ""]

type nonrec connection_invitation_id = string [@@ocaml.doc ""]

type nonrec accept_connection_invitation_request = {
  catalog : catalog; [@ocaml.doc "The catalog identifier where the connection invitation exists.\n"]
  identifier : connection_invitation_id;
      [@ocaml.doc "The unique identifier of the connection invitation to accept.\n"]
  client_token : client_token;
      [@ocaml.doc
        "A unique, case-sensitive identifier that you provide to ensure the idempotency of the \
         request.\n"]
}
[@@ocaml.doc ""]

type nonrec access_type =
  | ALLOW_ALL [@ocaml.doc ""]
  | DENY_ALL [@ocaml.doc ""]
  | ALLOW_BY_DEFAULT_DENY_SOME [@ocaml.doc ""]
[@@ocaml.doc ""]

type nonrec alliance_lead_contact = {
  first_name : sensitive_unicode_string;
      [@ocaml.doc "The first name of the alliance lead contact person.\n"]
  last_name : sensitive_unicode_string;
      [@ocaml.doc "The last name of the alliance lead contact person.\n"]
  email : email; [@ocaml.doc "The email address of the alliance lead contact person.\n"]
  business_title : sensitive_unicode_string;
      [@ocaml.doc "The business title or role of the alliance lead contact person.\n"]
}
[@@ocaml.doc
  "Contains contact information for the primary alliance lead responsible for partnership \
   activities.\n"]

type nonrec associate_aws_training_certification_email_domain_response = unit [@@ocaml.doc ""]

type nonrec email_verification_code = string [@@ocaml.doc ""]

type nonrec partner_identifier = string [@@ocaml.doc ""]

type nonrec associate_aws_training_certification_email_domain_request = {
  catalog : catalog; [@ocaml.doc "The catalog identifier for the partner account.\n"]
  identifier : partner_identifier; [@ocaml.doc "The unique identifier of the partner account.\n"]
  client_token : client_token option;
      [@ocaml.doc
        "A unique, case-sensitive identifier that you provide to ensure the idempotency of the \
         request.\n"]
  email : email;
      [@ocaml.doc
        "The email address used to verify domain ownership for AWS training and certification \
         association.\n"]
  email_verification_code : email_verification_code;
      [@ocaml.doc "The verification code sent to the email address to confirm domain ownership.\n"]
}
[@@ocaml.doc ""]

type nonrec jurisdiction_code = string [@@ocaml.doc ""]

type nonrec country_code = string [@@ocaml.doc ""]

type nonrec registration_id = string [@@ocaml.doc ""]

type nonrec legal_name = string [@@ocaml.doc ""]

type nonrec business_verification_details = {
  legal_name : legal_name;
      [@ocaml.doc
        "The official legal name of the business as registered with the appropriate government \
         authorities.\n"]
  registration_id : registration_id;
      [@ocaml.doc
        "The unique business registration identifier assigned by the government or regulatory \
         authority, such as a company registration number or tax identification number.\n"]
  country_code : country_code;
      [@ocaml.doc
        "The ISO 3166-1 alpha-2 country code where the business is legally registered and operates.\n"]
  jurisdiction_of_incorporation : jurisdiction_code option;
      [@ocaml.doc
        "The specific legal jurisdiction or state where the business was incorporated or \
         registered, providing additional location context beyond the country code.\n"]
}
[@@ocaml.doc
  "Contains the business information required for verifying a company's legal status and \
   registration details within AWS Partner Central.\n"]

type nonrec completion_url = string [@@ocaml.doc ""]

type nonrec business_verification_response = {
  business_verification_details : business_verification_details;
      [@ocaml.doc
        "The business verification details that were processed and verified, potentially including \
         additional information discovered during the verification process.\n"]
  completion_url : completion_url option;
      [@ocaml.doc
        "A secure URL where the registrant can complete additional verification steps, such as \
         document upload or identity confirmation through a third-party verification service.\n"]
  completion_url_expires_at : date_time option;
      [@ocaml.doc
        "The timestamp when the completion URL expires and is no longer valid for accessing the \
         verification workflow.\n"]
}
[@@ocaml.doc
  "Contains the response information and results from a business verification process, including \
   any verification-specific data returned by the verification service.\n"]

type nonrec cancel_connection_response = {
  catalog : catalog; [@ocaml.doc "The catalog identifier where the connection was canceled.\n"]
  id : connection_id; [@ocaml.doc "The unique identifier of the canceled connection.\n"]
  arn : connection_arn; [@ocaml.doc "The Amazon Resource Name (ARN) of the canceled connection.\n"]
  other_participant_account_id : aws_account_id;
      [@ocaml.doc "The AWS account ID of the other participant in the canceled connection.\n"]
  updated_at : date_time;
      [@ocaml.doc "The timestamp when the connection was last updated (canceled).\n"]
  connection_types : connection_type_detail_map;
      [@ocaml.doc "The list of connection types that were active before cancellation.\n"]
}
[@@ocaml.doc ""]

type nonrec cancel_connection_request = {
  catalog : catalog; [@ocaml.doc "The catalog identifier where the connection exists.\n"]
  identifier : connection_id; [@ocaml.doc "The unique identifier of the connection to cancel.\n"]
  connection_type : connection_type;
      [@ocaml.doc
        "The type of connection to cancel (e.g., reseller, distributor, technology partner).\n"]
  reason : Smaws_Lib.Smithy_api.Types.string_;
      [@ocaml.doc
        "The reason for canceling the connection, providing context for the termination.\n"]
  client_token : client_token;
      [@ocaml.doc
        "A unique, case-sensitive identifier that you provide to ensure the idempotency of the \
         request.\n"]
}
[@@ocaml.doc ""]

type nonrec unicode_string_including_new_line = string [@@ocaml.doc ""]

type nonrec invitation_status =
  | PENDING [@ocaml.doc ""]
  | ACCEPTED [@ocaml.doc ""]
  | REJECTED [@ocaml.doc ""]
  | CANCELED [@ocaml.doc ""]
  | EXPIRED [@ocaml.doc ""]
[@@ocaml.doc ""]

type nonrec participant_type = SENDER [@ocaml.doc ""] | RECEIVER [@ocaml.doc ""] [@@ocaml.doc ""]

type nonrec participant_identifier = string [@@ocaml.doc ""]

type nonrec connection_invitation_arn = string [@@ocaml.doc ""]

type nonrec cancel_connection_invitation_response = {
  catalog : catalog;
      [@ocaml.doc "The catalog identifier where the connection invitation was canceled.\n"]
  id : connection_invitation_id;
      [@ocaml.doc "The unique identifier of the canceled connection invitation.\n"]
  arn : connection_invitation_arn;
      [@ocaml.doc "The Amazon Resource Name (ARN) of the canceled connection invitation.\n"]
  connection_id : connection_id option;
      [@ocaml.doc "The identifier of the connection associated with the canceled invitation.\n"]
  connection_type : connection_type;
      [@ocaml.doc "The type of connection that was being invited for.\n"]
  created_at : date_time;
      [@ocaml.doc "The timestamp when the connection invitation was originally created.\n"]
  updated_at : date_time;
      [@ocaml.doc "The timestamp when the connection invitation was last updated (canceled).\n"]
  expires_at : date_time option;
      [@ocaml.doc
        "The timestamp when the connection invitation would have expired if not canceled.\n"]
  other_participant_identifier : participant_identifier;
      [@ocaml.doc "The identifier of the other participant who was invited to connect.\n"]
  participant_type : participant_type;
      [@ocaml.doc "The type of participant (inviter or invitee) in the connection invitation.\n"]
  status : invitation_status;
      [@ocaml.doc "The current status of the connection invitation (canceled).\n"]
  invitation_message : unicode_string_including_new_line;
      [@ocaml.doc "The message that was included with the original connection invitation.\n"]
  inviter_email : email;
      [@ocaml.doc "The email address of the person who sent the connection invitation.\n"]
  inviter_name : sensitive_unicode_string;
      [@ocaml.doc "The name of the person who sent the connection invitation.\n"]
}
[@@ocaml.doc ""]

type nonrec cancel_connection_invitation_request = {
  catalog : catalog; [@ocaml.doc "The catalog identifier where the connection invitation exists.\n"]
  identifier : connection_invitation_id;
      [@ocaml.doc "The unique identifier of the connection invitation to cancel.\n"]
  client_token : client_token;
      [@ocaml.doc
        "A unique, case-sensitive identifier that you provide to ensure the idempotency of the \
         request.\n"]
}
[@@ocaml.doc ""]

type nonrec profile_validation_error_reason =
  | INVALID_CONTENT [@ocaml.doc ""]
  | DUPLICATE_PROFILE [@ocaml.doc ""]
  | INVALID_LOGO [@ocaml.doc ""]
  | INVALID_LOGO_URL [@ocaml.doc ""]
  | INVALID_LOGO_FILE [@ocaml.doc ""]
  | INVALID_LOGO_SIZE [@ocaml.doc ""]
  | INVALID_WEBSITE_URL [@ocaml.doc ""]
[@@ocaml.doc ""]

type nonrec error_detail = {
  locale : Smaws_Lib.Smithy_api.Types.string_;
      [@ocaml.doc "The locale or language code for the error message.\n"]
  message : Smaws_Lib.Smithy_api.Types.string_;
      [@ocaml.doc "A human-readable description of the error.\n"]
  reason : profile_validation_error_reason;
      [@ocaml.doc "A machine-readable code or reason for the error.\n"]
}
[@@ocaml.doc "Contains detailed information about an error that occurred during an operation.\n"]

type nonrec error_detail_list = error_detail list [@@ocaml.doc ""]

type nonrec profile_task_status =
  | IN_PROGRESS [@ocaml.doc ""]
  | CANCELED [@ocaml.doc ""]
  | SUCCEEDED [@ocaml.doc ""]
  | FAILED [@ocaml.doc ""]
[@@ocaml.doc ""]

type nonrec locale = string [@@ocaml.doc ""]

type nonrec url = string [@@ocaml.doc ""]

type nonrec localized_content = {
  display_name : unicode_string; [@ocaml.doc "The localized display name for the partner.\n"]
  description : unicode_string;
      [@ocaml.doc "The localized description of the partner's business and services.\n"]
  website_url : url; [@ocaml.doc "The localized website URL for the partner.\n"]
  logo_url : url; [@ocaml.doc "The URL to the partner's logo image for this locale.\n"]
  locale : locale; [@ocaml.doc "The locale or language code for the localized content.\n"]
}
[@@ocaml.doc "Contains localized content for a partner profile in a specific language or locale.\n"]

type nonrec localized_content_list = localized_content list [@@ocaml.doc ""]

type nonrec industry_segment =
  | AGRICULTURE_MINING [@ocaml.doc ""]
  | BIOTECHNOLOGY [@ocaml.doc ""]
  | BUSINESS_CONSUMER_SERVICES [@ocaml.doc ""]
  | BUSINESS_SERV [@ocaml.doc ""]
  | COMMUNICATIONS [@ocaml.doc ""]
  | COMPUTER_HARDWARE [@ocaml.doc ""]
  | COMPUTERS_ELECTRONICS [@ocaml.doc ""]
  | COMPUTER_SOFTWARE [@ocaml.doc ""]
  | CONSUMER_GOODS [@ocaml.doc ""]
  | CONSUMER_RELATED [@ocaml.doc ""]
  | EDUCATION [@ocaml.doc ""]
  | ENERGY_UTILITIES [@ocaml.doc ""]
  | FINANCIAL_SERVICES [@ocaml.doc ""]
  | GAMING [@ocaml.doc ""]
  | GOVERNMENT [@ocaml.doc ""]
  | GOVERNMENT_EDUCATION_PUBLIC_SERVICES [@ocaml.doc ""]
  | HEALTHCARE [@ocaml.doc ""]
  | HEALTHCARE_PHARMACEUTICALS_BIOTECH [@ocaml.doc ""]
  | INDUSTRIAL_ENERGY [@ocaml.doc ""]
  | INTERNET_SPECIFIC [@ocaml.doc ""]
  | LIFE_SCIENCES [@ocaml.doc ""]
  | MANUFACTURING [@ocaml.doc ""]
  | MEDIA_ENTERTAINMENT_LEISURE [@ocaml.doc ""]
  | MEDIA_ENTERTAINMENT [@ocaml.doc ""]
  | MEDICAL_HEALTH [@ocaml.doc ""]
  | NON_PROFIT_ORGANIZATION [@ocaml.doc ""]
  | OTHER [@ocaml.doc ""]
  | PROFESSIONAL_SERVICES [@ocaml.doc ""]
  | REAL_ESTATE_CONSTRUCTION [@ocaml.doc ""]
  | RETAIL [@ocaml.doc ""]
  | RETAIL_WHOLESALE_DISTRIBUTION [@ocaml.doc ""]
  | SEMICONDUCTOR_ELECTR [@ocaml.doc ""]
  | SOFTWARE_INTERNET [@ocaml.doc ""]
  | TELECOMMUNICATIONS [@ocaml.doc ""]
  | TRANSPORTATION_LOGISTICS [@ocaml.doc ""]
  | TRAVEL_HOSPITALITY [@ocaml.doc ""]
  | WHOLESALE_DISTRIBUTION [@ocaml.doc ""]
[@@ocaml.doc ""]

type nonrec industry_segment_list = industry_segment list [@@ocaml.doc ""]

type nonrec primary_solution_type =
  | SOFTWARE_PRODUCTS [@ocaml.doc ""]
  | CONSULTING_SERVICES [@ocaml.doc ""]
  | PROFESSIONAL_SERVICES [@ocaml.doc ""]
  | MANAGED_SERVICES [@ocaml.doc ""]
  | HARDWARE_PRODUCTS [@ocaml.doc ""]
  | COMMUNICATION_SERVICES [@ocaml.doc ""]
  | VALUE_ADDED_RESALE_AWS_SERVICES [@ocaml.doc ""]
  | TRAINING_SERVICES [@ocaml.doc ""]
[@@ocaml.doc ""]

type nonrec task_details = {
  display_name : unicode_string; [@ocaml.doc "The updated display name for the partner profile.\n"]
  description : unicode_string; [@ocaml.doc "The updated description for the partner profile.\n"]
  website_url : url; [@ocaml.doc "The updated website URL for the partner profile.\n"]
  logo_url : url; [@ocaml.doc "The updated logo URL for the partner profile.\n"]
  primary_solution_type : primary_solution_type;
      [@ocaml.doc "The updated primary solution type for the partner profile.\n"]
  industry_segments : industry_segment_list;
      [@ocaml.doc "The updated industry segments for the partner profile.\n"]
  translation_source_locale : locale;
      [@ocaml.doc "The updated translation source locale for the partner profile.\n"]
  localized_contents : localized_content_list option;
      [@ocaml.doc "The updated localized content for the partner profile.\n"]
}
[@@ocaml.doc
  "Contains detailed information about a profile update task including the changes to be made.\n"]

type nonrec profile_task_id = string [@@ocaml.doc ""]

type nonrec partner_id = string [@@ocaml.doc ""]

type nonrec partner_arn = string [@@ocaml.doc ""]

type nonrec cancel_profile_update_task_response = {
  catalog : catalog; [@ocaml.doc "The catalog identifier for the partner account.\n"]
  arn : partner_arn;
      [@ocaml.doc "The Amazon Resource Name (ARN) of the canceled profile update task.\n"]
  id : partner_id; [@ocaml.doc "The unique identifier of the partner account.\n"]
  task_id : profile_task_id;
      [@ocaml.doc "The unique identifier of the canceled profile update task.\n"]
  task_details : task_details;
      [@ocaml.doc "The details of the profile update task that was canceled.\n"]
  started_at : date_time; [@ocaml.doc "The timestamp when the profile update task was started.\n"]
  status : profile_task_status;
      [@ocaml.doc "The current status of the profile update task (canceled).\n"]
  ended_at : date_time option;
      [@ocaml.doc "The timestamp when the profile update task was ended (canceled).\n"]
  error_detail_list : error_detail_list option;
      [@ocaml.doc
        "A list of error details if any errors occurred during the profile update task.\n"]
}
[@@ocaml.doc ""]

type nonrec cancel_profile_update_task_request = {
  catalog : catalog; [@ocaml.doc "The catalog identifier for the partner account.\n"]
  identifier : partner_identifier; [@ocaml.doc "The unique identifier of the partner account.\n"]
  client_token : client_token option;
      [@ocaml.doc
        "A unique, case-sensitive identifier that you provide to ensure the idempotency of the \
         request.\n"]
  task_id : profile_task_id;
      [@ocaml.doc "The unique identifier of the profile update task to cancel.\n"]
}
[@@ocaml.doc ""]

type nonrec connection_invitation = Smaws_Lib.CoreTypes.Resource.t [@@ocaml.doc ""]

type nonrec connection_invitation_summary = {
  catalog : catalog; [@ocaml.doc "The catalog identifier where the connection invitation exists.\n"]
  id : connection_invitation_id;
      [@ocaml.doc "The unique identifier of the connection invitation.\n"]
  arn : connection_invitation_arn;
      [@ocaml.doc "The Amazon Resource Name (ARN) of the connection invitation.\n"]
  connection_id : connection_id option;
      [@ocaml.doc "The identifier of the connection associated with this invitation.\n"]
  connection_type : connection_type;
      [@ocaml.doc "The type of connection being requested in the invitation.\n"]
  created_at : date_time; [@ocaml.doc "The timestamp when the connection invitation was created.\n"]
  updated_at : date_time;
      [@ocaml.doc "The timestamp when the connection invitation was last updated.\n"]
  expires_at : date_time option;
      [@ocaml.doc "The timestamp when the connection invitation will expire.\n"]
  other_participant_identifier : participant_identifier;
      [@ocaml.doc "The identifier of the other participant in the connection invitation.\n"]
  participant_type : participant_type;
      [@ocaml.doc "The type of participant (inviter or invitee) in the connection invitation.\n"]
  status : invitation_status; [@ocaml.doc "The current status of the connection invitation.\n"]
}
[@@ocaml.doc
  "A summary view of a connection invitation containing key information without full details.\n"]

type nonrec connection_invitation_summary_list = connection_invitation_summary list [@@ocaml.doc ""]

type nonrec connection_preferences = Smaws_Lib.CoreTypes.Resource.t [@@ocaml.doc ""]

type nonrec connection_preferences_arn = string [@@ocaml.doc ""]

type nonrec connection_resource = Smaws_Lib.CoreTypes.Resource.t [@@ocaml.doc ""]

type nonrec connection_type_summary = {
  status : connection_type_status;
      [@ocaml.doc "The current status of this connection type (active, canceled, etc.).\n"]
  other_participant : participant;
      [@ocaml.doc "Information about the other participant in this connection type.\n"]
}
[@@ocaml.doc "Summary information about a specific connection type between partners.\n"]

type nonrec connection_type_summary_map = (connection_type * connection_type_summary) list
[@@ocaml.doc ""]

type nonrec connection_summary = {
  catalog : catalog; [@ocaml.doc "The catalog identifier where the connection exists.\n"]
  id : connection_id; [@ocaml.doc "The unique identifier of the connection.\n"]
  arn : connection_arn; [@ocaml.doc "The Amazon Resource Name (ARN) of the connection.\n"]
  other_participant_account_id : aws_account_id;
      [@ocaml.doc "The AWS account ID of the other participant in the connection.\n"]
  updated_at : date_time; [@ocaml.doc "The timestamp when the connection was last updated.\n"]
  connection_types : connection_type_summary_map;
      [@ocaml.doc "A map of connection types and their summary information for this connection.\n"]
}
[@@ocaml.doc
  "A summary view of an active connection between partners containing key information.\n"]

type nonrec connection_summary_list = connection_summary list [@@ocaml.doc ""]

type nonrec connection_type_filter = string [@@ocaml.doc ""]

type nonrec create_connection_invitation_response = {
  catalog : catalog;
      [@ocaml.doc "The catalog identifier where the connection invitation was created.\n"]
  id : connection_invitation_id;
      [@ocaml.doc "The unique identifier of the created connection invitation.\n"]
  arn : connection_invitation_arn;
      [@ocaml.doc "The Amazon Resource Name (ARN) of the created connection invitation.\n"]
  connection_id : connection_id option;
      [@ocaml.doc "The identifier of the connection associated with this invitation.\n"]
  connection_type : connection_type;
      [@ocaml.doc "The type of connection being requested in the invitation.\n"]
  created_at : date_time; [@ocaml.doc "The timestamp when the connection invitation was created.\n"]
  updated_at : date_time;
      [@ocaml.doc "The timestamp when the connection invitation was last updated.\n"]
  expires_at : date_time option;
      [@ocaml.doc "The timestamp when the connection invitation will expire if not responded to.\n"]
  other_participant_identifier : participant_identifier;
      [@ocaml.doc "The identifier of the organization or partner being invited.\n"]
  participant_type : participant_type;
      [@ocaml.doc "The type of participant (inviter or invitee) in the connection invitation.\n"]
  status : invitation_status;
      [@ocaml.doc
        "The current status of the connection invitation (pending, accepted, rejected, etc.).\n"]
  invitation_message : unicode_string_including_new_line;
      [@ocaml.doc "The custom message included with the connection invitation.\n"]
  inviter_email : email;
      [@ocaml.doc "The email address of the person who sent the connection invitation.\n"]
  inviter_name : sensitive_unicode_string;
      [@ocaml.doc "The name of the person who sent the connection invitation.\n"]
}
[@@ocaml.doc ""]

type nonrec create_connection_invitation_request = {
  catalog : catalog;
      [@ocaml.doc "The catalog identifier where the connection invitation will be created.\n"]
  client_token : client_token;
      [@ocaml.doc
        "A unique, case-sensitive identifier that you provide to ensure the idempotency of the \
         request.\n"]
  connection_type : connection_type;
      [@ocaml.doc
        "The type of connection being requested (e.g., reseller, distributor, technology partner).\n"]
  email : email;
      [@ocaml.doc "The email address of the person to send the connection invitation to.\n"]
  message : unicode_string_including_new_line;
      [@ocaml.doc "A custom message to include with the connection invitation.\n"]
  name : sensitive_unicode_string;
      [@ocaml.doc "The name of the person sending the connection invitation.\n"]
  receiver_identifier : participant_identifier;
      [@ocaml.doc "The identifier of the organization or partner to invite for connection.\n"]
}
[@@ocaml.doc ""]

type nonrec domain_name = string [@@ocaml.doc ""]

type nonrec partner_domain = {
  domain_name : domain_name;
      [@ocaml.doc "The domain name that has been verified for the partner account.\n"]
  registered_at : date_time;
      [@ocaml.doc
        "The timestamp when the domain was registered and verified for the partner account.\n"]
}
[@@ocaml.doc "Represents a verified domain associated with a partner account.\n"]

type nonrec partner_domain_list = partner_domain list [@@ocaml.doc ""]

type nonrec partner_profile = {
  display_name : unicode_string;
      [@ocaml.doc "The public display name for the partner organization.\n"]
  description : unicode_string;
      [@ocaml.doc "A description of the partner's business, services, and capabilities.\n"]
  website_url : url; [@ocaml.doc "The partner's primary website URL.\n"]
  logo_url : url; [@ocaml.doc "The URL to the partner's logo image.\n"]
  primary_solution_type : primary_solution_type;
      [@ocaml.doc "The primary type of solution or service the partner provides.\n"]
  industry_segments : industry_segment_list;
      [@ocaml.doc "The industry segments or verticals that the partner serves.\n"]
  translation_source_locale : locale;
      [@ocaml.doc "The source locale used for automatic translation of profile content.\n"]
  localized_contents : localized_content_list option;
      [@ocaml.doc "A list of localized content versions for different languages and regions.\n"]
  profile_id : partner_profile_id option;
      [@ocaml.doc "The unique identifier of the partner profile.\n"]
}
[@@ocaml.doc
  "Contains comprehensive profile information for a partner including public-facing details.\n"]

type nonrec create_partner_response = {
  catalog : catalog; [@ocaml.doc "The catalog identifier where the partner account was created.\n"]
  arn : partner_arn; [@ocaml.doc "The Amazon Resource Name (ARN) of the created partner account.\n"]
  id : partner_id; [@ocaml.doc "The unique identifier of the created partner account.\n"]
  legal_name : sensitive_unicode_string;
      [@ocaml.doc "The legal name of the partner organization.\n"]
  created_at : date_time; [@ocaml.doc "The timestamp when the partner account was created.\n"]
  profile : partner_profile;
      [@ocaml.doc
        "The partner profile information including display name, description, and other public \
         details.\n"]
  aws_training_certification_email_domains : partner_domain_list option;
      [@ocaml.doc
        "The list of verified email domains associated with AWS training and certification \
         credentials for the partner organization.\n"]
  alliance_lead_contact : alliance_lead_contact;
      [@ocaml.doc "The alliance lead contact information for the partner account.\n"]
}
[@@ocaml.doc ""]

type nonrec tag_value = string [@@ocaml.doc ""]

type nonrec tag_key = string [@@ocaml.doc ""]

type nonrec tag = {
  key : tag_key; [@ocaml.doc "The key name of the tag. Tag keys are case-sensitive.\n"]
  value : tag_value;
      [@ocaml.doc "The value associated with the tag key. Tag values are case-sensitive.\n"]
}
[@@ocaml.doc
  "A key-value pair used to associate metadata with AWS Partner Central Account resources.\n"]

type nonrec tag_list = tag list [@@ocaml.doc ""]

type nonrec create_partner_request = {
  catalog : catalog;
      [@ocaml.doc "The catalog identifier where the partner account will be created.\n"]
  client_token : client_token option;
      [@ocaml.doc
        "A unique, case-sensitive identifier that you provide to ensure the idempotency of the \
         request.\n"]
  legal_name : sensitive_unicode_string;
      [@ocaml.doc "The legal name of the organization becoming a partner.\n"]
  primary_solution_type : primary_solution_type;
      [@ocaml.doc
        "The primary type of solution or service the partner provides (e.g., consulting, software, \
         managed services).\n"]
  alliance_lead_contact : alliance_lead_contact;
      [@ocaml.doc "The primary contact person for alliance and partnership matters.\n"]
  email_verification_code : email_verification_code;
      [@ocaml.doc
        "The verification code sent to the alliance lead contact's email to confirm account \
         creation.\n"]
  tags : tag_list option;
      [@ocaml.doc
        "A list of tags to associate with the partner account for organization and billing purposes.\n"]
}
[@@ocaml.doc ""]

type nonrec disassociate_aws_training_certification_email_domain_response = unit [@@ocaml.doc ""]

type nonrec disassociate_aws_training_certification_email_domain_request = {
  catalog : catalog; [@ocaml.doc "The catalog identifier for the partner account.\n"]
  identifier : partner_identifier; [@ocaml.doc "The unique identifier of the partner account.\n"]
  client_token : client_token option;
      [@ocaml.doc
        "A unique, case-sensitive identifier that you provide to ensure the idempotency of the \
         request.\n"]
  domain_name : domain_name;
      [@ocaml.doc "The domain name to disassociate from AWS training and certification.\n"]
}
[@@ocaml.doc ""]

type nonrec get_alliance_lead_contact_response = {
  catalog : catalog; [@ocaml.doc "The catalog identifier for the partner account.\n"]
  arn : partner_arn; [@ocaml.doc "The Amazon Resource Name (ARN) of the partner account.\n"]
  id : partner_id; [@ocaml.doc "The unique identifier of the partner account.\n"]
  alliance_lead_contact : alliance_lead_contact;
      [@ocaml.doc
        "The alliance lead contact information including name, email, and business title.\n"]
}
[@@ocaml.doc ""]

type nonrec get_alliance_lead_contact_request = {
  catalog : catalog; [@ocaml.doc "The catalog identifier for the partner account.\n"]
  identifier : partner_identifier; [@ocaml.doc "The unique identifier of the partner account.\n"]
}
[@@ocaml.doc ""]

type nonrec get_connection_response = {
  catalog : catalog; [@ocaml.doc "The catalog identifier where the connection exists.\n"]
  id : connection_id; [@ocaml.doc "The unique identifier of the connection.\n"]
  arn : connection_arn; [@ocaml.doc "The Amazon Resource Name (ARN) of the connection.\n"]
  other_participant_account_id : aws_account_id;
      [@ocaml.doc "The AWS account ID of the other participant in the connection.\n"]
  updated_at : date_time; [@ocaml.doc "The timestamp when the connection was last updated.\n"]
  connection_types : connection_type_detail_map;
      [@ocaml.doc "The list of connection types active between the partners.\n"]
}
[@@ocaml.doc ""]

type nonrec get_connection_request = {
  catalog : catalog; [@ocaml.doc "The catalog identifier where the connection exists.\n"]
  identifier : connection_id; [@ocaml.doc "The unique identifier of the connection to retrieve.\n"]
}
[@@ocaml.doc ""]

type nonrec get_connection_invitation_response = {
  catalog : catalog; [@ocaml.doc "The catalog identifier where the connection invitation exists.\n"]
  id : connection_invitation_id;
      [@ocaml.doc "The unique identifier of the connection invitation.\n"]
  arn : connection_invitation_arn;
      [@ocaml.doc "The Amazon Resource Name (ARN) of the connection invitation.\n"]
  connection_id : connection_id option;
      [@ocaml.doc "The identifier of the connection associated with this invitation.\n"]
  connection_type : connection_type;
      [@ocaml.doc "The type of connection being requested in the invitation.\n"]
  created_at : date_time; [@ocaml.doc "The timestamp when the connection invitation was created.\n"]
  updated_at : date_time;
      [@ocaml.doc "The timestamp when the connection invitation was last updated.\n"]
  expires_at : date_time option;
      [@ocaml.doc "The timestamp when the connection invitation will expire.\n"]
  other_participant_identifier : participant_identifier;
      [@ocaml.doc "The identifier of the other participant in the connection invitation.\n"]
  participant_type : participant_type;
      [@ocaml.doc "The type of participant (inviter or invitee) in the connection invitation.\n"]
  status : invitation_status; [@ocaml.doc "The current status of the connection invitation.\n"]
  invitation_message : unicode_string_including_new_line;
      [@ocaml.doc "The custom message included with the connection invitation.\n"]
  inviter_email : email;
      [@ocaml.doc "The email address of the person who sent the connection invitation.\n"]
  inviter_name : sensitive_unicode_string;
      [@ocaml.doc "The name of the person who sent the connection invitation.\n"]
}
[@@ocaml.doc ""]

type nonrec get_connection_invitation_request = {
  catalog : catalog; [@ocaml.doc "The catalog identifier where the connection invitation exists.\n"]
  identifier : connection_invitation_id;
      [@ocaml.doc "The unique identifier of the connection invitation to retrieve.\n"]
}
[@@ocaml.doc ""]

type nonrec revision = Smaws_Lib.CoreTypes.Int64.t [@@ocaml.doc ""]

type nonrec participant_identifier_list = participant_identifier list [@@ocaml.doc ""]

type nonrec get_connection_preferences_response = {
  catalog : catalog; [@ocaml.doc "The catalog identifier for the partner account.\n"]
  arn : connection_preferences_arn;
      [@ocaml.doc "The Amazon Resource Name (ARN) of the connection preferences.\n"]
  access_type : access_type;
      [@ocaml.doc
        "The access type setting for connections (e.g., open, restricted, invitation-only).\n"]
  excluded_participant_ids : participant_identifier_list option;
      [@ocaml.doc
        "A list of participant IDs that are excluded from connection requests or interactions.\n"]
  updated_at : date_time;
      [@ocaml.doc "The timestamp when the connection preferences were last updated.\n"]
  revision : revision;
      [@ocaml.doc "The revision number of the connection preferences for optimistic locking.\n"]
}
[@@ocaml.doc ""]

type nonrec get_connection_preferences_request = {
  catalog : catalog; [@ocaml.doc "The catalog identifier for the partner account.\n"]
}
[@@ocaml.doc ""]

type nonrec get_partner_response = {
  catalog : catalog; [@ocaml.doc "The catalog identifier for the partner account.\n"]
  arn : partner_arn; [@ocaml.doc "The Amazon Resource Name (ARN) of the partner account.\n"]
  id : partner_id; [@ocaml.doc "The unique identifier of the partner account.\n"]
  legal_name : sensitive_unicode_string;
      [@ocaml.doc "The legal name of the partner organization.\n"]
  created_at : date_time; [@ocaml.doc "The timestamp when the partner account was created.\n"]
  profile : partner_profile;
      [@ocaml.doc
        "The partner profile information including display name, description, and other public \
         details.\n"]
  aws_training_certification_email_domains : partner_domain_list option;
      [@ocaml.doc
        "The list of verified email domains associated with AWS training and certification \
         credentials for the partner organization.\n"]
}
[@@ocaml.doc ""]

type nonrec get_partner_request = {
  catalog : catalog; [@ocaml.doc "The catalog identifier for the partner account.\n"]
  identifier : partner_identifier;
      [@ocaml.doc "The unique identifier of the partner account to retrieve.\n"]
}
[@@ocaml.doc ""]

type nonrec get_profile_update_task_response = {
  catalog : catalog; [@ocaml.doc "The catalog identifier for the partner account.\n"]
  arn : partner_arn; [@ocaml.doc "The Amazon Resource Name (ARN) of the profile update task.\n"]
  id : partner_id; [@ocaml.doc "The unique identifier of the partner account.\n"]
  task_id : profile_task_id; [@ocaml.doc "The unique identifier of the profile update task.\n"]
  task_details : task_details;
      [@ocaml.doc "The details of the profile update task including what changes are being made.\n"]
  started_at : date_time; [@ocaml.doc "The timestamp when the profile update task was started.\n"]
  status : profile_task_status;
      [@ocaml.doc
        "The current status of the profile update task (in progress, completed, failed, etc.).\n"]
  ended_at : date_time option;
      [@ocaml.doc "The timestamp when the profile update task was completed or failed.\n"]
  error_detail_list : error_detail_list option;
      [@ocaml.doc
        "A list of error details if any errors occurred during the profile update task.\n"]
}
[@@ocaml.doc ""]

type nonrec get_profile_update_task_request = {
  catalog : catalog; [@ocaml.doc "The catalog identifier for the partner account.\n"]
  identifier : partner_identifier; [@ocaml.doc "The unique identifier of the partner account.\n"]
}
[@@ocaml.doc ""]

type nonrec profile_visibility = PRIVATE [@ocaml.doc ""] | PUBLIC [@ocaml.doc ""] [@@ocaml.doc ""]

type nonrec get_profile_visibility_response = {
  catalog : catalog; [@ocaml.doc "The catalog identifier for the partner account.\n"]
  arn : partner_arn; [@ocaml.doc "The Amazon Resource Name (ARN) of the partner account.\n"]
  id : partner_id; [@ocaml.doc "The unique identifier of the partner account.\n"]
  visibility : profile_visibility;
      [@ocaml.doc
        "The visibility setting for the partner profile (public, private, restricted, etc.).\n"]
  profile_id : partner_profile_id; [@ocaml.doc "The unique identifier of the partner profile.\n"]
}
[@@ocaml.doc ""]

type nonrec get_profile_visibility_request = {
  catalog : catalog; [@ocaml.doc "The catalog identifier for the partner account.\n"]
  identifier : partner_identifier; [@ocaml.doc "The unique identifier of the partner account.\n"]
}
[@@ocaml.doc ""]

type nonrec registrant_verification_response = {
  completion_url : completion_url;
      [@ocaml.doc
        "A secure URL where the registrant can complete additional verification steps, such as \
         document upload or identity confirmation through a third-party verification service.\n"]
  completion_url_expires_at : date_time;
      [@ocaml.doc
        "The timestamp when the completion URL expires and is no longer valid for accessing the \
         verification workflow.\n"]
}
[@@ocaml.doc
  "Contains the response information from a registrant verification process, including any \
   verification-specific data and next steps for the individual verification workflow.\n"]

type nonrec verification_response_details =
  | BusinessVerificationResponse of business_verification_response
      [@ocaml.doc
        "The response details from a business verification process, including verification results \
         and any additional business information discovered.\n"]
  | RegistrantVerificationResponse of registrant_verification_response
      [@ocaml.doc
        "The response details from a registrant verification process, including verification \
         results and any additional steps required for identity confirmation.\n"]
[@@ocaml.doc
  "A union structure containing the response details specific to different types of verification \
   processes, providing type-specific information and results.\n"]

type nonrec verification_status_reason = string [@@ocaml.doc ""]

type nonrec verification_status =
  | PENDING_CUSTOMER_ACTION [@ocaml.doc ""]
  | IN_PROGRESS [@ocaml.doc ""]
  | FAILED [@ocaml.doc ""]
  | SUCCEEDED [@ocaml.doc ""]
  | REJECTED [@ocaml.doc ""]
[@@ocaml.doc ""]

type nonrec verification_type =
  | BUSINESS_VERIFICATION [@ocaml.doc ""]
  | REGISTRANT_VERIFICATION [@ocaml.doc ""]
[@@ocaml.doc ""]

type nonrec get_verification_response = {
  verification_type : verification_type;
      [@ocaml.doc "The type of verification that was requested and processed.\n"]
  verification_status : verification_status;
      [@ocaml.doc
        "The current status of the verification process. Possible values include pending, \
         in-progress, completed, failed, or expired.\n"]
  verification_status_reason : verification_status_reason option;
      [@ocaml.doc
        "Additional information explaining the current verification status, particularly useful \
         when the status indicates a failure or requires additional action.\n"]
  verification_response_details : verification_response_details;
      [@ocaml.doc
        "Detailed response information specific to the type of verification performed, including \
         any verification-specific data or results.\n"]
  started_at : date_time;
      [@ocaml.doc "The timestamp when the verification process was initiated.\n"]
  completed_at : date_time option;
      [@ocaml.doc
        "The timestamp when the verification process was completed. This field is null if the \
         verification is still in progress.\n"]
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

type nonrec next_token = string [@@ocaml.doc ""]

type nonrec list_connection_invitations_response = {
  connection_invitation_summaries : connection_invitation_summary_list;
      [@ocaml.doc "A list of connection invitation summaries matching the specified criteria.\n"]
  next_token : next_token option;
      [@ocaml.doc
        "The token for retrieving the next page of results if more results are available.\n"]
}
[@@ocaml.doc ""]

type nonrec max_results = int [@@ocaml.doc ""]

type nonrec list_connection_invitations_request = {
  catalog : catalog; [@ocaml.doc "The catalog identifier for the partner account.\n"]
  next_token : next_token option;
      [@ocaml.doc "The token for retrieving the next page of results in paginated responses.\n"]
  connection_type : connection_type option;
      [@ocaml.doc
        "Filter results by connection type (e.g., reseller, distributor, technology partner).\n"]
  max_results : max_results option;
      [@ocaml.doc "The maximum number of connection invitations to return in a single response.\n"]
  other_participant_identifiers : participant_identifier_list option;
      [@ocaml.doc "Filter results by specific participant identifiers.\n"]
  participant_type : participant_type option;
      [@ocaml.doc "Filter results by participant type (inviter or invitee).\n"]
  status : invitation_status option;
      [@ocaml.doc
        "Filter results by invitation status (pending, accepted, rejected, canceled, expired).\n"]
}
[@@ocaml.doc ""]

type nonrec list_connections_response = {
  connection_summaries : connection_summary_list;
      [@ocaml.doc "A list of connection summaries matching the specified criteria.\n"]
  next_token : next_token option;
      [@ocaml.doc
        "The token for retrieving the next page of results if more results are available.\n"]
}
[@@ocaml.doc ""]

type nonrec list_connections_request = {
  catalog : catalog; [@ocaml.doc "The catalog identifier for the partner account.\n"]
  next_token : next_token option;
      [@ocaml.doc "The token for retrieving the next page of results in paginated responses.\n"]
  connection_type : connection_type_filter option;
      [@ocaml.doc
        "Filter results by connection type (e.g., reseller, distributor, technology partner).\n"]
  max_results : max_results option;
      [@ocaml.doc "The maximum number of connections to return in a single response.\n"]
  other_participant_identifiers : participant_identifier_list option;
      [@ocaml.doc "Filter results by specific participant identifiers.\n"]
}
[@@ocaml.doc ""]

type nonrec partner_summary = {
  catalog : catalog; [@ocaml.doc "The catalog identifier for the partner account.\n"]
  arn : partner_arn; [@ocaml.doc "The Amazon Resource Name (ARN) of the partner account.\n"]
  id : partner_id; [@ocaml.doc "The unique identifier of the partner account.\n"]
  legal_name : sensitive_unicode_string;
      [@ocaml.doc "The legal name of the partner organization.\n"]
  created_at : date_time; [@ocaml.doc "The timestamp when the partner account was created.\n"]
}
[@@ocaml.doc
  "A summary view of a partner account containing basic information for listing purposes.\n"]

type nonrec partner_summary_list = partner_summary list [@@ocaml.doc ""]

type nonrec list_partners_response = {
  partner_summary_list : partner_summary_list;
      [@ocaml.doc
        "A list of partner summaries including basic information about each partner account.\n"]
  next_token : next_token option;
      [@ocaml.doc
        "The token for retrieving the next page of results if more results are available.\n"]
}
[@@ocaml.doc ""]

type nonrec list_partners_request = {
  catalog : catalog; [@ocaml.doc "The catalog identifier to list partners from.\n"]
  next_token : next_token option;
      [@ocaml.doc "The token for retrieving the next page of results in paginated responses.\n"]
}
[@@ocaml.doc ""]

type nonrec taggable_resource_arn = string [@@ocaml.doc ""]

type nonrec list_tags_for_resource_response = {
  resource_arn : taggable_resource_arn;
      [@ocaml.doc
        "The Amazon Resource Name (ARN) of the resource that the tags are associated with.\n"]
  tags : tag_list option; [@ocaml.doc "A list of tags associated with the specified resource.\n"]
}
[@@ocaml.doc ""]

type nonrec list_tags_for_resource_request = {
  resource_arn : taggable_resource_arn;
      [@ocaml.doc "The Amazon Resource Name (ARN) of the resource to list tags for.\n"]
}
[@@ocaml.doc ""]

type nonrec partner = Smaws_Lib.CoreTypes.Resource.t [@@ocaml.doc ""]

type nonrec untag_resource_response = unit [@@ocaml.doc ""]

type nonrec tag_key_list = tag_key list [@@ocaml.doc ""]

type nonrec untag_resource_request = {
  resource_arn : taggable_resource_arn;
      [@ocaml.doc "The Amazon Resource Name (ARN) of the resource to remove tags from.\n"]
  tag_keys : tag_key_list; [@ocaml.doc "A list of tag keys to remove from the specified resource.\n"]
}
[@@ocaml.doc ""]

type nonrec tag_resource_response = unit [@@ocaml.doc ""]

type nonrec tag_resource_request = {
  resource_arn : taggable_resource_arn;
      [@ocaml.doc "The Amazon Resource Name (ARN) of the resource to tag.\n"]
  tags : tag_list; [@ocaml.doc "A list of tags to add or update for the specified resource.\n"]
}
[@@ocaml.doc ""]

type nonrec start_verification_response = {
  verification_type : verification_type;
      [@ocaml.doc
        "The type of verification that was started based on the provided verification details.\n"]
  verification_status : verification_status;
      [@ocaml.doc
        "The initial status of the verification process after it has been started. Typically this \
         will be pending or in-progress.\n"]
  verification_status_reason : verification_status_reason option;
      [@ocaml.doc
        "Additional information about the initial verification status, including any immediate \
         feedback about the submitted verification details.\n"]
  verification_response_details : verification_response_details;
      [@ocaml.doc
        "Initial response details specific to the type of verification started, which may include \
         next steps or additional requirements.\n"]
  started_at : date_time;
      [@ocaml.doc "The timestamp when the verification process was successfully initiated.\n"]
  completed_at : date_time option;
      [@ocaml.doc
        "The timestamp when the verification process was completed. This field is typically null \
         for newly started verifications unless they complete immediately.\n"]
}
[@@ocaml.doc ""]

type nonrec registrant_verification_details = unit [@@ocaml.doc ""]

type nonrec verification_details =
  | BusinessVerificationDetails of business_verification_details
      [@ocaml.doc
        "The business verification details to be used when starting a business verification process.\n"]
  | RegistrantVerificationDetails of registrant_verification_details
      [@ocaml.doc
        "The registrant verification details to be used when starting an individual identity \
         verification process.\n"]
[@@ocaml.doc
  "A union structure containing the specific details required for different types of verification \
   processes supported by AWS Partner Central.\n"]

type nonrec start_verification_request = {
  client_token : client_token option;
      [@ocaml.doc
        "A unique, case-sensitive identifier that you provide to ensure the idempotency of the \
         request. This prevents duplicate verification processes from being started accidentally.\n"]
  verification_details : verification_details option;
      [@ocaml.doc
        "The specific details required for the verification process, including business \
         information for business verification or personal information for registrant verification.\n"]
}
[@@ocaml.doc ""]

type nonrec send_email_verification_code_response = unit [@@ocaml.doc ""]

type nonrec send_email_verification_code_request = {
  catalog : catalog; [@ocaml.doc "The catalog identifier for the partner account.\n"]
  email : email; [@ocaml.doc "The email address to send the verification code to.\n"]
}
[@@ocaml.doc ""]

type nonrec put_alliance_lead_contact_response = {
  catalog : catalog; [@ocaml.doc "The catalog identifier for the partner account.\n"]
  arn : partner_arn; [@ocaml.doc "The Amazon Resource Name (ARN) of the partner account.\n"]
  id : partner_id; [@ocaml.doc "The unique identifier of the partner account.\n"]
  alliance_lead_contact : alliance_lead_contact;
      [@ocaml.doc "The updated alliance lead contact information.\n"]
}
[@@ocaml.doc ""]

type nonrec put_alliance_lead_contact_request = {
  catalog : catalog; [@ocaml.doc "The catalog identifier for the partner account.\n"]
  identifier : partner_identifier; [@ocaml.doc "The unique identifier of the partner account.\n"]
  alliance_lead_contact : alliance_lead_contact;
      [@ocaml.doc "The alliance lead contact information to set for the partner account.\n"]
  email_verification_code : email_verification_code option;
      [@ocaml.doc
        "The verification code sent to the alliance lead contact's email to confirm the update.\n"]
}
[@@ocaml.doc ""]

type nonrec put_profile_visibility_response = {
  catalog : catalog; [@ocaml.doc "The catalog identifier for the partner account.\n"]
  arn : partner_arn; [@ocaml.doc "The Amazon Resource Name (ARN) of the partner account.\n"]
  id : partner_id; [@ocaml.doc "The unique identifier of the partner account.\n"]
  visibility : profile_visibility;
      [@ocaml.doc "The updated visibility setting for the partner profile.\n"]
  profile_id : partner_profile_id; [@ocaml.doc "The unique identifier of the partner profile.\n"]
}
[@@ocaml.doc ""]

type nonrec put_profile_visibility_request = {
  catalog : catalog; [@ocaml.doc "The catalog identifier for the partner account.\n"]
  identifier : partner_identifier; [@ocaml.doc "The unique identifier of the partner account.\n"]
  visibility : profile_visibility;
      [@ocaml.doc "The visibility setting to apply to the partner profile.\n"]
}
[@@ocaml.doc ""]

type nonrec reject_connection_invitation_response = {
  catalog : catalog;
      [@ocaml.doc "The catalog identifier where the connection invitation was rejected.\n"]
  id : connection_invitation_id;
      [@ocaml.doc "The unique identifier of the rejected connection invitation.\n"]
  arn : connection_invitation_arn;
      [@ocaml.doc "The Amazon Resource Name (ARN) of the rejected connection invitation.\n"]
  connection_id : connection_id option;
      [@ocaml.doc "The identifier of the connection associated with the rejected invitation.\n"]
  connection_type : connection_type;
      [@ocaml.doc "The type of connection that was being invited for.\n"]
  created_at : date_time;
      [@ocaml.doc "The timestamp when the connection invitation was originally created.\n"]
  updated_at : date_time;
      [@ocaml.doc "The timestamp when the connection invitation was last updated (rejected).\n"]
  expires_at : date_time option;
      [@ocaml.doc "The timestamp when the connection invitation would have expired.\n"]
  other_participant_identifier : participant_identifier;
      [@ocaml.doc "The identifier of the other participant who sent the invitation.\n"]
  participant_type : participant_type;
      [@ocaml.doc "The type of participant (inviter or invitee) in the connection invitation.\n"]
  status : invitation_status;
      [@ocaml.doc "The current status of the connection invitation (rejected).\n"]
  invitation_message : unicode_string_including_new_line;
      [@ocaml.doc "The message that was included with the original connection invitation.\n"]
  inviter_email : email;
      [@ocaml.doc "The email address of the person who sent the connection invitation.\n"]
  inviter_name : sensitive_unicode_string;
      [@ocaml.doc "The name of the person who sent the connection invitation.\n"]
}
[@@ocaml.doc ""]

type nonrec reject_connection_invitation_request = {
  catalog : catalog; [@ocaml.doc "The catalog identifier where the connection invitation exists.\n"]
  identifier : connection_invitation_id;
      [@ocaml.doc "The unique identifier of the connection invitation to reject.\n"]
  client_token : client_token;
      [@ocaml.doc
        "A unique, case-sensitive identifier that you provide to ensure the idempotency of the \
         request.\n"]
  reason : Smaws_Lib.Smithy_api.Types.string_ option;
      [@ocaml.doc "The reason for rejecting the connection invitation.\n"]
}
[@@ocaml.doc ""]

type nonrec start_profile_update_task_response = {
  catalog : catalog; [@ocaml.doc "The catalog identifier for the partner account.\n"]
  arn : partner_arn;
      [@ocaml.doc "The Amazon Resource Name (ARN) of the started profile update task.\n"]
  id : partner_id; [@ocaml.doc "The unique identifier of the partner account.\n"]
  task_id : profile_task_id;
      [@ocaml.doc "The unique identifier of the started profile update task.\n"]
  task_details : task_details;
      [@ocaml.doc "The details of the profile update task that was started.\n"]
  started_at : date_time; [@ocaml.doc "The timestamp when the profile update task was started.\n"]
  status : profile_task_status;
      [@ocaml.doc "The current status of the profile update task (in progress).\n"]
  ended_at : date_time option;
      [@ocaml.doc
        "The timestamp when the profile update task ended (null for in-progress tasks).\n"]
  error_detail_list : error_detail_list option;
      [@ocaml.doc
        "A list of error details if any errors occurred during the profile update task.\n"]
}
[@@ocaml.doc ""]

type nonrec start_profile_update_task_request = {
  catalog : catalog; [@ocaml.doc "The catalog identifier for the partner account.\n"]
  identifier : partner_identifier; [@ocaml.doc "The unique identifier of the partner account.\n"]
  client_token : client_token option;
      [@ocaml.doc
        "A unique, case-sensitive identifier that you provide to ensure the idempotency of the \
         request.\n"]
  task_details : task_details; [@ocaml.doc "The details of the profile updates to be performed.\n"]
}
[@@ocaml.doc ""]

type nonrec update_connection_preferences_response = {
  catalog : catalog; [@ocaml.doc "The catalog identifier for the partner account.\n"]
  arn : connection_preferences_arn;
      [@ocaml.doc "The Amazon Resource Name (ARN) of the updated connection preferences.\n"]
  access_type : access_type; [@ocaml.doc "The updated access type setting for connections.\n"]
  excluded_participant_ids : participant_identifier_list option;
      [@ocaml.doc
        "A list of participant IDs that are excluded from connection requests or interactions.\n"]
  updated_at : date_time;
      [@ocaml.doc "The timestamp when the connection preferences were last updated.\n"]
  revision : revision; [@ocaml.doc "The updated revision number of the connection preferences.\n"]
}
[@@ocaml.doc ""]

type nonrec update_connection_preferences_request = {
  catalog : catalog; [@ocaml.doc "The catalog identifier for the partner account.\n"]
  revision : revision;
      [@ocaml.doc "The revision number of the connection preferences for optimistic locking.\n"]
  access_type : access_type;
      [@ocaml.doc
        "The access type setting for connections (e.g., open, restricted, invitation-only).\n"]
  excluded_participant_identifiers : participant_identifier_list option;
      [@ocaml.doc "The updated list of participant identifiers to exclude from connections.\n"]
}
[@@ocaml.doc ""]
