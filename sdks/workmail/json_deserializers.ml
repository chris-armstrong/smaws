open Smaws_Lib.Json.DeserializeHelpers
open Types
let string__of_yojson = string_of_yojson
let unsupported_operation_exception_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     message =
       (option_of_yojson (value_for_key string__of_yojson "Message") _list
          path)
   } : unsupported_operation_exception)
let organization_state_exception_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     message =
       (option_of_yojson (value_for_key string__of_yojson "Message") _list
          path)
   } : organization_state_exception)
let organization_not_found_exception_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     message =
       (option_of_yojson (value_for_key string__of_yojson "Message") _list
          path)
   } : organization_not_found_exception)
let invalid_parameter_exception_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     message =
       (option_of_yojson (value_for_key string__of_yojson "Message") _list
          path)
   } : invalid_parameter_exception)
let entity_state_exception_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     message =
       (option_of_yojson (value_for_key string__of_yojson "Message") _list
          path)
   } : entity_state_exception)
let entity_not_found_exception_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     message =
       (option_of_yojson (value_for_key string__of_yojson "Message") _list
          path)
   } : entity_not_found_exception)
let directory_unavailable_exception_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     message =
       (option_of_yojson (value_for_key string__of_yojson "Message") _list
          path)
   } : directory_unavailable_exception)
let directory_service_authentication_failed_exception_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     message =
       (option_of_yojson (value_for_key string__of_yojson "Message") _list
          path)
   } : directory_service_authentication_failed_exception)
let update_user_response_of_yojson tree path =
  let _list = assoc_of_yojson tree path in (() : unit)
let organization_id_of_yojson = string_of_yojson
let entity_identifier_of_yojson = string_of_yojson
let user_role_of_yojson (tree : t) path =
  (let _list = assoc_of_yojson tree path in
   (match tree with
    | `String "REMOTE_USER" -> REMOTE_USER
    | `String "SYSTEM_USER" -> SYSTEM_USER
    | `String "RESOURCE" -> RESOURCE
    | `String "USER" -> USER
    | `String value ->
        raise (deserialize_unknown_enum_value_error path "UserRole" value)
    | _ -> raise (deserialize_wrong_type_error path "UserRole") : user_role) : 
  user_role)
let user_attribute_of_yojson = string_of_yojson
let boolean_object_of_yojson = bool_of_yojson
let identity_provider_user_id_for_update_of_yojson = string_of_yojson
let update_user_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     identity_provider_user_id =
       (option_of_yojson
          (value_for_key identity_provider_user_id_for_update_of_yojson
             "IdentityProviderUserId") _list path);
     office =
       (option_of_yojson (value_for_key user_attribute_of_yojson "Office")
          _list path);
     country =
       (option_of_yojson (value_for_key user_attribute_of_yojson "Country")
          _list path);
     department =
       (option_of_yojson
          (value_for_key user_attribute_of_yojson "Department") _list path);
     zip_code =
       (option_of_yojson (value_for_key user_attribute_of_yojson "ZipCode")
          _list path);
     company =
       (option_of_yojson (value_for_key user_attribute_of_yojson "Company")
          _list path);
     city =
       (option_of_yojson (value_for_key user_attribute_of_yojson "City")
          _list path);
     job_title =
       (option_of_yojson (value_for_key user_attribute_of_yojson "JobTitle")
          _list path);
     street =
       (option_of_yojson (value_for_key user_attribute_of_yojson "Street")
          _list path);
     telephone =
       (option_of_yojson (value_for_key user_attribute_of_yojson "Telephone")
          _list path);
     initials =
       (option_of_yojson (value_for_key user_attribute_of_yojson "Initials")
          _list path);
     hidden_from_global_address_list =
       (option_of_yojson
          (value_for_key boolean_object_of_yojson
             "HiddenFromGlobalAddressList") _list path);
     last_name =
       (option_of_yojson (value_for_key user_attribute_of_yojson "LastName")
          _list path);
     first_name =
       (option_of_yojson (value_for_key user_attribute_of_yojson "FirstName")
          _list path);
     display_name =
       (option_of_yojson
          (value_for_key user_attribute_of_yojson "DisplayName") _list path);
     role =
       (option_of_yojson (value_for_key user_role_of_yojson "Role") _list
          path);
     user_id =
       (value_for_key entity_identifier_of_yojson "UserId" _list path);
     organization_id =
       (value_for_key organization_id_of_yojson "OrganizationId" _list path)
   } : update_user_request)
let name_availability_exception_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     message =
       (option_of_yojson (value_for_key string__of_yojson "Message") _list
          path)
   } : name_availability_exception)
let mail_domain_state_exception_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     message =
       (option_of_yojson (value_for_key string__of_yojson "Message") _list
          path)
   } : mail_domain_state_exception)
let mail_domain_not_found_exception_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     message =
       (option_of_yojson (value_for_key string__of_yojson "Message") _list
          path)
   } : mail_domain_not_found_exception)
let invalid_configuration_exception_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     message =
       (option_of_yojson (value_for_key string__of_yojson "Message") _list
          path)
   } : invalid_configuration_exception)
let email_address_in_use_exception_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     message =
       (option_of_yojson (value_for_key string__of_yojson "Message") _list
          path)
   } : email_address_in_use_exception)
let update_resource_response_of_yojson tree path =
  let _list = assoc_of_yojson tree path in (() : unit)
let resource_name_of_yojson = string_of_yojson
let boolean__of_yojson = bool_of_yojson
let booking_options_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     auto_decline_conflicting_requests =
       (option_of_yojson
          (value_for_key boolean__of_yojson "AutoDeclineConflictingRequests")
          _list path);
     auto_decline_recurring_requests =
       (option_of_yojson
          (value_for_key boolean__of_yojson "AutoDeclineRecurringRequests")
          _list path);
     auto_accept_requests =
       (option_of_yojson
          (value_for_key boolean__of_yojson "AutoAcceptRequests") _list path)
   } : booking_options)
let new_resource_description_of_yojson = string_of_yojson
let resource_type_of_yojson (tree : t) path =
  (let _list = assoc_of_yojson tree path in
   (match tree with
    | `String "EQUIPMENT" -> EQUIPMENT
    | `String "ROOM" -> ROOM
    | `String value ->
        raise
          (deserialize_unknown_enum_value_error path "ResourceType" value)
    | _ -> raise (deserialize_wrong_type_error path "ResourceType") : 
     resource_type) : resource_type)
let update_resource_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     hidden_from_global_address_list =
       (option_of_yojson
          (value_for_key boolean_object_of_yojson
             "HiddenFromGlobalAddressList") _list path);
     type_ =
       (option_of_yojson (value_for_key resource_type_of_yojson "Type") _list
          path);
     description =
       (option_of_yojson
          (value_for_key new_resource_description_of_yojson "Description")
          _list path);
     booking_options =
       (option_of_yojson
          (value_for_key booking_options_of_yojson "BookingOptions") _list
          path);
     name =
       (option_of_yojson (value_for_key resource_name_of_yojson "Name") _list
          path);
     resource_id =
       (value_for_key entity_identifier_of_yojson "ResourceId" _list path);
     organization_id =
       (value_for_key organization_id_of_yojson "OrganizationId" _list path)
   } : update_resource_request)
let update_primary_email_address_response_of_yojson tree path =
  let _list = assoc_of_yojson tree path in (() : unit)
let email_address_of_yojson = string_of_yojson
let update_primary_email_address_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     email = (value_for_key email_address_of_yojson "Email" _list path);
     entity_id =
       (value_for_key entity_identifier_of_yojson "EntityId" _list path);
     organization_id =
       (value_for_key organization_id_of_yojson "OrganizationId" _list path)
   } : update_primary_email_address_request)
let update_mobile_device_access_rule_response_of_yojson tree path =
  let _list = assoc_of_yojson tree path in (() : unit)
let mobile_device_access_rule_id_of_yojson = string_of_yojson
let mobile_device_access_rule_name_of_yojson = string_of_yojson
let mobile_device_access_rule_description_of_yojson = string_of_yojson
let mobile_device_access_rule_effect_of_yojson (tree : t) path =
  (let _list = assoc_of_yojson tree path in
   (match tree with
    | `String "DENY" -> DENY
    | `String "ALLOW" -> ALLOW
    | `String value ->
        raise
          (deserialize_unknown_enum_value_error path
             "MobileDeviceAccessRuleEffect" value)
    | _ ->
        raise
          (deserialize_wrong_type_error path "MobileDeviceAccessRuleEffect") : 
     mobile_device_access_rule_effect) : mobile_device_access_rule_effect)
let device_type_of_yojson = string_of_yojson
let device_type_list_of_yojson tree path =
  list_of_yojson device_type_of_yojson tree path
let device_model_of_yojson = string_of_yojson
let device_model_list_of_yojson tree path =
  list_of_yojson device_model_of_yojson tree path
let device_operating_system_of_yojson = string_of_yojson
let device_operating_system_list_of_yojson tree path =
  list_of_yojson device_operating_system_of_yojson tree path
let device_user_agent_of_yojson = string_of_yojson
let device_user_agent_list_of_yojson tree path =
  list_of_yojson device_user_agent_of_yojson tree path
let update_mobile_device_access_rule_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     not_device_user_agents =
       (option_of_yojson
          (value_for_key device_user_agent_list_of_yojson
             "NotDeviceUserAgents") _list path);
     device_user_agents =
       (option_of_yojson
          (value_for_key device_user_agent_list_of_yojson "DeviceUserAgents")
          _list path);
     not_device_operating_systems =
       (option_of_yojson
          (value_for_key device_operating_system_list_of_yojson
             "NotDeviceOperatingSystems") _list path);
     device_operating_systems =
       (option_of_yojson
          (value_for_key device_operating_system_list_of_yojson
             "DeviceOperatingSystems") _list path);
     not_device_models =
       (option_of_yojson
          (value_for_key device_model_list_of_yojson "NotDeviceModels") _list
          path);
     device_models =
       (option_of_yojson
          (value_for_key device_model_list_of_yojson "DeviceModels") _list
          path);
     not_device_types =
       (option_of_yojson
          (value_for_key device_type_list_of_yojson "NotDeviceTypes") _list
          path);
     device_types =
       (option_of_yojson
          (value_for_key device_type_list_of_yojson "DeviceTypes") _list path);
     effect_ =
       (value_for_key mobile_device_access_rule_effect_of_yojson "Effect"
          _list path);
     description =
       (option_of_yojson
          (value_for_key mobile_device_access_rule_description_of_yojson
             "Description") _list path);
     name =
       (value_for_key mobile_device_access_rule_name_of_yojson "Name" _list
          path);
     mobile_device_access_rule_id =
       (value_for_key mobile_device_access_rule_id_of_yojson
          "MobileDeviceAccessRuleId" _list path);
     organization_id =
       (value_for_key organization_id_of_yojson "OrganizationId" _list path)
   } : update_mobile_device_access_rule_request)
let update_mailbox_quota_response_of_yojson tree path =
  let _list = assoc_of_yojson tree path in (() : unit)
let mailbox_quota_of_yojson = int_of_yojson
let update_mailbox_quota_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     mailbox_quota =
       (value_for_key mailbox_quota_of_yojson "MailboxQuota" _list path);
     user_id =
       (value_for_key entity_identifier_of_yojson "UserId" _list path);
     organization_id =
       (value_for_key organization_id_of_yojson "OrganizationId" _list path)
   } : update_mailbox_quota_request)
let resource_not_found_exception_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     message =
       (option_of_yojson (value_for_key string__of_yojson "Message") _list
          path)
   } : resource_not_found_exception)
let limit_exceeded_exception_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     message =
       (option_of_yojson (value_for_key string__of_yojson "Message") _list
          path)
   } : limit_exceeded_exception)
let update_impersonation_role_response_of_yojson tree path =
  let _list = assoc_of_yojson tree path in (() : unit)
let impersonation_role_id_of_yojson = string_of_yojson
let impersonation_role_name_of_yojson = string_of_yojson
let impersonation_role_type_of_yojson (tree : t) path =
  (let _list = assoc_of_yojson tree path in
   (match tree with
    | `String "READ_ONLY" -> READ_ONLY
    | `String "FULL_ACCESS" -> FULL_ACCESS
    | `String value ->
        raise
          (deserialize_unknown_enum_value_error path "ImpersonationRoleType"
             value)
    | _ -> raise (deserialize_wrong_type_error path "ImpersonationRoleType") : 
     impersonation_role_type) : impersonation_role_type)
