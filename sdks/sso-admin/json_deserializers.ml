open Smaws_Lib.Json.DeserializeHelpers
open Types

let validation_exception_reason_of_yojson (tree : t) path =
  ((match tree with
    | `String "KMS_DisabledException" -> KMS_DISABLED_EXCEPTION
    | `String "KMS_InvalidStateException" -> KMS_INVALID_STATE_EXCEPTION
    | `String "KMS_InvalidKeyUsageException" -> KMS_INVALID_KEY_USAGE_EXCEPTION
    | `String value ->
        raise (deserialize_unknown_enum_value_error path "ValidationExceptionReason" value)
    | _ -> raise (deserialize_wrong_type_error path "ValidationExceptionReason")
     : validation_exception_reason)
    : validation_exception_reason)

let validation_exception_message_of_yojson = string_of_yojson

let validation_exception_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     reason =
       option_of_yojson (value_for_key validation_exception_reason_of_yojson "Reason") _list path;
     message =
       option_of_yojson (value_for_key validation_exception_message_of_yojson "Message") _list path;
   }
    : validation_exception)

let user_background_session_application_status_of_yojson (tree : t) path =
  ((match tree with
    | `String "DISABLED" -> DISABLED
    | `String "ENABLED" -> ENABLED
    | `String value ->
        raise
          (deserialize_unknown_enum_value_error path "UserBackgroundSessionApplicationStatus" value)
    | _ -> raise (deserialize_wrong_type_error path "UserBackgroundSessionApplicationStatus")
     : user_background_session_application_status)
    : user_background_session_application_status)

let update_trusted_token_issuer_response_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  (() : unit)

let trusted_token_issuer_arn_of_yojson = string_of_yojson
let trusted_token_issuer_name_of_yojson = string_of_yojson
let claim_attribute_path_of_yojson = string_of_yojson
let jmes_path_of_yojson = string_of_yojson

let jwks_retrieval_option_of_yojson (tree : t) path =
  ((match tree with
    | `String "OPEN_ID_DISCOVERY" -> OPEN_ID_DISCOVERY
    | `String value -> raise (deserialize_unknown_enum_value_error path "JwksRetrievalOption" value)
    | _ -> raise (deserialize_wrong_type_error path "JwksRetrievalOption")
     : jwks_retrieval_option)
    : jwks_retrieval_option)

let oidc_jwt_update_configuration_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     jwks_retrieval_option =
       option_of_yojson
         (value_for_key jwks_retrieval_option_of_yojson "JwksRetrievalOption")
         _list path;
     identity_store_attribute_path =
       option_of_yojson (value_for_key jmes_path_of_yojson "IdentityStoreAttributePath") _list path;
     claim_attribute_path =
       option_of_yojson
         (value_for_key claim_attribute_path_of_yojson "ClaimAttributePath")
         _list path;
   }
    : oidc_jwt_update_configuration)

let trusted_token_issuer_update_configuration_of_yojson (tree : t) path =
  let _list = assoc_of_yojson tree path in
  let key, value_ =
    match _list with
    | (key, value_) :: _ -> (key, value_)
    | _ -> raise (deserialize_wrong_type_error path "union")
  in
  (match key with
   | "OidcJwtConfiguration" ->
       OidcJwtConfiguration (oidc_jwt_update_configuration_of_yojson value_ path)
   | _ as unknown ->
       raise
         (deserialize_unknown_enum_value_error path "TrustedTokenIssuerUpdateConfiguration" unknown)
    : trusted_token_issuer_update_configuration)

let update_trusted_token_issuer_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     trusted_token_issuer_configuration =
       option_of_yojson
         (value_for_key trusted_token_issuer_update_configuration_of_yojson
            "TrustedTokenIssuerConfiguration")
         _list path;
     name = option_of_yojson (value_for_key trusted_token_issuer_name_of_yojson "Name") _list path;
     trusted_token_issuer_arn =
       value_for_key trusted_token_issuer_arn_of_yojson "TrustedTokenIssuerArn" _list path;
   }
    : update_trusted_token_issuer_request)

let throttling_exception_message_of_yojson = string_of_yojson

let throttling_exception_reason_of_yojson (tree : t) path =
  ((match tree with
    | `String "KMS_ThrottlingException" -> KMS_THROTTLING_EXCEPTION
    | `String value ->
        raise (deserialize_unknown_enum_value_error path "ThrottlingExceptionReason" value)
    | _ -> raise (deserialize_wrong_type_error path "ThrottlingExceptionReason")
     : throttling_exception_reason)
    : throttling_exception_reason)

let throttling_exception_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     reason =
       option_of_yojson (value_for_key throttling_exception_reason_of_yojson "Reason") _list path;
     message =
       option_of_yojson (value_for_key throttling_exception_message_of_yojson "Message") _list path;
   }
    : throttling_exception)

let resource_not_found_message_of_yojson = string_of_yojson

let resource_not_found_exception_reason_of_yojson (tree : t) path =
  ((match tree with
    | `String "KMS_NotFoundException" -> KMS_NOT_FOUND_EXCEPTION
    | `String value ->
        raise (deserialize_unknown_enum_value_error path "ResourceNotFoundExceptionReason" value)
    | _ -> raise (deserialize_wrong_type_error path "ResourceNotFoundExceptionReason")
     : resource_not_found_exception_reason)
    : resource_not_found_exception_reason)

let resource_not_found_exception_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     reason =
       option_of_yojson
         (value_for_key resource_not_found_exception_reason_of_yojson "Reason")
         _list path;
     message =
       option_of_yojson (value_for_key resource_not_found_message_of_yojson "Message") _list path;
   }
    : resource_not_found_exception)

let internal_failure_message_of_yojson = string_of_yojson

let internal_server_exception_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     message =
       option_of_yojson (value_for_key internal_failure_message_of_yojson "Message") _list path;
   }
    : internal_server_exception)

let conflict_exception_message_of_yojson = string_of_yojson

let conflict_exception_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     message =
       option_of_yojson (value_for_key conflict_exception_message_of_yojson "Message") _list path;
   }
    : conflict_exception)

let access_denied_exception_message_of_yojson = string_of_yojson

let access_denied_exception_reason_of_yojson (tree : t) path =
  ((match tree with
    | `String "KMS_AccessDeniedException" -> KMS_ACCESS_DENIED_EXCEPTION
    | `String value ->
        raise (deserialize_unknown_enum_value_error path "AccessDeniedExceptionReason" value)
    | _ -> raise (deserialize_wrong_type_error path "AccessDeniedExceptionReason")
     : access_denied_exception_reason)
    : access_denied_exception_reason)

let access_denied_exception_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     reason =
       option_of_yojson (value_for_key access_denied_exception_reason_of_yojson "Reason") _list path;
     message =
       option_of_yojson
         (value_for_key access_denied_exception_message_of_yojson "Message")
         _list path;
   }
    : access_denied_exception)

let update_permission_set_response_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  (() : unit)

let instance_arn_of_yojson = string_of_yojson
let permission_set_arn_of_yojson = string_of_yojson
let permission_set_description_of_yojson = string_of_yojson
let duration_of_yojson = string_of_yojson
let relay_state_of_yojson = string_of_yojson

let update_permission_set_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     relay_state = option_of_yojson (value_for_key relay_state_of_yojson "RelayState") _list path;
     session_duration =
       option_of_yojson (value_for_key duration_of_yojson "SessionDuration") _list path;
     description =
       option_of_yojson
         (value_for_key permission_set_description_of_yojson "Description")
         _list path;
     permission_set_arn = value_for_key permission_set_arn_of_yojson "PermissionSetArn" _list path;
     instance_arn = value_for_key instance_arn_of_yojson "InstanceArn" _list path;
   }
    : update_permission_set_request)

let update_instance_response_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  (() : unit)

let name_type_of_yojson = string_of_yojson

let kms_key_type_of_yojson (tree : t) path =
  ((match tree with
    | `String "CUSTOMER_MANAGED_KEY" -> CUSTOMER_MANAGED_KEY
    | `String "AWS_OWNED_KMS_KEY" -> AWS_OWNED_KMS_KEY
    | `String value -> raise (deserialize_unknown_enum_value_error path "KmsKeyType" value)
    | _ -> raise (deserialize_wrong_type_error path "KmsKeyType")
     : kms_key_type)
    : kms_key_type)

let kms_key_arn_of_yojson = string_of_yojson

let encryption_configuration_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     kms_key_arn = option_of_yojson (value_for_key kms_key_arn_of_yojson "KmsKeyArn") _list path;
     key_type = value_for_key kms_key_type_of_yojson "KeyType" _list path;
   }
    : encryption_configuration)

let update_instance_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     encryption_configuration =
       option_of_yojson
         (value_for_key encryption_configuration_of_yojson "EncryptionConfiguration")
         _list path;
     instance_arn = value_for_key instance_arn_of_yojson "InstanceArn" _list path;
     name = option_of_yojson (value_for_key name_type_of_yojson "Name") _list path;
   }
    : update_instance_request)

let update_instance_access_control_attribute_configuration_response_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  (() : unit)

let access_control_attribute_key_of_yojson = string_of_yojson
let access_control_attribute_value_source_of_yojson = string_of_yojson

let access_control_attribute_value_source_list_of_yojson tree path =
  list_of_yojson access_control_attribute_value_source_of_yojson tree path

let access_control_attribute_value_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     source = value_for_key access_control_attribute_value_source_list_of_yojson "Source" _list path;
   }
    : access_control_attribute_value)

let access_control_attribute_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     value = value_for_key access_control_attribute_value_of_yojson "Value" _list path;
     key = value_for_key access_control_attribute_key_of_yojson "Key" _list path;
   }
    : access_control_attribute)

let access_control_attribute_list_of_yojson tree path =
  list_of_yojson access_control_attribute_of_yojson tree path

let instance_access_control_attribute_configuration_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     access_control_attributes =
       value_for_key access_control_attribute_list_of_yojson "AccessControlAttributes" _list path;
   }
    : instance_access_control_attribute_configuration)

let update_instance_access_control_attribute_configuration_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     instance_access_control_attribute_configuration =
       value_for_key instance_access_control_attribute_configuration_of_yojson
         "InstanceAccessControlAttributeConfiguration" _list path;
     instance_arn = value_for_key instance_arn_of_yojson "InstanceArn" _list path;
   }
    : update_instance_access_control_attribute_configuration_request)

