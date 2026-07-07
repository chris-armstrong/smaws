open Types
open Service_metadata

module CreateRescoreExecutionPlan = struct
  let error_to_string = function
    | `AccessDeniedException _ -> "com.amazonaws.kendraranking#AccessDeniedException"
    | `ConflictException _ -> "com.amazonaws.kendraranking#ConflictException"
    | `InternalServerException _ -> "com.amazonaws.kendraranking#InternalServerException"
    | `ServiceQuotaExceededException _ ->
        "com.amazonaws.kendraranking#ServiceQuotaExceededException"
    | `ThrottlingException _ -> "com.amazonaws.kendraranking#ThrottlingException"
    | `ValidationException _ -> "com.amazonaws.kendraranking#ValidationException"
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

  let request context (request : create_rescore_execution_plan_request) =
    let input = Json_serializers.create_rescore_execution_plan_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request
      ~shape_name:"AWSKendraRerankingFrontendService.CreateRescoreExecutionPlan" ~service ~context
      ~input
      ~output_deserializer:Json_deserializers.create_rescore_execution_plan_response_of_yojson
      ~error_deserializer

  let request_with_metadata context (request : create_rescore_execution_plan_request) =
    let input = Json_serializers.create_rescore_execution_plan_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata
      ~shape_name:"AWSKendraRerankingFrontendService.CreateRescoreExecutionPlan" ~service ~context
      ~input
      ~output_deserializer:Json_deserializers.create_rescore_execution_plan_response_of_yojson
      ~error_deserializer
end

module DeleteRescoreExecutionPlan = struct
  let error_to_string = function
    | `AccessDeniedException _ -> "com.amazonaws.kendraranking#AccessDeniedException"
    | `ConflictException _ -> "com.amazonaws.kendraranking#ConflictException"
    | `InternalServerException _ -> "com.amazonaws.kendraranking#InternalServerException"
    | `ResourceNotFoundException _ -> "com.amazonaws.kendraranking#ResourceNotFoundException"
    | `ThrottlingException _ -> "com.amazonaws.kendraranking#ThrottlingException"
    | `ValidationException _ -> "com.amazonaws.kendraranking#ValidationException"
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

  let request context (request : delete_rescore_execution_plan_request) =
    let input = Json_serializers.delete_rescore_execution_plan_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request
      ~shape_name:"AWSKendraRerankingFrontendService.DeleteRescoreExecutionPlan" ~service ~context
      ~input ~output_deserializer:Smaws_Lib.Smithy_api.Json_deserializers.unit__of_yojson
      ~error_deserializer

  let request_with_metadata context (request : delete_rescore_execution_plan_request) =
    let input = Json_serializers.delete_rescore_execution_plan_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata
      ~shape_name:"AWSKendraRerankingFrontendService.DeleteRescoreExecutionPlan" ~service ~context
      ~input ~output_deserializer:Smaws_Lib.Smithy_api.Json_deserializers.unit__of_yojson
      ~error_deserializer
end

