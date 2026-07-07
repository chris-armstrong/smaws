open Types
open Service_metadata

module AcceptGrant = struct
  let error_to_string = function
    | `AccessDeniedException _ -> "com.amazonaws.licensemanager#AccessDeniedException"
    | `AuthorizationException _ -> "com.amazonaws.licensemanager#AuthorizationException"
    | `InvalidParameterValueException _ ->
        "com.amazonaws.licensemanager#InvalidParameterValueException"
    | `RateLimitExceededException _ -> "com.amazonaws.licensemanager#RateLimitExceededException"
    | `ResourceLimitExceededException _ ->
        "com.amazonaws.licensemanager#ResourceLimitExceededException"
    | `ServerInternalException _ -> "com.amazonaws.licensemanager#ServerInternalException"
    | `ValidationException _ -> "com.amazonaws.licensemanager#ValidationException"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "AccessDeniedException" ->
          `AccessDeniedException (Json_deserializers.access_denied_exception_of_yojson tree path)
      | _, "AuthorizationException" ->
          `AuthorizationException (Json_deserializers.authorization_exception_of_yojson tree path)
      | _, "InvalidParameterValueException" ->
          `InvalidParameterValueException
            (Json_deserializers.invalid_parameter_value_exception_of_yojson tree path)
      | _, "RateLimitExceededException" ->
          `RateLimitExceededException
            (Json_deserializers.rate_limit_exceeded_exception_of_yojson tree path)
      | _, "ResourceLimitExceededException" ->
          `ResourceLimitExceededException
            (Json_deserializers.resource_limit_exceeded_exception_of_yojson tree path)
      | _, "ServerInternalException" ->
          `ServerInternalException
            (Json_deserializers.server_internal_exception_of_yojson tree path)
      | _, "ValidationException" ->
          `ValidationException (Json_deserializers.validation_exception_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : accept_grant_request) =
    let input = Json_serializers.accept_grant_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"AWSLicenseManager.AcceptGrant" ~service
      ~context ~input ~output_deserializer:Json_deserializers.accept_grant_response_of_yojson
      ~error_deserializer

  let request_with_metadata context (request : accept_grant_request) =
    let input = Json_serializers.accept_grant_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata ~shape_name:"AWSLicenseManager.AcceptGrant"
      ~service ~context ~input
      ~output_deserializer:Json_deserializers.accept_grant_response_of_yojson ~error_deserializer
end

module CheckInLicense = struct
  let error_to_string = function
    | `AccessDeniedException _ -> "com.amazonaws.licensemanager#AccessDeniedException"
    | `AuthorizationException _ -> "com.amazonaws.licensemanager#AuthorizationException"
    | `ConflictException _ -> "com.amazonaws.licensemanager#ConflictException"
    | `InvalidParameterValueException _ ->
        "com.amazonaws.licensemanager#InvalidParameterValueException"
    | `RateLimitExceededException _ -> "com.amazonaws.licensemanager#RateLimitExceededException"
    | `ResourceNotFoundException _ -> "com.amazonaws.licensemanager#ResourceNotFoundException"
    | `ServerInternalException _ -> "com.amazonaws.licensemanager#ServerInternalException"
    | `ValidationException _ -> "com.amazonaws.licensemanager#ValidationException"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "AccessDeniedException" ->
          `AccessDeniedException (Json_deserializers.access_denied_exception_of_yojson tree path)
      | _, "AuthorizationException" ->
          `AuthorizationException (Json_deserializers.authorization_exception_of_yojson tree path)
      | _, "ConflictException" ->
          `ConflictException (Json_deserializers.conflict_exception_of_yojson tree path)
      | _, "InvalidParameterValueException" ->
          `InvalidParameterValueException
            (Json_deserializers.invalid_parameter_value_exception_of_yojson tree path)
      | _, "RateLimitExceededException" ->
          `RateLimitExceededException
            (Json_deserializers.rate_limit_exceeded_exception_of_yojson tree path)
      | _, "ResourceNotFoundException" ->
          `ResourceNotFoundException
            (Json_deserializers.resource_not_found_exception_of_yojson tree path)
      | _, "ServerInternalException" ->
          `ServerInternalException
            (Json_deserializers.server_internal_exception_of_yojson tree path)
      | _, "ValidationException" ->
          `ValidationException (Json_deserializers.validation_exception_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : check_in_license_request) =
    let input = Json_serializers.check_in_license_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"AWSLicenseManager.CheckInLicense" ~service
      ~context ~input ~output_deserializer:Json_deserializers.check_in_license_response_of_yojson
      ~error_deserializer

  let request_with_metadata context (request : check_in_license_request) =
    let input = Json_serializers.check_in_license_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata ~shape_name:"AWSLicenseManager.CheckInLicense"
      ~service ~context ~input
      ~output_deserializer:Json_deserializers.check_in_license_response_of_yojson
      ~error_deserializer
end

module CheckoutBorrowLicense = struct
  let error_to_string = function
    | `AccessDeniedException _ -> "com.amazonaws.licensemanager#AccessDeniedException"
    | `AuthorizationException _ -> "com.amazonaws.licensemanager#AuthorizationException"
    | `EntitlementNotAllowedException _ ->
        "com.amazonaws.licensemanager#EntitlementNotAllowedException"
    | `InvalidParameterValueException _ ->
        "com.amazonaws.licensemanager#InvalidParameterValueException"
    | `NoEntitlementsAllowedException _ ->
        "com.amazonaws.licensemanager#NoEntitlementsAllowedException"
    | `RateLimitExceededException _ -> "com.amazonaws.licensemanager#RateLimitExceededException"
    | `RedirectException _ -> "com.amazonaws.licensemanager#RedirectException"
    | `ResourceNotFoundException _ -> "com.amazonaws.licensemanager#ResourceNotFoundException"
    | `ServerInternalException _ -> "com.amazonaws.licensemanager#ServerInternalException"
    | `UnsupportedDigitalSignatureMethodException _ ->
        "com.amazonaws.licensemanager#UnsupportedDigitalSignatureMethodException"
    | `ValidationException _ -> "com.amazonaws.licensemanager#ValidationException"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "AccessDeniedException" ->
          `AccessDeniedException (Json_deserializers.access_denied_exception_of_yojson tree path)
      | _, "AuthorizationException" ->
          `AuthorizationException (Json_deserializers.authorization_exception_of_yojson tree path)
      | _, "EntitlementNotAllowedException" ->
          `EntitlementNotAllowedException
            (Json_deserializers.entitlement_not_allowed_exception_of_yojson tree path)
      | _, "InvalidParameterValueException" ->
          `InvalidParameterValueException
            (Json_deserializers.invalid_parameter_value_exception_of_yojson tree path)
      | _, "NoEntitlementsAllowedException" ->
          `NoEntitlementsAllowedException
            (Json_deserializers.no_entitlements_allowed_exception_of_yojson tree path)
      | _, "RateLimitExceededException" ->
          `RateLimitExceededException
            (Json_deserializers.rate_limit_exceeded_exception_of_yojson tree path)
      | _, "RedirectException" ->
          `RedirectException (Json_deserializers.redirect_exception_of_yojson tree path)
      | _, "ResourceNotFoundException" ->
          `ResourceNotFoundException
            (Json_deserializers.resource_not_found_exception_of_yojson tree path)
      | _, "ServerInternalException" ->
          `ServerInternalException
            (Json_deserializers.server_internal_exception_of_yojson tree path)
      | _, "UnsupportedDigitalSignatureMethodException" ->
          `UnsupportedDigitalSignatureMethodException
            (Json_deserializers.unsupported_digital_signature_method_exception_of_yojson tree path)
      | _, "ValidationException" ->
          `ValidationException (Json_deserializers.validation_exception_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : checkout_borrow_license_request) =
    let input = Json_serializers.checkout_borrow_license_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"AWSLicenseManager.CheckoutBorrowLicense"
      ~service ~context ~input
      ~output_deserializer:Json_deserializers.checkout_borrow_license_response_of_yojson
      ~error_deserializer

  let request_with_metadata context (request : checkout_borrow_license_request) =
    let input = Json_serializers.checkout_borrow_license_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata
      ~shape_name:"AWSLicenseManager.CheckoutBorrowLicense" ~service ~context ~input
      ~output_deserializer:Json_deserializers.checkout_borrow_license_response_of_yojson
      ~error_deserializer
end

module CheckoutLicense = struct
  let error_to_string = function
    | `AccessDeniedException _ -> "com.amazonaws.licensemanager#AccessDeniedException"
    | `AuthorizationException _ -> "com.amazonaws.licensemanager#AuthorizationException"
    | `InvalidParameterValueException _ ->
        "com.amazonaws.licensemanager#InvalidParameterValueException"
    | `NoEntitlementsAllowedException _ ->
        "com.amazonaws.licensemanager#NoEntitlementsAllowedException"
    | `RateLimitExceededException _ -> "com.amazonaws.licensemanager#RateLimitExceededException"
    | `RedirectException _ -> "com.amazonaws.licensemanager#RedirectException"
    | `ResourceNotFoundException _ -> "com.amazonaws.licensemanager#ResourceNotFoundException"
    | `ServerInternalException _ -> "com.amazonaws.licensemanager#ServerInternalException"
    | `UnsupportedDigitalSignatureMethodException _ ->
        "com.amazonaws.licensemanager#UnsupportedDigitalSignatureMethodException"
    | `ValidationException _ -> "com.amazonaws.licensemanager#ValidationException"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "AccessDeniedException" ->
          `AccessDeniedException (Json_deserializers.access_denied_exception_of_yojson tree path)
      | _, "AuthorizationException" ->
          `AuthorizationException (Json_deserializers.authorization_exception_of_yojson tree path)
      | _, "InvalidParameterValueException" ->
          `InvalidParameterValueException
            (Json_deserializers.invalid_parameter_value_exception_of_yojson tree path)
      | _, "NoEntitlementsAllowedException" ->
          `NoEntitlementsAllowedException
            (Json_deserializers.no_entitlements_allowed_exception_of_yojson tree path)
      | _, "RateLimitExceededException" ->
          `RateLimitExceededException
            (Json_deserializers.rate_limit_exceeded_exception_of_yojson tree path)
      | _, "RedirectException" ->
          `RedirectException (Json_deserializers.redirect_exception_of_yojson tree path)
      | _, "ResourceNotFoundException" ->
          `ResourceNotFoundException
            (Json_deserializers.resource_not_found_exception_of_yojson tree path)
      | _, "ServerInternalException" ->
          `ServerInternalException
            (Json_deserializers.server_internal_exception_of_yojson tree path)
      | _, "UnsupportedDigitalSignatureMethodException" ->
          `UnsupportedDigitalSignatureMethodException
            (Json_deserializers.unsupported_digital_signature_method_exception_of_yojson tree path)
      | _, "ValidationException" ->
          `ValidationException (Json_deserializers.validation_exception_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : checkout_license_request) =
    let input = Json_serializers.checkout_license_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"AWSLicenseManager.CheckoutLicense" ~service
      ~context ~input ~output_deserializer:Json_deserializers.checkout_license_response_of_yojson
      ~error_deserializer

  let request_with_metadata context (request : checkout_license_request) =
    let input = Json_serializers.checkout_license_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata
      ~shape_name:"AWSLicenseManager.CheckoutLicense" ~service ~context ~input
      ~output_deserializer:Json_deserializers.checkout_license_response_of_yojson
      ~error_deserializer
end

module CreateGrant = struct
  let error_to_string = function
    | `AccessDeniedException _ -> "com.amazonaws.licensemanager#AccessDeniedException"
    | `AuthorizationException _ -> "com.amazonaws.licensemanager#AuthorizationException"
    | `InvalidParameterValueException _ ->
        "com.amazonaws.licensemanager#InvalidParameterValueException"
    | `RateLimitExceededException _ -> "com.amazonaws.licensemanager#RateLimitExceededException"
    | `ResourceLimitExceededException _ ->
        "com.amazonaws.licensemanager#ResourceLimitExceededException"
    | `ServerInternalException _ -> "com.amazonaws.licensemanager#ServerInternalException"
    | `ValidationException _ -> "com.amazonaws.licensemanager#ValidationException"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "AccessDeniedException" ->
          `AccessDeniedException (Json_deserializers.access_denied_exception_of_yojson tree path)
      | _, "AuthorizationException" ->
          `AuthorizationException (Json_deserializers.authorization_exception_of_yojson tree path)
      | _, "InvalidParameterValueException" ->
          `InvalidParameterValueException
            (Json_deserializers.invalid_parameter_value_exception_of_yojson tree path)
      | _, "RateLimitExceededException" ->
          `RateLimitExceededException
            (Json_deserializers.rate_limit_exceeded_exception_of_yojson tree path)
      | _, "ResourceLimitExceededException" ->
          `ResourceLimitExceededException
            (Json_deserializers.resource_limit_exceeded_exception_of_yojson tree path)
      | _, "ServerInternalException" ->
          `ServerInternalException
            (Json_deserializers.server_internal_exception_of_yojson tree path)
      | _, "ValidationException" ->
          `ValidationException (Json_deserializers.validation_exception_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : create_grant_request) =
    let input = Json_serializers.create_grant_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"AWSLicenseManager.CreateGrant" ~service
      ~context ~input ~output_deserializer:Json_deserializers.create_grant_response_of_yojson
      ~error_deserializer

  let request_with_metadata context (request : create_grant_request) =
    let input = Json_serializers.create_grant_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata ~shape_name:"AWSLicenseManager.CreateGrant"
      ~service ~context ~input
      ~output_deserializer:Json_deserializers.create_grant_response_of_yojson ~error_deserializer
end

module CreateGrantVersion = struct
  let error_to_string = function
    | `AccessDeniedException _ -> "com.amazonaws.licensemanager#AccessDeniedException"
    | `AuthorizationException _ -> "com.amazonaws.licensemanager#AuthorizationException"
    | `InvalidParameterValueException _ ->
        "com.amazonaws.licensemanager#InvalidParameterValueException"
    | `RateLimitExceededException _ -> "com.amazonaws.licensemanager#RateLimitExceededException"
    | `ResourceLimitExceededException _ ->
        "com.amazonaws.licensemanager#ResourceLimitExceededException"
    | `ServerInternalException _ -> "com.amazonaws.licensemanager#ServerInternalException"
    | `ValidationException _ -> "com.amazonaws.licensemanager#ValidationException"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "AccessDeniedException" ->
          `AccessDeniedException (Json_deserializers.access_denied_exception_of_yojson tree path)
      | _, "AuthorizationException" ->
          `AuthorizationException (Json_deserializers.authorization_exception_of_yojson tree path)
      | _, "InvalidParameterValueException" ->
          `InvalidParameterValueException
            (Json_deserializers.invalid_parameter_value_exception_of_yojson tree path)
      | _, "RateLimitExceededException" ->
          `RateLimitExceededException
            (Json_deserializers.rate_limit_exceeded_exception_of_yojson tree path)
      | _, "ResourceLimitExceededException" ->
          `ResourceLimitExceededException
            (Json_deserializers.resource_limit_exceeded_exception_of_yojson tree path)
      | _, "ServerInternalException" ->
          `ServerInternalException
            (Json_deserializers.server_internal_exception_of_yojson tree path)
      | _, "ValidationException" ->
          `ValidationException (Json_deserializers.validation_exception_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : create_grant_version_request) =
    let input = Json_serializers.create_grant_version_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"AWSLicenseManager.CreateGrantVersion" ~service
      ~context ~input
      ~output_deserializer:Json_deserializers.create_grant_version_response_of_yojson
      ~error_deserializer

  let request_with_metadata context (request : create_grant_version_request) =
    let input = Json_serializers.create_grant_version_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata
      ~shape_name:"AWSLicenseManager.CreateGrantVersion" ~service ~context ~input
      ~output_deserializer:Json_deserializers.create_grant_version_response_of_yojson
      ~error_deserializer
end

module CreateLicense = struct
  let error_to_string = function
    | `AccessDeniedException _ -> "com.amazonaws.licensemanager#AccessDeniedException"
    | `AuthorizationException _ -> "com.amazonaws.licensemanager#AuthorizationException"
    | `InvalidParameterValueException _ ->
        "com.amazonaws.licensemanager#InvalidParameterValueException"
    | `RateLimitExceededException _ -> "com.amazonaws.licensemanager#RateLimitExceededException"
    | `RedirectException _ -> "com.amazonaws.licensemanager#RedirectException"
    | `ServerInternalException _ -> "com.amazonaws.licensemanager#ServerInternalException"
    | `ValidationException _ -> "com.amazonaws.licensemanager#ValidationException"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "AccessDeniedException" ->
          `AccessDeniedException (Json_deserializers.access_denied_exception_of_yojson tree path)
      | _, "AuthorizationException" ->
          `AuthorizationException (Json_deserializers.authorization_exception_of_yojson tree path)
      | _, "InvalidParameterValueException" ->
          `InvalidParameterValueException
            (Json_deserializers.invalid_parameter_value_exception_of_yojson tree path)
      | _, "RateLimitExceededException" ->
          `RateLimitExceededException
            (Json_deserializers.rate_limit_exceeded_exception_of_yojson tree path)
      | _, "RedirectException" ->
          `RedirectException (Json_deserializers.redirect_exception_of_yojson tree path)
      | _, "ServerInternalException" ->
          `ServerInternalException
            (Json_deserializers.server_internal_exception_of_yojson tree path)
      | _, "ValidationException" ->
          `ValidationException (Json_deserializers.validation_exception_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : create_license_request) =
    let input = Json_serializers.create_license_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"AWSLicenseManager.CreateLicense" ~service
      ~context ~input ~output_deserializer:Json_deserializers.create_license_response_of_yojson
      ~error_deserializer

  let request_with_metadata context (request : create_license_request) =
    let input = Json_serializers.create_license_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata ~shape_name:"AWSLicenseManager.CreateLicense"
      ~service ~context ~input
      ~output_deserializer:Json_deserializers.create_license_response_of_yojson ~error_deserializer
