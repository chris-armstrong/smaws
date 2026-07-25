open Types
open Service_metadata

module UpdateWebAppCustomization = struct
  let error_to_string = function
    | `AccessDeniedException _ -> "com.amazonaws.transfer#AccessDeniedException"
    | `ConflictException _ -> "com.amazonaws.transfer#ConflictException"
    | `InternalServiceError _ -> "com.amazonaws.transfer#InternalServiceError"
    | `InvalidRequestException _ -> "com.amazonaws.transfer#InvalidRequestException"
    | `ResourceNotFoundException _ -> "com.amazonaws.transfer#ResourceNotFoundException"
    | `ThrottlingException _ -> "com.amazonaws.transfer#ThrottlingException"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "AccessDeniedException" ->
          `AccessDeniedException (Json_deserializers.access_denied_exception_of_yojson tree path)
      | _, "ConflictException" ->
          `ConflictException (Json_deserializers.conflict_exception_of_yojson tree path)
      | _, "InternalServiceError" ->
          `InternalServiceError (Json_deserializers.internal_service_error_of_yojson tree path)
      | _, "InvalidRequestException" ->
          `InvalidRequestException
            (Json_deserializers.invalid_request_exception_of_yojson tree path)
      | _, "ResourceNotFoundException" ->
          `ResourceNotFoundException
            (Json_deserializers.resource_not_found_exception_of_yojson tree path)
      | _, "ThrottlingException" ->
          `ThrottlingException (Json_deserializers.throttling_exception_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : update_web_app_customization_request) =
    let input = Json_serializers.update_web_app_customization_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"TransferService.UpdateWebAppCustomization"
      ~service ~context ~input
      ~output_deserializer:Json_deserializers.update_web_app_customization_response_of_yojson
      ~error_deserializer

  let request_with_metadata context (request : update_web_app_customization_request) =
    let input = Json_serializers.update_web_app_customization_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata
      ~shape_name:"TransferService.UpdateWebAppCustomization" ~service ~context ~input
      ~output_deserializer:Json_deserializers.update_web_app_customization_response_of_yojson
      ~error_deserializer
end

module UpdateWebApp = struct
  let error_to_string = function
    | `AccessDeniedException _ -> "com.amazonaws.transfer#AccessDeniedException"
    | `ConflictException _ -> "com.amazonaws.transfer#ConflictException"
    | `InternalServiceError _ -> "com.amazonaws.transfer#InternalServiceError"
    | `InvalidRequestException _ -> "com.amazonaws.transfer#InvalidRequestException"
    | `ResourceNotFoundException _ -> "com.amazonaws.transfer#ResourceNotFoundException"
    | `ThrottlingException _ -> "com.amazonaws.transfer#ThrottlingException"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "AccessDeniedException" ->
          `AccessDeniedException (Json_deserializers.access_denied_exception_of_yojson tree path)
      | _, "ConflictException" ->
          `ConflictException (Json_deserializers.conflict_exception_of_yojson tree path)
      | _, "InternalServiceError" ->
          `InternalServiceError (Json_deserializers.internal_service_error_of_yojson tree path)
      | _, "InvalidRequestException" ->
          `InvalidRequestException
            (Json_deserializers.invalid_request_exception_of_yojson tree path)
      | _, "ResourceNotFoundException" ->
          `ResourceNotFoundException
            (Json_deserializers.resource_not_found_exception_of_yojson tree path)
      | _, "ThrottlingException" ->
          `ThrottlingException (Json_deserializers.throttling_exception_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : update_web_app_request) =
    let input = Json_serializers.update_web_app_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"TransferService.UpdateWebApp" ~service ~context
      ~input ~output_deserializer:Json_deserializers.update_web_app_response_of_yojson
      ~error_deserializer

  let request_with_metadata context (request : update_web_app_request) =
    let input = Json_serializers.update_web_app_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata ~shape_name:"TransferService.UpdateWebApp"
      ~service ~context ~input
      ~output_deserializer:Json_deserializers.update_web_app_response_of_yojson ~error_deserializer
end

module UpdateUser = struct
  let error_to_string = function
    | `InternalServiceError _ -> "com.amazonaws.transfer#InternalServiceError"
    | `InvalidRequestException _ -> "com.amazonaws.transfer#InvalidRequestException"
    | `ResourceNotFoundException _ -> "com.amazonaws.transfer#ResourceNotFoundException"
    | `ServiceUnavailableException _ -> "com.amazonaws.transfer#ServiceUnavailableException"
    | `ThrottlingException _ -> "com.amazonaws.transfer#ThrottlingException"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "InternalServiceError" ->
          `InternalServiceError (Json_deserializers.internal_service_error_of_yojson tree path)
      | _, "InvalidRequestException" ->
          `InvalidRequestException
            (Json_deserializers.invalid_request_exception_of_yojson tree path)
      | _, "ResourceNotFoundException" ->
          `ResourceNotFoundException
            (Json_deserializers.resource_not_found_exception_of_yojson tree path)
      | _, "ServiceUnavailableException" ->
          `ServiceUnavailableException
            (Json_deserializers.service_unavailable_exception_of_yojson tree path)
      | _, "ThrottlingException" ->
          `ThrottlingException (Json_deserializers.throttling_exception_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : update_user_request) =
    let input = Json_serializers.update_user_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"TransferService.UpdateUser" ~service ~context
      ~input ~output_deserializer:Json_deserializers.update_user_response_of_yojson
      ~error_deserializer

  let request_with_metadata context (request : update_user_request) =
    let input = Json_serializers.update_user_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata ~shape_name:"TransferService.UpdateUser"
      ~service ~context ~input
      ~output_deserializer:Json_deserializers.update_user_response_of_yojson ~error_deserializer
end

module UpdateServer = struct
  let error_to_string = function
    | `AccessDeniedException _ -> "com.amazonaws.transfer#AccessDeniedException"
    | `ConflictException _ -> "com.amazonaws.transfer#ConflictException"
    | `InternalServiceError _ -> "com.amazonaws.transfer#InternalServiceError"
    | `InvalidRequestException _ -> "com.amazonaws.transfer#InvalidRequestException"
    | `ResourceExistsException _ -> "com.amazonaws.transfer#ResourceExistsException"
    | `ResourceNotFoundException _ -> "com.amazonaws.transfer#ResourceNotFoundException"
    | `ServiceUnavailableException _ -> "com.amazonaws.transfer#ServiceUnavailableException"
    | `ThrottlingException _ -> "com.amazonaws.transfer#ThrottlingException"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "AccessDeniedException" ->
          `AccessDeniedException (Json_deserializers.access_denied_exception_of_yojson tree path)
      | _, "ConflictException" ->
          `ConflictException (Json_deserializers.conflict_exception_of_yojson tree path)
      | _, "InternalServiceError" ->
          `InternalServiceError (Json_deserializers.internal_service_error_of_yojson tree path)
      | _, "InvalidRequestException" ->
          `InvalidRequestException
            (Json_deserializers.invalid_request_exception_of_yojson tree path)
      | _, "ResourceExistsException" ->
          `ResourceExistsException
            (Json_deserializers.resource_exists_exception_of_yojson tree path)
      | _, "ResourceNotFoundException" ->
          `ResourceNotFoundException
            (Json_deserializers.resource_not_found_exception_of_yojson tree path)
      | _, "ServiceUnavailableException" ->
          `ServiceUnavailableException
            (Json_deserializers.service_unavailable_exception_of_yojson tree path)
      | _, "ThrottlingException" ->
          `ThrottlingException (Json_deserializers.throttling_exception_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : update_server_request) =
    let input = Json_serializers.update_server_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"TransferService.UpdateServer" ~service ~context
      ~input ~output_deserializer:Json_deserializers.update_server_response_of_yojson
      ~error_deserializer

  let request_with_metadata context (request : update_server_request) =
    let input = Json_serializers.update_server_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata ~shape_name:"TransferService.UpdateServer"
      ~service ~context ~input
      ~output_deserializer:Json_deserializers.update_server_response_of_yojson ~error_deserializer
end

module UpdateProfile = struct
  let error_to_string = function
    | `InternalServiceError _ -> "com.amazonaws.transfer#InternalServiceError"
    | `InvalidRequestException _ -> "com.amazonaws.transfer#InvalidRequestException"
    | `ResourceNotFoundException _ -> "com.amazonaws.transfer#ResourceNotFoundException"
    | `ServiceUnavailableException _ -> "com.amazonaws.transfer#ServiceUnavailableException"
    | `ThrottlingException _ -> "com.amazonaws.transfer#ThrottlingException"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "InternalServiceError" ->
          `InternalServiceError (Json_deserializers.internal_service_error_of_yojson tree path)
      | _, "InvalidRequestException" ->
          `InvalidRequestException
            (Json_deserializers.invalid_request_exception_of_yojson tree path)
      | _, "ResourceNotFoundException" ->
          `ResourceNotFoundException
            (Json_deserializers.resource_not_found_exception_of_yojson tree path)
      | _, "ServiceUnavailableException" ->
          `ServiceUnavailableException
            (Json_deserializers.service_unavailable_exception_of_yojson tree path)
      | _, "ThrottlingException" ->
          `ThrottlingException (Json_deserializers.throttling_exception_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : update_profile_request) =
    let input = Json_serializers.update_profile_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"TransferService.UpdateProfile" ~service
      ~context ~input ~output_deserializer:Json_deserializers.update_profile_response_of_yojson
      ~error_deserializer

  let request_with_metadata context (request : update_profile_request) =
    let input = Json_serializers.update_profile_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata ~shape_name:"TransferService.UpdateProfile"
      ~service ~context ~input
      ~output_deserializer:Json_deserializers.update_profile_response_of_yojson ~error_deserializer
end

module UpdateConnector = struct
  let error_to_string = function
    | `InternalServiceError _ -> "com.amazonaws.transfer#InternalServiceError"
    | `InvalidRequestException _ -> "com.amazonaws.transfer#InvalidRequestException"
    | `ResourceExistsException _ -> "com.amazonaws.transfer#ResourceExistsException"
    | `ResourceNotFoundException _ -> "com.amazonaws.transfer#ResourceNotFoundException"
    | `ServiceUnavailableException _ -> "com.amazonaws.transfer#ServiceUnavailableException"
    | `ThrottlingException _ -> "com.amazonaws.transfer#ThrottlingException"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "InternalServiceError" ->
          `InternalServiceError (Json_deserializers.internal_service_error_of_yojson tree path)
      | _, "InvalidRequestException" ->
          `InvalidRequestException
            (Json_deserializers.invalid_request_exception_of_yojson tree path)
      | _, "ResourceExistsException" ->
          `ResourceExistsException
            (Json_deserializers.resource_exists_exception_of_yojson tree path)
      | _, "ResourceNotFoundException" ->
          `ResourceNotFoundException
            (Json_deserializers.resource_not_found_exception_of_yojson tree path)
      | _, "ServiceUnavailableException" ->
          `ServiceUnavailableException
            (Json_deserializers.service_unavailable_exception_of_yojson tree path)
      | _, "ThrottlingException" ->
          `ThrottlingException (Json_deserializers.throttling_exception_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : update_connector_request) =
    let input = Json_serializers.update_connector_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"TransferService.UpdateConnector" ~service
      ~context ~input ~output_deserializer:Json_deserializers.update_connector_response_of_yojson
      ~error_deserializer

  let request_with_metadata context (request : update_connector_request) =
    let input = Json_serializers.update_connector_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata ~shape_name:"TransferService.UpdateConnector"
      ~service ~context ~input
      ~output_deserializer:Json_deserializers.update_connector_response_of_yojson
      ~error_deserializer
end

module UpdateCertificate = struct
  let error_to_string = function
    | `InternalServiceError _ -> "com.amazonaws.transfer#InternalServiceError"
    | `InvalidRequestException _ -> "com.amazonaws.transfer#InvalidRequestException"
    | `ResourceNotFoundException _ -> "com.amazonaws.transfer#ResourceNotFoundException"
    | `ServiceUnavailableException _ -> "com.amazonaws.transfer#ServiceUnavailableException"
    | `ThrottlingException _ -> "com.amazonaws.transfer#ThrottlingException"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "InternalServiceError" ->
          `InternalServiceError (Json_deserializers.internal_service_error_of_yojson tree path)
      | _, "InvalidRequestException" ->
          `InvalidRequestException
            (Json_deserializers.invalid_request_exception_of_yojson tree path)
      | _, "ResourceNotFoundException" ->
          `ResourceNotFoundException
            (Json_deserializers.resource_not_found_exception_of_yojson tree path)
      | _, "ServiceUnavailableException" ->
          `ServiceUnavailableException
            (Json_deserializers.service_unavailable_exception_of_yojson tree path)
      | _, "ThrottlingException" ->
          `ThrottlingException (Json_deserializers.throttling_exception_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : update_certificate_request) =
    let input = Json_serializers.update_certificate_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"TransferService.UpdateCertificate" ~service
      ~context ~input ~output_deserializer:Json_deserializers.update_certificate_response_of_yojson
      ~error_deserializer

  let request_with_metadata context (request : update_certificate_request) =
    let input = Json_serializers.update_certificate_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata
      ~shape_name:"TransferService.UpdateCertificate" ~service ~context ~input
      ~output_deserializer:Json_deserializers.update_certificate_response_of_yojson
      ~error_deserializer
end

module UpdateAgreement = struct
  let error_to_string = function
    | `InternalServiceError _ -> "com.amazonaws.transfer#InternalServiceError"
    | `InvalidRequestException _ -> "com.amazonaws.transfer#InvalidRequestException"
    | `ResourceExistsException _ -> "com.amazonaws.transfer#ResourceExistsException"
    | `ResourceNotFoundException _ -> "com.amazonaws.transfer#ResourceNotFoundException"
    | `ServiceUnavailableException _ -> "com.amazonaws.transfer#ServiceUnavailableException"
    | `ThrottlingException _ -> "com.amazonaws.transfer#ThrottlingException"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "InternalServiceError" ->
          `InternalServiceError (Json_deserializers.internal_service_error_of_yojson tree path)
      | _, "InvalidRequestException" ->
          `InvalidRequestException
            (Json_deserializers.invalid_request_exception_of_yojson tree path)
      | _, "ResourceExistsException" ->
          `ResourceExistsException
            (Json_deserializers.resource_exists_exception_of_yojson tree path)
      | _, "ResourceNotFoundException" ->
          `ResourceNotFoundException
            (Json_deserializers.resource_not_found_exception_of_yojson tree path)
      | _, "ServiceUnavailableException" ->
          `ServiceUnavailableException
            (Json_deserializers.service_unavailable_exception_of_yojson tree path)
      | _, "ThrottlingException" ->
          `ThrottlingException (Json_deserializers.throttling_exception_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : update_agreement_request) =
    let input = Json_serializers.update_agreement_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"TransferService.UpdateAgreement" ~service
      ~context ~input ~output_deserializer:Json_deserializers.update_agreement_response_of_yojson
      ~error_deserializer

  let request_with_metadata context (request : update_agreement_request) =
    let input = Json_serializers.update_agreement_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata ~shape_name:"TransferService.UpdateAgreement"
      ~service ~context ~input
      ~output_deserializer:Json_deserializers.update_agreement_response_of_yojson
      ~error_deserializer
