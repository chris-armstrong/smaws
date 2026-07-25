open Types
open Service_metadata

module PutAccountPolicy = struct
  let error_to_string = function
    | `InvalidParameterException _ -> "com.amazonaws.cloudwatchlogs#InvalidParameterException"
    | `LimitExceededException _ -> "com.amazonaws.cloudwatchlogs#LimitExceededException"
    | `OperationAbortedException _ -> "com.amazonaws.cloudwatchlogs#OperationAbortedException"
    | `ServiceUnavailableException _ -> "com.amazonaws.cloudwatchlogs#ServiceUnavailableException"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "InvalidParameterException" ->
          `InvalidParameterException
            (Json_deserializers.invalid_parameter_exception_of_yojson tree path)
      | _, "LimitExceededException" ->
          `LimitExceededException (Json_deserializers.limit_exceeded_exception_of_yojson tree path)
      | _, "OperationAbortedException" ->
          `OperationAbortedException
            (Json_deserializers.operation_aborted_exception_of_yojson tree path)
      | _, "ServiceUnavailableException" ->
          `ServiceUnavailableException
            (Json_deserializers.service_unavailable_exception_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : put_account_policy_request) =
    let input = Json_serializers.put_account_policy_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"Logs_20140328.PutAccountPolicy" ~service
      ~context ~input ~output_deserializer:Json_deserializers.put_account_policy_response_of_yojson
      ~error_deserializer

  let request_with_metadata context (request : put_account_policy_request) =
    let input = Json_serializers.put_account_policy_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata ~shape_name:"Logs_20140328.PutAccountPolicy"
      ~service ~context ~input
      ~output_deserializer:Json_deserializers.put_account_policy_response_of_yojson
      ~error_deserializer
end

module PutBearerTokenAuthentication = struct
  let error_to_string = function
    | `AccessDeniedException _ -> "com.amazonaws.cloudwatchlogs#AccessDeniedException"
    | `InvalidOperationException _ -> "com.amazonaws.cloudwatchlogs#InvalidOperationException"
    | `InvalidParameterException _ -> "com.amazonaws.cloudwatchlogs#InvalidParameterException"
    | `OperationAbortedException _ -> "com.amazonaws.cloudwatchlogs#OperationAbortedException"
    | `ResourceNotFoundException _ -> "com.amazonaws.cloudwatchlogs#ResourceNotFoundException"
    | `ServiceUnavailableException _ -> "com.amazonaws.cloudwatchlogs#ServiceUnavailableException"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "AccessDeniedException" ->
          `AccessDeniedException (Json_deserializers.access_denied_exception_of_yojson tree path)
      | _, "InvalidOperationException" ->
          `InvalidOperationException
            (Json_deserializers.invalid_operation_exception_of_yojson tree path)
      | _, "InvalidParameterException" ->
          `InvalidParameterException
            (Json_deserializers.invalid_parameter_exception_of_yojson tree path)
      | _, "OperationAbortedException" ->
          `OperationAbortedException
            (Json_deserializers.operation_aborted_exception_of_yojson tree path)
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

  let request context (request : put_bearer_token_authentication_request) =
    let input = Json_serializers.put_bearer_token_authentication_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"Logs_20140328.PutBearerTokenAuthentication"
      ~service ~context ~input
      ~output_deserializer:Smaws_Lib.Smithy_api.Json_deserializers.unit__of_yojson
      ~error_deserializer

  let request_with_metadata context (request : put_bearer_token_authentication_request) =
    let input = Json_serializers.put_bearer_token_authentication_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata
      ~shape_name:"Logs_20140328.PutBearerTokenAuthentication" ~service ~context ~input
      ~output_deserializer:Smaws_Lib.Smithy_api.Json_deserializers.unit__of_yojson
      ~error_deserializer
end

module PutDataProtectionPolicy = struct
  let error_to_string = function
    | `InvalidParameterException _ -> "com.amazonaws.cloudwatchlogs#InvalidParameterException"
    | `LimitExceededException _ -> "com.amazonaws.cloudwatchlogs#LimitExceededException"
    | `OperationAbortedException _ -> "com.amazonaws.cloudwatchlogs#OperationAbortedException"
    | `ResourceNotFoundException _ -> "com.amazonaws.cloudwatchlogs#ResourceNotFoundException"
    | `ServiceUnavailableException _ -> "com.amazonaws.cloudwatchlogs#ServiceUnavailableException"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "InvalidParameterException" ->
          `InvalidParameterException
            (Json_deserializers.invalid_parameter_exception_of_yojson tree path)
      | _, "LimitExceededException" ->
          `LimitExceededException (Json_deserializers.limit_exceeded_exception_of_yojson tree path)
      | _, "OperationAbortedException" ->
          `OperationAbortedException
            (Json_deserializers.operation_aborted_exception_of_yojson tree path)
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

  let request context (request : put_data_protection_policy_request) =
    let input = Json_serializers.put_data_protection_policy_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"Logs_20140328.PutDataProtectionPolicy" ~service
      ~context ~input
      ~output_deserializer:Json_deserializers.put_data_protection_policy_response_of_yojson
      ~error_deserializer

  let request_with_metadata context (request : put_data_protection_policy_request) =
    let input = Json_serializers.put_data_protection_policy_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata
      ~shape_name:"Logs_20140328.PutDataProtectionPolicy" ~service ~context ~input
      ~output_deserializer:Json_deserializers.put_data_protection_policy_response_of_yojson
      ~error_deserializer
end

module PutDeliveryDestination = struct
  let error_to_string = function
    | `ConflictException _ -> "com.amazonaws.cloudwatchlogs#ConflictException"
    | `ResourceNotFoundException _ -> "com.amazonaws.cloudwatchlogs#ResourceNotFoundException"
    | `ServiceQuotaExceededException _ ->
        "com.amazonaws.cloudwatchlogs#ServiceQuotaExceededException"
    | `ServiceUnavailableException _ -> "com.amazonaws.cloudwatchlogs#ServiceUnavailableException"
    | `ThrottlingException _ -> "com.amazonaws.cloudwatchlogs#ThrottlingException"
    | `ValidationException _ -> "com.amazonaws.cloudwatchlogs#ValidationException"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "ConflictException" ->
          `ConflictException (Json_deserializers.conflict_exception_of_yojson tree path)
      | _, "ResourceNotFoundException" ->
          `ResourceNotFoundException
            (Json_deserializers.resource_not_found_exception_of_yojson tree path)
      | _, "ServiceQuotaExceededException" ->
          `ServiceQuotaExceededException
            (Json_deserializers.service_quota_exceeded_exception_of_yojson tree path)
      | _, "ServiceUnavailableException" ->
          `ServiceUnavailableException
            (Json_deserializers.service_unavailable_exception_of_yojson tree path)
      | _, "ThrottlingException" ->
          `ThrottlingException (Json_deserializers.throttling_exception_of_yojson tree path)
      | _, "ValidationException" ->
          `ValidationException (Json_deserializers.validation_exception_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : put_delivery_destination_request) =
    let input = Json_serializers.put_delivery_destination_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"Logs_20140328.PutDeliveryDestination" ~service
      ~context ~input
      ~output_deserializer:Json_deserializers.put_delivery_destination_response_of_yojson
      ~error_deserializer

  let request_with_metadata context (request : put_delivery_destination_request) =
    let input = Json_serializers.put_delivery_destination_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata
      ~shape_name:"Logs_20140328.PutDeliveryDestination" ~service ~context ~input
      ~output_deserializer:Json_deserializers.put_delivery_destination_response_of_yojson
      ~error_deserializer
end

module PutDeliveryDestinationPolicy = struct
  let error_to_string = function
    | `ConflictException _ -> "com.amazonaws.cloudwatchlogs#ConflictException"
    | `ResourceNotFoundException _ -> "com.amazonaws.cloudwatchlogs#ResourceNotFoundException"
    | `ServiceUnavailableException _ -> "com.amazonaws.cloudwatchlogs#ServiceUnavailableException"
    | `ValidationException _ -> "com.amazonaws.cloudwatchlogs#ValidationException"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "ConflictException" ->
          `ConflictException (Json_deserializers.conflict_exception_of_yojson tree path)
      | _, "ResourceNotFoundException" ->
          `ResourceNotFoundException
            (Json_deserializers.resource_not_found_exception_of_yojson tree path)
      | _, "ServiceUnavailableException" ->
          `ServiceUnavailableException
            (Json_deserializers.service_unavailable_exception_of_yojson tree path)
      | _, "ValidationException" ->
          `ValidationException (Json_deserializers.validation_exception_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : put_delivery_destination_policy_request) =
    let input = Json_serializers.put_delivery_destination_policy_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"Logs_20140328.PutDeliveryDestinationPolicy"
      ~service ~context ~input
      ~output_deserializer:Json_deserializers.put_delivery_destination_policy_response_of_yojson
      ~error_deserializer

  let request_with_metadata context (request : put_delivery_destination_policy_request) =
    let input = Json_serializers.put_delivery_destination_policy_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata
      ~shape_name:"Logs_20140328.PutDeliveryDestinationPolicy" ~service ~context ~input
      ~output_deserializer:Json_deserializers.put_delivery_destination_policy_response_of_yojson
      ~error_deserializer
end

module PutDeliverySource = struct
  let error_to_string = function
    | `ConflictException _ -> "com.amazonaws.cloudwatchlogs#ConflictException"
    | `ResourceNotFoundException _ -> "com.amazonaws.cloudwatchlogs#ResourceNotFoundException"
    | `ServiceQuotaExceededException _ ->
        "com.amazonaws.cloudwatchlogs#ServiceQuotaExceededException"
    | `ServiceUnavailableException _ -> "com.amazonaws.cloudwatchlogs#ServiceUnavailableException"
    | `ThrottlingException _ -> "com.amazonaws.cloudwatchlogs#ThrottlingException"
    | `ValidationException _ -> "com.amazonaws.cloudwatchlogs#ValidationException"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "ConflictException" ->
          `ConflictException (Json_deserializers.conflict_exception_of_yojson tree path)
      | _, "ResourceNotFoundException" ->
          `ResourceNotFoundException
            (Json_deserializers.resource_not_found_exception_of_yojson tree path)
      | _, "ServiceQuotaExceededException" ->
          `ServiceQuotaExceededException
            (Json_deserializers.service_quota_exceeded_exception_of_yojson tree path)
      | _, "ServiceUnavailableException" ->
          `ServiceUnavailableException
            (Json_deserializers.service_unavailable_exception_of_yojson tree path)
      | _, "ThrottlingException" ->
          `ThrottlingException (Json_deserializers.throttling_exception_of_yojson tree path)
      | _, "ValidationException" ->
          `ValidationException (Json_deserializers.validation_exception_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : put_delivery_source_request) =
    let input = Json_serializers.put_delivery_source_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"Logs_20140328.PutDeliverySource" ~service
      ~context ~input ~output_deserializer:Json_deserializers.put_delivery_source_response_of_yojson
      ~error_deserializer

  let request_with_metadata context (request : put_delivery_source_request) =
    let input = Json_serializers.put_delivery_source_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata ~shape_name:"Logs_20140328.PutDeliverySource"
      ~service ~context ~input
      ~output_deserializer:Json_deserializers.put_delivery_source_response_of_yojson
      ~error_deserializer
end

module PutDestination = struct
  let error_to_string = function
    | `InvalidParameterException _ -> "com.amazonaws.cloudwatchlogs#InvalidParameterException"
    | `OperationAbortedException _ -> "com.amazonaws.cloudwatchlogs#OperationAbortedException"
    | `ServiceUnavailableException _ -> "com.amazonaws.cloudwatchlogs#ServiceUnavailableException"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "InvalidParameterException" ->
          `InvalidParameterException
            (Json_deserializers.invalid_parameter_exception_of_yojson tree path)
      | _, "OperationAbortedException" ->
          `OperationAbortedException
            (Json_deserializers.operation_aborted_exception_of_yojson tree path)
      | _, "ServiceUnavailableException" ->
          `ServiceUnavailableException
            (Json_deserializers.service_unavailable_exception_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : put_destination_request) =
    let input = Json_serializers.put_destination_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"Logs_20140328.PutDestination" ~service ~context
      ~input ~output_deserializer:Json_deserializers.put_destination_response_of_yojson
      ~error_deserializer

  let request_with_metadata context (request : put_destination_request) =
    let input = Json_serializers.put_destination_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata ~shape_name:"Logs_20140328.PutDestination"
      ~service ~context ~input
      ~output_deserializer:Json_deserializers.put_destination_response_of_yojson ~error_deserializer
end

module PutDestinationPolicy = struct
  let error_to_string = function
    | `InvalidParameterException _ -> "com.amazonaws.cloudwatchlogs#InvalidParameterException"
    | `OperationAbortedException _ -> "com.amazonaws.cloudwatchlogs#OperationAbortedException"
    | `ServiceUnavailableException _ -> "com.amazonaws.cloudwatchlogs#ServiceUnavailableException"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "InvalidParameterException" ->
          `InvalidParameterException
            (Json_deserializers.invalid_parameter_exception_of_yojson tree path)
      | _, "OperationAbortedException" ->
          `OperationAbortedException
            (Json_deserializers.operation_aborted_exception_of_yojson tree path)
      | _, "ServiceUnavailableException" ->
          `ServiceUnavailableException
            (Json_deserializers.service_unavailable_exception_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : put_destination_policy_request) =
    let input = Json_serializers.put_destination_policy_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"Logs_20140328.PutDestinationPolicy" ~service
      ~context ~input ~output_deserializer:Smaws_Lib.Smithy_api.Json_deserializers.unit__of_yojson
      ~error_deserializer

  let request_with_metadata context (request : put_destination_policy_request) =
    let input = Json_serializers.put_destination_policy_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata
      ~shape_name:"Logs_20140328.PutDestinationPolicy" ~service ~context ~input
      ~output_deserializer:Smaws_Lib.Smithy_api.Json_deserializers.unit__of_yojson
      ~error_deserializer
end

module PutIndexPolicy = struct
  let error_to_string = function
    | `InvalidParameterException _ -> "com.amazonaws.cloudwatchlogs#InvalidParameterException"
    | `LimitExceededException _ -> "com.amazonaws.cloudwatchlogs#LimitExceededException"
    | `OperationAbortedException _ -> "com.amazonaws.cloudwatchlogs#OperationAbortedException"
    | `ResourceNotFoundException _ -> "com.amazonaws.cloudwatchlogs#ResourceNotFoundException"
    | `ServiceUnavailableException _ -> "com.amazonaws.cloudwatchlogs#ServiceUnavailableException"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "InvalidParameterException" ->
          `InvalidParameterException
            (Json_deserializers.invalid_parameter_exception_of_yojson tree path)
      | _, "LimitExceededException" ->
          `LimitExceededException (Json_deserializers.limit_exceeded_exception_of_yojson tree path)
      | _, "OperationAbortedException" ->
          `OperationAbortedException
            (Json_deserializers.operation_aborted_exception_of_yojson tree path)
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

  let request context (request : put_index_policy_request) =
    let input = Json_serializers.put_index_policy_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"Logs_20140328.PutIndexPolicy" ~service ~context
      ~input ~output_deserializer:Json_deserializers.put_index_policy_response_of_yojson
      ~error_deserializer

  let request_with_metadata context (request : put_index_policy_request) =
    let input = Json_serializers.put_index_policy_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata ~shape_name:"Logs_20140328.PutIndexPolicy"
      ~service ~context ~input
      ~output_deserializer:Json_deserializers.put_index_policy_response_of_yojson
      ~error_deserializer
end

module PutIntegration = struct
  let error_to_string = function
    | `InvalidParameterException _ -> "com.amazonaws.cloudwatchlogs#InvalidParameterException"
    | `LimitExceededException _ -> "com.amazonaws.cloudwatchlogs#LimitExceededException"
    | `ServiceUnavailableException _ -> "com.amazonaws.cloudwatchlogs#ServiceUnavailableException"
    | `ValidationException _ -> "com.amazonaws.cloudwatchlogs#ValidationException"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "InvalidParameterException" ->
          `InvalidParameterException
            (Json_deserializers.invalid_parameter_exception_of_yojson tree path)
      | _, "LimitExceededException" ->
          `LimitExceededException (Json_deserializers.limit_exceeded_exception_of_yojson tree path)
      | _, "ServiceUnavailableException" ->
          `ServiceUnavailableException
            (Json_deserializers.service_unavailable_exception_of_yojson tree path)
      | _, "ValidationException" ->
          `ValidationException (Json_deserializers.validation_exception_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : put_integration_request) =
    let input = Json_serializers.put_integration_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"Logs_20140328.PutIntegration" ~service ~context
      ~input ~output_deserializer:Json_deserializers.put_integration_response_of_yojson
      ~error_deserializer

  let request_with_metadata context (request : put_integration_request) =
    let input = Json_serializers.put_integration_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata ~shape_name:"Logs_20140328.PutIntegration"
      ~service ~context ~input
      ~output_deserializer:Json_deserializers.put_integration_response_of_yojson ~error_deserializer
end

module PutLogEvents = struct
  let error_to_string = function
    | `DataAlreadyAcceptedException _ -> "com.amazonaws.cloudwatchlogs#DataAlreadyAcceptedException"
    | `InvalidParameterException _ -> "com.amazonaws.cloudwatchlogs#InvalidParameterException"
    | `InvalidSequenceTokenException _ ->
        "com.amazonaws.cloudwatchlogs#InvalidSequenceTokenException"
    | `ResourceNotFoundException _ -> "com.amazonaws.cloudwatchlogs#ResourceNotFoundException"
    | `ServiceUnavailableException _ -> "com.amazonaws.cloudwatchlogs#ServiceUnavailableException"
    | `UnrecognizedClientException _ -> "com.amazonaws.cloudwatchlogs#UnrecognizedClientException"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "DataAlreadyAcceptedException" ->
          `DataAlreadyAcceptedException
            (Json_deserializers.data_already_accepted_exception_of_yojson tree path)
      | _, "InvalidParameterException" ->
          `InvalidParameterException
            (Json_deserializers.invalid_parameter_exception_of_yojson tree path)
      | _, "InvalidSequenceTokenException" ->
          `InvalidSequenceTokenException
            (Json_deserializers.invalid_sequence_token_exception_of_yojson tree path)
      | _, "ResourceNotFoundException" ->
          `ResourceNotFoundException
            (Json_deserializers.resource_not_found_exception_of_yojson tree path)
      | _, "ServiceUnavailableException" ->
          `ServiceUnavailableException
            (Json_deserializers.service_unavailable_exception_of_yojson tree path)
      | _, "UnrecognizedClientException" ->
          `UnrecognizedClientException
            (Json_deserializers.unrecognized_client_exception_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : put_log_events_request) =
    let input = Json_serializers.put_log_events_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"Logs_20140328.PutLogEvents" ~service ~context
      ~input ~output_deserializer:Json_deserializers.put_log_events_response_of_yojson
      ~error_deserializer

  let request_with_metadata context (request : put_log_events_request) =
    let input = Json_serializers.put_log_events_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata ~shape_name:"Logs_20140328.PutLogEvents"
      ~service ~context ~input
      ~output_deserializer:Json_deserializers.put_log_events_response_of_yojson ~error_deserializer
end

module PutLogGroupDeletionProtection = struct
  let error_to_string = function
    | `AccessDeniedException _ -> "com.amazonaws.cloudwatchlogs#AccessDeniedException"
    | `InvalidOperationException _ -> "com.amazonaws.cloudwatchlogs#InvalidOperationException"
    | `InvalidParameterException _ -> "com.amazonaws.cloudwatchlogs#InvalidParameterException"
    | `OperationAbortedException _ -> "com.amazonaws.cloudwatchlogs#OperationAbortedException"
    | `ResourceNotFoundException _ -> "com.amazonaws.cloudwatchlogs#ResourceNotFoundException"
    | `ServiceUnavailableException _ -> "com.amazonaws.cloudwatchlogs#ServiceUnavailableException"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "AccessDeniedException" ->
          `AccessDeniedException (Json_deserializers.access_denied_exception_of_yojson tree path)
      | _, "InvalidOperationException" ->
          `InvalidOperationException
            (Json_deserializers.invalid_operation_exception_of_yojson tree path)
      | _, "InvalidParameterException" ->
          `InvalidParameterException
            (Json_deserializers.invalid_parameter_exception_of_yojson tree path)
      | _, "OperationAbortedException" ->
          `OperationAbortedException
            (Json_deserializers.operation_aborted_exception_of_yojson tree path)
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

  let request context (request : put_log_group_deletion_protection_request) =
    let input = Json_serializers.put_log_group_deletion_protection_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"Logs_20140328.PutLogGroupDeletionProtection"
      ~service ~context ~input
      ~output_deserializer:Smaws_Lib.Smithy_api.Json_deserializers.unit__of_yojson
      ~error_deserializer

  let request_with_metadata context (request : put_log_group_deletion_protection_request) =
    let input = Json_serializers.put_log_group_deletion_protection_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata
      ~shape_name:"Logs_20140328.PutLogGroupDeletionProtection" ~service ~context ~input
      ~output_deserializer:Smaws_Lib.Smithy_api.Json_deserializers.unit__of_yojson
      ~error_deserializer
end

module PutMetricFilter = struct
  let error_to_string = function
    | `InvalidOperationException _ -> "com.amazonaws.cloudwatchlogs#InvalidOperationException"
    | `InvalidParameterException _ -> "com.amazonaws.cloudwatchlogs#InvalidParameterException"
    | `LimitExceededException _ -> "com.amazonaws.cloudwatchlogs#LimitExceededException"
    | `OperationAbortedException _ -> "com.amazonaws.cloudwatchlogs#OperationAbortedException"
    | `ResourceNotFoundException _ -> "com.amazonaws.cloudwatchlogs#ResourceNotFoundException"
    | `ServiceUnavailableException _ -> "com.amazonaws.cloudwatchlogs#ServiceUnavailableException"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "InvalidOperationException" ->
          `InvalidOperationException
            (Json_deserializers.invalid_operation_exception_of_yojson tree path)
      | _, "InvalidParameterException" ->
          `InvalidParameterException
            (Json_deserializers.invalid_parameter_exception_of_yojson tree path)
      | _, "LimitExceededException" ->
          `LimitExceededException (Json_deserializers.limit_exceeded_exception_of_yojson tree path)
      | _, "OperationAbortedException" ->
          `OperationAbortedException
            (Json_deserializers.operation_aborted_exception_of_yojson tree path)
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

  let request context (request : put_metric_filter_request) =
    let input = Json_serializers.put_metric_filter_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"Logs_20140328.PutMetricFilter" ~service
      ~context ~input ~output_deserializer:Smaws_Lib.Smithy_api.Json_deserializers.unit__of_yojson
      ~error_deserializer

  let request_with_metadata context (request : put_metric_filter_request) =
    let input = Json_serializers.put_metric_filter_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata ~shape_name:"Logs_20140328.PutMetricFilter"
      ~service ~context ~input
      ~output_deserializer:Smaws_Lib.Smithy_api.Json_deserializers.unit__of_yojson
      ~error_deserializer