let update_application_response_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  (() : unit)

let application_arn_of_yojson = string_of_yojson
let application_name_type_of_yojson = string_of_yojson
let description_of_yojson = string_of_yojson

let application_status_of_yojson (tree : t) path =
  ((match tree with
    | `String "DISABLED" -> DISABLED
    | `String "ENABLED" -> ENABLED
    | `String value -> raise (deserialize_unknown_enum_value_error path "ApplicationStatus" value)
    | _ -> raise (deserialize_wrong_type_error path "ApplicationStatus")
     : application_status)
    : application_status)

let sign_in_origin_of_yojson (tree : t) path =
  ((match tree with
    | `String "APPLICATION" -> APPLICATION
    | `String "IDENTITY_CENTER" -> IDENTITY_CENTER
    | `String value -> raise (deserialize_unknown_enum_value_error path "SignInOrigin" value)
    | _ -> raise (deserialize_wrong_type_error path "SignInOrigin")
     : sign_in_origin)
    : sign_in_origin)

let application_url_of_yojson = string_of_yojson

let sign_in_options_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     application_url =
       option_of_yojson (value_for_key application_url_of_yojson "ApplicationUrl") _list path;
     origin = value_for_key sign_in_origin_of_yojson "Origin" _list path;
   }
    : sign_in_options)

let update_application_portal_options_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     sign_in_options =
       option_of_yojson (value_for_key sign_in_options_of_yojson "SignInOptions") _list path;
   }
    : update_application_portal_options)

let update_application_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     portal_options =
       option_of_yojson
         (value_for_key update_application_portal_options_of_yojson "PortalOptions")
         _list path;
     status = option_of_yojson (value_for_key application_status_of_yojson "Status") _list path;
     description = option_of_yojson (value_for_key description_of_yojson "Description") _list path;
     name = option_of_yojson (value_for_key application_name_type_of_yojson "Name") _list path;
     application_arn = value_for_key application_arn_of_yojson "ApplicationArn" _list path;
   }
    : update_application_request)

let untag_resource_response_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  (() : unit)

let taggable_resource_arn_of_yojson = string_of_yojson
let tag_key_of_yojson = string_of_yojson
let tag_key_list_of_yojson tree path = list_of_yojson tag_key_of_yojson tree path

let untag_resource_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     tag_keys = value_for_key tag_key_list_of_yojson "TagKeys" _list path;
     resource_arn = value_for_key taggable_resource_arn_of_yojson "ResourceArn" _list path;
     instance_arn = option_of_yojson (value_for_key instance_arn_of_yojson "InstanceArn") _list path;
   }
    : untag_resource_request)

let uu_id_of_yojson = string_of_yojson
let ur_i_of_yojson = string_of_yojson
let trusted_token_issuer_url_of_yojson = string_of_yojson

let trusted_token_issuer_type_of_yojson (tree : t) path =
  ((match tree with
    | `String "OIDC_JWT" -> OIDC_JWT
    | `String value ->
        raise (deserialize_unknown_enum_value_error path "TrustedTokenIssuerType" value)
    | _ -> raise (deserialize_wrong_type_error path "TrustedTokenIssuerType")
     : trusted_token_issuer_type)
    : trusted_token_issuer_type)

let trusted_token_issuer_metadata_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     trusted_token_issuer_type =
       option_of_yojson
         (value_for_key trusted_token_issuer_type_of_yojson "TrustedTokenIssuerType")
         _list path;
     name = option_of_yojson (value_for_key trusted_token_issuer_name_of_yojson "Name") _list path;
     trusted_token_issuer_arn =
       option_of_yojson
         (value_for_key trusted_token_issuer_arn_of_yojson "TrustedTokenIssuerArn")
         _list path;
   }
    : trusted_token_issuer_metadata)

let trusted_token_issuer_list_of_yojson tree path =
  list_of_yojson trusted_token_issuer_metadata_of_yojson tree path

let oidc_jwt_configuration_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     jwks_retrieval_option =
       value_for_key jwks_retrieval_option_of_yojson "JwksRetrievalOption" _list path;
     identity_store_attribute_path =
       value_for_key jmes_path_of_yojson "IdentityStoreAttributePath" _list path;
     claim_attribute_path =
       value_for_key claim_attribute_path_of_yojson "ClaimAttributePath" _list path;
     issuer_url = value_for_key trusted_token_issuer_url_of_yojson "IssuerUrl" _list path;
   }
    : oidc_jwt_configuration)

let trusted_token_issuer_configuration_of_yojson (tree : t) path =
  let _list = assoc_of_yojson tree path in
  let key, value_ =
    match _list with
    | (key, value_) :: _ -> (key, value_)
    | _ -> raise (deserialize_wrong_type_error path "union")
  in
  (match key with
   | "OidcJwtConfiguration" -> OidcJwtConfiguration (oidc_jwt_configuration_of_yojson value_ path)
   | _ as unknown ->
       raise (deserialize_unknown_enum_value_error path "TrustedTokenIssuerConfiguration" unknown)
    : trusted_token_issuer_configuration)

let token_issuer_audience_of_yojson = string_of_yojson

let token_issuer_audiences_of_yojson tree path =
  list_of_yojson token_issuer_audience_of_yojson tree path

let token_exchange_grant_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  (() : unit)

let token_of_yojson = string_of_yojson

let target_type_of_yojson (tree : t) path =
  ((match tree with
    | `String "AWS_ACCOUNT" -> AWS_ACCOUNT
    | `String value -> raise (deserialize_unknown_enum_value_error path "TargetType" value)
    | _ -> raise (deserialize_wrong_type_error path "TargetType")
     : target_type)
    : target_type)

let target_id_of_yojson = string_of_yojson
let tag_value_of_yojson = string_of_yojson

let tag_resource_response_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  (() : unit)

let tag_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     value = value_for_key tag_value_of_yojson "Value" _list path;
     key = value_for_key tag_key_of_yojson "Key" _list path;
   }
    : tag)

let tag_list_of_yojson tree path = list_of_yojson tag_of_yojson tree path

let tag_resource_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     tags = value_for_key tag_list_of_yojson "Tags" _list path;
     resource_arn = value_for_key taggable_resource_arn_of_yojson "ResourceArn" _list path;
     instance_arn = option_of_yojson (value_for_key instance_arn_of_yojson "InstanceArn") _list path;
   }
    : tag_resource_request)

let service_quota_exceeded_message_of_yojson = string_of_yojson

let service_quota_exceeded_exception_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     message =
       option_of_yojson
         (value_for_key service_quota_exceeded_message_of_yojson "Message")
         _list path;
   }
    : service_quota_exceeded_exception)

let status_values_of_yojson (tree : t) path =
  ((match tree with
    | `String "SUCCEEDED" -> SUCCEEDED
    | `String "FAILED" -> FAILED
    | `String "IN_PROGRESS" -> IN_PROGRESS
    | `String value -> raise (deserialize_unknown_enum_value_error path "StatusValues" value)
    | _ -> raise (deserialize_wrong_type_error path "StatusValues")
     : status_values)
    : status_values)

let scope_of_yojson = string_of_yojson
let scope_target_of_yojson = string_of_yojson
let scope_targets_of_yojson tree path = list_of_yojson scope_target_of_yojson tree path

let scope_details_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     authorized_targets =
       option_of_yojson (value_for_key scope_targets_of_yojson "AuthorizedTargets") _list path;
     scope = value_for_key scope_of_yojson "Scope" _list path;
   }
    : scope_details)

let scopes_of_yojson tree path = list_of_yojson scope_details_of_yojson tree path

let region_status_of_yojson (tree : t) path =
  ((match tree with
    | `String "REMOVING" -> REMOVING
    | `String "ADDING" -> ADDING
    | `String "ACTIVE" -> ACTIVE
    | `String value -> raise (deserialize_unknown_enum_value_error path "RegionStatus" value)
    | _ -> raise (deserialize_wrong_type_error path "RegionStatus")
     : region_status)
    : region_status)

let remove_region_response_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({ status = option_of_yojson (value_for_key region_status_of_yojson "Status") _list path }
    : remove_region_response)

let region_name_of_yojson = string_of_yojson

let remove_region_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     region_name = value_for_key region_name_of_yojson "RegionName" _list path;
     instance_arn = value_for_key instance_arn_of_yojson "InstanceArn" _list path;
   }
    : remove_region_request)

let put_permissions_boundary_to_permission_set_response_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  (() : unit)

let managed_policy_name_of_yojson = string_of_yojson
let managed_policy_path_of_yojson = string_of_yojson

let customer_managed_policy_reference_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     path = option_of_yojson (value_for_key managed_policy_path_of_yojson "Path") _list path;
     name = value_for_key managed_policy_name_of_yojson "Name" _list path;
   }
    : customer_managed_policy_reference)

let managed_policy_arn_of_yojson = string_of_yojson

let permissions_boundary_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     managed_policy_arn =
       option_of_yojson (value_for_key managed_policy_arn_of_yojson "ManagedPolicyArn") _list path;
     customer_managed_policy_reference =
       option_of_yojson
         (value_for_key customer_managed_policy_reference_of_yojson "CustomerManagedPolicyReference")
         _list path;
   }
    : permissions_boundary)

let put_permissions_boundary_to_permission_set_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     permissions_boundary =
       value_for_key permissions_boundary_of_yojson "PermissionsBoundary" _list path;
     permission_set_arn = value_for_key permission_set_arn_of_yojson "PermissionSetArn" _list path;
     instance_arn = value_for_key instance_arn_of_yojson "InstanceArn" _list path;
   }
    : put_permissions_boundary_to_permission_set_request)

let put_inline_policy_to_permission_set_response_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  (() : unit)

let permission_set_policy_document_of_yojson = string_of_yojson

let put_inline_policy_to_permission_set_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     inline_policy =
       value_for_key permission_set_policy_document_of_yojson "InlinePolicy" _list path;
     permission_set_arn = value_for_key permission_set_arn_of_yojson "PermissionSetArn" _list path;
     instance_arn = value_for_key instance_arn_of_yojson "InstanceArn" _list path;
   }
    : put_inline_policy_to_permission_set_request)

let put_application_session_configuration_response_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  (() : unit)

