open Types
open Service_metadata

module ActivateEventSource = struct
  let error_to_string = function
    | `ConcurrentModificationException _ ->
        "com.amazonaws.eventbridge#ConcurrentModificationException"
    | `InternalException _ -> "com.amazonaws.eventbridge#InternalException"
    | `InvalidStateException _ -> "com.amazonaws.eventbridge#InvalidStateException"
    | `OperationDisabledException _ -> "com.amazonaws.eventbridge#OperationDisabledException"
    | `ResourceNotFoundException _ -> "com.amazonaws.eventbridge#ResourceNotFoundException"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "ConcurrentModificationException" ->
          `ConcurrentModificationException
            (Json_deserializers.concurrent_modification_exception_of_yojson tree path)
      | _, "InternalException" ->
          `InternalException (Json_deserializers.internal_exception_of_yojson tree path)
      | _, "InvalidStateException" ->
          `InvalidStateException (Json_deserializers.invalid_state_exception_of_yojson tree path)
      | _, "OperationDisabledException" ->
          `OperationDisabledException
            (Json_deserializers.operation_disabled_exception_of_yojson tree path)
      | _, "ResourceNotFoundException" ->
          `ResourceNotFoundException
            (Json_deserializers.resource_not_found_exception_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : activate_event_source_request) =
    let input = Json_serializers.activate_event_source_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"AWSEvents.ActivateEventSource" ~service
      ~context ~input ~output_deserializer:Smaws_Lib.Smithy_api.Json_deserializers.unit__of_yojson
      ~error_deserializer
end

module CancelReplay = struct
  let error_to_string = function
    | `ConcurrentModificationException _ ->
        "com.amazonaws.eventbridge#ConcurrentModificationException"
    | `IllegalStatusException _ -> "com.amazonaws.eventbridge#IllegalStatusException"
    | `InternalException _ -> "com.amazonaws.eventbridge#InternalException"
    | `ResourceNotFoundException _ -> "com.amazonaws.eventbridge#ResourceNotFoundException"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "ConcurrentModificationException" ->
          `ConcurrentModificationException
            (Json_deserializers.concurrent_modification_exception_of_yojson tree path)
      | _, "IllegalStatusException" ->
          `IllegalStatusException (Json_deserializers.illegal_status_exception_of_yojson tree path)
      | _, "InternalException" ->
          `InternalException (Json_deserializers.internal_exception_of_yojson tree path)
      | _, "ResourceNotFoundException" ->
          `ResourceNotFoundException
            (Json_deserializers.resource_not_found_exception_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : cancel_replay_request) =
    let input = Json_serializers.cancel_replay_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"AWSEvents.CancelReplay" ~service ~context
      ~input ~output_deserializer:Json_deserializers.cancel_replay_response_of_yojson
      ~error_deserializer
end

module CreateApiDestination = struct
  let error_to_string = function
    | `InternalException _ -> "com.amazonaws.eventbridge#InternalException"
    | `LimitExceededException _ -> "com.amazonaws.eventbridge#LimitExceededException"
    | `ResourceAlreadyExistsException _ ->
        "com.amazonaws.eventbridge#ResourceAlreadyExistsException"
    | `ResourceNotFoundException _ -> "com.amazonaws.eventbridge#ResourceNotFoundException"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "InternalException" ->
          `InternalException (Json_deserializers.internal_exception_of_yojson tree path)
      | _, "LimitExceededException" ->
          `LimitExceededException (Json_deserializers.limit_exceeded_exception_of_yojson tree path)
      | _, "ResourceAlreadyExistsException" ->
          `ResourceAlreadyExistsException
            (Json_deserializers.resource_already_exists_exception_of_yojson tree path)
      | _, "ResourceNotFoundException" ->
          `ResourceNotFoundException
            (Json_deserializers.resource_not_found_exception_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : create_api_destination_request) =
    let input = Json_serializers.create_api_destination_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"AWSEvents.CreateApiDestination" ~service
      ~context ~input
      ~output_deserializer:Json_deserializers.create_api_destination_response_of_yojson
      ~error_deserializer
end

module CreateArchive = struct
  let error_to_string = function
    | `ConcurrentModificationException _ ->
        "com.amazonaws.eventbridge#ConcurrentModificationException"
    | `InternalException _ -> "com.amazonaws.eventbridge#InternalException"
    | `InvalidEventPatternException _ -> "com.amazonaws.eventbridge#InvalidEventPatternException"
    | `LimitExceededException _ -> "com.amazonaws.eventbridge#LimitExceededException"
    | `ResourceAlreadyExistsException _ ->
        "com.amazonaws.eventbridge#ResourceAlreadyExistsException"
    | `ResourceNotFoundException _ -> "com.amazonaws.eventbridge#ResourceNotFoundException"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "ConcurrentModificationException" ->
          `ConcurrentModificationException
            (Json_deserializers.concurrent_modification_exception_of_yojson tree path)
      | _, "InternalException" ->
          `InternalException (Json_deserializers.internal_exception_of_yojson tree path)
      | _, "InvalidEventPatternException" ->
          `InvalidEventPatternException
            (Json_deserializers.invalid_event_pattern_exception_of_yojson tree path)
      | _, "LimitExceededException" ->
          `LimitExceededException (Json_deserializers.limit_exceeded_exception_of_yojson tree path)
      | _, "ResourceAlreadyExistsException" ->
          `ResourceAlreadyExistsException
            (Json_deserializers.resource_already_exists_exception_of_yojson tree path)
      | _, "ResourceNotFoundException" ->
          `ResourceNotFoundException
            (Json_deserializers.resource_not_found_exception_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : create_archive_request) =
    let input = Json_serializers.create_archive_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"AWSEvents.CreateArchive" ~service ~context
      ~input ~output_deserializer:Json_deserializers.create_archive_response_of_yojson
      ~error_deserializer
end

module CreateConnection = struct
  let error_to_string = function
    | `AccessDeniedException _ -> "com.amazonaws.eventbridge#AccessDeniedException"
    | `InternalException _ -> "com.amazonaws.eventbridge#InternalException"
    | `LimitExceededException _ -> "com.amazonaws.eventbridge#LimitExceededException"
    | `ResourceAlreadyExistsException _ ->
        "com.amazonaws.eventbridge#ResourceAlreadyExistsException"
    | `ResourceNotFoundException _ -> "com.amazonaws.eventbridge#ResourceNotFoundException"
    | `ThrottlingException _ -> "com.amazonaws.eventbridge#ThrottlingException"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "AccessDeniedException" ->
          `AccessDeniedException (Json_deserializers.access_denied_exception_of_yojson tree path)
      | _, "InternalException" ->
          `InternalException (Json_deserializers.internal_exception_of_yojson tree path)
      | _, "LimitExceededException" ->
          `LimitExceededException (Json_deserializers.limit_exceeded_exception_of_yojson tree path)
      | _, "ResourceAlreadyExistsException" ->
          `ResourceAlreadyExistsException
            (Json_deserializers.resource_already_exists_exception_of_yojson tree path)
      | _, "ResourceNotFoundException" ->
          `ResourceNotFoundException
            (Json_deserializers.resource_not_found_exception_of_yojson tree path)
      | _, "ThrottlingException" ->
          `ThrottlingException (Json_deserializers.throttling_exception_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : create_connection_request) =
    let input = Json_serializers.create_connection_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"AWSEvents.CreateConnection" ~service ~context
      ~input ~output_deserializer:Json_deserializers.create_connection_response_of_yojson
      ~error_deserializer
