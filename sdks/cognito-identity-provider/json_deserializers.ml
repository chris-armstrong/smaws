open Smaws_Lib.Json.DeserializeHelpers
open Types

let wrapped_integer_type_of_yojson = int_of_yojson
let wrapped_boolean_type_of_yojson = bool_of_yojson
let message_type_of_yojson = string_of_yojson

let web_authn_relying_party_mismatch_exception_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({ message = option_of_yojson (value_for_key message_type_of_yojson "message") _list path }
    : web_authn_relying_party_mismatch_exception)

let web_authn_origin_not_allowed_exception_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({ message = option_of_yojson (value_for_key message_type_of_yojson "message") _list path }
    : web_authn_origin_not_allowed_exception)

let web_authn_not_enabled_exception_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({ message = option_of_yojson (value_for_key message_type_of_yojson "message") _list path }
    : web_authn_not_enabled_exception)

let boolean_type_of_yojson = bool_of_yojson

let web_authn_mfa_settings_type_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({ enabled = option_of_yojson (value_for_key boolean_type_of_yojson "Enabled") _list path }
    : web_authn_mfa_settings_type)

let web_authn_factor_configuration_type_of_yojson (tree : t) path =
  ((match tree with
    | `String "MULTI_FACTOR_WITH_USER_VERIFICATION" -> MULTI_FACTOR_WITH_USER_VERIFICATION
    | `String "SINGLE_FACTOR" -> SINGLE_FACTOR
    | `String value ->
        raise (deserialize_unknown_enum_value_error path "WebAuthnFactorConfigurationType" value)
    | _ -> raise (deserialize_wrong_type_error path "WebAuthnFactorConfigurationType")
     : web_authn_factor_configuration_type)
    : web_authn_factor_configuration_type)

let web_authn_credentials_query_limit_type_of_yojson = int_of_yojson

let web_authn_credential_not_supported_exception_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({ message = option_of_yojson (value_for_key message_type_of_yojson "message") _list path }
    : web_authn_credential_not_supported_exception)

let string_type_of_yojson = string_of_yojson
let web_authn_authenticator_attachment_type_of_yojson = string_of_yojson
let web_authn_authenticator_transport_type_of_yojson = string_of_yojson

let web_authn_authenticator_transports_list_of_yojson tree path =
  list_of_yojson web_authn_authenticator_transport_type_of_yojson tree path

let date_type_of_yojson = timestamp_epoch_seconds_of_yojson

let web_authn_credential_description_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     created_at = value_for_key date_type_of_yojson "CreatedAt" _list path;
     authenticator_transports =
       value_for_key web_authn_authenticator_transports_list_of_yojson "AuthenticatorTransports"
         _list path;
     authenticator_attachment =
       option_of_yojson
         (value_for_key web_authn_authenticator_attachment_type_of_yojson "AuthenticatorAttachment")
         _list path;
     relying_party_id = value_for_key string_type_of_yojson "RelyingPartyId" _list path;
     friendly_credential_name =
       value_for_key string_type_of_yojson "FriendlyCredentialName" _list path;
     credential_id = value_for_key string_type_of_yojson "CredentialId" _list path;
   }
    : web_authn_credential_description)

let web_authn_credential_description_list_type_of_yojson tree path =
  list_of_yojson web_authn_credential_description_of_yojson tree path

let relying_party_id_type_of_yojson = string_of_yojson

let user_verification_type_of_yojson (tree : t) path =
  ((match tree with
    | `String "preferred" -> PREFERRED
    | `String "required" -> REQUIRED
    | `String value ->
        raise (deserialize_unknown_enum_value_error path "UserVerificationType" value)
    | _ -> raise (deserialize_wrong_type_error path "UserVerificationType")
     : user_verification_type)
    : user_verification_type)

let web_authn_configuration_type_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     factor_configuration =
       option_of_yojson
         (value_for_key web_authn_factor_configuration_type_of_yojson "FactorConfiguration")
         _list path;
     user_verification =
       option_of_yojson
         (value_for_key user_verification_type_of_yojson "UserVerification")
         _list path;
     relying_party_id =
       option_of_yojson (value_for_key relying_party_id_type_of_yojson "RelyingPartyId") _list path;
   }
    : web_authn_configuration_type)

let web_authn_configuration_missing_exception_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({ message = option_of_yojson (value_for_key message_type_of_yojson "message") _list path }
    : web_authn_configuration_missing_exception)

let web_authn_client_mismatch_exception_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({ message = option_of_yojson (value_for_key message_type_of_yojson "message") _list path }
    : web_authn_client_mismatch_exception)

let web_authn_challenge_not_found_exception_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({ message = option_of_yojson (value_for_key message_type_of_yojson "message") _list path }
    : web_authn_challenge_not_found_exception)

let verify_user_attribute_response_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  (() : unit)

let token_model_type_of_yojson = string_of_yojson
let attribute_name_type_of_yojson = string_of_yojson
let confirmation_code_type_of_yojson = string_of_yojson

let verify_user_attribute_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     code = value_for_key confirmation_code_type_of_yojson "Code" _list path;
     attribute_name = value_for_key attribute_name_type_of_yojson "AttributeName" _list path;
     access_token = value_for_key token_model_type_of_yojson "AccessToken" _list path;
   }
    : verify_user_attribute_request)

let user_not_found_exception_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({ message = option_of_yojson (value_for_key message_type_of_yojson "message") _list path }
    : user_not_found_exception)

let user_not_confirmed_exception_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({ message = option_of_yojson (value_for_key message_type_of_yojson "message") _list path }
    : user_not_confirmed_exception)

let too_many_requests_exception_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({ message = option_of_yojson (value_for_key message_type_of_yojson "message") _list path }
    : too_many_requests_exception)

let resource_not_found_exception_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({ message = option_of_yojson (value_for_key message_type_of_yojson "message") _list path }
    : resource_not_found_exception)

let password_reset_required_exception_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({ message = option_of_yojson (value_for_key message_type_of_yojson "message") _list path }
    : password_reset_required_exception)

let operation_not_enabled_exception_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({ message = option_of_yojson (value_for_key message_type_of_yojson "message") _list path }
    : operation_not_enabled_exception)

let not_authorized_exception_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({ message = option_of_yojson (value_for_key message_type_of_yojson "message") _list path }
    : not_authorized_exception)

let limit_exceeded_exception_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({ message = option_of_yojson (value_for_key message_type_of_yojson "message") _list path }
    : limit_exceeded_exception)

let invalid_parameter_exception_reason_code_type_of_yojson = string_of_yojson

let invalid_parameter_exception_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     reason_code =
       option_of_yojson
         (value_for_key invalid_parameter_exception_reason_code_type_of_yojson "reasonCode")
         _list path;
     message = option_of_yojson (value_for_key message_type_of_yojson "message") _list path;
   }
    : invalid_parameter_exception)

let internal_error_exception_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({ message = option_of_yojson (value_for_key message_type_of_yojson "message") _list path }
    : internal_error_exception)

let forbidden_exception_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({ message = option_of_yojson (value_for_key message_type_of_yojson "message") _list path }
    : forbidden_exception)

let expired_code_exception_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({ message = option_of_yojson (value_for_key message_type_of_yojson "message") _list path }
    : expired_code_exception)

let code_mismatch_exception_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({ message = option_of_yojson (value_for_key message_type_of_yojson "message") _list path }
    : code_mismatch_exception)

let alias_exists_exception_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({ message = option_of_yojson (value_for_key message_type_of_yojson "message") _list path }
    : alias_exists_exception)

let verify_software_token_response_type_of_yojson (tree : t) path =
  ((match tree with
    | `String "ERROR" -> ERROR
    | `String "SUCCESS" -> SUCCESS
    | `String value ->
        raise (deserialize_unknown_enum_value_error path "VerifySoftwareTokenResponseType" value)
    | _ -> raise (deserialize_wrong_type_error path "VerifySoftwareTokenResponseType")
     : verify_software_token_response_type)
    : verify_software_token_response_type)

let session_type_of_yojson = string_of_yojson

let verify_software_token_response_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     session = option_of_yojson (value_for_key session_type_of_yojson "Session") _list path;
     status =
       option_of_yojson
         (value_for_key verify_software_token_response_type_of_yojson "Status")
         _list path;
   }
    : verify_software_token_response)

let software_token_mfa_user_code_type_of_yojson = string_of_yojson

let verify_software_token_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     friendly_device_name =
       option_of_yojson (value_for_key string_type_of_yojson "FriendlyDeviceName") _list path;
     user_code = value_for_key software_token_mfa_user_code_type_of_yojson "UserCode" _list path;
     session = option_of_yojson (value_for_key session_type_of_yojson "Session") _list path;
     access_token =
       option_of_yojson (value_for_key token_model_type_of_yojson "AccessToken") _list path;
   }
    : verify_software_token_request)

let software_token_mfa_not_found_exception_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({ message = option_of_yojson (value_for_key message_type_of_yojson "message") _list path }
    : software_token_mfa_not_found_exception)

let invalid_user_pool_configuration_exception_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({ message = option_of_yojson (value_for_key message_type_of_yojson "message") _list path }
    : invalid_user_pool_configuration_exception)

let enable_software_token_mfa_exception_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({ message = option_of_yojson (value_for_key message_type_of_yojson "message") _list path }
    : enable_software_token_mfa_exception)

let verified_attribute_type_of_yojson (tree : t) path =
  ((match tree with
    | `String "email" -> EMAIL
    | `String "phone_number" -> PHONE_NUMBER
    | `String value ->
        raise (deserialize_unknown_enum_value_error path "VerifiedAttributeType" value)
    | _ -> raise (deserialize_wrong_type_error path "VerifiedAttributeType")
     : verified_attribute_type)
    : verified_attribute_type)

let verified_attributes_list_type_of_yojson tree path =
  list_of_yojson verified_attribute_type_of_yojson tree path

let sms_verification_message_type_of_yojson = string_of_yojson
let email_verification_message_type_of_yojson = string_of_yojson
let email_verification_subject_type_of_yojson = string_of_yojson
let email_verification_message_by_link_type_of_yojson = string_of_yojson
let email_verification_subject_by_link_type_of_yojson = string_of_yojson

let default_email_option_type_of_yojson (tree : t) path =
  ((match tree with
    | `String "CONFIRM_WITH_CODE" -> CONFIRM_WITH_CODE
    | `String "CONFIRM_WITH_LINK" -> CONFIRM_WITH_LINK
    | `String value ->
        raise (deserialize_unknown_enum_value_error path "DefaultEmailOptionType" value)
    | _ -> raise (deserialize_wrong_type_error path "DefaultEmailOptionType")
     : default_email_option_type)
    : default_email_option_type)

let verification_message_template_type_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     default_email_option =
       option_of_yojson
         (value_for_key default_email_option_type_of_yojson "DefaultEmailOption")
         _list path;
     email_subject_by_link =
       option_of_yojson
         (value_for_key email_verification_subject_by_link_type_of_yojson "EmailSubjectByLink")
         _list path;
     email_message_by_link =
       option_of_yojson
         (value_for_key email_verification_message_by_link_type_of_yojson "EmailMessageByLink")
         _list path;
     email_subject =
       option_of_yojson
         (value_for_key email_verification_subject_type_of_yojson "EmailSubject")
         _list path;
     email_message =
       option_of_yojson
         (value_for_key email_verification_message_type_of_yojson "EmailMessage")
         _list path;
     sms_message =
       option_of_yojson
         (value_for_key sms_verification_message_type_of_yojson "SmsMessage")
         _list path;
   }
    : verification_message_template_type)

let username_type_of_yojson = string_of_yojson
let attribute_value_type_of_yojson = string_of_yojson

let attribute_type_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     value = option_of_yojson (value_for_key attribute_value_type_of_yojson "Value") _list path;
     name = value_for_key attribute_name_type_of_yojson "Name" _list path;
   }
    : attribute_type)

let attribute_list_type_of_yojson tree path = list_of_yojson attribute_type_of_yojson tree path

let user_status_type_of_yojson (tree : t) path =
  ((match tree with
    | `String "EXTERNAL_PROVIDER" -> EXTERNAL_PROVIDER
    | `String "FORCE_CHANGE_PASSWORD" -> FORCE_CHANGE_PASSWORD
    | `String "RESET_REQUIRED" -> RESET_REQUIRED
    | `String "UNKNOWN" -> UNKNOWN
    | `String "COMPROMISED" -> COMPROMISED
    | `String "ARCHIVED" -> ARCHIVED
    | `String "CONFIRMED" -> CONFIRMED
    | `String "UNCONFIRMED" -> UNCONFIRMED
    | `String value -> raise (deserialize_unknown_enum_value_error path "UserStatusType" value)
    | _ -> raise (deserialize_wrong_type_error path "UserStatusType")
     : user_status_type)
    : user_status_type)

let delivery_medium_type_of_yojson (tree : t) path =
  ((match tree with
    | `String "EMAIL" -> EMAIL
    | `String "SMS" -> SMS
    | `String value -> raise (deserialize_unknown_enum_value_error path "DeliveryMediumType" value)
    | _ -> raise (deserialize_wrong_type_error path "DeliveryMediumType")
     : delivery_medium_type)
    : delivery_medium_type)

let mfa_option_type_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     attribute_name =
       option_of_yojson (value_for_key attribute_name_type_of_yojson "AttributeName") _list path;
     delivery_medium =
       option_of_yojson (value_for_key delivery_medium_type_of_yojson "DeliveryMedium") _list path;
   }
    : mfa_option_type)

let mfa_option_list_type_of_yojson tree path = list_of_yojson mfa_option_type_of_yojson tree path

let user_type_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     mfa_options =
       option_of_yojson (value_for_key mfa_option_list_type_of_yojson "MFAOptions") _list path;
     user_status =
       option_of_yojson (value_for_key user_status_type_of_yojson "UserStatus") _list path;
     enabled = option_of_yojson (value_for_key boolean_type_of_yojson "Enabled") _list path;
     user_last_modified_date =
       option_of_yojson (value_for_key date_type_of_yojson "UserLastModifiedDate") _list path;
     user_create_date =
       option_of_yojson (value_for_key date_type_of_yojson "UserCreateDate") _list path;
     attributes =
       option_of_yojson (value_for_key attribute_list_type_of_yojson "Attributes") _list path;
     username = option_of_yojson (value_for_key username_type_of_yojson "Username") _list path;
   }
    : user_type)

let users_list_type_of_yojson tree path = list_of_yojson user_type_of_yojson tree path

let username_exists_exception_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({ message = option_of_yojson (value_for_key message_type_of_yojson "message") _list path }
    : username_exists_exception)

let username_configuration_type_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({ case_sensitive = value_for_key wrapped_boolean_type_of_yojson "CaseSensitive" _list path }
    : username_configuration_type)

let username_attribute_type_of_yojson (tree : t) path =
  ((match tree with
    | `String "email" -> EMAIL
    | `String "phone_number" -> PHONE_NUMBER
    | `String value ->
        raise (deserialize_unknown_enum_value_error path "UsernameAttributeType" value)
    | _ -> raise (deserialize_wrong_type_error path "UsernameAttributeType")
     : username_attribute_type)
    : username_attribute_type)

let username_attributes_list_type_of_yojson tree path =
  list_of_yojson username_attribute_type_of_yojson tree path

let user_pool_id_type_of_yojson = string_of_yojson
let user_pool_name_type_of_yojson = string_of_yojson
let password_policy_min_length_type_of_yojson = int_of_yojson
let password_history_size_type_of_yojson = int_of_yojson
let temporary_password_validity_days_type_of_yojson = int_of_yojson

let password_policy_type_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     temporary_password_validity_days =
       option_of_yojson
         (value_for_key temporary_password_validity_days_type_of_yojson
            "TemporaryPasswordValidityDays")
         _list path;
     password_history_size =
       option_of_yojson
         (value_for_key password_history_size_type_of_yojson "PasswordHistorySize")
         _list path;
     require_symbols =
       option_of_yojson (value_for_key boolean_type_of_yojson "RequireSymbols") _list path;
     require_numbers =
       option_of_yojson (value_for_key boolean_type_of_yojson "RequireNumbers") _list path;
     require_lowercase =
       option_of_yojson (value_for_key boolean_type_of_yojson "RequireLowercase") _list path;
     require_uppercase =
       option_of_yojson (value_for_key boolean_type_of_yojson "RequireUppercase") _list path;
     minimum_length =
       option_of_yojson
         (value_for_key password_policy_min_length_type_of_yojson "MinimumLength")
         _list path;
   }
    : password_policy_type)

let auth_factor_type_of_yojson (tree : t) path =
  ((match tree with
    | `String "WEB_AUTHN" -> WEB_AUTHN
    | `String "SMS_OTP" -> SMS_OTP
    | `String "EMAIL_OTP" -> EMAIL_OTP
    | `String "PASSWORD" -> PASSWORD
    | `String value -> raise (deserialize_unknown_enum_value_error path "AuthFactorType" value)
    | _ -> raise (deserialize_wrong_type_error path "AuthFactorType")
     : auth_factor_type)
    : auth_factor_type)

let allowed_first_auth_factors_list_type_of_yojson tree path =
  list_of_yojson auth_factor_type_of_yojson tree path

let sign_in_policy_type_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     allowed_first_auth_factors =
       option_of_yojson
         (value_for_key allowed_first_auth_factors_list_type_of_yojson "AllowedFirstAuthFactors")
         _list path;
   }
    : sign_in_policy_type)

let user_pool_policy_type_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     sign_in_policy =
       option_of_yojson (value_for_key sign_in_policy_type_of_yojson "SignInPolicy") _list path;
     password_policy =
       option_of_yojson (value_for_key password_policy_type_of_yojson "PasswordPolicy") _list path;
   }
    : user_pool_policy_type)

let deletion_protection_type_of_yojson (tree : t) path =
  ((match tree with
    | `String "INACTIVE" -> INACTIVE
    | `String "ACTIVE" -> ACTIVE
    | `String value ->
        raise (deserialize_unknown_enum_value_error path "DeletionProtectionType" value)
    | _ -> raise (deserialize_wrong_type_error path "DeletionProtectionType")
     : deletion_protection_type)
    : deletion_protection_type)

let arn_type_of_yojson = string_of_yojson

let pre_token_generation_lambda_version_type_of_yojson (tree : t) path =
  ((match tree with
    | `String "V3_0" -> V3_0
    | `String "V2_0" -> V2_0
    | `String "V1_0" -> V1_0
    | `String value ->
        raise
          (deserialize_unknown_enum_value_error path "PreTokenGenerationLambdaVersionType" value)
    | _ -> raise (deserialize_wrong_type_error path "PreTokenGenerationLambdaVersionType")
     : pre_token_generation_lambda_version_type)
    : pre_token_generation_lambda_version_type)

let pre_token_generation_version_config_type_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     lambda_arn = value_for_key arn_type_of_yojson "LambdaArn" _list path;
     lambda_version =
       value_for_key pre_token_generation_lambda_version_type_of_yojson "LambdaVersion" _list path;
   }
    : pre_token_generation_version_config_type)

let custom_sms_sender_lambda_version_type_of_yojson (tree : t) path =
  ((match tree with
    | `String "V1_0" -> V1_0
    | `String value ->
        raise (deserialize_unknown_enum_value_error path "CustomSMSSenderLambdaVersionType" value)
    | _ -> raise (deserialize_wrong_type_error path "CustomSMSSenderLambdaVersionType")
     : custom_sms_sender_lambda_version_type)
    : custom_sms_sender_lambda_version_type)

let custom_sms_lambda_version_config_type_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     lambda_arn = value_for_key arn_type_of_yojson "LambdaArn" _list path;
     lambda_version =
       value_for_key custom_sms_sender_lambda_version_type_of_yojson "LambdaVersion" _list path;
   }
    : custom_sms_lambda_version_config_type)

let custom_email_sender_lambda_version_type_of_yojson (tree : t) path =
  ((match tree with
    | `String "V1_0" -> V1_0
    | `String value ->
        raise (deserialize_unknown_enum_value_error path "CustomEmailSenderLambdaVersionType" value)
    | _ -> raise (deserialize_wrong_type_error path "CustomEmailSenderLambdaVersionType")
     : custom_email_sender_lambda_version_type)
    : custom_email_sender_lambda_version_type)

let custom_email_lambda_version_config_type_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     lambda_arn = value_for_key arn_type_of_yojson "LambdaArn" _list path;
     lambda_version =
       value_for_key custom_email_sender_lambda_version_type_of_yojson "LambdaVersion" _list path;
   }
    : custom_email_lambda_version_config_type)

let inbound_federation_lambda_version_type_of_yojson (tree : t) path =
  ((match tree with
    | `String "V1_0" -> V1_0
    | `String value ->
        raise (deserialize_unknown_enum_value_error path "InboundFederationLambdaVersionType" value)
    | _ -> raise (deserialize_wrong_type_error path "InboundFederationLambdaVersionType")
     : inbound_federation_lambda_version_type)
    : inbound_federation_lambda_version_type)

let inbound_federation_lambda_type_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     lambda_arn = value_for_key arn_type_of_yojson "LambdaArn" _list path;
     lambda_version =
       value_for_key inbound_federation_lambda_version_type_of_yojson "LambdaVersion" _list path;
   }
    : inbound_federation_lambda_type)

let lambda_config_type_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     inbound_federation =
       option_of_yojson
         (value_for_key inbound_federation_lambda_type_of_yojson "InboundFederation")
         _list path;
     kms_key_i_d = option_of_yojson (value_for_key arn_type_of_yojson "KMSKeyID") _list path;
     custom_email_sender =
       option_of_yojson
         (value_for_key custom_email_lambda_version_config_type_of_yojson "CustomEmailSender")
         _list path;
     custom_sms_sender =
       option_of_yojson
         (value_for_key custom_sms_lambda_version_config_type_of_yojson "CustomSMSSender")
         _list path;
     pre_token_generation_config =
       option_of_yojson
         (value_for_key pre_token_generation_version_config_type_of_yojson
            "PreTokenGenerationConfig")
         _list path;
     user_migration = option_of_yojson (value_for_key arn_type_of_yojson "UserMigration") _list path;
     pre_token_generation =
       option_of_yojson (value_for_key arn_type_of_yojson "PreTokenGeneration") _list path;
     verify_auth_challenge_response =
       option_of_yojson (value_for_key arn_type_of_yojson "VerifyAuthChallengeResponse") _list path;
     create_auth_challenge =
       option_of_yojson (value_for_key arn_type_of_yojson "CreateAuthChallenge") _list path;
     define_auth_challenge =
       option_of_yojson (value_for_key arn_type_of_yojson "DefineAuthChallenge") _list path;
     post_authentication =
       option_of_yojson (value_for_key arn_type_of_yojson "PostAuthentication") _list path;
     pre_authentication =
       option_of_yojson (value_for_key arn_type_of_yojson "PreAuthentication") _list path;
     post_confirmation =
       option_of_yojson (value_for_key arn_type_of_yojson "PostConfirmation") _list path;
     custom_message = option_of_yojson (value_for_key arn_type_of_yojson "CustomMessage") _list path;
     pre_sign_up = option_of_yojson (value_for_key arn_type_of_yojson "PreSignUp") _list path;
   }
    : lambda_config_type)

let status_type_of_yojson (tree : t) path =
  ((match tree with
    | `String "Disabled" -> Disabled
    | `String "Enabled" -> Enabled
    | `String value -> raise (deserialize_unknown_enum_value_error path "StatusType" value)
    | _ -> raise (deserialize_wrong_type_error path "StatusType")
     : status_type)
    : status_type)

let custom_attribute_name_type_of_yojson = string_of_yojson

let attribute_data_type_of_yojson (tree : t) path =
  ((match tree with
    | `String "Boolean" -> BOOLEAN
    | `String "DateTime" -> DATETIME
    | `String "Number" -> NUMBER
    | `String "String" -> STRING
    | `String value -> raise (deserialize_unknown_enum_value_error path "AttributeDataType" value)
    | _ -> raise (deserialize_wrong_type_error path "AttributeDataType")
     : attribute_data_type)
    : attribute_data_type)

