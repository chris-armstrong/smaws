open Smaws_Lib.Json.SerializeHelpers
open Types

let wrapped_integer_type_to_yojson = int_to_yojson
let wrapped_boolean_type_to_yojson = bool_to_yojson
let message_type_to_yojson = string_to_yojson

let web_authn_relying_party_mismatch_exception_to_yojson
    (x : web_authn_relying_party_mismatch_exception) =
  assoc_to_yojson [ ("message", option_to_yojson message_type_to_yojson x.message) ]

let web_authn_origin_not_allowed_exception_to_yojson (x : web_authn_origin_not_allowed_exception) =
  assoc_to_yojson [ ("message", option_to_yojson message_type_to_yojson x.message) ]

let web_authn_not_enabled_exception_to_yojson (x : web_authn_not_enabled_exception) =
  assoc_to_yojson [ ("message", option_to_yojson message_type_to_yojson x.message) ]

let boolean_type_to_yojson = bool_to_yojson

let web_authn_mfa_settings_type_to_yojson (x : web_authn_mfa_settings_type) =
  assoc_to_yojson [ ("Enabled", option_to_yojson boolean_type_to_yojson x.enabled) ]

let web_authn_factor_configuration_type_to_yojson (x : web_authn_factor_configuration_type) =
  match x with
  | MULTI_FACTOR_WITH_USER_VERIFICATION -> `String "MULTI_FACTOR_WITH_USER_VERIFICATION"
  | SINGLE_FACTOR -> `String "SINGLE_FACTOR"

let web_authn_credentials_query_limit_type_to_yojson = int_to_yojson

let web_authn_credential_not_supported_exception_to_yojson
    (x : web_authn_credential_not_supported_exception) =
  assoc_to_yojson [ ("message", option_to_yojson message_type_to_yojson x.message) ]

let string_type_to_yojson = string_to_yojson
let web_authn_authenticator_attachment_type_to_yojson = string_to_yojson
let web_authn_authenticator_transport_type_to_yojson = string_to_yojson

let web_authn_authenticator_transports_list_to_yojson tree =
  list_to_yojson web_authn_authenticator_transport_type_to_yojson tree

let date_type_to_yojson = timestamp_epoch_seconds_to_yojson

let web_authn_credential_description_to_yojson (x : web_authn_credential_description) =
  assoc_to_yojson
    [
      ("CreatedAt", Some (date_type_to_yojson x.created_at));
      ( "AuthenticatorTransports",
        Some (web_authn_authenticator_transports_list_to_yojson x.authenticator_transports) );
      ( "AuthenticatorAttachment",
        option_to_yojson web_authn_authenticator_attachment_type_to_yojson
          x.authenticator_attachment );
      ("RelyingPartyId", Some (string_type_to_yojson x.relying_party_id));
      ("FriendlyCredentialName", Some (string_type_to_yojson x.friendly_credential_name));
      ("CredentialId", Some (string_type_to_yojson x.credential_id));
    ]

let web_authn_credential_description_list_type_to_yojson tree =
  list_to_yojson web_authn_credential_description_to_yojson tree

let relying_party_id_type_to_yojson = string_to_yojson

let user_verification_type_to_yojson (x : user_verification_type) =
  match x with PREFERRED -> `String "preferred" | REQUIRED -> `String "required"

let web_authn_configuration_type_to_yojson (x : web_authn_configuration_type) =
  assoc_to_yojson
    [
      ( "FactorConfiguration",
        option_to_yojson web_authn_factor_configuration_type_to_yojson x.factor_configuration );
      ("UserVerification", option_to_yojson user_verification_type_to_yojson x.user_verification);
      ("RelyingPartyId", option_to_yojson relying_party_id_type_to_yojson x.relying_party_id);
    ]

let web_authn_configuration_missing_exception_to_yojson
    (x : web_authn_configuration_missing_exception) =
  assoc_to_yojson [ ("message", option_to_yojson message_type_to_yojson x.message) ]

let web_authn_client_mismatch_exception_to_yojson (x : web_authn_client_mismatch_exception) =
  assoc_to_yojson [ ("message", option_to_yojson message_type_to_yojson x.message) ]

let web_authn_challenge_not_found_exception_to_yojson (x : web_authn_challenge_not_found_exception)
    =
  assoc_to_yojson [ ("message", option_to_yojson message_type_to_yojson x.message) ]

let verify_user_attribute_response_to_yojson = unit_to_yojson
let token_model_type_to_yojson = string_to_yojson
let attribute_name_type_to_yojson = string_to_yojson
let confirmation_code_type_to_yojson = string_to_yojson

let verify_user_attribute_request_to_yojson (x : verify_user_attribute_request) =
  assoc_to_yojson
    [
      ("Code", Some (confirmation_code_type_to_yojson x.code));
      ("AttributeName", Some (attribute_name_type_to_yojson x.attribute_name));
      ("AccessToken", Some (token_model_type_to_yojson x.access_token));
    ]

let user_not_found_exception_to_yojson (x : user_not_found_exception) =
  assoc_to_yojson [ ("message", option_to_yojson message_type_to_yojson x.message) ]

let user_not_confirmed_exception_to_yojson (x : user_not_confirmed_exception) =
  assoc_to_yojson [ ("message", option_to_yojson message_type_to_yojson x.message) ]

let too_many_requests_exception_to_yojson (x : too_many_requests_exception) =
  assoc_to_yojson [ ("message", option_to_yojson message_type_to_yojson x.message) ]

let resource_not_found_exception_to_yojson (x : resource_not_found_exception) =
  assoc_to_yojson [ ("message", option_to_yojson message_type_to_yojson x.message) ]

let password_reset_required_exception_to_yojson (x : password_reset_required_exception) =
  assoc_to_yojson [ ("message", option_to_yojson message_type_to_yojson x.message) ]

let operation_not_enabled_exception_to_yojson (x : operation_not_enabled_exception) =
  assoc_to_yojson [ ("message", option_to_yojson message_type_to_yojson x.message) ]

let not_authorized_exception_to_yojson (x : not_authorized_exception) =
  assoc_to_yojson [ ("message", option_to_yojson message_type_to_yojson x.message) ]

let limit_exceeded_exception_to_yojson (x : limit_exceeded_exception) =
  assoc_to_yojson [ ("message", option_to_yojson message_type_to_yojson x.message) ]

let invalid_parameter_exception_reason_code_type_to_yojson = string_to_yojson

let invalid_parameter_exception_to_yojson (x : invalid_parameter_exception) =
  assoc_to_yojson
    [
      ( "reasonCode",
        option_to_yojson invalid_parameter_exception_reason_code_type_to_yojson x.reason_code );
      ("message", option_to_yojson message_type_to_yojson x.message);
    ]

let internal_error_exception_to_yojson (x : internal_error_exception) =
  assoc_to_yojson [ ("message", option_to_yojson message_type_to_yojson x.message) ]

let forbidden_exception_to_yojson (x : forbidden_exception) =
  assoc_to_yojson [ ("message", option_to_yojson message_type_to_yojson x.message) ]

let expired_code_exception_to_yojson (x : expired_code_exception) =
  assoc_to_yojson [ ("message", option_to_yojson message_type_to_yojson x.message) ]

let code_mismatch_exception_to_yojson (x : code_mismatch_exception) =
  assoc_to_yojson [ ("message", option_to_yojson message_type_to_yojson x.message) ]

let alias_exists_exception_to_yojson (x : alias_exists_exception) =
  assoc_to_yojson [ ("message", option_to_yojson message_type_to_yojson x.message) ]

let verify_software_token_response_type_to_yojson (x : verify_software_token_response_type) =
  match x with ERROR -> `String "ERROR" | SUCCESS -> `String "SUCCESS"

let session_type_to_yojson = string_to_yojson

let verify_software_token_response_to_yojson (x : verify_software_token_response) =
  assoc_to_yojson
    [
      ("Session", option_to_yojson session_type_to_yojson x.session);
      ("Status", option_to_yojson verify_software_token_response_type_to_yojson x.status);
    ]

let software_token_mfa_user_code_type_to_yojson = string_to_yojson

let verify_software_token_request_to_yojson (x : verify_software_token_request) =
  assoc_to_yojson
    [
      ("FriendlyDeviceName", option_to_yojson string_type_to_yojson x.friendly_device_name);
      ("UserCode", Some (software_token_mfa_user_code_type_to_yojson x.user_code));
      ("Session", option_to_yojson session_type_to_yojson x.session);
      ("AccessToken", option_to_yojson token_model_type_to_yojson x.access_token);
    ]

let software_token_mfa_not_found_exception_to_yojson (x : software_token_mfa_not_found_exception) =
  assoc_to_yojson [ ("message", option_to_yojson message_type_to_yojson x.message) ]

let invalid_user_pool_configuration_exception_to_yojson
    (x : invalid_user_pool_configuration_exception) =
  assoc_to_yojson [ ("message", option_to_yojson message_type_to_yojson x.message) ]

let enable_software_token_mfa_exception_to_yojson (x : enable_software_token_mfa_exception) =
  assoc_to_yojson [ ("message", option_to_yojson message_type_to_yojson x.message) ]

let verified_attribute_type_to_yojson (x : verified_attribute_type) =
  match x with EMAIL -> `String "email" | PHONE_NUMBER -> `String "phone_number"

let verified_attributes_list_type_to_yojson tree =
  list_to_yojson verified_attribute_type_to_yojson tree

let sms_verification_message_type_to_yojson = string_to_yojson
let email_verification_message_type_to_yojson = string_to_yojson
let email_verification_subject_type_to_yojson = string_to_yojson
let email_verification_message_by_link_type_to_yojson = string_to_yojson
let email_verification_subject_by_link_type_to_yojson = string_to_yojson

let default_email_option_type_to_yojson (x : default_email_option_type) =
  match x with
  | CONFIRM_WITH_CODE -> `String "CONFIRM_WITH_CODE"
  | CONFIRM_WITH_LINK -> `String "CONFIRM_WITH_LINK"

let verification_message_template_type_to_yojson (x : verification_message_template_type) =
  assoc_to_yojson
    [
      ( "DefaultEmailOption",
        option_to_yojson default_email_option_type_to_yojson x.default_email_option );
      ( "EmailSubjectByLink",
        option_to_yojson email_verification_subject_by_link_type_to_yojson x.email_subject_by_link
      );
      ( "EmailMessageByLink",
        option_to_yojson email_verification_message_by_link_type_to_yojson x.email_message_by_link
      );
      ("EmailSubject", option_to_yojson email_verification_subject_type_to_yojson x.email_subject);
      ("EmailMessage", option_to_yojson email_verification_message_type_to_yojson x.email_message);
      ("SmsMessage", option_to_yojson sms_verification_message_type_to_yojson x.sms_message);
    ]

let username_type_to_yojson = string_to_yojson
let attribute_value_type_to_yojson = string_to_yojson

let attribute_type_to_yojson (x : attribute_type) =
  assoc_to_yojson
    [
      ("Value", option_to_yojson attribute_value_type_to_yojson x.value);
      ("Name", Some (attribute_name_type_to_yojson x.name));
    ]

let attribute_list_type_to_yojson tree = list_to_yojson attribute_type_to_yojson tree

let user_status_type_to_yojson (x : user_status_type) =
  match x with
  | EXTERNAL_PROVIDER -> `String "EXTERNAL_PROVIDER"
  | FORCE_CHANGE_PASSWORD -> `String "FORCE_CHANGE_PASSWORD"
  | RESET_REQUIRED -> `String "RESET_REQUIRED"
  | UNKNOWN -> `String "UNKNOWN"
  | COMPROMISED -> `String "COMPROMISED"
  | ARCHIVED -> `String "ARCHIVED"
  | CONFIRMED -> `String "CONFIRMED"
  | UNCONFIRMED -> `String "UNCONFIRMED"

let delivery_medium_type_to_yojson (x : delivery_medium_type) =
  match x with EMAIL -> `String "EMAIL" | SMS -> `String "SMS"

let mfa_option_type_to_yojson (x : mfa_option_type) =
  assoc_to_yojson
    [
      ("AttributeName", option_to_yojson attribute_name_type_to_yojson x.attribute_name);
      ("DeliveryMedium", option_to_yojson delivery_medium_type_to_yojson x.delivery_medium);
    ]

let mfa_option_list_type_to_yojson tree = list_to_yojson mfa_option_type_to_yojson tree

let user_type_to_yojson (x : user_type) =
  assoc_to_yojson
    [
      ("MFAOptions", option_to_yojson mfa_option_list_type_to_yojson x.mfa_options);
      ("UserStatus", option_to_yojson user_status_type_to_yojson x.user_status);
      ("Enabled", option_to_yojson boolean_type_to_yojson x.enabled);
      ("UserLastModifiedDate", option_to_yojson date_type_to_yojson x.user_last_modified_date);
      ("UserCreateDate", option_to_yojson date_type_to_yojson x.user_create_date);
      ("Attributes", option_to_yojson attribute_list_type_to_yojson x.attributes);
      ("Username", option_to_yojson username_type_to_yojson x.username);
    ]

let users_list_type_to_yojson tree = list_to_yojson user_type_to_yojson tree

let username_exists_exception_to_yojson (x : username_exists_exception) =
  assoc_to_yojson [ ("message", option_to_yojson message_type_to_yojson x.message) ]

let username_configuration_type_to_yojson (x : username_configuration_type) =
  assoc_to_yojson [ ("CaseSensitive", Some (wrapped_boolean_type_to_yojson x.case_sensitive)) ]

let username_attribute_type_to_yojson (x : username_attribute_type) =
  match x with EMAIL -> `String "email" | PHONE_NUMBER -> `String "phone_number"

let username_attributes_list_type_to_yojson tree =
  list_to_yojson username_attribute_type_to_yojson tree

let user_pool_id_type_to_yojson = string_to_yojson
let user_pool_name_type_to_yojson = string_to_yojson
let password_policy_min_length_type_to_yojson = int_to_yojson
let password_history_size_type_to_yojson = int_to_yojson
let temporary_password_validity_days_type_to_yojson = int_to_yojson

let password_policy_type_to_yojson (x : password_policy_type) =
  assoc_to_yojson
    [
      ( "TemporaryPasswordValidityDays",
        option_to_yojson temporary_password_validity_days_type_to_yojson
          x.temporary_password_validity_days );
      ( "PasswordHistorySize",
        option_to_yojson password_history_size_type_to_yojson x.password_history_size );
      ("RequireSymbols", option_to_yojson boolean_type_to_yojson x.require_symbols);
      ("RequireNumbers", option_to_yojson boolean_type_to_yojson x.require_numbers);
      ("RequireLowercase", option_to_yojson boolean_type_to_yojson x.require_lowercase);
      ("RequireUppercase", option_to_yojson boolean_type_to_yojson x.require_uppercase);
      ("MinimumLength", option_to_yojson password_policy_min_length_type_to_yojson x.minimum_length);
    ]

let auth_factor_type_to_yojson (x : auth_factor_type) =
  match x with
  | WEB_AUTHN -> `String "WEB_AUTHN"
  | SMS_OTP -> `String "SMS_OTP"
  | EMAIL_OTP -> `String "EMAIL_OTP"
  | PASSWORD -> `String "PASSWORD"

let allowed_first_auth_factors_list_type_to_yojson tree =
  list_to_yojson auth_factor_type_to_yojson tree

let sign_in_policy_type_to_yojson (x : sign_in_policy_type) =
  assoc_to_yojson
    [
      ( "AllowedFirstAuthFactors",
        option_to_yojson allowed_first_auth_factors_list_type_to_yojson x.allowed_first_auth_factors
      );
    ]

let user_pool_policy_type_to_yojson (x : user_pool_policy_type) =
  assoc_to_yojson
    [
      ("SignInPolicy", option_to_yojson sign_in_policy_type_to_yojson x.sign_in_policy);
      ("PasswordPolicy", option_to_yojson password_policy_type_to_yojson x.password_policy);
    ]

let deletion_protection_type_to_yojson (x : deletion_protection_type) =
  match x with INACTIVE -> `String "INACTIVE" | ACTIVE -> `String "ACTIVE"

let arn_type_to_yojson = string_to_yojson

let pre_token_generation_lambda_version_type_to_yojson
    (x : pre_token_generation_lambda_version_type) =
  match x with V3_0 -> `String "V3_0" | V2_0 -> `String "V2_0" | V1_0 -> `String "V1_0"

let pre_token_generation_version_config_type_to_yojson
    (x : pre_token_generation_version_config_type) =
  assoc_to_yojson
    [
      ("LambdaArn", Some (arn_type_to_yojson x.lambda_arn));
      ("LambdaVersion", Some (pre_token_generation_lambda_version_type_to_yojson x.lambda_version));
    ]

let custom_sms_sender_lambda_version_type_to_yojson (x : custom_sms_sender_lambda_version_type) =
  match x with V1_0 -> `String "V1_0"

let custom_sms_lambda_version_config_type_to_yojson (x : custom_sms_lambda_version_config_type) =
  assoc_to_yojson
    [
      ("LambdaArn", Some (arn_type_to_yojson x.lambda_arn));
      ("LambdaVersion", Some (custom_sms_sender_lambda_version_type_to_yojson x.lambda_version));
    ]

let custom_email_sender_lambda_version_type_to_yojson (x : custom_email_sender_lambda_version_type)
    =
  match x with V1_0 -> `String "V1_0"

let custom_email_lambda_version_config_type_to_yojson (x : custom_email_lambda_version_config_type)
    =
  assoc_to_yojson
    [
      ("LambdaArn", Some (arn_type_to_yojson x.lambda_arn));
      ("LambdaVersion", Some (custom_email_sender_lambda_version_type_to_yojson x.lambda_version));
    ]

let inbound_federation_lambda_version_type_to_yojson (x : inbound_federation_lambda_version_type) =
  match x with V1_0 -> `String "V1_0"

let inbound_federation_lambda_type_to_yojson (x : inbound_federation_lambda_type) =
  assoc_to_yojson
    [
      ("LambdaArn", Some (arn_type_to_yojson x.lambda_arn));
      ("LambdaVersion", Some (inbound_federation_lambda_version_type_to_yojson x.lambda_version));
    ]

let lambda_config_type_to_yojson (x : lambda_config_type) =
  assoc_to_yojson
    [
      ( "InboundFederation",
        option_to_yojson inbound_federation_lambda_type_to_yojson x.inbound_federation );
      ("KMSKeyID", option_to_yojson arn_type_to_yojson x.kms_key_i_d);
      ( "CustomEmailSender",
        option_to_yojson custom_email_lambda_version_config_type_to_yojson x.custom_email_sender );
      ( "CustomSMSSender",
        option_to_yojson custom_sms_lambda_version_config_type_to_yojson x.custom_sms_sender );
      ( "PreTokenGenerationConfig",
        option_to_yojson pre_token_generation_version_config_type_to_yojson
          x.pre_token_generation_config );
      ("UserMigration", option_to_yojson arn_type_to_yojson x.user_migration);
      ("PreTokenGeneration", option_to_yojson arn_type_to_yojson x.pre_token_generation);
      ( "VerifyAuthChallengeResponse",
        option_to_yojson arn_type_to_yojson x.verify_auth_challenge_response );
      ("CreateAuthChallenge", option_to_yojson arn_type_to_yojson x.create_auth_challenge);
      ("DefineAuthChallenge", option_to_yojson arn_type_to_yojson x.define_auth_challenge);
      ("PostAuthentication", option_to_yojson arn_type_to_yojson x.post_authentication);
      ("PreAuthentication", option_to_yojson arn_type_to_yojson x.pre_authentication);
      ("PostConfirmation", option_to_yojson arn_type_to_yojson x.post_confirmation);
      ("CustomMessage", option_to_yojson arn_type_to_yojson x.custom_message);
      ("PreSignUp", option_to_yojson arn_type_to_yojson x.pre_sign_up);
    ]

let status_type_to_yojson (x : status_type) =
  match x with Disabled -> `String "Disabled" | Enabled -> `String "Enabled"

let custom_attribute_name_type_to_yojson = string_to_yojson

let attribute_data_type_to_yojson (x : attribute_data_type) =
  match x with
  | BOOLEAN -> `String "Boolean"
  | DATETIME -> `String "DateTime"
  | NUMBER -> `String "Number"
  | STRING -> `String "String"

let number_attribute_constraints_type_to_yojson (x : number_attribute_constraints_type) =
  assoc_to_yojson
    [
      ("MaxValue", option_to_yojson string_type_to_yojson x.max_value);
      ("MinValue", option_to_yojson string_type_to_yojson x.min_value);
    ]

let string_attribute_constraints_type_to_yojson (x : string_attribute_constraints_type) =
  assoc_to_yojson
    [
      ("MaxLength", option_to_yojson string_type_to_yojson x.max_length);
      ("MinLength", option_to_yojson string_type_to_yojson x.min_length);
    ]

