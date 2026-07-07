open Types
open Service_metadata

module DeleteRecommendationPreferences = struct
  let error_to_string = function
    | `AccessDeniedException _ -> "com.amazonaws.computeoptimizer#AccessDeniedException"
    | `InternalServerException _ -> "com.amazonaws.computeoptimizer#InternalServerException"
    | `InvalidParameterValueException _ ->
        "com.amazonaws.computeoptimizer#InvalidParameterValueException"
    | `MissingAuthenticationToken _ -> "com.amazonaws.computeoptimizer#MissingAuthenticationToken"
    | `OptInRequiredException _ -> "com.amazonaws.computeoptimizer#OptInRequiredException"
    | `ResourceNotFoundException _ -> "com.amazonaws.computeoptimizer#ResourceNotFoundException"
    | `ServiceUnavailableException _ -> "com.amazonaws.computeoptimizer#ServiceUnavailableException"
    | `ThrottlingException _ -> "com.amazonaws.computeoptimizer#ThrottlingException"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "AccessDeniedException" ->
          `AccessDeniedException (Json_deserializers.access_denied_exception_of_yojson tree path)
      | _, "InternalServerException" ->
          `InternalServerException
            (Json_deserializers.internal_server_exception_of_yojson tree path)
      | _, "InvalidParameterValueException" ->
          `InvalidParameterValueException
            (Json_deserializers.invalid_parameter_value_exception_of_yojson tree path)
      | _, "MissingAuthenticationToken" ->
          `MissingAuthenticationToken
            (Json_deserializers.missing_authentication_token_of_yojson tree path)
      | _, "OptInRequiredException" ->
          `OptInRequiredException (Json_deserializers.opt_in_required_exception_of_yojson tree path)
      | _, "ResourceNotFoundException" ->
          `ResourceNotFoundException
            (Json_deserializers.resource_not_found_exception_of_yojson tree path)
      | _, "ServiceUnavailableException" ->
          `ServiceUnavailableException
            (Json_deserializers.service_unavailable_exception_of_yojson tree path)
      | _, "ThrottlingException" ->
          `ThrottlingException (Json_deserializers.throttling_exception_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : delete_recommendation_preferences_request) =
    let input = Json_serializers.delete_recommendation_preferences_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request
      ~shape_name:"ComputeOptimizerService.DeleteRecommendationPreferences" ~service ~context ~input
      ~output_deserializer:Json_deserializers.delete_recommendation_preferences_response_of_yojson
      ~error_deserializer

  let request_with_metadata context (request : delete_recommendation_preferences_request) =
    let input = Json_serializers.delete_recommendation_preferences_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata
      ~shape_name:"ComputeOptimizerService.DeleteRecommendationPreferences" ~service ~context ~input
      ~output_deserializer:Json_deserializers.delete_recommendation_preferences_response_of_yojson
      ~error_deserializer
end

module DescribeRecommendationExportJobs = struct
  let error_to_string = function
    | `AccessDeniedException _ -> "com.amazonaws.computeoptimizer#AccessDeniedException"
    | `InternalServerException _ -> "com.amazonaws.computeoptimizer#InternalServerException"
    | `InvalidParameterValueException _ ->
        "com.amazonaws.computeoptimizer#InvalidParameterValueException"
    | `MissingAuthenticationToken _ -> "com.amazonaws.computeoptimizer#MissingAuthenticationToken"
    | `OptInRequiredException _ -> "com.amazonaws.computeoptimizer#OptInRequiredException"
    | `ResourceNotFoundException _ -> "com.amazonaws.computeoptimizer#ResourceNotFoundException"
    | `ServiceUnavailableException _ -> "com.amazonaws.computeoptimizer#ServiceUnavailableException"
    | `ThrottlingException _ -> "com.amazonaws.computeoptimizer#ThrottlingException"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "AccessDeniedException" ->
          `AccessDeniedException (Json_deserializers.access_denied_exception_of_yojson tree path)
      | _, "InternalServerException" ->
          `InternalServerException
            (Json_deserializers.internal_server_exception_of_yojson tree path)
      | _, "InvalidParameterValueException" ->
          `InvalidParameterValueException
            (Json_deserializers.invalid_parameter_value_exception_of_yojson tree path)
      | _, "MissingAuthenticationToken" ->
          `MissingAuthenticationToken
            (Json_deserializers.missing_authentication_token_of_yojson tree path)
      | _, "OptInRequiredException" ->
          `OptInRequiredException (Json_deserializers.opt_in_required_exception_of_yojson tree path)
      | _, "ResourceNotFoundException" ->
          `ResourceNotFoundException
            (Json_deserializers.resource_not_found_exception_of_yojson tree path)
      | _, "ServiceUnavailableException" ->
          `ServiceUnavailableException
            (Json_deserializers.service_unavailable_exception_of_yojson tree path)
      | _, "ThrottlingException" ->
          `ThrottlingException (Json_deserializers.throttling_exception_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : describe_recommendation_export_jobs_request) =
    let input = Json_serializers.describe_recommendation_export_jobs_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request
      ~shape_name:"ComputeOptimizerService.DescribeRecommendationExportJobs" ~service ~context
      ~input
      ~output_deserializer:Json_deserializers.describe_recommendation_export_jobs_response_of_yojson
      ~error_deserializer

  let request_with_metadata context (request : describe_recommendation_export_jobs_request) =
    let input = Json_serializers.describe_recommendation_export_jobs_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata
      ~shape_name:"ComputeOptimizerService.DescribeRecommendationExportJobs" ~service ~context
      ~input
      ~output_deserializer:Json_deserializers.describe_recommendation_export_jobs_response_of_yojson
      ~error_deserializer
end

module ExportAutoScalingGroupRecommendations = struct
  let error_to_string = function
    | `AccessDeniedException _ -> "com.amazonaws.computeoptimizer#AccessDeniedException"
    | `InternalServerException _ -> "com.amazonaws.computeoptimizer#InternalServerException"
    | `InvalidParameterValueException _ ->
        "com.amazonaws.computeoptimizer#InvalidParameterValueException"
    | `LimitExceededException _ -> "com.amazonaws.computeoptimizer#LimitExceededException"
    | `MissingAuthenticationToken _ -> "com.amazonaws.computeoptimizer#MissingAuthenticationToken"
    | `OptInRequiredException _ -> "com.amazonaws.computeoptimizer#OptInRequiredException"
    | `ServiceUnavailableException _ -> "com.amazonaws.computeoptimizer#ServiceUnavailableException"
    | `ThrottlingException _ -> "com.amazonaws.computeoptimizer#ThrottlingException"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "AccessDeniedException" ->
          `AccessDeniedException (Json_deserializers.access_denied_exception_of_yojson tree path)
      | _, "InternalServerException" ->
          `InternalServerException
            (Json_deserializers.internal_server_exception_of_yojson tree path)
      | _, "InvalidParameterValueException" ->
          `InvalidParameterValueException
            (Json_deserializers.invalid_parameter_value_exception_of_yojson tree path)
      | _, "LimitExceededException" ->
          `LimitExceededException (Json_deserializers.limit_exceeded_exception_of_yojson tree path)
      | _, "MissingAuthenticationToken" ->
          `MissingAuthenticationToken
            (Json_deserializers.missing_authentication_token_of_yojson tree path)
      | _, "OptInRequiredException" ->
          `OptInRequiredException (Json_deserializers.opt_in_required_exception_of_yojson tree path)
      | _, "ServiceUnavailableException" ->
          `ServiceUnavailableException
            (Json_deserializers.service_unavailable_exception_of_yojson tree path)
      | _, "ThrottlingException" ->
          `ThrottlingException (Json_deserializers.throttling_exception_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : export_auto_scaling_group_recommendations_request) =
    let input =
      Json_serializers.export_auto_scaling_group_recommendations_request_to_yojson request
    in
    Smaws_Lib.Protocols.AwsJson.request
      ~shape_name:"ComputeOptimizerService.ExportAutoScalingGroupRecommendations" ~service ~context
      ~input
      ~output_deserializer:
        Json_deserializers.export_auto_scaling_group_recommendations_response_of_yojson
      ~error_deserializer

  let request_with_metadata context (request : export_auto_scaling_group_recommendations_request) =
    let input =
      Json_serializers.export_auto_scaling_group_recommendations_request_to_yojson request
    in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata
      ~shape_name:"ComputeOptimizerService.ExportAutoScalingGroupRecommendations" ~service ~context
      ~input
      ~output_deserializer:
        Json_deserializers.export_auto_scaling_group_recommendations_response_of_yojson
      ~error_deserializer
end

