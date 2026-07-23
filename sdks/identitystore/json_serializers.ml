open Smaws_Lib.Json.SerializeHelpers
open Types

let validation_exception_reason_to_yojson (x : validation_exception_reason) =
  match x with
  | KMS_INVALID_ARN -> `String "KMS_INVALID_ARN"
  | KMS_INVALID_KEY_USAGE -> `String "KMS_INVALID_KEY_USAGE"
  | KMS_INVALID_STATE -> `String "KMS_INVALID_STATE"
  | KMS_DISABLED -> `String "KMS_DISABLED"

let request_id_to_yojson = string_to_yojson
let exception_message_to_yojson = string_to_yojson

let validation_exception_to_yojson (x : validation_exception) =
  assoc_to_yojson
    [
      ("Message", option_to_yojson exception_message_to_yojson x.message);
      ("RequestId", option_to_yojson request_id_to_yojson x.request_id);
      ("Reason", option_to_yojson validation_exception_reason_to_yojson x.reason);
    ]

let resource_not_found_exception_reason_to_yojson (x : resource_not_found_exception_reason) =
  match x with KMS_KEY_NOT_FOUND -> `String "KMS_KEY_NOT_FOUND"

let resource_id_to_yojson = string_to_yojson

let resource_type_to_yojson (x : resource_type) =
  match x with
  | GROUP -> `String "GROUP"
  | USER -> `String "USER"
  | IDENTITY_STORE -> `String "IDENTITY_STORE"
  | GROUP_MEMBERSHIP -> `String "GROUP_MEMBERSHIP"
  | RESOURCE_POLICY -> `String "RESOURCE_POLICY"

let resource_not_found_exception_to_yojson (x : resource_not_found_exception) =
  assoc_to_yojson
    [
      ("ResourceType", option_to_yojson resource_type_to_yojson x.resource_type);
      ("ResourceId", option_to_yojson resource_id_to_yojson x.resource_id);
      ("Reason", option_to_yojson resource_not_found_exception_reason_to_yojson x.reason);
      ("Message", option_to_yojson exception_message_to_yojson x.message);
      ("RequestId", option_to_yojson request_id_to_yojson x.request_id);
    ]

let next_token_to_yojson = string_to_yojson
let string_type_to_yojson = string_to_yojson
let date_type_to_yojson = timestamp_epoch_seconds_to_yojson

let member_id_to_yojson (x : member_id) =
  match x with UserId arg -> assoc_to_yojson [ ("UserId", Some (resource_id_to_yojson arg)) ]

let identity_store_id_to_yojson = string_to_yojson

let group_membership_to_yojson (x : group_membership) =
  assoc_to_yojson
    [
      ("IdentityStoreId", Some (identity_store_id_to_yojson x.identity_store_id));
      ("MembershipId", option_to_yojson resource_id_to_yojson x.membership_id);
      ("GroupId", option_to_yojson resource_id_to_yojson x.group_id);
      ("MemberId", option_to_yojson member_id_to_yojson x.member_id);
      ("CreatedAt", option_to_yojson date_type_to_yojson x.created_at);
      ("UpdatedAt", option_to_yojson date_type_to_yojson x.updated_at);
      ("CreatedBy", option_to_yojson string_type_to_yojson x.created_by);
      ("UpdatedBy", option_to_yojson string_type_to_yojson x.updated_by);
    ]

let group_memberships_to_yojson tree = list_to_yojson group_membership_to_yojson tree

let list_group_memberships_for_member_response_to_yojson
    (x : list_group_memberships_for_member_response) =
  assoc_to_yojson
    [
      ("GroupMemberships", Some (group_memberships_to_yojson x.group_memberships));
      ("NextToken", option_to_yojson next_token_to_yojson x.next_token);
    ]

let max_results_to_yojson = int_to_yojson

let list_group_memberships_for_member_request_to_yojson
    (x : list_group_memberships_for_member_request) =
  assoc_to_yojson
    [
      ("IdentityStoreId", Some (identity_store_id_to_yojson x.identity_store_id));
      ("MemberId", Some (member_id_to_yojson x.member_id));
      ("MaxResults", option_to_yojson max_results_to_yojson x.max_results);
      ("NextToken", option_to_yojson next_token_to_yojson x.next_token);
    ]

let boolean_type_to_yojson = bool_to_yojson

