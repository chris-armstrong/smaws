open Smaws_Lib.Json.DeserializeHelpers
open Types

let validation_exception_reason_of_yojson (tree : t) path =
  ((match tree with
    | `String "KMS_INVALID_ARN" -> KMS_INVALID_ARN
    | `String "KMS_INVALID_KEY_USAGE" -> KMS_INVALID_KEY_USAGE
    | `String "KMS_INVALID_STATE" -> KMS_INVALID_STATE
    | `String "KMS_DISABLED" -> KMS_DISABLED
    | `String value ->
        raise (deserialize_unknown_enum_value_error path "ValidationExceptionReason" value)
    | _ -> raise (deserialize_wrong_type_error path "ValidationExceptionReason")
     : validation_exception_reason)
    : validation_exception_reason)

let request_id_of_yojson = string_of_yojson
let exception_message_of_yojson = string_of_yojson

let validation_exception_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     message = option_of_yojson (value_for_key exception_message_of_yojson "Message") _list path;
     request_id = option_of_yojson (value_for_key request_id_of_yojson "RequestId") _list path;
     reason =
       option_of_yojson (value_for_key validation_exception_reason_of_yojson "Reason") _list path;
   }
    : validation_exception)

let resource_not_found_exception_reason_of_yojson (tree : t) path =
  ((match tree with
    | `String "KMS_KEY_NOT_FOUND" -> KMS_KEY_NOT_FOUND
    | `String value ->
        raise (deserialize_unknown_enum_value_error path "ResourceNotFoundExceptionReason" value)
    | _ -> raise (deserialize_wrong_type_error path "ResourceNotFoundExceptionReason")
     : resource_not_found_exception_reason)
    : resource_not_found_exception_reason)

let resource_id_of_yojson = string_of_yojson

let resource_type_of_yojson (tree : t) path =
  ((match tree with
    | `String "GROUP" -> GROUP
    | `String "USER" -> USER
    | `String "IDENTITY_STORE" -> IDENTITY_STORE
    | `String "GROUP_MEMBERSHIP" -> GROUP_MEMBERSHIP
    | `String "RESOURCE_POLICY" -> RESOURCE_POLICY
    | `String value -> raise (deserialize_unknown_enum_value_error path "ResourceType" value)
    | _ -> raise (deserialize_wrong_type_error path "ResourceType")
     : resource_type)
    : resource_type)

let resource_not_found_exception_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     resource_type =
       option_of_yojson (value_for_key resource_type_of_yojson "ResourceType") _list path;
     resource_id = option_of_yojson (value_for_key resource_id_of_yojson "ResourceId") _list path;
     reason =
       option_of_yojson
         (value_for_key resource_not_found_exception_reason_of_yojson "Reason")
         _list path;
     message = option_of_yojson (value_for_key exception_message_of_yojson "Message") _list path;
     request_id = option_of_yojson (value_for_key request_id_of_yojson "RequestId") _list path;
   }
    : resource_not_found_exception)

let next_token_of_yojson = string_of_yojson
let string_type_of_yojson = string_of_yojson
let date_type_of_yojson = timestamp_epoch_seconds_of_yojson

let member_id_of_yojson (tree : t) path =
  let _list = assoc_of_yojson tree path in
  let key, value_ =
    match _list with
    | (key, value_) :: _ -> (key, value_)
    | _ -> raise (deserialize_wrong_type_error path "union")
  in
  (match key with
   | "UserId" -> UserId (resource_id_of_yojson value_ path)
   | _ as unknown -> raise (deserialize_unknown_enum_value_error path "MemberId" unknown)
    : member_id)

let identity_store_id_of_yojson = string_of_yojson

let group_membership_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     identity_store_id = value_for_key identity_store_id_of_yojson "IdentityStoreId" _list path;
     membership_id =
       option_of_yojson (value_for_key resource_id_of_yojson "MembershipId") _list path;
     group_id = option_of_yojson (value_for_key resource_id_of_yojson "GroupId") _list path;
     member_id = option_of_yojson (value_for_key member_id_of_yojson "MemberId") _list path;
     created_at = option_of_yojson (value_for_key date_type_of_yojson "CreatedAt") _list path;
     updated_at = option_of_yojson (value_for_key date_type_of_yojson "UpdatedAt") _list path;
     created_by = option_of_yojson (value_for_key string_type_of_yojson "CreatedBy") _list path;
     updated_by = option_of_yojson (value_for_key string_type_of_yojson "UpdatedBy") _list path;
   }
    : group_membership)

let group_memberships_of_yojson tree path = list_of_yojson group_membership_of_yojson tree path

let list_group_memberships_for_member_response_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     group_memberships = value_for_key group_memberships_of_yojson "GroupMemberships" _list path;
     next_token = option_of_yojson (value_for_key next_token_of_yojson "NextToken") _list path;
   }
    : list_group_memberships_for_member_response)

let max_results_of_yojson = int_of_yojson

let list_group_memberships_for_member_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     identity_store_id = value_for_key identity_store_id_of_yojson "IdentityStoreId" _list path;
     member_id = value_for_key member_id_of_yojson "MemberId" _list path;
     max_results = option_of_yojson (value_for_key max_results_of_yojson "MaxResults") _list path;
     next_token = option_of_yojson (value_for_key next_token_of_yojson "NextToken") _list path;
   }
    : list_group_memberships_for_member_request)

let boolean_type_of_yojson = bool_of_yojson

let group_membership_existence_result_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     group_id = option_of_yojson (value_for_key resource_id_of_yojson "GroupId") _list path;
     member_id = option_of_yojson (value_for_key member_id_of_yojson "MemberId") _list path;
     membership_exists =
       option_of_yojson (value_for_key boolean_type_of_yojson "MembershipExists") _list path;
   }
    : group_membership_existence_result)

let group_membership_existence_results_of_yojson tree path =
  list_of_yojson group_membership_existence_result_of_yojson tree path

let is_member_in_groups_response_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({ results = value_for_key group_membership_existence_results_of_yojson "Results" _list path }
    : is_member_in_groups_response)

let group_ids_of_yojson tree path = list_of_yojson resource_id_of_yojson tree path

let is_member_in_groups_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     identity_store_id = value_for_key identity_store_id_of_yojson "IdentityStoreId" _list path;
     member_id = value_for_key member_id_of_yojson "MemberId" _list path;
     group_ids = value_for_key group_ids_of_yojson "GroupIds" _list path;
   }
    : is_member_in_groups_request)

let get_user_id_response_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     identity_store_id = value_for_key identity_store_id_of_yojson "IdentityStoreId" _list path;
     user_id = value_for_key resource_id_of_yojson "UserId" _list path;
   }
    : get_user_id_response)

let attribute_value_of_yojson = json_of_yojson
let attribute_path_of_yojson = string_of_yojson

let unique_attribute_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     attribute_path = value_for_key attribute_path_of_yojson "AttributePath" _list path;
     attribute_value = value_for_key attribute_value_of_yojson "AttributeValue" _list path;
   }
    : unique_attribute)

let external_id_identifier_of_yojson = string_of_yojson
let external_id_issuer_of_yojson = string_of_yojson

let external_id_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     issuer = value_for_key external_id_issuer_of_yojson "Issuer" _list path;
     id = value_for_key external_id_identifier_of_yojson "Id" _list path;
   }
    : external_id)

let alternate_identifier_of_yojson (tree : t) path =
  let _list = assoc_of_yojson tree path in
  let key, value_ =
    match _list with
    | (key, value_) :: _ -> (key, value_)
    | _ -> raise (deserialize_wrong_type_error path "union")
  in
  (match key with
   | "ExternalId" -> ExternalId (external_id_of_yojson value_ path)
   | "UniqueAttribute" -> UniqueAttribute (unique_attribute_of_yojson value_ path)
   | _ as unknown -> raise (deserialize_unknown_enum_value_error path "AlternateIdentifier" unknown)
    : alternate_identifier)

let get_user_id_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     identity_store_id = value_for_key identity_store_id_of_yojson "IdentityStoreId" _list path;
     alternate_identifier =
       value_for_key alternate_identifier_of_yojson "AlternateIdentifier" _list path;
   }
    : get_user_id_request)

let get_group_membership_id_response_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     membership_id = value_for_key resource_id_of_yojson "MembershipId" _list path;
     identity_store_id = value_for_key identity_store_id_of_yojson "IdentityStoreId" _list path;
   }
    : get_group_membership_id_response)

let get_group_membership_id_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     identity_store_id = value_for_key identity_store_id_of_yojson "IdentityStoreId" _list path;
     group_id = value_for_key resource_id_of_yojson "GroupId" _list path;
     member_id = value_for_key member_id_of_yojson "MemberId" _list path;
   }
    : get_group_membership_id_request)

let get_group_id_response_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     group_id = value_for_key resource_id_of_yojson "GroupId" _list path;
     identity_store_id = value_for_key identity_store_id_of_yojson "IdentityStoreId" _list path;
   }
    : get_group_id_response)

let get_group_id_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     identity_store_id = value_for_key identity_store_id_of_yojson "IdentityStoreId" _list path;
     alternate_identifier =
       value_for_key alternate_identifier_of_yojson "AlternateIdentifier" _list path;
   }
    : get_group_id_request)

let access_denied_exception_reason_of_yojson (tree : t) path =
  ((match tree with
    | `String "KMS_ACCESS_DENIED" -> KMS_ACCESS_DENIED
    | `String value ->
        raise (deserialize_unknown_enum_value_error path "AccessDeniedExceptionReason" value)
    | _ -> raise (deserialize_wrong_type_error path "AccessDeniedExceptionReason")
     : access_denied_exception_reason)
    : access_denied_exception_reason)

let access_denied_exception_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     message = option_of_yojson (value_for_key exception_message_of_yojson "Message") _list path;
     request_id = option_of_yojson (value_for_key request_id_of_yojson "RequestId") _list path;
     reason =
       option_of_yojson (value_for_key access_denied_exception_reason_of_yojson "Reason") _list path;
   }
    : access_denied_exception)

let sensitive_string_type_of_yojson = string_of_yojson

let address_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     street_address =
       option_of_yojson (value_for_key sensitive_string_type_of_yojson "StreetAddress") _list path;
     locality =
       option_of_yojson (value_for_key sensitive_string_type_of_yojson "Locality") _list path;
     region = option_of_yojson (value_for_key sensitive_string_type_of_yojson "Region") _list path;
     postal_code =
       option_of_yojson (value_for_key sensitive_string_type_of_yojson "PostalCode") _list path;
     country = option_of_yojson (value_for_key sensitive_string_type_of_yojson "Country") _list path;
     formatted =
       option_of_yojson (value_for_key sensitive_string_type_of_yojson "Formatted") _list path;
     type_ = option_of_yojson (value_for_key sensitive_string_type_of_yojson "Type") _list path;
     primary = option_of_yojson (value_for_key boolean_type_of_yojson "Primary") _list path;
   }
    : address)

let addresses_of_yojson tree path = list_of_yojson address_of_yojson tree path

let attribute_operation_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     attribute_path = value_for_key attribute_path_of_yojson "AttributePath" _list path;
     attribute_value =
       option_of_yojson (value_for_key attribute_value_of_yojson "AttributeValue") _list path;
   }
    : attribute_operation)

let attribute_operations_of_yojson tree path =
  list_of_yojson attribute_operation_of_yojson tree path

let conflict_exception_reason_of_yojson (tree : t) path =
  ((match tree with
    | `String "UNIQUENESS_CONSTRAINT_VIOLATION" -> UNIQUENESS_CONSTRAINT_VIOLATION
    | `String "CONCURRENT_MODIFICATION" -> CONCURRENT_MODIFICATION
    | `String value ->
        raise (deserialize_unknown_enum_value_error path "ConflictExceptionReason" value)
    | _ -> raise (deserialize_wrong_type_error path "ConflictExceptionReason")
     : conflict_exception_reason)
    : conflict_exception_reason)

