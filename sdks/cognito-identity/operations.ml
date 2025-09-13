open Types
open Service_metadata

module CreateIdentityPool = struct
  let error_to_string = function
    | `InternalErrorException _ -> "com.amazonaws.cognitoidentity#InternalErrorException"
    | `InvalidParameterException _ -> "com.amazonaws.cognitoidentity#InvalidParameterException"
    | `LimitExceededException _ -> "com.amazonaws.cognitoidentity#LimitExceededException"
    | `NotAuthorizedException _ -> "com.amazonaws.cognitoidentity#NotAuthorizedException"
    | `ResourceConflictException _ -> "com.amazonaws.cognitoidentity#ResourceConflictException"
    | `TooManyRequestsException _ -> "com.amazonaws.cognitoidentity#TooManyRequestsException"
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
      | _, "ResourceConflictException" ->
          `ResourceConflictException
            (Json_deserializers.resource_conflict_exception_of_yojson tree path)
      | _, "TooManyRequestsException" ->
          `TooManyRequestsException
            (Json_deserializers.too_many_requests_exception_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : create_identity_pool_input) =
    let input = Json_serializers.create_identity_pool_input_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"AWSCognitoIdentityService.CreateIdentityPool"
      ~service ~context ~input ~output_deserializer:Json_deserializers.identity_pool_of_yojson
      ~error_deserializer
end

module DeleteIdentities = struct
  let error_to_string = function
    | `InternalErrorException _ -> "com.amazonaws.cognitoidentity#InternalErrorException"
    | `InvalidParameterException _ -> "com.amazonaws.cognitoidentity#InvalidParameterException"
    | `TooManyRequestsException _ -> "com.amazonaws.cognitoidentity#TooManyRequestsException"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "InternalErrorException" ->
          `InternalErrorException (Json_deserializers.internal_error_exception_of_yojson tree path)
      | _, "InvalidParameterException" ->
          `InvalidParameterException
            (Json_deserializers.invalid_parameter_exception_of_yojson tree path)
      | _, "TooManyRequestsException" ->
          `TooManyRequestsException
            (Json_deserializers.too_many_requests_exception_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : delete_identities_input) =
    let input = Json_serializers.delete_identities_input_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"AWSCognitoIdentityService.DeleteIdentities"
      ~service ~context ~input
      ~output_deserializer:Json_deserializers.delete_identities_response_of_yojson
      ~error_deserializer
end

module DeleteIdentityPool = struct
  let error_to_string = function
    | `InternalErrorException _ -> "com.amazonaws.cognitoidentity#InternalErrorException"
    | `InvalidParameterException _ -> "com.amazonaws.cognitoidentity#InvalidParameterException"
    | `NotAuthorizedException _ -> "com.amazonaws.cognitoidentity#NotAuthorizedException"
    | `ResourceNotFoundException _ -> "com.amazonaws.cognitoidentity#ResourceNotFoundException"
    | `TooManyRequestsException _ -> "com.amazonaws.cognitoidentity#TooManyRequestsException"
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

  let request context (request : delete_identity_pool_input) =
    let input = Json_serializers.delete_identity_pool_input_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"AWSCognitoIdentityService.DeleteIdentityPool"
      ~service ~context ~input
      ~output_deserializer:Smaws_Lib.Smithy_api.Json_deserializers.unit__of_yojson
      ~error_deserializer
end

module DescribeIdentity = struct
  let error_to_string = function
    | `InternalErrorException _ -> "com.amazonaws.cognitoidentity#InternalErrorException"
    | `InvalidParameterException _ -> "com.amazonaws.cognitoidentity#InvalidParameterException"
    | `NotAuthorizedException _ -> "com.amazonaws.cognitoidentity#NotAuthorizedException"
    | `ResourceNotFoundException _ -> "com.amazonaws.cognitoidentity#ResourceNotFoundException"
    | `TooManyRequestsException _ -> "com.amazonaws.cognitoidentity#TooManyRequestsException"
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

  let request context (request : describe_identity_input) =
    let input = Json_serializers.describe_identity_input_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"AWSCognitoIdentityService.DescribeIdentity"
      ~service ~context ~input
      ~output_deserializer:Json_deserializers.identity_description_of_yojson ~error_deserializer
