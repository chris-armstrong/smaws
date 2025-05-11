open Types
module CreateConnection =
  struct
    let error_deserializer tree path =
      let open Deserializers in
        let handler handler tree path =
          function
          | (_, "LimitExceededException") ->
              `LimitExceededException
                (limit_exceeded_exception_of_yojson tree path)
          | (_, "ResourceNotFoundException") ->
              `ResourceNotFoundException
                (resource_not_found_exception_of_yojson tree path)
          | (_, "ResourceUnavailableException") ->
              `ResourceUnavailableException
                (resource_unavailable_exception_of_yojson tree path)
          | _type -> handler tree path _type in
        Smaws_Lib.Protocols.AwsJson.(error_deserializer
                                       (handler
                                          Smaws_Lib.Protocols.AwsJson.Errors.default_handler)
                                       tree path)
    let request context (request : create_connection_input) =
      let open Smaws_Lib.Context in
        let open Deserializers in
          let input = Serializers.create_connection_input_to_yojson request in
          Smaws_Lib.Protocols.AwsJson.request
            ~shape_name:"CodeConnections_20231201CreateConnection" ~service
            ~config:context.config ~http:context.http ~input
            ~output_deserializer:create_connection_output_of_yojson
            ~error_deserializer
  end
module CreateHost =
  struct
    let error_deserializer tree path =
      let open Deserializers in
        let handler handler tree path =
          function
          | (_, "LimitExceededException") ->
              `LimitExceededException
                (limit_exceeded_exception_of_yojson tree path)
          | _type -> handler tree path _type in
        Smaws_Lib.Protocols.AwsJson.(error_deserializer
                                       (handler
                                          Smaws_Lib.Protocols.AwsJson.Errors.default_handler)
                                       tree path)
    let request context (request : create_host_input) =
      let open Smaws_Lib.Context in
        let open Deserializers in
          let input = Serializers.create_host_input_to_yojson request in
          Smaws_Lib.Protocols.AwsJson.request
            ~shape_name:"CodeConnections_20231201CreateHost" ~service
            ~config:context.config ~http:context.http ~input
            ~output_deserializer:create_host_output_of_yojson
            ~error_deserializer
  end
module CreateRepositoryLink =
  struct
    let error_deserializer tree path =
      let open Deserializers in
        let handler handler tree path =
          function
          | (_, "AccessDeniedException") ->
              `AccessDeniedException
                (access_denied_exception_of_yojson tree path)
          | (_, "ConcurrentModificationException") ->
              `ConcurrentModificationException
                (concurrent_modification_exception_of_yojson tree path)
          | (_, "InternalServerException") ->
              `InternalServerException
                (internal_server_exception_of_yojson tree path)
          | (_, "InvalidInputException") ->
              `InvalidInputException
                (invalid_input_exception_of_yojson tree path)
          | (_, "LimitExceededException") ->
              `LimitExceededException
                (limit_exceeded_exception_of_yojson tree path)
          | (_, "ResourceAlreadyExistsException") ->
              `ResourceAlreadyExistsException
                (resource_already_exists_exception_of_yojson tree path)
          | (_, "ThrottlingException") ->
              `ThrottlingException (throttling_exception_of_yojson tree path)
          | _type -> handler tree path _type in
        Smaws_Lib.Protocols.AwsJson.(error_deserializer
                                       (handler
                                          Smaws_Lib.Protocols.AwsJson.Errors.default_handler)
                                       tree path)
    let request context (request : create_repository_link_input) =
      let open Smaws_Lib.Context in
        let open Deserializers in
          let input =
            Serializers.create_repository_link_input_to_yojson request in
          Smaws_Lib.Protocols.AwsJson.request
            ~shape_name:"CodeConnections_20231201CreateRepositoryLink"
            ~service ~config:context.config ~http:context.http ~input
            ~output_deserializer:create_repository_link_output_of_yojson
            ~error_deserializer
  end
module CreateSyncConfiguration =
  struct
    let error_deserializer tree path =
      let open Deserializers in
        let handler handler tree path =
          function
          | (_, "AccessDeniedException") ->
              `AccessDeniedException
                (access_denied_exception_of_yojson tree path)
          | (_, "ConcurrentModificationException") ->
              `ConcurrentModificationException
                (concurrent_modification_exception_of_yojson tree path)
          | (_, "InternalServerException") ->
              `InternalServerException
                (internal_server_exception_of_yojson tree path)
          | (_, "InvalidInputException") ->
              `InvalidInputException
                (invalid_input_exception_of_yojson tree path)
          | (_, "LimitExceededException") ->
              `LimitExceededException
                (limit_exceeded_exception_of_yojson tree path)
          | (_, "ResourceAlreadyExistsException") ->
              `ResourceAlreadyExistsException
                (resource_already_exists_exception_of_yojson tree path)
          | (_, "ThrottlingException") ->
              `ThrottlingException (throttling_exception_of_yojson tree path)
          | _type -> handler tree path _type in
        Smaws_Lib.Protocols.AwsJson.(error_deserializer
                                       (handler
                                          Smaws_Lib.Protocols.AwsJson.Errors.default_handler)
                                       tree path)
    let request context (request : create_sync_configuration_input) =
      let open Smaws_Lib.Context in
        let open Deserializers in
          let input =
            Serializers.create_sync_configuration_input_to_yojson request in
          Smaws_Lib.Protocols.AwsJson.request
            ~shape_name:"CodeConnections_20231201CreateSyncConfiguration"
            ~service ~config:context.config ~http:context.http ~input
            ~output_deserializer:create_sync_configuration_output_of_yojson
            ~error_deserializer
  end
