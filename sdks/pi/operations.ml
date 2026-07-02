open Types
open Service_metadata

module CreatePerformanceAnalysisReport = struct
  let error_to_string = function
    | `InternalServiceError _ -> "com.amazonaws.pi#InternalServiceError"
    | `InvalidArgumentException _ -> "com.amazonaws.pi#InvalidArgumentException"
    | `NotAuthorizedException _ -> "com.amazonaws.pi#NotAuthorizedException"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "InternalServiceError" ->
          `InternalServiceError (Json_deserializers.internal_service_error_of_yojson tree path)
      | _, "InvalidArgumentException" ->
          `InvalidArgumentException
            (Json_deserializers.invalid_argument_exception_of_yojson tree path)
      | _, "NotAuthorizedException" ->
          `NotAuthorizedException (Json_deserializers.not_authorized_exception_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : create_performance_analysis_report_request) =
    let input = Json_serializers.create_performance_analysis_report_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request
      ~shape_name:"PerformanceInsightsv20180227.CreatePerformanceAnalysisReport" ~service ~context
      ~input
      ~output_deserializer:Json_deserializers.create_performance_analysis_report_response_of_yojson
      ~error_deserializer
end

module DeletePerformanceAnalysisReport = struct
  let error_to_string = function
    | `InternalServiceError _ -> "com.amazonaws.pi#InternalServiceError"
    | `InvalidArgumentException _ -> "com.amazonaws.pi#InvalidArgumentException"
    | `NotAuthorizedException _ -> "com.amazonaws.pi#NotAuthorizedException"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "InternalServiceError" ->
          `InternalServiceError (Json_deserializers.internal_service_error_of_yojson tree path)
      | _, "InvalidArgumentException" ->
          `InvalidArgumentException
            (Json_deserializers.invalid_argument_exception_of_yojson tree path)
      | _, "NotAuthorizedException" ->
          `NotAuthorizedException (Json_deserializers.not_authorized_exception_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : delete_performance_analysis_report_request) =
    let input = Json_serializers.delete_performance_analysis_report_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request
      ~shape_name:"PerformanceInsightsv20180227.DeletePerformanceAnalysisReport" ~service ~context
      ~input
      ~output_deserializer:Json_deserializers.delete_performance_analysis_report_response_of_yojson
      ~error_deserializer
end

module DescribeDimensionKeys = struct
  let error_to_string = function
    | `InternalServiceError _ -> "com.amazonaws.pi#InternalServiceError"
    | `InvalidArgumentException _ -> "com.amazonaws.pi#InvalidArgumentException"
    | `NotAuthorizedException _ -> "com.amazonaws.pi#NotAuthorizedException"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "InternalServiceError" ->
          `InternalServiceError (Json_deserializers.internal_service_error_of_yojson tree path)
      | _, "InvalidArgumentException" ->
          `InvalidArgumentException
            (Json_deserializers.invalid_argument_exception_of_yojson tree path)
      | _, "NotAuthorizedException" ->
          `NotAuthorizedException (Json_deserializers.not_authorized_exception_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : describe_dimension_keys_request) =
    let input = Json_serializers.describe_dimension_keys_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request
      ~shape_name:"PerformanceInsightsv20180227.DescribeDimensionKeys" ~service ~context ~input
      ~output_deserializer:Json_deserializers.describe_dimension_keys_response_of_yojson
      ~error_deserializer
end

module GetDimensionKeyDetails = struct
  let error_to_string = function
    | `InternalServiceError _ -> "com.amazonaws.pi#InternalServiceError"
    | `InvalidArgumentException _ -> "com.amazonaws.pi#InvalidArgumentException"
    | `NotAuthorizedException _ -> "com.amazonaws.pi#NotAuthorizedException"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "InternalServiceError" ->
          `InternalServiceError (Json_deserializers.internal_service_error_of_yojson tree path)
      | _, "InvalidArgumentException" ->
          `InvalidArgumentException
            (Json_deserializers.invalid_argument_exception_of_yojson tree path)
      | _, "NotAuthorizedException" ->
          `NotAuthorizedException (Json_deserializers.not_authorized_exception_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : get_dimension_key_details_request) =
    let input = Json_serializers.get_dimension_key_details_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request
      ~shape_name:"PerformanceInsightsv20180227.GetDimensionKeyDetails" ~service ~context ~input
      ~output_deserializer:Json_deserializers.get_dimension_key_details_response_of_yojson
      ~error_deserializer
end

