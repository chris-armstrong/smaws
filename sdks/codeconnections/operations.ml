open Types
open Service_metadata

module CreateConnection = struct
  let error_to_string = function
    | `LimitExceededException _ -> "com.amazonaws.codeconnections#LimitExceededException"
    | `ResourceNotFoundException _ -> "com.amazonaws.codeconnections#ResourceNotFoundException"
    | `ResourceUnavailableException _ ->
        "com.amazonaws.codeconnections#ResourceUnavailableException"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "LimitExceededException" ->
          `LimitExceededException (Json_deserializers.limit_exceeded_exception_of_yojson tree path)
      | _, "ResourceNotFoundException" ->
          `ResourceNotFoundException
            (Json_deserializers.resource_not_found_exception_of_yojson tree path)
      | _, "ResourceUnavailableException" ->
          `ResourceUnavailableException
            (Json_deserializers.resource_unavailable_exception_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : create_connection_input) =
    let input = Json_serializers.create_connection_input_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"CodeConnections_20231201.CreateConnection"
      ~service ~context ~input
      ~output_deserializer:Json_deserializers.create_connection_output_of_yojson ~error_deserializer
end

module CreateHost = struct
  let error_to_string = function
    | `LimitExceededException _ -> "com.amazonaws.codeconnections#LimitExceededException"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "LimitExceededException" ->
          `LimitExceededException (Json_deserializers.limit_exceeded_exception_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : create_host_input) =
    let input = Json_serializers.create_host_input_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"CodeConnections_20231201.CreateHost" ~service
      ~context ~input ~output_deserializer:Json_deserializers.create_host_output_of_yojson
      ~error_deserializer
end

module CreateRepositoryLink = struct
  let error_to_string = function
    | `AccessDeniedException _ -> "com.amazonaws.codeconnections#AccessDeniedException"
    | `ConcurrentModificationException _ ->
        "com.amazonaws.codeconnections#ConcurrentModificationException"
    | `InternalServerException _ -> "com.amazonaws.codeconnections#InternalServerException"
    | `InvalidInputException _ -> "com.amazonaws.codeconnections#InvalidInputException"
    | `LimitExceededException _ -> "com.amazonaws.codeconnections#LimitExceededException"
    | `ResourceAlreadyExistsException _ ->
        "com.amazonaws.codeconnections#ResourceAlreadyExistsException"
    | `ThrottlingException _ -> "com.amazonaws.codeconnections#ThrottlingException"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "AccessDeniedException" ->
          `AccessDeniedException (Json_deserializers.access_denied_exception_of_yojson tree path)
      | _, "ConcurrentModificationException" ->
          `ConcurrentModificationException
            (Json_deserializers.concurrent_modification_exception_of_yojson tree path)
      | _, "InternalServerException" ->
          `InternalServerException
            (Json_deserializers.internal_server_exception_of_yojson tree path)
      | _, "InvalidInputException" ->
          `InvalidInputException (Json_deserializers.invalid_input_exception_of_yojson tree path)
      | _, "LimitExceededException" ->
          `LimitExceededException (Json_deserializers.limit_exceeded_exception_of_yojson tree path)
      | _, "ResourceAlreadyExistsException" ->
          `ResourceAlreadyExistsException
            (Json_deserializers.resource_already_exists_exception_of_yojson tree path)
      | _, "ThrottlingException" ->
          `ThrottlingException (Json_deserializers.throttling_exception_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : create_repository_link_input) =
    let input = Json_serializers.create_repository_link_input_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"CodeConnections_20231201.CreateRepositoryLink"
      ~service ~context ~input
      ~output_deserializer:Json_deserializers.create_repository_link_output_of_yojson
      ~error_deserializer
end

