open Types
open Service_metadata

module UpdateTaskSet = struct
  let error_to_string = function
    | `AccessDeniedException _ -> "com.amazonaws.ecs#AccessDeniedException"
    | `ClientException _ -> "com.amazonaws.ecs#ClientException"
    | `ClusterNotFoundException _ -> "com.amazonaws.ecs#ClusterNotFoundException"
    | `InvalidParameterException _ -> "com.amazonaws.ecs#InvalidParameterException"
    | `LimitExceededException _ -> "com.amazonaws.ecs#LimitExceededException"
    | `ServerException _ -> "com.amazonaws.ecs#ServerException"
    | `ServiceNotActiveException _ -> "com.amazonaws.ecs#ServiceNotActiveException"
    | `ServiceNotFoundException _ -> "com.amazonaws.ecs#ServiceNotFoundException"
    | `TaskSetNotFoundException _ -> "com.amazonaws.ecs#TaskSetNotFoundException"
    | `UnsupportedFeatureException _ -> "com.amazonaws.ecs#UnsupportedFeatureException"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "AccessDeniedException" ->
          `AccessDeniedException (Json_deserializers.access_denied_exception_of_yojson tree path)
      | _, "ClientException" ->
          `ClientException (Json_deserializers.client_exception_of_yojson tree path)
      | _, "ClusterNotFoundException" ->
          `ClusterNotFoundException
            (Json_deserializers.cluster_not_found_exception_of_yojson tree path)
      | _, "InvalidParameterException" ->
          `InvalidParameterException
            (Json_deserializers.invalid_parameter_exception_of_yojson tree path)
      | _, "LimitExceededException" ->
          `LimitExceededException (Json_deserializers.limit_exceeded_exception_of_yojson tree path)
      | _, "ServerException" ->
          `ServerException (Json_deserializers.server_exception_of_yojson tree path)
      | _, "ServiceNotActiveException" ->
          `ServiceNotActiveException
            (Json_deserializers.service_not_active_exception_of_yojson tree path)
      | _, "ServiceNotFoundException" ->
          `ServiceNotFoundException
            (Json_deserializers.service_not_found_exception_of_yojson tree path)
      | _, "TaskSetNotFoundException" ->
          `TaskSetNotFoundException
            (Json_deserializers.task_set_not_found_exception_of_yojson tree path)
      | _, "UnsupportedFeatureException" ->
          `UnsupportedFeatureException
            (Json_deserializers.unsupported_feature_exception_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : update_task_set_request) =
    let input = Json_serializers.update_task_set_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request
      ~shape_name:"AmazonEC2ContainerServiceV20141113.UpdateTaskSet" ~service ~context ~input
      ~output_deserializer:Json_deserializers.update_task_set_response_of_yojson ~error_deserializer

  let request_with_metadata context (request : update_task_set_request) =
    let input = Json_serializers.update_task_set_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata
      ~shape_name:"AmazonEC2ContainerServiceV20141113.UpdateTaskSet" ~service ~context ~input
      ~output_deserializer:Json_deserializers.update_task_set_response_of_yojson ~error_deserializer
end

module UpdateTaskProtection = struct
  let error_to_string = function
    | `AccessDeniedException _ -> "com.amazonaws.ecs#AccessDeniedException"
    | `ClientException _ -> "com.amazonaws.ecs#ClientException"
    | `ClusterNotFoundException _ -> "com.amazonaws.ecs#ClusterNotFoundException"
    | `InvalidParameterException _ -> "com.amazonaws.ecs#InvalidParameterException"
    | `ResourceNotFoundException _ -> "com.amazonaws.ecs#ResourceNotFoundException"
    | `ServerException _ -> "com.amazonaws.ecs#ServerException"
    | `UnsupportedFeatureException _ -> "com.amazonaws.ecs#UnsupportedFeatureException"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "AccessDeniedException" ->
          `AccessDeniedException (Json_deserializers.access_denied_exception_of_yojson tree path)
      | _, "ClientException" ->
          `ClientException (Json_deserializers.client_exception_of_yojson tree path)
      | _, "ClusterNotFoundException" ->
          `ClusterNotFoundException
            (Json_deserializers.cluster_not_found_exception_of_yojson tree path)
      | _, "InvalidParameterException" ->
          `InvalidParameterException
            (Json_deserializers.invalid_parameter_exception_of_yojson tree path)
      | _, "ResourceNotFoundException" ->
          `ResourceNotFoundException
            (Json_deserializers.resource_not_found_exception_of_yojson tree path)
      | _, "ServerException" ->
          `ServerException (Json_deserializers.server_exception_of_yojson tree path)
      | _, "UnsupportedFeatureException" ->
          `UnsupportedFeatureException
            (Json_deserializers.unsupported_feature_exception_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : update_task_protection_request) =
    let input = Json_serializers.update_task_protection_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request
      ~shape_name:"AmazonEC2ContainerServiceV20141113.UpdateTaskProtection" ~service ~context ~input
      ~output_deserializer:Json_deserializers.update_task_protection_response_of_yojson
      ~error_deserializer

  let request_with_metadata context (request : update_task_protection_request) =
    let input = Json_serializers.update_task_protection_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata
      ~shape_name:"AmazonEC2ContainerServiceV20141113.UpdateTaskProtection" ~service ~context ~input
      ~output_deserializer:Json_deserializers.update_task_protection_response_of_yojson
      ~error_deserializer
end

module UpdateServicePrimaryTaskSet = struct
  let error_to_string = function
    | `AccessDeniedException _ -> "com.amazonaws.ecs#AccessDeniedException"
    | `ClientException _ -> "com.amazonaws.ecs#ClientException"
    | `ClusterNotFoundException _ -> "com.amazonaws.ecs#ClusterNotFoundException"
    | `InvalidParameterException _ -> "com.amazonaws.ecs#InvalidParameterException"
    | `ServerException _ -> "com.amazonaws.ecs#ServerException"
    | `ServiceNotActiveException _ -> "com.amazonaws.ecs#ServiceNotActiveException"
    | `ServiceNotFoundException _ -> "com.amazonaws.ecs#ServiceNotFoundException"
    | `TaskSetNotFoundException _ -> "com.amazonaws.ecs#TaskSetNotFoundException"
    | `UnsupportedFeatureException _ -> "com.amazonaws.ecs#UnsupportedFeatureException"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "AccessDeniedException" ->
          `AccessDeniedException (Json_deserializers.access_denied_exception_of_yojson tree path)
      | _, "ClientException" ->
          `ClientException (Json_deserializers.client_exception_of_yojson tree path)
      | _, "ClusterNotFoundException" ->
          `ClusterNotFoundException
            (Json_deserializers.cluster_not_found_exception_of_yojson tree path)
      | _, "InvalidParameterException" ->
          `InvalidParameterException
            (Json_deserializers.invalid_parameter_exception_of_yojson tree path)
      | _, "ServerException" ->
          `ServerException (Json_deserializers.server_exception_of_yojson tree path)
      | _, "ServiceNotActiveException" ->
          `ServiceNotActiveException
            (Json_deserializers.service_not_active_exception_of_yojson tree path)
      | _, "ServiceNotFoundException" ->
          `ServiceNotFoundException
            (Json_deserializers.service_not_found_exception_of_yojson tree path)
      | _, "TaskSetNotFoundException" ->
          `TaskSetNotFoundException
            (Json_deserializers.task_set_not_found_exception_of_yojson tree path)
      | _, "UnsupportedFeatureException" ->
          `UnsupportedFeatureException
            (Json_deserializers.unsupported_feature_exception_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : update_service_primary_task_set_request) =
    let input = Json_serializers.update_service_primary_task_set_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request
      ~shape_name:"AmazonEC2ContainerServiceV20141113.UpdateServicePrimaryTaskSet" ~service ~context
      ~input
      ~output_deserializer:Json_deserializers.update_service_primary_task_set_response_of_yojson
      ~error_deserializer

  let request_with_metadata context (request : update_service_primary_task_set_request) =
    let input = Json_serializers.update_service_primary_task_set_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata
      ~shape_name:"AmazonEC2ContainerServiceV20141113.UpdateServicePrimaryTaskSet" ~service ~context
      ~input
      ~output_deserializer:Json_deserializers.update_service_primary_task_set_response_of_yojson
      ~error_deserializer
end

module UpdateService = struct
  let error_to_string = function
    | `AccessDeniedException _ -> "com.amazonaws.ecs#AccessDeniedException"
    | `ClientException _ -> "com.amazonaws.ecs#ClientException"
    | `ClusterNotFoundException _ -> "com.amazonaws.ecs#ClusterNotFoundException"
    | `InvalidParameterException _ -> "com.amazonaws.ecs#InvalidParameterException"
    | `NamespaceNotFoundException _ -> "com.amazonaws.ecs#NamespaceNotFoundException"
    | `PlatformTaskDefinitionIncompatibilityException _ ->
        "com.amazonaws.ecs#PlatformTaskDefinitionIncompatibilityException"
    | `PlatformUnknownException _ -> "com.amazonaws.ecs#PlatformUnknownException"
    | `ServerException _ -> "com.amazonaws.ecs#ServerException"
    | `ServiceNotActiveException _ -> "com.amazonaws.ecs#ServiceNotActiveException"
    | `ServiceNotFoundException _ -> "com.amazonaws.ecs#ServiceNotFoundException"
    | `UnsupportedFeatureException _ -> "com.amazonaws.ecs#UnsupportedFeatureException"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "AccessDeniedException" ->
          `AccessDeniedException (Json_deserializers.access_denied_exception_of_yojson tree path)
      | _, "ClientException" ->
          `ClientException (Json_deserializers.client_exception_of_yojson tree path)
      | _, "ClusterNotFoundException" ->
          `ClusterNotFoundException
            (Json_deserializers.cluster_not_found_exception_of_yojson tree path)
      | _, "InvalidParameterException" ->
          `InvalidParameterException
            (Json_deserializers.invalid_parameter_exception_of_yojson tree path)
      | _, "NamespaceNotFoundException" ->
          `NamespaceNotFoundException
            (Json_deserializers.namespace_not_found_exception_of_yojson tree path)
      | _, "PlatformTaskDefinitionIncompatibilityException" ->
          `PlatformTaskDefinitionIncompatibilityException
            (Json_deserializers.platform_task_definition_incompatibility_exception_of_yojson tree
               path)
      | _, "PlatformUnknownException" ->
          `PlatformUnknownException
            (Json_deserializers.platform_unknown_exception_of_yojson tree path)
      | _, "ServerException" ->
          `ServerException (Json_deserializers.server_exception_of_yojson tree path)
      | _, "ServiceNotActiveException" ->
          `ServiceNotActiveException
            (Json_deserializers.service_not_active_exception_of_yojson tree path)
      | _, "ServiceNotFoundException" ->
          `ServiceNotFoundException
            (Json_deserializers.service_not_found_exception_of_yojson tree path)
      | _, "UnsupportedFeatureException" ->
          `UnsupportedFeatureException
            (Json_deserializers.unsupported_feature_exception_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : update_service_request) =
    let input = Json_serializers.update_service_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request
      ~shape_name:"AmazonEC2ContainerServiceV20141113.UpdateService" ~service ~context ~input
      ~output_deserializer:Json_deserializers.update_service_response_of_yojson ~error_deserializer

  let request_with_metadata context (request : update_service_request) =
    let input = Json_serializers.update_service_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata
      ~shape_name:"AmazonEC2ContainerServiceV20141113.UpdateService" ~service ~context ~input
      ~output_deserializer:Json_deserializers.update_service_response_of_yojson ~error_deserializer
end

module UpdateExpressGatewayService = struct
  let error_to_string = function
    | `AccessDeniedException _ -> "com.amazonaws.ecs#AccessDeniedException"
    | `ClientException _ -> "com.amazonaws.ecs#ClientException"
    | `ClusterNotFoundException _ -> "com.amazonaws.ecs#ClusterNotFoundException"
    | `InvalidParameterException _ -> "com.amazonaws.ecs#InvalidParameterException"
    | `ServerException _ -> "com.amazonaws.ecs#ServerException"
    | `ServiceNotActiveException _ -> "com.amazonaws.ecs#ServiceNotActiveException"
    | `ServiceNotFoundException _ -> "com.amazonaws.ecs#ServiceNotFoundException"
    | `UnsupportedFeatureException _ -> "com.amazonaws.ecs#UnsupportedFeatureException"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "AccessDeniedException" ->
          `AccessDeniedException (Json_deserializers.access_denied_exception_of_yojson tree path)
      | _, "ClientException" ->
          `ClientException (Json_deserializers.client_exception_of_yojson tree path)
      | _, "ClusterNotFoundException" ->
          `ClusterNotFoundException
            (Json_deserializers.cluster_not_found_exception_of_yojson tree path)
      | _, "InvalidParameterException" ->
          `InvalidParameterException
            (Json_deserializers.invalid_parameter_exception_of_yojson tree path)
      | _, "ServerException" ->
          `ServerException (Json_deserializers.server_exception_of_yojson tree path)
      | _, "ServiceNotActiveException" ->
          `ServiceNotActiveException
            (Json_deserializers.service_not_active_exception_of_yojson tree path)
      | _, "ServiceNotFoundException" ->
          `ServiceNotFoundException
            (Json_deserializers.service_not_found_exception_of_yojson tree path)
      | _, "UnsupportedFeatureException" ->
          `UnsupportedFeatureException
            (Json_deserializers.unsupported_feature_exception_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : update_express_gateway_service_request) =
    let input = Json_serializers.update_express_gateway_service_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request
      ~shape_name:"AmazonEC2ContainerServiceV20141113.UpdateExpressGatewayService" ~service ~context
      ~input
      ~output_deserializer:Json_deserializers.update_express_gateway_service_response_of_yojson
      ~error_deserializer

  let request_with_metadata context (request : update_express_gateway_service_request) =
    let input = Json_serializers.update_express_gateway_service_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata
      ~shape_name:"AmazonEC2ContainerServiceV20141113.UpdateExpressGatewayService" ~service ~context
      ~input
      ~output_deserializer:Json_deserializers.update_express_gateway_service_response_of_yojson
      ~error_deserializer
end

module UpdateDaemon = struct
  let error_to_string = function
    | `AccessDeniedException _ -> "com.amazonaws.ecs#AccessDeniedException"
    | `ClientException _ -> "com.amazonaws.ecs#ClientException"
    | `ClusterNotFoundException _ -> "com.amazonaws.ecs#ClusterNotFoundException"
    | `DaemonNotActiveException _ -> "com.amazonaws.ecs#DaemonNotActiveException"
    | `DaemonNotFoundException _ -> "com.amazonaws.ecs#DaemonNotFoundException"
    | `InvalidParameterException _ -> "com.amazonaws.ecs#InvalidParameterException"
    | `PlatformUnknownException _ -> "com.amazonaws.ecs#PlatformUnknownException"
    | `ServerException _ -> "com.amazonaws.ecs#ServerException"
    | `UnsupportedFeatureException _ -> "com.amazonaws.ecs#UnsupportedFeatureException"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "AccessDeniedException" ->
          `AccessDeniedException (Json_deserializers.access_denied_exception_of_yojson tree path)
      | _, "ClientException" ->
          `ClientException (Json_deserializers.client_exception_of_yojson tree path)
      | _, "ClusterNotFoundException" ->
          `ClusterNotFoundException
            (Json_deserializers.cluster_not_found_exception_of_yojson tree path)
      | _, "DaemonNotActiveException" ->
          `DaemonNotActiveException
            (Json_deserializers.daemon_not_active_exception_of_yojson tree path)
      | _, "DaemonNotFoundException" ->
          `DaemonNotFoundException
            (Json_deserializers.daemon_not_found_exception_of_yojson tree path)
      | _, "InvalidParameterException" ->
          `InvalidParameterException
            (Json_deserializers.invalid_parameter_exception_of_yojson tree path)
      | _, "PlatformUnknownException" ->
          `PlatformUnknownException
            (Json_deserializers.platform_unknown_exception_of_yojson tree path)
      | _, "ServerException" ->
          `ServerException (Json_deserializers.server_exception_of_yojson tree path)
      | _, "UnsupportedFeatureException" ->
          `UnsupportedFeatureException
            (Json_deserializers.unsupported_feature_exception_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : update_daemon_request) =
    let input = Json_serializers.update_daemon_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request
      ~shape_name:"AmazonEC2ContainerServiceV20141113.UpdateDaemon" ~service ~context ~input
      ~output_deserializer:Json_deserializers.update_daemon_response_of_yojson ~error_deserializer

  let request_with_metadata context (request : update_daemon_request) =
    let input = Json_serializers.update_daemon_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata
      ~shape_name:"AmazonEC2ContainerServiceV20141113.UpdateDaemon" ~service ~context ~input
      ~output_deserializer:Json_deserializers.update_daemon_response_of_yojson ~error_deserializer
end

module UpdateContainerInstancesState = struct
  let error_to_string = function
    | `AccessDeniedException _ -> "com.amazonaws.ecs#AccessDeniedException"
    | `ClientException _ -> "com.amazonaws.ecs#ClientException"
    | `ClusterNotFoundException _ -> "com.amazonaws.ecs#ClusterNotFoundException"
    | `InvalidParameterException _ -> "com.amazonaws.ecs#InvalidParameterException"
    | `ServerException _ -> "com.amazonaws.ecs#ServerException"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "AccessDeniedException" ->
          `AccessDeniedException (Json_deserializers.access_denied_exception_of_yojson tree path)
      | _, "ClientException" ->
          `ClientException (Json_deserializers.client_exception_of_yojson tree path)
      | _, "ClusterNotFoundException" ->
          `ClusterNotFoundException
            (Json_deserializers.cluster_not_found_exception_of_yojson tree path)
      | _, "InvalidParameterException" ->
          `InvalidParameterException
            (Json_deserializers.invalid_parameter_exception_of_yojson tree path)
      | _, "ServerException" ->
          `ServerException (Json_deserializers.server_exception_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : update_container_instances_state_request) =
    let input = Json_serializers.update_container_instances_state_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request
      ~shape_name:"AmazonEC2ContainerServiceV20141113.UpdateContainerInstancesState" ~service
      ~context ~input
      ~output_deserializer:Json_deserializers.update_container_instances_state_response_of_yojson
      ~error_deserializer

  let request_with_metadata context (request : update_container_instances_state_request) =
    let input = Json_serializers.update_container_instances_state_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata
      ~shape_name:"AmazonEC2ContainerServiceV20141113.UpdateContainerInstancesState" ~service
      ~context ~input
      ~output_deserializer:Json_deserializers.update_container_instances_state_response_of_yojson
      ~error_deserializer
end

module UpdateContainerAgent = struct
  let error_to_string = function
    | `AccessDeniedException _ -> "com.amazonaws.ecs#AccessDeniedException"
    | `ClientException _ -> "com.amazonaws.ecs#ClientException"
    | `ClusterNotFoundException _ -> "com.amazonaws.ecs#ClusterNotFoundException"
    | `InvalidParameterException _ -> "com.amazonaws.ecs#InvalidParameterException"
    | `MissingVersionException _ -> "com.amazonaws.ecs#MissingVersionException"
    | `NoUpdateAvailableException _ -> "com.amazonaws.ecs#NoUpdateAvailableException"
    | `ServerException _ -> "com.amazonaws.ecs#ServerException"
    | `UpdateInProgressException _ -> "com.amazonaws.ecs#UpdateInProgressException"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "AccessDeniedException" ->
          `AccessDeniedException (Json_deserializers.access_denied_exception_of_yojson tree path)
      | _, "ClientException" ->
          `ClientException (Json_deserializers.client_exception_of_yojson tree path)
      | _, "ClusterNotFoundException" ->
          `ClusterNotFoundException
            (Json_deserializers.cluster_not_found_exception_of_yojson tree path)
      | _, "InvalidParameterException" ->
          `InvalidParameterException
            (Json_deserializers.invalid_parameter_exception_of_yojson tree path)
      | _, "MissingVersionException" ->
          `MissingVersionException
            (Json_deserializers.missing_version_exception_of_yojson tree path)
      | _, "NoUpdateAvailableException" ->
          `NoUpdateAvailableException
            (Json_deserializers.no_update_available_exception_of_yojson tree path)
      | _, "ServerException" ->
          `ServerException (Json_deserializers.server_exception_of_yojson tree path)
      | _, "UpdateInProgressException" ->
          `UpdateInProgressException
            (Json_deserializers.update_in_progress_exception_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : update_container_agent_request) =
    let input = Json_serializers.update_container_agent_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request
      ~shape_name:"AmazonEC2ContainerServiceV20141113.UpdateContainerAgent" ~service ~context ~input
      ~output_deserializer:Json_deserializers.update_container_agent_response_of_yojson
      ~error_deserializer

  let request_with_metadata context (request : update_container_agent_request) =
    let input = Json_serializers.update_container_agent_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata
      ~shape_name:"AmazonEC2ContainerServiceV20141113.UpdateContainerAgent" ~service ~context ~input
      ~output_deserializer:Json_deserializers.update_container_agent_response_of_yojson
      ~error_deserializer