end

module CreateEndpoint = struct
  let error_to_string = function
    | `InternalException _ -> "com.amazonaws.eventbridge#InternalException"
    | `LimitExceededException _ -> "com.amazonaws.eventbridge#LimitExceededException"
    | `ResourceAlreadyExistsException _ ->
        "com.amazonaws.eventbridge#ResourceAlreadyExistsException"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "InternalException" ->
          `InternalException (Json_deserializers.internal_exception_of_yojson tree path)
      | _, "LimitExceededException" ->
          `LimitExceededException (Json_deserializers.limit_exceeded_exception_of_yojson tree path)
      | _, "ResourceAlreadyExistsException" ->
          `ResourceAlreadyExistsException
            (Json_deserializers.resource_already_exists_exception_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : create_endpoint_request) =
    let input = Json_serializers.create_endpoint_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"AWSEvents.CreateEndpoint" ~service ~context
      ~input ~output_deserializer:Json_deserializers.create_endpoint_response_of_yojson
      ~error_deserializer
end

module CreateEventBus = struct
  let error_to_string = function
    | `ConcurrentModificationException _ ->
        "com.amazonaws.eventbridge#ConcurrentModificationException"
    | `InternalException _ -> "com.amazonaws.eventbridge#InternalException"
    | `InvalidStateException _ -> "com.amazonaws.eventbridge#InvalidStateException"
    | `LimitExceededException _ -> "com.amazonaws.eventbridge#LimitExceededException"
    | `OperationDisabledException _ -> "com.amazonaws.eventbridge#OperationDisabledException"
    | `ResourceAlreadyExistsException _ ->
        "com.amazonaws.eventbridge#ResourceAlreadyExistsException"
    | `ResourceNotFoundException _ -> "com.amazonaws.eventbridge#ResourceNotFoundException"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "ConcurrentModificationException" ->
          `ConcurrentModificationException
            (Json_deserializers.concurrent_modification_exception_of_yojson tree path)
      | _, "InternalException" ->
          `InternalException (Json_deserializers.internal_exception_of_yojson tree path)
      | _, "InvalidStateException" ->
          `InvalidStateException (Json_deserializers.invalid_state_exception_of_yojson tree path)
      | _, "LimitExceededException" ->
          `LimitExceededException (Json_deserializers.limit_exceeded_exception_of_yojson tree path)
      | _, "OperationDisabledException" ->
          `OperationDisabledException
            (Json_deserializers.operation_disabled_exception_of_yojson tree path)
      | _, "ResourceAlreadyExistsException" ->
          `ResourceAlreadyExistsException
            (Json_deserializers.resource_already_exists_exception_of_yojson tree path)
      | _, "ResourceNotFoundException" ->
          `ResourceNotFoundException
            (Json_deserializers.resource_not_found_exception_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : create_event_bus_request) =
    let input = Json_serializers.create_event_bus_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"AWSEvents.CreateEventBus" ~service ~context
      ~input ~output_deserializer:Json_deserializers.create_event_bus_response_of_yojson
      ~error_deserializer
end

module CreatePartnerEventSource = struct
  let error_to_string = function
    | `ConcurrentModificationException _ ->
        "com.amazonaws.eventbridge#ConcurrentModificationException"
    | `InternalException _ -> "com.amazonaws.eventbridge#InternalException"
    | `LimitExceededException _ -> "com.amazonaws.eventbridge#LimitExceededException"
    | `OperationDisabledException _ -> "com.amazonaws.eventbridge#OperationDisabledException"
    | `ResourceAlreadyExistsException _ ->
        "com.amazonaws.eventbridge#ResourceAlreadyExistsException"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "ConcurrentModificationException" ->
          `ConcurrentModificationException
            (Json_deserializers.concurrent_modification_exception_of_yojson tree path)
      | _, "InternalException" ->
          `InternalException (Json_deserializers.internal_exception_of_yojson tree path)
      | _, "LimitExceededException" ->
          `LimitExceededException (Json_deserializers.limit_exceeded_exception_of_yojson tree path)
      | _, "OperationDisabledException" ->
          `OperationDisabledException
            (Json_deserializers.operation_disabled_exception_of_yojson tree path)
      | _, "ResourceAlreadyExistsException" ->
          `ResourceAlreadyExistsException
            (Json_deserializers.resource_already_exists_exception_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : create_partner_event_source_request) =
    let input = Json_serializers.create_partner_event_source_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"AWSEvents.CreatePartnerEventSource" ~service
      ~context ~input
      ~output_deserializer:Json_deserializers.create_partner_event_source_response_of_yojson
      ~error_deserializer
end

module DeactivateEventSource = struct
  let error_to_string = function
    | `ConcurrentModificationException _ ->
        "com.amazonaws.eventbridge#ConcurrentModificationException"
    | `InternalException _ -> "com.amazonaws.eventbridge#InternalException"
    | `InvalidStateException _ -> "com.amazonaws.eventbridge#InvalidStateException"
    | `OperationDisabledException _ -> "com.amazonaws.eventbridge#OperationDisabledException"
    | `ResourceNotFoundException _ -> "com.amazonaws.eventbridge#ResourceNotFoundException"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "ConcurrentModificationException" ->
          `ConcurrentModificationException
            (Json_deserializers.concurrent_modification_exception_of_yojson tree path)
      | _, "InternalException" ->
          `InternalException (Json_deserializers.internal_exception_of_yojson tree path)
      | _, "InvalidStateException" ->
          `InvalidStateException (Json_deserializers.invalid_state_exception_of_yojson tree path)
      | _, "OperationDisabledException" ->
          `OperationDisabledException
            (Json_deserializers.operation_disabled_exception_of_yojson tree path)
      | _, "ResourceNotFoundException" ->
          `ResourceNotFoundException
            (Json_deserializers.resource_not_found_exception_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : deactivate_event_source_request) =
    let input = Json_serializers.deactivate_event_source_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"AWSEvents.DeactivateEventSource" ~service
      ~context ~input ~output_deserializer:Smaws_Lib.Smithy_api.Json_deserializers.unit__of_yojson
      ~error_deserializer
end

module DeauthorizeConnection = struct
  let error_to_string = function
    | `ConcurrentModificationException _ ->
        "com.amazonaws.eventbridge#ConcurrentModificationException"
    | `InternalException _ -> "com.amazonaws.eventbridge#InternalException"
    | `ResourceNotFoundException _ -> "com.amazonaws.eventbridge#ResourceNotFoundException"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "ConcurrentModificationException" ->
          `ConcurrentModificationException
            (Json_deserializers.concurrent_modification_exception_of_yojson tree path)
      | _, "InternalException" ->
          `InternalException (Json_deserializers.internal_exception_of_yojson tree path)
      | _, "ResourceNotFoundException" ->
          `ResourceNotFoundException
            (Json_deserializers.resource_not_found_exception_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : deauthorize_connection_request) =
    let input = Json_serializers.deauthorize_connection_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"AWSEvents.DeauthorizeConnection" ~service
      ~context ~input
      ~output_deserializer:Json_deserializers.deauthorize_connection_response_of_yojson
      ~error_deserializer
end