module CreateSyncConfiguration = struct
  let error_to_string = function
    | `AccessDeniedException _ -> "com.amazonaws.codeconnections#AccessDeniedException"
    | `ConcurrentModificationException _ ->
        "com.amazonaws.codeconnections#ConcurrentModificationException"
    | `InternalServerException _ -> "com.amazonaws.codeconnections#InternalServerException"
    | `InvalidInputException _ -> "com.amazonaws.codeconnections#InvalidInputException"
    | `LimitExceededException _ -> "com.amazonaws.codeconnections#LimitExceededException"
    | `ResourceAlreadyExistsException _ ->
        "com.amazonaws.codeconnections#ResourceAlreadyExistsException"
    | `ThrottlingException _ -> "com.amazonaws.codeconnections#ThrottlingException"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "AccessDeniedException" ->
          `AccessDeniedException (Json_deserializers.access_denied_exception_of_yojson tree path)
      | _, "ConcurrentModificationException" ->
          `ConcurrentModificationException
            (Json_deserializers.concurrent_modification_exception_of_yojson tree path)
      | _, "InternalServerException" ->
          `InternalServerException
            (Json_deserializers.internal_server_exception_of_yojson tree path)
      | _, "InvalidInputException" ->
          `InvalidInputException (Json_deserializers.invalid_input_exception_of_yojson tree path)
      | _, "LimitExceededException" ->
          `LimitExceededException (Json_deserializers.limit_exceeded_exception_of_yojson tree path)
      | _, "ResourceAlreadyExistsException" ->
          `ResourceAlreadyExistsException
            (Json_deserializers.resource_already_exists_exception_of_yojson tree path)
      | _, "ThrottlingException" ->
          `ThrottlingException (Json_deserializers.throttling_exception_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : create_sync_configuration_input) =
    let input = Json_serializers.create_sync_configuration_input_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request
      ~shape_name:"CodeConnections_20231201.CreateSyncConfiguration" ~service ~context ~input
      ~output_deserializer:Json_deserializers.create_sync_configuration_output_of_yojson
      ~error_deserializer
end