let conflict_exception_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     message = option_of_yojson (value_for_key exception_message_of_yojson "Message") _list path;
     request_id = option_of_yojson (value_for_key request_id_of_yojson "RequestId") _list path;
     reason =
       option_of_yojson (value_for_key conflict_exception_reason_of_yojson "Reason") _list path;
   }
    : conflict_exception)

let service_quota_exceeded_exception_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     message = option_of_yojson (value_for_key exception_message_of_yojson "Message") _list path;
     request_id = option_of_yojson (value_for_key request_id_of_yojson "RequestId") _list path;
   }
    : service_quota_exceeded_exception)

let create_group_response_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     group_id = value_for_key resource_id_of_yojson "GroupId" _list path;
     identity_store_id = value_for_key identity_store_id_of_yojson "IdentityStoreId" _list path;
   }
    : create_group_response)

let group_display_name_of_yojson = string_of_yojson

let create_group_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     identity_store_id = value_for_key identity_store_id_of_yojson "IdentityStoreId" _list path;
     display_name =
       option_of_yojson (value_for_key group_display_name_of_yojson "DisplayName") _list path;
     description =
       option_of_yojson (value_for_key sensitive_string_type_of_yojson "Description") _list path;
   }
    : create_group_request)

let create_group_membership_response_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     membership_id = value_for_key resource_id_of_yojson "MembershipId" _list path;
     identity_store_id = value_for_key identity_store_id_of_yojson "IdentityStoreId" _list path;
   }
    : create_group_membership_response)