end

module DescribeIdentityPool = struct
  let error_to_string = function
    | `InternalErrorException _ -> "com.amazonaws.cognitoidentity#InternalErrorException"
    | `InvalidParameterException _ -> "com.amazonaws.cognitoidentity#InvalidParameterException"
    | `NotAuthorizedException _ -> "com.amazonaws.cognitoidentity#NotAuthorizedException"
    | `ResourceNotFoundException _ -> "com.amazonaws.cognitoidentity#ResourceNotFoundException"
    | `TooManyRequestsException _ -> "com.amazonaws.cognitoidentity#TooManyRequestsException"
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

  let request context (request : describe_identity_pool_input) =
    let input = Json_serializers.describe_identity_pool_input_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"AWSCognitoIdentityService.DescribeIdentityPool"
      ~service ~context ~input ~output_deserializer:Json_deserializers.identity_pool_of_yojson
      ~error_deserializer
end

module GetCredentialsForIdentity = struct
  let error_to_string = function
    | `ExternalServiceException _ -> "com.amazonaws.cognitoidentity#ExternalServiceException"
    | `InternalErrorException _ -> "com.amazonaws.cognitoidentity#InternalErrorException"
    | `InvalidIdentityPoolConfigurationException _ ->
        "com.amazonaws.cognitoidentity#InvalidIdentityPoolConfigurationException"
    | `InvalidParameterException _ -> "com.amazonaws.cognitoidentity#InvalidParameterException"
    | `NotAuthorizedException _ -> "com.amazonaws.cognitoidentity#NotAuthorizedException"
    | `ResourceConflictException _ -> "com.amazonaws.cognitoidentity#ResourceConflictException"
    | `ResourceNotFoundException _ -> "com.amazonaws.cognitoidentity#ResourceNotFoundException"
    | `TooManyRequestsException _ -> "com.amazonaws.cognitoidentity#TooManyRequestsException"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "ExternalServiceException" ->
          `ExternalServiceException
            (Json_deserializers.external_service_exception_of_yojson tree path)
      | _, "InternalErrorException" ->
          `InternalErrorException (Json_deserializers.internal_error_exception_of_yojson tree path)
      | _, "InvalidIdentityPoolConfigurationException" ->
          `InvalidIdentityPoolConfigurationException
            (Json_deserializers.invalid_identity_pool_configuration_exception_of_yojson tree path)
      | _, "InvalidParameterException" ->
          `InvalidParameterException
            (Json_deserializers.invalid_parameter_exception_of_yojson tree path)
      | _, "NotAuthorizedException" ->
          `NotAuthorizedException (Json_deserializers.not_authorized_exception_of_yojson tree path)
      | _, "ResourceConflictException" ->
          `ResourceConflictException
            (Json_deserializers.resource_conflict_exception_of_yojson tree path)
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

  let request context (request : get_credentials_for_identity_input) =
    let input = Json_serializers.get_credentials_for_identity_input_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request
      ~shape_name:"AWSCognitoIdentityService.GetCredentialsForIdentity" ~service ~context ~input
      ~output_deserializer:Json_deserializers.get_credentials_for_identity_response_of_yojson
      ~error_deserializer
end

module GetId = struct
  let error_to_string = function
    | `ExternalServiceException _ -> "com.amazonaws.cognitoidentity#ExternalServiceException"
    | `InternalErrorException _ -> "com.amazonaws.cognitoidentity#InternalErrorException"
    | `InvalidParameterException _ -> "com.amazonaws.cognitoidentity#InvalidParameterException"
    | `LimitExceededException _ -> "com.amazonaws.cognitoidentity#LimitExceededException"
    | `NotAuthorizedException _ -> "com.amazonaws.cognitoidentity#NotAuthorizedException"
    | `ResourceConflictException _ -> "com.amazonaws.cognitoidentity#ResourceConflictException"
    | `ResourceNotFoundException _ -> "com.amazonaws.cognitoidentity#ResourceNotFoundException"
    | `TooManyRequestsException _ -> "com.amazonaws.cognitoidentity#TooManyRequestsException"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "ExternalServiceException" ->
          `ExternalServiceException
            (Json_deserializers.external_service_exception_of_yojson tree path)
      | _, "InternalErrorException" ->
          `InternalErrorException (Json_deserializers.internal_error_exception_of_yojson tree path)
      | _, "InvalidParameterException" ->
          `InvalidParameterException
            (Json_deserializers.invalid_parameter_exception_of_yojson tree path)
      | _, "LimitExceededException" ->
          `LimitExceededException (Json_deserializers.limit_exceeded_exception_of_yojson tree path)
      | _, "NotAuthorizedException" ->
          `NotAuthorizedException (Json_deserializers.not_authorized_exception_of_yojson tree path)
      | _, "ResourceConflictException" ->
          `ResourceConflictException
            (Json_deserializers.resource_conflict_exception_of_yojson tree path)
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

  let request context (request : get_id_input) =
    let input = Json_serializers.get_id_input_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"AWSCognitoIdentityService.GetId" ~service
      ~context ~input ~output_deserializer:Json_deserializers.get_id_response_of_yojson
      ~error_deserializer
end

module GetIdentityPoolRoles = struct
  let error_to_string = function
    | `InternalErrorException _ -> "com.amazonaws.cognitoidentity#InternalErrorException"
    | `InvalidParameterException _ -> "com.amazonaws.cognitoidentity#InvalidParameterException"
    | `NotAuthorizedException _ -> "com.amazonaws.cognitoidentity#NotAuthorizedException"
    | `ResourceConflictException _ -> "com.amazonaws.cognitoidentity#ResourceConflictException"
    | `ResourceNotFoundException _ -> "com.amazonaws.cognitoidentity#ResourceNotFoundException"
    | `TooManyRequestsException _ -> "com.amazonaws.cognitoidentity#TooManyRequestsException"
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
      | _, "ResourceConflictException" ->
          `ResourceConflictException
            (Json_deserializers.resource_conflict_exception_of_yojson tree path)
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

  let request context (request : get_identity_pool_roles_input) =
    let input = Json_serializers.get_identity_pool_roles_input_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"AWSCognitoIdentityService.GetIdentityPoolRoles"
      ~service ~context ~input
      ~output_deserializer:Json_deserializers.get_identity_pool_roles_response_of_yojson
      ~error_deserializer
