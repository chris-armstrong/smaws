open Types
open Service_metadata

module CreateScalingPlan = struct
  let error_to_string = function
    | `ConcurrentUpdateException _ -> "com.amazonaws.autoscalingplans#ConcurrentUpdateException"
    | `InternalServiceException _ -> "com.amazonaws.autoscalingplans#InternalServiceException"
    | `LimitExceededException _ -> "com.amazonaws.autoscalingplans#LimitExceededException"
    | `ValidationException _ -> "com.amazonaws.autoscalingplans#ValidationException"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "ConcurrentUpdateException" ->
          `ConcurrentUpdateException
            (Json_deserializers.concurrent_update_exception_of_yojson tree path)
      | _, "InternalServiceException" ->
          `InternalServiceException
            (Json_deserializers.internal_service_exception_of_yojson tree path)
      | _, "LimitExceededException" ->
          `LimitExceededException (Json_deserializers.limit_exceeded_exception_of_yojson tree path)
      | _, "ValidationException" ->
          `ValidationException (Json_deserializers.validation_exception_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : create_scaling_plan_request) =
    let input = Json_serializers.create_scaling_plan_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request
      ~shape_name:"AnyScaleScalingPlannerFrontendService.CreateScalingPlan" ~service ~context ~input
      ~output_deserializer:Json_deserializers.create_scaling_plan_response_of_yojson
      ~error_deserializer

  let request_with_metadata context (request : create_scaling_plan_request) =
    let input = Json_serializers.create_scaling_plan_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata
      ~shape_name:"AnyScaleScalingPlannerFrontendService.CreateScalingPlan" ~service ~context ~input
      ~output_deserializer:Json_deserializers.create_scaling_plan_response_of_yojson
      ~error_deserializer
end

module DeleteScalingPlan = struct
  let error_to_string = function
    | `ConcurrentUpdateException _ -> "com.amazonaws.autoscalingplans#ConcurrentUpdateException"
    | `InternalServiceException _ -> "com.amazonaws.autoscalingplans#InternalServiceException"
    | `ObjectNotFoundException _ -> "com.amazonaws.autoscalingplans#ObjectNotFoundException"
    | `ValidationException _ -> "com.amazonaws.autoscalingplans#ValidationException"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "ConcurrentUpdateException" ->
          `ConcurrentUpdateException
            (Json_deserializers.concurrent_update_exception_of_yojson tree path)
      | _, "InternalServiceException" ->
          `InternalServiceException
            (Json_deserializers.internal_service_exception_of_yojson tree path)
      | _, "ObjectNotFoundException" ->
          `ObjectNotFoundException
            (Json_deserializers.object_not_found_exception_of_yojson tree path)
      | _, "ValidationException" ->
          `ValidationException (Json_deserializers.validation_exception_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : delete_scaling_plan_request) =
    let input = Json_serializers.delete_scaling_plan_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request
      ~shape_name:"AnyScaleScalingPlannerFrontendService.DeleteScalingPlan" ~service ~context ~input
      ~output_deserializer:Json_deserializers.delete_scaling_plan_response_of_yojson
      ~error_deserializer

  let request_with_metadata context (request : delete_scaling_plan_request) =
    let input = Json_serializers.delete_scaling_plan_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata
      ~shape_name:"AnyScaleScalingPlannerFrontendService.DeleteScalingPlan" ~service ~context ~input
      ~output_deserializer:Json_deserializers.delete_scaling_plan_response_of_yojson
      ~error_deserializer
end

module DescribeScalingPlanResources = struct
  let error_to_string = function
    | `ConcurrentUpdateException _ -> "com.amazonaws.autoscalingplans#ConcurrentUpdateException"
    | `InternalServiceException _ -> "com.amazonaws.autoscalingplans#InternalServiceException"
    | `InvalidNextTokenException _ -> "com.amazonaws.autoscalingplans#InvalidNextTokenException"
    | `ValidationException _ -> "com.amazonaws.autoscalingplans#ValidationException"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "ConcurrentUpdateException" ->
          `ConcurrentUpdateException
            (Json_deserializers.concurrent_update_exception_of_yojson tree path)
      | _, "InternalServiceException" ->
          `InternalServiceException
            (Json_deserializers.internal_service_exception_of_yojson tree path)
      | _, "InvalidNextTokenException" ->
          `InvalidNextTokenException
            (Json_deserializers.invalid_next_token_exception_of_yojson tree path)
      | _, "ValidationException" ->
          `ValidationException (Json_deserializers.validation_exception_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : describe_scaling_plan_resources_request) =
    let input = Json_serializers.describe_scaling_plan_resources_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request
      ~shape_name:"AnyScaleScalingPlannerFrontendService.DescribeScalingPlanResources" ~service
      ~context ~input
      ~output_deserializer:Json_deserializers.describe_scaling_plan_resources_response_of_yojson
      ~error_deserializer

  let request_with_metadata context (request : describe_scaling_plan_resources_request) =
    let input = Json_serializers.describe_scaling_plan_resources_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata
      ~shape_name:"AnyScaleScalingPlannerFrontendService.DescribeScalingPlanResources" ~service
      ~context ~input
      ~output_deserializer:Json_deserializers.describe_scaling_plan_resources_response_of_yojson
      ~error_deserializer
