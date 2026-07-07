open Types
open Service_metadata

module BatchGetSecretValue = struct
  let error_to_string = function
    | `DecryptionFailure _ -> "com.amazonaws.secretsmanager#DecryptionFailure"
    | `InternalServiceError _ -> "com.amazonaws.secretsmanager#InternalServiceError"
    | `InvalidNextTokenException _ -> "com.amazonaws.secretsmanager#InvalidNextTokenException"
    | `InvalidParameterException _ -> "com.amazonaws.secretsmanager#InvalidParameterException"
    | `InvalidRequestException _ -> "com.amazonaws.secretsmanager#InvalidRequestException"
    | `ResourceNotFoundException _ -> "com.amazonaws.secretsmanager#ResourceNotFoundException"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "DecryptionFailure" ->
          `DecryptionFailure (Json_deserializers.decryption_failure_of_yojson tree path)
      | _, "InternalServiceError" ->
          `InternalServiceError (Json_deserializers.internal_service_error_of_yojson tree path)
      | _, "InvalidNextTokenException" ->
          `InvalidNextTokenException
            (Json_deserializers.invalid_next_token_exception_of_yojson tree path)
      | _, "InvalidParameterException" ->
          `InvalidParameterException
            (Json_deserializers.invalid_parameter_exception_of_yojson tree path)
      | _, "InvalidRequestException" ->
          `InvalidRequestException
            (Json_deserializers.invalid_request_exception_of_yojson tree path)
      | _, "ResourceNotFoundException" ->
          `ResourceNotFoundException
            (Json_deserializers.resource_not_found_exception_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : batch_get_secret_value_request) =
    let input = Json_serializers.batch_get_secret_value_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"secretsmanager.BatchGetSecretValue" ~service
      ~context ~input
      ~output_deserializer:Json_deserializers.batch_get_secret_value_response_of_yojson
      ~error_deserializer

  let request_with_metadata context (request : batch_get_secret_value_request) =
    let input = Json_serializers.batch_get_secret_value_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata
      ~shape_name:"secretsmanager.BatchGetSecretValue" ~service ~context ~input
      ~output_deserializer:Json_deserializers.batch_get_secret_value_response_of_yojson
      ~error_deserializer
end

module CancelRotateSecret = struct
  let error_to_string = function
    | `InternalServiceError _ -> "com.amazonaws.secretsmanager#InternalServiceError"
    | `InvalidParameterException _ -> "com.amazonaws.secretsmanager#InvalidParameterException"
    | `InvalidRequestException _ -> "com.amazonaws.secretsmanager#InvalidRequestException"
    | `ResourceNotFoundException _ -> "com.amazonaws.secretsmanager#ResourceNotFoundException"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "InternalServiceError" ->
          `InternalServiceError (Json_deserializers.internal_service_error_of_yojson tree path)
      | _, "InvalidParameterException" ->
          `InvalidParameterException
            (Json_deserializers.invalid_parameter_exception_of_yojson tree path)
      | _, "InvalidRequestException" ->
          `InvalidRequestException
            (Json_deserializers.invalid_request_exception_of_yojson tree path)
      | _, "ResourceNotFoundException" ->
          `ResourceNotFoundException
            (Json_deserializers.resource_not_found_exception_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : cancel_rotate_secret_request) =
    let input = Json_serializers.cancel_rotate_secret_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"secretsmanager.CancelRotateSecret" ~service
      ~context ~input
      ~output_deserializer:Json_deserializers.cancel_rotate_secret_response_of_yojson
      ~error_deserializer

  let request_with_metadata context (request : cancel_rotate_secret_request) =
    let input = Json_serializers.cancel_rotate_secret_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata
      ~shape_name:"secretsmanager.CancelRotateSecret" ~service ~context ~input
      ~output_deserializer:Json_deserializers.cancel_rotate_secret_response_of_yojson
      ~error_deserializer
end