end

module CreateLicenseAssetGroup = struct
  let error_to_string = function
    | `AccessDeniedException _ -> "com.amazonaws.licensemanager#AccessDeniedException"
    | `AuthorizationException _ -> "com.amazonaws.licensemanager#AuthorizationException"
    | `InvalidParameterValueException _ ->
        "com.amazonaws.licensemanager#InvalidParameterValueException"
    | `RateLimitExceededException _ -> "com.amazonaws.licensemanager#RateLimitExceededException"
    | `ServerInternalException _ -> "com.amazonaws.licensemanager#ServerInternalException"
    | `ValidationException _ -> "com.amazonaws.licensemanager#ValidationException"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "AccessDeniedException" ->
          `AccessDeniedException (Json_deserializers.access_denied_exception_of_yojson tree path)
      | _, "AuthorizationException" ->
          `AuthorizationException (Json_deserializers.authorization_exception_of_yojson tree path)
      | _, "InvalidParameterValueException" ->
          `InvalidParameterValueException
            (Json_deserializers.invalid_parameter_value_exception_of_yojson tree path)
      | _, "RateLimitExceededException" ->
          `RateLimitExceededException
            (Json_deserializers.rate_limit_exceeded_exception_of_yojson tree path)
      | _, "ServerInternalException" ->
          `ServerInternalException
            (Json_deserializers.server_internal_exception_of_yojson tree path)
      | _, "ValidationException" ->
          `ValidationException (Json_deserializers.validation_exception_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : create_license_asset_group_request) =
    let input = Json_serializers.create_license_asset_group_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"AWSLicenseManager.CreateLicenseAssetGroup"
      ~service ~context ~input
      ~output_deserializer:Json_deserializers.create_license_asset_group_response_of_yojson
      ~error_deserializer

  let request_with_metadata context (request : create_license_asset_group_request) =
    let input = Json_serializers.create_license_asset_group_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata
      ~shape_name:"AWSLicenseManager.CreateLicenseAssetGroup" ~service ~context ~input
      ~output_deserializer:Json_deserializers.create_license_asset_group_response_of_yojson
      ~error_deserializer
end

module CreateLicenseAssetRuleset = struct
  let error_to_string = function
    | `AccessDeniedException _ -> "com.amazonaws.licensemanager#AccessDeniedException"
    | `AuthorizationException _ -> "com.amazonaws.licensemanager#AuthorizationException"
    | `InvalidParameterValueException _ ->
        "com.amazonaws.licensemanager#InvalidParameterValueException"
    | `RateLimitExceededException _ -> "com.amazonaws.licensemanager#RateLimitExceededException"
    | `ServerInternalException _ -> "com.amazonaws.licensemanager#ServerInternalException"
    | `ValidationException _ -> "com.amazonaws.licensemanager#ValidationException"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "AccessDeniedException" ->
          `AccessDeniedException (Json_deserializers.access_denied_exception_of_yojson tree path)
      | _, "AuthorizationException" ->
          `AuthorizationException (Json_deserializers.authorization_exception_of_yojson tree path)
      | _, "InvalidParameterValueException" ->
          `InvalidParameterValueException
            (Json_deserializers.invalid_parameter_value_exception_of_yojson tree path)
      | _, "RateLimitExceededException" ->
          `RateLimitExceededException
            (Json_deserializers.rate_limit_exceeded_exception_of_yojson tree path)
      | _, "ServerInternalException" ->
          `ServerInternalException
            (Json_deserializers.server_internal_exception_of_yojson tree path)
      | _, "ValidationException" ->
          `ValidationException (Json_deserializers.validation_exception_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : create_license_asset_ruleset_request) =
    let input = Json_serializers.create_license_asset_ruleset_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"AWSLicenseManager.CreateLicenseAssetRuleset"
      ~service ~context ~input
      ~output_deserializer:Json_deserializers.create_license_asset_ruleset_response_of_yojson
      ~error_deserializer

  let request_with_metadata context (request : create_license_asset_ruleset_request) =
    let input = Json_serializers.create_license_asset_ruleset_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata
      ~shape_name:"AWSLicenseManager.CreateLicenseAssetRuleset" ~service ~context ~input
      ~output_deserializer:Json_deserializers.create_license_asset_ruleset_response_of_yojson
      ~error_deserializer
end

module CreateLicenseConfiguration = struct
  let error_to_string = function
    | `AccessDeniedException _ -> "com.amazonaws.licensemanager#AccessDeniedException"
    | `AuthorizationException _ -> "com.amazonaws.licensemanager#AuthorizationException"
    | `InvalidParameterValueException _ ->
        "com.amazonaws.licensemanager#InvalidParameterValueException"
    | `RateLimitExceededException _ -> "com.amazonaws.licensemanager#RateLimitExceededException"
    | `ResourceLimitExceededException _ ->
        "com.amazonaws.licensemanager#ResourceLimitExceededException"
    | `ServerInternalException _ -> "com.amazonaws.licensemanager#ServerInternalException"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "AccessDeniedException" ->
          `AccessDeniedException (Json_deserializers.access_denied_exception_of_yojson tree path)
      | _, "AuthorizationException" ->
          `AuthorizationException (Json_deserializers.authorization_exception_of_yojson tree path)
      | _, "InvalidParameterValueException" ->
          `InvalidParameterValueException
            (Json_deserializers.invalid_parameter_value_exception_of_yojson tree path)
      | _, "RateLimitExceededException" ->
          `RateLimitExceededException
            (Json_deserializers.rate_limit_exceeded_exception_of_yojson tree path)
      | _, "ResourceLimitExceededException" ->
          `ResourceLimitExceededException
            (Json_deserializers.resource_limit_exceeded_exception_of_yojson tree path)
      | _, "ServerInternalException" ->
          `ServerInternalException
            (Json_deserializers.server_internal_exception_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : create_license_configuration_request) =
    let input = Json_serializers.create_license_configuration_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"AWSLicenseManager.CreateLicenseConfiguration"
      ~service ~context ~input
      ~output_deserializer:Json_deserializers.create_license_configuration_response_of_yojson
      ~error_deserializer

  let request_with_metadata context (request : create_license_configuration_request) =
    let input = Json_serializers.create_license_configuration_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata
      ~shape_name:"AWSLicenseManager.CreateLicenseConfiguration" ~service ~context ~input
      ~output_deserializer:Json_deserializers.create_license_configuration_response_of_yojson
      ~error_deserializer
end

module CreateLicenseConversionTaskForResource = struct
  let error_to_string = function
    | `AccessDeniedException _ -> "com.amazonaws.licensemanager#AccessDeniedException"
    | `AuthorizationException _ -> "com.amazonaws.licensemanager#AuthorizationException"
    | `InvalidParameterValueException _ ->
        "com.amazonaws.licensemanager#InvalidParameterValueException"
    | `RateLimitExceededException _ -> "com.amazonaws.licensemanager#RateLimitExceededException"
    | `ServerInternalException _ -> "com.amazonaws.licensemanager#ServerInternalException"
    | `ValidationException _ -> "com.amazonaws.licensemanager#ValidationException"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "AccessDeniedException" ->
          `AccessDeniedException (Json_deserializers.access_denied_exception_of_yojson tree path)
      | _, "AuthorizationException" ->
          `AuthorizationException (Json_deserializers.authorization_exception_of_yojson tree path)
      | _, "InvalidParameterValueException" ->
          `InvalidParameterValueException
            (Json_deserializers.invalid_parameter_value_exception_of_yojson tree path)
      | _, "RateLimitExceededException" ->
          `RateLimitExceededException
            (Json_deserializers.rate_limit_exceeded_exception_of_yojson tree path)
      | _, "ServerInternalException" ->
          `ServerInternalException
            (Json_deserializers.server_internal_exception_of_yojson tree path)
      | _, "ValidationException" ->
          `ValidationException (Json_deserializers.validation_exception_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : create_license_conversion_task_for_resource_request) =
    let input =
      Json_serializers.create_license_conversion_task_for_resource_request_to_yojson request
    in
    Smaws_Lib.Protocols.AwsJson.request
      ~shape_name:"AWSLicenseManager.CreateLicenseConversionTaskForResource" ~service ~context
      ~input
      ~output_deserializer:
        Json_deserializers.create_license_conversion_task_for_resource_response_of_yojson
      ~error_deserializer

  let request_with_metadata context (request : create_license_conversion_task_for_resource_request)
      =
    let input =
      Json_serializers.create_license_conversion_task_for_resource_request_to_yojson request
    in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata
      ~shape_name:"AWSLicenseManager.CreateLicenseConversionTaskForResource" ~service ~context
      ~input
      ~output_deserializer:
        Json_deserializers.create_license_conversion_task_for_resource_response_of_yojson
      ~error_deserializer
end

module CreateLicenseManagerReportGenerator = struct
  let error_to_string = function
    | `AccessDeniedException _ -> "com.amazonaws.licensemanager#AccessDeniedException"
    | `AuthorizationException _ -> "com.amazonaws.licensemanager#AuthorizationException"
    | `InvalidParameterValueException _ ->
        "com.amazonaws.licensemanager#InvalidParameterValueException"
    | `RateLimitExceededException _ -> "com.amazonaws.licensemanager#RateLimitExceededException"
    | `ResourceLimitExceededException _ ->
        "com.amazonaws.licensemanager#ResourceLimitExceededException"
    | `ResourceNotFoundException _ -> "com.amazonaws.licensemanager#ResourceNotFoundException"
    | `ServerInternalException _ -> "com.amazonaws.licensemanager#ServerInternalException"
    | `ValidationException _ -> "com.amazonaws.licensemanager#ValidationException"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "AccessDeniedException" ->
          `AccessDeniedException (Json_deserializers.access_denied_exception_of_yojson tree path)
      | _, "AuthorizationException" ->
          `AuthorizationException (Json_deserializers.authorization_exception_of_yojson tree path)
      | _, "InvalidParameterValueException" ->
          `InvalidParameterValueException
            (Json_deserializers.invalid_parameter_value_exception_of_yojson tree path)
      | _, "RateLimitExceededException" ->
          `RateLimitExceededException
            (Json_deserializers.rate_limit_exceeded_exception_of_yojson tree path)
      | _, "ResourceLimitExceededException" ->
          `ResourceLimitExceededException
            (Json_deserializers.resource_limit_exceeded_exception_of_yojson tree path)
      | _, "ResourceNotFoundException" ->
          `ResourceNotFoundException
            (Json_deserializers.resource_not_found_exception_of_yojson tree path)
      | _, "ServerInternalException" ->
          `ServerInternalException
            (Json_deserializers.server_internal_exception_of_yojson tree path)
      | _, "ValidationException" ->
          `ValidationException (Json_deserializers.validation_exception_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : create_license_manager_report_generator_request) =
    let input =
      Json_serializers.create_license_manager_report_generator_request_to_yojson request
    in
    Smaws_Lib.Protocols.AwsJson.request
      ~shape_name:"AWSLicenseManager.CreateLicenseManagerReportGenerator" ~service ~context ~input
      ~output_deserializer:
        Json_deserializers.create_license_manager_report_generator_response_of_yojson
      ~error_deserializer

  let request_with_metadata context (request : create_license_manager_report_generator_request) =
    let input =
      Json_serializers.create_license_manager_report_generator_request_to_yojson request
    in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata
      ~shape_name:"AWSLicenseManager.CreateLicenseManagerReportGenerator" ~service ~context ~input
      ~output_deserializer:
        Json_deserializers.create_license_manager_report_generator_response_of_yojson
      ~error_deserializer
end

module CreateLicenseVersion = struct
  let error_to_string = function
    | `AccessDeniedException _ -> "com.amazonaws.licensemanager#AccessDeniedException"
    | `AuthorizationException _ -> "com.amazonaws.licensemanager#AuthorizationException"
    | `ConflictException _ -> "com.amazonaws.licensemanager#ConflictException"
    | `RateLimitExceededException _ -> "com.amazonaws.licensemanager#RateLimitExceededException"
    | `RedirectException _ -> "com.amazonaws.licensemanager#RedirectException"
    | `ResourceNotFoundException _ -> "com.amazonaws.licensemanager#ResourceNotFoundException"
    | `ServerInternalException _ -> "com.amazonaws.licensemanager#ServerInternalException"
    | `ValidationException _ -> "com.amazonaws.licensemanager#ValidationException"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "AccessDeniedException" ->
          `AccessDeniedException (Json_deserializers.access_denied_exception_of_yojson tree path)
      | _, "AuthorizationException" ->
          `AuthorizationException (Json_deserializers.authorization_exception_of_yojson tree path)
      | _, "ConflictException" ->
          `ConflictException (Json_deserializers.conflict_exception_of_yojson tree path)
      | _, "RateLimitExceededException" ->
          `RateLimitExceededException
            (Json_deserializers.rate_limit_exceeded_exception_of_yojson tree path)
      | _, "RedirectException" ->
          `RedirectException (Json_deserializers.redirect_exception_of_yojson tree path)
      | _, "ResourceNotFoundException" ->
          `ResourceNotFoundException
            (Json_deserializers.resource_not_found_exception_of_yojson tree path)
      | _, "ServerInternalException" ->
          `ServerInternalException
            (Json_deserializers.server_internal_exception_of_yojson tree path)
      | _, "ValidationException" ->
          `ValidationException (Json_deserializers.validation_exception_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : create_license_version_request) =
    let input = Json_serializers.create_license_version_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"AWSLicenseManager.CreateLicenseVersion"
      ~service ~context ~input
      ~output_deserializer:Json_deserializers.create_license_version_response_of_yojson
      ~error_deserializer

  let request_with_metadata context (request : create_license_version_request) =
    let input = Json_serializers.create_license_version_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata
      ~shape_name:"AWSLicenseManager.CreateLicenseVersion" ~service ~context ~input
      ~output_deserializer:Json_deserializers.create_license_version_response_of_yojson
      ~error_deserializer
end

module CreateToken = struct
  let error_to_string = function
    | `AccessDeniedException _ -> "com.amazonaws.licensemanager#AccessDeniedException"
    | `AuthorizationException _ -> "com.amazonaws.licensemanager#AuthorizationException"
    | `RateLimitExceededException _ -> "com.amazonaws.licensemanager#RateLimitExceededException"
    | `RedirectException _ -> "com.amazonaws.licensemanager#RedirectException"
    | `ResourceLimitExceededException _ ->
        "com.amazonaws.licensemanager#ResourceLimitExceededException"
    | `ResourceNotFoundException _ -> "com.amazonaws.licensemanager#ResourceNotFoundException"
    | `ServerInternalException _ -> "com.amazonaws.licensemanager#ServerInternalException"
    | `ValidationException _ -> "com.amazonaws.licensemanager#ValidationException"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "AccessDeniedException" ->
          `AccessDeniedException (Json_deserializers.access_denied_exception_of_yojson tree path)
      | _, "AuthorizationException" ->
          `AuthorizationException (Json_deserializers.authorization_exception_of_yojson tree path)
      | _, "RateLimitExceededException" ->
          `RateLimitExceededException
            (Json_deserializers.rate_limit_exceeded_exception_of_yojson tree path)
      | _, "RedirectException" ->
          `RedirectException (Json_deserializers.redirect_exception_of_yojson tree path)
      | _, "ResourceLimitExceededException" ->
          `ResourceLimitExceededException
            (Json_deserializers.resource_limit_exceeded_exception_of_yojson tree path)
      | _, "ResourceNotFoundException" ->
          `ResourceNotFoundException
            (Json_deserializers.resource_not_found_exception_of_yojson tree path)
      | _, "ServerInternalException" ->
          `ServerInternalException
            (Json_deserializers.server_internal_exception_of_yojson tree path)
      | _, "ValidationException" ->
          `ValidationException (Json_deserializers.validation_exception_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : create_token_request) =
    let input = Json_serializers.create_token_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"AWSLicenseManager.CreateToken" ~service
      ~context ~input ~output_deserializer:Json_deserializers.create_token_response_of_yojson
      ~error_deserializer

  let request_with_metadata context (request : create_token_request) =
    let input = Json_serializers.create_token_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata ~shape_name:"AWSLicenseManager.CreateToken"
      ~service ~context ~input
      ~output_deserializer:Json_deserializers.create_token_response_of_yojson ~error_deserializer
end