end

module UntagResource = struct
  let error_to_string = function
    | `InternalServiceError _ -> "com.amazonaws.transfer#InternalServiceError"
    | `InvalidRequestException _ -> "com.amazonaws.transfer#InvalidRequestException"
    | `ResourceNotFoundException _ -> "com.amazonaws.transfer#ResourceNotFoundException"
    | `ServiceUnavailableException _ -> "com.amazonaws.transfer#ServiceUnavailableException"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "InternalServiceError" ->
          `InternalServiceError (Json_deserializers.internal_service_error_of_yojson tree path)
      | _, "InvalidRequestException" ->
          `InvalidRequestException
            (Json_deserializers.invalid_request_exception_of_yojson tree path)
      | _, "ResourceNotFoundException" ->
          `ResourceNotFoundException
            (Json_deserializers.resource_not_found_exception_of_yojson tree path)
      | _, "ServiceUnavailableException" ->
          `ServiceUnavailableException
            (Json_deserializers.service_unavailable_exception_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : untag_resource_request) =
    let input = Json_serializers.untag_resource_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"TransferService.UntagResource" ~service
      ~context ~input ~output_deserializer:Smaws_Lib.Smithy_api.Json_deserializers.unit__of_yojson
      ~error_deserializer

  let request_with_metadata context (request : untag_resource_request) =
    let input = Json_serializers.untag_resource_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata ~shape_name:"TransferService.UntagResource"
      ~service ~context ~input
      ~output_deserializer:Smaws_Lib.Smithy_api.Json_deserializers.unit__of_yojson
      ~error_deserializer
end

module UpdateAccess = struct
  let error_to_string = function
    | `InternalServiceError _ -> "com.amazonaws.transfer#InternalServiceError"
    | `InvalidRequestException _ -> "com.amazonaws.transfer#InvalidRequestException"
    | `ResourceExistsException _ -> "com.amazonaws.transfer#ResourceExistsException"
    | `ResourceNotFoundException _ -> "com.amazonaws.transfer#ResourceNotFoundException"
    | `ServiceUnavailableException _ -> "com.amazonaws.transfer#ServiceUnavailableException"
    | `ThrottlingException _ -> "com.amazonaws.transfer#ThrottlingException"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "InternalServiceError" ->
          `InternalServiceError (Json_deserializers.internal_service_error_of_yojson tree path)
      | _, "InvalidRequestException" ->
          `InvalidRequestException
            (Json_deserializers.invalid_request_exception_of_yojson tree path)
      | _, "ResourceExistsException" ->
          `ResourceExistsException
            (Json_deserializers.resource_exists_exception_of_yojson tree path)
      | _, "ResourceNotFoundException" ->
          `ResourceNotFoundException
            (Json_deserializers.resource_not_found_exception_of_yojson tree path)
      | _, "ServiceUnavailableException" ->
          `ServiceUnavailableException
            (Json_deserializers.service_unavailable_exception_of_yojson tree path)
      | _, "ThrottlingException" ->
          `ThrottlingException (Json_deserializers.throttling_exception_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : update_access_request) =
    let input = Json_serializers.update_access_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"TransferService.UpdateAccess" ~service ~context
      ~input ~output_deserializer:Json_deserializers.update_access_response_of_yojson
      ~error_deserializer

  let request_with_metadata context (request : update_access_request) =
    let input = Json_serializers.update_access_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata ~shape_name:"TransferService.UpdateAccess"
      ~service ~context ~input
      ~output_deserializer:Json_deserializers.update_access_response_of_yojson ~error_deserializer
end

module UpdateHostKey = struct
  let error_to_string = function
    | `InternalServiceError _ -> "com.amazonaws.transfer#InternalServiceError"
    | `InvalidRequestException _ -> "com.amazonaws.transfer#InvalidRequestException"
    | `ResourceNotFoundException _ -> "com.amazonaws.transfer#ResourceNotFoundException"
    | `ServiceUnavailableException _ -> "com.amazonaws.transfer#ServiceUnavailableException"
    | `ThrottlingException _ -> "com.amazonaws.transfer#ThrottlingException"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "InternalServiceError" ->
          `InternalServiceError (Json_deserializers.internal_service_error_of_yojson tree path)
      | _, "InvalidRequestException" ->
          `InvalidRequestException
            (Json_deserializers.invalid_request_exception_of_yojson tree path)
      | _, "ResourceNotFoundException" ->
          `ResourceNotFoundException
            (Json_deserializers.resource_not_found_exception_of_yojson tree path)
      | _, "ServiceUnavailableException" ->
          `ServiceUnavailableException
            (Json_deserializers.service_unavailable_exception_of_yojson tree path)
      | _, "ThrottlingException" ->
          `ThrottlingException (Json_deserializers.throttling_exception_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : update_host_key_request) =
    let input = Json_serializers.update_host_key_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"TransferService.UpdateHostKey" ~service
      ~context ~input ~output_deserializer:Json_deserializers.update_host_key_response_of_yojson
      ~error_deserializer

  let request_with_metadata context (request : update_host_key_request) =
    let input = Json_serializers.update_host_key_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata ~shape_name:"TransferService.UpdateHostKey"
      ~service ~context ~input
      ~output_deserializer:Json_deserializers.update_host_key_response_of_yojson ~error_deserializer
end

module TestIdentityProvider = struct
  let error_to_string = function
    | `InternalServiceError _ -> "com.amazonaws.transfer#InternalServiceError"
    | `InvalidRequestException _ -> "com.amazonaws.transfer#InvalidRequestException"
    | `ResourceNotFoundException _ -> "com.amazonaws.transfer#ResourceNotFoundException"
    | `ServiceUnavailableException _ -> "com.amazonaws.transfer#ServiceUnavailableException"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "InternalServiceError" ->
          `InternalServiceError (Json_deserializers.internal_service_error_of_yojson tree path)
      | _, "InvalidRequestException" ->
          `InvalidRequestException
            (Json_deserializers.invalid_request_exception_of_yojson tree path)
      | _, "ResourceNotFoundException" ->
          `ResourceNotFoundException
            (Json_deserializers.resource_not_found_exception_of_yojson tree path)
      | _, "ServiceUnavailableException" ->
          `ServiceUnavailableException
            (Json_deserializers.service_unavailable_exception_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : test_identity_provider_request) =
    let input = Json_serializers.test_identity_provider_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"TransferService.TestIdentityProvider" ~service
      ~context ~input
      ~output_deserializer:Json_deserializers.test_identity_provider_response_of_yojson
      ~error_deserializer

  let request_with_metadata context (request : test_identity_provider_request) =
    let input = Json_serializers.test_identity_provider_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata
      ~shape_name:"TransferService.TestIdentityProvider" ~service ~context ~input
      ~output_deserializer:Json_deserializers.test_identity_provider_response_of_yojson
      ~error_deserializer
end

module TestConnection = struct
  let error_to_string = function
    | `InternalServiceError _ -> "com.amazonaws.transfer#InternalServiceError"
    | `InvalidRequestException _ -> "com.amazonaws.transfer#InvalidRequestException"
    | `ResourceNotFoundException _ -> "com.amazonaws.transfer#ResourceNotFoundException"
    | `ServiceUnavailableException _ -> "com.amazonaws.transfer#ServiceUnavailableException"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "InternalServiceError" ->
          `InternalServiceError (Json_deserializers.internal_service_error_of_yojson tree path)
      | _, "InvalidRequestException" ->
          `InvalidRequestException
            (Json_deserializers.invalid_request_exception_of_yojson tree path)
      | _, "ResourceNotFoundException" ->
          `ResourceNotFoundException
            (Json_deserializers.resource_not_found_exception_of_yojson tree path)
      | _, "ServiceUnavailableException" ->
          `ServiceUnavailableException
            (Json_deserializers.service_unavailable_exception_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : test_connection_request) =
    let input = Json_serializers.test_connection_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"TransferService.TestConnection" ~service
      ~context ~input ~output_deserializer:Json_deserializers.test_connection_response_of_yojson
      ~error_deserializer

  let request_with_metadata context (request : test_connection_request) =
    let input = Json_serializers.test_connection_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata ~shape_name:"TransferService.TestConnection"
      ~service ~context ~input
      ~output_deserializer:Json_deserializers.test_connection_response_of_yojson ~error_deserializer
end

module TagResource = struct
  let error_to_string = function
    | `InternalServiceError _ -> "com.amazonaws.transfer#InternalServiceError"
    | `InvalidRequestException _ -> "com.amazonaws.transfer#InvalidRequestException"
    | `ResourceNotFoundException _ -> "com.amazonaws.transfer#ResourceNotFoundException"
    | `ServiceUnavailableException _ -> "com.amazonaws.transfer#ServiceUnavailableException"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "InternalServiceError" ->
          `InternalServiceError (Json_deserializers.internal_service_error_of_yojson tree path)
      | _, "InvalidRequestException" ->
          `InvalidRequestException
            (Json_deserializers.invalid_request_exception_of_yojson tree path)
      | _, "ResourceNotFoundException" ->
          `ResourceNotFoundException
            (Json_deserializers.resource_not_found_exception_of_yojson tree path)
      | _, "ServiceUnavailableException" ->
          `ServiceUnavailableException
            (Json_deserializers.service_unavailable_exception_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : tag_resource_request) =
    let input = Json_serializers.tag_resource_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"TransferService.TagResource" ~service ~context
      ~input ~output_deserializer:Smaws_Lib.Smithy_api.Json_deserializers.unit__of_yojson
      ~error_deserializer

  let request_with_metadata context (request : tag_resource_request) =
    let input = Json_serializers.tag_resource_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata ~shape_name:"TransferService.TagResource"
      ~service ~context ~input
      ~output_deserializer:Smaws_Lib.Smithy_api.Json_deserializers.unit__of_yojson
      ~error_deserializer
end

module StopServer = struct
  let error_to_string = function
    | `InternalServiceError _ -> "com.amazonaws.transfer#InternalServiceError"
    | `InvalidRequestException _ -> "com.amazonaws.transfer#InvalidRequestException"
    | `ResourceNotFoundException _ -> "com.amazonaws.transfer#ResourceNotFoundException"
    | `ServiceUnavailableException _ -> "com.amazonaws.transfer#ServiceUnavailableException"
    | `ThrottlingException _ -> "com.amazonaws.transfer#ThrottlingException"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "InternalServiceError" ->
          `InternalServiceError (Json_deserializers.internal_service_error_of_yojson tree path)
      | _, "InvalidRequestException" ->
          `InvalidRequestException
            (Json_deserializers.invalid_request_exception_of_yojson tree path)
      | _, "ResourceNotFoundException" ->
          `ResourceNotFoundException
            (Json_deserializers.resource_not_found_exception_of_yojson tree path)
      | _, "ServiceUnavailableException" ->
          `ServiceUnavailableException
            (Json_deserializers.service_unavailable_exception_of_yojson tree path)
      | _, "ThrottlingException" ->
          `ThrottlingException (Json_deserializers.throttling_exception_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : stop_server_request) =
    let input = Json_serializers.stop_server_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"TransferService.StopServer" ~service ~context
      ~input ~output_deserializer:Smaws_Lib.Smithy_api.Json_deserializers.unit__of_yojson
      ~error_deserializer

  let request_with_metadata context (request : stop_server_request) =
    let input = Json_serializers.stop_server_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata ~shape_name:"TransferService.StopServer"
      ~service ~context ~input
      ~output_deserializer:Smaws_Lib.Smithy_api.Json_deserializers.unit__of_yojson
      ~error_deserializer
end

module StartServer = struct
  let error_to_string = function
    | `InternalServiceError _ -> "com.amazonaws.transfer#InternalServiceError"
    | `InvalidRequestException _ -> "com.amazonaws.transfer#InvalidRequestException"
    | `ResourceNotFoundException _ -> "com.amazonaws.transfer#ResourceNotFoundException"
    | `ServiceUnavailableException _ -> "com.amazonaws.transfer#ServiceUnavailableException"
    | `ThrottlingException _ -> "com.amazonaws.transfer#ThrottlingException"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "InternalServiceError" ->
          `InternalServiceError (Json_deserializers.internal_service_error_of_yojson tree path)
      | _, "InvalidRequestException" ->
          `InvalidRequestException
            (Json_deserializers.invalid_request_exception_of_yojson tree path)
      | _, "ResourceNotFoundException" ->
          `ResourceNotFoundException
            (Json_deserializers.resource_not_found_exception_of_yojson tree path)
      | _, "ServiceUnavailableException" ->
          `ServiceUnavailableException
            (Json_deserializers.service_unavailable_exception_of_yojson tree path)
      | _, "ThrottlingException" ->
          `ThrottlingException (Json_deserializers.throttling_exception_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : start_server_request) =
    let input = Json_serializers.start_server_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"TransferService.StartServer" ~service ~context
      ~input ~output_deserializer:Smaws_Lib.Smithy_api.Json_deserializers.unit__of_yojson
      ~error_deserializer

  let request_with_metadata context (request : start_server_request) =
    let input = Json_serializers.start_server_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata ~shape_name:"TransferService.StartServer"
      ~service ~context ~input
      ~output_deserializer:Smaws_Lib.Smithy_api.Json_deserializers.unit__of_yojson
      ~error_deserializer
end

module StartRemoteMove = struct
  let error_to_string = function
    | `InternalServiceError _ -> "com.amazonaws.transfer#InternalServiceError"
    | `InvalidRequestException _ -> "com.amazonaws.transfer#InvalidRequestException"
    | `ResourceNotFoundException _ -> "com.amazonaws.transfer#ResourceNotFoundException"
    | `ServiceUnavailableException _ -> "com.amazonaws.transfer#ServiceUnavailableException"
    | `ThrottlingException _ -> "com.amazonaws.transfer#ThrottlingException"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "InternalServiceError" ->
          `InternalServiceError (Json_deserializers.internal_service_error_of_yojson tree path)
      | _, "InvalidRequestException" ->
          `InvalidRequestException
            (Json_deserializers.invalid_request_exception_of_yojson tree path)
      | _, "ResourceNotFoundException" ->
          `ResourceNotFoundException
            (Json_deserializers.resource_not_found_exception_of_yojson tree path)
      | _, "ServiceUnavailableException" ->
          `ServiceUnavailableException
            (Json_deserializers.service_unavailable_exception_of_yojson tree path)
      | _, "ThrottlingException" ->
          `ThrottlingException (Json_deserializers.throttling_exception_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : start_remote_move_request) =
    let input = Json_serializers.start_remote_move_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"TransferService.StartRemoteMove" ~service
      ~context ~input ~output_deserializer:Json_deserializers.start_remote_move_response_of_yojson
      ~error_deserializer

  let request_with_metadata context (request : start_remote_move_request) =
    let input = Json_serializers.start_remote_move_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata ~shape_name:"TransferService.StartRemoteMove"
      ~service ~context ~input
      ~output_deserializer:Json_deserializers.start_remote_move_response_of_yojson
      ~error_deserializer
end