module ExportEBSVolumeRecommendations = struct
  let error_to_string = function
    | `AccessDeniedException _ -> "com.amazonaws.computeoptimizer#AccessDeniedException"
    | `InternalServerException _ -> "com.amazonaws.computeoptimizer#InternalServerException"
    | `InvalidParameterValueException _ ->
        "com.amazonaws.computeoptimizer#InvalidParameterValueException"
    | `LimitExceededException _ -> "com.amazonaws.computeoptimizer#LimitExceededException"
    | `MissingAuthenticationToken _ -> "com.amazonaws.computeoptimizer#MissingAuthenticationToken"
    | `OptInRequiredException _ -> "com.amazonaws.computeoptimizer#OptInRequiredException"
    | `ServiceUnavailableException _ -> "com.amazonaws.computeoptimizer#ServiceUnavailableException"
    | `ThrottlingException _ -> "com.amazonaws.computeoptimizer#ThrottlingException"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "AccessDeniedException" ->
          `AccessDeniedException (Json_deserializers.access_denied_exception_of_yojson tree path)
      | _, "InternalServerException" ->
          `InternalServerException
            (Json_deserializers.internal_server_exception_of_yojson tree path)
      | _, "InvalidParameterValueException" ->
          `InvalidParameterValueException
            (Json_deserializers.invalid_parameter_value_exception_of_yojson tree path)
      | _, "LimitExceededException" ->
          `LimitExceededException (Json_deserializers.limit_exceeded_exception_of_yojson tree path)
      | _, "MissingAuthenticationToken" ->
          `MissingAuthenticationToken
            (Json_deserializers.missing_authentication_token_of_yojson tree path)
      | _, "OptInRequiredException" ->
          `OptInRequiredException (Json_deserializers.opt_in_required_exception_of_yojson tree path)
      | _, "ServiceUnavailableException" ->
          `ServiceUnavailableException
            (Json_deserializers.service_unavailable_exception_of_yojson tree path)
      | _, "ThrottlingException" ->
          `ThrottlingException (Json_deserializers.throttling_exception_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : export_ebs_volume_recommendations_request) =
    let input = Json_serializers.export_ebs_volume_recommendations_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request
      ~shape_name:"ComputeOptimizerService.ExportEBSVolumeRecommendations" ~service ~context ~input
      ~output_deserializer:Json_deserializers.export_ebs_volume_recommendations_response_of_yojson
      ~error_deserializer

  let request_with_metadata context (request : export_ebs_volume_recommendations_request) =
    let input = Json_serializers.export_ebs_volume_recommendations_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata
      ~shape_name:"ComputeOptimizerService.ExportEBSVolumeRecommendations" ~service ~context ~input
      ~output_deserializer:Json_deserializers.export_ebs_volume_recommendations_response_of_yojson
      ~error_deserializer
end

module ExportEC2InstanceRecommendations = struct
  let error_to_string = function
    | `AccessDeniedException _ -> "com.amazonaws.computeoptimizer#AccessDeniedException"
    | `InternalServerException _ -> "com.amazonaws.computeoptimizer#InternalServerException"
    | `InvalidParameterValueException _ ->
        "com.amazonaws.computeoptimizer#InvalidParameterValueException"
    | `LimitExceededException _ -> "com.amazonaws.computeoptimizer#LimitExceededException"
    | `MissingAuthenticationToken _ -> "com.amazonaws.computeoptimizer#MissingAuthenticationToken"
    | `OptInRequiredException _ -> "com.amazonaws.computeoptimizer#OptInRequiredException"
    | `ServiceUnavailableException _ -> "com.amazonaws.computeoptimizer#ServiceUnavailableException"
    | `ThrottlingException _ -> "com.amazonaws.computeoptimizer#ThrottlingException"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "AccessDeniedException" ->
          `AccessDeniedException (Json_deserializers.access_denied_exception_of_yojson tree path)
      | _, "InternalServerException" ->
          `InternalServerException
            (Json_deserializers.internal_server_exception_of_yojson tree path)
      | _, "InvalidParameterValueException" ->
          `InvalidParameterValueException
            (Json_deserializers.invalid_parameter_value_exception_of_yojson tree path)
      | _, "LimitExceededException" ->
          `LimitExceededException (Json_deserializers.limit_exceeded_exception_of_yojson tree path)
      | _, "MissingAuthenticationToken" ->
          `MissingAuthenticationToken
            (Json_deserializers.missing_authentication_token_of_yojson tree path)
      | _, "OptInRequiredException" ->
          `OptInRequiredException (Json_deserializers.opt_in_required_exception_of_yojson tree path)
      | _, "ServiceUnavailableException" ->
          `ServiceUnavailableException
            (Json_deserializers.service_unavailable_exception_of_yojson tree path)
      | _, "ThrottlingException" ->
          `ThrottlingException (Json_deserializers.throttling_exception_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : export_ec2_instance_recommendations_request) =
    let input = Json_serializers.export_ec2_instance_recommendations_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request
      ~shape_name:"ComputeOptimizerService.ExportEC2InstanceRecommendations" ~service ~context
      ~input
      ~output_deserializer:Json_deserializers.export_ec2_instance_recommendations_response_of_yojson
      ~error_deserializer

  let request_with_metadata context (request : export_ec2_instance_recommendations_request) =
    let input = Json_serializers.export_ec2_instance_recommendations_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata
      ~shape_name:"ComputeOptimizerService.ExportEC2InstanceRecommendations" ~service ~context
      ~input
      ~output_deserializer:Json_deserializers.export_ec2_instance_recommendations_response_of_yojson
      ~error_deserializer
end

module ExportECSServiceRecommendations = struct
  let error_to_string = function
    | `AccessDeniedException _ -> "com.amazonaws.computeoptimizer#AccessDeniedException"
    | `InternalServerException _ -> "com.amazonaws.computeoptimizer#InternalServerException"
    | `InvalidParameterValueException _ ->
        "com.amazonaws.computeoptimizer#InvalidParameterValueException"
    | `LimitExceededException _ -> "com.amazonaws.computeoptimizer#LimitExceededException"
    | `MissingAuthenticationToken _ -> "com.amazonaws.computeoptimizer#MissingAuthenticationToken"
    | `OptInRequiredException _ -> "com.amazonaws.computeoptimizer#OptInRequiredException"
    | `ServiceUnavailableException _ -> "com.amazonaws.computeoptimizer#ServiceUnavailableException"
    | `ThrottlingException _ -> "com.amazonaws.computeoptimizer#ThrottlingException"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "AccessDeniedException" ->
          `AccessDeniedException (Json_deserializers.access_denied_exception_of_yojson tree path)
      | _, "InternalServerException" ->
          `InternalServerException
            (Json_deserializers.internal_server_exception_of_yojson tree path)
      | _, "InvalidParameterValueException" ->
          `InvalidParameterValueException
            (Json_deserializers.invalid_parameter_value_exception_of_yojson tree path)
      | _, "LimitExceededException" ->
          `LimitExceededException (Json_deserializers.limit_exceeded_exception_of_yojson tree path)
      | _, "MissingAuthenticationToken" ->
          `MissingAuthenticationToken
            (Json_deserializers.missing_authentication_token_of_yojson tree path)
      | _, "OptInRequiredException" ->
          `OptInRequiredException (Json_deserializers.opt_in_required_exception_of_yojson tree path)
      | _, "ServiceUnavailableException" ->
          `ServiceUnavailableException
            (Json_deserializers.service_unavailable_exception_of_yojson tree path)
      | _, "ThrottlingException" ->
          `ThrottlingException (Json_deserializers.throttling_exception_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : export_ecs_service_recommendations_request) =
    let input = Json_serializers.export_ecs_service_recommendations_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request
      ~shape_name:"ComputeOptimizerService.ExportECSServiceRecommendations" ~service ~context ~input
      ~output_deserializer:Json_deserializers.export_ecs_service_recommendations_response_of_yojson
      ~error_deserializer

  let request_with_metadata context (request : export_ecs_service_recommendations_request) =
    let input = Json_serializers.export_ecs_service_recommendations_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata
      ~shape_name:"ComputeOptimizerService.ExportECSServiceRecommendations" ~service ~context ~input
      ~output_deserializer:Json_deserializers.export_ecs_service_recommendations_response_of_yojson
      ~error_deserializer
end

module ExportIdleRecommendations = struct
  let error_to_string = function
    | `AccessDeniedException _ -> "com.amazonaws.computeoptimizer#AccessDeniedException"
    | `InternalServerException _ -> "com.amazonaws.computeoptimizer#InternalServerException"
    | `InvalidParameterValueException _ ->
        "com.amazonaws.computeoptimizer#InvalidParameterValueException"
    | `LimitExceededException _ -> "com.amazonaws.computeoptimizer#LimitExceededException"
    | `MissingAuthenticationToken _ -> "com.amazonaws.computeoptimizer#MissingAuthenticationToken"
    | `OptInRequiredException _ -> "com.amazonaws.computeoptimizer#OptInRequiredException"
    | `ServiceUnavailableException _ -> "com.amazonaws.computeoptimizer#ServiceUnavailableException"
    | `ThrottlingException _ -> "com.amazonaws.computeoptimizer#ThrottlingException"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "AccessDeniedException" ->
          `AccessDeniedException (Json_deserializers.access_denied_exception_of_yojson tree path)
      | _, "InternalServerException" ->
          `InternalServerException
            (Json_deserializers.internal_server_exception_of_yojson tree path)
      | _, "InvalidParameterValueException" ->
          `InvalidParameterValueException
            (Json_deserializers.invalid_parameter_value_exception_of_yojson tree path)
      | _, "LimitExceededException" ->
          `LimitExceededException (Json_deserializers.limit_exceeded_exception_of_yojson tree path)
      | _, "MissingAuthenticationToken" ->
          `MissingAuthenticationToken
            (Json_deserializers.missing_authentication_token_of_yojson tree path)
      | _, "OptInRequiredException" ->
          `OptInRequiredException (Json_deserializers.opt_in_required_exception_of_yojson tree path)
      | _, "ServiceUnavailableException" ->
          `ServiceUnavailableException
            (Json_deserializers.service_unavailable_exception_of_yojson tree path)
      | _, "ThrottlingException" ->
          `ThrottlingException (Json_deserializers.throttling_exception_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : export_idle_recommendations_request) =
    let input = Json_serializers.export_idle_recommendations_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request
      ~shape_name:"ComputeOptimizerService.ExportIdleRecommendations" ~service ~context ~input
      ~output_deserializer:Json_deserializers.export_idle_recommendations_response_of_yojson
      ~error_deserializer

  let request_with_metadata context (request : export_idle_recommendations_request) =
    let input = Json_serializers.export_idle_recommendations_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata
      ~shape_name:"ComputeOptimizerService.ExportIdleRecommendations" ~service ~context ~input
      ~output_deserializer:Json_deserializers.export_idle_recommendations_response_of_yojson
      ~error_deserializer