end

module GetOpenIdToken = struct
  let error_to_string = function
    | `ExternalServiceException _ -> "com.amazonaws.cognitoidentity#ExternalServiceException"
    | `InternalErrorException _ -> "com.amazonaws.cognitoidentity#InternalErrorException"
    | `InvalidParameterException _ -> "com.amazonaws.cognitoidentity#InvalidParameterException"
    | `NotAuthorizedException _ -> "com.amazonaws.cognitoidentity#NotAuthorizedException"
    | `ResourceConflictException _ -> "com.amazonaws.cognitoidentity#ResourceConflictException"
    | `ResourceNotFoundException _ -> "com.amazonaws.cognitoidentity#ResourceNotFoundException"
    | `TooManyRequestsException _ -> "com.amazonaws.cognitoidentity#TooManyRequestsException"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "ExternalServiceException" ->
          `ExternalServiceException
            (Json_deserializers.external_service_exception_of_yojson tree path)
      | _, "InternalErrorException" ->
          `InternalErrorException (Json_deserializers.internal_error_exception_of_yojson tree path)
      | _, "InvalidParameterException" ->
          `InvalidParameterException
            (Json_deserializers.invalid_parameter_exception_of_yojson tree path)
      | _, "NotAuthorizedException" ->
          `NotAuthorizedException (Json_deserializers.not_authorized_exception_of_yojson tree path)
      | _, "ResourceConflictException" ->
          `ResourceConflictException
            (Json_deserializers.resource_conflict_exception_of_yojson tree path)
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

  let request context (request : get_open_id_token_input) =
    let input = Json_serializers.get_open_id_token_input_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"AWSCognitoIdentityService.GetOpenIdToken"
      ~service ~context ~input
      ~output_deserializer:Json_deserializers.get_open_id_token_response_of_yojson
      ~error_deserializer
end