end

module PutQueryDefinition = struct
  let error_to_string = function
    | `InvalidParameterException _ -> "com.amazonaws.cloudwatchlogs#InvalidParameterException"
    | `LimitExceededException _ -> "com.amazonaws.cloudwatchlogs#LimitExceededException"
    | `ResourceNotFoundException _ -> "com.amazonaws.cloudwatchlogs#ResourceNotFoundException"
    | `ServiceUnavailableException _ -> "com.amazonaws.cloudwatchlogs#ServiceUnavailableException"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "InvalidParameterException" ->
          `InvalidParameterException
            (Json_deserializers.invalid_parameter_exception_of_yojson tree path)
      | _, "LimitExceededException" ->
          `LimitExceededException (Json_deserializers.limit_exceeded_exception_of_yojson tree path)
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

  let request context (request : put_query_definition_request) =
    let input = Json_serializers.put_query_definition_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"Logs_20140328.PutQueryDefinition" ~service
      ~context ~input
      ~output_deserializer:Json_deserializers.put_query_definition_response_of_yojson
      ~error_deserializer

  let request_with_metadata context (request : put_query_definition_request) =
    let input = Json_serializers.put_query_definition_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata ~shape_name:"Logs_20140328.PutQueryDefinition"
      ~service ~context ~input
      ~output_deserializer:Json_deserializers.put_query_definition_response_of_yojson
      ~error_deserializer
end

module PutResourcePolicy = struct
  let error_to_string = function
    | `InvalidParameterException _ -> "com.amazonaws.cloudwatchlogs#InvalidParameterException"
    | `LimitExceededException _ -> "com.amazonaws.cloudwatchlogs#LimitExceededException"
    | `OperationAbortedException _ -> "com.amazonaws.cloudwatchlogs#OperationAbortedException"
    | `ResourceNotFoundException _ -> "com.amazonaws.cloudwatchlogs#ResourceNotFoundException"
    | `ServiceUnavailableException _ -> "com.amazonaws.cloudwatchlogs#ServiceUnavailableException"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "InvalidParameterException" ->
          `InvalidParameterException
            (Json_deserializers.invalid_parameter_exception_of_yojson tree path)
      | _, "LimitExceededException" ->
          `LimitExceededException (Json_deserializers.limit_exceeded_exception_of_yojson tree path)
      | _, "OperationAbortedException" ->
          `OperationAbortedException
            (Json_deserializers.operation_aborted_exception_of_yojson tree path)
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

  let request context (request : put_resource_policy_request) =
    let input = Json_serializers.put_resource_policy_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"Logs_20140328.PutResourcePolicy" ~service
      ~context ~input ~output_deserializer:Json_deserializers.put_resource_policy_response_of_yojson
      ~error_deserializer

  let request_with_metadata context (request : put_resource_policy_request) =
    let input = Json_serializers.put_resource_policy_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata ~shape_name:"Logs_20140328.PutResourcePolicy"
      ~service ~context ~input
      ~output_deserializer:Json_deserializers.put_resource_policy_response_of_yojson
      ~error_deserializer
end

module PutRetentionPolicy = struct
  let error_to_string = function
    | `InvalidParameterException _ -> "com.amazonaws.cloudwatchlogs#InvalidParameterException"
    | `OperationAbortedException _ -> "com.amazonaws.cloudwatchlogs#OperationAbortedException"
    | `ResourceNotFoundException _ -> "com.amazonaws.cloudwatchlogs#ResourceNotFoundException"
    | `ServiceUnavailableException _ -> "com.amazonaws.cloudwatchlogs#ServiceUnavailableException"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "InvalidParameterException" ->
          `InvalidParameterException
            (Json_deserializers.invalid_parameter_exception_of_yojson tree path)
      | _, "OperationAbortedException" ->
          `OperationAbortedException
            (Json_deserializers.operation_aborted_exception_of_yojson tree path)
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

  let request context (request : put_retention_policy_request) =
    let input = Json_serializers.put_retention_policy_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"Logs_20140328.PutRetentionPolicy" ~service
      ~context ~input ~output_deserializer:Smaws_Lib.Smithy_api.Json_deserializers.unit__of_yojson
      ~error_deserializer

  let request_with_metadata context (request : put_retention_policy_request) =
    let input = Json_serializers.put_retention_policy_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata ~shape_name:"Logs_20140328.PutRetentionPolicy"
      ~service ~context ~input
      ~output_deserializer:Smaws_Lib.Smithy_api.Json_deserializers.unit__of_yojson
      ~error_deserializer
end

module PutSubscriptionFilter = struct
  let error_to_string = function
    | `InvalidOperationException _ -> "com.amazonaws.cloudwatchlogs#InvalidOperationException"
    | `InvalidParameterException _ -> "com.amazonaws.cloudwatchlogs#InvalidParameterException"
    | `LimitExceededException _ -> "com.amazonaws.cloudwatchlogs#LimitExceededException"
    | `OperationAbortedException _ -> "com.amazonaws.cloudwatchlogs#OperationAbortedException"
    | `ResourceNotFoundException _ -> "com.amazonaws.cloudwatchlogs#ResourceNotFoundException"
    | `ServiceUnavailableException _ -> "com.amazonaws.cloudwatchlogs#ServiceUnavailableException"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "InvalidOperationException" ->
          `InvalidOperationException
            (Json_deserializers.invalid_operation_exception_of_yojson tree path)
      | _, "InvalidParameterException" ->
          `InvalidParameterException
            (Json_deserializers.invalid_parameter_exception_of_yojson tree path)
      | _, "LimitExceededException" ->
          `LimitExceededException (Json_deserializers.limit_exceeded_exception_of_yojson tree path)
      | _, "OperationAbortedException" ->
          `OperationAbortedException
            (Json_deserializers.operation_aborted_exception_of_yojson tree path)
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

  let request context (request : put_subscription_filter_request) =
    let input = Json_serializers.put_subscription_filter_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"Logs_20140328.PutSubscriptionFilter" ~service
      ~context ~input ~output_deserializer:Smaws_Lib.Smithy_api.Json_deserializers.unit__of_yojson
      ~error_deserializer

  let request_with_metadata context (request : put_subscription_filter_request) =
    let input = Json_serializers.put_subscription_filter_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata
      ~shape_name:"Logs_20140328.PutSubscriptionFilter" ~service ~context ~input
      ~output_deserializer:Smaws_Lib.Smithy_api.Json_deserializers.unit__of_yojson
      ~error_deserializer
end

module PutSyslogConfiguration = struct
  let error_to_string = function
    | `AccessDeniedException _ -> "com.amazonaws.cloudwatchlogs#AccessDeniedException"
    | `InvalidOperationException _ -> "com.amazonaws.cloudwatchlogs#InvalidOperationException"
    | `InvalidParameterException _ -> "com.amazonaws.cloudwatchlogs#InvalidParameterException"
    | `OperationAbortedException _ -> "com.amazonaws.cloudwatchlogs#OperationAbortedException"
    | `ResourceNotFoundException _ -> "com.amazonaws.cloudwatchlogs#ResourceNotFoundException"
    | `ServiceUnavailableException _ -> "com.amazonaws.cloudwatchlogs#ServiceUnavailableException"
    | `ThrottlingException _ -> "com.amazonaws.cloudwatchlogs#ThrottlingException"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "AccessDeniedException" ->
          `AccessDeniedException (Json_deserializers.access_denied_exception_of_yojson tree path)
      | _, "InvalidOperationException" ->
          `InvalidOperationException
            (Json_deserializers.invalid_operation_exception_of_yojson tree path)
      | _, "InvalidParameterException" ->
          `InvalidParameterException
            (Json_deserializers.invalid_parameter_exception_of_yojson tree path)
      | _, "OperationAbortedException" ->
          `OperationAbortedException
            (Json_deserializers.operation_aborted_exception_of_yojson tree path)
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

  let request context (request : put_syslog_configuration_request) =
    let input = Json_serializers.put_syslog_configuration_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"Logs_20140328.PutSyslogConfiguration" ~service
      ~context ~input ~output_deserializer:Smaws_Lib.Smithy_api.Json_deserializers.unit__of_yojson
      ~error_deserializer

  let request_with_metadata context (request : put_syslog_configuration_request) =
    let input = Json_serializers.put_syslog_configuration_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata
      ~shape_name:"Logs_20140328.PutSyslogConfiguration" ~service ~context ~input
      ~output_deserializer:Smaws_Lib.Smithy_api.Json_deserializers.unit__of_yojson
      ~error_deserializer
end

module PutTransformer = struct
  let error_to_string = function
    | `InvalidOperationException _ -> "com.amazonaws.cloudwatchlogs#InvalidOperationException"
    | `InvalidParameterException _ -> "com.amazonaws.cloudwatchlogs#InvalidParameterException"
    | `LimitExceededException _ -> "com.amazonaws.cloudwatchlogs#LimitExceededException"
    | `OperationAbortedException _ -> "com.amazonaws.cloudwatchlogs#OperationAbortedException"
    | `ResourceNotFoundException _ -> "com.amazonaws.cloudwatchlogs#ResourceNotFoundException"
    | `ServiceUnavailableException _ -> "com.amazonaws.cloudwatchlogs#ServiceUnavailableException"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "InvalidOperationException" ->
          `InvalidOperationException
            (Json_deserializers.invalid_operation_exception_of_yojson tree path)
      | _, "InvalidParameterException" ->
          `InvalidParameterException
            (Json_deserializers.invalid_parameter_exception_of_yojson tree path)
      | _, "LimitExceededException" ->
          `LimitExceededException (Json_deserializers.limit_exceeded_exception_of_yojson tree path)
      | _, "OperationAbortedException" ->
          `OperationAbortedException
            (Json_deserializers.operation_aborted_exception_of_yojson tree path)
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

  let request context (request : put_transformer_request) =
    let input = Json_serializers.put_transformer_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"Logs_20140328.PutTransformer" ~service ~context
      ~input ~output_deserializer:Smaws_Lib.Smithy_api.Json_deserializers.unit__of_yojson
      ~error_deserializer

  let request_with_metadata context (request : put_transformer_request) =
    let input = Json_serializers.put_transformer_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata ~shape_name:"Logs_20140328.PutTransformer"
      ~service ~context ~input
      ~output_deserializer:Smaws_Lib.Smithy_api.Json_deserializers.unit__of_yojson
      ~error_deserializer
end

module StartLiveTail = struct
  let error_to_string = function
    | `AccessDeniedException _ -> "com.amazonaws.cloudwatchlogs#AccessDeniedException"
    | `InvalidOperationException _ -> "com.amazonaws.cloudwatchlogs#InvalidOperationException"
    | `InvalidParameterException _ -> "com.amazonaws.cloudwatchlogs#InvalidParameterException"
    | `LimitExceededException _ -> "com.amazonaws.cloudwatchlogs#LimitExceededException"
    | `ResourceNotFoundException _ -> "com.amazonaws.cloudwatchlogs#ResourceNotFoundException"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "AccessDeniedException" ->
          `AccessDeniedException (Json_deserializers.access_denied_exception_of_yojson tree path)
      | _, "InvalidOperationException" ->
          `InvalidOperationException
            (Json_deserializers.invalid_operation_exception_of_yojson tree path)
      | _, "InvalidParameterException" ->
          `InvalidParameterException
            (Json_deserializers.invalid_parameter_exception_of_yojson tree path)
      | _, "LimitExceededException" ->
          `LimitExceededException (Json_deserializers.limit_exceeded_exception_of_yojson tree path)
      | _, "ResourceNotFoundException" ->
          `ResourceNotFoundException
            (Json_deserializers.resource_not_found_exception_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : start_live_tail_request) =
    let input = Json_serializers.start_live_tail_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"Logs_20140328.StartLiveTail" ~service ~context
      ~input ~output_deserializer:Json_deserializers.start_live_tail_response_of_yojson
      ~error_deserializer

  let request_with_metadata context (request : start_live_tail_request) =
    let input = Json_serializers.start_live_tail_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata ~shape_name:"Logs_20140328.StartLiveTail"
      ~service ~context ~input
      ~output_deserializer:Json_deserializers.start_live_tail_response_of_yojson ~error_deserializer
end

module StartQuery = struct
  let error_to_string = function
    | `InvalidParameterException _ -> "com.amazonaws.cloudwatchlogs#InvalidParameterException"
    | `LimitExceededException _ -> "com.amazonaws.cloudwatchlogs#LimitExceededException"
    | `MalformedQueryException _ -> "com.amazonaws.cloudwatchlogs#MalformedQueryException"
    | `ResourceNotFoundException _ -> "com.amazonaws.cloudwatchlogs#ResourceNotFoundException"
    | `ServiceUnavailableException _ -> "com.amazonaws.cloudwatchlogs#ServiceUnavailableException"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "InvalidParameterException" ->
          `InvalidParameterException
            (Json_deserializers.invalid_parameter_exception_of_yojson tree path)
      | _, "LimitExceededException" ->
          `LimitExceededException (Json_deserializers.limit_exceeded_exception_of_yojson tree path)
      | _, "MalformedQueryException" ->
          `MalformedQueryException
            (Json_deserializers.malformed_query_exception_of_yojson tree path)
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

  let request context (request : start_query_request) =
    let input = Json_serializers.start_query_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"Logs_20140328.StartQuery" ~service ~context
      ~input ~output_deserializer:Json_deserializers.start_query_response_of_yojson
      ~error_deserializer

  let request_with_metadata context (request : start_query_request) =
    let input = Json_serializers.start_query_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata ~shape_name:"Logs_20140328.StartQuery"
      ~service ~context ~input
      ~output_deserializer:Json_deserializers.start_query_response_of_yojson ~error_deserializer
end

module StopQuery = struct
  let error_to_string = function
    | `InvalidParameterException _ -> "com.amazonaws.cloudwatchlogs#InvalidParameterException"
    | `ResourceNotFoundException _ -> "com.amazonaws.cloudwatchlogs#ResourceNotFoundException"
    | `ServiceUnavailableException _ -> "com.amazonaws.cloudwatchlogs#ServiceUnavailableException"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "InvalidParameterException" ->
          `InvalidParameterException
            (Json_deserializers.invalid_parameter_exception_of_yojson tree path)
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

  let request context (request : stop_query_request) =
    let input = Json_serializers.stop_query_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"Logs_20140328.StopQuery" ~service ~context
      ~input ~output_deserializer:Json_deserializers.stop_query_response_of_yojson
      ~error_deserializer

  let request_with_metadata context (request : stop_query_request) =
    let input = Json_serializers.stop_query_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata ~shape_name:"Logs_20140328.StopQuery" ~service
      ~context ~input ~output_deserializer:Json_deserializers.stop_query_response_of_yojson
      ~error_deserializer
end

module TagLogGroup = struct
  let error_to_string = function
    | `InvalidParameterException _ -> "com.amazonaws.cloudwatchlogs#InvalidParameterException"
    | `ResourceNotFoundException _ -> "com.amazonaws.cloudwatchlogs#ResourceNotFoundException"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
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

  let request context (request : tag_log_group_request) =
    let input = Json_serializers.tag_log_group_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"Logs_20140328.TagLogGroup" ~service ~context
      ~input ~output_deserializer:Smaws_Lib.Smithy_api.Json_deserializers.unit__of_yojson
      ~error_deserializer

  let request_with_metadata context (request : tag_log_group_request) =
    let input = Json_serializers.tag_log_group_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata ~shape_name:"Logs_20140328.TagLogGroup"
      ~service ~context ~input
      ~output_deserializer:Smaws_Lib.Smithy_api.Json_deserializers.unit__of_yojson
      ~error_deserializer
end

module TagResource = struct
  let error_to_string = function
    | `InvalidParameterException _ -> "com.amazonaws.cloudwatchlogs#InvalidParameterException"
    | `ResourceNotFoundException _ -> "com.amazonaws.cloudwatchlogs#ResourceNotFoundException"
    | `ServiceUnavailableException _ -> "com.amazonaws.cloudwatchlogs#ServiceUnavailableException"
    | `TooManyTagsException _ -> "com.amazonaws.cloudwatchlogs#TooManyTagsException"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "InvalidParameterException" ->
          `InvalidParameterException
            (Json_deserializers.invalid_parameter_exception_of_yojson tree path)
      | _, "ResourceNotFoundException" ->
          `ResourceNotFoundException
            (Json_deserializers.resource_not_found_exception_of_yojson tree path)
      | _, "ServiceUnavailableException" ->
          `ServiceUnavailableException
            (Json_deserializers.service_unavailable_exception_of_yojson tree path)
      | _, "TooManyTagsException" ->
          `TooManyTagsException (Json_deserializers.too_many_tags_exception_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : tag_resource_request) =
    let input = Json_serializers.tag_resource_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"Logs_20140328.TagResource" ~service ~context
      ~input ~output_deserializer:Smaws_Lib.Smithy_api.Json_deserializers.unit__of_yojson
      ~error_deserializer

  let request_with_metadata context (request : tag_resource_request) =
    let input = Json_serializers.tag_resource_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata ~shape_name:"Logs_20140328.TagResource"
      ~service ~context ~input
      ~output_deserializer:Smaws_Lib.Smithy_api.Json_deserializers.unit__of_yojson
      ~error_deserializer
end

module TestMetricFilter = struct
  let error_to_string = function
    | `InvalidParameterException _ -> "com.amazonaws.cloudwatchlogs#InvalidParameterException"
    | `ServiceUnavailableException _ -> "com.amazonaws.cloudwatchlogs#ServiceUnavailableException"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "InvalidParameterException" ->
          `InvalidParameterException
            (Json_deserializers.invalid_parameter_exception_of_yojson tree path)
      | _, "ServiceUnavailableException" ->
          `ServiceUnavailableException
            (Json_deserializers.service_unavailable_exception_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : test_metric_filter_request) =
    let input = Json_serializers.test_metric_filter_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"Logs_20140328.TestMetricFilter" ~service
      ~context ~input ~output_deserializer:Json_deserializers.test_metric_filter_response_of_yojson
      ~error_deserializer

  let request_with_metadata context (request : test_metric_filter_request) =
    let input = Json_serializers.test_metric_filter_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata ~shape_name:"Logs_20140328.TestMetricFilter"
      ~service ~context ~input
      ~output_deserializer:Json_deserializers.test_metric_filter_response_of_yojson
      ~error_deserializer
end

module TestTransformer = struct
  let error_to_string = function
    | `InvalidOperationException _ -> "com.amazonaws.cloudwatchlogs#InvalidOperationException"
    | `InvalidParameterException _ -> "com.amazonaws.cloudwatchlogs#InvalidParameterException"
    | `ServiceUnavailableException _ -> "com.amazonaws.cloudwatchlogs#ServiceUnavailableException"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "InvalidOperationException" ->
          `InvalidOperationException
            (Json_deserializers.invalid_operation_exception_of_yojson tree path)
      | _, "InvalidParameterException" ->
          `InvalidParameterException
            (Json_deserializers.invalid_parameter_exception_of_yojson tree path)
      | _, "ServiceUnavailableException" ->
          `ServiceUnavailableException
            (Json_deserializers.service_unavailable_exception_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : test_transformer_request) =
    let input = Json_serializers.test_transformer_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"Logs_20140328.TestTransformer" ~service
      ~context ~input ~output_deserializer:Json_deserializers.test_transformer_response_of_yojson
      ~error_deserializer

  let request_with_metadata context (request : test_transformer_request) =
    let input = Json_serializers.test_transformer_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata ~shape_name:"Logs_20140328.TestTransformer"
      ~service ~context ~input
      ~output_deserializer:Json_deserializers.test_transformer_response_of_yojson
      ~error_deserializer
end

module UntagLogGroup = struct
  let error_to_string = function
    | `ResourceNotFoundException _ -> "com.amazonaws.cloudwatchlogs#ResourceNotFoundException"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "ResourceNotFoundException" ->
          `ResourceNotFoundException
            (Json_deserializers.resource_not_found_exception_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : untag_log_group_request) =
    let input = Json_serializers.untag_log_group_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"Logs_20140328.UntagLogGroup" ~service ~context
      ~input ~output_deserializer:Smaws_Lib.Smithy_api.Json_deserializers.unit__of_yojson
      ~error_deserializer

  let request_with_metadata context (request : untag_log_group_request) =
    let input = Json_serializers.untag_log_group_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata ~shape_name:"Logs_20140328.UntagLogGroup"
      ~service ~context ~input
      ~output_deserializer:Smaws_Lib.Smithy_api.Json_deserializers.unit__of_yojson
      ~error_deserializer
end

module UntagResource = struct
  let error_to_string = function
    | `InvalidParameterException _ -> "com.amazonaws.cloudwatchlogs#InvalidParameterException"
    | `ResourceNotFoundException _ -> "com.amazonaws.cloudwatchlogs#ResourceNotFoundException"
    | `ServiceUnavailableException _ -> "com.amazonaws.cloudwatchlogs#ServiceUnavailableException"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "InvalidParameterException" ->
          `InvalidParameterException
            (Json_deserializers.invalid_parameter_exception_of_yojson tree path)
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
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"Logs_20140328.UntagResource" ~service ~context
      ~input ~output_deserializer:Smaws_Lib.Smithy_api.Json_deserializers.unit__of_yojson
      ~error_deserializer

  let request_with_metadata context (request : untag_resource_request) =
    let input = Json_serializers.untag_resource_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata ~shape_name:"Logs_20140328.UntagResource"
      ~service ~context ~input
      ~output_deserializer:Smaws_Lib.Smithy_api.Json_deserializers.unit__of_yojson
      ~error_deserializer
end

module UpdateAnomaly = struct
  let error_to_string = function
    | `InvalidParameterException _ -> "com.amazonaws.cloudwatchlogs#InvalidParameterException"
    | `OperationAbortedException _ -> "com.amazonaws.cloudwatchlogs#OperationAbortedException"
    | `ResourceNotFoundException _ -> "com.amazonaws.cloudwatchlogs#ResourceNotFoundException"
    | `ServiceUnavailableException _ -> "com.amazonaws.cloudwatchlogs#ServiceUnavailableException"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "InvalidParameterException" ->
          `InvalidParameterException
            (Json_deserializers.invalid_parameter_exception_of_yojson tree path)
      | _, "OperationAbortedException" ->
          `OperationAbortedException
            (Json_deserializers.operation_aborted_exception_of_yojson tree path)
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

  let request context (request : update_anomaly_request) =
    let input = Json_serializers.update_anomaly_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"Logs_20140328.UpdateAnomaly" ~service ~context
      ~input ~output_deserializer:Smaws_Lib.Smithy_api.Json_deserializers.unit__of_yojson
      ~error_deserializer

  let request_with_metadata context (request : update_anomaly_request) =
    let input = Json_serializers.update_anomaly_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata ~shape_name:"Logs_20140328.UpdateAnomaly"
      ~service ~context ~input
      ~output_deserializer:Smaws_Lib.Smithy_api.Json_deserializers.unit__of_yojson
      ~error_deserializer
end

module UpdateDeliveryConfiguration = struct
  let error_to_string = function
    | `AccessDeniedException _ -> "com.amazonaws.cloudwatchlogs#AccessDeniedException"
    | `ConflictException _ -> "com.amazonaws.cloudwatchlogs#ConflictException"
    | `ResourceNotFoundException _ -> "com.amazonaws.cloudwatchlogs#ResourceNotFoundException"
    | `ServiceUnavailableException _ -> "com.amazonaws.cloudwatchlogs#ServiceUnavailableException"
    | `ThrottlingException _ -> "com.amazonaws.cloudwatchlogs#ThrottlingException"
    | `ValidationException _ -> "com.amazonaws.cloudwatchlogs#ValidationException"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "AccessDeniedException" ->
          `AccessDeniedException (Json_deserializers.access_denied_exception_of_yojson tree path)
      | _, "ConflictException" ->
          `ConflictException (Json_deserializers.conflict_exception_of_yojson tree path)
      | _, "ResourceNotFoundException" ->
          `ResourceNotFoundException
            (Json_deserializers.resource_not_found_exception_of_yojson tree path)
      | _, "ServiceUnavailableException" ->
          `ServiceUnavailableException
            (Json_deserializers.service_unavailable_exception_of_yojson tree path)
      | _, "ThrottlingException" ->
          `ThrottlingException (Json_deserializers.throttling_exception_of_yojson tree path)
      | _, "ValidationException" ->
          `ValidationException (Json_deserializers.validation_exception_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : update_delivery_configuration_request) =
    let input = Json_serializers.update_delivery_configuration_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"Logs_20140328.UpdateDeliveryConfiguration"
      ~service ~context ~input
      ~output_deserializer:Json_deserializers.update_delivery_configuration_response_of_yojson
      ~error_deserializer

  let request_with_metadata context (request : update_delivery_configuration_request) =
    let input = Json_serializers.update_delivery_configuration_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata
      ~shape_name:"Logs_20140328.UpdateDeliveryConfiguration" ~service ~context ~input
      ~output_deserializer:Json_deserializers.update_delivery_configuration_response_of_yojson
      ~error_deserializer
end

module UpdateLogAnomalyDetector = struct
  let error_to_string = function
    | `InvalidParameterException _ -> "com.amazonaws.cloudwatchlogs#InvalidParameterException"
    | `OperationAbortedException _ -> "com.amazonaws.cloudwatchlogs#OperationAbortedException"
    | `ResourceNotFoundException _ -> "com.amazonaws.cloudwatchlogs#ResourceNotFoundException"
    | `ServiceUnavailableException _ -> "com.amazonaws.cloudwatchlogs#ServiceUnavailableException"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "InvalidParameterException" ->
          `InvalidParameterException
            (Json_deserializers.invalid_parameter_exception_of_yojson tree path)
      | _, "OperationAbortedException" ->
          `OperationAbortedException
            (Json_deserializers.operation_aborted_exception_of_yojson tree path)
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

  let request context (request : update_log_anomaly_detector_request) =
    let input = Json_serializers.update_log_anomaly_detector_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"Logs_20140328.UpdateLogAnomalyDetector"
      ~service ~context ~input
      ~output_deserializer:Smaws_Lib.Smithy_api.Json_deserializers.unit__of_yojson
      ~error_deserializer

  let request_with_metadata context (request : update_log_anomaly_detector_request) =
    let input = Json_serializers.update_log_anomaly_detector_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata
      ~shape_name:"Logs_20140328.UpdateLogAnomalyDetector" ~service ~context ~input
      ~output_deserializer:Smaws_Lib.Smithy_api.Json_deserializers.unit__of_yojson
      ~error_deserializer
end

module UpdateLookupTable = struct
  let error_to_string = function
    | `AccessDeniedException _ -> "com.amazonaws.cloudwatchlogs#AccessDeniedException"
    | `InvalidParameterException _ -> "com.amazonaws.cloudwatchlogs#InvalidParameterException"
    | `ResourceNotFoundException _ -> "com.amazonaws.cloudwatchlogs#ResourceNotFoundException"
    | `ServiceUnavailableException _ -> "com.amazonaws.cloudwatchlogs#ServiceUnavailableException"
    | `ValidationException _ -> "com.amazonaws.cloudwatchlogs#ValidationException"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "AccessDeniedException" ->
          `AccessDeniedException (Json_deserializers.access_denied_exception_of_yojson tree path)
      | _, "InvalidParameterException" ->
          `InvalidParameterException
            (Json_deserializers.invalid_parameter_exception_of_yojson tree path)
      | _, "ResourceNotFoundException" ->
          `ResourceNotFoundException
            (Json_deserializers.resource_not_found_exception_of_yojson tree path)
      | _, "ServiceUnavailableException" ->
          `ServiceUnavailableException
            (Json_deserializers.service_unavailable_exception_of_yojson tree path)
      | _, "ValidationException" ->
          `ValidationException (Json_deserializers.validation_exception_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : update_lookup_table_request) =
    let input = Json_serializers.update_lookup_table_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"Logs_20140328.UpdateLookupTable" ~service
      ~context ~input ~output_deserializer:Json_deserializers.update_lookup_table_response_of_yojson
      ~error_deserializer

  let request_with_metadata context (request : update_lookup_table_request) =
    let input = Json_serializers.update_lookup_table_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata ~shape_name:"Logs_20140328.UpdateLookupTable"
      ~service ~context ~input
      ~output_deserializer:Json_deserializers.update_lookup_table_response_of_yojson
      ~error_deserializer
end

module UpdateScheduledQuery = struct
  let error_to_string = function
    | `AccessDeniedException _ -> "com.amazonaws.cloudwatchlogs#AccessDeniedException"
    | `ConflictException _ -> "com.amazonaws.cloudwatchlogs#ConflictException"
    | `InternalServerException _ -> "com.amazonaws.cloudwatchlogs#InternalServerException"
    | `ResourceNotFoundException _ -> "com.amazonaws.cloudwatchlogs#ResourceNotFoundException"
    | `ThrottlingException _ -> "com.amazonaws.cloudwatchlogs#ThrottlingException"
    | `ValidationException _ -> "com.amazonaws.cloudwatchlogs#ValidationException"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "AccessDeniedException" ->
          `AccessDeniedException (Json_deserializers.access_denied_exception_of_yojson tree path)
      | _, "ConflictException" ->
          `ConflictException (Json_deserializers.conflict_exception_of_yojson tree path)
      | _, "InternalServerException" ->
          `InternalServerException
            (Json_deserializers.internal_server_exception_of_yojson tree path)
      | _, "ResourceNotFoundException" ->
          `ResourceNotFoundException
            (Json_deserializers.resource_not_found_exception_of_yojson tree path)
      | _, "ThrottlingException" ->
          `ThrottlingException (Json_deserializers.throttling_exception_of_yojson tree path)
      | _, "ValidationException" ->
          `ValidationException (Json_deserializers.validation_exception_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : update_scheduled_query_request) =
    let input = Json_serializers.update_scheduled_query_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"Logs_20140328.UpdateScheduledQuery" ~service
      ~context ~input
      ~output_deserializer:Json_deserializers.update_scheduled_query_response_of_yojson
      ~error_deserializer

  let request_with_metadata context (request : update_scheduled_query_request) =
    let input = Json_serializers.update_scheduled_query_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata
      ~shape_name:"Logs_20140328.UpdateScheduledQuery" ~service ~context ~input
      ~output_deserializer:Json_deserializers.update_scheduled_query_response_of_yojson
      ~error_deserializer
end

module ListTagsLogGroup = struct
  let error_to_string = function
    | `ResourceNotFoundException _ -> "com.amazonaws.cloudwatchlogs#ResourceNotFoundException"
    | `ServiceUnavailableException _ -> "com.amazonaws.cloudwatchlogs#ServiceUnavailableException"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
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

  let request context (request : list_tags_log_group_request) =
    let input = Json_serializers.list_tags_log_group_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"Logs_20140328.ListTagsLogGroup" ~service
      ~context ~input ~output_deserializer:Json_deserializers.list_tags_log_group_response_of_yojson
      ~error_deserializer

  let request_with_metadata context (request : list_tags_log_group_request) =
    let input = Json_serializers.list_tags_log_group_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata ~shape_name:"Logs_20140328.ListTagsLogGroup"
      ~service ~context ~input
      ~output_deserializer:Json_deserializers.list_tags_log_group_response_of_yojson
      ~error_deserializer
end

module ListTagsForResource = struct
  let error_to_string = function
    | `InvalidParameterException _ -> "com.amazonaws.cloudwatchlogs#InvalidParameterException"
    | `ResourceNotFoundException _ -> "com.amazonaws.cloudwatchlogs#ResourceNotFoundException"
    | `ServiceUnavailableException _ -> "com.amazonaws.cloudwatchlogs#ServiceUnavailableException"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "InvalidParameterException" ->
          `InvalidParameterException
            (Json_deserializers.invalid_parameter_exception_of_yojson tree path)
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

  let request context (request : list_tags_for_resource_request) =
    let input = Json_serializers.list_tags_for_resource_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"Logs_20140328.ListTagsForResource" ~service
      ~context ~input
      ~output_deserializer:Json_deserializers.list_tags_for_resource_response_of_yojson
      ~error_deserializer

  let request_with_metadata context (request : list_tags_for_resource_request) =
    let input = Json_serializers.list_tags_for_resource_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata
      ~shape_name:"Logs_20140328.ListTagsForResource" ~service ~context ~input
      ~output_deserializer:Json_deserializers.list_tags_for_resource_response_of_yojson
      ~error_deserializer
end

module ListSyslogConfigurations = struct
  let error_to_string = function
    | `AccessDeniedException _ -> "com.amazonaws.cloudwatchlogs#AccessDeniedException"
    | `InvalidOperationException _ -> "com.amazonaws.cloudwatchlogs#InvalidOperationException"
    | `InvalidParameterException _ -> "com.amazonaws.cloudwatchlogs#InvalidParameterException"
    | `ResourceNotFoundException _ -> "com.amazonaws.cloudwatchlogs#ResourceNotFoundException"
    | `ServiceUnavailableException _ -> "com.amazonaws.cloudwatchlogs#ServiceUnavailableException"
    | `ThrottlingException _ -> "com.amazonaws.cloudwatchlogs#ThrottlingException"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "AccessDeniedException" ->
          `AccessDeniedException (Json_deserializers.access_denied_exception_of_yojson tree path)
      | _, "InvalidOperationException" ->
          `InvalidOperationException
            (Json_deserializers.invalid_operation_exception_of_yojson tree path)
      | _, "InvalidParameterException" ->
          `InvalidParameterException
            (Json_deserializers.invalid_parameter_exception_of_yojson tree path)
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

  let request context (request : list_syslog_configurations_request) =
    let input = Json_serializers.list_syslog_configurations_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"Logs_20140328.ListSyslogConfigurations"
      ~service ~context ~input
      ~output_deserializer:Json_deserializers.list_syslog_configurations_response_of_yojson
      ~error_deserializer

  let request_with_metadata context (request : list_syslog_configurations_request) =
    let input = Json_serializers.list_syslog_configurations_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata
      ~shape_name:"Logs_20140328.ListSyslogConfigurations" ~service ~context ~input
      ~output_deserializer:Json_deserializers.list_syslog_configurations_response_of_yojson
      ~error_deserializer