module DeleteConnection = struct
  let error_to_string = function
    | `ResourceNotFoundException _ -> "com.amazonaws.codeconnections#ResourceNotFoundException"
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

  let request context (request : delete_connection_input) =
    let input = Json_serializers.delete_connection_input_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"CodeConnections_20231201.DeleteConnection"
      ~service ~context ~input
      ~output_deserializer:Json_deserializers.delete_connection_output_of_yojson ~error_deserializer
end

module DeleteHost = struct
  let error_to_string = function
    | `ResourceNotFoundException _ -> "com.amazonaws.codeconnections#ResourceNotFoundException"
    | `ResourceUnavailableException _ ->
        "com.amazonaws.codeconnections#ResourceUnavailableException"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "ResourceNotFoundException" ->
          `ResourceNotFoundException
            (Json_deserializers.resource_not_found_exception_of_yojson tree path)
      | _, "ResourceUnavailableException" ->
          `ResourceUnavailableException
            (Json_deserializers.resource_unavailable_exception_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : delete_host_input) =
    let input = Json_serializers.delete_host_input_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"CodeConnections_20231201.DeleteHost" ~service
      ~context ~input ~output_deserializer:Json_deserializers.delete_host_output_of_yojson
      ~error_deserializer
end

module DeleteRepositoryLink = struct
  let error_to_string = function
    | `AccessDeniedException _ -> "com.amazonaws.codeconnections#AccessDeniedException"
    | `ConcurrentModificationException _ ->
        "com.amazonaws.codeconnections#ConcurrentModificationException"
    | `InternalServerException _ -> "com.amazonaws.codeconnections#InternalServerException"
    | `InvalidInputException _ -> "com.amazonaws.codeconnections#InvalidInputException"
    | `ResourceNotFoundException _ -> "com.amazonaws.codeconnections#ResourceNotFoundException"
    | `SyncConfigurationStillExistsException _ ->
        "com.amazonaws.codeconnections#SyncConfigurationStillExistsException"
    | `ThrottlingException _ -> "com.amazonaws.codeconnections#ThrottlingException"
    | `UnsupportedProviderTypeException _ ->
        "com.amazonaws.codeconnections#UnsupportedProviderTypeException"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "AccessDeniedException" ->
          `AccessDeniedException (Json_deserializers.access_denied_exception_of_yojson tree path)
      | _, "ConcurrentModificationException" ->
          `ConcurrentModificationException
            (Json_deserializers.concurrent_modification_exception_of_yojson tree path)
      | _, "InternalServerException" ->
          `InternalServerException
            (Json_deserializers.internal_server_exception_of_yojson tree path)
      | _, "InvalidInputException" ->
          `InvalidInputException (Json_deserializers.invalid_input_exception_of_yojson tree path)
      | _, "ResourceNotFoundException" ->
          `ResourceNotFoundException
            (Json_deserializers.resource_not_found_exception_of_yojson tree path)
      | _, "SyncConfigurationStillExistsException" ->
          `SyncConfigurationStillExistsException
            (Json_deserializers.sync_configuration_still_exists_exception_of_yojson tree path)
      | _, "ThrottlingException" ->
          `ThrottlingException (Json_deserializers.throttling_exception_of_yojson tree path)
      | _, "UnsupportedProviderTypeException" ->
          `UnsupportedProviderTypeException
            (Json_deserializers.unsupported_provider_type_exception_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : delete_repository_link_input) =
    let input = Json_serializers.delete_repository_link_input_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"CodeConnections_20231201.DeleteRepositoryLink"
      ~service ~context ~input
      ~output_deserializer:Json_deserializers.delete_repository_link_output_of_yojson
      ~error_deserializer
end

module DeleteSyncConfiguration = struct
  let error_to_string = function
    | `AccessDeniedException _ -> "com.amazonaws.codeconnections#AccessDeniedException"
    | `ConcurrentModificationException _ ->
        "com.amazonaws.codeconnections#ConcurrentModificationException"
    | `InternalServerException _ -> "com.amazonaws.codeconnections#InternalServerException"
    | `InvalidInputException _ -> "com.amazonaws.codeconnections#InvalidInputException"
    | `LimitExceededException _ -> "com.amazonaws.codeconnections#LimitExceededException"
    | `ThrottlingException _ -> "com.amazonaws.codeconnections#ThrottlingException"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "AccessDeniedException" ->
          `AccessDeniedException (Json_deserializers.access_denied_exception_of_yojson tree path)
      | _, "ConcurrentModificationException" ->
          `ConcurrentModificationException
            (Json_deserializers.concurrent_modification_exception_of_yojson tree path)
      | _, "InternalServerException" ->
          `InternalServerException
            (Json_deserializers.internal_server_exception_of_yojson tree path)
      | _, "InvalidInputException" ->
          `InvalidInputException (Json_deserializers.invalid_input_exception_of_yojson tree path)
      | _, "LimitExceededException" ->
          `LimitExceededException (Json_deserializers.limit_exceeded_exception_of_yojson tree path)
      | _, "ThrottlingException" ->
          `ThrottlingException (Json_deserializers.throttling_exception_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : delete_sync_configuration_input) =
    let input = Json_serializers.delete_sync_configuration_input_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request
      ~shape_name:"CodeConnections_20231201.DeleteSyncConfiguration" ~service ~context ~input
      ~output_deserializer:Json_deserializers.delete_sync_configuration_output_of_yojson
      ~error_deserializer
end

module GetConnection = struct
  let error_to_string = function
    | `ResourceNotFoundException _ -> "com.amazonaws.codeconnections#ResourceNotFoundException"
    | `ResourceUnavailableException _ ->
        "com.amazonaws.codeconnections#ResourceUnavailableException"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "ResourceNotFoundException" ->
          `ResourceNotFoundException
            (Json_deserializers.resource_not_found_exception_of_yojson tree path)
      | _, "ResourceUnavailableException" ->
          `ResourceUnavailableException
            (Json_deserializers.resource_unavailable_exception_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : get_connection_input) =
    let input = Json_serializers.get_connection_input_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"CodeConnections_20231201.GetConnection"
      ~service ~context ~input
      ~output_deserializer:Json_deserializers.get_connection_output_of_yojson ~error_deserializer
end

module GetHost = struct
  let error_to_string = function
    | `ResourceNotFoundException _ -> "com.amazonaws.codeconnections#ResourceNotFoundException"
    | `ResourceUnavailableException _ ->
        "com.amazonaws.codeconnections#ResourceUnavailableException"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "ResourceNotFoundException" ->
          `ResourceNotFoundException
            (Json_deserializers.resource_not_found_exception_of_yojson tree path)
      | _, "ResourceUnavailableException" ->
          `ResourceUnavailableException
            (Json_deserializers.resource_unavailable_exception_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : get_host_input) =
    let input = Json_serializers.get_host_input_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"CodeConnections_20231201.GetHost" ~service
      ~context ~input ~output_deserializer:Json_deserializers.get_host_output_of_yojson
      ~error_deserializer
end

module GetRepositoryLink = struct
  let error_to_string = function
    | `AccessDeniedException _ -> "com.amazonaws.codeconnections#AccessDeniedException"
    | `ConcurrentModificationException _ ->
        "com.amazonaws.codeconnections#ConcurrentModificationException"
    | `InternalServerException _ -> "com.amazonaws.codeconnections#InternalServerException"
    | `InvalidInputException _ -> "com.amazonaws.codeconnections#InvalidInputException"
    | `ResourceNotFoundException _ -> "com.amazonaws.codeconnections#ResourceNotFoundException"
    | `ThrottlingException _ -> "com.amazonaws.codeconnections#ThrottlingException"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "AccessDeniedException" ->
          `AccessDeniedException (Json_deserializers.access_denied_exception_of_yojson tree path)
      | _, "ConcurrentModificationException" ->
          `ConcurrentModificationException
            (Json_deserializers.concurrent_modification_exception_of_yojson tree path)
      | _, "InternalServerException" ->
          `InternalServerException
            (Json_deserializers.internal_server_exception_of_yojson tree path)
      | _, "InvalidInputException" ->
          `InvalidInputException (Json_deserializers.invalid_input_exception_of_yojson tree path)
      | _, "ResourceNotFoundException" ->
          `ResourceNotFoundException
            (Json_deserializers.resource_not_found_exception_of_yojson tree path)
      | _, "ThrottlingException" ->
          `ThrottlingException (Json_deserializers.throttling_exception_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : get_repository_link_input) =
    let input = Json_serializers.get_repository_link_input_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"CodeConnections_20231201.GetRepositoryLink"
      ~service ~context ~input
      ~output_deserializer:Json_deserializers.get_repository_link_output_of_yojson
      ~error_deserializer
end

module GetRepositorySyncStatus = struct
  let error_to_string = function
    | `AccessDeniedException _ -> "com.amazonaws.codeconnections#AccessDeniedException"
    | `InternalServerException _ -> "com.amazonaws.codeconnections#InternalServerException"
    | `InvalidInputException _ -> "com.amazonaws.codeconnections#InvalidInputException"
    | `ResourceNotFoundException _ -> "com.amazonaws.codeconnections#ResourceNotFoundException"
    | `ThrottlingException _ -> "com.amazonaws.codeconnections#ThrottlingException"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "AccessDeniedException" ->
          `AccessDeniedException (Json_deserializers.access_denied_exception_of_yojson tree path)
      | _, "InternalServerException" ->
          `InternalServerException
            (Json_deserializers.internal_server_exception_of_yojson tree path)
      | _, "InvalidInputException" ->
          `InvalidInputException (Json_deserializers.invalid_input_exception_of_yojson tree path)
      | _, "ResourceNotFoundException" ->
          `ResourceNotFoundException
            (Json_deserializers.resource_not_found_exception_of_yojson tree path)
      | _, "ThrottlingException" ->
          `ThrottlingException (Json_deserializers.throttling_exception_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : get_repository_sync_status_input) =
    let input = Json_serializers.get_repository_sync_status_input_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request
      ~shape_name:"CodeConnections_20231201.GetRepositorySyncStatus" ~service ~context ~input
      ~output_deserializer:Json_deserializers.get_repository_sync_status_output_of_yojson
      ~error_deserializer
end

module GetResourceSyncStatus = struct
  let error_to_string = function
    | `AccessDeniedException _ -> "com.amazonaws.codeconnections#AccessDeniedException"
    | `InternalServerException _ -> "com.amazonaws.codeconnections#InternalServerException"
    | `InvalidInputException _ -> "com.amazonaws.codeconnections#InvalidInputException"
    | `ResourceNotFoundException _ -> "com.amazonaws.codeconnections#ResourceNotFoundException"
    | `ThrottlingException _ -> "com.amazonaws.codeconnections#ThrottlingException"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "AccessDeniedException" ->
          `AccessDeniedException (Json_deserializers.access_denied_exception_of_yojson tree path)
      | _, "InternalServerException" ->
          `InternalServerException
            (Json_deserializers.internal_server_exception_of_yojson tree path)
      | _, "InvalidInputException" ->
          `InvalidInputException (Json_deserializers.invalid_input_exception_of_yojson tree path)
      | _, "ResourceNotFoundException" ->
          `ResourceNotFoundException
            (Json_deserializers.resource_not_found_exception_of_yojson tree path)
      | _, "ThrottlingException" ->
          `ThrottlingException (Json_deserializers.throttling_exception_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : get_resource_sync_status_input) =
    let input = Json_serializers.get_resource_sync_status_input_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"CodeConnections_20231201.GetResourceSyncStatus"
      ~service ~context ~input
      ~output_deserializer:Json_deserializers.get_resource_sync_status_output_of_yojson
      ~error_deserializer
end

module GetSyncBlockerSummary = struct
  let error_to_string = function
    | `AccessDeniedException _ -> "com.amazonaws.codeconnections#AccessDeniedException"
    | `InternalServerException _ -> "com.amazonaws.codeconnections#InternalServerException"
    | `InvalidInputException _ -> "com.amazonaws.codeconnections#InvalidInputException"
    | `ResourceNotFoundException _ -> "com.amazonaws.codeconnections#ResourceNotFoundException"
    | `ThrottlingException _ -> "com.amazonaws.codeconnections#ThrottlingException"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "AccessDeniedException" ->
          `AccessDeniedException (Json_deserializers.access_denied_exception_of_yojson tree path)
      | _, "InternalServerException" ->
          `InternalServerException
            (Json_deserializers.internal_server_exception_of_yojson tree path)
      | _, "InvalidInputException" ->
          `InvalidInputException (Json_deserializers.invalid_input_exception_of_yojson tree path)
      | _, "ResourceNotFoundException" ->
          `ResourceNotFoundException
            (Json_deserializers.resource_not_found_exception_of_yojson tree path)
      | _, "ThrottlingException" ->
          `ThrottlingException (Json_deserializers.throttling_exception_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : get_sync_blocker_summary_input) =
    let input = Json_serializers.get_sync_blocker_summary_input_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"CodeConnections_20231201.GetSyncBlockerSummary"
      ~service ~context ~input
      ~output_deserializer:Json_deserializers.get_sync_blocker_summary_output_of_yojson
      ~error_deserializer
end

module GetSyncConfiguration = struct
  let error_to_string = function
    | `AccessDeniedException _ -> "com.amazonaws.codeconnections#AccessDeniedException"
    | `InternalServerException _ -> "com.amazonaws.codeconnections#InternalServerException"
    | `InvalidInputException _ -> "com.amazonaws.codeconnections#InvalidInputException"
    | `ResourceNotFoundException _ -> "com.amazonaws.codeconnections#ResourceNotFoundException"
    | `ThrottlingException _ -> "com.amazonaws.codeconnections#ThrottlingException"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "AccessDeniedException" ->
          `AccessDeniedException (Json_deserializers.access_denied_exception_of_yojson tree path)
      | _, "InternalServerException" ->
          `InternalServerException
            (Json_deserializers.internal_server_exception_of_yojson tree path)
      | _, "InvalidInputException" ->
          `InvalidInputException (Json_deserializers.invalid_input_exception_of_yojson tree path)
      | _, "ResourceNotFoundException" ->
          `ResourceNotFoundException
            (Json_deserializers.resource_not_found_exception_of_yojson tree path)
      | _, "ThrottlingException" ->
          `ThrottlingException (Json_deserializers.throttling_exception_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : get_sync_configuration_input) =
    let input = Json_serializers.get_sync_configuration_input_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"CodeConnections_20231201.GetSyncConfiguration"
      ~service ~context ~input
      ~output_deserializer:Json_deserializers.get_sync_configuration_output_of_yojson
      ~error_deserializer
end

module ListConnections = struct
  let error_to_string = function
    | `ResourceNotFoundException _ -> "com.amazonaws.codeconnections#ResourceNotFoundException"
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

  let request context (request : list_connections_input) =
    let input = Json_serializers.list_connections_input_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"CodeConnections_20231201.ListConnections"
      ~service ~context ~input
      ~output_deserializer:Json_deserializers.list_connections_output_of_yojson ~error_deserializer
