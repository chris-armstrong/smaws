open Types
open Service_metadata

module CreateWorkflow = struct
  let error_to_string = function
    | `AccessDeniedException _ -> "com.amazonaws.mwaaserverless#AccessDeniedException"
    | `ConflictException _ -> "com.amazonaws.mwaaserverless#ConflictException"
    | `InternalServerException _ -> "com.amazonaws.mwaaserverless#InternalServerException"
    | `OperationTimeoutException _ -> "com.amazonaws.mwaaserverless#OperationTimeoutException"
    | `ServiceQuotaExceededException _ ->
        "com.amazonaws.mwaaserverless#ServiceQuotaExceededException"
    | `ThrottlingException _ -> "com.amazonaws.mwaaserverless#ThrottlingException"
    | `ValidationException _ -> "com.amazonaws.mwaaserverless#ValidationException"
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
      | _, "OperationTimeoutException" ->
          `OperationTimeoutException
            (Json_deserializers.operation_timeout_exception_of_yojson tree path)
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

  let request context (request : create_workflow_request) =
    let input = Json_serializers.create_workflow_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"AmazonMWAAServerless.CreateWorkflow" ~service
      ~context ~input ~output_deserializer:Json_deserializers.create_workflow_response_of_yojson
      ~error_deserializer

  let request_with_metadata context (request : create_workflow_request) =
    let input = Json_serializers.create_workflow_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata
      ~shape_name:"AmazonMWAAServerless.CreateWorkflow" ~service ~context ~input
      ~output_deserializer:Json_deserializers.create_workflow_response_of_yojson ~error_deserializer
end

module DeleteWorkflow = struct
  let error_to_string = function
    | `AccessDeniedException _ -> "com.amazonaws.mwaaserverless#AccessDeniedException"
    | `InternalServerException _ -> "com.amazonaws.mwaaserverless#InternalServerException"
    | `OperationTimeoutException _ -> "com.amazonaws.mwaaserverless#OperationTimeoutException"
    | `ResourceNotFoundException _ -> "com.amazonaws.mwaaserverless#ResourceNotFoundException"
    | `ThrottlingException _ -> "com.amazonaws.mwaaserverless#ThrottlingException"
    | `ValidationException _ -> "com.amazonaws.mwaaserverless#ValidationException"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "AccessDeniedException" ->
          `AccessDeniedException (Json_deserializers.access_denied_exception_of_yojson tree path)
      | _, "InternalServerException" ->
          `InternalServerException
            (Json_deserializers.internal_server_exception_of_yojson tree path)
      | _, "OperationTimeoutException" ->
          `OperationTimeoutException
            (Json_deserializers.operation_timeout_exception_of_yojson tree path)
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

  let request context (request : delete_workflow_request) =
    let input = Json_serializers.delete_workflow_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"AmazonMWAAServerless.DeleteWorkflow" ~service
      ~context ~input ~output_deserializer:Json_deserializers.delete_workflow_response_of_yojson
      ~error_deserializer

  let request_with_metadata context (request : delete_workflow_request) =
    let input = Json_serializers.delete_workflow_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata
      ~shape_name:"AmazonMWAAServerless.DeleteWorkflow" ~service ~context ~input
      ~output_deserializer:Json_deserializers.delete_workflow_response_of_yojson ~error_deserializer
end

module GetTaskInstance = struct
  let error_to_string = function
    | `AccessDeniedException _ -> "com.amazonaws.mwaaserverless#AccessDeniedException"
    | `InternalServerException _ -> "com.amazonaws.mwaaserverless#InternalServerException"
    | `OperationTimeoutException _ -> "com.amazonaws.mwaaserverless#OperationTimeoutException"
    | `ResourceNotFoundException _ -> "com.amazonaws.mwaaserverless#ResourceNotFoundException"
    | `ThrottlingException _ -> "com.amazonaws.mwaaserverless#ThrottlingException"
    | `ValidationException _ -> "com.amazonaws.mwaaserverless#ValidationException"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "AccessDeniedException" ->
          `AccessDeniedException (Json_deserializers.access_denied_exception_of_yojson tree path)
      | _, "InternalServerException" ->
          `InternalServerException
            (Json_deserializers.internal_server_exception_of_yojson tree path)
      | _, "OperationTimeoutException" ->
          `OperationTimeoutException
            (Json_deserializers.operation_timeout_exception_of_yojson tree path)
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

  let request context (request : get_task_instance_request) =
    let input = Json_serializers.get_task_instance_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"AmazonMWAAServerless.GetTaskInstance" ~service
      ~context ~input ~output_deserializer:Json_deserializers.get_task_instance_response_of_yojson
      ~error_deserializer

  let request_with_metadata context (request : get_task_instance_request) =
    let input = Json_serializers.get_task_instance_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata
      ~shape_name:"AmazonMWAAServerless.GetTaskInstance" ~service ~context ~input
      ~output_deserializer:Json_deserializers.get_task_instance_response_of_yojson
      ~error_deserializer