module StartRemoteDelete = struct
  let error_to_string = function
    | `InternalServiceError _ -> "com.amazonaws.transfer#InternalServiceError"
    | `InvalidRequestException _ -> "com.amazonaws.transfer#InvalidRequestException"
    | `ResourceNotFoundException _ -> "com.amazonaws.transfer#ResourceNotFoundException"
    | `ServiceUnavailableException _ -> "com.amazonaws.transfer#ServiceUnavailableException"
    | `ThrottlingException _ -> "com.amazonaws.transfer#ThrottlingException"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "InternalServiceError" ->
          `InternalServiceError (Json_deserializers.internal_service_error_of_yojson tree path)
      | _, "InvalidRequestException" ->
          `InvalidRequestException
            (Json_deserializers.invalid_request_exception_of_yojson tree path)
      | _, "ResourceNotFoundException" ->
          `ResourceNotFoundException
            (Json_deserializers.resource_not_found_exception_of_yojson tree path)
      | _, "ServiceUnavailableException" ->
          `ServiceUnavailableException
            (Json_deserializers.service_unavailable_exception_of_yojson tree path)
      | _, "ThrottlingException" ->
          `ThrottlingException (Json_deserializers.throttling_exception_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : start_remote_delete_request) =
    let input = Json_serializers.start_remote_delete_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"TransferService.StartRemoteDelete" ~service
      ~context ~input ~output_deserializer:Json_deserializers.start_remote_delete_response_of_yojson
      ~error_deserializer

  let request_with_metadata context (request : start_remote_delete_request) =
    let input = Json_serializers.start_remote_delete_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata
      ~shape_name:"TransferService.StartRemoteDelete" ~service ~context ~input
      ~output_deserializer:Json_deserializers.start_remote_delete_response_of_yojson
      ~error_deserializer
end

module StartFileTransfer = struct
  let error_to_string = function
    | `InternalServiceError _ -> "com.amazonaws.transfer#InternalServiceError"
    | `InvalidRequestException _ -> "com.amazonaws.transfer#InvalidRequestException"
    | `ResourceNotFoundException _ -> "com.amazonaws.transfer#ResourceNotFoundException"
    | `ServiceUnavailableException _ -> "com.amazonaws.transfer#ServiceUnavailableException"
    | `ThrottlingException _ -> "com.amazonaws.transfer#ThrottlingException"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "InternalServiceError" ->
          `InternalServiceError (Json_deserializers.internal_service_error_of_yojson tree path)
      | _, "InvalidRequestException" ->
          `InvalidRequestException
            (Json_deserializers.invalid_request_exception_of_yojson tree path)
      | _, "ResourceNotFoundException" ->
          `ResourceNotFoundException
            (Json_deserializers.resource_not_found_exception_of_yojson tree path)
      | _, "ServiceUnavailableException" ->
          `ServiceUnavailableException
            (Json_deserializers.service_unavailable_exception_of_yojson tree path)
      | _, "ThrottlingException" ->
          `ThrottlingException (Json_deserializers.throttling_exception_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : start_file_transfer_request) =
    let input = Json_serializers.start_file_transfer_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"TransferService.StartFileTransfer" ~service
      ~context ~input ~output_deserializer:Json_deserializers.start_file_transfer_response_of_yojson
      ~error_deserializer

  let request_with_metadata context (request : start_file_transfer_request) =
    let input = Json_serializers.start_file_transfer_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata
      ~shape_name:"TransferService.StartFileTransfer" ~service ~context ~input
      ~output_deserializer:Json_deserializers.start_file_transfer_response_of_yojson
      ~error_deserializer
end

module StartDirectoryListing = struct
  let error_to_string = function
    | `InternalServiceError _ -> "com.amazonaws.transfer#InternalServiceError"
    | `InvalidRequestException _ -> "com.amazonaws.transfer#InvalidRequestException"
    | `ResourceNotFoundException _ -> "com.amazonaws.transfer#ResourceNotFoundException"
    | `ServiceUnavailableException _ -> "com.amazonaws.transfer#ServiceUnavailableException"
    | `ThrottlingException _ -> "com.amazonaws.transfer#ThrottlingException"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "InternalServiceError" ->
          `InternalServiceError (Json_deserializers.internal_service_error_of_yojson tree path)
      | _, "InvalidRequestException" ->
          `InvalidRequestException
            (Json_deserializers.invalid_request_exception_of_yojson tree path)
      | _, "ResourceNotFoundException" ->
          `ResourceNotFoundException
            (Json_deserializers.resource_not_found_exception_of_yojson tree path)
      | _, "ServiceUnavailableException" ->
          `ServiceUnavailableException
            (Json_deserializers.service_unavailable_exception_of_yojson tree path)
      | _, "ThrottlingException" ->
          `ThrottlingException (Json_deserializers.throttling_exception_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : start_directory_listing_request) =
    let input = Json_serializers.start_directory_listing_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"TransferService.StartDirectoryListing" ~service
      ~context ~input
      ~output_deserializer:Json_deserializers.start_directory_listing_response_of_yojson
      ~error_deserializer

  let request_with_metadata context (request : start_directory_listing_request) =
    let input = Json_serializers.start_directory_listing_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata
      ~shape_name:"TransferService.StartDirectoryListing" ~service ~context ~input
      ~output_deserializer:Json_deserializers.start_directory_listing_response_of_yojson
      ~error_deserializer
end

module SendWorkflowStepState = struct
  let error_to_string = function
    | `AccessDeniedException _ -> "com.amazonaws.transfer#AccessDeniedException"
    | `InternalServiceError _ -> "com.amazonaws.transfer#InternalServiceError"
    | `InvalidRequestException _ -> "com.amazonaws.transfer#InvalidRequestException"
    | `ResourceNotFoundException _ -> "com.amazonaws.transfer#ResourceNotFoundException"
    | `ServiceUnavailableException _ -> "com.amazonaws.transfer#ServiceUnavailableException"
    | `ThrottlingException _ -> "com.amazonaws.transfer#ThrottlingException"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "AccessDeniedException" ->
          `AccessDeniedException (Json_deserializers.access_denied_exception_of_yojson tree path)
      | _, "InternalServiceError" ->
          `InternalServiceError (Json_deserializers.internal_service_error_of_yojson tree path)
      | _, "InvalidRequestException" ->
          `InvalidRequestException
            (Json_deserializers.invalid_request_exception_of_yojson tree path)
      | _, "ResourceNotFoundException" ->
          `ResourceNotFoundException
            (Json_deserializers.resource_not_found_exception_of_yojson tree path)
      | _, "ServiceUnavailableException" ->
          `ServiceUnavailableException
            (Json_deserializers.service_unavailable_exception_of_yojson tree path)
      | _, "ThrottlingException" ->
          `ThrottlingException (Json_deserializers.throttling_exception_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : send_workflow_step_state_request) =
    let input = Json_serializers.send_workflow_step_state_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"TransferService.SendWorkflowStepState" ~service
      ~context ~input
      ~output_deserializer:Json_deserializers.send_workflow_step_state_response_of_yojson
      ~error_deserializer

  let request_with_metadata context (request : send_workflow_step_state_request) =
    let input = Json_serializers.send_workflow_step_state_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata
      ~shape_name:"TransferService.SendWorkflowStepState" ~service ~context ~input
      ~output_deserializer:Json_deserializers.send_workflow_step_state_response_of_yojson
      ~error_deserializer
end

module ListWorkflows = struct
  let error_to_string = function
    | `InternalServiceError _ -> "com.amazonaws.transfer#InternalServiceError"
    | `InvalidNextTokenException _ -> "com.amazonaws.transfer#InvalidNextTokenException"
    | `InvalidRequestException _ -> "com.amazonaws.transfer#InvalidRequestException"
    | `ServiceUnavailableException _ -> "com.amazonaws.transfer#ServiceUnavailableException"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "InternalServiceError" ->
          `InternalServiceError (Json_deserializers.internal_service_error_of_yojson tree path)
      | _, "InvalidNextTokenException" ->
          `InvalidNextTokenException
            (Json_deserializers.invalid_next_token_exception_of_yojson tree path)
      | _, "InvalidRequestException" ->
          `InvalidRequestException
            (Json_deserializers.invalid_request_exception_of_yojson tree path)
      | _, "ServiceUnavailableException" ->
          `ServiceUnavailableException
            (Json_deserializers.service_unavailable_exception_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : list_workflows_request) =
    let input = Json_serializers.list_workflows_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"TransferService.ListWorkflows" ~service
      ~context ~input ~output_deserializer:Json_deserializers.list_workflows_response_of_yojson
      ~error_deserializer

  let request_with_metadata context (request : list_workflows_request) =
    let input = Json_serializers.list_workflows_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata ~shape_name:"TransferService.ListWorkflows"
      ~service ~context ~input
      ~output_deserializer:Json_deserializers.list_workflows_response_of_yojson ~error_deserializer
end

module ListWebApps = struct
  let error_to_string = function
    | `InternalServiceError _ -> "com.amazonaws.transfer#InternalServiceError"
    | `InvalidNextTokenException _ -> "com.amazonaws.transfer#InvalidNextTokenException"
    | `InvalidRequestException _ -> "com.amazonaws.transfer#InvalidRequestException"
    | `ThrottlingException _ -> "com.amazonaws.transfer#ThrottlingException"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "InternalServiceError" ->
          `InternalServiceError (Json_deserializers.internal_service_error_of_yojson tree path)
      | _, "InvalidNextTokenException" ->
          `InvalidNextTokenException
            (Json_deserializers.invalid_next_token_exception_of_yojson tree path)
      | _, "InvalidRequestException" ->
          `InvalidRequestException
            (Json_deserializers.invalid_request_exception_of_yojson tree path)
      | _, "ThrottlingException" ->
          `ThrottlingException (Json_deserializers.throttling_exception_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : list_web_apps_request) =
    let input = Json_serializers.list_web_apps_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"TransferService.ListWebApps" ~service ~context
      ~input ~output_deserializer:Json_deserializers.list_web_apps_response_of_yojson
      ~error_deserializer

  let request_with_metadata context (request : list_web_apps_request) =
    let input = Json_serializers.list_web_apps_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata ~shape_name:"TransferService.ListWebApps"
      ~service ~context ~input
      ~output_deserializer:Json_deserializers.list_web_apps_response_of_yojson ~error_deserializer
end

module ListUsers = struct
  let error_to_string = function
    | `InternalServiceError _ -> "com.amazonaws.transfer#InternalServiceError"
    | `InvalidNextTokenException _ -> "com.amazonaws.transfer#InvalidNextTokenException"
    | `InvalidRequestException _ -> "com.amazonaws.transfer#InvalidRequestException"
    | `ResourceNotFoundException _ -> "com.amazonaws.transfer#ResourceNotFoundException"
    | `ServiceUnavailableException _ -> "com.amazonaws.transfer#ServiceUnavailableException"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "InternalServiceError" ->
          `InternalServiceError (Json_deserializers.internal_service_error_of_yojson tree path)
      | _, "InvalidNextTokenException" ->
          `InvalidNextTokenException
            (Json_deserializers.invalid_next_token_exception_of_yojson tree path)
      | _, "InvalidRequestException" ->
          `InvalidRequestException
            (Json_deserializers.invalid_request_exception_of_yojson tree path)
      | _, "ResourceNotFoundException" ->
          `ResourceNotFoundException
            (Json_deserializers.resource_not_found_exception_of_yojson tree path)
      | _, "ServiceUnavailableException" ->
          `ServiceUnavailableException
            (Json_deserializers.service_unavailable_exception_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : list_users_request) =
    let input = Json_serializers.list_users_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"TransferService.ListUsers" ~service ~context
      ~input ~output_deserializer:Json_deserializers.list_users_response_of_yojson
      ~error_deserializer

  let request_with_metadata context (request : list_users_request) =
    let input = Json_serializers.list_users_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata ~shape_name:"TransferService.ListUsers"
      ~service ~context ~input ~output_deserializer:Json_deserializers.list_users_response_of_yojson
      ~error_deserializer
end

module ListTagsForResource = struct
  let error_to_string = function
    | `InternalServiceError _ -> "com.amazonaws.transfer#InternalServiceError"
    | `InvalidNextTokenException _ -> "com.amazonaws.transfer#InvalidNextTokenException"
    | `InvalidRequestException _ -> "com.amazonaws.transfer#InvalidRequestException"
    | `ServiceUnavailableException _ -> "com.amazonaws.transfer#ServiceUnavailableException"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "InternalServiceError" ->
          `InternalServiceError (Json_deserializers.internal_service_error_of_yojson tree path)
      | _, "InvalidNextTokenException" ->
          `InvalidNextTokenException
            (Json_deserializers.invalid_next_token_exception_of_yojson tree path)
      | _, "InvalidRequestException" ->
          `InvalidRequestException
            (Json_deserializers.invalid_request_exception_of_yojson tree path)
      | _, "ServiceUnavailableException" ->
          `ServiceUnavailableException
            (Json_deserializers.service_unavailable_exception_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : list_tags_for_resource_request) =
    let input = Json_serializers.list_tags_for_resource_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"TransferService.ListTagsForResource" ~service
      ~context ~input
      ~output_deserializer:Json_deserializers.list_tags_for_resource_response_of_yojson
      ~error_deserializer

  let request_with_metadata context (request : list_tags_for_resource_request) =
    let input = Json_serializers.list_tags_for_resource_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata
      ~shape_name:"TransferService.ListTagsForResource" ~service ~context ~input
      ~output_deserializer:Json_deserializers.list_tags_for_resource_response_of_yojson
      ~error_deserializer
end

module ListServers = struct
  let error_to_string = function
    | `InternalServiceError _ -> "com.amazonaws.transfer#InternalServiceError"
    | `InvalidNextTokenException _ -> "com.amazonaws.transfer#InvalidNextTokenException"
    | `InvalidRequestException _ -> "com.amazonaws.transfer#InvalidRequestException"
    | `ServiceUnavailableException _ -> "com.amazonaws.transfer#ServiceUnavailableException"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "InternalServiceError" ->
          `InternalServiceError (Json_deserializers.internal_service_error_of_yojson tree path)
      | _, "InvalidNextTokenException" ->
          `InvalidNextTokenException
            (Json_deserializers.invalid_next_token_exception_of_yojson tree path)
      | _, "InvalidRequestException" ->
          `InvalidRequestException
            (Json_deserializers.invalid_request_exception_of_yojson tree path)
      | _, "ServiceUnavailableException" ->
          `ServiceUnavailableException
            (Json_deserializers.service_unavailable_exception_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : list_servers_request) =
    let input = Json_serializers.list_servers_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"TransferService.ListServers" ~service ~context
      ~input ~output_deserializer:Json_deserializers.list_servers_response_of_yojson
      ~error_deserializer

  let request_with_metadata context (request : list_servers_request) =
    let input = Json_serializers.list_servers_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata ~shape_name:"TransferService.ListServers"
      ~service ~context ~input
      ~output_deserializer:Json_deserializers.list_servers_response_of_yojson ~error_deserializer
end