end

module ExportLambdaFunctionRecommendations = struct
  let error_to_string = function
    | `AccessDeniedException _ -> "com.amazonaws.computeoptimizer#AccessDeniedException"
    | `InternalServerException _ -> "com.amazonaws.computeoptimizer#InternalServerException"
    | `InvalidParameterValueException _ ->
        "com.amazonaws.computeoptimizer#InvalidParameterValueException"
    | `LimitExceededException _ -> "com.amazonaws.computeoptimizer#LimitExceededException"
    | `MissingAuthenticationToken _ -> "com.amazonaws.computeoptimizer#MissingAuthenticationToken"
    | `OptInRequiredException _ -> "com.amazonaws.computeoptimizer#OptInRequiredException"
    | `ServiceUnavailableException _ -> "com.amazonaws.computeoptimizer#ServiceUnavailableException"
    | `ThrottlingException _ -> "com.amazonaws.computeoptimizer#ThrottlingException"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "AccessDeniedException" ->
          `AccessDeniedException (Json_deserializers.access_denied_exception_of_yojson tree path)
      | _, "InternalServerException" ->
          `InternalServerException
            (Json_deserializers.internal_server_exception_of_yojson tree path)
      | _, "InvalidParameterValueException" ->
          `InvalidParameterValueException
            (Json_deserializers.invalid_parameter_value_exception_of_yojson tree path)
      | _, "LimitExceededException" ->
          `LimitExceededException (Json_deserializers.limit_exceeded_exception_of_yojson tree path)
      | _, "MissingAuthenticationToken" ->
          `MissingAuthenticationToken
            (Json_deserializers.missing_authentication_token_of_yojson tree path)
      | _, "OptInRequiredException" ->
          `OptInRequiredException (Json_deserializers.opt_in_required_exception_of_yojson tree path)
      | _, "ServiceUnavailableException" ->
          `ServiceUnavailableException
            (Json_deserializers.service_unavailable_exception_of_yojson tree path)
      | _, "ThrottlingException" ->
          `ThrottlingException (Json_deserializers.throttling_exception_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : export_lambda_function_recommendations_request) =
    let input = Json_serializers.export_lambda_function_recommendations_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request
      ~shape_name:"ComputeOptimizerService.ExportLambdaFunctionRecommendations" ~service ~context
      ~input
      ~output_deserializer:
        Json_deserializers.export_lambda_function_recommendations_response_of_yojson
      ~error_deserializer

  let request_with_metadata context (request : export_lambda_function_recommendations_request) =
    let input = Json_serializers.export_lambda_function_recommendations_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata
      ~shape_name:"ComputeOptimizerService.ExportLambdaFunctionRecommendations" ~service ~context
      ~input
      ~output_deserializer:
        Json_deserializers.export_lambda_function_recommendations_response_of_yojson
      ~error_deserializer
end

module ExportLicenseRecommendations = struct
  let error_to_string = function
    | `AccessDeniedException _ -> "com.amazonaws.computeoptimizer#AccessDeniedException"
    | `InternalServerException _ -> "com.amazonaws.computeoptimizer#InternalServerException"
    | `InvalidParameterValueException _ ->
        "com.amazonaws.computeoptimizer#InvalidParameterValueException"
    | `LimitExceededException _ -> "com.amazonaws.computeoptimizer#LimitExceededException"
    | `MissingAuthenticationToken _ -> "com.amazonaws.computeoptimizer#MissingAuthenticationToken"
    | `OptInRequiredException _ -> "com.amazonaws.computeoptimizer#OptInRequiredException"
    | `ServiceUnavailableException _ -> "com.amazonaws.computeoptimizer#ServiceUnavailableException"
    | `ThrottlingException _ -> "com.amazonaws.computeoptimizer#ThrottlingException"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "AccessDeniedException" ->
          `AccessDeniedException (Json_deserializers.access_denied_exception_of_yojson tree path)
      | _, "InternalServerException" ->
          `InternalServerException
            (Json_deserializers.internal_server_exception_of_yojson tree path)
      | _, "InvalidParameterValueException" ->
          `InvalidParameterValueException
            (Json_deserializers.invalid_parameter_value_exception_of_yojson tree path)
      | _, "LimitExceededException" ->
          `LimitExceededException (Json_deserializers.limit_exceeded_exception_of_yojson tree path)
      | _, "MissingAuthenticationToken" ->
          `MissingAuthenticationToken
            (Json_deserializers.missing_authentication_token_of_yojson tree path)
      | _, "OptInRequiredException" ->
          `OptInRequiredException (Json_deserializers.opt_in_required_exception_of_yojson tree path)
      | _, "ServiceUnavailableException" ->
          `ServiceUnavailableException
            (Json_deserializers.service_unavailable_exception_of_yojson tree path)
      | _, "ThrottlingException" ->
          `ThrottlingException (Json_deserializers.throttling_exception_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : export_license_recommendations_request) =
    let input = Json_serializers.export_license_recommendations_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request
      ~shape_name:"ComputeOptimizerService.ExportLicenseRecommendations" ~service ~context ~input
      ~output_deserializer:Json_deserializers.export_license_recommendations_response_of_yojson
      ~error_deserializer

  let request_with_metadata context (request : export_license_recommendations_request) =
    let input = Json_serializers.export_license_recommendations_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata
      ~shape_name:"ComputeOptimizerService.ExportLicenseRecommendations" ~service ~context ~input
      ~output_deserializer:Json_deserializers.export_license_recommendations_response_of_yojson
      ~error_deserializer
end

module ExportRDSDatabaseRecommendations = struct
  let error_to_string = function
    | `AccessDeniedException _ -> "com.amazonaws.computeoptimizer#AccessDeniedException"
    | `InternalServerException _ -> "com.amazonaws.computeoptimizer#InternalServerException"
    | `InvalidParameterValueException _ ->
        "com.amazonaws.computeoptimizer#InvalidParameterValueException"
    | `LimitExceededException _ -> "com.amazonaws.computeoptimizer#LimitExceededException"
    | `MissingAuthenticationToken _ -> "com.amazonaws.computeoptimizer#MissingAuthenticationToken"
    | `OptInRequiredException _ -> "com.amazonaws.computeoptimizer#OptInRequiredException"
    | `ServiceUnavailableException _ -> "com.amazonaws.computeoptimizer#ServiceUnavailableException"
    | `ThrottlingException _ -> "com.amazonaws.computeoptimizer#ThrottlingException"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "AccessDeniedException" ->
          `AccessDeniedException (Json_deserializers.access_denied_exception_of_yojson tree path)
      | _, "InternalServerException" ->
          `InternalServerException
            (Json_deserializers.internal_server_exception_of_yojson tree path)
      | _, "InvalidParameterValueException" ->
          `InvalidParameterValueException
            (Json_deserializers.invalid_parameter_value_exception_of_yojson tree path)
      | _, "LimitExceededException" ->
          `LimitExceededException (Json_deserializers.limit_exceeded_exception_of_yojson tree path)
      | _, "MissingAuthenticationToken" ->
          `MissingAuthenticationToken
            (Json_deserializers.missing_authentication_token_of_yojson tree path)
      | _, "OptInRequiredException" ->
          `OptInRequiredException (Json_deserializers.opt_in_required_exception_of_yojson tree path)
      | _, "ServiceUnavailableException" ->
          `ServiceUnavailableException
            (Json_deserializers.service_unavailable_exception_of_yojson tree path)
      | _, "ThrottlingException" ->
          `ThrottlingException (Json_deserializers.throttling_exception_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : export_rds_database_recommendations_request) =
    let input = Json_serializers.export_rds_database_recommendations_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request
      ~shape_name:"ComputeOptimizerService.ExportRDSDatabaseRecommendations" ~service ~context
      ~input
      ~output_deserializer:Json_deserializers.export_rds_database_recommendations_response_of_yojson
      ~error_deserializer

  let request_with_metadata context (request : export_rds_database_recommendations_request) =
    let input = Json_serializers.export_rds_database_recommendations_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata
      ~shape_name:"ComputeOptimizerService.ExportRDSDatabaseRecommendations" ~service ~context
      ~input
      ~output_deserializer:Json_deserializers.export_rds_database_recommendations_response_of_yojson
      ~error_deserializer
end