module DeleteGrant = struct
  let error_to_string = function
    | `AccessDeniedException _ -> "com.amazonaws.licensemanager#AccessDeniedException"
    | `AuthorizationException _ -> "com.amazonaws.licensemanager#AuthorizationException"
    | `InvalidParameterValueException _ ->
        "com.amazonaws.licensemanager#InvalidParameterValueException"
    | `RateLimitExceededException _ -> "com.amazonaws.licensemanager#RateLimitExceededException"
    | `ResourceLimitExceededException _ ->
        "com.amazonaws.licensemanager#ResourceLimitExceededException"
    | `ServerInternalException _ -> "com.amazonaws.licensemanager#ServerInternalException"
    | `ValidationException _ -> "com.amazonaws.licensemanager#ValidationException"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "AccessDeniedException" ->
          `AccessDeniedException (Json_deserializers.access_denied_exception_of_yojson tree path)
      | _, "AuthorizationException" ->
          `AuthorizationException (Json_deserializers.authorization_exception_of_yojson tree path)
      | _, "InvalidParameterValueException" ->
          `InvalidParameterValueException
            (Json_deserializers.invalid_parameter_value_exception_of_yojson tree path)
      | _, "RateLimitExceededException" ->
          `RateLimitExceededException
            (Json_deserializers.rate_limit_exceeded_exception_of_yojson tree path)
      | _, "ResourceLimitExceededException" ->
          `ResourceLimitExceededException
            (Json_deserializers.resource_limit_exceeded_exception_of_yojson tree path)
      | _, "ServerInternalException" ->
          `ServerInternalException
            (Json_deserializers.server_internal_exception_of_yojson tree path)
      | _, "ValidationException" ->
          `ValidationException (Json_deserializers.validation_exception_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : delete_grant_request) =
    let input = Json_serializers.delete_grant_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"AWSLicenseManager.DeleteGrant" ~service
      ~context ~input ~output_deserializer:Json_deserializers.delete_grant_response_of_yojson
      ~error_deserializer

  let request_with_metadata context (request : delete_grant_request) =
    let input = Json_serializers.delete_grant_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata ~shape_name:"AWSLicenseManager.DeleteGrant"
      ~service ~context ~input
      ~output_deserializer:Json_deserializers.delete_grant_response_of_yojson ~error_deserializer
end

module DeleteLicense = struct
  let error_to_string = function
    | `AccessDeniedException _ -> "com.amazonaws.licensemanager#AccessDeniedException"
    | `AuthorizationException _ -> "com.amazonaws.licensemanager#AuthorizationException"
    | `ConflictException _ -> "com.amazonaws.licensemanager#ConflictException"
    | `InvalidParameterValueException _ ->
        "com.amazonaws.licensemanager#InvalidParameterValueException"
    | `RateLimitExceededException _ -> "com.amazonaws.licensemanager#RateLimitExceededException"
    | `RedirectException _ -> "com.amazonaws.licensemanager#RedirectException"
    | `ServerInternalException _ -> "com.amazonaws.licensemanager#ServerInternalException"
    | `ValidationException _ -> "com.amazonaws.licensemanager#ValidationException"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "AccessDeniedException" ->
          `AccessDeniedException (Json_deserializers.access_denied_exception_of_yojson tree path)
      | _, "AuthorizationException" ->
          `AuthorizationException (Json_deserializers.authorization_exception_of_yojson tree path)
      | _, "ConflictException" ->
          `ConflictException (Json_deserializers.conflict_exception_of_yojson tree path)
      | _, "InvalidParameterValueException" ->
          `InvalidParameterValueException
            (Json_deserializers.invalid_parameter_value_exception_of_yojson tree path)
      | _, "RateLimitExceededException" ->
          `RateLimitExceededException
            (Json_deserializers.rate_limit_exceeded_exception_of_yojson tree path)
      | _, "RedirectException" ->
          `RedirectException (Json_deserializers.redirect_exception_of_yojson tree path)
      | _, "ServerInternalException" ->
          `ServerInternalException
            (Json_deserializers.server_internal_exception_of_yojson tree path)
      | _, "ValidationException" ->
          `ValidationException (Json_deserializers.validation_exception_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : delete_license_request) =
    let input = Json_serializers.delete_license_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"AWSLicenseManager.DeleteLicense" ~service
      ~context ~input ~output_deserializer:Json_deserializers.delete_license_response_of_yojson
      ~error_deserializer

  let request_with_metadata context (request : delete_license_request) =
    let input = Json_serializers.delete_license_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata ~shape_name:"AWSLicenseManager.DeleteLicense"
      ~service ~context ~input
      ~output_deserializer:Json_deserializers.delete_license_response_of_yojson ~error_deserializer
end

module DeleteLicenseAssetGroup = struct
  let error_to_string = function
    | `AccessDeniedException _ -> "com.amazonaws.licensemanager#AccessDeniedException"
    | `AuthorizationException _ -> "com.amazonaws.licensemanager#AuthorizationException"
    | `InvalidParameterValueException _ ->
        "com.amazonaws.licensemanager#InvalidParameterValueException"
    | `RateLimitExceededException _ -> "com.amazonaws.licensemanager#RateLimitExceededException"
    | `ServerInternalException _ -> "com.amazonaws.licensemanager#ServerInternalException"
    | `ValidationException _ -> "com.amazonaws.licensemanager#ValidationException"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "AccessDeniedException" ->
          `AccessDeniedException (Json_deserializers.access_denied_exception_of_yojson tree path)
      | _, "AuthorizationException" ->
          `AuthorizationException (Json_deserializers.authorization_exception_of_yojson tree path)
      | _, "InvalidParameterValueException" ->
          `InvalidParameterValueException
            (Json_deserializers.invalid_parameter_value_exception_of_yojson tree path)
      | _, "RateLimitExceededException" ->
          `RateLimitExceededException
            (Json_deserializers.rate_limit_exceeded_exception_of_yojson tree path)
      | _, "ServerInternalException" ->
          `ServerInternalException
            (Json_deserializers.server_internal_exception_of_yojson tree path)
      | _, "ValidationException" ->
          `ValidationException (Json_deserializers.validation_exception_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : delete_license_asset_group_request) =
    let input = Json_serializers.delete_license_asset_group_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"AWSLicenseManager.DeleteLicenseAssetGroup"
      ~service ~context ~input
      ~output_deserializer:Json_deserializers.delete_license_asset_group_response_of_yojson
      ~error_deserializer

  let request_with_metadata context (request : delete_license_asset_group_request) =
    let input = Json_serializers.delete_license_asset_group_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata
      ~shape_name:"AWSLicenseManager.DeleteLicenseAssetGroup" ~service ~context ~input
      ~output_deserializer:Json_deserializers.delete_license_asset_group_response_of_yojson
      ~error_deserializer
end

module DeleteLicenseAssetRuleset = struct
  let error_to_string = function
    | `AccessDeniedException _ -> "com.amazonaws.licensemanager#AccessDeniedException"
    | `AuthorizationException _ -> "com.amazonaws.licensemanager#AuthorizationException"
    | `InvalidParameterValueException _ ->
        "com.amazonaws.licensemanager#InvalidParameterValueException"
    | `RateLimitExceededException _ -> "com.amazonaws.licensemanager#RateLimitExceededException"
    | `ServerInternalException _ -> "com.amazonaws.licensemanager#ServerInternalException"
    | `ValidationException _ -> "com.amazonaws.licensemanager#ValidationException"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "AccessDeniedException" ->
          `AccessDeniedException (Json_deserializers.access_denied_exception_of_yojson tree path)
      | _, "AuthorizationException" ->
          `AuthorizationException (Json_deserializers.authorization_exception_of_yojson tree path)
      | _, "InvalidParameterValueException" ->
          `InvalidParameterValueException
            (Json_deserializers.invalid_parameter_value_exception_of_yojson tree path)
      | _, "RateLimitExceededException" ->
          `RateLimitExceededException
            (Json_deserializers.rate_limit_exceeded_exception_of_yojson tree path)
      | _, "ServerInternalException" ->
          `ServerInternalException
            (Json_deserializers.server_internal_exception_of_yojson tree path)
      | _, "ValidationException" ->
          `ValidationException (Json_deserializers.validation_exception_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : delete_license_asset_ruleset_request) =
    let input = Json_serializers.delete_license_asset_ruleset_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"AWSLicenseManager.DeleteLicenseAssetRuleset"
      ~service ~context ~input
      ~output_deserializer:Json_deserializers.delete_license_asset_ruleset_response_of_yojson
      ~error_deserializer

  let request_with_metadata context (request : delete_license_asset_ruleset_request) =
    let input = Json_serializers.delete_license_asset_ruleset_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata
      ~shape_name:"AWSLicenseManager.DeleteLicenseAssetRuleset" ~service ~context ~input
      ~output_deserializer:Json_deserializers.delete_license_asset_ruleset_response_of_yojson
      ~error_deserializer
end

module DeleteLicenseConfiguration = struct
  let error_to_string = function
    | `AccessDeniedException _ -> "com.amazonaws.licensemanager#AccessDeniedException"
    | `AuthorizationException _ -> "com.amazonaws.licensemanager#AuthorizationException"
    | `InvalidParameterValueException _ ->
        "com.amazonaws.licensemanager#InvalidParameterValueException"
    | `RateLimitExceededException _ -> "com.amazonaws.licensemanager#RateLimitExceededException"
    | `ServerInternalException _ -> "com.amazonaws.licensemanager#ServerInternalException"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "AccessDeniedException" ->
          `AccessDeniedException (Json_deserializers.access_denied_exception_of_yojson tree path)
      | _, "AuthorizationException" ->
          `AuthorizationException (Json_deserializers.authorization_exception_of_yojson tree path)
      | _, "InvalidParameterValueException" ->
          `InvalidParameterValueException
            (Json_deserializers.invalid_parameter_value_exception_of_yojson tree path)
      | _, "RateLimitExceededException" ->
          `RateLimitExceededException
            (Json_deserializers.rate_limit_exceeded_exception_of_yojson tree path)
      | _, "ServerInternalException" ->
          `ServerInternalException
            (Json_deserializers.server_internal_exception_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : delete_license_configuration_request) =
    let input = Json_serializers.delete_license_configuration_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"AWSLicenseManager.DeleteLicenseConfiguration"
      ~service ~context ~input
      ~output_deserializer:Json_deserializers.delete_license_configuration_response_of_yojson
      ~error_deserializer

  let request_with_metadata context (request : delete_license_configuration_request) =
    let input = Json_serializers.delete_license_configuration_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata
      ~shape_name:"AWSLicenseManager.DeleteLicenseConfiguration" ~service ~context ~input
      ~output_deserializer:Json_deserializers.delete_license_configuration_response_of_yojson
      ~error_deserializer
end

module DeleteLicenseManagerReportGenerator = struct
  let error_to_string = function
    | `AccessDeniedException _ -> "com.amazonaws.licensemanager#AccessDeniedException"
    | `AuthorizationException _ -> "com.amazonaws.licensemanager#AuthorizationException"
    | `InvalidParameterValueException _ ->
        "com.amazonaws.licensemanager#InvalidParameterValueException"
    | `RateLimitExceededException _ -> "com.amazonaws.licensemanager#RateLimitExceededException"
    | `ResourceLimitExceededException _ ->
        "com.amazonaws.licensemanager#ResourceLimitExceededException"
    | `ResourceNotFoundException _ -> "com.amazonaws.licensemanager#ResourceNotFoundException"
    | `ServerInternalException _ -> "com.amazonaws.licensemanager#ServerInternalException"
    | `ValidationException _ -> "com.amazonaws.licensemanager#ValidationException"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "AccessDeniedException" ->
          `AccessDeniedException (Json_deserializers.access_denied_exception_of_yojson tree path)
      | _, "AuthorizationException" ->
          `AuthorizationException (Json_deserializers.authorization_exception_of_yojson tree path)
      | _, "InvalidParameterValueException" ->
          `InvalidParameterValueException
            (Json_deserializers.invalid_parameter_value_exception_of_yojson tree path)
      | _, "RateLimitExceededException" ->
          `RateLimitExceededException
            (Json_deserializers.rate_limit_exceeded_exception_of_yojson tree path)
      | _, "ResourceLimitExceededException" ->
          `ResourceLimitExceededException
            (Json_deserializers.resource_limit_exceeded_exception_of_yojson tree path)
      | _, "ResourceNotFoundException" ->
          `ResourceNotFoundException
            (Json_deserializers.resource_not_found_exception_of_yojson tree path)
      | _, "ServerInternalException" ->
          `ServerInternalException
            (Json_deserializers.server_internal_exception_of_yojson tree path)
      | _, "ValidationException" ->
          `ValidationException (Json_deserializers.validation_exception_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : delete_license_manager_report_generator_request) =
    let input =
      Json_serializers.delete_license_manager_report_generator_request_to_yojson request
    in
    Smaws_Lib.Protocols.AwsJson.request
      ~shape_name:"AWSLicenseManager.DeleteLicenseManagerReportGenerator" ~service ~context ~input
      ~output_deserializer:
        Json_deserializers.delete_license_manager_report_generator_response_of_yojson
      ~error_deserializer

  let request_with_metadata context (request : delete_license_manager_report_generator_request) =
    let input =
      Json_serializers.delete_license_manager_report_generator_request_to_yojson request
    in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata
      ~shape_name:"AWSLicenseManager.DeleteLicenseManagerReportGenerator" ~service ~context ~input
      ~output_deserializer:
        Json_deserializers.delete_license_manager_report_generator_response_of_yojson
      ~error_deserializer
end

module DeleteToken = struct
  let error_to_string = function
    | `AccessDeniedException _ -> "com.amazonaws.licensemanager#AccessDeniedException"
    | `AuthorizationException _ -> "com.amazonaws.licensemanager#AuthorizationException"
    | `RateLimitExceededException _ -> "com.amazonaws.licensemanager#RateLimitExceededException"
    | `RedirectException _ -> "com.amazonaws.licensemanager#RedirectException"
    | `ResourceNotFoundException _ -> "com.amazonaws.licensemanager#ResourceNotFoundException"
    | `ServerInternalException _ -> "com.amazonaws.licensemanager#ServerInternalException"
    | `ValidationException _ -> "com.amazonaws.licensemanager#ValidationException"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "AccessDeniedException" ->
          `AccessDeniedException (Json_deserializers.access_denied_exception_of_yojson tree path)
      | _, "AuthorizationException" ->
          `AuthorizationException (Json_deserializers.authorization_exception_of_yojson tree path)
      | _, "RateLimitExceededException" ->
          `RateLimitExceededException
            (Json_deserializers.rate_limit_exceeded_exception_of_yojson tree path)
      | _, "RedirectException" ->
          `RedirectException (Json_deserializers.redirect_exception_of_yojson tree path)
      | _, "ResourceNotFoundException" ->
          `ResourceNotFoundException
            (Json_deserializers.resource_not_found_exception_of_yojson tree path)
      | _, "ServerInternalException" ->
          `ServerInternalException
            (Json_deserializers.server_internal_exception_of_yojson tree path)
      | _, "ValidationException" ->
          `ValidationException (Json_deserializers.validation_exception_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : delete_token_request) =
    let input = Json_serializers.delete_token_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"AWSLicenseManager.DeleteToken" ~service
      ~context ~input ~output_deserializer:Json_deserializers.delete_token_response_of_yojson
      ~error_deserializer

  let request_with_metadata context (request : delete_token_request) =
    let input = Json_serializers.delete_token_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata ~shape_name:"AWSLicenseManager.DeleteToken"
      ~service ~context ~input
      ~output_deserializer:Json_deserializers.delete_token_response_of_yojson ~error_deserializer
end

module ExtendLicenseConsumption = struct
  let error_to_string = function
    | `AccessDeniedException _ -> "com.amazonaws.licensemanager#AccessDeniedException"
    | `AuthorizationException _ -> "com.amazonaws.licensemanager#AuthorizationException"
    | `InvalidParameterValueException _ ->
        "com.amazonaws.licensemanager#InvalidParameterValueException"
    | `RateLimitExceededException _ -> "com.amazonaws.licensemanager#RateLimitExceededException"
    | `ResourceNotFoundException _ -> "com.amazonaws.licensemanager#ResourceNotFoundException"
    | `ServerInternalException _ -> "com.amazonaws.licensemanager#ServerInternalException"
    | `ValidationException _ -> "com.amazonaws.licensemanager#ValidationException"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "AccessDeniedException" ->
          `AccessDeniedException (Json_deserializers.access_denied_exception_of_yojson tree path)
      | _, "AuthorizationException" ->
          `AuthorizationException (Json_deserializers.authorization_exception_of_yojson tree path)
      | _, "InvalidParameterValueException" ->
          `InvalidParameterValueException
            (Json_deserializers.invalid_parameter_value_exception_of_yojson tree path)
      | _, "RateLimitExceededException" ->
          `RateLimitExceededException
            (Json_deserializers.rate_limit_exceeded_exception_of_yojson tree path)
      | _, "ResourceNotFoundException" ->
          `ResourceNotFoundException
            (Json_deserializers.resource_not_found_exception_of_yojson tree path)
      | _, "ServerInternalException" ->
          `ServerInternalException
            (Json_deserializers.server_internal_exception_of_yojson tree path)
      | _, "ValidationException" ->
          `ValidationException (Json_deserializers.validation_exception_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : extend_license_consumption_request) =
    let input = Json_serializers.extend_license_consumption_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"AWSLicenseManager.ExtendLicenseConsumption"
      ~service ~context ~input
      ~output_deserializer:Json_deserializers.extend_license_consumption_response_of_yojson
      ~error_deserializer

  let request_with_metadata context (request : extend_license_consumption_request) =
    let input = Json_serializers.extend_license_consumption_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata
      ~shape_name:"AWSLicenseManager.ExtendLicenseConsumption" ~service ~context ~input
      ~output_deserializer:Json_deserializers.extend_license_consumption_response_of_yojson
      ~error_deserializer
