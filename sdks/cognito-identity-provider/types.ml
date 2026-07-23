type nonrec aws_account_id_type = string [@@ocaml.doc ""]

type nonrec message_type = string [@@ocaml.doc ""]

type nonrec user_not_found_exception = {
  message : message_type option; [@ocaml.doc "The message returned when a user isn't found.\n"]
}
[@@ocaml.doc "This exception is thrown when a user isn't found.\n"]

type nonrec user_not_confirmed_exception = {
  message : message_type option;
      [@ocaml.doc "The message returned when a user isn't confirmed successfully.\n"]
}
[@@ocaml.doc "This exception is thrown when a user isn't confirmed successfully.\n"]

type nonrec too_many_requests_exception = {
  message : message_type option;
      [@ocaml.doc
        "The message returned when the Amazon Cognito service returns a too many requests exception.\n"]
}
[@@ocaml.doc
  "This exception is thrown when the user has made too many requests for a given operation.\n"]

type nonrec resource_not_found_exception = {
  message : message_type option;
      [@ocaml.doc
        "The message returned when the Amazon Cognito service returns a resource not found \
         exception.\n"]
}
[@@ocaml.doc
  "This exception is thrown when the Amazon Cognito service can't find the requested resource.\n"]

type nonrec password_reset_required_exception = {
  message : message_type option;
      [@ocaml.doc "The message returned when a password reset is required.\n"]
}
[@@ocaml.doc "This exception is thrown when a password reset is required.\n"]

type nonrec operation_not_enabled_exception = { message : message_type option [@ocaml.doc ""] }
[@@ocaml.doc
  "This exception is thrown when an operation is not available in the current region or for the \
   current user pool configuration. This can occur when attempting to perform operations that are \
   not supported in secondary replica regions.\n"]

type nonrec not_authorized_exception = {
  message : message_type option;
      [@ocaml.doc
        "The message returned when the Amazon Cognito service returns a not authorized exception.\n"]
}
[@@ocaml.doc "This exception is thrown when a user isn't authorized.\n"]

type nonrec limit_exceeded_exception = {
  message : message_type option;
      [@ocaml.doc "The message returned when Amazon Cognito throws a limit exceeded exception.\n"]
}
[@@ocaml.doc
  "This exception is thrown when a user exceeds the limit for a requested Amazon Web Services \
   resource.\n"]

type nonrec invalid_parameter_exception_reason_code_type = string [@@ocaml.doc ""]

type nonrec invalid_parameter_exception = {
  message : message_type option;
      [@ocaml.doc
        "The message returned when the Amazon Cognito service throws an invalid parameter exception.\n"]
  reason_code : invalid_parameter_exception_reason_code_type option;
      [@ocaml.doc "The reason code of the exception.\n"]
}
[@@ocaml.doc
  "This exception is thrown when the Amazon Cognito service encounters an invalid parameter.\n"]

type nonrec internal_error_exception = {
  message : message_type option;
      [@ocaml.doc "The message returned when Amazon Cognito throws an internal error exception.\n"]
}
[@@ocaml.doc "This exception is thrown when Amazon Cognito encounters an internal error.\n"]

type nonrec forbidden_exception = {
  message : message_type option;
      [@ocaml.doc
        "The message returned when WAF doesn't allow your request based on a web ACL that's \
         associated with your user pool.\n"]
}
[@@ocaml.doc
  "This exception is thrown when WAF doesn't allow your request based on a web ACL that's \
   associated with your user pool.\n"]

type nonrec expired_code_exception = {
  message : message_type option;
      [@ocaml.doc "The message returned when the expired code exception is thrown.\n"]
}
[@@ocaml.doc "This exception is thrown if a code has expired.\n"]

type nonrec code_mismatch_exception = {
  message : message_type option;
      [@ocaml.doc "The message provided when the code mismatch exception is thrown.\n"]
}
[@@ocaml.doc
  "This exception is thrown if the provided code doesn't match what the server was expecting.\n"]

type nonrec alias_exists_exception = {
  message : message_type option;
      [@ocaml.doc
        "The message that Amazon Cognito sends to the user when the value of an alias attribute is \
         already linked to another user profile.\n"]
}
[@@ocaml.doc
  "This exception is thrown when a user tries to confirm the account with an email address or \
   phone number that has already been supplied as an alias for a different user profile. This \
   exception indicates that an account with this email address or phone already exists in a user \
   pool that you've configured to use email address or phone number as a sign-in alias.\n"]

type nonrec verify_user_attribute_response = unit [@@ocaml.doc ""]

type nonrec confirmation_code_type = string [@@ocaml.doc ""]

type nonrec attribute_name_type = string [@@ocaml.doc ""]

type nonrec token_model_type = string [@@ocaml.doc ""]

type nonrec verify_user_attribute_request = {
  access_token : token_model_type;
      [@ocaml.doc
        "A valid access token that Amazon Cognito issued to the currently signed-in user. Must \
         include a scope claim for [aws.cognito.signin.user.admin].\n"]
  attribute_name : attribute_name_type;
      [@ocaml.doc "The name of the attribute that you want to verify.\n"]
  code : confirmation_code_type;
      [@ocaml.doc
        "The verification code that your user pool sent to the added or changed attribute, for \
         example the user's email address.\n"]
}
[@@ocaml.doc "Represents the request to verify user attributes.\n"]

type nonrec software_token_mfa_not_found_exception = {
  message : message_type option; [@ocaml.doc ""]
}
[@@ocaml.doc
  "This exception is thrown when the software token time-based one-time password (TOTP) \
   multi-factor authentication (MFA) isn't activated for the user pool.\n"]

type nonrec invalid_user_pool_configuration_exception = {
  message : message_type option;
      [@ocaml.doc "The message returned when the user pool configuration is not valid.\n"]
}
[@@ocaml.doc "This exception is thrown when the user pool configuration is not valid.\n"]

type nonrec enable_software_token_mfa_exception = { message : message_type option [@ocaml.doc ""] }
[@@ocaml.doc
  "This exception is thrown when there is a code mismatch and the service fails to configure the \
   software token TOTP multi-factor authentication (MFA).\n"]

type nonrec session_type = string [@@ocaml.doc ""]

type nonrec verify_software_token_response_type = SUCCESS [@ocaml.doc ""] | ERROR [@ocaml.doc ""]
[@@ocaml.doc ""]

type nonrec verify_software_token_response = {
  status : verify_software_token_response_type option;
      [@ocaml.doc
        "Amazon Cognito can accept or reject the code that you provide. This response parameter \
         indicates the success of TOTP verification. Some reasons that this operation might return \
         an error are clock skew on the user's device and excessive retries.\n"]
  session : session_type option;
      [@ocaml.doc
        "This session ID satisfies an [MFA_SETUP] challenge. Supply the session ID in your \
         challenge response.\n"]
}
[@@ocaml.doc ""]

type nonrec string_type = string [@@ocaml.doc ""]

type nonrec software_token_mfa_user_code_type = string [@@ocaml.doc ""]

type nonrec verify_software_token_request = {
  access_token : token_model_type option;
      [@ocaml.doc
        "A valid access token that Amazon Cognito issued to the currently signed-in user. Must \
         include a scope claim for [aws.cognito.signin.user.admin].\n"]
  session : session_type option;
      [@ocaml.doc "The session ID from an [AssociateSoftwareToken] request.\n"]
  user_code : software_token_mfa_user_code_type;
      [@ocaml.doc "A TOTP that the user generated in their configured authenticator app.\n"]
  friendly_device_name : string_type option;
      [@ocaml.doc "A friendly name for the device that's running the TOTP authenticator.\n"]
}
[@@ocaml.doc ""]

type nonrec arn_type = string [@@ocaml.doc ""]

type nonrec replica_role_type = PRIMARY [@ocaml.doc ""] | SECONDARY [@ocaml.doc ""]
[@@ocaml.doc ""]

type nonrec replica_status_type =
  | CREATING [@ocaml.doc ""]
  | ACTIVE [@ocaml.doc ""]
  | INACTIVE [@ocaml.doc ""]
  | DELETING [@ocaml.doc ""]
[@@ocaml.doc ""]

type nonrec region_name_type = string [@@ocaml.doc ""]

type nonrec user_pool_replica_type = {
  region_name : region_name_type option;
      [@ocaml.doc "The Amazon Web Services Region where the replica is located.\n"]
  status : replica_status_type option;
      [@ocaml.doc
        "The current status of the replica.\n\n\
        \  CREATING  The replica is being created.\n\
        \            \n\
        \              INACTIVE  The replica has been created, but is not accepting requests for \
         end-users. Administrator configuration operations are supported.\n\
        \                        \n\
        \                          ACTIVE  The replica is available for both end-user and \
         administrator operations.\n\
        \                                  \n\
        \                                    DELETING  The replica is being deleted.\n\
        \                                              \n\
        \                                                "]
  role : replica_role_type option;
      [@ocaml.doc
        "The role of the user pool replica that determines which API operations are enabled.\n\n\
        \  PRIMARY  The primary replica supports all end user and administrator operations.\n\
        \           \n\
        \             SECONDARY  The secondary replica supports a limited set of end user and \
         administrator operations. Generally, only administrator operations that set \
         configurations specific to the replica, and only end-user operations that do not create \
         or change attributes of a user are supported. \n\
        \                        \n\
        \                          "]
  user_pool_arn : arn_type option;
      [@ocaml.doc "The Amazon Resource Name (ARN) of the replica user pool.\n"]
}
[@@ocaml.doc
  "Contains information about a replica user pool, including Region, status, role, and ARN.\n"]

type nonrec update_user_pool_replica_response = {
  user_pool_replica : user_pool_replica_type option;
      [@ocaml.doc "Information about the updated user pool replica.\n"]
}
[@@ocaml.doc ""]

type nonrec update_replica_status_type = ACTIVE [@ocaml.doc ""] | INACTIVE [@ocaml.doc ""]
[@@ocaml.doc ""]

type nonrec user_pool_id_type = string [@@ocaml.doc ""]

type nonrec update_user_pool_replica_request = {
  user_pool_id : user_pool_id_type;
      [@ocaml.doc "The ID of the user pool that contains the replica to update.\n"]
  region_name : region_name_type;
      [@ocaml.doc "The Amazon Web Services Region of the replica to update.\n"]
  status : update_replica_status_type;
      [@ocaml.doc "The status to set for the replica. Valid values are ACTIVE and INACTIVE.\n"]
}
[@@ocaml.doc ""]

type nonrec feature_unavailable_in_tier_exception = {
  message : message_type option; [@ocaml.doc ""]
}
[@@ocaml.doc
  "This exception is thrown when a feature you attempted to configure isn't available in your \
   current feature plan.\n"]

type nonrec concurrent_modification_exception = {
  message : message_type option;
      [@ocaml.doc "The message provided when the concurrent exception is thrown.\n"]
}
[@@ocaml.doc "This exception is thrown if two or more modifications are happening concurrently.\n"]

type nonrec health_check_id_type = string [@@ocaml.doc ""]

type nonrec failover_type = {
  secondary_region : region_name_type;
      [@ocaml.doc
        "The secondary Amazon Web Services Region to use for failover when the primary region \
         becomes unavailable.\n"]
  primary_route53_health_check_id : health_check_id_type;
      [@ocaml.doc
        "The ID of the Amazon Web Services Route53 healthcheck that controls routing. If the \
         healthcheck is healthy, traffic will be routed to the primary replica, and if the \
         healthcheck is unhealthy, traffic will be routed to the secondary region.\n"]
}
[@@ocaml.doc
  "Specifies failover configuration for multi-region user pool domains. Contains settings for the \
   secondary region and health check configuration.\n"]

type nonrec routing_type = {
  failover : failover_type option;
      [@ocaml.doc
        "The failover configuration that specifies the secondary region and health check settings.\n"]
}
[@@ocaml.doc
  "Specifies routing configuration for user pool domains. Contains failover settings for \
   multi-region deployments.\n"]

type nonrec domain_type = string [@@ocaml.doc ""]

type nonrec wrapped_integer_type = int [@@ocaml.doc ""]

type nonrec update_user_pool_domain_response = {
  managed_login_version : wrapped_integer_type option;
      [@ocaml.doc
        "A version number that indicates the state of managed login for your domain. Version [1] \
         is hosted UI (classic). Version [2] is the newer managed login with the branding editor. \
         For more information, see \
         {{:https://docs.aws.amazon.com/cognito/latest/developerguide/cognito-user-pools-managed-login.html}Managed \
         login}.\n"]
  cloud_front_domain : domain_type option;
      [@ocaml.doc
        "The fully-qualified domain name (FQDN) of the Amazon CloudFront distribution that hosts \
         your managed login or classic hosted UI pages. You domain-name authority must have an \
         alias record that points requests for your custom domain to this FQDN. Amazon Cognito \
         returns this value if you set a custom domain with [CustomDomainConfig]. If you set an \
         Amazon Cognito prefix domain, this operation returns a blank response.\n"]
  routing : routing_type option;
      [@ocaml.doc "The updated routing configuration for the user pool domain.\n"]
}
[@@ocaml.doc "The UpdateUserPoolDomain response output.\n"]

type nonrec security_policy_type =
  | TLS_V1 [@ocaml.doc ""]
  | TLS_V1_2_2021 [@ocaml.doc ""]
  | TLS_V1_3_2025 [@ocaml.doc ""]
[@@ocaml.doc ""]

type nonrec custom_domain_config_type = {
  certificate_arn : arn_type;
      [@ocaml.doc
        "The Amazon Resource Name (ARN) of an Certificate Manager SSL certificate. You use this \
         certificate for the subdomain of your custom domain.\n"]
  security_policy : security_policy_type option;
      [@ocaml.doc
        "The security policy for the custom domain. Defines the minimum TLS version and cipher \
         suites that CloudFront uses when communicating with viewers (clients). Valid values are \
         as follows:\n\n\
        \ {ul\n\
        \       {-   [TLS_V1]: Supports TLS 1.0 and later. Provides the broadest client \
         compatibility.\n\
        \           \n\
        \            }\n\
        \       {-   [TLS_V1_2_2021]: Supports TLS 1.2 and later with 2021 cipher suites. \
         Recommended minimum for most use cases.\n\
        \           \n\
        \            }\n\
        \       {-   [TLS_V1_3_2025]: Supports TLS 1.3 and later with 2025 cipher suites. Provides \
         the strongest security posture.\n\
        \           \n\
        \            }\n\
        \       }\n\
        \  "]
}
[@@ocaml.doc
  "The configuration for a custom domain, including the SSL certificate and TLS security policy.\n"]

type nonrec update_user_pool_domain_request = {
  domain : domain_type;
      [@ocaml.doc
        "The name of the domain that you want to update. For custom domains, this is the \
         fully-qualified domain name, for example [auth.example.com]. For prefix domains, this is \
         the prefix alone, such as [myprefix].\n"]
  user_pool_id : user_pool_id_type;
      [@ocaml.doc "The ID of the user pool that is associated with the domain you're updating.\n"]
  managed_login_version : wrapped_integer_type option;
      [@ocaml.doc
        "A version number that indicates the state of managed login for your domain. Version [1] \
         is hosted UI (classic). Version [2] is the newer managed login with the branding editor. \
         For more information, see \
         {{:https://docs.aws.amazon.com/cognito/latest/developerguide/cognito-user-pools-managed-login.html}Managed \
         login}.\n"]
  custom_domain_config : custom_domain_config_type option;
      [@ocaml.doc
        "The configuration for a custom domain that hosts managed login for your application. In \
         an [UpdateUserPoolDomain] request, this parameter specifies an SSL certificate for the \
         managed login hosted webserver. The certificate must be an ACM ARN in [us-east-1].\n\n\
        \ When you create a custom domain, the passkey RP ID defaults to the custom domain. If you \
         had a prefix domain active, this will cause passkey integration for your prefix domain to \
         stop working due to a mismatch in RP ID. To keep the prefix domain passkey integration \
         working, you can explicitly set RP ID to the prefix domain.\n\
        \ "]
  routing : routing_type option;
      [@ocaml.doc
        "The routing configuration for the user pool domain. Specifies failover settings for \
         multi-region deployments.\n"]
}
[@@ocaml.doc "The UpdateUserPoolDomain request input.\n"]

type nonrec scope_does_not_exist_exception = { message : message_type option [@ocaml.doc ""] }
[@@ocaml.doc "This exception is thrown when the specified scope doesn't exist.\n"]

type nonrec invalid_o_auth_flow_exception = { message : message_type option [@ocaml.doc ""] }
[@@ocaml.doc "This exception is thrown when the specified OAuth flow is not valid.\n"]

type nonrec retry_grace_period_seconds_type = int [@@ocaml.doc ""]

type nonrec feature_type = ENABLED [@ocaml.doc ""] | DISABLED [@ocaml.doc ""] [@@ocaml.doc ""]

type nonrec refresh_token_rotation_type = {
  feature : feature_type;
      [@ocaml.doc "The state of refresh token rotation for the current app client.\n"]
  retry_grace_period_seconds : retry_grace_period_seconds_type option;
      [@ocaml.doc
        "When you request a token refresh with [GetTokensFromRefreshToken], the original refresh \
         token that you're rotating out can remain valid for a period of time of up to 60 seconds. \
         This allows for client-side retries. When [RetryGracePeriodSeconds] is [0], the grace \
         period is disabled and a successful request immediately invalidates the submitted refresh \
         token.\n"]
}
[@@ocaml.doc
  "The configuration of your app client for refresh token rotation. When enabled, your app client \
   issues new ID, access, and refresh tokens when users renew their sessions with refresh tokens. \
   When disabled, token refresh issues only ID and access tokens.\n"]

type nonrec auth_session_validity_type = int [@@ocaml.doc ""]

type nonrec wrapped_boolean_type = bool [@@ocaml.doc ""]

type nonrec prevent_user_existence_error_types = LEGACY [@ocaml.doc ""] | ENABLED [@ocaml.doc ""]
[@@ocaml.doc ""]

type nonrec boolean_type = bool [@@ocaml.doc ""]

type nonrec hex_string_type = string [@@ocaml.doc ""]

type nonrec analytics_configuration_type = {
  application_id : hex_string_type option; [@ocaml.doc "Your Amazon Pinpoint project ID.\n"]
  application_arn : arn_type option;
      [@ocaml.doc
        "The Amazon Resource Name (ARN) of an Amazon Pinpoint project that you want to connect to \
         your user pool app client. Amazon Cognito publishes events to the Amazon Pinpoint project \
         that [ApplicationArn] declares. You can also configure your application to pass an \
         endpoint ID in the [AnalyticsMetadata] parameter of sign-in operations. The endpoint ID \
         is information about the destination for push notifications\n"]
  role_arn : arn_type option;
      [@ocaml.doc
        "The ARN of an Identity and Access Management role that has the permissions required for \
         Amazon Cognito to publish events to Amazon Pinpoint analytics.\n"]
  external_id : string_type option;
      [@ocaml.doc
        "The \
         {{:https://docs.aws.amazon.com/IAM/latest/UserGuide/id_roles_create_for-user_externalid.html}external \
         ID} of the role that Amazon Cognito assumes to send analytics data to Amazon Pinpoint.\n"]
  user_data_shared : boolean_type option;
      [@ocaml.doc
        "If [UserDataShared] is [true], Amazon Cognito includes user data in the events that it \
         publishes to Amazon Pinpoint analytics.\n"]
}
[@@ocaml.doc
  "The settings for Amazon Pinpoint analytics configuration. With an analytics configuration, your \
   application can collect user-activity metrics for user notifications with a Amazon Pinpoint \
   campaign.\n\n\
  \ Amazon Pinpoint isn't available in all Amazon Web Services Regions. For a list of available \
   Regions, see \
   {{:https://docs.aws.amazon.com/cognito/latest/developerguide/cognito-user-pools-pinpoint-integration.html#cognito-user-pools-find-region-mappings}Amazon \
   Cognito and Amazon Pinpoint Region availability}.\n\
  \ "]

type nonrec scope_type = string [@@ocaml.doc ""]

type nonrec scope_list_type = scope_type list [@@ocaml.doc ""]

type nonrec o_auth_flow_type =
  | Code [@ocaml.doc ""]
  | Implicit [@ocaml.doc ""]
  | Client_credentials [@ocaml.doc ""]
[@@ocaml.doc ""]

type nonrec o_auth_flows_type = o_auth_flow_type list [@@ocaml.doc ""]

type nonrec redirect_url_type = string [@@ocaml.doc ""]

type nonrec logout_ur_ls_list_type = redirect_url_type list [@@ocaml.doc ""]

type nonrec callback_ur_ls_list_type = redirect_url_type list [@@ocaml.doc ""]

type nonrec provider_name_type = string [@@ocaml.doc ""]

type nonrec supported_identity_providers_list_type = provider_name_type list [@@ocaml.doc ""]

type nonrec explicit_auth_flows_type =
  | ADMIN_NO_SRP_AUTH [@ocaml.doc ""]
  | CUSTOM_AUTH_FLOW_ONLY [@ocaml.doc ""]
  | USER_PASSWORD_AUTH [@ocaml.doc ""]
  | ALLOW_ADMIN_USER_PASSWORD_AUTH [@ocaml.doc ""]
  | ALLOW_CUSTOM_AUTH [@ocaml.doc ""]
  | ALLOW_USER_PASSWORD_AUTH [@ocaml.doc ""]
  | ALLOW_USER_SRP_AUTH [@ocaml.doc ""]
  | ALLOW_REFRESH_TOKEN_AUTH [@ocaml.doc ""]
  | ALLOW_USER_AUTH [@ocaml.doc ""]
[@@ocaml.doc ""]

type nonrec explicit_auth_flows_list_type = explicit_auth_flows_type list [@@ocaml.doc ""]

type nonrec client_permission_type = string [@@ocaml.doc ""]

type nonrec client_permission_list_type = client_permission_type list [@@ocaml.doc ""]

type nonrec time_units_type =
  | SECONDS [@ocaml.doc ""]
  | MINUTES [@ocaml.doc ""]
  | HOURS [@ocaml.doc ""]
  | DAYS [@ocaml.doc ""]
[@@ocaml.doc ""]

type nonrec token_validity_units_type = {
  access_token : time_units_type option;
      [@ocaml.doc
        " A time unit for the value that you set in the [AccessTokenValidity] parameter. The \
         default [AccessTokenValidity] time unit is [hours]. [AccessTokenValidity] duration can \
         range from five minutes to one day.\n"]
  id_token : time_units_type option;
      [@ocaml.doc
        "A time unit for the value that you set in the [IdTokenValidity] parameter. The default \
         [IdTokenValidity] time unit is [hours]. [IdTokenValidity] duration can range from five \
         minutes to one day.\n"]
  refresh_token : time_units_type option;
      [@ocaml.doc
        "A time unit for the value that you set in the [RefreshTokenValidity] parameter. The \
         default [RefreshTokenValidity] time unit is [days]. [RefreshTokenValidity] duration can \
         range from 60 minutes to 10 years.\n"]
}
[@@ocaml.doc
  "The time units that, with [IdTokenValidity], [AccessTokenValidity], and [RefreshTokenValidity], \
   set and display the duration of ID, access, and refresh tokens for an app client. You can \
   assign a separate token validity unit to each type of token. \n"]

type nonrec id_token_validity_type = int [@@ocaml.doc ""]

type nonrec access_token_validity_type = int [@@ocaml.doc ""]

type nonrec refresh_token_validity_type = int [@@ocaml.doc ""]

type nonrec date_type = Smaws_Lib.CoreTypes.Timestamp.t [@@ocaml.doc ""]

type nonrec client_secret_type = string [@@ocaml.doc ""]

type nonrec client_id_type = string [@@ocaml.doc ""]

type nonrec client_name_type = string [@@ocaml.doc ""]

type nonrec user_pool_client_type = {
  user_pool_id : user_pool_id_type option;
      [@ocaml.doc "The ID of the user pool associated with the app client.\n"]
  client_name : client_name_type option; [@ocaml.doc "The name of the app client.\n"]
  client_id : client_id_type option; [@ocaml.doc "The ID of the app client.\n"]
  client_secret : client_secret_type option; [@ocaml.doc "The app client secret.\n"]
  last_modified_date : date_type option;
      [@ocaml.doc
        "The date and time when the item was modified. Amazon Cognito returns this timestamp in \
         UNIX epoch time format. Your SDK might render the output in a human-readable format like \
         ISO 8601 or a Java [Date] object.\n"]
  creation_date : date_type option;
      [@ocaml.doc
        "The date and time when the item was created. Amazon Cognito returns this timestamp in \
         UNIX epoch time format. Your SDK might render the output in a human-readable format like \
         ISO 8601 or a Java [Date] object.\n"]
  refresh_token_validity : refresh_token_validity_type option;
      [@ocaml.doc
        "The refresh token time limit. After this limit expires, your user can't use their refresh \
         token. To specify the time unit for [RefreshTokenValidity] as [seconds], [minutes], \
         [hours], or [days], set a [TokenValidityUnits] value in your API request.\n\n\
        \ For example, when you set [RefreshTokenValidity] as [10] and [TokenValidityUnits] as \
         [days], your user can refresh their session and retrieve new access and ID tokens for 10 \
         days.\n\
        \ \n\
        \  The default time unit for [RefreshTokenValidity] in an API request is days. You can't \
         set [RefreshTokenValidity] to 0. If you do, Amazon Cognito overrides the value with the \
         default value of 30 days. {i Valid range} is displayed below in seconds.\n\
        \  \n\
        \   If you don't specify otherwise in the configuration of your app client, your refresh \
         tokens are valid for 30 days.\n\
        \   "]
  access_token_validity : access_token_validity_type option;
      [@ocaml.doc
        "The access token time limit. After this limit expires, your user can't use their access \
         token. To specify the time unit for [AccessTokenValidity] as [seconds], [minutes], \
         [hours], or [days], set a [TokenValidityUnits] value in your API request.\n\n\
        \ For example, when you set [AccessTokenValidity] to [10] and [TokenValidityUnits] to \
         [hours], your user can authorize access with their access token for 10 hours.\n\
        \ \n\
        \  The default time unit for [AccessTokenValidity] in an API request is hours. {i Valid \
         range} is displayed below in seconds.\n\
        \  \n\
        \   If you don't specify otherwise in the configuration of your app client, your access \
         tokens are valid for one hour.\n\
        \   "]
  id_token_validity : id_token_validity_type option;
      [@ocaml.doc
        "The ID token time limit. After this limit expires, your user can't use their ID token. To \
         specify the time unit for [IdTokenValidity] as [seconds], [minutes], [hours], or [days], \
         set a [TokenValidityUnits] value in your API request.\n\n\
        \ For example, when you set [IdTokenValidity] as [10] and [TokenValidityUnits] as [hours], \
         your user can authenticate their session with their ID token for 10 hours.\n\
        \ \n\
        \  The default time unit for [IdTokenValidity] in an API request is hours. {i Valid range} \
         is displayed below in seconds.\n\
        \  \n\
        \   If you don't specify otherwise in the configuration of your app client, your ID tokens \
         are valid for one hour.\n\
        \   "]
  token_validity_units : token_validity_units_type option;
      [@ocaml.doc
        "The time units that, with [IdTokenValidity], [AccessTokenValidity], and \
         [RefreshTokenValidity], set and display the duration of ID, access, and refresh tokens \
         for an app client. You can assign a separate token validity unit to each type of token. \n"]
  read_attributes : client_permission_list_type option;
      [@ocaml.doc
        "The list of user attributes that you want your app client to have read access to. After \
         your user authenticates in your app, their access token authorizes them to read their own \
         attribute value for any attribute in this list.\n\n\
        \ When you don't specify the [ReadAttributes] for your app client, your app can read the \
         values of [email_verified], [phone_number_verified], and the standard attributes of your \
         user pool. When your user pool app client has read access to these default attributes, \
         [ReadAttributes] doesn't return any information. Amazon Cognito only populates \
         [ReadAttributes] in the API response if you have specified your own custom set of read \
         attributes.\n\
        \ "]
  write_attributes : client_permission_list_type option;
      [@ocaml.doc
        "The list of user attributes that you want your app client to have write access to. After \
         your user authenticates in your app, their access token authorizes them to set or modify \
         their own attribute value for any attribute in this list.\n\n\
        \ When you don't specify the [WriteAttributes] for your app client, your app can write the \
         values of the Standard attributes of your user pool. When your user pool has write access \
         to these default attributes, [WriteAttributes] doesn't return any information. Amazon \
         Cognito only populates [WriteAttributes] in the API response if you have specified your \
         own custom set of write attributes.\n\
        \ \n\
        \  If your app client allows users to sign in through an IdP, this array must include all \
         attributes that you have mapped to IdP attributes. Amazon Cognito updates mapped \
         attributes when users sign in to your application through an IdP. If your app client does \
         not have write access to a mapped attribute, Amazon Cognito throws an error when it tries \
         to update the attribute. For more information, see \
         {{:https://docs.aws.amazon.com/cognito/latest/developerguide/cognito-user-pools-specifying-attribute-mapping.html}Specifying \
         IdP Attribute Mappings for Your user pool}.\n\
        \  "]
  explicit_auth_flows : explicit_auth_flows_list_type option;
      [@ocaml.doc
        "The \
         {{:https://docs.aws.amazon.com/cognito/latest/developerguide/amazon-cognito-user-pools-authentication-flow-methods.html}authentication \
         flows} that you want your user pool client to support. For each app client in your user \
         pool, you can sign in your users with any combination of one or more flows, including \
         with a user name and Secure Remote Password (SRP), a user name and password, or a custom \
         authentication process that you define with Lambda functions.\n\n\
        \  If you don't specify a value for [ExplicitAuthFlows], your app client supports \
         [ALLOW_REFRESH_TOKEN_AUTH], [ALLOW_USER_SRP_AUTH], and [ALLOW_CUSTOM_AUTH]. \n\
        \  \n\
        \    The values for authentication flow options include the following.\n\
        \    \n\
        \     {ul\n\
        \           {-   [ALLOW_USER_AUTH]: Enable selection-based sign-in with [USER_AUTH]. This \
         setting covers username-password, secure remote password (SRP), passwordless, and passkey \
         authentication. This authentiation flow can do username-password and SRP authentication \
         without other [ExplicitAuthFlows] permitting them. For example users can complete an SRP \
         challenge through [USER_AUTH] without the flow [USER_SRP_AUTH] being active for the app \
         client. This flow doesn't include [CUSTOM_AUTH]. \n\
        \               \n\
        \                To activate this setting, your user pool must be in the \
         {{:https://docs.aws.amazon.com/cognito/latest/developerguide/feature-plans-features-essentials.html} \
         Essentials tier} or higher.\n\
        \                \n\
        \                 }\n\
        \           {-   [ALLOW_ADMIN_USER_PASSWORD_AUTH]: Enable admin based user password \
         authentication flow [ADMIN_USER_PASSWORD_AUTH]. This setting replaces the \
         [ADMIN_NO_SRP_AUTH] setting. With this authentication flow, your app passes a user name \
         and password to Amazon Cognito in the request, instead of using the Secure Remote \
         Password (SRP) protocol to securely transmit the password.\n\
        \               \n\
        \                }\n\
        \           {-   [ALLOW_CUSTOM_AUTH]: Enable Lambda trigger based authentication.\n\
        \               \n\
        \                }\n\
        \           {-   [ALLOW_USER_PASSWORD_AUTH]: Enable user password-based authentication. In \
         this flow, Amazon Cognito receives the password in the request instead of using the SRP \
         protocol to verify passwords.\n\
        \               \n\
        \                }\n\
        \           {-   [ALLOW_USER_SRP_AUTH]: Enable SRP-based authentication.\n\
        \               \n\
        \                }\n\
        \           {-   [ALLOW_REFRESH_TOKEN_AUTH]: Enable authflow to refresh tokens.\n\
        \               \n\
        \                }\n\
        \           }\n\
        \   In some environments, you will see the values [ADMIN_NO_SRP_AUTH], \
         [CUSTOM_AUTH_FLOW_ONLY], or [USER_PASSWORD_AUTH]. You can't assign these legacy \
         [ExplicitAuthFlows] values to user pool clients at the same time as values that begin \
         with [ALLOW_], like [ALLOW_USER_SRP_AUTH].\n\
        \   "]
  supported_identity_providers : supported_identity_providers_list_type option;
      [@ocaml.doc
        "A list of provider names for the identity providers (IdPs) that are supported on this \
         client. The following are supported: [COGNITO], [Facebook], [Google], [SignInWithApple], \
         and [LoginWithAmazon]. You can also specify the names that you configured for the SAML \
         and OIDC IdPs in your user pool, for example [MySAMLIdP] or [MyOIDCIdP].\n\n\
        \ This parameter sets the IdPs that \
         {{:https://docs.aws.amazon.com/cognito/latest/developerguide/cognito-user-pools-managed-login.html}managed \
         login} will display on the login page for your app client. The removal of [COGNITO] from \
         this list doesn't prevent authentication operations for local users with the user pools \
         API in an Amazon Web Services SDK. The only way to prevent SDK-based authentication is to \
         block access with a \
         {{:https://docs.aws.amazon.com/cognito/latest/developerguide/user-pool-waf.html}WAF \
         rule}. \n\
        \ "]
  callback_ur_ls : callback_ur_ls_list_type option;
      [@ocaml.doc
        "A list of allowed redirect (callback) URLs for the IdPs.\n\n\
        \ A redirect URI must:\n\
        \ \n\
        \  {ul\n\
        \        {-  Be an absolute URI.\n\
        \            \n\
        \             }\n\
        \        {-  Be registered with the authorization server.\n\
        \            \n\
        \             }\n\
        \        {-  Not include a fragment component.\n\
        \            \n\
        \             }\n\
        \        }\n\
        \   See {{:https://tools.ietf.org/html/rfc6749#section-3.1.2}OAuth 2.0 - Redirection \
         Endpoint}.\n\
        \   \n\
        \    Amazon Cognito requires HTTPS over HTTP for callback URLs to [http://localhost], \
         [http://127.0.0.1] and [http://\\[::1\\]]. These callback URLs are for testing purposes \
         only. You can specify custom TCP ports for your callback URLs.\n\
        \    \n\
        \     App callback URLs such as myapp://example are also supported.\n\
        \     "]
  logout_ur_ls : logout_ur_ls_list_type option;
      [@ocaml.doc "A list of allowed logout URLs for the IdPs.\n"]
  default_redirect_ur_i : redirect_url_type option;
      [@ocaml.doc
        "The default redirect URI. Must be in the [CallbackURLs] list.\n\n\
        \ A redirect URI must:\n\
        \ \n\
        \  {ul\n\
        \        {-  Be an absolute URI.\n\
        \            \n\
        \             }\n\
        \        {-  Be registered with the authorization server.\n\
        \            \n\
        \             }\n\
        \        {-  Not include a fragment component.\n\
        \            \n\
        \             }\n\
        \        }\n\
        \   See {{:https://tools.ietf.org/html/rfc6749#section-3.1.2}OAuth 2.0 - Redirection \
         Endpoint}.\n\
        \   \n\
        \    Amazon Cognito requires HTTPS over HTTP for callback URLs to [http://localhost], \
         [http://127.0.0.1] and [http://\\[::1\\]]. These callback URLs are for testing purposes \
         only. You can specify custom TCP ports for your callback URLs.\n\
        \    \n\
        \     App callback URLs such as myapp://example are also supported.\n\
        \     "]
  allowed_o_auth_flows : o_auth_flows_type option;
      [@ocaml.doc
        "The OAuth grant types that you want your app client to generate. To create an app client \
         that generates client credentials grants, you must add [client_credentials] as the only \
         allowed OAuth flow.\n\n\
        \  code  Use a code grant flow, which provides an authorization code as the response. This \
         code can be exchanged for access tokens with the [/oauth2/token] endpoint.\n\
        \        \n\
        \          implicit  Issue the access token (and, optionally, ID token, based on scopes) \
         directly to your user.\n\
        \                    \n\
        \                      client_credentials  Issue the access token from the [/oauth2/token] \
         endpoint directly to a non-person user using a combination of the client ID and client \
         secret.\n\
        \                                          \n\
        \                                            "]
  allowed_o_auth_scopes : scope_list_type option;
      [@ocaml.doc
        "The OAuth 2.0 scopes that you want your app client to support. Can include standard OAuth \
         scopes like [phone], [email], [openid], and [profile]. Can also include the \
         [aws.cognito.signin.user.admin] scope that authorizes user profile self-service \
         operations and custom scopes from resource servers.\n"]
  allowed_o_auth_flows_user_pool_client : boolean_type option;
      [@ocaml.doc
        "Set to [true] to use OAuth 2.0 authorization server features in your app client.\n\n\
        \ This parameter must have a value of [true] before you can configure the following \
         features in your app client.\n\
        \ \n\
        \  {ul\n\
        \        {-   [CallBackURLs]: Callback URLs.\n\
        \            \n\
        \             }\n\
        \        {-   [LogoutURLs]: Sign-out redirect URLs.\n\
        \            \n\
        \             }\n\
        \        {-   [AllowedOAuthScopes]: OAuth 2.0 scopes.\n\
        \            \n\
        \             }\n\
        \        {-   [AllowedOAuthFlows]: Support for authorization code, implicit, and client \
         credentials OAuth 2.0 grants.\n\
        \            \n\
        \             }\n\
        \        }\n\
        \   To use authorization server features, configure one of these features in the Amazon \
         Cognito console or set [AllowedOAuthFlowsUserPoolClient] to [true] in a \
         [CreateUserPoolClient] or [UpdateUserPoolClient] API request. If you don't set a value \
         for [AllowedOAuthFlowsUserPoolClient] in a request with the CLI or SDKs, it defaults to \
         [false]. When [false], only SDK-based API sign-in is permitted.\n\
        \   "]
  analytics_configuration : analytics_configuration_type option;
      [@ocaml.doc
        "The user pool analytics configuration for collecting metrics and sending them to your \
         Amazon Pinpoint campaign.\n\n\
        \  In Amazon Web Services Regions where Amazon Pinpoint isn't available, user pools only \
         support sending events to Amazon Pinpoint projects in Amazon Web Services Region \
         us-east-1. In Regions where Amazon Pinpoint is available, user pools support sending \
         events to Amazon Pinpoint projects within that same Region.\n\
        \  \n\
        \   "]
  prevent_user_existence_errors : prevent_user_existence_error_types option;
      [@ocaml.doc
        "When [ENABLED], suppresses messages that might indicate a valid user exists when someone \
         attempts sign-in. This parameters sets your preference for the errors and responses that \
         you want Amazon Cognito APIs to return during authentication, account confirmation, and \
         password recovery when the user doesn't exist in the user pool. When set to [ENABLED] and \
         the user doesn't exist, authentication returns an error indicating either the username or \
         password was incorrect. Account confirmation and password recovery return a response \
         indicating a code was sent to a simulated destination. When set to [LEGACY], those APIs \
         return a [UserNotFoundException] exception if the user doesn't exist in the user pool.\n\n\
        \ Defaults to [LEGACY].\n\
        \ "]
  enable_token_revocation : wrapped_boolean_type option;
      [@ocaml.doc
        "Indicates whether token revocation is activated for the user pool client. When you create \
         a new user pool client, token revocation is activated by default.\n"]
  enable_propagate_additional_user_context_data : wrapped_boolean_type option;
      [@ocaml.doc
        "When [EnablePropagateAdditionalUserContextData] is true, Amazon Cognito accepts an \
         [IpAddress] value that you send in the [UserContextData] parameter. The [UserContextData] \
         parameter sends information to Amazon Cognito threat protection for risk analysis. You \
         can send [UserContextData] when you sign in Amazon Cognito native users with the \
         [InitiateAuth] and [RespondToAuthChallenge] API operations.\n\n\
        \ When [EnablePropagateAdditionalUserContextData] is false, you can't send your user's \
         source IP address to Amazon Cognito threat protection with unauthenticated API \
         operations. [EnablePropagateAdditionalUserContextData] doesn't affect whether you can \
         send a source IP address in a [ContextData] parameter with the authenticated API \
         operations [AdminInitiateAuth] and [AdminRespondToAuthChallenge].\n\
        \ \n\
        \  You can only activate [EnablePropagateAdditionalUserContextData] in an app client that \
         has a client secret. For more information about propagation of user context data, see \
         {{:https://docs.aws.amazon.com/cognito/latest/developerguide/cognito-user-pool-settings-adaptive-authentication.html#user-pool-settings-adaptive-authentication-device-fingerprint}Adding \
         user device and session data to API requests}.\n\
        \  "]
  auth_session_validity : auth_session_validity_type option;
      [@ocaml.doc
        "Amazon Cognito creates a session token for each API request in an authentication flow. \
         [AuthSessionValidity] is the duration, in minutes, of that session token. Your user pool \
         native user must respond to each authentication challenge before the session expires.\n"]
  refresh_token_rotation : refresh_token_rotation_type option;
      [@ocaml.doc
        "The configuration of your app client for refresh token rotation. When enabled, your app \
         client issues new ID, access, and refresh tokens when users renew their sessions with \
         refresh tokens. When disabled, token refresh issues only ID and access tokens.\n"]
}
[@@ocaml.doc "The configuration of a user pool client.\n"]

type nonrec update_user_pool_client_response = {
  user_pool_client : user_pool_client_type option;
      [@ocaml.doc "The updated details of your app client.\n"]
}
[@@ocaml.doc
  "Represents the response from the server to the request to update the user pool client.\n"]

type nonrec update_user_pool_client_request = {
  user_pool_id : user_pool_id_type;
      [@ocaml.doc "The ID of the user pool where you want to update the app client.\n"]
  client_id : client_id_type; [@ocaml.doc "The ID of the app client that you want to update.\n"]
  client_name : client_name_type option; [@ocaml.doc "A friendly name for the app client.\n"]
  refresh_token_validity : refresh_token_validity_type option;
      [@ocaml.doc
        "The refresh token time limit. After this limit expires, your user can't use their refresh \
         token. To specify the time unit for [RefreshTokenValidity] as [seconds], [minutes], \
         [hours], or [days], set a [TokenValidityUnits] value in your API request.\n\n\
        \ For example, when you set [RefreshTokenValidity] as [10] and [TokenValidityUnits] as \
         [days], your user can refresh their session and retrieve new access and ID tokens for 10 \
         days.\n\
        \ \n\
        \  The default time unit for [RefreshTokenValidity] in an API request is days. You can't \
         set [RefreshTokenValidity] to 0. If you do, Amazon Cognito overrides the value with the \
         default value of 30 days. {i Valid range} is displayed below in seconds.\n\
        \  \n\
        \   If you don't specify otherwise in the configuration of your app client, your refresh \
         tokens are valid for 30 days.\n\
        \   "]
  access_token_validity : access_token_validity_type option;
      [@ocaml.doc
        "The access token time limit. After this limit expires, your user can't use their access \
         token. To specify the time unit for [AccessTokenValidity] as [seconds], [minutes], \
         [hours], or [days], set a [TokenValidityUnits] value in your API request.\n\n\
        \ For example, when you set [AccessTokenValidity] to [10] and [TokenValidityUnits] to \
         [hours], your user can authorize access with their access token for 10 hours.\n\
        \ \n\
        \  The default time unit for [AccessTokenValidity] in an API request is hours. {i Valid \
         range} is displayed below in seconds.\n\
        \  \n\
        \   If you don't specify otherwise in the configuration of your app client, your access \
         tokens are valid for one hour.\n\
        \   "]
  id_token_validity : id_token_validity_type option;
      [@ocaml.doc
        "The ID token time limit. After this limit expires, your user can't use their ID token. To \
         specify the time unit for [IdTokenValidity] as [seconds], [minutes], [hours], or [days], \
         set a [TokenValidityUnits] value in your API request.\n\n\
        \ For example, when you set [IdTokenValidity] as [10] and [TokenValidityUnits] as [hours], \
         your user can authenticate their session with their ID token for 10 hours.\n\
        \ \n\
        \  The default time unit for [IdTokenValidity] in an API request is hours. {i Valid range} \
         is displayed below in seconds.\n\
        \  \n\
        \   If you don't specify otherwise in the configuration of your app client, your ID tokens \
         are valid for one hour.\n\
        \   "]
  token_validity_units : token_validity_units_type option;
      [@ocaml.doc
        "The units that validity times are represented in. The default unit for refresh tokens is \
         days, and the default for ID and access tokens are hours.\n"]
  read_attributes : client_permission_list_type option;
      [@ocaml.doc
        "The list of user attributes that you want your app client to have read access to. After \
         your user authenticates in your app, their access token authorizes them to read their own \
         attribute value for any attribute in this list.\n\n\
        \ When you don't specify the [ReadAttributes] for your app client, your app can read the \
         values of [email_verified], [phone_number_verified], and the standard attributes of your \
         user pool. When your user pool app client has read access to these default attributes, \
         [ReadAttributes] doesn't return any information. Amazon Cognito only populates \
         [ReadAttributes] in the API response if you have specified your own custom set of read \
         attributes.\n\
        \ "]
  write_attributes : client_permission_list_type option;
      [@ocaml.doc
        "The list of user attributes that you want your app client to have write access to. After \
         your user authenticates in your app, their access token authorizes them to set or modify \
         their own attribute value for any attribute in this list.\n\n\
        \ When you don't specify the [WriteAttributes] for your app client, your app can write the \
         values of the Standard attributes of your user pool. When your user pool has write access \
         to these default attributes, [WriteAttributes] doesn't return any information. Amazon \
         Cognito only populates [WriteAttributes] in the API response if you have specified your \
         own custom set of write attributes.\n\
        \ \n\
        \  If your app client allows users to sign in through an IdP, this array must include all \
         attributes that you have mapped to IdP attributes. Amazon Cognito updates mapped \
         attributes when users sign in to your application through an IdP. If your app client does \
         not have write access to a mapped attribute, Amazon Cognito throws an error when it tries \
         to update the attribute. For more information, see \
         {{:https://docs.aws.amazon.com/cognito/latest/developerguide/cognito-user-pools-specifying-attribute-mapping.html}Specifying \
         IdP Attribute Mappings for Your user pool}.\n\
        \  "]
  explicit_auth_flows : explicit_auth_flows_list_type option;
      [@ocaml.doc
        "The \
         {{:https://docs.aws.amazon.com/cognito/latest/developerguide/amazon-cognito-user-pools-authentication-flow-methods.html}authentication \
         flows} that you want your user pool client to support. For each app client in your user \
         pool, you can sign in your users with any combination of one or more flows, including \
         with a user name and Secure Remote Password (SRP), a user name and password, or a custom \
         authentication process that you define with Lambda functions.\n\n\
        \  If you don't specify a value for [ExplicitAuthFlows], your app client supports \
         [ALLOW_REFRESH_TOKEN_AUTH], [ALLOW_USER_SRP_AUTH], and [ALLOW_CUSTOM_AUTH]. \n\
        \  \n\
        \    The values for authentication flow options include the following.\n\
        \    \n\
        \     {ul\n\
        \           {-   [ALLOW_USER_AUTH]: Enable selection-based sign-in with [USER_AUTH]. This \
         setting covers username-password, secure remote password (SRP), passwordless, and passkey \
         authentication. This authentiation flow can do username-password and SRP authentication \
         without other [ExplicitAuthFlows] permitting them. For example users can complete an SRP \
         challenge through [USER_AUTH] without the flow [USER_SRP_AUTH] being active for the app \
         client. This flow doesn't include [CUSTOM_AUTH]. \n\
        \               \n\
        \                To activate this setting, your user pool must be in the \
         {{:https://docs.aws.amazon.com/cognito/latest/developerguide/feature-plans-features-essentials.html} \
         Essentials tier} or higher.\n\
        \                \n\
        \                 }\n\
        \           {-   [ALLOW_ADMIN_USER_PASSWORD_AUTH]: Enable admin based user password \
         authentication flow [ADMIN_USER_PASSWORD_AUTH]. This setting replaces the \
         [ADMIN_NO_SRP_AUTH] setting. With this authentication flow, your app passes a user name \
         and password to Amazon Cognito in the request, instead of using the Secure Remote \
         Password (SRP) protocol to securely transmit the password.\n\
        \               \n\
        \                }\n\
        \           {-   [ALLOW_CUSTOM_AUTH]: Enable Lambda trigger based authentication.\n\
        \               \n\
        \                }\n\
        \           {-   [ALLOW_USER_PASSWORD_AUTH]: Enable user password-based authentication. In \
         this flow, Amazon Cognito receives the password in the request instead of using the SRP \
         protocol to verify passwords.\n\
        \               \n\
        \                }\n\
        \           {-   [ALLOW_USER_SRP_AUTH]: Enable SRP-based authentication.\n\
        \               \n\
        \                }\n\
        \           {-   [ALLOW_REFRESH_TOKEN_AUTH]: Enable authflow to refresh tokens.\n\
        \               \n\
        \                }\n\
        \           }\n\
        \   In some environments, you will see the values [ADMIN_NO_SRP_AUTH], \
         [CUSTOM_AUTH_FLOW_ONLY], or [USER_PASSWORD_AUTH]. You can't assign these legacy \
         [ExplicitAuthFlows] values to user pool clients at the same time as values that begin \
         with [ALLOW_], like [ALLOW_USER_SRP_AUTH].\n\
        \   "]
  supported_identity_providers : supported_identity_providers_list_type option;
      [@ocaml.doc
        "A list of provider names for the identity providers (IdPs) that are supported on this \
         client. The following are supported: [COGNITO], [Facebook], [Google], [SignInWithApple], \
         and [LoginWithAmazon]. You can also specify the names that you configured for the SAML \
         and OIDC IdPs in your user pool, for example [MySAMLIdP] or [MyOIDCIdP].\n\n\
        \ This parameter sets the IdPs that \
         {{:https://docs.aws.amazon.com/cognito/latest/developerguide/cognito-user-pools-managed-login.html}managed \
         login} will display on the login page for your app client. The removal of [COGNITO] from \
         this list doesn't prevent authentication operations for local users with the user pools \
         API in an Amazon Web Services SDK. The only way to prevent SDK-based authentication is to \
         block access with a \
         {{:https://docs.aws.amazon.com/cognito/latest/developerguide/user-pool-waf.html}WAF \
         rule}. \n\
        \ "]
  callback_ur_ls : callback_ur_ls_list_type option;
      [@ocaml.doc
        "A list of allowed redirect, or callback, URLs for managed login authentication. These \
         URLs are the paths where you want to send your users' browsers after they complete \
         authentication with managed login or a third-party IdP. Typically, callback URLs are the \
         home of an application that uses OAuth or OIDC libraries to process authentication \
         outcomes.\n\n\
        \ A redirect URI must meet the following requirements:\n\
        \ \n\
        \  {ul\n\
        \        {-  Be an absolute URI.\n\
        \            \n\
        \             }\n\
        \        {-  Be registered with the authorization server. Amazon Cognito doesn't accept \
         authorization requests with [redirect_uri] values that aren't in the list of \
         [CallbackURLs] that you provide in this parameter.\n\
        \            \n\
        \             }\n\
        \        {-  Not include a fragment component.\n\
        \            \n\
        \             }\n\
        \        }\n\
        \   See {{:https://tools.ietf.org/html/rfc6749#section-3.1.2}OAuth 2.0 - Redirection \
         Endpoint}.\n\
        \   \n\
        \    Amazon Cognito requires HTTPS over HTTP except for http://localhost for testing \
         purposes only.\n\
        \    \n\
        \     App callback URLs such as [myapp://example] are also supported.\n\
        \     "]
  logout_ur_ls : logout_ur_ls_list_type option;
      [@ocaml.doc
        "A list of allowed logout URLs for managed login authentication. When you pass \
         [logout_uri] and [client_id] parameters to [/logout], Amazon Cognito signs out your user \
         and redirects them to the logout URL. This parameter describes the URLs that you want to \
         be the permitted targets of [logout_uri]. A typical use of these URLs is when a user \
         selects \"Sign out\" and you redirect them to your public homepage. For more information, \
         see \
         {{:https://docs.aws.amazon.com/cognito/latest/developerguide/logout-endpoint.html}Logout \
         endpoint}.\n"]
  default_redirect_ur_i : redirect_url_type option;
      [@ocaml.doc
        "The default redirect URI. In app clients with one assigned IdP, replaces [redirect_uri] \
         in authentication requests. Must be in the [CallbackURLs] list.\n"]
  allowed_o_auth_flows : o_auth_flows_type option;
      [@ocaml.doc
        "The OAuth grant types that you want your app client to generate. To create an app client \
         that generates client credentials grants, you must add [client_credentials] as the only \
         allowed OAuth flow.\n\n\
        \  code  Use a code grant flow, which provides an authorization code as the response. This \
         code can be exchanged for access tokens with the [/oauth2/token] endpoint.\n\
        \        \n\
        \          implicit  Issue the access token (and, optionally, ID token, based on scopes) \
         directly to your user.\n\
        \                    \n\
        \                      client_credentials  Issue the access token from the [/oauth2/token] \
         endpoint directly to a non-person user using a combination of the client ID and client \
         secret.\n\
        \                                          \n\
        \                                            "]
  allowed_o_auth_scopes : scope_list_type option;
      [@ocaml.doc
        "The OAuth, OpenID Connect (OIDC), and custom scopes that you want to permit your app \
         client to authorize access with. Scopes govern access control to user pool self-service \
         API operations, user data from the [userInfo] endpoint, and third-party APIs. Scope \
         values include [phone], [email], [openid], and [profile]. The \
         [aws.cognito.signin.user.admin] scope authorizes user self-service operations. Custom \
         scopes with resource servers authorize access to external APIs.\n"]
  allowed_o_auth_flows_user_pool_client : boolean_type option;
      [@ocaml.doc
        "Set to [true] to use OAuth 2.0 authorization server features in your app client.\n\n\
        \ This parameter must have a value of [true] before you can configure the following \
         features in your app client.\n\
        \ \n\
        \  {ul\n\
        \        {-   [CallBackURLs]: Callback URLs.\n\
        \            \n\
        \             }\n\
        \        {-   [LogoutURLs]: Sign-out redirect URLs.\n\
        \            \n\
        \             }\n\
        \        {-   [AllowedOAuthScopes]: OAuth 2.0 scopes.\n\
        \            \n\
        \             }\n\
        \        {-   [AllowedOAuthFlows]: Support for authorization code, implicit, and client \
         credentials OAuth 2.0 grants.\n\
        \            \n\
        \             }\n\
        \        }\n\
        \   To use authorization server features, configure one of these features in the Amazon \
         Cognito console or set [AllowedOAuthFlowsUserPoolClient] to [true] in a \
         [CreateUserPoolClient] or [UpdateUserPoolClient] API request. If you don't set a value \
         for [AllowedOAuthFlowsUserPoolClient] in a request with the CLI or SDKs, it defaults to \
         [false]. When [false], only SDK-based API sign-in is permitted.\n\
        \   "]
  analytics_configuration : analytics_configuration_type option;
      [@ocaml.doc
        "The user pool analytics configuration for collecting metrics and sending them to your \
         Amazon Pinpoint campaign.\n\n\
        \ In Amazon Web Services Regions where Amazon Pinpoint isn't available, user pools might \
         not have access to analytics or might be configurable with campaigns in the US East (N. \
         Virginia) Region. For more information, see \
         {{:https://docs.aws.amazon.com/cognito/latest/developerguide/cognito-user-pools-pinpoint-integration.html}Using \
         Amazon Pinpoint analytics}.\n\
        \ "]
  prevent_user_existence_errors : prevent_user_existence_error_types option;
      [@ocaml.doc
        "When [ENABLED], suppresses messages that might indicate a valid user exists when someone \
         attempts sign-in. This parameters sets your preference for the errors and responses that \
         you want Amazon Cognito APIs to return during authentication, account confirmation, and \
         password recovery when the user doesn't exist in the user pool. When set to [ENABLED] and \
         the user doesn't exist, authentication returns an error indicating either the username or \
         password was incorrect. Account confirmation and password recovery return a response \
         indicating a code was sent to a simulated destination. When set to [LEGACY], those APIs \
         return a [UserNotFoundException] exception if the user doesn't exist in the user pool.\n\n\
        \ Defaults to [LEGACY].\n\
        \ "]
  enable_token_revocation : wrapped_boolean_type option;
      [@ocaml.doc
        "Activates or deactivates \
         {{:https://docs.aws.amazon.com/cognito/latest/developerguide/token-revocation.html}token \
         revocation} in the target app client.\n"]
  enable_propagate_additional_user_context_data : wrapped_boolean_type option;
      [@ocaml.doc
        "When [true], your application can include additional [UserContextData] in authentication \
         requests. This data includes the IP address, and contributes to analysis by threat \
         protection features. For more information about propagation of user context data, see \
         {{:https://docs.aws.amazon.com/cognito/latest/developerguide/cognito-user-pool-settings-adaptive-authentication.html#user-pool-settings-adaptive-authentication-device-fingerprint}Adding \
         session data to API requests}. If you don\226\128\153t include this parameter, you can't \
         send the source IP address to Amazon Cognito threat protection features. You can only \
         activate [EnablePropagateAdditionalUserContextData] in an app client that has a client \
         secret.\n"]
  auth_session_validity : auth_session_validity_type option;
      [@ocaml.doc
        "Amazon Cognito creates a session token for each API request in an authentication flow. \
         [AuthSessionValidity] is the duration, in minutes, of that session token. Your user pool \
         native user must respond to each authentication challenge before the session expires.\n"]
  refresh_token_rotation : refresh_token_rotation_type option;
      [@ocaml.doc
        "The configuration of your app client for refresh token rotation. When enabled, your app \
         client issues new ID, access, and refresh tokens when users renew their sessions with \
         refresh tokens. When disabled, token refresh issues only ID and access tokens.\n"]
}
[@@ocaml.doc "Represents the request to update the user pool client.\n"]

type nonrec user_pool_tagging_exception = { message : message_type option [@ocaml.doc ""] }
[@@ocaml.doc "This exception is thrown when a user pool tag can't be set or updated.\n"]

type nonrec user_import_in_progress_exception = {
  message : message_type option;
      [@ocaml.doc "The message returned when the user pool has an import job running.\n"]
}
[@@ocaml.doc
  "This exception is thrown when you're trying to modify a user pool while a user import job is in \
   progress for that pool.\n"]

type nonrec tier_change_not_allowed_exception = { message : message_type option [@ocaml.doc ""] }
[@@ocaml.doc
  "This exception is thrown when you've attempted to change your feature plan but the operation \
   isn't permitted.\n"]

type nonrec invalid_sms_role_trust_relationship_exception = {
  message : message_type option;
      [@ocaml.doc
        "The message returned when the role trust relationship for the SMS message is not valid.\n"]
}
[@@ocaml.doc
  "This exception is thrown when the trust relationship is not valid for the role provided for SMS \
   configuration. This can happen if you don't trust [cognito-idp.amazonaws.com] or the external \
   ID provided in the role does not match what is provided in the SMS configuration for the user \
   pool.\n"]

type nonrec invalid_sms_role_access_policy_exception = {
  message : message_type option;
      [@ocaml.doc
        "The message returned when the invalid SMS role access policy exception is thrown.\n"]
}
[@@ocaml.doc
  "This exception is returned when the role provided for SMS configuration doesn't have permission \
   to publish using Amazon SNS.\n"]

type nonrec invalid_email_role_access_policy_exception = {
  message : message_type option;
      [@ocaml.doc
        "The message returned when you have an unverified email address or the identity policy \
         isn't set on an email address that Amazon Cognito can access.\n"]
}
[@@ocaml.doc
  "This exception is thrown when Amazon Cognito isn't allowed to use your email identity. HTTP \
   status code: 400.\n"]

type nonrec update_user_pool_response = unit [@@ocaml.doc ""]

type nonrec issuer_type = ORIGINAL [@ocaml.doc ""] | UPDATED [@ocaml.doc ""] [@@ocaml.doc ""]

type nonrec issuer_configuration_type = {
  type_ : issuer_type option;
      [@ocaml.doc
        "The type of issuer configuration. Determines the token issuing behavior for the user \
         pool.\n\n\
        \  ORIGINAL  The original issuer configuration for user pools. The issuer URL is hosted in \
         the user pool\226\128\153s region and provides OIDC endpoints specific to that region.\n\
        \            \n\
        \             Original issuers have the format of \
         [https://cognito-idp.\\[region\\].amazonaws.com/\\[userPoolId\\]] \n\
        \             \n\
        \               UPDATED  Recommended for all user pools, including for multi-Region \
         replication. Updated issuers host the same JWKS content in multiple regions, resulting in \
         improved resilience and efficiency.\n\
        \                        \n\
        \                         Updated issuers have the format of \
         [https://issuer-cognito-idp.\\[region\\].amazonaws.com/\\[userPoolId\\]], where region is \
         the primary Amazon Web Services Region of your user pool.\n\
        \                         \n\
        \                           "]
}
[@@ocaml.doc
  "Specifies the issuer configuration for a user pool. Contains settings that determine how tokens \
   are issued and validated.\n"]

type nonrec encryption_key_arn_type = string [@@ocaml.doc ""]

type nonrec encryption_key_type =
  | AWS_OWNED_KEY [@ocaml.doc ""]
  | CUSTOMER_MANAGED_KEY [@ocaml.doc ""]
[@@ocaml.doc ""]

type nonrec key_configuration_type = {
  key_type : encryption_key_type option;
      [@ocaml.doc
        "The type of encryption key used for the user pool.\n\n\
        \  AWS_OWNED_KEY  A key owned by Amazon Web Services in Key Management Service.\n\
        \                 \n\
        \                   CUSTOMER_MANAGED_KEY  A key managed by the customer in Key Management \
         Service. You must use a multi-region key to enable multi-region replication for a user \
         pool.\n\
        \                                         \n\
        \                                           "]
  kms_key_arn : encryption_key_arn_type option;
      [@ocaml.doc
        "The Amazon Resource Name (ARN) of the KMS key used for encryption. If not specified, \
         Amazon Web Services managed keys are used.\n"]
}
[@@ocaml.doc
  "Specifies the key configuration for a user pool. Contains settings for encryption keys used to \
   secure user pool data.\n"]

type nonrec user_pool_tier_type =
  | LITE [@ocaml.doc ""]
  | ESSENTIALS [@ocaml.doc ""]
  | PLUS [@ocaml.doc ""]
[@@ocaml.doc ""]

type nonrec user_pool_name_type = string [@@ocaml.doc ""]

type nonrec recovery_option_name_type =
  | VERIFIED_EMAIL [@ocaml.doc ""]
  | VERIFIED_PHONE_NUMBER [@ocaml.doc ""]
  | ADMIN_ONLY [@ocaml.doc ""]
[@@ocaml.doc ""]

type nonrec priority_type = int [@@ocaml.doc ""]

type nonrec recovery_option_type = {
  priority : priority_type;
      [@ocaml.doc
        "Your priority preference for using the specified attribute in account recovery. The \
         highest priority is [1].\n"]
  name : recovery_option_name_type;
      [@ocaml.doc "The recovery method that this object sets a recovery option for.\n"]
}
[@@ocaml.doc
  "A recovery option for a user. The [AccountRecoverySettingType] data type is an array of this \
   object. Each [RecoveryOptionType] has a priority property that determines whether it is a \
   primary or secondary option.\n\n\
  \ For example, if [verified_email] has a priority of [1] and [verified_phone_number] has a \
   priority of [2], your user pool sends account-recovery messages to a verified email address but \
   falls back to an SMS message if the user has a verified phone number. The [admin_only] option \
   prevents self-service account recovery.\n\
  \ "]

type nonrec recovery_mechanisms_type = recovery_option_type list [@@ocaml.doc ""]

type nonrec account_recovery_setting_type = {
  recovery_mechanisms : recovery_mechanisms_type option;
      [@ocaml.doc
        "The list of options and priorities for user message delivery in forgot-password \
         operations. Sets or displays user pool preferences for email or SMS message priority, \
         whether users should fall back to a second delivery method, and whether passwords should \
         only be reset by administrators.\n"]
}
[@@ocaml.doc
  "The settings for user message delivery in forgot-password operations. Contains preference for \
   email or SMS message delivery of password reset codes, or for admin-only password reset.\n"]

type nonrec advanced_security_enabled_mode_type = AUDIT [@ocaml.doc ""] | ENFORCED [@ocaml.doc ""]
[@@ocaml.doc ""]

type nonrec advanced_security_additional_flows_type = {
  custom_auth_mode : advanced_security_enabled_mode_type option;
      [@ocaml.doc
        "The operating mode of threat protection in custom authentication with \
         {{:https://docs.aws.amazon.com/cognito/latest/developerguide/user-pool-lambda-challenge.html} \
         Custom authentication challenge Lambda triggers}. \n"]
}
[@@ocaml.doc
  "Threat protection configuration options for additional authentication types in your user pool, \
   including custom authentication. \n"]

type nonrec advanced_security_mode_type =
  | OFF [@ocaml.doc ""]
  | AUDIT [@ocaml.doc ""]
  | ENFORCED [@ocaml.doc ""]
[@@ocaml.doc ""]

type nonrec user_pool_add_ons_type = {
  advanced_security_mode : advanced_security_mode_type;
      [@ocaml.doc
        "The operating mode of threat protection for standard authentication types in your user \
         pool, including username-password and secure remote password (SRP) authentication. \n"]
  advanced_security_additional_flows : advanced_security_additional_flows_type option;
      [@ocaml.doc
        "Threat protection configuration options for additional authentication types in your user \
         pool, including custom authentication. \n"]
}
[@@ocaml.doc
  "Contains settings for activation of threat protection, including the operating mode and \
   additional authentication types. To log user security information but take no action, set to \
   [AUDIT]. To configure automatic security responses to potentially unwanted traffic to your user \
   pool, set to [ENFORCED].\n\n\
  \ For more information, see \
   {{:https://docs.aws.amazon.com/cognito/latest/developerguide/cognito-user-pool-settings-advanced-security.html}Adding \
   advanced security to a user pool}. To activate this setting, your user pool must be on the \
   {{:https://docs.aws.amazon.com/cognito/latest/developerguide/feature-plans-features-plus.html} \
   Plus tier}.\n\
  \ "]

type nonrec email_verification_subject_type = string [@@ocaml.doc ""]

type nonrec email_invite_message_type = string [@@ocaml.doc ""]

type nonrec sms_invite_message_type = string [@@ocaml.doc ""]

type nonrec message_template_type = {
  sms_message : sms_invite_message_type option;
      [@ocaml.doc "The message template for SMS messages.\n"]
  email_message : email_invite_message_type option;
      [@ocaml.doc
        "The message template for email messages. EmailMessage is allowed only if \
         {{:https://docs.aws.amazon.com/cognito-user-identity-pools/latest/APIReference/API_EmailConfigurationType.html#CognitoUserPools-Type-EmailConfigurationType-EmailSendingAccount}EmailSendingAccount} \
         is DEVELOPER. \n"]
  email_subject : email_verification_subject_type option;
      [@ocaml.doc
        "The subject line for email messages. EmailSubject is allowed only if \
         {{:https://docs.aws.amazon.com/cognito-user-identity-pools/latest/APIReference/API_EmailConfigurationType.html#CognitoUserPools-Type-EmailConfigurationType-EmailSendingAccount}EmailSendingAccount} \
         is DEVELOPER. \n"]
}
[@@ocaml.doc "The message template structure.\n"]

type nonrec admin_create_user_unused_account_validity_days_type = int [@@ocaml.doc ""]

type nonrec admin_create_user_config_type = {
  allow_admin_create_user_only : boolean_type option;
      [@ocaml.doc
        "The setting for allowing self-service sign-up. When [true], only administrators can \
         create new user profiles. When [false], users can register themselves and create a new \
         user profile with the [SignUp] operation.\n"]
  unused_account_validity_days : admin_create_user_unused_account_validity_days_type option;
      [@ocaml.doc
        "This parameter is no longer in use.\n\n\
        \ The password expiration limit in days for administrator-created users. When this time \
         expires, the user can't sign in with their temporary password. To reset the account after \
         that time limit, you must call [AdminCreateUser] again, specifying [RESEND] for the \
         [MessageAction] parameter. \n\
        \ \n\
        \  The default value for this parameter is 7.\n\
        \  "]
  invite_message_template : message_template_type option;
      [@ocaml.doc
        "The template for the welcome message to new users. This template must include the \
         [{####}] temporary password placeholder if you are creating users with passwords. If your \
         users don't have passwords, you can omit the placeholder.\n\n\
        \ See also \
         {{:https://docs.aws.amazon.com/cognito/latest/developerguide/cognito-user-pool-settings-message-customizations.html#cognito-user-pool-settings-user-invitation-message-customization}Customizing \
         User Invitation Messages}.\n\
        \ "]
}
[@@ocaml.doc
  "The settings for administrator creation of users in a user pool. Contains settings for allowing \
   user sign-up, customizing invitation messages to new users, and the amount of time before \
   temporary passwords expire.\n"]

type nonrec tag_value_type = string [@@ocaml.doc ""]

type nonrec tag_keys_type = string [@@ocaml.doc ""]

type nonrec user_pool_tags_type = (tag_keys_type * tag_value_type) list [@@ocaml.doc ""]

type nonrec region_code_type = string [@@ocaml.doc ""]

type nonrec sms_configuration_type = {
  sns_caller_arn : arn_type;
      [@ocaml.doc
        "The Amazon Resource Name (ARN) of the Amazon SNS caller. This is the ARN of the IAM role \
         in your Amazon Web Services account that Amazon Cognito will use to send SMS messages. \
         SMS messages are subject to a \
         {{:https://docs.aws.amazon.com/cognito/latest/developerguide/user-pool-settings-email-phone-verification.html}spending \
         limit}. \n"]
  external_id : string_type option;
      [@ocaml.doc
        "The external ID provides additional security for your IAM role. You can use an \
         [ExternalId] with the IAM role that you use with Amazon SNS to send SMS messages for your \
         user pool. If you provide an [ExternalId], your Amazon Cognito user pool includes it in \
         the request to assume your IAM role. You can configure the role trust policy to require \
         that Amazon Cognito, and any principal, provide the [ExternalID]. If you use the Amazon \
         Cognito Management Console to create a role for SMS multi-factor authentication (MFA), \
         Amazon Cognito creates a role with the required permissions and a trust policy that \
         demonstrates use of the [ExternalId].\n\n\
        \ For more information about the [ExternalId] of a role, see \
         {{:https://docs.aws.amazon.com/IAM/latest/UserGuide/id_roles_create_for-user_externalid.html}How \
         to use an external ID when granting access to your Amazon Web Services resources to a \
         third party}.\n\
        \ "]
  sns_region : region_code_type option;
      [@ocaml.doc
        "The Amazon Web Services Region to use with Amazon SNS integration. You can choose the \
         same Region as your user pool, or a supported {b Legacy Amazon SNS alternate Region}. \n\n\
        \  Amazon Cognito resources in the Asia Pacific (Seoul) Amazon Web Services Region must \
         use your Amazon SNS configuration in the Asia Pacific (Tokyo) Region. For more \
         information, see \
         {{:https://docs.aws.amazon.com/cognito/latest/developerguide/user-pool-sms-settings.html}SMS \
         message settings for Amazon Cognito user pools}.\n\
        \ "]
}
[@@ocaml.doc
  "User pool configuration for delivery of SMS messages with Amazon Simple Notification Service. \
   To send SMS messages with Amazon SNS in the Amazon Web Services Region that you want, the \
   Amazon Cognito user pool uses an Identity and Access Management (IAM) role in your Amazon Web \
   Services account.\n"]

type nonrec ses_configuration_set = string [@@ocaml.doc ""]

type nonrec email_sending_account_type =
  | COGNITO_DEFAULT [@ocaml.doc ""]
  | DEVELOPER [@ocaml.doc ""]
[@@ocaml.doc ""]

type nonrec email_address_type = string [@@ocaml.doc ""]

type nonrec email_configuration_type = {
  source_arn : arn_type option;
      [@ocaml.doc
        "The ARN of a verified email address or an address from a verified domain in Amazon SES. \
         You can set a [SourceArn] email from a verified domain only with an API request. You can \
         set a verified email address, but not an address in a verified domain, in the Amazon \
         Cognito console. Amazon Cognito uses the email address that you provide in one of the \
         following ways, depending on the value that you specify for the [EmailSendingAccount] \
         parameter:\n\n\
        \ {ul\n\
        \       {-  If you specify [COGNITO_DEFAULT], Amazon Cognito uses this address as the \
         custom FROM address when it emails your users using its built-in email account.\n\
        \           \n\
        \            }\n\
        \       {-  If you specify [DEVELOPER], Amazon Cognito emails your users with this address \
         by calling Amazon SES on your behalf.\n\
        \           \n\
        \            }\n\
        \       }\n\
        \   The Region value of the [SourceArn] parameter must indicate a supported Amazon Web \
         Services Region of your user pool. Typically, the Region in the [SourceArn] and the user \
         pool Region are the same. For more information, see \
         {{:https://docs.aws.amazon.com/cognito/latest/developerguide/user-pool-email.html#user-pool-email-developer-region-mapping}Amazon \
         SES email configuration regions} in the \
         {{:https://docs.aws.amazon.com/cognito/latest/developerguide/cognito-user-identity-pools.html}Amazon \
         Cognito Developer Guide}.\n\
        \   "]
  reply_to_email_address : email_address_type option;
      [@ocaml.doc "The destination to which the receiver of the email should reply.\n"]
  email_sending_account : email_sending_account_type option;
      [@ocaml.doc
        "Specifies whether Amazon Cognito uses its built-in functionality to send your users email \
         messages, or uses your Amazon Simple Email Service email configuration. Specify one of \
         the following values:\n\n\
        \  COGNITO_DEFAULT  When Amazon Cognito emails your users, it uses its built-in email \
         functionality. When you use the default option, Amazon Cognito allows only a limited \
         number of emails each day for your user pool. For typical production environments, the \
         default email limit is less than the required delivery volume. To achieve a higher \
         delivery volume, specify DEVELOPER to use your Amazon SES email configuration.\n\
        \                   \n\
        \                    To look up the email delivery limit for the default option, see \
         {{:https://docs.aws.amazon.com/cognito/latest/developerguide/limits.html}Limits} in the \
         {i Amazon Cognito Developer Guide}.\n\
        \                    \n\
        \                     The default FROM address is [no-reply@verificationemail.com]. To \
         customize the FROM address, provide the Amazon Resource Name (ARN) of an Amazon SES \
         verified email address for the [SourceArn] parameter.\n\
        \                     \n\
        \                       DEVELOPER  When Amazon Cognito emails your users, it uses your \
         Amazon SES configuration. Amazon Cognito calls Amazon SES on your behalf to send email \
         from your verified email address. When you use this option, the email delivery limits are \
         the same limits that apply to your Amazon SES verified email address in your Amazon Web \
         Services account.\n\
        \                                  \n\
        \                                   If you use this option, provide the ARN of an Amazon \
         SES verified email address for the [SourceArn] parameter.\n\
        \                                   \n\
        \                                    Before Amazon Cognito can email your users, it \
         requires additional permissions to call Amazon SES on your behalf. When you update your \
         user pool with this option, Amazon Cognito creates a {i service-linked role}, which is a \
         type of role in your Amazon Web Services account. This role contains the permissions that \
         allow you to access Amazon SES and send email messages from your email address. For more \
         information about the service-linked role that Amazon Cognito creates, see \
         {{:https://docs.aws.amazon.com/cognito/latest/developerguide/using-service-linked-roles.html}Using \
         Service-Linked Roles for Amazon Cognito} in the {i Amazon Cognito Developer Guide}.\n\
        \                                    \n\
        \                                      "]
  from_ : string_type option;
      [@ocaml.doc
        "Either the sender\226\128\153s email address or the sender\226\128\153s name with their \
         email address. For example, [testuser@example.com] or \n\
         {[\n\
         Test User \n\
         ]}\n\
         . This address appears before the body of the email.\n"]
  configuration_set : ses_configuration_set option;
      [@ocaml.doc
        "The set of configuration rules that can be applied to emails sent using Amazon Simple \
         Email Service. A configuration set is applied to an email by including a reference to the \
         configuration set in the headers of the email. Once applied, all of the rules in that \
         configuration set are applied to the email. Configuration sets can be used to apply the \
         following types of rules to emails: \n\n\
        \  Event publishing  Amazon Simple Email Service can track the number of send, delivery, \
         open, click, bounce, and complaint events for each email sent. Use event publishing to \
         send information about these events to other Amazon Web Services services such as and \
         Amazon CloudWatch\n\
        \                    \n\
        \                      IP pool management  When leasing dedicated IP addresses with Amazon \
         Simple Email Service, you can create groups of IP addresses, called dedicated IP pools. \
         You can then associate the dedicated IP pools with configuration sets.\n\
        \                                          \n\
        \                                            "]
}
[@@ocaml.doc
  "The email configuration of your user pool. The email configuration type sets your preferred \
   sending method, Amazon Web Services Region, and sender for messages from your user pool.\n\n\
  \  Amazon Cognito can send email messages with Amazon Simple Email Service resources in the \
   Amazon Web Services Region where you created your user pool, and in alternate Regions in some \
   cases. For more information on the supported Regions, see \
   {{:https://docs.aws.amazon.com/cognito/latest/developerguide/user-pool-email.html}Email \
   settings for Amazon Cognito user pools}.\n\
  \  \n\
  \   "]

type nonrec device_configuration_type = {
  challenge_required_on_new_device : boolean_type option;
      [@ocaml.doc
        "When true, a remembered device can sign in with device authentication instead of SMS and \
         time-based one-time password (TOTP) factors for multi-factor authentication (MFA).\n\n\
        \  Whether or not [ChallengeRequiredOnNewDevice] is true, users who sign in with devices \
         that have not been confirmed or remembered must still provide a second factor in a user \
         pool that requires MFA.\n\
        \  \n\
        \   "]
  device_only_remembered_on_user_prompt : boolean_type option;
      [@ocaml.doc
        "When true, Amazon Cognito doesn't automatically remember a user's device when your app \
         sends a [ConfirmDevice] API request. In your app, create a prompt for your user to choose \
         whether they want to remember their device. Return the user's choice in an \
         [UpdateDeviceStatus] API request.\n\n\
        \ When [DeviceOnlyRememberedOnUserPrompt] is [false], Amazon Cognito immediately remembers \
         devices that you register in a [ConfirmDevice] API request.\n\
        \ "]
}
[@@ocaml.doc
  "The device-remembering configuration for a user pool.\n\n\
  \  When you provide a value for any property of [DeviceConfiguration], you activate the device \
   remembering for the user pool.\n\
  \  \n\
  \   "]

type nonrec user_pool_mfa_type =
  | OFF [@ocaml.doc ""]
  | ON [@ocaml.doc ""]
  | OPTIONAL [@ocaml.doc ""]
[@@ocaml.doc ""]

type nonrec verified_attribute_type = PHONE_NUMBER [@ocaml.doc ""] | EMAIL [@ocaml.doc ""]
[@@ocaml.doc ""]

type nonrec attributes_require_verification_before_update_type = verified_attribute_type list
[@@ocaml.doc ""]

type nonrec user_attribute_update_settings_type = {
  attributes_require_verification_before_update :
    attributes_require_verification_before_update_type option;
      [@ocaml.doc
        "Requires that your user verifies their email address, phone number, or both before Amazon \
         Cognito updates the value of that attribute. When you update a user attribute that has \
         this option activated, Amazon Cognito sends a verification message to the new phone \
         number or email address. Amazon Cognito doesn\226\128\153t change the value of the \
         attribute until your user responds to the verification message and confirms the new \
         value.\n\n\
        \ When [AttributesRequireVerificationBeforeUpdate] is false, your user pool doesn't \
         require that your users verify attribute changes before Amazon Cognito updates them. In a \
         user pool where [AttributesRequireVerificationBeforeUpdate] is false, API operations that \
         change attribute values can immediately update a user\226\128\153s [email] or \
         [phone_number] attribute.\n\
        \ "]
}
[@@ocaml.doc
  "The settings for updates to user attributes. These settings include the property \
   [AttributesRequireVerificationBeforeUpdate], a user-pool setting that tells Amazon Cognito how \
   to handle changes to the value of your users' email address and phone number attributes. For \
   more information, see \
   {{:https://docs.aws.amazon.com/cognito/latest/developerguide/user-pool-settings-email-phone-verification.html#user-pool-settings-verifications-verify-attribute-updates} \
   Verifying updates to email addresses and phone numbers}.\n"]

type nonrec sms_verification_message_type = string [@@ocaml.doc ""]

type nonrec default_email_option_type =
  | CONFIRM_WITH_LINK [@ocaml.doc ""]
  | CONFIRM_WITH_CODE [@ocaml.doc ""]
[@@ocaml.doc ""]

type nonrec email_verification_subject_by_link_type = string [@@ocaml.doc ""]

type nonrec email_verification_message_by_link_type = string [@@ocaml.doc ""]

type nonrec email_verification_message_type = string [@@ocaml.doc ""]

type nonrec verification_message_template_type = {
  sms_message : sms_verification_message_type option;
      [@ocaml.doc "The template for SMS messages that Amazon Cognito sends to your users.\n"]
  email_message : email_verification_message_type option;
      [@ocaml.doc
        "The template for email messages that Amazon Cognito sends to your users. You can set an \
         [EmailMessage] template only if the value of \
         {{:https://docs.aws.amazon.com/cognito-user-identity-pools/latest/APIReference/API_EmailConfigurationType.html#CognitoUserPools-Type-EmailConfigurationType-EmailSendingAccount} \
         EmailSendingAccount} is [DEVELOPER]. When your \
         {{:https://docs.aws.amazon.com/cognito-user-identity-pools/latest/APIReference/API_EmailConfigurationType.html#CognitoUserPools-Type-EmailConfigurationType-EmailSendingAccount}EmailSendingAccount} \
         is [DEVELOPER], your user pool sends email messages with your own Amazon SES \
         configuration.\n"]
  email_subject : email_verification_subject_type option;
      [@ocaml.doc
        "The subject line for the email message template. You can set an [EmailSubject] template \
         only if the value of \
         {{:https://docs.aws.amazon.com/cognito-user-identity-pools/latest/APIReference/API_EmailConfigurationType.html#CognitoUserPools-Type-EmailConfigurationType-EmailSendingAccount} \
         EmailSendingAccount} is [DEVELOPER]. When your \
         {{:https://docs.aws.amazon.com/cognito-user-identity-pools/latest/APIReference/API_EmailConfigurationType.html#CognitoUserPools-Type-EmailConfigurationType-EmailSendingAccount}EmailSendingAccount} \
         is [DEVELOPER], your user pool sends email messages with your own Amazon SES \
         configuration.\n"]
  email_message_by_link : email_verification_message_by_link_type option;
      [@ocaml.doc
        "The email message template for sending a confirmation link to the user. You can set an \
         [EmailMessageByLink] template only if the value of \
         {{:https://docs.aws.amazon.com/cognito-user-identity-pools/latest/APIReference/API_EmailConfigurationType.html#CognitoUserPools-Type-EmailConfigurationType-EmailSendingAccount} \
         EmailSendingAccount} is [DEVELOPER]. When your \
         {{:https://docs.aws.amazon.com/cognito-user-identity-pools/latest/APIReference/API_EmailConfigurationType.html#CognitoUserPools-Type-EmailConfigurationType-EmailSendingAccount}EmailSendingAccount} \
         is [DEVELOPER], your user pool sends email messages with your own Amazon SES \
         configuration.\n"]
  email_subject_by_link : email_verification_subject_by_link_type option;
      [@ocaml.doc
        "The subject line for the email message template for sending a confirmation link to the \
         user. You can set an [EmailSubjectByLink] template only if the value of \
         {{:https://docs.aws.amazon.com/cognito-user-identity-pools/latest/APIReference/API_EmailConfigurationType.html#CognitoUserPools-Type-EmailConfigurationType-EmailSendingAccount} \
         EmailSendingAccount} is [DEVELOPER]. When your \
         {{:https://docs.aws.amazon.com/cognito-user-identity-pools/latest/APIReference/API_EmailConfigurationType.html#CognitoUserPools-Type-EmailConfigurationType-EmailSendingAccount}EmailSendingAccount} \
         is [DEVELOPER], your user pool sends email messages with your own Amazon SES \
         configuration.\n"]
  default_email_option : default_email_option_type option;
      [@ocaml.doc
        "The configuration of verification emails to contain a clickable link or a verification \
         code.\n\n\
        \ For link, your template body must contain link text in the format [{##Click\n\
        \                here##}]. \"Click here\" in the example is a customizable string. For \
         code, your template body must contain a code placeholder in the format [{####}].\n\
        \ "]
}
[@@ocaml.doc
  "The template for the verification message that your user pool delivers to users who set an \
   email address or phone number attribute.\n"]

type nonrec verified_attributes_list_type = verified_attribute_type list [@@ocaml.doc ""]

type nonrec inbound_federation_lambda_version_type = V1_0 [@ocaml.doc ""] [@@ocaml.doc ""]

type nonrec inbound_federation_lambda_type = {
  lambda_version : inbound_federation_lambda_version_type;
      [@ocaml.doc
        "The user pool trigger version of the request that Amazon Cognito sends to your Lambda \
         function. Higher-numbered versions add fields that support new features.\n\n\
        \ You must use a [LambdaVersion] of [V1_0] with an inbound federation function.\n\
        \ "]
  lambda_arn : arn_type;
      [@ocaml.doc
        "The Amazon Resource Name (ARN) of the function that you want to assign to your Lambda \
         trigger.\n"]
}
[@@ocaml.doc "The properties of an inbound federation Lambda trigger.\n"]

type nonrec custom_email_sender_lambda_version_type = V1_0 [@ocaml.doc ""] [@@ocaml.doc ""]

type nonrec custom_email_lambda_version_config_type = {
  lambda_version : custom_email_sender_lambda_version_type;
      [@ocaml.doc
        "The user pool trigger version of the request that Amazon Cognito sends to your Lambda \
         function. Higher-numbered versions add fields that support new features.\n\n\
        \ You must use a [LambdaVersion] of [V1_0] with a custom sender function.\n\
        \ "]
  lambda_arn : arn_type;
      [@ocaml.doc
        "The Amazon Resource Name (ARN) of the function that you want to assign to your Lambda \
         trigger.\n"]
}
[@@ocaml.doc "The properties of a custom email sender Lambda trigger.\n"]

type nonrec custom_sms_sender_lambda_version_type = V1_0 [@ocaml.doc ""] [@@ocaml.doc ""]

type nonrec custom_sms_lambda_version_config_type = {
  lambda_version : custom_sms_sender_lambda_version_type;
      [@ocaml.doc
        "The user pool trigger version of the request that Amazon Cognito sends to your Lambda \
         function. Higher-numbered versions add fields that support new features.\n\n\
        \ You must use a [LambdaVersion] of [V1_0] with a custom sender function.\n\
        \ "]
  lambda_arn : arn_type;
      [@ocaml.doc
        "The Amazon Resource Name (ARN) of the function that you want to assign to your Lambda \
         trigger.\n"]
}
[@@ocaml.doc "The properties of a custom SMS sender Lambda trigger.\n"]

type nonrec pre_token_generation_lambda_version_type =
  | V1_0 [@ocaml.doc ""]
  | V2_0 [@ocaml.doc ""]
  | V3_0 [@ocaml.doc ""]
[@@ocaml.doc ""]

type nonrec pre_token_generation_version_config_type = {
  lambda_version : pre_token_generation_lambda_version_type;
      [@ocaml.doc
        "The user pool trigger version of the request that Amazon Cognito sends to your Lambda \
         function. Higher-numbered versions add fields that support new features.\n"]
  lambda_arn : arn_type;
      [@ocaml.doc
        "The Amazon Resource Name (ARN) of the function that you want to assign to your Lambda \
         trigger.\n\n\
        \ This parameter and the [PreTokenGeneration] property of [LambdaConfig] have the same \
         value. For new instances of pre token generation triggers, set [LambdaArn].\n\
        \ "]
}
[@@ocaml.doc "The properties of a pre token generation Lambda trigger.\n"]

type nonrec lambda_config_type = {
  pre_sign_up : arn_type option;
      [@ocaml.doc
        "The configuration of a \
         {{:https://docs.aws.amazon.com/cognito/latest/developerguide/user-pool-lambda-pre-sign-up.html}pre \
         sign-up Lambda trigger} in a user pool. This trigger evaluates new users and can bypass \
         confirmation, \
         {{:https://docs.aws.amazon.com/cognito/latest/developerguide/cognito-user-pools-identity-federation-consolidate-users.html}link \
         a federated user profile}, or block sign-up requests.\n"]
  custom_message : arn_type option;
      [@ocaml.doc
        "A custom message Lambda trigger. This trigger is an opportunity to customize all SMS and \
         email messages from your user pool. When a custom message trigger is active, your user \
         pool routes all messages to a Lambda function that returns a runtime-customized message \
         subject and body for your user pool to deliver to a user.\n"]
  post_confirmation : arn_type option;
      [@ocaml.doc
        "The configuration of a \
         {{:https://docs.aws.amazon.com/cognito/latest/developerguide/user-pool-lambda-post-confirmation.html}post \
         confirmation Lambda trigger} in a user pool. This trigger can take custom actions after a \
         user confirms their user account and their email address or phone number.\n"]
  pre_authentication : arn_type option;
      [@ocaml.doc
        "The configuration of a \
         {{:https://docs.aws.amazon.com/cognito/latest/developerguide/user-pool-lambda-pre-authentication.html}pre \
         authentication trigger} in a user pool. This trigger can evaluate and modify user sign-in \
         events.\n"]
  post_authentication : arn_type option;
      [@ocaml.doc
        "The configuration of a \
         {{:https://docs.aws.amazon.com/cognito/latest/developerguide/user-pool-lambda-post-authentication.html}post \
         authentication Lambda trigger} in a user pool. This trigger can take custom actions after \
         a user signs in.\n"]
  define_auth_challenge : arn_type option;
      [@ocaml.doc
        "The configuration of a define auth challenge Lambda trigger, one of three triggers in the \
         sequence of the \
         {{:https://docs.aws.amazon.com/cognito/latest/developerguide/user-pool-lambda-challenge.html}custom \
         authentication challenge triggers}.\n"]
  create_auth_challenge : arn_type option;
      [@ocaml.doc
        "The configuration of a create auth challenge Lambda trigger, one of three triggers in the \
         sequence of the \
         {{:https://docs.aws.amazon.com/cognito/latest/developerguide/user-pool-lambda-challenge.html}custom \
         authentication challenge triggers}.\n"]
  verify_auth_challenge_response : arn_type option;
      [@ocaml.doc
        "The configuration of a verify auth challenge Lambda trigger, one of three triggers in the \
         sequence of the \
         {{:https://docs.aws.amazon.com/cognito/latest/developerguide/user-pool-lambda-challenge.html}custom \
         authentication challenge triggers}.\n"]
  pre_token_generation : arn_type option;
      [@ocaml.doc
        "The legacy configuration of a \
         {{:https://docs.aws.amazon.com/cognito/latest/developerguide/user-pool-lambda-pre-token-generation.html}pre \
         token generation Lambda trigger} in a user pool.\n\n\
        \ Set this parameter for legacy purposes. If you also set an ARN in \
         [PreTokenGenerationConfig], its value must be identical to [PreTokenGeneration]. For new \
         instances of pre token generation triggers, set the [LambdaArn] of \
         [PreTokenGenerationConfig].\n\
        \ "]
  user_migration : arn_type option;
      [@ocaml.doc
        "The configuration of a \
         {{:https://docs.aws.amazon.com/cognito/latest/developerguide/user-pool-lambda-migrate-user.html}migrate \
         user Lambda trigger} in a user pool. This trigger can create user profiles when users \
         sign in or attempt to reset their password with credentials that don't exist yet.\n"]
  pre_token_generation_config : pre_token_generation_version_config_type option;
      [@ocaml.doc
        "The detailed configuration of a \
         {{:https://docs.aws.amazon.com/cognito/latest/developerguide/user-pool-lambda-pre-token-generation.html}pre \
         token generation Lambda trigger} in a user pool. If you also set an ARN in \
         [PreTokenGeneration], its value must be identical to [PreTokenGenerationConfig].\n"]
  custom_sms_sender : custom_sms_lambda_version_config_type option;
      [@ocaml.doc
        "The configuration of a custom SMS sender Lambda trigger. This trigger routes all SMS \
         notifications from a user pool to a Lambda function that delivers the message using \
         custom logic.\n"]
  custom_email_sender : custom_email_lambda_version_config_type option;
      [@ocaml.doc
        "The configuration of a custom email sender Lambda trigger. This trigger routes all email \
         notifications from a user pool to a Lambda function that delivers the message using \
         custom logic.\n"]
  kms_key_i_d : arn_type option;
      [@ocaml.doc
        "The ARN of an \
         {{:https://docs.aws.amazon.com/kms/latest/developerguide/concepts.html#master_keys}KMS \
         key}. Amazon Cognito uses the key to encrypt codes and temporary passwords sent to custom \
         sender Lambda triggers.\n"]
  inbound_federation : inbound_federation_lambda_type option;
      [@ocaml.doc
        "The configuration of an inbound federation Lambda trigger. This trigger can transform \
         federated user attributes during the authentication with external identity providers.\n"]
}
[@@ocaml.doc
  "A collection of user pool Lambda triggers. Amazon Cognito invokes triggers at several possible \
   stages of user pool operations. Triggers can modify the outcome of the operations that invoked \
   them.\n"]

type nonrec deletion_protection_type = ACTIVE [@ocaml.doc ""] | INACTIVE [@ocaml.doc ""]
[@@ocaml.doc ""]

type nonrec auth_factor_type =
  | PASSWORD [@ocaml.doc ""]
  | EMAIL_OTP [@ocaml.doc ""]
  | SMS_OTP [@ocaml.doc ""]
  | WEB_AUTHN [@ocaml.doc ""]
[@@ocaml.doc ""]

type nonrec allowed_first_auth_factors_list_type = auth_factor_type list [@@ocaml.doc ""]

type nonrec sign_in_policy_type = {
  allowed_first_auth_factors : allowed_first_auth_factors_list_type option;
      [@ocaml.doc
        "The sign-in methods that a user pool supports as the first factor. You can permit users \
         to start authentication with a standard username and password, or with other one-time \
         password and hardware factors.\n"]
}
[@@ocaml.doc
  "The policy for allowed types of authentication in a user pool. To activate this setting, your \
   user pool must be in the \
   {{:https://docs.aws.amazon.com/cognito/latest/developerguide/feature-plans-features-essentials.html} \
   Essentials tier} or higher.\n"]

type nonrec temporary_password_validity_days_type = int [@@ocaml.doc ""]

type nonrec password_history_size_type = int [@@ocaml.doc ""]

type nonrec password_policy_min_length_type = int [@@ocaml.doc ""]

type nonrec password_policy_type = {
  minimum_length : password_policy_min_length_type option;
      [@ocaml.doc
        "The minimum length of the password in the policy that you have set. This value can't be \
         less than 6.\n"]
  require_uppercase : boolean_type option;
      [@ocaml.doc
        "The requirement in a password policy that users must include at least one uppercase \
         letter in their password.\n"]
  require_lowercase : boolean_type option;
      [@ocaml.doc
        "The requirement in a password policy that users must include at least one lowercase \
         letter in their password.\n"]
  require_numbers : boolean_type option;
      [@ocaml.doc
        "The requirement in a password policy that users must include at least one number in their \
         password.\n"]
  require_symbols : boolean_type option;
      [@ocaml.doc
        "The requirement in a password policy that users must include at least one symbol in their \
         password.\n"]
  password_history_size : password_history_size_type option;
      [@ocaml.doc
        "The number of previous passwords that you want Amazon Cognito to restrict each user from \
         reusing. Users can't set a password that matches any of [n] previous passwords, where [n] \
         is the value of [PasswordHistorySize].\n"]
  temporary_password_validity_days : temporary_password_validity_days_type option;
      [@ocaml.doc
        "The number of days a temporary password is valid in the password policy. If the user \
         doesn't sign in during this time, an administrator must reset their password. Defaults to \
         [7]. If you submit a value of [0], Amazon Cognito treats it as a null value and sets \
         [TemporaryPasswordValidityDays] to its default value.\n\n\
        \  When you set [TemporaryPasswordValidityDays] for a user pool, you can no longer set a \
         value for the legacy [UnusedAccountValidityDays] parameter in that user pool.\n\
        \  \n\
        \   "]
}
[@@ocaml.doc
  "The password policy settings for a user pool, including complexity, history, and length \
   requirements.\n"]

type nonrec user_pool_policy_type = {
  password_policy : password_policy_type option;
      [@ocaml.doc
        "The password policy settings for a user pool, including complexity, history, and length \
         requirements.\n"]
  sign_in_policy : sign_in_policy_type option;
      [@ocaml.doc "The policy for allowed types of authentication in a user pool.\n"]
}
[@@ocaml.doc
  "A list of user pool policies. Contains the policy that sets password-complexity requirements.\n"]

type nonrec update_user_pool_request = {
  user_pool_id : user_pool_id_type; [@ocaml.doc "The ID of the user pool you want to update.\n"]
  policies : user_pool_policy_type option;
      [@ocaml.doc
        "The password policy and sign-in policy in the user pool. The password policy sets options \
         like password complexity requirements and password history. The sign-in policy sets the \
         options available to applications in \
         {{:https://docs.aws.amazon.com/cognito/latest/developerguide/authentication-flows-selection-sdk.html#authentication-flows-selection-choice}choice-based \
         authentication}.\n"]
  deletion_protection : deletion_protection_type option;
      [@ocaml.doc
        "When active, [DeletionProtection] prevents accidental deletion of your user pool. Before \
         you can delete a user pool that you have protected against deletion, you must deactivate \
         this feature.\n\n\
        \ When you try to delete a protected user pool in a [DeleteUserPool] API request, Amazon \
         Cognito returns an [InvalidParameterException] error. To delete a protected user pool, \
         send a new [DeleteUserPool] request after you deactivate deletion protection in an \
         [UpdateUserPool] API request.\n\
        \ "]
  lambda_config : lambda_config_type option;
      [@ocaml.doc
        "A collection of user pool Lambda triggers. Amazon Cognito invokes triggers at several \
         possible stages of authentication operations. Triggers can modify the outcome of the \
         operations that invoked them.\n"]
  auto_verified_attributes : verified_attributes_list_type option;
      [@ocaml.doc
        "The attributes that you want your user pool to automatically verify. Possible values: {b \
         email}, {b phone_number}. For more information see \
         {{:https://docs.aws.amazon.com/cognito/latest/developerguide/signing-up-users-in-your-app.html#allowing-users-to-sign-up-and-confirm-themselves}Verifying \
         contact information at sign-up}.\n"]
  sms_verification_message : sms_verification_message_type option;
      [@ocaml.doc "This parameter is no longer used.\n"]
  email_verification_message : email_verification_message_type option;
      [@ocaml.doc "This parameter is no longer used.\n"]
  email_verification_subject : email_verification_subject_type option;
      [@ocaml.doc "This parameter is no longer used.\n"]
  verification_message_template : verification_message_template_type option;
      [@ocaml.doc
        "The template for the verification message that your user pool delivers to users who set \
         an email address or phone number attribute.\n\n\
        \ Set the email message type that corresponds to your [DefaultEmailOption] selection. For \
         [CONFIRM_WITH_LINK], specify an [EmailMessageByLink] and leave [EmailMessage] blank. For \
         [CONFIRM_WITH_CODE], specify an [EmailMessage] and leave [EmailMessageByLink] blank. When \
         you supply both parameters with either choice, Amazon Cognito returns an error.\n\
        \ "]
  sms_authentication_message : sms_verification_message_type option;
      [@ocaml.doc
        "The contents of the SMS message that your user pool sends to users in SMS authentication.\n"]
  user_attribute_update_settings : user_attribute_update_settings_type option;
      [@ocaml.doc
        "The settings for updates to user attributes. These settings include the property \
         [AttributesRequireVerificationBeforeUpdate], a user-pool setting that tells Amazon \
         Cognito how to handle changes to the value of your users' email address and phone number \
         attributes. For more information, see \
         {{:https://docs.aws.amazon.com/cognito/latest/developerguide/user-pool-settings-email-phone-verification.html#user-pool-settings-verifications-verify-attribute-updates} \
         Verifying updates to email addresses and phone numbers}.\n"]
  mfa_configuration : user_pool_mfa_type option;
      [@ocaml.doc
        "Sets multi-factor authentication (MFA) to be on, off, or optional. When [ON], all users \
         must set up MFA before they can sign in. When [OPTIONAL], your application must make a \
         client-side determination of whether a user wants to register an MFA device. For user \
         pools with adaptive authentication with threat protection, choose [OPTIONAL].\n\n\
        \ When [MfaConfiguration] is [OPTIONAL], managed login doesn't automatically prompt users \
         to set up MFA. Amazon Cognito generates MFA prompts in API responses and in managed login \
         for users who have chosen and configured a preferred MFA factor.\n\
        \ "]
  device_configuration : device_configuration_type option;
      [@ocaml.doc
        "The device-remembering configuration for a user pool. Device remembering or device \
         tracking is a \"Remember me on this device\" option for user pools that perform \
         authentication with the device key of a trusted device in the back end, instead of a \
         user-provided MFA code. For more information about device authentication, see \
         {{:https://docs.aws.amazon.com/cognito/latest/developerguide/amazon-cognito-user-pools-device-tracking.html}Working \
         with user devices in your user pool}. A null value indicates that you have deactivated \
         device remembering in your user pool.\n\n\
        \  When you provide a value for any [DeviceConfiguration] field, you activate the Amazon \
         Cognito device-remembering feature. For more information, see \
         {{:https://docs.aws.amazon.com/cognito/latest/developerguide/amazon-cognito-user-pools-device-tracking.html}Working \
         with devices}.\n\
        \  \n\
        \   "]
  email_configuration : email_configuration_type option;
      [@ocaml.doc
        "The email configuration of your user pool. The email configuration type sets your \
         preferred sending method, Amazon Web Services Region, and sender for email invitation and \
         verification messages from your user pool.\n"]
  sms_configuration : sms_configuration_type option;
      [@ocaml.doc
        "The SMS configuration with the settings for your Amazon Cognito user pool to send SMS \
         message with Amazon Simple Notification Service. To send SMS messages with Amazon SNS in \
         the Amazon Web Services Region that you want, the Amazon Cognito user pool uses an \
         Identity and Access Management (IAM) role in your Amazon Web Services account. For more \
         information see \
         {{:https://docs.aws.amazon.com/cognito/latest/developerguide/user-pool-sms-settings.html}SMS \
         message settings}.\n"]
  user_pool_tags : user_pool_tags_type option;
      [@ocaml.doc
        "The tag keys and values to assign to the user pool. A tag is a label that you can use to \
         categorize and manage user pools in different ways, such as by purpose, owner, \
         environment, or other criteria.\n"]
  admin_create_user_config : admin_create_user_config_type option;
      [@ocaml.doc
        "The configuration for administrative creation of users. Includes the template for the \
         invitation message for new users, the duration of temporary passwords, and permitting \
         self-service sign-up.\n"]
  user_pool_add_ons : user_pool_add_ons_type option;
      [@ocaml.doc
        "Contains settings for activation of threat protection, including the operating mode and \
         additional authentication types. To log user security information but take no action, set \
         to [AUDIT]. To configure automatic security responses to potentially unwanted traffic to \
         your user pool, set to [ENFORCED].\n\n\
        \ For more information, see \
         {{:https://docs.aws.amazon.com/cognito/latest/developerguide/cognito-user-pool-settings-advanced-security.html}Adding \
         advanced security to a user pool}. To activate this setting, your user pool must be on \
         the \
         {{:https://docs.aws.amazon.com/cognito/latest/developerguide/feature-plans-features-plus.html} \
         Plus tier}.\n\
        \ "]
  account_recovery_setting : account_recovery_setting_type option;
      [@ocaml.doc
        "The available verified method a user can use to recover their password when they call \
         [ForgotPassword]. You can use this setting to define a preferred method when a user has \
         more than one method available. With this setting, SMS doesn't qualify for a valid \
         password recovery mechanism if the user also has SMS multi-factor authentication (MFA) \
         activated. In the absence of this setting, Amazon Cognito uses the legacy behavior to \
         determine the recovery method where SMS is preferred through email.\n"]
  pool_name : user_pool_name_type option; [@ocaml.doc "The updated name of your user pool.\n"]
  user_pool_tier : user_pool_tier_type option;
      [@ocaml.doc
        "The user pool \
         {{:https://docs.aws.amazon.com/cognito/latest/developerguide/cognito-sign-in-feature-plans.html}feature \
         plan}, or tier. This parameter determines the eligibility of the user pool for features \
         like managed login, access-token customization, and threat protection. Defaults to \
         [ESSENTIALS].\n"]
  key_configuration : key_configuration_type option;
      [@ocaml.doc
        "The key configuration for the user pool. In secondary regions, this parameter must match \
         the existing configuration and cannot be modified.\n"]
  issuer_configuration : issuer_configuration_type option;
      [@ocaml.doc
        "The issuer configuration for the user pool. In secondary regions, this parameter must \
         match the existing configuration and cannot be modified.\n"]
}
[@@ocaml.doc "Represents the request to update the user pool.\n"]

type nonrec user_lambda_validation_exception = {
  message : message_type option;
      [@ocaml.doc
        "The message returned when the Amazon Cognito service returns a user validation exception \
         with the Lambda service.\n"]
}
[@@ocaml.doc
  "This exception is thrown when the Amazon Cognito service encounters a user validation exception \
   with the Lambda service.\n"]

type nonrec unexpected_lambda_exception = {
  message : message_type option;
      [@ocaml.doc
        "The message returned when Amazon Cognito returns an unexpected Lambda exception.\n"]
}
[@@ocaml.doc
  "This exception is thrown when Amazon Cognito encounters an unexpected exception with Lambda.\n"]

type nonrec invalid_lambda_response_exception = {
  message : message_type option;
      [@ocaml.doc
        "The message returned when Amazon Cognito throws an invalid Lambda response exception.\n"]
}
[@@ocaml.doc
  "This exception is thrown when Amazon Cognito encounters an invalid Lambda response.\n"]

type nonrec code_delivery_failure_exception = {
  message : message_type option;
      [@ocaml.doc "The message sent when a verification code fails to deliver successfully.\n"]
}
[@@ocaml.doc "This exception is thrown when a verification code fails to deliver successfully.\n"]

type nonrec delivery_medium_type = SMS [@ocaml.doc ""] | EMAIL [@ocaml.doc ""] [@@ocaml.doc ""]

type nonrec code_delivery_details_type = {
  destination : string_type option;
      [@ocaml.doc
        "The email address or phone number destination where Amazon Cognito sent the code.\n"]
  delivery_medium : delivery_medium_type option;
      [@ocaml.doc "The method that Amazon Cognito used to send the code.\n"]
  attribute_name : attribute_name_type option;
      [@ocaml.doc "The name of the attribute that Amazon Cognito verifies with the code.\n"]
}
[@@ocaml.doc
  "The delivery details for an email or SMS message that Amazon Cognito sent for authentication or \
   verification.\n"]

type nonrec code_delivery_details_list_type = code_delivery_details_type list [@@ocaml.doc ""]

type nonrec update_user_attributes_response = {
  code_delivery_details_list : code_delivery_details_list_type option;
      [@ocaml.doc
        "When the attribute-update request includes an email address or phone number attribute, \
         Amazon Cognito sends a message to users with a code that confirms ownership of the new \
         value that they entered. The [CodeDeliveryDetails] object is information about the \
         delivery destination for that link or code. This behavior happens in user pools \
         configured to automatically verify changes to those attributes. For more information, see \
         {{:https://docs.aws.amazon.com/cognito/latest/developerguide/signing-up-users-in-your-app.html#verifying-when-users-change-their-email-or-phone-number}Verifying \
         when users change their email or phone number}.\n"]
}
[@@ocaml.doc "Represents the response from the server for the request to update user attributes.\n"]

type nonrec client_metadata_type = (string_type * string_type) list [@@ocaml.doc ""]

type nonrec attribute_value_type = string [@@ocaml.doc ""]

type nonrec attribute_type = {
  name : attribute_name_type;
      [@ocaml.doc
        "The name of the attribute, for example [email] or [custom:department].\n\n\
        \ In some older user pools, the regex pattern for acceptable values of this parameter is \
         [\\[\\p{L}\\p{M}\\p{S}\\p{N}\\p{P}\\]+]. Older pools will eventually be updated to use \
         the new pattern. Affected user pools are those created before May 2024 in US East (N. \
         Virginia), US East (Ohio), US West (N. California), US West (Oregon), Asia Pacific \
         (Mumbai), Asia Pacific (Tokyo), Asia Pacific (Seoul), Asia Pacific (Singapore), Asia \
         Pacific (Sydney), Canada (Central), Europe (Frankfurt), Europe (Ireland), Europe \
         (London), Europe (Paris), Europe (Stockholm), Middle East (Bahrain), and South America \
         (S\195\163o Paulo). \n\
        \ "]
  value : attribute_value_type option; [@ocaml.doc "The value of the attribute.\n"]
}
[@@ocaml.doc "The name and value of a user attribute.\n"]

type nonrec attribute_list_type = attribute_type list [@@ocaml.doc ""]

type nonrec update_user_attributes_request = {
  user_attributes : attribute_list_type;
      [@ocaml.doc
        "An array of name-value pairs representing user attributes.\n\n\
        \ For custom attributes, you must add a [custom:] prefix to the attribute name.\n\
        \ \n\
        \  If you have set an attribute to require verification before Amazon Cognito updates its \
         value, this request doesn\226\128\153t immediately update the value of that attribute. \
         After your user receives and responds to a verification message to verify the new value, \
         Amazon Cognito updates the attribute value. Your user can sign in and receive messages \
         with the original attribute value until they verify the new value.\n\
        \  "]
  access_token : token_model_type;
      [@ocaml.doc
        "A valid access token that Amazon Cognito issued to the currently signed-in user. Must \
         include a scope claim for [aws.cognito.signin.user.admin].\n"]
  client_metadata : client_metadata_type option;
      [@ocaml.doc
        "A map of custom key-value pairs that you can provide as input for any custom workflows \
         that this action triggers. You create custom workflows by assigning Lambda functions to \
         user pool triggers.\n\n\
        \ When Amazon Cognito invokes any of these functions, it passes a JSON payload, which the \
         function receives as input. This payload contains a [clientMetadata] attribute that \
         provides the data that you assigned to the ClientMetadata parameter in your request. In \
         your function code, you can process the [clientMetadata] value to enhance your workflow \
         for your specific needs.\n\
        \ \n\
        \  To review the Lambda trigger types that Amazon Cognito invokes at runtime with API \
         requests, see \
         {{:https://docs.aws.amazon.com/cognito/latest/developerguide/cognito-user-pools-working-with-lambda-triggers.html#lambda-triggers-by-event} \
         Connecting API actions to Lambda triggers} in the {i Amazon Cognito Developer Guide}.\n\
        \  \n\
        \    When you use the [ClientMetadata] parameter, note that Amazon Cognito won't do the \
         following:\n\
        \    \n\
        \     {ul\n\
        \           {-  Store the [ClientMetadata] value. This data is available only to Lambda \
         triggers that are assigned to a user pool to support custom workflows. If your user pool \
         configuration doesn't include triggers, the [ClientMetadata] parameter serves no purpose.\n\
        \               \n\
        \                }\n\
        \           {-  Validate the [ClientMetadata] value.\n\
        \               \n\
        \                }\n\
        \           {-  Encrypt the [ClientMetadata] value. Don't send sensitive information in \
         this parameter.\n\
        \               \n\
        \                }\n\
        \           }\n\
        \   "]
}
[@@ocaml.doc "Represents the request to update user attributes.\n"]

type nonrec terms_exists_exception = { message : message_type option [@ocaml.doc ""] }
[@@ocaml.doc
  "Terms document names must be unique to the app client. This exception is thrown when you \
   attempt to create terms documents with a duplicate [TermsName].\n"]

type nonrec link_url_type = string [@@ocaml.doc ""]

type nonrec language_id_type = string [@@ocaml.doc ""]

type nonrec links_type = (language_id_type * link_url_type) list [@@ocaml.doc ""]

type nonrec terms_enforcement_type = NONE [@ocaml.doc ""] [@@ocaml.doc ""]

type nonrec terms_source_type = LINK [@ocaml.doc ""] [@@ocaml.doc ""]

type nonrec terms_name_type = string [@@ocaml.doc ""]

type nonrec terms_id_type = string [@@ocaml.doc ""]

type nonrec terms_type = {
  terms_id : terms_id_type; [@ocaml.doc "The ID of the terms documents.\n"]
  user_pool_id : user_pool_id_type;
      [@ocaml.doc "The ID of the user pool that contains the terms documents.\n"]
  client_id : client_id_type;
      [@ocaml.doc "The ID of the app client that the terms documents are assigned to.\n"]
  terms_name : terms_name_type; [@ocaml.doc "The type and friendly name of the terms documents.\n"]
  terms_source : terms_source_type;
      [@ocaml.doc "This parameter is reserved for future use and currently accepts one value.\n"]
  enforcement : terms_enforcement_type;
      [@ocaml.doc "This parameter is reserved for future use and currently accepts one value.\n"]
  links : links_type;
      [@ocaml.doc
        "A map of URLs to languages. For each localized language that will view the requested \
         [TermsName], assign a URL. A selection of [cognito:default] displays for all languages \
         that don't have a language-specific URL.\n\n\
        \ For example, [\"cognito:default\": \"https://terms.example.com\", \"cognito:spanish\":\n\
        \                \"https://terms.example.com/es\"].\n\
        \ "]
  creation_date : date_type;
      [@ocaml.doc
        "The date and time when the item was created. Amazon Cognito returns this timestamp in \
         UNIX epoch time format. Your SDK might render the output in a human-readable format like \
         ISO 8601 or a Java [Date] object.\n"]
  last_modified_date : date_type;
      [@ocaml.doc
        "The date and time when the item was modified. Amazon Cognito returns this timestamp in \
         UNIX epoch time format. Your SDK might render the output in a human-readable format like \
         ISO 8601 or a Java [Date] object.\n"]
}
[@@ocaml.doc
  "The details of a set of terms documents. For more information, see \
   {{:https://docs.aws.amazon.com/cognito/latest/developerguide/cognito-user-pools-managed-login.html#managed-login-terms-documents}Terms \
   documents}.\n"]

type nonrec update_terms_response = {
  terms : terms_type option; [@ocaml.doc "A summary of the updates to your terms documents.\n"]
}
[@@ocaml.doc ""]

type nonrec update_terms_request = {
  terms_id : terms_id_type; [@ocaml.doc "The ID of the terms document that you want to update.\n"]
  user_pool_id : user_pool_id_type;
      [@ocaml.doc "The ID of the user pool that contains the terms that you want to update.\n"]
  terms_name : terms_name_type option;
      [@ocaml.doc "The new name that you want to apply to the requested terms documents.\n"]
  terms_source : terms_source_type option;
      [@ocaml.doc
        "This parameter is reserved for future use and currently accepts only one value.\n"]
  enforcement : terms_enforcement_type option;
      [@ocaml.doc
        "This parameter is reserved for future use and currently accepts only one value.\n"]
  links : links_type option;
      [@ocaml.doc
        "A map of URLs to languages. For each localized language that will view the requested \
         [TermsName], assign a URL. A selection of [cognito:default] displays for all languages \
         that don't have a language-specific URL.\n\n\
        \ For example, [\"cognito:default\": \"https://terms.example.com\", \"cognito:spanish\":\n\
        \                \"https://terms.example.com/es\"].\n\
        \ "]
}
[@@ocaml.doc ""]

type nonrec resource_server_scope_description_type = string [@@ocaml.doc ""]

type nonrec resource_server_scope_name_type = string [@@ocaml.doc ""]

type nonrec resource_server_scope_type = {
  scope_name : resource_server_scope_name_type;
      [@ocaml.doc
        "The name of the scope. Amazon Cognito renders custom scopes in the format \
         [resourceServerIdentifier/ScopeName]. For example, if this parameter is [exampleScope] in \
         the resource server with the identifier [exampleResourceServer], you request and receive \
         the scope [exampleResourceServer/exampleScope].\n"]
  scope_description : resource_server_scope_description_type;
      [@ocaml.doc "A friendly description of a custom scope.\n"]
}
[@@ocaml.doc
  "One custom scope associated with a user pool resource server. This data type is a member of \
   [ResourceServerScopeType]. For more information, see \
   {{:https://docs.aws.amazon.com/cognito/latest/developerguide/cognito-user-pools-define-resource-servers.html} \
   Scopes, M2M, and API authorization with resource servers}. \n"]

type nonrec resource_server_scope_list_type = resource_server_scope_type list [@@ocaml.doc ""]

type nonrec resource_server_name_type = string [@@ocaml.doc ""]

type nonrec resource_server_identifier_type = string [@@ocaml.doc ""]

type nonrec resource_server_type = {
  user_pool_id : user_pool_id_type option;
      [@ocaml.doc "The ID of the user pool that contains the resource server configuration.\n"]
  identifier : resource_server_identifier_type option;
      [@ocaml.doc
        "A unique resource server identifier for the resource server. The identifier can be an API \
         friendly name like [solar-system-data]. You can also set an API URL like \
         [https://solar-system-data-api.example.com] as your identifier.\n\n\
        \ Amazon Cognito represents scopes in the access token in the format \
         [$resource-server-identifier/$scope]. Longer scope-identifier strings increase the size \
         of your access tokens.\n\
        \ "]
  name : resource_server_name_type option; [@ocaml.doc "The name of the resource server.\n"]
  scopes : resource_server_scope_list_type option;
      [@ocaml.doc "A list of scopes that are defined for the resource server.\n"]
}
[@@ocaml.doc
  "The details of a resource server configuration and associated custom scopes in a user pool.\n"]

type nonrec update_resource_server_response = {
  resource_server : resource_server_type;
      [@ocaml.doc "The updated details of the requested resource server.\n"]
}
[@@ocaml.doc ""]

type nonrec update_resource_server_request = {
  user_pool_id : user_pool_id_type;
      [@ocaml.doc
        "The ID of the user pool that contains the resource server that you want to update.\n"]
  identifier : resource_server_identifier_type;
      [@ocaml.doc
        "A unique resource server identifier for the resource server. The identifier can be an API \
         friendly name like [solar-system-data]. You can also set an API URL like \
         [https://solar-system-data-api.example.com] as your identifier.\n\n\
        \ Amazon Cognito represents scopes in the access token in the format \
         [$resource-server-identifier/$scope]. Longer scope-identifier strings increase the size \
         of your access tokens.\n\
        \ "]
  name : resource_server_name_type; [@ocaml.doc "The updated name of the resource server.\n"]
  scopes : resource_server_scope_list_type option;
      [@ocaml.doc
        "An array of updated custom scope names and descriptions that you want to associate with \
         your resource server.\n"]
}
[@@ocaml.doc ""]

type nonrec service_quota_exceeded_exception = { message : message_type option [@ocaml.doc ""] }
[@@ocaml.doc
  "The request exceeded your account's service quota. To increase your limit, use or submit a \
   Service Quotas increase request.\n"]

type nonrec integer_type = int [@@ocaml.doc ""]

type nonrec string_to_string_map_type = (string_type * string_type) list [@@ocaml.doc ""]

type nonrec limit_class = API_CATEGORY [@ocaml.doc ""] [@@ocaml.doc ""]

type nonrec limit_definition_type = {
  limit_class : limit_class;
      [@ocaml.doc "The class of the limit. For API rate limits, this is [API_CATEGORY].\n"]
  attributes : string_to_string_map_type;
      [@ocaml.doc
        "The attributes that identify the specific limit. For API rate limits, specify the \
         [Category] key with a value like [UserAuthentication] or [UserCreation].\n"]
}
[@@ocaml.doc "The class and attributes that identify a specific limit at the account level.\n"]

type nonrec limit_type = {
  limit_definition : limit_definition_type;
      [@ocaml.doc
        "The definition that identifies this limit, including the class and attributes.\n"]
  provisioned_limit_value : integer_type;
      [@ocaml.doc
        "The provisioned limit value, in requests per second (RPS). This is the rate that Amazon \
         Cognito currently enforces for your account.\n"]
  free_limit_value : integer_type;
      [@ocaml.doc
        "The default (free) limit value, in requests per second (RPS). This is the rate included \
         at no additional cost.\n"]
}
[@@ocaml.doc "The limit definition and current limit values for a provisioned limit.\n"]

type nonrec update_provisioned_limit_response = {
  limit : limit_type; [@ocaml.doc "The updated provisioned and default limit values.\n"]
}
[@@ocaml.doc ""]

type nonrec update_provisioned_limit_request = {
  limit_definition : limit_definition_type;
      [@ocaml.doc
        "The limit to update. Specify the limit class and the attributes that identify the limit.\n"]
  requested_limit_value : integer_type;
      [@ocaml.doc "The provisioned rate to set, in requests per second (RPS).\n"]
}
[@@ocaml.doc ""]

type nonrec resource_id_type = string [@@ocaml.doc ""]

type nonrec asset_bytes_type = bytes [@@ocaml.doc ""]

type nonrec asset_extension_type =
  | ICO [@ocaml.doc ""]
  | JPEG [@ocaml.doc ""]
  | PNG [@ocaml.doc ""]
  | SVG [@ocaml.doc ""]
  | WEBP [@ocaml.doc ""]
[@@ocaml.doc ""]

type nonrec color_scheme_mode_type =
  | LIGHT [@ocaml.doc ""]
  | DARK [@ocaml.doc ""]
  | DYNAMIC [@ocaml.doc ""]
[@@ocaml.doc ""]

type nonrec asset_category_type =
  | FAVICON_ICO [@ocaml.doc ""]
  | FAVICON_SVG [@ocaml.doc ""]
  | EMAIL_GRAPHIC [@ocaml.doc ""]
  | SMS_GRAPHIC [@ocaml.doc ""]
  | AUTH_APP_GRAPHIC [@ocaml.doc ""]
  | PASSWORD_GRAPHIC [@ocaml.doc ""]
  | PASSKEY_GRAPHIC [@ocaml.doc ""]
  | PAGE_HEADER_LOGO [@ocaml.doc ""]
  | PAGE_HEADER_BACKGROUND [@ocaml.doc ""]
  | PAGE_FOOTER_LOGO [@ocaml.doc ""]
  | PAGE_FOOTER_BACKGROUND [@ocaml.doc ""]
  | PAGE_BACKGROUND [@ocaml.doc ""]
  | FORM_BACKGROUND [@ocaml.doc ""]
  | FORM_LOGO [@ocaml.doc ""]
  | IDP_BUTTON_ICON [@ocaml.doc ""]
[@@ocaml.doc ""]

type nonrec asset_type = {
  category : asset_category_type;
      [@ocaml.doc
        "The category that the image corresponds to in your managed login configuration. Managed \
         login has asset categories for different types of logos, backgrounds, and icons.\n"]
  color_mode : color_scheme_mode_type;
      [@ocaml.doc
        "The display-mode target of the asset: light, dark, or browser-adaptive. For example, \
         Amazon Cognito displays a dark-mode image only when the browser or application is in dark \
         mode, but displays a browser-adaptive file in all contexts.\n"]
  extension : asset_extension_type; [@ocaml.doc "The file type of the image file.\n"]
  bytes : asset_bytes_type option; [@ocaml.doc "The image file, in Base64-encoded binary.\n"]
  resource_id : resource_id_type option; [@ocaml.doc "The ID of the asset.\n"]
}
[@@ocaml.doc "An image file from a managed login branding style in a user pool.\n"]

type nonrec asset_list_type = asset_type list [@@ocaml.doc ""]

type nonrec document = Smaws_Lib.CoreTypes.Document.t [@@ocaml.doc ""]

type nonrec managed_login_branding_id_type = string [@@ocaml.doc ""]

type nonrec managed_login_branding_type = {
  managed_login_branding_id : managed_login_branding_id_type option;
      [@ocaml.doc "The ID of the managed login branding style.\n"]
  user_pool_id : user_pool_id_type option;
      [@ocaml.doc "The user pool where the branding style is assigned.\n"]
  use_cognito_provided_values : boolean_type option;
      [@ocaml.doc
        "When true, applies the default branding style options. This option reverts to default \
         style options that are managed by Amazon Cognito. You can modify them later in the \
         branding editor.\n\n\
        \ When you specify [true] for this option, you must also omit values for [Settings] and \
         [Assets] in the request.\n\
        \ "]
  settings : document option;
      [@ocaml.doc
        "A JSON file, encoded as a [Document] type, with the the settings that you want to apply \
         to your style.\n\n\
        \ The following components are not currently implemented and reserved for future use:\n\
        \ \n\
        \  {ul\n\
        \        {-   [signUp] \n\
        \            \n\
        \             }\n\
        \        {-   [instructions] \n\
        \            \n\
        \             }\n\
        \        {-   [sessionTimerDisplay] \n\
        \            \n\
        \             }\n\
        \        {-   [languageSelector] (for localization, see \
         {{:https://docs.aws.amazon.com/cognito/latest/developerguide/cognito-user-pools-managed-login.html#managed-login-localization}Managed \
         login localization)} \n\
        \            \n\
        \             }\n\
        \        }\n\
        \  "]
  assets : asset_list_type option;
      [@ocaml.doc
        "An array of image files that you want to apply to roles like backgrounds, logos, and \
         icons. Each object must also indicate whether it is for dark mode, light mode, or \
         browser-adaptive mode.\n"]
  creation_date : date_type option;
      [@ocaml.doc
        "The date and time when the item was created. Amazon Cognito returns this timestamp in \
         UNIX epoch time format. Your SDK might render the output in a human-readable format like \
         ISO 8601 or a Java [Date] object.\n"]
  last_modified_date : date_type option;
      [@ocaml.doc
        "The date and time when the item was modified. Amazon Cognito returns this timestamp in \
         UNIX epoch time format. Your SDK might render the output in a human-readable format like \
         ISO 8601 or a Java [Date] object.\n"]
}
[@@ocaml.doc "A managed login branding style that's assigned to a user pool app client.\n"]

type nonrec update_managed_login_branding_response = {
  managed_login_branding : managed_login_branding_type option;
      [@ocaml.doc "The details of the branding style that you updated.\n"]
}
[@@ocaml.doc ""]

type nonrec update_managed_login_branding_request = {
  user_pool_id : user_pool_id_type option;
      [@ocaml.doc
        "The ID of the user pool that contains the managed login branding style that you want to \
         update.\n"]
  managed_login_branding_id : managed_login_branding_id_type option;
      [@ocaml.doc "The ID of the managed login branding style that you want to update.\n"]
  use_cognito_provided_values : boolean_type option;
      [@ocaml.doc
        "When [true], applies the default branding style options. This option reverts to default \
         style options that are managed by Amazon Cognito. You can modify them later in the \
         branding editor.\n\n\
        \ When you specify [true] for this option, you must also omit values for [Settings] and \
         [Assets] in the request.\n\
        \ "]
  settings : document option;
      [@ocaml.doc
        "A JSON file, encoded as a [Document] type, with the the settings that you want to apply \
         to your style.\n\n\
        \ The following components are not currently implemented and reserved for future use:\n\
        \ \n\
        \  {ul\n\
        \        {-   [signUp] \n\
        \            \n\
        \             }\n\
        \        {-   [instructions] \n\
        \            \n\
        \             }\n\
        \        {-   [sessionTimerDisplay] \n\
        \            \n\
        \             }\n\
        \        {-   [languageSelector] (for localization, see \
         {{:https://docs.aws.amazon.com/cognito/latest/developerguide/cognito-user-pools-managed-login.html#managed-login-localization}Managed \
         login localization)} \n\
        \            \n\
        \             }\n\
        \        }\n\
        \  "]
  assets : asset_list_type option;
      [@ocaml.doc
        "An array of image files that you want to apply to roles like backgrounds, logos, and \
         icons. Each object must also indicate whether it is for dark mode, light mode, or \
         browser-adaptive mode.\n"]
}
[@@ocaml.doc ""]

type nonrec unsupported_identity_provider_exception = {
  message : message_type option; [@ocaml.doc ""]
}
[@@ocaml.doc "This exception is thrown when the specified identifier isn't supported.\n"]

type nonrec idp_identifier_type = string [@@ocaml.doc ""]

type nonrec idp_identifiers_list_type = idp_identifier_type list [@@ocaml.doc ""]

type nonrec attribute_mapping_key_type = string [@@ocaml.doc ""]

type nonrec attribute_mapping_type = (attribute_mapping_key_type * string_type) list
[@@ocaml.doc ""]

type nonrec provider_details_type = (string_type * string_type) list [@@ocaml.doc ""]

type nonrec identity_provider_type_type =
  | SAML [@ocaml.doc ""]
  | Facebook [@ocaml.doc ""]
  | Google [@ocaml.doc ""]
  | LoginWithAmazon [@ocaml.doc ""]
  | SignInWithApple [@ocaml.doc ""]
  | OIDC [@ocaml.doc ""]
[@@ocaml.doc ""]

type nonrec identity_provider_type = {
  user_pool_id : user_pool_id_type option;
      [@ocaml.doc "The ID of the user pool associated with the IdP.\n"]
  provider_name : provider_name_type option; [@ocaml.doc "A friendly name for the IdP.\n"]
  provider_type : identity_provider_type_type option;
      [@ocaml.doc "The type of IdP. Either SAML, OIDC, or a named social identity provider.\n"]
  provider_details : provider_details_type option;
      [@ocaml.doc
        "The scopes, URLs, and identifiers for your external identity provider. The following \
         examples describe the provider detail keys for each IdP type. These values and their \
         schema are subject to change. Social IdP [authorize_scopes] values must match the values \
         listed here.\n\n\
        \  OpenID Connect (OIDC)  Amazon Cognito accepts the following elements when it can't \
         discover endpoint URLs from [oidc_issuer]: [attributes_url], [authorize_url], [jwks_uri], \
         [token_url].\n\
        \                         \n\
        \                          Create or update request: [\"ProviderDetails\": {\n\
        \                    \"attributes_request_method\": \"GET\", \"attributes_url\":\n\
        \                    \"https://auth.example.com/userInfo\", \"authorize_scopes\": \"openid \
         profile\n\
        \                    email\", \"authorize_url\": \"https://auth.example.com/authorize\",\n\
        \                    \"client_id\": \"1example23456789\", \"client_secret\":\n\
        \                    \"provider-app-client-secret\", \"jwks_uri\":\n\
        \                    \"https://auth.example.com/.well-known/jwks.json\", \"oidc_issuer\":\n\
        \                    \"https://auth.example.com\", \"token_url\": \
         \"https://example.com/token\"\n\
        \                    }] \n\
        \                          \n\
        \                           Describe response: [\"ProviderDetails\": { \
         \"attributes_request_method\":\n\
        \                    \"GET\", \"attributes_url\": \"https://auth.example.com/userInfo\",\n\
        \                    \"attributes_url_add_attributes\": \"false\", \"authorize_scopes\": \
         \"openid\n\
        \                    profile email\", \"authorize_url\": \
         \"https://auth.example.com/authorize\",\n\
        \                    \"client_id\": \"1example23456789\", \"client_secret\":\n\
        \                    \"provider-app-client-secret\", \"jwks_uri\":\n\
        \                    \"https://auth.example.com/.well-known/jwks.json\", \"oidc_issuer\":\n\
        \                    \"https://auth.example.com\", \"token_url\": \
         \"https://example.com/token\"\n\
        \                    }] \n\
        \                           \n\
        \                             SAML  Create or update request with Metadata URL: \
         [\"ProviderDetails\": { \"IDPInit\": \"true\",\n\
        \                    \"IDPSignout\": \"true\", \"EncryptedResponses\" : \"true\", \
         \"MetadataURL\":\n\
        \                    \"https://auth.example.com/sso/saml/metadata\", \
         \"RequestSigningAlgorithm\":\n\
        \                    \"rsa-sha256\" }] \n\
        \                                   \n\
        \                                    Create or update request with Metadata file: \
         [\"ProviderDetails\": { \"IDPInit\": \"true\",\n\
        \                    \"IDPSignout\": \"true\", \"EncryptedResponses\" : \"true\",  \n\
        \                    \"MetadataFile\": \"\\[metadata XML\\]\", \"RequestSigningAlgorithm\":\n\
        \                    \"rsa-sha256\" }] \n\
        \                                    \n\
        \                                     The value of [MetadataFile] must be the plaintext \
         metadata document with all quote (\") characters escaped by backslashes.\n\
        \                                     \n\
        \                                      Describe response: [\"ProviderDetails\": { \
         \"IDPInit\": \"true\",\n\
        \                    \"IDPSignout\": \"true\", \"EncryptedResponses\" : \"true\", \
         \"ActiveEncryptionCertificate\": \"\\[certificate\\]\",\n\
        \                    \"MetadataURL\": \"https://auth.example.com/sso/saml/metadata\", \
         \"RequestSigningAlgorithm\":\n\
        \                    \"rsa-sha256\", \"SLORedirectBindingURI\":\n\
        \                    \"https://auth.example.com/slo/saml\", \"SSORedirectBindingURI\":\n\
        \                    \"https://auth.example.com/sso/saml\" }] \n\
        \                                      \n\
        \                                        LoginWithAmazon  Create or update request: \
         [\"ProviderDetails\": { \"authorize_scopes\":\n\
        \                    \"profile postal_code\", \"client_id\":\n\
        \                    \"amzn1.application-oa2-client.1example23456789\", \"client_secret\":\n\
        \                    \"provider-app-client-secret\"] \n\
        \                                                         \n\
        \                                                          Describe response: \
         [\"ProviderDetails\": { \"attributes_url\":\n\
        \                    \"https://api.amazon.com/user/profile\", \
         \"attributes_url_add_attributes\":\n\
        \                    \"false\", \"authorize_scopes\": \"profile postal_code\", \
         \"authorize_url\":\n\
        \                    \"https://www.amazon.com/ap/oa\", \"client_id\":\n\
        \                    \"amzn1.application-oa2-client.1example23456789\", \"client_secret\":\n\
        \                    \"provider-app-client-secret\", \"token_request_method\": \"POST\",\n\
        \                    \"token_url\": \"https://api.amazon.com/auth/o2/token\" }] \n\
        \                                                          \n\
        \                                                            Google  Create or update \
         request: [\"ProviderDetails\": { \"authorize_scopes\":\n\
        \                    \"email profile openid\", \"client_id\":\n\
        \                    \"1example23456789.apps.googleusercontent.com\", \"client_secret\":\n\
        \                    \"provider-app-client-secret\" }] \n\
        \                                                                    \n\
        \                                                                     Describe response: \
         [\"ProviderDetails\": { \"attributes_url\":\n\
        \                    \"https://people.googleapis.com/v1/people/me?personFields=\",\n\
        \                    \"attributes_url_add_attributes\": \"true\", \"authorize_scopes\": \
         \"email\n\
        \                    profile openid\", \"authorize_url\":\n\
        \                    \"https://accounts.google.com/o/oauth2/v2/auth\", \"client_id\":\n\
        \                    \"1example23456789.apps.googleusercontent.com\", \"client_secret\":\n\
        \                    \"provider-app-client-secret\", \"oidc_issuer\":\n\
        \                    \"https://accounts.google.com\", \"token_request_method\": \"POST\",\n\
        \                    \"token_url\": \"https://www.googleapis.com/oauth2/v4/token\"\n\
        \                }] \n\
        \                                                                     \n\
        \                                                                       SignInWithApple  \n\
         Create or update request: [\"ProviderDetails\": { \"authorize_scopes\":\n\
        \                    \"email name\", \"client_id\": \"com.example.cognito\", \
         \"private_key\": \"1EXAMPLE\", \n\
        \                    \"key_id\": \"2EXAMPLE\", \"team_id\": \"3EXAMPLE\" }] \n\n\
        \ Describe response: [\"ProviderDetails\": {\n\
        \                    \"attributes_url_add_attributes\": \"false\", \"authorize_scopes\": \
         \"email\n\
        \                    name\", \"authorize_url\": \
         \"https://appleid.apple.com/auth/authorize\",\n\
        \                    \"client_id\": \"com.example.cognito\", \"key_id\": \"1EXAMPLE\", \
         \"oidc_issuer\":\n\
        \                    \"https://appleid.apple.com\", \"team_id\": \"2EXAMPLE\",\n\
        \                    \"token_request_method\": \"POST\", \"token_url\":\n\
        \                    \"https://appleid.apple.com/auth/token\" }] \n\
        \ \n\
        \   Facebook  Create or update request: [\"ProviderDetails\": { \"api_version\": \"v17.0\", \n\
        \            \"authorize_scopes\": \"public_profile, email\", \"client_id\": \
         \"1example23456789\", \n\
        \            \"client_secret\": \"provider-app-client-secret\" }] \n\
        \             \n\
        \              Describe response: [\"ProviderDetails\": \n\
        \            { \"api_version\": \"v17.0\", \"attributes_url\": \
         \"https://graph.facebook.com/v17.0/me?fields=\", \n\
        \            \"attributes_url_add_attributes\": \"true\", \"authorize_scopes\": \
         \"public_profile, email\", \n\
        \            \"authorize_url\": \"https://www.facebook.com/v17.0/dialog/oauth\", \
         \"client_id\": \n\
        \            \"1example23456789\", \"client_secret\": \"provider-app-client-secret\", \
         \"token_request_method\": \n\
        \            \"GET\", \"token_url\": \
         \"https://graph.facebook.com/v17.0/oauth/access_token\" }] \n\
        \              \n\
        \                "]
  attribute_mapping : attribute_mapping_type option;
      [@ocaml.doc "A mapping of IdP attributes to standard and custom user pool attributes.\n"]
  idp_identifiers : idp_identifiers_list_type option;
      [@ocaml.doc
        "A list of IdP identifiers. IdP identifiers are strings that represent friendly names or \
         domain names of IdPs, for example [MyIdP] or [auth.example.com]. You can choose to route \
         user authorization requests to the right IdP with either IdP identifiers or IdP names. \
         For more information, see [identity_provider] and [idp_identifier] at \
         {{:https://docs.aws.amazon.com/cognito/latest/developerguide/authorization-endpoint.html#get-authorize-request-parameters}Authorize \
         endpoint}.\n"]
  last_modified_date : date_type option;
      [@ocaml.doc
        "The date and time when the item was modified. Amazon Cognito returns this timestamp in \
         UNIX epoch time format. Your SDK might render the output in a human-readable format like \
         ISO 8601 or a Java [Date] object.\n"]
  creation_date : date_type option;
      [@ocaml.doc
        "The date and time when the item was created. Amazon Cognito returns this timestamp in \
         UNIX epoch time format. Your SDK might render the output in a human-readable format like \
         ISO 8601 or a Java [Date] object.\n"]
}
[@@ocaml.doc
  "A user pool identity provider (IdP). Contains information about a third-party IdP to a user \
   pool, the attributes that it populates to user profiles, and the trust relationship between the \
   IdP and your user pool.\n"]

type nonrec update_identity_provider_response = {
  identity_provider : identity_provider_type; [@ocaml.doc "The identity provider details.\n"]
}
[@@ocaml.doc ""]

type nonrec update_identity_provider_request = {
  user_pool_id : user_pool_id_type;
      [@ocaml.doc "The Id of the user pool where you want to update your IdP.\n"]
  provider_name : provider_name_type;
      [@ocaml.doc
        "The name of the IdP that you want to update. You can pass the identity provider name in \
         the [identity_provider] query parameter of requests to the \
         {{:https://docs.aws.amazon.com/cognito/latest/developerguide/authorization-endpoint.html}Authorize \
         endpoint} to silently redirect to sign-in with the associated IdP.\n"]
  provider_details : provider_details_type option;
      [@ocaml.doc
        "The scopes, URLs, and identifiers for your external identity provider. The following \
         examples describe the provider detail keys for each IdP type. These values and their \
         schema are subject to change. Social IdP [authorize_scopes] values must match the values \
         listed here.\n\n\
        \  OpenID Connect (OIDC)  Amazon Cognito accepts the following elements when it can't \
         discover endpoint URLs from [oidc_issuer]: [attributes_url], [authorize_url], [jwks_uri], \
         [token_url].\n\
        \                         \n\
        \                          Create or update request: [\"ProviderDetails\": {\n\
        \                    \"attributes_request_method\": \"GET\", \"attributes_url\":\n\
        \                    \"https://auth.example.com/userInfo\", \"authorize_scopes\": \"openid \
         profile\n\
        \                    email\", \"authorize_url\": \"https://auth.example.com/authorize\",\n\
        \                    \"client_id\": \"1example23456789\", \"client_secret\":\n\
        \                    \"provider-app-client-secret\", \"jwks_uri\":\n\
        \                    \"https://auth.example.com/.well-known/jwks.json\", \"oidc_issuer\":\n\
        \                    \"https://auth.example.com\", \"token_url\": \
         \"https://example.com/token\"\n\
        \                    }] \n\
        \                          \n\
        \                           Describe response: [\"ProviderDetails\": { \
         \"attributes_request_method\":\n\
        \                    \"GET\", \"attributes_url\": \"https://auth.example.com/userInfo\",\n\
        \                    \"attributes_url_add_attributes\": \"false\", \"authorize_scopes\": \
         \"openid\n\
        \                    profile email\", \"authorize_url\": \
         \"https://auth.example.com/authorize\",\n\
        \                    \"client_id\": \"1example23456789\", \"client_secret\":\n\
        \                    \"provider-app-client-secret\", \"jwks_uri\":\n\
        \                    \"https://auth.example.com/.well-known/jwks.json\", \"oidc_issuer\":\n\
        \                    \"https://auth.example.com\", \"token_url\": \
         \"https://example.com/token\"\n\
        \                    }] \n\
        \                           \n\
        \                             SAML  Create or update request with Metadata URL: \
         [\"ProviderDetails\": { \"IDPInit\": \"true\",\n\
        \                    \"IDPSignout\": \"true\", \"EncryptedResponses\" : \"true\", \
         \"MetadataURL\":\n\
        \                    \"https://auth.example.com/sso/saml/metadata\", \
         \"RequestSigningAlgorithm\":\n\
        \                    \"rsa-sha256\" }] \n\
        \                                   \n\
        \                                    Create or update request with Metadata file: \
         [\"ProviderDetails\": { \"IDPInit\": \"true\",\n\
        \                    \"IDPSignout\": \"true\", \"EncryptedResponses\" : \"true\",  \n\
        \                    \"MetadataFile\": \"\\[metadata XML\\]\", \"RequestSigningAlgorithm\":\n\
        \                    \"rsa-sha256\" }] \n\
        \                                    \n\
        \                                     The value of [MetadataFile] must be the plaintext \
         metadata document with all quote (\") characters escaped by backslashes.\n\
        \                                     \n\
        \                                      Describe response: [\"ProviderDetails\": { \
         \"IDPInit\": \"true\",\n\
        \                    \"IDPSignout\": \"true\", \"EncryptedResponses\" : \"true\", \
         \"ActiveEncryptionCertificate\": \"\\[certificate\\]\",\n\
        \                    \"MetadataURL\": \"https://auth.example.com/sso/saml/metadata\", \
         \"RequestSigningAlgorithm\":\n\
        \                    \"rsa-sha256\", \"SLORedirectBindingURI\":\n\
        \                    \"https://auth.example.com/slo/saml\", \"SSORedirectBindingURI\":\n\
        \                    \"https://auth.example.com/sso/saml\" }] \n\
        \                                      \n\
        \                                        LoginWithAmazon  Create or update request: \
         [\"ProviderDetails\": { \"authorize_scopes\":\n\
        \                    \"profile postal_code\", \"client_id\":\n\
        \                    \"amzn1.application-oa2-client.1example23456789\", \"client_secret\":\n\
        \                    \"provider-app-client-secret\"] \n\
        \                                                         \n\
        \                                                          Describe response: \
         [\"ProviderDetails\": { \"attributes_url\":\n\
        \                    \"https://api.amazon.com/user/profile\", \
         \"attributes_url_add_attributes\":\n\
        \                    \"false\", \"authorize_scopes\": \"profile postal_code\", \
         \"authorize_url\":\n\
        \                    \"https://www.amazon.com/ap/oa\", \"client_id\":\n\
        \                    \"amzn1.application-oa2-client.1example23456789\", \"client_secret\":\n\
        \                    \"provider-app-client-secret\", \"token_request_method\": \"POST\",\n\
        \                    \"token_url\": \"https://api.amazon.com/auth/o2/token\" }] \n\
        \                                                          \n\
        \                                                            Google  Create or update \
         request: [\"ProviderDetails\": { \"authorize_scopes\":\n\
        \                    \"email profile openid\", \"client_id\":\n\
        \                    \"1example23456789.apps.googleusercontent.com\", \"client_secret\":\n\
        \                    \"provider-app-client-secret\" }] \n\
        \                                                                    \n\
        \                                                                     Describe response: \
         [\"ProviderDetails\": { \"attributes_url\":\n\
        \                    \"https://people.googleapis.com/v1/people/me?personFields=\",\n\
        \                    \"attributes_url_add_attributes\": \"true\", \"authorize_scopes\": \
         \"email\n\
        \                    profile openid\", \"authorize_url\":\n\
        \                    \"https://accounts.google.com/o/oauth2/v2/auth\", \"client_id\":\n\
        \                    \"1example23456789.apps.googleusercontent.com\", \"client_secret\":\n\
        \                    \"provider-app-client-secret\", \"oidc_issuer\":\n\
        \                    \"https://accounts.google.com\", \"token_request_method\": \"POST\",\n\
        \                    \"token_url\": \"https://www.googleapis.com/oauth2/v4/token\"\n\
        \                }] \n\
        \                                                                     \n\
        \                                                                       SignInWithApple  \n\
         Create or update request: [\"ProviderDetails\": { \"authorize_scopes\":\n\
        \                    \"email name\", \"client_id\": \"com.example.cognito\", \
         \"private_key\": \"1EXAMPLE\", \n\
        \                    \"key_id\": \"2EXAMPLE\", \"team_id\": \"3EXAMPLE\" }] \n\n\
        \ Describe response: [\"ProviderDetails\": {\n\
        \                    \"attributes_url_add_attributes\": \"false\", \"authorize_scopes\": \
         \"email\n\
        \                    name\", \"authorize_url\": \
         \"https://appleid.apple.com/auth/authorize\",\n\
        \                    \"client_id\": \"com.example.cognito\", \"key_id\": \"1EXAMPLE\", \
         \"oidc_issuer\":\n\
        \                    \"https://appleid.apple.com\", \"team_id\": \"2EXAMPLE\",\n\
        \                    \"token_request_method\": \"POST\", \"token_url\":\n\
        \                    \"https://appleid.apple.com/auth/token\" }] \n\
        \ \n\
        \   Facebook  Create or update request: [\"ProviderDetails\": { \"api_version\": \"v17.0\", \n\
        \            \"authorize_scopes\": \"public_profile, email\", \"client_id\": \
         \"1example23456789\", \n\
        \            \"client_secret\": \"provider-app-client-secret\" }] \n\
        \             \n\
        \              Describe response: [\"ProviderDetails\": \n\
        \            { \"api_version\": \"v17.0\", \"attributes_url\": \
         \"https://graph.facebook.com/v17.0/me?fields=\", \n\
        \            \"attributes_url_add_attributes\": \"true\", \"authorize_scopes\": \
         \"public_profile, email\", \n\
        \            \"authorize_url\": \"https://www.facebook.com/v17.0/dialog/oauth\", \
         \"client_id\": \n\
        \            \"1example23456789\", \"client_secret\": \"provider-app-client-secret\", \
         \"token_request_method\": \n\
        \            \"GET\", \"token_url\": \
         \"https://graph.facebook.com/v17.0/oauth/access_token\" }] \n\
        \              \n\
        \                "]
  attribute_mapping : attribute_mapping_type option;
      [@ocaml.doc
        "A mapping of IdP attributes to standard and custom user pool attributes. Specify a user \
         pool attribute as the key of the key-value pair, and the IdP attribute claim name as the \
         value.\n"]
  idp_identifiers : idp_identifiers_list_type option;
      [@ocaml.doc
        "An array of IdP identifiers, for example [\"IdPIdentifiers\": \\[ \"MyIdP\", \"MyIdP2\"\n\
        \                \\]]. Identifiers are friendly names that you can pass in the \
         [idp_identifier] query parameter of requests to the \
         {{:https://docs.aws.amazon.com/cognito/latest/developerguide/authorization-endpoint.html}Authorize \
         endpoint} to silently redirect to sign-in with the associated IdP. Identifiers in a \
         domain format also enable the use of \
         {{:https://docs.aws.amazon.com/cognito/latest/developerguide/cognito-user-pools-managing-saml-idp-naming.html}email-address \
         matching with SAML providers}. \n"]
}
[@@ocaml.doc ""]

type nonrec precedence_type = int [@@ocaml.doc ""]

type nonrec description_type = string [@@ocaml.doc ""]

type nonrec group_name_type = string [@@ocaml.doc ""]

type nonrec group_type = {
  group_name : group_name_type option; [@ocaml.doc "The name of the group.\n"]
  user_pool_id : user_pool_id_type option;
      [@ocaml.doc "The ID of the user pool that contains the group.\n"]
  description : description_type option; [@ocaml.doc "A friendly description of the group.\n"]
  role_arn : arn_type option;
      [@ocaml.doc
        "The ARN of the IAM role associated with the group. If a group has the highest priority of \
         a user's groups, users who authenticate with an identity pool get credentials for the \
         [RoleArn] that's associated with the group.\n"]
  precedence : precedence_type option;
      [@ocaml.doc
        "A non-negative integer value that specifies the precedence of this group relative to the \
         other groups that a user can belong to in the user pool. Zero is the highest precedence \
         value. Groups with lower [Precedence] values take precedence over groups with higher \
         ornull [Precedence] values. If a user belongs to two or more groups, it is the group with \
         the lowest precedence value whose role ARN is given in the user's tokens for the \
         [cognito:roles] and [cognito:preferred_role] claims.\n\n\
        \ Two groups can have the same [Precedence] value. If this happens, neither group takes \
         precedence over the other. If two groups with the same [Precedence] have the same role \
         ARN, that role is used in the [cognito:preferred_role] claim in tokens for users in each \
         group. If the two groups have different role ARNs, the [cognito:preferred_role] claim \
         isn't set in users' tokens.\n\
        \ \n\
        \  The default [Precedence] value is [null].\n\
        \  "]
  last_modified_date : date_type option;
      [@ocaml.doc
        "The date and time when the item was modified. Amazon Cognito returns this timestamp in \
         UNIX epoch time format. Your SDK might render the output in a human-readable format like \
         ISO 8601 or a Java [Date] object.\n"]
  creation_date : date_type option;
      [@ocaml.doc
        "The date and time when the item was created. Amazon Cognito returns this timestamp in \
         UNIX epoch time format. Your SDK might render the output in a human-readable format like \
         ISO 8601 or a Java [Date] object.\n"]
}
[@@ocaml.doc
  "A user pool group. Contains details about the group and the way that it contributes to IAM role \
   decisions with identity pools. Identity pools can make decisions about the IAM role to assign \
   based on groups: users get credentials for the role associated with their highest-priority \
   group.\n"]

type nonrec update_group_response = {
  group : group_type option;
      [@ocaml.doc
        "Contains the updated details of the group, including precedence, IAM role, and description.\n"]
}
[@@ocaml.doc ""]

type nonrec update_group_request = {
  group_name : group_name_type; [@ocaml.doc "The name of the group that you want to update.\n"]
  user_pool_id : user_pool_id_type;
      [@ocaml.doc "The ID of the user pool that contains the group you want to update.\n"]
  description : description_type option; [@ocaml.doc "A new description of the existing group.\n"]
  role_arn : arn_type option;
      [@ocaml.doc
        "The Amazon Resource Name (ARN) of an IAM role that you want to associate with the group. \
         The role assignment contributes to the [cognito:roles] and [cognito:preferred_role] \
         claims in group members' tokens.\n"]
  precedence : precedence_type option;
      [@ocaml.doc
        "A non-negative integer value that specifies the precedence of this group relative to the \
         other groups that a user can belong to in the user pool. Zero is the highest precedence \
         value. Groups with lower [Precedence] values take precedence over groups with higher or \
         null [Precedence] values. If a user belongs to two or more groups, it is the group with \
         the lowest precedence value whose role ARN is given in the user's tokens for the \
         [cognito:roles] and [cognito:preferred_role] claims.\n\n\
        \ Two groups can have the same [Precedence] value. If this happens, neither group takes \
         precedence over the other. If two groups with the same [Precedence] have the same role \
         ARN, that role is used in the [cognito:preferred_role] claim in tokens for users in each \
         group. If the two groups have different role ARNs, the [cognito:preferred_role] claim \
         isn't set in users' tokens.\n\
        \ \n\
        \  The default [Precedence] value is null. The maximum [Precedence] value is [2^31-1].\n\
        \  "]
}
[@@ocaml.doc ""]

type nonrec update_device_status_response = unit [@@ocaml.doc ""]

type nonrec device_remembered_status_type =
  | REMEMBERED [@ocaml.doc ""]
  | NOT_REMEMBERED [@ocaml.doc ""]
[@@ocaml.doc ""]

type nonrec device_key_type = string [@@ocaml.doc ""]

type nonrec update_device_status_request = {
  access_token : token_model_type;
      [@ocaml.doc
        "A valid access token that Amazon Cognito issued to the currently signed-in user. Must \
         include a scope claim for [aws.cognito.signin.user.admin].\n"]
  device_key : device_key_type;
      [@ocaml.doc
        "The device key of the device you want to update, for example \
         [us-west-2_a1b2c3d4-5678-90ab-cdef-EXAMPLE11111].\n"]
  device_remembered_status : device_remembered_status_type option;
      [@ocaml.doc
        "To enable device authentication with the specified device, set to [remembered].To \
         disable, set to [not_remembered].\n"]
}
[@@ocaml.doc "Represents the request to update the device status.\n"]

type nonrec user_pool_add_on_not_enabled_exception = {
  message : message_type option; [@ocaml.doc ""]
}
[@@ocaml.doc "This exception is thrown when user pool add-ons aren't enabled.\n"]

type nonrec update_auth_event_feedback_response = unit [@@ocaml.doc ""]

type nonrec feedback_value_type = VALID [@ocaml.doc ""] | INVALID [@ocaml.doc ""] [@@ocaml.doc ""]

type nonrec event_id_type = string [@@ocaml.doc ""]

type nonrec username_type = string [@@ocaml.doc ""]

type nonrec update_auth_event_feedback_request = {
  user_pool_id : user_pool_id_type;
      [@ocaml.doc "The ID of the user pool where you want to update auth event feedback.\n"]
  username : username_type;
      [@ocaml.doc
        "The name of the user that you want to query or modify. The value of this parameter is \
         typically your user's username, but it can be any of their alias attributes. If \
         [username] isn't an alias attribute in your user pool, this value must be the [sub] of a \
         local user or the username of a user from a third-party IdP.\n"]
  event_id : event_id_type;
      [@ocaml.doc "The ID of the authentication event that you want to submit feedback for.\n"]
  feedback_token : token_model_type;
      [@ocaml.doc
        "The feedback token, an encrypted object generated by Amazon Cognito and passed to your \
         user in the notification email message from the event.\n"]
  feedback_value : feedback_value_type;
      [@ocaml.doc
        "Your feedback to the authentication event. When you provide a [FeedbackValue] value of \
         [valid], you tell Amazon Cognito that you trust a user session where Amazon Cognito has \
         evaluated some level of risk. When you provide a [FeedbackValue] value of [invalid], you \
         tell Amazon Cognito that you don't trust a user session, or you don't believe that Amazon \
         Cognito evaluated a high-enough risk level.\n"]
}
[@@ocaml.doc ""]

type nonrec untag_resource_response = unit [@@ocaml.doc ""]

type nonrec user_pool_tags_list_type = tag_keys_type list [@@ocaml.doc ""]

type nonrec untag_resource_request = {
  resource_arn : arn_type;
      [@ocaml.doc
        "The Amazon Resource Name (ARN) of the user pool that the tags are assigned to.\n"]
  tag_keys : user_pool_tags_list_type;
      [@ocaml.doc "An array of tag keys that you want to remove from the user pool.\n"]
}
[@@ocaml.doc ""]

type nonrec tag_resource_response = unit [@@ocaml.doc ""]

type nonrec tag_resource_request = {
  resource_arn : arn_type;
      [@ocaml.doc "The Amazon Resource Name (ARN) of the user pool to assign the tags to.\n"]
  tags : user_pool_tags_type;
      [@ocaml.doc "An array of tag keys and values that you want to assign to the user pool.\n"]
}
[@@ocaml.doc ""]

type nonrec precondition_not_met_exception = {
  message : message_type option;
      [@ocaml.doc "The message returned when a precondition is not met.\n"]
}
[@@ocaml.doc "This exception is thrown when a precondition is not met.\n"]

type nonrec completion_message_type = string [@@ocaml.doc ""]

type nonrec long_type = Smaws_Lib.CoreTypes.Int64.t [@@ocaml.doc ""]

type nonrec user_import_job_status_type =
  | Created [@ocaml.doc ""]
  | Pending [@ocaml.doc ""]
  | InProgress [@ocaml.doc ""]
  | Stopping [@ocaml.doc ""]
  | Expired [@ocaml.doc ""]
  | Stopped [@ocaml.doc ""]
  | Failed [@ocaml.doc ""]
  | Succeeded [@ocaml.doc ""]
[@@ocaml.doc ""]

type nonrec pre_signed_url_type = string [@@ocaml.doc ""]

type nonrec user_import_job_id_type = string [@@ocaml.doc ""]

type nonrec user_import_job_name_type = string [@@ocaml.doc ""]

type nonrec user_import_job_type = {
  job_name : user_import_job_name_type option;
      [@ocaml.doc "The friendly name of the user import job.\n"]
  job_id : user_import_job_id_type option; [@ocaml.doc "The ID of the user import job.\n"]
  user_pool_id : user_pool_id_type option;
      [@ocaml.doc "The ID of the user pool that the users are being imported into.\n"]
  pre_signed_url : pre_signed_url_type option;
      [@ocaml.doc "The pre-signed URL target for uploading the CSV file.\n"]
  creation_date : date_type option;
      [@ocaml.doc
        "The date and time when the item was created. Amazon Cognito returns this timestamp in \
         UNIX epoch time format. Your SDK might render the output in a human-readable format like \
         ISO 8601 or a Java [Date] object.\n"]
  start_date : date_type option; [@ocaml.doc "The date when the user import job was started.\n"]
  completion_date : date_type option;
      [@ocaml.doc "The date when the user import job was completed.\n"]
  status : user_import_job_status_type option;
      [@ocaml.doc
        "The status of the user import job. One of the following:\n\n\
        \ {ul\n\
        \       {-   [Created] - The job was created but not started.\n\
        \           \n\
        \            }\n\
        \       {-   [Pending] - A transition state. You have started the job, but it has not \
         begun importing users yet.\n\
        \           \n\
        \            }\n\
        \       {-   [InProgress] - The job has started, and users are being imported.\n\
        \           \n\
        \            }\n\
        \       {-   [Stopping] - You have stopped the job, but the job has not stopped importing \
         users yet.\n\
        \           \n\
        \            }\n\
        \       {-   [Stopped] - You have stopped the job, and the job has stopped importing users.\n\
        \           \n\
        \            }\n\
        \       {-   [Succeeded] - The job has completed successfully.\n\
        \           \n\
        \            }\n\
        \       {-   [Failed] - The job has stopped due to an error.\n\
        \           \n\
        \            }\n\
        \       {-   [Expired] - You created a job, but did not start the job within 24-48 hours. \
         All data associated with the job was deleted, and the job can't be started.\n\
        \           \n\
        \            }\n\
        \       }\n\
        \  "]
  cloud_watch_logs_role_arn : arn_type option;
      [@ocaml.doc
        "The role Amazon Resource Name (ARN) for the Amazon CloudWatch Logging role for the user \
         import job. For more information, see \"Creating the CloudWatch Logs IAM Role\" in the \
         Amazon Cognito Developer Guide.\n"]
  imported_users : long_type option;
      [@ocaml.doc "The number of users that were successfully imported.\n"]
  skipped_users : long_type option; [@ocaml.doc "The number of users that were skipped.\n"]
  failed_users : long_type option; [@ocaml.doc "The number of users that couldn't be imported.\n"]
  completion_message : completion_message_type option;
      [@ocaml.doc "The message returned when the user import job is completed.\n"]
}
[@@ocaml.doc
  "A user import job in a user pool. Describes the status of user import with a CSV file. For more \
   information, see \
   {{:https://docs.aws.amazon.com/cognito/latest/developerguide/cognito-user-pools-using-import-tool.html}Importing \
   users into user pools from a CSV file}.\n"]

type nonrec stop_user_import_job_response = {
  user_import_job : user_import_job_type option;
      [@ocaml.doc
        "The details of the user import job. Includes logging destination, status, and the Amazon \
         S3 pre-signed URL for CSV upload.\n"]
}
[@@ocaml.doc
  "Represents the response from the server to the request to stop the user import job.\n"]

type nonrec stop_user_import_job_request = {
  user_pool_id : user_pool_id_type; [@ocaml.doc "The ID of the user pool that you want to stop.\n"]
  job_id : user_import_job_id_type; [@ocaml.doc "The ID of a running user import job.\n"]
}
[@@ocaml.doc "Represents the request to stop the user import job.\n"]

type nonrec web_authn_not_enabled_exception = { message : message_type option [@ocaml.doc ""] }
[@@ocaml.doc "This exception is thrown when the passkey feature isn't enabled for the user pool.\n"]

type nonrec web_authn_configuration_missing_exception = {
  message : message_type option; [@ocaml.doc ""]
}
[@@ocaml.doc
  "This exception is thrown when a user pool doesn't have a configured relying party id or a user \
   pool domain.\n"]

type nonrec start_web_authn_registration_response = {
  credential_creation_options : document;
      [@ocaml.doc
        "The information that a user can provide in their request to register with their passkey \
         provider.\n"]
}
[@@ocaml.doc ""]

type nonrec start_web_authn_registration_request = {
  access_token : token_model_type;
      [@ocaml.doc
        "A valid access token that Amazon Cognito issued to the currently signed-in user. Must \
         include a scope claim for [aws.cognito.signin.user.admin].\n"]
}
[@@ocaml.doc ""]

type nonrec start_user_import_job_response = {
  user_import_job : user_import_job_type option;
      [@ocaml.doc
        "The details of the user import job. Includes logging destination, status, and the Amazon \
         S3 pre-signed URL for CSV upload.\n"]
}
[@@ocaml.doc
  "Represents the response from the server to the request to start the user import job.\n"]

type nonrec start_user_import_job_request = {
  user_pool_id : user_pool_id_type;
      [@ocaml.doc "The ID of the user pool that you want to start importing users into.\n"]
  job_id : user_import_job_id_type;
      [@ocaml.doc "The ID of a user import job that you previously created.\n"]
}
[@@ocaml.doc "Represents the request to start the user import job.\n"]

type nonrec username_exists_exception = {
  message : message_type option;
      [@ocaml.doc "The message returned when Amazon Cognito throws a user name exists exception.\n"]
}
[@@ocaml.doc
  "This exception is thrown when Amazon Cognito encounters a user name that already exists in the \
   user pool.\n"]

type nonrec invalid_password_exception = {
  message : message_type option;
      [@ocaml.doc
        "The message returned when Amazon Cognito throws an invalid user password exception.\n"]
}
[@@ocaml.doc "This exception is thrown when Amazon Cognito encounters an invalid password.\n"]

type nonrec sign_up_response = {
  user_confirmed : boolean_type;
      [@ocaml.doc
        "Indicates whether the user was automatically confirmed. You can auto-confirm users with a \
         {{:https://docs.aws.amazon.com/cognito/latest/developerguide/user-pool-lambda-pre-sign-up.html}pre \
         sign-up Lambda trigger}.\n"]
  code_delivery_details : code_delivery_details_type option;
      [@ocaml.doc
        "In user pools that automatically verify and confirm new users, Amazon Cognito sends users \
         a message with a code or link that confirms ownership of the phone number or email \
         address that they entered. The [CodeDeliveryDetails] object is information about the \
         delivery destination for that link or code.\n"]
  user_sub : string_type;
      [@ocaml.doc
        "The unique identifier of the new user, for example [a1b2c3d4-5678-90ab-cdef-EXAMPLE11111].\n"]
  session : session_type option;
      [@ocaml.doc
        "A session Id that you can pass to [ConfirmSignUp] when you want to immediately sign in \
         your user with the [USER_AUTH] flow after they complete sign-up.\n"]
}
[@@ocaml.doc "The response from the server for a registration request.\n"]

type nonrec user_context_data_type = {
  ip_address : string_type option; [@ocaml.doc "The source IP address of your user's device.\n"]
  encoded_data : string_type option;
      [@ocaml.doc
        "Encoded device-fingerprint details that your app collected with the Amazon Cognito \
         context data collection library. For more information, see \
         {{:https://docs.aws.amazon.com/cognito/latest/developerguide/cognito-user-pool-settings-adaptive-authentication.html#user-pool-settings-adaptive-authentication-device-fingerprint}Adding \
         user device and session data to API requests}.\n"]
}
[@@ocaml.doc
  "Contextual data, such as the user's device fingerprint, IP address, or location, used for \
   evaluating the risk of an unexpected event by Amazon Cognito threat protection.\n"]

type nonrec analytics_metadata_type = {
  analytics_endpoint_id : string_type option;
      [@ocaml.doc
        "The endpoint ID. Information that you want to pass to Amazon Pinpoint about where to send \
         notifications.\n"]
}
[@@ocaml.doc
  "Information that your application adds to authentication requests. Applies an endpoint ID to \
   the analytics data that your user pool sends to Amazon Pinpoint.\n\n\
  \ An endpoint ID uniquely identifies a mobile device, email address or phone number that can \
   receive messages from Amazon Pinpoint analytics. For more information about Amazon Web Services \
   Regions that can contain Amazon Pinpoint resources for use with Amazon Cognito user pools, see \
   {{:https://docs.aws.amazon.com/cognito/latest/developerguide/cognito-user-pools-pinpoint-integration.html}Using \
   Amazon Pinpoint analytics with Amazon Cognito user pools}.\n\
  \ "]

type nonrec password_type = string [@@ocaml.doc ""]

type nonrec secret_hash_type = string [@@ocaml.doc ""]

type nonrec sign_up_request = {
  client_id : client_id_type;
      [@ocaml.doc "The ID of the app client where the user wants to sign up.\n"]
  secret_hash : secret_hash_type option;
      [@ocaml.doc
        "A keyed-hash message authentication code (HMAC) calculated using the secret key of a user \
         pool client and username plus the client ID in the message. For more information about \
         [SecretHash], see \
         {{:https://docs.aws.amazon.com/cognito/latest/developerguide/signing-up-users-in-your-app.html#cognito-user-pools-computing-secret-hash}Computing \
         secret hash values}.\n"]
  username : username_type;
      [@ocaml.doc
        "The username of the user that you want to sign up. The value of this parameter is \
         typically a username, but can be any alias attribute in your user pool.\n"]
  password : password_type option;
      [@ocaml.doc
        "The user's proposed password. The password must comply with the \
         {{:https://docs.aws.amazon.com/cognito/latest/developerguide/managing-users-passwords.html}password \
         requirements} of your user pool.\n\n\
        \ Users can sign up without a password when your user pool supports passwordless sign-in \
         with email or SMS OTPs. To create a user with no password, omit this parameter or submit \
         a blank value. You can only create a passwordless user when passwordless sign-in is \
         available.\n\
        \ "]
  user_attributes : attribute_list_type option;
      [@ocaml.doc
        "An array of name-value pairs representing user attributes.\n\n\
        \ For custom attributes, include a [custom:] prefix in the attribute name, for example \
         [custom:department].\n\
        \ "]
  validation_data : attribute_list_type option;
      [@ocaml.doc
        "Temporary user attributes that contribute to the outcomes of your pre sign-up Lambda \
         trigger. This set of key-value pairs are for custom validation of information that you \
         collect from your users but don't need to retain.\n\n\
        \ Your Lambda function can analyze this additional data and act on it. Your function can \
         automatically confirm and verify select users or perform external API operations like \
         logging user attributes and validation data to Amazon CloudWatch Logs.\n\
        \ \n\
        \  For more information about the pre sign-up Lambda trigger, see \
         {{:https://docs.aws.amazon.com/cognito/latest/developerguide/user-pool-lambda-pre-sign-up.html}Pre \
         sign-up Lambda trigger}.\n\
        \  "]
  analytics_metadata : analytics_metadata_type option;
      [@ocaml.doc
        "Information that supports analytics outcomes with Amazon Pinpoint, including the user's \
         endpoint ID. The endpoint ID is a destination for Amazon Pinpoint push notifications, for \
         example a device identifier, email address, or phone number.\n"]
  user_context_data : user_context_data_type option;
      [@ocaml.doc
        "Contextual data about your user session like the device fingerprint, IP address, or \
         location. Amazon Cognito threat protection evaluates the risk of an authentication event \
         based on the context that your app generates and passes to Amazon Cognito when it makes \
         API requests.\n\n\
        \ For more information, see \
         {{:https://docs.aws.amazon.com/cognito/latest/developerguide/user-pool-settings-viewing-threat-protection-app.html}Collecting \
         data for threat protection in applications}.\n\
        \ "]
  client_metadata : client_metadata_type option;
      [@ocaml.doc
        "A map of custom key-value pairs that you can provide as input for any custom workflows \
         that this action triggers. You create custom workflows by assigning Lambda functions to \
         user pool triggers.\n\n\
        \ When Amazon Cognito invokes any of these functions, it passes a JSON payload, which the \
         function receives as input. This payload contains a [clientMetadata] attribute that \
         provides the data that you assigned to the ClientMetadata parameter in your request. In \
         your function code, you can process the [clientMetadata] value to enhance your workflow \
         for your specific needs.\n\
        \ \n\
        \  To review the Lambda trigger types that Amazon Cognito invokes at runtime with API \
         requests, see \
         {{:https://docs.aws.amazon.com/cognito/latest/developerguide/cognito-user-pools-working-with-lambda-triggers.html#lambda-triggers-by-event} \
         Connecting API actions to Lambda triggers} in the {i Amazon Cognito Developer Guide}.\n\
        \  \n\
        \    When you use the [ClientMetadata] parameter, note that Amazon Cognito won't do the \
         following:\n\
        \    \n\
        \     {ul\n\
        \           {-  Store the [ClientMetadata] value. This data is available only to Lambda \
         triggers that are assigned to a user pool to support custom workflows. If your user pool \
         configuration doesn't include triggers, the [ClientMetadata] parameter serves no purpose.\n\
        \               \n\
        \                }\n\
        \           {-  Validate the [ClientMetadata] value.\n\
        \               \n\
        \                }\n\
        \           {-  Encrypt the [ClientMetadata] value. Don't send sensitive information in \
         this parameter.\n\
        \               \n\
        \                }\n\
        \           }\n\
        \   "]
}
[@@ocaml.doc "Represents the request to register a user.\n"]

type nonrec set_user_settings_response = unit [@@ocaml.doc ""]

type nonrec mfa_option_type = {
  delivery_medium : delivery_medium_type option;
      [@ocaml.doc
        "The delivery medium to send the MFA code. You can use this parameter to set only the \
         [SMS] delivery medium value.\n"]
  attribute_name : attribute_name_type option;
      [@ocaml.doc
        "The attribute name of the MFA option type. The only valid value is [phone_number].\n"]
}
[@@ocaml.doc
  " {i This data type is no longer supported.} Applies only to SMS multi-factor authentication \
   (MFA) configurations. Does not apply to time-based one-time password (TOTP) software token MFA \
   configurations.\n"]

type nonrec mfa_option_list_type = mfa_option_type list [@@ocaml.doc ""]

type nonrec set_user_settings_request = {
  access_token : token_model_type;
      [@ocaml.doc
        "A valid access token that Amazon Cognito issued to the currently signed-in user. Must \
         include a scope claim for [aws.cognito.signin.user.admin].\n"]
  mfa_options : mfa_option_list_type;
      [@ocaml.doc
        "You can use this parameter only to set an SMS configuration that uses SMS for delivery.\n"]
}
[@@ocaml.doc "Represents the request to set user settings.\n"]

type nonrec web_authn_factor_configuration_type =
  | SINGLE_FACTOR [@ocaml.doc ""]
  | MULTI_FACTOR_WITH_USER_VERIFICATION [@ocaml.doc ""]
[@@ocaml.doc
  "The configuration of passkey authentication as a single factor or a multi-factor authentication \
   (MFA) method. When set to [MULTI_FACTOR_WITH_USER_VERIFICATION], your user pool requires \
   passkey authenticators to perform {{:https://www.w3.org/TR/webauthn-2/#user-verification}user \
   verification}, for example a biometric or PIN. User verification combined with the passkey \
   constitutes multi-factor authentication. When set to [SINGLE_FACTOR], passkeys are a single \
   authentication factor.\n"]

type nonrec user_verification_type = REQUIRED [@ocaml.doc ""] | PREFERRED [@ocaml.doc ""]
[@@ocaml.doc ""]

type nonrec relying_party_id_type = string [@@ocaml.doc ""]

type nonrec web_authn_configuration_type = {
  relying_party_id : relying_party_id_type option;
      [@ocaml.doc
        "Sets or displays the authentication domain, typically your user pool domain, that passkey \
         providers must use as a relying party (RP) in their configuration.\n\n\
        \ Under the following conditions, the passkey relying party ID must be the fully-qualified \
         domain name of your custom domain:\n\
        \ \n\
        \  {ul\n\
        \        {-  The user pool is configured for passkey authentication.\n\
        \            \n\
        \             }\n\
        \        {-  The user pool has a custom domain, whether or not it also has a prefix domain.\n\
        \            \n\
        \             }\n\
        \        {-  Your application performs authentication with managed login or the classic \
         hosted UI.\n\
        \            \n\
        \             }\n\
        \        }\n\
        \  "]
  user_verification : user_verification_type option;
      [@ocaml.doc
        "When [required], users can only register and sign in users with passkeys that are capable \
         of {{:https://www.w3.org/TR/webauthn-2/#enum-userVerificationRequirement}user \
         verification}. When [preferred], your user pool doesn't require the use of authenticators \
         with user verification but encourages it.\n"]
  factor_configuration : web_authn_factor_configuration_type option;
      [@ocaml.doc
        "Sets whether passkeys can be used as multi-factor authentication (MFA). When set to \
         [MULTI_FACTOR_WITH_USER_VERIFICATION], passkey authentication with user verification \
         satisfies MFA requirements. When set to [SINGLE_FACTOR] or not set, passkeys are a single \
         authentication factor. To activate this setting, your user pool must be in the \
         {{:https://docs.aws.amazon.com/cognito/latest/developerguide/feature-plans-features-essentials.html} \
         Essentials tier} or higher.\n"]
}
[@@ocaml.doc
  "Settings for authentication (MFA) with passkey, or webauthN, biometric and security-key devices \
   in a user pool. Configures the following:\n\n\
  \ {ul\n\
  \       {-  Configuration for requiring user-verification support in passkeys.\n\
  \           \n\
  \            }\n\
  \       {-  The user pool relying-party ID. This is the domain, typically your user pool domain, \
   that user's passkey providers should trust as a receiver of passkey authentication.\n\
  \           \n\
  \            }\n\
  \       {-  The providers that you want to allow as origins for passkey authentication.\n\
  \           \n\
  \            }\n\
  \       }\n\
  \  "]

type nonrec email_mfa_subject_type = string [@@ocaml.doc ""]

type nonrec email_mfa_message_type = string [@@ocaml.doc ""]

type nonrec email_mfa_config_type = {
  message : email_mfa_message_type option;
      [@ocaml.doc
        "The template for the email messages that your user pool sends to users with codes for MFA \
         and sign-in with email OTPs. The message must contain the [{####}] placeholder. In the \
         message, Amazon Cognito replaces this placeholder with the code. If you don't provide \
         this parameter, Amazon Cognito sends messages in the default format.\n"]
  subject : email_mfa_subject_type option;
      [@ocaml.doc
        "The subject of the email messages that your user pool sends to users with codes for MFA \
         and email OTP sign-in.\n"]
}
[@@ocaml.doc
  "Sets or shows configuration for user pool email message MFA and sign-in with one-time passwords \
   (OTPs). Includes the subject and body of the email message template for sign-in and MFA \
   messages. To activate this setting, your user pool must be in the \
   {{:https://docs.aws.amazon.com/cognito/latest/developerguide/feature-plans-features-essentials.html} \
   Essentials tier} or higher.\n"]

type nonrec software_token_mfa_config_type = {
  enabled : boolean_type option; [@ocaml.doc "The activation state of TOTP MFA.\n"]
}
[@@ocaml.doc
  "Settings for time-based one-time password (TOTP) multi-factor authentication (MFA) in a user \
   pool. Enables and disables availability of this feature.\n"]

type nonrec sms_mfa_config_type = {
  sms_authentication_message : sms_verification_message_type option;
      [@ocaml.doc
        "The SMS authentication message that will be sent to users with the code they must sign in \
         with. The message must contain the [{####}] placeholder. Your user pool replaces the \
         placeholder with the MFA code. If this parameter isn't provided, your user pool sends a \
         default message.\n"]
  sms_configuration : sms_configuration_type option;
      [@ocaml.doc
        "User pool configuration for delivery of SMS messages with Amazon Simple Notification \
         Service. To send SMS messages with Amazon SNS in the Amazon Web Services Region that you \
         want, the Amazon Cognito user pool uses an Identity and Access Management (IAM) role in \
         your Amazon Web Services account.\n\n\
        \ You can set [SmsConfiguration] in [CreateUserPool] and [\n\
        \                UpdateUserPool], or in [SetUserPoolMfaConfig].\n\
        \ "]
}
[@@ocaml.doc
  "The configuration of multi-factor authentication (MFA) with SMS messages in a user pool.\n"]

type nonrec set_user_pool_mfa_config_response = {
  sms_mfa_configuration : sms_mfa_config_type option;
      [@ocaml.doc
        "Shows user pool SMS message configuration for MFA and sign-in with SMS-message OTPs. \
         Includes the message template and the SMS message sending configuration for Amazon SNS.\n"]
  software_token_mfa_configuration : software_token_mfa_config_type option;
      [@ocaml.doc
        "Shows user pool configuration for time-based one-time password (TOTP) MFA. Includes TOTP \
         enabled or disabled state.\n"]
  email_mfa_configuration : email_mfa_config_type option;
      [@ocaml.doc
        "Shows configuration for user pool email message MFA and sign-in with one-time passwords \
         (OTPs). Includes the subject and body of the email message template for sign-in and MFA \
         messages. To activate this setting, your user pool must be in the \
         {{:https://docs.aws.amazon.com/cognito/latest/developerguide/feature-plans-features-essentials.html} \
         Essentials tier} or higher.\n"]
  mfa_configuration : user_pool_mfa_type option;
      [@ocaml.doc
        "Displays multi-factor authentication (MFA) as on, off, or optional. When [ON], all users \
         must set up MFA before they can sign in. When [OPTIONAL], your application must make a \
         client-side determination of whether a user wants to register an MFA device. For user \
         pools with adaptive authentication with threat protection, choose [OPTIONAL].\n\n\
        \ When [MfaConfiguration] is [OPTIONAL], managed login doesn't automatically prompt users \
         to set up MFA. Amazon Cognito generates MFA prompts in API responses and in managed login \
         for users who have chosen and configured a preferred MFA factor.\n\
        \ "]
  web_authn_configuration : web_authn_configuration_type option;
      [@ocaml.doc
        "The configuration of your user pool for passkey, or WebAuthn, sign-in with authenticators \
         such as biometric and security-key devices. Includes relying-party configuration and \
         settings for user-verification requirements.\n"]
}
[@@ocaml.doc ""]

type nonrec set_user_pool_mfa_config_request = {
  user_pool_id : user_pool_id_type; [@ocaml.doc "The user pool ID.\n"]
  sms_mfa_configuration : sms_mfa_config_type option;
      [@ocaml.doc
        "Configures user pool SMS messages for MFA. Sets the message template and the SMS message \
         sending configuration for Amazon SNS.\n"]
  software_token_mfa_configuration : software_token_mfa_config_type option;
      [@ocaml.doc
        "Configures a user pool for time-based one-time password (TOTP) MFA. Enables or disables \
         TOTP.\n"]
  email_mfa_configuration : email_mfa_config_type option;
      [@ocaml.doc
        "Sets configuration for user pool email message MFA and sign-in with one-time passwords \
         (OTPs). Includes the subject and body of the email message template for sign-in and MFA \
         messages. To activate this setting, your user pool must be in the \
         {{:https://docs.aws.amazon.com/cognito/latest/developerguide/feature-plans-features-essentials.html} \
         Essentials tier} or higher.\n"]
  mfa_configuration : user_pool_mfa_type option;
      [@ocaml.doc
        "Sets multi-factor authentication (MFA) to be on, off, or optional. When [ON], all users \
         must set up MFA before they can sign in. When [OPTIONAL], your application must make a \
         client-side determination of whether a user wants to register an MFA device. For user \
         pools with adaptive authentication with threat protection, choose [OPTIONAL].\n\n\
        \ When [MfaConfiguration] is [OPTIONAL], managed login doesn't automatically prompt users \
         to set up MFA. Amazon Cognito generates MFA prompts in API responses and in managed login \
         for users who have chosen and configured a preferred MFA factor.\n\
        \ "]
  web_authn_configuration : web_authn_configuration_type option;
      [@ocaml.doc
        "The configuration of your user pool for passkey, or WebAuthn, authentication and \
         registration. Includes relying-party configuration, user-verification requirements, and \
         whether passkeys can satisfy MFA requirements.\n"]
}
[@@ocaml.doc ""]

type nonrec set_user_mfa_preference_response = unit [@@ocaml.doc ""]

type nonrec web_authn_mfa_settings_type = {
  enabled : boolean_type option;
      [@ocaml.doc
        "Specifies whether passkey MFA is activated for a user. When activated, the user's passkey \
         authentication requires user verification, and passkey sign-in is available when MFA is \
         required. The user must also have at least one other MFA method such as SMS, TOTP, or \
         email activated to prevent account lockout.\n"]
}
[@@ocaml.doc
  "A user's preference for using passkey, or WebAuthn, multi-factor authentication (MFA). Turns \
   passkey MFA on and off for the user. Unlike other MFA settings types, this type doesn't include \
   a [PreferredMfa] option because passkey MFA applies only when passkey is the first \
   authentication factor.\n"]

type nonrec email_mfa_settings_type = {
  enabled : boolean_type option;
      [@ocaml.doc
        "Specifies whether email message MFA is active for a user. When the value of this \
         parameter is [Enabled], the user will be prompted for MFA during all sign-in attempts, \
         unless device tracking is turned on and the device has been trusted.\n"]
  preferred_mfa : boolean_type option;
      [@ocaml.doc "Specifies whether email message MFA is the user's preferred method.\n"]
}
[@@ocaml.doc
  "User preferences for multi-factor authentication with email messages. Activates or deactivates \
   email MFA and sets it as the preferred MFA method when multiple methods are available. To \
   activate this setting, your user pool must be in the \
   {{:https://docs.aws.amazon.com/cognito/latest/developerguide/feature-plans-features-essentials.html} \
   Essentials tier} or higher.\n"]

type nonrec software_token_mfa_settings_type = {
  enabled : boolean_type option;
      [@ocaml.doc
        "Specifies whether software token MFA is activated. If an MFA type is activated for a \
         user, the user will be prompted for MFA during all sign-in attempts, unless device \
         tracking is turned on and the device has been trusted.\n"]
  preferred_mfa : boolean_type option;
      [@ocaml.doc "Specifies whether software token MFA is the preferred MFA method.\n"]
}
[@@ocaml.doc
  "A user's preference for using time-based one-time password (TOTP) multi-factor authentication \
   (MFA). Turns TOTP MFA on and off, and can set TOTP as preferred when other MFA options are \
   available. You can't turn off TOTP MFA for any of your users when MFA is required in your user \
   pool; you can only set the type that your user prefers. \n"]

type nonrec sms_mfa_settings_type = {
  enabled : boolean_type option;
      [@ocaml.doc
        "Specifies whether SMS message MFA is activated. If an MFA type is activated for a user, \
         the user will be prompted for MFA during all sign-in attempts, unless device tracking is \
         turned on and the device has been trusted.\n"]
  preferred_mfa : boolean_type option;
      [@ocaml.doc
        "Specifies whether SMS is the preferred MFA method. If true, your user pool prompts the \
         specified user for a code delivered by SMS message after username-password sign-in \
         succeeds. \n"]
}
[@@ocaml.doc
  "A user's preference for using SMS message multi-factor authentication (MFA). Turns SMS MFA on \
   and off, and can set SMS as preferred when other MFA options are available. You can't turn off \
   SMS MFA for any of your users when MFA is required in your user pool; you can only set the type \
   that your user prefers. \n"]

type nonrec set_user_mfa_preference_request = {
  sms_mfa_settings : sms_mfa_settings_type option;
      [@ocaml.doc
        "User preferences for SMS message MFA. Activates or deactivates SMS MFA and sets it as the \
         preferred MFA method when multiple methods are available.\n"]
  software_token_mfa_settings : software_token_mfa_settings_type option;
      [@ocaml.doc
        "User preferences for time-based one-time password (TOTP) MFA. Activates or deactivates \
         TOTP MFA and sets it as the preferred MFA method when multiple methods are available. \
         Users must register a TOTP authenticator before they set this as their preferred MFA \
         method.\n"]
  email_mfa_settings : email_mfa_settings_type option;
      [@ocaml.doc
        "User preferences for email message MFA. Activates or deactivates email MFA and sets it as \
         the preferred MFA method when multiple methods are available. To activate this setting, \
         your user pool must be in the \
         {{:https://docs.aws.amazon.com/cognito/latest/developerguide/feature-plans-features-essentials.html} \
         Essentials tier} or higher.\n"]
  web_authn_mfa_settings : web_authn_mfa_settings_type option;
      [@ocaml.doc
        "User preferences for passkey MFA. Activates or deactivates passkey MFA for the user. When \
         activated, passkey authentication requires user verification, and passkey sign-in is \
         available when MFA is required. To activate this setting, the [FactorConfiguration] of \
         your user pool [WebAuthnConfiguration] must be [MULTI_FACTOR_WITH_USER_VERIFICATION]. To \
         activate this setting, your user pool must be in the \
         {{:https://docs.aws.amazon.com/cognito/latest/developerguide/feature-plans-features-essentials.html} \
         Essentials tier} or higher.\n"]
  access_token : token_model_type;
      [@ocaml.doc
        "A valid access token that Amazon Cognito issued to the currently signed-in user. Must \
         include a scope claim for [aws.cognito.signin.user.admin].\n"]
}
[@@ocaml.doc ""]

type nonrec css_version_type = string [@@ocaml.doc ""]

type nonrec css_type = string [@@ocaml.doc ""]

type nonrec image_url_type = string [@@ocaml.doc ""]

type nonrec ui_customization_type = {
  user_pool_id : user_pool_id_type option;
      [@ocaml.doc "The ID of the user pool with hosted UI customizations.\n"]
  client_id : client_id_type option;
      [@ocaml.doc
        "The app client ID for your UI customization. When this value isn't present, the \
         customization applies to all user pool app clients that don't have client-level settings..\n"]
  image_url : image_url_type option;
      [@ocaml.doc "A URL path to the hosted logo image of your UI customization.\n"]
  cs_s : css_type option; [@ocaml.doc "The CSS values in the UI customization.\n"]
  css_version : css_version_type option; [@ocaml.doc "The CSS version number.\n"]
  last_modified_date : date_type option;
      [@ocaml.doc
        "The date and time when the item was modified. Amazon Cognito returns this timestamp in \
         UNIX epoch time format. Your SDK might render the output in a human-readable format like \
         ISO 8601 or a Java [Date] object.\n"]
  creation_date : date_type option;
      [@ocaml.doc
        "The date and time when the item was created. Amazon Cognito returns this timestamp in \
         UNIX epoch time format. Your SDK might render the output in a human-readable format like \
         ISO 8601 or a Java [Date] object.\n"]
}
[@@ocaml.doc "A container for the UI customization information for the hosted UI in a user pool.\n"]

type nonrec set_ui_customization_response = {
  ui_customization : ui_customization_type;
      [@ocaml.doc "Information about the hosted UI branding that you applied.\n"]
}
[@@ocaml.doc ""]

type nonrec image_file_type = bytes [@@ocaml.doc ""]

type nonrec set_ui_customization_request = {
  user_pool_id : user_pool_id_type;
      [@ocaml.doc
        "The ID of the user pool where you want to apply branding to the classic hosted UI.\n"]
  client_id : client_id_type option;
      [@ocaml.doc
        "The ID of the app client that you want to customize. To apply a default style to all app \
         clients not configured with client-level branding, set this parameter value to [ALL].\n"]
  cs_s : css_type option;
      [@ocaml.doc
        "A plaintext CSS file that contains the custom fields that you want to apply to your user \
         pool or app client. To download a template, go to the Amazon Cognito console. Navigate to \
         your user pool {i App clients} tab, select {i Login pages}, edit {i Hosted UI (classic) \
         style}, and select the link to [CSS template.css].\n"]
  image_file : image_file_type option;
      [@ocaml.doc
        "The image that you want to set as your login in the classic hosted UI, as a \
         Base64-formatted binary object.\n"]
}
[@@ocaml.doc ""]

type nonrec skipped_ip_range_list_type = string_type list [@@ocaml.doc ""]

type nonrec blocked_ip_range_list_type = string_type list [@@ocaml.doc ""]

type nonrec risk_exception_configuration_type = {
  blocked_ip_range_list : blocked_ip_range_list_type option;
      [@ocaml.doc
        "An always-block IP address list. Overrides the risk decision and always blocks \
         authentication requests. This parameter is displayed and set in CIDR notation.\n"]
  skipped_ip_range_list : skipped_ip_range_list_type option;
      [@ocaml.doc
        "An always-allow IP address list. Risk detection isn't performed on the IP addresses in \
         this range list. This parameter is displayed and set in CIDR notation.\n"]
}
[@@ocaml.doc
  "Exceptions to the risk evaluation configuration, including always-allow and always-block IP \
   address ranges. \n"]

type nonrec account_takeover_event_action_type =
  | BLOCK [@ocaml.doc ""]
  | MFA_IF_CONFIGURED [@ocaml.doc ""]
  | MFA_REQUIRED [@ocaml.doc ""]
  | NO_ACTION [@ocaml.doc ""]
[@@ocaml.doc ""]

type nonrec account_takeover_action_notify_type = bool [@@ocaml.doc ""]

type nonrec account_takeover_action_type = {
  notify : account_takeover_action_notify_type;
      [@ocaml.doc
        "Determines whether Amazon Cognito sends a user a notification message when your user \
         pools assesses a user's session at the associated risk level.\n"]
  event_action : account_takeover_event_action_type;
      [@ocaml.doc
        "The action to take for the attempted account takeover action for the associated risk \
         level. Valid values are as follows:\n\n\
        \ {ul\n\
        \       {-   [BLOCK]: Block the request.\n\
        \           \n\
        \            }\n\
        \       {-   [MFA_IF_CONFIGURED]: Present an MFA challenge if possible. MFA is possible if \
         the user pool has active MFA methods that the user can set up. For example, if the user \
         pool only supports SMS message MFA but the user doesn't have a phone number attribute, \
         MFA setup isn't possible. If MFA setup isn't possible, allow the request.\n\
        \           \n\
        \            }\n\
        \       {-   [MFA_REQUIRED]: Present an MFA challenge if possible. Block the request if a \
         user hasn't set up MFA. To sign in with required MFA, users must have an email address or \
         phone number attribute, or a registered TOTP factor.\n\
        \           \n\
        \            }\n\
        \       {-   [NO_ACTION]: Take no action. Permit sign-in.\n\
        \           \n\
        \            }\n\
        \       }\n\
        \  "]
}
[@@ocaml.doc
  "The automated response to a risk level for adaptive authentication in full-function, or \
   [ENFORCED], mode. You can assign an action to each risk level that threat protection evaluates.\n"]

type nonrec account_takeover_actions_type = {
  low_action : account_takeover_action_type option;
      [@ocaml.doc "The action that you assign to a low-risk assessment by threat protection.\n"]
  medium_action : account_takeover_action_type option;
      [@ocaml.doc "The action that you assign to a medium-risk assessment by threat protection.\n"]
  high_action : account_takeover_action_type option;
      [@ocaml.doc "The action that you assign to a high-risk assessment by threat protection.\n"]
}
[@@ocaml.doc
  "A list of account-takeover actions for each level of risk that Amazon Cognito might assess with \
   threat protection features.\n"]

type nonrec email_notification_body_type = string [@@ocaml.doc ""]

type nonrec email_notification_subject_type = string [@@ocaml.doc ""]

type nonrec notify_email_type = {
  subject : email_notification_subject_type;
      [@ocaml.doc "The subject of the threat protection email notification.\n"]
  html_body : email_notification_body_type option;
      [@ocaml.doc
        "The body of an email notification formatted in HTML. Choose an [HtmlBody] or a [TextBody] \
         to send an HTML-formatted or plaintext message, respectively.\n"]
  text_body : email_notification_body_type option;
      [@ocaml.doc
        "The body of an email notification formatted in plaintext. Choose an [HtmlBody] or a \
         [TextBody] to send an HTML-formatted or plaintext message, respectively.\n"]
}
[@@ocaml.doc
  "The template for email messages that threat protection sends to a user when your threat \
   protection automated response has a {i Notify} action.\n"]

type nonrec notify_configuration_type = {
  from_ : string_type option;
      [@ocaml.doc
        "The email address that sends the email message. The address must be either individually \
         verified with Amazon Simple Email Service, or from a domain that has been verified with \
         Amazon SES.\n"]
  reply_to : string_type option;
      [@ocaml.doc
        "The reply-to email address of an email template. Can be an email address in the format \
         [admin@example.com] or \n\
         {[\n\
         Administrator \n\
         ]}\n\
         .\n"]
  source_arn : arn_type;
      [@ocaml.doc
        "The Amazon Resource Name (ARN) of the identity that is associated with the sending \
         authorization policy. This identity permits Amazon Cognito to send for the email address \
         specified in the [From] parameter.\n"]
  block_email : notify_email_type option;
      [@ocaml.doc
        "The template for the email message that your user pool sends when a detected risk event \
         is blocked.\n"]
  no_action_email : notify_email_type option;
      [@ocaml.doc
        "The template for the email message that your user pool sends when no action is taken in \
         response to a detected risk.\n"]
  mfa_email : notify_email_type option;
      [@ocaml.doc
        "The template for the email message that your user pool sends when MFA is challenged in \
         response to a detected risk.\n"]
}
[@@ocaml.doc
  "The configuration for Amazon SES email messages that threat protection sends to a user when \
   your adaptive authentication automated response has a {i Notify} action.\n"]

type nonrec account_takeover_risk_configuration_type = {
  notify_configuration : notify_configuration_type option;
      [@ocaml.doc
        "The settings for composing and sending an email message when threat protection assesses a \
         risk level with adaptive authentication. When you choose to notify users in \
         [AccountTakeoverRiskConfiguration], Amazon Cognito sends an email message using the \
         method and template that you set with this data type.\n"]
  actions : account_takeover_actions_type;
      [@ocaml.doc
        "A list of account-takeover actions for each level of risk that Amazon Cognito might \
         assess with threat protection.\n"]
}
[@@ocaml.doc
  "The settings for automated responses and notification templates for adaptive authentication \
   with threat protection features.\n"]

type nonrec compromised_credentials_event_action_type =
  | BLOCK [@ocaml.doc ""]
  | NO_ACTION [@ocaml.doc ""]
[@@ocaml.doc ""]

type nonrec compromised_credentials_actions_type = {
  event_action : compromised_credentials_event_action_type;
      [@ocaml.doc "The action that Amazon Cognito takes when it detects compromised credentials.\n"]
}
[@@ocaml.doc
  "Settings for user pool actions when Amazon Cognito detects compromised credentials with threat \
   protection in full-function [ENFORCED] mode.\n"]

type nonrec event_filter_type =
  | SIGN_IN [@ocaml.doc ""]
  | PASSWORD_CHANGE [@ocaml.doc ""]
  | SIGN_UP [@ocaml.doc ""]
[@@ocaml.doc ""]

type nonrec event_filters_type = event_filter_type list [@@ocaml.doc ""]

type nonrec compromised_credentials_risk_configuration_type = {
  event_filter : event_filters_type option;
      [@ocaml.doc
        "Settings for the sign-in activity where you want to configure compromised-credentials \
         actions. Defaults to all events.\n"]
  actions : compromised_credentials_actions_type;
      [@ocaml.doc
        "Settings for the actions that you want your user pool to take when Amazon Cognito detects \
         compromised credentials.\n"]
}
[@@ocaml.doc
  "Settings for compromised-credentials actions and authentication-event sources with threat \
   protection in full-function [ENFORCED] mode.\n"]

type nonrec risk_configuration_type = {
  user_pool_id : user_pool_id_type option;
      [@ocaml.doc "The ID of the user pool that has the risk configuration applied.\n"]
  client_id : client_id_type option;
      [@ocaml.doc
        "The app client where this configuration is applied. When this parameter isn't present, \
         the risk configuration applies to all user pool app clients that don't have client-level \
         settings.\n"]
  compromised_credentials_risk_configuration :
    compromised_credentials_risk_configuration_type option;
      [@ocaml.doc
        "Settings for compromised-credentials actions and authentication types with threat \
         protection in full-function [ENFORCED] mode.\n"]
  account_takeover_risk_configuration : account_takeover_risk_configuration_type option;
      [@ocaml.doc
        "The settings for automated responses and notification templates for adaptive \
         authentication with threat protection.\n"]
  risk_exception_configuration : risk_exception_configuration_type option;
      [@ocaml.doc
        "Exceptions to the risk evaluation configuration, including always-allow and always-block \
         IP address ranges. \n"]
  last_modified_date : date_type option;
      [@ocaml.doc
        "The date and time when the item was modified. Amazon Cognito returns this timestamp in \
         UNIX epoch time format. Your SDK might render the output in a human-readable format like \
         ISO 8601 or a Java [Date] object.\n"]
}
[@@ocaml.doc
  "The settings of risk configuration for threat protection with threat protection in a user pool.\n"]

type nonrec set_risk_configuration_response = {
  risk_configuration : risk_configuration_type;
      [@ocaml.doc
        "The API response that contains the risk configuration that you set and the timestamp of \
         the most recent change.\n"]
}
[@@ocaml.doc ""]

type nonrec set_risk_configuration_request = {
  user_pool_id : user_pool_id_type;
      [@ocaml.doc
        "The ID of the user pool where you want to set a risk configuration. If you include \
         [UserPoolId] in your request, don't include [ClientId]. When the client ID is null, the \
         same risk configuration is applied to all the clients in the userPool. When you include \
         both [ClientId] and [UserPoolId], Amazon Cognito maps the configuration to the app client \
         only.\n"]
  client_id : client_id_type option;
      [@ocaml.doc
        "The ID of the app client where you want to set a risk configuration. If [ClientId] is \
         null, then the risk configuration is mapped to [UserPoolId]. When the client ID is null, \
         the same risk configuration is applied to all the clients in the userPool.\n\n\
        \ When you include a [ClientId] parameter, Amazon Cognito maps the configuration to the \
         app client. When you include both [ClientId] and [UserPoolId], Amazon Cognito maps the \
         configuration to the app client only.\n\
        \ "]
  compromised_credentials_risk_configuration :
    compromised_credentials_risk_configuration_type option;
      [@ocaml.doc
        "The configuration of automated reactions to detected compromised credentials. Includes \
         settings for blocking future sign-in requests and for the types of password-submission \
         events you want to monitor.\n"]
  account_takeover_risk_configuration : account_takeover_risk_configuration_type option;
      [@ocaml.doc
        "The settings for automated responses and notification templates for adaptive \
         authentication with threat protection.\n"]
  risk_exception_configuration : risk_exception_configuration_type option;
      [@ocaml.doc
        "A set of IP-address overrides to threat protection. You can set up IP-address \
         always-block and always-allow lists.\n"]
}
[@@ocaml.doc ""]

type nonrec firehose_configuration_type = {
  stream_arn : arn_type option;
      [@ocaml.doc
        "The ARN of an Amazon Data Firehose stream that's the destination for threat protection \
         log export.\n"]
}
[@@ocaml.doc
  "Configuration for the Amazon Data Firehose stream destination of user activity log export with \
   threat protection.\n"]

type nonrec s3_arn_type = string [@@ocaml.doc ""]

type nonrec s3_configuration_type = {
  bucket_arn : s3_arn_type option;
      [@ocaml.doc
        "The ARN of an Amazon S3 bucket that's the destination for threat protection log export.\n"]
}
[@@ocaml.doc
  "Configuration for the Amazon S3 bucket destination of user activity log export with threat \
   protection.\n"]

type nonrec cloud_watch_logs_configuration_type = {
  log_group_arn : arn_type option;
      [@ocaml.doc
        "The Amazon Resource Name (arn) of a CloudWatch Logs log group where your user pool sends \
         logs. The log group must not be encrypted with Key Management Service and must be in the \
         same Amazon Web Services account as your user pool.\n\n\
        \ To send logs to log groups with a resource policy of a size greater than 5120 \
         characters, configure a log group with a path that starts with [/aws/vendedlogs]. For \
         more information, see \
         {{:https://docs.aws.amazon.com/AmazonCloudWatch/latest/logs/AWS-logs-and-resource-policy.html}Enabling \
         logging from certain Amazon Web Services services}.\n\
        \ "]
}
[@@ocaml.doc
  "Configuration for the CloudWatch log group destination of user pool detailed activity logging, \
   or of user activity log export with threat protection.\n"]

type nonrec event_source_name =
  | USER_NOTIFICATION [@ocaml.doc ""]
  | USER_AUTH_EVENTS [@ocaml.doc ""]
[@@ocaml.doc ""]

type nonrec log_level = ERROR [@ocaml.doc ""] | INFO [@ocaml.doc ""] [@@ocaml.doc ""]

type nonrec log_configuration_type = {
  log_level : log_level;
      [@ocaml.doc
        "The [errorlevel] selection of logs that a user pool sends for detailed activity logging. \
         To send [userNotification] activity with \
         {{:https://docs.aws.amazon.com/cognito/latest/developerguide/exporting-quotas-and-usage.html}information \
         about message delivery}, choose [ERROR] with [CloudWatchLogsConfiguration]. To send \
         [userAuthEvents] activity with user logs from threat protection with the Plus feature \
         plan, choose [INFO] with one of [CloudWatchLogsConfiguration], [FirehoseConfiguration], \
         or [S3Configuration].\n"]
  event_source : event_source_name;
      [@ocaml.doc
        "The source of events that your user pool sends for logging. To send error-level logs \
         about user notification activity, set to [userNotification]. To send info-level logs \
         about threat-protection user activity in user pools with the Plus feature plan, set to \
         [userAuthEvents].\n"]
  cloud_watch_logs_configuration : cloud_watch_logs_configuration_type option;
      [@ocaml.doc
        "The CloudWatch log group destination of user pool detailed activity logs, or of user \
         activity log export with threat protection.\n"]
  s3_configuration : s3_configuration_type option;
      [@ocaml.doc
        "The Amazon S3 bucket destination of user activity log export with threat protection. To \
         activate this setting, your user pool must be on the \
         {{:https://docs.aws.amazon.com/cognito/latest/developerguide/feature-plans-features-plus.html} \
         Plus tier}.\n"]
  firehose_configuration : firehose_configuration_type option;
      [@ocaml.doc
        "The Amazon Data Firehose stream destination of user activity log export with threat \
         protection. To activate this setting, your user pool must be on the \
         {{:https://docs.aws.amazon.com/cognito/latest/developerguide/feature-plans-features-plus.html} \
         Plus tier}.\n"]
}
[@@ocaml.doc
  "The configuration of user event logs to an external Amazon Web Services service like Amazon \
   Data Firehose, Amazon S3, or Amazon CloudWatch Logs.\n"]

type nonrec log_configuration_list_type = log_configuration_type list [@@ocaml.doc ""]

type nonrec log_delivery_configuration_type = {
  user_pool_id : user_pool_id_type;
      [@ocaml.doc "The ID of the user pool where you configured logging.\n"]
  log_configurations : log_configuration_list_type;
      [@ocaml.doc
        "A logging destination of a user pool. User pools can have multiple logging destinations \
         for message-delivery and user-activity logs.\n"]
}
[@@ocaml.doc
  "The logging parameters of a user pool, as returned in the response to a \
   [GetLogDeliveryConfiguration] request.\n"]

type nonrec set_log_delivery_configuration_response = {
  log_delivery_configuration : log_delivery_configuration_type option;
      [@ocaml.doc "The logging configuration that you applied to the requested user pool.\n"]
}
[@@ocaml.doc ""]

type nonrec set_log_delivery_configuration_request = {
  user_pool_id : user_pool_id_type;
      [@ocaml.doc "The ID of the user pool where you want to configure logging.\n"]
  log_configurations : log_configuration_list_type;
      [@ocaml.doc "A collection of the logging configurations for a user pool.\n"]
}
[@@ocaml.doc ""]

type nonrec unsupported_token_type_exception = { message : message_type option [@ocaml.doc ""] }
[@@ocaml.doc "Exception that is thrown when an unsupported token is passed to an operation.\n"]

type nonrec unsupported_operation_exception = { message : message_type option [@ocaml.doc ""] }
[@@ocaml.doc
  "Exception that is thrown when you attempt to perform an operation that isn't enabled for the \
   user pool client.\n"]

type nonrec unauthorized_exception = { message : message_type option [@ocaml.doc ""] }
[@@ocaml.doc
  "Exception that is thrown when the request isn't authorized. This can happen due to an invalid \
   access token in the request.\n"]

type nonrec revoke_token_response = unit [@@ocaml.doc ""]

type nonrec revoke_token_request = {
  token : token_model_type; [@ocaml.doc "The refresh token that you want to revoke.\n"]
  client_id : client_id_type;
      [@ocaml.doc "The ID of the app client where the token that you want to revoke was issued.\n"]
  client_secret : client_secret_type option;
      [@ocaml.doc "The client secret of the requested app client, if the client has a secret.\n"]
}
[@@ocaml.doc ""]

type nonrec password_history_policy_violation_exception = {
  message : message_type option; [@ocaml.doc ""]
}
[@@ocaml.doc
  "The message returned when a user's new password matches a previous password and doesn't comply \
   with the password-history policy.\n"]

type nonrec mfa_method_not_found_exception = {
  message : message_type option;
      [@ocaml.doc
        "The message returned when Amazon Cognito throws an MFA method not found exception.\n"]
}
[@@ocaml.doc
  "This exception is thrown when Amazon Cognito can't find a multi-factor authentication (MFA) \
   method.\n"]

type nonrec new_device_metadata_type = {
  device_key : device_key_type option;
      [@ocaml.doc
        "The device key, an identifier used in generating the [DEVICE_PASSWORD_VERIFIER] for \
         device SRP authentication.\n"]
  device_group_key : string_type option;
      [@ocaml.doc
        "The device group key, an identifier used in generating the [DEVICE_PASSWORD_VERIFIER] for \
         device SRP authentication.\n"]
}
[@@ocaml.doc
  "Information that your user pool responds with in [AuthenticationResult]when you configure it to \
   remember devices and a user signs in with an unrecognized device. Amazon Cognito presents a new \
   device key that you can use to set up \
   {{:https://docs.aws.amazon.com/cognito/latest/developerguide/amazon-cognito-user-pools-device-tracking.html}device \
   authentication} in a \"Remember me on this device\" authentication model.\n"]

type nonrec authentication_result_type = {
  access_token : token_model_type option; [@ocaml.doc "Your user's access token.\n"]
  expires_in : integer_type option;
      [@ocaml.doc "The expiration period of the authentication result in seconds.\n"]
  token_type : string_type option;
      [@ocaml.doc "The intended use of the token, for example [Bearer].\n"]
  refresh_token : token_model_type option; [@ocaml.doc "Your user's refresh token.\n"]
  id_token : token_model_type option; [@ocaml.doc "Your user's ID token.\n"]
  new_device_metadata : new_device_metadata_type option;
      [@ocaml.doc "The new device metadata from an authentication result.\n"]
}
[@@ocaml.doc
  "The object that your application receives after authentication. Contains tokens and information \
   for device authentication.\n"]

type nonrec challenge_parameters_type = (string_type * string_type) list [@@ocaml.doc ""]

type nonrec challenge_name_type =
  | SMS_MFA [@ocaml.doc ""]
  | EMAIL_OTP [@ocaml.doc ""]
  | SOFTWARE_TOKEN_MFA [@ocaml.doc ""]
  | SELECT_MFA_TYPE [@ocaml.doc ""]
  | MFA_SETUP [@ocaml.doc ""]
  | PASSWORD_VERIFIER [@ocaml.doc ""]
  | CUSTOM_CHALLENGE [@ocaml.doc ""]
  | SELECT_CHALLENGE [@ocaml.doc ""]
  | DEVICE_SRP_AUTH [@ocaml.doc ""]
  | DEVICE_PASSWORD_VERIFIER [@ocaml.doc ""]
  | ADMIN_NO_SRP_AUTH [@ocaml.doc ""]
  | NEW_PASSWORD_REQUIRED [@ocaml.doc ""]
  | SMS_OTP [@ocaml.doc ""]
  | PASSWORD [@ocaml.doc ""]
  | WEB_AUTHN [@ocaml.doc ""]
  | PASSWORD_SRP [@ocaml.doc ""]
[@@ocaml.doc ""]

type nonrec respond_to_auth_challenge_response = {
  challenge_name : challenge_name_type option;
      [@ocaml.doc
        "The name of the next challenge that you must respond to.\n\n\
        \ Possible challenges include the following:\n\
        \ \n\
        \   All of the following challenges require [USERNAME] and, when the app client has a \
         client secret, [SECRET_HASH] in the parameters. Include a [DEVICE_KEY] for device \
         authentication.\n\
        \   \n\
        \     {ul\n\
        \           {-   [WEB_AUTHN]: Respond to the challenge with the results of a successful \
         authentication with a WebAuthn authenticator, or passkey, as [CREDENTIAL]. Examples of \
         WebAuthn authenticators include biometric devices and security keys.\n\
        \               \n\
        \                }\n\
        \           {-   [PASSWORD]: Respond with the user's password as [PASSWORD].\n\
        \               \n\
        \                }\n\
        \           {-   [PASSWORD_SRP]: Respond with the initial SRP secret as [SRP_A].\n\
        \               \n\
        \                }\n\
        \           {-   [SELECT_CHALLENGE]: Respond with a challenge selection as [ANSWER]. It \
         must be one of the challenge types in the [AvailableChallenges] response parameter. Add \
         the parameters of the selected challenge, for example [USERNAME] and [SMS_OTP].\n\
        \               \n\
        \                }\n\
        \           {-   [SMS_MFA]: Respond with the code that your user pool delivered in an SMS \
         message, as [SMS_MFA_CODE] \n\
        \               \n\
        \                }\n\
        \           {-   [EMAIL_MFA]: Respond with the code that your user pool delivered in an \
         email message, as [EMAIL_MFA_CODE] \n\
        \               \n\
        \                }\n\
        \           {-   [EMAIL_OTP]: Respond with the code that your user pool delivered in an \
         email message, as [EMAIL_OTP_CODE] .\n\
        \               \n\
        \                }\n\
        \           {-   [SMS_OTP]: Respond with the code that your user pool delivered in an SMS \
         message, as [SMS_OTP_CODE].\n\
        \               \n\
        \                }\n\
        \           {-   [PASSWORD_VERIFIER]: Respond with the second stage of SRP secrets as \
         [PASSWORD_CLAIM_SIGNATURE], [PASSWORD_CLAIM_SECRET_BLOCK], and [TIMESTAMP].\n\
        \               \n\
        \                }\n\
        \           {-   [CUSTOM_CHALLENGE]: This is returned if your custom authentication flow \
         determines that the user should pass another challenge before tokens are issued. The \
         parameters of the challenge are determined by your Lambda function and issued in the \
         [ChallengeParameters] of a challenge response.\n\
        \               \n\
        \                }\n\
        \           {-   [DEVICE_SRP_AUTH]: Respond with the initial parameters of device SRP \
         authentication. For more information, see \
         {{:https://docs.aws.amazon.com/cognito/latest/developerguide/amazon-cognito-user-pools-device-tracking.html#user-pools-remembered-devices-signing-in-with-a-device}Signing \
         in with a device}.\n\
        \               \n\
        \                }\n\
        \           {-   [DEVICE_PASSWORD_VERIFIER]: Respond with [PASSWORD_CLAIM_SIGNATURE], \
         [PASSWORD_CLAIM_SECRET_BLOCK], and [TIMESTAMP] after client-side SRP calculations. For \
         more information, see \
         {{:https://docs.aws.amazon.com/cognito/latest/developerguide/amazon-cognito-user-pools-device-tracking.html#user-pools-remembered-devices-signing-in-with-a-device}Signing \
         in with a device}.\n\
        \               \n\
        \                }\n\
        \           {-   [NEW_PASSWORD_REQUIRED]: For users who are required to change their \
         passwords after successful first login. Respond to this challenge with [NEW_PASSWORD] and \
         any required attributes that Amazon Cognito returned in the [requiredAttributes] \
         parameter. You can also set values for attributes that aren't required by your user pool \
         and that your app client can write.\n\
        \               \n\
        \                Amazon Cognito only returns this challenge for users who have temporary \
         passwords. When you create passwordless users, you must provide values for all required \
         attributes.\n\
        \                \n\
        \                  In a [NEW_PASSWORD_REQUIRED] challenge response, you can't modify a \
         required attribute that already has a value. In [AdminRespondToAuthChallenge] or \
         [RespondToAuthChallenge], set a value for any keys that Amazon Cognito returned in the \
         [requiredAttributes] parameter, then use the [AdminUpdateUserAttributes] or \
         [UpdateUserAttributes] API operation to modify the value of any additional attributes.\n\
        \                  \n\
        \                    }\n\
        \           {-   [MFA_SETUP]: For users who are required to setup an MFA factor before \
         they can sign in. The MFA types activated for the user pool will be listed in the \
         challenge parameters [MFAS_CAN_SETUP] value. \n\
        \               \n\
        \                To set up time-based one-time password (TOTP) MFA, use the session \
         returned in this challenge from [InitiateAuth] or [AdminInitiateAuth] as an input to \
         [AssociateSoftwareToken]. Then, use the session returned by [VerifySoftwareToken] as an \
         input to [RespondToAuthChallenge] or [AdminRespondToAuthChallenge] with challenge name \
         [MFA_SETUP] to complete sign-in. \n\
        \                \n\
        \                 To set up SMS or email MFA, collect a [phone_number] or [email] \
         attribute for the user. Then restart the authentication flow with an [InitiateAuth] or \
         [AdminInitiateAuth] request. \n\
        \                 \n\
        \                  }\n\
        \           }\n\
        \  "]
  session : session_type option;
      [@ocaml.doc
        "The session identifier that maintains the state of authentication requests and challenge \
         responses. If an [InitiateAuth] or [RespondToAuthChallenge] API request results in a \
         determination that your application must pass another challenge, Amazon Cognito returns a \
         session with other challenge parameters. Send this session identifier, unmodified, to the \
         next [RespondToAuthChallenge] request.\n"]
  challenge_parameters : challenge_parameters_type option;
      [@ocaml.doc "The parameters that define your response to the next challenge.\n"]
  authentication_result : authentication_result_type option;
      [@ocaml.doc
        "The outcome of a successful authentication process. After your application has passed all \
         challenges, Amazon Cognito returns an [AuthenticationResult] with the JSON web tokens \
         (JWTs) that indicate successful sign-in.\n"]
}
[@@ocaml.doc "The response to respond to the authentication challenge.\n"]

type nonrec challenge_responses_type = (string_type * string_type) list [@@ocaml.doc ""]

type nonrec respond_to_auth_challenge_request = {
  client_id : client_id_type;
      [@ocaml.doc "The ID of the app client where the user is signing in.\n"]
  challenge_name : challenge_name_type;
      [@ocaml.doc
        "The name of the challenge that you are responding to.\n\n\
        \  You can't respond to an [ADMIN_NO_SRP_AUTH] challenge with this operation.\n\
        \  \n\
        \    Possible challenges include the following:\n\
        \    \n\
        \      All of the following challenges require [USERNAME] and, when the app client has a \
         client secret, [SECRET_HASH] in the parameters. Include a [DEVICE_KEY] for device \
         authentication.\n\
        \      \n\
        \        {ul\n\
        \              {-   [WEB_AUTHN]: Respond to the challenge with the results of a successful \
         authentication with a WebAuthn authenticator, or passkey, as [CREDENTIAL]. Examples of \
         WebAuthn authenticators include biometric devices and security keys.\n\
        \                  \n\
        \                   }\n\
        \              {-   [PASSWORD]: Respond with the user's password as [PASSWORD].\n\
        \                  \n\
        \                   }\n\
        \              {-   [PASSWORD_SRP]: Respond with the initial SRP secret as [SRP_A].\n\
        \                  \n\
        \                   }\n\
        \              {-   [SELECT_CHALLENGE]: Respond with a challenge selection as [ANSWER]. It \
         must be one of the challenge types in the [AvailableChallenges] response parameter. Add \
         the parameters of the selected challenge, for example [USERNAME] and [SMS_OTP].\n\
        \                  \n\
        \                   }\n\
        \              {-   [SMS_MFA]: Respond with the code that your user pool delivered in an \
         SMS message, as [SMS_MFA_CODE] \n\
        \                  \n\
        \                   }\n\
        \              {-   [EMAIL_MFA]: Respond with the code that your user pool delivered in an \
         email message, as [EMAIL_MFA_CODE] \n\
        \                  \n\
        \                   }\n\
        \              {-   [EMAIL_OTP]: Respond with the code that your user pool delivered in an \
         email message, as [EMAIL_OTP_CODE] .\n\
        \                  \n\
        \                   }\n\
        \              {-   [SMS_OTP]: Respond with the code that your user pool delivered in an \
         SMS message, as [SMS_OTP_CODE].\n\
        \                  \n\
        \                   }\n\
        \              {-   [PASSWORD_VERIFIER]: Respond with the second stage of SRP secrets as \
         [PASSWORD_CLAIM_SIGNATURE], [PASSWORD_CLAIM_SECRET_BLOCK], and [TIMESTAMP].\n\
        \                  \n\
        \                   }\n\
        \              {-   [CUSTOM_CHALLENGE]: This is returned if your custom authentication \
         flow determines that the user should pass another challenge before tokens are issued. The \
         parameters of the challenge are determined by your Lambda function and issued in the \
         [ChallengeParameters] of a challenge response.\n\
        \                  \n\
        \                   }\n\
        \              {-   [DEVICE_SRP_AUTH]: Respond with the initial parameters of device SRP \
         authentication. For more information, see \
         {{:https://docs.aws.amazon.com/cognito/latest/developerguide/amazon-cognito-user-pools-device-tracking.html#user-pools-remembered-devices-signing-in-with-a-device}Signing \
         in with a device}.\n\
        \                  \n\
        \                   }\n\
        \              {-   [DEVICE_PASSWORD_VERIFIER]: Respond with [PASSWORD_CLAIM_SIGNATURE], \
         [PASSWORD_CLAIM_SECRET_BLOCK], and [TIMESTAMP] after client-side SRP calculations. For \
         more information, see \
         {{:https://docs.aws.amazon.com/cognito/latest/developerguide/amazon-cognito-user-pools-device-tracking.html#user-pools-remembered-devices-signing-in-with-a-device}Signing \
         in with a device}.\n\
        \                  \n\
        \                   }\n\
        \              {-   [NEW_PASSWORD_REQUIRED]: For users who are required to change their \
         passwords after successful first login. Respond to this challenge with [NEW_PASSWORD] and \
         any required attributes that Amazon Cognito returned in the [requiredAttributes] \
         parameter. You can also set values for attributes that aren't required by your user pool \
         and that your app client can write.\n\
        \                  \n\
        \                   Amazon Cognito only returns this challenge for users who have \
         temporary passwords. When you create passwordless users, you must provide values for all \
         required attributes.\n\
        \                   \n\
        \                     In a [NEW_PASSWORD_REQUIRED] challenge response, you can't modify a \
         required attribute that already has a value. In [AdminRespondToAuthChallenge] or \
         [RespondToAuthChallenge], set a value for any keys that Amazon Cognito returned in the \
         [requiredAttributes] parameter, then use the [AdminUpdateUserAttributes] or \
         [UpdateUserAttributes] API operation to modify the value of any additional attributes.\n\
        \                     \n\
        \                       }\n\
        \              {-   [MFA_SETUP]: For users who are required to setup an MFA factor before \
         they can sign in. The MFA types activated for the user pool will be listed in the \
         challenge parameters [MFAS_CAN_SETUP] value. \n\
        \                  \n\
        \                   To set up time-based one-time password (TOTP) MFA, use the session \
         returned in this challenge from [InitiateAuth] or [AdminInitiateAuth] as an input to \
         [AssociateSoftwareToken]. Then, use the session returned by [VerifySoftwareToken] as an \
         input to [RespondToAuthChallenge] or [AdminRespondToAuthChallenge] with challenge name \
         [MFA_SETUP] to complete sign-in. \n\
        \                   \n\
        \                    To set up SMS or email MFA, collect a [phone_number] or [email] \
         attribute for the user. Then restart the authentication flow with an [InitiateAuth] or \
         [AdminInitiateAuth] request. \n\
        \                    \n\
        \                     }\n\
        \              }\n\
        \  "]
  session : session_type option;
      [@ocaml.doc
        "The session identifier that maintains the state of authentication requests and challenge \
         responses. If an [AdminInitiateAuth] or [AdminRespondToAuthChallenge] API request results \
         in a determination that your application must pass another challenge, Amazon Cognito \
         returns a session with other challenge parameters. Send this session identifier, \
         unmodified, to the next [AdminRespondToAuthChallenge] request.\n"]
  challenge_responses : challenge_responses_type option;
      [@ocaml.doc
        "The responses to the challenge that you received in the previous request. Each challenge \
         has its own required response parameters. The following examples are partial JSON request \
         bodies that highlight challenge-response parameters.\n\n\
        \  You must provide a SECRET_HASH parameter in all challenge responses to an app client \
         that has a client secret. Include a [DEVICE_KEY] for device authentication.\n\
        \  \n\
        \     SELECT_CHALLENGE   [\"ChallengeName\": \"SELECT_CHALLENGE\", \"ChallengeResponses\": {\n\
        \            \"USERNAME\": \"\\[username\\]\",\n\
        \            \"ANSWER\": \"\\[Challenge name\\]\"}] \n\
        \                       \n\
        \                        Available challenges are [PASSWORD], [PASSWORD_SRP], [EMAIL_OTP], \
         [SMS_OTP], and [WEB_AUTHN].\n\
        \                        \n\
        \                         Complete authentication in the [SELECT_CHALLENGE] response for \
         [PASSWORD], [PASSWORD_SRP], and [WEB_AUTHN]:\n\
        \                         \n\
        \                          {ul\n\
        \                                {-   [\"ChallengeName\": \"SELECT_CHALLENGE\", \
         \"ChallengeResponses\": {\n\
        \                  \"ANSWER\": \"WEB_AUTHN\",\n\
        \                  \"USERNAME\": \"\\[username\\]\",\n\
        \                  \"CREDENTIAL\": \"\\[AuthenticationResponseJSON\\]\"}] \n\
        \                                    \n\
        \                                     See \
         {{:https://www.w3.org/TR/WebAuthn-3/#dictdef-authenticationresponsejson} \
         AuthenticationResponseJSON}.\n\
        \                                     \n\
        \                                      }\n\
        \                                {-   [\"ChallengeName\": \"SELECT_CHALLENGE\", \
         \"ChallengeResponses\": {\n\
        \                  \"ANSWER\": \"PASSWORD\",\n\
        \                  \"USERNAME\": \"\\[username\\]\",\n\
        \                  \"PASSWORD\": \"\\[password\\]\"}] \n\
        \                                    \n\
        \                                     }\n\
        \                                {-   [\"ChallengeName\": \"SELECT_CHALLENGE\", \
         \"ChallengeResponses\": {\n\
        \                  \"ANSWER\": \"PASSWORD_SRP\",\n\
        \                  \"USERNAME\": \"\\[username\\]\",\n\
        \                  \"SRP_A\": \"\\[SRP_A\\]\"}] \n\
        \                                    \n\
        \                                     }\n\
        \                                }\n\
        \   For [SMS_OTP] and [EMAIL_OTP], respond with the username and answer. Your user pool \
         will send a code for the user to submit in the next challenge response.\n\
        \   \n\
        \    {ul\n\
        \          {-   [\"ChallengeName\": \"SELECT_CHALLENGE\", \"ChallengeResponses\": {\n\
        \                  \"ANSWER\": \"SMS_OTP\",\n\
        \                  \"USERNAME\": \"\\[username\\]\"}] \n\
        \              \n\
        \               }\n\
        \          {-   [\"ChallengeName\": \"SELECT_CHALLENGE\", \"ChallengeResponses\": {\n\
        \                  \"ANSWER\": \"EMAIL_OTP\",\n\
        \                  \"USERNAME\": \"\\[username\\]\"}] \n\
        \              \n\
        \               }\n\
        \          }\n\
        \    WEB_AUTHN   [\"ChallengeName\": \"WEB_AUTHN\", \"ChallengeResponses\": {\n\
        \                  \"USERNAME\": \"\\[username\\]\",\n\
        \                  \"CREDENTIAL\": \"\\[AuthenticationResponseJSON\\]\"}] \n\
        \               \n\
        \                See \
         {{:https://www.w3.org/TR/WebAuthn-3/#dictdef-authenticationresponsejson} \
         AuthenticationResponseJSON}.\n\
        \                \n\
        \                  PASSWORD   [\"ChallengeName\": \"PASSWORD\", \"ChallengeResponses\": {\n\
        \                  \"USERNAME\": \"\\[username\\]\",\n\
        \                  \"PASSWORD\": \"\\[password\\]\"}] \n\
        \                            \n\
        \                              PASSWORD_SRP   [\"ChallengeName\": \"PASSWORD_SRP\", \
         \"ChallengeResponses\": {\n\
        \                  \"USERNAME\": \"\\[username\\]\",\n\
        \                  \"SRP_A\": \"\\[SRP_A\\]\"}] \n\
        \                                            \n\
        \                                              SMS_OTP   [\"ChallengeName\": \"SMS_OTP\", \
         \"ChallengeResponses\": \n\
        \            {\"SMS_OTP_CODE\": \"\\[code\\]\", \"USERNAME\": \"\\[username\\]\"}] \n\
        \                                                       \n\
        \                                                         EMAIL_OTP   [\"ChallengeName\": \
         \"EMAIL_OTP\", \"ChallengeResponses\": {\"EMAIL_OTP_CODE\":\n\
        \                    \"\\[code\\]\", \"USERNAME\": \"\\[username\\]\"}] \n\
        \                                                                    \n\
        \                                                                      SMS_MFA   \
         [\"ChallengeName\": \"SMS_MFA\", \"ChallengeResponses\": {\"SMS_MFA_CODE\":\n\
        \                    \"\\[code\\]\", \"USERNAME\": \"\\[username\\]\"}] \n\
        \                                                                               \n\
        \                                                                                 \
         PASSWORD_VERIFIER  \n\
         This challenge response is part of the SRP flow. Amazon Cognito requires that your \
         application respond to this challenge within a few seconds. When the response time \
         exceeds this period, your user pool returns a [NotAuthorizedException] error.\n\n\
        \  [\"ChallengeName\": \"PASSWORD_VERIFIER\", \"ChallengeResponses\":\n\
        \                    {\"PASSWORD_CLAIM_SIGNATURE\": \"\\[claim_signature\\]\",\n\
        \                    \"PASSWORD_CLAIM_SECRET_BLOCK\": \"\\[secret_block\\]\", \"TIMESTAMP\":\n\
        \                    \\[timestamp\\], \"USERNAME\": \"\\[username\\]\"}] \n\
        \ \n\
        \   CUSTOM_CHALLENGE   [\"ChallengeName\": \"CUSTOM_CHALLENGE\", \"ChallengeResponses\":\n\
        \                    {\"USERNAME\": \"\\[username\\]\", \"ANSWER\": \
         \"\\[challenge_answer\\]\"}] \n\
        \                     \n\
        \                       NEW_PASSWORD_REQUIRED   [\"ChallengeName\": \
         \"NEW_PASSWORD_REQUIRED\", \"ChallengeResponses\":\n\
        \                    {\"NEW_PASSWORD\": \"\\[new_password\\]\", \"USERNAME\":\n\
        \                \"\\[username\\]\"}] \n\
        \                                              \n\
        \                                               To set any required attributes that \
         [InitiateAuth] returned in an [requiredAttributes] parameter, add \
         [\"userAttributes.\\[attribute_name\\]\": \"\\[attribute_value\\]\"]. This parameter can \
         also set values for writable attributes that aren't required by your user pool.\n\
        \                                               \n\
        \                                                 In a [NEW_PASSWORD_REQUIRED] challenge \
         response, you can't modify a required attribute that already has a value. In \
         [AdminRespondToAuthChallenge] or [RespondToAuthChallenge], set a value for any keys that \
         Amazon Cognito returned in the [requiredAttributes] parameter, then use the \
         [AdminUpdateUserAttributes] or [UpdateUserAttributes] API operation to modify the value \
         of any additional attributes.\n\
        \                                                 \n\
        \                                                    SOFTWARE_TOKEN_MFA   \
         [\"ChallengeName\": \"SOFTWARE_TOKEN_MFA\", \"ChallengeResponses\":\n\
        \                    {\"USERNAME\": \"\\[username\\]\", \"SOFTWARE_TOKEN_MFA_CODE\":\n\
        \                    \\[authenticator_code\\]}] \n\
        \                                                                        \n\
        \                                                                          DEVICE_SRP_AUTH  \n\
        \ [\"ChallengeName\": \"DEVICE_SRP_AUTH\", \"ChallengeResponses\": {\"USERNAME\":\n\
        \                \"\\[username\\]\", \"DEVICE_KEY\": \"\\[device_key\\]\", \"SRP_A\":\n\
        \                \"\\[srp_a\\]\"}] \n\n\
        \  DEVICE_PASSWORD_VERIFIER   [\"ChallengeName\": \"DEVICE_PASSWORD_VERIFIER\", \
         \"ChallengeResponses\":\n\
        \                {\"DEVICE_KEY\": \"\\[device_key\\]\", \"PASSWORD_CLAIM_SIGNATURE\":\n\
        \                \"\\[claim_signature\\]\", \"PASSWORD_CLAIM_SECRET_BLOCK\": \
         \"\\[secret_block\\]\",\n\
        \                \"TIMESTAMP\": \\[timestamp\\], \"USERNAME\": \"\\[username\\]\"}] \n\
        \                            \n\
        \                              MFA_SETUP   [\"ChallengeName\": \"MFA_SETUP\", \
         \"ChallengeResponses\": {\"USERNAME\":\n\
        \                \"\\[username\\]\"}, \"SESSION\": \"\\[Session ID from\n\
        \                VerifySoftwareToken\\]\"] \n\
        \                                         \n\
        \                                           SELECT_MFA_TYPE   [\"ChallengeName\": \
         \"SELECT_MFA_TYPE\", \"ChallengeResponses\": {\"USERNAME\":\n\
        \                \"\\[username\\]\", \"ANSWER\": \
         \"\\[SMS_MFA|EMAIL_MFA|SOFTWARE_TOKEN_MFA\\]\"}] \n\
        \                                                            \n\
        \                                                               For more information about \
         [SECRET_HASH], see \
         {{:https://docs.aws.amazon.com/cognito/latest/developerguide/signing-up-users-in-your-app.html#cognito-user-pools-computing-secret-hash}Computing \
         secret hash values}. For information about [DEVICE_KEY], see \
         {{:https://docs.aws.amazon.com/cognito/latest/developerguide/amazon-cognito-user-pools-device-tracking.html}Working \
         with user devices in your user pool}.\n\
        \                                                               "]
  analytics_metadata : analytics_metadata_type option;
      [@ocaml.doc
        "Information that supports analytics outcomes with Amazon Pinpoint, including the user's \
         endpoint ID. The endpoint ID is a destination for Amazon Pinpoint push notifications, for \
         example a device identifier, email address, or phone number.\n"]
  user_context_data : user_context_data_type option;
      [@ocaml.doc
        "Contextual data about your user session like the device fingerprint, IP address, or \
         location. Amazon Cognito threat protection evaluates the risk of an authentication event \
         based on the context that your app generates and passes to Amazon Cognito when it makes \
         API requests.\n\n\
        \ For more information, see \
         {{:https://docs.aws.amazon.com/cognito/latest/developerguide/user-pool-settings-viewing-threat-protection-app.html}Collecting \
         data for threat protection in applications}.\n\
        \ "]
  client_metadata : client_metadata_type option;
      [@ocaml.doc
        "A map of custom key-value pairs that you can provide as input for any custom workflows \
         that this action triggers. You create custom workflows by assigning Lambda functions to \
         user pool triggers.\n\n\
        \ When Amazon Cognito invokes any of these functions, it passes a JSON payload, which the \
         function receives as input. This payload contains a [clientMetadata] attribute that \
         provides the data that you assigned to the ClientMetadata parameter in your request. In \
         your function code, you can process the [clientMetadata] value to enhance your workflow \
         for your specific needs.\n\
        \ \n\
        \  To review the Lambda trigger types that Amazon Cognito invokes at runtime with API \
         requests, see \
         {{:https://docs.aws.amazon.com/cognito/latest/developerguide/cognito-user-pools-working-with-lambda-triggers.html#lambda-triggers-by-event} \
         Connecting API actions to Lambda triggers} in the {i Amazon Cognito Developer Guide}.\n\
        \  \n\
        \    When you use the [ClientMetadata] parameter, note that Amazon Cognito won't do the \
         following:\n\
        \    \n\
        \     {ul\n\
        \           {-  Store the [ClientMetadata] value. This data is available only to Lambda \
         triggers that are assigned to a user pool to support custom workflows. If your user pool \
         configuration doesn't include triggers, the [ClientMetadata] parameter serves no purpose.\n\
        \               \n\
        \                }\n\
        \           {-  Validate the [ClientMetadata] value.\n\
        \               \n\
        \                }\n\
        \           {-  Encrypt the [ClientMetadata] value. Don't send sensitive information in \
         this parameter.\n\
        \               \n\
        \                }\n\
        \           }\n\
        \   "]
}
[@@ocaml.doc "The request to respond to an authentication challenge.\n"]

type nonrec resend_confirmation_code_response = {
  code_delivery_details : code_delivery_details_type option;
      [@ocaml.doc
        "Information about the phone number or email address that Amazon Cognito sent the \
         confirmation code to.\n"]
}
[@@ocaml.doc
  "The response from the server when Amazon Cognito makes the request to resend a confirmation code.\n"]

type nonrec resend_confirmation_code_request = {
  client_id : client_id_type;
      [@ocaml.doc "The ID of the user pool app client where the user signed up.\n"]
  secret_hash : secret_hash_type option;
      [@ocaml.doc
        "A keyed-hash message authentication code (HMAC) calculated using the secret key of a user \
         pool client and username plus the client ID in the message. For more information about \
         [SecretHash], see \
         {{:https://docs.aws.amazon.com/cognito/latest/developerguide/signing-up-users-in-your-app.html#cognito-user-pools-computing-secret-hash}Computing \
         secret hash values}.\n"]
  user_context_data : user_context_data_type option;
      [@ocaml.doc
        "Contextual data about your user session like the device fingerprint, IP address, or \
         location. Amazon Cognito threat protection evaluates the risk of an authentication event \
         based on the context that your app generates and passes to Amazon Cognito when it makes \
         API requests.\n\n\
        \ For more information, see \
         {{:https://docs.aws.amazon.com/cognito/latest/developerguide/user-pool-settings-viewing-threat-protection-app.html}Collecting \
         data for threat protection in applications}.\n\
        \ "]
  username : username_type;
      [@ocaml.doc
        "The name of the user that you want to query or modify. The value of this parameter is \
         typically your user's username, but it can be any of their alias attributes. If \
         [username] isn't an alias attribute in your user pool, this value must be the [sub] of a \
         local user or the username of a user from a third-party IdP.\n"]
  analytics_metadata : analytics_metadata_type option;
      [@ocaml.doc
        "Information that supports analytics outcomes with Amazon Pinpoint, including the user's \
         endpoint ID. The endpoint ID is a destination for Amazon Pinpoint push notifications, for \
         example a device identifier, email address, or phone number.\n"]
  client_metadata : client_metadata_type option;
      [@ocaml.doc
        "A map of custom key-value pairs that you can provide as input for any custom workflows \
         that this action triggers. You create custom workflows by assigning Lambda functions to \
         user pool triggers.\n\n\
        \ When Amazon Cognito invokes any of these functions, it passes a JSON payload, which the \
         function receives as input. This payload contains a [clientMetadata] attribute that \
         provides the data that you assigned to the ClientMetadata parameter in your request. In \
         your function code, you can process the [clientMetadata] value to enhance your workflow \
         for your specific needs.\n\
        \ \n\
        \  To review the Lambda trigger types that Amazon Cognito invokes at runtime with API \
         requests, see \
         {{:https://docs.aws.amazon.com/cognito/latest/developerguide/cognito-user-pools-working-with-lambda-triggers.html#lambda-triggers-by-event} \
         Connecting API actions to Lambda triggers} in the {i Amazon Cognito Developer Guide}.\n\
        \  \n\
        \    When you use the [ClientMetadata] parameter, note that Amazon Cognito won't do the \
         following:\n\
        \    \n\
        \     {ul\n\
        \           {-  Store the [ClientMetadata] value. This data is available only to Lambda \
         triggers that are assigned to a user pool to support custom workflows. If your user pool \
         configuration doesn't include triggers, the [ClientMetadata] parameter serves no purpose.\n\
        \               \n\
        \                }\n\
        \           {-  Validate the [ClientMetadata] value.\n\
        \               \n\
        \                }\n\
        \           {-  Encrypt the [ClientMetadata] value. Don't send sensitive information in \
         this parameter.\n\
        \               \n\
        \                }\n\
        \           }\n\
        \   "]
}
[@@ocaml.doc "Represents the request to resend the confirmation code.\n"]

type nonrec pagination_key = string [@@ocaml.doc ""]

type nonrec web_authn_authenticator_transport_type = string [@@ocaml.doc ""]

type nonrec web_authn_authenticator_transports_list = web_authn_authenticator_transport_type list
[@@ocaml.doc ""]

type nonrec web_authn_authenticator_attachment_type = string [@@ocaml.doc ""]

type nonrec web_authn_credential_description = {
  credential_id : string_type; [@ocaml.doc "The unique identifier of the passkey credential.\n"]
  friendly_credential_name : string_type;
      [@ocaml.doc "An automatically-generated friendly name for the passkey credential.\n"]
  relying_party_id : string_type;
      [@ocaml.doc "The relying-party ID of the provider for the passkey credential.\n"]
  authenticator_attachment : web_authn_authenticator_attachment_type option;
      [@ocaml.doc
        "The general category of the passkey authenticator. Can be a platform, or on-device \
         authenticator like a built-in fingerprint scanner, or a cross-platform device that's not \
         attached to the device like a Bluetooth security key.\n"]
  authenticator_transports : web_authn_authenticator_transports_list;
      [@ocaml.doc
        "Information about the transport methods of the passkey credential, for example USB or \
         Bluetooth Low Energy.\n"]
  created_at : date_type;
      [@ocaml.doc
        "The date and time when the item was created. Amazon Cognito returns this timestamp in \
         UNIX epoch time format. Your SDK might render the output in a human-readable format like \
         ISO 8601 or a Java [Date] object.\n"]
}
[@@ocaml.doc
  "The details of a passkey, or webauthN, biometric or security-key authentication factor for a \
   user.\n"]

type nonrec web_authn_credential_description_list_type = web_authn_credential_description list
[@@ocaml.doc ""]

type nonrec list_web_authn_credentials_response = {
  credentials : web_authn_credential_description_list_type;
      [@ocaml.doc "A list of registered passkeys for a user.\n"]
  next_token : pagination_key option;
      [@ocaml.doc
        "The identifier that Amazon Cognito returned with the previous request to this operation. \
         When you include a pagination token in your request, Amazon Cognito returns the next set \
         of items in the list. By use of this token, you can paginate through the full list of \
         items.\n"]
}
[@@ocaml.doc ""]

type nonrec web_authn_credentials_query_limit_type = int [@@ocaml.doc ""]

type nonrec list_web_authn_credentials_request = {
  access_token : token_model_type;
      [@ocaml.doc
        "A valid access token that Amazon Cognito issued to the currently signed-in user. Must \
         include a scope claim for [aws.cognito.signin.user.admin].\n"]
  next_token : pagination_key option;
      [@ocaml.doc
        "This API operation returns a limited number of results. The pagination token is an \
         identifier that you can present in an additional API request with the same parameters. \
         When you include the pagination token, Amazon Cognito returns the next set of items after \
         the current list. Subsequent requests return a new pagination token. By use of this \
         token, you can paginate through the full list of items.\n"]
  max_results : web_authn_credentials_query_limit_type option;
      [@ocaml.doc "The maximum number of the user's passkey credentials that you want to return.\n"]
}
[@@ocaml.doc ""]

type nonrec user_status_type =
  | UNCONFIRMED [@ocaml.doc ""]
  | CONFIRMED [@ocaml.doc ""]
  | ARCHIVED [@ocaml.doc ""]
  | COMPROMISED [@ocaml.doc ""]
  | UNKNOWN [@ocaml.doc ""]
  | RESET_REQUIRED [@ocaml.doc ""]
  | FORCE_CHANGE_PASSWORD [@ocaml.doc ""]
  | EXTERNAL_PROVIDER [@ocaml.doc ""]
[@@ocaml.doc ""]

type nonrec user_type = {
  username : username_type option; [@ocaml.doc "The user's username.\n"]
  attributes : attribute_list_type option;
      [@ocaml.doc "Names and values of a user's attributes, for example [email].\n"]
  user_create_date : date_type option;
      [@ocaml.doc
        "The date and time when the item was created. Amazon Cognito returns this timestamp in \
         UNIX epoch time format. Your SDK might render the output in a human-readable format like \
         ISO 8601 or a Java [Date] object.\n"]
  user_last_modified_date : date_type option;
      [@ocaml.doc
        "The date and time when the item was modified. Amazon Cognito returns this timestamp in \
         UNIX epoch time format. Your SDK might render the output in a human-readable format like \
         ISO 8601 or a Java [Date] object.\n"]
  enabled : boolean_type option;
      [@ocaml.doc "Indicates whether the user's account is enabled or disabled.\n"]
  user_status : user_status_type option;
      [@ocaml.doc
        "The user status. This can be one of the following:\n\n\
        \ {ul\n\
        \       {-   [UNCONFIRMED]: User has been created but not confirmed.\n\
        \           \n\
        \            }\n\
        \       {-   [CONFIRMED]: User has been confirmed.\n\
        \           \n\
        \            }\n\
        \       {-   [EXTERNAL_PROVIDER]: User signed in with a third-party IdP.\n\
        \           \n\
        \            }\n\
        \       {-   [RESET_REQUIRED]: User is confirmed, but the user must request a code and \
         reset their password before they can sign in.\n\
        \           \n\
        \            }\n\
        \       {-   [FORCE_CHANGE_PASSWORD]: The user is confirmed and the user can sign in using \
         a temporary password, but on first sign-in, the user must change their password to a new \
         value before doing anything else. \n\
        \           \n\
        \            }\n\
        \       }\n\
        \   The statuses [ARCHIVED], [UNKNOWN], and [COMPROMISED] are no longer used.\n\
        \   "]
  mfa_options : mfa_option_list_type option; [@ocaml.doc "The user's MFA configuration.\n"]
}
[@@ocaml.doc "A user profile in a Amazon Cognito user pool.\n"]

type nonrec users_list_type = user_type list [@@ocaml.doc ""]

type nonrec list_users_in_group_response = {
  users : users_list_type option;
      [@ocaml.doc "An array of users who are members in the group, and their attributes.\n"]
  next_token : pagination_key option;
      [@ocaml.doc
        "The identifier that Amazon Cognito returned with the previous request to this operation. \
         When you include a pagination token in your request, Amazon Cognito returns the next set \
         of items in the list. By use of this token, you can paginate through the full list of \
         items.\n"]
}
[@@ocaml.doc ""]

type nonrec query_limit_type = int [@@ocaml.doc ""]

type nonrec list_users_in_group_request = {
  user_pool_id : user_pool_id_type;
      [@ocaml.doc
        "The ID of the user pool where you want to view the membership of the requested group.\n"]
  group_name : group_name_type;
      [@ocaml.doc "The name of the group that you want to query for user membership.\n"]
  limit : query_limit_type option;
      [@ocaml.doc
        "The maximum number of groups that you want Amazon Cognito to return in the response. In \
         some SDK contexts, this operation might return fewer items than you specify in the \
         [Limit] parameter without having reached the end of the full list. If the response \
         contains a [PaginationToken], then there are more results.\n"]
  next_token : pagination_key option;
      [@ocaml.doc
        "This API operation returns a limited number of results. The pagination token is an \
         identifier that you can present in an additional API request with the same parameters. \
         When you include the pagination token, Amazon Cognito returns the next set of items after \
         the current list. Subsequent requests return a new pagination token. By use of this \
         token, you can paginate through the full list of items.\n"]
}
[@@ocaml.doc ""]

type nonrec search_pagination_token_type = string [@@ocaml.doc ""]

type nonrec list_users_response = {
  users : users_list_type option;
      [@ocaml.doc
        "An array of user pool users who match your query, and their attributes. Between different \
         requests, you might observe variations in the sequence that users in this response object \
         are sorted into. The sort order of users isn't guaranteed to follow a single pattern, but \
         the paginated list from a single chain of requests won't return duplicates.\n"]
  pagination_token : search_pagination_token_type option;
      [@ocaml.doc
        "The identifier that Amazon Cognito returned with the previous request to this operation. \
         When you include a pagination token in your request, Amazon Cognito returns the next set \
         of items in the list. By use of this token, you can paginate through the full list of \
         items.\n"]
}
[@@ocaml.doc "The response from the request to list users.\n"]

type nonrec user_filter_type = string [@@ocaml.doc ""]

type nonrec searched_attribute_names_list_type = attribute_name_type list [@@ocaml.doc ""]

type nonrec list_users_request = {
  user_pool_id : user_pool_id_type;
      [@ocaml.doc "The ID of the user pool where you want to display or search for users.\n"]
  attributes_to_get : searched_attribute_names_list_type option;
      [@ocaml.doc
        "A JSON array of user attribute names, for example [given_name], that you want Amazon \
         Cognito to include in the response for each user. When you don't provide an \
         [AttributesToGet] parameter, Amazon Cognito returns all attributes for each user.\n\n\
        \ Use [AttributesToGet] with required attributes in your user pool, or in conjunction with \
         [Filter]. Amazon Cognito returns an error if not all users in the results have set a \
         value for the attribute you request. Attributes that you can't filter on, including \
         custom attributes, must have a value set in every user profile before an \
         [AttributesToGet] parameter returns results.\n\
        \ "]
  limit : query_limit_type option;
      [@ocaml.doc
        "The maximum number of users that you want Amazon Cognito to return in the response. In \
         some SDK contexts, this operation might return fewer items than you specify in the \
         [Limit] parameter without having reached the end of the full list. If the response \
         contains a [PaginationToken], then there are more results.\n"]
  pagination_token : search_pagination_token_type option;
      [@ocaml.doc
        "This API operation returns a limited number of results. The pagination token is an \
         identifier that you can present in an additional API request with the same parameters. \
         When you include the pagination token, Amazon Cognito returns the next set of items after \
         the current list. Subsequent requests return a new pagination token. By use of this \
         token, you can paginate through the full list of items.\n"]
  filter : user_filter_type option;
      [@ocaml.doc
        "A filter string of the form [\"AttributeName Filter-Type \"AttributeValue\"]. Quotation \
         marks within the filter string must be escaped using the backslash ([\\]) character. For \
         example, [\"family_name =\n\
        \            \\\"Reddy\\\"\"].\n\n\
        \ {ul\n\
        \       {-   {i AttributeName}: The name of the attribute to search for. You can only \
         search for one attribute at a time.\n\
        \           \n\
        \            }\n\
        \       {-   {i Filter-Type}: For an exact match, use [=], for example, \"[given_name = \
         \\\"Jon\\\"]\". For a prefix (\"starts with\") match, use [^=], for example, \
         \"[given_name ^= \\\"Jon\\\"]\". \n\
        \           \n\
        \            }\n\
        \       {-   {i AttributeValue}: The attribute value that must be matched for each user.\n\
        \           \n\
        \            }\n\
        \       }\n\
        \   If the filter string is empty, [ListUsers] returns all users in the user pool.\n\
        \   \n\
        \    You can only search for the following standard attributes:\n\
        \    \n\
        \     {ul\n\
        \           {-   [username] (case-sensitive)\n\
        \               \n\
        \                }\n\
        \           {-   [email] \n\
        \               \n\
        \                }\n\
        \           {-   [phone_number] \n\
        \               \n\
        \                }\n\
        \           {-   [name] \n\
        \               \n\
        \                }\n\
        \           {-   [given_name] \n\
        \               \n\
        \                }\n\
        \           {-   [family_name] \n\
        \               \n\
        \                }\n\
        \           {-   [preferred_username] \n\
        \               \n\
        \                }\n\
        \           {-   [cognito:user_status] (called {b Status} in the Console) (case-insensitive)\n\
        \               \n\
        \                }\n\
        \           {-   \n\
        \               {[\n\
        \               status (called {b Enabled} in the Console) (case-sensitive)\n\
        \               ]}\n\
        \                \n\
        \               \n\
        \                }\n\
        \           {-   [sub] \n\
        \               \n\
        \                }\n\
        \           }\n\
        \   Custom attributes aren't searchable.\n\
        \   \n\
        \     You can also list users with a client-side filter. The server-side filter matches no \
         more than one attribute. For an advanced search, use a client-side filter with the \
         [--query] parameter of the [list-users] action in the CLI. When you use a client-side \
         filter, ListUsers returns a paginated list of zero or more users. You can receive \
         multiple pages in a row with zero results. Repeat the query with each pagination token \
         that is returned until you receive a null pagination token value, and then review the \
         combined result. \n\
        \     \n\
        \      For more information about server-side and client-side filtering, see \
         {{:https://docs.aws.amazon.com/cli/latest/userguide/cli-usage-filter.html}FilteringCLI \
         output} in the \
         {{:https://docs.aws.amazon.com/cli/latest/userguide/cli-usage-filter.html}Command Line \
         Interface User Guide}. \n\
        \      \n\
        \        For more information, see \
         {{:https://docs.aws.amazon.com/cognito/latest/developerguide/how-to-manage-user-accounts.html#cognito-user-pools-searching-for-users-using-listusers-api}Searching \
         for Users Using the ListUsers API} and \
         {{:https://docs.aws.amazon.com/cognito/latest/developerguide/how-to-manage-user-accounts.html#cognito-user-pools-searching-for-users-listusers-api-examples}Examples \
         of Using the ListUsers API} in the {i Amazon Cognito Developer Guide}.\n\
        \        "]
}
[@@ocaml.doc "Represents the request to list users.\n"]

type nonrec pagination_key_type = string [@@ocaml.doc ""]

type nonrec replica_regions_type = string_type list [@@ocaml.doc ""]

type nonrec status_type = Enabled [@ocaml.doc ""] | Disabled [@ocaml.doc ""] [@@ocaml.doc ""]

type nonrec user_pool_description_type = {
  id : user_pool_id_type option; [@ocaml.doc "The user pool ID.\n"]
  name : user_pool_name_type option; [@ocaml.doc "The user pool name.\n"]
  lambda_config : lambda_config_type option;
      [@ocaml.doc
        "A collection of user pool Lambda triggers. Amazon Cognito invokes triggers at several \
         possible stages of user pool operations. Triggers can modify the outcome of the \
         operations that invoked them.\n"]
  status : status_type option; [@ocaml.doc "The user pool status.\n"]
  last_modified_date : date_type option;
      [@ocaml.doc
        "The date and time when the item was modified. Amazon Cognito returns this timestamp in \
         UNIX epoch time format. Your SDK might render the output in a human-readable format like \
         ISO 8601 or a Java [Date] object.\n"]
  creation_date : date_type option;
      [@ocaml.doc
        "The date and time when the item was created. Amazon Cognito returns this timestamp in \
         UNIX epoch time format. Your SDK might render the output in a human-readable format like \
         ISO 8601 or a Java [Date] object.\n"]
  replica_regions : replica_regions_type option;
      [@ocaml.doc "A list of Amazon Web Services Regions where replicas of this user pool exist.\n"]
}
[@@ocaml.doc "A short description of a user pool.\n"]

type nonrec user_pool_list_type = user_pool_description_type list [@@ocaml.doc ""]

type nonrec list_user_pools_response = {
  user_pools : user_pool_list_type option;
      [@ocaml.doc "An array of user pools and their configuration details.\n"]
  next_token : pagination_key_type option;
      [@ocaml.doc
        "The identifier that Amazon Cognito returned with the previous request to this operation. \
         When you include a pagination token in your request, Amazon Cognito returns the next set \
         of items in the list. By use of this token, you can paginate through the full list of \
         items.\n"]
}
[@@ocaml.doc "Represents the response to list user pools.\n"]

type nonrec pool_query_limit_type = int [@@ocaml.doc ""]

type nonrec list_user_pools_request = {
  next_token : pagination_key_type option;
      [@ocaml.doc
        "This API operation returns a limited number of results. The pagination token is an \
         identifier that you can present in an additional API request with the same parameters. \
         When you include the pagination token, Amazon Cognito returns the next set of items after \
         the current list. Subsequent requests return a new pagination token. By use of this \
         token, you can paginate through the full list of items.\n"]
  max_results : pool_query_limit_type;
      [@ocaml.doc
        "The maximum number of user pools that you want Amazon Cognito to return in the response.\n"]
}
[@@ocaml.doc "Represents the request to list user pools.\n"]

type nonrec user_pool_replica_list_type = user_pool_replica_type list [@@ocaml.doc ""]

type nonrec list_user_pool_replicas_response = {
  user_pool_replicas : user_pool_replica_list_type option;
      [@ocaml.doc
        "A list of user pool replicas, including information about their status, role, and Region.\n"]
  next_token : pagination_key_type option;
      [@ocaml.doc
        "A pagination token for retrieving the next page of results. If this value is null, there \
         are no more results to retrieve.\n"]
}
[@@ocaml.doc ""]

type nonrec list_user_pool_replicas_request = {
  user_pool_id : user_pool_id_type;
      [@ocaml.doc "The ID of the user pool for which to list replicas.\n"]
  next_token : pagination_key_type option;
      [@ocaml.doc
        "A pagination token for retrieving the next page of results. If this parameter is omitted, \
         the operation returns the first page of results.\n"]
}
[@@ocaml.doc ""]

type nonrec internal_server_exception = { message : message_type option [@ocaml.doc ""] }
[@@ocaml.doc "This exception is thrown when Amazon Cognito encounters an internal server error.\n"]

type nonrec client_secret_id_type = string [@@ocaml.doc ""]

type nonrec client_secret_descriptor_type = {
  client_secret_id : client_secret_id_type option;
      [@ocaml.doc
        "The unique identifier for the client secret. This identifier follows the format --.\n"]
  client_secret_value : client_secret_type option;
      [@ocaml.doc
        "The actual secret value. This is only returned when creating a new secret and only if \
         Amazon Cognito generated the secret. For custom secrets that you provide, this field is \
         not included in the response.\n"]
  client_secret_create_date : date_type option;
      [@ocaml.doc "The date and time when the client secret was created.\n"]
}
[@@ocaml.doc
  "Contains information about a client secret, including its unique identifier, value, and \
   creation timestamp.\n"]

type nonrec client_secret_descriptor_list_type = client_secret_descriptor_type list [@@ocaml.doc ""]

type nonrec list_user_pool_client_secrets_response = {
  client_secrets : client_secret_descriptor_list_type option;
      [@ocaml.doc
        "A list of client secret descriptors containing the identifier and creation date for each \
         secret. For security reasons, the response never reveals the actual secret value in \
         ClientSecretValue.\n"]
  next_token : pagination_key option;
      [@ocaml.doc
        "The identifier that Amazon Cognito returned with the previous request to this operation. \
         When you include a pagination token in your request, Amazon Cognito returns the next set \
         of items in the list. By use of this token, you can paginate through the full list of \
         items.\n"]
}
[@@ocaml.doc
  "The response containing the list of client secret metadata. This response does not include a \
   NextToken field as all secrets are returned in a single response.\n"]

type nonrec list_user_pool_client_secrets_request = {
  user_pool_id : user_pool_id_type;
      [@ocaml.doc "The ID of the user pool that contains the app client.\n"]
  client_id : client_id_type;
      [@ocaml.doc "The ID of the app client whose secrets you want to list.\n"]
  next_token : pagination_key option;
      [@ocaml.doc
        "This API operation returns a limited number of results. The pagination token is an \
         identifier that you can present in an additional API request with the same parameters. \
         When you include the pagination token, Amazon Cognito returns the next set of items after \
         the current list. Subsequent requests return a new pagination token. By use of this \
         token, you can paginate through the full list of items.\n"]
}
[@@ocaml.doc "The request to list client secrets for a user pool app client.\n"]

type nonrec user_pool_client_description = {
  client_id : client_id_type option; [@ocaml.doc "The app client ID.\n"]
  user_pool_id : user_pool_id_type option;
      [@ocaml.doc "The ID of the user pool that's associated with the app client.\n"]
  client_name : client_name_type option; [@ocaml.doc "The app client name.\n"]
}
[@@ocaml.doc "A short description of a user pool app client.\n"]

type nonrec user_pool_client_list_type = user_pool_client_description list [@@ocaml.doc ""]

type nonrec list_user_pool_clients_response = {
  user_pool_clients : user_pool_client_list_type option;
      [@ocaml.doc "An array of app clients and their details. Includes app client ID and name.\n"]
  next_token : pagination_key option;
      [@ocaml.doc
        "The identifier that Amazon Cognito returned with the previous request to this operation. \
         When you include a pagination token in your request, Amazon Cognito returns the next set \
         of items in the list. By use of this token, you can paginate through the full list of \
         items.\n"]
}
[@@ocaml.doc "Represents the response from the server that lists user pool clients.\n"]

type nonrec query_limit = int [@@ocaml.doc ""]

type nonrec list_user_pool_clients_request = {
  user_pool_id : user_pool_id_type;
      [@ocaml.doc "The ID of the user pool where you want to list user pool clients.\n"]
  max_results : query_limit option;
      [@ocaml.doc
        "The maximum number of app clients that you want Amazon Cognito to return in the response.\n"]
  next_token : pagination_key option;
      [@ocaml.doc
        "This API operation returns a limited number of results. The pagination token is an \
         identifier that you can present in an additional API request with the same parameters. \
         When you include the pagination token, Amazon Cognito returns the next set of items after \
         the current list. Subsequent requests return a new pagination token. By use of this \
         token, you can paginate through the full list of items.\n"]
}
[@@ocaml.doc "Represents the request to list the user pool clients.\n"]

type nonrec user_import_jobs_list_type = user_import_job_type list [@@ocaml.doc ""]

type nonrec list_user_import_jobs_response = {
  user_import_jobs : user_import_jobs_list_type option;
      [@ocaml.doc
        "An array of user import jobs from the requested user pool. For each, the response \
         includes logging destination, status, and the Amazon S3 pre-signed URL for CSV upload.\n"]
  pagination_token : pagination_key_type option;
      [@ocaml.doc
        "The identifier that Amazon Cognito returned with the previous request to this operation. \
         When you include a pagination token in your request, Amazon Cognito returns the next set \
         of items in the list. By use of this token, you can paginate through the full list of \
         items.\n"]
}
[@@ocaml.doc
  "Represents the response from the server to the request to list the user import jobs.\n"]

type nonrec list_user_import_jobs_request = {
  user_pool_id : user_pool_id_type;
      [@ocaml.doc "The ID of the user pool where you want to list import jobs.\n"]
  max_results : pool_query_limit_type;
      [@ocaml.doc
        "The maximum number of import jobs that you want Amazon Cognito to return in the response.\n"]
  pagination_token : pagination_key_type option;
      [@ocaml.doc
        "This API operation returns a limited number of results. The pagination token is an \
         identifier that you can present in an additional API request with the same parameters. \
         When you include the pagination token, Amazon Cognito returns the next set of items after \
         the current list. Subsequent requests return a new pagination token. By use of this \
         token, you can paginate through the full list of items.\n"]
}
[@@ocaml.doc "Represents the request to list the user import jobs.\n"]

type nonrec terms_description_type = {
  terms_id : terms_id_type; [@ocaml.doc "The ID of the requested terms documents.\n"]
  terms_name : terms_name_type;
      [@ocaml.doc "The type and friendly name of the requested terms documents.\n"]
  enforcement : terms_enforcement_type;
      [@ocaml.doc "This parameter is reserved for future use and currently accepts one value.\n"]
  creation_date : date_type;
      [@ocaml.doc
        "The date and time when the item was created. Amazon Cognito returns this timestamp in \
         UNIX epoch time format. Your SDK might render the output in a human-readable format like \
         ISO 8601 or a Java [Date] object.\n"]
  last_modified_date : date_type;
      [@ocaml.doc
        "The date and time when the item was modified. Amazon Cognito returns this timestamp in \
         UNIX epoch time format. Your SDK might render the output in a human-readable format like \
         ISO 8601 or a Java [Date] object.\n"]
}
[@@ocaml.doc
  "The details of a set of terms documents. For more information, see \
   {{:https://docs.aws.amazon.com/cognito/latest/developerguide/cognito-user-pools-managed-login.html#managed-login-terms-documents}Terms \
   documents}.\n"]

type nonrec terms_description_list_type = terms_description_type list [@@ocaml.doc ""]

type nonrec list_terms_response = {
  terms : terms_description_list_type;
      [@ocaml.doc
        "A summary of the requested terms documents. Includes unique identifiers for later changes \
         to the terms documents.\n"]
  next_token : string_type option;
      [@ocaml.doc
        "This API operation returns a limited number of results. The pagination token is an \
         identifier that you can present in an additional API request with the same parameters. \
         When you include the pagination token, Amazon Cognito returns the next set of items after \
         the current list. Subsequent requests return a new pagination token. By use of this \
         token, you can paginate through the full list of items.\n"]
}
[@@ocaml.doc ""]

type nonrec list_terms_request_max_results_integer = int [@@ocaml.doc ""]

type nonrec list_terms_request = {
  user_pool_id : user_pool_id_type;
      [@ocaml.doc "The ID of the user pool where you want to list terms documents.\n"]
  max_results : list_terms_request_max_results_integer option;
      [@ocaml.doc
        "The maximum number of terms documents that you want Amazon Cognito to return in the \
         response.\n"]
  next_token : string_type option;
      [@ocaml.doc
        "This API operation returns a limited number of results. The pagination token is an \
         identifier that you can present in an additional API request with the same parameters. \
         When you include the pagination token, Amazon Cognito returns the next set of items after \
         the current list. Subsequent requests return a new pagination token. By use of this \
         token, you can paginate through the full list of items.\n"]
}
[@@ocaml.doc ""]

type nonrec list_tags_for_resource_response = {
  tags : user_pool_tags_type option; [@ocaml.doc "The tags that are assigned to the user pool.\n"]
}
[@@ocaml.doc ""]

type nonrec list_tags_for_resource_request = {
  resource_arn : arn_type;
      [@ocaml.doc
        "The Amazon Resource Name (ARN) of the user pool that the tags are assigned to.\n"]
}
[@@ocaml.doc ""]

type nonrec resource_servers_list_type = resource_server_type list [@@ocaml.doc ""]

type nonrec list_resource_servers_response = {
  resource_servers : resource_servers_list_type;
      [@ocaml.doc
        "An array of resource servers and the details of their configuration. For each, the \
         response includes names, identifiers, and custom scopes.\n"]
  next_token : pagination_key_type option;
      [@ocaml.doc
        "The identifier that Amazon Cognito returned with the previous request to this operation. \
         When you include a pagination token in your request, Amazon Cognito returns the next set \
         of items in the list. By use of this token, you can paginate through the full list of \
         items.\n"]
}
[@@ocaml.doc ""]

type nonrec list_resource_servers_limit_type = int [@@ocaml.doc ""]

type nonrec list_resource_servers_request = {
  user_pool_id : user_pool_id_type;
      [@ocaml.doc "The ID of the user pool where you want to list resource servers.\n"]
  max_results : list_resource_servers_limit_type option;
      [@ocaml.doc
        "The maximum number of resource servers that you want Amazon Cognito to return in the \
         response.\n"]
  next_token : pagination_key_type option;
      [@ocaml.doc
        "This API operation returns a limited number of results. The pagination token is an \
         identifier that you can present in an additional API request with the same parameters. \
         When you include the pagination token, Amazon Cognito returns the next set of items after \
         the current list. Subsequent requests return a new pagination token. By use of this \
         token, you can paginate through the full list of items.\n"]
}
[@@ocaml.doc ""]

type nonrec provider_description = {
  provider_name : provider_name_type option;
      [@ocaml.doc "The name of the IdP, for example [MySAMLProvider].\n"]
  provider_type : identity_provider_type_type option;
      [@ocaml.doc
        "The type of the provider, for example [SAML]. Amazon Cognito supports SAML 2.0, OIDC, and \
         social IdPs. User pools list supported social IdPs by name in this response parameter: \
         Facebook, Google, Login with Amazon, and Sign in with Apple.\n"]
  last_modified_date : date_type option;
      [@ocaml.doc
        "The date and time when the item was modified. Amazon Cognito returns this timestamp in \
         UNIX epoch time format. Your SDK might render the output in a human-readable format like \
         ISO 8601 or a Java [Date] object.\n"]
  creation_date : date_type option;
      [@ocaml.doc
        "The date and time when the item was created. Amazon Cognito returns this timestamp in \
         UNIX epoch time format. Your SDK might render the output in a human-readable format like \
         ISO 8601 or a Java [Date] object.\n"]
}
[@@ocaml.doc "The details of a user pool identity provider (IdP), including name and type.\n"]

type nonrec providers_list_type = provider_description list [@@ocaml.doc ""]

type nonrec list_identity_providers_response = {
  providers : providers_list_type;
      [@ocaml.doc
        "An array of the IdPs in your user pool. For each, the response includes identifiers, the \
         IdP name and type, and trust-relationship details like the issuer URL.\n"]
  next_token : pagination_key_type option;
      [@ocaml.doc
        "The identifier that Amazon Cognito returned with the previous request to this operation. \
         When you include a pagination token in your request, Amazon Cognito returns the next set \
         of items in the list. By use of this token, you can paginate through the full list of \
         items.\n"]
}
[@@ocaml.doc ""]

type nonrec list_providers_limit_type = int [@@ocaml.doc ""]

type nonrec list_identity_providers_request = {
  user_pool_id : user_pool_id_type;
      [@ocaml.doc "The ID of the user pool where you want to list IdPs.\n"]
  max_results : list_providers_limit_type option;
      [@ocaml.doc
        "The maximum number of IdPs that you want Amazon Cognito to return in the response.\n"]
  next_token : pagination_key_type option;
      [@ocaml.doc
        "This API operation returns a limited number of results. The pagination token is an \
         identifier that you can present in an additional API request with the same parameters. \
         When you include the pagination token, Amazon Cognito returns the next set of items after \
         the current list. Subsequent requests return a new pagination token. By use of this \
         token, you can paginate through the full list of items.\n"]
}
[@@ocaml.doc ""]

type nonrec group_list_type = group_type list [@@ocaml.doc ""]

type nonrec list_groups_response = {
  groups : group_list_type option;
      [@ocaml.doc
        "An array of groups and their details. Each entry that's returned includes description, \
         precedence, and IAM role values.\n"]
  next_token : pagination_key option;
      [@ocaml.doc
        "The identifier that Amazon Cognito returned with the previous request to this operation. \
         When you include a pagination token in your request, Amazon Cognito returns the next set \
         of items in the list. By use of this token, you can paginate through the full list of \
         items.\n"]
}
[@@ocaml.doc ""]

type nonrec list_groups_request = {
  user_pool_id : user_pool_id_type;
      [@ocaml.doc "The ID of the user pool where you want to list user groups.\n"]
  limit : query_limit_type option;
      [@ocaml.doc
        "The maximum number of groups that you want Amazon Cognito to return in the response.\n"]
  next_token : pagination_key option;
      [@ocaml.doc
        "This API operation returns a limited number of results. The pagination token is an \
         identifier that you can present in an additional API request with the same parameters. \
         When you include the pagination token, Amazon Cognito returns the next set of items after \
         the current list. Subsequent requests return a new pagination token. By use of this \
         token, you can paginate through the full list of items.\n"]
}
[@@ocaml.doc ""]

type nonrec device_type = {
  device_key : device_key_type option;
      [@ocaml.doc
        "The device key, for example [us-west-2_EXAMPLE-a1b2c3d4-5678-90ab-cdef-EXAMPLE22222].\n"]
  device_attributes : attribute_list_type option;
      [@ocaml.doc "Metadata about a user's device, like name and last-access source IP.\n"]
  device_create_date : date_type option;
      [@ocaml.doc
        "The date and time when the item was created. Amazon Cognito returns this timestamp in \
         UNIX epoch time format. Your SDK might render the output in a human-readable format like \
         ISO 8601 or a Java [Date] object.\n"]
  device_last_modified_date : date_type option;
      [@ocaml.doc
        "The date and time when the item was modified. Amazon Cognito returns this timestamp in \
         UNIX epoch time format. Your SDK might render the output in a human-readable format like \
         ISO 8601 or a Java [Date] object.\n"]
  device_last_authenticated_date : date_type option;
      [@ocaml.doc "The date when the user last signed in with the device.\n"]
}
[@@ocaml.doc
  "Information about a user's device that they've registered for device SRP authentication in your \
   application. For more information, see \
   {{:https://docs.aws.amazon.com/cognito/latest/developerguide/amazon-cognito-user-pools-device-tracking.html}Working \
   with user devices in your user pool}.\n"]

type nonrec device_list_type = device_type list [@@ocaml.doc ""]

type nonrec list_devices_response = {
  devices : device_list_type option;
      [@ocaml.doc
        "An array of devices and their details. Each entry that's returned includes device \
         information, last-accessed and created dates, and the device key.\n"]
  pagination_token : search_pagination_token_type option;
      [@ocaml.doc
        "The identifier that Amazon Cognito returned with the previous request to this operation. \
         When you include a pagination token in your request, Amazon Cognito returns the next set \
         of items in the list. By use of this token, you can paginate through the full list of \
         items.\n"]
}
[@@ocaml.doc "Represents the response to list devices.\n"]

type nonrec list_devices_request = {
  access_token : token_model_type;
      [@ocaml.doc
        "A valid access token that Amazon Cognito issued to the currently signed-in user. Must \
         include a scope claim for [aws.cognito.signin.user.admin].\n"]
  limit : query_limit_type option;
      [@ocaml.doc
        "The maximum number of devices that you want Amazon Cognito to return in the response.\n"]
  pagination_token : search_pagination_token_type option;
      [@ocaml.doc
        "This API operation returns a limited number of results. The pagination token is an \
         identifier that you can present in an additional API request with the same parameters. \
         When you include the pagination token, Amazon Cognito returns the next set of items after \
         the current list. Subsequent requests return a new pagination token. By use of this \
         token, you can paginate through the full list of items.\n"]
}
[@@ocaml.doc "Represents the request to list the devices.\n"]

type nonrec available_challenge_list_type = challenge_name_type list [@@ocaml.doc ""]

type nonrec initiate_auth_response = {
  challenge_name : challenge_name_type option;
      [@ocaml.doc
        "The name of an additional authentication challenge that you must respond to.\n\n\
        \ Possible challenges include the following:\n\
        \ \n\
        \   All of the following challenges require [USERNAME] and, when the app client has a \
         client secret, [SECRET_HASH] in the parameters. Include a [DEVICE_KEY] for device \
         authentication.\n\
        \   \n\
        \     {ul\n\
        \           {-   [WEB_AUTHN]: Respond to the challenge with the results of a successful \
         authentication with a WebAuthn authenticator, or passkey, as [CREDENTIAL]. Examples of \
         WebAuthn authenticators include biometric devices and security keys.\n\
        \               \n\
        \                }\n\
        \           {-   [PASSWORD]: Respond with the user's password as [PASSWORD].\n\
        \               \n\
        \                }\n\
        \           {-   [PASSWORD_SRP]: Respond with the initial SRP secret as [SRP_A].\n\
        \               \n\
        \                }\n\
        \           {-   [SELECT_CHALLENGE]: Respond with a challenge selection as [ANSWER]. It \
         must be one of the challenge types in the [AvailableChallenges] response parameter. Add \
         the parameters of the selected challenge, for example [USERNAME] and [SMS_OTP].\n\
        \               \n\
        \                }\n\
        \           {-   [SMS_MFA]: Respond with the code that your user pool delivered in an SMS \
         message, as [SMS_MFA_CODE] \n\
        \               \n\
        \                }\n\
        \           {-   [EMAIL_MFA]: Respond with the code that your user pool delivered in an \
         email message, as [EMAIL_MFA_CODE] \n\
        \               \n\
        \                }\n\
        \           {-   [EMAIL_OTP]: Respond with the code that your user pool delivered in an \
         email message, as [EMAIL_OTP_CODE] .\n\
        \               \n\
        \                }\n\
        \           {-   [SMS_OTP]: Respond with the code that your user pool delivered in an SMS \
         message, as [SMS_OTP_CODE].\n\
        \               \n\
        \                }\n\
        \           {-   [PASSWORD_VERIFIER]: Respond with the second stage of SRP secrets as \
         [PASSWORD_CLAIM_SIGNATURE], [PASSWORD_CLAIM_SECRET_BLOCK], and [TIMESTAMP].\n\
        \               \n\
        \                }\n\
        \           {-   [CUSTOM_CHALLENGE]: This is returned if your custom authentication flow \
         determines that the user should pass another challenge before tokens are issued. The \
         parameters of the challenge are determined by your Lambda function and issued in the \
         [ChallengeParameters] of a challenge response.\n\
        \               \n\
        \                }\n\
        \           {-   [DEVICE_SRP_AUTH]: Respond with the initial parameters of device SRP \
         authentication. For more information, see \
         {{:https://docs.aws.amazon.com/cognito/latest/developerguide/amazon-cognito-user-pools-device-tracking.html#user-pools-remembered-devices-signing-in-with-a-device}Signing \
         in with a device}.\n\
        \               \n\
        \                }\n\
        \           {-   [DEVICE_PASSWORD_VERIFIER]: Respond with [PASSWORD_CLAIM_SIGNATURE], \
         [PASSWORD_CLAIM_SECRET_BLOCK], and [TIMESTAMP] after client-side SRP calculations. For \
         more information, see \
         {{:https://docs.aws.amazon.com/cognito/latest/developerguide/amazon-cognito-user-pools-device-tracking.html#user-pools-remembered-devices-signing-in-with-a-device}Signing \
         in with a device}.\n\
        \               \n\
        \                }\n\
        \           {-   [NEW_PASSWORD_REQUIRED]: For users who are required to change their \
         passwords after successful first login. Respond to this challenge with [NEW_PASSWORD] and \
         any required attributes that Amazon Cognito returned in the [requiredAttributes] \
         parameter. You can also set values for attributes that aren't required by your user pool \
         and that your app client can write.\n\
        \               \n\
        \                Amazon Cognito only returns this challenge for users who have temporary \
         passwords. When you create passwordless users, you must provide values for all required \
         attributes.\n\
        \                \n\
        \                  In a [NEW_PASSWORD_REQUIRED] challenge response, you can't modify a \
         required attribute that already has a value. In [AdminRespondToAuthChallenge] or \
         [RespondToAuthChallenge], set a value for any keys that Amazon Cognito returned in the \
         [requiredAttributes] parameter, then use the [AdminUpdateUserAttributes] or \
         [UpdateUserAttributes] API operation to modify the value of any additional attributes.\n\
        \                  \n\
        \                    }\n\
        \           {-   [MFA_SETUP]: For users who are required to setup an MFA factor before \
         they can sign in. The MFA types activated for the user pool will be listed in the \
         challenge parameters [MFAS_CAN_SETUP] value. \n\
        \               \n\
        \                To set up time-based one-time password (TOTP) MFA, use the session \
         returned in this challenge from [InitiateAuth] or [AdminInitiateAuth] as an input to \
         [AssociateSoftwareToken]. Then, use the session returned by [VerifySoftwareToken] as an \
         input to [RespondToAuthChallenge] or [AdminRespondToAuthChallenge] with challenge name \
         [MFA_SETUP] to complete sign-in. \n\
        \                \n\
        \                 To set up SMS or email MFA, collect a [phone_number] or [email] \
         attribute for the user. Then restart the authentication flow with an [InitiateAuth] or \
         [AdminInitiateAuth] request. \n\
        \                 \n\
        \                  }\n\
        \           }\n\
        \  "]
  session : session_type option;
      [@ocaml.doc
        "The session identifier that links a challenge response to the initial authentication \
         request. If the user must pass another challenge, Amazon Cognito returns a session ID and \
         challenge parameters.\n"]
  challenge_parameters : challenge_parameters_type option;
      [@ocaml.doc
        "The required parameters of the [ChallengeName] challenge.\n\n\
        \ All challenges require [USERNAME]. They also require [SECRET_HASH] if your app client \
         has a client secret.\n\
        \ "]
  authentication_result : authentication_result_type option;
      [@ocaml.doc
        "The result of a successful and complete authentication request. This result is only \
         returned if the user doesn't need to pass another challenge. If they must pass another \
         challenge before they get tokens, Amazon Cognito returns a challenge in [ChallengeName], \
         [ChallengeParameters], and [Session] response parameters.\n"]
  available_challenges : available_challenge_list_type option;
      [@ocaml.doc
        "This response parameter lists the available authentication challenges that users can \
         select from in \
         {{:https://docs.aws.amazon.com/cognito/latest/developerguide/authentication-flows-selection-sdk.html#authentication-flows-selection-choice}choice-based \
         authentication}. For example, they might be able to choose between passkey \
         authentication, a one-time password from an SMS message, and a traditional password.\n"]
}
[@@ocaml.doc "Initiates the authentication response.\n"]

type nonrec auth_parameters_type = (string_type * string_type) list [@@ocaml.doc ""]

type nonrec auth_flow_type =
  | USER_SRP_AUTH [@ocaml.doc ""]
  | REFRESH_TOKEN_AUTH [@ocaml.doc ""]
  | REFRESH_TOKEN [@ocaml.doc ""]
  | CUSTOM_AUTH [@ocaml.doc ""]
  | ADMIN_NO_SRP_AUTH [@ocaml.doc ""]
  | USER_PASSWORD_AUTH [@ocaml.doc ""]
  | ADMIN_USER_PASSWORD_AUTH [@ocaml.doc ""]
  | USER_AUTH [@ocaml.doc ""]
[@@ocaml.doc ""]

type nonrec initiate_auth_request = {
  auth_flow : auth_flow_type;
      [@ocaml.doc
        "The authentication flow that you want to initiate. Each [AuthFlow] has linked \
         [AuthParameters] that you must submit. The following are some example flows.\n\n\
        \  USER_AUTH  The entry point for \
         {{:https://docs.aws.amazon.com/cognito/latest/developerguide/authentication-flows-selection-sdk.html#authentication-flows-selection-choice}choice-based \
         authentication} with passwords, one-time passwords, and WebAuthn authenticators. Request \
         a preferred authentication type or review available authentication types. From the \
         offered authentication types, select one in a challenge response and then authenticate \
         with that method in an additional challenge response. To activate this setting, your user \
         pool must be in the \
         {{:https://docs.aws.amazon.com/cognito/latest/developerguide/feature-plans-features-essentials.html} \
         Essentials tier} or higher.\n\
        \             \n\
        \               USER_SRP_AUTH  Username-password authentication with the Secure Remote \
         Password (SRP) protocol. For more information, see \
         {{:https://docs.aws.amazon.com/cognito/latest/developerguide/amazon-cognito-user-pools-authentication-flow.html#Using-SRP-password-verification-in-custom-authentication-flow}Use \
         SRP password verification in custom authentication flow}.\n\
        \                              \n\
        \                                REFRESH_TOKEN_AUTH and REFRESH_TOKEN  Receive new ID and \
         access tokens when you pass a [REFRESH_TOKEN] parameter with a valid refresh token as the \
         value. For more information, see \
         {{:https://docs.aws.amazon.com/cognito/latest/developerguide/amazon-cognito-user-pools-using-the-refresh-token.html}Using \
         the refresh token}.\n\
        \                                                                      \n\
        \                                                                        CUSTOM_AUTH  \n\
         Custom authentication with Lambda triggers. For more information, see \
         {{:https://docs.aws.amazon.com/cognito/latest/developerguide/user-pool-lambda-challenge.html}Custom \
         authentication challenge Lambda triggers}.\n\n\
        \  USER_PASSWORD_AUTH  Client-side username-password authentication with the password sent \
         directly in the request. For more information about client-side and server-side \
         authentication, see \
         {{:https://docs.aws.amazon.com/cognito/latest/developerguide/authentication-flows-public-server-side.html}SDK \
         authorization models}.\n\
        \                      \n\
        \                          [ADMIN_USER_PASSWORD_AUTH] is a flow type of \
         [AdminInitiateAuth] and isn't valid for InitiateAuth. [ADMIN_NO_SRP_AUTH] is a legacy \
         server-side username-password flow and isn't valid for InitiateAuth.\n\
        \                         "]
  auth_parameters : auth_parameters_type option;
      [@ocaml.doc
        "The authentication parameters. These are inputs corresponding to the [AuthFlow] that \
         you're invoking.\n\n\
        \ The following are some authentication flows and their parameters. Add a [SECRET_HASH] \
         parameter if your app client has a client secret. Add [DEVICE_KEY] if you want to bypass \
         multi-factor authentication with a remembered device. \n\
        \ \n\
        \   USER_AUTH  {ul\n\
        \                    {-   [USERNAME] (required)\n\
        \                        \n\
        \                         }\n\
        \                    {-   [PREFERRED_CHALLENGE]. If you don't provide a value for \
         [PREFERRED_CHALLENGE], Amazon Cognito responds with the [AvailableChallenges] parameter \
         that specifies the available sign-in methods.\n\
        \                        \n\
        \                         }\n\
        \                    }  USER_SRP_AUTH  {ul\n\
        \                                            {-   [USERNAME] (required)\n\
        \                                                \n\
        \                                                 }\n\
        \                                            {-   [SRP_A] (required)\n\
        \                                                \n\
        \                                                 }\n\
        \                                            }\n\
        \    USER_PASSWORD_AUTH  {ul\n\
        \                              {-   [USERNAME] (required)\n\
        \                                  \n\
        \                                   }\n\
        \                              {-   [PASSWORD] (required)\n\
        \                                  \n\
        \                                   }\n\
        \                              }\n\
        \    REFRESH_TOKEN_AUTH/REFRESH_TOKEN  {ul\n\
        \                                            {-   [REFRESH_TOKEN](required)\n\
        \                                                \n\
        \                                                 }\n\
        \                                            }\n\
        \    CUSTOM_AUTH  {ul\n\
        \                       {-   [USERNAME] (required)\n\
        \                           \n\
        \                            }\n\
        \                       {-   [ChallengeName: SRP_A] (when doing SRP authentication before \
         custom challenges)\n\
        \                           \n\
        \                            }\n\
        \                       {-   [SRP_A: (An SRP_A value)] (when doing SRP authentication \
         before custom challenges)\n\
        \                           \n\
        \                            }\n\
        \                       }\n\
        \     For more information about [SECRET_HASH], see \
         {{:https://docs.aws.amazon.com/cognito/latest/developerguide/signing-up-users-in-your-app.html#cognito-user-pools-computing-secret-hash}Computing \
         secret hash values}. For information about [DEVICE_KEY], see \
         {{:https://docs.aws.amazon.com/cognito/latest/developerguide/amazon-cognito-user-pools-device-tracking.html}Working \
         with user devices in your user pool}.\n\
        \     "]
  client_metadata : client_metadata_type option;
      [@ocaml.doc
        "A map of custom key-value pairs that you can provide as input for any custom workflows \
         that this action triggers. You create custom workflows by assigning Lambda functions to \
         user pool triggers.\n\n\
        \ When Amazon Cognito invokes any of these functions, it passes a JSON payload, which the \
         function receives as input. This payload contains a [clientMetadata] attribute that \
         provides the data that you assigned to the ClientMetadata parameter in your request. In \
         your function code, you can process the [clientMetadata] value to enhance your workflow \
         for your specific needs.\n\
        \ \n\
        \  To review the Lambda trigger types that Amazon Cognito invokes at runtime with API \
         requests, see \
         {{:https://docs.aws.amazon.com/cognito/latest/developerguide/cognito-user-pools-working-with-lambda-triggers.html#lambda-triggers-by-event} \
         Connecting API actions to Lambda triggers} in the {i Amazon Cognito Developer Guide}.\n\
        \  \n\
        \   The [ClientMetadata] value is passed as input to the functions for only the following \
         triggers:\n\
        \   \n\
        \    {ul\n\
        \          {-  Pre signup\n\
        \              \n\
        \               }\n\
        \          {-  Pre authentication\n\
        \              \n\
        \               }\n\
        \          {-  User migration\n\
        \              \n\
        \               }\n\
        \          }\n\
        \   This request also invokes the functions for the following triggers, but doesn't pass \
         [ClientMetadata]:\n\
        \   \n\
        \    {ul\n\
        \          {-  Post authentication\n\
        \              \n\
        \               }\n\
        \          {-  Custom message\n\
        \              \n\
        \               }\n\
        \          {-  Pre token generation\n\
        \              \n\
        \               }\n\
        \          {-  Create auth challenge\n\
        \              \n\
        \               }\n\
        \          {-  Define auth challenge\n\
        \              \n\
        \               }\n\
        \          {-  Custom email sender\n\
        \              \n\
        \               }\n\
        \          {-  Custom SMS sender\n\
        \              \n\
        \               }\n\
        \          }\n\
        \    When you use the [ClientMetadata] parameter, note that Amazon Cognito won't do the \
         following:\n\
        \    \n\
        \     {ul\n\
        \           {-  Store the [ClientMetadata] value. This data is available only to Lambda \
         triggers that are assigned to a user pool to support custom workflows. If your user pool \
         configuration doesn't include triggers, the [ClientMetadata] parameter serves no purpose.\n\
        \               \n\
        \                }\n\
        \           {-  Validate the [ClientMetadata] value.\n\
        \               \n\
        \                }\n\
        \           {-  Encrypt the [ClientMetadata] value. Don't send sensitive information in \
         this parameter.\n\
        \               \n\
        \                }\n\
        \           }\n\
        \   "]
  client_id : client_id_type;
      [@ocaml.doc "The ID of the app client that your user wants to sign in to.\n"]
  analytics_metadata : analytics_metadata_type option;
      [@ocaml.doc
        "Information that supports analytics outcomes with Amazon Pinpoint, including the user's \
         endpoint ID. The endpoint ID is a destination for Amazon Pinpoint push notifications, for \
         example a device identifier, email address, or phone number.\n"]
  user_context_data : user_context_data_type option;
      [@ocaml.doc
        "Contextual data about your user session like the device fingerprint, IP address, or \
         location. Amazon Cognito threat protection evaluates the risk of an authentication event \
         based on the context that your app generates and passes to Amazon Cognito when it makes \
         API requests.\n\n\
        \ For more information, see \
         {{:https://docs.aws.amazon.com/cognito/latest/developerguide/user-pool-settings-viewing-threat-protection-app.html}Collecting \
         data for threat protection in applications}.\n\
        \ "]
  session : session_type option;
      [@ocaml.doc
        "The optional session ID from a [ConfirmSignUp] API request. You can sign in a user \
         directly from the sign-up process with the [USER_AUTH] authentication flow. When you pass \
         the session ID to [InitiateAuth], Amazon Cognito assumes the SMS or email message \
         one-time verification password from [ConfirmSignUp] as the primary authentication factor. \
         You're not required to submit this code a second time. This option is only valid for \
         users who have confirmed their sign-up and are signing in for the first time within the \
         authentication flow session duration of the session ID.\n"]
}
[@@ocaml.doc "Initiates the authentication request.\n"]

type nonrec global_sign_out_response = unit [@@ocaml.doc ""]

type nonrec global_sign_out_request = {
  access_token : token_model_type;
      [@ocaml.doc
        "A valid access token that Amazon Cognito issued to the currently signed-in user. Must \
         include a scope claim for [aws.cognito.signin.user.admin].\n"]
}
[@@ocaml.doc "Represents the request to sign out all devices.\n"]

type nonrec get_user_pool_mfa_config_response = {
  sms_mfa_configuration : sms_mfa_config_type option;
      [@ocaml.doc
        "Shows user pool configuration for SMS message MFA. Includes the message template and the \
         SMS message sending configuration for Amazon SNS.\n"]
  software_token_mfa_configuration : software_token_mfa_config_type option;
      [@ocaml.doc
        "Shows user pool configuration for time-based one-time password (TOTP) MFA. Includes TOTP \
         enabled or disabled state.\n"]
  email_mfa_configuration : email_mfa_config_type option;
      [@ocaml.doc
        "Shows configuration for user pool email message MFA and sign-in with one-time passwords \
         (OTPs). Includes the subject and body of the email message template for sign-in and MFA \
         messages. To activate this setting, your user pool must be in the \
         {{:https://docs.aws.amazon.com/cognito/latest/developerguide/feature-plans-features-essentials.html} \
         Essentials tier} or higher.\n"]
  mfa_configuration : user_pool_mfa_type option;
      [@ocaml.doc
        "Displays the state of multi-factor authentication (MFA) as on, off, or optional. When \
         [ON], all users must set up MFA before they can sign in. When [OPTIONAL], your \
         application must make a client-side determination of whether a user wants to register an \
         MFA device. For user pools with adaptive authentication with threat protection, choose \
         [OPTIONAL].\n\n\
        \ When [MfaConfiguration] is [OPTIONAL], managed login doesn't automatically prompt users \
         to set up MFA. Amazon Cognito generates MFA prompts in API responses and in managed login \
         for users who have chosen and configured a preferred MFA factor.\n\
        \ "]
  web_authn_configuration : web_authn_configuration_type option;
      [@ocaml.doc
        "Shows user pool configuration for sign-in with passkey authenticators such as biometric \
         devices and security keys. Includes relying-party configuration, user-verification \
         requirements, and whether passkeys can satisfy MFA requirements.\n"]
}
[@@ocaml.doc ""]

type nonrec get_user_pool_mfa_config_request = {
  user_pool_id : user_pool_id_type;
      [@ocaml.doc
        "The ID of the user pool where you want to query WebAuthn and MFA configuration.\n"]
}
[@@ocaml.doc ""]

type nonrec configured_user_auth_factors_list_type = auth_factor_type list [@@ocaml.doc ""]

type nonrec user_mfa_setting_list_type = string_type list [@@ocaml.doc ""]

type nonrec get_user_auth_factors_response = {
  username : username_type;
      [@ocaml.doc
        "The name of the user who is eligible for the authentication factors in the response.\n"]
  preferred_mfa_setting : string_type option;
      [@ocaml.doc
        "The challenge method that Amazon Cognito returns to the user in response to sign-in \
         requests. Users can prefer SMS message, email message, or TOTP MFA.\n"]
  user_mfa_setting_list : user_mfa_setting_list_type option;
      [@ocaml.doc
        "The MFA options that are activated for the user. The possible values in this list are \
         [SMS_MFA], [EMAIL_OTP], and [SOFTWARE_TOKEN_MFA].\n"]
  configured_user_auth_factors : configured_user_auth_factors_list_type option;
      [@ocaml.doc
        "The authentication types that are available to the user with [USER_AUTH] sign-in, for \
         example [\\[\"PASSWORD\", \"WEB_AUTHN\"\\]].\n"]
}
[@@ocaml.doc ""]

type nonrec get_user_auth_factors_request = {
  access_token : token_model_type;
      [@ocaml.doc
        "A valid access token that Amazon Cognito issued to the currently signed-in user. Must \
         include a scope claim for [aws.cognito.signin.user.admin].\n"]
}
[@@ocaml.doc ""]

type nonrec get_user_attribute_verification_code_response = {
  code_delivery_details : code_delivery_details_type option;
      [@ocaml.doc
        "Information about the delivery destination of the user attribute verification code.\n"]
}
[@@ocaml.doc
  "The verification code response returned by the server response to get the user attribute \
   verification code.\n"]

type nonrec get_user_attribute_verification_code_request = {
  access_token : token_model_type;
      [@ocaml.doc
        "A valid access token that Amazon Cognito issued to the currently signed-in user. Must \
         include a scope claim for [aws.cognito.signin.user.admin].\n"]
  attribute_name : attribute_name_type;
      [@ocaml.doc "The name of the attribute that the user wants to verify, for example [email].\n"]
  client_metadata : client_metadata_type option;
      [@ocaml.doc
        "A map of custom key-value pairs that you can provide as input for any custom workflows \
         that this action triggers. You create custom workflows by assigning Lambda functions to \
         user pool triggers.\n\n\
        \ When Amazon Cognito invokes any of these functions, it passes a JSON payload, which the \
         function receives as input. This payload contains a [clientMetadata] attribute that \
         provides the data that you assigned to the ClientMetadata parameter in your request. In \
         your function code, you can process the [clientMetadata] value to enhance your workflow \
         for your specific needs.\n\
        \ \n\
        \  To review the Lambda trigger types that Amazon Cognito invokes at runtime with API \
         requests, see \
         {{:https://docs.aws.amazon.com/cognito/latest/developerguide/cognito-user-pools-working-with-lambda-triggers.html#lambda-triggers-by-event} \
         Connecting API actions to Lambda triggers} in the {i Amazon Cognito Developer Guide}.\n\
        \  \n\
        \    When you use the [ClientMetadata] parameter, note that Amazon Cognito won't do the \
         following:\n\
        \    \n\
        \     {ul\n\
        \           {-  Store the [ClientMetadata] value. This data is available only to Lambda \
         triggers that are assigned to a user pool to support custom workflows. If your user pool \
         configuration doesn't include triggers, the [ClientMetadata] parameter serves no purpose.\n\
        \               \n\
        \                }\n\
        \           {-  Validate the [ClientMetadata] value.\n\
        \               \n\
        \                }\n\
        \           {-  Encrypt the [ClientMetadata] value. Don't send sensitive information in \
         this parameter.\n\
        \               \n\
        \                }\n\
        \           }\n\
        \   "]
}
[@@ocaml.doc "Represents the request to get user attribute verification.\n"]

type nonrec get_user_response = {
  username : username_type; [@ocaml.doc "The name of the user that you requested.\n"]
  user_attributes : attribute_list_type;
      [@ocaml.doc
        "An array of name-value pairs representing user attributes.\n\n\
        \ Custom attributes are prepended with the [custom:] prefix.\n\
        \ "]
  mfa_options : mfa_option_list_type option;
      [@ocaml.doc
        " {i This response parameter is no longer supported.} It provides information only about \
         SMS MFA configurations. It doesn't provide information about time-based one-time password \
         (TOTP) software token MFA configurations. To look up information about either type of MFA \
         configuration, use UserMFASettingList instead.\n"]
  preferred_mfa_setting : string_type option;
      [@ocaml.doc
        "The user's preferred MFA. Users can prefer SMS message, email message, or TOTP MFA.\n"]
  user_mfa_setting_list : user_mfa_setting_list_type option;
      [@ocaml.doc
        "The MFA options that are activated for the user. The possible values in this list are \
         [SMS_MFA], [EMAIL_OTP], and [SOFTWARE_TOKEN_MFA].\n"]
}
[@@ocaml.doc
  "Represents the response from the server from the request to get information about the user.\n"]

type nonrec get_user_request = {
  access_token : token_model_type;
      [@ocaml.doc
        "A valid access token that Amazon Cognito issued to the currently signed-in user. Must \
         include a scope claim for [aws.cognito.signin.user.admin].\n"]
}
[@@ocaml.doc "Represents the request to get information about the user.\n"]

type nonrec get_ui_customization_response = {
  ui_customization : ui_customization_type;
      [@ocaml.doc
        "Information about the classic hosted UI custom CSS and logo-image branding that you \
         applied to the user pool or app client.\n"]
}
[@@ocaml.doc ""]

type nonrec get_ui_customization_request = {
  user_pool_id : user_pool_id_type;
      [@ocaml.doc "The ID of the user pool that you want to query for branding settings.\n"]
  client_id : client_id_type option;
      [@ocaml.doc "The ID of the app client that you want to query for branding settings.\n"]
}
[@@ocaml.doc ""]

type nonrec refresh_token_reuse_exception = { message : message_type option [@ocaml.doc ""] }
[@@ocaml.doc
  "This exception is throw when your application requests token refresh with a refresh token that \
   has been invalidated by refresh-token rotation.\n"]

type nonrec get_tokens_from_refresh_token_response = {
  authentication_result : authentication_result_type option; [@ocaml.doc ""]
}
[@@ocaml.doc ""]

type nonrec get_tokens_from_refresh_token_request = {
  refresh_token : token_model_type;
      [@ocaml.doc
        "A valid refresh token that can authorize the request for new tokens. When refresh token \
         rotation is active in the requested app client, this token is invalidated after the \
         request is complete and after an optional grace period.\n"]
  client_id : client_id_type;
      [@ocaml.doc
        "The app client that issued the refresh token to the user who wants to request new tokens.\n"]
  client_secret : client_secret_type option;
      [@ocaml.doc "The client secret of the requested app client, if the client has a secret.\n"]
  device_key : device_key_type option;
      [@ocaml.doc
        "When you enable device remembering, Amazon Cognito issues a device key that you can use \
         for device authentication that bypasses multi-factor authentication (MFA). To implement \
         [GetTokensFromRefreshToken] in a user pool with device remembering, you must capture the \
         device key from the initial authentication request. If your application doesn't provide \
         the key of a registered device, Amazon Cognito issues a new one. You must provide the \
         confirmed device key in this request if device remembering is enabled in your user pool.\n\n\
        \ For more information about device remembering, see \
         {{:https://docs.aws.amazon.com/cognito/latest/developerguide/amazon-cognito-user-pools-device-tracking.html}Working \
         with devices}.\n\
        \ "]
  client_metadata : client_metadata_type option;
      [@ocaml.doc
        "A map of custom key-value pairs that you can provide as input for any custom workflows \
         that this action triggers. You create custom workflows by assigning Lambda functions to \
         user pool triggers.\n\n\
        \ When Amazon Cognito invokes any of these functions, it passes a JSON payload, which the \
         function receives as input. This payload contains a [clientMetadata] attribute that \
         provides the data that you assigned to the ClientMetadata parameter in your request. In \
         your function code, you can process the [clientMetadata] value to enhance your workflow \
         for your specific needs.\n\
        \ \n\
        \  To review the Lambda trigger types that Amazon Cognito invokes at runtime with API \
         requests, see \
         {{:https://docs.aws.amazon.com/cognito/latest/developerguide/cognito-user-pools-working-with-lambda-triggers.html#lambda-triggers-by-event} \
         Connecting API actions to Lambda triggers} in the {i Amazon Cognito Developer Guide}.\n\
        \  \n\
        \    When you use the [ClientMetadata] parameter, note that Amazon Cognito won't do the \
         following:\n\
        \    \n\
        \     {ul\n\
        \           {-  Store the [ClientMetadata] value. This data is available only to Lambda \
         triggers that are assigned to a user pool to support custom workflows. If your user pool \
         configuration doesn't include triggers, the [ClientMetadata] parameter serves no purpose.\n\
        \               \n\
        \                }\n\
        \           {-  Validate the [ClientMetadata] value.\n\
        \               \n\
        \                }\n\
        \           {-  Encrypt the [ClientMetadata] value. Don't send sensitive information in \
         this parameter.\n\
        \               \n\
        \                }\n\
        \           }\n\
        \   "]
}
[@@ocaml.doc ""]

type nonrec get_signing_certificate_response = {
  certificate : string_type option;
      [@ocaml.doc
        "The x.509 certificate that signs SAML 2.0 authentication requests for your user pool.\n"]
}
[@@ocaml.doc "Response from Amazon Cognito for a signing certificate request.\n"]

type nonrec get_signing_certificate_request = {
  user_pool_id : user_pool_id_type;
      [@ocaml.doc "The ID of the user pool where you want to view the signing certificate.\n"]
}
[@@ocaml.doc "Request to get a signing certificate from Amazon Cognito.\n"]

type nonrec get_provisioned_limit_response = {
  limit : limit_type;
      [@ocaml.doc "The provisioned and default limit values for the requested limit.\n"]
}
[@@ocaml.doc ""]

type nonrec get_provisioned_limit_request = {
  limit_definition : limit_definition_type;
      [@ocaml.doc
        "The limit to retrieve. Specify the limit class and the attributes that identify the limit.\n"]
}
[@@ocaml.doc ""]

type nonrec get_log_delivery_configuration_response = {
  log_delivery_configuration : log_delivery_configuration_type option;
      [@ocaml.doc
        "The logging configuration of the requested user pool. Includes types of logs configured \
         and their destinations.\n"]
}
[@@ocaml.doc ""]

type nonrec get_log_delivery_configuration_request = {
  user_pool_id : user_pool_id_type;
      [@ocaml.doc
        "The ID of the user pool that has the logging configuration that you want to view.\n"]
}
[@@ocaml.doc ""]

type nonrec get_identity_provider_by_identifier_response = {
  identity_provider : identity_provider_type;
      [@ocaml.doc
        "The configuration of the IdP in your user pool. Includes additional identifiers, the IdP \
         name and type, and trust-relationship details like the issuer URL.\n"]
}
[@@ocaml.doc ""]

type nonrec get_identity_provider_by_identifier_request = {
  user_pool_id : user_pool_id_type;
      [@ocaml.doc "The ID of the user pool where you want to get information about the IdP.\n"]
  idp_identifier : idp_identifier_type;
      [@ocaml.doc
        "The identifier that you assigned to your user pool. The identifier is an alternative name \
         for an IdP that is distinct from the IdP name. For example, an IdP with a name of [MyIdP] \
         might have an identifier of the email domain [example.com].\n"]
}
[@@ocaml.doc ""]

type nonrec get_group_response = {
  group : group_type option;
      [@ocaml.doc
        "A container for the requested group. Includes description, precedence, and IAM role values.\n"]
}
[@@ocaml.doc ""]

type nonrec get_group_request = {
  group_name : group_name_type;
      [@ocaml.doc "The name of the group that you want to get information about.\n"]
  user_pool_id : user_pool_id_type;
      [@ocaml.doc "The ID of the user pool that contains the group that you want to query.\n"]
}
[@@ocaml.doc ""]

type nonrec get_device_response = {
  device : device_type;
      [@ocaml.doc
        "Details of the requested device. Includes device information, last-accessed and created \
         dates, and the device key.\n"]
}
[@@ocaml.doc "Gets the device response.\n"]

type nonrec get_device_request = {
  device_key : device_key_type;
      [@ocaml.doc "The key of the device that you want to get information about.\n"]
  access_token : token_model_type option;
      [@ocaml.doc
        "A valid access token that Amazon Cognito issued to the currently signed-in user. Must \
         include a scope claim for [aws.cognito.signin.user.admin].\n"]
}
[@@ocaml.doc "Represents the request to get the device.\n"]

type nonrec list_of_string_types = string_type list [@@ocaml.doc ""]

type nonrec get_csv_header_response = {
  user_pool_id : user_pool_id_type option; [@ocaml.doc "The ID of the requested user pool.\n"]
  csv_header : list_of_string_types option;
      [@ocaml.doc
        "A comma-separated list of attributes from your user pool. Save this output to a [.csv] \
         file and populate it with the attributes of the users that you want to import.\n"]
}
[@@ocaml.doc
  "Represents the response from the server to the request to get the header information of the CSV \
   file for the user import job.\n"]

type nonrec get_csv_header_request = {
  user_pool_id : user_pool_id_type;
      [@ocaml.doc "The ID of the user pool that you want to import users into.\n"]
}
[@@ocaml.doc
  "Represents the request to get the header information of the CSV file for the user import job.\n"]

type nonrec forgot_password_response = {
  code_delivery_details : code_delivery_details_type option;
      [@ocaml.doc
        "Information about the phone number or email address that Amazon Cognito sent the \
         password-recovery code to.\n"]
}
[@@ocaml.doc "The response from Amazon Cognito to a request to reset a password.\n"]

type nonrec forgot_password_request = {
  client_id : client_id_type;
      [@ocaml.doc
        "The ID of the user pool app client associated with the current signed-in user.\n"]
  secret_hash : secret_hash_type option;
      [@ocaml.doc
        "A keyed-hash message authentication code (HMAC) calculated using the secret key of a user \
         pool client and username plus the client ID in the message. For more information about \
         [SecretHash], see \
         {{:https://docs.aws.amazon.com/cognito/latest/developerguide/signing-up-users-in-your-app.html#cognito-user-pools-computing-secret-hash}Computing \
         secret hash values}.\n"]
  user_context_data : user_context_data_type option;
      [@ocaml.doc
        "Contextual data about your user session like the device fingerprint, IP address, or \
         location. Amazon Cognito threat protection evaluates the risk of an authentication event \
         based on the context that your app generates and passes to Amazon Cognito when it makes \
         API requests.\n\n\
        \ For more information, see \
         {{:https://docs.aws.amazon.com/cognito/latest/developerguide/user-pool-settings-viewing-threat-protection-app.html}Collecting \
         data for threat protection in applications}.\n\
        \ "]
  username : username_type;
      [@ocaml.doc
        "The name of the user that you want to query or modify. The value of this parameter is \
         typically your user's username, but it can be any of their alias attributes. If \
         [username] isn't an alias attribute in your user pool, this value must be the [sub] of a \
         local user or the username of a user from a third-party IdP.\n"]
  analytics_metadata : analytics_metadata_type option;
      [@ocaml.doc
        "Information that supports analytics outcomes with Amazon Pinpoint, including the user's \
         endpoint ID. The endpoint ID is a destination for Amazon Pinpoint push notifications, for \
         example a device identifier, email address, or phone number.\n"]
  client_metadata : client_metadata_type option;
      [@ocaml.doc
        "A map of custom key-value pairs that you can provide as input for any custom workflows \
         that this action triggers. You create custom workflows by assigning Lambda functions to \
         user pool triggers.\n\n\
        \ When Amazon Cognito invokes any of these functions, it passes a JSON payload, which the \
         function receives as input. This payload contains a [clientMetadata] attribute that \
         provides the data that you assigned to the ClientMetadata parameter in your request. In \
         your function code, you can process the [clientMetadata] value to enhance your workflow \
         for your specific needs.\n\
        \ \n\
        \  To review the Lambda trigger types that Amazon Cognito invokes at runtime with API \
         requests, see \
         {{:https://docs.aws.amazon.com/cognito/latest/developerguide/cognito-user-pools-working-with-lambda-triggers.html#lambda-triggers-by-event} \
         Connecting API actions to Lambda triggers} in the {i Amazon Cognito Developer Guide}.\n\
        \  \n\
        \    When you use the [ClientMetadata] parameter, note that Amazon Cognito won't do the \
         following:\n\
        \    \n\
        \     {ul\n\
        \           {-  Store the [ClientMetadata] value. This data is available only to Lambda \
         triggers that are assigned to a user pool to support custom workflows. If your user pool \
         configuration doesn't include triggers, the [ClientMetadata] parameter serves no purpose.\n\
        \               \n\
        \                }\n\
        \           {-  Validate the [ClientMetadata] value.\n\
        \               \n\
        \                }\n\
        \           {-  Encrypt the [ClientMetadata] value. Don't send sensitive information in \
         this parameter.\n\
        \               \n\
        \                }\n\
        \           }\n\
        \   "]
}
[@@ocaml.doc "Represents the request to reset a user's password.\n"]

type nonrec forget_device_request = {
  access_token : token_model_type option;
      [@ocaml.doc
        "A valid access token that Amazon Cognito issued to the currently signed-in user. Must \
         include a scope claim for [aws.cognito.signin.user.admin].\n"]
  device_key : device_key_type;
      [@ocaml.doc
        "The unique identifier, or device key, of the device that the user wants to forget.\n"]
}
[@@ocaml.doc "Represents the request to forget the device.\n"]

type nonrec domain_status_type =
  | CREATING [@ocaml.doc ""]
  | DELETING [@ocaml.doc ""]
  | UPDATING [@ocaml.doc ""]
  | ACTIVE [@ocaml.doc ""]
  | FAILED [@ocaml.doc ""]
[@@ocaml.doc ""]

type nonrec domain_version_type = string [@@ocaml.doc ""]

type nonrec s3_bucket_type = string [@@ocaml.doc ""]

type nonrec domain_description_type = {
  user_pool_id : user_pool_id_type option;
      [@ocaml.doc "The ID of the user pool that the domain is attached to.\n"]
  aws_account_id : aws_account_id_type option;
      [@ocaml.doc "The Amazon Web Services account that you created the user pool in.\n"]
  domain : domain_type option;
      [@ocaml.doc
        "The domain string. For custom domains, this is the fully-qualified domain name, such as \
         [auth.example.com]. For Amazon Cognito prefix domains, this is the prefix alone, such as \
         [auth].\n"]
  s3_bucket : s3_bucket_type option;
      [@ocaml.doc "The Amazon S3 bucket where the static files for this domain are stored.\n"]
  cloud_front_distribution : string_type option;
      [@ocaml.doc "The Amazon CloudFront endpoint that hosts your custom domain.\n"]
  version : domain_version_type option; [@ocaml.doc "The app version.\n"]
  status : domain_status_type option; [@ocaml.doc "The domain status.\n"]
  custom_domain_config : custom_domain_config_type option;
      [@ocaml.doc
        "The configuration for a custom domain that hosts the sign-up and sign-in webpages for \
         your application.\n"]
  managed_login_version : wrapped_integer_type option;
      [@ocaml.doc
        "The version of managed login branding that you want to apply to your domain. A value of \
         [1] indicates hosted UI (classic) branding and a version of [2] indicates managed login \
         branding.\n\n\
        \ Managed login requires that your user pool be configured for any \
         {{:https://docs.aws.amazon.com/cognito/latest/developerguide/cognito-sign-in-feature-plans.html}feature \
         plan} other than [Lite].\n\
        \ "]
  routing : routing_type option;
      [@ocaml.doc
        "The routing configuration for the domain, including failover settings for multi-region \
         deployments. Currently only [Failover] configurations are allowed.\n"]
}
[@@ocaml.doc
  "A container for information about the user pool domain associated with the hosted UI and OAuth \
   endpoints.\n"]

type nonrec describe_user_pool_domain_response = {
  domain_description : domain_description_type option;
      [@ocaml.doc "The details of the requested user pool domain.\n"]
}
[@@ocaml.doc ""]

type nonrec describe_user_pool_domain_request = {
  domain : domain_type;
      [@ocaml.doc
        "The domain that you want to describe. For custom domains, this is the fully-qualified \
         domain name, such as [auth.example.com]. For Amazon Cognito prefix domains, this is the \
         prefix alone, such as [auth].\n"]
}
[@@ocaml.doc ""]

type nonrec describe_user_pool_client_response = {
  user_pool_client : user_pool_client_type option;
      [@ocaml.doc "The details of the request app client.\n"]
}
[@@ocaml.doc
  "Represents the response from the server from a request to describe the user pool client.\n"]

type nonrec describe_user_pool_client_request = {
  user_pool_id : user_pool_id_type;
      [@ocaml.doc "The ID of the user pool that contains the app client you want to describe.\n"]
  client_id : client_id_type; [@ocaml.doc "The ID of the app client that you want to describe.\n"]
}
[@@ocaml.doc "Represents the request to describe a user pool client.\n"]

type nonrec username_configuration_type = {
  case_sensitive : wrapped_boolean_type;
      [@ocaml.doc
        "Specifies whether user name case sensitivity will be applied for all users in the user \
         pool through Amazon Cognito APIs. For most use cases, set case sensitivity to [False] \
         (case insensitive) as a best practice. When usernames and email addresses are case \
         insensitive, users can sign in as the same user when they enter a different \
         capitalization of their user name.\n\n\
        \ Valid values include:\n\
        \ \n\
        \   true  Enables case sensitivity for all username input. When this option is set to \
         [true], users must sign in using the exact capitalization of their given username, such \
         as \226\128\156UserName\226\128\157. This is the default value.\n\
        \         \n\
        \           false  Enables case insensitivity for all username input. For example, when \
         this option is set to [false], users can sign in using [username], [USERNAME], or \
         [UserName]. This option also enables both [preferred_username] and [email] alias to be \
         case insensitive, in addition to the [username] attribute.\n\
        \                  \n\
        \                    "]
}
[@@ocaml.doc "The configuration of a user pool for username case sensitivity.\n"]

type nonrec username_attribute_type = PHONE_NUMBER [@ocaml.doc ""] | EMAIL [@ocaml.doc ""]
[@@ocaml.doc ""]

type nonrec username_attributes_list_type = username_attribute_type list [@@ocaml.doc ""]

type nonrec alias_attribute_type =
  | PHONE_NUMBER [@ocaml.doc ""]
  | EMAIL [@ocaml.doc ""]
  | PREFERRED_USERNAME [@ocaml.doc ""]
[@@ocaml.doc ""]

type nonrec alias_attributes_list_type = alias_attribute_type list [@@ocaml.doc ""]

type nonrec string_attribute_constraints_type = {
  min_length : string_type option; [@ocaml.doc "The minimum length of a string attribute value.\n"]
  max_length : string_type option;
      [@ocaml.doc
        "The maximum length of a string attribute value. Must be a number less than or equal to \
         [2^1023], represented as a string with a length of 131072 characters or fewer.\n"]
}
[@@ocaml.doc
  "The minimum and maximum length values of an attribute that is of the string type, for example \
   [custom:department].\n"]

type nonrec number_attribute_constraints_type = {
  min_value : string_type option;
      [@ocaml.doc "The minimum value of an attribute that is of the number data type.\n"]
  max_value : string_type option;
      [@ocaml.doc
        "The maximum length of a number attribute value. Must be a number less than or equal to \
         [2^1023], represented as a string with a length of 131072 characters or fewer.\n"]
}
[@@ocaml.doc
  "The minimum and maximum values of an attribute that is of the number type, for example \
   [custom:age].\n"]

type nonrec attribute_data_type =
  | STRING [@ocaml.doc ""]
  | NUMBER [@ocaml.doc ""]
  | DATETIME [@ocaml.doc ""]
  | BOOLEAN [@ocaml.doc ""]
[@@ocaml.doc ""]

type nonrec custom_attribute_name_type = string [@@ocaml.doc ""]

type nonrec schema_attribute_type = {
  name : custom_attribute_name_type option;
      [@ocaml.doc
        "The name of your user pool attribute. When you create or update a user pool, adding a \
         schema attribute creates a custom or developer-only attribute. When you add an attribute \
         with a [Name] value of [MyAttribute], Amazon Cognito creates the custom attribute \
         [custom:MyAttribute]. When [DeveloperOnlyAttribute] is [true], Amazon Cognito creates \
         your attribute as [dev:MyAttribute]. In an operation that describes a user pool, Amazon \
         Cognito returns this value as [value] for standard attributes, [custom:value] for custom \
         attributes, and [dev:value] for developer-only attributes..\n"]
  attribute_data_type : attribute_data_type option;
      [@ocaml.doc
        "The data format of the values for your attribute. When you choose an [AttributeDataType], \
         Amazon Cognito validates the input against the data type. A custom attribute value in \
         your user's ID token is always a string, for example [\"custom:isMember\" : \"true\"] or \
         [\"custom:YearsAsMember\" :\n\
        \                \"12\"]. \n"]
  developer_only_attribute : boolean_type option;
      [@ocaml.doc
        " You should use \
         {{:https://docs.aws.amazon.com/cognito-user-identity-pools/latest/APIReference/API_UserPoolClientType.html#CognitoUserPools-Type-UserPoolClientType-WriteAttributes}WriteAttributes} \
         in the user pool client to control how attributes can be mutated for new use cases \
         instead of using [DeveloperOnlyAttribute].\n\
        \ \n\
        \   Specifies whether the attribute type is developer only. This attribute can only be \
         modified by an administrator. Users won't be able to modify this attribute using their \
         access token. For example, [DeveloperOnlyAttribute] can be modified using \
         AdminUpdateUserAttributes but can't be updated using UpdateUserAttributes.\n\
        \   "]
  \#mutable : boolean_type option;
      [@ocaml.doc
        "Specifies whether the value of the attribute can be changed.\n\n\
        \ Any user pool attribute whose value you map from an IdP attribute must be mutable, with \
         a parameter value of [true]. Amazon Cognito updates mapped attributes when users sign in \
         to your application through an IdP. If an attribute is immutable, Amazon Cognito throws \
         an error when it attempts to update the attribute. For more information, see \
         {{:https://docs.aws.amazon.com/cognito/latest/developerguide/cognito-user-pools-specifying-attribute-mapping.html}Specifying \
         Identity Provider Attribute Mappings for Your User Pool}.\n\
        \ "]
  required : boolean_type option;
      [@ocaml.doc
        "Specifies whether a user pool attribute is required. If the attribute is required and the \
         user doesn't provide a value, registration or sign-in will fail.\n"]
  number_attribute_constraints : number_attribute_constraints_type option;
      [@ocaml.doc "Specifies the constraints for an attribute of the number type.\n"]
  string_attribute_constraints : string_attribute_constraints_type option;
      [@ocaml.doc "Specifies the constraints for an attribute of the string type.\n"]
}
[@@ocaml.doc
  "A list of the user attributes and their properties in your user pool. The attribute schema \
   contains standard attributes, custom attributes with a [custom:] prefix, and developer \
   attributes with a [dev:] prefix. For more information, see \
   {{:https://docs.aws.amazon.com/cognito/latest/developerguide/user-pool-settings-attributes.html}User \
   pool attributes}.\n\n\
  \ Developer-only [dev:] attributes are a legacy feature of user pools, and are read-only to all \
   app clients. You can create and update developer-only attributes only with IAM-authenticated \
   API operations. Use app client read/write permissions instead.\n\
  \ "]

type nonrec schema_attributes_list_type = schema_attribute_type list [@@ocaml.doc ""]

type nonrec user_pool_type = {
  id : user_pool_id_type option; [@ocaml.doc "The ID of the user pool.\n"]
  name : user_pool_name_type option; [@ocaml.doc "The name of the user pool.\n"]
  policies : user_pool_policy_type option;
      [@ocaml.doc
        "A list of user pool policies. Contains the policy that sets password-complexity \
         requirements.\n"]
  deletion_protection : deletion_protection_type option;
      [@ocaml.doc
        "When active, [DeletionProtection] prevents accidental deletion of your user pool. Before \
         you can delete a user pool that you have protected against deletion, you must deactivate \
         this feature.\n\n\
        \ When you try to delete a protected user pool in a [DeleteUserPool] API request, Amazon \
         Cognito returns an [InvalidParameterException] error. To delete a protected user pool, \
         send a new [DeleteUserPool] request after you deactivate deletion protection in an \
         [UpdateUserPool] API request.\n\
        \ "]
  lambda_config : lambda_config_type option;
      [@ocaml.doc
        "A collection of user pool Lambda triggers. Amazon Cognito invokes triggers at several \
         possible stages of user pool operations. Triggers can modify the outcome of the \
         operations that invoked them.\n"]
  status : status_type option; [@ocaml.doc "This parameter is no longer used.\n"]
  last_modified_date : date_type option;
      [@ocaml.doc
        "The date and time when the item was modified. Amazon Cognito returns this timestamp in \
         UNIX epoch time format. Your SDK might render the output in a human-readable format like \
         ISO 8601 or a Java [Date] object.\n"]
  creation_date : date_type option;
      [@ocaml.doc
        "The date and time when the item was created. Amazon Cognito returns this timestamp in \
         UNIX epoch time format. Your SDK might render the output in a human-readable format like \
         ISO 8601 or a Java [Date] object.\n"]
  schema_attributes : schema_attributes_list_type option;
      [@ocaml.doc
        "A list of the user attributes and their properties in your user pool. The attribute \
         schema contains standard attributes, custom attributes with a [custom:] prefix, and \
         developer attributes with a [dev:] prefix. For more information, see \
         {{:https://docs.aws.amazon.com/cognito/latest/developerguide/user-pool-settings-attributes.html}User \
         pool attributes}.\n\n\
        \ Developer-only attributes are a legacy feature of user pools, and are read-only to all \
         app clients. You can create and update developer-only attributes only with \
         IAM-authenticated API operations. Use app client read/write permissions instead.\n\
        \ "]
  auto_verified_attributes : verified_attributes_list_type option;
      [@ocaml.doc "The attributes that are auto-verified in a user pool.\n"]
  alias_attributes : alias_attributes_list_type option;
      [@ocaml.doc
        "Attributes supported as an alias for this user pool. An alias is an attribute that users \
         can enter as an alternative username. Possible values: {b phone_number}, {b email}, or {b \
         preferred_username}.\n"]
  username_attributes : username_attributes_list_type option;
      [@ocaml.doc
        "Specifies whether a user can use an email address or phone number as a username when they \
         sign up.\n"]
  sms_verification_message : sms_verification_message_type option;
      [@ocaml.doc "This parameter is no longer used.\n"]
  email_verification_message : email_verification_message_type option;
      [@ocaml.doc "This parameter is no longer used.\n"]
  email_verification_subject : email_verification_subject_type option;
      [@ocaml.doc "This parameter is no longer used.\n"]
  verification_message_template : verification_message_template_type option;
      [@ocaml.doc
        "The template for the verification message that your user pool delivers to users who set \
         an email address or phone number attribute.\n"]
  sms_authentication_message : sms_verification_message_type option;
      [@ocaml.doc "The contents of the SMS authentication message.\n"]
  user_attribute_update_settings : user_attribute_update_settings_type option;
      [@ocaml.doc
        "The settings for updates to user attributes. These settings include the property \
         [AttributesRequireVerificationBeforeUpdate], a user-pool setting that tells Amazon \
         Cognito how to handle changes to the value of your users' email address and phone number \
         attributes. For more information, see \
         {{:https://docs.aws.amazon.com/cognito/latest/developerguide/user-pool-settings-email-phone-verification.html#user-pool-settings-verifications-verify-attribute-updates} \
         Verifying updates to email addresses and phone numbers}.\n"]
  mfa_configuration : user_pool_mfa_type option;
      [@ocaml.doc
        "Can be one of the following values:\n\n\
        \ {ul\n\
        \       {-   [OFF] - MFA tokens aren't required and can't be specified during user \
         registration.\n\
        \           \n\
        \            }\n\
        \       {-   [ON] - MFA tokens are required for all user registrations. You can only \
         specify required when you're initially creating a user pool.\n\
        \           \n\
        \            }\n\
        \       {-   [OPTIONAL] - Users have the option when registering to create an MFA token.\n\
        \           \n\
        \            }\n\
        \       }\n\
        \  "]
  device_configuration : device_configuration_type option;
      [@ocaml.doc
        "The device-remembering configuration for a user pool. A null value indicates that you \
         have deactivated device remembering in your user pool.\n\n\
        \  When you provide a value for any [DeviceConfiguration] field, you activate the Amazon \
         Cognito device-remembering feature.\n\
        \  \n\
        \   "]
  estimated_number_of_users : integer_type option;
      [@ocaml.doc "A number estimating the size of the user pool.\n"]
  email_configuration : email_configuration_type option;
      [@ocaml.doc
        "The email configuration of your user pool. The email configuration type sets your \
         preferred sending method, Amazon Web Services Region, and sender for messages from your \
         user pool.\n"]
  sms_configuration : sms_configuration_type option;
      [@ocaml.doc
        "User pool configuration for delivery of SMS messages with Amazon Simple Notification \
         Service. To send SMS messages with Amazon SNS in the Amazon Web Services Region that you \
         want, the Amazon Cognito user pool uses an Identity and Access Management (IAM) role in \
         your Amazon Web Services account.\n"]
  user_pool_tags : user_pool_tags_type option;
      [@ocaml.doc
        "The tags that are assigned to the user pool. A tag is a label that you can apply to user \
         pools to categorize and manage them in different ways, such as by purpose, owner, \
         environment, or other criteria.\n"]
  sms_configuration_failure : string_type option;
      [@ocaml.doc
        "The reason why the SMS configuration can't send the messages to your users.\n\n\
        \ This message might include comma-separated values to describe why your SMS configuration \
         can't send messages to user pool end users.\n\
        \ \n\
        \   InvalidSmsRoleAccessPolicyException  The Identity and Access Management role that \
         Amazon Cognito uses to send SMS messages isn't properly configured. For more information, \
         see \
         {{:https://docs.aws.amazon.com/cognito-user-identity-pools/latest/APIReference/API_SmsConfigurationType.html}SmsConfigurationType}.\n\
        \                                        \n\
        \                                          SNSSandbox  The Amazon Web Services account is \
         in the SNS SMS Sandbox and messages will only reach verified end users. This parameter \
         won\226\128\153t get populated with SNSSandbox if the user creating the user pool \
         doesn\226\128\153t have SNS permissions. To learn how to move your Amazon Web Services \
         account out of the sandbox, see \
         {{:https://docs.aws.amazon.com/sns/latest/dg/sns-sms-sandbox-moving-to-production.html}Moving \
         out of the SMS sandbox}.\n\
        \                                                      \n\
        \                                                        "]
  email_configuration_failure : string_type option;
      [@ocaml.doc
        "Deprecated. Review error codes from API requests with \
         [EventSource:cognito-idp.amazonaws.com] in CloudTrail for information about problems with \
         user pool email configuration.\n"]
  domain : domain_type option;
      [@ocaml.doc "The domain prefix, if the user pool has a domain associated with it.\n"]
  custom_domain : domain_type option;
      [@ocaml.doc
        "A custom domain name that you provide to Amazon Cognito. This parameter applies only if \
         you use a custom domain to host the sign-up and sign-in pages for your application. An \
         example of a custom domain name might be [auth.example.com].\n\n\
        \ For more information about adding a custom domain to your user pool, see \
         {{:https://docs.aws.amazon.com/cognito/latest/developerguide/cognito-user-pools-add-custom-domain.html}Using \
         Your Own Domain for the Hosted UI}.\n\
        \ "]
  admin_create_user_config : admin_create_user_config_type option;
      [@ocaml.doc "The configuration for [AdminCreateUser] requests.\n"]
  user_pool_add_ons : user_pool_add_ons_type option;
      [@ocaml.doc
        "Contains settings for activation of threat protection, including the operating mode and \
         additional authentication types. To log user security information but take no action, set \
         to [AUDIT]. To configure automatic security responses to potentially unwanted traffic to \
         your user pool, set to [ENFORCED].\n\n\
        \ For more information, see \
         {{:https://docs.aws.amazon.com/cognito/latest/developerguide/cognito-user-pool-settings-advanced-security.html}Adding \
         advanced security to a user pool}. To activate this setting, your user pool must be on \
         the \
         {{:https://docs.aws.amazon.com/cognito/latest/developerguide/feature-plans-features-plus.html} \
         Plus tier}.\n\
        \ "]
  username_configuration : username_configuration_type option;
      [@ocaml.doc
        "Case sensitivity of the username input for the selected sign-in option. When case \
         sensitivity is set to [False] (case insensitive), users can sign in with any combination \
         of capital and lowercase letters. For example, [username], [USERNAME], or [UserName], or \
         for email, [email@example.com] or [EMaiL@eXamplE.Com]. For most use cases, set case \
         sensitivity to [False] (case insensitive) as a best practice. When usernames and email \
         addresses are case insensitive, Amazon Cognito treats any variation in case as the same \
         user, and prevents a case variation from being assigned to the same attribute for a \
         different user.\n"]
  arn : arn_type option; [@ocaml.doc "The Amazon Resource Name (ARN) of the user pool.\n"]
  account_recovery_setting : account_recovery_setting_type option;
      [@ocaml.doc
        "The available verified method a user can use to recover their password when they call \
         [ForgotPassword]. You can use this setting to define a preferred method when a user has \
         more than one method available. With this setting, SMS doesn't qualify for a valid \
         password recovery mechanism if the user also has SMS multi-factor authentication (MFA) \
         activated. In the absence of this setting, Amazon Cognito uses the legacy behavior to \
         determine the recovery method where SMS is preferred through email.\n"]
  user_pool_tier : user_pool_tier_type option;
      [@ocaml.doc
        "The user pool \
         {{:https://docs.aws.amazon.com/cognito/latest/developerguide/cognito-sign-in-feature-plans.html}feature \
         plan}, or tier. This parameter determines the eligibility of the user pool for features \
         like managed login, access-token customization, and threat protection. Defaults to \
         [ESSENTIALS].\n"]
  key_configuration : key_configuration_type option;
      [@ocaml.doc "The key configuration for the user pool, including encryption settings.\n"]
  issuer_configuration : issuer_configuration_type option;
      [@ocaml.doc "The issuer configuration for the user pool, including token issuing settings.\n"]
}
[@@ocaml.doc "The configuration of a user pool.\n"]

type nonrec describe_user_pool_response = {
  user_pool : user_pool_type option; [@ocaml.doc "The details of the requested user pool.\n"]
}
[@@ocaml.doc "Represents the response to describe the user pool.\n"]

type nonrec describe_user_pool_request = {
  user_pool_id : user_pool_id_type; [@ocaml.doc "The ID of the user pool you want to describe.\n"]
}
[@@ocaml.doc "Represents the request to describe the user pool.\n"]

type nonrec describe_user_import_job_response = {
  user_import_job : user_import_job_type option;
      [@ocaml.doc
        "The details of the user import job. Includes logging destination, status, and the Amazon \
         S3 pre-signed URL for CSV upload.\n"]
}
[@@ocaml.doc
  "Represents the response from the server to the request to describe the user import job.\n"]

type nonrec describe_user_import_job_request = {
  user_pool_id : user_pool_id_type;
      [@ocaml.doc "The ID of the user pool that's associated with the import job.\n"]
  job_id : user_import_job_id_type;
      [@ocaml.doc "The Id of the user import job that you want to describe.\n"]
}
[@@ocaml.doc "Represents the request to describe the user import job.\n"]

type nonrec describe_terms_response = {
  terms : terms_type option;
      [@ocaml.doc
        "A summary of the requested terms documents. Includes a unique identifier for later \
         changes to the terms documents.\n"]
}
[@@ocaml.doc ""]

type nonrec describe_terms_request = {
  terms_id : terms_id_type;
      [@ocaml.doc "The ID of the terms documents that you want to describe.\n"]
  user_pool_id : user_pool_id_type;
      [@ocaml.doc
        "The ID of the user pool that contains the terms documents that you want to describe.\n"]
}
[@@ocaml.doc ""]

type nonrec describe_risk_configuration_response = {
  risk_configuration : risk_configuration_type;
      [@ocaml.doc "The details of the requested risk configuration.\n"]
}
[@@ocaml.doc ""]

type nonrec describe_risk_configuration_request = {
  user_pool_id : user_pool_id_type;
      [@ocaml.doc
        "The ID of the user pool with the risk configuration that you want to inspect. You can \
         apply default risk configuration at the user pool level and further customize it from \
         user pool defaults at the app-client level. Specify [ClientId] to inspect client-level \
         configuration, or [UserPoolId] to inspect pool-level configuration.\n"]
  client_id : client_id_type option;
      [@ocaml.doc
        "The ID of the app client with the risk configuration that you want to inspect. You can \
         apply default risk configuration at the user pool level and further customize it from \
         user pool defaults at the app-client level. Specify [ClientId] to inspect client-level \
         configuration, or [UserPoolId] to inspect pool-level configuration.\n"]
}
[@@ocaml.doc ""]

type nonrec describe_resource_server_response = {
  resource_server : resource_server_type;
      [@ocaml.doc "The details of the requested resource server.\n"]
}
[@@ocaml.doc ""]

type nonrec describe_resource_server_request = {
  user_pool_id : user_pool_id_type;
      [@ocaml.doc "The ID of the user pool that hosts the resource server.\n"]
  identifier : resource_server_identifier_type;
      [@ocaml.doc
        "A unique resource server identifier for the resource server. The identifier can be an API \
         friendly name like [solar-system-data]. You can also set an API URL like \
         [https://solar-system-data-api.example.com] as your identifier.\n\n\
        \ Amazon Cognito represents scopes in the access token in the format \
         [$resource-server-identifier/$scope]. Longer scope-identifier strings increase the size \
         of your access tokens.\n\
        \ "]
}
[@@ocaml.doc ""]

type nonrec describe_managed_login_branding_by_client_response = {
  managed_login_branding : managed_login_branding_type option;
      [@ocaml.doc "The details of the requested branding style.\n"]
}
[@@ocaml.doc ""]

type nonrec describe_managed_login_branding_by_client_request = {
  user_pool_id : user_pool_id_type;
      [@ocaml.doc
        "The ID of the user pool that contains the app client where you want more information \
         about the managed login branding style.\n"]
  client_id : client_id_type;
      [@ocaml.doc
        "The app client that's assigned to the branding style that you want more information about.\n"]
  return_merged_resources : boolean_type option;
      [@ocaml.doc
        "When [true], returns values for branding options that are unchanged from Amazon Cognito \
         defaults. When [false] or when you omit this parameter, returns only values that you \
         customized in your branding style.\n"]
}
[@@ocaml.doc ""]

type nonrec describe_managed_login_branding_response = {
  managed_login_branding : managed_login_branding_type option;
      [@ocaml.doc "The details of the requested branding style.\n"]
}
[@@ocaml.doc ""]

type nonrec describe_managed_login_branding_request = {
  user_pool_id : user_pool_id_type;
      [@ocaml.doc
        "The ID of the user pool that contains the managed login branding style that you want to \
         get information about.\n"]
  managed_login_branding_id : managed_login_branding_id_type;
      [@ocaml.doc
        "The ID of the managed login branding style that you want to get more information about.\n"]
  return_merged_resources : boolean_type option;
      [@ocaml.doc
        "When [true], returns values for branding options that are unchanged from Amazon Cognito \
         defaults. When [false] or when you omit this parameter, returns only values that you \
         customized in your branding style.\n"]
}
[@@ocaml.doc ""]

type nonrec describe_identity_provider_response = {
  identity_provider : identity_provider_type; [@ocaml.doc "The details of the requested IdP.\n"]
}
[@@ocaml.doc ""]

type nonrec describe_identity_provider_request = {
  user_pool_id : user_pool_id_type;
      [@ocaml.doc "The ID of the user pool that has the IdP that you want to describe..\n"]
  provider_name : provider_name_type; [@ocaml.doc "The name of the IdP that you want to describe.\n"]
}
[@@ocaml.doc ""]

type nonrec delete_web_authn_credential_response = unit [@@ocaml.doc ""]

type nonrec delete_web_authn_credential_request = {
  access_token : token_model_type;
      [@ocaml.doc
        "A valid access token that Amazon Cognito issued to the currently signed-in user. Must \
         include a scope claim for [aws.cognito.signin.user.admin].\n"]
  credential_id : string_type;
      [@ocaml.doc "The unique identifier of the passkey that you want to delete.\n"]
}
[@@ocaml.doc ""]

type nonrec delete_user_pool_replica_response = {
  user_pool_replica : user_pool_replica_type option;
      [@ocaml.doc "Information about the deleted user pool replica.\n"]
}
[@@ocaml.doc ""]

type nonrec delete_user_pool_replica_request = {
  user_pool_id : user_pool_id_type;
      [@ocaml.doc "The ID of the user pool that contains the replica to delete.\n"]
  region_name : region_name_type;
      [@ocaml.doc "The Amazon Web Services Region of the replica to delete.\n"]
}
[@@ocaml.doc ""]

type nonrec delete_user_pool_domain_response = unit [@@ocaml.doc ""]

type nonrec delete_user_pool_domain_request = {
  domain : domain_type;
      [@ocaml.doc
        "The domain that you want to delete. For custom domains, this is the fully-qualified \
         domain name like [auth.example.com]. For Amazon Cognito prefix domains, this is the \
         prefix alone, like [myprefix].\n"]
  user_pool_id : user_pool_id_type;
      [@ocaml.doc "The ID of the user pool where you want to delete the domain.\n"]
}
[@@ocaml.doc ""]

type nonrec delete_user_pool_client_secret_response = unit [@@ocaml.doc ""]

type nonrec delete_user_pool_client_secret_request = {
  user_pool_id : user_pool_id_type;
      [@ocaml.doc "The ID of the user pool that contains the app client.\n"]
  client_id : client_id_type;
      [@ocaml.doc "The ID of the app client from which you want to delete the secret.\n"]
  client_secret_id : client_secret_id_type;
      [@ocaml.doc "The unique identifier of the client secret you want to delete.\n"]
}
[@@ocaml.doc "The request to delete a specific client secret from a user pool app client.\n"]

type nonrec delete_user_pool_client_request = {
  user_pool_id : user_pool_id_type;
      [@ocaml.doc "The ID of the user pool where you want to delete the client.\n"]
  client_id : client_id_type;
      [@ocaml.doc "The ID of the user pool app client that you want to delete.\n"]
}
[@@ocaml.doc "Represents the request to delete a user pool client.\n"]

type nonrec delete_user_pool_request = {
  user_pool_id : user_pool_id_type; [@ocaml.doc "The ID of the user pool that you want to delete.\n"]
}
[@@ocaml.doc "Represents the request to delete a user pool.\n"]

type nonrec delete_user_attributes_response = unit [@@ocaml.doc ""]

type nonrec attribute_name_list_type = attribute_name_type list [@@ocaml.doc ""]

type nonrec delete_user_attributes_request = {
  user_attribute_names : attribute_name_list_type;
      [@ocaml.doc
        "An array of strings representing the user attribute names you want to delete.\n\n\
        \ For custom attributes, you must prepend the [custom:] prefix to the attribute name, for \
         example [custom:department].\n\
        \ "]
  access_token : token_model_type;
      [@ocaml.doc
        "A valid access token that Amazon Cognito issued to the currently signed-in user. Must \
         include a scope claim for [aws.cognito.signin.user.admin].\n"]
}
[@@ocaml.doc "Represents the request to delete user attributes.\n"]

type nonrec delete_user_request = {
  access_token : token_model_type;
      [@ocaml.doc
        "A valid access token that Amazon Cognito issued to the currently signed-in user. Must \
         include a scope claim for [aws.cognito.signin.user.admin].\n"]
}
[@@ocaml.doc "Represents the request to delete a user.\n"]

type nonrec delete_terms_request = {
  terms_id : terms_id_type; [@ocaml.doc "The ID of the terms documents that you want to delete.\n"]
  user_pool_id : user_pool_id_type;
      [@ocaml.doc
        "The ID of the user pool that contains the terms documents that you want to delete.\n"]
}
[@@ocaml.doc ""]

type nonrec delete_resource_server_request = {
  user_pool_id : user_pool_id_type;
      [@ocaml.doc "The ID of the user pool where you want to delete the resource server.\n"]
  identifier : resource_server_identifier_type;
      [@ocaml.doc "The identifier of the resource server that you want to delete.\n"]
}
[@@ocaml.doc ""]

type nonrec delete_managed_login_branding_request = {
  managed_login_branding_id : managed_login_branding_id_type;
      [@ocaml.doc "The ID of the managed login branding style that you want to delete.\n"]
  user_pool_id : user_pool_id_type;
      [@ocaml.doc
        "The ID of the user pool that contains the managed login branding style that you want to \
         delete.\n"]
}
[@@ocaml.doc ""]

type nonrec delete_identity_provider_request = {
  user_pool_id : user_pool_id_type;
      [@ocaml.doc "The ID of the user pool where you want to delete the identity provider.\n"]
  provider_name : provider_name_type; [@ocaml.doc "The name of the IdP that you want to delete.\n"]
}
[@@ocaml.doc ""]

type nonrec delete_group_request = {
  group_name : group_name_type; [@ocaml.doc "The name of the group that you want to delete.\n"]
  user_pool_id : user_pool_id_type;
      [@ocaml.doc "The ID of the user pool where you want to delete the group.\n"]
}
[@@ocaml.doc ""]

type nonrec create_user_pool_replica_response = {
  user_pool_replica : user_pool_replica_type option;
      [@ocaml.doc
        "Information about the created user pool replica, including its status and role.\n"]
}
[@@ocaml.doc ""]

type nonrec create_user_pool_replica_request = {
  user_pool_id : user_pool_id_type; [@ocaml.doc "The ID of the user pool to replicate.\n"]
  region_name : region_name_type;
      [@ocaml.doc
        "The Amazon Web Services Region where you want to create the replica user pool.\n"]
  user_pool_tags : user_pool_tags_type option;
      [@ocaml.doc
        "A map of tags to assign to the replica user pool. Each tag consists of a key and an \
         optional value, both of which you define. You can maintain tags independently on replica \
         user pools.\n"]
}
[@@ocaml.doc ""]

type nonrec create_user_pool_domain_response = {
  managed_login_version : wrapped_integer_type option;
      [@ocaml.doc
        "The version of managed login branding applied your domain. A value of [1] indicates \
         hosted UI (classic) and a version of [2] indicates managed login.\n"]
  cloud_front_domain : domain_type option;
      [@ocaml.doc
        "The fully-qualified domain name (FQDN) of the Amazon CloudFront distribution that hosts \
         your managed login or classic hosted UI pages. Your domain-name authority must have an \
         alias record that points requests for your custom domain to this FQDN. Amazon Cognito \
         returns this value if you set a custom domain with [CustomDomainConfig]. If you set an \
         Amazon Cognito prefix domain, this parameter returns null.\n"]
  routing : routing_type option;
      [@ocaml.doc "The routing configuration that was applied to the user pool domain.\n"]
}
[@@ocaml.doc ""]

type nonrec create_user_pool_domain_request = {
  domain : domain_type;
      [@ocaml.doc
        "The domain string. For custom domains, this is the fully-qualified domain name, such as \
         [auth.example.com]. For prefix domains, this is the prefix alone, such as [myprefix]. A \
         prefix value of [myprefix] for a user pool in the [us-east-1] Region results in a domain \
         of [myprefix.auth.us-east-1.amazoncognito.com].\n"]
  user_pool_id : user_pool_id_type;
      [@ocaml.doc "The ID of the user pool where you want to add a domain.\n"]
  managed_login_version : wrapped_integer_type option;
      [@ocaml.doc
        "The version of managed login branding that you want to apply to your domain. A value of \
         [1] indicates hosted UI (classic) and a version of [2] indicates managed login.\n\n\
        \ Managed login requires that your user pool be configured for any \
         {{:https://docs.aws.amazon.com/cognito/latest/developerguide/cognito-sign-in-feature-plans.html}feature \
         plan} other than [Lite].\n\
        \ "]
  custom_domain_config : custom_domain_config_type option;
      [@ocaml.doc
        "The configuration for a custom domain. Configures your domain with an Certificate Manager \
         certificate in the [us-east-1] Region.\n\n\
        \ Provide this parameter only if you want to use a \
         {{:https://docs.aws.amazon.com/cognito/latest/developerguide/cognito-user-pools-add-custom-domain.html}custom \
         domain} for your user pool. Otherwise, you can omit this parameter and use a \
         {{:https://docs.aws.amazon.com/cognito/latest/developerguide/cognito-user-pools-assign-domain-prefix.html}prefix \
         domain} instead.\n\
        \ \n\
        \  When you create a custom domain, the passkey RP ID defaults to the custom domain. If \
         you had a prefix domain active, this will cause passkey integration for your prefix \
         domain to stop working due to a mismatch in RP ID. To keep the prefix domain passkey \
         integration working, you can explicitly set RP ID to the prefix domain.\n\
        \  "]
  routing : routing_type option;
      [@ocaml.doc
        "The configuration of routing for requests to the domain for replicas of a replicated user \
         pool. The routing configuration is currently only supported for custom domains.\n"]
}
[@@ocaml.doc ""]

type nonrec create_user_pool_client_response = {
  user_pool_client : user_pool_client_type option;
      [@ocaml.doc "The details of the new app client.\n"]
}
[@@ocaml.doc "Represents the response from the server to create a user pool client.\n"]

type nonrec generate_secret = bool [@@ocaml.doc ""]

type nonrec create_user_pool_client_request = {
  user_pool_id : user_pool_id_type;
      [@ocaml.doc "The ID of the user pool where you want to create an app client.\n"]
  client_name : client_name_type;
      [@ocaml.doc "A friendly name for the app client that you want to create.\n"]
  generate_secret : generate_secret option;
      [@ocaml.doc
        "When [true], generates a client secret for the app client. Client secrets are used with \
         server-side and machine-to-machine applications. Client secrets are automatically \
         generated; you can't specify a secret value. For more information, see \
         {{:https://docs.aws.amazon.com/cognito/latest/developerguide/user-pool-settings-client-apps.html#user-pool-settings-client-app-client-types}App \
         client types}.\n"]
  client_secret : client_secret_type option;
      [@ocaml.doc
        "A custom client secret that you want to use for the app client. You cannot specify both \
         GenerateSecret as true and provide a ClientSecret value.\n"]
  refresh_token_validity : refresh_token_validity_type option;
      [@ocaml.doc
        "The refresh token time limit. After this limit expires, your user can't use their refresh \
         token. To specify the time unit for [RefreshTokenValidity] as [seconds], [minutes], \
         [hours], or [days], set a [TokenValidityUnits] value in your API request.\n\n\
        \ For example, when you set [RefreshTokenValidity] as [10] and [TokenValidityUnits] as \
         [days], your user can refresh their session and retrieve new access and ID tokens for 10 \
         days.\n\
        \ \n\
        \  The default time unit for [RefreshTokenValidity] in an API request is days. You can't \
         set [RefreshTokenValidity] to 0. If you do, Amazon Cognito overrides the value with the \
         default value of 30 days. {i Valid range} is displayed below in seconds.\n\
        \  \n\
        \   If you don't specify otherwise in the configuration of your app client, your refresh \
         tokens are valid for 30 days.\n\
        \   "]
  access_token_validity : access_token_validity_type option;
      [@ocaml.doc
        "The access token time limit. After this limit expires, your user can't use their access \
         token. To specify the time unit for [AccessTokenValidity] as [seconds], [minutes], \
         [hours], or [days], set a [TokenValidityUnits] value in your API request.\n\n\
        \ For example, when you set [AccessTokenValidity] to [10] and [TokenValidityUnits] to \
         [hours], your user can authorize access with their access token for 10 hours.\n\
        \ \n\
        \  The default time unit for [AccessTokenValidity] in an API request is hours. {i Valid \
         range} is displayed below in seconds.\n\
        \  \n\
        \   If you don't specify otherwise in the configuration of your app client, your access \
         tokens are valid for one hour.\n\
        \   "]
  id_token_validity : id_token_validity_type option;
      [@ocaml.doc
        "The ID token time limit. After this limit expires, your user can't use their ID token. To \
         specify the time unit for [IdTokenValidity] as [seconds], [minutes], [hours], or [days], \
         set a [TokenValidityUnits] value in your API request.\n\n\
        \ For example, when you set [IdTokenValidity] as [10] and [TokenValidityUnits] as [hours], \
         your user can authenticate their session with their ID token for 10 hours.\n\
        \ \n\
        \  The default time unit for [IdTokenValidity] in an API request is hours. {i Valid range} \
         is displayed below in seconds.\n\
        \  \n\
        \   If you don't specify otherwise in the configuration of your app client, your ID tokens \
         are valid for one hour.\n\
        \   "]
  token_validity_units : token_validity_units_type option;
      [@ocaml.doc
        "The units that validity times are represented in. The default unit for refresh tokens is \
         days, and the default for ID and access tokens are hours.\n"]
  read_attributes : client_permission_list_type option;
      [@ocaml.doc
        "The list of user attributes that you want your app client to have read access to. After \
         your user authenticates in your app, their access token authorizes them to read their own \
         attribute value for any attribute in this list.\n\n\
        \ When you don't specify the [ReadAttributes] for your app client, your app can read the \
         values of [email_verified], [phone_number_verified], and the standard attributes of your \
         user pool. When your user pool app client has read access to these default attributes, \
         [ReadAttributes] doesn't return any information. Amazon Cognito only populates \
         [ReadAttributes] in the API response if you have specified your own custom set of read \
         attributes.\n\
        \ "]
  write_attributes : client_permission_list_type option;
      [@ocaml.doc
        "The list of user attributes that you want your app client to have write access to. After \
         your user authenticates in your app, their access token authorizes them to set or modify \
         their own attribute value for any attribute in this list.\n\n\
        \ When you don't specify the [WriteAttributes] for your app client, your app can write the \
         values of the Standard attributes of your user pool. When your user pool has write access \
         to these default attributes, [WriteAttributes] doesn't return any information. Amazon \
         Cognito only populates [WriteAttributes] in the API response if you have specified your \
         own custom set of write attributes.\n\
        \ \n\
        \  If your app client allows users to sign in through an IdP, this array must include all \
         attributes that you have mapped to IdP attributes. Amazon Cognito updates mapped \
         attributes when users sign in to your application through an IdP. If your app client does \
         not have write access to a mapped attribute, Amazon Cognito throws an error when it tries \
         to update the attribute. For more information, see \
         {{:https://docs.aws.amazon.com/cognito/latest/developerguide/cognito-user-pools-specifying-attribute-mapping.html}Specifying \
         IdP Attribute Mappings for Your user pool}.\n\
        \  "]
  explicit_auth_flows : explicit_auth_flows_list_type option;
      [@ocaml.doc
        "The \
         {{:https://docs.aws.amazon.com/cognito/latest/developerguide/amazon-cognito-user-pools-authentication-flow-methods.html}authentication \
         flows} that you want your user pool client to support. For each app client in your user \
         pool, you can sign in your users with any combination of one or more flows, including \
         with a user name and Secure Remote Password (SRP), a user name and password, or a custom \
         authentication process that you define with Lambda functions.\n\n\
        \  If you don't specify a value for [ExplicitAuthFlows], your app client supports \
         [ALLOW_REFRESH_TOKEN_AUTH], [ALLOW_USER_SRP_AUTH], and [ALLOW_CUSTOM_AUTH]. \n\
        \  \n\
        \    The values for authentication flow options include the following.\n\
        \    \n\
        \     {ul\n\
        \           {-   [ALLOW_USER_AUTH]: Enable selection-based sign-in with [USER_AUTH]. This \
         setting covers username-password, secure remote password (SRP), passwordless, and passkey \
         authentication. This authentiation flow can do username-password and SRP authentication \
         without other [ExplicitAuthFlows] permitting them. For example users can complete an SRP \
         challenge through [USER_AUTH] without the flow [USER_SRP_AUTH] being active for the app \
         client. This flow doesn't include [CUSTOM_AUTH]. \n\
        \               \n\
        \                To activate this setting, your user pool must be in the \
         {{:https://docs.aws.amazon.com/cognito/latest/developerguide/feature-plans-features-essentials.html} \
         Essentials tier} or higher.\n\
        \                \n\
        \                 }\n\
        \           {-   [ALLOW_ADMIN_USER_PASSWORD_AUTH]: Enable admin based user password \
         authentication flow [ADMIN_USER_PASSWORD_AUTH]. This setting replaces the \
         [ADMIN_NO_SRP_AUTH] setting. With this authentication flow, your app passes a user name \
         and password to Amazon Cognito in the request, instead of using the Secure Remote \
         Password (SRP) protocol to securely transmit the password.\n\
        \               \n\
        \                }\n\
        \           {-   [ALLOW_CUSTOM_AUTH]: Enable Lambda trigger based authentication.\n\
        \               \n\
        \                }\n\
        \           {-   [ALLOW_USER_PASSWORD_AUTH]: Enable user password-based authentication. In \
         this flow, Amazon Cognito receives the password in the request instead of using the SRP \
         protocol to verify passwords.\n\
        \               \n\
        \                }\n\
        \           {-   [ALLOW_USER_SRP_AUTH]: Enable SRP-based authentication.\n\
        \               \n\
        \                }\n\
        \           {-   [ALLOW_REFRESH_TOKEN_AUTH]: Enable authflow to refresh tokens.\n\
        \               \n\
        \                }\n\
        \           }\n\
        \   In some environments, you will see the values [ADMIN_NO_SRP_AUTH], \
         [CUSTOM_AUTH_FLOW_ONLY], or [USER_PASSWORD_AUTH]. You can't assign these legacy \
         [ExplicitAuthFlows] values to user pool clients at the same time as values that begin \
         with [ALLOW_], like [ALLOW_USER_SRP_AUTH].\n\
        \   "]
  supported_identity_providers : supported_identity_providers_list_type option;
      [@ocaml.doc
        "A list of provider names for the identity providers (IdPs) that are supported on this \
         client. The following are supported: [COGNITO], [Facebook], [Google], [SignInWithApple], \
         and [LoginWithAmazon]. You can also specify the names that you configured for the SAML \
         and OIDC IdPs in your user pool, for example [MySAMLIdP] or [MyOIDCIdP].\n\n\
        \ This parameter sets the IdPs that \
         {{:https://docs.aws.amazon.com/cognito/latest/developerguide/cognito-user-pools-managed-login.html}managed \
         login} will display on the login page for your app client. The removal of [COGNITO] from \
         this list doesn't prevent authentication operations for local users with the user pools \
         API in an Amazon Web Services SDK. The only way to prevent SDK-based authentication is to \
         block access with a \
         {{:https://docs.aws.amazon.com/cognito/latest/developerguide/user-pool-waf.html}WAF \
         rule}. \n\
        \ "]
  callback_ur_ls : callback_ur_ls_list_type option;
      [@ocaml.doc
        "A list of allowed redirect, or callback, URLs for managed login authentication. These \
         URLs are the paths where you want to send your users' browsers after they complete \
         authentication with managed login or a third-party IdP. Typically, callback URLs are the \
         home of an application that uses OAuth or OIDC libraries to process authentication \
         outcomes.\n\n\
        \ A redirect URI must meet the following requirements:\n\
        \ \n\
        \  {ul\n\
        \        {-  Be an absolute URI.\n\
        \            \n\
        \             }\n\
        \        {-  Be registered with the authorization server. Amazon Cognito doesn't accept \
         authorization requests with [redirect_uri] values that aren't in the list of \
         [CallbackURLs] that you provide in this parameter.\n\
        \            \n\
        \             }\n\
        \        {-  Not include a fragment component.\n\
        \            \n\
        \             }\n\
        \        }\n\
        \   See {{:https://tools.ietf.org/html/rfc6749#section-3.1.2}OAuth 2.0 - Redirection \
         Endpoint}.\n\
        \   \n\
        \    Amazon Cognito requires HTTPS over HTTP except for callback URLs to \
         [http://localhost], [http://127.0.0.1] and [http://\\[::1\\]]. These callback URLs are \
         for testing purposes only. You can specify custom TCP ports for your callback URLs.\n\
        \    \n\
        \     App callback URLs such as [myapp://example] are also supported.\n\
        \     "]
  logout_ur_ls : logout_ur_ls_list_type option;
      [@ocaml.doc
        "A list of allowed logout URLs for managed login authentication. When you pass \
         [logout_uri] and [client_id] parameters to [/logout], Amazon Cognito signs out your user \
         and redirects them to the logout URL. This parameter describes the URLs that you want to \
         be the permitted targets of [logout_uri]. A typical use of these URLs is when a user \
         selects \"Sign out\" and you redirect them to your public homepage. For more information, \
         see \
         {{:https://docs.aws.amazon.com/cognito/latest/developerguide/logout-endpoint.html}Logout \
         endpoint}.\n"]
  default_redirect_ur_i : redirect_url_type option;
      [@ocaml.doc
        "The default redirect URI. In app clients with one assigned IdP, replaces [redirect_uri] \
         in authentication requests. Must be in the [CallbackURLs] list.\n"]
  allowed_o_auth_flows : o_auth_flows_type option;
      [@ocaml.doc
        "The OAuth grant types that you want your app client to generate for clients in managed \
         login authentication. To create an app client that generates client credentials grants, \
         you must add [client_credentials] as the only allowed OAuth flow.\n\n\
        \  code  Use a code grant flow, which provides an authorization code as the response. This \
         code can be exchanged for access tokens with the [/oauth2/token] endpoint.\n\
        \        \n\
        \          implicit  Issue the access token, and the ID token when scopes like [openid] \
         and [profile] are requested, directly to your user.\n\
        \                    \n\
        \                      client_credentials  Issue the access token from the [/oauth2/token] \
         endpoint directly to a non-person user, authorized by a combination of the client ID and \
         client secret.\n\
        \                                          \n\
        \                                            "]
  allowed_o_auth_scopes : scope_list_type option;
      [@ocaml.doc
        "The OAuth, OpenID Connect (OIDC), and custom scopes that you want to permit your app \
         client to authorize access with. Scopes govern access control to user pool self-service \
         API operations, user data from the [userInfo] endpoint, and third-party APIs. Scope \
         values include [phone], [email], [openid], and [profile]. The \
         [aws.cognito.signin.user.admin] scope authorizes user self-service operations. Custom \
         scopes with resource servers authorize access to external APIs.\n"]
  allowed_o_auth_flows_user_pool_client : boolean_type option;
      [@ocaml.doc
        "Set to [true] to use OAuth 2.0 authorization server features in your app client.\n\n\
        \ This parameter must have a value of [true] before you can configure the following \
         features in your app client.\n\
        \ \n\
        \  {ul\n\
        \        {-   [CallBackURLs]: Callback URLs.\n\
        \            \n\
        \             }\n\
        \        {-   [LogoutURLs]: Sign-out redirect URLs.\n\
        \            \n\
        \             }\n\
        \        {-   [AllowedOAuthScopes]: OAuth 2.0 scopes.\n\
        \            \n\
        \             }\n\
        \        {-   [AllowedOAuthFlows]: Support for authorization code, implicit, and client \
         credentials OAuth 2.0 grants.\n\
        \            \n\
        \             }\n\
        \        }\n\
        \   To use authorization server features, configure one of these features in the Amazon \
         Cognito console or set [AllowedOAuthFlowsUserPoolClient] to [true] in a \
         [CreateUserPoolClient] or [UpdateUserPoolClient] API request. If you don't set a value \
         for [AllowedOAuthFlowsUserPoolClient] in a request with the CLI or SDKs, it defaults to \
         [false]. When [false], only SDK-based API sign-in is permitted.\n\
        \   "]
  analytics_configuration : analytics_configuration_type option;
      [@ocaml.doc
        "The user pool analytics configuration for collecting metrics and sending them to your \
         Amazon Pinpoint campaign.\n\n\
        \ In Amazon Web Services Regions where Amazon Pinpoint isn't available, user pools might \
         not have access to analytics or might be configurable with campaigns in the US East (N. \
         Virginia) Region. For more information, see \
         {{:https://docs.aws.amazon.com/cognito/latest/developerguide/cognito-user-pools-pinpoint-integration.html}Using \
         Amazon Pinpoint analytics}.\n\
        \ "]
  prevent_user_existence_errors : prevent_user_existence_error_types option;
      [@ocaml.doc
        "When [ENABLED], suppresses messages that might indicate a valid user exists when someone \
         attempts sign-in. This parameters sets your preference for the errors and responses that \
         you want Amazon Cognito APIs to return during authentication, account confirmation, and \
         password recovery when the user doesn't exist in the user pool. When set to [ENABLED] and \
         the user doesn't exist, authentication returns an error indicating either the username or \
         password was incorrect. Account confirmation and password recovery return a response \
         indicating a code was sent to a simulated destination. When set to [LEGACY], those APIs \
         return a [UserNotFoundException] exception if the user doesn't exist in the user pool.\n\n\
        \ Defaults to [LEGACY].\n\
        \ "]
  enable_token_revocation : wrapped_boolean_type option;
      [@ocaml.doc
        "Activates or deactivates \
         {{:https://docs.aws.amazon.com/cognito/latest/developerguide/token-revocation.html}token \
         revocation} in the target app client.\n\n\
        \ If you don't include this parameter, token revocation is automatically activated for the \
         new user pool client.\n\
        \ "]
  enable_propagate_additional_user_context_data : wrapped_boolean_type option;
      [@ocaml.doc
        "When [true], your application can include additional [UserContextData] in authentication \
         requests. This data includes the IP address, and contributes to analysis by threat \
         protection features. For more information about propagation of user context data, see \
         {{:https://docs.aws.amazon.com/cognito/latest/developerguide/cognito-user-pool-settings-adaptive-authentication.html#user-pool-settings-adaptive-authentication-device-fingerprint}Adding \
         session data to API requests}. If you don\226\128\153t include this parameter, you can't \
         send the source IP address to Amazon Cognito threat protection features. You can only \
         activate [EnablePropagateAdditionalUserContextData] in an app client that has a client \
         secret.\n"]
  auth_session_validity : auth_session_validity_type option;
      [@ocaml.doc
        "Amazon Cognito creates a session token for each API request in an authentication flow. \
         [AuthSessionValidity] is the duration, in minutes, of that session token. Your user pool \
         native user must respond to each authentication challenge before the session expires.\n"]
  refresh_token_rotation : refresh_token_rotation_type option;
      [@ocaml.doc
        "The configuration of your app client for refresh token rotation. When enabled, your app \
         client issues new ID, access, and refresh tokens when users renew their sessions with \
         refresh tokens. When disabled, token refresh issues only ID and access tokens.\n"]
}
[@@ocaml.doc "Represents the request to create a user pool client.\n"]

type nonrec create_user_pool_response = {
  user_pool : user_pool_type option; [@ocaml.doc "The details of the created user pool.\n"]
}
[@@ocaml.doc "Represents the response from the server for the request to create a user pool.\n"]

type nonrec create_user_pool_request = {
  pool_name : user_pool_name_type; [@ocaml.doc "A friendly name for your user pool.\n"]
  policies : user_pool_policy_type option;
      [@ocaml.doc
        "The password policy and sign-in policy in the user pool. The password policy sets options \
         like password complexity requirements and password history. The sign-in policy sets the \
         options available to applications in \
         {{:https://docs.aws.amazon.com/cognito/latest/developerguide/authentication-flows-selection-sdk.html#authentication-flows-selection-choice}choice-based \
         authentication}.\n"]
  deletion_protection : deletion_protection_type option;
      [@ocaml.doc
        "When active, [DeletionProtection] prevents accidental deletion of your user pool. Before \
         you can delete a user pool that you have protected against deletion, you must deactivate \
         this feature.\n\n\
        \ When you try to delete a protected user pool in a [DeleteUserPool] API request, Amazon \
         Cognito returns an [InvalidParameterException] error. To delete a protected user pool, \
         send a new [DeleteUserPool] request after you deactivate deletion protection in an \
         [UpdateUserPool] API request.\n\
        \ "]
  lambda_config : lambda_config_type option;
      [@ocaml.doc
        "A collection of user pool Lambda triggers. Amazon Cognito invokes triggers at several \
         possible stages of authentication operations. Triggers can modify the outcome of the \
         operations that invoked them.\n"]
  auto_verified_attributes : verified_attributes_list_type option;
      [@ocaml.doc
        "The attributes that you want your user pool to automatically verify. For more \
         information, see \
         {{:https://docs.aws.amazon.com/cognito/latest/developerguide/signing-up-users-in-your-app.html#allowing-users-to-sign-up-and-confirm-themselves}Verifying \
         contact information at sign-up}.\n"]
  alias_attributes : alias_attributes_list_type option;
      [@ocaml.doc
        "Attributes supported as an alias for this user pool. For more information about alias \
         attributes, see \
         {{:https://docs.aws.amazon.com/cognito/latest/developerguide/user-pool-settings-attributes.html#user-pool-settings-aliases}Customizing \
         sign-in attributes}.\n"]
  username_attributes : username_attributes_list_type option;
      [@ocaml.doc
        "Specifies whether a user can use an email address or phone number as a username when they \
         sign up. For more information, see \
         {{:https://docs.aws.amazon.com/cognito/latest/developerguide/user-pool-settings-attributes.html#user-pool-settings-aliases}Customizing \
         sign-in attributes}.\n"]
  sms_verification_message : sms_verification_message_type option;
      [@ocaml.doc "This parameter is no longer used.\n"]
  email_verification_message : email_verification_message_type option;
      [@ocaml.doc "This parameter is no longer used.\n"]
  email_verification_subject : email_verification_subject_type option;
      [@ocaml.doc "This parameter is no longer used.\n"]
  verification_message_template : verification_message_template_type option;
      [@ocaml.doc
        "The template for the verification message that your user pool delivers to users who set \
         an email address or phone number attribute.\n\n\
        \ Set the email message type that corresponds to your [DefaultEmailOption] selection. For \
         [CONFIRM_WITH_LINK], specify an [EmailMessageByLink] and leave [EmailMessage] blank. For \
         [CONFIRM_WITH_CODE], specify an [EmailMessage] and leave [EmailMessageByLink] blank. When \
         you supply both parameters with either choice, Amazon Cognito returns an error.\n\
        \ "]
  sms_authentication_message : sms_verification_message_type option;
      [@ocaml.doc
        "The contents of the SMS message that your user pool sends to users in SMS OTP and MFA \
         authentication.\n"]
  mfa_configuration : user_pool_mfa_type option;
      [@ocaml.doc
        "Sets multi-factor authentication (MFA) to be on, off, or optional. When [ON], all users \
         must set up MFA before they can sign in. When [OPTIONAL], your application must make a \
         client-side determination of whether a user wants to register an MFA device. For user \
         pools with adaptive authentication with threat protection, choose [OPTIONAL].\n\n\
        \ When [MfaConfiguration] is [OPTIONAL], managed login doesn't automatically prompt users \
         to set up MFA. Amazon Cognito generates MFA prompts in API responses and in managed login \
         for users who have chosen and configured a preferred MFA factor.\n\
        \ "]
  user_attribute_update_settings : user_attribute_update_settings_type option;
      [@ocaml.doc
        "The settings for updates to user attributes. These settings include the property \
         [AttributesRequireVerificationBeforeUpdate], a user-pool setting that tells Amazon \
         Cognito how to handle changes to the value of your users' email address and phone number \
         attributes. For more information, see \
         {{:https://docs.aws.amazon.com/cognito/latest/developerguide/user-pool-settings-email-phone-verification.html#user-pool-settings-verifications-verify-attribute-updates} \
         Verifying updates to email addresses and phone numbers}.\n"]
  device_configuration : device_configuration_type option;
      [@ocaml.doc
        "The device-remembering configuration for a user pool. Device remembering or device \
         tracking is a \"Remember me on this device\" option for user pools that perform \
         authentication with the device key of a trusted device in the back end, instead of a \
         user-provided MFA code. For more information about device authentication, see \
         {{:https://docs.aws.amazon.com/cognito/latest/developerguide/amazon-cognito-user-pools-device-tracking.html}Working \
         with user devices in your user pool}. A null value indicates that you have deactivated \
         device remembering in your user pool.\n\n\
        \  When you provide a value for any [DeviceConfiguration] field, you activate the Amazon \
         Cognito device-remembering feature. For more information, see \
         {{:https://docs.aws.amazon.com/cognito/latest/developerguide/amazon-cognito-user-pools-device-tracking.html}Working \
         with devices}.\n\
        \  \n\
        \   "]
  email_configuration : email_configuration_type option;
      [@ocaml.doc
        "The email configuration of your user pool. The email configuration type sets your \
         preferred sending method, Amazon Web Services Region, and sender for messages from your \
         user pool.\n"]
  sms_configuration : sms_configuration_type option;
      [@ocaml.doc
        "The settings for your Amazon Cognito user pool to send SMS messages with Amazon Simple \
         Notification Service. To send SMS messages with Amazon SNS in the Amazon Web Services \
         Region that you want, the Amazon Cognito user pool uses an Identity and Access Management \
         (IAM) role in your Amazon Web Services account. For more information see \
         {{:https://docs.aws.amazon.com/cognito/latest/developerguide/user-pool-sms-settings.html}SMS \
         message settings}.\n"]
  user_pool_tags : user_pool_tags_type option;
      [@ocaml.doc
        "The tag keys and values to assign to the user pool. A tag is a label that you can use to \
         categorize and manage user pools in different ways, such as by purpose, owner, \
         environment, or other criteria.\n"]
  admin_create_user_config : admin_create_user_config_type option;
      [@ocaml.doc
        "The configuration for administrative creation of users. Includes the template for the \
         invitation message for new users, the duration of temporary passwords, and permitting \
         self-service sign-up.\n"]
  schema : schema_attributes_list_type option;
      [@ocaml.doc
        "An array of attributes for the new user pool. You can add custom attributes and modify \
         the properties of default attributes. The specifications in this parameter set the \
         required attributes in your user pool. For more information, see \
         {{:https://docs.aws.amazon.com/cognito/latest/developerguide/user-pool-settings-attributes.html}Working \
         with user attributes}.\n"]
  user_pool_add_ons : user_pool_add_ons_type option;
      [@ocaml.doc
        "Contains settings for activation of threat protection, including the operating mode and \
         additional authentication types. To log user security information but take no action, set \
         to [AUDIT]. To configure automatic security responses to potentially unwanted traffic to \
         your user pool, set to [ENFORCED].\n\n\
        \ For more information, see \
         {{:https://docs.aws.amazon.com/cognito/latest/developerguide/cognito-user-pool-settings-advanced-security.html}Adding \
         advanced security to a user pool}. To activate this setting, your user pool must be on \
         the \
         {{:https://docs.aws.amazon.com/cognito/latest/developerguide/feature-plans-features-plus.html} \
         Plus tier}.\n\
        \ "]
  username_configuration : username_configuration_type option;
      [@ocaml.doc
        "Sets the case sensitivity option for sign-in usernames. When [CaseSensitive] is [false] \
         (case insensitive), users can sign in with any combination of capital and lowercase \
         letters. For example, [username], [USERNAME], or [UserName], or for email, \
         [email@example.com] or [EMaiL@eXamplE.Com]. For most use cases, set case sensitivity to \
         [false] as a best practice. When usernames and email addresses are case insensitive, \
         Amazon Cognito treats any variation in case as the same user, and prevents a case \
         variation from being assigned to the same attribute for a different user.\n\n\
        \ When [CaseSensitive] is [true] (case sensitive), Amazon Cognito interprets [USERNAME] \
         and [UserName] as distinct users.\n\
        \ \n\
        \  This configuration is immutable after you set it.\n\
        \  "]
  account_recovery_setting : account_recovery_setting_type option;
      [@ocaml.doc
        "The available verified method a user can use to recover their password when they call \
         [ForgotPassword]. You can use this setting to define a preferred method when a user has \
         more than one method available. With this setting, SMS doesn't qualify for a valid \
         password recovery mechanism if the user also has SMS multi-factor authentication (MFA) \
         activated. Email MFA is also disqualifying for account recovery with email. In the \
         absence of this setting, Amazon Cognito uses the legacy behavior to determine the \
         recovery method where SMS is preferred over email.\n\n\
        \ As a best practice, configure both [verified_email] and [verified_phone_number], with \
         one having a higher priority than the other.\n\
        \ "]
  user_pool_tier : user_pool_tier_type option;
      [@ocaml.doc
        "The user pool \
         {{:https://docs.aws.amazon.com/cognito/latest/developerguide/cognito-sign-in-feature-plans.html}feature \
         plan}, or tier. This parameter determines the eligibility of the user pool for features \
         like managed login, access-token customization, and threat protection. Defaults to \
         [ESSENTIALS].\n"]
  key_configuration : key_configuration_type option;
      [@ocaml.doc
        "The key configuration for the user pool. Specifies the key type and KMS key ARN for \
         encryption.\n"]
  issuer_configuration : issuer_configuration_type option;
      [@ocaml.doc
        "The issuer configuration for the user pool. Specifies the issuer type for token generation.\n"]
}
[@@ocaml.doc "Represents the request to create a user pool.\n"]

type nonrec create_user_import_job_response = {
  user_import_job : user_import_job_type option;
      [@ocaml.doc
        "The details of the user import job. Includes logging destination, status, and the Amazon \
         S3 pre-signed URL for CSV upload.\n"]
}
[@@ocaml.doc
  "Represents the response from the server to the request to create the user import job.\n"]

type nonrec create_user_import_job_request = {
  job_name : user_import_job_name_type; [@ocaml.doc "A friendly name for the user import job.\n"]
  user_pool_id : user_pool_id_type;
      [@ocaml.doc "The ID of the user pool that you want to import users into.\n"]
  cloud_watch_logs_role_arn : arn_type;
      [@ocaml.doc
        "You must specify an IAM role that has permission to log import-job results to Amazon \
         CloudWatch Logs. This parameter is the ARN of that role.\n"]
}
[@@ocaml.doc "Represents the request to create the user import job.\n"]

type nonrec create_terms_response = {
  terms : terms_type option;
      [@ocaml.doc
        "A summary of your terms documents. Includes a unique identifier for later changes to the \
         terms documents.\n"]
}
[@@ocaml.doc ""]

type nonrec create_terms_request = {
  user_pool_id : user_pool_id_type;
      [@ocaml.doc "The ID of the user pool where you want to create terms documents.\n"]
  client_id : client_id_type;
      [@ocaml.doc
        "The ID of the app client where you want to create terms documents. Must be an app client \
         in the requested user pool.\n"]
  terms_name : terms_name_type;
      [@ocaml.doc
        "A friendly name for the document that you want to create in the current request. Must \
         begin with [terms-of-use] or [privacy-policy] as identification of the document type. \
         Provide URLs for both [terms-of-use] and [privacy-policy] in separate requests.\n"]
  terms_source : terms_source_type;
      [@ocaml.doc
        "This parameter is reserved for future use and currently accepts only one value.\n"]
  enforcement : terms_enforcement_type;
      [@ocaml.doc
        "This parameter is reserved for future use and currently accepts only one value.\n"]
  links : links_type option;
      [@ocaml.doc
        "A map of URLs to languages. For each localized language that will view the requested \
         [TermsName], assign a URL. A selection of [cognito:default] displays for all languages \
         that don't have a language-specific URL.\n\n\
        \ For example, [\"cognito:default\": \"https://terms.example.com\", \"cognito:spanish\":\n\
        \                \"https://terms.example.com/es\"].\n\
        \ "]
}
[@@ocaml.doc ""]

type nonrec create_resource_server_response = {
  resource_server : resource_server_type; [@ocaml.doc "The details of the new resource server.\n"]
}
[@@ocaml.doc ""]

type nonrec create_resource_server_request = {
  user_pool_id : user_pool_id_type;
      [@ocaml.doc "The ID of the user pool where you want to create a resource server.\n"]
  identifier : resource_server_identifier_type;
      [@ocaml.doc
        "A unique resource server identifier for the resource server. The identifier can be an API \
         friendly name like [solar-system-data]. You can also set an API URL like \
         [https://solar-system-data-api.example.com] as your identifier.\n\n\
        \ Amazon Cognito represents scopes in the access token in the format \
         [$resource-server-identifier/$scope]. Longer scope-identifier strings increase the size \
         of your access tokens.\n\
        \ "]
  name : resource_server_name_type; [@ocaml.doc "A friendly name for the resource server.\n"]
  scopes : resource_server_scope_list_type option;
      [@ocaml.doc
        "A list of custom scopes. Each scope is a key-value map with the keys [ScopeName] and \
         [ScopeDescription]. The name of a custom scope is a combination of [ScopeName] and the \
         resource server [Name] in this request, for example [MyResourceServerName/MyScopeName].\n"]
}
[@@ocaml.doc ""]

type nonrec managed_login_branding_exists_exception = {
  message : message_type option; [@ocaml.doc ""]
}
[@@ocaml.doc
  "This exception is thrown when you attempt to apply a managed login branding style to an app \
   client that already has an assigned style.\n"]

type nonrec create_managed_login_branding_response = {
  managed_login_branding : managed_login_branding_type option;
      [@ocaml.doc "The details of the branding style that you created.\n"]
}
[@@ocaml.doc ""]

type nonrec create_managed_login_branding_request = {
  user_pool_id : user_pool_id_type;
      [@ocaml.doc "The ID of the user pool where you want to create a new branding style.\n"]
  client_id : client_id_type;
      [@ocaml.doc
        "The app client that you want to create the branding style for. Each style is linked to an \
         app client until you delete it.\n"]
  use_cognito_provided_values : boolean_type option;
      [@ocaml.doc
        "When true, applies the default branding style options. These default options are managed \
         by Amazon Cognito. You can modify them later in the branding editor.\n\n\
        \ When you specify [true] for this option, you must also omit values for [Settings] and \
         [Assets] in the request.\n\
        \ "]
  settings : document option;
      [@ocaml.doc
        "A JSON file, encoded as a [Document] type, with the the settings that you want to apply \
         to your style.\n\n\
        \ The following components are not currently implemented and reserved for future use:\n\
        \ \n\
        \  {ul\n\
        \        {-   [signUp] \n\
        \            \n\
        \             }\n\
        \        {-   [instructions] \n\
        \            \n\
        \             }\n\
        \        {-   [sessionTimerDisplay] \n\
        \            \n\
        \             }\n\
        \        {-   [languageSelector] (for localization, see \
         {{:https://docs.aws.amazon.com/cognito/latest/developerguide/cognito-user-pools-managed-login.html#managed-login-localization}Managed \
         login localization)} \n\
        \            \n\
        \             }\n\
        \        }\n\
        \  "]
  assets : asset_list_type option;
      [@ocaml.doc
        "An array of image files that you want to apply to functions like backgrounds, logos, and \
         icons. Each object must also indicate whether it is for dark mode, light mode, or \
         browser-adaptive mode.\n"]
}
[@@ocaml.doc ""]

type nonrec duplicate_provider_exception = { message : message_type option [@ocaml.doc ""] }
[@@ocaml.doc "This exception is thrown when the provider is already supported by the user pool.\n"]

type nonrec create_identity_provider_response = {
  identity_provider : identity_provider_type; [@ocaml.doc "The details of the new user pool IdP.\n"]
}
[@@ocaml.doc ""]

type nonrec provider_name_type_v2 = string [@@ocaml.doc ""]

type nonrec create_identity_provider_request = {
  user_pool_id : user_pool_id_type;
      [@ocaml.doc "The Id of the user pool where you want to create an IdP.\n"]
  provider_name : provider_name_type_v2;
      [@ocaml.doc
        "The name that you want to assign to the IdP. You can pass the identity provider name in \
         the [identity_provider] query parameter of requests to the \
         {{:https://docs.aws.amazon.com/cognito/latest/developerguide/authorization-endpoint.html}Authorize \
         endpoint} to silently redirect to sign-in with the associated IdP.\n"]
  provider_type : identity_provider_type_type;
      [@ocaml.doc
        "The type of IdP that you want to add. Amazon Cognito supports OIDC, SAML 2.0, Login With \
         Amazon, Sign In With Apple, Google, and Facebook IdPs.\n"]
  provider_details : provider_details_type;
      [@ocaml.doc
        "The scopes, URLs, and identifiers for your external identity provider. The following \
         examples describe the provider detail keys for each IdP type. These values and their \
         schema are subject to change. Social IdP [authorize_scopes] values must match the values \
         listed here.\n\n\
        \  OpenID Connect (OIDC)  Amazon Cognito accepts the following elements when it can't \
         discover endpoint URLs from [oidc_issuer]: [attributes_url], [authorize_url], [jwks_uri], \
         [token_url].\n\
        \                         \n\
        \                          Create or update request: [\"ProviderDetails\": {\n\
        \                    \"attributes_request_method\": \"GET\", \"attributes_url\":\n\
        \                    \"https://auth.example.com/userInfo\", \"authorize_scopes\": \"openid \
         profile\n\
        \                    email\", \"authorize_url\": \"https://auth.example.com/authorize\",\n\
        \                    \"client_id\": \"1example23456789\", \"client_secret\":\n\
        \                    \"provider-app-client-secret\", \"jwks_uri\":\n\
        \                    \"https://auth.example.com/.well-known/jwks.json\", \"oidc_issuer\":\n\
        \                    \"https://auth.example.com\", \"token_url\": \
         \"https://example.com/token\"\n\
        \                    }] \n\
        \                          \n\
        \                           Describe response: [\"ProviderDetails\": { \
         \"attributes_request_method\":\n\
        \                    \"GET\", \"attributes_url\": \"https://auth.example.com/userInfo\",\n\
        \                    \"attributes_url_add_attributes\": \"false\", \"authorize_scopes\": \
         \"openid\n\
        \                    profile email\", \"authorize_url\": \
         \"https://auth.example.com/authorize\",\n\
        \                    \"client_id\": \"1example23456789\", \"client_secret\":\n\
        \                    \"provider-app-client-secret\", \"jwks_uri\":\n\
        \                    \"https://auth.example.com/.well-known/jwks.json\", \"oidc_issuer\":\n\
        \                    \"https://auth.example.com\", \"token_url\": \
         \"https://example.com/token\"\n\
        \                    }] \n\
        \                           \n\
        \                             SAML  Create or update request with Metadata URL: \
         [\"ProviderDetails\": { \"IDPInit\": \"true\",\n\
        \                    \"IDPSignout\": \"true\", \"EncryptedResponses\" : \"true\", \
         \"MetadataURL\":\n\
        \                    \"https://auth.example.com/sso/saml/metadata\", \
         \"RequestSigningAlgorithm\":\n\
        \                    \"rsa-sha256\" }] \n\
        \                                   \n\
        \                                    Create or update request with Metadata file: \
         [\"ProviderDetails\": { \"IDPInit\": \"true\",\n\
        \                    \"IDPSignout\": \"true\", \"EncryptedResponses\" : \"true\",  \n\
        \                    \"MetadataFile\": \"\\[metadata XML\\]\", \"RequestSigningAlgorithm\":\n\
        \                    \"rsa-sha256\" }] \n\
        \                                    \n\
        \                                     The value of [MetadataFile] must be the plaintext \
         metadata document with all quote (\") characters escaped by backslashes.\n\
        \                                     \n\
        \                                      Describe response: [\"ProviderDetails\": { \
         \"IDPInit\": \"true\",\n\
        \                    \"IDPSignout\": \"true\", \"EncryptedResponses\" : \"true\", \
         \"ActiveEncryptionCertificate\": \"\\[certificate\\]\",\n\
        \                    \"MetadataURL\": \"https://auth.example.com/sso/saml/metadata\", \
         \"RequestSigningAlgorithm\":\n\
        \                    \"rsa-sha256\", \"SLORedirectBindingURI\":\n\
        \                    \"https://auth.example.com/slo/saml\", \"SSORedirectBindingURI\":\n\
        \                    \"https://auth.example.com/sso/saml\" }] \n\
        \                                      \n\
        \                                        LoginWithAmazon  Create or update request: \
         [\"ProviderDetails\": { \"authorize_scopes\":\n\
        \                    \"profile postal_code\", \"client_id\":\n\
        \                    \"amzn1.application-oa2-client.1example23456789\", \"client_secret\":\n\
        \                    \"provider-app-client-secret\"] \n\
        \                                                         \n\
        \                                                          Describe response: \
         [\"ProviderDetails\": { \"attributes_url\":\n\
        \                    \"https://api.amazon.com/user/profile\", \
         \"attributes_url_add_attributes\":\n\
        \                    \"false\", \"authorize_scopes\": \"profile postal_code\", \
         \"authorize_url\":\n\
        \                    \"https://www.amazon.com/ap/oa\", \"client_id\":\n\
        \                    \"amzn1.application-oa2-client.1example23456789\", \"client_secret\":\n\
        \                    \"provider-app-client-secret\", \"token_request_method\": \"POST\",\n\
        \                    \"token_url\": \"https://api.amazon.com/auth/o2/token\" }] \n\
        \                                                          \n\
        \                                                            Google  Create or update \
         request: [\"ProviderDetails\": { \"authorize_scopes\":\n\
        \                    \"email profile openid\", \"client_id\":\n\
        \                    \"1example23456789.apps.googleusercontent.com\", \"client_secret\":\n\
        \                    \"provider-app-client-secret\" }] \n\
        \                                                                    \n\
        \                                                                     Describe response: \
         [\"ProviderDetails\": { \"attributes_url\":\n\
        \                    \"https://people.googleapis.com/v1/people/me?personFields=\",\n\
        \                    \"attributes_url_add_attributes\": \"true\", \"authorize_scopes\": \
         \"email\n\
        \                    profile openid\", \"authorize_url\":\n\
        \                    \"https://accounts.google.com/o/oauth2/v2/auth\", \"client_id\":\n\
        \                    \"1example23456789.apps.googleusercontent.com\", \"client_secret\":\n\
        \                    \"provider-app-client-secret\", \"oidc_issuer\":\n\
        \                    \"https://accounts.google.com\", \"token_request_method\": \"POST\",\n\
        \                    \"token_url\": \"https://www.googleapis.com/oauth2/v4/token\"\n\
        \                }] \n\
        \                                                                     \n\
        \                                                                       SignInWithApple  \n\
         Create or update request: [\"ProviderDetails\": { \"authorize_scopes\":\n\
        \                    \"email name\", \"client_id\": \"com.example.cognito\", \
         \"private_key\": \"1EXAMPLE\", \n\
        \                    \"key_id\": \"2EXAMPLE\", \"team_id\": \"3EXAMPLE\" }] \n\n\
        \ Describe response: [\"ProviderDetails\": {\n\
        \                    \"attributes_url_add_attributes\": \"false\", \"authorize_scopes\": \
         \"email\n\
        \                    name\", \"authorize_url\": \
         \"https://appleid.apple.com/auth/authorize\",\n\
        \                    \"client_id\": \"com.example.cognito\", \"key_id\": \"1EXAMPLE\", \
         \"oidc_issuer\":\n\
        \                    \"https://appleid.apple.com\", \"team_id\": \"2EXAMPLE\",\n\
        \                    \"token_request_method\": \"POST\", \"token_url\":\n\
        \                    \"https://appleid.apple.com/auth/token\" }] \n\
        \ \n\
        \   Facebook  Create or update request: [\"ProviderDetails\": { \"api_version\": \"v17.0\", \n\
        \            \"authorize_scopes\": \"public_profile, email\", \"client_id\": \
         \"1example23456789\", \n\
        \            \"client_secret\": \"provider-app-client-secret\" }] \n\
        \             \n\
        \              Describe response: [\"ProviderDetails\": \n\
        \            { \"api_version\": \"v17.0\", \"attributes_url\": \
         \"https://graph.facebook.com/v17.0/me?fields=\", \n\
        \            \"attributes_url_add_attributes\": \"true\", \"authorize_scopes\": \
         \"public_profile, email\", \n\
        \            \"authorize_url\": \"https://www.facebook.com/v17.0/dialog/oauth\", \
         \"client_id\": \n\
        \            \"1example23456789\", \"client_secret\": \"provider-app-client-secret\", \
         \"token_request_method\": \n\
        \            \"GET\", \"token_url\": \
         \"https://graph.facebook.com/v17.0/oauth/access_token\" }] \n\
        \              \n\
        \                "]
  attribute_mapping : attribute_mapping_type option;
      [@ocaml.doc
        "A mapping of IdP attributes to standard and custom user pool attributes. Specify a user \
         pool attribute as the key of the key-value pair, and the IdP attribute claim name as the \
         value.\n"]
  idp_identifiers : idp_identifiers_list_type option;
      [@ocaml.doc
        "An array of IdP identifiers, for example [\"IdPIdentifiers\": \\[ \"MyIdP\", \"MyIdP2\"\n\
        \                \\]]. Identifiers are friendly names that you can pass in the \
         [idp_identifier] query parameter of requests to the \
         {{:https://docs.aws.amazon.com/cognito/latest/developerguide/authorization-endpoint.html}Authorize \
         endpoint} to silently redirect to sign-in with the associated IdP. Identifiers in a \
         domain format also enable the use of \
         {{:https://docs.aws.amazon.com/cognito/latest/developerguide/cognito-user-pools-managing-saml-idp-naming.html}email-address \
         matching with SAML providers}. \n"]
}
[@@ocaml.doc ""]

type nonrec group_exists_exception = { message : message_type option [@ocaml.doc ""] }
[@@ocaml.doc
  "This exception is thrown when Amazon Cognito encounters a group that already exists in the user \
   pool.\n"]

type nonrec create_group_response = {
  group : group_type option; [@ocaml.doc "The response object for a created group.\n"]
}
[@@ocaml.doc ""]

type nonrec create_group_request = {
  group_name : group_name_type;
      [@ocaml.doc "A name for the group. This name must be unique in your user pool.\n"]
  user_pool_id : user_pool_id_type;
      [@ocaml.doc "The ID of the user pool where you want to create a user group.\n"]
  description : description_type option;
      [@ocaml.doc "A description of the group that you're creating.\n"]
  role_arn : arn_type option;
      [@ocaml.doc
        "The Amazon Resource Name (ARN) for the IAM role that you want to associate with the \
         group. A group role primarily declares a preferred role for the credentials that you get \
         from an identity pool. Amazon Cognito ID tokens have a [cognito:preferred_role] claim \
         that presents the highest-precedence group that a user belongs to. Both ID and access \
         tokens also contain a [cognito:groups] claim that list all the groups that a user is a \
         member of.\n"]
  precedence : precedence_type option;
      [@ocaml.doc
        "A non-negative integer value that specifies the precedence of this group relative to the \
         other groups that a user can belong to in the user pool. Zero is the highest precedence \
         value. Groups with lower [Precedence] values take precedence over groups with higher or \
         null [Precedence] values. If a user belongs to two or more groups, it is the group with \
         the lowest precedence value whose role ARN is given in the user's tokens for the \
         [cognito:roles] and [cognito:preferred_role] claims.\n\n\
        \ Two groups can have the same [Precedence] value. If this happens, neither group takes \
         precedence over the other. If two groups with the same [Precedence] have the same role \
         ARN, that role is used in the [cognito:preferred_role] claim in tokens for users in each \
         group. If the two groups have different role ARNs, the [cognito:preferred_role] claim \
         isn't set in users' tokens.\n\
        \ \n\
        \  The default [Precedence] value is null. The maximum [Precedence] value is [2^31-1].\n\
        \  "]
}
[@@ocaml.doc ""]

type nonrec too_many_failed_attempts_exception = {
  message : message_type option;
      [@ocaml.doc
        "The message returned when Amazon Cognito returns a [TooManyFailedAttempts] exception.\n"]
}
[@@ocaml.doc
  "This exception is thrown when the user has made too many failed attempts for a given action, \
   such as sign-in.\n"]

type nonrec confirm_sign_up_response = {
  session : session_type option;
      [@ocaml.doc
        "A session identifier that you can use to immediately sign in the confirmed user. You can \
         automatically sign users in with the one-time password that they provided in a successful \
         [ConfirmSignUp] request.\n"]
}
[@@ocaml.doc "Represents the response from the server for the registration confirmation.\n"]

type nonrec force_alias_creation = bool [@@ocaml.doc ""]

type nonrec confirm_sign_up_request = {
  client_id : client_id_type;
      [@ocaml.doc "The ID of the app client associated with the user pool.\n"]
  secret_hash : secret_hash_type option;
      [@ocaml.doc
        "A keyed-hash message authentication code (HMAC) calculated using the secret key of a user \
         pool client and username plus the client ID in the message. For more information about \
         [SecretHash], see \
         {{:https://docs.aws.amazon.com/cognito/latest/developerguide/signing-up-users-in-your-app.html#cognito-user-pools-computing-secret-hash}Computing \
         secret hash values}.\n"]
  username : username_type;
      [@ocaml.doc
        "The name of the user that you want to query or modify. The value of this parameter is \
         typically your user's username, but it can be any of their alias attributes. If \
         [username] isn't an alias attribute in your user pool, this value must be the [sub] of a \
         local user or the username of a user from a third-party IdP.\n"]
  confirmation_code : confirmation_code_type;
      [@ocaml.doc
        "The confirmation code that your user pool sent in response to the [SignUp] request.\n"]
  force_alias_creation : force_alias_creation option;
      [@ocaml.doc
        "When [true], forces user confirmation despite any existing aliases. Defaults to [false]. \
         A value of [true] migrates the alias from an existing user to the new user if an existing \
         user already has the phone number or email address as an alias.\n\n\
        \ Say, for example, that an existing user has an [email] attribute of [bob@example.com] \
         and email is an alias in your user pool. If the new user also has an email of \
         [bob@example.com] and your [ConfirmSignUp] response sets [ForceAliasCreation] to [true], \
         the new user can sign in with a username of [bob@example.com] and the existing user can \
         no longer do so.\n\
        \ \n\
        \  If [false] and an attribute belongs to an existing alias, this request returns an {b \
         AliasExistsException} error.\n\
        \  \n\
        \   For more information about sign-in aliases, see \
         {{:https://docs.aws.amazon.com/cognito/latest/developerguide/user-pool-settings-attributes.html#user-pool-settings-aliases}Customizing \
         sign-in attributes}.\n\
        \   "]
  analytics_metadata : analytics_metadata_type option;
      [@ocaml.doc
        "Information that supports analytics outcomes with Amazon Pinpoint, including the user's \
         endpoint ID. The endpoint ID is a destination for Amazon Pinpoint push notifications, for \
         example a device identifier, email address, or phone number.\n"]
  user_context_data : user_context_data_type option;
      [@ocaml.doc
        "Contextual data about your user session like the device fingerprint, IP address, or \
         location. Amazon Cognito threat protection evaluates the risk of an authentication event \
         based on the context that your app generates and passes to Amazon Cognito when it makes \
         API requests.\n\n\
        \ For more information, see \
         {{:https://docs.aws.amazon.com/cognito/latest/developerguide/user-pool-settings-viewing-threat-protection-app.html}Collecting \
         data for threat protection in applications}.\n\
        \ "]
  client_metadata : client_metadata_type option;
      [@ocaml.doc
        "A map of custom key-value pairs that you can provide as input for any custom workflows \
         that this action triggers. You create custom workflows by assigning Lambda functions to \
         user pool triggers.\n\n\
        \ When Amazon Cognito invokes any of these functions, it passes a JSON payload, which the \
         function receives as input. This payload contains a [clientMetadata] attribute that \
         provides the data that you assigned to the ClientMetadata parameter in your request. In \
         your function code, you can process the [clientMetadata] value to enhance your workflow \
         for your specific needs.\n\
        \ \n\
        \  To review the Lambda trigger types that Amazon Cognito invokes at runtime with API \
         requests, see \
         {{:https://docs.aws.amazon.com/cognito/latest/developerguide/cognito-user-pools-working-with-lambda-triggers.html#lambda-triggers-by-event} \
         Connecting API actions to Lambda triggers} in the {i Amazon Cognito Developer Guide}.\n\
        \  \n\
        \    When you use the [ClientMetadata] parameter, note that Amazon Cognito won't do the \
         following:\n\
        \    \n\
        \     {ul\n\
        \           {-  Store the [ClientMetadata] value. This data is available only to Lambda \
         triggers that are assigned to a user pool to support custom workflows. If your user pool \
         configuration doesn't include triggers, the [ClientMetadata] parameter serves no purpose.\n\
        \               \n\
        \                }\n\
        \           {-  Validate the [ClientMetadata] value.\n\
        \               \n\
        \                }\n\
        \           {-  Encrypt the [ClientMetadata] value. Don't send sensitive information in \
         this parameter.\n\
        \               \n\
        \                }\n\
        \           }\n\
        \   "]
  session : session_type option;
      [@ocaml.doc
        "The optional session ID from a [SignUp] API request. You can sign in a user directly from \
         the sign-up process with the [USER_AUTH] authentication flow.\n"]
}
[@@ocaml.doc "Represents the request to confirm registration of a user.\n"]

type nonrec confirm_forgot_password_response = unit [@@ocaml.doc ""]

type nonrec confirm_forgot_password_request = {
  client_id : client_id_type;
      [@ocaml.doc
        "The ID of the app client where the user wants to reset their password. This parameter is \
         an identifier of the client application that users are resetting their password from, but \
         this operation resets users' irrespective of the app clients they sign in to.\n"]
  secret_hash : secret_hash_type option;
      [@ocaml.doc
        "A keyed-hash message authentication code (HMAC) calculated using the secret key of a user \
         pool client and username plus the client ID in the message. For more information about \
         [SecretHash], see \
         {{:https://docs.aws.amazon.com/cognito/latest/developerguide/signing-up-users-in-your-app.html#cognito-user-pools-computing-secret-hash}Computing \
         secret hash values}.\n"]
  username : username_type;
      [@ocaml.doc
        "The name of the user that you want to query or modify. The value of this parameter is \
         typically your user's username, but it can be any of their alias attributes. If \
         [username] isn't an alias attribute in your user pool, this value must be the [sub] of a \
         local user or the username of a user from a third-party IdP.\n"]
  confirmation_code : confirmation_code_type;
      [@ocaml.doc
        "The confirmation code that your user pool delivered when your user requested to reset \
         their password.\n"]
  password : password_type; [@ocaml.doc "The new password that your user wants to set.\n"]
  analytics_metadata : analytics_metadata_type option;
      [@ocaml.doc
        "Information that supports analytics outcomes with Amazon Pinpoint, including the user's \
         endpoint ID. The endpoint ID is a destination for Amazon Pinpoint push notifications, for \
         example a device identifier, email address, or phone number.\n"]
  user_context_data : user_context_data_type option;
      [@ocaml.doc
        "Contextual data about your user session like the device fingerprint, IP address, or \
         location. Amazon Cognito threat protection evaluates the risk of an authentication event \
         based on the context that your app generates and passes to Amazon Cognito when it makes \
         API requests.\n\n\
        \ For more information, see \
         {{:https://docs.aws.amazon.com/cognito/latest/developerguide/user-pool-settings-viewing-threat-protection-app.html}Collecting \
         data for threat protection in applications}.\n\
        \ "]
  client_metadata : client_metadata_type option;
      [@ocaml.doc
        "A map of custom key-value pairs that you can provide as input for any custom workflows \
         that this action triggers. You create custom workflows by assigning Lambda functions to \
         user pool triggers.\n\n\
        \ When Amazon Cognito invokes any of these functions, it passes a JSON payload, which the \
         function receives as input. This payload contains a [clientMetadata] attribute that \
         provides the data that you assigned to the ClientMetadata parameter in your request. In \
         your function code, you can process the [clientMetadata] value to enhance your workflow \
         for your specific needs.\n\
        \ \n\
        \  To review the Lambda trigger types that Amazon Cognito invokes at runtime with API \
         requests, see \
         {{:https://docs.aws.amazon.com/cognito/latest/developerguide/cognito-user-pools-working-with-lambda-triggers.html#lambda-triggers-by-event} \
         Connecting API actions to Lambda triggers} in the {i Amazon Cognito Developer Guide}.\n\
        \  \n\
        \    When you use the [ClientMetadata] parameter, note that Amazon Cognito won't do the \
         following:\n\
        \    \n\
        \     {ul\n\
        \           {-  Store the [ClientMetadata] value. This data is available only to Lambda \
         triggers that are assigned to a user pool to support custom workflows. If your user pool \
         configuration doesn't include triggers, the [ClientMetadata] parameter serves no purpose.\n\
        \               \n\
        \                }\n\
        \           {-  Validate the [ClientMetadata] value.\n\
        \               \n\
        \                }\n\
        \           {-  Encrypt the [ClientMetadata] value. Don't send sensitive information in \
         this parameter.\n\
        \               \n\
        \                }\n\
        \           }\n\
        \   "]
}
[@@ocaml.doc "The request representing the confirmation for a password reset.\n"]

type nonrec device_key_exists_exception = { message : message_type option [@ocaml.doc ""] }
[@@ocaml.doc
  "This exception is thrown when a user attempts to confirm a device with a device key that \
   already exists.\n"]

type nonrec confirm_device_response = {
  user_confirmation_necessary : boolean_type option;
      [@ocaml.doc
        "When [true], your user must confirm that they want to remember the device. Prompt the \
         user for an answer.\n\n\
        \ When [false], immediately sets the device as remembered and eligible for device \
         authentication.\n\
        \ \n\
        \  You can configure your user pool to always remember devices, in which case this \
         response is [false], or to allow users to opt in, in which case this response is [true]. \
         Configure this option under {i Device tracking} in the {i Sign-in} menu of your user pool.\n\
        \  "]
}
[@@ocaml.doc "The confirm-device response.\n"]

type nonrec device_name_type = string [@@ocaml.doc ""]

type nonrec device_secret_verifier_config_type = {
  password_verifier : string_type option;
      [@ocaml.doc "A password verifier for a user's device. Used in SRP authentication.\n"]
  salt : string_type option;
      [@ocaml.doc "The salt that you want to use in SRP authentication with the user's device.\n"]
}
[@@ocaml.doc
  "A Secure Remote Password (SRP) value that your application generates when you register a user's \
   device. For more information, see \
   {{:https://docs.aws.amazon.com/cognito/latest/developerguide/amazon-cognito-user-pools-device-tracking.html#user-pools-remembered-devices-getting-a-device-key}Getting \
   a device key}.\n"]

type nonrec confirm_device_request = {
  access_token : token_model_type;
      [@ocaml.doc
        "A valid access token that Amazon Cognito issued to the currently signed-in user. Must \
         include a scope claim for [aws.cognito.signin.user.admin].\n"]
  device_key : device_key_type;
      [@ocaml.doc
        "The unique identifier, or device key, of the device that you want to update the status for.\n"]
  device_secret_verifier_config : device_secret_verifier_config_type option;
      [@ocaml.doc "The configuration of the device secret verifier.\n"]
  device_name : device_name_type option;
      [@ocaml.doc "A friendly name for the device, for example [MyMobilePhone].\n"]
}
[@@ocaml.doc "The confirm-device request.\n"]

type nonrec web_authn_relying_party_mismatch_exception = {
  message : message_type option; [@ocaml.doc ""]
}
[@@ocaml.doc
  "This exception is thrown when the given passkey credential is associated with a different \
   relying party ID than the user pool relying party ID.\n"]

type nonrec web_authn_origin_not_allowed_exception = {
  message : message_type option; [@ocaml.doc ""]
}
[@@ocaml.doc
  "This exception is thrown when the passkey credential's registration origin does not align with \
   the user pool relying party id.\n"]

type nonrec web_authn_credential_not_supported_exception = {
  message : message_type option; [@ocaml.doc ""]
}
[@@ocaml.doc
  "This exception is thrown when a user presents passkey credentials from an unsupported device or \
   provider.\n"]

type nonrec web_authn_client_mismatch_exception = { message : message_type option [@ocaml.doc ""] }
[@@ocaml.doc
  "This exception is thrown when the access token is for a different client than the one in the \
   original [StartWebAuthnRegistration] request.\n"]

type nonrec web_authn_challenge_not_found_exception = {
  message : message_type option; [@ocaml.doc ""]
}
[@@ocaml.doc
  "This exception is thrown when the challenge from [StartWebAuthn] registration has expired.\n"]

type nonrec complete_web_authn_registration_response = unit [@@ocaml.doc ""]

type nonrec complete_web_authn_registration_request = {
  access_token : token_model_type;
      [@ocaml.doc
        "A valid access token that Amazon Cognito issued to the currently signed-in user. Must \
         include a scope claim for [aws.cognito.signin.user.admin].\n"]
  credential : document;
      [@ocaml.doc
        "A \
         {{:https://www.w3.org/TR/WebAuthn-3/#dictdef-registrationresponsejson}RegistrationResponseJSON} \
         public-key credential response from the user's passkey provider.\n"]
}
[@@ocaml.doc ""]

type nonrec change_password_response = unit [@@ocaml.doc ""]

type nonrec change_password_request = {
  previous_password : password_type option;
      [@ocaml.doc
        "The user's previous password. Required if the user has a password. If the user has no \
         password and only signs in with passwordless authentication options, you can omit this \
         parameter.\n"]
  proposed_password : password_type;
      [@ocaml.doc "A new password that you prompted the user to enter in your application.\n"]
  access_token : token_model_type;
      [@ocaml.doc
        "A valid access token that Amazon Cognito issued to the user whose password you want to \
         change.\n"]
}
[@@ocaml.doc "Represents the request to change a user password.\n"]

type nonrec secret_code_type = string [@@ocaml.doc ""]

type nonrec associate_software_token_response = {
  secret_code : secret_code_type option;
      [@ocaml.doc
        "A unique generated shared secret code that is used by the TOTP algorithm to generate a \
         one-time code.\n"]
  session : session_type option;
      [@ocaml.doc
        "The session identifier that maintains the state of authentication requests and challenge \
         responses.\n"]
}
[@@ocaml.doc ""]

type nonrec associate_software_token_request = {
  access_token : token_model_type option;
      [@ocaml.doc
        "A valid access token that Amazon Cognito issued to the currently signed-in user. Must \
         include a scope claim for [aws.cognito.signin.user.admin].\n\n\
        \ You can provide either an access token or a session ID in the request.\n\
        \ "]
  session : session_type option;
      [@ocaml.doc
        "The session identifier that maintains the state of authentication requests and challenge \
         responses. In [AssociateSoftwareToken], this is the session ID from a successful sign-in. \
         You can provide either an access token or a session ID in the request.\n"]
}
[@@ocaml.doc ""]

type nonrec admin_user_global_sign_out_response = unit [@@ocaml.doc ""]

type nonrec admin_user_global_sign_out_request = {
  user_pool_id : user_pool_id_type;
      [@ocaml.doc "The ID of the user pool where you want to sign out a user.\n"]
  username : username_type;
      [@ocaml.doc
        "The name of the user that you want to query or modify. The value of this parameter is \
         typically your user's username, but it can be any of their alias attributes. If \
         [username] isn't an alias attribute in your user pool, this value must be the [sub] of a \
         local user or the username of a user from a third-party IdP.\n"]
}
[@@ocaml.doc "The request to sign out of all devices, as an administrator.\n"]

type nonrec admin_update_user_attributes_response = unit [@@ocaml.doc ""]

type nonrec admin_update_user_attributes_request = {
  user_pool_id : user_pool_id_type;
      [@ocaml.doc "The ID of the user pool where you want to update user attributes.\n"]
  username : username_type;
      [@ocaml.doc
        "The name of the user that you want to query or modify. The value of this parameter is \
         typically your user's username, but it can be any of their alias attributes. If \
         [username] isn't an alias attribute in your user pool, this value must be the [sub] of a \
         local user or the username of a user from a third-party IdP.\n"]
  user_attributes : attribute_list_type;
      [@ocaml.doc
        "An array of name-value pairs representing user attributes.\n\n\
        \ For custom attributes, you must prepend the [custom:] prefix to the attribute name.\n\
        \ \n\
        \  If your user pool requires verification before Amazon Cognito updates an attribute \
         value that you specify in this request, Amazon Cognito doesn\226\128\153t immediately \
         update the value of that attribute. After your user receives and responds to a \
         verification message to verify the new value, Amazon Cognito updates the attribute value. \
         Your user can sign in and receive messages with the original attribute value until they \
         verify the new value.\n\
        \  \n\
        \   To skip the verification message and update the value of an attribute that requires \
         verification in the same API request, include the [email_verified] or \
         [phone_number_verified] attribute, with a value of [true]. If you set the \
         [email_verified] or [phone_number_verified] value for an [email] or [phone_number] \
         attribute that requires verification to [true], Amazon Cognito doesn\226\128\153t send a \
         verification message to your user.\n\
        \   "]
  client_metadata : client_metadata_type option;
      [@ocaml.doc
        "A map of custom key-value pairs that you can provide as input for any custom workflows \
         that this action triggers. You create custom workflows by assigning Lambda functions to \
         user pool triggers.\n\n\
        \ When Amazon Cognito invokes any of these functions, it passes a JSON payload, which the \
         function receives as input. This payload contains a [clientMetadata] attribute that \
         provides the data that you assigned to the ClientMetadata parameter in your request. In \
         your function code, you can process the [clientMetadata] value to enhance your workflow \
         for your specific needs.\n\
        \ \n\
        \  To review the Lambda trigger types that Amazon Cognito invokes at runtime with API \
         requests, see \
         {{:https://docs.aws.amazon.com/cognito/latest/developerguide/cognito-user-pools-working-with-lambda-triggers.html#lambda-triggers-by-event} \
         Connecting API actions to Lambda triggers} in the {i Amazon Cognito Developer Guide}.\n\
        \  \n\
        \    When you use the [ClientMetadata] parameter, note that Amazon Cognito won't do the \
         following:\n\
        \    \n\
        \     {ul\n\
        \           {-  Store the [ClientMetadata] value. This data is available only to Lambda \
         triggers that are assigned to a user pool to support custom workflows. If your user pool \
         configuration doesn't include triggers, the [ClientMetadata] parameter serves no purpose.\n\
        \               \n\
        \                }\n\
        \           {-  Validate the [ClientMetadata] value.\n\
        \               \n\
        \                }\n\
        \           {-  Encrypt the [ClientMetadata] value. Don't send sensitive information in \
         this parameter.\n\
        \               \n\
        \                }\n\
        \           }\n\
        \   "]
}
[@@ocaml.doc "Represents the request to update the user's attributes as an administrator.\n"]

type nonrec admin_update_device_status_response = unit [@@ocaml.doc ""]

type nonrec admin_update_device_status_request = {
  user_pool_id : user_pool_id_type;
      [@ocaml.doc "The ID of the user pool where you want to change a user's device status.\n"]
  username : username_type;
      [@ocaml.doc
        "The name of the user that you want to query or modify. The value of this parameter is \
         typically your user's username, but it can be any of their alias attributes. If \
         [username] isn't an alias attribute in your user pool, this value must be the [sub] of a \
         local user or the username of a user from a third-party IdP.\n"]
  device_key : device_key_type;
      [@ocaml.doc
        "The unique identifier, or device key, of the device that you want to update the status for.\n"]
  device_remembered_status : device_remembered_status_type option;
      [@ocaml.doc
        "To enable device authentication with the specified device, set to [remembered].To \
         disable, set to [not_remembered].\n"]
}
[@@ocaml.doc "The request to update the device status, as an administrator.\n"]

type nonrec admin_update_auth_event_feedback_response = unit [@@ocaml.doc ""]

type nonrec admin_update_auth_event_feedback_request = {
  user_pool_id : user_pool_id_type;
      [@ocaml.doc
        "The ID of the user pool where you want to submit authentication-event feedback.\n"]
  username : username_type;
      [@ocaml.doc
        "The name of the user that you want to query or modify. The value of this parameter is \
         typically your user's username, but it can be any of their alias attributes. If \
         [username] isn't an alias attribute in your user pool, this value must be the [sub] of a \
         local user or the username of a user from a third-party IdP.\n"]
  event_id : event_id_type;
      [@ocaml.doc "The ID of the threat protection authentication event that you want to update.\n"]
  feedback_value : feedback_value_type;
      [@ocaml.doc
        "Your feedback to the authentication event. When you provide a [FeedbackValue] value of \
         [valid], you tell Amazon Cognito that you trust a user session where Amazon Cognito has \
         evaluated some level of risk. When you provide a [FeedbackValue] value of [invalid], you \
         tell Amazon Cognito that you don't trust a user session, or you don't believe that Amazon \
         Cognito evaluated a high-enough risk level.\n"]
}
[@@ocaml.doc ""]

type nonrec admin_set_user_settings_response = unit [@@ocaml.doc ""]

type nonrec admin_set_user_settings_request = {
  user_pool_id : user_pool_id_type;
      [@ocaml.doc "The ID of the user pool that contains the user whose options you're setting.\n"]
  username : username_type;
      [@ocaml.doc
        "The name of the user that you want to query or modify. The value of this parameter is \
         typically your user's username, but it can be any of their alias attributes. If \
         [username] isn't an alias attribute in your user pool, this value must be the [sub] of a \
         local user or the username of a user from a third-party IdP.\n"]
  mfa_options : mfa_option_list_type;
      [@ocaml.doc
        "You can use this parameter only to set an SMS configuration that uses SMS for delivery.\n"]
}
[@@ocaml.doc
  "You can use this parameter to set an MFA configuration that uses the SMS delivery medium.\n"]

type nonrec admin_set_user_password_response = unit [@@ocaml.doc ""]

type nonrec admin_set_user_password_request = {
  user_pool_id : user_pool_id_type;
      [@ocaml.doc "The ID of the user pool where you want to set the user's password.\n"]
  username : username_type;
      [@ocaml.doc
        "The name of the user that you want to query or modify. The value of this parameter is \
         typically your user's username, but it can be any of their alias attributes. If \
         [username] isn't an alias attribute in your user pool, this value must be the [sub] of a \
         local user or the username of a user from a third-party IdP.\n"]
  password : password_type;
      [@ocaml.doc
        "The new temporary or permanent password that you want to set for the user. You can't \
         remove the password for a user who already has a password so that they can only sign in \
         with passwordless methods. In this scenario, you must create a new user without a \
         password.\n"]
  permanent : boolean_type option;
      [@ocaml.doc
        "Set to [true] to set a password that the user can immediately sign in with. Set to \
         [false] to set a temporary password that the user must change on their next sign-in.\n"]
}
[@@ocaml.doc ""]

type nonrec admin_set_user_mfa_preference_response = unit [@@ocaml.doc ""]

type nonrec admin_set_user_mfa_preference_request = {
  sms_mfa_settings : sms_mfa_settings_type option;
      [@ocaml.doc
        "User preferences for SMS message MFA. Activates or deactivates SMS MFA and sets it as the \
         preferred MFA method when multiple methods are available.\n"]
  software_token_mfa_settings : software_token_mfa_settings_type option;
      [@ocaml.doc
        "User preferences for time-based one-time password (TOTP) MFA. Activates or deactivates \
         TOTP MFA and sets it as the preferred MFA method when multiple methods are available.\n"]
  email_mfa_settings : email_mfa_settings_type option;
      [@ocaml.doc
        "User preferences for email message MFA. Activates or deactivates email MFA and sets it as \
         the preferred MFA method when multiple methods are available. To activate this setting, \
         your user pool must be in the \
         {{:https://docs.aws.amazon.com/cognito/latest/developerguide/feature-plans-features-essentials.html} \
         Essentials tier} or higher.\n"]
  web_authn_mfa_settings : web_authn_mfa_settings_type option;
      [@ocaml.doc
        "User preferences for passkey MFA. Activates or deactivates passkey MFA for the user. When \
         activated, passkey authentication requires user verification, and passkey sign-in is \
         available when MFA is required. To activate this setting, the [FactorConfiguration] of \
         your user pool [WebAuthnConfiguration] must be [MULTI_FACTOR_WITH_USER_VERIFICATION]. To \
         activate this setting, your user pool must be in the \
         {{:https://docs.aws.amazon.com/cognito/latest/developerguide/feature-plans-features-essentials.html} \
         Essentials tier} or higher.\n"]
  username : username_type;
      [@ocaml.doc
        "The name of the user that you want to query or modify. The value of this parameter is \
         typically your user's username, but it can be any of their alias attributes. If \
         [username] isn't an alias attribute in your user pool, this value must be the [sub] of a \
         local user or the username of a user from a third-party IdP.\n"]
  user_pool_id : user_pool_id_type;
      [@ocaml.doc "The ID of the user pool where you want to set a user's MFA preferences.\n"]
}
[@@ocaml.doc ""]

type nonrec admin_respond_to_auth_challenge_response = {
  challenge_name : challenge_name_type option;
      [@ocaml.doc
        "The name of the next challenge that you must respond to.\n\n\
        \ Possible challenges include the following:\n\
        \ \n\
        \   All of the following challenges require [USERNAME] and, when the app client has a \
         client secret, [SECRET_HASH] in the parameters. Include a [DEVICE_KEY] for device \
         authentication.\n\
        \   \n\
        \     {ul\n\
        \           {-   [WEB_AUTHN]: Respond to the challenge with the results of a successful \
         authentication with a WebAuthn authenticator, or passkey, as [CREDENTIAL]. Examples of \
         WebAuthn authenticators include biometric devices and security keys.\n\
        \               \n\
        \                }\n\
        \           {-   [PASSWORD]: Respond with the user's password as [PASSWORD].\n\
        \               \n\
        \                }\n\
        \           {-   [PASSWORD_SRP]: Respond with the initial SRP secret as [SRP_A].\n\
        \               \n\
        \                }\n\
        \           {-   [SELECT_CHALLENGE]: Respond with a challenge selection as [ANSWER]. It \
         must be one of the challenge types in the [AvailableChallenges] response parameter. Add \
         the parameters of the selected challenge, for example [USERNAME] and [SMS_OTP].\n\
        \               \n\
        \                }\n\
        \           {-   [SMS_MFA]: Respond with the code that your user pool delivered in an SMS \
         message, as [SMS_MFA_CODE] \n\
        \               \n\
        \                }\n\
        \           {-   [EMAIL_MFA]: Respond with the code that your user pool delivered in an \
         email message, as [EMAIL_MFA_CODE] \n\
        \               \n\
        \                }\n\
        \           {-   [EMAIL_OTP]: Respond with the code that your user pool delivered in an \
         email message, as [EMAIL_OTP_CODE] .\n\
        \               \n\
        \                }\n\
        \           {-   [SMS_OTP]: Respond with the code that your user pool delivered in an SMS \
         message, as [SMS_OTP_CODE].\n\
        \               \n\
        \                }\n\
        \           {-   [PASSWORD_VERIFIER]: Respond with the second stage of SRP secrets as \
         [PASSWORD_CLAIM_SIGNATURE], [PASSWORD_CLAIM_SECRET_BLOCK], and [TIMESTAMP].\n\
        \               \n\
        \                }\n\
        \           {-   [CUSTOM_CHALLENGE]: This is returned if your custom authentication flow \
         determines that the user should pass another challenge before tokens are issued. The \
         parameters of the challenge are determined by your Lambda function and issued in the \
         [ChallengeParameters] of a challenge response.\n\
        \               \n\
        \                }\n\
        \           {-   [DEVICE_SRP_AUTH]: Respond with the initial parameters of device SRP \
         authentication. For more information, see \
         {{:https://docs.aws.amazon.com/cognito/latest/developerguide/amazon-cognito-user-pools-device-tracking.html#user-pools-remembered-devices-signing-in-with-a-device}Signing \
         in with a device}.\n\
        \               \n\
        \                }\n\
        \           {-   [DEVICE_PASSWORD_VERIFIER]: Respond with [PASSWORD_CLAIM_SIGNATURE], \
         [PASSWORD_CLAIM_SECRET_BLOCK], and [TIMESTAMP] after client-side SRP calculations. For \
         more information, see \
         {{:https://docs.aws.amazon.com/cognito/latest/developerguide/amazon-cognito-user-pools-device-tracking.html#user-pools-remembered-devices-signing-in-with-a-device}Signing \
         in with a device}.\n\
        \               \n\
        \                }\n\
        \           {-   [NEW_PASSWORD_REQUIRED]: For users who are required to change their \
         passwords after successful first login. Respond to this challenge with [NEW_PASSWORD] and \
         any required attributes that Amazon Cognito returned in the [requiredAttributes] \
         parameter. You can also set values for attributes that aren't required by your user pool \
         and that your app client can write.\n\
        \               \n\
        \                Amazon Cognito only returns this challenge for users who have temporary \
         passwords. When you create passwordless users, you must provide values for all required \
         attributes.\n\
        \                \n\
        \                  In a [NEW_PASSWORD_REQUIRED] challenge response, you can't modify a \
         required attribute that already has a value. In [AdminRespondToAuthChallenge] or \
         [RespondToAuthChallenge], set a value for any keys that Amazon Cognito returned in the \
         [requiredAttributes] parameter, then use the [AdminUpdateUserAttributes] or \
         [UpdateUserAttributes] API operation to modify the value of any additional attributes.\n\
        \                  \n\
        \                    }\n\
        \           {-   [MFA_SETUP]: For users who are required to setup an MFA factor before \
         they can sign in. The MFA types activated for the user pool will be listed in the \
         challenge parameters [MFAS_CAN_SETUP] value. \n\
        \               \n\
        \                To set up time-based one-time password (TOTP) MFA, use the session \
         returned in this challenge from [InitiateAuth] or [AdminInitiateAuth] as an input to \
         [AssociateSoftwareToken]. Then, use the session returned by [VerifySoftwareToken] as an \
         input to [RespondToAuthChallenge] or [AdminRespondToAuthChallenge] with challenge name \
         [MFA_SETUP] to complete sign-in. \n\
        \                \n\
        \                 To set up SMS or email MFA, collect a [phone_number] or [email] \
         attribute for the user. Then restart the authentication flow with an [InitiateAuth] or \
         [AdminInitiateAuth] request. \n\
        \                 \n\
        \                  }\n\
        \           }\n\
        \  "]
  session : session_type option;
      [@ocaml.doc
        "The session identifier that maintains the state of authentication requests and challenge \
         responses. If an [AdminInitiateAuth] or [AdminRespondToAuthChallenge] API request results \
         in a determination that your application must pass another challenge, Amazon Cognito \
         returns a session with other challenge parameters. Send this session identifier, \
         unmodified, to the next [AdminRespondToAuthChallenge] request.\n"]
  challenge_parameters : challenge_parameters_type option;
      [@ocaml.doc "The parameters that define your response to the next challenge.\n"]
  authentication_result : authentication_result_type option;
      [@ocaml.doc
        "The outcome of a successful authentication process. After your application has passed all \
         challenges, Amazon Cognito returns an [AuthenticationResult] with the JSON web tokens \
         (JWTs) that indicate successful sign-in.\n"]
}
[@@ocaml.doc "Responds to the authentication challenge, as an administrator.\n"]

type nonrec http_header = {
  header_name : string_type option; [@ocaml.doc "The header name.\n"]
  header_value : string_type option; [@ocaml.doc "The header value.\n"]
}
[@@ocaml.doc "The HTTP header in the [ContextData] parameter.\n"]

type nonrec http_header_list = http_header list [@@ocaml.doc ""]

type nonrec context_data_type = {
  ip_address : string_type; [@ocaml.doc "The source IP address of your user's device.\n"]
  server_name : string_type; [@ocaml.doc "The name of your application's service endpoint.\n"]
  server_path : string_type; [@ocaml.doc "The path of your application's service endpoint.\n"]
  http_headers : http_header_list;
      [@ocaml.doc "The HTTP headers from your user's authentication request.\n"]
  encoded_data : string_type option;
      [@ocaml.doc
        "Encoded device-fingerprint details that your app collected with the Amazon Cognito \
         context data collection library. For more information, see \
         {{:https://docs.aws.amazon.com/cognito/latest/developerguide/cognito-user-pool-settings-adaptive-authentication.html#user-pool-settings-adaptive-authentication-device-fingerprint}Adding \
         user device and session data to API requests}.\n"]
}
[@@ocaml.doc
  "Contextual user data used for evaluating the risk of an authentication event by user pool \
   threat protection.\n"]

type nonrec admin_respond_to_auth_challenge_request = {
  user_pool_id : user_pool_id_type;
      [@ocaml.doc
        "The ID of the user pool where you want to respond to an authentication challenge.\n"]
  client_id : client_id_type; [@ocaml.doc "The ID of the app client where you initiated sign-in.\n"]
  challenge_name : challenge_name_type;
      [@ocaml.doc
        "The name of the challenge that you are responding to.\n\n\
        \ Possible challenges include the following:\n\
        \ \n\
        \   All of the following challenges require [USERNAME] and, when the app client has a \
         client secret, [SECRET_HASH] in the parameters. Include a [DEVICE_KEY] for device \
         authentication.\n\
        \   \n\
        \     {ul\n\
        \           {-   [WEB_AUTHN]: Respond to the challenge with the results of a successful \
         authentication with a WebAuthn authenticator, or passkey, as [CREDENTIAL]. Examples of \
         WebAuthn authenticators include biometric devices and security keys.\n\
        \               \n\
        \                }\n\
        \           {-   [PASSWORD]: Respond with the user's password as [PASSWORD].\n\
        \               \n\
        \                }\n\
        \           {-   [PASSWORD_SRP]: Respond with the initial SRP secret as [SRP_A].\n\
        \               \n\
        \                }\n\
        \           {-   [SELECT_CHALLENGE]: Respond with a challenge selection as [ANSWER]. It \
         must be one of the challenge types in the [AvailableChallenges] response parameter. Add \
         the parameters of the selected challenge, for example [USERNAME] and [SMS_OTP].\n\
        \               \n\
        \                }\n\
        \           {-   [SMS_MFA]: Respond with the code that your user pool delivered in an SMS \
         message, as [SMS_MFA_CODE] \n\
        \               \n\
        \                }\n\
        \           {-   [EMAIL_MFA]: Respond with the code that your user pool delivered in an \
         email message, as [EMAIL_MFA_CODE] \n\
        \               \n\
        \                }\n\
        \           {-   [EMAIL_OTP]: Respond with the code that your user pool delivered in an \
         email message, as [EMAIL_OTP_CODE] .\n\
        \               \n\
        \                }\n\
        \           {-   [SMS_OTP]: Respond with the code that your user pool delivered in an SMS \
         message, as [SMS_OTP_CODE].\n\
        \               \n\
        \                }\n\
        \           {-   [PASSWORD_VERIFIER]: Respond with the second stage of SRP secrets as \
         [PASSWORD_CLAIM_SIGNATURE], [PASSWORD_CLAIM_SECRET_BLOCK], and [TIMESTAMP].\n\
        \               \n\
        \                }\n\
        \           {-   [CUSTOM_CHALLENGE]: This is returned if your custom authentication flow \
         determines that the user should pass another challenge before tokens are issued. The \
         parameters of the challenge are determined by your Lambda function and issued in the \
         [ChallengeParameters] of a challenge response.\n\
        \               \n\
        \                }\n\
        \           {-   [DEVICE_SRP_AUTH]: Respond with the initial parameters of device SRP \
         authentication. For more information, see \
         {{:https://docs.aws.amazon.com/cognito/latest/developerguide/amazon-cognito-user-pools-device-tracking.html#user-pools-remembered-devices-signing-in-with-a-device}Signing \
         in with a device}.\n\
        \               \n\
        \                }\n\
        \           {-   [DEVICE_PASSWORD_VERIFIER]: Respond with [PASSWORD_CLAIM_SIGNATURE], \
         [PASSWORD_CLAIM_SECRET_BLOCK], and [TIMESTAMP] after client-side SRP calculations. For \
         more information, see \
         {{:https://docs.aws.amazon.com/cognito/latest/developerguide/amazon-cognito-user-pools-device-tracking.html#user-pools-remembered-devices-signing-in-with-a-device}Signing \
         in with a device}.\n\
        \               \n\
        \                }\n\
        \           {-   [NEW_PASSWORD_REQUIRED]: For users who are required to change their \
         passwords after successful first login. Respond to this challenge with [NEW_PASSWORD] and \
         any required attributes that Amazon Cognito returned in the [requiredAttributes] \
         parameter. You can also set values for attributes that aren't required by your user pool \
         and that your app client can write.\n\
        \               \n\
        \                Amazon Cognito only returns this challenge for users who have temporary \
         passwords. When you create passwordless users, you must provide values for all required \
         attributes.\n\
        \                \n\
        \                  In a [NEW_PASSWORD_REQUIRED] challenge response, you can't modify a \
         required attribute that already has a value. In [AdminRespondToAuthChallenge] or \
         [RespondToAuthChallenge], set a value for any keys that Amazon Cognito returned in the \
         [requiredAttributes] parameter, then use the [AdminUpdateUserAttributes] or \
         [UpdateUserAttributes] API operation to modify the value of any additional attributes.\n\
        \                  \n\
        \                    }\n\
        \           {-   [MFA_SETUP]: For users who are required to setup an MFA factor before \
         they can sign in. The MFA types activated for the user pool will be listed in the \
         challenge parameters [MFAS_CAN_SETUP] value. \n\
        \               \n\
        \                To set up time-based one-time password (TOTP) MFA, use the session \
         returned in this challenge from [InitiateAuth] or [AdminInitiateAuth] as an input to \
         [AssociateSoftwareToken]. Then, use the session returned by [VerifySoftwareToken] as an \
         input to [RespondToAuthChallenge] or [AdminRespondToAuthChallenge] with challenge name \
         [MFA_SETUP] to complete sign-in. \n\
        \                \n\
        \                 To set up SMS or email MFA, collect a [phone_number] or [email] \
         attribute for the user. Then restart the authentication flow with an [InitiateAuth] or \
         [AdminInitiateAuth] request. \n\
        \                 \n\
        \                  }\n\
        \           }\n\
        \  "]
  challenge_responses : challenge_responses_type option;
      [@ocaml.doc
        "The responses to the challenge that you received in the previous request. Each challenge \
         has its own required response parameters. The following examples are partial JSON request \
         bodies that highlight challenge-response parameters.\n\n\
        \  You must provide a SECRET_HASH parameter in all challenge responses to an app client \
         that has a client secret. Include a [DEVICE_KEY] for device authentication.\n\
        \  \n\
        \     SELECT_CHALLENGE   [\"ChallengeName\": \"SELECT_CHALLENGE\", \"ChallengeResponses\": {\n\
        \            \"USERNAME\": \"\\[username\\]\",\n\
        \            \"ANSWER\": \"\\[Challenge name\\]\"}] \n\
        \                       \n\
        \                        Available challenges are [PASSWORD], [PASSWORD_SRP], [EMAIL_OTP], \
         [SMS_OTP], and [WEB_AUTHN].\n\
        \                        \n\
        \                         Complete authentication in the [SELECT_CHALLENGE] response for \
         [PASSWORD], [PASSWORD_SRP], and [WEB_AUTHN]:\n\
        \                         \n\
        \                          {ul\n\
        \                                {-   [\"ChallengeName\": \"SELECT_CHALLENGE\", \
         \"ChallengeResponses\": {\n\
        \                  \"ANSWER\": \"WEB_AUTHN\",\n\
        \                  \"USERNAME\": \"\\[username\\]\",\n\
        \                  \"CREDENTIAL\": \"\\[AuthenticationResponseJSON\\]\"}] \n\
        \                                    \n\
        \                                     See \
         {{:https://www.w3.org/TR/WebAuthn-3/#dictdef-authenticationresponsejson} \
         AuthenticationResponseJSON}.\n\
        \                                     \n\
        \                                      }\n\
        \                                {-   [\"ChallengeName\": \"SELECT_CHALLENGE\", \
         \"ChallengeResponses\": {\n\
        \                  \"ANSWER\": \"PASSWORD\",\n\
        \                  \"USERNAME\": \"\\[username\\]\",\n\
        \                  \"PASSWORD\": \"\\[password\\]\"}] \n\
        \                                    \n\
        \                                     }\n\
        \                                {-   [\"ChallengeName\": \"SELECT_CHALLENGE\", \
         \"ChallengeResponses\": {\n\
        \                  \"ANSWER\": \"PASSWORD_SRP\",\n\
        \                  \"USERNAME\": \"\\[username\\]\",\n\
        \                  \"SRP_A\": \"\\[SRP_A\\]\"}] \n\
        \                                    \n\
        \                                     }\n\
        \                                }\n\
        \   For [SMS_OTP] and [EMAIL_OTP], respond with the username and answer. Your user pool \
         will send a code for the user to submit in the next challenge response.\n\
        \   \n\
        \    {ul\n\
        \          {-   [\"ChallengeName\": \"SELECT_CHALLENGE\", \"ChallengeResponses\": {\n\
        \                  \"ANSWER\": \"SMS_OTP\",\n\
        \                  \"USERNAME\": \"\\[username\\]\"}] \n\
        \              \n\
        \               }\n\
        \          {-   [\"ChallengeName\": \"SELECT_CHALLENGE\", \"ChallengeResponses\": {\n\
        \                  \"ANSWER\": \"EMAIL_OTP\",\n\
        \                  \"USERNAME\": \"\\[username\\]\"}] \n\
        \              \n\
        \               }\n\
        \          }\n\
        \    WEB_AUTHN   [\"ChallengeName\": \"WEB_AUTHN\", \"ChallengeResponses\": {\n\
        \                  \"USERNAME\": \"\\[username\\]\",\n\
        \                  \"CREDENTIAL\": \"\\[AuthenticationResponseJSON\\]\"}] \n\
        \               \n\
        \                See \
         {{:https://www.w3.org/TR/WebAuthn-3/#dictdef-authenticationresponsejson} \
         AuthenticationResponseJSON}.\n\
        \                \n\
        \                  PASSWORD   [\"ChallengeName\": \"PASSWORD\", \"ChallengeResponses\": {\n\
        \                  \"USERNAME\": \"\\[username\\]\",\n\
        \                  \"PASSWORD\": \"\\[password\\]\"}] \n\
        \                            \n\
        \                              PASSWORD_SRP   [\"ChallengeName\": \"PASSWORD_SRP\", \
         \"ChallengeResponses\": {\n\
        \                  \"USERNAME\": \"\\[username\\]\",\n\
        \                  \"SRP_A\": \"\\[SRP_A\\]\"}] \n\
        \                                            \n\
        \                                              SMS_OTP   [\"ChallengeName\": \"SMS_OTP\", \
         \"ChallengeResponses\": \n\
        \            {\"SMS_OTP_CODE\": \"\\[code\\]\", \"USERNAME\": \"\\[username\\]\"}] \n\
        \                                                       \n\
        \                                                         EMAIL_OTP   [\"ChallengeName\": \
         \"EMAIL_OTP\", \"ChallengeResponses\": {\"EMAIL_OTP_CODE\":\n\
        \                    \"\\[code\\]\", \"USERNAME\": \"\\[username\\]\"}] \n\
        \                                                                    \n\
        \                                                                      SMS_MFA   \
         [\"ChallengeName\": \"SMS_MFA\", \"ChallengeResponses\": {\"SMS_MFA_CODE\":\n\
        \                    \"\\[code\\]\", \"USERNAME\": \"\\[username\\]\"}] \n\
        \                                                                               \n\
        \                                                                                 \
         PASSWORD_VERIFIER  \n\
         This challenge response is part of the SRP flow. Amazon Cognito requires that your \
         application respond to this challenge within a few seconds. When the response time \
         exceeds this period, your user pool returns a [NotAuthorizedException] error.\n\n\
        \  [\"ChallengeName\": \"PASSWORD_VERIFIER\", \"ChallengeResponses\":\n\
        \                    {\"PASSWORD_CLAIM_SIGNATURE\": \"\\[claim_signature\\]\",\n\
        \                    \"PASSWORD_CLAIM_SECRET_BLOCK\": \"\\[secret_block\\]\", \"TIMESTAMP\":\n\
        \                    \\[timestamp\\], \"USERNAME\": \"\\[username\\]\"}] \n\
        \ \n\
        \   CUSTOM_CHALLENGE   [\"ChallengeName\": \"CUSTOM_CHALLENGE\", \"ChallengeResponses\":\n\
        \                    {\"USERNAME\": \"\\[username\\]\", \"ANSWER\": \
         \"\\[challenge_answer\\]\"}] \n\
        \                     \n\
        \                       NEW_PASSWORD_REQUIRED   [\"ChallengeName\": \
         \"NEW_PASSWORD_REQUIRED\", \"ChallengeResponses\":\n\
        \                    {\"NEW_PASSWORD\": \"\\[new_password\\]\", \"USERNAME\":\n\
        \                \"\\[username\\]\"}] \n\
        \                                              \n\
        \                                               To set any required attributes that \
         [InitiateAuth] returned in an [requiredAttributes] parameter, add \
         [\"userAttributes.\\[attribute_name\\]\": \"\\[attribute_value\\]\"]. This parameter can \
         also set values for writable attributes that aren't required by your user pool.\n\
        \                                               \n\
        \                                                 In a [NEW_PASSWORD_REQUIRED] challenge \
         response, you can't modify a required attribute that already has a value. In \
         [AdminRespondToAuthChallenge] or [RespondToAuthChallenge], set a value for any keys that \
         Amazon Cognito returned in the [requiredAttributes] parameter, then use the \
         [AdminUpdateUserAttributes] or [UpdateUserAttributes] API operation to modify the value \
         of any additional attributes.\n\
        \                                                 \n\
        \                                                    SOFTWARE_TOKEN_MFA   \
         [\"ChallengeName\": \"SOFTWARE_TOKEN_MFA\", \"ChallengeResponses\":\n\
        \                    {\"USERNAME\": \"\\[username\\]\", \"SOFTWARE_TOKEN_MFA_CODE\":\n\
        \                    \\[authenticator_code\\]}] \n\
        \                                                                        \n\
        \                                                                          DEVICE_SRP_AUTH  \n\
        \ [\"ChallengeName\": \"DEVICE_SRP_AUTH\", \"ChallengeResponses\": {\"USERNAME\":\n\
        \                \"\\[username\\]\", \"DEVICE_KEY\": \"\\[device_key\\]\", \"SRP_A\":\n\
        \                \"\\[srp_a\\]\"}] \n\n\
        \  DEVICE_PASSWORD_VERIFIER   [\"ChallengeName\": \"DEVICE_PASSWORD_VERIFIER\", \
         \"ChallengeResponses\":\n\
        \                {\"DEVICE_KEY\": \"\\[device_key\\]\", \"PASSWORD_CLAIM_SIGNATURE\":\n\
        \                \"\\[claim_signature\\]\", \"PASSWORD_CLAIM_SECRET_BLOCK\": \
         \"\\[secret_block\\]\",\n\
        \                \"TIMESTAMP\": \\[timestamp\\], \"USERNAME\": \"\\[username\\]\"}] \n\
        \                            \n\
        \                              MFA_SETUP   [\"ChallengeName\": \"MFA_SETUP\", \
         \"ChallengeResponses\": {\"USERNAME\":\n\
        \                \"\\[username\\]\"}, \"SESSION\": \"\\[Session ID from\n\
        \                VerifySoftwareToken\\]\"] \n\
        \                                         \n\
        \                                           SELECT_MFA_TYPE   [\"ChallengeName\": \
         \"SELECT_MFA_TYPE\", \"ChallengeResponses\": {\"USERNAME\":\n\
        \                \"\\[username\\]\", \"ANSWER\": \
         \"\\[SMS_MFA|EMAIL_MFA|SOFTWARE_TOKEN_MFA\\]\"}] \n\
        \                                                            \n\
        \                                                               For more information about \
         [SECRET_HASH], see \
         {{:https://docs.aws.amazon.com/cognito/latest/developerguide/signing-up-users-in-your-app.html#cognito-user-pools-computing-secret-hash}Computing \
         secret hash values}. For information about [DEVICE_KEY], see \
         {{:https://docs.aws.amazon.com/cognito/latest/developerguide/amazon-cognito-user-pools-device-tracking.html}Working \
         with user devices in your user pool}.\n\
        \                                                               "]
  session : session_type option;
      [@ocaml.doc
        "The session identifier that maintains the state of authentication requests and challenge \
         responses. If an [AdminInitiateAuth] or [AdminRespondToAuthChallenge] API request results \
         in a determination that your application must pass another challenge, Amazon Cognito \
         returns a session with other challenge parameters. Send this session identifier, \
         unmodified, to the next [AdminRespondToAuthChallenge] request.\n"]
  analytics_metadata : analytics_metadata_type option;
      [@ocaml.doc
        "Information that supports analytics outcomes with Amazon Pinpoint, including the user's \
         endpoint ID. The endpoint ID is a destination for Amazon Pinpoint push notifications, for \
         example a device identifier, email address, or phone number.\n"]
  context_data : context_data_type option;
      [@ocaml.doc
        "Contextual data about your user session like the device fingerprint, IP address, or \
         location. Amazon Cognito threat protection evaluates the risk of an authentication event \
         based on the context that your app generates and passes to Amazon Cognito when it makes \
         API requests.\n\n\
        \ For more information, see \
         {{:https://docs.aws.amazon.com/cognito/latest/developerguide/user-pool-settings-viewing-threat-protection-app.html}Collecting \
         data for threat protection in applications}.\n\
        \ "]
  client_metadata : client_metadata_type option;
      [@ocaml.doc
        "A map of custom key-value pairs that you can provide as input for any custom workflows \
         that this action triggers. You create custom workflows by assigning Lambda functions to \
         user pool triggers.\n\n\
        \ When Amazon Cognito invokes any of these functions, it passes a JSON payload, which the \
         function receives as input. This payload contains a [clientMetadata] attribute that \
         provides the data that you assigned to the ClientMetadata parameter in your request. In \
         your function code, you can process the [clientMetadata] value to enhance your workflow \
         for your specific needs.\n\
        \ \n\
        \  To review the Lambda trigger types that Amazon Cognito invokes at runtime with API \
         requests, see \
         {{:https://docs.aws.amazon.com/cognito/latest/developerguide/cognito-user-pools-working-with-lambda-triggers.html#lambda-triggers-by-event} \
         Connecting API actions to Lambda triggers} in the {i Amazon Cognito Developer Guide}.\n\
        \  \n\
        \    When you use the [ClientMetadata] parameter, note that Amazon Cognito won't do the \
         following:\n\
        \    \n\
        \     {ul\n\
        \           {-  Store the [ClientMetadata] value. This data is available only to Lambda \
         triggers that are assigned to a user pool to support custom workflows. If your user pool \
         configuration doesn't include triggers, the [ClientMetadata] parameter serves no purpose.\n\
        \               \n\
        \                }\n\
        \           {-  Validate the [ClientMetadata] value.\n\
        \               \n\
        \                }\n\
        \           {-  Encrypt the [ClientMetadata] value. Don't send sensitive information in \
         this parameter.\n\
        \               \n\
        \                }\n\
        \           }\n\
        \   "]
}
[@@ocaml.doc "The request to respond to the authentication challenge, as an administrator.\n"]

type nonrec admin_reset_user_password_response = unit [@@ocaml.doc ""]

type nonrec admin_reset_user_password_request = {
  user_pool_id : user_pool_id_type;
      [@ocaml.doc "The ID of the user pool where you want to reset the user's password.\n"]
  username : username_type;
      [@ocaml.doc
        "The name of the user that you want to query or modify. The value of this parameter is \
         typically your user's username, but it can be any of their alias attributes. If \
         [username] isn't an alias attribute in your user pool, this value must be the [sub] of a \
         local user or the username of a user from a third-party IdP.\n"]
  client_metadata : client_metadata_type option;
      [@ocaml.doc
        "A map of custom key-value pairs that you can provide as input for any custom workflows \
         that this action triggers. You create custom workflows by assigning Lambda functions to \
         user pool triggers.\n\n\
        \ When Amazon Cognito invokes any of these functions, it passes a JSON payload, which the \
         function receives as input. This payload contains a [clientMetadata] attribute that \
         provides the data that you assigned to the ClientMetadata parameter in your request. In \
         your function code, you can process the [clientMetadata] value to enhance your workflow \
         for your specific needs.\n\
        \ \n\
        \  To review the Lambda trigger types that Amazon Cognito invokes at runtime with API \
         requests, see \
         {{:https://docs.aws.amazon.com/cognito/latest/developerguide/cognito-user-pools-working-with-lambda-triggers.html#lambda-triggers-by-event} \
         Connecting API actions to Lambda triggers} in the {i Amazon Cognito Developer Guide}.\n\
        \  \n\
        \    When you use the [ClientMetadata] parameter, note that Amazon Cognito won't do the \
         following:\n\
        \    \n\
        \     {ul\n\
        \           {-  Store the [ClientMetadata] value. This data is available only to Lambda \
         triggers that are assigned to a user pool to support custom workflows. If your user pool \
         configuration doesn't include triggers, the [ClientMetadata] parameter serves no purpose.\n\
        \               \n\
        \                }\n\
        \           {-  Validate the [ClientMetadata] value.\n\
        \               \n\
        \                }\n\
        \           {-  Encrypt the [ClientMetadata] value. Don't send sensitive information in \
         this parameter.\n\
        \               \n\
        \                }\n\
        \           }\n\
        \   "]
}
[@@ocaml.doc "Represents the request to reset a user's password as an administrator.\n"]

type nonrec admin_remove_user_from_group_request = {
  user_pool_id : user_pool_id_type;
      [@ocaml.doc
        "The ID of the user pool that contains the group and the user that you want to remove.\n"]
  username : username_type;
      [@ocaml.doc
        "The name of the user that you want to query or modify. The value of this parameter is \
         typically your user's username, but it can be any of their alias attributes. If \
         [username] isn't an alias attribute in your user pool, this value must be the [sub] of a \
         local user or the username of a user from a third-party IdP.\n"]
  group_name : group_name_type;
      [@ocaml.doc
        "The name of the group that you want to remove the user from, for example [MyTestGroup].\n"]
}
[@@ocaml.doc ""]

type nonrec event_feedback_type = {
  feedback_value : feedback_value_type;
      [@ocaml.doc
        "Your feedback to the authentication event. When you provide a [FeedbackValue] value of \
         [valid], you tell Amazon Cognito that you trust a user session where Amazon Cognito has \
         evaluated some level of risk. When you provide a [FeedbackValue] value of [invalid], you \
         tell Amazon Cognito that you don't trust a user session, or you don't believe that Amazon \
         Cognito evaluated a high-enough risk level.\n"]
  provider : string_type;
      [@ocaml.doc
        "The submitter of the event feedback. For example, if you submit event feedback in the \
         Amazon Cognito console, this value is [Admin].\n"]
  feedback_date : date_type option;
      [@ocaml.doc "The date that you or your user submitted the feedback.\n"]
}
[@@ocaml.doc
  "The feedback that your application submitted to a threat protection event log, as displayed in \
   an [AdminListUserAuthEvents] response.\n"]

type nonrec event_context_data_type = {
  ip_address : string_type option; [@ocaml.doc "The source IP address of your user's device.\n"]
  device_name : string_type option; [@ocaml.doc "The user's device name.\n"]
  timezone : string_type option; [@ocaml.doc "The user's time zone.\n"]
  city : string_type option; [@ocaml.doc "The user's city.\n"]
  country : string_type option; [@ocaml.doc "The user's country.\n"]
}
[@@ocaml.doc
  "The context data that your application submitted in an authentication request with threat \
   protection, as displayed in an [AdminListUserAuthEvents] response.\n"]

type nonrec challenge_response = Success [@ocaml.doc ""] | Failure [@ocaml.doc ""]
[@@ocaml.doc ""]

type nonrec challenge_name = Password [@ocaml.doc ""] | Mfa [@ocaml.doc ""] [@@ocaml.doc ""]

type nonrec challenge_response_type = {
  challenge_name : challenge_name option;
      [@ocaml.doc
        "The type of challenge that your previous authentication request returned in the parameter \
         [ChallengeName], for example [SMS_MFA].\n"]
  challenge_response : challenge_response option;
      [@ocaml.doc
        "The set of key-value pairs that provides a response to the requested challenge.\n"]
}
[@@ocaml.doc
  "The responses to the challenge that you received in the previous request. Each challenge has \
   its own required response parameters. The following examples are partial JSON request bodies \
   that highlight challenge-response parameters.\n\n\
  \  You must provide a SECRET_HASH parameter in all challenge responses to an app client that has \
   a client secret. Include a [DEVICE_KEY] for device authentication.\n\
  \  \n\
  \     SELECT_CHALLENGE   [\"ChallengeName\": \"SELECT_CHALLENGE\", \"ChallengeResponses\": {\n\
  \            \"USERNAME\": \"\\[username\\]\",\n\
  \            \"ANSWER\": \"\\[Challenge name\\]\"}] \n\
  \                       \n\
  \                        Available challenges are [PASSWORD], [PASSWORD_SRP], [EMAIL_OTP], \
   [SMS_OTP], and [WEB_AUTHN].\n\
  \                        \n\
  \                         Complete authentication in the [SELECT_CHALLENGE] response for \
   [PASSWORD], [PASSWORD_SRP], and [WEB_AUTHN]:\n\
  \                         \n\
  \                          {ul\n\
  \                                {-   [\"ChallengeName\": \"SELECT_CHALLENGE\", \
   \"ChallengeResponses\": {\n\
  \                  \"ANSWER\": \"WEB_AUTHN\",\n\
  \                  \"USERNAME\": \"\\[username\\]\",\n\
  \                  \"CREDENTIAL\": \"\\[AuthenticationResponseJSON\\]\"}] \n\
  \                                    \n\
  \                                     See \
   {{:https://www.w3.org/TR/WebAuthn-3/#dictdef-authenticationresponsejson} \
   AuthenticationResponseJSON}.\n\
  \                                     \n\
  \                                      }\n\
  \                                {-   [\"ChallengeName\": \"SELECT_CHALLENGE\", \
   \"ChallengeResponses\": {\n\
  \                  \"ANSWER\": \"PASSWORD\",\n\
  \                  \"USERNAME\": \"\\[username\\]\",\n\
  \                  \"PASSWORD\": \"\\[password\\]\"}] \n\
  \                                    \n\
  \                                     }\n\
  \                                {-   [\"ChallengeName\": \"SELECT_CHALLENGE\", \
   \"ChallengeResponses\": {\n\
  \                  \"ANSWER\": \"PASSWORD_SRP\",\n\
  \                  \"USERNAME\": \"\\[username\\]\",\n\
  \                  \"SRP_A\": \"\\[SRP_A\\]\"}] \n\
  \                                    \n\
  \                                     }\n\
  \                                }\n\
  \   For [SMS_OTP] and [EMAIL_OTP], respond with the username and answer. Your user pool will \
   send a code for the user to submit in the next challenge response.\n\
  \   \n\
  \    {ul\n\
  \          {-   [\"ChallengeName\": \"SELECT_CHALLENGE\", \"ChallengeResponses\": {\n\
  \                  \"ANSWER\": \"SMS_OTP\",\n\
  \                  \"USERNAME\": \"\\[username\\]\"}] \n\
  \              \n\
  \               }\n\
  \          {-   [\"ChallengeName\": \"SELECT_CHALLENGE\", \"ChallengeResponses\": {\n\
  \                  \"ANSWER\": \"EMAIL_OTP\",\n\
  \                  \"USERNAME\": \"\\[username\\]\"}] \n\
  \              \n\
  \               }\n\
  \          }\n\
  \    WEB_AUTHN   [\"ChallengeName\": \"WEB_AUTHN\", \"ChallengeResponses\": {\n\
  \                  \"USERNAME\": \"\\[username\\]\",\n\
  \                  \"CREDENTIAL\": \"\\[AuthenticationResponseJSON\\]\"}] \n\
  \               \n\
  \                See {{:https://www.w3.org/TR/WebAuthn-3/#dictdef-authenticationresponsejson} \
   AuthenticationResponseJSON}.\n\
  \                \n\
  \                  PASSWORD   [\"ChallengeName\": \"PASSWORD\", \"ChallengeResponses\": {\n\
  \                  \"USERNAME\": \"\\[username\\]\",\n\
  \                  \"PASSWORD\": \"\\[password\\]\"}] \n\
  \                            \n\
  \                              PASSWORD_SRP   [\"ChallengeName\": \"PASSWORD_SRP\", \
   \"ChallengeResponses\": {\n\
  \                  \"USERNAME\": \"\\[username\\]\",\n\
  \                  \"SRP_A\": \"\\[SRP_A\\]\"}] \n\
  \                                            \n\
  \                                              SMS_OTP   [\"ChallengeName\": \"SMS_OTP\", \
   \"ChallengeResponses\": \n\
  \            {\"SMS_OTP_CODE\": \"\\[code\\]\", \"USERNAME\": \"\\[username\\]\"}] \n\
  \                                                       \n\
  \                                                         EMAIL_OTP   [\"ChallengeName\": \
   \"EMAIL_OTP\", \"ChallengeResponses\": {\"EMAIL_OTP_CODE\":\n\
  \                    \"\\[code\\]\", \"USERNAME\": \"\\[username\\]\"}] \n\
  \                                                                    \n\
  \                                                                      SMS_MFA   \
   [\"ChallengeName\": \"SMS_MFA\", \"ChallengeResponses\": {\"SMS_MFA_CODE\":\n\
  \                    \"\\[code\\]\", \"USERNAME\": \"\\[username\\]\"}] \n\
  \                                                                               \n\
  \                                                                                 \
   PASSWORD_VERIFIER  \n\
   This challenge response is part of the SRP flow. Amazon Cognito requires that your application \
   respond to this challenge within a few seconds. When the response time exceeds this period, \
   your user pool returns a [NotAuthorizedException] error.\n\n\
  \  [\"ChallengeName\": \"PASSWORD_VERIFIER\", \"ChallengeResponses\":\n\
  \                    {\"PASSWORD_CLAIM_SIGNATURE\": \"\\[claim_signature\\]\",\n\
  \                    \"PASSWORD_CLAIM_SECRET_BLOCK\": \"\\[secret_block\\]\", \"TIMESTAMP\":\n\
  \                    \\[timestamp\\], \"USERNAME\": \"\\[username\\]\"}] \n\
  \ \n\
  \   CUSTOM_CHALLENGE   [\"ChallengeName\": \"CUSTOM_CHALLENGE\", \"ChallengeResponses\":\n\
  \                    {\"USERNAME\": \"\\[username\\]\", \"ANSWER\": \"\\[challenge_answer\\]\"}] \n\
  \                     \n\
  \                       NEW_PASSWORD_REQUIRED   [\"ChallengeName\": \"NEW_PASSWORD_REQUIRED\", \
   \"ChallengeResponses\":\n\
  \                    {\"NEW_PASSWORD\": \"\\[new_password\\]\", \"USERNAME\":\n\
  \                \"\\[username\\]\"}] \n\
  \                                              \n\
  \                                               To set any required attributes that \
   [InitiateAuth] returned in an [requiredAttributes] parameter, add \
   [\"userAttributes.\\[attribute_name\\]\": \"\\[attribute_value\\]\"]. This parameter can also \
   set values for writable attributes that aren't required by your user pool.\n\
  \                                               \n\
  \                                                 In a [NEW_PASSWORD_REQUIRED] challenge \
   response, you can't modify a required attribute that already has a value. In \
   [AdminRespondToAuthChallenge] or [RespondToAuthChallenge], set a value for any keys that Amazon \
   Cognito returned in the [requiredAttributes] parameter, then use the \
   [AdminUpdateUserAttributes] or [UpdateUserAttributes] API operation to modify the value of any \
   additional attributes.\n\
  \                                                 \n\
  \                                                    SOFTWARE_TOKEN_MFA   [\"ChallengeName\": \
   \"SOFTWARE_TOKEN_MFA\", \"ChallengeResponses\":\n\
  \                    {\"USERNAME\": \"\\[username\\]\", \"SOFTWARE_TOKEN_MFA_CODE\":\n\
  \                    \\[authenticator_code\\]}] \n\
  \                                                                        \n\
  \                                                                          DEVICE_SRP_AUTH  \n\
  \ [\"ChallengeName\": \"DEVICE_SRP_AUTH\", \"ChallengeResponses\": {\"USERNAME\":\n\
  \                \"\\[username\\]\", \"DEVICE_KEY\": \"\\[device_key\\]\", \"SRP_A\":\n\
  \                \"\\[srp_a\\]\"}] \n\n\
  \  DEVICE_PASSWORD_VERIFIER   [\"ChallengeName\": \"DEVICE_PASSWORD_VERIFIER\", \
   \"ChallengeResponses\":\n\
  \                {\"DEVICE_KEY\": \"\\[device_key\\]\", \"PASSWORD_CLAIM_SIGNATURE\":\n\
  \                \"\\[claim_signature\\]\", \"PASSWORD_CLAIM_SECRET_BLOCK\": \
   \"\\[secret_block\\]\",\n\
  \                \"TIMESTAMP\": \\[timestamp\\], \"USERNAME\": \"\\[username\\]\"}] \n\
  \                            \n\
  \                              MFA_SETUP   [\"ChallengeName\": \"MFA_SETUP\", \
   \"ChallengeResponses\": {\"USERNAME\":\n\
  \                \"\\[username\\]\"}, \"SESSION\": \"\\[Session ID from\n\
  \                VerifySoftwareToken\\]\"] \n\
  \                                         \n\
  \                                           SELECT_MFA_TYPE   [\"ChallengeName\": \
   \"SELECT_MFA_TYPE\", \"ChallengeResponses\": {\"USERNAME\":\n\
  \                \"\\[username\\]\", \"ANSWER\": \"\\[SMS_MFA|EMAIL_MFA|SOFTWARE_TOKEN_MFA\\]\"}] \n\
  \                                                            \n\
  \                                                               For more information about \
   [SECRET_HASH], see \
   {{:https://docs.aws.amazon.com/cognito/latest/developerguide/signing-up-users-in-your-app.html#cognito-user-pools-computing-secret-hash}Computing \
   secret hash values}. For information about [DEVICE_KEY], see \
   {{:https://docs.aws.amazon.com/cognito/latest/developerguide/amazon-cognito-user-pools-device-tracking.html}Working \
   with user devices in your user pool}.\n\
  \                                                               "]

type nonrec challenge_response_list_type = challenge_response_type list [@@ocaml.doc ""]

type nonrec risk_level_type = Low [@ocaml.doc ""] | Medium [@ocaml.doc ""] | High [@ocaml.doc ""]
[@@ocaml.doc ""]

type nonrec risk_decision_type =
  | NoRisk [@ocaml.doc ""]
  | AccountTakeover [@ocaml.doc ""]
  | Block [@ocaml.doc ""]
[@@ocaml.doc ""]

type nonrec event_risk_type = {
  risk_decision : risk_decision_type option;
      [@ocaml.doc
        "The action taken by adaptive authentication. If [NoRisk], your user pool took no action. \
         If [AccountTakeover], your user pool applied the adaptive authentication automated \
         response that you configured. If [Block], your user pool prevented the attempt.\n"]
  risk_level : risk_level_type option;
      [@ocaml.doc
        "The risk level that adaptive authentication assessed for the authentication event.\n"]
  compromised_credentials_detected : wrapped_boolean_type option;
      [@ocaml.doc
        "Indicates whether compromised credentials were detected during an authentication event.\n"]
}
[@@ocaml.doc
  "The risk evaluation by adaptive authentication, as displayed in an [AdminListUserAuthEvents] \
   response. Contains evaluations of compromised-credentials detection and assessed risk level and \
   action taken by adaptive authentication.\n"]

type nonrec event_response_type =
  | Pass [@ocaml.doc ""]
  | Fail [@ocaml.doc ""]
  | InProgress [@ocaml.doc ""]
[@@ocaml.doc ""]

type nonrec event_type =
  | SignIn [@ocaml.doc ""]
  | SignUp [@ocaml.doc ""]
  | ForgotPassword [@ocaml.doc ""]
  | PasswordChange [@ocaml.doc ""]
  | ResendCode [@ocaml.doc ""]
[@@ocaml.doc ""]

type nonrec auth_event_type = {
  event_id : string_type option; [@ocaml.doc "The event ID.\n"]
  event_type : event_type option; [@ocaml.doc "The type of authentication event.\n"]
  creation_date : date_type option;
      [@ocaml.doc
        "The date and time when the item was created. Amazon Cognito returns this timestamp in \
         UNIX epoch time format. Your SDK might render the output in a human-readable format like \
         ISO 8601 or a Java [Date] object.\n"]
  event_response : event_response_type option; [@ocaml.doc "The event response.\n"]
  event_risk : event_risk_type option;
      [@ocaml.doc
        "The threat evaluation from your user pool about an event. Contains information about \
         whether your user pool detected compromised credentials, whether the event triggered an \
         automated response, and the level of risk.\n"]
  challenge_responses : challenge_response_list_type option;
      [@ocaml.doc
        "A list of the challenges that the user was requested to answer, for example [Password], \
         and the result, for example [Success].\n"]
  event_context_data : event_context_data_type option;
      [@ocaml.doc
        "The user context data captured at the time of an event request. This value provides \
         additional information about the client from which event the request is received.\n"]
  event_feedback : event_feedback_type option;
      [@ocaml.doc
        "The [UpdateAuthEventFeedback] or [AdminUpdateAuthEventFeedback] feedback that you or your \
         user provided in response to the event. A value of [Valid] indicates that you disagreed \
         with the level of risk that your user pool assigned, and evaluated a session to be valid, \
         or likely safe. A value of [Invalid] indicates that you agreed with the user pool risk \
         level and evaluated a session to be invalid, or likely malicious.\n"]
}
[@@ocaml.doc
  "One authentication event that Amazon Cognito logged in a user pool with threat protection \
   active. Contains user and device metadata and a risk assessment from your user pool.\n"]

type nonrec auth_events_type = auth_event_type list [@@ocaml.doc ""]

type nonrec admin_list_user_auth_events_response = {
  auth_events : auth_events_type option;
      [@ocaml.doc
        "The response object. It includes the [EventID], [EventType], [CreationDate], [EventRisk], \
         and [EventResponse].\n"]
  next_token : pagination_key option;
      [@ocaml.doc
        "The identifier that Amazon Cognito returned with the previous request to this operation. \
         When you include a pagination token in your request, Amazon Cognito returns the next set \
         of items in the list. By use of this token, you can paginate through the full list of \
         items.\n"]
}
[@@ocaml.doc ""]

type nonrec admin_list_user_auth_events_request = {
  user_pool_id : user_pool_id_type;
      [@ocaml.doc
        "The Id of the user pool that contains the user profile with the logged events.\n"]
  username : username_type;
      [@ocaml.doc
        "The name of the user that you want to query or modify. The value of this parameter is \
         typically your user's username, but it can be any of their alias attributes. If \
         [username] isn't an alias attribute in your user pool, this value must be the [sub] of a \
         local user or the username of a user from a third-party IdP.\n"]
  max_results : query_limit_type option;
      [@ocaml.doc
        "The maximum number of authentication events to return. Returns 60 events if you set \
         [MaxResults] to 0, or if you don't include a [MaxResults] parameter.\n"]
  next_token : pagination_key option;
      [@ocaml.doc
        "This API operation returns a limited number of results. The pagination token is an \
         identifier that you can present in an additional API request with the same parameters. \
         When you include the pagination token, Amazon Cognito returns the next set of items after \
         the current list. Subsequent requests return a new pagination token. By use of this \
         token, you can paginate through the full list of items.\n"]
}
[@@ocaml.doc ""]

type nonrec admin_list_groups_for_user_response = {
  groups : group_list_type option; [@ocaml.doc "An array of groups and information about them.\n"]
  next_token : pagination_key option;
      [@ocaml.doc
        "The identifier that Amazon Cognito returned with the previous request to this operation. \
         When you include a pagination token in your request, Amazon Cognito returns the next set \
         of items in the list. By use of this token, you can paginate through the full list of \
         items.\n"]
}
[@@ocaml.doc ""]

type nonrec admin_list_groups_for_user_request = {
  username : username_type;
      [@ocaml.doc
        "The name of the user that you want to query or modify. The value of this parameter is \
         typically your user's username, but it can be any of their alias attributes. If \
         [username] isn't an alias attribute in your user pool, this value must be the [sub] of a \
         local user or the username of a user from a third-party IdP.\n"]
  user_pool_id : user_pool_id_type;
      [@ocaml.doc "The ID of the user pool where you want to view a user's groups.\n"]
  limit : query_limit_type option;
      [@ocaml.doc
        "The maximum number of groups that you want Amazon Cognito to return in the response.\n"]
  next_token : pagination_key option;
      [@ocaml.doc
        "This API operation returns a limited number of results. The pagination token is an \
         identifier that you can present in an additional API request with the same parameters. \
         When you include the pagination token, Amazon Cognito returns the next set of items after \
         the current list. Subsequent requests return a new pagination token. By use of this \
         token, you can paginate through the full list of items.\n"]
}
[@@ocaml.doc ""]

type nonrec admin_list_devices_response = {
  devices : device_list_type option;
      [@ocaml.doc
        "An array of devices and their information. Each entry that's returned includes device \
         information, last-accessed and created dates, and the device key.\n"]
  pagination_token : search_pagination_token_type option;
      [@ocaml.doc
        "The identifier that Amazon Cognito returned with the previous request to this operation. \
         When you include a pagination token in your request, Amazon Cognito returns the next set \
         of items in the list. By use of this token, you can paginate through the full list of \
         items.\n"]
}
[@@ocaml.doc "Lists the device's response, as an administrator.\n"]

type nonrec admin_list_devices_request = {
  user_pool_id : user_pool_id_type;
      [@ocaml.doc "The ID of the user pool where the device owner is a user.\n"]
  username : username_type;
      [@ocaml.doc
        "The name of the user that you want to query or modify. The value of this parameter is \
         typically your user's username, but it can be any of their alias attributes. If \
         [username] isn't an alias attribute in your user pool, this value must be the [sub] of a \
         local user or the username of a user from a third-party IdP.\n"]
  limit : query_limit_type option;
      [@ocaml.doc
        "The maximum number of devices that you want Amazon Cognito to return in the response.\n"]
  pagination_token : search_pagination_token_type option;
      [@ocaml.doc
        "This API operation returns a limited number of results. The pagination token is an \
         identifier that you can present in an additional API request with the same parameters. \
         When you include the pagination token, Amazon Cognito returns the next set of items after \
         the current list. Subsequent requests return a new pagination token. By use of this \
         token, you can paginate through the full list of items.\n"]
}
[@@ocaml.doc "Represents the request to list devices, as an administrator.\n"]

type nonrec admin_link_provider_for_user_response = unit [@@ocaml.doc ""]

type nonrec provider_user_identifier_type = {
  provider_name : provider_name_type option;
      [@ocaml.doc "The name of the provider, such as Facebook, Google, or Login with Amazon.\n"]
  provider_attribute_name : string_type option;
      [@ocaml.doc "The name of the provider attribute to link to, such as [NameID].\n"]
  provider_attribute_value : string_type option;
      [@ocaml.doc "The value of the provider attribute to link to, such as [xxxxx_account].\n"]
}
[@@ocaml.doc
  "The characteristics of a source or destination user for linking a federated user profile to a \
   local user profile.\n"]

type nonrec admin_link_provider_for_user_request = {
  user_pool_id : string_type;
      [@ocaml.doc "The ID of the user pool where you want to link a federated identity.\n"]
  destination_user : provider_user_identifier_type;
      [@ocaml.doc
        "The existing user in the user pool that you want to assign to the external IdP user \
         account. This user can be a local (Username + Password) Amazon Cognito user pools user or \
         a federated user (for example, a SAML or Facebook user). If the user doesn't exist, \
         Amazon Cognito generates an exception. Amazon Cognito returns this user when the new user \
         (with the linked IdP attribute) signs in.\n\n\
        \ For a native username + password user, the [ProviderAttributeValue] for the \
         [DestinationUser] should be the username in the user pool. For a federated user, it \
         should be the provider-specific [user_id].\n\
        \ \n\
        \  The [ProviderAttributeName] of the [DestinationUser] is ignored.\n\
        \  \n\
        \   The [ProviderName] should be set to [Cognito] for users in Cognito user pools.\n\
        \   \n\
        \     All attributes in the DestinationUser profile must be mutable. If you have assigned \
         the user any immutable custom attributes, the operation won't succeed.\n\
        \     \n\
        \      "]
  source_user : provider_user_identifier_type;
      [@ocaml.doc
        "An external IdP account for a user who doesn't exist yet in the user pool. This user must \
         be a federated user (for example, a SAML or Facebook user), not another native user.\n\n\
        \ If the [SourceUser] is using a federated social IdP, such as Facebook, Google, or Login \
         with Amazon, you must set the [ProviderAttributeName] to [Cognito_Subject]. For social \
         IdPs, the [ProviderName] will be [Facebook], [Google], or [LoginWithAmazon], and Amazon \
         Cognito will automatically parse the Facebook, Google, and Login with Amazon tokens for \
         [id], [sub], and [user_id], respectively. The [ProviderAttributeValue] for the user must \
         be the same value as the [id], [sub], or [user_id] value found in the social IdP token.\n\
        \ \n\
        \  For OIDC, the [ProviderAttributeName] can be any mapped value from a claim in the ID \
         token, or that your app retrieves from the [userInfo] endpoint. For SAML, the \
         [ProviderAttributeName] can be any mapped value from a claim in the SAML assertion.\n\
        \  \n\
        \   The following additional considerations apply to [SourceUser] for OIDC and SAML \
         providers.\n\
        \   \n\
        \    {ul\n\
        \          {-  You must map the claim to a user pool attribute in your IdP configuration, \
         and set the user pool attribute name as the value of [ProviderAttributeName] in your \
         [AdminLinkProviderForUser] request. For example, [email].\n\
        \              \n\
        \               }\n\
        \          {-  When you set [ProviderAttributeName] to [Cognito_Subject], Amazon Cognito \
         will automatically parse the default unique identifier found in the subject from the IdP \
         token.\n\
        \              \n\
        \               }\n\
        \          }\n\
        \  "]
}
[@@ocaml.doc ""]

type nonrec admin_initiate_auth_response = {
  challenge_name : challenge_name_type option;
      [@ocaml.doc
        "The name of the challenge that you're responding to with this call. This is returned in \
         the [AdminInitiateAuth] response if you must pass another challenge.\n\n\
        \ Possible challenges include the following:\n\
        \ \n\
        \   All of the following challenges require [USERNAME] and, when the app client has a \
         client secret, [SECRET_HASH] in the parameters. Include a [DEVICE_KEY] for device \
         authentication.\n\
        \   \n\
        \     {ul\n\
        \           {-   [WEB_AUTHN]: Respond to the challenge with the results of a successful \
         authentication with a WebAuthn authenticator, or passkey, as [CREDENTIAL]. Examples of \
         WebAuthn authenticators include biometric devices and security keys.\n\
        \               \n\
        \                }\n\
        \           {-   [PASSWORD]: Respond with the user's password as [PASSWORD].\n\
        \               \n\
        \                }\n\
        \           {-   [PASSWORD_SRP]: Respond with the initial SRP secret as [SRP_A].\n\
        \               \n\
        \                }\n\
        \           {-   [SELECT_CHALLENGE]: Respond with a challenge selection as [ANSWER]. It \
         must be one of the challenge types in the [AvailableChallenges] response parameter. Add \
         the parameters of the selected challenge, for example [USERNAME] and [SMS_OTP].\n\
        \               \n\
        \                }\n\
        \           {-   [SMS_MFA]: Respond with the code that your user pool delivered in an SMS \
         message, as [SMS_MFA_CODE] \n\
        \               \n\
        \                }\n\
        \           {-   [EMAIL_MFA]: Respond with the code that your user pool delivered in an \
         email message, as [EMAIL_MFA_CODE] \n\
        \               \n\
        \                }\n\
        \           {-   [EMAIL_OTP]: Respond with the code that your user pool delivered in an \
         email message, as [EMAIL_OTP_CODE] .\n\
        \               \n\
        \                }\n\
        \           {-   [SMS_OTP]: Respond with the code that your user pool delivered in an SMS \
         message, as [SMS_OTP_CODE].\n\
        \               \n\
        \                }\n\
        \           {-   [PASSWORD_VERIFIER]: Respond with the second stage of SRP secrets as \
         [PASSWORD_CLAIM_SIGNATURE], [PASSWORD_CLAIM_SECRET_BLOCK], and [TIMESTAMP].\n\
        \               \n\
        \                }\n\
        \           {-   [CUSTOM_CHALLENGE]: This is returned if your custom authentication flow \
         determines that the user should pass another challenge before tokens are issued. The \
         parameters of the challenge are determined by your Lambda function and issued in the \
         [ChallengeParameters] of a challenge response.\n\
        \               \n\
        \                }\n\
        \           {-   [DEVICE_SRP_AUTH]: Respond with the initial parameters of device SRP \
         authentication. For more information, see \
         {{:https://docs.aws.amazon.com/cognito/latest/developerguide/amazon-cognito-user-pools-device-tracking.html#user-pools-remembered-devices-signing-in-with-a-device}Signing \
         in with a device}.\n\
        \               \n\
        \                }\n\
        \           {-   [DEVICE_PASSWORD_VERIFIER]: Respond with [PASSWORD_CLAIM_SIGNATURE], \
         [PASSWORD_CLAIM_SECRET_BLOCK], and [TIMESTAMP] after client-side SRP calculations. For \
         more information, see \
         {{:https://docs.aws.amazon.com/cognito/latest/developerguide/amazon-cognito-user-pools-device-tracking.html#user-pools-remembered-devices-signing-in-with-a-device}Signing \
         in with a device}.\n\
        \               \n\
        \                }\n\
        \           {-   [NEW_PASSWORD_REQUIRED]: For users who are required to change their \
         passwords after successful first login. Respond to this challenge with [NEW_PASSWORD] and \
         any required attributes that Amazon Cognito returned in the [requiredAttributes] \
         parameter. You can also set values for attributes that aren't required by your user pool \
         and that your app client can write.\n\
        \               \n\
        \                Amazon Cognito only returns this challenge for users who have temporary \
         passwords. When you create passwordless users, you must provide values for all required \
         attributes.\n\
        \                \n\
        \                  In a [NEW_PASSWORD_REQUIRED] challenge response, you can't modify a \
         required attribute that already has a value. In [AdminRespondToAuthChallenge] or \
         [RespondToAuthChallenge], set a value for any keys that Amazon Cognito returned in the \
         [requiredAttributes] parameter, then use the [AdminUpdateUserAttributes] or \
         [UpdateUserAttributes] API operation to modify the value of any additional attributes.\n\
        \                  \n\
        \                    }\n\
        \           {-   [MFA_SETUP]: For users who are required to setup an MFA factor before \
         they can sign in. The MFA types activated for the user pool will be listed in the \
         challenge parameters [MFAS_CAN_SETUP] value. \n\
        \               \n\
        \                To set up time-based one-time password (TOTP) MFA, use the session \
         returned in this challenge from [InitiateAuth] or [AdminInitiateAuth] as an input to \
         [AssociateSoftwareToken]. Then, use the session returned by [VerifySoftwareToken] as an \
         input to [RespondToAuthChallenge] or [AdminRespondToAuthChallenge] with challenge name \
         [MFA_SETUP] to complete sign-in. \n\
        \                \n\
        \                 To set up SMS or email MFA, collect a [phone_number] or [email] \
         attribute for the user. Then restart the authentication flow with an [InitiateAuth] or \
         [AdminInitiateAuth] request. \n\
        \                 \n\
        \                  }\n\
        \           }\n\
        \  "]
  session : session_type option;
      [@ocaml.doc
        "The session that must be passed to challenge-response requests. If an [AdminInitiateAuth] \
         or [AdminRespondToAuthChallenge] API request results in another authentication challenge, \
         Amazon Cognito returns a session ID and the parameters of the next challenge. Pass this \
         session ID in the [Session] parameter of [AdminRespondToAuthChallenge].\n"]
  challenge_parameters : challenge_parameters_type option;
      [@ocaml.doc
        "The parameters of an authentication challenge. Amazon Cognito returns challenge \
         parameters as a guide to the responses your user or application must provide for the \
         returned [ChallengeName]. Calculate responses to the challenge parameters and pass them \
         in the [ChallengeParameters] of [AdminRespondToAuthChallenge].\n\n\
        \ All challenges require [USERNAME] and, when the app client has a client secret, \
         [SECRET_HASH].\n\
        \ \n\
        \  In SRP challenges, Amazon Cognito returns the [username] attribute in [USER_ID_FOR_SRP] \
         instead of any email address, preferred username, or phone number alias that you might \
         have specified in your [AdminInitiateAuth] request. You must use the username and not an \
         alias in the [ChallengeResponses] of your challenge response.\n\
        \  "]
  authentication_result : authentication_result_type option;
      [@ocaml.doc
        "The outcome of successful authentication. This is only returned if the user pool has no \
         additional challenges to return. If Amazon Cognito returns another challenge, the \
         response includes [ChallengeName], [ChallengeParameters], and [Session] so that your user \
         can answer the challenge.\n"]
  available_challenges : available_challenge_list_type option;
      [@ocaml.doc
        "This response parameter lists the available authentication challenges that users can \
         select from in \
         {{:https://docs.aws.amazon.com/cognito/latest/developerguide/authentication-flows-selection-sdk.html#authentication-flows-selection-choice}choice-based \
         authentication}. For example, they might be able to choose between passkey \
         authentication, a one-time password from an SMS message, and a traditional password.\n"]
}
[@@ocaml.doc "Initiates the authentication response, as an administrator.\n"]

type nonrec admin_initiate_auth_request = {
  user_pool_id : user_pool_id_type;
      [@ocaml.doc "The ID of the user pool where the user wants to sign in.\n"]
  client_id : client_id_type;
      [@ocaml.doc "The ID of the app client where the user wants to sign in.\n"]
  auth_flow : auth_flow_type;
      [@ocaml.doc
        "The authentication flow that you want to initiate. Each [AuthFlow] has linked \
         [AuthParameters] that you must submit. The following are some example flows.\n\n\
        \  USER_AUTH  The entry point for \
         {{:https://docs.aws.amazon.com/cognito/latest/developerguide/authentication-flows-selection-sdk.html#authentication-flows-selection-choice}choice-based \
         authentication} with passwords, one-time passwords, and WebAuthn authenticators. Request \
         a preferred authentication type or review available authentication types. From the \
         offered authentication types, select one in a challenge response and then authenticate \
         with that method in an additional challenge response. To activate this setting, your user \
         pool must be in the \
         {{:https://docs.aws.amazon.com/cognito/latest/developerguide/feature-plans-features-essentials.html} \
         Essentials tier} or higher.\n\
        \             \n\
        \               USER_SRP_AUTH  Username-password authentication with the Secure Remote \
         Password (SRP) protocol. For more information, see \
         {{:https://docs.aws.amazon.com/cognito/latest/developerguide/amazon-cognito-user-pools-authentication-flow.html#Using-SRP-password-verification-in-custom-authentication-flow}Use \
         SRP password verification in custom authentication flow}.\n\
        \                              \n\
        \                                REFRESH_TOKEN_AUTH and REFRESH_TOKEN  Receive new ID and \
         access tokens when you pass a [REFRESH_TOKEN] parameter with a valid refresh token as the \
         value. For more information, see \
         {{:https://docs.aws.amazon.com/cognito/latest/developerguide/amazon-cognito-user-pools-using-the-refresh-token.html}Using \
         the refresh token}.\n\
        \                                                                      \n\
        \                                                                        CUSTOM_AUTH  \n\
         Custom authentication with Lambda triggers. For more information, see \
         {{:https://docs.aws.amazon.com/cognito/latest/developerguide/user-pool-lambda-challenge.html}Custom \
         authentication challenge Lambda triggers}.\n\n\
        \  ADMIN_USER_PASSWORD_AUTH  Server-side username-password authentication with the \
         password sent directly in the request. For more information about client-side and \
         server-side authentication, see \
         {{:https://docs.aws.amazon.com/cognito/latest/developerguide/authentication-flows-public-server-side.html}SDK \
         authorization models}.\n\
        \                            \n\
        \                              "]
  auth_parameters : auth_parameters_type option;
      [@ocaml.doc
        "The authentication parameters. These are inputs corresponding to the [AuthFlow] that \
         you're invoking.\n\n\
        \ The following are some authentication flows and their parameters. Add a [SECRET_HASH] \
         parameter if your app client has a client secret. Add [DEVICE_KEY] if you want to bypass \
         multi-factor authentication with a remembered device. \n\
        \ \n\
        \   USER_AUTH  {ul\n\
        \                    {-   [USERNAME] (required)\n\
        \                        \n\
        \                         }\n\
        \                    {-   [PREFERRED_CHALLENGE]. If you don't provide a value for \
         [PREFERRED_CHALLENGE], Amazon Cognito responds with the [AvailableChallenges] parameter \
         that specifies the available sign-in methods.\n\
        \                        \n\
        \                         }\n\
        \                    }  USER_SRP_AUTH  {ul\n\
        \                                            {-   [USERNAME] (required)\n\
        \                                                \n\
        \                                                 }\n\
        \                                            {-   [SRP_A] (required)\n\
        \                                                \n\
        \                                                 }\n\
        \                                            }\n\
        \    ADMIN_USER_PASSWORD_AUTH  {ul\n\
        \                                    {-   [USERNAME] (required)\n\
        \                                        \n\
        \                                         }\n\
        \                                    {-   [PASSWORD] (required)\n\
        \                                        \n\
        \                                         }\n\
        \                                    }\n\
        \    REFRESH_TOKEN_AUTH/REFRESH_TOKEN  {ul\n\
        \                                            {-   [REFRESH_TOKEN](required)\n\
        \                                                \n\
        \                                                 }\n\
        \                                            }\n\
        \    CUSTOM_AUTH  {ul\n\
        \                       {-   [USERNAME] (required)\n\
        \                           \n\
        \                            }\n\
        \                       {-   [ChallengeName: SRP_A] (when preceding custom authentication \
         with SRP authentication)\n\
        \                           \n\
        \                            }\n\
        \                       {-   [SRP_A: (An SRP_A value)] (when preceding custom \
         authentication with SRP authentication)\n\
        \                           \n\
        \                            }\n\
        \                       }\n\
        \     For more information about [SECRET_HASH], see \
         {{:https://docs.aws.amazon.com/cognito/latest/developerguide/signing-up-users-in-your-app.html#cognito-user-pools-computing-secret-hash}Computing \
         secret hash values}. For information about [DEVICE_KEY], see \
         {{:https://docs.aws.amazon.com/cognito/latest/developerguide/amazon-cognito-user-pools-device-tracking.html}Working \
         with user devices in your user pool}.\n\
        \     "]
  client_metadata : client_metadata_type option;
      [@ocaml.doc
        "A map of custom key-value pairs that you can provide as input for any custom workflows \
         that this action triggers. You create custom workflows by assigning Lambda functions to \
         user pool triggers.\n\n\
        \ When Amazon Cognito invokes any of these functions, it passes a JSON payload, which the \
         function receives as input. This payload contains a [clientMetadata] attribute that \
         provides the data that you assigned to the ClientMetadata parameter in your request. In \
         your function code, you can process the [clientMetadata] value to enhance your workflow \
         for your specific needs.\n\
        \ \n\
        \  To review the Lambda trigger types that Amazon Cognito invokes at runtime with API \
         requests, see \
         {{:https://docs.aws.amazon.com/cognito/latest/developerguide/cognito-user-pools-working-with-lambda-triggers.html#lambda-triggers-by-event} \
         Connecting API actions to Lambda triggers} in the {i Amazon Cognito Developer Guide}.\n\
        \  \n\
        \   The [ClientMetadata] value is passed as input to the functions for only the following \
         triggers:\n\
        \   \n\
        \    {ul\n\
        \          {-  Pre signup\n\
        \              \n\
        \               }\n\
        \          {-  Pre authentication\n\
        \              \n\
        \               }\n\
        \          {-  User migration\n\
        \              \n\
        \               }\n\
        \          }\n\
        \   This request also invokes the functions for the following triggers, but doesn't pass \
         [ClientMetadata]:\n\
        \   \n\
        \    {ul\n\
        \          {-  Post authentication\n\
        \              \n\
        \               }\n\
        \          {-  Custom message\n\
        \              \n\
        \               }\n\
        \          {-  Pre token generation\n\
        \              \n\
        \               }\n\
        \          {-  Create auth challenge\n\
        \              \n\
        \               }\n\
        \          {-  Define auth challenge\n\
        \              \n\
        \               }\n\
        \          {-  Custom email sender\n\
        \              \n\
        \               }\n\
        \          {-  Custom SMS sender\n\
        \              \n\
        \               }\n\
        \          }\n\
        \    When you use the [ClientMetadata] parameter, note that Amazon Cognito won't do the \
         following:\n\
        \    \n\
        \     {ul\n\
        \           {-  Store the [ClientMetadata] value. This data is available only to Lambda \
         triggers that are assigned to a user pool to support custom workflows. If your user pool \
         configuration doesn't include triggers, the [ClientMetadata] parameter serves no purpose.\n\
        \               \n\
        \                }\n\
        \           {-  Validate the [ClientMetadata] value.\n\
        \               \n\
        \                }\n\
        \           {-  Encrypt the [ClientMetadata] value. Don't send sensitive information in \
         this parameter.\n\
        \               \n\
        \                }\n\
        \           }\n\
        \   "]
  analytics_metadata : analytics_metadata_type option;
      [@ocaml.doc
        "Information that supports analytics outcomes with Amazon Pinpoint, including the user's \
         endpoint ID. The endpoint ID is a destination for Amazon Pinpoint push notifications, for \
         example a device identifier, email address, or phone number.\n"]
  context_data : context_data_type option;
      [@ocaml.doc
        "Contextual data about your user session like the device fingerprint, IP address, or \
         location. Amazon Cognito threat protection evaluates the risk of an authentication event \
         based on the context that your app generates and passes to Amazon Cognito when it makes \
         API requests.\n\n\
        \ For more information, see \
         {{:https://docs.aws.amazon.com/cognito/latest/developerguide/user-pool-settings-viewing-threat-protection-app.html}Collecting \
         data for threat protection in applications}.\n\
        \ "]
  session : session_type option;
      [@ocaml.doc
        "The optional session ID from a [ConfirmSignUp] API request. You can sign in a user \
         directly from the sign-up process with an [AuthFlow] of [USER_AUTH] and [AuthParameters] \
         of [EMAIL_OTP] or [SMS_OTP], depending on how your user pool sent the confirmation-code \
         message.\n"]
}
[@@ocaml.doc "Initiates the authorization request, as an administrator.\n"]

type nonrec admin_get_user_response = {
  username : username_type; [@ocaml.doc "The username of the user that you requested.\n"]
  user_attributes : attribute_list_type option;
      [@ocaml.doc
        "An array of name-value pairs of user attributes and their values, for example [\"email\": \
         \"testuser@example.com\"].\n"]
  user_create_date : date_type option;
      [@ocaml.doc
        "The date and time when the item was created. Amazon Cognito returns this timestamp in \
         UNIX epoch time format. Your SDK might render the output in a human-readable format like \
         ISO 8601 or a Java [Date] object.\n"]
  user_last_modified_date : date_type option;
      [@ocaml.doc
        "The date and time when the item was modified. Amazon Cognito returns this timestamp in \
         UNIX epoch time format. Your SDK might render the output in a human-readable format like \
         ISO 8601 or a Java [Date] object.\n"]
  enabled : boolean_type option;
      [@ocaml.doc "Indicates whether the user is activated for sign-in.\n"]
  user_status : user_status_type option;
      [@ocaml.doc
        "The user's status. Can be one of the following:\n\n\
        \ {ul\n\
        \       {-  UNCONFIRMED - User has been created but not confirmed.\n\
        \           \n\
        \            }\n\
        \       {-  CONFIRMED - User has been confirmed.\n\
        \           \n\
        \            }\n\
        \       {-  UNKNOWN - User status isn't known.\n\
        \           \n\
        \            }\n\
        \       {-  RESET_REQUIRED - User is confirmed, but the user must request a code and reset \
         their password before they can sign in.\n\
        \           \n\
        \            }\n\
        \       {-  FORCE_CHANGE_PASSWORD - The user is confirmed and the user can sign in using a \
         temporary password, but on first sign-in, the user must change their password to a new \
         value before doing anything else. \n\
        \           \n\
        \            }\n\
        \       {-  EXTERNAL_PROVIDER - The user signed in with a third-party identity provider.\n\
        \           \n\
        \            }\n\
        \       }\n\
        \  "]
  mfa_options : mfa_option_list_type option;
      [@ocaml.doc
        " {i This response parameter is no longer supported.} It provides information only about \
         SMS MFA configurations. It doesn't provide information about time-based one-time password \
         (TOTP) software token MFA configurations. To look up information about either type of MFA \
         configuration, use UserMFASettingList instead.\n"]
  preferred_mfa_setting : string_type option;
      [@ocaml.doc
        "The user's preferred MFA. Users can prefer SMS message, email message, or TOTP MFA.\n"]
  user_mfa_setting_list : user_mfa_setting_list_type option;
      [@ocaml.doc
        "The MFA options that are activated for the user. The possible values in this list are \
         [SMS_MFA], [EMAIL_OTP], and [SOFTWARE_TOKEN_MFA].\n"]
}
[@@ocaml.doc
  "Represents the response from the server from the request to get the specified user as an \
   administrator.\n"]

type nonrec admin_get_user_request = {
  user_pool_id : user_pool_id_type;
      [@ocaml.doc "The ID of the user pool where you want to get information about the user.\n"]
  username : username_type;
      [@ocaml.doc
        "The name of the user that you want to query or modify. The value of this parameter is \
         typically your user's username, but it can be any of their alias attributes. If \
         [username] isn't an alias attribute in your user pool, this value must be the [sub] of a \
         local user or the username of a user from a third-party IdP.\n"]
}
[@@ocaml.doc "Represents the request to get the specified user as an administrator.\n"]

type nonrec admin_get_device_response = {
  device : device_type;
      [@ocaml.doc
        "Details of the requested device. Includes device information, last-accessed and created \
         dates, and the device key.\n"]
}
[@@ocaml.doc "Gets the device response, as an administrator.\n"]

type nonrec admin_get_device_request = {
  device_key : device_key_type; [@ocaml.doc "The key of the device that you want to delete.\n"]
  user_pool_id : user_pool_id_type;
      [@ocaml.doc "The ID of the user pool where the device owner is a user.\n"]
  username : username_type;
      [@ocaml.doc
        "The name of the user that you want to query or modify. The value of this parameter is \
         typically your user's username, but it can be any of their alias attributes. If \
         [username] isn't an alias attribute in your user pool, this value must be the [sub] of a \
         local user or the username of a user from a third-party IdP.\n"]
}
[@@ocaml.doc "Represents the request to get the device, as an administrator.\n"]

type nonrec admin_forget_device_request = {
  user_pool_id : user_pool_id_type;
      [@ocaml.doc "The ID of the user pool where the device owner is a user.\n"]
  username : username_type;
      [@ocaml.doc
        "The name of the user that you want to query or modify. The value of this parameter is \
         typically your user's username, but it can be any of their alias attributes. If \
         [username] isn't an alias attribute in your user pool, this value must be the [sub] of a \
         local user or the username of a user from a third-party IdP.\n"]
  device_key : device_key_type; [@ocaml.doc "The key ID of the device that you want to delete.\n"]
}
[@@ocaml.doc "Sends the forgot device request, as an administrator.\n"]

type nonrec admin_enable_user_response = unit [@@ocaml.doc ""]

type nonrec admin_enable_user_request = {
  user_pool_id : user_pool_id_type;
      [@ocaml.doc "The ID of the user pool where you want to activate sign-in for the user.\n"]
  username : username_type;
      [@ocaml.doc
        "The name of the user that you want to query or modify. The value of this parameter is \
         typically your user's username, but it can be any of their alias attributes. If \
         [username] isn't an alias attribute in your user pool, this value must be the [sub] of a \
         local user or the username of a user from a third-party IdP.\n"]
}
[@@ocaml.doc "Represents the request that enables the user as an administrator.\n"]

type nonrec admin_disable_user_response = unit [@@ocaml.doc ""]

type nonrec admin_disable_user_request = {
  user_pool_id : user_pool_id_type;
      [@ocaml.doc "The ID of the user pool where you want to disable the user.\n"]
  username : username_type;
      [@ocaml.doc
        "The name of the user that you want to query or modify. The value of this parameter is \
         typically your user's username, but it can be any of their alias attributes. If \
         [username] isn't an alias attribute in your user pool, this value must be the [sub] of a \
         local user or the username of a user from a third-party IdP.\n"]
}
[@@ocaml.doc "Represents the request to disable the user as an administrator.\n"]

type nonrec admin_disable_provider_for_user_response = unit [@@ocaml.doc ""]

type nonrec admin_disable_provider_for_user_request = {
  user_pool_id : string_type;
      [@ocaml.doc
        "The ID of the user pool where you want to delete the user's linked identities.\n"]
  user : provider_user_identifier_type;
      [@ocaml.doc "The user profile that you want to delete a linked identity from.\n"]
}
[@@ocaml.doc ""]

type nonrec admin_delete_user_attributes_response = unit [@@ocaml.doc ""]

type nonrec admin_delete_user_attributes_request = {
  user_pool_id : user_pool_id_type;
      [@ocaml.doc "The ID of the user pool where you want to delete user attributes.\n"]
  username : username_type;
      [@ocaml.doc
        "The name of the user that you want to query or modify. The value of this parameter is \
         typically your user's username, but it can be any of their alias attributes. If \
         [username] isn't an alias attribute in your user pool, this value must be the [sub] of a \
         local user or the username of a user from a third-party IdP.\n"]
  user_attribute_names : attribute_name_list_type;
      [@ocaml.doc
        "An array of strings representing the user attribute names you want to delete.\n\n\
        \ For custom attributes, you must prepend the [custom:] prefix to the attribute name.\n\
        \ "]
}
[@@ocaml.doc "Represents the request to delete user attributes as an administrator.\n"]

type nonrec admin_delete_user_request = {
  user_pool_id : user_pool_id_type;
      [@ocaml.doc "The ID of the user pool where you want to delete the user.\n"]
  username : username_type;
      [@ocaml.doc
        "The name of the user that you want to query or modify. The value of this parameter is \
         typically your user's username, but it can be any of their alias attributes. If \
         [username] isn't an alias attribute in your user pool, this value must be the [sub] of a \
         local user or the username of a user from a third-party IdP.\n"]
}
[@@ocaml.doc "Represents the request to delete a user as an administrator.\n"]

type nonrec unsupported_user_state_exception = {
  message : message_type option;
      [@ocaml.doc "The message returned when the user is in an unsupported state.\n"]
}
[@@ocaml.doc "The request failed because the user is in an unsupported state.\n"]

type nonrec admin_create_user_response = {
  user : user_type option; [@ocaml.doc "The new user's profile details.\n"]
}
[@@ocaml.doc "Represents the response from the server to the request to create the user.\n"]

type nonrec delivery_medium_list_type = delivery_medium_type list [@@ocaml.doc ""]

type nonrec message_action_type = RESEND [@ocaml.doc ""] | SUPPRESS [@ocaml.doc ""]
[@@ocaml.doc ""]

type nonrec admin_create_user_request = {
  user_pool_id : user_pool_id_type;
      [@ocaml.doc "The ID of the user pool where you want to create a user.\n"]
  username : username_type;
      [@ocaml.doc
        "The value that you want to set as the username sign-in attribute. The following \
         conditions apply to the username parameter.\n\n\
        \ {ul\n\
        \       {-  The username can't be a duplicate of another username in the same user pool.\n\
        \           \n\
        \            }\n\
        \       {-  You can't change the value of a username after you create it.\n\
        \           \n\
        \            }\n\
        \       {-  You can only provide a value if usernames are a valid sign-in attribute for \
         your user pool. If your user pool only supports phone numbers or email addresses as \
         sign-in attributes, Amazon Cognito automatically generates a username value. For more \
         information, see \
         {{:https://docs.aws.amazon.com/cognito/latest/developerguide/user-pool-settings-attributes.html#user-pool-settings-aliases}Customizing \
         sign-in attributes}.\n\
        \           \n\
        \            }\n\
        \       }\n\
        \  "]
  user_attributes : attribute_list_type option;
      [@ocaml.doc
        "An array of name-value pairs that contain user attributes and attribute values to be set \
         for the user to be created. You can create a user without specifying any attributes other \
         than [Username]. However, any attributes that you specify as required (when creating a \
         user pool or in the {b Attributes} tab of the console) either you should supply (in your \
         call to [AdminCreateUser]) or the user should supply (when they sign up in response to \
         your welcome message).\n\n\
        \ For custom attributes, you must prepend the [custom:] prefix to the attribute name.\n\
        \ \n\
        \  To send a message inviting the user to sign up, you must specify the user's email \
         address or phone number. You can do this in your call to AdminCreateUser or in the {b \
         Users} tab of the Amazon Cognito console for managing your user pools.\n\
        \  \n\
        \   You must also provide an email address or phone number when you expect the user to do \
         passwordless sign-in with an email or SMS OTP. These attributes must be provided when \
         passwordless options are the only available, or when you don't submit a \
         [TemporaryPassword].\n\
        \   \n\
        \    In your [AdminCreateUser] request, you can set the [email_verified] and \
         [phone_number_verified] attributes to [true]. The following conditions apply:\n\
        \    \n\
        \      email  The email address where you want the user to receive their confirmation code \
         and username. You must provide a value for [email] when you want to set [email_verified] \
         to [true], or if you set [EMAIL] in the [DesiredDeliveryMediums] parameter.\n\
        \             \n\
        \               phone_number  The phone number where you want the user to receive their \
         confirmation code and username. You must provide a value for [phone_number] when you want \
         to set [phone_number_verified] to [true], or if you set [SMS] in the \
         [DesiredDeliveryMediums] parameter.\n\
        \                             \n\
        \                               "]
  validation_data : attribute_list_type option;
      [@ocaml.doc
        "Temporary user attributes that contribute to the outcomes of your pre sign-up Lambda \
         trigger. This set of key-value pairs are for custom validation of information that you \
         collect from your users but don't need to retain.\n\n\
        \ Your Lambda function can analyze this additional data and act on it. Your function can \
         automatically confirm and verify select users or perform external API operations like \
         logging user attributes and validation data to Amazon CloudWatch Logs.\n\
        \ \n\
        \  For more information about the pre sign-up Lambda trigger, see \
         {{:https://docs.aws.amazon.com/cognito/latest/developerguide/user-pool-lambda-pre-sign-up.html}Pre \
         sign-up Lambda trigger}.\n\
        \  "]
  temporary_password : password_type option;
      [@ocaml.doc
        "The user's temporary password. This password must conform to the password policy that you \
         specified when you created the user pool.\n\n\
        \ The exception to the requirement for a password is when your user pool supports \
         passwordless sign-in with email or SMS OTPs. To create a user with no password, omit this \
         parameter or submit a blank value. You can only create a passwordless user when \
         passwordless sign-in is available.\n\
        \ \n\
        \  The temporary password is valid only once. To complete the Admin Create User flow, the \
         user must enter the temporary password in the sign-in page, along with a new password to \
         be used in all future sign-ins.\n\
        \  \n\
        \   If you don't specify a value, Amazon Cognito generates one for you unless you have \
         passwordless options active for your user pool.\n\
        \   \n\
        \    The temporary password can only be used until the user account expiration limit that \
         you set for your user pool. To reset the account after that time limit, you must call \
         [AdminCreateUser] again and specify [RESEND] for the [MessageAction] parameter.\n\
        \    "]
  force_alias_creation : force_alias_creation option;
      [@ocaml.doc
        "This parameter is used only if the [phone_number_verified] or [email_verified] attribute \
         is set to [True]. Otherwise, it is ignored.\n\n\
        \ If this parameter is set to [True] and the phone number or email address specified in \
         the [UserAttributes] parameter already exists as an alias with a different user, this \
         request migrates the alias from the previous user to the newly-created user. The previous \
         user will no longer be able to log in using that alias.\n\
        \ \n\
        \  If this parameter is set to [False], the API throws an [AliasExistsException] error if \
         the alias already exists. The default value is [False].\n\
        \  "]
  message_action : message_action_type option;
      [@ocaml.doc
        "Set to [RESEND] to resend the invitation message to a user that already exists, and to \
         reset the temporary-password duration with a new temporary password. Set to [SUPPRESS] to \
         suppress sending the message. You can specify only one value.\n"]
  desired_delivery_mediums : delivery_medium_list_type option;
      [@ocaml.doc
        "Specify [EMAIL] if email will be used to send the welcome message. Specify [SMS] if the \
         phone number will be used. The default value is [SMS]. You can specify more than one \
         value.\n"]
  client_metadata : client_metadata_type option;
      [@ocaml.doc
        "A map of custom key-value pairs that you can provide as input for any custom workflows \
         that this action triggers. You create custom workflows by assigning Lambda functions to \
         user pool triggers.\n\n\
        \ When Amazon Cognito invokes any of these functions, it passes a JSON payload, which the \
         function receives as input. This payload contains a [clientMetadata] attribute that \
         provides the data that you assigned to the ClientMetadata parameter in your request. In \
         your function code, you can process the [clientMetadata] value to enhance your workflow \
         for your specific needs.\n\
        \ \n\
        \  To review the Lambda trigger types that Amazon Cognito invokes at runtime with API \
         requests, see \
         {{:https://docs.aws.amazon.com/cognito/latest/developerguide/cognito-user-pools-working-with-lambda-triggers.html#lambda-triggers-by-event} \
         Connecting API actions to Lambda triggers} in the {i Amazon Cognito Developer Guide}.\n\
        \  \n\
        \    When you use the [ClientMetadata] parameter, note that Amazon Cognito won't do the \
         following:\n\
        \    \n\
        \     {ul\n\
        \           {-  Store the [ClientMetadata] value. This data is available only to Lambda \
         triggers that are assigned to a user pool to support custom workflows. If your user pool \
         configuration doesn't include triggers, the [ClientMetadata] parameter serves no purpose.\n\
        \               \n\
        \                }\n\
        \           {-  Validate the [ClientMetadata] value.\n\
        \               \n\
        \                }\n\
        \           {-  Encrypt the [ClientMetadata] value. Don't send sensitive information in \
         this parameter.\n\
        \               \n\
        \                }\n\
        \           }\n\
        \   "]
}
[@@ocaml.doc "Creates a new user in the specified user pool.\n"]

type nonrec admin_confirm_sign_up_response = unit [@@ocaml.doc ""]

type nonrec admin_confirm_sign_up_request = {
  user_pool_id : user_pool_id_type;
      [@ocaml.doc "The ID of the user pool where you want to confirm a user's sign-up request.\n"]
  username : username_type;
      [@ocaml.doc
        "The name of the user that you want to query or modify. The value of this parameter is \
         typically your user's username, but it can be any of their alias attributes. If \
         [username] isn't an alias attribute in your user pool, this value must be the [sub] of a \
         local user or the username of a user from a third-party IdP.\n"]
  client_metadata : client_metadata_type option;
      [@ocaml.doc
        "A map of custom key-value pairs that you can provide as input for any custom workflows \
         that this action triggers. You create custom workflows by assigning Lambda functions to \
         user pool triggers.\n\n\
        \ When Amazon Cognito invokes any of these functions, it passes a JSON payload, which the \
         function receives as input. This payload contains a [clientMetadata] attribute that \
         provides the data that you assigned to the ClientMetadata parameter in your request. In \
         your function code, you can process the [clientMetadata] value to enhance your workflow \
         for your specific needs.\n\
        \ \n\
        \  To review the Lambda trigger types that Amazon Cognito invokes at runtime with API \
         requests, see \
         {{:https://docs.aws.amazon.com/cognito/latest/developerguide/cognito-user-pools-working-with-lambda-triggers.html#lambda-triggers-by-event} \
         Connecting API actions to Lambda triggers} in the {i Amazon Cognito Developer Guide}.\n\
        \  \n\
        \    When you use the [ClientMetadata] parameter, note that Amazon Cognito won't do the \
         following:\n\
        \    \n\
        \     {ul\n\
        \           {-  Store the [ClientMetadata] value. This data is available only to Lambda \
         triggers that are assigned to a user pool to support custom workflows. If your user pool \
         configuration doesn't include triggers, the [ClientMetadata] parameter serves no purpose.\n\
        \               \n\
        \                }\n\
        \           {-  Validate the [ClientMetadata] value.\n\
        \               \n\
        \                }\n\
        \           {-  Encrypt the [ClientMetadata] value. Don't send sensitive information in \
         this parameter.\n\
        \               \n\
        \                }\n\
        \           }\n\
        \   "]
}
[@@ocaml.doc "Confirm a user's registration as a user pool administrator.\n"]

type nonrec admin_add_user_to_group_request = {
  user_pool_id : user_pool_id_type;
      [@ocaml.doc
        "The ID of the user pool that contains the group that you want to add the user to.\n"]
  username : username_type;
      [@ocaml.doc
        "The name of the user that you want to query or modify. The value of this parameter is \
         typically your user's username, but it can be any of their alias attributes. If \
         [username] isn't an alias attribute in your user pool, this value must be the [sub] of a \
         local user or the username of a user from a third-party IdP.\n"]
  group_name : group_name_type;
      [@ocaml.doc "The name of the group that you want to add your user to.\n"]
}
[@@ocaml.doc ""]

type nonrec access_denied_exception = { message : message_type option [@ocaml.doc ""] }
[@@ocaml.doc
  "This exception is thrown when you don't have sufficient permissions to perform the requested \
   operation.\n"]

type nonrec add_user_pool_client_secret_response = {
  client_secret_descriptor : client_secret_descriptor_type option;
      [@ocaml.doc
        "The details of the newly created client secret, including its unique identifier and \
         creation timestamp. The ClientSecretValue is only returned when Amazon Cognito generates \
         the secret. For custom secrets that you provide, the ClientSecretValue is not included in \
         the response.\n"]
}
[@@ocaml.doc "The response from creating a new client secret.\n"]

type nonrec add_user_pool_client_secret_request = {
  user_pool_id : user_pool_id_type;
      [@ocaml.doc "The ID of the user pool that contains the app client.\n"]
  client_id : client_id_type;
      [@ocaml.doc "The ID of the app client for which you want to create a new secret.\n"]
  client_secret : client_secret_type option;
      [@ocaml.doc
        "The client secret value you want to use. If you don't provide this parameter, Amazon \
         Cognito generates a secure secret for you.\n"]
}
[@@ocaml.doc "The request to create a new client secret for a user pool app client.\n"]

type nonrec add_custom_attributes_response = unit [@@ocaml.doc ""]

type nonrec custom_attributes_list_type = schema_attribute_type list [@@ocaml.doc ""]

type nonrec add_custom_attributes_request = {
  user_pool_id : user_pool_id_type;
      [@ocaml.doc "The ID of the user pool where you want to add custom attributes.\n"]
  custom_attributes : custom_attributes_list_type;
      [@ocaml.doc
        "An array of custom attribute names and other properties. Sets the following \
         characteristics:\n\n\
        \  AttributeDataType  The expected data type. Can be a string, a number, a date and time, \
         or a boolean.\n\
        \                     \n\
        \                       Mutable  If true, you can grant app clients write access to the \
         attribute value. If false, the attribute value can only be set up on sign-up or \
         administrator creation of users.\n\
        \                                \n\
        \                                  Name  The attribute name. For an attribute like \
         [custom:myAttribute], enter [myAttribute] for this field.\n\
        \                                        \n\
        \                                          Required  When true, users who sign up or are \
         created must set a value for the attribute.\n\
        \                                                    \n\
        \                                                      NumberAttributeConstraints  \n\
         The minimum and maximum length of accepted values for a [Number]-type attribute.\n\n\
        \  StringAttributeConstraints  The minimum and maximum length of accepted values for a \
         [String]-type attribute.\n\
        \                              \n\
        \                                DeveloperOnlyAttribute  This legacy option creates an \
         attribute with a [dev:] prefix. You can only set the value of a developer-only attribute \
         with administrative IAM credentials.\n\
        \                                                        \n\
        \                                                          "]
}
[@@ocaml.doc "Represents the request to add custom attributes.\n"]