end

module ListHosts = struct
  let error_to_string = Smaws_Lib.Protocols.AwsJson.error_to_string

  let error_deserializer tree path =
    let handler a = a in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : list_hosts_input) =
    let input = Json_serializers.list_hosts_input_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"CodeConnections_20231201.ListHosts" ~service
      ~context ~input ~output_deserializer:Json_deserializers.list_hosts_output_of_yojson
      ~error_deserializer
end

module ListRepositoryLinks = struct
  let error_to_string = function
    | `AccessDeniedException _ -> "com.amazonaws.codeconnections#AccessDeniedException"
    | `ConcurrentModificationException _ ->
        "com.amazonaws.codeconnections#ConcurrentModificationException"
    | `InternalServerException _ -> "com.amazonaws.codeconnections#InternalServerException"
    | `InvalidInputException _ -> "com.amazonaws.codeconnections#InvalidInputException"
    | `ResourceNotFoundException _ -> "com.amazonaws.codeconnections#ResourceNotFoundException"
    | `ThrottlingException _ -> "com.amazonaws.codeconnections#ThrottlingException"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "AccessDeniedException" ->
          `AccessDeniedException (Json_deserializers.access_denied_exception_of_yojson tree path)
      | _, "ConcurrentModificationException" ->
          `ConcurrentModificationException
            (Json_deserializers.concurrent_modification_exception_of_yojson tree path)
      | _, "InternalServerException" ->
          `InternalServerException
            (Json_deserializers.internal_server_exception_of_yojson tree path)
      | _, "InvalidInputException" ->
          `InvalidInputException (Json_deserializers.invalid_input_exception_of_yojson tree path)
      | _, "ResourceNotFoundException" ->
          `ResourceNotFoundException
            (Json_deserializers.resource_not_found_exception_of_yojson tree path)
      | _, "ThrottlingException" ->
          `ThrottlingException (Json_deserializers.throttling_exception_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : list_repository_links_input) =
    let input = Json_serializers.list_repository_links_input_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"CodeConnections_20231201.ListRepositoryLinks"
      ~service ~context ~input
      ~output_deserializer:Json_deserializers.list_repository_links_output_of_yojson
      ~error_deserializer