module DescribeRescoreExecutionPlan = struct
  let error_to_string = function
    | `AccessDeniedException _ -> "com.amazonaws.kendraranking#AccessDeniedException"
    | `InternalServerException _ -> "com.amazonaws.kendraranking#InternalServerException"
    | `ResourceNotFoundException _ -> "com.amazonaws.kendraranking#ResourceNotFoundException"
    | `ThrottlingException _ -> "com.amazonaws.kendraranking#ThrottlingException"
    | `ValidationException _ -> "com.amazonaws.kendraranking#ValidationException"
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

  let request context (request : describe_rescore_execution_plan_request) =
    let input = Json_serializers.describe_rescore_execution_plan_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request
      ~shape_name:"AWSKendraRerankingFrontendService.DescribeRescoreExecutionPlan" ~service ~context
      ~input
      ~output_deserializer:Json_deserializers.describe_rescore_execution_plan_response_of_yojson
      ~error_deserializer

  let request_with_metadata context (request : describe_rescore_execution_plan_request) =
    let input = Json_serializers.describe_rescore_execution_plan_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata
      ~shape_name:"AWSKendraRerankingFrontendService.DescribeRescoreExecutionPlan" ~service ~context
      ~input
      ~output_deserializer:Json_deserializers.describe_rescore_execution_plan_response_of_yojson
      ~error_deserializer
end

module ListRescoreExecutionPlans = struct
  let error_to_string = function
    | `AccessDeniedException _ -> "com.amazonaws.kendraranking#AccessDeniedException"
    | `InternalServerException _ -> "com.amazonaws.kendraranking#InternalServerException"
    | `ThrottlingException _ -> "com.amazonaws.kendraranking#ThrottlingException"
    | `ValidationException _ -> "com.amazonaws.kendraranking#ValidationException"
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

  let request context (request : list_rescore_execution_plans_request) =
    let input = Json_serializers.list_rescore_execution_plans_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request
      ~shape_name:"AWSKendraRerankingFrontendService.ListRescoreExecutionPlans" ~service ~context
      ~input ~output_deserializer:Json_deserializers.list_rescore_execution_plans_response_of_yojson
      ~error_deserializer

  let request_with_metadata context (request : list_rescore_execution_plans_request) =
    let input = Json_serializers.list_rescore_execution_plans_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata
      ~shape_name:"AWSKendraRerankingFrontendService.ListRescoreExecutionPlans" ~service ~context
      ~input ~output_deserializer:Json_deserializers.list_rescore_execution_plans_response_of_yojson
      ~error_deserializer
end

module ListTagsForResource = struct
  let error_to_string = function
    | `AccessDeniedException _ -> "com.amazonaws.kendraranking#AccessDeniedException"
    | `InternalServerException _ -> "com.amazonaws.kendraranking#InternalServerException"
    | `ResourceUnavailableException _ -> "com.amazonaws.kendraranking#ResourceUnavailableException"
    | `ThrottlingException _ -> "com.amazonaws.kendraranking#ThrottlingException"
    | `ValidationException _ -> "com.amazonaws.kendraranking#ValidationException"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "AccessDeniedException" ->
          `AccessDeniedException (Json_deserializers.access_denied_exception_of_yojson tree path)
      | _, "InternalServerException" ->
          `InternalServerException
            (Json_deserializers.internal_server_exception_of_yojson tree path)
      | _, "ResourceUnavailableException" ->
          `ResourceUnavailableException
            (Json_deserializers.resource_unavailable_exception_of_yojson tree path)
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
    Smaws_Lib.Protocols.AwsJson.request
      ~shape_name:"AWSKendraRerankingFrontendService.ListTagsForResource" ~service ~context ~input
      ~output_deserializer:Json_deserializers.list_tags_for_resource_response_of_yojson
      ~error_deserializer

  let request_with_metadata context (request : list_tags_for_resource_request) =
    let input = Json_serializers.list_tags_for_resource_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata
      ~shape_name:"AWSKendraRerankingFrontendService.ListTagsForResource" ~service ~context ~input
      ~output_deserializer:Json_deserializers.list_tags_for_resource_response_of_yojson
      ~error_deserializer
end

module Rescore = struct
  let error_to_string = function
    | `AccessDeniedException _ -> "com.amazonaws.kendraranking#AccessDeniedException"
    | `ConflictException _ -> "com.amazonaws.kendraranking#ConflictException"
    | `InternalServerException _ -> "com.amazonaws.kendraranking#InternalServerException"
    | `ResourceNotFoundException _ -> "com.amazonaws.kendraranking#ResourceNotFoundException"
    | `ThrottlingException _ -> "com.amazonaws.kendraranking#ThrottlingException"
    | `ValidationException _ -> "com.amazonaws.kendraranking#ValidationException"
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

  let request context (request : rescore_request) =
    let input = Json_serializers.rescore_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"AWSKendraRerankingFrontendService.Rescore"
      ~service ~context ~input ~output_deserializer:Json_deserializers.rescore_result_of_yojson
      ~error_deserializer

  let request_with_metadata context (request : rescore_request) =
    let input = Json_serializers.rescore_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata
      ~shape_name:"AWSKendraRerankingFrontendService.Rescore" ~service ~context ~input
      ~output_deserializer:Json_deserializers.rescore_result_of_yojson ~error_deserializer
end

module TagResource = struct
  let error_to_string = function
    | `AccessDeniedException _ -> "com.amazonaws.kendraranking#AccessDeniedException"
    | `InternalServerException _ -> "com.amazonaws.kendraranking#InternalServerException"
    | `ResourceUnavailableException _ -> "com.amazonaws.kendraranking#ResourceUnavailableException"
    | `ThrottlingException _ -> "com.amazonaws.kendraranking#ThrottlingException"
    | `ValidationException _ -> "com.amazonaws.kendraranking#ValidationException"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "AccessDeniedException" ->
          `AccessDeniedException (Json_deserializers.access_denied_exception_of_yojson tree path)
      | _, "InternalServerException" ->
          `InternalServerException
            (Json_deserializers.internal_server_exception_of_yojson tree path)
      | _, "ResourceUnavailableException" ->
          `ResourceUnavailableException
            (Json_deserializers.resource_unavailable_exception_of_yojson tree path)
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
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"AWSKendraRerankingFrontendService.TagResource"
      ~service ~context ~input
      ~output_deserializer:Json_deserializers.tag_resource_response_of_yojson ~error_deserializer

  let request_with_metadata context (request : tag_resource_request) =
    let input = Json_serializers.tag_resource_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata
      ~shape_name:"AWSKendraRerankingFrontendService.TagResource" ~service ~context ~input
      ~output_deserializer:Json_deserializers.tag_resource_response_of_yojson ~error_deserializer
end

module UntagResource = struct
  let error_to_string = function
    | `AccessDeniedException _ -> "com.amazonaws.kendraranking#AccessDeniedException"
    | `InternalServerException _ -> "com.amazonaws.kendraranking#InternalServerException"
    | `ResourceUnavailableException _ -> "com.amazonaws.kendraranking#ResourceUnavailableException"
    | `ThrottlingException _ -> "com.amazonaws.kendraranking#ThrottlingException"
    | `ValidationException _ -> "com.amazonaws.kendraranking#ValidationException"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "AccessDeniedException" ->
          `AccessDeniedException (Json_deserializers.access_denied_exception_of_yojson tree path)
      | _, "InternalServerException" ->
          `InternalServerException
            (Json_deserializers.internal_server_exception_of_yojson tree path)
      | _, "ResourceUnavailableException" ->
          `ResourceUnavailableException
            (Json_deserializers.resource_unavailable_exception_of_yojson tree path)
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
    Smaws_Lib.Protocols.AwsJson.request
      ~shape_name:"AWSKendraRerankingFrontendService.UntagResource" ~service ~context ~input
      ~output_deserializer:Json_deserializers.untag_resource_response_of_yojson ~error_deserializer

  let request_with_metadata context (request : untag_resource_request) =
    let input = Json_serializers.untag_resource_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata
      ~shape_name:"AWSKendraRerankingFrontendService.UntagResource" ~service ~context ~input
      ~output_deserializer:Json_deserializers.untag_resource_response_of_yojson ~error_deserializer
end

module UpdateRescoreExecutionPlan = struct
  let error_to_string = function
    | `AccessDeniedException _ -> "com.amazonaws.kendraranking#AccessDeniedException"
    | `ConflictException _ -> "com.amazonaws.kendraranking#ConflictException"
    | `InternalServerException _ -> "com.amazonaws.kendraranking#InternalServerException"
    | `ResourceNotFoundException _ -> "com.amazonaws.kendraranking#ResourceNotFoundException"
    | `ServiceQuotaExceededException _ ->
        "com.amazonaws.kendraranking#ServiceQuotaExceededException"
    | `ThrottlingException _ -> "com.amazonaws.kendraranking#ThrottlingException"
    | `ValidationException _ -> "com.amazonaws.kendraranking#ValidationException"
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

  let request context (request : update_rescore_execution_plan_request) =
    let input = Json_serializers.update_rescore_execution_plan_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request
      ~shape_name:"AWSKendraRerankingFrontendService.UpdateRescoreExecutionPlan" ~service ~context
      ~input ~output_deserializer:Smaws_Lib.Smithy_api.Json_deserializers.unit__of_yojson
      ~error_deserializer

  let request_with_metadata context (request : update_rescore_execution_plan_request) =
    let input = Json_serializers.update_rescore_execution_plan_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata
      ~shape_name:"AWSKendraRerankingFrontendService.UpdateRescoreExecutionPlan" ~service ~context
      ~input ~output_deserializer:Smaws_Lib.Smithy_api.Json_deserializers.unit__of_yojson
      ~error_deserializer
end
