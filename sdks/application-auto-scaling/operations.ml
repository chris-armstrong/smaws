open Types
open Service_metadata

module DeleteScalingPolicy = struct
  let error_to_string = function
    | `ConcurrentUpdateException _ ->
        "com.amazonaws.applicationautoscaling#ConcurrentUpdateException"
    | `InternalServiceException _ -> "com.amazonaws.applicationautoscaling#InternalServiceException"
    | `ObjectNotFoundException _ -> "com.amazonaws.applicationautoscaling#ObjectNotFoundException"
    | `ValidationException _ -> "com.amazonaws.applicationautoscaling#ValidationException"
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

  let request context (request : delete_scaling_policy_request) =
    let input = Json_serializers.delete_scaling_policy_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"AnyScaleFrontendService.DeleteScalingPolicy"
      ~service ~context ~input
      ~output_deserializer:Json_deserializers.delete_scaling_policy_response_of_yojson
      ~error_deserializer

  let request_with_metadata context (request : delete_scaling_policy_request) =
    let input = Json_serializers.delete_scaling_policy_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata
      ~shape_name:"AnyScaleFrontendService.DeleteScalingPolicy" ~service ~context ~input
      ~output_deserializer:Json_deserializers.delete_scaling_policy_response_of_yojson
      ~error_deserializer
end

module DeleteScheduledAction = struct
  let error_to_string = function
    | `ConcurrentUpdateException _ ->
        "com.amazonaws.applicationautoscaling#ConcurrentUpdateException"
    | `InternalServiceException _ -> "com.amazonaws.applicationautoscaling#InternalServiceException"
    | `ObjectNotFoundException _ -> "com.amazonaws.applicationautoscaling#ObjectNotFoundException"
    | `ValidationException _ -> "com.amazonaws.applicationautoscaling#ValidationException"
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

  let request context (request : delete_scheduled_action_request) =
    let input = Json_serializers.delete_scheduled_action_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"AnyScaleFrontendService.DeleteScheduledAction"
      ~service ~context ~input
      ~output_deserializer:Json_deserializers.delete_scheduled_action_response_of_yojson
      ~error_deserializer

  let request_with_metadata context (request : delete_scheduled_action_request) =
    let input = Json_serializers.delete_scheduled_action_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata
      ~shape_name:"AnyScaleFrontendService.DeleteScheduledAction" ~service ~context ~input
      ~output_deserializer:Json_deserializers.delete_scheduled_action_response_of_yojson
      ~error_deserializer
end

module DeregisterScalableTarget = struct
  let error_to_string = function
    | `ConcurrentUpdateException _ ->
        "com.amazonaws.applicationautoscaling#ConcurrentUpdateException"
    | `InternalServiceException _ -> "com.amazonaws.applicationautoscaling#InternalServiceException"
    | `ObjectNotFoundException _ -> "com.amazonaws.applicationautoscaling#ObjectNotFoundException"
    | `ValidationException _ -> "com.amazonaws.applicationautoscaling#ValidationException"
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

  let request context (request : deregister_scalable_target_request) =
    let input = Json_serializers.deregister_scalable_target_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request
      ~shape_name:"AnyScaleFrontendService.DeregisterScalableTarget" ~service ~context ~input
      ~output_deserializer:Json_deserializers.deregister_scalable_target_response_of_yojson
      ~error_deserializer

  let request_with_metadata context (request : deregister_scalable_target_request) =
    let input = Json_serializers.deregister_scalable_target_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata
      ~shape_name:"AnyScaleFrontendService.DeregisterScalableTarget" ~service ~context ~input
      ~output_deserializer:Json_deserializers.deregister_scalable_target_response_of_yojson
      ~error_deserializer
end

module DescribeScalableTargets = struct
  let error_to_string = function
    | `ConcurrentUpdateException _ ->
        "com.amazonaws.applicationautoscaling#ConcurrentUpdateException"
    | `InternalServiceException _ -> "com.amazonaws.applicationautoscaling#InternalServiceException"
    | `InvalidNextTokenException _ ->
        "com.amazonaws.applicationautoscaling#InvalidNextTokenException"
    | `ValidationException _ -> "com.amazonaws.applicationautoscaling#ValidationException"
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

  let request context (request : describe_scalable_targets_request) =
    let input = Json_serializers.describe_scalable_targets_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request
      ~shape_name:"AnyScaleFrontendService.DescribeScalableTargets" ~service ~context ~input
      ~output_deserializer:Json_deserializers.describe_scalable_targets_response_of_yojson
      ~error_deserializer

  let request_with_metadata context (request : describe_scalable_targets_request) =
    let input = Json_serializers.describe_scalable_targets_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata
      ~shape_name:"AnyScaleFrontendService.DescribeScalableTargets" ~service ~context ~input
      ~output_deserializer:Json_deserializers.describe_scalable_targets_response_of_yojson
      ~error_deserializer