end

module UpdateClusterSettings = struct
  let error_to_string = function
    | `AccessDeniedException _ -> "com.amazonaws.ecs#AccessDeniedException"
    | `ClientException _ -> "com.amazonaws.ecs#ClientException"
    | `ClusterNotFoundException _ -> "com.amazonaws.ecs#ClusterNotFoundException"
    | `InvalidParameterException _ -> "com.amazonaws.ecs#InvalidParameterException"
    | `ServerException _ -> "com.amazonaws.ecs#ServerException"
    | `UpdateInProgressException _ -> "com.amazonaws.ecs#UpdateInProgressException"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "AccessDeniedException" ->
          `AccessDeniedException (Json_deserializers.access_denied_exception_of_yojson tree path)
      | _, "ClientException" ->
          `ClientException (Json_deserializers.client_exception_of_yojson tree path)
      | _, "ClusterNotFoundException" ->
          `ClusterNotFoundException
            (Json_deserializers.cluster_not_found_exception_of_yojson tree path)
      | _, "InvalidParameterException" ->
          `InvalidParameterException
            (Json_deserializers.invalid_parameter_exception_of_yojson tree path)
      | _, "ServerException" ->
          `ServerException (Json_deserializers.server_exception_of_yojson tree path)
      | _, "UpdateInProgressException" ->
          `UpdateInProgressException
            (Json_deserializers.update_in_progress_exception_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : update_cluster_settings_request) =
    let input = Json_serializers.update_cluster_settings_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request
      ~shape_name:"AmazonEC2ContainerServiceV20141113.UpdateClusterSettings" ~service ~context
      ~input ~output_deserializer:Json_deserializers.update_cluster_settings_response_of_yojson
      ~error_deserializer

  let request_with_metadata context (request : update_cluster_settings_request) =
    let input = Json_serializers.update_cluster_settings_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata
      ~shape_name:"AmazonEC2ContainerServiceV20141113.UpdateClusterSettings" ~service ~context
      ~input ~output_deserializer:Json_deserializers.update_cluster_settings_response_of_yojson
      ~error_deserializer
end

module UpdateCluster = struct
  let error_to_string = function
    | `AccessDeniedException _ -> "com.amazonaws.ecs#AccessDeniedException"
    | `ClientException _ -> "com.amazonaws.ecs#ClientException"
    | `ClusterNotFoundException _ -> "com.amazonaws.ecs#ClusterNotFoundException"
    | `InvalidParameterException _ -> "com.amazonaws.ecs#InvalidParameterException"
    | `NamespaceNotFoundException _ -> "com.amazonaws.ecs#NamespaceNotFoundException"
    | `ServerException _ -> "com.amazonaws.ecs#ServerException"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "AccessDeniedException" ->
          `AccessDeniedException (Json_deserializers.access_denied_exception_of_yojson tree path)
      | _, "ClientException" ->
          `ClientException (Json_deserializers.client_exception_of_yojson tree path)
      | _, "ClusterNotFoundException" ->
          `ClusterNotFoundException
            (Json_deserializers.cluster_not_found_exception_of_yojson tree path)
      | _, "InvalidParameterException" ->
          `InvalidParameterException
            (Json_deserializers.invalid_parameter_exception_of_yojson tree path)
      | _, "NamespaceNotFoundException" ->
          `NamespaceNotFoundException
            (Json_deserializers.namespace_not_found_exception_of_yojson tree path)
      | _, "ServerException" ->
          `ServerException (Json_deserializers.server_exception_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : update_cluster_request) =
    let input = Json_serializers.update_cluster_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request
      ~shape_name:"AmazonEC2ContainerServiceV20141113.UpdateCluster" ~service ~context ~input
      ~output_deserializer:Json_deserializers.update_cluster_response_of_yojson ~error_deserializer

  let request_with_metadata context (request : update_cluster_request) =
    let input = Json_serializers.update_cluster_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata
      ~shape_name:"AmazonEC2ContainerServiceV20141113.UpdateCluster" ~service ~context ~input
      ~output_deserializer:Json_deserializers.update_cluster_response_of_yojson ~error_deserializer
end

module UpdateCapacityProvider = struct
  let error_to_string = function
    | `AccessDeniedException _ -> "com.amazonaws.ecs#AccessDeniedException"
    | `ClientException _ -> "com.amazonaws.ecs#ClientException"
    | `ClusterNotFoundException _ -> "com.amazonaws.ecs#ClusterNotFoundException"
    | `InvalidParameterException _ -> "com.amazonaws.ecs#InvalidParameterException"
    | `ServerException _ -> "com.amazonaws.ecs#ServerException"
    | `UnsupportedFeatureException _ -> "com.amazonaws.ecs#UnsupportedFeatureException"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "AccessDeniedException" ->
          `AccessDeniedException (Json_deserializers.access_denied_exception_of_yojson tree path)
      | _, "ClientException" ->
          `ClientException (Json_deserializers.client_exception_of_yojson tree path)
      | _, "ClusterNotFoundException" ->
          `ClusterNotFoundException
            (Json_deserializers.cluster_not_found_exception_of_yojson tree path)
      | _, "InvalidParameterException" ->
          `InvalidParameterException
            (Json_deserializers.invalid_parameter_exception_of_yojson tree path)
      | _, "ServerException" ->
          `ServerException (Json_deserializers.server_exception_of_yojson tree path)
      | _, "UnsupportedFeatureException" ->
          `UnsupportedFeatureException
            (Json_deserializers.unsupported_feature_exception_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : update_capacity_provider_request) =
    let input = Json_serializers.update_capacity_provider_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request
      ~shape_name:"AmazonEC2ContainerServiceV20141113.UpdateCapacityProvider" ~service ~context
      ~input ~output_deserializer:Json_deserializers.update_capacity_provider_response_of_yojson
      ~error_deserializer

  let request_with_metadata context (request : update_capacity_provider_request) =
    let input = Json_serializers.update_capacity_provider_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata
      ~shape_name:"AmazonEC2ContainerServiceV20141113.UpdateCapacityProvider" ~service ~context
      ~input ~output_deserializer:Json_deserializers.update_capacity_provider_response_of_yojson
      ~error_deserializer
end

module SubmitTaskStateChange = struct
  let error_to_string = function
    | `AccessDeniedException _ -> "com.amazonaws.ecs#AccessDeniedException"
    | `ClientException _ -> "com.amazonaws.ecs#ClientException"
    | `ClusterNotFoundException _ -> "com.amazonaws.ecs#ClusterNotFoundException"
    | `InvalidParameterException _ -> "com.amazonaws.ecs#InvalidParameterException"
    | `ServerException _ -> "com.amazonaws.ecs#ServerException"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "AccessDeniedException" ->
          `AccessDeniedException (Json_deserializers.access_denied_exception_of_yojson tree path)
      | _, "ClientException" ->
          `ClientException (Json_deserializers.client_exception_of_yojson tree path)
      | _, "ClusterNotFoundException" ->
          `ClusterNotFoundException
            (Json_deserializers.cluster_not_found_exception_of_yojson tree path)
      | _, "InvalidParameterException" ->
          `InvalidParameterException
            (Json_deserializers.invalid_parameter_exception_of_yojson tree path)
      | _, "ServerException" ->
          `ServerException (Json_deserializers.server_exception_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : submit_task_state_change_request) =
    let input = Json_serializers.submit_task_state_change_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request
      ~shape_name:"AmazonEC2ContainerServiceV20141113.SubmitTaskStateChange" ~service ~context
      ~input ~output_deserializer:Json_deserializers.submit_task_state_change_response_of_yojson
      ~error_deserializer

  let request_with_metadata context (request : submit_task_state_change_request) =
    let input = Json_serializers.submit_task_state_change_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata
      ~shape_name:"AmazonEC2ContainerServiceV20141113.SubmitTaskStateChange" ~service ~context
      ~input ~output_deserializer:Json_deserializers.submit_task_state_change_response_of_yojson
      ~error_deserializer
end

module SubmitContainerStateChange = struct
  let error_to_string = function
    | `AccessDeniedException _ -> "com.amazonaws.ecs#AccessDeniedException"
    | `ClientException _ -> "com.amazonaws.ecs#ClientException"
    | `ClusterNotFoundException _ -> "com.amazonaws.ecs#ClusterNotFoundException"
    | `InvalidParameterException _ -> "com.amazonaws.ecs#InvalidParameterException"
    | `ServerException _ -> "com.amazonaws.ecs#ServerException"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "AccessDeniedException" ->
          `AccessDeniedException (Json_deserializers.access_denied_exception_of_yojson tree path)
      | _, "ClientException" ->
          `ClientException (Json_deserializers.client_exception_of_yojson tree path)
      | _, "ClusterNotFoundException" ->
          `ClusterNotFoundException
            (Json_deserializers.cluster_not_found_exception_of_yojson tree path)
      | _, "InvalidParameterException" ->
          `InvalidParameterException
            (Json_deserializers.invalid_parameter_exception_of_yojson tree path)
      | _, "ServerException" ->
          `ServerException (Json_deserializers.server_exception_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : submit_container_state_change_request) =
    let input = Json_serializers.submit_container_state_change_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request
      ~shape_name:"AmazonEC2ContainerServiceV20141113.SubmitContainerStateChange" ~service ~context
      ~input
      ~output_deserializer:Json_deserializers.submit_container_state_change_response_of_yojson
      ~error_deserializer

  let request_with_metadata context (request : submit_container_state_change_request) =
    let input = Json_serializers.submit_container_state_change_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata
      ~shape_name:"AmazonEC2ContainerServiceV20141113.SubmitContainerStateChange" ~service ~context
      ~input
      ~output_deserializer:Json_deserializers.submit_container_state_change_response_of_yojson
      ~error_deserializer
end

module SubmitAttachmentStateChanges = struct
  let error_to_string = function
    | `AccessDeniedException _ -> "com.amazonaws.ecs#AccessDeniedException"
    | `ClientException _ -> "com.amazonaws.ecs#ClientException"
    | `ClusterNotFoundException _ -> "com.amazonaws.ecs#ClusterNotFoundException"
    | `InvalidParameterException _ -> "com.amazonaws.ecs#InvalidParameterException"
    | `ServerException _ -> "com.amazonaws.ecs#ServerException"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "AccessDeniedException" ->
          `AccessDeniedException (Json_deserializers.access_denied_exception_of_yojson tree path)
      | _, "ClientException" ->
          `ClientException (Json_deserializers.client_exception_of_yojson tree path)
      | _, "ClusterNotFoundException" ->
          `ClusterNotFoundException
            (Json_deserializers.cluster_not_found_exception_of_yojson tree path)
      | _, "InvalidParameterException" ->
          `InvalidParameterException
            (Json_deserializers.invalid_parameter_exception_of_yojson tree path)
      | _, "ServerException" ->
          `ServerException (Json_deserializers.server_exception_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : submit_attachment_state_changes_request) =
    let input = Json_serializers.submit_attachment_state_changes_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request
      ~shape_name:"AmazonEC2ContainerServiceV20141113.SubmitAttachmentStateChanges" ~service
      ~context ~input
      ~output_deserializer:Json_deserializers.submit_attachment_state_changes_response_of_yojson
      ~error_deserializer

  let request_with_metadata context (request : submit_attachment_state_changes_request) =
    let input = Json_serializers.submit_attachment_state_changes_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata
      ~shape_name:"AmazonEC2ContainerServiceV20141113.SubmitAttachmentStateChanges" ~service
      ~context ~input
      ~output_deserializer:Json_deserializers.submit_attachment_state_changes_response_of_yojson
      ~error_deserializer
end

module StopTask = struct
  let error_to_string = function
    | `AccessDeniedException _ -> "com.amazonaws.ecs#AccessDeniedException"
    | `ClientException _ -> "com.amazonaws.ecs#ClientException"
    | `ClusterNotFoundException _ -> "com.amazonaws.ecs#ClusterNotFoundException"
    | `InvalidParameterException _ -> "com.amazonaws.ecs#InvalidParameterException"
    | `ServerException _ -> "com.amazonaws.ecs#ServerException"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "AccessDeniedException" ->
          `AccessDeniedException (Json_deserializers.access_denied_exception_of_yojson tree path)
      | _, "ClientException" ->
          `ClientException (Json_deserializers.client_exception_of_yojson tree path)
      | _, "ClusterNotFoundException" ->
          `ClusterNotFoundException
            (Json_deserializers.cluster_not_found_exception_of_yojson tree path)
      | _, "InvalidParameterException" ->
          `InvalidParameterException
            (Json_deserializers.invalid_parameter_exception_of_yojson tree path)
      | _, "ServerException" ->
          `ServerException (Json_deserializers.server_exception_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : stop_task_request) =
    let input = Json_serializers.stop_task_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"AmazonEC2ContainerServiceV20141113.StopTask"
      ~service ~context ~input ~output_deserializer:Json_deserializers.stop_task_response_of_yojson
      ~error_deserializer

  let request_with_metadata context (request : stop_task_request) =
    let input = Json_serializers.stop_task_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata
      ~shape_name:"AmazonEC2ContainerServiceV20141113.StopTask" ~service ~context ~input
      ~output_deserializer:Json_deserializers.stop_task_response_of_yojson ~error_deserializer
end

module StopServiceDeployment = struct
  let error_to_string = function
    | `AccessDeniedException _ -> "com.amazonaws.ecs#AccessDeniedException"
    | `ClientException _ -> "com.amazonaws.ecs#ClientException"
    | `ConflictException _ -> "com.amazonaws.ecs#ConflictException"
    | `InvalidParameterException _ -> "com.amazonaws.ecs#InvalidParameterException"
    | `ServerException _ -> "com.amazonaws.ecs#ServerException"
    | `ServiceDeploymentNotFoundException _ ->
        "com.amazonaws.ecs#ServiceDeploymentNotFoundException"
    | `UnsupportedFeatureException _ -> "com.amazonaws.ecs#UnsupportedFeatureException"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "AccessDeniedException" ->
          `AccessDeniedException (Json_deserializers.access_denied_exception_of_yojson tree path)
      | _, "ClientException" ->
          `ClientException (Json_deserializers.client_exception_of_yojson tree path)
      | _, "ConflictException" ->
          `ConflictException (Json_deserializers.conflict_exception_of_yojson tree path)
      | _, "InvalidParameterException" ->
          `InvalidParameterException
            (Json_deserializers.invalid_parameter_exception_of_yojson tree path)
      | _, "ServerException" ->
          `ServerException (Json_deserializers.server_exception_of_yojson tree path)
      | _, "ServiceDeploymentNotFoundException" ->
          `ServiceDeploymentNotFoundException
            (Json_deserializers.service_deployment_not_found_exception_of_yojson tree path)
      | _, "UnsupportedFeatureException" ->
          `UnsupportedFeatureException
            (Json_deserializers.unsupported_feature_exception_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : stop_service_deployment_request) =
    let input = Json_serializers.stop_service_deployment_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request
      ~shape_name:"AmazonEC2ContainerServiceV20141113.StopServiceDeployment" ~service ~context
      ~input ~output_deserializer:Json_deserializers.stop_service_deployment_response_of_yojson
      ~error_deserializer

  let request_with_metadata context (request : stop_service_deployment_request) =
    let input = Json_serializers.stop_service_deployment_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata
      ~shape_name:"AmazonEC2ContainerServiceV20141113.StopServiceDeployment" ~service ~context
      ~input ~output_deserializer:Json_deserializers.stop_service_deployment_response_of_yojson
      ~error_deserializer
end

module StartTask = struct
  let error_to_string = function
    | `AccessDeniedException _ -> "com.amazonaws.ecs#AccessDeniedException"
    | `ClientException _ -> "com.amazonaws.ecs#ClientException"
    | `ClusterNotFoundException _ -> "com.amazonaws.ecs#ClusterNotFoundException"
    | `InvalidParameterException _ -> "com.amazonaws.ecs#InvalidParameterException"
    | `NamespaceNotFoundException _ -> "com.amazonaws.ecs#NamespaceNotFoundException"
    | `ServerException _ -> "com.amazonaws.ecs#ServerException"
    | `UnsupportedFeatureException _ -> "com.amazonaws.ecs#UnsupportedFeatureException"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "AccessDeniedException" ->
          `AccessDeniedException (Json_deserializers.access_denied_exception_of_yojson tree path)
      | _, "ClientException" ->
          `ClientException (Json_deserializers.client_exception_of_yojson tree path)
      | _, "ClusterNotFoundException" ->
          `ClusterNotFoundException
            (Json_deserializers.cluster_not_found_exception_of_yojson tree path)
      | _, "InvalidParameterException" ->
          `InvalidParameterException
            (Json_deserializers.invalid_parameter_exception_of_yojson tree path)
      | _, "NamespaceNotFoundException" ->
          `NamespaceNotFoundException
            (Json_deserializers.namespace_not_found_exception_of_yojson tree path)
      | _, "ServerException" ->
          `ServerException (Json_deserializers.server_exception_of_yojson tree path)
      | _, "UnsupportedFeatureException" ->
          `UnsupportedFeatureException
            (Json_deserializers.unsupported_feature_exception_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : start_task_request) =
    let input = Json_serializers.start_task_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"AmazonEC2ContainerServiceV20141113.StartTask"
      ~service ~context ~input ~output_deserializer:Json_deserializers.start_task_response_of_yojson
      ~error_deserializer

  let request_with_metadata context (request : start_task_request) =
    let input = Json_serializers.start_task_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata
      ~shape_name:"AmazonEC2ContainerServiceV20141113.StartTask" ~service ~context ~input
      ~output_deserializer:Json_deserializers.start_task_response_of_yojson ~error_deserializer
end