module DeleteConnection =
  struct
    let error_deserializer tree path =
      let open Deserializers in
        let handler handler tree path =
          function
          | (_, "ResourceNotFoundException") ->
              `ResourceNotFoundException
                (resource_not_found_exception_of_yojson tree path)
          | _type -> handler tree path _type in
        Smaws_Lib.Protocols.AwsJson.(error_deserializer
                                       (handler
                                          Smaws_Lib.Protocols.AwsJson.Errors.default_handler)
                                       tree path)
    let request context (request : delete_connection_input) =
      let open Smaws_Lib.Context in
        let open Deserializers in
          let input = Serializers.delete_connection_input_to_yojson request in
          Smaws_Lib.Protocols.AwsJson.request
            ~shape_name:"CodeConnections_20231201DeleteConnection" ~service
            ~config:context.config ~http:context.http ~input
            ~output_deserializer:delete_connection_output_of_yojson
            ~error_deserializer
  end
module DeleteHost =
  struct
    let error_deserializer tree path =
      let open Deserializers in
        let handler handler tree path =
          function
          | (_, "ResourceNotFoundException") ->
              `ResourceNotFoundException
                (resource_not_found_exception_of_yojson tree path)
          | (_, "ResourceUnavailableException") ->
              `ResourceUnavailableException
                (resource_unavailable_exception_of_yojson tree path)
          | _type -> handler tree path _type in
        Smaws_Lib.Protocols.AwsJson.(error_deserializer
                                       (handler
                                          Smaws_Lib.Protocols.AwsJson.Errors.default_handler)
                                       tree path)
    let request context (request : delete_host_input) =
      let open Smaws_Lib.Context in
        let open Deserializers in
          let input = Serializers.delete_host_input_to_yojson request in
          Smaws_Lib.Protocols.AwsJson.request
            ~shape_name:"CodeConnections_20231201DeleteHost" ~service
            ~config:context.config ~http:context.http ~input
            ~output_deserializer:delete_host_output_of_yojson
            ~error_deserializer
  end
module DeleteRepositoryLink =
  struct
    let error_deserializer tree path =
      let open Deserializers in
        let handler handler tree path =
          function
          | (_, "AccessDeniedException") ->
              `AccessDeniedException
                (access_denied_exception_of_yojson tree path)
          | (_, "ConcurrentModificationException") ->
              `ConcurrentModificationException
                (concurrent_modification_exception_of_yojson tree path)
          | (_, "InternalServerException") ->
              `InternalServerException
                (internal_server_exception_of_yojson tree path)
          | (_, "InvalidInputException") ->
              `InvalidInputException
                (invalid_input_exception_of_yojson tree path)
          | (_, "ResourceNotFoundException") ->
              `ResourceNotFoundException
                (resource_not_found_exception_of_yojson tree path)
          | (_, "SyncConfigurationStillExistsException") ->
              `SyncConfigurationStillExistsException
                (sync_configuration_still_exists_exception_of_yojson tree
                   path)
          | (_, "ThrottlingException") ->
              `ThrottlingException (throttling_exception_of_yojson tree path)
          | (_, "UnsupportedProviderTypeException") ->
              `UnsupportedProviderTypeException
                (unsupported_provider_type_exception_of_yojson tree path)
          | _type -> handler tree path _type in
        Smaws_Lib.Protocols.AwsJson.(error_deserializer
                                       (handler
                                          Smaws_Lib.Protocols.AwsJson.Errors.default_handler)
                                       tree path)
    let request context (request : delete_repository_link_input) =
      let open Smaws_Lib.Context in
        let open Deserializers in
          let input =
            Serializers.delete_repository_link_input_to_yojson request in
          Smaws_Lib.Protocols.AwsJson.request
            ~shape_name:"CodeConnections_20231201DeleteRepositoryLink"
            ~service ~config:context.config ~http:context.http ~input
            ~output_deserializer:delete_repository_link_output_of_yojson
            ~error_deserializer
  end
module DeleteSyncConfiguration =
  struct
    let error_deserializer tree path =
      let open Deserializers in
        let handler handler tree path =
          function
          | (_, "AccessDeniedException") ->
              `AccessDeniedException
                (access_denied_exception_of_yojson tree path)
          | (_, "ConcurrentModificationException") ->
              `ConcurrentModificationException
                (concurrent_modification_exception_of_yojson tree path)
          | (_, "InternalServerException") ->
              `InternalServerException
                (internal_server_exception_of_yojson tree path)
          | (_, "InvalidInputException") ->
              `InvalidInputException
                (invalid_input_exception_of_yojson tree path)
          | (_, "LimitExceededException") ->
              `LimitExceededException
                (limit_exceeded_exception_of_yojson tree path)
          | (_, "ThrottlingException") ->
              `ThrottlingException (throttling_exception_of_yojson tree path)
          | _type -> handler tree path _type in
        Smaws_Lib.Protocols.AwsJson.(error_deserializer
                                       (handler
                                          Smaws_Lib.Protocols.AwsJson.Errors.default_handler)
                                       tree path)
    let request context (request : delete_sync_configuration_input) =
      let open Smaws_Lib.Context in
        let open Deserializers in
          let input =
            Serializers.delete_sync_configuration_input_to_yojson request in
          Smaws_Lib.Protocols.AwsJson.request
            ~shape_name:"CodeConnections_20231201DeleteSyncConfiguration"
            ~service ~config:context.config ~http:context.http ~input
            ~output_deserializer:delete_sync_configuration_output_of_yojson
            ~error_deserializer
  end
module GetConnection =
  struct
    let error_deserializer tree path =
      let open Deserializers in
        let handler handler tree path =
          function
          | (_, "ResourceNotFoundException") ->
              `ResourceNotFoundException
                (resource_not_found_exception_of_yojson tree path)
          | (_, "ResourceUnavailableException") ->
              `ResourceUnavailableException
                (resource_unavailable_exception_of_yojson tree path)
          | _type -> handler tree path _type in
        Smaws_Lib.Protocols.AwsJson.(error_deserializer
                                       (handler
                                          Smaws_Lib.Protocols.AwsJson.Errors.default_handler)
                                       tree path)
    let request context (request : get_connection_input) =
      let open Smaws_Lib.Context in
        let open Deserializers in
          let input = Serializers.get_connection_input_to_yojson request in
          Smaws_Lib.Protocols.AwsJson.request
            ~shape_name:"CodeConnections_20231201GetConnection" ~service
            ~config:context.config ~http:context.http ~input
            ~output_deserializer:get_connection_output_of_yojson
            ~error_deserializer
  end
module GetHost =
  struct
    let error_deserializer tree path =
      let open Deserializers in
        let handler handler tree path =
          function
          | (_, "ResourceNotFoundException") ->
              `ResourceNotFoundException
                (resource_not_found_exception_of_yojson tree path)
          | (_, "ResourceUnavailableException") ->
              `ResourceUnavailableException
                (resource_unavailable_exception_of_yojson tree path)
          | _type -> handler tree path _type in
        Smaws_Lib.Protocols.AwsJson.(error_deserializer
                                       (handler
                                          Smaws_Lib.Protocols.AwsJson.Errors.default_handler)
                                       tree path)
    let request context (request : get_host_input) =
      let open Smaws_Lib.Context in
        let open Deserializers in
          let input = Serializers.get_host_input_to_yojson request in
          Smaws_Lib.Protocols.AwsJson.request
            ~shape_name:"CodeConnections_20231201GetHost" ~service
            ~config:context.config ~http:context.http ~input
            ~output_deserializer:get_host_output_of_yojson
            ~error_deserializer
  end
module GetRepositoryLink =
  struct
    let error_deserializer tree path =
      let open Deserializers in
        let handler handler tree path =
          function
          | (_, "AccessDeniedException") ->
              `AccessDeniedException
                (access_denied_exception_of_yojson tree path)
          | (_, "ConcurrentModificationException") ->
              `ConcurrentModificationException
                (concurrent_modification_exception_of_yojson tree path)
          | (_, "InternalServerException") ->
              `InternalServerException
                (internal_server_exception_of_yojson tree path)
          | (_, "InvalidInputException") ->
              `InvalidInputException
                (invalid_input_exception_of_yojson tree path)
          | (_, "ResourceNotFoundException") ->
              `ResourceNotFoundException
                (resource_not_found_exception_of_yojson tree path)
          | (_, "ThrottlingException") ->
              `ThrottlingException (throttling_exception_of_yojson tree path)
          | _type -> handler tree path _type in
        Smaws_Lib.Protocols.AwsJson.(error_deserializer
                                       (handler
                                          Smaws_Lib.Protocols.AwsJson.Errors.default_handler)
                                       tree path)
    let request context (request : get_repository_link_input) =
      let open Smaws_Lib.Context in
        let open Deserializers in
          let input = Serializers.get_repository_link_input_to_yojson request in
          Smaws_Lib.Protocols.AwsJson.request
            ~shape_name:"CodeConnections_20231201GetRepositoryLink" ~service
            ~config:context.config ~http:context.http ~input
            ~output_deserializer:get_repository_link_output_of_yojson
            ~error_deserializer
  end
module GetRepositorySyncStatus =
  struct
    let error_deserializer tree path =
      let open Deserializers in
        let handler handler tree path =
          function
          | (_, "AccessDeniedException") ->
              `AccessDeniedException
                (access_denied_exception_of_yojson tree path)
          | (_, "InternalServerException") ->
              `InternalServerException
                (internal_server_exception_of_yojson tree path)
          | (_, "InvalidInputException") ->
              `InvalidInputException
                (invalid_input_exception_of_yojson tree path)
          | (_, "ResourceNotFoundException") ->
              `ResourceNotFoundException
                (resource_not_found_exception_of_yojson tree path)
          | (_, "ThrottlingException") ->
              `ThrottlingException (throttling_exception_of_yojson tree path)
          | _type -> handler tree path _type in
        Smaws_Lib.Protocols.AwsJson.(error_deserializer
                                       (handler
                                          Smaws_Lib.Protocols.AwsJson.Errors.default_handler)
                                       tree path)
    let request context (request : get_repository_sync_status_input) =
      let open Smaws_Lib.Context in
        let open Deserializers in
          let input =
            Serializers.get_repository_sync_status_input_to_yojson request in
          Smaws_Lib.Protocols.AwsJson.request
            ~shape_name:"CodeConnections_20231201GetRepositorySyncStatus"
            ~service ~config:context.config ~http:context.http ~input
            ~output_deserializer:get_repository_sync_status_output_of_yojson
            ~error_deserializer
  end