module GetPerformanceAnalysisReport = struct
  let error_to_string = function
    | `InternalServiceError _ -> "com.amazonaws.pi#InternalServiceError"
    | `InvalidArgumentException _ -> "com.amazonaws.pi#InvalidArgumentException"
    | `NotAuthorizedException _ -> "com.amazonaws.pi#NotAuthorizedException"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "InternalServiceError" ->
          `InternalServiceError (Json_deserializers.internal_service_error_of_yojson tree path)
      | _, "InvalidArgumentException" ->
          `InvalidArgumentException
            (Json_deserializers.invalid_argument_exception_of_yojson tree path)
      | _, "NotAuthorizedException" ->
          `NotAuthorizedException (Json_deserializers.not_authorized_exception_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : get_performance_analysis_report_request) =
    let input = Json_serializers.get_performance_analysis_report_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request
      ~shape_name:"PerformanceInsightsv20180227.GetPerformanceAnalysisReport" ~service ~context
      ~input
      ~output_deserializer:Json_deserializers.get_performance_analysis_report_response_of_yojson
      ~error_deserializer
end

module GetResourceMetadata = struct
  let error_to_string = function
    | `InternalServiceError _ -> "com.amazonaws.pi#InternalServiceError"
    | `InvalidArgumentException _ -> "com.amazonaws.pi#InvalidArgumentException"
    | `NotAuthorizedException _ -> "com.amazonaws.pi#NotAuthorizedException"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "InternalServiceError" ->
          `InternalServiceError (Json_deserializers.internal_service_error_of_yojson tree path)
      | _, "InvalidArgumentException" ->
          `InvalidArgumentException
            (Json_deserializers.invalid_argument_exception_of_yojson tree path)
      | _, "NotAuthorizedException" ->
          `NotAuthorizedException (Json_deserializers.not_authorized_exception_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : get_resource_metadata_request) =
    let input = Json_serializers.get_resource_metadata_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request
      ~shape_name:"PerformanceInsightsv20180227.GetResourceMetadata" ~service ~context ~input
      ~output_deserializer:Json_deserializers.get_resource_metadata_response_of_yojson
      ~error_deserializer
end

module GetResourceMetrics = struct
  let error_to_string = function
    | `InternalServiceError _ -> "com.amazonaws.pi#InternalServiceError"
    | `InvalidArgumentException _ -> "com.amazonaws.pi#InvalidArgumentException"
    | `NotAuthorizedException _ -> "com.amazonaws.pi#NotAuthorizedException"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "InternalServiceError" ->
          `InternalServiceError (Json_deserializers.internal_service_error_of_yojson tree path)
      | _, "InvalidArgumentException" ->
          `InvalidArgumentException
            (Json_deserializers.invalid_argument_exception_of_yojson tree path)
      | _, "NotAuthorizedException" ->
          `NotAuthorizedException (Json_deserializers.not_authorized_exception_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : get_resource_metrics_request) =
    let input = Json_serializers.get_resource_metrics_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request
      ~shape_name:"PerformanceInsightsv20180227.GetResourceMetrics" ~service ~context ~input
      ~output_deserializer:Json_deserializers.get_resource_metrics_response_of_yojson
      ~error_deserializer
end

module ListAvailableResourceDimensions = struct
  let error_to_string = function
    | `InternalServiceError _ -> "com.amazonaws.pi#InternalServiceError"
    | `InvalidArgumentException _ -> "com.amazonaws.pi#InvalidArgumentException"
    | `NotAuthorizedException _ -> "com.amazonaws.pi#NotAuthorizedException"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "InternalServiceError" ->
          `InternalServiceError (Json_deserializers.internal_service_error_of_yojson tree path)
      | _, "InvalidArgumentException" ->
          `InvalidArgumentException
            (Json_deserializers.invalid_argument_exception_of_yojson tree path)
      | _, "NotAuthorizedException" ->
          `NotAuthorizedException (Json_deserializers.not_authorized_exception_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : list_available_resource_dimensions_request) =
    let input = Json_serializers.list_available_resource_dimensions_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request
      ~shape_name:"PerformanceInsightsv20180227.ListAvailableResourceDimensions" ~service ~context
      ~input
      ~output_deserializer:Json_deserializers.list_available_resource_dimensions_response_of_yojson
      ~error_deserializer
end

module ListAvailableResourceMetrics = struct
  let error_to_string = function
    | `InternalServiceError _ -> "com.amazonaws.pi#InternalServiceError"
    | `InvalidArgumentException _ -> "com.amazonaws.pi#InvalidArgumentException"
    | `NotAuthorizedException _ -> "com.amazonaws.pi#NotAuthorizedException"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "InternalServiceError" ->
          `InternalServiceError (Json_deserializers.internal_service_error_of_yojson tree path)
      | _, "InvalidArgumentException" ->
          `InvalidArgumentException
            (Json_deserializers.invalid_argument_exception_of_yojson tree path)
      | _, "NotAuthorizedException" ->
          `NotAuthorizedException (Json_deserializers.not_authorized_exception_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : list_available_resource_metrics_request) =
    let input = Json_serializers.list_available_resource_metrics_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request
      ~shape_name:"PerformanceInsightsv20180227.ListAvailableResourceMetrics" ~service ~context
      ~input
      ~output_deserializer:Json_deserializers.list_available_resource_metrics_response_of_yojson
      ~error_deserializer