end

module DescribeScalingActivities = struct
  let error_to_string = function
    | `ConcurrentUpdateException _ ->
        "com.amazonaws.applicationautoscaling#ConcurrentUpdateException"
    | `InternalServiceException _ -> "com.amazonaws.applicationautoscaling#InternalServiceException"
    | `InvalidNextTokenException _ ->
        "com.amazonaws.applicationautoscaling#InvalidNextTokenException"
    | `ValidationException _ -> "com.amazonaws.applicationautoscaling#ValidationException"
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

  let request context (request : describe_scaling_activities_request) =
    let input = Json_serializers.describe_scaling_activities_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request
      ~shape_name:"AnyScaleFrontendService.DescribeScalingActivities" ~service ~context ~input
      ~output_deserializer:Json_deserializers.describe_scaling_activities_response_of_yojson
      ~error_deserializer

  let request_with_metadata context (request : describe_scaling_activities_request) =
    let input = Json_serializers.describe_scaling_activities_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata
      ~shape_name:"AnyScaleFrontendService.DescribeScalingActivities" ~service ~context ~input
      ~output_deserializer:Json_deserializers.describe_scaling_activities_response_of_yojson
      ~error_deserializer
end

module DescribeScalingPolicies = struct
  let error_to_string = function
    | `ConcurrentUpdateException _ ->
        "com.amazonaws.applicationautoscaling#ConcurrentUpdateException"
    | `FailedResourceAccessException _ ->
        "com.amazonaws.applicationautoscaling#FailedResourceAccessException"
    | `InternalServiceException _ -> "com.amazonaws.applicationautoscaling#InternalServiceException"
    | `InvalidNextTokenException _ ->
        "com.amazonaws.applicationautoscaling#InvalidNextTokenException"
    | `ValidationException _ -> "com.amazonaws.applicationautoscaling#ValidationException"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "ConcurrentUpdateException" ->
          `ConcurrentUpdateException
            (Json_deserializers.concurrent_update_exception_of_yojson tree path)
      | _, "FailedResourceAccessException" ->
          `FailedResourceAccessException
            (Json_deserializers.failed_resource_access_exception_of_yojson tree path)
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

  let request context (request : describe_scaling_policies_request) =
    let input = Json_serializers.describe_scaling_policies_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request
      ~shape_name:"AnyScaleFrontendService.DescribeScalingPolicies" ~service ~context ~input
      ~output_deserializer:Json_deserializers.describe_scaling_policies_response_of_yojson
      ~error_deserializer

  let request_with_metadata context (request : describe_scaling_policies_request) =
    let input = Json_serializers.describe_scaling_policies_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata
      ~shape_name:"AnyScaleFrontendService.DescribeScalingPolicies" ~service ~context ~input
      ~output_deserializer:Json_deserializers.describe_scaling_policies_response_of_yojson
      ~error_deserializer
end

module DescribeScheduledActions = struct
  let error_to_string = function
    | `ConcurrentUpdateException _ ->
        "com.amazonaws.applicationautoscaling#ConcurrentUpdateException"
    | `InternalServiceException _ -> "com.amazonaws.applicationautoscaling#InternalServiceException"
    | `InvalidNextTokenException _ ->
        "com.amazonaws.applicationautoscaling#InvalidNextTokenException"
    | `ValidationException _ -> "com.amazonaws.applicationautoscaling#ValidationException"
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

  let request context (request : describe_scheduled_actions_request) =
    let input = Json_serializers.describe_scheduled_actions_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request
      ~shape_name:"AnyScaleFrontendService.DescribeScheduledActions" ~service ~context ~input
      ~output_deserializer:Json_deserializers.describe_scheduled_actions_response_of_yojson
      ~error_deserializer

  let request_with_metadata context (request : describe_scheduled_actions_request) =
    let input = Json_serializers.describe_scheduled_actions_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata
      ~shape_name:"AnyScaleFrontendService.DescribeScheduledActions" ~service ~context ~input
      ~output_deserializer:Json_deserializers.describe_scheduled_actions_response_of_yojson
      ~error_deserializer
end

module GetPredictiveScalingForecast = struct
  let error_to_string = function
    | `InternalServiceException _ -> "com.amazonaws.applicationautoscaling#InternalServiceException"
    | `ValidationException _ -> "com.amazonaws.applicationautoscaling#ValidationException"
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

  let request context (request : get_predictive_scaling_forecast_request) =
    let input = Json_serializers.get_predictive_scaling_forecast_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request
      ~shape_name:"AnyScaleFrontendService.GetPredictiveScalingForecast" ~service ~context ~input
      ~output_deserializer:Json_deserializers.get_predictive_scaling_forecast_response_of_yojson
      ~error_deserializer

  let request_with_metadata context (request : get_predictive_scaling_forecast_request) =
    let input = Json_serializers.get_predictive_scaling_forecast_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata
      ~shape_name:"AnyScaleFrontendService.GetPredictiveScalingForecast" ~service ~context ~input
      ~output_deserializer:Json_deserializers.get_predictive_scaling_forecast_response_of_yojson
      ~error_deserializer
end

module ListTagsForResource = struct
  let error_to_string = function
    | `ResourceNotFoundException _ ->
        "com.amazonaws.applicationautoscaling#ResourceNotFoundException"
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
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"AnyScaleFrontendService.ListTagsForResource"
      ~service ~context ~input
      ~output_deserializer:Json_deserializers.list_tags_for_resource_response_of_yojson
      ~error_deserializer

  let request_with_metadata context (request : list_tags_for_resource_request) =
    let input = Json_serializers.list_tags_for_resource_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata
      ~shape_name:"AnyScaleFrontendService.ListTagsForResource" ~service ~context ~input
      ~output_deserializer:Json_deserializers.list_tags_for_resource_response_of_yojson
      ~error_deserializer