module GetResourceSyncStatus =
  struct
    let error_deserializer tree path =
      let open Deserializers in
        let handler handler tree path =
          function
          | (_, "AccessDeniedException") ->
              `AccessDeniedException
                (access_denied_exception_of_yojson tree path)
          | (_, "InternalServerException") ->
              `InternalServerException
                (internal_server_exception_of_yojson tree path)
          | (_, "InvalidInputException") ->
              `InvalidInputException
                (invalid_input_exception_of_yojson tree path)
          | (_, "ResourceNotFoundException") ->
              `ResourceNotFoundException
                (resource_not_found_exception_of_yojson tree path)
          | (_, "ThrottlingException") ->
              `ThrottlingException (throttling_exception_of_yojson tree path)
          | _type -> handler tree path _type in
        Smaws_Lib.Protocols.AwsJson.(error_deserializer
                                       (handler
                                          Smaws_Lib.Protocols.AwsJson.Errors.default_handler)
                                       tree path)
    let request context (request : get_resource_sync_status_input) =
      let open Smaws_Lib.Context in
        let open Deserializers in
          let input =
            Serializers.get_resource_sync_status_input_to_yojson request in
          Smaws_Lib.Protocols.AwsJson.request
            ~shape_name:"CodeConnections_20231201GetResourceSyncStatus"
            ~service ~config:context.config ~http:context.http ~input
            ~output_deserializer:get_resource_sync_status_output_of_yojson
            ~error_deserializer
  end
module GetSyncBlockerSummary =
  struct
    let error_deserializer tree path =
      let open Deserializers in
        let handler handler tree path =
          function
          | (_, "AccessDeniedException") ->
              `AccessDeniedException
                (access_denied_exception_of_yojson tree path)
          | (_, "InternalServerException") ->
              `InternalServerException
                (internal_server_exception_of_yojson tree path)
          | (_, "InvalidInputException") ->
              `InvalidInputException
                (invalid_input_exception_of_yojson tree path)
          | (_, "ResourceNotFoundException") ->
              `ResourceNotFoundException
                (resource_not_found_exception_of_yojson tree path)
          | (_, "ThrottlingException") ->
              `ThrottlingException (throttling_exception_of_yojson tree path)
          | _type -> handler tree path _type in
        Smaws_Lib.Protocols.AwsJson.(error_deserializer
                                       (handler
                                          Smaws_Lib.Protocols.AwsJson.Errors.default_handler)
                                       tree path)
    let request context (request : get_sync_blocker_summary_input) =
      let open Smaws_Lib.Context in
        let open Deserializers in
          let input =
            Serializers.get_sync_blocker_summary_input_to_yojson request in
          Smaws_Lib.Protocols.AwsJson.request
            ~shape_name:"CodeConnections_20231201GetSyncBlockerSummary"
            ~service ~config:context.config ~http:context.http ~input
            ~output_deserializer:get_sync_blocker_summary_output_of_yojson
            ~error_deserializer
  end