end

module GetWorkflow = struct
  let error_to_string = function
    | `AccessDeniedException _ -> "com.amazonaws.mwaaserverless#AccessDeniedException"
    | `InternalServerException _ -> "com.amazonaws.mwaaserverless#InternalServerException"
    | `OperationTimeoutException _ -> "com.amazonaws.mwaaserverless#OperationTimeoutException"
    | `ResourceNotFoundException _ -> "com.amazonaws.mwaaserverless#ResourceNotFoundException"
    | `ThrottlingException _ -> "com.amazonaws.mwaaserverless#ThrottlingException"
    | `ValidationException _ -> "com.amazonaws.mwaaserverless#ValidationException"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "AccessDeniedException" ->
          `AccessDeniedException (Json_deserializers.access_denied_exception_of_yojson tree path)
      | _, "InternalServerException" ->
          `InternalServerException
            (Json_deserializers.internal_server_exception_of_yojson tree path)
      | _, "OperationTimeoutException" ->
          `OperationTimeoutException
            (Json_deserializers.operation_timeout_exception_of_yojson tree path)
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

  let request context (request : get_workflow_request) =
    let input = Json_serializers.get_workflow_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"AmazonMWAAServerless.GetWorkflow" ~service
      ~context ~input ~output_deserializer:Json_deserializers.get_workflow_response_of_yojson
      ~error_deserializer

  let request_with_metadata context (request : get_workflow_request) =
    let input = Json_serializers.get_workflow_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata ~shape_name:"AmazonMWAAServerless.GetWorkflow"
      ~service ~context ~input
      ~output_deserializer:Json_deserializers.get_workflow_response_of_yojson ~error_deserializer
end

module GetWorkflowRun = struct
  let error_to_string = function
    | `AccessDeniedException _ -> "com.amazonaws.mwaaserverless#AccessDeniedException"
    | `InternalServerException _ -> "com.amazonaws.mwaaserverless#InternalServerException"
    | `OperationTimeoutException _ -> "com.amazonaws.mwaaserverless#OperationTimeoutException"
    | `ResourceNotFoundException _ -> "com.amazonaws.mwaaserverless#ResourceNotFoundException"
    | `ThrottlingException _ -> "com.amazonaws.mwaaserverless#ThrottlingException"
    | `ValidationException _ -> "com.amazonaws.mwaaserverless#ValidationException"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "AccessDeniedException" ->
          `AccessDeniedException (Json_deserializers.access_denied_exception_of_yojson tree path)
      | _, "InternalServerException" ->
          `InternalServerException
            (Json_deserializers.internal_server_exception_of_yojson tree path)
      | _, "OperationTimeoutException" ->
          `OperationTimeoutException
            (Json_deserializers.operation_timeout_exception_of_yojson tree path)
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

  let request context (request : get_workflow_run_request) =
    let input = Json_serializers.get_workflow_run_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"AmazonMWAAServerless.GetWorkflowRun" ~service
      ~context ~input ~output_deserializer:Json_deserializers.get_workflow_run_response_of_yojson
      ~error_deserializer

  let request_with_metadata context (request : get_workflow_run_request) =
    let input = Json_serializers.get_workflow_run_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata
      ~shape_name:"AmazonMWAAServerless.GetWorkflowRun" ~service ~context ~input
      ~output_deserializer:Json_deserializers.get_workflow_run_response_of_yojson
      ~error_deserializer
end