end

module DescribeScalingPlans = struct
  let error_to_string = function
    | `ConcurrentUpdateException _ -> "com.amazonaws.autoscalingplans#ConcurrentUpdateException"
    | `InternalServiceException _ -> "com.amazonaws.autoscalingplans#InternalServiceException"
    | `InvalidNextTokenException _ -> "com.amazonaws.autoscalingplans#InvalidNextTokenException"
    | `ValidationException _ -> "com.amazonaws.autoscalingplans#ValidationException"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "ConcurrentUpdateException" ->
          `ConcurrentUpdateException
            (Json_deserializers.concurrent_update_exception_of_yojson tree path)
      | _, "InternalServiceException" ->
          `InternalServiceException
            (Json_deserializers.internal_service_exception_of_yojson tree path)
      | _, "InvalidNextTokenException" ->
          `InvalidNextTokenException
            (Json_deserializers.invalid_next_token_exception_of_yojson tree path)
      | _, "ValidationException" ->
          `ValidationException (Json_deserializers.validation_exception_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : describe_scaling_plans_request) =
    let input = Json_serializers.describe_scaling_plans_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request
      ~shape_name:"AnyScaleScalingPlannerFrontendService.DescribeScalingPlans" ~service ~context
      ~input ~output_deserializer:Json_deserializers.describe_scaling_plans_response_of_yojson
      ~error_deserializer

  let request_with_metadata context (request : describe_scaling_plans_request) =
    let input = Json_serializers.describe_scaling_plans_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata
      ~shape_name:"AnyScaleScalingPlannerFrontendService.DescribeScalingPlans" ~service ~context
      ~input ~output_deserializer:Json_deserializers.describe_scaling_plans_response_of_yojson
      ~error_deserializer
end

module GetScalingPlanResourceForecastData = struct
  let error_to_string = function
    | `InternalServiceException _ -> "com.amazonaws.autoscalingplans#InternalServiceException"
    | `ValidationException _ -> "com.amazonaws.autoscalingplans#ValidationException"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "InternalServiceException" ->
          `InternalServiceException
            (Json_deserializers.internal_service_exception_of_yojson tree path)
      | _, "ValidationException" ->
          `ValidationException (Json_deserializers.validation_exception_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : get_scaling_plan_resource_forecast_data_request) =
    let input =
      Json_serializers.get_scaling_plan_resource_forecast_data_request_to_yojson request
    in
    Smaws_Lib.Protocols.AwsJson.request
      ~shape_name:"AnyScaleScalingPlannerFrontendService.GetScalingPlanResourceForecastData"
      ~service ~context ~input
      ~output_deserializer:
        Json_deserializers.get_scaling_plan_resource_forecast_data_response_of_yojson
      ~error_deserializer

  let request_with_metadata context (request : get_scaling_plan_resource_forecast_data_request) =
    let input =
      Json_serializers.get_scaling_plan_resource_forecast_data_request_to_yojson request
    in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata
      ~shape_name:"AnyScaleScalingPlannerFrontendService.GetScalingPlanResourceForecastData"
      ~service ~context ~input
      ~output_deserializer:
        Json_deserializers.get_scaling_plan_resource_forecast_data_response_of_yojson
      ~error_deserializer
end

module UpdateScalingPlan = struct
  let error_to_string = function
    | `ConcurrentUpdateException _ -> "com.amazonaws.autoscalingplans#ConcurrentUpdateException"
    | `InternalServiceException _ -> "com.amazonaws.autoscalingplans#InternalServiceException"
    | `ObjectNotFoundException _ -> "com.amazonaws.autoscalingplans#ObjectNotFoundException"
    | `ValidationException _ -> "com.amazonaws.autoscalingplans#ValidationException"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "ConcurrentUpdateException" ->
          `ConcurrentUpdateException
            (Json_deserializers.concurrent_update_exception_of_yojson tree path)
      | _, "InternalServiceException" ->
          `InternalServiceException
            (Json_deserializers.internal_service_exception_of_yojson tree path)
      | _, "ObjectNotFoundException" ->
          `ObjectNotFoundException
            (Json_deserializers.object_not_found_exception_of_yojson tree path)
      | _, "ValidationException" ->
          `ValidationException (Json_deserializers.validation_exception_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : update_scaling_plan_request) =
    let input = Json_serializers.update_scaling_plan_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request
      ~shape_name:"AnyScaleScalingPlannerFrontendService.UpdateScalingPlan" ~service ~context ~input
      ~output_deserializer:Json_deserializers.update_scaling_plan_response_of_yojson
      ~error_deserializer

  let request_with_metadata context (request : update_scaling_plan_request) =
    let input = Json_serializers.update_scaling_plan_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata
      ~shape_name:"AnyScaleScalingPlannerFrontendService.UpdateScalingPlan" ~service ~context ~input
      ~output_deserializer:Json_deserializers.update_scaling_plan_response_of_yojson
      ~error_deserializer
end