let impersonation_role_description_of_yojson = string_of_yojson
let impersonation_rule_id_of_yojson = string_of_yojson
let impersonation_rule_name_of_yojson = string_of_yojson
let impersonation_rule_description_of_yojson = string_of_yojson
let access_effect_of_yojson (tree : t) path =
  (let _list = assoc_of_yojson tree path in
   (match tree with
    | `String "DENY" -> DENY
    | `String "ALLOW" -> ALLOW
    | `String value ->
        raise
          (deserialize_unknown_enum_value_error path "AccessEffect" value)
    | _ -> raise (deserialize_wrong_type_error path "AccessEffect") : 
     access_effect) : access_effect)
let target_users_of_yojson tree path =
  list_of_yojson entity_identifier_of_yojson tree path
let impersonation_rule_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     not_target_users =
       (option_of_yojson
          (value_for_key target_users_of_yojson "NotTargetUsers") _list path);
     target_users =
       (option_of_yojson (value_for_key target_users_of_yojson "TargetUsers")
          _list path);
     effect_ = (value_for_key access_effect_of_yojson "Effect" _list path);
     description =
       (option_of_yojson
          (value_for_key impersonation_rule_description_of_yojson
             "Description") _list path);
     name =
       (option_of_yojson
          (value_for_key impersonation_rule_name_of_yojson "Name") _list path);
     impersonation_rule_id =
       (value_for_key impersonation_rule_id_of_yojson "ImpersonationRuleId"
          _list path)
   } : impersonation_rule)
let impersonation_rule_list_of_yojson tree path =
  list_of_yojson impersonation_rule_of_yojson tree path
let update_impersonation_role_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     rules =
       (value_for_key impersonation_rule_list_of_yojson "Rules" _list path);
     description =
       (option_of_yojson
          (value_for_key impersonation_role_description_of_yojson
             "Description") _list path);
     type_ =
       (value_for_key impersonation_role_type_of_yojson "Type" _list path);
     name =
       (value_for_key impersonation_role_name_of_yojson "Name" _list path);
     impersonation_role_id =
       (value_for_key impersonation_role_id_of_yojson "ImpersonationRoleId"
          _list path);
     organization_id =
       (value_for_key organization_id_of_yojson "OrganizationId" _list path)
   } : update_impersonation_role_request)
let update_group_response_of_yojson tree path =
  let _list = assoc_of_yojson tree path in (() : unit)
let update_group_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     hidden_from_global_address_list =
       (option_of_yojson
          (value_for_key boolean_object_of_yojson
             "HiddenFromGlobalAddressList") _list path);
     group_id =
       (value_for_key entity_identifier_of_yojson "GroupId" _list path);
     organization_id =
       (value_for_key organization_id_of_yojson "OrganizationId" _list path)
   } : update_group_request)
let update_default_mail_domain_response_of_yojson tree path =
  let _list = assoc_of_yojson tree path in (() : unit)
let work_mail_domain_name_of_yojson = string_of_yojson
let update_default_mail_domain_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     domain_name =
       (value_for_key work_mail_domain_name_of_yojson "DomainName" _list path);
     organization_id =
       (value_for_key organization_id_of_yojson "OrganizationId" _list path)
   } : update_default_mail_domain_request)
let update_availability_configuration_response_of_yojson tree path =
  let _list = assoc_of_yojson tree path in (() : unit)
let domain_name_of_yojson = string_of_yojson
let url_of_yojson = string_of_yojson
let external_user_name_of_yojson = string_of_yojson
let password_of_yojson = string_of_yojson
let ews_availability_provider_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     ews_password =
       (value_for_key password_of_yojson "EwsPassword" _list path);
     ews_username =
       (value_for_key external_user_name_of_yojson "EwsUsername" _list path);
     ews_endpoint = (value_for_key url_of_yojson "EwsEndpoint" _list path)
   } : ews_availability_provider)
let lambda_arn_of_yojson = string_of_yojson
let lambda_availability_provider_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({ lambda_arn = (value_for_key lambda_arn_of_yojson "LambdaArn" _list path)
   } : lambda_availability_provider)
let update_availability_configuration_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     lambda_provider =
       (option_of_yojson
          (value_for_key lambda_availability_provider_of_yojson
             "LambdaProvider") _list path);
     ews_provider =
       (option_of_yojson
          (value_for_key ews_availability_provider_of_yojson "EwsProvider")
          _list path);
     domain_name =
       (value_for_key domain_name_of_yojson "DomainName" _list path);
     organization_id =
       (value_for_key organization_id_of_yojson "OrganizationId" _list path)
   } : update_availability_configuration_request)
let untag_resource_response_of_yojson tree path =
  let _list = assoc_of_yojson tree path in (() : unit)
let amazon_resource_name_of_yojson = string_of_yojson
let tag_key_of_yojson = string_of_yojson
let tag_key_list_of_yojson tree path =
  list_of_yojson tag_key_of_yojson tree path
let untag_resource_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     tag_keys = (value_for_key tag_key_list_of_yojson "TagKeys" _list path);
     resource_ar_n =
       (value_for_key amazon_resource_name_of_yojson "ResourceARN" _list path)
   } : untag_resource_request)
let test_availability_configuration_response_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     failure_reason =
       (option_of_yojson (value_for_key string__of_yojson "FailureReason")
          _list path);
     test_passed =
       (option_of_yojson (value_for_key boolean__of_yojson "TestPassed")
          _list path)
   } : test_availability_configuration_response)
let test_availability_configuration_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     lambda_provider =
       (option_of_yojson
          (value_for_key lambda_availability_provider_of_yojson
             "LambdaProvider") _list path);
     ews_provider =
       (option_of_yojson
          (value_for_key ews_availability_provider_of_yojson "EwsProvider")
          _list path);
     domain_name =
       (option_of_yojson (value_for_key domain_name_of_yojson "DomainName")
          _list path);
     organization_id =
       (value_for_key organization_id_of_yojson "OrganizationId" _list path)
   } : test_availability_configuration_request)
let too_many_tags_exception_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     message =
       (option_of_yojson (value_for_key string__of_yojson "Message") _list
          path)
   } : too_many_tags_exception)
let tag_resource_response_of_yojson tree path =
  let _list = assoc_of_yojson tree path in (() : unit)
let tag_value_of_yojson = string_of_yojson
let tag_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     value = (value_for_key tag_value_of_yojson "Value" _list path);
     key = (value_for_key tag_key_of_yojson "Key" _list path)
   } : tag)
let tag_list_of_yojson tree path = list_of_yojson tag_of_yojson tree path
let tag_resource_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     tags = (value_for_key tag_list_of_yojson "Tags" _list path);
     resource_ar_n =
       (value_for_key amazon_resource_name_of_yojson "ResourceARN" _list path)
   } : tag_resource_request)
let mailbox_export_job_id_of_yojson = string_of_yojson
let start_mailbox_export_job_response_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     job_id =
       (option_of_yojson
          (value_for_key mailbox_export_job_id_of_yojson "JobId") _list path)
   } : start_mailbox_export_job_response)
let idempotency_client_token_of_yojson = string_of_yojson
let description_of_yojson = string_of_yojson
let role_arn_of_yojson = string_of_yojson
let kms_key_arn_of_yojson = string_of_yojson
let s3_bucket_name_of_yojson = string_of_yojson
let s3_object_key_of_yojson = string_of_yojson
let start_mailbox_export_job_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     s3_prefix =
       (value_for_key s3_object_key_of_yojson "S3Prefix" _list path);
     s3_bucket_name =
       (value_for_key s3_bucket_name_of_yojson "S3BucketName" _list path);
     kms_key_arn =
       (value_for_key kms_key_arn_of_yojson "KmsKeyArn" _list path);
     role_arn = (value_for_key role_arn_of_yojson "RoleArn" _list path);
     description =
       (option_of_yojson (value_for_key description_of_yojson "Description")
          _list path);
     entity_id =
       (value_for_key entity_identifier_of_yojson "EntityId" _list path);
     organization_id =
       (value_for_key organization_id_of_yojson "OrganizationId" _list path);
     client_token =
       (value_for_key idempotency_client_token_of_yojson "ClientToken" _list
          path)
   } : start_mailbox_export_job_request)
let invalid_password_exception_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     message =
       (option_of_yojson (value_for_key string__of_yojson "Message") _list
          path)
   } : invalid_password_exception)
let reset_password_response_of_yojson tree path =
  let _list = assoc_of_yojson tree path in (() : unit)
let work_mail_identifier_of_yojson = string_of_yojson
let reset_password_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     password = (value_for_key password_of_yojson "Password" _list path);
     user_id =
       (value_for_key work_mail_identifier_of_yojson "UserId" _list path);
     organization_id =
       (value_for_key organization_id_of_yojson "OrganizationId" _list path)
   } : reset_password_request)
let entity_already_registered_exception_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     message =
       (option_of_yojson (value_for_key string__of_yojson "Message") _list
          path)
   } : entity_already_registered_exception)
let register_to_work_mail_response_of_yojson tree path =
  let _list = assoc_of_yojson tree path in (() : unit)
let register_to_work_mail_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     email = (value_for_key email_address_of_yojson "Email" _list path);
     entity_id =
       (value_for_key entity_identifier_of_yojson "EntityId" _list path);
     organization_id =
       (value_for_key organization_id_of_yojson "OrganizationId" _list path)
   } : register_to_work_mail_request)
let mail_domain_in_use_exception_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     message =
       (option_of_yojson (value_for_key string__of_yojson "Message") _list
          path)
   } : mail_domain_in_use_exception)
let register_mail_domain_response_of_yojson tree path =
  let _list = assoc_of_yojson tree path in (() : unit)
let register_mail_domain_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     domain_name =
       (value_for_key work_mail_domain_name_of_yojson "DomainName" _list path);
     organization_id =
       (value_for_key organization_id_of_yojson "OrganizationId" _list path);
     client_token =
       (option_of_yojson
          (value_for_key idempotency_client_token_of_yojson "ClientToken")
          _list path)
   } : register_mail_domain_request)
let put_retention_policy_response_of_yojson tree path =
  let _list = assoc_of_yojson tree path in (() : unit)
let short_string_of_yojson = string_of_yojson
let policy_description_of_yojson = string_of_yojson
let folder_name_of_yojson (tree : t) path =
  (let _list = assoc_of_yojson tree path in
   (match tree with
    | `String "JUNK_EMAIL" -> JUNK_EMAIL
    | `String "DRAFTS" -> DRAFTS
    | `String "SENT_ITEMS" -> SENT_ITEMS
    | `String "DELETED_ITEMS" -> DELETED_ITEMS
    | `String "INBOX" -> INBOX
    | `String value ->
        raise (deserialize_unknown_enum_value_error path "FolderName" value)
    | _ -> raise (deserialize_wrong_type_error path "FolderName") : folder_name) : 
  folder_name)
let retention_action_of_yojson (tree : t) path =
  (let _list = assoc_of_yojson tree path in
   (match tree with
    | `String "PERMANENTLY_DELETE" -> PERMANENTLY_DELETE
    | `String "DELETE" -> DELETE
    | `String "NONE" -> NONE
    | `String value ->
        raise
          (deserialize_unknown_enum_value_error path "RetentionAction" value)
    | _ -> raise (deserialize_wrong_type_error path "RetentionAction") : 
     retention_action) : retention_action)
let retention_period_of_yojson = int_of_yojson
let folder_configuration_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     period =
       (option_of_yojson (value_for_key retention_period_of_yojson "Period")
          _list path);
     action = (value_for_key retention_action_of_yojson "Action" _list path);
     name = (value_for_key folder_name_of_yojson "Name" _list path)
   } : folder_configuration)
let folder_configurations_of_yojson tree path =
  list_of_yojson folder_configuration_of_yojson tree path
let put_retention_policy_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     folder_configurations =
       (value_for_key folder_configurations_of_yojson "FolderConfigurations"
          _list path);
     description =
       (option_of_yojson
          (value_for_key policy_description_of_yojson "Description") _list
          path);
     name = (value_for_key short_string_of_yojson "Name" _list path);
     id =
       (option_of_yojson (value_for_key short_string_of_yojson "Id") _list
          path);
     organization_id =
       (value_for_key organization_id_of_yojson "OrganizationId" _list path)
   } : put_retention_policy_request)
let put_mobile_device_access_override_response_of_yojson tree path =
  let _list = assoc_of_yojson tree path in (() : unit)
let device_id_of_yojson = string_of_yojson
let put_mobile_device_access_override_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     description =
       (option_of_yojson
          (value_for_key mobile_device_access_rule_description_of_yojson
             "Description") _list path);
     effect_ =
       (value_for_key mobile_device_access_rule_effect_of_yojson "Effect"
          _list path);
     device_id = (value_for_key device_id_of_yojson "DeviceId" _list path);
     user_id =
       (value_for_key entity_identifier_of_yojson "UserId" _list path);
     organization_id =
       (value_for_key organization_id_of_yojson "OrganizationId" _list path)
   } : put_mobile_device_access_override_request)
let put_mailbox_permissions_response_of_yojson tree path =
  let _list = assoc_of_yojson tree path in (() : unit)
let permission_type_of_yojson (tree : t) path =
  (let _list = assoc_of_yojson tree path in
   (match tree with
    | `String "SEND_ON_BEHALF" -> SEND_ON_BEHALF
    | `String "SEND_AS" -> SEND_AS
    | `String "FULL_ACCESS" -> FULL_ACCESS
    | `String value ->
        raise
          (deserialize_unknown_enum_value_error path "PermissionType" value)
    | _ -> raise (deserialize_wrong_type_error path "PermissionType") : 
     permission_type) : permission_type)
let permission_values_of_yojson tree path =
  list_of_yojson permission_type_of_yojson tree path
let put_mailbox_permissions_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     permission_values =
       (value_for_key permission_values_of_yojson "PermissionValues" _list
          path);
     grantee_id =
       (value_for_key entity_identifier_of_yojson "GranteeId" _list path);
     entity_id =
       (value_for_key entity_identifier_of_yojson "EntityId" _list path);
     organization_id =
       (value_for_key organization_id_of_yojson "OrganizationId" _list path)
   } : put_mailbox_permissions_request)
let put_inbound_dmarc_settings_response_of_yojson tree path =
  let _list = assoc_of_yojson tree path in (() : unit)
let put_inbound_dmarc_settings_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     enforced =
       (value_for_key boolean_object_of_yojson "Enforced" _list path);
     organization_id =
       (value_for_key organization_id_of_yojson "OrganizationId" _list path)
   } : put_inbound_dmarc_settings_request)
let put_identity_provider_configuration_response_of_yojson tree path =
  let _list = assoc_of_yojson tree path in (() : unit)
let identity_provider_authentication_mode_of_yojson (tree : t) path =
  (let _list = assoc_of_yojson tree path in
   (match tree with
    | `String "IDENTITY_PROVIDER_AND_DIRECTORY" ->
        IDENTITY_PROVIDER_AND_DIRECTORY
    | `String "IDENTITY_PROVIDER_ONLY" -> IDENTITY_PROVIDER_ONLY
    | `String value ->
        raise
          (deserialize_unknown_enum_value_error path
             "IdentityProviderAuthenticationMode" value)
    | _ ->
        raise
          (deserialize_wrong_type_error path
             "IdentityProviderAuthenticationMode") : identity_provider_authentication_mode) : 
  identity_provider_authentication_mode)