let put_application_session_configuration_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     user_background_session_application_status =
       option_of_yojson
         (value_for_key user_background_session_application_status_of_yojson
            "UserBackgroundSessionApplicationStatus")
         _list path;
     application_arn = value_for_key application_arn_of_yojson "ApplicationArn" _list path;
   }
    : put_application_session_configuration_request)

let put_application_assignment_configuration_response_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  (() : unit)

let assignment_required_of_yojson = bool_of_yojson

let put_application_assignment_configuration_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     assignment_required =
       value_for_key assignment_required_of_yojson "AssignmentRequired" _list path;
     application_arn = value_for_key application_arn_of_yojson "ApplicationArn" _list path;
   }
    : put_application_assignment_configuration_request)

let account_id_of_yojson = string_of_yojson
let reason_of_yojson = string_of_yojson
let date_of_yojson = timestamp_epoch_seconds_of_yojson

let permission_set_provisioning_status_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     created_date = option_of_yojson (value_for_key date_of_yojson "CreatedDate") _list path;
     failure_reason = option_of_yojson (value_for_key reason_of_yojson "FailureReason") _list path;
     permission_set_arn =
       option_of_yojson (value_for_key permission_set_arn_of_yojson "PermissionSetArn") _list path;
     account_id = option_of_yojson (value_for_key account_id_of_yojson "AccountId") _list path;
     request_id = option_of_yojson (value_for_key uu_id_of_yojson "RequestId") _list path;
     status = option_of_yojson (value_for_key status_values_of_yojson "Status") _list path;
   }
    : permission_set_provisioning_status)

let provision_permission_set_response_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     permission_set_provisioning_status =
       option_of_yojson
         (value_for_key permission_set_provisioning_status_of_yojson
            "PermissionSetProvisioningStatus")
         _list path;
   }
    : provision_permission_set_response)

let provision_target_type_of_yojson (tree : t) path =
  ((match tree with
    | `String "ALL_PROVISIONED_ACCOUNTS" -> ALL_PROVISIONED_ACCOUNTS
    | `String "AWS_ACCOUNT" -> AWS_ACCOUNT
    | `String value -> raise (deserialize_unknown_enum_value_error path "ProvisionTargetType" value)
    | _ -> raise (deserialize_wrong_type_error path "ProvisionTargetType")
     : provision_target_type)
    : provision_target_type)

let provision_permission_set_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     target_type = value_for_key provision_target_type_of_yojson "TargetType" _list path;
     target_id = option_of_yojson (value_for_key target_id_of_yojson "TargetId") _list path;
     permission_set_arn = value_for_key permission_set_arn_of_yojson "PermissionSetArn" _list path;
     instance_arn = value_for_key instance_arn_of_yojson "InstanceArn" _list path;
   }
    : provision_permission_set_request)

let list_trusted_token_issuers_response_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     next_token = option_of_yojson (value_for_key token_of_yojson "NextToken") _list path;
     trusted_token_issuers =
       option_of_yojson
         (value_for_key trusted_token_issuer_list_of_yojson "TrustedTokenIssuers")
         _list path;
   }
    : list_trusted_token_issuers_response)

let max_results_of_yojson = int_of_yojson

let list_trusted_token_issuers_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     next_token = option_of_yojson (value_for_key token_of_yojson "NextToken") _list path;
     max_results = option_of_yojson (value_for_key max_results_of_yojson "MaxResults") _list path;
     instance_arn = value_for_key instance_arn_of_yojson "InstanceArn" _list path;
   }
    : list_trusted_token_issuers_request)

let list_tags_for_resource_response_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     next_token = option_of_yojson (value_for_key token_of_yojson "NextToken") _list path;
     tags = option_of_yojson (value_for_key tag_list_of_yojson "Tags") _list path;
   }
    : list_tags_for_resource_response)

let list_tags_for_resource_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     next_token = option_of_yojson (value_for_key token_of_yojson "NextToken") _list path;
     resource_arn = value_for_key taggable_resource_arn_of_yojson "ResourceArn" _list path;
     instance_arn = option_of_yojson (value_for_key instance_arn_of_yojson "InstanceArn") _list path;
   }
    : list_tags_for_resource_request)

let is_primary_region_of_yojson = bool_of_yojson

let region_metadata_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     is_primary_region =
       option_of_yojson (value_for_key is_primary_region_of_yojson "IsPrimaryRegion") _list path;
     added_date = option_of_yojson (value_for_key date_of_yojson "AddedDate") _list path;
     status = option_of_yojson (value_for_key region_status_of_yojson "Status") _list path;
     region_name = option_of_yojson (value_for_key region_name_of_yojson "RegionName") _list path;
   }
    : region_metadata)

let region_metadata_list_of_yojson tree path = list_of_yojson region_metadata_of_yojson tree path

let list_regions_response_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     next_token = option_of_yojson (value_for_key token_of_yojson "NextToken") _list path;
     regions = option_of_yojson (value_for_key region_metadata_list_of_yojson "Regions") _list path;
   }
    : list_regions_response)

let list_regions_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     next_token = option_of_yojson (value_for_key token_of_yojson "NextToken") _list path;
     max_results = option_of_yojson (value_for_key max_results_of_yojson "MaxResults") _list path;
     instance_arn = value_for_key instance_arn_of_yojson "InstanceArn" _list path;
   }
    : list_regions_request)

let permission_set_list_of_yojson tree path = list_of_yojson permission_set_arn_of_yojson tree path

let list_permission_sets_provisioned_to_account_response_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     permission_sets =
       option_of_yojson (value_for_key permission_set_list_of_yojson "PermissionSets") _list path;
     next_token = option_of_yojson (value_for_key token_of_yojson "NextToken") _list path;
   }
    : list_permission_sets_provisioned_to_account_response)

let provisioning_status_of_yojson (tree : t) path =
  ((match tree with
    | `String "LATEST_PERMISSION_SET_NOT_PROVISIONED" -> LATEST_PERMISSION_SET_NOT_PROVISIONED
    | `String "LATEST_PERMISSION_SET_PROVISIONED" -> LATEST_PERMISSION_SET_PROVISIONED
    | `String value -> raise (deserialize_unknown_enum_value_error path "ProvisioningStatus" value)
    | _ -> raise (deserialize_wrong_type_error path "ProvisioningStatus")
     : provisioning_status)
    : provisioning_status)

let list_permission_sets_provisioned_to_account_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     next_token = option_of_yojson (value_for_key token_of_yojson "NextToken") _list path;
     max_results = option_of_yojson (value_for_key max_results_of_yojson "MaxResults") _list path;
     provisioning_status =
       option_of_yojson
         (value_for_key provisioning_status_of_yojson "ProvisioningStatus")
         _list path;
     account_id = value_for_key account_id_of_yojson "AccountId" _list path;
     instance_arn = value_for_key instance_arn_of_yojson "InstanceArn" _list path;
   }
    : list_permission_sets_provisioned_to_account_request)

let list_permission_sets_response_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     next_token = option_of_yojson (value_for_key token_of_yojson "NextToken") _list path;
     permission_sets =
       option_of_yojson (value_for_key permission_set_list_of_yojson "PermissionSets") _list path;
   }
    : list_permission_sets_response)

let list_permission_sets_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     max_results = option_of_yojson (value_for_key max_results_of_yojson "MaxResults") _list path;
     next_token = option_of_yojson (value_for_key token_of_yojson "NextToken") _list path;
     instance_arn = value_for_key instance_arn_of_yojson "InstanceArn" _list path;
   }
    : list_permission_sets_request)

let permission_set_provisioning_status_metadata_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     created_date = option_of_yojson (value_for_key date_of_yojson "CreatedDate") _list path;
     request_id = option_of_yojson (value_for_key uu_id_of_yojson "RequestId") _list path;
     status = option_of_yojson (value_for_key status_values_of_yojson "Status") _list path;
   }
    : permission_set_provisioning_status_metadata)

let permission_set_provisioning_status_list_of_yojson tree path =
  list_of_yojson permission_set_provisioning_status_metadata_of_yojson tree path

let list_permission_set_provisioning_status_response_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     next_token = option_of_yojson (value_for_key token_of_yojson "NextToken") _list path;
     permission_sets_provisioning_status =
       option_of_yojson
         (value_for_key permission_set_provisioning_status_list_of_yojson
            "PermissionSetsProvisioningStatus")
         _list path;
   }
    : list_permission_set_provisioning_status_response)

let operation_status_filter_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({ status = option_of_yojson (value_for_key status_values_of_yojson "Status") _list path }
    : operation_status_filter)

let list_permission_set_provisioning_status_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     filter = option_of_yojson (value_for_key operation_status_filter_of_yojson "Filter") _list path;
     next_token = option_of_yojson (value_for_key token_of_yojson "NextToken") _list path;
     max_results = option_of_yojson (value_for_key max_results_of_yojson "MaxResults") _list path;
     instance_arn = value_for_key instance_arn_of_yojson "InstanceArn" _list path;
   }
    : list_permission_set_provisioning_status_request)

let name_of_yojson = string_of_yojson

let attached_managed_policy_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     arn = option_of_yojson (value_for_key managed_policy_arn_of_yojson "Arn") _list path;
     name = option_of_yojson (value_for_key name_of_yojson "Name") _list path;
   }
    : attached_managed_policy)

let attached_managed_policy_list_of_yojson tree path =
  list_of_yojson attached_managed_policy_of_yojson tree path

let list_managed_policies_in_permission_set_response_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     next_token = option_of_yojson (value_for_key token_of_yojson "NextToken") _list path;
     attached_managed_policies =
       option_of_yojson
         (value_for_key attached_managed_policy_list_of_yojson "AttachedManagedPolicies")
         _list path;
   }
    : list_managed_policies_in_permission_set_response)

let list_managed_policies_in_permission_set_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     next_token = option_of_yojson (value_for_key token_of_yojson "NextToken") _list path;
     max_results = option_of_yojson (value_for_key max_results_of_yojson "MaxResults") _list path;
     permission_set_arn = value_for_key permission_set_arn_of_yojson "PermissionSetArn" _list path;
     instance_arn = value_for_key instance_arn_of_yojson "InstanceArn" _list path;
   }
    : list_managed_policies_in_permission_set_request)

let id_of_yojson = string_of_yojson