module GetOpenIdTokenForDeveloperIdentity = struct
  let error_to_string = function
    | `DeveloperUserAlreadyRegisteredException _ ->
        "com.amazonaws.cognitoidentity#DeveloperUserAlreadyRegisteredException"
    | `InternalErrorException _ -> "com.amazonaws.cognitoidentity#InternalErrorException"
    | `InvalidParameterException _ -> "com.amazonaws.cognitoidentity#InvalidParameterException"
    | `NotAuthorizedException _ -> "com.amazonaws.cognitoidentity#NotAuthorizedException"
    | `ResourceConflictException _ -> "com.amazonaws.cognitoidentity#ResourceConflictException"
    | `ResourceNotFoundException _ -> "com.amazonaws.cognitoidentity#ResourceNotFoundException"
    | `TooManyRequestsException _ -> "com.amazonaws.cognitoidentity#TooManyRequestsException"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "DeveloperUserAlreadyRegisteredException" ->
          `DeveloperUserAlreadyRegisteredException
            (Json_deserializers.developer_user_already_registered_exception_of_yojson tree path)
      | _, "InternalErrorException" ->
          `InternalErrorException (Json_deserializers.internal_error_exception_of_yojson tree path)
      | _, "InvalidParameterException" ->
          `InvalidParameterException
            (Json_deserializers.invalid_parameter_exception_of_yojson tree path)
      | _, "NotAuthorizedException" ->
          `NotAuthorizedException (Json_deserializers.not_authorized_exception_of_yojson tree path)
      | _, "ResourceConflictException" ->
          `ResourceConflictException
            (Json_deserializers.resource_conflict_exception_of_yojson tree path)
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

  let request context (request : get_open_id_token_for_developer_identity_input) =
    let input = Json_serializers.get_open_id_token_for_developer_identity_input_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request
      ~shape_name:"AWSCognitoIdentityService.GetOpenIdTokenForDeveloperIdentity" ~service ~context
      ~input
      ~output_deserializer:
        Json_deserializers.get_open_id_token_for_developer_identity_response_of_yojson
      ~error_deserializer
end

module GetPrincipalTagAttributeMap = struct
  let error_to_string = function
    | `InternalErrorException _ -> "com.amazonaws.cognitoidentity#InternalErrorException"
    | `InvalidParameterException _ -> "com.amazonaws.cognitoidentity#InvalidParameterException"
    | `NotAuthorizedException _ -> "com.amazonaws.cognitoidentity#NotAuthorizedException"
    | `ResourceNotFoundException _ -> "com.amazonaws.cognitoidentity#ResourceNotFoundException"
    | `TooManyRequestsException _ -> "com.amazonaws.cognitoidentity#TooManyRequestsException"
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

  let request context (request : get_principal_tag_attribute_map_input) =
    let input = Json_serializers.get_principal_tag_attribute_map_input_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request
      ~shape_name:"AWSCognitoIdentityService.GetPrincipalTagAttributeMap" ~service ~context ~input
      ~output_deserializer:Json_deserializers.get_principal_tag_attribute_map_response_of_yojson
      ~error_deserializer
end

module ListIdentities = struct
  let error_to_string = function
    | `InternalErrorException _ -> "com.amazonaws.cognitoidentity#InternalErrorException"
    | `InvalidParameterException _ -> "com.amazonaws.cognitoidentity#InvalidParameterException"
    | `NotAuthorizedException _ -> "com.amazonaws.cognitoidentity#NotAuthorizedException"
    | `ResourceNotFoundException _ -> "com.amazonaws.cognitoidentity#ResourceNotFoundException"
    | `TooManyRequestsException _ -> "com.amazonaws.cognitoidentity#TooManyRequestsException"
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

  let request context (request : list_identities_input) =
    let input = Json_serializers.list_identities_input_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"AWSCognitoIdentityService.ListIdentities"
      ~service ~context ~input
      ~output_deserializer:Json_deserializers.list_identities_response_of_yojson ~error_deserializer
end

