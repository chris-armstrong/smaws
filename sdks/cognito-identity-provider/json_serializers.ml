open Smaws_Lib.Json.SerializeHelpers
open Types

let aws_account_id_type_to_yojson = string_to_yojson
let message_type_to_yojson = string_to_yojson

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
      ("message", option_to_yojson message_type_to_yojson x.message);
      ( "reasonCode",
        option_to_yojson invalid_parameter_exception_reason_code_type_to_yojson x.reason_code );
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

let verify_user_attribute_response_to_yojson = unit_to_yojson
let confirmation_code_type_to_yojson = string_to_yojson
let attribute_name_type_to_yojson = string_to_yojson
let token_model_type_to_yojson = string_to_yojson

let verify_user_attribute_request_to_yojson (x : verify_user_attribute_request) =
  assoc_to_yojson
    [
      ("AccessToken", Some (token_model_type_to_yojson x.access_token));
      ("AttributeName", Some (attribute_name_type_to_yojson x.attribute_name));
      ("Code", Some (confirmation_code_type_to_yojson x.code));
    ]

let software_token_mfa_not_found_exception_to_yojson (x : software_token_mfa_not_found_exception) =
  assoc_to_yojson [ ("message", option_to_yojson message_type_to_yojson x.message) ]

let invalid_user_pool_configuration_exception_to_yojson
    (x : invalid_user_pool_configuration_exception) =
  assoc_to_yojson [ ("message", option_to_yojson message_type_to_yojson x.message) ]

let enable_software_token_mfa_exception_to_yojson (x : enable_software_token_mfa_exception) =
  assoc_to_yojson [ ("message", option_to_yojson message_type_to_yojson x.message) ]

let session_type_to_yojson = string_to_yojson

let verify_software_token_response_type_to_yojson (x : verify_software_token_response_type) =
  match x with SUCCESS -> `String "SUCCESS" | ERROR -> `String "ERROR"

let verify_software_token_response_to_yojson (x : verify_software_token_response) =
  assoc_to_yojson
    [
      ("Status", option_to_yojson verify_software_token_response_type_to_yojson x.status);
      ("Session", option_to_yojson session_type_to_yojson x.session);
    ]

let string_type_to_yojson = string_to_yojson
let software_token_mfa_user_code_type_to_yojson = string_to_yojson

let verify_software_token_request_to_yojson (x : verify_software_token_request) =
  assoc_to_yojson
    [
      ("AccessToken", option_to_yojson token_model_type_to_yojson x.access_token);
      ("Session", option_to_yojson session_type_to_yojson x.session);
      ("UserCode", Some (software_token_mfa_user_code_type_to_yojson x.user_code));
      ("FriendlyDeviceName", option_to_yojson string_type_to_yojson x.friendly_device_name);
    ]

let arn_type_to_yojson = string_to_yojson

let replica_role_type_to_yojson (x : replica_role_type) =
  match x with PRIMARY -> `String "PRIMARY" | SECONDARY -> `String "SECONDARY"

let replica_status_type_to_yojson (x : replica_status_type) =
  match x with
  | CREATING -> `String "CREATING"
  | ACTIVE -> `String "ACTIVE"
  | INACTIVE -> `String "INACTIVE"
  | DELETING -> `String "DELETING"

let region_name_type_to_yojson = string_to_yojson

let user_pool_replica_type_to_yojson (x : user_pool_replica_type) =
  assoc_to_yojson
    [
      ("RegionName", option_to_yojson region_name_type_to_yojson x.region_name);
      ("Status", option_to_yojson replica_status_type_to_yojson x.status);
      ("Role", option_to_yojson replica_role_type_to_yojson x.role);
      ("UserPoolArn", option_to_yojson arn_type_to_yojson x.user_pool_arn);
    ]

let update_user_pool_replica_response_to_yojson (x : update_user_pool_replica_response) =
  assoc_to_yojson
    [ ("UserPoolReplica", option_to_yojson user_pool_replica_type_to_yojson x.user_pool_replica) ]

let update_replica_status_type_to_yojson (x : update_replica_status_type) =
  match x with ACTIVE -> `String "ACTIVE" | INACTIVE -> `String "INACTIVE"

let user_pool_id_type_to_yojson = string_to_yojson

let update_user_pool_replica_request_to_yojson (x : update_user_pool_replica_request) =
  assoc_to_yojson
    [
      ("UserPoolId", Some (user_pool_id_type_to_yojson x.user_pool_id));
      ("RegionName", Some (region_name_type_to_yojson x.region_name));
      ("Status", Some (update_replica_status_type_to_yojson x.status));
    ]

let feature_unavailable_in_tier_exception_to_yojson (x : feature_unavailable_in_tier_exception) =
  assoc_to_yojson [ ("message", option_to_yojson message_type_to_yojson x.message) ]

let concurrent_modification_exception_to_yojson (x : concurrent_modification_exception) =
  assoc_to_yojson [ ("message", option_to_yojson message_type_to_yojson x.message) ]

let health_check_id_type_to_yojson = string_to_yojson

let failover_type_to_yojson (x : failover_type) =
  assoc_to_yojson
    [
      ("SecondaryRegion", Some (region_name_type_to_yojson x.secondary_region));
      ( "PrimaryRoute53HealthCheckId",
        Some (health_check_id_type_to_yojson x.primary_route53_health_check_id) );
    ]

let routing_type_to_yojson (x : routing_type) =
  assoc_to_yojson [ ("Failover", option_to_yojson failover_type_to_yojson x.failover) ]

let domain_type_to_yojson = string_to_yojson
let wrapped_integer_type_to_yojson = int_to_yojson

let update_user_pool_domain_response_to_yojson (x : update_user_pool_domain_response) =
  assoc_to_yojson
    [
      ( "ManagedLoginVersion",
        option_to_yojson wrapped_integer_type_to_yojson x.managed_login_version );
      ("CloudFrontDomain", option_to_yojson domain_type_to_yojson x.cloud_front_domain);
      ("Routing", option_to_yojson routing_type_to_yojson x.routing);
    ]

let security_policy_type_to_yojson (x : security_policy_type) =
  match x with
  | TLS_V1 -> `String "TLS_V1"
  | TLS_V1_2_2021 -> `String "TLS_V1_2_2021"
  | TLS_V1_3_2025 -> `String "TLS_V1_3_2025"

let custom_domain_config_type_to_yojson (x : custom_domain_config_type) =
  assoc_to_yojson
    [
      ("CertificateArn", Some (arn_type_to_yojson x.certificate_arn));
      ("SecurityPolicy", option_to_yojson security_policy_type_to_yojson x.security_policy);
    ]

let update_user_pool_domain_request_to_yojson (x : update_user_pool_domain_request) =
  assoc_to_yojson
    [
      ("Domain", Some (domain_type_to_yojson x.domain));
      ("UserPoolId", Some (user_pool_id_type_to_yojson x.user_pool_id));
      ( "ManagedLoginVersion",
        option_to_yojson wrapped_integer_type_to_yojson x.managed_login_version );
      ( "CustomDomainConfig",
        option_to_yojson custom_domain_config_type_to_yojson x.custom_domain_config );
      ("Routing", option_to_yojson routing_type_to_yojson x.routing);
    ]

let scope_does_not_exist_exception_to_yojson (x : scope_does_not_exist_exception) =
  assoc_to_yojson [ ("message", option_to_yojson message_type_to_yojson x.message) ]

let invalid_o_auth_flow_exception_to_yojson (x : invalid_o_auth_flow_exception) =
  assoc_to_yojson [ ("message", option_to_yojson message_type_to_yojson x.message) ]

let retry_grace_period_seconds_type_to_yojson = int_to_yojson

let feature_type_to_yojson (x : feature_type) =
  match x with ENABLED -> `String "ENABLED" | DISABLED -> `String "DISABLED"

let refresh_token_rotation_type_to_yojson (x : refresh_token_rotation_type) =
  assoc_to_yojson
    [
      ("Feature", Some (feature_type_to_yojson x.feature));
      ( "RetryGracePeriodSeconds",
        option_to_yojson retry_grace_period_seconds_type_to_yojson x.retry_grace_period_seconds );
    ]

let auth_session_validity_type_to_yojson = int_to_yojson
let wrapped_boolean_type_to_yojson = bool_to_yojson

let prevent_user_existence_error_types_to_yojson (x : prevent_user_existence_error_types) =
  match x with LEGACY -> `String "LEGACY" | ENABLED -> `String "ENABLED"

let boolean_type_to_yojson = bool_to_yojson
let hex_string_type_to_yojson = string_to_yojson

let analytics_configuration_type_to_yojson (x : analytics_configuration_type) =
  assoc_to_yojson
    [
      ("ApplicationId", option_to_yojson hex_string_type_to_yojson x.application_id);
      ("ApplicationArn", option_to_yojson arn_type_to_yojson x.application_arn);
      ("RoleArn", option_to_yojson arn_type_to_yojson x.role_arn);
      ("ExternalId", option_to_yojson string_type_to_yojson x.external_id);
      ("UserDataShared", option_to_yojson boolean_type_to_yojson x.user_data_shared);
    ]

let scope_type_to_yojson = string_to_yojson
let scope_list_type_to_yojson tree = list_to_yojson scope_type_to_yojson tree

let o_auth_flow_type_to_yojson (x : o_auth_flow_type) =
  match x with
  | Code -> `String "code"
  | Implicit -> `String "implicit"
  | Client_credentials -> `String "client_credentials"

let o_auth_flows_type_to_yojson tree = list_to_yojson o_auth_flow_type_to_yojson tree
let redirect_url_type_to_yojson = string_to_yojson
let logout_ur_ls_list_type_to_yojson tree = list_to_yojson redirect_url_type_to_yojson tree
let callback_ur_ls_list_type_to_yojson tree = list_to_yojson redirect_url_type_to_yojson tree
let provider_name_type_to_yojson = string_to_yojson

let supported_identity_providers_list_type_to_yojson tree =
  list_to_yojson provider_name_type_to_yojson tree

let explicit_auth_flows_type_to_yojson (x : explicit_auth_flows_type) =
  match x with
  | ADMIN_NO_SRP_AUTH -> `String "ADMIN_NO_SRP_AUTH"
  | CUSTOM_AUTH_FLOW_ONLY -> `String "CUSTOM_AUTH_FLOW_ONLY"
  | USER_PASSWORD_AUTH -> `String "USER_PASSWORD_AUTH"
  | ALLOW_ADMIN_USER_PASSWORD_AUTH -> `String "ALLOW_ADMIN_USER_PASSWORD_AUTH"
  | ALLOW_CUSTOM_AUTH -> `String "ALLOW_CUSTOM_AUTH"
  | ALLOW_USER_PASSWORD_AUTH -> `String "ALLOW_USER_PASSWORD_AUTH"
  | ALLOW_USER_SRP_AUTH -> `String "ALLOW_USER_SRP_AUTH"
  | ALLOW_REFRESH_TOKEN_AUTH -> `String "ALLOW_REFRESH_TOKEN_AUTH"
  | ALLOW_USER_AUTH -> `String "ALLOW_USER_AUTH"

let explicit_auth_flows_list_type_to_yojson tree =
  list_to_yojson explicit_auth_flows_type_to_yojson tree

let client_permission_type_to_yojson = string_to_yojson

let client_permission_list_type_to_yojson tree =
  list_to_yojson client_permission_type_to_yojson tree

let time_units_type_to_yojson (x : time_units_type) =
  match x with
  | SECONDS -> `String "seconds"
  | MINUTES -> `String "minutes"
  | HOURS -> `String "hours"
  | DAYS -> `String "days"

let token_validity_units_type_to_yojson (x : token_validity_units_type) =
  assoc_to_yojson
    [
      ("AccessToken", option_to_yojson time_units_type_to_yojson x.access_token);
      ("IdToken", option_to_yojson time_units_type_to_yojson x.id_token);
      ("RefreshToken", option_to_yojson time_units_type_to_yojson x.refresh_token);
    ]

let id_token_validity_type_to_yojson = int_to_yojson
let access_token_validity_type_to_yojson = int_to_yojson
let refresh_token_validity_type_to_yojson = int_to_yojson
let date_type_to_yojson = timestamp_epoch_seconds_to_yojson
let client_secret_type_to_yojson = string_to_yojson
let client_id_type_to_yojson = string_to_yojson
let client_name_type_to_yojson = string_to_yojson

let user_pool_client_type_to_yojson (x : user_pool_client_type) =
  assoc_to_yojson
    [
      ("UserPoolId", option_to_yojson user_pool_id_type_to_yojson x.user_pool_id);
      ("ClientName", option_to_yojson client_name_type_to_yojson x.client_name);
      ("ClientId", option_to_yojson client_id_type_to_yojson x.client_id);
      ("ClientSecret", option_to_yojson client_secret_type_to_yojson x.client_secret);
      ("LastModifiedDate", option_to_yojson date_type_to_yojson x.last_modified_date);
      ("CreationDate", option_to_yojson date_type_to_yojson x.creation_date);
      ( "RefreshTokenValidity",
        option_to_yojson refresh_token_validity_type_to_yojson x.refresh_token_validity );
      ( "AccessTokenValidity",
        option_to_yojson access_token_validity_type_to_yojson x.access_token_validity );
      ("IdTokenValidity", option_to_yojson id_token_validity_type_to_yojson x.id_token_validity);
      ( "TokenValidityUnits",
        option_to_yojson token_validity_units_type_to_yojson x.token_validity_units );
      ("ReadAttributes", option_to_yojson client_permission_list_type_to_yojson x.read_attributes);
      ("WriteAttributes", option_to_yojson client_permission_list_type_to_yojson x.write_attributes);
      ( "ExplicitAuthFlows",
        option_to_yojson explicit_auth_flows_list_type_to_yojson x.explicit_auth_flows );
      ( "SupportedIdentityProviders",
        option_to_yojson supported_identity_providers_list_type_to_yojson
          x.supported_identity_providers );
      ("CallbackURLs", option_to_yojson callback_ur_ls_list_type_to_yojson x.callback_ur_ls);
      ("LogoutURLs", option_to_yojson logout_ur_ls_list_type_to_yojson x.logout_ur_ls);
      ("DefaultRedirectURI", option_to_yojson redirect_url_type_to_yojson x.default_redirect_ur_i);
      ("AllowedOAuthFlows", option_to_yojson o_auth_flows_type_to_yojson x.allowed_o_auth_flows);
      ("AllowedOAuthScopes", option_to_yojson scope_list_type_to_yojson x.allowed_o_auth_scopes);
      ( "AllowedOAuthFlowsUserPoolClient",
        option_to_yojson boolean_type_to_yojson x.allowed_o_auth_flows_user_pool_client );
      ( "AnalyticsConfiguration",
        option_to_yojson analytics_configuration_type_to_yojson x.analytics_configuration );
      ( "PreventUserExistenceErrors",
        option_to_yojson prevent_user_existence_error_types_to_yojson
          x.prevent_user_existence_errors );
      ( "EnableTokenRevocation",
        option_to_yojson wrapped_boolean_type_to_yojson x.enable_token_revocation );
      ( "EnablePropagateAdditionalUserContextData",
        option_to_yojson wrapped_boolean_type_to_yojson
          x.enable_propagate_additional_user_context_data );
      ( "AuthSessionValidity",
        option_to_yojson auth_session_validity_type_to_yojson x.auth_session_validity );
      ( "RefreshTokenRotation",
        option_to_yojson refresh_token_rotation_type_to_yojson x.refresh_token_rotation );
    ]

let update_user_pool_client_response_to_yojson (x : update_user_pool_client_response) =
  assoc_to_yojson
    [ ("UserPoolClient", option_to_yojson user_pool_client_type_to_yojson x.user_pool_client) ]

let update_user_pool_client_request_to_yojson (x : update_user_pool_client_request) =
  assoc_to_yojson
    [
      ("UserPoolId", Some (user_pool_id_type_to_yojson x.user_pool_id));
      ("ClientId", Some (client_id_type_to_yojson x.client_id));
      ("ClientName", option_to_yojson client_name_type_to_yojson x.client_name);
      ( "RefreshTokenValidity",
        option_to_yojson refresh_token_validity_type_to_yojson x.refresh_token_validity );
      ( "AccessTokenValidity",
        option_to_yojson access_token_validity_type_to_yojson x.access_token_validity );
      ("IdTokenValidity", option_to_yojson id_token_validity_type_to_yojson x.id_token_validity);
      ( "TokenValidityUnits",
        option_to_yojson token_validity_units_type_to_yojson x.token_validity_units );
      ("ReadAttributes", option_to_yojson client_permission_list_type_to_yojson x.read_attributes);
      ("WriteAttributes", option_to_yojson client_permission_list_type_to_yojson x.write_attributes);
      ( "ExplicitAuthFlows",
        option_to_yojson explicit_auth_flows_list_type_to_yojson x.explicit_auth_flows );
      ( "SupportedIdentityProviders",
        option_to_yojson supported_identity_providers_list_type_to_yojson
          x.supported_identity_providers );
      ("CallbackURLs", option_to_yojson callback_ur_ls_list_type_to_yojson x.callback_ur_ls);
      ("LogoutURLs", option_to_yojson logout_ur_ls_list_type_to_yojson x.logout_ur_ls);
      ("DefaultRedirectURI", option_to_yojson redirect_url_type_to_yojson x.default_redirect_ur_i);
      ("AllowedOAuthFlows", option_to_yojson o_auth_flows_type_to_yojson x.allowed_o_auth_flows);
      ("AllowedOAuthScopes", option_to_yojson scope_list_type_to_yojson x.allowed_o_auth_scopes);
      ( "AllowedOAuthFlowsUserPoolClient",
        option_to_yojson boolean_type_to_yojson x.allowed_o_auth_flows_user_pool_client );
      ( "AnalyticsConfiguration",
        option_to_yojson analytics_configuration_type_to_yojson x.analytics_configuration );
      ( "PreventUserExistenceErrors",
        option_to_yojson prevent_user_existence_error_types_to_yojson
          x.prevent_user_existence_errors );
      ( "EnableTokenRevocation",
        option_to_yojson wrapped_boolean_type_to_yojson x.enable_token_revocation );
      ( "EnablePropagateAdditionalUserContextData",
        option_to_yojson wrapped_boolean_type_to_yojson
          x.enable_propagate_additional_user_context_data );
      ( "AuthSessionValidity",
        option_to_yojson auth_session_validity_type_to_yojson x.auth_session_validity );
      ( "RefreshTokenRotation",
        option_to_yojson refresh_token_rotation_type_to_yojson x.refresh_token_rotation );
    ]

let user_pool_tagging_exception_to_yojson (x : user_pool_tagging_exception) =
  assoc_to_yojson [ ("message", option_to_yojson message_type_to_yojson x.message) ]

let user_import_in_progress_exception_to_yojson (x : user_import_in_progress_exception) =
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

let update_user_pool_response_to_yojson = unit_to_yojson

let issuer_type_to_yojson (x : issuer_type) =
  match x with ORIGINAL -> `String "ORIGINAL" | UPDATED -> `String "UPDATED"

let issuer_configuration_type_to_yojson (x : issuer_configuration_type) =
  assoc_to_yojson [ ("Type", option_to_yojson issuer_type_to_yojson x.type_) ]

let encryption_key_arn_type_to_yojson = string_to_yojson

let encryption_key_type_to_yojson (x : encryption_key_type) =
  match x with
  | AWS_OWNED_KEY -> `String "AWS_OWNED_KEY"
  | CUSTOMER_MANAGED_KEY -> `String "CUSTOMER_MANAGED_KEY"

let key_configuration_type_to_yojson (x : key_configuration_type) =
  assoc_to_yojson
    [
      ("KeyType", option_to_yojson encryption_key_type_to_yojson x.key_type);
      ("KmsKeyArn", option_to_yojson encryption_key_arn_type_to_yojson x.kms_key_arn);
    ]

let user_pool_tier_type_to_yojson (x : user_pool_tier_type) =
  match x with
  | LITE -> `String "LITE"
  | ESSENTIALS -> `String "ESSENTIALS"
  | PLUS -> `String "PLUS"

let user_pool_name_type_to_yojson = string_to_yojson