end

module ListSourcesForS3TableIntegration = struct
  let error_to_string = function
    | `AccessDeniedException _ -> "com.amazonaws.cloudwatchlogs#AccessDeniedException"
    | `InternalServerException _ -> "com.amazonaws.cloudwatchlogs#InternalServerException"
    | `ResourceNotFoundException _ -> "com.amazonaws.cloudwatchlogs#ResourceNotFoundException"
    | `ThrottlingException _ -> "com.amazonaws.cloudwatchlogs#ThrottlingException"
    | `ValidationException _ -> "com.amazonaws.cloudwatchlogs#ValidationException"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "AccessDeniedException" ->
          `AccessDeniedException (Json_deserializers.access_denied_exception_of_yojson tree path)
      | _, "InternalServerException" ->
          `InternalServerException
            (Json_deserializers.internal_server_exception_of_yojson tree path)
      | _, "ResourceNotFoundException" ->
          `ResourceNotFoundException
            (Json_deserializers.resource_not_found_exception_of_yojson tree path)
      | _, "ThrottlingException" ->
          `ThrottlingException (Json_deserializers.throttling_exception_of_yojson tree path)
      | _, "ValidationException" ->
          `ValidationException (Json_deserializers.validation_exception_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : list_sources_for_s3_table_integration_request) =
    let input = Json_serializers.list_sources_for_s3_table_integration_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"Logs_20140328.ListSourcesForS3TableIntegration"
      ~service ~context ~input
      ~output_deserializer:
        Json_deserializers.list_sources_for_s3_table_integration_response_of_yojson
      ~error_deserializer

  let request_with_metadata context (request : list_sources_for_s3_table_integration_request) =
    let input = Json_serializers.list_sources_for_s3_table_integration_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata
      ~shape_name:"Logs_20140328.ListSourcesForS3TableIntegration" ~service ~context ~input
      ~output_deserializer:
        Json_deserializers.list_sources_for_s3_table_integration_response_of_yojson
      ~error_deserializer
end

module ListScheduledQueries = struct
  let error_to_string = function
    | `AccessDeniedException _ -> "com.amazonaws.cloudwatchlogs#AccessDeniedException"
    | `InternalServerException _ -> "com.amazonaws.cloudwatchlogs#InternalServerException"
    | `ThrottlingException _ -> "com.amazonaws.cloudwatchlogs#ThrottlingException"
    | `ValidationException _ -> "com.amazonaws.cloudwatchlogs#ValidationException"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "AccessDeniedException" ->
          `AccessDeniedException (Json_deserializers.access_denied_exception_of_yojson tree path)
      | _, "InternalServerException" ->
          `InternalServerException
            (Json_deserializers.internal_server_exception_of_yojson tree path)
      | _, "ThrottlingException" ->
          `ThrottlingException (Json_deserializers.throttling_exception_of_yojson tree path)
      | _, "ValidationException" ->
          `ValidationException (Json_deserializers.validation_exception_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : list_scheduled_queries_request) =
    let input = Json_serializers.list_scheduled_queries_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"Logs_20140328.ListScheduledQueries" ~service
      ~context ~input
      ~output_deserializer:Json_deserializers.list_scheduled_queries_response_of_yojson
      ~error_deserializer

  let request_with_metadata context (request : list_scheduled_queries_request) =
    let input = Json_serializers.list_scheduled_queries_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata
      ~shape_name:"Logs_20140328.ListScheduledQueries" ~service ~context ~input
      ~output_deserializer:Json_deserializers.list_scheduled_queries_response_of_yojson
      ~error_deserializer
end

module ListLogGroupsForQuery = struct
  let error_to_string = function
    | `AccessDeniedException _ -> "com.amazonaws.cloudwatchlogs#AccessDeniedException"
    | `InvalidParameterException _ -> "com.amazonaws.cloudwatchlogs#InvalidParameterException"
    | `ResourceNotFoundException _ -> "com.amazonaws.cloudwatchlogs#ResourceNotFoundException"
    | `ServiceUnavailableException _ -> "com.amazonaws.cloudwatchlogs#ServiceUnavailableException"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "AccessDeniedException" ->
          `AccessDeniedException (Json_deserializers.access_denied_exception_of_yojson tree path)
      | _, "InvalidParameterException" ->
          `InvalidParameterException
            (Json_deserializers.invalid_parameter_exception_of_yojson tree path)
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

  let request context (request : list_log_groups_for_query_request) =
    let input = Json_serializers.list_log_groups_for_query_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"Logs_20140328.ListLogGroupsForQuery" ~service
      ~context ~input
      ~output_deserializer:Json_deserializers.list_log_groups_for_query_response_of_yojson
      ~error_deserializer

  let request_with_metadata context (request : list_log_groups_for_query_request) =
    let input = Json_serializers.list_log_groups_for_query_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata
      ~shape_name:"Logs_20140328.ListLogGroupsForQuery" ~service ~context ~input
      ~output_deserializer:Json_deserializers.list_log_groups_for_query_response_of_yojson
      ~error_deserializer
end

module ListLogGroups = struct
  let error_to_string = function
    | `InvalidParameterException _ -> "com.amazonaws.cloudwatchlogs#InvalidParameterException"
    | `ServiceUnavailableException _ -> "com.amazonaws.cloudwatchlogs#ServiceUnavailableException"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "InvalidParameterException" ->
          `InvalidParameterException
            (Json_deserializers.invalid_parameter_exception_of_yojson tree path)
      | _, "ServiceUnavailableException" ->
          `ServiceUnavailableException
            (Json_deserializers.service_unavailable_exception_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : list_log_groups_request) =
    let input = Json_serializers.list_log_groups_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"Logs_20140328.ListLogGroups" ~service ~context
      ~input ~output_deserializer:Json_deserializers.list_log_groups_response_of_yojson
      ~error_deserializer

  let request_with_metadata context (request : list_log_groups_request) =
    let input = Json_serializers.list_log_groups_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata ~shape_name:"Logs_20140328.ListLogGroups"
      ~service ~context ~input
      ~output_deserializer:Json_deserializers.list_log_groups_response_of_yojson ~error_deserializer
end

module ListLogAnomalyDetectors = struct
  let error_to_string = function
    | `InvalidParameterException _ -> "com.amazonaws.cloudwatchlogs#InvalidParameterException"
    | `OperationAbortedException _ -> "com.amazonaws.cloudwatchlogs#OperationAbortedException"
    | `ResourceNotFoundException _ -> "com.amazonaws.cloudwatchlogs#ResourceNotFoundException"
    | `ServiceUnavailableException _ -> "com.amazonaws.cloudwatchlogs#ServiceUnavailableException"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "InvalidParameterException" ->
          `InvalidParameterException
            (Json_deserializers.invalid_parameter_exception_of_yojson tree path)
      | _, "OperationAbortedException" ->
          `OperationAbortedException
            (Json_deserializers.operation_aborted_exception_of_yojson tree path)
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

  let request context (request : list_log_anomaly_detectors_request) =
    let input = Json_serializers.list_log_anomaly_detectors_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"Logs_20140328.ListLogAnomalyDetectors" ~service
      ~context ~input
      ~output_deserializer:Json_deserializers.list_log_anomaly_detectors_response_of_yojson
      ~error_deserializer

  let request_with_metadata context (request : list_log_anomaly_detectors_request) =
    let input = Json_serializers.list_log_anomaly_detectors_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata
      ~shape_name:"Logs_20140328.ListLogAnomalyDetectors" ~service ~context ~input
      ~output_deserializer:Json_deserializers.list_log_anomaly_detectors_response_of_yojson
      ~error_deserializer
end

module ListIntegrations = struct
  let error_to_string = function
    | `InvalidParameterException _ -> "com.amazonaws.cloudwatchlogs#InvalidParameterException"
    | `ServiceUnavailableException _ -> "com.amazonaws.cloudwatchlogs#ServiceUnavailableException"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "InvalidParameterException" ->
          `InvalidParameterException
            (Json_deserializers.invalid_parameter_exception_of_yojson tree path)
      | _, "ServiceUnavailableException" ->
          `ServiceUnavailableException
            (Json_deserializers.service_unavailable_exception_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : list_integrations_request) =
    let input = Json_serializers.list_integrations_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"Logs_20140328.ListIntegrations" ~service
      ~context ~input ~output_deserializer:Json_deserializers.list_integrations_response_of_yojson
      ~error_deserializer

  let request_with_metadata context (request : list_integrations_request) =
    let input = Json_serializers.list_integrations_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata ~shape_name:"Logs_20140328.ListIntegrations"
      ~service ~context ~input
      ~output_deserializer:Json_deserializers.list_integrations_response_of_yojson
      ~error_deserializer
end

module ListAnomalies = struct
  let error_to_string = function
    | `InvalidParameterException _ -> "com.amazonaws.cloudwatchlogs#InvalidParameterException"
    | `OperationAbortedException _ -> "com.amazonaws.cloudwatchlogs#OperationAbortedException"
    | `ResourceNotFoundException _ -> "com.amazonaws.cloudwatchlogs#ResourceNotFoundException"
    | `ServiceUnavailableException _ -> "com.amazonaws.cloudwatchlogs#ServiceUnavailableException"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "InvalidParameterException" ->
          `InvalidParameterException
            (Json_deserializers.invalid_parameter_exception_of_yojson tree path)
      | _, "OperationAbortedException" ->
          `OperationAbortedException
            (Json_deserializers.operation_aborted_exception_of_yojson tree path)
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

  let request context (request : list_anomalies_request) =
    let input = Json_serializers.list_anomalies_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"Logs_20140328.ListAnomalies" ~service ~context
      ~input ~output_deserializer:Json_deserializers.list_anomalies_response_of_yojson
      ~error_deserializer

  let request_with_metadata context (request : list_anomalies_request) =
    let input = Json_serializers.list_anomalies_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata ~shape_name:"Logs_20140328.ListAnomalies"
      ~service ~context ~input
      ~output_deserializer:Json_deserializers.list_anomalies_response_of_yojson ~error_deserializer
end

module ListAggregateLogGroupSummaries = struct
  let error_to_string = function
    | `InvalidParameterException _ -> "com.amazonaws.cloudwatchlogs#InvalidParameterException"
    | `ServiceUnavailableException _ -> "com.amazonaws.cloudwatchlogs#ServiceUnavailableException"
    | `ValidationException _ -> "com.amazonaws.cloudwatchlogs#ValidationException"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "InvalidParameterException" ->
          `InvalidParameterException
            (Json_deserializers.invalid_parameter_exception_of_yojson tree path)
      | _, "ServiceUnavailableException" ->
          `ServiceUnavailableException
            (Json_deserializers.service_unavailable_exception_of_yojson tree path)
      | _, "ValidationException" ->
          `ValidationException (Json_deserializers.validation_exception_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : list_aggregate_log_group_summaries_request) =
    let input = Json_serializers.list_aggregate_log_group_summaries_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"Logs_20140328.ListAggregateLogGroupSummaries"
      ~service ~context ~input
      ~output_deserializer:Json_deserializers.list_aggregate_log_group_summaries_response_of_yojson
      ~error_deserializer

  let request_with_metadata context (request : list_aggregate_log_group_summaries_request) =
    let input = Json_serializers.list_aggregate_log_group_summaries_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata
      ~shape_name:"Logs_20140328.ListAggregateLogGroupSummaries" ~service ~context ~input
      ~output_deserializer:Json_deserializers.list_aggregate_log_group_summaries_response_of_yojson
      ~error_deserializer