module ListSecurityPolicies = struct
  let error_to_string = function
    | `InternalServiceError _ -> "com.amazonaws.transfer#InternalServiceError"
    | `InvalidNextTokenException _ -> "com.amazonaws.transfer#InvalidNextTokenException"
    | `InvalidRequestException _ -> "com.amazonaws.transfer#InvalidRequestException"
    | `ServiceUnavailableException _ -> "com.amazonaws.transfer#ServiceUnavailableException"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "InternalServiceError" ->
          `InternalServiceError (Json_deserializers.internal_service_error_of_yojson tree path)
      | _, "InvalidNextTokenException" ->
          `InvalidNextTokenException
            (Json_deserializers.invalid_next_token_exception_of_yojson tree path)
      | _, "InvalidRequestException" ->
          `InvalidRequestException
            (Json_deserializers.invalid_request_exception_of_yojson tree path)
      | _, "ServiceUnavailableException" ->
          `ServiceUnavailableException
            (Json_deserializers.service_unavailable_exception_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : list_security_policies_request) =
    let input = Json_serializers.list_security_policies_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"TransferService.ListSecurityPolicies" ~service
      ~context ~input
      ~output_deserializer:Json_deserializers.list_security_policies_response_of_yojson
      ~error_deserializer

  let request_with_metadata context (request : list_security_policies_request) =
    let input = Json_serializers.list_security_policies_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata
      ~shape_name:"TransferService.ListSecurityPolicies" ~service ~context ~input
      ~output_deserializer:Json_deserializers.list_security_policies_response_of_yojson
      ~error_deserializer
end

module ListProfiles = struct
  let error_to_string = function
    | `InternalServiceError _ -> "com.amazonaws.transfer#InternalServiceError"
    | `InvalidNextTokenException _ -> "com.amazonaws.transfer#InvalidNextTokenException"
    | `InvalidRequestException _ -> "com.amazonaws.transfer#InvalidRequestException"
    | `ResourceNotFoundException _ -> "com.amazonaws.transfer#ResourceNotFoundException"
    | `ServiceUnavailableException _ -> "com.amazonaws.transfer#ServiceUnavailableException"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "InternalServiceError" ->
          `InternalServiceError (Json_deserializers.internal_service_error_of_yojson tree path)
      | _, "InvalidNextTokenException" ->
          `InvalidNextTokenException
            (Json_deserializers.invalid_next_token_exception_of_yojson tree path)
      | _, "InvalidRequestException" ->
          `InvalidRequestException
            (Json_deserializers.invalid_request_exception_of_yojson tree path)
      | _, "ResourceNotFoundException" ->
          `ResourceNotFoundException
            (Json_deserializers.resource_not_found_exception_of_yojson tree path)
      | _, "ServiceUnavailableException" ->
          `ServiceUnavailableException
            (Json_deserializers.service_unavailable_exception_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : list_profiles_request) =
    let input = Json_serializers.list_profiles_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"TransferService.ListProfiles" ~service ~context
      ~input ~output_deserializer:Json_deserializers.list_profiles_response_of_yojson
      ~error_deserializer

  let request_with_metadata context (request : list_profiles_request) =
    let input = Json_serializers.list_profiles_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata ~shape_name:"TransferService.ListProfiles"
      ~service ~context ~input
      ~output_deserializer:Json_deserializers.list_profiles_response_of_yojson ~error_deserializer
end

module ListHostKeys = struct
  let error_to_string = function
    | `InternalServiceError _ -> "com.amazonaws.transfer#InternalServiceError"
    | `InvalidNextTokenException _ -> "com.amazonaws.transfer#InvalidNextTokenException"
    | `InvalidRequestException _ -> "com.amazonaws.transfer#InvalidRequestException"
    | `ResourceNotFoundException _ -> "com.amazonaws.transfer#ResourceNotFoundException"
    | `ServiceUnavailableException _ -> "com.amazonaws.transfer#ServiceUnavailableException"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "InternalServiceError" ->
          `InternalServiceError (Json_deserializers.internal_service_error_of_yojson tree path)
      | _, "InvalidNextTokenException" ->
          `InvalidNextTokenException
            (Json_deserializers.invalid_next_token_exception_of_yojson tree path)
      | _, "InvalidRequestException" ->
          `InvalidRequestException
            (Json_deserializers.invalid_request_exception_of_yojson tree path)
      | _, "ResourceNotFoundException" ->
          `ResourceNotFoundException
            (Json_deserializers.resource_not_found_exception_of_yojson tree path)
      | _, "ServiceUnavailableException" ->
          `ServiceUnavailableException
            (Json_deserializers.service_unavailable_exception_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : list_host_keys_request) =
    let input = Json_serializers.list_host_keys_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"TransferService.ListHostKeys" ~service ~context
      ~input ~output_deserializer:Json_deserializers.list_host_keys_response_of_yojson
      ~error_deserializer

  let request_with_metadata context (request : list_host_keys_request) =
    let input = Json_serializers.list_host_keys_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata ~shape_name:"TransferService.ListHostKeys"
      ~service ~context ~input
      ~output_deserializer:Json_deserializers.list_host_keys_response_of_yojson ~error_deserializer
end

module ListFileTransferResults = struct
  let error_to_string = function
    | `InternalServiceError _ -> "com.amazonaws.transfer#InternalServiceError"
    | `InvalidRequestException _ -> "com.amazonaws.transfer#InvalidRequestException"
    | `ResourceNotFoundException _ -> "com.amazonaws.transfer#ResourceNotFoundException"
    | `ServiceUnavailableException _ -> "com.amazonaws.transfer#ServiceUnavailableException"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "InternalServiceError" ->
          `InternalServiceError (Json_deserializers.internal_service_error_of_yojson tree path)
      | _, "InvalidRequestException" ->
          `InvalidRequestException
            (Json_deserializers.invalid_request_exception_of_yojson tree path)
      | _, "ResourceNotFoundException" ->
          `ResourceNotFoundException
            (Json_deserializers.resource_not_found_exception_of_yojson tree path)
      | _, "ServiceUnavailableException" ->
          `ServiceUnavailableException
            (Json_deserializers.service_unavailable_exception_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : list_file_transfer_results_request) =
    let input = Json_serializers.list_file_transfer_results_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"TransferService.ListFileTransferResults"
      ~service ~context ~input
      ~output_deserializer:Json_deserializers.list_file_transfer_results_response_of_yojson
      ~error_deserializer

  let request_with_metadata context (request : list_file_transfer_results_request) =
    let input = Json_serializers.list_file_transfer_results_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata
      ~shape_name:"TransferService.ListFileTransferResults" ~service ~context ~input
      ~output_deserializer:Json_deserializers.list_file_transfer_results_response_of_yojson
      ~error_deserializer
end

module ListExecutions = struct
  let error_to_string = function
    | `InternalServiceError _ -> "com.amazonaws.transfer#InternalServiceError"
    | `InvalidNextTokenException _ -> "com.amazonaws.transfer#InvalidNextTokenException"
    | `InvalidRequestException _ -> "com.amazonaws.transfer#InvalidRequestException"
    | `ResourceNotFoundException _ -> "com.amazonaws.transfer#ResourceNotFoundException"
    | `ServiceUnavailableException _ -> "com.amazonaws.transfer#ServiceUnavailableException"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "InternalServiceError" ->
          `InternalServiceError (Json_deserializers.internal_service_error_of_yojson tree path)
      | _, "InvalidNextTokenException" ->
          `InvalidNextTokenException
            (Json_deserializers.invalid_next_token_exception_of_yojson tree path)
      | _, "InvalidRequestException" ->
          `InvalidRequestException
            (Json_deserializers.invalid_request_exception_of_yojson tree path)
      | _, "ResourceNotFoundException" ->
          `ResourceNotFoundException
            (Json_deserializers.resource_not_found_exception_of_yojson tree path)
      | _, "ServiceUnavailableException" ->
          `ServiceUnavailableException
            (Json_deserializers.service_unavailable_exception_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : list_executions_request) =
    let input = Json_serializers.list_executions_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"TransferService.ListExecutions" ~service
      ~context ~input ~output_deserializer:Json_deserializers.list_executions_response_of_yojson
      ~error_deserializer

  let request_with_metadata context (request : list_executions_request) =
    let input = Json_serializers.list_executions_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata ~shape_name:"TransferService.ListExecutions"
      ~service ~context ~input
      ~output_deserializer:Json_deserializers.list_executions_response_of_yojson ~error_deserializer
end

module ListConnectors = struct
  let error_to_string = function
    | `InternalServiceError _ -> "com.amazonaws.transfer#InternalServiceError"
    | `InvalidNextTokenException _ -> "com.amazonaws.transfer#InvalidNextTokenException"
    | `InvalidRequestException _ -> "com.amazonaws.transfer#InvalidRequestException"
    | `ResourceNotFoundException _ -> "com.amazonaws.transfer#ResourceNotFoundException"
    | `ServiceUnavailableException _ -> "com.amazonaws.transfer#ServiceUnavailableException"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "InternalServiceError" ->
          `InternalServiceError (Json_deserializers.internal_service_error_of_yojson tree path)
      | _, "InvalidNextTokenException" ->
          `InvalidNextTokenException
            (Json_deserializers.invalid_next_token_exception_of_yojson tree path)
      | _, "InvalidRequestException" ->
          `InvalidRequestException
            (Json_deserializers.invalid_request_exception_of_yojson tree path)
      | _, "ResourceNotFoundException" ->
          `ResourceNotFoundException
            (Json_deserializers.resource_not_found_exception_of_yojson tree path)
      | _, "ServiceUnavailableException" ->
          `ServiceUnavailableException
            (Json_deserializers.service_unavailable_exception_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : list_connectors_request) =
    let input = Json_serializers.list_connectors_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"TransferService.ListConnectors" ~service
      ~context ~input ~output_deserializer:Json_deserializers.list_connectors_response_of_yojson
      ~error_deserializer

  let request_with_metadata context (request : list_connectors_request) =
    let input = Json_serializers.list_connectors_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata ~shape_name:"TransferService.ListConnectors"
      ~service ~context ~input
      ~output_deserializer:Json_deserializers.list_connectors_response_of_yojson ~error_deserializer
end

module ListCertificates = struct
  let error_to_string = function
    | `InternalServiceError _ -> "com.amazonaws.transfer#InternalServiceError"
    | `InvalidNextTokenException _ -> "com.amazonaws.transfer#InvalidNextTokenException"
    | `InvalidRequestException _ -> "com.amazonaws.transfer#InvalidRequestException"
    | `ResourceNotFoundException _ -> "com.amazonaws.transfer#ResourceNotFoundException"
    | `ServiceUnavailableException _ -> "com.amazonaws.transfer#ServiceUnavailableException"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "InternalServiceError" ->
          `InternalServiceError (Json_deserializers.internal_service_error_of_yojson tree path)
      | _, "InvalidNextTokenException" ->
          `InvalidNextTokenException
            (Json_deserializers.invalid_next_token_exception_of_yojson tree path)
      | _, "InvalidRequestException" ->
          `InvalidRequestException
            (Json_deserializers.invalid_request_exception_of_yojson tree path)
      | _, "ResourceNotFoundException" ->
          `ResourceNotFoundException
            (Json_deserializers.resource_not_found_exception_of_yojson tree path)
      | _, "ServiceUnavailableException" ->
          `ServiceUnavailableException
            (Json_deserializers.service_unavailable_exception_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : list_certificates_request) =
    let input = Json_serializers.list_certificates_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"TransferService.ListCertificates" ~service
      ~context ~input ~output_deserializer:Json_deserializers.list_certificates_response_of_yojson
      ~error_deserializer

  let request_with_metadata context (request : list_certificates_request) =
    let input = Json_serializers.list_certificates_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata ~shape_name:"TransferService.ListCertificates"
      ~service ~context ~input
      ~output_deserializer:Json_deserializers.list_certificates_response_of_yojson
      ~error_deserializer
end

module ListAgreements = struct
  let error_to_string = function
    | `InternalServiceError _ -> "com.amazonaws.transfer#InternalServiceError"
    | `InvalidNextTokenException _ -> "com.amazonaws.transfer#InvalidNextTokenException"
    | `InvalidRequestException _ -> "com.amazonaws.transfer#InvalidRequestException"
    | `ResourceNotFoundException _ -> "com.amazonaws.transfer#ResourceNotFoundException"
    | `ServiceUnavailableException _ -> "com.amazonaws.transfer#ServiceUnavailableException"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "InternalServiceError" ->
          `InternalServiceError (Json_deserializers.internal_service_error_of_yojson tree path)
      | _, "InvalidNextTokenException" ->
          `InvalidNextTokenException
            (Json_deserializers.invalid_next_token_exception_of_yojson tree path)
      | _, "InvalidRequestException" ->
          `InvalidRequestException
            (Json_deserializers.invalid_request_exception_of_yojson tree path)
      | _, "ResourceNotFoundException" ->
          `ResourceNotFoundException
            (Json_deserializers.resource_not_found_exception_of_yojson tree path)
      | _, "ServiceUnavailableException" ->
          `ServiceUnavailableException
            (Json_deserializers.service_unavailable_exception_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : list_agreements_request) =
    let input = Json_serializers.list_agreements_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"TransferService.ListAgreements" ~service
      ~context ~input ~output_deserializer:Json_deserializers.list_agreements_response_of_yojson
      ~error_deserializer

  let request_with_metadata context (request : list_agreements_request) =
    let input = Json_serializers.list_agreements_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata ~shape_name:"TransferService.ListAgreements"
      ~service ~context ~input
      ~output_deserializer:Json_deserializers.list_agreements_response_of_yojson ~error_deserializer
end

module ListAccesses = struct
  let error_to_string = function
    | `InternalServiceError _ -> "com.amazonaws.transfer#InternalServiceError"
    | `InvalidNextTokenException _ -> "com.amazonaws.transfer#InvalidNextTokenException"
    | `InvalidRequestException _ -> "com.amazonaws.transfer#InvalidRequestException"
    | `ResourceNotFoundException _ -> "com.amazonaws.transfer#ResourceNotFoundException"
    | `ServiceUnavailableException _ -> "com.amazonaws.transfer#ServiceUnavailableException"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "InternalServiceError" ->
          `InternalServiceError (Json_deserializers.internal_service_error_of_yojson tree path)
      | _, "InvalidNextTokenException" ->
          `InvalidNextTokenException
            (Json_deserializers.invalid_next_token_exception_of_yojson tree path)
      | _, "InvalidRequestException" ->
          `InvalidRequestException
            (Json_deserializers.invalid_request_exception_of_yojson tree path)
      | _, "ResourceNotFoundException" ->
          `ResourceNotFoundException
            (Json_deserializers.resource_not_found_exception_of_yojson tree path)
      | _, "ServiceUnavailableException" ->
          `ServiceUnavailableException
            (Json_deserializers.service_unavailable_exception_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : list_accesses_request) =
    let input = Json_serializers.list_accesses_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"TransferService.ListAccesses" ~service ~context
      ~input ~output_deserializer:Json_deserializers.list_accesses_response_of_yojson
      ~error_deserializer

  let request_with_metadata context (request : list_accesses_request) =
    let input = Json_serializers.list_accesses_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata ~shape_name:"TransferService.ListAccesses"
      ~service ~context ~input
      ~output_deserializer:Json_deserializers.list_accesses_response_of_yojson ~error_deserializer
end