module GetSyncConfiguration =
  struct
    let error_deserializer tree path =
      let open Deserializers in
        let handler handler tree path =
          function
          | (_, "AccessDeniedException") ->
              `AccessDeniedException
                (access_denied_exception_of_yojson tree path)
          | (_, "InternalServerException") ->
              `InternalServerException
                (internal_server_exception_of_yojson tree path)
          | (_, "InvalidInputException") ->
              `InvalidInputException
                (invalid_input_exception_of_yojson tree path)
          | (_, "ResourceNotFoundException") ->
              `ResourceNotFoundException
                (resource_not_found_exception_of_yojson tree path)
          | (_, "ThrottlingException") ->
              `ThrottlingException (throttling_exception_of_yojson tree path)
          | _type -> handler tree path _type in
        Smaws_Lib.Protocols.AwsJson.(error_deserializer
                                       (handler
                                          Smaws_Lib.Protocols.AwsJson.Errors.default_handler)
                                       tree path)
    let request context (request : get_sync_configuration_input) =
      let open Smaws_Lib.Context in
        let open Deserializers in
          let input =
            Serializers.get_sync_configuration_input_to_yojson request in
          Smaws_Lib.Protocols.AwsJson.request
            ~shape_name:"CodeConnections_20231201GetSyncConfiguration"
            ~service ~config:context.config ~http:context.http ~input
            ~output_deserializer:get_sync_configuration_output_of_yojson
            ~error_deserializer
  end
module ListConnections =
  struct
    let error_deserializer tree path =
      let open Deserializers in
        let handler handler tree path =
          function
          | (_, "ResourceNotFoundException") ->
              `ResourceNotFoundException
                (resource_not_found_exception_of_yojson tree path)
          | _type -> handler tree path _type in
        Smaws_Lib.Protocols.AwsJson.(error_deserializer
                                       (handler
                                          Smaws_Lib.Protocols.AwsJson.Errors.default_handler)
                                       tree path)
    let request context (request : list_connections_input) =
      let open Smaws_Lib.Context in
        let open Deserializers in
          let input = Serializers.list_connections_input_to_yojson request in
          Smaws_Lib.Protocols.AwsJson.request
            ~shape_name:"CodeConnections_20231201ListConnections" ~service
            ~config:context.config ~http:context.http ~input
            ~output_deserializer:list_connections_output_of_yojson
            ~error_deserializer
  end
