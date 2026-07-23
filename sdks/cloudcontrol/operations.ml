open Types
open Service_metadata

module CreateResource = struct
  let error_to_string = function
    | `AlreadyExistsException _ -> "com.amazonaws.cloudcontrol#AlreadyExistsException"
    | `ClientTokenConflictException _ -> "com.amazonaws.cloudcontrol#ClientTokenConflictException"
    | `ConcurrentOperationException _ -> "com.amazonaws.cloudcontrol#ConcurrentOperationException"
    | `GeneralServiceException _ -> "com.amazonaws.cloudcontrol#GeneralServiceException"
    | `HandlerFailureException _ -> "com.amazonaws.cloudcontrol#HandlerFailureException"
    | `HandlerInternalFailureException _ ->
        "com.amazonaws.cloudcontrol#HandlerInternalFailureException"
    | `InvalidCredentialsException _ -> "com.amazonaws.cloudcontrol#InvalidCredentialsException"
    | `InvalidRequestException _ -> "com.amazonaws.cloudcontrol#InvalidRequestException"
    | `NetworkFailureException _ -> "com.amazonaws.cloudcontrol#NetworkFailureException"
    | `NotStabilizedException _ -> "com.amazonaws.cloudcontrol#NotStabilizedException"
    | `NotUpdatableException _ -> "com.amazonaws.cloudcontrol#NotUpdatableException"
    | `PrivateTypeException _ -> "com.amazonaws.cloudcontrol#PrivateTypeException"
    | `ResourceConflictException _ -> "com.amazonaws.cloudcontrol#ResourceConflictException"
    | `ResourceNotFoundException _ -> "com.amazonaws.cloudcontrol#ResourceNotFoundException"
    | `ServiceInternalErrorException _ -> "com.amazonaws.cloudcontrol#ServiceInternalErrorException"
    | `ServiceLimitExceededException _ -> "com.amazonaws.cloudcontrol#ServiceLimitExceededException"
    | `ThrottlingException _ -> "com.amazonaws.cloudcontrol#ThrottlingException"
    | `TypeNotFoundException _ -> "com.amazonaws.cloudcontrol#TypeNotFoundException"
    | `UnsupportedActionException _ -> "com.amazonaws.cloudcontrol#UnsupportedActionException"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "AlreadyExistsException" ->
          `AlreadyExistsException (Json_deserializers.already_exists_exception_of_yojson tree path)
      | _, "ClientTokenConflictException" ->
          `ClientTokenConflictException
            (Json_deserializers.client_token_conflict_exception_of_yojson tree path)
      | _, "ConcurrentOperationException" ->
          `ConcurrentOperationException
            (Json_deserializers.concurrent_operation_exception_of_yojson tree path)
      | _, "GeneralServiceException" ->
          `GeneralServiceException
            (Json_deserializers.general_service_exception_of_yojson tree path)
      | _, "HandlerFailureException" ->
          `HandlerFailureException
            (Json_deserializers.handler_failure_exception_of_yojson tree path)
      | _, "HandlerInternalFailureException" ->
          `HandlerInternalFailureException
            (Json_deserializers.handler_internal_failure_exception_of_yojson tree path)
      | _, "InvalidCredentialsException" ->
          `InvalidCredentialsException
            (Json_deserializers.invalid_credentials_exception_of_yojson tree path)
      | _, "InvalidRequestException" ->
          `InvalidRequestException
            (Json_deserializers.invalid_request_exception_of_yojson tree path)
      | _, "NetworkFailureException" ->
          `NetworkFailureException
            (Json_deserializers.network_failure_exception_of_yojson tree path)
      | _, "NotStabilizedException" ->
          `NotStabilizedException (Json_deserializers.not_stabilized_exception_of_yojson tree path)
      | _, "NotUpdatableException" ->
          `NotUpdatableException (Json_deserializers.not_updatable_exception_of_yojson tree path)
      | _, "PrivateTypeException" ->
          `PrivateTypeException (Json_deserializers.private_type_exception_of_yojson tree path)
      | _, "ResourceConflictException" ->
          `ResourceConflictException
            (Json_deserializers.resource_conflict_exception_of_yojson tree path)
      | _, "ResourceNotFoundException" ->
          `ResourceNotFoundException
            (Json_deserializers.resource_not_found_exception_of_yojson tree path)
      | _, "ServiceInternalErrorException" ->
          `ServiceInternalErrorException
            (Json_deserializers.service_internal_error_exception_of_yojson tree path)
      | _, "ServiceLimitExceededException" ->
          `ServiceLimitExceededException
            (Json_deserializers.service_limit_exceeded_exception_of_yojson tree path)
      | _, "ThrottlingException" ->
          `ThrottlingException (Json_deserializers.throttling_exception_of_yojson tree path)
      | _, "TypeNotFoundException" ->
          `TypeNotFoundException (Json_deserializers.type_not_found_exception_of_yojson tree path)
      | _, "UnsupportedActionException" ->
          `UnsupportedActionException
            (Json_deserializers.unsupported_action_exception_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : create_resource_input) =
    let input = Json_serializers.create_resource_input_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"CloudApiService.CreateResource" ~service
      ~context ~input ~output_deserializer:Json_deserializers.create_resource_output_of_yojson
      ~error_deserializer

  let request_with_metadata context (request : create_resource_input) =
    let input = Json_serializers.create_resource_input_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata ~shape_name:"CloudApiService.CreateResource"
      ~service ~context ~input
      ~output_deserializer:Json_deserializers.create_resource_output_of_yojson ~error_deserializer
