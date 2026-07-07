open Types
open Service_metadata

module CreateCluster = struct
  let error_to_string = function
    | `AccessDeniedException _ -> "com.amazonaws.pcs#AccessDeniedException"
    | `ConflictException _ -> "com.amazonaws.pcs#ConflictException"
    | `InternalServerException _ -> "com.amazonaws.pcs#InternalServerException"
    | `ServiceQuotaExceededException _ -> "com.amazonaws.pcs#ServiceQuotaExceededException"
    | `ThrottlingException _ -> "com.amazonaws.pcs#ThrottlingException"
    | `ValidationException _ -> "com.amazonaws.pcs#ValidationException"
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

  let request context (request : create_cluster_request) =
    let input = Json_serializers.create_cluster_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"AWSParallelComputingService.CreateCluster"
      ~service ~context ~input
      ~output_deserializer:Json_deserializers.create_cluster_response_of_yojson ~error_deserializer

  let request_with_metadata context (request : create_cluster_request) =
    let input = Json_serializers.create_cluster_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata
      ~shape_name:"AWSParallelComputingService.CreateCluster" ~service ~context ~input
      ~output_deserializer:Json_deserializers.create_cluster_response_of_yojson ~error_deserializer
end

module CreateComputeNodeGroup = struct
  let error_to_string = function
    | `AccessDeniedException _ -> "com.amazonaws.pcs#AccessDeniedException"
    | `ConflictException _ -> "com.amazonaws.pcs#ConflictException"
    | `InternalServerException _ -> "com.amazonaws.pcs#InternalServerException"
    | `ResourceNotFoundException _ -> "com.amazonaws.pcs#ResourceNotFoundException"
    | `ServiceQuotaExceededException _ -> "com.amazonaws.pcs#ServiceQuotaExceededException"
    | `ThrottlingException _ -> "com.amazonaws.pcs#ThrottlingException"
    | `ValidationException _ -> "com.amazonaws.pcs#ValidationException"
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

  let request context (request : create_compute_node_group_request) =
    let input = Json_serializers.create_compute_node_group_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request
      ~shape_name:"AWSParallelComputingService.CreateComputeNodeGroup" ~service ~context ~input
      ~output_deserializer:Json_deserializers.create_compute_node_group_response_of_yojson
      ~error_deserializer

  let request_with_metadata context (request : create_compute_node_group_request) =
    let input = Json_serializers.create_compute_node_group_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata
      ~shape_name:"AWSParallelComputingService.CreateComputeNodeGroup" ~service ~context ~input
      ~output_deserializer:Json_deserializers.create_compute_node_group_response_of_yojson
      ~error_deserializer
end

module CreateQueue = struct
  let error_to_string = function
    | `AccessDeniedException _ -> "com.amazonaws.pcs#AccessDeniedException"
    | `ConflictException _ -> "com.amazonaws.pcs#ConflictException"
    | `InternalServerException _ -> "com.amazonaws.pcs#InternalServerException"
    | `ResourceNotFoundException _ -> "com.amazonaws.pcs#ResourceNotFoundException"
    | `ServiceQuotaExceededException _ -> "com.amazonaws.pcs#ServiceQuotaExceededException"
    | `ThrottlingException _ -> "com.amazonaws.pcs#ThrottlingException"
    | `ValidationException _ -> "com.amazonaws.pcs#ValidationException"
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

  let request context (request : create_queue_request) =
    let input = Json_serializers.create_queue_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"AWSParallelComputingService.CreateQueue"
      ~service ~context ~input
      ~output_deserializer:Json_deserializers.create_queue_response_of_yojson ~error_deserializer

  let request_with_metadata context (request : create_queue_request) =
    let input = Json_serializers.create_queue_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata
      ~shape_name:"AWSParallelComputingService.CreateQueue" ~service ~context ~input
      ~output_deserializer:Json_deserializers.create_queue_response_of_yojson ~error_deserializer
end

module DeleteCluster = struct
  let error_to_string = function
    | `AccessDeniedException _ -> "com.amazonaws.pcs#AccessDeniedException"
    | `ConflictException _ -> "com.amazonaws.pcs#ConflictException"
    | `InternalServerException _ -> "com.amazonaws.pcs#InternalServerException"
    | `ResourceNotFoundException _ -> "com.amazonaws.pcs#ResourceNotFoundException"
    | `ThrottlingException _ -> "com.amazonaws.pcs#ThrottlingException"
    | `ValidationException _ -> "com.amazonaws.pcs#ValidationException"
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

  let request context (request : delete_cluster_request) =
    let input = Json_serializers.delete_cluster_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"AWSParallelComputingService.DeleteCluster"
      ~service ~context ~input
      ~output_deserializer:Json_deserializers.delete_cluster_response_of_yojson ~error_deserializer

  let request_with_metadata context (request : delete_cluster_request) =
    let input = Json_serializers.delete_cluster_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata
      ~shape_name:"AWSParallelComputingService.DeleteCluster" ~service ~context ~input
      ~output_deserializer:Json_deserializers.delete_cluster_response_of_yojson ~error_deserializer