module CreateSecret = struct
  let error_to_string = function
    | `DecryptionFailure _ -> "com.amazonaws.secretsmanager#DecryptionFailure"
    | `EncryptionFailure _ -> "com.amazonaws.secretsmanager#EncryptionFailure"
    | `InternalServiceError _ -> "com.amazonaws.secretsmanager#InternalServiceError"
    | `InvalidParameterException _ -> "com.amazonaws.secretsmanager#InvalidParameterException"
    | `InvalidRequestException _ -> "com.amazonaws.secretsmanager#InvalidRequestException"
    | `LimitExceededException _ -> "com.amazonaws.secretsmanager#LimitExceededException"
    | `MalformedPolicyDocumentException _ ->
        "com.amazonaws.secretsmanager#MalformedPolicyDocumentException"
    | `PreconditionNotMetException _ -> "com.amazonaws.secretsmanager#PreconditionNotMetException"
    | `ResourceExistsException _ -> "com.amazonaws.secretsmanager#ResourceExistsException"
    | `ResourceNotFoundException _ -> "com.amazonaws.secretsmanager#ResourceNotFoundException"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "DecryptionFailure" ->
          `DecryptionFailure (Json_deserializers.decryption_failure_of_yojson tree path)
      | _, "EncryptionFailure" ->
          `EncryptionFailure (Json_deserializers.encryption_failure_of_yojson tree path)
      | _, "InternalServiceError" ->
          `InternalServiceError (Json_deserializers.internal_service_error_of_yojson tree path)
      | _, "InvalidParameterException" ->
          `InvalidParameterException
            (Json_deserializers.invalid_parameter_exception_of_yojson tree path)
      | _, "InvalidRequestException" ->
          `InvalidRequestException
            (Json_deserializers.invalid_request_exception_of_yojson tree path)
      | _, "LimitExceededException" ->
          `LimitExceededException (Json_deserializers.limit_exceeded_exception_of_yojson tree path)
      | _, "MalformedPolicyDocumentException" ->
          `MalformedPolicyDocumentException
            (Json_deserializers.malformed_policy_document_exception_of_yojson tree path)
      | _, "PreconditionNotMetException" ->
          `PreconditionNotMetException
            (Json_deserializers.precondition_not_met_exception_of_yojson tree path)
      | _, "ResourceExistsException" ->
          `ResourceExistsException
            (Json_deserializers.resource_exists_exception_of_yojson tree path)
      | _, "ResourceNotFoundException" ->
          `ResourceNotFoundException
            (Json_deserializers.resource_not_found_exception_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : create_secret_request) =
    let input = Json_serializers.create_secret_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"secretsmanager.CreateSecret" ~service ~context
      ~input ~output_deserializer:Json_deserializers.create_secret_response_of_yojson
      ~error_deserializer

  let request_with_metadata context (request : create_secret_request) =
    let input = Json_serializers.create_secret_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata ~shape_name:"secretsmanager.CreateSecret"
      ~service ~context ~input
      ~output_deserializer:Json_deserializers.create_secret_response_of_yojson ~error_deserializer
end

module DeleteResourcePolicy = struct
  let error_to_string = function
    | `InternalServiceError _ -> "com.amazonaws.secretsmanager#InternalServiceError"
    | `InvalidParameterException _ -> "com.amazonaws.secretsmanager#InvalidParameterException"
    | `InvalidRequestException _ -> "com.amazonaws.secretsmanager#InvalidRequestException"
    | `ResourceNotFoundException _ -> "com.amazonaws.secretsmanager#ResourceNotFoundException"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "InternalServiceError" ->
          `InternalServiceError (Json_deserializers.internal_service_error_of_yojson tree path)
      | _, "InvalidParameterException" ->
          `InvalidParameterException
            (Json_deserializers.invalid_parameter_exception_of_yojson tree path)
      | _, "InvalidRequestException" ->
          `InvalidRequestException
            (Json_deserializers.invalid_request_exception_of_yojson tree path)
      | _, "ResourceNotFoundException" ->
          `ResourceNotFoundException
            (Json_deserializers.resource_not_found_exception_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : delete_resource_policy_request) =
    let input = Json_serializers.delete_resource_policy_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"secretsmanager.DeleteResourcePolicy" ~service
      ~context ~input
      ~output_deserializer:Json_deserializers.delete_resource_policy_response_of_yojson
      ~error_deserializer

  let request_with_metadata context (request : delete_resource_policy_request) =
    let input = Json_serializers.delete_resource_policy_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata
      ~shape_name:"secretsmanager.DeleteResourcePolicy" ~service ~context ~input
      ~output_deserializer:Json_deserializers.delete_resource_policy_response_of_yojson
      ~error_deserializer
end

module DeleteSecret = struct
  let error_to_string = function
    | `InternalServiceError _ -> "com.amazonaws.secretsmanager#InternalServiceError"
    | `InvalidParameterException _ -> "com.amazonaws.secretsmanager#InvalidParameterException"
    | `InvalidRequestException _ -> "com.amazonaws.secretsmanager#InvalidRequestException"
    | `ResourceNotFoundException _ -> "com.amazonaws.secretsmanager#ResourceNotFoundException"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "InternalServiceError" ->
          `InternalServiceError (Json_deserializers.internal_service_error_of_yojson tree path)
      | _, "InvalidParameterException" ->
          `InvalidParameterException
            (Json_deserializers.invalid_parameter_exception_of_yojson tree path)
      | _, "InvalidRequestException" ->
          `InvalidRequestException
            (Json_deserializers.invalid_request_exception_of_yojson tree path)
      | _, "ResourceNotFoundException" ->
          `ResourceNotFoundException
            (Json_deserializers.resource_not_found_exception_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : delete_secret_request) =
    let input = Json_serializers.delete_secret_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"secretsmanager.DeleteSecret" ~service ~context
      ~input ~output_deserializer:Json_deserializers.delete_secret_response_of_yojson
      ~error_deserializer

  let request_with_metadata context (request : delete_secret_request) =
    let input = Json_serializers.delete_secret_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata ~shape_name:"secretsmanager.DeleteSecret"
      ~service ~context ~input
      ~output_deserializer:Json_deserializers.delete_secret_response_of_yojson ~error_deserializer
end

