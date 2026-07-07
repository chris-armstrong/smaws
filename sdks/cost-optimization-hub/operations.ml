open Types
open Service_metadata

module GetPreferences = struct
  let error_to_string = function
    | `AccessDeniedException _ -> "com.amazonaws.costoptimizationhub#AccessDeniedException"
    | `InternalServerException _ -> "com.amazonaws.costoptimizationhub#InternalServerException"
    | `ThrottlingException _ -> "com.amazonaws.costoptimizationhub#ThrottlingException"
    | `ValidationException _ -> "com.amazonaws.costoptimizationhub#ValidationException"
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

  let request context (request : get_preferences_request) =
    let input = Json_serializers.get_preferences_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"CostOptimizationHubService.GetPreferences"
      ~service ~context ~input
      ~output_deserializer:Json_deserializers.get_preferences_response_of_yojson ~error_deserializer

  let request_with_metadata context (request : get_preferences_request) =
    let input = Json_serializers.get_preferences_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata
      ~shape_name:"CostOptimizationHubService.GetPreferences" ~service ~context ~input
      ~output_deserializer:Json_deserializers.get_preferences_response_of_yojson ~error_deserializer
end

module GetRecommendation = struct
  let error_to_string = function
    | `AccessDeniedException _ -> "com.amazonaws.costoptimizationhub#AccessDeniedException"
    | `InternalServerException _ -> "com.amazonaws.costoptimizationhub#InternalServerException"
    | `ResourceNotFoundException _ -> "com.amazonaws.costoptimizationhub#ResourceNotFoundException"
    | `ThrottlingException _ -> "com.amazonaws.costoptimizationhub#ThrottlingException"
    | `ValidationException _ -> "com.amazonaws.costoptimizationhub#ValidationException"
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

  let request context (request : get_recommendation_request) =
    let input = Json_serializers.get_recommendation_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"CostOptimizationHubService.GetRecommendation"
      ~service ~context ~input
      ~output_deserializer:Json_deserializers.get_recommendation_response_of_yojson
      ~error_deserializer

  let request_with_metadata context (request : get_recommendation_request) =
    let input = Json_serializers.get_recommendation_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata
      ~shape_name:"CostOptimizationHubService.GetRecommendation" ~service ~context ~input
      ~output_deserializer:Json_deserializers.get_recommendation_response_of_yojson
      ~error_deserializer
end

module ListEfficiencyMetrics = struct
  let error_to_string = function
    | `AccessDeniedException _ -> "com.amazonaws.costoptimizationhub#AccessDeniedException"
    | `InternalServerException _ -> "com.amazonaws.costoptimizationhub#InternalServerException"
    | `ThrottlingException _ -> "com.amazonaws.costoptimizationhub#ThrottlingException"
    | `ValidationException _ -> "com.amazonaws.costoptimizationhub#ValidationException"
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

  let request context (request : list_efficiency_metrics_request) =
    let input = Json_serializers.list_efficiency_metrics_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request
      ~shape_name:"CostOptimizationHubService.ListEfficiencyMetrics" ~service ~context ~input
      ~output_deserializer:Json_deserializers.list_efficiency_metrics_response_of_yojson
      ~error_deserializer

  let request_with_metadata context (request : list_efficiency_metrics_request) =
    let input = Json_serializers.list_efficiency_metrics_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata
      ~shape_name:"CostOptimizationHubService.ListEfficiencyMetrics" ~service ~context ~input
      ~output_deserializer:Json_deserializers.list_efficiency_metrics_response_of_yojson
      ~error_deserializer
end

module ListEnrollmentStatuses = struct
  let error_to_string = function
    | `AccessDeniedException _ -> "com.amazonaws.costoptimizationhub#AccessDeniedException"
    | `InternalServerException _ -> "com.amazonaws.costoptimizationhub#InternalServerException"
    | `ThrottlingException _ -> "com.amazonaws.costoptimizationhub#ThrottlingException"
    | `ValidationException _ -> "com.amazonaws.costoptimizationhub#ValidationException"
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

  let request context (request : list_enrollment_statuses_request) =
    let input = Json_serializers.list_enrollment_statuses_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request
      ~shape_name:"CostOptimizationHubService.ListEnrollmentStatuses" ~service ~context ~input
      ~output_deserializer:Json_deserializers.list_enrollment_statuses_response_of_yojson
      ~error_deserializer

  let request_with_metadata context (request : list_enrollment_statuses_request) =
    let input = Json_serializers.list_enrollment_statuses_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata
      ~shape_name:"CostOptimizationHubService.ListEnrollmentStatuses" ~service ~context ~input
      ~output_deserializer:Json_deserializers.list_enrollment_statuses_response_of_yojson
      ~error_deserializer
end

module ListRecommendationSummaries = struct
  let error_to_string = function
    | `AccessDeniedException _ -> "com.amazonaws.costoptimizationhub#AccessDeniedException"
    | `InternalServerException _ -> "com.amazonaws.costoptimizationhub#InternalServerException"
    | `ThrottlingException _ -> "com.amazonaws.costoptimizationhub#ThrottlingException"
    | `ValidationException _ -> "com.amazonaws.costoptimizationhub#ValidationException"
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

  let request context (request : list_recommendation_summaries_request) =
    let input = Json_serializers.list_recommendation_summaries_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request
      ~shape_name:"CostOptimizationHubService.ListRecommendationSummaries" ~service ~context ~input
      ~output_deserializer:Json_deserializers.list_recommendation_summaries_response_of_yojson
      ~error_deserializer

  let request_with_metadata context (request : list_recommendation_summaries_request) =
    let input = Json_serializers.list_recommendation_summaries_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata
      ~shape_name:"CostOptimizationHubService.ListRecommendationSummaries" ~service ~context ~input
      ~output_deserializer:Json_deserializers.list_recommendation_summaries_response_of_yojson
      ~error_deserializer
end

module ListRecommendations = struct
  let error_to_string = function
    | `AccessDeniedException _ -> "com.amazonaws.costoptimizationhub#AccessDeniedException"
    | `InternalServerException _ -> "com.amazonaws.costoptimizationhub#InternalServerException"
    | `ThrottlingException _ -> "com.amazonaws.costoptimizationhub#ThrottlingException"
    | `ValidationException _ -> "com.amazonaws.costoptimizationhub#ValidationException"
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

  let request context (request : list_recommendations_request) =
    let input = Json_serializers.list_recommendations_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"CostOptimizationHubService.ListRecommendations"
      ~service ~context ~input
      ~output_deserializer:Json_deserializers.list_recommendations_response_of_yojson
      ~error_deserializer

  let request_with_metadata context (request : list_recommendations_request) =
    let input = Json_serializers.list_recommendations_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata
      ~shape_name:"CostOptimizationHubService.ListRecommendations" ~service ~context ~input
      ~output_deserializer:Json_deserializers.list_recommendations_response_of_yojson
      ~error_deserializer
end

module UpdateEnrollmentStatus = struct
  let error_to_string = function
    | `AccessDeniedException _ -> "com.amazonaws.costoptimizationhub#AccessDeniedException"
    | `InternalServerException _ -> "com.amazonaws.costoptimizationhub#InternalServerException"
    | `ThrottlingException _ -> "com.amazonaws.costoptimizationhub#ThrottlingException"
    | `ValidationException _ -> "com.amazonaws.costoptimizationhub#ValidationException"
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

  let request context (request : update_enrollment_status_request) =
    let input = Json_serializers.update_enrollment_status_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request
      ~shape_name:"CostOptimizationHubService.UpdateEnrollmentStatus" ~service ~context ~input
      ~output_deserializer:Json_deserializers.update_enrollment_status_response_of_yojson
      ~error_deserializer

  let request_with_metadata context (request : update_enrollment_status_request) =
    let input = Json_serializers.update_enrollment_status_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata
      ~shape_name:"CostOptimizationHubService.UpdateEnrollmentStatus" ~service ~context ~input
      ~output_deserializer:Json_deserializers.update_enrollment_status_response_of_yojson
      ~error_deserializer
end

module UpdatePreferences = struct
  let error_to_string = function
    | `AccessDeniedException _ -> "com.amazonaws.costoptimizationhub#AccessDeniedException"
    | `InternalServerException _ -> "com.amazonaws.costoptimizationhub#InternalServerException"
    | `ThrottlingException _ -> "com.amazonaws.costoptimizationhub#ThrottlingException"
    | `ValidationException _ -> "com.amazonaws.costoptimizationhub#ValidationException"
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

  let request context (request : update_preferences_request) =
    let input = Json_serializers.update_preferences_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"CostOptimizationHubService.UpdatePreferences"
      ~service ~context ~input
      ~output_deserializer:Json_deserializers.update_preferences_response_of_yojson
      ~error_deserializer

  let request_with_metadata context (request : update_preferences_request) =
    let input = Json_serializers.update_preferences_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata
      ~shape_name:"CostOptimizationHubService.UpdatePreferences" ~service ~context ~input
      ~output_deserializer:Json_deserializers.update_preferences_response_of_yojson
      ~error_deserializer
end