let create_group_membership_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     identity_store_id = value_for_key identity_store_id_of_yojson "IdentityStoreId" _list path;
     group_id = value_for_key resource_id_of_yojson "GroupId" _list path;
     member_id = value_for_key member_id_of_yojson "MemberId" _list path;
   }
    : create_group_membership_request)

let create_user_response_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     identity_store_id = value_for_key identity_store_id_of_yojson "IdentityStoreId" _list path;
     user_id = value_for_key resource_id_of_yojson "UserId" _list path;
   }
    : create_user_response)

let extension_name_of_yojson = string_of_yojson

let extensions_of_yojson tree path =
  map_of_yojson extension_name_of_yojson attribute_value_of_yojson tree path

let role_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     value = option_of_yojson (value_for_key sensitive_string_type_of_yojson "Value") _list path;
     type_ = option_of_yojson (value_for_key sensitive_string_type_of_yojson "Type") _list path;
     primary = option_of_yojson (value_for_key boolean_type_of_yojson "Primary") _list path;
   }
    : role)

let roles_of_yojson tree path = list_of_yojson role_of_yojson tree path

let photo_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     value = value_for_key sensitive_string_type_of_yojson "Value" _list path;
     type_ = option_of_yojson (value_for_key sensitive_string_type_of_yojson "Type") _list path;
     display = option_of_yojson (value_for_key sensitive_string_type_of_yojson "Display") _list path;
     primary = option_of_yojson (value_for_key boolean_type_of_yojson "Primary") _list path;
   }
    : photo)