let recovery_option_name_type_to_yojson (x : recovery_option_name_type) =
  match x with
  | VERIFIED_EMAIL -> `String "verified_email"
  | VERIFIED_PHONE_NUMBER -> `String "verified_phone_number"
  | ADMIN_ONLY -> `String "admin_only"

let priority_type_to_yojson = int_to_yojson

let recovery_option_type_to_yojson (x : recovery_option_type) =
  assoc_to_yojson
    [
      ("Priority", Some (priority_type_to_yojson x.priority));
      ("Name", Some (recovery_option_name_type_to_yojson x.name));
    ]

let recovery_mechanisms_type_to_yojson tree = list_to_yojson recovery_option_type_to_yojson tree

let account_recovery_setting_type_to_yojson (x : account_recovery_setting_type) =
  assoc_to_yojson
    [
      ( "RecoveryMechanisms",
        option_to_yojson recovery_mechanisms_type_to_yojson x.recovery_mechanisms );
    ]

let advanced_security_enabled_mode_type_to_yojson (x : advanced_security_enabled_mode_type) =
  match x with AUDIT -> `String "AUDIT" | ENFORCED -> `String "ENFORCED"

let advanced_security_additional_flows_type_to_yojson (x : advanced_security_additional_flows_type)
    =
  assoc_to_yojson
    [
      ( "CustomAuthMode",
        option_to_yojson advanced_security_enabled_mode_type_to_yojson x.custom_auth_mode );
    ]

let advanced_security_mode_type_to_yojson (x : advanced_security_mode_type) =
  match x with OFF -> `String "OFF" | AUDIT -> `String "AUDIT" | ENFORCED -> `String "ENFORCED"

let user_pool_add_ons_type_to_yojson (x : user_pool_add_ons_type) =
  assoc_to_yojson
    [
      ("AdvancedSecurityMode", Some (advanced_security_mode_type_to_yojson x.advanced_security_mode));
      ( "AdvancedSecurityAdditionalFlows",
        option_to_yojson advanced_security_additional_flows_type_to_yojson
          x.advanced_security_additional_flows );
    ]

let email_verification_subject_type_to_yojson = string_to_yojson
let email_invite_message_type_to_yojson = string_to_yojson
let sms_invite_message_type_to_yojson = string_to_yojson

let message_template_type_to_yojson (x : message_template_type) =
  assoc_to_yojson
    [
      ("SMSMessage", option_to_yojson sms_invite_message_type_to_yojson x.sms_message);
      ("EmailMessage", option_to_yojson email_invite_message_type_to_yojson x.email_message);
      ("EmailSubject", option_to_yojson email_verification_subject_type_to_yojson x.email_subject);
    ]

let admin_create_user_unused_account_validity_days_type_to_yojson = int_to_yojson

let admin_create_user_config_type_to_yojson (x : admin_create_user_config_type) =
  assoc_to_yojson
    [
      ( "AllowAdminCreateUserOnly",
        option_to_yojson boolean_type_to_yojson x.allow_admin_create_user_only );
      ( "UnusedAccountValidityDays",
        option_to_yojson admin_create_user_unused_account_validity_days_type_to_yojson
          x.unused_account_validity_days );
      ( "InviteMessageTemplate",
        option_to_yojson message_template_type_to_yojson x.invite_message_template );
    ]

let tag_value_type_to_yojson = string_to_yojson
let tag_keys_type_to_yojson = string_to_yojson

let user_pool_tags_type_to_yojson tree =
  map_to_yojson tag_keys_type_to_yojson tag_value_type_to_yojson tree

let region_code_type_to_yojson = string_to_yojson

let sms_configuration_type_to_yojson (x : sms_configuration_type) =
  assoc_to_yojson
    [
      ("SnsCallerArn", Some (arn_type_to_yojson x.sns_caller_arn));
      ("ExternalId", option_to_yojson string_type_to_yojson x.external_id);
      ("SnsRegion", option_to_yojson region_code_type_to_yojson x.sns_region);
    ]

let ses_configuration_set_to_yojson = string_to_yojson

let email_sending_account_type_to_yojson (x : email_sending_account_type) =
  match x with COGNITO_DEFAULT -> `String "COGNITO_DEFAULT" | DEVELOPER -> `String "DEVELOPER"

let email_address_type_to_yojson = string_to_yojson

let email_configuration_type_to_yojson (x : email_configuration_type) =
  assoc_to_yojson
    [
      ("SourceArn", option_to_yojson arn_type_to_yojson x.source_arn);
      ("ReplyToEmailAddress", option_to_yojson email_address_type_to_yojson x.reply_to_email_address);
      ( "EmailSendingAccount",
        option_to_yojson email_sending_account_type_to_yojson x.email_sending_account );
      ("From", option_to_yojson string_type_to_yojson x.from_);
      ("ConfigurationSet", option_to_yojson ses_configuration_set_to_yojson x.configuration_set);
    ]

let device_configuration_type_to_yojson (x : device_configuration_type) =
  assoc_to_yojson
    [
      ( "ChallengeRequiredOnNewDevice",
        option_to_yojson boolean_type_to_yojson x.challenge_required_on_new_device );
      ( "DeviceOnlyRememberedOnUserPrompt",
        option_to_yojson boolean_type_to_yojson x.device_only_remembered_on_user_prompt );
    ]

let user_pool_mfa_type_to_yojson (x : user_pool_mfa_type) =
  match x with OFF -> `String "OFF" | ON -> `String "ON" | OPTIONAL -> `String "OPTIONAL"

let verified_attribute_type_to_yojson (x : verified_attribute_type) =
  match x with PHONE_NUMBER -> `String "phone_number" | EMAIL -> `String "email"

let attributes_require_verification_before_update_type_to_yojson tree =
  list_to_yojson verified_attribute_type_to_yojson tree

let user_attribute_update_settings_type_to_yojson (x : user_attribute_update_settings_type) =
  assoc_to_yojson
    [
      ( "AttributesRequireVerificationBeforeUpdate",
        option_to_yojson attributes_require_verification_before_update_type_to_yojson
          x.attributes_require_verification_before_update );
    ]

let sms_verification_message_type_to_yojson = string_to_yojson

let default_email_option_type_to_yojson (x : default_email_option_type) =
  match x with
  | CONFIRM_WITH_LINK -> `String "CONFIRM_WITH_LINK"
  | CONFIRM_WITH_CODE -> `String "CONFIRM_WITH_CODE"

let email_verification_subject_by_link_type_to_yojson = string_to_yojson
let email_verification_message_by_link_type_to_yojson = string_to_yojson
let email_verification_message_type_to_yojson = string_to_yojson

let verification_message_template_type_to_yojson (x : verification_message_template_type) =
  assoc_to_yojson
    [
      ("SmsMessage", option_to_yojson sms_verification_message_type_to_yojson x.sms_message);
      ("EmailMessage", option_to_yojson email_verification_message_type_to_yojson x.email_message);
      ("EmailSubject", option_to_yojson email_verification_subject_type_to_yojson x.email_subject);
      ( "EmailMessageByLink",
        option_to_yojson email_verification_message_by_link_type_to_yojson x.email_message_by_link
      );
      ( "EmailSubjectByLink",
        option_to_yojson email_verification_subject_by_link_type_to_yojson x.email_subject_by_link
      );
      ( "DefaultEmailOption",
        option_to_yojson default_email_option_type_to_yojson x.default_email_option );
    ]

let verified_attributes_list_type_to_yojson tree =
  list_to_yojson verified_attribute_type_to_yojson tree

let inbound_federation_lambda_version_type_to_yojson (x : inbound_federation_lambda_version_type) =
  match x with V1_0 -> `String "V1_0"

let inbound_federation_lambda_type_to_yojson (x : inbound_federation_lambda_type) =
  assoc_to_yojson
    [
      ("LambdaVersion", Some (inbound_federation_lambda_version_type_to_yojson x.lambda_version));
      ("LambdaArn", Some (arn_type_to_yojson x.lambda_arn));
    ]

let custom_email_sender_lambda_version_type_to_yojson (x : custom_email_sender_lambda_version_type)
    =
  match x with V1_0 -> `String "V1_0"

let custom_email_lambda_version_config_type_to_yojson (x : custom_email_lambda_version_config_type)
    =
  assoc_to_yojson
    [
      ("LambdaVersion", Some (custom_email_sender_lambda_version_type_to_yojson x.lambda_version));
      ("LambdaArn", Some (arn_type_to_yojson x.lambda_arn));
    ]

let custom_sms_sender_lambda_version_type_to_yojson (x : custom_sms_sender_lambda_version_type) =
  match x with V1_0 -> `String "V1_0"

let custom_sms_lambda_version_config_type_to_yojson (x : custom_sms_lambda_version_config_type) =
  assoc_to_yojson
    [
      ("LambdaVersion", Some (custom_sms_sender_lambda_version_type_to_yojson x.lambda_version));
      ("LambdaArn", Some (arn_type_to_yojson x.lambda_arn));
    ]

let pre_token_generation_lambda_version_type_to_yojson
    (x : pre_token_generation_lambda_version_type) =
  match x with V1_0 -> `String "V1_0" | V2_0 -> `String "V2_0" | V3_0 -> `String "V3_0"

let pre_token_generation_version_config_type_to_yojson
    (x : pre_token_generation_version_config_type) =
  assoc_to_yojson
    [
      ("LambdaVersion", Some (pre_token_generation_lambda_version_type_to_yojson x.lambda_version));
      ("LambdaArn", Some (arn_type_to_yojson x.lambda_arn));
    ]

let lambda_config_type_to_yojson (x : lambda_config_type) =
  assoc_to_yojson
    [
      ("PreSignUp", option_to_yojson arn_type_to_yojson x.pre_sign_up);
      ("CustomMessage", option_to_yojson arn_type_to_yojson x.custom_message);
      ("PostConfirmation", option_to_yojson arn_type_to_yojson x.post_confirmation);
      ("PreAuthentication", option_to_yojson arn_type_to_yojson x.pre_authentication);
      ("PostAuthentication", option_to_yojson arn_type_to_yojson x.post_authentication);
      ("DefineAuthChallenge", option_to_yojson arn_type_to_yojson x.define_auth_challenge);
      ("CreateAuthChallenge", option_to_yojson arn_type_to_yojson x.create_auth_challenge);
      ( "VerifyAuthChallengeResponse",
        option_to_yojson arn_type_to_yojson x.verify_auth_challenge_response );
      ("PreTokenGeneration", option_to_yojson arn_type_to_yojson x.pre_token_generation);
      ("UserMigration", option_to_yojson arn_type_to_yojson x.user_migration);
      ( "PreTokenGenerationConfig",
        option_to_yojson pre_token_generation_version_config_type_to_yojson
          x.pre_token_generation_config );
      ( "CustomSMSSender",
        option_to_yojson custom_sms_lambda_version_config_type_to_yojson x.custom_sms_sender );
      ( "CustomEmailSender",
        option_to_yojson custom_email_lambda_version_config_type_to_yojson x.custom_email_sender );
      ("KMSKeyID", option_to_yojson arn_type_to_yojson x.kms_key_i_d);
      ( "InboundFederation",
        option_to_yojson inbound_federation_lambda_type_to_yojson x.inbound_federation );
    ]

let deletion_protection_type_to_yojson (x : deletion_protection_type) =
  match x with ACTIVE -> `String "ACTIVE" | INACTIVE -> `String "INACTIVE"

let auth_factor_type_to_yojson (x : auth_factor_type) =
  match x with
  | PASSWORD -> `String "PASSWORD"
  | EMAIL_OTP -> `String "EMAIL_OTP"
  | SMS_OTP -> `String "SMS_OTP"
  | WEB_AUTHN -> `String "WEB_AUTHN"

let allowed_first_auth_factors_list_type_to_yojson tree =
  list_to_yojson auth_factor_type_to_yojson tree

let sign_in_policy_type_to_yojson (x : sign_in_policy_type) =
  assoc_to_yojson
    [
      ( "AllowedFirstAuthFactors",
        option_to_yojson allowed_first_auth_factors_list_type_to_yojson x.allowed_first_auth_factors
      );
    ]

let temporary_password_validity_days_type_to_yojson = int_to_yojson
let password_history_size_type_to_yojson = int_to_yojson
let password_policy_min_length_type_to_yojson = int_to_yojson

let password_policy_type_to_yojson (x : password_policy_type) =
  assoc_to_yojson
    [
      ("MinimumLength", option_to_yojson password_policy_min_length_type_to_yojson x.minimum_length);
      ("RequireUppercase", option_to_yojson boolean_type_to_yojson x.require_uppercase);
      ("RequireLowercase", option_to_yojson boolean_type_to_yojson x.require_lowercase);
      ("RequireNumbers", option_to_yojson boolean_type_to_yojson x.require_numbers);
      ("RequireSymbols", option_to_yojson boolean_type_to_yojson x.require_symbols);
      ( "PasswordHistorySize",
        option_to_yojson password_history_size_type_to_yojson x.password_history_size );
      ( "TemporaryPasswordValidityDays",
        option_to_yojson temporary_password_validity_days_type_to_yojson
          x.temporary_password_validity_days );
    ]

let user_pool_policy_type_to_yojson (x : user_pool_policy_type) =
  assoc_to_yojson
    [
      ("PasswordPolicy", option_to_yojson password_policy_type_to_yojson x.password_policy);
      ("SignInPolicy", option_to_yojson sign_in_policy_type_to_yojson x.sign_in_policy);
    ]

let update_user_pool_request_to_yojson (x : update_user_pool_request) =
  assoc_to_yojson
    [
      ("UserPoolId", Some (user_pool_id_type_to_yojson x.user_pool_id));
      ("Policies", option_to_yojson user_pool_policy_type_to_yojson x.policies);
      ( "DeletionProtection",
        option_to_yojson deletion_protection_type_to_yojson x.deletion_protection );
      ("LambdaConfig", option_to_yojson lambda_config_type_to_yojson x.lambda_config);
      ( "AutoVerifiedAttributes",
        option_to_yojson verified_attributes_list_type_to_yojson x.auto_verified_attributes );
      ( "SmsVerificationMessage",
        option_to_yojson sms_verification_message_type_to_yojson x.sms_verification_message );
      ( "EmailVerificationMessage",
        option_to_yojson email_verification_message_type_to_yojson x.email_verification_message );
      ( "EmailVerificationSubject",
        option_to_yojson email_verification_subject_type_to_yojson x.email_verification_subject );
      ( "VerificationMessageTemplate",
        option_to_yojson verification_message_template_type_to_yojson
          x.verification_message_template );
      ( "SmsAuthenticationMessage",
        option_to_yojson sms_verification_message_type_to_yojson x.sms_authentication_message );
      ( "UserAttributeUpdateSettings",
        option_to_yojson user_attribute_update_settings_type_to_yojson
          x.user_attribute_update_settings );
      ("MfaConfiguration", option_to_yojson user_pool_mfa_type_to_yojson x.mfa_configuration);
      ( "DeviceConfiguration",
        option_to_yojson device_configuration_type_to_yojson x.device_configuration );
      ( "EmailConfiguration",
        option_to_yojson email_configuration_type_to_yojson x.email_configuration );
      ("SmsConfiguration", option_to_yojson sms_configuration_type_to_yojson x.sms_configuration);
      ("UserPoolTags", option_to_yojson user_pool_tags_type_to_yojson x.user_pool_tags);
      ( "AdminCreateUserConfig",
        option_to_yojson admin_create_user_config_type_to_yojson x.admin_create_user_config );
      ("UserPoolAddOns", option_to_yojson user_pool_add_ons_type_to_yojson x.user_pool_add_ons);
      ( "AccountRecoverySetting",
        option_to_yojson account_recovery_setting_type_to_yojson x.account_recovery_setting );
      ("PoolName", option_to_yojson user_pool_name_type_to_yojson x.pool_name);
      ("UserPoolTier", option_to_yojson user_pool_tier_type_to_yojson x.user_pool_tier);
      ("KeyConfiguration", option_to_yojson key_configuration_type_to_yojson x.key_configuration);
      ( "IssuerConfiguration",
        option_to_yojson issuer_configuration_type_to_yojson x.issuer_configuration );
    ]

let user_lambda_validation_exception_to_yojson (x : user_lambda_validation_exception) =
  assoc_to_yojson [ ("message", option_to_yojson message_type_to_yojson x.message) ]

let unexpected_lambda_exception_to_yojson (x : unexpected_lambda_exception) =
  assoc_to_yojson [ ("message", option_to_yojson message_type_to_yojson x.message) ]

let invalid_lambda_response_exception_to_yojson (x : invalid_lambda_response_exception) =
  assoc_to_yojson [ ("message", option_to_yojson message_type_to_yojson x.message) ]

let code_delivery_failure_exception_to_yojson (x : code_delivery_failure_exception) =
  assoc_to_yojson [ ("message", option_to_yojson message_type_to_yojson x.message) ]

let delivery_medium_type_to_yojson (x : delivery_medium_type) =
  match x with SMS -> `String "SMS" | EMAIL -> `String "EMAIL"

let code_delivery_details_type_to_yojson (x : code_delivery_details_type) =
  assoc_to_yojson
    [
      ("Destination", option_to_yojson string_type_to_yojson x.destination);
      ("DeliveryMedium", option_to_yojson delivery_medium_type_to_yojson x.delivery_medium);
      ("AttributeName", option_to_yojson attribute_name_type_to_yojson x.attribute_name);
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

let attribute_value_type_to_yojson = string_to_yojson

let attribute_type_to_yojson (x : attribute_type) =
  assoc_to_yojson
    [
      ("Name", Some (attribute_name_type_to_yojson x.name));
      ("Value", option_to_yojson attribute_value_type_to_yojson x.value);
    ]

let attribute_list_type_to_yojson tree = list_to_yojson attribute_type_to_yojson tree

let update_user_attributes_request_to_yojson (x : update_user_attributes_request) =
  assoc_to_yojson
    [
      ("UserAttributes", Some (attribute_list_type_to_yojson x.user_attributes));
      ("AccessToken", Some (token_model_type_to_yojson x.access_token));
      ("ClientMetadata", option_to_yojson client_metadata_type_to_yojson x.client_metadata);
    ]

let terms_exists_exception_to_yojson (x : terms_exists_exception) =
  assoc_to_yojson [ ("message", option_to_yojson message_type_to_yojson x.message) ]

let link_url_type_to_yojson = string_to_yojson
let language_id_type_to_yojson = string_to_yojson

let links_type_to_yojson tree =
  map_to_yojson language_id_type_to_yojson link_url_type_to_yojson tree

let terms_enforcement_type_to_yojson (x : terms_enforcement_type) =
  match x with NONE -> `String "NONE"

let terms_source_type_to_yojson (x : terms_source_type) = match x with LINK -> `String "LINK"
let terms_name_type_to_yojson = string_to_yojson
let terms_id_type_to_yojson = string_to_yojson

let terms_type_to_yojson (x : terms_type) =
  assoc_to_yojson
    [
      ("TermsId", Some (terms_id_type_to_yojson x.terms_id));
      ("UserPoolId", Some (user_pool_id_type_to_yojson x.user_pool_id));
      ("ClientId", Some (client_id_type_to_yojson x.client_id));
      ("TermsName", Some (terms_name_type_to_yojson x.terms_name));
      ("TermsSource", Some (terms_source_type_to_yojson x.terms_source));
      ("Enforcement", Some (terms_enforcement_type_to_yojson x.enforcement));
      ("Links", Some (links_type_to_yojson x.links));
      ("CreationDate", Some (date_type_to_yojson x.creation_date));
      ("LastModifiedDate", Some (date_type_to_yojson x.last_modified_date));
    ]

let update_terms_response_to_yojson (x : update_terms_response) =
  assoc_to_yojson [ ("Terms", option_to_yojson terms_type_to_yojson x.terms) ]

let update_terms_request_to_yojson (x : update_terms_request) =
  assoc_to_yojson
    [
      ("TermsId", Some (terms_id_type_to_yojson x.terms_id));
      ("UserPoolId", Some (user_pool_id_type_to_yojson x.user_pool_id));
      ("TermsName", option_to_yojson terms_name_type_to_yojson x.terms_name);
      ("TermsSource", option_to_yojson terms_source_type_to_yojson x.terms_source);
      ("Enforcement", option_to_yojson terms_enforcement_type_to_yojson x.enforcement);
      ("Links", option_to_yojson links_type_to_yojson x.links);
    ]

let resource_server_scope_description_type_to_yojson = string_to_yojson
let resource_server_scope_name_type_to_yojson = string_to_yojson

let resource_server_scope_type_to_yojson (x : resource_server_scope_type) =
  assoc_to_yojson
    [
      ("ScopeName", Some (resource_server_scope_name_type_to_yojson x.scope_name));
      ( "ScopeDescription",
        Some (resource_server_scope_description_type_to_yojson x.scope_description) );
    ]

let resource_server_scope_list_type_to_yojson tree =
  list_to_yojson resource_server_scope_type_to_yojson tree

let resource_server_name_type_to_yojson = string_to_yojson
let resource_server_identifier_type_to_yojson = string_to_yojson

let resource_server_type_to_yojson (x : resource_server_type) =
  assoc_to_yojson
    [
      ("UserPoolId", option_to_yojson user_pool_id_type_to_yojson x.user_pool_id);
      ("Identifier", option_to_yojson resource_server_identifier_type_to_yojson x.identifier);
      ("Name", option_to_yojson resource_server_name_type_to_yojson x.name);
      ("Scopes", option_to_yojson resource_server_scope_list_type_to_yojson x.scopes);
    ]

let update_resource_server_response_to_yojson (x : update_resource_server_response) =
  assoc_to_yojson [ ("ResourceServer", Some (resource_server_type_to_yojson x.resource_server)) ]

let update_resource_server_request_to_yojson (x : update_resource_server_request) =
  assoc_to_yojson
    [
      ("UserPoolId", Some (user_pool_id_type_to_yojson x.user_pool_id));
      ("Identifier", Some (resource_server_identifier_type_to_yojson x.identifier));
      ("Name", Some (resource_server_name_type_to_yojson x.name));
      ("Scopes", option_to_yojson resource_server_scope_list_type_to_yojson x.scopes);
    ]

let service_quota_exceeded_exception_to_yojson (x : service_quota_exceeded_exception) =
  assoc_to_yojson [ ("message", option_to_yojson message_type_to_yojson x.message) ]

let integer_type_to_yojson = int_to_yojson

let string_to_string_map_type_to_yojson tree =
  map_to_yojson string_type_to_yojson string_type_to_yojson tree

let limit_class_to_yojson (x : limit_class) = match x with API_CATEGORY -> `String "API_CATEGORY"