end

module DeleteResource = struct
  let error_to_string = function
    | `AlreadyExistsException _ -> "com.amazonaws.cloudcontrol#AlreadyExistsException"
    | `ClientTokenConflictException _ -> "com.amazonaws.cloudcontrol#ClientTokenConflictException"
    | `ConcurrentOperationException _ -> "com.amazonaws.cloudcontrol#ConcurrentOperationException"
    | `GeneralServiceException _ -> "com.amazonaws.cloudcontrol#GeneralServiceException"
    | `HandlerFailureException _ -> "com.amazonaws.cloudcontrol#HandlerFailureException"
    | `HandlerInternalFailureException _ ->
        "com.amazonaws.cloudcontrol#HandlerInternalFailureException"
    | `InvalidCredentialsException _ -> "com.amazonaws.cloudcontrol#InvalidCredentialsException"
    | `InvalidRequestException _ -> "com.amazonaws.cloudcontrol#InvalidRequestException"
    | `NetworkFailureException _ -> "com.amazonaws.cloudcontrol#NetworkFailureException"
    | `NotStabilizedException _ -> "com.amazonaws.cloudcontrol#NotStabilizedException"
    | `NotUpdatableException _ -> "com.amazonaws.cloudcontrol#NotUpdatableException"
    | `PrivateTypeException _ -> "com.amazonaws.cloudcontrol#PrivateTypeException"
    | `ResourceConflictException _ -> "com.amazonaws.cloudcontrol#ResourceConflictException"
    | `ResourceNotFoundException _ -> "com.amazonaws.cloudcontrol#ResourceNotFoundException"
    | `ServiceInternalErrorException _ -> "com.amazonaws.cloudcontrol#ServiceInternalErrorException"
    | `ServiceLimitExceededException _ -> "com.amazonaws.cloudcontrol#ServiceLimitExceededException"
    | `ThrottlingException _ -> "com.amazonaws.cloudcontrol#ThrottlingException"
    | `TypeNotFoundException _ -> "com.amazonaws.cloudcontrol#TypeNotFoundException"
    | `UnsupportedActionException _ -> "com.amazonaws.cloudcontrol#UnsupportedActionException"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "AlreadyExistsException" ->
          `AlreadyExistsException (Json_deserializers.already_exists_exception_of_yojson tree path)
      | _, "ClientTokenConflictException" ->
          `ClientTokenConflictException
            (Json_deserializers.client_token_conflict_exception_of_yojson tree path)
      | _, "ConcurrentOperationException" ->
          `ConcurrentOperationException
            (Json_deserializers.concurrent_operation_exception_of_yojson tree path)
      | _, "GeneralServiceException" ->
          `GeneralServiceException
            (Json_deserializers.general_service_exception_of_yojson tree path)
      | _, "HandlerFailureException" ->
          `HandlerFailureException
            (Json_deserializers.handler_failure_exception_of_yojson tree path)
      | _, "HandlerInternalFailureException" ->
          `HandlerInternalFailureException
            (Json_deserializers.handler_internal_failure_exception_of_yojson tree path)
      | _, "InvalidCredentialsException" ->
          `InvalidCredentialsException
            (Json_deserializers.invalid_credentials_exception_of_yojson tree path)
      | _, "InvalidRequestException" ->
          `InvalidRequestException
            (Json_deserializers.invalid_request_exception_of_yojson tree path)
      | _, "NetworkFailureException" ->
          `NetworkFailureException
            (Json_deserializers.network_failure_exception_of_yojson tree path)
      | _, "NotStabilizedException" ->
          `NotStabilizedException (Json_deserializers.not_stabilized_exception_of_yojson tree path)
      | _, "NotUpdatableException" ->
          `NotUpdatableException (Json_deserializers.not_updatable_exception_of_yojson tree path)
      | _, "PrivateTypeException" ->
          `PrivateTypeException (Json_deserializers.private_type_exception_of_yojson tree path)
      | _, "ResourceConflictException" ->
          `ResourceConflictException
            (Json_deserializers.resource_conflict_exception_of_yojson tree path)
      | _, "ResourceNotFoundException" ->
          `ResourceNotFoundException
            (Json_deserializers.resource_not_found_exception_of_yojson tree path)
      | _, "ServiceInternalErrorException" ->
          `ServiceInternalErrorException
            (Json_deserializers.service_internal_error_exception_of_yojson tree path)
      | _, "ServiceLimitExceededException" ->
          `ServiceLimitExceededException
            (Json_deserializers.service_limit_exceeded_exception_of_yojson tree path)
      | _, "ThrottlingException" ->
          `ThrottlingException (Json_deserializers.throttling_exception_of_yojson tree path)
      | _, "TypeNotFoundException" ->
          `TypeNotFoundException (Json_deserializers.type_not_found_exception_of_yojson tree path)
      | _, "UnsupportedActionException" ->
          `UnsupportedActionException
            (Json_deserializers.unsupported_action_exception_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : delete_resource_input) =
    let input = Json_serializers.delete_resource_input_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"CloudApiService.DeleteResource" ~service
      ~context ~input ~output_deserializer:Json_deserializers.delete_resource_output_of_yojson
      ~error_deserializer

  let request_with_metadata context (request : delete_resource_input) =
    let input = Json_serializers.delete_resource_input_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata ~shape_name:"CloudApiService.DeleteResource"
      ~service ~context ~input
      ~output_deserializer:Json_deserializers.delete_resource_output_of_yojson ~error_deserializer