let instance_arn_of_yojson = string_of_yojson
let application_arn_of_yojson = string_of_yojson
let identity_center_configuration_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     application_arn =
       (value_for_key application_arn_of_yojson "ApplicationArn" _list path);
     instance_arn =
       (value_for_key instance_arn_of_yojson "InstanceArn" _list path)
   } : identity_center_configuration)
let personal_access_token_configuration_status_of_yojson (tree : t) path =
  (let _list = assoc_of_yojson tree path in
   (match tree with
    | `String "INACTIVE" -> INACTIVE
    | `String "ACTIVE" -> ACTIVE
    | `String value ->
        raise
          (deserialize_unknown_enum_value_error path
             "PersonalAccessTokenConfigurationStatus" value)
    | _ ->
        raise
          (deserialize_wrong_type_error path
             "PersonalAccessTokenConfigurationStatus") : personal_access_token_configuration_status) : 
  personal_access_token_configuration_status)
let personal_access_token_lifetime_in_days_of_yojson = int_of_yojson
let personal_access_token_configuration_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     lifetime_in_days =
       (option_of_yojson
          (value_for_key personal_access_token_lifetime_in_days_of_yojson
             "LifetimeInDays") _list path);
     status =
       (value_for_key personal_access_token_configuration_status_of_yojson
          "Status" _list path)
   } : personal_access_token_configuration)
let put_identity_provider_configuration_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     personal_access_token_configuration =
       (value_for_key personal_access_token_configuration_of_yojson
          "PersonalAccessTokenConfiguration" _list path);
     identity_center_configuration =
       (value_for_key identity_center_configuration_of_yojson
          "IdentityCenterConfiguration" _list path);
     authentication_mode =
       (value_for_key identity_provider_authentication_mode_of_yojson
          "AuthenticationMode" _list path);
     organization_id =
       (value_for_key organization_id_of_yojson "OrganizationId" _list path)
   } : put_identity_provider_configuration_request)
let put_email_monitoring_configuration_response_of_yojson tree path =
  let _list = assoc_of_yojson tree path in (() : unit)
let log_group_arn_of_yojson = string_of_yojson
let put_email_monitoring_configuration_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     log_group_arn =
       (value_for_key log_group_arn_of_yojson "LogGroupArn" _list path);
     role_arn = (value_for_key role_arn_of_yojson "RoleArn" _list path);
     organization_id =
       (value_for_key organization_id_of_yojson "OrganizationId" _list path)
   } : put_email_monitoring_configuration_request)
let put_access_control_rule_response_of_yojson tree path =
  let _list = assoc_of_yojson tree path in (() : unit)
let access_control_rule_name_of_yojson = string_of_yojson
let access_control_rule_effect_of_yojson (tree : t) path =
  (let _list = assoc_of_yojson tree path in
   (match tree with
    | `String "DENY" -> DENY
    | `String "ALLOW" -> ALLOW
    | `String value ->
        raise
          (deserialize_unknown_enum_value_error path
             "AccessControlRuleEffect" value)
    | _ ->
        raise (deserialize_wrong_type_error path "AccessControlRuleEffect") : 
     access_control_rule_effect) : access_control_rule_effect)
let access_control_rule_description_of_yojson = string_of_yojson
let ip_range_of_yojson = string_of_yojson
let ip_range_list_of_yojson tree path =
  list_of_yojson ip_range_of_yojson tree path
let access_control_rule_action_of_yojson = string_of_yojson
let actions_list_of_yojson tree path =
  list_of_yojson access_control_rule_action_of_yojson tree path
let user_id_list_of_yojson tree path =
  list_of_yojson work_mail_identifier_of_yojson tree path
let impersonation_role_id_list_of_yojson tree path =
  list_of_yojson impersonation_role_id_of_yojson tree path
let put_access_control_rule_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     not_impersonation_role_ids =
       (option_of_yojson
          (value_for_key impersonation_role_id_list_of_yojson
             "NotImpersonationRoleIds") _list path);
     impersonation_role_ids =
       (option_of_yojson
          (value_for_key impersonation_role_id_list_of_yojson
             "ImpersonationRoleIds") _list path);
     organization_id =
       (value_for_key organization_id_of_yojson "OrganizationId" _list path);
     not_user_ids =
       (option_of_yojson (value_for_key user_id_list_of_yojson "NotUserIds")
          _list path);
     user_ids =
       (option_of_yojson (value_for_key user_id_list_of_yojson "UserIds")
          _list path);
     not_actions =
       (option_of_yojson (value_for_key actions_list_of_yojson "NotActions")
          _list path);
     actions =
       (option_of_yojson (value_for_key actions_list_of_yojson "Actions")
          _list path);
     not_ip_ranges =
       (option_of_yojson
          (value_for_key ip_range_list_of_yojson "NotIpRanges") _list path);
     ip_ranges =
       (option_of_yojson (value_for_key ip_range_list_of_yojson "IpRanges")
          _list path);
     description =
       (value_for_key access_control_rule_description_of_yojson "Description"
          _list path);
     effect_ =
       (value_for_key access_control_rule_effect_of_yojson "Effect" _list
          path);
     name =
       (value_for_key access_control_rule_name_of_yojson "Name" _list path)
   } : put_access_control_rule_request)
let user_name_of_yojson = string_of_yojson
let entity_state_of_yojson (tree : t) path =
  (let _list = assoc_of_yojson tree path in
   (match tree with
    | `String "DELETED" -> DELETED
    | `String "DISABLED" -> DISABLED
    | `String "ENABLED" -> ENABLED
    | `String value ->
        raise (deserialize_unknown_enum_value_error path "EntityState" value)
    | _ -> raise (deserialize_wrong_type_error path "EntityState") : 
     entity_state) : entity_state)
let timestamp_of_yojson = timestamp_epoch_seconds_of_yojson
let identity_provider_user_id_of_yojson = string_of_yojson
let identity_provider_identity_store_id_of_yojson = string_of_yojson
let user_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     identity_provider_identity_store_id =
       (option_of_yojson
          (value_for_key identity_provider_identity_store_id_of_yojson
             "IdentityProviderIdentityStoreId") _list path);
     identity_provider_user_id =
       (option_of_yojson
          (value_for_key identity_provider_user_id_of_yojson
             "IdentityProviderUserId") _list path);
     disabled_date =
       (option_of_yojson (value_for_key timestamp_of_yojson "DisabledDate")
          _list path);
     enabled_date =
       (option_of_yojson (value_for_key timestamp_of_yojson "EnabledDate")
          _list path);
     user_role =
       (option_of_yojson (value_for_key user_role_of_yojson "UserRole") _list
          path);
     state =
       (option_of_yojson (value_for_key entity_state_of_yojson "State") _list
          path);
     display_name =
       (option_of_yojson (value_for_key string__of_yojson "DisplayName")
          _list path);
     name =
       (option_of_yojson (value_for_key user_name_of_yojson "Name") _list
          path);
     email =
       (option_of_yojson (value_for_key email_address_of_yojson "Email")
          _list path);
     id =
       (option_of_yojson (value_for_key work_mail_identifier_of_yojson "Id")
          _list path)
   } : user)
let users_of_yojson tree path = list_of_yojson user_of_yojson tree path
let next_token_of_yojson = string_of_yojson
let list_users_response_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     next_token =
       (option_of_yojson (value_for_key next_token_of_yojson "NextToken")
          _list path);
     users =
       (option_of_yojson (value_for_key users_of_yojson "Users") _list path)
   } : list_users_response)
let max_results_of_yojson = int_of_yojson
let identity_provider_user_id_prefix_of_yojson = string_of_yojson
let list_users_filters_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     identity_provider_user_id_prefix =
       (option_of_yojson
          (value_for_key identity_provider_user_id_prefix_of_yojson
             "IdentityProviderUserIdPrefix") _list path);
     state =
       (option_of_yojson (value_for_key entity_state_of_yojson "State") _list
          path);
     primary_email_prefix =
       (option_of_yojson
          (value_for_key string__of_yojson "PrimaryEmailPrefix") _list path);
     display_name_prefix =
       (option_of_yojson
          (value_for_key user_attribute_of_yojson "DisplayNamePrefix") _list
          path);
     username_prefix =
       (option_of_yojson (value_for_key string__of_yojson "UsernamePrefix")
          _list path)
   } : list_users_filters)
let list_users_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     filters =
       (option_of_yojson
          (value_for_key list_users_filters_of_yojson "Filters") _list path);
     max_results =
       (option_of_yojson (value_for_key max_results_of_yojson "MaxResults")
          _list path);
     next_token =
       (option_of_yojson (value_for_key next_token_of_yojson "NextToken")
          _list path);
     organization_id =
       (value_for_key organization_id_of_yojson "OrganizationId" _list path)
   } : list_users_request)
let list_tags_for_resource_response_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     tags =
       (option_of_yojson (value_for_key tag_list_of_yojson "Tags") _list path)
   } : list_tags_for_resource_response)
let list_tags_for_resource_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     resource_ar_n =
       (value_for_key amazon_resource_name_of_yojson "ResourceARN" _list path)
   } : list_tags_for_resource_request)
let resource_description_of_yojson = string_of_yojson
let resource_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     description =
       (option_of_yojson
          (value_for_key resource_description_of_yojson "Description") _list
          path);
     disabled_date =
       (option_of_yojson (value_for_key timestamp_of_yojson "DisabledDate")
          _list path);
     enabled_date =
       (option_of_yojson (value_for_key timestamp_of_yojson "EnabledDate")
          _list path);
     state =
       (option_of_yojson (value_for_key entity_state_of_yojson "State") _list
          path);
     type_ =
       (option_of_yojson (value_for_key resource_type_of_yojson "Type") _list
          path);
     name =
       (option_of_yojson (value_for_key resource_name_of_yojson "Name") _list
          path);
     email =
       (option_of_yojson (value_for_key email_address_of_yojson "Email")
          _list path);
     id =
       (option_of_yojson (value_for_key work_mail_identifier_of_yojson "Id")
          _list path)
   } : resource)
let resources_of_yojson tree path =
  list_of_yojson resource_of_yojson tree path
let list_resources_response_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     next_token =
       (option_of_yojson (value_for_key next_token_of_yojson "NextToken")
          _list path);
     resources =
       (option_of_yojson (value_for_key resources_of_yojson "Resources")
          _list path)
   } : list_resources_response)
let list_resources_filters_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     state =
       (option_of_yojson (value_for_key entity_state_of_yojson "State") _list
          path);
     primary_email_prefix =
       (option_of_yojson
          (value_for_key string__of_yojson "PrimaryEmailPrefix") _list path);
     name_prefix =
       (option_of_yojson (value_for_key string__of_yojson "NamePrefix") _list
          path)
   } : list_resources_filters)
let list_resources_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     filters =
       (option_of_yojson
          (value_for_key list_resources_filters_of_yojson "Filters") _list
          path);
     max_results =
       (option_of_yojson (value_for_key max_results_of_yojson "MaxResults")
          _list path);
     next_token =
       (option_of_yojson (value_for_key next_token_of_yojson "NextToken")
          _list path);
     organization_id =
       (value_for_key organization_id_of_yojson "OrganizationId" _list path)
   } : list_resources_request)