module ListIdentityPools = struct
  let error_to_string = function
    | `InternalErrorException _ -> "com.amazonaws.cognitoidentity#InternalErrorException"
    | `InvalidParameterException _ -> "com.amazonaws.cognitoidentity#InvalidParameterException"
    | `NotAuthorizedException _ -> "com.amazonaws.cognitoidentity#NotAuthorizedException"
    | `ResourceNotFoundException _ -> "com.amazonaws.cognitoidentity#ResourceNotFoundException"
    | `TooManyRequestsException _ -> "com.amazonaws.cognitoidentity#TooManyRequestsException"
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

  let request context (request : list_identity_pools_input) =
    let input = Json_serializers.list_identity_pools_input_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"AWSCognitoIdentityService.ListIdentityPools"
      ~service ~context ~input
      ~output_deserializer:Json_deserializers.list_identity_pools_response_of_yojson
      ~error_deserializer
end

module ListTagsForResource = struct
  let error_to_string = function
    | `InternalErrorException _ -> "com.amazonaws.cognitoidentity#InternalErrorException"
    | `InvalidParameterException _ -> "com.amazonaws.cognitoidentity#InvalidParameterException"
    | `NotAuthorizedException _ -> "com.amazonaws.cognitoidentity#NotAuthorizedException"
    | `ResourceNotFoundException _ -> "com.amazonaws.cognitoidentity#ResourceNotFoundException"
    | `TooManyRequestsException _ -> "com.amazonaws.cognitoidentity#TooManyRequestsException"
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

  let request context (request : list_tags_for_resource_input) =
    let input = Json_serializers.list_tags_for_resource_input_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"AWSCognitoIdentityService.ListTagsForResource"
      ~service ~context ~input
      ~output_deserializer:Json_deserializers.list_tags_for_resource_response_of_yojson
      ~error_deserializer
end

module LookupDeveloperIdentity = struct
  let error_to_string = function
    | `InternalErrorException _ -> "com.amazonaws.cognitoidentity#InternalErrorException"
    | `InvalidParameterException _ -> "com.amazonaws.cognitoidentity#InvalidParameterException"
    | `NotAuthorizedException _ -> "com.amazonaws.cognitoidentity#NotAuthorizedException"
    | `ResourceConflictException _ -> "com.amazonaws.cognitoidentity#ResourceConflictException"
    | `ResourceNotFoundException _ -> "com.amazonaws.cognitoidentity#ResourceNotFoundException"
    | `TooManyRequestsException _ -> "com.amazonaws.cognitoidentity#TooManyRequestsException"
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
      | _, "ResourceConflictException" ->
          `ResourceConflictException
            (Json_deserializers.resource_conflict_exception_of_yojson tree path)
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

  let request context (request : lookup_developer_identity_input) =
    let input = Json_serializers.lookup_developer_identity_input_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request
      ~shape_name:"AWSCognitoIdentityService.LookupDeveloperIdentity" ~service ~context ~input
      ~output_deserializer:Json_deserializers.lookup_developer_identity_response_of_yojson
      ~error_deserializer
end

module MergeDeveloperIdentities = struct
  let error_to_string = function
    | `InternalErrorException _ -> "com.amazonaws.cognitoidentity#InternalErrorException"
    | `InvalidParameterException _ -> "com.amazonaws.cognitoidentity#InvalidParameterException"
    | `NotAuthorizedException _ -> "com.amazonaws.cognitoidentity#NotAuthorizedException"
    | `ResourceConflictException _ -> "com.amazonaws.cognitoidentity#ResourceConflictException"
    | `ResourceNotFoundException _ -> "com.amazonaws.cognitoidentity#ResourceNotFoundException"
    | `TooManyRequestsException _ -> "com.amazonaws.cognitoidentity#TooManyRequestsException"
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
      | _, "ResourceConflictException" ->
          `ResourceConflictException
            (Json_deserializers.resource_conflict_exception_of_yojson tree path)
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

  let request context (request : merge_developer_identities_input) =
    let input = Json_serializers.merge_developer_identities_input_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request
      ~shape_name:"AWSCognitoIdentityService.MergeDeveloperIdentities" ~service ~context ~input
      ~output_deserializer:Json_deserializers.merge_developer_identities_response_of_yojson
      ~error_deserializer
end