module ImportSshPublicKey = struct
  let error_to_string = function
    | `InternalServiceError _ -> "com.amazonaws.transfer#InternalServiceError"
    | `InvalidRequestException _ -> "com.amazonaws.transfer#InvalidRequestException"
    | `ResourceExistsException _ -> "com.amazonaws.transfer#ResourceExistsException"
    | `ResourceNotFoundException _ -> "com.amazonaws.transfer#ResourceNotFoundException"
    | `ServiceUnavailableException _ -> "com.amazonaws.transfer#ServiceUnavailableException"
    | `ThrottlingException _ -> "com.amazonaws.transfer#ThrottlingException"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "InternalServiceError" ->
          `InternalServiceError (Json_deserializers.internal_service_error_of_yojson tree path)
      | _, "InvalidRequestException" ->
          `InvalidRequestException
            (Json_deserializers.invalid_request_exception_of_yojson tree path)
      | _, "ResourceExistsException" ->
          `ResourceExistsException
            (Json_deserializers.resource_exists_exception_of_yojson tree path)
      | _, "ResourceNotFoundException" ->
          `ResourceNotFoundException
            (Json_deserializers.resource_not_found_exception_of_yojson tree path)
      | _, "ServiceUnavailableException" ->
          `ServiceUnavailableException
            (Json_deserializers.service_unavailable_exception_of_yojson tree path)
      | _, "ThrottlingException" ->
          `ThrottlingException (Json_deserializers.throttling_exception_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : import_ssh_public_key_request) =
    let input = Json_serializers.import_ssh_public_key_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"TransferService.ImportSshPublicKey" ~service
      ~context ~input
      ~output_deserializer:Json_deserializers.import_ssh_public_key_response_of_yojson
      ~error_deserializer

  let request_with_metadata context (request : import_ssh_public_key_request) =
    let input = Json_serializers.import_ssh_public_key_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata
      ~shape_name:"TransferService.ImportSshPublicKey" ~service ~context ~input
      ~output_deserializer:Json_deserializers.import_ssh_public_key_response_of_yojson
      ~error_deserializer
end

module ImportHostKey = struct
  let error_to_string = function
    | `InternalServiceError _ -> "com.amazonaws.transfer#InternalServiceError"
    | `InvalidRequestException _ -> "com.amazonaws.transfer#InvalidRequestException"
    | `ResourceExistsException _ -> "com.amazonaws.transfer#ResourceExistsException"
    | `ResourceNotFoundException _ -> "com.amazonaws.transfer#ResourceNotFoundException"
    | `ServiceUnavailableException _ -> "com.amazonaws.transfer#ServiceUnavailableException"
    | `ThrottlingException _ -> "com.amazonaws.transfer#ThrottlingException"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "InternalServiceError" ->
          `InternalServiceError (Json_deserializers.internal_service_error_of_yojson tree path)
      | _, "InvalidRequestException" ->
          `InvalidRequestException
            (Json_deserializers.invalid_request_exception_of_yojson tree path)
      | _, "ResourceExistsException" ->
          `ResourceExistsException
            (Json_deserializers.resource_exists_exception_of_yojson tree path)
      | _, "ResourceNotFoundException" ->
          `ResourceNotFoundException
            (Json_deserializers.resource_not_found_exception_of_yojson tree path)
      | _, "ServiceUnavailableException" ->
          `ServiceUnavailableException
            (Json_deserializers.service_unavailable_exception_of_yojson tree path)
      | _, "ThrottlingException" ->
          `ThrottlingException (Json_deserializers.throttling_exception_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : import_host_key_request) =
    let input = Json_serializers.import_host_key_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"TransferService.ImportHostKey" ~service
      ~context ~input ~output_deserializer:Json_deserializers.import_host_key_response_of_yojson
      ~error_deserializer

  let request_with_metadata context (request : import_host_key_request) =
    let input = Json_serializers.import_host_key_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata ~shape_name:"TransferService.ImportHostKey"
      ~service ~context ~input
      ~output_deserializer:Json_deserializers.import_host_key_response_of_yojson ~error_deserializer
end

module ImportCertificate = struct
  let error_to_string = function
    | `InternalServiceError _ -> "com.amazonaws.transfer#InternalServiceError"
    | `InvalidRequestException _ -> "com.amazonaws.transfer#InvalidRequestException"
    | `ResourceNotFoundException _ -> "com.amazonaws.transfer#ResourceNotFoundException"
    | `ServiceUnavailableException _ -> "com.amazonaws.transfer#ServiceUnavailableException"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "InternalServiceError" ->
          `InternalServiceError (Json_deserializers.internal_service_error_of_yojson tree path)
      | _, "InvalidRequestException" ->
          `InvalidRequestException
            (Json_deserializers.invalid_request_exception_of_yojson tree path)
      | _, "ResourceNotFoundException" ->
          `ResourceNotFoundException
            (Json_deserializers.resource_not_found_exception_of_yojson tree path)
      | _, "ServiceUnavailableException" ->
          `ServiceUnavailableException
            (Json_deserializers.service_unavailable_exception_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : import_certificate_request) =
    let input = Json_serializers.import_certificate_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"TransferService.ImportCertificate" ~service
      ~context ~input ~output_deserializer:Json_deserializers.import_certificate_response_of_yojson
      ~error_deserializer

  let request_with_metadata context (request : import_certificate_request) =
    let input = Json_serializers.import_certificate_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata
      ~shape_name:"TransferService.ImportCertificate" ~service ~context ~input
      ~output_deserializer:Json_deserializers.import_certificate_response_of_yojson
      ~error_deserializer
end

module DescribeWorkflow = struct
  let error_to_string = function
    | `InternalServiceError _ -> "com.amazonaws.transfer#InternalServiceError"
    | `InvalidRequestException _ -> "com.amazonaws.transfer#InvalidRequestException"
    | `ResourceNotFoundException _ -> "com.amazonaws.transfer#ResourceNotFoundException"
    | `ServiceUnavailableException _ -> "com.amazonaws.transfer#ServiceUnavailableException"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "InternalServiceError" ->
          `InternalServiceError (Json_deserializers.internal_service_error_of_yojson tree path)
      | _, "InvalidRequestException" ->
          `InvalidRequestException
            (Json_deserializers.invalid_request_exception_of_yojson tree path)
      | _, "ResourceNotFoundException" ->
          `ResourceNotFoundException
            (Json_deserializers.resource_not_found_exception_of_yojson tree path)
      | _, "ServiceUnavailableException" ->
          `ServiceUnavailableException
            (Json_deserializers.service_unavailable_exception_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : describe_workflow_request) =
    let input = Json_serializers.describe_workflow_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"TransferService.DescribeWorkflow" ~service
      ~context ~input ~output_deserializer:Json_deserializers.describe_workflow_response_of_yojson
      ~error_deserializer

  let request_with_metadata context (request : describe_workflow_request) =
    let input = Json_serializers.describe_workflow_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata ~shape_name:"TransferService.DescribeWorkflow"
      ~service ~context ~input
      ~output_deserializer:Json_deserializers.describe_workflow_response_of_yojson
      ~error_deserializer
end

module DescribeWebAppCustomization = struct
  let error_to_string = function
    | `AccessDeniedException _ -> "com.amazonaws.transfer#AccessDeniedException"
    | `InternalServiceError _ -> "com.amazonaws.transfer#InternalServiceError"
    | `InvalidRequestException _ -> "com.amazonaws.transfer#InvalidRequestException"
    | `ResourceNotFoundException _ -> "com.amazonaws.transfer#ResourceNotFoundException"
    | `ThrottlingException _ -> "com.amazonaws.transfer#ThrottlingException"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "AccessDeniedException" ->
          `AccessDeniedException (Json_deserializers.access_denied_exception_of_yojson tree path)
      | _, "InternalServiceError" ->
          `InternalServiceError (Json_deserializers.internal_service_error_of_yojson tree path)
      | _, "InvalidRequestException" ->
          `InvalidRequestException
            (Json_deserializers.invalid_request_exception_of_yojson tree path)
      | _, "ResourceNotFoundException" ->
          `ResourceNotFoundException
            (Json_deserializers.resource_not_found_exception_of_yojson tree path)
      | _, "ThrottlingException" ->
          `ThrottlingException (Json_deserializers.throttling_exception_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : describe_web_app_customization_request) =
    let input = Json_serializers.describe_web_app_customization_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"TransferService.DescribeWebAppCustomization"
      ~service ~context ~input
      ~output_deserializer:Json_deserializers.describe_web_app_customization_response_of_yojson
      ~error_deserializer

  let request_with_metadata context (request : describe_web_app_customization_request) =
    let input = Json_serializers.describe_web_app_customization_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata
      ~shape_name:"TransferService.DescribeWebAppCustomization" ~service ~context ~input
      ~output_deserializer:Json_deserializers.describe_web_app_customization_response_of_yojson
      ~error_deserializer
end

module DescribeWebApp = struct
  let error_to_string = function
    | `AccessDeniedException _ -> "com.amazonaws.transfer#AccessDeniedException"
    | `InternalServiceError _ -> "com.amazonaws.transfer#InternalServiceError"
    | `InvalidRequestException _ -> "com.amazonaws.transfer#InvalidRequestException"
    | `ResourceNotFoundException _ -> "com.amazonaws.transfer#ResourceNotFoundException"
    | `ThrottlingException _ -> "com.amazonaws.transfer#ThrottlingException"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "AccessDeniedException" ->
          `AccessDeniedException (Json_deserializers.access_denied_exception_of_yojson tree path)
      | _, "InternalServiceError" ->
          `InternalServiceError (Json_deserializers.internal_service_error_of_yojson tree path)
      | _, "InvalidRequestException" ->
          `InvalidRequestException
            (Json_deserializers.invalid_request_exception_of_yojson tree path)
      | _, "ResourceNotFoundException" ->
          `ResourceNotFoundException
            (Json_deserializers.resource_not_found_exception_of_yojson tree path)
      | _, "ThrottlingException" ->
          `ThrottlingException (Json_deserializers.throttling_exception_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : describe_web_app_request) =
    let input = Json_serializers.describe_web_app_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"TransferService.DescribeWebApp" ~service
      ~context ~input ~output_deserializer:Json_deserializers.describe_web_app_response_of_yojson
      ~error_deserializer

  let request_with_metadata context (request : describe_web_app_request) =
    let input = Json_serializers.describe_web_app_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata ~shape_name:"TransferService.DescribeWebApp"
      ~service ~context ~input
      ~output_deserializer:Json_deserializers.describe_web_app_response_of_yojson
      ~error_deserializer
end

module DescribeUser = struct
  let error_to_string = function
    | `InternalServiceError _ -> "com.amazonaws.transfer#InternalServiceError"
    | `InvalidRequestException _ -> "com.amazonaws.transfer#InvalidRequestException"
    | `ResourceNotFoundException _ -> "com.amazonaws.transfer#ResourceNotFoundException"
    | `ServiceUnavailableException _ -> "com.amazonaws.transfer#ServiceUnavailableException"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "InternalServiceError" ->
          `InternalServiceError (Json_deserializers.internal_service_error_of_yojson tree path)
      | _, "InvalidRequestException" ->
          `InvalidRequestException
            (Json_deserializers.invalid_request_exception_of_yojson tree path)
      | _, "ResourceNotFoundException" ->
          `ResourceNotFoundException
            (Json_deserializers.resource_not_found_exception_of_yojson tree path)
      | _, "ServiceUnavailableException" ->
          `ServiceUnavailableException
            (Json_deserializers.service_unavailable_exception_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : describe_user_request) =
    let input = Json_serializers.describe_user_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"TransferService.DescribeUser" ~service ~context
      ~input ~output_deserializer:Json_deserializers.describe_user_response_of_yojson
      ~error_deserializer

  let request_with_metadata context (request : describe_user_request) =
    let input = Json_serializers.describe_user_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata ~shape_name:"TransferService.DescribeUser"
      ~service ~context ~input
      ~output_deserializer:Json_deserializers.describe_user_response_of_yojson ~error_deserializer
end

module DescribeServer = struct
  let error_to_string = function
    | `InternalServiceError _ -> "com.amazonaws.transfer#InternalServiceError"
    | `InvalidRequestException _ -> "com.amazonaws.transfer#InvalidRequestException"
    | `ResourceNotFoundException _ -> "com.amazonaws.transfer#ResourceNotFoundException"
    | `ServiceUnavailableException _ -> "com.amazonaws.transfer#ServiceUnavailableException"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "InternalServiceError" ->
          `InternalServiceError (Json_deserializers.internal_service_error_of_yojson tree path)
      | _, "InvalidRequestException" ->
          `InvalidRequestException
            (Json_deserializers.invalid_request_exception_of_yojson tree path)
      | _, "ResourceNotFoundException" ->
          `ResourceNotFoundException
            (Json_deserializers.resource_not_found_exception_of_yojson tree path)
      | _, "ServiceUnavailableException" ->
          `ServiceUnavailableException
            (Json_deserializers.service_unavailable_exception_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : describe_server_request) =
    let input = Json_serializers.describe_server_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"TransferService.DescribeServer" ~service
      ~context ~input ~output_deserializer:Json_deserializers.describe_server_response_of_yojson
      ~error_deserializer

  let request_with_metadata context (request : describe_server_request) =
    let input = Json_serializers.describe_server_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata ~shape_name:"TransferService.DescribeServer"
      ~service ~context ~input
      ~output_deserializer:Json_deserializers.describe_server_response_of_yojson ~error_deserializer
end

module DescribeSecurityPolicy = struct
  let error_to_string = function
    | `InternalServiceError _ -> "com.amazonaws.transfer#InternalServiceError"
    | `InvalidRequestException _ -> "com.amazonaws.transfer#InvalidRequestException"
    | `ResourceNotFoundException _ -> "com.amazonaws.transfer#ResourceNotFoundException"
    | `ServiceUnavailableException _ -> "com.amazonaws.transfer#ServiceUnavailableException"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "InternalServiceError" ->
          `InternalServiceError (Json_deserializers.internal_service_error_of_yojson tree path)
      | _, "InvalidRequestException" ->
          `InvalidRequestException
            (Json_deserializers.invalid_request_exception_of_yojson tree path)
      | _, "ResourceNotFoundException" ->
          `ResourceNotFoundException
            (Json_deserializers.resource_not_found_exception_of_yojson tree path)
      | _, "ServiceUnavailableException" ->
          `ServiceUnavailableException
            (Json_deserializers.service_unavailable_exception_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : describe_security_policy_request) =
    let input = Json_serializers.describe_security_policy_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"TransferService.DescribeSecurityPolicy"
      ~service ~context ~input
      ~output_deserializer:Json_deserializers.describe_security_policy_response_of_yojson
      ~error_deserializer

  let request_with_metadata context (request : describe_security_policy_request) =
    let input = Json_serializers.describe_security_policy_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata
      ~shape_name:"TransferService.DescribeSecurityPolicy" ~service ~context ~input
      ~output_deserializer:Json_deserializers.describe_security_policy_response_of_yojson
      ~error_deserializer
end