let member_type_of_yojson (tree : t) path =
  (let _list = assoc_of_yojson tree path in
   (match tree with
    | `String "USER" -> USER
    | `String "GROUP" -> GROUP
    | `String value ->
        raise (deserialize_unknown_enum_value_error path "MemberType" value)
    | _ -> raise (deserialize_wrong_type_error path "MemberType") : member_type) : 
  member_type)
let delegate_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     type_ = (value_for_key member_type_of_yojson "Type" _list path);
     id = (value_for_key string__of_yojson "Id" _list path)
   } : delegate)
let resource_delegates_of_yojson tree path =
  list_of_yojson delegate_of_yojson tree path
let list_resource_delegates_response_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     next_token =
       (option_of_yojson (value_for_key next_token_of_yojson "NextToken")
          _list path);
     delegates =
       (option_of_yojson
          (value_for_key resource_delegates_of_yojson "Delegates") _list path)
   } : list_resource_delegates_response)
let list_resource_delegates_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     max_results =
       (option_of_yojson (value_for_key max_results_of_yojson "MaxResults")
          _list path);
     next_token =
       (option_of_yojson (value_for_key next_token_of_yojson "NextToken")
          _list path);
     resource_id =
       (value_for_key entity_identifier_of_yojson "ResourceId" _list path);
     organization_id =
       (value_for_key organization_id_of_yojson "OrganizationId" _list path)
   } : list_resource_delegates_request)
let personal_access_token_id_of_yojson = string_of_yojson
let personal_access_token_name_of_yojson = string_of_yojson
let personal_access_token_scope_of_yojson = string_of_yojson
let personal_access_token_scope_list_of_yojson tree path =
  list_of_yojson personal_access_token_scope_of_yojson tree path
let personal_access_token_summary_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     scopes =
       (option_of_yojson
          (value_for_key personal_access_token_scope_list_of_yojson "Scopes")
          _list path);
     expires_time =
       (option_of_yojson (value_for_key timestamp_of_yojson "ExpiresTime")
          _list path);
     date_last_used =
       (option_of_yojson (value_for_key timestamp_of_yojson "DateLastUsed")
          _list path);
     date_created =
       (option_of_yojson (value_for_key timestamp_of_yojson "DateCreated")
          _list path);
     name =
       (option_of_yojson
          (value_for_key personal_access_token_name_of_yojson "Name") _list
          path);
     user_id =
       (option_of_yojson
          (value_for_key work_mail_identifier_of_yojson "UserId") _list path);
     personal_access_token_id =
       (option_of_yojson
          (value_for_key personal_access_token_id_of_yojson
             "PersonalAccessTokenId") _list path)
   } : personal_access_token_summary)
let personal_access_token_summary_list_of_yojson tree path =
  list_of_yojson personal_access_token_summary_of_yojson tree path
let list_personal_access_tokens_response_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     personal_access_token_summaries =
       (option_of_yojson
          (value_for_key personal_access_token_summary_list_of_yojson
             "PersonalAccessTokenSummaries") _list path);
     next_token =
       (option_of_yojson (value_for_key next_token_of_yojson "NextToken")
          _list path)
   } : list_personal_access_tokens_response)
let list_personal_access_tokens_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     max_results =
       (option_of_yojson (value_for_key max_results_of_yojson "MaxResults")
          _list path);
     next_token =
       (option_of_yojson (value_for_key next_token_of_yojson "NextToken")
          _list path);
     user_id =
       (option_of_yojson (value_for_key entity_identifier_of_yojson "UserId")
          _list path);
     organization_id =
       (value_for_key organization_id_of_yojson "OrganizationId" _list path)
   } : list_personal_access_tokens_request)
let organization_name_of_yojson = string_of_yojson
let organization_summary_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     state =
       (option_of_yojson (value_for_key string__of_yojson "State") _list path);
     error_message =
       (option_of_yojson (value_for_key string__of_yojson "ErrorMessage")
          _list path);
     default_mail_domain =
       (option_of_yojson
          (value_for_key domain_name_of_yojson "DefaultMailDomain") _list
          path);
     alias =
       (option_of_yojson (value_for_key organization_name_of_yojson "Alias")
          _list path);
     organization_id =
       (option_of_yojson
          (value_for_key organization_id_of_yojson "OrganizationId") _list
          path)
   } : organization_summary)
let organization_summaries_of_yojson tree path =
  list_of_yojson organization_summary_of_yojson tree path
let list_organizations_response_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     next_token =
       (option_of_yojson (value_for_key next_token_of_yojson "NextToken")
          _list path);
     organization_summaries =
       (option_of_yojson
          (value_for_key organization_summaries_of_yojson
             "OrganizationSummaries") _list path)
   } : list_organizations_response)
let list_organizations_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     max_results =
       (option_of_yojson (value_for_key max_results_of_yojson "MaxResults")
          _list path);
     next_token =
       (option_of_yojson (value_for_key next_token_of_yojson "NextToken")
          _list path)
   } : list_organizations_request)
let mobile_device_access_rule_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     date_modified =
       (option_of_yojson (value_for_key timestamp_of_yojson "DateModified")
          _list path);
     date_created =
       (option_of_yojson (value_for_key timestamp_of_yojson "DateCreated")
          _list path);
     not_device_user_agents =
       (option_of_yojson
          (value_for_key device_user_agent_list_of_yojson
             "NotDeviceUserAgents") _list path);
     device_user_agents =
       (option_of_yojson
          (value_for_key device_user_agent_list_of_yojson "DeviceUserAgents")
          _list path);
     not_device_operating_systems =
       (option_of_yojson
          (value_for_key device_operating_system_list_of_yojson
             "NotDeviceOperatingSystems") _list path);
     device_operating_systems =
       (option_of_yojson
          (value_for_key device_operating_system_list_of_yojson
             "DeviceOperatingSystems") _list path);
     not_device_models =
       (option_of_yojson
          (value_for_key device_model_list_of_yojson "NotDeviceModels") _list
          path);
     device_models =
       (option_of_yojson
          (value_for_key device_model_list_of_yojson "DeviceModels") _list
          path);
     not_device_types =
       (option_of_yojson
          (value_for_key device_type_list_of_yojson "NotDeviceTypes") _list
          path);
     device_types =
       (option_of_yojson
          (value_for_key device_type_list_of_yojson "DeviceTypes") _list path);
     effect_ =
       (option_of_yojson
          (value_for_key mobile_device_access_rule_effect_of_yojson "Effect")
          _list path);
     description =
       (option_of_yojson
          (value_for_key mobile_device_access_rule_description_of_yojson
             "Description") _list path);
     name =
       (option_of_yojson
          (value_for_key mobile_device_access_rule_name_of_yojson "Name")
          _list path);
     mobile_device_access_rule_id =
       (option_of_yojson
          (value_for_key mobile_device_access_rule_id_of_yojson
             "MobileDeviceAccessRuleId") _list path)
   } : mobile_device_access_rule)
let mobile_device_access_rules_list_of_yojson tree path =
  list_of_yojson mobile_device_access_rule_of_yojson tree path
let list_mobile_device_access_rules_response_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     rules =
       (option_of_yojson
          (value_for_key mobile_device_access_rules_list_of_yojson "Rules")
          _list path)
   } : list_mobile_device_access_rules_response)
let list_mobile_device_access_rules_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     organization_id =
       (value_for_key organization_id_of_yojson "OrganizationId" _list path)
   } : list_mobile_device_access_rules_request)
let mobile_device_access_override_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     date_modified =
       (option_of_yojson (value_for_key timestamp_of_yojson "DateModified")
          _list path);
     date_created =
       (option_of_yojson (value_for_key timestamp_of_yojson "DateCreated")
          _list path);
     description =
       (option_of_yojson
          (value_for_key mobile_device_access_rule_description_of_yojson
             "Description") _list path);
     effect_ =
       (option_of_yojson
          (value_for_key mobile_device_access_rule_effect_of_yojson "Effect")
          _list path);
     device_id =
       (option_of_yojson (value_for_key device_id_of_yojson "DeviceId") _list
          path);
     user_id =
       (option_of_yojson
          (value_for_key work_mail_identifier_of_yojson "UserId") _list path)
   } : mobile_device_access_override)
let mobile_device_access_overrides_list_of_yojson tree path =
  list_of_yojson mobile_device_access_override_of_yojson tree path
let list_mobile_device_access_overrides_response_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     next_token =
       (option_of_yojson (value_for_key next_token_of_yojson "NextToken")
          _list path);
     overrides =
       (option_of_yojson
          (value_for_key mobile_device_access_overrides_list_of_yojson
             "Overrides") _list path)
   } : list_mobile_device_access_overrides_response)
let list_mobile_device_access_overrides_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     max_results =
       (option_of_yojson (value_for_key max_results_of_yojson "MaxResults")
          _list path);
     next_token =
       (option_of_yojson (value_for_key next_token_of_yojson "NextToken")
          _list path);
     device_id =
       (option_of_yojson (value_for_key device_id_of_yojson "DeviceId") _list
          path);
     user_id =
       (option_of_yojson (value_for_key entity_identifier_of_yojson "UserId")
          _list path);
     organization_id =
       (value_for_key organization_id_of_yojson "OrganizationId" _list path)
   } : list_mobile_device_access_overrides_request)
let mail_domain_summary_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     default_domain =
       (option_of_yojson (value_for_key boolean__of_yojson "DefaultDomain")
          _list path);
     domain_name =
       (option_of_yojson (value_for_key domain_name_of_yojson "DomainName")
          _list path)
   } : mail_domain_summary)
let mail_domains_of_yojson tree path =
  list_of_yojson mail_domain_summary_of_yojson tree path
let list_mail_domains_response_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     next_token =
       (option_of_yojson (value_for_key next_token_of_yojson "NextToken")
          _list path);
     mail_domains =
       (option_of_yojson (value_for_key mail_domains_of_yojson "MailDomains")
          _list path)
   } : list_mail_domains_response)
let list_mail_domains_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     next_token =
       (option_of_yojson (value_for_key next_token_of_yojson "NextToken")
          _list path);
     max_results =
       (option_of_yojson (value_for_key max_results_of_yojson "MaxResults")
          _list path);
     organization_id =
       (value_for_key organization_id_of_yojson "OrganizationId" _list path)
   } : list_mail_domains_request)
let permission_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     permission_values =
       (value_for_key permission_values_of_yojson "PermissionValues" _list
          path);
     grantee_type =
       (value_for_key member_type_of_yojson "GranteeType" _list path);
     grantee_id =
       (value_for_key work_mail_identifier_of_yojson "GranteeId" _list path)
   } : permission)
let permissions_of_yojson tree path =
  list_of_yojson permission_of_yojson tree path
let list_mailbox_permissions_response_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     next_token =
       (option_of_yojson (value_for_key next_token_of_yojson "NextToken")
          _list path);
     permissions =
       (option_of_yojson (value_for_key permissions_of_yojson "Permissions")
          _list path)
   } : list_mailbox_permissions_response)
let list_mailbox_permissions_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     max_results =
       (option_of_yojson (value_for_key max_results_of_yojson "MaxResults")
          _list path);
     next_token =
       (option_of_yojson (value_for_key next_token_of_yojson "NextToken")
          _list path);
     entity_id =
       (value_for_key entity_identifier_of_yojson "EntityId" _list path);
     organization_id =
       (value_for_key organization_id_of_yojson "OrganizationId" _list path)
   } : list_mailbox_permissions_request)
let percentage_of_yojson = int_of_yojson
let mailbox_export_job_state_of_yojson (tree : t) path =
  (let _list = assoc_of_yojson tree path in
   (match tree with
    | `String "CANCELLED" -> CANCELLED
    | `String "FAILED" -> FAILED
    | `String "COMPLETED" -> COMPLETED
    | `String "RUNNING" -> RUNNING
    | `String value ->
        raise
          (deserialize_unknown_enum_value_error path "MailboxExportJobState"
             value)
    | _ -> raise (deserialize_wrong_type_error path "MailboxExportJobState") : 
     mailbox_export_job_state) : mailbox_export_job_state)
let mailbox_export_job_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     end_time =
       (option_of_yojson (value_for_key timestamp_of_yojson "EndTime") _list
          path);
     start_time =
       (option_of_yojson (value_for_key timestamp_of_yojson "StartTime")
          _list path);
     state =
       (option_of_yojson
          (value_for_key mailbox_export_job_state_of_yojson "State") _list
          path);
     estimated_progress =
       (option_of_yojson
          (value_for_key percentage_of_yojson "EstimatedProgress") _list path);
     s3_path =
       (option_of_yojson (value_for_key s3_object_key_of_yojson "S3Path")
          _list path);
     s3_bucket_name =
       (option_of_yojson
          (value_for_key s3_bucket_name_of_yojson "S3BucketName") _list path);
     description =
       (option_of_yojson (value_for_key description_of_yojson "Description")
          _list path);
     entity_id =
       (option_of_yojson
          (value_for_key work_mail_identifier_of_yojson "EntityId") _list
          path);
     job_id =
       (option_of_yojson
          (value_for_key mailbox_export_job_id_of_yojson "JobId") _list path)
   } : mailbox_export_job)
let jobs_of_yojson tree path =
  list_of_yojson mailbox_export_job_of_yojson tree path
let list_mailbox_export_jobs_response_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     next_token =
       (option_of_yojson (value_for_key next_token_of_yojson "NextToken")
          _list path);
     jobs =
       (option_of_yojson (value_for_key jobs_of_yojson "Jobs") _list path)
   } : list_mailbox_export_jobs_response)
let list_mailbox_export_jobs_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     max_results =
       (option_of_yojson (value_for_key max_results_of_yojson "MaxResults")
          _list path);
     next_token =
       (option_of_yojson (value_for_key next_token_of_yojson "NextToken")
          _list path);
     organization_id =
       (value_for_key organization_id_of_yojson "OrganizationId" _list path)
   } : list_mailbox_export_jobs_request)
