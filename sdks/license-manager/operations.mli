open Types

module AcceptGrant : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `AccessDeniedException of access_denied_exception
    | `AuthorizationException of authorization_exception
    | `InvalidParameterValueException of invalid_parameter_value_exception
    | `RateLimitExceededException of rate_limit_exceeded_exception
    | `ResourceLimitExceededException of resource_limit_exceeded_exception
    | `ServerInternalException of server_internal_exception
    | `ValidationException of validation_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    accept_grant_request ->
    ( accept_grant_response,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `AccessDeniedException of access_denied_exception
      | `AuthorizationException of authorization_exception
      | `InvalidParameterValueException of invalid_parameter_value_exception
      | `RateLimitExceededException of rate_limit_exceeded_exception
      | `ResourceLimitExceededException of resource_limit_exceeded_exception
      | `ServerInternalException of server_internal_exception
      | `ValidationException of validation_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    accept_grant_request ->
    ( accept_grant_response Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `AccessDeniedException of access_denied_exception
      | `AuthorizationException of authorization_exception
      | `InvalidParameterValueException of invalid_parameter_value_exception
      | `RateLimitExceededException of rate_limit_exceeded_exception
      | `ResourceLimitExceededException of resource_limit_exceeded_exception
      | `ServerInternalException of server_internal_exception
      | `ValidationException of validation_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc "Accepts the specified grant.\n"]

module CheckInLicense : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `AccessDeniedException of access_denied_exception
    | `AuthorizationException of authorization_exception
    | `ConflictException of conflict_exception
    | `InvalidParameterValueException of invalid_parameter_value_exception
    | `RateLimitExceededException of rate_limit_exceeded_exception
    | `ResourceNotFoundException of resource_not_found_exception
    | `ServerInternalException of server_internal_exception
    | `ValidationException of validation_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    check_in_license_request ->
    ( check_in_license_response,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `AccessDeniedException of access_denied_exception
      | `AuthorizationException of authorization_exception
      | `ConflictException of conflict_exception
      | `InvalidParameterValueException of invalid_parameter_value_exception
      | `RateLimitExceededException of rate_limit_exceeded_exception
      | `ResourceNotFoundException of resource_not_found_exception
      | `ServerInternalException of server_internal_exception
      | `ValidationException of validation_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    check_in_license_request ->
    ( check_in_license_response Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `AccessDeniedException of access_denied_exception
      | `AuthorizationException of authorization_exception
      | `ConflictException of conflict_exception
      | `InvalidParameterValueException of invalid_parameter_value_exception
      | `RateLimitExceededException of rate_limit_exceeded_exception
      | `ResourceNotFoundException of resource_not_found_exception
      | `ServerInternalException of server_internal_exception
      | `ValidationException of validation_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc "Checks in the specified license. Check in a license when it is no longer in use.\n"]

module CheckoutBorrowLicense : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `AccessDeniedException of access_denied_exception
    | `AuthorizationException of authorization_exception
    | `EntitlementNotAllowedException of entitlement_not_allowed_exception
    | `InvalidParameterValueException of invalid_parameter_value_exception
    | `NoEntitlementsAllowedException of no_entitlements_allowed_exception
    | `RateLimitExceededException of rate_limit_exceeded_exception
    | `RedirectException of redirect_exception
    | `ResourceNotFoundException of resource_not_found_exception
    | `ServerInternalException of server_internal_exception
    | `UnsupportedDigitalSignatureMethodException of unsupported_digital_signature_method_exception
    | `ValidationException of validation_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    checkout_borrow_license_request ->
    ( checkout_borrow_license_response,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `AccessDeniedException of access_denied_exception
      | `AuthorizationException of authorization_exception
      | `EntitlementNotAllowedException of entitlement_not_allowed_exception
      | `InvalidParameterValueException of invalid_parameter_value_exception
      | `NoEntitlementsAllowedException of no_entitlements_allowed_exception
      | `RateLimitExceededException of rate_limit_exceeded_exception
      | `RedirectException of redirect_exception
      | `ResourceNotFoundException of resource_not_found_exception
      | `ServerInternalException of server_internal_exception
      | `UnsupportedDigitalSignatureMethodException of
        unsupported_digital_signature_method_exception
      | `ValidationException of validation_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    checkout_borrow_license_request ->
    ( checkout_borrow_license_response Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `AccessDeniedException of access_denied_exception
      | `AuthorizationException of authorization_exception
      | `EntitlementNotAllowedException of entitlement_not_allowed_exception
      | `InvalidParameterValueException of invalid_parameter_value_exception
      | `NoEntitlementsAllowedException of no_entitlements_allowed_exception
      | `RateLimitExceededException of rate_limit_exceeded_exception
      | `RedirectException of redirect_exception
      | `ResourceNotFoundException of resource_not_found_exception
      | `ServerInternalException of server_internal_exception
      | `UnsupportedDigitalSignatureMethodException of
        unsupported_digital_signature_method_exception
      | `ValidationException of validation_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc "Checks out the specified license for offline use.\n"]

module CheckoutLicense : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `AccessDeniedException of access_denied_exception
    | `AuthorizationException of authorization_exception
    | `InvalidParameterValueException of invalid_parameter_value_exception
    | `NoEntitlementsAllowedException of no_entitlements_allowed_exception
    | `RateLimitExceededException of rate_limit_exceeded_exception
    | `RedirectException of redirect_exception
    | `ResourceNotFoundException of resource_not_found_exception
    | `ServerInternalException of server_internal_exception
    | `UnsupportedDigitalSignatureMethodException of unsupported_digital_signature_method_exception
    | `ValidationException of validation_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    checkout_license_request ->
    ( checkout_license_response,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `AccessDeniedException of access_denied_exception
      | `AuthorizationException of authorization_exception
      | `InvalidParameterValueException of invalid_parameter_value_exception
      | `NoEntitlementsAllowedException of no_entitlements_allowed_exception
      | `RateLimitExceededException of rate_limit_exceeded_exception
      | `RedirectException of redirect_exception
      | `ResourceNotFoundException of resource_not_found_exception
      | `ServerInternalException of server_internal_exception
      | `UnsupportedDigitalSignatureMethodException of
        unsupported_digital_signature_method_exception
      | `ValidationException of validation_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    checkout_license_request ->
    ( checkout_license_response Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `AccessDeniedException of access_denied_exception
      | `AuthorizationException of authorization_exception
      | `InvalidParameterValueException of invalid_parameter_value_exception
      | `NoEntitlementsAllowedException of no_entitlements_allowed_exception
      | `RateLimitExceededException of rate_limit_exceeded_exception
      | `RedirectException of redirect_exception
      | `ResourceNotFoundException of resource_not_found_exception
      | `ServerInternalException of server_internal_exception
      | `UnsupportedDigitalSignatureMethodException of
        unsupported_digital_signature_method_exception
      | `ValidationException of validation_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "Checks out the specified license.\n\n\
  \  If the account that created the license is the same that is performing the check out, you \
   must specify the account as the beneficiary.\n\
  \  \n\
  \   "]

module CreateGrant : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `AccessDeniedException of access_denied_exception
    | `AuthorizationException of authorization_exception
    | `InvalidParameterValueException of invalid_parameter_value_exception
    | `RateLimitExceededException of rate_limit_exceeded_exception
    | `ResourceLimitExceededException of resource_limit_exceeded_exception
    | `ServerInternalException of server_internal_exception
    | `ValidationException of validation_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    create_grant_request ->
    ( create_grant_response,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `AccessDeniedException of access_denied_exception
      | `AuthorizationException of authorization_exception
      | `InvalidParameterValueException of invalid_parameter_value_exception
      | `RateLimitExceededException of rate_limit_exceeded_exception
      | `ResourceLimitExceededException of resource_limit_exceeded_exception
      | `ServerInternalException of server_internal_exception
      | `ValidationException of validation_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    create_grant_request ->
    ( create_grant_response Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `AccessDeniedException of access_denied_exception
      | `AuthorizationException of authorization_exception
      | `InvalidParameterValueException of invalid_parameter_value_exception
      | `RateLimitExceededException of rate_limit_exceeded_exception
      | `ResourceLimitExceededException of resource_limit_exceeded_exception
      | `ServerInternalException of server_internal_exception
      | `ValidationException of validation_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "Creates a grant for the specified license. A grant shares the use of license entitlements with \
   a specific Amazon Web Services account, an organization, or an organizational unit (OU). For \
   more information, see \
   {{:https://docs.aws.amazon.com/license-manager/latest/userguide/granted-licenses.html}Granted \
   licenses in License Manager} in the {i License Manager User Guide}.\n"]

module CreateGrantVersion : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `AccessDeniedException of access_denied_exception
    | `AuthorizationException of authorization_exception
    | `InvalidParameterValueException of invalid_parameter_value_exception
    | `RateLimitExceededException of rate_limit_exceeded_exception
    | `ResourceLimitExceededException of resource_limit_exceeded_exception
    | `ServerInternalException of server_internal_exception
    | `ValidationException of validation_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    create_grant_version_request ->
    ( create_grant_version_response,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `AccessDeniedException of access_denied_exception
      | `AuthorizationException of authorization_exception
      | `InvalidParameterValueException of invalid_parameter_value_exception
      | `RateLimitExceededException of rate_limit_exceeded_exception
      | `ResourceLimitExceededException of resource_limit_exceeded_exception
      | `ServerInternalException of server_internal_exception
      | `ValidationException of validation_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    create_grant_version_request ->
    ( create_grant_version_response Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `AccessDeniedException of access_denied_exception
      | `AuthorizationException of authorization_exception
      | `InvalidParameterValueException of invalid_parameter_value_exception
      | `RateLimitExceededException of rate_limit_exceeded_exception
      | `ResourceLimitExceededException of resource_limit_exceeded_exception
      | `ServerInternalException of server_internal_exception
      | `ValidationException of validation_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "Creates a new version of the specified grant. For more information, see \
   {{:https://docs.aws.amazon.com/license-manager/latest/userguide/granted-licenses.html}Granted \
   licenses in License Manager} in the {i License Manager User Guide}.\n"]

module CreateLicense : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `AccessDeniedException of access_denied_exception
    | `AuthorizationException of authorization_exception
    | `InvalidParameterValueException of invalid_parameter_value_exception
    | `RateLimitExceededException of rate_limit_exceeded_exception
    | `RedirectException of redirect_exception
    | `ServerInternalException of server_internal_exception
    | `ValidationException of validation_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    create_license_request ->
    ( create_license_response,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `AccessDeniedException of access_denied_exception
      | `AuthorizationException of authorization_exception
      | `InvalidParameterValueException of invalid_parameter_value_exception
      | `RateLimitExceededException of rate_limit_exceeded_exception
      | `RedirectException of redirect_exception
      | `ServerInternalException of server_internal_exception
      | `ValidationException of validation_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    create_license_request ->
    ( create_license_response Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `AccessDeniedException of access_denied_exception
      | `AuthorizationException of authorization_exception
      | `InvalidParameterValueException of invalid_parameter_value_exception
      | `RateLimitExceededException of rate_limit_exceeded_exception
      | `RedirectException of redirect_exception
      | `ServerInternalException of server_internal_exception
      | `ValidationException of validation_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc "Creates a license.\n"]

module CreateLicenseAssetGroup : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `AccessDeniedException of access_denied_exception
    | `AuthorizationException of authorization_exception
    | `InvalidParameterValueException of invalid_parameter_value_exception
    | `RateLimitExceededException of rate_limit_exceeded_exception
    | `ServerInternalException of server_internal_exception
    | `ValidationException of validation_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    create_license_asset_group_request ->
    ( create_license_asset_group_response,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `AccessDeniedException of access_denied_exception
      | `AuthorizationException of authorization_exception
      | `InvalidParameterValueException of invalid_parameter_value_exception
      | `RateLimitExceededException of rate_limit_exceeded_exception
      | `ServerInternalException of server_internal_exception
      | `ValidationException of validation_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    create_license_asset_group_request ->
    ( create_license_asset_group_response Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `AccessDeniedException of access_denied_exception
      | `AuthorizationException of authorization_exception
      | `InvalidParameterValueException of invalid_parameter_value_exception
      | `RateLimitExceededException of rate_limit_exceeded_exception
      | `ServerInternalException of server_internal_exception
      | `ValidationException of validation_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc "Creates a license asset group.\n"]

module CreateLicenseAssetRuleset : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `AccessDeniedException of access_denied_exception
    | `AuthorizationException of authorization_exception
    | `InvalidParameterValueException of invalid_parameter_value_exception
    | `RateLimitExceededException of rate_limit_exceeded_exception
    | `ServerInternalException of server_internal_exception
    | `ValidationException of validation_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    create_license_asset_ruleset_request ->
    ( create_license_asset_ruleset_response,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `AccessDeniedException of access_denied_exception
      | `AuthorizationException of authorization_exception
      | `InvalidParameterValueException of invalid_parameter_value_exception
      | `RateLimitExceededException of rate_limit_exceeded_exception
      | `ServerInternalException of server_internal_exception
      | `ValidationException of validation_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    create_license_asset_ruleset_request ->
    ( create_license_asset_ruleset_response Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `AccessDeniedException of access_denied_exception
      | `AuthorizationException of authorization_exception
      | `InvalidParameterValueException of invalid_parameter_value_exception
      | `RateLimitExceededException of rate_limit_exceeded_exception
      | `ServerInternalException of server_internal_exception
      | `ValidationException of validation_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc "Creates a license asset ruleset.\n"]

module CreateLicenseConfiguration : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `AccessDeniedException of access_denied_exception
    | `AuthorizationException of authorization_exception
    | `InvalidParameterValueException of invalid_parameter_value_exception
    | `RateLimitExceededException of rate_limit_exceeded_exception
    | `ResourceLimitExceededException of resource_limit_exceeded_exception
    | `ServerInternalException of server_internal_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    create_license_configuration_request ->
    ( create_license_configuration_response,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `AccessDeniedException of access_denied_exception
      | `AuthorizationException of authorization_exception
      | `InvalidParameterValueException of invalid_parameter_value_exception
      | `RateLimitExceededException of rate_limit_exceeded_exception
      | `ResourceLimitExceededException of resource_limit_exceeded_exception
      | `ServerInternalException of server_internal_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    create_license_configuration_request ->
    ( create_license_configuration_response Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `AccessDeniedException of access_denied_exception
      | `AuthorizationException of authorization_exception
      | `InvalidParameterValueException of invalid_parameter_value_exception
      | `RateLimitExceededException of rate_limit_exceeded_exception
      | `ResourceLimitExceededException of resource_limit_exceeded_exception
      | `ServerInternalException of server_internal_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "Creates a license configuration.\n\n\
  \ A license configuration is an abstraction of a customer license agreement that can be consumed \
   and enforced by License Manager. Components include specifications for the license type \
   (licensing by instance, socket, CPU, or vCPU), allowed tenancy (shared tenancy, Dedicated \
   Instance, Dedicated Host, or all of these), license affinity to host (how long a license must \
   be associated with a host), and the number of licenses purchased and used.\n\
  \ "]

module CreateLicenseConversionTaskForResource : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `AccessDeniedException of access_denied_exception
    | `AuthorizationException of authorization_exception
    | `InvalidParameterValueException of invalid_parameter_value_exception
    | `RateLimitExceededException of rate_limit_exceeded_exception
    | `ServerInternalException of server_internal_exception
    | `ValidationException of validation_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    create_license_conversion_task_for_resource_request ->
    ( create_license_conversion_task_for_resource_response,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `AccessDeniedException of access_denied_exception
      | `AuthorizationException of authorization_exception
      | `InvalidParameterValueException of invalid_parameter_value_exception
      | `RateLimitExceededException of rate_limit_exceeded_exception
      | `ServerInternalException of server_internal_exception
      | `ValidationException of validation_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    create_license_conversion_task_for_resource_request ->
    ( create_license_conversion_task_for_resource_response Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `AccessDeniedException of access_denied_exception
      | `AuthorizationException of authorization_exception
      | `InvalidParameterValueException of invalid_parameter_value_exception
      | `RateLimitExceededException of rate_limit_exceeded_exception
      | `ServerInternalException of server_internal_exception
      | `ValidationException of validation_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc "Creates a new license conversion task.\n"]

module CreateLicenseManagerReportGenerator : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `AccessDeniedException of access_denied_exception
    | `AuthorizationException of authorization_exception
    | `InvalidParameterValueException of invalid_parameter_value_exception
    | `RateLimitExceededException of rate_limit_exceeded_exception
    | `ResourceLimitExceededException of resource_limit_exceeded_exception
    | `ResourceNotFoundException of resource_not_found_exception
    | `ServerInternalException of server_internal_exception
    | `ValidationException of validation_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    create_license_manager_report_generator_request ->
    ( create_license_manager_report_generator_response,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `AccessDeniedException of access_denied_exception
      | `AuthorizationException of authorization_exception
      | `InvalidParameterValueException of invalid_parameter_value_exception
      | `RateLimitExceededException of rate_limit_exceeded_exception
      | `ResourceLimitExceededException of resource_limit_exceeded_exception
      | `ResourceNotFoundException of resource_not_found_exception
      | `ServerInternalException of server_internal_exception
      | `ValidationException of validation_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    create_license_manager_report_generator_request ->
    ( create_license_manager_report_generator_response Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `AccessDeniedException of access_denied_exception
      | `AuthorizationException of authorization_exception
      | `InvalidParameterValueException of invalid_parameter_value_exception
      | `RateLimitExceededException of rate_limit_exceeded_exception
      | `ResourceLimitExceededException of resource_limit_exceeded_exception
      | `ResourceNotFoundException of resource_not_found_exception
      | `ServerInternalException of server_internal_exception
      | `ValidationException of validation_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc "Creates a report generator.\n"]

module CreateLicenseVersion : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `AccessDeniedException of access_denied_exception
    | `AuthorizationException of authorization_exception
    | `ConflictException of conflict_exception
    | `RateLimitExceededException of rate_limit_exceeded_exception
    | `RedirectException of redirect_exception
    | `ResourceNotFoundException of resource_not_found_exception
    | `ServerInternalException of server_internal_exception
    | `ValidationException of validation_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    create_license_version_request ->
    ( create_license_version_response,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `AccessDeniedException of access_denied_exception
      | `AuthorizationException of authorization_exception
      | `ConflictException of conflict_exception
      | `RateLimitExceededException of rate_limit_exceeded_exception
      | `RedirectException of redirect_exception
      | `ResourceNotFoundException of resource_not_found_exception
      | `ServerInternalException of server_internal_exception
      | `ValidationException of validation_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    create_license_version_request ->
    ( create_license_version_response Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `AccessDeniedException of access_denied_exception
      | `AuthorizationException of authorization_exception
      | `ConflictException of conflict_exception
      | `RateLimitExceededException of rate_limit_exceeded_exception
      | `RedirectException of redirect_exception
      | `ResourceNotFoundException of resource_not_found_exception
      | `ServerInternalException of server_internal_exception
      | `ValidationException of validation_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc "Creates a new version of the specified license.\n"]

module CreateToken : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `AccessDeniedException of access_denied_exception
    | `AuthorizationException of authorization_exception
    | `RateLimitExceededException of rate_limit_exceeded_exception
    | `RedirectException of redirect_exception
    | `ResourceLimitExceededException of resource_limit_exceeded_exception
    | `ResourceNotFoundException of resource_not_found_exception
    | `ServerInternalException of server_internal_exception
    | `ValidationException of validation_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    create_token_request ->
    ( create_token_response,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `AccessDeniedException of access_denied_exception
      | `AuthorizationException of authorization_exception
      | `RateLimitExceededException of rate_limit_exceeded_exception
      | `RedirectException of redirect_exception
      | `ResourceLimitExceededException of resource_limit_exceeded_exception
      | `ResourceNotFoundException of resource_not_found_exception
      | `ServerInternalException of server_internal_exception
      | `ValidationException of validation_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    create_token_request ->
    ( create_token_response Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `AccessDeniedException of access_denied_exception
      | `AuthorizationException of authorization_exception
      | `RateLimitExceededException of rate_limit_exceeded_exception
      | `RedirectException of redirect_exception
      | `ResourceLimitExceededException of resource_limit_exceeded_exception
      | `ResourceNotFoundException of resource_not_found_exception
      | `ServerInternalException of server_internal_exception
      | `ValidationException of validation_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "Creates a long-lived token.\n\n\
  \ A refresh token is a JWT token used to get an access token. With an access token, you can call \
   AssumeRoleWithWebIdentity to get role credentials that you can use to call License Manager to \
   manage the specified license.\n\
  \ "]

module DeleteGrant : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `AccessDeniedException of access_denied_exception
    | `AuthorizationException of authorization_exception
    | `InvalidParameterValueException of invalid_parameter_value_exception
    | `RateLimitExceededException of rate_limit_exceeded_exception
    | `ResourceLimitExceededException of resource_limit_exceeded_exception
    | `ServerInternalException of server_internal_exception
    | `ValidationException of validation_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    delete_grant_request ->
    ( delete_grant_response,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `AccessDeniedException of access_denied_exception
      | `AuthorizationException of authorization_exception
      | `InvalidParameterValueException of invalid_parameter_value_exception
      | `RateLimitExceededException of rate_limit_exceeded_exception
      | `ResourceLimitExceededException of resource_limit_exceeded_exception
      | `ServerInternalException of server_internal_exception
      | `ValidationException of validation_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    delete_grant_request ->
    ( delete_grant_response Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `AccessDeniedException of access_denied_exception
      | `AuthorizationException of authorization_exception
      | `InvalidParameterValueException of invalid_parameter_value_exception
      | `RateLimitExceededException of rate_limit_exceeded_exception
      | `ResourceLimitExceededException of resource_limit_exceeded_exception
      | `ServerInternalException of server_internal_exception
      | `ValidationException of validation_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc "Deletes the specified grant.\n"]

module DeleteLicense : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `AccessDeniedException of access_denied_exception
    | `AuthorizationException of authorization_exception
    | `ConflictException of conflict_exception
    | `InvalidParameterValueException of invalid_parameter_value_exception
    | `RateLimitExceededException of rate_limit_exceeded_exception
    | `RedirectException of redirect_exception
    | `ServerInternalException of server_internal_exception
    | `ValidationException of validation_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    delete_license_request ->
    ( delete_license_response,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `AccessDeniedException of access_denied_exception
      | `AuthorizationException of authorization_exception
      | `ConflictException of conflict_exception
      | `InvalidParameterValueException of invalid_parameter_value_exception
      | `RateLimitExceededException of rate_limit_exceeded_exception
      | `RedirectException of redirect_exception
      | `ServerInternalException of server_internal_exception
      | `ValidationException of validation_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    delete_license_request ->
    ( delete_license_response Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `AccessDeniedException of access_denied_exception
      | `AuthorizationException of authorization_exception
      | `ConflictException of conflict_exception
      | `InvalidParameterValueException of invalid_parameter_value_exception
      | `RateLimitExceededException of rate_limit_exceeded_exception
      | `RedirectException of redirect_exception
      | `ServerInternalException of server_internal_exception
      | `ValidationException of validation_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc "Deletes the specified license.\n"]

module DeleteLicenseAssetGroup : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `AccessDeniedException of access_denied_exception
    | `AuthorizationException of authorization_exception
    | `InvalidParameterValueException of invalid_parameter_value_exception
    | `RateLimitExceededException of rate_limit_exceeded_exception
    | `ServerInternalException of server_internal_exception
    | `ValidationException of validation_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    delete_license_asset_group_request ->
    ( delete_license_asset_group_response,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `AccessDeniedException of access_denied_exception
      | `AuthorizationException of authorization_exception
      | `InvalidParameterValueException of invalid_parameter_value_exception
      | `RateLimitExceededException of rate_limit_exceeded_exception
      | `ServerInternalException of server_internal_exception
      | `ValidationException of validation_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    delete_license_asset_group_request ->
    ( delete_license_asset_group_response Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `AccessDeniedException of access_denied_exception
      | `AuthorizationException of authorization_exception
      | `InvalidParameterValueException of invalid_parameter_value_exception
      | `RateLimitExceededException of rate_limit_exceeded_exception
      | `ServerInternalException of server_internal_exception
      | `ValidationException of validation_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc "Deletes a license asset group.\n"]

module DeleteLicenseAssetRuleset : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `AccessDeniedException of access_denied_exception
    | `AuthorizationException of authorization_exception
    | `InvalidParameterValueException of invalid_parameter_value_exception
    | `RateLimitExceededException of rate_limit_exceeded_exception
    | `ServerInternalException of server_internal_exception
    | `ValidationException of validation_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    delete_license_asset_ruleset_request ->
    ( delete_license_asset_ruleset_response,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `AccessDeniedException of access_denied_exception
      | `AuthorizationException of authorization_exception
      | `InvalidParameterValueException of invalid_parameter_value_exception
      | `RateLimitExceededException of rate_limit_exceeded_exception
      | `ServerInternalException of server_internal_exception
      | `ValidationException of validation_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    delete_license_asset_ruleset_request ->
    ( delete_license_asset_ruleset_response Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `AccessDeniedException of access_denied_exception
      | `AuthorizationException of authorization_exception
      | `InvalidParameterValueException of invalid_parameter_value_exception
      | `RateLimitExceededException of rate_limit_exceeded_exception
      | `ServerInternalException of server_internal_exception
      | `ValidationException of validation_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc "Deletes a license asset ruleset.\n"]

module DeleteLicenseConfiguration : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `AccessDeniedException of access_denied_exception
    | `AuthorizationException of authorization_exception
    | `InvalidParameterValueException of invalid_parameter_value_exception
    | `RateLimitExceededException of rate_limit_exceeded_exception
    | `ServerInternalException of server_internal_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    delete_license_configuration_request ->
    ( delete_license_configuration_response,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `AccessDeniedException of access_denied_exception
      | `AuthorizationException of authorization_exception
      | `InvalidParameterValueException of invalid_parameter_value_exception
      | `RateLimitExceededException of rate_limit_exceeded_exception
      | `ServerInternalException of server_internal_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    delete_license_configuration_request ->
    ( delete_license_configuration_response Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `AccessDeniedException of access_denied_exception
      | `AuthorizationException of authorization_exception
      | `InvalidParameterValueException of invalid_parameter_value_exception
      | `RateLimitExceededException of rate_limit_exceeded_exception
      | `ServerInternalException of server_internal_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "Deletes the specified license configuration.\n\n\
  \ You cannot delete a license configuration that is in use.\n\
  \ "]

module DeleteLicenseManagerReportGenerator : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `AccessDeniedException of access_denied_exception
    | `AuthorizationException of authorization_exception
    | `InvalidParameterValueException of invalid_parameter_value_exception
    | `RateLimitExceededException of rate_limit_exceeded_exception
    | `ResourceLimitExceededException of resource_limit_exceeded_exception
    | `ResourceNotFoundException of resource_not_found_exception
    | `ServerInternalException of server_internal_exception
    | `ValidationException of validation_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    delete_license_manager_report_generator_request ->
    ( delete_license_manager_report_generator_response,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `AccessDeniedException of access_denied_exception
      | `AuthorizationException of authorization_exception
      | `InvalidParameterValueException of invalid_parameter_value_exception
      | `RateLimitExceededException of rate_limit_exceeded_exception
      | `ResourceLimitExceededException of resource_limit_exceeded_exception
      | `ResourceNotFoundException of resource_not_found_exception
      | `ServerInternalException of server_internal_exception
      | `ValidationException of validation_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    delete_license_manager_report_generator_request ->
    ( delete_license_manager_report_generator_response Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `AccessDeniedException of access_denied_exception
      | `AuthorizationException of authorization_exception
      | `InvalidParameterValueException of invalid_parameter_value_exception
      | `RateLimitExceededException of rate_limit_exceeded_exception
      | `ResourceLimitExceededException of resource_limit_exceeded_exception
      | `ResourceNotFoundException of resource_not_found_exception
      | `ServerInternalException of server_internal_exception
      | `ValidationException of validation_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "Deletes the specified report generator.\n\n\
  \ This action deletes the report generator, which stops it from generating future reports. The \
   action cannot be reversed. It has no effect on the previous reports from this generator.\n\
  \ "]

module DeleteToken : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `AccessDeniedException of access_denied_exception
    | `AuthorizationException of authorization_exception
    | `RateLimitExceededException of rate_limit_exceeded_exception
    | `RedirectException of redirect_exception
    | `ResourceNotFoundException of resource_not_found_exception
    | `ServerInternalException of server_internal_exception
    | `ValidationException of validation_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    delete_token_request ->
    ( delete_token_response,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `AccessDeniedException of access_denied_exception
      | `AuthorizationException of authorization_exception
      | `RateLimitExceededException of rate_limit_exceeded_exception
      | `RedirectException of redirect_exception
      | `ResourceNotFoundException of resource_not_found_exception
      | `ServerInternalException of server_internal_exception
      | `ValidationException of validation_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    delete_token_request ->
    ( delete_token_response Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `AccessDeniedException of access_denied_exception
      | `AuthorizationException of authorization_exception
      | `RateLimitExceededException of rate_limit_exceeded_exception
      | `RedirectException of redirect_exception
      | `ResourceNotFoundException of resource_not_found_exception
      | `ServerInternalException of server_internal_exception
      | `ValidationException of validation_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc "Deletes the specified token. Must be called in the license home Region.\n"]

module ExtendLicenseConsumption : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `AccessDeniedException of access_denied_exception
    | `AuthorizationException of authorization_exception
    | `InvalidParameterValueException of invalid_parameter_value_exception
    | `RateLimitExceededException of rate_limit_exceeded_exception
    | `ResourceNotFoundException of resource_not_found_exception
    | `ServerInternalException of server_internal_exception
    | `ValidationException of validation_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    extend_license_consumption_request ->
    ( extend_license_consumption_response,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `AccessDeniedException of access_denied_exception
      | `AuthorizationException of authorization_exception
      | `InvalidParameterValueException of invalid_parameter_value_exception
      | `RateLimitExceededException of rate_limit_exceeded_exception
      | `ResourceNotFoundException of resource_not_found_exception
      | `ServerInternalException of server_internal_exception
      | `ValidationException of validation_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    extend_license_consumption_request ->
    ( extend_license_consumption_response Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `AccessDeniedException of access_denied_exception
      | `AuthorizationException of authorization_exception
      | `InvalidParameterValueException of invalid_parameter_value_exception
      | `RateLimitExceededException of rate_limit_exceeded_exception
      | `ResourceNotFoundException of resource_not_found_exception
      | `ServerInternalException of server_internal_exception
      | `ValidationException of validation_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc "Extends the expiration date for license consumption.\n"]

module GetAccessToken : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `AccessDeniedException of access_denied_exception
    | `AuthorizationException of authorization_exception
    | `RateLimitExceededException of rate_limit_exceeded_exception
    | `ServerInternalException of server_internal_exception
    | `ValidationException of validation_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    get_access_token_request ->
    ( get_access_token_response,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `AccessDeniedException of access_denied_exception
      | `AuthorizationException of authorization_exception
      | `RateLimitExceededException of rate_limit_exceeded_exception
      | `ServerInternalException of server_internal_exception
      | `ValidationException of validation_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    get_access_token_request ->
    ( get_access_token_response Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `AccessDeniedException of access_denied_exception
      | `AuthorizationException of authorization_exception
      | `RateLimitExceededException of rate_limit_exceeded_exception
      | `ServerInternalException of server_internal_exception
      | `ValidationException of validation_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "Gets a temporary access token to use with AssumeRoleWithWebIdentity. Access tokens are valid \
   for one hour.\n"]

module GetGrant : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `AccessDeniedException of access_denied_exception
    | `AuthorizationException of authorization_exception
    | `InvalidParameterValueException of invalid_parameter_value_exception
    | `RateLimitExceededException of rate_limit_exceeded_exception
    | `ResourceLimitExceededException of resource_limit_exceeded_exception
    | `ServerInternalException of server_internal_exception
    | `ValidationException of validation_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    get_grant_request ->
    ( get_grant_response,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `AccessDeniedException of access_denied_exception
      | `AuthorizationException of authorization_exception
      | `InvalidParameterValueException of invalid_parameter_value_exception
      | `RateLimitExceededException of rate_limit_exceeded_exception
      | `ResourceLimitExceededException of resource_limit_exceeded_exception
      | `ServerInternalException of server_internal_exception
      | `ValidationException of validation_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    get_grant_request ->
    ( get_grant_response Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `AccessDeniedException of access_denied_exception
      | `AuthorizationException of authorization_exception
      | `InvalidParameterValueException of invalid_parameter_value_exception
      | `RateLimitExceededException of rate_limit_exceeded_exception
      | `ResourceLimitExceededException of resource_limit_exceeded_exception
      | `ServerInternalException of server_internal_exception
      | `ValidationException of validation_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc "Gets detailed information about the specified grant.\n"]

module GetLicense : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `AccessDeniedException of access_denied_exception
    | `AuthorizationException of authorization_exception
    | `InvalidParameterValueException of invalid_parameter_value_exception
    | `RateLimitExceededException of rate_limit_exceeded_exception
    | `ServerInternalException of server_internal_exception
    | `ValidationException of validation_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    get_license_request ->
    ( get_license_response,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `AccessDeniedException of access_denied_exception
      | `AuthorizationException of authorization_exception
      | `InvalidParameterValueException of invalid_parameter_value_exception
      | `RateLimitExceededException of rate_limit_exceeded_exception
      | `ServerInternalException of server_internal_exception
      | `ValidationException of validation_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    get_license_request ->
    ( get_license_response Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `AccessDeniedException of access_denied_exception
      | `AuthorizationException of authorization_exception
      | `InvalidParameterValueException of invalid_parameter_value_exception
      | `RateLimitExceededException of rate_limit_exceeded_exception
      | `ServerInternalException of server_internal_exception
      | `ValidationException of validation_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc "Gets detailed information about the specified license.\n"]

module GetLicenseAssetGroup : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `AccessDeniedException of access_denied_exception
    | `AuthorizationException of authorization_exception
    | `InvalidParameterValueException of invalid_parameter_value_exception
    | `RateLimitExceededException of rate_limit_exceeded_exception
    | `ServerInternalException of server_internal_exception
    | `ValidationException of validation_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    get_license_asset_group_request ->
    ( get_license_asset_group_response,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `AccessDeniedException of access_denied_exception
      | `AuthorizationException of authorization_exception
      | `InvalidParameterValueException of invalid_parameter_value_exception
      | `RateLimitExceededException of rate_limit_exceeded_exception
      | `ServerInternalException of server_internal_exception
      | `ValidationException of validation_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    get_license_asset_group_request ->
    ( get_license_asset_group_response Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `AccessDeniedException of access_denied_exception
      | `AuthorizationException of authorization_exception
      | `InvalidParameterValueException of invalid_parameter_value_exception
      | `RateLimitExceededException of rate_limit_exceeded_exception
      | `ServerInternalException of server_internal_exception
      | `ValidationException of validation_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc "Gets a license asset group.\n"]

module GetLicenseAssetRuleset : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `AccessDeniedException of access_denied_exception
    | `AuthorizationException of authorization_exception
    | `InvalidParameterValueException of invalid_parameter_value_exception
    | `RateLimitExceededException of rate_limit_exceeded_exception
    | `ServerInternalException of server_internal_exception
    | `ValidationException of validation_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    get_license_asset_ruleset_request ->
    ( get_license_asset_ruleset_response,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `AccessDeniedException of access_denied_exception
      | `AuthorizationException of authorization_exception
      | `InvalidParameterValueException of invalid_parameter_value_exception
      | `RateLimitExceededException of rate_limit_exceeded_exception
      | `ServerInternalException of server_internal_exception
      | `ValidationException of validation_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    get_license_asset_ruleset_request ->
    ( get_license_asset_ruleset_response Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `AccessDeniedException of access_denied_exception
      | `AuthorizationException of authorization_exception
      | `InvalidParameterValueException of invalid_parameter_value_exception
      | `RateLimitExceededException of rate_limit_exceeded_exception
      | `ServerInternalException of server_internal_exception
      | `ValidationException of validation_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc "Gets a license asset ruleset.\n"]

module GetLicenseConfiguration : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `AccessDeniedException of access_denied_exception
    | `AuthorizationException of authorization_exception
    | `InvalidParameterValueException of invalid_parameter_value_exception
    | `RateLimitExceededException of rate_limit_exceeded_exception
    | `ServerInternalException of server_internal_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    get_license_configuration_request ->
    ( get_license_configuration_response,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `AccessDeniedException of access_denied_exception
      | `AuthorizationException of authorization_exception
      | `InvalidParameterValueException of invalid_parameter_value_exception
      | `RateLimitExceededException of rate_limit_exceeded_exception
      | `ServerInternalException of server_internal_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    get_license_configuration_request ->
    ( get_license_configuration_response Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `AccessDeniedException of access_denied_exception
      | `AuthorizationException of authorization_exception
      | `InvalidParameterValueException of invalid_parameter_value_exception
      | `RateLimitExceededException of rate_limit_exceeded_exception
      | `ServerInternalException of server_internal_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc "Gets detailed information about the specified license configuration.\n"]

module GetLicenseConversionTask : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `AccessDeniedException of access_denied_exception
    | `AuthorizationException of authorization_exception
    | `InvalidParameterValueException of invalid_parameter_value_exception
    | `RateLimitExceededException of rate_limit_exceeded_exception
    | `ServerInternalException of server_internal_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    get_license_conversion_task_request ->
    ( get_license_conversion_task_response,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `AccessDeniedException of access_denied_exception
      | `AuthorizationException of authorization_exception
      | `InvalidParameterValueException of invalid_parameter_value_exception
      | `RateLimitExceededException of rate_limit_exceeded_exception
      | `ServerInternalException of server_internal_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    get_license_conversion_task_request ->
    ( get_license_conversion_task_response Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `AccessDeniedException of access_denied_exception
      | `AuthorizationException of authorization_exception
      | `InvalidParameterValueException of invalid_parameter_value_exception
      | `RateLimitExceededException of rate_limit_exceeded_exception
      | `ServerInternalException of server_internal_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc "Gets information about the specified license type conversion task.\n"]

module GetLicenseManagerReportGenerator : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `AccessDeniedException of access_denied_exception
    | `AuthorizationException of authorization_exception
    | `InvalidParameterValueException of invalid_parameter_value_exception
    | `RateLimitExceededException of rate_limit_exceeded_exception
    | `ResourceLimitExceededException of resource_limit_exceeded_exception
    | `ResourceNotFoundException of resource_not_found_exception
    | `ServerInternalException of server_internal_exception
    | `ValidationException of validation_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    get_license_manager_report_generator_request ->
    ( get_license_manager_report_generator_response,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `AccessDeniedException of access_denied_exception
      | `AuthorizationException of authorization_exception
      | `InvalidParameterValueException of invalid_parameter_value_exception
      | `RateLimitExceededException of rate_limit_exceeded_exception
      | `ResourceLimitExceededException of resource_limit_exceeded_exception
      | `ResourceNotFoundException of resource_not_found_exception
      | `ServerInternalException of server_internal_exception
      | `ValidationException of validation_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    get_license_manager_report_generator_request ->
    ( get_license_manager_report_generator_response Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `AccessDeniedException of access_denied_exception
      | `AuthorizationException of authorization_exception
      | `InvalidParameterValueException of invalid_parameter_value_exception
      | `RateLimitExceededException of rate_limit_exceeded_exception
      | `ResourceLimitExceededException of resource_limit_exceeded_exception
      | `ResourceNotFoundException of resource_not_found_exception
      | `ServerInternalException of server_internal_exception
      | `ValidationException of validation_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc "Gets information about the specified report generator.\n"]

module GetLicenseUsage : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `AccessDeniedException of access_denied_exception
    | `AuthorizationException of authorization_exception
    | `InvalidParameterValueException of invalid_parameter_value_exception
    | `RateLimitExceededException of rate_limit_exceeded_exception
    | `ServerInternalException of server_internal_exception
    | `ValidationException of validation_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    get_license_usage_request ->
    ( get_license_usage_response,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `AccessDeniedException of access_denied_exception
      | `AuthorizationException of authorization_exception
      | `InvalidParameterValueException of invalid_parameter_value_exception
      | `RateLimitExceededException of rate_limit_exceeded_exception
      | `ServerInternalException of server_internal_exception
      | `ValidationException of validation_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    get_license_usage_request ->
    ( get_license_usage_response Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `AccessDeniedException of access_denied_exception
      | `AuthorizationException of authorization_exception
      | `InvalidParameterValueException of invalid_parameter_value_exception
      | `RateLimitExceededException of rate_limit_exceeded_exception
      | `ServerInternalException of server_internal_exception
      | `ValidationException of validation_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc "Gets detailed information about the usage of the specified license.\n"]

module GetServiceSettings : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `AccessDeniedException of access_denied_exception
    | `AuthorizationException of authorization_exception
    | `RateLimitExceededException of rate_limit_exceeded_exception
    | `ServerInternalException of server_internal_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    get_service_settings_request ->
    ( get_service_settings_response,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `AccessDeniedException of access_denied_exception
      | `AuthorizationException of authorization_exception
      | `RateLimitExceededException of rate_limit_exceeded_exception
      | `ServerInternalException of server_internal_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    get_service_settings_request ->
    ( get_service_settings_response Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `AccessDeniedException of access_denied_exception
      | `AuthorizationException of authorization_exception
      | `RateLimitExceededException of rate_limit_exceeded_exception
      | `ServerInternalException of server_internal_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc "Gets the License Manager settings for the current Region.\n"]

module ListAssetsForLicenseAssetGroup : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `AccessDeniedException of access_denied_exception
    | `AuthorizationException of authorization_exception
    | `InvalidParameterValueException of invalid_parameter_value_exception
    | `RateLimitExceededException of rate_limit_exceeded_exception
    | `ServerInternalException of server_internal_exception
    | `ValidationException of validation_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    list_assets_for_license_asset_group_request ->
    ( list_assets_for_license_asset_group_response,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `AccessDeniedException of access_denied_exception
      | `AuthorizationException of authorization_exception
      | `InvalidParameterValueException of invalid_parameter_value_exception
      | `RateLimitExceededException of rate_limit_exceeded_exception
      | `ServerInternalException of server_internal_exception
      | `ValidationException of validation_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    list_assets_for_license_asset_group_request ->
    ( list_assets_for_license_asset_group_response Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `AccessDeniedException of access_denied_exception
      | `AuthorizationException of authorization_exception
      | `InvalidParameterValueException of invalid_parameter_value_exception
      | `RateLimitExceededException of rate_limit_exceeded_exception
      | `ServerInternalException of server_internal_exception
      | `ValidationException of validation_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc "Lists assets for a license asset group.\n"]

module ListAssociationsForLicenseConfiguration : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `AccessDeniedException of access_denied_exception
    | `AuthorizationException of authorization_exception
    | `FilterLimitExceededException of filter_limit_exceeded_exception
    | `InvalidParameterValueException of invalid_parameter_value_exception
    | `RateLimitExceededException of rate_limit_exceeded_exception
    | `ServerInternalException of server_internal_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    list_associations_for_license_configuration_request ->
    ( list_associations_for_license_configuration_response,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `AccessDeniedException of access_denied_exception
      | `AuthorizationException of authorization_exception
      | `FilterLimitExceededException of filter_limit_exceeded_exception
      | `InvalidParameterValueException of invalid_parameter_value_exception
      | `RateLimitExceededException of rate_limit_exceeded_exception
      | `ServerInternalException of server_internal_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    list_associations_for_license_configuration_request ->
    ( list_associations_for_license_configuration_response Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `AccessDeniedException of access_denied_exception
      | `AuthorizationException of authorization_exception
      | `FilterLimitExceededException of filter_limit_exceeded_exception
      | `InvalidParameterValueException of invalid_parameter_value_exception
      | `RateLimitExceededException of rate_limit_exceeded_exception
      | `ServerInternalException of server_internal_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "Lists the resource associations for the specified license configuration.\n\n\
  \ Resource associations need not consume licenses from a license configuration. For example, an \
   AMI or a stopped instance might not consume a license (depending on the license rules).\n\
  \ "]

module ListDistributedGrants : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `AccessDeniedException of access_denied_exception
    | `AuthorizationException of authorization_exception
    | `InvalidParameterValueException of invalid_parameter_value_exception
    | `RateLimitExceededException of rate_limit_exceeded_exception
    | `ResourceLimitExceededException of resource_limit_exceeded_exception
    | `ServerInternalException of server_internal_exception
    | `ValidationException of validation_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    list_distributed_grants_request ->
    ( list_distributed_grants_response,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `AccessDeniedException of access_denied_exception
      | `AuthorizationException of authorization_exception
      | `InvalidParameterValueException of invalid_parameter_value_exception
      | `RateLimitExceededException of rate_limit_exceeded_exception
      | `ResourceLimitExceededException of resource_limit_exceeded_exception
      | `ServerInternalException of server_internal_exception
      | `ValidationException of validation_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    list_distributed_grants_request ->
    ( list_distributed_grants_response Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `AccessDeniedException of access_denied_exception
      | `AuthorizationException of authorization_exception
      | `InvalidParameterValueException of invalid_parameter_value_exception
      | `RateLimitExceededException of rate_limit_exceeded_exception
      | `ResourceLimitExceededException of resource_limit_exceeded_exception
      | `ServerInternalException of server_internal_exception
      | `ValidationException of validation_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc "Lists the grants distributed for the specified license.\n"]

module ListFailuresForLicenseConfigurationOperations : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `AccessDeniedException of access_denied_exception
    | `AuthorizationException of authorization_exception
    | `InvalidParameterValueException of invalid_parameter_value_exception
    | `RateLimitExceededException of rate_limit_exceeded_exception
    | `ServerInternalException of server_internal_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    list_failures_for_license_configuration_operations_request ->
    ( list_failures_for_license_configuration_operations_response,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `AccessDeniedException of access_denied_exception
      | `AuthorizationException of authorization_exception
      | `InvalidParameterValueException of invalid_parameter_value_exception
      | `RateLimitExceededException of rate_limit_exceeded_exception
      | `ServerInternalException of server_internal_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    list_failures_for_license_configuration_operations_request ->
    ( list_failures_for_license_configuration_operations_response Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `AccessDeniedException of access_denied_exception
      | `AuthorizationException of authorization_exception
      | `InvalidParameterValueException of invalid_parameter_value_exception
      | `RateLimitExceededException of rate_limit_exceeded_exception
      | `ServerInternalException of server_internal_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc "Lists the license configuration operations that failed.\n"]

module ListLicenseAssetGroups : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `AccessDeniedException of access_denied_exception
    | `AuthorizationException of authorization_exception
    | `InvalidParameterValueException of invalid_parameter_value_exception
    | `RateLimitExceededException of rate_limit_exceeded_exception
    | `ServerInternalException of server_internal_exception
    | `ValidationException of validation_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    list_license_asset_groups_request ->
    ( list_license_asset_groups_response,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `AccessDeniedException of access_denied_exception
      | `AuthorizationException of authorization_exception
      | `InvalidParameterValueException of invalid_parameter_value_exception
      | `RateLimitExceededException of rate_limit_exceeded_exception
      | `ServerInternalException of server_internal_exception
      | `ValidationException of validation_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    list_license_asset_groups_request ->
    ( list_license_asset_groups_response Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `AccessDeniedException of access_denied_exception
      | `AuthorizationException of authorization_exception
      | `InvalidParameterValueException of invalid_parameter_value_exception
      | `RateLimitExceededException of rate_limit_exceeded_exception
      | `ServerInternalException of server_internal_exception
      | `ValidationException of validation_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc "Lists license asset groups.\n"]

module ListLicenseAssetRulesets : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `AccessDeniedException of access_denied_exception
    | `AuthorizationException of authorization_exception
    | `InvalidParameterValueException of invalid_parameter_value_exception
    | `RateLimitExceededException of rate_limit_exceeded_exception
    | `ServerInternalException of server_internal_exception
    | `ValidationException of validation_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    list_license_asset_rulesets_request ->
    ( list_license_asset_rulesets_response,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `AccessDeniedException of access_denied_exception
      | `AuthorizationException of authorization_exception
      | `InvalidParameterValueException of invalid_parameter_value_exception
      | `RateLimitExceededException of rate_limit_exceeded_exception
      | `ServerInternalException of server_internal_exception
      | `ValidationException of validation_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    list_license_asset_rulesets_request ->
    ( list_license_asset_rulesets_response Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `AccessDeniedException of access_denied_exception
      | `AuthorizationException of authorization_exception
      | `InvalidParameterValueException of invalid_parameter_value_exception
      | `RateLimitExceededException of rate_limit_exceeded_exception
      | `ServerInternalException of server_internal_exception
      | `ValidationException of validation_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc "Lists license asset rulesets.\n"]

module ListLicenseConfigurations : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `AccessDeniedException of access_denied_exception
    | `AuthorizationException of authorization_exception
    | `FilterLimitExceededException of filter_limit_exceeded_exception
    | `InvalidParameterValueException of invalid_parameter_value_exception
    | `RateLimitExceededException of rate_limit_exceeded_exception
    | `ServerInternalException of server_internal_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    list_license_configurations_request ->
    ( list_license_configurations_response,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `AccessDeniedException of access_denied_exception
      | `AuthorizationException of authorization_exception
      | `FilterLimitExceededException of filter_limit_exceeded_exception
      | `InvalidParameterValueException of invalid_parameter_value_exception
      | `RateLimitExceededException of rate_limit_exceeded_exception
      | `ServerInternalException of server_internal_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    list_license_configurations_request ->
    ( list_license_configurations_response Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `AccessDeniedException of access_denied_exception
      | `AuthorizationException of authorization_exception
      | `FilterLimitExceededException of filter_limit_exceeded_exception
      | `InvalidParameterValueException of invalid_parameter_value_exception
      | `RateLimitExceededException of rate_limit_exceeded_exception
      | `ServerInternalException of server_internal_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc "Lists the license configurations for your account.\n"]

module ListLicenseConfigurationsForOrganization : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `AccessDeniedException of access_denied_exception
    | `AuthorizationException of authorization_exception
    | `FilterLimitExceededException of filter_limit_exceeded_exception
    | `InvalidParameterValueException of invalid_parameter_value_exception
    | `RateLimitExceededException of rate_limit_exceeded_exception
    | `ServerInternalException of server_internal_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    list_license_configurations_for_organization_request ->
    ( list_license_configurations_for_organization_response,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `AccessDeniedException of access_denied_exception
      | `AuthorizationException of authorization_exception
      | `FilterLimitExceededException of filter_limit_exceeded_exception
      | `InvalidParameterValueException of invalid_parameter_value_exception
      | `RateLimitExceededException of rate_limit_exceeded_exception
      | `ServerInternalException of server_internal_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    list_license_configurations_for_organization_request ->
    ( list_license_configurations_for_organization_response Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `AccessDeniedException of access_denied_exception
      | `AuthorizationException of authorization_exception
      | `FilterLimitExceededException of filter_limit_exceeded_exception
      | `InvalidParameterValueException of invalid_parameter_value_exception
      | `RateLimitExceededException of rate_limit_exceeded_exception
      | `ServerInternalException of server_internal_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc "Lists license configurations for an organization.\n"]

module ListLicenseConversionTasks : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `AccessDeniedException of access_denied_exception
    | `AuthorizationException of authorization_exception
    | `InvalidParameterValueException of invalid_parameter_value_exception
    | `RateLimitExceededException of rate_limit_exceeded_exception
    | `ServerInternalException of server_internal_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    list_license_conversion_tasks_request ->
    ( list_license_conversion_tasks_response,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `AccessDeniedException of access_denied_exception
      | `AuthorizationException of authorization_exception
      | `InvalidParameterValueException of invalid_parameter_value_exception
      | `RateLimitExceededException of rate_limit_exceeded_exception
      | `ServerInternalException of server_internal_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    list_license_conversion_tasks_request ->
    ( list_license_conversion_tasks_response Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `AccessDeniedException of access_denied_exception
      | `AuthorizationException of authorization_exception
      | `InvalidParameterValueException of invalid_parameter_value_exception
      | `RateLimitExceededException of rate_limit_exceeded_exception
      | `ServerInternalException of server_internal_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc "Lists the license type conversion tasks for your account.\n"]

module ListLicenseManagerReportGenerators : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `AccessDeniedException of access_denied_exception
    | `AuthorizationException of authorization_exception
    | `InvalidParameterValueException of invalid_parameter_value_exception
    | `RateLimitExceededException of rate_limit_exceeded_exception
    | `ResourceLimitExceededException of resource_limit_exceeded_exception
    | `ResourceNotFoundException of resource_not_found_exception
    | `ServerInternalException of server_internal_exception
    | `ValidationException of validation_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    list_license_manager_report_generators_request ->
    ( list_license_manager_report_generators_response,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `AccessDeniedException of access_denied_exception
      | `AuthorizationException of authorization_exception
      | `InvalidParameterValueException of invalid_parameter_value_exception
      | `RateLimitExceededException of rate_limit_exceeded_exception
      | `ResourceLimitExceededException of resource_limit_exceeded_exception
      | `ResourceNotFoundException of resource_not_found_exception
      | `ServerInternalException of server_internal_exception
      | `ValidationException of validation_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    list_license_manager_report_generators_request ->
    ( list_license_manager_report_generators_response Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `AccessDeniedException of access_denied_exception
      | `AuthorizationException of authorization_exception
      | `InvalidParameterValueException of invalid_parameter_value_exception
      | `RateLimitExceededException of rate_limit_exceeded_exception
      | `ResourceLimitExceededException of resource_limit_exceeded_exception
      | `ResourceNotFoundException of resource_not_found_exception
      | `ServerInternalException of server_internal_exception
      | `ValidationException of validation_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc "Lists the report generators for your account.\n"]

module ListLicenses : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `AccessDeniedException of access_denied_exception
    | `AuthorizationException of authorization_exception
    | `InvalidParameterValueException of invalid_parameter_value_exception
    | `RateLimitExceededException of rate_limit_exceeded_exception
    | `ServerInternalException of server_internal_exception
    | `ValidationException of validation_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    list_licenses_request ->
    ( list_licenses_response,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `AccessDeniedException of access_denied_exception
      | `AuthorizationException of authorization_exception
      | `InvalidParameterValueException of invalid_parameter_value_exception
      | `RateLimitExceededException of rate_limit_exceeded_exception
      | `ServerInternalException of server_internal_exception
      | `ValidationException of validation_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    list_licenses_request ->
    ( list_licenses_response Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `AccessDeniedException of access_denied_exception
      | `AuthorizationException of authorization_exception
      | `InvalidParameterValueException of invalid_parameter_value_exception
      | `RateLimitExceededException of rate_limit_exceeded_exception
      | `ServerInternalException of server_internal_exception
      | `ValidationException of validation_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc "Lists the licenses for your account.\n"]

module ListLicenseSpecificationsForResource : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `AccessDeniedException of access_denied_exception
    | `AuthorizationException of authorization_exception
    | `InvalidParameterValueException of invalid_parameter_value_exception
    | `RateLimitExceededException of rate_limit_exceeded_exception
    | `ServerInternalException of server_internal_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    list_license_specifications_for_resource_request ->
    ( list_license_specifications_for_resource_response,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `AccessDeniedException of access_denied_exception
      | `AuthorizationException of authorization_exception
      | `InvalidParameterValueException of invalid_parameter_value_exception
      | `RateLimitExceededException of rate_limit_exceeded_exception
      | `ServerInternalException of server_internal_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    list_license_specifications_for_resource_request ->
    ( list_license_specifications_for_resource_response Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `AccessDeniedException of access_denied_exception
      | `AuthorizationException of authorization_exception
      | `InvalidParameterValueException of invalid_parameter_value_exception
      | `RateLimitExceededException of rate_limit_exceeded_exception
      | `ServerInternalException of server_internal_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc "Describes the license configurations for the specified resource.\n"]

module ListLicenseVersions : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `AccessDeniedException of access_denied_exception
    | `AuthorizationException of authorization_exception
    | `InvalidParameterValueException of invalid_parameter_value_exception
    | `RateLimitExceededException of rate_limit_exceeded_exception
    | `ServerInternalException of server_internal_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    list_license_versions_request ->
    ( list_license_versions_response,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `AccessDeniedException of access_denied_exception
      | `AuthorizationException of authorization_exception
      | `InvalidParameterValueException of invalid_parameter_value_exception
      | `RateLimitExceededException of rate_limit_exceeded_exception
      | `ServerInternalException of server_internal_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    list_license_versions_request ->
    ( list_license_versions_response Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `AccessDeniedException of access_denied_exception
      | `AuthorizationException of authorization_exception
      | `InvalidParameterValueException of invalid_parameter_value_exception
      | `RateLimitExceededException of rate_limit_exceeded_exception
      | `ServerInternalException of server_internal_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc "Lists all versions of the specified license.\n"]

module ListReceivedGrants : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `AccessDeniedException of access_denied_exception
    | `AuthorizationException of authorization_exception
    | `InvalidParameterValueException of invalid_parameter_value_exception
    | `RateLimitExceededException of rate_limit_exceeded_exception
    | `ResourceLimitExceededException of resource_limit_exceeded_exception
    | `ServerInternalException of server_internal_exception
    | `ValidationException of validation_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    list_received_grants_request ->
    ( list_received_grants_response,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `AccessDeniedException of access_denied_exception
      | `AuthorizationException of authorization_exception
      | `InvalidParameterValueException of invalid_parameter_value_exception
      | `RateLimitExceededException of rate_limit_exceeded_exception
      | `ResourceLimitExceededException of resource_limit_exceeded_exception
      | `ServerInternalException of server_internal_exception
      | `ValidationException of validation_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    list_received_grants_request ->
    ( list_received_grants_response Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `AccessDeniedException of access_denied_exception
      | `AuthorizationException of authorization_exception
      | `InvalidParameterValueException of invalid_parameter_value_exception
      | `RateLimitExceededException of rate_limit_exceeded_exception
      | `ResourceLimitExceededException of resource_limit_exceeded_exception
      | `ServerInternalException of server_internal_exception
      | `ValidationException of validation_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "Lists grants that are received. Received grants are grants created while specifying the \
   recipient as this Amazon Web Services account, your organization, or an organizational unit \
   (OU) to which this member account belongs.\n"]

module ListReceivedGrantsForOrganization : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `AccessDeniedException of access_denied_exception
    | `AuthorizationException of authorization_exception
    | `InvalidParameterValueException of invalid_parameter_value_exception
    | `RateLimitExceededException of rate_limit_exceeded_exception
    | `ResourceLimitExceededException of resource_limit_exceeded_exception
    | `ServerInternalException of server_internal_exception
    | `ValidationException of validation_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    list_received_grants_for_organization_request ->
    ( list_received_grants_for_organization_response,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `AccessDeniedException of access_denied_exception
      | `AuthorizationException of authorization_exception
      | `InvalidParameterValueException of invalid_parameter_value_exception
      | `RateLimitExceededException of rate_limit_exceeded_exception
      | `ResourceLimitExceededException of resource_limit_exceeded_exception
      | `ServerInternalException of server_internal_exception
      | `ValidationException of validation_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    list_received_grants_for_organization_request ->
    ( list_received_grants_for_organization_response Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `AccessDeniedException of access_denied_exception
      | `AuthorizationException of authorization_exception
      | `InvalidParameterValueException of invalid_parameter_value_exception
      | `RateLimitExceededException of rate_limit_exceeded_exception
      | `ResourceLimitExceededException of resource_limit_exceeded_exception
      | `ServerInternalException of server_internal_exception
      | `ValidationException of validation_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc "Lists the grants received for all accounts in the organization.\n"]

module ListReceivedLicenses : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `AccessDeniedException of access_denied_exception
    | `AuthorizationException of authorization_exception
    | `InvalidParameterValueException of invalid_parameter_value_exception
    | `RateLimitExceededException of rate_limit_exceeded_exception
    | `ResourceLimitExceededException of resource_limit_exceeded_exception
    | `ServerInternalException of server_internal_exception
    | `ValidationException of validation_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    list_received_licenses_request ->
    ( list_received_licenses_response,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `AccessDeniedException of access_denied_exception
      | `AuthorizationException of authorization_exception
      | `InvalidParameterValueException of invalid_parameter_value_exception
      | `RateLimitExceededException of rate_limit_exceeded_exception
      | `ResourceLimitExceededException of resource_limit_exceeded_exception
      | `ServerInternalException of server_internal_exception
      | `ValidationException of validation_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    list_received_licenses_request ->
    ( list_received_licenses_response Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `AccessDeniedException of access_denied_exception
      | `AuthorizationException of authorization_exception
      | `InvalidParameterValueException of invalid_parameter_value_exception
      | `RateLimitExceededException of rate_limit_exceeded_exception
      | `ResourceLimitExceededException of resource_limit_exceeded_exception
      | `ServerInternalException of server_internal_exception
      | `ValidationException of validation_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc "Lists received licenses.\n"]

module ListReceivedLicensesForOrganization : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `AccessDeniedException of access_denied_exception
    | `AuthorizationException of authorization_exception
    | `InvalidParameterValueException of invalid_parameter_value_exception
    | `RateLimitExceededException of rate_limit_exceeded_exception
    | `ResourceLimitExceededException of resource_limit_exceeded_exception
    | `ServerInternalException of server_internal_exception
    | `ValidationException of validation_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    list_received_licenses_for_organization_request ->
    ( list_received_licenses_for_organization_response,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `AccessDeniedException of access_denied_exception
      | `AuthorizationException of authorization_exception
      | `InvalidParameterValueException of invalid_parameter_value_exception
      | `RateLimitExceededException of rate_limit_exceeded_exception
      | `ResourceLimitExceededException of resource_limit_exceeded_exception
      | `ServerInternalException of server_internal_exception
      | `ValidationException of validation_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    list_received_licenses_for_organization_request ->
    ( list_received_licenses_for_organization_response Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `AccessDeniedException of access_denied_exception
      | `AuthorizationException of authorization_exception
      | `InvalidParameterValueException of invalid_parameter_value_exception
      | `RateLimitExceededException of rate_limit_exceeded_exception
      | `ResourceLimitExceededException of resource_limit_exceeded_exception
      | `ServerInternalException of server_internal_exception
      | `ValidationException of validation_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc "Lists the licenses received for all accounts in the organization.\n"]

module ListResourceInventory : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `AccessDeniedException of access_denied_exception
    | `AuthorizationException of authorization_exception
    | `FailedDependencyException of failed_dependency_exception
    | `FilterLimitExceededException of filter_limit_exceeded_exception
    | `InvalidParameterValueException of invalid_parameter_value_exception
    | `RateLimitExceededException of rate_limit_exceeded_exception
    | `ServerInternalException of server_internal_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    list_resource_inventory_request ->
    ( list_resource_inventory_response,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `AccessDeniedException of access_denied_exception
      | `AuthorizationException of authorization_exception
      | `FailedDependencyException of failed_dependency_exception
      | `FilterLimitExceededException of filter_limit_exceeded_exception
      | `InvalidParameterValueException of invalid_parameter_value_exception
      | `RateLimitExceededException of rate_limit_exceeded_exception
      | `ServerInternalException of server_internal_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    list_resource_inventory_request ->
    ( list_resource_inventory_response Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `AccessDeniedException of access_denied_exception
      | `AuthorizationException of authorization_exception
      | `FailedDependencyException of failed_dependency_exception
      | `FilterLimitExceededException of filter_limit_exceeded_exception
      | `InvalidParameterValueException of invalid_parameter_value_exception
      | `RateLimitExceededException of rate_limit_exceeded_exception
      | `ServerInternalException of server_internal_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc "Lists resources managed using Systems Manager inventory.\n"]

module ListTagsForResource : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `AccessDeniedException of access_denied_exception
    | `AuthorizationException of authorization_exception
    | `InvalidParameterValueException of invalid_parameter_value_exception
    | `RateLimitExceededException of rate_limit_exceeded_exception
    | `ServerInternalException of server_internal_exception
    | `ValidationException of validation_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    list_tags_for_resource_request ->
    ( list_tags_for_resource_response,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `AccessDeniedException of access_denied_exception
      | `AuthorizationException of authorization_exception
      | `InvalidParameterValueException of invalid_parameter_value_exception
      | `RateLimitExceededException of rate_limit_exceeded_exception
      | `ServerInternalException of server_internal_exception
      | `ValidationException of validation_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    list_tags_for_resource_request ->
    ( list_tags_for_resource_response Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `AccessDeniedException of access_denied_exception
      | `AuthorizationException of authorization_exception
      | `InvalidParameterValueException of invalid_parameter_value_exception
      | `RateLimitExceededException of rate_limit_exceeded_exception
      | `ServerInternalException of server_internal_exception
      | `ValidationException of validation_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "Lists the tags for the specified resource. For more information about tagging support in \
   License Manager, see the \
   {{:https://docs.aws.amazon.com/license-manager/latest/APIReference/API_TagResource.html}TagResource} \
   operation.\n"]

module ListTokens : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `AccessDeniedException of access_denied_exception
    | `AuthorizationException of authorization_exception
    | `RateLimitExceededException of rate_limit_exceeded_exception
    | `ServerInternalException of server_internal_exception
    | `ValidationException of validation_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    list_tokens_request ->
    ( list_tokens_response,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `AccessDeniedException of access_denied_exception
      | `AuthorizationException of authorization_exception
      | `RateLimitExceededException of rate_limit_exceeded_exception
      | `ServerInternalException of server_internal_exception
      | `ValidationException of validation_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    list_tokens_request ->
    ( list_tokens_response Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `AccessDeniedException of access_denied_exception
      | `AuthorizationException of authorization_exception
      | `RateLimitExceededException of rate_limit_exceeded_exception
      | `ServerInternalException of server_internal_exception
      | `ValidationException of validation_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc "Lists your tokens.\n"]

module ListUsageForLicenseConfiguration : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `AccessDeniedException of access_denied_exception
    | `AuthorizationException of authorization_exception
    | `FilterLimitExceededException of filter_limit_exceeded_exception
    | `InvalidParameterValueException of invalid_parameter_value_exception
    | `RateLimitExceededException of rate_limit_exceeded_exception
    | `ServerInternalException of server_internal_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    list_usage_for_license_configuration_request ->
    ( list_usage_for_license_configuration_response,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `AccessDeniedException of access_denied_exception
      | `AuthorizationException of authorization_exception
      | `FilterLimitExceededException of filter_limit_exceeded_exception
      | `InvalidParameterValueException of invalid_parameter_value_exception
      | `RateLimitExceededException of rate_limit_exceeded_exception
      | `ServerInternalException of server_internal_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    list_usage_for_license_configuration_request ->
    ( list_usage_for_license_configuration_response Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `AccessDeniedException of access_denied_exception
      | `AuthorizationException of authorization_exception
      | `FilterLimitExceededException of filter_limit_exceeded_exception
      | `InvalidParameterValueException of invalid_parameter_value_exception
      | `RateLimitExceededException of rate_limit_exceeded_exception
      | `ServerInternalException of server_internal_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "Lists all license usage records for a license configuration, displaying license consumption \
   details by resource at a selected point in time. Use this action to audit the current license \
   consumption for any license inventory and configuration.\n"]

module RejectGrant : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `AccessDeniedException of access_denied_exception
    | `AuthorizationException of authorization_exception
    | `InvalidParameterValueException of invalid_parameter_value_exception
    | `RateLimitExceededException of rate_limit_exceeded_exception
    | `ResourceLimitExceededException of resource_limit_exceeded_exception
    | `ServerInternalException of server_internal_exception
    | `ValidationException of validation_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    reject_grant_request ->
    ( reject_grant_response,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `AccessDeniedException of access_denied_exception
      | `AuthorizationException of authorization_exception
      | `InvalidParameterValueException of invalid_parameter_value_exception
      | `RateLimitExceededException of rate_limit_exceeded_exception
      | `ResourceLimitExceededException of resource_limit_exceeded_exception
      | `ServerInternalException of server_internal_exception
      | `ValidationException of validation_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    reject_grant_request ->
    ( reject_grant_response Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `AccessDeniedException of access_denied_exception
      | `AuthorizationException of authorization_exception
      | `InvalidParameterValueException of invalid_parameter_value_exception
      | `RateLimitExceededException of rate_limit_exceeded_exception
      | `ResourceLimitExceededException of resource_limit_exceeded_exception
      | `ServerInternalException of server_internal_exception
      | `ValidationException of validation_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc "Rejects the specified grant.\n"]

module TagResource : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `AccessDeniedException of access_denied_exception
    | `AuthorizationException of authorization_exception
    | `InvalidParameterValueException of invalid_parameter_value_exception
    | `RateLimitExceededException of rate_limit_exceeded_exception
    | `ServerInternalException of server_internal_exception
    | `ValidationException of validation_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    tag_resource_request ->
    ( tag_resource_response,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `AccessDeniedException of access_denied_exception
      | `AuthorizationException of authorization_exception
      | `InvalidParameterValueException of invalid_parameter_value_exception
      | `RateLimitExceededException of rate_limit_exceeded_exception
      | `ServerInternalException of server_internal_exception
      | `ValidationException of validation_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    tag_resource_request ->
    ( tag_resource_response Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `AccessDeniedException of access_denied_exception
      | `AuthorizationException of authorization_exception
      | `InvalidParameterValueException of invalid_parameter_value_exception
      | `RateLimitExceededException of rate_limit_exceeded_exception
      | `ServerInternalException of server_internal_exception
      | `ValidationException of validation_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "Adds the specified tags to the specified resource. The following resources support tagging in \
   License Manager:\n\n\
  \ {ul\n\
  \       {-  Licenses\n\
  \           \n\
  \            }\n\
  \       {-  Grants\n\
  \           \n\
  \            }\n\
  \       {-  License configurations\n\
  \           \n\
  \            }\n\
  \       {-  Report generators\n\
  \           \n\
  \            }\n\
  \       }\n\
  \  "]

module UntagResource : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `AccessDeniedException of access_denied_exception
    | `AuthorizationException of authorization_exception
    | `InvalidParameterValueException of invalid_parameter_value_exception
    | `RateLimitExceededException of rate_limit_exceeded_exception
    | `ServerInternalException of server_internal_exception
    | `ValidationException of validation_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    untag_resource_request ->
    ( untag_resource_response,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `AccessDeniedException of access_denied_exception
      | `AuthorizationException of authorization_exception
      | `InvalidParameterValueException of invalid_parameter_value_exception
      | `RateLimitExceededException of rate_limit_exceeded_exception
      | `ServerInternalException of server_internal_exception
      | `ValidationException of validation_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    untag_resource_request ->
    ( untag_resource_response Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `AccessDeniedException of access_denied_exception
      | `AuthorizationException of authorization_exception
      | `InvalidParameterValueException of invalid_parameter_value_exception
      | `RateLimitExceededException of rate_limit_exceeded_exception
      | `ServerInternalException of server_internal_exception
      | `ValidationException of validation_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc "Removes the specified tags from the specified resource.\n"]

module UpdateLicenseAssetGroup : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `AccessDeniedException of access_denied_exception
    | `AuthorizationException of authorization_exception
    | `InvalidParameterValueException of invalid_parameter_value_exception
    | `RateLimitExceededException of rate_limit_exceeded_exception
    | `ServerInternalException of server_internal_exception
    | `ValidationException of validation_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    update_license_asset_group_request ->
    ( update_license_asset_group_response,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `AccessDeniedException of access_denied_exception
      | `AuthorizationException of authorization_exception
      | `InvalidParameterValueException of invalid_parameter_value_exception
      | `RateLimitExceededException of rate_limit_exceeded_exception
      | `ServerInternalException of server_internal_exception
      | `ValidationException of validation_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    update_license_asset_group_request ->
    ( update_license_asset_group_response Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `AccessDeniedException of access_denied_exception
      | `AuthorizationException of authorization_exception
      | `InvalidParameterValueException of invalid_parameter_value_exception
      | `RateLimitExceededException of rate_limit_exceeded_exception
      | `ServerInternalException of server_internal_exception
      | `ValidationException of validation_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc "Updates a license asset group.\n"]

module UpdateLicenseAssetRuleset : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `AccessDeniedException of access_denied_exception
    | `AuthorizationException of authorization_exception
    | `InvalidParameterValueException of invalid_parameter_value_exception
    | `RateLimitExceededException of rate_limit_exceeded_exception
    | `ServerInternalException of server_internal_exception
    | `ValidationException of validation_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    update_license_asset_ruleset_request ->
    ( update_license_asset_ruleset_response,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `AccessDeniedException of access_denied_exception
      | `AuthorizationException of authorization_exception
      | `InvalidParameterValueException of invalid_parameter_value_exception
      | `RateLimitExceededException of rate_limit_exceeded_exception
      | `ServerInternalException of server_internal_exception
      | `ValidationException of validation_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    update_license_asset_ruleset_request ->
    ( update_license_asset_ruleset_response Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `AccessDeniedException of access_denied_exception
      | `AuthorizationException of authorization_exception
      | `InvalidParameterValueException of invalid_parameter_value_exception
      | `RateLimitExceededException of rate_limit_exceeded_exception
      | `ServerInternalException of server_internal_exception
      | `ValidationException of validation_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc "Updates a license asset ruleset.\n"]

module UpdateLicenseConfiguration : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `AccessDeniedException of access_denied_exception
    | `AuthorizationException of authorization_exception
    | `ConflictException of conflict_exception
    | `InvalidParameterValueException of invalid_parameter_value_exception
    | `RateLimitExceededException of rate_limit_exceeded_exception
    | `ResourceLimitExceededException of resource_limit_exceeded_exception
    | `ServerInternalException of server_internal_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    update_license_configuration_request ->
    ( update_license_configuration_response,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `AccessDeniedException of access_denied_exception
      | `AuthorizationException of authorization_exception
      | `ConflictException of conflict_exception
      | `InvalidParameterValueException of invalid_parameter_value_exception
      | `RateLimitExceededException of rate_limit_exceeded_exception
      | `ResourceLimitExceededException of resource_limit_exceeded_exception
      | `ServerInternalException of server_internal_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    update_license_configuration_request ->
    ( update_license_configuration_response Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `AccessDeniedException of access_denied_exception
      | `AuthorizationException of authorization_exception
      | `ConflictException of conflict_exception
      | `InvalidParameterValueException of invalid_parameter_value_exception
      | `RateLimitExceededException of rate_limit_exceeded_exception
      | `ResourceLimitExceededException of resource_limit_exceeded_exception
      | `ServerInternalException of server_internal_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc "Modifies the attributes of an existing license configuration.\n"]

module UpdateLicenseManagerReportGenerator : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `AccessDeniedException of access_denied_exception
    | `AuthorizationException of authorization_exception
    | `InvalidParameterValueException of invalid_parameter_value_exception
    | `RateLimitExceededException of rate_limit_exceeded_exception
    | `ResourceLimitExceededException of resource_limit_exceeded_exception
    | `ResourceNotFoundException of resource_not_found_exception
    | `ServerInternalException of server_internal_exception
    | `ValidationException of validation_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    update_license_manager_report_generator_request ->
    ( update_license_manager_report_generator_response,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `AccessDeniedException of access_denied_exception
      | `AuthorizationException of authorization_exception
      | `InvalidParameterValueException of invalid_parameter_value_exception
      | `RateLimitExceededException of rate_limit_exceeded_exception
      | `ResourceLimitExceededException of resource_limit_exceeded_exception
      | `ResourceNotFoundException of resource_not_found_exception
      | `ServerInternalException of server_internal_exception
      | `ValidationException of validation_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    update_license_manager_report_generator_request ->
    ( update_license_manager_report_generator_response Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `AccessDeniedException of access_denied_exception
      | `AuthorizationException of authorization_exception
      | `InvalidParameterValueException of invalid_parameter_value_exception
      | `RateLimitExceededException of rate_limit_exceeded_exception
      | `ResourceLimitExceededException of resource_limit_exceeded_exception
      | `ResourceNotFoundException of resource_not_found_exception
      | `ServerInternalException of server_internal_exception
      | `ValidationException of validation_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "Updates a report generator.\n\n\
  \ After you make changes to a report generator, it starts generating new reports within 60 \
   minutes of being updated.\n\
  \ "]

module UpdateLicenseSpecificationsForResource : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `AccessDeniedException of access_denied_exception
    | `AuthorizationException of authorization_exception
    | `ConflictException of conflict_exception
    | `InvalidParameterValueException of invalid_parameter_value_exception
    | `InvalidResourceStateException of invalid_resource_state_exception
    | `LicenseUsageException of license_usage_exception
    | `RateLimitExceededException of rate_limit_exceeded_exception
    | `ServerInternalException of server_internal_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    update_license_specifications_for_resource_request ->
    ( update_license_specifications_for_resource_response,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `AccessDeniedException of access_denied_exception
      | `AuthorizationException of authorization_exception
      | `ConflictException of conflict_exception
      | `InvalidParameterValueException of invalid_parameter_value_exception
      | `InvalidResourceStateException of invalid_resource_state_exception
      | `LicenseUsageException of license_usage_exception
      | `RateLimitExceededException of rate_limit_exceeded_exception
      | `ServerInternalException of server_internal_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    update_license_specifications_for_resource_request ->
    ( update_license_specifications_for_resource_response Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `AccessDeniedException of access_denied_exception
      | `AuthorizationException of authorization_exception
      | `ConflictException of conflict_exception
      | `InvalidParameterValueException of invalid_parameter_value_exception
      | `InvalidResourceStateException of invalid_resource_state_exception
      | `LicenseUsageException of license_usage_exception
      | `RateLimitExceededException of rate_limit_exceeded_exception
      | `ServerInternalException of server_internal_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "Adds or removes the specified license configurations for the specified Amazon Web Services \
   resource.\n\n\
  \ You can update the license specifications of AMIs, instances, and hosts. You cannot update the \
   license specifications for launch templates and CloudFormation templates, as they send license \
   configurations to the operation that creates the resource.\n\
  \ "]

module UpdateServiceSettings : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `AccessDeniedException of access_denied_exception
    | `AuthorizationException of authorization_exception
    | `ConflictException of conflict_exception
    | `InvalidParameterValueException of invalid_parameter_value_exception
    | `RateLimitExceededException of rate_limit_exceeded_exception
    | `ServerInternalException of server_internal_exception
    | `ValidationException of validation_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    update_service_settings_request ->
    ( update_service_settings_response,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `AccessDeniedException of access_denied_exception
      | `AuthorizationException of authorization_exception
      | `ConflictException of conflict_exception
      | `InvalidParameterValueException of invalid_parameter_value_exception
      | `RateLimitExceededException of rate_limit_exceeded_exception
      | `ServerInternalException of server_internal_exception
      | `ValidationException of validation_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    update_service_settings_request ->
    ( update_service_settings_response Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `AccessDeniedException of access_denied_exception
      | `AuthorizationException of authorization_exception
      | `ConflictException of conflict_exception
      | `InvalidParameterValueException of invalid_parameter_value_exception
      | `RateLimitExceededException of rate_limit_exceeded_exception
      | `ServerInternalException of server_internal_exception
      | `ValidationException of validation_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc "Updates License Manager settings for the current Region.\n"]