module DeleteApiDestination = struct
  let error_to_string = function
    | `ConcurrentModificationException _ ->
        "com.amazonaws.eventbridge#ConcurrentModificationException"
    | `InternalException _ -> "com.amazonaws.eventbridge#InternalException"
    | `ResourceNotFoundException _ -> "com.amazonaws.eventbridge#ResourceNotFoundException"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "ConcurrentModificationException" ->
          `ConcurrentModificationException
            (Json_deserializers.concurrent_modification_exception_of_yojson tree path)
      | _, "InternalException" ->
          `InternalException (Json_deserializers.internal_exception_of_yojson tree path)
      | _, "ResourceNotFoundException" ->
          `ResourceNotFoundException
            (Json_deserializers.resource_not_found_exception_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : delete_api_destination_request) =
    let input = Json_serializers.delete_api_destination_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"AWSEvents.DeleteApiDestination" ~service
      ~context ~input
      ~output_deserializer:Json_deserializers.delete_api_destination_response_of_yojson
      ~error_deserializer
end

module DeleteArchive = struct
  let error_to_string = function
    | `ConcurrentModificationException _ ->
        "com.amazonaws.eventbridge#ConcurrentModificationException"
    | `InternalException _ -> "com.amazonaws.eventbridge#InternalException"
    | `ResourceNotFoundException _ -> "com.amazonaws.eventbridge#ResourceNotFoundException"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "ConcurrentModificationException" ->
          `ConcurrentModificationException
            (Json_deserializers.concurrent_modification_exception_of_yojson tree path)
      | _, "InternalException" ->
          `InternalException (Json_deserializers.internal_exception_of_yojson tree path)
      | _, "ResourceNotFoundException" ->
          `ResourceNotFoundException
            (Json_deserializers.resource_not_found_exception_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : delete_archive_request) =
    let input = Json_serializers.delete_archive_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"AWSEvents.DeleteArchive" ~service ~context
      ~input ~output_deserializer:Json_deserializers.delete_archive_response_of_yojson
      ~error_deserializer
end

module DeleteConnection = struct
  let error_to_string = function
    | `ConcurrentModificationException _ ->
        "com.amazonaws.eventbridge#ConcurrentModificationException"
    | `InternalException _ -> "com.amazonaws.eventbridge#InternalException"
    | `ResourceNotFoundException _ -> "com.amazonaws.eventbridge#ResourceNotFoundException"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "ConcurrentModificationException" ->
          `ConcurrentModificationException
            (Json_deserializers.concurrent_modification_exception_of_yojson tree path)
      | _, "InternalException" ->
          `InternalException (Json_deserializers.internal_exception_of_yojson tree path)
      | _, "ResourceNotFoundException" ->
          `ResourceNotFoundException
            (Json_deserializers.resource_not_found_exception_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : delete_connection_request) =
    let input = Json_serializers.delete_connection_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"AWSEvents.DeleteConnection" ~service ~context
      ~input ~output_deserializer:Json_deserializers.delete_connection_response_of_yojson
      ~error_deserializer
end

module DeleteEndpoint = struct
  let error_to_string = function
    | `ConcurrentModificationException _ ->
        "com.amazonaws.eventbridge#ConcurrentModificationException"
    | `InternalException _ -> "com.amazonaws.eventbridge#InternalException"
    | `ResourceNotFoundException _ -> "com.amazonaws.eventbridge#ResourceNotFoundException"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "ConcurrentModificationException" ->
          `ConcurrentModificationException
            (Json_deserializers.concurrent_modification_exception_of_yojson tree path)
      | _, "InternalException" ->
          `InternalException (Json_deserializers.internal_exception_of_yojson tree path)
      | _, "ResourceNotFoundException" ->
          `ResourceNotFoundException
            (Json_deserializers.resource_not_found_exception_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : delete_endpoint_request) =
    let input = Json_serializers.delete_endpoint_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"AWSEvents.DeleteEndpoint" ~service ~context
      ~input ~output_deserializer:Json_deserializers.delete_endpoint_response_of_yojson
      ~error_deserializer
end

module DeleteEventBus = struct
  let error_to_string = function
    | `ConcurrentModificationException _ ->
        "com.amazonaws.eventbridge#ConcurrentModificationException"
    | `InternalException _ -> "com.amazonaws.eventbridge#InternalException"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "ConcurrentModificationException" ->
          `ConcurrentModificationException
            (Json_deserializers.concurrent_modification_exception_of_yojson tree path)
      | _, "InternalException" ->
          `InternalException (Json_deserializers.internal_exception_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : delete_event_bus_request) =
    let input = Json_serializers.delete_event_bus_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"AWSEvents.DeleteEventBus" ~service ~context
      ~input ~output_deserializer:Smaws_Lib.Smithy_api.Json_deserializers.unit__of_yojson
      ~error_deserializer
end

module DeletePartnerEventSource = struct
  let error_to_string = function
    | `ConcurrentModificationException _ ->
        "com.amazonaws.eventbridge#ConcurrentModificationException"
    | `InternalException _ -> "com.amazonaws.eventbridge#InternalException"
    | `OperationDisabledException _ -> "com.amazonaws.eventbridge#OperationDisabledException"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "ConcurrentModificationException" ->
          `ConcurrentModificationException
            (Json_deserializers.concurrent_modification_exception_of_yojson tree path)
      | _, "InternalException" ->
          `InternalException (Json_deserializers.internal_exception_of_yojson tree path)
      | _, "OperationDisabledException" ->
          `OperationDisabledException
            (Json_deserializers.operation_disabled_exception_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : delete_partner_event_source_request) =
    let input = Json_serializers.delete_partner_event_source_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"AWSEvents.DeletePartnerEventSource" ~service
      ~context ~input ~output_deserializer:Smaws_Lib.Smithy_api.Json_deserializers.unit__of_yojson
      ~error_deserializer
end

module DeleteRule = struct
  let error_to_string = function
    | `ConcurrentModificationException _ ->
        "com.amazonaws.eventbridge#ConcurrentModificationException"
    | `InternalException _ -> "com.amazonaws.eventbridge#InternalException"
    | `ManagedRuleException _ -> "com.amazonaws.eventbridge#ManagedRuleException"
    | `ResourceNotFoundException _ -> "com.amazonaws.eventbridge#ResourceNotFoundException"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "ConcurrentModificationException" ->
          `ConcurrentModificationException
            (Json_deserializers.concurrent_modification_exception_of_yojson tree path)
      | _, "InternalException" ->
          `InternalException (Json_deserializers.internal_exception_of_yojson tree path)
      | _, "ManagedRuleException" ->
          `ManagedRuleException (Json_deserializers.managed_rule_exception_of_yojson tree path)
      | _, "ResourceNotFoundException" ->
          `ResourceNotFoundException
            (Json_deserializers.resource_not_found_exception_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : delete_rule_request) =
    let input = Json_serializers.delete_rule_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"AWSEvents.DeleteRule" ~service ~context ~input
      ~output_deserializer:Smaws_Lib.Smithy_api.Json_deserializers.unit__of_yojson
      ~error_deserializer
end

module DescribeApiDestination = struct
  let error_to_string = function
    | `InternalException _ -> "com.amazonaws.eventbridge#InternalException"
    | `ResourceNotFoundException _ -> "com.amazonaws.eventbridge#ResourceNotFoundException"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "InternalException" ->
          `InternalException (Json_deserializers.internal_exception_of_yojson tree path)
      | _, "ResourceNotFoundException" ->
          `ResourceNotFoundException
            (Json_deserializers.resource_not_found_exception_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : describe_api_destination_request) =
    let input = Json_serializers.describe_api_destination_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"AWSEvents.DescribeApiDestination" ~service
      ~context ~input
      ~output_deserializer:Json_deserializers.describe_api_destination_response_of_yojson
      ~error_deserializer