end

module GetAccessToken = struct
  let error_to_string = function
    | `AccessDeniedException _ -> "com.amazonaws.licensemanager#AccessDeniedException"
    | `AuthorizationException _ -> "com.amazonaws.licensemanager#AuthorizationException"
    | `RateLimitExceededException _ -> "com.amazonaws.licensemanager#RateLimitExceededException"
    | `ServerInternalException _ -> "com.amazonaws.licensemanager#ServerInternalException"
    | `ValidationException _ -> "com.amazonaws.licensemanager#ValidationException"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "AccessDeniedException" ->
          `AccessDeniedException (Json_deserializers.access_denied_exception_of_yojson tree path)
      | _, "AuthorizationException" ->
          `AuthorizationException (Json_deserializers.authorization_exception_of_yojson tree path)
      | _, "RateLimitExceededException" ->
          `RateLimitExceededException
            (Json_deserializers.rate_limit_exceeded_exception_of_yojson tree path)
      | _, "ServerInternalException" ->
          `ServerInternalException
            (Json_deserializers.server_internal_exception_of_yojson tree path)
      | _, "ValidationException" ->
          `ValidationException (Json_deserializers.validation_exception_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : get_access_token_request) =
    let input = Json_serializers.get_access_token_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"AWSLicenseManager.GetAccessToken" ~service
      ~context ~input ~output_deserializer:Json_deserializers.get_access_token_response_of_yojson
      ~error_deserializer

  let request_with_metadata context (request : get_access_token_request) =
    let input = Json_serializers.get_access_token_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata ~shape_name:"AWSLicenseManager.GetAccessToken"
      ~service ~context ~input
      ~output_deserializer:Json_deserializers.get_access_token_response_of_yojson
      ~error_deserializer
end

module GetGrant = struct
  let error_to_string = function
    | `AccessDeniedException _ -> "com.amazonaws.licensemanager#AccessDeniedException"
    | `AuthorizationException _ -> "com.amazonaws.licensemanager#AuthorizationException"
    | `InvalidParameterValueException _ ->
        "com.amazonaws.licensemanager#InvalidParameterValueException"
    | `RateLimitExceededException _ -> "com.amazonaws.licensemanager#RateLimitExceededException"
    | `ResourceLimitExceededException _ ->
        "com.amazonaws.licensemanager#ResourceLimitExceededException"
    | `ServerInternalException _ -> "com.amazonaws.licensemanager#ServerInternalException"
    | `ValidationException _ -> "com.amazonaws.licensemanager#ValidationException"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "AccessDeniedException" ->
          `AccessDeniedException (Json_deserializers.access_denied_exception_of_yojson tree path)
      | _, "AuthorizationException" ->
          `AuthorizationException (Json_deserializers.authorization_exception_of_yojson tree path)
      | _, "InvalidParameterValueException" ->
          `InvalidParameterValueException
            (Json_deserializers.invalid_parameter_value_exception_of_yojson tree path)
      | _, "RateLimitExceededException" ->
          `RateLimitExceededException
            (Json_deserializers.rate_limit_exceeded_exception_of_yojson tree path)
      | _, "ResourceLimitExceededException" ->
          `ResourceLimitExceededException
            (Json_deserializers.resource_limit_exceeded_exception_of_yojson tree path)
      | _, "ServerInternalException" ->
          `ServerInternalException
            (Json_deserializers.server_internal_exception_of_yojson tree path)
      | _, "ValidationException" ->
          `ValidationException (Json_deserializers.validation_exception_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : get_grant_request) =
    let input = Json_serializers.get_grant_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"AWSLicenseManager.GetGrant" ~service ~context
      ~input ~output_deserializer:Json_deserializers.get_grant_response_of_yojson
      ~error_deserializer

  let request_with_metadata context (request : get_grant_request) =
    let input = Json_serializers.get_grant_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata ~shape_name:"AWSLicenseManager.GetGrant"
      ~service ~context ~input ~output_deserializer:Json_deserializers.get_grant_response_of_yojson
      ~error_deserializer
end

module GetLicense = struct
  let error_to_string = function
    | `AccessDeniedException _ -> "com.amazonaws.licensemanager#AccessDeniedException"
    | `AuthorizationException _ -> "com.amazonaws.licensemanager#AuthorizationException"
    | `InvalidParameterValueException _ ->
        "com.amazonaws.licensemanager#InvalidParameterValueException"
    | `RateLimitExceededException _ -> "com.amazonaws.licensemanager#RateLimitExceededException"
    | `ServerInternalException _ -> "com.amazonaws.licensemanager#ServerInternalException"
    | `ValidationException _ -> "com.amazonaws.licensemanager#ValidationException"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "AccessDeniedException" ->
          `AccessDeniedException (Json_deserializers.access_denied_exception_of_yojson tree path)
      | _, "AuthorizationException" ->
          `AuthorizationException (Json_deserializers.authorization_exception_of_yojson tree path)
      | _, "InvalidParameterValueException" ->
          `InvalidParameterValueException
            (Json_deserializers.invalid_parameter_value_exception_of_yojson tree path)
      | _, "RateLimitExceededException" ->
          `RateLimitExceededException
            (Json_deserializers.rate_limit_exceeded_exception_of_yojson tree path)
      | _, "ServerInternalException" ->
          `ServerInternalException
            (Json_deserializers.server_internal_exception_of_yojson tree path)
      | _, "ValidationException" ->
          `ValidationException (Json_deserializers.validation_exception_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : get_license_request) =
    let input = Json_serializers.get_license_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"AWSLicenseManager.GetLicense" ~service ~context
      ~input ~output_deserializer:Json_deserializers.get_license_response_of_yojson
      ~error_deserializer

  let request_with_metadata context (request : get_license_request) =
    let input = Json_serializers.get_license_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata ~shape_name:"AWSLicenseManager.GetLicense"
      ~service ~context ~input
      ~output_deserializer:Json_deserializers.get_license_response_of_yojson ~error_deserializer
end

module GetLicenseAssetGroup = struct
  let error_to_string = function
    | `AccessDeniedException _ -> "com.amazonaws.licensemanager#AccessDeniedException"
    | `AuthorizationException _ -> "com.amazonaws.licensemanager#AuthorizationException"
    | `InvalidParameterValueException _ ->
        "com.amazonaws.licensemanager#InvalidParameterValueException"
    | `RateLimitExceededException _ -> "com.amazonaws.licensemanager#RateLimitExceededException"
    | `ServerInternalException _ -> "com.amazonaws.licensemanager#ServerInternalException"
    | `ValidationException _ -> "com.amazonaws.licensemanager#ValidationException"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "AccessDeniedException" ->
          `AccessDeniedException (Json_deserializers.access_denied_exception_of_yojson tree path)
      | _, "AuthorizationException" ->
          `AuthorizationException (Json_deserializers.authorization_exception_of_yojson tree path)
      | _, "InvalidParameterValueException" ->
          `InvalidParameterValueException
            (Json_deserializers.invalid_parameter_value_exception_of_yojson tree path)
      | _, "RateLimitExceededException" ->
          `RateLimitExceededException
            (Json_deserializers.rate_limit_exceeded_exception_of_yojson tree path)
      | _, "ServerInternalException" ->
          `ServerInternalException
            (Json_deserializers.server_internal_exception_of_yojson tree path)
      | _, "ValidationException" ->
          `ValidationException (Json_deserializers.validation_exception_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : get_license_asset_group_request) =
    let input = Json_serializers.get_license_asset_group_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"AWSLicenseManager.GetLicenseAssetGroup"
      ~service ~context ~input
      ~output_deserializer:Json_deserializers.get_license_asset_group_response_of_yojson
      ~error_deserializer

  let request_with_metadata context (request : get_license_asset_group_request) =
    let input = Json_serializers.get_license_asset_group_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata
      ~shape_name:"AWSLicenseManager.GetLicenseAssetGroup" ~service ~context ~input
      ~output_deserializer:Json_deserializers.get_license_asset_group_response_of_yojson
      ~error_deserializer
end

module GetLicenseAssetRuleset = struct
  let error_to_string = function
    | `AccessDeniedException _ -> "com.amazonaws.licensemanager#AccessDeniedException"
    | `AuthorizationException _ -> "com.amazonaws.licensemanager#AuthorizationException"
    | `InvalidParameterValueException _ ->
        "com.amazonaws.licensemanager#InvalidParameterValueException"
    | `RateLimitExceededException _ -> "com.amazonaws.licensemanager#RateLimitExceededException"
    | `ServerInternalException _ -> "com.amazonaws.licensemanager#ServerInternalException"
    | `ValidationException _ -> "com.amazonaws.licensemanager#ValidationException"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "AccessDeniedException" ->
          `AccessDeniedException (Json_deserializers.access_denied_exception_of_yojson tree path)
      | _, "AuthorizationException" ->
          `AuthorizationException (Json_deserializers.authorization_exception_of_yojson tree path)
      | _, "InvalidParameterValueException" ->
          `InvalidParameterValueException
            (Json_deserializers.invalid_parameter_value_exception_of_yojson tree path)
      | _, "RateLimitExceededException" ->
          `RateLimitExceededException
            (Json_deserializers.rate_limit_exceeded_exception_of_yojson tree path)
      | _, "ServerInternalException" ->
          `ServerInternalException
            (Json_deserializers.server_internal_exception_of_yojson tree path)
      | _, "ValidationException" ->
          `ValidationException (Json_deserializers.validation_exception_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : get_license_asset_ruleset_request) =
    let input = Json_serializers.get_license_asset_ruleset_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"AWSLicenseManager.GetLicenseAssetRuleset"
      ~service ~context ~input
      ~output_deserializer:Json_deserializers.get_license_asset_ruleset_response_of_yojson
      ~error_deserializer

  let request_with_metadata context (request : get_license_asset_ruleset_request) =
    let input = Json_serializers.get_license_asset_ruleset_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata
      ~shape_name:"AWSLicenseManager.GetLicenseAssetRuleset" ~service ~context ~input
      ~output_deserializer:Json_deserializers.get_license_asset_ruleset_response_of_yojson
      ~error_deserializer
end

module GetLicenseConfiguration = struct
  let error_to_string = function
    | `AccessDeniedException _ -> "com.amazonaws.licensemanager#AccessDeniedException"
    | `AuthorizationException _ -> "com.amazonaws.licensemanager#AuthorizationException"
    | `InvalidParameterValueException _ ->
        "com.amazonaws.licensemanager#InvalidParameterValueException"
    | `RateLimitExceededException _ -> "com.amazonaws.licensemanager#RateLimitExceededException"
    | `ServerInternalException _ -> "com.amazonaws.licensemanager#ServerInternalException"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "AccessDeniedException" ->
          `AccessDeniedException (Json_deserializers.access_denied_exception_of_yojson tree path)
      | _, "AuthorizationException" ->
          `AuthorizationException (Json_deserializers.authorization_exception_of_yojson tree path)
      | _, "InvalidParameterValueException" ->
          `InvalidParameterValueException
            (Json_deserializers.invalid_parameter_value_exception_of_yojson tree path)
      | _, "RateLimitExceededException" ->
          `RateLimitExceededException
            (Json_deserializers.rate_limit_exceeded_exception_of_yojson tree path)
      | _, "ServerInternalException" ->
          `ServerInternalException
            (Json_deserializers.server_internal_exception_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : get_license_configuration_request) =
    let input = Json_serializers.get_license_configuration_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"AWSLicenseManager.GetLicenseConfiguration"
      ~service ~context ~input
      ~output_deserializer:Json_deserializers.get_license_configuration_response_of_yojson
      ~error_deserializer

  let request_with_metadata context (request : get_license_configuration_request) =
    let input = Json_serializers.get_license_configuration_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata
      ~shape_name:"AWSLicenseManager.GetLicenseConfiguration" ~service ~context ~input
      ~output_deserializer:Json_deserializers.get_license_configuration_response_of_yojson
      ~error_deserializer
end

module GetLicenseConversionTask = struct
  let error_to_string = function
    | `AccessDeniedException _ -> "com.amazonaws.licensemanager#AccessDeniedException"
    | `AuthorizationException _ -> "com.amazonaws.licensemanager#AuthorizationException"
    | `InvalidParameterValueException _ ->
        "com.amazonaws.licensemanager#InvalidParameterValueException"
    | `RateLimitExceededException _ -> "com.amazonaws.licensemanager#RateLimitExceededException"
    | `ServerInternalException _ -> "com.amazonaws.licensemanager#ServerInternalException"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "AccessDeniedException" ->
          `AccessDeniedException (Json_deserializers.access_denied_exception_of_yojson tree path)
      | _, "AuthorizationException" ->
          `AuthorizationException (Json_deserializers.authorization_exception_of_yojson tree path)
      | _, "InvalidParameterValueException" ->
          `InvalidParameterValueException
            (Json_deserializers.invalid_parameter_value_exception_of_yojson tree path)
      | _, "RateLimitExceededException" ->
          `RateLimitExceededException
            (Json_deserializers.rate_limit_exceeded_exception_of_yojson tree path)
      | _, "ServerInternalException" ->
          `ServerInternalException
            (Json_deserializers.server_internal_exception_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : get_license_conversion_task_request) =
    let input = Json_serializers.get_license_conversion_task_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"AWSLicenseManager.GetLicenseConversionTask"
      ~service ~context ~input
      ~output_deserializer:Json_deserializers.get_license_conversion_task_response_of_yojson
      ~error_deserializer

  let request_with_metadata context (request : get_license_conversion_task_request) =
    let input = Json_serializers.get_license_conversion_task_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata
      ~shape_name:"AWSLicenseManager.GetLicenseConversionTask" ~service ~context ~input
      ~output_deserializer:Json_deserializers.get_license_conversion_task_response_of_yojson
      ~error_deserializer
end

module GetLicenseManagerReportGenerator = struct
  let error_to_string = function
    | `AccessDeniedException _ -> "com.amazonaws.licensemanager#AccessDeniedException"
    | `AuthorizationException _ -> "com.amazonaws.licensemanager#AuthorizationException"
    | `InvalidParameterValueException _ ->
        "com.amazonaws.licensemanager#InvalidParameterValueException"
    | `RateLimitExceededException _ -> "com.amazonaws.licensemanager#RateLimitExceededException"
    | `ResourceLimitExceededException _ ->
        "com.amazonaws.licensemanager#ResourceLimitExceededException"
    | `ResourceNotFoundException _ -> "com.amazonaws.licensemanager#ResourceNotFoundException"
    | `ServerInternalException _ -> "com.amazonaws.licensemanager#ServerInternalException"
    | `ValidationException _ -> "com.amazonaws.licensemanager#ValidationException"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "AccessDeniedException" ->
          `AccessDeniedException (Json_deserializers.access_denied_exception_of_yojson tree path)
      | _, "AuthorizationException" ->
          `AuthorizationException (Json_deserializers.authorization_exception_of_yojson tree path)
      | _, "InvalidParameterValueException" ->
          `InvalidParameterValueException
            (Json_deserializers.invalid_parameter_value_exception_of_yojson tree path)
      | _, "RateLimitExceededException" ->
          `RateLimitExceededException
            (Json_deserializers.rate_limit_exceeded_exception_of_yojson tree path)
      | _, "ResourceLimitExceededException" ->
          `ResourceLimitExceededException
            (Json_deserializers.resource_limit_exceeded_exception_of_yojson tree path)
      | _, "ResourceNotFoundException" ->
          `ResourceNotFoundException
            (Json_deserializers.resource_not_found_exception_of_yojson tree path)
      | _, "ServerInternalException" ->
          `ServerInternalException
            (Json_deserializers.server_internal_exception_of_yojson tree path)
      | _, "ValidationException" ->
          `ValidationException (Json_deserializers.validation_exception_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : get_license_manager_report_generator_request) =
    let input = Json_serializers.get_license_manager_report_generator_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request
      ~shape_name:"AWSLicenseManager.GetLicenseManagerReportGenerator" ~service ~context ~input
      ~output_deserializer:
        Json_deserializers.get_license_manager_report_generator_response_of_yojson
      ~error_deserializer

  let request_with_metadata context (request : get_license_manager_report_generator_request) =
    let input = Json_serializers.get_license_manager_report_generator_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata
      ~shape_name:"AWSLicenseManager.GetLicenseManagerReportGenerator" ~service ~context ~input
      ~output_deserializer:
        Json_deserializers.get_license_manager_report_generator_response_of_yojson
      ~error_deserializer
end

