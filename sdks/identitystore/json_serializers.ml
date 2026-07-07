open Smaws_Lib.Json.SerializeHelpers
open Types

let validation_exception_reason_to_yojson (x : validation_exception_reason) =
  match x with
  | KMS_DISABLED -> `String "KMS_DISABLED"
  | KMS_INVALID_STATE -> `String "KMS_INVALID_STATE"
  | KMS_INVALID_KEY_USAGE -> `String "KMS_INVALID_KEY_USAGE"
  | KMS_INVALID_ARN -> `String "KMS_INVALID_ARN"

let exception_message_to_yojson = string_to_yojson
let request_id_to_yojson = string_to_yojson

let validation_exception_to_yojson (x : validation_exception) =
  assoc_to_yojson
    [
      ("Reason", option_to_yojson validation_exception_reason_to_yojson x.reason);
      ("RequestId", option_to_yojson request_id_to_yojson x.request_id);
      ("Message", option_to_yojson exception_message_to_yojson x.message);
    ]

let identity_store_id_to_yojson = string_to_yojson
let resource_id_to_yojson = string_to_yojson
let user_name_to_yojson = string_to_yojson
let external_id_issuer_to_yojson = string_to_yojson
let external_id_identifier_to_yojson = string_to_yojson

let external_id_to_yojson (x : external_id) =
  assoc_to_yojson
    [
      ("Id", Some (external_id_identifier_to_yojson x.id));
      ("Issuer", Some (external_id_issuer_to_yojson x.issuer));
    ]

let external_ids_to_yojson tree = list_to_yojson external_id_to_yojson tree
let sensitive_string_type_to_yojson = string_to_yojson

let name_to_yojson (x : name) =
  assoc_to_yojson
    [
      ("HonorificSuffix", option_to_yojson sensitive_string_type_to_yojson x.honorific_suffix);
      ("HonorificPrefix", option_to_yojson sensitive_string_type_to_yojson x.honorific_prefix);
      ("MiddleName", option_to_yojson sensitive_string_type_to_yojson x.middle_name);
      ("GivenName", option_to_yojson sensitive_string_type_to_yojson x.given_name);
      ("FamilyName", option_to_yojson sensitive_string_type_to_yojson x.family_name);
      ("Formatted", option_to_yojson sensitive_string_type_to_yojson x.formatted);
    ]

let boolean_type_to_yojson = bool_to_yojson

let email_to_yojson (x : email) =
  assoc_to_yojson
    [
      ("Primary", option_to_yojson boolean_type_to_yojson x.primary);
      ("Type", option_to_yojson sensitive_string_type_to_yojson x.type_);
      ("Value", option_to_yojson sensitive_string_type_to_yojson x.value);
    ]

let emails_to_yojson tree = list_to_yojson email_to_yojson tree

let address_to_yojson (x : address) =
  assoc_to_yojson
    [
      ("Primary", option_to_yojson boolean_type_to_yojson x.primary);
      ("Type", option_to_yojson sensitive_string_type_to_yojson x.type_);
      ("Formatted", option_to_yojson sensitive_string_type_to_yojson x.formatted);
      ("Country", option_to_yojson sensitive_string_type_to_yojson x.country);
      ("PostalCode", option_to_yojson sensitive_string_type_to_yojson x.postal_code);
      ("Region", option_to_yojson sensitive_string_type_to_yojson x.region);
      ("Locality", option_to_yojson sensitive_string_type_to_yojson x.locality);
      ("StreetAddress", option_to_yojson sensitive_string_type_to_yojson x.street_address);
    ]

let addresses_to_yojson tree = list_to_yojson address_to_yojson tree

let phone_number_to_yojson (x : phone_number) =
  assoc_to_yojson
    [
      ("Primary", option_to_yojson boolean_type_to_yojson x.primary);
      ("Type", option_to_yojson sensitive_string_type_to_yojson x.type_);
      ("Value", option_to_yojson sensitive_string_type_to_yojson x.value);
    ]

let phone_numbers_to_yojson tree = list_to_yojson phone_number_to_yojson tree

let user_status_to_yojson (x : user_status) =
  match x with DISABLED -> `String "DISABLED" | ENABLED -> `String "ENABLED"

