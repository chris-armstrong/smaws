open Types
open Service_metadata

module DeactivatePipeline = struct
  let error_to_string = function
    | `InternalServiceError _ -> "com.amazonaws.datapipeline#InternalServiceError"
    | `InvalidRequestException _ -> "com.amazonaws.datapipeline#InvalidRequestException"
    | `PipelineDeletedException _ -> "com.amazonaws.datapipeline#PipelineDeletedException"
    | `PipelineNotFoundException _ -> "com.amazonaws.datapipeline#PipelineNotFoundException"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "InternalServiceError" ->
          `InternalServiceError (Json_deserializers.internal_service_error_of_yojson tree path)
      | _, "InvalidRequestException" ->
          `InvalidRequestException
            (Json_deserializers.invalid_request_exception_of_yojson tree path)
      | _, "PipelineDeletedException" ->
          `PipelineDeletedException
            (Json_deserializers.pipeline_deleted_exception_of_yojson tree path)
      | _, "PipelineNotFoundException" ->
          `PipelineNotFoundException
            (Json_deserializers.pipeline_not_found_exception_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : deactivate_pipeline_input) =
    let input = Json_serializers.deactivate_pipeline_input_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"DataPipeline.DeactivatePipeline" ~service
      ~context ~input ~output_deserializer:Json_deserializers.deactivate_pipeline_output_of_yojson
      ~error_deserializer

  let request_with_metadata context (request : deactivate_pipeline_input) =
    let input = Json_serializers.deactivate_pipeline_input_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata ~shape_name:"DataPipeline.DeactivatePipeline"
      ~service ~context ~input
      ~output_deserializer:Json_deserializers.deactivate_pipeline_output_of_yojson
      ~error_deserializer
end

module DeletePipeline = struct
  let error_to_string = function
    | `InternalServiceError _ -> "com.amazonaws.datapipeline#InternalServiceError"
    | `InvalidRequestException _ -> "com.amazonaws.datapipeline#InvalidRequestException"
    | `PipelineNotFoundException _ -> "com.amazonaws.datapipeline#PipelineNotFoundException"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "InternalServiceError" ->
          `InternalServiceError (Json_deserializers.internal_service_error_of_yojson tree path)
      | _, "InvalidRequestException" ->
          `InvalidRequestException
            (Json_deserializers.invalid_request_exception_of_yojson tree path)
      | _, "PipelineNotFoundException" ->
          `PipelineNotFoundException
            (Json_deserializers.pipeline_not_found_exception_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : delete_pipeline_input) =
    let input = Json_serializers.delete_pipeline_input_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"DataPipeline.DeletePipeline" ~service ~context
      ~input ~output_deserializer:Smaws_Lib.Smithy_api.Json_deserializers.unit__of_yojson
      ~error_deserializer

  let request_with_metadata context (request : delete_pipeline_input) =
    let input = Json_serializers.delete_pipeline_input_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata ~shape_name:"DataPipeline.DeletePipeline"
      ~service ~context ~input
      ~output_deserializer:Smaws_Lib.Smithy_api.Json_deserializers.unit__of_yojson
      ~error_deserializer
end

module DescribeObjects = struct
  let error_to_string = function
    | `InternalServiceError _ -> "com.amazonaws.datapipeline#InternalServiceError"
    | `InvalidRequestException _ -> "com.amazonaws.datapipeline#InvalidRequestException"
    | `PipelineDeletedException _ -> "com.amazonaws.datapipeline#PipelineDeletedException"
    | `PipelineNotFoundException _ -> "com.amazonaws.datapipeline#PipelineNotFoundException"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "InternalServiceError" ->
          `InternalServiceError (Json_deserializers.internal_service_error_of_yojson tree path)
      | _, "InvalidRequestException" ->
          `InvalidRequestException
            (Json_deserializers.invalid_request_exception_of_yojson tree path)
      | _, "PipelineDeletedException" ->
          `PipelineDeletedException
            (Json_deserializers.pipeline_deleted_exception_of_yojson tree path)
      | _, "PipelineNotFoundException" ->
          `PipelineNotFoundException
            (Json_deserializers.pipeline_not_found_exception_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : describe_objects_input) =
    let input = Json_serializers.describe_objects_input_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"DataPipeline.DescribeObjects" ~service ~context
      ~input ~output_deserializer:Json_deserializers.describe_objects_output_of_yojson
      ~error_deserializer

  let request_with_metadata context (request : describe_objects_input) =
    let input = Json_serializers.describe_objects_input_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata ~shape_name:"DataPipeline.DescribeObjects"
      ~service ~context ~input
      ~output_deserializer:Json_deserializers.describe_objects_output_of_yojson ~error_deserializer
