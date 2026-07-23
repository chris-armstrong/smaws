open Types
open Service_metadata

module AddCustomAttributes = struct
  let error_to_string = function
    | `InternalErrorException _ -> "com.amazonaws.cognitoidentityprovider#InternalErrorException"
    | `InvalidParameterException _ ->
        "com.amazonaws.cognitoidentityprovider#InvalidParameterException"
    | `NotAuthorizedException _ -> "com.amazonaws.cognitoidentityprovider#NotAuthorizedException"
    | `OperationNotEnabledException _ ->
        "com.amazonaws.cognitoidentityprovider#OperationNotEnabledException"
    | `ResourceNotFoundException _ ->
        "com.amazonaws.cognitoidentityprovider#ResourceNotFoundException"
    | `TooManyRequestsException _ ->
        "com.amazonaws.cognitoidentityprovider#TooManyRequestsException"
    | `UserImportInProgressException _ ->
        "com.amazonaws.cognitoidentityprovider#UserImportInProgressException"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "InternalErrorException" ->
          `InternalErrorException (Json_deserializers.internal_error_exception_of_yojson tree path)
      | _, "InvalidParameterException" ->
          `InvalidParameterException
            (Json_deserializers.invalid_parameter_exception_of_yojson tree path)
      | _, "NotAuthorizedException" ->
          `NotAuthorizedException (Json_deserializers.not_authorized_exception_of_yojson tree path)
      | _, "OperationNotEnabledException" ->
          `OperationNotEnabledException
            (Json_deserializers.operation_not_enabled_exception_of_yojson tree path)
      | _, "ResourceNotFoundException" ->
          `ResourceNotFoundException
            (Json_deserializers.resource_not_found_exception_of_yojson tree path)
      | _, "TooManyRequestsException" ->
          `TooManyRequestsException
            (Json_deserializers.too_many_requests_exception_of_yojson tree path)
      | _, "UserImportInProgressException" ->
          `UserImportInProgressException
            (Json_deserializers.user_import_in_progress_exception_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : add_custom_attributes_request) =
    let input = Json_serializers.add_custom_attributes_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request
      ~shape_name:"AWSCognitoIdentityProviderService.AddCustomAttributes" ~service ~context ~input
      ~output_deserializer:Json_deserializers.add_custom_attributes_response_of_yojson
      ~error_deserializer

  let request_with_metadata context (request : add_custom_attributes_request) =
    let input = Json_serializers.add_custom_attributes_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata
      ~shape_name:"AWSCognitoIdentityProviderService.AddCustomAttributes" ~service ~context ~input
      ~output_deserializer:Json_deserializers.add_custom_attributes_response_of_yojson
      ~error_deserializer
end

module AddUserPoolClientSecret = struct
  let error_to_string = function
    | `AccessDeniedException _ -> "com.amazonaws.cognitoidentityprovider#AccessDeniedException"
    | `InternalServerException _ -> "com.amazonaws.cognitoidentityprovider#InternalServerException"
    | `InvalidParameterException _ ->
        "com.amazonaws.cognitoidentityprovider#InvalidParameterException"
    | `LimitExceededException _ -> "com.amazonaws.cognitoidentityprovider#LimitExceededException"
    | `ResourceNotFoundException _ ->
        "com.amazonaws.cognitoidentityprovider#ResourceNotFoundException"
    | `TooManyRequestsException _ ->
        "com.amazonaws.cognitoidentityprovider#TooManyRequestsException"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "AccessDeniedException" ->
          `AccessDeniedException (Json_deserializers.access_denied_exception_of_yojson tree path)
      | _, "InternalServerException" ->
          `InternalServerException
            (Json_deserializers.internal_server_exception_of_yojson tree path)
      | _, "InvalidParameterException" ->
          `InvalidParameterException
            (Json_deserializers.invalid_parameter_exception_of_yojson tree path)
      | _, "LimitExceededException" ->
          `LimitExceededException (Json_deserializers.limit_exceeded_exception_of_yojson tree path)
      | _, "ResourceNotFoundException" ->
          `ResourceNotFoundException
            (Json_deserializers.resource_not_found_exception_of_yojson tree path)
      | _, "TooManyRequestsException" ->
          `TooManyRequestsException
            (Json_deserializers.too_many_requests_exception_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : add_user_pool_client_secret_request) =
    let input = Json_serializers.add_user_pool_client_secret_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request
      ~shape_name:"AWSCognitoIdentityProviderService.AddUserPoolClientSecret" ~service ~context
      ~input ~output_deserializer:Json_deserializers.add_user_pool_client_secret_response_of_yojson
      ~error_deserializer

  let request_with_metadata context (request : add_user_pool_client_secret_request) =
    let input = Json_serializers.add_user_pool_client_secret_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata
      ~shape_name:"AWSCognitoIdentityProviderService.AddUserPoolClientSecret" ~service ~context
      ~input ~output_deserializer:Json_deserializers.add_user_pool_client_secret_response_of_yojson
      ~error_deserializer
end

module AdminAddUserToGroup = struct
  let error_to_string = function
    | `InternalErrorException _ -> "com.amazonaws.cognitoidentityprovider#InternalErrorException"
    | `InvalidParameterException _ ->
        "com.amazonaws.cognitoidentityprovider#InvalidParameterException"
    | `NotAuthorizedException _ -> "com.amazonaws.cognitoidentityprovider#NotAuthorizedException"
    | `OperationNotEnabledException _ ->
        "com.amazonaws.cognitoidentityprovider#OperationNotEnabledException"
    | `ResourceNotFoundException _ ->
        "com.amazonaws.cognitoidentityprovider#ResourceNotFoundException"
    | `TooManyRequestsException _ ->
        "com.amazonaws.cognitoidentityprovider#TooManyRequestsException"
    | `UserNotFoundException _ -> "com.amazonaws.cognitoidentityprovider#UserNotFoundException"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "InternalErrorException" ->
          `InternalErrorException (Json_deserializers.internal_error_exception_of_yojson tree path)
      | _, "InvalidParameterException" ->
          `InvalidParameterException
            (Json_deserializers.invalid_parameter_exception_of_yojson tree path)
      | _, "NotAuthorizedException" ->
          `NotAuthorizedException (Json_deserializers.not_authorized_exception_of_yojson tree path)
      | _, "OperationNotEnabledException" ->
          `OperationNotEnabledException
            (Json_deserializers.operation_not_enabled_exception_of_yojson tree path)
      | _, "ResourceNotFoundException" ->
          `ResourceNotFoundException
            (Json_deserializers.resource_not_found_exception_of_yojson tree path)
      | _, "TooManyRequestsException" ->
          `TooManyRequestsException
            (Json_deserializers.too_many_requests_exception_of_yojson tree path)
      | _, "UserNotFoundException" ->
          `UserNotFoundException (Json_deserializers.user_not_found_exception_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : admin_add_user_to_group_request) =
    let input = Json_serializers.admin_add_user_to_group_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request
      ~shape_name:"AWSCognitoIdentityProviderService.AdminAddUserToGroup" ~service ~context ~input
      ~output_deserializer:Smaws_Lib.Smithy_api.Json_deserializers.unit__of_yojson
      ~error_deserializer

  let request_with_metadata context (request : admin_add_user_to_group_request) =
    let input = Json_serializers.admin_add_user_to_group_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata
      ~shape_name:"AWSCognitoIdentityProviderService.AdminAddUserToGroup" ~service ~context ~input
      ~output_deserializer:Smaws_Lib.Smithy_api.Json_deserializers.unit__of_yojson
      ~error_deserializer
end

module AdminConfirmSignUp = struct
  let error_to_string = function
    | `InternalErrorException _ -> "com.amazonaws.cognitoidentityprovider#InternalErrorException"
    | `InvalidLambdaResponseException _ ->
        "com.amazonaws.cognitoidentityprovider#InvalidLambdaResponseException"
    | `InvalidParameterException _ ->
        "com.amazonaws.cognitoidentityprovider#InvalidParameterException"
    | `LimitExceededException _ -> "com.amazonaws.cognitoidentityprovider#LimitExceededException"
    | `NotAuthorizedException _ -> "com.amazonaws.cognitoidentityprovider#NotAuthorizedException"
    | `OperationNotEnabledException _ ->
        "com.amazonaws.cognitoidentityprovider#OperationNotEnabledException"
    | `ResourceNotFoundException _ ->
        "com.amazonaws.cognitoidentityprovider#ResourceNotFoundException"
    | `TooManyFailedAttemptsException _ ->
        "com.amazonaws.cognitoidentityprovider#TooManyFailedAttemptsException"
    | `TooManyRequestsException _ ->
        "com.amazonaws.cognitoidentityprovider#TooManyRequestsException"
    | `UnexpectedLambdaException _ ->
        "com.amazonaws.cognitoidentityprovider#UnexpectedLambdaException"
    | `UserLambdaValidationException _ ->
        "com.amazonaws.cognitoidentityprovider#UserLambdaValidationException"
    | `UserNotFoundException _ -> "com.amazonaws.cognitoidentityprovider#UserNotFoundException"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "InternalErrorException" ->
          `InternalErrorException (Json_deserializers.internal_error_exception_of_yojson tree path)
      | _, "InvalidLambdaResponseException" ->
          `InvalidLambdaResponseException
            (Json_deserializers.invalid_lambda_response_exception_of_yojson tree path)
      | _, "InvalidParameterException" ->
          `InvalidParameterException
            (Json_deserializers.invalid_parameter_exception_of_yojson tree path)
      | _, "LimitExceededException" ->
          `LimitExceededException (Json_deserializers.limit_exceeded_exception_of_yojson tree path)
      | _, "NotAuthorizedException" ->
          `NotAuthorizedException (Json_deserializers.not_authorized_exception_of_yojson tree path)
      | _, "OperationNotEnabledException" ->
          `OperationNotEnabledException
            (Json_deserializers.operation_not_enabled_exception_of_yojson tree path)
      | _, "ResourceNotFoundException" ->
          `ResourceNotFoundException
            (Json_deserializers.resource_not_found_exception_of_yojson tree path)
      | _, "TooManyFailedAttemptsException" ->
          `TooManyFailedAttemptsException
            (Json_deserializers.too_many_failed_attempts_exception_of_yojson tree path)
      | _, "TooManyRequestsException" ->
          `TooManyRequestsException
            (Json_deserializers.too_many_requests_exception_of_yojson tree path)
      | _, "UnexpectedLambdaException" ->
          `UnexpectedLambdaException
            (Json_deserializers.unexpected_lambda_exception_of_yojson tree path)
      | _, "UserLambdaValidationException" ->
          `UserLambdaValidationException
            (Json_deserializers.user_lambda_validation_exception_of_yojson tree path)
      | _, "UserNotFoundException" ->
          `UserNotFoundException (Json_deserializers.user_not_found_exception_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : admin_confirm_sign_up_request) =
    let input = Json_serializers.admin_confirm_sign_up_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request
      ~shape_name:"AWSCognitoIdentityProviderService.AdminConfirmSignUp" ~service ~context ~input
      ~output_deserializer:Json_deserializers.admin_confirm_sign_up_response_of_yojson
      ~error_deserializer

  let request_with_metadata context (request : admin_confirm_sign_up_request) =
    let input = Json_serializers.admin_confirm_sign_up_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata
      ~shape_name:"AWSCognitoIdentityProviderService.AdminConfirmSignUp" ~service ~context ~input
      ~output_deserializer:Json_deserializers.admin_confirm_sign_up_response_of_yojson
      ~error_deserializer
end

module AdminCreateUser = struct
  let error_to_string = function
    | `CodeDeliveryFailureException _ ->
        "com.amazonaws.cognitoidentityprovider#CodeDeliveryFailureException"
    | `InternalErrorException _ -> "com.amazonaws.cognitoidentityprovider#InternalErrorException"
    | `InvalidLambdaResponseException _ ->
        "com.amazonaws.cognitoidentityprovider#InvalidLambdaResponseException"
    | `InvalidParameterException _ ->
        "com.amazonaws.cognitoidentityprovider#InvalidParameterException"
    | `InvalidPasswordException _ ->
        "com.amazonaws.cognitoidentityprovider#InvalidPasswordException"
    | `InvalidSmsRoleAccessPolicyException _ ->
        "com.amazonaws.cognitoidentityprovider#InvalidSmsRoleAccessPolicyException"
    | `InvalidSmsRoleTrustRelationshipException _ ->
        "com.amazonaws.cognitoidentityprovider#InvalidSmsRoleTrustRelationshipException"
    | `NotAuthorizedException _ -> "com.amazonaws.cognitoidentityprovider#NotAuthorizedException"
    | `OperationNotEnabledException _ ->
        "com.amazonaws.cognitoidentityprovider#OperationNotEnabledException"
    | `PreconditionNotMetException _ ->
        "com.amazonaws.cognitoidentityprovider#PreconditionNotMetException"
    | `ResourceNotFoundException _ ->
        "com.amazonaws.cognitoidentityprovider#ResourceNotFoundException"
    | `TooManyRequestsException _ ->
        "com.amazonaws.cognitoidentityprovider#TooManyRequestsException"
    | `UnexpectedLambdaException _ ->
        "com.amazonaws.cognitoidentityprovider#UnexpectedLambdaException"
    | `UnsupportedUserStateException _ ->
        "com.amazonaws.cognitoidentityprovider#UnsupportedUserStateException"
    | `UserLambdaValidationException _ ->
        "com.amazonaws.cognitoidentityprovider#UserLambdaValidationException"
    | `UsernameExistsException _ -> "com.amazonaws.cognitoidentityprovider#UsernameExistsException"
    | `UserNotFoundException _ -> "com.amazonaws.cognitoidentityprovider#UserNotFoundException"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "CodeDeliveryFailureException" ->
          `CodeDeliveryFailureException
            (Json_deserializers.code_delivery_failure_exception_of_yojson tree path)
      | _, "InternalErrorException" ->
          `InternalErrorException (Json_deserializers.internal_error_exception_of_yojson tree path)
      | _, "InvalidLambdaResponseException" ->
          `InvalidLambdaResponseException
            (Json_deserializers.invalid_lambda_response_exception_of_yojson tree path)
      | _, "InvalidParameterException" ->
          `InvalidParameterException
            (Json_deserializers.invalid_parameter_exception_of_yojson tree path)
      | _, "InvalidPasswordException" ->
          `InvalidPasswordException
            (Json_deserializers.invalid_password_exception_of_yojson tree path)
      | _, "InvalidSmsRoleAccessPolicyException" ->
          `InvalidSmsRoleAccessPolicyException
            (Json_deserializers.invalid_sms_role_access_policy_exception_of_yojson tree path)
      | _, "InvalidSmsRoleTrustRelationshipException" ->
          `InvalidSmsRoleTrustRelationshipException
            (Json_deserializers.invalid_sms_role_trust_relationship_exception_of_yojson tree path)
      | _, "NotAuthorizedException" ->
          `NotAuthorizedException (Json_deserializers.not_authorized_exception_of_yojson tree path)
      | _, "OperationNotEnabledException" ->
          `OperationNotEnabledException
            (Json_deserializers.operation_not_enabled_exception_of_yojson tree path)
      | _, "PreconditionNotMetException" ->
          `PreconditionNotMetException
            (Json_deserializers.precondition_not_met_exception_of_yojson tree path)
      | _, "ResourceNotFoundException" ->
          `ResourceNotFoundException
            (Json_deserializers.resource_not_found_exception_of_yojson tree path)
      | _, "TooManyRequestsException" ->
          `TooManyRequestsException
            (Json_deserializers.too_many_requests_exception_of_yojson tree path)
      | _, "UnexpectedLambdaException" ->
          `UnexpectedLambdaException
            (Json_deserializers.unexpected_lambda_exception_of_yojson tree path)
      | _, "UnsupportedUserStateException" ->
          `UnsupportedUserStateException
            (Json_deserializers.unsupported_user_state_exception_of_yojson tree path)
      | _, "UserLambdaValidationException" ->
          `UserLambdaValidationException
            (Json_deserializers.user_lambda_validation_exception_of_yojson tree path)
      | _, "UsernameExistsException" ->
          `UsernameExistsException
            (Json_deserializers.username_exists_exception_of_yojson tree path)
      | _, "UserNotFoundException" ->
          `UserNotFoundException (Json_deserializers.user_not_found_exception_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : admin_create_user_request) =
    let input = Json_serializers.admin_create_user_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request
      ~shape_name:"AWSCognitoIdentityProviderService.AdminCreateUser" ~service ~context ~input
      ~output_deserializer:Json_deserializers.admin_create_user_response_of_yojson
      ~error_deserializer

  let request_with_metadata context (request : admin_create_user_request) =
    let input = Json_serializers.admin_create_user_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata
      ~shape_name:"AWSCognitoIdentityProviderService.AdminCreateUser" ~service ~context ~input
      ~output_deserializer:Json_deserializers.admin_create_user_response_of_yojson
      ~error_deserializer
end

module AdminDeleteUser = struct
  let error_to_string = function
    | `InternalErrorException _ -> "com.amazonaws.cognitoidentityprovider#InternalErrorException"
    | `InvalidParameterException _ ->
        "com.amazonaws.cognitoidentityprovider#InvalidParameterException"
    | `NotAuthorizedException _ -> "com.amazonaws.cognitoidentityprovider#NotAuthorizedException"
    | `OperationNotEnabledException _ ->
        "com.amazonaws.cognitoidentityprovider#OperationNotEnabledException"
    | `ResourceNotFoundException _ ->
        "com.amazonaws.cognitoidentityprovider#ResourceNotFoundException"
    | `TooManyRequestsException _ ->
        "com.amazonaws.cognitoidentityprovider#TooManyRequestsException"
    | `UserNotFoundException _ -> "com.amazonaws.cognitoidentityprovider#UserNotFoundException"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "InternalErrorException" ->
          `InternalErrorException (Json_deserializers.internal_error_exception_of_yojson tree path)
      | _, "InvalidParameterException" ->
          `InvalidParameterException
            (Json_deserializers.invalid_parameter_exception_of_yojson tree path)
      | _, "NotAuthorizedException" ->
          `NotAuthorizedException (Json_deserializers.not_authorized_exception_of_yojson tree path)
      | _, "OperationNotEnabledException" ->
          `OperationNotEnabledException
            (Json_deserializers.operation_not_enabled_exception_of_yojson tree path)
      | _, "ResourceNotFoundException" ->
          `ResourceNotFoundException
            (Json_deserializers.resource_not_found_exception_of_yojson tree path)
      | _, "TooManyRequestsException" ->
          `TooManyRequestsException
            (Json_deserializers.too_many_requests_exception_of_yojson tree path)
      | _, "UserNotFoundException" ->
          `UserNotFoundException (Json_deserializers.user_not_found_exception_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : admin_delete_user_request) =
    let input = Json_serializers.admin_delete_user_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request
      ~shape_name:"AWSCognitoIdentityProviderService.AdminDeleteUser" ~service ~context ~input
      ~output_deserializer:Smaws_Lib.Smithy_api.Json_deserializers.unit__of_yojson
      ~error_deserializer

  let request_with_metadata context (request : admin_delete_user_request) =
    let input = Json_serializers.admin_delete_user_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata
      ~shape_name:"AWSCognitoIdentityProviderService.AdminDeleteUser" ~service ~context ~input
      ~output_deserializer:Smaws_Lib.Smithy_api.Json_deserializers.unit__of_yojson
      ~error_deserializer
end

module AdminDeleteUserAttributes = struct
  let error_to_string = function
    | `InternalErrorException _ -> "com.amazonaws.cognitoidentityprovider#InternalErrorException"
    | `InvalidParameterException _ ->
        "com.amazonaws.cognitoidentityprovider#InvalidParameterException"
    | `NotAuthorizedException _ -> "com.amazonaws.cognitoidentityprovider#NotAuthorizedException"
    | `OperationNotEnabledException _ ->
        "com.amazonaws.cognitoidentityprovider#OperationNotEnabledException"
    | `ResourceNotFoundException _ ->
        "com.amazonaws.cognitoidentityprovider#ResourceNotFoundException"
    | `TooManyRequestsException _ ->
        "com.amazonaws.cognitoidentityprovider#TooManyRequestsException"
    | `UserNotFoundException _ -> "com.amazonaws.cognitoidentityprovider#UserNotFoundException"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "InternalErrorException" ->
          `InternalErrorException (Json_deserializers.internal_error_exception_of_yojson tree path)
      | _, "InvalidParameterException" ->
          `InvalidParameterException
            (Json_deserializers.invalid_parameter_exception_of_yojson tree path)
      | _, "NotAuthorizedException" ->
          `NotAuthorizedException (Json_deserializers.not_authorized_exception_of_yojson tree path)
      | _, "OperationNotEnabledException" ->
          `OperationNotEnabledException
            (Json_deserializers.operation_not_enabled_exception_of_yojson tree path)
      | _, "ResourceNotFoundException" ->
          `ResourceNotFoundException
            (Json_deserializers.resource_not_found_exception_of_yojson tree path)
      | _, "TooManyRequestsException" ->
          `TooManyRequestsException
            (Json_deserializers.too_many_requests_exception_of_yojson tree path)
      | _, "UserNotFoundException" ->
          `UserNotFoundException (Json_deserializers.user_not_found_exception_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : admin_delete_user_attributes_request) =
    let input = Json_serializers.admin_delete_user_attributes_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request
      ~shape_name:"AWSCognitoIdentityProviderService.AdminDeleteUserAttributes" ~service ~context
      ~input ~output_deserializer:Json_deserializers.admin_delete_user_attributes_response_of_yojson
      ~error_deserializer

  let request_with_metadata context (request : admin_delete_user_attributes_request) =
    let input = Json_serializers.admin_delete_user_attributes_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata
      ~shape_name:"AWSCognitoIdentityProviderService.AdminDeleteUserAttributes" ~service ~context
      ~input ~output_deserializer:Json_deserializers.admin_delete_user_attributes_response_of_yojson
      ~error_deserializer
end

module AdminDisableProviderForUser = struct
  let error_to_string = function
    | `AliasExistsException _ -> "com.amazonaws.cognitoidentityprovider#AliasExistsException"
    | `InternalErrorException _ -> "com.amazonaws.cognitoidentityprovider#InternalErrorException"
    | `InvalidParameterException _ ->
        "com.amazonaws.cognitoidentityprovider#InvalidParameterException"
    | `NotAuthorizedException _ -> "com.amazonaws.cognitoidentityprovider#NotAuthorizedException"
    | `OperationNotEnabledException _ ->
        "com.amazonaws.cognitoidentityprovider#OperationNotEnabledException"
    | `ResourceNotFoundException _ ->
        "com.amazonaws.cognitoidentityprovider#ResourceNotFoundException"
    | `TooManyRequestsException _ ->
        "com.amazonaws.cognitoidentityprovider#TooManyRequestsException"
    | `UserNotFoundException _ -> "com.amazonaws.cognitoidentityprovider#UserNotFoundException"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "AliasExistsException" ->
          `AliasExistsException (Json_deserializers.alias_exists_exception_of_yojson tree path)
      | _, "InternalErrorException" ->
          `InternalErrorException (Json_deserializers.internal_error_exception_of_yojson tree path)
      | _, "InvalidParameterException" ->
          `InvalidParameterException
            (Json_deserializers.invalid_parameter_exception_of_yojson tree path)
      | _, "NotAuthorizedException" ->
          `NotAuthorizedException (Json_deserializers.not_authorized_exception_of_yojson tree path)
      | _, "OperationNotEnabledException" ->
          `OperationNotEnabledException
            (Json_deserializers.operation_not_enabled_exception_of_yojson tree path)
      | _, "ResourceNotFoundException" ->
          `ResourceNotFoundException
            (Json_deserializers.resource_not_found_exception_of_yojson tree path)
      | _, "TooManyRequestsException" ->
          `TooManyRequestsException
            (Json_deserializers.too_many_requests_exception_of_yojson tree path)
      | _, "UserNotFoundException" ->
          `UserNotFoundException (Json_deserializers.user_not_found_exception_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : admin_disable_provider_for_user_request) =
    let input = Json_serializers.admin_disable_provider_for_user_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request
      ~shape_name:"AWSCognitoIdentityProviderService.AdminDisableProviderForUser" ~service ~context
      ~input
      ~output_deserializer:Json_deserializers.admin_disable_provider_for_user_response_of_yojson
      ~error_deserializer

  let request_with_metadata context (request : admin_disable_provider_for_user_request) =
    let input = Json_serializers.admin_disable_provider_for_user_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata
      ~shape_name:"AWSCognitoIdentityProviderService.AdminDisableProviderForUser" ~service ~context
      ~input
      ~output_deserializer:Json_deserializers.admin_disable_provider_for_user_response_of_yojson
      ~error_deserializer
end

module AdminDisableUser = struct
  let error_to_string = function
    | `InternalErrorException _ -> "com.amazonaws.cognitoidentityprovider#InternalErrorException"
    | `InvalidParameterException _ ->
        "com.amazonaws.cognitoidentityprovider#InvalidParameterException"
    | `NotAuthorizedException _ -> "com.amazonaws.cognitoidentityprovider#NotAuthorizedException"
    | `OperationNotEnabledException _ ->
        "com.amazonaws.cognitoidentityprovider#OperationNotEnabledException"
    | `ResourceNotFoundException _ ->
        "com.amazonaws.cognitoidentityprovider#ResourceNotFoundException"
    | `TooManyRequestsException _ ->
        "com.amazonaws.cognitoidentityprovider#TooManyRequestsException"
    | `UserNotFoundException _ -> "com.amazonaws.cognitoidentityprovider#UserNotFoundException"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "InternalErrorException" ->
          `InternalErrorException (Json_deserializers.internal_error_exception_of_yojson tree path)
      | _, "InvalidParameterException" ->
          `InvalidParameterException
            (Json_deserializers.invalid_parameter_exception_of_yojson tree path)
      | _, "NotAuthorizedException" ->
          `NotAuthorizedException (Json_deserializers.not_authorized_exception_of_yojson tree path)
      | _, "OperationNotEnabledException" ->
          `OperationNotEnabledException
            (Json_deserializers.operation_not_enabled_exception_of_yojson tree path)
      | _, "ResourceNotFoundException" ->
          `ResourceNotFoundException
            (Json_deserializers.resource_not_found_exception_of_yojson tree path)
      | _, "TooManyRequestsException" ->
          `TooManyRequestsException
            (Json_deserializers.too_many_requests_exception_of_yojson tree path)
      | _, "UserNotFoundException" ->
          `UserNotFoundException (Json_deserializers.user_not_found_exception_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : admin_disable_user_request) =
    let input = Json_serializers.admin_disable_user_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request
      ~shape_name:"AWSCognitoIdentityProviderService.AdminDisableUser" ~service ~context ~input
      ~output_deserializer:Json_deserializers.admin_disable_user_response_of_yojson
      ~error_deserializer

  let request_with_metadata context (request : admin_disable_user_request) =
    let input = Json_serializers.admin_disable_user_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata
      ~shape_name:"AWSCognitoIdentityProviderService.AdminDisableUser" ~service ~context ~input
      ~output_deserializer:Json_deserializers.admin_disable_user_response_of_yojson
      ~error_deserializer
end

module AdminEnableUser = struct
  let error_to_string = function
    | `InternalErrorException _ -> "com.amazonaws.cognitoidentityprovider#InternalErrorException"
    | `InvalidParameterException _ ->
        "com.amazonaws.cognitoidentityprovider#InvalidParameterException"
    | `NotAuthorizedException _ -> "com.amazonaws.cognitoidentityprovider#NotAuthorizedException"
    | `OperationNotEnabledException _ ->
        "com.amazonaws.cognitoidentityprovider#OperationNotEnabledException"
    | `ResourceNotFoundException _ ->
        "com.amazonaws.cognitoidentityprovider#ResourceNotFoundException"
    | `TooManyRequestsException _ ->
        "com.amazonaws.cognitoidentityprovider#TooManyRequestsException"
    | `UserNotFoundException _ -> "com.amazonaws.cognitoidentityprovider#UserNotFoundException"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "InternalErrorException" ->
          `InternalErrorException (Json_deserializers.internal_error_exception_of_yojson tree path)
      | _, "InvalidParameterException" ->
          `InvalidParameterException
            (Json_deserializers.invalid_parameter_exception_of_yojson tree path)
      | _, "NotAuthorizedException" ->
          `NotAuthorizedException (Json_deserializers.not_authorized_exception_of_yojson tree path)
      | _, "OperationNotEnabledException" ->
          `OperationNotEnabledException
            (Json_deserializers.operation_not_enabled_exception_of_yojson tree path)
      | _, "ResourceNotFoundException" ->
          `ResourceNotFoundException
            (Json_deserializers.resource_not_found_exception_of_yojson tree path)
      | _, "TooManyRequestsException" ->
          `TooManyRequestsException
            (Json_deserializers.too_many_requests_exception_of_yojson tree path)
      | _, "UserNotFoundException" ->
          `UserNotFoundException (Json_deserializers.user_not_found_exception_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : admin_enable_user_request) =
    let input = Json_serializers.admin_enable_user_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request
      ~shape_name:"AWSCognitoIdentityProviderService.AdminEnableUser" ~service ~context ~input
      ~output_deserializer:Json_deserializers.admin_enable_user_response_of_yojson
      ~error_deserializer

  let request_with_metadata context (request : admin_enable_user_request) =
    let input = Json_serializers.admin_enable_user_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata
      ~shape_name:"AWSCognitoIdentityProviderService.AdminEnableUser" ~service ~context ~input
      ~output_deserializer:Json_deserializers.admin_enable_user_response_of_yojson
      ~error_deserializer
end

module AdminForgetDevice = struct
  let error_to_string = function
    | `InternalErrorException _ -> "com.amazonaws.cognitoidentityprovider#InternalErrorException"
    | `InvalidParameterException _ ->
        "com.amazonaws.cognitoidentityprovider#InvalidParameterException"
    | `InvalidUserPoolConfigurationException _ ->
        "com.amazonaws.cognitoidentityprovider#InvalidUserPoolConfigurationException"
    | `NotAuthorizedException _ -> "com.amazonaws.cognitoidentityprovider#NotAuthorizedException"
    | `OperationNotEnabledException _ ->
        "com.amazonaws.cognitoidentityprovider#OperationNotEnabledException"
    | `ResourceNotFoundException _ ->
        "com.amazonaws.cognitoidentityprovider#ResourceNotFoundException"
    | `TooManyRequestsException _ ->
        "com.amazonaws.cognitoidentityprovider#TooManyRequestsException"
    | `UserNotFoundException _ -> "com.amazonaws.cognitoidentityprovider#UserNotFoundException"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "InternalErrorException" ->
          `InternalErrorException (Json_deserializers.internal_error_exception_of_yojson tree path)
      | _, "InvalidParameterException" ->
          `InvalidParameterException
            (Json_deserializers.invalid_parameter_exception_of_yojson tree path)
      | _, "InvalidUserPoolConfigurationException" ->
          `InvalidUserPoolConfigurationException
            (Json_deserializers.invalid_user_pool_configuration_exception_of_yojson tree path)
      | _, "NotAuthorizedException" ->
          `NotAuthorizedException (Json_deserializers.not_authorized_exception_of_yojson tree path)
      | _, "OperationNotEnabledException" ->
          `OperationNotEnabledException
            (Json_deserializers.operation_not_enabled_exception_of_yojson tree path)
      | _, "ResourceNotFoundException" ->
          `ResourceNotFoundException
            (Json_deserializers.resource_not_found_exception_of_yojson tree path)
      | _, "TooManyRequestsException" ->
          `TooManyRequestsException
            (Json_deserializers.too_many_requests_exception_of_yojson tree path)
      | _, "UserNotFoundException" ->
          `UserNotFoundException (Json_deserializers.user_not_found_exception_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : admin_forget_device_request) =
    let input = Json_serializers.admin_forget_device_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request
      ~shape_name:"AWSCognitoIdentityProviderService.AdminForgetDevice" ~service ~context ~input
      ~output_deserializer:Smaws_Lib.Smithy_api.Json_deserializers.unit__of_yojson
      ~error_deserializer

  let request_with_metadata context (request : admin_forget_device_request) =
    let input = Json_serializers.admin_forget_device_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata
      ~shape_name:"AWSCognitoIdentityProviderService.AdminForgetDevice" ~service ~context ~input
      ~output_deserializer:Smaws_Lib.Smithy_api.Json_deserializers.unit__of_yojson
      ~error_deserializer
end

module AdminGetDevice = struct
  let error_to_string = function
    | `InternalErrorException _ -> "com.amazonaws.cognitoidentityprovider#InternalErrorException"
    | `InvalidParameterException _ ->
        "com.amazonaws.cognitoidentityprovider#InvalidParameterException"
    | `InvalidUserPoolConfigurationException _ ->
        "com.amazonaws.cognitoidentityprovider#InvalidUserPoolConfigurationException"
    | `NotAuthorizedException _ -> "com.amazonaws.cognitoidentityprovider#NotAuthorizedException"
    | `OperationNotEnabledException _ ->
        "com.amazonaws.cognitoidentityprovider#OperationNotEnabledException"
    | `ResourceNotFoundException _ ->
        "com.amazonaws.cognitoidentityprovider#ResourceNotFoundException"
    | `TooManyRequestsException _ ->
        "com.amazonaws.cognitoidentityprovider#TooManyRequestsException"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "InternalErrorException" ->
          `InternalErrorException (Json_deserializers.internal_error_exception_of_yojson tree path)
      | _, "InvalidParameterException" ->
          `InvalidParameterException
            (Json_deserializers.invalid_parameter_exception_of_yojson tree path)
      | _, "InvalidUserPoolConfigurationException" ->
          `InvalidUserPoolConfigurationException
            (Json_deserializers.invalid_user_pool_configuration_exception_of_yojson tree path)
      | _, "NotAuthorizedException" ->
          `NotAuthorizedException (Json_deserializers.not_authorized_exception_of_yojson tree path)
      | _, "OperationNotEnabledException" ->
          `OperationNotEnabledException
            (Json_deserializers.operation_not_enabled_exception_of_yojson tree path)
      | _, "ResourceNotFoundException" ->
          `ResourceNotFoundException
            (Json_deserializers.resource_not_found_exception_of_yojson tree path)
      | _, "TooManyRequestsException" ->
          `TooManyRequestsException
            (Json_deserializers.too_many_requests_exception_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : admin_get_device_request) =
    let input = Json_serializers.admin_get_device_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request
      ~shape_name:"AWSCognitoIdentityProviderService.AdminGetDevice" ~service ~context ~input
      ~output_deserializer:Json_deserializers.admin_get_device_response_of_yojson
      ~error_deserializer

  let request_with_metadata context (request : admin_get_device_request) =
    let input = Json_serializers.admin_get_device_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata
      ~shape_name:"AWSCognitoIdentityProviderService.AdminGetDevice" ~service ~context ~input
      ~output_deserializer:Json_deserializers.admin_get_device_response_of_yojson
      ~error_deserializer
end

module AdminGetUser = struct
  let error_to_string = function
    | `InternalErrorException _ -> "com.amazonaws.cognitoidentityprovider#InternalErrorException"
    | `InvalidParameterException _ ->
        "com.amazonaws.cognitoidentityprovider#InvalidParameterException"
    | `NotAuthorizedException _ -> "com.amazonaws.cognitoidentityprovider#NotAuthorizedException"
    | `OperationNotEnabledException _ ->
        "com.amazonaws.cognitoidentityprovider#OperationNotEnabledException"
    | `ResourceNotFoundException _ ->
        "com.amazonaws.cognitoidentityprovider#ResourceNotFoundException"
    | `TooManyRequestsException _ ->
        "com.amazonaws.cognitoidentityprovider#TooManyRequestsException"
    | `UserNotFoundException _ -> "com.amazonaws.cognitoidentityprovider#UserNotFoundException"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "InternalErrorException" ->
          `InternalErrorException (Json_deserializers.internal_error_exception_of_yojson tree path)
      | _, "InvalidParameterException" ->
          `InvalidParameterException
            (Json_deserializers.invalid_parameter_exception_of_yojson tree path)
      | _, "NotAuthorizedException" ->
          `NotAuthorizedException (Json_deserializers.not_authorized_exception_of_yojson tree path)
      | _, "OperationNotEnabledException" ->
          `OperationNotEnabledException
            (Json_deserializers.operation_not_enabled_exception_of_yojson tree path)
      | _, "ResourceNotFoundException" ->
          `ResourceNotFoundException
            (Json_deserializers.resource_not_found_exception_of_yojson tree path)
      | _, "TooManyRequestsException" ->
          `TooManyRequestsException
            (Json_deserializers.too_many_requests_exception_of_yojson tree path)
      | _, "UserNotFoundException" ->
          `UserNotFoundException (Json_deserializers.user_not_found_exception_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : admin_get_user_request) =
    let input = Json_serializers.admin_get_user_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"AWSCognitoIdentityProviderService.AdminGetUser"
      ~service ~context ~input
      ~output_deserializer:Json_deserializers.admin_get_user_response_of_yojson ~error_deserializer

  let request_with_metadata context (request : admin_get_user_request) =
    let input = Json_serializers.admin_get_user_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata
      ~shape_name:"AWSCognitoIdentityProviderService.AdminGetUser" ~service ~context ~input
      ~output_deserializer:Json_deserializers.admin_get_user_response_of_yojson ~error_deserializer
end

module AdminInitiateAuth = struct
  let error_to_string = function
    | `InternalErrorException _ -> "com.amazonaws.cognitoidentityprovider#InternalErrorException"
    | `InvalidEmailRoleAccessPolicyException _ ->
        "com.amazonaws.cognitoidentityprovider#InvalidEmailRoleAccessPolicyException"
    | `InvalidLambdaResponseException _ ->
        "com.amazonaws.cognitoidentityprovider#InvalidLambdaResponseException"
    | `InvalidParameterException _ ->
        "com.amazonaws.cognitoidentityprovider#InvalidParameterException"
    | `InvalidSmsRoleAccessPolicyException _ ->
        "com.amazonaws.cognitoidentityprovider#InvalidSmsRoleAccessPolicyException"
    | `InvalidSmsRoleTrustRelationshipException _ ->
        "com.amazonaws.cognitoidentityprovider#InvalidSmsRoleTrustRelationshipException"
    | `InvalidUserPoolConfigurationException _ ->
        "com.amazonaws.cognitoidentityprovider#InvalidUserPoolConfigurationException"
    | `MFAMethodNotFoundException _ ->
        "com.amazonaws.cognitoidentityprovider#MFAMethodNotFoundException"
    | `NotAuthorizedException _ -> "com.amazonaws.cognitoidentityprovider#NotAuthorizedException"
    | `OperationNotEnabledException _ ->
        "com.amazonaws.cognitoidentityprovider#OperationNotEnabledException"
    | `PasswordResetRequiredException _ ->
        "com.amazonaws.cognitoidentityprovider#PasswordResetRequiredException"
    | `ResourceNotFoundException _ ->
        "com.amazonaws.cognitoidentityprovider#ResourceNotFoundException"
    | `TooManyRequestsException _ ->
        "com.amazonaws.cognitoidentityprovider#TooManyRequestsException"
    | `UnexpectedLambdaException _ ->
        "com.amazonaws.cognitoidentityprovider#UnexpectedLambdaException"
    | `UnsupportedOperationException _ ->
        "com.amazonaws.cognitoidentityprovider#UnsupportedOperationException"
    | `UserLambdaValidationException _ ->
        "com.amazonaws.cognitoidentityprovider#UserLambdaValidationException"
    | `UserNotConfirmedException _ ->
        "com.amazonaws.cognitoidentityprovider#UserNotConfirmedException"
    | `UserNotFoundException _ -> "com.amazonaws.cognitoidentityprovider#UserNotFoundException"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "InternalErrorException" ->
          `InternalErrorException (Json_deserializers.internal_error_exception_of_yojson tree path)
      | _, "InvalidEmailRoleAccessPolicyException" ->
          `InvalidEmailRoleAccessPolicyException
            (Json_deserializers.invalid_email_role_access_policy_exception_of_yojson tree path)
      | _, "InvalidLambdaResponseException" ->
          `InvalidLambdaResponseException
            (Json_deserializers.invalid_lambda_response_exception_of_yojson tree path)
      | _, "InvalidParameterException" ->
          `InvalidParameterException
            (Json_deserializers.invalid_parameter_exception_of_yojson tree path)
      | _, "InvalidSmsRoleAccessPolicyException" ->
          `InvalidSmsRoleAccessPolicyException
            (Json_deserializers.invalid_sms_role_access_policy_exception_of_yojson tree path)
      | _, "InvalidSmsRoleTrustRelationshipException" ->
          `InvalidSmsRoleTrustRelationshipException
            (Json_deserializers.invalid_sms_role_trust_relationship_exception_of_yojson tree path)
      | _, "InvalidUserPoolConfigurationException" ->
          `InvalidUserPoolConfigurationException
            (Json_deserializers.invalid_user_pool_configuration_exception_of_yojson tree path)
      | _, "MFAMethodNotFoundException" ->
          `MFAMethodNotFoundException
            (Json_deserializers.mfa_method_not_found_exception_of_yojson tree path)
      | _, "NotAuthorizedException" ->
          `NotAuthorizedException (Json_deserializers.not_authorized_exception_of_yojson tree path)
      | _, "OperationNotEnabledException" ->
          `OperationNotEnabledException
            (Json_deserializers.operation_not_enabled_exception_of_yojson tree path)
      | _, "PasswordResetRequiredException" ->
          `PasswordResetRequiredException
            (Json_deserializers.password_reset_required_exception_of_yojson tree path)
      | _, "ResourceNotFoundException" ->
          `ResourceNotFoundException
            (Json_deserializers.resource_not_found_exception_of_yojson tree path)
      | _, "TooManyRequestsException" ->
          `TooManyRequestsException
            (Json_deserializers.too_many_requests_exception_of_yojson tree path)
      | _, "UnexpectedLambdaException" ->
          `UnexpectedLambdaException
            (Json_deserializers.unexpected_lambda_exception_of_yojson tree path)
      | _, "UnsupportedOperationException" ->
          `UnsupportedOperationException
            (Json_deserializers.unsupported_operation_exception_of_yojson tree path)
      | _, "UserLambdaValidationException" ->
          `UserLambdaValidationException
            (Json_deserializers.user_lambda_validation_exception_of_yojson tree path)
      | _, "UserNotConfirmedException" ->
          `UserNotConfirmedException
            (Json_deserializers.user_not_confirmed_exception_of_yojson tree path)
      | _, "UserNotFoundException" ->
          `UserNotFoundException (Json_deserializers.user_not_found_exception_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : admin_initiate_auth_request) =
    let input = Json_serializers.admin_initiate_auth_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request
      ~shape_name:"AWSCognitoIdentityProviderService.AdminInitiateAuth" ~service ~context ~input
      ~output_deserializer:Json_deserializers.admin_initiate_auth_response_of_yojson
      ~error_deserializer

  let request_with_metadata context (request : admin_initiate_auth_request) =
    let input = Json_serializers.admin_initiate_auth_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata
      ~shape_name:"AWSCognitoIdentityProviderService.AdminInitiateAuth" ~service ~context ~input
      ~output_deserializer:Json_deserializers.admin_initiate_auth_response_of_yojson
      ~error_deserializer
end

module AdminLinkProviderForUser = struct
  let error_to_string = function
    | `AliasExistsException _ -> "com.amazonaws.cognitoidentityprovider#AliasExistsException"
    | `InternalErrorException _ -> "com.amazonaws.cognitoidentityprovider#InternalErrorException"
    | `InvalidParameterException _ ->
        "com.amazonaws.cognitoidentityprovider#InvalidParameterException"
    | `LimitExceededException _ -> "com.amazonaws.cognitoidentityprovider#LimitExceededException"
    | `NotAuthorizedException _ -> "com.amazonaws.cognitoidentityprovider#NotAuthorizedException"
    | `OperationNotEnabledException _ ->
        "com.amazonaws.cognitoidentityprovider#OperationNotEnabledException"
    | `ResourceNotFoundException _ ->
        "com.amazonaws.cognitoidentityprovider#ResourceNotFoundException"
    | `TooManyRequestsException _ ->
        "com.amazonaws.cognitoidentityprovider#TooManyRequestsException"
    | `UserNotFoundException _ -> "com.amazonaws.cognitoidentityprovider#UserNotFoundException"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "AliasExistsException" ->
          `AliasExistsException (Json_deserializers.alias_exists_exception_of_yojson tree path)
      | _, "InternalErrorException" ->
          `InternalErrorException (Json_deserializers.internal_error_exception_of_yojson tree path)
      | _, "InvalidParameterException" ->
          `InvalidParameterException
            (Json_deserializers.invalid_parameter_exception_of_yojson tree path)
      | _, "LimitExceededException" ->
          `LimitExceededException (Json_deserializers.limit_exceeded_exception_of_yojson tree path)
      | _, "NotAuthorizedException" ->
          `NotAuthorizedException (Json_deserializers.not_authorized_exception_of_yojson tree path)
      | _, "OperationNotEnabledException" ->
          `OperationNotEnabledException
            (Json_deserializers.operation_not_enabled_exception_of_yojson tree path)
      | _, "ResourceNotFoundException" ->
          `ResourceNotFoundException
            (Json_deserializers.resource_not_found_exception_of_yojson tree path)
      | _, "TooManyRequestsException" ->
          `TooManyRequestsException
            (Json_deserializers.too_many_requests_exception_of_yojson tree path)
      | _, "UserNotFoundException" ->
          `UserNotFoundException (Json_deserializers.user_not_found_exception_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : admin_link_provider_for_user_request) =
    let input = Json_serializers.admin_link_provider_for_user_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request
      ~shape_name:"AWSCognitoIdentityProviderService.AdminLinkProviderForUser" ~service ~context
      ~input ~output_deserializer:Json_deserializers.admin_link_provider_for_user_response_of_yojson
      ~error_deserializer

  let request_with_metadata context (request : admin_link_provider_for_user_request) =
    let input = Json_serializers.admin_link_provider_for_user_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata
      ~shape_name:"AWSCognitoIdentityProviderService.AdminLinkProviderForUser" ~service ~context
      ~input ~output_deserializer:Json_deserializers.admin_link_provider_for_user_response_of_yojson
      ~error_deserializer
end

module AdminListDevices = struct
  let error_to_string = function
    | `InternalErrorException _ -> "com.amazonaws.cognitoidentityprovider#InternalErrorException"
    | `InvalidParameterException _ ->
        "com.amazonaws.cognitoidentityprovider#InvalidParameterException"
    | `InvalidUserPoolConfigurationException _ ->
        "com.amazonaws.cognitoidentityprovider#InvalidUserPoolConfigurationException"
    | `NotAuthorizedException _ -> "com.amazonaws.cognitoidentityprovider#NotAuthorizedException"
    | `OperationNotEnabledException _ ->
        "com.amazonaws.cognitoidentityprovider#OperationNotEnabledException"
    | `ResourceNotFoundException _ ->
        "com.amazonaws.cognitoidentityprovider#ResourceNotFoundException"
    | `TooManyRequestsException _ ->
        "com.amazonaws.cognitoidentityprovider#TooManyRequestsException"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "InternalErrorException" ->
          `InternalErrorException (Json_deserializers.internal_error_exception_of_yojson tree path)
      | _, "InvalidParameterException" ->
          `InvalidParameterException
            (Json_deserializers.invalid_parameter_exception_of_yojson tree path)
      | _, "InvalidUserPoolConfigurationException" ->
          `InvalidUserPoolConfigurationException
            (Json_deserializers.invalid_user_pool_configuration_exception_of_yojson tree path)
      | _, "NotAuthorizedException" ->
          `NotAuthorizedException (Json_deserializers.not_authorized_exception_of_yojson tree path)
      | _, "OperationNotEnabledException" ->
          `OperationNotEnabledException
            (Json_deserializers.operation_not_enabled_exception_of_yojson tree path)
      | _, "ResourceNotFoundException" ->
          `ResourceNotFoundException
            (Json_deserializers.resource_not_found_exception_of_yojson tree path)
      | _, "TooManyRequestsException" ->
          `TooManyRequestsException
            (Json_deserializers.too_many_requests_exception_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : admin_list_devices_request) =
    let input = Json_serializers.admin_list_devices_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request
      ~shape_name:"AWSCognitoIdentityProviderService.AdminListDevices" ~service ~context ~input
      ~output_deserializer:Json_deserializers.admin_list_devices_response_of_yojson
      ~error_deserializer

  let request_with_metadata context (request : admin_list_devices_request) =
    let input = Json_serializers.admin_list_devices_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata
      ~shape_name:"AWSCognitoIdentityProviderService.AdminListDevices" ~service ~context ~input
      ~output_deserializer:Json_deserializers.admin_list_devices_response_of_yojson
      ~error_deserializer
end

module AdminListGroupsForUser = struct
  let error_to_string = function
    | `InternalErrorException _ -> "com.amazonaws.cognitoidentityprovider#InternalErrorException"
    | `InvalidParameterException _ ->
        "com.amazonaws.cognitoidentityprovider#InvalidParameterException"
    | `NotAuthorizedException _ -> "com.amazonaws.cognitoidentityprovider#NotAuthorizedException"
    | `OperationNotEnabledException _ ->
        "com.amazonaws.cognitoidentityprovider#OperationNotEnabledException"
    | `ResourceNotFoundException _ ->
        "com.amazonaws.cognitoidentityprovider#ResourceNotFoundException"
    | `TooManyRequestsException _ ->
        "com.amazonaws.cognitoidentityprovider#TooManyRequestsException"
    | `UserNotFoundException _ -> "com.amazonaws.cognitoidentityprovider#UserNotFoundException"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "InternalErrorException" ->
          `InternalErrorException (Json_deserializers.internal_error_exception_of_yojson tree path)
      | _, "InvalidParameterException" ->
          `InvalidParameterException
            (Json_deserializers.invalid_parameter_exception_of_yojson tree path)
      | _, "NotAuthorizedException" ->
          `NotAuthorizedException (Json_deserializers.not_authorized_exception_of_yojson tree path)
      | _, "OperationNotEnabledException" ->
          `OperationNotEnabledException
            (Json_deserializers.operation_not_enabled_exception_of_yojson tree path)
      | _, "ResourceNotFoundException" ->
          `ResourceNotFoundException
            (Json_deserializers.resource_not_found_exception_of_yojson tree path)
      | _, "TooManyRequestsException" ->
          `TooManyRequestsException
            (Json_deserializers.too_many_requests_exception_of_yojson tree path)
      | _, "UserNotFoundException" ->
          `UserNotFoundException (Json_deserializers.user_not_found_exception_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : admin_list_groups_for_user_request) =
    let input = Json_serializers.admin_list_groups_for_user_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request
      ~shape_name:"AWSCognitoIdentityProviderService.AdminListGroupsForUser" ~service ~context
      ~input ~output_deserializer:Json_deserializers.admin_list_groups_for_user_response_of_yojson
      ~error_deserializer

  let request_with_metadata context (request : admin_list_groups_for_user_request) =
    let input = Json_serializers.admin_list_groups_for_user_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata
      ~shape_name:"AWSCognitoIdentityProviderService.AdminListGroupsForUser" ~service ~context
      ~input ~output_deserializer:Json_deserializers.admin_list_groups_for_user_response_of_yojson
      ~error_deserializer
end

module AdminListUserAuthEvents = struct
  let error_to_string = function
    | `InternalErrorException _ -> "com.amazonaws.cognitoidentityprovider#InternalErrorException"
    | `InvalidParameterException _ ->
        "com.amazonaws.cognitoidentityprovider#InvalidParameterException"
    | `NotAuthorizedException _ -> "com.amazonaws.cognitoidentityprovider#NotAuthorizedException"
    | `OperationNotEnabledException _ ->
        "com.amazonaws.cognitoidentityprovider#OperationNotEnabledException"
    | `ResourceNotFoundException _ ->
        "com.amazonaws.cognitoidentityprovider#ResourceNotFoundException"
    | `TooManyRequestsException _ ->
        "com.amazonaws.cognitoidentityprovider#TooManyRequestsException"
    | `UserNotFoundException _ -> "com.amazonaws.cognitoidentityprovider#UserNotFoundException"
    | `UserPoolAddOnNotEnabledException _ ->
        "com.amazonaws.cognitoidentityprovider#UserPoolAddOnNotEnabledException"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "InternalErrorException" ->
          `InternalErrorException (Json_deserializers.internal_error_exception_of_yojson tree path)
      | _, "InvalidParameterException" ->
          `InvalidParameterException
            (Json_deserializers.invalid_parameter_exception_of_yojson tree path)
      | _, "NotAuthorizedException" ->
          `NotAuthorizedException (Json_deserializers.not_authorized_exception_of_yojson tree path)
      | _, "OperationNotEnabledException" ->
          `OperationNotEnabledException
            (Json_deserializers.operation_not_enabled_exception_of_yojson tree path)
      | _, "ResourceNotFoundException" ->
          `ResourceNotFoundException
            (Json_deserializers.resource_not_found_exception_of_yojson tree path)
      | _, "TooManyRequestsException" ->
          `TooManyRequestsException
            (Json_deserializers.too_many_requests_exception_of_yojson tree path)
      | _, "UserNotFoundException" ->
          `UserNotFoundException (Json_deserializers.user_not_found_exception_of_yojson tree path)
      | _, "UserPoolAddOnNotEnabledException" ->
          `UserPoolAddOnNotEnabledException
            (Json_deserializers.user_pool_add_on_not_enabled_exception_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : admin_list_user_auth_events_request) =
    let input = Json_serializers.admin_list_user_auth_events_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request
      ~shape_name:"AWSCognitoIdentityProviderService.AdminListUserAuthEvents" ~service ~context
      ~input ~output_deserializer:Json_deserializers.admin_list_user_auth_events_response_of_yojson
      ~error_deserializer

  let request_with_metadata context (request : admin_list_user_auth_events_request) =
    let input = Json_serializers.admin_list_user_auth_events_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata
      ~shape_name:"AWSCognitoIdentityProviderService.AdminListUserAuthEvents" ~service ~context
      ~input ~output_deserializer:Json_deserializers.admin_list_user_auth_events_response_of_yojson
      ~error_deserializer
end

module AdminRemoveUserFromGroup = struct
  let error_to_string = function
    | `InternalErrorException _ -> "com.amazonaws.cognitoidentityprovider#InternalErrorException"
    | `InvalidParameterException _ ->
        "com.amazonaws.cognitoidentityprovider#InvalidParameterException"
    | `NotAuthorizedException _ -> "com.amazonaws.cognitoidentityprovider#NotAuthorizedException"
    | `OperationNotEnabledException _ ->
        "com.amazonaws.cognitoidentityprovider#OperationNotEnabledException"
    | `ResourceNotFoundException _ ->
        "com.amazonaws.cognitoidentityprovider#ResourceNotFoundException"
    | `TooManyRequestsException _ ->
        "com.amazonaws.cognitoidentityprovider#TooManyRequestsException"
    | `UserNotFoundException _ -> "com.amazonaws.cognitoidentityprovider#UserNotFoundException"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "InternalErrorException" ->
          `InternalErrorException (Json_deserializers.internal_error_exception_of_yojson tree path)
      | _, "InvalidParameterException" ->
          `InvalidParameterException
            (Json_deserializers.invalid_parameter_exception_of_yojson tree path)
      | _, "NotAuthorizedException" ->
          `NotAuthorizedException (Json_deserializers.not_authorized_exception_of_yojson tree path)
      | _, "OperationNotEnabledException" ->
          `OperationNotEnabledException
            (Json_deserializers.operation_not_enabled_exception_of_yojson tree path)
      | _, "ResourceNotFoundException" ->
          `ResourceNotFoundException
            (Json_deserializers.resource_not_found_exception_of_yojson tree path)
      | _, "TooManyRequestsException" ->
          `TooManyRequestsException
            (Json_deserializers.too_many_requests_exception_of_yojson tree path)
      | _, "UserNotFoundException" ->
          `UserNotFoundException (Json_deserializers.user_not_found_exception_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : admin_remove_user_from_group_request) =
    let input = Json_serializers.admin_remove_user_from_group_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request
      ~shape_name:"AWSCognitoIdentityProviderService.AdminRemoveUserFromGroup" ~service ~context
      ~input ~output_deserializer:Smaws_Lib.Smithy_api.Json_deserializers.unit__of_yojson
      ~error_deserializer

  let request_with_metadata context (request : admin_remove_user_from_group_request) =
    let input = Json_serializers.admin_remove_user_from_group_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata
      ~shape_name:"AWSCognitoIdentityProviderService.AdminRemoveUserFromGroup" ~service ~context
      ~input ~output_deserializer:Smaws_Lib.Smithy_api.Json_deserializers.unit__of_yojson
      ~error_deserializer
end

module AdminResetUserPassword = struct
  let error_to_string = function
    | `InternalErrorException _ -> "com.amazonaws.cognitoidentityprovider#InternalErrorException"
    | `InvalidEmailRoleAccessPolicyException _ ->
        "com.amazonaws.cognitoidentityprovider#InvalidEmailRoleAccessPolicyException"
    | `InvalidLambdaResponseException _ ->
        "com.amazonaws.cognitoidentityprovider#InvalidLambdaResponseException"
    | `InvalidParameterException _ ->
        "com.amazonaws.cognitoidentityprovider#InvalidParameterException"
    | `InvalidSmsRoleAccessPolicyException _ ->
        "com.amazonaws.cognitoidentityprovider#InvalidSmsRoleAccessPolicyException"
    | `InvalidSmsRoleTrustRelationshipException _ ->
        "com.amazonaws.cognitoidentityprovider#InvalidSmsRoleTrustRelationshipException"
    | `LimitExceededException _ -> "com.amazonaws.cognitoidentityprovider#LimitExceededException"
    | `NotAuthorizedException _ -> "com.amazonaws.cognitoidentityprovider#NotAuthorizedException"
    | `OperationNotEnabledException _ ->
        "com.amazonaws.cognitoidentityprovider#OperationNotEnabledException"
    | `ResourceNotFoundException _ ->
        "com.amazonaws.cognitoidentityprovider#ResourceNotFoundException"
    | `TooManyRequestsException _ ->
        "com.amazonaws.cognitoidentityprovider#TooManyRequestsException"
    | `UnexpectedLambdaException _ ->
        "com.amazonaws.cognitoidentityprovider#UnexpectedLambdaException"
    | `UserLambdaValidationException _ ->
        "com.amazonaws.cognitoidentityprovider#UserLambdaValidationException"
    | `UserNotFoundException _ -> "com.amazonaws.cognitoidentityprovider#UserNotFoundException"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "InternalErrorException" ->
          `InternalErrorException (Json_deserializers.internal_error_exception_of_yojson tree path)
      | _, "InvalidEmailRoleAccessPolicyException" ->
          `InvalidEmailRoleAccessPolicyException
            (Json_deserializers.invalid_email_role_access_policy_exception_of_yojson tree path)
      | _, "InvalidLambdaResponseException" ->
          `InvalidLambdaResponseException
            (Json_deserializers.invalid_lambda_response_exception_of_yojson tree path)
      | _, "InvalidParameterException" ->
          `InvalidParameterException
            (Json_deserializers.invalid_parameter_exception_of_yojson tree path)
      | _, "InvalidSmsRoleAccessPolicyException" ->
          `InvalidSmsRoleAccessPolicyException
            (Json_deserializers.invalid_sms_role_access_policy_exception_of_yojson tree path)
      | _, "InvalidSmsRoleTrustRelationshipException" ->
          `InvalidSmsRoleTrustRelationshipException
            (Json_deserializers.invalid_sms_role_trust_relationship_exception_of_yojson tree path)
      | _, "LimitExceededException" ->
          `LimitExceededException (Json_deserializers.limit_exceeded_exception_of_yojson tree path)
      | _, "NotAuthorizedException" ->
          `NotAuthorizedException (Json_deserializers.not_authorized_exception_of_yojson tree path)
      | _, "OperationNotEnabledException" ->
          `OperationNotEnabledException
            (Json_deserializers.operation_not_enabled_exception_of_yojson tree path)
      | _, "ResourceNotFoundException" ->
          `ResourceNotFoundException
            (Json_deserializers.resource_not_found_exception_of_yojson tree path)
      | _, "TooManyRequestsException" ->
          `TooManyRequestsException
            (Json_deserializers.too_many_requests_exception_of_yojson tree path)
      | _, "UnexpectedLambdaException" ->
          `UnexpectedLambdaException
            (Json_deserializers.unexpected_lambda_exception_of_yojson tree path)
      | _, "UserLambdaValidationException" ->
          `UserLambdaValidationException
            (Json_deserializers.user_lambda_validation_exception_of_yojson tree path)
      | _, "UserNotFoundException" ->
          `UserNotFoundException (Json_deserializers.user_not_found_exception_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : admin_reset_user_password_request) =
    let input = Json_serializers.admin_reset_user_password_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request
      ~shape_name:"AWSCognitoIdentityProviderService.AdminResetUserPassword" ~service ~context
      ~input ~output_deserializer:Json_deserializers.admin_reset_user_password_response_of_yojson
      ~error_deserializer

  let request_with_metadata context (request : admin_reset_user_password_request) =
    let input = Json_serializers.admin_reset_user_password_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata
      ~shape_name:"AWSCognitoIdentityProviderService.AdminResetUserPassword" ~service ~context
      ~input ~output_deserializer:Json_deserializers.admin_reset_user_password_response_of_yojson
      ~error_deserializer
end

module AdminRespondToAuthChallenge = struct
  let error_to_string = function
    | `AliasExistsException _ -> "com.amazonaws.cognitoidentityprovider#AliasExistsException"
    | `CodeMismatchException _ -> "com.amazonaws.cognitoidentityprovider#CodeMismatchException"
    | `ExpiredCodeException _ -> "com.amazonaws.cognitoidentityprovider#ExpiredCodeException"
    | `InternalErrorException _ -> "com.amazonaws.cognitoidentityprovider#InternalErrorException"
    | `InvalidEmailRoleAccessPolicyException _ ->
        "com.amazonaws.cognitoidentityprovider#InvalidEmailRoleAccessPolicyException"
    | `InvalidLambdaResponseException _ ->
        "com.amazonaws.cognitoidentityprovider#InvalidLambdaResponseException"
    | `InvalidParameterException _ ->
        "com.amazonaws.cognitoidentityprovider#InvalidParameterException"
    | `InvalidPasswordException _ ->
        "com.amazonaws.cognitoidentityprovider#InvalidPasswordException"
    | `InvalidSmsRoleAccessPolicyException _ ->
        "com.amazonaws.cognitoidentityprovider#InvalidSmsRoleAccessPolicyException"
    | `InvalidSmsRoleTrustRelationshipException _ ->
        "com.amazonaws.cognitoidentityprovider#InvalidSmsRoleTrustRelationshipException"
    | `InvalidUserPoolConfigurationException _ ->
        "com.amazonaws.cognitoidentityprovider#InvalidUserPoolConfigurationException"
    | `MFAMethodNotFoundException _ ->
        "com.amazonaws.cognitoidentityprovider#MFAMethodNotFoundException"
    | `NotAuthorizedException _ -> "com.amazonaws.cognitoidentityprovider#NotAuthorizedException"
    | `OperationNotEnabledException _ ->
        "com.amazonaws.cognitoidentityprovider#OperationNotEnabledException"
    | `PasswordHistoryPolicyViolationException _ ->
        "com.amazonaws.cognitoidentityprovider#PasswordHistoryPolicyViolationException"
    | `PasswordResetRequiredException _ ->
        "com.amazonaws.cognitoidentityprovider#PasswordResetRequiredException"
    | `ResourceNotFoundException _ ->
        "com.amazonaws.cognitoidentityprovider#ResourceNotFoundException"
    | `SoftwareTokenMFANotFoundException _ ->
        "com.amazonaws.cognitoidentityprovider#SoftwareTokenMFANotFoundException"
    | `TooManyRequestsException _ ->
        "com.amazonaws.cognitoidentityprovider#TooManyRequestsException"
    | `UnexpectedLambdaException _ ->
        "com.amazonaws.cognitoidentityprovider#UnexpectedLambdaException"
    | `UserLambdaValidationException _ ->
        "com.amazonaws.cognitoidentityprovider#UserLambdaValidationException"
    | `UserNotConfirmedException _ ->
        "com.amazonaws.cognitoidentityprovider#UserNotConfirmedException"
    | `UserNotFoundException _ -> "com.amazonaws.cognitoidentityprovider#UserNotFoundException"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "AliasExistsException" ->
          `AliasExistsException (Json_deserializers.alias_exists_exception_of_yojson tree path)
      | _, "CodeMismatchException" ->
          `CodeMismatchException (Json_deserializers.code_mismatch_exception_of_yojson tree path)
      | _, "ExpiredCodeException" ->
          `ExpiredCodeException (Json_deserializers.expired_code_exception_of_yojson tree path)
      | _, "InternalErrorException" ->
          `InternalErrorException (Json_deserializers.internal_error_exception_of_yojson tree path)
      | _, "InvalidEmailRoleAccessPolicyException" ->
          `InvalidEmailRoleAccessPolicyException
            (Json_deserializers.invalid_email_role_access_policy_exception_of_yojson tree path)
      | _, "InvalidLambdaResponseException" ->
          `InvalidLambdaResponseException
            (Json_deserializers.invalid_lambda_response_exception_of_yojson tree path)
      | _, "InvalidParameterException" ->
          `InvalidParameterException
            (Json_deserializers.invalid_parameter_exception_of_yojson tree path)
      | _, "InvalidPasswordException" ->
          `InvalidPasswordException
            (Json_deserializers.invalid_password_exception_of_yojson tree path)
      | _, "InvalidSmsRoleAccessPolicyException" ->
          `InvalidSmsRoleAccessPolicyException
            (Json_deserializers.invalid_sms_role_access_policy_exception_of_yojson tree path)
      | _, "InvalidSmsRoleTrustRelationshipException" ->
          `InvalidSmsRoleTrustRelationshipException
            (Json_deserializers.invalid_sms_role_trust_relationship_exception_of_yojson tree path)
      | _, "InvalidUserPoolConfigurationException" ->
          `InvalidUserPoolConfigurationException
            (Json_deserializers.invalid_user_pool_configuration_exception_of_yojson tree path)
      | _, "MFAMethodNotFoundException" ->
          `MFAMethodNotFoundException
            (Json_deserializers.mfa_method_not_found_exception_of_yojson tree path)
      | _, "NotAuthorizedException" ->
          `NotAuthorizedException (Json_deserializers.not_authorized_exception_of_yojson tree path)
      | _, "OperationNotEnabledException" ->
          `OperationNotEnabledException
            (Json_deserializers.operation_not_enabled_exception_of_yojson tree path)
      | _, "PasswordHistoryPolicyViolationException" ->
          `PasswordHistoryPolicyViolationException
            (Json_deserializers.password_history_policy_violation_exception_of_yojson tree path)
      | _, "PasswordResetRequiredException" ->
          `PasswordResetRequiredException
            (Json_deserializers.password_reset_required_exception_of_yojson tree path)
      | _, "ResourceNotFoundException" ->
          `ResourceNotFoundException
            (Json_deserializers.resource_not_found_exception_of_yojson tree path)
      | _, "SoftwareTokenMFANotFoundException" ->
          `SoftwareTokenMFANotFoundException
            (Json_deserializers.software_token_mfa_not_found_exception_of_yojson tree path)
      | _, "TooManyRequestsException" ->
          `TooManyRequestsException
            (Json_deserializers.too_many_requests_exception_of_yojson tree path)
      | _, "UnexpectedLambdaException" ->
          `UnexpectedLambdaException
            (Json_deserializers.unexpected_lambda_exception_of_yojson tree path)
      | _, "UserLambdaValidationException" ->
          `UserLambdaValidationException
            (Json_deserializers.user_lambda_validation_exception_of_yojson tree path)
      | _, "UserNotConfirmedException" ->
          `UserNotConfirmedException
            (Json_deserializers.user_not_confirmed_exception_of_yojson tree path)
      | _, "UserNotFoundException" ->
          `UserNotFoundException (Json_deserializers.user_not_found_exception_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : admin_respond_to_auth_challenge_request) =
    let input = Json_serializers.admin_respond_to_auth_challenge_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request
      ~shape_name:"AWSCognitoIdentityProviderService.AdminRespondToAuthChallenge" ~service ~context
      ~input
      ~output_deserializer:Json_deserializers.admin_respond_to_auth_challenge_response_of_yojson
      ~error_deserializer

  let request_with_metadata context (request : admin_respond_to_auth_challenge_request) =
    let input = Json_serializers.admin_respond_to_auth_challenge_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata
      ~shape_name:"AWSCognitoIdentityProviderService.AdminRespondToAuthChallenge" ~service ~context
      ~input
      ~output_deserializer:Json_deserializers.admin_respond_to_auth_challenge_response_of_yojson
      ~error_deserializer
end

module AdminSetUserMFAPreference = struct
  let error_to_string = function
    | `InternalErrorException _ -> "com.amazonaws.cognitoidentityprovider#InternalErrorException"
    | `InvalidParameterException _ ->
        "com.amazonaws.cognitoidentityprovider#InvalidParameterException"
    | `NotAuthorizedException _ -> "com.amazonaws.cognitoidentityprovider#NotAuthorizedException"
    | `OperationNotEnabledException _ ->
        "com.amazonaws.cognitoidentityprovider#OperationNotEnabledException"
    | `PasswordResetRequiredException _ ->
        "com.amazonaws.cognitoidentityprovider#PasswordResetRequiredException"
    | `ResourceNotFoundException _ ->
        "com.amazonaws.cognitoidentityprovider#ResourceNotFoundException"
    | `UserNotConfirmedException _ ->
        "com.amazonaws.cognitoidentityprovider#UserNotConfirmedException"
    | `UserNotFoundException _ -> "com.amazonaws.cognitoidentityprovider#UserNotFoundException"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "InternalErrorException" ->
          `InternalErrorException (Json_deserializers.internal_error_exception_of_yojson tree path)
      | _, "InvalidParameterException" ->
          `InvalidParameterException
            (Json_deserializers.invalid_parameter_exception_of_yojson tree path)
      | _, "NotAuthorizedException" ->
          `NotAuthorizedException (Json_deserializers.not_authorized_exception_of_yojson tree path)
      | _, "OperationNotEnabledException" ->
          `OperationNotEnabledException
            (Json_deserializers.operation_not_enabled_exception_of_yojson tree path)
      | _, "PasswordResetRequiredException" ->
          `PasswordResetRequiredException
            (Json_deserializers.password_reset_required_exception_of_yojson tree path)
      | _, "ResourceNotFoundException" ->
          `ResourceNotFoundException
            (Json_deserializers.resource_not_found_exception_of_yojson tree path)
      | _, "UserNotConfirmedException" ->
          `UserNotConfirmedException
            (Json_deserializers.user_not_confirmed_exception_of_yojson tree path)
      | _, "UserNotFoundException" ->
          `UserNotFoundException (Json_deserializers.user_not_found_exception_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : admin_set_user_mfa_preference_request) =
    let input = Json_serializers.admin_set_user_mfa_preference_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request
      ~shape_name:"AWSCognitoIdentityProviderService.AdminSetUserMFAPreference" ~service ~context
      ~input
      ~output_deserializer:Json_deserializers.admin_set_user_mfa_preference_response_of_yojson
      ~error_deserializer

  let request_with_metadata context (request : admin_set_user_mfa_preference_request) =
    let input = Json_serializers.admin_set_user_mfa_preference_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata
      ~shape_name:"AWSCognitoIdentityProviderService.AdminSetUserMFAPreference" ~service ~context
      ~input
      ~output_deserializer:Json_deserializers.admin_set_user_mfa_preference_response_of_yojson
      ~error_deserializer
end

module AdminSetUserPassword = struct
  let error_to_string = function
    | `InternalErrorException _ -> "com.amazonaws.cognitoidentityprovider#InternalErrorException"
    | `InvalidParameterException _ ->
        "com.amazonaws.cognitoidentityprovider#InvalidParameterException"
    | `InvalidPasswordException _ ->
        "com.amazonaws.cognitoidentityprovider#InvalidPasswordException"
    | `NotAuthorizedException _ -> "com.amazonaws.cognitoidentityprovider#NotAuthorizedException"
    | `OperationNotEnabledException _ ->
        "com.amazonaws.cognitoidentityprovider#OperationNotEnabledException"
    | `PasswordHistoryPolicyViolationException _ ->
        "com.amazonaws.cognitoidentityprovider#PasswordHistoryPolicyViolationException"
    | `ResourceNotFoundException _ ->
        "com.amazonaws.cognitoidentityprovider#ResourceNotFoundException"
    | `TooManyRequestsException _ ->
        "com.amazonaws.cognitoidentityprovider#TooManyRequestsException"
    | `UserNotFoundException _ -> "com.amazonaws.cognitoidentityprovider#UserNotFoundException"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "InternalErrorException" ->
          `InternalErrorException (Json_deserializers.internal_error_exception_of_yojson tree path)
      | _, "InvalidParameterException" ->
          `InvalidParameterException
            (Json_deserializers.invalid_parameter_exception_of_yojson tree path)
      | _, "InvalidPasswordException" ->
          `InvalidPasswordException
            (Json_deserializers.invalid_password_exception_of_yojson tree path)
      | _, "NotAuthorizedException" ->
          `NotAuthorizedException (Json_deserializers.not_authorized_exception_of_yojson tree path)
      | _, "OperationNotEnabledException" ->
          `OperationNotEnabledException
            (Json_deserializers.operation_not_enabled_exception_of_yojson tree path)
      | _, "PasswordHistoryPolicyViolationException" ->
          `PasswordHistoryPolicyViolationException
            (Json_deserializers.password_history_policy_violation_exception_of_yojson tree path)
      | _, "ResourceNotFoundException" ->
          `ResourceNotFoundException
            (Json_deserializers.resource_not_found_exception_of_yojson tree path)
      | _, "TooManyRequestsException" ->
          `TooManyRequestsException
            (Json_deserializers.too_many_requests_exception_of_yojson tree path)
      | _, "UserNotFoundException" ->
          `UserNotFoundException (Json_deserializers.user_not_found_exception_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : admin_set_user_password_request) =
    let input = Json_serializers.admin_set_user_password_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request
      ~shape_name:"AWSCognitoIdentityProviderService.AdminSetUserPassword" ~service ~context ~input
      ~output_deserializer:Json_deserializers.admin_set_user_password_response_of_yojson
      ~error_deserializer

  let request_with_metadata context (request : admin_set_user_password_request) =
    let input = Json_serializers.admin_set_user_password_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata
      ~shape_name:"AWSCognitoIdentityProviderService.AdminSetUserPassword" ~service ~context ~input
      ~output_deserializer:Json_deserializers.admin_set_user_password_response_of_yojson
      ~error_deserializer
end

module AdminSetUserSettings = struct
  let error_to_string = function
    | `InternalErrorException _ -> "com.amazonaws.cognitoidentityprovider#InternalErrorException"
    | `InvalidParameterException _ ->
        "com.amazonaws.cognitoidentityprovider#InvalidParameterException"
    | `NotAuthorizedException _ -> "com.amazonaws.cognitoidentityprovider#NotAuthorizedException"
    | `OperationNotEnabledException _ ->
        "com.amazonaws.cognitoidentityprovider#OperationNotEnabledException"
    | `ResourceNotFoundException _ ->
        "com.amazonaws.cognitoidentityprovider#ResourceNotFoundException"
    | `UserNotFoundException _ -> "com.amazonaws.cognitoidentityprovider#UserNotFoundException"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "InternalErrorException" ->
          `InternalErrorException (Json_deserializers.internal_error_exception_of_yojson tree path)
      | _, "InvalidParameterException" ->
          `InvalidParameterException
            (Json_deserializers.invalid_parameter_exception_of_yojson tree path)
      | _, "NotAuthorizedException" ->
          `NotAuthorizedException (Json_deserializers.not_authorized_exception_of_yojson tree path)
      | _, "OperationNotEnabledException" ->
          `OperationNotEnabledException
            (Json_deserializers.operation_not_enabled_exception_of_yojson tree path)
      | _, "ResourceNotFoundException" ->
          `ResourceNotFoundException
            (Json_deserializers.resource_not_found_exception_of_yojson tree path)
      | _, "UserNotFoundException" ->
          `UserNotFoundException (Json_deserializers.user_not_found_exception_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : admin_set_user_settings_request) =
    let input = Json_serializers.admin_set_user_settings_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request
      ~shape_name:"AWSCognitoIdentityProviderService.AdminSetUserSettings" ~service ~context ~input
      ~output_deserializer:Json_deserializers.admin_set_user_settings_response_of_yojson
      ~error_deserializer

  let request_with_metadata context (request : admin_set_user_settings_request) =
    let input = Json_serializers.admin_set_user_settings_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata
      ~shape_name:"AWSCognitoIdentityProviderService.AdminSetUserSettings" ~service ~context ~input
      ~output_deserializer:Json_deserializers.admin_set_user_settings_response_of_yojson
      ~error_deserializer
end

module AdminUpdateAuthEventFeedback = struct
  let error_to_string = function
    | `InternalErrorException _ -> "com.amazonaws.cognitoidentityprovider#InternalErrorException"
    | `InvalidParameterException _ ->
        "com.amazonaws.cognitoidentityprovider#InvalidParameterException"
    | `NotAuthorizedException _ -> "com.amazonaws.cognitoidentityprovider#NotAuthorizedException"
    | `OperationNotEnabledException _ ->
        "com.amazonaws.cognitoidentityprovider#OperationNotEnabledException"
    | `ResourceNotFoundException _ ->
        "com.amazonaws.cognitoidentityprovider#ResourceNotFoundException"
    | `TooManyRequestsException _ ->
        "com.amazonaws.cognitoidentityprovider#TooManyRequestsException"
    | `UserNotFoundException _ -> "com.amazonaws.cognitoidentityprovider#UserNotFoundException"
    | `UserPoolAddOnNotEnabledException _ ->
        "com.amazonaws.cognitoidentityprovider#UserPoolAddOnNotEnabledException"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "InternalErrorException" ->
          `InternalErrorException (Json_deserializers.internal_error_exception_of_yojson tree path)
      | _, "InvalidParameterException" ->
          `InvalidParameterException
            (Json_deserializers.invalid_parameter_exception_of_yojson tree path)
      | _, "NotAuthorizedException" ->
          `NotAuthorizedException (Json_deserializers.not_authorized_exception_of_yojson tree path)
      | _, "OperationNotEnabledException" ->
          `OperationNotEnabledException
            (Json_deserializers.operation_not_enabled_exception_of_yojson tree path)
      | _, "ResourceNotFoundException" ->
          `ResourceNotFoundException
            (Json_deserializers.resource_not_found_exception_of_yojson tree path)
      | _, "TooManyRequestsException" ->
          `TooManyRequestsException
            (Json_deserializers.too_many_requests_exception_of_yojson tree path)
      | _, "UserNotFoundException" ->
          `UserNotFoundException (Json_deserializers.user_not_found_exception_of_yojson tree path)
      | _, "UserPoolAddOnNotEnabledException" ->
          `UserPoolAddOnNotEnabledException
            (Json_deserializers.user_pool_add_on_not_enabled_exception_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : admin_update_auth_event_feedback_request) =
    let input = Json_serializers.admin_update_auth_event_feedback_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request
      ~shape_name:"AWSCognitoIdentityProviderService.AdminUpdateAuthEventFeedback" ~service ~context
      ~input
      ~output_deserializer:Json_deserializers.admin_update_auth_event_feedback_response_of_yojson
      ~error_deserializer

  let request_with_metadata context (request : admin_update_auth_event_feedback_request) =
    let input = Json_serializers.admin_update_auth_event_feedback_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata
      ~shape_name:"AWSCognitoIdentityProviderService.AdminUpdateAuthEventFeedback" ~service ~context
      ~input
      ~output_deserializer:Json_deserializers.admin_update_auth_event_feedback_response_of_yojson
      ~error_deserializer
end

module AdminUpdateDeviceStatus = struct
  let error_to_string = function
    | `InternalErrorException _ -> "com.amazonaws.cognitoidentityprovider#InternalErrorException"
    | `InvalidParameterException _ ->
        "com.amazonaws.cognitoidentityprovider#InvalidParameterException"
    | `InvalidUserPoolConfigurationException _ ->
        "com.amazonaws.cognitoidentityprovider#InvalidUserPoolConfigurationException"
    | `NotAuthorizedException _ -> "com.amazonaws.cognitoidentityprovider#NotAuthorizedException"
    | `OperationNotEnabledException _ ->
        "com.amazonaws.cognitoidentityprovider#OperationNotEnabledException"
    | `ResourceNotFoundException _ ->
        "com.amazonaws.cognitoidentityprovider#ResourceNotFoundException"
    | `TooManyRequestsException _ ->
        "com.amazonaws.cognitoidentityprovider#TooManyRequestsException"
    | `UserNotFoundException _ -> "com.amazonaws.cognitoidentityprovider#UserNotFoundException"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "InternalErrorException" ->
          `InternalErrorException (Json_deserializers.internal_error_exception_of_yojson tree path)
      | _, "InvalidParameterException" ->
          `InvalidParameterException
            (Json_deserializers.invalid_parameter_exception_of_yojson tree path)
      | _, "InvalidUserPoolConfigurationException" ->
          `InvalidUserPoolConfigurationException
            (Json_deserializers.invalid_user_pool_configuration_exception_of_yojson tree path)
      | _, "NotAuthorizedException" ->
          `NotAuthorizedException (Json_deserializers.not_authorized_exception_of_yojson tree path)
      | _, "OperationNotEnabledException" ->
          `OperationNotEnabledException
            (Json_deserializers.operation_not_enabled_exception_of_yojson tree path)
      | _, "ResourceNotFoundException" ->
          `ResourceNotFoundException
            (Json_deserializers.resource_not_found_exception_of_yojson tree path)
      | _, "TooManyRequestsException" ->
          `TooManyRequestsException
            (Json_deserializers.too_many_requests_exception_of_yojson tree path)
      | _, "UserNotFoundException" ->
          `UserNotFoundException (Json_deserializers.user_not_found_exception_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : admin_update_device_status_request) =
    let input = Json_serializers.admin_update_device_status_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request
      ~shape_name:"AWSCognitoIdentityProviderService.AdminUpdateDeviceStatus" ~service ~context
      ~input ~output_deserializer:Json_deserializers.admin_update_device_status_response_of_yojson
      ~error_deserializer

  let request_with_metadata context (request : admin_update_device_status_request) =
    let input = Json_serializers.admin_update_device_status_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata
      ~shape_name:"AWSCognitoIdentityProviderService.AdminUpdateDeviceStatus" ~service ~context
      ~input ~output_deserializer:Json_deserializers.admin_update_device_status_response_of_yojson
      ~error_deserializer
end

module AdminUpdateUserAttributes = struct
  let error_to_string = function
    | `AliasExistsException _ -> "com.amazonaws.cognitoidentityprovider#AliasExistsException"
    | `InternalErrorException _ -> "com.amazonaws.cognitoidentityprovider#InternalErrorException"
    | `InvalidEmailRoleAccessPolicyException _ ->
        "com.amazonaws.cognitoidentityprovider#InvalidEmailRoleAccessPolicyException"
    | `InvalidLambdaResponseException _ ->
        "com.amazonaws.cognitoidentityprovider#InvalidLambdaResponseException"
    | `InvalidParameterException _ ->
        "com.amazonaws.cognitoidentityprovider#InvalidParameterException"
    | `InvalidSmsRoleAccessPolicyException _ ->
        "com.amazonaws.cognitoidentityprovider#InvalidSmsRoleAccessPolicyException"
    | `InvalidSmsRoleTrustRelationshipException _ ->
        "com.amazonaws.cognitoidentityprovider#InvalidSmsRoleTrustRelationshipException"
    | `NotAuthorizedException _ -> "com.amazonaws.cognitoidentityprovider#NotAuthorizedException"
    | `OperationNotEnabledException _ ->
        "com.amazonaws.cognitoidentityprovider#OperationNotEnabledException"
    | `ResourceNotFoundException _ ->
        "com.amazonaws.cognitoidentityprovider#ResourceNotFoundException"
    | `TooManyRequestsException _ ->
        "com.amazonaws.cognitoidentityprovider#TooManyRequestsException"
    | `UnexpectedLambdaException _ ->
        "com.amazonaws.cognitoidentityprovider#UnexpectedLambdaException"
    | `UserLambdaValidationException _ ->
        "com.amazonaws.cognitoidentityprovider#UserLambdaValidationException"
    | `UserNotFoundException _ -> "com.amazonaws.cognitoidentityprovider#UserNotFoundException"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "AliasExistsException" ->
          `AliasExistsException (Json_deserializers.alias_exists_exception_of_yojson tree path)
      | _, "InternalErrorException" ->
          `InternalErrorException (Json_deserializers.internal_error_exception_of_yojson tree path)
      | _, "InvalidEmailRoleAccessPolicyException" ->
          `InvalidEmailRoleAccessPolicyException
            (Json_deserializers.invalid_email_role_access_policy_exception_of_yojson tree path)
      | _, "InvalidLambdaResponseException" ->
          `InvalidLambdaResponseException
            (Json_deserializers.invalid_lambda_response_exception_of_yojson tree path)
      | _, "InvalidParameterException" ->
          `InvalidParameterException
            (Json_deserializers.invalid_parameter_exception_of_yojson tree path)
      | _, "InvalidSmsRoleAccessPolicyException" ->
          `InvalidSmsRoleAccessPolicyException
            (Json_deserializers.invalid_sms_role_access_policy_exception_of_yojson tree path)
      | _, "InvalidSmsRoleTrustRelationshipException" ->
          `InvalidSmsRoleTrustRelationshipException
            (Json_deserializers.invalid_sms_role_trust_relationship_exception_of_yojson tree path)
      | _, "NotAuthorizedException" ->
          `NotAuthorizedException (Json_deserializers.not_authorized_exception_of_yojson tree path)
      | _, "OperationNotEnabledException" ->
          `OperationNotEnabledException
            (Json_deserializers.operation_not_enabled_exception_of_yojson tree path)
      | _, "ResourceNotFoundException" ->
          `ResourceNotFoundException
            (Json_deserializers.resource_not_found_exception_of_yojson tree path)
      | _, "TooManyRequestsException" ->
          `TooManyRequestsException
            (Json_deserializers.too_many_requests_exception_of_yojson tree path)
      | _, "UnexpectedLambdaException" ->
          `UnexpectedLambdaException
            (Json_deserializers.unexpected_lambda_exception_of_yojson tree path)
      | _, "UserLambdaValidationException" ->
          `UserLambdaValidationException
            (Json_deserializers.user_lambda_validation_exception_of_yojson tree path)
      | _, "UserNotFoundException" ->
          `UserNotFoundException (Json_deserializers.user_not_found_exception_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : admin_update_user_attributes_request) =
    let input = Json_serializers.admin_update_user_attributes_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request
      ~shape_name:"AWSCognitoIdentityProviderService.AdminUpdateUserAttributes" ~service ~context
      ~input ~output_deserializer:Json_deserializers.admin_update_user_attributes_response_of_yojson
      ~error_deserializer

  let request_with_metadata context (request : admin_update_user_attributes_request) =
    let input = Json_serializers.admin_update_user_attributes_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata
      ~shape_name:"AWSCognitoIdentityProviderService.AdminUpdateUserAttributes" ~service ~context
      ~input ~output_deserializer:Json_deserializers.admin_update_user_attributes_response_of_yojson
      ~error_deserializer
end

module AdminUserGlobalSignOut = struct
  let error_to_string = function
    | `InternalErrorException _ -> "com.amazonaws.cognitoidentityprovider#InternalErrorException"
    | `InvalidParameterException _ ->
        "com.amazonaws.cognitoidentityprovider#InvalidParameterException"
    | `NotAuthorizedException _ -> "com.amazonaws.cognitoidentityprovider#NotAuthorizedException"
    | `OperationNotEnabledException _ ->
        "com.amazonaws.cognitoidentityprovider#OperationNotEnabledException"
    | `ResourceNotFoundException _ ->
        "com.amazonaws.cognitoidentityprovider#ResourceNotFoundException"
    | `TooManyRequestsException _ ->
        "com.amazonaws.cognitoidentityprovider#TooManyRequestsException"
    | `UserNotFoundException _ -> "com.amazonaws.cognitoidentityprovider#UserNotFoundException"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "InternalErrorException" ->
          `InternalErrorException (Json_deserializers.internal_error_exception_of_yojson tree path)
      | _, "InvalidParameterException" ->
          `InvalidParameterException
            (Json_deserializers.invalid_parameter_exception_of_yojson tree path)
      | _, "NotAuthorizedException" ->
          `NotAuthorizedException (Json_deserializers.not_authorized_exception_of_yojson tree path)
      | _, "OperationNotEnabledException" ->
          `OperationNotEnabledException
            (Json_deserializers.operation_not_enabled_exception_of_yojson tree path)
      | _, "ResourceNotFoundException" ->
          `ResourceNotFoundException
            (Json_deserializers.resource_not_found_exception_of_yojson tree path)
      | _, "TooManyRequestsException" ->
          `TooManyRequestsException
            (Json_deserializers.too_many_requests_exception_of_yojson tree path)
      | _, "UserNotFoundException" ->
          `UserNotFoundException (Json_deserializers.user_not_found_exception_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : admin_user_global_sign_out_request) =
    let input = Json_serializers.admin_user_global_sign_out_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request
      ~shape_name:"AWSCognitoIdentityProviderService.AdminUserGlobalSignOut" ~service ~context
      ~input ~output_deserializer:Json_deserializers.admin_user_global_sign_out_response_of_yojson
      ~error_deserializer

  let request_with_metadata context (request : admin_user_global_sign_out_request) =
    let input = Json_serializers.admin_user_global_sign_out_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata
      ~shape_name:"AWSCognitoIdentityProviderService.AdminUserGlobalSignOut" ~service ~context
      ~input ~output_deserializer:Json_deserializers.admin_user_global_sign_out_response_of_yojson
      ~error_deserializer
end

module AssociateSoftwareToken = struct
  let error_to_string = function
    | `ConcurrentModificationException _ ->
        "com.amazonaws.cognitoidentityprovider#ConcurrentModificationException"
    | `ForbiddenException _ -> "com.amazonaws.cognitoidentityprovider#ForbiddenException"
    | `InternalErrorException _ -> "com.amazonaws.cognitoidentityprovider#InternalErrorException"
    | `InvalidParameterException _ ->
        "com.amazonaws.cognitoidentityprovider#InvalidParameterException"
    | `NotAuthorizedException _ -> "com.amazonaws.cognitoidentityprovider#NotAuthorizedException"
    | `OperationNotEnabledException _ ->
        "com.amazonaws.cognitoidentityprovider#OperationNotEnabledException"
    | `ResourceNotFoundException _ ->
        "com.amazonaws.cognitoidentityprovider#ResourceNotFoundException"
    | `SoftwareTokenMFANotFoundException _ ->
        "com.amazonaws.cognitoidentityprovider#SoftwareTokenMFANotFoundException"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "ConcurrentModificationException" ->
          `ConcurrentModificationException
            (Json_deserializers.concurrent_modification_exception_of_yojson tree path)
      | _, "ForbiddenException" ->
          `ForbiddenException (Json_deserializers.forbidden_exception_of_yojson tree path)
      | _, "InternalErrorException" ->
          `InternalErrorException (Json_deserializers.internal_error_exception_of_yojson tree path)
      | _, "InvalidParameterException" ->
          `InvalidParameterException
            (Json_deserializers.invalid_parameter_exception_of_yojson tree path)
      | _, "NotAuthorizedException" ->
          `NotAuthorizedException (Json_deserializers.not_authorized_exception_of_yojson tree path)
      | _, "OperationNotEnabledException" ->
          `OperationNotEnabledException
            (Json_deserializers.operation_not_enabled_exception_of_yojson tree path)
      | _, "ResourceNotFoundException" ->
          `ResourceNotFoundException
            (Json_deserializers.resource_not_found_exception_of_yojson tree path)
      | _, "SoftwareTokenMFANotFoundException" ->
          `SoftwareTokenMFANotFoundException
            (Json_deserializers.software_token_mfa_not_found_exception_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : associate_software_token_request) =
    let input = Json_serializers.associate_software_token_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request
      ~shape_name:"AWSCognitoIdentityProviderService.AssociateSoftwareToken" ~service ~context
      ~input ~output_deserializer:Json_deserializers.associate_software_token_response_of_yojson
      ~error_deserializer

  let request_with_metadata context (request : associate_software_token_request) =
    let input = Json_serializers.associate_software_token_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata
      ~shape_name:"AWSCognitoIdentityProviderService.AssociateSoftwareToken" ~service ~context
      ~input ~output_deserializer:Json_deserializers.associate_software_token_response_of_yojson
      ~error_deserializer
end

module ChangePassword = struct
  let error_to_string = function
    | `ForbiddenException _ -> "com.amazonaws.cognitoidentityprovider#ForbiddenException"
    | `InternalErrorException _ -> "com.amazonaws.cognitoidentityprovider#InternalErrorException"
    | `InvalidParameterException _ ->
        "com.amazonaws.cognitoidentityprovider#InvalidParameterException"
    | `InvalidPasswordException _ ->
        "com.amazonaws.cognitoidentityprovider#InvalidPasswordException"
    | `LimitExceededException _ -> "com.amazonaws.cognitoidentityprovider#LimitExceededException"
    | `NotAuthorizedException _ -> "com.amazonaws.cognitoidentityprovider#NotAuthorizedException"
    | `OperationNotEnabledException _ ->
        "com.amazonaws.cognitoidentityprovider#OperationNotEnabledException"
    | `PasswordHistoryPolicyViolationException _ ->
        "com.amazonaws.cognitoidentityprovider#PasswordHistoryPolicyViolationException"
    | `PasswordResetRequiredException _ ->
        "com.amazonaws.cognitoidentityprovider#PasswordResetRequiredException"
    | `ResourceNotFoundException _ ->
        "com.amazonaws.cognitoidentityprovider#ResourceNotFoundException"
    | `TooManyRequestsException _ ->
        "com.amazonaws.cognitoidentityprovider#TooManyRequestsException"
    | `UserNotConfirmedException _ ->
        "com.amazonaws.cognitoidentityprovider#UserNotConfirmedException"
    | `UserNotFoundException _ -> "com.amazonaws.cognitoidentityprovider#UserNotFoundException"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "ForbiddenException" ->
          `ForbiddenException (Json_deserializers.forbidden_exception_of_yojson tree path)
      | _, "InternalErrorException" ->
          `InternalErrorException (Json_deserializers.internal_error_exception_of_yojson tree path)
      | _, "InvalidParameterException" ->
          `InvalidParameterException
            (Json_deserializers.invalid_parameter_exception_of_yojson tree path)
      | _, "InvalidPasswordException" ->
          `InvalidPasswordException
            (Json_deserializers.invalid_password_exception_of_yojson tree path)
      | _, "LimitExceededException" ->
          `LimitExceededException (Json_deserializers.limit_exceeded_exception_of_yojson tree path)
      | _, "NotAuthorizedException" ->
          `NotAuthorizedException (Json_deserializers.not_authorized_exception_of_yojson tree path)
      | _, "OperationNotEnabledException" ->
          `OperationNotEnabledException
            (Json_deserializers.operation_not_enabled_exception_of_yojson tree path)
      | _, "PasswordHistoryPolicyViolationException" ->
          `PasswordHistoryPolicyViolationException
            (Json_deserializers.password_history_policy_violation_exception_of_yojson tree path)
      | _, "PasswordResetRequiredException" ->
          `PasswordResetRequiredException
            (Json_deserializers.password_reset_required_exception_of_yojson tree path)
      | _, "ResourceNotFoundException" ->
          `ResourceNotFoundException
            (Json_deserializers.resource_not_found_exception_of_yojson tree path)
      | _, "TooManyRequestsException" ->
          `TooManyRequestsException
            (Json_deserializers.too_many_requests_exception_of_yojson tree path)
      | _, "UserNotConfirmedException" ->
          `UserNotConfirmedException
            (Json_deserializers.user_not_confirmed_exception_of_yojson tree path)
      | _, "UserNotFoundException" ->
          `UserNotFoundException (Json_deserializers.user_not_found_exception_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : change_password_request) =
    let input = Json_serializers.change_password_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request
      ~shape_name:"AWSCognitoIdentityProviderService.ChangePassword" ~service ~context ~input
      ~output_deserializer:Json_deserializers.change_password_response_of_yojson ~error_deserializer

  let request_with_metadata context (request : change_password_request) =
    let input = Json_serializers.change_password_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata
      ~shape_name:"AWSCognitoIdentityProviderService.ChangePassword" ~service ~context ~input
      ~output_deserializer:Json_deserializers.change_password_response_of_yojson ~error_deserializer
end

module CompleteWebAuthnRegistration = struct
  let error_to_string = function
    | `ForbiddenException _ -> "com.amazonaws.cognitoidentityprovider#ForbiddenException"
    | `InternalErrorException _ -> "com.amazonaws.cognitoidentityprovider#InternalErrorException"
    | `InvalidParameterException _ ->
        "com.amazonaws.cognitoidentityprovider#InvalidParameterException"
    | `LimitExceededException _ -> "com.amazonaws.cognitoidentityprovider#LimitExceededException"
    | `NotAuthorizedException _ -> "com.amazonaws.cognitoidentityprovider#NotAuthorizedException"
    | `OperationNotEnabledException _ ->
        "com.amazonaws.cognitoidentityprovider#OperationNotEnabledException"
    | `PasswordResetRequiredException _ ->
        "com.amazonaws.cognitoidentityprovider#PasswordResetRequiredException"
    | `TooManyRequestsException _ ->
        "com.amazonaws.cognitoidentityprovider#TooManyRequestsException"
    | `WebAuthnChallengeNotFoundException _ ->
        "com.amazonaws.cognitoidentityprovider#WebAuthnChallengeNotFoundException"
    | `WebAuthnClientMismatchException _ ->
        "com.amazonaws.cognitoidentityprovider#WebAuthnClientMismatchException"
    | `WebAuthnCredentialNotSupportedException _ ->
        "com.amazonaws.cognitoidentityprovider#WebAuthnCredentialNotSupportedException"
    | `WebAuthnNotEnabledException _ ->
        "com.amazonaws.cognitoidentityprovider#WebAuthnNotEnabledException"
    | `WebAuthnOriginNotAllowedException _ ->
        "com.amazonaws.cognitoidentityprovider#WebAuthnOriginNotAllowedException"
    | `WebAuthnRelyingPartyMismatchException _ ->
        "com.amazonaws.cognitoidentityprovider#WebAuthnRelyingPartyMismatchException"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "ForbiddenException" ->
          `ForbiddenException (Json_deserializers.forbidden_exception_of_yojson tree path)
      | _, "InternalErrorException" ->
          `InternalErrorException (Json_deserializers.internal_error_exception_of_yojson tree path)
      | _, "InvalidParameterException" ->
          `InvalidParameterException
            (Json_deserializers.invalid_parameter_exception_of_yojson tree path)
      | _, "LimitExceededException" ->
          `LimitExceededException (Json_deserializers.limit_exceeded_exception_of_yojson tree path)
      | _, "NotAuthorizedException" ->
          `NotAuthorizedException (Json_deserializers.not_authorized_exception_of_yojson tree path)
      | _, "OperationNotEnabledException" ->
          `OperationNotEnabledException
            (Json_deserializers.operation_not_enabled_exception_of_yojson tree path)
      | _, "PasswordResetRequiredException" ->
          `PasswordResetRequiredException
            (Json_deserializers.password_reset_required_exception_of_yojson tree path)
      | _, "TooManyRequestsException" ->
          `TooManyRequestsException
            (Json_deserializers.too_many_requests_exception_of_yojson tree path)
      | _, "WebAuthnChallengeNotFoundException" ->
          `WebAuthnChallengeNotFoundException
            (Json_deserializers.web_authn_challenge_not_found_exception_of_yojson tree path)
      | _, "WebAuthnClientMismatchException" ->
          `WebAuthnClientMismatchException
            (Json_deserializers.web_authn_client_mismatch_exception_of_yojson tree path)
      | _, "WebAuthnCredentialNotSupportedException" ->
          `WebAuthnCredentialNotSupportedException
            (Json_deserializers.web_authn_credential_not_supported_exception_of_yojson tree path)
      | _, "WebAuthnNotEnabledException" ->
          `WebAuthnNotEnabledException
            (Json_deserializers.web_authn_not_enabled_exception_of_yojson tree path)
      | _, "WebAuthnOriginNotAllowedException" ->
          `WebAuthnOriginNotAllowedException
            (Json_deserializers.web_authn_origin_not_allowed_exception_of_yojson tree path)
      | _, "WebAuthnRelyingPartyMismatchException" ->
          `WebAuthnRelyingPartyMismatchException
            (Json_deserializers.web_authn_relying_party_mismatch_exception_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : complete_web_authn_registration_request) =
    let input = Json_serializers.complete_web_authn_registration_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request
      ~shape_name:"AWSCognitoIdentityProviderService.CompleteWebAuthnRegistration" ~service ~context
      ~input
      ~output_deserializer:Json_deserializers.complete_web_authn_registration_response_of_yojson
      ~error_deserializer

  let request_with_metadata context (request : complete_web_authn_registration_request) =
    let input = Json_serializers.complete_web_authn_registration_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata
      ~shape_name:"AWSCognitoIdentityProviderService.CompleteWebAuthnRegistration" ~service ~context
      ~input
      ~output_deserializer:Json_deserializers.complete_web_authn_registration_response_of_yojson
      ~error_deserializer
end

module ConfirmDevice = struct
  let error_to_string = function
    | `DeviceKeyExistsException _ ->
        "com.amazonaws.cognitoidentityprovider#DeviceKeyExistsException"
    | `ForbiddenException _ -> "com.amazonaws.cognitoidentityprovider#ForbiddenException"
    | `InternalErrorException _ -> "com.amazonaws.cognitoidentityprovider#InternalErrorException"
    | `InvalidLambdaResponseException _ ->
        "com.amazonaws.cognitoidentityprovider#InvalidLambdaResponseException"
    | `InvalidParameterException _ ->
        "com.amazonaws.cognitoidentityprovider#InvalidParameterException"
    | `InvalidPasswordException _ ->
        "com.amazonaws.cognitoidentityprovider#InvalidPasswordException"
    | `InvalidUserPoolConfigurationException _ ->
        "com.amazonaws.cognitoidentityprovider#InvalidUserPoolConfigurationException"
    | `NotAuthorizedException _ -> "com.amazonaws.cognitoidentityprovider#NotAuthorizedException"
    | `OperationNotEnabledException _ ->
        "com.amazonaws.cognitoidentityprovider#OperationNotEnabledException"
    | `PasswordResetRequiredException _ ->
        "com.amazonaws.cognitoidentityprovider#PasswordResetRequiredException"
    | `ResourceNotFoundException _ ->
        "com.amazonaws.cognitoidentityprovider#ResourceNotFoundException"
    | `TooManyRequestsException _ ->
        "com.amazonaws.cognitoidentityprovider#TooManyRequestsException"
    | `UsernameExistsException _ -> "com.amazonaws.cognitoidentityprovider#UsernameExistsException"
    | `UserNotConfirmedException _ ->
        "com.amazonaws.cognitoidentityprovider#UserNotConfirmedException"
    | `UserNotFoundException _ -> "com.amazonaws.cognitoidentityprovider#UserNotFoundException"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "DeviceKeyExistsException" ->
          `DeviceKeyExistsException
            (Json_deserializers.device_key_exists_exception_of_yojson tree path)
      | _, "ForbiddenException" ->
          `ForbiddenException (Json_deserializers.forbidden_exception_of_yojson tree path)
      | _, "InternalErrorException" ->
          `InternalErrorException (Json_deserializers.internal_error_exception_of_yojson tree path)
      | _, "InvalidLambdaResponseException" ->
          `InvalidLambdaResponseException
            (Json_deserializers.invalid_lambda_response_exception_of_yojson tree path)
      | _, "InvalidParameterException" ->
          `InvalidParameterException
            (Json_deserializers.invalid_parameter_exception_of_yojson tree path)
      | _, "InvalidPasswordException" ->
          `InvalidPasswordException
            (Json_deserializers.invalid_password_exception_of_yojson tree path)
      | _, "InvalidUserPoolConfigurationException" ->
          `InvalidUserPoolConfigurationException
            (Json_deserializers.invalid_user_pool_configuration_exception_of_yojson tree path)
      | _, "NotAuthorizedException" ->
          `NotAuthorizedException (Json_deserializers.not_authorized_exception_of_yojson tree path)
      | _, "OperationNotEnabledException" ->
          `OperationNotEnabledException
            (Json_deserializers.operation_not_enabled_exception_of_yojson tree path)
      | _, "PasswordResetRequiredException" ->
          `PasswordResetRequiredException
            (Json_deserializers.password_reset_required_exception_of_yojson tree path)
      | _, "ResourceNotFoundException" ->
          `ResourceNotFoundException
            (Json_deserializers.resource_not_found_exception_of_yojson tree path)
      | _, "TooManyRequestsException" ->
          `TooManyRequestsException
            (Json_deserializers.too_many_requests_exception_of_yojson tree path)
      | _, "UsernameExistsException" ->
          `UsernameExistsException
            (Json_deserializers.username_exists_exception_of_yojson tree path)
      | _, "UserNotConfirmedException" ->
          `UserNotConfirmedException
            (Json_deserializers.user_not_confirmed_exception_of_yojson tree path)
      | _, "UserNotFoundException" ->
          `UserNotFoundException (Json_deserializers.user_not_found_exception_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : confirm_device_request) =
    let input = Json_serializers.confirm_device_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request
      ~shape_name:"AWSCognitoIdentityProviderService.ConfirmDevice" ~service ~context ~input
      ~output_deserializer:Json_deserializers.confirm_device_response_of_yojson ~error_deserializer

  let request_with_metadata context (request : confirm_device_request) =
    let input = Json_serializers.confirm_device_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata
      ~shape_name:"AWSCognitoIdentityProviderService.ConfirmDevice" ~service ~context ~input
      ~output_deserializer:Json_deserializers.confirm_device_response_of_yojson ~error_deserializer
end

module ConfirmForgotPassword = struct
  let error_to_string = function
    | `CodeMismatchException _ -> "com.amazonaws.cognitoidentityprovider#CodeMismatchException"
    | `ExpiredCodeException _ -> "com.amazonaws.cognitoidentityprovider#ExpiredCodeException"
    | `ForbiddenException _ -> "com.amazonaws.cognitoidentityprovider#ForbiddenException"
    | `InternalErrorException _ -> "com.amazonaws.cognitoidentityprovider#InternalErrorException"
    | `InvalidLambdaResponseException _ ->
        "com.amazonaws.cognitoidentityprovider#InvalidLambdaResponseException"
    | `InvalidParameterException _ ->
        "com.amazonaws.cognitoidentityprovider#InvalidParameterException"
    | `InvalidPasswordException _ ->
        "com.amazonaws.cognitoidentityprovider#InvalidPasswordException"
    | `LimitExceededException _ -> "com.amazonaws.cognitoidentityprovider#LimitExceededException"
    | `NotAuthorizedException _ -> "com.amazonaws.cognitoidentityprovider#NotAuthorizedException"
    | `OperationNotEnabledException _ ->
        "com.amazonaws.cognitoidentityprovider#OperationNotEnabledException"
    | `PasswordHistoryPolicyViolationException _ ->
        "com.amazonaws.cognitoidentityprovider#PasswordHistoryPolicyViolationException"
    | `ResourceNotFoundException _ ->
        "com.amazonaws.cognitoidentityprovider#ResourceNotFoundException"
    | `TooManyFailedAttemptsException _ ->
        "com.amazonaws.cognitoidentityprovider#TooManyFailedAttemptsException"
    | `TooManyRequestsException _ ->
        "com.amazonaws.cognitoidentityprovider#TooManyRequestsException"
    | `UnexpectedLambdaException _ ->
        "com.amazonaws.cognitoidentityprovider#UnexpectedLambdaException"
    | `UserLambdaValidationException _ ->
        "com.amazonaws.cognitoidentityprovider#UserLambdaValidationException"
    | `UserNotConfirmedException _ ->
        "com.amazonaws.cognitoidentityprovider#UserNotConfirmedException"
    | `UserNotFoundException _ -> "com.amazonaws.cognitoidentityprovider#UserNotFoundException"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "CodeMismatchException" ->
          `CodeMismatchException (Json_deserializers.code_mismatch_exception_of_yojson tree path)
      | _, "ExpiredCodeException" ->
          `ExpiredCodeException (Json_deserializers.expired_code_exception_of_yojson tree path)
      | _, "ForbiddenException" ->
          `ForbiddenException (Json_deserializers.forbidden_exception_of_yojson tree path)
      | _, "InternalErrorException" ->
          `InternalErrorException (Json_deserializers.internal_error_exception_of_yojson tree path)
      | _, "InvalidLambdaResponseException" ->
          `InvalidLambdaResponseException
            (Json_deserializers.invalid_lambda_response_exception_of_yojson tree path)
      | _, "InvalidParameterException" ->
          `InvalidParameterException
            (Json_deserializers.invalid_parameter_exception_of_yojson tree path)
      | _, "InvalidPasswordException" ->
          `InvalidPasswordException
            (Json_deserializers.invalid_password_exception_of_yojson tree path)
      | _, "LimitExceededException" ->
          `LimitExceededException (Json_deserializers.limit_exceeded_exception_of_yojson tree path)
      | _, "NotAuthorizedException" ->
          `NotAuthorizedException (Json_deserializers.not_authorized_exception_of_yojson tree path)
      | _, "OperationNotEnabledException" ->
          `OperationNotEnabledException
            (Json_deserializers.operation_not_enabled_exception_of_yojson tree path)
      | _, "PasswordHistoryPolicyViolationException" ->
          `PasswordHistoryPolicyViolationException
            (Json_deserializers.password_history_policy_violation_exception_of_yojson tree path)
      | _, "ResourceNotFoundException" ->
          `ResourceNotFoundException
            (Json_deserializers.resource_not_found_exception_of_yojson tree path)
      | _, "TooManyFailedAttemptsException" ->
          `TooManyFailedAttemptsException
            (Json_deserializers.too_many_failed_attempts_exception_of_yojson tree path)
      | _, "TooManyRequestsException" ->
          `TooManyRequestsException
            (Json_deserializers.too_many_requests_exception_of_yojson tree path)
      | _, "UnexpectedLambdaException" ->
          `UnexpectedLambdaException
            (Json_deserializers.unexpected_lambda_exception_of_yojson tree path)
      | _, "UserLambdaValidationException" ->
          `UserLambdaValidationException
            (Json_deserializers.user_lambda_validation_exception_of_yojson tree path)
      | _, "UserNotConfirmedException" ->
          `UserNotConfirmedException
            (Json_deserializers.user_not_confirmed_exception_of_yojson tree path)
      | _, "UserNotFoundException" ->
          `UserNotFoundException (Json_deserializers.user_not_found_exception_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : confirm_forgot_password_request) =
    let input = Json_serializers.confirm_forgot_password_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request
      ~shape_name:"AWSCognitoIdentityProviderService.ConfirmForgotPassword" ~service ~context ~input
      ~output_deserializer:Json_deserializers.confirm_forgot_password_response_of_yojson
      ~error_deserializer

  let request_with_metadata context (request : confirm_forgot_password_request) =
    let input = Json_serializers.confirm_forgot_password_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata
      ~shape_name:"AWSCognitoIdentityProviderService.ConfirmForgotPassword" ~service ~context ~input
      ~output_deserializer:Json_deserializers.confirm_forgot_password_response_of_yojson
      ~error_deserializer
end

module ConfirmSignUp = struct
  let error_to_string = function
    | `AliasExistsException _ -> "com.amazonaws.cognitoidentityprovider#AliasExistsException"
    | `CodeMismatchException _ -> "com.amazonaws.cognitoidentityprovider#CodeMismatchException"
    | `ExpiredCodeException _ -> "com.amazonaws.cognitoidentityprovider#ExpiredCodeException"
    | `ForbiddenException _ -> "com.amazonaws.cognitoidentityprovider#ForbiddenException"
    | `InternalErrorException _ -> "com.amazonaws.cognitoidentityprovider#InternalErrorException"
    | `InvalidLambdaResponseException _ ->
        "com.amazonaws.cognitoidentityprovider#InvalidLambdaResponseException"
    | `InvalidParameterException _ ->
        "com.amazonaws.cognitoidentityprovider#InvalidParameterException"
    | `LimitExceededException _ -> "com.amazonaws.cognitoidentityprovider#LimitExceededException"
    | `NotAuthorizedException _ -> "com.amazonaws.cognitoidentityprovider#NotAuthorizedException"
    | `OperationNotEnabledException _ ->
        "com.amazonaws.cognitoidentityprovider#OperationNotEnabledException"
    | `ResourceNotFoundException _ ->
        "com.amazonaws.cognitoidentityprovider#ResourceNotFoundException"
    | `TooManyFailedAttemptsException _ ->
        "com.amazonaws.cognitoidentityprovider#TooManyFailedAttemptsException"
    | `TooManyRequestsException _ ->
        "com.amazonaws.cognitoidentityprovider#TooManyRequestsException"
    | `UnexpectedLambdaException _ ->
        "com.amazonaws.cognitoidentityprovider#UnexpectedLambdaException"
    | `UserLambdaValidationException _ ->
        "com.amazonaws.cognitoidentityprovider#UserLambdaValidationException"
    | `UserNotFoundException _ -> "com.amazonaws.cognitoidentityprovider#UserNotFoundException"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "AliasExistsException" ->
          `AliasExistsException (Json_deserializers.alias_exists_exception_of_yojson tree path)
      | _, "CodeMismatchException" ->
          `CodeMismatchException (Json_deserializers.code_mismatch_exception_of_yojson tree path)
      | _, "ExpiredCodeException" ->
          `ExpiredCodeException (Json_deserializers.expired_code_exception_of_yojson tree path)
      | _, "ForbiddenException" ->
          `ForbiddenException (Json_deserializers.forbidden_exception_of_yojson tree path)
      | _, "InternalErrorException" ->
          `InternalErrorException (Json_deserializers.internal_error_exception_of_yojson tree path)
      | _, "InvalidLambdaResponseException" ->
          `InvalidLambdaResponseException
            (Json_deserializers.invalid_lambda_response_exception_of_yojson tree path)
      | _, "InvalidParameterException" ->
          `InvalidParameterException
            (Json_deserializers.invalid_parameter_exception_of_yojson tree path)
      | _, "LimitExceededException" ->
          `LimitExceededException (Json_deserializers.limit_exceeded_exception_of_yojson tree path)
      | _, "NotAuthorizedException" ->
          `NotAuthorizedException (Json_deserializers.not_authorized_exception_of_yojson tree path)
      | _, "OperationNotEnabledException" ->
          `OperationNotEnabledException
            (Json_deserializers.operation_not_enabled_exception_of_yojson tree path)
      | _, "ResourceNotFoundException" ->
          `ResourceNotFoundException
            (Json_deserializers.resource_not_found_exception_of_yojson tree path)
      | _, "TooManyFailedAttemptsException" ->
          `TooManyFailedAttemptsException
            (Json_deserializers.too_many_failed_attempts_exception_of_yojson tree path)
      | _, "TooManyRequestsException" ->
          `TooManyRequestsException
            (Json_deserializers.too_many_requests_exception_of_yojson tree path)
      | _, "UnexpectedLambdaException" ->
          `UnexpectedLambdaException
            (Json_deserializers.unexpected_lambda_exception_of_yojson tree path)
      | _, "UserLambdaValidationException" ->
          `UserLambdaValidationException
            (Json_deserializers.user_lambda_validation_exception_of_yojson tree path)
      | _, "UserNotFoundException" ->
          `UserNotFoundException (Json_deserializers.user_not_found_exception_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : confirm_sign_up_request) =
    let input = Json_serializers.confirm_sign_up_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request
      ~shape_name:"AWSCognitoIdentityProviderService.ConfirmSignUp" ~service ~context ~input
      ~output_deserializer:Json_deserializers.confirm_sign_up_response_of_yojson ~error_deserializer

  let request_with_metadata context (request : confirm_sign_up_request) =
    let input = Json_serializers.confirm_sign_up_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata
      ~shape_name:"AWSCognitoIdentityProviderService.ConfirmSignUp" ~service ~context ~input
      ~output_deserializer:Json_deserializers.confirm_sign_up_response_of_yojson ~error_deserializer
end

module CreateGroup = struct
  let error_to_string = function
    | `GroupExistsException _ -> "com.amazonaws.cognitoidentityprovider#GroupExistsException"
    | `InternalErrorException _ -> "com.amazonaws.cognitoidentityprovider#InternalErrorException"
    | `InvalidParameterException _ ->
        "com.amazonaws.cognitoidentityprovider#InvalidParameterException"
    | `LimitExceededException _ -> "com.amazonaws.cognitoidentityprovider#LimitExceededException"
    | `NotAuthorizedException _ -> "com.amazonaws.cognitoidentityprovider#NotAuthorizedException"
    | `OperationNotEnabledException _ ->
        "com.amazonaws.cognitoidentityprovider#OperationNotEnabledException"
    | `ResourceNotFoundException _ ->
        "com.amazonaws.cognitoidentityprovider#ResourceNotFoundException"
    | `TooManyRequestsException _ ->
        "com.amazonaws.cognitoidentityprovider#TooManyRequestsException"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "GroupExistsException" ->
          `GroupExistsException (Json_deserializers.group_exists_exception_of_yojson tree path)
      | _, "InternalErrorException" ->
          `InternalErrorException (Json_deserializers.internal_error_exception_of_yojson tree path)
      | _, "InvalidParameterException" ->
          `InvalidParameterException
            (Json_deserializers.invalid_parameter_exception_of_yojson tree path)
      | _, "LimitExceededException" ->
          `LimitExceededException (Json_deserializers.limit_exceeded_exception_of_yojson tree path)
      | _, "NotAuthorizedException" ->
          `NotAuthorizedException (Json_deserializers.not_authorized_exception_of_yojson tree path)
      | _, "OperationNotEnabledException" ->
          `OperationNotEnabledException
            (Json_deserializers.operation_not_enabled_exception_of_yojson tree path)
      | _, "ResourceNotFoundException" ->
          `ResourceNotFoundException
            (Json_deserializers.resource_not_found_exception_of_yojson tree path)
      | _, "TooManyRequestsException" ->
          `TooManyRequestsException
            (Json_deserializers.too_many_requests_exception_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : create_group_request) =
    let input = Json_serializers.create_group_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"AWSCognitoIdentityProviderService.CreateGroup"
      ~service ~context ~input
      ~output_deserializer:Json_deserializers.create_group_response_of_yojson ~error_deserializer

  let request_with_metadata context (request : create_group_request) =
    let input = Json_serializers.create_group_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata
      ~shape_name:"AWSCognitoIdentityProviderService.CreateGroup" ~service ~context ~input
      ~output_deserializer:Json_deserializers.create_group_response_of_yojson ~error_deserializer
end

module CreateIdentityProvider = struct
  let error_to_string = function
    | `DuplicateProviderException _ ->
        "com.amazonaws.cognitoidentityprovider#DuplicateProviderException"
    | `InternalErrorException _ -> "com.amazonaws.cognitoidentityprovider#InternalErrorException"
    | `InvalidParameterException _ ->
        "com.amazonaws.cognitoidentityprovider#InvalidParameterException"
    | `LimitExceededException _ -> "com.amazonaws.cognitoidentityprovider#LimitExceededException"
    | `NotAuthorizedException _ -> "com.amazonaws.cognitoidentityprovider#NotAuthorizedException"
    | `ResourceNotFoundException _ ->
        "com.amazonaws.cognitoidentityprovider#ResourceNotFoundException"
    | `TooManyRequestsException _ ->
        "com.amazonaws.cognitoidentityprovider#TooManyRequestsException"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "DuplicateProviderException" ->
          `DuplicateProviderException
            (Json_deserializers.duplicate_provider_exception_of_yojson tree path)
      | _, "InternalErrorException" ->
          `InternalErrorException (Json_deserializers.internal_error_exception_of_yojson tree path)
      | _, "InvalidParameterException" ->
          `InvalidParameterException
            (Json_deserializers.invalid_parameter_exception_of_yojson tree path)
      | _, "LimitExceededException" ->
          `LimitExceededException (Json_deserializers.limit_exceeded_exception_of_yojson tree path)
      | _, "NotAuthorizedException" ->
          `NotAuthorizedException (Json_deserializers.not_authorized_exception_of_yojson tree path)
      | _, "ResourceNotFoundException" ->
          `ResourceNotFoundException
            (Json_deserializers.resource_not_found_exception_of_yojson tree path)
      | _, "TooManyRequestsException" ->
          `TooManyRequestsException
            (Json_deserializers.too_many_requests_exception_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : create_identity_provider_request) =
    let input = Json_serializers.create_identity_provider_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request
      ~shape_name:"AWSCognitoIdentityProviderService.CreateIdentityProvider" ~service ~context
      ~input ~output_deserializer:Json_deserializers.create_identity_provider_response_of_yojson
      ~error_deserializer

  let request_with_metadata context (request : create_identity_provider_request) =
    let input = Json_serializers.create_identity_provider_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata
      ~shape_name:"AWSCognitoIdentityProviderService.CreateIdentityProvider" ~service ~context
      ~input ~output_deserializer:Json_deserializers.create_identity_provider_response_of_yojson
      ~error_deserializer
end

module CreateManagedLoginBranding = struct
  let error_to_string = function
    | `ConcurrentModificationException _ ->
        "com.amazonaws.cognitoidentityprovider#ConcurrentModificationException"
    | `InternalErrorException _ -> "com.amazonaws.cognitoidentityprovider#InternalErrorException"
    | `InvalidParameterException _ ->
        "com.amazonaws.cognitoidentityprovider#InvalidParameterException"
    | `LimitExceededException _ -> "com.amazonaws.cognitoidentityprovider#LimitExceededException"
    | `ManagedLoginBrandingExistsException _ ->
        "com.amazonaws.cognitoidentityprovider#ManagedLoginBrandingExistsException"
    | `NotAuthorizedException _ -> "com.amazonaws.cognitoidentityprovider#NotAuthorizedException"
    | `OperationNotEnabledException _ ->
        "com.amazonaws.cognitoidentityprovider#OperationNotEnabledException"
    | `ResourceNotFoundException _ ->
        "com.amazonaws.cognitoidentityprovider#ResourceNotFoundException"
    | `TooManyRequestsException _ ->
        "com.amazonaws.cognitoidentityprovider#TooManyRequestsException"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "ConcurrentModificationException" ->
          `ConcurrentModificationException
            (Json_deserializers.concurrent_modification_exception_of_yojson tree path)
      | _, "InternalErrorException" ->
          `InternalErrorException (Json_deserializers.internal_error_exception_of_yojson tree path)
      | _, "InvalidParameterException" ->
          `InvalidParameterException
            (Json_deserializers.invalid_parameter_exception_of_yojson tree path)
      | _, "LimitExceededException" ->
          `LimitExceededException (Json_deserializers.limit_exceeded_exception_of_yojson tree path)
      | _, "ManagedLoginBrandingExistsException" ->
          `ManagedLoginBrandingExistsException
            (Json_deserializers.managed_login_branding_exists_exception_of_yojson tree path)
      | _, "NotAuthorizedException" ->
          `NotAuthorizedException (Json_deserializers.not_authorized_exception_of_yojson tree path)
      | _, "OperationNotEnabledException" ->
          `OperationNotEnabledException
            (Json_deserializers.operation_not_enabled_exception_of_yojson tree path)
      | _, "ResourceNotFoundException" ->
          `ResourceNotFoundException
            (Json_deserializers.resource_not_found_exception_of_yojson tree path)
      | _, "TooManyRequestsException" ->
          `TooManyRequestsException
            (Json_deserializers.too_many_requests_exception_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : create_managed_login_branding_request) =
    let input = Json_serializers.create_managed_login_branding_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request
      ~shape_name:"AWSCognitoIdentityProviderService.CreateManagedLoginBranding" ~service ~context
      ~input
      ~output_deserializer:Json_deserializers.create_managed_login_branding_response_of_yojson
      ~error_deserializer

  let request_with_metadata context (request : create_managed_login_branding_request) =
    let input = Json_serializers.create_managed_login_branding_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata
      ~shape_name:"AWSCognitoIdentityProviderService.CreateManagedLoginBranding" ~service ~context
      ~input
      ~output_deserializer:Json_deserializers.create_managed_login_branding_response_of_yojson
      ~error_deserializer
end

module CreateResourceServer = struct
  let error_to_string = function
    | `InternalErrorException _ -> "com.amazonaws.cognitoidentityprovider#InternalErrorException"
    | `InvalidParameterException _ ->
        "com.amazonaws.cognitoidentityprovider#InvalidParameterException"
    | `LimitExceededException _ -> "com.amazonaws.cognitoidentityprovider#LimitExceededException"
    | `NotAuthorizedException _ -> "com.amazonaws.cognitoidentityprovider#NotAuthorizedException"
    | `OperationNotEnabledException _ ->
        "com.amazonaws.cognitoidentityprovider#OperationNotEnabledException"
    | `ResourceNotFoundException _ ->
        "com.amazonaws.cognitoidentityprovider#ResourceNotFoundException"
    | `TooManyRequestsException _ ->
        "com.amazonaws.cognitoidentityprovider#TooManyRequestsException"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "InternalErrorException" ->
          `InternalErrorException (Json_deserializers.internal_error_exception_of_yojson tree path)
      | _, "InvalidParameterException" ->
          `InvalidParameterException
            (Json_deserializers.invalid_parameter_exception_of_yojson tree path)
      | _, "LimitExceededException" ->
          `LimitExceededException (Json_deserializers.limit_exceeded_exception_of_yojson tree path)
      | _, "NotAuthorizedException" ->
          `NotAuthorizedException (Json_deserializers.not_authorized_exception_of_yojson tree path)
      | _, "OperationNotEnabledException" ->
          `OperationNotEnabledException
            (Json_deserializers.operation_not_enabled_exception_of_yojson tree path)
      | _, "ResourceNotFoundException" ->
          `ResourceNotFoundException
            (Json_deserializers.resource_not_found_exception_of_yojson tree path)
      | _, "TooManyRequestsException" ->
          `TooManyRequestsException
            (Json_deserializers.too_many_requests_exception_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : create_resource_server_request) =
    let input = Json_serializers.create_resource_server_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request
      ~shape_name:"AWSCognitoIdentityProviderService.CreateResourceServer" ~service ~context ~input
      ~output_deserializer:Json_deserializers.create_resource_server_response_of_yojson
      ~error_deserializer

  let request_with_metadata context (request : create_resource_server_request) =
    let input = Json_serializers.create_resource_server_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata
      ~shape_name:"AWSCognitoIdentityProviderService.CreateResourceServer" ~service ~context ~input
      ~output_deserializer:Json_deserializers.create_resource_server_response_of_yojson
      ~error_deserializer
end

module CreateTerms = struct
  let error_to_string = function
    | `ConcurrentModificationException _ ->
        "com.amazonaws.cognitoidentityprovider#ConcurrentModificationException"
    | `InternalErrorException _ -> "com.amazonaws.cognitoidentityprovider#InternalErrorException"
    | `InvalidParameterException _ ->
        "com.amazonaws.cognitoidentityprovider#InvalidParameterException"
    | `LimitExceededException _ -> "com.amazonaws.cognitoidentityprovider#LimitExceededException"
    | `NotAuthorizedException _ -> "com.amazonaws.cognitoidentityprovider#NotAuthorizedException"
    | `OperationNotEnabledException _ ->
        "com.amazonaws.cognitoidentityprovider#OperationNotEnabledException"
    | `ResourceNotFoundException _ ->
        "com.amazonaws.cognitoidentityprovider#ResourceNotFoundException"
    | `TermsExistsException _ -> "com.amazonaws.cognitoidentityprovider#TermsExistsException"
    | `TooManyRequestsException _ ->
        "com.amazonaws.cognitoidentityprovider#TooManyRequestsException"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "ConcurrentModificationException" ->
          `ConcurrentModificationException
            (Json_deserializers.concurrent_modification_exception_of_yojson tree path)
      | _, "InternalErrorException" ->
          `InternalErrorException (Json_deserializers.internal_error_exception_of_yojson tree path)
      | _, "InvalidParameterException" ->
          `InvalidParameterException
            (Json_deserializers.invalid_parameter_exception_of_yojson tree path)
      | _, "LimitExceededException" ->
          `LimitExceededException (Json_deserializers.limit_exceeded_exception_of_yojson tree path)
      | _, "NotAuthorizedException" ->
          `NotAuthorizedException (Json_deserializers.not_authorized_exception_of_yojson tree path)
      | _, "OperationNotEnabledException" ->
          `OperationNotEnabledException
            (Json_deserializers.operation_not_enabled_exception_of_yojson tree path)
      | _, "ResourceNotFoundException" ->
          `ResourceNotFoundException
            (Json_deserializers.resource_not_found_exception_of_yojson tree path)
      | _, "TermsExistsException" ->
          `TermsExistsException (Json_deserializers.terms_exists_exception_of_yojson tree path)
      | _, "TooManyRequestsException" ->
          `TooManyRequestsException
            (Json_deserializers.too_many_requests_exception_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : create_terms_request) =
    let input = Json_serializers.create_terms_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"AWSCognitoIdentityProviderService.CreateTerms"
      ~service ~context ~input
      ~output_deserializer:Json_deserializers.create_terms_response_of_yojson ~error_deserializer

  let request_with_metadata context (request : create_terms_request) =
    let input = Json_serializers.create_terms_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata
      ~shape_name:"AWSCognitoIdentityProviderService.CreateTerms" ~service ~context ~input
      ~output_deserializer:Json_deserializers.create_terms_response_of_yojson ~error_deserializer
end

module CreateUserImportJob = struct
  let error_to_string = function
    | `InternalErrorException _ -> "com.amazonaws.cognitoidentityprovider#InternalErrorException"
    | `InvalidParameterException _ ->
        "com.amazonaws.cognitoidentityprovider#InvalidParameterException"
    | `LimitExceededException _ -> "com.amazonaws.cognitoidentityprovider#LimitExceededException"
    | `NotAuthorizedException _ -> "com.amazonaws.cognitoidentityprovider#NotAuthorizedException"
    | `OperationNotEnabledException _ ->
        "com.amazonaws.cognitoidentityprovider#OperationNotEnabledException"
    | `PreconditionNotMetException _ ->
        "com.amazonaws.cognitoidentityprovider#PreconditionNotMetException"
    | `ResourceNotFoundException _ ->
        "com.amazonaws.cognitoidentityprovider#ResourceNotFoundException"
    | `TooManyRequestsException _ ->
        "com.amazonaws.cognitoidentityprovider#TooManyRequestsException"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "InternalErrorException" ->
          `InternalErrorException (Json_deserializers.internal_error_exception_of_yojson tree path)
      | _, "InvalidParameterException" ->
          `InvalidParameterException
            (Json_deserializers.invalid_parameter_exception_of_yojson tree path)
      | _, "LimitExceededException" ->
          `LimitExceededException (Json_deserializers.limit_exceeded_exception_of_yojson tree path)
      | _, "NotAuthorizedException" ->
          `NotAuthorizedException (Json_deserializers.not_authorized_exception_of_yojson tree path)
      | _, "OperationNotEnabledException" ->
          `OperationNotEnabledException
            (Json_deserializers.operation_not_enabled_exception_of_yojson tree path)
      | _, "PreconditionNotMetException" ->
          `PreconditionNotMetException
            (Json_deserializers.precondition_not_met_exception_of_yojson tree path)
      | _, "ResourceNotFoundException" ->
          `ResourceNotFoundException
            (Json_deserializers.resource_not_found_exception_of_yojson tree path)
      | _, "TooManyRequestsException" ->
          `TooManyRequestsException
            (Json_deserializers.too_many_requests_exception_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : create_user_import_job_request) =
    let input = Json_serializers.create_user_import_job_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request
      ~shape_name:"AWSCognitoIdentityProviderService.CreateUserImportJob" ~service ~context ~input
      ~output_deserializer:Json_deserializers.create_user_import_job_response_of_yojson
      ~error_deserializer

  let request_with_metadata context (request : create_user_import_job_request) =
    let input = Json_serializers.create_user_import_job_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata
      ~shape_name:"AWSCognitoIdentityProviderService.CreateUserImportJob" ~service ~context ~input
      ~output_deserializer:Json_deserializers.create_user_import_job_response_of_yojson
      ~error_deserializer
end

module CreateUserPool = struct
  let error_to_string = function
    | `FeatureUnavailableInTierException _ ->
        "com.amazonaws.cognitoidentityprovider#FeatureUnavailableInTierException"
    | `InternalErrorException _ -> "com.amazonaws.cognitoidentityprovider#InternalErrorException"
    | `InvalidEmailRoleAccessPolicyException _ ->
        "com.amazonaws.cognitoidentityprovider#InvalidEmailRoleAccessPolicyException"
    | `InvalidParameterException _ ->
        "com.amazonaws.cognitoidentityprovider#InvalidParameterException"
    | `InvalidSmsRoleAccessPolicyException _ ->
        "com.amazonaws.cognitoidentityprovider#InvalidSmsRoleAccessPolicyException"
    | `InvalidSmsRoleTrustRelationshipException _ ->
        "com.amazonaws.cognitoidentityprovider#InvalidSmsRoleTrustRelationshipException"
    | `LimitExceededException _ -> "com.amazonaws.cognitoidentityprovider#LimitExceededException"
    | `NotAuthorizedException _ -> "com.amazonaws.cognitoidentityprovider#NotAuthorizedException"
    | `TierChangeNotAllowedException _ ->
        "com.amazonaws.cognitoidentityprovider#TierChangeNotAllowedException"
    | `TooManyRequestsException _ ->
        "com.amazonaws.cognitoidentityprovider#TooManyRequestsException"
    | `UserPoolTaggingException _ ->
        "com.amazonaws.cognitoidentityprovider#UserPoolTaggingException"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "FeatureUnavailableInTierException" ->
          `FeatureUnavailableInTierException
            (Json_deserializers.feature_unavailable_in_tier_exception_of_yojson tree path)
      | _, "InternalErrorException" ->
          `InternalErrorException (Json_deserializers.internal_error_exception_of_yojson tree path)
      | _, "InvalidEmailRoleAccessPolicyException" ->
          `InvalidEmailRoleAccessPolicyException
            (Json_deserializers.invalid_email_role_access_policy_exception_of_yojson tree path)
      | _, "InvalidParameterException" ->
          `InvalidParameterException
            (Json_deserializers.invalid_parameter_exception_of_yojson tree path)
      | _, "InvalidSmsRoleAccessPolicyException" ->
          `InvalidSmsRoleAccessPolicyException
            (Json_deserializers.invalid_sms_role_access_policy_exception_of_yojson tree path)
      | _, "InvalidSmsRoleTrustRelationshipException" ->
          `InvalidSmsRoleTrustRelationshipException
            (Json_deserializers.invalid_sms_role_trust_relationship_exception_of_yojson tree path)
      | _, "LimitExceededException" ->
          `LimitExceededException (Json_deserializers.limit_exceeded_exception_of_yojson tree path)
      | _, "NotAuthorizedException" ->
          `NotAuthorizedException (Json_deserializers.not_authorized_exception_of_yojson tree path)
      | _, "TierChangeNotAllowedException" ->
          `TierChangeNotAllowedException
            (Json_deserializers.tier_change_not_allowed_exception_of_yojson tree path)
      | _, "TooManyRequestsException" ->
          `TooManyRequestsException
            (Json_deserializers.too_many_requests_exception_of_yojson tree path)
      | _, "UserPoolTaggingException" ->
          `UserPoolTaggingException
            (Json_deserializers.user_pool_tagging_exception_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : create_user_pool_request) =
    let input = Json_serializers.create_user_pool_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request
      ~shape_name:"AWSCognitoIdentityProviderService.CreateUserPool" ~service ~context ~input
      ~output_deserializer:Json_deserializers.create_user_pool_response_of_yojson
      ~error_deserializer

  let request_with_metadata context (request : create_user_pool_request) =
    let input = Json_serializers.create_user_pool_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata
      ~shape_name:"AWSCognitoIdentityProviderService.CreateUserPool" ~service ~context ~input
      ~output_deserializer:Json_deserializers.create_user_pool_response_of_yojson
      ~error_deserializer
end

module CreateUserPoolClient = struct
  let error_to_string = function
    | `FeatureUnavailableInTierException _ ->
        "com.amazonaws.cognitoidentityprovider#FeatureUnavailableInTierException"
    | `InternalErrorException _ -> "com.amazonaws.cognitoidentityprovider#InternalErrorException"
    | `InvalidOAuthFlowException _ ->
        "com.amazonaws.cognitoidentityprovider#InvalidOAuthFlowException"
    | `InvalidParameterException _ ->
        "com.amazonaws.cognitoidentityprovider#InvalidParameterException"
    | `LimitExceededException _ -> "com.amazonaws.cognitoidentityprovider#LimitExceededException"
    | `NotAuthorizedException _ -> "com.amazonaws.cognitoidentityprovider#NotAuthorizedException"
    | `OperationNotEnabledException _ ->
        "com.amazonaws.cognitoidentityprovider#OperationNotEnabledException"
    | `ResourceNotFoundException _ ->
        "com.amazonaws.cognitoidentityprovider#ResourceNotFoundException"
    | `ScopeDoesNotExistException _ ->
        "com.amazonaws.cognitoidentityprovider#ScopeDoesNotExistException"
    | `TooManyRequestsException _ ->
        "com.amazonaws.cognitoidentityprovider#TooManyRequestsException"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "FeatureUnavailableInTierException" ->
          `FeatureUnavailableInTierException
            (Json_deserializers.feature_unavailable_in_tier_exception_of_yojson tree path)
      | _, "InternalErrorException" ->
          `InternalErrorException (Json_deserializers.internal_error_exception_of_yojson tree path)
      | _, "InvalidOAuthFlowException" ->
          `InvalidOAuthFlowException
            (Json_deserializers.invalid_o_auth_flow_exception_of_yojson tree path)
      | _, "InvalidParameterException" ->
          `InvalidParameterException
            (Json_deserializers.invalid_parameter_exception_of_yojson tree path)
      | _, "LimitExceededException" ->
          `LimitExceededException (Json_deserializers.limit_exceeded_exception_of_yojson tree path)
      | _, "NotAuthorizedException" ->
          `NotAuthorizedException (Json_deserializers.not_authorized_exception_of_yojson tree path)
      | _, "OperationNotEnabledException" ->
          `OperationNotEnabledException
            (Json_deserializers.operation_not_enabled_exception_of_yojson tree path)
      | _, "ResourceNotFoundException" ->
          `ResourceNotFoundException
            (Json_deserializers.resource_not_found_exception_of_yojson tree path)
      | _, "ScopeDoesNotExistException" ->
          `ScopeDoesNotExistException
            (Json_deserializers.scope_does_not_exist_exception_of_yojson tree path)
      | _, "TooManyRequestsException" ->
          `TooManyRequestsException
            (Json_deserializers.too_many_requests_exception_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : create_user_pool_client_request) =
    let input = Json_serializers.create_user_pool_client_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request
      ~shape_name:"AWSCognitoIdentityProviderService.CreateUserPoolClient" ~service ~context ~input
      ~output_deserializer:Json_deserializers.create_user_pool_client_response_of_yojson
      ~error_deserializer

  let request_with_metadata context (request : create_user_pool_client_request) =
    let input = Json_serializers.create_user_pool_client_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata
      ~shape_name:"AWSCognitoIdentityProviderService.CreateUserPoolClient" ~service ~context ~input
      ~output_deserializer:Json_deserializers.create_user_pool_client_response_of_yojson
      ~error_deserializer
end

module CreateUserPoolDomain = struct
  let error_to_string = function
    | `ConcurrentModificationException _ ->
        "com.amazonaws.cognitoidentityprovider#ConcurrentModificationException"
    | `FeatureUnavailableInTierException _ ->
        "com.amazonaws.cognitoidentityprovider#FeatureUnavailableInTierException"
    | `InternalErrorException _ -> "com.amazonaws.cognitoidentityprovider#InternalErrorException"
    | `InvalidParameterException _ ->
        "com.amazonaws.cognitoidentityprovider#InvalidParameterException"
    | `LimitExceededException _ -> "com.amazonaws.cognitoidentityprovider#LimitExceededException"
    | `NotAuthorizedException _ -> "com.amazonaws.cognitoidentityprovider#NotAuthorizedException"
    | `OperationNotEnabledException _ ->
        "com.amazonaws.cognitoidentityprovider#OperationNotEnabledException"
    | `ResourceNotFoundException _ ->
        "com.amazonaws.cognitoidentityprovider#ResourceNotFoundException"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "ConcurrentModificationException" ->
          `ConcurrentModificationException
            (Json_deserializers.concurrent_modification_exception_of_yojson tree path)
      | _, "FeatureUnavailableInTierException" ->
          `FeatureUnavailableInTierException
            (Json_deserializers.feature_unavailable_in_tier_exception_of_yojson tree path)
      | _, "InternalErrorException" ->
          `InternalErrorException (Json_deserializers.internal_error_exception_of_yojson tree path)
      | _, "InvalidParameterException" ->
          `InvalidParameterException
            (Json_deserializers.invalid_parameter_exception_of_yojson tree path)
      | _, "LimitExceededException" ->
          `LimitExceededException (Json_deserializers.limit_exceeded_exception_of_yojson tree path)
      | _, "NotAuthorizedException" ->
          `NotAuthorizedException (Json_deserializers.not_authorized_exception_of_yojson tree path)
      | _, "OperationNotEnabledException" ->
          `OperationNotEnabledException
            (Json_deserializers.operation_not_enabled_exception_of_yojson tree path)
      | _, "ResourceNotFoundException" ->
          `ResourceNotFoundException
            (Json_deserializers.resource_not_found_exception_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : create_user_pool_domain_request) =
    let input = Json_serializers.create_user_pool_domain_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request
      ~shape_name:"AWSCognitoIdentityProviderService.CreateUserPoolDomain" ~service ~context ~input
      ~output_deserializer:Json_deserializers.create_user_pool_domain_response_of_yojson
      ~error_deserializer

  let request_with_metadata context (request : create_user_pool_domain_request) =
    let input = Json_serializers.create_user_pool_domain_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata
      ~shape_name:"AWSCognitoIdentityProviderService.CreateUserPoolDomain" ~service ~context ~input
      ~output_deserializer:Json_deserializers.create_user_pool_domain_response_of_yojson
      ~error_deserializer
end

module CreateUserPoolReplica = struct
  let error_to_string = function
    | `FeatureUnavailableInTierException _ ->
        "com.amazonaws.cognitoidentityprovider#FeatureUnavailableInTierException"
    | `InternalErrorException _ -> "com.amazonaws.cognitoidentityprovider#InternalErrorException"
    | `InvalidParameterException _ ->
        "com.amazonaws.cognitoidentityprovider#InvalidParameterException"
    | `LimitExceededException _ -> "com.amazonaws.cognitoidentityprovider#LimitExceededException"
    | `NotAuthorizedException _ -> "com.amazonaws.cognitoidentityprovider#NotAuthorizedException"
    | `OperationNotEnabledException _ ->
        "com.amazonaws.cognitoidentityprovider#OperationNotEnabledException"
    | `ResourceNotFoundException _ ->
        "com.amazonaws.cognitoidentityprovider#ResourceNotFoundException"
    | `TooManyRequestsException _ ->
        "com.amazonaws.cognitoidentityprovider#TooManyRequestsException"
    | `UserPoolTaggingException _ ->
        "com.amazonaws.cognitoidentityprovider#UserPoolTaggingException"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "FeatureUnavailableInTierException" ->
          `FeatureUnavailableInTierException
            (Json_deserializers.feature_unavailable_in_tier_exception_of_yojson tree path)
      | _, "InternalErrorException" ->
          `InternalErrorException (Json_deserializers.internal_error_exception_of_yojson tree path)
      | _, "InvalidParameterException" ->
          `InvalidParameterException
            (Json_deserializers.invalid_parameter_exception_of_yojson tree path)
      | _, "LimitExceededException" ->
          `LimitExceededException (Json_deserializers.limit_exceeded_exception_of_yojson tree path)
      | _, "NotAuthorizedException" ->
          `NotAuthorizedException (Json_deserializers.not_authorized_exception_of_yojson tree path)
      | _, "OperationNotEnabledException" ->
          `OperationNotEnabledException
            (Json_deserializers.operation_not_enabled_exception_of_yojson tree path)
      | _, "ResourceNotFoundException" ->
          `ResourceNotFoundException
            (Json_deserializers.resource_not_found_exception_of_yojson tree path)
      | _, "TooManyRequestsException" ->
          `TooManyRequestsException
            (Json_deserializers.too_many_requests_exception_of_yojson tree path)
      | _, "UserPoolTaggingException" ->
          `UserPoolTaggingException
            (Json_deserializers.user_pool_tagging_exception_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : create_user_pool_replica_request) =
    let input = Json_serializers.create_user_pool_replica_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request
      ~shape_name:"AWSCognitoIdentityProviderService.CreateUserPoolReplica" ~service ~context ~input
      ~output_deserializer:Json_deserializers.create_user_pool_replica_response_of_yojson
      ~error_deserializer

  let request_with_metadata context (request : create_user_pool_replica_request) =
    let input = Json_serializers.create_user_pool_replica_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata
      ~shape_name:"AWSCognitoIdentityProviderService.CreateUserPoolReplica" ~service ~context ~input
      ~output_deserializer:Json_deserializers.create_user_pool_replica_response_of_yojson
      ~error_deserializer
end

module DeleteGroup = struct
  let error_to_string = function
    | `InternalErrorException _ -> "com.amazonaws.cognitoidentityprovider#InternalErrorException"
    | `InvalidParameterException _ ->
        "com.amazonaws.cognitoidentityprovider#InvalidParameterException"
    | `NotAuthorizedException _ -> "com.amazonaws.cognitoidentityprovider#NotAuthorizedException"
    | `OperationNotEnabledException _ ->
        "com.amazonaws.cognitoidentityprovider#OperationNotEnabledException"
    | `ResourceNotFoundException _ ->
        "com.amazonaws.cognitoidentityprovider#ResourceNotFoundException"
    | `TooManyRequestsException _ ->
        "com.amazonaws.cognitoidentityprovider#TooManyRequestsException"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "InternalErrorException" ->
          `InternalErrorException (Json_deserializers.internal_error_exception_of_yojson tree path)
      | _, "InvalidParameterException" ->
          `InvalidParameterException
            (Json_deserializers.invalid_parameter_exception_of_yojson tree path)
      | _, "NotAuthorizedException" ->
          `NotAuthorizedException (Json_deserializers.not_authorized_exception_of_yojson tree path)
      | _, "OperationNotEnabledException" ->
          `OperationNotEnabledException
            (Json_deserializers.operation_not_enabled_exception_of_yojson tree path)
      | _, "ResourceNotFoundException" ->
          `ResourceNotFoundException
            (Json_deserializers.resource_not_found_exception_of_yojson tree path)
      | _, "TooManyRequestsException" ->
          `TooManyRequestsException
            (Json_deserializers.too_many_requests_exception_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : delete_group_request) =
    let input = Json_serializers.delete_group_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"AWSCognitoIdentityProviderService.DeleteGroup"
      ~service ~context ~input
      ~output_deserializer:Smaws_Lib.Smithy_api.Json_deserializers.unit__of_yojson
      ~error_deserializer

  let request_with_metadata context (request : delete_group_request) =
    let input = Json_serializers.delete_group_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata
      ~shape_name:"AWSCognitoIdentityProviderService.DeleteGroup" ~service ~context ~input
      ~output_deserializer:Smaws_Lib.Smithy_api.Json_deserializers.unit__of_yojson
      ~error_deserializer
end

module DeleteIdentityProvider = struct
  let error_to_string = function
    | `ConcurrentModificationException _ ->
        "com.amazonaws.cognitoidentityprovider#ConcurrentModificationException"
    | `InternalErrorException _ -> "com.amazonaws.cognitoidentityprovider#InternalErrorException"
    | `InvalidParameterException _ ->
        "com.amazonaws.cognitoidentityprovider#InvalidParameterException"
    | `NotAuthorizedException _ -> "com.amazonaws.cognitoidentityprovider#NotAuthorizedException"
    | `ResourceNotFoundException _ ->
        "com.amazonaws.cognitoidentityprovider#ResourceNotFoundException"
    | `TooManyRequestsException _ ->
        "com.amazonaws.cognitoidentityprovider#TooManyRequestsException"
    | `UnsupportedIdentityProviderException _ ->
        "com.amazonaws.cognitoidentityprovider#UnsupportedIdentityProviderException"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "ConcurrentModificationException" ->
          `ConcurrentModificationException
            (Json_deserializers.concurrent_modification_exception_of_yojson tree path)
      | _, "InternalErrorException" ->
          `InternalErrorException (Json_deserializers.internal_error_exception_of_yojson tree path)
      | _, "InvalidParameterException" ->
          `InvalidParameterException
            (Json_deserializers.invalid_parameter_exception_of_yojson tree path)
      | _, "NotAuthorizedException" ->
          `NotAuthorizedException (Json_deserializers.not_authorized_exception_of_yojson tree path)
      | _, "ResourceNotFoundException" ->
          `ResourceNotFoundException
            (Json_deserializers.resource_not_found_exception_of_yojson tree path)
      | _, "TooManyRequestsException" ->
          `TooManyRequestsException
            (Json_deserializers.too_many_requests_exception_of_yojson tree path)
      | _, "UnsupportedIdentityProviderException" ->
          `UnsupportedIdentityProviderException
            (Json_deserializers.unsupported_identity_provider_exception_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : delete_identity_provider_request) =
    let input = Json_serializers.delete_identity_provider_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request
      ~shape_name:"AWSCognitoIdentityProviderService.DeleteIdentityProvider" ~service ~context
      ~input ~output_deserializer:Smaws_Lib.Smithy_api.Json_deserializers.unit__of_yojson
      ~error_deserializer

  let request_with_metadata context (request : delete_identity_provider_request) =
    let input = Json_serializers.delete_identity_provider_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata
      ~shape_name:"AWSCognitoIdentityProviderService.DeleteIdentityProvider" ~service ~context
      ~input ~output_deserializer:Smaws_Lib.Smithy_api.Json_deserializers.unit__of_yojson
      ~error_deserializer
end

module DeleteManagedLoginBranding = struct
  let error_to_string = function
    | `ConcurrentModificationException _ ->
        "com.amazonaws.cognitoidentityprovider#ConcurrentModificationException"
    | `InternalErrorException _ -> "com.amazonaws.cognitoidentityprovider#InternalErrorException"
    | `InvalidParameterException _ ->
        "com.amazonaws.cognitoidentityprovider#InvalidParameterException"
    | `NotAuthorizedException _ -> "com.amazonaws.cognitoidentityprovider#NotAuthorizedException"
    | `OperationNotEnabledException _ ->
        "com.amazonaws.cognitoidentityprovider#OperationNotEnabledException"
    | `ResourceNotFoundException _ ->
        "com.amazonaws.cognitoidentityprovider#ResourceNotFoundException"
    | `TooManyRequestsException _ ->
        "com.amazonaws.cognitoidentityprovider#TooManyRequestsException"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "ConcurrentModificationException" ->
          `ConcurrentModificationException
            (Json_deserializers.concurrent_modification_exception_of_yojson tree path)
      | _, "InternalErrorException" ->
          `InternalErrorException (Json_deserializers.internal_error_exception_of_yojson tree path)
      | _, "InvalidParameterException" ->
          `InvalidParameterException
            (Json_deserializers.invalid_parameter_exception_of_yojson tree path)
      | _, "NotAuthorizedException" ->
          `NotAuthorizedException (Json_deserializers.not_authorized_exception_of_yojson tree path)
      | _, "OperationNotEnabledException" ->
          `OperationNotEnabledException
            (Json_deserializers.operation_not_enabled_exception_of_yojson tree path)
      | _, "ResourceNotFoundException" ->
          `ResourceNotFoundException
            (Json_deserializers.resource_not_found_exception_of_yojson tree path)
      | _, "TooManyRequestsException" ->
          `TooManyRequestsException
            (Json_deserializers.too_many_requests_exception_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : delete_managed_login_branding_request) =
    let input = Json_serializers.delete_managed_login_branding_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request
      ~shape_name:"AWSCognitoIdentityProviderService.DeleteManagedLoginBranding" ~service ~context
      ~input ~output_deserializer:Smaws_Lib.Smithy_api.Json_deserializers.unit__of_yojson
      ~error_deserializer

  let request_with_metadata context (request : delete_managed_login_branding_request) =
    let input = Json_serializers.delete_managed_login_branding_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata
      ~shape_name:"AWSCognitoIdentityProviderService.DeleteManagedLoginBranding" ~service ~context
      ~input ~output_deserializer:Smaws_Lib.Smithy_api.Json_deserializers.unit__of_yojson
      ~error_deserializer
end

module DeleteResourceServer = struct
  let error_to_string = function
    | `InternalErrorException _ -> "com.amazonaws.cognitoidentityprovider#InternalErrorException"
    | `InvalidParameterException _ ->
        "com.amazonaws.cognitoidentityprovider#InvalidParameterException"
    | `NotAuthorizedException _ -> "com.amazonaws.cognitoidentityprovider#NotAuthorizedException"
    | `OperationNotEnabledException _ ->
        "com.amazonaws.cognitoidentityprovider#OperationNotEnabledException"
    | `ResourceNotFoundException _ ->
        "com.amazonaws.cognitoidentityprovider#ResourceNotFoundException"
    | `TooManyRequestsException _ ->
        "com.amazonaws.cognitoidentityprovider#TooManyRequestsException"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "InternalErrorException" ->
          `InternalErrorException (Json_deserializers.internal_error_exception_of_yojson tree path)
      | _, "InvalidParameterException" ->
          `InvalidParameterException
            (Json_deserializers.invalid_parameter_exception_of_yojson tree path)
      | _, "NotAuthorizedException" ->
          `NotAuthorizedException (Json_deserializers.not_authorized_exception_of_yojson tree path)
      | _, "OperationNotEnabledException" ->
          `OperationNotEnabledException
            (Json_deserializers.operation_not_enabled_exception_of_yojson tree path)
      | _, "ResourceNotFoundException" ->
          `ResourceNotFoundException
            (Json_deserializers.resource_not_found_exception_of_yojson tree path)
      | _, "TooManyRequestsException" ->
          `TooManyRequestsException
            (Json_deserializers.too_many_requests_exception_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : delete_resource_server_request) =
    let input = Json_serializers.delete_resource_server_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request
      ~shape_name:"AWSCognitoIdentityProviderService.DeleteResourceServer" ~service ~context ~input
      ~output_deserializer:Smaws_Lib.Smithy_api.Json_deserializers.unit__of_yojson
      ~error_deserializer

  let request_with_metadata context (request : delete_resource_server_request) =
    let input = Json_serializers.delete_resource_server_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata
      ~shape_name:"AWSCognitoIdentityProviderService.DeleteResourceServer" ~service ~context ~input
      ~output_deserializer:Smaws_Lib.Smithy_api.Json_deserializers.unit__of_yojson
      ~error_deserializer
end

module DeleteTerms = struct
  let error_to_string = function
    | `ConcurrentModificationException _ ->
        "com.amazonaws.cognitoidentityprovider#ConcurrentModificationException"
    | `InternalErrorException _ -> "com.amazonaws.cognitoidentityprovider#InternalErrorException"
    | `InvalidParameterException _ ->
        "com.amazonaws.cognitoidentityprovider#InvalidParameterException"
    | `NotAuthorizedException _ -> "com.amazonaws.cognitoidentityprovider#NotAuthorizedException"
    | `OperationNotEnabledException _ ->
        "com.amazonaws.cognitoidentityprovider#OperationNotEnabledException"
    | `ResourceNotFoundException _ ->
        "com.amazonaws.cognitoidentityprovider#ResourceNotFoundException"
    | `TooManyRequestsException _ ->
        "com.amazonaws.cognitoidentityprovider#TooManyRequestsException"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "ConcurrentModificationException" ->
          `ConcurrentModificationException
            (Json_deserializers.concurrent_modification_exception_of_yojson tree path)
      | _, "InternalErrorException" ->
          `InternalErrorException (Json_deserializers.internal_error_exception_of_yojson tree path)
      | _, "InvalidParameterException" ->
          `InvalidParameterException
            (Json_deserializers.invalid_parameter_exception_of_yojson tree path)
      | _, "NotAuthorizedException" ->
          `NotAuthorizedException (Json_deserializers.not_authorized_exception_of_yojson tree path)
      | _, "OperationNotEnabledException" ->
          `OperationNotEnabledException
            (Json_deserializers.operation_not_enabled_exception_of_yojson tree path)
      | _, "ResourceNotFoundException" ->
          `ResourceNotFoundException
            (Json_deserializers.resource_not_found_exception_of_yojson tree path)
      | _, "TooManyRequestsException" ->
          `TooManyRequestsException
            (Json_deserializers.too_many_requests_exception_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : delete_terms_request) =
    let input = Json_serializers.delete_terms_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"AWSCognitoIdentityProviderService.DeleteTerms"
      ~service ~context ~input
      ~output_deserializer:Smaws_Lib.Smithy_api.Json_deserializers.unit__of_yojson
      ~error_deserializer

  let request_with_metadata context (request : delete_terms_request) =
    let input = Json_serializers.delete_terms_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata
      ~shape_name:"AWSCognitoIdentityProviderService.DeleteTerms" ~service ~context ~input
      ~output_deserializer:Smaws_Lib.Smithy_api.Json_deserializers.unit__of_yojson
      ~error_deserializer
end

module DeleteUser = struct
  let error_to_string = function
    | `ForbiddenException _ -> "com.amazonaws.cognitoidentityprovider#ForbiddenException"
    | `InternalErrorException _ -> "com.amazonaws.cognitoidentityprovider#InternalErrorException"
    | `InvalidParameterException _ ->
        "com.amazonaws.cognitoidentityprovider#InvalidParameterException"
    | `NotAuthorizedException _ -> "com.amazonaws.cognitoidentityprovider#NotAuthorizedException"
    | `OperationNotEnabledException _ ->
        "com.amazonaws.cognitoidentityprovider#OperationNotEnabledException"
    | `PasswordResetRequiredException _ ->
        "com.amazonaws.cognitoidentityprovider#PasswordResetRequiredException"
    | `ResourceNotFoundException _ ->
        "com.amazonaws.cognitoidentityprovider#ResourceNotFoundException"
    | `TooManyRequestsException _ ->
        "com.amazonaws.cognitoidentityprovider#TooManyRequestsException"
    | `UserNotConfirmedException _ ->
        "com.amazonaws.cognitoidentityprovider#UserNotConfirmedException"
    | `UserNotFoundException _ -> "com.amazonaws.cognitoidentityprovider#UserNotFoundException"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "ForbiddenException" ->
          `ForbiddenException (Json_deserializers.forbidden_exception_of_yojson tree path)
      | _, "InternalErrorException" ->
          `InternalErrorException (Json_deserializers.internal_error_exception_of_yojson tree path)
      | _, "InvalidParameterException" ->
          `InvalidParameterException
            (Json_deserializers.invalid_parameter_exception_of_yojson tree path)
      | _, "NotAuthorizedException" ->
          `NotAuthorizedException (Json_deserializers.not_authorized_exception_of_yojson tree path)
      | _, "OperationNotEnabledException" ->
          `OperationNotEnabledException
            (Json_deserializers.operation_not_enabled_exception_of_yojson tree path)
      | _, "PasswordResetRequiredException" ->
          `PasswordResetRequiredException
            (Json_deserializers.password_reset_required_exception_of_yojson tree path)
      | _, "ResourceNotFoundException" ->
          `ResourceNotFoundException
            (Json_deserializers.resource_not_found_exception_of_yojson tree path)
      | _, "TooManyRequestsException" ->
          `TooManyRequestsException
            (Json_deserializers.too_many_requests_exception_of_yojson tree path)
      | _, "UserNotConfirmedException" ->
          `UserNotConfirmedException
            (Json_deserializers.user_not_confirmed_exception_of_yojson tree path)
      | _, "UserNotFoundException" ->
          `UserNotFoundException (Json_deserializers.user_not_found_exception_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : delete_user_request) =
    let input = Json_serializers.delete_user_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"AWSCognitoIdentityProviderService.DeleteUser"
      ~service ~context ~input
      ~output_deserializer:Smaws_Lib.Smithy_api.Json_deserializers.unit__of_yojson
      ~error_deserializer

  let request_with_metadata context (request : delete_user_request) =
    let input = Json_serializers.delete_user_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata
      ~shape_name:"AWSCognitoIdentityProviderService.DeleteUser" ~service ~context ~input
      ~output_deserializer:Smaws_Lib.Smithy_api.Json_deserializers.unit__of_yojson
      ~error_deserializer
end

module DeleteUserAttributes = struct
  let error_to_string = function
    | `ForbiddenException _ -> "com.amazonaws.cognitoidentityprovider#ForbiddenException"
    | `InternalErrorException _ -> "com.amazonaws.cognitoidentityprovider#InternalErrorException"
    | `InvalidParameterException _ ->
        "com.amazonaws.cognitoidentityprovider#InvalidParameterException"
    | `NotAuthorizedException _ -> "com.amazonaws.cognitoidentityprovider#NotAuthorizedException"
    | `OperationNotEnabledException _ ->
        "com.amazonaws.cognitoidentityprovider#OperationNotEnabledException"
    | `PasswordResetRequiredException _ ->
        "com.amazonaws.cognitoidentityprovider#PasswordResetRequiredException"
    | `ResourceNotFoundException _ ->
        "com.amazonaws.cognitoidentityprovider#ResourceNotFoundException"
    | `TooManyRequestsException _ ->
        "com.amazonaws.cognitoidentityprovider#TooManyRequestsException"
    | `UserNotConfirmedException _ ->
        "com.amazonaws.cognitoidentityprovider#UserNotConfirmedException"
    | `UserNotFoundException _ -> "com.amazonaws.cognitoidentityprovider#UserNotFoundException"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "ForbiddenException" ->
          `ForbiddenException (Json_deserializers.forbidden_exception_of_yojson tree path)
      | _, "InternalErrorException" ->
          `InternalErrorException (Json_deserializers.internal_error_exception_of_yojson tree path)
      | _, "InvalidParameterException" ->
          `InvalidParameterException
            (Json_deserializers.invalid_parameter_exception_of_yojson tree path)
      | _, "NotAuthorizedException" ->
          `NotAuthorizedException (Json_deserializers.not_authorized_exception_of_yojson tree path)
      | _, "OperationNotEnabledException" ->
          `OperationNotEnabledException
            (Json_deserializers.operation_not_enabled_exception_of_yojson tree path)
      | _, "PasswordResetRequiredException" ->
          `PasswordResetRequiredException
            (Json_deserializers.password_reset_required_exception_of_yojson tree path)
      | _, "ResourceNotFoundException" ->
          `ResourceNotFoundException
            (Json_deserializers.resource_not_found_exception_of_yojson tree path)
      | _, "TooManyRequestsException" ->
          `TooManyRequestsException
            (Json_deserializers.too_many_requests_exception_of_yojson tree path)
      | _, "UserNotConfirmedException" ->
          `UserNotConfirmedException
            (Json_deserializers.user_not_confirmed_exception_of_yojson tree path)
      | _, "UserNotFoundException" ->
          `UserNotFoundException (Json_deserializers.user_not_found_exception_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : delete_user_attributes_request) =
    let input = Json_serializers.delete_user_attributes_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request
      ~shape_name:"AWSCognitoIdentityProviderService.DeleteUserAttributes" ~service ~context ~input
      ~output_deserializer:Json_deserializers.delete_user_attributes_response_of_yojson
      ~error_deserializer

  let request_with_metadata context (request : delete_user_attributes_request) =
    let input = Json_serializers.delete_user_attributes_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata
      ~shape_name:"AWSCognitoIdentityProviderService.DeleteUserAttributes" ~service ~context ~input
      ~output_deserializer:Json_deserializers.delete_user_attributes_response_of_yojson
      ~error_deserializer
end

module DeleteUserPool = struct
  let error_to_string = function
    | `InternalErrorException _ -> "com.amazonaws.cognitoidentityprovider#InternalErrorException"
    | `InvalidParameterException _ ->
        "com.amazonaws.cognitoidentityprovider#InvalidParameterException"
    | `NotAuthorizedException _ -> "com.amazonaws.cognitoidentityprovider#NotAuthorizedException"
    | `OperationNotEnabledException _ ->
        "com.amazonaws.cognitoidentityprovider#OperationNotEnabledException"
    | `ResourceNotFoundException _ ->
        "com.amazonaws.cognitoidentityprovider#ResourceNotFoundException"
    | `TooManyRequestsException _ ->
        "com.amazonaws.cognitoidentityprovider#TooManyRequestsException"
    | `UserImportInProgressException _ ->
        "com.amazonaws.cognitoidentityprovider#UserImportInProgressException"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "InternalErrorException" ->
          `InternalErrorException (Json_deserializers.internal_error_exception_of_yojson tree path)
      | _, "InvalidParameterException" ->
          `InvalidParameterException
            (Json_deserializers.invalid_parameter_exception_of_yojson tree path)
      | _, "NotAuthorizedException" ->
          `NotAuthorizedException (Json_deserializers.not_authorized_exception_of_yojson tree path)
      | _, "OperationNotEnabledException" ->
          `OperationNotEnabledException
            (Json_deserializers.operation_not_enabled_exception_of_yojson tree path)
      | _, "ResourceNotFoundException" ->
          `ResourceNotFoundException
            (Json_deserializers.resource_not_found_exception_of_yojson tree path)
      | _, "TooManyRequestsException" ->
          `TooManyRequestsException
            (Json_deserializers.too_many_requests_exception_of_yojson tree path)
      | _, "UserImportInProgressException" ->
          `UserImportInProgressException
            (Json_deserializers.user_import_in_progress_exception_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : delete_user_pool_request) =
    let input = Json_serializers.delete_user_pool_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request
      ~shape_name:"AWSCognitoIdentityProviderService.DeleteUserPool" ~service ~context ~input
      ~output_deserializer:Smaws_Lib.Smithy_api.Json_deserializers.unit__of_yojson
      ~error_deserializer

  let request_with_metadata context (request : delete_user_pool_request) =
    let input = Json_serializers.delete_user_pool_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata
      ~shape_name:"AWSCognitoIdentityProviderService.DeleteUserPool" ~service ~context ~input
      ~output_deserializer:Smaws_Lib.Smithy_api.Json_deserializers.unit__of_yojson
      ~error_deserializer
end

module DeleteUserPoolClient = struct
  let error_to_string = function
    | `ConcurrentModificationException _ ->
        "com.amazonaws.cognitoidentityprovider#ConcurrentModificationException"
    | `InternalErrorException _ -> "com.amazonaws.cognitoidentityprovider#InternalErrorException"
    | `InvalidParameterException _ ->
        "com.amazonaws.cognitoidentityprovider#InvalidParameterException"
    | `NotAuthorizedException _ -> "com.amazonaws.cognitoidentityprovider#NotAuthorizedException"
    | `OperationNotEnabledException _ ->
        "com.amazonaws.cognitoidentityprovider#OperationNotEnabledException"
    | `ResourceNotFoundException _ ->
        "com.amazonaws.cognitoidentityprovider#ResourceNotFoundException"
    | `TooManyRequestsException _ ->
        "com.amazonaws.cognitoidentityprovider#TooManyRequestsException"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "ConcurrentModificationException" ->
          `ConcurrentModificationException
            (Json_deserializers.concurrent_modification_exception_of_yojson tree path)
      | _, "InternalErrorException" ->
          `InternalErrorException (Json_deserializers.internal_error_exception_of_yojson tree path)
      | _, "InvalidParameterException" ->
          `InvalidParameterException
            (Json_deserializers.invalid_parameter_exception_of_yojson tree path)
      | _, "NotAuthorizedException" ->
          `NotAuthorizedException (Json_deserializers.not_authorized_exception_of_yojson tree path)
      | _, "OperationNotEnabledException" ->
          `OperationNotEnabledException
            (Json_deserializers.operation_not_enabled_exception_of_yojson tree path)
      | _, "ResourceNotFoundException" ->
          `ResourceNotFoundException
            (Json_deserializers.resource_not_found_exception_of_yojson tree path)
      | _, "TooManyRequestsException" ->
          `TooManyRequestsException
            (Json_deserializers.too_many_requests_exception_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : delete_user_pool_client_request) =
    let input = Json_serializers.delete_user_pool_client_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request
      ~shape_name:"AWSCognitoIdentityProviderService.DeleteUserPoolClient" ~service ~context ~input
      ~output_deserializer:Smaws_Lib.Smithy_api.Json_deserializers.unit__of_yojson
      ~error_deserializer

  let request_with_metadata context (request : delete_user_pool_client_request) =
    let input = Json_serializers.delete_user_pool_client_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata
      ~shape_name:"AWSCognitoIdentityProviderService.DeleteUserPoolClient" ~service ~context ~input
      ~output_deserializer:Smaws_Lib.Smithy_api.Json_deserializers.unit__of_yojson
      ~error_deserializer
end

module DeleteUserPoolClientSecret = struct
  let error_to_string = function
    | `InternalServerException _ -> "com.amazonaws.cognitoidentityprovider#InternalServerException"
    | `InvalidParameterException _ ->
        "com.amazonaws.cognitoidentityprovider#InvalidParameterException"
    | `LimitExceededException _ -> "com.amazonaws.cognitoidentityprovider#LimitExceededException"
    | `ResourceNotFoundException _ ->
        "com.amazonaws.cognitoidentityprovider#ResourceNotFoundException"
    | `TooManyRequestsException _ ->
        "com.amazonaws.cognitoidentityprovider#TooManyRequestsException"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "InternalServerException" ->
          `InternalServerException
            (Json_deserializers.internal_server_exception_of_yojson tree path)
      | _, "InvalidParameterException" ->
          `InvalidParameterException
            (Json_deserializers.invalid_parameter_exception_of_yojson tree path)
      | _, "LimitExceededException" ->
          `LimitExceededException (Json_deserializers.limit_exceeded_exception_of_yojson tree path)
      | _, "ResourceNotFoundException" ->
          `ResourceNotFoundException
            (Json_deserializers.resource_not_found_exception_of_yojson tree path)
      | _, "TooManyRequestsException" ->
          `TooManyRequestsException
            (Json_deserializers.too_many_requests_exception_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : delete_user_pool_client_secret_request) =
    let input = Json_serializers.delete_user_pool_client_secret_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request
      ~shape_name:"AWSCognitoIdentityProviderService.DeleteUserPoolClientSecret" ~service ~context
      ~input
      ~output_deserializer:Json_deserializers.delete_user_pool_client_secret_response_of_yojson
      ~error_deserializer

  let request_with_metadata context (request : delete_user_pool_client_secret_request) =
    let input = Json_serializers.delete_user_pool_client_secret_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata
      ~shape_name:"AWSCognitoIdentityProviderService.DeleteUserPoolClientSecret" ~service ~context
      ~input
      ~output_deserializer:Json_deserializers.delete_user_pool_client_secret_response_of_yojson
      ~error_deserializer
end

module DeleteUserPoolDomain = struct
  let error_to_string = function
    | `ConcurrentModificationException _ ->
        "com.amazonaws.cognitoidentityprovider#ConcurrentModificationException"
    | `InternalErrorException _ -> "com.amazonaws.cognitoidentityprovider#InternalErrorException"
    | `InvalidParameterException _ ->
        "com.amazonaws.cognitoidentityprovider#InvalidParameterException"
    | `NotAuthorizedException _ -> "com.amazonaws.cognitoidentityprovider#NotAuthorizedException"
    | `OperationNotEnabledException _ ->
        "com.amazonaws.cognitoidentityprovider#OperationNotEnabledException"
    | `ResourceNotFoundException _ ->
        "com.amazonaws.cognitoidentityprovider#ResourceNotFoundException"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "ConcurrentModificationException" ->
          `ConcurrentModificationException
            (Json_deserializers.concurrent_modification_exception_of_yojson tree path)
      | _, "InternalErrorException" ->
          `InternalErrorException (Json_deserializers.internal_error_exception_of_yojson tree path)
      | _, "InvalidParameterException" ->
          `InvalidParameterException
            (Json_deserializers.invalid_parameter_exception_of_yojson tree path)
      | _, "NotAuthorizedException" ->
          `NotAuthorizedException (Json_deserializers.not_authorized_exception_of_yojson tree path)
      | _, "OperationNotEnabledException" ->
          `OperationNotEnabledException
            (Json_deserializers.operation_not_enabled_exception_of_yojson tree path)
      | _, "ResourceNotFoundException" ->
          `ResourceNotFoundException
            (Json_deserializers.resource_not_found_exception_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : delete_user_pool_domain_request) =
    let input = Json_serializers.delete_user_pool_domain_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request
      ~shape_name:"AWSCognitoIdentityProviderService.DeleteUserPoolDomain" ~service ~context ~input
      ~output_deserializer:Json_deserializers.delete_user_pool_domain_response_of_yojson
      ~error_deserializer

  let request_with_metadata context (request : delete_user_pool_domain_request) =
    let input = Json_serializers.delete_user_pool_domain_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata
      ~shape_name:"AWSCognitoIdentityProviderService.DeleteUserPoolDomain" ~service ~context ~input
      ~output_deserializer:Json_deserializers.delete_user_pool_domain_response_of_yojson
      ~error_deserializer
end

module DeleteUserPoolReplica = struct
  let error_to_string = function
    | `InternalErrorException _ -> "com.amazonaws.cognitoidentityprovider#InternalErrorException"
    | `InvalidParameterException _ ->
        "com.amazonaws.cognitoidentityprovider#InvalidParameterException"
    | `NotAuthorizedException _ -> "com.amazonaws.cognitoidentityprovider#NotAuthorizedException"
    | `OperationNotEnabledException _ ->
        "com.amazonaws.cognitoidentityprovider#OperationNotEnabledException"
    | `ResourceNotFoundException _ ->
        "com.amazonaws.cognitoidentityprovider#ResourceNotFoundException"
    | `TooManyRequestsException _ ->
        "com.amazonaws.cognitoidentityprovider#TooManyRequestsException"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "InternalErrorException" ->
          `InternalErrorException (Json_deserializers.internal_error_exception_of_yojson tree path)
      | _, "InvalidParameterException" ->
          `InvalidParameterException
            (Json_deserializers.invalid_parameter_exception_of_yojson tree path)
      | _, "NotAuthorizedException" ->
          `NotAuthorizedException (Json_deserializers.not_authorized_exception_of_yojson tree path)
      | _, "OperationNotEnabledException" ->
          `OperationNotEnabledException
            (Json_deserializers.operation_not_enabled_exception_of_yojson tree path)
      | _, "ResourceNotFoundException" ->
          `ResourceNotFoundException
            (Json_deserializers.resource_not_found_exception_of_yojson tree path)
      | _, "TooManyRequestsException" ->
          `TooManyRequestsException
            (Json_deserializers.too_many_requests_exception_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : delete_user_pool_replica_request) =
    let input = Json_serializers.delete_user_pool_replica_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request
      ~shape_name:"AWSCognitoIdentityProviderService.DeleteUserPoolReplica" ~service ~context ~input
      ~output_deserializer:Json_deserializers.delete_user_pool_replica_response_of_yojson
      ~error_deserializer

  let request_with_metadata context (request : delete_user_pool_replica_request) =
    let input = Json_serializers.delete_user_pool_replica_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata
      ~shape_name:"AWSCognitoIdentityProviderService.DeleteUserPoolReplica" ~service ~context ~input
      ~output_deserializer:Json_deserializers.delete_user_pool_replica_response_of_yojson
      ~error_deserializer
end

module DeleteWebAuthnCredential = struct
  let error_to_string = function
    | `ForbiddenException _ -> "com.amazonaws.cognitoidentityprovider#ForbiddenException"
    | `InternalErrorException _ -> "com.amazonaws.cognitoidentityprovider#InternalErrorException"
    | `InvalidParameterException _ ->
        "com.amazonaws.cognitoidentityprovider#InvalidParameterException"
    | `LimitExceededException _ -> "com.amazonaws.cognitoidentityprovider#LimitExceededException"
    | `NotAuthorizedException _ -> "com.amazonaws.cognitoidentityprovider#NotAuthorizedException"
    | `OperationNotEnabledException _ ->
        "com.amazonaws.cognitoidentityprovider#OperationNotEnabledException"
    | `PasswordResetRequiredException _ ->
        "com.amazonaws.cognitoidentityprovider#PasswordResetRequiredException"
    | `ResourceNotFoundException _ ->
        "com.amazonaws.cognitoidentityprovider#ResourceNotFoundException"
    | `TooManyRequestsException _ ->
        "com.amazonaws.cognitoidentityprovider#TooManyRequestsException"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "ForbiddenException" ->
          `ForbiddenException (Json_deserializers.forbidden_exception_of_yojson tree path)
      | _, "InternalErrorException" ->
          `InternalErrorException (Json_deserializers.internal_error_exception_of_yojson tree path)
      | _, "InvalidParameterException" ->
          `InvalidParameterException
            (Json_deserializers.invalid_parameter_exception_of_yojson tree path)
      | _, "LimitExceededException" ->
          `LimitExceededException (Json_deserializers.limit_exceeded_exception_of_yojson tree path)
      | _, "NotAuthorizedException" ->
          `NotAuthorizedException (Json_deserializers.not_authorized_exception_of_yojson tree path)
      | _, "OperationNotEnabledException" ->
          `OperationNotEnabledException
            (Json_deserializers.operation_not_enabled_exception_of_yojson tree path)
      | _, "PasswordResetRequiredException" ->
          `PasswordResetRequiredException
            (Json_deserializers.password_reset_required_exception_of_yojson tree path)
      | _, "ResourceNotFoundException" ->
          `ResourceNotFoundException
            (Json_deserializers.resource_not_found_exception_of_yojson tree path)
      | _, "TooManyRequestsException" ->
          `TooManyRequestsException
            (Json_deserializers.too_many_requests_exception_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : delete_web_authn_credential_request) =
    let input = Json_serializers.delete_web_authn_credential_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request
      ~shape_name:"AWSCognitoIdentityProviderService.DeleteWebAuthnCredential" ~service ~context
      ~input ~output_deserializer:Json_deserializers.delete_web_authn_credential_response_of_yojson
      ~error_deserializer

  let request_with_metadata context (request : delete_web_authn_credential_request) =
    let input = Json_serializers.delete_web_authn_credential_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata
      ~shape_name:"AWSCognitoIdentityProviderService.DeleteWebAuthnCredential" ~service ~context
      ~input ~output_deserializer:Json_deserializers.delete_web_authn_credential_response_of_yojson
      ~error_deserializer
end

module DescribeIdentityProvider = struct
  let error_to_string = function
    | `InternalErrorException _ -> "com.amazonaws.cognitoidentityprovider#InternalErrorException"
    | `InvalidParameterException _ ->
        "com.amazonaws.cognitoidentityprovider#InvalidParameterException"
    | `NotAuthorizedException _ -> "com.amazonaws.cognitoidentityprovider#NotAuthorizedException"
    | `ResourceNotFoundException _ ->
        "com.amazonaws.cognitoidentityprovider#ResourceNotFoundException"
    | `TooManyRequestsException _ ->
        "com.amazonaws.cognitoidentityprovider#TooManyRequestsException"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "InternalErrorException" ->
          `InternalErrorException (Json_deserializers.internal_error_exception_of_yojson tree path)
      | _, "InvalidParameterException" ->
          `InvalidParameterException
            (Json_deserializers.invalid_parameter_exception_of_yojson tree path)
      | _, "NotAuthorizedException" ->
          `NotAuthorizedException (Json_deserializers.not_authorized_exception_of_yojson tree path)
      | _, "ResourceNotFoundException" ->
          `ResourceNotFoundException
            (Json_deserializers.resource_not_found_exception_of_yojson tree path)
      | _, "TooManyRequestsException" ->
          `TooManyRequestsException
            (Json_deserializers.too_many_requests_exception_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : describe_identity_provider_request) =
    let input = Json_serializers.describe_identity_provider_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request
      ~shape_name:"AWSCognitoIdentityProviderService.DescribeIdentityProvider" ~service ~context
      ~input ~output_deserializer:Json_deserializers.describe_identity_provider_response_of_yojson
      ~error_deserializer

  let request_with_metadata context (request : describe_identity_provider_request) =
    let input = Json_serializers.describe_identity_provider_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata
      ~shape_name:"AWSCognitoIdentityProviderService.DescribeIdentityProvider" ~service ~context
      ~input ~output_deserializer:Json_deserializers.describe_identity_provider_response_of_yojson
      ~error_deserializer
end

module DescribeManagedLoginBranding = struct
  let error_to_string = function
    | `InternalErrorException _ -> "com.amazonaws.cognitoidentityprovider#InternalErrorException"
    | `InvalidParameterException _ ->
        "com.amazonaws.cognitoidentityprovider#InvalidParameterException"
    | `NotAuthorizedException _ -> "com.amazonaws.cognitoidentityprovider#NotAuthorizedException"
    | `OperationNotEnabledException _ ->
        "com.amazonaws.cognitoidentityprovider#OperationNotEnabledException"
    | `ResourceNotFoundException _ ->
        "com.amazonaws.cognitoidentityprovider#ResourceNotFoundException"
    | `TooManyRequestsException _ ->
        "com.amazonaws.cognitoidentityprovider#TooManyRequestsException"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "InternalErrorException" ->
          `InternalErrorException (Json_deserializers.internal_error_exception_of_yojson tree path)
      | _, "InvalidParameterException" ->
          `InvalidParameterException
            (Json_deserializers.invalid_parameter_exception_of_yojson tree path)
      | _, "NotAuthorizedException" ->
          `NotAuthorizedException (Json_deserializers.not_authorized_exception_of_yojson tree path)
      | _, "OperationNotEnabledException" ->
          `OperationNotEnabledException
            (Json_deserializers.operation_not_enabled_exception_of_yojson tree path)
      | _, "ResourceNotFoundException" ->
          `ResourceNotFoundException
            (Json_deserializers.resource_not_found_exception_of_yojson tree path)
      | _, "TooManyRequestsException" ->
          `TooManyRequestsException
            (Json_deserializers.too_many_requests_exception_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : describe_managed_login_branding_request) =
    let input = Json_serializers.describe_managed_login_branding_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request
      ~shape_name:"AWSCognitoIdentityProviderService.DescribeManagedLoginBranding" ~service ~context
      ~input
      ~output_deserializer:Json_deserializers.describe_managed_login_branding_response_of_yojson
      ~error_deserializer

  let request_with_metadata context (request : describe_managed_login_branding_request) =
    let input = Json_serializers.describe_managed_login_branding_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata
      ~shape_name:"AWSCognitoIdentityProviderService.DescribeManagedLoginBranding" ~service ~context
      ~input
      ~output_deserializer:Json_deserializers.describe_managed_login_branding_response_of_yojson
      ~error_deserializer
end

module DescribeManagedLoginBrandingByClient = struct
  let error_to_string = function
    | `InternalErrorException _ -> "com.amazonaws.cognitoidentityprovider#InternalErrorException"
    | `InvalidParameterException _ ->
        "com.amazonaws.cognitoidentityprovider#InvalidParameterException"
    | `NotAuthorizedException _ -> "com.amazonaws.cognitoidentityprovider#NotAuthorizedException"
    | `OperationNotEnabledException _ ->
        "com.amazonaws.cognitoidentityprovider#OperationNotEnabledException"
    | `ResourceNotFoundException _ ->
        "com.amazonaws.cognitoidentityprovider#ResourceNotFoundException"
    | `TooManyRequestsException _ ->
        "com.amazonaws.cognitoidentityprovider#TooManyRequestsException"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "InternalErrorException" ->
          `InternalErrorException (Json_deserializers.internal_error_exception_of_yojson tree path)
      | _, "InvalidParameterException" ->
          `InvalidParameterException
            (Json_deserializers.invalid_parameter_exception_of_yojson tree path)
      | _, "NotAuthorizedException" ->
          `NotAuthorizedException (Json_deserializers.not_authorized_exception_of_yojson tree path)
      | _, "OperationNotEnabledException" ->
          `OperationNotEnabledException
            (Json_deserializers.operation_not_enabled_exception_of_yojson tree path)
      | _, "ResourceNotFoundException" ->
          `ResourceNotFoundException
            (Json_deserializers.resource_not_found_exception_of_yojson tree path)
      | _, "TooManyRequestsException" ->
          `TooManyRequestsException
            (Json_deserializers.too_many_requests_exception_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : describe_managed_login_branding_by_client_request) =
    let input =
      Json_serializers.describe_managed_login_branding_by_client_request_to_yojson request
    in
    Smaws_Lib.Protocols.AwsJson.request
      ~shape_name:"AWSCognitoIdentityProviderService.DescribeManagedLoginBrandingByClient" ~service
      ~context ~input
      ~output_deserializer:
        Json_deserializers.describe_managed_login_branding_by_client_response_of_yojson
      ~error_deserializer

  let request_with_metadata context (request : describe_managed_login_branding_by_client_request) =
    let input =
      Json_serializers.describe_managed_login_branding_by_client_request_to_yojson request
    in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata
      ~shape_name:"AWSCognitoIdentityProviderService.DescribeManagedLoginBrandingByClient" ~service
      ~context ~input
      ~output_deserializer:
        Json_deserializers.describe_managed_login_branding_by_client_response_of_yojson
      ~error_deserializer
end

module DescribeResourceServer = struct
  let error_to_string = function
    | `InternalErrorException _ -> "com.amazonaws.cognitoidentityprovider#InternalErrorException"
    | `InvalidParameterException _ ->
        "com.amazonaws.cognitoidentityprovider#InvalidParameterException"
    | `NotAuthorizedException _ -> "com.amazonaws.cognitoidentityprovider#NotAuthorizedException"
    | `OperationNotEnabledException _ ->
        "com.amazonaws.cognitoidentityprovider#OperationNotEnabledException"
    | `ResourceNotFoundException _ ->
        "com.amazonaws.cognitoidentityprovider#ResourceNotFoundException"
    | `TooManyRequestsException _ ->
        "com.amazonaws.cognitoidentityprovider#TooManyRequestsException"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "InternalErrorException" ->
          `InternalErrorException (Json_deserializers.internal_error_exception_of_yojson tree path)
      | _, "InvalidParameterException" ->
          `InvalidParameterException
            (Json_deserializers.invalid_parameter_exception_of_yojson tree path)
      | _, "NotAuthorizedException" ->
          `NotAuthorizedException (Json_deserializers.not_authorized_exception_of_yojson tree path)
      | _, "OperationNotEnabledException" ->
          `OperationNotEnabledException
            (Json_deserializers.operation_not_enabled_exception_of_yojson tree path)
      | _, "ResourceNotFoundException" ->
          `ResourceNotFoundException
            (Json_deserializers.resource_not_found_exception_of_yojson tree path)
      | _, "TooManyRequestsException" ->
          `TooManyRequestsException
            (Json_deserializers.too_many_requests_exception_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : describe_resource_server_request) =
    let input = Json_serializers.describe_resource_server_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request
      ~shape_name:"AWSCognitoIdentityProviderService.DescribeResourceServer" ~service ~context
      ~input ~output_deserializer:Json_deserializers.describe_resource_server_response_of_yojson
      ~error_deserializer

  let request_with_metadata context (request : describe_resource_server_request) =
    let input = Json_serializers.describe_resource_server_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata
      ~shape_name:"AWSCognitoIdentityProviderService.DescribeResourceServer" ~service ~context
      ~input ~output_deserializer:Json_deserializers.describe_resource_server_response_of_yojson
      ~error_deserializer
end

module DescribeRiskConfiguration = struct
  let error_to_string = function
    | `InternalErrorException _ -> "com.amazonaws.cognitoidentityprovider#InternalErrorException"
    | `InvalidParameterException _ ->
        "com.amazonaws.cognitoidentityprovider#InvalidParameterException"
    | `NotAuthorizedException _ -> "com.amazonaws.cognitoidentityprovider#NotAuthorizedException"
    | `OperationNotEnabledException _ ->
        "com.amazonaws.cognitoidentityprovider#OperationNotEnabledException"
    | `ResourceNotFoundException _ ->
        "com.amazonaws.cognitoidentityprovider#ResourceNotFoundException"
    | `TooManyRequestsException _ ->
        "com.amazonaws.cognitoidentityprovider#TooManyRequestsException"
    | `UserPoolAddOnNotEnabledException _ ->
        "com.amazonaws.cognitoidentityprovider#UserPoolAddOnNotEnabledException"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "InternalErrorException" ->
          `InternalErrorException (Json_deserializers.internal_error_exception_of_yojson tree path)
      | _, "InvalidParameterException" ->
          `InvalidParameterException
            (Json_deserializers.invalid_parameter_exception_of_yojson tree path)
      | _, "NotAuthorizedException" ->
          `NotAuthorizedException (Json_deserializers.not_authorized_exception_of_yojson tree path)
      | _, "OperationNotEnabledException" ->
          `OperationNotEnabledException
            (Json_deserializers.operation_not_enabled_exception_of_yojson tree path)
      | _, "ResourceNotFoundException" ->
          `ResourceNotFoundException
            (Json_deserializers.resource_not_found_exception_of_yojson tree path)
      | _, "TooManyRequestsException" ->
          `TooManyRequestsException
            (Json_deserializers.too_many_requests_exception_of_yojson tree path)
      | _, "UserPoolAddOnNotEnabledException" ->
          `UserPoolAddOnNotEnabledException
            (Json_deserializers.user_pool_add_on_not_enabled_exception_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : describe_risk_configuration_request) =
    let input = Json_serializers.describe_risk_configuration_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request
      ~shape_name:"AWSCognitoIdentityProviderService.DescribeRiskConfiguration" ~service ~context
      ~input ~output_deserializer:Json_deserializers.describe_risk_configuration_response_of_yojson
      ~error_deserializer

  let request_with_metadata context (request : describe_risk_configuration_request) =
    let input = Json_serializers.describe_risk_configuration_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata
      ~shape_name:"AWSCognitoIdentityProviderService.DescribeRiskConfiguration" ~service ~context
      ~input ~output_deserializer:Json_deserializers.describe_risk_configuration_response_of_yojson
      ~error_deserializer
end

module DescribeTerms = struct
  let error_to_string = function
    | `InternalErrorException _ -> "com.amazonaws.cognitoidentityprovider#InternalErrorException"
    | `InvalidParameterException _ ->
        "com.amazonaws.cognitoidentityprovider#InvalidParameterException"
    | `NotAuthorizedException _ -> "com.amazonaws.cognitoidentityprovider#NotAuthorizedException"
    | `OperationNotEnabledException _ ->
        "com.amazonaws.cognitoidentityprovider#OperationNotEnabledException"
    | `ResourceNotFoundException _ ->
        "com.amazonaws.cognitoidentityprovider#ResourceNotFoundException"
    | `TooManyRequestsException _ ->
        "com.amazonaws.cognitoidentityprovider#TooManyRequestsException"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "InternalErrorException" ->
          `InternalErrorException (Json_deserializers.internal_error_exception_of_yojson tree path)
      | _, "InvalidParameterException" ->
          `InvalidParameterException
            (Json_deserializers.invalid_parameter_exception_of_yojson tree path)
      | _, "NotAuthorizedException" ->
          `NotAuthorizedException (Json_deserializers.not_authorized_exception_of_yojson tree path)
      | _, "OperationNotEnabledException" ->
          `OperationNotEnabledException
            (Json_deserializers.operation_not_enabled_exception_of_yojson tree path)
      | _, "ResourceNotFoundException" ->
          `ResourceNotFoundException
            (Json_deserializers.resource_not_found_exception_of_yojson tree path)
      | _, "TooManyRequestsException" ->
          `TooManyRequestsException
            (Json_deserializers.too_many_requests_exception_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : describe_terms_request) =
    let input = Json_serializers.describe_terms_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request
      ~shape_name:"AWSCognitoIdentityProviderService.DescribeTerms" ~service ~context ~input
      ~output_deserializer:Json_deserializers.describe_terms_response_of_yojson ~error_deserializer

  let request_with_metadata context (request : describe_terms_request) =
    let input = Json_serializers.describe_terms_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata
      ~shape_name:"AWSCognitoIdentityProviderService.DescribeTerms" ~service ~context ~input
      ~output_deserializer:Json_deserializers.describe_terms_response_of_yojson ~error_deserializer
end

module DescribeUserImportJob = struct
  let error_to_string = function
    | `InternalErrorException _ -> "com.amazonaws.cognitoidentityprovider#InternalErrorException"
    | `InvalidParameterException _ ->
        "com.amazonaws.cognitoidentityprovider#InvalidParameterException"
    | `NotAuthorizedException _ -> "com.amazonaws.cognitoidentityprovider#NotAuthorizedException"
    | `OperationNotEnabledException _ ->
        "com.amazonaws.cognitoidentityprovider#OperationNotEnabledException"
    | `ResourceNotFoundException _ ->
        "com.amazonaws.cognitoidentityprovider#ResourceNotFoundException"
    | `TooManyRequestsException _ ->
        "com.amazonaws.cognitoidentityprovider#TooManyRequestsException"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "InternalErrorException" ->
          `InternalErrorException (Json_deserializers.internal_error_exception_of_yojson tree path)
      | _, "InvalidParameterException" ->
          `InvalidParameterException
            (Json_deserializers.invalid_parameter_exception_of_yojson tree path)
      | _, "NotAuthorizedException" ->
          `NotAuthorizedException (Json_deserializers.not_authorized_exception_of_yojson tree path)
      | _, "OperationNotEnabledException" ->
          `OperationNotEnabledException
            (Json_deserializers.operation_not_enabled_exception_of_yojson tree path)
      | _, "ResourceNotFoundException" ->
          `ResourceNotFoundException
            (Json_deserializers.resource_not_found_exception_of_yojson tree path)
      | _, "TooManyRequestsException" ->
          `TooManyRequestsException
            (Json_deserializers.too_many_requests_exception_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : describe_user_import_job_request) =
    let input = Json_serializers.describe_user_import_job_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request
      ~shape_name:"AWSCognitoIdentityProviderService.DescribeUserImportJob" ~service ~context ~input
      ~output_deserializer:Json_deserializers.describe_user_import_job_response_of_yojson
      ~error_deserializer

  let request_with_metadata context (request : describe_user_import_job_request) =
    let input = Json_serializers.describe_user_import_job_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata
      ~shape_name:"AWSCognitoIdentityProviderService.DescribeUserImportJob" ~service ~context ~input
      ~output_deserializer:Json_deserializers.describe_user_import_job_response_of_yojson
      ~error_deserializer
end

module DescribeUserPool = struct
  let error_to_string = function
    | `InternalErrorException _ -> "com.amazonaws.cognitoidentityprovider#InternalErrorException"
    | `InvalidParameterException _ ->
        "com.amazonaws.cognitoidentityprovider#InvalidParameterException"
    | `NotAuthorizedException _ -> "com.amazonaws.cognitoidentityprovider#NotAuthorizedException"
    | `OperationNotEnabledException _ ->
        "com.amazonaws.cognitoidentityprovider#OperationNotEnabledException"
    | `ResourceNotFoundException _ ->
        "com.amazonaws.cognitoidentityprovider#ResourceNotFoundException"
    | `TooManyRequestsException _ ->
        "com.amazonaws.cognitoidentityprovider#TooManyRequestsException"
    | `UserPoolTaggingException _ ->
        "com.amazonaws.cognitoidentityprovider#UserPoolTaggingException"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "InternalErrorException" ->
          `InternalErrorException (Json_deserializers.internal_error_exception_of_yojson tree path)
      | _, "InvalidParameterException" ->
          `InvalidParameterException
            (Json_deserializers.invalid_parameter_exception_of_yojson tree path)
      | _, "NotAuthorizedException" ->
          `NotAuthorizedException (Json_deserializers.not_authorized_exception_of_yojson tree path)
      | _, "OperationNotEnabledException" ->
          `OperationNotEnabledException
            (Json_deserializers.operation_not_enabled_exception_of_yojson tree path)
      | _, "ResourceNotFoundException" ->
          `ResourceNotFoundException
            (Json_deserializers.resource_not_found_exception_of_yojson tree path)
      | _, "TooManyRequestsException" ->
          `TooManyRequestsException
            (Json_deserializers.too_many_requests_exception_of_yojson tree path)
      | _, "UserPoolTaggingException" ->
          `UserPoolTaggingException
            (Json_deserializers.user_pool_tagging_exception_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : describe_user_pool_request) =
    let input = Json_serializers.describe_user_pool_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request
      ~shape_name:"AWSCognitoIdentityProviderService.DescribeUserPool" ~service ~context ~input
      ~output_deserializer:Json_deserializers.describe_user_pool_response_of_yojson
      ~error_deserializer

  let request_with_metadata context (request : describe_user_pool_request) =
    let input = Json_serializers.describe_user_pool_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata
      ~shape_name:"AWSCognitoIdentityProviderService.DescribeUserPool" ~service ~context ~input
      ~output_deserializer:Json_deserializers.describe_user_pool_response_of_yojson
      ~error_deserializer
end

module DescribeUserPoolClient = struct
  let error_to_string = function
    | `InternalErrorException _ -> "com.amazonaws.cognitoidentityprovider#InternalErrorException"
    | `InvalidParameterException _ ->
        "com.amazonaws.cognitoidentityprovider#InvalidParameterException"
    | `NotAuthorizedException _ -> "com.amazonaws.cognitoidentityprovider#NotAuthorizedException"
    | `OperationNotEnabledException _ ->
        "com.amazonaws.cognitoidentityprovider#OperationNotEnabledException"
    | `ResourceNotFoundException _ ->
        "com.amazonaws.cognitoidentityprovider#ResourceNotFoundException"
    | `TooManyRequestsException _ ->
        "com.amazonaws.cognitoidentityprovider#TooManyRequestsException"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "InternalErrorException" ->
          `InternalErrorException (Json_deserializers.internal_error_exception_of_yojson tree path)
      | _, "InvalidParameterException" ->
          `InvalidParameterException
            (Json_deserializers.invalid_parameter_exception_of_yojson tree path)
      | _, "NotAuthorizedException" ->
          `NotAuthorizedException (Json_deserializers.not_authorized_exception_of_yojson tree path)
      | _, "OperationNotEnabledException" ->
          `OperationNotEnabledException
            (Json_deserializers.operation_not_enabled_exception_of_yojson tree path)
      | _, "ResourceNotFoundException" ->
          `ResourceNotFoundException
            (Json_deserializers.resource_not_found_exception_of_yojson tree path)
      | _, "TooManyRequestsException" ->
          `TooManyRequestsException
            (Json_deserializers.too_many_requests_exception_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : describe_user_pool_client_request) =
    let input = Json_serializers.describe_user_pool_client_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request
      ~shape_name:"AWSCognitoIdentityProviderService.DescribeUserPoolClient" ~service ~context
      ~input ~output_deserializer:Json_deserializers.describe_user_pool_client_response_of_yojson
      ~error_deserializer

  let request_with_metadata context (request : describe_user_pool_client_request) =
    let input = Json_serializers.describe_user_pool_client_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata
      ~shape_name:"AWSCognitoIdentityProviderService.DescribeUserPoolClient" ~service ~context
      ~input ~output_deserializer:Json_deserializers.describe_user_pool_client_response_of_yojson
      ~error_deserializer
end

module DescribeUserPoolDomain = struct
  let error_to_string = function
    | `InternalErrorException _ -> "com.amazonaws.cognitoidentityprovider#InternalErrorException"
    | `InvalidParameterException _ ->
        "com.amazonaws.cognitoidentityprovider#InvalidParameterException"
    | `NotAuthorizedException _ -> "com.amazonaws.cognitoidentityprovider#NotAuthorizedException"
    | `OperationNotEnabledException _ ->
        "com.amazonaws.cognitoidentityprovider#OperationNotEnabledException"
    | `ResourceNotFoundException _ ->
        "com.amazonaws.cognitoidentityprovider#ResourceNotFoundException"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "InternalErrorException" ->
          `InternalErrorException (Json_deserializers.internal_error_exception_of_yojson tree path)
      | _, "InvalidParameterException" ->
          `InvalidParameterException
            (Json_deserializers.invalid_parameter_exception_of_yojson tree path)
      | _, "NotAuthorizedException" ->
          `NotAuthorizedException (Json_deserializers.not_authorized_exception_of_yojson tree path)
      | _, "OperationNotEnabledException" ->
          `OperationNotEnabledException
            (Json_deserializers.operation_not_enabled_exception_of_yojson tree path)
      | _, "ResourceNotFoundException" ->
          `ResourceNotFoundException
            (Json_deserializers.resource_not_found_exception_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : describe_user_pool_domain_request) =
    let input = Json_serializers.describe_user_pool_domain_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request
      ~shape_name:"AWSCognitoIdentityProviderService.DescribeUserPoolDomain" ~service ~context
      ~input ~output_deserializer:Json_deserializers.describe_user_pool_domain_response_of_yojson
      ~error_deserializer

  let request_with_metadata context (request : describe_user_pool_domain_request) =
    let input = Json_serializers.describe_user_pool_domain_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata
      ~shape_name:"AWSCognitoIdentityProviderService.DescribeUserPoolDomain" ~service ~context
      ~input ~output_deserializer:Json_deserializers.describe_user_pool_domain_response_of_yojson
      ~error_deserializer
end

module ForgetDevice = struct
  let error_to_string = function
    | `ForbiddenException _ -> "com.amazonaws.cognitoidentityprovider#ForbiddenException"
    | `InternalErrorException _ -> "com.amazonaws.cognitoidentityprovider#InternalErrorException"
    | `InvalidParameterException _ ->
        "com.amazonaws.cognitoidentityprovider#InvalidParameterException"
    | `InvalidUserPoolConfigurationException _ ->
        "com.amazonaws.cognitoidentityprovider#InvalidUserPoolConfigurationException"
    | `NotAuthorizedException _ -> "com.amazonaws.cognitoidentityprovider#NotAuthorizedException"
    | `OperationNotEnabledException _ ->
        "com.amazonaws.cognitoidentityprovider#OperationNotEnabledException"
    | `PasswordResetRequiredException _ ->
        "com.amazonaws.cognitoidentityprovider#PasswordResetRequiredException"
    | `ResourceNotFoundException _ ->
        "com.amazonaws.cognitoidentityprovider#ResourceNotFoundException"
    | `TooManyRequestsException _ ->
        "com.amazonaws.cognitoidentityprovider#TooManyRequestsException"
    | `UserNotConfirmedException _ ->
        "com.amazonaws.cognitoidentityprovider#UserNotConfirmedException"
    | `UserNotFoundException _ -> "com.amazonaws.cognitoidentityprovider#UserNotFoundException"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "ForbiddenException" ->
          `ForbiddenException (Json_deserializers.forbidden_exception_of_yojson tree path)
      | _, "InternalErrorException" ->
          `InternalErrorException (Json_deserializers.internal_error_exception_of_yojson tree path)
      | _, "InvalidParameterException" ->
          `InvalidParameterException
            (Json_deserializers.invalid_parameter_exception_of_yojson tree path)
      | _, "InvalidUserPoolConfigurationException" ->
          `InvalidUserPoolConfigurationException
            (Json_deserializers.invalid_user_pool_configuration_exception_of_yojson tree path)
      | _, "NotAuthorizedException" ->
          `NotAuthorizedException (Json_deserializers.not_authorized_exception_of_yojson tree path)
      | _, "OperationNotEnabledException" ->
          `OperationNotEnabledException
            (Json_deserializers.operation_not_enabled_exception_of_yojson tree path)
      | _, "PasswordResetRequiredException" ->
          `PasswordResetRequiredException
            (Json_deserializers.password_reset_required_exception_of_yojson tree path)
      | _, "ResourceNotFoundException" ->
          `ResourceNotFoundException
            (Json_deserializers.resource_not_found_exception_of_yojson tree path)
      | _, "TooManyRequestsException" ->
          `TooManyRequestsException
            (Json_deserializers.too_many_requests_exception_of_yojson tree path)
      | _, "UserNotConfirmedException" ->
          `UserNotConfirmedException
            (Json_deserializers.user_not_confirmed_exception_of_yojson tree path)
      | _, "UserNotFoundException" ->
          `UserNotFoundException (Json_deserializers.user_not_found_exception_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : forget_device_request) =
    let input = Json_serializers.forget_device_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"AWSCognitoIdentityProviderService.ForgetDevice"
      ~service ~context ~input
      ~output_deserializer:Smaws_Lib.Smithy_api.Json_deserializers.unit__of_yojson
      ~error_deserializer

  let request_with_metadata context (request : forget_device_request) =
    let input = Json_serializers.forget_device_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata
      ~shape_name:"AWSCognitoIdentityProviderService.ForgetDevice" ~service ~context ~input
      ~output_deserializer:Smaws_Lib.Smithy_api.Json_deserializers.unit__of_yojson
      ~error_deserializer
end

module ForgotPassword = struct
  let error_to_string = function
    | `CodeDeliveryFailureException _ ->
        "com.amazonaws.cognitoidentityprovider#CodeDeliveryFailureException"
    | `ForbiddenException _ -> "com.amazonaws.cognitoidentityprovider#ForbiddenException"
    | `InternalErrorException _ -> "com.amazonaws.cognitoidentityprovider#InternalErrorException"
    | `InvalidEmailRoleAccessPolicyException _ ->
        "com.amazonaws.cognitoidentityprovider#InvalidEmailRoleAccessPolicyException"
    | `InvalidLambdaResponseException _ ->
        "com.amazonaws.cognitoidentityprovider#InvalidLambdaResponseException"
    | `InvalidParameterException _ ->
        "com.amazonaws.cognitoidentityprovider#InvalidParameterException"
    | `InvalidSmsRoleAccessPolicyException _ ->
        "com.amazonaws.cognitoidentityprovider#InvalidSmsRoleAccessPolicyException"
    | `InvalidSmsRoleTrustRelationshipException _ ->
        "com.amazonaws.cognitoidentityprovider#InvalidSmsRoleTrustRelationshipException"
    | `LimitExceededException _ -> "com.amazonaws.cognitoidentityprovider#LimitExceededException"
    | `NotAuthorizedException _ -> "com.amazonaws.cognitoidentityprovider#NotAuthorizedException"
    | `OperationNotEnabledException _ ->
        "com.amazonaws.cognitoidentityprovider#OperationNotEnabledException"
    | `ResourceNotFoundException _ ->
        "com.amazonaws.cognitoidentityprovider#ResourceNotFoundException"
    | `TooManyRequestsException _ ->
        "com.amazonaws.cognitoidentityprovider#TooManyRequestsException"
    | `UnexpectedLambdaException _ ->
        "com.amazonaws.cognitoidentityprovider#UnexpectedLambdaException"
    | `UserLambdaValidationException _ ->
        "com.amazonaws.cognitoidentityprovider#UserLambdaValidationException"
    | `UserNotFoundException _ -> "com.amazonaws.cognitoidentityprovider#UserNotFoundException"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "CodeDeliveryFailureException" ->
          `CodeDeliveryFailureException
            (Json_deserializers.code_delivery_failure_exception_of_yojson tree path)
      | _, "ForbiddenException" ->
          `ForbiddenException (Json_deserializers.forbidden_exception_of_yojson tree path)
      | _, "InternalErrorException" ->
          `InternalErrorException (Json_deserializers.internal_error_exception_of_yojson tree path)
      | _, "InvalidEmailRoleAccessPolicyException" ->
          `InvalidEmailRoleAccessPolicyException
            (Json_deserializers.invalid_email_role_access_policy_exception_of_yojson tree path)
      | _, "InvalidLambdaResponseException" ->
          `InvalidLambdaResponseException
            (Json_deserializers.invalid_lambda_response_exception_of_yojson tree path)
      | _, "InvalidParameterException" ->
          `InvalidParameterException
            (Json_deserializers.invalid_parameter_exception_of_yojson tree path)
      | _, "InvalidSmsRoleAccessPolicyException" ->
          `InvalidSmsRoleAccessPolicyException
            (Json_deserializers.invalid_sms_role_access_policy_exception_of_yojson tree path)
      | _, "InvalidSmsRoleTrustRelationshipException" ->
          `InvalidSmsRoleTrustRelationshipException
            (Json_deserializers.invalid_sms_role_trust_relationship_exception_of_yojson tree path)
      | _, "LimitExceededException" ->
          `LimitExceededException (Json_deserializers.limit_exceeded_exception_of_yojson tree path)
      | _, "NotAuthorizedException" ->
          `NotAuthorizedException (Json_deserializers.not_authorized_exception_of_yojson tree path)
      | _, "OperationNotEnabledException" ->
          `OperationNotEnabledException
            (Json_deserializers.operation_not_enabled_exception_of_yojson tree path)
      | _, "ResourceNotFoundException" ->
          `ResourceNotFoundException
            (Json_deserializers.resource_not_found_exception_of_yojson tree path)
      | _, "TooManyRequestsException" ->
          `TooManyRequestsException
            (Json_deserializers.too_many_requests_exception_of_yojson tree path)
      | _, "UnexpectedLambdaException" ->
          `UnexpectedLambdaException
            (Json_deserializers.unexpected_lambda_exception_of_yojson tree path)
      | _, "UserLambdaValidationException" ->
          `UserLambdaValidationException
            (Json_deserializers.user_lambda_validation_exception_of_yojson tree path)
      | _, "UserNotFoundException" ->
          `UserNotFoundException (Json_deserializers.user_not_found_exception_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : forgot_password_request) =
    let input = Json_serializers.forgot_password_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request
      ~shape_name:"AWSCognitoIdentityProviderService.ForgotPassword" ~service ~context ~input
      ~output_deserializer:Json_deserializers.forgot_password_response_of_yojson ~error_deserializer

  let request_with_metadata context (request : forgot_password_request) =
    let input = Json_serializers.forgot_password_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata
      ~shape_name:"AWSCognitoIdentityProviderService.ForgotPassword" ~service ~context ~input
      ~output_deserializer:Json_deserializers.forgot_password_response_of_yojson ~error_deserializer
end

module GetCSVHeader = struct
  let error_to_string = function
    | `InternalErrorException _ -> "com.amazonaws.cognitoidentityprovider#InternalErrorException"
    | `InvalidParameterException _ ->
        "com.amazonaws.cognitoidentityprovider#InvalidParameterException"
    | `NotAuthorizedException _ -> "com.amazonaws.cognitoidentityprovider#NotAuthorizedException"
    | `OperationNotEnabledException _ ->
        "com.amazonaws.cognitoidentityprovider#OperationNotEnabledException"
    | `ResourceNotFoundException _ ->
        "com.amazonaws.cognitoidentityprovider#ResourceNotFoundException"
    | `TooManyRequestsException _ ->
        "com.amazonaws.cognitoidentityprovider#TooManyRequestsException"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "InternalErrorException" ->
          `InternalErrorException (Json_deserializers.internal_error_exception_of_yojson tree path)
      | _, "InvalidParameterException" ->
          `InvalidParameterException
            (Json_deserializers.invalid_parameter_exception_of_yojson tree path)
      | _, "NotAuthorizedException" ->
          `NotAuthorizedException (Json_deserializers.not_authorized_exception_of_yojson tree path)
      | _, "OperationNotEnabledException" ->
          `OperationNotEnabledException
            (Json_deserializers.operation_not_enabled_exception_of_yojson tree path)
      | _, "ResourceNotFoundException" ->
          `ResourceNotFoundException
            (Json_deserializers.resource_not_found_exception_of_yojson tree path)
      | _, "TooManyRequestsException" ->
          `TooManyRequestsException
            (Json_deserializers.too_many_requests_exception_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : get_csv_header_request) =
    let input = Json_serializers.get_csv_header_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"AWSCognitoIdentityProviderService.GetCSVHeader"
      ~service ~context ~input
      ~output_deserializer:Json_deserializers.get_csv_header_response_of_yojson ~error_deserializer

  let request_with_metadata context (request : get_csv_header_request) =
    let input = Json_serializers.get_csv_header_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata
      ~shape_name:"AWSCognitoIdentityProviderService.GetCSVHeader" ~service ~context ~input
      ~output_deserializer:Json_deserializers.get_csv_header_response_of_yojson ~error_deserializer
end

module GetDevice = struct
  let error_to_string = function
    | `ForbiddenException _ -> "com.amazonaws.cognitoidentityprovider#ForbiddenException"
    | `InternalErrorException _ -> "com.amazonaws.cognitoidentityprovider#InternalErrorException"
    | `InvalidParameterException _ ->
        "com.amazonaws.cognitoidentityprovider#InvalidParameterException"
    | `InvalidUserPoolConfigurationException _ ->
        "com.amazonaws.cognitoidentityprovider#InvalidUserPoolConfigurationException"
    | `NotAuthorizedException _ -> "com.amazonaws.cognitoidentityprovider#NotAuthorizedException"
    | `OperationNotEnabledException _ ->
        "com.amazonaws.cognitoidentityprovider#OperationNotEnabledException"
    | `PasswordResetRequiredException _ ->
        "com.amazonaws.cognitoidentityprovider#PasswordResetRequiredException"
    | `ResourceNotFoundException _ ->
        "com.amazonaws.cognitoidentityprovider#ResourceNotFoundException"
    | `TooManyRequestsException _ ->
        "com.amazonaws.cognitoidentityprovider#TooManyRequestsException"
    | `UserNotConfirmedException _ ->
        "com.amazonaws.cognitoidentityprovider#UserNotConfirmedException"
    | `UserNotFoundException _ -> "com.amazonaws.cognitoidentityprovider#UserNotFoundException"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "ForbiddenException" ->
          `ForbiddenException (Json_deserializers.forbidden_exception_of_yojson tree path)
      | _, "InternalErrorException" ->
          `InternalErrorException (Json_deserializers.internal_error_exception_of_yojson tree path)
      | _, "InvalidParameterException" ->
          `InvalidParameterException
            (Json_deserializers.invalid_parameter_exception_of_yojson tree path)
      | _, "InvalidUserPoolConfigurationException" ->
          `InvalidUserPoolConfigurationException
            (Json_deserializers.invalid_user_pool_configuration_exception_of_yojson tree path)
      | _, "NotAuthorizedException" ->
          `NotAuthorizedException (Json_deserializers.not_authorized_exception_of_yojson tree path)
      | _, "OperationNotEnabledException" ->
          `OperationNotEnabledException
            (Json_deserializers.operation_not_enabled_exception_of_yojson tree path)
      | _, "PasswordResetRequiredException" ->
          `PasswordResetRequiredException
            (Json_deserializers.password_reset_required_exception_of_yojson tree path)
      | _, "ResourceNotFoundException" ->
          `ResourceNotFoundException
            (Json_deserializers.resource_not_found_exception_of_yojson tree path)
      | _, "TooManyRequestsException" ->
          `TooManyRequestsException
            (Json_deserializers.too_many_requests_exception_of_yojson tree path)
      | _, "UserNotConfirmedException" ->
          `UserNotConfirmedException
            (Json_deserializers.user_not_confirmed_exception_of_yojson tree path)
      | _, "UserNotFoundException" ->
          `UserNotFoundException (Json_deserializers.user_not_found_exception_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : get_device_request) =
    let input = Json_serializers.get_device_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"AWSCognitoIdentityProviderService.GetDevice"
      ~service ~context ~input ~output_deserializer:Json_deserializers.get_device_response_of_yojson
      ~error_deserializer

  let request_with_metadata context (request : get_device_request) =
    let input = Json_serializers.get_device_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata
      ~shape_name:"AWSCognitoIdentityProviderService.GetDevice" ~service ~context ~input
      ~output_deserializer:Json_deserializers.get_device_response_of_yojson ~error_deserializer
end

module GetGroup = struct
  let error_to_string = function
    | `InternalErrorException _ -> "com.amazonaws.cognitoidentityprovider#InternalErrorException"
    | `InvalidParameterException _ ->
        "com.amazonaws.cognitoidentityprovider#InvalidParameterException"
    | `NotAuthorizedException _ -> "com.amazonaws.cognitoidentityprovider#NotAuthorizedException"
    | `OperationNotEnabledException _ ->
        "com.amazonaws.cognitoidentityprovider#OperationNotEnabledException"
    | `ResourceNotFoundException _ ->
        "com.amazonaws.cognitoidentityprovider#ResourceNotFoundException"
    | `TooManyRequestsException _ ->
        "com.amazonaws.cognitoidentityprovider#TooManyRequestsException"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "InternalErrorException" ->
          `InternalErrorException (Json_deserializers.internal_error_exception_of_yojson tree path)
      | _, "InvalidParameterException" ->
          `InvalidParameterException
            (Json_deserializers.invalid_parameter_exception_of_yojson tree path)
      | _, "NotAuthorizedException" ->
          `NotAuthorizedException (Json_deserializers.not_authorized_exception_of_yojson tree path)
      | _, "OperationNotEnabledException" ->
          `OperationNotEnabledException
            (Json_deserializers.operation_not_enabled_exception_of_yojson tree path)
      | _, "ResourceNotFoundException" ->
          `ResourceNotFoundException
            (Json_deserializers.resource_not_found_exception_of_yojson tree path)
      | _, "TooManyRequestsException" ->
          `TooManyRequestsException
            (Json_deserializers.too_many_requests_exception_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : get_group_request) =
    let input = Json_serializers.get_group_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"AWSCognitoIdentityProviderService.GetGroup"
      ~service ~context ~input ~output_deserializer:Json_deserializers.get_group_response_of_yojson
      ~error_deserializer

  let request_with_metadata context (request : get_group_request) =
    let input = Json_serializers.get_group_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata
      ~shape_name:"AWSCognitoIdentityProviderService.GetGroup" ~service ~context ~input
      ~output_deserializer:Json_deserializers.get_group_response_of_yojson ~error_deserializer
end

module GetIdentityProviderByIdentifier = struct
  let error_to_string = function
    | `InternalErrorException _ -> "com.amazonaws.cognitoidentityprovider#InternalErrorException"
    | `InvalidParameterException _ ->
        "com.amazonaws.cognitoidentityprovider#InvalidParameterException"
    | `NotAuthorizedException _ -> "com.amazonaws.cognitoidentityprovider#NotAuthorizedException"
    | `ResourceNotFoundException _ ->
        "com.amazonaws.cognitoidentityprovider#ResourceNotFoundException"
    | `TooManyRequestsException _ ->
        "com.amazonaws.cognitoidentityprovider#TooManyRequestsException"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "InternalErrorException" ->
          `InternalErrorException (Json_deserializers.internal_error_exception_of_yojson tree path)
      | _, "InvalidParameterException" ->
          `InvalidParameterException
            (Json_deserializers.invalid_parameter_exception_of_yojson tree path)
      | _, "NotAuthorizedException" ->
          `NotAuthorizedException (Json_deserializers.not_authorized_exception_of_yojson tree path)
      | _, "ResourceNotFoundException" ->
          `ResourceNotFoundException
            (Json_deserializers.resource_not_found_exception_of_yojson tree path)
      | _, "TooManyRequestsException" ->
          `TooManyRequestsException
            (Json_deserializers.too_many_requests_exception_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : get_identity_provider_by_identifier_request) =
    let input = Json_serializers.get_identity_provider_by_identifier_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request
      ~shape_name:"AWSCognitoIdentityProviderService.GetIdentityProviderByIdentifier" ~service
      ~context ~input
      ~output_deserializer:Json_deserializers.get_identity_provider_by_identifier_response_of_yojson
      ~error_deserializer

  let request_with_metadata context (request : get_identity_provider_by_identifier_request) =
    let input = Json_serializers.get_identity_provider_by_identifier_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata
      ~shape_name:"AWSCognitoIdentityProviderService.GetIdentityProviderByIdentifier" ~service
      ~context ~input
      ~output_deserializer:Json_deserializers.get_identity_provider_by_identifier_response_of_yojson
      ~error_deserializer
end

module GetLogDeliveryConfiguration = struct
  let error_to_string = function
    | `InternalErrorException _ -> "com.amazonaws.cognitoidentityprovider#InternalErrorException"
    | `InvalidParameterException _ ->
        "com.amazonaws.cognitoidentityprovider#InvalidParameterException"
    | `NotAuthorizedException _ -> "com.amazonaws.cognitoidentityprovider#NotAuthorizedException"
    | `ResourceNotFoundException _ ->
        "com.amazonaws.cognitoidentityprovider#ResourceNotFoundException"
    | `TooManyRequestsException _ ->
        "com.amazonaws.cognitoidentityprovider#TooManyRequestsException"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "InternalErrorException" ->
          `InternalErrorException (Json_deserializers.internal_error_exception_of_yojson tree path)
      | _, "InvalidParameterException" ->
          `InvalidParameterException
            (Json_deserializers.invalid_parameter_exception_of_yojson tree path)
      | _, "NotAuthorizedException" ->
          `NotAuthorizedException (Json_deserializers.not_authorized_exception_of_yojson tree path)
      | _, "ResourceNotFoundException" ->
          `ResourceNotFoundException
            (Json_deserializers.resource_not_found_exception_of_yojson tree path)
      | _, "TooManyRequestsException" ->
          `TooManyRequestsException
            (Json_deserializers.too_many_requests_exception_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : get_log_delivery_configuration_request) =
    let input = Json_serializers.get_log_delivery_configuration_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request
      ~shape_name:"AWSCognitoIdentityProviderService.GetLogDeliveryConfiguration" ~service ~context
      ~input
      ~output_deserializer:Json_deserializers.get_log_delivery_configuration_response_of_yojson
      ~error_deserializer

  let request_with_metadata context (request : get_log_delivery_configuration_request) =
    let input = Json_serializers.get_log_delivery_configuration_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata
      ~shape_name:"AWSCognitoIdentityProviderService.GetLogDeliveryConfiguration" ~service ~context
      ~input
      ~output_deserializer:Json_deserializers.get_log_delivery_configuration_response_of_yojson
      ~error_deserializer
end

module GetProvisionedLimit = struct
  let error_to_string = function
    | `InternalErrorException _ -> "com.amazonaws.cognitoidentityprovider#InternalErrorException"
    | `InvalidParameterException _ ->
        "com.amazonaws.cognitoidentityprovider#InvalidParameterException"
    | `NotAuthorizedException _ -> "com.amazonaws.cognitoidentityprovider#NotAuthorizedException"
    | `ResourceNotFoundException _ ->
        "com.amazonaws.cognitoidentityprovider#ResourceNotFoundException"
    | `TooManyRequestsException _ ->
        "com.amazonaws.cognitoidentityprovider#TooManyRequestsException"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "InternalErrorException" ->
          `InternalErrorException (Json_deserializers.internal_error_exception_of_yojson tree path)
      | _, "InvalidParameterException" ->
          `InvalidParameterException
            (Json_deserializers.invalid_parameter_exception_of_yojson tree path)
      | _, "NotAuthorizedException" ->
          `NotAuthorizedException (Json_deserializers.not_authorized_exception_of_yojson tree path)
      | _, "ResourceNotFoundException" ->
          `ResourceNotFoundException
            (Json_deserializers.resource_not_found_exception_of_yojson tree path)
      | _, "TooManyRequestsException" ->
          `TooManyRequestsException
            (Json_deserializers.too_many_requests_exception_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : get_provisioned_limit_request) =
    let input = Json_serializers.get_provisioned_limit_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request
      ~shape_name:"AWSCognitoIdentityProviderService.GetProvisionedLimit" ~service ~context ~input
      ~output_deserializer:Json_deserializers.get_provisioned_limit_response_of_yojson
      ~error_deserializer

  let request_with_metadata context (request : get_provisioned_limit_request) =
    let input = Json_serializers.get_provisioned_limit_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata
      ~shape_name:"AWSCognitoIdentityProviderService.GetProvisionedLimit" ~service ~context ~input
      ~output_deserializer:Json_deserializers.get_provisioned_limit_response_of_yojson
      ~error_deserializer
end

module GetSigningCertificate = struct
  let error_to_string = function
    | `InternalErrorException _ -> "com.amazonaws.cognitoidentityprovider#InternalErrorException"
    | `InvalidParameterException _ ->
        "com.amazonaws.cognitoidentityprovider#InvalidParameterException"
    | `OperationNotEnabledException _ ->
        "com.amazonaws.cognitoidentityprovider#OperationNotEnabledException"
    | `ResourceNotFoundException _ ->
        "com.amazonaws.cognitoidentityprovider#ResourceNotFoundException"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "InternalErrorException" ->
          `InternalErrorException (Json_deserializers.internal_error_exception_of_yojson tree path)
      | _, "InvalidParameterException" ->
          `InvalidParameterException
            (Json_deserializers.invalid_parameter_exception_of_yojson tree path)
      | _, "OperationNotEnabledException" ->
          `OperationNotEnabledException
            (Json_deserializers.operation_not_enabled_exception_of_yojson tree path)
      | _, "ResourceNotFoundException" ->
          `ResourceNotFoundException
            (Json_deserializers.resource_not_found_exception_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : get_signing_certificate_request) =
    let input = Json_serializers.get_signing_certificate_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request
      ~shape_name:"AWSCognitoIdentityProviderService.GetSigningCertificate" ~service ~context ~input
      ~output_deserializer:Json_deserializers.get_signing_certificate_response_of_yojson
      ~error_deserializer

  let request_with_metadata context (request : get_signing_certificate_request) =
    let input = Json_serializers.get_signing_certificate_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata
      ~shape_name:"AWSCognitoIdentityProviderService.GetSigningCertificate" ~service ~context ~input
      ~output_deserializer:Json_deserializers.get_signing_certificate_response_of_yojson
      ~error_deserializer
end

module GetTokensFromRefreshToken = struct
  let error_to_string = function
    | `ForbiddenException _ -> "com.amazonaws.cognitoidentityprovider#ForbiddenException"
    | `InternalErrorException _ -> "com.amazonaws.cognitoidentityprovider#InternalErrorException"
    | `InvalidLambdaResponseException _ ->
        "com.amazonaws.cognitoidentityprovider#InvalidLambdaResponseException"
    | `InvalidParameterException _ ->
        "com.amazonaws.cognitoidentityprovider#InvalidParameterException"
    | `NotAuthorizedException _ -> "com.amazonaws.cognitoidentityprovider#NotAuthorizedException"
    | `OperationNotEnabledException _ ->
        "com.amazonaws.cognitoidentityprovider#OperationNotEnabledException"
    | `RefreshTokenReuseException _ ->
        "com.amazonaws.cognitoidentityprovider#RefreshTokenReuseException"
    | `ResourceNotFoundException _ ->
        "com.amazonaws.cognitoidentityprovider#ResourceNotFoundException"
    | `TooManyRequestsException _ ->
        "com.amazonaws.cognitoidentityprovider#TooManyRequestsException"
    | `UnexpectedLambdaException _ ->
        "com.amazonaws.cognitoidentityprovider#UnexpectedLambdaException"
    | `UserLambdaValidationException _ ->
        "com.amazonaws.cognitoidentityprovider#UserLambdaValidationException"
    | `UserNotFoundException _ -> "com.amazonaws.cognitoidentityprovider#UserNotFoundException"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "ForbiddenException" ->
          `ForbiddenException (Json_deserializers.forbidden_exception_of_yojson tree path)
      | _, "InternalErrorException" ->
          `InternalErrorException (Json_deserializers.internal_error_exception_of_yojson tree path)
      | _, "InvalidLambdaResponseException" ->
          `InvalidLambdaResponseException
            (Json_deserializers.invalid_lambda_response_exception_of_yojson tree path)
      | _, "InvalidParameterException" ->
          `InvalidParameterException
            (Json_deserializers.invalid_parameter_exception_of_yojson tree path)
      | _, "NotAuthorizedException" ->
          `NotAuthorizedException (Json_deserializers.not_authorized_exception_of_yojson tree path)
      | _, "OperationNotEnabledException" ->
          `OperationNotEnabledException
            (Json_deserializers.operation_not_enabled_exception_of_yojson tree path)
      | _, "RefreshTokenReuseException" ->
          `RefreshTokenReuseException
            (Json_deserializers.refresh_token_reuse_exception_of_yojson tree path)
      | _, "ResourceNotFoundException" ->
          `ResourceNotFoundException
            (Json_deserializers.resource_not_found_exception_of_yojson tree path)
      | _, "TooManyRequestsException" ->
          `TooManyRequestsException
            (Json_deserializers.too_many_requests_exception_of_yojson tree path)
      | _, "UnexpectedLambdaException" ->
          `UnexpectedLambdaException
            (Json_deserializers.unexpected_lambda_exception_of_yojson tree path)
      | _, "UserLambdaValidationException" ->
          `UserLambdaValidationException
            (Json_deserializers.user_lambda_validation_exception_of_yojson tree path)
      | _, "UserNotFoundException" ->
          `UserNotFoundException (Json_deserializers.user_not_found_exception_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : get_tokens_from_refresh_token_request) =
    let input = Json_serializers.get_tokens_from_refresh_token_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request
      ~shape_name:"AWSCognitoIdentityProviderService.GetTokensFromRefreshToken" ~service ~context
      ~input
      ~output_deserializer:Json_deserializers.get_tokens_from_refresh_token_response_of_yojson
      ~error_deserializer

  let request_with_metadata context (request : get_tokens_from_refresh_token_request) =
    let input = Json_serializers.get_tokens_from_refresh_token_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata
      ~shape_name:"AWSCognitoIdentityProviderService.GetTokensFromRefreshToken" ~service ~context
      ~input
      ~output_deserializer:Json_deserializers.get_tokens_from_refresh_token_response_of_yojson
      ~error_deserializer
end

module GetUICustomization = struct
  let error_to_string = function
    | `InternalErrorException _ -> "com.amazonaws.cognitoidentityprovider#InternalErrorException"
    | `InvalidParameterException _ ->
        "com.amazonaws.cognitoidentityprovider#InvalidParameterException"
    | `NotAuthorizedException _ -> "com.amazonaws.cognitoidentityprovider#NotAuthorizedException"
    | `OperationNotEnabledException _ ->
        "com.amazonaws.cognitoidentityprovider#OperationNotEnabledException"
    | `ResourceNotFoundException _ ->
        "com.amazonaws.cognitoidentityprovider#ResourceNotFoundException"
    | `TooManyRequestsException _ ->
        "com.amazonaws.cognitoidentityprovider#TooManyRequestsException"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "InternalErrorException" ->
          `InternalErrorException (Json_deserializers.internal_error_exception_of_yojson tree path)
      | _, "InvalidParameterException" ->
          `InvalidParameterException
            (Json_deserializers.invalid_parameter_exception_of_yojson tree path)
      | _, "NotAuthorizedException" ->
          `NotAuthorizedException (Json_deserializers.not_authorized_exception_of_yojson tree path)
      | _, "OperationNotEnabledException" ->
          `OperationNotEnabledException
            (Json_deserializers.operation_not_enabled_exception_of_yojson tree path)
      | _, "ResourceNotFoundException" ->
          `ResourceNotFoundException
            (Json_deserializers.resource_not_found_exception_of_yojson tree path)
      | _, "TooManyRequestsException" ->
          `TooManyRequestsException
            (Json_deserializers.too_many_requests_exception_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : get_ui_customization_request) =
    let input = Json_serializers.get_ui_customization_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request
      ~shape_name:"AWSCognitoIdentityProviderService.GetUICustomization" ~service ~context ~input
      ~output_deserializer:Json_deserializers.get_ui_customization_response_of_yojson
      ~error_deserializer

  let request_with_metadata context (request : get_ui_customization_request) =
    let input = Json_serializers.get_ui_customization_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata
      ~shape_name:"AWSCognitoIdentityProviderService.GetUICustomization" ~service ~context ~input
      ~output_deserializer:Json_deserializers.get_ui_customization_response_of_yojson
      ~error_deserializer
end

module GetUser = struct
  let error_to_string = function
    | `ForbiddenException _ -> "com.amazonaws.cognitoidentityprovider#ForbiddenException"
    | `InternalErrorException _ -> "com.amazonaws.cognitoidentityprovider#InternalErrorException"
    | `InvalidParameterException _ ->
        "com.amazonaws.cognitoidentityprovider#InvalidParameterException"
    | `NotAuthorizedException _ -> "com.amazonaws.cognitoidentityprovider#NotAuthorizedException"
    | `OperationNotEnabledException _ ->
        "com.amazonaws.cognitoidentityprovider#OperationNotEnabledException"
    | `PasswordResetRequiredException _ ->
        "com.amazonaws.cognitoidentityprovider#PasswordResetRequiredException"
    | `ResourceNotFoundException _ ->
        "com.amazonaws.cognitoidentityprovider#ResourceNotFoundException"
    | `TooManyRequestsException _ ->
        "com.amazonaws.cognitoidentityprovider#TooManyRequestsException"
    | `UserNotConfirmedException _ ->
        "com.amazonaws.cognitoidentityprovider#UserNotConfirmedException"
    | `UserNotFoundException _ -> "com.amazonaws.cognitoidentityprovider#UserNotFoundException"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "ForbiddenException" ->
          `ForbiddenException (Json_deserializers.forbidden_exception_of_yojson tree path)
      | _, "InternalErrorException" ->
          `InternalErrorException (Json_deserializers.internal_error_exception_of_yojson tree path)
      | _, "InvalidParameterException" ->
          `InvalidParameterException
            (Json_deserializers.invalid_parameter_exception_of_yojson tree path)
      | _, "NotAuthorizedException" ->
          `NotAuthorizedException (Json_deserializers.not_authorized_exception_of_yojson tree path)
      | _, "OperationNotEnabledException" ->
          `OperationNotEnabledException
            (Json_deserializers.operation_not_enabled_exception_of_yojson tree path)
      | _, "PasswordResetRequiredException" ->
          `PasswordResetRequiredException
            (Json_deserializers.password_reset_required_exception_of_yojson tree path)
      | _, "ResourceNotFoundException" ->
          `ResourceNotFoundException
            (Json_deserializers.resource_not_found_exception_of_yojson tree path)
      | _, "TooManyRequestsException" ->
          `TooManyRequestsException
            (Json_deserializers.too_many_requests_exception_of_yojson tree path)
      | _, "UserNotConfirmedException" ->
          `UserNotConfirmedException
            (Json_deserializers.user_not_confirmed_exception_of_yojson tree path)
      | _, "UserNotFoundException" ->
          `UserNotFoundException (Json_deserializers.user_not_found_exception_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : get_user_request) =
    let input = Json_serializers.get_user_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"AWSCognitoIdentityProviderService.GetUser"
      ~service ~context ~input ~output_deserializer:Json_deserializers.get_user_response_of_yojson
      ~error_deserializer

  let request_with_metadata context (request : get_user_request) =
    let input = Json_serializers.get_user_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata
      ~shape_name:"AWSCognitoIdentityProviderService.GetUser" ~service ~context ~input
      ~output_deserializer:Json_deserializers.get_user_response_of_yojson ~error_deserializer
end

module GetUserAttributeVerificationCode = struct
  let error_to_string = function
    | `CodeDeliveryFailureException _ ->
        "com.amazonaws.cognitoidentityprovider#CodeDeliveryFailureException"
    | `ForbiddenException _ -> "com.amazonaws.cognitoidentityprovider#ForbiddenException"
    | `InternalErrorException _ -> "com.amazonaws.cognitoidentityprovider#InternalErrorException"
    | `InvalidEmailRoleAccessPolicyException _ ->
        "com.amazonaws.cognitoidentityprovider#InvalidEmailRoleAccessPolicyException"
    | `InvalidLambdaResponseException _ ->
        "com.amazonaws.cognitoidentityprovider#InvalidLambdaResponseException"
    | `InvalidParameterException _ ->
        "com.amazonaws.cognitoidentityprovider#InvalidParameterException"
    | `InvalidSmsRoleAccessPolicyException _ ->
        "com.amazonaws.cognitoidentityprovider#InvalidSmsRoleAccessPolicyException"
    | `InvalidSmsRoleTrustRelationshipException _ ->
        "com.amazonaws.cognitoidentityprovider#InvalidSmsRoleTrustRelationshipException"
    | `LimitExceededException _ -> "com.amazonaws.cognitoidentityprovider#LimitExceededException"
    | `NotAuthorizedException _ -> "com.amazonaws.cognitoidentityprovider#NotAuthorizedException"
    | `OperationNotEnabledException _ ->
        "com.amazonaws.cognitoidentityprovider#OperationNotEnabledException"
    | `PasswordResetRequiredException _ ->
        "com.amazonaws.cognitoidentityprovider#PasswordResetRequiredException"
    | `ResourceNotFoundException _ ->
        "com.amazonaws.cognitoidentityprovider#ResourceNotFoundException"
    | `TooManyRequestsException _ ->
        "com.amazonaws.cognitoidentityprovider#TooManyRequestsException"
    | `UnexpectedLambdaException _ ->
        "com.amazonaws.cognitoidentityprovider#UnexpectedLambdaException"
    | `UserLambdaValidationException _ ->
        "com.amazonaws.cognitoidentityprovider#UserLambdaValidationException"
    | `UserNotConfirmedException _ ->
        "com.amazonaws.cognitoidentityprovider#UserNotConfirmedException"
    | `UserNotFoundException _ -> "com.amazonaws.cognitoidentityprovider#UserNotFoundException"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "CodeDeliveryFailureException" ->
          `CodeDeliveryFailureException
            (Json_deserializers.code_delivery_failure_exception_of_yojson tree path)
      | _, "ForbiddenException" ->
          `ForbiddenException (Json_deserializers.forbidden_exception_of_yojson tree path)
      | _, "InternalErrorException" ->
          `InternalErrorException (Json_deserializers.internal_error_exception_of_yojson tree path)
      | _, "InvalidEmailRoleAccessPolicyException" ->
          `InvalidEmailRoleAccessPolicyException
            (Json_deserializers.invalid_email_role_access_policy_exception_of_yojson tree path)
      | _, "InvalidLambdaResponseException" ->
          `InvalidLambdaResponseException
            (Json_deserializers.invalid_lambda_response_exception_of_yojson tree path)
      | _, "InvalidParameterException" ->
          `InvalidParameterException
            (Json_deserializers.invalid_parameter_exception_of_yojson tree path)
      | _, "InvalidSmsRoleAccessPolicyException" ->
          `InvalidSmsRoleAccessPolicyException
            (Json_deserializers.invalid_sms_role_access_policy_exception_of_yojson tree path)
      | _, "InvalidSmsRoleTrustRelationshipException" ->
          `InvalidSmsRoleTrustRelationshipException
            (Json_deserializers.invalid_sms_role_trust_relationship_exception_of_yojson tree path)
      | _, "LimitExceededException" ->
          `LimitExceededException (Json_deserializers.limit_exceeded_exception_of_yojson tree path)
      | _, "NotAuthorizedException" ->
          `NotAuthorizedException (Json_deserializers.not_authorized_exception_of_yojson tree path)
      | _, "OperationNotEnabledException" ->
          `OperationNotEnabledException
            (Json_deserializers.operation_not_enabled_exception_of_yojson tree path)
      | _, "PasswordResetRequiredException" ->
          `PasswordResetRequiredException
            (Json_deserializers.password_reset_required_exception_of_yojson tree path)
      | _, "ResourceNotFoundException" ->
          `ResourceNotFoundException
            (Json_deserializers.resource_not_found_exception_of_yojson tree path)
      | _, "TooManyRequestsException" ->
          `TooManyRequestsException
            (Json_deserializers.too_many_requests_exception_of_yojson tree path)
      | _, "UnexpectedLambdaException" ->
          `UnexpectedLambdaException
            (Json_deserializers.unexpected_lambda_exception_of_yojson tree path)
      | _, "UserLambdaValidationException" ->
          `UserLambdaValidationException
            (Json_deserializers.user_lambda_validation_exception_of_yojson tree path)
      | _, "UserNotConfirmedException" ->
          `UserNotConfirmedException
            (Json_deserializers.user_not_confirmed_exception_of_yojson tree path)
      | _, "UserNotFoundException" ->
          `UserNotFoundException (Json_deserializers.user_not_found_exception_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : get_user_attribute_verification_code_request) =
    let input = Json_serializers.get_user_attribute_verification_code_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request
      ~shape_name:"AWSCognitoIdentityProviderService.GetUserAttributeVerificationCode" ~service
      ~context ~input
      ~output_deserializer:
        Json_deserializers.get_user_attribute_verification_code_response_of_yojson
      ~error_deserializer

  let request_with_metadata context (request : get_user_attribute_verification_code_request) =
    let input = Json_serializers.get_user_attribute_verification_code_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata
      ~shape_name:"AWSCognitoIdentityProviderService.GetUserAttributeVerificationCode" ~service
      ~context ~input
      ~output_deserializer:
        Json_deserializers.get_user_attribute_verification_code_response_of_yojson
      ~error_deserializer
end

module GetUserAuthFactors = struct
  let error_to_string = function
    | `ForbiddenException _ -> "com.amazonaws.cognitoidentityprovider#ForbiddenException"
    | `InternalErrorException _ -> "com.amazonaws.cognitoidentityprovider#InternalErrorException"
    | `InvalidParameterException _ ->
        "com.amazonaws.cognitoidentityprovider#InvalidParameterException"
    | `NotAuthorizedException _ -> "com.amazonaws.cognitoidentityprovider#NotAuthorizedException"
    | `OperationNotEnabledException _ ->
        "com.amazonaws.cognitoidentityprovider#OperationNotEnabledException"
    | `PasswordResetRequiredException _ ->
        "com.amazonaws.cognitoidentityprovider#PasswordResetRequiredException"
    | `ResourceNotFoundException _ ->
        "com.amazonaws.cognitoidentityprovider#ResourceNotFoundException"
    | `TooManyRequestsException _ ->
        "com.amazonaws.cognitoidentityprovider#TooManyRequestsException"
    | `UserNotConfirmedException _ ->
        "com.amazonaws.cognitoidentityprovider#UserNotConfirmedException"
    | `UserNotFoundException _ -> "com.amazonaws.cognitoidentityprovider#UserNotFoundException"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "ForbiddenException" ->
          `ForbiddenException (Json_deserializers.forbidden_exception_of_yojson tree path)
      | _, "InternalErrorException" ->
          `InternalErrorException (Json_deserializers.internal_error_exception_of_yojson tree path)
      | _, "InvalidParameterException" ->
          `InvalidParameterException
            (Json_deserializers.invalid_parameter_exception_of_yojson tree path)
      | _, "NotAuthorizedException" ->
          `NotAuthorizedException (Json_deserializers.not_authorized_exception_of_yojson tree path)
      | _, "OperationNotEnabledException" ->
          `OperationNotEnabledException
            (Json_deserializers.operation_not_enabled_exception_of_yojson tree path)
      | _, "PasswordResetRequiredException" ->
          `PasswordResetRequiredException
            (Json_deserializers.password_reset_required_exception_of_yojson tree path)
      | _, "ResourceNotFoundException" ->
          `ResourceNotFoundException
            (Json_deserializers.resource_not_found_exception_of_yojson tree path)
      | _, "TooManyRequestsException" ->
          `TooManyRequestsException
            (Json_deserializers.too_many_requests_exception_of_yojson tree path)
      | _, "UserNotConfirmedException" ->
          `UserNotConfirmedException
            (Json_deserializers.user_not_confirmed_exception_of_yojson tree path)
      | _, "UserNotFoundException" ->
          `UserNotFoundException (Json_deserializers.user_not_found_exception_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : get_user_auth_factors_request) =
    let input = Json_serializers.get_user_auth_factors_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request
      ~shape_name:"AWSCognitoIdentityProviderService.GetUserAuthFactors" ~service ~context ~input
      ~output_deserializer:Json_deserializers.get_user_auth_factors_response_of_yojson
      ~error_deserializer

  let request_with_metadata context (request : get_user_auth_factors_request) =
    let input = Json_serializers.get_user_auth_factors_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata
      ~shape_name:"AWSCognitoIdentityProviderService.GetUserAuthFactors" ~service ~context ~input
      ~output_deserializer:Json_deserializers.get_user_auth_factors_response_of_yojson
      ~error_deserializer
end

module GetUserPoolMfaConfig = struct
  let error_to_string = function
    | `InternalErrorException _ -> "com.amazonaws.cognitoidentityprovider#InternalErrorException"
    | `InvalidParameterException _ ->
        "com.amazonaws.cognitoidentityprovider#InvalidParameterException"
    | `NotAuthorizedException _ -> "com.amazonaws.cognitoidentityprovider#NotAuthorizedException"
    | `ResourceNotFoundException _ ->
        "com.amazonaws.cognitoidentityprovider#ResourceNotFoundException"
    | `TooManyRequestsException _ ->
        "com.amazonaws.cognitoidentityprovider#TooManyRequestsException"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "InternalErrorException" ->
          `InternalErrorException (Json_deserializers.internal_error_exception_of_yojson tree path)
      | _, "InvalidParameterException" ->
          `InvalidParameterException
            (Json_deserializers.invalid_parameter_exception_of_yojson tree path)
      | _, "NotAuthorizedException" ->
          `NotAuthorizedException (Json_deserializers.not_authorized_exception_of_yojson tree path)
      | _, "ResourceNotFoundException" ->
          `ResourceNotFoundException
            (Json_deserializers.resource_not_found_exception_of_yojson tree path)
      | _, "TooManyRequestsException" ->
          `TooManyRequestsException
            (Json_deserializers.too_many_requests_exception_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : get_user_pool_mfa_config_request) =
    let input = Json_serializers.get_user_pool_mfa_config_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request
      ~shape_name:"AWSCognitoIdentityProviderService.GetUserPoolMfaConfig" ~service ~context ~input
      ~output_deserializer:Json_deserializers.get_user_pool_mfa_config_response_of_yojson
      ~error_deserializer

  let request_with_metadata context (request : get_user_pool_mfa_config_request) =
    let input = Json_serializers.get_user_pool_mfa_config_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata
      ~shape_name:"AWSCognitoIdentityProviderService.GetUserPoolMfaConfig" ~service ~context ~input
      ~output_deserializer:Json_deserializers.get_user_pool_mfa_config_response_of_yojson
      ~error_deserializer
end

module GlobalSignOut = struct
  let error_to_string = function
    | `ForbiddenException _ -> "com.amazonaws.cognitoidentityprovider#ForbiddenException"
    | `InternalErrorException _ -> "com.amazonaws.cognitoidentityprovider#InternalErrorException"
    | `InvalidParameterException _ ->
        "com.amazonaws.cognitoidentityprovider#InvalidParameterException"
    | `NotAuthorizedException _ -> "com.amazonaws.cognitoidentityprovider#NotAuthorizedException"
    | `OperationNotEnabledException _ ->
        "com.amazonaws.cognitoidentityprovider#OperationNotEnabledException"
    | `PasswordResetRequiredException _ ->
        "com.amazonaws.cognitoidentityprovider#PasswordResetRequiredException"
    | `ResourceNotFoundException _ ->
        "com.amazonaws.cognitoidentityprovider#ResourceNotFoundException"
    | `TooManyRequestsException _ ->
        "com.amazonaws.cognitoidentityprovider#TooManyRequestsException"
    | `UserNotConfirmedException _ ->
        "com.amazonaws.cognitoidentityprovider#UserNotConfirmedException"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "ForbiddenException" ->
          `ForbiddenException (Json_deserializers.forbidden_exception_of_yojson tree path)
      | _, "InternalErrorException" ->
          `InternalErrorException (Json_deserializers.internal_error_exception_of_yojson tree path)
      | _, "InvalidParameterException" ->
          `InvalidParameterException
            (Json_deserializers.invalid_parameter_exception_of_yojson tree path)
      | _, "NotAuthorizedException" ->
          `NotAuthorizedException (Json_deserializers.not_authorized_exception_of_yojson tree path)
      | _, "OperationNotEnabledException" ->
          `OperationNotEnabledException
            (Json_deserializers.operation_not_enabled_exception_of_yojson tree path)
      | _, "PasswordResetRequiredException" ->
          `PasswordResetRequiredException
            (Json_deserializers.password_reset_required_exception_of_yojson tree path)
      | _, "ResourceNotFoundException" ->
          `ResourceNotFoundException
            (Json_deserializers.resource_not_found_exception_of_yojson tree path)
      | _, "TooManyRequestsException" ->
          `TooManyRequestsException
            (Json_deserializers.too_many_requests_exception_of_yojson tree path)
      | _, "UserNotConfirmedException" ->
          `UserNotConfirmedException
            (Json_deserializers.user_not_confirmed_exception_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : global_sign_out_request) =
    let input = Json_serializers.global_sign_out_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request
      ~shape_name:"AWSCognitoIdentityProviderService.GlobalSignOut" ~service ~context ~input
      ~output_deserializer:Json_deserializers.global_sign_out_response_of_yojson ~error_deserializer

  let request_with_metadata context (request : global_sign_out_request) =
    let input = Json_serializers.global_sign_out_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata
      ~shape_name:"AWSCognitoIdentityProviderService.GlobalSignOut" ~service ~context ~input
      ~output_deserializer:Json_deserializers.global_sign_out_response_of_yojson ~error_deserializer
end

module InitiateAuth = struct
  let error_to_string = function
    | `ForbiddenException _ -> "com.amazonaws.cognitoidentityprovider#ForbiddenException"
    | `InternalErrorException _ -> "com.amazonaws.cognitoidentityprovider#InternalErrorException"
    | `InvalidEmailRoleAccessPolicyException _ ->
        "com.amazonaws.cognitoidentityprovider#InvalidEmailRoleAccessPolicyException"
    | `InvalidLambdaResponseException _ ->
        "com.amazonaws.cognitoidentityprovider#InvalidLambdaResponseException"
    | `InvalidParameterException _ ->
        "com.amazonaws.cognitoidentityprovider#InvalidParameterException"
    | `InvalidSmsRoleAccessPolicyException _ ->
        "com.amazonaws.cognitoidentityprovider#InvalidSmsRoleAccessPolicyException"
    | `InvalidSmsRoleTrustRelationshipException _ ->
        "com.amazonaws.cognitoidentityprovider#InvalidSmsRoleTrustRelationshipException"
    | `InvalidUserPoolConfigurationException _ ->
        "com.amazonaws.cognitoidentityprovider#InvalidUserPoolConfigurationException"
    | `NotAuthorizedException _ -> "com.amazonaws.cognitoidentityprovider#NotAuthorizedException"
    | `OperationNotEnabledException _ ->
        "com.amazonaws.cognitoidentityprovider#OperationNotEnabledException"
    | `PasswordResetRequiredException _ ->
        "com.amazonaws.cognitoidentityprovider#PasswordResetRequiredException"
    | `ResourceNotFoundException _ ->
        "com.amazonaws.cognitoidentityprovider#ResourceNotFoundException"
    | `TooManyRequestsException _ ->
        "com.amazonaws.cognitoidentityprovider#TooManyRequestsException"
    | `UnexpectedLambdaException _ ->
        "com.amazonaws.cognitoidentityprovider#UnexpectedLambdaException"
    | `UnsupportedOperationException _ ->
        "com.amazonaws.cognitoidentityprovider#UnsupportedOperationException"
    | `UserLambdaValidationException _ ->
        "com.amazonaws.cognitoidentityprovider#UserLambdaValidationException"
    | `UserNotConfirmedException _ ->
        "com.amazonaws.cognitoidentityprovider#UserNotConfirmedException"
    | `UserNotFoundException _ -> "com.amazonaws.cognitoidentityprovider#UserNotFoundException"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "ForbiddenException" ->
          `ForbiddenException (Json_deserializers.forbidden_exception_of_yojson tree path)
      | _, "InternalErrorException" ->
          `InternalErrorException (Json_deserializers.internal_error_exception_of_yojson tree path)
      | _, "InvalidEmailRoleAccessPolicyException" ->
          `InvalidEmailRoleAccessPolicyException
            (Json_deserializers.invalid_email_role_access_policy_exception_of_yojson tree path)
      | _, "InvalidLambdaResponseException" ->
          `InvalidLambdaResponseException
            (Json_deserializers.invalid_lambda_response_exception_of_yojson tree path)
      | _, "InvalidParameterException" ->
          `InvalidParameterException
            (Json_deserializers.invalid_parameter_exception_of_yojson tree path)
      | _, "InvalidSmsRoleAccessPolicyException" ->
          `InvalidSmsRoleAccessPolicyException
            (Json_deserializers.invalid_sms_role_access_policy_exception_of_yojson tree path)
      | _, "InvalidSmsRoleTrustRelationshipException" ->
          `InvalidSmsRoleTrustRelationshipException
            (Json_deserializers.invalid_sms_role_trust_relationship_exception_of_yojson tree path)
      | _, "InvalidUserPoolConfigurationException" ->
          `InvalidUserPoolConfigurationException
            (Json_deserializers.invalid_user_pool_configuration_exception_of_yojson tree path)
      | _, "NotAuthorizedException" ->
          `NotAuthorizedException (Json_deserializers.not_authorized_exception_of_yojson tree path)
      | _, "OperationNotEnabledException" ->
          `OperationNotEnabledException
            (Json_deserializers.operation_not_enabled_exception_of_yojson tree path)
      | _, "PasswordResetRequiredException" ->
          `PasswordResetRequiredException
            (Json_deserializers.password_reset_required_exception_of_yojson tree path)
      | _, "ResourceNotFoundException" ->
          `ResourceNotFoundException
            (Json_deserializers.resource_not_found_exception_of_yojson tree path)
      | _, "TooManyRequestsException" ->
          `TooManyRequestsException
            (Json_deserializers.too_many_requests_exception_of_yojson tree path)
      | _, "UnexpectedLambdaException" ->
          `UnexpectedLambdaException
            (Json_deserializers.unexpected_lambda_exception_of_yojson tree path)
      | _, "UnsupportedOperationException" ->
          `UnsupportedOperationException
            (Json_deserializers.unsupported_operation_exception_of_yojson tree path)
      | _, "UserLambdaValidationException" ->
          `UserLambdaValidationException
            (Json_deserializers.user_lambda_validation_exception_of_yojson tree path)
      | _, "UserNotConfirmedException" ->
          `UserNotConfirmedException
            (Json_deserializers.user_not_confirmed_exception_of_yojson tree path)
      | _, "UserNotFoundException" ->
          `UserNotFoundException (Json_deserializers.user_not_found_exception_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : initiate_auth_request) =
    let input = Json_serializers.initiate_auth_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"AWSCognitoIdentityProviderService.InitiateAuth"
      ~service ~context ~input
      ~output_deserializer:Json_deserializers.initiate_auth_response_of_yojson ~error_deserializer

  let request_with_metadata context (request : initiate_auth_request) =
    let input = Json_serializers.initiate_auth_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata
      ~shape_name:"AWSCognitoIdentityProviderService.InitiateAuth" ~service ~context ~input
      ~output_deserializer:Json_deserializers.initiate_auth_response_of_yojson ~error_deserializer
end

module ListDevices = struct
  let error_to_string = function
    | `ForbiddenException _ -> "com.amazonaws.cognitoidentityprovider#ForbiddenException"
    | `InternalErrorException _ -> "com.amazonaws.cognitoidentityprovider#InternalErrorException"
    | `InvalidParameterException _ ->
        "com.amazonaws.cognitoidentityprovider#InvalidParameterException"
    | `InvalidUserPoolConfigurationException _ ->
        "com.amazonaws.cognitoidentityprovider#InvalidUserPoolConfigurationException"
    | `NotAuthorizedException _ -> "com.amazonaws.cognitoidentityprovider#NotAuthorizedException"
    | `OperationNotEnabledException _ ->
        "com.amazonaws.cognitoidentityprovider#OperationNotEnabledException"
    | `PasswordResetRequiredException _ ->
        "com.amazonaws.cognitoidentityprovider#PasswordResetRequiredException"
    | `ResourceNotFoundException _ ->
        "com.amazonaws.cognitoidentityprovider#ResourceNotFoundException"
    | `TooManyRequestsException _ ->
        "com.amazonaws.cognitoidentityprovider#TooManyRequestsException"
    | `UserNotConfirmedException _ ->
        "com.amazonaws.cognitoidentityprovider#UserNotConfirmedException"
    | `UserNotFoundException _ -> "com.amazonaws.cognitoidentityprovider#UserNotFoundException"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "ForbiddenException" ->
          `ForbiddenException (Json_deserializers.forbidden_exception_of_yojson tree path)
      | _, "InternalErrorException" ->
          `InternalErrorException (Json_deserializers.internal_error_exception_of_yojson tree path)
      | _, "InvalidParameterException" ->
          `InvalidParameterException
            (Json_deserializers.invalid_parameter_exception_of_yojson tree path)
      | _, "InvalidUserPoolConfigurationException" ->
          `InvalidUserPoolConfigurationException
            (Json_deserializers.invalid_user_pool_configuration_exception_of_yojson tree path)
      | _, "NotAuthorizedException" ->
          `NotAuthorizedException (Json_deserializers.not_authorized_exception_of_yojson tree path)
      | _, "OperationNotEnabledException" ->
          `OperationNotEnabledException
            (Json_deserializers.operation_not_enabled_exception_of_yojson tree path)
      | _, "PasswordResetRequiredException" ->
          `PasswordResetRequiredException
            (Json_deserializers.password_reset_required_exception_of_yojson tree path)
      | _, "ResourceNotFoundException" ->
          `ResourceNotFoundException
            (Json_deserializers.resource_not_found_exception_of_yojson tree path)
      | _, "TooManyRequestsException" ->
          `TooManyRequestsException
            (Json_deserializers.too_many_requests_exception_of_yojson tree path)
      | _, "UserNotConfirmedException" ->
          `UserNotConfirmedException
            (Json_deserializers.user_not_confirmed_exception_of_yojson tree path)
      | _, "UserNotFoundException" ->
          `UserNotFoundException (Json_deserializers.user_not_found_exception_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : list_devices_request) =
    let input = Json_serializers.list_devices_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"AWSCognitoIdentityProviderService.ListDevices"
      ~service ~context ~input
      ~output_deserializer:Json_deserializers.list_devices_response_of_yojson ~error_deserializer

  let request_with_metadata context (request : list_devices_request) =
    let input = Json_serializers.list_devices_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata
      ~shape_name:"AWSCognitoIdentityProviderService.ListDevices" ~service ~context ~input
      ~output_deserializer:Json_deserializers.list_devices_response_of_yojson ~error_deserializer
end

module ListGroups = struct
  let error_to_string = function
    | `InternalErrorException _ -> "com.amazonaws.cognitoidentityprovider#InternalErrorException"
    | `InvalidParameterException _ ->
        "com.amazonaws.cognitoidentityprovider#InvalidParameterException"
    | `NotAuthorizedException _ -> "com.amazonaws.cognitoidentityprovider#NotAuthorizedException"
    | `OperationNotEnabledException _ ->
        "com.amazonaws.cognitoidentityprovider#OperationNotEnabledException"
    | `ResourceNotFoundException _ ->
        "com.amazonaws.cognitoidentityprovider#ResourceNotFoundException"
    | `TooManyRequestsException _ ->
        "com.amazonaws.cognitoidentityprovider#TooManyRequestsException"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "InternalErrorException" ->
          `InternalErrorException (Json_deserializers.internal_error_exception_of_yojson tree path)
      | _, "InvalidParameterException" ->
          `InvalidParameterException
            (Json_deserializers.invalid_parameter_exception_of_yojson tree path)
      | _, "NotAuthorizedException" ->
          `NotAuthorizedException (Json_deserializers.not_authorized_exception_of_yojson tree path)
      | _, "OperationNotEnabledException" ->
          `OperationNotEnabledException
            (Json_deserializers.operation_not_enabled_exception_of_yojson tree path)
      | _, "ResourceNotFoundException" ->
          `ResourceNotFoundException
            (Json_deserializers.resource_not_found_exception_of_yojson tree path)
      | _, "TooManyRequestsException" ->
          `TooManyRequestsException
            (Json_deserializers.too_many_requests_exception_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : list_groups_request) =
    let input = Json_serializers.list_groups_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"AWSCognitoIdentityProviderService.ListGroups"
      ~service ~context ~input
      ~output_deserializer:Json_deserializers.list_groups_response_of_yojson ~error_deserializer

  let request_with_metadata context (request : list_groups_request) =
    let input = Json_serializers.list_groups_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata
      ~shape_name:"AWSCognitoIdentityProviderService.ListGroups" ~service ~context ~input
      ~output_deserializer:Json_deserializers.list_groups_response_of_yojson ~error_deserializer
end

module ListIdentityProviders = struct
  let error_to_string = function
    | `InternalErrorException _ -> "com.amazonaws.cognitoidentityprovider#InternalErrorException"
    | `InvalidParameterException _ ->
        "com.amazonaws.cognitoidentityprovider#InvalidParameterException"
    | `NotAuthorizedException _ -> "com.amazonaws.cognitoidentityprovider#NotAuthorizedException"
    | `ResourceNotFoundException _ ->
        "com.amazonaws.cognitoidentityprovider#ResourceNotFoundException"
    | `TooManyRequestsException _ ->
        "com.amazonaws.cognitoidentityprovider#TooManyRequestsException"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "InternalErrorException" ->
          `InternalErrorException (Json_deserializers.internal_error_exception_of_yojson tree path)
      | _, "InvalidParameterException" ->
          `InvalidParameterException
            (Json_deserializers.invalid_parameter_exception_of_yojson tree path)
      | _, "NotAuthorizedException" ->
          `NotAuthorizedException (Json_deserializers.not_authorized_exception_of_yojson tree path)
      | _, "ResourceNotFoundException" ->
          `ResourceNotFoundException
            (Json_deserializers.resource_not_found_exception_of_yojson tree path)
      | _, "TooManyRequestsException" ->
          `TooManyRequestsException
            (Json_deserializers.too_many_requests_exception_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : list_identity_providers_request) =
    let input = Json_serializers.list_identity_providers_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request
      ~shape_name:"AWSCognitoIdentityProviderService.ListIdentityProviders" ~service ~context ~input
      ~output_deserializer:Json_deserializers.list_identity_providers_response_of_yojson
      ~error_deserializer

  let request_with_metadata context (request : list_identity_providers_request) =
    let input = Json_serializers.list_identity_providers_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata
      ~shape_name:"AWSCognitoIdentityProviderService.ListIdentityProviders" ~service ~context ~input
      ~output_deserializer:Json_deserializers.list_identity_providers_response_of_yojson
      ~error_deserializer
end

module ListResourceServers = struct
  let error_to_string = function
    | `InternalErrorException _ -> "com.amazonaws.cognitoidentityprovider#InternalErrorException"
    | `InvalidParameterException _ ->
        "com.amazonaws.cognitoidentityprovider#InvalidParameterException"
    | `NotAuthorizedException _ -> "com.amazonaws.cognitoidentityprovider#NotAuthorizedException"
    | `OperationNotEnabledException _ ->
        "com.amazonaws.cognitoidentityprovider#OperationNotEnabledException"
    | `ResourceNotFoundException _ ->
        "com.amazonaws.cognitoidentityprovider#ResourceNotFoundException"
    | `TooManyRequestsException _ ->
        "com.amazonaws.cognitoidentityprovider#TooManyRequestsException"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "InternalErrorException" ->
          `InternalErrorException (Json_deserializers.internal_error_exception_of_yojson tree path)
      | _, "InvalidParameterException" ->
          `InvalidParameterException
            (Json_deserializers.invalid_parameter_exception_of_yojson tree path)
      | _, "NotAuthorizedException" ->
          `NotAuthorizedException (Json_deserializers.not_authorized_exception_of_yojson tree path)
      | _, "OperationNotEnabledException" ->
          `OperationNotEnabledException
            (Json_deserializers.operation_not_enabled_exception_of_yojson tree path)
      | _, "ResourceNotFoundException" ->
          `ResourceNotFoundException
            (Json_deserializers.resource_not_found_exception_of_yojson tree path)
      | _, "TooManyRequestsException" ->
          `TooManyRequestsException
            (Json_deserializers.too_many_requests_exception_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : list_resource_servers_request) =
    let input = Json_serializers.list_resource_servers_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request
      ~shape_name:"AWSCognitoIdentityProviderService.ListResourceServers" ~service ~context ~input
      ~output_deserializer:Json_deserializers.list_resource_servers_response_of_yojson
      ~error_deserializer

  let request_with_metadata context (request : list_resource_servers_request) =
    let input = Json_serializers.list_resource_servers_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata
      ~shape_name:"AWSCognitoIdentityProviderService.ListResourceServers" ~service ~context ~input
      ~output_deserializer:Json_deserializers.list_resource_servers_response_of_yojson
      ~error_deserializer
end

module ListTagsForResource = struct
  let error_to_string = function
    | `InternalErrorException _ -> "com.amazonaws.cognitoidentityprovider#InternalErrorException"
    | `InvalidParameterException _ ->
        "com.amazonaws.cognitoidentityprovider#InvalidParameterException"
    | `NotAuthorizedException _ -> "com.amazonaws.cognitoidentityprovider#NotAuthorizedException"
    | `OperationNotEnabledException _ ->
        "com.amazonaws.cognitoidentityprovider#OperationNotEnabledException"
    | `ResourceNotFoundException _ ->
        "com.amazonaws.cognitoidentityprovider#ResourceNotFoundException"
    | `TooManyRequestsException _ ->
        "com.amazonaws.cognitoidentityprovider#TooManyRequestsException"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "InternalErrorException" ->
          `InternalErrorException (Json_deserializers.internal_error_exception_of_yojson tree path)
      | _, "InvalidParameterException" ->
          `InvalidParameterException
            (Json_deserializers.invalid_parameter_exception_of_yojson tree path)
      | _, "NotAuthorizedException" ->
          `NotAuthorizedException (Json_deserializers.not_authorized_exception_of_yojson tree path)
      | _, "OperationNotEnabledException" ->
          `OperationNotEnabledException
            (Json_deserializers.operation_not_enabled_exception_of_yojson tree path)
      | _, "ResourceNotFoundException" ->
          `ResourceNotFoundException
            (Json_deserializers.resource_not_found_exception_of_yojson tree path)
      | _, "TooManyRequestsException" ->
          `TooManyRequestsException
            (Json_deserializers.too_many_requests_exception_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : list_tags_for_resource_request) =
    let input = Json_serializers.list_tags_for_resource_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request
      ~shape_name:"AWSCognitoIdentityProviderService.ListTagsForResource" ~service ~context ~input
      ~output_deserializer:Json_deserializers.list_tags_for_resource_response_of_yojson
      ~error_deserializer

  let request_with_metadata context (request : list_tags_for_resource_request) =
    let input = Json_serializers.list_tags_for_resource_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata
      ~shape_name:"AWSCognitoIdentityProviderService.ListTagsForResource" ~service ~context ~input
      ~output_deserializer:Json_deserializers.list_tags_for_resource_response_of_yojson
      ~error_deserializer
end

module ListTerms = struct
  let error_to_string = function
    | `InternalErrorException _ -> "com.amazonaws.cognitoidentityprovider#InternalErrorException"
    | `InvalidParameterException _ ->
        "com.amazonaws.cognitoidentityprovider#InvalidParameterException"
    | `NotAuthorizedException _ -> "com.amazonaws.cognitoidentityprovider#NotAuthorizedException"
    | `OperationNotEnabledException _ ->
        "com.amazonaws.cognitoidentityprovider#OperationNotEnabledException"
    | `ResourceNotFoundException _ ->
        "com.amazonaws.cognitoidentityprovider#ResourceNotFoundException"
    | `TooManyRequestsException _ ->
        "com.amazonaws.cognitoidentityprovider#TooManyRequestsException"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "InternalErrorException" ->
          `InternalErrorException (Json_deserializers.internal_error_exception_of_yojson tree path)
      | _, "InvalidParameterException" ->
          `InvalidParameterException
            (Json_deserializers.invalid_parameter_exception_of_yojson tree path)
      | _, "NotAuthorizedException" ->
          `NotAuthorizedException (Json_deserializers.not_authorized_exception_of_yojson tree path)
      | _, "OperationNotEnabledException" ->
          `OperationNotEnabledException
            (Json_deserializers.operation_not_enabled_exception_of_yojson tree path)
      | _, "ResourceNotFoundException" ->
          `ResourceNotFoundException
            (Json_deserializers.resource_not_found_exception_of_yojson tree path)
      | _, "TooManyRequestsException" ->
          `TooManyRequestsException
            (Json_deserializers.too_many_requests_exception_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : list_terms_request) =
    let input = Json_serializers.list_terms_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"AWSCognitoIdentityProviderService.ListTerms"
      ~service ~context ~input ~output_deserializer:Json_deserializers.list_terms_response_of_yojson
      ~error_deserializer

  let request_with_metadata context (request : list_terms_request) =
    let input = Json_serializers.list_terms_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata
      ~shape_name:"AWSCognitoIdentityProviderService.ListTerms" ~service ~context ~input
      ~output_deserializer:Json_deserializers.list_terms_response_of_yojson ~error_deserializer
end

module ListUserImportJobs = struct
  let error_to_string = function
    | `InternalErrorException _ -> "com.amazonaws.cognitoidentityprovider#InternalErrorException"
    | `InvalidParameterException _ ->
        "com.amazonaws.cognitoidentityprovider#InvalidParameterException"
    | `NotAuthorizedException _ -> "com.amazonaws.cognitoidentityprovider#NotAuthorizedException"
    | `OperationNotEnabledException _ ->
        "com.amazonaws.cognitoidentityprovider#OperationNotEnabledException"
    | `ResourceNotFoundException _ ->
        "com.amazonaws.cognitoidentityprovider#ResourceNotFoundException"
    | `TooManyRequestsException _ ->
        "com.amazonaws.cognitoidentityprovider#TooManyRequestsException"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "InternalErrorException" ->
          `InternalErrorException (Json_deserializers.internal_error_exception_of_yojson tree path)
      | _, "InvalidParameterException" ->
          `InvalidParameterException
            (Json_deserializers.invalid_parameter_exception_of_yojson tree path)
      | _, "NotAuthorizedException" ->
          `NotAuthorizedException (Json_deserializers.not_authorized_exception_of_yojson tree path)
      | _, "OperationNotEnabledException" ->
          `OperationNotEnabledException
            (Json_deserializers.operation_not_enabled_exception_of_yojson tree path)
      | _, "ResourceNotFoundException" ->
          `ResourceNotFoundException
            (Json_deserializers.resource_not_found_exception_of_yojson tree path)
      | _, "TooManyRequestsException" ->
          `TooManyRequestsException
            (Json_deserializers.too_many_requests_exception_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : list_user_import_jobs_request) =
    let input = Json_serializers.list_user_import_jobs_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request
      ~shape_name:"AWSCognitoIdentityProviderService.ListUserImportJobs" ~service ~context ~input
      ~output_deserializer:Json_deserializers.list_user_import_jobs_response_of_yojson
      ~error_deserializer

  let request_with_metadata context (request : list_user_import_jobs_request) =
    let input = Json_serializers.list_user_import_jobs_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata
      ~shape_name:"AWSCognitoIdentityProviderService.ListUserImportJobs" ~service ~context ~input
      ~output_deserializer:Json_deserializers.list_user_import_jobs_response_of_yojson
      ~error_deserializer
end

module ListUserPoolClients = struct
  let error_to_string = function
    | `InternalErrorException _ -> "com.amazonaws.cognitoidentityprovider#InternalErrorException"
    | `InvalidParameterException _ ->
        "com.amazonaws.cognitoidentityprovider#InvalidParameterException"
    | `NotAuthorizedException _ -> "com.amazonaws.cognitoidentityprovider#NotAuthorizedException"
    | `OperationNotEnabledException _ ->
        "com.amazonaws.cognitoidentityprovider#OperationNotEnabledException"
    | `ResourceNotFoundException _ ->
        "com.amazonaws.cognitoidentityprovider#ResourceNotFoundException"
    | `TooManyRequestsException _ ->
        "com.amazonaws.cognitoidentityprovider#TooManyRequestsException"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "InternalErrorException" ->
          `InternalErrorException (Json_deserializers.internal_error_exception_of_yojson tree path)
      | _, "InvalidParameterException" ->
          `InvalidParameterException
            (Json_deserializers.invalid_parameter_exception_of_yojson tree path)
      | _, "NotAuthorizedException" ->
          `NotAuthorizedException (Json_deserializers.not_authorized_exception_of_yojson tree path)
      | _, "OperationNotEnabledException" ->
          `OperationNotEnabledException
            (Json_deserializers.operation_not_enabled_exception_of_yojson tree path)
      | _, "ResourceNotFoundException" ->
          `ResourceNotFoundException
            (Json_deserializers.resource_not_found_exception_of_yojson tree path)
      | _, "TooManyRequestsException" ->
          `TooManyRequestsException
            (Json_deserializers.too_many_requests_exception_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : list_user_pool_clients_request) =
    let input = Json_serializers.list_user_pool_clients_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request
      ~shape_name:"AWSCognitoIdentityProviderService.ListUserPoolClients" ~service ~context ~input
      ~output_deserializer:Json_deserializers.list_user_pool_clients_response_of_yojson
      ~error_deserializer

  let request_with_metadata context (request : list_user_pool_clients_request) =
    let input = Json_serializers.list_user_pool_clients_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata
      ~shape_name:"AWSCognitoIdentityProviderService.ListUserPoolClients" ~service ~context ~input
      ~output_deserializer:Json_deserializers.list_user_pool_clients_response_of_yojson
      ~error_deserializer
end

module ListUserPoolClientSecrets = struct
  let error_to_string = function
    | `InternalServerException _ -> "com.amazonaws.cognitoidentityprovider#InternalServerException"
    | `InvalidParameterException _ ->
        "com.amazonaws.cognitoidentityprovider#InvalidParameterException"
    | `LimitExceededException _ -> "com.amazonaws.cognitoidentityprovider#LimitExceededException"
    | `ResourceNotFoundException _ ->
        "com.amazonaws.cognitoidentityprovider#ResourceNotFoundException"
    | `TooManyRequestsException _ ->
        "com.amazonaws.cognitoidentityprovider#TooManyRequestsException"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "InternalServerException" ->
          `InternalServerException
            (Json_deserializers.internal_server_exception_of_yojson tree path)
      | _, "InvalidParameterException" ->
          `InvalidParameterException
            (Json_deserializers.invalid_parameter_exception_of_yojson tree path)
      | _, "LimitExceededException" ->
          `LimitExceededException (Json_deserializers.limit_exceeded_exception_of_yojson tree path)
      | _, "ResourceNotFoundException" ->
          `ResourceNotFoundException
            (Json_deserializers.resource_not_found_exception_of_yojson tree path)
      | _, "TooManyRequestsException" ->
          `TooManyRequestsException
            (Json_deserializers.too_many_requests_exception_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : list_user_pool_client_secrets_request) =
    let input = Json_serializers.list_user_pool_client_secrets_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request
      ~shape_name:"AWSCognitoIdentityProviderService.ListUserPoolClientSecrets" ~service ~context
      ~input
      ~output_deserializer:Json_deserializers.list_user_pool_client_secrets_response_of_yojson
      ~error_deserializer

  let request_with_metadata context (request : list_user_pool_client_secrets_request) =
    let input = Json_serializers.list_user_pool_client_secrets_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata
      ~shape_name:"AWSCognitoIdentityProviderService.ListUserPoolClientSecrets" ~service ~context
      ~input
      ~output_deserializer:Json_deserializers.list_user_pool_client_secrets_response_of_yojson
      ~error_deserializer
end

module ListUserPoolReplicas = struct
  let error_to_string = function
    | `InternalErrorException _ -> "com.amazonaws.cognitoidentityprovider#InternalErrorException"
    | `InvalidParameterException _ ->
        "com.amazonaws.cognitoidentityprovider#InvalidParameterException"
    | `NotAuthorizedException _ -> "com.amazonaws.cognitoidentityprovider#NotAuthorizedException"
    | `OperationNotEnabledException _ ->
        "com.amazonaws.cognitoidentityprovider#OperationNotEnabledException"
    | `ResourceNotFoundException _ ->
        "com.amazonaws.cognitoidentityprovider#ResourceNotFoundException"
    | `TooManyRequestsException _ ->
        "com.amazonaws.cognitoidentityprovider#TooManyRequestsException"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "InternalErrorException" ->
          `InternalErrorException (Json_deserializers.internal_error_exception_of_yojson tree path)
      | _, "InvalidParameterException" ->
          `InvalidParameterException
            (Json_deserializers.invalid_parameter_exception_of_yojson tree path)
      | _, "NotAuthorizedException" ->
          `NotAuthorizedException (Json_deserializers.not_authorized_exception_of_yojson tree path)
      | _, "OperationNotEnabledException" ->
          `OperationNotEnabledException
            (Json_deserializers.operation_not_enabled_exception_of_yojson tree path)
      | _, "ResourceNotFoundException" ->
          `ResourceNotFoundException
            (Json_deserializers.resource_not_found_exception_of_yojson tree path)
      | _, "TooManyRequestsException" ->
          `TooManyRequestsException
            (Json_deserializers.too_many_requests_exception_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : list_user_pool_replicas_request) =
    let input = Json_serializers.list_user_pool_replicas_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request
      ~shape_name:"AWSCognitoIdentityProviderService.ListUserPoolReplicas" ~service ~context ~input
      ~output_deserializer:Json_deserializers.list_user_pool_replicas_response_of_yojson
      ~error_deserializer

  let request_with_metadata context (request : list_user_pool_replicas_request) =
    let input = Json_serializers.list_user_pool_replicas_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata
      ~shape_name:"AWSCognitoIdentityProviderService.ListUserPoolReplicas" ~service ~context ~input
      ~output_deserializer:Json_deserializers.list_user_pool_replicas_response_of_yojson
      ~error_deserializer
end

module ListUserPools = struct
  let error_to_string = function
    | `InternalErrorException _ -> "com.amazonaws.cognitoidentityprovider#InternalErrorException"
    | `InvalidParameterException _ ->
        "com.amazonaws.cognitoidentityprovider#InvalidParameterException"
    | `NotAuthorizedException _ -> "com.amazonaws.cognitoidentityprovider#NotAuthorizedException"
    | `TooManyRequestsException _ ->
        "com.amazonaws.cognitoidentityprovider#TooManyRequestsException"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "InternalErrorException" ->
          `InternalErrorException (Json_deserializers.internal_error_exception_of_yojson tree path)
      | _, "InvalidParameterException" ->
          `InvalidParameterException
            (Json_deserializers.invalid_parameter_exception_of_yojson tree path)
      | _, "NotAuthorizedException" ->
          `NotAuthorizedException (Json_deserializers.not_authorized_exception_of_yojson tree path)
      | _, "TooManyRequestsException" ->
          `TooManyRequestsException
            (Json_deserializers.too_many_requests_exception_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : list_user_pools_request) =
    let input = Json_serializers.list_user_pools_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request
      ~shape_name:"AWSCognitoIdentityProviderService.ListUserPools" ~service ~context ~input
      ~output_deserializer:Json_deserializers.list_user_pools_response_of_yojson ~error_deserializer

  let request_with_metadata context (request : list_user_pools_request) =
    let input = Json_serializers.list_user_pools_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata
      ~shape_name:"AWSCognitoIdentityProviderService.ListUserPools" ~service ~context ~input
      ~output_deserializer:Json_deserializers.list_user_pools_response_of_yojson ~error_deserializer
end

module ListUsers = struct
  let error_to_string = function
    | `InternalErrorException _ -> "com.amazonaws.cognitoidentityprovider#InternalErrorException"
    | `InvalidParameterException _ ->
        "com.amazonaws.cognitoidentityprovider#InvalidParameterException"
    | `NotAuthorizedException _ -> "com.amazonaws.cognitoidentityprovider#NotAuthorizedException"
    | `OperationNotEnabledException _ ->
        "com.amazonaws.cognitoidentityprovider#OperationNotEnabledException"
    | `ResourceNotFoundException _ ->
        "com.amazonaws.cognitoidentityprovider#ResourceNotFoundException"
    | `TooManyRequestsException _ ->
        "com.amazonaws.cognitoidentityprovider#TooManyRequestsException"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "InternalErrorException" ->
          `InternalErrorException (Json_deserializers.internal_error_exception_of_yojson tree path)
      | _, "InvalidParameterException" ->
          `InvalidParameterException
            (Json_deserializers.invalid_parameter_exception_of_yojson tree path)
      | _, "NotAuthorizedException" ->
          `NotAuthorizedException (Json_deserializers.not_authorized_exception_of_yojson tree path)
      | _, "OperationNotEnabledException" ->
          `OperationNotEnabledException
            (Json_deserializers.operation_not_enabled_exception_of_yojson tree path)
      | _, "ResourceNotFoundException" ->
          `ResourceNotFoundException
            (Json_deserializers.resource_not_found_exception_of_yojson tree path)
      | _, "TooManyRequestsException" ->
          `TooManyRequestsException
            (Json_deserializers.too_many_requests_exception_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : list_users_request) =
    let input = Json_serializers.list_users_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"AWSCognitoIdentityProviderService.ListUsers"
      ~service ~context ~input ~output_deserializer:Json_deserializers.list_users_response_of_yojson
      ~error_deserializer

  let request_with_metadata context (request : list_users_request) =
    let input = Json_serializers.list_users_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata
      ~shape_name:"AWSCognitoIdentityProviderService.ListUsers" ~service ~context ~input
      ~output_deserializer:Json_deserializers.list_users_response_of_yojson ~error_deserializer
end

module ListUsersInGroup = struct
  let error_to_string = function
    | `InternalErrorException _ -> "com.amazonaws.cognitoidentityprovider#InternalErrorException"
    | `InvalidParameterException _ ->
        "com.amazonaws.cognitoidentityprovider#InvalidParameterException"
    | `NotAuthorizedException _ -> "com.amazonaws.cognitoidentityprovider#NotAuthorizedException"
    | `OperationNotEnabledException _ ->
        "com.amazonaws.cognitoidentityprovider#OperationNotEnabledException"
    | `ResourceNotFoundException _ ->
        "com.amazonaws.cognitoidentityprovider#ResourceNotFoundException"
    | `TooManyRequestsException _ ->
        "com.amazonaws.cognitoidentityprovider#TooManyRequestsException"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "InternalErrorException" ->
          `InternalErrorException (Json_deserializers.internal_error_exception_of_yojson tree path)
      | _, "InvalidParameterException" ->
          `InvalidParameterException
            (Json_deserializers.invalid_parameter_exception_of_yojson tree path)
      | _, "NotAuthorizedException" ->
          `NotAuthorizedException (Json_deserializers.not_authorized_exception_of_yojson tree path)
      | _, "OperationNotEnabledException" ->
          `OperationNotEnabledException
            (Json_deserializers.operation_not_enabled_exception_of_yojson tree path)
      | _, "ResourceNotFoundException" ->
          `ResourceNotFoundException
            (Json_deserializers.resource_not_found_exception_of_yojson tree path)
      | _, "TooManyRequestsException" ->
          `TooManyRequestsException
            (Json_deserializers.too_many_requests_exception_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : list_users_in_group_request) =
    let input = Json_serializers.list_users_in_group_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request
      ~shape_name:"AWSCognitoIdentityProviderService.ListUsersInGroup" ~service ~context ~input
      ~output_deserializer:Json_deserializers.list_users_in_group_response_of_yojson
      ~error_deserializer

  let request_with_metadata context (request : list_users_in_group_request) =
    let input = Json_serializers.list_users_in_group_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata
      ~shape_name:"AWSCognitoIdentityProviderService.ListUsersInGroup" ~service ~context ~input
      ~output_deserializer:Json_deserializers.list_users_in_group_response_of_yojson
      ~error_deserializer
end

module ListWebAuthnCredentials = struct
  let error_to_string = function
    | `ForbiddenException _ -> "com.amazonaws.cognitoidentityprovider#ForbiddenException"
    | `InternalErrorException _ -> "com.amazonaws.cognitoidentityprovider#InternalErrorException"
    | `InvalidParameterException _ ->
        "com.amazonaws.cognitoidentityprovider#InvalidParameterException"
    | `LimitExceededException _ -> "com.amazonaws.cognitoidentityprovider#LimitExceededException"
    | `NotAuthorizedException _ -> "com.amazonaws.cognitoidentityprovider#NotAuthorizedException"
    | `OperationNotEnabledException _ ->
        "com.amazonaws.cognitoidentityprovider#OperationNotEnabledException"
    | `PasswordResetRequiredException _ ->
        "com.amazonaws.cognitoidentityprovider#PasswordResetRequiredException"
    | `TooManyRequestsException _ ->
        "com.amazonaws.cognitoidentityprovider#TooManyRequestsException"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "ForbiddenException" ->
          `ForbiddenException (Json_deserializers.forbidden_exception_of_yojson tree path)
      | _, "InternalErrorException" ->
          `InternalErrorException (Json_deserializers.internal_error_exception_of_yojson tree path)
      | _, "InvalidParameterException" ->
          `InvalidParameterException
            (Json_deserializers.invalid_parameter_exception_of_yojson tree path)
      | _, "LimitExceededException" ->
          `LimitExceededException (Json_deserializers.limit_exceeded_exception_of_yojson tree path)
      | _, "NotAuthorizedException" ->
          `NotAuthorizedException (Json_deserializers.not_authorized_exception_of_yojson tree path)
      | _, "OperationNotEnabledException" ->
          `OperationNotEnabledException
            (Json_deserializers.operation_not_enabled_exception_of_yojson tree path)
      | _, "PasswordResetRequiredException" ->
          `PasswordResetRequiredException
            (Json_deserializers.password_reset_required_exception_of_yojson tree path)
      | _, "TooManyRequestsException" ->
          `TooManyRequestsException
            (Json_deserializers.too_many_requests_exception_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : list_web_authn_credentials_request) =
    let input = Json_serializers.list_web_authn_credentials_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request
      ~shape_name:"AWSCognitoIdentityProviderService.ListWebAuthnCredentials" ~service ~context
      ~input ~output_deserializer:Json_deserializers.list_web_authn_credentials_response_of_yojson
      ~error_deserializer

  let request_with_metadata context (request : list_web_authn_credentials_request) =
    let input = Json_serializers.list_web_authn_credentials_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata
      ~shape_name:"AWSCognitoIdentityProviderService.ListWebAuthnCredentials" ~service ~context
      ~input ~output_deserializer:Json_deserializers.list_web_authn_credentials_response_of_yojson
      ~error_deserializer
end

module ResendConfirmationCode = struct
  let error_to_string = function
    | `CodeDeliveryFailureException _ ->
        "com.amazonaws.cognitoidentityprovider#CodeDeliveryFailureException"
    | `ForbiddenException _ -> "com.amazonaws.cognitoidentityprovider#ForbiddenException"
    | `InternalErrorException _ -> "com.amazonaws.cognitoidentityprovider#InternalErrorException"
    | `InvalidEmailRoleAccessPolicyException _ ->
        "com.amazonaws.cognitoidentityprovider#InvalidEmailRoleAccessPolicyException"
    | `InvalidLambdaResponseException _ ->
        "com.amazonaws.cognitoidentityprovider#InvalidLambdaResponseException"
    | `InvalidParameterException _ ->
        "com.amazonaws.cognitoidentityprovider#InvalidParameterException"
    | `InvalidSmsRoleAccessPolicyException _ ->
        "com.amazonaws.cognitoidentityprovider#InvalidSmsRoleAccessPolicyException"
    | `InvalidSmsRoleTrustRelationshipException _ ->
        "com.amazonaws.cognitoidentityprovider#InvalidSmsRoleTrustRelationshipException"
    | `LimitExceededException _ -> "com.amazonaws.cognitoidentityprovider#LimitExceededException"
    | `NotAuthorizedException _ -> "com.amazonaws.cognitoidentityprovider#NotAuthorizedException"
    | `OperationNotEnabledException _ ->
        "com.amazonaws.cognitoidentityprovider#OperationNotEnabledException"
    | `ResourceNotFoundException _ ->
        "com.amazonaws.cognitoidentityprovider#ResourceNotFoundException"
    | `TooManyRequestsException _ ->
        "com.amazonaws.cognitoidentityprovider#TooManyRequestsException"
    | `UnexpectedLambdaException _ ->
        "com.amazonaws.cognitoidentityprovider#UnexpectedLambdaException"
    | `UserLambdaValidationException _ ->
        "com.amazonaws.cognitoidentityprovider#UserLambdaValidationException"
    | `UserNotFoundException _ -> "com.amazonaws.cognitoidentityprovider#UserNotFoundException"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "CodeDeliveryFailureException" ->
          `CodeDeliveryFailureException
            (Json_deserializers.code_delivery_failure_exception_of_yojson tree path)
      | _, "ForbiddenException" ->
          `ForbiddenException (Json_deserializers.forbidden_exception_of_yojson tree path)
      | _, "InternalErrorException" ->
          `InternalErrorException (Json_deserializers.internal_error_exception_of_yojson tree path)
      | _, "InvalidEmailRoleAccessPolicyException" ->
          `InvalidEmailRoleAccessPolicyException
            (Json_deserializers.invalid_email_role_access_policy_exception_of_yojson tree path)
      | _, "InvalidLambdaResponseException" ->
          `InvalidLambdaResponseException
            (Json_deserializers.invalid_lambda_response_exception_of_yojson tree path)
      | _, "InvalidParameterException" ->
          `InvalidParameterException
            (Json_deserializers.invalid_parameter_exception_of_yojson tree path)
      | _, "InvalidSmsRoleAccessPolicyException" ->
          `InvalidSmsRoleAccessPolicyException
            (Json_deserializers.invalid_sms_role_access_policy_exception_of_yojson tree path)
      | _, "InvalidSmsRoleTrustRelationshipException" ->
          `InvalidSmsRoleTrustRelationshipException
            (Json_deserializers.invalid_sms_role_trust_relationship_exception_of_yojson tree path)
      | _, "LimitExceededException" ->
          `LimitExceededException (Json_deserializers.limit_exceeded_exception_of_yojson tree path)
      | _, "NotAuthorizedException" ->
          `NotAuthorizedException (Json_deserializers.not_authorized_exception_of_yojson tree path)
      | _, "OperationNotEnabledException" ->
          `OperationNotEnabledException
            (Json_deserializers.operation_not_enabled_exception_of_yojson tree path)
      | _, "ResourceNotFoundException" ->
          `ResourceNotFoundException
            (Json_deserializers.resource_not_found_exception_of_yojson tree path)
      | _, "TooManyRequestsException" ->
          `TooManyRequestsException
            (Json_deserializers.too_many_requests_exception_of_yojson tree path)
      | _, "UnexpectedLambdaException" ->
          `UnexpectedLambdaException
            (Json_deserializers.unexpected_lambda_exception_of_yojson tree path)
      | _, "UserLambdaValidationException" ->
          `UserLambdaValidationException
            (Json_deserializers.user_lambda_validation_exception_of_yojson tree path)
      | _, "UserNotFoundException" ->
          `UserNotFoundException (Json_deserializers.user_not_found_exception_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : resend_confirmation_code_request) =
    let input = Json_serializers.resend_confirmation_code_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request
      ~shape_name:"AWSCognitoIdentityProviderService.ResendConfirmationCode" ~service ~context
      ~input ~output_deserializer:Json_deserializers.resend_confirmation_code_response_of_yojson
      ~error_deserializer

  let request_with_metadata context (request : resend_confirmation_code_request) =
    let input = Json_serializers.resend_confirmation_code_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata
      ~shape_name:"AWSCognitoIdentityProviderService.ResendConfirmationCode" ~service ~context
      ~input ~output_deserializer:Json_deserializers.resend_confirmation_code_response_of_yojson
      ~error_deserializer
end

module RespondToAuthChallenge = struct
  let error_to_string = function
    | `AliasExistsException _ -> "com.amazonaws.cognitoidentityprovider#AliasExistsException"
    | `CodeMismatchException _ -> "com.amazonaws.cognitoidentityprovider#CodeMismatchException"
    | `ExpiredCodeException _ -> "com.amazonaws.cognitoidentityprovider#ExpiredCodeException"
    | `ForbiddenException _ -> "com.amazonaws.cognitoidentityprovider#ForbiddenException"
    | `InternalErrorException _ -> "com.amazonaws.cognitoidentityprovider#InternalErrorException"
    | `InvalidEmailRoleAccessPolicyException _ ->
        "com.amazonaws.cognitoidentityprovider#InvalidEmailRoleAccessPolicyException"
    | `InvalidLambdaResponseException _ ->
        "com.amazonaws.cognitoidentityprovider#InvalidLambdaResponseException"
    | `InvalidParameterException _ ->
        "com.amazonaws.cognitoidentityprovider#InvalidParameterException"
    | `InvalidPasswordException _ ->
        "com.amazonaws.cognitoidentityprovider#InvalidPasswordException"
    | `InvalidSmsRoleAccessPolicyException _ ->
        "com.amazonaws.cognitoidentityprovider#InvalidSmsRoleAccessPolicyException"
    | `InvalidSmsRoleTrustRelationshipException _ ->
        "com.amazonaws.cognitoidentityprovider#InvalidSmsRoleTrustRelationshipException"
    | `InvalidUserPoolConfigurationException _ ->
        "com.amazonaws.cognitoidentityprovider#InvalidUserPoolConfigurationException"
    | `MFAMethodNotFoundException _ ->
        "com.amazonaws.cognitoidentityprovider#MFAMethodNotFoundException"
    | `NotAuthorizedException _ -> "com.amazonaws.cognitoidentityprovider#NotAuthorizedException"
    | `OperationNotEnabledException _ ->
        "com.amazonaws.cognitoidentityprovider#OperationNotEnabledException"
    | `PasswordHistoryPolicyViolationException _ ->
        "com.amazonaws.cognitoidentityprovider#PasswordHistoryPolicyViolationException"
    | `PasswordResetRequiredException _ ->
        "com.amazonaws.cognitoidentityprovider#PasswordResetRequiredException"
    | `ResourceNotFoundException _ ->
        "com.amazonaws.cognitoidentityprovider#ResourceNotFoundException"
    | `SoftwareTokenMFANotFoundException _ ->
        "com.amazonaws.cognitoidentityprovider#SoftwareTokenMFANotFoundException"
    | `TooManyRequestsException _ ->
        "com.amazonaws.cognitoidentityprovider#TooManyRequestsException"
    | `UnexpectedLambdaException _ ->
        "com.amazonaws.cognitoidentityprovider#UnexpectedLambdaException"
    | `UserLambdaValidationException _ ->
        "com.amazonaws.cognitoidentityprovider#UserLambdaValidationException"
    | `UserNotConfirmedException _ ->
        "com.amazonaws.cognitoidentityprovider#UserNotConfirmedException"
    | `UserNotFoundException _ -> "com.amazonaws.cognitoidentityprovider#UserNotFoundException"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "AliasExistsException" ->
          `AliasExistsException (Json_deserializers.alias_exists_exception_of_yojson tree path)
      | _, "CodeMismatchException" ->
          `CodeMismatchException (Json_deserializers.code_mismatch_exception_of_yojson tree path)
      | _, "ExpiredCodeException" ->
          `ExpiredCodeException (Json_deserializers.expired_code_exception_of_yojson tree path)
      | _, "ForbiddenException" ->
          `ForbiddenException (Json_deserializers.forbidden_exception_of_yojson tree path)
      | _, "InternalErrorException" ->
          `InternalErrorException (Json_deserializers.internal_error_exception_of_yojson tree path)
      | _, "InvalidEmailRoleAccessPolicyException" ->
          `InvalidEmailRoleAccessPolicyException
            (Json_deserializers.invalid_email_role_access_policy_exception_of_yojson tree path)
      | _, "InvalidLambdaResponseException" ->
          `InvalidLambdaResponseException
            (Json_deserializers.invalid_lambda_response_exception_of_yojson tree path)
      | _, "InvalidParameterException" ->
          `InvalidParameterException
            (Json_deserializers.invalid_parameter_exception_of_yojson tree path)
      | _, "InvalidPasswordException" ->
          `InvalidPasswordException
            (Json_deserializers.invalid_password_exception_of_yojson tree path)
      | _, "InvalidSmsRoleAccessPolicyException" ->
          `InvalidSmsRoleAccessPolicyException
            (Json_deserializers.invalid_sms_role_access_policy_exception_of_yojson tree path)
      | _, "InvalidSmsRoleTrustRelationshipException" ->
          `InvalidSmsRoleTrustRelationshipException
            (Json_deserializers.invalid_sms_role_trust_relationship_exception_of_yojson tree path)
      | _, "InvalidUserPoolConfigurationException" ->
          `InvalidUserPoolConfigurationException
            (Json_deserializers.invalid_user_pool_configuration_exception_of_yojson tree path)
      | _, "MFAMethodNotFoundException" ->
          `MFAMethodNotFoundException
            (Json_deserializers.mfa_method_not_found_exception_of_yojson tree path)
      | _, "NotAuthorizedException" ->
          `NotAuthorizedException (Json_deserializers.not_authorized_exception_of_yojson tree path)
      | _, "OperationNotEnabledException" ->
          `OperationNotEnabledException
            (Json_deserializers.operation_not_enabled_exception_of_yojson tree path)
      | _, "PasswordHistoryPolicyViolationException" ->
          `PasswordHistoryPolicyViolationException
            (Json_deserializers.password_history_policy_violation_exception_of_yojson tree path)
      | _, "PasswordResetRequiredException" ->
          `PasswordResetRequiredException
            (Json_deserializers.password_reset_required_exception_of_yojson tree path)
      | _, "ResourceNotFoundException" ->
          `ResourceNotFoundException
            (Json_deserializers.resource_not_found_exception_of_yojson tree path)
      | _, "SoftwareTokenMFANotFoundException" ->
          `SoftwareTokenMFANotFoundException
            (Json_deserializers.software_token_mfa_not_found_exception_of_yojson tree path)
      | _, "TooManyRequestsException" ->
          `TooManyRequestsException
            (Json_deserializers.too_many_requests_exception_of_yojson tree path)
      | _, "UnexpectedLambdaException" ->
          `UnexpectedLambdaException
            (Json_deserializers.unexpected_lambda_exception_of_yojson tree path)
      | _, "UserLambdaValidationException" ->
          `UserLambdaValidationException
            (Json_deserializers.user_lambda_validation_exception_of_yojson tree path)
      | _, "UserNotConfirmedException" ->
          `UserNotConfirmedException
            (Json_deserializers.user_not_confirmed_exception_of_yojson tree path)
      | _, "UserNotFoundException" ->
          `UserNotFoundException (Json_deserializers.user_not_found_exception_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : respond_to_auth_challenge_request) =
    let input = Json_serializers.respond_to_auth_challenge_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request
      ~shape_name:"AWSCognitoIdentityProviderService.RespondToAuthChallenge" ~service ~context
      ~input ~output_deserializer:Json_deserializers.respond_to_auth_challenge_response_of_yojson
      ~error_deserializer

  let request_with_metadata context (request : respond_to_auth_challenge_request) =
    let input = Json_serializers.respond_to_auth_challenge_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata
      ~shape_name:"AWSCognitoIdentityProviderService.RespondToAuthChallenge" ~service ~context
      ~input ~output_deserializer:Json_deserializers.respond_to_auth_challenge_response_of_yojson
      ~error_deserializer
end

module RevokeToken = struct
  let error_to_string = function
    | `ForbiddenException _ -> "com.amazonaws.cognitoidentityprovider#ForbiddenException"
    | `InternalErrorException _ -> "com.amazonaws.cognitoidentityprovider#InternalErrorException"
    | `InvalidParameterException _ ->
        "com.amazonaws.cognitoidentityprovider#InvalidParameterException"
    | `OperationNotEnabledException _ ->
        "com.amazonaws.cognitoidentityprovider#OperationNotEnabledException"
    | `TooManyRequestsException _ ->
        "com.amazonaws.cognitoidentityprovider#TooManyRequestsException"
    | `UnauthorizedException _ -> "com.amazonaws.cognitoidentityprovider#UnauthorizedException"
    | `UnsupportedOperationException _ ->
        "com.amazonaws.cognitoidentityprovider#UnsupportedOperationException"
    | `UnsupportedTokenTypeException _ ->
        "com.amazonaws.cognitoidentityprovider#UnsupportedTokenTypeException"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "ForbiddenException" ->
          `ForbiddenException (Json_deserializers.forbidden_exception_of_yojson tree path)
      | _, "InternalErrorException" ->
          `InternalErrorException (Json_deserializers.internal_error_exception_of_yojson tree path)
      | _, "InvalidParameterException" ->
          `InvalidParameterException
            (Json_deserializers.invalid_parameter_exception_of_yojson tree path)
      | _, "OperationNotEnabledException" ->
          `OperationNotEnabledException
            (Json_deserializers.operation_not_enabled_exception_of_yojson tree path)
      | _, "TooManyRequestsException" ->
          `TooManyRequestsException
            (Json_deserializers.too_many_requests_exception_of_yojson tree path)
      | _, "UnauthorizedException" ->
          `UnauthorizedException (Json_deserializers.unauthorized_exception_of_yojson tree path)
      | _, "UnsupportedOperationException" ->
          `UnsupportedOperationException
            (Json_deserializers.unsupported_operation_exception_of_yojson tree path)
      | _, "UnsupportedTokenTypeException" ->
          `UnsupportedTokenTypeException
            (Json_deserializers.unsupported_token_type_exception_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : revoke_token_request) =
    let input = Json_serializers.revoke_token_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"AWSCognitoIdentityProviderService.RevokeToken"
      ~service ~context ~input
      ~output_deserializer:Json_deserializers.revoke_token_response_of_yojson ~error_deserializer

  let request_with_metadata context (request : revoke_token_request) =
    let input = Json_serializers.revoke_token_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata
      ~shape_name:"AWSCognitoIdentityProviderService.RevokeToken" ~service ~context ~input
      ~output_deserializer:Json_deserializers.revoke_token_response_of_yojson ~error_deserializer
end

module SetLogDeliveryConfiguration = struct
  let error_to_string = function
    | `FeatureUnavailableInTierException _ ->
        "com.amazonaws.cognitoidentityprovider#FeatureUnavailableInTierException"
    | `InternalErrorException _ -> "com.amazonaws.cognitoidentityprovider#InternalErrorException"
    | `InvalidParameterException _ ->
        "com.amazonaws.cognitoidentityprovider#InvalidParameterException"
    | `NotAuthorizedException _ -> "com.amazonaws.cognitoidentityprovider#NotAuthorizedException"
    | `ResourceNotFoundException _ ->
        "com.amazonaws.cognitoidentityprovider#ResourceNotFoundException"
    | `TooManyRequestsException _ ->
        "com.amazonaws.cognitoidentityprovider#TooManyRequestsException"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "FeatureUnavailableInTierException" ->
          `FeatureUnavailableInTierException
            (Json_deserializers.feature_unavailable_in_tier_exception_of_yojson tree path)
      | _, "InternalErrorException" ->
          `InternalErrorException (Json_deserializers.internal_error_exception_of_yojson tree path)
      | _, "InvalidParameterException" ->
          `InvalidParameterException
            (Json_deserializers.invalid_parameter_exception_of_yojson tree path)
      | _, "NotAuthorizedException" ->
          `NotAuthorizedException (Json_deserializers.not_authorized_exception_of_yojson tree path)
      | _, "ResourceNotFoundException" ->
          `ResourceNotFoundException
            (Json_deserializers.resource_not_found_exception_of_yojson tree path)
      | _, "TooManyRequestsException" ->
          `TooManyRequestsException
            (Json_deserializers.too_many_requests_exception_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : set_log_delivery_configuration_request) =
    let input = Json_serializers.set_log_delivery_configuration_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request
      ~shape_name:"AWSCognitoIdentityProviderService.SetLogDeliveryConfiguration" ~service ~context
      ~input
      ~output_deserializer:Json_deserializers.set_log_delivery_configuration_response_of_yojson
      ~error_deserializer

  let request_with_metadata context (request : set_log_delivery_configuration_request) =
    let input = Json_serializers.set_log_delivery_configuration_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata
      ~shape_name:"AWSCognitoIdentityProviderService.SetLogDeliveryConfiguration" ~service ~context
      ~input
      ~output_deserializer:Json_deserializers.set_log_delivery_configuration_response_of_yojson
      ~error_deserializer
end

module SetRiskConfiguration = struct
  let error_to_string = function
    | `CodeDeliveryFailureException _ ->
        "com.amazonaws.cognitoidentityprovider#CodeDeliveryFailureException"
    | `InternalErrorException _ -> "com.amazonaws.cognitoidentityprovider#InternalErrorException"
    | `InvalidEmailRoleAccessPolicyException _ ->
        "com.amazonaws.cognitoidentityprovider#InvalidEmailRoleAccessPolicyException"
    | `InvalidParameterException _ ->
        "com.amazonaws.cognitoidentityprovider#InvalidParameterException"
    | `NotAuthorizedException _ -> "com.amazonaws.cognitoidentityprovider#NotAuthorizedException"
    | `OperationNotEnabledException _ ->
        "com.amazonaws.cognitoidentityprovider#OperationNotEnabledException"
    | `ResourceNotFoundException _ ->
        "com.amazonaws.cognitoidentityprovider#ResourceNotFoundException"
    | `TooManyRequestsException _ ->
        "com.amazonaws.cognitoidentityprovider#TooManyRequestsException"
    | `UserPoolAddOnNotEnabledException _ ->
        "com.amazonaws.cognitoidentityprovider#UserPoolAddOnNotEnabledException"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "CodeDeliveryFailureException" ->
          `CodeDeliveryFailureException
            (Json_deserializers.code_delivery_failure_exception_of_yojson tree path)
      | _, "InternalErrorException" ->
          `InternalErrorException (Json_deserializers.internal_error_exception_of_yojson tree path)
      | _, "InvalidEmailRoleAccessPolicyException" ->
          `InvalidEmailRoleAccessPolicyException
            (Json_deserializers.invalid_email_role_access_policy_exception_of_yojson tree path)
      | _, "InvalidParameterException" ->
          `InvalidParameterException
            (Json_deserializers.invalid_parameter_exception_of_yojson tree path)
      | _, "NotAuthorizedException" ->
          `NotAuthorizedException (Json_deserializers.not_authorized_exception_of_yojson tree path)
      | _, "OperationNotEnabledException" ->
          `OperationNotEnabledException
            (Json_deserializers.operation_not_enabled_exception_of_yojson tree path)
      | _, "ResourceNotFoundException" ->
          `ResourceNotFoundException
            (Json_deserializers.resource_not_found_exception_of_yojson tree path)
      | _, "TooManyRequestsException" ->
          `TooManyRequestsException
            (Json_deserializers.too_many_requests_exception_of_yojson tree path)
      | _, "UserPoolAddOnNotEnabledException" ->
          `UserPoolAddOnNotEnabledException
            (Json_deserializers.user_pool_add_on_not_enabled_exception_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : set_risk_configuration_request) =
    let input = Json_serializers.set_risk_configuration_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request
      ~shape_name:"AWSCognitoIdentityProviderService.SetRiskConfiguration" ~service ~context ~input
      ~output_deserializer:Json_deserializers.set_risk_configuration_response_of_yojson
      ~error_deserializer

  let request_with_metadata context (request : set_risk_configuration_request) =
    let input = Json_serializers.set_risk_configuration_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata
      ~shape_name:"AWSCognitoIdentityProviderService.SetRiskConfiguration" ~service ~context ~input
      ~output_deserializer:Json_deserializers.set_risk_configuration_response_of_yojson
      ~error_deserializer
end

module SetUICustomization = struct
  let error_to_string = function
    | `InternalErrorException _ -> "com.amazonaws.cognitoidentityprovider#InternalErrorException"
    | `InvalidParameterException _ ->
        "com.amazonaws.cognitoidentityprovider#InvalidParameterException"
    | `NotAuthorizedException _ -> "com.amazonaws.cognitoidentityprovider#NotAuthorizedException"
    | `OperationNotEnabledException _ ->
        "com.amazonaws.cognitoidentityprovider#OperationNotEnabledException"
    | `ResourceNotFoundException _ ->
        "com.amazonaws.cognitoidentityprovider#ResourceNotFoundException"
    | `TooManyRequestsException _ ->
        "com.amazonaws.cognitoidentityprovider#TooManyRequestsException"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "InternalErrorException" ->
          `InternalErrorException (Json_deserializers.internal_error_exception_of_yojson tree path)
      | _, "InvalidParameterException" ->
          `InvalidParameterException
            (Json_deserializers.invalid_parameter_exception_of_yojson tree path)
      | _, "NotAuthorizedException" ->
          `NotAuthorizedException (Json_deserializers.not_authorized_exception_of_yojson tree path)
      | _, "OperationNotEnabledException" ->
          `OperationNotEnabledException
            (Json_deserializers.operation_not_enabled_exception_of_yojson tree path)
      | _, "ResourceNotFoundException" ->
          `ResourceNotFoundException
            (Json_deserializers.resource_not_found_exception_of_yojson tree path)
      | _, "TooManyRequestsException" ->
          `TooManyRequestsException
            (Json_deserializers.too_many_requests_exception_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : set_ui_customization_request) =
    let input = Json_serializers.set_ui_customization_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request
      ~shape_name:"AWSCognitoIdentityProviderService.SetUICustomization" ~service ~context ~input
      ~output_deserializer:Json_deserializers.set_ui_customization_response_of_yojson
      ~error_deserializer

  let request_with_metadata context (request : set_ui_customization_request) =
    let input = Json_serializers.set_ui_customization_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata
      ~shape_name:"AWSCognitoIdentityProviderService.SetUICustomization" ~service ~context ~input
      ~output_deserializer:Json_deserializers.set_ui_customization_response_of_yojson
      ~error_deserializer
end

module SetUserMFAPreference = struct
  let error_to_string = function
    | `ForbiddenException _ -> "com.amazonaws.cognitoidentityprovider#ForbiddenException"
    | `InternalErrorException _ -> "com.amazonaws.cognitoidentityprovider#InternalErrorException"
    | `InvalidParameterException _ ->
        "com.amazonaws.cognitoidentityprovider#InvalidParameterException"
    | `NotAuthorizedException _ -> "com.amazonaws.cognitoidentityprovider#NotAuthorizedException"
    | `OperationNotEnabledException _ ->
        "com.amazonaws.cognitoidentityprovider#OperationNotEnabledException"
    | `PasswordResetRequiredException _ ->
        "com.amazonaws.cognitoidentityprovider#PasswordResetRequiredException"
    | `ResourceNotFoundException _ ->
        "com.amazonaws.cognitoidentityprovider#ResourceNotFoundException"
    | `UserNotConfirmedException _ ->
        "com.amazonaws.cognitoidentityprovider#UserNotConfirmedException"
    | `UserNotFoundException _ -> "com.amazonaws.cognitoidentityprovider#UserNotFoundException"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "ForbiddenException" ->
          `ForbiddenException (Json_deserializers.forbidden_exception_of_yojson tree path)
      | _, "InternalErrorException" ->
          `InternalErrorException (Json_deserializers.internal_error_exception_of_yojson tree path)
      | _, "InvalidParameterException" ->
          `InvalidParameterException
            (Json_deserializers.invalid_parameter_exception_of_yojson tree path)
      | _, "NotAuthorizedException" ->
          `NotAuthorizedException (Json_deserializers.not_authorized_exception_of_yojson tree path)
      | _, "OperationNotEnabledException" ->
          `OperationNotEnabledException
            (Json_deserializers.operation_not_enabled_exception_of_yojson tree path)
      | _, "PasswordResetRequiredException" ->
          `PasswordResetRequiredException
            (Json_deserializers.password_reset_required_exception_of_yojson tree path)
      | _, "ResourceNotFoundException" ->
          `ResourceNotFoundException
            (Json_deserializers.resource_not_found_exception_of_yojson tree path)
      | _, "UserNotConfirmedException" ->
          `UserNotConfirmedException
            (Json_deserializers.user_not_confirmed_exception_of_yojson tree path)
      | _, "UserNotFoundException" ->
          `UserNotFoundException (Json_deserializers.user_not_found_exception_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : set_user_mfa_preference_request) =
    let input = Json_serializers.set_user_mfa_preference_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request
      ~shape_name:"AWSCognitoIdentityProviderService.SetUserMFAPreference" ~service ~context ~input
      ~output_deserializer:Json_deserializers.set_user_mfa_preference_response_of_yojson
      ~error_deserializer

  let request_with_metadata context (request : set_user_mfa_preference_request) =
    let input = Json_serializers.set_user_mfa_preference_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata
      ~shape_name:"AWSCognitoIdentityProviderService.SetUserMFAPreference" ~service ~context ~input
      ~output_deserializer:Json_deserializers.set_user_mfa_preference_response_of_yojson
      ~error_deserializer
end

module SetUserPoolMfaConfig = struct
  let error_to_string = function
    | `ConcurrentModificationException _ ->
        "com.amazonaws.cognitoidentityprovider#ConcurrentModificationException"
    | `FeatureUnavailableInTierException _ ->
        "com.amazonaws.cognitoidentityprovider#FeatureUnavailableInTierException"
    | `InternalErrorException _ -> "com.amazonaws.cognitoidentityprovider#InternalErrorException"
    | `InvalidParameterException _ ->
        "com.amazonaws.cognitoidentityprovider#InvalidParameterException"
    | `InvalidSmsRoleAccessPolicyException _ ->
        "com.amazonaws.cognitoidentityprovider#InvalidSmsRoleAccessPolicyException"
    | `InvalidSmsRoleTrustRelationshipException _ ->
        "com.amazonaws.cognitoidentityprovider#InvalidSmsRoleTrustRelationshipException"
    | `NotAuthorizedException _ -> "com.amazonaws.cognitoidentityprovider#NotAuthorizedException"
    | `OperationNotEnabledException _ ->
        "com.amazonaws.cognitoidentityprovider#OperationNotEnabledException"
    | `ResourceNotFoundException _ ->
        "com.amazonaws.cognitoidentityprovider#ResourceNotFoundException"
    | `TooManyRequestsException _ ->
        "com.amazonaws.cognitoidentityprovider#TooManyRequestsException"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "ConcurrentModificationException" ->
          `ConcurrentModificationException
            (Json_deserializers.concurrent_modification_exception_of_yojson tree path)
      | _, "FeatureUnavailableInTierException" ->
          `FeatureUnavailableInTierException
            (Json_deserializers.feature_unavailable_in_tier_exception_of_yojson tree path)
      | _, "InternalErrorException" ->
          `InternalErrorException (Json_deserializers.internal_error_exception_of_yojson tree path)
      | _, "InvalidParameterException" ->
          `InvalidParameterException
            (Json_deserializers.invalid_parameter_exception_of_yojson tree path)
      | _, "InvalidSmsRoleAccessPolicyException" ->
          `InvalidSmsRoleAccessPolicyException
            (Json_deserializers.invalid_sms_role_access_policy_exception_of_yojson tree path)
      | _, "InvalidSmsRoleTrustRelationshipException" ->
          `InvalidSmsRoleTrustRelationshipException
            (Json_deserializers.invalid_sms_role_trust_relationship_exception_of_yojson tree path)
      | _, "NotAuthorizedException" ->
          `NotAuthorizedException (Json_deserializers.not_authorized_exception_of_yojson tree path)
      | _, "OperationNotEnabledException" ->
          `OperationNotEnabledException
            (Json_deserializers.operation_not_enabled_exception_of_yojson tree path)
      | _, "ResourceNotFoundException" ->
          `ResourceNotFoundException
            (Json_deserializers.resource_not_found_exception_of_yojson tree path)
      | _, "TooManyRequestsException" ->
          `TooManyRequestsException
            (Json_deserializers.too_many_requests_exception_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : set_user_pool_mfa_config_request) =
    let input = Json_serializers.set_user_pool_mfa_config_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request
      ~shape_name:"AWSCognitoIdentityProviderService.SetUserPoolMfaConfig" ~service ~context ~input
      ~output_deserializer:Json_deserializers.set_user_pool_mfa_config_response_of_yojson
      ~error_deserializer

  let request_with_metadata context (request : set_user_pool_mfa_config_request) =
    let input = Json_serializers.set_user_pool_mfa_config_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata
      ~shape_name:"AWSCognitoIdentityProviderService.SetUserPoolMfaConfig" ~service ~context ~input
      ~output_deserializer:Json_deserializers.set_user_pool_mfa_config_response_of_yojson
      ~error_deserializer
end

module SetUserSettings = struct
  let error_to_string = function
    | `ForbiddenException _ -> "com.amazonaws.cognitoidentityprovider#ForbiddenException"
    | `InternalErrorException _ -> "com.amazonaws.cognitoidentityprovider#InternalErrorException"
    | `InvalidParameterException _ ->
        "com.amazonaws.cognitoidentityprovider#InvalidParameterException"
    | `NotAuthorizedException _ -> "com.amazonaws.cognitoidentityprovider#NotAuthorizedException"
    | `OperationNotEnabledException _ ->
        "com.amazonaws.cognitoidentityprovider#OperationNotEnabledException"
    | `PasswordResetRequiredException _ ->
        "com.amazonaws.cognitoidentityprovider#PasswordResetRequiredException"
    | `ResourceNotFoundException _ ->
        "com.amazonaws.cognitoidentityprovider#ResourceNotFoundException"
    | `UserNotConfirmedException _ ->
        "com.amazonaws.cognitoidentityprovider#UserNotConfirmedException"
    | `UserNotFoundException _ -> "com.amazonaws.cognitoidentityprovider#UserNotFoundException"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "ForbiddenException" ->
          `ForbiddenException (Json_deserializers.forbidden_exception_of_yojson tree path)
      | _, "InternalErrorException" ->
          `InternalErrorException (Json_deserializers.internal_error_exception_of_yojson tree path)
      | _, "InvalidParameterException" ->
          `InvalidParameterException
            (Json_deserializers.invalid_parameter_exception_of_yojson tree path)
      | _, "NotAuthorizedException" ->
          `NotAuthorizedException (Json_deserializers.not_authorized_exception_of_yojson tree path)
      | _, "OperationNotEnabledException" ->
          `OperationNotEnabledException
            (Json_deserializers.operation_not_enabled_exception_of_yojson tree path)
      | _, "PasswordResetRequiredException" ->
          `PasswordResetRequiredException
            (Json_deserializers.password_reset_required_exception_of_yojson tree path)
      | _, "ResourceNotFoundException" ->
          `ResourceNotFoundException
            (Json_deserializers.resource_not_found_exception_of_yojson tree path)
      | _, "UserNotConfirmedException" ->
          `UserNotConfirmedException
            (Json_deserializers.user_not_confirmed_exception_of_yojson tree path)
      | _, "UserNotFoundException" ->
          `UserNotFoundException (Json_deserializers.user_not_found_exception_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : set_user_settings_request) =
    let input = Json_serializers.set_user_settings_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request
      ~shape_name:"AWSCognitoIdentityProviderService.SetUserSettings" ~service ~context ~input
      ~output_deserializer:Json_deserializers.set_user_settings_response_of_yojson
      ~error_deserializer

  let request_with_metadata context (request : set_user_settings_request) =
    let input = Json_serializers.set_user_settings_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata
      ~shape_name:"AWSCognitoIdentityProviderService.SetUserSettings" ~service ~context ~input
      ~output_deserializer:Json_deserializers.set_user_settings_response_of_yojson
      ~error_deserializer
end

module SignUp = struct
  let error_to_string = function
    | `CodeDeliveryFailureException _ ->
        "com.amazonaws.cognitoidentityprovider#CodeDeliveryFailureException"
    | `ForbiddenException _ -> "com.amazonaws.cognitoidentityprovider#ForbiddenException"
    | `InternalErrorException _ -> "com.amazonaws.cognitoidentityprovider#InternalErrorException"
    | `InvalidEmailRoleAccessPolicyException _ ->
        "com.amazonaws.cognitoidentityprovider#InvalidEmailRoleAccessPolicyException"
    | `InvalidLambdaResponseException _ ->
        "com.amazonaws.cognitoidentityprovider#InvalidLambdaResponseException"
    | `InvalidParameterException _ ->
        "com.amazonaws.cognitoidentityprovider#InvalidParameterException"
    | `InvalidPasswordException _ ->
        "com.amazonaws.cognitoidentityprovider#InvalidPasswordException"
    | `InvalidSmsRoleAccessPolicyException _ ->
        "com.amazonaws.cognitoidentityprovider#InvalidSmsRoleAccessPolicyException"
    | `InvalidSmsRoleTrustRelationshipException _ ->
        "com.amazonaws.cognitoidentityprovider#InvalidSmsRoleTrustRelationshipException"
    | `LimitExceededException _ -> "com.amazonaws.cognitoidentityprovider#LimitExceededException"
    | `NotAuthorizedException _ -> "com.amazonaws.cognitoidentityprovider#NotAuthorizedException"
    | `OperationNotEnabledException _ ->
        "com.amazonaws.cognitoidentityprovider#OperationNotEnabledException"
    | `ResourceNotFoundException _ ->
        "com.amazonaws.cognitoidentityprovider#ResourceNotFoundException"
    | `TooManyRequestsException _ ->
        "com.amazonaws.cognitoidentityprovider#TooManyRequestsException"
    | `UnexpectedLambdaException _ ->
        "com.amazonaws.cognitoidentityprovider#UnexpectedLambdaException"
    | `UserLambdaValidationException _ ->
        "com.amazonaws.cognitoidentityprovider#UserLambdaValidationException"
    | `UsernameExistsException _ -> "com.amazonaws.cognitoidentityprovider#UsernameExistsException"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "CodeDeliveryFailureException" ->
          `CodeDeliveryFailureException
            (Json_deserializers.code_delivery_failure_exception_of_yojson tree path)
      | _, "ForbiddenException" ->
          `ForbiddenException (Json_deserializers.forbidden_exception_of_yojson tree path)
      | _, "InternalErrorException" ->
          `InternalErrorException (Json_deserializers.internal_error_exception_of_yojson tree path)
      | _, "InvalidEmailRoleAccessPolicyException" ->
          `InvalidEmailRoleAccessPolicyException
            (Json_deserializers.invalid_email_role_access_policy_exception_of_yojson tree path)
      | _, "InvalidLambdaResponseException" ->
          `InvalidLambdaResponseException
            (Json_deserializers.invalid_lambda_response_exception_of_yojson tree path)
      | _, "InvalidParameterException" ->
          `InvalidParameterException
            (Json_deserializers.invalid_parameter_exception_of_yojson tree path)
      | _, "InvalidPasswordException" ->
          `InvalidPasswordException
            (Json_deserializers.invalid_password_exception_of_yojson tree path)
      | _, "InvalidSmsRoleAccessPolicyException" ->
          `InvalidSmsRoleAccessPolicyException
            (Json_deserializers.invalid_sms_role_access_policy_exception_of_yojson tree path)
      | _, "InvalidSmsRoleTrustRelationshipException" ->
          `InvalidSmsRoleTrustRelationshipException
            (Json_deserializers.invalid_sms_role_trust_relationship_exception_of_yojson tree path)
      | _, "LimitExceededException" ->
          `LimitExceededException (Json_deserializers.limit_exceeded_exception_of_yojson tree path)
      | _, "NotAuthorizedException" ->
          `NotAuthorizedException (Json_deserializers.not_authorized_exception_of_yojson tree path)
      | _, "OperationNotEnabledException" ->
          `OperationNotEnabledException
            (Json_deserializers.operation_not_enabled_exception_of_yojson tree path)
      | _, "ResourceNotFoundException" ->
          `ResourceNotFoundException
            (Json_deserializers.resource_not_found_exception_of_yojson tree path)
      | _, "TooManyRequestsException" ->
          `TooManyRequestsException
            (Json_deserializers.too_many_requests_exception_of_yojson tree path)
      | _, "UnexpectedLambdaException" ->
          `UnexpectedLambdaException
            (Json_deserializers.unexpected_lambda_exception_of_yojson tree path)
      | _, "UserLambdaValidationException" ->
          `UserLambdaValidationException
            (Json_deserializers.user_lambda_validation_exception_of_yojson tree path)
      | _, "UsernameExistsException" ->
          `UsernameExistsException
            (Json_deserializers.username_exists_exception_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : sign_up_request) =
    let input = Json_serializers.sign_up_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"AWSCognitoIdentityProviderService.SignUp"
      ~service ~context ~input ~output_deserializer:Json_deserializers.sign_up_response_of_yojson
      ~error_deserializer

  let request_with_metadata context (request : sign_up_request) =
    let input = Json_serializers.sign_up_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata
      ~shape_name:"AWSCognitoIdentityProviderService.SignUp" ~service ~context ~input
      ~output_deserializer:Json_deserializers.sign_up_response_of_yojson ~error_deserializer
end

module StartUserImportJob = struct
  let error_to_string = function
    | `InternalErrorException _ -> "com.amazonaws.cognitoidentityprovider#InternalErrorException"
    | `InvalidParameterException _ ->
        "com.amazonaws.cognitoidentityprovider#InvalidParameterException"
    | `NotAuthorizedException _ -> "com.amazonaws.cognitoidentityprovider#NotAuthorizedException"
    | `OperationNotEnabledException _ ->
        "com.amazonaws.cognitoidentityprovider#OperationNotEnabledException"
    | `PreconditionNotMetException _ ->
        "com.amazonaws.cognitoidentityprovider#PreconditionNotMetException"
    | `ResourceNotFoundException _ ->
        "com.amazonaws.cognitoidentityprovider#ResourceNotFoundException"
    | `TooManyRequestsException _ ->
        "com.amazonaws.cognitoidentityprovider#TooManyRequestsException"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "InternalErrorException" ->
          `InternalErrorException (Json_deserializers.internal_error_exception_of_yojson tree path)
      | _, "InvalidParameterException" ->
          `InvalidParameterException
            (Json_deserializers.invalid_parameter_exception_of_yojson tree path)
      | _, "NotAuthorizedException" ->
          `NotAuthorizedException (Json_deserializers.not_authorized_exception_of_yojson tree path)
      | _, "OperationNotEnabledException" ->
          `OperationNotEnabledException
            (Json_deserializers.operation_not_enabled_exception_of_yojson tree path)
      | _, "PreconditionNotMetException" ->
          `PreconditionNotMetException
            (Json_deserializers.precondition_not_met_exception_of_yojson tree path)
      | _, "ResourceNotFoundException" ->
          `ResourceNotFoundException
            (Json_deserializers.resource_not_found_exception_of_yojson tree path)
      | _, "TooManyRequestsException" ->
          `TooManyRequestsException
            (Json_deserializers.too_many_requests_exception_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : start_user_import_job_request) =
    let input = Json_serializers.start_user_import_job_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request
      ~shape_name:"AWSCognitoIdentityProviderService.StartUserImportJob" ~service ~context ~input
      ~output_deserializer:Json_deserializers.start_user_import_job_response_of_yojson
      ~error_deserializer

  let request_with_metadata context (request : start_user_import_job_request) =
    let input = Json_serializers.start_user_import_job_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata
      ~shape_name:"AWSCognitoIdentityProviderService.StartUserImportJob" ~service ~context ~input
      ~output_deserializer:Json_deserializers.start_user_import_job_response_of_yojson
      ~error_deserializer
end

module StartWebAuthnRegistration = struct
  let error_to_string = function
    | `ForbiddenException _ -> "com.amazonaws.cognitoidentityprovider#ForbiddenException"
    | `InternalErrorException _ -> "com.amazonaws.cognitoidentityprovider#InternalErrorException"
    | `InvalidParameterException _ ->
        "com.amazonaws.cognitoidentityprovider#InvalidParameterException"
    | `LimitExceededException _ -> "com.amazonaws.cognitoidentityprovider#LimitExceededException"
    | `NotAuthorizedException _ -> "com.amazonaws.cognitoidentityprovider#NotAuthorizedException"
    | `OperationNotEnabledException _ ->
        "com.amazonaws.cognitoidentityprovider#OperationNotEnabledException"
    | `PasswordResetRequiredException _ ->
        "com.amazonaws.cognitoidentityprovider#PasswordResetRequiredException"
    | `TooManyRequestsException _ ->
        "com.amazonaws.cognitoidentityprovider#TooManyRequestsException"
    | `WebAuthnConfigurationMissingException _ ->
        "com.amazonaws.cognitoidentityprovider#WebAuthnConfigurationMissingException"
    | `WebAuthnNotEnabledException _ ->
        "com.amazonaws.cognitoidentityprovider#WebAuthnNotEnabledException"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "ForbiddenException" ->
          `ForbiddenException (Json_deserializers.forbidden_exception_of_yojson tree path)
      | _, "InternalErrorException" ->
          `InternalErrorException (Json_deserializers.internal_error_exception_of_yojson tree path)
      | _, "InvalidParameterException" ->
          `InvalidParameterException
            (Json_deserializers.invalid_parameter_exception_of_yojson tree path)
      | _, "LimitExceededException" ->
          `LimitExceededException (Json_deserializers.limit_exceeded_exception_of_yojson tree path)
      | _, "NotAuthorizedException" ->
          `NotAuthorizedException (Json_deserializers.not_authorized_exception_of_yojson tree path)
      | _, "OperationNotEnabledException" ->
          `OperationNotEnabledException
            (Json_deserializers.operation_not_enabled_exception_of_yojson tree path)
      | _, "PasswordResetRequiredException" ->
          `PasswordResetRequiredException
            (Json_deserializers.password_reset_required_exception_of_yojson tree path)
      | _, "TooManyRequestsException" ->
          `TooManyRequestsException
            (Json_deserializers.too_many_requests_exception_of_yojson tree path)
      | _, "WebAuthnConfigurationMissingException" ->
          `WebAuthnConfigurationMissingException
            (Json_deserializers.web_authn_configuration_missing_exception_of_yojson tree path)
      | _, "WebAuthnNotEnabledException" ->
          `WebAuthnNotEnabledException
            (Json_deserializers.web_authn_not_enabled_exception_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : start_web_authn_registration_request) =
    let input = Json_serializers.start_web_authn_registration_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request
      ~shape_name:"AWSCognitoIdentityProviderService.StartWebAuthnRegistration" ~service ~context
      ~input ~output_deserializer:Json_deserializers.start_web_authn_registration_response_of_yojson
      ~error_deserializer

  let request_with_metadata context (request : start_web_authn_registration_request) =
    let input = Json_serializers.start_web_authn_registration_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata
      ~shape_name:"AWSCognitoIdentityProviderService.StartWebAuthnRegistration" ~service ~context
      ~input ~output_deserializer:Json_deserializers.start_web_authn_registration_response_of_yojson
      ~error_deserializer
end

module StopUserImportJob = struct
  let error_to_string = function
    | `InternalErrorException _ -> "com.amazonaws.cognitoidentityprovider#InternalErrorException"
    | `InvalidParameterException _ ->
        "com.amazonaws.cognitoidentityprovider#InvalidParameterException"
    | `NotAuthorizedException _ -> "com.amazonaws.cognitoidentityprovider#NotAuthorizedException"
    | `OperationNotEnabledException _ ->
        "com.amazonaws.cognitoidentityprovider#OperationNotEnabledException"
    | `PreconditionNotMetException _ ->
        "com.amazonaws.cognitoidentityprovider#PreconditionNotMetException"
    | `ResourceNotFoundException _ ->
        "com.amazonaws.cognitoidentityprovider#ResourceNotFoundException"
    | `TooManyRequestsException _ ->
        "com.amazonaws.cognitoidentityprovider#TooManyRequestsException"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "InternalErrorException" ->
          `InternalErrorException (Json_deserializers.internal_error_exception_of_yojson tree path)
      | _, "InvalidParameterException" ->
          `InvalidParameterException
            (Json_deserializers.invalid_parameter_exception_of_yojson tree path)
      | _, "NotAuthorizedException" ->
          `NotAuthorizedException (Json_deserializers.not_authorized_exception_of_yojson tree path)
      | _, "OperationNotEnabledException" ->
          `OperationNotEnabledException
            (Json_deserializers.operation_not_enabled_exception_of_yojson tree path)
      | _, "PreconditionNotMetException" ->
          `PreconditionNotMetException
            (Json_deserializers.precondition_not_met_exception_of_yojson tree path)
      | _, "ResourceNotFoundException" ->
          `ResourceNotFoundException
            (Json_deserializers.resource_not_found_exception_of_yojson tree path)
      | _, "TooManyRequestsException" ->
          `TooManyRequestsException
            (Json_deserializers.too_many_requests_exception_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : stop_user_import_job_request) =
    let input = Json_serializers.stop_user_import_job_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request
      ~shape_name:"AWSCognitoIdentityProviderService.StopUserImportJob" ~service ~context ~input
      ~output_deserializer:Json_deserializers.stop_user_import_job_response_of_yojson
      ~error_deserializer

  let request_with_metadata context (request : stop_user_import_job_request) =
    let input = Json_serializers.stop_user_import_job_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata
      ~shape_name:"AWSCognitoIdentityProviderService.StopUserImportJob" ~service ~context ~input
      ~output_deserializer:Json_deserializers.stop_user_import_job_response_of_yojson
      ~error_deserializer
end

module TagResource = struct
  let error_to_string = function
    | `InternalErrorException _ -> "com.amazonaws.cognitoidentityprovider#InternalErrorException"
    | `InvalidParameterException _ ->
        "com.amazonaws.cognitoidentityprovider#InvalidParameterException"
    | `NotAuthorizedException _ -> "com.amazonaws.cognitoidentityprovider#NotAuthorizedException"
    | `OperationNotEnabledException _ ->
        "com.amazonaws.cognitoidentityprovider#OperationNotEnabledException"
    | `ResourceNotFoundException _ ->
        "com.amazonaws.cognitoidentityprovider#ResourceNotFoundException"
    | `TooManyRequestsException _ ->
        "com.amazonaws.cognitoidentityprovider#TooManyRequestsException"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "InternalErrorException" ->
          `InternalErrorException (Json_deserializers.internal_error_exception_of_yojson tree path)
      | _, "InvalidParameterException" ->
          `InvalidParameterException
            (Json_deserializers.invalid_parameter_exception_of_yojson tree path)
      | _, "NotAuthorizedException" ->
          `NotAuthorizedException (Json_deserializers.not_authorized_exception_of_yojson tree path)
      | _, "OperationNotEnabledException" ->
          `OperationNotEnabledException
            (Json_deserializers.operation_not_enabled_exception_of_yojson tree path)
      | _, "ResourceNotFoundException" ->
          `ResourceNotFoundException
            (Json_deserializers.resource_not_found_exception_of_yojson tree path)
      | _, "TooManyRequestsException" ->
          `TooManyRequestsException
            (Json_deserializers.too_many_requests_exception_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : tag_resource_request) =
    let input = Json_serializers.tag_resource_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"AWSCognitoIdentityProviderService.TagResource"
      ~service ~context ~input
      ~output_deserializer:Json_deserializers.tag_resource_response_of_yojson ~error_deserializer

  let request_with_metadata context (request : tag_resource_request) =
    let input = Json_serializers.tag_resource_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata
      ~shape_name:"AWSCognitoIdentityProviderService.TagResource" ~service ~context ~input
      ~output_deserializer:Json_deserializers.tag_resource_response_of_yojson ~error_deserializer
end

module UntagResource = struct
  let error_to_string = function
    | `InternalErrorException _ -> "com.amazonaws.cognitoidentityprovider#InternalErrorException"
    | `InvalidParameterException _ ->
        "com.amazonaws.cognitoidentityprovider#InvalidParameterException"
    | `NotAuthorizedException _ -> "com.amazonaws.cognitoidentityprovider#NotAuthorizedException"
    | `OperationNotEnabledException _ ->
        "com.amazonaws.cognitoidentityprovider#OperationNotEnabledException"
    | `ResourceNotFoundException _ ->
        "com.amazonaws.cognitoidentityprovider#ResourceNotFoundException"
    | `TooManyRequestsException _ ->
        "com.amazonaws.cognitoidentityprovider#TooManyRequestsException"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "InternalErrorException" ->
          `InternalErrorException (Json_deserializers.internal_error_exception_of_yojson tree path)
      | _, "InvalidParameterException" ->
          `InvalidParameterException
            (Json_deserializers.invalid_parameter_exception_of_yojson tree path)
      | _, "NotAuthorizedException" ->
          `NotAuthorizedException (Json_deserializers.not_authorized_exception_of_yojson tree path)
      | _, "OperationNotEnabledException" ->
          `OperationNotEnabledException
            (Json_deserializers.operation_not_enabled_exception_of_yojson tree path)
      | _, "ResourceNotFoundException" ->
          `ResourceNotFoundException
            (Json_deserializers.resource_not_found_exception_of_yojson tree path)
      | _, "TooManyRequestsException" ->
          `TooManyRequestsException
            (Json_deserializers.too_many_requests_exception_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : untag_resource_request) =
    let input = Json_serializers.untag_resource_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request
      ~shape_name:"AWSCognitoIdentityProviderService.UntagResource" ~service ~context ~input
      ~output_deserializer:Json_deserializers.untag_resource_response_of_yojson ~error_deserializer

  let request_with_metadata context (request : untag_resource_request) =
    let input = Json_serializers.untag_resource_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata
      ~shape_name:"AWSCognitoIdentityProviderService.UntagResource" ~service ~context ~input
      ~output_deserializer:Json_deserializers.untag_resource_response_of_yojson ~error_deserializer
end

module UpdateAuthEventFeedback = struct
  let error_to_string = function
    | `InternalErrorException _ -> "com.amazonaws.cognitoidentityprovider#InternalErrorException"
    | `InvalidParameterException _ ->
        "com.amazonaws.cognitoidentityprovider#InvalidParameterException"
    | `NotAuthorizedException _ -> "com.amazonaws.cognitoidentityprovider#NotAuthorizedException"
    | `OperationNotEnabledException _ ->
        "com.amazonaws.cognitoidentityprovider#OperationNotEnabledException"
    | `ResourceNotFoundException _ ->
        "com.amazonaws.cognitoidentityprovider#ResourceNotFoundException"
    | `TooManyRequestsException _ ->
        "com.amazonaws.cognitoidentityprovider#TooManyRequestsException"
    | `UserNotFoundException _ -> "com.amazonaws.cognitoidentityprovider#UserNotFoundException"
    | `UserPoolAddOnNotEnabledException _ ->
        "com.amazonaws.cognitoidentityprovider#UserPoolAddOnNotEnabledException"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "InternalErrorException" ->
          `InternalErrorException (Json_deserializers.internal_error_exception_of_yojson tree path)
      | _, "InvalidParameterException" ->
          `InvalidParameterException
            (Json_deserializers.invalid_parameter_exception_of_yojson tree path)
      | _, "NotAuthorizedException" ->
          `NotAuthorizedException (Json_deserializers.not_authorized_exception_of_yojson tree path)
      | _, "OperationNotEnabledException" ->
          `OperationNotEnabledException
            (Json_deserializers.operation_not_enabled_exception_of_yojson tree path)
      | _, "ResourceNotFoundException" ->
          `ResourceNotFoundException
            (Json_deserializers.resource_not_found_exception_of_yojson tree path)
      | _, "TooManyRequestsException" ->
          `TooManyRequestsException
            (Json_deserializers.too_many_requests_exception_of_yojson tree path)
      | _, "UserNotFoundException" ->
          `UserNotFoundException (Json_deserializers.user_not_found_exception_of_yojson tree path)
      | _, "UserPoolAddOnNotEnabledException" ->
          `UserPoolAddOnNotEnabledException
            (Json_deserializers.user_pool_add_on_not_enabled_exception_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : update_auth_event_feedback_request) =
    let input = Json_serializers.update_auth_event_feedback_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request
      ~shape_name:"AWSCognitoIdentityProviderService.UpdateAuthEventFeedback" ~service ~context
      ~input ~output_deserializer:Json_deserializers.update_auth_event_feedback_response_of_yojson
      ~error_deserializer

  let request_with_metadata context (request : update_auth_event_feedback_request) =
    let input = Json_serializers.update_auth_event_feedback_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata
      ~shape_name:"AWSCognitoIdentityProviderService.UpdateAuthEventFeedback" ~service ~context
      ~input ~output_deserializer:Json_deserializers.update_auth_event_feedback_response_of_yojson
      ~error_deserializer
end

module UpdateDeviceStatus = struct
  let error_to_string = function
    | `ForbiddenException _ -> "com.amazonaws.cognitoidentityprovider#ForbiddenException"
    | `InternalErrorException _ -> "com.amazonaws.cognitoidentityprovider#InternalErrorException"
    | `InvalidParameterException _ ->
        "com.amazonaws.cognitoidentityprovider#InvalidParameterException"
    | `InvalidUserPoolConfigurationException _ ->
        "com.amazonaws.cognitoidentityprovider#InvalidUserPoolConfigurationException"
    | `NotAuthorizedException _ -> "com.amazonaws.cognitoidentityprovider#NotAuthorizedException"
    | `OperationNotEnabledException _ ->
        "com.amazonaws.cognitoidentityprovider#OperationNotEnabledException"
    | `PasswordResetRequiredException _ ->
        "com.amazonaws.cognitoidentityprovider#PasswordResetRequiredException"
    | `ResourceNotFoundException _ ->
        "com.amazonaws.cognitoidentityprovider#ResourceNotFoundException"
    | `TooManyRequestsException _ ->
        "com.amazonaws.cognitoidentityprovider#TooManyRequestsException"
    | `UserNotConfirmedException _ ->
        "com.amazonaws.cognitoidentityprovider#UserNotConfirmedException"
    | `UserNotFoundException _ -> "com.amazonaws.cognitoidentityprovider#UserNotFoundException"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "ForbiddenException" ->
          `ForbiddenException (Json_deserializers.forbidden_exception_of_yojson tree path)
      | _, "InternalErrorException" ->
          `InternalErrorException (Json_deserializers.internal_error_exception_of_yojson tree path)
      | _, "InvalidParameterException" ->
          `InvalidParameterException
            (Json_deserializers.invalid_parameter_exception_of_yojson tree path)
      | _, "InvalidUserPoolConfigurationException" ->
          `InvalidUserPoolConfigurationException
            (Json_deserializers.invalid_user_pool_configuration_exception_of_yojson tree path)
      | _, "NotAuthorizedException" ->
          `NotAuthorizedException (Json_deserializers.not_authorized_exception_of_yojson tree path)
      | _, "OperationNotEnabledException" ->
          `OperationNotEnabledException
            (Json_deserializers.operation_not_enabled_exception_of_yojson tree path)
      | _, "PasswordResetRequiredException" ->
          `PasswordResetRequiredException
            (Json_deserializers.password_reset_required_exception_of_yojson tree path)
      | _, "ResourceNotFoundException" ->
          `ResourceNotFoundException
            (Json_deserializers.resource_not_found_exception_of_yojson tree path)
      | _, "TooManyRequestsException" ->
          `TooManyRequestsException
            (Json_deserializers.too_many_requests_exception_of_yojson tree path)
      | _, "UserNotConfirmedException" ->
          `UserNotConfirmedException
            (Json_deserializers.user_not_confirmed_exception_of_yojson tree path)
      | _, "UserNotFoundException" ->
          `UserNotFoundException (Json_deserializers.user_not_found_exception_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : update_device_status_request) =
    let input = Json_serializers.update_device_status_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request
      ~shape_name:"AWSCognitoIdentityProviderService.UpdateDeviceStatus" ~service ~context ~input
      ~output_deserializer:Json_deserializers.update_device_status_response_of_yojson
      ~error_deserializer

  let request_with_metadata context (request : update_device_status_request) =
    let input = Json_serializers.update_device_status_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata
      ~shape_name:"AWSCognitoIdentityProviderService.UpdateDeviceStatus" ~service ~context ~input
      ~output_deserializer:Json_deserializers.update_device_status_response_of_yojson
      ~error_deserializer
end

module UpdateGroup = struct
  let error_to_string = function
    | `InternalErrorException _ -> "com.amazonaws.cognitoidentityprovider#InternalErrorException"
    | `InvalidParameterException _ ->
        "com.amazonaws.cognitoidentityprovider#InvalidParameterException"
    | `NotAuthorizedException _ -> "com.amazonaws.cognitoidentityprovider#NotAuthorizedException"
    | `OperationNotEnabledException _ ->
        "com.amazonaws.cognitoidentityprovider#OperationNotEnabledException"
    | `ResourceNotFoundException _ ->
        "com.amazonaws.cognitoidentityprovider#ResourceNotFoundException"
    | `TooManyRequestsException _ ->
        "com.amazonaws.cognitoidentityprovider#TooManyRequestsException"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "InternalErrorException" ->
          `InternalErrorException (Json_deserializers.internal_error_exception_of_yojson tree path)
      | _, "InvalidParameterException" ->
          `InvalidParameterException
            (Json_deserializers.invalid_parameter_exception_of_yojson tree path)
      | _, "NotAuthorizedException" ->
          `NotAuthorizedException (Json_deserializers.not_authorized_exception_of_yojson tree path)
      | _, "OperationNotEnabledException" ->
          `OperationNotEnabledException
            (Json_deserializers.operation_not_enabled_exception_of_yojson tree path)
      | _, "ResourceNotFoundException" ->
          `ResourceNotFoundException
            (Json_deserializers.resource_not_found_exception_of_yojson tree path)
      | _, "TooManyRequestsException" ->
          `TooManyRequestsException
            (Json_deserializers.too_many_requests_exception_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : update_group_request) =
    let input = Json_serializers.update_group_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"AWSCognitoIdentityProviderService.UpdateGroup"
      ~service ~context ~input
      ~output_deserializer:Json_deserializers.update_group_response_of_yojson ~error_deserializer

  let request_with_metadata context (request : update_group_request) =
    let input = Json_serializers.update_group_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata
      ~shape_name:"AWSCognitoIdentityProviderService.UpdateGroup" ~service ~context ~input
      ~output_deserializer:Json_deserializers.update_group_response_of_yojson ~error_deserializer
end

module UpdateIdentityProvider = struct
  let error_to_string = function
    | `ConcurrentModificationException _ ->
        "com.amazonaws.cognitoidentityprovider#ConcurrentModificationException"
    | `InternalErrorException _ -> "com.amazonaws.cognitoidentityprovider#InternalErrorException"
    | `InvalidParameterException _ ->
        "com.amazonaws.cognitoidentityprovider#InvalidParameterException"
    | `NotAuthorizedException _ -> "com.amazonaws.cognitoidentityprovider#NotAuthorizedException"
    | `ResourceNotFoundException _ ->
        "com.amazonaws.cognitoidentityprovider#ResourceNotFoundException"
    | `TooManyRequestsException _ ->
        "com.amazonaws.cognitoidentityprovider#TooManyRequestsException"
    | `UnsupportedIdentityProviderException _ ->
        "com.amazonaws.cognitoidentityprovider#UnsupportedIdentityProviderException"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "ConcurrentModificationException" ->
          `ConcurrentModificationException
            (Json_deserializers.concurrent_modification_exception_of_yojson tree path)
      | _, "InternalErrorException" ->
          `InternalErrorException (Json_deserializers.internal_error_exception_of_yojson tree path)
      | _, "InvalidParameterException" ->
          `InvalidParameterException
            (Json_deserializers.invalid_parameter_exception_of_yojson tree path)
      | _, "NotAuthorizedException" ->
          `NotAuthorizedException (Json_deserializers.not_authorized_exception_of_yojson tree path)
      | _, "ResourceNotFoundException" ->
          `ResourceNotFoundException
            (Json_deserializers.resource_not_found_exception_of_yojson tree path)
      | _, "TooManyRequestsException" ->
          `TooManyRequestsException
            (Json_deserializers.too_many_requests_exception_of_yojson tree path)
      | _, "UnsupportedIdentityProviderException" ->
          `UnsupportedIdentityProviderException
            (Json_deserializers.unsupported_identity_provider_exception_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : update_identity_provider_request) =
    let input = Json_serializers.update_identity_provider_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request
      ~shape_name:"AWSCognitoIdentityProviderService.UpdateIdentityProvider" ~service ~context
      ~input ~output_deserializer:Json_deserializers.update_identity_provider_response_of_yojson
      ~error_deserializer

  let request_with_metadata context (request : update_identity_provider_request) =
    let input = Json_serializers.update_identity_provider_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata
      ~shape_name:"AWSCognitoIdentityProviderService.UpdateIdentityProvider" ~service ~context
      ~input ~output_deserializer:Json_deserializers.update_identity_provider_response_of_yojson
      ~error_deserializer
end

module UpdateManagedLoginBranding = struct
  let error_to_string = function
    | `ConcurrentModificationException _ ->
        "com.amazonaws.cognitoidentityprovider#ConcurrentModificationException"
    | `InternalErrorException _ -> "com.amazonaws.cognitoidentityprovider#InternalErrorException"
    | `InvalidParameterException _ ->
        "com.amazonaws.cognitoidentityprovider#InvalidParameterException"
    | `NotAuthorizedException _ -> "com.amazonaws.cognitoidentityprovider#NotAuthorizedException"
    | `OperationNotEnabledException _ ->
        "com.amazonaws.cognitoidentityprovider#OperationNotEnabledException"
    | `ResourceNotFoundException _ ->
        "com.amazonaws.cognitoidentityprovider#ResourceNotFoundException"
    | `TooManyRequestsException _ ->
        "com.amazonaws.cognitoidentityprovider#TooManyRequestsException"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "ConcurrentModificationException" ->
          `ConcurrentModificationException
            (Json_deserializers.concurrent_modification_exception_of_yojson tree path)
      | _, "InternalErrorException" ->
          `InternalErrorException (Json_deserializers.internal_error_exception_of_yojson tree path)
      | _, "InvalidParameterException" ->
          `InvalidParameterException
            (Json_deserializers.invalid_parameter_exception_of_yojson tree path)
      | _, "NotAuthorizedException" ->
          `NotAuthorizedException (Json_deserializers.not_authorized_exception_of_yojson tree path)
      | _, "OperationNotEnabledException" ->
          `OperationNotEnabledException
            (Json_deserializers.operation_not_enabled_exception_of_yojson tree path)
      | _, "ResourceNotFoundException" ->
          `ResourceNotFoundException
            (Json_deserializers.resource_not_found_exception_of_yojson tree path)
      | _, "TooManyRequestsException" ->
          `TooManyRequestsException
            (Json_deserializers.too_many_requests_exception_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : update_managed_login_branding_request) =
    let input = Json_serializers.update_managed_login_branding_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request
      ~shape_name:"AWSCognitoIdentityProviderService.UpdateManagedLoginBranding" ~service ~context
      ~input
      ~output_deserializer:Json_deserializers.update_managed_login_branding_response_of_yojson
      ~error_deserializer

  let request_with_metadata context (request : update_managed_login_branding_request) =
    let input = Json_serializers.update_managed_login_branding_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata
      ~shape_name:"AWSCognitoIdentityProviderService.UpdateManagedLoginBranding" ~service ~context
      ~input
      ~output_deserializer:Json_deserializers.update_managed_login_branding_response_of_yojson
      ~error_deserializer
end

module UpdateProvisionedLimit = struct
  let error_to_string = function
    | `InternalErrorException _ -> "com.amazonaws.cognitoidentityprovider#InternalErrorException"
    | `InvalidParameterException _ ->
        "com.amazonaws.cognitoidentityprovider#InvalidParameterException"
    | `NotAuthorizedException _ -> "com.amazonaws.cognitoidentityprovider#NotAuthorizedException"
    | `ResourceNotFoundException _ ->
        "com.amazonaws.cognitoidentityprovider#ResourceNotFoundException"
    | `ServiceQuotaExceededException _ ->
        "com.amazonaws.cognitoidentityprovider#ServiceQuotaExceededException"
    | `TooManyRequestsException _ ->
        "com.amazonaws.cognitoidentityprovider#TooManyRequestsException"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "InternalErrorException" ->
          `InternalErrorException (Json_deserializers.internal_error_exception_of_yojson tree path)
      | _, "InvalidParameterException" ->
          `InvalidParameterException
            (Json_deserializers.invalid_parameter_exception_of_yojson tree path)
      | _, "NotAuthorizedException" ->
          `NotAuthorizedException (Json_deserializers.not_authorized_exception_of_yojson tree path)
      | _, "ResourceNotFoundException" ->
          `ResourceNotFoundException
            (Json_deserializers.resource_not_found_exception_of_yojson tree path)
      | _, "ServiceQuotaExceededException" ->
          `ServiceQuotaExceededException
            (Json_deserializers.service_quota_exceeded_exception_of_yojson tree path)
      | _, "TooManyRequestsException" ->
          `TooManyRequestsException
            (Json_deserializers.too_many_requests_exception_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : update_provisioned_limit_request) =
    let input = Json_serializers.update_provisioned_limit_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request
      ~shape_name:"AWSCognitoIdentityProviderService.UpdateProvisionedLimit" ~service ~context
      ~input ~output_deserializer:Json_deserializers.update_provisioned_limit_response_of_yojson
      ~error_deserializer

  let request_with_metadata context (request : update_provisioned_limit_request) =
    let input = Json_serializers.update_provisioned_limit_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata
      ~shape_name:"AWSCognitoIdentityProviderService.UpdateProvisionedLimit" ~service ~context
      ~input ~output_deserializer:Json_deserializers.update_provisioned_limit_response_of_yojson
      ~error_deserializer
end

module UpdateResourceServer = struct
  let error_to_string = function
    | `InternalErrorException _ -> "com.amazonaws.cognitoidentityprovider#InternalErrorException"
    | `InvalidParameterException _ ->
        "com.amazonaws.cognitoidentityprovider#InvalidParameterException"
    | `NotAuthorizedException _ -> "com.amazonaws.cognitoidentityprovider#NotAuthorizedException"
    | `OperationNotEnabledException _ ->
        "com.amazonaws.cognitoidentityprovider#OperationNotEnabledException"
    | `ResourceNotFoundException _ ->
        "com.amazonaws.cognitoidentityprovider#ResourceNotFoundException"
    | `TooManyRequestsException _ ->
        "com.amazonaws.cognitoidentityprovider#TooManyRequestsException"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "InternalErrorException" ->
          `InternalErrorException (Json_deserializers.internal_error_exception_of_yojson tree path)
      | _, "InvalidParameterException" ->
          `InvalidParameterException
            (Json_deserializers.invalid_parameter_exception_of_yojson tree path)
      | _, "NotAuthorizedException" ->
          `NotAuthorizedException (Json_deserializers.not_authorized_exception_of_yojson tree path)
      | _, "OperationNotEnabledException" ->
          `OperationNotEnabledException
            (Json_deserializers.operation_not_enabled_exception_of_yojson tree path)
      | _, "ResourceNotFoundException" ->
          `ResourceNotFoundException
            (Json_deserializers.resource_not_found_exception_of_yojson tree path)
      | _, "TooManyRequestsException" ->
          `TooManyRequestsException
            (Json_deserializers.too_many_requests_exception_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : update_resource_server_request) =
    let input = Json_serializers.update_resource_server_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request
      ~shape_name:"AWSCognitoIdentityProviderService.UpdateResourceServer" ~service ~context ~input
      ~output_deserializer:Json_deserializers.update_resource_server_response_of_yojson
      ~error_deserializer

  let request_with_metadata context (request : update_resource_server_request) =
    let input = Json_serializers.update_resource_server_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata
      ~shape_name:"AWSCognitoIdentityProviderService.UpdateResourceServer" ~service ~context ~input
      ~output_deserializer:Json_deserializers.update_resource_server_response_of_yojson
      ~error_deserializer
end

module UpdateTerms = struct
  let error_to_string = function
    | `ConcurrentModificationException _ ->
        "com.amazonaws.cognitoidentityprovider#ConcurrentModificationException"
    | `InternalErrorException _ -> "com.amazonaws.cognitoidentityprovider#InternalErrorException"
    | `InvalidParameterException _ ->
        "com.amazonaws.cognitoidentityprovider#InvalidParameterException"
    | `NotAuthorizedException _ -> "com.amazonaws.cognitoidentityprovider#NotAuthorizedException"
    | `OperationNotEnabledException _ ->
        "com.amazonaws.cognitoidentityprovider#OperationNotEnabledException"
    | `ResourceNotFoundException _ ->
        "com.amazonaws.cognitoidentityprovider#ResourceNotFoundException"
    | `TermsExistsException _ -> "com.amazonaws.cognitoidentityprovider#TermsExistsException"
    | `TooManyRequestsException _ ->
        "com.amazonaws.cognitoidentityprovider#TooManyRequestsException"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "ConcurrentModificationException" ->
          `ConcurrentModificationException
            (Json_deserializers.concurrent_modification_exception_of_yojson tree path)
      | _, "InternalErrorException" ->
          `InternalErrorException (Json_deserializers.internal_error_exception_of_yojson tree path)
      | _, "InvalidParameterException" ->
          `InvalidParameterException
            (Json_deserializers.invalid_parameter_exception_of_yojson tree path)
      | _, "NotAuthorizedException" ->
          `NotAuthorizedException (Json_deserializers.not_authorized_exception_of_yojson tree path)
      | _, "OperationNotEnabledException" ->
          `OperationNotEnabledException
            (Json_deserializers.operation_not_enabled_exception_of_yojson tree path)
      | _, "ResourceNotFoundException" ->
          `ResourceNotFoundException
            (Json_deserializers.resource_not_found_exception_of_yojson tree path)
      | _, "TermsExistsException" ->
          `TermsExistsException (Json_deserializers.terms_exists_exception_of_yojson tree path)
      | _, "TooManyRequestsException" ->
          `TooManyRequestsException
            (Json_deserializers.too_many_requests_exception_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : update_terms_request) =
    let input = Json_serializers.update_terms_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"AWSCognitoIdentityProviderService.UpdateTerms"
      ~service ~context ~input
      ~output_deserializer:Json_deserializers.update_terms_response_of_yojson ~error_deserializer

  let request_with_metadata context (request : update_terms_request) =
    let input = Json_serializers.update_terms_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata
      ~shape_name:"AWSCognitoIdentityProviderService.UpdateTerms" ~service ~context ~input
      ~output_deserializer:Json_deserializers.update_terms_response_of_yojson ~error_deserializer
end

module UpdateUserAttributes = struct
  let error_to_string = function
    | `AliasExistsException _ -> "com.amazonaws.cognitoidentityprovider#AliasExistsException"
    | `CodeDeliveryFailureException _ ->
        "com.amazonaws.cognitoidentityprovider#CodeDeliveryFailureException"
    | `CodeMismatchException _ -> "com.amazonaws.cognitoidentityprovider#CodeMismatchException"
    | `ExpiredCodeException _ -> "com.amazonaws.cognitoidentityprovider#ExpiredCodeException"
    | `ForbiddenException _ -> "com.amazonaws.cognitoidentityprovider#ForbiddenException"
    | `InternalErrorException _ -> "com.amazonaws.cognitoidentityprovider#InternalErrorException"
    | `InvalidEmailRoleAccessPolicyException _ ->
        "com.amazonaws.cognitoidentityprovider#InvalidEmailRoleAccessPolicyException"
    | `InvalidLambdaResponseException _ ->
        "com.amazonaws.cognitoidentityprovider#InvalidLambdaResponseException"
    | `InvalidParameterException _ ->
        "com.amazonaws.cognitoidentityprovider#InvalidParameterException"
    | `InvalidSmsRoleAccessPolicyException _ ->
        "com.amazonaws.cognitoidentityprovider#InvalidSmsRoleAccessPolicyException"
    | `InvalidSmsRoleTrustRelationshipException _ ->
        "com.amazonaws.cognitoidentityprovider#InvalidSmsRoleTrustRelationshipException"
    | `NotAuthorizedException _ -> "com.amazonaws.cognitoidentityprovider#NotAuthorizedException"
    | `OperationNotEnabledException _ ->
        "com.amazonaws.cognitoidentityprovider#OperationNotEnabledException"
    | `PasswordResetRequiredException _ ->
        "com.amazonaws.cognitoidentityprovider#PasswordResetRequiredException"
    | `ResourceNotFoundException _ ->
        "com.amazonaws.cognitoidentityprovider#ResourceNotFoundException"
    | `TooManyRequestsException _ ->
        "com.amazonaws.cognitoidentityprovider#TooManyRequestsException"
    | `UnexpectedLambdaException _ ->
        "com.amazonaws.cognitoidentityprovider#UnexpectedLambdaException"
    | `UserLambdaValidationException _ ->
        "com.amazonaws.cognitoidentityprovider#UserLambdaValidationException"
    | `UserNotConfirmedException _ ->
        "com.amazonaws.cognitoidentityprovider#UserNotConfirmedException"
    | `UserNotFoundException _ -> "com.amazonaws.cognitoidentityprovider#UserNotFoundException"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "AliasExistsException" ->
          `AliasExistsException (Json_deserializers.alias_exists_exception_of_yojson tree path)
      | _, "CodeDeliveryFailureException" ->
          `CodeDeliveryFailureException
            (Json_deserializers.code_delivery_failure_exception_of_yojson tree path)
      | _, "CodeMismatchException" ->
          `CodeMismatchException (Json_deserializers.code_mismatch_exception_of_yojson tree path)
      | _, "ExpiredCodeException" ->
          `ExpiredCodeException (Json_deserializers.expired_code_exception_of_yojson tree path)
      | _, "ForbiddenException" ->
          `ForbiddenException (Json_deserializers.forbidden_exception_of_yojson tree path)
      | _, "InternalErrorException" ->
          `InternalErrorException (Json_deserializers.internal_error_exception_of_yojson tree path)
      | _, "InvalidEmailRoleAccessPolicyException" ->
          `InvalidEmailRoleAccessPolicyException
            (Json_deserializers.invalid_email_role_access_policy_exception_of_yojson tree path)
      | _, "InvalidLambdaResponseException" ->
          `InvalidLambdaResponseException
            (Json_deserializers.invalid_lambda_response_exception_of_yojson tree path)
      | _, "InvalidParameterException" ->
          `InvalidParameterException
            (Json_deserializers.invalid_parameter_exception_of_yojson tree path)
      | _, "InvalidSmsRoleAccessPolicyException" ->
          `InvalidSmsRoleAccessPolicyException
            (Json_deserializers.invalid_sms_role_access_policy_exception_of_yojson tree path)
      | _, "InvalidSmsRoleTrustRelationshipException" ->
          `InvalidSmsRoleTrustRelationshipException
            (Json_deserializers.invalid_sms_role_trust_relationship_exception_of_yojson tree path)
      | _, "NotAuthorizedException" ->
          `NotAuthorizedException (Json_deserializers.not_authorized_exception_of_yojson tree path)
      | _, "OperationNotEnabledException" ->
          `OperationNotEnabledException
            (Json_deserializers.operation_not_enabled_exception_of_yojson tree path)
      | _, "PasswordResetRequiredException" ->
          `PasswordResetRequiredException
            (Json_deserializers.password_reset_required_exception_of_yojson tree path)
      | _, "ResourceNotFoundException" ->
          `ResourceNotFoundException
            (Json_deserializers.resource_not_found_exception_of_yojson tree path)
      | _, "TooManyRequestsException" ->
          `TooManyRequestsException
            (Json_deserializers.too_many_requests_exception_of_yojson tree path)
      | _, "UnexpectedLambdaException" ->
          `UnexpectedLambdaException
            (Json_deserializers.unexpected_lambda_exception_of_yojson tree path)
      | _, "UserLambdaValidationException" ->
          `UserLambdaValidationException
            (Json_deserializers.user_lambda_validation_exception_of_yojson tree path)
      | _, "UserNotConfirmedException" ->
          `UserNotConfirmedException
            (Json_deserializers.user_not_confirmed_exception_of_yojson tree path)
      | _, "UserNotFoundException" ->
          `UserNotFoundException (Json_deserializers.user_not_found_exception_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : update_user_attributes_request) =
    let input = Json_serializers.update_user_attributes_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request
      ~shape_name:"AWSCognitoIdentityProviderService.UpdateUserAttributes" ~service ~context ~input
      ~output_deserializer:Json_deserializers.update_user_attributes_response_of_yojson
      ~error_deserializer

  let request_with_metadata context (request : update_user_attributes_request) =
    let input = Json_serializers.update_user_attributes_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata
      ~shape_name:"AWSCognitoIdentityProviderService.UpdateUserAttributes" ~service ~context ~input
      ~output_deserializer:Json_deserializers.update_user_attributes_response_of_yojson
      ~error_deserializer
end

module UpdateUserPool = struct
  let error_to_string = function
    | `ConcurrentModificationException _ ->
        "com.amazonaws.cognitoidentityprovider#ConcurrentModificationException"
    | `FeatureUnavailableInTierException _ ->
        "com.amazonaws.cognitoidentityprovider#FeatureUnavailableInTierException"
    | `InternalErrorException _ -> "com.amazonaws.cognitoidentityprovider#InternalErrorException"
    | `InvalidEmailRoleAccessPolicyException _ ->
        "com.amazonaws.cognitoidentityprovider#InvalidEmailRoleAccessPolicyException"
    | `InvalidParameterException _ ->
        "com.amazonaws.cognitoidentityprovider#InvalidParameterException"
    | `InvalidSmsRoleAccessPolicyException _ ->
        "com.amazonaws.cognitoidentityprovider#InvalidSmsRoleAccessPolicyException"
    | `InvalidSmsRoleTrustRelationshipException _ ->
        "com.amazonaws.cognitoidentityprovider#InvalidSmsRoleTrustRelationshipException"
    | `NotAuthorizedException _ -> "com.amazonaws.cognitoidentityprovider#NotAuthorizedException"
    | `OperationNotEnabledException _ ->
        "com.amazonaws.cognitoidentityprovider#OperationNotEnabledException"
    | `ResourceNotFoundException _ ->
        "com.amazonaws.cognitoidentityprovider#ResourceNotFoundException"
    | `TierChangeNotAllowedException _ ->
        "com.amazonaws.cognitoidentityprovider#TierChangeNotAllowedException"
    | `TooManyRequestsException _ ->
        "com.amazonaws.cognitoidentityprovider#TooManyRequestsException"
    | `UserImportInProgressException _ ->
        "com.amazonaws.cognitoidentityprovider#UserImportInProgressException"
    | `UserPoolTaggingException _ ->
        "com.amazonaws.cognitoidentityprovider#UserPoolTaggingException"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "ConcurrentModificationException" ->
          `ConcurrentModificationException
            (Json_deserializers.concurrent_modification_exception_of_yojson tree path)
      | _, "FeatureUnavailableInTierException" ->
          `FeatureUnavailableInTierException
            (Json_deserializers.feature_unavailable_in_tier_exception_of_yojson tree path)
      | _, "InternalErrorException" ->
          `InternalErrorException (Json_deserializers.internal_error_exception_of_yojson tree path)
      | _, "InvalidEmailRoleAccessPolicyException" ->
          `InvalidEmailRoleAccessPolicyException
            (Json_deserializers.invalid_email_role_access_policy_exception_of_yojson tree path)
      | _, "InvalidParameterException" ->
          `InvalidParameterException
            (Json_deserializers.invalid_parameter_exception_of_yojson tree path)
      | _, "InvalidSmsRoleAccessPolicyException" ->
          `InvalidSmsRoleAccessPolicyException
            (Json_deserializers.invalid_sms_role_access_policy_exception_of_yojson tree path)
      | _, "InvalidSmsRoleTrustRelationshipException" ->
          `InvalidSmsRoleTrustRelationshipException
            (Json_deserializers.invalid_sms_role_trust_relationship_exception_of_yojson tree path)
      | _, "NotAuthorizedException" ->
          `NotAuthorizedException (Json_deserializers.not_authorized_exception_of_yojson tree path)
      | _, "OperationNotEnabledException" ->
          `OperationNotEnabledException
            (Json_deserializers.operation_not_enabled_exception_of_yojson tree path)
      | _, "ResourceNotFoundException" ->
          `ResourceNotFoundException
            (Json_deserializers.resource_not_found_exception_of_yojson tree path)
      | _, "TierChangeNotAllowedException" ->
          `TierChangeNotAllowedException
            (Json_deserializers.tier_change_not_allowed_exception_of_yojson tree path)
      | _, "TooManyRequestsException" ->
          `TooManyRequestsException
            (Json_deserializers.too_many_requests_exception_of_yojson tree path)
      | _, "UserImportInProgressException" ->
          `UserImportInProgressException
            (Json_deserializers.user_import_in_progress_exception_of_yojson tree path)
      | _, "UserPoolTaggingException" ->
          `UserPoolTaggingException
            (Json_deserializers.user_pool_tagging_exception_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : update_user_pool_request) =
    let input = Json_serializers.update_user_pool_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request
      ~shape_name:"AWSCognitoIdentityProviderService.UpdateUserPool" ~service ~context ~input
      ~output_deserializer:Json_deserializers.update_user_pool_response_of_yojson
      ~error_deserializer

  let request_with_metadata context (request : update_user_pool_request) =
    let input = Json_serializers.update_user_pool_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata
      ~shape_name:"AWSCognitoIdentityProviderService.UpdateUserPool" ~service ~context ~input
      ~output_deserializer:Json_deserializers.update_user_pool_response_of_yojson
      ~error_deserializer
end

module UpdateUserPoolClient = struct
  let error_to_string = function
    | `ConcurrentModificationException _ ->
        "com.amazonaws.cognitoidentityprovider#ConcurrentModificationException"
    | `FeatureUnavailableInTierException _ ->
        "com.amazonaws.cognitoidentityprovider#FeatureUnavailableInTierException"
    | `InternalErrorException _ -> "com.amazonaws.cognitoidentityprovider#InternalErrorException"
    | `InvalidOAuthFlowException _ ->
        "com.amazonaws.cognitoidentityprovider#InvalidOAuthFlowException"
    | `InvalidParameterException _ ->
        "com.amazonaws.cognitoidentityprovider#InvalidParameterException"
    | `NotAuthorizedException _ -> "com.amazonaws.cognitoidentityprovider#NotAuthorizedException"
    | `OperationNotEnabledException _ ->
        "com.amazonaws.cognitoidentityprovider#OperationNotEnabledException"
    | `ResourceNotFoundException _ ->
        "com.amazonaws.cognitoidentityprovider#ResourceNotFoundException"
    | `ScopeDoesNotExistException _ ->
        "com.amazonaws.cognitoidentityprovider#ScopeDoesNotExistException"
    | `TooManyRequestsException _ ->
        "com.amazonaws.cognitoidentityprovider#TooManyRequestsException"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "ConcurrentModificationException" ->
          `ConcurrentModificationException
            (Json_deserializers.concurrent_modification_exception_of_yojson tree path)
      | _, "FeatureUnavailableInTierException" ->
          `FeatureUnavailableInTierException
            (Json_deserializers.feature_unavailable_in_tier_exception_of_yojson tree path)
      | _, "InternalErrorException" ->
          `InternalErrorException (Json_deserializers.internal_error_exception_of_yojson tree path)
      | _, "InvalidOAuthFlowException" ->
          `InvalidOAuthFlowException
            (Json_deserializers.invalid_o_auth_flow_exception_of_yojson tree path)
      | _, "InvalidParameterException" ->
          `InvalidParameterException
            (Json_deserializers.invalid_parameter_exception_of_yojson tree path)
      | _, "NotAuthorizedException" ->
          `NotAuthorizedException (Json_deserializers.not_authorized_exception_of_yojson tree path)
      | _, "OperationNotEnabledException" ->
          `OperationNotEnabledException
            (Json_deserializers.operation_not_enabled_exception_of_yojson tree path)
      | _, "ResourceNotFoundException" ->
          `ResourceNotFoundException
            (Json_deserializers.resource_not_found_exception_of_yojson tree path)
      | _, "ScopeDoesNotExistException" ->
          `ScopeDoesNotExistException
            (Json_deserializers.scope_does_not_exist_exception_of_yojson tree path)
      | _, "TooManyRequestsException" ->
          `TooManyRequestsException
            (Json_deserializers.too_many_requests_exception_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : update_user_pool_client_request) =
    let input = Json_serializers.update_user_pool_client_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request
      ~shape_name:"AWSCognitoIdentityProviderService.UpdateUserPoolClient" ~service ~context ~input
      ~output_deserializer:Json_deserializers.update_user_pool_client_response_of_yojson
      ~error_deserializer

  let request_with_metadata context (request : update_user_pool_client_request) =
    let input = Json_serializers.update_user_pool_client_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata
      ~shape_name:"AWSCognitoIdentityProviderService.UpdateUserPoolClient" ~service ~context ~input
      ~output_deserializer:Json_deserializers.update_user_pool_client_response_of_yojson
      ~error_deserializer
end

module UpdateUserPoolDomain = struct
  let error_to_string = function
    | `ConcurrentModificationException _ ->
        "com.amazonaws.cognitoidentityprovider#ConcurrentModificationException"
    | `FeatureUnavailableInTierException _ ->
        "com.amazonaws.cognitoidentityprovider#FeatureUnavailableInTierException"
    | `InternalErrorException _ -> "com.amazonaws.cognitoidentityprovider#InternalErrorException"
    | `InvalidParameterException _ ->
        "com.amazonaws.cognitoidentityprovider#InvalidParameterException"
    | `NotAuthorizedException _ -> "com.amazonaws.cognitoidentityprovider#NotAuthorizedException"
    | `OperationNotEnabledException _ ->
        "com.amazonaws.cognitoidentityprovider#OperationNotEnabledException"
    | `ResourceNotFoundException _ ->
        "com.amazonaws.cognitoidentityprovider#ResourceNotFoundException"
    | `TooManyRequestsException _ ->
        "com.amazonaws.cognitoidentityprovider#TooManyRequestsException"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "ConcurrentModificationException" ->
          `ConcurrentModificationException
            (Json_deserializers.concurrent_modification_exception_of_yojson tree path)
      | _, "FeatureUnavailableInTierException" ->
          `FeatureUnavailableInTierException
            (Json_deserializers.feature_unavailable_in_tier_exception_of_yojson tree path)
      | _, "InternalErrorException" ->
          `InternalErrorException (Json_deserializers.internal_error_exception_of_yojson tree path)
      | _, "InvalidParameterException" ->
          `InvalidParameterException
            (Json_deserializers.invalid_parameter_exception_of_yojson tree path)
      | _, "NotAuthorizedException" ->
          `NotAuthorizedException (Json_deserializers.not_authorized_exception_of_yojson tree path)
      | _, "OperationNotEnabledException" ->
          `OperationNotEnabledException
            (Json_deserializers.operation_not_enabled_exception_of_yojson tree path)
      | _, "ResourceNotFoundException" ->
          `ResourceNotFoundException
            (Json_deserializers.resource_not_found_exception_of_yojson tree path)
      | _, "TooManyRequestsException" ->
          `TooManyRequestsException
            (Json_deserializers.too_many_requests_exception_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : update_user_pool_domain_request) =
    let input = Json_serializers.update_user_pool_domain_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request
      ~shape_name:"AWSCognitoIdentityProviderService.UpdateUserPoolDomain" ~service ~context ~input
      ~output_deserializer:Json_deserializers.update_user_pool_domain_response_of_yojson
      ~error_deserializer

  let request_with_metadata context (request : update_user_pool_domain_request) =
    let input = Json_serializers.update_user_pool_domain_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata
      ~shape_name:"AWSCognitoIdentityProviderService.UpdateUserPoolDomain" ~service ~context ~input
      ~output_deserializer:Json_deserializers.update_user_pool_domain_response_of_yojson
      ~error_deserializer
end

module UpdateUserPoolReplica = struct
  let error_to_string = function
    | `InternalErrorException _ -> "com.amazonaws.cognitoidentityprovider#InternalErrorException"
    | `InvalidParameterException _ ->
        "com.amazonaws.cognitoidentityprovider#InvalidParameterException"
    | `NotAuthorizedException _ -> "com.amazonaws.cognitoidentityprovider#NotAuthorizedException"
    | `OperationNotEnabledException _ ->
        "com.amazonaws.cognitoidentityprovider#OperationNotEnabledException"
    | `ResourceNotFoundException _ ->
        "com.amazonaws.cognitoidentityprovider#ResourceNotFoundException"
    | `TooManyRequestsException _ ->
        "com.amazonaws.cognitoidentityprovider#TooManyRequestsException"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "InternalErrorException" ->
          `InternalErrorException (Json_deserializers.internal_error_exception_of_yojson tree path)
      | _, "InvalidParameterException" ->
          `InvalidParameterException
            (Json_deserializers.invalid_parameter_exception_of_yojson tree path)
      | _, "NotAuthorizedException" ->
          `NotAuthorizedException (Json_deserializers.not_authorized_exception_of_yojson tree path)
      | _, "OperationNotEnabledException" ->
          `OperationNotEnabledException
            (Json_deserializers.operation_not_enabled_exception_of_yojson tree path)
      | _, "ResourceNotFoundException" ->
          `ResourceNotFoundException
            (Json_deserializers.resource_not_found_exception_of_yojson tree path)
      | _, "TooManyRequestsException" ->
          `TooManyRequestsException
            (Json_deserializers.too_many_requests_exception_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : update_user_pool_replica_request) =
    let input = Json_serializers.update_user_pool_replica_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request
      ~shape_name:"AWSCognitoIdentityProviderService.UpdateUserPoolReplica" ~service ~context ~input
      ~output_deserializer:Json_deserializers.update_user_pool_replica_response_of_yojson
      ~error_deserializer

  let request_with_metadata context (request : update_user_pool_replica_request) =
    let input = Json_serializers.update_user_pool_replica_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata
      ~shape_name:"AWSCognitoIdentityProviderService.UpdateUserPoolReplica" ~service ~context ~input
      ~output_deserializer:Json_deserializers.update_user_pool_replica_response_of_yojson
      ~error_deserializer
end

module VerifySoftwareToken = struct
  let error_to_string = function
    | `CodeMismatchException _ -> "com.amazonaws.cognitoidentityprovider#CodeMismatchException"
    | `EnableSoftwareTokenMFAException _ ->
        "com.amazonaws.cognitoidentityprovider#EnableSoftwareTokenMFAException"
    | `ForbiddenException _ -> "com.amazonaws.cognitoidentityprovider#ForbiddenException"
    | `InternalErrorException _ -> "com.amazonaws.cognitoidentityprovider#InternalErrorException"
    | `InvalidParameterException _ ->
        "com.amazonaws.cognitoidentityprovider#InvalidParameterException"
    | `InvalidUserPoolConfigurationException _ ->
        "com.amazonaws.cognitoidentityprovider#InvalidUserPoolConfigurationException"
    | `NotAuthorizedException _ -> "com.amazonaws.cognitoidentityprovider#NotAuthorizedException"
    | `OperationNotEnabledException _ ->
        "com.amazonaws.cognitoidentityprovider#OperationNotEnabledException"
    | `PasswordResetRequiredException _ ->
        "com.amazonaws.cognitoidentityprovider#PasswordResetRequiredException"
    | `ResourceNotFoundException _ ->
        "com.amazonaws.cognitoidentityprovider#ResourceNotFoundException"
    | `SoftwareTokenMFANotFoundException _ ->
        "com.amazonaws.cognitoidentityprovider#SoftwareTokenMFANotFoundException"
    | `TooManyRequestsException _ ->
        "com.amazonaws.cognitoidentityprovider#TooManyRequestsException"
    | `UserNotConfirmedException _ ->
        "com.amazonaws.cognitoidentityprovider#UserNotConfirmedException"
    | `UserNotFoundException _ -> "com.amazonaws.cognitoidentityprovider#UserNotFoundException"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "CodeMismatchException" ->
          `CodeMismatchException (Json_deserializers.code_mismatch_exception_of_yojson tree path)
      | _, "EnableSoftwareTokenMFAException" ->
          `EnableSoftwareTokenMFAException
            (Json_deserializers.enable_software_token_mfa_exception_of_yojson tree path)
      | _, "ForbiddenException" ->
          `ForbiddenException (Json_deserializers.forbidden_exception_of_yojson tree path)
      | _, "InternalErrorException" ->
          `InternalErrorException (Json_deserializers.internal_error_exception_of_yojson tree path)
      | _, "InvalidParameterException" ->
          `InvalidParameterException
            (Json_deserializers.invalid_parameter_exception_of_yojson tree path)
      | _, "InvalidUserPoolConfigurationException" ->
          `InvalidUserPoolConfigurationException
            (Json_deserializers.invalid_user_pool_configuration_exception_of_yojson tree path)
      | _, "NotAuthorizedException" ->
          `NotAuthorizedException (Json_deserializers.not_authorized_exception_of_yojson tree path)
      | _, "OperationNotEnabledException" ->
          `OperationNotEnabledException
            (Json_deserializers.operation_not_enabled_exception_of_yojson tree path)
      | _, "PasswordResetRequiredException" ->
          `PasswordResetRequiredException
            (Json_deserializers.password_reset_required_exception_of_yojson tree path)
      | _, "ResourceNotFoundException" ->
          `ResourceNotFoundException
            (Json_deserializers.resource_not_found_exception_of_yojson tree path)
      | _, "SoftwareTokenMFANotFoundException" ->
          `SoftwareTokenMFANotFoundException
            (Json_deserializers.software_token_mfa_not_found_exception_of_yojson tree path)
      | _, "TooManyRequestsException" ->
          `TooManyRequestsException
            (Json_deserializers.too_many_requests_exception_of_yojson tree path)
      | _, "UserNotConfirmedException" ->
          `UserNotConfirmedException
            (Json_deserializers.user_not_confirmed_exception_of_yojson tree path)
      | _, "UserNotFoundException" ->
          `UserNotFoundException (Json_deserializers.user_not_found_exception_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : verify_software_token_request) =
    let input = Json_serializers.verify_software_token_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request
      ~shape_name:"AWSCognitoIdentityProviderService.VerifySoftwareToken" ~service ~context ~input
      ~output_deserializer:Json_deserializers.verify_software_token_response_of_yojson
      ~error_deserializer

  let request_with_metadata context (request : verify_software_token_request) =
    let input = Json_serializers.verify_software_token_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata
      ~shape_name:"AWSCognitoIdentityProviderService.VerifySoftwareToken" ~service ~context ~input
      ~output_deserializer:Json_deserializers.verify_software_token_response_of_yojson
      ~error_deserializer
end

module VerifyUserAttribute = struct
  let error_to_string = function
    | `AliasExistsException _ -> "com.amazonaws.cognitoidentityprovider#AliasExistsException"
    | `CodeMismatchException _ -> "com.amazonaws.cognitoidentityprovider#CodeMismatchException"
    | `ExpiredCodeException _ -> "com.amazonaws.cognitoidentityprovider#ExpiredCodeException"
    | `ForbiddenException _ -> "com.amazonaws.cognitoidentityprovider#ForbiddenException"
    | `InternalErrorException _ -> "com.amazonaws.cognitoidentityprovider#InternalErrorException"
    | `InvalidParameterException _ ->
        "com.amazonaws.cognitoidentityprovider#InvalidParameterException"
    | `LimitExceededException _ -> "com.amazonaws.cognitoidentityprovider#LimitExceededException"
    | `NotAuthorizedException _ -> "com.amazonaws.cognitoidentityprovider#NotAuthorizedException"
    | `OperationNotEnabledException _ ->
        "com.amazonaws.cognitoidentityprovider#OperationNotEnabledException"
    | `PasswordResetRequiredException _ ->
        "com.amazonaws.cognitoidentityprovider#PasswordResetRequiredException"
    | `ResourceNotFoundException _ ->
        "com.amazonaws.cognitoidentityprovider#ResourceNotFoundException"
    | `TooManyRequestsException _ ->
        "com.amazonaws.cognitoidentityprovider#TooManyRequestsException"
    | `UserNotConfirmedException _ ->
        "com.amazonaws.cognitoidentityprovider#UserNotConfirmedException"
    | `UserNotFoundException _ -> "com.amazonaws.cognitoidentityprovider#UserNotFoundException"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "AliasExistsException" ->
          `AliasExistsException (Json_deserializers.alias_exists_exception_of_yojson tree path)
      | _, "CodeMismatchException" ->
          `CodeMismatchException (Json_deserializers.code_mismatch_exception_of_yojson tree path)
      | _, "ExpiredCodeException" ->
          `ExpiredCodeException (Json_deserializers.expired_code_exception_of_yojson tree path)
      | _, "ForbiddenException" ->
          `ForbiddenException (Json_deserializers.forbidden_exception_of_yojson tree path)
      | _, "InternalErrorException" ->
          `InternalErrorException (Json_deserializers.internal_error_exception_of_yojson tree path)
      | _, "InvalidParameterException" ->
          `InvalidParameterException
            (Json_deserializers.invalid_parameter_exception_of_yojson tree path)
      | _, "LimitExceededException" ->
          `LimitExceededException (Json_deserializers.limit_exceeded_exception_of_yojson tree path)
      | _, "NotAuthorizedException" ->
          `NotAuthorizedException (Json_deserializers.not_authorized_exception_of_yojson tree path)
      | _, "OperationNotEnabledException" ->
          `OperationNotEnabledException
            (Json_deserializers.operation_not_enabled_exception_of_yojson tree path)
      | _, "PasswordResetRequiredException" ->
          `PasswordResetRequiredException
            (Json_deserializers.password_reset_required_exception_of_yojson tree path)
      | _, "ResourceNotFoundException" ->
          `ResourceNotFoundException
            (Json_deserializers.resource_not_found_exception_of_yojson tree path)
      | _, "TooManyRequestsException" ->
          `TooManyRequestsException
            (Json_deserializers.too_many_requests_exception_of_yojson tree path)
      | _, "UserNotConfirmedException" ->
          `UserNotConfirmedException
            (Json_deserializers.user_not_confirmed_exception_of_yojson tree path)
      | _, "UserNotFoundException" ->
          `UserNotFoundException (Json_deserializers.user_not_found_exception_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : verify_user_attribute_request) =
    let input = Json_serializers.verify_user_attribute_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request
      ~shape_name:"AWSCognitoIdentityProviderService.VerifyUserAttribute" ~service ~context ~input
      ~output_deserializer:Json_deserializers.verify_user_attribute_response_of_yojson
      ~error_deserializer

  let request_with_metadata context (request : verify_user_attribute_request) =
    let input = Json_serializers.verify_user_attribute_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata
      ~shape_name:"AWSCognitoIdentityProviderService.VerifyUserAttribute" ~service ~context ~input
      ~output_deserializer:Json_deserializers.verify_user_attribute_response_of_yojson
      ~error_deserializer
end