module DescribeSecret = struct
  let error_to_string = function
    | `InternalServiceError _ -> "com.amazonaws.secretsmanager#InternalServiceError"
    | `InvalidParameterException _ -> "com.amazonaws.secretsmanager#InvalidParameterException"
    | `ResourceNotFoundException _ -> "com.amazonaws.secretsmanager#ResourceNotFoundException"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "InternalServiceError" ->
          `InternalServiceError (Json_deserializers.internal_service_error_of_yojson tree path)
      | _, "InvalidParameterException" ->
          `InvalidParameterException
            (Json_deserializers.invalid_parameter_exception_of_yojson tree path)
      | _, "ResourceNotFoundException" ->
          `ResourceNotFoundException
            (Json_deserializers.resource_not_found_exception_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : describe_secret_request) =
    let input = Json_serializers.describe_secret_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"secretsmanager.DescribeSecret" ~service
      ~context ~input ~output_deserializer:Json_deserializers.describe_secret_response_of_yojson
      ~error_deserializer

  let request_with_metadata context (request : describe_secret_request) =
    let input = Json_serializers.describe_secret_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata ~shape_name:"secretsmanager.DescribeSecret"
      ~service ~context ~input
      ~output_deserializer:Json_deserializers.describe_secret_response_of_yojson ~error_deserializer
end

module GetRandomPassword = struct
  let error_to_string = function
    | `InternalServiceError _ -> "com.amazonaws.secretsmanager#InternalServiceError"
    | `InvalidParameterException _ -> "com.amazonaws.secretsmanager#InvalidParameterException"
    | `InvalidRequestException _ -> "com.amazonaws.secretsmanager#InvalidRequestException"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "InternalServiceError" ->
          `InternalServiceError (Json_deserializers.internal_service_error_of_yojson tree path)
      | _, "InvalidParameterException" ->
          `InvalidParameterException
            (Json_deserializers.invalid_parameter_exception_of_yojson tree path)
      | _, "InvalidRequestException" ->
          `InvalidRequestException
            (Json_deserializers.invalid_request_exception_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : get_random_password_request) =
    let input = Json_serializers.get_random_password_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"secretsmanager.GetRandomPassword" ~service
      ~context ~input ~output_deserializer:Json_deserializers.get_random_password_response_of_yojson
      ~error_deserializer

  let request_with_metadata context (request : get_random_password_request) =
    let input = Json_serializers.get_random_password_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata ~shape_name:"secretsmanager.GetRandomPassword"
      ~service ~context ~input
      ~output_deserializer:Json_deserializers.get_random_password_response_of_yojson
      ~error_deserializer
end

module GetResourcePolicy = struct
  let error_to_string = function
    | `InternalServiceError _ -> "com.amazonaws.secretsmanager#InternalServiceError"
    | `InvalidParameterException _ -> "com.amazonaws.secretsmanager#InvalidParameterException"
    | `InvalidRequestException _ -> "com.amazonaws.secretsmanager#InvalidRequestException"
    | `ResourceNotFoundException _ -> "com.amazonaws.secretsmanager#ResourceNotFoundException"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "InternalServiceError" ->
          `InternalServiceError (Json_deserializers.internal_service_error_of_yojson tree path)
      | _, "InvalidParameterException" ->
          `InvalidParameterException
            (Json_deserializers.invalid_parameter_exception_of_yojson tree path)
      | _, "InvalidRequestException" ->
          `InvalidRequestException
            (Json_deserializers.invalid_request_exception_of_yojson tree path)
      | _, "ResourceNotFoundException" ->
          `ResourceNotFoundException
            (Json_deserializers.resource_not_found_exception_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : get_resource_policy_request) =
    let input = Json_serializers.get_resource_policy_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"secretsmanager.GetResourcePolicy" ~service
      ~context ~input ~output_deserializer:Json_deserializers.get_resource_policy_response_of_yojson
      ~error_deserializer

  let request_with_metadata context (request : get_resource_policy_request) =
    let input = Json_serializers.get_resource_policy_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata ~shape_name:"secretsmanager.GetResourcePolicy"
      ~service ~context ~input
      ~output_deserializer:Json_deserializers.get_resource_policy_response_of_yojson
      ~error_deserializer
end

module GetSecretValue = struct
  let error_to_string = function
    | `DecryptionFailure _ -> "com.amazonaws.secretsmanager#DecryptionFailure"
    | `InternalServiceError _ -> "com.amazonaws.secretsmanager#InternalServiceError"
    | `InvalidParameterException _ -> "com.amazonaws.secretsmanager#InvalidParameterException"
    | `InvalidRequestException _ -> "com.amazonaws.secretsmanager#InvalidRequestException"
    | `ResourceNotFoundException _ -> "com.amazonaws.secretsmanager#ResourceNotFoundException"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "DecryptionFailure" ->
          `DecryptionFailure (Json_deserializers.decryption_failure_of_yojson tree path)
      | _, "InternalServiceError" ->
          `InternalServiceError (Json_deserializers.internal_service_error_of_yojson tree path)
      | _, "InvalidParameterException" ->
          `InvalidParameterException
            (Json_deserializers.invalid_parameter_exception_of_yojson tree path)
      | _, "InvalidRequestException" ->
          `InvalidRequestException
            (Json_deserializers.invalid_request_exception_of_yojson tree path)
      | _, "ResourceNotFoundException" ->
          `ResourceNotFoundException
            (Json_deserializers.resource_not_found_exception_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : get_secret_value_request) =
    let input = Json_serializers.get_secret_value_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"secretsmanager.GetSecretValue" ~service
      ~context ~input ~output_deserializer:Json_deserializers.get_secret_value_response_of_yojson
      ~error_deserializer

  let request_with_metadata context (request : get_secret_value_request) =
    let input = Json_serializers.get_secret_value_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata ~shape_name:"secretsmanager.GetSecretValue"
      ~service ~context ~input
      ~output_deserializer:Json_deserializers.get_secret_value_response_of_yojson
      ~error_deserializer