module GetLicenseUsage = struct
  let error_to_string = function
    | `AccessDeniedException _ -> "com.amazonaws.licensemanager#AccessDeniedException"
    | `AuthorizationException _ -> "com.amazonaws.licensemanager#AuthorizationException"
    | `InvalidParameterValueException _ ->
        "com.amazonaws.licensemanager#InvalidParameterValueException"
    | `RateLimitExceededException _ -> "com.amazonaws.licensemanager#RateLimitExceededException"
    | `ServerInternalException _ -> "com.amazonaws.licensemanager#ServerInternalException"
    | `ValidationException _ -> "com.amazonaws.licensemanager#ValidationException"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "AccessDeniedException" ->
          `AccessDeniedException (Json_deserializers.access_denied_exception_of_yojson tree path)
      | _, "AuthorizationException" ->
          `AuthorizationException (Json_deserializers.authorization_exception_of_yojson tree path)
      | _, "InvalidParameterValueException" ->
          `InvalidParameterValueException
            (Json_deserializers.invalid_parameter_value_exception_of_yojson tree path)
      | _, "RateLimitExceededException" ->
          `RateLimitExceededException
            (Json_deserializers.rate_limit_exceeded_exception_of_yojson tree path)
      | _, "ServerInternalException" ->
          `ServerInternalException
            (Json_deserializers.server_internal_exception_of_yojson tree path)
      | _, "ValidationException" ->
          `ValidationException (Json_deserializers.validation_exception_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : get_license_usage_request) =
    let input = Json_serializers.get_license_usage_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"AWSLicenseManager.GetLicenseUsage" ~service
      ~context ~input ~output_deserializer:Json_deserializers.get_license_usage_response_of_yojson
      ~error_deserializer

  let request_with_metadata context (request : get_license_usage_request) =
    let input = Json_serializers.get_license_usage_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata
      ~shape_name:"AWSLicenseManager.GetLicenseUsage" ~service ~context ~input
      ~output_deserializer:Json_deserializers.get_license_usage_response_of_yojson
      ~error_deserializer
end

module GetServiceSettings = struct
  let error_to_string = function
    | `AccessDeniedException _ -> "com.amazonaws.licensemanager#AccessDeniedException"
    | `AuthorizationException _ -> "com.amazonaws.licensemanager#AuthorizationException"
    | `RateLimitExceededException _ -> "com.amazonaws.licensemanager#RateLimitExceededException"
    | `ServerInternalException _ -> "com.amazonaws.licensemanager#ServerInternalException"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "AccessDeniedException" ->
          `AccessDeniedException (Json_deserializers.access_denied_exception_of_yojson tree path)
      | _, "AuthorizationException" ->
          `AuthorizationException (Json_deserializers.authorization_exception_of_yojson tree path)
      | _, "RateLimitExceededException" ->
          `RateLimitExceededException
            (Json_deserializers.rate_limit_exceeded_exception_of_yojson tree path)
      | _, "ServerInternalException" ->
          `ServerInternalException
            (Json_deserializers.server_internal_exception_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : get_service_settings_request) =
    let input = Json_serializers.get_service_settings_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"AWSLicenseManager.GetServiceSettings" ~service
      ~context ~input
      ~output_deserializer:Json_deserializers.get_service_settings_response_of_yojson
      ~error_deserializer

  let request_with_metadata context (request : get_service_settings_request) =
    let input = Json_serializers.get_service_settings_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata
      ~shape_name:"AWSLicenseManager.GetServiceSettings" ~service ~context ~input
      ~output_deserializer:Json_deserializers.get_service_settings_response_of_yojson
      ~error_deserializer
end

module ListAssetsForLicenseAssetGroup = struct
  let error_to_string = function
    | `AccessDeniedException _ -> "com.amazonaws.licensemanager#AccessDeniedException"
    | `AuthorizationException _ -> "com.amazonaws.licensemanager#AuthorizationException"
    | `InvalidParameterValueException _ ->
        "com.amazonaws.licensemanager#InvalidParameterValueException"
    | `RateLimitExceededException _ -> "com.amazonaws.licensemanager#RateLimitExceededException"
    | `ServerInternalException _ -> "com.amazonaws.licensemanager#ServerInternalException"
    | `ValidationException _ -> "com.amazonaws.licensemanager#ValidationException"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "AccessDeniedException" ->
          `AccessDeniedException (Json_deserializers.access_denied_exception_of_yojson tree path)
      | _, "AuthorizationException" ->
          `AuthorizationException (Json_deserializers.authorization_exception_of_yojson tree path)
      | _, "InvalidParameterValueException" ->
          `InvalidParameterValueException
            (Json_deserializers.invalid_parameter_value_exception_of_yojson tree path)
      | _, "RateLimitExceededException" ->
          `RateLimitExceededException
            (Json_deserializers.rate_limit_exceeded_exception_of_yojson tree path)
      | _, "ServerInternalException" ->
          `ServerInternalException
            (Json_deserializers.server_internal_exception_of_yojson tree path)
      | _, "ValidationException" ->
          `ValidationException (Json_deserializers.validation_exception_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : list_assets_for_license_asset_group_request) =
    let input = Json_serializers.list_assets_for_license_asset_group_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request
      ~shape_name:"AWSLicenseManager.ListAssetsForLicenseAssetGroup" ~service ~context ~input
      ~output_deserializer:Json_deserializers.list_assets_for_license_asset_group_response_of_yojson
      ~error_deserializer

  let request_with_metadata context (request : list_assets_for_license_asset_group_request) =
    let input = Json_serializers.list_assets_for_license_asset_group_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata
      ~shape_name:"AWSLicenseManager.ListAssetsForLicenseAssetGroup" ~service ~context ~input
      ~output_deserializer:Json_deserializers.list_assets_for_license_asset_group_response_of_yojson
      ~error_deserializer
end

module ListAssociationsForLicenseConfiguration = struct
  let error_to_string = function
    | `AccessDeniedException _ -> "com.amazonaws.licensemanager#AccessDeniedException"
    | `AuthorizationException _ -> "com.amazonaws.licensemanager#AuthorizationException"
    | `FilterLimitExceededException _ -> "com.amazonaws.licensemanager#FilterLimitExceededException"
    | `InvalidParameterValueException _ ->
        "com.amazonaws.licensemanager#InvalidParameterValueException"
    | `RateLimitExceededException _ -> "com.amazonaws.licensemanager#RateLimitExceededException"
    | `ServerInternalException _ -> "com.amazonaws.licensemanager#ServerInternalException"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "AccessDeniedException" ->
          `AccessDeniedException (Json_deserializers.access_denied_exception_of_yojson tree path)
      | _, "AuthorizationException" ->
          `AuthorizationException (Json_deserializers.authorization_exception_of_yojson tree path)
      | _, "FilterLimitExceededException" ->
          `FilterLimitExceededException
            (Json_deserializers.filter_limit_exceeded_exception_of_yojson tree path)
      | _, "InvalidParameterValueException" ->
          `InvalidParameterValueException
            (Json_deserializers.invalid_parameter_value_exception_of_yojson tree path)
      | _, "RateLimitExceededException" ->
          `RateLimitExceededException
            (Json_deserializers.rate_limit_exceeded_exception_of_yojson tree path)
      | _, "ServerInternalException" ->
          `ServerInternalException
            (Json_deserializers.server_internal_exception_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : list_associations_for_license_configuration_request) =
    let input =
      Json_serializers.list_associations_for_license_configuration_request_to_yojson request
    in
    Smaws_Lib.Protocols.AwsJson.request
      ~shape_name:"AWSLicenseManager.ListAssociationsForLicenseConfiguration" ~service ~context
      ~input
      ~output_deserializer:
        Json_deserializers.list_associations_for_license_configuration_response_of_yojson
      ~error_deserializer

  let request_with_metadata context (request : list_associations_for_license_configuration_request)
      =
    let input =
      Json_serializers.list_associations_for_license_configuration_request_to_yojson request
    in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata
      ~shape_name:"AWSLicenseManager.ListAssociationsForLicenseConfiguration" ~service ~context
      ~input
      ~output_deserializer:
        Json_deserializers.list_associations_for_license_configuration_response_of_yojson
      ~error_deserializer
end

module ListDistributedGrants = struct
  let error_to_string = function
    | `AccessDeniedException _ -> "com.amazonaws.licensemanager#AccessDeniedException"
    | `AuthorizationException _ -> "com.amazonaws.licensemanager#AuthorizationException"
    | `InvalidParameterValueException _ ->
        "com.amazonaws.licensemanager#InvalidParameterValueException"
    | `RateLimitExceededException _ -> "com.amazonaws.licensemanager#RateLimitExceededException"
    | `ResourceLimitExceededException _ ->
        "com.amazonaws.licensemanager#ResourceLimitExceededException"
    | `ServerInternalException _ -> "com.amazonaws.licensemanager#ServerInternalException"
    | `ValidationException _ -> "com.amazonaws.licensemanager#ValidationException"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "AccessDeniedException" ->
          `AccessDeniedException (Json_deserializers.access_denied_exception_of_yojson tree path)
      | _, "AuthorizationException" ->
          `AuthorizationException (Json_deserializers.authorization_exception_of_yojson tree path)
      | _, "InvalidParameterValueException" ->
          `InvalidParameterValueException
            (Json_deserializers.invalid_parameter_value_exception_of_yojson tree path)
      | _, "RateLimitExceededException" ->
          `RateLimitExceededException
            (Json_deserializers.rate_limit_exceeded_exception_of_yojson tree path)
      | _, "ResourceLimitExceededException" ->
          `ResourceLimitExceededException
            (Json_deserializers.resource_limit_exceeded_exception_of_yojson tree path)
      | _, "ServerInternalException" ->
          `ServerInternalException
            (Json_deserializers.server_internal_exception_of_yojson tree path)
      | _, "ValidationException" ->
          `ValidationException (Json_deserializers.validation_exception_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : list_distributed_grants_request) =
    let input = Json_serializers.list_distributed_grants_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"AWSLicenseManager.ListDistributedGrants"
      ~service ~context ~input
      ~output_deserializer:Json_deserializers.list_distributed_grants_response_of_yojson
      ~error_deserializer

  let request_with_metadata context (request : list_distributed_grants_request) =
    let input = Json_serializers.list_distributed_grants_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata
      ~shape_name:"AWSLicenseManager.ListDistributedGrants" ~service ~context ~input
      ~output_deserializer:Json_deserializers.list_distributed_grants_response_of_yojson
      ~error_deserializer
end

module ListFailuresForLicenseConfigurationOperations = struct
  let error_to_string = function
    | `AccessDeniedException _ -> "com.amazonaws.licensemanager#AccessDeniedException"
    | `AuthorizationException _ -> "com.amazonaws.licensemanager#AuthorizationException"
    | `InvalidParameterValueException _ ->
        "com.amazonaws.licensemanager#InvalidParameterValueException"
    | `RateLimitExceededException _ -> "com.amazonaws.licensemanager#RateLimitExceededException"
    | `ServerInternalException _ -> "com.amazonaws.licensemanager#ServerInternalException"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "AccessDeniedException" ->
          `AccessDeniedException (Json_deserializers.access_denied_exception_of_yojson tree path)
      | _, "AuthorizationException" ->
          `AuthorizationException (Json_deserializers.authorization_exception_of_yojson tree path)
      | _, "InvalidParameterValueException" ->
          `InvalidParameterValueException
            (Json_deserializers.invalid_parameter_value_exception_of_yojson tree path)
      | _, "RateLimitExceededException" ->
          `RateLimitExceededException
            (Json_deserializers.rate_limit_exceeded_exception_of_yojson tree path)
      | _, "ServerInternalException" ->
          `ServerInternalException
            (Json_deserializers.server_internal_exception_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : list_failures_for_license_configuration_operations_request) =
    let input =
      Json_serializers.list_failures_for_license_configuration_operations_request_to_yojson request
    in
    Smaws_Lib.Protocols.AwsJson.request
      ~shape_name:"AWSLicenseManager.ListFailuresForLicenseConfigurationOperations" ~service
      ~context ~input
      ~output_deserializer:
        Json_deserializers.list_failures_for_license_configuration_operations_response_of_yojson
      ~error_deserializer

  let request_with_metadata context
      (request : list_failures_for_license_configuration_operations_request) =
    let input =
      Json_serializers.list_failures_for_license_configuration_operations_request_to_yojson request
    in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata
      ~shape_name:"AWSLicenseManager.ListFailuresForLicenseConfigurationOperations" ~service
      ~context ~input
      ~output_deserializer:
        Json_deserializers.list_failures_for_license_configuration_operations_response_of_yojson
      ~error_deserializer
end

module ListLicenseAssetGroups = struct
  let error_to_string = function
    | `AccessDeniedException _ -> "com.amazonaws.licensemanager#AccessDeniedException"
    | `AuthorizationException _ -> "com.amazonaws.licensemanager#AuthorizationException"
    | `InvalidParameterValueException _ ->
        "com.amazonaws.licensemanager#InvalidParameterValueException"
    | `RateLimitExceededException _ -> "com.amazonaws.licensemanager#RateLimitExceededException"
    | `ServerInternalException _ -> "com.amazonaws.licensemanager#ServerInternalException"
    | `ValidationException _ -> "com.amazonaws.licensemanager#ValidationException"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "AccessDeniedException" ->
          `AccessDeniedException (Json_deserializers.access_denied_exception_of_yojson tree path)
      | _, "AuthorizationException" ->
          `AuthorizationException (Json_deserializers.authorization_exception_of_yojson tree path)
      | _, "InvalidParameterValueException" ->
          `InvalidParameterValueException
            (Json_deserializers.invalid_parameter_value_exception_of_yojson tree path)
      | _, "RateLimitExceededException" ->
          `RateLimitExceededException
            (Json_deserializers.rate_limit_exceeded_exception_of_yojson tree path)
      | _, "ServerInternalException" ->
          `ServerInternalException
            (Json_deserializers.server_internal_exception_of_yojson tree path)
      | _, "ValidationException" ->
          `ValidationException (Json_deserializers.validation_exception_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : list_license_asset_groups_request) =
    let input = Json_serializers.list_license_asset_groups_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"AWSLicenseManager.ListLicenseAssetGroups"
      ~service ~context ~input
      ~output_deserializer:Json_deserializers.list_license_asset_groups_response_of_yojson
      ~error_deserializer

  let request_with_metadata context (request : list_license_asset_groups_request) =
    let input = Json_serializers.list_license_asset_groups_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata
      ~shape_name:"AWSLicenseManager.ListLicenseAssetGroups" ~service ~context ~input
      ~output_deserializer:Json_deserializers.list_license_asset_groups_response_of_yojson
      ~error_deserializer
end

module ListLicenseAssetRulesets = struct
  let error_to_string = function
    | `AccessDeniedException _ -> "com.amazonaws.licensemanager#AccessDeniedException"
    | `AuthorizationException _ -> "com.amazonaws.licensemanager#AuthorizationException"
    | `InvalidParameterValueException _ ->
        "com.amazonaws.licensemanager#InvalidParameterValueException"
    | `RateLimitExceededException _ -> "com.amazonaws.licensemanager#RateLimitExceededException"
    | `ServerInternalException _ -> "com.amazonaws.licensemanager#ServerInternalException"
    | `ValidationException _ -> "com.amazonaws.licensemanager#ValidationException"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "AccessDeniedException" ->
          `AccessDeniedException (Json_deserializers.access_denied_exception_of_yojson tree path)
      | _, "AuthorizationException" ->
          `AuthorizationException (Json_deserializers.authorization_exception_of_yojson tree path)
      | _, "InvalidParameterValueException" ->
          `InvalidParameterValueException
            (Json_deserializers.invalid_parameter_value_exception_of_yojson tree path)
      | _, "RateLimitExceededException" ->
          `RateLimitExceededException
            (Json_deserializers.rate_limit_exceeded_exception_of_yojson tree path)
      | _, "ServerInternalException" ->
          `ServerInternalException
            (Json_deserializers.server_internal_exception_of_yojson tree path)
      | _, "ValidationException" ->
          `ValidationException (Json_deserializers.validation_exception_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : list_license_asset_rulesets_request) =
    let input = Json_serializers.list_license_asset_rulesets_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"AWSLicenseManager.ListLicenseAssetRulesets"
      ~service ~context ~input
      ~output_deserializer:Json_deserializers.list_license_asset_rulesets_response_of_yojson
      ~error_deserializer

  let request_with_metadata context (request : list_license_asset_rulesets_request) =
    let input = Json_serializers.list_license_asset_rulesets_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata
      ~shape_name:"AWSLicenseManager.ListLicenseAssetRulesets" ~service ~context ~input
      ~output_deserializer:Json_deserializers.list_license_asset_rulesets_response_of_yojson
      ~error_deserializer
end

module ListLicenseConfigurations = struct
  let error_to_string = function
    | `AccessDeniedException _ -> "com.amazonaws.licensemanager#AccessDeniedException"
    | `AuthorizationException _ -> "com.amazonaws.licensemanager#AuthorizationException"
    | `FilterLimitExceededException _ -> "com.amazonaws.licensemanager#FilterLimitExceededException"
    | `InvalidParameterValueException _ ->
        "com.amazonaws.licensemanager#InvalidParameterValueException"
    | `RateLimitExceededException _ -> "com.amazonaws.licensemanager#RateLimitExceededException"
    | `ServerInternalException _ -> "com.amazonaws.licensemanager#ServerInternalException"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "AccessDeniedException" ->
          `AccessDeniedException (Json_deserializers.access_denied_exception_of_yojson tree path)
      | _, "AuthorizationException" ->
          `AuthorizationException (Json_deserializers.authorization_exception_of_yojson tree path)
      | _, "FilterLimitExceededException" ->
          `FilterLimitExceededException
            (Json_deserializers.filter_limit_exceeded_exception_of_yojson tree path)
      | _, "InvalidParameterValueException" ->
          `InvalidParameterValueException
            (Json_deserializers.invalid_parameter_value_exception_of_yojson tree path)
      | _, "RateLimitExceededException" ->
          `RateLimitExceededException
            (Json_deserializers.rate_limit_exceeded_exception_of_yojson tree path)
      | _, "ServerInternalException" ->
          `ServerInternalException
            (Json_deserializers.server_internal_exception_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : list_license_configurations_request) =
    let input = Json_serializers.list_license_configurations_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"AWSLicenseManager.ListLicenseConfigurations"
      ~service ~context ~input
      ~output_deserializer:Json_deserializers.list_license_configurations_response_of_yojson
      ~error_deserializer

  let request_with_metadata context (request : list_license_configurations_request) =
    let input = Json_serializers.list_license_configurations_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata
      ~shape_name:"AWSLicenseManager.ListLicenseConfigurations" ~service ~context ~input
      ~output_deserializer:Json_deserializers.list_license_configurations_response_of_yojson
      ~error_deserializer