end

module DescribeArchive = struct
  let error_to_string = function
    | `InternalException _ -> "com.amazonaws.eventbridge#InternalException"
    | `ResourceAlreadyExistsException _ ->
        "com.amazonaws.eventbridge#ResourceAlreadyExistsException"
    | `ResourceNotFoundException _ -> "com.amazonaws.eventbridge#ResourceNotFoundException"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "InternalException" ->
          `InternalException (Json_deserializers.internal_exception_of_yojson tree path)
      | _, "ResourceAlreadyExistsException" ->
          `ResourceAlreadyExistsException
            (Json_deserializers.resource_already_exists_exception_of_yojson tree path)
      | _, "ResourceNotFoundException" ->
          `ResourceNotFoundException
            (Json_deserializers.resource_not_found_exception_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : describe_archive_request) =
    let input = Json_serializers.describe_archive_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"AWSEvents.DescribeArchive" ~service ~context
      ~input ~output_deserializer:Json_deserializers.describe_archive_response_of_yojson
      ~error_deserializer
end

module DescribeConnection = struct
  let error_to_string = function
    | `InternalException _ -> "com.amazonaws.eventbridge#InternalException"
    | `ResourceNotFoundException _ -> "com.amazonaws.eventbridge#ResourceNotFoundException"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "InternalException" ->
          `InternalException (Json_deserializers.internal_exception_of_yojson tree path)
      | _, "ResourceNotFoundException" ->
          `ResourceNotFoundException
            (Json_deserializers.resource_not_found_exception_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : describe_connection_request) =
    let input = Json_serializers.describe_connection_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"AWSEvents.DescribeConnection" ~service ~context
      ~input ~output_deserializer:Json_deserializers.describe_connection_response_of_yojson
      ~error_deserializer
end

module DescribeEndpoint = struct
  let error_to_string = function
    | `InternalException _ -> "com.amazonaws.eventbridge#InternalException"
    | `ResourceNotFoundException _ -> "com.amazonaws.eventbridge#ResourceNotFoundException"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "InternalException" ->
          `InternalException (Json_deserializers.internal_exception_of_yojson tree path)
      | _, "ResourceNotFoundException" ->
          `ResourceNotFoundException
            (Json_deserializers.resource_not_found_exception_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : describe_endpoint_request) =
    let input = Json_serializers.describe_endpoint_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"AWSEvents.DescribeEndpoint" ~service ~context
      ~input ~output_deserializer:Json_deserializers.describe_endpoint_response_of_yojson
      ~error_deserializer
end

module DescribeEventBus = struct
  let error_to_string = function
    | `InternalException _ -> "com.amazonaws.eventbridge#InternalException"
    | `ResourceNotFoundException _ -> "com.amazonaws.eventbridge#ResourceNotFoundException"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "InternalException" ->
          `InternalException (Json_deserializers.internal_exception_of_yojson tree path)
      | _, "ResourceNotFoundException" ->
          `ResourceNotFoundException
            (Json_deserializers.resource_not_found_exception_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : describe_event_bus_request) =
    let input = Json_serializers.describe_event_bus_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"AWSEvents.DescribeEventBus" ~service ~context
      ~input ~output_deserializer:Json_deserializers.describe_event_bus_response_of_yojson
      ~error_deserializer
end

module DescribeEventSource = struct
  let error_to_string = function
    | `InternalException _ -> "com.amazonaws.eventbridge#InternalException"
    | `OperationDisabledException _ -> "com.amazonaws.eventbridge#OperationDisabledException"
    | `ResourceNotFoundException _ -> "com.amazonaws.eventbridge#ResourceNotFoundException"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "InternalException" ->
          `InternalException (Json_deserializers.internal_exception_of_yojson tree path)
      | _, "OperationDisabledException" ->
          `OperationDisabledException
            (Json_deserializers.operation_disabled_exception_of_yojson tree path)
      | _, "ResourceNotFoundException" ->
          `ResourceNotFoundException
            (Json_deserializers.resource_not_found_exception_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : describe_event_source_request) =
    let input = Json_serializers.describe_event_source_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"AWSEvents.DescribeEventSource" ~service
      ~context ~input
      ~output_deserializer:Json_deserializers.describe_event_source_response_of_yojson
      ~error_deserializer
end

module DescribePartnerEventSource = struct
  let error_to_string = function
    | `InternalException _ -> "com.amazonaws.eventbridge#InternalException"
    | `OperationDisabledException _ -> "com.amazonaws.eventbridge#OperationDisabledException"
    | `ResourceNotFoundException _ -> "com.amazonaws.eventbridge#ResourceNotFoundException"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "InternalException" ->
          `InternalException (Json_deserializers.internal_exception_of_yojson tree path)
      | _, "OperationDisabledException" ->
          `OperationDisabledException
            (Json_deserializers.operation_disabled_exception_of_yojson tree path)
      | _, "ResourceNotFoundException" ->
          `ResourceNotFoundException
            (Json_deserializers.resource_not_found_exception_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : describe_partner_event_source_request) =
    let input = Json_serializers.describe_partner_event_source_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"AWSEvents.DescribePartnerEventSource" ~service
      ~context ~input
      ~output_deserializer:Json_deserializers.describe_partner_event_source_response_of_yojson
      ~error_deserializer
end

module DescribeReplay = struct
  let error_to_string = function
    | `InternalException _ -> "com.amazonaws.eventbridge#InternalException"
    | `ResourceNotFoundException _ -> "com.amazonaws.eventbridge#ResourceNotFoundException"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "InternalException" ->
          `InternalException (Json_deserializers.internal_exception_of_yojson tree path)
      | _, "ResourceNotFoundException" ->
          `ResourceNotFoundException
            (Json_deserializers.resource_not_found_exception_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : describe_replay_request) =
    let input = Json_serializers.describe_replay_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"AWSEvents.DescribeReplay" ~service ~context
      ~input ~output_deserializer:Json_deserializers.describe_replay_response_of_yojson
      ~error_deserializer
end

module DescribeRule = struct
  let error_to_string = function
    | `InternalException _ -> "com.amazonaws.eventbridge#InternalException"
    | `ResourceNotFoundException _ -> "com.amazonaws.eventbridge#ResourceNotFoundException"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "InternalException" ->
          `InternalException (Json_deserializers.internal_exception_of_yojson tree path)
      | _, "ResourceNotFoundException" ->
          `ResourceNotFoundException
            (Json_deserializers.resource_not_found_exception_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : describe_rule_request) =
    let input = Json_serializers.describe_rule_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"AWSEvents.DescribeRule" ~service ~context
      ~input ~output_deserializer:Json_deserializers.describe_rule_response_of_yojson
      ~error_deserializer
end

module DisableRule = struct
  let error_to_string = function
    | `ConcurrentModificationException _ ->
        "com.amazonaws.eventbridge#ConcurrentModificationException"
    | `InternalException _ -> "com.amazonaws.eventbridge#InternalException"
    | `ManagedRuleException _ -> "com.amazonaws.eventbridge#ManagedRuleException"
    | `ResourceNotFoundException _ -> "com.amazonaws.eventbridge#ResourceNotFoundException"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "ConcurrentModificationException" ->
          `ConcurrentModificationException
            (Json_deserializers.concurrent_modification_exception_of_yojson tree path)
      | _, "InternalException" ->
          `InternalException (Json_deserializers.internal_exception_of_yojson tree path)
      | _, "ManagedRuleException" ->
          `ManagedRuleException (Json_deserializers.managed_rule_exception_of_yojson tree path)
      | _, "ResourceNotFoundException" ->
          `ResourceNotFoundException
            (Json_deserializers.resource_not_found_exception_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : disable_rule_request) =
    let input = Json_serializers.disable_rule_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"AWSEvents.DisableRule" ~service ~context ~input
      ~output_deserializer:Smaws_Lib.Smithy_api.Json_deserializers.unit__of_yojson
      ~error_deserializer