let number_attribute_constraints_type_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     max_value = option_of_yojson (value_for_key string_type_of_yojson "MaxValue") _list path;
     min_value = option_of_yojson (value_for_key string_type_of_yojson "MinValue") _list path;
   }
    : number_attribute_constraints_type)

let string_attribute_constraints_type_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     max_length = option_of_yojson (value_for_key string_type_of_yojson "MaxLength") _list path;
     min_length = option_of_yojson (value_for_key string_type_of_yojson "MinLength") _list path;
   }
    : string_attribute_constraints_type)

let schema_attribute_type_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     string_attribute_constraints =
       option_of_yojson
         (value_for_key string_attribute_constraints_type_of_yojson "StringAttributeConstraints")
         _list path;
     number_attribute_constraints =
       option_of_yojson
         (value_for_key number_attribute_constraints_type_of_yojson "NumberAttributeConstraints")
         _list path;
     required = option_of_yojson (value_for_key boolean_type_of_yojson "Required") _list path;
     \#mutable = option_of_yojson (value_for_key boolean_type_of_yojson "Mutable") _list path;
     developer_only_attribute =
       option_of_yojson (value_for_key boolean_type_of_yojson "DeveloperOnlyAttribute") _list path;
     attribute_data_type =
       option_of_yojson (value_for_key attribute_data_type_of_yojson "AttributeDataType") _list path;
     name = option_of_yojson (value_for_key custom_attribute_name_type_of_yojson "Name") _list path;
   }
    : schema_attribute_type)

let schema_attributes_list_type_of_yojson tree path =
  list_of_yojson schema_attribute_type_of_yojson tree path

let alias_attribute_type_of_yojson (tree : t) path =
  ((match tree with
    | `String "preferred_username" -> PREFERRED_USERNAME
    | `String "email" -> EMAIL
    | `String "phone_number" -> PHONE_NUMBER
    | `String value -> raise (deserialize_unknown_enum_value_error path "AliasAttributeType" value)
    | _ -> raise (deserialize_wrong_type_error path "AliasAttributeType")
     : alias_attribute_type)
    : alias_attribute_type)

let alias_attributes_list_type_of_yojson tree path =
  list_of_yojson alias_attribute_type_of_yojson tree path

let attributes_require_verification_before_update_type_of_yojson tree path =
  list_of_yojson verified_attribute_type_of_yojson tree path

let user_attribute_update_settings_type_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     attributes_require_verification_before_update =
       option_of_yojson
         (value_for_key attributes_require_verification_before_update_type_of_yojson
            "AttributesRequireVerificationBeforeUpdate")
         _list path;
   }
    : user_attribute_update_settings_type)

let user_pool_mfa_type_of_yojson (tree : t) path =
  ((match tree with
    | `String "OPTIONAL" -> OPTIONAL
    | `String "ON" -> ON
    | `String "OFF" -> OFF
    | `String value -> raise (deserialize_unknown_enum_value_error path "UserPoolMfaType" value)
    | _ -> raise (deserialize_wrong_type_error path "UserPoolMfaType")
     : user_pool_mfa_type)
    : user_pool_mfa_type)

let device_configuration_type_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     device_only_remembered_on_user_prompt =
       option_of_yojson
         (value_for_key boolean_type_of_yojson "DeviceOnlyRememberedOnUserPrompt")
         _list path;
     challenge_required_on_new_device =
       option_of_yojson
         (value_for_key boolean_type_of_yojson "ChallengeRequiredOnNewDevice")
         _list path;
   }
    : device_configuration_type)

let integer_type_of_yojson = int_of_yojson
let email_address_type_of_yojson = string_of_yojson

let email_sending_account_type_of_yojson (tree : t) path =
  ((match tree with
    | `String "DEVELOPER" -> DEVELOPER
    | `String "COGNITO_DEFAULT" -> COGNITO_DEFAULT
    | `String value ->
        raise (deserialize_unknown_enum_value_error path "EmailSendingAccountType" value)
    | _ -> raise (deserialize_wrong_type_error path "EmailSendingAccountType")
     : email_sending_account_type)
    : email_sending_account_type)

let ses_configuration_set_of_yojson = string_of_yojson

let email_configuration_type_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     configuration_set =
       option_of_yojson
         (value_for_key ses_configuration_set_of_yojson "ConfigurationSet")
         _list path;
     from_ = option_of_yojson (value_for_key string_type_of_yojson "From") _list path;
     email_sending_account =
       option_of_yojson
         (value_for_key email_sending_account_type_of_yojson "EmailSendingAccount")
         _list path;
     reply_to_email_address =
       option_of_yojson
         (value_for_key email_address_type_of_yojson "ReplyToEmailAddress")
         _list path;
     source_arn = option_of_yojson (value_for_key arn_type_of_yojson "SourceArn") _list path;
   }
    : email_configuration_type)

let region_code_type_of_yojson = string_of_yojson

let sms_configuration_type_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     sns_region = option_of_yojson (value_for_key region_code_type_of_yojson "SnsRegion") _list path;
     external_id = option_of_yojson (value_for_key string_type_of_yojson "ExternalId") _list path;
     sns_caller_arn = value_for_key arn_type_of_yojson "SnsCallerArn" _list path;
   }
    : sms_configuration_type)

let tag_value_type_of_yojson = string_of_yojson
let tag_keys_type_of_yojson = string_of_yojson

let user_pool_tags_type_of_yojson tree path =
  map_of_yojson tag_keys_type_of_yojson tag_value_type_of_yojson tree path

let domain_type_of_yojson = string_of_yojson
let admin_create_user_unused_account_validity_days_type_of_yojson = int_of_yojson
let sms_invite_message_type_of_yojson = string_of_yojson
let email_invite_message_type_of_yojson = string_of_yojson

let message_template_type_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     email_subject =
       option_of_yojson
         (value_for_key email_verification_subject_type_of_yojson "EmailSubject")
         _list path;
     email_message =
       option_of_yojson
         (value_for_key email_invite_message_type_of_yojson "EmailMessage")
         _list path;
     sms_message =
       option_of_yojson (value_for_key sms_invite_message_type_of_yojson "SMSMessage") _list path;
   }
    : message_template_type)

let admin_create_user_config_type_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     invite_message_template =
       option_of_yojson
         (value_for_key message_template_type_of_yojson "InviteMessageTemplate")
         _list path;
     unused_account_validity_days =
       option_of_yojson
         (value_for_key admin_create_user_unused_account_validity_days_type_of_yojson
            "UnusedAccountValidityDays")
         _list path;
     allow_admin_create_user_only =
       option_of_yojson (value_for_key boolean_type_of_yojson "AllowAdminCreateUserOnly") _list path;
   }
    : admin_create_user_config_type)

let advanced_security_mode_type_of_yojson (tree : t) path =
  ((match tree with
    | `String "ENFORCED" -> ENFORCED
    | `String "AUDIT" -> AUDIT
    | `String "OFF" -> OFF
    | `String value ->
        raise (deserialize_unknown_enum_value_error path "AdvancedSecurityModeType" value)
    | _ -> raise (deserialize_wrong_type_error path "AdvancedSecurityModeType")
     : advanced_security_mode_type)
    : advanced_security_mode_type)

let advanced_security_enabled_mode_type_of_yojson (tree : t) path =
  ((match tree with
    | `String "ENFORCED" -> ENFORCED
    | `String "AUDIT" -> AUDIT
    | `String value ->
        raise (deserialize_unknown_enum_value_error path "AdvancedSecurityEnabledModeType" value)
    | _ -> raise (deserialize_wrong_type_error path "AdvancedSecurityEnabledModeType")
     : advanced_security_enabled_mode_type)
    : advanced_security_enabled_mode_type)

let advanced_security_additional_flows_type_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     custom_auth_mode =
       option_of_yojson
         (value_for_key advanced_security_enabled_mode_type_of_yojson "CustomAuthMode")
         _list path;
   }
    : advanced_security_additional_flows_type)

let user_pool_add_ons_type_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     advanced_security_additional_flows =
       option_of_yojson
         (value_for_key advanced_security_additional_flows_type_of_yojson
            "AdvancedSecurityAdditionalFlows")
         _list path;
     advanced_security_mode =
       value_for_key advanced_security_mode_type_of_yojson "AdvancedSecurityMode" _list path;
   }
    : user_pool_add_ons_type)

let priority_type_of_yojson = int_of_yojson

let recovery_option_name_type_of_yojson (tree : t) path =
  ((match tree with
    | `String "admin_only" -> ADMIN_ONLY
    | `String "verified_phone_number" -> VERIFIED_PHONE_NUMBER
    | `String "verified_email" -> VERIFIED_EMAIL
    | `String value ->
        raise (deserialize_unknown_enum_value_error path "RecoveryOptionNameType" value)
    | _ -> raise (deserialize_wrong_type_error path "RecoveryOptionNameType")
     : recovery_option_name_type)
    : recovery_option_name_type)

let recovery_option_type_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     name = value_for_key recovery_option_name_type_of_yojson "Name" _list path;
     priority = value_for_key priority_type_of_yojson "Priority" _list path;
   }
    : recovery_option_type)

let recovery_mechanisms_type_of_yojson tree path =
  list_of_yojson recovery_option_type_of_yojson tree path

let account_recovery_setting_type_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     recovery_mechanisms =
       option_of_yojson
         (value_for_key recovery_mechanisms_type_of_yojson "RecoveryMechanisms")
         _list path;
   }
    : account_recovery_setting_type)

let user_pool_tier_type_of_yojson (tree : t) path =
  ((match tree with
    | `String "PLUS" -> PLUS
    | `String "ESSENTIALS" -> ESSENTIALS
    | `String "LITE" -> LITE
    | `String value -> raise (deserialize_unknown_enum_value_error path "UserPoolTierType" value)
    | _ -> raise (deserialize_wrong_type_error path "UserPoolTierType")
     : user_pool_tier_type)
    : user_pool_tier_type)

let encryption_key_type_of_yojson (tree : t) path =
  ((match tree with
    | `String "CUSTOMER_MANAGED_KEY" -> CUSTOMER_MANAGED_KEY
    | `String "AWS_OWNED_KEY" -> AWS_OWNED_KEY
    | `String value -> raise (deserialize_unknown_enum_value_error path "EncryptionKeyType" value)
    | _ -> raise (deserialize_wrong_type_error path "EncryptionKeyType")
     : encryption_key_type)
    : encryption_key_type)

let encryption_key_arn_type_of_yojson = string_of_yojson

let key_configuration_type_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     kms_key_arn =
       option_of_yojson (value_for_key encryption_key_arn_type_of_yojson "KmsKeyArn") _list path;
     key_type = option_of_yojson (value_for_key encryption_key_type_of_yojson "KeyType") _list path;
   }
    : key_configuration_type)

let issuer_type_of_yojson (tree : t) path =
  ((match tree with
    | `String "UPDATED" -> UPDATED
    | `String "ORIGINAL" -> ORIGINAL
    | `String value -> raise (deserialize_unknown_enum_value_error path "IssuerType" value)
    | _ -> raise (deserialize_wrong_type_error path "IssuerType")
     : issuer_type)
    : issuer_type)

let issuer_configuration_type_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({ type_ = option_of_yojson (value_for_key issuer_type_of_yojson "Type") _list path }
    : issuer_configuration_type)

let user_pool_type_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     issuer_configuration =
       option_of_yojson
         (value_for_key issuer_configuration_type_of_yojson "IssuerConfiguration")
         _list path;
     key_configuration =
       option_of_yojson
         (value_for_key key_configuration_type_of_yojson "KeyConfiguration")
         _list path;
     user_pool_tier =
       option_of_yojson (value_for_key user_pool_tier_type_of_yojson "UserPoolTier") _list path;
     account_recovery_setting =
       option_of_yojson
         (value_for_key account_recovery_setting_type_of_yojson "AccountRecoverySetting")
         _list path;
     arn = option_of_yojson (value_for_key arn_type_of_yojson "Arn") _list path;
     username_configuration =
       option_of_yojson
         (value_for_key username_configuration_type_of_yojson "UsernameConfiguration")
         _list path;
     user_pool_add_ons =
       option_of_yojson (value_for_key user_pool_add_ons_type_of_yojson "UserPoolAddOns") _list path;
     admin_create_user_config =
       option_of_yojson
         (value_for_key admin_create_user_config_type_of_yojson "AdminCreateUserConfig")
         _list path;
     custom_domain =
       option_of_yojson (value_for_key domain_type_of_yojson "CustomDomain") _list path;
     domain = option_of_yojson (value_for_key domain_type_of_yojson "Domain") _list path;
     email_configuration_failure =
       option_of_yojson (value_for_key string_type_of_yojson "EmailConfigurationFailure") _list path;
     sms_configuration_failure =
       option_of_yojson (value_for_key string_type_of_yojson "SmsConfigurationFailure") _list path;
     user_pool_tags =
       option_of_yojson (value_for_key user_pool_tags_type_of_yojson "UserPoolTags") _list path;
     sms_configuration =
       option_of_yojson
         (value_for_key sms_configuration_type_of_yojson "SmsConfiguration")
         _list path;
     email_configuration =
       option_of_yojson
         (value_for_key email_configuration_type_of_yojson "EmailConfiguration")
         _list path;
     estimated_number_of_users =
       option_of_yojson (value_for_key integer_type_of_yojson "EstimatedNumberOfUsers") _list path;
     device_configuration =
       option_of_yojson
         (value_for_key device_configuration_type_of_yojson "DeviceConfiguration")
         _list path;
     mfa_configuration =
       option_of_yojson (value_for_key user_pool_mfa_type_of_yojson "MfaConfiguration") _list path;
     user_attribute_update_settings =
       option_of_yojson
         (value_for_key user_attribute_update_settings_type_of_yojson "UserAttributeUpdateSettings")
         _list path;
     sms_authentication_message =
       option_of_yojson
         (value_for_key sms_verification_message_type_of_yojson "SmsAuthenticationMessage")
         _list path;
     verification_message_template =
       option_of_yojson
         (value_for_key verification_message_template_type_of_yojson "VerificationMessageTemplate")
         _list path;
     email_verification_subject =
       option_of_yojson
         (value_for_key email_verification_subject_type_of_yojson "EmailVerificationSubject")
         _list path;
     email_verification_message =
       option_of_yojson
         (value_for_key email_verification_message_type_of_yojson "EmailVerificationMessage")
         _list path;
     sms_verification_message =
       option_of_yojson
         (value_for_key sms_verification_message_type_of_yojson "SmsVerificationMessage")
         _list path;
     username_attributes =
       option_of_yojson
         (value_for_key username_attributes_list_type_of_yojson "UsernameAttributes")
         _list path;
     alias_attributes =
       option_of_yojson
         (value_for_key alias_attributes_list_type_of_yojson "AliasAttributes")
         _list path;
     auto_verified_attributes =
       option_of_yojson
         (value_for_key verified_attributes_list_type_of_yojson "AutoVerifiedAttributes")
         _list path;
     schema_attributes =
       option_of_yojson
         (value_for_key schema_attributes_list_type_of_yojson "SchemaAttributes")
         _list path;
     creation_date = option_of_yojson (value_for_key date_type_of_yojson "CreationDate") _list path;
     last_modified_date =
       option_of_yojson (value_for_key date_type_of_yojson "LastModifiedDate") _list path;
     status = option_of_yojson (value_for_key status_type_of_yojson "Status") _list path;
     lambda_config =
       option_of_yojson (value_for_key lambda_config_type_of_yojson "LambdaConfig") _list path;
     deletion_protection =
       option_of_yojson
         (value_for_key deletion_protection_type_of_yojson "DeletionProtection")
         _list path;
     policies =
       option_of_yojson (value_for_key user_pool_policy_type_of_yojson "Policies") _list path;
     name = option_of_yojson (value_for_key user_pool_name_type_of_yojson "Name") _list path;
     id = option_of_yojson (value_for_key user_pool_id_type_of_yojson "Id") _list path;
   }
    : user_pool_type)

let user_pool_tags_list_type_of_yojson tree path = list_of_yojson tag_keys_type_of_yojson tree path

let user_pool_tagging_exception_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({ message = option_of_yojson (value_for_key message_type_of_yojson "message") _list path }
    : user_pool_tagging_exception)

let region_name_type_of_yojson = string_of_yojson

let replica_status_type_of_yojson (tree : t) path =
  ((match tree with
    | `String "DELETING" -> DELETING
    | `String "INACTIVE" -> INACTIVE
    | `String "ACTIVE" -> ACTIVE
    | `String "CREATING" -> CREATING
    | `String value -> raise (deserialize_unknown_enum_value_error path "ReplicaStatusType" value)
    | _ -> raise (deserialize_wrong_type_error path "ReplicaStatusType")
     : replica_status_type)
    : replica_status_type)

let replica_role_type_of_yojson (tree : t) path =
  ((match tree with
    | `String "SECONDARY" -> SECONDARY
    | `String "PRIMARY" -> PRIMARY
    | `String value -> raise (deserialize_unknown_enum_value_error path "ReplicaRoleType" value)
    | _ -> raise (deserialize_wrong_type_error path "ReplicaRoleType")
     : replica_role_type)
    : replica_role_type)

let user_pool_replica_type_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     user_pool_arn = option_of_yojson (value_for_key arn_type_of_yojson "UserPoolArn") _list path;
     role = option_of_yojson (value_for_key replica_role_type_of_yojson "Role") _list path;
     status = option_of_yojson (value_for_key replica_status_type_of_yojson "Status") _list path;
     region_name =
       option_of_yojson (value_for_key region_name_type_of_yojson "RegionName") _list path;
   }
    : user_pool_replica_type)

let user_pool_replica_list_type_of_yojson tree path =
  list_of_yojson user_pool_replica_type_of_yojson tree path

let replica_regions_type_of_yojson tree path = list_of_yojson string_type_of_yojson tree path

let user_pool_description_type_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     replica_regions =
       option_of_yojson (value_for_key replica_regions_type_of_yojson "ReplicaRegions") _list path;
     creation_date = option_of_yojson (value_for_key date_type_of_yojson "CreationDate") _list path;
     last_modified_date =
       option_of_yojson (value_for_key date_type_of_yojson "LastModifiedDate") _list path;
     status = option_of_yojson (value_for_key status_type_of_yojson "Status") _list path;
     lambda_config =
       option_of_yojson (value_for_key lambda_config_type_of_yojson "LambdaConfig") _list path;
     name = option_of_yojson (value_for_key user_pool_name_type_of_yojson "Name") _list path;
     id = option_of_yojson (value_for_key user_pool_id_type_of_yojson "Id") _list path;
   }
    : user_pool_description_type)

let user_pool_list_type_of_yojson tree path =
  list_of_yojson user_pool_description_type_of_yojson tree path

let client_name_type_of_yojson = string_of_yojson
let client_id_type_of_yojson = string_of_yojson
let client_secret_type_of_yojson = string_of_yojson
let refresh_token_validity_type_of_yojson = int_of_yojson
let access_token_validity_type_of_yojson = int_of_yojson
let id_token_validity_type_of_yojson = int_of_yojson

let time_units_type_of_yojson (tree : t) path =
  ((match tree with
    | `String "days" -> DAYS
    | `String "hours" -> HOURS
    | `String "minutes" -> MINUTES
    | `String "seconds" -> SECONDS
    | `String value -> raise (deserialize_unknown_enum_value_error path "TimeUnitsType" value)
    | _ -> raise (deserialize_wrong_type_error path "TimeUnitsType")
     : time_units_type)
    : time_units_type)

let token_validity_units_type_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     refresh_token =
       option_of_yojson (value_for_key time_units_type_of_yojson "RefreshToken") _list path;
     id_token = option_of_yojson (value_for_key time_units_type_of_yojson "IdToken") _list path;
     access_token =
       option_of_yojson (value_for_key time_units_type_of_yojson "AccessToken") _list path;
   }
    : token_validity_units_type)

let client_permission_type_of_yojson = string_of_yojson

let client_permission_list_type_of_yojson tree path =
  list_of_yojson client_permission_type_of_yojson tree path

let explicit_auth_flows_type_of_yojson (tree : t) path =
  ((match tree with
    | `String "ALLOW_USER_AUTH" -> ALLOW_USER_AUTH
    | `String "ALLOW_REFRESH_TOKEN_AUTH" -> ALLOW_REFRESH_TOKEN_AUTH
    | `String "ALLOW_USER_SRP_AUTH" -> ALLOW_USER_SRP_AUTH
    | `String "ALLOW_USER_PASSWORD_AUTH" -> ALLOW_USER_PASSWORD_AUTH
    | `String "ALLOW_CUSTOM_AUTH" -> ALLOW_CUSTOM_AUTH
    | `String "ALLOW_ADMIN_USER_PASSWORD_AUTH" -> ALLOW_ADMIN_USER_PASSWORD_AUTH
    | `String "USER_PASSWORD_AUTH" -> USER_PASSWORD_AUTH
    | `String "CUSTOM_AUTH_FLOW_ONLY" -> CUSTOM_AUTH_FLOW_ONLY
    | `String "ADMIN_NO_SRP_AUTH" -> ADMIN_NO_SRP_AUTH
    | `String value ->
        raise (deserialize_unknown_enum_value_error path "ExplicitAuthFlowsType" value)
    | _ -> raise (deserialize_wrong_type_error path "ExplicitAuthFlowsType")
     : explicit_auth_flows_type)
    : explicit_auth_flows_type)

let explicit_auth_flows_list_type_of_yojson tree path =
  list_of_yojson explicit_auth_flows_type_of_yojson tree path

let provider_name_type_of_yojson = string_of_yojson

let supported_identity_providers_list_type_of_yojson tree path =
  list_of_yojson provider_name_type_of_yojson tree path

let redirect_url_type_of_yojson = string_of_yojson

let callback_ur_ls_list_type_of_yojson tree path =
  list_of_yojson redirect_url_type_of_yojson tree path

let logout_ur_ls_list_type_of_yojson tree path =
  list_of_yojson redirect_url_type_of_yojson tree path

let o_auth_flow_type_of_yojson (tree : t) path =
  ((match tree with
    | `String "client_credentials" -> Client_credentials
    | `String "implicit" -> Implicit
    | `String "code" -> Code
    | `String value -> raise (deserialize_unknown_enum_value_error path "OAuthFlowType" value)
    | _ -> raise (deserialize_wrong_type_error path "OAuthFlowType")
     : o_auth_flow_type)
    : o_auth_flow_type)

let o_auth_flows_type_of_yojson tree path = list_of_yojson o_auth_flow_type_of_yojson tree path
let scope_type_of_yojson = string_of_yojson
let scope_list_type_of_yojson tree path = list_of_yojson scope_type_of_yojson tree path
let hex_string_type_of_yojson = string_of_yojson

let analytics_configuration_type_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     user_data_shared =
       option_of_yojson (value_for_key boolean_type_of_yojson "UserDataShared") _list path;
     external_id = option_of_yojson (value_for_key string_type_of_yojson "ExternalId") _list path;
     role_arn = option_of_yojson (value_for_key arn_type_of_yojson "RoleArn") _list path;
     application_arn =
       option_of_yojson (value_for_key arn_type_of_yojson "ApplicationArn") _list path;
     application_id =
       option_of_yojson (value_for_key hex_string_type_of_yojson "ApplicationId") _list path;
   }
    : analytics_configuration_type)

let prevent_user_existence_error_types_of_yojson (tree : t) path =
  ((match tree with
    | `String "ENABLED" -> ENABLED
    | `String "LEGACY" -> LEGACY
    | `String value ->
        raise (deserialize_unknown_enum_value_error path "PreventUserExistenceErrorTypes" value)
    | _ -> raise (deserialize_wrong_type_error path "PreventUserExistenceErrorTypes")
     : prevent_user_existence_error_types)
    : prevent_user_existence_error_types)