module RunTask = struct
  let error_to_string = function
    | `AccessDeniedException _ -> "com.amazonaws.ecs#AccessDeniedException"
    | `BlockedException _ -> "com.amazonaws.ecs#BlockedException"
    | `ClientException _ -> "com.amazonaws.ecs#ClientException"
    | `ClusterNotFoundException _ -> "com.amazonaws.ecs#ClusterNotFoundException"
    | `ConflictException _ -> "com.amazonaws.ecs#ConflictException"
    | `InvalidParameterException _ -> "com.amazonaws.ecs#InvalidParameterException"
    | `PlatformTaskDefinitionIncompatibilityException _ ->
        "com.amazonaws.ecs#PlatformTaskDefinitionIncompatibilityException"
    | `PlatformUnknownException _ -> "com.amazonaws.ecs#PlatformUnknownException"
    | `ServerException _ -> "com.amazonaws.ecs#ServerException"
    | `UnsupportedFeatureException _ -> "com.amazonaws.ecs#UnsupportedFeatureException"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "AccessDeniedException" ->
          `AccessDeniedException (Json_deserializers.access_denied_exception_of_yojson tree path)
      | _, "BlockedException" ->
          `BlockedException (Json_deserializers.blocked_exception_of_yojson tree path)
      | _, "ClientException" ->
          `ClientException (Json_deserializers.client_exception_of_yojson tree path)
      | _, "ClusterNotFoundException" ->
          `ClusterNotFoundException
            (Json_deserializers.cluster_not_found_exception_of_yojson tree path)
      | _, "ConflictException" ->
          `ConflictException (Json_deserializers.conflict_exception_of_yojson tree path)
      | _, "InvalidParameterException" ->
          `InvalidParameterException
            (Json_deserializers.invalid_parameter_exception_of_yojson tree path)
      | _, "PlatformTaskDefinitionIncompatibilityException" ->
          `PlatformTaskDefinitionIncompatibilityException
            (Json_deserializers.platform_task_definition_incompatibility_exception_of_yojson tree
               path)
      | _, "PlatformUnknownException" ->
          `PlatformUnknownException
            (Json_deserializers.platform_unknown_exception_of_yojson tree path)
      | _, "ServerException" ->
          `ServerException (Json_deserializers.server_exception_of_yojson tree path)
      | _, "UnsupportedFeatureException" ->
          `UnsupportedFeatureException
            (Json_deserializers.unsupported_feature_exception_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : run_task_request) =
    let input = Json_serializers.run_task_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"AmazonEC2ContainerServiceV20141113.RunTask"
      ~service ~context ~input ~output_deserializer:Json_deserializers.run_task_response_of_yojson
      ~error_deserializer

  let request_with_metadata context (request : run_task_request) =
    let input = Json_serializers.run_task_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata
      ~shape_name:"AmazonEC2ContainerServiceV20141113.RunTask" ~service ~context ~input
      ~output_deserializer:Json_deserializers.run_task_response_of_yojson ~error_deserializer
end

module RegisterTaskDefinition = struct
  let error_to_string = function
    | `AccessDeniedException _ -> "com.amazonaws.ecs#AccessDeniedException"
    | `ClientException _ -> "com.amazonaws.ecs#ClientException"
    | `InvalidParameterException _ -> "com.amazonaws.ecs#InvalidParameterException"
    | `LimitExceededException _ -> "com.amazonaws.ecs#LimitExceededException"
    | `ServerException _ -> "com.amazonaws.ecs#ServerException"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "AccessDeniedException" ->
          `AccessDeniedException (Json_deserializers.access_denied_exception_of_yojson tree path)
      | _, "ClientException" ->
          `ClientException (Json_deserializers.client_exception_of_yojson tree path)
      | _, "InvalidParameterException" ->
          `InvalidParameterException
            (Json_deserializers.invalid_parameter_exception_of_yojson tree path)
      | _, "LimitExceededException" ->
          `LimitExceededException (Json_deserializers.limit_exceeded_exception_of_yojson tree path)
      | _, "ServerException" ->
          `ServerException (Json_deserializers.server_exception_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : register_task_definition_request) =
    let input = Json_serializers.register_task_definition_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request
      ~shape_name:"AmazonEC2ContainerServiceV20141113.RegisterTaskDefinition" ~service ~context
      ~input ~output_deserializer:Json_deserializers.register_task_definition_response_of_yojson
      ~error_deserializer

  let request_with_metadata context (request : register_task_definition_request) =
    let input = Json_serializers.register_task_definition_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata
      ~shape_name:"AmazonEC2ContainerServiceV20141113.RegisterTaskDefinition" ~service ~context
      ~input ~output_deserializer:Json_deserializers.register_task_definition_response_of_yojson
      ~error_deserializer
end

module RegisterDaemonTaskDefinition = struct
  let error_to_string = function
    | `AccessDeniedException _ -> "com.amazonaws.ecs#AccessDeniedException"
    | `ClientException _ -> "com.amazonaws.ecs#ClientException"
    | `InvalidParameterException _ -> "com.amazonaws.ecs#InvalidParameterException"
    | `LimitExceededException _ -> "com.amazonaws.ecs#LimitExceededException"
    | `ServerException _ -> "com.amazonaws.ecs#ServerException"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "AccessDeniedException" ->
          `AccessDeniedException (Json_deserializers.access_denied_exception_of_yojson tree path)
      | _, "ClientException" ->
          `ClientException (Json_deserializers.client_exception_of_yojson tree path)
      | _, "InvalidParameterException" ->
          `InvalidParameterException
            (Json_deserializers.invalid_parameter_exception_of_yojson tree path)
      | _, "LimitExceededException" ->
          `LimitExceededException (Json_deserializers.limit_exceeded_exception_of_yojson tree path)
      | _, "ServerException" ->
          `ServerException (Json_deserializers.server_exception_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : register_daemon_task_definition_request) =
    let input = Json_serializers.register_daemon_task_definition_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request
      ~shape_name:"AmazonEC2ContainerServiceV20141113.RegisterDaemonTaskDefinition" ~service
      ~context ~input
      ~output_deserializer:Json_deserializers.register_daemon_task_definition_response_of_yojson
      ~error_deserializer

  let request_with_metadata context (request : register_daemon_task_definition_request) =
    let input = Json_serializers.register_daemon_task_definition_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata
      ~shape_name:"AmazonEC2ContainerServiceV20141113.RegisterDaemonTaskDefinition" ~service
      ~context ~input
      ~output_deserializer:Json_deserializers.register_daemon_task_definition_response_of_yojson
      ~error_deserializer
end

module RegisterContainerInstance = struct
  let error_to_string = function
    | `AccessDeniedException _ -> "com.amazonaws.ecs#AccessDeniedException"
    | `ClientException _ -> "com.amazonaws.ecs#ClientException"
    | `ClusterNotFoundException _ -> "com.amazonaws.ecs#ClusterNotFoundException"
    | `InvalidParameterException _ -> "com.amazonaws.ecs#InvalidParameterException"
    | `ServerException _ -> "com.amazonaws.ecs#ServerException"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "AccessDeniedException" ->
          `AccessDeniedException (Json_deserializers.access_denied_exception_of_yojson tree path)
      | _, "ClientException" ->
          `ClientException (Json_deserializers.client_exception_of_yojson tree path)
      | _, "ClusterNotFoundException" ->
          `ClusterNotFoundException
            (Json_deserializers.cluster_not_found_exception_of_yojson tree path)
      | _, "InvalidParameterException" ->
          `InvalidParameterException
            (Json_deserializers.invalid_parameter_exception_of_yojson tree path)
      | _, "ServerException" ->
          `ServerException (Json_deserializers.server_exception_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : register_container_instance_request) =
    let input = Json_serializers.register_container_instance_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request
      ~shape_name:"AmazonEC2ContainerServiceV20141113.RegisterContainerInstance" ~service ~context
      ~input ~output_deserializer:Json_deserializers.register_container_instance_response_of_yojson
      ~error_deserializer

  let request_with_metadata context (request : register_container_instance_request) =
    let input = Json_serializers.register_container_instance_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata
      ~shape_name:"AmazonEC2ContainerServiceV20141113.RegisterContainerInstance" ~service ~context
      ~input ~output_deserializer:Json_deserializers.register_container_instance_response_of_yojson
      ~error_deserializer
end

module PutClusterCapacityProviders = struct
  let error_to_string = function
    | `AccessDeniedException _ -> "com.amazonaws.ecs#AccessDeniedException"
    | `ClientException _ -> "com.amazonaws.ecs#ClientException"
    | `ClusterNotFoundException _ -> "com.amazonaws.ecs#ClusterNotFoundException"
    | `InvalidParameterException _ -> "com.amazonaws.ecs#InvalidParameterException"
    | `ResourceInUseException _ -> "com.amazonaws.ecs#ResourceInUseException"
    | `ServerException _ -> "com.amazonaws.ecs#ServerException"
    | `UpdateInProgressException _ -> "com.amazonaws.ecs#UpdateInProgressException"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "AccessDeniedException" ->
          `AccessDeniedException (Json_deserializers.access_denied_exception_of_yojson tree path)
      | _, "ClientException" ->
          `ClientException (Json_deserializers.client_exception_of_yojson tree path)
      | _, "ClusterNotFoundException" ->
          `ClusterNotFoundException
            (Json_deserializers.cluster_not_found_exception_of_yojson tree path)
      | _, "InvalidParameterException" ->
          `InvalidParameterException
            (Json_deserializers.invalid_parameter_exception_of_yojson tree path)
      | _, "ResourceInUseException" ->
          `ResourceInUseException (Json_deserializers.resource_in_use_exception_of_yojson tree path)
      | _, "ServerException" ->
          `ServerException (Json_deserializers.server_exception_of_yojson tree path)
      | _, "UpdateInProgressException" ->
          `UpdateInProgressException
            (Json_deserializers.update_in_progress_exception_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : put_cluster_capacity_providers_request) =
    let input = Json_serializers.put_cluster_capacity_providers_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request
      ~shape_name:"AmazonEC2ContainerServiceV20141113.PutClusterCapacityProviders" ~service ~context
      ~input
      ~output_deserializer:Json_deserializers.put_cluster_capacity_providers_response_of_yojson
      ~error_deserializer

  let request_with_metadata context (request : put_cluster_capacity_providers_request) =
    let input = Json_serializers.put_cluster_capacity_providers_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata
      ~shape_name:"AmazonEC2ContainerServiceV20141113.PutClusterCapacityProviders" ~service ~context
      ~input
      ~output_deserializer:Json_deserializers.put_cluster_capacity_providers_response_of_yojson
      ~error_deserializer
end

module PutAttributes = struct
  let error_to_string = function
    | `AccessDeniedException _ -> "com.amazonaws.ecs#AccessDeniedException"
    | `AttributeLimitExceededException _ -> "com.amazonaws.ecs#AttributeLimitExceededException"
    | `ClientException _ -> "com.amazonaws.ecs#ClientException"
    | `ClusterNotFoundException _ -> "com.amazonaws.ecs#ClusterNotFoundException"
    | `InvalidParameterException _ -> "com.amazonaws.ecs#InvalidParameterException"
    | `ServerException _ -> "com.amazonaws.ecs#ServerException"
    | `TargetNotFoundException _ -> "com.amazonaws.ecs#TargetNotFoundException"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "AccessDeniedException" ->
          `AccessDeniedException (Json_deserializers.access_denied_exception_of_yojson tree path)
      | _, "AttributeLimitExceededException" ->
          `AttributeLimitExceededException
            (Json_deserializers.attribute_limit_exceeded_exception_of_yojson tree path)
      | _, "ClientException" ->
          `ClientException (Json_deserializers.client_exception_of_yojson tree path)
      | _, "ClusterNotFoundException" ->
          `ClusterNotFoundException
            (Json_deserializers.cluster_not_found_exception_of_yojson tree path)
      | _, "InvalidParameterException" ->
          `InvalidParameterException
            (Json_deserializers.invalid_parameter_exception_of_yojson tree path)
      | _, "ServerException" ->
          `ServerException (Json_deserializers.server_exception_of_yojson tree path)
      | _, "TargetNotFoundException" ->
          `TargetNotFoundException
            (Json_deserializers.target_not_found_exception_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : put_attributes_request) =
    let input = Json_serializers.put_attributes_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request
      ~shape_name:"AmazonEC2ContainerServiceV20141113.PutAttributes" ~service ~context ~input
      ~output_deserializer:Json_deserializers.put_attributes_response_of_yojson ~error_deserializer

  let request_with_metadata context (request : put_attributes_request) =
    let input = Json_serializers.put_attributes_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata
      ~shape_name:"AmazonEC2ContainerServiceV20141113.PutAttributes" ~service ~context ~input
      ~output_deserializer:Json_deserializers.put_attributes_response_of_yojson ~error_deserializer
end

module ListTasks = struct
  let error_to_string = function
    | `AccessDeniedException _ -> "com.amazonaws.ecs#AccessDeniedException"
    | `ClientException _ -> "com.amazonaws.ecs#ClientException"
    | `ClusterNotFoundException _ -> "com.amazonaws.ecs#ClusterNotFoundException"
    | `InvalidParameterException _ -> "com.amazonaws.ecs#InvalidParameterException"
    | `ServerException _ -> "com.amazonaws.ecs#ServerException"
    | `ServiceNotFoundException _ -> "com.amazonaws.ecs#ServiceNotFoundException"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "AccessDeniedException" ->
          `AccessDeniedException (Json_deserializers.access_denied_exception_of_yojson tree path)
      | _, "ClientException" ->
          `ClientException (Json_deserializers.client_exception_of_yojson tree path)
      | _, "ClusterNotFoundException" ->
          `ClusterNotFoundException
            (Json_deserializers.cluster_not_found_exception_of_yojson tree path)
      | _, "InvalidParameterException" ->
          `InvalidParameterException
            (Json_deserializers.invalid_parameter_exception_of_yojson tree path)
      | _, "ServerException" ->
          `ServerException (Json_deserializers.server_exception_of_yojson tree path)
      | _, "ServiceNotFoundException" ->
          `ServiceNotFoundException
            (Json_deserializers.service_not_found_exception_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : list_tasks_request) =
    let input = Json_serializers.list_tasks_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"AmazonEC2ContainerServiceV20141113.ListTasks"
      ~service ~context ~input ~output_deserializer:Json_deserializers.list_tasks_response_of_yojson
      ~error_deserializer

  let request_with_metadata context (request : list_tasks_request) =
    let input = Json_serializers.list_tasks_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata
      ~shape_name:"AmazonEC2ContainerServiceV20141113.ListTasks" ~service ~context ~input
      ~output_deserializer:Json_deserializers.list_tasks_response_of_yojson ~error_deserializer
end

module ListTaskDefinitions = struct
  let error_to_string = function
    | `AccessDeniedException _ -> "com.amazonaws.ecs#AccessDeniedException"
    | `ClientException _ -> "com.amazonaws.ecs#ClientException"
    | `InvalidParameterException _ -> "com.amazonaws.ecs#InvalidParameterException"
    | `ServerException _ -> "com.amazonaws.ecs#ServerException"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "AccessDeniedException" ->
          `AccessDeniedException (Json_deserializers.access_denied_exception_of_yojson tree path)
      | _, "ClientException" ->
          `ClientException (Json_deserializers.client_exception_of_yojson tree path)
      | _, "InvalidParameterException" ->
          `InvalidParameterException
            (Json_deserializers.invalid_parameter_exception_of_yojson tree path)
      | _, "ServerException" ->
          `ServerException (Json_deserializers.server_exception_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : list_task_definitions_request) =
    let input = Json_serializers.list_task_definitions_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request
      ~shape_name:"AmazonEC2ContainerServiceV20141113.ListTaskDefinitions" ~service ~context ~input
      ~output_deserializer:Json_deserializers.list_task_definitions_response_of_yojson
      ~error_deserializer

  let request_with_metadata context (request : list_task_definitions_request) =
    let input = Json_serializers.list_task_definitions_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata
      ~shape_name:"AmazonEC2ContainerServiceV20141113.ListTaskDefinitions" ~service ~context ~input
      ~output_deserializer:Json_deserializers.list_task_definitions_response_of_yojson
      ~error_deserializer
end

module ListServices = struct
  let error_to_string = function
    | `AccessDeniedException _ -> "com.amazonaws.ecs#AccessDeniedException"
    | `ClientException _ -> "com.amazonaws.ecs#ClientException"
    | `ClusterNotFoundException _ -> "com.amazonaws.ecs#ClusterNotFoundException"
    | `InvalidParameterException _ -> "com.amazonaws.ecs#InvalidParameterException"
    | `ServerException _ -> "com.amazonaws.ecs#ServerException"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "AccessDeniedException" ->
          `AccessDeniedException (Json_deserializers.access_denied_exception_of_yojson tree path)
      | _, "ClientException" ->
          `ClientException (Json_deserializers.client_exception_of_yojson tree path)
      | _, "ClusterNotFoundException" ->
          `ClusterNotFoundException
            (Json_deserializers.cluster_not_found_exception_of_yojson tree path)
      | _, "InvalidParameterException" ->
          `InvalidParameterException
            (Json_deserializers.invalid_parameter_exception_of_yojson tree path)
      | _, "ServerException" ->
          `ServerException (Json_deserializers.server_exception_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : list_services_request) =
    let input = Json_serializers.list_services_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request
      ~shape_name:"AmazonEC2ContainerServiceV20141113.ListServices" ~service ~context ~input
      ~output_deserializer:Json_deserializers.list_services_response_of_yojson ~error_deserializer

  let request_with_metadata context (request : list_services_request) =
    let input = Json_serializers.list_services_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata
      ~shape_name:"AmazonEC2ContainerServiceV20141113.ListServices" ~service ~context ~input
      ~output_deserializer:Json_deserializers.list_services_response_of_yojson ~error_deserializer
end

module ListServiceDeployments = struct
  let error_to_string = function
    | `AccessDeniedException _ -> "com.amazonaws.ecs#AccessDeniedException"
    | `ClientException _ -> "com.amazonaws.ecs#ClientException"
    | `ClusterNotFoundException _ -> "com.amazonaws.ecs#ClusterNotFoundException"
    | `InvalidParameterException _ -> "com.amazonaws.ecs#InvalidParameterException"
    | `ServerException _ -> "com.amazonaws.ecs#ServerException"
    | `ServiceNotFoundException _ -> "com.amazonaws.ecs#ServiceNotFoundException"
    | `UnsupportedFeatureException _ -> "com.amazonaws.ecs#UnsupportedFeatureException"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "AccessDeniedException" ->
          `AccessDeniedException (Json_deserializers.access_denied_exception_of_yojson tree path)
      | _, "ClientException" ->
          `ClientException (Json_deserializers.client_exception_of_yojson tree path)
      | _, "ClusterNotFoundException" ->
          `ClusterNotFoundException
            (Json_deserializers.cluster_not_found_exception_of_yojson tree path)
      | _, "InvalidParameterException" ->
          `InvalidParameterException
            (Json_deserializers.invalid_parameter_exception_of_yojson tree path)
      | _, "ServerException" ->
          `ServerException (Json_deserializers.server_exception_of_yojson tree path)
      | _, "ServiceNotFoundException" ->
          `ServiceNotFoundException
            (Json_deserializers.service_not_found_exception_of_yojson tree path)
      | _, "UnsupportedFeatureException" ->
          `UnsupportedFeatureException
            (Json_deserializers.unsupported_feature_exception_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : list_service_deployments_request) =
    let input = Json_serializers.list_service_deployments_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request
      ~shape_name:"AmazonEC2ContainerServiceV20141113.ListServiceDeployments" ~service ~context
      ~input ~output_deserializer:Json_deserializers.list_service_deployments_response_of_yojson
      ~error_deserializer

  let request_with_metadata context (request : list_service_deployments_request) =
    let input = Json_serializers.list_service_deployments_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata
      ~shape_name:"AmazonEC2ContainerServiceV20141113.ListServiceDeployments" ~service ~context
      ~input ~output_deserializer:Json_deserializers.list_service_deployments_response_of_yojson
      ~error_deserializer
end

module ListDaemons = struct
  let error_to_string = function
    | `AccessDeniedException _ -> "com.amazonaws.ecs#AccessDeniedException"
    | `ClientException _ -> "com.amazonaws.ecs#ClientException"
    | `ClusterNotFoundException _ -> "com.amazonaws.ecs#ClusterNotFoundException"
    | `InvalidParameterException _ -> "com.amazonaws.ecs#InvalidParameterException"
    | `ServerException _ -> "com.amazonaws.ecs#ServerException"
    | `UnsupportedFeatureException _ -> "com.amazonaws.ecs#UnsupportedFeatureException"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "AccessDeniedException" ->
          `AccessDeniedException (Json_deserializers.access_denied_exception_of_yojson tree path)
      | _, "ClientException" ->
          `ClientException (Json_deserializers.client_exception_of_yojson tree path)
      | _, "ClusterNotFoundException" ->
          `ClusterNotFoundException
            (Json_deserializers.cluster_not_found_exception_of_yojson tree path)
      | _, "InvalidParameterException" ->
          `InvalidParameterException
            (Json_deserializers.invalid_parameter_exception_of_yojson tree path)
      | _, "ServerException" ->
          `ServerException (Json_deserializers.server_exception_of_yojson tree path)
      | _, "UnsupportedFeatureException" ->
          `UnsupportedFeatureException
            (Json_deserializers.unsupported_feature_exception_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : list_daemons_request) =
    let input = Json_serializers.list_daemons_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"AmazonEC2ContainerServiceV20141113.ListDaemons"
      ~service ~context ~input
      ~output_deserializer:Json_deserializers.list_daemons_response_of_yojson ~error_deserializer

  let request_with_metadata context (request : list_daemons_request) =
    let input = Json_serializers.list_daemons_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata
      ~shape_name:"AmazonEC2ContainerServiceV20141113.ListDaemons" ~service ~context ~input
      ~output_deserializer:Json_deserializers.list_daemons_response_of_yojson ~error_deserializer