end

module GetResource = struct
  let error_to_string = function
    | `AlreadyExistsException _ -> "com.amazonaws.cloudcontrol#AlreadyExistsException"
    | `GeneralServiceException _ -> "com.amazonaws.cloudcontrol#GeneralServiceException"
    | `HandlerFailureException _ -> "com.amazonaws.cloudcontrol#HandlerFailureException"
    | `HandlerInternalFailureException _ ->
        "com.amazonaws.cloudcontrol#HandlerInternalFailureException"
    | `InvalidCredentialsException _ -> "com.amazonaws.cloudcontrol#InvalidCredentialsException"
    | `InvalidRequestException _ -> "com.amazonaws.cloudcontrol#InvalidRequestException"
    | `NetworkFailureException _ -> "com.amazonaws.cloudcontrol#NetworkFailureException"
    | `NotStabilizedException _ -> "com.amazonaws.cloudcontrol#NotStabilizedException"
    | `NotUpdatableException _ -> "com.amazonaws.cloudcontrol#NotUpdatableException"
    | `PrivateTypeException _ -> "com.amazonaws.cloudcontrol#PrivateTypeException"
    | `ResourceConflictException _ -> "com.amazonaws.cloudcontrol#ResourceConflictException"
    | `ResourceNotFoundException _ -> "com.amazonaws.cloudcontrol#ResourceNotFoundException"
    | `ServiceInternalErrorException _ -> "com.amazonaws.cloudcontrol#ServiceInternalErrorException"
    | `ServiceLimitExceededException _ -> "com.amazonaws.cloudcontrol#ServiceLimitExceededException"
    | `ThrottlingException _ -> "com.amazonaws.cloudcontrol#ThrottlingException"
    | `TypeNotFoundException _ -> "com.amazonaws.cloudcontrol#TypeNotFoundException"
    | `UnsupportedActionException _ -> "com.amazonaws.cloudcontrol#UnsupportedActionException"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "AlreadyExistsException" ->
          `AlreadyExistsException (Json_deserializers.already_exists_exception_of_yojson tree path)
      | _, "GeneralServiceException" ->
          `GeneralServiceException
            (Json_deserializers.general_service_exception_of_yojson tree path)
      | _, "HandlerFailureException" ->
          `HandlerFailureException
            (Json_deserializers.handler_failure_exception_of_yojson tree path)
      | _, "HandlerInternalFailureException" ->
          `HandlerInternalFailureException
            (Json_deserializers.handler_internal_failure_exception_of_yojson tree path)
      | _, "InvalidCredentialsException" ->
          `InvalidCredentialsException
            (Json_deserializers.invalid_credentials_exception_of_yojson tree path)
      | _, "InvalidRequestException" ->
          `InvalidRequestException
            (Json_deserializers.invalid_request_exception_of_yojson tree path)
      | _, "NetworkFailureException" ->
          `NetworkFailureException
            (Json_deserializers.network_failure_exception_of_yojson tree path)
      | _, "NotStabilizedException" ->
          `NotStabilizedException (Json_deserializers.not_stabilized_exception_of_yojson tree path)
      | _, "NotUpdatableException" ->
          `NotUpdatableException (Json_deserializers.not_updatable_exception_of_yojson tree path)
      | _, "PrivateTypeException" ->
          `PrivateTypeException (Json_deserializers.private_type_exception_of_yojson tree path)
      | _, "ResourceConflictException" ->
          `ResourceConflictException
            (Json_deserializers.resource_conflict_exception_of_yojson tree path)
      | _, "ResourceNotFoundException" ->
          `ResourceNotFoundException
            (Json_deserializers.resource_not_found_exception_of_yojson tree path)
      | _, "ServiceInternalErrorException" ->
          `ServiceInternalErrorException
            (Json_deserializers.service_internal_error_exception_of_yojson tree path)
      | _, "ServiceLimitExceededException" ->
          `ServiceLimitExceededException
            (Json_deserializers.service_limit_exceeded_exception_of_yojson tree path)
      | _, "ThrottlingException" ->
          `ThrottlingException (Json_deserializers.throttling_exception_of_yojson tree path)
      | _, "TypeNotFoundException" ->
          `TypeNotFoundException (Json_deserializers.type_not_found_exception_of_yojson tree path)
      | _, "UnsupportedActionException" ->
          `UnsupportedActionException
            (Json_deserializers.unsupported_action_exception_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : get_resource_input) =
    let input = Json_serializers.get_resource_input_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"CloudApiService.GetResource" ~service ~context
      ~input ~output_deserializer:Json_deserializers.get_resource_output_of_yojson
      ~error_deserializer

  let request_with_metadata context (request : get_resource_input) =
    let input = Json_serializers.get_resource_input_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata ~shape_name:"CloudApiService.GetResource"
      ~service ~context ~input ~output_deserializer:Json_deserializers.get_resource_output_of_yojson
      ~error_deserializer