let instance_status_of_yojson (tree : t) path =
  ((match tree with
    | `String "ACTIVE" -> ACTIVE
    | `String "DELETE_IN_PROGRESS" -> DELETE_IN_PROGRESS
    | `String "CREATE_FAILED" -> CREATE_FAILED
    | `String "CREATE_IN_PROGRESS" -> CREATE_IN_PROGRESS
    | `String value -> raise (deserialize_unknown_enum_value_error path "InstanceStatus" value)
    | _ -> raise (deserialize_wrong_type_error path "InstanceStatus")
     : instance_status)
    : instance_status)

let instance_metadata_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     regions = option_of_yojson (value_for_key region_metadata_list_of_yojson "Regions") _list path;
     primary_region =
       option_of_yojson (value_for_key region_name_of_yojson "PrimaryRegion") _list path;
     status_reason = option_of_yojson (value_for_key reason_of_yojson "StatusReason") _list path;
     status = option_of_yojson (value_for_key instance_status_of_yojson "Status") _list path;
     created_date = option_of_yojson (value_for_key date_of_yojson "CreatedDate") _list path;
     name = option_of_yojson (value_for_key name_type_of_yojson "Name") _list path;
     owner_account_id =
       option_of_yojson (value_for_key account_id_of_yojson "OwnerAccountId") _list path;
     identity_store_id = option_of_yojson (value_for_key id_of_yojson "IdentityStoreId") _list path;
     instance_arn = option_of_yojson (value_for_key instance_arn_of_yojson "InstanceArn") _list path;
   }
    : instance_metadata)

let instance_list_of_yojson tree path = list_of_yojson instance_metadata_of_yojson tree path

let list_instances_response_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     next_token = option_of_yojson (value_for_key token_of_yojson "NextToken") _list path;
     instances = option_of_yojson (value_for_key instance_list_of_yojson "Instances") _list path;
   }
    : list_instances_response)

let list_instances_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     next_token = option_of_yojson (value_for_key token_of_yojson "NextToken") _list path;
     max_results = option_of_yojson (value_for_key max_results_of_yojson "MaxResults") _list path;
   }
    : list_instances_request)

let customer_managed_policy_reference_list_of_yojson tree path =
  list_of_yojson customer_managed_policy_reference_of_yojson tree path

let list_customer_managed_policy_references_in_permission_set_response_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     next_token = option_of_yojson (value_for_key token_of_yojson "NextToken") _list path;
     customer_managed_policy_references =
       option_of_yojson
         (value_for_key customer_managed_policy_reference_list_of_yojson
            "CustomerManagedPolicyReferences")
         _list path;
   }
    : list_customer_managed_policy_references_in_permission_set_response)

let list_customer_managed_policy_references_in_permission_set_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     next_token = option_of_yojson (value_for_key token_of_yojson "NextToken") _list path;
     max_results = option_of_yojson (value_for_key max_results_of_yojson "MaxResults") _list path;
     permission_set_arn = value_for_key permission_set_arn_of_yojson "PermissionSetArn" _list path;
     instance_arn = value_for_key instance_arn_of_yojson "InstanceArn" _list path;
   }
    : list_customer_managed_policy_references_in_permission_set_request)

let application_provider_arn_of_yojson = string_of_yojson
let identity_store_arn_of_yojson = string_of_yojson

let application_visibility_of_yojson (tree : t) path =
  ((match tree with
    | `String "DISABLED" -> DISABLED
    | `String "ENABLED" -> ENABLED
    | `String value ->
        raise (deserialize_unknown_enum_value_error path "ApplicationVisibility" value)
    | _ -> raise (deserialize_wrong_type_error path "ApplicationVisibility")
     : application_visibility)
    : application_visibility)

let portal_options_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     visibility =
       option_of_yojson (value_for_key application_visibility_of_yojson "Visibility") _list path;
     sign_in_options =
       option_of_yojson (value_for_key sign_in_options_of_yojson "SignInOptions") _list path;
   }
    : portal_options)

let application_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     created_from = option_of_yojson (value_for_key region_name_of_yojson "CreatedFrom") _list path;
     created_date = option_of_yojson (value_for_key date_of_yojson "CreatedDate") _list path;
     description = option_of_yojson (value_for_key description_of_yojson "Description") _list path;
     portal_options =
       option_of_yojson (value_for_key portal_options_of_yojson "PortalOptions") _list path;
     status = option_of_yojson (value_for_key application_status_of_yojson "Status") _list path;
     identity_store_arn =
       option_of_yojson (value_for_key identity_store_arn_of_yojson "IdentityStoreArn") _list path;
     instance_arn = option_of_yojson (value_for_key instance_arn_of_yojson "InstanceArn") _list path;
     application_account =
       option_of_yojson (value_for_key account_id_of_yojson "ApplicationAccount") _list path;
     name = option_of_yojson (value_for_key application_name_type_of_yojson "Name") _list path;
     application_provider_arn =
       option_of_yojson
         (value_for_key application_provider_arn_of_yojson "ApplicationProviderArn")
         _list path;
     application_arn =
       option_of_yojson (value_for_key application_arn_of_yojson "ApplicationArn") _list path;
   }
    : application)

let application_list_of_yojson tree path = list_of_yojson application_of_yojson tree path

let list_applications_response_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     next_token = option_of_yojson (value_for_key token_of_yojson "NextToken") _list path;
     applications =
       option_of_yojson (value_for_key application_list_of_yojson "Applications") _list path;
   }
    : list_applications_response)

let list_applications_filter_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     application_provider =
       option_of_yojson
         (value_for_key application_provider_arn_of_yojson "ApplicationProvider")
         _list path;
     application_account =
       option_of_yojson (value_for_key account_id_of_yojson "ApplicationAccount") _list path;
   }
    : list_applications_filter)

let list_applications_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     filter =
       option_of_yojson (value_for_key list_applications_filter_of_yojson "Filter") _list path;
     next_token = option_of_yojson (value_for_key token_of_yojson "NextToken") _list path;
     max_results = option_of_yojson (value_for_key max_results_of_yojson "MaxResults") _list path;
     instance_arn = value_for_key instance_arn_of_yojson "InstanceArn" _list path;
   }
    : list_applications_request)

let federation_protocol_of_yojson (tree : t) path =
  ((match tree with
    | `String "OAUTH" -> OAUTH
    | `String "SAML" -> SAML
    | `String value -> raise (deserialize_unknown_enum_value_error path "FederationProtocol" value)
    | _ -> raise (deserialize_wrong_type_error path "FederationProtocol")
     : federation_protocol)
    : federation_protocol)

let icon_url_of_yojson = string_of_yojson

let display_data_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     description = option_of_yojson (value_for_key description_of_yojson "Description") _list path;
     icon_url = option_of_yojson (value_for_key icon_url_of_yojson "IconUrl") _list path;
     display_name = option_of_yojson (value_for_key name_of_yojson "DisplayName") _list path;
   }
    : display_data)

let resource_server_scope_details_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     detailed_title =
       option_of_yojson (value_for_key description_of_yojson "DetailedTitle") _list path;
     long_description =
       option_of_yojson (value_for_key description_of_yojson "LongDescription") _list path;
   }
    : resource_server_scope_details)

let resource_server_scope_of_yojson = string_of_yojson

let resource_server_scopes_of_yojson tree path =
  map_of_yojson resource_server_scope_of_yojson resource_server_scope_details_of_yojson tree path

let resource_server_config_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     scopes = option_of_yojson (value_for_key resource_server_scopes_of_yojson "Scopes") _list path;
   }
    : resource_server_config)

let application_provider_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     resource_server_config =
       option_of_yojson
         (value_for_key resource_server_config_of_yojson "ResourceServerConfig")
         _list path;
     display_data = option_of_yojson (value_for_key display_data_of_yojson "DisplayData") _list path;
     federation_protocol =
       option_of_yojson
         (value_for_key federation_protocol_of_yojson "FederationProtocol")
         _list path;
     application_provider_arn =
       value_for_key application_provider_arn_of_yojson "ApplicationProviderArn" _list path;
   }
    : application_provider)

let application_provider_list_of_yojson tree path =
  list_of_yojson application_provider_of_yojson tree path

let list_application_providers_response_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     next_token = option_of_yojson (value_for_key token_of_yojson "NextToken") _list path;
     application_providers =
       option_of_yojson
         (value_for_key application_provider_list_of_yojson "ApplicationProviders")
         _list path;
   }
    : list_application_providers_response)

let list_application_providers_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     next_token = option_of_yojson (value_for_key token_of_yojson "NextToken") _list path;
     max_results = option_of_yojson (value_for_key max_results_of_yojson "MaxResults") _list path;
   }
    : list_application_providers_request)

let principal_id_of_yojson = string_of_yojson

let principal_type_of_yojson (tree : t) path =
  ((match tree with
    | `String "GROUP" -> GROUP
    | `String "USER" -> USER
    | `String value -> raise (deserialize_unknown_enum_value_error path "PrincipalType" value)
    | _ -> raise (deserialize_wrong_type_error path "PrincipalType")
     : principal_type)
    : principal_type)

let application_assignment_for_principal_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     principal_type =
       option_of_yojson (value_for_key principal_type_of_yojson "PrincipalType") _list path;
     principal_id = option_of_yojson (value_for_key principal_id_of_yojson "PrincipalId") _list path;
     application_arn =
       option_of_yojson (value_for_key application_arn_of_yojson "ApplicationArn") _list path;
   }
    : application_assignment_for_principal)

let application_assignment_list_for_principal_of_yojson tree path =
  list_of_yojson application_assignment_for_principal_of_yojson tree path

let list_application_assignments_for_principal_response_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     next_token = option_of_yojson (value_for_key token_of_yojson "NextToken") _list path;
     application_assignments =
       option_of_yojson
         (value_for_key application_assignment_list_for_principal_of_yojson "ApplicationAssignments")
         _list path;
   }
    : list_application_assignments_for_principal_response)

let list_application_assignments_filter_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     application_arn =
       option_of_yojson (value_for_key application_arn_of_yojson "ApplicationArn") _list path;
   }
    : list_application_assignments_filter)