let auth_session_validity_type_of_yojson = int_of_yojson

let feature_type_of_yojson (tree : t) path =
  ((match tree with
    | `String "DISABLED" -> DISABLED
    | `String "ENABLED" -> ENABLED
    | `String value -> raise (deserialize_unknown_enum_value_error path "FeatureType" value)
    | _ -> raise (deserialize_wrong_type_error path "FeatureType")
     : feature_type)
    : feature_type)

let retry_grace_period_seconds_type_of_yojson = int_of_yojson

let refresh_token_rotation_type_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     retry_grace_period_seconds =
       option_of_yojson
         (value_for_key retry_grace_period_seconds_type_of_yojson "RetryGracePeriodSeconds")
         _list path;
     feature = value_for_key feature_type_of_yojson "Feature" _list path;
   }
    : refresh_token_rotation_type)

let user_pool_client_type_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     refresh_token_rotation =
       option_of_yojson
         (value_for_key refresh_token_rotation_type_of_yojson "RefreshTokenRotation")
         _list path;
     auth_session_validity =
       option_of_yojson
         (value_for_key auth_session_validity_type_of_yojson "AuthSessionValidity")
         _list path;
     enable_propagate_additional_user_context_data =
       option_of_yojson
         (value_for_key wrapped_boolean_type_of_yojson "EnablePropagateAdditionalUserContextData")
         _list path;
     enable_token_revocation =
       option_of_yojson
         (value_for_key wrapped_boolean_type_of_yojson "EnableTokenRevocation")
         _list path;
     prevent_user_existence_errors =
       option_of_yojson
         (value_for_key prevent_user_existence_error_types_of_yojson "PreventUserExistenceErrors")
         _list path;
     analytics_configuration =
       option_of_yojson
         (value_for_key analytics_configuration_type_of_yojson "AnalyticsConfiguration")
         _list path;
     allowed_o_auth_flows_user_pool_client =
       option_of_yojson
         (value_for_key boolean_type_of_yojson "AllowedOAuthFlowsUserPoolClient")
         _list path;
     allowed_o_auth_scopes =
       option_of_yojson (value_for_key scope_list_type_of_yojson "AllowedOAuthScopes") _list path;
     allowed_o_auth_flows =
       option_of_yojson (value_for_key o_auth_flows_type_of_yojson "AllowedOAuthFlows") _list path;
     default_redirect_ur_i =
       option_of_yojson (value_for_key redirect_url_type_of_yojson "DefaultRedirectURI") _list path;
     logout_ur_ls =
       option_of_yojson (value_for_key logout_ur_ls_list_type_of_yojson "LogoutURLs") _list path;
     callback_ur_ls =
       option_of_yojson (value_for_key callback_ur_ls_list_type_of_yojson "CallbackURLs") _list path;
     supported_identity_providers =
       option_of_yojson
         (value_for_key supported_identity_providers_list_type_of_yojson
            "SupportedIdentityProviders")
         _list path;
     explicit_auth_flows =
       option_of_yojson
         (value_for_key explicit_auth_flows_list_type_of_yojson "ExplicitAuthFlows")
         _list path;
     write_attributes =
       option_of_yojson
         (value_for_key client_permission_list_type_of_yojson "WriteAttributes")
         _list path;
     read_attributes =
       option_of_yojson
         (value_for_key client_permission_list_type_of_yojson "ReadAttributes")
         _list path;
     token_validity_units =
       option_of_yojson
         (value_for_key token_validity_units_type_of_yojson "TokenValidityUnits")
         _list path;
     id_token_validity =
       option_of_yojson
         (value_for_key id_token_validity_type_of_yojson "IdTokenValidity")
         _list path;
     access_token_validity =
       option_of_yojson
         (value_for_key access_token_validity_type_of_yojson "AccessTokenValidity")
         _list path;
     refresh_token_validity =
       option_of_yojson
         (value_for_key refresh_token_validity_type_of_yojson "RefreshTokenValidity")
         _list path;
     creation_date = option_of_yojson (value_for_key date_type_of_yojson "CreationDate") _list path;
     last_modified_date =
       option_of_yojson (value_for_key date_type_of_yojson "LastModifiedDate") _list path;
     client_secret =
       option_of_yojson (value_for_key client_secret_type_of_yojson "ClientSecret") _list path;
     client_id = option_of_yojson (value_for_key client_id_type_of_yojson "ClientId") _list path;
     client_name =
       option_of_yojson (value_for_key client_name_type_of_yojson "ClientName") _list path;
     user_pool_id =
       option_of_yojson (value_for_key user_pool_id_type_of_yojson "UserPoolId") _list path;
   }
    : user_pool_client_type)

let user_pool_client_description_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     client_name =
       option_of_yojson (value_for_key client_name_type_of_yojson "ClientName") _list path;
     user_pool_id =
       option_of_yojson (value_for_key user_pool_id_type_of_yojson "UserPoolId") _list path;
     client_id = option_of_yojson (value_for_key client_id_type_of_yojson "ClientId") _list path;
   }
    : user_pool_client_description)

let user_pool_client_list_type_of_yojson tree path =
  list_of_yojson user_pool_client_description_of_yojson tree path

let user_pool_add_on_not_enabled_exception_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({ message = option_of_yojson (value_for_key message_type_of_yojson "message") _list path }
    : user_pool_add_on_not_enabled_exception)

let user_mfa_setting_list_type_of_yojson tree path = list_of_yojson string_type_of_yojson tree path

let user_lambda_validation_exception_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({ message = option_of_yojson (value_for_key message_type_of_yojson "message") _list path }
    : user_lambda_validation_exception)

let user_import_job_name_type_of_yojson = string_of_yojson
let user_import_job_id_type_of_yojson = string_of_yojson
let pre_signed_url_type_of_yojson = string_of_yojson

let user_import_job_status_type_of_yojson (tree : t) path =
  ((match tree with
    | `String "Succeeded" -> Succeeded
    | `String "Failed" -> Failed
    | `String "Stopped" -> Stopped
    | `String "Expired" -> Expired
    | `String "Stopping" -> Stopping
    | `String "InProgress" -> InProgress
    | `String "Pending" -> Pending
    | `String "Created" -> Created
    | `String value ->
        raise (deserialize_unknown_enum_value_error path "UserImportJobStatusType" value)
    | _ -> raise (deserialize_wrong_type_error path "UserImportJobStatusType")
     : user_import_job_status_type)
    : user_import_job_status_type)

let long_type_of_yojson = long_of_yojson
let completion_message_type_of_yojson = string_of_yojson

let user_import_job_type_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     completion_message =
       option_of_yojson
         (value_for_key completion_message_type_of_yojson "CompletionMessage")
         _list path;
     failed_users = option_of_yojson (value_for_key long_type_of_yojson "FailedUsers") _list path;
     skipped_users = option_of_yojson (value_for_key long_type_of_yojson "SkippedUsers") _list path;
     imported_users =
       option_of_yojson (value_for_key long_type_of_yojson "ImportedUsers") _list path;
     cloud_watch_logs_role_arn =
       option_of_yojson (value_for_key arn_type_of_yojson "CloudWatchLogsRoleArn") _list path;
     status =
       option_of_yojson (value_for_key user_import_job_status_type_of_yojson "Status") _list path;
     completion_date =
       option_of_yojson (value_for_key date_type_of_yojson "CompletionDate") _list path;
     start_date = option_of_yojson (value_for_key date_type_of_yojson "StartDate") _list path;
     creation_date = option_of_yojson (value_for_key date_type_of_yojson "CreationDate") _list path;
     pre_signed_url =
       option_of_yojson (value_for_key pre_signed_url_type_of_yojson "PreSignedUrl") _list path;
     user_pool_id =
       option_of_yojson (value_for_key user_pool_id_type_of_yojson "UserPoolId") _list path;
     job_id = option_of_yojson (value_for_key user_import_job_id_type_of_yojson "JobId") _list path;
     job_name =
       option_of_yojson (value_for_key user_import_job_name_type_of_yojson "JobName") _list path;
   }
    : user_import_job_type)

let user_import_jobs_list_type_of_yojson tree path =
  list_of_yojson user_import_job_type_of_yojson tree path

let user_import_in_progress_exception_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({ message = option_of_yojson (value_for_key message_type_of_yojson "message") _list path }
    : user_import_in_progress_exception)

let user_filter_type_of_yojson = string_of_yojson

let user_context_data_type_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     encoded_data = option_of_yojson (value_for_key string_type_of_yojson "EncodedData") _list path;
     ip_address = option_of_yojson (value_for_key string_type_of_yojson "IpAddress") _list path;
   }
    : user_context_data_type)

let update_user_pool_response_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  (() : unit)

let update_user_pool_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     issuer_configuration =
       option_of_yojson
         (value_for_key issuer_configuration_type_of_yojson "IssuerConfiguration")
         _list path;
     key_configuration =
       option_of_yojson
         (value_for_key key_configuration_type_of_yojson "KeyConfiguration")
         _list path;
     user_pool_tier =
       option_of_yojson (value_for_key user_pool_tier_type_of_yojson "UserPoolTier") _list path;
     pool_name =
       option_of_yojson (value_for_key user_pool_name_type_of_yojson "PoolName") _list path;
     account_recovery_setting =
       option_of_yojson
         (value_for_key account_recovery_setting_type_of_yojson "AccountRecoverySetting")
         _list path;
     user_pool_add_ons =
       option_of_yojson (value_for_key user_pool_add_ons_type_of_yojson "UserPoolAddOns") _list path;
     admin_create_user_config =
       option_of_yojson
         (value_for_key admin_create_user_config_type_of_yojson "AdminCreateUserConfig")
         _list path;
     user_pool_tags =
       option_of_yojson (value_for_key user_pool_tags_type_of_yojson "UserPoolTags") _list path;
     sms_configuration =
       option_of_yojson
         (value_for_key sms_configuration_type_of_yojson "SmsConfiguration")
         _list path;
     email_configuration =
       option_of_yojson
         (value_for_key email_configuration_type_of_yojson "EmailConfiguration")
         _list path;
     device_configuration =
       option_of_yojson
         (value_for_key device_configuration_type_of_yojson "DeviceConfiguration")
         _list path;
     mfa_configuration =
       option_of_yojson (value_for_key user_pool_mfa_type_of_yojson "MfaConfiguration") _list path;
     user_attribute_update_settings =
       option_of_yojson
         (value_for_key user_attribute_update_settings_type_of_yojson "UserAttributeUpdateSettings")
         _list path;
     sms_authentication_message =
       option_of_yojson
         (value_for_key sms_verification_message_type_of_yojson "SmsAuthenticationMessage")
         _list path;
     verification_message_template =
       option_of_yojson
         (value_for_key verification_message_template_type_of_yojson "VerificationMessageTemplate")
         _list path;
     email_verification_subject =
       option_of_yojson
         (value_for_key email_verification_subject_type_of_yojson "EmailVerificationSubject")
         _list path;
     email_verification_message =
       option_of_yojson
         (value_for_key email_verification_message_type_of_yojson "EmailVerificationMessage")
         _list path;
     sms_verification_message =
       option_of_yojson
         (value_for_key sms_verification_message_type_of_yojson "SmsVerificationMessage")
         _list path;
     auto_verified_attributes =
       option_of_yojson
         (value_for_key verified_attributes_list_type_of_yojson "AutoVerifiedAttributes")
         _list path;
     lambda_config =
       option_of_yojson (value_for_key lambda_config_type_of_yojson "LambdaConfig") _list path;
     deletion_protection =
       option_of_yojson
         (value_for_key deletion_protection_type_of_yojson "DeletionProtection")
         _list path;
     policies =
       option_of_yojson (value_for_key user_pool_policy_type_of_yojson "Policies") _list path;
     user_pool_id = value_for_key user_pool_id_type_of_yojson "UserPoolId" _list path;
   }
    : update_user_pool_request)

let update_user_pool_replica_response_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     user_pool_replica =
       option_of_yojson
         (value_for_key user_pool_replica_type_of_yojson "UserPoolReplica")
         _list path;
   }
    : update_user_pool_replica_response)

let update_replica_status_type_of_yojson (tree : t) path =
  ((match tree with
    | `String "INACTIVE" -> INACTIVE
    | `String "ACTIVE" -> ACTIVE
    | `String value ->
        raise (deserialize_unknown_enum_value_error path "UpdateReplicaStatusType" value)
    | _ -> raise (deserialize_wrong_type_error path "UpdateReplicaStatusType")
     : update_replica_status_type)
    : update_replica_status_type)

let update_user_pool_replica_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     status = value_for_key update_replica_status_type_of_yojson "Status" _list path;
     region_name = value_for_key region_name_type_of_yojson "RegionName" _list path;
     user_pool_id = value_for_key user_pool_id_type_of_yojson "UserPoolId" _list path;
   }
    : update_user_pool_replica_request)

let health_check_id_type_of_yojson = string_of_yojson

let failover_type_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     primary_route53_health_check_id =
       value_for_key health_check_id_type_of_yojson "PrimaryRoute53HealthCheckId" _list path;
     secondary_region = value_for_key region_name_type_of_yojson "SecondaryRegion" _list path;
   }
    : failover_type)

let routing_type_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({ failover = option_of_yojson (value_for_key failover_type_of_yojson "Failover") _list path }
    : routing_type)

let update_user_pool_domain_response_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     routing = option_of_yojson (value_for_key routing_type_of_yojson "Routing") _list path;
     cloud_front_domain =
       option_of_yojson (value_for_key domain_type_of_yojson "CloudFrontDomain") _list path;
     managed_login_version =
       option_of_yojson
         (value_for_key wrapped_integer_type_of_yojson "ManagedLoginVersion")
         _list path;
   }
    : update_user_pool_domain_response)

let security_policy_type_of_yojson (tree : t) path =
  ((match tree with
    | `String "TLS_V1_3_2025" -> TLS_V1_3_2025
    | `String "TLS_V1_2_2021" -> TLS_V1_2_2021
    | `String "TLS_V1" -> TLS_V1
    | `String value -> raise (deserialize_unknown_enum_value_error path "SecurityPolicyType" value)
    | _ -> raise (deserialize_wrong_type_error path "SecurityPolicyType")
     : security_policy_type)
    : security_policy_type)

let custom_domain_config_type_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     security_policy =
       option_of_yojson (value_for_key security_policy_type_of_yojson "SecurityPolicy") _list path;
     certificate_arn = value_for_key arn_type_of_yojson "CertificateArn" _list path;
   }
    : custom_domain_config_type)

let update_user_pool_domain_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     routing = option_of_yojson (value_for_key routing_type_of_yojson "Routing") _list path;
     custom_domain_config =
       option_of_yojson
         (value_for_key custom_domain_config_type_of_yojson "CustomDomainConfig")
         _list path;
     managed_login_version =
       option_of_yojson
         (value_for_key wrapped_integer_type_of_yojson "ManagedLoginVersion")
         _list path;
     user_pool_id = value_for_key user_pool_id_type_of_yojson "UserPoolId" _list path;
     domain = value_for_key domain_type_of_yojson "Domain" _list path;
   }
    : update_user_pool_domain_request)

let feature_unavailable_in_tier_exception_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({ message = option_of_yojson (value_for_key message_type_of_yojson "message") _list path }
    : feature_unavailable_in_tier_exception)

let concurrent_modification_exception_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({ message = option_of_yojson (value_for_key message_type_of_yojson "message") _list path }
    : concurrent_modification_exception)

let update_user_pool_client_response_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     user_pool_client =
       option_of_yojson (value_for_key user_pool_client_type_of_yojson "UserPoolClient") _list path;
   }
    : update_user_pool_client_response)

let update_user_pool_client_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     refresh_token_rotation =
       option_of_yojson
         (value_for_key refresh_token_rotation_type_of_yojson "RefreshTokenRotation")
         _list path;
     auth_session_validity =
       option_of_yojson
         (value_for_key auth_session_validity_type_of_yojson "AuthSessionValidity")
         _list path;
     enable_propagate_additional_user_context_data =
       option_of_yojson
         (value_for_key wrapped_boolean_type_of_yojson "EnablePropagateAdditionalUserContextData")
         _list path;
     enable_token_revocation =
       option_of_yojson
         (value_for_key wrapped_boolean_type_of_yojson "EnableTokenRevocation")
         _list path;
     prevent_user_existence_errors =
       option_of_yojson
         (value_for_key prevent_user_existence_error_types_of_yojson "PreventUserExistenceErrors")
         _list path;
     analytics_configuration =
       option_of_yojson
         (value_for_key analytics_configuration_type_of_yojson "AnalyticsConfiguration")
         _list path;
     allowed_o_auth_flows_user_pool_client =
       option_of_yojson
         (value_for_key boolean_type_of_yojson "AllowedOAuthFlowsUserPoolClient")
         _list path;
     allowed_o_auth_scopes =
       option_of_yojson (value_for_key scope_list_type_of_yojson "AllowedOAuthScopes") _list path;
     allowed_o_auth_flows =
       option_of_yojson (value_for_key o_auth_flows_type_of_yojson "AllowedOAuthFlows") _list path;
     default_redirect_ur_i =
       option_of_yojson (value_for_key redirect_url_type_of_yojson "DefaultRedirectURI") _list path;
     logout_ur_ls =
       option_of_yojson (value_for_key logout_ur_ls_list_type_of_yojson "LogoutURLs") _list path;
     callback_ur_ls =
       option_of_yojson (value_for_key callback_ur_ls_list_type_of_yojson "CallbackURLs") _list path;
     supported_identity_providers =
       option_of_yojson
         (value_for_key supported_identity_providers_list_type_of_yojson
            "SupportedIdentityProviders")
         _list path;
     explicit_auth_flows =
       option_of_yojson
         (value_for_key explicit_auth_flows_list_type_of_yojson "ExplicitAuthFlows")
         _list path;
     write_attributes =
       option_of_yojson
         (value_for_key client_permission_list_type_of_yojson "WriteAttributes")
         _list path;
     read_attributes =
       option_of_yojson
         (value_for_key client_permission_list_type_of_yojson "ReadAttributes")
         _list path;
     token_validity_units =
       option_of_yojson
         (value_for_key token_validity_units_type_of_yojson "TokenValidityUnits")
         _list path;
     id_token_validity =
       option_of_yojson
         (value_for_key id_token_validity_type_of_yojson "IdTokenValidity")
         _list path;
     access_token_validity =
       option_of_yojson
         (value_for_key access_token_validity_type_of_yojson "AccessTokenValidity")
         _list path;
     refresh_token_validity =
       option_of_yojson
         (value_for_key refresh_token_validity_type_of_yojson "RefreshTokenValidity")
         _list path;
     client_name =
       option_of_yojson (value_for_key client_name_type_of_yojson "ClientName") _list path;
     client_id = value_for_key client_id_type_of_yojson "ClientId" _list path;
     user_pool_id = value_for_key user_pool_id_type_of_yojson "UserPoolId" _list path;
   }
    : update_user_pool_client_request)

let scope_does_not_exist_exception_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({ message = option_of_yojson (value_for_key message_type_of_yojson "message") _list path }
    : scope_does_not_exist_exception)

let invalid_o_auth_flow_exception_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({ message = option_of_yojson (value_for_key message_type_of_yojson "message") _list path }
    : invalid_o_auth_flow_exception)

let tier_change_not_allowed_exception_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({ message = option_of_yojson (value_for_key message_type_of_yojson "message") _list path }
    : tier_change_not_allowed_exception)

let invalid_sms_role_trust_relationship_exception_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({ message = option_of_yojson (value_for_key message_type_of_yojson "message") _list path }
    : invalid_sms_role_trust_relationship_exception)

let invalid_sms_role_access_policy_exception_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({ message = option_of_yojson (value_for_key message_type_of_yojson "message") _list path }
    : invalid_sms_role_access_policy_exception)

let invalid_email_role_access_policy_exception_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({ message = option_of_yojson (value_for_key message_type_of_yojson "message") _list path }
    : invalid_email_role_access_policy_exception)

let code_delivery_details_type_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     attribute_name =
       option_of_yojson (value_for_key attribute_name_type_of_yojson "AttributeName") _list path;
     delivery_medium =
       option_of_yojson (value_for_key delivery_medium_type_of_yojson "DeliveryMedium") _list path;
     destination = option_of_yojson (value_for_key string_type_of_yojson "Destination") _list path;
   }
    : code_delivery_details_type)

let code_delivery_details_list_type_of_yojson tree path =
  list_of_yojson code_delivery_details_type_of_yojson tree path

let update_user_attributes_response_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     code_delivery_details_list =
       option_of_yojson
         (value_for_key code_delivery_details_list_type_of_yojson "CodeDeliveryDetailsList")
         _list path;
   }
    : update_user_attributes_response)

let client_metadata_type_of_yojson tree path =
  map_of_yojson string_type_of_yojson string_type_of_yojson tree path

let update_user_attributes_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     client_metadata =
       option_of_yojson (value_for_key client_metadata_type_of_yojson "ClientMetadata") _list path;
     access_token = value_for_key token_model_type_of_yojson "AccessToken" _list path;
     user_attributes = value_for_key attribute_list_type_of_yojson "UserAttributes" _list path;
   }
    : update_user_attributes_request)

let unexpected_lambda_exception_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({ message = option_of_yojson (value_for_key message_type_of_yojson "message") _list path }
    : unexpected_lambda_exception)

let invalid_lambda_response_exception_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({ message = option_of_yojson (value_for_key message_type_of_yojson "message") _list path }
    : invalid_lambda_response_exception)

let code_delivery_failure_exception_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({ message = option_of_yojson (value_for_key message_type_of_yojson "message") _list path }
    : code_delivery_failure_exception)

let terms_id_type_of_yojson = string_of_yojson
let terms_name_type_of_yojson = string_of_yojson

let terms_source_type_of_yojson (tree : t) path =
  ((match tree with
    | `String "LINK" -> LINK
    | `String value -> raise (deserialize_unknown_enum_value_error path "TermsSourceType" value)
    | _ -> raise (deserialize_wrong_type_error path "TermsSourceType")
     : terms_source_type)
    : terms_source_type)

let terms_enforcement_type_of_yojson (tree : t) path =
  ((match tree with
    | `String "NONE" -> NONE
    | `String value ->
        raise (deserialize_unknown_enum_value_error path "TermsEnforcementType" value)
    | _ -> raise (deserialize_wrong_type_error path "TermsEnforcementType")
     : terms_enforcement_type)
    : terms_enforcement_type)

let link_url_type_of_yojson = string_of_yojson
let language_id_type_of_yojson = string_of_yojson

let links_type_of_yojson tree path =
  map_of_yojson language_id_type_of_yojson link_url_type_of_yojson tree path

let terms_type_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     last_modified_date = value_for_key date_type_of_yojson "LastModifiedDate" _list path;
     creation_date = value_for_key date_type_of_yojson "CreationDate" _list path;
     links = value_for_key links_type_of_yojson "Links" _list path;
     enforcement = value_for_key terms_enforcement_type_of_yojson "Enforcement" _list path;
     terms_source = value_for_key terms_source_type_of_yojson "TermsSource" _list path;
     terms_name = value_for_key terms_name_type_of_yojson "TermsName" _list path;
     client_id = value_for_key client_id_type_of_yojson "ClientId" _list path;
     user_pool_id = value_for_key user_pool_id_type_of_yojson "UserPoolId" _list path;
     terms_id = value_for_key terms_id_type_of_yojson "TermsId" _list path;
   }
    : terms_type)

let update_terms_response_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({ terms = option_of_yojson (value_for_key terms_type_of_yojson "Terms") _list path }
    : update_terms_response)

let update_terms_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     links = option_of_yojson (value_for_key links_type_of_yojson "Links") _list path;
     enforcement =
       option_of_yojson (value_for_key terms_enforcement_type_of_yojson "Enforcement") _list path;
     terms_source =
       option_of_yojson (value_for_key terms_source_type_of_yojson "TermsSource") _list path;
     terms_name = option_of_yojson (value_for_key terms_name_type_of_yojson "TermsName") _list path;
     user_pool_id = value_for_key user_pool_id_type_of_yojson "UserPoolId" _list path;
     terms_id = value_for_key terms_id_type_of_yojson "TermsId" _list path;
   }
    : update_terms_request)

let terms_exists_exception_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({ message = option_of_yojson (value_for_key message_type_of_yojson "message") _list path }
    : terms_exists_exception)

let resource_server_identifier_type_of_yojson = string_of_yojson
let resource_server_name_type_of_yojson = string_of_yojson
let resource_server_scope_name_type_of_yojson = string_of_yojson
let resource_server_scope_description_type_of_yojson = string_of_yojson

let resource_server_scope_type_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     scope_description =
       value_for_key resource_server_scope_description_type_of_yojson "ScopeDescription" _list path;
     scope_name = value_for_key resource_server_scope_name_type_of_yojson "ScopeName" _list path;
   }
    : resource_server_scope_type)

let resource_server_scope_list_type_of_yojson tree path =
  list_of_yojson resource_server_scope_type_of_yojson tree path

let resource_server_type_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     scopes =
       option_of_yojson
         (value_for_key resource_server_scope_list_type_of_yojson "Scopes")
         _list path;
     name = option_of_yojson (value_for_key resource_server_name_type_of_yojson "Name") _list path;
     identifier =
       option_of_yojson
         (value_for_key resource_server_identifier_type_of_yojson "Identifier")
         _list path;
     user_pool_id =
       option_of_yojson (value_for_key user_pool_id_type_of_yojson "UserPoolId") _list path;
   }
    : resource_server_type)

let update_resource_server_response_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({ resource_server = value_for_key resource_server_type_of_yojson "ResourceServer" _list path }
    : update_resource_server_response)

let update_resource_server_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     scopes =
       option_of_yojson
         (value_for_key resource_server_scope_list_type_of_yojson "Scopes")
         _list path;
     name = value_for_key resource_server_name_type_of_yojson "Name" _list path;
     identifier = value_for_key resource_server_identifier_type_of_yojson "Identifier" _list path;
     user_pool_id = value_for_key user_pool_id_type_of_yojson "UserPoolId" _list path;
   }
    : update_resource_server_request)

let limit_class_of_yojson (tree : t) path =
  ((match tree with
    | `String "API_CATEGORY" -> API_CATEGORY
    | `String value -> raise (deserialize_unknown_enum_value_error path "LimitClass" value)
    | _ -> raise (deserialize_wrong_type_error path "LimitClass")
     : limit_class)
    : limit_class)

let string_to_string_map_type_of_yojson tree path =
  map_of_yojson string_type_of_yojson string_type_of_yojson tree path

let limit_definition_type_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     attributes = value_for_key string_to_string_map_type_of_yojson "Attributes" _list path;
     limit_class = value_for_key limit_class_of_yojson "LimitClass" _list path;
   }
    : limit_definition_type)

let limit_type_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     free_limit_value = value_for_key integer_type_of_yojson "FreeLimitValue" _list path;
     provisioned_limit_value =
       value_for_key integer_type_of_yojson "ProvisionedLimitValue" _list path;
     limit_definition = value_for_key limit_definition_type_of_yojson "LimitDefinition" _list path;
   }
    : limit_type)

let update_provisioned_limit_response_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({ limit = value_for_key limit_type_of_yojson "Limit" _list path }
    : update_provisioned_limit_response)

let update_provisioned_limit_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     requested_limit_value = value_for_key integer_type_of_yojson "RequestedLimitValue" _list path;
     limit_definition = value_for_key limit_definition_type_of_yojson "LimitDefinition" _list path;
   }
    : update_provisioned_limit_request)

let service_quota_exceeded_exception_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({ message = option_of_yojson (value_for_key message_type_of_yojson "message") _list path }
    : service_quota_exceeded_exception)

let managed_login_branding_id_type_of_yojson = string_of_yojson
let document_of_yojson = json_of_yojson

let asset_category_type_of_yojson (tree : t) path =
  ((match tree with
    | `String "IDP_BUTTON_ICON" -> IDP_BUTTON_ICON
    | `String "FORM_LOGO" -> FORM_LOGO
    | `String "FORM_BACKGROUND" -> FORM_BACKGROUND
    | `String "PAGE_BACKGROUND" -> PAGE_BACKGROUND
    | `String "PAGE_FOOTER_BACKGROUND" -> PAGE_FOOTER_BACKGROUND
    | `String "PAGE_FOOTER_LOGO" -> PAGE_FOOTER_LOGO
    | `String "PAGE_HEADER_BACKGROUND" -> PAGE_HEADER_BACKGROUND
    | `String "PAGE_HEADER_LOGO" -> PAGE_HEADER_LOGO
    | `String "PASSKEY_GRAPHIC" -> PASSKEY_GRAPHIC
    | `String "PASSWORD_GRAPHIC" -> PASSWORD_GRAPHIC
    | `String "AUTH_APP_GRAPHIC" -> AUTH_APP_GRAPHIC
    | `String "SMS_GRAPHIC" -> SMS_GRAPHIC
    | `String "EMAIL_GRAPHIC" -> EMAIL_GRAPHIC
    | `String "FAVICON_SVG" -> FAVICON_SVG
    | `String "FAVICON_ICO" -> FAVICON_ICO
    | `String value -> raise (deserialize_unknown_enum_value_error path "AssetCategoryType" value)
    | _ -> raise (deserialize_wrong_type_error path "AssetCategoryType")
     : asset_category_type)
    : asset_category_type)

let color_scheme_mode_type_of_yojson (tree : t) path =
  ((match tree with
    | `String "DYNAMIC" -> DYNAMIC
    | `String "DARK" -> DARK
    | `String "LIGHT" -> LIGHT
    | `String value -> raise (deserialize_unknown_enum_value_error path "ColorSchemeModeType" value)
    | _ -> raise (deserialize_wrong_type_error path "ColorSchemeModeType")
     : color_scheme_mode_type)
    : color_scheme_mode_type)

let asset_extension_type_of_yojson (tree : t) path =
  ((match tree with
    | `String "WEBP" -> WEBP
    | `String "SVG" -> SVG
    | `String "PNG" -> PNG
    | `String "JPEG" -> JPEG
    | `String "ICO" -> ICO
    | `String value -> raise (deserialize_unknown_enum_value_error path "AssetExtensionType" value)
    | _ -> raise (deserialize_wrong_type_error path "AssetExtensionType")
     : asset_extension_type)
    : asset_extension_type)

let asset_bytes_type_of_yojson = blob_of_yojson
let resource_id_type_of_yojson = string_of_yojson

let asset_type_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     resource_id =
       option_of_yojson (value_for_key resource_id_type_of_yojson "ResourceId") _list path;
     bytes = option_of_yojson (value_for_key asset_bytes_type_of_yojson "Bytes") _list path;
     extension = value_for_key asset_extension_type_of_yojson "Extension" _list path;
     color_mode = value_for_key color_scheme_mode_type_of_yojson "ColorMode" _list path;
     category = value_for_key asset_category_type_of_yojson "Category" _list path;
   }
    : asset_type)

let asset_list_type_of_yojson tree path = list_of_yojson asset_type_of_yojson tree path

let managed_login_branding_type_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     last_modified_date =
       option_of_yojson (value_for_key date_type_of_yojson "LastModifiedDate") _list path;
     creation_date = option_of_yojson (value_for_key date_type_of_yojson "CreationDate") _list path;
     assets = option_of_yojson (value_for_key asset_list_type_of_yojson "Assets") _list path;
     settings = option_of_yojson (value_for_key document_of_yojson "Settings") _list path;
     use_cognito_provided_values =
       option_of_yojson (value_for_key boolean_type_of_yojson "UseCognitoProvidedValues") _list path;
     user_pool_id =
       option_of_yojson (value_for_key user_pool_id_type_of_yojson "UserPoolId") _list path;
     managed_login_branding_id =
       option_of_yojson
         (value_for_key managed_login_branding_id_type_of_yojson "ManagedLoginBrandingId")
         _list path;
   }
    : managed_login_branding_type)

let update_managed_login_branding_response_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     managed_login_branding =
       option_of_yojson
         (value_for_key managed_login_branding_type_of_yojson "ManagedLoginBranding")
         _list path;
   }
    : update_managed_login_branding_response)

let update_managed_login_branding_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     assets = option_of_yojson (value_for_key asset_list_type_of_yojson "Assets") _list path;
     settings = option_of_yojson (value_for_key document_of_yojson "Settings") _list path;
     use_cognito_provided_values =
       option_of_yojson (value_for_key boolean_type_of_yojson "UseCognitoProvidedValues") _list path;
     managed_login_branding_id =
       option_of_yojson
         (value_for_key managed_login_branding_id_type_of_yojson "ManagedLoginBrandingId")
         _list path;
     user_pool_id =
       option_of_yojson (value_for_key user_pool_id_type_of_yojson "UserPoolId") _list path;
   }
    : update_managed_login_branding_request)

let identity_provider_type_type_of_yojson (tree : t) path =
  ((match tree with
    | `String "OIDC" -> OIDC
    | `String "SignInWithApple" -> SignInWithApple
    | `String "LoginWithAmazon" -> LoginWithAmazon
    | `String "Google" -> Google
    | `String "Facebook" -> Facebook
    | `String "SAML" -> SAML
    | `String value ->
        raise (deserialize_unknown_enum_value_error path "IdentityProviderTypeType" value)
    | _ -> raise (deserialize_wrong_type_error path "IdentityProviderTypeType")
     : identity_provider_type_type)
    : identity_provider_type_type)