module GetAutoScalingGroupRecommendations = struct
  let error_to_string = function
    | `AccessDeniedException _ -> "com.amazonaws.computeoptimizer#AccessDeniedException"
    | `InternalServerException _ -> "com.amazonaws.computeoptimizer#InternalServerException"
    | `InvalidParameterValueException _ ->
        "com.amazonaws.computeoptimizer#InvalidParameterValueException"
    | `MissingAuthenticationToken _ -> "com.amazonaws.computeoptimizer#MissingAuthenticationToken"
    | `OptInRequiredException _ -> "com.amazonaws.computeoptimizer#OptInRequiredException"
    | `ResourceNotFoundException _ -> "com.amazonaws.computeoptimizer#ResourceNotFoundException"
    | `ServiceUnavailableException _ -> "com.amazonaws.computeoptimizer#ServiceUnavailableException"
    | `ThrottlingException _ -> "com.amazonaws.computeoptimizer#ThrottlingException"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "AccessDeniedException" ->
          `AccessDeniedException (Json_deserializers.access_denied_exception_of_yojson tree path)
      | _, "InternalServerException" ->
          `InternalServerException
            (Json_deserializers.internal_server_exception_of_yojson tree path)
      | _, "InvalidParameterValueException" ->
          `InvalidParameterValueException
            (Json_deserializers.invalid_parameter_value_exception_of_yojson tree path)
      | _, "MissingAuthenticationToken" ->
          `MissingAuthenticationToken
            (Json_deserializers.missing_authentication_token_of_yojson tree path)
      | _, "OptInRequiredException" ->
          `OptInRequiredException (Json_deserializers.opt_in_required_exception_of_yojson tree path)
      | _, "ResourceNotFoundException" ->
          `ResourceNotFoundException
            (Json_deserializers.resource_not_found_exception_of_yojson tree path)
      | _, "ServiceUnavailableException" ->
          `ServiceUnavailableException
            (Json_deserializers.service_unavailable_exception_of_yojson tree path)
      | _, "ThrottlingException" ->
          `ThrottlingException (Json_deserializers.throttling_exception_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : get_auto_scaling_group_recommendations_request) =
    let input = Json_serializers.get_auto_scaling_group_recommendations_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request
      ~shape_name:"ComputeOptimizerService.GetAutoScalingGroupRecommendations" ~service ~context
      ~input
      ~output_deserializer:
        Json_deserializers.get_auto_scaling_group_recommendations_response_of_yojson
      ~error_deserializer

  let request_with_metadata context (request : get_auto_scaling_group_recommendations_request) =
    let input = Json_serializers.get_auto_scaling_group_recommendations_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata
      ~shape_name:"ComputeOptimizerService.GetAutoScalingGroupRecommendations" ~service ~context
      ~input
      ~output_deserializer:
        Json_deserializers.get_auto_scaling_group_recommendations_response_of_yojson
      ~error_deserializer
end

module GetEBSVolumeRecommendations = struct
  let error_to_string = function
    | `AccessDeniedException _ -> "com.amazonaws.computeoptimizer#AccessDeniedException"
    | `InternalServerException _ -> "com.amazonaws.computeoptimizer#InternalServerException"
    | `InvalidParameterValueException _ ->
        "com.amazonaws.computeoptimizer#InvalidParameterValueException"
    | `MissingAuthenticationToken _ -> "com.amazonaws.computeoptimizer#MissingAuthenticationToken"
    | `OptInRequiredException _ -> "com.amazonaws.computeoptimizer#OptInRequiredException"
    | `ResourceNotFoundException _ -> "com.amazonaws.computeoptimizer#ResourceNotFoundException"
    | `ServiceUnavailableException _ -> "com.amazonaws.computeoptimizer#ServiceUnavailableException"
    | `ThrottlingException _ -> "com.amazonaws.computeoptimizer#ThrottlingException"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "AccessDeniedException" ->
          `AccessDeniedException (Json_deserializers.access_denied_exception_of_yojson tree path)
      | _, "InternalServerException" ->
          `InternalServerException
            (Json_deserializers.internal_server_exception_of_yojson tree path)
      | _, "InvalidParameterValueException" ->
          `InvalidParameterValueException
            (Json_deserializers.invalid_parameter_value_exception_of_yojson tree path)
      | _, "MissingAuthenticationToken" ->
          `MissingAuthenticationToken
            (Json_deserializers.missing_authentication_token_of_yojson tree path)
      | _, "OptInRequiredException" ->
          `OptInRequiredException (Json_deserializers.opt_in_required_exception_of_yojson tree path)
      | _, "ResourceNotFoundException" ->
          `ResourceNotFoundException
            (Json_deserializers.resource_not_found_exception_of_yojson tree path)
      | _, "ServiceUnavailableException" ->
          `ServiceUnavailableException
            (Json_deserializers.service_unavailable_exception_of_yojson tree path)
      | _, "ThrottlingException" ->
          `ThrottlingException (Json_deserializers.throttling_exception_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : get_ebs_volume_recommendations_request) =
    let input = Json_serializers.get_ebs_volume_recommendations_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request
      ~shape_name:"ComputeOptimizerService.GetEBSVolumeRecommendations" ~service ~context ~input
      ~output_deserializer:Json_deserializers.get_ebs_volume_recommendations_response_of_yojson
      ~error_deserializer

  let request_with_metadata context (request : get_ebs_volume_recommendations_request) =
    let input = Json_serializers.get_ebs_volume_recommendations_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata
      ~shape_name:"ComputeOptimizerService.GetEBSVolumeRecommendations" ~service ~context ~input
      ~output_deserializer:Json_deserializers.get_ebs_volume_recommendations_response_of_yojson
      ~error_deserializer
end

module GetEC2InstanceRecommendations = struct
  let error_to_string = function
    | `AccessDeniedException _ -> "com.amazonaws.computeoptimizer#AccessDeniedException"
    | `InternalServerException _ -> "com.amazonaws.computeoptimizer#InternalServerException"
    | `InvalidParameterValueException _ ->
        "com.amazonaws.computeoptimizer#InvalidParameterValueException"
    | `MissingAuthenticationToken _ -> "com.amazonaws.computeoptimizer#MissingAuthenticationToken"
    | `OptInRequiredException _ -> "com.amazonaws.computeoptimizer#OptInRequiredException"
    | `ResourceNotFoundException _ -> "com.amazonaws.computeoptimizer#ResourceNotFoundException"
    | `ServiceUnavailableException _ -> "com.amazonaws.computeoptimizer#ServiceUnavailableException"
    | `ThrottlingException _ -> "com.amazonaws.computeoptimizer#ThrottlingException"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "AccessDeniedException" ->
          `AccessDeniedException (Json_deserializers.access_denied_exception_of_yojson tree path)
      | _, "InternalServerException" ->
          `InternalServerException
            (Json_deserializers.internal_server_exception_of_yojson tree path)
      | _, "InvalidParameterValueException" ->
          `InvalidParameterValueException
            (Json_deserializers.invalid_parameter_value_exception_of_yojson tree path)
      | _, "MissingAuthenticationToken" ->
          `MissingAuthenticationToken
            (Json_deserializers.missing_authentication_token_of_yojson tree path)
      | _, "OptInRequiredException" ->
          `OptInRequiredException (Json_deserializers.opt_in_required_exception_of_yojson tree path)
      | _, "ResourceNotFoundException" ->
          `ResourceNotFoundException
            (Json_deserializers.resource_not_found_exception_of_yojson tree path)
      | _, "ServiceUnavailableException" ->
          `ServiceUnavailableException
            (Json_deserializers.service_unavailable_exception_of_yojson tree path)
      | _, "ThrottlingException" ->
          `ThrottlingException (Json_deserializers.throttling_exception_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : get_ec2_instance_recommendations_request) =
    let input = Json_serializers.get_ec2_instance_recommendations_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request
      ~shape_name:"ComputeOptimizerService.GetEC2InstanceRecommendations" ~service ~context ~input
      ~output_deserializer:Json_deserializers.get_ec2_instance_recommendations_response_of_yojson
      ~error_deserializer

  let request_with_metadata context (request : get_ec2_instance_recommendations_request) =
    let input = Json_serializers.get_ec2_instance_recommendations_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata
      ~shape_name:"ComputeOptimizerService.GetEC2InstanceRecommendations" ~service ~context ~input
      ~output_deserializer:Json_deserializers.get_ec2_instance_recommendations_response_of_yojson
      ~error_deserializer
end

module GetEC2RecommendationProjectedMetrics = struct
  let error_to_string = function
    | `AccessDeniedException _ -> "com.amazonaws.computeoptimizer#AccessDeniedException"
    | `InternalServerException _ -> "com.amazonaws.computeoptimizer#InternalServerException"
    | `InvalidParameterValueException _ ->
        "com.amazonaws.computeoptimizer#InvalidParameterValueException"
    | `MissingAuthenticationToken _ -> "com.amazonaws.computeoptimizer#MissingAuthenticationToken"
    | `OptInRequiredException _ -> "com.amazonaws.computeoptimizer#OptInRequiredException"
    | `ResourceNotFoundException _ -> "com.amazonaws.computeoptimizer#ResourceNotFoundException"
    | `ServiceUnavailableException _ -> "com.amazonaws.computeoptimizer#ServiceUnavailableException"
    | `ThrottlingException _ -> "com.amazonaws.computeoptimizer#ThrottlingException"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "AccessDeniedException" ->
          `AccessDeniedException (Json_deserializers.access_denied_exception_of_yojson tree path)
      | _, "InternalServerException" ->
          `InternalServerException
            (Json_deserializers.internal_server_exception_of_yojson tree path)
      | _, "InvalidParameterValueException" ->
          `InvalidParameterValueException
            (Json_deserializers.invalid_parameter_value_exception_of_yojson tree path)
      | _, "MissingAuthenticationToken" ->
          `MissingAuthenticationToken
            (Json_deserializers.missing_authentication_token_of_yojson tree path)
      | _, "OptInRequiredException" ->
          `OptInRequiredException (Json_deserializers.opt_in_required_exception_of_yojson tree path)
      | _, "ResourceNotFoundException" ->
          `ResourceNotFoundException
            (Json_deserializers.resource_not_found_exception_of_yojson tree path)
      | _, "ServiceUnavailableException" ->
          `ServiceUnavailableException
            (Json_deserializers.service_unavailable_exception_of_yojson tree path)
      | _, "ThrottlingException" ->
          `ThrottlingException (Json_deserializers.throttling_exception_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : get_ec2_recommendation_projected_metrics_request) =
    let input =
      Json_serializers.get_ec2_recommendation_projected_metrics_request_to_yojson request
    in
    Smaws_Lib.Protocols.AwsJson.request
      ~shape_name:"ComputeOptimizerService.GetEC2RecommendationProjectedMetrics" ~service ~context
      ~input
      ~output_deserializer:
        Json_deserializers.get_ec2_recommendation_projected_metrics_response_of_yojson
      ~error_deserializer

  let request_with_metadata context (request : get_ec2_recommendation_projected_metrics_request) =
    let input =
      Json_serializers.get_ec2_recommendation_projected_metrics_request_to_yojson request
    in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata
      ~shape_name:"ComputeOptimizerService.GetEC2RecommendationProjectedMetrics" ~service ~context
      ~input
      ~output_deserializer:
        Json_deserializers.get_ec2_recommendation_projected_metrics_response_of_yojson
      ~error_deserializer