let photo_to_yojson (x : photo) =
  assoc_to_yojson
    [
      ("Primary", option_to_yojson boolean_type_to_yojson x.primary);
      ("Display", option_to_yojson sensitive_string_type_to_yojson x.display);
      ("Type", option_to_yojson sensitive_string_type_to_yojson x.type_);
      ("Value", Some (sensitive_string_type_to_yojson x.value));
    ]

let photos_to_yojson tree = list_to_yojson photo_to_yojson tree

let role_to_yojson (x : role) =
  assoc_to_yojson
    [
      ("Primary", option_to_yojson boolean_type_to_yojson x.primary);
      ("Type", option_to_yojson sensitive_string_type_to_yojson x.type_);
      ("Value", option_to_yojson sensitive_string_type_to_yojson x.value);
    ]

let roles_to_yojson tree = list_to_yojson role_to_yojson tree
let date_type_to_yojson = timestamp_epoch_seconds_to_yojson
let string_type_to_yojson = string_to_yojson
let attribute_value_to_yojson = json_to_yojson
let extension_name_to_yojson = string_to_yojson

let extensions_to_yojson tree =
  map_to_yojson extension_name_to_yojson attribute_value_to_yojson tree

let user_to_yojson (x : user) =
  assoc_to_yojson
    [
      ("Extensions", option_to_yojson extensions_to_yojson x.extensions);
      ("UpdatedBy", option_to_yojson string_type_to_yojson x.updated_by);
      ("UpdatedAt", option_to_yojson date_type_to_yojson x.updated_at);
      ("CreatedBy", option_to_yojson string_type_to_yojson x.created_by);
      ("CreatedAt", option_to_yojson date_type_to_yojson x.created_at);
      ("Roles", option_to_yojson roles_to_yojson x.roles);
      ("Birthdate", option_to_yojson sensitive_string_type_to_yojson x.birthdate);
      ("Website", option_to_yojson sensitive_string_type_to_yojson x.website);
      ("Photos", option_to_yojson photos_to_yojson x.photos);
      ("UserStatus", option_to_yojson user_status_to_yojson x.user_status);
      ("Timezone", option_to_yojson sensitive_string_type_to_yojson x.timezone);
      ("Locale", option_to_yojson sensitive_string_type_to_yojson x.locale);
      ("PreferredLanguage", option_to_yojson sensitive_string_type_to_yojson x.preferred_language);
      ("Title", option_to_yojson sensitive_string_type_to_yojson x.title);
      ("UserType", option_to_yojson sensitive_string_type_to_yojson x.user_type);
      ("PhoneNumbers", option_to_yojson phone_numbers_to_yojson x.phone_numbers);
      ("Addresses", option_to_yojson addresses_to_yojson x.addresses);
      ("Emails", option_to_yojson emails_to_yojson x.emails);
      ("ProfileUrl", option_to_yojson sensitive_string_type_to_yojson x.profile_url);
      ("NickName", option_to_yojson sensitive_string_type_to_yojson x.nick_name);
      ("DisplayName", option_to_yojson sensitive_string_type_to_yojson x.display_name);
      ("Name", option_to_yojson name_to_yojson x.name);
      ("ExternalIds", option_to_yojson external_ids_to_yojson x.external_ids);
      ("UserName", option_to_yojson user_name_to_yojson x.user_name);
      ("UserId", Some (resource_id_to_yojson x.user_id));
      ("IdentityStoreId", Some (identity_store_id_to_yojson x.identity_store_id));
    ]

let users_to_yojson tree = list_to_yojson user_to_yojson tree
let update_user_response_to_yojson = unit_to_yojson
let attribute_path_to_yojson = string_to_yojson

let attribute_operation_to_yojson (x : attribute_operation) =
  assoc_to_yojson
    [
      ("AttributeValue", option_to_yojson attribute_value_to_yojson x.attribute_value);
      ("AttributePath", Some (attribute_path_to_yojson x.attribute_path));
    ]

let attribute_operations_to_yojson tree = list_to_yojson attribute_operation_to_yojson tree

let update_user_request_to_yojson (x : update_user_request) =
  assoc_to_yojson
    [
      ("Operations", Some (attribute_operations_to_yojson x.operations));
      ("UserId", Some (resource_id_to_yojson x.user_id));
      ("IdentityStoreId", Some (identity_store_id_to_yojson x.identity_store_id));
    ]

let service_quota_exceeded_exception_to_yojson (x : service_quota_exceeded_exception) =
  assoc_to_yojson
    [
      ("RequestId", option_to_yojson request_id_to_yojson x.request_id);
      ("Message", option_to_yojson exception_message_to_yojson x.message);
    ]