let provider_details_type_of_yojson tree path =
  map_of_yojson string_type_of_yojson string_type_of_yojson tree path

let attribute_mapping_key_type_of_yojson = string_of_yojson

let attribute_mapping_type_of_yojson tree path =
  map_of_yojson attribute_mapping_key_type_of_yojson string_type_of_yojson tree path

let idp_identifier_type_of_yojson = string_of_yojson

let idp_identifiers_list_type_of_yojson tree path =
  list_of_yojson idp_identifier_type_of_yojson tree path

let identity_provider_type_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     creation_date = option_of_yojson (value_for_key date_type_of_yojson "CreationDate") _list path;
     last_modified_date =
       option_of_yojson (value_for_key date_type_of_yojson "LastModifiedDate") _list path;
     idp_identifiers =
       option_of_yojson
         (value_for_key idp_identifiers_list_type_of_yojson "IdpIdentifiers")
         _list path;
     attribute_mapping =
       option_of_yojson
         (value_for_key attribute_mapping_type_of_yojson "AttributeMapping")
         _list path;
     provider_details =
       option_of_yojson (value_for_key provider_details_type_of_yojson "ProviderDetails") _list path;
     provider_type =
       option_of_yojson
         (value_for_key identity_provider_type_type_of_yojson "ProviderType")
         _list path;
     provider_name =
       option_of_yojson (value_for_key provider_name_type_of_yojson "ProviderName") _list path;
     user_pool_id =
       option_of_yojson (value_for_key user_pool_id_type_of_yojson "UserPoolId") _list path;
   }
    : identity_provider_type)

let update_identity_provider_response_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     identity_provider =
       value_for_key identity_provider_type_of_yojson "IdentityProvider" _list path;
   }
    : update_identity_provider_response)

let update_identity_provider_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     idp_identifiers =
       option_of_yojson
         (value_for_key idp_identifiers_list_type_of_yojson "IdpIdentifiers")
         _list path;
     attribute_mapping =
       option_of_yojson
         (value_for_key attribute_mapping_type_of_yojson "AttributeMapping")
         _list path;
     provider_details =
       option_of_yojson (value_for_key provider_details_type_of_yojson "ProviderDetails") _list path;
     provider_name = value_for_key provider_name_type_of_yojson "ProviderName" _list path;
     user_pool_id = value_for_key user_pool_id_type_of_yojson "UserPoolId" _list path;
   }
    : update_identity_provider_request)

let unsupported_identity_provider_exception_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({ message = option_of_yojson (value_for_key message_type_of_yojson "message") _list path }
    : unsupported_identity_provider_exception)

let group_name_type_of_yojson = string_of_yojson
let description_type_of_yojson = string_of_yojson
let precedence_type_of_yojson = int_of_yojson

let group_type_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     creation_date = option_of_yojson (value_for_key date_type_of_yojson "CreationDate") _list path;
     last_modified_date =
       option_of_yojson (value_for_key date_type_of_yojson "LastModifiedDate") _list path;
     precedence = option_of_yojson (value_for_key precedence_type_of_yojson "Precedence") _list path;
     role_arn = option_of_yojson (value_for_key arn_type_of_yojson "RoleArn") _list path;
     description =
       option_of_yojson (value_for_key description_type_of_yojson "Description") _list path;
     user_pool_id =
       option_of_yojson (value_for_key user_pool_id_type_of_yojson "UserPoolId") _list path;
     group_name = option_of_yojson (value_for_key group_name_type_of_yojson "GroupName") _list path;
   }
    : group_type)

let update_group_response_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({ group = option_of_yojson (value_for_key group_type_of_yojson "Group") _list path }
    : update_group_response)

let update_group_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     precedence = option_of_yojson (value_for_key precedence_type_of_yojson "Precedence") _list path;
     role_arn = option_of_yojson (value_for_key arn_type_of_yojson "RoleArn") _list path;
     description =
       option_of_yojson (value_for_key description_type_of_yojson "Description") _list path;
     user_pool_id = value_for_key user_pool_id_type_of_yojson "UserPoolId" _list path;
     group_name = value_for_key group_name_type_of_yojson "GroupName" _list path;
   }
    : update_group_request)

let update_device_status_response_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  (() : unit)

let device_key_type_of_yojson = string_of_yojson

let device_remembered_status_type_of_yojson (tree : t) path =
  ((match tree with
    | `String "not_remembered" -> NOT_REMEMBERED
    | `String "remembered" -> REMEMBERED
    | `String value ->
        raise (deserialize_unknown_enum_value_error path "DeviceRememberedStatusType" value)
    | _ -> raise (deserialize_wrong_type_error path "DeviceRememberedStatusType")
     : device_remembered_status_type)
    : device_remembered_status_type)

let update_device_status_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     device_remembered_status =
       option_of_yojson
         (value_for_key device_remembered_status_type_of_yojson "DeviceRememberedStatus")
         _list path;
     device_key = value_for_key device_key_type_of_yojson "DeviceKey" _list path;
     access_token = value_for_key token_model_type_of_yojson "AccessToken" _list path;
   }
    : update_device_status_request)

let update_auth_event_feedback_response_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  (() : unit)

let event_id_type_of_yojson = string_of_yojson

let feedback_value_type_of_yojson (tree : t) path =
  ((match tree with
    | `String "Invalid" -> INVALID
    | `String "Valid" -> VALID
    | `String value -> raise (deserialize_unknown_enum_value_error path "FeedbackValueType" value)
    | _ -> raise (deserialize_wrong_type_error path "FeedbackValueType")
     : feedback_value_type)
    : feedback_value_type)

let update_auth_event_feedback_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     feedback_value = value_for_key feedback_value_type_of_yojson "FeedbackValue" _list path;
     feedback_token = value_for_key token_model_type_of_yojson "FeedbackToken" _list path;
     event_id = value_for_key event_id_type_of_yojson "EventId" _list path;
     username = value_for_key username_type_of_yojson "Username" _list path;
     user_pool_id = value_for_key user_pool_id_type_of_yojson "UserPoolId" _list path;
   }
    : update_auth_event_feedback_request)

let untag_resource_response_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  (() : unit)

let untag_resource_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     tag_keys = value_for_key user_pool_tags_list_type_of_yojson "TagKeys" _list path;
     resource_arn = value_for_key arn_type_of_yojson "ResourceArn" _list path;
   }
    : untag_resource_request)

let unsupported_user_state_exception_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({ message = option_of_yojson (value_for_key message_type_of_yojson "message") _list path }
    : unsupported_user_state_exception)

let unsupported_token_type_exception_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({ message = option_of_yojson (value_for_key message_type_of_yojson "message") _list path }
    : unsupported_token_type_exception)

let unsupported_operation_exception_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({ message = option_of_yojson (value_for_key message_type_of_yojson "message") _list path }
    : unsupported_operation_exception)

let unauthorized_exception_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({ message = option_of_yojson (value_for_key message_type_of_yojson "message") _list path }
    : unauthorized_exception)

let image_url_type_of_yojson = string_of_yojson
let css_type_of_yojson = string_of_yojson
let css_version_type_of_yojson = string_of_yojson

let ui_customization_type_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     creation_date = option_of_yojson (value_for_key date_type_of_yojson "CreationDate") _list path;
     last_modified_date =
       option_of_yojson (value_for_key date_type_of_yojson "LastModifiedDate") _list path;
     css_version =
       option_of_yojson (value_for_key css_version_type_of_yojson "CSSVersion") _list path;
     cs_s = option_of_yojson (value_for_key css_type_of_yojson "CSS") _list path;
     image_url = option_of_yojson (value_for_key image_url_type_of_yojson "ImageUrl") _list path;
     client_id = option_of_yojson (value_for_key client_id_type_of_yojson "ClientId") _list path;
     user_pool_id =
       option_of_yojson (value_for_key user_pool_id_type_of_yojson "UserPoolId") _list path;
   }
    : ui_customization_type)

let too_many_failed_attempts_exception_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({ message = option_of_yojson (value_for_key message_type_of_yojson "message") _list path }
    : too_many_failed_attempts_exception)

let terms_description_type_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     last_modified_date = value_for_key date_type_of_yojson "LastModifiedDate" _list path;
     creation_date = value_for_key date_type_of_yojson "CreationDate" _list path;
     enforcement = value_for_key terms_enforcement_type_of_yojson "Enforcement" _list path;
     terms_name = value_for_key terms_name_type_of_yojson "TermsName" _list path;
     terms_id = value_for_key terms_id_type_of_yojson "TermsId" _list path;
   }
    : terms_description_type)

let terms_description_list_type_of_yojson tree path =
  list_of_yojson terms_description_type_of_yojson tree path

let tag_resource_response_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  (() : unit)

let tag_resource_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     tags = value_for_key user_pool_tags_type_of_yojson "Tags" _list path;
     resource_arn = value_for_key arn_type_of_yojson "ResourceArn" _list path;
   }
    : tag_resource_request)

let stop_user_import_job_response_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     user_import_job =
       option_of_yojson (value_for_key user_import_job_type_of_yojson "UserImportJob") _list path;
   }
    : stop_user_import_job_response)

let stop_user_import_job_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     job_id = value_for_key user_import_job_id_type_of_yojson "JobId" _list path;
     user_pool_id = value_for_key user_pool_id_type_of_yojson "UserPoolId" _list path;
   }
    : stop_user_import_job_request)

let precondition_not_met_exception_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({ message = option_of_yojson (value_for_key message_type_of_yojson "message") _list path }
    : precondition_not_met_exception)

let start_web_authn_registration_response_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     credential_creation_options =
       value_for_key document_of_yojson "CredentialCreationOptions" _list path;
   }
    : start_web_authn_registration_response)

let start_web_authn_registration_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({ access_token = value_for_key token_model_type_of_yojson "AccessToken" _list path }
    : start_web_authn_registration_request)

let start_user_import_job_response_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     user_import_job =
       option_of_yojson (value_for_key user_import_job_type_of_yojson "UserImportJob") _list path;
   }
    : start_user_import_job_response)

let start_user_import_job_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     job_id = value_for_key user_import_job_id_type_of_yojson "JobId" _list path;
     user_pool_id = value_for_key user_pool_id_type_of_yojson "UserPoolId" _list path;
   }
    : start_user_import_job_request)

let software_token_mfa_settings_type_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     preferred_mfa =
       option_of_yojson (value_for_key boolean_type_of_yojson "PreferredMfa") _list path;
     enabled = option_of_yojson (value_for_key boolean_type_of_yojson "Enabled") _list path;
   }
    : software_token_mfa_settings_type)

let software_token_mfa_config_type_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({ enabled = option_of_yojson (value_for_key boolean_type_of_yojson "Enabled") _list path }
    : software_token_mfa_config_type)

let sms_mfa_config_type_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     sms_configuration =
       option_of_yojson
         (value_for_key sms_configuration_type_of_yojson "SmsConfiguration")
         _list path;
     sms_authentication_message =
       option_of_yojson
         (value_for_key sms_verification_message_type_of_yojson "SmsAuthenticationMessage")
         _list path;
   }
    : sms_mfa_config_type)

let skipped_ip_range_list_type_of_yojson tree path = list_of_yojson string_type_of_yojson tree path

let sign_up_response_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     session = option_of_yojson (value_for_key session_type_of_yojson "Session") _list path;
     user_sub = value_for_key string_type_of_yojson "UserSub" _list path;
     code_delivery_details =
       option_of_yojson
         (value_for_key code_delivery_details_type_of_yojson "CodeDeliveryDetails")
         _list path;
     user_confirmed = value_for_key boolean_type_of_yojson "UserConfirmed" _list path;
   }
    : sign_up_response)

let secret_hash_type_of_yojson = string_of_yojson
let password_type_of_yojson = string_of_yojson

let analytics_metadata_type_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     analytics_endpoint_id =
       option_of_yojson (value_for_key string_type_of_yojson "AnalyticsEndpointId") _list path;
   }
    : analytics_metadata_type)

let sign_up_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     client_metadata =
       option_of_yojson (value_for_key client_metadata_type_of_yojson "ClientMetadata") _list path;
     user_context_data =
       option_of_yojson
         (value_for_key user_context_data_type_of_yojson "UserContextData")
         _list path;
     analytics_metadata =
       option_of_yojson
         (value_for_key analytics_metadata_type_of_yojson "AnalyticsMetadata")
         _list path;
     validation_data =
       option_of_yojson (value_for_key attribute_list_type_of_yojson "ValidationData") _list path;
     user_attributes =
       option_of_yojson (value_for_key attribute_list_type_of_yojson "UserAttributes") _list path;
     password = option_of_yojson (value_for_key password_type_of_yojson "Password") _list path;
     username = value_for_key username_type_of_yojson "Username" _list path;
     secret_hash =
       option_of_yojson (value_for_key secret_hash_type_of_yojson "SecretHash") _list path;
     client_id = value_for_key client_id_type_of_yojson "ClientId" _list path;
   }
    : sign_up_request)

let invalid_password_exception_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({ message = option_of_yojson (value_for_key message_type_of_yojson "message") _list path }
    : invalid_password_exception)

let set_user_settings_response_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  (() : unit)

let set_user_settings_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     mfa_options = value_for_key mfa_option_list_type_of_yojson "MFAOptions" _list path;
     access_token = value_for_key token_model_type_of_yojson "AccessToken" _list path;
   }
    : set_user_settings_request)

let email_mfa_message_type_of_yojson = string_of_yojson
let email_mfa_subject_type_of_yojson = string_of_yojson

let email_mfa_config_type_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     subject =
       option_of_yojson (value_for_key email_mfa_subject_type_of_yojson "Subject") _list path;
     message =
       option_of_yojson (value_for_key email_mfa_message_type_of_yojson "Message") _list path;
   }
    : email_mfa_config_type)