let schema_attribute_type_to_yojson (x : schema_attribute_type) =
  assoc_to_yojson
    [
      ( "StringAttributeConstraints",
        option_to_yojson string_attribute_constraints_type_to_yojson x.string_attribute_constraints
      );
      ( "NumberAttributeConstraints",
        option_to_yojson number_attribute_constraints_type_to_yojson x.number_attribute_constraints
      );
      ("Required", option_to_yojson boolean_type_to_yojson x.required);
      ("Mutable", option_to_yojson boolean_type_to_yojson x.\#mutable);
      ("DeveloperOnlyAttribute", option_to_yojson boolean_type_to_yojson x.developer_only_attribute);
      ("AttributeDataType", option_to_yojson attribute_data_type_to_yojson x.attribute_data_type);
      ("Name", option_to_yojson custom_attribute_name_type_to_yojson x.name);
    ]

let schema_attributes_list_type_to_yojson tree = list_to_yojson schema_attribute_type_to_yojson tree

let alias_attribute_type_to_yojson (x : alias_attribute_type) =
  match x with
  | PREFERRED_USERNAME -> `String "preferred_username"
  | EMAIL -> `String "email"
  | PHONE_NUMBER -> `String "phone_number"

let alias_attributes_list_type_to_yojson tree = list_to_yojson alias_attribute_type_to_yojson tree

let attributes_require_verification_before_update_type_to_yojson tree =
  list_to_yojson verified_attribute_type_to_yojson tree

let user_attribute_update_settings_type_to_yojson (x : user_attribute_update_settings_type) =
  assoc_to_yojson
    [
      ( "AttributesRequireVerificationBeforeUpdate",
        option_to_yojson attributes_require_verification_before_update_type_to_yojson
          x.attributes_require_verification_before_update );
    ]

let user_pool_mfa_type_to_yojson (x : user_pool_mfa_type) =
  match x with OPTIONAL -> `String "OPTIONAL" | ON -> `String "ON" | OFF -> `String "OFF"

let device_configuration_type_to_yojson (x : device_configuration_type) =
  assoc_to_yojson
    [
      ( "DeviceOnlyRememberedOnUserPrompt",
        option_to_yojson boolean_type_to_yojson x.device_only_remembered_on_user_prompt );
      ( "ChallengeRequiredOnNewDevice",
        option_to_yojson boolean_type_to_yojson x.challenge_required_on_new_device );
    ]

let integer_type_to_yojson = int_to_yojson
let email_address_type_to_yojson = string_to_yojson

let email_sending_account_type_to_yojson (x : email_sending_account_type) =
  match x with DEVELOPER -> `String "DEVELOPER" | COGNITO_DEFAULT -> `String "COGNITO_DEFAULT"

let ses_configuration_set_to_yojson = string_to_yojson

let email_configuration_type_to_yojson (x : email_configuration_type) =
  assoc_to_yojson
    [
      ("ConfigurationSet", option_to_yojson ses_configuration_set_to_yojson x.configuration_set);
      ("From", option_to_yojson string_type_to_yojson x.from_);
      ( "EmailSendingAccount",
        option_to_yojson email_sending_account_type_to_yojson x.email_sending_account );
      ("ReplyToEmailAddress", option_to_yojson email_address_type_to_yojson x.reply_to_email_address);
      ("SourceArn", option_to_yojson arn_type_to_yojson x.source_arn);
    ]

let region_code_type_to_yojson = string_to_yojson

let sms_configuration_type_to_yojson (x : sms_configuration_type) =
  assoc_to_yojson
    [
      ("SnsRegion", option_to_yojson region_code_type_to_yojson x.sns_region);
      ("ExternalId", option_to_yojson string_type_to_yojson x.external_id);
      ("SnsCallerArn", Some (arn_type_to_yojson x.sns_caller_arn));
    ]

let tag_value_type_to_yojson = string_to_yojson
let tag_keys_type_to_yojson = string_to_yojson

let user_pool_tags_type_to_yojson tree =
  map_to_yojson tag_keys_type_to_yojson tag_value_type_to_yojson tree

let domain_type_to_yojson = string_to_yojson
let admin_create_user_unused_account_validity_days_type_to_yojson = int_to_yojson
let sms_invite_message_type_to_yojson = string_to_yojson
let email_invite_message_type_to_yojson = string_to_yojson

let message_template_type_to_yojson (x : message_template_type) =
  assoc_to_yojson
    [
      ("EmailSubject", option_to_yojson email_verification_subject_type_to_yojson x.email_subject);
      ("EmailMessage", option_to_yojson email_invite_message_type_to_yojson x.email_message);
      ("SMSMessage", option_to_yojson sms_invite_message_type_to_yojson x.sms_message);
    ]

let admin_create_user_config_type_to_yojson (x : admin_create_user_config_type) =
  assoc_to_yojson
    [
      ( "InviteMessageTemplate",
        option_to_yojson message_template_type_to_yojson x.invite_message_template );
      ( "UnusedAccountValidityDays",
        option_to_yojson admin_create_user_unused_account_validity_days_type_to_yojson
          x.unused_account_validity_days );
      ( "AllowAdminCreateUserOnly",
        option_to_yojson boolean_type_to_yojson x.allow_admin_create_user_only );
    ]

let advanced_security_mode_type_to_yojson (x : advanced_security_mode_type) =
  match x with ENFORCED -> `String "ENFORCED" | AUDIT -> `String "AUDIT" | OFF -> `String "OFF"

let advanced_security_enabled_mode_type_to_yojson (x : advanced_security_enabled_mode_type) =
  match x with ENFORCED -> `String "ENFORCED" | AUDIT -> `String "AUDIT"

let advanced_security_additional_flows_type_to_yojson (x : advanced_security_additional_flows_type)
    =
  assoc_to_yojson
    [
      ( "CustomAuthMode",
        option_to_yojson advanced_security_enabled_mode_type_to_yojson x.custom_auth_mode );
    ]

let user_pool_add_ons_type_to_yojson (x : user_pool_add_ons_type) =
  assoc_to_yojson
    [
      ( "AdvancedSecurityAdditionalFlows",
        option_to_yojson advanced_security_additional_flows_type_to_yojson
          x.advanced_security_additional_flows );
      ("AdvancedSecurityMode", Some (advanced_security_mode_type_to_yojson x.advanced_security_mode));
    ]

let priority_type_to_yojson = int_to_yojson

let recovery_option_name_type_to_yojson (x : recovery_option_name_type) =
  match x with
  | ADMIN_ONLY -> `String "admin_only"
  | VERIFIED_PHONE_NUMBER -> `String "verified_phone_number"
  | VERIFIED_EMAIL -> `String "verified_email"

let recovery_option_type_to_yojson (x : recovery_option_type) =
  assoc_to_yojson
    [
      ("Name", Some (recovery_option_name_type_to_yojson x.name));
      ("Priority", Some (priority_type_to_yojson x.priority));
    ]

let recovery_mechanisms_type_to_yojson tree = list_to_yojson recovery_option_type_to_yojson tree

let account_recovery_setting_type_to_yojson (x : account_recovery_setting_type) =
  assoc_to_yojson
    [
      ( "RecoveryMechanisms",
        option_to_yojson recovery_mechanisms_type_to_yojson x.recovery_mechanisms );
    ]

let user_pool_tier_type_to_yojson (x : user_pool_tier_type) =
  match x with
  | PLUS -> `String "PLUS"
  | ESSENTIALS -> `String "ESSENTIALS"
  | LITE -> `String "LITE"

let encryption_key_type_to_yojson (x : encryption_key_type) =
  match x with
  | CUSTOMER_MANAGED_KEY -> `String "CUSTOMER_MANAGED_KEY"
  | AWS_OWNED_KEY -> `String "AWS_OWNED_KEY"

let encryption_key_arn_type_to_yojson = string_to_yojson

let key_configuration_type_to_yojson (x : key_configuration_type) =
  assoc_to_yojson
    [
      ("KmsKeyArn", option_to_yojson encryption_key_arn_type_to_yojson x.kms_key_arn);
      ("KeyType", option_to_yojson encryption_key_type_to_yojson x.key_type);
    ]

let issuer_type_to_yojson (x : issuer_type) =
  match x with UPDATED -> `String "UPDATED" | ORIGINAL -> `String "ORIGINAL"

let issuer_configuration_type_to_yojson (x : issuer_configuration_type) =
  assoc_to_yojson [ ("Type", option_to_yojson issuer_type_to_yojson x.type_) ]

let user_pool_type_to_yojson (x : user_pool_type) =
  assoc_to_yojson
    [
      ( "IssuerConfiguration",
        option_to_yojson issuer_configuration_type_to_yojson x.issuer_configuration );
      ("KeyConfiguration", option_to_yojson key_configuration_type_to_yojson x.key_configuration);
      ("UserPoolTier", option_to_yojson user_pool_tier_type_to_yojson x.user_pool_tier);
      ( "AccountRecoverySetting",
        option_to_yojson account_recovery_setting_type_to_yojson x.account_recovery_setting );
      ("Arn", option_to_yojson arn_type_to_yojson x.arn);
      ( "UsernameConfiguration",
        option_to_yojson username_configuration_type_to_yojson x.username_configuration );
      ("UserPoolAddOns", option_to_yojson user_pool_add_ons_type_to_yojson x.user_pool_add_ons);
      ( "AdminCreateUserConfig",
        option_to_yojson admin_create_user_config_type_to_yojson x.admin_create_user_config );
      ("CustomDomain", option_to_yojson domain_type_to_yojson x.custom_domain);
      ("Domain", option_to_yojson domain_type_to_yojson x.domain);
      ( "EmailConfigurationFailure",
        option_to_yojson string_type_to_yojson x.email_configuration_failure );
      ("SmsConfigurationFailure", option_to_yojson string_type_to_yojson x.sms_configuration_failure);
      ("UserPoolTags", option_to_yojson user_pool_tags_type_to_yojson x.user_pool_tags);
      ("SmsConfiguration", option_to_yojson sms_configuration_type_to_yojson x.sms_configuration);
      ( "EmailConfiguration",
        option_to_yojson email_configuration_type_to_yojson x.email_configuration );
      ("EstimatedNumberOfUsers", option_to_yojson integer_type_to_yojson x.estimated_number_of_users);
      ( "DeviceConfiguration",
        option_to_yojson device_configuration_type_to_yojson x.device_configuration );
      ("MfaConfiguration", option_to_yojson user_pool_mfa_type_to_yojson x.mfa_configuration);
      ( "UserAttributeUpdateSettings",
        option_to_yojson user_attribute_update_settings_type_to_yojson
          x.user_attribute_update_settings );
      ( "SmsAuthenticationMessage",
        option_to_yojson sms_verification_message_type_to_yojson x.sms_authentication_message );
      ( "VerificationMessageTemplate",
        option_to_yojson verification_message_template_type_to_yojson
          x.verification_message_template );
      ( "EmailVerificationSubject",
        option_to_yojson email_verification_subject_type_to_yojson x.email_verification_subject );
      ( "EmailVerificationMessage",
        option_to_yojson email_verification_message_type_to_yojson x.email_verification_message );
      ( "SmsVerificationMessage",
        option_to_yojson sms_verification_message_type_to_yojson x.sms_verification_message );
      ( "UsernameAttributes",
        option_to_yojson username_attributes_list_type_to_yojson x.username_attributes );
      ("AliasAttributes", option_to_yojson alias_attributes_list_type_to_yojson x.alias_attributes);
      ( "AutoVerifiedAttributes",
        option_to_yojson verified_attributes_list_type_to_yojson x.auto_verified_attributes );
      ( "SchemaAttributes",
        option_to_yojson schema_attributes_list_type_to_yojson x.schema_attributes );
      ("CreationDate", option_to_yojson date_type_to_yojson x.creation_date);
      ("LastModifiedDate", option_to_yojson date_type_to_yojson x.last_modified_date);
      ("Status", option_to_yojson status_type_to_yojson x.status);
      ("LambdaConfig", option_to_yojson lambda_config_type_to_yojson x.lambda_config);
      ( "DeletionProtection",
        option_to_yojson deletion_protection_type_to_yojson x.deletion_protection );
      ("Policies", option_to_yojson user_pool_policy_type_to_yojson x.policies);
      ("Name", option_to_yojson user_pool_name_type_to_yojson x.name);
      ("Id", option_to_yojson user_pool_id_type_to_yojson x.id);
    ]

let user_pool_tags_list_type_to_yojson tree = list_to_yojson tag_keys_type_to_yojson tree

let user_pool_tagging_exception_to_yojson (x : user_pool_tagging_exception) =
  assoc_to_yojson [ ("message", option_to_yojson message_type_to_yojson x.message) ]

let region_name_type_to_yojson = string_to_yojson

let replica_status_type_to_yojson (x : replica_status_type) =
  match x with
  | DELETING -> `String "DELETING"
  | INACTIVE -> `String "INACTIVE"
  | ACTIVE -> `String "ACTIVE"
  | CREATING -> `String "CREATING"

let replica_role_type_to_yojson (x : replica_role_type) =
  match x with SECONDARY -> `String "SECONDARY" | PRIMARY -> `String "PRIMARY"

let user_pool_replica_type_to_yojson (x : user_pool_replica_type) =
  assoc_to_yojson
    [
      ("UserPoolArn", option_to_yojson arn_type_to_yojson x.user_pool_arn);
      ("Role", option_to_yojson replica_role_type_to_yojson x.role);
      ("Status", option_to_yojson replica_status_type_to_yojson x.status);
      ("RegionName", option_to_yojson region_name_type_to_yojson x.region_name);
    ]

let user_pool_replica_list_type_to_yojson tree =
  list_to_yojson user_pool_replica_type_to_yojson tree

let replica_regions_type_to_yojson tree = list_to_yojson string_type_to_yojson tree

let user_pool_description_type_to_yojson (x : user_pool_description_type) =
  assoc_to_yojson
    [
      ("ReplicaRegions", option_to_yojson replica_regions_type_to_yojson x.replica_regions);
      ("CreationDate", option_to_yojson date_type_to_yojson x.creation_date);
      ("LastModifiedDate", option_to_yojson date_type_to_yojson x.last_modified_date);
      ("Status", option_to_yojson status_type_to_yojson x.status);
      ("LambdaConfig", option_to_yojson lambda_config_type_to_yojson x.lambda_config);
      ("Name", option_to_yojson user_pool_name_type_to_yojson x.name);
      ("Id", option_to_yojson user_pool_id_type_to_yojson x.id);
    ]

let user_pool_list_type_to_yojson tree = list_to_yojson user_pool_description_type_to_yojson tree
let client_name_type_to_yojson = string_to_yojson
let client_id_type_to_yojson = string_to_yojson
let client_secret_type_to_yojson = string_to_yojson
let refresh_token_validity_type_to_yojson = int_to_yojson
let access_token_validity_type_to_yojson = int_to_yojson
let id_token_validity_type_to_yojson = int_to_yojson

let time_units_type_to_yojson (x : time_units_type) =
  match x with
  | DAYS -> `String "days"
  | HOURS -> `String "hours"
  | MINUTES -> `String "minutes"
  | SECONDS -> `String "seconds"

let token_validity_units_type_to_yojson (x : token_validity_units_type) =
  assoc_to_yojson
    [
      ("RefreshToken", option_to_yojson time_units_type_to_yojson x.refresh_token);
      ("IdToken", option_to_yojson time_units_type_to_yojson x.id_token);
      ("AccessToken", option_to_yojson time_units_type_to_yojson x.access_token);
    ]

let client_permission_type_to_yojson = string_to_yojson

let client_permission_list_type_to_yojson tree =
  list_to_yojson client_permission_type_to_yojson tree

let explicit_auth_flows_type_to_yojson (x : explicit_auth_flows_type) =
  match x with
  | ALLOW_USER_AUTH -> `String "ALLOW_USER_AUTH"
  | ALLOW_REFRESH_TOKEN_AUTH -> `String "ALLOW_REFRESH_TOKEN_AUTH"
  | ALLOW_USER_SRP_AUTH -> `String "ALLOW_USER_SRP_AUTH"
  | ALLOW_USER_PASSWORD_AUTH -> `String "ALLOW_USER_PASSWORD_AUTH"
  | ALLOW_CUSTOM_AUTH -> `String "ALLOW_CUSTOM_AUTH"
  | ALLOW_ADMIN_USER_PASSWORD_AUTH -> `String "ALLOW_ADMIN_USER_PASSWORD_AUTH"
  | USER_PASSWORD_AUTH -> `String "USER_PASSWORD_AUTH"
  | CUSTOM_AUTH_FLOW_ONLY -> `String "CUSTOM_AUTH_FLOW_ONLY"
  | ADMIN_NO_SRP_AUTH -> `String "ADMIN_NO_SRP_AUTH"

let explicit_auth_flows_list_type_to_yojson tree =
  list_to_yojson explicit_auth_flows_type_to_yojson tree

let provider_name_type_to_yojson = string_to_yojson

let supported_identity_providers_list_type_to_yojson tree =
  list_to_yojson provider_name_type_to_yojson tree

let redirect_url_type_to_yojson = string_to_yojson
let callback_ur_ls_list_type_to_yojson tree = list_to_yojson redirect_url_type_to_yojson tree
let logout_ur_ls_list_type_to_yojson tree = list_to_yojson redirect_url_type_to_yojson tree

let o_auth_flow_type_to_yojson (x : o_auth_flow_type) =
  match x with
  | Client_credentials -> `String "client_credentials"
  | Implicit -> `String "implicit"
  | Code -> `String "code"

let o_auth_flows_type_to_yojson tree = list_to_yojson o_auth_flow_type_to_yojson tree
let scope_type_to_yojson = string_to_yojson
let scope_list_type_to_yojson tree = list_to_yojson scope_type_to_yojson tree
let hex_string_type_to_yojson = string_to_yojson

let analytics_configuration_type_to_yojson (x : analytics_configuration_type) =
  assoc_to_yojson
    [
      ("UserDataShared", option_to_yojson boolean_type_to_yojson x.user_data_shared);
      ("ExternalId", option_to_yojson string_type_to_yojson x.external_id);
      ("RoleArn", option_to_yojson arn_type_to_yojson x.role_arn);
      ("ApplicationArn", option_to_yojson arn_type_to_yojson x.application_arn);
      ("ApplicationId", option_to_yojson hex_string_type_to_yojson x.application_id);
    ]

let prevent_user_existence_error_types_to_yojson (x : prevent_user_existence_error_types) =
  match x with ENABLED -> `String "ENABLED" | LEGACY -> `String "LEGACY"

let auth_session_validity_type_to_yojson = int_to_yojson

let feature_type_to_yojson (x : feature_type) =
  match x with DISABLED -> `String "DISABLED" | ENABLED -> `String "ENABLED"

let retry_grace_period_seconds_type_to_yojson = int_to_yojson

let refresh_token_rotation_type_to_yojson (x : refresh_token_rotation_type) =
  assoc_to_yojson
    [
      ( "RetryGracePeriodSeconds",
        option_to_yojson retry_grace_period_seconds_type_to_yojson x.retry_grace_period_seconds );
      ("Feature", Some (feature_type_to_yojson x.feature));
    ]

let user_pool_client_type_to_yojson (x : user_pool_client_type) =
  assoc_to_yojson
    [
      ( "RefreshTokenRotation",
        option_to_yojson refresh_token_rotation_type_to_yojson x.refresh_token_rotation );
      ( "AuthSessionValidity",
        option_to_yojson auth_session_validity_type_to_yojson x.auth_session_validity );
      ( "EnablePropagateAdditionalUserContextData",
        option_to_yojson wrapped_boolean_type_to_yojson
          x.enable_propagate_additional_user_context_data );
      ( "EnableTokenRevocation",
        option_to_yojson wrapped_boolean_type_to_yojson x.enable_token_revocation );
      ( "PreventUserExistenceErrors",
        option_to_yojson prevent_user_existence_error_types_to_yojson
          x.prevent_user_existence_errors );
      ( "AnalyticsConfiguration",
        option_to_yojson analytics_configuration_type_to_yojson x.analytics_configuration );
      ( "AllowedOAuthFlowsUserPoolClient",
        option_to_yojson boolean_type_to_yojson x.allowed_o_auth_flows_user_pool_client );
      ("AllowedOAuthScopes", option_to_yojson scope_list_type_to_yojson x.allowed_o_auth_scopes);
      ("AllowedOAuthFlows", option_to_yojson o_auth_flows_type_to_yojson x.allowed_o_auth_flows);
      ("DefaultRedirectURI", option_to_yojson redirect_url_type_to_yojson x.default_redirect_ur_i);
      ("LogoutURLs", option_to_yojson logout_ur_ls_list_type_to_yojson x.logout_ur_ls);
      ("CallbackURLs", option_to_yojson callback_ur_ls_list_type_to_yojson x.callback_ur_ls);
      ( "SupportedIdentityProviders",
        option_to_yojson supported_identity_providers_list_type_to_yojson
          x.supported_identity_providers );
      ( "ExplicitAuthFlows",
        option_to_yojson explicit_auth_flows_list_type_to_yojson x.explicit_auth_flows );
      ("WriteAttributes", option_to_yojson client_permission_list_type_to_yojson x.write_attributes);
      ("ReadAttributes", option_to_yojson client_permission_list_type_to_yojson x.read_attributes);
      ( "TokenValidityUnits",
        option_to_yojson token_validity_units_type_to_yojson x.token_validity_units );
      ("IdTokenValidity", option_to_yojson id_token_validity_type_to_yojson x.id_token_validity);
      ( "AccessTokenValidity",
        option_to_yojson access_token_validity_type_to_yojson x.access_token_validity );
      ( "RefreshTokenValidity",
        option_to_yojson refresh_token_validity_type_to_yojson x.refresh_token_validity );
      ("CreationDate", option_to_yojson date_type_to_yojson x.creation_date);
      ("LastModifiedDate", option_to_yojson date_type_to_yojson x.last_modified_date);
      ("ClientSecret", option_to_yojson client_secret_type_to_yojson x.client_secret);
      ("ClientId", option_to_yojson client_id_type_to_yojson x.client_id);
      ("ClientName", option_to_yojson client_name_type_to_yojson x.client_name);
      ("UserPoolId", option_to_yojson user_pool_id_type_to_yojson x.user_pool_id);
    ]

let user_pool_client_description_to_yojson (x : user_pool_client_description) =
  assoc_to_yojson
    [
      ("ClientName", option_to_yojson client_name_type_to_yojson x.client_name);
      ("UserPoolId", option_to_yojson user_pool_id_type_to_yojson x.user_pool_id);
      ("ClientId", option_to_yojson client_id_type_to_yojson x.client_id);
    ]

let user_pool_client_list_type_to_yojson tree =
  list_to_yojson user_pool_client_description_to_yojson tree

let user_pool_add_on_not_enabled_exception_to_yojson (x : user_pool_add_on_not_enabled_exception) =
  assoc_to_yojson [ ("message", option_to_yojson message_type_to_yojson x.message) ]

let user_mfa_setting_list_type_to_yojson tree = list_to_yojson string_type_to_yojson tree

let user_lambda_validation_exception_to_yojson (x : user_lambda_validation_exception) =
  assoc_to_yojson [ ("message", option_to_yojson message_type_to_yojson x.message) ]

let user_import_job_name_type_to_yojson = string_to_yojson
let user_import_job_id_type_to_yojson = string_to_yojson
let pre_signed_url_type_to_yojson = string_to_yojson

let user_import_job_status_type_to_yojson (x : user_import_job_status_type) =
  match x with
  | Succeeded -> `String "Succeeded"
  | Failed -> `String "Failed"
  | Stopped -> `String "Stopped"
  | Expired -> `String "Expired"
  | Stopping -> `String "Stopping"
  | InProgress -> `String "InProgress"
  | Pending -> `String "Pending"
  | Created -> `String "Created"

let long_type_to_yojson = long_to_yojson
let completion_message_type_to_yojson = string_to_yojson

let user_import_job_type_to_yojson (x : user_import_job_type) =
  assoc_to_yojson
    [
      ("CompletionMessage", option_to_yojson completion_message_type_to_yojson x.completion_message);
      ("FailedUsers", option_to_yojson long_type_to_yojson x.failed_users);
      ("SkippedUsers", option_to_yojson long_type_to_yojson x.skipped_users);
      ("ImportedUsers", option_to_yojson long_type_to_yojson x.imported_users);
      ("CloudWatchLogsRoleArn", option_to_yojson arn_type_to_yojson x.cloud_watch_logs_role_arn);
      ("Status", option_to_yojson user_import_job_status_type_to_yojson x.status);
      ("CompletionDate", option_to_yojson date_type_to_yojson x.completion_date);
      ("StartDate", option_to_yojson date_type_to_yojson x.start_date);
      ("CreationDate", option_to_yojson date_type_to_yojson x.creation_date);
      ("PreSignedUrl", option_to_yojson pre_signed_url_type_to_yojson x.pre_signed_url);
      ("UserPoolId", option_to_yojson user_pool_id_type_to_yojson x.user_pool_id);
      ("JobId", option_to_yojson user_import_job_id_type_to_yojson x.job_id);
      ("JobName", option_to_yojson user_import_job_name_type_to_yojson x.job_name);
    ]

let user_import_jobs_list_type_to_yojson tree = list_to_yojson user_import_job_type_to_yojson tree

let user_import_in_progress_exception_to_yojson (x : user_import_in_progress_exception) =
  assoc_to_yojson [ ("message", option_to_yojson message_type_to_yojson x.message) ]

let user_filter_type_to_yojson = string_to_yojson

let user_context_data_type_to_yojson (x : user_context_data_type) =
  assoc_to_yojson
    [
      ("EncodedData", option_to_yojson string_type_to_yojson x.encoded_data);
      ("IpAddress", option_to_yojson string_type_to_yojson x.ip_address);
    ]

let update_user_pool_response_to_yojson = unit_to_yojson

let update_user_pool_request_to_yojson (x : update_user_pool_request) =
  assoc_to_yojson
    [
      ( "IssuerConfiguration",
        option_to_yojson issuer_configuration_type_to_yojson x.issuer_configuration );
      ("KeyConfiguration", option_to_yojson key_configuration_type_to_yojson x.key_configuration);
      ("UserPoolTier", option_to_yojson user_pool_tier_type_to_yojson x.user_pool_tier);
      ("PoolName", option_to_yojson user_pool_name_type_to_yojson x.pool_name);
      ( "AccountRecoverySetting",
        option_to_yojson account_recovery_setting_type_to_yojson x.account_recovery_setting );
      ("UserPoolAddOns", option_to_yojson user_pool_add_ons_type_to_yojson x.user_pool_add_ons);
      ( "AdminCreateUserConfig",
        option_to_yojson admin_create_user_config_type_to_yojson x.admin_create_user_config );
      ("UserPoolTags", option_to_yojson user_pool_tags_type_to_yojson x.user_pool_tags);
      ("SmsConfiguration", option_to_yojson sms_configuration_type_to_yojson x.sms_configuration);
      ( "EmailConfiguration",
        option_to_yojson email_configuration_type_to_yojson x.email_configuration );
      ( "DeviceConfiguration",
        option_to_yojson device_configuration_type_to_yojson x.device_configuration );
      ("MfaConfiguration", option_to_yojson user_pool_mfa_type_to_yojson x.mfa_configuration);
      ( "UserAttributeUpdateSettings",
        option_to_yojson user_attribute_update_settings_type_to_yojson
          x.user_attribute_update_settings );
      ( "SmsAuthenticationMessage",
        option_to_yojson sms_verification_message_type_to_yojson x.sms_authentication_message );
      ( "VerificationMessageTemplate",
        option_to_yojson verification_message_template_type_to_yojson
          x.verification_message_template );
      ( "EmailVerificationSubject",
        option_to_yojson email_verification_subject_type_to_yojson x.email_verification_subject );
      ( "EmailVerificationMessage",
        option_to_yojson email_verification_message_type_to_yojson x.email_verification_message );
      ( "SmsVerificationMessage",
        option_to_yojson sms_verification_message_type_to_yojson x.sms_verification_message );
      ( "AutoVerifiedAttributes",
        option_to_yojson verified_attributes_list_type_to_yojson x.auto_verified_attributes );
      ("LambdaConfig", option_to_yojson lambda_config_type_to_yojson x.lambda_config);
      ( "DeletionProtection",
        option_to_yojson deletion_protection_type_to_yojson x.deletion_protection );
      ("Policies", option_to_yojson user_pool_policy_type_to_yojson x.policies);
      ("UserPoolId", Some (user_pool_id_type_to_yojson x.user_pool_id));
    ]

let update_user_pool_replica_response_to_yojson (x : update_user_pool_replica_response) =
  assoc_to_yojson
    [ ("UserPoolReplica", option_to_yojson user_pool_replica_type_to_yojson x.user_pool_replica) ]

let update_replica_status_type_to_yojson (x : update_replica_status_type) =
  match x with INACTIVE -> `String "INACTIVE" | ACTIVE -> `String "ACTIVE"

let update_user_pool_replica_request_to_yojson (x : update_user_pool_replica_request) =
  assoc_to_yojson
    [
      ("Status", Some (update_replica_status_type_to_yojson x.status));
      ("RegionName", Some (region_name_type_to_yojson x.region_name));
      ("UserPoolId", Some (user_pool_id_type_to_yojson x.user_pool_id));
    ]

let health_check_id_type_to_yojson = string_to_yojson

let failover_type_to_yojson (x : failover_type) =
  assoc_to_yojson
    [
      ( "PrimaryRoute53HealthCheckId",
        Some (health_check_id_type_to_yojson x.primary_route53_health_check_id) );
      ("SecondaryRegion", Some (region_name_type_to_yojson x.secondary_region));
    ]

let routing_type_to_yojson (x : routing_type) =
  assoc_to_yojson [ ("Failover", option_to_yojson failover_type_to_yojson x.failover) ]

let update_user_pool_domain_response_to_yojson (x : update_user_pool_domain_response) =
  assoc_to_yojson
    [
      ("Routing", option_to_yojson routing_type_to_yojson x.routing);
      ("CloudFrontDomain", option_to_yojson domain_type_to_yojson x.cloud_front_domain);
      ( "ManagedLoginVersion",
        option_to_yojson wrapped_integer_type_to_yojson x.managed_login_version );
    ]

let security_policy_type_to_yojson (x : security_policy_type) =
  match x with
  | TLS_V1_3_2025 -> `String "TLS_V1_3_2025"
  | TLS_V1_2_2021 -> `String "TLS_V1_2_2021"
  | TLS_V1 -> `String "TLS_V1"

let custom_domain_config_type_to_yojson (x : custom_domain_config_type) =
  assoc_to_yojson
    [
      ("SecurityPolicy", option_to_yojson security_policy_type_to_yojson x.security_policy);
      ("CertificateArn", Some (arn_type_to_yojson x.certificate_arn));
    ]

let update_user_pool_domain_request_to_yojson (x : update_user_pool_domain_request) =
  assoc_to_yojson
    [
      ("Routing", option_to_yojson routing_type_to_yojson x.routing);
      ( "CustomDomainConfig",
        option_to_yojson custom_domain_config_type_to_yojson x.custom_domain_config );
      ( "ManagedLoginVersion",
        option_to_yojson wrapped_integer_type_to_yojson x.managed_login_version );
      ("UserPoolId", Some (user_pool_id_type_to_yojson x.user_pool_id));
      ("Domain", Some (domain_type_to_yojson x.domain));
    ]

let feature_unavailable_in_tier_exception_to_yojson (x : feature_unavailable_in_tier_exception) =
  assoc_to_yojson [ ("message", option_to_yojson message_type_to_yojson x.message) ]

let concurrent_modification_exception_to_yojson (x : concurrent_modification_exception) =
  assoc_to_yojson [ ("message", option_to_yojson message_type_to_yojson x.message) ]

let update_user_pool_client_response_to_yojson (x : update_user_pool_client_response) =
  assoc_to_yojson
    [ ("UserPoolClient", option_to_yojson user_pool_client_type_to_yojson x.user_pool_client) ]

let update_user_pool_client_request_to_yojson (x : update_user_pool_client_request) =
  assoc_to_yojson
    [
      ( "RefreshTokenRotation",
        option_to_yojson refresh_token_rotation_type_to_yojson x.refresh_token_rotation );
      ( "AuthSessionValidity",
        option_to_yojson auth_session_validity_type_to_yojson x.auth_session_validity );
      ( "EnablePropagateAdditionalUserContextData",
        option_to_yojson wrapped_boolean_type_to_yojson
          x.enable_propagate_additional_user_context_data );
      ( "EnableTokenRevocation",
        option_to_yojson wrapped_boolean_type_to_yojson x.enable_token_revocation );
      ( "PreventUserExistenceErrors",
        option_to_yojson prevent_user_existence_error_types_to_yojson
          x.prevent_user_existence_errors );
      ( "AnalyticsConfiguration",
        option_to_yojson analytics_configuration_type_to_yojson x.analytics_configuration );
      ( "AllowedOAuthFlowsUserPoolClient",
        option_to_yojson boolean_type_to_yojson x.allowed_o_auth_flows_user_pool_client );
      ("AllowedOAuthScopes", option_to_yojson scope_list_type_to_yojson x.allowed_o_auth_scopes);
      ("AllowedOAuthFlows", option_to_yojson o_auth_flows_type_to_yojson x.allowed_o_auth_flows);
      ("DefaultRedirectURI", option_to_yojson redirect_url_type_to_yojson x.default_redirect_ur_i);
      ("LogoutURLs", option_to_yojson logout_ur_ls_list_type_to_yojson x.logout_ur_ls);
      ("CallbackURLs", option_to_yojson callback_ur_ls_list_type_to_yojson x.callback_ur_ls);
      ( "SupportedIdentityProviders",
        option_to_yojson supported_identity_providers_list_type_to_yojson
          x.supported_identity_providers );
      ( "ExplicitAuthFlows",
        option_to_yojson explicit_auth_flows_list_type_to_yojson x.explicit_auth_flows );
      ("WriteAttributes", option_to_yojson client_permission_list_type_to_yojson x.write_attributes);
      ("ReadAttributes", option_to_yojson client_permission_list_type_to_yojson x.read_attributes);
      ( "TokenValidityUnits",
        option_to_yojson token_validity_units_type_to_yojson x.token_validity_units );
      ("IdTokenValidity", option_to_yojson id_token_validity_type_to_yojson x.id_token_validity);
      ( "AccessTokenValidity",
        option_to_yojson access_token_validity_type_to_yojson x.access_token_validity );
      ( "RefreshTokenValidity",
        option_to_yojson refresh_token_validity_type_to_yojson x.refresh_token_validity );
      ("ClientName", option_to_yojson client_name_type_to_yojson x.client_name);
      ("ClientId", Some (client_id_type_to_yojson x.client_id));
      ("UserPoolId", Some (user_pool_id_type_to_yojson x.user_pool_id));
    ]

let scope_does_not_exist_exception_to_yojson (x : scope_does_not_exist_exception) =
  assoc_to_yojson [ ("message", option_to_yojson message_type_to_yojson x.message) ]

let invalid_o_auth_flow_exception_to_yojson (x : invalid_o_auth_flow_exception) =
  assoc_to_yojson [ ("message", option_to_yojson message_type_to_yojson x.message) ]

let tier_change_not_allowed_exception_to_yojson (x : tier_change_not_allowed_exception) =
  assoc_to_yojson [ ("message", option_to_yojson message_type_to_yojson x.message) ]

let invalid_sms_role_trust_relationship_exception_to_yojson
    (x : invalid_sms_role_trust_relationship_exception) =
  assoc_to_yojson [ ("message", option_to_yojson message_type_to_yojson x.message) ]

let invalid_sms_role_access_policy_exception_to_yojson
    (x : invalid_sms_role_access_policy_exception) =
  assoc_to_yojson [ ("message", option_to_yojson message_type_to_yojson x.message) ]

let invalid_email_role_access_policy_exception_to_yojson
    (x : invalid_email_role_access_policy_exception) =
  assoc_to_yojson [ ("message", option_to_yojson message_type_to_yojson x.message) ]

let code_delivery_details_type_to_yojson (x : code_delivery_details_type) =
  assoc_to_yojson
    [
      ("AttributeName", option_to_yojson attribute_name_type_to_yojson x.attribute_name);
      ("DeliveryMedium", option_to_yojson delivery_medium_type_to_yojson x.delivery_medium);
      ("Destination", option_to_yojson string_type_to_yojson x.destination);
    ]

let code_delivery_details_list_type_to_yojson tree =
  list_to_yojson code_delivery_details_type_to_yojson tree

let update_user_attributes_response_to_yojson (x : update_user_attributes_response) =
  assoc_to_yojson
    [
      ( "CodeDeliveryDetailsList",
        option_to_yojson code_delivery_details_list_type_to_yojson x.code_delivery_details_list );
    ]

let client_metadata_type_to_yojson tree =
  map_to_yojson string_type_to_yojson string_type_to_yojson tree

let update_user_attributes_request_to_yojson (x : update_user_attributes_request) =
  assoc_to_yojson
    [
      ("ClientMetadata", option_to_yojson client_metadata_type_to_yojson x.client_metadata);
      ("AccessToken", Some (token_model_type_to_yojson x.access_token));
      ("UserAttributes", Some (attribute_list_type_to_yojson x.user_attributes));
    ]

let unexpected_lambda_exception_to_yojson (x : unexpected_lambda_exception) =
  assoc_to_yojson [ ("message", option_to_yojson message_type_to_yojson x.message) ]

let invalid_lambda_response_exception_to_yojson (x : invalid_lambda_response_exception) =
  assoc_to_yojson [ ("message", option_to_yojson message_type_to_yojson x.message) ]

let code_delivery_failure_exception_to_yojson (x : code_delivery_failure_exception) =
  assoc_to_yojson [ ("message", option_to_yojson message_type_to_yojson x.message) ]

let terms_id_type_to_yojson = string_to_yojson
let terms_name_type_to_yojson = string_to_yojson
let terms_source_type_to_yojson (x : terms_source_type) = match x with LINK -> `String "LINK"

let terms_enforcement_type_to_yojson (x : terms_enforcement_type) =
  match x with NONE -> `String "NONE"

let link_url_type_to_yojson = string_to_yojson
let language_id_type_to_yojson = string_to_yojson

let links_type_to_yojson tree =
  map_to_yojson language_id_type_to_yojson link_url_type_to_yojson tree

let terms_type_to_yojson (x : terms_type) =
  assoc_to_yojson
    [
      ("LastModifiedDate", Some (date_type_to_yojson x.last_modified_date));
      ("CreationDate", Some (date_type_to_yojson x.creation_date));
      ("Links", Some (links_type_to_yojson x.links));
      ("Enforcement", Some (terms_enforcement_type_to_yojson x.enforcement));
      ("TermsSource", Some (terms_source_type_to_yojson x.terms_source));
      ("TermsName", Some (terms_name_type_to_yojson x.terms_name));
      ("ClientId", Some (client_id_type_to_yojson x.client_id));
      ("UserPoolId", Some (user_pool_id_type_to_yojson x.user_pool_id));
      ("TermsId", Some (terms_id_type_to_yojson x.terms_id));
    ]

let update_terms_response_to_yojson (x : update_terms_response) =
  assoc_to_yojson [ ("Terms", option_to_yojson terms_type_to_yojson x.terms) ]

let update_terms_request_to_yojson (x : update_terms_request) =
  assoc_to_yojson
    [
      ("Links", option_to_yojson links_type_to_yojson x.links);
      ("Enforcement", option_to_yojson terms_enforcement_type_to_yojson x.enforcement);
      ("TermsSource", option_to_yojson terms_source_type_to_yojson x.terms_source);
      ("TermsName", option_to_yojson terms_name_type_to_yojson x.terms_name);
      ("UserPoolId", Some (user_pool_id_type_to_yojson x.user_pool_id));
      ("TermsId", Some (terms_id_type_to_yojson x.terms_id));
    ]

let terms_exists_exception_to_yojson (x : terms_exists_exception) =
  assoc_to_yojson [ ("message", option_to_yojson message_type_to_yojson x.message) ]

let resource_server_identifier_type_to_yojson = string_to_yojson
let resource_server_name_type_to_yojson = string_to_yojson
let resource_server_scope_name_type_to_yojson = string_to_yojson
let resource_server_scope_description_type_to_yojson = string_to_yojson

let resource_server_scope_type_to_yojson (x : resource_server_scope_type) =
  assoc_to_yojson
    [
      ( "ScopeDescription",
        Some (resource_server_scope_description_type_to_yojson x.scope_description) );
      ("ScopeName", Some (resource_server_scope_name_type_to_yojson x.scope_name));
    ]

let resource_server_scope_list_type_to_yojson tree =
  list_to_yojson resource_server_scope_type_to_yojson tree

let resource_server_type_to_yojson (x : resource_server_type) =
  assoc_to_yojson
    [
      ("Scopes", option_to_yojson resource_server_scope_list_type_to_yojson x.scopes);
      ("Name", option_to_yojson resource_server_name_type_to_yojson x.name);
      ("Identifier", option_to_yojson resource_server_identifier_type_to_yojson x.identifier);
      ("UserPoolId", option_to_yojson user_pool_id_type_to_yojson x.user_pool_id);
    ]

let update_resource_server_response_to_yojson (x : update_resource_server_response) =
  assoc_to_yojson [ ("ResourceServer", Some (resource_server_type_to_yojson x.resource_server)) ]

let update_resource_server_request_to_yojson (x : update_resource_server_request) =
  assoc_to_yojson
    [
      ("Scopes", option_to_yojson resource_server_scope_list_type_to_yojson x.scopes);
      ("Name", Some (resource_server_name_type_to_yojson x.name));
      ("Identifier", Some (resource_server_identifier_type_to_yojson x.identifier));
      ("UserPoolId", Some (user_pool_id_type_to_yojson x.user_pool_id));
    ]

let limit_class_to_yojson (x : limit_class) = match x with API_CATEGORY -> `String "API_CATEGORY"

let string_to_string_map_type_to_yojson tree =
  map_to_yojson string_type_to_yojson string_type_to_yojson tree

let limit_definition_type_to_yojson (x : limit_definition_type) =
  assoc_to_yojson
    [
      ("Attributes", Some (string_to_string_map_type_to_yojson x.attributes));
      ("LimitClass", Some (limit_class_to_yojson x.limit_class));
    ]

let limit_type_to_yojson (x : limit_type) =
  assoc_to_yojson
    [
      ("FreeLimitValue", Some (integer_type_to_yojson x.free_limit_value));
      ("ProvisionedLimitValue", Some (integer_type_to_yojson x.provisioned_limit_value));
      ("LimitDefinition", Some (limit_definition_type_to_yojson x.limit_definition));
    ]

let update_provisioned_limit_response_to_yojson (x : update_provisioned_limit_response) =
  assoc_to_yojson [ ("Limit", Some (limit_type_to_yojson x.limit)) ]

let update_provisioned_limit_request_to_yojson (x : update_provisioned_limit_request) =
  assoc_to_yojson
    [
      ("RequestedLimitValue", Some (integer_type_to_yojson x.requested_limit_value));
      ("LimitDefinition", Some (limit_definition_type_to_yojson x.limit_definition));
    ]

let service_quota_exceeded_exception_to_yojson (x : service_quota_exceeded_exception) =
  assoc_to_yojson [ ("message", option_to_yojson message_type_to_yojson x.message) ]

let managed_login_branding_id_type_to_yojson = string_to_yojson
let document_to_yojson = json_to_yojson

let asset_category_type_to_yojson (x : asset_category_type) =
  match x with
  | IDP_BUTTON_ICON -> `String "IDP_BUTTON_ICON"
  | FORM_LOGO -> `String "FORM_LOGO"
  | FORM_BACKGROUND -> `String "FORM_BACKGROUND"
  | PAGE_BACKGROUND -> `String "PAGE_BACKGROUND"
  | PAGE_FOOTER_BACKGROUND -> `String "PAGE_FOOTER_BACKGROUND"
  | PAGE_FOOTER_LOGO -> `String "PAGE_FOOTER_LOGO"
  | PAGE_HEADER_BACKGROUND -> `String "PAGE_HEADER_BACKGROUND"
  | PAGE_HEADER_LOGO -> `String "PAGE_HEADER_LOGO"
  | PASSKEY_GRAPHIC -> `String "PASSKEY_GRAPHIC"
  | PASSWORD_GRAPHIC -> `String "PASSWORD_GRAPHIC"
  | AUTH_APP_GRAPHIC -> `String "AUTH_APP_GRAPHIC"
  | SMS_GRAPHIC -> `String "SMS_GRAPHIC"
  | EMAIL_GRAPHIC -> `String "EMAIL_GRAPHIC"
  | FAVICON_SVG -> `String "FAVICON_SVG"
  | FAVICON_ICO -> `String "FAVICON_ICO"

let color_scheme_mode_type_to_yojson (x : color_scheme_mode_type) =
  match x with DYNAMIC -> `String "DYNAMIC" | DARK -> `String "DARK" | LIGHT -> `String "LIGHT"

let asset_extension_type_to_yojson (x : asset_extension_type) =
  match x with
  | WEBP -> `String "WEBP"
  | SVG -> `String "SVG"
  | PNG -> `String "PNG"
  | JPEG -> `String "JPEG"
  | ICO -> `String "ICO"

let asset_bytes_type_to_yojson = blob_to_yojson
let resource_id_type_to_yojson = string_to_yojson

let asset_type_to_yojson (x : asset_type) =
  assoc_to_yojson
    [
      ("ResourceId", option_to_yojson resource_id_type_to_yojson x.resource_id);
      ("Bytes", option_to_yojson asset_bytes_type_to_yojson x.bytes);
      ("Extension", Some (asset_extension_type_to_yojson x.extension));
      ("ColorMode", Some (color_scheme_mode_type_to_yojson x.color_mode));
      ("Category", Some (asset_category_type_to_yojson x.category));
    ]

let asset_list_type_to_yojson tree = list_to_yojson asset_type_to_yojson tree

let managed_login_branding_type_to_yojson (x : managed_login_branding_type) =
  assoc_to_yojson
    [
      ("LastModifiedDate", option_to_yojson date_type_to_yojson x.last_modified_date);
      ("CreationDate", option_to_yojson date_type_to_yojson x.creation_date);
      ("Assets", option_to_yojson asset_list_type_to_yojson x.assets);
      ("Settings", option_to_yojson document_to_yojson x.settings);
      ( "UseCognitoProvidedValues",
        option_to_yojson boolean_type_to_yojson x.use_cognito_provided_values );
      ("UserPoolId", option_to_yojson user_pool_id_type_to_yojson x.user_pool_id);
      ( "ManagedLoginBrandingId",
        option_to_yojson managed_login_branding_id_type_to_yojson x.managed_login_branding_id );
    ]

let update_managed_login_branding_response_to_yojson (x : update_managed_login_branding_response) =
  assoc_to_yojson
    [
      ( "ManagedLoginBranding",
        option_to_yojson managed_login_branding_type_to_yojson x.managed_login_branding );
    ]

let update_managed_login_branding_request_to_yojson (x : update_managed_login_branding_request) =
  assoc_to_yojson
    [
      ("Assets", option_to_yojson asset_list_type_to_yojson x.assets);
      ("Settings", option_to_yojson document_to_yojson x.settings);
      ( "UseCognitoProvidedValues",
        option_to_yojson boolean_type_to_yojson x.use_cognito_provided_values );
      ( "ManagedLoginBrandingId",
        option_to_yojson managed_login_branding_id_type_to_yojson x.managed_login_branding_id );
      ("UserPoolId", option_to_yojson user_pool_id_type_to_yojson x.user_pool_id);
    ]

let identity_provider_type_type_to_yojson (x : identity_provider_type_type) =
  match x with
  | OIDC -> `String "OIDC"
  | SignInWithApple -> `String "SignInWithApple"
  | LoginWithAmazon -> `String "LoginWithAmazon"
  | Google -> `String "Google"
  | Facebook -> `String "Facebook"
  | SAML -> `String "SAML"

let provider_details_type_to_yojson tree =
  map_to_yojson string_type_to_yojson string_type_to_yojson tree

let attribute_mapping_key_type_to_yojson = string_to_yojson

let attribute_mapping_type_to_yojson tree =
  map_to_yojson attribute_mapping_key_type_to_yojson string_type_to_yojson tree

let idp_identifier_type_to_yojson = string_to_yojson
let idp_identifiers_list_type_to_yojson tree = list_to_yojson idp_identifier_type_to_yojson tree

let identity_provider_type_to_yojson (x : identity_provider_type) =
  assoc_to_yojson
    [
      ("CreationDate", option_to_yojson date_type_to_yojson x.creation_date);
      ("LastModifiedDate", option_to_yojson date_type_to_yojson x.last_modified_date);
      ("IdpIdentifiers", option_to_yojson idp_identifiers_list_type_to_yojson x.idp_identifiers);
      ("AttributeMapping", option_to_yojson attribute_mapping_type_to_yojson x.attribute_mapping);
      ("ProviderDetails", option_to_yojson provider_details_type_to_yojson x.provider_details);
      ("ProviderType", option_to_yojson identity_provider_type_type_to_yojson x.provider_type);
      ("ProviderName", option_to_yojson provider_name_type_to_yojson x.provider_name);
      ("UserPoolId", option_to_yojson user_pool_id_type_to_yojson x.user_pool_id);
    ]

let update_identity_provider_response_to_yojson (x : update_identity_provider_response) =
  assoc_to_yojson
    [ ("IdentityProvider", Some (identity_provider_type_to_yojson x.identity_provider)) ]

let update_identity_provider_request_to_yojson (x : update_identity_provider_request) =
  assoc_to_yojson
    [
      ("IdpIdentifiers", option_to_yojson idp_identifiers_list_type_to_yojson x.idp_identifiers);
      ("AttributeMapping", option_to_yojson attribute_mapping_type_to_yojson x.attribute_mapping);
      ("ProviderDetails", option_to_yojson provider_details_type_to_yojson x.provider_details);
      ("ProviderName", Some (provider_name_type_to_yojson x.provider_name));
      ("UserPoolId", Some (user_pool_id_type_to_yojson x.user_pool_id));
    ]

let unsupported_identity_provider_exception_to_yojson (x : unsupported_identity_provider_exception)
    =
  assoc_to_yojson [ ("message", option_to_yojson message_type_to_yojson x.message) ]

let group_name_type_to_yojson = string_to_yojson
let description_type_to_yojson = string_to_yojson
let precedence_type_to_yojson = int_to_yojson

let group_type_to_yojson (x : group_type) =
  assoc_to_yojson
    [
      ("CreationDate", option_to_yojson date_type_to_yojson x.creation_date);
      ("LastModifiedDate", option_to_yojson date_type_to_yojson x.last_modified_date);
      ("Precedence", option_to_yojson precedence_type_to_yojson x.precedence);
      ("RoleArn", option_to_yojson arn_type_to_yojson x.role_arn);
      ("Description", option_to_yojson description_type_to_yojson x.description);
      ("UserPoolId", option_to_yojson user_pool_id_type_to_yojson x.user_pool_id);
      ("GroupName", option_to_yojson group_name_type_to_yojson x.group_name);
    ]

let update_group_response_to_yojson (x : update_group_response) =
  assoc_to_yojson [ ("Group", option_to_yojson group_type_to_yojson x.group) ]

let update_group_request_to_yojson (x : update_group_request) =
  assoc_to_yojson
    [
      ("Precedence", option_to_yojson precedence_type_to_yojson x.precedence);
      ("RoleArn", option_to_yojson arn_type_to_yojson x.role_arn);
      ("Description", option_to_yojson description_type_to_yojson x.description);
      ("UserPoolId", Some (user_pool_id_type_to_yojson x.user_pool_id));
      ("GroupName", Some (group_name_type_to_yojson x.group_name));
    ]

let update_device_status_response_to_yojson = unit_to_yojson
let device_key_type_to_yojson = string_to_yojson

let device_remembered_status_type_to_yojson (x : device_remembered_status_type) =
  match x with NOT_REMEMBERED -> `String "not_remembered" | REMEMBERED -> `String "remembered"

let update_device_status_request_to_yojson (x : update_device_status_request) =
  assoc_to_yojson
    [
      ( "DeviceRememberedStatus",
        option_to_yojson device_remembered_status_type_to_yojson x.device_remembered_status );
      ("DeviceKey", Some (device_key_type_to_yojson x.device_key));
      ("AccessToken", Some (token_model_type_to_yojson x.access_token));
    ]

let update_auth_event_feedback_response_to_yojson = unit_to_yojson
let event_id_type_to_yojson = string_to_yojson

let feedback_value_type_to_yojson (x : feedback_value_type) =
  match x with INVALID -> `String "Invalid" | VALID -> `String "Valid"

let update_auth_event_feedback_request_to_yojson (x : update_auth_event_feedback_request) =
  assoc_to_yojson
    [
      ("FeedbackValue", Some (feedback_value_type_to_yojson x.feedback_value));
      ("FeedbackToken", Some (token_model_type_to_yojson x.feedback_token));
      ("EventId", Some (event_id_type_to_yojson x.event_id));
      ("Username", Some (username_type_to_yojson x.username));
      ("UserPoolId", Some (user_pool_id_type_to_yojson x.user_pool_id));
    ]

let untag_resource_response_to_yojson = unit_to_yojson

let untag_resource_request_to_yojson (x : untag_resource_request) =
  assoc_to_yojson
    [
      ("TagKeys", Some (user_pool_tags_list_type_to_yojson x.tag_keys));
      ("ResourceArn", Some (arn_type_to_yojson x.resource_arn));
    ]

let unsupported_user_state_exception_to_yojson (x : unsupported_user_state_exception) =
  assoc_to_yojson [ ("message", option_to_yojson message_type_to_yojson x.message) ]

let unsupported_token_type_exception_to_yojson (x : unsupported_token_type_exception) =
  assoc_to_yojson [ ("message", option_to_yojson message_type_to_yojson x.message) ]

let unsupported_operation_exception_to_yojson (x : unsupported_operation_exception) =
  assoc_to_yojson [ ("message", option_to_yojson message_type_to_yojson x.message) ]

let unauthorized_exception_to_yojson (x : unauthorized_exception) =
  assoc_to_yojson [ ("message", option_to_yojson message_type_to_yojson x.message) ]

let image_url_type_to_yojson = string_to_yojson
let css_type_to_yojson = string_to_yojson
let css_version_type_to_yojson = string_to_yojson

let ui_customization_type_to_yojson (x : ui_customization_type) =
  assoc_to_yojson
    [
      ("CreationDate", option_to_yojson date_type_to_yojson x.creation_date);
      ("LastModifiedDate", option_to_yojson date_type_to_yojson x.last_modified_date);
      ("CSSVersion", option_to_yojson css_version_type_to_yojson x.css_version);
      ("CSS", option_to_yojson css_type_to_yojson x.cs_s);
      ("ImageUrl", option_to_yojson image_url_type_to_yojson x.image_url);
      ("ClientId", option_to_yojson client_id_type_to_yojson x.client_id);
      ("UserPoolId", option_to_yojson user_pool_id_type_to_yojson x.user_pool_id);
    ]

let too_many_failed_attempts_exception_to_yojson (x : too_many_failed_attempts_exception) =
  assoc_to_yojson [ ("message", option_to_yojson message_type_to_yojson x.message) ]

let terms_description_type_to_yojson (x : terms_description_type) =
  assoc_to_yojson
    [
      ("LastModifiedDate", Some (date_type_to_yojson x.last_modified_date));
      ("CreationDate", Some (date_type_to_yojson x.creation_date));
      ("Enforcement", Some (terms_enforcement_type_to_yojson x.enforcement));
      ("TermsName", Some (terms_name_type_to_yojson x.terms_name));
      ("TermsId", Some (terms_id_type_to_yojson x.terms_id));
    ]

let terms_description_list_type_to_yojson tree =
  list_to_yojson terms_description_type_to_yojson tree

let tag_resource_response_to_yojson = unit_to_yojson

let tag_resource_request_to_yojson (x : tag_resource_request) =
  assoc_to_yojson
    [
      ("Tags", Some (user_pool_tags_type_to_yojson x.tags));
      ("ResourceArn", Some (arn_type_to_yojson x.resource_arn));
    ]

let stop_user_import_job_response_to_yojson (x : stop_user_import_job_response) =
  assoc_to_yojson
    [ ("UserImportJob", option_to_yojson user_import_job_type_to_yojson x.user_import_job) ]

let stop_user_import_job_request_to_yojson (x : stop_user_import_job_request) =
  assoc_to_yojson
    [
      ("JobId", Some (user_import_job_id_type_to_yojson x.job_id));
      ("UserPoolId", Some (user_pool_id_type_to_yojson x.user_pool_id));
    ]

let precondition_not_met_exception_to_yojson (x : precondition_not_met_exception) =
  assoc_to_yojson [ ("message", option_to_yojson message_type_to_yojson x.message) ]

let start_web_authn_registration_response_to_yojson (x : start_web_authn_registration_response) =
  assoc_to_yojson
    [ ("CredentialCreationOptions", Some (document_to_yojson x.credential_creation_options)) ]

let start_web_authn_registration_request_to_yojson (x : start_web_authn_registration_request) =
  assoc_to_yojson [ ("AccessToken", Some (token_model_type_to_yojson x.access_token)) ]

let start_user_import_job_response_to_yojson (x : start_user_import_job_response) =
  assoc_to_yojson
    [ ("UserImportJob", option_to_yojson user_import_job_type_to_yojson x.user_import_job) ]

let start_user_import_job_request_to_yojson (x : start_user_import_job_request) =
  assoc_to_yojson
    [
      ("JobId", Some (user_import_job_id_type_to_yojson x.job_id));
      ("UserPoolId", Some (user_pool_id_type_to_yojson x.user_pool_id));
    ]

let software_token_mfa_settings_type_to_yojson (x : software_token_mfa_settings_type) =
  assoc_to_yojson
    [
      ("PreferredMfa", option_to_yojson boolean_type_to_yojson x.preferred_mfa);
      ("Enabled", option_to_yojson boolean_type_to_yojson x.enabled);
    ]

let software_token_mfa_config_type_to_yojson (x : software_token_mfa_config_type) =
  assoc_to_yojson [ ("Enabled", option_to_yojson boolean_type_to_yojson x.enabled) ]

let sms_mfa_config_type_to_yojson (x : sms_mfa_config_type) =
  assoc_to_yojson
    [
      ("SmsConfiguration", option_to_yojson sms_configuration_type_to_yojson x.sms_configuration);
      ( "SmsAuthenticationMessage",
        option_to_yojson sms_verification_message_type_to_yojson x.sms_authentication_message );
    ]

let skipped_ip_range_list_type_to_yojson tree = list_to_yojson string_type_to_yojson tree

let sign_up_response_to_yojson (x : sign_up_response) =
  assoc_to_yojson
    [
      ("Session", option_to_yojson session_type_to_yojson x.session);
      ("UserSub", Some (string_type_to_yojson x.user_sub));
      ( "CodeDeliveryDetails",
        option_to_yojson code_delivery_details_type_to_yojson x.code_delivery_details );
      ("UserConfirmed", Some (boolean_type_to_yojson x.user_confirmed));
    ]

let secret_hash_type_to_yojson = string_to_yojson
let password_type_to_yojson = string_to_yojson

let analytics_metadata_type_to_yojson (x : analytics_metadata_type) =
  assoc_to_yojson
    [ ("AnalyticsEndpointId", option_to_yojson string_type_to_yojson x.analytics_endpoint_id) ]

let sign_up_request_to_yojson (x : sign_up_request) =
  assoc_to_yojson
    [
      ("ClientMetadata", option_to_yojson client_metadata_type_to_yojson x.client_metadata);
      ("UserContextData", option_to_yojson user_context_data_type_to_yojson x.user_context_data);
      ("AnalyticsMetadata", option_to_yojson analytics_metadata_type_to_yojson x.analytics_metadata);
      ("ValidationData", option_to_yojson attribute_list_type_to_yojson x.validation_data);
      ("UserAttributes", option_to_yojson attribute_list_type_to_yojson x.user_attributes);
      ("Password", option_to_yojson password_type_to_yojson x.password);
      ("Username", Some (username_type_to_yojson x.username));
      ("SecretHash", option_to_yojson secret_hash_type_to_yojson x.secret_hash);
      ("ClientId", Some (client_id_type_to_yojson x.client_id));
    ]

let invalid_password_exception_to_yojson (x : invalid_password_exception) =
  assoc_to_yojson [ ("message", option_to_yojson message_type_to_yojson x.message) ]

let set_user_settings_response_to_yojson = unit_to_yojson

let set_user_settings_request_to_yojson (x : set_user_settings_request) =
  assoc_to_yojson
    [
      ("MFAOptions", Some (mfa_option_list_type_to_yojson x.mfa_options));
      ("AccessToken", Some (token_model_type_to_yojson x.access_token));
    ]

let email_mfa_message_type_to_yojson = string_to_yojson
let email_mfa_subject_type_to_yojson = string_to_yojson

let email_mfa_config_type_to_yojson (x : email_mfa_config_type) =
  assoc_to_yojson
    [
      ("Subject", option_to_yojson email_mfa_subject_type_to_yojson x.subject);
      ("Message", option_to_yojson email_mfa_message_type_to_yojson x.message);
    ]

let set_user_pool_mfa_config_response_to_yojson (x : set_user_pool_mfa_config_response) =
  assoc_to_yojson
    [
      ( "WebAuthnConfiguration",
        option_to_yojson web_authn_configuration_type_to_yojson x.web_authn_configuration );
      ("MfaConfiguration", option_to_yojson user_pool_mfa_type_to_yojson x.mfa_configuration);
      ( "EmailMfaConfiguration",
        option_to_yojson email_mfa_config_type_to_yojson x.email_mfa_configuration );
      ( "SoftwareTokenMfaConfiguration",
        option_to_yojson software_token_mfa_config_type_to_yojson x.software_token_mfa_configuration
      );
      ("SmsMfaConfiguration", option_to_yojson sms_mfa_config_type_to_yojson x.sms_mfa_configuration);
    ]

let set_user_pool_mfa_config_request_to_yojson (x : set_user_pool_mfa_config_request) =
  assoc_to_yojson
    [
      ( "WebAuthnConfiguration",
        option_to_yojson web_authn_configuration_type_to_yojson x.web_authn_configuration );
      ("MfaConfiguration", option_to_yojson user_pool_mfa_type_to_yojson x.mfa_configuration);
      ( "EmailMfaConfiguration",
        option_to_yojson email_mfa_config_type_to_yojson x.email_mfa_configuration );
      ( "SoftwareTokenMfaConfiguration",
        option_to_yojson software_token_mfa_config_type_to_yojson x.software_token_mfa_configuration
      );
      ("SmsMfaConfiguration", option_to_yojson sms_mfa_config_type_to_yojson x.sms_mfa_configuration);
      ("UserPoolId", Some (user_pool_id_type_to_yojson x.user_pool_id));
    ]

let set_user_mfa_preference_response_to_yojson = unit_to_yojson

let sms_mfa_settings_type_to_yojson (x : sms_mfa_settings_type) =
  assoc_to_yojson
    [
      ("PreferredMfa", option_to_yojson boolean_type_to_yojson x.preferred_mfa);
      ("Enabled", option_to_yojson boolean_type_to_yojson x.enabled);
    ]

let email_mfa_settings_type_to_yojson (x : email_mfa_settings_type) =
  assoc_to_yojson
    [
      ("PreferredMfa", option_to_yojson boolean_type_to_yojson x.preferred_mfa);
      ("Enabled", option_to_yojson boolean_type_to_yojson x.enabled);
    ]

let set_user_mfa_preference_request_to_yojson (x : set_user_mfa_preference_request) =
  assoc_to_yojson
    [
      ("AccessToken", Some (token_model_type_to_yojson x.access_token));
      ( "WebAuthnMfaSettings",
        option_to_yojson web_authn_mfa_settings_type_to_yojson x.web_authn_mfa_settings );
      ("EmailMfaSettings", option_to_yojson email_mfa_settings_type_to_yojson x.email_mfa_settings);
      ( "SoftwareTokenMfaSettings",
        option_to_yojson software_token_mfa_settings_type_to_yojson x.software_token_mfa_settings );
      ("SMSMfaSettings", option_to_yojson sms_mfa_settings_type_to_yojson x.sms_mfa_settings);
    ]

let set_ui_customization_response_to_yojson (x : set_ui_customization_response) =
  assoc_to_yojson [ ("UICustomization", Some (ui_customization_type_to_yojson x.ui_customization)) ]

let image_file_type_to_yojson = blob_to_yojson

let set_ui_customization_request_to_yojson (x : set_ui_customization_request) =
  assoc_to_yojson
    [
      ("ImageFile", option_to_yojson image_file_type_to_yojson x.image_file);
      ("CSS", option_to_yojson css_type_to_yojson x.cs_s);
      ("ClientId", option_to_yojson client_id_type_to_yojson x.client_id);
      ("UserPoolId", Some (user_pool_id_type_to_yojson x.user_pool_id));
    ]

let event_filter_type_to_yojson (x : event_filter_type) =
  match x with
  | SIGN_UP -> `String "SIGN_UP"
  | PASSWORD_CHANGE -> `String "PASSWORD_CHANGE"
  | SIGN_IN -> `String "SIGN_IN"

let event_filters_type_to_yojson tree = list_to_yojson event_filter_type_to_yojson tree

let compromised_credentials_event_action_type_to_yojson
    (x : compromised_credentials_event_action_type) =
  match x with NO_ACTION -> `String "NO_ACTION" | BLOCK -> `String "BLOCK"

let compromised_credentials_actions_type_to_yojson (x : compromised_credentials_actions_type) =
  assoc_to_yojson
    [ ("EventAction", Some (compromised_credentials_event_action_type_to_yojson x.event_action)) ]

let compromised_credentials_risk_configuration_type_to_yojson
    (x : compromised_credentials_risk_configuration_type) =
  assoc_to_yojson
    [
      ("Actions", Some (compromised_credentials_actions_type_to_yojson x.actions));
      ("EventFilter", option_to_yojson event_filters_type_to_yojson x.event_filter);
    ]

let email_notification_subject_type_to_yojson = string_to_yojson
let email_notification_body_type_to_yojson = string_to_yojson

let notify_email_type_to_yojson (x : notify_email_type) =
  assoc_to_yojson
    [
      ("TextBody", option_to_yojson email_notification_body_type_to_yojson x.text_body);
      ("HtmlBody", option_to_yojson email_notification_body_type_to_yojson x.html_body);
      ("Subject", Some (email_notification_subject_type_to_yojson x.subject));
    ]

let notify_configuration_type_to_yojson (x : notify_configuration_type) =
  assoc_to_yojson
    [
      ("MfaEmail", option_to_yojson notify_email_type_to_yojson x.mfa_email);
      ("NoActionEmail", option_to_yojson notify_email_type_to_yojson x.no_action_email);
      ("BlockEmail", option_to_yojson notify_email_type_to_yojson x.block_email);
      ("SourceArn", Some (arn_type_to_yojson x.source_arn));
      ("ReplyTo", option_to_yojson string_type_to_yojson x.reply_to);
      ("From", option_to_yojson string_type_to_yojson x.from_);
    ]

let account_takeover_action_notify_type_to_yojson = bool_to_yojson

let account_takeover_event_action_type_to_yojson (x : account_takeover_event_action_type) =
  match x with
  | NO_ACTION -> `String "NO_ACTION"
  | MFA_REQUIRED -> `String "MFA_REQUIRED"
  | MFA_IF_CONFIGURED -> `String "MFA_IF_CONFIGURED"
  | BLOCK -> `String "BLOCK"

let account_takeover_action_type_to_yojson (x : account_takeover_action_type) =
  assoc_to_yojson
    [
      ("EventAction", Some (account_takeover_event_action_type_to_yojson x.event_action));
      ("Notify", Some (account_takeover_action_notify_type_to_yojson x.notify));
    ]

let account_takeover_actions_type_to_yojson (x : account_takeover_actions_type) =
  assoc_to_yojson
    [
      ("HighAction", option_to_yojson account_takeover_action_type_to_yojson x.high_action);
      ("MediumAction", option_to_yojson account_takeover_action_type_to_yojson x.medium_action);
      ("LowAction", option_to_yojson account_takeover_action_type_to_yojson x.low_action);
    ]

let account_takeover_risk_configuration_type_to_yojson
    (x : account_takeover_risk_configuration_type) =
  assoc_to_yojson
    [
      ("Actions", Some (account_takeover_actions_type_to_yojson x.actions));
      ( "NotifyConfiguration",
        option_to_yojson notify_configuration_type_to_yojson x.notify_configuration );
    ]

let blocked_ip_range_list_type_to_yojson tree = list_to_yojson string_type_to_yojson tree

let risk_exception_configuration_type_to_yojson (x : risk_exception_configuration_type) =
  assoc_to_yojson
    [
      ( "SkippedIPRangeList",
        option_to_yojson skipped_ip_range_list_type_to_yojson x.skipped_ip_range_list );
      ( "BlockedIPRangeList",
        option_to_yojson blocked_ip_range_list_type_to_yojson x.blocked_ip_range_list );
    ]

let risk_configuration_type_to_yojson (x : risk_configuration_type) =
  assoc_to_yojson
    [
      ("LastModifiedDate", option_to_yojson date_type_to_yojson x.last_modified_date);
      ( "RiskExceptionConfiguration",
        option_to_yojson risk_exception_configuration_type_to_yojson x.risk_exception_configuration
      );
      ( "AccountTakeoverRiskConfiguration",
        option_to_yojson account_takeover_risk_configuration_type_to_yojson
          x.account_takeover_risk_configuration );
      ( "CompromisedCredentialsRiskConfiguration",
        option_to_yojson compromised_credentials_risk_configuration_type_to_yojson
          x.compromised_credentials_risk_configuration );
      ("ClientId", option_to_yojson client_id_type_to_yojson x.client_id);
      ("UserPoolId", option_to_yojson user_pool_id_type_to_yojson x.user_pool_id);
    ]

let set_risk_configuration_response_to_yojson (x : set_risk_configuration_response) =
  assoc_to_yojson
    [ ("RiskConfiguration", Some (risk_configuration_type_to_yojson x.risk_configuration)) ]

let set_risk_configuration_request_to_yojson (x : set_risk_configuration_request) =
  assoc_to_yojson
    [
      ( "RiskExceptionConfiguration",
        option_to_yojson risk_exception_configuration_type_to_yojson x.risk_exception_configuration
      );
      ( "AccountTakeoverRiskConfiguration",
        option_to_yojson account_takeover_risk_configuration_type_to_yojson
          x.account_takeover_risk_configuration );
      ( "CompromisedCredentialsRiskConfiguration",
        option_to_yojson compromised_credentials_risk_configuration_type_to_yojson
          x.compromised_credentials_risk_configuration );
      ("ClientId", option_to_yojson client_id_type_to_yojson x.client_id);
      ("UserPoolId", Some (user_pool_id_type_to_yojson x.user_pool_id));
    ]

let log_level_to_yojson (x : log_level) =
  match x with INFO -> `String "INFO" | ERROR -> `String "ERROR"

let event_source_name_to_yojson (x : event_source_name) =
  match x with
  | USER_AUTH_EVENTS -> `String "userAuthEvents"
  | USER_NOTIFICATION -> `String "userNotification"

let cloud_watch_logs_configuration_type_to_yojson (x : cloud_watch_logs_configuration_type) =
  assoc_to_yojson [ ("LogGroupArn", option_to_yojson arn_type_to_yojson x.log_group_arn) ]

let s3_arn_type_to_yojson = string_to_yojson

let s3_configuration_type_to_yojson (x : s3_configuration_type) =
  assoc_to_yojson [ ("BucketArn", option_to_yojson s3_arn_type_to_yojson x.bucket_arn) ]

let firehose_configuration_type_to_yojson (x : firehose_configuration_type) =
  assoc_to_yojson [ ("StreamArn", option_to_yojson arn_type_to_yojson x.stream_arn) ]

let log_configuration_type_to_yojson (x : log_configuration_type) =
  assoc_to_yojson
    [
      ( "FirehoseConfiguration",
        option_to_yojson firehose_configuration_type_to_yojson x.firehose_configuration );
      ("S3Configuration", option_to_yojson s3_configuration_type_to_yojson x.s3_configuration);
      ( "CloudWatchLogsConfiguration",
        option_to_yojson cloud_watch_logs_configuration_type_to_yojson
          x.cloud_watch_logs_configuration );
      ("EventSource", Some (event_source_name_to_yojson x.event_source));
      ("LogLevel", Some (log_level_to_yojson x.log_level));
    ]

let log_configuration_list_type_to_yojson tree =
  list_to_yojson log_configuration_type_to_yojson tree

let log_delivery_configuration_type_to_yojson (x : log_delivery_configuration_type) =
  assoc_to_yojson
    [
      ("LogConfigurations", Some (log_configuration_list_type_to_yojson x.log_configurations));
      ("UserPoolId", Some (user_pool_id_type_to_yojson x.user_pool_id));
    ]

let set_log_delivery_configuration_response_to_yojson (x : set_log_delivery_configuration_response)
    =
  assoc_to_yojson
    [
      ( "LogDeliveryConfiguration",
        option_to_yojson log_delivery_configuration_type_to_yojson x.log_delivery_configuration );
    ]

let set_log_delivery_configuration_request_to_yojson (x : set_log_delivery_configuration_request) =
  assoc_to_yojson
    [
      ("LogConfigurations", Some (log_configuration_list_type_to_yojson x.log_configurations));
      ("UserPoolId", Some (user_pool_id_type_to_yojson x.user_pool_id));
    ]

let secret_code_type_to_yojson = string_to_yojson

let searched_attribute_names_list_type_to_yojson tree =
  list_to_yojson attribute_name_type_to_yojson tree

let search_pagination_token_type_to_yojson = string_to_yojson
let s3_bucket_type_to_yojson = string_to_yojson

let risk_level_type_to_yojson (x : risk_level_type) =
  match x with High -> `String "High" | Medium -> `String "Medium" | Low -> `String "Low"

let risk_decision_type_to_yojson (x : risk_decision_type) =
  match x with
  | Block -> `String "Block"
  | AccountTakeover -> `String "AccountTakeover"
  | NoRisk -> `String "NoRisk"

let revoke_token_response_to_yojson = unit_to_yojson

let revoke_token_request_to_yojson (x : revoke_token_request) =
  assoc_to_yojson
    [
      ("ClientSecret", option_to_yojson client_secret_type_to_yojson x.client_secret);
      ("ClientId", Some (client_id_type_to_yojson x.client_id));
      ("Token", Some (token_model_type_to_yojson x.token));
    ]

let challenge_name_type_to_yojson (x : challenge_name_type) =
  match x with
  | PASSWORD_SRP -> `String "PASSWORD_SRP"
  | WEB_AUTHN -> `String "WEB_AUTHN"
  | PASSWORD -> `String "PASSWORD"
  | SMS_OTP -> `String "SMS_OTP"
  | NEW_PASSWORD_REQUIRED -> `String "NEW_PASSWORD_REQUIRED"
  | ADMIN_NO_SRP_AUTH -> `String "ADMIN_NO_SRP_AUTH"
  | DEVICE_PASSWORD_VERIFIER -> `String "DEVICE_PASSWORD_VERIFIER"
  | DEVICE_SRP_AUTH -> `String "DEVICE_SRP_AUTH"
  | SELECT_CHALLENGE -> `String "SELECT_CHALLENGE"
  | CUSTOM_CHALLENGE -> `String "CUSTOM_CHALLENGE"
  | PASSWORD_VERIFIER -> `String "PASSWORD_VERIFIER"
  | MFA_SETUP -> `String "MFA_SETUP"
  | SELECT_MFA_TYPE -> `String "SELECT_MFA_TYPE"
  | SOFTWARE_TOKEN_MFA -> `String "SOFTWARE_TOKEN_MFA"
  | EMAIL_OTP -> `String "EMAIL_OTP"
  | SMS_MFA -> `String "SMS_MFA"

let challenge_parameters_type_to_yojson tree =
  map_to_yojson string_type_to_yojson string_type_to_yojson tree

let new_device_metadata_type_to_yojson (x : new_device_metadata_type) =
  assoc_to_yojson
    [
      ("DeviceGroupKey", option_to_yojson string_type_to_yojson x.device_group_key);
      ("DeviceKey", option_to_yojson device_key_type_to_yojson x.device_key);
    ]

let authentication_result_type_to_yojson (x : authentication_result_type) =
  assoc_to_yojson
    [
      ( "NewDeviceMetadata",
        option_to_yojson new_device_metadata_type_to_yojson x.new_device_metadata );
      ("IdToken", option_to_yojson token_model_type_to_yojson x.id_token);
      ("RefreshToken", option_to_yojson token_model_type_to_yojson x.refresh_token);
      ("TokenType", option_to_yojson string_type_to_yojson x.token_type);
      ("ExpiresIn", option_to_yojson integer_type_to_yojson x.expires_in);
      ("AccessToken", option_to_yojson token_model_type_to_yojson x.access_token);
    ]

let respond_to_auth_challenge_response_to_yojson (x : respond_to_auth_challenge_response) =
  assoc_to_yojson
    [
      ( "AuthenticationResult",
        option_to_yojson authentication_result_type_to_yojson x.authentication_result );
      ( "ChallengeParameters",
        option_to_yojson challenge_parameters_type_to_yojson x.challenge_parameters );
      ("Session", option_to_yojson session_type_to_yojson x.session);
      ("ChallengeName", option_to_yojson challenge_name_type_to_yojson x.challenge_name);
    ]

let challenge_responses_type_to_yojson tree =
  map_to_yojson string_type_to_yojson string_type_to_yojson tree

let respond_to_auth_challenge_request_to_yojson (x : respond_to_auth_challenge_request) =
  assoc_to_yojson
    [
      ("ClientMetadata", option_to_yojson client_metadata_type_to_yojson x.client_metadata);
      ("UserContextData", option_to_yojson user_context_data_type_to_yojson x.user_context_data);
      ("AnalyticsMetadata", option_to_yojson analytics_metadata_type_to_yojson x.analytics_metadata);
      ( "ChallengeResponses",
        option_to_yojson challenge_responses_type_to_yojson x.challenge_responses );
      ("Session", option_to_yojson session_type_to_yojson x.session);
      ("ChallengeName", Some (challenge_name_type_to_yojson x.challenge_name));
      ("ClientId", Some (client_id_type_to_yojson x.client_id));
    ]

let password_history_policy_violation_exception_to_yojson
    (x : password_history_policy_violation_exception) =
  assoc_to_yojson [ ("message", option_to_yojson message_type_to_yojson x.message) ]

let mfa_method_not_found_exception_to_yojson (x : mfa_method_not_found_exception) =
  assoc_to_yojson [ ("message", option_to_yojson message_type_to_yojson x.message) ]

let resource_servers_list_type_to_yojson tree = list_to_yojson resource_server_type_to_yojson tree

let resend_confirmation_code_response_to_yojson (x : resend_confirmation_code_response) =
  assoc_to_yojson
    [
      ( "CodeDeliveryDetails",
        option_to_yojson code_delivery_details_type_to_yojson x.code_delivery_details );
    ]

let resend_confirmation_code_request_to_yojson (x : resend_confirmation_code_request) =
  assoc_to_yojson
    [
      ("ClientMetadata", option_to_yojson client_metadata_type_to_yojson x.client_metadata);
      ("AnalyticsMetadata", option_to_yojson analytics_metadata_type_to_yojson x.analytics_metadata);
      ("Username", Some (username_type_to_yojson x.username));
      ("UserContextData", option_to_yojson user_context_data_type_to_yojson x.user_context_data);
      ("SecretHash", option_to_yojson secret_hash_type_to_yojson x.secret_hash);
      ("ClientId", Some (client_id_type_to_yojson x.client_id));
    ]

let refresh_token_reuse_exception_to_yojson (x : refresh_token_reuse_exception) =
  assoc_to_yojson [ ("message", option_to_yojson message_type_to_yojson x.message) ]

let query_limit_type_to_yojson = int_to_yojson
let query_limit_to_yojson = int_to_yojson

let provider_description_to_yojson (x : provider_description) =
  assoc_to_yojson
    [
      ("CreationDate", option_to_yojson date_type_to_yojson x.creation_date);
      ("LastModifiedDate", option_to_yojson date_type_to_yojson x.last_modified_date);
      ("ProviderType", option_to_yojson identity_provider_type_type_to_yojson x.provider_type);
      ("ProviderName", option_to_yojson provider_name_type_to_yojson x.provider_name);
    ]

let providers_list_type_to_yojson tree = list_to_yojson provider_description_to_yojson tree

let provider_user_identifier_type_to_yojson (x : provider_user_identifier_type) =
  assoc_to_yojson
    [
      ("ProviderAttributeValue", option_to_yojson string_type_to_yojson x.provider_attribute_value);
      ("ProviderAttributeName", option_to_yojson string_type_to_yojson x.provider_attribute_name);
      ("ProviderName", option_to_yojson provider_name_type_to_yojson x.provider_name);
    ]

let provider_name_type_v2_to_yojson = string_to_yojson
let pool_query_limit_type_to_yojson = int_to_yojson
let pagination_key_type_to_yojson = string_to_yojson
let pagination_key_to_yojson = string_to_yojson

let message_action_type_to_yojson (x : message_action_type) =
  match x with SUPPRESS -> `String "SUPPRESS" | RESEND -> `String "RESEND"

let managed_login_branding_exists_exception_to_yojson (x : managed_login_branding_exists_exception)
    =
  assoc_to_yojson [ ("message", option_to_yojson message_type_to_yojson x.message) ]

let list_web_authn_credentials_response_to_yojson (x : list_web_authn_credentials_response) =
  assoc_to_yojson
    [
      ("NextToken", option_to_yojson pagination_key_to_yojson x.next_token);
      ("Credentials", Some (web_authn_credential_description_list_type_to_yojson x.credentials));
    ]

let list_web_authn_credentials_request_to_yojson (x : list_web_authn_credentials_request) =
  assoc_to_yojson
    [
      ("MaxResults", option_to_yojson web_authn_credentials_query_limit_type_to_yojson x.max_results);
      ("NextToken", option_to_yojson pagination_key_to_yojson x.next_token);
      ("AccessToken", Some (token_model_type_to_yojson x.access_token));
    ]

let list_users_response_to_yojson (x : list_users_response) =
  assoc_to_yojson
    [
      ("PaginationToken", option_to_yojson search_pagination_token_type_to_yojson x.pagination_token);
      ("Users", option_to_yojson users_list_type_to_yojson x.users);
    ]

let list_users_request_to_yojson (x : list_users_request) =
  assoc_to_yojson
    [
      ("Filter", option_to_yojson user_filter_type_to_yojson x.filter);
      ("PaginationToken", option_to_yojson search_pagination_token_type_to_yojson x.pagination_token);
      ("Limit", option_to_yojson query_limit_type_to_yojson x.limit);
      ( "AttributesToGet",
        option_to_yojson searched_attribute_names_list_type_to_yojson x.attributes_to_get );
      ("UserPoolId", Some (user_pool_id_type_to_yojson x.user_pool_id));
    ]

let list_users_in_group_response_to_yojson (x : list_users_in_group_response) =
  assoc_to_yojson
    [
      ("NextToken", option_to_yojson pagination_key_to_yojson x.next_token);
      ("Users", option_to_yojson users_list_type_to_yojson x.users);
    ]

let list_users_in_group_request_to_yojson (x : list_users_in_group_request) =
  assoc_to_yojson
    [
      ("NextToken", option_to_yojson pagination_key_to_yojson x.next_token);
      ("Limit", option_to_yojson query_limit_type_to_yojson x.limit);
      ("GroupName", Some (group_name_type_to_yojson x.group_name));
      ("UserPoolId", Some (user_pool_id_type_to_yojson x.user_pool_id));
    ]

let list_user_pools_response_to_yojson (x : list_user_pools_response) =
  assoc_to_yojson
    [
      ("NextToken", option_to_yojson pagination_key_type_to_yojson x.next_token);
      ("UserPools", option_to_yojson user_pool_list_type_to_yojson x.user_pools);
    ]

let list_user_pools_request_to_yojson (x : list_user_pools_request) =
  assoc_to_yojson
    [
      ("MaxResults", Some (pool_query_limit_type_to_yojson x.max_results));
      ("NextToken", option_to_yojson pagination_key_type_to_yojson x.next_token);
    ]

let list_user_pool_replicas_response_to_yojson (x : list_user_pool_replicas_response) =
  assoc_to_yojson
    [
      ("NextToken", option_to_yojson pagination_key_type_to_yojson x.next_token);
      ( "UserPoolReplicas",
        option_to_yojson user_pool_replica_list_type_to_yojson x.user_pool_replicas );
    ]

let list_user_pool_replicas_request_to_yojson (x : list_user_pool_replicas_request) =
  assoc_to_yojson
    [
      ("NextToken", option_to_yojson pagination_key_type_to_yojson x.next_token);
      ("UserPoolId", Some (user_pool_id_type_to_yojson x.user_pool_id));
    ]

let list_user_pool_clients_response_to_yojson (x : list_user_pool_clients_response) =
  assoc_to_yojson
    [
      ("NextToken", option_to_yojson pagination_key_to_yojson x.next_token);
      ("UserPoolClients", option_to_yojson user_pool_client_list_type_to_yojson x.user_pool_clients);
    ]

let list_user_pool_clients_request_to_yojson (x : list_user_pool_clients_request) =
  assoc_to_yojson
    [
      ("NextToken", option_to_yojson pagination_key_to_yojson x.next_token);
      ("MaxResults", option_to_yojson query_limit_to_yojson x.max_results);
      ("UserPoolId", Some (user_pool_id_type_to_yojson x.user_pool_id));
    ]

let client_secret_id_type_to_yojson = string_to_yojson

let client_secret_descriptor_type_to_yojson (x : client_secret_descriptor_type) =
  assoc_to_yojson
    [
      ("ClientSecretCreateDate", option_to_yojson date_type_to_yojson x.client_secret_create_date);
      ("ClientSecretValue", option_to_yojson client_secret_type_to_yojson x.client_secret_value);
      ("ClientSecretId", option_to_yojson client_secret_id_type_to_yojson x.client_secret_id);
    ]

let client_secret_descriptor_list_type_to_yojson tree =
  list_to_yojson client_secret_descriptor_type_to_yojson tree

let list_user_pool_client_secrets_response_to_yojson (x : list_user_pool_client_secrets_response) =
  assoc_to_yojson
    [
      ("NextToken", option_to_yojson pagination_key_to_yojson x.next_token);
      ( "ClientSecrets",
        option_to_yojson client_secret_descriptor_list_type_to_yojson x.client_secrets );
    ]

let list_user_pool_client_secrets_request_to_yojson (x : list_user_pool_client_secrets_request) =
  assoc_to_yojson
    [
      ("NextToken", option_to_yojson pagination_key_to_yojson x.next_token);
      ("ClientId", Some (client_id_type_to_yojson x.client_id));
      ("UserPoolId", Some (user_pool_id_type_to_yojson x.user_pool_id));
    ]

let internal_server_exception_to_yojson (x : internal_server_exception) =
  assoc_to_yojson [ ("message", option_to_yojson message_type_to_yojson x.message) ]

let list_user_import_jobs_response_to_yojson (x : list_user_import_jobs_response) =
  assoc_to_yojson
    [
      ("PaginationToken", option_to_yojson pagination_key_type_to_yojson x.pagination_token);
      ("UserImportJobs", option_to_yojson user_import_jobs_list_type_to_yojson x.user_import_jobs);
    ]

let list_user_import_jobs_request_to_yojson (x : list_user_import_jobs_request) =
  assoc_to_yojson
    [
      ("PaginationToken", option_to_yojson pagination_key_type_to_yojson x.pagination_token);
      ("MaxResults", Some (pool_query_limit_type_to_yojson x.max_results));
      ("UserPoolId", Some (user_pool_id_type_to_yojson x.user_pool_id));
    ]

let list_terms_response_to_yojson (x : list_terms_response) =
  assoc_to_yojson
    [
      ("NextToken", option_to_yojson string_type_to_yojson x.next_token);
      ("Terms", Some (terms_description_list_type_to_yojson x.terms));
    ]

let list_terms_request_max_results_integer_to_yojson = int_to_yojson

let list_terms_request_to_yojson (x : list_terms_request) =
  assoc_to_yojson
    [
      ("NextToken", option_to_yojson string_type_to_yojson x.next_token);
      ("MaxResults", option_to_yojson list_terms_request_max_results_integer_to_yojson x.max_results);
      ("UserPoolId", Some (user_pool_id_type_to_yojson x.user_pool_id));
    ]

let list_tags_for_resource_response_to_yojson (x : list_tags_for_resource_response) =
  assoc_to_yojson [ ("Tags", option_to_yojson user_pool_tags_type_to_yojson x.tags) ]

let list_tags_for_resource_request_to_yojson (x : list_tags_for_resource_request) =
  assoc_to_yojson [ ("ResourceArn", Some (arn_type_to_yojson x.resource_arn)) ]

let list_resource_servers_response_to_yojson (x : list_resource_servers_response) =
  assoc_to_yojson
    [
      ("NextToken", option_to_yojson pagination_key_type_to_yojson x.next_token);
      ("ResourceServers", Some (resource_servers_list_type_to_yojson x.resource_servers));
    ]

let list_resource_servers_limit_type_to_yojson = int_to_yojson

let list_resource_servers_request_to_yojson (x : list_resource_servers_request) =
  assoc_to_yojson
    [
      ("NextToken", option_to_yojson pagination_key_type_to_yojson x.next_token);
      ("MaxResults", option_to_yojson list_resource_servers_limit_type_to_yojson x.max_results);
      ("UserPoolId", Some (user_pool_id_type_to_yojson x.user_pool_id));
    ]

let list_providers_limit_type_to_yojson = int_to_yojson
let list_of_string_types_to_yojson tree = list_to_yojson string_type_to_yojson tree

let list_identity_providers_response_to_yojson (x : list_identity_providers_response) =
  assoc_to_yojson
    [
      ("NextToken", option_to_yojson pagination_key_type_to_yojson x.next_token);
      ("Providers", Some (providers_list_type_to_yojson x.providers));
    ]

let list_identity_providers_request_to_yojson (x : list_identity_providers_request) =
  assoc_to_yojson
    [
      ("NextToken", option_to_yojson pagination_key_type_to_yojson x.next_token);
      ("MaxResults", option_to_yojson list_providers_limit_type_to_yojson x.max_results);
      ("UserPoolId", Some (user_pool_id_type_to_yojson x.user_pool_id));
    ]

let group_list_type_to_yojson tree = list_to_yojson group_type_to_yojson tree

let list_groups_response_to_yojson (x : list_groups_response) =
  assoc_to_yojson
    [
      ("NextToken", option_to_yojson pagination_key_to_yojson x.next_token);
      ("Groups", option_to_yojson group_list_type_to_yojson x.groups);
    ]

let list_groups_request_to_yojson (x : list_groups_request) =
  assoc_to_yojson
    [
      ("NextToken", option_to_yojson pagination_key_to_yojson x.next_token);
      ("Limit", option_to_yojson query_limit_type_to_yojson x.limit);
      ("UserPoolId", Some (user_pool_id_type_to_yojson x.user_pool_id));
    ]

let device_type_to_yojson (x : device_type) =
  assoc_to_yojson
    [
      ( "DeviceLastAuthenticatedDate",
        option_to_yojson date_type_to_yojson x.device_last_authenticated_date );
      ("DeviceLastModifiedDate", option_to_yojson date_type_to_yojson x.device_last_modified_date);
      ("DeviceCreateDate", option_to_yojson date_type_to_yojson x.device_create_date);
      ("DeviceAttributes", option_to_yojson attribute_list_type_to_yojson x.device_attributes);
      ("DeviceKey", option_to_yojson device_key_type_to_yojson x.device_key);
    ]

let device_list_type_to_yojson tree = list_to_yojson device_type_to_yojson tree

let list_devices_response_to_yojson (x : list_devices_response) =
  assoc_to_yojson
    [
      ("PaginationToken", option_to_yojson search_pagination_token_type_to_yojson x.pagination_token);
      ("Devices", option_to_yojson device_list_type_to_yojson x.devices);
    ]

let list_devices_request_to_yojson (x : list_devices_request) =
  assoc_to_yojson
    [
      ("PaginationToken", option_to_yojson search_pagination_token_type_to_yojson x.pagination_token);
      ("Limit", option_to_yojson query_limit_type_to_yojson x.limit);
      ("AccessToken", Some (token_model_type_to_yojson x.access_token));
    ]

let available_challenge_list_type_to_yojson tree = list_to_yojson challenge_name_type_to_yojson tree

let initiate_auth_response_to_yojson (x : initiate_auth_response) =
  assoc_to_yojson
    [
      ( "AvailableChallenges",
        option_to_yojson available_challenge_list_type_to_yojson x.available_challenges );
      ( "AuthenticationResult",
        option_to_yojson authentication_result_type_to_yojson x.authentication_result );
      ( "ChallengeParameters",
        option_to_yojson challenge_parameters_type_to_yojson x.challenge_parameters );
      ("Session", option_to_yojson session_type_to_yojson x.session);
      ("ChallengeName", option_to_yojson challenge_name_type_to_yojson x.challenge_name);
    ]

let auth_flow_type_to_yojson (x : auth_flow_type) =
  match x with
  | USER_AUTH -> `String "USER_AUTH"
  | ADMIN_USER_PASSWORD_AUTH -> `String "ADMIN_USER_PASSWORD_AUTH"
  | USER_PASSWORD_AUTH -> `String "USER_PASSWORD_AUTH"
  | ADMIN_NO_SRP_AUTH -> `String "ADMIN_NO_SRP_AUTH"
  | CUSTOM_AUTH -> `String "CUSTOM_AUTH"
  | REFRESH_TOKEN -> `String "REFRESH_TOKEN"
  | REFRESH_TOKEN_AUTH -> `String "REFRESH_TOKEN_AUTH"
  | USER_SRP_AUTH -> `String "USER_SRP_AUTH"

let auth_parameters_type_to_yojson tree =
  map_to_yojson string_type_to_yojson string_type_to_yojson tree

let initiate_auth_request_to_yojson (x : initiate_auth_request) =
  assoc_to_yojson
    [
      ("Session", option_to_yojson session_type_to_yojson x.session);
      ("UserContextData", option_to_yojson user_context_data_type_to_yojson x.user_context_data);
      ("AnalyticsMetadata", option_to_yojson analytics_metadata_type_to_yojson x.analytics_metadata);
      ("ClientId", Some (client_id_type_to_yojson x.client_id));
      ("ClientMetadata", option_to_yojson client_metadata_type_to_yojson x.client_metadata);
      ("AuthParameters", option_to_yojson auth_parameters_type_to_yojson x.auth_parameters);
      ("AuthFlow", Some (auth_flow_type_to_yojson x.auth_flow));
    ]

let http_header_to_yojson (x : http_header) =
  assoc_to_yojson
    [
      ("headerValue", option_to_yojson string_type_to_yojson x.header_value);
      ("headerName", option_to_yojson string_type_to_yojson x.header_name);
    ]

let http_header_list_to_yojson tree = list_to_yojson http_header_to_yojson tree

let group_exists_exception_to_yojson (x : group_exists_exception) =
  assoc_to_yojson [ ("message", option_to_yojson message_type_to_yojson x.message) ]

let global_sign_out_response_to_yojson = unit_to_yojson

let global_sign_out_request_to_yojson (x : global_sign_out_request) =
  assoc_to_yojson [ ("AccessToken", Some (token_model_type_to_yojson x.access_token)) ]

let get_user_response_to_yojson (x : get_user_response) =
  assoc_to_yojson
    [
      ( "UserMFASettingList",
        option_to_yojson user_mfa_setting_list_type_to_yojson x.user_mfa_setting_list );
      ("PreferredMfaSetting", option_to_yojson string_type_to_yojson x.preferred_mfa_setting);
      ("MFAOptions", option_to_yojson mfa_option_list_type_to_yojson x.mfa_options);
      ("UserAttributes", Some (attribute_list_type_to_yojson x.user_attributes));
      ("Username", Some (username_type_to_yojson x.username));
    ]

let get_user_request_to_yojson (x : get_user_request) =
  assoc_to_yojson [ ("AccessToken", Some (token_model_type_to_yojson x.access_token)) ]

let get_user_pool_mfa_config_response_to_yojson (x : get_user_pool_mfa_config_response) =
  assoc_to_yojson
    [
      ( "WebAuthnConfiguration",
        option_to_yojson web_authn_configuration_type_to_yojson x.web_authn_configuration );
      ("MfaConfiguration", option_to_yojson user_pool_mfa_type_to_yojson x.mfa_configuration);
      ( "EmailMfaConfiguration",
        option_to_yojson email_mfa_config_type_to_yojson x.email_mfa_configuration );
      ( "SoftwareTokenMfaConfiguration",
        option_to_yojson software_token_mfa_config_type_to_yojson x.software_token_mfa_configuration
      );
      ("SmsMfaConfiguration", option_to_yojson sms_mfa_config_type_to_yojson x.sms_mfa_configuration);
    ]

let get_user_pool_mfa_config_request_to_yojson (x : get_user_pool_mfa_config_request) =
  assoc_to_yojson [ ("UserPoolId", Some (user_pool_id_type_to_yojson x.user_pool_id)) ]

let configured_user_auth_factors_list_type_to_yojson tree =
  list_to_yojson auth_factor_type_to_yojson tree

let get_user_auth_factors_response_to_yojson (x : get_user_auth_factors_response) =
  assoc_to_yojson
    [
      ( "ConfiguredUserAuthFactors",
        option_to_yojson configured_user_auth_factors_list_type_to_yojson
          x.configured_user_auth_factors );
      ( "UserMFASettingList",
        option_to_yojson user_mfa_setting_list_type_to_yojson x.user_mfa_setting_list );
      ("PreferredMfaSetting", option_to_yojson string_type_to_yojson x.preferred_mfa_setting);
      ("Username", Some (username_type_to_yojson x.username));
    ]

let get_user_auth_factors_request_to_yojson (x : get_user_auth_factors_request) =
  assoc_to_yojson [ ("AccessToken", Some (token_model_type_to_yojson x.access_token)) ]

let get_user_attribute_verification_code_response_to_yojson
    (x : get_user_attribute_verification_code_response) =
  assoc_to_yojson
    [
      ( "CodeDeliveryDetails",
        option_to_yojson code_delivery_details_type_to_yojson x.code_delivery_details );
    ]

let get_user_attribute_verification_code_request_to_yojson
    (x : get_user_attribute_verification_code_request) =
  assoc_to_yojson
    [
      ("ClientMetadata", option_to_yojson client_metadata_type_to_yojson x.client_metadata);
      ("AttributeName", Some (attribute_name_type_to_yojson x.attribute_name));
      ("AccessToken", Some (token_model_type_to_yojson x.access_token));
    ]

let get_ui_customization_response_to_yojson (x : get_ui_customization_response) =
  assoc_to_yojson [ ("UICustomization", Some (ui_customization_type_to_yojson x.ui_customization)) ]

let get_ui_customization_request_to_yojson (x : get_ui_customization_request) =
  assoc_to_yojson
    [
      ("ClientId", option_to_yojson client_id_type_to_yojson x.client_id);
      ("UserPoolId", Some (user_pool_id_type_to_yojson x.user_pool_id));
    ]

let get_tokens_from_refresh_token_response_to_yojson (x : get_tokens_from_refresh_token_response) =
  assoc_to_yojson
    [
      ( "AuthenticationResult",
        option_to_yojson authentication_result_type_to_yojson x.authentication_result );
    ]

let get_tokens_from_refresh_token_request_to_yojson (x : get_tokens_from_refresh_token_request) =
  assoc_to_yojson
    [
      ("ClientMetadata", option_to_yojson client_metadata_type_to_yojson x.client_metadata);
      ("DeviceKey", option_to_yojson device_key_type_to_yojson x.device_key);
      ("ClientSecret", option_to_yojson client_secret_type_to_yojson x.client_secret);
      ("ClientId", Some (client_id_type_to_yojson x.client_id));
      ("RefreshToken", Some (token_model_type_to_yojson x.refresh_token));
    ]

let get_signing_certificate_response_to_yojson (x : get_signing_certificate_response) =
  assoc_to_yojson [ ("Certificate", option_to_yojson string_type_to_yojson x.certificate) ]

let get_signing_certificate_request_to_yojson (x : get_signing_certificate_request) =
  assoc_to_yojson [ ("UserPoolId", Some (user_pool_id_type_to_yojson x.user_pool_id)) ]

let get_provisioned_limit_response_to_yojson (x : get_provisioned_limit_response) =
  assoc_to_yojson [ ("Limit", Some (limit_type_to_yojson x.limit)) ]

let get_provisioned_limit_request_to_yojson (x : get_provisioned_limit_request) =
  assoc_to_yojson [ ("LimitDefinition", Some (limit_definition_type_to_yojson x.limit_definition)) ]

let get_log_delivery_configuration_response_to_yojson (x : get_log_delivery_configuration_response)
    =
  assoc_to_yojson
    [
      ( "LogDeliveryConfiguration",
        option_to_yojson log_delivery_configuration_type_to_yojson x.log_delivery_configuration );
    ]

let get_log_delivery_configuration_request_to_yojson (x : get_log_delivery_configuration_request) =
  assoc_to_yojson [ ("UserPoolId", Some (user_pool_id_type_to_yojson x.user_pool_id)) ]

let get_identity_provider_by_identifier_response_to_yojson
    (x : get_identity_provider_by_identifier_response) =
  assoc_to_yojson
    [ ("IdentityProvider", Some (identity_provider_type_to_yojson x.identity_provider)) ]

let get_identity_provider_by_identifier_request_to_yojson
    (x : get_identity_provider_by_identifier_request) =
  assoc_to_yojson
    [
      ("IdpIdentifier", Some (idp_identifier_type_to_yojson x.idp_identifier));
      ("UserPoolId", Some (user_pool_id_type_to_yojson x.user_pool_id));
    ]

let get_group_response_to_yojson (x : get_group_response) =
  assoc_to_yojson [ ("Group", option_to_yojson group_type_to_yojson x.group) ]

let get_group_request_to_yojson (x : get_group_request) =
  assoc_to_yojson
    [
      ("UserPoolId", Some (user_pool_id_type_to_yojson x.user_pool_id));
      ("GroupName", Some (group_name_type_to_yojson x.group_name));
    ]

let get_device_response_to_yojson (x : get_device_response) =
  assoc_to_yojson [ ("Device", Some (device_type_to_yojson x.device)) ]

let get_device_request_to_yojson (x : get_device_request) =
  assoc_to_yojson
    [
      ("AccessToken", option_to_yojson token_model_type_to_yojson x.access_token);
      ("DeviceKey", Some (device_key_type_to_yojson x.device_key));
    ]

let get_csv_header_response_to_yojson (x : get_csv_header_response) =
  assoc_to_yojson
    [
      ("CSVHeader", option_to_yojson list_of_string_types_to_yojson x.csv_header);
      ("UserPoolId", option_to_yojson user_pool_id_type_to_yojson x.user_pool_id);
    ]

let get_csv_header_request_to_yojson (x : get_csv_header_request) =
  assoc_to_yojson [ ("UserPoolId", Some (user_pool_id_type_to_yojson x.user_pool_id)) ]

let generate_secret_to_yojson = bool_to_yojson

let forgot_password_response_to_yojson (x : forgot_password_response) =
  assoc_to_yojson
    [
      ( "CodeDeliveryDetails",
        option_to_yojson code_delivery_details_type_to_yojson x.code_delivery_details );
    ]

let forgot_password_request_to_yojson (x : forgot_password_request) =
  assoc_to_yojson
    [
      ("ClientMetadata", option_to_yojson client_metadata_type_to_yojson x.client_metadata);
      ("AnalyticsMetadata", option_to_yojson analytics_metadata_type_to_yojson x.analytics_metadata);
      ("Username", Some (username_type_to_yojson x.username));
      ("UserContextData", option_to_yojson user_context_data_type_to_yojson x.user_context_data);
      ("SecretHash", option_to_yojson secret_hash_type_to_yojson x.secret_hash);
      ("ClientId", Some (client_id_type_to_yojson x.client_id));
    ]

let forget_device_request_to_yojson (x : forget_device_request) =
  assoc_to_yojson
    [
      ("DeviceKey", Some (device_key_type_to_yojson x.device_key));
      ("AccessToken", option_to_yojson token_model_type_to_yojson x.access_token);
    ]

let force_alias_creation_to_yojson = bool_to_yojson

let event_type_to_yojson (x : event_type) =
  match x with
  | ResendCode -> `String "ResendCode"
  | PasswordChange -> `String "PasswordChange"
  | ForgotPassword -> `String "ForgotPassword"
  | SignUp -> `String "SignUp"
  | SignIn -> `String "SignIn"

let event_risk_type_to_yojson (x : event_risk_type) =
  assoc_to_yojson
    [
      ( "CompromisedCredentialsDetected",
        option_to_yojson wrapped_boolean_type_to_yojson x.compromised_credentials_detected );
      ("RiskLevel", option_to_yojson risk_level_type_to_yojson x.risk_level);
      ("RiskDecision", option_to_yojson risk_decision_type_to_yojson x.risk_decision);
    ]

let event_response_type_to_yojson (x : event_response_type) =
  match x with
  | InProgress -> `String "InProgress"
  | Fail -> `String "Fail"
  | Pass -> `String "Pass"

let event_feedback_type_to_yojson (x : event_feedback_type) =
  assoc_to_yojson
    [
      ("FeedbackDate", option_to_yojson date_type_to_yojson x.feedback_date);
      ("Provider", Some (string_type_to_yojson x.provider));
      ("FeedbackValue", Some (feedback_value_type_to_yojson x.feedback_value));
    ]

let event_context_data_type_to_yojson (x : event_context_data_type) =
  assoc_to_yojson
    [
      ("Country", option_to_yojson string_type_to_yojson x.country);
      ("City", option_to_yojson string_type_to_yojson x.city);
      ("Timezone", option_to_yojson string_type_to_yojson x.timezone);
      ("DeviceName", option_to_yojson string_type_to_yojson x.device_name);
      ("IpAddress", option_to_yojson string_type_to_yojson x.ip_address);
    ]

let duplicate_provider_exception_to_yojson (x : duplicate_provider_exception) =
  assoc_to_yojson [ ("message", option_to_yojson message_type_to_yojson x.message) ]

let domain_version_type_to_yojson = string_to_yojson

let domain_status_type_to_yojson (x : domain_status_type) =
  match x with
  | FAILED -> `String "FAILED"
  | ACTIVE -> `String "ACTIVE"
  | UPDATING -> `String "UPDATING"
  | DELETING -> `String "DELETING"
  | CREATING -> `String "CREATING"

let aws_account_id_type_to_yojson = string_to_yojson

let domain_description_type_to_yojson (x : domain_description_type) =
  assoc_to_yojson
    [
      ("Routing", option_to_yojson routing_type_to_yojson x.routing);
      ( "ManagedLoginVersion",
        option_to_yojson wrapped_integer_type_to_yojson x.managed_login_version );
      ( "CustomDomainConfig",
        option_to_yojson custom_domain_config_type_to_yojson x.custom_domain_config );
      ("Status", option_to_yojson domain_status_type_to_yojson x.status);
      ("Version", option_to_yojson domain_version_type_to_yojson x.version);
      ("CloudFrontDistribution", option_to_yojson string_type_to_yojson x.cloud_front_distribution);
      ("S3Bucket", option_to_yojson s3_bucket_type_to_yojson x.s3_bucket);
      ("Domain", option_to_yojson domain_type_to_yojson x.domain);
      ("AWSAccountId", option_to_yojson aws_account_id_type_to_yojson x.aws_account_id);
      ("UserPoolId", option_to_yojson user_pool_id_type_to_yojson x.user_pool_id);
    ]

let device_secret_verifier_config_type_to_yojson (x : device_secret_verifier_config_type) =
  assoc_to_yojson
    [
      ("Salt", option_to_yojson string_type_to_yojson x.salt);
      ("PasswordVerifier", option_to_yojson string_type_to_yojson x.password_verifier);
    ]

let device_name_type_to_yojson = string_to_yojson

let device_key_exists_exception_to_yojson (x : device_key_exists_exception) =
  assoc_to_yojson [ ("message", option_to_yojson message_type_to_yojson x.message) ]

let describe_user_pool_response_to_yojson (x : describe_user_pool_response) =
  assoc_to_yojson [ ("UserPool", option_to_yojson user_pool_type_to_yojson x.user_pool) ]

let describe_user_pool_request_to_yojson (x : describe_user_pool_request) =
  assoc_to_yojson [ ("UserPoolId", Some (user_pool_id_type_to_yojson x.user_pool_id)) ]

let describe_user_pool_domain_response_to_yojson (x : describe_user_pool_domain_response) =
  assoc_to_yojson
    [
      ("DomainDescription", option_to_yojson domain_description_type_to_yojson x.domain_description);
    ]

let describe_user_pool_domain_request_to_yojson (x : describe_user_pool_domain_request) =
  assoc_to_yojson [ ("Domain", Some (domain_type_to_yojson x.domain)) ]

let describe_user_pool_client_response_to_yojson (x : describe_user_pool_client_response) =
  assoc_to_yojson
    [ ("UserPoolClient", option_to_yojson user_pool_client_type_to_yojson x.user_pool_client) ]

let describe_user_pool_client_request_to_yojson (x : describe_user_pool_client_request) =
  assoc_to_yojson
    [
      ("ClientId", Some (client_id_type_to_yojson x.client_id));
      ("UserPoolId", Some (user_pool_id_type_to_yojson x.user_pool_id));
    ]

let describe_user_import_job_response_to_yojson (x : describe_user_import_job_response) =
  assoc_to_yojson
    [ ("UserImportJob", option_to_yojson user_import_job_type_to_yojson x.user_import_job) ]

let describe_user_import_job_request_to_yojson (x : describe_user_import_job_request) =
  assoc_to_yojson
    [
      ("JobId", Some (user_import_job_id_type_to_yojson x.job_id));
      ("UserPoolId", Some (user_pool_id_type_to_yojson x.user_pool_id));
    ]

let describe_terms_response_to_yojson (x : describe_terms_response) =
  assoc_to_yojson [ ("Terms", option_to_yojson terms_type_to_yojson x.terms) ]

let describe_terms_request_to_yojson (x : describe_terms_request) =
  assoc_to_yojson
    [
      ("UserPoolId", Some (user_pool_id_type_to_yojson x.user_pool_id));
      ("TermsId", Some (terms_id_type_to_yojson x.terms_id));
    ]

let describe_risk_configuration_response_to_yojson (x : describe_risk_configuration_response) =
  assoc_to_yojson
    [ ("RiskConfiguration", Some (risk_configuration_type_to_yojson x.risk_configuration)) ]

let describe_risk_configuration_request_to_yojson (x : describe_risk_configuration_request) =
  assoc_to_yojson
    [
      ("ClientId", option_to_yojson client_id_type_to_yojson x.client_id);
      ("UserPoolId", Some (user_pool_id_type_to_yojson x.user_pool_id));
    ]

let describe_resource_server_response_to_yojson (x : describe_resource_server_response) =
  assoc_to_yojson [ ("ResourceServer", Some (resource_server_type_to_yojson x.resource_server)) ]

let describe_resource_server_request_to_yojson (x : describe_resource_server_request) =
  assoc_to_yojson
    [
      ("Identifier", Some (resource_server_identifier_type_to_yojson x.identifier));
      ("UserPoolId", Some (user_pool_id_type_to_yojson x.user_pool_id));
    ]

let describe_managed_login_branding_response_to_yojson
    (x : describe_managed_login_branding_response) =
  assoc_to_yojson
    [
      ( "ManagedLoginBranding",
        option_to_yojson managed_login_branding_type_to_yojson x.managed_login_branding );
    ]

let describe_managed_login_branding_request_to_yojson (x : describe_managed_login_branding_request)
    =
  assoc_to_yojson
    [
      ("ReturnMergedResources", option_to_yojson boolean_type_to_yojson x.return_merged_resources);
      ( "ManagedLoginBrandingId",
        Some (managed_login_branding_id_type_to_yojson x.managed_login_branding_id) );
      ("UserPoolId", Some (user_pool_id_type_to_yojson x.user_pool_id));
    ]

let describe_managed_login_branding_by_client_response_to_yojson
    (x : describe_managed_login_branding_by_client_response) =
  assoc_to_yojson
    [
      ( "ManagedLoginBranding",
        option_to_yojson managed_login_branding_type_to_yojson x.managed_login_branding );
    ]

let describe_managed_login_branding_by_client_request_to_yojson
    (x : describe_managed_login_branding_by_client_request) =
  assoc_to_yojson
    [
      ("ReturnMergedResources", option_to_yojson boolean_type_to_yojson x.return_merged_resources);
      ("ClientId", Some (client_id_type_to_yojson x.client_id));
      ("UserPoolId", Some (user_pool_id_type_to_yojson x.user_pool_id));
    ]

let describe_identity_provider_response_to_yojson (x : describe_identity_provider_response) =
  assoc_to_yojson
    [ ("IdentityProvider", Some (identity_provider_type_to_yojson x.identity_provider)) ]

let describe_identity_provider_request_to_yojson (x : describe_identity_provider_request) =
  assoc_to_yojson
    [
      ("ProviderName", Some (provider_name_type_to_yojson x.provider_name));
      ("UserPoolId", Some (user_pool_id_type_to_yojson x.user_pool_id));
    ]

let delivery_medium_list_type_to_yojson tree = list_to_yojson delivery_medium_type_to_yojson tree
let delete_web_authn_credential_response_to_yojson = unit_to_yojson

let delete_web_authn_credential_request_to_yojson (x : delete_web_authn_credential_request) =
  assoc_to_yojson
    [
      ("CredentialId", Some (string_type_to_yojson x.credential_id));
      ("AccessToken", Some (token_model_type_to_yojson x.access_token));
    ]

let delete_user_request_to_yojson (x : delete_user_request) =
  assoc_to_yojson [ ("AccessToken", Some (token_model_type_to_yojson x.access_token)) ]

let delete_user_pool_request_to_yojson (x : delete_user_pool_request) =
  assoc_to_yojson [ ("UserPoolId", Some (user_pool_id_type_to_yojson x.user_pool_id)) ]

let delete_user_pool_replica_response_to_yojson (x : delete_user_pool_replica_response) =
  assoc_to_yojson
    [ ("UserPoolReplica", option_to_yojson user_pool_replica_type_to_yojson x.user_pool_replica) ]

let delete_user_pool_replica_request_to_yojson (x : delete_user_pool_replica_request) =
  assoc_to_yojson
    [
      ("RegionName", Some (region_name_type_to_yojson x.region_name));
      ("UserPoolId", Some (user_pool_id_type_to_yojson x.user_pool_id));
    ]

let delete_user_pool_domain_response_to_yojson = unit_to_yojson

let delete_user_pool_domain_request_to_yojson (x : delete_user_pool_domain_request) =
  assoc_to_yojson
    [
      ("UserPoolId", Some (user_pool_id_type_to_yojson x.user_pool_id));
      ("Domain", Some (domain_type_to_yojson x.domain));
    ]

let delete_user_pool_client_secret_response_to_yojson = unit_to_yojson

let delete_user_pool_client_secret_request_to_yojson (x : delete_user_pool_client_secret_request) =
  assoc_to_yojson
    [
      ("ClientSecretId", Some (client_secret_id_type_to_yojson x.client_secret_id));
      ("ClientId", Some (client_id_type_to_yojson x.client_id));
      ("UserPoolId", Some (user_pool_id_type_to_yojson x.user_pool_id));
    ]

let delete_user_pool_client_request_to_yojson (x : delete_user_pool_client_request) =
  assoc_to_yojson
    [
      ("ClientId", Some (client_id_type_to_yojson x.client_id));
      ("UserPoolId", Some (user_pool_id_type_to_yojson x.user_pool_id));
    ]

let delete_user_attributes_response_to_yojson = unit_to_yojson
let attribute_name_list_type_to_yojson tree = list_to_yojson attribute_name_type_to_yojson tree

let delete_user_attributes_request_to_yojson (x : delete_user_attributes_request) =
  assoc_to_yojson
    [
      ("AccessToken", Some (token_model_type_to_yojson x.access_token));
      ("UserAttributeNames", Some (attribute_name_list_type_to_yojson x.user_attribute_names));
    ]

let delete_terms_request_to_yojson (x : delete_terms_request) =
  assoc_to_yojson
    [
      ("UserPoolId", Some (user_pool_id_type_to_yojson x.user_pool_id));
      ("TermsId", Some (terms_id_type_to_yojson x.terms_id));
    ]

let delete_resource_server_request_to_yojson (x : delete_resource_server_request) =
  assoc_to_yojson
    [
      ("Identifier", Some (resource_server_identifier_type_to_yojson x.identifier));
      ("UserPoolId", Some (user_pool_id_type_to_yojson x.user_pool_id));
    ]

let delete_managed_login_branding_request_to_yojson (x : delete_managed_login_branding_request) =
  assoc_to_yojson
    [
      ("UserPoolId", Some (user_pool_id_type_to_yojson x.user_pool_id));
      ( "ManagedLoginBrandingId",
        Some (managed_login_branding_id_type_to_yojson x.managed_login_branding_id) );
    ]

let delete_identity_provider_request_to_yojson (x : delete_identity_provider_request) =
  assoc_to_yojson
    [
      ("ProviderName", Some (provider_name_type_to_yojson x.provider_name));
      ("UserPoolId", Some (user_pool_id_type_to_yojson x.user_pool_id));
    ]

let delete_group_request_to_yojson (x : delete_group_request) =
  assoc_to_yojson
    [
      ("UserPoolId", Some (user_pool_id_type_to_yojson x.user_pool_id));
      ("GroupName", Some (group_name_type_to_yojson x.group_name));
    ]

let custom_attributes_list_type_to_yojson tree = list_to_yojson schema_attribute_type_to_yojson tree

let create_user_pool_response_to_yojson (x : create_user_pool_response) =
  assoc_to_yojson [ ("UserPool", option_to_yojson user_pool_type_to_yojson x.user_pool) ]

let create_user_pool_request_to_yojson (x : create_user_pool_request) =
  assoc_to_yojson
    [
      ( "IssuerConfiguration",
        option_to_yojson issuer_configuration_type_to_yojson x.issuer_configuration );
      ("KeyConfiguration", option_to_yojson key_configuration_type_to_yojson x.key_configuration);
      ("UserPoolTier", option_to_yojson user_pool_tier_type_to_yojson x.user_pool_tier);
      ( "AccountRecoverySetting",
        option_to_yojson account_recovery_setting_type_to_yojson x.account_recovery_setting );
      ( "UsernameConfiguration",
        option_to_yojson username_configuration_type_to_yojson x.username_configuration );
      ("UserPoolAddOns", option_to_yojson user_pool_add_ons_type_to_yojson x.user_pool_add_ons);
      ("Schema", option_to_yojson schema_attributes_list_type_to_yojson x.schema);
      ( "AdminCreateUserConfig",
        option_to_yojson admin_create_user_config_type_to_yojson x.admin_create_user_config );
      ("UserPoolTags", option_to_yojson user_pool_tags_type_to_yojson x.user_pool_tags);
      ("SmsConfiguration", option_to_yojson sms_configuration_type_to_yojson x.sms_configuration);
      ( "EmailConfiguration",
        option_to_yojson email_configuration_type_to_yojson x.email_configuration );
      ( "DeviceConfiguration",
        option_to_yojson device_configuration_type_to_yojson x.device_configuration );
      ( "UserAttributeUpdateSettings",
        option_to_yojson user_attribute_update_settings_type_to_yojson
          x.user_attribute_update_settings );
      ("MfaConfiguration", option_to_yojson user_pool_mfa_type_to_yojson x.mfa_configuration);
      ( "SmsAuthenticationMessage",
        option_to_yojson sms_verification_message_type_to_yojson x.sms_authentication_message );
      ( "VerificationMessageTemplate",
        option_to_yojson verification_message_template_type_to_yojson
          x.verification_message_template );
      ( "EmailVerificationSubject",
        option_to_yojson email_verification_subject_type_to_yojson x.email_verification_subject );
      ( "EmailVerificationMessage",
        option_to_yojson email_verification_message_type_to_yojson x.email_verification_message );
      ( "SmsVerificationMessage",
        option_to_yojson sms_verification_message_type_to_yojson x.sms_verification_message );
      ( "UsernameAttributes",
        option_to_yojson username_attributes_list_type_to_yojson x.username_attributes );
      ("AliasAttributes", option_to_yojson alias_attributes_list_type_to_yojson x.alias_attributes);
      ( "AutoVerifiedAttributes",
        option_to_yojson verified_attributes_list_type_to_yojson x.auto_verified_attributes );
      ("LambdaConfig", option_to_yojson lambda_config_type_to_yojson x.lambda_config);
      ( "DeletionProtection",
        option_to_yojson deletion_protection_type_to_yojson x.deletion_protection );
      ("Policies", option_to_yojson user_pool_policy_type_to_yojson x.policies);
      ("PoolName", Some (user_pool_name_type_to_yojson x.pool_name));
    ]

let create_user_pool_replica_response_to_yojson (x : create_user_pool_replica_response) =
  assoc_to_yojson
    [ ("UserPoolReplica", option_to_yojson user_pool_replica_type_to_yojson x.user_pool_replica) ]

let create_user_pool_replica_request_to_yojson (x : create_user_pool_replica_request) =
  assoc_to_yojson
    [
      ("UserPoolTags", option_to_yojson user_pool_tags_type_to_yojson x.user_pool_tags);
      ("RegionName", Some (region_name_type_to_yojson x.region_name));
      ("UserPoolId", Some (user_pool_id_type_to_yojson x.user_pool_id));
    ]

let create_user_pool_domain_response_to_yojson (x : create_user_pool_domain_response) =
  assoc_to_yojson
    [
      ("Routing", option_to_yojson routing_type_to_yojson x.routing);
      ("CloudFrontDomain", option_to_yojson domain_type_to_yojson x.cloud_front_domain);
      ( "ManagedLoginVersion",
        option_to_yojson wrapped_integer_type_to_yojson x.managed_login_version );
    ]

let create_user_pool_domain_request_to_yojson (x : create_user_pool_domain_request) =
  assoc_to_yojson
    [
      ("Routing", option_to_yojson routing_type_to_yojson x.routing);
      ( "CustomDomainConfig",
        option_to_yojson custom_domain_config_type_to_yojson x.custom_domain_config );
      ( "ManagedLoginVersion",
        option_to_yojson wrapped_integer_type_to_yojson x.managed_login_version );
      ("UserPoolId", Some (user_pool_id_type_to_yojson x.user_pool_id));
      ("Domain", Some (domain_type_to_yojson x.domain));
    ]

let create_user_pool_client_response_to_yojson (x : create_user_pool_client_response) =
  assoc_to_yojson
    [ ("UserPoolClient", option_to_yojson user_pool_client_type_to_yojson x.user_pool_client) ]

let create_user_pool_client_request_to_yojson (x : create_user_pool_client_request) =
  assoc_to_yojson
    [
      ( "RefreshTokenRotation",
        option_to_yojson refresh_token_rotation_type_to_yojson x.refresh_token_rotation );
      ( "AuthSessionValidity",
        option_to_yojson auth_session_validity_type_to_yojson x.auth_session_validity );
      ( "EnablePropagateAdditionalUserContextData",
        option_to_yojson wrapped_boolean_type_to_yojson
          x.enable_propagate_additional_user_context_data );
      ( "EnableTokenRevocation",
        option_to_yojson wrapped_boolean_type_to_yojson x.enable_token_revocation );
      ( "PreventUserExistenceErrors",
        option_to_yojson prevent_user_existence_error_types_to_yojson
          x.prevent_user_existence_errors );
      ( "AnalyticsConfiguration",
        option_to_yojson analytics_configuration_type_to_yojson x.analytics_configuration );
      ( "AllowedOAuthFlowsUserPoolClient",
        option_to_yojson boolean_type_to_yojson x.allowed_o_auth_flows_user_pool_client );
      ("AllowedOAuthScopes", option_to_yojson scope_list_type_to_yojson x.allowed_o_auth_scopes);
      ("AllowedOAuthFlows", option_to_yojson o_auth_flows_type_to_yojson x.allowed_o_auth_flows);
      ("DefaultRedirectURI", option_to_yojson redirect_url_type_to_yojson x.default_redirect_ur_i);
      ("LogoutURLs", option_to_yojson logout_ur_ls_list_type_to_yojson x.logout_ur_ls);
      ("CallbackURLs", option_to_yojson callback_ur_ls_list_type_to_yojson x.callback_ur_ls);
      ( "SupportedIdentityProviders",
        option_to_yojson supported_identity_providers_list_type_to_yojson
          x.supported_identity_providers );
      ( "ExplicitAuthFlows",
        option_to_yojson explicit_auth_flows_list_type_to_yojson x.explicit_auth_flows );
      ("WriteAttributes", option_to_yojson client_permission_list_type_to_yojson x.write_attributes);
      ("ReadAttributes", option_to_yojson client_permission_list_type_to_yojson x.read_attributes);
      ( "TokenValidityUnits",
        option_to_yojson token_validity_units_type_to_yojson x.token_validity_units );
      ("IdTokenValidity", option_to_yojson id_token_validity_type_to_yojson x.id_token_validity);
      ( "AccessTokenValidity",
        option_to_yojson access_token_validity_type_to_yojson x.access_token_validity );
      ( "RefreshTokenValidity",
        option_to_yojson refresh_token_validity_type_to_yojson x.refresh_token_validity );
      ("ClientSecret", option_to_yojson client_secret_type_to_yojson x.client_secret);
      ("GenerateSecret", option_to_yojson generate_secret_to_yojson x.generate_secret);
      ("ClientName", Some (client_name_type_to_yojson x.client_name));
      ("UserPoolId", Some (user_pool_id_type_to_yojson x.user_pool_id));
    ]

let create_user_import_job_response_to_yojson (x : create_user_import_job_response) =
  assoc_to_yojson
    [ ("UserImportJob", option_to_yojson user_import_job_type_to_yojson x.user_import_job) ]

let create_user_import_job_request_to_yojson (x : create_user_import_job_request) =
  assoc_to_yojson
    [
      ("CloudWatchLogsRoleArn", Some (arn_type_to_yojson x.cloud_watch_logs_role_arn));
      ("UserPoolId", Some (user_pool_id_type_to_yojson x.user_pool_id));
      ("JobName", Some (user_import_job_name_type_to_yojson x.job_name));
    ]

let create_terms_response_to_yojson (x : create_terms_response) =
  assoc_to_yojson [ ("Terms", option_to_yojson terms_type_to_yojson x.terms) ]

let create_terms_request_to_yojson (x : create_terms_request) =
  assoc_to_yojson
    [
      ("Links", option_to_yojson links_type_to_yojson x.links);
      ("Enforcement", Some (terms_enforcement_type_to_yojson x.enforcement));
      ("TermsSource", Some (terms_source_type_to_yojson x.terms_source));
      ("TermsName", Some (terms_name_type_to_yojson x.terms_name));
      ("ClientId", Some (client_id_type_to_yojson x.client_id));
      ("UserPoolId", Some (user_pool_id_type_to_yojson x.user_pool_id));
    ]

let create_resource_server_response_to_yojson (x : create_resource_server_response) =
  assoc_to_yojson [ ("ResourceServer", Some (resource_server_type_to_yojson x.resource_server)) ]

let create_resource_server_request_to_yojson (x : create_resource_server_request) =
  assoc_to_yojson
    [
      ("Scopes", option_to_yojson resource_server_scope_list_type_to_yojson x.scopes);
      ("Name", Some (resource_server_name_type_to_yojson x.name));
      ("Identifier", Some (resource_server_identifier_type_to_yojson x.identifier));
      ("UserPoolId", Some (user_pool_id_type_to_yojson x.user_pool_id));
    ]

let create_managed_login_branding_response_to_yojson (x : create_managed_login_branding_response) =
  assoc_to_yojson
    [
      ( "ManagedLoginBranding",
        option_to_yojson managed_login_branding_type_to_yojson x.managed_login_branding );
    ]

let create_managed_login_branding_request_to_yojson (x : create_managed_login_branding_request) =
  assoc_to_yojson
    [
      ("Assets", option_to_yojson asset_list_type_to_yojson x.assets);
      ("Settings", option_to_yojson document_to_yojson x.settings);
      ( "UseCognitoProvidedValues",
        option_to_yojson boolean_type_to_yojson x.use_cognito_provided_values );
      ("ClientId", Some (client_id_type_to_yojson x.client_id));
      ("UserPoolId", Some (user_pool_id_type_to_yojson x.user_pool_id));
    ]

let create_identity_provider_response_to_yojson (x : create_identity_provider_response) =
  assoc_to_yojson
    [ ("IdentityProvider", Some (identity_provider_type_to_yojson x.identity_provider)) ]

let create_identity_provider_request_to_yojson (x : create_identity_provider_request) =
  assoc_to_yojson
    [
      ("IdpIdentifiers", option_to_yojson idp_identifiers_list_type_to_yojson x.idp_identifiers);
      ("AttributeMapping", option_to_yojson attribute_mapping_type_to_yojson x.attribute_mapping);
      ("ProviderDetails", Some (provider_details_type_to_yojson x.provider_details));
      ("ProviderType", Some (identity_provider_type_type_to_yojson x.provider_type));
      ("ProviderName", Some (provider_name_type_v2_to_yojson x.provider_name));
      ("UserPoolId", Some (user_pool_id_type_to_yojson x.user_pool_id));
    ]

let create_group_response_to_yojson (x : create_group_response) =
  assoc_to_yojson [ ("Group", option_to_yojson group_type_to_yojson x.group) ]

let create_group_request_to_yojson (x : create_group_request) =
  assoc_to_yojson
    [
      ("Precedence", option_to_yojson precedence_type_to_yojson x.precedence);
      ("RoleArn", option_to_yojson arn_type_to_yojson x.role_arn);
      ("Description", option_to_yojson description_type_to_yojson x.description);
      ("UserPoolId", Some (user_pool_id_type_to_yojson x.user_pool_id));
      ("GroupName", Some (group_name_type_to_yojson x.group_name));
    ]

let context_data_type_to_yojson (x : context_data_type) =
  assoc_to_yojson
    [
      ("EncodedData", option_to_yojson string_type_to_yojson x.encoded_data);
      ("HttpHeaders", Some (http_header_list_to_yojson x.http_headers));
      ("ServerPath", Some (string_type_to_yojson x.server_path));
      ("ServerName", Some (string_type_to_yojson x.server_name));
      ("IpAddress", Some (string_type_to_yojson x.ip_address));
    ]

let confirm_sign_up_response_to_yojson (x : confirm_sign_up_response) =
  assoc_to_yojson [ ("Session", option_to_yojson session_type_to_yojson x.session) ]

let confirm_sign_up_request_to_yojson (x : confirm_sign_up_request) =
  assoc_to_yojson
    [
      ("Session", option_to_yojson session_type_to_yojson x.session);
      ("ClientMetadata", option_to_yojson client_metadata_type_to_yojson x.client_metadata);
      ("UserContextData", option_to_yojson user_context_data_type_to_yojson x.user_context_data);
      ("AnalyticsMetadata", option_to_yojson analytics_metadata_type_to_yojson x.analytics_metadata);
      ("ForceAliasCreation", option_to_yojson force_alias_creation_to_yojson x.force_alias_creation);
      ("ConfirmationCode", Some (confirmation_code_type_to_yojson x.confirmation_code));
      ("Username", Some (username_type_to_yojson x.username));
      ("SecretHash", option_to_yojson secret_hash_type_to_yojson x.secret_hash);
      ("ClientId", Some (client_id_type_to_yojson x.client_id));
    ]

let confirm_forgot_password_response_to_yojson = unit_to_yojson

let confirm_forgot_password_request_to_yojson (x : confirm_forgot_password_request) =
  assoc_to_yojson
    [
      ("ClientMetadata", option_to_yojson client_metadata_type_to_yojson x.client_metadata);
      ("UserContextData", option_to_yojson user_context_data_type_to_yojson x.user_context_data);
      ("AnalyticsMetadata", option_to_yojson analytics_metadata_type_to_yojson x.analytics_metadata);
      ("Password", Some (password_type_to_yojson x.password));
      ("ConfirmationCode", Some (confirmation_code_type_to_yojson x.confirmation_code));
      ("Username", Some (username_type_to_yojson x.username));
      ("SecretHash", option_to_yojson secret_hash_type_to_yojson x.secret_hash);
      ("ClientId", Some (client_id_type_to_yojson x.client_id));
    ]

let confirm_device_response_to_yojson (x : confirm_device_response) =
  assoc_to_yojson
    [
      ( "UserConfirmationNecessary",
        option_to_yojson boolean_type_to_yojson x.user_confirmation_necessary );
    ]

let confirm_device_request_to_yojson (x : confirm_device_request) =
  assoc_to_yojson
    [
      ("DeviceName", option_to_yojson device_name_type_to_yojson x.device_name);
      ( "DeviceSecretVerifierConfig",
        option_to_yojson device_secret_verifier_config_type_to_yojson
          x.device_secret_verifier_config );
      ("DeviceKey", Some (device_key_type_to_yojson x.device_key));
      ("AccessToken", Some (token_model_type_to_yojson x.access_token));
    ]

let complete_web_authn_registration_response_to_yojson = unit_to_yojson

let complete_web_authn_registration_request_to_yojson (x : complete_web_authn_registration_request)
    =
  assoc_to_yojson
    [
      ("Credential", Some (document_to_yojson x.credential));
      ("AccessToken", Some (token_model_type_to_yojson x.access_token));
    ]

let change_password_response_to_yojson = unit_to_yojson

let change_password_request_to_yojson (x : change_password_request) =
  assoc_to_yojson
    [
      ("AccessToken", Some (token_model_type_to_yojson x.access_token));
      ("ProposedPassword", Some (password_type_to_yojson x.proposed_password));
      ("PreviousPassword", option_to_yojson password_type_to_yojson x.previous_password);
    ]

let challenge_name_to_yojson (x : challenge_name) =
  match x with Mfa -> `String "Mfa" | Password -> `String "Password"

let challenge_response_to_yojson (x : challenge_response) =
  match x with Failure -> `String "Failure" | Success -> `String "Success"

let challenge_response_type_to_yojson (x : challenge_response_type) =
  assoc_to_yojson
    [
      ("ChallengeResponse", option_to_yojson challenge_response_to_yojson x.challenge_response);
      ("ChallengeName", option_to_yojson challenge_name_to_yojson x.challenge_name);
    ]

let challenge_response_list_type_to_yojson tree =
  list_to_yojson challenge_response_type_to_yojson tree

let auth_event_type_to_yojson (x : auth_event_type) =
  assoc_to_yojson
    [
      ("EventFeedback", option_to_yojson event_feedback_type_to_yojson x.event_feedback);
      ("EventContextData", option_to_yojson event_context_data_type_to_yojson x.event_context_data);
      ( "ChallengeResponses",
        option_to_yojson challenge_response_list_type_to_yojson x.challenge_responses );
      ("EventRisk", option_to_yojson event_risk_type_to_yojson x.event_risk);
      ("EventResponse", option_to_yojson event_response_type_to_yojson x.event_response);
      ("CreationDate", option_to_yojson date_type_to_yojson x.creation_date);
      ("EventType", option_to_yojson event_type_to_yojson x.event_type);
      ("EventId", option_to_yojson string_type_to_yojson x.event_id);
    ]

let auth_events_type_to_yojson tree = list_to_yojson auth_event_type_to_yojson tree

let associate_software_token_response_to_yojson (x : associate_software_token_response) =
  assoc_to_yojson
    [
      ("Session", option_to_yojson session_type_to_yojson x.session);
      ("SecretCode", option_to_yojson secret_code_type_to_yojson x.secret_code);
    ]

let associate_software_token_request_to_yojson (x : associate_software_token_request) =
  assoc_to_yojson
    [
      ("Session", option_to_yojson session_type_to_yojson x.session);
      ("AccessToken", option_to_yojson token_model_type_to_yojson x.access_token);
    ]

let admin_user_global_sign_out_response_to_yojson = unit_to_yojson

let admin_user_global_sign_out_request_to_yojson (x : admin_user_global_sign_out_request) =
  assoc_to_yojson
    [
      ("Username", Some (username_type_to_yojson x.username));
      ("UserPoolId", Some (user_pool_id_type_to_yojson x.user_pool_id));
    ]

let admin_update_user_attributes_response_to_yojson = unit_to_yojson

let admin_update_user_attributes_request_to_yojson (x : admin_update_user_attributes_request) =
  assoc_to_yojson
    [
      ("ClientMetadata", option_to_yojson client_metadata_type_to_yojson x.client_metadata);
      ("UserAttributes", Some (attribute_list_type_to_yojson x.user_attributes));
      ("Username", Some (username_type_to_yojson x.username));
      ("UserPoolId", Some (user_pool_id_type_to_yojson x.user_pool_id));
    ]

let admin_update_device_status_response_to_yojson = unit_to_yojson

let admin_update_device_status_request_to_yojson (x : admin_update_device_status_request) =
  assoc_to_yojson
    [
      ( "DeviceRememberedStatus",
        option_to_yojson device_remembered_status_type_to_yojson x.device_remembered_status );
      ("DeviceKey", Some (device_key_type_to_yojson x.device_key));
      ("Username", Some (username_type_to_yojson x.username));
      ("UserPoolId", Some (user_pool_id_type_to_yojson x.user_pool_id));
    ]

let admin_update_auth_event_feedback_response_to_yojson = unit_to_yojson

let admin_update_auth_event_feedback_request_to_yojson
    (x : admin_update_auth_event_feedback_request) =
  assoc_to_yojson
    [
      ("FeedbackValue", Some (feedback_value_type_to_yojson x.feedback_value));
      ("EventId", Some (event_id_type_to_yojson x.event_id));
      ("Username", Some (username_type_to_yojson x.username));
      ("UserPoolId", Some (user_pool_id_type_to_yojson x.user_pool_id));
    ]

let admin_set_user_settings_response_to_yojson = unit_to_yojson

let admin_set_user_settings_request_to_yojson (x : admin_set_user_settings_request) =
  assoc_to_yojson
    [
      ("MFAOptions", Some (mfa_option_list_type_to_yojson x.mfa_options));
      ("Username", Some (username_type_to_yojson x.username));
      ("UserPoolId", Some (user_pool_id_type_to_yojson x.user_pool_id));
    ]

let admin_set_user_password_response_to_yojson = unit_to_yojson

let admin_set_user_password_request_to_yojson (x : admin_set_user_password_request) =
  assoc_to_yojson
    [
      ("Permanent", option_to_yojson boolean_type_to_yojson x.permanent);
      ("Password", Some (password_type_to_yojson x.password));
      ("Username", Some (username_type_to_yojson x.username));
      ("UserPoolId", Some (user_pool_id_type_to_yojson x.user_pool_id));
    ]

let admin_set_user_mfa_preference_response_to_yojson = unit_to_yojson

let admin_set_user_mfa_preference_request_to_yojson (x : admin_set_user_mfa_preference_request) =
  assoc_to_yojson
    [
      ("UserPoolId", Some (user_pool_id_type_to_yojson x.user_pool_id));
      ("Username", Some (username_type_to_yojson x.username));
      ( "WebAuthnMfaSettings",
        option_to_yojson web_authn_mfa_settings_type_to_yojson x.web_authn_mfa_settings );
      ("EmailMfaSettings", option_to_yojson email_mfa_settings_type_to_yojson x.email_mfa_settings);
      ( "SoftwareTokenMfaSettings",
        option_to_yojson software_token_mfa_settings_type_to_yojson x.software_token_mfa_settings );
      ("SMSMfaSettings", option_to_yojson sms_mfa_settings_type_to_yojson x.sms_mfa_settings);
    ]

let admin_respond_to_auth_challenge_response_to_yojson
    (x : admin_respond_to_auth_challenge_response) =
  assoc_to_yojson
    [
      ( "AuthenticationResult",
        option_to_yojson authentication_result_type_to_yojson x.authentication_result );
      ( "ChallengeParameters",
        option_to_yojson challenge_parameters_type_to_yojson x.challenge_parameters );
      ("Session", option_to_yojson session_type_to_yojson x.session);
      ("ChallengeName", option_to_yojson challenge_name_type_to_yojson x.challenge_name);
    ]

let admin_respond_to_auth_challenge_request_to_yojson (x : admin_respond_to_auth_challenge_request)
    =
  assoc_to_yojson
    [
      ("ClientMetadata", option_to_yojson client_metadata_type_to_yojson x.client_metadata);
      ("ContextData", option_to_yojson context_data_type_to_yojson x.context_data);
      ("AnalyticsMetadata", option_to_yojson analytics_metadata_type_to_yojson x.analytics_metadata);
      ("Session", option_to_yojson session_type_to_yojson x.session);
      ( "ChallengeResponses",
        option_to_yojson challenge_responses_type_to_yojson x.challenge_responses );
      ("ChallengeName", Some (challenge_name_type_to_yojson x.challenge_name));
      ("ClientId", Some (client_id_type_to_yojson x.client_id));
      ("UserPoolId", Some (user_pool_id_type_to_yojson x.user_pool_id));
    ]

let admin_reset_user_password_response_to_yojson = unit_to_yojson

let admin_reset_user_password_request_to_yojson (x : admin_reset_user_password_request) =
  assoc_to_yojson
    [
      ("ClientMetadata", option_to_yojson client_metadata_type_to_yojson x.client_metadata);
      ("Username", Some (username_type_to_yojson x.username));
      ("UserPoolId", Some (user_pool_id_type_to_yojson x.user_pool_id));
    ]

let admin_remove_user_from_group_request_to_yojson (x : admin_remove_user_from_group_request) =
  assoc_to_yojson
    [
      ("GroupName", Some (group_name_type_to_yojson x.group_name));
      ("Username", Some (username_type_to_yojson x.username));
      ("UserPoolId", Some (user_pool_id_type_to_yojson x.user_pool_id));
    ]

let admin_list_user_auth_events_response_to_yojson (x : admin_list_user_auth_events_response) =
  assoc_to_yojson
    [
      ("NextToken", option_to_yojson pagination_key_to_yojson x.next_token);
      ("AuthEvents", option_to_yojson auth_events_type_to_yojson x.auth_events);
    ]

let admin_list_user_auth_events_request_to_yojson (x : admin_list_user_auth_events_request) =
  assoc_to_yojson
    [
      ("NextToken", option_to_yojson pagination_key_to_yojson x.next_token);
      ("MaxResults", option_to_yojson query_limit_type_to_yojson x.max_results);
      ("Username", Some (username_type_to_yojson x.username));
      ("UserPoolId", Some (user_pool_id_type_to_yojson x.user_pool_id));
    ]

let admin_list_groups_for_user_response_to_yojson (x : admin_list_groups_for_user_response) =
  assoc_to_yojson
    [
      ("NextToken", option_to_yojson pagination_key_to_yojson x.next_token);
      ("Groups", option_to_yojson group_list_type_to_yojson x.groups);
    ]

let admin_list_groups_for_user_request_to_yojson (x : admin_list_groups_for_user_request) =
  assoc_to_yojson
    [
      ("NextToken", option_to_yojson pagination_key_to_yojson x.next_token);
      ("Limit", option_to_yojson query_limit_type_to_yojson x.limit);
      ("UserPoolId", Some (user_pool_id_type_to_yojson x.user_pool_id));
      ("Username", Some (username_type_to_yojson x.username));
    ]

let admin_list_devices_response_to_yojson (x : admin_list_devices_response) =
  assoc_to_yojson
    [
      ("PaginationToken", option_to_yojson search_pagination_token_type_to_yojson x.pagination_token);
      ("Devices", option_to_yojson device_list_type_to_yojson x.devices);
    ]

let admin_list_devices_request_to_yojson (x : admin_list_devices_request) =
  assoc_to_yojson
    [
      ("PaginationToken", option_to_yojson search_pagination_token_type_to_yojson x.pagination_token);
      ("Limit", option_to_yojson query_limit_type_to_yojson x.limit);
      ("Username", Some (username_type_to_yojson x.username));
      ("UserPoolId", Some (user_pool_id_type_to_yojson x.user_pool_id));
    ]

let admin_link_provider_for_user_response_to_yojson = unit_to_yojson

let admin_link_provider_for_user_request_to_yojson (x : admin_link_provider_for_user_request) =
  assoc_to_yojson
    [
      ("SourceUser", Some (provider_user_identifier_type_to_yojson x.source_user));
      ("DestinationUser", Some (provider_user_identifier_type_to_yojson x.destination_user));
      ("UserPoolId", Some (string_type_to_yojson x.user_pool_id));
    ]

let admin_initiate_auth_response_to_yojson (x : admin_initiate_auth_response) =
  assoc_to_yojson
    [
      ( "AvailableChallenges",
        option_to_yojson available_challenge_list_type_to_yojson x.available_challenges );
      ( "AuthenticationResult",
        option_to_yojson authentication_result_type_to_yojson x.authentication_result );
      ( "ChallengeParameters",
        option_to_yojson challenge_parameters_type_to_yojson x.challenge_parameters );
      ("Session", option_to_yojson session_type_to_yojson x.session);
      ("ChallengeName", option_to_yojson challenge_name_type_to_yojson x.challenge_name);
    ]

let admin_initiate_auth_request_to_yojson (x : admin_initiate_auth_request) =
  assoc_to_yojson
    [
      ("Session", option_to_yojson session_type_to_yojson x.session);
      ("ContextData", option_to_yojson context_data_type_to_yojson x.context_data);
      ("AnalyticsMetadata", option_to_yojson analytics_metadata_type_to_yojson x.analytics_metadata);
      ("ClientMetadata", option_to_yojson client_metadata_type_to_yojson x.client_metadata);
      ("AuthParameters", option_to_yojson auth_parameters_type_to_yojson x.auth_parameters);
      ("AuthFlow", Some (auth_flow_type_to_yojson x.auth_flow));
      ("ClientId", Some (client_id_type_to_yojson x.client_id));
      ("UserPoolId", Some (user_pool_id_type_to_yojson x.user_pool_id));
    ]

let admin_get_user_response_to_yojson (x : admin_get_user_response) =
  assoc_to_yojson
    [
      ( "UserMFASettingList",
        option_to_yojson user_mfa_setting_list_type_to_yojson x.user_mfa_setting_list );
      ("PreferredMfaSetting", option_to_yojson string_type_to_yojson x.preferred_mfa_setting);
      ("MFAOptions", option_to_yojson mfa_option_list_type_to_yojson x.mfa_options);
      ("UserStatus", option_to_yojson user_status_type_to_yojson x.user_status);
      ("Enabled", option_to_yojson boolean_type_to_yojson x.enabled);
      ("UserLastModifiedDate", option_to_yojson date_type_to_yojson x.user_last_modified_date);
      ("UserCreateDate", option_to_yojson date_type_to_yojson x.user_create_date);
      ("UserAttributes", option_to_yojson attribute_list_type_to_yojson x.user_attributes);
      ("Username", Some (username_type_to_yojson x.username));
    ]

let admin_get_user_request_to_yojson (x : admin_get_user_request) =
  assoc_to_yojson
    [
      ("Username", Some (username_type_to_yojson x.username));
      ("UserPoolId", Some (user_pool_id_type_to_yojson x.user_pool_id));
    ]

let admin_get_device_response_to_yojson (x : admin_get_device_response) =
  assoc_to_yojson [ ("Device", Some (device_type_to_yojson x.device)) ]

let admin_get_device_request_to_yojson (x : admin_get_device_request) =
  assoc_to_yojson
    [
      ("Username", Some (username_type_to_yojson x.username));
      ("UserPoolId", Some (user_pool_id_type_to_yojson x.user_pool_id));
      ("DeviceKey", Some (device_key_type_to_yojson x.device_key));
    ]

let admin_forget_device_request_to_yojson (x : admin_forget_device_request) =
  assoc_to_yojson
    [
      ("DeviceKey", Some (device_key_type_to_yojson x.device_key));
      ("Username", Some (username_type_to_yojson x.username));
      ("UserPoolId", Some (user_pool_id_type_to_yojson x.user_pool_id));
    ]

let admin_enable_user_response_to_yojson = unit_to_yojson

let admin_enable_user_request_to_yojson (x : admin_enable_user_request) =
  assoc_to_yojson
    [
      ("Username", Some (username_type_to_yojson x.username));
      ("UserPoolId", Some (user_pool_id_type_to_yojson x.user_pool_id));
    ]

let admin_disable_user_response_to_yojson = unit_to_yojson

let admin_disable_user_request_to_yojson (x : admin_disable_user_request) =
  assoc_to_yojson
    [
      ("Username", Some (username_type_to_yojson x.username));
      ("UserPoolId", Some (user_pool_id_type_to_yojson x.user_pool_id));
    ]

let admin_disable_provider_for_user_response_to_yojson = unit_to_yojson

let admin_disable_provider_for_user_request_to_yojson (x : admin_disable_provider_for_user_request)
    =
  assoc_to_yojson
    [
      ("User", Some (provider_user_identifier_type_to_yojson x.user));
      ("UserPoolId", Some (string_type_to_yojson x.user_pool_id));
    ]

let admin_delete_user_request_to_yojson (x : admin_delete_user_request) =
  assoc_to_yojson
    [
      ("Username", Some (username_type_to_yojson x.username));
      ("UserPoolId", Some (user_pool_id_type_to_yojson x.user_pool_id));
    ]

let admin_delete_user_attributes_response_to_yojson = unit_to_yojson

let admin_delete_user_attributes_request_to_yojson (x : admin_delete_user_attributes_request) =
  assoc_to_yojson
    [
      ("UserAttributeNames", Some (attribute_name_list_type_to_yojson x.user_attribute_names));
      ("Username", Some (username_type_to_yojson x.username));
      ("UserPoolId", Some (user_pool_id_type_to_yojson x.user_pool_id));
    ]

let admin_create_user_response_to_yojson (x : admin_create_user_response) =
  assoc_to_yojson [ ("User", option_to_yojson user_type_to_yojson x.user) ]

let admin_create_user_request_to_yojson (x : admin_create_user_request) =
  assoc_to_yojson
    [
      ("ClientMetadata", option_to_yojson client_metadata_type_to_yojson x.client_metadata);
      ( "DesiredDeliveryMediums",
        option_to_yojson delivery_medium_list_type_to_yojson x.desired_delivery_mediums );
      ("MessageAction", option_to_yojson message_action_type_to_yojson x.message_action);
      ("ForceAliasCreation", option_to_yojson force_alias_creation_to_yojson x.force_alias_creation);
      ("TemporaryPassword", option_to_yojson password_type_to_yojson x.temporary_password);
      ("ValidationData", option_to_yojson attribute_list_type_to_yojson x.validation_data);
      ("UserAttributes", option_to_yojson attribute_list_type_to_yojson x.user_attributes);
      ("Username", Some (username_type_to_yojson x.username));
      ("UserPoolId", Some (user_pool_id_type_to_yojson x.user_pool_id));
    ]

let admin_confirm_sign_up_response_to_yojson = unit_to_yojson

let admin_confirm_sign_up_request_to_yojson (x : admin_confirm_sign_up_request) =
  assoc_to_yojson
    [
      ("ClientMetadata", option_to_yojson client_metadata_type_to_yojson x.client_metadata);
      ("Username", Some (username_type_to_yojson x.username));
      ("UserPoolId", Some (user_pool_id_type_to_yojson x.user_pool_id));
    ]

let admin_add_user_to_group_request_to_yojson (x : admin_add_user_to_group_request) =
  assoc_to_yojson
    [
      ("GroupName", Some (group_name_type_to_yojson x.group_name));
      ("Username", Some (username_type_to_yojson x.username));
      ("UserPoolId", Some (user_pool_id_type_to_yojson x.user_pool_id));
    ]

let add_user_pool_client_secret_response_to_yojson (x : add_user_pool_client_secret_response) =
  assoc_to_yojson
    [
      ( "ClientSecretDescriptor",
        option_to_yojson client_secret_descriptor_type_to_yojson x.client_secret_descriptor );
    ]

let add_user_pool_client_secret_request_to_yojson (x : add_user_pool_client_secret_request) =
  assoc_to_yojson
    [
      ("ClientSecret", option_to_yojson client_secret_type_to_yojson x.client_secret);
      ("ClientId", Some (client_id_type_to_yojson x.client_id));
      ("UserPoolId", Some (user_pool_id_type_to_yojson x.user_pool_id));
    ]

let access_denied_exception_to_yojson (x : access_denied_exception) =
  assoc_to_yojson [ ("message", option_to_yojson message_type_to_yojson x.message) ]

let add_custom_attributes_response_to_yojson = unit_to_yojson

let add_custom_attributes_request_to_yojson (x : add_custom_attributes_request) =
  assoc_to_yojson
    [
      ("CustomAttributes", Some (custom_attributes_list_type_to_yojson x.custom_attributes));
      ("UserPoolId", Some (user_pool_id_type_to_yojson x.user_pool_id));
    ]