end

module PutScalingPolicy = struct
  let error_to_string = function
    | `ConcurrentUpdateException _ ->
        "com.amazonaws.applicationautoscaling#ConcurrentUpdateException"
    | `FailedResourceAccessException _ ->
        "com.amazonaws.applicationautoscaling#FailedResourceAccessException"
    | `InternalServiceException _ -> "com.amazonaws.applicationautoscaling#InternalServiceException"
    | `LimitExceededException _ -> "com.amazonaws.applicationautoscaling#LimitExceededException"
    | `ObjectNotFoundException _ -> "com.amazonaws.applicationautoscaling#ObjectNotFoundException"
    | `ValidationException _ -> "com.amazonaws.applicationautoscaling#ValidationException"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "ConcurrentUpdateException" ->
          `ConcurrentUpdateException
            (Json_deserializers.concurrent_update_exception_of_yojson tree path)
      | _, "FailedResourceAccessException" ->
          `FailedResourceAccessException
            (Json_deserializers.failed_resource_access_exception_of_yojson tree path)
      | _, "InternalServiceException" ->
          `InternalServiceException
            (Json_deserializers.internal_service_exception_of_yojson tree path)
      | _, "LimitExceededException" ->
          `LimitExceededException (Json_deserializers.limit_exceeded_exception_of_yojson tree path)
      | _, "ObjectNotFoundException" ->
          `ObjectNotFoundException
            (Json_deserializers.object_not_found_exception_of_yojson tree path)
      | _, "ValidationException" ->
          `ValidationException (Json_deserializers.validation_exception_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : put_scaling_policy_request) =
    let input = Json_serializers.put_scaling_policy_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"AnyScaleFrontendService.PutScalingPolicy"
      ~service ~context ~input
      ~output_deserializer:Json_deserializers.put_scaling_policy_response_of_yojson
      ~error_deserializer

  let request_with_metadata context (request : put_scaling_policy_request) =
    let input = Json_serializers.put_scaling_policy_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata
      ~shape_name:"AnyScaleFrontendService.PutScalingPolicy" ~service ~context ~input
      ~output_deserializer:Json_deserializers.put_scaling_policy_response_of_yojson
      ~error_deserializer
end