end

module GetECSServiceRecommendationProjectedMetrics = struct
  let error_to_string = function
    | `AccessDeniedException _ -> "com.amazonaws.computeoptimizer#AccessDeniedException"
    | `InternalServerException _ -> "com.amazonaws.computeoptimizer#InternalServerException"
    | `InvalidParameterValueException _ ->
        "com.amazonaws.computeoptimizer#InvalidParameterValueException"
    | `MissingAuthenticationToken _ -> "com.amazonaws.computeoptimizer#MissingAuthenticationToken"
    | `OptInRequiredException _ -> "com.amazonaws.computeoptimizer#OptInRequiredException"
    | `ResourceNotFoundException _ -> "com.amazonaws.computeoptimizer#ResourceNotFoundException"
    | `ServiceUnavailableException _ -> "com.amazonaws.computeoptimizer#ServiceUnavailableException"
    | `ThrottlingException _ -> "com.amazonaws.computeoptimizer#ThrottlingException"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "AccessDeniedException" ->
          `AccessDeniedException (Json_deserializers.access_denied_exception_of_yojson tree path)
      | _, "InternalServerException" ->
          `InternalServerException
            (Json_deserializers.internal_server_exception_of_yojson tree path)
      | _, "InvalidParameterValueException" ->
          `InvalidParameterValueException
            (Json_deserializers.invalid_parameter_value_exception_of_yojson tree path)
      | _, "MissingAuthenticationToken" ->
          `MissingAuthenticationToken
            (Json_deserializers.missing_authentication_token_of_yojson tree path)
      | _, "OptInRequiredException" ->
          `OptInRequiredException (Json_deserializers.opt_in_required_exception_of_yojson tree path)
      | _, "ResourceNotFoundException" ->
          `ResourceNotFoundException
            (Json_deserializers.resource_not_found_exception_of_yojson tree path)
      | _, "ServiceUnavailableException" ->
          `ServiceUnavailableException
            (Json_deserializers.service_unavailable_exception_of_yojson tree path)
      | _, "ThrottlingException" ->
          `ThrottlingException (Json_deserializers.throttling_exception_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : get_ecs_service_recommendation_projected_metrics_request) =
    let input =
      Json_serializers.get_ecs_service_recommendation_projected_metrics_request_to_yojson request
    in
    Smaws_Lib.Protocols.AwsJson.request
      ~shape_name:"ComputeOptimizerService.GetECSServiceRecommendationProjectedMetrics" ~service
      ~context ~input
      ~output_deserializer:
        Json_deserializers.get_ecs_service_recommendation_projected_metrics_response_of_yojson
      ~error_deserializer

  let request_with_metadata context
      (request : get_ecs_service_recommendation_projected_metrics_request) =
    let input =
      Json_serializers.get_ecs_service_recommendation_projected_metrics_request_to_yojson request
    in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata
      ~shape_name:"ComputeOptimizerService.GetECSServiceRecommendationProjectedMetrics" ~service
      ~context ~input
      ~output_deserializer:
        Json_deserializers.get_ecs_service_recommendation_projected_metrics_response_of_yojson
      ~error_deserializer
end

module GetECSServiceRecommendations = struct
  let error_to_string = function
    | `AccessDeniedException _ -> "com.amazonaws.computeoptimizer#AccessDeniedException"
    | `InternalServerException _ -> "com.amazonaws.computeoptimizer#InternalServerException"
    | `InvalidParameterValueException _ ->
        "com.amazonaws.computeoptimizer#InvalidParameterValueException"
    | `MissingAuthenticationToken _ -> "com.amazonaws.computeoptimizer#MissingAuthenticationToken"
    | `OptInRequiredException _ -> "com.amazonaws.computeoptimizer#OptInRequiredException"
    | `ResourceNotFoundException _ -> "com.amazonaws.computeoptimizer#ResourceNotFoundException"
    | `ServiceUnavailableException _ -> "com.amazonaws.computeoptimizer#ServiceUnavailableException"
    | `ThrottlingException _ -> "com.amazonaws.computeoptimizer#ThrottlingException"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "AccessDeniedException" ->
          `AccessDeniedException (Json_deserializers.access_denied_exception_of_yojson tree path)
      | _, "InternalServerException" ->
          `InternalServerException
            (Json_deserializers.internal_server_exception_of_yojson tree path)
      | _, "InvalidParameterValueException" ->
          `InvalidParameterValueException
            (Json_deserializers.invalid_parameter_value_exception_of_yojson tree path)
      | _, "MissingAuthenticationToken" ->
          `MissingAuthenticationToken
            (Json_deserializers.missing_authentication_token_of_yojson tree path)
      | _, "OptInRequiredException" ->
          `OptInRequiredException (Json_deserializers.opt_in_required_exception_of_yojson tree path)
      | _, "ResourceNotFoundException" ->
          `ResourceNotFoundException
            (Json_deserializers.resource_not_found_exception_of_yojson tree path)
      | _, "ServiceUnavailableException" ->
          `ServiceUnavailableException
            (Json_deserializers.service_unavailable_exception_of_yojson tree path)
      | _, "ThrottlingException" ->
          `ThrottlingException (Json_deserializers.throttling_exception_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : get_ecs_service_recommendations_request) =
    let input = Json_serializers.get_ecs_service_recommendations_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request
      ~shape_name:"ComputeOptimizerService.GetECSServiceRecommendations" ~service ~context ~input
      ~output_deserializer:Json_deserializers.get_ecs_service_recommendations_response_of_yojson
      ~error_deserializer

  let request_with_metadata context (request : get_ecs_service_recommendations_request) =
    let input = Json_serializers.get_ecs_service_recommendations_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata
      ~shape_name:"ComputeOptimizerService.GetECSServiceRecommendations" ~service ~context ~input
      ~output_deserializer:Json_deserializers.get_ecs_service_recommendations_response_of_yojson
      ~error_deserializer
end

module GetEffectiveRecommendationPreferences = struct
  let error_to_string = function
    | `AccessDeniedException _ -> "com.amazonaws.computeoptimizer#AccessDeniedException"
    | `InternalServerException _ -> "com.amazonaws.computeoptimizer#InternalServerException"
    | `InvalidParameterValueException _ ->
        "com.amazonaws.computeoptimizer#InvalidParameterValueException"
    | `MissingAuthenticationToken _ -> "com.amazonaws.computeoptimizer#MissingAuthenticationToken"
    | `OptInRequiredException _ -> "com.amazonaws.computeoptimizer#OptInRequiredException"
    | `ResourceNotFoundException _ -> "com.amazonaws.computeoptimizer#ResourceNotFoundException"
    | `ServiceUnavailableException _ -> "com.amazonaws.computeoptimizer#ServiceUnavailableException"
    | `ThrottlingException _ -> "com.amazonaws.computeoptimizer#ThrottlingException"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "AccessDeniedException" ->
          `AccessDeniedException (Json_deserializers.access_denied_exception_of_yojson tree path)
      | _, "InternalServerException" ->
          `InternalServerException
            (Json_deserializers.internal_server_exception_of_yojson tree path)
      | _, "InvalidParameterValueException" ->
          `InvalidParameterValueException
            (Json_deserializers.invalid_parameter_value_exception_of_yojson tree path)
      | _, "MissingAuthenticationToken" ->
          `MissingAuthenticationToken
            (Json_deserializers.missing_authentication_token_of_yojson tree path)
      | _, "OptInRequiredException" ->
          `OptInRequiredException (Json_deserializers.opt_in_required_exception_of_yojson tree path)
      | _, "ResourceNotFoundException" ->
          `ResourceNotFoundException
            (Json_deserializers.resource_not_found_exception_of_yojson tree path)
      | _, "ServiceUnavailableException" ->
          `ServiceUnavailableException
            (Json_deserializers.service_unavailable_exception_of_yojson tree path)
      | _, "ThrottlingException" ->
          `ThrottlingException (Json_deserializers.throttling_exception_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : get_effective_recommendation_preferences_request) =
    let input =
      Json_serializers.get_effective_recommendation_preferences_request_to_yojson request
    in
    Smaws_Lib.Protocols.AwsJson.request
      ~shape_name:"ComputeOptimizerService.GetEffectiveRecommendationPreferences" ~service ~context
      ~input
      ~output_deserializer:
        Json_deserializers.get_effective_recommendation_preferences_response_of_yojson
      ~error_deserializer

  let request_with_metadata context (request : get_effective_recommendation_preferences_request) =
    let input =
      Json_serializers.get_effective_recommendation_preferences_request_to_yojson request
    in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata
      ~shape_name:"ComputeOptimizerService.GetEffectiveRecommendationPreferences" ~service ~context
      ~input
      ~output_deserializer:
        Json_deserializers.get_effective_recommendation_preferences_response_of_yojson
      ~error_deserializer