let set_user_pool_mfa_config_response_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     web_authn_configuration =
       option_of_yojson
         (value_for_key web_authn_configuration_type_of_yojson "WebAuthnConfiguration")
         _list path;
     mfa_configuration =
       option_of_yojson (value_for_key user_pool_mfa_type_of_yojson "MfaConfiguration") _list path;
     email_mfa_configuration =
       option_of_yojson
         (value_for_key email_mfa_config_type_of_yojson "EmailMfaConfiguration")
         _list path;
     software_token_mfa_configuration =
       option_of_yojson
         (value_for_key software_token_mfa_config_type_of_yojson "SoftwareTokenMfaConfiguration")
         _list path;
     sms_mfa_configuration =
       option_of_yojson
         (value_for_key sms_mfa_config_type_of_yojson "SmsMfaConfiguration")
         _list path;
   }
    : set_user_pool_mfa_config_response)

let set_user_pool_mfa_config_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     web_authn_configuration =
       option_of_yojson
         (value_for_key web_authn_configuration_type_of_yojson "WebAuthnConfiguration")
         _list path;
     mfa_configuration =
       option_of_yojson (value_for_key user_pool_mfa_type_of_yojson "MfaConfiguration") _list path;
     email_mfa_configuration =
       option_of_yojson
         (value_for_key email_mfa_config_type_of_yojson "EmailMfaConfiguration")
         _list path;
     software_token_mfa_configuration =
       option_of_yojson
         (value_for_key software_token_mfa_config_type_of_yojson "SoftwareTokenMfaConfiguration")
         _list path;
     sms_mfa_configuration =
       option_of_yojson
         (value_for_key sms_mfa_config_type_of_yojson "SmsMfaConfiguration")
         _list path;
     user_pool_id = value_for_key user_pool_id_type_of_yojson "UserPoolId" _list path;
   }
    : set_user_pool_mfa_config_request)

let set_user_mfa_preference_response_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  (() : unit)

let sms_mfa_settings_type_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     preferred_mfa =
       option_of_yojson (value_for_key boolean_type_of_yojson "PreferredMfa") _list path;
     enabled = option_of_yojson (value_for_key boolean_type_of_yojson "Enabled") _list path;
   }
    : sms_mfa_settings_type)

let email_mfa_settings_type_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     preferred_mfa =
       option_of_yojson (value_for_key boolean_type_of_yojson "PreferredMfa") _list path;
     enabled = option_of_yojson (value_for_key boolean_type_of_yojson "Enabled") _list path;
   }
    : email_mfa_settings_type)

let set_user_mfa_preference_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     access_token = value_for_key token_model_type_of_yojson "AccessToken" _list path;
     web_authn_mfa_settings =
       option_of_yojson
         (value_for_key web_authn_mfa_settings_type_of_yojson "WebAuthnMfaSettings")
         _list path;
     email_mfa_settings =
       option_of_yojson
         (value_for_key email_mfa_settings_type_of_yojson "EmailMfaSettings")
         _list path;
     software_token_mfa_settings =
       option_of_yojson
         (value_for_key software_token_mfa_settings_type_of_yojson "SoftwareTokenMfaSettings")
         _list path;
     sms_mfa_settings =
       option_of_yojson (value_for_key sms_mfa_settings_type_of_yojson "SMSMfaSettings") _list path;
   }
    : set_user_mfa_preference_request)

let set_ui_customization_response_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({ ui_customization = value_for_key ui_customization_type_of_yojson "UICustomization" _list path }
    : set_ui_customization_response)

let image_file_type_of_yojson = blob_of_yojson

let set_ui_customization_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     image_file = option_of_yojson (value_for_key image_file_type_of_yojson "ImageFile") _list path;
     cs_s = option_of_yojson (value_for_key css_type_of_yojson "CSS") _list path;
     client_id = option_of_yojson (value_for_key client_id_type_of_yojson "ClientId") _list path;
     user_pool_id = value_for_key user_pool_id_type_of_yojson "UserPoolId" _list path;
   }
    : set_ui_customization_request)

let event_filter_type_of_yojson (tree : t) path =
  ((match tree with
    | `String "SIGN_UP" -> SIGN_UP
    | `String "PASSWORD_CHANGE" -> PASSWORD_CHANGE
    | `String "SIGN_IN" -> SIGN_IN
    | `String value -> raise (deserialize_unknown_enum_value_error path "EventFilterType" value)
    | _ -> raise (deserialize_wrong_type_error path "EventFilterType")
     : event_filter_type)
    : event_filter_type)

let event_filters_type_of_yojson tree path = list_of_yojson event_filter_type_of_yojson tree path

let compromised_credentials_event_action_type_of_yojson (tree : t) path =
  ((match tree with
    | `String "NO_ACTION" -> NO_ACTION
    | `String "BLOCK" -> BLOCK
    | `String value ->
        raise
          (deserialize_unknown_enum_value_error path "CompromisedCredentialsEventActionType" value)
    | _ -> raise (deserialize_wrong_type_error path "CompromisedCredentialsEventActionType")
     : compromised_credentials_event_action_type)
    : compromised_credentials_event_action_type)

let compromised_credentials_actions_type_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     event_action =
       value_for_key compromised_credentials_event_action_type_of_yojson "EventAction" _list path;
   }
    : compromised_credentials_actions_type)

let compromised_credentials_risk_configuration_type_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     actions = value_for_key compromised_credentials_actions_type_of_yojson "Actions" _list path;
     event_filter =
       option_of_yojson (value_for_key event_filters_type_of_yojson "EventFilter") _list path;
   }
    : compromised_credentials_risk_configuration_type)

let email_notification_subject_type_of_yojson = string_of_yojson
let email_notification_body_type_of_yojson = string_of_yojson

let notify_email_type_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     text_body =
       option_of_yojson (value_for_key email_notification_body_type_of_yojson "TextBody") _list path;
     html_body =
       option_of_yojson (value_for_key email_notification_body_type_of_yojson "HtmlBody") _list path;
     subject = value_for_key email_notification_subject_type_of_yojson "Subject" _list path;
   }
    : notify_email_type)

let notify_configuration_type_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     mfa_email = option_of_yojson (value_for_key notify_email_type_of_yojson "MfaEmail") _list path;
     no_action_email =
       option_of_yojson (value_for_key notify_email_type_of_yojson "NoActionEmail") _list path;
     block_email =
       option_of_yojson (value_for_key notify_email_type_of_yojson "BlockEmail") _list path;
     source_arn = value_for_key arn_type_of_yojson "SourceArn" _list path;
     reply_to = option_of_yojson (value_for_key string_type_of_yojson "ReplyTo") _list path;
     from_ = option_of_yojson (value_for_key string_type_of_yojson "From") _list path;
   }
    : notify_configuration_type)

let account_takeover_action_notify_type_of_yojson = bool_of_yojson

let account_takeover_event_action_type_of_yojson (tree : t) path =
  ((match tree with
    | `String "NO_ACTION" -> NO_ACTION
    | `String "MFA_REQUIRED" -> MFA_REQUIRED
    | `String "MFA_IF_CONFIGURED" -> MFA_IF_CONFIGURED
    | `String "BLOCK" -> BLOCK
    | `String value ->
        raise (deserialize_unknown_enum_value_error path "AccountTakeoverEventActionType" value)
    | _ -> raise (deserialize_wrong_type_error path "AccountTakeoverEventActionType")
     : account_takeover_event_action_type)
    : account_takeover_event_action_type)

let account_takeover_action_type_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     event_action =
       value_for_key account_takeover_event_action_type_of_yojson "EventAction" _list path;
     notify = value_for_key account_takeover_action_notify_type_of_yojson "Notify" _list path;
   }
    : account_takeover_action_type)

let account_takeover_actions_type_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     high_action =
       option_of_yojson
         (value_for_key account_takeover_action_type_of_yojson "HighAction")
         _list path;
     medium_action =
       option_of_yojson
         (value_for_key account_takeover_action_type_of_yojson "MediumAction")
         _list path;
     low_action =
       option_of_yojson
         (value_for_key account_takeover_action_type_of_yojson "LowAction")
         _list path;
   }
    : account_takeover_actions_type)

let account_takeover_risk_configuration_type_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     actions = value_for_key account_takeover_actions_type_of_yojson "Actions" _list path;
     notify_configuration =
       option_of_yojson
         (value_for_key notify_configuration_type_of_yojson "NotifyConfiguration")
         _list path;
   }
    : account_takeover_risk_configuration_type)

let blocked_ip_range_list_type_of_yojson tree path = list_of_yojson string_type_of_yojson tree path

let risk_exception_configuration_type_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     skipped_ip_range_list =
       option_of_yojson
         (value_for_key skipped_ip_range_list_type_of_yojson "SkippedIPRangeList")
         _list path;
     blocked_ip_range_list =
       option_of_yojson
         (value_for_key blocked_ip_range_list_type_of_yojson "BlockedIPRangeList")
         _list path;
   }
    : risk_exception_configuration_type)

let risk_configuration_type_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     last_modified_date =
       option_of_yojson (value_for_key date_type_of_yojson "LastModifiedDate") _list path;
     risk_exception_configuration =
       option_of_yojson
         (value_for_key risk_exception_configuration_type_of_yojson "RiskExceptionConfiguration")
         _list path;
     account_takeover_risk_configuration =
       option_of_yojson
         (value_for_key account_takeover_risk_configuration_type_of_yojson
            "AccountTakeoverRiskConfiguration")
         _list path;
     compromised_credentials_risk_configuration =
       option_of_yojson
         (value_for_key compromised_credentials_risk_configuration_type_of_yojson
            "CompromisedCredentialsRiskConfiguration")
         _list path;
     client_id = option_of_yojson (value_for_key client_id_type_of_yojson "ClientId") _list path;
     user_pool_id =
       option_of_yojson (value_for_key user_pool_id_type_of_yojson "UserPoolId") _list path;
   }
    : risk_configuration_type)

let set_risk_configuration_response_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     risk_configuration =
       value_for_key risk_configuration_type_of_yojson "RiskConfiguration" _list path;
   }
    : set_risk_configuration_response)

let set_risk_configuration_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     risk_exception_configuration =
       option_of_yojson
         (value_for_key risk_exception_configuration_type_of_yojson "RiskExceptionConfiguration")
         _list path;
     account_takeover_risk_configuration =
       option_of_yojson
         (value_for_key account_takeover_risk_configuration_type_of_yojson
            "AccountTakeoverRiskConfiguration")
         _list path;
     compromised_credentials_risk_configuration =
       option_of_yojson
         (value_for_key compromised_credentials_risk_configuration_type_of_yojson
            "CompromisedCredentialsRiskConfiguration")
         _list path;
     client_id = option_of_yojson (value_for_key client_id_type_of_yojson "ClientId") _list path;
     user_pool_id = value_for_key user_pool_id_type_of_yojson "UserPoolId" _list path;
   }
    : set_risk_configuration_request)

let log_level_of_yojson (tree : t) path =
  ((match tree with
    | `String "INFO" -> INFO
    | `String "ERROR" -> ERROR
    | `String value -> raise (deserialize_unknown_enum_value_error path "LogLevel" value)
    | _ -> raise (deserialize_wrong_type_error path "LogLevel")
     : log_level)
    : log_level)

let event_source_name_of_yojson (tree : t) path =
  ((match tree with
    | `String "userAuthEvents" -> USER_AUTH_EVENTS
    | `String "userNotification" -> USER_NOTIFICATION
    | `String value -> raise (deserialize_unknown_enum_value_error path "EventSourceName" value)
    | _ -> raise (deserialize_wrong_type_error path "EventSourceName")
     : event_source_name)
    : event_source_name)

let cloud_watch_logs_configuration_type_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({ log_group_arn = option_of_yojson (value_for_key arn_type_of_yojson "LogGroupArn") _list path }
    : cloud_watch_logs_configuration_type)

let s3_arn_type_of_yojson = string_of_yojson

let s3_configuration_type_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({ bucket_arn = option_of_yojson (value_for_key s3_arn_type_of_yojson "BucketArn") _list path }
    : s3_configuration_type)

let firehose_configuration_type_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({ stream_arn = option_of_yojson (value_for_key arn_type_of_yojson "StreamArn") _list path }
    : firehose_configuration_type)

let log_configuration_type_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     firehose_configuration =
       option_of_yojson
         (value_for_key firehose_configuration_type_of_yojson "FirehoseConfiguration")
         _list path;
     s3_configuration =
       option_of_yojson (value_for_key s3_configuration_type_of_yojson "S3Configuration") _list path;
     cloud_watch_logs_configuration =
       option_of_yojson
         (value_for_key cloud_watch_logs_configuration_type_of_yojson "CloudWatchLogsConfiguration")
         _list path;
     event_source = value_for_key event_source_name_of_yojson "EventSource" _list path;
     log_level = value_for_key log_level_of_yojson "LogLevel" _list path;
   }
    : log_configuration_type)

let log_configuration_list_type_of_yojson tree path =
  list_of_yojson log_configuration_type_of_yojson tree path

let log_delivery_configuration_type_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     log_configurations =
       value_for_key log_configuration_list_type_of_yojson "LogConfigurations" _list path;
     user_pool_id = value_for_key user_pool_id_type_of_yojson "UserPoolId" _list path;
   }
    : log_delivery_configuration_type)

let set_log_delivery_configuration_response_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     log_delivery_configuration =
       option_of_yojson
         (value_for_key log_delivery_configuration_type_of_yojson "LogDeliveryConfiguration")
         _list path;
   }
    : set_log_delivery_configuration_response)

let set_log_delivery_configuration_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     log_configurations =
       value_for_key log_configuration_list_type_of_yojson "LogConfigurations" _list path;
     user_pool_id = value_for_key user_pool_id_type_of_yojson "UserPoolId" _list path;
   }
    : set_log_delivery_configuration_request)

let secret_code_type_of_yojson = string_of_yojson

let searched_attribute_names_list_type_of_yojson tree path =
  list_of_yojson attribute_name_type_of_yojson tree path

let search_pagination_token_type_of_yojson = string_of_yojson
let s3_bucket_type_of_yojson = string_of_yojson

let risk_level_type_of_yojson (tree : t) path =
  ((match tree with
    | `String "High" -> High
    | `String "Medium" -> Medium
    | `String "Low" -> Low
    | `String value -> raise (deserialize_unknown_enum_value_error path "RiskLevelType" value)
    | _ -> raise (deserialize_wrong_type_error path "RiskLevelType")
     : risk_level_type)
    : risk_level_type)

let risk_decision_type_of_yojson (tree : t) path =
  ((match tree with
    | `String "Block" -> Block
    | `String "AccountTakeover" -> AccountTakeover
    | `String "NoRisk" -> NoRisk
    | `String value -> raise (deserialize_unknown_enum_value_error path "RiskDecisionType" value)
    | _ -> raise (deserialize_wrong_type_error path "RiskDecisionType")
     : risk_decision_type)
    : risk_decision_type)

let revoke_token_response_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  (() : unit)

let revoke_token_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     client_secret =
       option_of_yojson (value_for_key client_secret_type_of_yojson "ClientSecret") _list path;
     client_id = value_for_key client_id_type_of_yojson "ClientId" _list path;
     token = value_for_key token_model_type_of_yojson "Token" _list path;
   }
    : revoke_token_request)

let challenge_name_type_of_yojson (tree : t) path =
  ((match tree with
    | `String "PASSWORD_SRP" -> PASSWORD_SRP
    | `String "WEB_AUTHN" -> WEB_AUTHN
    | `String "PASSWORD" -> PASSWORD
    | `String "SMS_OTP" -> SMS_OTP
    | `String "NEW_PASSWORD_REQUIRED" -> NEW_PASSWORD_REQUIRED
    | `String "ADMIN_NO_SRP_AUTH" -> ADMIN_NO_SRP_AUTH
    | `String "DEVICE_PASSWORD_VERIFIER" -> DEVICE_PASSWORD_VERIFIER
    | `String "DEVICE_SRP_AUTH" -> DEVICE_SRP_AUTH
    | `String "SELECT_CHALLENGE" -> SELECT_CHALLENGE
    | `String "CUSTOM_CHALLENGE" -> CUSTOM_CHALLENGE
    | `String "PASSWORD_VERIFIER" -> PASSWORD_VERIFIER
    | `String "MFA_SETUP" -> MFA_SETUP
    | `String "SELECT_MFA_TYPE" -> SELECT_MFA_TYPE
    | `String "SOFTWARE_TOKEN_MFA" -> SOFTWARE_TOKEN_MFA
    | `String "EMAIL_OTP" -> EMAIL_OTP
    | `String "SMS_MFA" -> SMS_MFA
    | `String value -> raise (deserialize_unknown_enum_value_error path "ChallengeNameType" value)
    | _ -> raise (deserialize_wrong_type_error path "ChallengeNameType")
     : challenge_name_type)
    : challenge_name_type)

let challenge_parameters_type_of_yojson tree path =
  map_of_yojson string_type_of_yojson string_type_of_yojson tree path

let new_device_metadata_type_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     device_group_key =
       option_of_yojson (value_for_key string_type_of_yojson "DeviceGroupKey") _list path;
     device_key = option_of_yojson (value_for_key device_key_type_of_yojson "DeviceKey") _list path;
   }
    : new_device_metadata_type)

let authentication_result_type_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     new_device_metadata =
       option_of_yojson
         (value_for_key new_device_metadata_type_of_yojson "NewDeviceMetadata")
         _list path;
     id_token = option_of_yojson (value_for_key token_model_type_of_yojson "IdToken") _list path;
     refresh_token =
       option_of_yojson (value_for_key token_model_type_of_yojson "RefreshToken") _list path;
     token_type = option_of_yojson (value_for_key string_type_of_yojson "TokenType") _list path;
     expires_in = option_of_yojson (value_for_key integer_type_of_yojson "ExpiresIn") _list path;
     access_token =
       option_of_yojson (value_for_key token_model_type_of_yojson "AccessToken") _list path;
   }
    : authentication_result_type)

let respond_to_auth_challenge_response_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     authentication_result =
       option_of_yojson
         (value_for_key authentication_result_type_of_yojson "AuthenticationResult")
         _list path;
     challenge_parameters =
       option_of_yojson
         (value_for_key challenge_parameters_type_of_yojson "ChallengeParameters")
         _list path;
     session = option_of_yojson (value_for_key session_type_of_yojson "Session") _list path;
     challenge_name =
       option_of_yojson (value_for_key challenge_name_type_of_yojson "ChallengeName") _list path;
   }
    : respond_to_auth_challenge_response)

let challenge_responses_type_of_yojson tree path =
  map_of_yojson string_type_of_yojson string_type_of_yojson tree path

let respond_to_auth_challenge_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     client_metadata =
       option_of_yojson (value_for_key client_metadata_type_of_yojson "ClientMetadata") _list path;
     user_context_data =
       option_of_yojson
         (value_for_key user_context_data_type_of_yojson "UserContextData")
         _list path;
     analytics_metadata =
       option_of_yojson
         (value_for_key analytics_metadata_type_of_yojson "AnalyticsMetadata")
         _list path;
     challenge_responses =
       option_of_yojson
         (value_for_key challenge_responses_type_of_yojson "ChallengeResponses")
         _list path;
     session = option_of_yojson (value_for_key session_type_of_yojson "Session") _list path;
     challenge_name = value_for_key challenge_name_type_of_yojson "ChallengeName" _list path;
     client_id = value_for_key client_id_type_of_yojson "ClientId" _list path;
   }
    : respond_to_auth_challenge_request)

let password_history_policy_violation_exception_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({ message = option_of_yojson (value_for_key message_type_of_yojson "message") _list path }
    : password_history_policy_violation_exception)

let mfa_method_not_found_exception_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({ message = option_of_yojson (value_for_key message_type_of_yojson "message") _list path }
    : mfa_method_not_found_exception)

let resource_servers_list_type_of_yojson tree path =
  list_of_yojson resource_server_type_of_yojson tree path

let resend_confirmation_code_response_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     code_delivery_details =
       option_of_yojson
         (value_for_key code_delivery_details_type_of_yojson "CodeDeliveryDetails")
         _list path;
   }
    : resend_confirmation_code_response)

let resend_confirmation_code_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     client_metadata =
       option_of_yojson (value_for_key client_metadata_type_of_yojson "ClientMetadata") _list path;
     analytics_metadata =
       option_of_yojson
         (value_for_key analytics_metadata_type_of_yojson "AnalyticsMetadata")
         _list path;
     username = value_for_key username_type_of_yojson "Username" _list path;
     user_context_data =
       option_of_yojson
         (value_for_key user_context_data_type_of_yojson "UserContextData")
         _list path;
     secret_hash =
       option_of_yojson (value_for_key secret_hash_type_of_yojson "SecretHash") _list path;
     client_id = value_for_key client_id_type_of_yojson "ClientId" _list path;
   }
    : resend_confirmation_code_request)

let refresh_token_reuse_exception_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({ message = option_of_yojson (value_for_key message_type_of_yojson "message") _list path }
    : refresh_token_reuse_exception)

let query_limit_type_of_yojson = int_of_yojson
let query_limit_of_yojson = int_of_yojson

let provider_description_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     creation_date = option_of_yojson (value_for_key date_type_of_yojson "CreationDate") _list path;
     last_modified_date =
       option_of_yojson (value_for_key date_type_of_yojson "LastModifiedDate") _list path;
     provider_type =
       option_of_yojson
         (value_for_key identity_provider_type_type_of_yojson "ProviderType")
         _list path;
     provider_name =
       option_of_yojson (value_for_key provider_name_type_of_yojson "ProviderName") _list path;
   }
    : provider_description)

let providers_list_type_of_yojson tree path =
  list_of_yojson provider_description_of_yojson tree path

let provider_user_identifier_type_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     provider_attribute_value =
       option_of_yojson (value_for_key string_type_of_yojson "ProviderAttributeValue") _list path;
     provider_attribute_name =
       option_of_yojson (value_for_key string_type_of_yojson "ProviderAttributeName") _list path;
     provider_name =
       option_of_yojson (value_for_key provider_name_type_of_yojson "ProviderName") _list path;
   }
    : provider_user_identifier_type)

let provider_name_type_v2_of_yojson = string_of_yojson
let pool_query_limit_type_of_yojson = int_of_yojson
let pagination_key_type_of_yojson = string_of_yojson
let pagination_key_of_yojson = string_of_yojson

let message_action_type_of_yojson (tree : t) path =
  ((match tree with
    | `String "SUPPRESS" -> SUPPRESS
    | `String "RESEND" -> RESEND
    | `String value -> raise (deserialize_unknown_enum_value_error path "MessageActionType" value)
    | _ -> raise (deserialize_wrong_type_error path "MessageActionType")
     : message_action_type)
    : message_action_type)

let managed_login_branding_exists_exception_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({ message = option_of_yojson (value_for_key message_type_of_yojson "message") _list path }
    : managed_login_branding_exists_exception)

let list_web_authn_credentials_response_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     next_token = option_of_yojson (value_for_key pagination_key_of_yojson "NextToken") _list path;
     credentials =
       value_for_key web_authn_credential_description_list_type_of_yojson "Credentials" _list path;
   }
    : list_web_authn_credentials_response)

let list_web_authn_credentials_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     max_results =
       option_of_yojson
         (value_for_key web_authn_credentials_query_limit_type_of_yojson "MaxResults")
         _list path;
     next_token = option_of_yojson (value_for_key pagination_key_of_yojson "NextToken") _list path;
     access_token = value_for_key token_model_type_of_yojson "AccessToken" _list path;
   }
    : list_web_authn_credentials_request)

let list_users_response_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     pagination_token =
       option_of_yojson
         (value_for_key search_pagination_token_type_of_yojson "PaginationToken")
         _list path;
     users = option_of_yojson (value_for_key users_list_type_of_yojson "Users") _list path;
   }
    : list_users_response)