end

module ListSecrets = struct
  let error_to_string = function
    | `InternalServiceError _ -> "com.amazonaws.secretsmanager#InternalServiceError"
    | `InvalidNextTokenException _ -> "com.amazonaws.secretsmanager#InvalidNextTokenException"
    | `InvalidParameterException _ -> "com.amazonaws.secretsmanager#InvalidParameterException"
    | `InvalidRequestException _ -> "com.amazonaws.secretsmanager#InvalidRequestException"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "InternalServiceError" ->
          `InternalServiceError (Json_deserializers.internal_service_error_of_yojson tree path)
      | _, "InvalidNextTokenException" ->
          `InvalidNextTokenException
            (Json_deserializers.invalid_next_token_exception_of_yojson tree path)
      | _, "InvalidParameterException" ->
          `InvalidParameterException
            (Json_deserializers.invalid_parameter_exception_of_yojson tree path)
      | _, "InvalidRequestException" ->
          `InvalidRequestException
            (Json_deserializers.invalid_request_exception_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : list_secrets_request) =
    let input = Json_serializers.list_secrets_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"secretsmanager.ListSecrets" ~service ~context
      ~input ~output_deserializer:Json_deserializers.list_secrets_response_of_yojson
      ~error_deserializer

  let request_with_metadata context (request : list_secrets_request) =
    let input = Json_serializers.list_secrets_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata ~shape_name:"secretsmanager.ListSecrets"
      ~service ~context ~input
      ~output_deserializer:Json_deserializers.list_secrets_response_of_yojson ~error_deserializer
end

module ListSecretVersionIds = struct
  let error_to_string = function
    | `InternalServiceError _ -> "com.amazonaws.secretsmanager#InternalServiceError"
    | `InvalidNextTokenException _ -> "com.amazonaws.secretsmanager#InvalidNextTokenException"
    | `InvalidParameterException _ -> "com.amazonaws.secretsmanager#InvalidParameterException"
    | `ResourceNotFoundException _ -> "com.amazonaws.secretsmanager#ResourceNotFoundException"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "InternalServiceError" ->
          `InternalServiceError (Json_deserializers.internal_service_error_of_yojson tree path)
      | _, "InvalidNextTokenException" ->
          `InvalidNextTokenException
            (Json_deserializers.invalid_next_token_exception_of_yojson tree path)
      | _, "InvalidParameterException" ->
          `InvalidParameterException
            (Json_deserializers.invalid_parameter_exception_of_yojson tree path)
      | _, "ResourceNotFoundException" ->
          `ResourceNotFoundException
            (Json_deserializers.resource_not_found_exception_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : list_secret_version_ids_request) =
    let input = Json_serializers.list_secret_version_ids_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"secretsmanager.ListSecretVersionIds" ~service
      ~context ~input
      ~output_deserializer:Json_deserializers.list_secret_version_ids_response_of_yojson
      ~error_deserializer

  let request_with_metadata context (request : list_secret_version_ids_request) =
    let input = Json_serializers.list_secret_version_ids_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata
      ~shape_name:"secretsmanager.ListSecretVersionIds" ~service ~context ~input
      ~output_deserializer:Json_deserializers.list_secret_version_ids_response_of_yojson
      ~error_deserializer
end

module PutResourcePolicy = struct
  let error_to_string = function
    | `InternalServiceError _ -> "com.amazonaws.secretsmanager#InternalServiceError"
    | `InvalidParameterException _ -> "com.amazonaws.secretsmanager#InvalidParameterException"
    | `InvalidRequestException _ -> "com.amazonaws.secretsmanager#InvalidRequestException"
    | `MalformedPolicyDocumentException _ ->
        "com.amazonaws.secretsmanager#MalformedPolicyDocumentException"
    | `PublicPolicyException _ -> "com.amazonaws.secretsmanager#PublicPolicyException"
    | `ResourceNotFoundException _ -> "com.amazonaws.secretsmanager#ResourceNotFoundException"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "InternalServiceError" ->
          `InternalServiceError (Json_deserializers.internal_service_error_of_yojson tree path)
      | _, "InvalidParameterException" ->
          `InvalidParameterException
            (Json_deserializers.invalid_parameter_exception_of_yojson tree path)
      | _, "InvalidRequestException" ->
          `InvalidRequestException
            (Json_deserializers.invalid_request_exception_of_yojson tree path)
      | _, "MalformedPolicyDocumentException" ->
          `MalformedPolicyDocumentException
            (Json_deserializers.malformed_policy_document_exception_of_yojson tree path)
      | _, "PublicPolicyException" ->
          `PublicPolicyException (Json_deserializers.public_policy_exception_of_yojson tree path)
      | _, "ResourceNotFoundException" ->
          `ResourceNotFoundException
            (Json_deserializers.resource_not_found_exception_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : put_resource_policy_request) =
    let input = Json_serializers.put_resource_policy_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"secretsmanager.PutResourcePolicy" ~service
      ~context ~input ~output_deserializer:Json_deserializers.put_resource_policy_response_of_yojson
      ~error_deserializer

  let request_with_metadata context (request : put_resource_policy_request) =
    let input = Json_serializers.put_resource_policy_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata ~shape_name:"secretsmanager.PutResourcePolicy"
      ~service ~context ~input
      ~output_deserializer:Json_deserializers.put_resource_policy_response_of_yojson
      ~error_deserializer