let impersonation_role_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     date_modified =
       (option_of_yojson (value_for_key timestamp_of_yojson "DateModified")
          _list path);
     date_created =
       (option_of_yojson (value_for_key timestamp_of_yojson "DateCreated")
          _list path);
     type_ =
       (option_of_yojson
          (value_for_key impersonation_role_type_of_yojson "Type") _list path);
     name =
       (option_of_yojson
          (value_for_key impersonation_role_name_of_yojson "Name") _list path);
     impersonation_role_id =
       (option_of_yojson
          (value_for_key impersonation_role_id_of_yojson
             "ImpersonationRoleId") _list path)
   } : impersonation_role)
let impersonation_role_list_of_yojson tree path =
  list_of_yojson impersonation_role_of_yojson tree path
let list_impersonation_roles_response_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     next_token =
       (option_of_yojson (value_for_key next_token_of_yojson "NextToken")
          _list path);
     roles =
       (option_of_yojson
          (value_for_key impersonation_role_list_of_yojson "Roles") _list
          path)
   } : list_impersonation_roles_response)
let list_impersonation_roles_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     max_results =
       (option_of_yojson (value_for_key max_results_of_yojson "MaxResults")
          _list path);
     next_token =
       (option_of_yojson (value_for_key next_token_of_yojson "NextToken")
          _list path);
     organization_id =
       (value_for_key organization_id_of_yojson "OrganizationId" _list path)
   } : list_impersonation_roles_request)
let group_name_of_yojson = string_of_yojson
let group_identifier_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     group_name =
       (option_of_yojson (value_for_key group_name_of_yojson "GroupName")
          _list path);
     group_id =
       (option_of_yojson
          (value_for_key work_mail_identifier_of_yojson "GroupId") _list path)
   } : group_identifier)
let group_identifiers_of_yojson tree path =
  list_of_yojson group_identifier_of_yojson tree path
let list_groups_for_entity_response_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     next_token =
       (option_of_yojson (value_for_key next_token_of_yojson "NextToken")
          _list path);
     groups =
       (option_of_yojson (value_for_key group_identifiers_of_yojson "Groups")
          _list path)
   } : list_groups_for_entity_response)
let list_groups_for_entity_filters_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     group_name_prefix =
       (option_of_yojson (value_for_key string__of_yojson "GroupNamePrefix")
          _list path)
   } : list_groups_for_entity_filters)
let list_groups_for_entity_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     max_results =
       (option_of_yojson (value_for_key max_results_of_yojson "MaxResults")
          _list path);
     next_token =
       (option_of_yojson (value_for_key next_token_of_yojson "NextToken")
          _list path);
     filters =
       (option_of_yojson
          (value_for_key list_groups_for_entity_filters_of_yojson "Filters")
          _list path);
     entity_id =
       (value_for_key entity_identifier_of_yojson "EntityId" _list path);
     organization_id =
       (value_for_key organization_id_of_yojson "OrganizationId" _list path)
   } : list_groups_for_entity_request)
let group_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     disabled_date =
       (option_of_yojson (value_for_key timestamp_of_yojson "DisabledDate")
          _list path);
     enabled_date =
       (option_of_yojson (value_for_key timestamp_of_yojson "EnabledDate")
          _list path);
     state =
       (option_of_yojson (value_for_key entity_state_of_yojson "State") _list
          path);
     name =
       (option_of_yojson (value_for_key group_name_of_yojson "Name") _list
          path);
     email =
       (option_of_yojson (value_for_key email_address_of_yojson "Email")
          _list path);
     id =
       (option_of_yojson (value_for_key work_mail_identifier_of_yojson "Id")
          _list path)
   } : group)
let groups_of_yojson tree path = list_of_yojson group_of_yojson tree path
let list_groups_response_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     next_token =
       (option_of_yojson (value_for_key next_token_of_yojson "NextToken")
          _list path);
     groups =
       (option_of_yojson (value_for_key groups_of_yojson "Groups") _list path)
   } : list_groups_response)
let list_groups_filters_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     state =
       (option_of_yojson (value_for_key entity_state_of_yojson "State") _list
          path);
     primary_email_prefix =
       (option_of_yojson
          (value_for_key string__of_yojson "PrimaryEmailPrefix") _list path);
     name_prefix =
       (option_of_yojson (value_for_key string__of_yojson "NamePrefix") _list
          path)
   } : list_groups_filters)
let list_groups_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     filters =
       (option_of_yojson
          (value_for_key list_groups_filters_of_yojson "Filters") _list path);
     max_results =
       (option_of_yojson (value_for_key max_results_of_yojson "MaxResults")
          _list path);
     next_token =
       (option_of_yojson (value_for_key next_token_of_yojson "NextToken")
          _list path);
     organization_id =
       (value_for_key organization_id_of_yojson "OrganizationId" _list path)
   } : list_groups_request)
let member_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     disabled_date =
       (option_of_yojson (value_for_key timestamp_of_yojson "DisabledDate")
          _list path);
     enabled_date =
       (option_of_yojson (value_for_key timestamp_of_yojson "EnabledDate")
          _list path);
     state =
       (option_of_yojson (value_for_key entity_state_of_yojson "State") _list
          path);
     type_ =
       (option_of_yojson (value_for_key member_type_of_yojson "Type") _list
          path);
     name =
       (option_of_yojson (value_for_key string__of_yojson "Name") _list path);
     id =
       (option_of_yojson (value_for_key string__of_yojson "Id") _list path)
   } : member)
let members_of_yojson tree path = list_of_yojson member_of_yojson tree path
let list_group_members_response_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     next_token =
       (option_of_yojson (value_for_key next_token_of_yojson "NextToken")
          _list path);
     members =
       (option_of_yojson (value_for_key members_of_yojson "Members") _list
          path)
   } : list_group_members_response)
let list_group_members_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     max_results =
       (option_of_yojson (value_for_key max_results_of_yojson "MaxResults")
          _list path);
     next_token =
       (option_of_yojson (value_for_key next_token_of_yojson "NextToken")
          _list path);
     group_id =
       (value_for_key entity_identifier_of_yojson "GroupId" _list path);
     organization_id =
       (value_for_key organization_id_of_yojson "OrganizationId" _list path)
   } : list_group_members_request)