end

module ListRepositorySyncDefinitions = struct
  let error_to_string = function
    | `AccessDeniedException _ -> "com.amazonaws.codeconnections#AccessDeniedException"
    | `InternalServerException _ -> "com.amazonaws.codeconnections#InternalServerException"
    | `InvalidInputException _ -> "com.amazonaws.codeconnections#InvalidInputException"
    | `ResourceNotFoundException _ -> "com.amazonaws.codeconnections#ResourceNotFoundException"
    | `ThrottlingException _ -> "com.amazonaws.codeconnections#ThrottlingException"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "AccessDeniedException" ->
          `AccessDeniedException (Json_deserializers.access_denied_exception_of_yojson tree path)
      | _, "InternalServerException" ->
          `InternalServerException
            (Json_deserializers.internal_server_exception_of_yojson tree path)
      | _, "InvalidInputException" ->
          `InvalidInputException (Json_deserializers.invalid_input_exception_of_yojson tree path)
      | _, "ResourceNotFoundException" ->
          `ResourceNotFoundException
            (Json_deserializers.resource_not_found_exception_of_yojson tree path)
      | _, "ThrottlingException" ->
          `ThrottlingException (Json_deserializers.throttling_exception_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : list_repository_sync_definitions_input) =
    let input = Json_serializers.list_repository_sync_definitions_input_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request
      ~shape_name:"CodeConnections_20231201.ListRepositorySyncDefinitions" ~service ~context ~input
      ~output_deserializer:Json_deserializers.list_repository_sync_definitions_output_of_yojson
      ~error_deserializer