end

module DescribePipelines = struct
  let error_to_string = function
    | `InternalServiceError _ -> "com.amazonaws.datapipeline#InternalServiceError"
    | `InvalidRequestException _ -> "com.amazonaws.datapipeline#InvalidRequestException"
    | `PipelineDeletedException _ -> "com.amazonaws.datapipeline#PipelineDeletedException"
    | `PipelineNotFoundException _ -> "com.amazonaws.datapipeline#PipelineNotFoundException"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "InternalServiceError" ->
          `InternalServiceError (Json_deserializers.internal_service_error_of_yojson tree path)
      | _, "InvalidRequestException" ->
          `InvalidRequestException
            (Json_deserializers.invalid_request_exception_of_yojson tree path)
      | _, "PipelineDeletedException" ->
          `PipelineDeletedException
            (Json_deserializers.pipeline_deleted_exception_of_yojson tree path)
      | _, "PipelineNotFoundException" ->
          `PipelineNotFoundException
            (Json_deserializers.pipeline_not_found_exception_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : describe_pipelines_input) =
    let input = Json_serializers.describe_pipelines_input_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"DataPipeline.DescribePipelines" ~service
      ~context ~input ~output_deserializer:Json_deserializers.describe_pipelines_output_of_yojson
      ~error_deserializer

  let request_with_metadata context (request : describe_pipelines_input) =
    let input = Json_serializers.describe_pipelines_input_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata ~shape_name:"DataPipeline.DescribePipelines"
      ~service ~context ~input
      ~output_deserializer:Json_deserializers.describe_pipelines_output_of_yojson
      ~error_deserializer
end

module EvaluateExpression = struct
  let error_to_string = function
    | `InternalServiceError _ -> "com.amazonaws.datapipeline#InternalServiceError"
    | `InvalidRequestException _ -> "com.amazonaws.datapipeline#InvalidRequestException"
    | `PipelineDeletedException _ -> "com.amazonaws.datapipeline#PipelineDeletedException"
    | `PipelineNotFoundException _ -> "com.amazonaws.datapipeline#PipelineNotFoundException"
    | `TaskNotFoundException _ -> "com.amazonaws.datapipeline#TaskNotFoundException"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "InternalServiceError" ->
          `InternalServiceError (Json_deserializers.internal_service_error_of_yojson tree path)
      | _, "InvalidRequestException" ->
          `InvalidRequestException
            (Json_deserializers.invalid_request_exception_of_yojson tree path)
      | _, "PipelineDeletedException" ->
          `PipelineDeletedException
            (Json_deserializers.pipeline_deleted_exception_of_yojson tree path)
      | _, "PipelineNotFoundException" ->
          `PipelineNotFoundException
            (Json_deserializers.pipeline_not_found_exception_of_yojson tree path)
      | _, "TaskNotFoundException" ->
          `TaskNotFoundException (Json_deserializers.task_not_found_exception_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : evaluate_expression_input) =
    let input = Json_serializers.evaluate_expression_input_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"DataPipeline.EvaluateExpression" ~service
      ~context ~input ~output_deserializer:Json_deserializers.evaluate_expression_output_of_yojson
      ~error_deserializer

  let request_with_metadata context (request : evaluate_expression_input) =
    let input = Json_serializers.evaluate_expression_input_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata ~shape_name:"DataPipeline.EvaluateExpression"
      ~service ~context ~input
      ~output_deserializer:Json_deserializers.evaluate_expression_output_of_yojson
      ~error_deserializer
end