let list_users_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     filter = option_of_yojson (value_for_key user_filter_type_of_yojson "Filter") _list path;
     pagination_token =
       option_of_yojson
         (value_for_key search_pagination_token_type_of_yojson "PaginationToken")
         _list path;
     limit = option_of_yojson (value_for_key query_limit_type_of_yojson "Limit") _list path;
     attributes_to_get =
       option_of_yojson
         (value_for_key searched_attribute_names_list_type_of_yojson "AttributesToGet")
         _list path;
     user_pool_id = value_for_key user_pool_id_type_of_yojson "UserPoolId" _list path;
   }
    : list_users_request)

let list_users_in_group_response_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     next_token = option_of_yojson (value_for_key pagination_key_of_yojson "NextToken") _list path;
     users = option_of_yojson (value_for_key users_list_type_of_yojson "Users") _list path;
   }
    : list_users_in_group_response)

let list_users_in_group_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     next_token = option_of_yojson (value_for_key pagination_key_of_yojson "NextToken") _list path;
     limit = option_of_yojson (value_for_key query_limit_type_of_yojson "Limit") _list path;
     group_name = value_for_key group_name_type_of_yojson "GroupName" _list path;
     user_pool_id = value_for_key user_pool_id_type_of_yojson "UserPoolId" _list path;
   }
    : list_users_in_group_request)

let list_user_pools_response_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     next_token =
       option_of_yojson (value_for_key pagination_key_type_of_yojson "NextToken") _list path;
     user_pools =
       option_of_yojson (value_for_key user_pool_list_type_of_yojson "UserPools") _list path;
   }
    : list_user_pools_response)

let list_user_pools_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     max_results = value_for_key pool_query_limit_type_of_yojson "MaxResults" _list path;
     next_token =
       option_of_yojson (value_for_key pagination_key_type_of_yojson "NextToken") _list path;
   }
    : list_user_pools_request)

let list_user_pool_replicas_response_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     next_token =
       option_of_yojson (value_for_key pagination_key_type_of_yojson "NextToken") _list path;
     user_pool_replicas =
       option_of_yojson
         (value_for_key user_pool_replica_list_type_of_yojson "UserPoolReplicas")
         _list path;
   }
    : list_user_pool_replicas_response)

let list_user_pool_replicas_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     next_token =
       option_of_yojson (value_for_key pagination_key_type_of_yojson "NextToken") _list path;
     user_pool_id = value_for_key user_pool_id_type_of_yojson "UserPoolId" _list path;
   }
    : list_user_pool_replicas_request)

let list_user_pool_clients_response_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     next_token = option_of_yojson (value_for_key pagination_key_of_yojson "NextToken") _list path;
     user_pool_clients =
       option_of_yojson
         (value_for_key user_pool_client_list_type_of_yojson "UserPoolClients")
         _list path;
   }
    : list_user_pool_clients_response)

let list_user_pool_clients_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     next_token = option_of_yojson (value_for_key pagination_key_of_yojson "NextToken") _list path;
     max_results = option_of_yojson (value_for_key query_limit_of_yojson "MaxResults") _list path;
     user_pool_id = value_for_key user_pool_id_type_of_yojson "UserPoolId" _list path;
   }
    : list_user_pool_clients_request)

let client_secret_id_type_of_yojson = string_of_yojson

let client_secret_descriptor_type_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     client_secret_create_date =
       option_of_yojson (value_for_key date_type_of_yojson "ClientSecretCreateDate") _list path;
     client_secret_value =
       option_of_yojson (value_for_key client_secret_type_of_yojson "ClientSecretValue") _list path;
     client_secret_id =
       option_of_yojson (value_for_key client_secret_id_type_of_yojson "ClientSecretId") _list path;
   }
    : client_secret_descriptor_type)

let client_secret_descriptor_list_type_of_yojson tree path =
  list_of_yojson client_secret_descriptor_type_of_yojson tree path

let list_user_pool_client_secrets_response_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     next_token = option_of_yojson (value_for_key pagination_key_of_yojson "NextToken") _list path;
     client_secrets =
       option_of_yojson
         (value_for_key client_secret_descriptor_list_type_of_yojson "ClientSecrets")
         _list path;
   }
    : list_user_pool_client_secrets_response)

let list_user_pool_client_secrets_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     next_token = option_of_yojson (value_for_key pagination_key_of_yojson "NextToken") _list path;
     client_id = value_for_key client_id_type_of_yojson "ClientId" _list path;
     user_pool_id = value_for_key user_pool_id_type_of_yojson "UserPoolId" _list path;
   }
    : list_user_pool_client_secrets_request)

let internal_server_exception_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({ message = option_of_yojson (value_for_key message_type_of_yojson "message") _list path }
    : internal_server_exception)

let list_user_import_jobs_response_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     pagination_token =
       option_of_yojson (value_for_key pagination_key_type_of_yojson "PaginationToken") _list path;
     user_import_jobs =
       option_of_yojson
         (value_for_key user_import_jobs_list_type_of_yojson "UserImportJobs")
         _list path;
   }
    : list_user_import_jobs_response)

let list_user_import_jobs_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     pagination_token =
       option_of_yojson (value_for_key pagination_key_type_of_yojson "PaginationToken") _list path;
     max_results = value_for_key pool_query_limit_type_of_yojson "MaxResults" _list path;
     user_pool_id = value_for_key user_pool_id_type_of_yojson "UserPoolId" _list path;
   }
    : list_user_import_jobs_request)

let list_terms_response_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     next_token = option_of_yojson (value_for_key string_type_of_yojson "NextToken") _list path;
     terms = value_for_key terms_description_list_type_of_yojson "Terms" _list path;
   }
    : list_terms_response)

let list_terms_request_max_results_integer_of_yojson = int_of_yojson

let list_terms_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     next_token = option_of_yojson (value_for_key string_type_of_yojson "NextToken") _list path;
     max_results =
       option_of_yojson
         (value_for_key list_terms_request_max_results_integer_of_yojson "MaxResults")
         _list path;
     user_pool_id = value_for_key user_pool_id_type_of_yojson "UserPoolId" _list path;
   }
    : list_terms_request)

let list_tags_for_resource_response_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({ tags = option_of_yojson (value_for_key user_pool_tags_type_of_yojson "Tags") _list path }
    : list_tags_for_resource_response)

let list_tags_for_resource_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({ resource_arn = value_for_key arn_type_of_yojson "ResourceArn" _list path }
    : list_tags_for_resource_request)

let list_resource_servers_response_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     next_token =
       option_of_yojson (value_for_key pagination_key_type_of_yojson "NextToken") _list path;
     resource_servers =
       value_for_key resource_servers_list_type_of_yojson "ResourceServers" _list path;
   }
    : list_resource_servers_response)

let list_resource_servers_limit_type_of_yojson = int_of_yojson

let list_resource_servers_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     next_token =
       option_of_yojson (value_for_key pagination_key_type_of_yojson "NextToken") _list path;
     max_results =
       option_of_yojson
         (value_for_key list_resource_servers_limit_type_of_yojson "MaxResults")
         _list path;
     user_pool_id = value_for_key user_pool_id_type_of_yojson "UserPoolId" _list path;
   }
    : list_resource_servers_request)

let list_providers_limit_type_of_yojson = int_of_yojson
let list_of_string_types_of_yojson tree path = list_of_yojson string_type_of_yojson tree path

let list_identity_providers_response_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     next_token =
       option_of_yojson (value_for_key pagination_key_type_of_yojson "NextToken") _list path;
     providers = value_for_key providers_list_type_of_yojson "Providers" _list path;
   }
    : list_identity_providers_response)

let list_identity_providers_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     next_token =
       option_of_yojson (value_for_key pagination_key_type_of_yojson "NextToken") _list path;
     max_results =
       option_of_yojson (value_for_key list_providers_limit_type_of_yojson "MaxResults") _list path;
     user_pool_id = value_for_key user_pool_id_type_of_yojson "UserPoolId" _list path;
   }
    : list_identity_providers_request)

let group_list_type_of_yojson tree path = list_of_yojson group_type_of_yojson tree path

let list_groups_response_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     next_token = option_of_yojson (value_for_key pagination_key_of_yojson "NextToken") _list path;
     groups = option_of_yojson (value_for_key group_list_type_of_yojson "Groups") _list path;
   }
    : list_groups_response)

let list_groups_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     next_token = option_of_yojson (value_for_key pagination_key_of_yojson "NextToken") _list path;
     limit = option_of_yojson (value_for_key query_limit_type_of_yojson "Limit") _list path;
     user_pool_id = value_for_key user_pool_id_type_of_yojson "UserPoolId" _list path;
   }
    : list_groups_request)

let device_type_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     device_last_authenticated_date =
       option_of_yojson (value_for_key date_type_of_yojson "DeviceLastAuthenticatedDate") _list path;
     device_last_modified_date =
       option_of_yojson (value_for_key date_type_of_yojson "DeviceLastModifiedDate") _list path;
     device_create_date =
       option_of_yojson (value_for_key date_type_of_yojson "DeviceCreateDate") _list path;
     device_attributes =
       option_of_yojson (value_for_key attribute_list_type_of_yojson "DeviceAttributes") _list path;
     device_key = option_of_yojson (value_for_key device_key_type_of_yojson "DeviceKey") _list path;
   }
    : device_type)

let device_list_type_of_yojson tree path = list_of_yojson device_type_of_yojson tree path

let list_devices_response_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     pagination_token =
       option_of_yojson
         (value_for_key search_pagination_token_type_of_yojson "PaginationToken")
         _list path;
     devices = option_of_yojson (value_for_key device_list_type_of_yojson "Devices") _list path;
   }
    : list_devices_response)

let list_devices_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     pagination_token =
       option_of_yojson
         (value_for_key search_pagination_token_type_of_yojson "PaginationToken")
         _list path;
     limit = option_of_yojson (value_for_key query_limit_type_of_yojson "Limit") _list path;
     access_token = value_for_key token_model_type_of_yojson "AccessToken" _list path;
   }
    : list_devices_request)

let available_challenge_list_type_of_yojson tree path =
  list_of_yojson challenge_name_type_of_yojson tree path

let initiate_auth_response_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     available_challenges =
       option_of_yojson
         (value_for_key available_challenge_list_type_of_yojson "AvailableChallenges")
         _list path;
     authentication_result =
       option_of_yojson
         (value_for_key authentication_result_type_of_yojson "AuthenticationResult")
         _list path;
     challenge_parameters =
       option_of_yojson
         (value_for_key challenge_parameters_type_of_yojson "ChallengeParameters")
         _list path;
     session = option_of_yojson (value_for_key session_type_of_yojson "Session") _list path;
     challenge_name =
       option_of_yojson (value_for_key challenge_name_type_of_yojson "ChallengeName") _list path;
   }
    : initiate_auth_response)