module ListHosts =
  struct
    let error_deserializer tree path =
      let handler a = a in
      Smaws_Lib.Protocols.AwsJson.(error_deserializer
                                     (handler
                                        Smaws_Lib.Protocols.AwsJson.Errors.default_handler)
                                     tree path)
    let request context (request : list_hosts_input) =
      let open Smaws_Lib.Context in
        let open Deserializers in
          let input = Serializers.list_hosts_input_to_yojson request in
          Smaws_Lib.Protocols.AwsJson.request
            ~shape_name:"CodeConnections_20231201ListHosts" ~service
            ~config:context.config ~http:context.http ~input
            ~output_deserializer:list_hosts_output_of_yojson
            ~error_deserializer
  end
module ListRepositoryLinks =
  struct
    let error_deserializer tree path =
      let open Deserializers in
        let handler handler tree path =
          function
          | (_, "AccessDeniedException") ->
              `AccessDeniedException
                (access_denied_exception_of_yojson tree path)
          | (_, "ConcurrentModificationException") ->
              `ConcurrentModificationException
                (concurrent_modification_exception_of_yojson tree path)
          | (_, "InternalServerException") ->
              `InternalServerException
                (internal_server_exception_of_yojson tree path)
          | (_, "InvalidInputException") ->
              `InvalidInputException
                (invalid_input_exception_of_yojson tree path)
          | (_, "ResourceNotFoundException") ->
              `ResourceNotFoundException
                (resource_not_found_exception_of_yojson tree path)
          | (_, "ThrottlingException") ->
              `ThrottlingException (throttling_exception_of_yojson tree path)
          | _type -> handler tree path _type in
        Smaws_Lib.Protocols.AwsJson.(error_deserializer
                                       (handler
                                          Smaws_Lib.Protocols.AwsJson.Errors.default_handler)
                                       tree path)
    let request context (request : list_repository_links_input) =
      let open Smaws_Lib.Context in
        let open Deserializers in
          let input =
            Serializers.list_repository_links_input_to_yojson request in
          Smaws_Lib.Protocols.AwsJson.request
            ~shape_name:"CodeConnections_20231201ListRepositoryLinks"
            ~service ~config:context.config ~http:context.http ~input
            ~output_deserializer:list_repository_links_output_of_yojson
            ~error_deserializer
  end