end

module PutSecretValue = struct
  let error_to_string = function
    | `DecryptionFailure _ -> "com.amazonaws.secretsmanager#DecryptionFailure"
    | `EncryptionFailure _ -> "com.amazonaws.secretsmanager#EncryptionFailure"
    | `InternalServiceError _ -> "com.amazonaws.secretsmanager#InternalServiceError"
    | `InvalidParameterException _ -> "com.amazonaws.secretsmanager#InvalidParameterException"
    | `InvalidRequestException _ -> "com.amazonaws.secretsmanager#InvalidRequestException"
    | `LimitExceededException _ -> "com.amazonaws.secretsmanager#LimitExceededException"
    | `ResourceExistsException _ -> "com.amazonaws.secretsmanager#ResourceExistsException"
    | `ResourceNotFoundException _ -> "com.amazonaws.secretsmanager#ResourceNotFoundException"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "DecryptionFailure" ->
          `DecryptionFailure (Json_deserializers.decryption_failure_of_yojson tree path)
      | _, "EncryptionFailure" ->
          `EncryptionFailure (Json_deserializers.encryption_failure_of_yojson tree path)
      | _, "InternalServiceError" ->
          `InternalServiceError (Json_deserializers.internal_service_error_of_yojson tree path)
      | _, "InvalidParameterException" ->
          `InvalidParameterException
            (Json_deserializers.invalid_parameter_exception_of_yojson tree path)
      | _, "InvalidRequestException" ->
          `InvalidRequestException
            (Json_deserializers.invalid_request_exception_of_yojson tree path)
      | _, "LimitExceededException" ->
          `LimitExceededException (Json_deserializers.limit_exceeded_exception_of_yojson tree path)
      | _, "ResourceExistsException" ->
          `ResourceExistsException
            (Json_deserializers.resource_exists_exception_of_yojson tree path)
      | _, "ResourceNotFoundException" ->
          `ResourceNotFoundException
            (Json_deserializers.resource_not_found_exception_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : put_secret_value_request) =
    let input = Json_serializers.put_secret_value_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"secretsmanager.PutSecretValue" ~service
      ~context ~input ~output_deserializer:Json_deserializers.put_secret_value_response_of_yojson
      ~error_deserializer

  let request_with_metadata context (request : put_secret_value_request) =
    let input = Json_serializers.put_secret_value_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata ~shape_name:"secretsmanager.PutSecretValue"
      ~service ~context ~input
      ~output_deserializer:Json_deserializers.put_secret_value_response_of_yojson
      ~error_deserializer
end

module RemoveRegionsFromReplication = struct
  let error_to_string = function
    | `InternalServiceError _ -> "com.amazonaws.secretsmanager#InternalServiceError"
    | `InvalidParameterException _ -> "com.amazonaws.secretsmanager#InvalidParameterException"
    | `InvalidRequestException _ -> "com.amazonaws.secretsmanager#InvalidRequestException"
    | `ResourceNotFoundException _ -> "com.amazonaws.secretsmanager#ResourceNotFoundException"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "InternalServiceError" ->
          `InternalServiceError (Json_deserializers.internal_service_error_of_yojson tree path)
      | _, "InvalidParameterException" ->
          `InvalidParameterException
            (Json_deserializers.invalid_parameter_exception_of_yojson tree path)
      | _, "InvalidRequestException" ->
          `InvalidRequestException
            (Json_deserializers.invalid_request_exception_of_yojson tree path)
      | _, "ResourceNotFoundException" ->
          `ResourceNotFoundException
            (Json_deserializers.resource_not_found_exception_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : remove_regions_from_replication_request) =
    let input = Json_serializers.remove_regions_from_replication_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"secretsmanager.RemoveRegionsFromReplication"
      ~service ~context ~input
      ~output_deserializer:Json_deserializers.remove_regions_from_replication_response_of_yojson
      ~error_deserializer

  let request_with_metadata context (request : remove_regions_from_replication_request) =
    let input = Json_serializers.remove_regions_from_replication_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata
      ~shape_name:"secretsmanager.RemoveRegionsFromReplication" ~service ~context ~input
      ~output_deserializer:Json_deserializers.remove_regions_from_replication_response_of_yojson
      ~error_deserializer
end