end

module ListDaemonTaskDefinitions = struct
  let error_to_string = function
    | `AccessDeniedException _ -> "com.amazonaws.ecs#AccessDeniedException"
    | `ClientException _ -> "com.amazonaws.ecs#ClientException"
    | `InvalidParameterException _ -> "com.amazonaws.ecs#InvalidParameterException"
    | `ServerException _ -> "com.amazonaws.ecs#ServerException"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "AccessDeniedException" ->
          `AccessDeniedException (Json_deserializers.access_denied_exception_of_yojson tree path)
      | _, "ClientException" ->
          `ClientException (Json_deserializers.client_exception_of_yojson tree path)
      | _, "InvalidParameterException" ->
          `InvalidParameterException
            (Json_deserializers.invalid_parameter_exception_of_yojson tree path)
      | _, "ServerException" ->
          `ServerException (Json_deserializers.server_exception_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : list_daemon_task_definitions_request) =
    let input = Json_serializers.list_daemon_task_definitions_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request
      ~shape_name:"AmazonEC2ContainerServiceV20141113.ListDaemonTaskDefinitions" ~service ~context
      ~input ~output_deserializer:Json_deserializers.list_daemon_task_definitions_response_of_yojson
      ~error_deserializer

  let request_with_metadata context (request : list_daemon_task_definitions_request) =
    let input = Json_serializers.list_daemon_task_definitions_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata
      ~shape_name:"AmazonEC2ContainerServiceV20141113.ListDaemonTaskDefinitions" ~service ~context
      ~input ~output_deserializer:Json_deserializers.list_daemon_task_definitions_response_of_yojson
      ~error_deserializer
end

module ListDaemonDeployments = struct
  let error_to_string = function
    | `AccessDeniedException _ -> "com.amazonaws.ecs#AccessDeniedException"
    | `ClientException _ -> "com.amazonaws.ecs#ClientException"
    | `ClusterNotFoundException _ -> "com.amazonaws.ecs#ClusterNotFoundException"
    | `InvalidParameterException _ -> "com.amazonaws.ecs#InvalidParameterException"
    | `ServerException _ -> "com.amazonaws.ecs#ServerException"
    | `UnsupportedFeatureException _ -> "com.amazonaws.ecs#UnsupportedFeatureException"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "AccessDeniedException" ->
          `AccessDeniedException (Json_deserializers.access_denied_exception_of_yojson tree path)
      | _, "ClientException" ->
          `ClientException (Json_deserializers.client_exception_of_yojson tree path)
      | _, "ClusterNotFoundException" ->
          `ClusterNotFoundException
            (Json_deserializers.cluster_not_found_exception_of_yojson tree path)
      | _, "InvalidParameterException" ->
          `InvalidParameterException
            (Json_deserializers.invalid_parameter_exception_of_yojson tree path)
      | _, "ServerException" ->
          `ServerException (Json_deserializers.server_exception_of_yojson tree path)
      | _, "UnsupportedFeatureException" ->
          `UnsupportedFeatureException
            (Json_deserializers.unsupported_feature_exception_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : list_daemon_deployments_request) =
    let input = Json_serializers.list_daemon_deployments_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request
      ~shape_name:"AmazonEC2ContainerServiceV20141113.ListDaemonDeployments" ~service ~context
      ~input ~output_deserializer:Json_deserializers.list_daemon_deployments_response_of_yojson
      ~error_deserializer

  let request_with_metadata context (request : list_daemon_deployments_request) =
    let input = Json_serializers.list_daemon_deployments_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata
      ~shape_name:"AmazonEC2ContainerServiceV20141113.ListDaemonDeployments" ~service ~context
      ~input ~output_deserializer:Json_deserializers.list_daemon_deployments_response_of_yojson
      ~error_deserializer
end

module ListContainerInstances = struct
  let error_to_string = function
    | `AccessDeniedException _ -> "com.amazonaws.ecs#AccessDeniedException"
    | `ClientException _ -> "com.amazonaws.ecs#ClientException"
    | `ClusterNotFoundException _ -> "com.amazonaws.ecs#ClusterNotFoundException"
    | `InvalidParameterException _ -> "com.amazonaws.ecs#InvalidParameterException"
    | `ServerException _ -> "com.amazonaws.ecs#ServerException"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "AccessDeniedException" ->
          `AccessDeniedException (Json_deserializers.access_denied_exception_of_yojson tree path)
      | _, "ClientException" ->
          `ClientException (Json_deserializers.client_exception_of_yojson tree path)
      | _, "ClusterNotFoundException" ->
          `ClusterNotFoundException
            (Json_deserializers.cluster_not_found_exception_of_yojson tree path)
      | _, "InvalidParameterException" ->
          `InvalidParameterException
            (Json_deserializers.invalid_parameter_exception_of_yojson tree path)
      | _, "ServerException" ->
          `ServerException (Json_deserializers.server_exception_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : list_container_instances_request) =
    let input = Json_serializers.list_container_instances_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request
      ~shape_name:"AmazonEC2ContainerServiceV20141113.ListContainerInstances" ~service ~context
      ~input ~output_deserializer:Json_deserializers.list_container_instances_response_of_yojson
      ~error_deserializer

  let request_with_metadata context (request : list_container_instances_request) =
    let input = Json_serializers.list_container_instances_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata
      ~shape_name:"AmazonEC2ContainerServiceV20141113.ListContainerInstances" ~service ~context
      ~input ~output_deserializer:Json_deserializers.list_container_instances_response_of_yojson
      ~error_deserializer
end

module ListClusters = struct
  let error_to_string = function
    | `AccessDeniedException _ -> "com.amazonaws.ecs#AccessDeniedException"
    | `ClientException _ -> "com.amazonaws.ecs#ClientException"
    | `InvalidParameterException _ -> "com.amazonaws.ecs#InvalidParameterException"
    | `ServerException _ -> "com.amazonaws.ecs#ServerException"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "AccessDeniedException" ->
          `AccessDeniedException (Json_deserializers.access_denied_exception_of_yojson tree path)
      | _, "ClientException" ->
          `ClientException (Json_deserializers.client_exception_of_yojson tree path)
      | _, "InvalidParameterException" ->
          `InvalidParameterException
            (Json_deserializers.invalid_parameter_exception_of_yojson tree path)
      | _, "ServerException" ->
          `ServerException (Json_deserializers.server_exception_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : list_clusters_request) =
    let input = Json_serializers.list_clusters_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request
      ~shape_name:"AmazonEC2ContainerServiceV20141113.ListClusters" ~service ~context ~input
      ~output_deserializer:Json_deserializers.list_clusters_response_of_yojson ~error_deserializer

  let request_with_metadata context (request : list_clusters_request) =
    let input = Json_serializers.list_clusters_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata
      ~shape_name:"AmazonEC2ContainerServiceV20141113.ListClusters" ~service ~context ~input
      ~output_deserializer:Json_deserializers.list_clusters_response_of_yojson ~error_deserializer
end

module ListAttributes = struct
  let error_to_string = function
    | `AccessDeniedException _ -> "com.amazonaws.ecs#AccessDeniedException"
    | `ClientException _ -> "com.amazonaws.ecs#ClientException"
    | `ClusterNotFoundException _ -> "com.amazonaws.ecs#ClusterNotFoundException"
    | `InvalidParameterException _ -> "com.amazonaws.ecs#InvalidParameterException"
    | `ServerException _ -> "com.amazonaws.ecs#ServerException"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "AccessDeniedException" ->
          `AccessDeniedException (Json_deserializers.access_denied_exception_of_yojson tree path)
      | _, "ClientException" ->
          `ClientException (Json_deserializers.client_exception_of_yojson tree path)
      | _, "ClusterNotFoundException" ->
          `ClusterNotFoundException
            (Json_deserializers.cluster_not_found_exception_of_yojson tree path)
      | _, "InvalidParameterException" ->
          `InvalidParameterException
            (Json_deserializers.invalid_parameter_exception_of_yojson tree path)
      | _, "ServerException" ->
          `ServerException (Json_deserializers.server_exception_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : list_attributes_request) =
    let input = Json_serializers.list_attributes_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request
      ~shape_name:"AmazonEC2ContainerServiceV20141113.ListAttributes" ~service ~context ~input
      ~output_deserializer:Json_deserializers.list_attributes_response_of_yojson ~error_deserializer

  let request_with_metadata context (request : list_attributes_request) =
    let input = Json_serializers.list_attributes_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata
      ~shape_name:"AmazonEC2ContainerServiceV20141113.ListAttributes" ~service ~context ~input
      ~output_deserializer:Json_deserializers.list_attributes_response_of_yojson ~error_deserializer
end

module GetTaskProtection = struct
  let error_to_string = function
    | `AccessDeniedException _ -> "com.amazonaws.ecs#AccessDeniedException"
    | `ClientException _ -> "com.amazonaws.ecs#ClientException"
    | `ClusterNotFoundException _ -> "com.amazonaws.ecs#ClusterNotFoundException"
    | `InvalidParameterException _ -> "com.amazonaws.ecs#InvalidParameterException"
    | `ResourceNotFoundException _ -> "com.amazonaws.ecs#ResourceNotFoundException"
    | `ServerException _ -> "com.amazonaws.ecs#ServerException"
    | `UnsupportedFeatureException _ -> "com.amazonaws.ecs#UnsupportedFeatureException"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "AccessDeniedException" ->
          `AccessDeniedException (Json_deserializers.access_denied_exception_of_yojson tree path)
      | _, "ClientException" ->
          `ClientException (Json_deserializers.client_exception_of_yojson tree path)
      | _, "ClusterNotFoundException" ->
          `ClusterNotFoundException
            (Json_deserializers.cluster_not_found_exception_of_yojson tree path)
      | _, "InvalidParameterException" ->
          `InvalidParameterException
            (Json_deserializers.invalid_parameter_exception_of_yojson tree path)
      | _, "ResourceNotFoundException" ->
          `ResourceNotFoundException
            (Json_deserializers.resource_not_found_exception_of_yojson tree path)
      | _, "ServerException" ->
          `ServerException (Json_deserializers.server_exception_of_yojson tree path)
      | _, "UnsupportedFeatureException" ->
          `UnsupportedFeatureException
            (Json_deserializers.unsupported_feature_exception_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : get_task_protection_request) =
    let input = Json_serializers.get_task_protection_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request
      ~shape_name:"AmazonEC2ContainerServiceV20141113.GetTaskProtection" ~service ~context ~input
      ~output_deserializer:Json_deserializers.get_task_protection_response_of_yojson
      ~error_deserializer

  let request_with_metadata context (request : get_task_protection_request) =
    let input = Json_serializers.get_task_protection_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata
      ~shape_name:"AmazonEC2ContainerServiceV20141113.GetTaskProtection" ~service ~context ~input
      ~output_deserializer:Json_deserializers.get_task_protection_response_of_yojson
      ~error_deserializer
end

module ExecuteCommand = struct
  let error_to_string = function
    | `AccessDeniedException _ -> "com.amazonaws.ecs#AccessDeniedException"
    | `ClientException _ -> "com.amazonaws.ecs#ClientException"
    | `ClusterNotFoundException _ -> "com.amazonaws.ecs#ClusterNotFoundException"
    | `InvalidParameterException _ -> "com.amazonaws.ecs#InvalidParameterException"
    | `ServerException _ -> "com.amazonaws.ecs#ServerException"
    | `TargetNotConnectedException _ -> "com.amazonaws.ecs#TargetNotConnectedException"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "AccessDeniedException" ->
          `AccessDeniedException (Json_deserializers.access_denied_exception_of_yojson tree path)
      | _, "ClientException" ->
          `ClientException (Json_deserializers.client_exception_of_yojson tree path)
      | _, "ClusterNotFoundException" ->
          `ClusterNotFoundException
            (Json_deserializers.cluster_not_found_exception_of_yojson tree path)
      | _, "InvalidParameterException" ->
          `InvalidParameterException
            (Json_deserializers.invalid_parameter_exception_of_yojson tree path)
      | _, "ServerException" ->
          `ServerException (Json_deserializers.server_exception_of_yojson tree path)
      | _, "TargetNotConnectedException" ->
          `TargetNotConnectedException
            (Json_deserializers.target_not_connected_exception_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : execute_command_request) =
    let input = Json_serializers.execute_command_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request
      ~shape_name:"AmazonEC2ContainerServiceV20141113.ExecuteCommand" ~service ~context ~input
      ~output_deserializer:Json_deserializers.execute_command_response_of_yojson ~error_deserializer

  let request_with_metadata context (request : execute_command_request) =
    let input = Json_serializers.execute_command_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata
      ~shape_name:"AmazonEC2ContainerServiceV20141113.ExecuteCommand" ~service ~context ~input
      ~output_deserializer:Json_deserializers.execute_command_response_of_yojson ~error_deserializer
end

module DescribeTasks = struct
  let error_to_string = function
    | `AccessDeniedException _ -> "com.amazonaws.ecs#AccessDeniedException"
    | `ClientException _ -> "com.amazonaws.ecs#ClientException"
    | `ClusterNotFoundException _ -> "com.amazonaws.ecs#ClusterNotFoundException"
    | `InvalidParameterException _ -> "com.amazonaws.ecs#InvalidParameterException"
    | `ServerException _ -> "com.amazonaws.ecs#ServerException"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "AccessDeniedException" ->
          `AccessDeniedException (Json_deserializers.access_denied_exception_of_yojson tree path)
      | _, "ClientException" ->
          `ClientException (Json_deserializers.client_exception_of_yojson tree path)
      | _, "ClusterNotFoundException" ->
          `ClusterNotFoundException
            (Json_deserializers.cluster_not_found_exception_of_yojson tree path)
      | _, "InvalidParameterException" ->
          `InvalidParameterException
            (Json_deserializers.invalid_parameter_exception_of_yojson tree path)
      | _, "ServerException" ->
          `ServerException (Json_deserializers.server_exception_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : describe_tasks_request) =
    let input = Json_serializers.describe_tasks_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request
      ~shape_name:"AmazonEC2ContainerServiceV20141113.DescribeTasks" ~service ~context ~input
      ~output_deserializer:Json_deserializers.describe_tasks_response_of_yojson ~error_deserializer

  let request_with_metadata context (request : describe_tasks_request) =
    let input = Json_serializers.describe_tasks_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata
      ~shape_name:"AmazonEC2ContainerServiceV20141113.DescribeTasks" ~service ~context ~input
      ~output_deserializer:Json_deserializers.describe_tasks_response_of_yojson ~error_deserializer
end

module DescribeTaskSets = struct
  let error_to_string = function
    | `AccessDeniedException _ -> "com.amazonaws.ecs#AccessDeniedException"
    | `ClientException _ -> "com.amazonaws.ecs#ClientException"
    | `ClusterNotFoundException _ -> "com.amazonaws.ecs#ClusterNotFoundException"
    | `InvalidParameterException _ -> "com.amazonaws.ecs#InvalidParameterException"
    | `ServerException _ -> "com.amazonaws.ecs#ServerException"
    | `ServiceNotActiveException _ -> "com.amazonaws.ecs#ServiceNotActiveException"
    | `ServiceNotFoundException _ -> "com.amazonaws.ecs#ServiceNotFoundException"
    | `UnsupportedFeatureException _ -> "com.amazonaws.ecs#UnsupportedFeatureException"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "AccessDeniedException" ->
          `AccessDeniedException (Json_deserializers.access_denied_exception_of_yojson tree path)
      | _, "ClientException" ->
          `ClientException (Json_deserializers.client_exception_of_yojson tree path)
      | _, "ClusterNotFoundException" ->
          `ClusterNotFoundException
            (Json_deserializers.cluster_not_found_exception_of_yojson tree path)
      | _, "InvalidParameterException" ->
          `InvalidParameterException
            (Json_deserializers.invalid_parameter_exception_of_yojson tree path)
      | _, "ServerException" ->
          `ServerException (Json_deserializers.server_exception_of_yojson tree path)
      | _, "ServiceNotActiveException" ->
          `ServiceNotActiveException
            (Json_deserializers.service_not_active_exception_of_yojson tree path)
      | _, "ServiceNotFoundException" ->
          `ServiceNotFoundException
            (Json_deserializers.service_not_found_exception_of_yojson tree path)
      | _, "UnsupportedFeatureException" ->
          `UnsupportedFeatureException
            (Json_deserializers.unsupported_feature_exception_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : describe_task_sets_request) =
    let input = Json_serializers.describe_task_sets_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request
      ~shape_name:"AmazonEC2ContainerServiceV20141113.DescribeTaskSets" ~service ~context ~input
      ~output_deserializer:Json_deserializers.describe_task_sets_response_of_yojson
      ~error_deserializer

  let request_with_metadata context (request : describe_task_sets_request) =
    let input = Json_serializers.describe_task_sets_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata
      ~shape_name:"AmazonEC2ContainerServiceV20141113.DescribeTaskSets" ~service ~context ~input
      ~output_deserializer:Json_deserializers.describe_task_sets_response_of_yojson
      ~error_deserializer
end

module DescribeServices = struct
  let error_to_string = function
    | `AccessDeniedException _ -> "com.amazonaws.ecs#AccessDeniedException"
    | `ClientException _ -> "com.amazonaws.ecs#ClientException"
    | `ClusterNotFoundException _ -> "com.amazonaws.ecs#ClusterNotFoundException"
    | `InvalidParameterException _ -> "com.amazonaws.ecs#InvalidParameterException"
    | `ServerException _ -> "com.amazonaws.ecs#ServerException"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "AccessDeniedException" ->
          `AccessDeniedException (Json_deserializers.access_denied_exception_of_yojson tree path)
      | _, "ClientException" ->
          `ClientException (Json_deserializers.client_exception_of_yojson tree path)
      | _, "ClusterNotFoundException" ->
          `ClusterNotFoundException
            (Json_deserializers.cluster_not_found_exception_of_yojson tree path)
      | _, "InvalidParameterException" ->
          `InvalidParameterException
            (Json_deserializers.invalid_parameter_exception_of_yojson tree path)
      | _, "ServerException" ->
          `ServerException (Json_deserializers.server_exception_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : describe_services_request) =
    let input = Json_serializers.describe_services_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request
      ~shape_name:"AmazonEC2ContainerServiceV20141113.DescribeServices" ~service ~context ~input
      ~output_deserializer:Json_deserializers.describe_services_response_of_yojson
      ~error_deserializer

  let request_with_metadata context (request : describe_services_request) =
    let input = Json_serializers.describe_services_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata
      ~shape_name:"AmazonEC2ContainerServiceV20141113.DescribeServices" ~service ~context ~input
      ~output_deserializer:Json_deserializers.describe_services_response_of_yojson
      ~error_deserializer
end