let availability_provider_type_of_yojson (tree : t) path =
  (let _list = assoc_of_yojson tree path in
   (match tree with
    | `String "LAMBDA" -> LAMBDA
    | `String "EWS" -> EWS
    | `String value ->
        raise
          (deserialize_unknown_enum_value_error path
             "AvailabilityProviderType" value)
    | _ ->
        raise (deserialize_wrong_type_error path "AvailabilityProviderType") : 
     availability_provider_type) : availability_provider_type)
let redacted_ews_availability_provider_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     ews_username =
       (option_of_yojson
          (value_for_key external_user_name_of_yojson "EwsUsername") _list
          path);
     ews_endpoint =
       (option_of_yojson (value_for_key url_of_yojson "EwsEndpoint") _list
          path)
   } : redacted_ews_availability_provider)
let availability_configuration_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     date_modified =
       (option_of_yojson (value_for_key timestamp_of_yojson "DateModified")
          _list path);
     date_created =
       (option_of_yojson (value_for_key timestamp_of_yojson "DateCreated")
          _list path);
     lambda_provider =
       (option_of_yojson
          (value_for_key lambda_availability_provider_of_yojson
             "LambdaProvider") _list path);
     ews_provider =
       (option_of_yojson
          (value_for_key redacted_ews_availability_provider_of_yojson
             "EwsProvider") _list path);
     provider_type =
       (option_of_yojson
          (value_for_key availability_provider_type_of_yojson "ProviderType")
          _list path);
     domain_name =
       (option_of_yojson (value_for_key domain_name_of_yojson "DomainName")
          _list path)
   } : availability_configuration)
let availability_configuration_list_of_yojson tree path =
  list_of_yojson availability_configuration_of_yojson tree path
let list_availability_configurations_response_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     next_token =
       (option_of_yojson (value_for_key next_token_of_yojson "NextToken")
          _list path);
     availability_configurations =
       (option_of_yojson
          (value_for_key availability_configuration_list_of_yojson
             "AvailabilityConfigurations") _list path)
   } : list_availability_configurations_response)
let list_availability_configurations_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     next_token =
       (option_of_yojson (value_for_key next_token_of_yojson "NextToken")
          _list path);
     max_results =
       (option_of_yojson (value_for_key max_results_of_yojson "MaxResults")
          _list path);
     organization_id =
       (value_for_key organization_id_of_yojson "OrganizationId" _list path)
   } : list_availability_configurations_request)
let aliases_of_yojson tree path =
  list_of_yojson email_address_of_yojson tree path
let list_aliases_response_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     next_token =
       (option_of_yojson (value_for_key next_token_of_yojson "NextToken")
          _list path);
     aliases =
       (option_of_yojson (value_for_key aliases_of_yojson "Aliases") _list
          path)
   } : list_aliases_response)
let list_aliases_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     max_results =
       (option_of_yojson (value_for_key max_results_of_yojson "MaxResults")
          _list path);
     next_token =
       (option_of_yojson (value_for_key next_token_of_yojson "NextToken")
          _list path);
     entity_id =
       (value_for_key work_mail_identifier_of_yojson "EntityId" _list path);
     organization_id =
       (value_for_key organization_id_of_yojson "OrganizationId" _list path)
   } : list_aliases_request)
let access_control_rule_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     not_impersonation_role_ids =
       (option_of_yojson
          (value_for_key impersonation_role_id_list_of_yojson
             "NotImpersonationRoleIds") _list path);
     impersonation_role_ids =
       (option_of_yojson
          (value_for_key impersonation_role_id_list_of_yojson
             "ImpersonationRoleIds") _list path);
     date_modified =
       (option_of_yojson (value_for_key timestamp_of_yojson "DateModified")
          _list path);
     date_created =
       (option_of_yojson (value_for_key timestamp_of_yojson "DateCreated")
          _list path);
     not_user_ids =
       (option_of_yojson (value_for_key user_id_list_of_yojson "NotUserIds")
          _list path);
     user_ids =
       (option_of_yojson (value_for_key user_id_list_of_yojson "UserIds")
          _list path);
     not_actions =
       (option_of_yojson (value_for_key actions_list_of_yojson "NotActions")
          _list path);
     actions =
       (option_of_yojson (value_for_key actions_list_of_yojson "Actions")
          _list path);
     not_ip_ranges =
       (option_of_yojson
          (value_for_key ip_range_list_of_yojson "NotIpRanges") _list path);
     ip_ranges =
       (option_of_yojson (value_for_key ip_range_list_of_yojson "IpRanges")
          _list path);
     description =
       (option_of_yojson
          (value_for_key access_control_rule_description_of_yojson
             "Description") _list path);
     effect_ =
       (option_of_yojson
          (value_for_key access_control_rule_effect_of_yojson "Effect") _list
          path);
     name =
       (option_of_yojson
          (value_for_key access_control_rule_name_of_yojson "Name") _list
          path)
   } : access_control_rule)
let access_control_rules_list_of_yojson tree path =
  list_of_yojson access_control_rule_of_yojson tree path
let list_access_control_rules_response_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     rules =
       (option_of_yojson
          (value_for_key access_control_rules_list_of_yojson "Rules") _list
          path)
   } : list_access_control_rules_response)
let list_access_control_rules_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     organization_id =
       (value_for_key organization_id_of_yojson "OrganizationId" _list path)
   } : list_access_control_rules_request)
let get_personal_access_token_metadata_response_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     scopes =
       (option_of_yojson
          (value_for_key personal_access_token_scope_list_of_yojson "Scopes")
          _list path);
     expires_time =
       (option_of_yojson (value_for_key timestamp_of_yojson "ExpiresTime")
          _list path);
     date_last_used =
       (option_of_yojson (value_for_key timestamp_of_yojson "DateLastUsed")
          _list path);
     date_created =
       (option_of_yojson (value_for_key timestamp_of_yojson "DateCreated")
          _list path);
     name =
       (option_of_yojson
          (value_for_key personal_access_token_name_of_yojson "Name") _list
          path);
     user_id =
       (option_of_yojson
          (value_for_key work_mail_identifier_of_yojson "UserId") _list path);
     personal_access_token_id =
       (option_of_yojson
          (value_for_key personal_access_token_id_of_yojson
             "PersonalAccessTokenId") _list path)
   } : get_personal_access_token_metadata_response)
let get_personal_access_token_metadata_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     personal_access_token_id =
       (value_for_key personal_access_token_id_of_yojson
          "PersonalAccessTokenId" _list path);
     organization_id =
       (value_for_key organization_id_of_yojson "OrganizationId" _list path)
   } : get_personal_access_token_metadata_request)
let get_mobile_device_access_override_response_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     date_modified =
       (option_of_yojson (value_for_key timestamp_of_yojson "DateModified")
          _list path);
     date_created =
       (option_of_yojson (value_for_key timestamp_of_yojson "DateCreated")
          _list path);
     description =
       (option_of_yojson
          (value_for_key mobile_device_access_rule_description_of_yojson
             "Description") _list path);
     effect_ =
       (option_of_yojson
          (value_for_key mobile_device_access_rule_effect_of_yojson "Effect")
          _list path);
     device_id =
       (option_of_yojson (value_for_key device_id_of_yojson "DeviceId") _list
          path);
     user_id =
       (option_of_yojson
          (value_for_key work_mail_identifier_of_yojson "UserId") _list path)
   } : get_mobile_device_access_override_response)
let get_mobile_device_access_override_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     device_id = (value_for_key device_id_of_yojson "DeviceId" _list path);
     user_id =
       (value_for_key entity_identifier_of_yojson "UserId" _list path);
     organization_id =
       (value_for_key organization_id_of_yojson "OrganizationId" _list path)
   } : get_mobile_device_access_override_request)
let mobile_device_access_matched_rule_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     name =
       (option_of_yojson
          (value_for_key mobile_device_access_rule_name_of_yojson "Name")
          _list path);
     mobile_device_access_rule_id =
       (option_of_yojson
          (value_for_key mobile_device_access_rule_id_of_yojson
             "MobileDeviceAccessRuleId") _list path)
   } : mobile_device_access_matched_rule)
let mobile_device_access_matched_rule_list_of_yojson tree path =
  list_of_yojson mobile_device_access_matched_rule_of_yojson tree path
let get_mobile_device_access_effect_response_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     matched_rules =
       (option_of_yojson
          (value_for_key mobile_device_access_matched_rule_list_of_yojson
             "MatchedRules") _list path);
     effect_ =
       (option_of_yojson
          (value_for_key mobile_device_access_rule_effect_of_yojson "Effect")
          _list path)
   } : get_mobile_device_access_effect_response)
let get_mobile_device_access_effect_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     device_user_agent =
       (option_of_yojson
          (value_for_key device_user_agent_of_yojson "DeviceUserAgent") _list
          path);
     device_operating_system =
       (option_of_yojson
          (value_for_key device_operating_system_of_yojson
             "DeviceOperatingSystem") _list path);
     device_model =
       (option_of_yojson (value_for_key device_model_of_yojson "DeviceModel")
          _list path);
     device_type =
       (option_of_yojson (value_for_key device_type_of_yojson "DeviceType")
          _list path);
     organization_id =
       (value_for_key organization_id_of_yojson "OrganizationId" _list path)
   } : get_mobile_device_access_effect_request)
let dns_record_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     value =
       (option_of_yojson (value_for_key string__of_yojson "Value") _list path);
     hostname =
       (option_of_yojson (value_for_key string__of_yojson "Hostname") _list
          path);
     type_ =
       (option_of_yojson (value_for_key string__of_yojson "Type") _list path)
   } : dns_record)
let dns_records_of_yojson tree path =
  list_of_yojson dns_record_of_yojson tree path
let dns_record_verification_status_of_yojson (tree : t) path =
  (let _list = assoc_of_yojson tree path in
   (match tree with
    | `String "FAILED" -> FAILED
    | `String "VERIFIED" -> VERIFIED
    | `String "PENDING" -> PENDING
    | `String value ->
        raise
          (deserialize_unknown_enum_value_error path
             "DnsRecordVerificationStatus" value)
    | _ ->
        raise
          (deserialize_wrong_type_error path "DnsRecordVerificationStatus") : 
     dns_record_verification_status) : dns_record_verification_status)
let get_mail_domain_response_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     dkim_verification_status =
       (option_of_yojson
          (value_for_key dns_record_verification_status_of_yojson
             "DkimVerificationStatus") _list path);
     ownership_verification_status =
       (option_of_yojson
          (value_for_key dns_record_verification_status_of_yojson
             "OwnershipVerificationStatus") _list path);
     is_default =
       (option_of_yojson (value_for_key boolean__of_yojson "IsDefault") _list
          path);
     is_test_domain =
       (option_of_yojson (value_for_key boolean__of_yojson "IsTestDomain")
          _list path);
     records =
       (option_of_yojson (value_for_key dns_records_of_yojson "Records")
          _list path)
   } : get_mail_domain_response)
let get_mail_domain_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     domain_name =
       (value_for_key work_mail_domain_name_of_yojson "DomainName" _list path);
     organization_id =
       (value_for_key organization_id_of_yojson "OrganizationId" _list path)
   } : get_mail_domain_request)
let mailbox_size_of_yojson = double_of_yojson
let get_mailbox_details_response_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     mailbox_size =
       (option_of_yojson (value_for_key mailbox_size_of_yojson "MailboxSize")
          _list path);
     mailbox_quota =
       (option_of_yojson
          (value_for_key mailbox_quota_of_yojson "MailboxQuota") _list path)
   } : get_mailbox_details_response)
let get_mailbox_details_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     user_id =
       (value_for_key entity_identifier_of_yojson "UserId" _list path);
     organization_id =
       (value_for_key organization_id_of_yojson "OrganizationId" _list path)
   } : get_mailbox_details_request)
let impersonation_matched_rule_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     name =
       (option_of_yojson
          (value_for_key impersonation_rule_name_of_yojson "Name") _list path);
     impersonation_rule_id =
       (option_of_yojson
          (value_for_key impersonation_rule_id_of_yojson
             "ImpersonationRuleId") _list path)
   } : impersonation_matched_rule)
let impersonation_matched_rule_list_of_yojson tree path =
  list_of_yojson impersonation_matched_rule_of_yojson tree path
let get_impersonation_role_effect_response_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     matched_rules =
       (option_of_yojson
          (value_for_key impersonation_matched_rule_list_of_yojson
             "MatchedRules") _list path);
     effect_ =
       (option_of_yojson (value_for_key access_effect_of_yojson "Effect")
          _list path);
     type_ =
       (option_of_yojson
          (value_for_key impersonation_role_type_of_yojson "Type") _list path)
   } : get_impersonation_role_effect_response)
let get_impersonation_role_effect_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     target_user =
       (value_for_key entity_identifier_of_yojson "TargetUser" _list path);
     impersonation_role_id =
       (value_for_key impersonation_role_id_of_yojson "ImpersonationRoleId"
          _list path);
     organization_id =
       (value_for_key organization_id_of_yojson "OrganizationId" _list path)
   } : get_impersonation_role_effect_request)
let get_impersonation_role_response_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     date_modified =
       (option_of_yojson (value_for_key timestamp_of_yojson "DateModified")
          _list path);
     date_created =
       (option_of_yojson (value_for_key timestamp_of_yojson "DateCreated")
          _list path);
     rules =
       (option_of_yojson
          (value_for_key impersonation_rule_list_of_yojson "Rules") _list
          path);
     description =
       (option_of_yojson
          (value_for_key impersonation_role_description_of_yojson
             "Description") _list path);
     type_ =
       (option_of_yojson
          (value_for_key impersonation_role_type_of_yojson "Type") _list path);
     name =
       (option_of_yojson
          (value_for_key impersonation_role_name_of_yojson "Name") _list path);
     impersonation_role_id =
       (option_of_yojson
          (value_for_key impersonation_role_id_of_yojson
             "ImpersonationRoleId") _list path)
   } : get_impersonation_role_response)
let get_impersonation_role_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     impersonation_role_id =
       (value_for_key impersonation_role_id_of_yojson "ImpersonationRoleId"
          _list path);
     organization_id =
       (value_for_key organization_id_of_yojson "OrganizationId" _list path)
   } : get_impersonation_role_request)
let get_default_retention_policy_response_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     folder_configurations =
       (option_of_yojson
          (value_for_key folder_configurations_of_yojson
             "FolderConfigurations") _list path);
     description =
       (option_of_yojson (value_for_key string__of_yojson "Description")
          _list path);
     name =
       (option_of_yojson (value_for_key short_string_of_yojson "Name") _list
          path);
     id =
       (option_of_yojson (value_for_key short_string_of_yojson "Id") _list
          path)
   } : get_default_retention_policy_response)
let get_default_retention_policy_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     organization_id =
       (value_for_key organization_id_of_yojson "OrganizationId" _list path)
   } : get_default_retention_policy_request)
let access_control_rule_name_list_of_yojson tree path =
  list_of_yojson access_control_rule_name_of_yojson tree path
let get_access_control_effect_response_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     matched_rules =
       (option_of_yojson
          (value_for_key access_control_rule_name_list_of_yojson
             "MatchedRules") _list path);
     effect_ =
       (option_of_yojson
          (value_for_key access_control_rule_effect_of_yojson "Effect") _list
          path)
   } : get_access_control_effect_response)
let ip_address_of_yojson = string_of_yojson
let get_access_control_effect_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     impersonation_role_id =
       (option_of_yojson
          (value_for_key impersonation_role_id_of_yojson
             "ImpersonationRoleId") _list path);
     user_id =
       (option_of_yojson
          (value_for_key work_mail_identifier_of_yojson "UserId") _list path);
     action =
       (value_for_key access_control_rule_action_of_yojson "Action" _list
          path);
     ip_address = (value_for_key ip_address_of_yojson "IpAddress" _list path);
     organization_id =
       (value_for_key organization_id_of_yojson "OrganizationId" _list path)
   } : get_access_control_effect_request)
let disassociate_member_from_group_response_of_yojson tree path =
  let _list = assoc_of_yojson tree path in (() : unit)
let disassociate_member_from_group_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     member_id =
       (value_for_key entity_identifier_of_yojson "MemberId" _list path);
     group_id =
       (value_for_key entity_identifier_of_yojson "GroupId" _list path);
     organization_id =
       (value_for_key organization_id_of_yojson "OrganizationId" _list path)
   } : disassociate_member_from_group_request)
let disassociate_delegate_from_resource_response_of_yojson tree path =
  let _list = assoc_of_yojson tree path in (() : unit)
let disassociate_delegate_from_resource_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     entity_id =
       (value_for_key entity_identifier_of_yojson "EntityId" _list path);
     resource_id =
       (value_for_key entity_identifier_of_yojson "ResourceId" _list path);
     organization_id =
       (value_for_key organization_id_of_yojson "OrganizationId" _list path)
   } : disassociate_delegate_from_resource_request)
let describe_user_response_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     identity_provider_identity_store_id =
       (option_of_yojson
          (value_for_key identity_provider_identity_store_id_of_yojson
             "IdentityProviderIdentityStoreId") _list path);
     identity_provider_user_id =
       (option_of_yojson
          (value_for_key identity_provider_user_id_of_yojson
             "IdentityProviderUserId") _list path);
     office =
       (option_of_yojson (value_for_key user_attribute_of_yojson "Office")
          _list path);
     country =
       (option_of_yojson (value_for_key user_attribute_of_yojson "Country")
          _list path);
     department =
       (option_of_yojson
          (value_for_key user_attribute_of_yojson "Department") _list path);
     zip_code =
       (option_of_yojson (value_for_key user_attribute_of_yojson "ZipCode")
          _list path);
     company =
       (option_of_yojson (value_for_key user_attribute_of_yojson "Company")
          _list path);
     city =
       (option_of_yojson (value_for_key user_attribute_of_yojson "City")
          _list path);
     job_title =
       (option_of_yojson (value_for_key user_attribute_of_yojson "JobTitle")
          _list path);
     street =
       (option_of_yojson (value_for_key user_attribute_of_yojson "Street")
          _list path);
     telephone =
       (option_of_yojson (value_for_key user_attribute_of_yojson "Telephone")
          _list path);
     initials =
       (option_of_yojson (value_for_key user_attribute_of_yojson "Initials")
          _list path);
     hidden_from_global_address_list =
       (option_of_yojson
          (value_for_key boolean__of_yojson "HiddenFromGlobalAddressList")
          _list path);
     last_name =
       (option_of_yojson (value_for_key user_attribute_of_yojson "LastName")
          _list path);
     first_name =
       (option_of_yojson (value_for_key user_attribute_of_yojson "FirstName")
          _list path);
     mailbox_deprovisioned_date =
       (option_of_yojson
          (value_for_key timestamp_of_yojson "MailboxDeprovisionedDate")
          _list path);
     mailbox_provisioned_date =
       (option_of_yojson
          (value_for_key timestamp_of_yojson "MailboxProvisionedDate") _list
          path);
     disabled_date =
       (option_of_yojson (value_for_key timestamp_of_yojson "DisabledDate")
          _list path);
     enabled_date =
       (option_of_yojson (value_for_key timestamp_of_yojson "EnabledDate")
          _list path);
     user_role =
       (option_of_yojson (value_for_key user_role_of_yojson "UserRole") _list
          path);
     state =
       (option_of_yojson (value_for_key entity_state_of_yojson "State") _list
          path);
     display_name =
       (option_of_yojson
          (value_for_key user_attribute_of_yojson "DisplayName") _list path);
     email =
       (option_of_yojson (value_for_key email_address_of_yojson "Email")
          _list path);
     name =
       (option_of_yojson (value_for_key user_name_of_yojson "Name") _list
          path);
     user_id =
       (option_of_yojson
          (value_for_key work_mail_identifier_of_yojson "UserId") _list path)
   } : describe_user_response)
let describe_user_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     user_id =
       (value_for_key entity_identifier_of_yojson "UserId" _list path);
     organization_id =
       (value_for_key organization_id_of_yojson "OrganizationId" _list path)
   } : describe_user_request)
let resource_id_of_yojson = string_of_yojson
let describe_resource_response_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     hidden_from_global_address_list =
       (option_of_yojson
          (value_for_key boolean__of_yojson "HiddenFromGlobalAddressList")
          _list path);
     description =
       (option_of_yojson
          (value_for_key resource_description_of_yojson "Description") _list
          path);
     disabled_date =
       (option_of_yojson (value_for_key timestamp_of_yojson "DisabledDate")
          _list path);
     enabled_date =
       (option_of_yojson (value_for_key timestamp_of_yojson "EnabledDate")
          _list path);
     state =
       (option_of_yojson (value_for_key entity_state_of_yojson "State") _list
          path);
     booking_options =
       (option_of_yojson
          (value_for_key booking_options_of_yojson "BookingOptions") _list
          path);
     type_ =
       (option_of_yojson (value_for_key resource_type_of_yojson "Type") _list
          path);
     name =
       (option_of_yojson (value_for_key resource_name_of_yojson "Name") _list
          path);
     email =
       (option_of_yojson (value_for_key email_address_of_yojson "Email")
          _list path);
     resource_id =
       (option_of_yojson (value_for_key resource_id_of_yojson "ResourceId")
          _list path)
   } : describe_resource_response)
let describe_resource_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     resource_id =
       (value_for_key entity_identifier_of_yojson "ResourceId" _list path);
     organization_id =
       (value_for_key organization_id_of_yojson "OrganizationId" _list path)
   } : describe_resource_request)
let describe_organization_response_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     interoperability_enabled =
       (option_of_yojson
          (value_for_key boolean__of_yojson "InteroperabilityEnabled") _list
          path);
     migration_admin =
       (option_of_yojson
          (value_for_key work_mail_identifier_of_yojson "MigrationAdmin")
          _list path);
     ar_n =
       (option_of_yojson (value_for_key amazon_resource_name_of_yojson "ARN")
          _list path);
     error_message =
       (option_of_yojson (value_for_key string__of_yojson "ErrorMessage")
          _list path);
     completed_date =
       (option_of_yojson (value_for_key timestamp_of_yojson "CompletedDate")
          _list path);
     default_mail_domain =
       (option_of_yojson
          (value_for_key string__of_yojson "DefaultMailDomain") _list path);
     directory_type =
       (option_of_yojson (value_for_key string__of_yojson "DirectoryType")
          _list path);
     directory_id =
       (option_of_yojson (value_for_key string__of_yojson "DirectoryId")
          _list path);
     state =
       (option_of_yojson (value_for_key string__of_yojson "State") _list path);
     alias =
       (option_of_yojson (value_for_key organization_name_of_yojson "Alias")
          _list path);
     organization_id =
       (option_of_yojson
          (value_for_key organization_id_of_yojson "OrganizationId") _list
          path)
   } : describe_organization_response)
let describe_organization_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     organization_id =
       (value_for_key organization_id_of_yojson "OrganizationId" _list path)
   } : describe_organization_request)
let mailbox_export_error_info_of_yojson = string_of_yojson
let describe_mailbox_export_job_response_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     end_time =
       (option_of_yojson (value_for_key timestamp_of_yojson "EndTime") _list
          path);
     start_time =
       (option_of_yojson (value_for_key timestamp_of_yojson "StartTime")
          _list path);
     error_info =
       (option_of_yojson
          (value_for_key mailbox_export_error_info_of_yojson "ErrorInfo")
          _list path);
     state =
       (option_of_yojson
          (value_for_key mailbox_export_job_state_of_yojson "State") _list
          path);
     estimated_progress =
       (option_of_yojson
          (value_for_key percentage_of_yojson "EstimatedProgress") _list path);
     s3_path =
       (option_of_yojson (value_for_key s3_object_key_of_yojson "S3Path")
          _list path);
     s3_prefix =
       (option_of_yojson (value_for_key s3_object_key_of_yojson "S3Prefix")
          _list path);
     s3_bucket_name =
       (option_of_yojson
          (value_for_key s3_bucket_name_of_yojson "S3BucketName") _list path);
     kms_key_arn =
       (option_of_yojson (value_for_key kms_key_arn_of_yojson "KmsKeyArn")
          _list path);
     role_arn =
       (option_of_yojson (value_for_key role_arn_of_yojson "RoleArn") _list
          path);
     description =
       (option_of_yojson (value_for_key description_of_yojson "Description")
          _list path);
     entity_id =
       (option_of_yojson
          (value_for_key work_mail_identifier_of_yojson "EntityId") _list
          path)
   } : describe_mailbox_export_job_response)
let describe_mailbox_export_job_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     organization_id =
       (value_for_key organization_id_of_yojson "OrganizationId" _list path);
     job_id =
       (value_for_key mailbox_export_job_id_of_yojson "JobId" _list path)
   } : describe_mailbox_export_job_request)
let describe_inbound_dmarc_settings_response_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     enforced =
       (option_of_yojson (value_for_key boolean__of_yojson "Enforced") _list
          path)
   } : describe_inbound_dmarc_settings_response)
let describe_inbound_dmarc_settings_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     organization_id =
       (value_for_key organization_id_of_yojson "OrganizationId" _list path)
   } : describe_inbound_dmarc_settings_request)
let describe_identity_provider_configuration_response_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     personal_access_token_configuration =
       (option_of_yojson
          (value_for_key personal_access_token_configuration_of_yojson
             "PersonalAccessTokenConfiguration") _list path);
     identity_center_configuration =
       (option_of_yojson
          (value_for_key identity_center_configuration_of_yojson
             "IdentityCenterConfiguration") _list path);
     authentication_mode =
       (option_of_yojson
          (value_for_key identity_provider_authentication_mode_of_yojson
             "AuthenticationMode") _list path)
   } : describe_identity_provider_configuration_response)
let describe_identity_provider_configuration_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     organization_id =
       (value_for_key organization_id_of_yojson "OrganizationId" _list path)
   } : describe_identity_provider_configuration_request)
let describe_group_response_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     hidden_from_global_address_list =
       (option_of_yojson
          (value_for_key boolean__of_yojson "HiddenFromGlobalAddressList")
          _list path);
     disabled_date =
       (option_of_yojson (value_for_key timestamp_of_yojson "DisabledDate")
          _list path);
     enabled_date =
       (option_of_yojson (value_for_key timestamp_of_yojson "EnabledDate")
          _list path);
     state =
       (option_of_yojson (value_for_key entity_state_of_yojson "State") _list
          path);
     email =
       (option_of_yojson (value_for_key email_address_of_yojson "Email")
          _list path);
     name =
       (option_of_yojson (value_for_key group_name_of_yojson "Name") _list
          path);
     group_id =
       (option_of_yojson
          (value_for_key work_mail_identifier_of_yojson "GroupId") _list path)
   } : describe_group_response)
let describe_group_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     group_id =
       (value_for_key entity_identifier_of_yojson "GroupId" _list path);
     organization_id =
       (value_for_key organization_id_of_yojson "OrganizationId" _list path)
   } : describe_group_request)
let entity_type_of_yojson (tree : t) path =
  (let _list = assoc_of_yojson tree path in
   (match tree with
    | `String "RESOURCE" -> RESOURCE
    | `String "USER" -> USER
    | `String "GROUP" -> GROUP
    | `String value ->
        raise (deserialize_unknown_enum_value_error path "EntityType" value)
    | _ -> raise (deserialize_wrong_type_error path "EntityType") : entity_type) : 
  entity_type)
let describe_entity_response_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     type_ =
       (option_of_yojson (value_for_key entity_type_of_yojson "Type") _list
          path);
     name =
       (option_of_yojson (value_for_key string__of_yojson "Name") _list path);
     entity_id =
       (option_of_yojson
          (value_for_key work_mail_identifier_of_yojson "EntityId") _list
          path)
   } : describe_entity_response)
let describe_entity_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     email = (value_for_key email_address_of_yojson "Email" _list path);
     organization_id =
       (value_for_key organization_id_of_yojson "OrganizationId" _list path)
   } : describe_entity_request)
let describe_email_monitoring_configuration_response_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     log_group_arn =
       (option_of_yojson
          (value_for_key log_group_arn_of_yojson "LogGroupArn") _list path);
     role_arn =
       (option_of_yojson (value_for_key role_arn_of_yojson "RoleArn") _list
          path)
   } : describe_email_monitoring_configuration_response)
let describe_email_monitoring_configuration_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     organization_id =
       (value_for_key organization_id_of_yojson "OrganizationId" _list path)
   } : describe_email_monitoring_configuration_request)
let invalid_custom_ses_configuration_exception_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     message =
       (option_of_yojson (value_for_key string__of_yojson "Message") _list
          path)
   } : invalid_custom_ses_configuration_exception)
let deregister_mail_domain_response_of_yojson tree path =
  let _list = assoc_of_yojson tree path in (() : unit)
let deregister_mail_domain_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     domain_name =
       (value_for_key work_mail_domain_name_of_yojson "DomainName" _list path);
     organization_id =
       (value_for_key organization_id_of_yojson "OrganizationId" _list path)
   } : deregister_mail_domain_request)
let deregister_from_work_mail_response_of_yojson tree path =
  let _list = assoc_of_yojson tree path in (() : unit)
let deregister_from_work_mail_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     entity_id =
       (value_for_key entity_identifier_of_yojson "EntityId" _list path);
     organization_id =
       (value_for_key organization_id_of_yojson "OrganizationId" _list path)
   } : deregister_from_work_mail_request)
let delete_user_response_of_yojson tree path =
  let _list = assoc_of_yojson tree path in (() : unit)
let delete_user_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     user_id =
       (value_for_key entity_identifier_of_yojson "UserId" _list path);
     organization_id =
       (value_for_key organization_id_of_yojson "OrganizationId" _list path)
   } : delete_user_request)
let delete_retention_policy_response_of_yojson tree path =
  let _list = assoc_of_yojson tree path in (() : unit)
let delete_retention_policy_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     id = (value_for_key short_string_of_yojson "Id" _list path);
     organization_id =
       (value_for_key organization_id_of_yojson "OrganizationId" _list path)
   } : delete_retention_policy_request)
let delete_resource_response_of_yojson tree path =
  let _list = assoc_of_yojson tree path in (() : unit)
let delete_resource_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     resource_id =
       (value_for_key entity_identifier_of_yojson "ResourceId" _list path);
     organization_id =
       (value_for_key organization_id_of_yojson "OrganizationId" _list path)
   } : delete_resource_request)
let delete_personal_access_token_response_of_yojson tree path =
  let _list = assoc_of_yojson tree path in (() : unit)
let delete_personal_access_token_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     personal_access_token_id =
       (value_for_key personal_access_token_id_of_yojson
          "PersonalAccessTokenId" _list path);
     organization_id =
       (value_for_key organization_id_of_yojson "OrganizationId" _list path)
   } : delete_personal_access_token_request)
let delete_organization_response_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     state =
       (option_of_yojson (value_for_key string__of_yojson "State") _list path);
     organization_id =
       (option_of_yojson
          (value_for_key organization_id_of_yojson "OrganizationId") _list
          path)
   } : delete_organization_response)
let delete_organization_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     delete_identity_center_application =
       (option_of_yojson
          (value_for_key boolean__of_yojson "DeleteIdentityCenterApplication")
          _list path);
     force_delete =
       (option_of_yojson (value_for_key boolean__of_yojson "ForceDelete")
          _list path);
     delete_directory =
       (value_for_key boolean__of_yojson "DeleteDirectory" _list path);
     organization_id =
       (value_for_key organization_id_of_yojson "OrganizationId" _list path);
     client_token =
       (option_of_yojson
          (value_for_key idempotency_client_token_of_yojson "ClientToken")
          _list path)
   } : delete_organization_request)
let delete_mobile_device_access_rule_response_of_yojson tree path =
  let _list = assoc_of_yojson tree path in (() : unit)
let delete_mobile_device_access_rule_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     mobile_device_access_rule_id =
       (value_for_key mobile_device_access_rule_id_of_yojson
          "MobileDeviceAccessRuleId" _list path);
     organization_id =
       (value_for_key organization_id_of_yojson "OrganizationId" _list path)
   } : delete_mobile_device_access_rule_request)
let delete_mobile_device_access_override_response_of_yojson tree path =
  let _list = assoc_of_yojson tree path in (() : unit)
let delete_mobile_device_access_override_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     device_id = (value_for_key device_id_of_yojson "DeviceId" _list path);
     user_id =
       (value_for_key entity_identifier_of_yojson "UserId" _list path);
     organization_id =
       (value_for_key organization_id_of_yojson "OrganizationId" _list path)
   } : delete_mobile_device_access_override_request)
let delete_mailbox_permissions_response_of_yojson tree path =
  let _list = assoc_of_yojson tree path in (() : unit)
let delete_mailbox_permissions_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     grantee_id =
       (value_for_key entity_identifier_of_yojson "GranteeId" _list path);
     entity_id =
       (value_for_key entity_identifier_of_yojson "EntityId" _list path);
     organization_id =
       (value_for_key organization_id_of_yojson "OrganizationId" _list path)
   } : delete_mailbox_permissions_request)
let delete_impersonation_role_response_of_yojson tree path =
  let _list = assoc_of_yojson tree path in (() : unit)
let delete_impersonation_role_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     impersonation_role_id =
       (value_for_key impersonation_role_id_of_yojson "ImpersonationRoleId"
          _list path);
     organization_id =
       (value_for_key organization_id_of_yojson "OrganizationId" _list path)
   } : delete_impersonation_role_request)
let delete_identity_provider_configuration_response_of_yojson tree path =
  let _list = assoc_of_yojson tree path in (() : unit)
let delete_identity_provider_configuration_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     organization_id =
       (value_for_key organization_id_of_yojson "OrganizationId" _list path)
   } : delete_identity_provider_configuration_request)
let delete_identity_center_application_response_of_yojson tree path =
  let _list = assoc_of_yojson tree path in (() : unit)
let delete_identity_center_application_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     application_arn =
       (value_for_key application_arn_of_yojson "ApplicationArn" _list path)
   } : delete_identity_center_application_request)
let delete_group_response_of_yojson tree path =
  let _list = assoc_of_yojson tree path in (() : unit)
let delete_group_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     group_id =
       (value_for_key entity_identifier_of_yojson "GroupId" _list path);
     organization_id =
       (value_for_key organization_id_of_yojson "OrganizationId" _list path)
   } : delete_group_request)
let delete_email_monitoring_configuration_response_of_yojson tree path =
  let _list = assoc_of_yojson tree path in (() : unit)
let delete_email_monitoring_configuration_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     organization_id =
       (value_for_key organization_id_of_yojson "OrganizationId" _list path)
   } : delete_email_monitoring_configuration_request)
let delete_availability_configuration_response_of_yojson tree path =
  let _list = assoc_of_yojson tree path in (() : unit)
let delete_availability_configuration_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     domain_name =
       (value_for_key domain_name_of_yojson "DomainName" _list path);
     organization_id =
       (value_for_key organization_id_of_yojson "OrganizationId" _list path)
   } : delete_availability_configuration_request)
let delete_alias_response_of_yojson tree path =
  let _list = assoc_of_yojson tree path in (() : unit)
let delete_alias_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     alias = (value_for_key email_address_of_yojson "Alias" _list path);
     entity_id =
       (value_for_key work_mail_identifier_of_yojson "EntityId" _list path);
     organization_id =
       (value_for_key organization_id_of_yojson "OrganizationId" _list path)
   } : delete_alias_request)
let delete_access_control_rule_response_of_yojson tree path =
  let _list = assoc_of_yojson tree path in (() : unit)
let delete_access_control_rule_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     name =
       (value_for_key access_control_rule_name_of_yojson "Name" _list path);
     organization_id =
       (value_for_key organization_id_of_yojson "OrganizationId" _list path)
   } : delete_access_control_rule_request)
let reserved_name_exception_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     message =
       (option_of_yojson (value_for_key string__of_yojson "Message") _list
          path)
   } : reserved_name_exception)
let create_user_response_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     user_id =
       (option_of_yojson
          (value_for_key work_mail_identifier_of_yojson "UserId") _list path)
   } : create_user_response)
let create_user_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     identity_provider_user_id =
       (option_of_yojson
          (value_for_key identity_provider_user_id_of_yojson
             "IdentityProviderUserId") _list path);
     hidden_from_global_address_list =
       (option_of_yojson
          (value_for_key boolean__of_yojson "HiddenFromGlobalAddressList")
          _list path);
     last_name =
       (option_of_yojson (value_for_key user_attribute_of_yojson "LastName")
          _list path);
     first_name =
       (option_of_yojson (value_for_key user_attribute_of_yojson "FirstName")
          _list path);
     role =
       (option_of_yojson (value_for_key user_role_of_yojson "Role") _list
          path);
     password =
       (option_of_yojson (value_for_key password_of_yojson "Password") _list
          path);
     display_name =
       (value_for_key user_attribute_of_yojson "DisplayName" _list path);
     name = (value_for_key user_name_of_yojson "Name" _list path);
     organization_id =
       (value_for_key organization_id_of_yojson "OrganizationId" _list path)
   } : create_user_request)
let create_resource_response_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     resource_id =
       (option_of_yojson (value_for_key resource_id_of_yojson "ResourceId")
          _list path)
   } : create_resource_response)
let create_resource_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     hidden_from_global_address_list =
       (option_of_yojson
          (value_for_key boolean__of_yojson "HiddenFromGlobalAddressList")
          _list path);
     description =
       (option_of_yojson
          (value_for_key resource_description_of_yojson "Description") _list
          path);
     type_ = (value_for_key resource_type_of_yojson "Type" _list path);
     name = (value_for_key resource_name_of_yojson "Name" _list path);
     organization_id =
       (value_for_key organization_id_of_yojson "OrganizationId" _list path)
   } : create_resource_request)
let directory_in_use_exception_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     message =
       (option_of_yojson (value_for_key string__of_yojson "Message") _list
          path)
   } : directory_in_use_exception)
let create_organization_response_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     organization_id =
       (option_of_yojson
          (value_for_key organization_id_of_yojson "OrganizationId") _list
          path)
   } : create_organization_response)
let directory_id_of_yojson = string_of_yojson
let hosted_zone_id_of_yojson = string_of_yojson
let domain_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     hosted_zone_id =
       (option_of_yojson
          (value_for_key hosted_zone_id_of_yojson "HostedZoneId") _list path);
     domain_name =
       (value_for_key domain_name_of_yojson "DomainName" _list path)
   } : domain)
let domains_of_yojson tree path = list_of_yojson domain_of_yojson tree path
let create_organization_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     enable_interoperability =
       (option_of_yojson
          (value_for_key boolean__of_yojson "EnableInteroperability") _list
          path);
     kms_key_arn =
       (option_of_yojson (value_for_key kms_key_arn_of_yojson "KmsKeyArn")
          _list path);
     domains =
       (option_of_yojson (value_for_key domains_of_yojson "Domains") _list
          path);
     client_token =
       (option_of_yojson
          (value_for_key idempotency_client_token_of_yojson "ClientToken")
          _list path);
     alias = (value_for_key organization_name_of_yojson "Alias" _list path);
     directory_id =
       (option_of_yojson (value_for_key directory_id_of_yojson "DirectoryId")
          _list path)
   } : create_organization_request)
let create_mobile_device_access_rule_response_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     mobile_device_access_rule_id =
       (option_of_yojson
          (value_for_key mobile_device_access_rule_id_of_yojson
             "MobileDeviceAccessRuleId") _list path)
   } : create_mobile_device_access_rule_response)
let create_mobile_device_access_rule_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     not_device_user_agents =
       (option_of_yojson
          (value_for_key device_user_agent_list_of_yojson
             "NotDeviceUserAgents") _list path);
     device_user_agents =
       (option_of_yojson
          (value_for_key device_user_agent_list_of_yojson "DeviceUserAgents")
          _list path);
     not_device_operating_systems =
       (option_of_yojson
          (value_for_key device_operating_system_list_of_yojson
             "NotDeviceOperatingSystems") _list path);
     device_operating_systems =
       (option_of_yojson
          (value_for_key device_operating_system_list_of_yojson
             "DeviceOperatingSystems") _list path);
     not_device_models =
       (option_of_yojson
          (value_for_key device_model_list_of_yojson "NotDeviceModels") _list
          path);
     device_models =
       (option_of_yojson
          (value_for_key device_model_list_of_yojson "DeviceModels") _list
          path);
     not_device_types =
       (option_of_yojson
          (value_for_key device_type_list_of_yojson "NotDeviceTypes") _list
          path);
     device_types =
       (option_of_yojson
          (value_for_key device_type_list_of_yojson "DeviceTypes") _list path);
     effect_ =
       (value_for_key mobile_device_access_rule_effect_of_yojson "Effect"
          _list path);
     description =
       (option_of_yojson
          (value_for_key mobile_device_access_rule_description_of_yojson
             "Description") _list path);
     name =
       (value_for_key mobile_device_access_rule_name_of_yojson "Name" _list
          path);
     client_token =
       (option_of_yojson
          (value_for_key idempotency_client_token_of_yojson "ClientToken")
          _list path);
     organization_id =
       (value_for_key organization_id_of_yojson "OrganizationId" _list path)
   } : create_mobile_device_access_rule_request)
let create_impersonation_role_response_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     impersonation_role_id =
       (option_of_yojson
          (value_for_key impersonation_role_id_of_yojson
             "ImpersonationRoleId") _list path)
   } : create_impersonation_role_response)
let create_impersonation_role_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     rules =
       (value_for_key impersonation_rule_list_of_yojson "Rules" _list path);
     description =
       (option_of_yojson
          (value_for_key impersonation_role_description_of_yojson
             "Description") _list path);
     type_ =
       (value_for_key impersonation_role_type_of_yojson "Type" _list path);
     name =
       (value_for_key impersonation_role_name_of_yojson "Name" _list path);
     organization_id =
       (value_for_key organization_id_of_yojson "OrganizationId" _list path);
     client_token =
       (option_of_yojson
          (value_for_key idempotency_client_token_of_yojson "ClientToken")
          _list path)
   } : create_impersonation_role_request)
let create_identity_center_application_response_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     application_arn =
       (option_of_yojson
          (value_for_key application_arn_of_yojson "ApplicationArn") _list
          path)
   } : create_identity_center_application_response)
let identity_center_application_name_of_yojson = string_of_yojson
let create_identity_center_application_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     client_token =
       (option_of_yojson
          (value_for_key idempotency_client_token_of_yojson "ClientToken")
          _list path);
     instance_arn =
       (value_for_key instance_arn_of_yojson "InstanceArn" _list path);
     name =
       (value_for_key identity_center_application_name_of_yojson "Name" _list
          path)
   } : create_identity_center_application_request)
let create_group_response_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     group_id =
       (option_of_yojson
          (value_for_key work_mail_identifier_of_yojson "GroupId") _list path)
   } : create_group_response)
let create_group_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     hidden_from_global_address_list =
       (option_of_yojson
          (value_for_key boolean__of_yojson "HiddenFromGlobalAddressList")
          _list path);
     name = (value_for_key group_name_of_yojson "Name" _list path);
     organization_id =
       (value_for_key organization_id_of_yojson "OrganizationId" _list path)
   } : create_group_request)
let create_availability_configuration_response_of_yojson tree path =
  let _list = assoc_of_yojson tree path in (() : unit)
let create_availability_configuration_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     lambda_provider =
       (option_of_yojson
          (value_for_key lambda_availability_provider_of_yojson
             "LambdaProvider") _list path);
     ews_provider =
       (option_of_yojson
          (value_for_key ews_availability_provider_of_yojson "EwsProvider")
          _list path);
     domain_name =
       (value_for_key domain_name_of_yojson "DomainName" _list path);
     organization_id =
       (value_for_key organization_id_of_yojson "OrganizationId" _list path);
     client_token =
       (option_of_yojson
          (value_for_key idempotency_client_token_of_yojson "ClientToken")
          _list path)
   } : create_availability_configuration_request)
let create_alias_response_of_yojson tree path =
  let _list = assoc_of_yojson tree path in (() : unit)
let create_alias_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     alias = (value_for_key email_address_of_yojson "Alias" _list path);
     entity_id =
       (value_for_key work_mail_identifier_of_yojson "EntityId" _list path);
     organization_id =
       (value_for_key organization_id_of_yojson "OrganizationId" _list path)
   } : create_alias_request)
let cancel_mailbox_export_job_response_of_yojson tree path =
  let _list = assoc_of_yojson tree path in (() : unit)
let cancel_mailbox_export_job_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     organization_id =
       (value_for_key organization_id_of_yojson "OrganizationId" _list path);
     job_id =
       (value_for_key mailbox_export_job_id_of_yojson "JobId" _list path);
     client_token =
       (value_for_key idempotency_client_token_of_yojson "ClientToken" _list
          path)
   } : cancel_mailbox_export_job_request)
let impersonation_token_of_yojson = string_of_yojson
let expires_in_of_yojson = long_of_yojson
let assume_impersonation_role_response_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     expires_in =
       (option_of_yojson (value_for_key expires_in_of_yojson "ExpiresIn")
          _list path);
     token =
       (option_of_yojson
          (value_for_key impersonation_token_of_yojson "Token") _list path)
   } : assume_impersonation_role_response)
let assume_impersonation_role_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     impersonation_role_id =
       (value_for_key impersonation_role_id_of_yojson "ImpersonationRoleId"
          _list path);
     organization_id =
       (value_for_key organization_id_of_yojson "OrganizationId" _list path)
   } : assume_impersonation_role_request)
let associate_member_to_group_response_of_yojson tree path =
  let _list = assoc_of_yojson tree path in (() : unit)
let associate_member_to_group_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     member_id =
       (value_for_key entity_identifier_of_yojson "MemberId" _list path);
     group_id =
       (value_for_key entity_identifier_of_yojson "GroupId" _list path);
     organization_id =
       (value_for_key organization_id_of_yojson "OrganizationId" _list path)
   } : associate_member_to_group_request)
let associate_delegate_to_resource_response_of_yojson tree path =
  let _list = assoc_of_yojson tree path in (() : unit)
let associate_delegate_to_resource_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     entity_id =
       (value_for_key entity_identifier_of_yojson "EntityId" _list path);
     resource_id =
       (value_for_key entity_identifier_of_yojson "ResourceId" _list path);
     organization_id =
       (value_for_key organization_id_of_yojson "OrganizationId" _list path)
   } : associate_delegate_to_resource_request)