module PutScheduledAction = struct
  let error_to_string = function
    | `ConcurrentUpdateException _ ->
        "com.amazonaws.applicationautoscaling#ConcurrentUpdateException"
    | `InternalServiceException _ -> "com.amazonaws.applicationautoscaling#InternalServiceException"
    | `LimitExceededException _ -> "com.amazonaws.applicationautoscaling#LimitExceededException"
    | `ObjectNotFoundException _ -> "com.amazonaws.applicationautoscaling#ObjectNotFoundException"
    | `ValidationException _ -> "com.amazonaws.applicationautoscaling#ValidationException"
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
      | _, "ObjectNotFoundException" ->
          `ObjectNotFoundException
            (Json_deserializers.object_not_found_exception_of_yojson tree path)
      | _, "ValidationException" ->
          `ValidationException (Json_deserializers.validation_exception_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : put_scheduled_action_request) =
    let input = Json_serializers.put_scheduled_action_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"AnyScaleFrontendService.PutScheduledAction"
      ~service ~context ~input
      ~output_deserializer:Json_deserializers.put_scheduled_action_response_of_yojson
      ~error_deserializer

  let request_with_metadata context (request : put_scheduled_action_request) =
    let input = Json_serializers.put_scheduled_action_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata
      ~shape_name:"AnyScaleFrontendService.PutScheduledAction" ~service ~context ~input
      ~output_deserializer:Json_deserializers.put_scheduled_action_response_of_yojson
      ~error_deserializer
end

module RegisterScalableTarget = struct
  let error_to_string = function
    | `ConcurrentUpdateException _ ->
        "com.amazonaws.applicationautoscaling#ConcurrentUpdateException"
    | `InternalServiceException _ -> "com.amazonaws.applicationautoscaling#InternalServiceException"
    | `LimitExceededException _ -> "com.amazonaws.applicationautoscaling#LimitExceededException"
    | `ValidationException _ -> "com.amazonaws.applicationautoscaling#ValidationException"
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

  let request context (request : register_scalable_target_request) =
    let input = Json_serializers.register_scalable_target_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"AnyScaleFrontendService.RegisterScalableTarget"
      ~service ~context ~input
      ~output_deserializer:Json_deserializers.register_scalable_target_response_of_yojson
      ~error_deserializer

  let request_with_metadata context (request : register_scalable_target_request) =
    let input = Json_serializers.register_scalable_target_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata
      ~shape_name:"AnyScaleFrontendService.RegisterScalableTarget" ~service ~context ~input
      ~output_deserializer:Json_deserializers.register_scalable_target_response_of_yojson
      ~error_deserializer
end

module TagResource = struct
  let error_to_string = function
    | `ResourceNotFoundException _ ->
        "com.amazonaws.applicationautoscaling#ResourceNotFoundException"
    | `TooManyTagsException _ -> "com.amazonaws.applicationautoscaling#TooManyTagsException"
    | `ValidationException _ -> "com.amazonaws.applicationautoscaling#ValidationException"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "ResourceNotFoundException" ->
          `ResourceNotFoundException
            (Json_deserializers.resource_not_found_exception_of_yojson tree path)
      | _, "TooManyTagsException" ->
          `TooManyTagsException (Json_deserializers.too_many_tags_exception_of_yojson tree path)
      | _, "ValidationException" ->
          `ValidationException (Json_deserializers.validation_exception_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : tag_resource_request) =
    let input = Json_serializers.tag_resource_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"AnyScaleFrontendService.TagResource" ~service
      ~context ~input ~output_deserializer:Json_deserializers.tag_resource_response_of_yojson
      ~error_deserializer

  let request_with_metadata context (request : tag_resource_request) =
    let input = Json_serializers.tag_resource_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata
      ~shape_name:"AnyScaleFrontendService.TagResource" ~service ~context ~input
      ~output_deserializer:Json_deserializers.tag_resource_response_of_yojson ~error_deserializer
end

module UntagResource = struct
  let error_to_string = function
    | `ResourceNotFoundException _ ->
        "com.amazonaws.applicationautoscaling#ResourceNotFoundException"
    | `ValidationException _ -> "com.amazonaws.applicationautoscaling#ValidationException"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "ResourceNotFoundException" ->
          `ResourceNotFoundException
            (Json_deserializers.resource_not_found_exception_of_yojson tree path)
      | _, "ValidationException" ->
          `ValidationException (Json_deserializers.validation_exception_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : untag_resource_request) =
    let input = Json_serializers.untag_resource_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"AnyScaleFrontendService.UntagResource" ~service
      ~context ~input ~output_deserializer:Json_deserializers.untag_resource_response_of_yojson
      ~error_deserializer

  let request_with_metadata context (request : untag_resource_request) =
    let input = Json_serializers.untag_resource_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata
      ~shape_name:"AnyScaleFrontendService.UntagResource" ~service ~context ~input
      ~output_deserializer:Json_deserializers.untag_resource_response_of_yojson ~error_deserializer
end