let limit_definition_type_to_yojson (x : limit_definition_type) =
  assoc_to_yojson
    [
      ("LimitClass", Some (limit_class_to_yojson x.limit_class));
      ("Attributes", Some (string_to_string_map_type_to_yojson x.attributes));
    ]

let limit_type_to_yojson (x : limit_type) =
  assoc_to_yojson
    [
      ("LimitDefinition", Some (limit_definition_type_to_yojson x.limit_definition));
      ("ProvisionedLimitValue", Some (integer_type_to_yojson x.provisioned_limit_value));
      ("FreeLimitValue", Some (integer_type_to_yojson x.free_limit_value));
    ]

let update_provisioned_limit_response_to_yojson (x : update_provisioned_limit_response) =
  assoc_to_yojson [ ("Limit", Some (limit_type_to_yojson x.limit)) ]

let update_provisioned_limit_request_to_yojson (x : update_provisioned_limit_request) =
  assoc_to_yojson
    [
      ("LimitDefinition", Some (limit_definition_type_to_yojson x.limit_definition));
      ("RequestedLimitValue", Some (integer_type_to_yojson x.requested_limit_value));
    ]

let resource_id_type_to_yojson = string_to_yojson
let asset_bytes_type_to_yojson = blob_to_yojson

let asset_extension_type_to_yojson (x : asset_extension_type) =
  match x with
  | ICO -> `String "ICO"
  | JPEG -> `String "JPEG"
  | PNG -> `String "PNG"
  | SVG -> `String "SVG"
  | WEBP -> `String "WEBP"

let color_scheme_mode_type_to_yojson (x : color_scheme_mode_type) =
  match x with LIGHT -> `String "LIGHT" | DARK -> `String "DARK" | DYNAMIC -> `String "DYNAMIC"

let asset_category_type_to_yojson (x : asset_category_type) =
  match x with
  | FAVICON_ICO -> `String "FAVICON_ICO"
  | FAVICON_SVG -> `String "FAVICON_SVG"
  | EMAIL_GRAPHIC -> `String "EMAIL_GRAPHIC"
  | SMS_GRAPHIC -> `String "SMS_GRAPHIC"
  | AUTH_APP_GRAPHIC -> `String "AUTH_APP_GRAPHIC"
  | PASSWORD_GRAPHIC -> `String "PASSWORD_GRAPHIC"
  | PASSKEY_GRAPHIC -> `String "PASSKEY_GRAPHIC"
  | PAGE_HEADER_LOGO -> `String "PAGE_HEADER_LOGO"
  | PAGE_HEADER_BACKGROUND -> `String "PAGE_HEADER_BACKGROUND"
  | PAGE_FOOTER_LOGO -> `String "PAGE_FOOTER_LOGO"
  | PAGE_FOOTER_BACKGROUND -> `String "PAGE_FOOTER_BACKGROUND"
  | PAGE_BACKGROUND -> `String "PAGE_BACKGROUND"
  | FORM_BACKGROUND -> `String "FORM_BACKGROUND"
  | FORM_LOGO -> `String "FORM_LOGO"
  | IDP_BUTTON_ICON -> `String "IDP_BUTTON_ICON"

let asset_type_to_yojson (x : asset_type) =
  assoc_to_yojson
    [
      ("Category", Some (asset_category_type_to_yojson x.category));
      ("ColorMode", Some (color_scheme_mode_type_to_yojson x.color_mode));
      ("Extension", Some (asset_extension_type_to_yojson x.extension));
      ("Bytes", option_to_yojson asset_bytes_type_to_yojson x.bytes);
      ("ResourceId", option_to_yojson resource_id_type_to_yojson x.resource_id);
    ]

let asset_list_type_to_yojson tree = list_to_yojson asset_type_to_yojson tree
let document_to_yojson = json_to_yojson
let managed_login_branding_id_type_to_yojson = string_to_yojson

let managed_login_branding_type_to_yojson (x : managed_login_branding_type) =
  assoc_to_yojson
    [
      ( "ManagedLoginBrandingId",
        option_to_yojson managed_login_branding_id_type_to_yojson x.managed_login_branding_id );
      ("UserPoolId", option_to_yojson user_pool_id_type_to_yojson x.user_pool_id);
      ( "UseCognitoProvidedValues",
        option_to_yojson boolean_type_to_yojson x.use_cognito_provided_values );
      ("Settings", option_to_yojson document_to_yojson x.settings);
      ("Assets", option_to_yojson asset_list_type_to_yojson x.assets);
      ("CreationDate", option_to_yojson date_type_to_yojson x.creation_date);
      ("LastModifiedDate", option_to_yojson date_type_to_yojson x.last_modified_date);
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
      ("UserPoolId", option_to_yojson user_pool_id_type_to_yojson x.user_pool_id);
      ( "ManagedLoginBrandingId",
        option_to_yojson managed_login_branding_id_type_to_yojson x.managed_login_branding_id );
      ( "UseCognitoProvidedValues",
        option_to_yojson boolean_type_to_yojson x.use_cognito_provided_values );
      ("Settings", option_to_yojson document_to_yojson x.settings);
      ("Assets", option_to_yojson asset_list_type_to_yojson x.assets);
    ]

let unsupported_identity_provider_exception_to_yojson (x : unsupported_identity_provider_exception)
    =
  assoc_to_yojson [ ("message", option_to_yojson message_type_to_yojson x.message) ]

let idp_identifier_type_to_yojson = string_to_yojson
let idp_identifiers_list_type_to_yojson tree = list_to_yojson idp_identifier_type_to_yojson tree
let attribute_mapping_key_type_to_yojson = string_to_yojson

let attribute_mapping_type_to_yojson tree =
  map_to_yojson attribute_mapping_key_type_to_yojson string_type_to_yojson tree

let provider_details_type_to_yojson tree =
  map_to_yojson string_type_to_yojson string_type_to_yojson tree

let identity_provider_type_type_to_yojson (x : identity_provider_type_type) =
  match x with
  | SAML -> `String "SAML"
  | Facebook -> `String "Facebook"
  | Google -> `String "Google"
  | LoginWithAmazon -> `String "LoginWithAmazon"
  | SignInWithApple -> `String "SignInWithApple"
  | OIDC -> `String "OIDC"

let identity_provider_type_to_yojson (x : identity_provider_type) =
  assoc_to_yojson
    [
      ("UserPoolId", option_to_yojson user_pool_id_type_to_yojson x.user_pool_id);
      ("ProviderName", option_to_yojson provider_name_type_to_yojson x.provider_name);
      ("ProviderType", option_to_yojson identity_provider_type_type_to_yojson x.provider_type);
      ("ProviderDetails", option_to_yojson provider_details_type_to_yojson x.provider_details);
      ("AttributeMapping", option_to_yojson attribute_mapping_type_to_yojson x.attribute_mapping);
      ("IdpIdentifiers", option_to_yojson idp_identifiers_list_type_to_yojson x.idp_identifiers);
      ("LastModifiedDate", option_to_yojson date_type_to_yojson x.last_modified_date);
      ("CreationDate", option_to_yojson date_type_to_yojson x.creation_date);
    ]

let update_identity_provider_response_to_yojson (x : update_identity_provider_response) =
  assoc_to_yojson
    [ ("IdentityProvider", Some (identity_provider_type_to_yojson x.identity_provider)) ]

let update_identity_provider_request_to_yojson (x : update_identity_provider_request) =
  assoc_to_yojson
    [
      ("UserPoolId", Some (user_pool_id_type_to_yojson x.user_pool_id));
      ("ProviderName", Some (provider_name_type_to_yojson x.provider_name));
      ("ProviderDetails", option_to_yojson provider_details_type_to_yojson x.provider_details);
      ("AttributeMapping", option_to_yojson attribute_mapping_type_to_yojson x.attribute_mapping);
      ("IdpIdentifiers", option_to_yojson idp_identifiers_list_type_to_yojson x.idp_identifiers);
    ]

let precedence_type_to_yojson = int_to_yojson
let description_type_to_yojson = string_to_yojson
let group_name_type_to_yojson = string_to_yojson

let group_type_to_yojson (x : group_type) =
  assoc_to_yojson
    [
      ("GroupName", option_to_yojson group_name_type_to_yojson x.group_name);
      ("UserPoolId", option_to_yojson user_pool_id_type_to_yojson x.user_pool_id);
      ("Description", option_to_yojson description_type_to_yojson x.description);
      ("RoleArn", option_to_yojson arn_type_to_yojson x.role_arn);
      ("Precedence", option_to_yojson precedence_type_to_yojson x.precedence);
      ("LastModifiedDate", option_to_yojson date_type_to_yojson x.last_modified_date);
      ("CreationDate", option_to_yojson date_type_to_yojson x.creation_date);
    ]

let update_group_response_to_yojson (x : update_group_response) =
  assoc_to_yojson [ ("Group", option_to_yojson group_type_to_yojson x.group) ]

let update_group_request_to_yojson (x : update_group_request) =
  assoc_to_yojson
    [
      ("GroupName", Some (group_name_type_to_yojson x.group_name));
      ("UserPoolId", Some (user_pool_id_type_to_yojson x.user_pool_id));
      ("Description", option_to_yojson description_type_to_yojson x.description);
      ("RoleArn", option_to_yojson arn_type_to_yojson x.role_arn);
      ("Precedence", option_to_yojson precedence_type_to_yojson x.precedence);
    ]

let update_device_status_response_to_yojson = unit_to_yojson

let device_remembered_status_type_to_yojson (x : device_remembered_status_type) =
  match x with REMEMBERED -> `String "remembered" | NOT_REMEMBERED -> `String "not_remembered"

let device_key_type_to_yojson = string_to_yojson

let update_device_status_request_to_yojson (x : update_device_status_request) =
  assoc_to_yojson
    [
      ("AccessToken", Some (token_model_type_to_yojson x.access_token));
      ("DeviceKey", Some (device_key_type_to_yojson x.device_key));
      ( "DeviceRememberedStatus",
        option_to_yojson device_remembered_status_type_to_yojson x.device_remembered_status );
    ]

let user_pool_add_on_not_enabled_exception_to_yojson (x : user_pool_add_on_not_enabled_exception) =
  assoc_to_yojson [ ("message", option_to_yojson message_type_to_yojson x.message) ]

let update_auth_event_feedback_response_to_yojson = unit_to_yojson

let feedback_value_type_to_yojson (x : feedback_value_type) =
  match x with VALID -> `String "Valid" | INVALID -> `String "Invalid"

let event_id_type_to_yojson = string_to_yojson
let username_type_to_yojson = string_to_yojson

let update_auth_event_feedback_request_to_yojson (x : update_auth_event_feedback_request) =
  assoc_to_yojson
    [
      ("UserPoolId", Some (user_pool_id_type_to_yojson x.user_pool_id));
      ("Username", Some (username_type_to_yojson x.username));
      ("EventId", Some (event_id_type_to_yojson x.event_id));
      ("FeedbackToken", Some (token_model_type_to_yojson x.feedback_token));
      ("FeedbackValue", Some (feedback_value_type_to_yojson x.feedback_value));
    ]

let untag_resource_response_to_yojson = unit_to_yojson
let user_pool_tags_list_type_to_yojson tree = list_to_yojson tag_keys_type_to_yojson tree

let untag_resource_request_to_yojson (x : untag_resource_request) =
  assoc_to_yojson
    [
      ("ResourceArn", Some (arn_type_to_yojson x.resource_arn));
      ("TagKeys", Some (user_pool_tags_list_type_to_yojson x.tag_keys));
    ]

let tag_resource_response_to_yojson = unit_to_yojson

let tag_resource_request_to_yojson (x : tag_resource_request) =
  assoc_to_yojson
    [
      ("ResourceArn", Some (arn_type_to_yojson x.resource_arn));
      ("Tags", Some (user_pool_tags_type_to_yojson x.tags));
    ]

let precondition_not_met_exception_to_yojson (x : precondition_not_met_exception) =
  assoc_to_yojson [ ("message", option_to_yojson message_type_to_yojson x.message) ]

let completion_message_type_to_yojson = string_to_yojson
let long_type_to_yojson = long_to_yojson

let user_import_job_status_type_to_yojson (x : user_import_job_status_type) =
  match x with
  | Created -> `String "Created"
  | Pending -> `String "Pending"
  | InProgress -> `String "InProgress"
  | Stopping -> `String "Stopping"
  | Expired -> `String "Expired"
  | Stopped -> `String "Stopped"
  | Failed -> `String "Failed"
  | Succeeded -> `String "Succeeded"

let pre_signed_url_type_to_yojson = string_to_yojson
let user_import_job_id_type_to_yojson = string_to_yojson
let user_import_job_name_type_to_yojson = string_to_yojson

let user_import_job_type_to_yojson (x : user_import_job_type) =
  assoc_to_yojson
    [
      ("JobName", option_to_yojson user_import_job_name_type_to_yojson x.job_name);
      ("JobId", option_to_yojson user_import_job_id_type_to_yojson x.job_id);
      ("UserPoolId", option_to_yojson user_pool_id_type_to_yojson x.user_pool_id);
      ("PreSignedUrl", option_to_yojson pre_signed_url_type_to_yojson x.pre_signed_url);
      ("CreationDate", option_to_yojson date_type_to_yojson x.creation_date);
      ("StartDate", option_to_yojson date_type_to_yojson x.start_date);
      ("CompletionDate", option_to_yojson date_type_to_yojson x.completion_date);
      ("Status", option_to_yojson user_import_job_status_type_to_yojson x.status);
      ("CloudWatchLogsRoleArn", option_to_yojson arn_type_to_yojson x.cloud_watch_logs_role_arn);
      ("ImportedUsers", option_to_yojson long_type_to_yojson x.imported_users);
      ("SkippedUsers", option_to_yojson long_type_to_yojson x.skipped_users);
      ("FailedUsers", option_to_yojson long_type_to_yojson x.failed_users);
      ("CompletionMessage", option_to_yojson completion_message_type_to_yojson x.completion_message);
    ]

let stop_user_import_job_response_to_yojson (x : stop_user_import_job_response) =
  assoc_to_yojson
    [ ("UserImportJob", option_to_yojson user_import_job_type_to_yojson x.user_import_job) ]

let stop_user_import_job_request_to_yojson (x : stop_user_import_job_request) =
  assoc_to_yojson
    [
      ("UserPoolId", Some (user_pool_id_type_to_yojson x.user_pool_id));
      ("JobId", Some (user_import_job_id_type_to_yojson x.job_id));
    ]

let web_authn_not_enabled_exception_to_yojson (x : web_authn_not_enabled_exception) =
  assoc_to_yojson [ ("message", option_to_yojson message_type_to_yojson x.message) ]

let web_authn_configuration_missing_exception_to_yojson
    (x : web_authn_configuration_missing_exception) =
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
      ("UserPoolId", Some (user_pool_id_type_to_yojson x.user_pool_id));
      ("JobId", Some (user_import_job_id_type_to_yojson x.job_id));
    ]

let username_exists_exception_to_yojson (x : username_exists_exception) =
  assoc_to_yojson [ ("message", option_to_yojson message_type_to_yojson x.message) ]

let invalid_password_exception_to_yojson (x : invalid_password_exception) =
  assoc_to_yojson [ ("message", option_to_yojson message_type_to_yojson x.message) ]

let sign_up_response_to_yojson (x : sign_up_response) =
  assoc_to_yojson
    [
      ("UserConfirmed", Some (boolean_type_to_yojson x.user_confirmed));
      ( "CodeDeliveryDetails",
        option_to_yojson code_delivery_details_type_to_yojson x.code_delivery_details );
      ("UserSub", Some (string_type_to_yojson x.user_sub));
      ("Session", option_to_yojson session_type_to_yojson x.session);
    ]

let user_context_data_type_to_yojson (x : user_context_data_type) =
  assoc_to_yojson
    [
      ("IpAddress", option_to_yojson string_type_to_yojson x.ip_address);
      ("EncodedData", option_to_yojson string_type_to_yojson x.encoded_data);
    ]

let analytics_metadata_type_to_yojson (x : analytics_metadata_type) =
  assoc_to_yojson
    [ ("AnalyticsEndpointId", option_to_yojson string_type_to_yojson x.analytics_endpoint_id) ]

let password_type_to_yojson = string_to_yojson
let secret_hash_type_to_yojson = string_to_yojson

let sign_up_request_to_yojson (x : sign_up_request) =
  assoc_to_yojson
    [
      ("ClientId", Some (client_id_type_to_yojson x.client_id));
      ("SecretHash", option_to_yojson secret_hash_type_to_yojson x.secret_hash);
      ("Username", Some (username_type_to_yojson x.username));
      ("Password", option_to_yojson password_type_to_yojson x.password);
      ("UserAttributes", option_to_yojson attribute_list_type_to_yojson x.user_attributes);
      ("ValidationData", option_to_yojson attribute_list_type_to_yojson x.validation_data);
      ("AnalyticsMetadata", option_to_yojson analytics_metadata_type_to_yojson x.analytics_metadata);
      ("UserContextData", option_to_yojson user_context_data_type_to_yojson x.user_context_data);
      ("ClientMetadata", option_to_yojson client_metadata_type_to_yojson x.client_metadata);
    ]

let set_user_settings_response_to_yojson = unit_to_yojson

let mfa_option_type_to_yojson (x : mfa_option_type) =
  assoc_to_yojson
    [
      ("DeliveryMedium", option_to_yojson delivery_medium_type_to_yojson x.delivery_medium);
      ("AttributeName", option_to_yojson attribute_name_type_to_yojson x.attribute_name);
    ]

let mfa_option_list_type_to_yojson tree = list_to_yojson mfa_option_type_to_yojson tree

let set_user_settings_request_to_yojson (x : set_user_settings_request) =
  assoc_to_yojson
    [
      ("AccessToken", Some (token_model_type_to_yojson x.access_token));
      ("MFAOptions", Some (mfa_option_list_type_to_yojson x.mfa_options));
    ]

let web_authn_factor_configuration_type_to_yojson (x : web_authn_factor_configuration_type) =
  match x with
  | SINGLE_FACTOR -> `String "SINGLE_FACTOR"
  | MULTI_FACTOR_WITH_USER_VERIFICATION -> `String "MULTI_FACTOR_WITH_USER_VERIFICATION"

let user_verification_type_to_yojson (x : user_verification_type) =
  match x with REQUIRED -> `String "required" | PREFERRED -> `String "preferred"

let relying_party_id_type_to_yojson = string_to_yojson

let web_authn_configuration_type_to_yojson (x : web_authn_configuration_type) =
  assoc_to_yojson
    [
      ("RelyingPartyId", option_to_yojson relying_party_id_type_to_yojson x.relying_party_id);
      ("UserVerification", option_to_yojson user_verification_type_to_yojson x.user_verification);
      ( "FactorConfiguration",
        option_to_yojson web_authn_factor_configuration_type_to_yojson x.factor_configuration );
    ]

let email_mfa_subject_type_to_yojson = string_to_yojson
let email_mfa_message_type_to_yojson = string_to_yojson

let email_mfa_config_type_to_yojson (x : email_mfa_config_type) =
  assoc_to_yojson
    [
      ("Message", option_to_yojson email_mfa_message_type_to_yojson x.message);
      ("Subject", option_to_yojson email_mfa_subject_type_to_yojson x.subject);
    ]

let software_token_mfa_config_type_to_yojson (x : software_token_mfa_config_type) =
  assoc_to_yojson [ ("Enabled", option_to_yojson boolean_type_to_yojson x.enabled) ]

let sms_mfa_config_type_to_yojson (x : sms_mfa_config_type) =
  assoc_to_yojson
    [
      ( "SmsAuthenticationMessage",
        option_to_yojson sms_verification_message_type_to_yojson x.sms_authentication_message );
      ("SmsConfiguration", option_to_yojson sms_configuration_type_to_yojson x.sms_configuration);
    ]

let set_user_pool_mfa_config_response_to_yojson (x : set_user_pool_mfa_config_response) =
  assoc_to_yojson
    [
      ("SmsMfaConfiguration", option_to_yojson sms_mfa_config_type_to_yojson x.sms_mfa_configuration);
      ( "SoftwareTokenMfaConfiguration",
        option_to_yojson software_token_mfa_config_type_to_yojson x.software_token_mfa_configuration
      );
      ( "EmailMfaConfiguration",
        option_to_yojson email_mfa_config_type_to_yojson x.email_mfa_configuration );
      ("MfaConfiguration", option_to_yojson user_pool_mfa_type_to_yojson x.mfa_configuration);
      ( "WebAuthnConfiguration",
        option_to_yojson web_authn_configuration_type_to_yojson x.web_authn_configuration );
    ]

let set_user_pool_mfa_config_request_to_yojson (x : set_user_pool_mfa_config_request) =
  assoc_to_yojson
    [
      ("UserPoolId", Some (user_pool_id_type_to_yojson x.user_pool_id));
      ("SmsMfaConfiguration", option_to_yojson sms_mfa_config_type_to_yojson x.sms_mfa_configuration);
      ( "SoftwareTokenMfaConfiguration",
        option_to_yojson software_token_mfa_config_type_to_yojson x.software_token_mfa_configuration
      );
      ( "EmailMfaConfiguration",
        option_to_yojson email_mfa_config_type_to_yojson x.email_mfa_configuration );
      ("MfaConfiguration", option_to_yojson user_pool_mfa_type_to_yojson x.mfa_configuration);
      ( "WebAuthnConfiguration",
        option_to_yojson web_authn_configuration_type_to_yojson x.web_authn_configuration );
    ]

let set_user_mfa_preference_response_to_yojson = unit_to_yojson

let web_authn_mfa_settings_type_to_yojson (x : web_authn_mfa_settings_type) =
  assoc_to_yojson [ ("Enabled", option_to_yojson boolean_type_to_yojson x.enabled) ]

let email_mfa_settings_type_to_yojson (x : email_mfa_settings_type) =
  assoc_to_yojson
    [
      ("Enabled", option_to_yojson boolean_type_to_yojson x.enabled);
      ("PreferredMfa", option_to_yojson boolean_type_to_yojson x.preferred_mfa);
    ]

let software_token_mfa_settings_type_to_yojson (x : software_token_mfa_settings_type) =
  assoc_to_yojson
    [
      ("Enabled", option_to_yojson boolean_type_to_yojson x.enabled);
      ("PreferredMfa", option_to_yojson boolean_type_to_yojson x.preferred_mfa);
    ]

let sms_mfa_settings_type_to_yojson (x : sms_mfa_settings_type) =
  assoc_to_yojson
    [
      ("Enabled", option_to_yojson boolean_type_to_yojson x.enabled);
      ("PreferredMfa", option_to_yojson boolean_type_to_yojson x.preferred_mfa);
    ]

let set_user_mfa_preference_request_to_yojson (x : set_user_mfa_preference_request) =
  assoc_to_yojson
    [
      ("SMSMfaSettings", option_to_yojson sms_mfa_settings_type_to_yojson x.sms_mfa_settings);
      ( "SoftwareTokenMfaSettings",
        option_to_yojson software_token_mfa_settings_type_to_yojson x.software_token_mfa_settings );
      ("EmailMfaSettings", option_to_yojson email_mfa_settings_type_to_yojson x.email_mfa_settings);
      ( "WebAuthnMfaSettings",
        option_to_yojson web_authn_mfa_settings_type_to_yojson x.web_authn_mfa_settings );
      ("AccessToken", Some (token_model_type_to_yojson x.access_token));
    ]

let css_version_type_to_yojson = string_to_yojson
let css_type_to_yojson = string_to_yojson
let image_url_type_to_yojson = string_to_yojson

let ui_customization_type_to_yojson (x : ui_customization_type) =
  assoc_to_yojson
    [
      ("UserPoolId", option_to_yojson user_pool_id_type_to_yojson x.user_pool_id);
      ("ClientId", option_to_yojson client_id_type_to_yojson x.client_id);
      ("ImageUrl", option_to_yojson image_url_type_to_yojson x.image_url);
      ("CSS", option_to_yojson css_type_to_yojson x.cs_s);
      ("CSSVersion", option_to_yojson css_version_type_to_yojson x.css_version);
      ("LastModifiedDate", option_to_yojson date_type_to_yojson x.last_modified_date);
      ("CreationDate", option_to_yojson date_type_to_yojson x.creation_date);
    ]

let set_ui_customization_response_to_yojson (x : set_ui_customization_response) =
  assoc_to_yojson [ ("UICustomization", Some (ui_customization_type_to_yojson x.ui_customization)) ]

let image_file_type_to_yojson = blob_to_yojson

let set_ui_customization_request_to_yojson (x : set_ui_customization_request) =
  assoc_to_yojson
    [
      ("UserPoolId", Some (user_pool_id_type_to_yojson x.user_pool_id));
      ("ClientId", option_to_yojson client_id_type_to_yojson x.client_id);
      ("CSS", option_to_yojson css_type_to_yojson x.cs_s);
      ("ImageFile", option_to_yojson image_file_type_to_yojson x.image_file);
    ]

let skipped_ip_range_list_type_to_yojson tree = list_to_yojson string_type_to_yojson tree
let blocked_ip_range_list_type_to_yojson tree = list_to_yojson string_type_to_yojson tree

let risk_exception_configuration_type_to_yojson (x : risk_exception_configuration_type) =
  assoc_to_yojson
    [
      ( "BlockedIPRangeList",
        option_to_yojson blocked_ip_range_list_type_to_yojson x.blocked_ip_range_list );
      ( "SkippedIPRangeList",
        option_to_yojson skipped_ip_range_list_type_to_yojson x.skipped_ip_range_list );
    ]

let account_takeover_event_action_type_to_yojson (x : account_takeover_event_action_type) =
  match x with
  | BLOCK -> `String "BLOCK"
  | MFA_IF_CONFIGURED -> `String "MFA_IF_CONFIGURED"
  | MFA_REQUIRED -> `String "MFA_REQUIRED"
  | NO_ACTION -> `String "NO_ACTION"

let account_takeover_action_notify_type_to_yojson = bool_to_yojson

let account_takeover_action_type_to_yojson (x : account_takeover_action_type) =
  assoc_to_yojson
    [
      ("Notify", Some (account_takeover_action_notify_type_to_yojson x.notify));
      ("EventAction", Some (account_takeover_event_action_type_to_yojson x.event_action));
    ]

let account_takeover_actions_type_to_yojson (x : account_takeover_actions_type) =
  assoc_to_yojson
    [
      ("LowAction", option_to_yojson account_takeover_action_type_to_yojson x.low_action);
      ("MediumAction", option_to_yojson account_takeover_action_type_to_yojson x.medium_action);
      ("HighAction", option_to_yojson account_takeover_action_type_to_yojson x.high_action);
    ]

let email_notification_body_type_to_yojson = string_to_yojson
let email_notification_subject_type_to_yojson = string_to_yojson

let notify_email_type_to_yojson (x : notify_email_type) =
  assoc_to_yojson
    [
      ("Subject", Some (email_notification_subject_type_to_yojson x.subject));
      ("HtmlBody", option_to_yojson email_notification_body_type_to_yojson x.html_body);
      ("TextBody", option_to_yojson email_notification_body_type_to_yojson x.text_body);
    ]

let notify_configuration_type_to_yojson (x : notify_configuration_type) =
  assoc_to_yojson
    [
      ("From", option_to_yojson string_type_to_yojson x.from_);
      ("ReplyTo", option_to_yojson string_type_to_yojson x.reply_to);
      ("SourceArn", Some (arn_type_to_yojson x.source_arn));
      ("BlockEmail", option_to_yojson notify_email_type_to_yojson x.block_email);
      ("NoActionEmail", option_to_yojson notify_email_type_to_yojson x.no_action_email);
      ("MfaEmail", option_to_yojson notify_email_type_to_yojson x.mfa_email);
    ]

let account_takeover_risk_configuration_type_to_yojson
    (x : account_takeover_risk_configuration_type) =
  assoc_to_yojson
    [
      ( "NotifyConfiguration",
        option_to_yojson notify_configuration_type_to_yojson x.notify_configuration );
      ("Actions", Some (account_takeover_actions_type_to_yojson x.actions));
    ]

let compromised_credentials_event_action_type_to_yojson
    (x : compromised_credentials_event_action_type) =
  match x with BLOCK -> `String "BLOCK" | NO_ACTION -> `String "NO_ACTION"

let compromised_credentials_actions_type_to_yojson (x : compromised_credentials_actions_type) =
  assoc_to_yojson
    [ ("EventAction", Some (compromised_credentials_event_action_type_to_yojson x.event_action)) ]

let event_filter_type_to_yojson (x : event_filter_type) =
  match x with
  | SIGN_IN -> `String "SIGN_IN"
  | PASSWORD_CHANGE -> `String "PASSWORD_CHANGE"
  | SIGN_UP -> `String "SIGN_UP"