end

module GetEnrollmentStatus = struct
  let error_to_string = function
    | `AccessDeniedException _ -> "com.amazonaws.computeoptimizer#AccessDeniedException"
    | `InternalServerException _ -> "com.amazonaws.computeoptimizer#InternalServerException"
    | `InvalidParameterValueException _ ->
        "com.amazonaws.computeoptimizer#InvalidParameterValueException"
    | `MissingAuthenticationToken _ -> "com.amazonaws.computeoptimizer#MissingAuthenticationToken"
    | `ServiceUnavailableException _ -> "com.amazonaws.computeoptimizer#ServiceUnavailableException"
    | `ThrottlingException _ -> "com.amazonaws.computeoptimizer#ThrottlingException"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "AccessDeniedException" ->
          `AccessDeniedException (Json_deserializers.access_denied_exception_of_yojson tree path)
      | _, "InternalServerException" ->
          `InternalServerException
            (Json_deserializers.internal_server_exception_of_yojson tree path)
      | _, "InvalidParameterValueException" ->
          `InvalidParameterValueException
            (Json_deserializers.invalid_parameter_value_exception_of_yojson tree path)
      | _, "MissingAuthenticationToken" ->
          `MissingAuthenticationToken
            (Json_deserializers.missing_authentication_token_of_yojson tree path)
      | _, "ServiceUnavailableException" ->
          `ServiceUnavailableException
            (Json_deserializers.service_unavailable_exception_of_yojson tree path)
      | _, "ThrottlingException" ->
          `ThrottlingException (Json_deserializers.throttling_exception_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : get_enrollment_status_request) =
    let input = Json_serializers.get_enrollment_status_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"ComputeOptimizerService.GetEnrollmentStatus"
      ~service ~context ~input
      ~output_deserializer:Json_deserializers.get_enrollment_status_response_of_yojson
      ~error_deserializer

  let request_with_metadata context (request : get_enrollment_status_request) =
    let input = Json_serializers.get_enrollment_status_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata
      ~shape_name:"ComputeOptimizerService.GetEnrollmentStatus" ~service ~context ~input
      ~output_deserializer:Json_deserializers.get_enrollment_status_response_of_yojson
      ~error_deserializer
end

module GetEnrollmentStatusesForOrganization = struct
  let error_to_string = function
    | `AccessDeniedException _ -> "com.amazonaws.computeoptimizer#AccessDeniedException"
    | `InternalServerException _ -> "com.amazonaws.computeoptimizer#InternalServerException"
    | `InvalidParameterValueException _ ->
        "com.amazonaws.computeoptimizer#InvalidParameterValueException"
    | `MissingAuthenticationToken _ -> "com.amazonaws.computeoptimizer#MissingAuthenticationToken"
    | `ServiceUnavailableException _ -> "com.amazonaws.computeoptimizer#ServiceUnavailableException"
    | `ThrottlingException _ -> "com.amazonaws.computeoptimizer#ThrottlingException"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "AccessDeniedException" ->
          `AccessDeniedException (Json_deserializers.access_denied_exception_of_yojson tree path)
      | _, "InternalServerException" ->
          `InternalServerException
            (Json_deserializers.internal_server_exception_of_yojson tree path)
      | _, "InvalidParameterValueException" ->
          `InvalidParameterValueException
            (Json_deserializers.invalid_parameter_value_exception_of_yojson tree path)
      | _, "MissingAuthenticationToken" ->
          `MissingAuthenticationToken
            (Json_deserializers.missing_authentication_token_of_yojson tree path)
      | _, "ServiceUnavailableException" ->
          `ServiceUnavailableException
            (Json_deserializers.service_unavailable_exception_of_yojson tree path)
      | _, "ThrottlingException" ->
          `ThrottlingException (Json_deserializers.throttling_exception_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : get_enrollment_statuses_for_organization_request) =
    let input =
      Json_serializers.get_enrollment_statuses_for_organization_request_to_yojson request
    in
    Smaws_Lib.Protocols.AwsJson.request
      ~shape_name:"ComputeOptimizerService.GetEnrollmentStatusesForOrganization" ~service ~context
      ~input
      ~output_deserializer:
        Json_deserializers.get_enrollment_statuses_for_organization_response_of_yojson
      ~error_deserializer

  let request_with_metadata context (request : get_enrollment_statuses_for_organization_request) =
    let input =
      Json_serializers.get_enrollment_statuses_for_organization_request_to_yojson request
    in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata
      ~shape_name:"ComputeOptimizerService.GetEnrollmentStatusesForOrganization" ~service ~context
      ~input
      ~output_deserializer:
        Json_deserializers.get_enrollment_statuses_for_organization_response_of_yojson
      ~error_deserializer
end

module GetIdleRecommendations = struct
  let error_to_string = function
    | `AccessDeniedException _ -> "com.amazonaws.computeoptimizer#AccessDeniedException"
    | `InternalServerException _ -> "com.amazonaws.computeoptimizer#InternalServerException"
    | `InvalidParameterValueException _ ->
        "com.amazonaws.computeoptimizer#InvalidParameterValueException"
    | `MissingAuthenticationToken _ -> "com.amazonaws.computeoptimizer#MissingAuthenticationToken"
    | `OptInRequiredException _ -> "com.amazonaws.computeoptimizer#OptInRequiredException"
    | `ResourceNotFoundException _ -> "com.amazonaws.computeoptimizer#ResourceNotFoundException"
    | `ServiceUnavailableException _ -> "com.amazonaws.computeoptimizer#ServiceUnavailableException"
    | `ThrottlingException _ -> "com.amazonaws.computeoptimizer#ThrottlingException"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "AccessDeniedException" ->
          `AccessDeniedException (Json_deserializers.access_denied_exception_of_yojson tree path)
      | _, "InternalServerException" ->
          `InternalServerException
            (Json_deserializers.internal_server_exception_of_yojson tree path)
      | _, "InvalidParameterValueException" ->
          `InvalidParameterValueException
            (Json_deserializers.invalid_parameter_value_exception_of_yojson tree path)
      | _, "MissingAuthenticationToken" ->
          `MissingAuthenticationToken
            (Json_deserializers.missing_authentication_token_of_yojson tree path)
      | _, "OptInRequiredException" ->
          `OptInRequiredException (Json_deserializers.opt_in_required_exception_of_yojson tree path)
      | _, "ResourceNotFoundException" ->
          `ResourceNotFoundException
            (Json_deserializers.resource_not_found_exception_of_yojson tree path)
      | _, "ServiceUnavailableException" ->
          `ServiceUnavailableException
            (Json_deserializers.service_unavailable_exception_of_yojson tree path)
      | _, "ThrottlingException" ->
          `ThrottlingException (Json_deserializers.throttling_exception_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : get_idle_recommendations_request) =
    let input = Json_serializers.get_idle_recommendations_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"ComputeOptimizerService.GetIdleRecommendations"
      ~service ~context ~input
      ~output_deserializer:Json_deserializers.get_idle_recommendations_response_of_yojson
      ~error_deserializer

  let request_with_metadata context (request : get_idle_recommendations_request) =
    let input = Json_serializers.get_idle_recommendations_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata
      ~shape_name:"ComputeOptimizerService.GetIdleRecommendations" ~service ~context ~input
      ~output_deserializer:Json_deserializers.get_idle_recommendations_response_of_yojson
      ~error_deserializer
end

module GetLambdaFunctionRecommendations = struct
  let error_to_string = function
    | `AccessDeniedException _ -> "com.amazonaws.computeoptimizer#AccessDeniedException"
    | `InternalServerException _ -> "com.amazonaws.computeoptimizer#InternalServerException"
    | `InvalidParameterValueException _ ->
        "com.amazonaws.computeoptimizer#InvalidParameterValueException"
    | `LimitExceededException _ -> "com.amazonaws.computeoptimizer#LimitExceededException"
    | `MissingAuthenticationToken _ -> "com.amazonaws.computeoptimizer#MissingAuthenticationToken"
    | `OptInRequiredException _ -> "com.amazonaws.computeoptimizer#OptInRequiredException"
    | `ServiceUnavailableException _ -> "com.amazonaws.computeoptimizer#ServiceUnavailableException"
    | `ThrottlingException _ -> "com.amazonaws.computeoptimizer#ThrottlingException"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "AccessDeniedException" ->
          `AccessDeniedException (Json_deserializers.access_denied_exception_of_yojson tree path)
      | _, "InternalServerException" ->
          `InternalServerException
            (Json_deserializers.internal_server_exception_of_yojson tree path)
      | _, "InvalidParameterValueException" ->
          `InvalidParameterValueException
            (Json_deserializers.invalid_parameter_value_exception_of_yojson tree path)
      | _, "LimitExceededException" ->
          `LimitExceededException (Json_deserializers.limit_exceeded_exception_of_yojson tree path)
      | _, "MissingAuthenticationToken" ->
          `MissingAuthenticationToken
            (Json_deserializers.missing_authentication_token_of_yojson tree path)
      | _, "OptInRequiredException" ->
          `OptInRequiredException (Json_deserializers.opt_in_required_exception_of_yojson tree path)
      | _, "ServiceUnavailableException" ->
          `ServiceUnavailableException
            (Json_deserializers.service_unavailable_exception_of_yojson tree path)
      | _, "ThrottlingException" ->
          `ThrottlingException (Json_deserializers.throttling_exception_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : get_lambda_function_recommendations_request) =
    let input = Json_serializers.get_lambda_function_recommendations_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request
      ~shape_name:"ComputeOptimizerService.GetLambdaFunctionRecommendations" ~service ~context
      ~input
      ~output_deserializer:Json_deserializers.get_lambda_function_recommendations_response_of_yojson
      ~error_deserializer

  let request_with_metadata context (request : get_lambda_function_recommendations_request) =
    let input = Json_serializers.get_lambda_function_recommendations_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata
      ~shape_name:"ComputeOptimizerService.GetLambdaFunctionRecommendations" ~service ~context
      ~input
      ~output_deserializer:Json_deserializers.get_lambda_function_recommendations_response_of_yojson
      ~error_deserializer