let list_application_assignments_for_principal_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     max_results = option_of_yojson (value_for_key max_results_of_yojson "MaxResults") _list path;
     next_token = option_of_yojson (value_for_key token_of_yojson "NextToken") _list path;
     filter =
       option_of_yojson
         (value_for_key list_application_assignments_filter_of_yojson "Filter")
         _list path;
     principal_type = value_for_key principal_type_of_yojson "PrincipalType" _list path;
     principal_id = value_for_key principal_id_of_yojson "PrincipalId" _list path;
     instance_arn = value_for_key instance_arn_of_yojson "InstanceArn" _list path;
   }
    : list_application_assignments_for_principal_request)

let application_assignment_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     principal_type = value_for_key principal_type_of_yojson "PrincipalType" _list path;
     principal_id = value_for_key principal_id_of_yojson "PrincipalId" _list path;
     application_arn = value_for_key application_arn_of_yojson "ApplicationArn" _list path;
   }
    : application_assignment)

let application_assignments_list_of_yojson tree path =
  list_of_yojson application_assignment_of_yojson tree path

let list_application_assignments_response_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     next_token = option_of_yojson (value_for_key token_of_yojson "NextToken") _list path;
     application_assignments =
       option_of_yojson
         (value_for_key application_assignments_list_of_yojson "ApplicationAssignments")
         _list path;
   }
    : list_application_assignments_response)

let list_application_assignments_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     next_token = option_of_yojson (value_for_key token_of_yojson "NextToken") _list path;
     max_results = option_of_yojson (value_for_key max_results_of_yojson "MaxResults") _list path;
     application_arn = value_for_key application_arn_of_yojson "ApplicationArn" _list path;
   }
    : list_application_assignments_request)

let account_list_of_yojson tree path = list_of_yojson account_id_of_yojson tree path

let list_accounts_for_provisioned_permission_set_response_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     next_token = option_of_yojson (value_for_key token_of_yojson "NextToken") _list path;
     account_ids = option_of_yojson (value_for_key account_list_of_yojson "AccountIds") _list path;
   }
    : list_accounts_for_provisioned_permission_set_response)

let list_accounts_for_provisioned_permission_set_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     next_token = option_of_yojson (value_for_key token_of_yojson "NextToken") _list path;
     max_results = option_of_yojson (value_for_key max_results_of_yojson "MaxResults") _list path;
     provisioning_status =
       option_of_yojson
         (value_for_key provisioning_status_of_yojson "ProvisioningStatus")
         _list path;
     permission_set_arn = value_for_key permission_set_arn_of_yojson "PermissionSetArn" _list path;
     instance_arn = value_for_key instance_arn_of_yojson "InstanceArn" _list path;
   }
    : list_accounts_for_provisioned_permission_set_request)

let account_assignment_for_principal_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     principal_type =
       option_of_yojson (value_for_key principal_type_of_yojson "PrincipalType") _list path;
     principal_id = option_of_yojson (value_for_key principal_id_of_yojson "PrincipalId") _list path;
     permission_set_arn =
       option_of_yojson (value_for_key permission_set_arn_of_yojson "PermissionSetArn") _list path;
     account_id = option_of_yojson (value_for_key account_id_of_yojson "AccountId") _list path;
   }
    : account_assignment_for_principal)

let account_assignment_list_for_principal_of_yojson tree path =
  list_of_yojson account_assignment_for_principal_of_yojson tree path

let list_account_assignments_for_principal_response_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     next_token = option_of_yojson (value_for_key token_of_yojson "NextToken") _list path;
     account_assignments =
       option_of_yojson
         (value_for_key account_assignment_list_for_principal_of_yojson "AccountAssignments")
         _list path;
   }
    : list_account_assignments_for_principal_response)

let list_account_assignments_filter_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({ account_id = option_of_yojson (value_for_key account_id_of_yojson "AccountId") _list path }
    : list_account_assignments_filter)

let list_account_assignments_for_principal_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     max_results = option_of_yojson (value_for_key max_results_of_yojson "MaxResults") _list path;
     next_token = option_of_yojson (value_for_key token_of_yojson "NextToken") _list path;
     filter =
       option_of_yojson
         (value_for_key list_account_assignments_filter_of_yojson "Filter")
         _list path;
     principal_type = value_for_key principal_type_of_yojson "PrincipalType" _list path;
     principal_id = value_for_key principal_id_of_yojson "PrincipalId" _list path;
     instance_arn = value_for_key instance_arn_of_yojson "InstanceArn" _list path;
   }
    : list_account_assignments_for_principal_request)

let account_assignment_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     principal_id = option_of_yojson (value_for_key principal_id_of_yojson "PrincipalId") _list path;
     principal_type =
       option_of_yojson (value_for_key principal_type_of_yojson "PrincipalType") _list path;
     permission_set_arn =
       option_of_yojson (value_for_key permission_set_arn_of_yojson "PermissionSetArn") _list path;
     account_id = option_of_yojson (value_for_key account_id_of_yojson "AccountId") _list path;
   }
    : account_assignment)

let account_assignment_list_of_yojson tree path =
  list_of_yojson account_assignment_of_yojson tree path

let list_account_assignments_response_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     next_token = option_of_yojson (value_for_key token_of_yojson "NextToken") _list path;
     account_assignments =
       option_of_yojson
         (value_for_key account_assignment_list_of_yojson "AccountAssignments")
         _list path;
   }
    : list_account_assignments_response)

let list_account_assignments_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     next_token = option_of_yojson (value_for_key token_of_yojson "NextToken") _list path;
     max_results = option_of_yojson (value_for_key max_results_of_yojson "MaxResults") _list path;
     permission_set_arn = value_for_key permission_set_arn_of_yojson "PermissionSetArn" _list path;
     account_id = value_for_key target_id_of_yojson "AccountId" _list path;
     instance_arn = value_for_key instance_arn_of_yojson "InstanceArn" _list path;
   }
    : list_account_assignments_request)

let account_assignment_operation_status_metadata_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     created_date = option_of_yojson (value_for_key date_of_yojson "CreatedDate") _list path;
     request_id = option_of_yojson (value_for_key uu_id_of_yojson "RequestId") _list path;
     status = option_of_yojson (value_for_key status_values_of_yojson "Status") _list path;
   }
    : account_assignment_operation_status_metadata)

let account_assignment_operation_status_list_of_yojson tree path =
  list_of_yojson account_assignment_operation_status_metadata_of_yojson tree path

let list_account_assignment_deletion_status_response_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     next_token = option_of_yojson (value_for_key token_of_yojson "NextToken") _list path;
     account_assignments_deletion_status =
       option_of_yojson
         (value_for_key account_assignment_operation_status_list_of_yojson
            "AccountAssignmentsDeletionStatus")
         _list path;
   }
    : list_account_assignment_deletion_status_response)

let list_account_assignment_deletion_status_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     filter = option_of_yojson (value_for_key operation_status_filter_of_yojson "Filter") _list path;
     next_token = option_of_yojson (value_for_key token_of_yojson "NextToken") _list path;
     max_results = option_of_yojson (value_for_key max_results_of_yojson "MaxResults") _list path;
     instance_arn = value_for_key instance_arn_of_yojson "InstanceArn" _list path;
   }
    : list_account_assignment_deletion_status_request)

let list_account_assignment_creation_status_response_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     next_token = option_of_yojson (value_for_key token_of_yojson "NextToken") _list path;
     account_assignments_creation_status =
       option_of_yojson
         (value_for_key account_assignment_operation_status_list_of_yojson
            "AccountAssignmentsCreationStatus")
         _list path;
   }
    : list_account_assignment_creation_status_response)

let list_account_assignment_creation_status_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     filter = option_of_yojson (value_for_key operation_status_filter_of_yojson "Filter") _list path;
     next_token = option_of_yojson (value_for_key token_of_yojson "NextToken") _list path;
     max_results = option_of_yojson (value_for_key max_results_of_yojson "MaxResults") _list path;
     instance_arn = value_for_key instance_arn_of_yojson "InstanceArn" _list path;
   }
    : list_account_assignment_creation_status_request)

let get_permissions_boundary_for_permission_set_response_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     permissions_boundary =
       option_of_yojson
         (value_for_key permissions_boundary_of_yojson "PermissionsBoundary")
         _list path;
   }
    : get_permissions_boundary_for_permission_set_response)

let get_permissions_boundary_for_permission_set_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     permission_set_arn = value_for_key permission_set_arn_of_yojson "PermissionSetArn" _list path;
     instance_arn = value_for_key instance_arn_of_yojson "InstanceArn" _list path;
   }
    : get_permissions_boundary_for_permission_set_request)

let get_inline_policy_for_permission_set_response_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     inline_policy =
       option_of_yojson
         (value_for_key permission_set_policy_document_of_yojson "InlinePolicy")
         _list path;
   }
    : get_inline_policy_for_permission_set_response)

let get_inline_policy_for_permission_set_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     permission_set_arn = value_for_key permission_set_arn_of_yojson "PermissionSetArn" _list path;
     instance_arn = value_for_key instance_arn_of_yojson "InstanceArn" _list path;
   }
    : get_inline_policy_for_permission_set_request)

let get_application_session_configuration_response_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     user_background_session_application_status =
       option_of_yojson
         (value_for_key user_background_session_application_status_of_yojson
            "UserBackgroundSessionApplicationStatus")
         _list path;
   }
    : get_application_session_configuration_response)

let get_application_session_configuration_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({ application_arn = value_for_key application_arn_of_yojson "ApplicationArn" _list path }
    : get_application_session_configuration_request)

let get_application_assignment_configuration_response_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     assignment_required =
       value_for_key assignment_required_of_yojson "AssignmentRequired" _list path;
   }
    : get_application_assignment_configuration_response)

let get_application_assignment_configuration_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({ application_arn = value_for_key application_arn_of_yojson "ApplicationArn" _list path }
    : get_application_assignment_configuration_request)

let detach_managed_policy_from_permission_set_response_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  (() : unit)

let detach_managed_policy_from_permission_set_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     managed_policy_arn = value_for_key managed_policy_arn_of_yojson "ManagedPolicyArn" _list path;
     permission_set_arn = value_for_key permission_set_arn_of_yojson "PermissionSetArn" _list path;
     instance_arn = value_for_key instance_arn_of_yojson "InstanceArn" _list path;
   }
    : detach_managed_policy_from_permission_set_request)

let detach_customer_managed_policy_reference_from_permission_set_response_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  (() : unit)