end

module DeleteComputeNodeGroup = struct
  let error_to_string = function
    | `AccessDeniedException _ -> "com.amazonaws.pcs#AccessDeniedException"
    | `ConflictException _ -> "com.amazonaws.pcs#ConflictException"
    | `InternalServerException _ -> "com.amazonaws.pcs#InternalServerException"
    | `ResourceNotFoundException _ -> "com.amazonaws.pcs#ResourceNotFoundException"
    | `ThrottlingException _ -> "com.amazonaws.pcs#ThrottlingException"
    | `ValidationException _ -> "com.amazonaws.pcs#ValidationException"
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

  let request context (request : delete_compute_node_group_request) =
    let input = Json_serializers.delete_compute_node_group_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request
      ~shape_name:"AWSParallelComputingService.DeleteComputeNodeGroup" ~service ~context ~input
      ~output_deserializer:Json_deserializers.delete_compute_node_group_response_of_yojson
      ~error_deserializer

  let request_with_metadata context (request : delete_compute_node_group_request) =
    let input = Json_serializers.delete_compute_node_group_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata
      ~shape_name:"AWSParallelComputingService.DeleteComputeNodeGroup" ~service ~context ~input
      ~output_deserializer:Json_deserializers.delete_compute_node_group_response_of_yojson
      ~error_deserializer
end

module DeleteQueue = struct
  let error_to_string = function
    | `AccessDeniedException _ -> "com.amazonaws.pcs#AccessDeniedException"
    | `ConflictException _ -> "com.amazonaws.pcs#ConflictException"
    | `InternalServerException _ -> "com.amazonaws.pcs#InternalServerException"
    | `ResourceNotFoundException _ -> "com.amazonaws.pcs#ResourceNotFoundException"
    | `ThrottlingException _ -> "com.amazonaws.pcs#ThrottlingException"
    | `ValidationException _ -> "com.amazonaws.pcs#ValidationException"
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

  let request context (request : delete_queue_request) =
    let input = Json_serializers.delete_queue_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"AWSParallelComputingService.DeleteQueue"
      ~service ~context ~input
      ~output_deserializer:Json_deserializers.delete_queue_response_of_yojson ~error_deserializer

  let request_with_metadata context (request : delete_queue_request) =
    let input = Json_serializers.delete_queue_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata
      ~shape_name:"AWSParallelComputingService.DeleteQueue" ~service ~context ~input
      ~output_deserializer:Json_deserializers.delete_queue_response_of_yojson ~error_deserializer
end

module GetCluster = struct
  let error_to_string = function
    | `AccessDeniedException _ -> "com.amazonaws.pcs#AccessDeniedException"
    | `ConflictException _ -> "com.amazonaws.pcs#ConflictException"
    | `InternalServerException _ -> "com.amazonaws.pcs#InternalServerException"
    | `ResourceNotFoundException _ -> "com.amazonaws.pcs#ResourceNotFoundException"
    | `ThrottlingException _ -> "com.amazonaws.pcs#ThrottlingException"
    | `ValidationException _ -> "com.amazonaws.pcs#ValidationException"
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

  let request context (request : get_cluster_request) =
    let input = Json_serializers.get_cluster_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"AWSParallelComputingService.GetCluster"
      ~service ~context ~input
      ~output_deserializer:Json_deserializers.get_cluster_response_of_yojson ~error_deserializer

  let request_with_metadata context (request : get_cluster_request) =
    let input = Json_serializers.get_cluster_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata
      ~shape_name:"AWSParallelComputingService.GetCluster" ~service ~context ~input
      ~output_deserializer:Json_deserializers.get_cluster_response_of_yojson ~error_deserializer
end