let group_membership_existence_result_to_yojson (x : group_membership_existence_result) =
  assoc_to_yojson
    [
      ("GroupId", option_to_yojson resource_id_to_yojson x.group_id);
      ("MemberId", option_to_yojson member_id_to_yojson x.member_id);
      ("MembershipExists", option_to_yojson boolean_type_to_yojson x.membership_exists);
    ]

let group_membership_existence_results_to_yojson tree =
  list_to_yojson group_membership_existence_result_to_yojson tree

let is_member_in_groups_response_to_yojson (x : is_member_in_groups_response) =
  assoc_to_yojson [ ("Results", Some (group_membership_existence_results_to_yojson x.results)) ]

let group_ids_to_yojson tree = list_to_yojson resource_id_to_yojson tree

let is_member_in_groups_request_to_yojson (x : is_member_in_groups_request) =
  assoc_to_yojson
    [
      ("IdentityStoreId", Some (identity_store_id_to_yojson x.identity_store_id));
      ("MemberId", Some (member_id_to_yojson x.member_id));
      ("GroupIds", Some (group_ids_to_yojson x.group_ids));
    ]

let get_user_id_response_to_yojson (x : get_user_id_response) =
  assoc_to_yojson
    [
      ("IdentityStoreId", Some (identity_store_id_to_yojson x.identity_store_id));
      ("UserId", Some (resource_id_to_yojson x.user_id));
    ]

let attribute_value_to_yojson = json_to_yojson
let attribute_path_to_yojson = string_to_yojson

let unique_attribute_to_yojson (x : unique_attribute) =
  assoc_to_yojson
    [
      ("AttributePath", Some (attribute_path_to_yojson x.attribute_path));
      ("AttributeValue", Some (attribute_value_to_yojson x.attribute_value));
    ]

let external_id_identifier_to_yojson = string_to_yojson
let external_id_issuer_to_yojson = string_to_yojson

let external_id_to_yojson (x : external_id) =
  assoc_to_yojson
    [
      ("Issuer", Some (external_id_issuer_to_yojson x.issuer));
      ("Id", Some (external_id_identifier_to_yojson x.id));
    ]

let alternate_identifier_to_yojson (x : alternate_identifier) =
  match x with
  | ExternalId arg -> assoc_to_yojson [ ("ExternalId", Some (external_id_to_yojson arg)) ]
  | UniqueAttribute arg ->
      assoc_to_yojson [ ("UniqueAttribute", Some (unique_attribute_to_yojson arg)) ]

let get_user_id_request_to_yojson (x : get_user_id_request) =
  assoc_to_yojson
    [
      ("IdentityStoreId", Some (identity_store_id_to_yojson x.identity_store_id));
      ("AlternateIdentifier", Some (alternate_identifier_to_yojson x.alternate_identifier));
    ]

let get_group_membership_id_response_to_yojson (x : get_group_membership_id_response) =
  assoc_to_yojson
    [
      ("MembershipId", Some (resource_id_to_yojson x.membership_id));
      ("IdentityStoreId", Some (identity_store_id_to_yojson x.identity_store_id));
    ]

let get_group_membership_id_request_to_yojson (x : get_group_membership_id_request) =
  assoc_to_yojson
    [
      ("IdentityStoreId", Some (identity_store_id_to_yojson x.identity_store_id));
      ("GroupId", Some (resource_id_to_yojson x.group_id));
      ("MemberId", Some (member_id_to_yojson x.member_id));
    ]

let get_group_id_response_to_yojson (x : get_group_id_response) =
  assoc_to_yojson
    [
      ("GroupId", Some (resource_id_to_yojson x.group_id));
      ("IdentityStoreId", Some (identity_store_id_to_yojson x.identity_store_id));
    ]

let get_group_id_request_to_yojson (x : get_group_id_request) =
  assoc_to_yojson
    [
      ("IdentityStoreId", Some (identity_store_id_to_yojson x.identity_store_id));
      ("AlternateIdentifier", Some (alternate_identifier_to_yojson x.alternate_identifier));
    ]