module DescribeServiceRevisions = struct
  let error_to_string = function
    | `AccessDeniedException _ -> "com.amazonaws.ecs#AccessDeniedException"
    | `ClientException _ -> "com.amazonaws.ecs#ClientException"
    | `ClusterNotFoundException _ -> "com.amazonaws.ecs#ClusterNotFoundException"
    | `InvalidParameterException _ -> "com.amazonaws.ecs#InvalidParameterException"
    | `ServerException _ -> "com.amazonaws.ecs#ServerException"
    | `ServiceNotFoundException _ -> "com.amazonaws.ecs#ServiceNotFoundException"
    | `UnsupportedFeatureException _ -> "com.amazonaws.ecs#UnsupportedFeatureException"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "AccessDeniedException" ->
          `AccessDeniedException (Json_deserializers.access_denied_exception_of_yojson tree path)
      | _, "ClientException" ->
          `ClientException (Json_deserializers.client_exception_of_yojson tree path)
      | _, "ClusterNotFoundException" ->
          `ClusterNotFoundException
            (Json_deserializers.cluster_not_found_exception_of_yojson tree path)
      | _, "InvalidParameterException" ->
          `InvalidParameterException
            (Json_deserializers.invalid_parameter_exception_of_yojson tree path)
      | _, "ServerException" ->
          `ServerException (Json_deserializers.server_exception_of_yojson tree path)
      | _, "ServiceNotFoundException" ->
          `ServiceNotFoundException
            (Json_deserializers.service_not_found_exception_of_yojson tree path)
      | _, "UnsupportedFeatureException" ->
          `UnsupportedFeatureException
            (Json_deserializers.unsupported_feature_exception_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : describe_service_revisions_request) =
    let input = Json_serializers.describe_service_revisions_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request
      ~shape_name:"AmazonEC2ContainerServiceV20141113.DescribeServiceRevisions" ~service ~context
      ~input ~output_deserializer:Json_deserializers.describe_service_revisions_response_of_yojson
      ~error_deserializer

  let request_with_metadata context (request : describe_service_revisions_request) =
    let input = Json_serializers.describe_service_revisions_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata
      ~shape_name:"AmazonEC2ContainerServiceV20141113.DescribeServiceRevisions" ~service ~context
      ~input ~output_deserializer:Json_deserializers.describe_service_revisions_response_of_yojson
      ~error_deserializer
end

module DescribeServiceDeployments = struct
  let error_to_string = function
    | `AccessDeniedException _ -> "com.amazonaws.ecs#AccessDeniedException"
    | `ClientException _ -> "com.amazonaws.ecs#ClientException"
    | `ClusterNotFoundException _ -> "com.amazonaws.ecs#ClusterNotFoundException"
    | `InvalidParameterException _ -> "com.amazonaws.ecs#InvalidParameterException"
    | `ServerException _ -> "com.amazonaws.ecs#ServerException"
    | `ServiceNotFoundException _ -> "com.amazonaws.ecs#ServiceNotFoundException"
    | `UnsupportedFeatureException _ -> "com.amazonaws.ecs#UnsupportedFeatureException"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "AccessDeniedException" ->
          `AccessDeniedException (Json_deserializers.access_denied_exception_of_yojson tree path)
      | _, "ClientException" ->
          `ClientException (Json_deserializers.client_exception_of_yojson tree path)
      | _, "ClusterNotFoundException" ->
          `ClusterNotFoundException
            (Json_deserializers.cluster_not_found_exception_of_yojson tree path)
      | _, "InvalidParameterException" ->
          `InvalidParameterException
            (Json_deserializers.invalid_parameter_exception_of_yojson tree path)
      | _, "ServerException" ->
          `ServerException (Json_deserializers.server_exception_of_yojson tree path)
      | _, "ServiceNotFoundException" ->
          `ServiceNotFoundException
            (Json_deserializers.service_not_found_exception_of_yojson tree path)
      | _, "UnsupportedFeatureException" ->
          `UnsupportedFeatureException
            (Json_deserializers.unsupported_feature_exception_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : describe_service_deployments_request) =
    let input = Json_serializers.describe_service_deployments_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request
      ~shape_name:"AmazonEC2ContainerServiceV20141113.DescribeServiceDeployments" ~service ~context
      ~input ~output_deserializer:Json_deserializers.describe_service_deployments_response_of_yojson
      ~error_deserializer

  let request_with_metadata context (request : describe_service_deployments_request) =
    let input = Json_serializers.describe_service_deployments_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata
      ~shape_name:"AmazonEC2ContainerServiceV20141113.DescribeServiceDeployments" ~service ~context
      ~input ~output_deserializer:Json_deserializers.describe_service_deployments_response_of_yojson
      ~error_deserializer
end

module DescribeExpressGatewayService = struct
  let error_to_string = function
    | `AccessDeniedException _ -> "com.amazonaws.ecs#AccessDeniedException"
    | `ClientException _ -> "com.amazonaws.ecs#ClientException"
    | `ClusterNotFoundException _ -> "com.amazonaws.ecs#ClusterNotFoundException"
    | `InvalidParameterException _ -> "com.amazonaws.ecs#InvalidParameterException"
    | `ResourceNotFoundException _ -> "com.amazonaws.ecs#ResourceNotFoundException"
    | `ServerException _ -> "com.amazonaws.ecs#ServerException"
    | `UnsupportedFeatureException _ -> "com.amazonaws.ecs#UnsupportedFeatureException"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "AccessDeniedException" ->
          `AccessDeniedException (Json_deserializers.access_denied_exception_of_yojson tree path)
      | _, "ClientException" ->
          `ClientException (Json_deserializers.client_exception_of_yojson tree path)
      | _, "ClusterNotFoundException" ->
          `ClusterNotFoundException
            (Json_deserializers.cluster_not_found_exception_of_yojson tree path)
      | _, "InvalidParameterException" ->
          `InvalidParameterException
            (Json_deserializers.invalid_parameter_exception_of_yojson tree path)
      | _, "ResourceNotFoundException" ->
          `ResourceNotFoundException
            (Json_deserializers.resource_not_found_exception_of_yojson tree path)
      | _, "ServerException" ->
          `ServerException (Json_deserializers.server_exception_of_yojson tree path)
      | _, "UnsupportedFeatureException" ->
          `UnsupportedFeatureException
            (Json_deserializers.unsupported_feature_exception_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : describe_express_gateway_service_request) =
    let input = Json_serializers.describe_express_gateway_service_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request
      ~shape_name:"AmazonEC2ContainerServiceV20141113.DescribeExpressGatewayService" ~service
      ~context ~input
      ~output_deserializer:Json_deserializers.describe_express_gateway_service_response_of_yojson
      ~error_deserializer

  let request_with_metadata context (request : describe_express_gateway_service_request) =
    let input = Json_serializers.describe_express_gateway_service_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata
      ~shape_name:"AmazonEC2ContainerServiceV20141113.DescribeExpressGatewayService" ~service
      ~context ~input
      ~output_deserializer:Json_deserializers.describe_express_gateway_service_response_of_yojson
      ~error_deserializer
end

module DescribeDaemonTaskDefinition = struct
  let error_to_string = function
    | `AccessDeniedException _ -> "com.amazonaws.ecs#AccessDeniedException"
    | `ClientException _ -> "com.amazonaws.ecs#ClientException"
    | `InvalidParameterException _ -> "com.amazonaws.ecs#InvalidParameterException"
    | `ServerException _ -> "com.amazonaws.ecs#ServerException"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "AccessDeniedException" ->
          `AccessDeniedException (Json_deserializers.access_denied_exception_of_yojson tree path)
      | _, "ClientException" ->
          `ClientException (Json_deserializers.client_exception_of_yojson tree path)
      | _, "InvalidParameterException" ->
          `InvalidParameterException
            (Json_deserializers.invalid_parameter_exception_of_yojson tree path)
      | _, "ServerException" ->
          `ServerException (Json_deserializers.server_exception_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : describe_daemon_task_definition_request) =
    let input = Json_serializers.describe_daemon_task_definition_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request
      ~shape_name:"AmazonEC2ContainerServiceV20141113.DescribeDaemonTaskDefinition" ~service
      ~context ~input
      ~output_deserializer:Json_deserializers.describe_daemon_task_definition_response_of_yojson
      ~error_deserializer

  let request_with_metadata context (request : describe_daemon_task_definition_request) =
    let input = Json_serializers.describe_daemon_task_definition_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata
      ~shape_name:"AmazonEC2ContainerServiceV20141113.DescribeDaemonTaskDefinition" ~service
      ~context ~input
      ~output_deserializer:Json_deserializers.describe_daemon_task_definition_response_of_yojson
      ~error_deserializer
end

module DescribeDaemonRevisions = struct
  let error_to_string = function
    | `AccessDeniedException _ -> "com.amazonaws.ecs#AccessDeniedException"
    | `ClientException _ -> "com.amazonaws.ecs#ClientException"
    | `ClusterNotFoundException _ -> "com.amazonaws.ecs#ClusterNotFoundException"
    | `InvalidParameterException _ -> "com.amazonaws.ecs#InvalidParameterException"
    | `ServerException _ -> "com.amazonaws.ecs#ServerException"
    | `UnsupportedFeatureException _ -> "com.amazonaws.ecs#UnsupportedFeatureException"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "AccessDeniedException" ->
          `AccessDeniedException (Json_deserializers.access_denied_exception_of_yojson tree path)
      | _, "ClientException" ->
          `ClientException (Json_deserializers.client_exception_of_yojson tree path)
      | _, "ClusterNotFoundException" ->
          `ClusterNotFoundException
            (Json_deserializers.cluster_not_found_exception_of_yojson tree path)
      | _, "InvalidParameterException" ->
          `InvalidParameterException
            (Json_deserializers.invalid_parameter_exception_of_yojson tree path)
      | _, "ServerException" ->
          `ServerException (Json_deserializers.server_exception_of_yojson tree path)
      | _, "UnsupportedFeatureException" ->
          `UnsupportedFeatureException
            (Json_deserializers.unsupported_feature_exception_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : describe_daemon_revisions_request) =
    let input = Json_serializers.describe_daemon_revisions_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request
      ~shape_name:"AmazonEC2ContainerServiceV20141113.DescribeDaemonRevisions" ~service ~context
      ~input ~output_deserializer:Json_deserializers.describe_daemon_revisions_response_of_yojson
      ~error_deserializer

  let request_with_metadata context (request : describe_daemon_revisions_request) =
    let input = Json_serializers.describe_daemon_revisions_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata
      ~shape_name:"AmazonEC2ContainerServiceV20141113.DescribeDaemonRevisions" ~service ~context
      ~input ~output_deserializer:Json_deserializers.describe_daemon_revisions_response_of_yojson
      ~error_deserializer
end

module DescribeDaemonDeployments = struct
  let error_to_string = function
    | `AccessDeniedException _ -> "com.amazonaws.ecs#AccessDeniedException"
    | `ClientException _ -> "com.amazonaws.ecs#ClientException"
    | `ClusterNotFoundException _ -> "com.amazonaws.ecs#ClusterNotFoundException"
    | `InvalidParameterException _ -> "com.amazonaws.ecs#InvalidParameterException"
    | `ServerException _ -> "com.amazonaws.ecs#ServerException"
    | `UnsupportedFeatureException _ -> "com.amazonaws.ecs#UnsupportedFeatureException"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "AccessDeniedException" ->
          `AccessDeniedException (Json_deserializers.access_denied_exception_of_yojson tree path)
      | _, "ClientException" ->
          `ClientException (Json_deserializers.client_exception_of_yojson tree path)
      | _, "ClusterNotFoundException" ->
          `ClusterNotFoundException
            (Json_deserializers.cluster_not_found_exception_of_yojson tree path)
      | _, "InvalidParameterException" ->
          `InvalidParameterException
            (Json_deserializers.invalid_parameter_exception_of_yojson tree path)
      | _, "ServerException" ->
          `ServerException (Json_deserializers.server_exception_of_yojson tree path)
      | _, "UnsupportedFeatureException" ->
          `UnsupportedFeatureException
            (Json_deserializers.unsupported_feature_exception_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : describe_daemon_deployments_request) =
    let input = Json_serializers.describe_daemon_deployments_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request
      ~shape_name:"AmazonEC2ContainerServiceV20141113.DescribeDaemonDeployments" ~service ~context
      ~input ~output_deserializer:Json_deserializers.describe_daemon_deployments_response_of_yojson
      ~error_deserializer

  let request_with_metadata context (request : describe_daemon_deployments_request) =
    let input = Json_serializers.describe_daemon_deployments_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata
      ~shape_name:"AmazonEC2ContainerServiceV20141113.DescribeDaemonDeployments" ~service ~context
      ~input ~output_deserializer:Json_deserializers.describe_daemon_deployments_response_of_yojson
      ~error_deserializer
end

module DescribeDaemon = struct
  let error_to_string = function
    | `AccessDeniedException _ -> "com.amazonaws.ecs#AccessDeniedException"
    | `ClientException _ -> "com.amazonaws.ecs#ClientException"
    | `ClusterNotFoundException _ -> "com.amazonaws.ecs#ClusterNotFoundException"
    | `DaemonNotFoundException _ -> "com.amazonaws.ecs#DaemonNotFoundException"
    | `InvalidParameterException _ -> "com.amazonaws.ecs#InvalidParameterException"
    | `ServerException _ -> "com.amazonaws.ecs#ServerException"
    | `UnsupportedFeatureException _ -> "com.amazonaws.ecs#UnsupportedFeatureException"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "AccessDeniedException" ->
          `AccessDeniedException (Json_deserializers.access_denied_exception_of_yojson tree path)
      | _, "ClientException" ->
          `ClientException (Json_deserializers.client_exception_of_yojson tree path)
      | _, "ClusterNotFoundException" ->
          `ClusterNotFoundException
            (Json_deserializers.cluster_not_found_exception_of_yojson tree path)
      | _, "DaemonNotFoundException" ->
          `DaemonNotFoundException
            (Json_deserializers.daemon_not_found_exception_of_yojson tree path)
      | _, "InvalidParameterException" ->
          `InvalidParameterException
            (Json_deserializers.invalid_parameter_exception_of_yojson tree path)
      | _, "ServerException" ->
          `ServerException (Json_deserializers.server_exception_of_yojson tree path)
      | _, "UnsupportedFeatureException" ->
          `UnsupportedFeatureException
            (Json_deserializers.unsupported_feature_exception_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : describe_daemon_request) =
    let input = Json_serializers.describe_daemon_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request
      ~shape_name:"AmazonEC2ContainerServiceV20141113.DescribeDaemon" ~service ~context ~input
      ~output_deserializer:Json_deserializers.describe_daemon_response_of_yojson ~error_deserializer

  let request_with_metadata context (request : describe_daemon_request) =
    let input = Json_serializers.describe_daemon_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata
      ~shape_name:"AmazonEC2ContainerServiceV20141113.DescribeDaemon" ~service ~context ~input
      ~output_deserializer:Json_deserializers.describe_daemon_response_of_yojson ~error_deserializer
end

module DescribeContainerInstances = struct
  let error_to_string = function
    | `AccessDeniedException _ -> "com.amazonaws.ecs#AccessDeniedException"
    | `ClientException _ -> "com.amazonaws.ecs#ClientException"
    | `ClusterNotFoundException _ -> "com.amazonaws.ecs#ClusterNotFoundException"
    | `InvalidParameterException _ -> "com.amazonaws.ecs#InvalidParameterException"
    | `ServerException _ -> "com.amazonaws.ecs#ServerException"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "AccessDeniedException" ->
          `AccessDeniedException (Json_deserializers.access_denied_exception_of_yojson tree path)
      | _, "ClientException" ->
          `ClientException (Json_deserializers.client_exception_of_yojson tree path)
      | _, "ClusterNotFoundException" ->
          `ClusterNotFoundException
            (Json_deserializers.cluster_not_found_exception_of_yojson tree path)
      | _, "InvalidParameterException" ->
          `InvalidParameterException
            (Json_deserializers.invalid_parameter_exception_of_yojson tree path)
      | _, "ServerException" ->
          `ServerException (Json_deserializers.server_exception_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : describe_container_instances_request) =
    let input = Json_serializers.describe_container_instances_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request
      ~shape_name:"AmazonEC2ContainerServiceV20141113.DescribeContainerInstances" ~service ~context
      ~input ~output_deserializer:Json_deserializers.describe_container_instances_response_of_yojson
      ~error_deserializer

  let request_with_metadata context (request : describe_container_instances_request) =
    let input = Json_serializers.describe_container_instances_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata
      ~shape_name:"AmazonEC2ContainerServiceV20141113.DescribeContainerInstances" ~service ~context
      ~input ~output_deserializer:Json_deserializers.describe_container_instances_response_of_yojson
      ~error_deserializer
end

module DescribeClusters = struct
  let error_to_string = function
    | `AccessDeniedException _ -> "com.amazonaws.ecs#AccessDeniedException"
    | `ClientException _ -> "com.amazonaws.ecs#ClientException"
    | `InvalidParameterException _ -> "com.amazonaws.ecs#InvalidParameterException"
    | `ServerException _ -> "com.amazonaws.ecs#ServerException"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "AccessDeniedException" ->
          `AccessDeniedException (Json_deserializers.access_denied_exception_of_yojson tree path)
      | _, "ClientException" ->
          `ClientException (Json_deserializers.client_exception_of_yojson tree path)
      | _, "InvalidParameterException" ->
          `InvalidParameterException
            (Json_deserializers.invalid_parameter_exception_of_yojson tree path)
      | _, "ServerException" ->
          `ServerException (Json_deserializers.server_exception_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : describe_clusters_request) =
    let input = Json_serializers.describe_clusters_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request
      ~shape_name:"AmazonEC2ContainerServiceV20141113.DescribeClusters" ~service ~context ~input
      ~output_deserializer:Json_deserializers.describe_clusters_response_of_yojson
      ~error_deserializer

  let request_with_metadata context (request : describe_clusters_request) =
    let input = Json_serializers.describe_clusters_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata
      ~shape_name:"AmazonEC2ContainerServiceV20141113.DescribeClusters" ~service ~context ~input
      ~output_deserializer:Json_deserializers.describe_clusters_response_of_yojson
      ~error_deserializer
end

module DescribeCapacityProviders = struct
  let error_to_string = function
    | `AccessDeniedException _ -> "com.amazonaws.ecs#AccessDeniedException"
    | `ClientException _ -> "com.amazonaws.ecs#ClientException"
    | `ClusterNotFoundException _ -> "com.amazonaws.ecs#ClusterNotFoundException"
    | `InvalidParameterException _ -> "com.amazonaws.ecs#InvalidParameterException"
    | `ServerException _ -> "com.amazonaws.ecs#ServerException"
    | `UnsupportedFeatureException _ -> "com.amazonaws.ecs#UnsupportedFeatureException"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "AccessDeniedException" ->
          `AccessDeniedException (Json_deserializers.access_denied_exception_of_yojson tree path)
      | _, "ClientException" ->
          `ClientException (Json_deserializers.client_exception_of_yojson tree path)
      | _, "ClusterNotFoundException" ->
          `ClusterNotFoundException
            (Json_deserializers.cluster_not_found_exception_of_yojson tree path)
      | _, "InvalidParameterException" ->
          `InvalidParameterException
            (Json_deserializers.invalid_parameter_exception_of_yojson tree path)
      | _, "ServerException" ->
          `ServerException (Json_deserializers.server_exception_of_yojson tree path)
      | _, "UnsupportedFeatureException" ->
          `UnsupportedFeatureException
            (Json_deserializers.unsupported_feature_exception_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : describe_capacity_providers_request) =
    let input = Json_serializers.describe_capacity_providers_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request
      ~shape_name:"AmazonEC2ContainerServiceV20141113.DescribeCapacityProviders" ~service ~context
      ~input ~output_deserializer:Json_deserializers.describe_capacity_providers_response_of_yojson
      ~error_deserializer

  let request_with_metadata context (request : describe_capacity_providers_request) =
    let input = Json_serializers.describe_capacity_providers_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata
      ~shape_name:"AmazonEC2ContainerServiceV20141113.DescribeCapacityProviders" ~service ~context
      ~input ~output_deserializer:Json_deserializers.describe_capacity_providers_response_of_yojson
      ~error_deserializer
end