module ListRepositorySyncDefinitions =
  struct
    let error_deserializer tree path =
      let open Deserializers in
        let handler handler tree path =
          function
          | (_, "AccessDeniedException") ->
              `AccessDeniedException
                (access_denied_exception_of_yojson tree path)
          | (_, "InternalServerException") ->
              `InternalServerException
                (internal_server_exception_of_yojson tree path)
          | (_, "InvalidInputException") ->
              `InvalidInputException
                (invalid_input_exception_of_yojson tree path)
          | (_, "ResourceNotFoundException") ->
              `ResourceNotFoundException
                (resource_not_found_exception_of_yojson tree path)
          | (_, "ThrottlingException") ->
              `ThrottlingException (throttling_exception_of_yojson tree path)
          | _type -> handler tree path _type in
        Smaws_Lib.Protocols.AwsJson.(error_deserializer
                                       (handler
                                          Smaws_Lib.Protocols.AwsJson.Errors.default_handler)
                                       tree path)
    let request context (request : list_repository_sync_definitions_input) =
      let open Smaws_Lib.Context in
        let open Deserializers in
          let input =
            Serializers.list_repository_sync_definitions_input_to_yojson
              request in
          Smaws_Lib.Protocols.AwsJson.request
            ~shape_name:"CodeConnections_20231201ListRepositorySyncDefinitions"
            ~service ~config:context.config ~http:context.http ~input
            ~output_deserializer:list_repository_sync_definitions_output_of_yojson
            ~error_deserializer
  end
module ListSyncConfigurations =
  struct
    let error_deserializer tree path =
      let open Deserializers in
        let handler handler tree path =
          function
          | (_, "AccessDeniedException") ->
              `AccessDeniedException
                (access_denied_exception_of_yojson tree path)
          | (_, "InternalServerException") ->
              `InternalServerException
                (internal_server_exception_of_yojson tree path)
          | (_, "InvalidInputException") ->
              `InvalidInputException
                (invalid_input_exception_of_yojson tree path)
          | (_, "ResourceNotFoundException") ->
              `ResourceNotFoundException
                (resource_not_found_exception_of_yojson tree path)
          | (_, "ThrottlingException") ->
              `ThrottlingException (throttling_exception_of_yojson tree path)
          | _type -> handler tree path _type in
        Smaws_Lib.Protocols.AwsJson.(error_deserializer
                                       (handler
                                          Smaws_Lib.Protocols.AwsJson.Errors.default_handler)
                                       tree path)
    let request context (request : list_sync_configurations_input) =
      let open Smaws_Lib.Context in
        let open Deserializers in
          let input =
            Serializers.list_sync_configurations_input_to_yojson request in
          Smaws_Lib.Protocols.AwsJson.request
            ~shape_name:"CodeConnections_20231201ListSyncConfigurations"
            ~service ~config:context.config ~http:context.http ~input
            ~output_deserializer:list_sync_configurations_output_of_yojson
            ~error_deserializer
  end