end

module GetTransformer = struct
  let error_to_string = function
    | `InvalidOperationException _ -> "com.amazonaws.cloudwatchlogs#InvalidOperationException"
    | `InvalidParameterException _ -> "com.amazonaws.cloudwatchlogs#InvalidParameterException"
    | `ResourceNotFoundException _ -> "com.amazonaws.cloudwatchlogs#ResourceNotFoundException"
    | `ServiceUnavailableException _ -> "com.amazonaws.cloudwatchlogs#ServiceUnavailableException"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "InvalidOperationException" ->
          `InvalidOperationException
            (Json_deserializers.invalid_operation_exception_of_yojson tree path)
      | _, "InvalidParameterException" ->
          `InvalidParameterException
            (Json_deserializers.invalid_parameter_exception_of_yojson tree path)
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

  let request context (request : get_transformer_request) =
    let input = Json_serializers.get_transformer_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"Logs_20140328.GetTransformer" ~service ~context
      ~input ~output_deserializer:Json_deserializers.get_transformer_response_of_yojson
      ~error_deserializer

  let request_with_metadata context (request : get_transformer_request) =
    let input = Json_serializers.get_transformer_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata ~shape_name:"Logs_20140328.GetTransformer"
      ~service ~context ~input
      ~output_deserializer:Json_deserializers.get_transformer_response_of_yojson ~error_deserializer
end

module GetScheduledQueryHistory = struct
  let error_to_string = function
    | `AccessDeniedException _ -> "com.amazonaws.cloudwatchlogs#AccessDeniedException"
    | `InternalServerException _ -> "com.amazonaws.cloudwatchlogs#InternalServerException"
    | `ResourceNotFoundException _ -> "com.amazonaws.cloudwatchlogs#ResourceNotFoundException"
    | `ThrottlingException _ -> "com.amazonaws.cloudwatchlogs#ThrottlingException"
    | `ValidationException _ -> "com.amazonaws.cloudwatchlogs#ValidationException"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "AccessDeniedException" ->
          `AccessDeniedException (Json_deserializers.access_denied_exception_of_yojson tree path)
      | _, "InternalServerException" ->
          `InternalServerException
            (Json_deserializers.internal_server_exception_of_yojson tree path)
      | _, "ResourceNotFoundException" ->
          `ResourceNotFoundException
            (Json_deserializers.resource_not_found_exception_of_yojson tree path)
      | _, "ThrottlingException" ->
          `ThrottlingException (Json_deserializers.throttling_exception_of_yojson tree path)
      | _, "ValidationException" ->
          `ValidationException (Json_deserializers.validation_exception_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : get_scheduled_query_history_request) =
    let input = Json_serializers.get_scheduled_query_history_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"Logs_20140328.GetScheduledQueryHistory"
      ~service ~context ~input
      ~output_deserializer:Json_deserializers.get_scheduled_query_history_response_of_yojson
      ~error_deserializer

  let request_with_metadata context (request : get_scheduled_query_history_request) =
    let input = Json_serializers.get_scheduled_query_history_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata
      ~shape_name:"Logs_20140328.GetScheduledQueryHistory" ~service ~context ~input
      ~output_deserializer:Json_deserializers.get_scheduled_query_history_response_of_yojson
      ~error_deserializer
end

module GetScheduledQuery = struct
  let error_to_string = function
    | `AccessDeniedException _ -> "com.amazonaws.cloudwatchlogs#AccessDeniedException"
    | `InternalServerException _ -> "com.amazonaws.cloudwatchlogs#InternalServerException"
    | `ResourceNotFoundException _ -> "com.amazonaws.cloudwatchlogs#ResourceNotFoundException"
    | `ThrottlingException _ -> "com.amazonaws.cloudwatchlogs#ThrottlingException"
    | `ValidationException _ -> "com.amazonaws.cloudwatchlogs#ValidationException"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "AccessDeniedException" ->
          `AccessDeniedException (Json_deserializers.access_denied_exception_of_yojson tree path)
      | _, "InternalServerException" ->
          `InternalServerException
            (Json_deserializers.internal_server_exception_of_yojson tree path)
      | _, "ResourceNotFoundException" ->
          `ResourceNotFoundException
            (Json_deserializers.resource_not_found_exception_of_yojson tree path)
      | _, "ThrottlingException" ->
          `ThrottlingException (Json_deserializers.throttling_exception_of_yojson tree path)
      | _, "ValidationException" ->
          `ValidationException (Json_deserializers.validation_exception_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : get_scheduled_query_request) =
    let input = Json_serializers.get_scheduled_query_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"Logs_20140328.GetScheduledQuery" ~service
      ~context ~input ~output_deserializer:Json_deserializers.get_scheduled_query_response_of_yojson
      ~error_deserializer

  let request_with_metadata context (request : get_scheduled_query_request) =
    let input = Json_serializers.get_scheduled_query_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata ~shape_name:"Logs_20140328.GetScheduledQuery"
      ~service ~context ~input
      ~output_deserializer:Json_deserializers.get_scheduled_query_response_of_yojson
      ~error_deserializer
end

module GetQueryResults = struct
  let error_to_string = function
    | `InvalidParameterException _ -> "com.amazonaws.cloudwatchlogs#InvalidParameterException"
    | `ResourceNotFoundException _ -> "com.amazonaws.cloudwatchlogs#ResourceNotFoundException"
    | `ServiceUnavailableException _ -> "com.amazonaws.cloudwatchlogs#ServiceUnavailableException"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "InvalidParameterException" ->
          `InvalidParameterException
            (Json_deserializers.invalid_parameter_exception_of_yojson tree path)
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

  let request context (request : get_query_results_request) =
    let input = Json_serializers.get_query_results_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"Logs_20140328.GetQueryResults" ~service
      ~context ~input ~output_deserializer:Json_deserializers.get_query_results_response_of_yojson
      ~error_deserializer

  let request_with_metadata context (request : get_query_results_request) =
    let input = Json_serializers.get_query_results_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata ~shape_name:"Logs_20140328.GetQueryResults"
      ~service ~context ~input
      ~output_deserializer:Json_deserializers.get_query_results_response_of_yojson
      ~error_deserializer
end

module GetLookupTable = struct
  let error_to_string = function
    | `AccessDeniedException _ -> "com.amazonaws.cloudwatchlogs#AccessDeniedException"
    | `InvalidParameterException _ -> "com.amazonaws.cloudwatchlogs#InvalidParameterException"
    | `ResourceNotFoundException _ -> "com.amazonaws.cloudwatchlogs#ResourceNotFoundException"
    | `ServiceUnavailableException _ -> "com.amazonaws.cloudwatchlogs#ServiceUnavailableException"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "AccessDeniedException" ->
          `AccessDeniedException (Json_deserializers.access_denied_exception_of_yojson tree path)
      | _, "InvalidParameterException" ->
          `InvalidParameterException
            (Json_deserializers.invalid_parameter_exception_of_yojson tree path)
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

  let request context (request : get_lookup_table_request) =
    let input = Json_serializers.get_lookup_table_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"Logs_20140328.GetLookupTable" ~service ~context
      ~input ~output_deserializer:Json_deserializers.get_lookup_table_response_of_yojson
      ~error_deserializer

  let request_with_metadata context (request : get_lookup_table_request) =
    let input = Json_serializers.get_lookup_table_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata ~shape_name:"Logs_20140328.GetLookupTable"
      ~service ~context ~input
      ~output_deserializer:Json_deserializers.get_lookup_table_response_of_yojson
      ~error_deserializer
end

module GetLogRecord = struct
  let error_to_string = function
    | `InvalidParameterException _ -> "com.amazonaws.cloudwatchlogs#InvalidParameterException"
    | `LimitExceededException _ -> "com.amazonaws.cloudwatchlogs#LimitExceededException"
    | `ResourceNotFoundException _ -> "com.amazonaws.cloudwatchlogs#ResourceNotFoundException"
    | `ServiceUnavailableException _ -> "com.amazonaws.cloudwatchlogs#ServiceUnavailableException"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "InvalidParameterException" ->
          `InvalidParameterException
            (Json_deserializers.invalid_parameter_exception_of_yojson tree path)
      | _, "LimitExceededException" ->
          `LimitExceededException (Json_deserializers.limit_exceeded_exception_of_yojson tree path)
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

  let request context (request : get_log_record_request) =
    let input = Json_serializers.get_log_record_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"Logs_20140328.GetLogRecord" ~service ~context
      ~input ~output_deserializer:Json_deserializers.get_log_record_response_of_yojson
      ~error_deserializer

  let request_with_metadata context (request : get_log_record_request) =
    let input = Json_serializers.get_log_record_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata ~shape_name:"Logs_20140328.GetLogRecord"
      ~service ~context ~input
      ~output_deserializer:Json_deserializers.get_log_record_response_of_yojson ~error_deserializer
end

module GetLogObject = struct
  let error_to_string = function
    | `AccessDeniedException _ -> "com.amazonaws.cloudwatchlogs#AccessDeniedException"
    | `InvalidOperationException _ -> "com.amazonaws.cloudwatchlogs#InvalidOperationException"
    | `InvalidParameterException _ -> "com.amazonaws.cloudwatchlogs#InvalidParameterException"
    | `LimitExceededException _ -> "com.amazonaws.cloudwatchlogs#LimitExceededException"
    | `ResourceNotFoundException _ -> "com.amazonaws.cloudwatchlogs#ResourceNotFoundException"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "AccessDeniedException" ->
          `AccessDeniedException (Json_deserializers.access_denied_exception_of_yojson tree path)
      | _, "InvalidOperationException" ->
          `InvalidOperationException
            (Json_deserializers.invalid_operation_exception_of_yojson tree path)
      | _, "InvalidParameterException" ->
          `InvalidParameterException
            (Json_deserializers.invalid_parameter_exception_of_yojson tree path)
      | _, "LimitExceededException" ->
          `LimitExceededException (Json_deserializers.limit_exceeded_exception_of_yojson tree path)
      | _, "ResourceNotFoundException" ->
          `ResourceNotFoundException
            (Json_deserializers.resource_not_found_exception_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : get_log_object_request) =
    let input = Json_serializers.get_log_object_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"Logs_20140328.GetLogObject" ~service ~context
      ~input ~output_deserializer:Json_deserializers.get_log_object_response_of_yojson
      ~error_deserializer

  let request_with_metadata context (request : get_log_object_request) =
    let input = Json_serializers.get_log_object_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata ~shape_name:"Logs_20140328.GetLogObject"
      ~service ~context ~input
      ~output_deserializer:Json_deserializers.get_log_object_response_of_yojson ~error_deserializer
end

module GetLogGroupFields = struct
  let error_to_string = function
    | `InvalidParameterException _ -> "com.amazonaws.cloudwatchlogs#InvalidParameterException"
    | `LimitExceededException _ -> "com.amazonaws.cloudwatchlogs#LimitExceededException"
    | `ResourceNotFoundException _ -> "com.amazonaws.cloudwatchlogs#ResourceNotFoundException"
    | `ServiceUnavailableException _ -> "com.amazonaws.cloudwatchlogs#ServiceUnavailableException"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "InvalidParameterException" ->
          `InvalidParameterException
            (Json_deserializers.invalid_parameter_exception_of_yojson tree path)
      | _, "LimitExceededException" ->
          `LimitExceededException (Json_deserializers.limit_exceeded_exception_of_yojson tree path)
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

  let request context (request : get_log_group_fields_request) =
    let input = Json_serializers.get_log_group_fields_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"Logs_20140328.GetLogGroupFields" ~service
      ~context ~input
      ~output_deserializer:Json_deserializers.get_log_group_fields_response_of_yojson
      ~error_deserializer

  let request_with_metadata context (request : get_log_group_fields_request) =
    let input = Json_serializers.get_log_group_fields_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata ~shape_name:"Logs_20140328.GetLogGroupFields"
      ~service ~context ~input
      ~output_deserializer:Json_deserializers.get_log_group_fields_response_of_yojson
      ~error_deserializer
end

module GetLogFields = struct
  let error_to_string = function
    | `InvalidParameterException _ -> "com.amazonaws.cloudwatchlogs#InvalidParameterException"
    | `OperationAbortedException _ -> "com.amazonaws.cloudwatchlogs#OperationAbortedException"
    | `ResourceNotFoundException _ -> "com.amazonaws.cloudwatchlogs#ResourceNotFoundException"
    | `ServiceUnavailableException _ -> "com.amazonaws.cloudwatchlogs#ServiceUnavailableException"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "InvalidParameterException" ->
          `InvalidParameterException
            (Json_deserializers.invalid_parameter_exception_of_yojson tree path)
      | _, "OperationAbortedException" ->
          `OperationAbortedException
            (Json_deserializers.operation_aborted_exception_of_yojson tree path)
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

  let request context (request : get_log_fields_request) =
    let input = Json_serializers.get_log_fields_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"Logs_20140328.GetLogFields" ~service ~context
      ~input ~output_deserializer:Json_deserializers.get_log_fields_response_of_yojson
      ~error_deserializer

  let request_with_metadata context (request : get_log_fields_request) =
    let input = Json_serializers.get_log_fields_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata ~shape_name:"Logs_20140328.GetLogFields"
      ~service ~context ~input
      ~output_deserializer:Json_deserializers.get_log_fields_response_of_yojson ~error_deserializer
end

module GetLogEvents = struct
  let error_to_string = function
    | `InvalidParameterException _ -> "com.amazonaws.cloudwatchlogs#InvalidParameterException"
    | `ResourceNotFoundException _ -> "com.amazonaws.cloudwatchlogs#ResourceNotFoundException"
    | `ServiceUnavailableException _ -> "com.amazonaws.cloudwatchlogs#ServiceUnavailableException"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "InvalidParameterException" ->
          `InvalidParameterException
            (Json_deserializers.invalid_parameter_exception_of_yojson tree path)
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

  let request context (request : get_log_events_request) =
    let input = Json_serializers.get_log_events_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"Logs_20140328.GetLogEvents" ~service ~context
      ~input ~output_deserializer:Json_deserializers.get_log_events_response_of_yojson
      ~error_deserializer

  let request_with_metadata context (request : get_log_events_request) =
    let input = Json_serializers.get_log_events_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata ~shape_name:"Logs_20140328.GetLogEvents"
      ~service ~context ~input
      ~output_deserializer:Json_deserializers.get_log_events_response_of_yojson ~error_deserializer
end

module GetLogAnomalyDetector = struct
  let error_to_string = function
    | `InvalidParameterException _ -> "com.amazonaws.cloudwatchlogs#InvalidParameterException"
    | `OperationAbortedException _ -> "com.amazonaws.cloudwatchlogs#OperationAbortedException"
    | `ResourceNotFoundException _ -> "com.amazonaws.cloudwatchlogs#ResourceNotFoundException"
    | `ServiceUnavailableException _ -> "com.amazonaws.cloudwatchlogs#ServiceUnavailableException"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "InvalidParameterException" ->
          `InvalidParameterException
            (Json_deserializers.invalid_parameter_exception_of_yojson tree path)
      | _, "OperationAbortedException" ->
          `OperationAbortedException
            (Json_deserializers.operation_aborted_exception_of_yojson tree path)
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

  let request context (request : get_log_anomaly_detector_request) =
    let input = Json_serializers.get_log_anomaly_detector_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"Logs_20140328.GetLogAnomalyDetector" ~service
      ~context ~input
      ~output_deserializer:Json_deserializers.get_log_anomaly_detector_response_of_yojson
      ~error_deserializer

  let request_with_metadata context (request : get_log_anomaly_detector_request) =
    let input = Json_serializers.get_log_anomaly_detector_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata
      ~shape_name:"Logs_20140328.GetLogAnomalyDetector" ~service ~context ~input
      ~output_deserializer:Json_deserializers.get_log_anomaly_detector_response_of_yojson
      ~error_deserializer
end

module GetIntegration = struct
  let error_to_string = function
    | `InvalidParameterException _ -> "com.amazonaws.cloudwatchlogs#InvalidParameterException"
    | `ResourceNotFoundException _ -> "com.amazonaws.cloudwatchlogs#ResourceNotFoundException"
    | `ServiceUnavailableException _ -> "com.amazonaws.cloudwatchlogs#ServiceUnavailableException"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "InvalidParameterException" ->
          `InvalidParameterException
            (Json_deserializers.invalid_parameter_exception_of_yojson tree path)
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

  let request context (request : get_integration_request) =
    let input = Json_serializers.get_integration_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"Logs_20140328.GetIntegration" ~service ~context
      ~input ~output_deserializer:Json_deserializers.get_integration_response_of_yojson
      ~error_deserializer

  let request_with_metadata context (request : get_integration_request) =
    let input = Json_serializers.get_integration_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata ~shape_name:"Logs_20140328.GetIntegration"
      ~service ~context ~input
      ~output_deserializer:Json_deserializers.get_integration_response_of_yojson ~error_deserializer
end

module GetDeliverySource = struct
  let error_to_string = function
    | `ResourceNotFoundException _ -> "com.amazonaws.cloudwatchlogs#ResourceNotFoundException"
    | `ServiceQuotaExceededException _ ->
        "com.amazonaws.cloudwatchlogs#ServiceQuotaExceededException"
    | `ServiceUnavailableException _ -> "com.amazonaws.cloudwatchlogs#ServiceUnavailableException"
    | `ThrottlingException _ -> "com.amazonaws.cloudwatchlogs#ThrottlingException"
    | `ValidationException _ -> "com.amazonaws.cloudwatchlogs#ValidationException"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "ResourceNotFoundException" ->
          `ResourceNotFoundException
            (Json_deserializers.resource_not_found_exception_of_yojson tree path)
      | _, "ServiceQuotaExceededException" ->
          `ServiceQuotaExceededException
            (Json_deserializers.service_quota_exceeded_exception_of_yojson tree path)
      | _, "ServiceUnavailableException" ->
          `ServiceUnavailableException
            (Json_deserializers.service_unavailable_exception_of_yojson tree path)
      | _, "ThrottlingException" ->
          `ThrottlingException (Json_deserializers.throttling_exception_of_yojson tree path)
      | _, "ValidationException" ->
          `ValidationException (Json_deserializers.validation_exception_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : get_delivery_source_request) =
    let input = Json_serializers.get_delivery_source_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"Logs_20140328.GetDeliverySource" ~service
      ~context ~input ~output_deserializer:Json_deserializers.get_delivery_source_response_of_yojson
      ~error_deserializer

  let request_with_metadata context (request : get_delivery_source_request) =
    let input = Json_serializers.get_delivery_source_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata ~shape_name:"Logs_20140328.GetDeliverySource"
      ~service ~context ~input
      ~output_deserializer:Json_deserializers.get_delivery_source_response_of_yojson
      ~error_deserializer
end

module GetDeliveryDestinationPolicy = struct
  let error_to_string = function
    | `ResourceNotFoundException _ -> "com.amazonaws.cloudwatchlogs#ResourceNotFoundException"
    | `ServiceUnavailableException _ -> "com.amazonaws.cloudwatchlogs#ServiceUnavailableException"
    | `ValidationException _ -> "com.amazonaws.cloudwatchlogs#ValidationException"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "ResourceNotFoundException" ->
          `ResourceNotFoundException
            (Json_deserializers.resource_not_found_exception_of_yojson tree path)
      | _, "ServiceUnavailableException" ->
          `ServiceUnavailableException
            (Json_deserializers.service_unavailable_exception_of_yojson tree path)
      | _, "ValidationException" ->
          `ValidationException (Json_deserializers.validation_exception_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : get_delivery_destination_policy_request) =
    let input = Json_serializers.get_delivery_destination_policy_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"Logs_20140328.GetDeliveryDestinationPolicy"
      ~service ~context ~input
      ~output_deserializer:Json_deserializers.get_delivery_destination_policy_response_of_yojson
      ~error_deserializer

  let request_with_metadata context (request : get_delivery_destination_policy_request) =
    let input = Json_serializers.get_delivery_destination_policy_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata
      ~shape_name:"Logs_20140328.GetDeliveryDestinationPolicy" ~service ~context ~input
      ~output_deserializer:Json_deserializers.get_delivery_destination_policy_response_of_yojson
      ~error_deserializer
end

module GetDeliveryDestination = struct
  let error_to_string = function
    | `ResourceNotFoundException _ -> "com.amazonaws.cloudwatchlogs#ResourceNotFoundException"
    | `ServiceQuotaExceededException _ ->
        "com.amazonaws.cloudwatchlogs#ServiceQuotaExceededException"
    | `ServiceUnavailableException _ -> "com.amazonaws.cloudwatchlogs#ServiceUnavailableException"
    | `ThrottlingException _ -> "com.amazonaws.cloudwatchlogs#ThrottlingException"
    | `ValidationException _ -> "com.amazonaws.cloudwatchlogs#ValidationException"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "ResourceNotFoundException" ->
          `ResourceNotFoundException
            (Json_deserializers.resource_not_found_exception_of_yojson tree path)
      | _, "ServiceQuotaExceededException" ->
          `ServiceQuotaExceededException
            (Json_deserializers.service_quota_exceeded_exception_of_yojson tree path)
      | _, "ServiceUnavailableException" ->
          `ServiceUnavailableException
            (Json_deserializers.service_unavailable_exception_of_yojson tree path)
      | _, "ThrottlingException" ->
          `ThrottlingException (Json_deserializers.throttling_exception_of_yojson tree path)
      | _, "ValidationException" ->
          `ValidationException (Json_deserializers.validation_exception_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : get_delivery_destination_request) =
    let input = Json_serializers.get_delivery_destination_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"Logs_20140328.GetDeliveryDestination" ~service
      ~context ~input
      ~output_deserializer:Json_deserializers.get_delivery_destination_response_of_yojson
      ~error_deserializer

  let request_with_metadata context (request : get_delivery_destination_request) =
    let input = Json_serializers.get_delivery_destination_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata
      ~shape_name:"Logs_20140328.GetDeliveryDestination" ~service ~context ~input
      ~output_deserializer:Json_deserializers.get_delivery_destination_response_of_yojson
      ~error_deserializer
end