module GetComputeNodeGroup = struct
  let error_to_string = function
    | `AccessDeniedException _ -> "com.amazonaws.pcs#AccessDeniedException"
    | `ConflictException _ -> "com.amazonaws.pcs#ConflictException"
    | `InternalServerException _ -> "com.amazonaws.pcs#InternalServerException"
    | `ResourceNotFoundException _ -> "com.amazonaws.pcs#ResourceNotFoundException"
    | `ThrottlingException _ -> "com.amazonaws.pcs#ThrottlingException"
    | `ValidationException _ -> "com.amazonaws.pcs#ValidationException"
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

  let request context (request : get_compute_node_group_request) =
    let input = Json_serializers.get_compute_node_group_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request
      ~shape_name:"AWSParallelComputingService.GetComputeNodeGroup" ~service ~context ~input
      ~output_deserializer:Json_deserializers.get_compute_node_group_response_of_yojson
      ~error_deserializer

  let request_with_metadata context (request : get_compute_node_group_request) =
    let input = Json_serializers.get_compute_node_group_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata
      ~shape_name:"AWSParallelComputingService.GetComputeNodeGroup" ~service ~context ~input
      ~output_deserializer:Json_deserializers.get_compute_node_group_response_of_yojson
      ~error_deserializer
end

module GetQueue = struct
  let error_to_string = function
    | `AccessDeniedException _ -> "com.amazonaws.pcs#AccessDeniedException"
    | `ConflictException _ -> "com.amazonaws.pcs#ConflictException"
    | `InternalServerException _ -> "com.amazonaws.pcs#InternalServerException"
    | `ResourceNotFoundException _ -> "com.amazonaws.pcs#ResourceNotFoundException"
    | `ThrottlingException _ -> "com.amazonaws.pcs#ThrottlingException"
    | `ValidationException _ -> "com.amazonaws.pcs#ValidationException"
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

  let request context (request : get_queue_request) =
    let input = Json_serializers.get_queue_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"AWSParallelComputingService.GetQueue" ~service
      ~context ~input ~output_deserializer:Json_deserializers.get_queue_response_of_yojson
      ~error_deserializer

  let request_with_metadata context (request : get_queue_request) =
    let input = Json_serializers.get_queue_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata
      ~shape_name:"AWSParallelComputingService.GetQueue" ~service ~context ~input
      ~output_deserializer:Json_deserializers.get_queue_response_of_yojson ~error_deserializer
end

module ListClusters = struct
  let error_to_string = function
    | `AccessDeniedException _ -> "com.amazonaws.pcs#AccessDeniedException"
    | `ConflictException _ -> "com.amazonaws.pcs#ConflictException"
    | `InternalServerException _ -> "com.amazonaws.pcs#InternalServerException"
    | `ResourceNotFoundException _ -> "com.amazonaws.pcs#ResourceNotFoundException"
    | `ThrottlingException _ -> "com.amazonaws.pcs#ThrottlingException"
    | `ValidationException _ -> "com.amazonaws.pcs#ValidationException"
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

  let request context (request : list_clusters_request) =
    let input = Json_serializers.list_clusters_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"AWSParallelComputingService.ListClusters"
      ~service ~context ~input
      ~output_deserializer:Json_deserializers.list_clusters_response_of_yojson ~error_deserializer

  let request_with_metadata context (request : list_clusters_request) =
    let input = Json_serializers.list_clusters_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata
      ~shape_name:"AWSParallelComputingService.ListClusters" ~service ~context ~input
      ~output_deserializer:Json_deserializers.list_clusters_response_of_yojson ~error_deserializer
end

module ListComputeNodeGroups = struct
  let error_to_string = function
    | `AccessDeniedException _ -> "com.amazonaws.pcs#AccessDeniedException"
    | `ConflictException _ -> "com.amazonaws.pcs#ConflictException"
    | `InternalServerException _ -> "com.amazonaws.pcs#InternalServerException"
    | `ResourceNotFoundException _ -> "com.amazonaws.pcs#ResourceNotFoundException"
    | `ThrottlingException _ -> "com.amazonaws.pcs#ThrottlingException"
    | `ValidationException _ -> "com.amazonaws.pcs#ValidationException"
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

  let request context (request : list_compute_node_groups_request) =
    let input = Json_serializers.list_compute_node_groups_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request
      ~shape_name:"AWSParallelComputingService.ListComputeNodeGroups" ~service ~context ~input
      ~output_deserializer:Json_deserializers.list_compute_node_groups_response_of_yojson
      ~error_deserializer

  let request_with_metadata context (request : list_compute_node_groups_request) =
    let input = Json_serializers.list_compute_node_groups_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata
      ~shape_name:"AWSParallelComputingService.ListComputeNodeGroups" ~service ~context ~input
      ~output_deserializer:Json_deserializers.list_compute_node_groups_response_of_yojson
      ~error_deserializer