module ListTagsForResource =
  struct
    let error_deserializer tree path =
      let open Deserializers in
        let handler handler tree path =
          function
          | (_, "ResourceNotFoundException") ->
              `ResourceNotFoundException
                (resource_not_found_exception_of_yojson tree path)
          | _type -> handler tree path _type in
        Smaws_Lib.Protocols.AwsJson.(error_deserializer
                                       (handler
                                          Smaws_Lib.Protocols.AwsJson.Errors.default_handler)
                                       tree path)
    let request context (request : list_tags_for_resource_input) =
      let open Smaws_Lib.Context in
        let open Deserializers in
          let input =
            Serializers.list_tags_for_resource_input_to_yojson request in
          Smaws_Lib.Protocols.AwsJson.request
            ~shape_name:"CodeConnections_20231201ListTagsForResource"
            ~service ~config:context.config ~http:context.http ~input
            ~output_deserializer:list_tags_for_resource_output_of_yojson
            ~error_deserializer
  end
module TagResource =
  struct
    let error_deserializer tree path =
      let open Deserializers in
        let handler handler tree path =
          function
          | (_, "LimitExceededException") ->
              `LimitExceededException
                (limit_exceeded_exception_of_yojson tree path)
          | (_, "ResourceNotFoundException") ->
              `ResourceNotFoundException
                (resource_not_found_exception_of_yojson tree path)
          | _type -> handler tree path _type in
        Smaws_Lib.Protocols.AwsJson.(error_deserializer
                                       (handler
                                          Smaws_Lib.Protocols.AwsJson.Errors.default_handler)
                                       tree path)
    let request context (request : tag_resource_input) =
      let open Smaws_Lib.Context in
        let open Deserializers in
          let input = Serializers.tag_resource_input_to_yojson request in
          Smaws_Lib.Protocols.AwsJson.request
            ~shape_name:"CodeConnections_20231201TagResource" ~service
            ~config:context.config ~http:context.http ~input
            ~output_deserializer:tag_resource_output_of_yojson
            ~error_deserializer
  end
module UntagResource =
  struct
    let error_deserializer tree path =
      let open Deserializers in
        let handler handler tree path =
          function
          | (_, "ResourceNotFoundException") ->
              `ResourceNotFoundException
                (resource_not_found_exception_of_yojson tree path)
          | _type -> handler tree path _type in
        Smaws_Lib.Protocols.AwsJson.(error_deserializer
                                       (handler
                                          Smaws_Lib.Protocols.AwsJson.Errors.default_handler)
                                       tree path)
    let request context (request : untag_resource_input) =
      let open Smaws_Lib.Context in
        let open Deserializers in
          let input = Serializers.untag_resource_input_to_yojson request in
          Smaws_Lib.Protocols.AwsJson.request
            ~shape_name:"CodeConnections_20231201UntagResource" ~service
            ~config:context.config ~http:context.http ~input
            ~output_deserializer:untag_resource_output_of_yojson
            ~error_deserializer
  end
module UpdateHost =
  struct
    let error_deserializer tree path =
      let open Deserializers in
        let handler handler tree path =
          function
          | (_, "ConflictException") ->
              `ConflictException (conflict_exception_of_yojson tree path)
          | (_, "ResourceNotFoundException") ->
              `ResourceNotFoundException
                (resource_not_found_exception_of_yojson tree path)
          | (_, "ResourceUnavailableException") ->
              `ResourceUnavailableException
                (resource_unavailable_exception_of_yojson tree path)
          | (_, "UnsupportedOperationException") ->
              `UnsupportedOperationException
                (unsupported_operation_exception_of_yojson tree path)
          | _type -> handler tree path _type in
        Smaws_Lib.Protocols.AwsJson.(error_deserializer
                                       (handler
                                          Smaws_Lib.Protocols.AwsJson.Errors.default_handler)
                                       tree path)
    let request context (request : update_host_input) =
      let open Smaws_Lib.Context in
        let open Deserializers in
          let input = Serializers.update_host_input_to_yojson request in
          Smaws_Lib.Protocols.AwsJson.request
            ~shape_name:"CodeConnections_20231201UpdateHost" ~service
            ~config:context.config ~http:context.http ~input
            ~output_deserializer:update_host_output_of_yojson
            ~error_deserializer
  end