module SetIdentityPoolRoles = struct
  let error_to_string = function
    | `ConcurrentModificationException _ ->
        "com.amazonaws.cognitoidentity#ConcurrentModificationException"
    | `InternalErrorException _ -> "com.amazonaws.cognitoidentity#InternalErrorException"
    | `InvalidParameterException _ -> "com.amazonaws.cognitoidentity#InvalidParameterException"
    | `NotAuthorizedException _ -> "com.amazonaws.cognitoidentity#NotAuthorizedException"
    | `ResourceConflictException _ -> "com.amazonaws.cognitoidentity#ResourceConflictException"
    | `ResourceNotFoundException _ -> "com.amazonaws.cognitoidentity#ResourceNotFoundException"
    | `TooManyRequestsException _ -> "com.amazonaws.cognitoidentity#TooManyRequestsException"
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
      | _, "ResourceConflictException" ->
          `ResourceConflictException
            (Json_deserializers.resource_conflict_exception_of_yojson tree path)
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

  let request context (request : set_identity_pool_roles_input) =
    let input = Json_serializers.set_identity_pool_roles_input_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"AWSCognitoIdentityService.SetIdentityPoolRoles"
      ~service ~context ~input
      ~output_deserializer:Smaws_Lib.Smithy_api.Json_deserializers.unit__of_yojson
      ~error_deserializer
end

module SetPrincipalTagAttributeMap = struct
  let error_to_string = function
    | `InternalErrorException _ -> "com.amazonaws.cognitoidentity#InternalErrorException"
    | `InvalidParameterException _ -> "com.amazonaws.cognitoidentity#InvalidParameterException"
    | `NotAuthorizedException _ -> "com.amazonaws.cognitoidentity#NotAuthorizedException"
    | `ResourceNotFoundException _ -> "com.amazonaws.cognitoidentity#ResourceNotFoundException"
    | `TooManyRequestsException _ -> "com.amazonaws.cognitoidentity#TooManyRequestsException"
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

  let request context (request : set_principal_tag_attribute_map_input) =
    let input = Json_serializers.set_principal_tag_attribute_map_input_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request
      ~shape_name:"AWSCognitoIdentityService.SetPrincipalTagAttributeMap" ~service ~context ~input
      ~output_deserializer:Json_deserializers.set_principal_tag_attribute_map_response_of_yojson
      ~error_deserializer
end

module TagResource = struct
  let error_to_string = function
    | `InternalErrorException _ -> "com.amazonaws.cognitoidentity#InternalErrorException"
    | `InvalidParameterException _ -> "com.amazonaws.cognitoidentity#InvalidParameterException"
    | `NotAuthorizedException _ -> "com.amazonaws.cognitoidentity#NotAuthorizedException"
    | `ResourceNotFoundException _ -> "com.amazonaws.cognitoidentity#ResourceNotFoundException"
    | `TooManyRequestsException _ -> "com.amazonaws.cognitoidentity#TooManyRequestsException"
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

  let request context (request : tag_resource_input) =
    let input = Json_serializers.tag_resource_input_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"AWSCognitoIdentityService.TagResource" ~service
      ~context ~input ~output_deserializer:Json_deserializers.tag_resource_response_of_yojson
      ~error_deserializer
end