module ListTagsForResource = struct
  let error_to_string = function
    | `AccessDeniedException _ -> "com.amazonaws.mwaaserverless#AccessDeniedException"
    | `InternalServerException _ -> "com.amazonaws.mwaaserverless#InternalServerException"
    | `OperationTimeoutException _ -> "com.amazonaws.mwaaserverless#OperationTimeoutException"
    | `ResourceNotFoundException _ -> "com.amazonaws.mwaaserverless#ResourceNotFoundException"
    | `ThrottlingException _ -> "com.amazonaws.mwaaserverless#ThrottlingException"
    | `ValidationException _ -> "com.amazonaws.mwaaserverless#ValidationException"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "AccessDeniedException" ->
          `AccessDeniedException (Json_deserializers.access_denied_exception_of_yojson tree path)
      | _, "InternalServerException" ->
          `InternalServerException
            (Json_deserializers.internal_server_exception_of_yojson tree path)
      | _, "OperationTimeoutException" ->
          `OperationTimeoutException
            (Json_deserializers.operation_timeout_exception_of_yojson tree path)
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

  let request context (request : list_tags_for_resource_request) =
    let input = Json_serializers.list_tags_for_resource_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"AmazonMWAAServerless.ListTagsForResource"
      ~service ~context ~input
      ~output_deserializer:Json_deserializers.list_tags_for_resource_response_of_yojson
      ~error_deserializer

  let request_with_metadata context (request : list_tags_for_resource_request) =
    let input = Json_serializers.list_tags_for_resource_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata
      ~shape_name:"AmazonMWAAServerless.ListTagsForResource" ~service ~context ~input
      ~output_deserializer:Json_deserializers.list_tags_for_resource_response_of_yojson
      ~error_deserializer
end

module ListTaskInstances = struct
  let error_to_string = function
    | `AccessDeniedException _ -> "com.amazonaws.mwaaserverless#AccessDeniedException"
    | `InternalServerException _ -> "com.amazonaws.mwaaserverless#InternalServerException"
    | `OperationTimeoutException _ -> "com.amazonaws.mwaaserverless#OperationTimeoutException"
    | `ThrottlingException _ -> "com.amazonaws.mwaaserverless#ThrottlingException"
    | `ValidationException _ -> "com.amazonaws.mwaaserverless#ValidationException"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "AccessDeniedException" ->
          `AccessDeniedException (Json_deserializers.access_denied_exception_of_yojson tree path)
      | _, "InternalServerException" ->
          `InternalServerException
            (Json_deserializers.internal_server_exception_of_yojson tree path)
      | _, "OperationTimeoutException" ->
          `OperationTimeoutException
            (Json_deserializers.operation_timeout_exception_of_yojson tree path)
      | _, "ThrottlingException" ->
          `ThrottlingException (Json_deserializers.throttling_exception_of_yojson tree path)
      | _, "ValidationException" ->
          `ValidationException (Json_deserializers.validation_exception_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : list_task_instances_request) =
    let input = Json_serializers.list_task_instances_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"AmazonMWAAServerless.ListTaskInstances"
      ~service ~context ~input
      ~output_deserializer:Json_deserializers.list_task_instances_response_of_yojson
      ~error_deserializer

  let request_with_metadata context (request : list_task_instances_request) =
    let input = Json_serializers.list_task_instances_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata
      ~shape_name:"AmazonMWAAServerless.ListTaskInstances" ~service ~context ~input
      ~output_deserializer:Json_deserializers.list_task_instances_response_of_yojson
      ~error_deserializer
end

module ListWorkflowRuns = struct
  let error_to_string = function
    | `AccessDeniedException _ -> "com.amazonaws.mwaaserverless#AccessDeniedException"
    | `InternalServerException _ -> "com.amazonaws.mwaaserverless#InternalServerException"
    | `OperationTimeoutException _ -> "com.amazonaws.mwaaserverless#OperationTimeoutException"
    | `ThrottlingException _ -> "com.amazonaws.mwaaserverless#ThrottlingException"
    | `ValidationException _ -> "com.amazonaws.mwaaserverless#ValidationException"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "AccessDeniedException" ->
          `AccessDeniedException (Json_deserializers.access_denied_exception_of_yojson tree path)
      | _, "InternalServerException" ->
          `InternalServerException
            (Json_deserializers.internal_server_exception_of_yojson tree path)
      | _, "OperationTimeoutException" ->
          `OperationTimeoutException
            (Json_deserializers.operation_timeout_exception_of_yojson tree path)
      | _, "ThrottlingException" ->
          `ThrottlingException (Json_deserializers.throttling_exception_of_yojson tree path)
      | _, "ValidationException" ->
          `ValidationException (Json_deserializers.validation_exception_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : list_workflow_runs_request) =
    let input = Json_serializers.list_workflow_runs_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"AmazonMWAAServerless.ListWorkflowRuns" ~service
      ~context ~input ~output_deserializer:Json_deserializers.list_workflow_runs_response_of_yojson
      ~error_deserializer

  let request_with_metadata context (request : list_workflow_runs_request) =
    let input = Json_serializers.list_workflow_runs_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata
      ~shape_name:"AmazonMWAAServerless.ListWorkflowRuns" ~service ~context ~input
      ~output_deserializer:Json_deserializers.list_workflow_runs_response_of_yojson
      ~error_deserializer
end

module ListWorkflowVersions = struct
  let error_to_string = function
    | `AccessDeniedException _ -> "com.amazonaws.mwaaserverless#AccessDeniedException"
    | `InternalServerException _ -> "com.amazonaws.mwaaserverless#InternalServerException"
    | `OperationTimeoutException _ -> "com.amazonaws.mwaaserverless#OperationTimeoutException"
    | `ThrottlingException _ -> "com.amazonaws.mwaaserverless#ThrottlingException"
    | `ValidationException _ -> "com.amazonaws.mwaaserverless#ValidationException"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "AccessDeniedException" ->
          `AccessDeniedException (Json_deserializers.access_denied_exception_of_yojson tree path)
      | _, "InternalServerException" ->
          `InternalServerException
            (Json_deserializers.internal_server_exception_of_yojson tree path)
      | _, "OperationTimeoutException" ->
          `OperationTimeoutException
            (Json_deserializers.operation_timeout_exception_of_yojson tree path)
      | _, "ThrottlingException" ->
          `ThrottlingException (Json_deserializers.throttling_exception_of_yojson tree path)
      | _, "ValidationException" ->
          `ValidationException (Json_deserializers.validation_exception_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : list_workflow_versions_request) =
    let input = Json_serializers.list_workflow_versions_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"AmazonMWAAServerless.ListWorkflowVersions"
      ~service ~context ~input
      ~output_deserializer:Json_deserializers.list_workflow_versions_response_of_yojson
      ~error_deserializer

  let request_with_metadata context (request : list_workflow_versions_request) =
    let input = Json_serializers.list_workflow_versions_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata
      ~shape_name:"AmazonMWAAServerless.ListWorkflowVersions" ~service ~context ~input
      ~output_deserializer:Json_deserializers.list_workflow_versions_response_of_yojson
      ~error_deserializer
end

module ListWorkflows = struct
  let error_to_string = function
    | `AccessDeniedException _ -> "com.amazonaws.mwaaserverless#AccessDeniedException"
    | `InternalServerException _ -> "com.amazonaws.mwaaserverless#InternalServerException"
    | `OperationTimeoutException _ -> "com.amazonaws.mwaaserverless#OperationTimeoutException"
    | `ThrottlingException _ -> "com.amazonaws.mwaaserverless#ThrottlingException"
    | `ValidationException _ -> "com.amazonaws.mwaaserverless#ValidationException"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "AccessDeniedException" ->
          `AccessDeniedException (Json_deserializers.access_denied_exception_of_yojson tree path)
      | _, "InternalServerException" ->
          `InternalServerException
            (Json_deserializers.internal_server_exception_of_yojson tree path)
      | _, "OperationTimeoutException" ->
          `OperationTimeoutException
            (Json_deserializers.operation_timeout_exception_of_yojson tree path)
      | _, "ThrottlingException" ->
          `ThrottlingException (Json_deserializers.throttling_exception_of_yojson tree path)
      | _, "ValidationException" ->
          `ValidationException (Json_deserializers.validation_exception_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : list_workflows_request) =
    let input = Json_serializers.list_workflows_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"AmazonMWAAServerless.ListWorkflows" ~service
      ~context ~input ~output_deserializer:Json_deserializers.list_workflows_response_of_yojson
      ~error_deserializer

  let request_with_metadata context (request : list_workflows_request) =
    let input = Json_serializers.list_workflows_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata
      ~shape_name:"AmazonMWAAServerless.ListWorkflows" ~service ~context ~input
      ~output_deserializer:Json_deserializers.list_workflows_response_of_yojson ~error_deserializer
end

module StartWorkflowRun = struct
  let error_to_string = function
    | `AccessDeniedException _ -> "com.amazonaws.mwaaserverless#AccessDeniedException"
    | `ConflictException _ -> "com.amazonaws.mwaaserverless#ConflictException"
    | `InternalServerException _ -> "com.amazonaws.mwaaserverless#InternalServerException"
    | `OperationTimeoutException _ -> "com.amazonaws.mwaaserverless#OperationTimeoutException"
    | `ResourceNotFoundException _ -> "com.amazonaws.mwaaserverless#ResourceNotFoundException"
    | `ServiceQuotaExceededException _ ->
        "com.amazonaws.mwaaserverless#ServiceQuotaExceededException"
    | `ThrottlingException _ -> "com.amazonaws.mwaaserverless#ThrottlingException"
    | `ValidationException _ -> "com.amazonaws.mwaaserverless#ValidationException"
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
      | _, "OperationTimeoutException" ->
          `OperationTimeoutException
            (Json_deserializers.operation_timeout_exception_of_yojson tree path)
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

  let request context (request : start_workflow_run_request) =
    let input = Json_serializers.start_workflow_run_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"AmazonMWAAServerless.StartWorkflowRun" ~service
      ~context ~input ~output_deserializer:Json_deserializers.start_workflow_run_response_of_yojson
      ~error_deserializer

  let request_with_metadata context (request : start_workflow_run_request) =
    let input = Json_serializers.start_workflow_run_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata
      ~shape_name:"AmazonMWAAServerless.StartWorkflowRun" ~service ~context ~input
      ~output_deserializer:Json_deserializers.start_workflow_run_response_of_yojson
      ~error_deserializer