end

module GetResourceRequestStatus = struct
  let error_to_string = function
    | `RequestTokenNotFoundException _ -> "com.amazonaws.cloudcontrol#RequestTokenNotFoundException"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "RequestTokenNotFoundException" ->
          `RequestTokenNotFoundException
            (Json_deserializers.request_token_not_found_exception_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : get_resource_request_status_input) =
    let input = Json_serializers.get_resource_request_status_input_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"CloudApiService.GetResourceRequestStatus"
      ~service ~context ~input
      ~output_deserializer:Json_deserializers.get_resource_request_status_output_of_yojson
      ~error_deserializer

  let request_with_metadata context (request : get_resource_request_status_input) =
    let input = Json_serializers.get_resource_request_status_input_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata
      ~shape_name:"CloudApiService.GetResourceRequestStatus" ~service ~context ~input
      ~output_deserializer:Json_deserializers.get_resource_request_status_output_of_yojson
      ~error_deserializer
end

module ListResourceRequests = struct
  let error_to_string = Smaws_Lib.Protocols.AwsJson.error_to_string

  let error_deserializer tree path =
    let handler a = a in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : list_resource_requests_input) =
    let input = Json_serializers.list_resource_requests_input_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"CloudApiService.ListResourceRequests" ~service
      ~context ~input
      ~output_deserializer:Json_deserializers.list_resource_requests_output_of_yojson
      ~error_deserializer

  let request_with_metadata context (request : list_resource_requests_input) =
    let input = Json_serializers.list_resource_requests_input_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata
      ~shape_name:"CloudApiService.ListResourceRequests" ~service ~context ~input
      ~output_deserializer:Json_deserializers.list_resource_requests_output_of_yojson
      ~error_deserializer