let photos_of_yojson tree path = list_of_yojson photo_of_yojson tree path

let phone_number_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     value = option_of_yojson (value_for_key sensitive_string_type_of_yojson "Value") _list path;
     type_ = option_of_yojson (value_for_key sensitive_string_type_of_yojson "Type") _list path;
     primary = option_of_yojson (value_for_key boolean_type_of_yojson "Primary") _list path;
   }
    : phone_number)

let phone_numbers_of_yojson tree path = list_of_yojson phone_number_of_yojson tree path

let email_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     value = option_of_yojson (value_for_key sensitive_string_type_of_yojson "Value") _list path;
     type_ = option_of_yojson (value_for_key sensitive_string_type_of_yojson "Type") _list path;
     primary = option_of_yojson (value_for_key boolean_type_of_yojson "Primary") _list path;
   }
    : email)

let emails_of_yojson tree path = list_of_yojson email_of_yojson tree path

let name_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     formatted =
       option_of_yojson (value_for_key sensitive_string_type_of_yojson "Formatted") _list path;
     family_name =
       option_of_yojson (value_for_key sensitive_string_type_of_yojson "FamilyName") _list path;
     given_name =
       option_of_yojson (value_for_key sensitive_string_type_of_yojson "GivenName") _list path;
     middle_name =
       option_of_yojson (value_for_key sensitive_string_type_of_yojson "MiddleName") _list path;
     honorific_prefix =
       option_of_yojson (value_for_key sensitive_string_type_of_yojson "HonorificPrefix") _list path;
     honorific_suffix =
       option_of_yojson (value_for_key sensitive_string_type_of_yojson "HonorificSuffix") _list path;
   }
    : name)

let user_name_of_yojson = string_of_yojson