end

module ListLicenseConfigurationsForOrganization = struct
  let error_to_string = function
    | `AccessDeniedException _ -> "com.amazonaws.licensemanager#AccessDeniedException"
    | `AuthorizationException _ -> "com.amazonaws.licensemanager#AuthorizationException"
    | `FilterLimitExceededException _ -> "com.amazonaws.licensemanager#FilterLimitExceededException"
    | `InvalidParameterValueException _ ->
        "com.amazonaws.licensemanager#InvalidParameterValueException"
    | `RateLimitExceededException _ -> "com.amazonaws.licensemanager#RateLimitExceededException"
    | `ServerInternalException _ -> "com.amazonaws.licensemanager#ServerInternalException"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "AccessDeniedException" ->
          `AccessDeniedException (Json_deserializers.access_denied_exception_of_yojson tree path)
      | _, "AuthorizationException" ->
          `AuthorizationException (Json_deserializers.authorization_exception_of_yojson tree path)
      | _, "FilterLimitExceededException" ->
          `FilterLimitExceededException
            (Json_deserializers.filter_limit_exceeded_exception_of_yojson tree path)
      | _, "InvalidParameterValueException" ->
          `InvalidParameterValueException
            (Json_deserializers.invalid_parameter_value_exception_of_yojson tree path)
      | _, "RateLimitExceededException" ->
          `RateLimitExceededException
            (Json_deserializers.rate_limit_exceeded_exception_of_yojson tree path)
      | _, "ServerInternalException" ->
          `ServerInternalException
            (Json_deserializers.server_internal_exception_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : list_license_configurations_for_organization_request) =
    let input =
      Json_serializers.list_license_configurations_for_organization_request_to_yojson request
    in
    Smaws_Lib.Protocols.AwsJson.request
      ~shape_name:"AWSLicenseManager.ListLicenseConfigurationsForOrganization" ~service ~context
      ~input
      ~output_deserializer:
        Json_deserializers.list_license_configurations_for_organization_response_of_yojson
      ~error_deserializer

  let request_with_metadata context (request : list_license_configurations_for_organization_request)
      =
    let input =
      Json_serializers.list_license_configurations_for_organization_request_to_yojson request
    in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata
      ~shape_name:"AWSLicenseManager.ListLicenseConfigurationsForOrganization" ~service ~context
      ~input
      ~output_deserializer:
        Json_deserializers.list_license_configurations_for_organization_response_of_yojson
      ~error_deserializer
end

module ListLicenseConversionTasks = struct
  let error_to_string = function
    | `AccessDeniedException _ -> "com.amazonaws.licensemanager#AccessDeniedException"
    | `AuthorizationException _ -> "com.amazonaws.licensemanager#AuthorizationException"
    | `InvalidParameterValueException _ ->
        "com.amazonaws.licensemanager#InvalidParameterValueException"
    | `RateLimitExceededException _ -> "com.amazonaws.licensemanager#RateLimitExceededException"
    | `ServerInternalException _ -> "com.amazonaws.licensemanager#ServerInternalException"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "AccessDeniedException" ->
          `AccessDeniedException (Json_deserializers.access_denied_exception_of_yojson tree path)
      | _, "AuthorizationException" ->
          `AuthorizationException (Json_deserializers.authorization_exception_of_yojson tree path)
      | _, "InvalidParameterValueException" ->
          `InvalidParameterValueException
            (Json_deserializers.invalid_parameter_value_exception_of_yojson tree path)
      | _, "RateLimitExceededException" ->
          `RateLimitExceededException
            (Json_deserializers.rate_limit_exceeded_exception_of_yojson tree path)
      | _, "ServerInternalException" ->
          `ServerInternalException
            (Json_deserializers.server_internal_exception_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : list_license_conversion_tasks_request) =
    let input = Json_serializers.list_license_conversion_tasks_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"AWSLicenseManager.ListLicenseConversionTasks"
      ~service ~context ~input
      ~output_deserializer:Json_deserializers.list_license_conversion_tasks_response_of_yojson
      ~error_deserializer

  let request_with_metadata context (request : list_license_conversion_tasks_request) =
    let input = Json_serializers.list_license_conversion_tasks_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata
      ~shape_name:"AWSLicenseManager.ListLicenseConversionTasks" ~service ~context ~input
      ~output_deserializer:Json_deserializers.list_license_conversion_tasks_response_of_yojson
      ~error_deserializer
end

module ListLicenseManagerReportGenerators = struct
  let error_to_string = function
    | `AccessDeniedException _ -> "com.amazonaws.licensemanager#AccessDeniedException"
    | `AuthorizationException _ -> "com.amazonaws.licensemanager#AuthorizationException"
    | `InvalidParameterValueException _ ->
        "com.amazonaws.licensemanager#InvalidParameterValueException"
    | `RateLimitExceededException _ -> "com.amazonaws.licensemanager#RateLimitExceededException"
    | `ResourceLimitExceededException _ ->
        "com.amazonaws.licensemanager#ResourceLimitExceededException"
    | `ResourceNotFoundException _ -> "com.amazonaws.licensemanager#ResourceNotFoundException"
    | `ServerInternalException _ -> "com.amazonaws.licensemanager#ServerInternalException"
    | `ValidationException _ -> "com.amazonaws.licensemanager#ValidationException"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "AccessDeniedException" ->
          `AccessDeniedException (Json_deserializers.access_denied_exception_of_yojson tree path)
      | _, "AuthorizationException" ->
          `AuthorizationException (Json_deserializers.authorization_exception_of_yojson tree path)
      | _, "InvalidParameterValueException" ->
          `InvalidParameterValueException
            (Json_deserializers.invalid_parameter_value_exception_of_yojson tree path)
      | _, "RateLimitExceededException" ->
          `RateLimitExceededException
            (Json_deserializers.rate_limit_exceeded_exception_of_yojson tree path)
      | _, "ResourceLimitExceededException" ->
          `ResourceLimitExceededException
            (Json_deserializers.resource_limit_exceeded_exception_of_yojson tree path)
      | _, "ResourceNotFoundException" ->
          `ResourceNotFoundException
            (Json_deserializers.resource_not_found_exception_of_yojson tree path)
      | _, "ServerInternalException" ->
          `ServerInternalException
            (Json_deserializers.server_internal_exception_of_yojson tree path)
      | _, "ValidationException" ->
          `ValidationException (Json_deserializers.validation_exception_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : list_license_manager_report_generators_request) =
    let input = Json_serializers.list_license_manager_report_generators_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request
      ~shape_name:"AWSLicenseManager.ListLicenseManagerReportGenerators" ~service ~context ~input
      ~output_deserializer:
        Json_deserializers.list_license_manager_report_generators_response_of_yojson
      ~error_deserializer

  let request_with_metadata context (request : list_license_manager_report_generators_request) =
    let input = Json_serializers.list_license_manager_report_generators_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata
      ~shape_name:"AWSLicenseManager.ListLicenseManagerReportGenerators" ~service ~context ~input
      ~output_deserializer:
        Json_deserializers.list_license_manager_report_generators_response_of_yojson
      ~error_deserializer
end

module ListLicenseSpecificationsForResource = struct
  let error_to_string = function
    | `AccessDeniedException _ -> "com.amazonaws.licensemanager#AccessDeniedException"
    | `AuthorizationException _ -> "com.amazonaws.licensemanager#AuthorizationException"
    | `InvalidParameterValueException _ ->
        "com.amazonaws.licensemanager#InvalidParameterValueException"
    | `RateLimitExceededException _ -> "com.amazonaws.licensemanager#RateLimitExceededException"
    | `ServerInternalException _ -> "com.amazonaws.licensemanager#ServerInternalException"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "AccessDeniedException" ->
          `AccessDeniedException (Json_deserializers.access_denied_exception_of_yojson tree path)
      | _, "AuthorizationException" ->
          `AuthorizationException (Json_deserializers.authorization_exception_of_yojson tree path)
      | _, "InvalidParameterValueException" ->
          `InvalidParameterValueException
            (Json_deserializers.invalid_parameter_value_exception_of_yojson tree path)
      | _, "RateLimitExceededException" ->
          `RateLimitExceededException
            (Json_deserializers.rate_limit_exceeded_exception_of_yojson tree path)
      | _, "ServerInternalException" ->
          `ServerInternalException
            (Json_deserializers.server_internal_exception_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : list_license_specifications_for_resource_request) =
    let input =
      Json_serializers.list_license_specifications_for_resource_request_to_yojson request
    in
    Smaws_Lib.Protocols.AwsJson.request
      ~shape_name:"AWSLicenseManager.ListLicenseSpecificationsForResource" ~service ~context ~input
      ~output_deserializer:
        Json_deserializers.list_license_specifications_for_resource_response_of_yojson
      ~error_deserializer

  let request_with_metadata context (request : list_license_specifications_for_resource_request) =
    let input =
      Json_serializers.list_license_specifications_for_resource_request_to_yojson request
    in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata
      ~shape_name:"AWSLicenseManager.ListLicenseSpecificationsForResource" ~service ~context ~input
      ~output_deserializer:
        Json_deserializers.list_license_specifications_for_resource_response_of_yojson
      ~error_deserializer
end

module ListLicenseVersions = struct
  let error_to_string = function
    | `AccessDeniedException _ -> "com.amazonaws.licensemanager#AccessDeniedException"
    | `AuthorizationException _ -> "com.amazonaws.licensemanager#AuthorizationException"
    | `InvalidParameterValueException _ ->
        "com.amazonaws.licensemanager#InvalidParameterValueException"
    | `RateLimitExceededException _ -> "com.amazonaws.licensemanager#RateLimitExceededException"
    | `ServerInternalException _ -> "com.amazonaws.licensemanager#ServerInternalException"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "AccessDeniedException" ->
          `AccessDeniedException (Json_deserializers.access_denied_exception_of_yojson tree path)
      | _, "AuthorizationException" ->
          `AuthorizationException (Json_deserializers.authorization_exception_of_yojson tree path)
      | _, "InvalidParameterValueException" ->
          `InvalidParameterValueException
            (Json_deserializers.invalid_parameter_value_exception_of_yojson tree path)
      | _, "RateLimitExceededException" ->
          `RateLimitExceededException
            (Json_deserializers.rate_limit_exceeded_exception_of_yojson tree path)
      | _, "ServerInternalException" ->
          `ServerInternalException
            (Json_deserializers.server_internal_exception_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : list_license_versions_request) =
    let input = Json_serializers.list_license_versions_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"AWSLicenseManager.ListLicenseVersions" ~service
      ~context ~input
      ~output_deserializer:Json_deserializers.list_license_versions_response_of_yojson
      ~error_deserializer

  let request_with_metadata context (request : list_license_versions_request) =
    let input = Json_serializers.list_license_versions_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata
      ~shape_name:"AWSLicenseManager.ListLicenseVersions" ~service ~context ~input
      ~output_deserializer:Json_deserializers.list_license_versions_response_of_yojson
      ~error_deserializer
end

module ListLicenses = struct
  let error_to_string = function
    | `AccessDeniedException _ -> "com.amazonaws.licensemanager#AccessDeniedException"
    | `AuthorizationException _ -> "com.amazonaws.licensemanager#AuthorizationException"
    | `InvalidParameterValueException _ ->
        "com.amazonaws.licensemanager#InvalidParameterValueException"
    | `RateLimitExceededException _ -> "com.amazonaws.licensemanager#RateLimitExceededException"
    | `ServerInternalException _ -> "com.amazonaws.licensemanager#ServerInternalException"
    | `ValidationException _ -> "com.amazonaws.licensemanager#ValidationException"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "AccessDeniedException" ->
          `AccessDeniedException (Json_deserializers.access_denied_exception_of_yojson tree path)
      | _, "AuthorizationException" ->
          `AuthorizationException (Json_deserializers.authorization_exception_of_yojson tree path)
      | _, "InvalidParameterValueException" ->
          `InvalidParameterValueException
            (Json_deserializers.invalid_parameter_value_exception_of_yojson tree path)
      | _, "RateLimitExceededException" ->
          `RateLimitExceededException
            (Json_deserializers.rate_limit_exceeded_exception_of_yojson tree path)
      | _, "ServerInternalException" ->
          `ServerInternalException
            (Json_deserializers.server_internal_exception_of_yojson tree path)
      | _, "ValidationException" ->
          `ValidationException (Json_deserializers.validation_exception_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : list_licenses_request) =
    let input = Json_serializers.list_licenses_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"AWSLicenseManager.ListLicenses" ~service
      ~context ~input ~output_deserializer:Json_deserializers.list_licenses_response_of_yojson
      ~error_deserializer

  let request_with_metadata context (request : list_licenses_request) =
    let input = Json_serializers.list_licenses_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata ~shape_name:"AWSLicenseManager.ListLicenses"
      ~service ~context ~input
      ~output_deserializer:Json_deserializers.list_licenses_response_of_yojson ~error_deserializer
end

module ListReceivedGrants = struct
  let error_to_string = function
    | `AccessDeniedException _ -> "com.amazonaws.licensemanager#AccessDeniedException"
    | `AuthorizationException _ -> "com.amazonaws.licensemanager#AuthorizationException"
    | `InvalidParameterValueException _ ->
        "com.amazonaws.licensemanager#InvalidParameterValueException"
    | `RateLimitExceededException _ -> "com.amazonaws.licensemanager#RateLimitExceededException"
    | `ResourceLimitExceededException _ ->
        "com.amazonaws.licensemanager#ResourceLimitExceededException"
    | `ServerInternalException _ -> "com.amazonaws.licensemanager#ServerInternalException"
    | `ValidationException _ -> "com.amazonaws.licensemanager#ValidationException"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "AccessDeniedException" ->
          `AccessDeniedException (Json_deserializers.access_denied_exception_of_yojson tree path)
      | _, "AuthorizationException" ->
          `AuthorizationException (Json_deserializers.authorization_exception_of_yojson tree path)
      | _, "InvalidParameterValueException" ->
          `InvalidParameterValueException
            (Json_deserializers.invalid_parameter_value_exception_of_yojson tree path)
      | _, "RateLimitExceededException" ->
          `RateLimitExceededException
            (Json_deserializers.rate_limit_exceeded_exception_of_yojson tree path)
      | _, "ResourceLimitExceededException" ->
          `ResourceLimitExceededException
            (Json_deserializers.resource_limit_exceeded_exception_of_yojson tree path)
      | _, "ServerInternalException" ->
          `ServerInternalException
            (Json_deserializers.server_internal_exception_of_yojson tree path)
      | _, "ValidationException" ->
          `ValidationException (Json_deserializers.validation_exception_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : list_received_grants_request) =
    let input = Json_serializers.list_received_grants_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"AWSLicenseManager.ListReceivedGrants" ~service
      ~context ~input
      ~output_deserializer:Json_deserializers.list_received_grants_response_of_yojson
      ~error_deserializer

  let request_with_metadata context (request : list_received_grants_request) =
    let input = Json_serializers.list_received_grants_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata
      ~shape_name:"AWSLicenseManager.ListReceivedGrants" ~service ~context ~input
      ~output_deserializer:Json_deserializers.list_received_grants_response_of_yojson
      ~error_deserializer
end

module ListReceivedGrantsForOrganization = struct
  let error_to_string = function
    | `AccessDeniedException _ -> "com.amazonaws.licensemanager#AccessDeniedException"
    | `AuthorizationException _ -> "com.amazonaws.licensemanager#AuthorizationException"
    | `InvalidParameterValueException _ ->
        "com.amazonaws.licensemanager#InvalidParameterValueException"
    | `RateLimitExceededException _ -> "com.amazonaws.licensemanager#RateLimitExceededException"
    | `ResourceLimitExceededException _ ->
        "com.amazonaws.licensemanager#ResourceLimitExceededException"
    | `ServerInternalException _ -> "com.amazonaws.licensemanager#ServerInternalException"
    | `ValidationException _ -> "com.amazonaws.licensemanager#ValidationException"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "AccessDeniedException" ->
          `AccessDeniedException (Json_deserializers.access_denied_exception_of_yojson tree path)
      | _, "AuthorizationException" ->
          `AuthorizationException (Json_deserializers.authorization_exception_of_yojson tree path)
      | _, "InvalidParameterValueException" ->
          `InvalidParameterValueException
            (Json_deserializers.invalid_parameter_value_exception_of_yojson tree path)
      | _, "RateLimitExceededException" ->
          `RateLimitExceededException
            (Json_deserializers.rate_limit_exceeded_exception_of_yojson tree path)
      | _, "ResourceLimitExceededException" ->
          `ResourceLimitExceededException
            (Json_deserializers.resource_limit_exceeded_exception_of_yojson tree path)
      | _, "ServerInternalException" ->
          `ServerInternalException
            (Json_deserializers.server_internal_exception_of_yojson tree path)
      | _, "ValidationException" ->
          `ValidationException (Json_deserializers.validation_exception_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : list_received_grants_for_organization_request) =
    let input = Json_serializers.list_received_grants_for_organization_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request
      ~shape_name:"AWSLicenseManager.ListReceivedGrantsForOrganization" ~service ~context ~input
      ~output_deserializer:
        Json_deserializers.list_received_grants_for_organization_response_of_yojson
      ~error_deserializer

  let request_with_metadata context (request : list_received_grants_for_organization_request) =
    let input = Json_serializers.list_received_grants_for_organization_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata
      ~shape_name:"AWSLicenseManager.ListReceivedGrantsForOrganization" ~service ~context ~input
      ~output_deserializer:
        Json_deserializers.list_received_grants_for_organization_response_of_yojson
      ~error_deserializer
