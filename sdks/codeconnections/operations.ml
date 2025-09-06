open Types
open Service_metadata

module CreateConnection = struct
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
    let open Smaws_Lib.Context in
    let input = Json_serializers.create_connection_input_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"CodeConnections_20231201CreateConnection"
      ~service ~config:context.config ~http:context.http ~input
      ~output_deserializer:Json_deserializers.create_connection_output_of_yojson ~error_deserializer
end

module CreateHost = struct
  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "LimitExceededException" ->
          `LimitExceededException (Json_deserializers.limit_exceeded_exception_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : create_host_input) =
    let open Smaws_Lib.Context in
    let input = Json_serializers.create_host_input_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"CodeConnections_20231201CreateHost" ~service
      ~config:context.config ~http:context.http ~input
      ~output_deserializer:Json_deserializers.create_host_output_of_yojson ~error_deserializer
end

module CreateRepositoryLink = struct
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
    let open Smaws_Lib.Context in
    let input = Json_serializers.create_repository_link_input_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"CodeConnections_20231201CreateRepositoryLink"
      ~service ~config:context.config ~http:context.http ~input
      ~output_deserializer:Json_deserializers.create_repository_link_output_of_yojson
      ~error_deserializer
end

module CreateSyncConfiguration = struct
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
    let open Smaws_Lib.Context in
    let input = Json_serializers.create_sync_configuration_input_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request
      ~shape_name:"CodeConnections_20231201CreateSyncConfiguration" ~service ~config:context.config
      ~http:context.http ~input
      ~output_deserializer:Json_deserializers.create_sync_configuration_output_of_yojson
      ~error_deserializer
end

module DeleteConnection = struct
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
    let open Smaws_Lib.Context in
    let input = Json_serializers.delete_connection_input_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"CodeConnections_20231201DeleteConnection"
      ~service ~config:context.config ~http:context.http ~input
      ~output_deserializer:Json_deserializers.delete_connection_output_of_yojson ~error_deserializer
end

module DeleteHost = struct
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
    let open Smaws_Lib.Context in
    let input = Json_serializers.delete_host_input_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"CodeConnections_20231201DeleteHost" ~service
      ~config:context.config ~http:context.http ~input
      ~output_deserializer:Json_deserializers.delete_host_output_of_yojson ~error_deserializer
end

module DeleteRepositoryLink = struct
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
    let open Smaws_Lib.Context in
    let input = Json_serializers.delete_repository_link_input_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"CodeConnections_20231201DeleteRepositoryLink"
      ~service ~config:context.config ~http:context.http ~input
      ~output_deserializer:Json_deserializers.delete_repository_link_output_of_yojson
      ~error_deserializer
end

module DeleteSyncConfiguration = struct
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
    let open Smaws_Lib.Context in
    let input = Json_serializers.delete_sync_configuration_input_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request
      ~shape_name:"CodeConnections_20231201DeleteSyncConfiguration" ~service ~config:context.config
      ~http:context.http ~input
      ~output_deserializer:Json_deserializers.delete_sync_configuration_output_of_yojson
      ~error_deserializer
end

module GetConnection = struct
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
    let open Smaws_Lib.Context in
    let input = Json_serializers.get_connection_input_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"CodeConnections_20231201GetConnection" ~service
      ~config:context.config ~http:context.http ~input
      ~output_deserializer:Json_deserializers.get_connection_output_of_yojson ~error_deserializer
end

module GetHost = struct
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
    let open Smaws_Lib.Context in
    let input = Json_serializers.get_host_input_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"CodeConnections_20231201GetHost" ~service
      ~config:context.config ~http:context.http ~input
      ~output_deserializer:Json_deserializers.get_host_output_of_yojson ~error_deserializer
end

module GetRepositoryLink = struct
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
    let open Smaws_Lib.Context in
    let input = Json_serializers.get_repository_link_input_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"CodeConnections_20231201GetRepositoryLink"
      ~service ~config:context.config ~http:context.http ~input
      ~output_deserializer:Json_deserializers.get_repository_link_output_of_yojson
      ~error_deserializer
end

module GetRepositorySyncStatus = struct
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
    let open Smaws_Lib.Context in
    let input = Json_serializers.get_repository_sync_status_input_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request
      ~shape_name:"CodeConnections_20231201GetRepositorySyncStatus" ~service ~config:context.config
      ~http:context.http ~input
      ~output_deserializer:Json_deserializers.get_repository_sync_status_output_of_yojson
      ~error_deserializer
end

module GetResourceSyncStatus = struct
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
    let open Smaws_Lib.Context in
    let input = Json_serializers.get_resource_sync_status_input_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"CodeConnections_20231201GetResourceSyncStatus"
      ~service ~config:context.config ~http:context.http ~input
      ~output_deserializer:Json_deserializers.get_resource_sync_status_output_of_yojson
      ~error_deserializer
end

module GetSyncBlockerSummary = struct
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
    let open Smaws_Lib.Context in
    let input = Json_serializers.get_sync_blocker_summary_input_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"CodeConnections_20231201GetSyncBlockerSummary"
      ~service ~config:context.config ~http:context.http ~input
      ~output_deserializer:Json_deserializers.get_sync_blocker_summary_output_of_yojson
      ~error_deserializer
end

module GetSyncConfiguration = struct
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
    let open Smaws_Lib.Context in
    let input = Json_serializers.get_sync_configuration_input_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"CodeConnections_20231201GetSyncConfiguration"
      ~service ~config:context.config ~http:context.http ~input
      ~output_deserializer:Json_deserializers.get_sync_configuration_output_of_yojson
      ~error_deserializer
end

module ListConnections = struct
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
    let open Smaws_Lib.Context in
    let input = Json_serializers.list_connections_input_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"CodeConnections_20231201ListConnections"
      ~service ~config:context.config ~http:context.http ~input
      ~output_deserializer:Json_deserializers.list_connections_output_of_yojson ~error_deserializer
end

module ListHosts = struct
  let error_deserializer tree path =
    let handler a = a in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : list_hosts_input) =
    let open Smaws_Lib.Context in
    let input = Json_serializers.list_hosts_input_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"CodeConnections_20231201ListHosts" ~service
      ~config:context.config ~http:context.http ~input
      ~output_deserializer:Json_deserializers.list_hosts_output_of_yojson ~error_deserializer
end

module ListRepositoryLinks = struct
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
    let open Smaws_Lib.Context in
    let input = Json_serializers.list_repository_links_input_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"CodeConnections_20231201ListRepositoryLinks"
      ~service ~config:context.config ~http:context.http ~input
      ~output_deserializer:Json_deserializers.list_repository_links_output_of_yojson
      ~error_deserializer
end

module ListRepositorySyncDefinitions = struct
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
    let open Smaws_Lib.Context in
    let input = Json_serializers.list_repository_sync_definitions_input_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request
      ~shape_name:"CodeConnections_20231201ListRepositorySyncDefinitions" ~service
      ~config:context.config ~http:context.http ~input
      ~output_deserializer:Json_deserializers.list_repository_sync_definitions_output_of_yojson
      ~error_deserializer
end

module ListSyncConfigurations = struct
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
    let open Smaws_Lib.Context in
    let input = Json_serializers.list_sync_configurations_input_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"CodeConnections_20231201ListSyncConfigurations"
      ~service ~config:context.config ~http:context.http ~input
      ~output_deserializer:Json_deserializers.list_sync_configurations_output_of_yojson
      ~error_deserializer
end

module ListTagsForResource = struct
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
    let open Smaws_Lib.Context in
    let input = Json_serializers.list_tags_for_resource_input_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"CodeConnections_20231201ListTagsForResource"
      ~service ~config:context.config ~http:context.http ~input
      ~output_deserializer:Json_deserializers.list_tags_for_resource_output_of_yojson
      ~error_deserializer
end

module TagResource = struct
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
    let open Smaws_Lib.Context in
    let input = Json_serializers.tag_resource_input_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"CodeConnections_20231201TagResource" ~service
      ~config:context.config ~http:context.http ~input
      ~output_deserializer:Json_deserializers.tag_resource_output_of_yojson ~error_deserializer
end

module UntagResource = struct
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
    let open Smaws_Lib.Context in
    let input = Json_serializers.untag_resource_input_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"CodeConnections_20231201UntagResource" ~service
      ~config:context.config ~http:context.http ~input
      ~output_deserializer:Json_deserializers.untag_resource_output_of_yojson ~error_deserializer
end

module UpdateHost = struct
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
    let open Smaws_Lib.Context in
    let input = Json_serializers.update_host_input_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"CodeConnections_20231201UpdateHost" ~service
      ~config:context.config ~http:context.http ~input
      ~output_deserializer:Json_deserializers.update_host_output_of_yojson ~error_deserializer
end

module UpdateRepositoryLink = struct
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
    let open Smaws_Lib.Context in
    let input = Json_serializers.update_repository_link_input_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"CodeConnections_20231201UpdateRepositoryLink"
      ~service ~config:context.config ~http:context.http ~input
      ~output_deserializer:Json_deserializers.update_repository_link_output_of_yojson
      ~error_deserializer
end

module UpdateSyncBlocker = struct
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
    let open Smaws_Lib.Context in
    let input = Json_serializers.update_sync_blocker_input_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"CodeConnections_20231201UpdateSyncBlocker"
      ~service ~config:context.config ~http:context.http ~input
      ~output_deserializer:Json_deserializers.update_sync_blocker_output_of_yojson
      ~error_deserializer
end

module UpdateSyncConfiguration = struct
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
    let open Smaws_Lib.Context in
    let input = Json_serializers.update_sync_configuration_input_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request
      ~shape_name:"CodeConnections_20231201UpdateSyncConfiguration" ~service ~config:context.config
      ~http:context.http ~input
      ~output_deserializer:Json_deserializers.update_sync_configuration_output_of_yojson
      ~error_deserializer
end