module DescribeProfile = struct
  let error_to_string = function
    | `InternalServiceError _ -> "com.amazonaws.transfer#InternalServiceError"
    | `InvalidRequestException _ -> "com.amazonaws.transfer#InvalidRequestException"
    | `ResourceNotFoundException _ -> "com.amazonaws.transfer#ResourceNotFoundException"
    | `ServiceUnavailableException _ -> "com.amazonaws.transfer#ServiceUnavailableException"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "InternalServiceError" ->
          `InternalServiceError (Json_deserializers.internal_service_error_of_yojson tree path)
      | _, "InvalidRequestException" ->
          `InvalidRequestException
            (Json_deserializers.invalid_request_exception_of_yojson tree path)
      | _, "ResourceNotFoundException" ->
          `ResourceNotFoundException
            (Json_deserializers.resource_not_found_exception_of_yojson tree path)
      | _, "ServiceUnavailableException" ->
          `ServiceUnavailableException
            (Json_deserializers.service_unavailable_exception_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : describe_profile_request) =
    let input = Json_serializers.describe_profile_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"TransferService.DescribeProfile" ~service
      ~context ~input ~output_deserializer:Json_deserializers.describe_profile_response_of_yojson
      ~error_deserializer

  let request_with_metadata context (request : describe_profile_request) =
    let input = Json_serializers.describe_profile_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata ~shape_name:"TransferService.DescribeProfile"
      ~service ~context ~input
      ~output_deserializer:Json_deserializers.describe_profile_response_of_yojson
      ~error_deserializer
end

module DescribeHostKey = struct
  let error_to_string = function
    | `InternalServiceError _ -> "com.amazonaws.transfer#InternalServiceError"
    | `InvalidRequestException _ -> "com.amazonaws.transfer#InvalidRequestException"
    | `ResourceNotFoundException _ -> "com.amazonaws.transfer#ResourceNotFoundException"
    | `ServiceUnavailableException _ -> "com.amazonaws.transfer#ServiceUnavailableException"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "InternalServiceError" ->
          `InternalServiceError (Json_deserializers.internal_service_error_of_yojson tree path)
      | _, "InvalidRequestException" ->
          `InvalidRequestException
            (Json_deserializers.invalid_request_exception_of_yojson tree path)
      | _, "ResourceNotFoundException" ->
          `ResourceNotFoundException
            (Json_deserializers.resource_not_found_exception_of_yojson tree path)
      | _, "ServiceUnavailableException" ->
          `ServiceUnavailableException
            (Json_deserializers.service_unavailable_exception_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : describe_host_key_request) =
    let input = Json_serializers.describe_host_key_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"TransferService.DescribeHostKey" ~service
      ~context ~input ~output_deserializer:Json_deserializers.describe_host_key_response_of_yojson
      ~error_deserializer

  let request_with_metadata context (request : describe_host_key_request) =
    let input = Json_serializers.describe_host_key_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata ~shape_name:"TransferService.DescribeHostKey"
      ~service ~context ~input
      ~output_deserializer:Json_deserializers.describe_host_key_response_of_yojson
      ~error_deserializer
end

module DescribeExecution = struct
  let error_to_string = function
    | `InternalServiceError _ -> "com.amazonaws.transfer#InternalServiceError"
    | `InvalidRequestException _ -> "com.amazonaws.transfer#InvalidRequestException"
    | `ResourceNotFoundException _ -> "com.amazonaws.transfer#ResourceNotFoundException"
    | `ServiceUnavailableException _ -> "com.amazonaws.transfer#ServiceUnavailableException"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "InternalServiceError" ->
          `InternalServiceError (Json_deserializers.internal_service_error_of_yojson tree path)
      | _, "InvalidRequestException" ->
          `InvalidRequestException
            (Json_deserializers.invalid_request_exception_of_yojson tree path)
      | _, "ResourceNotFoundException" ->
          `ResourceNotFoundException
            (Json_deserializers.resource_not_found_exception_of_yojson tree path)
      | _, "ServiceUnavailableException" ->
          `ServiceUnavailableException
            (Json_deserializers.service_unavailable_exception_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : describe_execution_request) =
    let input = Json_serializers.describe_execution_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"TransferService.DescribeExecution" ~service
      ~context ~input ~output_deserializer:Json_deserializers.describe_execution_response_of_yojson
      ~error_deserializer

  let request_with_metadata context (request : describe_execution_request) =
    let input = Json_serializers.describe_execution_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata
      ~shape_name:"TransferService.DescribeExecution" ~service ~context ~input
      ~output_deserializer:Json_deserializers.describe_execution_response_of_yojson
      ~error_deserializer
end

module DescribeConnector = struct
  let error_to_string = function
    | `InternalServiceError _ -> "com.amazonaws.transfer#InternalServiceError"
    | `InvalidRequestException _ -> "com.amazonaws.transfer#InvalidRequestException"
    | `ResourceNotFoundException _ -> "com.amazonaws.transfer#ResourceNotFoundException"
    | `ServiceUnavailableException _ -> "com.amazonaws.transfer#ServiceUnavailableException"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "InternalServiceError" ->
          `InternalServiceError (Json_deserializers.internal_service_error_of_yojson tree path)
      | _, "InvalidRequestException" ->
          `InvalidRequestException
            (Json_deserializers.invalid_request_exception_of_yojson tree path)
      | _, "ResourceNotFoundException" ->
          `ResourceNotFoundException
            (Json_deserializers.resource_not_found_exception_of_yojson tree path)
      | _, "ServiceUnavailableException" ->
          `ServiceUnavailableException
            (Json_deserializers.service_unavailable_exception_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : describe_connector_request) =
    let input = Json_serializers.describe_connector_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"TransferService.DescribeConnector" ~service
      ~context ~input ~output_deserializer:Json_deserializers.describe_connector_response_of_yojson
      ~error_deserializer

  let request_with_metadata context (request : describe_connector_request) =
    let input = Json_serializers.describe_connector_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata
      ~shape_name:"TransferService.DescribeConnector" ~service ~context ~input
      ~output_deserializer:Json_deserializers.describe_connector_response_of_yojson
      ~error_deserializer
end

module DescribeCertificate = struct
  let error_to_string = function
    | `InternalServiceError _ -> "com.amazonaws.transfer#InternalServiceError"
    | `InvalidRequestException _ -> "com.amazonaws.transfer#InvalidRequestException"
    | `ResourceNotFoundException _ -> "com.amazonaws.transfer#ResourceNotFoundException"
    | `ServiceUnavailableException _ -> "com.amazonaws.transfer#ServiceUnavailableException"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "InternalServiceError" ->
          `InternalServiceError (Json_deserializers.internal_service_error_of_yojson tree path)
      | _, "InvalidRequestException" ->
          `InvalidRequestException
            (Json_deserializers.invalid_request_exception_of_yojson tree path)
      | _, "ResourceNotFoundException" ->
          `ResourceNotFoundException
            (Json_deserializers.resource_not_found_exception_of_yojson tree path)
      | _, "ServiceUnavailableException" ->
          `ServiceUnavailableException
            (Json_deserializers.service_unavailable_exception_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : describe_certificate_request) =
    let input = Json_serializers.describe_certificate_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"TransferService.DescribeCertificate" ~service
      ~context ~input
      ~output_deserializer:Json_deserializers.describe_certificate_response_of_yojson
      ~error_deserializer

  let request_with_metadata context (request : describe_certificate_request) =
    let input = Json_serializers.describe_certificate_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata
      ~shape_name:"TransferService.DescribeCertificate" ~service ~context ~input
      ~output_deserializer:Json_deserializers.describe_certificate_response_of_yojson
      ~error_deserializer
end

module DescribeAgreement = struct
  let error_to_string = function
    | `InternalServiceError _ -> "com.amazonaws.transfer#InternalServiceError"
    | `InvalidRequestException _ -> "com.amazonaws.transfer#InvalidRequestException"
    | `ResourceNotFoundException _ -> "com.amazonaws.transfer#ResourceNotFoundException"
    | `ServiceUnavailableException _ -> "com.amazonaws.transfer#ServiceUnavailableException"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "InternalServiceError" ->
          `InternalServiceError (Json_deserializers.internal_service_error_of_yojson tree path)
      | _, "InvalidRequestException" ->
          `InvalidRequestException
            (Json_deserializers.invalid_request_exception_of_yojson tree path)
      | _, "ResourceNotFoundException" ->
          `ResourceNotFoundException
            (Json_deserializers.resource_not_found_exception_of_yojson tree path)
      | _, "ServiceUnavailableException" ->
          `ServiceUnavailableException
            (Json_deserializers.service_unavailable_exception_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : describe_agreement_request) =
    let input = Json_serializers.describe_agreement_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"TransferService.DescribeAgreement" ~service
      ~context ~input ~output_deserializer:Json_deserializers.describe_agreement_response_of_yojson
      ~error_deserializer

  let request_with_metadata context (request : describe_agreement_request) =
    let input = Json_serializers.describe_agreement_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata
      ~shape_name:"TransferService.DescribeAgreement" ~service ~context ~input
      ~output_deserializer:Json_deserializers.describe_agreement_response_of_yojson
      ~error_deserializer
end

module DescribeAccess = struct
  let error_to_string = function
    | `InternalServiceError _ -> "com.amazonaws.transfer#InternalServiceError"
    | `InvalidRequestException _ -> "com.amazonaws.transfer#InvalidRequestException"
    | `ResourceNotFoundException _ -> "com.amazonaws.transfer#ResourceNotFoundException"
    | `ServiceUnavailableException _ -> "com.amazonaws.transfer#ServiceUnavailableException"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "InternalServiceError" ->
          `InternalServiceError (Json_deserializers.internal_service_error_of_yojson tree path)
      | _, "InvalidRequestException" ->
          `InvalidRequestException
            (Json_deserializers.invalid_request_exception_of_yojson tree path)
      | _, "ResourceNotFoundException" ->
          `ResourceNotFoundException
            (Json_deserializers.resource_not_found_exception_of_yojson tree path)
      | _, "ServiceUnavailableException" ->
          `ServiceUnavailableException
            (Json_deserializers.service_unavailable_exception_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : describe_access_request) =
    let input = Json_serializers.describe_access_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"TransferService.DescribeAccess" ~service
      ~context ~input ~output_deserializer:Json_deserializers.describe_access_response_of_yojson
      ~error_deserializer

  let request_with_metadata context (request : describe_access_request) =
    let input = Json_serializers.describe_access_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata ~shape_name:"TransferService.DescribeAccess"
      ~service ~context ~input
      ~output_deserializer:Json_deserializers.describe_access_response_of_yojson ~error_deserializer
end

module DeleteWorkflow = struct
  let error_to_string = function
    | `AccessDeniedException _ -> "com.amazonaws.transfer#AccessDeniedException"
    | `InternalServiceError _ -> "com.amazonaws.transfer#InternalServiceError"
    | `InvalidRequestException _ -> "com.amazonaws.transfer#InvalidRequestException"
    | `ResourceNotFoundException _ -> "com.amazonaws.transfer#ResourceNotFoundException"
    | `ServiceUnavailableException _ -> "com.amazonaws.transfer#ServiceUnavailableException"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "AccessDeniedException" ->
          `AccessDeniedException (Json_deserializers.access_denied_exception_of_yojson tree path)
      | _, "InternalServiceError" ->
          `InternalServiceError (Json_deserializers.internal_service_error_of_yojson tree path)
      | _, "InvalidRequestException" ->
          `InvalidRequestException
            (Json_deserializers.invalid_request_exception_of_yojson tree path)
      | _, "ResourceNotFoundException" ->
          `ResourceNotFoundException
            (Json_deserializers.resource_not_found_exception_of_yojson tree path)
      | _, "ServiceUnavailableException" ->
          `ServiceUnavailableException
            (Json_deserializers.service_unavailable_exception_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : delete_workflow_request) =
    let input = Json_serializers.delete_workflow_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"TransferService.DeleteWorkflow" ~service
      ~context ~input ~output_deserializer:Smaws_Lib.Smithy_api.Json_deserializers.unit__of_yojson
      ~error_deserializer

  let request_with_metadata context (request : delete_workflow_request) =
    let input = Json_serializers.delete_workflow_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata ~shape_name:"TransferService.DeleteWorkflow"
      ~service ~context ~input
      ~output_deserializer:Smaws_Lib.Smithy_api.Json_deserializers.unit__of_yojson
      ~error_deserializer
end

module DeleteWebAppCustomization = struct
  let error_to_string = function
    | `AccessDeniedException _ -> "com.amazonaws.transfer#AccessDeniedException"
    | `ConflictException _ -> "com.amazonaws.transfer#ConflictException"
    | `InternalServiceError _ -> "com.amazonaws.transfer#InternalServiceError"
    | `InvalidRequestException _ -> "com.amazonaws.transfer#InvalidRequestException"
    | `ResourceNotFoundException _ -> "com.amazonaws.transfer#ResourceNotFoundException"
    | `ThrottlingException _ -> "com.amazonaws.transfer#ThrottlingException"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "AccessDeniedException" ->
          `AccessDeniedException (Json_deserializers.access_denied_exception_of_yojson tree path)
      | _, "ConflictException" ->
          `ConflictException (Json_deserializers.conflict_exception_of_yojson tree path)
      | _, "InternalServiceError" ->
          `InternalServiceError (Json_deserializers.internal_service_error_of_yojson tree path)
      | _, "InvalidRequestException" ->
          `InvalidRequestException
            (Json_deserializers.invalid_request_exception_of_yojson tree path)
      | _, "ResourceNotFoundException" ->
          `ResourceNotFoundException
            (Json_deserializers.resource_not_found_exception_of_yojson tree path)
      | _, "ThrottlingException" ->
          `ThrottlingException (Json_deserializers.throttling_exception_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : delete_web_app_customization_request) =
    let input = Json_serializers.delete_web_app_customization_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"TransferService.DeleteWebAppCustomization"
      ~service ~context ~input
      ~output_deserializer:Smaws_Lib.Smithy_api.Json_deserializers.unit__of_yojson
      ~error_deserializer

  let request_with_metadata context (request : delete_web_app_customization_request) =
    let input = Json_serializers.delete_web_app_customization_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata
      ~shape_name:"TransferService.DeleteWebAppCustomization" ~service ~context ~input
      ~output_deserializer:Smaws_Lib.Smithy_api.Json_deserializers.unit__of_yojson
      ~error_deserializer
end

module DeleteWebApp = struct
  let error_to_string = function
    | `AccessDeniedException _ -> "com.amazonaws.transfer#AccessDeniedException"
    | `InternalServiceError _ -> "com.amazonaws.transfer#InternalServiceError"
    | `InvalidRequestException _ -> "com.amazonaws.transfer#InvalidRequestException"
    | `ResourceNotFoundException _ -> "com.amazonaws.transfer#ResourceNotFoundException"
    | `ThrottlingException _ -> "com.amazonaws.transfer#ThrottlingException"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "AccessDeniedException" ->
          `AccessDeniedException (Json_deserializers.access_denied_exception_of_yojson tree path)
      | _, "InternalServiceError" ->
          `InternalServiceError (Json_deserializers.internal_service_error_of_yojson tree path)
      | _, "InvalidRequestException" ->
          `InvalidRequestException
            (Json_deserializers.invalid_request_exception_of_yojson tree path)
      | _, "ResourceNotFoundException" ->
          `ResourceNotFoundException
            (Json_deserializers.resource_not_found_exception_of_yojson tree path)
      | _, "ThrottlingException" ->
          `ThrottlingException (Json_deserializers.throttling_exception_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : delete_web_app_request) =
    let input = Json_serializers.delete_web_app_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"TransferService.DeleteWebApp" ~service ~context
      ~input ~output_deserializer:Smaws_Lib.Smithy_api.Json_deserializers.unit__of_yojson
      ~error_deserializer

  let request_with_metadata context (request : delete_web_app_request) =
    let input = Json_serializers.delete_web_app_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata ~shape_name:"TransferService.DeleteWebApp"
      ~service ~context ~input
      ~output_deserializer:Smaws_Lib.Smithy_api.Json_deserializers.unit__of_yojson
      ~error_deserializer