module GetDelivery = struct
  let error_to_string = function
    | `ResourceNotFoundException _ -> "com.amazonaws.cloudwatchlogs#ResourceNotFoundException"
    | `ServiceQuotaExceededException _ ->
        "com.amazonaws.cloudwatchlogs#ServiceQuotaExceededException"
    | `ServiceUnavailableException _ -> "com.amazonaws.cloudwatchlogs#ServiceUnavailableException"
    | `ThrottlingException _ -> "com.amazonaws.cloudwatchlogs#ThrottlingException"
    | `ValidationException _ -> "com.amazonaws.cloudwatchlogs#ValidationException"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "ResourceNotFoundException" ->
          `ResourceNotFoundException
            (Json_deserializers.resource_not_found_exception_of_yojson tree path)
      | _, "ServiceQuotaExceededException" ->
          `ServiceQuotaExceededException
            (Json_deserializers.service_quota_exceeded_exception_of_yojson tree path)
      | _, "ServiceUnavailableException" ->
          `ServiceUnavailableException
            (Json_deserializers.service_unavailable_exception_of_yojson tree path)
      | _, "ThrottlingException" ->
          `ThrottlingException (Json_deserializers.throttling_exception_of_yojson tree path)
      | _, "ValidationException" ->
          `ValidationException (Json_deserializers.validation_exception_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : get_delivery_request) =
    let input = Json_serializers.get_delivery_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"Logs_20140328.GetDelivery" ~service ~context
      ~input ~output_deserializer:Json_deserializers.get_delivery_response_of_yojson
      ~error_deserializer

  let request_with_metadata context (request : get_delivery_request) =
    let input = Json_serializers.get_delivery_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata ~shape_name:"Logs_20140328.GetDelivery"
      ~service ~context ~input
      ~output_deserializer:Json_deserializers.get_delivery_response_of_yojson ~error_deserializer
end

module GetDataProtectionPolicy = struct
  let error_to_string = function
    | `InvalidParameterException _ -> "com.amazonaws.cloudwatchlogs#InvalidParameterException"
    | `OperationAbortedException _ -> "com.amazonaws.cloudwatchlogs#OperationAbortedException"
    | `ResourceNotFoundException _ -> "com.amazonaws.cloudwatchlogs#ResourceNotFoundException"
    | `ServiceUnavailableException _ -> "com.amazonaws.cloudwatchlogs#ServiceUnavailableException"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "InvalidParameterException" ->
          `InvalidParameterException
            (Json_deserializers.invalid_parameter_exception_of_yojson tree path)
      | _, "OperationAbortedException" ->
          `OperationAbortedException
            (Json_deserializers.operation_aborted_exception_of_yojson tree path)
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

  let request context (request : get_data_protection_policy_request) =
    let input = Json_serializers.get_data_protection_policy_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"Logs_20140328.GetDataProtectionPolicy" ~service
      ~context ~input
      ~output_deserializer:Json_deserializers.get_data_protection_policy_response_of_yojson
      ~error_deserializer

  let request_with_metadata context (request : get_data_protection_policy_request) =
    let input = Json_serializers.get_data_protection_policy_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata
      ~shape_name:"Logs_20140328.GetDataProtectionPolicy" ~service ~context ~input
      ~output_deserializer:Json_deserializers.get_data_protection_policy_response_of_yojson
      ~error_deserializer
end

module FilterLogEvents = struct
  let error_to_string = function
    | `InvalidParameterException _ -> "com.amazonaws.cloudwatchlogs#InvalidParameterException"
    | `ResourceNotFoundException _ -> "com.amazonaws.cloudwatchlogs#ResourceNotFoundException"
    | `ServiceUnavailableException _ -> "com.amazonaws.cloudwatchlogs#ServiceUnavailableException"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "InvalidParameterException" ->
          `InvalidParameterException
            (Json_deserializers.invalid_parameter_exception_of_yojson tree path)
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

  let request context (request : filter_log_events_request) =
    let input = Json_serializers.filter_log_events_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"Logs_20140328.FilterLogEvents" ~service
      ~context ~input ~output_deserializer:Json_deserializers.filter_log_events_response_of_yojson
      ~error_deserializer

  let request_with_metadata context (request : filter_log_events_request) =
    let input = Json_serializers.filter_log_events_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata ~shape_name:"Logs_20140328.FilterLogEvents"
      ~service ~context ~input
      ~output_deserializer:Json_deserializers.filter_log_events_response_of_yojson
      ~error_deserializer
end

module DisassociateSourceFromS3TableIntegration = struct
  let error_to_string = function
    | `AccessDeniedException _ -> "com.amazonaws.cloudwatchlogs#AccessDeniedException"
    | `InternalServerException _ -> "com.amazonaws.cloudwatchlogs#InternalServerException"
    | `ResourceNotFoundException _ -> "com.amazonaws.cloudwatchlogs#ResourceNotFoundException"
    | `ThrottlingException _ -> "com.amazonaws.cloudwatchlogs#ThrottlingException"
    | `ValidationException _ -> "com.amazonaws.cloudwatchlogs#ValidationException"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "AccessDeniedException" ->
          `AccessDeniedException (Json_deserializers.access_denied_exception_of_yojson tree path)
      | _, "InternalServerException" ->
          `InternalServerException
            (Json_deserializers.internal_server_exception_of_yojson tree path)
      | _, "ResourceNotFoundException" ->
          `ResourceNotFoundException
            (Json_deserializers.resource_not_found_exception_of_yojson tree path)
      | _, "ThrottlingException" ->
          `ThrottlingException (Json_deserializers.throttling_exception_of_yojson tree path)
      | _, "ValidationException" ->
          `ValidationException (Json_deserializers.validation_exception_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : disassociate_source_from_s3_table_integration_request) =
    let input =
      Json_serializers.disassociate_source_from_s3_table_integration_request_to_yojson request
    in
    Smaws_Lib.Protocols.AwsJson.request
      ~shape_name:"Logs_20140328.DisassociateSourceFromS3TableIntegration" ~service ~context ~input
      ~output_deserializer:
        Json_deserializers.disassociate_source_from_s3_table_integration_response_of_yojson
      ~error_deserializer

  let request_with_metadata context
      (request : disassociate_source_from_s3_table_integration_request) =
    let input =
      Json_serializers.disassociate_source_from_s3_table_integration_request_to_yojson request
    in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata
      ~shape_name:"Logs_20140328.DisassociateSourceFromS3TableIntegration" ~service ~context ~input
      ~output_deserializer:
        Json_deserializers.disassociate_source_from_s3_table_integration_response_of_yojson
      ~error_deserializer
end

module DisassociateKmsKey = struct
  let error_to_string = function
    | `InvalidParameterException _ -> "com.amazonaws.cloudwatchlogs#InvalidParameterException"
    | `OperationAbortedException _ -> "com.amazonaws.cloudwatchlogs#OperationAbortedException"
    | `ResourceNotFoundException _ -> "com.amazonaws.cloudwatchlogs#ResourceNotFoundException"
    | `ServiceUnavailableException _ -> "com.amazonaws.cloudwatchlogs#ServiceUnavailableException"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "InvalidParameterException" ->
          `InvalidParameterException
            (Json_deserializers.invalid_parameter_exception_of_yojson tree path)
      | _, "OperationAbortedException" ->
          `OperationAbortedException
            (Json_deserializers.operation_aborted_exception_of_yojson tree path)
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

  let request context (request : disassociate_kms_key_request) =
    let input = Json_serializers.disassociate_kms_key_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"Logs_20140328.DisassociateKmsKey" ~service
      ~context ~input ~output_deserializer:Smaws_Lib.Smithy_api.Json_deserializers.unit__of_yojson
      ~error_deserializer

  let request_with_metadata context (request : disassociate_kms_key_request) =
    let input = Json_serializers.disassociate_kms_key_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata ~shape_name:"Logs_20140328.DisassociateKmsKey"
      ~service ~context ~input
      ~output_deserializer:Smaws_Lib.Smithy_api.Json_deserializers.unit__of_yojson
      ~error_deserializer
end

module DescribeSubscriptionFilters = struct
  let error_to_string = function
    | `InvalidParameterException _ -> "com.amazonaws.cloudwatchlogs#InvalidParameterException"
    | `ResourceNotFoundException _ -> "com.amazonaws.cloudwatchlogs#ResourceNotFoundException"
    | `ServiceUnavailableException _ -> "com.amazonaws.cloudwatchlogs#ServiceUnavailableException"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "InvalidParameterException" ->
          `InvalidParameterException
            (Json_deserializers.invalid_parameter_exception_of_yojson tree path)
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

  let request context (request : describe_subscription_filters_request) =
    let input = Json_serializers.describe_subscription_filters_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"Logs_20140328.DescribeSubscriptionFilters"
      ~service ~context ~input
      ~output_deserializer:Json_deserializers.describe_subscription_filters_response_of_yojson
      ~error_deserializer

  let request_with_metadata context (request : describe_subscription_filters_request) =
    let input = Json_serializers.describe_subscription_filters_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata
      ~shape_name:"Logs_20140328.DescribeSubscriptionFilters" ~service ~context ~input
      ~output_deserializer:Json_deserializers.describe_subscription_filters_response_of_yojson
      ~error_deserializer
end

module DescribeResourcePolicies = struct
  let error_to_string = function
    | `InvalidParameterException _ -> "com.amazonaws.cloudwatchlogs#InvalidParameterException"
    | `ServiceUnavailableException _ -> "com.amazonaws.cloudwatchlogs#ServiceUnavailableException"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "InvalidParameterException" ->
          `InvalidParameterException
            (Json_deserializers.invalid_parameter_exception_of_yojson tree path)
      | _, "ServiceUnavailableException" ->
          `ServiceUnavailableException
            (Json_deserializers.service_unavailable_exception_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : describe_resource_policies_request) =
    let input = Json_serializers.describe_resource_policies_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"Logs_20140328.DescribeResourcePolicies"
      ~service ~context ~input
      ~output_deserializer:Json_deserializers.describe_resource_policies_response_of_yojson
      ~error_deserializer

  let request_with_metadata context (request : describe_resource_policies_request) =
    let input = Json_serializers.describe_resource_policies_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata
      ~shape_name:"Logs_20140328.DescribeResourcePolicies" ~service ~context ~input
      ~output_deserializer:Json_deserializers.describe_resource_policies_response_of_yojson
      ~error_deserializer
end

module DescribeQueryDefinitions = struct
  let error_to_string = function
    | `InvalidParameterException _ -> "com.amazonaws.cloudwatchlogs#InvalidParameterException"
    | `ServiceUnavailableException _ -> "com.amazonaws.cloudwatchlogs#ServiceUnavailableException"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "InvalidParameterException" ->
          `InvalidParameterException
            (Json_deserializers.invalid_parameter_exception_of_yojson tree path)
      | _, "ServiceUnavailableException" ->
          `ServiceUnavailableException
            (Json_deserializers.service_unavailable_exception_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : describe_query_definitions_request) =
    let input = Json_serializers.describe_query_definitions_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"Logs_20140328.DescribeQueryDefinitions"
      ~service ~context ~input
      ~output_deserializer:Json_deserializers.describe_query_definitions_response_of_yojson
      ~error_deserializer

  let request_with_metadata context (request : describe_query_definitions_request) =
    let input = Json_serializers.describe_query_definitions_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata
      ~shape_name:"Logs_20140328.DescribeQueryDefinitions" ~service ~context ~input
      ~output_deserializer:Json_deserializers.describe_query_definitions_response_of_yojson
      ~error_deserializer
end

module DescribeQueries = struct
  let error_to_string = function
    | `InvalidParameterException _ -> "com.amazonaws.cloudwatchlogs#InvalidParameterException"
    | `ResourceNotFoundException _ -> "com.amazonaws.cloudwatchlogs#ResourceNotFoundException"
    | `ServiceUnavailableException _ -> "com.amazonaws.cloudwatchlogs#ServiceUnavailableException"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "InvalidParameterException" ->
          `InvalidParameterException
            (Json_deserializers.invalid_parameter_exception_of_yojson tree path)
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

  let request context (request : describe_queries_request) =
    let input = Json_serializers.describe_queries_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"Logs_20140328.DescribeQueries" ~service
      ~context ~input ~output_deserializer:Json_deserializers.describe_queries_response_of_yojson
      ~error_deserializer

  let request_with_metadata context (request : describe_queries_request) =
    let input = Json_serializers.describe_queries_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata ~shape_name:"Logs_20140328.DescribeQueries"
      ~service ~context ~input
      ~output_deserializer:Json_deserializers.describe_queries_response_of_yojson
      ~error_deserializer
end

module DescribeMetricFilters = struct
  let error_to_string = function
    | `InvalidParameterException _ -> "com.amazonaws.cloudwatchlogs#InvalidParameterException"
    | `ResourceNotFoundException _ -> "com.amazonaws.cloudwatchlogs#ResourceNotFoundException"
    | `ServiceUnavailableException _ -> "com.amazonaws.cloudwatchlogs#ServiceUnavailableException"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "InvalidParameterException" ->
          `InvalidParameterException
            (Json_deserializers.invalid_parameter_exception_of_yojson tree path)
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

  let request context (request : describe_metric_filters_request) =
    let input = Json_serializers.describe_metric_filters_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"Logs_20140328.DescribeMetricFilters" ~service
      ~context ~input
      ~output_deserializer:Json_deserializers.describe_metric_filters_response_of_yojson
      ~error_deserializer

  let request_with_metadata context (request : describe_metric_filters_request) =
    let input = Json_serializers.describe_metric_filters_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata
      ~shape_name:"Logs_20140328.DescribeMetricFilters" ~service ~context ~input
      ~output_deserializer:Json_deserializers.describe_metric_filters_response_of_yojson
      ~error_deserializer
end

module DescribeLookupTables = struct
  let error_to_string = function
    | `AccessDeniedException _ -> "com.amazonaws.cloudwatchlogs#AccessDeniedException"
    | `InvalidParameterException _ -> "com.amazonaws.cloudwatchlogs#InvalidParameterException"
    | `ResourceNotFoundException _ -> "com.amazonaws.cloudwatchlogs#ResourceNotFoundException"
    | `ServiceUnavailableException _ -> "com.amazonaws.cloudwatchlogs#ServiceUnavailableException"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "AccessDeniedException" ->
          `AccessDeniedException (Json_deserializers.access_denied_exception_of_yojson tree path)
      | _, "InvalidParameterException" ->
          `InvalidParameterException
            (Json_deserializers.invalid_parameter_exception_of_yojson tree path)
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

  let request context (request : describe_lookup_tables_request) =
    let input = Json_serializers.describe_lookup_tables_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"Logs_20140328.DescribeLookupTables" ~service
      ~context ~input
      ~output_deserializer:Json_deserializers.describe_lookup_tables_response_of_yojson
      ~error_deserializer

  let request_with_metadata context (request : describe_lookup_tables_request) =
    let input = Json_serializers.describe_lookup_tables_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata
      ~shape_name:"Logs_20140328.DescribeLookupTables" ~service ~context ~input
      ~output_deserializer:Json_deserializers.describe_lookup_tables_response_of_yojson
      ~error_deserializer
end

module DescribeLogStreams = struct
  let error_to_string = function
    | `InvalidParameterException _ -> "com.amazonaws.cloudwatchlogs#InvalidParameterException"
    | `ResourceNotFoundException _ -> "com.amazonaws.cloudwatchlogs#ResourceNotFoundException"
    | `ServiceUnavailableException _ -> "com.amazonaws.cloudwatchlogs#ServiceUnavailableException"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "InvalidParameterException" ->
          `InvalidParameterException
            (Json_deserializers.invalid_parameter_exception_of_yojson tree path)
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

  let request context (request : describe_log_streams_request) =
    let input = Json_serializers.describe_log_streams_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"Logs_20140328.DescribeLogStreams" ~service
      ~context ~input
      ~output_deserializer:Json_deserializers.describe_log_streams_response_of_yojson
      ~error_deserializer

  let request_with_metadata context (request : describe_log_streams_request) =
    let input = Json_serializers.describe_log_streams_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata ~shape_name:"Logs_20140328.DescribeLogStreams"
      ~service ~context ~input
      ~output_deserializer:Json_deserializers.describe_log_streams_response_of_yojson
      ~error_deserializer
end

module DescribeLogGroups = struct
  let error_to_string = function
    | `InvalidParameterException _ -> "com.amazonaws.cloudwatchlogs#InvalidParameterException"
    | `ServiceUnavailableException _ -> "com.amazonaws.cloudwatchlogs#ServiceUnavailableException"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "InvalidParameterException" ->
          `InvalidParameterException
            (Json_deserializers.invalid_parameter_exception_of_yojson tree path)
      | _, "ServiceUnavailableException" ->
          `ServiceUnavailableException
            (Json_deserializers.service_unavailable_exception_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : describe_log_groups_request) =
    let input = Json_serializers.describe_log_groups_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"Logs_20140328.DescribeLogGroups" ~service
      ~context ~input ~output_deserializer:Json_deserializers.describe_log_groups_response_of_yojson
      ~error_deserializer

  let request_with_metadata context (request : describe_log_groups_request) =
    let input = Json_serializers.describe_log_groups_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata ~shape_name:"Logs_20140328.DescribeLogGroups"
      ~service ~context ~input
      ~output_deserializer:Json_deserializers.describe_log_groups_response_of_yojson
      ~error_deserializer
end

module DescribeIndexPolicies = struct
  let error_to_string = function
    | `InvalidParameterException _ -> "com.amazonaws.cloudwatchlogs#InvalidParameterException"
    | `LimitExceededException _ -> "com.amazonaws.cloudwatchlogs#LimitExceededException"
    | `OperationAbortedException _ -> "com.amazonaws.cloudwatchlogs#OperationAbortedException"
    | `ResourceNotFoundException _ -> "com.amazonaws.cloudwatchlogs#ResourceNotFoundException"
    | `ServiceUnavailableException _ -> "com.amazonaws.cloudwatchlogs#ServiceUnavailableException"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "InvalidParameterException" ->
          `InvalidParameterException
            (Json_deserializers.invalid_parameter_exception_of_yojson tree path)
      | _, "LimitExceededException" ->
          `LimitExceededException (Json_deserializers.limit_exceeded_exception_of_yojson tree path)
      | _, "OperationAbortedException" ->
          `OperationAbortedException
            (Json_deserializers.operation_aborted_exception_of_yojson tree path)
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

  let request context (request : describe_index_policies_request) =
    let input = Json_serializers.describe_index_policies_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"Logs_20140328.DescribeIndexPolicies" ~service
      ~context ~input
      ~output_deserializer:Json_deserializers.describe_index_policies_response_of_yojson
      ~error_deserializer

  let request_with_metadata context (request : describe_index_policies_request) =
    let input = Json_serializers.describe_index_policies_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata
      ~shape_name:"Logs_20140328.DescribeIndexPolicies" ~service ~context ~input
      ~output_deserializer:Json_deserializers.describe_index_policies_response_of_yojson
      ~error_deserializer
end

module DescribeImportTasks = struct
  let error_to_string = function
    | `AccessDeniedException _ -> "com.amazonaws.cloudwatchlogs#AccessDeniedException"
    | `InvalidOperationException _ -> "com.amazonaws.cloudwatchlogs#InvalidOperationException"
    | `InvalidParameterException _ -> "com.amazonaws.cloudwatchlogs#InvalidParameterException"
    | `ResourceNotFoundException _ -> "com.amazonaws.cloudwatchlogs#ResourceNotFoundException"
    | `ThrottlingException _ -> "com.amazonaws.cloudwatchlogs#ThrottlingException"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "AccessDeniedException" ->
          `AccessDeniedException (Json_deserializers.access_denied_exception_of_yojson tree path)
      | _, "InvalidOperationException" ->
          `InvalidOperationException
            (Json_deserializers.invalid_operation_exception_of_yojson tree path)
      | _, "InvalidParameterException" ->
          `InvalidParameterException
            (Json_deserializers.invalid_parameter_exception_of_yojson tree path)
      | _, "ResourceNotFoundException" ->
          `ResourceNotFoundException
            (Json_deserializers.resource_not_found_exception_of_yojson tree path)
      | _, "ThrottlingException" ->
          `ThrottlingException (Json_deserializers.throttling_exception_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : describe_import_tasks_request) =
    let input = Json_serializers.describe_import_tasks_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"Logs_20140328.DescribeImportTasks" ~service
      ~context ~input
      ~output_deserializer:Json_deserializers.describe_import_tasks_response_of_yojson
      ~error_deserializer

  let request_with_metadata context (request : describe_import_tasks_request) =
    let input = Json_serializers.describe_import_tasks_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata
      ~shape_name:"Logs_20140328.DescribeImportTasks" ~service ~context ~input
      ~output_deserializer:Json_deserializers.describe_import_tasks_response_of_yojson
      ~error_deserializer
end

module DescribeImportTaskBatches = struct
  let error_to_string = function
    | `AccessDeniedException _ -> "com.amazonaws.cloudwatchlogs#AccessDeniedException"
    | `InvalidOperationException _ -> "com.amazonaws.cloudwatchlogs#InvalidOperationException"
    | `InvalidParameterException _ -> "com.amazonaws.cloudwatchlogs#InvalidParameterException"
    | `ResourceNotFoundException _ -> "com.amazonaws.cloudwatchlogs#ResourceNotFoundException"
    | `ThrottlingException _ -> "com.amazonaws.cloudwatchlogs#ThrottlingException"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "AccessDeniedException" ->
          `AccessDeniedException (Json_deserializers.access_denied_exception_of_yojson tree path)
      | _, "InvalidOperationException" ->
          `InvalidOperationException
            (Json_deserializers.invalid_operation_exception_of_yojson tree path)
      | _, "InvalidParameterException" ->
          `InvalidParameterException
            (Json_deserializers.invalid_parameter_exception_of_yojson tree path)
      | _, "ResourceNotFoundException" ->
          `ResourceNotFoundException
            (Json_deserializers.resource_not_found_exception_of_yojson tree path)
      | _, "ThrottlingException" ->
          `ThrottlingException (Json_deserializers.throttling_exception_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : describe_import_task_batches_request) =
    let input = Json_serializers.describe_import_task_batches_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"Logs_20140328.DescribeImportTaskBatches"
      ~service ~context ~input
      ~output_deserializer:Json_deserializers.describe_import_task_batches_response_of_yojson
      ~error_deserializer

  let request_with_metadata context (request : describe_import_task_batches_request) =
    let input = Json_serializers.describe_import_task_batches_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata
      ~shape_name:"Logs_20140328.DescribeImportTaskBatches" ~service ~context ~input
      ~output_deserializer:Json_deserializers.describe_import_task_batches_response_of_yojson
      ~error_deserializer
end