let detach_customer_managed_policy_reference_from_permission_set_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     customer_managed_policy_reference =
       value_for_key customer_managed_policy_reference_of_yojson "CustomerManagedPolicyReference"
         _list path;
     permission_set_arn = value_for_key permission_set_arn_of_yojson "PermissionSetArn" _list path;
     instance_arn = value_for_key instance_arn_of_yojson "InstanceArn" _list path;
   }
    : detach_customer_managed_policy_reference_from_permission_set_request)

let describe_trusted_token_issuer_response_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     trusted_token_issuer_configuration =
       option_of_yojson
         (value_for_key trusted_token_issuer_configuration_of_yojson
            "TrustedTokenIssuerConfiguration")
         _list path;
     trusted_token_issuer_type =
       option_of_yojson
         (value_for_key trusted_token_issuer_type_of_yojson "TrustedTokenIssuerType")
         _list path;
     name = option_of_yojson (value_for_key trusted_token_issuer_name_of_yojson "Name") _list path;
     trusted_token_issuer_arn =
       option_of_yojson
         (value_for_key trusted_token_issuer_arn_of_yojson "TrustedTokenIssuerArn")
         _list path;
   }
    : describe_trusted_token_issuer_response)

let describe_trusted_token_issuer_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     trusted_token_issuer_arn =
       value_for_key trusted_token_issuer_arn_of_yojson "TrustedTokenIssuerArn" _list path;
   }
    : describe_trusted_token_issuer_request)

let describe_region_response_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     is_primary_region =
       option_of_yojson (value_for_key is_primary_region_of_yojson "IsPrimaryRegion") _list path;
     added_date = option_of_yojson (value_for_key date_of_yojson "AddedDate") _list path;
     status = option_of_yojson (value_for_key region_status_of_yojson "Status") _list path;
     region_name = option_of_yojson (value_for_key region_name_of_yojson "RegionName") _list path;
   }
    : describe_region_response)

let describe_region_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     region_name = value_for_key region_name_of_yojson "RegionName" _list path;
     instance_arn = value_for_key instance_arn_of_yojson "InstanceArn" _list path;
   }
    : describe_region_request)

let describe_permission_set_provisioning_status_response_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     permission_set_provisioning_status =
       option_of_yojson
         (value_for_key permission_set_provisioning_status_of_yojson
            "PermissionSetProvisioningStatus")
         _list path;
   }
    : describe_permission_set_provisioning_status_response)

let describe_permission_set_provisioning_status_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     provision_permission_set_request_id =
       value_for_key uu_id_of_yojson "ProvisionPermissionSetRequestId" _list path;
     instance_arn = value_for_key instance_arn_of_yojson "InstanceArn" _list path;
   }
    : describe_permission_set_provisioning_status_request)

let permission_set_name_of_yojson = string_of_yojson

let permission_set_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     relay_state = option_of_yojson (value_for_key relay_state_of_yojson "RelayState") _list path;
     session_duration =
       option_of_yojson (value_for_key duration_of_yojson "SessionDuration") _list path;
     created_date = option_of_yojson (value_for_key date_of_yojson "CreatedDate") _list path;
     description =
       option_of_yojson
         (value_for_key permission_set_description_of_yojson "Description")
         _list path;
     permission_set_arn =
       option_of_yojson (value_for_key permission_set_arn_of_yojson "PermissionSetArn") _list path;
     name = option_of_yojson (value_for_key permission_set_name_of_yojson "Name") _list path;
   }
    : permission_set)

let describe_permission_set_response_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     permission_set =
       option_of_yojson (value_for_key permission_set_of_yojson "PermissionSet") _list path;
   }
    : describe_permission_set_response)

let describe_permission_set_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     permission_set_arn = value_for_key permission_set_arn_of_yojson "PermissionSetArn" _list path;
     instance_arn = value_for_key instance_arn_of_yojson "InstanceArn" _list path;
   }
    : describe_permission_set_request)

let instance_access_control_attribute_configuration_status_of_yojson (tree : t) path =
  ((match tree with
    | `String "CREATION_FAILED" -> CREATION_FAILED
    | `String "CREATION_IN_PROGRESS" -> CREATION_IN_PROGRESS
    | `String "ENABLED" -> ENABLED
    | `String value ->
        raise
          (deserialize_unknown_enum_value_error path
             "InstanceAccessControlAttributeConfigurationStatus" value)
    | _ ->
        raise
          (deserialize_wrong_type_error path "InstanceAccessControlAttributeConfigurationStatus")
     : instance_access_control_attribute_configuration_status)
    : instance_access_control_attribute_configuration_status)

let instance_access_control_attribute_configuration_status_reason_of_yojson = string_of_yojson

let describe_instance_access_control_attribute_configuration_response_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     instance_access_control_attribute_configuration =
       option_of_yojson
         (value_for_key instance_access_control_attribute_configuration_of_yojson
            "InstanceAccessControlAttributeConfiguration")
         _list path;
     status_reason =
       option_of_yojson
         (value_for_key instance_access_control_attribute_configuration_status_reason_of_yojson
            "StatusReason")
         _list path;
     status =
       option_of_yojson
         (value_for_key instance_access_control_attribute_configuration_status_of_yojson "Status")
         _list path;
   }
    : describe_instance_access_control_attribute_configuration_response)

let describe_instance_access_control_attribute_configuration_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({ instance_arn = value_for_key instance_arn_of_yojson "InstanceArn" _list path }
    : describe_instance_access_control_attribute_configuration_request)

let kms_key_status_of_yojson (tree : t) path =
  ((match tree with
    | `String "UPDATE_FAILED" -> UPDATE_FAILED
    | `String "ENABLED" -> ENABLED
    | `String "UPDATING" -> UPDATING
    | `String value -> raise (deserialize_unknown_enum_value_error path "KmsKeyStatus" value)
    | _ -> raise (deserialize_wrong_type_error path "KmsKeyStatus")
     : kms_key_status)
    : kms_key_status)

let encryption_configuration_details_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     encryption_status_reason =
       option_of_yojson (value_for_key reason_of_yojson "EncryptionStatusReason") _list path;
     encryption_status =
       option_of_yojson (value_for_key kms_key_status_of_yojson "EncryptionStatus") _list path;
     kms_key_arn = option_of_yojson (value_for_key kms_key_arn_of_yojson "KmsKeyArn") _list path;
     key_type = option_of_yojson (value_for_key kms_key_type_of_yojson "KeyType") _list path;
   }
    : encryption_configuration_details)

let describe_instance_response_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     encryption_configuration_details =
       option_of_yojson
         (value_for_key encryption_configuration_details_of_yojson "EncryptionConfigurationDetails")
         _list path;
     status_reason = option_of_yojson (value_for_key reason_of_yojson "StatusReason") _list path;
     status = option_of_yojson (value_for_key instance_status_of_yojson "Status") _list path;
     created_date = option_of_yojson (value_for_key date_of_yojson "CreatedDate") _list path;
     name = option_of_yojson (value_for_key name_type_of_yojson "Name") _list path;
     owner_account_id =
       option_of_yojson (value_for_key account_id_of_yojson "OwnerAccountId") _list path;
     identity_store_id = option_of_yojson (value_for_key id_of_yojson "IdentityStoreId") _list path;
     instance_arn = option_of_yojson (value_for_key instance_arn_of_yojson "InstanceArn") _list path;
   }
    : describe_instance_response)

let describe_instance_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({ instance_arn = value_for_key instance_arn_of_yojson "InstanceArn" _list path }
    : describe_instance_request)

let describe_application_provider_response_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     resource_server_config =
       option_of_yojson
         (value_for_key resource_server_config_of_yojson "ResourceServerConfig")
         _list path;
     display_data = option_of_yojson (value_for_key display_data_of_yojson "DisplayData") _list path;
     federation_protocol =
       option_of_yojson
         (value_for_key federation_protocol_of_yojson "FederationProtocol")
         _list path;
     application_provider_arn =
       value_for_key application_provider_arn_of_yojson "ApplicationProviderArn" _list path;
   }
    : describe_application_provider_response)

let describe_application_provider_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     application_provider_arn =
       value_for_key application_provider_arn_of_yojson "ApplicationProviderArn" _list path;
   }
    : describe_application_provider_request)

let describe_application_assignment_response_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     application_arn =
       option_of_yojson (value_for_key application_arn_of_yojson "ApplicationArn") _list path;
     principal_id = option_of_yojson (value_for_key principal_id_of_yojson "PrincipalId") _list path;
     principal_type =
       option_of_yojson (value_for_key principal_type_of_yojson "PrincipalType") _list path;
   }
    : describe_application_assignment_response)

let describe_application_assignment_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     principal_type = value_for_key principal_type_of_yojson "PrincipalType" _list path;
     principal_id = value_for_key principal_id_of_yojson "PrincipalId" _list path;
     application_arn = value_for_key application_arn_of_yojson "ApplicationArn" _list path;
   }
    : describe_application_assignment_request)

let describe_application_response_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     created_from = option_of_yojson (value_for_key region_name_of_yojson "CreatedFrom") _list path;
     created_date = option_of_yojson (value_for_key date_of_yojson "CreatedDate") _list path;
     description = option_of_yojson (value_for_key description_of_yojson "Description") _list path;
     portal_options =
       option_of_yojson (value_for_key portal_options_of_yojson "PortalOptions") _list path;
     status = option_of_yojson (value_for_key application_status_of_yojson "Status") _list path;
     identity_store_arn =
       option_of_yojson (value_for_key identity_store_arn_of_yojson "IdentityStoreArn") _list path;
     instance_arn = option_of_yojson (value_for_key instance_arn_of_yojson "InstanceArn") _list path;
     application_account =
       option_of_yojson (value_for_key account_id_of_yojson "ApplicationAccount") _list path;
     name = option_of_yojson (value_for_key application_name_type_of_yojson "Name") _list path;
     application_provider_arn =
       option_of_yojson
         (value_for_key application_provider_arn_of_yojson "ApplicationProviderArn")
         _list path;
     application_arn =
       option_of_yojson (value_for_key application_arn_of_yojson "ApplicationArn") _list path;
   }
    : describe_application_response)

let describe_application_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({ application_arn = value_for_key application_arn_of_yojson "ApplicationArn" _list path }
    : describe_application_request)