module GetPipelineDefinition = struct
  let error_to_string = function
    | `InternalServiceError _ -> "com.amazonaws.datapipeline#InternalServiceError"
    | `InvalidRequestException _ -> "com.amazonaws.datapipeline#InvalidRequestException"
    | `PipelineDeletedException _ -> "com.amazonaws.datapipeline#PipelineDeletedException"
    | `PipelineNotFoundException _ -> "com.amazonaws.datapipeline#PipelineNotFoundException"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "InternalServiceError" ->
          `InternalServiceError (Json_deserializers.internal_service_error_of_yojson tree path)
      | _, "InvalidRequestException" ->
          `InvalidRequestException
            (Json_deserializers.invalid_request_exception_of_yojson tree path)
      | _, "PipelineDeletedException" ->
          `PipelineDeletedException
            (Json_deserializers.pipeline_deleted_exception_of_yojson tree path)
      | _, "PipelineNotFoundException" ->
          `PipelineNotFoundException
            (Json_deserializers.pipeline_not_found_exception_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : get_pipeline_definition_input) =
    let input = Json_serializers.get_pipeline_definition_input_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"DataPipeline.GetPipelineDefinition" ~service
      ~context ~input
      ~output_deserializer:Json_deserializers.get_pipeline_definition_output_of_yojson
      ~error_deserializer

  let request_with_metadata context (request : get_pipeline_definition_input) =
    let input = Json_serializers.get_pipeline_definition_input_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata
      ~shape_name:"DataPipeline.GetPipelineDefinition" ~service ~context ~input
      ~output_deserializer:Json_deserializers.get_pipeline_definition_output_of_yojson
      ~error_deserializer
end

module ListPipelines = struct
  let error_to_string = function
    | `InternalServiceError _ -> "com.amazonaws.datapipeline#InternalServiceError"
    | `InvalidRequestException _ -> "com.amazonaws.datapipeline#InvalidRequestException"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "InternalServiceError" ->
          `InternalServiceError (Json_deserializers.internal_service_error_of_yojson tree path)
      | _, "InvalidRequestException" ->
          `InvalidRequestException
            (Json_deserializers.invalid_request_exception_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : list_pipelines_input) =
    let input = Json_serializers.list_pipelines_input_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"DataPipeline.ListPipelines" ~service ~context
      ~input ~output_deserializer:Json_deserializers.list_pipelines_output_of_yojson
      ~error_deserializer

  let request_with_metadata context (request : list_pipelines_input) =
    let input = Json_serializers.list_pipelines_input_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata ~shape_name:"DataPipeline.ListPipelines"
      ~service ~context ~input
      ~output_deserializer:Json_deserializers.list_pipelines_output_of_yojson ~error_deserializer
end

module PollForTask = struct
  let error_to_string = function
    | `InternalServiceError _ -> "com.amazonaws.datapipeline#InternalServiceError"
    | `InvalidRequestException _ -> "com.amazonaws.datapipeline#InvalidRequestException"
    | `TaskNotFoundException _ -> "com.amazonaws.datapipeline#TaskNotFoundException"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "InternalServiceError" ->
          `InternalServiceError (Json_deserializers.internal_service_error_of_yojson tree path)
      | _, "InvalidRequestException" ->
          `InvalidRequestException
            (Json_deserializers.invalid_request_exception_of_yojson tree path)
      | _, "TaskNotFoundException" ->
          `TaskNotFoundException (Json_deserializers.task_not_found_exception_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : poll_for_task_input) =
    let input = Json_serializers.poll_for_task_input_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"DataPipeline.PollForTask" ~service ~context
      ~input ~output_deserializer:Json_deserializers.poll_for_task_output_of_yojson
      ~error_deserializer

  let request_with_metadata context (request : poll_for_task_input) =
    let input = Json_serializers.poll_for_task_input_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata ~shape_name:"DataPipeline.PollForTask"
      ~service ~context ~input
      ~output_deserializer:Json_deserializers.poll_for_task_output_of_yojson ~error_deserializer
end