let create_user_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     identity_store_id = value_for_key identity_store_id_of_yojson "IdentityStoreId" _list path;
     user_name = option_of_yojson (value_for_key user_name_of_yojson "UserName") _list path;
     name = option_of_yojson (value_for_key name_of_yojson "Name") _list path;
     display_name =
       option_of_yojson (value_for_key sensitive_string_type_of_yojson "DisplayName") _list path;
     nick_name =
       option_of_yojson (value_for_key sensitive_string_type_of_yojson "NickName") _list path;
     profile_url =
       option_of_yojson (value_for_key sensitive_string_type_of_yojson "ProfileUrl") _list path;
     emails = option_of_yojson (value_for_key emails_of_yojson "Emails") _list path;
     addresses = option_of_yojson (value_for_key addresses_of_yojson "Addresses") _list path;
     phone_numbers =
       option_of_yojson (value_for_key phone_numbers_of_yojson "PhoneNumbers") _list path;
     user_type =
       option_of_yojson (value_for_key sensitive_string_type_of_yojson "UserType") _list path;
     title = option_of_yojson (value_for_key sensitive_string_type_of_yojson "Title") _list path;
     preferred_language =
       option_of_yojson
         (value_for_key sensitive_string_type_of_yojson "PreferredLanguage")
         _list path;
     locale = option_of_yojson (value_for_key sensitive_string_type_of_yojson "Locale") _list path;
     timezone =
       option_of_yojson (value_for_key sensitive_string_type_of_yojson "Timezone") _list path;
     photos = option_of_yojson (value_for_key photos_of_yojson "Photos") _list path;
     website = option_of_yojson (value_for_key sensitive_string_type_of_yojson "Website") _list path;
     birthdate =
       option_of_yojson (value_for_key sensitive_string_type_of_yojson "Birthdate") _list path;
     roles = option_of_yojson (value_for_key roles_of_yojson "Roles") _list path;
     extensions = option_of_yojson (value_for_key extensions_of_yojson "Extensions") _list path;
   }
    : create_user_request)

let delete_group_response_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  (() : unit)

let delete_group_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     identity_store_id = value_for_key identity_store_id_of_yojson "IdentityStoreId" _list path;
     group_id = value_for_key resource_id_of_yojson "GroupId" _list path;
   }
    : delete_group_request)

let delete_group_membership_response_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  (() : unit)

let delete_group_membership_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     identity_store_id = value_for_key identity_store_id_of_yojson "IdentityStoreId" _list path;
     membership_id = value_for_key resource_id_of_yojson "MembershipId" _list path;
   }
    : delete_group_membership_request)

let delete_user_response_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  (() : unit)

let delete_user_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     identity_store_id = value_for_key identity_store_id_of_yojson "IdentityStoreId" _list path;
     user_id = value_for_key resource_id_of_yojson "UserId" _list path;
   }
    : delete_user_request)

let external_ids_of_yojson tree path = list_of_yojson external_id_of_yojson tree path

let describe_group_response_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     group_id = value_for_key resource_id_of_yojson "GroupId" _list path;
     display_name =
       option_of_yojson (value_for_key group_display_name_of_yojson "DisplayName") _list path;
     external_ids = option_of_yojson (value_for_key external_ids_of_yojson "ExternalIds") _list path;
     description =
       option_of_yojson (value_for_key sensitive_string_type_of_yojson "Description") _list path;
     created_at = option_of_yojson (value_for_key date_type_of_yojson "CreatedAt") _list path;
     updated_at = option_of_yojson (value_for_key date_type_of_yojson "UpdatedAt") _list path;
     created_by = option_of_yojson (value_for_key string_type_of_yojson "CreatedBy") _list path;
     updated_by = option_of_yojson (value_for_key string_type_of_yojson "UpdatedBy") _list path;
     identity_store_id = value_for_key identity_store_id_of_yojson "IdentityStoreId" _list path;
   }
    : describe_group_response)

let describe_group_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     identity_store_id = value_for_key identity_store_id_of_yojson "IdentityStoreId" _list path;
     group_id = value_for_key resource_id_of_yojson "GroupId" _list path;
   }
    : describe_group_request)