let access_denied_exception_reason_to_yojson (x : access_denied_exception_reason) =
  match x with KMS_ACCESS_DENIED -> `String "KMS_ACCESS_DENIED"

let access_denied_exception_to_yojson (x : access_denied_exception) =
  assoc_to_yojson
    [
      ("Message", option_to_yojson exception_message_to_yojson x.message);
      ("RequestId", option_to_yojson request_id_to_yojson x.request_id);
      ("Reason", option_to_yojson access_denied_exception_reason_to_yojson x.reason);
    ]

let sensitive_string_type_to_yojson = string_to_yojson

let address_to_yojson (x : address) =
  assoc_to_yojson
    [
      ("StreetAddress", option_to_yojson sensitive_string_type_to_yojson x.street_address);
      ("Locality", option_to_yojson sensitive_string_type_to_yojson x.locality);
      ("Region", option_to_yojson sensitive_string_type_to_yojson x.region);
      ("PostalCode", option_to_yojson sensitive_string_type_to_yojson x.postal_code);
      ("Country", option_to_yojson sensitive_string_type_to_yojson x.country);
      ("Formatted", option_to_yojson sensitive_string_type_to_yojson x.formatted);
      ("Type", option_to_yojson sensitive_string_type_to_yojson x.type_);
      ("Primary", option_to_yojson boolean_type_to_yojson x.primary);
    ]

let addresses_to_yojson tree = list_to_yojson address_to_yojson tree

let attribute_operation_to_yojson (x : attribute_operation) =
  assoc_to_yojson
    [
      ("AttributePath", Some (attribute_path_to_yojson x.attribute_path));
      ("AttributeValue", option_to_yojson attribute_value_to_yojson x.attribute_value);
    ]

let attribute_operations_to_yojson tree = list_to_yojson attribute_operation_to_yojson tree

let conflict_exception_reason_to_yojson (x : conflict_exception_reason) =
  match x with
  | UNIQUENESS_CONSTRAINT_VIOLATION -> `String "UNIQUENESS_CONSTRAINT_VIOLATION"
  | CONCURRENT_MODIFICATION -> `String "CONCURRENT_MODIFICATION"

let conflict_exception_to_yojson (x : conflict_exception) =
  assoc_to_yojson
    [
      ("Message", option_to_yojson exception_message_to_yojson x.message);
      ("RequestId", option_to_yojson request_id_to_yojson x.request_id);
      ("Reason", option_to_yojson conflict_exception_reason_to_yojson x.reason);
    ]

let service_quota_exceeded_exception_to_yojson (x : service_quota_exceeded_exception) =
  assoc_to_yojson
    [
      ("Message", option_to_yojson exception_message_to_yojson x.message);
      ("RequestId", option_to_yojson request_id_to_yojson x.request_id);
    ]

let create_group_response_to_yojson (x : create_group_response) =
  assoc_to_yojson
    [
      ("GroupId", Some (resource_id_to_yojson x.group_id));
      ("IdentityStoreId", Some (identity_store_id_to_yojson x.identity_store_id));
    ]

let group_display_name_to_yojson = string_to_yojson

let create_group_request_to_yojson (x : create_group_request) =
  assoc_to_yojson
    [
      ("IdentityStoreId", Some (identity_store_id_to_yojson x.identity_store_id));
      ("DisplayName", option_to_yojson group_display_name_to_yojson x.display_name);
      ("Description", option_to_yojson sensitive_string_type_to_yojson x.description);
    ]

let create_group_membership_response_to_yojson (x : create_group_membership_response) =
  assoc_to_yojson
    [
      ("MembershipId", Some (resource_id_to_yojson x.membership_id));
      ("IdentityStoreId", Some (identity_store_id_to_yojson x.identity_store_id));
    ]

let create_group_membership_request_to_yojson (x : create_group_membership_request) =
  assoc_to_yojson
    [
      ("IdentityStoreId", Some (identity_store_id_to_yojson x.identity_store_id));
      ("GroupId", Some (resource_id_to_yojson x.group_id));
      ("MemberId", Some (member_id_to_yojson x.member_id));
    ]

let create_user_response_to_yojson (x : create_user_response) =
  assoc_to_yojson
    [
      ("IdentityStoreId", Some (identity_store_id_to_yojson x.identity_store_id));
      ("UserId", Some (resource_id_to_yojson x.user_id));
    ]

let extension_name_to_yojson = string_to_yojson

let extensions_to_yojson tree =
  map_to_yojson extension_name_to_yojson attribute_value_to_yojson tree

let role_to_yojson (x : role) =
  assoc_to_yojson
    [
      ("Value", option_to_yojson sensitive_string_type_to_yojson x.value);
      ("Type", option_to_yojson sensitive_string_type_to_yojson x.type_);
      ("Primary", option_to_yojson boolean_type_to_yojson x.primary);
    ]

let roles_to_yojson tree = list_to_yojson role_to_yojson tree

let photo_to_yojson (x : photo) =
  assoc_to_yojson
    [
      ("Value", Some (sensitive_string_type_to_yojson x.value));
      ("Type", option_to_yojson sensitive_string_type_to_yojson x.type_);
      ("Display", option_to_yojson sensitive_string_type_to_yojson x.display);
      ("Primary", option_to_yojson boolean_type_to_yojson x.primary);
    ]

let photos_to_yojson tree = list_to_yojson photo_to_yojson tree

let phone_number_to_yojson (x : phone_number) =
  assoc_to_yojson
    [
      ("Value", option_to_yojson sensitive_string_type_to_yojson x.value);
      ("Type", option_to_yojson sensitive_string_type_to_yojson x.type_);
      ("Primary", option_to_yojson boolean_type_to_yojson x.primary);
    ]

let phone_numbers_to_yojson tree = list_to_yojson phone_number_to_yojson tree

let email_to_yojson (x : email) =
  assoc_to_yojson
    [
      ("Value", option_to_yojson sensitive_string_type_to_yojson x.value);
      ("Type", option_to_yojson sensitive_string_type_to_yojson x.type_);
      ("Primary", option_to_yojson boolean_type_to_yojson x.primary);
    ]

let emails_to_yojson tree = list_to_yojson email_to_yojson tree

let name_to_yojson (x : name) =
  assoc_to_yojson
    [
      ("Formatted", option_to_yojson sensitive_string_type_to_yojson x.formatted);
      ("FamilyName", option_to_yojson sensitive_string_type_to_yojson x.family_name);
      ("GivenName", option_to_yojson sensitive_string_type_to_yojson x.given_name);
      ("MiddleName", option_to_yojson sensitive_string_type_to_yojson x.middle_name);
      ("HonorificPrefix", option_to_yojson sensitive_string_type_to_yojson x.honorific_prefix);
      ("HonorificSuffix", option_to_yojson sensitive_string_type_to_yojson x.honorific_suffix);
    ]

let user_name_to_yojson = string_to_yojson

let create_user_request_to_yojson (x : create_user_request) =
  assoc_to_yojson
    [
      ("IdentityStoreId", Some (identity_store_id_to_yojson x.identity_store_id));
      ("UserName", option_to_yojson user_name_to_yojson x.user_name);
      ("Name", option_to_yojson name_to_yojson x.name);
      ("DisplayName", option_to_yojson sensitive_string_type_to_yojson x.display_name);
      ("NickName", option_to_yojson sensitive_string_type_to_yojson x.nick_name);
      ("ProfileUrl", option_to_yojson sensitive_string_type_to_yojson x.profile_url);
      ("Emails", option_to_yojson emails_to_yojson x.emails);
      ("Addresses", option_to_yojson addresses_to_yojson x.addresses);
      ("PhoneNumbers", option_to_yojson phone_numbers_to_yojson x.phone_numbers);
      ("UserType", option_to_yojson sensitive_string_type_to_yojson x.user_type);
      ("Title", option_to_yojson sensitive_string_type_to_yojson x.title);
      ("PreferredLanguage", option_to_yojson sensitive_string_type_to_yojson x.preferred_language);
      ("Locale", option_to_yojson sensitive_string_type_to_yojson x.locale);
      ("Timezone", option_to_yojson sensitive_string_type_to_yojson x.timezone);
      ("Photos", option_to_yojson photos_to_yojson x.photos);
      ("Website", option_to_yojson sensitive_string_type_to_yojson x.website);
      ("Birthdate", option_to_yojson sensitive_string_type_to_yojson x.birthdate);
      ("Roles", option_to_yojson roles_to_yojson x.roles);
      ("Extensions", option_to_yojson extensions_to_yojson x.extensions);
    ]

let delete_group_response_to_yojson = unit_to_yojson

let delete_group_request_to_yojson (x : delete_group_request) =
  assoc_to_yojson
    [
      ("IdentityStoreId", Some (identity_store_id_to_yojson x.identity_store_id));
      ("GroupId", Some (resource_id_to_yojson x.group_id));
    ]

let delete_group_membership_response_to_yojson = unit_to_yojson

let delete_group_membership_request_to_yojson (x : delete_group_membership_request) =
  assoc_to_yojson
    [
      ("IdentityStoreId", Some (identity_store_id_to_yojson x.identity_store_id));
      ("MembershipId", Some (resource_id_to_yojson x.membership_id));
    ]

let delete_user_response_to_yojson = unit_to_yojson

let delete_user_request_to_yojson (x : delete_user_request) =
  assoc_to_yojson
    [
      ("IdentityStoreId", Some (identity_store_id_to_yojson x.identity_store_id));
      ("UserId", Some (resource_id_to_yojson x.user_id));
    ]

let external_ids_to_yojson tree = list_to_yojson external_id_to_yojson tree

let describe_group_response_to_yojson (x : describe_group_response) =
  assoc_to_yojson
    [
      ("GroupId", Some (resource_id_to_yojson x.group_id));
      ("DisplayName", option_to_yojson group_display_name_to_yojson x.display_name);
      ("ExternalIds", option_to_yojson external_ids_to_yojson x.external_ids);
      ("Description", option_to_yojson sensitive_string_type_to_yojson x.description);
      ("CreatedAt", option_to_yojson date_type_to_yojson x.created_at);
      ("UpdatedAt", option_to_yojson date_type_to_yojson x.updated_at);
      ("CreatedBy", option_to_yojson string_type_to_yojson x.created_by);
      ("UpdatedBy", option_to_yojson string_type_to_yojson x.updated_by);
      ("IdentityStoreId", Some (identity_store_id_to_yojson x.identity_store_id));
    ]

let describe_group_request_to_yojson (x : describe_group_request) =
  assoc_to_yojson
    [
      ("IdentityStoreId", Some (identity_store_id_to_yojson x.identity_store_id));
      ("GroupId", Some (resource_id_to_yojson x.group_id));
    ]

let describe_group_membership_response_to_yojson (x : describe_group_membership_response) =
  assoc_to_yojson
    [
      ("IdentityStoreId", Some (identity_store_id_to_yojson x.identity_store_id));
      ("MembershipId", Some (resource_id_to_yojson x.membership_id));
      ("GroupId", Some (resource_id_to_yojson x.group_id));
      ("MemberId", Some (member_id_to_yojson x.member_id));
      ("CreatedAt", option_to_yojson date_type_to_yojson x.created_at);
      ("UpdatedAt", option_to_yojson date_type_to_yojson x.updated_at);
      ("CreatedBy", option_to_yojson string_type_to_yojson x.created_by);
      ("UpdatedBy", option_to_yojson string_type_to_yojson x.updated_by);
    ]

let describe_group_membership_request_to_yojson (x : describe_group_membership_request) =
  assoc_to_yojson
    [
      ("IdentityStoreId", Some (identity_store_id_to_yojson x.identity_store_id));
      ("MembershipId", Some (resource_id_to_yojson x.membership_id));
    ]

let user_status_to_yojson (x : user_status) =
  match x with ENABLED -> `String "ENABLED" | DISABLED -> `String "DISABLED"

let describe_user_response_to_yojson (x : describe_user_response) =
  assoc_to_yojson
    [
      ("IdentityStoreId", Some (identity_store_id_to_yojson x.identity_store_id));
      ("UserId", Some (resource_id_to_yojson x.user_id));
      ("UserName", option_to_yojson user_name_to_yojson x.user_name);
      ("ExternalIds", option_to_yojson external_ids_to_yojson x.external_ids);
      ("Name", option_to_yojson name_to_yojson x.name);
      ("DisplayName", option_to_yojson sensitive_string_type_to_yojson x.display_name);
      ("NickName", option_to_yojson sensitive_string_type_to_yojson x.nick_name);
      ("ProfileUrl", option_to_yojson sensitive_string_type_to_yojson x.profile_url);
      ("Emails", option_to_yojson emails_to_yojson x.emails);
      ("Addresses", option_to_yojson addresses_to_yojson x.addresses);
      ("PhoneNumbers", option_to_yojson phone_numbers_to_yojson x.phone_numbers);
      ("UserType", option_to_yojson sensitive_string_type_to_yojson x.user_type);
      ("Title", option_to_yojson sensitive_string_type_to_yojson x.title);
      ("PreferredLanguage", option_to_yojson sensitive_string_type_to_yojson x.preferred_language);
      ("Locale", option_to_yojson sensitive_string_type_to_yojson x.locale);
      ("Timezone", option_to_yojson sensitive_string_type_to_yojson x.timezone);
      ("UserStatus", option_to_yojson user_status_to_yojson x.user_status);
      ("Photos", option_to_yojson photos_to_yojson x.photos);
      ("Website", option_to_yojson sensitive_string_type_to_yojson x.website);
      ("Birthdate", option_to_yojson sensitive_string_type_to_yojson x.birthdate);
      ("Roles", option_to_yojson roles_to_yojson x.roles);
      ("CreatedAt", option_to_yojson date_type_to_yojson x.created_at);
      ("CreatedBy", option_to_yojson string_type_to_yojson x.created_by);
      ("UpdatedAt", option_to_yojson date_type_to_yojson x.updated_at);
      ("UpdatedBy", option_to_yojson string_type_to_yojson x.updated_by);
      ("Extensions", option_to_yojson extensions_to_yojson x.extensions);
    ]

let extension_names_to_yojson tree = list_to_yojson extension_name_to_yojson tree

let describe_user_request_to_yojson (x : describe_user_request) =
  assoc_to_yojson
    [
      ("IdentityStoreId", Some (identity_store_id_to_yojson x.identity_store_id));
      ("UserId", Some (resource_id_to_yojson x.user_id));
      ("Extensions", option_to_yojson extension_names_to_yojson x.extensions);
    ]

let filter_to_yojson (x : filter) =
  assoc_to_yojson
    [
      ("AttributePath", Some (attribute_path_to_yojson x.attribute_path));
      ("AttributeValue", Some (sensitive_string_type_to_yojson x.attribute_value));
    ]

let filters_to_yojson tree = list_to_yojson filter_to_yojson tree

let group_to_yojson (x : group) =
  assoc_to_yojson
    [
      ("GroupId", Some (resource_id_to_yojson x.group_id));
      ("DisplayName", option_to_yojson group_display_name_to_yojson x.display_name);
      ("ExternalIds", option_to_yojson external_ids_to_yojson x.external_ids);
      ("Description", option_to_yojson sensitive_string_type_to_yojson x.description);
      ("CreatedAt", option_to_yojson date_type_to_yojson x.created_at);
      ("UpdatedAt", option_to_yojson date_type_to_yojson x.updated_at);
      ("CreatedBy", option_to_yojson string_type_to_yojson x.created_by);
      ("UpdatedBy", option_to_yojson string_type_to_yojson x.updated_by);
      ("IdentityStoreId", Some (identity_store_id_to_yojson x.identity_store_id));
    ]

let groups_to_yojson tree = list_to_yojson group_to_yojson tree
let retry_after_seconds_to_yojson = int_to_yojson

let internal_server_exception_to_yojson (x : internal_server_exception) =
  assoc_to_yojson
    [
      ("Message", option_to_yojson exception_message_to_yojson x.message);
      ("RequestId", option_to_yojson request_id_to_yojson x.request_id);
      ("RetryAfterSeconds", option_to_yojson retry_after_seconds_to_yojson x.retry_after_seconds);
    ]

let list_group_memberships_response_to_yojson (x : list_group_memberships_response) =
  assoc_to_yojson
    [
      ("GroupMemberships", Some (group_memberships_to_yojson x.group_memberships));
      ("NextToken", option_to_yojson next_token_to_yojson x.next_token);
    ]

let list_group_memberships_request_to_yojson (x : list_group_memberships_request) =
  assoc_to_yojson
    [
      ("IdentityStoreId", Some (identity_store_id_to_yojson x.identity_store_id));
      ("GroupId", Some (resource_id_to_yojson x.group_id));
      ("MaxResults", option_to_yojson max_results_to_yojson x.max_results);
      ("NextToken", option_to_yojson next_token_to_yojson x.next_token);
    ]

let list_groups_response_to_yojson (x : list_groups_response) =
  assoc_to_yojson
    [
      ("Groups", Some (groups_to_yojson x.groups));
      ("NextToken", option_to_yojson next_token_to_yojson x.next_token);
    ]

let list_groups_request_to_yojson (x : list_groups_request) =
  assoc_to_yojson
    [
      ("IdentityStoreId", Some (identity_store_id_to_yojson x.identity_store_id));
      ("MaxResults", option_to_yojson max_results_to_yojson x.max_results);
      ("NextToken", option_to_yojson next_token_to_yojson x.next_token);
      ("Filters", option_to_yojson filters_to_yojson x.filters);
    ]

let user_to_yojson (x : user) =
  assoc_to_yojson
    [
      ("IdentityStoreId", Some (identity_store_id_to_yojson x.identity_store_id));
      ("UserId", Some (resource_id_to_yojson x.user_id));
      ("UserName", option_to_yojson user_name_to_yojson x.user_name);
      ("ExternalIds", option_to_yojson external_ids_to_yojson x.external_ids);
      ("Name", option_to_yojson name_to_yojson x.name);
      ("DisplayName", option_to_yojson sensitive_string_type_to_yojson x.display_name);
      ("NickName", option_to_yojson sensitive_string_type_to_yojson x.nick_name);
      ("ProfileUrl", option_to_yojson sensitive_string_type_to_yojson x.profile_url);
      ("Emails", option_to_yojson emails_to_yojson x.emails);
      ("Addresses", option_to_yojson addresses_to_yojson x.addresses);
      ("PhoneNumbers", option_to_yojson phone_numbers_to_yojson x.phone_numbers);
      ("UserType", option_to_yojson sensitive_string_type_to_yojson x.user_type);
      ("Title", option_to_yojson sensitive_string_type_to_yojson x.title);
      ("PreferredLanguage", option_to_yojson sensitive_string_type_to_yojson x.preferred_language);
      ("Locale", option_to_yojson sensitive_string_type_to_yojson x.locale);
      ("Timezone", option_to_yojson sensitive_string_type_to_yojson x.timezone);
      ("UserStatus", option_to_yojson user_status_to_yojson x.user_status);
      ("Photos", option_to_yojson photos_to_yojson x.photos);
      ("Website", option_to_yojson sensitive_string_type_to_yojson x.website);
      ("Birthdate", option_to_yojson sensitive_string_type_to_yojson x.birthdate);
      ("Roles", option_to_yojson roles_to_yojson x.roles);
      ("CreatedAt", option_to_yojson date_type_to_yojson x.created_at);
      ("CreatedBy", option_to_yojson string_type_to_yojson x.created_by);
      ("UpdatedAt", option_to_yojson date_type_to_yojson x.updated_at);
      ("UpdatedBy", option_to_yojson string_type_to_yojson x.updated_by);
      ("Extensions", option_to_yojson extensions_to_yojson x.extensions);
    ]

let users_to_yojson tree = list_to_yojson user_to_yojson tree

let list_users_response_to_yojson (x : list_users_response) =
  assoc_to_yojson
    [
      ("Users", Some (users_to_yojson x.users));
      ("NextToken", option_to_yojson next_token_to_yojson x.next_token);
    ]

let list_users_request_to_yojson (x : list_users_request) =
  assoc_to_yojson
    [
      ("IdentityStoreId", Some (identity_store_id_to_yojson x.identity_store_id));
      ("Extensions", option_to_yojson extension_names_to_yojson x.extensions);
      ("MaxResults", option_to_yojson max_results_to_yojson x.max_results);
      ("NextToken", option_to_yojson next_token_to_yojson x.next_token);
      ("Filters", option_to_yojson filters_to_yojson x.filters);
    ]

let throttling_exception_reason_to_yojson (x : throttling_exception_reason) =
  match x with KMS_THROTTLING -> `String "KMS_THROTTLING"

let throttling_exception_to_yojson (x : throttling_exception) =
  assoc_to_yojson
    [
      ("Message", option_to_yojson exception_message_to_yojson x.message);
      ("RequestId", option_to_yojson request_id_to_yojson x.request_id);
      ("RetryAfterSeconds", option_to_yojson retry_after_seconds_to_yojson x.retry_after_seconds);
      ("Reason", option_to_yojson throttling_exception_reason_to_yojson x.reason);
    ]

let update_group_response_to_yojson = unit_to_yojson

let update_group_request_to_yojson (x : update_group_request) =
  assoc_to_yojson
    [
      ("IdentityStoreId", Some (identity_store_id_to_yojson x.identity_store_id));
      ("GroupId", Some (resource_id_to_yojson x.group_id));
      ("Operations", Some (attribute_operations_to_yojson x.operations));
    ]

let update_user_response_to_yojson = unit_to_yojson

let update_user_request_to_yojson (x : update_user_request) =
  assoc_to_yojson
    [
      ("IdentityStoreId", Some (identity_store_id_to_yojson x.identity_store_id));
      ("UserId", Some (resource_id_to_yojson x.user_id));
      ("Operations", Some (attribute_operations_to_yojson x.operations));
    ]