let resource_type_to_yojson (x : resource_type) =
  match x with
  | RESOURCE_POLICY -> `String "RESOURCE_POLICY"
  | GROUP_MEMBERSHIP -> `String "GROUP_MEMBERSHIP"
  | IDENTITY_STORE -> `String "IDENTITY_STORE"
  | USER -> `String "USER"
  | GROUP -> `String "GROUP"

let resource_not_found_exception_reason_to_yojson (x : resource_not_found_exception_reason) =
  match x with KMS_KEY_NOT_FOUND -> `String "KMS_KEY_NOT_FOUND"

let resource_not_found_exception_to_yojson (x : resource_not_found_exception) =
  assoc_to_yojson
    [
      ("RequestId", option_to_yojson request_id_to_yojson x.request_id);
      ("Message", option_to_yojson exception_message_to_yojson x.message);
      ("Reason", option_to_yojson resource_not_found_exception_reason_to_yojson x.reason);
      ("ResourceId", option_to_yojson resource_id_to_yojson x.resource_id);
      ("ResourceType", option_to_yojson resource_type_to_yojson x.resource_type);
    ]

let conflict_exception_reason_to_yojson (x : conflict_exception_reason) =
  match x with
  | CONCURRENT_MODIFICATION -> `String "CONCURRENT_MODIFICATION"
  | UNIQUENESS_CONSTRAINT_VIOLATION -> `String "UNIQUENESS_CONSTRAINT_VIOLATION"

let conflict_exception_to_yojson (x : conflict_exception) =
  assoc_to_yojson
    [
      ("Reason", option_to_yojson conflict_exception_reason_to_yojson x.reason);
      ("RequestId", option_to_yojson request_id_to_yojson x.request_id);
      ("Message", option_to_yojson exception_message_to_yojson x.message);
    ]

let update_group_response_to_yojson = unit_to_yojson

let update_group_request_to_yojson (x : update_group_request) =
  assoc_to_yojson
    [
      ("Operations", Some (attribute_operations_to_yojson x.operations));
      ("GroupId", Some (resource_id_to_yojson x.group_id));
      ("IdentityStoreId", Some (identity_store_id_to_yojson x.identity_store_id));
    ]

let unique_attribute_to_yojson (x : unique_attribute) =
  assoc_to_yojson
    [
      ("AttributeValue", Some (attribute_value_to_yojson x.attribute_value));
      ("AttributePath", Some (attribute_path_to_yojson x.attribute_path));
    ]