let describe_group_membership_response_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     identity_store_id = value_for_key identity_store_id_of_yojson "IdentityStoreId" _list path;
     membership_id = value_for_key resource_id_of_yojson "MembershipId" _list path;
     group_id = value_for_key resource_id_of_yojson "GroupId" _list path;
     member_id = value_for_key member_id_of_yojson "MemberId" _list path;
     created_at = option_of_yojson (value_for_key date_type_of_yojson "CreatedAt") _list path;
     updated_at = option_of_yojson (value_for_key date_type_of_yojson "UpdatedAt") _list path;
     created_by = option_of_yojson (value_for_key string_type_of_yojson "CreatedBy") _list path;
     updated_by = option_of_yojson (value_for_key string_type_of_yojson "UpdatedBy") _list path;
   }
    : describe_group_membership_response)

let describe_group_membership_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     identity_store_id = value_for_key identity_store_id_of_yojson "IdentityStoreId" _list path;
     membership_id = value_for_key resource_id_of_yojson "MembershipId" _list path;
   }
    : describe_group_membership_request)

let user_status_of_yojson (tree : t) path =
  ((match tree with
    | `String "ENABLED" -> ENABLED
    | `String "DISABLED" -> DISABLED
    | `String value -> raise (deserialize_unknown_enum_value_error path "UserStatus" value)
    | _ -> raise (deserialize_wrong_type_error path "UserStatus")
     : user_status)
    : user_status)

let describe_user_response_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     identity_store_id = value_for_key identity_store_id_of_yojson "IdentityStoreId" _list path;
     user_id = value_for_key resource_id_of_yojson "UserId" _list path;
     user_name = option_of_yojson (value_for_key user_name_of_yojson "UserName") _list path;
     external_ids = option_of_yojson (value_for_key external_ids_of_yojson "ExternalIds") _list path;
     name = option_of_yojson (value_for_key name_of_yojson "Name") _list path;
     display_name =
       option_of_yojson (value_for_key sensitive_string_type_of_yojson "DisplayName") _list path;
     nick_name =
       option_of_yojson (value_for_key sensitive_string_type_of_yojson "NickName") _list path;
     profile_url =
       option_of_yojson (value_for_key sensitive_string_type_of_yojson "ProfileUrl") _list path;
     emails = option_of_yojson (value_for_key emails_of_yojson "Emails") _list path;
     addresses = option_of_yojson (value_for_key addresses_of_yojson "Addresses") _list path;
     phone_numbers =
       option_of_yojson (value_for_key phone_numbers_of_yojson "PhoneNumbers") _list path;
     user_type =
       option_of_yojson (value_for_key sensitive_string_type_of_yojson "UserType") _list path;
     title = option_of_yojson (value_for_key sensitive_string_type_of_yojson "Title") _list path;
     preferred_language =
       option_of_yojson
         (value_for_key sensitive_string_type_of_yojson "PreferredLanguage")
         _list path;
     locale = option_of_yojson (value_for_key sensitive_string_type_of_yojson "Locale") _list path;
     timezone =
       option_of_yojson (value_for_key sensitive_string_type_of_yojson "Timezone") _list path;
     user_status = option_of_yojson (value_for_key user_status_of_yojson "UserStatus") _list path;
     photos = option_of_yojson (value_for_key photos_of_yojson "Photos") _list path;
     website = option_of_yojson (value_for_key sensitive_string_type_of_yojson "Website") _list path;
     birthdate =
       option_of_yojson (value_for_key sensitive_string_type_of_yojson "Birthdate") _list path;
     roles = option_of_yojson (value_for_key roles_of_yojson "Roles") _list path;
     created_at = option_of_yojson (value_for_key date_type_of_yojson "CreatedAt") _list path;
     created_by = option_of_yojson (value_for_key string_type_of_yojson "CreatedBy") _list path;
     updated_at = option_of_yojson (value_for_key date_type_of_yojson "UpdatedAt") _list path;
     updated_by = option_of_yojson (value_for_key string_type_of_yojson "UpdatedBy") _list path;
     extensions = option_of_yojson (value_for_key extensions_of_yojson "Extensions") _list path;
   }
    : describe_user_response)

let extension_names_of_yojson tree path = list_of_yojson extension_name_of_yojson tree path

let describe_user_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     identity_store_id = value_for_key identity_store_id_of_yojson "IdentityStoreId" _list path;
     user_id = value_for_key resource_id_of_yojson "UserId" _list path;
     extensions = option_of_yojson (value_for_key extension_names_of_yojson "Extensions") _list path;
   }
    : describe_user_request)

let filter_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     attribute_path = value_for_key attribute_path_of_yojson "AttributePath" _list path;
     attribute_value = value_for_key sensitive_string_type_of_yojson "AttributeValue" _list path;
   }
    : filter)

let filters_of_yojson tree path = list_of_yojson filter_of_yojson tree path

let group_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     group_id = value_for_key resource_id_of_yojson "GroupId" _list path;
     display_name =
       option_of_yojson (value_for_key group_display_name_of_yojson "DisplayName") _list path;
     external_ids = option_of_yojson (value_for_key external_ids_of_yojson "ExternalIds") _list path;
     description =
       option_of_yojson (value_for_key sensitive_string_type_of_yojson "Description") _list path;
     created_at = option_of_yojson (value_for_key date_type_of_yojson "CreatedAt") _list path;
     updated_at = option_of_yojson (value_for_key date_type_of_yojson "UpdatedAt") _list path;
     created_by = option_of_yojson (value_for_key string_type_of_yojson "CreatedBy") _list path;
     updated_by = option_of_yojson (value_for_key string_type_of_yojson "UpdatedBy") _list path;
     identity_store_id = value_for_key identity_store_id_of_yojson "IdentityStoreId" _list path;
   }
    : group)

let groups_of_yojson tree path = list_of_yojson group_of_yojson tree path
let retry_after_seconds_of_yojson = int_of_yojson

let internal_server_exception_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     message = option_of_yojson (value_for_key exception_message_of_yojson "Message") _list path;
     request_id = option_of_yojson (value_for_key request_id_of_yojson "RequestId") _list path;
     retry_after_seconds =
       option_of_yojson (value_for_key retry_after_seconds_of_yojson "RetryAfterSeconds") _list path;
   }
    : internal_server_exception)

let list_group_memberships_response_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     group_memberships = value_for_key group_memberships_of_yojson "GroupMemberships" _list path;
     next_token = option_of_yojson (value_for_key next_token_of_yojson "NextToken") _list path;
   }
    : list_group_memberships_response)

let list_group_memberships_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     identity_store_id = value_for_key identity_store_id_of_yojson "IdentityStoreId" _list path;
     group_id = value_for_key resource_id_of_yojson "GroupId" _list path;
     max_results = option_of_yojson (value_for_key max_results_of_yojson "MaxResults") _list path;
     next_token = option_of_yojson (value_for_key next_token_of_yojson "NextToken") _list path;
   }
    : list_group_memberships_request)

let list_groups_response_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     groups = value_for_key groups_of_yojson "Groups" _list path;
     next_token = option_of_yojson (value_for_key next_token_of_yojson "NextToken") _list path;
   }
    : list_groups_response)

let list_groups_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     identity_store_id = value_for_key identity_store_id_of_yojson "IdentityStoreId" _list path;
     max_results = option_of_yojson (value_for_key max_results_of_yojson "MaxResults") _list path;
     next_token = option_of_yojson (value_for_key next_token_of_yojson "NextToken") _list path;
     filters = option_of_yojson (value_for_key filters_of_yojson "Filters") _list path;
   }
    : list_groups_request)

let user_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     identity_store_id = value_for_key identity_store_id_of_yojson "IdentityStoreId" _list path;
     user_id = value_for_key resource_id_of_yojson "UserId" _list path;
     user_name = option_of_yojson (value_for_key user_name_of_yojson "UserName") _list path;
     external_ids = option_of_yojson (value_for_key external_ids_of_yojson "ExternalIds") _list path;
     name = option_of_yojson (value_for_key name_of_yojson "Name") _list path;
     display_name =
       option_of_yojson (value_for_key sensitive_string_type_of_yojson "DisplayName") _list path;
     nick_name =
       option_of_yojson (value_for_key sensitive_string_type_of_yojson "NickName") _list path;
     profile_url =
       option_of_yojson (value_for_key sensitive_string_type_of_yojson "ProfileUrl") _list path;
     emails = option_of_yojson (value_for_key emails_of_yojson "Emails") _list path;
     addresses = option_of_yojson (value_for_key addresses_of_yojson "Addresses") _list path;
     phone_numbers =
       option_of_yojson (value_for_key phone_numbers_of_yojson "PhoneNumbers") _list path;
     user_type =
       option_of_yojson (value_for_key sensitive_string_type_of_yojson "UserType") _list path;
     title = option_of_yojson (value_for_key sensitive_string_type_of_yojson "Title") _list path;
     preferred_language =
       option_of_yojson
         (value_for_key sensitive_string_type_of_yojson "PreferredLanguage")
         _list path;
     locale = option_of_yojson (value_for_key sensitive_string_type_of_yojson "Locale") _list path;
     timezone =
       option_of_yojson (value_for_key sensitive_string_type_of_yojson "Timezone") _list path;
     user_status = option_of_yojson (value_for_key user_status_of_yojson "UserStatus") _list path;
     photos = option_of_yojson (value_for_key photos_of_yojson "Photos") _list path;
     website = option_of_yojson (value_for_key sensitive_string_type_of_yojson "Website") _list path;
     birthdate =
       option_of_yojson (value_for_key sensitive_string_type_of_yojson "Birthdate") _list path;
     roles = option_of_yojson (value_for_key roles_of_yojson "Roles") _list path;
     created_at = option_of_yojson (value_for_key date_type_of_yojson "CreatedAt") _list path;
     created_by = option_of_yojson (value_for_key string_type_of_yojson "CreatedBy") _list path;
     updated_at = option_of_yojson (value_for_key date_type_of_yojson "UpdatedAt") _list path;
     updated_by = option_of_yojson (value_for_key string_type_of_yojson "UpdatedBy") _list path;
     extensions = option_of_yojson (value_for_key extensions_of_yojson "Extensions") _list path;
   }
    : user)

let users_of_yojson tree path = list_of_yojson user_of_yojson tree path

let list_users_response_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     users = value_for_key users_of_yojson "Users" _list path;
     next_token = option_of_yojson (value_for_key next_token_of_yojson "NextToken") _list path;
   }
    : list_users_response)

let list_users_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     identity_store_id = value_for_key identity_store_id_of_yojson "IdentityStoreId" _list path;
     extensions = option_of_yojson (value_for_key extension_names_of_yojson "Extensions") _list path;
     max_results = option_of_yojson (value_for_key max_results_of_yojson "MaxResults") _list path;
     next_token = option_of_yojson (value_for_key next_token_of_yojson "NextToken") _list path;
     filters = option_of_yojson (value_for_key filters_of_yojson "Filters") _list path;
   }
    : list_users_request)

let throttling_exception_reason_of_yojson (tree : t) path =
  ((match tree with
    | `String "KMS_THROTTLING" -> KMS_THROTTLING
    | `String value ->
        raise (deserialize_unknown_enum_value_error path "ThrottlingExceptionReason" value)
    | _ -> raise (deserialize_wrong_type_error path "ThrottlingExceptionReason")
     : throttling_exception_reason)
    : throttling_exception_reason)

let throttling_exception_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     message = option_of_yojson (value_for_key exception_message_of_yojson "Message") _list path;
     request_id = option_of_yojson (value_for_key request_id_of_yojson "RequestId") _list path;
     retry_after_seconds =
       option_of_yojson (value_for_key retry_after_seconds_of_yojson "RetryAfterSeconds") _list path;
     reason =
       option_of_yojson (value_for_key throttling_exception_reason_of_yojson "Reason") _list path;
   }
    : throttling_exception)

let update_group_response_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  (() : unit)

let update_group_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     identity_store_id = value_for_key identity_store_id_of_yojson "IdentityStoreId" _list path;
     group_id = value_for_key resource_id_of_yojson "GroupId" _list path;
     operations = value_for_key attribute_operations_of_yojson "Operations" _list path;
   }
    : update_group_request)

let update_user_response_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  (() : unit)

let update_user_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     identity_store_id = value_for_key identity_store_id_of_yojson "IdentityStoreId" _list path;
     user_id = value_for_key resource_id_of_yojson "UserId" _list path;
     operations = value_for_key attribute_operations_of_yojson "Operations" _list path;
   }
    : update_user_request)