end

module EnableRule = struct
  let error_to_string = function
    | `ConcurrentModificationException _ ->
        "com.amazonaws.eventbridge#ConcurrentModificationException"
    | `InternalException _ -> "com.amazonaws.eventbridge#InternalException"
    | `ManagedRuleException _ -> "com.amazonaws.eventbridge#ManagedRuleException"
    | `ResourceNotFoundException _ -> "com.amazonaws.eventbridge#ResourceNotFoundException"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "ConcurrentModificationException" ->
          `ConcurrentModificationException
            (Json_deserializers.concurrent_modification_exception_of_yojson tree path)
      | _, "InternalException" ->
          `InternalException (Json_deserializers.internal_exception_of_yojson tree path)
      | _, "ManagedRuleException" ->
          `ManagedRuleException (Json_deserializers.managed_rule_exception_of_yojson tree path)
      | _, "ResourceNotFoundException" ->
          `ResourceNotFoundException
            (Json_deserializers.resource_not_found_exception_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : enable_rule_request) =
    let input = Json_serializers.enable_rule_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"AWSEvents.EnableRule" ~service ~context ~input
      ~output_deserializer:Smaws_Lib.Smithy_api.Json_deserializers.unit__of_yojson
      ~error_deserializer
end

module ListApiDestinations = struct
  let error_to_string = function
    | `InternalException _ -> "com.amazonaws.eventbridge#InternalException"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "InternalException" ->
          `InternalException (Json_deserializers.internal_exception_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : list_api_destinations_request) =
    let input = Json_serializers.list_api_destinations_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"AWSEvents.ListApiDestinations" ~service
      ~context ~input
      ~output_deserializer:Json_deserializers.list_api_destinations_response_of_yojson
      ~error_deserializer
end

module ListArchives = struct
  let error_to_string = function
    | `InternalException _ -> "com.amazonaws.eventbridge#InternalException"
    | `ResourceNotFoundException _ -> "com.amazonaws.eventbridge#ResourceNotFoundException"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "InternalException" ->
          `InternalException (Json_deserializers.internal_exception_of_yojson tree path)
      | _, "ResourceNotFoundException" ->
          `ResourceNotFoundException
            (Json_deserializers.resource_not_found_exception_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : list_archives_request) =
    let input = Json_serializers.list_archives_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"AWSEvents.ListArchives" ~service ~context
      ~input ~output_deserializer:Json_deserializers.list_archives_response_of_yojson
      ~error_deserializer
end

module ListConnections = struct
  let error_to_string = function
    | `InternalException _ -> "com.amazonaws.eventbridge#InternalException"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "InternalException" ->
          `InternalException (Json_deserializers.internal_exception_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : list_connections_request) =
    let input = Json_serializers.list_connections_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"AWSEvents.ListConnections" ~service ~context
      ~input ~output_deserializer:Json_deserializers.list_connections_response_of_yojson
      ~error_deserializer
end

module ListEndpoints = struct
  let error_to_string = function
    | `InternalException _ -> "com.amazonaws.eventbridge#InternalException"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "InternalException" ->
          `InternalException (Json_deserializers.internal_exception_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : list_endpoints_request) =
    let input = Json_serializers.list_endpoints_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"AWSEvents.ListEndpoints" ~service ~context
      ~input ~output_deserializer:Json_deserializers.list_endpoints_response_of_yojson
      ~error_deserializer
end

module ListEventBuses = struct
  let error_to_string = function
    | `InternalException _ -> "com.amazonaws.eventbridge#InternalException"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "InternalException" ->
          `InternalException (Json_deserializers.internal_exception_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : list_event_buses_request) =
    let input = Json_serializers.list_event_buses_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"AWSEvents.ListEventBuses" ~service ~context
      ~input ~output_deserializer:Json_deserializers.list_event_buses_response_of_yojson
      ~error_deserializer
end

module ListEventSources = struct
  let error_to_string = function
    | `InternalException _ -> "com.amazonaws.eventbridge#InternalException"
    | `OperationDisabledException _ -> "com.amazonaws.eventbridge#OperationDisabledException"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "InternalException" ->
          `InternalException (Json_deserializers.internal_exception_of_yojson tree path)
      | _, "OperationDisabledException" ->
          `OperationDisabledException
            (Json_deserializers.operation_disabled_exception_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : list_event_sources_request) =
    let input = Json_serializers.list_event_sources_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"AWSEvents.ListEventSources" ~service ~context
      ~input ~output_deserializer:Json_deserializers.list_event_sources_response_of_yojson
      ~error_deserializer
end

module ListPartnerEventSourceAccounts = struct
  let error_to_string = function
    | `InternalException _ -> "com.amazonaws.eventbridge#InternalException"
    | `OperationDisabledException _ -> "com.amazonaws.eventbridge#OperationDisabledException"
    | `ResourceNotFoundException _ -> "com.amazonaws.eventbridge#ResourceNotFoundException"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "InternalException" ->
          `InternalException (Json_deserializers.internal_exception_of_yojson tree path)
      | _, "OperationDisabledException" ->
          `OperationDisabledException
            (Json_deserializers.operation_disabled_exception_of_yojson tree path)
      | _, "ResourceNotFoundException" ->
          `ResourceNotFoundException
            (Json_deserializers.resource_not_found_exception_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : list_partner_event_source_accounts_request) =
    let input = Json_serializers.list_partner_event_source_accounts_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"AWSEvents.ListPartnerEventSourceAccounts"
      ~service ~context ~input
      ~output_deserializer:Json_deserializers.list_partner_event_source_accounts_response_of_yojson
      ~error_deserializer
end

module ListPartnerEventSources = struct
  let error_to_string = function
    | `InternalException _ -> "com.amazonaws.eventbridge#InternalException"
    | `OperationDisabledException _ -> "com.amazonaws.eventbridge#OperationDisabledException"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "InternalException" ->
          `InternalException (Json_deserializers.internal_exception_of_yojson tree path)
      | _, "OperationDisabledException" ->
          `OperationDisabledException
            (Json_deserializers.operation_disabled_exception_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : list_partner_event_sources_request) =
    let input = Json_serializers.list_partner_event_sources_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"AWSEvents.ListPartnerEventSources" ~service
      ~context ~input
      ~output_deserializer:Json_deserializers.list_partner_event_sources_response_of_yojson
      ~error_deserializer
end

module ListReplays = struct
  let error_to_string = function
    | `InternalException _ -> "com.amazonaws.eventbridge#InternalException"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "InternalException" ->
          `InternalException (Json_deserializers.internal_exception_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : list_replays_request) =
    let input = Json_serializers.list_replays_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"AWSEvents.ListReplays" ~service ~context ~input
      ~output_deserializer:Json_deserializers.list_replays_response_of_yojson ~error_deserializer
end