end

module ListPerformanceAnalysisReports = struct
  let error_to_string = function
    | `InternalServiceError _ -> "com.amazonaws.pi#InternalServiceError"
    | `InvalidArgumentException _ -> "com.amazonaws.pi#InvalidArgumentException"
    | `NotAuthorizedException _ -> "com.amazonaws.pi#NotAuthorizedException"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "InternalServiceError" ->
          `InternalServiceError (Json_deserializers.internal_service_error_of_yojson tree path)
      | _, "InvalidArgumentException" ->
          `InvalidArgumentException
            (Json_deserializers.invalid_argument_exception_of_yojson tree path)
      | _, "NotAuthorizedException" ->
          `NotAuthorizedException (Json_deserializers.not_authorized_exception_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : list_performance_analysis_reports_request) =
    let input = Json_serializers.list_performance_analysis_reports_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request
      ~shape_name:"PerformanceInsightsv20180227.ListPerformanceAnalysisReports" ~service ~context
      ~input
      ~output_deserializer:Json_deserializers.list_performance_analysis_reports_response_of_yojson
      ~error_deserializer
end

module ListTagsForResource = struct
  let error_to_string = function
    | `InternalServiceError _ -> "com.amazonaws.pi#InternalServiceError"
    | `InvalidArgumentException _ -> "com.amazonaws.pi#InvalidArgumentException"
    | `NotAuthorizedException _ -> "com.amazonaws.pi#NotAuthorizedException"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "InternalServiceError" ->
          `InternalServiceError (Json_deserializers.internal_service_error_of_yojson tree path)
      | _, "InvalidArgumentException" ->
          `InvalidArgumentException
            (Json_deserializers.invalid_argument_exception_of_yojson tree path)
      | _, "NotAuthorizedException" ->
          `NotAuthorizedException (Json_deserializers.not_authorized_exception_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : list_tags_for_resource_request) =
    let input = Json_serializers.list_tags_for_resource_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request
      ~shape_name:"PerformanceInsightsv20180227.ListTagsForResource" ~service ~context ~input
      ~output_deserializer:Json_deserializers.list_tags_for_resource_response_of_yojson
      ~error_deserializer
end

module TagResource = struct
  let error_to_string = function
    | `InternalServiceError _ -> "com.amazonaws.pi#InternalServiceError"
    | `InvalidArgumentException _ -> "com.amazonaws.pi#InvalidArgumentException"
    | `NotAuthorizedException _ -> "com.amazonaws.pi#NotAuthorizedException"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "InternalServiceError" ->
          `InternalServiceError (Json_deserializers.internal_service_error_of_yojson tree path)
      | _, "InvalidArgumentException" ->
          `InvalidArgumentException
            (Json_deserializers.invalid_argument_exception_of_yojson tree path)
      | _, "NotAuthorizedException" ->
          `NotAuthorizedException (Json_deserializers.not_authorized_exception_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : tag_resource_request) =
    let input = Json_serializers.tag_resource_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"PerformanceInsightsv20180227.TagResource"
      ~service ~context ~input
      ~output_deserializer:Json_deserializers.tag_resource_response_of_yojson ~error_deserializer
end

module UntagResource = struct
  let error_to_string = function
    | `InternalServiceError _ -> "com.amazonaws.pi#InternalServiceError"
    | `InvalidArgumentException _ -> "com.amazonaws.pi#InvalidArgumentException"
    | `NotAuthorizedException _ -> "com.amazonaws.pi#NotAuthorizedException"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "InternalServiceError" ->
          `InternalServiceError (Json_deserializers.internal_service_error_of_yojson tree path)
      | _, "InvalidArgumentException" ->
          `InvalidArgumentException
            (Json_deserializers.invalid_argument_exception_of_yojson tree path)
      | _, "NotAuthorizedException" ->
          `NotAuthorizedException (Json_deserializers.not_authorized_exception_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : untag_resource_request) =
    let input = Json_serializers.untag_resource_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"PerformanceInsightsv20180227.UntagResource"
      ~service ~context ~input
      ~output_deserializer:Json_deserializers.untag_resource_response_of_yojson ~error_deserializer
end