let event_filters_type_to_yojson tree = list_to_yojson event_filter_type_to_yojson tree

let compromised_credentials_risk_configuration_type_to_yojson
    (x : compromised_credentials_risk_configuration_type) =
  assoc_to_yojson
    [
      ("EventFilter", option_to_yojson event_filters_type_to_yojson x.event_filter);
      ("Actions", Some (compromised_credentials_actions_type_to_yojson x.actions));
    ]

let risk_configuration_type_to_yojson (x : risk_configuration_type) =
  assoc_to_yojson
    [
      ("UserPoolId", option_to_yojson user_pool_id_type_to_yojson x.user_pool_id);
      ("ClientId", option_to_yojson client_id_type_to_yojson x.client_id);
      ( "CompromisedCredentialsRiskConfiguration",
        option_to_yojson compromised_credentials_risk_configuration_type_to_yojson
          x.compromised_credentials_risk_configuration );
      ( "AccountTakeoverRiskConfiguration",
        option_to_yojson account_takeover_risk_configuration_type_to_yojson
          x.account_takeover_risk_configuration );
      ( "RiskExceptionConfiguration",
        option_to_yojson risk_exception_configuration_type_to_yojson x.risk_exception_configuration
      );
      ("LastModifiedDate", option_to_yojson date_type_to_yojson x.last_modified_date);
    ]

let set_risk_configuration_response_to_yojson (x : set_risk_configuration_response) =
  assoc_to_yojson
    [ ("RiskConfiguration", Some (risk_configuration_type_to_yojson x.risk_configuration)) ]

let set_risk_configuration_request_to_yojson (x : set_risk_configuration_request) =
  assoc_to_yojson
    [
      ("UserPoolId", Some (user_pool_id_type_to_yojson x.user_pool_id));
      ("ClientId", option_to_yojson client_id_type_to_yojson x.client_id);
      ( "CompromisedCredentialsRiskConfiguration",
        option_to_yojson compromised_credentials_risk_configuration_type_to_yojson
          x.compromised_credentials_risk_configuration );
      ( "AccountTakeoverRiskConfiguration",
        option_to_yojson account_takeover_risk_configuration_type_to_yojson
          x.account_takeover_risk_configuration );
      ( "RiskExceptionConfiguration",
        option_to_yojson risk_exception_configuration_type_to_yojson x.risk_exception_configuration
      );
    ]

let firehose_configuration_type_to_yojson (x : firehose_configuration_type) =
  assoc_to_yojson [ ("StreamArn", option_to_yojson arn_type_to_yojson x.stream_arn) ]

let s3_arn_type_to_yojson = string_to_yojson

let s3_configuration_type_to_yojson (x : s3_configuration_type) =
  assoc_to_yojson [ ("BucketArn", option_to_yojson s3_arn_type_to_yojson x.bucket_arn) ]

let cloud_watch_logs_configuration_type_to_yojson (x : cloud_watch_logs_configuration_type) =
  assoc_to_yojson [ ("LogGroupArn", option_to_yojson arn_type_to_yojson x.log_group_arn) ]

let event_source_name_to_yojson (x : event_source_name) =
  match x with
  | USER_NOTIFICATION -> `String "userNotification"
  | USER_AUTH_EVENTS -> `String "userAuthEvents"

let log_level_to_yojson (x : log_level) =
  match x with ERROR -> `String "ERROR" | INFO -> `String "INFO"

let log_configuration_type_to_yojson (x : log_configuration_type) =
  assoc_to_yojson
    [
      ("LogLevel", Some (log_level_to_yojson x.log_level));
      ("EventSource", Some (event_source_name_to_yojson x.event_source));
      ( "CloudWatchLogsConfiguration",
        option_to_yojson cloud_watch_logs_configuration_type_to_yojson
          x.cloud_watch_logs_configuration );
      ("S3Configuration", option_to_yojson s3_configuration_type_to_yojson x.s3_configuration);
      ( "FirehoseConfiguration",
        option_to_yojson firehose_configuration_type_to_yojson x.firehose_configuration );
    ]

let log_configuration_list_type_to_yojson tree =
  list_to_yojson log_configuration_type_to_yojson tree

let log_delivery_configuration_type_to_yojson (x : log_delivery_configuration_type) =
  assoc_to_yojson
    [
      ("UserPoolId", Some (user_pool_id_type_to_yojson x.user_pool_id));
      ("LogConfigurations", Some (log_configuration_list_type_to_yojson x.log_configurations));
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
      ("UserPoolId", Some (user_pool_id_type_to_yojson x.user_pool_id));
      ("LogConfigurations", Some (log_configuration_list_type_to_yojson x.log_configurations));
    ]

let unsupported_token_type_exception_to_yojson (x : unsupported_token_type_exception) =
  assoc_to_yojson [ ("message", option_to_yojson message_type_to_yojson x.message) ]

let unsupported_operation_exception_to_yojson (x : unsupported_operation_exception) =
  assoc_to_yojson [ ("message", option_to_yojson message_type_to_yojson x.message) ]

let unauthorized_exception_to_yojson (x : unauthorized_exception) =
  assoc_to_yojson [ ("message", option_to_yojson message_type_to_yojson x.message) ]

let revoke_token_response_to_yojson = unit_to_yojson

let revoke_token_request_to_yojson (x : revoke_token_request) =
  assoc_to_yojson
    [
      ("Token", Some (token_model_type_to_yojson x.token));
      ("ClientId", Some (client_id_type_to_yojson x.client_id));
      ("ClientSecret", option_to_yojson client_secret_type_to_yojson x.client_secret);
    ]

let password_history_policy_violation_exception_to_yojson
    (x : password_history_policy_violation_exception) =
  assoc_to_yojson [ ("message", option_to_yojson message_type_to_yojson x.message) ]

let mfa_method_not_found_exception_to_yojson (x : mfa_method_not_found_exception) =
  assoc_to_yojson [ ("message", option_to_yojson message_type_to_yojson x.message) ]

let new_device_metadata_type_to_yojson (x : new_device_metadata_type) =
  assoc_to_yojson
    [
      ("DeviceKey", option_to_yojson device_key_type_to_yojson x.device_key);
      ("DeviceGroupKey", option_to_yojson string_type_to_yojson x.device_group_key);
    ]

let authentication_result_type_to_yojson (x : authentication_result_type) =
  assoc_to_yojson
    [
      ("AccessToken", option_to_yojson token_model_type_to_yojson x.access_token);
      ("ExpiresIn", option_to_yojson integer_type_to_yojson x.expires_in);
      ("TokenType", option_to_yojson string_type_to_yojson x.token_type);
      ("RefreshToken", option_to_yojson token_model_type_to_yojson x.refresh_token);
      ("IdToken", option_to_yojson token_model_type_to_yojson x.id_token);
      ( "NewDeviceMetadata",
        option_to_yojson new_device_metadata_type_to_yojson x.new_device_metadata );
    ]

let challenge_parameters_type_to_yojson tree =
  map_to_yojson string_type_to_yojson string_type_to_yojson tree

let challenge_name_type_to_yojson (x : challenge_name_type) =
  match x with
  | SMS_MFA -> `String "SMS_MFA"
  | EMAIL_OTP -> `String "EMAIL_OTP"
  | SOFTWARE_TOKEN_MFA -> `String "SOFTWARE_TOKEN_MFA"
  | SELECT_MFA_TYPE -> `String "SELECT_MFA_TYPE"
  | MFA_SETUP -> `String "MFA_SETUP"
  | PASSWORD_VERIFIER -> `String "PASSWORD_VERIFIER"
  | CUSTOM_CHALLENGE -> `String "CUSTOM_CHALLENGE"
  | SELECT_CHALLENGE -> `String "SELECT_CHALLENGE"
  | DEVICE_SRP_AUTH -> `String "DEVICE_SRP_AUTH"
  | DEVICE_PASSWORD_VERIFIER -> `String "DEVICE_PASSWORD_VERIFIER"
  | ADMIN_NO_SRP_AUTH -> `String "ADMIN_NO_SRP_AUTH"
  | NEW_PASSWORD_REQUIRED -> `String "NEW_PASSWORD_REQUIRED"
  | SMS_OTP -> `String "SMS_OTP"
  | PASSWORD -> `String "PASSWORD"
  | WEB_AUTHN -> `String "WEB_AUTHN"
  | PASSWORD_SRP -> `String "PASSWORD_SRP"

let respond_to_auth_challenge_response_to_yojson (x : respond_to_auth_challenge_response) =
  assoc_to_yojson
    [
      ("ChallengeName", option_to_yojson challenge_name_type_to_yojson x.challenge_name);
      ("Session", option_to_yojson session_type_to_yojson x.session);
      ( "ChallengeParameters",
        option_to_yojson challenge_parameters_type_to_yojson x.challenge_parameters );
      ( "AuthenticationResult",
        option_to_yojson authentication_result_type_to_yojson x.authentication_result );
    ]

let challenge_responses_type_to_yojson tree =
  map_to_yojson string_type_to_yojson string_type_to_yojson tree

let respond_to_auth_challenge_request_to_yojson (x : respond_to_auth_challenge_request) =
  assoc_to_yojson
    [
      ("ClientId", Some (client_id_type_to_yojson x.client_id));
      ("ChallengeName", Some (challenge_name_type_to_yojson x.challenge_name));
      ("Session", option_to_yojson session_type_to_yojson x.session);
      ( "ChallengeResponses",
        option_to_yojson challenge_responses_type_to_yojson x.challenge_responses );
      ("AnalyticsMetadata", option_to_yojson analytics_metadata_type_to_yojson x.analytics_metadata);
      ("UserContextData", option_to_yojson user_context_data_type_to_yojson x.user_context_data);
      ("ClientMetadata", option_to_yojson client_metadata_type_to_yojson x.client_metadata);
    ]

let resend_confirmation_code_response_to_yojson (x : resend_confirmation_code_response) =
  assoc_to_yojson
    [
      ( "CodeDeliveryDetails",
        option_to_yojson code_delivery_details_type_to_yojson x.code_delivery_details );
    ]

let resend_confirmation_code_request_to_yojson (x : resend_confirmation_code_request) =
  assoc_to_yojson
    [
      ("ClientId", Some (client_id_type_to_yojson x.client_id));
      ("SecretHash", option_to_yojson secret_hash_type_to_yojson x.secret_hash);
      ("UserContextData", option_to_yojson user_context_data_type_to_yojson x.user_context_data);
      ("Username", Some (username_type_to_yojson x.username));
      ("AnalyticsMetadata", option_to_yojson analytics_metadata_type_to_yojson x.analytics_metadata);
      ("ClientMetadata", option_to_yojson client_metadata_type_to_yojson x.client_metadata);
    ]

let pagination_key_to_yojson = string_to_yojson
let web_authn_authenticator_transport_type_to_yojson = string_to_yojson

let web_authn_authenticator_transports_list_to_yojson tree =
  list_to_yojson web_authn_authenticator_transport_type_to_yojson tree

let web_authn_authenticator_attachment_type_to_yojson = string_to_yojson

let web_authn_credential_description_to_yojson (x : web_authn_credential_description) =
  assoc_to_yojson
    [
      ("CredentialId", Some (string_type_to_yojson x.credential_id));
      ("FriendlyCredentialName", Some (string_type_to_yojson x.friendly_credential_name));
      ("RelyingPartyId", Some (string_type_to_yojson x.relying_party_id));
      ( "AuthenticatorAttachment",
        option_to_yojson web_authn_authenticator_attachment_type_to_yojson
          x.authenticator_attachment );
      ( "AuthenticatorTransports",
        Some (web_authn_authenticator_transports_list_to_yojson x.authenticator_transports) );
      ("CreatedAt", Some (date_type_to_yojson x.created_at));
    ]