end

module ListQueues = struct
  let error_to_string = function
    | `AccessDeniedException _ -> "com.amazonaws.pcs#AccessDeniedException"
    | `ConflictException _ -> "com.amazonaws.pcs#ConflictException"
    | `InternalServerException _ -> "com.amazonaws.pcs#InternalServerException"
    | `ResourceNotFoundException _ -> "com.amazonaws.pcs#ResourceNotFoundException"
    | `ThrottlingException _ -> "com.amazonaws.pcs#ThrottlingException"
    | `ValidationException _ -> "com.amazonaws.pcs#ValidationException"
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

  let request context (request : list_queues_request) =
    let input = Json_serializers.list_queues_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"AWSParallelComputingService.ListQueues"
      ~service ~context ~input
      ~output_deserializer:Json_deserializers.list_queues_response_of_yojson ~error_deserializer

  let request_with_metadata context (request : list_queues_request) =
    let input = Json_serializers.list_queues_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata
      ~shape_name:"AWSParallelComputingService.ListQueues" ~service ~context ~input
      ~output_deserializer:Json_deserializers.list_queues_response_of_yojson ~error_deserializer
end

module ListTagsForResource = struct
  let error_to_string = function
    | `ResourceNotFoundException _ -> "com.amazonaws.pcs#ResourceNotFoundException"
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

  let request context (request : list_tags_for_resource_request) =
    let input = Json_serializers.list_tags_for_resource_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request
      ~shape_name:"AWSParallelComputingService.ListTagsForResource" ~service ~context ~input
      ~output_deserializer:Json_deserializers.list_tags_for_resource_response_of_yojson
      ~error_deserializer

  let request_with_metadata context (request : list_tags_for_resource_request) =
    let input = Json_serializers.list_tags_for_resource_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata
      ~shape_name:"AWSParallelComputingService.ListTagsForResource" ~service ~context ~input
      ~output_deserializer:Json_deserializers.list_tags_for_resource_response_of_yojson
      ~error_deserializer
end

module RegisterComputeNodeGroupInstance = struct
  let error_to_string = function
    | `AccessDeniedException _ -> "com.amazonaws.pcs#AccessDeniedException"
    | `InternalServerException _ -> "com.amazonaws.pcs#InternalServerException"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "AccessDeniedException" ->
          `AccessDeniedException (Json_deserializers.access_denied_exception_of_yojson tree path)
      | _, "InternalServerException" ->
          `InternalServerException
            (Json_deserializers.internal_server_exception_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : register_compute_node_group_instance_request) =
    let input = Json_serializers.register_compute_node_group_instance_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request
      ~shape_name:"AWSParallelComputingService.RegisterComputeNodeGroupInstance" ~service ~context
      ~input
      ~output_deserializer:
        Json_deserializers.register_compute_node_group_instance_response_of_yojson
      ~error_deserializer

  let request_with_metadata context (request : register_compute_node_group_instance_request) =
    let input = Json_serializers.register_compute_node_group_instance_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata
      ~shape_name:"AWSParallelComputingService.RegisterComputeNodeGroupInstance" ~service ~context
      ~input
      ~output_deserializer:
        Json_deserializers.register_compute_node_group_instance_response_of_yojson
      ~error_deserializer
end

module TagResource = struct
  let error_to_string = function
    | `ResourceNotFoundException _ -> "com.amazonaws.pcs#ResourceNotFoundException"
    | `ServiceQuotaExceededException _ -> "com.amazonaws.pcs#ServiceQuotaExceededException"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "ResourceNotFoundException" ->
          `ResourceNotFoundException
            (Json_deserializers.resource_not_found_exception_of_yojson tree path)
      | _, "ServiceQuotaExceededException" ->
          `ServiceQuotaExceededException
            (Json_deserializers.service_quota_exceeded_exception_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : tag_resource_request) =
    let input = Json_serializers.tag_resource_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"AWSParallelComputingService.TagResource"
      ~service ~context ~input
      ~output_deserializer:Json_deserializers.tag_resource_response_of_yojson ~error_deserializer

  let request_with_metadata context (request : tag_resource_request) =
    let input = Json_serializers.tag_resource_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata
      ~shape_name:"AWSParallelComputingService.TagResource" ~service ~context ~input
      ~output_deserializer:Json_deserializers.tag_resource_response_of_yojson ~error_deserializer
end

module UntagResource = struct
  let error_to_string = function
    | `ResourceNotFoundException _ -> "com.amazonaws.pcs#ResourceNotFoundException"
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

  let request context (request : untag_resource_request) =
    let input = Json_serializers.untag_resource_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"AWSParallelComputingService.UntagResource"
      ~service ~context ~input
      ~output_deserializer:Json_deserializers.untag_resource_response_of_yojson ~error_deserializer

  let request_with_metadata context (request : untag_resource_request) =
    let input = Json_serializers.untag_resource_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata
      ~shape_name:"AWSParallelComputingService.UntagResource" ~service ~context ~input
      ~output_deserializer:Json_deserializers.untag_resource_response_of_yojson ~error_deserializer