end

module ListReceivedLicenses = struct
  let error_to_string = function
    | `AccessDeniedException _ -> "com.amazonaws.licensemanager#AccessDeniedException"
    | `AuthorizationException _ -> "com.amazonaws.licensemanager#AuthorizationException"
    | `InvalidParameterValueException _ ->
        "com.amazonaws.licensemanager#InvalidParameterValueException"
    | `RateLimitExceededException _ -> "com.amazonaws.licensemanager#RateLimitExceededException"
    | `ResourceLimitExceededException _ ->
        "com.amazonaws.licensemanager#ResourceLimitExceededException"
    | `ServerInternalException _ -> "com.amazonaws.licensemanager#ServerInternalException"
    | `ValidationException _ -> "com.amazonaws.licensemanager#ValidationException"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "AccessDeniedException" ->
          `AccessDeniedException (Json_deserializers.access_denied_exception_of_yojson tree path)
      | _, "AuthorizationException" ->
          `AuthorizationException (Json_deserializers.authorization_exception_of_yojson tree path)
      | _, "InvalidParameterValueException" ->
          `InvalidParameterValueException
            (Json_deserializers.invalid_parameter_value_exception_of_yojson tree path)
      | _, "RateLimitExceededException" ->
          `RateLimitExceededException
            (Json_deserializers.rate_limit_exceeded_exception_of_yojson tree path)
      | _, "ResourceLimitExceededException" ->
          `ResourceLimitExceededException
            (Json_deserializers.resource_limit_exceeded_exception_of_yojson tree path)
      | _, "ServerInternalException" ->
          `ServerInternalException
            (Json_deserializers.server_internal_exception_of_yojson tree path)
      | _, "ValidationException" ->
          `ValidationException (Json_deserializers.validation_exception_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : list_received_licenses_request) =
    let input = Json_serializers.list_received_licenses_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"AWSLicenseManager.ListReceivedLicenses"
      ~service ~context ~input
      ~output_deserializer:Json_deserializers.list_received_licenses_response_of_yojson
      ~error_deserializer

  let request_with_metadata context (request : list_received_licenses_request) =
    let input = Json_serializers.list_received_licenses_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata
      ~shape_name:"AWSLicenseManager.ListReceivedLicenses" ~service ~context ~input
      ~output_deserializer:Json_deserializers.list_received_licenses_response_of_yojson
      ~error_deserializer
end

module ListReceivedLicensesForOrganization = struct
  let error_to_string = function
    | `AccessDeniedException _ -> "com.amazonaws.licensemanager#AccessDeniedException"
    | `AuthorizationException _ -> "com.amazonaws.licensemanager#AuthorizationException"
    | `InvalidParameterValueException _ ->
        "com.amazonaws.licensemanager#InvalidParameterValueException"
    | `RateLimitExceededException _ -> "com.amazonaws.licensemanager#RateLimitExceededException"
    | `ResourceLimitExceededException _ ->
        "com.amazonaws.licensemanager#ResourceLimitExceededException"
    | `ServerInternalException _ -> "com.amazonaws.licensemanager#ServerInternalException"
    | `ValidationException _ -> "com.amazonaws.licensemanager#ValidationException"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "AccessDeniedException" ->
          `AccessDeniedException (Json_deserializers.access_denied_exception_of_yojson tree path)
      | _, "AuthorizationException" ->
          `AuthorizationException (Json_deserializers.authorization_exception_of_yojson tree path)
      | _, "InvalidParameterValueException" ->
          `InvalidParameterValueException
            (Json_deserializers.invalid_parameter_value_exception_of_yojson tree path)
      | _, "RateLimitExceededException" ->
          `RateLimitExceededException
            (Json_deserializers.rate_limit_exceeded_exception_of_yojson tree path)
      | _, "ResourceLimitExceededException" ->
          `ResourceLimitExceededException
            (Json_deserializers.resource_limit_exceeded_exception_of_yojson tree path)
      | _, "ServerInternalException" ->
          `ServerInternalException
            (Json_deserializers.server_internal_exception_of_yojson tree path)
      | _, "ValidationException" ->
          `ValidationException (Json_deserializers.validation_exception_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : list_received_licenses_for_organization_request) =
    let input =
      Json_serializers.list_received_licenses_for_organization_request_to_yojson request
    in
    Smaws_Lib.Protocols.AwsJson.request
      ~shape_name:"AWSLicenseManager.ListReceivedLicensesForOrganization" ~service ~context ~input
      ~output_deserializer:
        Json_deserializers.list_received_licenses_for_organization_response_of_yojson
      ~error_deserializer

  let request_with_metadata context (request : list_received_licenses_for_organization_request) =
    let input =
      Json_serializers.list_received_licenses_for_organization_request_to_yojson request
    in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata
      ~shape_name:"AWSLicenseManager.ListReceivedLicensesForOrganization" ~service ~context ~input
      ~output_deserializer:
        Json_deserializers.list_received_licenses_for_organization_response_of_yojson
      ~error_deserializer
end

module ListResourceInventory = struct
  let error_to_string = function
    | `AccessDeniedException _ -> "com.amazonaws.licensemanager#AccessDeniedException"
    | `AuthorizationException _ -> "com.amazonaws.licensemanager#AuthorizationException"
    | `FailedDependencyException _ -> "com.amazonaws.licensemanager#FailedDependencyException"
    | `FilterLimitExceededException _ -> "com.amazonaws.licensemanager#FilterLimitExceededException"
    | `InvalidParameterValueException _ ->
        "com.amazonaws.licensemanager#InvalidParameterValueException"
    | `RateLimitExceededException _ -> "com.amazonaws.licensemanager#RateLimitExceededException"
    | `ServerInternalException _ -> "com.amazonaws.licensemanager#ServerInternalException"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "AccessDeniedException" ->
          `AccessDeniedException (Json_deserializers.access_denied_exception_of_yojson tree path)
      | _, "AuthorizationException" ->
          `AuthorizationException (Json_deserializers.authorization_exception_of_yojson tree path)
      | _, "FailedDependencyException" ->
          `FailedDependencyException
            (Json_deserializers.failed_dependency_exception_of_yojson tree path)
      | _, "FilterLimitExceededException" ->
          `FilterLimitExceededException
            (Json_deserializers.filter_limit_exceeded_exception_of_yojson tree path)
      | _, "InvalidParameterValueException" ->
          `InvalidParameterValueException
            (Json_deserializers.invalid_parameter_value_exception_of_yojson tree path)
      | _, "RateLimitExceededException" ->
          `RateLimitExceededException
            (Json_deserializers.rate_limit_exceeded_exception_of_yojson tree path)
      | _, "ServerInternalException" ->
          `ServerInternalException
            (Json_deserializers.server_internal_exception_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : list_resource_inventory_request) =
    let input = Json_serializers.list_resource_inventory_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"AWSLicenseManager.ListResourceInventory"
      ~service ~context ~input
      ~output_deserializer:Json_deserializers.list_resource_inventory_response_of_yojson
      ~error_deserializer

  let request_with_metadata context (request : list_resource_inventory_request) =
    let input = Json_serializers.list_resource_inventory_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata
      ~shape_name:"AWSLicenseManager.ListResourceInventory" ~service ~context ~input
      ~output_deserializer:Json_deserializers.list_resource_inventory_response_of_yojson
      ~error_deserializer
end

module ListTagsForResource = struct
  let error_to_string = function
    | `AccessDeniedException _ -> "com.amazonaws.licensemanager#AccessDeniedException"
    | `AuthorizationException _ -> "com.amazonaws.licensemanager#AuthorizationException"
    | `InvalidParameterValueException _ ->
        "com.amazonaws.licensemanager#InvalidParameterValueException"
    | `RateLimitExceededException _ -> "com.amazonaws.licensemanager#RateLimitExceededException"
    | `ServerInternalException _ -> "com.amazonaws.licensemanager#ServerInternalException"
    | `ValidationException _ -> "com.amazonaws.licensemanager#ValidationException"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "AccessDeniedException" ->
          `AccessDeniedException (Json_deserializers.access_denied_exception_of_yojson tree path)
      | _, "AuthorizationException" ->
          `AuthorizationException (Json_deserializers.authorization_exception_of_yojson tree path)
      | _, "InvalidParameterValueException" ->
          `InvalidParameterValueException
            (Json_deserializers.invalid_parameter_value_exception_of_yojson tree path)
      | _, "RateLimitExceededException" ->
          `RateLimitExceededException
            (Json_deserializers.rate_limit_exceeded_exception_of_yojson tree path)
      | _, "ServerInternalException" ->
          `ServerInternalException
            (Json_deserializers.server_internal_exception_of_yojson tree path)
      | _, "ValidationException" ->
          `ValidationException (Json_deserializers.validation_exception_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : list_tags_for_resource_request) =
    let input = Json_serializers.list_tags_for_resource_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"AWSLicenseManager.ListTagsForResource" ~service
      ~context ~input
      ~output_deserializer:Json_deserializers.list_tags_for_resource_response_of_yojson
      ~error_deserializer

  let request_with_metadata context (request : list_tags_for_resource_request) =
    let input = Json_serializers.list_tags_for_resource_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata
      ~shape_name:"AWSLicenseManager.ListTagsForResource" ~service ~context ~input
      ~output_deserializer:Json_deserializers.list_tags_for_resource_response_of_yojson
      ~error_deserializer
end

module ListTokens = struct
  let error_to_string = function
    | `AccessDeniedException _ -> "com.amazonaws.licensemanager#AccessDeniedException"
    | `AuthorizationException _ -> "com.amazonaws.licensemanager#AuthorizationException"
    | `RateLimitExceededException _ -> "com.amazonaws.licensemanager#RateLimitExceededException"
    | `ServerInternalException _ -> "com.amazonaws.licensemanager#ServerInternalException"
    | `ValidationException _ -> "com.amazonaws.licensemanager#ValidationException"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "AccessDeniedException" ->
          `AccessDeniedException (Json_deserializers.access_denied_exception_of_yojson tree path)
      | _, "AuthorizationException" ->
          `AuthorizationException (Json_deserializers.authorization_exception_of_yojson tree path)
      | _, "RateLimitExceededException" ->
          `RateLimitExceededException
            (Json_deserializers.rate_limit_exceeded_exception_of_yojson tree path)
      | _, "ServerInternalException" ->
          `ServerInternalException
            (Json_deserializers.server_internal_exception_of_yojson tree path)
      | _, "ValidationException" ->
          `ValidationException (Json_deserializers.validation_exception_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : list_tokens_request) =
    let input = Json_serializers.list_tokens_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"AWSLicenseManager.ListTokens" ~service ~context
      ~input ~output_deserializer:Json_deserializers.list_tokens_response_of_yojson
      ~error_deserializer

  let request_with_metadata context (request : list_tokens_request) =
    let input = Json_serializers.list_tokens_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata ~shape_name:"AWSLicenseManager.ListTokens"
      ~service ~context ~input
      ~output_deserializer:Json_deserializers.list_tokens_response_of_yojson ~error_deserializer
end

module ListUsageForLicenseConfiguration = struct
  let error_to_string = function
    | `AccessDeniedException _ -> "com.amazonaws.licensemanager#AccessDeniedException"
    | `AuthorizationException _ -> "com.amazonaws.licensemanager#AuthorizationException"
    | `FilterLimitExceededException _ -> "com.amazonaws.licensemanager#FilterLimitExceededException"
    | `InvalidParameterValueException _ ->
        "com.amazonaws.licensemanager#InvalidParameterValueException"
    | `RateLimitExceededException _ -> "com.amazonaws.licensemanager#RateLimitExceededException"
    | `ServerInternalException _ -> "com.amazonaws.licensemanager#ServerInternalException"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "AccessDeniedException" ->
          `AccessDeniedException (Json_deserializers.access_denied_exception_of_yojson tree path)
      | _, "AuthorizationException" ->
          `AuthorizationException (Json_deserializers.authorization_exception_of_yojson tree path)
      | _, "FilterLimitExceededException" ->
          `FilterLimitExceededException
            (Json_deserializers.filter_limit_exceeded_exception_of_yojson tree path)
      | _, "InvalidParameterValueException" ->
          `InvalidParameterValueException
            (Json_deserializers.invalid_parameter_value_exception_of_yojson tree path)
      | _, "RateLimitExceededException" ->
          `RateLimitExceededException
            (Json_deserializers.rate_limit_exceeded_exception_of_yojson tree path)
      | _, "ServerInternalException" ->
          `ServerInternalException
            (Json_deserializers.server_internal_exception_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : list_usage_for_license_configuration_request) =
    let input = Json_serializers.list_usage_for_license_configuration_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request
      ~shape_name:"AWSLicenseManager.ListUsageForLicenseConfiguration" ~service ~context ~input
      ~output_deserializer:
        Json_deserializers.list_usage_for_license_configuration_response_of_yojson
      ~error_deserializer

  let request_with_metadata context (request : list_usage_for_license_configuration_request) =
    let input = Json_serializers.list_usage_for_license_configuration_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata
      ~shape_name:"AWSLicenseManager.ListUsageForLicenseConfiguration" ~service ~context ~input
      ~output_deserializer:
        Json_deserializers.list_usage_for_license_configuration_response_of_yojson
      ~error_deserializer
end

module RejectGrant = struct
  let error_to_string = function
    | `AccessDeniedException _ -> "com.amazonaws.licensemanager#AccessDeniedException"
    | `AuthorizationException _ -> "com.amazonaws.licensemanager#AuthorizationException"
    | `InvalidParameterValueException _ ->
        "com.amazonaws.licensemanager#InvalidParameterValueException"
    | `RateLimitExceededException _ -> "com.amazonaws.licensemanager#RateLimitExceededException"
    | `ResourceLimitExceededException _ ->
        "com.amazonaws.licensemanager#ResourceLimitExceededException"
    | `ServerInternalException _ -> "com.amazonaws.licensemanager#ServerInternalException"
    | `ValidationException _ -> "com.amazonaws.licensemanager#ValidationException"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "AccessDeniedException" ->
          `AccessDeniedException (Json_deserializers.access_denied_exception_of_yojson tree path)
      | _, "AuthorizationException" ->
          `AuthorizationException (Json_deserializers.authorization_exception_of_yojson tree path)
      | _, "InvalidParameterValueException" ->
          `InvalidParameterValueException
            (Json_deserializers.invalid_parameter_value_exception_of_yojson tree path)
      | _, "RateLimitExceededException" ->
          `RateLimitExceededException
            (Json_deserializers.rate_limit_exceeded_exception_of_yojson tree path)
      | _, "ResourceLimitExceededException" ->
          `ResourceLimitExceededException
            (Json_deserializers.resource_limit_exceeded_exception_of_yojson tree path)
      | _, "ServerInternalException" ->
          `ServerInternalException
            (Json_deserializers.server_internal_exception_of_yojson tree path)
      | _, "ValidationException" ->
          `ValidationException (Json_deserializers.validation_exception_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : reject_grant_request) =
    let input = Json_serializers.reject_grant_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"AWSLicenseManager.RejectGrant" ~service
      ~context ~input ~output_deserializer:Json_deserializers.reject_grant_response_of_yojson
      ~error_deserializer

  let request_with_metadata context (request : reject_grant_request) =
    let input = Json_serializers.reject_grant_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata ~shape_name:"AWSLicenseManager.RejectGrant"
      ~service ~context ~input
      ~output_deserializer:Json_deserializers.reject_grant_response_of_yojson ~error_deserializer
end