let account_assignment_operation_status_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     created_date = option_of_yojson (value_for_key date_of_yojson "CreatedDate") _list path;
     principal_id = option_of_yojson (value_for_key principal_id_of_yojson "PrincipalId") _list path;
     principal_type =
       option_of_yojson (value_for_key principal_type_of_yojson "PrincipalType") _list path;
     permission_set_arn =
       option_of_yojson (value_for_key permission_set_arn_of_yojson "PermissionSetArn") _list path;
     target_type = option_of_yojson (value_for_key target_type_of_yojson "TargetType") _list path;
     target_id = option_of_yojson (value_for_key target_id_of_yojson "TargetId") _list path;
     failure_reason = option_of_yojson (value_for_key reason_of_yojson "FailureReason") _list path;
     request_id = option_of_yojson (value_for_key uu_id_of_yojson "RequestId") _list path;
     status = option_of_yojson (value_for_key status_values_of_yojson "Status") _list path;
   }
    : account_assignment_operation_status)

let describe_account_assignment_deletion_status_response_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     account_assignment_deletion_status =
       option_of_yojson
         (value_for_key account_assignment_operation_status_of_yojson
            "AccountAssignmentDeletionStatus")
         _list path;
   }
    : describe_account_assignment_deletion_status_response)

let describe_account_assignment_deletion_status_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     account_assignment_deletion_request_id =
       value_for_key uu_id_of_yojson "AccountAssignmentDeletionRequestId" _list path;
     instance_arn = value_for_key instance_arn_of_yojson "InstanceArn" _list path;
   }
    : describe_account_assignment_deletion_status_request)

let describe_account_assignment_creation_status_response_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     account_assignment_creation_status =
       option_of_yojson
         (value_for_key account_assignment_operation_status_of_yojson
            "AccountAssignmentCreationStatus")
         _list path;
   }
    : describe_account_assignment_creation_status_response)

let describe_account_assignment_creation_status_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     account_assignment_creation_request_id =
       value_for_key uu_id_of_yojson "AccountAssignmentCreationRequestId" _list path;
     instance_arn = value_for_key instance_arn_of_yojson "InstanceArn" _list path;
   }
    : describe_account_assignment_creation_status_request)

let delete_trusted_token_issuer_response_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  (() : unit)

let delete_trusted_token_issuer_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     trusted_token_issuer_arn =
       value_for_key trusted_token_issuer_arn_of_yojson "TrustedTokenIssuerArn" _list path;
   }
    : delete_trusted_token_issuer_request)

let delete_permission_set_response_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  (() : unit)

let delete_permission_set_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     permission_set_arn = value_for_key permission_set_arn_of_yojson "PermissionSetArn" _list path;
     instance_arn = value_for_key instance_arn_of_yojson "InstanceArn" _list path;
   }
    : delete_permission_set_request)

let delete_permissions_boundary_from_permission_set_response_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  (() : unit)

let delete_permissions_boundary_from_permission_set_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     permission_set_arn = value_for_key permission_set_arn_of_yojson "PermissionSetArn" _list path;
     instance_arn = value_for_key instance_arn_of_yojson "InstanceArn" _list path;
   }
    : delete_permissions_boundary_from_permission_set_request)

let delete_instance_access_control_attribute_configuration_response_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  (() : unit)

let delete_instance_access_control_attribute_configuration_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({ instance_arn = value_for_key instance_arn_of_yojson "InstanceArn" _list path }
    : delete_instance_access_control_attribute_configuration_request)

let delete_instance_response_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  (() : unit)

let delete_instance_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({ instance_arn = value_for_key instance_arn_of_yojson "InstanceArn" _list path }
    : delete_instance_request)

let delete_inline_policy_from_permission_set_response_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  (() : unit)

let delete_inline_policy_from_permission_set_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     permission_set_arn = value_for_key permission_set_arn_of_yojson "PermissionSetArn" _list path;
     instance_arn = value_for_key instance_arn_of_yojson "InstanceArn" _list path;
   }
    : delete_inline_policy_from_permission_set_request)

let delete_application_assignment_response_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  (() : unit)

let delete_application_assignment_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     principal_type = value_for_key principal_type_of_yojson "PrincipalType" _list path;
     principal_id = value_for_key principal_id_of_yojson "PrincipalId" _list path;
     application_arn = value_for_key application_arn_of_yojson "ApplicationArn" _list path;
   }
    : delete_application_assignment_request)

let delete_application_response_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  (() : unit)

let delete_application_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({ application_arn = value_for_key application_arn_of_yojson "ApplicationArn" _list path }
    : delete_application_request)

let delete_account_assignment_response_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     account_assignment_deletion_status =
       option_of_yojson
         (value_for_key account_assignment_operation_status_of_yojson
            "AccountAssignmentDeletionStatus")
         _list path;
   }
    : delete_account_assignment_response)

let delete_account_assignment_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     principal_id = value_for_key principal_id_of_yojson "PrincipalId" _list path;
     principal_type = value_for_key principal_type_of_yojson "PrincipalType" _list path;
     permission_set_arn = value_for_key permission_set_arn_of_yojson "PermissionSetArn" _list path;
     target_type = value_for_key target_type_of_yojson "TargetType" _list path;
     target_id = value_for_key target_id_of_yojson "TargetId" _list path;
     instance_arn = value_for_key instance_arn_of_yojson "InstanceArn" _list path;
   }
    : delete_account_assignment_request)

let create_trusted_token_issuer_response_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     trusted_token_issuer_arn =
       option_of_yojson
         (value_for_key trusted_token_issuer_arn_of_yojson "TrustedTokenIssuerArn")
         _list path;
   }
    : create_trusted_token_issuer_response)

let client_token_of_yojson = string_of_yojson

let create_trusted_token_issuer_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     tags = option_of_yojson (value_for_key tag_list_of_yojson "Tags") _list path;
     client_token = option_of_yojson (value_for_key client_token_of_yojson "ClientToken") _list path;
     trusted_token_issuer_configuration =
       value_for_key trusted_token_issuer_configuration_of_yojson "TrustedTokenIssuerConfiguration"
         _list path;
     trusted_token_issuer_type =
       value_for_key trusted_token_issuer_type_of_yojson "TrustedTokenIssuerType" _list path;
     name = value_for_key trusted_token_issuer_name_of_yojson "Name" _list path;
     instance_arn = value_for_key instance_arn_of_yojson "InstanceArn" _list path;
   }
    : create_trusted_token_issuer_request)

let create_permission_set_response_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     permission_set =
       option_of_yojson (value_for_key permission_set_of_yojson "PermissionSet") _list path;
   }
    : create_permission_set_response)

let create_permission_set_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     tags = option_of_yojson (value_for_key tag_list_of_yojson "Tags") _list path;
     relay_state = option_of_yojson (value_for_key relay_state_of_yojson "RelayState") _list path;
     session_duration =
       option_of_yojson (value_for_key duration_of_yojson "SessionDuration") _list path;
     instance_arn = value_for_key instance_arn_of_yojson "InstanceArn" _list path;
     description =
       option_of_yojson
         (value_for_key permission_set_description_of_yojson "Description")
         _list path;
     name = value_for_key permission_set_name_of_yojson "Name" _list path;
   }
    : create_permission_set_request)

let create_instance_access_control_attribute_configuration_response_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  (() : unit)

let create_instance_access_control_attribute_configuration_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     instance_access_control_attribute_configuration =
       value_for_key instance_access_control_attribute_configuration_of_yojson
         "InstanceAccessControlAttributeConfiguration" _list path;
     instance_arn = value_for_key instance_arn_of_yojson "InstanceArn" _list path;
   }
    : create_instance_access_control_attribute_configuration_request)

let create_instance_response_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     instance_arn = option_of_yojson (value_for_key instance_arn_of_yojson "InstanceArn") _list path;
   }
    : create_instance_response)

let create_instance_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     tags = option_of_yojson (value_for_key tag_list_of_yojson "Tags") _list path;
     client_token = option_of_yojson (value_for_key client_token_of_yojson "ClientToken") _list path;
     name = option_of_yojson (value_for_key name_type_of_yojson "Name") _list path;
   }
    : create_instance_request)

let create_application_assignment_response_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  (() : unit)

let create_application_assignment_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     principal_type = value_for_key principal_type_of_yojson "PrincipalType" _list path;
     principal_id = value_for_key principal_id_of_yojson "PrincipalId" _list path;
     application_arn = value_for_key application_arn_of_yojson "ApplicationArn" _list path;
   }
    : create_application_assignment_request)

let create_application_response_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     identity_store_arn =
       option_of_yojson (value_for_key identity_store_arn_of_yojson "IdentityStoreArn") _list path;
     instance_arn = option_of_yojson (value_for_key instance_arn_of_yojson "InstanceArn") _list path;
     application_arn =
       option_of_yojson (value_for_key application_arn_of_yojson "ApplicationArn") _list path;
   }
    : create_application_response)

let create_application_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     client_token = option_of_yojson (value_for_key client_token_of_yojson "ClientToken") _list path;
     status = option_of_yojson (value_for_key application_status_of_yojson "Status") _list path;
     tags = option_of_yojson (value_for_key tag_list_of_yojson "Tags") _list path;
     portal_options =
       option_of_yojson (value_for_key portal_options_of_yojson "PortalOptions") _list path;
     description = option_of_yojson (value_for_key description_of_yojson "Description") _list path;
     name = value_for_key application_name_type_of_yojson "Name" _list path;
     application_provider_arn =
       value_for_key application_provider_arn_of_yojson "ApplicationProviderArn" _list path;
     instance_arn = value_for_key instance_arn_of_yojson "InstanceArn" _list path;
   }
    : create_application_request)

let create_account_assignment_response_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     account_assignment_creation_status =
       option_of_yojson
         (value_for_key account_assignment_operation_status_of_yojson
            "AccountAssignmentCreationStatus")
         _list path;
   }
    : create_account_assignment_response)

let create_account_assignment_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     principal_id = value_for_key principal_id_of_yojson "PrincipalId" _list path;
     principal_type = value_for_key principal_type_of_yojson "PrincipalType" _list path;
     permission_set_arn = value_for_key permission_set_arn_of_yojson "PermissionSetArn" _list path;
     target_type = value_for_key target_type_of_yojson "TargetType" _list path;
     target_id = value_for_key target_id_of_yojson "TargetId" _list path;
     instance_arn = value_for_key instance_arn_of_yojson "InstanceArn" _list path;
   }
    : create_account_assignment_request)