module PutPipelineDefinition = struct
  let error_to_string = function
    | `InternalServiceError _ -> "com.amazonaws.datapipeline#InternalServiceError"
    | `InvalidRequestException _ -> "com.amazonaws.datapipeline#InvalidRequestException"
    | `PipelineDeletedException _ -> "com.amazonaws.datapipeline#PipelineDeletedException"
    | `PipelineNotFoundException _ -> "com.amazonaws.datapipeline#PipelineNotFoundException"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "InternalServiceError" ->
          `InternalServiceError (Json_deserializers.internal_service_error_of_yojson tree path)
      | _, "InvalidRequestException" ->
          `InvalidRequestException
            (Json_deserializers.invalid_request_exception_of_yojson tree path)
      | _, "PipelineDeletedException" ->
          `PipelineDeletedException
            (Json_deserializers.pipeline_deleted_exception_of_yojson tree path)
      | _, "PipelineNotFoundException" ->
          `PipelineNotFoundException
            (Json_deserializers.pipeline_not_found_exception_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : put_pipeline_definition_input) =
    let input = Json_serializers.put_pipeline_definition_input_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"DataPipeline.PutPipelineDefinition" ~service
      ~context ~input
      ~output_deserializer:Json_deserializers.put_pipeline_definition_output_of_yojson
      ~error_deserializer

  let request_with_metadata context (request : put_pipeline_definition_input) =
    let input = Json_serializers.put_pipeline_definition_input_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata
      ~shape_name:"DataPipeline.PutPipelineDefinition" ~service ~context ~input
      ~output_deserializer:Json_deserializers.put_pipeline_definition_output_of_yojson
      ~error_deserializer
end

module QueryObjects = struct
  let error_to_string = function
    | `InternalServiceError _ -> "com.amazonaws.datapipeline#InternalServiceError"
    | `InvalidRequestException _ -> "com.amazonaws.datapipeline#InvalidRequestException"
    | `PipelineDeletedException _ -> "com.amazonaws.datapipeline#PipelineDeletedException"
    | `PipelineNotFoundException _ -> "com.amazonaws.datapipeline#PipelineNotFoundException"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "InternalServiceError" ->
          `InternalServiceError (Json_deserializers.internal_service_error_of_yojson tree path)
      | _, "InvalidRequestException" ->
          `InvalidRequestException
            (Json_deserializers.invalid_request_exception_of_yojson tree path)
      | _, "PipelineDeletedException" ->
          `PipelineDeletedException
            (Json_deserializers.pipeline_deleted_exception_of_yojson tree path)
      | _, "PipelineNotFoundException" ->
          `PipelineNotFoundException
            (Json_deserializers.pipeline_not_found_exception_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : query_objects_input) =
    let input = Json_serializers.query_objects_input_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"DataPipeline.QueryObjects" ~service ~context
      ~input ~output_deserializer:Json_deserializers.query_objects_output_of_yojson
      ~error_deserializer

  let request_with_metadata context (request : query_objects_input) =
    let input = Json_serializers.query_objects_input_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata ~shape_name:"DataPipeline.QueryObjects"
      ~service ~context ~input
      ~output_deserializer:Json_deserializers.query_objects_output_of_yojson ~error_deserializer
end

module RemoveTags = struct
  let error_to_string = function
    | `InternalServiceError _ -> "com.amazonaws.datapipeline#InternalServiceError"
    | `InvalidRequestException _ -> "com.amazonaws.datapipeline#InvalidRequestException"
    | `PipelineDeletedException _ -> "com.amazonaws.datapipeline#PipelineDeletedException"
    | `PipelineNotFoundException _ -> "com.amazonaws.datapipeline#PipelineNotFoundException"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "InternalServiceError" ->
          `InternalServiceError (Json_deserializers.internal_service_error_of_yojson tree path)
      | _, "InvalidRequestException" ->
          `InvalidRequestException
            (Json_deserializers.invalid_request_exception_of_yojson tree path)
      | _, "PipelineDeletedException" ->
          `PipelineDeletedException
            (Json_deserializers.pipeline_deleted_exception_of_yojson tree path)
      | _, "PipelineNotFoundException" ->
          `PipelineNotFoundException
            (Json_deserializers.pipeline_not_found_exception_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : remove_tags_input) =
    let input = Json_serializers.remove_tags_input_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"DataPipeline.RemoveTags" ~service ~context
      ~input ~output_deserializer:Json_deserializers.remove_tags_output_of_yojson
      ~error_deserializer

  let request_with_metadata context (request : remove_tags_input) =
    let input = Json_serializers.remove_tags_input_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata ~shape_name:"DataPipeline.RemoveTags" ~service
      ~context ~input ~output_deserializer:Json_deserializers.remove_tags_output_of_yojson
      ~error_deserializer