end

module DeleteUser = struct
  let error_to_string = function
    | `InternalServiceError _ -> "com.amazonaws.transfer#InternalServiceError"
    | `InvalidRequestException _ -> "com.amazonaws.transfer#InvalidRequestException"
    | `ResourceNotFoundException _ -> "com.amazonaws.transfer#ResourceNotFoundException"
    | `ServiceUnavailableException _ -> "com.amazonaws.transfer#ServiceUnavailableException"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "InternalServiceError" ->
          `InternalServiceError (Json_deserializers.internal_service_error_of_yojson tree path)
      | _, "InvalidRequestException" ->
          `InvalidRequestException
            (Json_deserializers.invalid_request_exception_of_yojson tree path)
      | _, "ResourceNotFoundException" ->
          `ResourceNotFoundException
            (Json_deserializers.resource_not_found_exception_of_yojson tree path)
      | _, "ServiceUnavailableException" ->
          `ServiceUnavailableException
            (Json_deserializers.service_unavailable_exception_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : delete_user_request) =
    let input = Json_serializers.delete_user_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"TransferService.DeleteUser" ~service ~context
      ~input ~output_deserializer:Smaws_Lib.Smithy_api.Json_deserializers.unit__of_yojson
      ~error_deserializer

  let request_with_metadata context (request : delete_user_request) =
    let input = Json_serializers.delete_user_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata ~shape_name:"TransferService.DeleteUser"
      ~service ~context ~input
      ~output_deserializer:Smaws_Lib.Smithy_api.Json_deserializers.unit__of_yojson
      ~error_deserializer
end

module DeleteSshPublicKey = struct
  let error_to_string = function
    | `InternalServiceError _ -> "com.amazonaws.transfer#InternalServiceError"
    | `InvalidRequestException _ -> "com.amazonaws.transfer#InvalidRequestException"
    | `ResourceNotFoundException _ -> "com.amazonaws.transfer#ResourceNotFoundException"
    | `ServiceUnavailableException _ -> "com.amazonaws.transfer#ServiceUnavailableException"
    | `ThrottlingException _ -> "com.amazonaws.transfer#ThrottlingException"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "InternalServiceError" ->
          `InternalServiceError (Json_deserializers.internal_service_error_of_yojson tree path)
      | _, "InvalidRequestException" ->
          `InvalidRequestException
            (Json_deserializers.invalid_request_exception_of_yojson tree path)
      | _, "ResourceNotFoundException" ->
          `ResourceNotFoundException
            (Json_deserializers.resource_not_found_exception_of_yojson tree path)
      | _, "ServiceUnavailableException" ->
          `ServiceUnavailableException
            (Json_deserializers.service_unavailable_exception_of_yojson tree path)
      | _, "ThrottlingException" ->
          `ThrottlingException (Json_deserializers.throttling_exception_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : delete_ssh_public_key_request) =
    let input = Json_serializers.delete_ssh_public_key_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"TransferService.DeleteSshPublicKey" ~service
      ~context ~input ~output_deserializer:Smaws_Lib.Smithy_api.Json_deserializers.unit__of_yojson
      ~error_deserializer

  let request_with_metadata context (request : delete_ssh_public_key_request) =
    let input = Json_serializers.delete_ssh_public_key_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata
      ~shape_name:"TransferService.DeleteSshPublicKey" ~service ~context ~input
      ~output_deserializer:Smaws_Lib.Smithy_api.Json_deserializers.unit__of_yojson
      ~error_deserializer
end

module DeleteServer = struct
  let error_to_string = function
    | `AccessDeniedException _ -> "com.amazonaws.transfer#AccessDeniedException"
    | `InternalServiceError _ -> "com.amazonaws.transfer#InternalServiceError"
    | `InvalidRequestException _ -> "com.amazonaws.transfer#InvalidRequestException"
    | `ResourceNotFoundException _ -> "com.amazonaws.transfer#ResourceNotFoundException"
    | `ServiceUnavailableException _ -> "com.amazonaws.transfer#ServiceUnavailableException"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "AccessDeniedException" ->
          `AccessDeniedException (Json_deserializers.access_denied_exception_of_yojson tree path)
      | _, "InternalServiceError" ->
          `InternalServiceError (Json_deserializers.internal_service_error_of_yojson tree path)
      | _, "InvalidRequestException" ->
          `InvalidRequestException
            (Json_deserializers.invalid_request_exception_of_yojson tree path)
      | _, "ResourceNotFoundException" ->
          `ResourceNotFoundException
            (Json_deserializers.resource_not_found_exception_of_yojson tree path)
      | _, "ServiceUnavailableException" ->
          `ServiceUnavailableException
            (Json_deserializers.service_unavailable_exception_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : delete_server_request) =
    let input = Json_serializers.delete_server_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"TransferService.DeleteServer" ~service ~context
      ~input ~output_deserializer:Smaws_Lib.Smithy_api.Json_deserializers.unit__of_yojson
      ~error_deserializer

  let request_with_metadata context (request : delete_server_request) =
    let input = Json_serializers.delete_server_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata ~shape_name:"TransferService.DeleteServer"
      ~service ~context ~input
      ~output_deserializer:Smaws_Lib.Smithy_api.Json_deserializers.unit__of_yojson
      ~error_deserializer
end

module DeleteProfile = struct
  let error_to_string = function
    | `InternalServiceError _ -> "com.amazonaws.transfer#InternalServiceError"
    | `InvalidRequestException _ -> "com.amazonaws.transfer#InvalidRequestException"
    | `ResourceNotFoundException _ -> "com.amazonaws.transfer#ResourceNotFoundException"
    | `ServiceUnavailableException _ -> "com.amazonaws.transfer#ServiceUnavailableException"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "InternalServiceError" ->
          `InternalServiceError (Json_deserializers.internal_service_error_of_yojson tree path)
      | _, "InvalidRequestException" ->
          `InvalidRequestException
            (Json_deserializers.invalid_request_exception_of_yojson tree path)
      | _, "ResourceNotFoundException" ->
          `ResourceNotFoundException
            (Json_deserializers.resource_not_found_exception_of_yojson tree path)
      | _, "ServiceUnavailableException" ->
          `ServiceUnavailableException
            (Json_deserializers.service_unavailable_exception_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : delete_profile_request) =
    let input = Json_serializers.delete_profile_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"TransferService.DeleteProfile" ~service
      ~context ~input ~output_deserializer:Smaws_Lib.Smithy_api.Json_deserializers.unit__of_yojson
      ~error_deserializer

  let request_with_metadata context (request : delete_profile_request) =
    let input = Json_serializers.delete_profile_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata ~shape_name:"TransferService.DeleteProfile"
      ~service ~context ~input
      ~output_deserializer:Smaws_Lib.Smithy_api.Json_deserializers.unit__of_yojson
      ~error_deserializer
end

module DeleteHostKey = struct
  let error_to_string = function
    | `InternalServiceError _ -> "com.amazonaws.transfer#InternalServiceError"
    | `InvalidRequestException _ -> "com.amazonaws.transfer#InvalidRequestException"
    | `ResourceNotFoundException _ -> "com.amazonaws.transfer#ResourceNotFoundException"
    | `ServiceUnavailableException _ -> "com.amazonaws.transfer#ServiceUnavailableException"
    | `ThrottlingException _ -> "com.amazonaws.transfer#ThrottlingException"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "InternalServiceError" ->
          `InternalServiceError (Json_deserializers.internal_service_error_of_yojson tree path)
      | _, "InvalidRequestException" ->
          `InvalidRequestException
            (Json_deserializers.invalid_request_exception_of_yojson tree path)
      | _, "ResourceNotFoundException" ->
          `ResourceNotFoundException
            (Json_deserializers.resource_not_found_exception_of_yojson tree path)
      | _, "ServiceUnavailableException" ->
          `ServiceUnavailableException
            (Json_deserializers.service_unavailable_exception_of_yojson tree path)
      | _, "ThrottlingException" ->
          `ThrottlingException (Json_deserializers.throttling_exception_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : delete_host_key_request) =
    let input = Json_serializers.delete_host_key_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"TransferService.DeleteHostKey" ~service
      ~context ~input ~output_deserializer:Smaws_Lib.Smithy_api.Json_deserializers.unit__of_yojson
      ~error_deserializer

  let request_with_metadata context (request : delete_host_key_request) =
    let input = Json_serializers.delete_host_key_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata ~shape_name:"TransferService.DeleteHostKey"
      ~service ~context ~input
      ~output_deserializer:Smaws_Lib.Smithy_api.Json_deserializers.unit__of_yojson
      ~error_deserializer
end

module DeleteConnector = struct
  let error_to_string = function
    | `InternalServiceError _ -> "com.amazonaws.transfer#InternalServiceError"
    | `InvalidRequestException _ -> "com.amazonaws.transfer#InvalidRequestException"
    | `ResourceNotFoundException _ -> "com.amazonaws.transfer#ResourceNotFoundException"
    | `ServiceUnavailableException _ -> "com.amazonaws.transfer#ServiceUnavailableException"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "InternalServiceError" ->
          `InternalServiceError (Json_deserializers.internal_service_error_of_yojson tree path)
      | _, "InvalidRequestException" ->
          `InvalidRequestException
            (Json_deserializers.invalid_request_exception_of_yojson tree path)
      | _, "ResourceNotFoundException" ->
          `ResourceNotFoundException
            (Json_deserializers.resource_not_found_exception_of_yojson tree path)
      | _, "ServiceUnavailableException" ->
          `ServiceUnavailableException
            (Json_deserializers.service_unavailable_exception_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : delete_connector_request) =
    let input = Json_serializers.delete_connector_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"TransferService.DeleteConnector" ~service
      ~context ~input ~output_deserializer:Smaws_Lib.Smithy_api.Json_deserializers.unit__of_yojson
      ~error_deserializer

  let request_with_metadata context (request : delete_connector_request) =
    let input = Json_serializers.delete_connector_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata ~shape_name:"TransferService.DeleteConnector"
      ~service ~context ~input
      ~output_deserializer:Smaws_Lib.Smithy_api.Json_deserializers.unit__of_yojson
      ~error_deserializer
end

module DeleteCertificate = struct
  let error_to_string = function
    | `InternalServiceError _ -> "com.amazonaws.transfer#InternalServiceError"
    | `InvalidRequestException _ -> "com.amazonaws.transfer#InvalidRequestException"
    | `ResourceNotFoundException _ -> "com.amazonaws.transfer#ResourceNotFoundException"
    | `ServiceUnavailableException _ -> "com.amazonaws.transfer#ServiceUnavailableException"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "InternalServiceError" ->
          `InternalServiceError (Json_deserializers.internal_service_error_of_yojson tree path)
      | _, "InvalidRequestException" ->
          `InvalidRequestException
            (Json_deserializers.invalid_request_exception_of_yojson tree path)
      | _, "ResourceNotFoundException" ->
          `ResourceNotFoundException
            (Json_deserializers.resource_not_found_exception_of_yojson tree path)
      | _, "ServiceUnavailableException" ->
          `ServiceUnavailableException
            (Json_deserializers.service_unavailable_exception_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : delete_certificate_request) =
    let input = Json_serializers.delete_certificate_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"TransferService.DeleteCertificate" ~service
      ~context ~input ~output_deserializer:Smaws_Lib.Smithy_api.Json_deserializers.unit__of_yojson
      ~error_deserializer

  let request_with_metadata context (request : delete_certificate_request) =
    let input = Json_serializers.delete_certificate_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata
      ~shape_name:"TransferService.DeleteCertificate" ~service ~context ~input
      ~output_deserializer:Smaws_Lib.Smithy_api.Json_deserializers.unit__of_yojson
      ~error_deserializer
end

module DeleteAgreement = struct
  let error_to_string = function
    | `InternalServiceError _ -> "com.amazonaws.transfer#InternalServiceError"
    | `InvalidRequestException _ -> "com.amazonaws.transfer#InvalidRequestException"
    | `ResourceNotFoundException _ -> "com.amazonaws.transfer#ResourceNotFoundException"
    | `ServiceUnavailableException _ -> "com.amazonaws.transfer#ServiceUnavailableException"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "InternalServiceError" ->
          `InternalServiceError (Json_deserializers.internal_service_error_of_yojson tree path)
      | _, "InvalidRequestException" ->
          `InvalidRequestException
            (Json_deserializers.invalid_request_exception_of_yojson tree path)
      | _, "ResourceNotFoundException" ->
          `ResourceNotFoundException
            (Json_deserializers.resource_not_found_exception_of_yojson tree path)
      | _, "ServiceUnavailableException" ->
          `ServiceUnavailableException
            (Json_deserializers.service_unavailable_exception_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : delete_agreement_request) =
    let input = Json_serializers.delete_agreement_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"TransferService.DeleteAgreement" ~service
      ~context ~input ~output_deserializer:Smaws_Lib.Smithy_api.Json_deserializers.unit__of_yojson
      ~error_deserializer

  let request_with_metadata context (request : delete_agreement_request) =
    let input = Json_serializers.delete_agreement_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata ~shape_name:"TransferService.DeleteAgreement"
      ~service ~context ~input
      ~output_deserializer:Smaws_Lib.Smithy_api.Json_deserializers.unit__of_yojson
      ~error_deserializer
end

module DeleteAccess = struct
  let error_to_string = function
    | `InternalServiceError _ -> "com.amazonaws.transfer#InternalServiceError"
    | `InvalidRequestException _ -> "com.amazonaws.transfer#InvalidRequestException"
    | `ResourceNotFoundException _ -> "com.amazonaws.transfer#ResourceNotFoundException"
    | `ServiceUnavailableException _ -> "com.amazonaws.transfer#ServiceUnavailableException"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "InternalServiceError" ->
          `InternalServiceError (Json_deserializers.internal_service_error_of_yojson tree path)
      | _, "InvalidRequestException" ->
          `InvalidRequestException
            (Json_deserializers.invalid_request_exception_of_yojson tree path)
      | _, "ResourceNotFoundException" ->
          `ResourceNotFoundException
            (Json_deserializers.resource_not_found_exception_of_yojson tree path)
      | _, "ServiceUnavailableException" ->
          `ServiceUnavailableException
            (Json_deserializers.service_unavailable_exception_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : delete_access_request) =
    let input = Json_serializers.delete_access_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"TransferService.DeleteAccess" ~service ~context
      ~input ~output_deserializer:Smaws_Lib.Smithy_api.Json_deserializers.unit__of_yojson
      ~error_deserializer

  let request_with_metadata context (request : delete_access_request) =
    let input = Json_serializers.delete_access_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata ~shape_name:"TransferService.DeleteAccess"
      ~service ~context ~input
      ~output_deserializer:Smaws_Lib.Smithy_api.Json_deserializers.unit__of_yojson
      ~error_deserializer