module TagResource = struct
  let error_to_string = function
    | `AccessDeniedException _ -> "com.amazonaws.licensemanager#AccessDeniedException"
    | `AuthorizationException _ -> "com.amazonaws.licensemanager#AuthorizationException"
    | `InvalidParameterValueException _ ->
        "com.amazonaws.licensemanager#InvalidParameterValueException"
    | `RateLimitExceededException _ -> "com.amazonaws.licensemanager#RateLimitExceededException"
    | `ServerInternalException _ -> "com.amazonaws.licensemanager#ServerInternalException"
    | `ValidationException _ -> "com.amazonaws.licensemanager#ValidationException"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "AccessDeniedException" ->
          `AccessDeniedException (Json_deserializers.access_denied_exception_of_yojson tree path)
      | _, "AuthorizationException" ->
          `AuthorizationException (Json_deserializers.authorization_exception_of_yojson tree path)
      | _, "InvalidParameterValueException" ->
          `InvalidParameterValueException
            (Json_deserializers.invalid_parameter_value_exception_of_yojson tree path)
      | _, "RateLimitExceededException" ->
          `RateLimitExceededException
            (Json_deserializers.rate_limit_exceeded_exception_of_yojson tree path)
      | _, "ServerInternalException" ->
          `ServerInternalException
            (Json_deserializers.server_internal_exception_of_yojson tree path)
      | _, "ValidationException" ->
          `ValidationException (Json_deserializers.validation_exception_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : tag_resource_request) =
    let input = Json_serializers.tag_resource_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"AWSLicenseManager.TagResource" ~service
      ~context ~input ~output_deserializer:Json_deserializers.tag_resource_response_of_yojson
      ~error_deserializer

  let request_with_metadata context (request : tag_resource_request) =
    let input = Json_serializers.tag_resource_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata ~shape_name:"AWSLicenseManager.TagResource"
      ~service ~context ~input
      ~output_deserializer:Json_deserializers.tag_resource_response_of_yojson ~error_deserializer
end

module UntagResource = struct
  let error_to_string = function
    | `AccessDeniedException _ -> "com.amazonaws.licensemanager#AccessDeniedException"
    | `AuthorizationException _ -> "com.amazonaws.licensemanager#AuthorizationException"
    | `InvalidParameterValueException _ ->
        "com.amazonaws.licensemanager#InvalidParameterValueException"
    | `RateLimitExceededException _ -> "com.amazonaws.licensemanager#RateLimitExceededException"
    | `ServerInternalException _ -> "com.amazonaws.licensemanager#ServerInternalException"
    | `ValidationException _ -> "com.amazonaws.licensemanager#ValidationException"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "AccessDeniedException" ->
          `AccessDeniedException (Json_deserializers.access_denied_exception_of_yojson tree path)
      | _, "AuthorizationException" ->
          `AuthorizationException (Json_deserializers.authorization_exception_of_yojson tree path)
      | _, "InvalidParameterValueException" ->
          `InvalidParameterValueException
            (Json_deserializers.invalid_parameter_value_exception_of_yojson tree path)
      | _, "RateLimitExceededException" ->
          `RateLimitExceededException
            (Json_deserializers.rate_limit_exceeded_exception_of_yojson tree path)
      | _, "ServerInternalException" ->
          `ServerInternalException
            (Json_deserializers.server_internal_exception_of_yojson tree path)
      | _, "ValidationException" ->
          `ValidationException (Json_deserializers.validation_exception_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : untag_resource_request) =
    let input = Json_serializers.untag_resource_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"AWSLicenseManager.UntagResource" ~service
      ~context ~input ~output_deserializer:Json_deserializers.untag_resource_response_of_yojson
      ~error_deserializer

  let request_with_metadata context (request : untag_resource_request) =
    let input = Json_serializers.untag_resource_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata ~shape_name:"AWSLicenseManager.UntagResource"
      ~service ~context ~input
      ~output_deserializer:Json_deserializers.untag_resource_response_of_yojson ~error_deserializer
end

module UpdateLicenseAssetGroup = struct
  let error_to_string = function
    | `AccessDeniedException _ -> "com.amazonaws.licensemanager#AccessDeniedException"
    | `AuthorizationException _ -> "com.amazonaws.licensemanager#AuthorizationException"
    | `InvalidParameterValueException _ ->
        "com.amazonaws.licensemanager#InvalidParameterValueException"
    | `RateLimitExceededException _ -> "com.amazonaws.licensemanager#RateLimitExceededException"
    | `ServerInternalException _ -> "com.amazonaws.licensemanager#ServerInternalException"
    | `ValidationException _ -> "com.amazonaws.licensemanager#ValidationException"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "AccessDeniedException" ->
          `AccessDeniedException (Json_deserializers.access_denied_exception_of_yojson tree path)
      | _, "AuthorizationException" ->
          `AuthorizationException (Json_deserializers.authorization_exception_of_yojson tree path)
      | _, "InvalidParameterValueException" ->
          `InvalidParameterValueException
            (Json_deserializers.invalid_parameter_value_exception_of_yojson tree path)
      | _, "RateLimitExceededException" ->
          `RateLimitExceededException
            (Json_deserializers.rate_limit_exceeded_exception_of_yojson tree path)
      | _, "ServerInternalException" ->
          `ServerInternalException
            (Json_deserializers.server_internal_exception_of_yojson tree path)
      | _, "ValidationException" ->
          `ValidationException (Json_deserializers.validation_exception_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : update_license_asset_group_request) =
    let input = Json_serializers.update_license_asset_group_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"AWSLicenseManager.UpdateLicenseAssetGroup"
      ~service ~context ~input
      ~output_deserializer:Json_deserializers.update_license_asset_group_response_of_yojson
      ~error_deserializer

  let request_with_metadata context (request : update_license_asset_group_request) =
    let input = Json_serializers.update_license_asset_group_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata
      ~shape_name:"AWSLicenseManager.UpdateLicenseAssetGroup" ~service ~context ~input
      ~output_deserializer:Json_deserializers.update_license_asset_group_response_of_yojson
      ~error_deserializer
end

module UpdateLicenseAssetRuleset = struct
  let error_to_string = function
    | `AccessDeniedException _ -> "com.amazonaws.licensemanager#AccessDeniedException"
    | `AuthorizationException _ -> "com.amazonaws.licensemanager#AuthorizationException"
    | `InvalidParameterValueException _ ->
        "com.amazonaws.licensemanager#InvalidParameterValueException"
    | `RateLimitExceededException _ -> "com.amazonaws.licensemanager#RateLimitExceededException"
    | `ServerInternalException _ -> "com.amazonaws.licensemanager#ServerInternalException"
    | `ValidationException _ -> "com.amazonaws.licensemanager#ValidationException"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "AccessDeniedException" ->
          `AccessDeniedException (Json_deserializers.access_denied_exception_of_yojson tree path)
      | _, "AuthorizationException" ->
          `AuthorizationException (Json_deserializers.authorization_exception_of_yojson tree path)
      | _, "InvalidParameterValueException" ->
          `InvalidParameterValueException
            (Json_deserializers.invalid_parameter_value_exception_of_yojson tree path)
      | _, "RateLimitExceededException" ->
          `RateLimitExceededException
            (Json_deserializers.rate_limit_exceeded_exception_of_yojson tree path)
      | _, "ServerInternalException" ->
          `ServerInternalException
            (Json_deserializers.server_internal_exception_of_yojson tree path)
      | _, "ValidationException" ->
          `ValidationException (Json_deserializers.validation_exception_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : update_license_asset_ruleset_request) =
    let input = Json_serializers.update_license_asset_ruleset_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"AWSLicenseManager.UpdateLicenseAssetRuleset"
      ~service ~context ~input
      ~output_deserializer:Json_deserializers.update_license_asset_ruleset_response_of_yojson
      ~error_deserializer

  let request_with_metadata context (request : update_license_asset_ruleset_request) =
    let input = Json_serializers.update_license_asset_ruleset_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata
      ~shape_name:"AWSLicenseManager.UpdateLicenseAssetRuleset" ~service ~context ~input
      ~output_deserializer:Json_deserializers.update_license_asset_ruleset_response_of_yojson
      ~error_deserializer
end

module UpdateLicenseConfiguration = struct
  let error_to_string = function
    | `AccessDeniedException _ -> "com.amazonaws.licensemanager#AccessDeniedException"
    | `AuthorizationException _ -> "com.amazonaws.licensemanager#AuthorizationException"
    | `ConflictException _ -> "com.amazonaws.licensemanager#ConflictException"
    | `InvalidParameterValueException _ ->
        "com.amazonaws.licensemanager#InvalidParameterValueException"
    | `RateLimitExceededException _ -> "com.amazonaws.licensemanager#RateLimitExceededException"
    | `ResourceLimitExceededException _ ->
        "com.amazonaws.licensemanager#ResourceLimitExceededException"
    | `ServerInternalException _ -> "com.amazonaws.licensemanager#ServerInternalException"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "AccessDeniedException" ->
          `AccessDeniedException (Json_deserializers.access_denied_exception_of_yojson tree path)
      | _, "AuthorizationException" ->
          `AuthorizationException (Json_deserializers.authorization_exception_of_yojson tree path)
      | _, "ConflictException" ->
          `ConflictException (Json_deserializers.conflict_exception_of_yojson tree path)
      | _, "InvalidParameterValueException" ->
          `InvalidParameterValueException
            (Json_deserializers.invalid_parameter_value_exception_of_yojson tree path)
      | _, "RateLimitExceededException" ->
          `RateLimitExceededException
            (Json_deserializers.rate_limit_exceeded_exception_of_yojson tree path)
      | _, "ResourceLimitExceededException" ->
          `ResourceLimitExceededException
            (Json_deserializers.resource_limit_exceeded_exception_of_yojson tree path)
      | _, "ServerInternalException" ->
          `ServerInternalException
            (Json_deserializers.server_internal_exception_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : update_license_configuration_request) =
    let input = Json_serializers.update_license_configuration_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"AWSLicenseManager.UpdateLicenseConfiguration"
      ~service ~context ~input
      ~output_deserializer:Json_deserializers.update_license_configuration_response_of_yojson
      ~error_deserializer

  let request_with_metadata context (request : update_license_configuration_request) =
    let input = Json_serializers.update_license_configuration_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata
      ~shape_name:"AWSLicenseManager.UpdateLicenseConfiguration" ~service ~context ~input
      ~output_deserializer:Json_deserializers.update_license_configuration_response_of_yojson
      ~error_deserializer
end

module UpdateLicenseManagerReportGenerator = struct
  let error_to_string = function
    | `AccessDeniedException _ -> "com.amazonaws.licensemanager#AccessDeniedException"
    | `AuthorizationException _ -> "com.amazonaws.licensemanager#AuthorizationException"
    | `InvalidParameterValueException _ ->
        "com.amazonaws.licensemanager#InvalidParameterValueException"
    | `RateLimitExceededException _ -> "com.amazonaws.licensemanager#RateLimitExceededException"
    | `ResourceLimitExceededException _ ->
        "com.amazonaws.licensemanager#ResourceLimitExceededException"
    | `ResourceNotFoundException _ -> "com.amazonaws.licensemanager#ResourceNotFoundException"
    | `ServerInternalException _ -> "com.amazonaws.licensemanager#ServerInternalException"
    | `ValidationException _ -> "com.amazonaws.licensemanager#ValidationException"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "AccessDeniedException" ->
          `AccessDeniedException (Json_deserializers.access_denied_exception_of_yojson tree path)
      | _, "AuthorizationException" ->
          `AuthorizationException (Json_deserializers.authorization_exception_of_yojson tree path)
      | _, "InvalidParameterValueException" ->
          `InvalidParameterValueException
            (Json_deserializers.invalid_parameter_value_exception_of_yojson tree path)
      | _, "RateLimitExceededException" ->
          `RateLimitExceededException
            (Json_deserializers.rate_limit_exceeded_exception_of_yojson tree path)
      | _, "ResourceLimitExceededException" ->
          `ResourceLimitExceededException
            (Json_deserializers.resource_limit_exceeded_exception_of_yojson tree path)
      | _, "ResourceNotFoundException" ->
          `ResourceNotFoundException
            (Json_deserializers.resource_not_found_exception_of_yojson tree path)
      | _, "ServerInternalException" ->
          `ServerInternalException
            (Json_deserializers.server_internal_exception_of_yojson tree path)
      | _, "ValidationException" ->
          `ValidationException (Json_deserializers.validation_exception_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : update_license_manager_report_generator_request) =
    let input =
      Json_serializers.update_license_manager_report_generator_request_to_yojson request
    in
    Smaws_Lib.Protocols.AwsJson.request
      ~shape_name:"AWSLicenseManager.UpdateLicenseManagerReportGenerator" ~service ~context ~input
      ~output_deserializer:
        Json_deserializers.update_license_manager_report_generator_response_of_yojson
      ~error_deserializer

  let request_with_metadata context (request : update_license_manager_report_generator_request) =
    let input =
      Json_serializers.update_license_manager_report_generator_request_to_yojson request
    in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata
      ~shape_name:"AWSLicenseManager.UpdateLicenseManagerReportGenerator" ~service ~context ~input
      ~output_deserializer:
        Json_deserializers.update_license_manager_report_generator_response_of_yojson
      ~error_deserializer
end

module UpdateLicenseSpecificationsForResource = struct
  let error_to_string = function
    | `AccessDeniedException _ -> "com.amazonaws.licensemanager#AccessDeniedException"
    | `AuthorizationException _ -> "com.amazonaws.licensemanager#AuthorizationException"
    | `ConflictException _ -> "com.amazonaws.licensemanager#ConflictException"
    | `InvalidParameterValueException _ ->
        "com.amazonaws.licensemanager#InvalidParameterValueException"
    | `InvalidResourceStateException _ ->
        "com.amazonaws.licensemanager#InvalidResourceStateException"
    | `LicenseUsageException _ -> "com.amazonaws.licensemanager#LicenseUsageException"
    | `RateLimitExceededException _ -> "com.amazonaws.licensemanager#RateLimitExceededException"
    | `ServerInternalException _ -> "com.amazonaws.licensemanager#ServerInternalException"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "AccessDeniedException" ->
          `AccessDeniedException (Json_deserializers.access_denied_exception_of_yojson tree path)
      | _, "AuthorizationException" ->
          `AuthorizationException (Json_deserializers.authorization_exception_of_yojson tree path)
      | _, "ConflictException" ->
          `ConflictException (Json_deserializers.conflict_exception_of_yojson tree path)
      | _, "InvalidParameterValueException" ->
          `InvalidParameterValueException
            (Json_deserializers.invalid_parameter_value_exception_of_yojson tree path)
      | _, "InvalidResourceStateException" ->
          `InvalidResourceStateException
            (Json_deserializers.invalid_resource_state_exception_of_yojson tree path)
      | _, "LicenseUsageException" ->
          `LicenseUsageException (Json_deserializers.license_usage_exception_of_yojson tree path)
      | _, "RateLimitExceededException" ->
          `RateLimitExceededException
            (Json_deserializers.rate_limit_exceeded_exception_of_yojson tree path)
      | _, "ServerInternalException" ->
          `ServerInternalException
            (Json_deserializers.server_internal_exception_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : update_license_specifications_for_resource_request) =
    let input =
      Json_serializers.update_license_specifications_for_resource_request_to_yojson request
    in
    Smaws_Lib.Protocols.AwsJson.request
      ~shape_name:"AWSLicenseManager.UpdateLicenseSpecificationsForResource" ~service ~context
      ~input
      ~output_deserializer:
        Json_deserializers.update_license_specifications_for_resource_response_of_yojson
      ~error_deserializer

  let request_with_metadata context (request : update_license_specifications_for_resource_request) =
    let input =
      Json_serializers.update_license_specifications_for_resource_request_to_yojson request
    in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata
      ~shape_name:"AWSLicenseManager.UpdateLicenseSpecificationsForResource" ~service ~context
      ~input
      ~output_deserializer:
        Json_deserializers.update_license_specifications_for_resource_response_of_yojson
      ~error_deserializer
end

module UpdateServiceSettings = struct
  let error_to_string = function
    | `AccessDeniedException _ -> "com.amazonaws.licensemanager#AccessDeniedException"
    | `AuthorizationException _ -> "com.amazonaws.licensemanager#AuthorizationException"
    | `ConflictException _ -> "com.amazonaws.licensemanager#ConflictException"
    | `InvalidParameterValueException _ ->
        "com.amazonaws.licensemanager#InvalidParameterValueException"
    | `RateLimitExceededException _ -> "com.amazonaws.licensemanager#RateLimitExceededException"
    | `ServerInternalException _ -> "com.amazonaws.licensemanager#ServerInternalException"
    | `ValidationException _ -> "com.amazonaws.licensemanager#ValidationException"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "AccessDeniedException" ->
          `AccessDeniedException (Json_deserializers.access_denied_exception_of_yojson tree path)
      | _, "AuthorizationException" ->
          `AuthorizationException (Json_deserializers.authorization_exception_of_yojson tree path)
      | _, "ConflictException" ->
          `ConflictException (Json_deserializers.conflict_exception_of_yojson tree path)
      | _, "InvalidParameterValueException" ->
          `InvalidParameterValueException
            (Json_deserializers.invalid_parameter_value_exception_of_yojson tree path)
      | _, "RateLimitExceededException" ->
          `RateLimitExceededException
            (Json_deserializers.rate_limit_exceeded_exception_of_yojson tree path)
      | _, "ServerInternalException" ->
          `ServerInternalException
            (Json_deserializers.server_internal_exception_of_yojson tree path)
      | _, "ValidationException" ->
          `ValidationException (Json_deserializers.validation_exception_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : update_service_settings_request) =
    let input = Json_serializers.update_service_settings_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"AWSLicenseManager.UpdateServiceSettings"
      ~service ~context ~input
      ~output_deserializer:Json_deserializers.update_service_settings_response_of_yojson
      ~error_deserializer

  let request_with_metadata context (request : update_service_settings_request) =
    let input = Json_serializers.update_service_settings_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata
      ~shape_name:"AWSLicenseManager.UpdateServiceSettings" ~service ~context ~input
      ~output_deserializer:Json_deserializers.update_service_settings_response_of_yojson
      ~error_deserializer
end