end

module ListResources = struct
  let error_to_string = function
    | `AlreadyExistsException _ -> "com.amazonaws.cloudcontrol#AlreadyExistsException"
    | `GeneralServiceException _ -> "com.amazonaws.cloudcontrol#GeneralServiceException"
    | `HandlerFailureException _ -> "com.amazonaws.cloudcontrol#HandlerFailureException"
    | `HandlerInternalFailureException _ ->
        "com.amazonaws.cloudcontrol#HandlerInternalFailureException"
    | `InvalidCredentialsException _ -> "com.amazonaws.cloudcontrol#InvalidCredentialsException"
    | `InvalidRequestException _ -> "com.amazonaws.cloudcontrol#InvalidRequestException"
    | `NetworkFailureException _ -> "com.amazonaws.cloudcontrol#NetworkFailureException"
    | `NotStabilizedException _ -> "com.amazonaws.cloudcontrol#NotStabilizedException"
    | `NotUpdatableException _ -> "com.amazonaws.cloudcontrol#NotUpdatableException"
    | `PrivateTypeException _ -> "com.amazonaws.cloudcontrol#PrivateTypeException"
    | `ResourceConflictException _ -> "com.amazonaws.cloudcontrol#ResourceConflictException"
    | `ResourceNotFoundException _ -> "com.amazonaws.cloudcontrol#ResourceNotFoundException"
    | `ServiceInternalErrorException _ -> "com.amazonaws.cloudcontrol#ServiceInternalErrorException"
    | `ServiceLimitExceededException _ -> "com.amazonaws.cloudcontrol#ServiceLimitExceededException"
    | `ThrottlingException _ -> "com.amazonaws.cloudcontrol#ThrottlingException"
    | `TypeNotFoundException _ -> "com.amazonaws.cloudcontrol#TypeNotFoundException"
    | `UnsupportedActionException _ -> "com.amazonaws.cloudcontrol#UnsupportedActionException"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "AlreadyExistsException" ->
          `AlreadyExistsException (Json_deserializers.already_exists_exception_of_yojson tree path)
      | _, "GeneralServiceException" ->
          `GeneralServiceException
            (Json_deserializers.general_service_exception_of_yojson tree path)
      | _, "HandlerFailureException" ->
          `HandlerFailureException
            (Json_deserializers.handler_failure_exception_of_yojson tree path)
      | _, "HandlerInternalFailureException" ->
          `HandlerInternalFailureException
            (Json_deserializers.handler_internal_failure_exception_of_yojson tree path)
      | _, "InvalidCredentialsException" ->
          `InvalidCredentialsException
            (Json_deserializers.invalid_credentials_exception_of_yojson tree path)
      | _, "InvalidRequestException" ->
          `InvalidRequestException
            (Json_deserializers.invalid_request_exception_of_yojson tree path)
      | _, "NetworkFailureException" ->
          `NetworkFailureException
            (Json_deserializers.network_failure_exception_of_yojson tree path)
      | _, "NotStabilizedException" ->
          `NotStabilizedException (Json_deserializers.not_stabilized_exception_of_yojson tree path)
      | _, "NotUpdatableException" ->
          `NotUpdatableException (Json_deserializers.not_updatable_exception_of_yojson tree path)
      | _, "PrivateTypeException" ->
          `PrivateTypeException (Json_deserializers.private_type_exception_of_yojson tree path)
      | _, "ResourceConflictException" ->
          `ResourceConflictException
            (Json_deserializers.resource_conflict_exception_of_yojson tree path)
      | _, "ResourceNotFoundException" ->
          `ResourceNotFoundException
            (Json_deserializers.resource_not_found_exception_of_yojson tree path)
      | _, "ServiceInternalErrorException" ->
          `ServiceInternalErrorException
            (Json_deserializers.service_internal_error_exception_of_yojson tree path)
      | _, "ServiceLimitExceededException" ->
          `ServiceLimitExceededException
            (Json_deserializers.service_limit_exceeded_exception_of_yojson tree path)
      | _, "ThrottlingException" ->
          `ThrottlingException (Json_deserializers.throttling_exception_of_yojson tree path)
      | _, "TypeNotFoundException" ->
          `TypeNotFoundException (Json_deserializers.type_not_found_exception_of_yojson tree path)
      | _, "UnsupportedActionException" ->
          `UnsupportedActionException
            (Json_deserializers.unsupported_action_exception_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : list_resources_input) =
    let input = Json_serializers.list_resources_input_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"CloudApiService.ListResources" ~service
      ~context ~input ~output_deserializer:Json_deserializers.list_resources_output_of_yojson
      ~error_deserializer

  let request_with_metadata context (request : list_resources_input) =
    let input = Json_serializers.list_resources_input_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata ~shape_name:"CloudApiService.ListResources"
      ~service ~context ~input
      ~output_deserializer:Json_deserializers.list_resources_output_of_yojson ~error_deserializer