module UpdateRepositoryLink =
  struct
    let error_deserializer tree path =
      let open Deserializers in
        let handler handler tree path =
          function
          | (_, "AccessDeniedException") ->
              `AccessDeniedException
                (access_denied_exception_of_yojson tree path)
          | (_, "ConditionalCheckFailedException") ->
              `ConditionalCheckFailedException
                (conditional_check_failed_exception_of_yojson tree path)
          | (_, "InternalServerException") ->
              `InternalServerException
                (internal_server_exception_of_yojson tree path)
          | (_, "InvalidInputException") ->
              `InvalidInputException
                (invalid_input_exception_of_yojson tree path)
          | (_, "ResourceNotFoundException") ->
              `ResourceNotFoundException
                (resource_not_found_exception_of_yojson tree path)
          | (_, "ThrottlingException") ->
              `ThrottlingException (throttling_exception_of_yojson tree path)
          | (_, "UpdateOutOfSyncException") ->
              `UpdateOutOfSyncException
                (update_out_of_sync_exception_of_yojson tree path)
          | _type -> handler tree path _type in
        Smaws_Lib.Protocols.AwsJson.(error_deserializer
                                       (handler
                                          Smaws_Lib.Protocols.AwsJson.Errors.default_handler)
                                       tree path)
    let request context (request : update_repository_link_input) =
      let open Smaws_Lib.Context in
        let open Deserializers in
          let input =
            Serializers.update_repository_link_input_to_yojson request in
          Smaws_Lib.Protocols.AwsJson.request
            ~shape_name:"CodeConnections_20231201UpdateRepositoryLink"
            ~service ~config:context.config ~http:context.http ~input
            ~output_deserializer:update_repository_link_output_of_yojson
            ~error_deserializer
  end
module UpdateSyncBlocker =
  struct
    let error_deserializer tree path =
      let open Deserializers in
        let handler handler tree path =
          function
          | (_, "AccessDeniedException") ->
              `AccessDeniedException
                (access_denied_exception_of_yojson tree path)
          | (_, "InternalServerException") ->
              `InternalServerException
                (internal_server_exception_of_yojson tree path)
          | (_, "InvalidInputException") ->
              `InvalidInputException
                (invalid_input_exception_of_yojson tree path)
          | (_, "ResourceNotFoundException") ->
              `ResourceNotFoundException
                (resource_not_found_exception_of_yojson tree path)
          | (_, "RetryLatestCommitFailedException") ->
              `RetryLatestCommitFailedException
                (retry_latest_commit_failed_exception_of_yojson tree path)
          | (_, "SyncBlockerDoesNotExistException") ->
              `SyncBlockerDoesNotExistException
                (sync_blocker_does_not_exist_exception_of_yojson tree path)
          | (_, "ThrottlingException") ->
              `ThrottlingException (throttling_exception_of_yojson tree path)
          | _type -> handler tree path _type in
        Smaws_Lib.Protocols.AwsJson.(error_deserializer
                                       (handler
                                          Smaws_Lib.Protocols.AwsJson.Errors.default_handler)
                                       tree path)
    let request context (request : update_sync_blocker_input) =
      let open Smaws_Lib.Context in
        let open Deserializers in
          let input = Serializers.update_sync_blocker_input_to_yojson request in
          Smaws_Lib.Protocols.AwsJson.request
            ~shape_name:"CodeConnections_20231201UpdateSyncBlocker" ~service
            ~config:context.config ~http:context.http ~input
            ~output_deserializer:update_sync_blocker_output_of_yojson
            ~error_deserializer
  end
module UpdateSyncConfiguration =
  struct
    let error_deserializer tree path =
      let open Deserializers in
        let handler handler tree path =
          function
          | (_, "AccessDeniedException") ->
              `AccessDeniedException
                (access_denied_exception_of_yojson tree path)
          | (_, "ConcurrentModificationException") ->
              `ConcurrentModificationException
                (concurrent_modification_exception_of_yojson tree path)
          | (_, "InternalServerException") ->
              `InternalServerException
                (internal_server_exception_of_yojson tree path)
          | (_, "InvalidInputException") ->
              `InvalidInputException
                (invalid_input_exception_of_yojson tree path)
          | (_, "ResourceNotFoundException") ->
              `ResourceNotFoundException
                (resource_not_found_exception_of_yojson tree path)
          | (_, "ThrottlingException") ->
              `ThrottlingException (throttling_exception_of_yojson tree path)
          | (_, "UpdateOutOfSyncException") ->
              `UpdateOutOfSyncException
                (update_out_of_sync_exception_of_yojson tree path)
          | _type -> handler tree path _type in
        Smaws_Lib.Protocols.AwsJson.(error_deserializer
                                       (handler
                                          Smaws_Lib.Protocols.AwsJson.Errors.default_handler)
                                       tree path)
    let request context (request : update_sync_configuration_input) =
      let open Smaws_Lib.Context in
        let open Deserializers in
          let input =
            Serializers.update_sync_configuration_input_to_yojson request in
          Smaws_Lib.Protocols.AwsJson.request
            ~shape_name:"CodeConnections_20231201UpdateSyncConfiguration"
            ~service ~config:context.config ~http:context.http ~input
            ~output_deserializer:update_sync_configuration_output_of_yojson
            ~error_deserializer
  end