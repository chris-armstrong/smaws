open Types
open Service_metadata

module QueryForecast = struct
  let error_to_string = function
    | `InvalidInputException _ -> "com.amazonaws.forecastquery#InvalidInputException"
    | `InvalidNextTokenException _ -> "com.amazonaws.forecastquery#InvalidNextTokenException"
    | `LimitExceededException _ -> "com.amazonaws.forecastquery#LimitExceededException"
    | `ResourceInUseException _ -> "com.amazonaws.forecastquery#ResourceInUseException"
    | `ResourceNotFoundException _ -> "com.amazonaws.forecastquery#ResourceNotFoundException"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "InvalidInputException" ->
          `InvalidInputException (Json_deserializers.invalid_input_exception_of_yojson tree path)
      | _, "InvalidNextTokenException" ->
          `InvalidNextTokenException
            (Json_deserializers.invalid_next_token_exception_of_yojson tree path)
      | _, "LimitExceededException" ->
          `LimitExceededException (Json_deserializers.limit_exceeded_exception_of_yojson tree path)
      | _, "ResourceInUseException" ->
          `ResourceInUseException (Json_deserializers.resource_in_use_exception_of_yojson tree path)
      | _, "ResourceNotFoundException" ->
          `ResourceNotFoundException
            (Json_deserializers.resource_not_found_exception_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : query_forecast_request) =
    let input = Json_serializers.query_forecast_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"AmazonForecastRuntime.QueryForecast" ~service
      ~context ~input ~output_deserializer:Json_deserializers.query_forecast_response_of_yojson
      ~error_deserializer

  let request_with_metadata context (request : query_forecast_request) =
    let input = Json_serializers.query_forecast_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata
      ~shape_name:"AmazonForecastRuntime.QueryForecast" ~service ~context ~input
      ~output_deserializer:Json_deserializers.query_forecast_response_of_yojson ~error_deserializer
end

module QueryWhatIfForecast = struct
  let error_to_string = function
    | `InvalidInputException _ -> "com.amazonaws.forecastquery#InvalidInputException"
    | `InvalidNextTokenException _ -> "com.amazonaws.forecastquery#InvalidNextTokenException"
    | `LimitExceededException _ -> "com.amazonaws.forecastquery#LimitExceededException"
    | `ResourceInUseException _ -> "com.amazonaws.forecastquery#ResourceInUseException"
    | `ResourceNotFoundException _ -> "com.amazonaws.forecastquery#ResourceNotFoundException"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "InvalidInputException" ->
          `InvalidInputException (Json_deserializers.invalid_input_exception_of_yojson tree path)
      | _, "InvalidNextTokenException" ->
          `InvalidNextTokenException
            (Json_deserializers.invalid_next_token_exception_of_yojson tree path)
      | _, "LimitExceededException" ->
          `LimitExceededException (Json_deserializers.limit_exceeded_exception_of_yojson tree path)
      | _, "ResourceInUseException" ->
          `ResourceInUseException (Json_deserializers.resource_in_use_exception_of_yojson tree path)
      | _, "ResourceNotFoundException" ->
          `ResourceNotFoundException
            (Json_deserializers.resource_not_found_exception_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : query_what_if_forecast_request) =
    let input = Json_serializers.query_what_if_forecast_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"AmazonForecastRuntime.QueryWhatIfForecast"
      ~service ~context ~input
      ~output_deserializer:Json_deserializers.query_what_if_forecast_response_of_yojson
      ~error_deserializer

  let request_with_metadata context (request : query_what_if_forecast_request) =
    let input = Json_serializers.query_what_if_forecast_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata
      ~shape_name:"AmazonForecastRuntime.QueryWhatIfForecast" ~service ~context ~input
      ~output_deserializer:Json_deserializers.query_what_if_forecast_response_of_yojson
      ~error_deserializer
end