module ReplicateSecretToRegions = struct
  let error_to_string = function
    | `InternalServiceError _ -> "com.amazonaws.secretsmanager#InternalServiceError"
    | `InvalidParameterException _ -> "com.amazonaws.secretsmanager#InvalidParameterException"
    | `InvalidRequestException _ -> "com.amazonaws.secretsmanager#InvalidRequestException"
    | `ResourceNotFoundException _ -> "com.amazonaws.secretsmanager#ResourceNotFoundException"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "InternalServiceError" ->
          `InternalServiceError (Json_deserializers.internal_service_error_of_yojson tree path)
      | _, "InvalidParameterException" ->
          `InvalidParameterException
            (Json_deserializers.invalid_parameter_exception_of_yojson tree path)
      | _, "InvalidRequestException" ->
          `InvalidRequestException
            (Json_deserializers.invalid_request_exception_of_yojson tree path)
      | _, "ResourceNotFoundException" ->
          `ResourceNotFoundException
            (Json_deserializers.resource_not_found_exception_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : replicate_secret_to_regions_request) =
    let input = Json_serializers.replicate_secret_to_regions_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"secretsmanager.ReplicateSecretToRegions"
      ~service ~context ~input
      ~output_deserializer:Json_deserializers.replicate_secret_to_regions_response_of_yojson
      ~error_deserializer

  let request_with_metadata context (request : replicate_secret_to_regions_request) =
    let input = Json_serializers.replicate_secret_to_regions_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata
      ~shape_name:"secretsmanager.ReplicateSecretToRegions" ~service ~context ~input
      ~output_deserializer:Json_deserializers.replicate_secret_to_regions_response_of_yojson
      ~error_deserializer
end

module RestoreSecret = struct
  let error_to_string = function
    | `InternalServiceError _ -> "com.amazonaws.secretsmanager#InternalServiceError"
    | `InvalidParameterException _ -> "com.amazonaws.secretsmanager#InvalidParameterException"
    | `InvalidRequestException _ -> "com.amazonaws.secretsmanager#InvalidRequestException"
    | `ResourceNotFoundException _ -> "com.amazonaws.secretsmanager#ResourceNotFoundException"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "InternalServiceError" ->
          `InternalServiceError (Json_deserializers.internal_service_error_of_yojson tree path)
      | _, "InvalidParameterException" ->
          `InvalidParameterException
            (Json_deserializers.invalid_parameter_exception_of_yojson tree path)
      | _, "InvalidRequestException" ->
          `InvalidRequestException
            (Json_deserializers.invalid_request_exception_of_yojson tree path)
      | _, "ResourceNotFoundException" ->
          `ResourceNotFoundException
            (Json_deserializers.resource_not_found_exception_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : restore_secret_request) =
    let input = Json_serializers.restore_secret_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"secretsmanager.RestoreSecret" ~service ~context
      ~input ~output_deserializer:Json_deserializers.restore_secret_response_of_yojson
      ~error_deserializer

  let request_with_metadata context (request : restore_secret_request) =
    let input = Json_serializers.restore_secret_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata ~shape_name:"secretsmanager.RestoreSecret"
      ~service ~context ~input
      ~output_deserializer:Json_deserializers.restore_secret_response_of_yojson ~error_deserializer
end

module RotateSecret = struct
  let error_to_string = function
    | `InternalServiceError _ -> "com.amazonaws.secretsmanager#InternalServiceError"
    | `InvalidParameterException _ -> "com.amazonaws.secretsmanager#InvalidParameterException"
    | `InvalidRequestException _ -> "com.amazonaws.secretsmanager#InvalidRequestException"
    | `ResourceNotFoundException _ -> "com.amazonaws.secretsmanager#ResourceNotFoundException"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "InternalServiceError" ->
          `InternalServiceError (Json_deserializers.internal_service_error_of_yojson tree path)
      | _, "InvalidParameterException" ->
          `InvalidParameterException
            (Json_deserializers.invalid_parameter_exception_of_yojson tree path)
      | _, "InvalidRequestException" ->
          `InvalidRequestException
            (Json_deserializers.invalid_request_exception_of_yojson tree path)
      | _, "ResourceNotFoundException" ->
          `ResourceNotFoundException
            (Json_deserializers.resource_not_found_exception_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : rotate_secret_request) =
    let input = Json_serializers.rotate_secret_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"secretsmanager.RotateSecret" ~service ~context
      ~input ~output_deserializer:Json_deserializers.rotate_secret_response_of_yojson
      ~error_deserializer

  let request_with_metadata context (request : rotate_secret_request) =
    let input = Json_serializers.rotate_secret_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata ~shape_name:"secretsmanager.RotateSecret"
      ~service ~context ~input
      ~output_deserializer:Json_deserializers.rotate_secret_response_of_yojson ~error_deserializer
end

module StopReplicationToReplica = struct
  let error_to_string = function
    | `InternalServiceError _ -> "com.amazonaws.secretsmanager#InternalServiceError"
    | `InvalidParameterException _ -> "com.amazonaws.secretsmanager#InvalidParameterException"
    | `InvalidRequestException _ -> "com.amazonaws.secretsmanager#InvalidRequestException"
    | `ResourceNotFoundException _ -> "com.amazonaws.secretsmanager#ResourceNotFoundException"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "InternalServiceError" ->
          `InternalServiceError (Json_deserializers.internal_service_error_of_yojson tree path)
      | _, "InvalidParameterException" ->
          `InvalidParameterException
            (Json_deserializers.invalid_parameter_exception_of_yojson tree path)
      | _, "InvalidRequestException" ->
          `InvalidRequestException
            (Json_deserializers.invalid_request_exception_of_yojson tree path)
      | _, "ResourceNotFoundException" ->
          `ResourceNotFoundException
            (Json_deserializers.resource_not_found_exception_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : stop_replication_to_replica_request) =
    let input = Json_serializers.stop_replication_to_replica_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"secretsmanager.StopReplicationToReplica"
      ~service ~context ~input
      ~output_deserializer:Json_deserializers.stop_replication_to_replica_response_of_yojson
      ~error_deserializer

  let request_with_metadata context (request : stop_replication_to_replica_request) =
    let input = Json_serializers.stop_replication_to_replica_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata
      ~shape_name:"secretsmanager.StopReplicationToReplica" ~service ~context ~input
      ~output_deserializer:Json_deserializers.stop_replication_to_replica_response_of_yojson
      ~error_deserializer