let web_authn_credential_description_list_type_to_yojson tree =
  list_to_yojson web_authn_credential_description_to_yojson tree

let list_web_authn_credentials_response_to_yojson (x : list_web_authn_credentials_response) =
  assoc_to_yojson
    [
      ("Credentials", Some (web_authn_credential_description_list_type_to_yojson x.credentials));
      ("NextToken", option_to_yojson pagination_key_to_yojson x.next_token);
    ]

let web_authn_credentials_query_limit_type_to_yojson = int_to_yojson

let list_web_authn_credentials_request_to_yojson (x : list_web_authn_credentials_request) =
  assoc_to_yojson
    [
      ("AccessToken", Some (token_model_type_to_yojson x.access_token));
      ("NextToken", option_to_yojson pagination_key_to_yojson x.next_token);
      ("MaxResults", option_to_yojson web_authn_credentials_query_limit_type_to_yojson x.max_results);
    ]

let user_status_type_to_yojson (x : user_status_type) =
  match x with
  | UNCONFIRMED -> `String "UNCONFIRMED"
  | CONFIRMED -> `String "CONFIRMED"
  | ARCHIVED -> `String "ARCHIVED"
  | COMPROMISED -> `String "COMPROMISED"
  | UNKNOWN -> `String "UNKNOWN"
  | RESET_REQUIRED -> `String "RESET_REQUIRED"
  | FORCE_CHANGE_PASSWORD -> `String "FORCE_CHANGE_PASSWORD"
  | EXTERNAL_PROVIDER -> `String "EXTERNAL_PROVIDER"

let user_type_to_yojson (x : user_type) =
  assoc_to_yojson
    [
      ("Username", option_to_yojson username_type_to_yojson x.username);
      ("Attributes", option_to_yojson attribute_list_type_to_yojson x.attributes);
      ("UserCreateDate", option_to_yojson date_type_to_yojson x.user_create_date);
      ("UserLastModifiedDate", option_to_yojson date_type_to_yojson x.user_last_modified_date);
      ("Enabled", option_to_yojson boolean_type_to_yojson x.enabled);
      ("UserStatus", option_to_yojson user_status_type_to_yojson x.user_status);
      ("MFAOptions", option_to_yojson mfa_option_list_type_to_yojson x.mfa_options);
    ]

let users_list_type_to_yojson tree = list_to_yojson user_type_to_yojson tree

let list_users_in_group_response_to_yojson (x : list_users_in_group_response) =
  assoc_to_yojson
    [
      ("Users", option_to_yojson users_list_type_to_yojson x.users);
      ("NextToken", option_to_yojson pagination_key_to_yojson x.next_token);
    ]

let query_limit_type_to_yojson = int_to_yojson

let list_users_in_group_request_to_yojson (x : list_users_in_group_request) =
  assoc_to_yojson
    [
      ("UserPoolId", Some (user_pool_id_type_to_yojson x.user_pool_id));
      ("GroupName", Some (group_name_type_to_yojson x.group_name));
      ("Limit", option_to_yojson query_limit_type_to_yojson x.limit);
      ("NextToken", option_to_yojson pagination_key_to_yojson x.next_token);
    ]

let search_pagination_token_type_to_yojson = string_to_yojson

let list_users_response_to_yojson (x : list_users_response) =
  assoc_to_yojson
    [
      ("Users", option_to_yojson users_list_type_to_yojson x.users);
      ("PaginationToken", option_to_yojson search_pagination_token_type_to_yojson x.pagination_token);
    ]

let user_filter_type_to_yojson = string_to_yojson

let searched_attribute_names_list_type_to_yojson tree =
  list_to_yojson attribute_name_type_to_yojson tree

let list_users_request_to_yojson (x : list_users_request) =
  assoc_to_yojson
    [
      ("UserPoolId", Some (user_pool_id_type_to_yojson x.user_pool_id));
      ( "AttributesToGet",
        option_to_yojson searched_attribute_names_list_type_to_yojson x.attributes_to_get );
      ("Limit", option_to_yojson query_limit_type_to_yojson x.limit);
      ("PaginationToken", option_to_yojson search_pagination_token_type_to_yojson x.pagination_token);
      ("Filter", option_to_yojson user_filter_type_to_yojson x.filter);
    ]

let pagination_key_type_to_yojson = string_to_yojson
let replica_regions_type_to_yojson tree = list_to_yojson string_type_to_yojson tree

let status_type_to_yojson (x : status_type) =
  match x with Enabled -> `String "Enabled" | Disabled -> `String "Disabled"

let user_pool_description_type_to_yojson (x : user_pool_description_type) =
  assoc_to_yojson
    [
      ("Id", option_to_yojson user_pool_id_type_to_yojson x.id);
      ("Name", option_to_yojson user_pool_name_type_to_yojson x.name);
      ("LambdaConfig", option_to_yojson lambda_config_type_to_yojson x.lambda_config);
      ("Status", option_to_yojson status_type_to_yojson x.status);
      ("LastModifiedDate", option_to_yojson date_type_to_yojson x.last_modified_date);
      ("CreationDate", option_to_yojson date_type_to_yojson x.creation_date);
      ("ReplicaRegions", option_to_yojson replica_regions_type_to_yojson x.replica_regions);
    ]

let user_pool_list_type_to_yojson tree = list_to_yojson user_pool_description_type_to_yojson tree

let list_user_pools_response_to_yojson (x : list_user_pools_response) =
  assoc_to_yojson
    [
      ("UserPools", option_to_yojson user_pool_list_type_to_yojson x.user_pools);
      ("NextToken", option_to_yojson pagination_key_type_to_yojson x.next_token);
    ]

let pool_query_limit_type_to_yojson = int_to_yojson

let list_user_pools_request_to_yojson (x : list_user_pools_request) =
  assoc_to_yojson
    [
      ("NextToken", option_to_yojson pagination_key_type_to_yojson x.next_token);
      ("MaxResults", Some (pool_query_limit_type_to_yojson x.max_results));
    ]

let user_pool_replica_list_type_to_yojson tree =
  list_to_yojson user_pool_replica_type_to_yojson tree

let list_user_pool_replicas_response_to_yojson (x : list_user_pool_replicas_response) =
  assoc_to_yojson
    [
      ( "UserPoolReplicas",
        option_to_yojson user_pool_replica_list_type_to_yojson x.user_pool_replicas );
      ("NextToken", option_to_yojson pagination_key_type_to_yojson x.next_token);
    ]

let list_user_pool_replicas_request_to_yojson (x : list_user_pool_replicas_request) =
  assoc_to_yojson
    [
      ("UserPoolId", Some (user_pool_id_type_to_yojson x.user_pool_id));
      ("NextToken", option_to_yojson pagination_key_type_to_yojson x.next_token);
    ]

let internal_server_exception_to_yojson (x : internal_server_exception) =
  assoc_to_yojson [ ("message", option_to_yojson message_type_to_yojson x.message) ]

let client_secret_id_type_to_yojson = string_to_yojson

let client_secret_descriptor_type_to_yojson (x : client_secret_descriptor_type) =
  assoc_to_yojson
    [
      ("ClientSecretId", option_to_yojson client_secret_id_type_to_yojson x.client_secret_id);
      ("ClientSecretValue", option_to_yojson client_secret_type_to_yojson x.client_secret_value);
      ("ClientSecretCreateDate", option_to_yojson date_type_to_yojson x.client_secret_create_date);
    ]

let client_secret_descriptor_list_type_to_yojson tree =
  list_to_yojson client_secret_descriptor_type_to_yojson tree

let list_user_pool_client_secrets_response_to_yojson (x : list_user_pool_client_secrets_response) =
  assoc_to_yojson
    [
      ( "ClientSecrets",
        option_to_yojson client_secret_descriptor_list_type_to_yojson x.client_secrets );
      ("NextToken", option_to_yojson pagination_key_to_yojson x.next_token);
    ]

let list_user_pool_client_secrets_request_to_yojson (x : list_user_pool_client_secrets_request) =
  assoc_to_yojson
    [
      ("UserPoolId", Some (user_pool_id_type_to_yojson x.user_pool_id));
      ("ClientId", Some (client_id_type_to_yojson x.client_id));
      ("NextToken", option_to_yojson pagination_key_to_yojson x.next_token);
    ]

let user_pool_client_description_to_yojson (x : user_pool_client_description) =
  assoc_to_yojson
    [
      ("ClientId", option_to_yojson client_id_type_to_yojson x.client_id);
      ("UserPoolId", option_to_yojson user_pool_id_type_to_yojson x.user_pool_id);
      ("ClientName", option_to_yojson client_name_type_to_yojson x.client_name);
    ]

let user_pool_client_list_type_to_yojson tree =
  list_to_yojson user_pool_client_description_to_yojson tree

let list_user_pool_clients_response_to_yojson (x : list_user_pool_clients_response) =
  assoc_to_yojson
    [
      ("UserPoolClients", option_to_yojson user_pool_client_list_type_to_yojson x.user_pool_clients);
      ("NextToken", option_to_yojson pagination_key_to_yojson x.next_token);
    ]

let query_limit_to_yojson = int_to_yojson

let list_user_pool_clients_request_to_yojson (x : list_user_pool_clients_request) =
  assoc_to_yojson
    [
      ("UserPoolId", Some (user_pool_id_type_to_yojson x.user_pool_id));
      ("MaxResults", option_to_yojson query_limit_to_yojson x.max_results);
      ("NextToken", option_to_yojson pagination_key_to_yojson x.next_token);
    ]

let user_import_jobs_list_type_to_yojson tree = list_to_yojson user_import_job_type_to_yojson tree

let list_user_import_jobs_response_to_yojson (x : list_user_import_jobs_response) =
  assoc_to_yojson
    [
      ("UserImportJobs", option_to_yojson user_import_jobs_list_type_to_yojson x.user_import_jobs);
      ("PaginationToken", option_to_yojson pagination_key_type_to_yojson x.pagination_token);
    ]

let list_user_import_jobs_request_to_yojson (x : list_user_import_jobs_request) =
  assoc_to_yojson
    [
      ("UserPoolId", Some (user_pool_id_type_to_yojson x.user_pool_id));
      ("MaxResults", Some (pool_query_limit_type_to_yojson x.max_results));
      ("PaginationToken", option_to_yojson pagination_key_type_to_yojson x.pagination_token);
    ]

let terms_description_type_to_yojson (x : terms_description_type) =
  assoc_to_yojson
    [
      ("TermsId", Some (terms_id_type_to_yojson x.terms_id));
      ("TermsName", Some (terms_name_type_to_yojson x.terms_name));
      ("Enforcement", Some (terms_enforcement_type_to_yojson x.enforcement));
      ("CreationDate", Some (date_type_to_yojson x.creation_date));
      ("LastModifiedDate", Some (date_type_to_yojson x.last_modified_date));
    ]

let terms_description_list_type_to_yojson tree =
  list_to_yojson terms_description_type_to_yojson tree

let list_terms_response_to_yojson (x : list_terms_response) =
  assoc_to_yojson
    [
      ("Terms", Some (terms_description_list_type_to_yojson x.terms));
      ("NextToken", option_to_yojson string_type_to_yojson x.next_token);
    ]

let list_terms_request_max_results_integer_to_yojson = int_to_yojson

let list_terms_request_to_yojson (x : list_terms_request) =
  assoc_to_yojson
    [
      ("UserPoolId", Some (user_pool_id_type_to_yojson x.user_pool_id));
      ("MaxResults", option_to_yojson list_terms_request_max_results_integer_to_yojson x.max_results);
      ("NextToken", option_to_yojson string_type_to_yojson x.next_token);
    ]

let list_tags_for_resource_response_to_yojson (x : list_tags_for_resource_response) =
  assoc_to_yojson [ ("Tags", option_to_yojson user_pool_tags_type_to_yojson x.tags) ]

let list_tags_for_resource_request_to_yojson (x : list_tags_for_resource_request) =
  assoc_to_yojson [ ("ResourceArn", Some (arn_type_to_yojson x.resource_arn)) ]

let resource_servers_list_type_to_yojson tree = list_to_yojson resource_server_type_to_yojson tree

let list_resource_servers_response_to_yojson (x : list_resource_servers_response) =
  assoc_to_yojson
    [
      ("ResourceServers", Some (resource_servers_list_type_to_yojson x.resource_servers));
      ("NextToken", option_to_yojson pagination_key_type_to_yojson x.next_token);
    ]

let list_resource_servers_limit_type_to_yojson = int_to_yojson

let list_resource_servers_request_to_yojson (x : list_resource_servers_request) =
  assoc_to_yojson
    [
      ("UserPoolId", Some (user_pool_id_type_to_yojson x.user_pool_id));
      ("MaxResults", option_to_yojson list_resource_servers_limit_type_to_yojson x.max_results);
      ("NextToken", option_to_yojson pagination_key_type_to_yojson x.next_token);
    ]

let provider_description_to_yojson (x : provider_description) =
  assoc_to_yojson
    [
      ("ProviderName", option_to_yojson provider_name_type_to_yojson x.provider_name);
      ("ProviderType", option_to_yojson identity_provider_type_type_to_yojson x.provider_type);
      ("LastModifiedDate", option_to_yojson date_type_to_yojson x.last_modified_date);
      ("CreationDate", option_to_yojson date_type_to_yojson x.creation_date);
    ]

let providers_list_type_to_yojson tree = list_to_yojson provider_description_to_yojson tree

let list_identity_providers_response_to_yojson (x : list_identity_providers_response) =
  assoc_to_yojson
    [
      ("Providers", Some (providers_list_type_to_yojson x.providers));
      ("NextToken", option_to_yojson pagination_key_type_to_yojson x.next_token);
    ]

let list_providers_limit_type_to_yojson = int_to_yojson

let list_identity_providers_request_to_yojson (x : list_identity_providers_request) =
  assoc_to_yojson
    [
      ("UserPoolId", Some (user_pool_id_type_to_yojson x.user_pool_id));
      ("MaxResults", option_to_yojson list_providers_limit_type_to_yojson x.max_results);
      ("NextToken", option_to_yojson pagination_key_type_to_yojson x.next_token);
    ]

let group_list_type_to_yojson tree = list_to_yojson group_type_to_yojson tree

let list_groups_response_to_yojson (x : list_groups_response) =
  assoc_to_yojson
    [
      ("Groups", option_to_yojson group_list_type_to_yojson x.groups);
      ("NextToken", option_to_yojson pagination_key_to_yojson x.next_token);
    ]

let list_groups_request_to_yojson (x : list_groups_request) =
  assoc_to_yojson
    [
      ("UserPoolId", Some (user_pool_id_type_to_yojson x.user_pool_id));
      ("Limit", option_to_yojson query_limit_type_to_yojson x.limit);
      ("NextToken", option_to_yojson pagination_key_to_yojson x.next_token);
    ]

let device_type_to_yojson (x : device_type) =
  assoc_to_yojson
    [
      ("DeviceKey", option_to_yojson device_key_type_to_yojson x.device_key);
      ("DeviceAttributes", option_to_yojson attribute_list_type_to_yojson x.device_attributes);
      ("DeviceCreateDate", option_to_yojson date_type_to_yojson x.device_create_date);
      ("DeviceLastModifiedDate", option_to_yojson date_type_to_yojson x.device_last_modified_date);
      ( "DeviceLastAuthenticatedDate",
        option_to_yojson date_type_to_yojson x.device_last_authenticated_date );
    ]

let device_list_type_to_yojson tree = list_to_yojson device_type_to_yojson tree

let list_devices_response_to_yojson (x : list_devices_response) =
  assoc_to_yojson
    [
      ("Devices", option_to_yojson device_list_type_to_yojson x.devices);
      ("PaginationToken", option_to_yojson search_pagination_token_type_to_yojson x.pagination_token);
    ]

let list_devices_request_to_yojson (x : list_devices_request) =
  assoc_to_yojson
    [
      ("AccessToken", Some (token_model_type_to_yojson x.access_token));
      ("Limit", option_to_yojson query_limit_type_to_yojson x.limit);
      ("PaginationToken", option_to_yojson search_pagination_token_type_to_yojson x.pagination_token);
    ]

let available_challenge_list_type_to_yojson tree = list_to_yojson challenge_name_type_to_yojson tree

let initiate_auth_response_to_yojson (x : initiate_auth_response) =
  assoc_to_yojson
    [
      ("ChallengeName", option_to_yojson challenge_name_type_to_yojson x.challenge_name);
      ("Session", option_to_yojson session_type_to_yojson x.session);
      ( "ChallengeParameters",
        option_to_yojson challenge_parameters_type_to_yojson x.challenge_parameters );
      ( "AuthenticationResult",
        option_to_yojson authentication_result_type_to_yojson x.authentication_result );
      ( "AvailableChallenges",
        option_to_yojson available_challenge_list_type_to_yojson x.available_challenges );
    ]

let auth_parameters_type_to_yojson tree =
  map_to_yojson string_type_to_yojson string_type_to_yojson tree

let auth_flow_type_to_yojson (x : auth_flow_type) =
  match x with
  | USER_SRP_AUTH -> `String "USER_SRP_AUTH"
  | REFRESH_TOKEN_AUTH -> `String "REFRESH_TOKEN_AUTH"
  | REFRESH_TOKEN -> `String "REFRESH_TOKEN"
  | CUSTOM_AUTH -> `String "CUSTOM_AUTH"
  | ADMIN_NO_SRP_AUTH -> `String "ADMIN_NO_SRP_AUTH"
  | USER_PASSWORD_AUTH -> `String "USER_PASSWORD_AUTH"
  | ADMIN_USER_PASSWORD_AUTH -> `String "ADMIN_USER_PASSWORD_AUTH"
  | USER_AUTH -> `String "USER_AUTH"

let initiate_auth_request_to_yojson (x : initiate_auth_request) =
  assoc_to_yojson
    [
      ("AuthFlow", Some (auth_flow_type_to_yojson x.auth_flow));
      ("AuthParameters", option_to_yojson auth_parameters_type_to_yojson x.auth_parameters);
      ("ClientMetadata", option_to_yojson client_metadata_type_to_yojson x.client_metadata);
      ("ClientId", Some (client_id_type_to_yojson x.client_id));
      ("AnalyticsMetadata", option_to_yojson analytics_metadata_type_to_yojson x.analytics_metadata);
      ("UserContextData", option_to_yojson user_context_data_type_to_yojson x.user_context_data);
      ("Session", option_to_yojson session_type_to_yojson x.session);
    ]

let global_sign_out_response_to_yojson = unit_to_yojson

let global_sign_out_request_to_yojson (x : global_sign_out_request) =
  assoc_to_yojson [ ("AccessToken", Some (token_model_type_to_yojson x.access_token)) ]

let get_user_pool_mfa_config_response_to_yojson (x : get_user_pool_mfa_config_response) =
  assoc_to_yojson
    [
      ("SmsMfaConfiguration", option_to_yojson sms_mfa_config_type_to_yojson x.sms_mfa_configuration);
      ( "SoftwareTokenMfaConfiguration",
        option_to_yojson software_token_mfa_config_type_to_yojson x.software_token_mfa_configuration
      );
      ( "EmailMfaConfiguration",
        option_to_yojson email_mfa_config_type_to_yojson x.email_mfa_configuration );
      ("MfaConfiguration", option_to_yojson user_pool_mfa_type_to_yojson x.mfa_configuration);
      ( "WebAuthnConfiguration",
        option_to_yojson web_authn_configuration_type_to_yojson x.web_authn_configuration );
    ]

let get_user_pool_mfa_config_request_to_yojson (x : get_user_pool_mfa_config_request) =
  assoc_to_yojson [ ("UserPoolId", Some (user_pool_id_type_to_yojson x.user_pool_id)) ]

let configured_user_auth_factors_list_type_to_yojson tree =
  list_to_yojson auth_factor_type_to_yojson tree

let user_mfa_setting_list_type_to_yojson tree = list_to_yojson string_type_to_yojson tree

let get_user_auth_factors_response_to_yojson (x : get_user_auth_factors_response) =
  assoc_to_yojson
    [
      ("Username", Some (username_type_to_yojson x.username));
      ("PreferredMfaSetting", option_to_yojson string_type_to_yojson x.preferred_mfa_setting);
      ( "UserMFASettingList",
        option_to_yojson user_mfa_setting_list_type_to_yojson x.user_mfa_setting_list );
      ( "ConfiguredUserAuthFactors",
        option_to_yojson configured_user_auth_factors_list_type_to_yojson
          x.configured_user_auth_factors );
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
      ("AccessToken", Some (token_model_type_to_yojson x.access_token));
      ("AttributeName", Some (attribute_name_type_to_yojson x.attribute_name));
      ("ClientMetadata", option_to_yojson client_metadata_type_to_yojson x.client_metadata);
    ]