end

module UpdateCluster = struct
  let error_to_string = function
    | `AccessDeniedException _ -> "com.amazonaws.pcs#AccessDeniedException"
    | `ConflictException _ -> "com.amazonaws.pcs#ConflictException"
    | `InternalServerException _ -> "com.amazonaws.pcs#InternalServerException"
    | `ResourceNotFoundException _ -> "com.amazonaws.pcs#ResourceNotFoundException"
    | `ThrottlingException _ -> "com.amazonaws.pcs#ThrottlingException"
    | `ValidationException _ -> "com.amazonaws.pcs#ValidationException"
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

  let request context (request : update_cluster_request) =
    let input = Json_serializers.update_cluster_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"AWSParallelComputingService.UpdateCluster"
      ~service ~context ~input
      ~output_deserializer:Json_deserializers.update_cluster_response_of_yojson ~error_deserializer

  let request_with_metadata context (request : update_cluster_request) =
    let input = Json_serializers.update_cluster_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata
      ~shape_name:"AWSParallelComputingService.UpdateCluster" ~service ~context ~input
      ~output_deserializer:Json_deserializers.update_cluster_response_of_yojson ~error_deserializer
end

module UpdateComputeNodeGroup = struct
  let error_to_string = function
    | `AccessDeniedException _ -> "com.amazonaws.pcs#AccessDeniedException"
    | `ConflictException _ -> "com.amazonaws.pcs#ConflictException"
    | `InternalServerException _ -> "com.amazonaws.pcs#InternalServerException"
    | `ResourceNotFoundException _ -> "com.amazonaws.pcs#ResourceNotFoundException"
    | `ServiceQuotaExceededException _ -> "com.amazonaws.pcs#ServiceQuotaExceededException"
    | `ThrottlingException _ -> "com.amazonaws.pcs#ThrottlingException"
    | `ValidationException _ -> "com.amazonaws.pcs#ValidationException"
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

  let request context (request : update_compute_node_group_request) =
    let input = Json_serializers.update_compute_node_group_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request
      ~shape_name:"AWSParallelComputingService.UpdateComputeNodeGroup" ~service ~context ~input
      ~output_deserializer:Json_deserializers.update_compute_node_group_response_of_yojson
      ~error_deserializer

  let request_with_metadata context (request : update_compute_node_group_request) =
    let input = Json_serializers.update_compute_node_group_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata
      ~shape_name:"AWSParallelComputingService.UpdateComputeNodeGroup" ~service ~context ~input
      ~output_deserializer:Json_deserializers.update_compute_node_group_response_of_yojson
      ~error_deserializer
end

module UpdateQueue = struct
  let error_to_string = function
    | `AccessDeniedException _ -> "com.amazonaws.pcs#AccessDeniedException"
    | `ConflictException _ -> "com.amazonaws.pcs#ConflictException"
    | `InternalServerException _ -> "com.amazonaws.pcs#InternalServerException"
    | `ResourceNotFoundException _ -> "com.amazonaws.pcs#ResourceNotFoundException"
    | `ServiceQuotaExceededException _ -> "com.amazonaws.pcs#ServiceQuotaExceededException"
    | `ThrottlingException _ -> "com.amazonaws.pcs#ThrottlingException"
    | `ValidationException _ -> "com.amazonaws.pcs#ValidationException"
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

  let request context (request : update_queue_request) =
    let input = Json_serializers.update_queue_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"AWSParallelComputingService.UpdateQueue"
      ~service ~context ~input
      ~output_deserializer:Json_deserializers.update_queue_response_of_yojson ~error_deserializer

  let request_with_metadata context (request : update_queue_request) =
    let input = Json_serializers.update_queue_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata
      ~shape_name:"AWSParallelComputingService.UpdateQueue" ~service ~context ~input
      ~output_deserializer:Json_deserializers.update_queue_response_of_yojson ~error_deserializer
end