end

module ReportTaskProgress = struct
  let error_to_string = function
    | `InternalServiceError _ -> "com.amazonaws.datapipeline#InternalServiceError"
    | `InvalidRequestException _ -> "com.amazonaws.datapipeline#InvalidRequestException"
    | `PipelineDeletedException _ -> "com.amazonaws.datapipeline#PipelineDeletedException"
    | `PipelineNotFoundException _ -> "com.amazonaws.datapipeline#PipelineNotFoundException"
    | `TaskNotFoundException _ -> "com.amazonaws.datapipeline#TaskNotFoundException"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "InternalServiceError" ->
          `InternalServiceError (Json_deserializers.internal_service_error_of_yojson tree path)
      | _, "InvalidRequestException" ->
          `InvalidRequestException
            (Json_deserializers.invalid_request_exception_of_yojson tree path)
      | _, "PipelineDeletedException" ->
          `PipelineDeletedException
            (Json_deserializers.pipeline_deleted_exception_of_yojson tree path)
      | _, "PipelineNotFoundException" ->
          `PipelineNotFoundException
            (Json_deserializers.pipeline_not_found_exception_of_yojson tree path)
      | _, "TaskNotFoundException" ->
          `TaskNotFoundException (Json_deserializers.task_not_found_exception_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : report_task_progress_input) =
    let input = Json_serializers.report_task_progress_input_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"DataPipeline.ReportTaskProgress" ~service
      ~context ~input ~output_deserializer:Json_deserializers.report_task_progress_output_of_yojson
      ~error_deserializer

  let request_with_metadata context (request : report_task_progress_input) =
    let input = Json_serializers.report_task_progress_input_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata ~shape_name:"DataPipeline.ReportTaskProgress"
      ~service ~context ~input
      ~output_deserializer:Json_deserializers.report_task_progress_output_of_yojson
      ~error_deserializer
end

module ReportTaskRunnerHeartbeat = struct
  let error_to_string = function
    | `InternalServiceError _ -> "com.amazonaws.datapipeline#InternalServiceError"
    | `InvalidRequestException _ -> "com.amazonaws.datapipeline#InvalidRequestException"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "InternalServiceError" ->
          `InternalServiceError (Json_deserializers.internal_service_error_of_yojson tree path)
      | _, "InvalidRequestException" ->
          `InvalidRequestException
            (Json_deserializers.invalid_request_exception_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : report_task_runner_heartbeat_input) =
    let input = Json_serializers.report_task_runner_heartbeat_input_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"DataPipeline.ReportTaskRunnerHeartbeat"
      ~service ~context ~input
      ~output_deserializer:Json_deserializers.report_task_runner_heartbeat_output_of_yojson
      ~error_deserializer

  let request_with_metadata context (request : report_task_runner_heartbeat_input) =
    let input = Json_serializers.report_task_runner_heartbeat_input_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata
      ~shape_name:"DataPipeline.ReportTaskRunnerHeartbeat" ~service ~context ~input
      ~output_deserializer:Json_deserializers.report_task_runner_heartbeat_output_of_yojson
      ~error_deserializer
end

module SetStatus = struct
  let error_to_string = function
    | `InternalServiceError _ -> "com.amazonaws.datapipeline#InternalServiceError"
    | `InvalidRequestException _ -> "com.amazonaws.datapipeline#InvalidRequestException"
    | `PipelineDeletedException _ -> "com.amazonaws.datapipeline#PipelineDeletedException"
    | `PipelineNotFoundException _ -> "com.amazonaws.datapipeline#PipelineNotFoundException"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "InternalServiceError" ->
          `InternalServiceError (Json_deserializers.internal_service_error_of_yojson tree path)
      | _, "InvalidRequestException" ->
          `InvalidRequestException
            (Json_deserializers.invalid_request_exception_of_yojson tree path)
      | _, "PipelineDeletedException" ->
          `PipelineDeletedException
            (Json_deserializers.pipeline_deleted_exception_of_yojson tree path)
      | _, "PipelineNotFoundException" ->
          `PipelineNotFoundException
            (Json_deserializers.pipeline_not_found_exception_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : set_status_input) =
    let input = Json_serializers.set_status_input_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"DataPipeline.SetStatus" ~service ~context
      ~input ~output_deserializer:Smaws_Lib.Smithy_api.Json_deserializers.unit__of_yojson
      ~error_deserializer

  let request_with_metadata context (request : set_status_input) =
    let input = Json_serializers.set_status_input_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata ~shape_name:"DataPipeline.SetStatus" ~service
      ~context ~input ~output_deserializer:Smaws_Lib.Smithy_api.Json_deserializers.unit__of_yojson
      ~error_deserializer