end

module ListSyncConfigurations = struct
  let error_to_string = function
    | `AccessDeniedException _ -> "com.amazonaws.codeconnections#AccessDeniedException"
    | `InternalServerException _ -> "com.amazonaws.codeconnections#InternalServerException"
    | `InvalidInputException _ -> "com.amazonaws.codeconnections#InvalidInputException"
    | `ResourceNotFoundException _ -> "com.amazonaws.codeconnections#ResourceNotFoundException"
    | `ThrottlingException _ -> "com.amazonaws.codeconnections#ThrottlingException"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "AccessDeniedException" ->
          `AccessDeniedException (Json_deserializers.access_denied_exception_of_yojson tree path)
      | _, "InternalServerException" ->
          `InternalServerException
            (Json_deserializers.internal_server_exception_of_yojson tree path)
      | _, "InvalidInputException" ->
          `InvalidInputException (Json_deserializers.invalid_input_exception_of_yojson tree path)
      | _, "ResourceNotFoundException" ->
          `ResourceNotFoundException
            (Json_deserializers.resource_not_found_exception_of_yojson tree path)
      | _, "ThrottlingException" ->
          `ThrottlingException (Json_deserializers.throttling_exception_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : list_sync_configurations_input) =
    let input = Json_serializers.list_sync_configurations_input_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request
      ~shape_name:"CodeConnections_20231201.ListSyncConfigurations" ~service ~context ~input
      ~output_deserializer:Json_deserializers.list_sync_configurations_output_of_yojson
      ~error_deserializer
end