module UnlinkDeveloperIdentity = struct
  let error_to_string = function
    | `InternalErrorException _ -> "com.amazonaws.cognitoidentity#InternalErrorException"
    | `InvalidParameterException _ -> "com.amazonaws.cognitoidentity#InvalidParameterException"
    | `NotAuthorizedException _ -> "com.amazonaws.cognitoidentity#NotAuthorizedException"
    | `ResourceConflictException _ -> "com.amazonaws.cognitoidentity#ResourceConflictException"
    | `ResourceNotFoundException _ -> "com.amazonaws.cognitoidentity#ResourceNotFoundException"
    | `TooManyRequestsException _ -> "com.amazonaws.cognitoidentity#TooManyRequestsException"
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
      | _, "ResourceConflictException" ->
          `ResourceConflictException
            (Json_deserializers.resource_conflict_exception_of_yojson tree path)
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

  let request context (request : unlink_developer_identity_input) =
    let input = Json_serializers.unlink_developer_identity_input_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request
      ~shape_name:"AWSCognitoIdentityService.UnlinkDeveloperIdentity" ~service ~context ~input
      ~output_deserializer:Smaws_Lib.Smithy_api.Json_deserializers.unit__of_yojson
      ~error_deserializer
end

module UnlinkIdentity = struct
  let error_to_string = function
    | `ExternalServiceException _ -> "com.amazonaws.cognitoidentity#ExternalServiceException"
    | `InternalErrorException _ -> "com.amazonaws.cognitoidentity#InternalErrorException"
    | `InvalidParameterException _ -> "com.amazonaws.cognitoidentity#InvalidParameterException"
    | `NotAuthorizedException _ -> "com.amazonaws.cognitoidentity#NotAuthorizedException"
    | `ResourceConflictException _ -> "com.amazonaws.cognitoidentity#ResourceConflictException"
    | `ResourceNotFoundException _ -> "com.amazonaws.cognitoidentity#ResourceNotFoundException"
    | `TooManyRequestsException _ -> "com.amazonaws.cognitoidentity#TooManyRequestsException"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "ExternalServiceException" ->
          `ExternalServiceException
            (Json_deserializers.external_service_exception_of_yojson tree path)
      | _, "InternalErrorException" ->
          `InternalErrorException (Json_deserializers.internal_error_exception_of_yojson tree path)
      | _, "InvalidParameterException" ->
          `InvalidParameterException
            (Json_deserializers.invalid_parameter_exception_of_yojson tree path)
      | _, "NotAuthorizedException" ->
          `NotAuthorizedException (Json_deserializers.not_authorized_exception_of_yojson tree path)
      | _, "ResourceConflictException" ->
          `ResourceConflictException
            (Json_deserializers.resource_conflict_exception_of_yojson tree path)
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

  let request context (request : unlink_identity_input) =
    let input = Json_serializers.unlink_identity_input_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"AWSCognitoIdentityService.UnlinkIdentity"
      ~service ~context ~input
      ~output_deserializer:Smaws_Lib.Smithy_api.Json_deserializers.unit__of_yojson
      ~error_deserializer
end

module UntagResource = struct
  let error_to_string = function
    | `InternalErrorException _ -> "com.amazonaws.cognitoidentity#InternalErrorException"
    | `InvalidParameterException _ -> "com.amazonaws.cognitoidentity#InvalidParameterException"
    | `NotAuthorizedException _ -> "com.amazonaws.cognitoidentity#NotAuthorizedException"
    | `ResourceNotFoundException _ -> "com.amazonaws.cognitoidentity#ResourceNotFoundException"
    | `TooManyRequestsException _ -> "com.amazonaws.cognitoidentity#TooManyRequestsException"
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

  let request context (request : untag_resource_input) =
    let input = Json_serializers.untag_resource_input_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"AWSCognitoIdentityService.UntagResource"
      ~service ~context ~input
      ~output_deserializer:Json_deserializers.untag_resource_response_of_yojson ~error_deserializer
end

module UpdateIdentityPool = struct
  let error_to_string = function
    | `ConcurrentModificationException _ ->
        "com.amazonaws.cognitoidentity#ConcurrentModificationException"
    | `InternalErrorException _ -> "com.amazonaws.cognitoidentity#InternalErrorException"
    | `InvalidParameterException _ -> "com.amazonaws.cognitoidentity#InvalidParameterException"
    | `LimitExceededException _ -> "com.amazonaws.cognitoidentity#LimitExceededException"
    | `NotAuthorizedException _ -> "com.amazonaws.cognitoidentity#NotAuthorizedException"
    | `ResourceConflictException _ -> "com.amazonaws.cognitoidentity#ResourceConflictException"
    | `ResourceNotFoundException _ -> "com.amazonaws.cognitoidentity#ResourceNotFoundException"
    | `TooManyRequestsException _ -> "com.amazonaws.cognitoidentity#TooManyRequestsException"
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
      | _, "ResourceConflictException" ->
          `ResourceConflictException
            (Json_deserializers.resource_conflict_exception_of_yojson tree path)
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

  let request context (request : identity_pool) =
    let input = Json_serializers.identity_pool_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"AWSCognitoIdentityService.UpdateIdentityPool"
      ~service ~context ~input ~output_deserializer:Json_deserializers.identity_pool_of_yojson
      ~error_deserializer
end