end

module SetTaskStatus = struct
  let error_to_string = function
    | `InternalServiceError _ -> "com.amazonaws.datapipeline#InternalServiceError"
    | `InvalidRequestException _ -> "com.amazonaws.datapipeline#InvalidRequestException"
    | `PipelineDeletedException _ -> "com.amazonaws.datapipeline#PipelineDeletedException"
    | `PipelineNotFoundException _ -> "com.amazonaws.datapipeline#PipelineNotFoundException"
    | `TaskNotFoundException _ -> "com.amazonaws.datapipeline#TaskNotFoundException"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "InternalServiceError" ->
          `InternalServiceError (Json_deserializers.internal_service_error_of_yojson tree path)
      | _, "InvalidRequestException" ->
          `InvalidRequestException
            (Json_deserializers.invalid_request_exception_of_yojson tree path)
      | _, "PipelineDeletedException" ->
          `PipelineDeletedException
            (Json_deserializers.pipeline_deleted_exception_of_yojson tree path)
      | _, "PipelineNotFoundException" ->
          `PipelineNotFoundException
            (Json_deserializers.pipeline_not_found_exception_of_yojson tree path)
      | _, "TaskNotFoundException" ->
          `TaskNotFoundException (Json_deserializers.task_not_found_exception_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : set_task_status_input) =
    let input = Json_serializers.set_task_status_input_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"DataPipeline.SetTaskStatus" ~service ~context
      ~input ~output_deserializer:Json_deserializers.set_task_status_output_of_yojson
      ~error_deserializer

  let request_with_metadata context (request : set_task_status_input) =
    let input = Json_serializers.set_task_status_input_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata ~shape_name:"DataPipeline.SetTaskStatus"
      ~service ~context ~input
      ~output_deserializer:Json_deserializers.set_task_status_output_of_yojson ~error_deserializer
end

module ValidatePipelineDefinition = struct
  let error_to_string = function
    | `InternalServiceError _ -> "com.amazonaws.datapipeline#InternalServiceError"
    | `InvalidRequestException _ -> "com.amazonaws.datapipeline#InvalidRequestException"
    | `PipelineDeletedException _ -> "com.amazonaws.datapipeline#PipelineDeletedException"
    | `PipelineNotFoundException _ -> "com.amazonaws.datapipeline#PipelineNotFoundException"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "InternalServiceError" ->
          `InternalServiceError (Json_deserializers.internal_service_error_of_yojson tree path)
      | _, "InvalidRequestException" ->
          `InvalidRequestException
            (Json_deserializers.invalid_request_exception_of_yojson tree path)
      | _, "PipelineDeletedException" ->
          `PipelineDeletedException
            (Json_deserializers.pipeline_deleted_exception_of_yojson tree path)
      | _, "PipelineNotFoundException" ->
          `PipelineNotFoundException
            (Json_deserializers.pipeline_not_found_exception_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : validate_pipeline_definition_input) =
    let input = Json_serializers.validate_pipeline_definition_input_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"DataPipeline.ValidatePipelineDefinition"
      ~service ~context ~input
      ~output_deserializer:Json_deserializers.validate_pipeline_definition_output_of_yojson
      ~error_deserializer

  let request_with_metadata context (request : validate_pipeline_definition_input) =
    let input = Json_serializers.validate_pipeline_definition_input_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata
      ~shape_name:"DataPipeline.ValidatePipelineDefinition" ~service ~context ~input
      ~output_deserializer:Json_deserializers.validate_pipeline_definition_output_of_yojson
      ~error_deserializer
end