end

module StopWorkflowRun = struct
  let error_to_string = function
    | `AccessDeniedException _ -> "com.amazonaws.mwaaserverless#AccessDeniedException"
    | `InternalServerException _ -> "com.amazonaws.mwaaserverless#InternalServerException"
    | `OperationTimeoutException _ -> "com.amazonaws.mwaaserverless#OperationTimeoutException"
    | `ResourceNotFoundException _ -> "com.amazonaws.mwaaserverless#ResourceNotFoundException"
    | `ThrottlingException _ -> "com.amazonaws.mwaaserverless#ThrottlingException"
    | `ValidationException _ -> "com.amazonaws.mwaaserverless#ValidationException"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "AccessDeniedException" ->
          `AccessDeniedException (Json_deserializers.access_denied_exception_of_yojson tree path)
      | _, "InternalServerException" ->
          `InternalServerException
            (Json_deserializers.internal_server_exception_of_yojson tree path)
      | _, "OperationTimeoutException" ->
          `OperationTimeoutException
            (Json_deserializers.operation_timeout_exception_of_yojson tree path)
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

  let request context (request : stop_workflow_run_request) =
    let input = Json_serializers.stop_workflow_run_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"AmazonMWAAServerless.StopWorkflowRun" ~service
      ~context ~input ~output_deserializer:Json_deserializers.stop_workflow_run_response_of_yojson
      ~error_deserializer

  let request_with_metadata context (request : stop_workflow_run_request) =
    let input = Json_serializers.stop_workflow_run_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata
      ~shape_name:"AmazonMWAAServerless.StopWorkflowRun" ~service ~context ~input
      ~output_deserializer:Json_deserializers.stop_workflow_run_response_of_yojson
      ~error_deserializer
end

module TagResource = struct
  let error_to_string = function
    | `AccessDeniedException _ -> "com.amazonaws.mwaaserverless#AccessDeniedException"
    | `InternalServerException _ -> "com.amazonaws.mwaaserverless#InternalServerException"
    | `OperationTimeoutException _ -> "com.amazonaws.mwaaserverless#OperationTimeoutException"
    | `ResourceNotFoundException _ -> "com.amazonaws.mwaaserverless#ResourceNotFoundException"
    | `ThrottlingException _ -> "com.amazonaws.mwaaserverless#ThrottlingException"
    | `ValidationException _ -> "com.amazonaws.mwaaserverless#ValidationException"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "AccessDeniedException" ->
          `AccessDeniedException (Json_deserializers.access_denied_exception_of_yojson tree path)
      | _, "InternalServerException" ->
          `InternalServerException
            (Json_deserializers.internal_server_exception_of_yojson tree path)
      | _, "OperationTimeoutException" ->
          `OperationTimeoutException
            (Json_deserializers.operation_timeout_exception_of_yojson tree path)
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

  let request context (request : tag_resource_request) =
    let input = Json_serializers.tag_resource_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"AmazonMWAAServerless.TagResource" ~service
      ~context ~input ~output_deserializer:Json_deserializers.tag_resource_response_of_yojson
      ~error_deserializer

  let request_with_metadata context (request : tag_resource_request) =
    let input = Json_serializers.tag_resource_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata ~shape_name:"AmazonMWAAServerless.TagResource"
      ~service ~context ~input
      ~output_deserializer:Json_deserializers.tag_resource_response_of_yojson ~error_deserializer