end

module UpdateResource = struct
  let error_to_string = function
    | `AlreadyExistsException _ -> "com.amazonaws.cloudcontrol#AlreadyExistsException"
    | `ClientTokenConflictException _ -> "com.amazonaws.cloudcontrol#ClientTokenConflictException"
    | `ConcurrentOperationException _ -> "com.amazonaws.cloudcontrol#ConcurrentOperationException"
    | `GeneralServiceException _ -> "com.amazonaws.cloudcontrol#GeneralServiceException"
    | `HandlerFailureException _ -> "com.amazonaws.cloudcontrol#HandlerFailureException"
    | `HandlerInternalFailureException _ ->
        "com.amazonaws.cloudcontrol#HandlerInternalFailureException"
    | `InvalidCredentialsException _ -> "com.amazonaws.cloudcontrol#InvalidCredentialsException"
    | `InvalidRequestException _ -> "com.amazonaws.cloudcontrol#InvalidRequestException"
    | `NetworkFailureException _ -> "com.amazonaws.cloudcontrol#NetworkFailureException"
    | `NotStabilizedException _ -> "com.amazonaws.cloudcontrol#NotStabilizedException"
    | `NotUpdatableException _ -> "com.amazonaws.cloudcontrol#NotUpdatableException"
    | `PrivateTypeException _ -> "com.amazonaws.cloudcontrol#PrivateTypeException"
    | `ResourceConflictException _ -> "com.amazonaws.cloudcontrol#ResourceConflictException"
    | `ResourceNotFoundException _ -> "com.amazonaws.cloudcontrol#ResourceNotFoundException"
    | `ServiceInternalErrorException _ -> "com.amazonaws.cloudcontrol#ServiceInternalErrorException"
    | `ServiceLimitExceededException _ -> "com.amazonaws.cloudcontrol#ServiceLimitExceededException"
    | `ThrottlingException _ -> "com.amazonaws.cloudcontrol#ThrottlingException"
    | `TypeNotFoundException _ -> "com.amazonaws.cloudcontrol#TypeNotFoundException"
    | `UnsupportedActionException _ -> "com.amazonaws.cloudcontrol#UnsupportedActionException"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "AlreadyExistsException" ->
          `AlreadyExistsException (Json_deserializers.already_exists_exception_of_yojson tree path)
      | _, "ClientTokenConflictException" ->
          `ClientTokenConflictException
            (Json_deserializers.client_token_conflict_exception_of_yojson tree path)
      | _, "ConcurrentOperationException" ->
          `ConcurrentOperationException
            (Json_deserializers.concurrent_operation_exception_of_yojson tree path)
      | _, "GeneralServiceException" ->
          `GeneralServiceException
            (Json_deserializers.general_service_exception_of_yojson tree path)
      | _, "HandlerFailureException" ->
          `HandlerFailureException
            (Json_deserializers.handler_failure_exception_of_yojson tree path)
      | _, "HandlerInternalFailureException" ->
          `HandlerInternalFailureException
            (Json_deserializers.handler_internal_failure_exception_of_yojson tree path)
      | _, "InvalidCredentialsException" ->
          `InvalidCredentialsException
            (Json_deserializers.invalid_credentials_exception_of_yojson tree path)
      | _, "InvalidRequestException" ->
          `InvalidRequestException
            (Json_deserializers.invalid_request_exception_of_yojson tree path)
      | _, "NetworkFailureException" ->
          `NetworkFailureException
            (Json_deserializers.network_failure_exception_of_yojson tree path)
      | _, "NotStabilizedException" ->
          `NotStabilizedException (Json_deserializers.not_stabilized_exception_of_yojson tree path)
      | _, "NotUpdatableException" ->
          `NotUpdatableException (Json_deserializers.not_updatable_exception_of_yojson tree path)
      | _, "PrivateTypeException" ->
          `PrivateTypeException (Json_deserializers.private_type_exception_of_yojson tree path)
      | _, "ResourceConflictException" ->
          `ResourceConflictException
            (Json_deserializers.resource_conflict_exception_of_yojson tree path)
      | _, "ResourceNotFoundException" ->
          `ResourceNotFoundException
            (Json_deserializers.resource_not_found_exception_of_yojson tree path)
      | _, "ServiceInternalErrorException" ->
          `ServiceInternalErrorException
            (Json_deserializers.service_internal_error_exception_of_yojson tree path)
      | _, "ServiceLimitExceededException" ->
          `ServiceLimitExceededException
            (Json_deserializers.service_limit_exceeded_exception_of_yojson tree path)
      | _, "ThrottlingException" ->
          `ThrottlingException (Json_deserializers.throttling_exception_of_yojson tree path)
      | _, "TypeNotFoundException" ->
          `TypeNotFoundException (Json_deserializers.type_not_found_exception_of_yojson tree path)
      | _, "UnsupportedActionException" ->
          `UnsupportedActionException
            (Json_deserializers.unsupported_action_exception_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : update_resource_input) =
    let input = Json_serializers.update_resource_input_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"CloudApiService.UpdateResource" ~service
      ~context ~input ~output_deserializer:Json_deserializers.update_resource_output_of_yojson
      ~error_deserializer

  let request_with_metadata context (request : update_resource_input) =
    let input = Json_serializers.update_resource_input_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata ~shape_name:"CloudApiService.UpdateResource"
      ~service ~context ~input
      ~output_deserializer:Json_deserializers.update_resource_output_of_yojson ~error_deserializer
end

module CancelResourceRequest = struct
  let error_to_string = function
    | `ConcurrentModificationException _ ->
        "com.amazonaws.cloudcontrol#ConcurrentModificationException"
    | `RequestTokenNotFoundException _ -> "com.amazonaws.cloudcontrol#RequestTokenNotFoundException"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "ConcurrentModificationException" ->
          `ConcurrentModificationException
            (Json_deserializers.concurrent_modification_exception_of_yojson tree path)
      | _, "RequestTokenNotFoundException" ->
          `RequestTokenNotFoundException
            (Json_deserializers.request_token_not_found_exception_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : cancel_resource_request_input) =
    let input = Json_serializers.cancel_resource_request_input_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"CloudApiService.CancelResourceRequest" ~service
      ~context ~input
      ~output_deserializer:Json_deserializers.cancel_resource_request_output_of_yojson
      ~error_deserializer

  let request_with_metadata context (request : cancel_resource_request_input) =
    let input = Json_serializers.cancel_resource_request_input_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata
      ~shape_name:"CloudApiService.CancelResourceRequest" ~service ~context ~input
      ~output_deserializer:Json_deserializers.cancel_resource_request_output_of_yojson
      ~error_deserializer
end