module ListTagsForResource = struct
  let error_to_string = function
    | `ResourceNotFoundException _ -> "com.amazonaws.codeconnections#ResourceNotFoundException"
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

  let request context (request : list_tags_for_resource_input) =
    let input = Json_serializers.list_tags_for_resource_input_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"CodeConnections_20231201.ListTagsForResource"
      ~service ~context ~input
      ~output_deserializer:Json_deserializers.list_tags_for_resource_output_of_yojson
      ~error_deserializer
end

module TagResource = struct
  let error_to_string = function
    | `LimitExceededException _ -> "com.amazonaws.codeconnections#LimitExceededException"
    | `ResourceNotFoundException _ -> "com.amazonaws.codeconnections#ResourceNotFoundException"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "LimitExceededException" ->
          `LimitExceededException (Json_deserializers.limit_exceeded_exception_of_yojson tree path)
      | _, "ResourceNotFoundException" ->
          `ResourceNotFoundException
            (Json_deserializers.resource_not_found_exception_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : tag_resource_input) =
    let input = Json_serializers.tag_resource_input_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"CodeConnections_20231201.TagResource" ~service
      ~context ~input ~output_deserializer:Json_deserializers.tag_resource_output_of_yojson
      ~error_deserializer
end

module UntagResource = struct
  let error_to_string = function
    | `ResourceNotFoundException _ -> "com.amazonaws.codeconnections#ResourceNotFoundException"
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

  let request context (request : untag_resource_input) =
    let input = Json_serializers.untag_resource_input_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"CodeConnections_20231201.UntagResource"
      ~service ~context ~input
      ~output_deserializer:Json_deserializers.untag_resource_output_of_yojson ~error_deserializer
end

module UpdateHost = struct
  let error_to_string = function
    | `ConflictException _ -> "com.amazonaws.codeconnections#ConflictException"
    | `ResourceNotFoundException _ -> "com.amazonaws.codeconnections#ResourceNotFoundException"
    | `ResourceUnavailableException _ ->
        "com.amazonaws.codeconnections#ResourceUnavailableException"
    | `UnsupportedOperationException _ ->
        "com.amazonaws.codeconnections#UnsupportedOperationException"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "ConflictException" ->
          `ConflictException (Json_deserializers.conflict_exception_of_yojson tree path)
      | _, "ResourceNotFoundException" ->
          `ResourceNotFoundException
            (Json_deserializers.resource_not_found_exception_of_yojson tree path)
      | _, "ResourceUnavailableException" ->
          `ResourceUnavailableException
            (Json_deserializers.resource_unavailable_exception_of_yojson tree path)
      | _, "UnsupportedOperationException" ->
          `UnsupportedOperationException
            (Json_deserializers.unsupported_operation_exception_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : update_host_input) =
    let input = Json_serializers.update_host_input_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"CodeConnections_20231201.UpdateHost" ~service
      ~context ~input ~output_deserializer:Json_deserializers.update_host_output_of_yojson
      ~error_deserializer
end

module UpdateRepositoryLink = struct
  let error_to_string = function
    | `AccessDeniedException _ -> "com.amazonaws.codeconnections#AccessDeniedException"
    | `ConditionalCheckFailedException _ ->
        "com.amazonaws.codeconnections#ConditionalCheckFailedException"
    | `InternalServerException _ -> "com.amazonaws.codeconnections#InternalServerException"
    | `InvalidInputException _ -> "com.amazonaws.codeconnections#InvalidInputException"
    | `ResourceNotFoundException _ -> "com.amazonaws.codeconnections#ResourceNotFoundException"
    | `ThrottlingException _ -> "com.amazonaws.codeconnections#ThrottlingException"
    | `UpdateOutOfSyncException _ -> "com.amazonaws.codeconnections#UpdateOutOfSyncException"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "AccessDeniedException" ->
          `AccessDeniedException (Json_deserializers.access_denied_exception_of_yojson tree path)
      | _, "ConditionalCheckFailedException" ->
          `ConditionalCheckFailedException
            (Json_deserializers.conditional_check_failed_exception_of_yojson tree path)
      | _, "InternalServerException" ->
          `InternalServerException
            (Json_deserializers.internal_server_exception_of_yojson tree path)
      | _, "InvalidInputException" ->
          `InvalidInputException (Json_deserializers.invalid_input_exception_of_yojson tree path)
      | _, "ResourceNotFoundException" ->
          `ResourceNotFoundException
            (Json_deserializers.resource_not_found_exception_of_yojson tree path)
      | _, "ThrottlingException" ->
          `ThrottlingException (Json_deserializers.throttling_exception_of_yojson tree path)
      | _, "UpdateOutOfSyncException" ->
          `UpdateOutOfSyncException
            (Json_deserializers.update_out_of_sync_exception_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : update_repository_link_input) =
    let input = Json_serializers.update_repository_link_input_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"CodeConnections_20231201.UpdateRepositoryLink"
      ~service ~context ~input
      ~output_deserializer:Json_deserializers.update_repository_link_output_of_yojson
      ~error_deserializer