let get_user_response_to_yojson (x : get_user_response) =
  assoc_to_yojson
    [
      ("Username", Some (username_type_to_yojson x.username));
      ("UserAttributes", Some (attribute_list_type_to_yojson x.user_attributes));
      ("MFAOptions", option_to_yojson mfa_option_list_type_to_yojson x.mfa_options);
      ("PreferredMfaSetting", option_to_yojson string_type_to_yojson x.preferred_mfa_setting);
      ( "UserMFASettingList",
        option_to_yojson user_mfa_setting_list_type_to_yojson x.user_mfa_setting_list );
    ]

let get_user_request_to_yojson (x : get_user_request) =
  assoc_to_yojson [ ("AccessToken", Some (token_model_type_to_yojson x.access_token)) ]

let get_ui_customization_response_to_yojson (x : get_ui_customization_response) =
  assoc_to_yojson [ ("UICustomization", Some (ui_customization_type_to_yojson x.ui_customization)) ]

let get_ui_customization_request_to_yojson (x : get_ui_customization_request) =
  assoc_to_yojson
    [
      ("UserPoolId", Some (user_pool_id_type_to_yojson x.user_pool_id));
      ("ClientId", option_to_yojson client_id_type_to_yojson x.client_id);
    ]

let refresh_token_reuse_exception_to_yojson (x : refresh_token_reuse_exception) =
  assoc_to_yojson [ ("message", option_to_yojson message_type_to_yojson x.message) ]

let get_tokens_from_refresh_token_response_to_yojson (x : get_tokens_from_refresh_token_response) =
  assoc_to_yojson
    [
      ( "AuthenticationResult",
        option_to_yojson authentication_result_type_to_yojson x.authentication_result );
    ]

let get_tokens_from_refresh_token_request_to_yojson (x : get_tokens_from_refresh_token_request) =
  assoc_to_yojson
    [
      ("RefreshToken", Some (token_model_type_to_yojson x.refresh_token));
      ("ClientId", Some (client_id_type_to_yojson x.client_id));
      ("ClientSecret", option_to_yojson client_secret_type_to_yojson x.client_secret);
      ("DeviceKey", option_to_yojson device_key_type_to_yojson x.device_key);
      ("ClientMetadata", option_to_yojson client_metadata_type_to_yojson x.client_metadata);
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
      ("UserPoolId", Some (user_pool_id_type_to_yojson x.user_pool_id));
      ("IdpIdentifier", Some (idp_identifier_type_to_yojson x.idp_identifier));
    ]

let get_group_response_to_yojson (x : get_group_response) =
  assoc_to_yojson [ ("Group", option_to_yojson group_type_to_yojson x.group) ]

let get_group_request_to_yojson (x : get_group_request) =
  assoc_to_yojson
    [
      ("GroupName", Some (group_name_type_to_yojson x.group_name));
      ("UserPoolId", Some (user_pool_id_type_to_yojson x.user_pool_id));
    ]

let get_device_response_to_yojson (x : get_device_response) =
  assoc_to_yojson [ ("Device", Some (device_type_to_yojson x.device)) ]

let get_device_request_to_yojson (x : get_device_request) =
  assoc_to_yojson
    [
      ("DeviceKey", Some (device_key_type_to_yojson x.device_key));
      ("AccessToken", option_to_yojson token_model_type_to_yojson x.access_token);
    ]

let list_of_string_types_to_yojson tree = list_to_yojson string_type_to_yojson tree

let get_csv_header_response_to_yojson (x : get_csv_header_response) =
  assoc_to_yojson
    [
      ("UserPoolId", option_to_yojson user_pool_id_type_to_yojson x.user_pool_id);
      ("CSVHeader", option_to_yojson list_of_string_types_to_yojson x.csv_header);
    ]

let get_csv_header_request_to_yojson (x : get_csv_header_request) =
  assoc_to_yojson [ ("UserPoolId", Some (user_pool_id_type_to_yojson x.user_pool_id)) ]

let forgot_password_response_to_yojson (x : forgot_password_response) =
  assoc_to_yojson
    [
      ( "CodeDeliveryDetails",
        option_to_yojson code_delivery_details_type_to_yojson x.code_delivery_details );
    ]

let forgot_password_request_to_yojson (x : forgot_password_request) =
  assoc_to_yojson
    [
      ("ClientId", Some (client_id_type_to_yojson x.client_id));
      ("SecretHash", option_to_yojson secret_hash_type_to_yojson x.secret_hash);
      ("UserContextData", option_to_yojson user_context_data_type_to_yojson x.user_context_data);
      ("Username", Some (username_type_to_yojson x.username));
      ("AnalyticsMetadata", option_to_yojson analytics_metadata_type_to_yojson x.analytics_metadata);
      ("ClientMetadata", option_to_yojson client_metadata_type_to_yojson x.client_metadata);
    ]

let forget_device_request_to_yojson (x : forget_device_request) =
  assoc_to_yojson
    [
      ("AccessToken", option_to_yojson token_model_type_to_yojson x.access_token);
      ("DeviceKey", Some (device_key_type_to_yojson x.device_key));
    ]

let domain_status_type_to_yojson (x : domain_status_type) =
  match x with
  | CREATING -> `String "CREATING"
  | DELETING -> `String "DELETING"
  | UPDATING -> `String "UPDATING"
  | ACTIVE -> `String "ACTIVE"
  | FAILED -> `String "FAILED"

let domain_version_type_to_yojson = string_to_yojson
let s3_bucket_type_to_yojson = string_to_yojson

let domain_description_type_to_yojson (x : domain_description_type) =
  assoc_to_yojson
    [
      ("UserPoolId", option_to_yojson user_pool_id_type_to_yojson x.user_pool_id);
      ("AWSAccountId", option_to_yojson aws_account_id_type_to_yojson x.aws_account_id);
      ("Domain", option_to_yojson domain_type_to_yojson x.domain);
      ("S3Bucket", option_to_yojson s3_bucket_type_to_yojson x.s3_bucket);
      ("CloudFrontDistribution", option_to_yojson string_type_to_yojson x.cloud_front_distribution);
      ("Version", option_to_yojson domain_version_type_to_yojson x.version);
      ("Status", option_to_yojson domain_status_type_to_yojson x.status);
      ( "CustomDomainConfig",
        option_to_yojson custom_domain_config_type_to_yojson x.custom_domain_config );
      ( "ManagedLoginVersion",
        option_to_yojson wrapped_integer_type_to_yojson x.managed_login_version );
      ("Routing", option_to_yojson routing_type_to_yojson x.routing);
    ]

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
      ("UserPoolId", Some (user_pool_id_type_to_yojson x.user_pool_id));
      ("ClientId", Some (client_id_type_to_yojson x.client_id));
    ]

let username_configuration_type_to_yojson (x : username_configuration_type) =
  assoc_to_yojson [ ("CaseSensitive", Some (wrapped_boolean_type_to_yojson x.case_sensitive)) ]

let username_attribute_type_to_yojson (x : username_attribute_type) =
  match x with PHONE_NUMBER -> `String "phone_number" | EMAIL -> `String "email"

let username_attributes_list_type_to_yojson tree =
  list_to_yojson username_attribute_type_to_yojson tree

let alias_attribute_type_to_yojson (x : alias_attribute_type) =
  match x with
  | PHONE_NUMBER -> `String "phone_number"
  | EMAIL -> `String "email"
  | PREFERRED_USERNAME -> `String "preferred_username"

let alias_attributes_list_type_to_yojson tree = list_to_yojson alias_attribute_type_to_yojson tree

let string_attribute_constraints_type_to_yojson (x : string_attribute_constraints_type) =
  assoc_to_yojson
    [
      ("MinLength", option_to_yojson string_type_to_yojson x.min_length);
      ("MaxLength", option_to_yojson string_type_to_yojson x.max_length);
    ]

let number_attribute_constraints_type_to_yojson (x : number_attribute_constraints_type) =
  assoc_to_yojson
    [
      ("MinValue", option_to_yojson string_type_to_yojson x.min_value);
      ("MaxValue", option_to_yojson string_type_to_yojson x.max_value);
    ]

let attribute_data_type_to_yojson (x : attribute_data_type) =
  match x with
  | STRING -> `String "String"
  | NUMBER -> `String "Number"
  | DATETIME -> `String "DateTime"
  | BOOLEAN -> `String "Boolean"

let custom_attribute_name_type_to_yojson = string_to_yojson