module DeregisterContainerInstance = struct
  let error_to_string = function
    | `AccessDeniedException _ -> "com.amazonaws.ecs#AccessDeniedException"
    | `ClientException _ -> "com.amazonaws.ecs#ClientException"
    | `ClusterNotFoundException _ -> "com.amazonaws.ecs#ClusterNotFoundException"
    | `InvalidParameterException _ -> "com.amazonaws.ecs#InvalidParameterException"
    | `ServerException _ -> "com.amazonaws.ecs#ServerException"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "AccessDeniedException" ->
          `AccessDeniedException (Json_deserializers.access_denied_exception_of_yojson tree path)
      | _, "ClientException" ->
          `ClientException (Json_deserializers.client_exception_of_yojson tree path)
      | _, "ClusterNotFoundException" ->
          `ClusterNotFoundException
            (Json_deserializers.cluster_not_found_exception_of_yojson tree path)
      | _, "InvalidParameterException" ->
          `InvalidParameterException
            (Json_deserializers.invalid_parameter_exception_of_yojson tree path)
      | _, "ServerException" ->
          `ServerException (Json_deserializers.server_exception_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : deregister_container_instance_request) =
    let input = Json_serializers.deregister_container_instance_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request
      ~shape_name:"AmazonEC2ContainerServiceV20141113.DeregisterContainerInstance" ~service ~context
      ~input
      ~output_deserializer:Json_deserializers.deregister_container_instance_response_of_yojson
      ~error_deserializer

  let request_with_metadata context (request : deregister_container_instance_request) =
    let input = Json_serializers.deregister_container_instance_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata
      ~shape_name:"AmazonEC2ContainerServiceV20141113.DeregisterContainerInstance" ~service ~context
      ~input
      ~output_deserializer:Json_deserializers.deregister_container_instance_response_of_yojson
      ~error_deserializer
end

module DeleteTaskSet = struct
  let error_to_string = function
    | `AccessDeniedException _ -> "com.amazonaws.ecs#AccessDeniedException"
    | `ClientException _ -> "com.amazonaws.ecs#ClientException"
    | `ClusterNotFoundException _ -> "com.amazonaws.ecs#ClusterNotFoundException"
    | `InvalidParameterException _ -> "com.amazonaws.ecs#InvalidParameterException"
    | `LimitExceededException _ -> "com.amazonaws.ecs#LimitExceededException"
    | `ServerException _ -> "com.amazonaws.ecs#ServerException"
    | `ServiceNotActiveException _ -> "com.amazonaws.ecs#ServiceNotActiveException"
    | `ServiceNotFoundException _ -> "com.amazonaws.ecs#ServiceNotFoundException"
    | `TaskSetNotFoundException _ -> "com.amazonaws.ecs#TaskSetNotFoundException"
    | `UnsupportedFeatureException _ -> "com.amazonaws.ecs#UnsupportedFeatureException"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "AccessDeniedException" ->
          `AccessDeniedException (Json_deserializers.access_denied_exception_of_yojson tree path)
      | _, "ClientException" ->
          `ClientException (Json_deserializers.client_exception_of_yojson tree path)
      | _, "ClusterNotFoundException" ->
          `ClusterNotFoundException
            (Json_deserializers.cluster_not_found_exception_of_yojson tree path)
      | _, "InvalidParameterException" ->
          `InvalidParameterException
            (Json_deserializers.invalid_parameter_exception_of_yojson tree path)
      | _, "LimitExceededException" ->
          `LimitExceededException (Json_deserializers.limit_exceeded_exception_of_yojson tree path)
      | _, "ServerException" ->
          `ServerException (Json_deserializers.server_exception_of_yojson tree path)
      | _, "ServiceNotActiveException" ->
          `ServiceNotActiveException
            (Json_deserializers.service_not_active_exception_of_yojson tree path)
      | _, "ServiceNotFoundException" ->
          `ServiceNotFoundException
            (Json_deserializers.service_not_found_exception_of_yojson tree path)
      | _, "TaskSetNotFoundException" ->
          `TaskSetNotFoundException
            (Json_deserializers.task_set_not_found_exception_of_yojson tree path)
      | _, "UnsupportedFeatureException" ->
          `UnsupportedFeatureException
            (Json_deserializers.unsupported_feature_exception_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : delete_task_set_request) =
    let input = Json_serializers.delete_task_set_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request
      ~shape_name:"AmazonEC2ContainerServiceV20141113.DeleteTaskSet" ~service ~context ~input
      ~output_deserializer:Json_deserializers.delete_task_set_response_of_yojson ~error_deserializer

  let request_with_metadata context (request : delete_task_set_request) =
    let input = Json_serializers.delete_task_set_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata
      ~shape_name:"AmazonEC2ContainerServiceV20141113.DeleteTaskSet" ~service ~context ~input
      ~output_deserializer:Json_deserializers.delete_task_set_response_of_yojson ~error_deserializer
end

module DeleteTaskDefinitions = struct
  let error_to_string = function
    | `AccessDeniedException _ -> "com.amazonaws.ecs#AccessDeniedException"
    | `ClientException _ -> "com.amazonaws.ecs#ClientException"
    | `InvalidParameterException _ -> "com.amazonaws.ecs#InvalidParameterException"
    | `ServerException _ -> "com.amazonaws.ecs#ServerException"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "AccessDeniedException" ->
          `AccessDeniedException (Json_deserializers.access_denied_exception_of_yojson tree path)
      | _, "ClientException" ->
          `ClientException (Json_deserializers.client_exception_of_yojson tree path)
      | _, "InvalidParameterException" ->
          `InvalidParameterException
            (Json_deserializers.invalid_parameter_exception_of_yojson tree path)
      | _, "ServerException" ->
          `ServerException (Json_deserializers.server_exception_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : delete_task_definitions_request) =
    let input = Json_serializers.delete_task_definitions_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request
      ~shape_name:"AmazonEC2ContainerServiceV20141113.DeleteTaskDefinitions" ~service ~context
      ~input ~output_deserializer:Json_deserializers.delete_task_definitions_response_of_yojson
      ~error_deserializer

  let request_with_metadata context (request : delete_task_definitions_request) =
    let input = Json_serializers.delete_task_definitions_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata
      ~shape_name:"AmazonEC2ContainerServiceV20141113.DeleteTaskDefinitions" ~service ~context
      ~input ~output_deserializer:Json_deserializers.delete_task_definitions_response_of_yojson
      ~error_deserializer
end

module DeleteService = struct
  let error_to_string = function
    | `AccessDeniedException _ -> "com.amazonaws.ecs#AccessDeniedException"
    | `ClientException _ -> "com.amazonaws.ecs#ClientException"
    | `ClusterNotFoundException _ -> "com.amazonaws.ecs#ClusterNotFoundException"
    | `InvalidParameterException _ -> "com.amazonaws.ecs#InvalidParameterException"
    | `ServerException _ -> "com.amazonaws.ecs#ServerException"
    | `ServiceNotFoundException _ -> "com.amazonaws.ecs#ServiceNotFoundException"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "AccessDeniedException" ->
          `AccessDeniedException (Json_deserializers.access_denied_exception_of_yojson tree path)
      | _, "ClientException" ->
          `ClientException (Json_deserializers.client_exception_of_yojson tree path)
      | _, "ClusterNotFoundException" ->
          `ClusterNotFoundException
            (Json_deserializers.cluster_not_found_exception_of_yojson tree path)
      | _, "InvalidParameterException" ->
          `InvalidParameterException
            (Json_deserializers.invalid_parameter_exception_of_yojson tree path)
      | _, "ServerException" ->
          `ServerException (Json_deserializers.server_exception_of_yojson tree path)
      | _, "ServiceNotFoundException" ->
          `ServiceNotFoundException
            (Json_deserializers.service_not_found_exception_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : delete_service_request) =
    let input = Json_serializers.delete_service_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request
      ~shape_name:"AmazonEC2ContainerServiceV20141113.DeleteService" ~service ~context ~input
      ~output_deserializer:Json_deserializers.delete_service_response_of_yojson ~error_deserializer

  let request_with_metadata context (request : delete_service_request) =
    let input = Json_serializers.delete_service_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata
      ~shape_name:"AmazonEC2ContainerServiceV20141113.DeleteService" ~service ~context ~input
      ~output_deserializer:Json_deserializers.delete_service_response_of_yojson ~error_deserializer
end

module DeleteExpressGatewayService = struct
  let error_to_string = function
    | `AccessDeniedException _ -> "com.amazonaws.ecs#AccessDeniedException"
    | `ClientException _ -> "com.amazonaws.ecs#ClientException"
    | `ClusterNotFoundException _ -> "com.amazonaws.ecs#ClusterNotFoundException"
    | `InvalidParameterException _ -> "com.amazonaws.ecs#InvalidParameterException"
    | `ServerException _ -> "com.amazonaws.ecs#ServerException"
    | `ServiceNotActiveException _ -> "com.amazonaws.ecs#ServiceNotActiveException"
    | `ServiceNotFoundException _ -> "com.amazonaws.ecs#ServiceNotFoundException"
    | `UnsupportedFeatureException _ -> "com.amazonaws.ecs#UnsupportedFeatureException"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "AccessDeniedException" ->
          `AccessDeniedException (Json_deserializers.access_denied_exception_of_yojson tree path)
      | _, "ClientException" ->
          `ClientException (Json_deserializers.client_exception_of_yojson tree path)
      | _, "ClusterNotFoundException" ->
          `ClusterNotFoundException
            (Json_deserializers.cluster_not_found_exception_of_yojson tree path)
      | _, "InvalidParameterException" ->
          `InvalidParameterException
            (Json_deserializers.invalid_parameter_exception_of_yojson tree path)
      | _, "ServerException" ->
          `ServerException (Json_deserializers.server_exception_of_yojson tree path)
      | _, "ServiceNotActiveException" ->
          `ServiceNotActiveException
            (Json_deserializers.service_not_active_exception_of_yojson tree path)
      | _, "ServiceNotFoundException" ->
          `ServiceNotFoundException
            (Json_deserializers.service_not_found_exception_of_yojson tree path)
      | _, "UnsupportedFeatureException" ->
          `UnsupportedFeatureException
            (Json_deserializers.unsupported_feature_exception_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : delete_express_gateway_service_request) =
    let input = Json_serializers.delete_express_gateway_service_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request
      ~shape_name:"AmazonEC2ContainerServiceV20141113.DeleteExpressGatewayService" ~service ~context
      ~input
      ~output_deserializer:Json_deserializers.delete_express_gateway_service_response_of_yojson
      ~error_deserializer

  let request_with_metadata context (request : delete_express_gateway_service_request) =
    let input = Json_serializers.delete_express_gateway_service_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata
      ~shape_name:"AmazonEC2ContainerServiceV20141113.DeleteExpressGatewayService" ~service ~context
      ~input
      ~output_deserializer:Json_deserializers.delete_express_gateway_service_response_of_yojson
      ~error_deserializer
end

module DeleteDaemonTaskDefinition = struct
  let error_to_string = function
    | `AccessDeniedException _ -> "com.amazonaws.ecs#AccessDeniedException"
    | `ClientException _ -> "com.amazonaws.ecs#ClientException"
    | `InvalidParameterException _ -> "com.amazonaws.ecs#InvalidParameterException"
    | `ServerException _ -> "com.amazonaws.ecs#ServerException"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "AccessDeniedException" ->
          `AccessDeniedException (Json_deserializers.access_denied_exception_of_yojson tree path)
      | _, "ClientException" ->
          `ClientException (Json_deserializers.client_exception_of_yojson tree path)
      | _, "InvalidParameterException" ->
          `InvalidParameterException
            (Json_deserializers.invalid_parameter_exception_of_yojson tree path)
      | _, "ServerException" ->
          `ServerException (Json_deserializers.server_exception_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : delete_daemon_task_definition_request) =
    let input = Json_serializers.delete_daemon_task_definition_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request
      ~shape_name:"AmazonEC2ContainerServiceV20141113.DeleteDaemonTaskDefinition" ~service ~context
      ~input
      ~output_deserializer:Json_deserializers.delete_daemon_task_definition_response_of_yojson
      ~error_deserializer

  let request_with_metadata context (request : delete_daemon_task_definition_request) =
    let input = Json_serializers.delete_daemon_task_definition_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata
      ~shape_name:"AmazonEC2ContainerServiceV20141113.DeleteDaemonTaskDefinition" ~service ~context
      ~input
      ~output_deserializer:Json_deserializers.delete_daemon_task_definition_response_of_yojson
      ~error_deserializer
end

module DeleteDaemon = struct
  let error_to_string = function
    | `AccessDeniedException _ -> "com.amazonaws.ecs#AccessDeniedException"
    | `ClientException _ -> "com.amazonaws.ecs#ClientException"
    | `ClusterNotFoundException _ -> "com.amazonaws.ecs#ClusterNotFoundException"
    | `DaemonNotActiveException _ -> "com.amazonaws.ecs#DaemonNotActiveException"
    | `DaemonNotFoundException _ -> "com.amazonaws.ecs#DaemonNotFoundException"
    | `InvalidParameterException _ -> "com.amazonaws.ecs#InvalidParameterException"
    | `ServerException _ -> "com.amazonaws.ecs#ServerException"
    | `UnsupportedFeatureException _ -> "com.amazonaws.ecs#UnsupportedFeatureException"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "AccessDeniedException" ->
          `AccessDeniedException (Json_deserializers.access_denied_exception_of_yojson tree path)
      | _, "ClientException" ->
          `ClientException (Json_deserializers.client_exception_of_yojson tree path)
      | _, "ClusterNotFoundException" ->
          `ClusterNotFoundException
            (Json_deserializers.cluster_not_found_exception_of_yojson tree path)
      | _, "DaemonNotActiveException" ->
          `DaemonNotActiveException
            (Json_deserializers.daemon_not_active_exception_of_yojson tree path)
      | _, "DaemonNotFoundException" ->
          `DaemonNotFoundException
            (Json_deserializers.daemon_not_found_exception_of_yojson tree path)
      | _, "InvalidParameterException" ->
          `InvalidParameterException
            (Json_deserializers.invalid_parameter_exception_of_yojson tree path)
      | _, "ServerException" ->
          `ServerException (Json_deserializers.server_exception_of_yojson tree path)
      | _, "UnsupportedFeatureException" ->
          `UnsupportedFeatureException
            (Json_deserializers.unsupported_feature_exception_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : delete_daemon_request) =
    let input = Json_serializers.delete_daemon_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request
      ~shape_name:"AmazonEC2ContainerServiceV20141113.DeleteDaemon" ~service ~context ~input
      ~output_deserializer:Json_deserializers.delete_daemon_response_of_yojson ~error_deserializer

  let request_with_metadata context (request : delete_daemon_request) =
    let input = Json_serializers.delete_daemon_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata
      ~shape_name:"AmazonEC2ContainerServiceV20141113.DeleteDaemon" ~service ~context ~input
      ~output_deserializer:Json_deserializers.delete_daemon_response_of_yojson ~error_deserializer
end

module DeleteCluster = struct
  let error_to_string = function
    | `AccessDeniedException _ -> "com.amazonaws.ecs#AccessDeniedException"
    | `ClientException _ -> "com.amazonaws.ecs#ClientException"
    | `ClusterContainsCapacityProviderException _ ->
        "com.amazonaws.ecs#ClusterContainsCapacityProviderException"
    | `ClusterContainsContainerInstancesException _ ->
        "com.amazonaws.ecs#ClusterContainsContainerInstancesException"
    | `ClusterContainsServicesException _ -> "com.amazonaws.ecs#ClusterContainsServicesException"
    | `ClusterContainsTasksException _ -> "com.amazonaws.ecs#ClusterContainsTasksException"
    | `ClusterNotFoundException _ -> "com.amazonaws.ecs#ClusterNotFoundException"
    | `InvalidParameterException _ -> "com.amazonaws.ecs#InvalidParameterException"
    | `ServerException _ -> "com.amazonaws.ecs#ServerException"
    | `UpdateInProgressException _ -> "com.amazonaws.ecs#UpdateInProgressException"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "AccessDeniedException" ->
          `AccessDeniedException (Json_deserializers.access_denied_exception_of_yojson tree path)
      | _, "ClientException" ->
          `ClientException (Json_deserializers.client_exception_of_yojson tree path)
      | _, "ClusterContainsCapacityProviderException" ->
          `ClusterContainsCapacityProviderException
            (Json_deserializers.cluster_contains_capacity_provider_exception_of_yojson tree path)
      | _, "ClusterContainsContainerInstancesException" ->
          `ClusterContainsContainerInstancesException
            (Json_deserializers.cluster_contains_container_instances_exception_of_yojson tree path)
      | _, "ClusterContainsServicesException" ->
          `ClusterContainsServicesException
            (Json_deserializers.cluster_contains_services_exception_of_yojson tree path)
      | _, "ClusterContainsTasksException" ->
          `ClusterContainsTasksException
            (Json_deserializers.cluster_contains_tasks_exception_of_yojson tree path)
      | _, "ClusterNotFoundException" ->
          `ClusterNotFoundException
            (Json_deserializers.cluster_not_found_exception_of_yojson tree path)
      | _, "InvalidParameterException" ->
          `InvalidParameterException
            (Json_deserializers.invalid_parameter_exception_of_yojson tree path)
      | _, "ServerException" ->
          `ServerException (Json_deserializers.server_exception_of_yojson tree path)
      | _, "UpdateInProgressException" ->
          `UpdateInProgressException
            (Json_deserializers.update_in_progress_exception_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : delete_cluster_request) =
    let input = Json_serializers.delete_cluster_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request
      ~shape_name:"AmazonEC2ContainerServiceV20141113.DeleteCluster" ~service ~context ~input
      ~output_deserializer:Json_deserializers.delete_cluster_response_of_yojson ~error_deserializer

  let request_with_metadata context (request : delete_cluster_request) =
    let input = Json_serializers.delete_cluster_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata
      ~shape_name:"AmazonEC2ContainerServiceV20141113.DeleteCluster" ~service ~context ~input
      ~output_deserializer:Json_deserializers.delete_cluster_response_of_yojson ~error_deserializer
end

module DeleteCapacityProvider = struct
  let error_to_string = function
    | `AccessDeniedException _ -> "com.amazonaws.ecs#AccessDeniedException"
    | `ClientException _ -> "com.amazonaws.ecs#ClientException"
    | `ClusterNotFoundException _ -> "com.amazonaws.ecs#ClusterNotFoundException"
    | `InvalidParameterException _ -> "com.amazonaws.ecs#InvalidParameterException"
    | `ServerException _ -> "com.amazonaws.ecs#ServerException"
    | `UnsupportedFeatureException _ -> "com.amazonaws.ecs#UnsupportedFeatureException"
    | `UpdateInProgressException _ -> "com.amazonaws.ecs#UpdateInProgressException"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "AccessDeniedException" ->
          `AccessDeniedException (Json_deserializers.access_denied_exception_of_yojson tree path)
      | _, "ClientException" ->
          `ClientException (Json_deserializers.client_exception_of_yojson tree path)
      | _, "ClusterNotFoundException" ->
          `ClusterNotFoundException
            (Json_deserializers.cluster_not_found_exception_of_yojson tree path)
      | _, "InvalidParameterException" ->
          `InvalidParameterException
            (Json_deserializers.invalid_parameter_exception_of_yojson tree path)
      | _, "ServerException" ->
          `ServerException (Json_deserializers.server_exception_of_yojson tree path)
      | _, "UnsupportedFeatureException" ->
          `UnsupportedFeatureException
            (Json_deserializers.unsupported_feature_exception_of_yojson tree path)
      | _, "UpdateInProgressException" ->
          `UpdateInProgressException
            (Json_deserializers.update_in_progress_exception_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : delete_capacity_provider_request) =
    let input = Json_serializers.delete_capacity_provider_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request
      ~shape_name:"AmazonEC2ContainerServiceV20141113.DeleteCapacityProvider" ~service ~context
      ~input ~output_deserializer:Json_deserializers.delete_capacity_provider_response_of_yojson
      ~error_deserializer

  let request_with_metadata context (request : delete_capacity_provider_request) =
    let input = Json_serializers.delete_capacity_provider_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata
      ~shape_name:"AmazonEC2ContainerServiceV20141113.DeleteCapacityProvider" ~service ~context
      ~input ~output_deserializer:Json_deserializers.delete_capacity_provider_response_of_yojson
      ~error_deserializer