module CreatePipeline = struct
  let error_to_string = function
    | `InternalServiceError _ -> "com.amazonaws.datapipeline#InternalServiceError"
    | `InvalidRequestException _ -> "com.amazonaws.datapipeline#InvalidRequestException"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "InternalServiceError" ->
          `InternalServiceError (Json_deserializers.internal_service_error_of_yojson tree path)
      | _, "InvalidRequestException" ->
          `InvalidRequestException
            (Json_deserializers.invalid_request_exception_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : create_pipeline_input) =
    let input = Json_serializers.create_pipeline_input_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"DataPipeline.CreatePipeline" ~service ~context
      ~input ~output_deserializer:Json_deserializers.create_pipeline_output_of_yojson
      ~error_deserializer

  let request_with_metadata context (request : create_pipeline_input) =
    let input = Json_serializers.create_pipeline_input_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata ~shape_name:"DataPipeline.CreatePipeline"
      ~service ~context ~input
      ~output_deserializer:Json_deserializers.create_pipeline_output_of_yojson ~error_deserializer
end

module AddTags = struct
  let error_to_string = function
    | `InternalServiceError _ -> "com.amazonaws.datapipeline#InternalServiceError"
    | `InvalidRequestException _ -> "com.amazonaws.datapipeline#InvalidRequestException"
    | `PipelineDeletedException _ -> "com.amazonaws.datapipeline#PipelineDeletedException"
    | `PipelineNotFoundException _ -> "com.amazonaws.datapipeline#PipelineNotFoundException"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "InternalServiceError" ->
          `InternalServiceError (Json_deserializers.internal_service_error_of_yojson tree path)
      | _, "InvalidRequestException" ->
          `InvalidRequestException
            (Json_deserializers.invalid_request_exception_of_yojson tree path)
      | _, "PipelineDeletedException" ->
          `PipelineDeletedException
            (Json_deserializers.pipeline_deleted_exception_of_yojson tree path)
      | _, "PipelineNotFoundException" ->
          `PipelineNotFoundException
            (Json_deserializers.pipeline_not_found_exception_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : add_tags_input) =
    let input = Json_serializers.add_tags_input_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"DataPipeline.AddTags" ~service ~context ~input
      ~output_deserializer:Json_deserializers.add_tags_output_of_yojson ~error_deserializer

  let request_with_metadata context (request : add_tags_input) =
    let input = Json_serializers.add_tags_input_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata ~shape_name:"DataPipeline.AddTags" ~service
      ~context ~input ~output_deserializer:Json_deserializers.add_tags_output_of_yojson
      ~error_deserializer
end

module ActivatePipeline = struct
  let error_to_string = function
    | `InternalServiceError _ -> "com.amazonaws.datapipeline#InternalServiceError"
    | `InvalidRequestException _ -> "com.amazonaws.datapipeline#InvalidRequestException"
    | `PipelineDeletedException _ -> "com.amazonaws.datapipeline#PipelineDeletedException"
    | `PipelineNotFoundException _ -> "com.amazonaws.datapipeline#PipelineNotFoundException"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "InternalServiceError" ->
          `InternalServiceError (Json_deserializers.internal_service_error_of_yojson tree path)
      | _, "InvalidRequestException" ->
          `InvalidRequestException
            (Json_deserializers.invalid_request_exception_of_yojson tree path)
      | _, "PipelineDeletedException" ->
          `PipelineDeletedException
            (Json_deserializers.pipeline_deleted_exception_of_yojson tree path)
      | _, "PipelineNotFoundException" ->
          `PipelineNotFoundException
            (Json_deserializers.pipeline_not_found_exception_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : activate_pipeline_input) =
    let input = Json_serializers.activate_pipeline_input_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"DataPipeline.ActivatePipeline" ~service
      ~context ~input ~output_deserializer:Json_deserializers.activate_pipeline_output_of_yojson
      ~error_deserializer

  let request_with_metadata context (request : activate_pipeline_input) =
    let input = Json_serializers.activate_pipeline_input_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata ~shape_name:"DataPipeline.ActivatePipeline"
      ~service ~context ~input
      ~output_deserializer:Json_deserializers.activate_pipeline_output_of_yojson ~error_deserializer
end