let schema_attribute_type_to_yojson (x : schema_attribute_type) =
  assoc_to_yojson
    [
      ("Name", option_to_yojson custom_attribute_name_type_to_yojson x.name);
      ("AttributeDataType", option_to_yojson attribute_data_type_to_yojson x.attribute_data_type);
      ("DeveloperOnlyAttribute", option_to_yojson boolean_type_to_yojson x.developer_only_attribute);
      ("Mutable", option_to_yojson boolean_type_to_yojson x.\#mutable);
      ("Required", option_to_yojson boolean_type_to_yojson x.required);
      ( "NumberAttributeConstraints",
        option_to_yojson number_attribute_constraints_type_to_yojson x.number_attribute_constraints
      );
      ( "StringAttributeConstraints",
        option_to_yojson string_attribute_constraints_type_to_yojson x.string_attribute_constraints
      );
    ]

let schema_attributes_list_type_to_yojson tree = list_to_yojson schema_attribute_type_to_yojson tree

let user_pool_type_to_yojson (x : user_pool_type) =
  assoc_to_yojson
    [
      ("Id", option_to_yojson user_pool_id_type_to_yojson x.id);
      ("Name", option_to_yojson user_pool_name_type_to_yojson x.name);
      ("Policies", option_to_yojson user_pool_policy_type_to_yojson x.policies);
      ( "DeletionProtection",
        option_to_yojson deletion_protection_type_to_yojson x.deletion_protection );
      ("LambdaConfig", option_to_yojson lambda_config_type_to_yojson x.lambda_config);
      ("Status", option_to_yojson status_type_to_yojson x.status);
      ("LastModifiedDate", option_to_yojson date_type_to_yojson x.last_modified_date);
      ("CreationDate", option_to_yojson date_type_to_yojson x.creation_date);
      ( "SchemaAttributes",
        option_to_yojson schema_attributes_list_type_to_yojson x.schema_attributes );
      ( "AutoVerifiedAttributes",
        option_to_yojson verified_attributes_list_type_to_yojson x.auto_verified_attributes );
      ("AliasAttributes", option_to_yojson alias_attributes_list_type_to_yojson x.alias_attributes);
      ( "UsernameAttributes",
        option_to_yojson username_attributes_list_type_to_yojson x.username_attributes );
      ( "SmsVerificationMessage",
        option_to_yojson sms_verification_message_type_to_yojson x.sms_verification_message );
      ( "EmailVerificationMessage",
        option_to_yojson email_verification_message_type_to_yojson x.email_verification_message );
      ( "EmailVerificationSubject",
        option_to_yojson email_verification_subject_type_to_yojson x.email_verification_subject );
      ( "VerificationMessageTemplate",
        option_to_yojson verification_message_template_type_to_yojson
          x.verification_message_template );
      ( "SmsAuthenticationMessage",
        option_to_yojson sms_verification_message_type_to_yojson x.sms_authentication_message );
      ( "UserAttributeUpdateSettings",
        option_to_yojson user_attribute_update_settings_type_to_yojson
          x.user_attribute_update_settings );
      ("MfaConfiguration", option_to_yojson user_pool_mfa_type_to_yojson x.mfa_configuration);
      ( "DeviceConfiguration",
        option_to_yojson device_configuration_type_to_yojson x.device_configuration );
      ("EstimatedNumberOfUsers", option_to_yojson integer_type_to_yojson x.estimated_number_of_users);
      ( "EmailConfiguration",
        option_to_yojson email_configuration_type_to_yojson x.email_configuration );
      ("SmsConfiguration", option_to_yojson sms_configuration_type_to_yojson x.sms_configuration);
      ("UserPoolTags", option_to_yojson user_pool_tags_type_to_yojson x.user_pool_tags);
      ("SmsConfigurationFailure", option_to_yojson string_type_to_yojson x.sms_configuration_failure);
      ( "EmailConfigurationFailure",
        option_to_yojson string_type_to_yojson x.email_configuration_failure );
      ("Domain", option_to_yojson domain_type_to_yojson x.domain);
      ("CustomDomain", option_to_yojson domain_type_to_yojson x.custom_domain);
      ( "AdminCreateUserConfig",
        option_to_yojson admin_create_user_config_type_to_yojson x.admin_create_user_config );
      ("UserPoolAddOns", option_to_yojson user_pool_add_ons_type_to_yojson x.user_pool_add_ons);
      ( "UsernameConfiguration",
        option_to_yojson username_configuration_type_to_yojson x.username_configuration );
      ("Arn", option_to_yojson arn_type_to_yojson x.arn);
      ( "AccountRecoverySetting",
        option_to_yojson account_recovery_setting_type_to_yojson x.account_recovery_setting );
      ("UserPoolTier", option_to_yojson user_pool_tier_type_to_yojson x.user_pool_tier);
      ("KeyConfiguration", option_to_yojson key_configuration_type_to_yojson x.key_configuration);
      ( "IssuerConfiguration",
        option_to_yojson issuer_configuration_type_to_yojson x.issuer_configuration );
    ]

let describe_user_pool_response_to_yojson (x : describe_user_pool_response) =
  assoc_to_yojson [ ("UserPool", option_to_yojson user_pool_type_to_yojson x.user_pool) ]

let describe_user_pool_request_to_yojson (x : describe_user_pool_request) =
  assoc_to_yojson [ ("UserPoolId", Some (user_pool_id_type_to_yojson x.user_pool_id)) ]

let describe_user_import_job_response_to_yojson (x : describe_user_import_job_response) =
  assoc_to_yojson
    [ ("UserImportJob", option_to_yojson user_import_job_type_to_yojson x.user_import_job) ]

let describe_user_import_job_request_to_yojson (x : describe_user_import_job_request) =
  assoc_to_yojson
    [
      ("UserPoolId", Some (user_pool_id_type_to_yojson x.user_pool_id));
      ("JobId", Some (user_import_job_id_type_to_yojson x.job_id));
    ]

let describe_terms_response_to_yojson (x : describe_terms_response) =
  assoc_to_yojson [ ("Terms", option_to_yojson terms_type_to_yojson x.terms) ]

let describe_terms_request_to_yojson (x : describe_terms_request) =
  assoc_to_yojson
    [
      ("TermsId", Some (terms_id_type_to_yojson x.terms_id));
      ("UserPoolId", Some (user_pool_id_type_to_yojson x.user_pool_id));
    ]

let describe_risk_configuration_response_to_yojson (x : describe_risk_configuration_response) =
  assoc_to_yojson
    [ ("RiskConfiguration", Some (risk_configuration_type_to_yojson x.risk_configuration)) ]

let describe_risk_configuration_request_to_yojson (x : describe_risk_configuration_request) =
  assoc_to_yojson
    [
      ("UserPoolId", Some (user_pool_id_type_to_yojson x.user_pool_id));
      ("ClientId", option_to_yojson client_id_type_to_yojson x.client_id);
    ]

let describe_resource_server_response_to_yojson (x : describe_resource_server_response) =
  assoc_to_yojson [ ("ResourceServer", Some (resource_server_type_to_yojson x.resource_server)) ]

let describe_resource_server_request_to_yojson (x : describe_resource_server_request) =
  assoc_to_yojson
    [
      ("UserPoolId", Some (user_pool_id_type_to_yojson x.user_pool_id));
      ("Identifier", Some (resource_server_identifier_type_to_yojson x.identifier));
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
      ("UserPoolId", Some (user_pool_id_type_to_yojson x.user_pool_id));
      ("ClientId", Some (client_id_type_to_yojson x.client_id));
      ("ReturnMergedResources", option_to_yojson boolean_type_to_yojson x.return_merged_resources);
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
      ("UserPoolId", Some (user_pool_id_type_to_yojson x.user_pool_id));
      ( "ManagedLoginBrandingId",
        Some (managed_login_branding_id_type_to_yojson x.managed_login_branding_id) );
      ("ReturnMergedResources", option_to_yojson boolean_type_to_yojson x.return_merged_resources);
    ]

let describe_identity_provider_response_to_yojson (x : describe_identity_provider_response) =
  assoc_to_yojson
    [ ("IdentityProvider", Some (identity_provider_type_to_yojson x.identity_provider)) ]

let describe_identity_provider_request_to_yojson (x : describe_identity_provider_request) =
  assoc_to_yojson
    [
      ("UserPoolId", Some (user_pool_id_type_to_yojson x.user_pool_id));
      ("ProviderName", Some (provider_name_type_to_yojson x.provider_name));
    ]

let delete_web_authn_credential_response_to_yojson = unit_to_yojson

let delete_web_authn_credential_request_to_yojson (x : delete_web_authn_credential_request) =
  assoc_to_yojson
    [
      ("AccessToken", Some (token_model_type_to_yojson x.access_token));
      ("CredentialId", Some (string_type_to_yojson x.credential_id));
    ]

let delete_user_pool_replica_response_to_yojson (x : delete_user_pool_replica_response) =
  assoc_to_yojson
    [ ("UserPoolReplica", option_to_yojson user_pool_replica_type_to_yojson x.user_pool_replica) ]

let delete_user_pool_replica_request_to_yojson (x : delete_user_pool_replica_request) =
  assoc_to_yojson
    [
      ("UserPoolId", Some (user_pool_id_type_to_yojson x.user_pool_id));
      ("RegionName", Some (region_name_type_to_yojson x.region_name));
    ]

let delete_user_pool_domain_response_to_yojson = unit_to_yojson

let delete_user_pool_domain_request_to_yojson (x : delete_user_pool_domain_request) =
  assoc_to_yojson
    [
      ("Domain", Some (domain_type_to_yojson x.domain));
      ("UserPoolId", Some (user_pool_id_type_to_yojson x.user_pool_id));
    ]

let delete_user_pool_client_secret_response_to_yojson = unit_to_yojson

let delete_user_pool_client_secret_request_to_yojson (x : delete_user_pool_client_secret_request) =
  assoc_to_yojson
    [
      ("UserPoolId", Some (user_pool_id_type_to_yojson x.user_pool_id));
      ("ClientId", Some (client_id_type_to_yojson x.client_id));
      ("ClientSecretId", Some (client_secret_id_type_to_yojson x.client_secret_id));
    ]

let delete_user_pool_client_request_to_yojson (x : delete_user_pool_client_request) =
  assoc_to_yojson
    [
      ("UserPoolId", Some (user_pool_id_type_to_yojson x.user_pool_id));
      ("ClientId", Some (client_id_type_to_yojson x.client_id));
    ]

let delete_user_pool_request_to_yojson (x : delete_user_pool_request) =
  assoc_to_yojson [ ("UserPoolId", Some (user_pool_id_type_to_yojson x.user_pool_id)) ]

let delete_user_attributes_response_to_yojson = unit_to_yojson
let attribute_name_list_type_to_yojson tree = list_to_yojson attribute_name_type_to_yojson tree

let delete_user_attributes_request_to_yojson (x : delete_user_attributes_request) =
  assoc_to_yojson
    [
      ("UserAttributeNames", Some (attribute_name_list_type_to_yojson x.user_attribute_names));
      ("AccessToken", Some (token_model_type_to_yojson x.access_token));
    ]

let delete_user_request_to_yojson (x : delete_user_request) =
  assoc_to_yojson [ ("AccessToken", Some (token_model_type_to_yojson x.access_token)) ]

let delete_terms_request_to_yojson (x : delete_terms_request) =
  assoc_to_yojson
    [
      ("TermsId", Some (terms_id_type_to_yojson x.terms_id));
      ("UserPoolId", Some (user_pool_id_type_to_yojson x.user_pool_id));
    ]

let delete_resource_server_request_to_yojson (x : delete_resource_server_request) =
  assoc_to_yojson
    [
      ("UserPoolId", Some (user_pool_id_type_to_yojson x.user_pool_id));
      ("Identifier", Some (resource_server_identifier_type_to_yojson x.identifier));
    ]

let delete_managed_login_branding_request_to_yojson (x : delete_managed_login_branding_request) =
  assoc_to_yojson
    [
      ( "ManagedLoginBrandingId",
        Some (managed_login_branding_id_type_to_yojson x.managed_login_branding_id) );
      ("UserPoolId", Some (user_pool_id_type_to_yojson x.user_pool_id));
    ]

let delete_identity_provider_request_to_yojson (x : delete_identity_provider_request) =
  assoc_to_yojson
    [
      ("UserPoolId", Some (user_pool_id_type_to_yojson x.user_pool_id));
      ("ProviderName", Some (provider_name_type_to_yojson x.provider_name));
    ]

let delete_group_request_to_yojson (x : delete_group_request) =
  assoc_to_yojson
    [
      ("GroupName", Some (group_name_type_to_yojson x.group_name));
      ("UserPoolId", Some (user_pool_id_type_to_yojson x.user_pool_id));
    ]

let create_user_pool_replica_response_to_yojson (x : create_user_pool_replica_response) =
  assoc_to_yojson
    [ ("UserPoolReplica", option_to_yojson user_pool_replica_type_to_yojson x.user_pool_replica) ]

let create_user_pool_replica_request_to_yojson (x : create_user_pool_replica_request) =
  assoc_to_yojson
    [
      ("UserPoolId", Some (user_pool_id_type_to_yojson x.user_pool_id));
      ("RegionName", Some (region_name_type_to_yojson x.region_name));
      ("UserPoolTags", option_to_yojson user_pool_tags_type_to_yojson x.user_pool_tags);
    ]

let create_user_pool_domain_response_to_yojson (x : create_user_pool_domain_response) =
  assoc_to_yojson
    [
      ( "ManagedLoginVersion",
        option_to_yojson wrapped_integer_type_to_yojson x.managed_login_version );
      ("CloudFrontDomain", option_to_yojson domain_type_to_yojson x.cloud_front_domain);
      ("Routing", option_to_yojson routing_type_to_yojson x.routing);
    ]

let create_user_pool_domain_request_to_yojson (x : create_user_pool_domain_request) =
  assoc_to_yojson
    [
      ("Domain", Some (domain_type_to_yojson x.domain));
      ("UserPoolId", Some (user_pool_id_type_to_yojson x.user_pool_id));
      ( "ManagedLoginVersion",
        option_to_yojson wrapped_integer_type_to_yojson x.managed_login_version );
      ( "CustomDomainConfig",
        option_to_yojson custom_domain_config_type_to_yojson x.custom_domain_config );
      ("Routing", option_to_yojson routing_type_to_yojson x.routing);
    ]

let create_user_pool_client_response_to_yojson (x : create_user_pool_client_response) =
  assoc_to_yojson
    [ ("UserPoolClient", option_to_yojson user_pool_client_type_to_yojson x.user_pool_client) ]

let generate_secret_to_yojson = bool_to_yojson

let create_user_pool_client_request_to_yojson (x : create_user_pool_client_request) =
  assoc_to_yojson
    [
      ("UserPoolId", Some (user_pool_id_type_to_yojson x.user_pool_id));
      ("ClientName", Some (client_name_type_to_yojson x.client_name));
      ("GenerateSecret", option_to_yojson generate_secret_to_yojson x.generate_secret);
      ("ClientSecret", option_to_yojson client_secret_type_to_yojson x.client_secret);
      ( "RefreshTokenValidity",
        option_to_yojson refresh_token_validity_type_to_yojson x.refresh_token_validity );
      ( "AccessTokenValidity",
        option_to_yojson access_token_validity_type_to_yojson x.access_token_validity );
      ("IdTokenValidity", option_to_yojson id_token_validity_type_to_yojson x.id_token_validity);
      ( "TokenValidityUnits",
        option_to_yojson token_validity_units_type_to_yojson x.token_validity_units );
      ("ReadAttributes", option_to_yojson client_permission_list_type_to_yojson x.read_attributes);
      ("WriteAttributes", option_to_yojson client_permission_list_type_to_yojson x.write_attributes);
      ( "ExplicitAuthFlows",
        option_to_yojson explicit_auth_flows_list_type_to_yojson x.explicit_auth_flows );
      ( "SupportedIdentityProviders",
        option_to_yojson supported_identity_providers_list_type_to_yojson
          x.supported_identity_providers );
      ("CallbackURLs", option_to_yojson callback_ur_ls_list_type_to_yojson x.callback_ur_ls);
      ("LogoutURLs", option_to_yojson logout_ur_ls_list_type_to_yojson x.logout_ur_ls);
      ("DefaultRedirectURI", option_to_yojson redirect_url_type_to_yojson x.default_redirect_ur_i);
      ("AllowedOAuthFlows", option_to_yojson o_auth_flows_type_to_yojson x.allowed_o_auth_flows);
      ("AllowedOAuthScopes", option_to_yojson scope_list_type_to_yojson x.allowed_o_auth_scopes);
      ( "AllowedOAuthFlowsUserPoolClient",
        option_to_yojson boolean_type_to_yojson x.allowed_o_auth_flows_user_pool_client );
      ( "AnalyticsConfiguration",
        option_to_yojson analytics_configuration_type_to_yojson x.analytics_configuration );
      ( "PreventUserExistenceErrors",
        option_to_yojson prevent_user_existence_error_types_to_yojson
          x.prevent_user_existence_errors );
      ( "EnableTokenRevocation",
        option_to_yojson wrapped_boolean_type_to_yojson x.enable_token_revocation );
      ( "EnablePropagateAdditionalUserContextData",
        option_to_yojson wrapped_boolean_type_to_yojson
          x.enable_propagate_additional_user_context_data );
      ( "AuthSessionValidity",
        option_to_yojson auth_session_validity_type_to_yojson x.auth_session_validity );
      ( "RefreshTokenRotation",
        option_to_yojson refresh_token_rotation_type_to_yojson x.refresh_token_rotation );
    ]

let create_user_pool_response_to_yojson (x : create_user_pool_response) =
  assoc_to_yojson [ ("UserPool", option_to_yojson user_pool_type_to_yojson x.user_pool) ]

let create_user_pool_request_to_yojson (x : create_user_pool_request) =
  assoc_to_yojson
    [
      ("PoolName", Some (user_pool_name_type_to_yojson x.pool_name));
      ("Policies", option_to_yojson user_pool_policy_type_to_yojson x.policies);
      ( "DeletionProtection",
        option_to_yojson deletion_protection_type_to_yojson x.deletion_protection );
      ("LambdaConfig", option_to_yojson lambda_config_type_to_yojson x.lambda_config);
      ( "AutoVerifiedAttributes",
        option_to_yojson verified_attributes_list_type_to_yojson x.auto_verified_attributes );
      ("AliasAttributes", option_to_yojson alias_attributes_list_type_to_yojson x.alias_attributes);
      ( "UsernameAttributes",
        option_to_yojson username_attributes_list_type_to_yojson x.username_attributes );
      ( "SmsVerificationMessage",
        option_to_yojson sms_verification_message_type_to_yojson x.sms_verification_message );
      ( "EmailVerificationMessage",
        option_to_yojson email_verification_message_type_to_yojson x.email_verification_message );
      ( "EmailVerificationSubject",
        option_to_yojson email_verification_subject_type_to_yojson x.email_verification_subject );
      ( "VerificationMessageTemplate",
        option_to_yojson verification_message_template_type_to_yojson
          x.verification_message_template );
      ( "SmsAuthenticationMessage",
        option_to_yojson sms_verification_message_type_to_yojson x.sms_authentication_message );
      ("MfaConfiguration", option_to_yojson user_pool_mfa_type_to_yojson x.mfa_configuration);
      ( "UserAttributeUpdateSettings",
        option_to_yojson user_attribute_update_settings_type_to_yojson
          x.user_attribute_update_settings );
      ( "DeviceConfiguration",
        option_to_yojson device_configuration_type_to_yojson x.device_configuration );
      ( "EmailConfiguration",
        option_to_yojson email_configuration_type_to_yojson x.email_configuration );
      ("SmsConfiguration", option_to_yojson sms_configuration_type_to_yojson x.sms_configuration);
      ("UserPoolTags", option_to_yojson user_pool_tags_type_to_yojson x.user_pool_tags);
      ( "AdminCreateUserConfig",
        option_to_yojson admin_create_user_config_type_to_yojson x.admin_create_user_config );
      ("Schema", option_to_yojson schema_attributes_list_type_to_yojson x.schema);
      ("UserPoolAddOns", option_to_yojson user_pool_add_ons_type_to_yojson x.user_pool_add_ons);
      ( "UsernameConfiguration",
        option_to_yojson username_configuration_type_to_yojson x.username_configuration );
      ( "AccountRecoverySetting",
        option_to_yojson account_recovery_setting_type_to_yojson x.account_recovery_setting );
      ("UserPoolTier", option_to_yojson user_pool_tier_type_to_yojson x.user_pool_tier);
      ("KeyConfiguration", option_to_yojson key_configuration_type_to_yojson x.key_configuration);
      ( "IssuerConfiguration",
        option_to_yojson issuer_configuration_type_to_yojson x.issuer_configuration );
    ]

let create_user_import_job_response_to_yojson (x : create_user_import_job_response) =
  assoc_to_yojson
    [ ("UserImportJob", option_to_yojson user_import_job_type_to_yojson x.user_import_job) ]

let create_user_import_job_request_to_yojson (x : create_user_import_job_request) =
  assoc_to_yojson
    [
      ("JobName", Some (user_import_job_name_type_to_yojson x.job_name));
      ("UserPoolId", Some (user_pool_id_type_to_yojson x.user_pool_id));
      ("CloudWatchLogsRoleArn", Some (arn_type_to_yojson x.cloud_watch_logs_role_arn));
    ]

let create_terms_response_to_yojson (x : create_terms_response) =
  assoc_to_yojson [ ("Terms", option_to_yojson terms_type_to_yojson x.terms) ]

let create_terms_request_to_yojson (x : create_terms_request) =
  assoc_to_yojson
    [
      ("UserPoolId", Some (user_pool_id_type_to_yojson x.user_pool_id));
      ("ClientId", Some (client_id_type_to_yojson x.client_id));
      ("TermsName", Some (terms_name_type_to_yojson x.terms_name));
      ("TermsSource", Some (terms_source_type_to_yojson x.terms_source));
      ("Enforcement", Some (terms_enforcement_type_to_yojson x.enforcement));
      ("Links", option_to_yojson links_type_to_yojson x.links);
    ]

let create_resource_server_response_to_yojson (x : create_resource_server_response) =
  assoc_to_yojson [ ("ResourceServer", Some (resource_server_type_to_yojson x.resource_server)) ]

let create_resource_server_request_to_yojson (x : create_resource_server_request) =
  assoc_to_yojson
    [
      ("UserPoolId", Some (user_pool_id_type_to_yojson x.user_pool_id));
      ("Identifier", Some (resource_server_identifier_type_to_yojson x.identifier));
      ("Name", Some (resource_server_name_type_to_yojson x.name));
      ("Scopes", option_to_yojson resource_server_scope_list_type_to_yojson x.scopes);
    ]

let managed_login_branding_exists_exception_to_yojson (x : managed_login_branding_exists_exception)
    =
  assoc_to_yojson [ ("message", option_to_yojson message_type_to_yojson x.message) ]

let create_managed_login_branding_response_to_yojson (x : create_managed_login_branding_response) =
  assoc_to_yojson
    [
      ( "ManagedLoginBranding",
        option_to_yojson managed_login_branding_type_to_yojson x.managed_login_branding );
    ]

let create_managed_login_branding_request_to_yojson (x : create_managed_login_branding_request) =
  assoc_to_yojson
    [
      ("UserPoolId", Some (user_pool_id_type_to_yojson x.user_pool_id));
      ("ClientId", Some (client_id_type_to_yojson x.client_id));
      ( "UseCognitoProvidedValues",
        option_to_yojson boolean_type_to_yojson x.use_cognito_provided_values );
      ("Settings", option_to_yojson document_to_yojson x.settings);
      ("Assets", option_to_yojson asset_list_type_to_yojson x.assets);
    ]

let duplicate_provider_exception_to_yojson (x : duplicate_provider_exception) =
  assoc_to_yojson [ ("message", option_to_yojson message_type_to_yojson x.message) ]

let create_identity_provider_response_to_yojson (x : create_identity_provider_response) =
  assoc_to_yojson
    [ ("IdentityProvider", Some (identity_provider_type_to_yojson x.identity_provider)) ]

let provider_name_type_v2_to_yojson = string_to_yojson

let create_identity_provider_request_to_yojson (x : create_identity_provider_request) =
  assoc_to_yojson
    [
      ("UserPoolId", Some (user_pool_id_type_to_yojson x.user_pool_id));
      ("ProviderName", Some (provider_name_type_v2_to_yojson x.provider_name));
      ("ProviderType", Some (identity_provider_type_type_to_yojson x.provider_type));
      ("ProviderDetails", Some (provider_details_type_to_yojson x.provider_details));
      ("AttributeMapping", option_to_yojson attribute_mapping_type_to_yojson x.attribute_mapping);
      ("IdpIdentifiers", option_to_yojson idp_identifiers_list_type_to_yojson x.idp_identifiers);
    ]

let group_exists_exception_to_yojson (x : group_exists_exception) =
  assoc_to_yojson [ ("message", option_to_yojson message_type_to_yojson x.message) ]

let create_group_response_to_yojson (x : create_group_response) =
  assoc_to_yojson [ ("Group", option_to_yojson group_type_to_yojson x.group) ]

let create_group_request_to_yojson (x : create_group_request) =
  assoc_to_yojson
    [
      ("GroupName", Some (group_name_type_to_yojson x.group_name));
      ("UserPoolId", Some (user_pool_id_type_to_yojson x.user_pool_id));
      ("Description", option_to_yojson description_type_to_yojson x.description);
      ("RoleArn", option_to_yojson arn_type_to_yojson x.role_arn);
      ("Precedence", option_to_yojson precedence_type_to_yojson x.precedence);
    ]

let too_many_failed_attempts_exception_to_yojson (x : too_many_failed_attempts_exception) =
  assoc_to_yojson [ ("message", option_to_yojson message_type_to_yojson x.message) ]

let confirm_sign_up_response_to_yojson (x : confirm_sign_up_response) =
  assoc_to_yojson [ ("Session", option_to_yojson session_type_to_yojson x.session) ]

let force_alias_creation_to_yojson = bool_to_yojson

let confirm_sign_up_request_to_yojson (x : confirm_sign_up_request) =
  assoc_to_yojson
    [
      ("ClientId", Some (client_id_type_to_yojson x.client_id));
      ("SecretHash", option_to_yojson secret_hash_type_to_yojson x.secret_hash);
      ("Username", Some (username_type_to_yojson x.username));
      ("ConfirmationCode", Some (confirmation_code_type_to_yojson x.confirmation_code));
      ("ForceAliasCreation", option_to_yojson force_alias_creation_to_yojson x.force_alias_creation);
      ("AnalyticsMetadata", option_to_yojson analytics_metadata_type_to_yojson x.analytics_metadata);
      ("UserContextData", option_to_yojson user_context_data_type_to_yojson x.user_context_data);
      ("ClientMetadata", option_to_yojson client_metadata_type_to_yojson x.client_metadata);
      ("Session", option_to_yojson session_type_to_yojson x.session);
    ]

let confirm_forgot_password_response_to_yojson = unit_to_yojson

let confirm_forgot_password_request_to_yojson (x : confirm_forgot_password_request) =
  assoc_to_yojson
    [
      ("ClientId", Some (client_id_type_to_yojson x.client_id));
      ("SecretHash", option_to_yojson secret_hash_type_to_yojson x.secret_hash);
      ("Username", Some (username_type_to_yojson x.username));
      ("ConfirmationCode", Some (confirmation_code_type_to_yojson x.confirmation_code));
      ("Password", Some (password_type_to_yojson x.password));
      ("AnalyticsMetadata", option_to_yojson analytics_metadata_type_to_yojson x.analytics_metadata);
      ("UserContextData", option_to_yojson user_context_data_type_to_yojson x.user_context_data);
      ("ClientMetadata", option_to_yojson client_metadata_type_to_yojson x.client_metadata);
    ]

let device_key_exists_exception_to_yojson (x : device_key_exists_exception) =
  assoc_to_yojson [ ("message", option_to_yojson message_type_to_yojson x.message) ]

let confirm_device_response_to_yojson (x : confirm_device_response) =
  assoc_to_yojson
    [
      ( "UserConfirmationNecessary",
        option_to_yojson boolean_type_to_yojson x.user_confirmation_necessary );
    ]

let device_name_type_to_yojson = string_to_yojson

let device_secret_verifier_config_type_to_yojson (x : device_secret_verifier_config_type) =
  assoc_to_yojson
    [
      ("PasswordVerifier", option_to_yojson string_type_to_yojson x.password_verifier);
      ("Salt", option_to_yojson string_type_to_yojson x.salt);
    ]

let confirm_device_request_to_yojson (x : confirm_device_request) =
  assoc_to_yojson
    [
      ("AccessToken", Some (token_model_type_to_yojson x.access_token));
      ("DeviceKey", Some (device_key_type_to_yojson x.device_key));
      ( "DeviceSecretVerifierConfig",
        option_to_yojson device_secret_verifier_config_type_to_yojson
          x.device_secret_verifier_config );
      ("DeviceName", option_to_yojson device_name_type_to_yojson x.device_name);
    ]

let web_authn_relying_party_mismatch_exception_to_yojson
    (x : web_authn_relying_party_mismatch_exception) =
  assoc_to_yojson [ ("message", option_to_yojson message_type_to_yojson x.message) ]

let web_authn_origin_not_allowed_exception_to_yojson (x : web_authn_origin_not_allowed_exception) =
  assoc_to_yojson [ ("message", option_to_yojson message_type_to_yojson x.message) ]

let web_authn_credential_not_supported_exception_to_yojson
    (x : web_authn_credential_not_supported_exception) =
  assoc_to_yojson [ ("message", option_to_yojson message_type_to_yojson x.message) ]

let web_authn_client_mismatch_exception_to_yojson (x : web_authn_client_mismatch_exception) =
  assoc_to_yojson [ ("message", option_to_yojson message_type_to_yojson x.message) ]

let web_authn_challenge_not_found_exception_to_yojson (x : web_authn_challenge_not_found_exception)
    =
  assoc_to_yojson [ ("message", option_to_yojson message_type_to_yojson x.message) ]

let complete_web_authn_registration_response_to_yojson = unit_to_yojson

let complete_web_authn_registration_request_to_yojson (x : complete_web_authn_registration_request)
    =
  assoc_to_yojson
    [
      ("AccessToken", Some (token_model_type_to_yojson x.access_token));
      ("Credential", Some (document_to_yojson x.credential));
    ]

let change_password_response_to_yojson = unit_to_yojson

let change_password_request_to_yojson (x : change_password_request) =
  assoc_to_yojson
    [
      ("PreviousPassword", option_to_yojson password_type_to_yojson x.previous_password);
      ("ProposedPassword", Some (password_type_to_yojson x.proposed_password));
      ("AccessToken", Some (token_model_type_to_yojson x.access_token));
    ]

let secret_code_type_to_yojson = string_to_yojson

let associate_software_token_response_to_yojson (x : associate_software_token_response) =
  assoc_to_yojson
    [
      ("SecretCode", option_to_yojson secret_code_type_to_yojson x.secret_code);
      ("Session", option_to_yojson session_type_to_yojson x.session);
    ]

let associate_software_token_request_to_yojson (x : associate_software_token_request) =
  assoc_to_yojson
    [
      ("AccessToken", option_to_yojson token_model_type_to_yojson x.access_token);
      ("Session", option_to_yojson session_type_to_yojson x.session);
    ]

let admin_user_global_sign_out_response_to_yojson = unit_to_yojson

let admin_user_global_sign_out_request_to_yojson (x : admin_user_global_sign_out_request) =
  assoc_to_yojson
    [
      ("UserPoolId", Some (user_pool_id_type_to_yojson x.user_pool_id));
      ("Username", Some (username_type_to_yojson x.username));
    ]

let admin_update_user_attributes_response_to_yojson = unit_to_yojson

let admin_update_user_attributes_request_to_yojson (x : admin_update_user_attributes_request) =
  assoc_to_yojson
    [
      ("UserPoolId", Some (user_pool_id_type_to_yojson x.user_pool_id));
      ("Username", Some (username_type_to_yojson x.username));
      ("UserAttributes", Some (attribute_list_type_to_yojson x.user_attributes));
      ("ClientMetadata", option_to_yojson client_metadata_type_to_yojson x.client_metadata);
    ]

let admin_update_device_status_response_to_yojson = unit_to_yojson

let admin_update_device_status_request_to_yojson (x : admin_update_device_status_request) =
  assoc_to_yojson
    [
      ("UserPoolId", Some (user_pool_id_type_to_yojson x.user_pool_id));
      ("Username", Some (username_type_to_yojson x.username));
      ("DeviceKey", Some (device_key_type_to_yojson x.device_key));
      ( "DeviceRememberedStatus",
        option_to_yojson device_remembered_status_type_to_yojson x.device_remembered_status );
    ]

let admin_update_auth_event_feedback_response_to_yojson = unit_to_yojson

let admin_update_auth_event_feedback_request_to_yojson
    (x : admin_update_auth_event_feedback_request) =
  assoc_to_yojson
    [
      ("UserPoolId", Some (user_pool_id_type_to_yojson x.user_pool_id));
      ("Username", Some (username_type_to_yojson x.username));
      ("EventId", Some (event_id_type_to_yojson x.event_id));
      ("FeedbackValue", Some (feedback_value_type_to_yojson x.feedback_value));
    ]

let admin_set_user_settings_response_to_yojson = unit_to_yojson

let admin_set_user_settings_request_to_yojson (x : admin_set_user_settings_request) =
  assoc_to_yojson
    [
      ("UserPoolId", Some (user_pool_id_type_to_yojson x.user_pool_id));
      ("Username", Some (username_type_to_yojson x.username));
      ("MFAOptions", Some (mfa_option_list_type_to_yojson x.mfa_options));
    ]

let admin_set_user_password_response_to_yojson = unit_to_yojson

let admin_set_user_password_request_to_yojson (x : admin_set_user_password_request) =
  assoc_to_yojson
    [
      ("UserPoolId", Some (user_pool_id_type_to_yojson x.user_pool_id));
      ("Username", Some (username_type_to_yojson x.username));
      ("Password", Some (password_type_to_yojson x.password));
      ("Permanent", option_to_yojson boolean_type_to_yojson x.permanent);
    ]

let admin_set_user_mfa_preference_response_to_yojson = unit_to_yojson

let admin_set_user_mfa_preference_request_to_yojson (x : admin_set_user_mfa_preference_request) =
  assoc_to_yojson
    [
      ("SMSMfaSettings", option_to_yojson sms_mfa_settings_type_to_yojson x.sms_mfa_settings);
      ( "SoftwareTokenMfaSettings",
        option_to_yojson software_token_mfa_settings_type_to_yojson x.software_token_mfa_settings );
      ("EmailMfaSettings", option_to_yojson email_mfa_settings_type_to_yojson x.email_mfa_settings);
      ( "WebAuthnMfaSettings",
        option_to_yojson web_authn_mfa_settings_type_to_yojson x.web_authn_mfa_settings );
      ("Username", Some (username_type_to_yojson x.username));
      ("UserPoolId", Some (user_pool_id_type_to_yojson x.user_pool_id));
    ]

let admin_respond_to_auth_challenge_response_to_yojson
    (x : admin_respond_to_auth_challenge_response) =
  assoc_to_yojson
    [
      ("ChallengeName", option_to_yojson challenge_name_type_to_yojson x.challenge_name);
      ("Session", option_to_yojson session_type_to_yojson x.session);
      ( "ChallengeParameters",
        option_to_yojson challenge_parameters_type_to_yojson x.challenge_parameters );
      ( "AuthenticationResult",
        option_to_yojson authentication_result_type_to_yojson x.authentication_result );
    ]

let http_header_to_yojson (x : http_header) =
  assoc_to_yojson
    [
      ("headerName", option_to_yojson string_type_to_yojson x.header_name);
      ("headerValue", option_to_yojson string_type_to_yojson x.header_value);
    ]

let http_header_list_to_yojson tree = list_to_yojson http_header_to_yojson tree

let context_data_type_to_yojson (x : context_data_type) =
  assoc_to_yojson
    [
      ("IpAddress", Some (string_type_to_yojson x.ip_address));
      ("ServerName", Some (string_type_to_yojson x.server_name));
      ("ServerPath", Some (string_type_to_yojson x.server_path));
      ("HttpHeaders", Some (http_header_list_to_yojson x.http_headers));
      ("EncodedData", option_to_yojson string_type_to_yojson x.encoded_data);
    ]

let admin_respond_to_auth_challenge_request_to_yojson (x : admin_respond_to_auth_challenge_request)
    =
  assoc_to_yojson
    [
      ("UserPoolId", Some (user_pool_id_type_to_yojson x.user_pool_id));
      ("ClientId", Some (client_id_type_to_yojson x.client_id));
      ("ChallengeName", Some (challenge_name_type_to_yojson x.challenge_name));
      ( "ChallengeResponses",
        option_to_yojson challenge_responses_type_to_yojson x.challenge_responses );
      ("Session", option_to_yojson session_type_to_yojson x.session);
      ("AnalyticsMetadata", option_to_yojson analytics_metadata_type_to_yojson x.analytics_metadata);
      ("ContextData", option_to_yojson context_data_type_to_yojson x.context_data);
      ("ClientMetadata", option_to_yojson client_metadata_type_to_yojson x.client_metadata);
    ]

let admin_reset_user_password_response_to_yojson = unit_to_yojson

let admin_reset_user_password_request_to_yojson (x : admin_reset_user_password_request) =
  assoc_to_yojson
    [
      ("UserPoolId", Some (user_pool_id_type_to_yojson x.user_pool_id));
      ("Username", Some (username_type_to_yojson x.username));
      ("ClientMetadata", option_to_yojson client_metadata_type_to_yojson x.client_metadata);
    ]

let admin_remove_user_from_group_request_to_yojson (x : admin_remove_user_from_group_request) =
  assoc_to_yojson
    [
      ("UserPoolId", Some (user_pool_id_type_to_yojson x.user_pool_id));
      ("Username", Some (username_type_to_yojson x.username));
      ("GroupName", Some (group_name_type_to_yojson x.group_name));
    ]

let event_feedback_type_to_yojson (x : event_feedback_type) =
  assoc_to_yojson
    [
      ("FeedbackValue", Some (feedback_value_type_to_yojson x.feedback_value));
      ("Provider", Some (string_type_to_yojson x.provider));
      ("FeedbackDate", option_to_yojson date_type_to_yojson x.feedback_date);
    ]

let event_context_data_type_to_yojson (x : event_context_data_type) =
  assoc_to_yojson
    [
      ("IpAddress", option_to_yojson string_type_to_yojson x.ip_address);
      ("DeviceName", option_to_yojson string_type_to_yojson x.device_name);
      ("Timezone", option_to_yojson string_type_to_yojson x.timezone);
      ("City", option_to_yojson string_type_to_yojson x.city);
      ("Country", option_to_yojson string_type_to_yojson x.country);
    ]

let challenge_response_to_yojson (x : challenge_response) =
  match x with Success -> `String "Success" | Failure -> `String "Failure"

let challenge_name_to_yojson (x : challenge_name) =
  match x with Password -> `String "Password" | Mfa -> `String "Mfa"

let challenge_response_type_to_yojson (x : challenge_response_type) =
  assoc_to_yojson
    [
      ("ChallengeName", option_to_yojson challenge_name_to_yojson x.challenge_name);
      ("ChallengeResponse", option_to_yojson challenge_response_to_yojson x.challenge_response);
    ]

let challenge_response_list_type_to_yojson tree =
  list_to_yojson challenge_response_type_to_yojson tree

let risk_level_type_to_yojson (x : risk_level_type) =
  match x with Low -> `String "Low" | Medium -> `String "Medium" | High -> `String "High"

let risk_decision_type_to_yojson (x : risk_decision_type) =
  match x with
  | NoRisk -> `String "NoRisk"
  | AccountTakeover -> `String "AccountTakeover"
  | Block -> `String "Block"

let event_risk_type_to_yojson (x : event_risk_type) =
  assoc_to_yojson
    [
      ("RiskDecision", option_to_yojson risk_decision_type_to_yojson x.risk_decision);
      ("RiskLevel", option_to_yojson risk_level_type_to_yojson x.risk_level);
      ( "CompromisedCredentialsDetected",
        option_to_yojson wrapped_boolean_type_to_yojson x.compromised_credentials_detected );
    ]

let event_response_type_to_yojson (x : event_response_type) =
  match x with
  | Pass -> `String "Pass"
  | Fail -> `String "Fail"
  | InProgress -> `String "InProgress"

let event_type_to_yojson (x : event_type) =
  match x with
  | SignIn -> `String "SignIn"
  | SignUp -> `String "SignUp"
  | ForgotPassword -> `String "ForgotPassword"
  | PasswordChange -> `String "PasswordChange"
  | ResendCode -> `String "ResendCode"

let auth_event_type_to_yojson (x : auth_event_type) =
  assoc_to_yojson
    [
      ("EventId", option_to_yojson string_type_to_yojson x.event_id);
      ("EventType", option_to_yojson event_type_to_yojson x.event_type);
      ("CreationDate", option_to_yojson date_type_to_yojson x.creation_date);
      ("EventResponse", option_to_yojson event_response_type_to_yojson x.event_response);
      ("EventRisk", option_to_yojson event_risk_type_to_yojson x.event_risk);
      ( "ChallengeResponses",
        option_to_yojson challenge_response_list_type_to_yojson x.challenge_responses );
      ("EventContextData", option_to_yojson event_context_data_type_to_yojson x.event_context_data);
      ("EventFeedback", option_to_yojson event_feedback_type_to_yojson x.event_feedback);
    ]

let auth_events_type_to_yojson tree = list_to_yojson auth_event_type_to_yojson tree

let admin_list_user_auth_events_response_to_yojson (x : admin_list_user_auth_events_response) =
  assoc_to_yojson
    [
      ("AuthEvents", option_to_yojson auth_events_type_to_yojson x.auth_events);
      ("NextToken", option_to_yojson pagination_key_to_yojson x.next_token);
    ]

let admin_list_user_auth_events_request_to_yojson (x : admin_list_user_auth_events_request) =
  assoc_to_yojson
    [
      ("UserPoolId", Some (user_pool_id_type_to_yojson x.user_pool_id));
      ("Username", Some (username_type_to_yojson x.username));
      ("MaxResults", option_to_yojson query_limit_type_to_yojson x.max_results);
      ("NextToken", option_to_yojson pagination_key_to_yojson x.next_token);
    ]

let admin_list_groups_for_user_response_to_yojson (x : admin_list_groups_for_user_response) =
  assoc_to_yojson
    [
      ("Groups", option_to_yojson group_list_type_to_yojson x.groups);
      ("NextToken", option_to_yojson pagination_key_to_yojson x.next_token);
    ]

let admin_list_groups_for_user_request_to_yojson (x : admin_list_groups_for_user_request) =
  assoc_to_yojson
    [
      ("Username", Some (username_type_to_yojson x.username));
      ("UserPoolId", Some (user_pool_id_type_to_yojson x.user_pool_id));
      ("Limit", option_to_yojson query_limit_type_to_yojson x.limit);
      ("NextToken", option_to_yojson pagination_key_to_yojson x.next_token);
    ]

let admin_list_devices_response_to_yojson (x : admin_list_devices_response) =
  assoc_to_yojson
    [
      ("Devices", option_to_yojson device_list_type_to_yojson x.devices);
      ("PaginationToken", option_to_yojson search_pagination_token_type_to_yojson x.pagination_token);
    ]

let admin_list_devices_request_to_yojson (x : admin_list_devices_request) =
  assoc_to_yojson
    [
      ("UserPoolId", Some (user_pool_id_type_to_yojson x.user_pool_id));
      ("Username", Some (username_type_to_yojson x.username));
      ("Limit", option_to_yojson query_limit_type_to_yojson x.limit);
      ("PaginationToken", option_to_yojson search_pagination_token_type_to_yojson x.pagination_token);
    ]

let admin_link_provider_for_user_response_to_yojson = unit_to_yojson

let provider_user_identifier_type_to_yojson (x : provider_user_identifier_type) =
  assoc_to_yojson
    [
      ("ProviderName", option_to_yojson provider_name_type_to_yojson x.provider_name);
      ("ProviderAttributeName", option_to_yojson string_type_to_yojson x.provider_attribute_name);
      ("ProviderAttributeValue", option_to_yojson string_type_to_yojson x.provider_attribute_value);
    ]

let admin_link_provider_for_user_request_to_yojson (x : admin_link_provider_for_user_request) =
  assoc_to_yojson
    [
      ("UserPoolId", Some (string_type_to_yojson x.user_pool_id));
      ("DestinationUser", Some (provider_user_identifier_type_to_yojson x.destination_user));
      ("SourceUser", Some (provider_user_identifier_type_to_yojson x.source_user));
    ]

let admin_initiate_auth_response_to_yojson (x : admin_initiate_auth_response) =
  assoc_to_yojson
    [
      ("ChallengeName", option_to_yojson challenge_name_type_to_yojson x.challenge_name);
      ("Session", option_to_yojson session_type_to_yojson x.session);
      ( "ChallengeParameters",
        option_to_yojson challenge_parameters_type_to_yojson x.challenge_parameters );
      ( "AuthenticationResult",
        option_to_yojson authentication_result_type_to_yojson x.authentication_result );
      ( "AvailableChallenges",
        option_to_yojson available_challenge_list_type_to_yojson x.available_challenges );
    ]

let admin_initiate_auth_request_to_yojson (x : admin_initiate_auth_request) =
  assoc_to_yojson
    [
      ("UserPoolId", Some (user_pool_id_type_to_yojson x.user_pool_id));
      ("ClientId", Some (client_id_type_to_yojson x.client_id));
      ("AuthFlow", Some (auth_flow_type_to_yojson x.auth_flow));
      ("AuthParameters", option_to_yojson auth_parameters_type_to_yojson x.auth_parameters);
      ("ClientMetadata", option_to_yojson client_metadata_type_to_yojson x.client_metadata);
      ("AnalyticsMetadata", option_to_yojson analytics_metadata_type_to_yojson x.analytics_metadata);
      ("ContextData", option_to_yojson context_data_type_to_yojson x.context_data);
      ("Session", option_to_yojson session_type_to_yojson x.session);
    ]

let admin_get_user_response_to_yojson (x : admin_get_user_response) =
  assoc_to_yojson
    [
      ("Username", Some (username_type_to_yojson x.username));
      ("UserAttributes", option_to_yojson attribute_list_type_to_yojson x.user_attributes);
      ("UserCreateDate", option_to_yojson date_type_to_yojson x.user_create_date);
      ("UserLastModifiedDate", option_to_yojson date_type_to_yojson x.user_last_modified_date);
      ("Enabled", option_to_yojson boolean_type_to_yojson x.enabled);
      ("UserStatus", option_to_yojson user_status_type_to_yojson x.user_status);
      ("MFAOptions", option_to_yojson mfa_option_list_type_to_yojson x.mfa_options);
      ("PreferredMfaSetting", option_to_yojson string_type_to_yojson x.preferred_mfa_setting);
      ( "UserMFASettingList",
        option_to_yojson user_mfa_setting_list_type_to_yojson x.user_mfa_setting_list );
    ]

let admin_get_user_request_to_yojson (x : admin_get_user_request) =
  assoc_to_yojson
    [
      ("UserPoolId", Some (user_pool_id_type_to_yojson x.user_pool_id));
      ("Username", Some (username_type_to_yojson x.username));
    ]

let admin_get_device_response_to_yojson (x : admin_get_device_response) =
  assoc_to_yojson [ ("Device", Some (device_type_to_yojson x.device)) ]

let admin_get_device_request_to_yojson (x : admin_get_device_request) =
  assoc_to_yojson
    [
      ("DeviceKey", Some (device_key_type_to_yojson x.device_key));
      ("UserPoolId", Some (user_pool_id_type_to_yojson x.user_pool_id));
      ("Username", Some (username_type_to_yojson x.username));
    ]

let admin_forget_device_request_to_yojson (x : admin_forget_device_request) =
  assoc_to_yojson
    [
      ("UserPoolId", Some (user_pool_id_type_to_yojson x.user_pool_id));
      ("Username", Some (username_type_to_yojson x.username));
      ("DeviceKey", Some (device_key_type_to_yojson x.device_key));
    ]

let admin_enable_user_response_to_yojson = unit_to_yojson

let admin_enable_user_request_to_yojson (x : admin_enable_user_request) =
  assoc_to_yojson
    [
      ("UserPoolId", Some (user_pool_id_type_to_yojson x.user_pool_id));
      ("Username", Some (username_type_to_yojson x.username));
    ]

let admin_disable_user_response_to_yojson = unit_to_yojson

let admin_disable_user_request_to_yojson (x : admin_disable_user_request) =
  assoc_to_yojson
    [
      ("UserPoolId", Some (user_pool_id_type_to_yojson x.user_pool_id));
      ("Username", Some (username_type_to_yojson x.username));
    ]

let admin_disable_provider_for_user_response_to_yojson = unit_to_yojson

let admin_disable_provider_for_user_request_to_yojson (x : admin_disable_provider_for_user_request)
    =
  assoc_to_yojson
    [
      ("UserPoolId", Some (string_type_to_yojson x.user_pool_id));
      ("User", Some (provider_user_identifier_type_to_yojson x.user));
    ]

let admin_delete_user_attributes_response_to_yojson = unit_to_yojson

let admin_delete_user_attributes_request_to_yojson (x : admin_delete_user_attributes_request) =
  assoc_to_yojson
    [
      ("UserPoolId", Some (user_pool_id_type_to_yojson x.user_pool_id));
      ("Username", Some (username_type_to_yojson x.username));
      ("UserAttributeNames", Some (attribute_name_list_type_to_yojson x.user_attribute_names));
    ]

let admin_delete_user_request_to_yojson (x : admin_delete_user_request) =
  assoc_to_yojson
    [
      ("UserPoolId", Some (user_pool_id_type_to_yojson x.user_pool_id));
      ("Username", Some (username_type_to_yojson x.username));
    ]

let unsupported_user_state_exception_to_yojson (x : unsupported_user_state_exception) =
  assoc_to_yojson [ ("message", option_to_yojson message_type_to_yojson x.message) ]

let admin_create_user_response_to_yojson (x : admin_create_user_response) =
  assoc_to_yojson [ ("User", option_to_yojson user_type_to_yojson x.user) ]

let delivery_medium_list_type_to_yojson tree = list_to_yojson delivery_medium_type_to_yojson tree

let message_action_type_to_yojson (x : message_action_type) =
  match x with RESEND -> `String "RESEND" | SUPPRESS -> `String "SUPPRESS"

let admin_create_user_request_to_yojson (x : admin_create_user_request) =
  assoc_to_yojson
    [
      ("UserPoolId", Some (user_pool_id_type_to_yojson x.user_pool_id));
      ("Username", Some (username_type_to_yojson x.username));
      ("UserAttributes", option_to_yojson attribute_list_type_to_yojson x.user_attributes);
      ("ValidationData", option_to_yojson attribute_list_type_to_yojson x.validation_data);
      ("TemporaryPassword", option_to_yojson password_type_to_yojson x.temporary_password);
      ("ForceAliasCreation", option_to_yojson force_alias_creation_to_yojson x.force_alias_creation);
      ("MessageAction", option_to_yojson message_action_type_to_yojson x.message_action);
      ( "DesiredDeliveryMediums",
        option_to_yojson delivery_medium_list_type_to_yojson x.desired_delivery_mediums );
      ("ClientMetadata", option_to_yojson client_metadata_type_to_yojson x.client_metadata);
    ]

let admin_confirm_sign_up_response_to_yojson = unit_to_yojson

let admin_confirm_sign_up_request_to_yojson (x : admin_confirm_sign_up_request) =
  assoc_to_yojson
    [
      ("UserPoolId", Some (user_pool_id_type_to_yojson x.user_pool_id));
      ("Username", Some (username_type_to_yojson x.username));
      ("ClientMetadata", option_to_yojson client_metadata_type_to_yojson x.client_metadata);
    ]

let admin_add_user_to_group_request_to_yojson (x : admin_add_user_to_group_request) =
  assoc_to_yojson
    [
      ("UserPoolId", Some (user_pool_id_type_to_yojson x.user_pool_id));
      ("Username", Some (username_type_to_yojson x.username));
      ("GroupName", Some (group_name_type_to_yojson x.group_name));
    ]

let access_denied_exception_to_yojson (x : access_denied_exception) =
  assoc_to_yojson [ ("message", option_to_yojson message_type_to_yojson x.message) ]

let add_user_pool_client_secret_response_to_yojson (x : add_user_pool_client_secret_response) =
  assoc_to_yojson
    [
      ( "ClientSecretDescriptor",
        option_to_yojson client_secret_descriptor_type_to_yojson x.client_secret_descriptor );
    ]

let add_user_pool_client_secret_request_to_yojson (x : add_user_pool_client_secret_request) =
  assoc_to_yojson
    [
      ("UserPoolId", Some (user_pool_id_type_to_yojson x.user_pool_id));
      ("ClientId", Some (client_id_type_to_yojson x.client_id));
      ("ClientSecret", option_to_yojson client_secret_type_to_yojson x.client_secret);
    ]

let add_custom_attributes_response_to_yojson = unit_to_yojson
let custom_attributes_list_type_to_yojson tree = list_to_yojson schema_attribute_type_to_yojson tree

let add_custom_attributes_request_to_yojson (x : add_custom_attributes_request) =
  assoc_to_yojson
    [
      ("UserPoolId", Some (user_pool_id_type_to_yojson x.user_pool_id));
      ("CustomAttributes", Some (custom_attributes_list_type_to_yojson x.custom_attributes));
    ]