let throttling_exception_reason_to_yojson (x : throttling_exception_reason) =
  match x with KMS_THROTTLING -> `String "KMS_THROTTLING"

let retry_after_seconds_to_yojson = int_to_yojson

let throttling_exception_to_yojson (x : throttling_exception) =
  assoc_to_yojson
    [
      ("Reason", option_to_yojson throttling_exception_reason_to_yojson x.reason);
      ("RetryAfterSeconds", option_to_yojson retry_after_seconds_to_yojson x.retry_after_seconds);
      ("RequestId", option_to_yojson request_id_to_yojson x.request_id);
      ("Message", option_to_yojson exception_message_to_yojson x.message);
    ]

let next_token_to_yojson = string_to_yojson

let member_id_to_yojson (x : member_id) =
  match x with UserId arg -> assoc_to_yojson [ ("UserId", Some (resource_id_to_yojson arg)) ]

let max_results_to_yojson = int_to_yojson

let list_users_response_to_yojson (x : list_users_response) =
  assoc_to_yojson
    [
      ("NextToken", option_to_yojson next_token_to_yojson x.next_token);
      ("Users", Some (users_to_yojson x.users));
    ]

let extension_names_to_yojson tree = list_to_yojson extension_name_to_yojson tree

let filter_to_yojson (x : filter) =
  assoc_to_yojson
    [
      ("AttributeValue", Some (sensitive_string_type_to_yojson x.attribute_value));
      ("AttributePath", Some (attribute_path_to_yojson x.attribute_path));
    ]

let filters_to_yojson tree = list_to_yojson filter_to_yojson tree

let list_users_request_to_yojson (x : list_users_request) =
  assoc_to_yojson
    [
      ("Filters", option_to_yojson filters_to_yojson x.filters);
      ("NextToken", option_to_yojson next_token_to_yojson x.next_token);
      ("MaxResults", option_to_yojson max_results_to_yojson x.max_results);
      ("Extensions", option_to_yojson extension_names_to_yojson x.extensions);
      ("IdentityStoreId", Some (identity_store_id_to_yojson x.identity_store_id));
    ]

let group_display_name_to_yojson = string_to_yojson

let group_to_yojson (x : group) =
  assoc_to_yojson
    [
      ("IdentityStoreId", Some (identity_store_id_to_yojson x.identity_store_id));
      ("UpdatedBy", option_to_yojson string_type_to_yojson x.updated_by);
      ("CreatedBy", option_to_yojson string_type_to_yojson x.created_by);
      ("UpdatedAt", option_to_yojson date_type_to_yojson x.updated_at);
      ("CreatedAt", option_to_yojson date_type_to_yojson x.created_at);
      ("Description", option_to_yojson sensitive_string_type_to_yojson x.description);
      ("ExternalIds", option_to_yojson external_ids_to_yojson x.external_ids);
      ("DisplayName", option_to_yojson group_display_name_to_yojson x.display_name);
      ("GroupId", Some (resource_id_to_yojson x.group_id));
    ]

let groups_to_yojson tree = list_to_yojson group_to_yojson tree

let list_groups_response_to_yojson (x : list_groups_response) =
  assoc_to_yojson
    [
      ("NextToken", option_to_yojson next_token_to_yojson x.next_token);
      ("Groups", Some (groups_to_yojson x.groups));
    ]

let list_groups_request_to_yojson (x : list_groups_request) =
  assoc_to_yojson
    [
      ("Filters", option_to_yojson filters_to_yojson x.filters);
      ("NextToken", option_to_yojson next_token_to_yojson x.next_token);
      ("MaxResults", option_to_yojson max_results_to_yojson x.max_results);
      ("IdentityStoreId", Some (identity_store_id_to_yojson x.identity_store_id));
    ]

let group_membership_to_yojson (x : group_membership) =
  assoc_to_yojson
    [
      ("UpdatedBy", option_to_yojson string_type_to_yojson x.updated_by);
      ("CreatedBy", option_to_yojson string_type_to_yojson x.created_by);
      ("UpdatedAt", option_to_yojson date_type_to_yojson x.updated_at);
      ("CreatedAt", option_to_yojson date_type_to_yojson x.created_at);
      ("MemberId", option_to_yojson member_id_to_yojson x.member_id);
      ("GroupId", option_to_yojson resource_id_to_yojson x.group_id);
      ("MembershipId", option_to_yojson resource_id_to_yojson x.membership_id);
      ("IdentityStoreId", Some (identity_store_id_to_yojson x.identity_store_id));
    ]

let group_memberships_to_yojson tree = list_to_yojson group_membership_to_yojson tree

let list_group_memberships_response_to_yojson (x : list_group_memberships_response) =
  assoc_to_yojson
    [
      ("NextToken", option_to_yojson next_token_to_yojson x.next_token);
      ("GroupMemberships", Some (group_memberships_to_yojson x.group_memberships));
    ]

let list_group_memberships_request_to_yojson (x : list_group_memberships_request) =
  assoc_to_yojson
    [
      ("NextToken", option_to_yojson next_token_to_yojson x.next_token);
      ("MaxResults", option_to_yojson max_results_to_yojson x.max_results);
      ("GroupId", Some (resource_id_to_yojson x.group_id));
      ("IdentityStoreId", Some (identity_store_id_to_yojson x.identity_store_id));
    ]

let list_group_memberships_for_member_response_to_yojson
    (x : list_group_memberships_for_member_response) =
  assoc_to_yojson
    [
      ("NextToken", option_to_yojson next_token_to_yojson x.next_token);
      ("GroupMemberships", Some (group_memberships_to_yojson x.group_memberships));
    ]

let list_group_memberships_for_member_request_to_yojson
    (x : list_group_memberships_for_member_request) =
  assoc_to_yojson
    [
      ("NextToken", option_to_yojson next_token_to_yojson x.next_token);
      ("MaxResults", option_to_yojson max_results_to_yojson x.max_results);
      ("MemberId", Some (member_id_to_yojson x.member_id));
      ("IdentityStoreId", Some (identity_store_id_to_yojson x.identity_store_id));
    ]

let group_membership_existence_result_to_yojson (x : group_membership_existence_result) =
  assoc_to_yojson
    [
      ("MembershipExists", option_to_yojson boolean_type_to_yojson x.membership_exists);
      ("MemberId", option_to_yojson member_id_to_yojson x.member_id);
      ("GroupId", option_to_yojson resource_id_to_yojson x.group_id);
    ]

let group_membership_existence_results_to_yojson tree =
  list_to_yojson group_membership_existence_result_to_yojson tree

let is_member_in_groups_response_to_yojson (x : is_member_in_groups_response) =
  assoc_to_yojson [ ("Results", Some (group_membership_existence_results_to_yojson x.results)) ]

let group_ids_to_yojson tree = list_to_yojson resource_id_to_yojson tree

let is_member_in_groups_request_to_yojson (x : is_member_in_groups_request) =
  assoc_to_yojson
    [
      ("GroupIds", Some (group_ids_to_yojson x.group_ids));
      ("MemberId", Some (member_id_to_yojson x.member_id));
      ("IdentityStoreId", Some (identity_store_id_to_yojson x.identity_store_id));
    ]

let internal_server_exception_to_yojson (x : internal_server_exception) =
  assoc_to_yojson
    [
      ("RetryAfterSeconds", option_to_yojson retry_after_seconds_to_yojson x.retry_after_seconds);
      ("RequestId", option_to_yojson request_id_to_yojson x.request_id);
      ("Message", option_to_yojson exception_message_to_yojson x.message);
    ]

let get_user_id_response_to_yojson (x : get_user_id_response) =
  assoc_to_yojson
    [
      ("UserId", Some (resource_id_to_yojson x.user_id));
      ("IdentityStoreId", Some (identity_store_id_to_yojson x.identity_store_id));
    ]

let alternate_identifier_to_yojson (x : alternate_identifier) =
  match x with
  | UniqueAttribute arg ->
      assoc_to_yojson [ ("UniqueAttribute", Some (unique_attribute_to_yojson arg)) ]
  | ExternalId arg -> assoc_to_yojson [ ("ExternalId", Some (external_id_to_yojson arg)) ]

let get_user_id_request_to_yojson (x : get_user_id_request) =
  assoc_to_yojson
    [
      ("AlternateIdentifier", Some (alternate_identifier_to_yojson x.alternate_identifier));
      ("IdentityStoreId", Some (identity_store_id_to_yojson x.identity_store_id));
    ]

let get_group_membership_id_response_to_yojson (x : get_group_membership_id_response) =
  assoc_to_yojson
    [
      ("IdentityStoreId", Some (identity_store_id_to_yojson x.identity_store_id));
      ("MembershipId", Some (resource_id_to_yojson x.membership_id));
    ]

let get_group_membership_id_request_to_yojson (x : get_group_membership_id_request) =
  assoc_to_yojson
    [
      ("MemberId", Some (member_id_to_yojson x.member_id));
      ("GroupId", Some (resource_id_to_yojson x.group_id));
      ("IdentityStoreId", Some (identity_store_id_to_yojson x.identity_store_id));
    ]

let get_group_id_response_to_yojson (x : get_group_id_response) =
  assoc_to_yojson
    [
      ("IdentityStoreId", Some (identity_store_id_to_yojson x.identity_store_id));
      ("GroupId", Some (resource_id_to_yojson x.group_id));
    ]

let get_group_id_request_to_yojson (x : get_group_id_request) =
  assoc_to_yojson
    [
      ("AlternateIdentifier", Some (alternate_identifier_to_yojson x.alternate_identifier));
      ("IdentityStoreId", Some (identity_store_id_to_yojson x.identity_store_id));
    ]

let describe_user_response_to_yojson (x : describe_user_response) =
  assoc_to_yojson
    [
      ("Extensions", option_to_yojson extensions_to_yojson x.extensions);
      ("UpdatedBy", option_to_yojson string_type_to_yojson x.updated_by);
      ("UpdatedAt", option_to_yojson date_type_to_yojson x.updated_at);
      ("CreatedBy", option_to_yojson string_type_to_yojson x.created_by);
      ("CreatedAt", option_to_yojson date_type_to_yojson x.created_at);
      ("Roles", option_to_yojson roles_to_yojson x.roles);
      ("Birthdate", option_to_yojson sensitive_string_type_to_yojson x.birthdate);
      ("Website", option_to_yojson sensitive_string_type_to_yojson x.website);
      ("Photos", option_to_yojson photos_to_yojson x.photos);
      ("UserStatus", option_to_yojson user_status_to_yojson x.user_status);
      ("Timezone", option_to_yojson sensitive_string_type_to_yojson x.timezone);
      ("Locale", option_to_yojson sensitive_string_type_to_yojson x.locale);
      ("PreferredLanguage", option_to_yojson sensitive_string_type_to_yojson x.preferred_language);
      ("Title", option_to_yojson sensitive_string_type_to_yojson x.title);
      ("UserType", option_to_yojson sensitive_string_type_to_yojson x.user_type);
      ("PhoneNumbers", option_to_yojson phone_numbers_to_yojson x.phone_numbers);
      ("Addresses", option_to_yojson addresses_to_yojson x.addresses);
      ("Emails", option_to_yojson emails_to_yojson x.emails);
      ("ProfileUrl", option_to_yojson sensitive_string_type_to_yojson x.profile_url);
      ("NickName", option_to_yojson sensitive_string_type_to_yojson x.nick_name);
      ("DisplayName", option_to_yojson sensitive_string_type_to_yojson x.display_name);
      ("Name", option_to_yojson name_to_yojson x.name);
      ("ExternalIds", option_to_yojson external_ids_to_yojson x.external_ids);
      ("UserName", option_to_yojson user_name_to_yojson x.user_name);
      ("UserId", Some (resource_id_to_yojson x.user_id));
      ("IdentityStoreId", Some (identity_store_id_to_yojson x.identity_store_id));
    ]

let describe_user_request_to_yojson (x : describe_user_request) =
  assoc_to_yojson
    [
      ("Extensions", option_to_yojson extension_names_to_yojson x.extensions);
      ("UserId", Some (resource_id_to_yojson x.user_id));
      ("IdentityStoreId", Some (identity_store_id_to_yojson x.identity_store_id));
    ]

let describe_group_response_to_yojson (x : describe_group_response) =
  assoc_to_yojson
    [
      ("IdentityStoreId", Some (identity_store_id_to_yojson x.identity_store_id));
      ("UpdatedBy", option_to_yojson string_type_to_yojson x.updated_by);
      ("CreatedBy", option_to_yojson string_type_to_yojson x.created_by);
      ("UpdatedAt", option_to_yojson date_type_to_yojson x.updated_at);
      ("CreatedAt", option_to_yojson date_type_to_yojson x.created_at);
      ("Description", option_to_yojson sensitive_string_type_to_yojson x.description);
      ("ExternalIds", option_to_yojson external_ids_to_yojson x.external_ids);
      ("DisplayName", option_to_yojson group_display_name_to_yojson x.display_name);
      ("GroupId", Some (resource_id_to_yojson x.group_id));
    ]

let describe_group_request_to_yojson (x : describe_group_request) =
  assoc_to_yojson
    [
      ("GroupId", Some (resource_id_to_yojson x.group_id));
      ("IdentityStoreId", Some (identity_store_id_to_yojson x.identity_store_id));
    ]

let describe_group_membership_response_to_yojson (x : describe_group_membership_response) =
  assoc_to_yojson
    [
      ("UpdatedBy", option_to_yojson string_type_to_yojson x.updated_by);
      ("CreatedBy", option_to_yojson string_type_to_yojson x.created_by);
      ("UpdatedAt", option_to_yojson date_type_to_yojson x.updated_at);
      ("CreatedAt", option_to_yojson date_type_to_yojson x.created_at);
      ("MemberId", Some (member_id_to_yojson x.member_id));
      ("GroupId", Some (resource_id_to_yojson x.group_id));
      ("MembershipId", Some (resource_id_to_yojson x.membership_id));
      ("IdentityStoreId", Some (identity_store_id_to_yojson x.identity_store_id));
    ]

let describe_group_membership_request_to_yojson (x : describe_group_membership_request) =
  assoc_to_yojson
    [
      ("MembershipId", Some (resource_id_to_yojson x.membership_id));
      ("IdentityStoreId", Some (identity_store_id_to_yojson x.identity_store_id));
    ]

let delete_user_response_to_yojson = unit_to_yojson

let delete_user_request_to_yojson (x : delete_user_request) =
  assoc_to_yojson
    [
      ("UserId", Some (resource_id_to_yojson x.user_id));
      ("IdentityStoreId", Some (identity_store_id_to_yojson x.identity_store_id));
    ]

let delete_group_response_to_yojson = unit_to_yojson

let delete_group_request_to_yojson (x : delete_group_request) =
  assoc_to_yojson
    [
      ("GroupId", Some (resource_id_to_yojson x.group_id));
      ("IdentityStoreId", Some (identity_store_id_to_yojson x.identity_store_id));
    ]

let delete_group_membership_response_to_yojson = unit_to_yojson

let delete_group_membership_request_to_yojson (x : delete_group_membership_request) =
  assoc_to_yojson
    [
      ("MembershipId", Some (resource_id_to_yojson x.membership_id));
      ("IdentityStoreId", Some (identity_store_id_to_yojson x.identity_store_id));
    ]

let create_user_response_to_yojson (x : create_user_response) =
  assoc_to_yojson
    [
      ("UserId", Some (resource_id_to_yojson x.user_id));
      ("IdentityStoreId", Some (identity_store_id_to_yojson x.identity_store_id));
    ]

let create_user_request_to_yojson (x : create_user_request) =
  assoc_to_yojson
    [
      ("Extensions", option_to_yojson extensions_to_yojson x.extensions);
      ("Roles", option_to_yojson roles_to_yojson x.roles);
      ("Birthdate", option_to_yojson sensitive_string_type_to_yojson x.birthdate);
      ("Website", option_to_yojson sensitive_string_type_to_yojson x.website);
      ("Photos", option_to_yojson photos_to_yojson x.photos);
      ("Timezone", option_to_yojson sensitive_string_type_to_yojson x.timezone);
      ("Locale", option_to_yojson sensitive_string_type_to_yojson x.locale);
      ("PreferredLanguage", option_to_yojson sensitive_string_type_to_yojson x.preferred_language);
      ("Title", option_to_yojson sensitive_string_type_to_yojson x.title);
      ("UserType", option_to_yojson sensitive_string_type_to_yojson x.user_type);
      ("PhoneNumbers", option_to_yojson phone_numbers_to_yojson x.phone_numbers);
      ("Addresses", option_to_yojson addresses_to_yojson x.addresses);
      ("Emails", option_to_yojson emails_to_yojson x.emails);
      ("ProfileUrl", option_to_yojson sensitive_string_type_to_yojson x.profile_url);
      ("NickName", option_to_yojson sensitive_string_type_to_yojson x.nick_name);
      ("DisplayName", option_to_yojson sensitive_string_type_to_yojson x.display_name);
      ("Name", option_to_yojson name_to_yojson x.name);
      ("UserName", option_to_yojson user_name_to_yojson x.user_name);
      ("IdentityStoreId", Some (identity_store_id_to_yojson x.identity_store_id));
    ]

let create_group_response_to_yojson (x : create_group_response) =
  assoc_to_yojson
    [
      ("IdentityStoreId", Some (identity_store_id_to_yojson x.identity_store_id));
      ("GroupId", Some (resource_id_to_yojson x.group_id));
    ]

let create_group_request_to_yojson (x : create_group_request) =
  assoc_to_yojson
    [
      ("Description", option_to_yojson sensitive_string_type_to_yojson x.description);
      ("DisplayName", option_to_yojson group_display_name_to_yojson x.display_name);
      ("IdentityStoreId", Some (identity_store_id_to_yojson x.identity_store_id));
    ]

let create_group_membership_response_to_yojson (x : create_group_membership_response) =
  assoc_to_yojson
    [
      ("IdentityStoreId", Some (identity_store_id_to_yojson x.identity_store_id));
      ("MembershipId", Some (resource_id_to_yojson x.membership_id));
    ]

let create_group_membership_request_to_yojson (x : create_group_membership_request) =
  assoc_to_yojson
    [
      ("MemberId", Some (member_id_to_yojson x.member_id));
      ("GroupId", Some (resource_id_to_yojson x.group_id));
      ("IdentityStoreId", Some (identity_store_id_to_yojson x.identity_store_id));
    ]

let access_denied_exception_reason_to_yojson (x : access_denied_exception_reason) =
  match x with KMS_ACCESS_DENIED -> `String "KMS_ACCESS_DENIED"

let access_denied_exception_to_yojson (x : access_denied_exception) =
  assoc_to_yojson
    [
      ("Reason", option_to_yojson access_denied_exception_reason_to_yojson x.reason);
      ("RequestId", option_to_yojson request_id_to_yojson x.request_id);
      ("Message", option_to_yojson exception_message_to_yojson x.message);
    ]