module ListRuleNamesByTarget = struct
  let error_to_string = function
    | `InternalException _ -> "com.amazonaws.eventbridge#InternalException"
    | `ResourceNotFoundException _ -> "com.amazonaws.eventbridge#ResourceNotFoundException"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "InternalException" ->
          `InternalException (Json_deserializers.internal_exception_of_yojson tree path)
      | _, "ResourceNotFoundException" ->
          `ResourceNotFoundException
            (Json_deserializers.resource_not_found_exception_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : list_rule_names_by_target_request) =
    let input = Json_serializers.list_rule_names_by_target_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"AWSEvents.ListRuleNamesByTarget" ~service
      ~context ~input
      ~output_deserializer:Json_deserializers.list_rule_names_by_target_response_of_yojson
      ~error_deserializer
end

module ListRules = struct
  let error_to_string = function
    | `InternalException _ -> "com.amazonaws.eventbridge#InternalException"
    | `ResourceNotFoundException _ -> "com.amazonaws.eventbridge#ResourceNotFoundException"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "InternalException" ->
          `InternalException (Json_deserializers.internal_exception_of_yojson tree path)
      | _, "ResourceNotFoundException" ->
          `ResourceNotFoundException
            (Json_deserializers.resource_not_found_exception_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : list_rules_request) =
    let input = Json_serializers.list_rules_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"AWSEvents.ListRules" ~service ~context ~input
      ~output_deserializer:Json_deserializers.list_rules_response_of_yojson ~error_deserializer
end

module ListTagsForResource = struct
  let error_to_string = function
    | `InternalException _ -> "com.amazonaws.eventbridge#InternalException"
    | `ResourceNotFoundException _ -> "com.amazonaws.eventbridge#ResourceNotFoundException"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "InternalException" ->
          `InternalException (Json_deserializers.internal_exception_of_yojson tree path)
      | _, "ResourceNotFoundException" ->
          `ResourceNotFoundException
            (Json_deserializers.resource_not_found_exception_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : list_tags_for_resource_request) =
    let input = Json_serializers.list_tags_for_resource_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"AWSEvents.ListTagsForResource" ~service
      ~context ~input
      ~output_deserializer:Json_deserializers.list_tags_for_resource_response_of_yojson
      ~error_deserializer
end

module ListTargetsByRule = struct
  let error_to_string = function
    | `InternalException _ -> "com.amazonaws.eventbridge#InternalException"
    | `ResourceNotFoundException _ -> "com.amazonaws.eventbridge#ResourceNotFoundException"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "InternalException" ->
          `InternalException (Json_deserializers.internal_exception_of_yojson tree path)
      | _, "ResourceNotFoundException" ->
          `ResourceNotFoundException
            (Json_deserializers.resource_not_found_exception_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : list_targets_by_rule_request) =
    let input = Json_serializers.list_targets_by_rule_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"AWSEvents.ListTargetsByRule" ~service ~context
      ~input ~output_deserializer:Json_deserializers.list_targets_by_rule_response_of_yojson
      ~error_deserializer
end

module PutEvents = struct
  let error_to_string = function
    | `InternalException _ -> "com.amazonaws.eventbridge#InternalException"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "InternalException" ->
          `InternalException (Json_deserializers.internal_exception_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : put_events_request) =
    let input = Json_serializers.put_events_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"AWSEvents.PutEvents" ~service ~context ~input
      ~output_deserializer:Json_deserializers.put_events_response_of_yojson ~error_deserializer
end

module PutPartnerEvents = struct
  let error_to_string = function
    | `InternalException _ -> "com.amazonaws.eventbridge#InternalException"
    | `OperationDisabledException _ -> "com.amazonaws.eventbridge#OperationDisabledException"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "InternalException" ->
          `InternalException (Json_deserializers.internal_exception_of_yojson tree path)
      | _, "OperationDisabledException" ->
          `OperationDisabledException
            (Json_deserializers.operation_disabled_exception_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : put_partner_events_request) =
    let input = Json_serializers.put_partner_events_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"AWSEvents.PutPartnerEvents" ~service ~context
      ~input ~output_deserializer:Json_deserializers.put_partner_events_response_of_yojson
      ~error_deserializer
end

module PutPermission = struct
  let error_to_string = function
    | `ConcurrentModificationException _ ->
        "com.amazonaws.eventbridge#ConcurrentModificationException"
    | `InternalException _ -> "com.amazonaws.eventbridge#InternalException"
    | `OperationDisabledException _ -> "com.amazonaws.eventbridge#OperationDisabledException"
    | `PolicyLengthExceededException _ -> "com.amazonaws.eventbridge#PolicyLengthExceededException"
    | `ResourceNotFoundException _ -> "com.amazonaws.eventbridge#ResourceNotFoundException"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "ConcurrentModificationException" ->
          `ConcurrentModificationException
            (Json_deserializers.concurrent_modification_exception_of_yojson tree path)
      | _, "InternalException" ->
          `InternalException (Json_deserializers.internal_exception_of_yojson tree path)
      | _, "OperationDisabledException" ->
          `OperationDisabledException
            (Json_deserializers.operation_disabled_exception_of_yojson tree path)
      | _, "PolicyLengthExceededException" ->
          `PolicyLengthExceededException
            (Json_deserializers.policy_length_exceeded_exception_of_yojson tree path)
      | _, "ResourceNotFoundException" ->
          `ResourceNotFoundException
            (Json_deserializers.resource_not_found_exception_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : put_permission_request) =
    let input = Json_serializers.put_permission_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"AWSEvents.PutPermission" ~service ~context
      ~input ~output_deserializer:Smaws_Lib.Smithy_api.Json_deserializers.unit__of_yojson
      ~error_deserializer
end

module PutRule = struct
  let error_to_string = function
    | `ConcurrentModificationException _ ->
        "com.amazonaws.eventbridge#ConcurrentModificationException"
    | `InternalException _ -> "com.amazonaws.eventbridge#InternalException"
    | `InvalidEventPatternException _ -> "com.amazonaws.eventbridge#InvalidEventPatternException"
    | `LimitExceededException _ -> "com.amazonaws.eventbridge#LimitExceededException"
    | `ManagedRuleException _ -> "com.amazonaws.eventbridge#ManagedRuleException"
    | `ResourceNotFoundException _ -> "com.amazonaws.eventbridge#ResourceNotFoundException"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "ConcurrentModificationException" ->
          `ConcurrentModificationException
            (Json_deserializers.concurrent_modification_exception_of_yojson tree path)
      | _, "InternalException" ->
          `InternalException (Json_deserializers.internal_exception_of_yojson tree path)
      | _, "InvalidEventPatternException" ->
          `InvalidEventPatternException
            (Json_deserializers.invalid_event_pattern_exception_of_yojson tree path)
      | _, "LimitExceededException" ->
          `LimitExceededException (Json_deserializers.limit_exceeded_exception_of_yojson tree path)
      | _, "ManagedRuleException" ->
          `ManagedRuleException (Json_deserializers.managed_rule_exception_of_yojson tree path)
      | _, "ResourceNotFoundException" ->
          `ResourceNotFoundException
            (Json_deserializers.resource_not_found_exception_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : put_rule_request) =
    let input = Json_serializers.put_rule_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"AWSEvents.PutRule" ~service ~context ~input
      ~output_deserializer:Json_deserializers.put_rule_response_of_yojson ~error_deserializer
end