end

module GetLicenseRecommendations = struct
  let error_to_string = function
    | `AccessDeniedException _ -> "com.amazonaws.computeoptimizer#AccessDeniedException"
    | `InternalServerException _ -> "com.amazonaws.computeoptimizer#InternalServerException"
    | `InvalidParameterValueException _ ->
        "com.amazonaws.computeoptimizer#InvalidParameterValueException"
    | `MissingAuthenticationToken _ -> "com.amazonaws.computeoptimizer#MissingAuthenticationToken"
    | `OptInRequiredException _ -> "com.amazonaws.computeoptimizer#OptInRequiredException"
    | `ResourceNotFoundException _ -> "com.amazonaws.computeoptimizer#ResourceNotFoundException"
    | `ServiceUnavailableException _ -> "com.amazonaws.computeoptimizer#ServiceUnavailableException"
    | `ThrottlingException _ -> "com.amazonaws.computeoptimizer#ThrottlingException"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "AccessDeniedException" ->
          `AccessDeniedException (Json_deserializers.access_denied_exception_of_yojson tree path)
      | _, "InternalServerException" ->
          `InternalServerException
            (Json_deserializers.internal_server_exception_of_yojson tree path)
      | _, "InvalidParameterValueException" ->
          `InvalidParameterValueException
            (Json_deserializers.invalid_parameter_value_exception_of_yojson tree path)
      | _, "MissingAuthenticationToken" ->
          `MissingAuthenticationToken
            (Json_deserializers.missing_authentication_token_of_yojson tree path)
      | _, "OptInRequiredException" ->
          `OptInRequiredException (Json_deserializers.opt_in_required_exception_of_yojson tree path)
      | _, "ResourceNotFoundException" ->
          `ResourceNotFoundException
            (Json_deserializers.resource_not_found_exception_of_yojson tree path)
      | _, "ServiceUnavailableException" ->
          `ServiceUnavailableException
            (Json_deserializers.service_unavailable_exception_of_yojson tree path)
      | _, "ThrottlingException" ->
          `ThrottlingException (Json_deserializers.throttling_exception_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : get_license_recommendations_request) =
    let input = Json_serializers.get_license_recommendations_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request
      ~shape_name:"ComputeOptimizerService.GetLicenseRecommendations" ~service ~context ~input
      ~output_deserializer:Json_deserializers.get_license_recommendations_response_of_yojson
      ~error_deserializer

  let request_with_metadata context (request : get_license_recommendations_request) =
    let input = Json_serializers.get_license_recommendations_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata
      ~shape_name:"ComputeOptimizerService.GetLicenseRecommendations" ~service ~context ~input
      ~output_deserializer:Json_deserializers.get_license_recommendations_response_of_yojson
      ~error_deserializer
end

module GetRDSDatabaseRecommendationProjectedMetrics = struct
  let error_to_string = function
    | `AccessDeniedException _ -> "com.amazonaws.computeoptimizer#AccessDeniedException"
    | `InternalServerException _ -> "com.amazonaws.computeoptimizer#InternalServerException"
    | `InvalidParameterValueException _ ->
        "com.amazonaws.computeoptimizer#InvalidParameterValueException"
    | `MissingAuthenticationToken _ -> "com.amazonaws.computeoptimizer#MissingAuthenticationToken"
    | `OptInRequiredException _ -> "com.amazonaws.computeoptimizer#OptInRequiredException"
    | `ResourceNotFoundException _ -> "com.amazonaws.computeoptimizer#ResourceNotFoundException"
    | `ServiceUnavailableException _ -> "com.amazonaws.computeoptimizer#ServiceUnavailableException"
    | `ThrottlingException _ -> "com.amazonaws.computeoptimizer#ThrottlingException"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "AccessDeniedException" ->
          `AccessDeniedException (Json_deserializers.access_denied_exception_of_yojson tree path)
      | _, "InternalServerException" ->
          `InternalServerException
            (Json_deserializers.internal_server_exception_of_yojson tree path)
      | _, "InvalidParameterValueException" ->
          `InvalidParameterValueException
            (Json_deserializers.invalid_parameter_value_exception_of_yojson tree path)
      | _, "MissingAuthenticationToken" ->
          `MissingAuthenticationToken
            (Json_deserializers.missing_authentication_token_of_yojson tree path)
      | _, "OptInRequiredException" ->
          `OptInRequiredException (Json_deserializers.opt_in_required_exception_of_yojson tree path)
      | _, "ResourceNotFoundException" ->
          `ResourceNotFoundException
            (Json_deserializers.resource_not_found_exception_of_yojson tree path)
      | _, "ServiceUnavailableException" ->
          `ServiceUnavailableException
            (Json_deserializers.service_unavailable_exception_of_yojson tree path)
      | _, "ThrottlingException" ->
          `ThrottlingException (Json_deserializers.throttling_exception_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : get_rds_database_recommendation_projected_metrics_request) =
    let input =
      Json_serializers.get_rds_database_recommendation_projected_metrics_request_to_yojson request
    in
    Smaws_Lib.Protocols.AwsJson.request
      ~shape_name:"ComputeOptimizerService.GetRDSDatabaseRecommendationProjectedMetrics" ~service
      ~context ~input
      ~output_deserializer:
        Json_deserializers.get_rds_database_recommendation_projected_metrics_response_of_yojson
      ~error_deserializer

  let request_with_metadata context
      (request : get_rds_database_recommendation_projected_metrics_request) =
    let input =
      Json_serializers.get_rds_database_recommendation_projected_metrics_request_to_yojson request
    in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata
      ~shape_name:"ComputeOptimizerService.GetRDSDatabaseRecommendationProjectedMetrics" ~service
      ~context ~input
      ~output_deserializer:
        Json_deserializers.get_rds_database_recommendation_projected_metrics_response_of_yojson
      ~error_deserializer
end

module GetRDSDatabaseRecommendations = struct
  let error_to_string = function
    | `AccessDeniedException _ -> "com.amazonaws.computeoptimizer#AccessDeniedException"
    | `InternalServerException _ -> "com.amazonaws.computeoptimizer#InternalServerException"
    | `InvalidParameterValueException _ ->
        "com.amazonaws.computeoptimizer#InvalidParameterValueException"
    | `MissingAuthenticationToken _ -> "com.amazonaws.computeoptimizer#MissingAuthenticationToken"
    | `OptInRequiredException _ -> "com.amazonaws.computeoptimizer#OptInRequiredException"
    | `ResourceNotFoundException _ -> "com.amazonaws.computeoptimizer#ResourceNotFoundException"
    | `ServiceUnavailableException _ -> "com.amazonaws.computeoptimizer#ServiceUnavailableException"
    | `ThrottlingException _ -> "com.amazonaws.computeoptimizer#ThrottlingException"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "AccessDeniedException" ->
          `AccessDeniedException (Json_deserializers.access_denied_exception_of_yojson tree path)
      | _, "InternalServerException" ->
          `InternalServerException
            (Json_deserializers.internal_server_exception_of_yojson tree path)
      | _, "InvalidParameterValueException" ->
          `InvalidParameterValueException
            (Json_deserializers.invalid_parameter_value_exception_of_yojson tree path)
      | _, "MissingAuthenticationToken" ->
          `MissingAuthenticationToken
            (Json_deserializers.missing_authentication_token_of_yojson tree path)
      | _, "OptInRequiredException" ->
          `OptInRequiredException (Json_deserializers.opt_in_required_exception_of_yojson tree path)
      | _, "ResourceNotFoundException" ->
          `ResourceNotFoundException
            (Json_deserializers.resource_not_found_exception_of_yojson tree path)
      | _, "ServiceUnavailableException" ->
          `ServiceUnavailableException
            (Json_deserializers.service_unavailable_exception_of_yojson tree path)
      | _, "ThrottlingException" ->
          `ThrottlingException (Json_deserializers.throttling_exception_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : get_rds_database_recommendations_request) =
    let input = Json_serializers.get_rds_database_recommendations_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request
      ~shape_name:"ComputeOptimizerService.GetRDSDatabaseRecommendations" ~service ~context ~input
      ~output_deserializer:Json_deserializers.get_rds_database_recommendations_response_of_yojson
      ~error_deserializer

  let request_with_metadata context (request : get_rds_database_recommendations_request) =
    let input = Json_serializers.get_rds_database_recommendations_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata
      ~shape_name:"ComputeOptimizerService.GetRDSDatabaseRecommendations" ~service ~context ~input
      ~output_deserializer:Json_deserializers.get_rds_database_recommendations_response_of_yojson
      ~error_deserializer
end