let auth_flow_type_of_yojson (tree : t) path =
  ((match tree with
    | `String "USER_AUTH" -> USER_AUTH
    | `String "ADMIN_USER_PASSWORD_AUTH" -> ADMIN_USER_PASSWORD_AUTH
    | `String "USER_PASSWORD_AUTH" -> USER_PASSWORD_AUTH
    | `String "ADMIN_NO_SRP_AUTH" -> ADMIN_NO_SRP_AUTH
    | `String "CUSTOM_AUTH" -> CUSTOM_AUTH
    | `String "REFRESH_TOKEN" -> REFRESH_TOKEN
    | `String "REFRESH_TOKEN_AUTH" -> REFRESH_TOKEN_AUTH
    | `String "USER_SRP_AUTH" -> USER_SRP_AUTH
    | `String value -> raise (deserialize_unknown_enum_value_error path "AuthFlowType" value)
    | _ -> raise (deserialize_wrong_type_error path "AuthFlowType")
     : auth_flow_type)
    : auth_flow_type)

let auth_parameters_type_of_yojson tree path =
  map_of_yojson string_type_of_yojson string_type_of_yojson tree path

let initiate_auth_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     session = option_of_yojson (value_for_key session_type_of_yojson "Session") _list path;
     user_context_data =
       option_of_yojson
         (value_for_key user_context_data_type_of_yojson "UserContextData")
         _list path;
     analytics_metadata =
       option_of_yojson
         (value_for_key analytics_metadata_type_of_yojson "AnalyticsMetadata")
         _list path;
     client_id = value_for_key client_id_type_of_yojson "ClientId" _list path;
     client_metadata =
       option_of_yojson (value_for_key client_metadata_type_of_yojson "ClientMetadata") _list path;
     auth_parameters =
       option_of_yojson (value_for_key auth_parameters_type_of_yojson "AuthParameters") _list path;
     auth_flow = value_for_key auth_flow_type_of_yojson "AuthFlow" _list path;
   }
    : initiate_auth_request)

let http_header_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     header_value = option_of_yojson (value_for_key string_type_of_yojson "headerValue") _list path;
     header_name = option_of_yojson (value_for_key string_type_of_yojson "headerName") _list path;
   }
    : http_header)

let http_header_list_of_yojson tree path = list_of_yojson http_header_of_yojson tree path

let group_exists_exception_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({ message = option_of_yojson (value_for_key message_type_of_yojson "message") _list path }
    : group_exists_exception)

let global_sign_out_response_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  (() : unit)

let global_sign_out_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({ access_token = value_for_key token_model_type_of_yojson "AccessToken" _list path }
    : global_sign_out_request)

let get_user_response_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     user_mfa_setting_list =
       option_of_yojson
         (value_for_key user_mfa_setting_list_type_of_yojson "UserMFASettingList")
         _list path;
     preferred_mfa_setting =
       option_of_yojson (value_for_key string_type_of_yojson "PreferredMfaSetting") _list path;
     mfa_options =
       option_of_yojson (value_for_key mfa_option_list_type_of_yojson "MFAOptions") _list path;
     user_attributes = value_for_key attribute_list_type_of_yojson "UserAttributes" _list path;
     username = value_for_key username_type_of_yojson "Username" _list path;
   }
    : get_user_response)

let get_user_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({ access_token = value_for_key token_model_type_of_yojson "AccessToken" _list path }
    : get_user_request)

let get_user_pool_mfa_config_response_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     web_authn_configuration =
       option_of_yojson
         (value_for_key web_authn_configuration_type_of_yojson "WebAuthnConfiguration")
         _list path;
     mfa_configuration =
       option_of_yojson (value_for_key user_pool_mfa_type_of_yojson "MfaConfiguration") _list path;
     email_mfa_configuration =
       option_of_yojson
         (value_for_key email_mfa_config_type_of_yojson "EmailMfaConfiguration")
         _list path;
     software_token_mfa_configuration =
       option_of_yojson
         (value_for_key software_token_mfa_config_type_of_yojson "SoftwareTokenMfaConfiguration")
         _list path;
     sms_mfa_configuration =
       option_of_yojson
         (value_for_key sms_mfa_config_type_of_yojson "SmsMfaConfiguration")
         _list path;
   }
    : get_user_pool_mfa_config_response)

let get_user_pool_mfa_config_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({ user_pool_id = value_for_key user_pool_id_type_of_yojson "UserPoolId" _list path }
    : get_user_pool_mfa_config_request)

let configured_user_auth_factors_list_type_of_yojson tree path =
  list_of_yojson auth_factor_type_of_yojson tree path

let get_user_auth_factors_response_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     configured_user_auth_factors =
       option_of_yojson
         (value_for_key configured_user_auth_factors_list_type_of_yojson "ConfiguredUserAuthFactors")
         _list path;
     user_mfa_setting_list =
       option_of_yojson
         (value_for_key user_mfa_setting_list_type_of_yojson "UserMFASettingList")
         _list path;
     preferred_mfa_setting =
       option_of_yojson (value_for_key string_type_of_yojson "PreferredMfaSetting") _list path;
     username = value_for_key username_type_of_yojson "Username" _list path;
   }
    : get_user_auth_factors_response)

let get_user_auth_factors_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({ access_token = value_for_key token_model_type_of_yojson "AccessToken" _list path }
    : get_user_auth_factors_request)

let get_user_attribute_verification_code_response_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     code_delivery_details =
       option_of_yojson
         (value_for_key code_delivery_details_type_of_yojson "CodeDeliveryDetails")
         _list path;
   }
    : get_user_attribute_verification_code_response)

let get_user_attribute_verification_code_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     client_metadata =
       option_of_yojson (value_for_key client_metadata_type_of_yojson "ClientMetadata") _list path;
     attribute_name = value_for_key attribute_name_type_of_yojson "AttributeName" _list path;
     access_token = value_for_key token_model_type_of_yojson "AccessToken" _list path;
   }
    : get_user_attribute_verification_code_request)

let get_ui_customization_response_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({ ui_customization = value_for_key ui_customization_type_of_yojson "UICustomization" _list path }
    : get_ui_customization_response)

let get_ui_customization_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     client_id = option_of_yojson (value_for_key client_id_type_of_yojson "ClientId") _list path;
     user_pool_id = value_for_key user_pool_id_type_of_yojson "UserPoolId" _list path;
   }
    : get_ui_customization_request)

let get_tokens_from_refresh_token_response_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     authentication_result =
       option_of_yojson
         (value_for_key authentication_result_type_of_yojson "AuthenticationResult")
         _list path;
   }
    : get_tokens_from_refresh_token_response)

let get_tokens_from_refresh_token_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     client_metadata =
       option_of_yojson (value_for_key client_metadata_type_of_yojson "ClientMetadata") _list path;
     device_key = option_of_yojson (value_for_key device_key_type_of_yojson "DeviceKey") _list path;
     client_secret =
       option_of_yojson (value_for_key client_secret_type_of_yojson "ClientSecret") _list path;
     client_id = value_for_key client_id_type_of_yojson "ClientId" _list path;
     refresh_token = value_for_key token_model_type_of_yojson "RefreshToken" _list path;
   }
    : get_tokens_from_refresh_token_request)

let get_signing_certificate_response_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({ certificate = option_of_yojson (value_for_key string_type_of_yojson "Certificate") _list path }
    : get_signing_certificate_response)

let get_signing_certificate_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({ user_pool_id = value_for_key user_pool_id_type_of_yojson "UserPoolId" _list path }
    : get_signing_certificate_request)

let get_provisioned_limit_response_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({ limit = value_for_key limit_type_of_yojson "Limit" _list path }
    : get_provisioned_limit_response)

let get_provisioned_limit_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({ limit_definition = value_for_key limit_definition_type_of_yojson "LimitDefinition" _list path }
    : get_provisioned_limit_request)

let get_log_delivery_configuration_response_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     log_delivery_configuration =
       option_of_yojson
         (value_for_key log_delivery_configuration_type_of_yojson "LogDeliveryConfiguration")
         _list path;
   }
    : get_log_delivery_configuration_response)

let get_log_delivery_configuration_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({ user_pool_id = value_for_key user_pool_id_type_of_yojson "UserPoolId" _list path }
    : get_log_delivery_configuration_request)

let get_identity_provider_by_identifier_response_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     identity_provider =
       value_for_key identity_provider_type_of_yojson "IdentityProvider" _list path;
   }
    : get_identity_provider_by_identifier_response)

let get_identity_provider_by_identifier_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     idp_identifier = value_for_key idp_identifier_type_of_yojson "IdpIdentifier" _list path;
     user_pool_id = value_for_key user_pool_id_type_of_yojson "UserPoolId" _list path;
   }
    : get_identity_provider_by_identifier_request)

let get_group_response_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({ group = option_of_yojson (value_for_key group_type_of_yojson "Group") _list path }
    : get_group_response)

let get_group_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     user_pool_id = value_for_key user_pool_id_type_of_yojson "UserPoolId" _list path;
     group_name = value_for_key group_name_type_of_yojson "GroupName" _list path;
   }
    : get_group_request)

let get_device_response_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({ device = value_for_key device_type_of_yojson "Device" _list path } : get_device_response)

let get_device_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     access_token =
       option_of_yojson (value_for_key token_model_type_of_yojson "AccessToken") _list path;
     device_key = value_for_key device_key_type_of_yojson "DeviceKey" _list path;
   }
    : get_device_request)

let get_csv_header_response_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     csv_header =
       option_of_yojson (value_for_key list_of_string_types_of_yojson "CSVHeader") _list path;
     user_pool_id =
       option_of_yojson (value_for_key user_pool_id_type_of_yojson "UserPoolId") _list path;
   }
    : get_csv_header_response)

let get_csv_header_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({ user_pool_id = value_for_key user_pool_id_type_of_yojson "UserPoolId" _list path }
    : get_csv_header_request)

let generate_secret_of_yojson = bool_of_yojson

let forgot_password_response_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     code_delivery_details =
       option_of_yojson
         (value_for_key code_delivery_details_type_of_yojson "CodeDeliveryDetails")
         _list path;
   }
    : forgot_password_response)

let forgot_password_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     client_metadata =
       option_of_yojson (value_for_key client_metadata_type_of_yojson "ClientMetadata") _list path;
     analytics_metadata =
       option_of_yojson
         (value_for_key analytics_metadata_type_of_yojson "AnalyticsMetadata")
         _list path;
     username = value_for_key username_type_of_yojson "Username" _list path;
     user_context_data =
       option_of_yojson
         (value_for_key user_context_data_type_of_yojson "UserContextData")
         _list path;
     secret_hash =
       option_of_yojson (value_for_key secret_hash_type_of_yojson "SecretHash") _list path;
     client_id = value_for_key client_id_type_of_yojson "ClientId" _list path;
   }
    : forgot_password_request)

let forget_device_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     device_key = value_for_key device_key_type_of_yojson "DeviceKey" _list path;
     access_token =
       option_of_yojson (value_for_key token_model_type_of_yojson "AccessToken") _list path;
   }
    : forget_device_request)

let force_alias_creation_of_yojson = bool_of_yojson

let event_type_of_yojson (tree : t) path =
  ((match tree with
    | `String "ResendCode" -> ResendCode
    | `String "PasswordChange" -> PasswordChange
    | `String "ForgotPassword" -> ForgotPassword
    | `String "SignUp" -> SignUp
    | `String "SignIn" -> SignIn
    | `String value -> raise (deserialize_unknown_enum_value_error path "EventType" value)
    | _ -> raise (deserialize_wrong_type_error path "EventType")
     : event_type)
    : event_type)

let event_risk_type_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     compromised_credentials_detected =
       option_of_yojson
         (value_for_key wrapped_boolean_type_of_yojson "CompromisedCredentialsDetected")
         _list path;
     risk_level = option_of_yojson (value_for_key risk_level_type_of_yojson "RiskLevel") _list path;
     risk_decision =
       option_of_yojson (value_for_key risk_decision_type_of_yojson "RiskDecision") _list path;
   }
    : event_risk_type)

let event_response_type_of_yojson (tree : t) path =
  ((match tree with
    | `String "InProgress" -> InProgress
    | `String "Fail" -> Fail
    | `String "Pass" -> Pass
    | `String value -> raise (deserialize_unknown_enum_value_error path "EventResponseType" value)
    | _ -> raise (deserialize_wrong_type_error path "EventResponseType")
     : event_response_type)
    : event_response_type)

let event_feedback_type_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     feedback_date = option_of_yojson (value_for_key date_type_of_yojson "FeedbackDate") _list path;
     provider = value_for_key string_type_of_yojson "Provider" _list path;
     feedback_value = value_for_key feedback_value_type_of_yojson "FeedbackValue" _list path;
   }
    : event_feedback_type)

let event_context_data_type_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     country = option_of_yojson (value_for_key string_type_of_yojson "Country") _list path;
     city = option_of_yojson (value_for_key string_type_of_yojson "City") _list path;
     timezone = option_of_yojson (value_for_key string_type_of_yojson "Timezone") _list path;
     device_name = option_of_yojson (value_for_key string_type_of_yojson "DeviceName") _list path;
     ip_address = option_of_yojson (value_for_key string_type_of_yojson "IpAddress") _list path;
   }
    : event_context_data_type)

let duplicate_provider_exception_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({ message = option_of_yojson (value_for_key message_type_of_yojson "message") _list path }
    : duplicate_provider_exception)

let domain_version_type_of_yojson = string_of_yojson

let domain_status_type_of_yojson (tree : t) path =
  ((match tree with
    | `String "FAILED" -> FAILED
    | `String "ACTIVE" -> ACTIVE
    | `String "UPDATING" -> UPDATING
    | `String "DELETING" -> DELETING
    | `String "CREATING" -> CREATING
    | `String value -> raise (deserialize_unknown_enum_value_error path "DomainStatusType" value)
    | _ -> raise (deserialize_wrong_type_error path "DomainStatusType")
     : domain_status_type)
    : domain_status_type)

let aws_account_id_type_of_yojson = string_of_yojson

let domain_description_type_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     routing = option_of_yojson (value_for_key routing_type_of_yojson "Routing") _list path;
     managed_login_version =
       option_of_yojson
         (value_for_key wrapped_integer_type_of_yojson "ManagedLoginVersion")
         _list path;
     custom_domain_config =
       option_of_yojson
         (value_for_key custom_domain_config_type_of_yojson "CustomDomainConfig")
         _list path;
     status = option_of_yojson (value_for_key domain_status_type_of_yojson "Status") _list path;
     version = option_of_yojson (value_for_key domain_version_type_of_yojson "Version") _list path;
     cloud_front_distribution =
       option_of_yojson (value_for_key string_type_of_yojson "CloudFrontDistribution") _list path;
     s3_bucket = option_of_yojson (value_for_key s3_bucket_type_of_yojson "S3Bucket") _list path;
     domain = option_of_yojson (value_for_key domain_type_of_yojson "Domain") _list path;
     aws_account_id =
       option_of_yojson (value_for_key aws_account_id_type_of_yojson "AWSAccountId") _list path;
     user_pool_id =
       option_of_yojson (value_for_key user_pool_id_type_of_yojson "UserPoolId") _list path;
   }
    : domain_description_type)

let device_secret_verifier_config_type_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     salt = option_of_yojson (value_for_key string_type_of_yojson "Salt") _list path;
     password_verifier =
       option_of_yojson (value_for_key string_type_of_yojson "PasswordVerifier") _list path;
   }
    : device_secret_verifier_config_type)

let device_name_type_of_yojson = string_of_yojson

let device_key_exists_exception_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({ message = option_of_yojson (value_for_key message_type_of_yojson "message") _list path }
    : device_key_exists_exception)

let describe_user_pool_response_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({ user_pool = option_of_yojson (value_for_key user_pool_type_of_yojson "UserPool") _list path }
    : describe_user_pool_response)

let describe_user_pool_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({ user_pool_id = value_for_key user_pool_id_type_of_yojson "UserPoolId" _list path }
    : describe_user_pool_request)

let describe_user_pool_domain_response_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     domain_description =
       option_of_yojson
         (value_for_key domain_description_type_of_yojson "DomainDescription")
         _list path;
   }
    : describe_user_pool_domain_response)

let describe_user_pool_domain_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({ domain = value_for_key domain_type_of_yojson "Domain" _list path }
    : describe_user_pool_domain_request)

let describe_user_pool_client_response_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     user_pool_client =
       option_of_yojson (value_for_key user_pool_client_type_of_yojson "UserPoolClient") _list path;
   }
    : describe_user_pool_client_response)

let describe_user_pool_client_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     client_id = value_for_key client_id_type_of_yojson "ClientId" _list path;
     user_pool_id = value_for_key user_pool_id_type_of_yojson "UserPoolId" _list path;
   }
    : describe_user_pool_client_request)

let describe_user_import_job_response_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     user_import_job =
       option_of_yojson (value_for_key user_import_job_type_of_yojson "UserImportJob") _list path;
   }
    : describe_user_import_job_response)

let describe_user_import_job_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     job_id = value_for_key user_import_job_id_type_of_yojson "JobId" _list path;
     user_pool_id = value_for_key user_pool_id_type_of_yojson "UserPoolId" _list path;
   }
    : describe_user_import_job_request)

let describe_terms_response_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({ terms = option_of_yojson (value_for_key terms_type_of_yojson "Terms") _list path }
    : describe_terms_response)

let describe_terms_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     user_pool_id = value_for_key user_pool_id_type_of_yojson "UserPoolId" _list path;
     terms_id = value_for_key terms_id_type_of_yojson "TermsId" _list path;
   }
    : describe_terms_request)

let describe_risk_configuration_response_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     risk_configuration =
       value_for_key risk_configuration_type_of_yojson "RiskConfiguration" _list path;
   }
    : describe_risk_configuration_response)

let describe_risk_configuration_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     client_id = option_of_yojson (value_for_key client_id_type_of_yojson "ClientId") _list path;
     user_pool_id = value_for_key user_pool_id_type_of_yojson "UserPoolId" _list path;
   }
    : describe_risk_configuration_request)

let describe_resource_server_response_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({ resource_server = value_for_key resource_server_type_of_yojson "ResourceServer" _list path }
    : describe_resource_server_response)

let describe_resource_server_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     identifier = value_for_key resource_server_identifier_type_of_yojson "Identifier" _list path;
     user_pool_id = value_for_key user_pool_id_type_of_yojson "UserPoolId" _list path;
   }
    : describe_resource_server_request)

let describe_managed_login_branding_response_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     managed_login_branding =
       option_of_yojson
         (value_for_key managed_login_branding_type_of_yojson "ManagedLoginBranding")
         _list path;
   }
    : describe_managed_login_branding_response)

let describe_managed_login_branding_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     return_merged_resources =
       option_of_yojson (value_for_key boolean_type_of_yojson "ReturnMergedResources") _list path;
     managed_login_branding_id =
       value_for_key managed_login_branding_id_type_of_yojson "ManagedLoginBrandingId" _list path;
     user_pool_id = value_for_key user_pool_id_type_of_yojson "UserPoolId" _list path;
   }
    : describe_managed_login_branding_request)

let describe_managed_login_branding_by_client_response_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     managed_login_branding =
       option_of_yojson
         (value_for_key managed_login_branding_type_of_yojson "ManagedLoginBranding")
         _list path;
   }
    : describe_managed_login_branding_by_client_response)

let describe_managed_login_branding_by_client_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     return_merged_resources =
       option_of_yojson (value_for_key boolean_type_of_yojson "ReturnMergedResources") _list path;
     client_id = value_for_key client_id_type_of_yojson "ClientId" _list path;
     user_pool_id = value_for_key user_pool_id_type_of_yojson "UserPoolId" _list path;
   }
    : describe_managed_login_branding_by_client_request)

let describe_identity_provider_response_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     identity_provider =
       value_for_key identity_provider_type_of_yojson "IdentityProvider" _list path;
   }
    : describe_identity_provider_response)

let describe_identity_provider_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     provider_name = value_for_key provider_name_type_of_yojson "ProviderName" _list path;
     user_pool_id = value_for_key user_pool_id_type_of_yojson "UserPoolId" _list path;
   }
    : describe_identity_provider_request)

let delivery_medium_list_type_of_yojson tree path =
  list_of_yojson delivery_medium_type_of_yojson tree path

let delete_web_authn_credential_response_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  (() : unit)

let delete_web_authn_credential_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     credential_id = value_for_key string_type_of_yojson "CredentialId" _list path;
     access_token = value_for_key token_model_type_of_yojson "AccessToken" _list path;
   }
    : delete_web_authn_credential_request)

let delete_user_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({ access_token = value_for_key token_model_type_of_yojson "AccessToken" _list path }
    : delete_user_request)

let delete_user_pool_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({ user_pool_id = value_for_key user_pool_id_type_of_yojson "UserPoolId" _list path }
    : delete_user_pool_request)

let delete_user_pool_replica_response_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     user_pool_replica =
       option_of_yojson
         (value_for_key user_pool_replica_type_of_yojson "UserPoolReplica")
         _list path;
   }
    : delete_user_pool_replica_response)

let delete_user_pool_replica_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     region_name = value_for_key region_name_type_of_yojson "RegionName" _list path;
     user_pool_id = value_for_key user_pool_id_type_of_yojson "UserPoolId" _list path;
   }
    : delete_user_pool_replica_request)

let delete_user_pool_domain_response_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  (() : unit)

let delete_user_pool_domain_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     user_pool_id = value_for_key user_pool_id_type_of_yojson "UserPoolId" _list path;
     domain = value_for_key domain_type_of_yojson "Domain" _list path;
   }
    : delete_user_pool_domain_request)

let delete_user_pool_client_secret_response_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  (() : unit)

let delete_user_pool_client_secret_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     client_secret_id = value_for_key client_secret_id_type_of_yojson "ClientSecretId" _list path;
     client_id = value_for_key client_id_type_of_yojson "ClientId" _list path;
     user_pool_id = value_for_key user_pool_id_type_of_yojson "UserPoolId" _list path;
   }
    : delete_user_pool_client_secret_request)

let delete_user_pool_client_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     client_id = value_for_key client_id_type_of_yojson "ClientId" _list path;
     user_pool_id = value_for_key user_pool_id_type_of_yojson "UserPoolId" _list path;
   }
    : delete_user_pool_client_request)

let delete_user_attributes_response_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  (() : unit)

let attribute_name_list_type_of_yojson tree path =
  list_of_yojson attribute_name_type_of_yojson tree path

let delete_user_attributes_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     access_token = value_for_key token_model_type_of_yojson "AccessToken" _list path;
     user_attribute_names =
       value_for_key attribute_name_list_type_of_yojson "UserAttributeNames" _list path;
   }
    : delete_user_attributes_request)

let delete_terms_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     user_pool_id = value_for_key user_pool_id_type_of_yojson "UserPoolId" _list path;
     terms_id = value_for_key terms_id_type_of_yojson "TermsId" _list path;
   }
    : delete_terms_request)

let delete_resource_server_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     identifier = value_for_key resource_server_identifier_type_of_yojson "Identifier" _list path;
     user_pool_id = value_for_key user_pool_id_type_of_yojson "UserPoolId" _list path;
   }
    : delete_resource_server_request)

let delete_managed_login_branding_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     user_pool_id = value_for_key user_pool_id_type_of_yojson "UserPoolId" _list path;
     managed_login_branding_id =
       value_for_key managed_login_branding_id_type_of_yojson "ManagedLoginBrandingId" _list path;
   }
    : delete_managed_login_branding_request)

let delete_identity_provider_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     provider_name = value_for_key provider_name_type_of_yojson "ProviderName" _list path;
     user_pool_id = value_for_key user_pool_id_type_of_yojson "UserPoolId" _list path;
   }
    : delete_identity_provider_request)

let delete_group_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     user_pool_id = value_for_key user_pool_id_type_of_yojson "UserPoolId" _list path;
     group_name = value_for_key group_name_type_of_yojson "GroupName" _list path;
   }
    : delete_group_request)

let custom_attributes_list_type_of_yojson tree path =
  list_of_yojson schema_attribute_type_of_yojson tree path

let create_user_pool_response_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({ user_pool = option_of_yojson (value_for_key user_pool_type_of_yojson "UserPool") _list path }
    : create_user_pool_response)

let create_user_pool_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     issuer_configuration =
       option_of_yojson
         (value_for_key issuer_configuration_type_of_yojson "IssuerConfiguration")
         _list path;
     key_configuration =
       option_of_yojson
         (value_for_key key_configuration_type_of_yojson "KeyConfiguration")
         _list path;
     user_pool_tier =
       option_of_yojson (value_for_key user_pool_tier_type_of_yojson "UserPoolTier") _list path;
     account_recovery_setting =
       option_of_yojson
         (value_for_key account_recovery_setting_type_of_yojson "AccountRecoverySetting")
         _list path;
     username_configuration =
       option_of_yojson
         (value_for_key username_configuration_type_of_yojson "UsernameConfiguration")
         _list path;
     user_pool_add_ons =
       option_of_yojson (value_for_key user_pool_add_ons_type_of_yojson "UserPoolAddOns") _list path;
     schema =
       option_of_yojson (value_for_key schema_attributes_list_type_of_yojson "Schema") _list path;
     admin_create_user_config =
       option_of_yojson
         (value_for_key admin_create_user_config_type_of_yojson "AdminCreateUserConfig")
         _list path;
     user_pool_tags =
       option_of_yojson (value_for_key user_pool_tags_type_of_yojson "UserPoolTags") _list path;
     sms_configuration =
       option_of_yojson
         (value_for_key sms_configuration_type_of_yojson "SmsConfiguration")
         _list path;
     email_configuration =
       option_of_yojson
         (value_for_key email_configuration_type_of_yojson "EmailConfiguration")
         _list path;
     device_configuration =
       option_of_yojson
         (value_for_key device_configuration_type_of_yojson "DeviceConfiguration")
         _list path;
     user_attribute_update_settings =
       option_of_yojson
         (value_for_key user_attribute_update_settings_type_of_yojson "UserAttributeUpdateSettings")
         _list path;
     mfa_configuration =
       option_of_yojson (value_for_key user_pool_mfa_type_of_yojson "MfaConfiguration") _list path;
     sms_authentication_message =
       option_of_yojson
         (value_for_key sms_verification_message_type_of_yojson "SmsAuthenticationMessage")
         _list path;
     verification_message_template =
       option_of_yojson
         (value_for_key verification_message_template_type_of_yojson "VerificationMessageTemplate")
         _list path;
     email_verification_subject =
       option_of_yojson
         (value_for_key email_verification_subject_type_of_yojson "EmailVerificationSubject")
         _list path;
     email_verification_message =
       option_of_yojson
         (value_for_key email_verification_message_type_of_yojson "EmailVerificationMessage")
         _list path;
     sms_verification_message =
       option_of_yojson
         (value_for_key sms_verification_message_type_of_yojson "SmsVerificationMessage")
         _list path;
     username_attributes =
       option_of_yojson
         (value_for_key username_attributes_list_type_of_yojson "UsernameAttributes")
         _list path;
     alias_attributes =
       option_of_yojson
         (value_for_key alias_attributes_list_type_of_yojson "AliasAttributes")
         _list path;
     auto_verified_attributes =
       option_of_yojson
         (value_for_key verified_attributes_list_type_of_yojson "AutoVerifiedAttributes")
         _list path;
     lambda_config =
       option_of_yojson (value_for_key lambda_config_type_of_yojson "LambdaConfig") _list path;
     deletion_protection =
       option_of_yojson
         (value_for_key deletion_protection_type_of_yojson "DeletionProtection")
         _list path;
     policies =
       option_of_yojson (value_for_key user_pool_policy_type_of_yojson "Policies") _list path;
     pool_name = value_for_key user_pool_name_type_of_yojson "PoolName" _list path;
   }
    : create_user_pool_request)

let create_user_pool_replica_response_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     user_pool_replica =
       option_of_yojson
         (value_for_key user_pool_replica_type_of_yojson "UserPoolReplica")
         _list path;
   }
    : create_user_pool_replica_response)

let create_user_pool_replica_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     user_pool_tags =
       option_of_yojson (value_for_key user_pool_tags_type_of_yojson "UserPoolTags") _list path;
     region_name = value_for_key region_name_type_of_yojson "RegionName" _list path;
     user_pool_id = value_for_key user_pool_id_type_of_yojson "UserPoolId" _list path;
   }
    : create_user_pool_replica_request)

let create_user_pool_domain_response_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     routing = option_of_yojson (value_for_key routing_type_of_yojson "Routing") _list path;
     cloud_front_domain =
       option_of_yojson (value_for_key domain_type_of_yojson "CloudFrontDomain") _list path;
     managed_login_version =
       option_of_yojson
         (value_for_key wrapped_integer_type_of_yojson "ManagedLoginVersion")
         _list path;
   }
    : create_user_pool_domain_response)

let create_user_pool_domain_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     routing = option_of_yojson (value_for_key routing_type_of_yojson "Routing") _list path;
     custom_domain_config =
       option_of_yojson
         (value_for_key custom_domain_config_type_of_yojson "CustomDomainConfig")
         _list path;
     managed_login_version =
       option_of_yojson
         (value_for_key wrapped_integer_type_of_yojson "ManagedLoginVersion")
         _list path;
     user_pool_id = value_for_key user_pool_id_type_of_yojson "UserPoolId" _list path;
     domain = value_for_key domain_type_of_yojson "Domain" _list path;
   }
    : create_user_pool_domain_request)

let create_user_pool_client_response_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     user_pool_client =
       option_of_yojson (value_for_key user_pool_client_type_of_yojson "UserPoolClient") _list path;
   }
    : create_user_pool_client_response)

let create_user_pool_client_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     refresh_token_rotation =
       option_of_yojson
         (value_for_key refresh_token_rotation_type_of_yojson "RefreshTokenRotation")
         _list path;
     auth_session_validity =
       option_of_yojson
         (value_for_key auth_session_validity_type_of_yojson "AuthSessionValidity")
         _list path;
     enable_propagate_additional_user_context_data =
       option_of_yojson
         (value_for_key wrapped_boolean_type_of_yojson "EnablePropagateAdditionalUserContextData")
         _list path;
     enable_token_revocation =
       option_of_yojson
         (value_for_key wrapped_boolean_type_of_yojson "EnableTokenRevocation")
         _list path;
     prevent_user_existence_errors =
       option_of_yojson
         (value_for_key prevent_user_existence_error_types_of_yojson "PreventUserExistenceErrors")
         _list path;
     analytics_configuration =
       option_of_yojson
         (value_for_key analytics_configuration_type_of_yojson "AnalyticsConfiguration")
         _list path;
     allowed_o_auth_flows_user_pool_client =
       option_of_yojson
         (value_for_key boolean_type_of_yojson "AllowedOAuthFlowsUserPoolClient")
         _list path;
     allowed_o_auth_scopes =
       option_of_yojson (value_for_key scope_list_type_of_yojson "AllowedOAuthScopes") _list path;
     allowed_o_auth_flows =
       option_of_yojson (value_for_key o_auth_flows_type_of_yojson "AllowedOAuthFlows") _list path;
     default_redirect_ur_i =
       option_of_yojson (value_for_key redirect_url_type_of_yojson "DefaultRedirectURI") _list path;
     logout_ur_ls =
       option_of_yojson (value_for_key logout_ur_ls_list_type_of_yojson "LogoutURLs") _list path;
     callback_ur_ls =
       option_of_yojson (value_for_key callback_ur_ls_list_type_of_yojson "CallbackURLs") _list path;
     supported_identity_providers =
       option_of_yojson
         (value_for_key supported_identity_providers_list_type_of_yojson
            "SupportedIdentityProviders")
         _list path;
     explicit_auth_flows =
       option_of_yojson
         (value_for_key explicit_auth_flows_list_type_of_yojson "ExplicitAuthFlows")
         _list path;
     write_attributes =
       option_of_yojson
         (value_for_key client_permission_list_type_of_yojson "WriteAttributes")
         _list path;
     read_attributes =
       option_of_yojson
         (value_for_key client_permission_list_type_of_yojson "ReadAttributes")
         _list path;
     token_validity_units =
       option_of_yojson
         (value_for_key token_validity_units_type_of_yojson "TokenValidityUnits")
         _list path;
     id_token_validity =
       option_of_yojson
         (value_for_key id_token_validity_type_of_yojson "IdTokenValidity")
         _list path;
     access_token_validity =
       option_of_yojson
         (value_for_key access_token_validity_type_of_yojson "AccessTokenValidity")
         _list path;
     refresh_token_validity =
       option_of_yojson
         (value_for_key refresh_token_validity_type_of_yojson "RefreshTokenValidity")
         _list path;
     client_secret =
       option_of_yojson (value_for_key client_secret_type_of_yojson "ClientSecret") _list path;
     generate_secret =
       option_of_yojson (value_for_key generate_secret_of_yojson "GenerateSecret") _list path;
     client_name = value_for_key client_name_type_of_yojson "ClientName" _list path;
     user_pool_id = value_for_key user_pool_id_type_of_yojson "UserPoolId" _list path;
   }
    : create_user_pool_client_request)

let create_user_import_job_response_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     user_import_job =
       option_of_yojson (value_for_key user_import_job_type_of_yojson "UserImportJob") _list path;
   }
    : create_user_import_job_response)

let create_user_import_job_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     cloud_watch_logs_role_arn = value_for_key arn_type_of_yojson "CloudWatchLogsRoleArn" _list path;
     user_pool_id = value_for_key user_pool_id_type_of_yojson "UserPoolId" _list path;
     job_name = value_for_key user_import_job_name_type_of_yojson "JobName" _list path;
   }
    : create_user_import_job_request)

let create_terms_response_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({ terms = option_of_yojson (value_for_key terms_type_of_yojson "Terms") _list path }
    : create_terms_response)

let create_terms_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     links = option_of_yojson (value_for_key links_type_of_yojson "Links") _list path;
     enforcement = value_for_key terms_enforcement_type_of_yojson "Enforcement" _list path;
     terms_source = value_for_key terms_source_type_of_yojson "TermsSource" _list path;
     terms_name = value_for_key terms_name_type_of_yojson "TermsName" _list path;
     client_id = value_for_key client_id_type_of_yojson "ClientId" _list path;
     user_pool_id = value_for_key user_pool_id_type_of_yojson "UserPoolId" _list path;
   }
    : create_terms_request)

let create_resource_server_response_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({ resource_server = value_for_key resource_server_type_of_yojson "ResourceServer" _list path }
    : create_resource_server_response)

let create_resource_server_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     scopes =
       option_of_yojson
         (value_for_key resource_server_scope_list_type_of_yojson "Scopes")
         _list path;
     name = value_for_key resource_server_name_type_of_yojson "Name" _list path;
     identifier = value_for_key resource_server_identifier_type_of_yojson "Identifier" _list path;
     user_pool_id = value_for_key user_pool_id_type_of_yojson "UserPoolId" _list path;
   }
    : create_resource_server_request)

let create_managed_login_branding_response_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     managed_login_branding =
       option_of_yojson
         (value_for_key managed_login_branding_type_of_yojson "ManagedLoginBranding")
         _list path;
   }
    : create_managed_login_branding_response)

let create_managed_login_branding_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     assets = option_of_yojson (value_for_key asset_list_type_of_yojson "Assets") _list path;
     settings = option_of_yojson (value_for_key document_of_yojson "Settings") _list path;
     use_cognito_provided_values =
       option_of_yojson (value_for_key boolean_type_of_yojson "UseCognitoProvidedValues") _list path;
     client_id = value_for_key client_id_type_of_yojson "ClientId" _list path;
     user_pool_id = value_for_key user_pool_id_type_of_yojson "UserPoolId" _list path;
   }
    : create_managed_login_branding_request)

let create_identity_provider_response_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     identity_provider =
       value_for_key identity_provider_type_of_yojson "IdentityProvider" _list path;
   }
    : create_identity_provider_response)

let create_identity_provider_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     idp_identifiers =
       option_of_yojson
         (value_for_key idp_identifiers_list_type_of_yojson "IdpIdentifiers")
         _list path;
     attribute_mapping =
       option_of_yojson
         (value_for_key attribute_mapping_type_of_yojson "AttributeMapping")
         _list path;
     provider_details = value_for_key provider_details_type_of_yojson "ProviderDetails" _list path;
     provider_type = value_for_key identity_provider_type_type_of_yojson "ProviderType" _list path;
     provider_name = value_for_key provider_name_type_v2_of_yojson "ProviderName" _list path;
     user_pool_id = value_for_key user_pool_id_type_of_yojson "UserPoolId" _list path;
   }
    : create_identity_provider_request)

let create_group_response_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({ group = option_of_yojson (value_for_key group_type_of_yojson "Group") _list path }
    : create_group_response)

let create_group_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     precedence = option_of_yojson (value_for_key precedence_type_of_yojson "Precedence") _list path;
     role_arn = option_of_yojson (value_for_key arn_type_of_yojson "RoleArn") _list path;
     description =
       option_of_yojson (value_for_key description_type_of_yojson "Description") _list path;
     user_pool_id = value_for_key user_pool_id_type_of_yojson "UserPoolId" _list path;
     group_name = value_for_key group_name_type_of_yojson "GroupName" _list path;
   }
    : create_group_request)

let context_data_type_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     encoded_data = option_of_yojson (value_for_key string_type_of_yojson "EncodedData") _list path;
     http_headers = value_for_key http_header_list_of_yojson "HttpHeaders" _list path;
     server_path = value_for_key string_type_of_yojson "ServerPath" _list path;
     server_name = value_for_key string_type_of_yojson "ServerName" _list path;
     ip_address = value_for_key string_type_of_yojson "IpAddress" _list path;
   }
    : context_data_type)

let confirm_sign_up_response_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({ session = option_of_yojson (value_for_key session_type_of_yojson "Session") _list path }
    : confirm_sign_up_response)

let confirm_sign_up_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     session = option_of_yojson (value_for_key session_type_of_yojson "Session") _list path;
     client_metadata =
       option_of_yojson (value_for_key client_metadata_type_of_yojson "ClientMetadata") _list path;
     user_context_data =
       option_of_yojson
         (value_for_key user_context_data_type_of_yojson "UserContextData")
         _list path;
     analytics_metadata =
       option_of_yojson
         (value_for_key analytics_metadata_type_of_yojson "AnalyticsMetadata")
         _list path;
     force_alias_creation =
       option_of_yojson
         (value_for_key force_alias_creation_of_yojson "ForceAliasCreation")
         _list path;
     confirmation_code =
       value_for_key confirmation_code_type_of_yojson "ConfirmationCode" _list path;
     username = value_for_key username_type_of_yojson "Username" _list path;
     secret_hash =
       option_of_yojson (value_for_key secret_hash_type_of_yojson "SecretHash") _list path;
     client_id = value_for_key client_id_type_of_yojson "ClientId" _list path;
   }
    : confirm_sign_up_request)

let confirm_forgot_password_response_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  (() : unit)

let confirm_forgot_password_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     client_metadata =
       option_of_yojson (value_for_key client_metadata_type_of_yojson "ClientMetadata") _list path;
     user_context_data =
       option_of_yojson
         (value_for_key user_context_data_type_of_yojson "UserContextData")
         _list path;
     analytics_metadata =
       option_of_yojson
         (value_for_key analytics_metadata_type_of_yojson "AnalyticsMetadata")
         _list path;
     password = value_for_key password_type_of_yojson "Password" _list path;
     confirmation_code =
       value_for_key confirmation_code_type_of_yojson "ConfirmationCode" _list path;
     username = value_for_key username_type_of_yojson "Username" _list path;
     secret_hash =
       option_of_yojson (value_for_key secret_hash_type_of_yojson "SecretHash") _list path;
     client_id = value_for_key client_id_type_of_yojson "ClientId" _list path;
   }
    : confirm_forgot_password_request)

let confirm_device_response_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     user_confirmation_necessary =
       option_of_yojson
         (value_for_key boolean_type_of_yojson "UserConfirmationNecessary")
         _list path;
   }
    : confirm_device_response)

let confirm_device_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     device_name =
       option_of_yojson (value_for_key device_name_type_of_yojson "DeviceName") _list path;
     device_secret_verifier_config =
       option_of_yojson
         (value_for_key device_secret_verifier_config_type_of_yojson "DeviceSecretVerifierConfig")
         _list path;
     device_key = value_for_key device_key_type_of_yojson "DeviceKey" _list path;
     access_token = value_for_key token_model_type_of_yojson "AccessToken" _list path;
   }
    : confirm_device_request)

let complete_web_authn_registration_response_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  (() : unit)

let complete_web_authn_registration_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     credential = value_for_key document_of_yojson "Credential" _list path;
     access_token = value_for_key token_model_type_of_yojson "AccessToken" _list path;
   }
    : complete_web_authn_registration_request)

let change_password_response_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  (() : unit)

let change_password_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     access_token = value_for_key token_model_type_of_yojson "AccessToken" _list path;
     proposed_password = value_for_key password_type_of_yojson "ProposedPassword" _list path;
     previous_password =
       option_of_yojson (value_for_key password_type_of_yojson "PreviousPassword") _list path;
   }
    : change_password_request)

let challenge_name_of_yojson (tree : t) path =
  ((match tree with
    | `String "Mfa" -> Mfa
    | `String "Password" -> Password
    | `String value -> raise (deserialize_unknown_enum_value_error path "ChallengeName" value)
    | _ -> raise (deserialize_wrong_type_error path "ChallengeName")
     : challenge_name)
    : challenge_name)