end

module UntagResource = struct
  let error_to_string = function
    | `AccessDeniedException _ -> "com.amazonaws.mwaaserverless#AccessDeniedException"
    | `InternalServerException _ -> "com.amazonaws.mwaaserverless#InternalServerException"
    | `OperationTimeoutException _ -> "com.amazonaws.mwaaserverless#OperationTimeoutException"
    | `ResourceNotFoundException _ -> "com.amazonaws.mwaaserverless#ResourceNotFoundException"
    | `ThrottlingException _ -> "com.amazonaws.mwaaserverless#ThrottlingException"
    | `ValidationException _ -> "com.amazonaws.mwaaserverless#ValidationException"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "AccessDeniedException" ->
          `AccessDeniedException (Json_deserializers.access_denied_exception_of_yojson tree path)
      | _, "InternalServerException" ->
          `InternalServerException
            (Json_deserializers.internal_server_exception_of_yojson tree path)
      | _, "OperationTimeoutException" ->
          `OperationTimeoutException
            (Json_deserializers.operation_timeout_exception_of_yojson tree path)
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

  let request context (request : untag_resource_request) =
    let input = Json_serializers.untag_resource_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"AmazonMWAAServerless.UntagResource" ~service
      ~context ~input ~output_deserializer:Json_deserializers.untag_resource_response_of_yojson
      ~error_deserializer

  let request_with_metadata context (request : untag_resource_request) =
    let input = Json_serializers.untag_resource_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata
      ~shape_name:"AmazonMWAAServerless.UntagResource" ~service ~context ~input
      ~output_deserializer:Json_deserializers.untag_resource_response_of_yojson ~error_deserializer
end

module UpdateWorkflow = struct
  let error_to_string = function
    | `AccessDeniedException _ -> "com.amazonaws.mwaaserverless#AccessDeniedException"
    | `ConflictException _ -> "com.amazonaws.mwaaserverless#ConflictException"
    | `InternalServerException _ -> "com.amazonaws.mwaaserverless#InternalServerException"
    | `OperationTimeoutException _ -> "com.amazonaws.mwaaserverless#OperationTimeoutException"
    | `ResourceNotFoundException _ -> "com.amazonaws.mwaaserverless#ResourceNotFoundException"
    | `ServiceQuotaExceededException _ ->
        "com.amazonaws.mwaaserverless#ServiceQuotaExceededException"
    | `ThrottlingException _ -> "com.amazonaws.mwaaserverless#ThrottlingException"
    | `ValidationException _ -> "com.amazonaws.mwaaserverless#ValidationException"
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
      | _, "OperationTimeoutException" ->
          `OperationTimeoutException
            (Json_deserializers.operation_timeout_exception_of_yojson tree path)
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

  let request context (request : update_workflow_request) =
    let input = Json_serializers.update_workflow_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"AmazonMWAAServerless.UpdateWorkflow" ~service
      ~context ~input ~output_deserializer:Json_deserializers.update_workflow_response_of_yojson
      ~error_deserializer

  let request_with_metadata context (request : update_workflow_request) =
    let input = Json_serializers.update_workflow_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata
      ~shape_name:"AmazonMWAAServerless.UpdateWorkflow" ~service ~context ~input
      ~output_deserializer:Json_deserializers.update_workflow_response_of_yojson ~error_deserializer
end