module GetRecommendationPreferences = struct
  let error_to_string = function
    | `AccessDeniedException _ -> "com.amazonaws.computeoptimizer#AccessDeniedException"
    | `InternalServerException _ -> "com.amazonaws.computeoptimizer#InternalServerException"
    | `InvalidParameterValueException _ ->
        "com.amazonaws.computeoptimizer#InvalidParameterValueException"
    | `MissingAuthenticationToken _ -> "com.amazonaws.computeoptimizer#MissingAuthenticationToken"
    | `OptInRequiredException _ -> "com.amazonaws.computeoptimizer#OptInRequiredException"
    | `ResourceNotFoundException _ -> "com.amazonaws.computeoptimizer#ResourceNotFoundException"
    | `ServiceUnavailableException _ -> "com.amazonaws.computeoptimizer#ServiceUnavailableException"
    | `ThrottlingException _ -> "com.amazonaws.computeoptimizer#ThrottlingException"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "AccessDeniedException" ->
          `AccessDeniedException (Json_deserializers.access_denied_exception_of_yojson tree path)
      | _, "InternalServerException" ->
          `InternalServerException
            (Json_deserializers.internal_server_exception_of_yojson tree path)
      | _, "InvalidParameterValueException" ->
          `InvalidParameterValueException
            (Json_deserializers.invalid_parameter_value_exception_of_yojson tree path)
      | _, "MissingAuthenticationToken" ->
          `MissingAuthenticationToken
            (Json_deserializers.missing_authentication_token_of_yojson tree path)
      | _, "OptInRequiredException" ->
          `OptInRequiredException (Json_deserializers.opt_in_required_exception_of_yojson tree path)
      | _, "ResourceNotFoundException" ->
          `ResourceNotFoundException
            (Json_deserializers.resource_not_found_exception_of_yojson tree path)
      | _, "ServiceUnavailableException" ->
          `ServiceUnavailableException
            (Json_deserializers.service_unavailable_exception_of_yojson tree path)
      | _, "ThrottlingException" ->
          `ThrottlingException (Json_deserializers.throttling_exception_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : get_recommendation_preferences_request) =
    let input = Json_serializers.get_recommendation_preferences_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request
      ~shape_name:"ComputeOptimizerService.GetRecommendationPreferences" ~service ~context ~input
      ~output_deserializer:Json_deserializers.get_recommendation_preferences_response_of_yojson
      ~error_deserializer

  let request_with_metadata context (request : get_recommendation_preferences_request) =
    let input = Json_serializers.get_recommendation_preferences_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata
      ~shape_name:"ComputeOptimizerService.GetRecommendationPreferences" ~service ~context ~input
      ~output_deserializer:Json_deserializers.get_recommendation_preferences_response_of_yojson
      ~error_deserializer
end

module GetRecommendationSummaries = struct
  let error_to_string = function
    | `AccessDeniedException _ -> "com.amazonaws.computeoptimizer#AccessDeniedException"
    | `InternalServerException _ -> "com.amazonaws.computeoptimizer#InternalServerException"
    | `InvalidParameterValueException _ ->
        "com.amazonaws.computeoptimizer#InvalidParameterValueException"
    | `MissingAuthenticationToken _ -> "com.amazonaws.computeoptimizer#MissingAuthenticationToken"
    | `OptInRequiredException _ -> "com.amazonaws.computeoptimizer#OptInRequiredException"
    | `ServiceUnavailableException _ -> "com.amazonaws.computeoptimizer#ServiceUnavailableException"
    | `ThrottlingException _ -> "com.amazonaws.computeoptimizer#ThrottlingException"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "AccessDeniedException" ->
          `AccessDeniedException (Json_deserializers.access_denied_exception_of_yojson tree path)
      | _, "InternalServerException" ->
          `InternalServerException
            (Json_deserializers.internal_server_exception_of_yojson tree path)
      | _, "InvalidParameterValueException" ->
          `InvalidParameterValueException
            (Json_deserializers.invalid_parameter_value_exception_of_yojson tree path)
      | _, "MissingAuthenticationToken" ->
          `MissingAuthenticationToken
            (Json_deserializers.missing_authentication_token_of_yojson tree path)
      | _, "OptInRequiredException" ->
          `OptInRequiredException (Json_deserializers.opt_in_required_exception_of_yojson tree path)
      | _, "ServiceUnavailableException" ->
          `ServiceUnavailableException
            (Json_deserializers.service_unavailable_exception_of_yojson tree path)
      | _, "ThrottlingException" ->
          `ThrottlingException (Json_deserializers.throttling_exception_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : get_recommendation_summaries_request) =
    let input = Json_serializers.get_recommendation_summaries_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request
      ~shape_name:"ComputeOptimizerService.GetRecommendationSummaries" ~service ~context ~input
      ~output_deserializer:Json_deserializers.get_recommendation_summaries_response_of_yojson
      ~error_deserializer

  let request_with_metadata context (request : get_recommendation_summaries_request) =
    let input = Json_serializers.get_recommendation_summaries_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata
      ~shape_name:"ComputeOptimizerService.GetRecommendationSummaries" ~service ~context ~input
      ~output_deserializer:Json_deserializers.get_recommendation_summaries_response_of_yojson
      ~error_deserializer
end

module PutRecommendationPreferences = struct
  let error_to_string = function
    | `AccessDeniedException _ -> "com.amazonaws.computeoptimizer#AccessDeniedException"
    | `InternalServerException _ -> "com.amazonaws.computeoptimizer#InternalServerException"
    | `InvalidParameterValueException _ ->
        "com.amazonaws.computeoptimizer#InvalidParameterValueException"
    | `MissingAuthenticationToken _ -> "com.amazonaws.computeoptimizer#MissingAuthenticationToken"
    | `OptInRequiredException _ -> "com.amazonaws.computeoptimizer#OptInRequiredException"
    | `ResourceNotFoundException _ -> "com.amazonaws.computeoptimizer#ResourceNotFoundException"
    | `ServiceUnavailableException _ -> "com.amazonaws.computeoptimizer#ServiceUnavailableException"
    | `ThrottlingException _ -> "com.amazonaws.computeoptimizer#ThrottlingException"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "AccessDeniedException" ->
          `AccessDeniedException (Json_deserializers.access_denied_exception_of_yojson tree path)
      | _, "InternalServerException" ->
          `InternalServerException
            (Json_deserializers.internal_server_exception_of_yojson tree path)
      | _, "InvalidParameterValueException" ->
          `InvalidParameterValueException
            (Json_deserializers.invalid_parameter_value_exception_of_yojson tree path)
      | _, "MissingAuthenticationToken" ->
          `MissingAuthenticationToken
            (Json_deserializers.missing_authentication_token_of_yojson tree path)
      | _, "OptInRequiredException" ->
          `OptInRequiredException (Json_deserializers.opt_in_required_exception_of_yojson tree path)
      | _, "ResourceNotFoundException" ->
          `ResourceNotFoundException
            (Json_deserializers.resource_not_found_exception_of_yojson tree path)
      | _, "ServiceUnavailableException" ->
          `ServiceUnavailableException
            (Json_deserializers.service_unavailable_exception_of_yojson tree path)
      | _, "ThrottlingException" ->
          `ThrottlingException (Json_deserializers.throttling_exception_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : put_recommendation_preferences_request) =
    let input = Json_serializers.put_recommendation_preferences_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request
      ~shape_name:"ComputeOptimizerService.PutRecommendationPreferences" ~service ~context ~input
      ~output_deserializer:Json_deserializers.put_recommendation_preferences_response_of_yojson
      ~error_deserializer

  let request_with_metadata context (request : put_recommendation_preferences_request) =
    let input = Json_serializers.put_recommendation_preferences_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata
      ~shape_name:"ComputeOptimizerService.PutRecommendationPreferences" ~service ~context ~input
      ~output_deserializer:Json_deserializers.put_recommendation_preferences_response_of_yojson
      ~error_deserializer
end

module UpdateEnrollmentStatus = struct
  let error_to_string = function
    | `AccessDeniedException _ -> "com.amazonaws.computeoptimizer#AccessDeniedException"
    | `InternalServerException _ -> "com.amazonaws.computeoptimizer#InternalServerException"
    | `InvalidParameterValueException _ ->
        "com.amazonaws.computeoptimizer#InvalidParameterValueException"
    | `MissingAuthenticationToken _ -> "com.amazonaws.computeoptimizer#MissingAuthenticationToken"
    | `ServiceUnavailableException _ -> "com.amazonaws.computeoptimizer#ServiceUnavailableException"
    | `ThrottlingException _ -> "com.amazonaws.computeoptimizer#ThrottlingException"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "AccessDeniedException" ->
          `AccessDeniedException (Json_deserializers.access_denied_exception_of_yojson tree path)
      | _, "InternalServerException" ->
          `InternalServerException
            (Json_deserializers.internal_server_exception_of_yojson tree path)
      | _, "InvalidParameterValueException" ->
          `InvalidParameterValueException
            (Json_deserializers.invalid_parameter_value_exception_of_yojson tree path)
      | _, "MissingAuthenticationToken" ->
          `MissingAuthenticationToken
            (Json_deserializers.missing_authentication_token_of_yojson tree path)
      | _, "ServiceUnavailableException" ->
          `ServiceUnavailableException
            (Json_deserializers.service_unavailable_exception_of_yojson tree path)
      | _, "ThrottlingException" ->
          `ThrottlingException (Json_deserializers.throttling_exception_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : update_enrollment_status_request) =
    let input = Json_serializers.update_enrollment_status_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"ComputeOptimizerService.UpdateEnrollmentStatus"
      ~service ~context ~input
      ~output_deserializer:Json_deserializers.update_enrollment_status_response_of_yojson
      ~error_deserializer

  let request_with_metadata context (request : update_enrollment_status_request) =
    let input = Json_serializers.update_enrollment_status_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata
      ~shape_name:"ComputeOptimizerService.UpdateEnrollmentStatus" ~service ~context ~input
      ~output_deserializer:Json_deserializers.update_enrollment_status_response_of_yojson
      ~error_deserializer
end