end

module TagResource = struct
  let error_to_string = function
    | `InternalServiceError _ -> "com.amazonaws.secretsmanager#InternalServiceError"
    | `InvalidParameterException _ -> "com.amazonaws.secretsmanager#InvalidParameterException"
    | `InvalidRequestException _ -> "com.amazonaws.secretsmanager#InvalidRequestException"
    | `ResourceNotFoundException _ -> "com.amazonaws.secretsmanager#ResourceNotFoundException"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "InternalServiceError" ->
          `InternalServiceError (Json_deserializers.internal_service_error_of_yojson tree path)
      | _, "InvalidParameterException" ->
          `InvalidParameterException
            (Json_deserializers.invalid_parameter_exception_of_yojson tree path)
      | _, "InvalidRequestException" ->
          `InvalidRequestException
            (Json_deserializers.invalid_request_exception_of_yojson tree path)
      | _, "ResourceNotFoundException" ->
          `ResourceNotFoundException
            (Json_deserializers.resource_not_found_exception_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : tag_resource_request) =
    let input = Json_serializers.tag_resource_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"secretsmanager.TagResource" ~service ~context
      ~input ~output_deserializer:Smaws_Lib.Smithy_api.Json_deserializers.unit__of_yojson
      ~error_deserializer

  let request_with_metadata context (request : tag_resource_request) =
    let input = Json_serializers.tag_resource_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata ~shape_name:"secretsmanager.TagResource"
      ~service ~context ~input
      ~output_deserializer:Smaws_Lib.Smithy_api.Json_deserializers.unit__of_yojson
      ~error_deserializer
end

module UntagResource = struct
  let error_to_string = function
    | `InternalServiceError _ -> "com.amazonaws.secretsmanager#InternalServiceError"
    | `InvalidParameterException _ -> "com.amazonaws.secretsmanager#InvalidParameterException"
    | `InvalidRequestException _ -> "com.amazonaws.secretsmanager#InvalidRequestException"
    | `ResourceNotFoundException _ -> "com.amazonaws.secretsmanager#ResourceNotFoundException"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "InternalServiceError" ->
          `InternalServiceError (Json_deserializers.internal_service_error_of_yojson tree path)
      | _, "InvalidParameterException" ->
          `InvalidParameterException
            (Json_deserializers.invalid_parameter_exception_of_yojson tree path)
      | _, "InvalidRequestException" ->
          `InvalidRequestException
            (Json_deserializers.invalid_request_exception_of_yojson tree path)
      | _, "ResourceNotFoundException" ->
          `ResourceNotFoundException
            (Json_deserializers.resource_not_found_exception_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : untag_resource_request) =
    let input = Json_serializers.untag_resource_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"secretsmanager.UntagResource" ~service ~context
      ~input ~output_deserializer:Smaws_Lib.Smithy_api.Json_deserializers.unit__of_yojson
      ~error_deserializer

  let request_with_metadata context (request : untag_resource_request) =
    let input = Json_serializers.untag_resource_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata ~shape_name:"secretsmanager.UntagResource"
      ~service ~context ~input
      ~output_deserializer:Smaws_Lib.Smithy_api.Json_deserializers.unit__of_yojson
      ~error_deserializer
end

module UpdateSecret = struct
  let error_to_string = function
    | `DecryptionFailure _ -> "com.amazonaws.secretsmanager#DecryptionFailure"
    | `EncryptionFailure _ -> "com.amazonaws.secretsmanager#EncryptionFailure"
    | `InternalServiceError _ -> "com.amazonaws.secretsmanager#InternalServiceError"
    | `InvalidParameterException _ -> "com.amazonaws.secretsmanager#InvalidParameterException"
    | `InvalidRequestException _ -> "com.amazonaws.secretsmanager#InvalidRequestException"
    | `LimitExceededException _ -> "com.amazonaws.secretsmanager#LimitExceededException"
    | `MalformedPolicyDocumentException _ ->
        "com.amazonaws.secretsmanager#MalformedPolicyDocumentException"
    | `PreconditionNotMetException _ -> "com.amazonaws.secretsmanager#PreconditionNotMetException"
    | `ResourceExistsException _ -> "com.amazonaws.secretsmanager#ResourceExistsException"
    | `ResourceNotFoundException _ -> "com.amazonaws.secretsmanager#ResourceNotFoundException"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "DecryptionFailure" ->
          `DecryptionFailure (Json_deserializers.decryption_failure_of_yojson tree path)
      | _, "EncryptionFailure" ->
          `EncryptionFailure (Json_deserializers.encryption_failure_of_yojson tree path)
      | _, "InternalServiceError" ->
          `InternalServiceError (Json_deserializers.internal_service_error_of_yojson tree path)
      | _, "InvalidParameterException" ->
          `InvalidParameterException
            (Json_deserializers.invalid_parameter_exception_of_yojson tree path)
      | _, "InvalidRequestException" ->
          `InvalidRequestException
            (Json_deserializers.invalid_request_exception_of_yojson tree path)
      | _, "LimitExceededException" ->
          `LimitExceededException (Json_deserializers.limit_exceeded_exception_of_yojson tree path)
      | _, "MalformedPolicyDocumentException" ->
          `MalformedPolicyDocumentException
            (Json_deserializers.malformed_policy_document_exception_of_yojson tree path)
      | _, "PreconditionNotMetException" ->
          `PreconditionNotMetException
            (Json_deserializers.precondition_not_met_exception_of_yojson tree path)
      | _, "ResourceExistsException" ->
          `ResourceExistsException
            (Json_deserializers.resource_exists_exception_of_yojson tree path)
      | _, "ResourceNotFoundException" ->
          `ResourceNotFoundException
            (Json_deserializers.resource_not_found_exception_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : update_secret_request) =
    let input = Json_serializers.update_secret_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"secretsmanager.UpdateSecret" ~service ~context
      ~input ~output_deserializer:Json_deserializers.update_secret_response_of_yojson
      ~error_deserializer

  let request_with_metadata context (request : update_secret_request) =
    let input = Json_serializers.update_secret_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata ~shape_name:"secretsmanager.UpdateSecret"
      ~service ~context ~input
      ~output_deserializer:Json_deserializers.update_secret_response_of_yojson ~error_deserializer