module DescribeFieldIndexes = struct
  let error_to_string = function
    | `InvalidParameterException _ -> "com.amazonaws.cloudwatchlogs#InvalidParameterException"
    | `LimitExceededException _ -> "com.amazonaws.cloudwatchlogs#LimitExceededException"
    | `OperationAbortedException _ -> "com.amazonaws.cloudwatchlogs#OperationAbortedException"
    | `ResourceNotFoundException _ -> "com.amazonaws.cloudwatchlogs#ResourceNotFoundException"
    | `ServiceUnavailableException _ -> "com.amazonaws.cloudwatchlogs#ServiceUnavailableException"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "InvalidParameterException" ->
          `InvalidParameterException
            (Json_deserializers.invalid_parameter_exception_of_yojson tree path)
      | _, "LimitExceededException" ->
          `LimitExceededException (Json_deserializers.limit_exceeded_exception_of_yojson tree path)
      | _, "OperationAbortedException" ->
          `OperationAbortedException
            (Json_deserializers.operation_aborted_exception_of_yojson tree path)
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

  let request context (request : describe_field_indexes_request) =
    let input = Json_serializers.describe_field_indexes_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"Logs_20140328.DescribeFieldIndexes" ~service
      ~context ~input
      ~output_deserializer:Json_deserializers.describe_field_indexes_response_of_yojson
      ~error_deserializer

  let request_with_metadata context (request : describe_field_indexes_request) =
    let input = Json_serializers.describe_field_indexes_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata
      ~shape_name:"Logs_20140328.DescribeFieldIndexes" ~service ~context ~input
      ~output_deserializer:Json_deserializers.describe_field_indexes_response_of_yojson
      ~error_deserializer
end

module DescribeExportTasks = struct
  let error_to_string = function
    | `InvalidParameterException _ -> "com.amazonaws.cloudwatchlogs#InvalidParameterException"
    | `ServiceUnavailableException _ -> "com.amazonaws.cloudwatchlogs#ServiceUnavailableException"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "InvalidParameterException" ->
          `InvalidParameterException
            (Json_deserializers.invalid_parameter_exception_of_yojson tree path)
      | _, "ServiceUnavailableException" ->
          `ServiceUnavailableException
            (Json_deserializers.service_unavailable_exception_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : describe_export_tasks_request) =
    let input = Json_serializers.describe_export_tasks_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"Logs_20140328.DescribeExportTasks" ~service
      ~context ~input
      ~output_deserializer:Json_deserializers.describe_export_tasks_response_of_yojson
      ~error_deserializer

  let request_with_metadata context (request : describe_export_tasks_request) =
    let input = Json_serializers.describe_export_tasks_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata
      ~shape_name:"Logs_20140328.DescribeExportTasks" ~service ~context ~input
      ~output_deserializer:Json_deserializers.describe_export_tasks_response_of_yojson
      ~error_deserializer
end

module DescribeDestinations = struct
  let error_to_string = function
    | `InvalidParameterException _ -> "com.amazonaws.cloudwatchlogs#InvalidParameterException"
    | `ServiceUnavailableException _ -> "com.amazonaws.cloudwatchlogs#ServiceUnavailableException"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "InvalidParameterException" ->
          `InvalidParameterException
            (Json_deserializers.invalid_parameter_exception_of_yojson tree path)
      | _, "ServiceUnavailableException" ->
          `ServiceUnavailableException
            (Json_deserializers.service_unavailable_exception_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : describe_destinations_request) =
    let input = Json_serializers.describe_destinations_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"Logs_20140328.DescribeDestinations" ~service
      ~context ~input
      ~output_deserializer:Json_deserializers.describe_destinations_response_of_yojson
      ~error_deserializer

  let request_with_metadata context (request : describe_destinations_request) =
    let input = Json_serializers.describe_destinations_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata
      ~shape_name:"Logs_20140328.DescribeDestinations" ~service ~context ~input
      ~output_deserializer:Json_deserializers.describe_destinations_response_of_yojson
      ~error_deserializer
end

module DescribeDeliverySources = struct
  let error_to_string = function
    | `ServiceQuotaExceededException _ ->
        "com.amazonaws.cloudwatchlogs#ServiceQuotaExceededException"
    | `ServiceUnavailableException _ -> "com.amazonaws.cloudwatchlogs#ServiceUnavailableException"
    | `ThrottlingException _ -> "com.amazonaws.cloudwatchlogs#ThrottlingException"
    | `ValidationException _ -> "com.amazonaws.cloudwatchlogs#ValidationException"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "ServiceQuotaExceededException" ->
          `ServiceQuotaExceededException
            (Json_deserializers.service_quota_exceeded_exception_of_yojson tree path)
      | _, "ServiceUnavailableException" ->
          `ServiceUnavailableException
            (Json_deserializers.service_unavailable_exception_of_yojson tree path)
      | _, "ThrottlingException" ->
          `ThrottlingException (Json_deserializers.throttling_exception_of_yojson tree path)
      | _, "ValidationException" ->
          `ValidationException (Json_deserializers.validation_exception_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : describe_delivery_sources_request) =
    let input = Json_serializers.describe_delivery_sources_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"Logs_20140328.DescribeDeliverySources" ~service
      ~context ~input
      ~output_deserializer:Json_deserializers.describe_delivery_sources_response_of_yojson
      ~error_deserializer

  let request_with_metadata context (request : describe_delivery_sources_request) =
    let input = Json_serializers.describe_delivery_sources_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata
      ~shape_name:"Logs_20140328.DescribeDeliverySources" ~service ~context ~input
      ~output_deserializer:Json_deserializers.describe_delivery_sources_response_of_yojson
      ~error_deserializer
end

module DescribeDeliveryDestinations = struct
  let error_to_string = function
    | `ServiceQuotaExceededException _ ->
        "com.amazonaws.cloudwatchlogs#ServiceQuotaExceededException"
    | `ServiceUnavailableException _ -> "com.amazonaws.cloudwatchlogs#ServiceUnavailableException"
    | `ThrottlingException _ -> "com.amazonaws.cloudwatchlogs#ThrottlingException"
    | `ValidationException _ -> "com.amazonaws.cloudwatchlogs#ValidationException"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "ServiceQuotaExceededException" ->
          `ServiceQuotaExceededException
            (Json_deserializers.service_quota_exceeded_exception_of_yojson tree path)
      | _, "ServiceUnavailableException" ->
          `ServiceUnavailableException
            (Json_deserializers.service_unavailable_exception_of_yojson tree path)
      | _, "ThrottlingException" ->
          `ThrottlingException (Json_deserializers.throttling_exception_of_yojson tree path)
      | _, "ValidationException" ->
          `ValidationException (Json_deserializers.validation_exception_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : describe_delivery_destinations_request) =
    let input = Json_serializers.describe_delivery_destinations_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"Logs_20140328.DescribeDeliveryDestinations"
      ~service ~context ~input
      ~output_deserializer:Json_deserializers.describe_delivery_destinations_response_of_yojson
      ~error_deserializer

  let request_with_metadata context (request : describe_delivery_destinations_request) =
    let input = Json_serializers.describe_delivery_destinations_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata
      ~shape_name:"Logs_20140328.DescribeDeliveryDestinations" ~service ~context ~input
      ~output_deserializer:Json_deserializers.describe_delivery_destinations_response_of_yojson
      ~error_deserializer
end

module DescribeDeliveries = struct
  let error_to_string = function
    | `ServiceQuotaExceededException _ ->
        "com.amazonaws.cloudwatchlogs#ServiceQuotaExceededException"
    | `ServiceUnavailableException _ -> "com.amazonaws.cloudwatchlogs#ServiceUnavailableException"
    | `ThrottlingException _ -> "com.amazonaws.cloudwatchlogs#ThrottlingException"
    | `ValidationException _ -> "com.amazonaws.cloudwatchlogs#ValidationException"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "ServiceQuotaExceededException" ->
          `ServiceQuotaExceededException
            (Json_deserializers.service_quota_exceeded_exception_of_yojson tree path)
      | _, "ServiceUnavailableException" ->
          `ServiceUnavailableException
            (Json_deserializers.service_unavailable_exception_of_yojson tree path)
      | _, "ThrottlingException" ->
          `ThrottlingException (Json_deserializers.throttling_exception_of_yojson tree path)
      | _, "ValidationException" ->
          `ValidationException (Json_deserializers.validation_exception_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : describe_deliveries_request) =
    let input = Json_serializers.describe_deliveries_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"Logs_20140328.DescribeDeliveries" ~service
      ~context ~input ~output_deserializer:Json_deserializers.describe_deliveries_response_of_yojson
      ~error_deserializer

  let request_with_metadata context (request : describe_deliveries_request) =
    let input = Json_serializers.describe_deliveries_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata ~shape_name:"Logs_20140328.DescribeDeliveries"
      ~service ~context ~input
      ~output_deserializer:Json_deserializers.describe_deliveries_response_of_yojson
      ~error_deserializer
end

module DescribeConfigurationTemplates = struct
  let error_to_string = function
    | `ResourceNotFoundException _ -> "com.amazonaws.cloudwatchlogs#ResourceNotFoundException"
    | `ServiceUnavailableException _ -> "com.amazonaws.cloudwatchlogs#ServiceUnavailableException"
    | `ThrottlingException _ -> "com.amazonaws.cloudwatchlogs#ThrottlingException"
    | `ValidationException _ -> "com.amazonaws.cloudwatchlogs#ValidationException"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "ResourceNotFoundException" ->
          `ResourceNotFoundException
            (Json_deserializers.resource_not_found_exception_of_yojson tree path)
      | _, "ServiceUnavailableException" ->
          `ServiceUnavailableException
            (Json_deserializers.service_unavailable_exception_of_yojson tree path)
      | _, "ThrottlingException" ->
          `ThrottlingException (Json_deserializers.throttling_exception_of_yojson tree path)
      | _, "ValidationException" ->
          `ValidationException (Json_deserializers.validation_exception_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : describe_configuration_templates_request) =
    let input = Json_serializers.describe_configuration_templates_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"Logs_20140328.DescribeConfigurationTemplates"
      ~service ~context ~input
      ~output_deserializer:Json_deserializers.describe_configuration_templates_response_of_yojson
      ~error_deserializer

  let request_with_metadata context (request : describe_configuration_templates_request) =
    let input = Json_serializers.describe_configuration_templates_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata
      ~shape_name:"Logs_20140328.DescribeConfigurationTemplates" ~service ~context ~input
      ~output_deserializer:Json_deserializers.describe_configuration_templates_response_of_yojson
      ~error_deserializer
end

module DescribeAccountPolicies = struct
  let error_to_string = function
    | `InvalidParameterException _ -> "com.amazonaws.cloudwatchlogs#InvalidParameterException"
    | `OperationAbortedException _ -> "com.amazonaws.cloudwatchlogs#OperationAbortedException"
    | `ResourceNotFoundException _ -> "com.amazonaws.cloudwatchlogs#ResourceNotFoundException"
    | `ServiceUnavailableException _ -> "com.amazonaws.cloudwatchlogs#ServiceUnavailableException"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "InvalidParameterException" ->
          `InvalidParameterException
            (Json_deserializers.invalid_parameter_exception_of_yojson tree path)
      | _, "OperationAbortedException" ->
          `OperationAbortedException
            (Json_deserializers.operation_aborted_exception_of_yojson tree path)
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

  let request context (request : describe_account_policies_request) =
    let input = Json_serializers.describe_account_policies_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"Logs_20140328.DescribeAccountPolicies" ~service
      ~context ~input
      ~output_deserializer:Json_deserializers.describe_account_policies_response_of_yojson
      ~error_deserializer

  let request_with_metadata context (request : describe_account_policies_request) =
    let input = Json_serializers.describe_account_policies_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata
      ~shape_name:"Logs_20140328.DescribeAccountPolicies" ~service ~context ~input
      ~output_deserializer:Json_deserializers.describe_account_policies_response_of_yojson
      ~error_deserializer
end

module DeleteTransformer = struct
  let error_to_string = function
    | `InvalidOperationException _ -> "com.amazonaws.cloudwatchlogs#InvalidOperationException"
    | `InvalidParameterException _ -> "com.amazonaws.cloudwatchlogs#InvalidParameterException"
    | `OperationAbortedException _ -> "com.amazonaws.cloudwatchlogs#OperationAbortedException"
    | `ResourceNotFoundException _ -> "com.amazonaws.cloudwatchlogs#ResourceNotFoundException"
    | `ServiceUnavailableException _ -> "com.amazonaws.cloudwatchlogs#ServiceUnavailableException"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "InvalidOperationException" ->
          `InvalidOperationException
            (Json_deserializers.invalid_operation_exception_of_yojson tree path)
      | _, "InvalidParameterException" ->
          `InvalidParameterException
            (Json_deserializers.invalid_parameter_exception_of_yojson tree path)
      | _, "OperationAbortedException" ->
          `OperationAbortedException
            (Json_deserializers.operation_aborted_exception_of_yojson tree path)
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

  let request context (request : delete_transformer_request) =
    let input = Json_serializers.delete_transformer_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"Logs_20140328.DeleteTransformer" ~service
      ~context ~input ~output_deserializer:Smaws_Lib.Smithy_api.Json_deserializers.unit__of_yojson
      ~error_deserializer

  let request_with_metadata context (request : delete_transformer_request) =
    let input = Json_serializers.delete_transformer_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata ~shape_name:"Logs_20140328.DeleteTransformer"
      ~service ~context ~input
      ~output_deserializer:Smaws_Lib.Smithy_api.Json_deserializers.unit__of_yojson
      ~error_deserializer
end