end

module UpdateSyncBlocker = struct
  let error_to_string = function
    | `AccessDeniedException _ -> "com.amazonaws.codeconnections#AccessDeniedException"
    | `InternalServerException _ -> "com.amazonaws.codeconnections#InternalServerException"
    | `InvalidInputException _ -> "com.amazonaws.codeconnections#InvalidInputException"
    | `ResourceNotFoundException _ -> "com.amazonaws.codeconnections#ResourceNotFoundException"
    | `RetryLatestCommitFailedException _ ->
        "com.amazonaws.codeconnections#RetryLatestCommitFailedException"
    | `SyncBlockerDoesNotExistException _ ->
        "com.amazonaws.codeconnections#SyncBlockerDoesNotExistException"
    | `ThrottlingException _ -> "com.amazonaws.codeconnections#ThrottlingException"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "AccessDeniedException" ->
          `AccessDeniedException (Json_deserializers.access_denied_exception_of_yojson tree path)
      | _, "InternalServerException" ->
          `InternalServerException
            (Json_deserializers.internal_server_exception_of_yojson tree path)
      | _, "InvalidInputException" ->
          `InvalidInputException (Json_deserializers.invalid_input_exception_of_yojson tree path)
      | _, "ResourceNotFoundException" ->
          `ResourceNotFoundException
            (Json_deserializers.resource_not_found_exception_of_yojson tree path)
      | _, "RetryLatestCommitFailedException" ->
          `RetryLatestCommitFailedException
            (Json_deserializers.retry_latest_commit_failed_exception_of_yojson tree path)
      | _, "SyncBlockerDoesNotExistException" ->
          `SyncBlockerDoesNotExistException
            (Json_deserializers.sync_blocker_does_not_exist_exception_of_yojson tree path)
      | _, "ThrottlingException" ->
          `ThrottlingException (Json_deserializers.throttling_exception_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : update_sync_blocker_input) =
    let input = Json_serializers.update_sync_blocker_input_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"CodeConnections_20231201.UpdateSyncBlocker"
      ~service ~context ~input
      ~output_deserializer:Json_deserializers.update_sync_blocker_output_of_yojson
      ~error_deserializer
end

module UpdateSyncConfiguration = struct
  let error_to_string = function
    | `AccessDeniedException _ -> "com.amazonaws.codeconnections#AccessDeniedException"
    | `ConcurrentModificationException _ ->
        "com.amazonaws.codeconnections#ConcurrentModificationException"
    | `InternalServerException _ -> "com.amazonaws.codeconnections#InternalServerException"
    | `InvalidInputException _ -> "com.amazonaws.codeconnections#InvalidInputException"
    | `ResourceNotFoundException _ -> "com.amazonaws.codeconnections#ResourceNotFoundException"
    | `ThrottlingException _ -> "com.amazonaws.codeconnections#ThrottlingException"
    | `UpdateOutOfSyncException _ -> "com.amazonaws.codeconnections#UpdateOutOfSyncException"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "AccessDeniedException" ->
          `AccessDeniedException (Json_deserializers.access_denied_exception_of_yojson tree path)
      | _, "ConcurrentModificationException" ->
          `ConcurrentModificationException
            (Json_deserializers.concurrent_modification_exception_of_yojson tree path)
      | _, "InternalServerException" ->
          `InternalServerException
            (Json_deserializers.internal_server_exception_of_yojson tree path)
      | _, "InvalidInputException" ->
          `InvalidInputException (Json_deserializers.invalid_input_exception_of_yojson tree path)
      | _, "ResourceNotFoundException" ->
          `ResourceNotFoundException
            (Json_deserializers.resource_not_found_exception_of_yojson tree path)
      | _, "ThrottlingException" ->
          `ThrottlingException (Json_deserializers.throttling_exception_of_yojson tree path)
      | _, "UpdateOutOfSyncException" ->
          `UpdateOutOfSyncException
            (Json_deserializers.update_out_of_sync_exception_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : update_sync_configuration_input) =
    let input = Json_serializers.update_sync_configuration_input_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request
      ~shape_name:"CodeConnections_20231201.UpdateSyncConfiguration" ~service ~context ~input
      ~output_deserializer:Json_deserializers.update_sync_configuration_output_of_yojson
      ~error_deserializer
end