module PutTargets = struct
  let error_to_string = function
    | `ConcurrentModificationException _ ->
        "com.amazonaws.eventbridge#ConcurrentModificationException"
    | `InternalException _ -> "com.amazonaws.eventbridge#InternalException"
    | `LimitExceededException _ -> "com.amazonaws.eventbridge#LimitExceededException"
    | `ManagedRuleException _ -> "com.amazonaws.eventbridge#ManagedRuleException"
    | `ResourceNotFoundException _ -> "com.amazonaws.eventbridge#ResourceNotFoundException"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "ConcurrentModificationException" ->
          `ConcurrentModificationException
            (Json_deserializers.concurrent_modification_exception_of_yojson tree path)
      | _, "InternalException" ->
          `InternalException (Json_deserializers.internal_exception_of_yojson tree path)
      | _, "LimitExceededException" ->
          `LimitExceededException (Json_deserializers.limit_exceeded_exception_of_yojson tree path)
      | _, "ManagedRuleException" ->
          `ManagedRuleException (Json_deserializers.managed_rule_exception_of_yojson tree path)
      | _, "ResourceNotFoundException" ->
          `ResourceNotFoundException
            (Json_deserializers.resource_not_found_exception_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : put_targets_request) =
    let input = Json_serializers.put_targets_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"AWSEvents.PutTargets" ~service ~context ~input
      ~output_deserializer:Json_deserializers.put_targets_response_of_yojson ~error_deserializer
end

module RemovePermission = struct
  let error_to_string = function
    | `ConcurrentModificationException _ ->
        "com.amazonaws.eventbridge#ConcurrentModificationException"
    | `InternalException _ -> "com.amazonaws.eventbridge#InternalException"
    | `OperationDisabledException _ -> "com.amazonaws.eventbridge#OperationDisabledException"
    | `ResourceNotFoundException _ -> "com.amazonaws.eventbridge#ResourceNotFoundException"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "ConcurrentModificationException" ->
          `ConcurrentModificationException
            (Json_deserializers.concurrent_modification_exception_of_yojson tree path)
      | _, "InternalException" ->
          `InternalException (Json_deserializers.internal_exception_of_yojson tree path)
      | _, "OperationDisabledException" ->
          `OperationDisabledException
            (Json_deserializers.operation_disabled_exception_of_yojson tree path)
      | _, "ResourceNotFoundException" ->
          `ResourceNotFoundException
            (Json_deserializers.resource_not_found_exception_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : remove_permission_request) =
    let input = Json_serializers.remove_permission_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"AWSEvents.RemovePermission" ~service ~context
      ~input ~output_deserializer:Smaws_Lib.Smithy_api.Json_deserializers.unit__of_yojson
      ~error_deserializer
end

module RemoveTargets = struct
  let error_to_string = function
    | `ConcurrentModificationException _ ->
        "com.amazonaws.eventbridge#ConcurrentModificationException"
    | `InternalException _ -> "com.amazonaws.eventbridge#InternalException"
    | `ManagedRuleException _ -> "com.amazonaws.eventbridge#ManagedRuleException"
    | `ResourceNotFoundException _ -> "com.amazonaws.eventbridge#ResourceNotFoundException"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "ConcurrentModificationException" ->
          `ConcurrentModificationException
            (Json_deserializers.concurrent_modification_exception_of_yojson tree path)
      | _, "InternalException" ->
          `InternalException (Json_deserializers.internal_exception_of_yojson tree path)
      | _, "ManagedRuleException" ->
          `ManagedRuleException (Json_deserializers.managed_rule_exception_of_yojson tree path)
      | _, "ResourceNotFoundException" ->
          `ResourceNotFoundException
            (Json_deserializers.resource_not_found_exception_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : remove_targets_request) =
    let input = Json_serializers.remove_targets_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"AWSEvents.RemoveTargets" ~service ~context
      ~input ~output_deserializer:Json_deserializers.remove_targets_response_of_yojson
      ~error_deserializer
end

module StartReplay = struct
  let error_to_string = function
    | `InternalException _ -> "com.amazonaws.eventbridge#InternalException"
    | `InvalidEventPatternException _ -> "com.amazonaws.eventbridge#InvalidEventPatternException"
    | `LimitExceededException _ -> "com.amazonaws.eventbridge#LimitExceededException"
    | `ResourceAlreadyExistsException _ ->
        "com.amazonaws.eventbridge#ResourceAlreadyExistsException"
    | `ResourceNotFoundException _ -> "com.amazonaws.eventbridge#ResourceNotFoundException"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "InternalException" ->
          `InternalException (Json_deserializers.internal_exception_of_yojson tree path)
      | _, "InvalidEventPatternException" ->
          `InvalidEventPatternException
            (Json_deserializers.invalid_event_pattern_exception_of_yojson tree path)
      | _, "LimitExceededException" ->
          `LimitExceededException (Json_deserializers.limit_exceeded_exception_of_yojson tree path)
      | _, "ResourceAlreadyExistsException" ->
          `ResourceAlreadyExistsException
            (Json_deserializers.resource_already_exists_exception_of_yojson tree path)
      | _, "ResourceNotFoundException" ->
          `ResourceNotFoundException
            (Json_deserializers.resource_not_found_exception_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : start_replay_request) =
    let input = Json_serializers.start_replay_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"AWSEvents.StartReplay" ~service ~context ~input
      ~output_deserializer:Json_deserializers.start_replay_response_of_yojson ~error_deserializer
end

module TagResource = struct
  let error_to_string = function
    | `ConcurrentModificationException _ ->
        "com.amazonaws.eventbridge#ConcurrentModificationException"
    | `InternalException _ -> "com.amazonaws.eventbridge#InternalException"
    | `ManagedRuleException _ -> "com.amazonaws.eventbridge#ManagedRuleException"
    | `ResourceNotFoundException _ -> "com.amazonaws.eventbridge#ResourceNotFoundException"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "ConcurrentModificationException" ->
          `ConcurrentModificationException
            (Json_deserializers.concurrent_modification_exception_of_yojson tree path)
      | _, "InternalException" ->
          `InternalException (Json_deserializers.internal_exception_of_yojson tree path)
      | _, "ManagedRuleException" ->
          `ManagedRuleException (Json_deserializers.managed_rule_exception_of_yojson tree path)
      | _, "ResourceNotFoundException" ->
          `ResourceNotFoundException
            (Json_deserializers.resource_not_found_exception_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : tag_resource_request) =
    let input = Json_serializers.tag_resource_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"AWSEvents.TagResource" ~service ~context ~input
      ~output_deserializer:Json_deserializers.tag_resource_response_of_yojson ~error_deserializer
end

module TestEventPattern = struct
  let error_to_string = function
    | `InternalException _ -> "com.amazonaws.eventbridge#InternalException"
    | `InvalidEventPatternException _ -> "com.amazonaws.eventbridge#InvalidEventPatternException"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "InternalException" ->
          `InternalException (Json_deserializers.internal_exception_of_yojson tree path)
      | _, "InvalidEventPatternException" ->
          `InvalidEventPatternException
            (Json_deserializers.invalid_event_pattern_exception_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : test_event_pattern_request) =
    let input = Json_serializers.test_event_pattern_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"AWSEvents.TestEventPattern" ~service ~context
      ~input ~output_deserializer:Json_deserializers.test_event_pattern_response_of_yojson
      ~error_deserializer
end