let attach_managed_policy_to_permission_set_response_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  (() : unit)

let attach_managed_policy_to_permission_set_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     managed_policy_arn = value_for_key managed_policy_arn_of_yojson "ManagedPolicyArn" _list path;
     permission_set_arn = value_for_key permission_set_arn_of_yojson "PermissionSetArn" _list path;
     instance_arn = value_for_key instance_arn_of_yojson "InstanceArn" _list path;
   }
    : attach_managed_policy_to_permission_set_request)

let attach_customer_managed_policy_reference_to_permission_set_response_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  (() : unit)

let attach_customer_managed_policy_reference_to_permission_set_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     customer_managed_policy_reference =
       value_for_key customer_managed_policy_reference_of_yojson "CustomerManagedPolicyReference"
         _list path;
     permission_set_arn = value_for_key permission_set_arn_of_yojson "PermissionSetArn" _list path;
     instance_arn = value_for_key instance_arn_of_yojson "InstanceArn" _list path;
   }
    : attach_customer_managed_policy_reference_to_permission_set_request)

let add_region_response_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({ status = option_of_yojson (value_for_key region_status_of_yojson "Status") _list path }
    : add_region_response)

let add_region_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     region_name = value_for_key region_name_of_yojson "RegionName" _list path;
     instance_arn = value_for_key instance_arn_of_yojson "InstanceArn" _list path;
   }
    : add_region_request)

let refresh_token_grant_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  (() : unit)

let redirect_uris_of_yojson tree path = list_of_yojson ur_i_of_yojson tree path

let grant_type_of_yojson (tree : t) path =
  ((match tree with
    | `String "urn:ietf:params:oauth:grant-type:token-exchange" -> TOKEN_EXCHANGE
    | `String "urn:ietf:params:oauth:grant-type:jwt-bearer" -> JWT_BEARER
    | `String "refresh_token" -> REFRESH_TOKEN
    | `String "authorization_code" -> AUTHORIZATION_CODE
    | `String value -> raise (deserialize_unknown_enum_value_error path "GrantType" value)
    | _ -> raise (deserialize_wrong_type_error path "GrantType")
     : grant_type)
    : grant_type)

let authorization_code_grant_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     redirect_uris =
       option_of_yojson (value_for_key redirect_uris_of_yojson "RedirectUris") _list path;
   }
    : authorization_code_grant)

let authorized_token_issuer_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     authorized_audiences =
       option_of_yojson
         (value_for_key token_issuer_audiences_of_yojson "AuthorizedAudiences")
         _list path;
     trusted_token_issuer_arn =
       option_of_yojson
         (value_for_key trusted_token_issuer_arn_of_yojson "TrustedTokenIssuerArn")
         _list path;
   }
    : authorized_token_issuer)

let authorized_token_issuers_of_yojson tree path =
  list_of_yojson authorized_token_issuer_of_yojson tree path

let jwt_bearer_grant_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     authorized_token_issuers =
       option_of_yojson
         (value_for_key authorized_token_issuers_of_yojson "AuthorizedTokenIssuers")
         _list path;
   }
    : jwt_bearer_grant)

let grant_of_yojson (tree : t) path =
  let _list = assoc_of_yojson tree path in
  let key, value_ =
    match _list with
    | (key, value_) :: _ -> (key, value_)
    | _ -> raise (deserialize_wrong_type_error path "union")
  in
  (match key with
   | "TokenExchange" -> TokenExchange (token_exchange_grant_of_yojson value_ path)
   | "RefreshToken" -> RefreshToken (refresh_token_grant_of_yojson value_ path)
   | "JwtBearer" -> JwtBearer (jwt_bearer_grant_of_yojson value_ path)
   | "AuthorizationCode" -> AuthorizationCode (authorization_code_grant_of_yojson value_ path)
   | _ as unknown -> raise (deserialize_unknown_enum_value_error path "Grant" unknown)
    : grant)

let put_application_grant_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     grant = value_for_key grant_of_yojson "Grant" _list path;
     grant_type = value_for_key grant_type_of_yojson "GrantType" _list path;
     application_arn = value_for_key application_arn_of_yojson "ApplicationArn" _list path;
   }
    : put_application_grant_request)

let authentication_method_type_of_yojson (tree : t) path =
  ((match tree with
    | `String "IAM" -> IAM
    | `String value ->
        raise (deserialize_unknown_enum_value_error path "AuthenticationMethodType" value)
    | _ -> raise (deserialize_wrong_type_error path "AuthenticationMethodType")
     : authentication_method_type)
    : authentication_method_type)

let actor_policy_document_of_yojson = json_of_yojson

let iam_authentication_method_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({ actor_policy = value_for_key actor_policy_document_of_yojson "ActorPolicy" _list path }
    : iam_authentication_method)

let authentication_method_of_yojson (tree : t) path =
  let _list = assoc_of_yojson tree path in
  let key, value_ =
    match _list with
    | (key, value_) :: _ -> (key, value_)
    | _ -> raise (deserialize_wrong_type_error path "union")
  in
  (match key with
   | "Iam" -> Iam (iam_authentication_method_of_yojson value_ path)
   | _ as unknown ->
       raise (deserialize_unknown_enum_value_error path "AuthenticationMethod" unknown)
    : authentication_method)

let put_application_authentication_method_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     authentication_method =
       value_for_key authentication_method_of_yojson "AuthenticationMethod" _list path;
     authentication_method_type =
       value_for_key authentication_method_type_of_yojson "AuthenticationMethodType" _list path;
     application_arn = value_for_key application_arn_of_yojson "ApplicationArn" _list path;
   }
    : put_application_authentication_method_request)

let put_application_access_scope_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     application_arn = value_for_key application_arn_of_yojson "ApplicationArn" _list path;
     authorized_targets =
       option_of_yojson (value_for_key scope_targets_of_yojson "AuthorizedTargets") _list path;
     scope = value_for_key scope_of_yojson "Scope" _list path;
   }
    : put_application_access_scope_request)

let grant_item_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     grant = value_for_key grant_of_yojson "Grant" _list path;
     grant_type = value_for_key grant_type_of_yojson "GrantType" _list path;
   }
    : grant_item)

let grants_of_yojson tree path = list_of_yojson grant_item_of_yojson tree path

let list_application_grants_response_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     next_token = option_of_yojson (value_for_key token_of_yojson "NextToken") _list path;
     grants = value_for_key grants_of_yojson "Grants" _list path;
   }
    : list_application_grants_response)

let list_application_grants_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     next_token = option_of_yojson (value_for_key token_of_yojson "NextToken") _list path;
     application_arn = value_for_key application_arn_of_yojson "ApplicationArn" _list path;
   }
    : list_application_grants_request)

let authentication_method_item_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     authentication_method =
       option_of_yojson
         (value_for_key authentication_method_of_yojson "AuthenticationMethod")
         _list path;
     authentication_method_type =
       option_of_yojson
         (value_for_key authentication_method_type_of_yojson "AuthenticationMethodType")
         _list path;
   }
    : authentication_method_item)

let authentication_methods_of_yojson tree path =
  list_of_yojson authentication_method_item_of_yojson tree path

let list_application_authentication_methods_response_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     next_token = option_of_yojson (value_for_key token_of_yojson "NextToken") _list path;
     authentication_methods =
       option_of_yojson
         (value_for_key authentication_methods_of_yojson "AuthenticationMethods")
         _list path;
   }
    : list_application_authentication_methods_response)

let list_application_authentication_methods_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     next_token = option_of_yojson (value_for_key token_of_yojson "NextToken") _list path;
     application_arn = value_for_key application_arn_of_yojson "ApplicationArn" _list path;
   }
    : list_application_authentication_methods_request)

let list_application_access_scopes_response_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     next_token = option_of_yojson (value_for_key token_of_yojson "NextToken") _list path;
     scopes = value_for_key scopes_of_yojson "Scopes" _list path;
   }
    : list_application_access_scopes_response)

let list_application_access_scopes_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     next_token = option_of_yojson (value_for_key token_of_yojson "NextToken") _list path;
     max_results = option_of_yojson (value_for_key max_results_of_yojson "MaxResults") _list path;
     application_arn = value_for_key application_arn_of_yojson "ApplicationArn" _list path;
   }
    : list_application_access_scopes_request)

let get_application_grant_response_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({ grant = value_for_key grant_of_yojson "Grant" _list path } : get_application_grant_response)

let get_application_grant_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     grant_type = value_for_key grant_type_of_yojson "GrantType" _list path;
     application_arn = value_for_key application_arn_of_yojson "ApplicationArn" _list path;
   }
    : get_application_grant_request)

let get_application_authentication_method_response_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     authentication_method =
       option_of_yojson
         (value_for_key authentication_method_of_yojson "AuthenticationMethod")
         _list path;
   }
    : get_application_authentication_method_response)

let get_application_authentication_method_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     authentication_method_type =
       value_for_key authentication_method_type_of_yojson "AuthenticationMethodType" _list path;
     application_arn = value_for_key application_arn_of_yojson "ApplicationArn" _list path;
   }
    : get_application_authentication_method_request)

let get_application_access_scope_response_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     authorized_targets =
       option_of_yojson (value_for_key scope_targets_of_yojson "AuthorizedTargets") _list path;
     scope = value_for_key scope_of_yojson "Scope" _list path;
   }
    : get_application_access_scope_response)

let get_application_access_scope_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     scope = value_for_key scope_of_yojson "Scope" _list path;
     application_arn = value_for_key application_arn_of_yojson "ApplicationArn" _list path;
   }
    : get_application_access_scope_request)

let delete_application_grant_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     grant_type = value_for_key grant_type_of_yojson "GrantType" _list path;
     application_arn = value_for_key application_arn_of_yojson "ApplicationArn" _list path;
   }
    : delete_application_grant_request)

let delete_application_authentication_method_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     authentication_method_type =
       value_for_key authentication_method_type_of_yojson "AuthenticationMethodType" _list path;
     application_arn = value_for_key application_arn_of_yojson "ApplicationArn" _list path;
   }
    : delete_application_authentication_method_request)

let delete_application_access_scope_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     scope = value_for_key scope_of_yojson "Scope" _list path;
     application_arn = value_for_key application_arn_of_yojson "ApplicationArn" _list path;
   }
    : delete_application_access_scope_request)