let challenge_response_of_yojson (tree : t) path =
  ((match tree with
    | `String "Failure" -> Failure
    | `String "Success" -> Success
    | `String value -> raise (deserialize_unknown_enum_value_error path "ChallengeResponse" value)
    | _ -> raise (deserialize_wrong_type_error path "ChallengeResponse")
     : challenge_response)
    : challenge_response)

let challenge_response_type_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     challenge_response =
       option_of_yojson (value_for_key challenge_response_of_yojson "ChallengeResponse") _list path;
     challenge_name =
       option_of_yojson (value_for_key challenge_name_of_yojson "ChallengeName") _list path;
   }
    : challenge_response_type)

let challenge_response_list_type_of_yojson tree path =
  list_of_yojson challenge_response_type_of_yojson tree path

let auth_event_type_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     event_feedback =
       option_of_yojson (value_for_key event_feedback_type_of_yojson "EventFeedback") _list path;
     event_context_data =
       option_of_yojson
         (value_for_key event_context_data_type_of_yojson "EventContextData")
         _list path;
     challenge_responses =
       option_of_yojson
         (value_for_key challenge_response_list_type_of_yojson "ChallengeResponses")
         _list path;
     event_risk = option_of_yojson (value_for_key event_risk_type_of_yojson "EventRisk") _list path;
     event_response =
       option_of_yojson (value_for_key event_response_type_of_yojson "EventResponse") _list path;
     creation_date = option_of_yojson (value_for_key date_type_of_yojson "CreationDate") _list path;
     event_type = option_of_yojson (value_for_key event_type_of_yojson "EventType") _list path;
     event_id = option_of_yojson (value_for_key string_type_of_yojson "EventId") _list path;
   }
    : auth_event_type)

let auth_events_type_of_yojson tree path = list_of_yojson auth_event_type_of_yojson tree path

let associate_software_token_response_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     session = option_of_yojson (value_for_key session_type_of_yojson "Session") _list path;
     secret_code =
       option_of_yojson (value_for_key secret_code_type_of_yojson "SecretCode") _list path;
   }
    : associate_software_token_response)

let associate_software_token_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     session = option_of_yojson (value_for_key session_type_of_yojson "Session") _list path;
     access_token =
       option_of_yojson (value_for_key token_model_type_of_yojson "AccessToken") _list path;
   }
    : associate_software_token_request)

let admin_user_global_sign_out_response_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  (() : unit)

let admin_user_global_sign_out_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     username = value_for_key username_type_of_yojson "Username" _list path;
     user_pool_id = value_for_key user_pool_id_type_of_yojson "UserPoolId" _list path;
   }
    : admin_user_global_sign_out_request)

let admin_update_user_attributes_response_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  (() : unit)

let admin_update_user_attributes_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     client_metadata =
       option_of_yojson (value_for_key client_metadata_type_of_yojson "ClientMetadata") _list path;
     user_attributes = value_for_key attribute_list_type_of_yojson "UserAttributes" _list path;
     username = value_for_key username_type_of_yojson "Username" _list path;
     user_pool_id = value_for_key user_pool_id_type_of_yojson "UserPoolId" _list path;
   }
    : admin_update_user_attributes_request)

let admin_update_device_status_response_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  (() : unit)

let admin_update_device_status_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     device_remembered_status =
       option_of_yojson
         (value_for_key device_remembered_status_type_of_yojson "DeviceRememberedStatus")
         _list path;
     device_key = value_for_key device_key_type_of_yojson "DeviceKey" _list path;
     username = value_for_key username_type_of_yojson "Username" _list path;
     user_pool_id = value_for_key user_pool_id_type_of_yojson "UserPoolId" _list path;
   }
    : admin_update_device_status_request)

let admin_update_auth_event_feedback_response_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  (() : unit)

let admin_update_auth_event_feedback_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     feedback_value = value_for_key feedback_value_type_of_yojson "FeedbackValue" _list path;
     event_id = value_for_key event_id_type_of_yojson "EventId" _list path;
     username = value_for_key username_type_of_yojson "Username" _list path;
     user_pool_id = value_for_key user_pool_id_type_of_yojson "UserPoolId" _list path;
   }
    : admin_update_auth_event_feedback_request)

let admin_set_user_settings_response_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  (() : unit)

let admin_set_user_settings_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     mfa_options = value_for_key mfa_option_list_type_of_yojson "MFAOptions" _list path;
     username = value_for_key username_type_of_yojson "Username" _list path;
     user_pool_id = value_for_key user_pool_id_type_of_yojson "UserPoolId" _list path;
   }
    : admin_set_user_settings_request)

let admin_set_user_password_response_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  (() : unit)

let admin_set_user_password_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     permanent = option_of_yojson (value_for_key boolean_type_of_yojson "Permanent") _list path;
     password = value_for_key password_type_of_yojson "Password" _list path;
     username = value_for_key username_type_of_yojson "Username" _list path;
     user_pool_id = value_for_key user_pool_id_type_of_yojson "UserPoolId" _list path;
   }
    : admin_set_user_password_request)

let admin_set_user_mfa_preference_response_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  (() : unit)

let admin_set_user_mfa_preference_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     user_pool_id = value_for_key user_pool_id_type_of_yojson "UserPoolId" _list path;
     username = value_for_key username_type_of_yojson "Username" _list path;
     web_authn_mfa_settings =
       option_of_yojson
         (value_for_key web_authn_mfa_settings_type_of_yojson "WebAuthnMfaSettings")
         _list path;
     email_mfa_settings =
       option_of_yojson
         (value_for_key email_mfa_settings_type_of_yojson "EmailMfaSettings")
         _list path;
     software_token_mfa_settings =
       option_of_yojson
         (value_for_key software_token_mfa_settings_type_of_yojson "SoftwareTokenMfaSettings")
         _list path;
     sms_mfa_settings =
       option_of_yojson (value_for_key sms_mfa_settings_type_of_yojson "SMSMfaSettings") _list path;
   }
    : admin_set_user_mfa_preference_request)

let admin_respond_to_auth_challenge_response_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     authentication_result =
       option_of_yojson
         (value_for_key authentication_result_type_of_yojson "AuthenticationResult")
         _list path;
     challenge_parameters =
       option_of_yojson
         (value_for_key challenge_parameters_type_of_yojson "ChallengeParameters")
         _list path;
     session = option_of_yojson (value_for_key session_type_of_yojson "Session") _list path;
     challenge_name =
       option_of_yojson (value_for_key challenge_name_type_of_yojson "ChallengeName") _list path;
   }
    : admin_respond_to_auth_challenge_response)

let admin_respond_to_auth_challenge_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     client_metadata =
       option_of_yojson (value_for_key client_metadata_type_of_yojson "ClientMetadata") _list path;
     context_data =
       option_of_yojson (value_for_key context_data_type_of_yojson "ContextData") _list path;
     analytics_metadata =
       option_of_yojson
         (value_for_key analytics_metadata_type_of_yojson "AnalyticsMetadata")
         _list path;
     session = option_of_yojson (value_for_key session_type_of_yojson "Session") _list path;
     challenge_responses =
       option_of_yojson
         (value_for_key challenge_responses_type_of_yojson "ChallengeResponses")
         _list path;
     challenge_name = value_for_key challenge_name_type_of_yojson "ChallengeName" _list path;
     client_id = value_for_key client_id_type_of_yojson "ClientId" _list path;
     user_pool_id = value_for_key user_pool_id_type_of_yojson "UserPoolId" _list path;
   }
    : admin_respond_to_auth_challenge_request)

let admin_reset_user_password_response_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  (() : unit)

let admin_reset_user_password_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     client_metadata =
       option_of_yojson (value_for_key client_metadata_type_of_yojson "ClientMetadata") _list path;
     username = value_for_key username_type_of_yojson "Username" _list path;
     user_pool_id = value_for_key user_pool_id_type_of_yojson "UserPoolId" _list path;
   }
    : admin_reset_user_password_request)

let admin_remove_user_from_group_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     group_name = value_for_key group_name_type_of_yojson "GroupName" _list path;
     username = value_for_key username_type_of_yojson "Username" _list path;
     user_pool_id = value_for_key user_pool_id_type_of_yojson "UserPoolId" _list path;
   }
    : admin_remove_user_from_group_request)

let admin_list_user_auth_events_response_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     next_token = option_of_yojson (value_for_key pagination_key_of_yojson "NextToken") _list path;
     auth_events =
       option_of_yojson (value_for_key auth_events_type_of_yojson "AuthEvents") _list path;
   }
    : admin_list_user_auth_events_response)

let admin_list_user_auth_events_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     next_token = option_of_yojson (value_for_key pagination_key_of_yojson "NextToken") _list path;
     max_results =
       option_of_yojson (value_for_key query_limit_type_of_yojson "MaxResults") _list path;
     username = value_for_key username_type_of_yojson "Username" _list path;
     user_pool_id = value_for_key user_pool_id_type_of_yojson "UserPoolId" _list path;
   }
    : admin_list_user_auth_events_request)

let admin_list_groups_for_user_response_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     next_token = option_of_yojson (value_for_key pagination_key_of_yojson "NextToken") _list path;
     groups = option_of_yojson (value_for_key group_list_type_of_yojson "Groups") _list path;
   }
    : admin_list_groups_for_user_response)

let admin_list_groups_for_user_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     next_token = option_of_yojson (value_for_key pagination_key_of_yojson "NextToken") _list path;
     limit = option_of_yojson (value_for_key query_limit_type_of_yojson "Limit") _list path;
     user_pool_id = value_for_key user_pool_id_type_of_yojson "UserPoolId" _list path;
     username = value_for_key username_type_of_yojson "Username" _list path;
   }
    : admin_list_groups_for_user_request)

let admin_list_devices_response_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     pagination_token =
       option_of_yojson
         (value_for_key search_pagination_token_type_of_yojson "PaginationToken")
         _list path;
     devices = option_of_yojson (value_for_key device_list_type_of_yojson "Devices") _list path;
   }
    : admin_list_devices_response)

let admin_list_devices_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     pagination_token =
       option_of_yojson
         (value_for_key search_pagination_token_type_of_yojson "PaginationToken")
         _list path;
     limit = option_of_yojson (value_for_key query_limit_type_of_yojson "Limit") _list path;
     username = value_for_key username_type_of_yojson "Username" _list path;
     user_pool_id = value_for_key user_pool_id_type_of_yojson "UserPoolId" _list path;
   }
    : admin_list_devices_request)

let admin_link_provider_for_user_response_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  (() : unit)

let admin_link_provider_for_user_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     source_user = value_for_key provider_user_identifier_type_of_yojson "SourceUser" _list path;
     destination_user =
       value_for_key provider_user_identifier_type_of_yojson "DestinationUser" _list path;
     user_pool_id = value_for_key string_type_of_yojson "UserPoolId" _list path;
   }
    : admin_link_provider_for_user_request)

let admin_initiate_auth_response_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     available_challenges =
       option_of_yojson
         (value_for_key available_challenge_list_type_of_yojson "AvailableChallenges")
         _list path;
     authentication_result =
       option_of_yojson
         (value_for_key authentication_result_type_of_yojson "AuthenticationResult")
         _list path;
     challenge_parameters =
       option_of_yojson
         (value_for_key challenge_parameters_type_of_yojson "ChallengeParameters")
         _list path;
     session = option_of_yojson (value_for_key session_type_of_yojson "Session") _list path;
     challenge_name =
       option_of_yojson (value_for_key challenge_name_type_of_yojson "ChallengeName") _list path;
   }
    : admin_initiate_auth_response)

let admin_initiate_auth_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     session = option_of_yojson (value_for_key session_type_of_yojson "Session") _list path;
     context_data =
       option_of_yojson (value_for_key context_data_type_of_yojson "ContextData") _list path;
     analytics_metadata =
       option_of_yojson
         (value_for_key analytics_metadata_type_of_yojson "AnalyticsMetadata")
         _list path;
     client_metadata =
       option_of_yojson (value_for_key client_metadata_type_of_yojson "ClientMetadata") _list path;
     auth_parameters =
       option_of_yojson (value_for_key auth_parameters_type_of_yojson "AuthParameters") _list path;
     auth_flow = value_for_key auth_flow_type_of_yojson "AuthFlow" _list path;
     client_id = value_for_key client_id_type_of_yojson "ClientId" _list path;
     user_pool_id = value_for_key user_pool_id_type_of_yojson "UserPoolId" _list path;
   }
    : admin_initiate_auth_request)

let admin_get_user_response_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     user_mfa_setting_list =
       option_of_yojson
         (value_for_key user_mfa_setting_list_type_of_yojson "UserMFASettingList")
         _list path;
     preferred_mfa_setting =
       option_of_yojson (value_for_key string_type_of_yojson "PreferredMfaSetting") _list path;
     mfa_options =
       option_of_yojson (value_for_key mfa_option_list_type_of_yojson "MFAOptions") _list path;
     user_status =
       option_of_yojson (value_for_key user_status_type_of_yojson "UserStatus") _list path;
     enabled = option_of_yojson (value_for_key boolean_type_of_yojson "Enabled") _list path;
     user_last_modified_date =
       option_of_yojson (value_for_key date_type_of_yojson "UserLastModifiedDate") _list path;
     user_create_date =
       option_of_yojson (value_for_key date_type_of_yojson "UserCreateDate") _list path;
     user_attributes =
       option_of_yojson (value_for_key attribute_list_type_of_yojson "UserAttributes") _list path;
     username = value_for_key username_type_of_yojson "Username" _list path;
   }
    : admin_get_user_response)

let admin_get_user_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     username = value_for_key username_type_of_yojson "Username" _list path;
     user_pool_id = value_for_key user_pool_id_type_of_yojson "UserPoolId" _list path;
   }
    : admin_get_user_request)

let admin_get_device_response_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({ device = value_for_key device_type_of_yojson "Device" _list path } : admin_get_device_response)

let admin_get_device_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     username = value_for_key username_type_of_yojson "Username" _list path;
     user_pool_id = value_for_key user_pool_id_type_of_yojson "UserPoolId" _list path;
     device_key = value_for_key device_key_type_of_yojson "DeviceKey" _list path;
   }
    : admin_get_device_request)

let admin_forget_device_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     device_key = value_for_key device_key_type_of_yojson "DeviceKey" _list path;
     username = value_for_key username_type_of_yojson "Username" _list path;
     user_pool_id = value_for_key user_pool_id_type_of_yojson "UserPoolId" _list path;
   }
    : admin_forget_device_request)

let admin_enable_user_response_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  (() : unit)

let admin_enable_user_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     username = value_for_key username_type_of_yojson "Username" _list path;
     user_pool_id = value_for_key user_pool_id_type_of_yojson "UserPoolId" _list path;
   }
    : admin_enable_user_request)

let admin_disable_user_response_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  (() : unit)

let admin_disable_user_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     username = value_for_key username_type_of_yojson "Username" _list path;
     user_pool_id = value_for_key user_pool_id_type_of_yojson "UserPoolId" _list path;
   }
    : admin_disable_user_request)

let admin_disable_provider_for_user_response_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  (() : unit)

let admin_disable_provider_for_user_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     user = value_for_key provider_user_identifier_type_of_yojson "User" _list path;
     user_pool_id = value_for_key string_type_of_yojson "UserPoolId" _list path;
   }
    : admin_disable_provider_for_user_request)

let admin_delete_user_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     username = value_for_key username_type_of_yojson "Username" _list path;
     user_pool_id = value_for_key user_pool_id_type_of_yojson "UserPoolId" _list path;
   }
    : admin_delete_user_request)

let admin_delete_user_attributes_response_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  (() : unit)

let admin_delete_user_attributes_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     user_attribute_names =
       value_for_key attribute_name_list_type_of_yojson "UserAttributeNames" _list path;
     username = value_for_key username_type_of_yojson "Username" _list path;
     user_pool_id = value_for_key user_pool_id_type_of_yojson "UserPoolId" _list path;
   }
    : admin_delete_user_attributes_request)

let admin_create_user_response_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({ user = option_of_yojson (value_for_key user_type_of_yojson "User") _list path }
    : admin_create_user_response)

let admin_create_user_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     client_metadata =
       option_of_yojson (value_for_key client_metadata_type_of_yojson "ClientMetadata") _list path;
     desired_delivery_mediums =
       option_of_yojson
         (value_for_key delivery_medium_list_type_of_yojson "DesiredDeliveryMediums")
         _list path;
     message_action =
       option_of_yojson (value_for_key message_action_type_of_yojson "MessageAction") _list path;
     force_alias_creation =
       option_of_yojson
         (value_for_key force_alias_creation_of_yojson "ForceAliasCreation")
         _list path;
     temporary_password =
       option_of_yojson (value_for_key password_type_of_yojson "TemporaryPassword") _list path;
     validation_data =
       option_of_yojson (value_for_key attribute_list_type_of_yojson "ValidationData") _list path;
     user_attributes =
       option_of_yojson (value_for_key attribute_list_type_of_yojson "UserAttributes") _list path;
     username = value_for_key username_type_of_yojson "Username" _list path;
     user_pool_id = value_for_key user_pool_id_type_of_yojson "UserPoolId" _list path;
   }
    : admin_create_user_request)

let admin_confirm_sign_up_response_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  (() : unit)

let admin_confirm_sign_up_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     client_metadata =
       option_of_yojson (value_for_key client_metadata_type_of_yojson "ClientMetadata") _list path;
     username = value_for_key username_type_of_yojson "Username" _list path;
     user_pool_id = value_for_key user_pool_id_type_of_yojson "UserPoolId" _list path;
   }
    : admin_confirm_sign_up_request)

let admin_add_user_to_group_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     group_name = value_for_key group_name_type_of_yojson "GroupName" _list path;
     username = value_for_key username_type_of_yojson "Username" _list path;
     user_pool_id = value_for_key user_pool_id_type_of_yojson "UserPoolId" _list path;
   }
    : admin_add_user_to_group_request)

let add_user_pool_client_secret_response_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     client_secret_descriptor =
       option_of_yojson
         (value_for_key client_secret_descriptor_type_of_yojson "ClientSecretDescriptor")
         _list path;
   }
    : add_user_pool_client_secret_response)

let add_user_pool_client_secret_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     client_secret =
       option_of_yojson (value_for_key client_secret_type_of_yojson "ClientSecret") _list path;
     client_id = value_for_key client_id_type_of_yojson "ClientId" _list path;
     user_pool_id = value_for_key user_pool_id_type_of_yojson "UserPoolId" _list path;
   }
    : add_user_pool_client_secret_request)

let access_denied_exception_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({ message = option_of_yojson (value_for_key message_type_of_yojson "message") _list path }
    : access_denied_exception)

let add_custom_attributes_response_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  (() : unit)

let add_custom_attributes_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     custom_attributes =
       value_for_key custom_attributes_list_type_of_yojson "CustomAttributes" _list path;
     user_pool_id = value_for_key user_pool_id_type_of_yojson "UserPoolId" _list path;
   }
    : add_custom_attributes_request)