module UntagResource = struct
  let error_to_string = function
    | `ConcurrentModificationException _ ->
        "com.amazonaws.eventbridge#ConcurrentModificationException"
    | `InternalException _ -> "com.amazonaws.eventbridge#InternalException"
    | `ManagedRuleException _ -> "com.amazonaws.eventbridge#ManagedRuleException"
    | `ResourceNotFoundException _ -> "com.amazonaws.eventbridge#ResourceNotFoundException"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "ConcurrentModificationException" ->
          `ConcurrentModificationException
            (Json_deserializers.concurrent_modification_exception_of_yojson tree path)
      | _, "InternalException" ->
          `InternalException (Json_deserializers.internal_exception_of_yojson tree path)
      | _, "ManagedRuleException" ->
          `ManagedRuleException (Json_deserializers.managed_rule_exception_of_yojson tree path)
      | _, "ResourceNotFoundException" ->
          `ResourceNotFoundException
            (Json_deserializers.resource_not_found_exception_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : untag_resource_request) =
    let input = Json_serializers.untag_resource_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"AWSEvents.UntagResource" ~service ~context
      ~input ~output_deserializer:Json_deserializers.untag_resource_response_of_yojson
      ~error_deserializer
end

module UpdateApiDestination = struct
  let error_to_string = function
    | `ConcurrentModificationException _ ->
        "com.amazonaws.eventbridge#ConcurrentModificationException"
    | `InternalException _ -> "com.amazonaws.eventbridge#InternalException"
    | `LimitExceededException _ -> "com.amazonaws.eventbridge#LimitExceededException"
    | `ResourceNotFoundException _ -> "com.amazonaws.eventbridge#ResourceNotFoundException"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "ConcurrentModificationException" ->
          `ConcurrentModificationException
            (Json_deserializers.concurrent_modification_exception_of_yojson tree path)
      | _, "InternalException" ->
          `InternalException (Json_deserializers.internal_exception_of_yojson tree path)
      | _, "LimitExceededException" ->
          `LimitExceededException (Json_deserializers.limit_exceeded_exception_of_yojson tree path)
      | _, "ResourceNotFoundException" ->
          `ResourceNotFoundException
            (Json_deserializers.resource_not_found_exception_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : update_api_destination_request) =
    let input = Json_serializers.update_api_destination_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"AWSEvents.UpdateApiDestination" ~service
      ~context ~input
      ~output_deserializer:Json_deserializers.update_api_destination_response_of_yojson
      ~error_deserializer
end

module UpdateArchive = struct
  let error_to_string = function
    | `ConcurrentModificationException _ ->
        "com.amazonaws.eventbridge#ConcurrentModificationException"
    | `InternalException _ -> "com.amazonaws.eventbridge#InternalException"
    | `InvalidEventPatternException _ -> "com.amazonaws.eventbridge#InvalidEventPatternException"
    | `LimitExceededException _ -> "com.amazonaws.eventbridge#LimitExceededException"
    | `ResourceNotFoundException _ -> "com.amazonaws.eventbridge#ResourceNotFoundException"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "ConcurrentModificationException" ->
          `ConcurrentModificationException
            (Json_deserializers.concurrent_modification_exception_of_yojson tree path)
      | _, "InternalException" ->
          `InternalException (Json_deserializers.internal_exception_of_yojson tree path)
      | _, "InvalidEventPatternException" ->
          `InvalidEventPatternException
            (Json_deserializers.invalid_event_pattern_exception_of_yojson tree path)
      | _, "LimitExceededException" ->
          `LimitExceededException (Json_deserializers.limit_exceeded_exception_of_yojson tree path)
      | _, "ResourceNotFoundException" ->
          `ResourceNotFoundException
            (Json_deserializers.resource_not_found_exception_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : update_archive_request) =
    let input = Json_serializers.update_archive_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"AWSEvents.UpdateArchive" ~service ~context
      ~input ~output_deserializer:Json_deserializers.update_archive_response_of_yojson
      ~error_deserializer
end

module UpdateConnection = struct
  let error_to_string = function
    | `AccessDeniedException _ -> "com.amazonaws.eventbridge#AccessDeniedException"
    | `ConcurrentModificationException _ ->
        "com.amazonaws.eventbridge#ConcurrentModificationException"
    | `InternalException _ -> "com.amazonaws.eventbridge#InternalException"
    | `LimitExceededException _ -> "com.amazonaws.eventbridge#LimitExceededException"
    | `ResourceNotFoundException _ -> "com.amazonaws.eventbridge#ResourceNotFoundException"
    | `ThrottlingException _ -> "com.amazonaws.eventbridge#ThrottlingException"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "AccessDeniedException" ->
          `AccessDeniedException (Json_deserializers.access_denied_exception_of_yojson tree path)
      | _, "ConcurrentModificationException" ->
          `ConcurrentModificationException
            (Json_deserializers.concurrent_modification_exception_of_yojson tree path)
      | _, "InternalException" ->
          `InternalException (Json_deserializers.internal_exception_of_yojson tree path)
      | _, "LimitExceededException" ->
          `LimitExceededException (Json_deserializers.limit_exceeded_exception_of_yojson tree path)
      | _, "ResourceNotFoundException" ->
          `ResourceNotFoundException
            (Json_deserializers.resource_not_found_exception_of_yojson tree path)
      | _, "ThrottlingException" ->
          `ThrottlingException (Json_deserializers.throttling_exception_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : update_connection_request) =
    let input = Json_serializers.update_connection_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"AWSEvents.UpdateConnection" ~service ~context
      ~input ~output_deserializer:Json_deserializers.update_connection_response_of_yojson
      ~error_deserializer
end

module UpdateEndpoint = struct
  let error_to_string = function
    | `ConcurrentModificationException _ ->
        "com.amazonaws.eventbridge#ConcurrentModificationException"
    | `InternalException _ -> "com.amazonaws.eventbridge#InternalException"
    | `ResourceNotFoundException _ -> "com.amazonaws.eventbridge#ResourceNotFoundException"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "ConcurrentModificationException" ->
          `ConcurrentModificationException
            (Json_deserializers.concurrent_modification_exception_of_yojson tree path)
      | _, "InternalException" ->
          `InternalException (Json_deserializers.internal_exception_of_yojson tree path)
      | _, "ResourceNotFoundException" ->
          `ResourceNotFoundException
            (Json_deserializers.resource_not_found_exception_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : update_endpoint_request) =
    let input = Json_serializers.update_endpoint_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"AWSEvents.UpdateEndpoint" ~service ~context
      ~input ~output_deserializer:Json_deserializers.update_endpoint_response_of_yojson
      ~error_deserializer
end

module UpdateEventBus = struct
  let error_to_string = function
    | `ConcurrentModificationException _ ->
        "com.amazonaws.eventbridge#ConcurrentModificationException"
    | `InternalException _ -> "com.amazonaws.eventbridge#InternalException"
    | `OperationDisabledException _ -> "com.amazonaws.eventbridge#OperationDisabledException"
    | `ResourceNotFoundException _ -> "com.amazonaws.eventbridge#ResourceNotFoundException"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "ConcurrentModificationException" ->
          `ConcurrentModificationException
            (Json_deserializers.concurrent_modification_exception_of_yojson tree path)
      | _, "InternalException" ->
          `InternalException (Json_deserializers.internal_exception_of_yojson tree path)
      | _, "OperationDisabledException" ->
          `OperationDisabledException
            (Json_deserializers.operation_disabled_exception_of_yojson tree path)
      | _, "ResourceNotFoundException" ->
          `ResourceNotFoundException
            (Json_deserializers.resource_not_found_exception_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : update_event_bus_request) =
    let input = Json_serializers.update_event_bus_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"AWSEvents.UpdateEventBus" ~service ~context
      ~input ~output_deserializer:Json_deserializers.update_event_bus_response_of_yojson
      ~error_deserializer
end