module DeleteSyslogConfiguration = struct
  let error_to_string = function
    | `AccessDeniedException _ -> "com.amazonaws.cloudwatchlogs#AccessDeniedException"
    | `InvalidOperationException _ -> "com.amazonaws.cloudwatchlogs#InvalidOperationException"
    | `InvalidParameterException _ -> "com.amazonaws.cloudwatchlogs#InvalidParameterException"
    | `OperationAbortedException _ -> "com.amazonaws.cloudwatchlogs#OperationAbortedException"
    | `ResourceNotFoundException _ -> "com.amazonaws.cloudwatchlogs#ResourceNotFoundException"
    | `ServiceUnavailableException _ -> "com.amazonaws.cloudwatchlogs#ServiceUnavailableException"
    | `ThrottlingException _ -> "com.amazonaws.cloudwatchlogs#ThrottlingException"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "AccessDeniedException" ->
          `AccessDeniedException (Json_deserializers.access_denied_exception_of_yojson tree path)
      | _, "InvalidOperationException" ->
          `InvalidOperationException
            (Json_deserializers.invalid_operation_exception_of_yojson tree path)
      | _, "InvalidParameterException" ->
          `InvalidParameterException
            (Json_deserializers.invalid_parameter_exception_of_yojson tree path)
      | _, "OperationAbortedException" ->
          `OperationAbortedException
            (Json_deserializers.operation_aborted_exception_of_yojson tree path)
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

  let request context (request : delete_syslog_configuration_request) =
    let input = Json_serializers.delete_syslog_configuration_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"Logs_20140328.DeleteSyslogConfiguration"
      ~service ~context ~input
      ~output_deserializer:Smaws_Lib.Smithy_api.Json_deserializers.unit__of_yojson
      ~error_deserializer

  let request_with_metadata context (request : delete_syslog_configuration_request) =
    let input = Json_serializers.delete_syslog_configuration_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata
      ~shape_name:"Logs_20140328.DeleteSyslogConfiguration" ~service ~context ~input
      ~output_deserializer:Smaws_Lib.Smithy_api.Json_deserializers.unit__of_yojson
      ~error_deserializer
end

module DeleteSubscriptionFilter = struct
  let error_to_string = function
    | `InvalidParameterException _ -> "com.amazonaws.cloudwatchlogs#InvalidParameterException"
    | `OperationAbortedException _ -> "com.amazonaws.cloudwatchlogs#OperationAbortedException"
    | `ResourceNotFoundException _ -> "com.amazonaws.cloudwatchlogs#ResourceNotFoundException"
    | `ServiceUnavailableException _ -> "com.amazonaws.cloudwatchlogs#ServiceUnavailableException"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "InvalidParameterException" ->
          `InvalidParameterException
            (Json_deserializers.invalid_parameter_exception_of_yojson tree path)
      | _, "OperationAbortedException" ->
          `OperationAbortedException
            (Json_deserializers.operation_aborted_exception_of_yojson tree path)
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

  let request context (request : delete_subscription_filter_request) =
    let input = Json_serializers.delete_subscription_filter_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"Logs_20140328.DeleteSubscriptionFilter"
      ~service ~context ~input
      ~output_deserializer:Smaws_Lib.Smithy_api.Json_deserializers.unit__of_yojson
      ~error_deserializer

  let request_with_metadata context (request : delete_subscription_filter_request) =
    let input = Json_serializers.delete_subscription_filter_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata
      ~shape_name:"Logs_20140328.DeleteSubscriptionFilter" ~service ~context ~input
      ~output_deserializer:Smaws_Lib.Smithy_api.Json_deserializers.unit__of_yojson
      ~error_deserializer
end

module DeleteScheduledQuery = struct
  let error_to_string = function
    | `AccessDeniedException _ -> "com.amazonaws.cloudwatchlogs#AccessDeniedException"
    | `InternalServerException _ -> "com.amazonaws.cloudwatchlogs#InternalServerException"
    | `ResourceNotFoundException _ -> "com.amazonaws.cloudwatchlogs#ResourceNotFoundException"
    | `ThrottlingException _ -> "com.amazonaws.cloudwatchlogs#ThrottlingException"
    | `ValidationException _ -> "com.amazonaws.cloudwatchlogs#ValidationException"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "AccessDeniedException" ->
          `AccessDeniedException (Json_deserializers.access_denied_exception_of_yojson tree path)
      | _, "InternalServerException" ->
          `InternalServerException
            (Json_deserializers.internal_server_exception_of_yojson tree path)
      | _, "ResourceNotFoundException" ->
          `ResourceNotFoundException
            (Json_deserializers.resource_not_found_exception_of_yojson tree path)
      | _, "ThrottlingException" ->
          `ThrottlingException (Json_deserializers.throttling_exception_of_yojson tree path)
      | _, "ValidationException" ->
          `ValidationException (Json_deserializers.validation_exception_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : delete_scheduled_query_request) =
    let input = Json_serializers.delete_scheduled_query_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"Logs_20140328.DeleteScheduledQuery" ~service
      ~context ~input
      ~output_deserializer:Json_deserializers.delete_scheduled_query_response_of_yojson
      ~error_deserializer

  let request_with_metadata context (request : delete_scheduled_query_request) =
    let input = Json_serializers.delete_scheduled_query_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata
      ~shape_name:"Logs_20140328.DeleteScheduledQuery" ~service ~context ~input
      ~output_deserializer:Json_deserializers.delete_scheduled_query_response_of_yojson
      ~error_deserializer
end

module DeleteRetentionPolicy = struct
  let error_to_string = function
    | `InvalidParameterException _ -> "com.amazonaws.cloudwatchlogs#InvalidParameterException"
    | `OperationAbortedException _ -> "com.amazonaws.cloudwatchlogs#OperationAbortedException"
    | `ResourceNotFoundException _ -> "com.amazonaws.cloudwatchlogs#ResourceNotFoundException"
    | `ServiceUnavailableException _ -> "com.amazonaws.cloudwatchlogs#ServiceUnavailableException"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "InvalidParameterException" ->
          `InvalidParameterException
            (Json_deserializers.invalid_parameter_exception_of_yojson tree path)
      | _, "OperationAbortedException" ->
          `OperationAbortedException
            (Json_deserializers.operation_aborted_exception_of_yojson tree path)
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

  let request context (request : delete_retention_policy_request) =
    let input = Json_serializers.delete_retention_policy_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"Logs_20140328.DeleteRetentionPolicy" ~service
      ~context ~input ~output_deserializer:Smaws_Lib.Smithy_api.Json_deserializers.unit__of_yojson
      ~error_deserializer

  let request_with_metadata context (request : delete_retention_policy_request) =
    let input = Json_serializers.delete_retention_policy_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata
      ~shape_name:"Logs_20140328.DeleteRetentionPolicy" ~service ~context ~input
      ~output_deserializer:Smaws_Lib.Smithy_api.Json_deserializers.unit__of_yojson
      ~error_deserializer
end

module DeleteResourcePolicy = struct
  let error_to_string = function
    | `InvalidParameterException _ -> "com.amazonaws.cloudwatchlogs#InvalidParameterException"
    | `OperationAbortedException _ -> "com.amazonaws.cloudwatchlogs#OperationAbortedException"
    | `ResourceNotFoundException _ -> "com.amazonaws.cloudwatchlogs#ResourceNotFoundException"
    | `ServiceUnavailableException _ -> "com.amazonaws.cloudwatchlogs#ServiceUnavailableException"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "InvalidParameterException" ->
          `InvalidParameterException
            (Json_deserializers.invalid_parameter_exception_of_yojson tree path)
      | _, "OperationAbortedException" ->
          `OperationAbortedException
            (Json_deserializers.operation_aborted_exception_of_yojson tree path)
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

  let request context (request : delete_resource_policy_request) =
    let input = Json_serializers.delete_resource_policy_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"Logs_20140328.DeleteResourcePolicy" ~service
      ~context ~input ~output_deserializer:Smaws_Lib.Smithy_api.Json_deserializers.unit__of_yojson
      ~error_deserializer

  let request_with_metadata context (request : delete_resource_policy_request) =
    let input = Json_serializers.delete_resource_policy_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata
      ~shape_name:"Logs_20140328.DeleteResourcePolicy" ~service ~context ~input
      ~output_deserializer:Smaws_Lib.Smithy_api.Json_deserializers.unit__of_yojson
      ~error_deserializer
end

module DeleteQueryDefinition = struct
  let error_to_string = function
    | `InvalidParameterException _ -> "com.amazonaws.cloudwatchlogs#InvalidParameterException"
    | `ResourceNotFoundException _ -> "com.amazonaws.cloudwatchlogs#ResourceNotFoundException"
    | `ServiceUnavailableException _ -> "com.amazonaws.cloudwatchlogs#ServiceUnavailableException"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "InvalidParameterException" ->
          `InvalidParameterException
            (Json_deserializers.invalid_parameter_exception_of_yojson tree path)
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

  let request context (request : delete_query_definition_request) =
    let input = Json_serializers.delete_query_definition_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"Logs_20140328.DeleteQueryDefinition" ~service
      ~context ~input
      ~output_deserializer:Json_deserializers.delete_query_definition_response_of_yojson
      ~error_deserializer

  let request_with_metadata context (request : delete_query_definition_request) =
    let input = Json_serializers.delete_query_definition_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata
      ~shape_name:"Logs_20140328.DeleteQueryDefinition" ~service ~context ~input
      ~output_deserializer:Json_deserializers.delete_query_definition_response_of_yojson
      ~error_deserializer
end

module DeleteMetricFilter = struct
  let error_to_string = function
    | `InvalidParameterException _ -> "com.amazonaws.cloudwatchlogs#InvalidParameterException"
    | `OperationAbortedException _ -> "com.amazonaws.cloudwatchlogs#OperationAbortedException"
    | `ResourceNotFoundException _ -> "com.amazonaws.cloudwatchlogs#ResourceNotFoundException"
    | `ServiceUnavailableException _ -> "com.amazonaws.cloudwatchlogs#ServiceUnavailableException"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "InvalidParameterException" ->
          `InvalidParameterException
            (Json_deserializers.invalid_parameter_exception_of_yojson tree path)
      | _, "OperationAbortedException" ->
          `OperationAbortedException
            (Json_deserializers.operation_aborted_exception_of_yojson tree path)
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

  let request context (request : delete_metric_filter_request) =
    let input = Json_serializers.delete_metric_filter_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"Logs_20140328.DeleteMetricFilter" ~service
      ~context ~input ~output_deserializer:Smaws_Lib.Smithy_api.Json_deserializers.unit__of_yojson
      ~error_deserializer

  let request_with_metadata context (request : delete_metric_filter_request) =
    let input = Json_serializers.delete_metric_filter_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata ~shape_name:"Logs_20140328.DeleteMetricFilter"
      ~service ~context ~input
      ~output_deserializer:Smaws_Lib.Smithy_api.Json_deserializers.unit__of_yojson
      ~error_deserializer
end

module DeleteLookupTable = struct
  let error_to_string = function
    | `AccessDeniedException _ -> "com.amazonaws.cloudwatchlogs#AccessDeniedException"
    | `InvalidParameterException _ -> "com.amazonaws.cloudwatchlogs#InvalidParameterException"
    | `ResourceNotFoundException _ -> "com.amazonaws.cloudwatchlogs#ResourceNotFoundException"
    | `ServiceUnavailableException _ -> "com.amazonaws.cloudwatchlogs#ServiceUnavailableException"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "AccessDeniedException" ->
          `AccessDeniedException (Json_deserializers.access_denied_exception_of_yojson tree path)
      | _, "InvalidParameterException" ->
          `InvalidParameterException
            (Json_deserializers.invalid_parameter_exception_of_yojson tree path)
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

  let request context (request : delete_lookup_table_request) =
    let input = Json_serializers.delete_lookup_table_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"Logs_20140328.DeleteLookupTable" ~service
      ~context ~input ~output_deserializer:Smaws_Lib.Smithy_api.Json_deserializers.unit__of_yojson
      ~error_deserializer

  let request_with_metadata context (request : delete_lookup_table_request) =
    let input = Json_serializers.delete_lookup_table_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata ~shape_name:"Logs_20140328.DeleteLookupTable"
      ~service ~context ~input
      ~output_deserializer:Smaws_Lib.Smithy_api.Json_deserializers.unit__of_yojson
      ~error_deserializer
end

module DeleteLogStream = struct
  let error_to_string = function
    | `InvalidParameterException _ -> "com.amazonaws.cloudwatchlogs#InvalidParameterException"
    | `OperationAbortedException _ -> "com.amazonaws.cloudwatchlogs#OperationAbortedException"
    | `ResourceNotFoundException _ -> "com.amazonaws.cloudwatchlogs#ResourceNotFoundException"
    | `ServiceUnavailableException _ -> "com.amazonaws.cloudwatchlogs#ServiceUnavailableException"
    | `ValidationException _ -> "com.amazonaws.cloudwatchlogs#ValidationException"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "InvalidParameterException" ->
          `InvalidParameterException
            (Json_deserializers.invalid_parameter_exception_of_yojson tree path)
      | _, "OperationAbortedException" ->
          `OperationAbortedException
            (Json_deserializers.operation_aborted_exception_of_yojson tree path)
      | _, "ResourceNotFoundException" ->
          `ResourceNotFoundException
            (Json_deserializers.resource_not_found_exception_of_yojson tree path)
      | _, "ServiceUnavailableException" ->
          `ServiceUnavailableException
            (Json_deserializers.service_unavailable_exception_of_yojson tree path)
      | _, "ValidationException" ->
          `ValidationException (Json_deserializers.validation_exception_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : delete_log_stream_request) =
    let input = Json_serializers.delete_log_stream_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"Logs_20140328.DeleteLogStream" ~service
      ~context ~input ~output_deserializer:Smaws_Lib.Smithy_api.Json_deserializers.unit__of_yojson
      ~error_deserializer

  let request_with_metadata context (request : delete_log_stream_request) =
    let input = Json_serializers.delete_log_stream_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata ~shape_name:"Logs_20140328.DeleteLogStream"
      ~service ~context ~input
      ~output_deserializer:Smaws_Lib.Smithy_api.Json_deserializers.unit__of_yojson
      ~error_deserializer
end

module DeleteLogGroup = struct
  let error_to_string = function
    | `InvalidParameterException _ -> "com.amazonaws.cloudwatchlogs#InvalidParameterException"
    | `OperationAbortedException _ -> "com.amazonaws.cloudwatchlogs#OperationAbortedException"
    | `ResourceNotFoundException _ -> "com.amazonaws.cloudwatchlogs#ResourceNotFoundException"
    | `ServiceUnavailableException _ -> "com.amazonaws.cloudwatchlogs#ServiceUnavailableException"
    | `ValidationException _ -> "com.amazonaws.cloudwatchlogs#ValidationException"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "InvalidParameterException" ->
          `InvalidParameterException
            (Json_deserializers.invalid_parameter_exception_of_yojson tree path)
      | _, "OperationAbortedException" ->
          `OperationAbortedException
            (Json_deserializers.operation_aborted_exception_of_yojson tree path)
      | _, "ResourceNotFoundException" ->
          `ResourceNotFoundException
            (Json_deserializers.resource_not_found_exception_of_yojson tree path)
      | _, "ServiceUnavailableException" ->
          `ServiceUnavailableException
            (Json_deserializers.service_unavailable_exception_of_yojson tree path)
      | _, "ValidationException" ->
          `ValidationException (Json_deserializers.validation_exception_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : delete_log_group_request) =
    let input = Json_serializers.delete_log_group_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"Logs_20140328.DeleteLogGroup" ~service ~context
      ~input ~output_deserializer:Smaws_Lib.Smithy_api.Json_deserializers.unit__of_yojson
      ~error_deserializer

  let request_with_metadata context (request : delete_log_group_request) =
    let input = Json_serializers.delete_log_group_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata ~shape_name:"Logs_20140328.DeleteLogGroup"
      ~service ~context ~input
      ~output_deserializer:Smaws_Lib.Smithy_api.Json_deserializers.unit__of_yojson
      ~error_deserializer
end

module DeleteLogAnomalyDetector = struct
  let error_to_string = function
    | `InvalidParameterException _ -> "com.amazonaws.cloudwatchlogs#InvalidParameterException"
    | `OperationAbortedException _ -> "com.amazonaws.cloudwatchlogs#OperationAbortedException"
    | `ResourceNotFoundException _ -> "com.amazonaws.cloudwatchlogs#ResourceNotFoundException"
    | `ServiceUnavailableException _ -> "com.amazonaws.cloudwatchlogs#ServiceUnavailableException"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "InvalidParameterException" ->
          `InvalidParameterException
            (Json_deserializers.invalid_parameter_exception_of_yojson tree path)
      | _, "OperationAbortedException" ->
          `OperationAbortedException
            (Json_deserializers.operation_aborted_exception_of_yojson tree path)
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

  let request context (request : delete_log_anomaly_detector_request) =
    let input = Json_serializers.delete_log_anomaly_detector_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"Logs_20140328.DeleteLogAnomalyDetector"
      ~service ~context ~input
      ~output_deserializer:Smaws_Lib.Smithy_api.Json_deserializers.unit__of_yojson
      ~error_deserializer

  let request_with_metadata context (request : delete_log_anomaly_detector_request) =
    let input = Json_serializers.delete_log_anomaly_detector_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata
      ~shape_name:"Logs_20140328.DeleteLogAnomalyDetector" ~service ~context ~input
      ~output_deserializer:Smaws_Lib.Smithy_api.Json_deserializers.unit__of_yojson
      ~error_deserializer
end

module DeleteIntegration = struct
  let error_to_string = function
    | `InvalidParameterException _ -> "com.amazonaws.cloudwatchlogs#InvalidParameterException"
    | `ResourceNotFoundException _ -> "com.amazonaws.cloudwatchlogs#ResourceNotFoundException"
    | `ServiceUnavailableException _ -> "com.amazonaws.cloudwatchlogs#ServiceUnavailableException"
    | `ValidationException _ -> "com.amazonaws.cloudwatchlogs#ValidationException"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "InvalidParameterException" ->
          `InvalidParameterException
            (Json_deserializers.invalid_parameter_exception_of_yojson tree path)
      | _, "ResourceNotFoundException" ->
          `ResourceNotFoundException
            (Json_deserializers.resource_not_found_exception_of_yojson tree path)
      | _, "ServiceUnavailableException" ->
          `ServiceUnavailableException
            (Json_deserializers.service_unavailable_exception_of_yojson tree path)
      | _, "ValidationException" ->
          `ValidationException (Json_deserializers.validation_exception_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : delete_integration_request) =
    let input = Json_serializers.delete_integration_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"Logs_20140328.DeleteIntegration" ~service
      ~context ~input ~output_deserializer:Json_deserializers.delete_integration_response_of_yojson
      ~error_deserializer

  let request_with_metadata context (request : delete_integration_request) =
    let input = Json_serializers.delete_integration_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata ~shape_name:"Logs_20140328.DeleteIntegration"
      ~service ~context ~input
      ~output_deserializer:Json_deserializers.delete_integration_response_of_yojson
      ~error_deserializer
end

module DeleteIndexPolicy = struct
  let error_to_string = function
    | `InvalidParameterException _ -> "com.amazonaws.cloudwatchlogs#InvalidParameterException"
    | `LimitExceededException _ -> "com.amazonaws.cloudwatchlogs#LimitExceededException"
    | `OperationAbortedException _ -> "com.amazonaws.cloudwatchlogs#OperationAbortedException"
    | `ResourceNotFoundException _ -> "com.amazonaws.cloudwatchlogs#ResourceNotFoundException"
    | `ServiceUnavailableException _ -> "com.amazonaws.cloudwatchlogs#ServiceUnavailableException"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "InvalidParameterException" ->
          `InvalidParameterException
            (Json_deserializers.invalid_parameter_exception_of_yojson tree path)
      | _, "LimitExceededException" ->
          `LimitExceededException (Json_deserializers.limit_exceeded_exception_of_yojson tree path)
      | _, "OperationAbortedException" ->
          `OperationAbortedException
            (Json_deserializers.operation_aborted_exception_of_yojson tree path)
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

  let request context (request : delete_index_policy_request) =
    let input = Json_serializers.delete_index_policy_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"Logs_20140328.DeleteIndexPolicy" ~service
      ~context ~input ~output_deserializer:Json_deserializers.delete_index_policy_response_of_yojson
      ~error_deserializer

  let request_with_metadata context (request : delete_index_policy_request) =
    let input = Json_serializers.delete_index_policy_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata ~shape_name:"Logs_20140328.DeleteIndexPolicy"
      ~service ~context ~input
      ~output_deserializer:Json_deserializers.delete_index_policy_response_of_yojson
      ~error_deserializer
end

module DeleteDestination = struct
  let error_to_string = function
    | `InvalidParameterException _ -> "com.amazonaws.cloudwatchlogs#InvalidParameterException"
    | `OperationAbortedException _ -> "com.amazonaws.cloudwatchlogs#OperationAbortedException"
    | `ResourceNotFoundException _ -> "com.amazonaws.cloudwatchlogs#ResourceNotFoundException"
    | `ServiceUnavailableException _ -> "com.amazonaws.cloudwatchlogs#ServiceUnavailableException"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "InvalidParameterException" ->
          `InvalidParameterException
            (Json_deserializers.invalid_parameter_exception_of_yojson tree path)
      | _, "OperationAbortedException" ->
          `OperationAbortedException
            (Json_deserializers.operation_aborted_exception_of_yojson tree path)
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

  let request context (request : delete_destination_request) =
    let input = Json_serializers.delete_destination_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"Logs_20140328.DeleteDestination" ~service
      ~context ~input ~output_deserializer:Smaws_Lib.Smithy_api.Json_deserializers.unit__of_yojson
      ~error_deserializer

  let request_with_metadata context (request : delete_destination_request) =
    let input = Json_serializers.delete_destination_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata ~shape_name:"Logs_20140328.DeleteDestination"
      ~service ~context ~input
      ~output_deserializer:Smaws_Lib.Smithy_api.Json_deserializers.unit__of_yojson
      ~error_deserializer
end

module DeleteDeliverySource = struct
  let error_to_string = function
    | `ConflictException _ -> "com.amazonaws.cloudwatchlogs#ConflictException"
    | `ResourceNotFoundException _ -> "com.amazonaws.cloudwatchlogs#ResourceNotFoundException"
    | `ServiceQuotaExceededException _ ->
        "com.amazonaws.cloudwatchlogs#ServiceQuotaExceededException"
    | `ServiceUnavailableException _ -> "com.amazonaws.cloudwatchlogs#ServiceUnavailableException"
    | `ThrottlingException _ -> "com.amazonaws.cloudwatchlogs#ThrottlingException"
    | `ValidationException _ -> "com.amazonaws.cloudwatchlogs#ValidationException"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "ConflictException" ->
          `ConflictException (Json_deserializers.conflict_exception_of_yojson tree path)
      | _, "ResourceNotFoundException" ->
          `ResourceNotFoundException
            (Json_deserializers.resource_not_found_exception_of_yojson tree path)
      | _, "ServiceQuotaExceededException" ->
          `ServiceQuotaExceededException
            (Json_deserializers.service_quota_exceeded_exception_of_yojson tree path)
      | _, "ServiceUnavailableException" ->
          `ServiceUnavailableException
            (Json_deserializers.service_unavailable_exception_of_yojson tree path)
      | _, "ThrottlingException" ->
          `ThrottlingException (Json_deserializers.throttling_exception_of_yojson tree path)
      | _, "ValidationException" ->
          `ValidationException (Json_deserializers.validation_exception_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : delete_delivery_source_request) =
    let input = Json_serializers.delete_delivery_source_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"Logs_20140328.DeleteDeliverySource" ~service
      ~context ~input ~output_deserializer:Smaws_Lib.Smithy_api.Json_deserializers.unit__of_yojson
      ~error_deserializer

  let request_with_metadata context (request : delete_delivery_source_request) =
    let input = Json_serializers.delete_delivery_source_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata
      ~shape_name:"Logs_20140328.DeleteDeliverySource" ~service ~context ~input
      ~output_deserializer:Smaws_Lib.Smithy_api.Json_deserializers.unit__of_yojson
      ~error_deserializer
end

module DeleteDeliveryDestinationPolicy = struct
  let error_to_string = function
    | `ConflictException _ -> "com.amazonaws.cloudwatchlogs#ConflictException"
    | `ResourceNotFoundException _ -> "com.amazonaws.cloudwatchlogs#ResourceNotFoundException"
    | `ServiceUnavailableException _ -> "com.amazonaws.cloudwatchlogs#ServiceUnavailableException"
    | `ValidationException _ -> "com.amazonaws.cloudwatchlogs#ValidationException"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "ConflictException" ->
          `ConflictException (Json_deserializers.conflict_exception_of_yojson tree path)
      | _, "ResourceNotFoundException" ->
          `ResourceNotFoundException
            (Json_deserializers.resource_not_found_exception_of_yojson tree path)
      | _, "ServiceUnavailableException" ->
          `ServiceUnavailableException
            (Json_deserializers.service_unavailable_exception_of_yojson tree path)
      | _, "ValidationException" ->
          `ValidationException (Json_deserializers.validation_exception_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : delete_delivery_destination_policy_request) =
    let input = Json_serializers.delete_delivery_destination_policy_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"Logs_20140328.DeleteDeliveryDestinationPolicy"
      ~service ~context ~input
      ~output_deserializer:Smaws_Lib.Smithy_api.Json_deserializers.unit__of_yojson
      ~error_deserializer

  let request_with_metadata context (request : delete_delivery_destination_policy_request) =
    let input = Json_serializers.delete_delivery_destination_policy_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata
      ~shape_name:"Logs_20140328.DeleteDeliveryDestinationPolicy" ~service ~context ~input
      ~output_deserializer:Smaws_Lib.Smithy_api.Json_deserializers.unit__of_yojson
      ~error_deserializer
end

module DeleteDeliveryDestination = struct
  let error_to_string = function
    | `ConflictException _ -> "com.amazonaws.cloudwatchlogs#ConflictException"
    | `ResourceNotFoundException _ -> "com.amazonaws.cloudwatchlogs#ResourceNotFoundException"
    | `ServiceQuotaExceededException _ ->
        "com.amazonaws.cloudwatchlogs#ServiceQuotaExceededException"
    | `ServiceUnavailableException _ -> "com.amazonaws.cloudwatchlogs#ServiceUnavailableException"
    | `ThrottlingException _ -> "com.amazonaws.cloudwatchlogs#ThrottlingException"
    | `ValidationException _ -> "com.amazonaws.cloudwatchlogs#ValidationException"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "ConflictException" ->
          `ConflictException (Json_deserializers.conflict_exception_of_yojson tree path)
      | _, "ResourceNotFoundException" ->
          `ResourceNotFoundException
            (Json_deserializers.resource_not_found_exception_of_yojson tree path)
      | _, "ServiceQuotaExceededException" ->
          `ServiceQuotaExceededException
            (Json_deserializers.service_quota_exceeded_exception_of_yojson tree path)
      | _, "ServiceUnavailableException" ->
          `ServiceUnavailableException
            (Json_deserializers.service_unavailable_exception_of_yojson tree path)
      | _, "ThrottlingException" ->
          `ThrottlingException (Json_deserializers.throttling_exception_of_yojson tree path)
      | _, "ValidationException" ->
          `ValidationException (Json_deserializers.validation_exception_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : delete_delivery_destination_request) =
    let input = Json_serializers.delete_delivery_destination_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"Logs_20140328.DeleteDeliveryDestination"
      ~service ~context ~input
      ~output_deserializer:Smaws_Lib.Smithy_api.Json_deserializers.unit__of_yojson
      ~error_deserializer

  let request_with_metadata context (request : delete_delivery_destination_request) =
    let input = Json_serializers.delete_delivery_destination_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata
      ~shape_name:"Logs_20140328.DeleteDeliveryDestination" ~service ~context ~input
      ~output_deserializer:Smaws_Lib.Smithy_api.Json_deserializers.unit__of_yojson
      ~error_deserializer
end

module DeleteDelivery = struct
  let error_to_string = function
    | `ConflictException _ -> "com.amazonaws.cloudwatchlogs#ConflictException"
    | `ResourceNotFoundException _ -> "com.amazonaws.cloudwatchlogs#ResourceNotFoundException"
    | `ServiceQuotaExceededException _ ->
        "com.amazonaws.cloudwatchlogs#ServiceQuotaExceededException"
    | `ServiceUnavailableException _ -> "com.amazonaws.cloudwatchlogs#ServiceUnavailableException"
    | `ThrottlingException _ -> "com.amazonaws.cloudwatchlogs#ThrottlingException"
    | `ValidationException _ -> "com.amazonaws.cloudwatchlogs#ValidationException"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "ConflictException" ->
          `ConflictException (Json_deserializers.conflict_exception_of_yojson tree path)
      | _, "ResourceNotFoundException" ->
          `ResourceNotFoundException
            (Json_deserializers.resource_not_found_exception_of_yojson tree path)
      | _, "ServiceQuotaExceededException" ->
          `ServiceQuotaExceededException
            (Json_deserializers.service_quota_exceeded_exception_of_yojson tree path)
      | _, "ServiceUnavailableException" ->
          `ServiceUnavailableException
            (Json_deserializers.service_unavailable_exception_of_yojson tree path)
      | _, "ThrottlingException" ->
          `ThrottlingException (Json_deserializers.throttling_exception_of_yojson tree path)
      | _, "ValidationException" ->
          `ValidationException (Json_deserializers.validation_exception_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : delete_delivery_request) =
    let input = Json_serializers.delete_delivery_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"Logs_20140328.DeleteDelivery" ~service ~context
      ~input ~output_deserializer:Smaws_Lib.Smithy_api.Json_deserializers.unit__of_yojson
      ~error_deserializer

  let request_with_metadata context (request : delete_delivery_request) =
    let input = Json_serializers.delete_delivery_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata ~shape_name:"Logs_20140328.DeleteDelivery"
      ~service ~context ~input
      ~output_deserializer:Smaws_Lib.Smithy_api.Json_deserializers.unit__of_yojson
      ~error_deserializer
end

module DeleteDataProtectionPolicy = struct
  let error_to_string = function
    | `InvalidParameterException _ -> "com.amazonaws.cloudwatchlogs#InvalidParameterException"
    | `OperationAbortedException _ -> "com.amazonaws.cloudwatchlogs#OperationAbortedException"
    | `ResourceNotFoundException _ -> "com.amazonaws.cloudwatchlogs#ResourceNotFoundException"
    | `ServiceUnavailableException _ -> "com.amazonaws.cloudwatchlogs#ServiceUnavailableException"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "InvalidParameterException" ->
          `InvalidParameterException
            (Json_deserializers.invalid_parameter_exception_of_yojson tree path)
      | _, "OperationAbortedException" ->
          `OperationAbortedException
            (Json_deserializers.operation_aborted_exception_of_yojson tree path)
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

  let request context (request : delete_data_protection_policy_request) =
    let input = Json_serializers.delete_data_protection_policy_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"Logs_20140328.DeleteDataProtectionPolicy"
      ~service ~context ~input
      ~output_deserializer:Smaws_Lib.Smithy_api.Json_deserializers.unit__of_yojson
      ~error_deserializer

  let request_with_metadata context (request : delete_data_protection_policy_request) =
    let input = Json_serializers.delete_data_protection_policy_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata
      ~shape_name:"Logs_20140328.DeleteDataProtectionPolicy" ~service ~context ~input
      ~output_deserializer:Smaws_Lib.Smithy_api.Json_deserializers.unit__of_yojson
      ~error_deserializer
end

module DeleteAccountPolicy = struct
  let error_to_string = function
    | `InvalidParameterException _ -> "com.amazonaws.cloudwatchlogs#InvalidParameterException"
    | `OperationAbortedException _ -> "com.amazonaws.cloudwatchlogs#OperationAbortedException"
    | `ResourceNotFoundException _ -> "com.amazonaws.cloudwatchlogs#ResourceNotFoundException"
    | `ServiceUnavailableException _ -> "com.amazonaws.cloudwatchlogs#ServiceUnavailableException"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "InvalidParameterException" ->
          `InvalidParameterException
            (Json_deserializers.invalid_parameter_exception_of_yojson tree path)
      | _, "OperationAbortedException" ->
          `OperationAbortedException
            (Json_deserializers.operation_aborted_exception_of_yojson tree path)
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

  let request context (request : delete_account_policy_request) =
    let input = Json_serializers.delete_account_policy_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"Logs_20140328.DeleteAccountPolicy" ~service
      ~context ~input ~output_deserializer:Smaws_Lib.Smithy_api.Json_deserializers.unit__of_yojson
      ~error_deserializer

  let request_with_metadata context (request : delete_account_policy_request) =
    let input = Json_serializers.delete_account_policy_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata
      ~shape_name:"Logs_20140328.DeleteAccountPolicy" ~service ~context ~input
      ~output_deserializer:Smaws_Lib.Smithy_api.Json_deserializers.unit__of_yojson
      ~error_deserializer
end

module CreateScheduledQuery = struct
  let error_to_string = function
    | `AccessDeniedException _ -> "com.amazonaws.cloudwatchlogs#AccessDeniedException"
    | `ConflictException _ -> "com.amazonaws.cloudwatchlogs#ConflictException"
    | `InternalServerException _ -> "com.amazonaws.cloudwatchlogs#InternalServerException"
    | `ResourceNotFoundException _ -> "com.amazonaws.cloudwatchlogs#ResourceNotFoundException"
    | `ServiceQuotaExceededException _ ->
        "com.amazonaws.cloudwatchlogs#ServiceQuotaExceededException"
    | `ThrottlingException _ -> "com.amazonaws.cloudwatchlogs#ThrottlingException"
    | `ValidationException _ -> "com.amazonaws.cloudwatchlogs#ValidationException"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "AccessDeniedException" ->
          `AccessDeniedException (Json_deserializers.access_denied_exception_of_yojson tree path)
      | _, "ConflictException" ->
          `ConflictException (Json_deserializers.conflict_exception_of_yojson tree path)
      | _, "InternalServerException" ->
          `InternalServerException
            (Json_deserializers.internal_server_exception_of_yojson tree path)
      | _, "ResourceNotFoundException" ->
          `ResourceNotFoundException
            (Json_deserializers.resource_not_found_exception_of_yojson tree path)
      | _, "ServiceQuotaExceededException" ->
          `ServiceQuotaExceededException
            (Json_deserializers.service_quota_exceeded_exception_of_yojson tree path)
      | _, "ThrottlingException" ->
          `ThrottlingException (Json_deserializers.throttling_exception_of_yojson tree path)
      | _, "ValidationException" ->
          `ValidationException (Json_deserializers.validation_exception_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : create_scheduled_query_request) =
    let input = Json_serializers.create_scheduled_query_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"Logs_20140328.CreateScheduledQuery" ~service
      ~context ~input
      ~output_deserializer:Json_deserializers.create_scheduled_query_response_of_yojson
      ~error_deserializer

  let request_with_metadata context (request : create_scheduled_query_request) =
    let input = Json_serializers.create_scheduled_query_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata
      ~shape_name:"Logs_20140328.CreateScheduledQuery" ~service ~context ~input
      ~output_deserializer:Json_deserializers.create_scheduled_query_response_of_yojson
      ~error_deserializer
end

module CreateLookupTable = struct
  let error_to_string = function
    | `AccessDeniedException _ -> "com.amazonaws.cloudwatchlogs#AccessDeniedException"
    | `InvalidParameterException _ -> "com.amazonaws.cloudwatchlogs#InvalidParameterException"
    | `LimitExceededException _ -> "com.amazonaws.cloudwatchlogs#LimitExceededException"
    | `ResourceAlreadyExistsException _ ->
        "com.amazonaws.cloudwatchlogs#ResourceAlreadyExistsException"
    | `ServiceUnavailableException _ -> "com.amazonaws.cloudwatchlogs#ServiceUnavailableException"
    | `ValidationException _ -> "com.amazonaws.cloudwatchlogs#ValidationException"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "AccessDeniedException" ->
          `AccessDeniedException (Json_deserializers.access_denied_exception_of_yojson tree path)
      | _, "InvalidParameterException" ->
          `InvalidParameterException
            (Json_deserializers.invalid_parameter_exception_of_yojson tree path)
      | _, "LimitExceededException" ->
          `LimitExceededException (Json_deserializers.limit_exceeded_exception_of_yojson tree path)
      | _, "ResourceAlreadyExistsException" ->
          `ResourceAlreadyExistsException
            (Json_deserializers.resource_already_exists_exception_of_yojson tree path)
      | _, "ServiceUnavailableException" ->
          `ServiceUnavailableException
            (Json_deserializers.service_unavailable_exception_of_yojson tree path)
      | _, "ValidationException" ->
          `ValidationException (Json_deserializers.validation_exception_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : create_lookup_table_request) =
    let input = Json_serializers.create_lookup_table_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"Logs_20140328.CreateLookupTable" ~service
      ~context ~input ~output_deserializer:Json_deserializers.create_lookup_table_response_of_yojson
      ~error_deserializer

  let request_with_metadata context (request : create_lookup_table_request) =
    let input = Json_serializers.create_lookup_table_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata ~shape_name:"Logs_20140328.CreateLookupTable"
      ~service ~context ~input
      ~output_deserializer:Json_deserializers.create_lookup_table_response_of_yojson
      ~error_deserializer
end

module CreateLogStream = struct
  let error_to_string = function
    | `InvalidParameterException _ -> "com.amazonaws.cloudwatchlogs#InvalidParameterException"
    | `ResourceAlreadyExistsException _ ->
        "com.amazonaws.cloudwatchlogs#ResourceAlreadyExistsException"
    | `ResourceNotFoundException _ -> "com.amazonaws.cloudwatchlogs#ResourceNotFoundException"
    | `ServiceUnavailableException _ -> "com.amazonaws.cloudwatchlogs#ServiceUnavailableException"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "InvalidParameterException" ->
          `InvalidParameterException
            (Json_deserializers.invalid_parameter_exception_of_yojson tree path)
      | _, "ResourceAlreadyExistsException" ->
          `ResourceAlreadyExistsException
            (Json_deserializers.resource_already_exists_exception_of_yojson tree path)
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

  let request context (request : create_log_stream_request) =
    let input = Json_serializers.create_log_stream_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"Logs_20140328.CreateLogStream" ~service
      ~context ~input ~output_deserializer:Smaws_Lib.Smithy_api.Json_deserializers.unit__of_yojson
      ~error_deserializer

  let request_with_metadata context (request : create_log_stream_request) =
    let input = Json_serializers.create_log_stream_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata ~shape_name:"Logs_20140328.CreateLogStream"
      ~service ~context ~input
      ~output_deserializer:Smaws_Lib.Smithy_api.Json_deserializers.unit__of_yojson
      ~error_deserializer
end

module CreateLogGroup = struct
  let error_to_string = function
    | `InvalidParameterException _ -> "com.amazonaws.cloudwatchlogs#InvalidParameterException"
    | `LimitExceededException _ -> "com.amazonaws.cloudwatchlogs#LimitExceededException"
    | `OperationAbortedException _ -> "com.amazonaws.cloudwatchlogs#OperationAbortedException"
    | `ResourceAlreadyExistsException _ ->
        "com.amazonaws.cloudwatchlogs#ResourceAlreadyExistsException"
    | `ServiceUnavailableException _ -> "com.amazonaws.cloudwatchlogs#ServiceUnavailableException"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "InvalidParameterException" ->
          `InvalidParameterException
            (Json_deserializers.invalid_parameter_exception_of_yojson tree path)
      | _, "LimitExceededException" ->
          `LimitExceededException (Json_deserializers.limit_exceeded_exception_of_yojson tree path)
      | _, "OperationAbortedException" ->
          `OperationAbortedException
            (Json_deserializers.operation_aborted_exception_of_yojson tree path)
      | _, "ResourceAlreadyExistsException" ->
          `ResourceAlreadyExistsException
            (Json_deserializers.resource_already_exists_exception_of_yojson tree path)
      | _, "ServiceUnavailableException" ->
          `ServiceUnavailableException
            (Json_deserializers.service_unavailable_exception_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : create_log_group_request) =
    let input = Json_serializers.create_log_group_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"Logs_20140328.CreateLogGroup" ~service ~context
      ~input ~output_deserializer:Smaws_Lib.Smithy_api.Json_deserializers.unit__of_yojson
      ~error_deserializer

  let request_with_metadata context (request : create_log_group_request) =
    let input = Json_serializers.create_log_group_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata ~shape_name:"Logs_20140328.CreateLogGroup"
      ~service ~context ~input
      ~output_deserializer:Smaws_Lib.Smithy_api.Json_deserializers.unit__of_yojson
      ~error_deserializer
end

module CreateLogAnomalyDetector = struct
  let error_to_string = function
    | `InvalidParameterException _ -> "com.amazonaws.cloudwatchlogs#InvalidParameterException"
    | `LimitExceededException _ -> "com.amazonaws.cloudwatchlogs#LimitExceededException"
    | `OperationAbortedException _ -> "com.amazonaws.cloudwatchlogs#OperationAbortedException"
    | `ResourceNotFoundException _ -> "com.amazonaws.cloudwatchlogs#ResourceNotFoundException"
    | `ServiceUnavailableException _ -> "com.amazonaws.cloudwatchlogs#ServiceUnavailableException"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "InvalidParameterException" ->
          `InvalidParameterException
            (Json_deserializers.invalid_parameter_exception_of_yojson tree path)
      | _, "LimitExceededException" ->
          `LimitExceededException (Json_deserializers.limit_exceeded_exception_of_yojson tree path)
      | _, "OperationAbortedException" ->
          `OperationAbortedException
            (Json_deserializers.operation_aborted_exception_of_yojson tree path)
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

  let request context (request : create_log_anomaly_detector_request) =
    let input = Json_serializers.create_log_anomaly_detector_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"Logs_20140328.CreateLogAnomalyDetector"
      ~service ~context ~input
      ~output_deserializer:Json_deserializers.create_log_anomaly_detector_response_of_yojson
      ~error_deserializer

  let request_with_metadata context (request : create_log_anomaly_detector_request) =
    let input = Json_serializers.create_log_anomaly_detector_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata
      ~shape_name:"Logs_20140328.CreateLogAnomalyDetector" ~service ~context ~input
      ~output_deserializer:Json_deserializers.create_log_anomaly_detector_response_of_yojson
      ~error_deserializer
end

module CreateImportTask = struct
  let error_to_string = function
    | `AccessDeniedException _ -> "com.amazonaws.cloudwatchlogs#AccessDeniedException"
    | `ConflictException _ -> "com.amazonaws.cloudwatchlogs#ConflictException"
    | `InvalidOperationException _ -> "com.amazonaws.cloudwatchlogs#InvalidOperationException"
    | `InvalidParameterException _ -> "com.amazonaws.cloudwatchlogs#InvalidParameterException"
    | `ResourceNotFoundException _ -> "com.amazonaws.cloudwatchlogs#ResourceNotFoundException"
    | `ThrottlingException _ -> "com.amazonaws.cloudwatchlogs#ThrottlingException"
    | `ValidationException _ -> "com.amazonaws.cloudwatchlogs#ValidationException"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "AccessDeniedException" ->
          `AccessDeniedException (Json_deserializers.access_denied_exception_of_yojson tree path)
      | _, "ConflictException" ->
          `ConflictException (Json_deserializers.conflict_exception_of_yojson tree path)
      | _, "InvalidOperationException" ->
          `InvalidOperationException
            (Json_deserializers.invalid_operation_exception_of_yojson tree path)
      | _, "InvalidParameterException" ->
          `InvalidParameterException
            (Json_deserializers.invalid_parameter_exception_of_yojson tree path)
      | _, "ResourceNotFoundException" ->
          `ResourceNotFoundException
            (Json_deserializers.resource_not_found_exception_of_yojson tree path)
      | _, "ThrottlingException" ->
          `ThrottlingException (Json_deserializers.throttling_exception_of_yojson tree path)
      | _, "ValidationException" ->
          `ValidationException (Json_deserializers.validation_exception_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : create_import_task_request) =
    let input = Json_serializers.create_import_task_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"Logs_20140328.CreateImportTask" ~service
      ~context ~input ~output_deserializer:Json_deserializers.create_import_task_response_of_yojson
      ~error_deserializer

  let request_with_metadata context (request : create_import_task_request) =
    let input = Json_serializers.create_import_task_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata ~shape_name:"Logs_20140328.CreateImportTask"
      ~service ~context ~input
      ~output_deserializer:Json_deserializers.create_import_task_response_of_yojson
      ~error_deserializer
end

module CreateExportTask = struct
  let error_to_string = function
    | `InvalidParameterException _ -> "com.amazonaws.cloudwatchlogs#InvalidParameterException"
    | `LimitExceededException _ -> "com.amazonaws.cloudwatchlogs#LimitExceededException"
    | `OperationAbortedException _ -> "com.amazonaws.cloudwatchlogs#OperationAbortedException"
    | `ResourceAlreadyExistsException _ ->
        "com.amazonaws.cloudwatchlogs#ResourceAlreadyExistsException"
    | `ResourceNotFoundException _ -> "com.amazonaws.cloudwatchlogs#ResourceNotFoundException"
    | `ServiceUnavailableException _ -> "com.amazonaws.cloudwatchlogs#ServiceUnavailableException"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "InvalidParameterException" ->
          `InvalidParameterException
            (Json_deserializers.invalid_parameter_exception_of_yojson tree path)
      | _, "LimitExceededException" ->
          `LimitExceededException (Json_deserializers.limit_exceeded_exception_of_yojson tree path)
      | _, "OperationAbortedException" ->
          `OperationAbortedException
            (Json_deserializers.operation_aborted_exception_of_yojson tree path)
      | _, "ResourceAlreadyExistsException" ->
          `ResourceAlreadyExistsException
            (Json_deserializers.resource_already_exists_exception_of_yojson tree path)
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

  let request context (request : create_export_task_request) =
    let input = Json_serializers.create_export_task_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"Logs_20140328.CreateExportTask" ~service
      ~context ~input ~output_deserializer:Json_deserializers.create_export_task_response_of_yojson
      ~error_deserializer

  let request_with_metadata context (request : create_export_task_request) =
    let input = Json_serializers.create_export_task_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata ~shape_name:"Logs_20140328.CreateExportTask"
      ~service ~context ~input
      ~output_deserializer:Json_deserializers.create_export_task_response_of_yojson
      ~error_deserializer
end

module CreateDelivery = struct
  let error_to_string = function
    | `AccessDeniedException _ -> "com.amazonaws.cloudwatchlogs#AccessDeniedException"
    | `ConflictException _ -> "com.amazonaws.cloudwatchlogs#ConflictException"
    | `ResourceNotFoundException _ -> "com.amazonaws.cloudwatchlogs#ResourceNotFoundException"
    | `ServiceQuotaExceededException _ ->
        "com.amazonaws.cloudwatchlogs#ServiceQuotaExceededException"
    | `ServiceUnavailableException _ -> "com.amazonaws.cloudwatchlogs#ServiceUnavailableException"
    | `ThrottlingException _ -> "com.amazonaws.cloudwatchlogs#ThrottlingException"
    | `ValidationException _ -> "com.amazonaws.cloudwatchlogs#ValidationException"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "AccessDeniedException" ->
          `AccessDeniedException (Json_deserializers.access_denied_exception_of_yojson tree path)
      | _, "ConflictException" ->
          `ConflictException (Json_deserializers.conflict_exception_of_yojson tree path)
      | _, "ResourceNotFoundException" ->
          `ResourceNotFoundException
            (Json_deserializers.resource_not_found_exception_of_yojson tree path)
      | _, "ServiceQuotaExceededException" ->
          `ServiceQuotaExceededException
            (Json_deserializers.service_quota_exceeded_exception_of_yojson tree path)
      | _, "ServiceUnavailableException" ->
          `ServiceUnavailableException
            (Json_deserializers.service_unavailable_exception_of_yojson tree path)
      | _, "ThrottlingException" ->
          `ThrottlingException (Json_deserializers.throttling_exception_of_yojson tree path)
      | _, "ValidationException" ->
          `ValidationException (Json_deserializers.validation_exception_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : create_delivery_request) =
    let input = Json_serializers.create_delivery_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"Logs_20140328.CreateDelivery" ~service ~context
      ~input ~output_deserializer:Json_deserializers.create_delivery_response_of_yojson
      ~error_deserializer

  let request_with_metadata context (request : create_delivery_request) =
    let input = Json_serializers.create_delivery_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata ~shape_name:"Logs_20140328.CreateDelivery"
      ~service ~context ~input
      ~output_deserializer:Json_deserializers.create_delivery_response_of_yojson ~error_deserializer
end

module CancelImportTask = struct
  let error_to_string = function
    | `AccessDeniedException _ -> "com.amazonaws.cloudwatchlogs#AccessDeniedException"
    | `InvalidOperationException _ -> "com.amazonaws.cloudwatchlogs#InvalidOperationException"
    | `InvalidParameterException _ -> "com.amazonaws.cloudwatchlogs#InvalidParameterException"
    | `ResourceNotFoundException _ -> "com.amazonaws.cloudwatchlogs#ResourceNotFoundException"
    | `ThrottlingException _ -> "com.amazonaws.cloudwatchlogs#ThrottlingException"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "AccessDeniedException" ->
          `AccessDeniedException (Json_deserializers.access_denied_exception_of_yojson tree path)
      | _, "InvalidOperationException" ->
          `InvalidOperationException
            (Json_deserializers.invalid_operation_exception_of_yojson tree path)
      | _, "InvalidParameterException" ->
          `InvalidParameterException
            (Json_deserializers.invalid_parameter_exception_of_yojson tree path)
      | _, "ResourceNotFoundException" ->
          `ResourceNotFoundException
            (Json_deserializers.resource_not_found_exception_of_yojson tree path)
      | _, "ThrottlingException" ->
          `ThrottlingException (Json_deserializers.throttling_exception_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : cancel_import_task_request) =
    let input = Json_serializers.cancel_import_task_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"Logs_20140328.CancelImportTask" ~service
      ~context ~input ~output_deserializer:Json_deserializers.cancel_import_task_response_of_yojson
      ~error_deserializer

  let request_with_metadata context (request : cancel_import_task_request) =
    let input = Json_serializers.cancel_import_task_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata ~shape_name:"Logs_20140328.CancelImportTask"
      ~service ~context ~input
      ~output_deserializer:Json_deserializers.cancel_import_task_response_of_yojson
      ~error_deserializer
end

module CancelExportTask = struct
  let error_to_string = function
    | `InvalidOperationException _ -> "com.amazonaws.cloudwatchlogs#InvalidOperationException"
    | `InvalidParameterException _ -> "com.amazonaws.cloudwatchlogs#InvalidParameterException"
    | `ResourceNotFoundException _ -> "com.amazonaws.cloudwatchlogs#ResourceNotFoundException"
    | `ServiceUnavailableException _ -> "com.amazonaws.cloudwatchlogs#ServiceUnavailableException"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "InvalidOperationException" ->
          `InvalidOperationException
            (Json_deserializers.invalid_operation_exception_of_yojson tree path)
      | _, "InvalidParameterException" ->
          `InvalidParameterException
            (Json_deserializers.invalid_parameter_exception_of_yojson tree path)
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

  let request context (request : cancel_export_task_request) =
    let input = Json_serializers.cancel_export_task_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"Logs_20140328.CancelExportTask" ~service
      ~context ~input ~output_deserializer:Smaws_Lib.Smithy_api.Json_deserializers.unit__of_yojson
      ~error_deserializer

  let request_with_metadata context (request : cancel_export_task_request) =
    let input = Json_serializers.cancel_export_task_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata ~shape_name:"Logs_20140328.CancelExportTask"
      ~service ~context ~input
      ~output_deserializer:Smaws_Lib.Smithy_api.Json_deserializers.unit__of_yojson
      ~error_deserializer
end

module AssociateSourceToS3TableIntegration = struct
  let error_to_string = function
    | `AccessDeniedException _ -> "com.amazonaws.cloudwatchlogs#AccessDeniedException"
    | `InternalServerException _ -> "com.amazonaws.cloudwatchlogs#InternalServerException"
    | `ResourceNotFoundException _ -> "com.amazonaws.cloudwatchlogs#ResourceNotFoundException"
    | `ThrottlingException _ -> "com.amazonaws.cloudwatchlogs#ThrottlingException"
    | `ValidationException _ -> "com.amazonaws.cloudwatchlogs#ValidationException"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "AccessDeniedException" ->
          `AccessDeniedException (Json_deserializers.access_denied_exception_of_yojson tree path)
      | _, "InternalServerException" ->
          `InternalServerException
            (Json_deserializers.internal_server_exception_of_yojson tree path)
      | _, "ResourceNotFoundException" ->
          `ResourceNotFoundException
            (Json_deserializers.resource_not_found_exception_of_yojson tree path)
      | _, "ThrottlingException" ->
          `ThrottlingException (Json_deserializers.throttling_exception_of_yojson tree path)
      | _, "ValidationException" ->
          `ValidationException (Json_deserializers.validation_exception_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : associate_source_to_s3_table_integration_request) =
    let input =
      Json_serializers.associate_source_to_s3_table_integration_request_to_yojson request
    in
    Smaws_Lib.Protocols.AwsJson.request
      ~shape_name:"Logs_20140328.AssociateSourceToS3TableIntegration" ~service ~context ~input
      ~output_deserializer:
        Json_deserializers.associate_source_to_s3_table_integration_response_of_yojson
      ~error_deserializer

  let request_with_metadata context (request : associate_source_to_s3_table_integration_request) =
    let input =
      Json_serializers.associate_source_to_s3_table_integration_request_to_yojson request
    in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata
      ~shape_name:"Logs_20140328.AssociateSourceToS3TableIntegration" ~service ~context ~input
      ~output_deserializer:
        Json_deserializers.associate_source_to_s3_table_integration_response_of_yojson
      ~error_deserializer
end

module AssociateKmsKey = struct
  let error_to_string = function
    | `InvalidParameterException _ -> "com.amazonaws.cloudwatchlogs#InvalidParameterException"
    | `OperationAbortedException _ -> "com.amazonaws.cloudwatchlogs#OperationAbortedException"
    | `ResourceNotFoundException _ -> "com.amazonaws.cloudwatchlogs#ResourceNotFoundException"
    | `ServiceUnavailableException _ -> "com.amazonaws.cloudwatchlogs#ServiceUnavailableException"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "InvalidParameterException" ->
          `InvalidParameterException
            (Json_deserializers.invalid_parameter_exception_of_yojson tree path)
      | _, "OperationAbortedException" ->
          `OperationAbortedException
            (Json_deserializers.operation_aborted_exception_of_yojson tree path)
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

  let request context (request : associate_kms_key_request) =
    let input = Json_serializers.associate_kms_key_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"Logs_20140328.AssociateKmsKey" ~service
      ~context ~input ~output_deserializer:Smaws_Lib.Smithy_api.Json_deserializers.unit__of_yojson
      ~error_deserializer

  let request_with_metadata context (request : associate_kms_key_request) =
    let input = Json_serializers.associate_kms_key_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata ~shape_name:"Logs_20140328.AssociateKmsKey"
      ~service ~context ~input
      ~output_deserializer:Smaws_Lib.Smithy_api.Json_deserializers.unit__of_yojson
      ~error_deserializer
end