end

module UpdateSecretVersionStage = struct
  let error_to_string = function
    | `InternalServiceError _ -> "com.amazonaws.secretsmanager#InternalServiceError"
    | `InvalidParameterException _ -> "com.amazonaws.secretsmanager#InvalidParameterException"
    | `InvalidRequestException _ -> "com.amazonaws.secretsmanager#InvalidRequestException"
    | `LimitExceededException _ -> "com.amazonaws.secretsmanager#LimitExceededException"
    | `ResourceNotFoundException _ -> "com.amazonaws.secretsmanager#ResourceNotFoundException"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "InternalServiceError" ->
          `InternalServiceError (Json_deserializers.internal_service_error_of_yojson tree path)
      | _, "InvalidParameterException" ->
          `InvalidParameterException
            (Json_deserializers.invalid_parameter_exception_of_yojson tree path)
      | _, "InvalidRequestException" ->
          `InvalidRequestException
            (Json_deserializers.invalid_request_exception_of_yojson tree path)
      | _, "LimitExceededException" ->
          `LimitExceededException (Json_deserializers.limit_exceeded_exception_of_yojson tree path)
      | _, "ResourceNotFoundException" ->
          `ResourceNotFoundException
            (Json_deserializers.resource_not_found_exception_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : update_secret_version_stage_request) =
    let input = Json_serializers.update_secret_version_stage_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"secretsmanager.UpdateSecretVersionStage"
      ~service ~context ~input
      ~output_deserializer:Json_deserializers.update_secret_version_stage_response_of_yojson
      ~error_deserializer

  let request_with_metadata context (request : update_secret_version_stage_request) =
    let input = Json_serializers.update_secret_version_stage_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata
      ~shape_name:"secretsmanager.UpdateSecretVersionStage" ~service ~context ~input
      ~output_deserializer:Json_deserializers.update_secret_version_stage_response_of_yojson
      ~error_deserializer
end

module ValidateResourcePolicy = struct
  let error_to_string = function
    | `InternalServiceError _ -> "com.amazonaws.secretsmanager#InternalServiceError"
    | `InvalidParameterException _ -> "com.amazonaws.secretsmanager#InvalidParameterException"
    | `InvalidRequestException _ -> "com.amazonaws.secretsmanager#InvalidRequestException"
    | `MalformedPolicyDocumentException _ ->
        "com.amazonaws.secretsmanager#MalformedPolicyDocumentException"
    | `ResourceNotFoundException _ -> "com.amazonaws.secretsmanager#ResourceNotFoundException"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "InternalServiceError" ->
          `InternalServiceError (Json_deserializers.internal_service_error_of_yojson tree path)
      | _, "InvalidParameterException" ->
          `InvalidParameterException
            (Json_deserializers.invalid_parameter_exception_of_yojson tree path)
      | _, "InvalidRequestException" ->
          `InvalidRequestException
            (Json_deserializers.invalid_request_exception_of_yojson tree path)
      | _, "MalformedPolicyDocumentException" ->
          `MalformedPolicyDocumentException
            (Json_deserializers.malformed_policy_document_exception_of_yojson tree path)
      | _, "ResourceNotFoundException" ->
          `ResourceNotFoundException
            (Json_deserializers.resource_not_found_exception_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : validate_resource_policy_request) =
    let input = Json_serializers.validate_resource_policy_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"secretsmanager.ValidateResourcePolicy" ~service
      ~context ~input
      ~output_deserializer:Json_deserializers.validate_resource_policy_response_of_yojson
      ~error_deserializer

  let request_with_metadata context (request : validate_resource_policy_request) =
    let input = Json_serializers.validate_resource_policy_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata
      ~shape_name:"secretsmanager.ValidateResourcePolicy" ~service ~context ~input
      ~output_deserializer:Json_deserializers.validate_resource_policy_response_of_yojson
      ~error_deserializer
end