end

module DeleteAttributes = struct
  let error_to_string = function
    | `AccessDeniedException _ -> "com.amazonaws.ecs#AccessDeniedException"
    | `ClientException _ -> "com.amazonaws.ecs#ClientException"
    | `ClusterNotFoundException _ -> "com.amazonaws.ecs#ClusterNotFoundException"
    | `InvalidParameterException _ -> "com.amazonaws.ecs#InvalidParameterException"
    | `ServerException _ -> "com.amazonaws.ecs#ServerException"
    | `TargetNotFoundException _ -> "com.amazonaws.ecs#TargetNotFoundException"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "AccessDeniedException" ->
          `AccessDeniedException (Json_deserializers.access_denied_exception_of_yojson tree path)
      | _, "ClientException" ->
          `ClientException (Json_deserializers.client_exception_of_yojson tree path)
      | _, "ClusterNotFoundException" ->
          `ClusterNotFoundException
            (Json_deserializers.cluster_not_found_exception_of_yojson tree path)
      | _, "InvalidParameterException" ->
          `InvalidParameterException
            (Json_deserializers.invalid_parameter_exception_of_yojson tree path)
      | _, "ServerException" ->
          `ServerException (Json_deserializers.server_exception_of_yojson tree path)
      | _, "TargetNotFoundException" ->
          `TargetNotFoundException
            (Json_deserializers.target_not_found_exception_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : delete_attributes_request) =
    let input = Json_serializers.delete_attributes_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request
      ~shape_name:"AmazonEC2ContainerServiceV20141113.DeleteAttributes" ~service ~context ~input
      ~output_deserializer:Json_deserializers.delete_attributes_response_of_yojson
      ~error_deserializer

  let request_with_metadata context (request : delete_attributes_request) =
    let input = Json_serializers.delete_attributes_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata
      ~shape_name:"AmazonEC2ContainerServiceV20141113.DeleteAttributes" ~service ~context ~input
      ~output_deserializer:Json_deserializers.delete_attributes_response_of_yojson
      ~error_deserializer
end

module CreateTaskSet = struct
  let error_to_string = function
    | `AccessDeniedException _ -> "com.amazonaws.ecs#AccessDeniedException"
    | `ClientException _ -> "com.amazonaws.ecs#ClientException"
    | `ClusterNotFoundException _ -> "com.amazonaws.ecs#ClusterNotFoundException"
    | `InvalidParameterException _ -> "com.amazonaws.ecs#InvalidParameterException"
    | `LimitExceededException _ -> "com.amazonaws.ecs#LimitExceededException"
    | `NamespaceNotFoundException _ -> "com.amazonaws.ecs#NamespaceNotFoundException"
    | `PlatformTaskDefinitionIncompatibilityException _ ->
        "com.amazonaws.ecs#PlatformTaskDefinitionIncompatibilityException"
    | `PlatformUnknownException _ -> "com.amazonaws.ecs#PlatformUnknownException"
    | `ServerException _ -> "com.amazonaws.ecs#ServerException"
    | `ServiceNotActiveException _ -> "com.amazonaws.ecs#ServiceNotActiveException"
    | `ServiceNotFoundException _ -> "com.amazonaws.ecs#ServiceNotFoundException"
    | `UnsupportedFeatureException _ -> "com.amazonaws.ecs#UnsupportedFeatureException"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "AccessDeniedException" ->
          `AccessDeniedException (Json_deserializers.access_denied_exception_of_yojson tree path)
      | _, "ClientException" ->
          `ClientException (Json_deserializers.client_exception_of_yojson tree path)
      | _, "ClusterNotFoundException" ->
          `ClusterNotFoundException
            (Json_deserializers.cluster_not_found_exception_of_yojson tree path)
      | _, "InvalidParameterException" ->
          `InvalidParameterException
            (Json_deserializers.invalid_parameter_exception_of_yojson tree path)
      | _, "LimitExceededException" ->
          `LimitExceededException (Json_deserializers.limit_exceeded_exception_of_yojson tree path)
      | _, "NamespaceNotFoundException" ->
          `NamespaceNotFoundException
            (Json_deserializers.namespace_not_found_exception_of_yojson tree path)
      | _, "PlatformTaskDefinitionIncompatibilityException" ->
          `PlatformTaskDefinitionIncompatibilityException
            (Json_deserializers.platform_task_definition_incompatibility_exception_of_yojson tree
               path)
      | _, "PlatformUnknownException" ->
          `PlatformUnknownException
            (Json_deserializers.platform_unknown_exception_of_yojson tree path)
      | _, "ServerException" ->
          `ServerException (Json_deserializers.server_exception_of_yojson tree path)
      | _, "ServiceNotActiveException" ->
          `ServiceNotActiveException
            (Json_deserializers.service_not_active_exception_of_yojson tree path)
      | _, "ServiceNotFoundException" ->
          `ServiceNotFoundException
            (Json_deserializers.service_not_found_exception_of_yojson tree path)
      | _, "UnsupportedFeatureException" ->
          `UnsupportedFeatureException
            (Json_deserializers.unsupported_feature_exception_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : create_task_set_request) =
    let input = Json_serializers.create_task_set_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request
      ~shape_name:"AmazonEC2ContainerServiceV20141113.CreateTaskSet" ~service ~context ~input
      ~output_deserializer:Json_deserializers.create_task_set_response_of_yojson ~error_deserializer

  let request_with_metadata context (request : create_task_set_request) =
    let input = Json_serializers.create_task_set_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata
      ~shape_name:"AmazonEC2ContainerServiceV20141113.CreateTaskSet" ~service ~context ~input
      ~output_deserializer:Json_deserializers.create_task_set_response_of_yojson ~error_deserializer
end

module CreateService = struct
  let error_to_string = function
    | `AccessDeniedException _ -> "com.amazonaws.ecs#AccessDeniedException"
    | `ClientException _ -> "com.amazonaws.ecs#ClientException"
    | `ClusterNotFoundException _ -> "com.amazonaws.ecs#ClusterNotFoundException"
    | `InvalidParameterException _ -> "com.amazonaws.ecs#InvalidParameterException"
    | `NamespaceNotFoundException _ -> "com.amazonaws.ecs#NamespaceNotFoundException"
    | `PlatformTaskDefinitionIncompatibilityException _ ->
        "com.amazonaws.ecs#PlatformTaskDefinitionIncompatibilityException"
    | `PlatformUnknownException _ -> "com.amazonaws.ecs#PlatformUnknownException"
    | `ServerException _ -> "com.amazonaws.ecs#ServerException"
    | `UnsupportedFeatureException _ -> "com.amazonaws.ecs#UnsupportedFeatureException"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "AccessDeniedException" ->
          `AccessDeniedException (Json_deserializers.access_denied_exception_of_yojson tree path)
      | _, "ClientException" ->
          `ClientException (Json_deserializers.client_exception_of_yojson tree path)
      | _, "ClusterNotFoundException" ->
          `ClusterNotFoundException
            (Json_deserializers.cluster_not_found_exception_of_yojson tree path)
      | _, "InvalidParameterException" ->
          `InvalidParameterException
            (Json_deserializers.invalid_parameter_exception_of_yojson tree path)
      | _, "NamespaceNotFoundException" ->
          `NamespaceNotFoundException
            (Json_deserializers.namespace_not_found_exception_of_yojson tree path)
      | _, "PlatformTaskDefinitionIncompatibilityException" ->
          `PlatformTaskDefinitionIncompatibilityException
            (Json_deserializers.platform_task_definition_incompatibility_exception_of_yojson tree
               path)
      | _, "PlatformUnknownException" ->
          `PlatformUnknownException
            (Json_deserializers.platform_unknown_exception_of_yojson tree path)
      | _, "ServerException" ->
          `ServerException (Json_deserializers.server_exception_of_yojson tree path)
      | _, "UnsupportedFeatureException" ->
          `UnsupportedFeatureException
            (Json_deserializers.unsupported_feature_exception_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : create_service_request) =
    let input = Json_serializers.create_service_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request
      ~shape_name:"AmazonEC2ContainerServiceV20141113.CreateService" ~service ~context ~input
      ~output_deserializer:Json_deserializers.create_service_response_of_yojson ~error_deserializer

  let request_with_metadata context (request : create_service_request) =
    let input = Json_serializers.create_service_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata
      ~shape_name:"AmazonEC2ContainerServiceV20141113.CreateService" ~service ~context ~input
      ~output_deserializer:Json_deserializers.create_service_response_of_yojson ~error_deserializer
end

module CreateExpressGatewayService = struct
  let error_to_string = function
    | `AccessDeniedException _ -> "com.amazonaws.ecs#AccessDeniedException"
    | `ClientException _ -> "com.amazonaws.ecs#ClientException"
    | `ClusterNotFoundException _ -> "com.amazonaws.ecs#ClusterNotFoundException"
    | `InvalidParameterException _ -> "com.amazonaws.ecs#InvalidParameterException"
    | `PlatformTaskDefinitionIncompatibilityException _ ->
        "com.amazonaws.ecs#PlatformTaskDefinitionIncompatibilityException"
    | `PlatformUnknownException _ -> "com.amazonaws.ecs#PlatformUnknownException"
    | `ServerException _ -> "com.amazonaws.ecs#ServerException"
    | `UnsupportedFeatureException _ -> "com.amazonaws.ecs#UnsupportedFeatureException"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "AccessDeniedException" ->
          `AccessDeniedException (Json_deserializers.access_denied_exception_of_yojson tree path)
      | _, "ClientException" ->
          `ClientException (Json_deserializers.client_exception_of_yojson tree path)
      | _, "ClusterNotFoundException" ->
          `ClusterNotFoundException
            (Json_deserializers.cluster_not_found_exception_of_yojson tree path)
      | _, "InvalidParameterException" ->
          `InvalidParameterException
            (Json_deserializers.invalid_parameter_exception_of_yojson tree path)
      | _, "PlatformTaskDefinitionIncompatibilityException" ->
          `PlatformTaskDefinitionIncompatibilityException
            (Json_deserializers.platform_task_definition_incompatibility_exception_of_yojson tree
               path)
      | _, "PlatformUnknownException" ->
          `PlatformUnknownException
            (Json_deserializers.platform_unknown_exception_of_yojson tree path)
      | _, "ServerException" ->
          `ServerException (Json_deserializers.server_exception_of_yojson tree path)
      | _, "UnsupportedFeatureException" ->
          `UnsupportedFeatureException
            (Json_deserializers.unsupported_feature_exception_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : create_express_gateway_service_request) =
    let input = Json_serializers.create_express_gateway_service_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request
      ~shape_name:"AmazonEC2ContainerServiceV20141113.CreateExpressGatewayService" ~service ~context
      ~input
      ~output_deserializer:Json_deserializers.create_express_gateway_service_response_of_yojson
      ~error_deserializer

  let request_with_metadata context (request : create_express_gateway_service_request) =
    let input = Json_serializers.create_express_gateway_service_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata
      ~shape_name:"AmazonEC2ContainerServiceV20141113.CreateExpressGatewayService" ~service ~context
      ~input
      ~output_deserializer:Json_deserializers.create_express_gateway_service_response_of_yojson
      ~error_deserializer
end

module CreateDaemon = struct
  let error_to_string = function
    | `AccessDeniedException _ -> "com.amazonaws.ecs#AccessDeniedException"
    | `ClientException _ -> "com.amazonaws.ecs#ClientException"
    | `ClusterNotFoundException _ -> "com.amazonaws.ecs#ClusterNotFoundException"
    | `InvalidParameterException _ -> "com.amazonaws.ecs#InvalidParameterException"
    | `PlatformUnknownException _ -> "com.amazonaws.ecs#PlatformUnknownException"
    | `ServerException _ -> "com.amazonaws.ecs#ServerException"
    | `UnsupportedFeatureException _ -> "com.amazonaws.ecs#UnsupportedFeatureException"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "AccessDeniedException" ->
          `AccessDeniedException (Json_deserializers.access_denied_exception_of_yojson tree path)
      | _, "ClientException" ->
          `ClientException (Json_deserializers.client_exception_of_yojson tree path)
      | _, "ClusterNotFoundException" ->
          `ClusterNotFoundException
            (Json_deserializers.cluster_not_found_exception_of_yojson tree path)
      | _, "InvalidParameterException" ->
          `InvalidParameterException
            (Json_deserializers.invalid_parameter_exception_of_yojson tree path)
      | _, "PlatformUnknownException" ->
          `PlatformUnknownException
            (Json_deserializers.platform_unknown_exception_of_yojson tree path)
      | _, "ServerException" ->
          `ServerException (Json_deserializers.server_exception_of_yojson tree path)
      | _, "UnsupportedFeatureException" ->
          `UnsupportedFeatureException
            (Json_deserializers.unsupported_feature_exception_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : create_daemon_request) =
    let input = Json_serializers.create_daemon_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request
      ~shape_name:"AmazonEC2ContainerServiceV20141113.CreateDaemon" ~service ~context ~input
      ~output_deserializer:Json_deserializers.create_daemon_response_of_yojson ~error_deserializer

  let request_with_metadata context (request : create_daemon_request) =
    let input = Json_serializers.create_daemon_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata
      ~shape_name:"AmazonEC2ContainerServiceV20141113.CreateDaemon" ~service ~context ~input
      ~output_deserializer:Json_deserializers.create_daemon_response_of_yojson ~error_deserializer
end

module CreateCluster = struct
  let error_to_string = function
    | `AccessDeniedException _ -> "com.amazonaws.ecs#AccessDeniedException"
    | `ClientException _ -> "com.amazonaws.ecs#ClientException"
    | `InvalidParameterException _ -> "com.amazonaws.ecs#InvalidParameterException"
    | `NamespaceNotFoundException _ -> "com.amazonaws.ecs#NamespaceNotFoundException"
    | `ServerException _ -> "com.amazonaws.ecs#ServerException"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "AccessDeniedException" ->
          `AccessDeniedException (Json_deserializers.access_denied_exception_of_yojson tree path)
      | _, "ClientException" ->
          `ClientException (Json_deserializers.client_exception_of_yojson tree path)
      | _, "InvalidParameterException" ->
          `InvalidParameterException
            (Json_deserializers.invalid_parameter_exception_of_yojson tree path)
      | _, "NamespaceNotFoundException" ->
          `NamespaceNotFoundException
            (Json_deserializers.namespace_not_found_exception_of_yojson tree path)
      | _, "ServerException" ->
          `ServerException (Json_deserializers.server_exception_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : create_cluster_request) =
    let input = Json_serializers.create_cluster_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request
      ~shape_name:"AmazonEC2ContainerServiceV20141113.CreateCluster" ~service ~context ~input
      ~output_deserializer:Json_deserializers.create_cluster_response_of_yojson ~error_deserializer

  let request_with_metadata context (request : create_cluster_request) =
    let input = Json_serializers.create_cluster_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata
      ~shape_name:"AmazonEC2ContainerServiceV20141113.CreateCluster" ~service ~context ~input
      ~output_deserializer:Json_deserializers.create_cluster_response_of_yojson ~error_deserializer
end

module CreateCapacityProvider = struct
  let error_to_string = function
    | `AccessDeniedException _ -> "com.amazonaws.ecs#AccessDeniedException"
    | `ClientException _ -> "com.amazonaws.ecs#ClientException"
    | `ClusterNotFoundException _ -> "com.amazonaws.ecs#ClusterNotFoundException"
    | `InvalidParameterException _ -> "com.amazonaws.ecs#InvalidParameterException"
    | `LimitExceededException _ -> "com.amazonaws.ecs#LimitExceededException"
    | `ServerException _ -> "com.amazonaws.ecs#ServerException"
    | `UnsupportedFeatureException _ -> "com.amazonaws.ecs#UnsupportedFeatureException"
    | `UpdateInProgressException _ -> "com.amazonaws.ecs#UpdateInProgressException"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "AccessDeniedException" ->
          `AccessDeniedException (Json_deserializers.access_denied_exception_of_yojson tree path)
      | _, "ClientException" ->
          `ClientException (Json_deserializers.client_exception_of_yojson tree path)
      | _, "ClusterNotFoundException" ->
          `ClusterNotFoundException
            (Json_deserializers.cluster_not_found_exception_of_yojson tree path)
      | _, "InvalidParameterException" ->
          `InvalidParameterException
            (Json_deserializers.invalid_parameter_exception_of_yojson tree path)
      | _, "LimitExceededException" ->
          `LimitExceededException (Json_deserializers.limit_exceeded_exception_of_yojson tree path)
      | _, "ServerException" ->
          `ServerException (Json_deserializers.server_exception_of_yojson tree path)
      | _, "UnsupportedFeatureException" ->
          `UnsupportedFeatureException
            (Json_deserializers.unsupported_feature_exception_of_yojson tree path)
      | _, "UpdateInProgressException" ->
          `UpdateInProgressException
            (Json_deserializers.update_in_progress_exception_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : create_capacity_provider_request) =
    let input = Json_serializers.create_capacity_provider_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request
      ~shape_name:"AmazonEC2ContainerServiceV20141113.CreateCapacityProvider" ~service ~context
      ~input ~output_deserializer:Json_deserializers.create_capacity_provider_response_of_yojson
      ~error_deserializer

  let request_with_metadata context (request : create_capacity_provider_request) =
    let input = Json_serializers.create_capacity_provider_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata
      ~shape_name:"AmazonEC2ContainerServiceV20141113.CreateCapacityProvider" ~service ~context
      ~input ~output_deserializer:Json_deserializers.create_capacity_provider_response_of_yojson
      ~error_deserializer
end

module ContinueServiceDeployment = struct
  let error_to_string = function
    | `AccessDeniedException _ -> "com.amazonaws.ecs#AccessDeniedException"
    | `ClientException _ -> "com.amazonaws.ecs#ClientException"
    | `InvalidParameterException _ -> "com.amazonaws.ecs#InvalidParameterException"
    | `ServerException _ -> "com.amazonaws.ecs#ServerException"
    | `ServiceDeploymentNotFoundException _ ->
        "com.amazonaws.ecs#ServiceDeploymentNotFoundException"
    | `UnsupportedFeatureException _ -> "com.amazonaws.ecs#UnsupportedFeatureException"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "AccessDeniedException" ->
          `AccessDeniedException (Json_deserializers.access_denied_exception_of_yojson tree path)
      | _, "ClientException" ->
          `ClientException (Json_deserializers.client_exception_of_yojson tree path)
      | _, "InvalidParameterException" ->
          `InvalidParameterException
            (Json_deserializers.invalid_parameter_exception_of_yojson tree path)
      | _, "ServerException" ->
          `ServerException (Json_deserializers.server_exception_of_yojson tree path)
      | _, "ServiceDeploymentNotFoundException" ->
          `ServiceDeploymentNotFoundException
            (Json_deserializers.service_deployment_not_found_exception_of_yojson tree path)
      | _, "UnsupportedFeatureException" ->
          `UnsupportedFeatureException
            (Json_deserializers.unsupported_feature_exception_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : continue_service_deployment_request) =
    let input = Json_serializers.continue_service_deployment_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request
      ~shape_name:"AmazonEC2ContainerServiceV20141113.ContinueServiceDeployment" ~service ~context
      ~input ~output_deserializer:Json_deserializers.continue_service_deployment_response_of_yojson
      ~error_deserializer

  let request_with_metadata context (request : continue_service_deployment_request) =
    let input = Json_serializers.continue_service_deployment_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata
      ~shape_name:"AmazonEC2ContainerServiceV20141113.ContinueServiceDeployment" ~service ~context
      ~input ~output_deserializer:Json_deserializers.continue_service_deployment_response_of_yojson
      ~error_deserializer