end

module CreateWorkflow = struct
  let error_to_string = function
    | `AccessDeniedException _ -> "com.amazonaws.transfer#AccessDeniedException"
    | `InternalServiceError _ -> "com.amazonaws.transfer#InternalServiceError"
    | `InvalidRequestException _ -> "com.amazonaws.transfer#InvalidRequestException"
    | `ResourceExistsException _ -> "com.amazonaws.transfer#ResourceExistsException"
    | `ServiceUnavailableException _ -> "com.amazonaws.transfer#ServiceUnavailableException"
    | `ThrottlingException _ -> "com.amazonaws.transfer#ThrottlingException"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "AccessDeniedException" ->
          `AccessDeniedException (Json_deserializers.access_denied_exception_of_yojson tree path)
      | _, "InternalServiceError" ->
          `InternalServiceError (Json_deserializers.internal_service_error_of_yojson tree path)
      | _, "InvalidRequestException" ->
          `InvalidRequestException
            (Json_deserializers.invalid_request_exception_of_yojson tree path)
      | _, "ResourceExistsException" ->
          `ResourceExistsException
            (Json_deserializers.resource_exists_exception_of_yojson tree path)
      | _, "ServiceUnavailableException" ->
          `ServiceUnavailableException
            (Json_deserializers.service_unavailable_exception_of_yojson tree path)
      | _, "ThrottlingException" ->
          `ThrottlingException (Json_deserializers.throttling_exception_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : create_workflow_request) =
    let input = Json_serializers.create_workflow_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"TransferService.CreateWorkflow" ~service
      ~context ~input ~output_deserializer:Json_deserializers.create_workflow_response_of_yojson
      ~error_deserializer

  let request_with_metadata context (request : create_workflow_request) =
    let input = Json_serializers.create_workflow_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata ~shape_name:"TransferService.CreateWorkflow"
      ~service ~context ~input
      ~output_deserializer:Json_deserializers.create_workflow_response_of_yojson ~error_deserializer
end

module CreateWebApp = struct
  let error_to_string = function
    | `AccessDeniedException _ -> "com.amazonaws.transfer#AccessDeniedException"
    | `InternalServiceError _ -> "com.amazonaws.transfer#InternalServiceError"
    | `InvalidRequestException _ -> "com.amazonaws.transfer#InvalidRequestException"
    | `ResourceNotFoundException _ -> "com.amazonaws.transfer#ResourceNotFoundException"
    | `ThrottlingException _ -> "com.amazonaws.transfer#ThrottlingException"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "AccessDeniedException" ->
          `AccessDeniedException (Json_deserializers.access_denied_exception_of_yojson tree path)
      | _, "InternalServiceError" ->
          `InternalServiceError (Json_deserializers.internal_service_error_of_yojson tree path)
      | _, "InvalidRequestException" ->
          `InvalidRequestException
            (Json_deserializers.invalid_request_exception_of_yojson tree path)
      | _, "ResourceNotFoundException" ->
          `ResourceNotFoundException
            (Json_deserializers.resource_not_found_exception_of_yojson tree path)
      | _, "ThrottlingException" ->
          `ThrottlingException (Json_deserializers.throttling_exception_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : create_web_app_request) =
    let input = Json_serializers.create_web_app_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"TransferService.CreateWebApp" ~service ~context
      ~input ~output_deserializer:Json_deserializers.create_web_app_response_of_yojson
      ~error_deserializer

  let request_with_metadata context (request : create_web_app_request) =
    let input = Json_serializers.create_web_app_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata ~shape_name:"TransferService.CreateWebApp"
      ~service ~context ~input
      ~output_deserializer:Json_deserializers.create_web_app_response_of_yojson ~error_deserializer
end

module CreateUser = struct
  let error_to_string = function
    | `InternalServiceError _ -> "com.amazonaws.transfer#InternalServiceError"
    | `InvalidRequestException _ -> "com.amazonaws.transfer#InvalidRequestException"
    | `ResourceExistsException _ -> "com.amazonaws.transfer#ResourceExistsException"
    | `ResourceNotFoundException _ -> "com.amazonaws.transfer#ResourceNotFoundException"
    | `ServiceUnavailableException _ -> "com.amazonaws.transfer#ServiceUnavailableException"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "InternalServiceError" ->
          `InternalServiceError (Json_deserializers.internal_service_error_of_yojson tree path)
      | _, "InvalidRequestException" ->
          `InvalidRequestException
            (Json_deserializers.invalid_request_exception_of_yojson tree path)
      | _, "ResourceExistsException" ->
          `ResourceExistsException
            (Json_deserializers.resource_exists_exception_of_yojson tree path)
      | _, "ResourceNotFoundException" ->
          `ResourceNotFoundException
            (Json_deserializers.resource_not_found_exception_of_yojson tree path)
      | _, "ServiceUnavailableException" ->
          `ServiceUnavailableException
            (Json_deserializers.service_unavailable_exception_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : create_user_request) =
    let input = Json_serializers.create_user_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"TransferService.CreateUser" ~service ~context
      ~input ~output_deserializer:Json_deserializers.create_user_response_of_yojson
      ~error_deserializer

  let request_with_metadata context (request : create_user_request) =
    let input = Json_serializers.create_user_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata ~shape_name:"TransferService.CreateUser"
      ~service ~context ~input
      ~output_deserializer:Json_deserializers.create_user_response_of_yojson ~error_deserializer
end

module CreateServer = struct
  let error_to_string = function
    | `AccessDeniedException _ -> "com.amazonaws.transfer#AccessDeniedException"
    | `InternalServiceError _ -> "com.amazonaws.transfer#InternalServiceError"
    | `InvalidRequestException _ -> "com.amazonaws.transfer#InvalidRequestException"
    | `ResourceExistsException _ -> "com.amazonaws.transfer#ResourceExistsException"
    | `ResourceNotFoundException _ -> "com.amazonaws.transfer#ResourceNotFoundException"
    | `ServiceUnavailableException _ -> "com.amazonaws.transfer#ServiceUnavailableException"
    | `ThrottlingException _ -> "com.amazonaws.transfer#ThrottlingException"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "AccessDeniedException" ->
          `AccessDeniedException (Json_deserializers.access_denied_exception_of_yojson tree path)
      | _, "InternalServiceError" ->
          `InternalServiceError (Json_deserializers.internal_service_error_of_yojson tree path)
      | _, "InvalidRequestException" ->
          `InvalidRequestException
            (Json_deserializers.invalid_request_exception_of_yojson tree path)
      | _, "ResourceExistsException" ->
          `ResourceExistsException
            (Json_deserializers.resource_exists_exception_of_yojson tree path)
      | _, "ResourceNotFoundException" ->
          `ResourceNotFoundException
            (Json_deserializers.resource_not_found_exception_of_yojson tree path)
      | _, "ServiceUnavailableException" ->
          `ServiceUnavailableException
            (Json_deserializers.service_unavailable_exception_of_yojson tree path)
      | _, "ThrottlingException" ->
          `ThrottlingException (Json_deserializers.throttling_exception_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : create_server_request) =
    let input = Json_serializers.create_server_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"TransferService.CreateServer" ~service ~context
      ~input ~output_deserializer:Json_deserializers.create_server_response_of_yojson
      ~error_deserializer

  let request_with_metadata context (request : create_server_request) =
    let input = Json_serializers.create_server_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata ~shape_name:"TransferService.CreateServer"
      ~service ~context ~input
      ~output_deserializer:Json_deserializers.create_server_response_of_yojson ~error_deserializer
end

module CreateProfile = struct
  let error_to_string = function
    | `InternalServiceError _ -> "com.amazonaws.transfer#InternalServiceError"
    | `InvalidRequestException _ -> "com.amazonaws.transfer#InvalidRequestException"
    | `ResourceNotFoundException _ -> "com.amazonaws.transfer#ResourceNotFoundException"
    | `ServiceUnavailableException _ -> "com.amazonaws.transfer#ServiceUnavailableException"
    | `ThrottlingException _ -> "com.amazonaws.transfer#ThrottlingException"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "InternalServiceError" ->
          `InternalServiceError (Json_deserializers.internal_service_error_of_yojson tree path)
      | _, "InvalidRequestException" ->
          `InvalidRequestException
            (Json_deserializers.invalid_request_exception_of_yojson tree path)
      | _, "ResourceNotFoundException" ->
          `ResourceNotFoundException
            (Json_deserializers.resource_not_found_exception_of_yojson tree path)
      | _, "ServiceUnavailableException" ->
          `ServiceUnavailableException
            (Json_deserializers.service_unavailable_exception_of_yojson tree path)
      | _, "ThrottlingException" ->
          `ThrottlingException (Json_deserializers.throttling_exception_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : create_profile_request) =
    let input = Json_serializers.create_profile_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"TransferService.CreateProfile" ~service
      ~context ~input ~output_deserializer:Json_deserializers.create_profile_response_of_yojson
      ~error_deserializer

  let request_with_metadata context (request : create_profile_request) =
    let input = Json_serializers.create_profile_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata ~shape_name:"TransferService.CreateProfile"
      ~service ~context ~input
      ~output_deserializer:Json_deserializers.create_profile_response_of_yojson ~error_deserializer
end

module CreateConnector = struct
  let error_to_string = function
    | `InternalServiceError _ -> "com.amazonaws.transfer#InternalServiceError"
    | `InvalidRequestException _ -> "com.amazonaws.transfer#InvalidRequestException"
    | `ResourceExistsException _ -> "com.amazonaws.transfer#ResourceExistsException"
    | `ResourceNotFoundException _ -> "com.amazonaws.transfer#ResourceNotFoundException"
    | `ServiceUnavailableException _ -> "com.amazonaws.transfer#ServiceUnavailableException"
    | `ThrottlingException _ -> "com.amazonaws.transfer#ThrottlingException"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "InternalServiceError" ->
          `InternalServiceError (Json_deserializers.internal_service_error_of_yojson tree path)
      | _, "InvalidRequestException" ->
          `InvalidRequestException
            (Json_deserializers.invalid_request_exception_of_yojson tree path)
      | _, "ResourceExistsException" ->
          `ResourceExistsException
            (Json_deserializers.resource_exists_exception_of_yojson tree path)
      | _, "ResourceNotFoundException" ->
          `ResourceNotFoundException
            (Json_deserializers.resource_not_found_exception_of_yojson tree path)
      | _, "ServiceUnavailableException" ->
          `ServiceUnavailableException
            (Json_deserializers.service_unavailable_exception_of_yojson tree path)
      | _, "ThrottlingException" ->
          `ThrottlingException (Json_deserializers.throttling_exception_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : create_connector_request) =
    let input = Json_serializers.create_connector_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"TransferService.CreateConnector" ~service
      ~context ~input ~output_deserializer:Json_deserializers.create_connector_response_of_yojson
      ~error_deserializer

  let request_with_metadata context (request : create_connector_request) =
    let input = Json_serializers.create_connector_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata ~shape_name:"TransferService.CreateConnector"
      ~service ~context ~input
      ~output_deserializer:Json_deserializers.create_connector_response_of_yojson
      ~error_deserializer
end

module CreateAgreement = struct
  let error_to_string = function
    | `InternalServiceError _ -> "com.amazonaws.transfer#InternalServiceError"
    | `InvalidRequestException _ -> "com.amazonaws.transfer#InvalidRequestException"
    | `ResourceExistsException _ -> "com.amazonaws.transfer#ResourceExistsException"
    | `ResourceNotFoundException _ -> "com.amazonaws.transfer#ResourceNotFoundException"
    | `ServiceUnavailableException _ -> "com.amazonaws.transfer#ServiceUnavailableException"
    | `ThrottlingException _ -> "com.amazonaws.transfer#ThrottlingException"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "InternalServiceError" ->
          `InternalServiceError (Json_deserializers.internal_service_error_of_yojson tree path)
      | _, "InvalidRequestException" ->
          `InvalidRequestException
            (Json_deserializers.invalid_request_exception_of_yojson tree path)
      | _, "ResourceExistsException" ->
          `ResourceExistsException
            (Json_deserializers.resource_exists_exception_of_yojson tree path)
      | _, "ResourceNotFoundException" ->
          `ResourceNotFoundException
            (Json_deserializers.resource_not_found_exception_of_yojson tree path)
      | _, "ServiceUnavailableException" ->
          `ServiceUnavailableException
            (Json_deserializers.service_unavailable_exception_of_yojson tree path)
      | _, "ThrottlingException" ->
          `ThrottlingException (Json_deserializers.throttling_exception_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : create_agreement_request) =
    let input = Json_serializers.create_agreement_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"TransferService.CreateAgreement" ~service
      ~context ~input ~output_deserializer:Json_deserializers.create_agreement_response_of_yojson
      ~error_deserializer

  let request_with_metadata context (request : create_agreement_request) =
    let input = Json_serializers.create_agreement_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata ~shape_name:"TransferService.CreateAgreement"
      ~service ~context ~input
      ~output_deserializer:Json_deserializers.create_agreement_response_of_yojson
      ~error_deserializer
end

module CreateAccess = struct
  let error_to_string = function
    | `InternalServiceError _ -> "com.amazonaws.transfer#InternalServiceError"
    | `InvalidRequestException _ -> "com.amazonaws.transfer#InvalidRequestException"
    | `ResourceExistsException _ -> "com.amazonaws.transfer#ResourceExistsException"
    | `ResourceNotFoundException _ -> "com.amazonaws.transfer#ResourceNotFoundException"
    | `ServiceUnavailableException _ -> "com.amazonaws.transfer#ServiceUnavailableException"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "InternalServiceError" ->
          `InternalServiceError (Json_deserializers.internal_service_error_of_yojson tree path)
      | _, "InvalidRequestException" ->
          `InvalidRequestException
            (Json_deserializers.invalid_request_exception_of_yojson tree path)
      | _, "ResourceExistsException" ->
          `ResourceExistsException
            (Json_deserializers.resource_exists_exception_of_yojson tree path)
      | _, "ResourceNotFoundException" ->
          `ResourceNotFoundException
            (Json_deserializers.resource_not_found_exception_of_yojson tree path)
      | _, "ServiceUnavailableException" ->
          `ServiceUnavailableException
            (Json_deserializers.service_unavailable_exception_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : create_access_request) =
    let input = Json_serializers.create_access_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"TransferService.CreateAccess" ~service ~context
      ~input ~output_deserializer:Json_deserializers.create_access_response_of_yojson
      ~error_deserializer

  let request_with_metadata context (request : create_access_request) =
    let input = Json_serializers.create_access_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata ~shape_name:"TransferService.CreateAccess"
      ~service ~context ~input
      ~output_deserializer:Json_deserializers.create_access_response_of_yojson ~error_deserializer
end