end

module DeleteAccountSetting = struct
  let error_to_string = function
    | `AccessDeniedException _ -> "com.amazonaws.ecs#AccessDeniedException"
    | `ClientException _ -> "com.amazonaws.ecs#ClientException"
    | `InvalidParameterException _ -> "com.amazonaws.ecs#InvalidParameterException"
    | `ServerException _ -> "com.amazonaws.ecs#ServerException"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "AccessDeniedException" ->
          `AccessDeniedException (Json_deserializers.access_denied_exception_of_yojson tree path)
      | _, "ClientException" ->
          `ClientException (Json_deserializers.client_exception_of_yojson tree path)
      | _, "InvalidParameterException" ->
          `InvalidParameterException
            (Json_deserializers.invalid_parameter_exception_of_yojson tree path)
      | _, "ServerException" ->
          `ServerException (Json_deserializers.server_exception_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : delete_account_setting_request) =
    let input = Json_serializers.delete_account_setting_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request
      ~shape_name:"AmazonEC2ContainerServiceV20141113.DeleteAccountSetting" ~service ~context ~input
      ~output_deserializer:Json_deserializers.delete_account_setting_response_of_yojson
      ~error_deserializer

  let request_with_metadata context (request : delete_account_setting_request) =
    let input = Json_serializers.delete_account_setting_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata
      ~shape_name:"AmazonEC2ContainerServiceV20141113.DeleteAccountSetting" ~service ~context ~input
      ~output_deserializer:Json_deserializers.delete_account_setting_response_of_yojson
      ~error_deserializer
end

module DeregisterTaskDefinition = struct
  let error_to_string = function
    | `AccessDeniedException _ -> "com.amazonaws.ecs#AccessDeniedException"
    | `ClientException _ -> "com.amazonaws.ecs#ClientException"
    | `InvalidParameterException _ -> "com.amazonaws.ecs#InvalidParameterException"
    | `ServerException _ -> "com.amazonaws.ecs#ServerException"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "AccessDeniedException" ->
          `AccessDeniedException (Json_deserializers.access_denied_exception_of_yojson tree path)
      | _, "ClientException" ->
          `ClientException (Json_deserializers.client_exception_of_yojson tree path)
      | _, "InvalidParameterException" ->
          `InvalidParameterException
            (Json_deserializers.invalid_parameter_exception_of_yojson tree path)
      | _, "ServerException" ->
          `ServerException (Json_deserializers.server_exception_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : deregister_task_definition_request) =
    let input = Json_serializers.deregister_task_definition_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request
      ~shape_name:"AmazonEC2ContainerServiceV20141113.DeregisterTaskDefinition" ~service ~context
      ~input ~output_deserializer:Json_deserializers.deregister_task_definition_response_of_yojson
      ~error_deserializer

  let request_with_metadata context (request : deregister_task_definition_request) =
    let input = Json_serializers.deregister_task_definition_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata
      ~shape_name:"AmazonEC2ContainerServiceV20141113.DeregisterTaskDefinition" ~service ~context
      ~input ~output_deserializer:Json_deserializers.deregister_task_definition_response_of_yojson
      ~error_deserializer
end

module DescribeTaskDefinition = struct
  let error_to_string = function
    | `AccessDeniedException _ -> "com.amazonaws.ecs#AccessDeniedException"
    | `ClientException _ -> "com.amazonaws.ecs#ClientException"
    | `InvalidParameterException _ -> "com.amazonaws.ecs#InvalidParameterException"
    | `ServerException _ -> "com.amazonaws.ecs#ServerException"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "AccessDeniedException" ->
          `AccessDeniedException (Json_deserializers.access_denied_exception_of_yojson tree path)
      | _, "ClientException" ->
          `ClientException (Json_deserializers.client_exception_of_yojson tree path)
      | _, "InvalidParameterException" ->
          `InvalidParameterException
            (Json_deserializers.invalid_parameter_exception_of_yojson tree path)
      | _, "ServerException" ->
          `ServerException (Json_deserializers.server_exception_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : describe_task_definition_request) =
    let input = Json_serializers.describe_task_definition_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request
      ~shape_name:"AmazonEC2ContainerServiceV20141113.DescribeTaskDefinition" ~service ~context
      ~input ~output_deserializer:Json_deserializers.describe_task_definition_response_of_yojson
      ~error_deserializer

  let request_with_metadata context (request : describe_task_definition_request) =
    let input = Json_serializers.describe_task_definition_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata
      ~shape_name:"AmazonEC2ContainerServiceV20141113.DescribeTaskDefinition" ~service ~context
      ~input ~output_deserializer:Json_deserializers.describe_task_definition_response_of_yojson
      ~error_deserializer
end

module DiscoverPollEndpoint = struct
  let error_to_string = function
    | `AccessDeniedException _ -> "com.amazonaws.ecs#AccessDeniedException"
    | `ClientException _ -> "com.amazonaws.ecs#ClientException"
    | `InvalidParameterException _ -> "com.amazonaws.ecs#InvalidParameterException"
    | `ServerException _ -> "com.amazonaws.ecs#ServerException"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "AccessDeniedException" ->
          `AccessDeniedException (Json_deserializers.access_denied_exception_of_yojson tree path)
      | _, "ClientException" ->
          `ClientException (Json_deserializers.client_exception_of_yojson tree path)
      | _, "InvalidParameterException" ->
          `InvalidParameterException
            (Json_deserializers.invalid_parameter_exception_of_yojson tree path)
      | _, "ServerException" ->
          `ServerException (Json_deserializers.server_exception_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : discover_poll_endpoint_request) =
    let input = Json_serializers.discover_poll_endpoint_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request
      ~shape_name:"AmazonEC2ContainerServiceV20141113.DiscoverPollEndpoint" ~service ~context ~input
      ~output_deserializer:Json_deserializers.discover_poll_endpoint_response_of_yojson
      ~error_deserializer

  let request_with_metadata context (request : discover_poll_endpoint_request) =
    let input = Json_serializers.discover_poll_endpoint_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata
      ~shape_name:"AmazonEC2ContainerServiceV20141113.DiscoverPollEndpoint" ~service ~context ~input
      ~output_deserializer:Json_deserializers.discover_poll_endpoint_response_of_yojson
      ~error_deserializer
end

module ListAccountSettings = struct
  let error_to_string = function
    | `AccessDeniedException _ -> "com.amazonaws.ecs#AccessDeniedException"
    | `ClientException _ -> "com.amazonaws.ecs#ClientException"
    | `InvalidParameterException _ -> "com.amazonaws.ecs#InvalidParameterException"
    | `ServerException _ -> "com.amazonaws.ecs#ServerException"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "AccessDeniedException" ->
          `AccessDeniedException (Json_deserializers.access_denied_exception_of_yojson tree path)
      | _, "ClientException" ->
          `ClientException (Json_deserializers.client_exception_of_yojson tree path)
      | _, "InvalidParameterException" ->
          `InvalidParameterException
            (Json_deserializers.invalid_parameter_exception_of_yojson tree path)
      | _, "ServerException" ->
          `ServerException (Json_deserializers.server_exception_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : list_account_settings_request) =
    let input = Json_serializers.list_account_settings_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request
      ~shape_name:"AmazonEC2ContainerServiceV20141113.ListAccountSettings" ~service ~context ~input
      ~output_deserializer:Json_deserializers.list_account_settings_response_of_yojson
      ~error_deserializer

  let request_with_metadata context (request : list_account_settings_request) =
    let input = Json_serializers.list_account_settings_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata
      ~shape_name:"AmazonEC2ContainerServiceV20141113.ListAccountSettings" ~service ~context ~input
      ~output_deserializer:Json_deserializers.list_account_settings_response_of_yojson
      ~error_deserializer
end

module ListServicesByNamespace = struct
  let error_to_string = function
    | `AccessDeniedException _ -> "com.amazonaws.ecs#AccessDeniedException"
    | `ClientException _ -> "com.amazonaws.ecs#ClientException"
    | `InvalidParameterException _ -> "com.amazonaws.ecs#InvalidParameterException"
    | `NamespaceNotFoundException _ -> "com.amazonaws.ecs#NamespaceNotFoundException"
    | `ServerException _ -> "com.amazonaws.ecs#ServerException"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "AccessDeniedException" ->
          `AccessDeniedException (Json_deserializers.access_denied_exception_of_yojson tree path)
      | _, "ClientException" ->
          `ClientException (Json_deserializers.client_exception_of_yojson tree path)
      | _, "InvalidParameterException" ->
          `InvalidParameterException
            (Json_deserializers.invalid_parameter_exception_of_yojson tree path)
      | _, "NamespaceNotFoundException" ->
          `NamespaceNotFoundException
            (Json_deserializers.namespace_not_found_exception_of_yojson tree path)
      | _, "ServerException" ->
          `ServerException (Json_deserializers.server_exception_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : list_services_by_namespace_request) =
    let input = Json_serializers.list_services_by_namespace_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request
      ~shape_name:"AmazonEC2ContainerServiceV20141113.ListServicesByNamespace" ~service ~context
      ~input ~output_deserializer:Json_deserializers.list_services_by_namespace_response_of_yojson
      ~error_deserializer

  let request_with_metadata context (request : list_services_by_namespace_request) =
    let input = Json_serializers.list_services_by_namespace_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata
      ~shape_name:"AmazonEC2ContainerServiceV20141113.ListServicesByNamespace" ~service ~context
      ~input ~output_deserializer:Json_deserializers.list_services_by_namespace_response_of_yojson
      ~error_deserializer
end

module ListTagsForResource = struct
  let error_to_string = function
    | `AccessDeniedException _ -> "com.amazonaws.ecs#AccessDeniedException"
    | `ClientException _ -> "com.amazonaws.ecs#ClientException"
    | `ClusterNotFoundException _ -> "com.amazonaws.ecs#ClusterNotFoundException"
    | `InvalidParameterException _ -> "com.amazonaws.ecs#InvalidParameterException"
    | `ServerException _ -> "com.amazonaws.ecs#ServerException"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "AccessDeniedException" ->
          `AccessDeniedException (Json_deserializers.access_denied_exception_of_yojson tree path)
      | _, "ClientException" ->
          `ClientException (Json_deserializers.client_exception_of_yojson tree path)
      | _, "ClusterNotFoundException" ->
          `ClusterNotFoundException
            (Json_deserializers.cluster_not_found_exception_of_yojson tree path)
      | _, "InvalidParameterException" ->
          `InvalidParameterException
            (Json_deserializers.invalid_parameter_exception_of_yojson tree path)
      | _, "ServerException" ->
          `ServerException (Json_deserializers.server_exception_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : list_tags_for_resource_request) =
    let input = Json_serializers.list_tags_for_resource_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request
      ~shape_name:"AmazonEC2ContainerServiceV20141113.ListTagsForResource" ~service ~context ~input
      ~output_deserializer:Json_deserializers.list_tags_for_resource_response_of_yojson
      ~error_deserializer

  let request_with_metadata context (request : list_tags_for_resource_request) =
    let input = Json_serializers.list_tags_for_resource_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata
      ~shape_name:"AmazonEC2ContainerServiceV20141113.ListTagsForResource" ~service ~context ~input
      ~output_deserializer:Json_deserializers.list_tags_for_resource_response_of_yojson
      ~error_deserializer
end

module ListTaskDefinitionFamilies = struct
  let error_to_string = function
    | `AccessDeniedException _ -> "com.amazonaws.ecs#AccessDeniedException"
    | `ClientException _ -> "com.amazonaws.ecs#ClientException"
    | `InvalidParameterException _ -> "com.amazonaws.ecs#InvalidParameterException"
    | `ServerException _ -> "com.amazonaws.ecs#ServerException"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "AccessDeniedException" ->
          `AccessDeniedException (Json_deserializers.access_denied_exception_of_yojson tree path)
      | _, "ClientException" ->
          `ClientException (Json_deserializers.client_exception_of_yojson tree path)
      | _, "InvalidParameterException" ->
          `InvalidParameterException
            (Json_deserializers.invalid_parameter_exception_of_yojson tree path)
      | _, "ServerException" ->
          `ServerException (Json_deserializers.server_exception_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : list_task_definition_families_request) =
    let input = Json_serializers.list_task_definition_families_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request
      ~shape_name:"AmazonEC2ContainerServiceV20141113.ListTaskDefinitionFamilies" ~service ~context
      ~input
      ~output_deserializer:Json_deserializers.list_task_definition_families_response_of_yojson
      ~error_deserializer

  let request_with_metadata context (request : list_task_definition_families_request) =
    let input = Json_serializers.list_task_definition_families_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata
      ~shape_name:"AmazonEC2ContainerServiceV20141113.ListTaskDefinitionFamilies" ~service ~context
      ~input
      ~output_deserializer:Json_deserializers.list_task_definition_families_response_of_yojson
      ~error_deserializer
end

module PutAccountSetting = struct
  let error_to_string = function
    | `AccessDeniedException _ -> "com.amazonaws.ecs#AccessDeniedException"
    | `ClientException _ -> "com.amazonaws.ecs#ClientException"
    | `InvalidParameterException _ -> "com.amazonaws.ecs#InvalidParameterException"
    | `ServerException _ -> "com.amazonaws.ecs#ServerException"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "AccessDeniedException" ->
          `AccessDeniedException (Json_deserializers.access_denied_exception_of_yojson tree path)
      | _, "ClientException" ->
          `ClientException (Json_deserializers.client_exception_of_yojson tree path)
      | _, "InvalidParameterException" ->
          `InvalidParameterException
            (Json_deserializers.invalid_parameter_exception_of_yojson tree path)
      | _, "ServerException" ->
          `ServerException (Json_deserializers.server_exception_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : put_account_setting_request) =
    let input = Json_serializers.put_account_setting_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request
      ~shape_name:"AmazonEC2ContainerServiceV20141113.PutAccountSetting" ~service ~context ~input
      ~output_deserializer:Json_deserializers.put_account_setting_response_of_yojson
      ~error_deserializer

  let request_with_metadata context (request : put_account_setting_request) =
    let input = Json_serializers.put_account_setting_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata
      ~shape_name:"AmazonEC2ContainerServiceV20141113.PutAccountSetting" ~service ~context ~input
      ~output_deserializer:Json_deserializers.put_account_setting_response_of_yojson
      ~error_deserializer
end

module PutAccountSettingDefault = struct
  let error_to_string = function
    | `AccessDeniedException _ -> "com.amazonaws.ecs#AccessDeniedException"
    | `ClientException _ -> "com.amazonaws.ecs#ClientException"
    | `InvalidParameterException _ -> "com.amazonaws.ecs#InvalidParameterException"
    | `ServerException _ -> "com.amazonaws.ecs#ServerException"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "AccessDeniedException" ->
          `AccessDeniedException (Json_deserializers.access_denied_exception_of_yojson tree path)
      | _, "ClientException" ->
          `ClientException (Json_deserializers.client_exception_of_yojson tree path)
      | _, "InvalidParameterException" ->
          `InvalidParameterException
            (Json_deserializers.invalid_parameter_exception_of_yojson tree path)
      | _, "ServerException" ->
          `ServerException (Json_deserializers.server_exception_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : put_account_setting_default_request) =
    let input = Json_serializers.put_account_setting_default_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request
      ~shape_name:"AmazonEC2ContainerServiceV20141113.PutAccountSettingDefault" ~service ~context
      ~input ~output_deserializer:Json_deserializers.put_account_setting_default_response_of_yojson
      ~error_deserializer

  let request_with_metadata context (request : put_account_setting_default_request) =
    let input = Json_serializers.put_account_setting_default_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata
      ~shape_name:"AmazonEC2ContainerServiceV20141113.PutAccountSettingDefault" ~service ~context
      ~input ~output_deserializer:Json_deserializers.put_account_setting_default_response_of_yojson
      ~error_deserializer
end

module TagResource = struct
  let error_to_string = function
    | `AccessDeniedException _ -> "com.amazonaws.ecs#AccessDeniedException"
    | `ClientException _ -> "com.amazonaws.ecs#ClientException"
    | `ClusterNotFoundException _ -> "com.amazonaws.ecs#ClusterNotFoundException"
    | `InvalidParameterException _ -> "com.amazonaws.ecs#InvalidParameterException"
    | `LimitExceededException _ -> "com.amazonaws.ecs#LimitExceededException"
    | `ResourceNotFoundException _ -> "com.amazonaws.ecs#ResourceNotFoundException"
    | `ServerException _ -> "com.amazonaws.ecs#ServerException"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "AccessDeniedException" ->
          `AccessDeniedException (Json_deserializers.access_denied_exception_of_yojson tree path)
      | _, "ClientException" ->
          `ClientException (Json_deserializers.client_exception_of_yojson tree path)
      | _, "ClusterNotFoundException" ->
          `ClusterNotFoundException
            (Json_deserializers.cluster_not_found_exception_of_yojson tree path)
      | _, "InvalidParameterException" ->
          `InvalidParameterException
            (Json_deserializers.invalid_parameter_exception_of_yojson tree path)
      | _, "LimitExceededException" ->
          `LimitExceededException (Json_deserializers.limit_exceeded_exception_of_yojson tree path)
      | _, "ResourceNotFoundException" ->
          `ResourceNotFoundException
            (Json_deserializers.resource_not_found_exception_of_yojson tree path)
      | _, "ServerException" ->
          `ServerException (Json_deserializers.server_exception_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : tag_resource_request) =
    let input = Json_serializers.tag_resource_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"AmazonEC2ContainerServiceV20141113.TagResource"
      ~service ~context ~input
      ~output_deserializer:Json_deserializers.tag_resource_response_of_yojson ~error_deserializer

  let request_with_metadata context (request : tag_resource_request) =
    let input = Json_serializers.tag_resource_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata
      ~shape_name:"AmazonEC2ContainerServiceV20141113.TagResource" ~service ~context ~input
      ~output_deserializer:Json_deserializers.tag_resource_response_of_yojson ~error_deserializer
end

module UntagResource = struct
  let error_to_string = function
    | `AccessDeniedException _ -> "com.amazonaws.ecs#AccessDeniedException"
    | `ClientException _ -> "com.amazonaws.ecs#ClientException"
    | `ClusterNotFoundException _ -> "com.amazonaws.ecs#ClusterNotFoundException"
    | `InvalidParameterException _ -> "com.amazonaws.ecs#InvalidParameterException"
    | `ResourceNotFoundException _ -> "com.amazonaws.ecs#ResourceNotFoundException"
    | `ServerException _ -> "com.amazonaws.ecs#ServerException"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "AccessDeniedException" ->
          `AccessDeniedException (Json_deserializers.access_denied_exception_of_yojson tree path)
      | _, "ClientException" ->
          `ClientException (Json_deserializers.client_exception_of_yojson tree path)
      | _, "ClusterNotFoundException" ->
          `ClusterNotFoundException
            (Json_deserializers.cluster_not_found_exception_of_yojson tree path)
      | _, "InvalidParameterException" ->
          `InvalidParameterException
            (Json_deserializers.invalid_parameter_exception_of_yojson tree path)
      | _, "ResourceNotFoundException" ->
          `ResourceNotFoundException
            (Json_deserializers.resource_not_found_exception_of_yojson tree path)
      | _, "ServerException" ->
          `ServerException (Json_deserializers.server_exception_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : untag_resource_request) =
    let input = Json_serializers.untag_resource_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request
      ~shape_name:"AmazonEC2ContainerServiceV20141113.UntagResource" ~service ~context ~input
      ~output_deserializer:Json_deserializers.untag_resource_response_of_yojson ~error_deserializer

  let request_with_metadata context (request : untag_resource_request) =
    let input = Json_serializers.untag_resource_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata
      ~shape_name:"AmazonEC2ContainerServiceV20141113.UntagResource" ~service ~context ~input
      ~output_deserializer:Json_deserializers.untag_resource_response_of_yojson ~error_deserializer
end
