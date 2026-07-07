open Types
open Service_metadata

module CreateAutoPredictor = struct
  let error_to_string = function
    | `InvalidInputException _ -> "com.amazonaws.forecast#InvalidInputException"
    | `LimitExceededException _ -> "com.amazonaws.forecast#LimitExceededException"
    | `ResourceAlreadyExistsException _ -> "com.amazonaws.forecast#ResourceAlreadyExistsException"
    | `ResourceInUseException _ -> "com.amazonaws.forecast#ResourceInUseException"
    | `ResourceNotFoundException _ -> "com.amazonaws.forecast#ResourceNotFoundException"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "InvalidInputException" ->
          `InvalidInputException (Json_deserializers.invalid_input_exception_of_yojson tree path)
      | _, "LimitExceededException" ->
          `LimitExceededException (Json_deserializers.limit_exceeded_exception_of_yojson tree path)
      | _, "ResourceAlreadyExistsException" ->
          `ResourceAlreadyExistsException
            (Json_deserializers.resource_already_exists_exception_of_yojson tree path)
      | _, "ResourceInUseException" ->
          `ResourceInUseException (Json_deserializers.resource_in_use_exception_of_yojson tree path)
      | _, "ResourceNotFoundException" ->
          `ResourceNotFoundException
            (Json_deserializers.resource_not_found_exception_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : create_auto_predictor_request) =
    let input = Json_serializers.create_auto_predictor_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"AmazonForecast.CreateAutoPredictor" ~service
      ~context ~input
      ~output_deserializer:Json_deserializers.create_auto_predictor_response_of_yojson
      ~error_deserializer

  let request_with_metadata context (request : create_auto_predictor_request) =
    let input = Json_serializers.create_auto_predictor_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata
      ~shape_name:"AmazonForecast.CreateAutoPredictor" ~service ~context ~input
      ~output_deserializer:Json_deserializers.create_auto_predictor_response_of_yojson
      ~error_deserializer
end

module CreateDataset = struct
  let error_to_string = function
    | `InvalidInputException _ -> "com.amazonaws.forecast#InvalidInputException"
    | `LimitExceededException _ -> "com.amazonaws.forecast#LimitExceededException"
    | `ResourceAlreadyExistsException _ -> "com.amazonaws.forecast#ResourceAlreadyExistsException"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "InvalidInputException" ->
          `InvalidInputException (Json_deserializers.invalid_input_exception_of_yojson tree path)
      | _, "LimitExceededException" ->
          `LimitExceededException (Json_deserializers.limit_exceeded_exception_of_yojson tree path)
      | _, "ResourceAlreadyExistsException" ->
          `ResourceAlreadyExistsException
            (Json_deserializers.resource_already_exists_exception_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : create_dataset_request) =
    let input = Json_serializers.create_dataset_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"AmazonForecast.CreateDataset" ~service ~context
      ~input ~output_deserializer:Json_deserializers.create_dataset_response_of_yojson
      ~error_deserializer

  let request_with_metadata context (request : create_dataset_request) =
    let input = Json_serializers.create_dataset_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata ~shape_name:"AmazonForecast.CreateDataset"
      ~service ~context ~input
      ~output_deserializer:Json_deserializers.create_dataset_response_of_yojson ~error_deserializer
end

module CreateDatasetGroup = struct
  let error_to_string = function
    | `InvalidInputException _ -> "com.amazonaws.forecast#InvalidInputException"
    | `LimitExceededException _ -> "com.amazonaws.forecast#LimitExceededException"
    | `ResourceAlreadyExistsException _ -> "com.amazonaws.forecast#ResourceAlreadyExistsException"
    | `ResourceInUseException _ -> "com.amazonaws.forecast#ResourceInUseException"
    | `ResourceNotFoundException _ -> "com.amazonaws.forecast#ResourceNotFoundException"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "InvalidInputException" ->
          `InvalidInputException (Json_deserializers.invalid_input_exception_of_yojson tree path)
      | _, "LimitExceededException" ->
          `LimitExceededException (Json_deserializers.limit_exceeded_exception_of_yojson tree path)
      | _, "ResourceAlreadyExistsException" ->
          `ResourceAlreadyExistsException
            (Json_deserializers.resource_already_exists_exception_of_yojson tree path)
      | _, "ResourceInUseException" ->
          `ResourceInUseException (Json_deserializers.resource_in_use_exception_of_yojson tree path)
      | _, "ResourceNotFoundException" ->
          `ResourceNotFoundException
            (Json_deserializers.resource_not_found_exception_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : create_dataset_group_request) =
    let input = Json_serializers.create_dataset_group_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"AmazonForecast.CreateDatasetGroup" ~service
      ~context ~input
      ~output_deserializer:Json_deserializers.create_dataset_group_response_of_yojson
      ~error_deserializer

  let request_with_metadata context (request : create_dataset_group_request) =
    let input = Json_serializers.create_dataset_group_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata
      ~shape_name:"AmazonForecast.CreateDatasetGroup" ~service ~context ~input
      ~output_deserializer:Json_deserializers.create_dataset_group_response_of_yojson
      ~error_deserializer
end

module CreateDatasetImportJob = struct
  let error_to_string = function
    | `InvalidInputException _ -> "com.amazonaws.forecast#InvalidInputException"
    | `LimitExceededException _ -> "com.amazonaws.forecast#LimitExceededException"
    | `ResourceAlreadyExistsException _ -> "com.amazonaws.forecast#ResourceAlreadyExistsException"
    | `ResourceInUseException _ -> "com.amazonaws.forecast#ResourceInUseException"
    | `ResourceNotFoundException _ -> "com.amazonaws.forecast#ResourceNotFoundException"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "InvalidInputException" ->
          `InvalidInputException (Json_deserializers.invalid_input_exception_of_yojson tree path)
      | _, "LimitExceededException" ->
          `LimitExceededException (Json_deserializers.limit_exceeded_exception_of_yojson tree path)
      | _, "ResourceAlreadyExistsException" ->
          `ResourceAlreadyExistsException
            (Json_deserializers.resource_already_exists_exception_of_yojson tree path)
      | _, "ResourceInUseException" ->
          `ResourceInUseException (Json_deserializers.resource_in_use_exception_of_yojson tree path)
      | _, "ResourceNotFoundException" ->
          `ResourceNotFoundException
            (Json_deserializers.resource_not_found_exception_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : create_dataset_import_job_request) =
    let input = Json_serializers.create_dataset_import_job_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"AmazonForecast.CreateDatasetImportJob" ~service
      ~context ~input
      ~output_deserializer:Json_deserializers.create_dataset_import_job_response_of_yojson
      ~error_deserializer

  let request_with_metadata context (request : create_dataset_import_job_request) =
    let input = Json_serializers.create_dataset_import_job_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata
      ~shape_name:"AmazonForecast.CreateDatasetImportJob" ~service ~context ~input
      ~output_deserializer:Json_deserializers.create_dataset_import_job_response_of_yojson
      ~error_deserializer
end

module CreateExplainability = struct
  let error_to_string = function
    | `InvalidInputException _ -> "com.amazonaws.forecast#InvalidInputException"
    | `LimitExceededException _ -> "com.amazonaws.forecast#LimitExceededException"
    | `ResourceAlreadyExistsException _ -> "com.amazonaws.forecast#ResourceAlreadyExistsException"
    | `ResourceInUseException _ -> "com.amazonaws.forecast#ResourceInUseException"
    | `ResourceNotFoundException _ -> "com.amazonaws.forecast#ResourceNotFoundException"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "InvalidInputException" ->
          `InvalidInputException (Json_deserializers.invalid_input_exception_of_yojson tree path)
      | _, "LimitExceededException" ->
          `LimitExceededException (Json_deserializers.limit_exceeded_exception_of_yojson tree path)
      | _, "ResourceAlreadyExistsException" ->
          `ResourceAlreadyExistsException
            (Json_deserializers.resource_already_exists_exception_of_yojson tree path)
      | _, "ResourceInUseException" ->
          `ResourceInUseException (Json_deserializers.resource_in_use_exception_of_yojson tree path)
      | _, "ResourceNotFoundException" ->
          `ResourceNotFoundException
            (Json_deserializers.resource_not_found_exception_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : create_explainability_request) =
    let input = Json_serializers.create_explainability_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"AmazonForecast.CreateExplainability" ~service
      ~context ~input
      ~output_deserializer:Json_deserializers.create_explainability_response_of_yojson
      ~error_deserializer

  let request_with_metadata context (request : create_explainability_request) =
    let input = Json_serializers.create_explainability_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata
      ~shape_name:"AmazonForecast.CreateExplainability" ~service ~context ~input
      ~output_deserializer:Json_deserializers.create_explainability_response_of_yojson
      ~error_deserializer
end

module CreateExplainabilityExport = struct
  let error_to_string = function
    | `InvalidInputException _ -> "com.amazonaws.forecast#InvalidInputException"
    | `LimitExceededException _ -> "com.amazonaws.forecast#LimitExceededException"
    | `ResourceAlreadyExistsException _ -> "com.amazonaws.forecast#ResourceAlreadyExistsException"
    | `ResourceInUseException _ -> "com.amazonaws.forecast#ResourceInUseException"
    | `ResourceNotFoundException _ -> "com.amazonaws.forecast#ResourceNotFoundException"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "InvalidInputException" ->
          `InvalidInputException (Json_deserializers.invalid_input_exception_of_yojson tree path)
      | _, "LimitExceededException" ->
          `LimitExceededException (Json_deserializers.limit_exceeded_exception_of_yojson tree path)
      | _, "ResourceAlreadyExistsException" ->
          `ResourceAlreadyExistsException
            (Json_deserializers.resource_already_exists_exception_of_yojson tree path)
      | _, "ResourceInUseException" ->
          `ResourceInUseException (Json_deserializers.resource_in_use_exception_of_yojson tree path)
      | _, "ResourceNotFoundException" ->
          `ResourceNotFoundException
            (Json_deserializers.resource_not_found_exception_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : create_explainability_export_request) =
    let input = Json_serializers.create_explainability_export_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"AmazonForecast.CreateExplainabilityExport"
      ~service ~context ~input
      ~output_deserializer:Json_deserializers.create_explainability_export_response_of_yojson
      ~error_deserializer

  let request_with_metadata context (request : create_explainability_export_request) =
    let input = Json_serializers.create_explainability_export_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata
      ~shape_name:"AmazonForecast.CreateExplainabilityExport" ~service ~context ~input
      ~output_deserializer:Json_deserializers.create_explainability_export_response_of_yojson
      ~error_deserializer
end

module CreateForecast = struct
  let error_to_string = function
    | `InvalidInputException _ -> "com.amazonaws.forecast#InvalidInputException"
    | `LimitExceededException _ -> "com.amazonaws.forecast#LimitExceededException"
    | `ResourceAlreadyExistsException _ -> "com.amazonaws.forecast#ResourceAlreadyExistsException"
    | `ResourceInUseException _ -> "com.amazonaws.forecast#ResourceInUseException"
    | `ResourceNotFoundException _ -> "com.amazonaws.forecast#ResourceNotFoundException"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "InvalidInputException" ->
          `InvalidInputException (Json_deserializers.invalid_input_exception_of_yojson tree path)
      | _, "LimitExceededException" ->
          `LimitExceededException (Json_deserializers.limit_exceeded_exception_of_yojson tree path)
      | _, "ResourceAlreadyExistsException" ->
          `ResourceAlreadyExistsException
            (Json_deserializers.resource_already_exists_exception_of_yojson tree path)
      | _, "ResourceInUseException" ->
          `ResourceInUseException (Json_deserializers.resource_in_use_exception_of_yojson tree path)
      | _, "ResourceNotFoundException" ->
          `ResourceNotFoundException
            (Json_deserializers.resource_not_found_exception_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : create_forecast_request) =
    let input = Json_serializers.create_forecast_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"AmazonForecast.CreateForecast" ~service
      ~context ~input ~output_deserializer:Json_deserializers.create_forecast_response_of_yojson
      ~error_deserializer

  let request_with_metadata context (request : create_forecast_request) =
    let input = Json_serializers.create_forecast_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata ~shape_name:"AmazonForecast.CreateForecast"
      ~service ~context ~input
      ~output_deserializer:Json_deserializers.create_forecast_response_of_yojson ~error_deserializer
end

module CreateForecastExportJob = struct
  let error_to_string = function
    | `InvalidInputException _ -> "com.amazonaws.forecast#InvalidInputException"
    | `LimitExceededException _ -> "com.amazonaws.forecast#LimitExceededException"
    | `ResourceAlreadyExistsException _ -> "com.amazonaws.forecast#ResourceAlreadyExistsException"
    | `ResourceInUseException _ -> "com.amazonaws.forecast#ResourceInUseException"
    | `ResourceNotFoundException _ -> "com.amazonaws.forecast#ResourceNotFoundException"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "InvalidInputException" ->
          `InvalidInputException (Json_deserializers.invalid_input_exception_of_yojson tree path)
      | _, "LimitExceededException" ->
          `LimitExceededException (Json_deserializers.limit_exceeded_exception_of_yojson tree path)
      | _, "ResourceAlreadyExistsException" ->
          `ResourceAlreadyExistsException
            (Json_deserializers.resource_already_exists_exception_of_yojson tree path)
      | _, "ResourceInUseException" ->
          `ResourceInUseException (Json_deserializers.resource_in_use_exception_of_yojson tree path)
      | _, "ResourceNotFoundException" ->
          `ResourceNotFoundException
            (Json_deserializers.resource_not_found_exception_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : create_forecast_export_job_request) =
    let input = Json_serializers.create_forecast_export_job_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"AmazonForecast.CreateForecastExportJob"
      ~service ~context ~input
      ~output_deserializer:Json_deserializers.create_forecast_export_job_response_of_yojson
      ~error_deserializer

  let request_with_metadata context (request : create_forecast_export_job_request) =
    let input = Json_serializers.create_forecast_export_job_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata
      ~shape_name:"AmazonForecast.CreateForecastExportJob" ~service ~context ~input
      ~output_deserializer:Json_deserializers.create_forecast_export_job_response_of_yojson
      ~error_deserializer
end

module CreateMonitor = struct
  let error_to_string = function
    | `InvalidInputException _ -> "com.amazonaws.forecast#InvalidInputException"
    | `LimitExceededException _ -> "com.amazonaws.forecast#LimitExceededException"
    | `ResourceAlreadyExistsException _ -> "com.amazonaws.forecast#ResourceAlreadyExistsException"
    | `ResourceInUseException _ -> "com.amazonaws.forecast#ResourceInUseException"
    | `ResourceNotFoundException _ -> "com.amazonaws.forecast#ResourceNotFoundException"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "InvalidInputException" ->
          `InvalidInputException (Json_deserializers.invalid_input_exception_of_yojson tree path)
      | _, "LimitExceededException" ->
          `LimitExceededException (Json_deserializers.limit_exceeded_exception_of_yojson tree path)
      | _, "ResourceAlreadyExistsException" ->
          `ResourceAlreadyExistsException
            (Json_deserializers.resource_already_exists_exception_of_yojson tree path)
      | _, "ResourceInUseException" ->
          `ResourceInUseException (Json_deserializers.resource_in_use_exception_of_yojson tree path)
      | _, "ResourceNotFoundException" ->
          `ResourceNotFoundException
            (Json_deserializers.resource_not_found_exception_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : create_monitor_request) =
    let input = Json_serializers.create_monitor_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"AmazonForecast.CreateMonitor" ~service ~context
      ~input ~output_deserializer:Json_deserializers.create_monitor_response_of_yojson
      ~error_deserializer

  let request_with_metadata context (request : create_monitor_request) =
    let input = Json_serializers.create_monitor_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata ~shape_name:"AmazonForecast.CreateMonitor"
      ~service ~context ~input
      ~output_deserializer:Json_deserializers.create_monitor_response_of_yojson ~error_deserializer
end

module CreatePredictor = struct
  let error_to_string = function
    | `InvalidInputException _ -> "com.amazonaws.forecast#InvalidInputException"
    | `LimitExceededException _ -> "com.amazonaws.forecast#LimitExceededException"
    | `ResourceAlreadyExistsException _ -> "com.amazonaws.forecast#ResourceAlreadyExistsException"
    | `ResourceInUseException _ -> "com.amazonaws.forecast#ResourceInUseException"
    | `ResourceNotFoundException _ -> "com.amazonaws.forecast#ResourceNotFoundException"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "InvalidInputException" ->
          `InvalidInputException (Json_deserializers.invalid_input_exception_of_yojson tree path)
      | _, "LimitExceededException" ->
          `LimitExceededException (Json_deserializers.limit_exceeded_exception_of_yojson tree path)
      | _, "ResourceAlreadyExistsException" ->
          `ResourceAlreadyExistsException
            (Json_deserializers.resource_already_exists_exception_of_yojson tree path)
      | _, "ResourceInUseException" ->
          `ResourceInUseException (Json_deserializers.resource_in_use_exception_of_yojson tree path)
      | _, "ResourceNotFoundException" ->
          `ResourceNotFoundException
            (Json_deserializers.resource_not_found_exception_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : create_predictor_request) =
    let input = Json_serializers.create_predictor_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"AmazonForecast.CreatePredictor" ~service
      ~context ~input ~output_deserializer:Json_deserializers.create_predictor_response_of_yojson
      ~error_deserializer

  let request_with_metadata context (request : create_predictor_request) =
    let input = Json_serializers.create_predictor_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata ~shape_name:"AmazonForecast.CreatePredictor"
      ~service ~context ~input
      ~output_deserializer:Json_deserializers.create_predictor_response_of_yojson
      ~error_deserializer
end

module CreatePredictorBacktestExportJob = struct
  let error_to_string = function
    | `InvalidInputException _ -> "com.amazonaws.forecast#InvalidInputException"
    | `LimitExceededException _ -> "com.amazonaws.forecast#LimitExceededException"
    | `ResourceAlreadyExistsException _ -> "com.amazonaws.forecast#ResourceAlreadyExistsException"
    | `ResourceInUseException _ -> "com.amazonaws.forecast#ResourceInUseException"
    | `ResourceNotFoundException _ -> "com.amazonaws.forecast#ResourceNotFoundException"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "InvalidInputException" ->
          `InvalidInputException (Json_deserializers.invalid_input_exception_of_yojson tree path)
      | _, "LimitExceededException" ->
          `LimitExceededException (Json_deserializers.limit_exceeded_exception_of_yojson tree path)
      | _, "ResourceAlreadyExistsException" ->
          `ResourceAlreadyExistsException
            (Json_deserializers.resource_already_exists_exception_of_yojson tree path)
      | _, "ResourceInUseException" ->
          `ResourceInUseException (Json_deserializers.resource_in_use_exception_of_yojson tree path)
      | _, "ResourceNotFoundException" ->
          `ResourceNotFoundException
            (Json_deserializers.resource_not_found_exception_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : create_predictor_backtest_export_job_request) =
    let input = Json_serializers.create_predictor_backtest_export_job_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request
      ~shape_name:"AmazonForecast.CreatePredictorBacktestExportJob" ~service ~context ~input
      ~output_deserializer:
        Json_deserializers.create_predictor_backtest_export_job_response_of_yojson
      ~error_deserializer

  let request_with_metadata context (request : create_predictor_backtest_export_job_request) =
    let input = Json_serializers.create_predictor_backtest_export_job_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata
      ~shape_name:"AmazonForecast.CreatePredictorBacktestExportJob" ~service ~context ~input
      ~output_deserializer:
        Json_deserializers.create_predictor_backtest_export_job_response_of_yojson
      ~error_deserializer
end

module CreateWhatIfAnalysis = struct
  let error_to_string = function
    | `InvalidInputException _ -> "com.amazonaws.forecast#InvalidInputException"
    | `LimitExceededException _ -> "com.amazonaws.forecast#LimitExceededException"
    | `ResourceAlreadyExistsException _ -> "com.amazonaws.forecast#ResourceAlreadyExistsException"
    | `ResourceInUseException _ -> "com.amazonaws.forecast#ResourceInUseException"
    | `ResourceNotFoundException _ -> "com.amazonaws.forecast#ResourceNotFoundException"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "InvalidInputException" ->
          `InvalidInputException (Json_deserializers.invalid_input_exception_of_yojson tree path)
      | _, "LimitExceededException" ->
          `LimitExceededException (Json_deserializers.limit_exceeded_exception_of_yojson tree path)
      | _, "ResourceAlreadyExistsException" ->
          `ResourceAlreadyExistsException
            (Json_deserializers.resource_already_exists_exception_of_yojson tree path)
      | _, "ResourceInUseException" ->
          `ResourceInUseException (Json_deserializers.resource_in_use_exception_of_yojson tree path)
      | _, "ResourceNotFoundException" ->
          `ResourceNotFoundException
            (Json_deserializers.resource_not_found_exception_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : create_what_if_analysis_request) =
    let input = Json_serializers.create_what_if_analysis_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"AmazonForecast.CreateWhatIfAnalysis" ~service
      ~context ~input
      ~output_deserializer:Json_deserializers.create_what_if_analysis_response_of_yojson
      ~error_deserializer

  let request_with_metadata context (request : create_what_if_analysis_request) =
    let input = Json_serializers.create_what_if_analysis_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata
      ~shape_name:"AmazonForecast.CreateWhatIfAnalysis" ~service ~context ~input
      ~output_deserializer:Json_deserializers.create_what_if_analysis_response_of_yojson
      ~error_deserializer
end

module CreateWhatIfForecast = struct
  let error_to_string = function
    | `InvalidInputException _ -> "com.amazonaws.forecast#InvalidInputException"
    | `LimitExceededException _ -> "com.amazonaws.forecast#LimitExceededException"
    | `ResourceAlreadyExistsException _ -> "com.amazonaws.forecast#ResourceAlreadyExistsException"
    | `ResourceInUseException _ -> "com.amazonaws.forecast#ResourceInUseException"
    | `ResourceNotFoundException _ -> "com.amazonaws.forecast#ResourceNotFoundException"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "InvalidInputException" ->
          `InvalidInputException (Json_deserializers.invalid_input_exception_of_yojson tree path)
      | _, "LimitExceededException" ->
          `LimitExceededException (Json_deserializers.limit_exceeded_exception_of_yojson tree path)
      | _, "ResourceAlreadyExistsException" ->
          `ResourceAlreadyExistsException
            (Json_deserializers.resource_already_exists_exception_of_yojson tree path)
      | _, "ResourceInUseException" ->
          `ResourceInUseException (Json_deserializers.resource_in_use_exception_of_yojson tree path)
      | _, "ResourceNotFoundException" ->
          `ResourceNotFoundException
            (Json_deserializers.resource_not_found_exception_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : create_what_if_forecast_request) =
    let input = Json_serializers.create_what_if_forecast_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"AmazonForecast.CreateWhatIfForecast" ~service
      ~context ~input
      ~output_deserializer:Json_deserializers.create_what_if_forecast_response_of_yojson
      ~error_deserializer

  let request_with_metadata context (request : create_what_if_forecast_request) =
    let input = Json_serializers.create_what_if_forecast_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata
      ~shape_name:"AmazonForecast.CreateWhatIfForecast" ~service ~context ~input
      ~output_deserializer:Json_deserializers.create_what_if_forecast_response_of_yojson
      ~error_deserializer
end

module CreateWhatIfForecastExport = struct
  let error_to_string = function
    | `InvalidInputException _ -> "com.amazonaws.forecast#InvalidInputException"
    | `LimitExceededException _ -> "com.amazonaws.forecast#LimitExceededException"
    | `ResourceAlreadyExistsException _ -> "com.amazonaws.forecast#ResourceAlreadyExistsException"
    | `ResourceInUseException _ -> "com.amazonaws.forecast#ResourceInUseException"
    | `ResourceNotFoundException _ -> "com.amazonaws.forecast#ResourceNotFoundException"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "InvalidInputException" ->
          `InvalidInputException (Json_deserializers.invalid_input_exception_of_yojson tree path)
      | _, "LimitExceededException" ->
          `LimitExceededException (Json_deserializers.limit_exceeded_exception_of_yojson tree path)
      | _, "ResourceAlreadyExistsException" ->
          `ResourceAlreadyExistsException
            (Json_deserializers.resource_already_exists_exception_of_yojson tree path)
      | _, "ResourceInUseException" ->
          `ResourceInUseException (Json_deserializers.resource_in_use_exception_of_yojson tree path)
      | _, "ResourceNotFoundException" ->
          `ResourceNotFoundException
            (Json_deserializers.resource_not_found_exception_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : create_what_if_forecast_export_request) =
    let input = Json_serializers.create_what_if_forecast_export_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"AmazonForecast.CreateWhatIfForecastExport"
      ~service ~context ~input
      ~output_deserializer:Json_deserializers.create_what_if_forecast_export_response_of_yojson
      ~error_deserializer

  let request_with_metadata context (request : create_what_if_forecast_export_request) =
    let input = Json_serializers.create_what_if_forecast_export_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata
      ~shape_name:"AmazonForecast.CreateWhatIfForecastExport" ~service ~context ~input
      ~output_deserializer:Json_deserializers.create_what_if_forecast_export_response_of_yojson
      ~error_deserializer
end

module DeleteDataset = struct
  let error_to_string = function
    | `InvalidInputException _ -> "com.amazonaws.forecast#InvalidInputException"
    | `ResourceInUseException _ -> "com.amazonaws.forecast#ResourceInUseException"
    | `ResourceNotFoundException _ -> "com.amazonaws.forecast#ResourceNotFoundException"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "InvalidInputException" ->
          `InvalidInputException (Json_deserializers.invalid_input_exception_of_yojson tree path)
      | _, "ResourceInUseException" ->
          `ResourceInUseException (Json_deserializers.resource_in_use_exception_of_yojson tree path)
      | _, "ResourceNotFoundException" ->
          `ResourceNotFoundException
            (Json_deserializers.resource_not_found_exception_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : delete_dataset_request) =
    let input = Json_serializers.delete_dataset_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"AmazonForecast.DeleteDataset" ~service ~context
      ~input ~output_deserializer:Smaws_Lib.Smithy_api.Json_deserializers.unit__of_yojson
      ~error_deserializer

  let request_with_metadata context (request : delete_dataset_request) =
    let input = Json_serializers.delete_dataset_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata ~shape_name:"AmazonForecast.DeleteDataset"
      ~service ~context ~input
      ~output_deserializer:Smaws_Lib.Smithy_api.Json_deserializers.unit__of_yojson
      ~error_deserializer
end

module DeleteDatasetGroup = struct
  let error_to_string = function
    | `InvalidInputException _ -> "com.amazonaws.forecast#InvalidInputException"
    | `ResourceInUseException _ -> "com.amazonaws.forecast#ResourceInUseException"
    | `ResourceNotFoundException _ -> "com.amazonaws.forecast#ResourceNotFoundException"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "InvalidInputException" ->
          `InvalidInputException (Json_deserializers.invalid_input_exception_of_yojson tree path)
      | _, "ResourceInUseException" ->
          `ResourceInUseException (Json_deserializers.resource_in_use_exception_of_yojson tree path)
      | _, "ResourceNotFoundException" ->
          `ResourceNotFoundException
            (Json_deserializers.resource_not_found_exception_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : delete_dataset_group_request) =
    let input = Json_serializers.delete_dataset_group_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"AmazonForecast.DeleteDatasetGroup" ~service
      ~context ~input ~output_deserializer:Smaws_Lib.Smithy_api.Json_deserializers.unit__of_yojson
      ~error_deserializer

  let request_with_metadata context (request : delete_dataset_group_request) =
    let input = Json_serializers.delete_dataset_group_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata
      ~shape_name:"AmazonForecast.DeleteDatasetGroup" ~service ~context ~input
      ~output_deserializer:Smaws_Lib.Smithy_api.Json_deserializers.unit__of_yojson
      ~error_deserializer
end

module DeleteDatasetImportJob = struct
  let error_to_string = function
    | `InvalidInputException _ -> "com.amazonaws.forecast#InvalidInputException"
    | `ResourceInUseException _ -> "com.amazonaws.forecast#ResourceInUseException"
    | `ResourceNotFoundException _ -> "com.amazonaws.forecast#ResourceNotFoundException"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "InvalidInputException" ->
          `InvalidInputException (Json_deserializers.invalid_input_exception_of_yojson tree path)
      | _, "ResourceInUseException" ->
          `ResourceInUseException (Json_deserializers.resource_in_use_exception_of_yojson tree path)
      | _, "ResourceNotFoundException" ->
          `ResourceNotFoundException
            (Json_deserializers.resource_not_found_exception_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : delete_dataset_import_job_request) =
    let input = Json_serializers.delete_dataset_import_job_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"AmazonForecast.DeleteDatasetImportJob" ~service
      ~context ~input ~output_deserializer:Smaws_Lib.Smithy_api.Json_deserializers.unit__of_yojson
      ~error_deserializer

  let request_with_metadata context (request : delete_dataset_import_job_request) =
    let input = Json_serializers.delete_dataset_import_job_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata
      ~shape_name:"AmazonForecast.DeleteDatasetImportJob" ~service ~context ~input
      ~output_deserializer:Smaws_Lib.Smithy_api.Json_deserializers.unit__of_yojson
      ~error_deserializer
end

module DeleteExplainability = struct
  let error_to_string = function
    | `InvalidInputException _ -> "com.amazonaws.forecast#InvalidInputException"
    | `ResourceInUseException _ -> "com.amazonaws.forecast#ResourceInUseException"
    | `ResourceNotFoundException _ -> "com.amazonaws.forecast#ResourceNotFoundException"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "InvalidInputException" ->
          `InvalidInputException (Json_deserializers.invalid_input_exception_of_yojson tree path)
      | _, "ResourceInUseException" ->
          `ResourceInUseException (Json_deserializers.resource_in_use_exception_of_yojson tree path)
      | _, "ResourceNotFoundException" ->
          `ResourceNotFoundException
            (Json_deserializers.resource_not_found_exception_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : delete_explainability_request) =
    let input = Json_serializers.delete_explainability_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"AmazonForecast.DeleteExplainability" ~service
      ~context ~input ~output_deserializer:Smaws_Lib.Smithy_api.Json_deserializers.unit__of_yojson
      ~error_deserializer

  let request_with_metadata context (request : delete_explainability_request) =
    let input = Json_serializers.delete_explainability_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata
      ~shape_name:"AmazonForecast.DeleteExplainability" ~service ~context ~input
      ~output_deserializer:Smaws_Lib.Smithy_api.Json_deserializers.unit__of_yojson
      ~error_deserializer
end

module DeleteExplainabilityExport = struct
  let error_to_string = function
    | `InvalidInputException _ -> "com.amazonaws.forecast#InvalidInputException"
    | `ResourceInUseException _ -> "com.amazonaws.forecast#ResourceInUseException"
    | `ResourceNotFoundException _ -> "com.amazonaws.forecast#ResourceNotFoundException"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "InvalidInputException" ->
          `InvalidInputException (Json_deserializers.invalid_input_exception_of_yojson tree path)
      | _, "ResourceInUseException" ->
          `ResourceInUseException (Json_deserializers.resource_in_use_exception_of_yojson tree path)
      | _, "ResourceNotFoundException" ->
          `ResourceNotFoundException
            (Json_deserializers.resource_not_found_exception_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : delete_explainability_export_request) =
    let input = Json_serializers.delete_explainability_export_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"AmazonForecast.DeleteExplainabilityExport"
      ~service ~context ~input
      ~output_deserializer:Smaws_Lib.Smithy_api.Json_deserializers.unit__of_yojson
      ~error_deserializer

  let request_with_metadata context (request : delete_explainability_export_request) =
    let input = Json_serializers.delete_explainability_export_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata
      ~shape_name:"AmazonForecast.DeleteExplainabilityExport" ~service ~context ~input
      ~output_deserializer:Smaws_Lib.Smithy_api.Json_deserializers.unit__of_yojson
      ~error_deserializer
end

module DeleteForecast = struct
  let error_to_string = function
    | `InvalidInputException _ -> "com.amazonaws.forecast#InvalidInputException"
    | `ResourceInUseException _ -> "com.amazonaws.forecast#ResourceInUseException"
    | `ResourceNotFoundException _ -> "com.amazonaws.forecast#ResourceNotFoundException"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "InvalidInputException" ->
          `InvalidInputException (Json_deserializers.invalid_input_exception_of_yojson tree path)
      | _, "ResourceInUseException" ->
          `ResourceInUseException (Json_deserializers.resource_in_use_exception_of_yojson tree path)
      | _, "ResourceNotFoundException" ->
          `ResourceNotFoundException
            (Json_deserializers.resource_not_found_exception_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : delete_forecast_request) =
    let input = Json_serializers.delete_forecast_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"AmazonForecast.DeleteForecast" ~service
      ~context ~input ~output_deserializer:Smaws_Lib.Smithy_api.Json_deserializers.unit__of_yojson
      ~error_deserializer

  let request_with_metadata context (request : delete_forecast_request) =
    let input = Json_serializers.delete_forecast_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata ~shape_name:"AmazonForecast.DeleteForecast"
      ~service ~context ~input
      ~output_deserializer:Smaws_Lib.Smithy_api.Json_deserializers.unit__of_yojson
      ~error_deserializer
end

module DeleteForecastExportJob = struct
  let error_to_string = function
    | `InvalidInputException _ -> "com.amazonaws.forecast#InvalidInputException"
    | `ResourceInUseException _ -> "com.amazonaws.forecast#ResourceInUseException"
    | `ResourceNotFoundException _ -> "com.amazonaws.forecast#ResourceNotFoundException"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "InvalidInputException" ->
          `InvalidInputException (Json_deserializers.invalid_input_exception_of_yojson tree path)
      | _, "ResourceInUseException" ->
          `ResourceInUseException (Json_deserializers.resource_in_use_exception_of_yojson tree path)
      | _, "ResourceNotFoundException" ->
          `ResourceNotFoundException
            (Json_deserializers.resource_not_found_exception_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : delete_forecast_export_job_request) =
    let input = Json_serializers.delete_forecast_export_job_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"AmazonForecast.DeleteForecastExportJob"
      ~service ~context ~input
      ~output_deserializer:Smaws_Lib.Smithy_api.Json_deserializers.unit__of_yojson
      ~error_deserializer

  let request_with_metadata context (request : delete_forecast_export_job_request) =
    let input = Json_serializers.delete_forecast_export_job_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata
      ~shape_name:"AmazonForecast.DeleteForecastExportJob" ~service ~context ~input
      ~output_deserializer:Smaws_Lib.Smithy_api.Json_deserializers.unit__of_yojson
      ~error_deserializer
end

module DeleteMonitor = struct
  let error_to_string = function
    | `InvalidInputException _ -> "com.amazonaws.forecast#InvalidInputException"
    | `ResourceInUseException _ -> "com.amazonaws.forecast#ResourceInUseException"
    | `ResourceNotFoundException _ -> "com.amazonaws.forecast#ResourceNotFoundException"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "InvalidInputException" ->
          `InvalidInputException (Json_deserializers.invalid_input_exception_of_yojson tree path)
      | _, "ResourceInUseException" ->
          `ResourceInUseException (Json_deserializers.resource_in_use_exception_of_yojson tree path)
      | _, "ResourceNotFoundException" ->
          `ResourceNotFoundException
            (Json_deserializers.resource_not_found_exception_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : delete_monitor_request) =
    let input = Json_serializers.delete_monitor_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"AmazonForecast.DeleteMonitor" ~service ~context
      ~input ~output_deserializer:Smaws_Lib.Smithy_api.Json_deserializers.unit__of_yojson
      ~error_deserializer

  let request_with_metadata context (request : delete_monitor_request) =
    let input = Json_serializers.delete_monitor_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata ~shape_name:"AmazonForecast.DeleteMonitor"
      ~service ~context ~input
      ~output_deserializer:Smaws_Lib.Smithy_api.Json_deserializers.unit__of_yojson
      ~error_deserializer
end

module DeletePredictor = struct
  let error_to_string = function
    | `InvalidInputException _ -> "com.amazonaws.forecast#InvalidInputException"
    | `ResourceInUseException _ -> "com.amazonaws.forecast#ResourceInUseException"
    | `ResourceNotFoundException _ -> "com.amazonaws.forecast#ResourceNotFoundException"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "InvalidInputException" ->
          `InvalidInputException (Json_deserializers.invalid_input_exception_of_yojson tree path)
      | _, "ResourceInUseException" ->
          `ResourceInUseException (Json_deserializers.resource_in_use_exception_of_yojson tree path)
      | _, "ResourceNotFoundException" ->
          `ResourceNotFoundException
            (Json_deserializers.resource_not_found_exception_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : delete_predictor_request) =
    let input = Json_serializers.delete_predictor_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"AmazonForecast.DeletePredictor" ~service
      ~context ~input ~output_deserializer:Smaws_Lib.Smithy_api.Json_deserializers.unit__of_yojson
      ~error_deserializer

  let request_with_metadata context (request : delete_predictor_request) =
    let input = Json_serializers.delete_predictor_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata ~shape_name:"AmazonForecast.DeletePredictor"
      ~service ~context ~input
      ~output_deserializer:Smaws_Lib.Smithy_api.Json_deserializers.unit__of_yojson
      ~error_deserializer
end

module DeletePredictorBacktestExportJob = struct
  let error_to_string = function
    | `InvalidInputException _ -> "com.amazonaws.forecast#InvalidInputException"
    | `ResourceInUseException _ -> "com.amazonaws.forecast#ResourceInUseException"
    | `ResourceNotFoundException _ -> "com.amazonaws.forecast#ResourceNotFoundException"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "InvalidInputException" ->
          `InvalidInputException (Json_deserializers.invalid_input_exception_of_yojson tree path)
      | _, "ResourceInUseException" ->
          `ResourceInUseException (Json_deserializers.resource_in_use_exception_of_yojson tree path)
      | _, "ResourceNotFoundException" ->
          `ResourceNotFoundException
            (Json_deserializers.resource_not_found_exception_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : delete_predictor_backtest_export_job_request) =
    let input = Json_serializers.delete_predictor_backtest_export_job_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request
      ~shape_name:"AmazonForecast.DeletePredictorBacktestExportJob" ~service ~context ~input
      ~output_deserializer:Smaws_Lib.Smithy_api.Json_deserializers.unit__of_yojson
      ~error_deserializer

  let request_with_metadata context (request : delete_predictor_backtest_export_job_request) =
    let input = Json_serializers.delete_predictor_backtest_export_job_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata
      ~shape_name:"AmazonForecast.DeletePredictorBacktestExportJob" ~service ~context ~input
      ~output_deserializer:Smaws_Lib.Smithy_api.Json_deserializers.unit__of_yojson
      ~error_deserializer
end

module DeleteResourceTree = struct
  let error_to_string = function
    | `InvalidInputException _ -> "com.amazonaws.forecast#InvalidInputException"
    | `ResourceInUseException _ -> "com.amazonaws.forecast#ResourceInUseException"
    | `ResourceNotFoundException _ -> "com.amazonaws.forecast#ResourceNotFoundException"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "InvalidInputException" ->
          `InvalidInputException (Json_deserializers.invalid_input_exception_of_yojson tree path)
      | _, "ResourceInUseException" ->
          `ResourceInUseException (Json_deserializers.resource_in_use_exception_of_yojson tree path)
      | _, "ResourceNotFoundException" ->
          `ResourceNotFoundException
            (Json_deserializers.resource_not_found_exception_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : delete_resource_tree_request) =
    let input = Json_serializers.delete_resource_tree_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"AmazonForecast.DeleteResourceTree" ~service
      ~context ~input ~output_deserializer:Smaws_Lib.Smithy_api.Json_deserializers.unit__of_yojson
      ~error_deserializer

  let request_with_metadata context (request : delete_resource_tree_request) =
    let input = Json_serializers.delete_resource_tree_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata
      ~shape_name:"AmazonForecast.DeleteResourceTree" ~service ~context ~input
      ~output_deserializer:Smaws_Lib.Smithy_api.Json_deserializers.unit__of_yojson
      ~error_deserializer
end

module DeleteWhatIfAnalysis = struct
  let error_to_string = function
    | `InvalidInputException _ -> "com.amazonaws.forecast#InvalidInputException"
    | `ResourceInUseException _ -> "com.amazonaws.forecast#ResourceInUseException"
    | `ResourceNotFoundException _ -> "com.amazonaws.forecast#ResourceNotFoundException"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "InvalidInputException" ->
          `InvalidInputException (Json_deserializers.invalid_input_exception_of_yojson tree path)
      | _, "ResourceInUseException" ->
          `ResourceInUseException (Json_deserializers.resource_in_use_exception_of_yojson tree path)
      | _, "ResourceNotFoundException" ->
          `ResourceNotFoundException
            (Json_deserializers.resource_not_found_exception_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : delete_what_if_analysis_request) =
    let input = Json_serializers.delete_what_if_analysis_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"AmazonForecast.DeleteWhatIfAnalysis" ~service
      ~context ~input ~output_deserializer:Smaws_Lib.Smithy_api.Json_deserializers.unit__of_yojson
      ~error_deserializer

  let request_with_metadata context (request : delete_what_if_analysis_request) =
    let input = Json_serializers.delete_what_if_analysis_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata
      ~shape_name:"AmazonForecast.DeleteWhatIfAnalysis" ~service ~context ~input
      ~output_deserializer:Smaws_Lib.Smithy_api.Json_deserializers.unit__of_yojson
      ~error_deserializer
end

module DeleteWhatIfForecast = struct
  let error_to_string = function
    | `InvalidInputException _ -> "com.amazonaws.forecast#InvalidInputException"
    | `ResourceInUseException _ -> "com.amazonaws.forecast#ResourceInUseException"
    | `ResourceNotFoundException _ -> "com.amazonaws.forecast#ResourceNotFoundException"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "InvalidInputException" ->
          `InvalidInputException (Json_deserializers.invalid_input_exception_of_yojson tree path)
      | _, "ResourceInUseException" ->
          `ResourceInUseException (Json_deserializers.resource_in_use_exception_of_yojson tree path)
      | _, "ResourceNotFoundException" ->
          `ResourceNotFoundException
            (Json_deserializers.resource_not_found_exception_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : delete_what_if_forecast_request) =
    let input = Json_serializers.delete_what_if_forecast_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"AmazonForecast.DeleteWhatIfForecast" ~service
      ~context ~input ~output_deserializer:Smaws_Lib.Smithy_api.Json_deserializers.unit__of_yojson
      ~error_deserializer

  let request_with_metadata context (request : delete_what_if_forecast_request) =
    let input = Json_serializers.delete_what_if_forecast_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata
      ~shape_name:"AmazonForecast.DeleteWhatIfForecast" ~service ~context ~input
      ~output_deserializer:Smaws_Lib.Smithy_api.Json_deserializers.unit__of_yojson
      ~error_deserializer
end

module DeleteWhatIfForecastExport = struct
  let error_to_string = function
    | `InvalidInputException _ -> "com.amazonaws.forecast#InvalidInputException"
    | `ResourceInUseException _ -> "com.amazonaws.forecast#ResourceInUseException"
    | `ResourceNotFoundException _ -> "com.amazonaws.forecast#ResourceNotFoundException"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "InvalidInputException" ->
          `InvalidInputException (Json_deserializers.invalid_input_exception_of_yojson tree path)
      | _, "ResourceInUseException" ->
          `ResourceInUseException (Json_deserializers.resource_in_use_exception_of_yojson tree path)
      | _, "ResourceNotFoundException" ->
          `ResourceNotFoundException
            (Json_deserializers.resource_not_found_exception_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : delete_what_if_forecast_export_request) =
    let input = Json_serializers.delete_what_if_forecast_export_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"AmazonForecast.DeleteWhatIfForecastExport"
      ~service ~context ~input
      ~output_deserializer:Smaws_Lib.Smithy_api.Json_deserializers.unit__of_yojson
      ~error_deserializer

  let request_with_metadata context (request : delete_what_if_forecast_export_request) =
    let input = Json_serializers.delete_what_if_forecast_export_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata
      ~shape_name:"AmazonForecast.DeleteWhatIfForecastExport" ~service ~context ~input
      ~output_deserializer:Smaws_Lib.Smithy_api.Json_deserializers.unit__of_yojson
      ~error_deserializer
end

module DescribeAutoPredictor = struct
  let error_to_string = function
    | `InvalidInputException _ -> "com.amazonaws.forecast#InvalidInputException"
    | `ResourceNotFoundException _ -> "com.amazonaws.forecast#ResourceNotFoundException"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "InvalidInputException" ->
          `InvalidInputException (Json_deserializers.invalid_input_exception_of_yojson tree path)
      | _, "ResourceNotFoundException" ->
          `ResourceNotFoundException
            (Json_deserializers.resource_not_found_exception_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : describe_auto_predictor_request) =
    let input = Json_serializers.describe_auto_predictor_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"AmazonForecast.DescribeAutoPredictor" ~service
      ~context ~input
      ~output_deserializer:Json_deserializers.describe_auto_predictor_response_of_yojson
      ~error_deserializer

  let request_with_metadata context (request : describe_auto_predictor_request) =
    let input = Json_serializers.describe_auto_predictor_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata
      ~shape_name:"AmazonForecast.DescribeAutoPredictor" ~service ~context ~input
      ~output_deserializer:Json_deserializers.describe_auto_predictor_response_of_yojson
      ~error_deserializer
end

module DescribeDataset = struct
  let error_to_string = function
    | `InvalidInputException _ -> "com.amazonaws.forecast#InvalidInputException"
    | `ResourceNotFoundException _ -> "com.amazonaws.forecast#ResourceNotFoundException"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "InvalidInputException" ->
          `InvalidInputException (Json_deserializers.invalid_input_exception_of_yojson tree path)
      | _, "ResourceNotFoundException" ->
          `ResourceNotFoundException
            (Json_deserializers.resource_not_found_exception_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : describe_dataset_request) =
    let input = Json_serializers.describe_dataset_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"AmazonForecast.DescribeDataset" ~service
      ~context ~input ~output_deserializer:Json_deserializers.describe_dataset_response_of_yojson
      ~error_deserializer

  let request_with_metadata context (request : describe_dataset_request) =
    let input = Json_serializers.describe_dataset_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata ~shape_name:"AmazonForecast.DescribeDataset"
      ~service ~context ~input
      ~output_deserializer:Json_deserializers.describe_dataset_response_of_yojson
      ~error_deserializer
end

module DescribeDatasetGroup = struct
  let error_to_string = function
    | `InvalidInputException _ -> "com.amazonaws.forecast#InvalidInputException"
    | `ResourceNotFoundException _ -> "com.amazonaws.forecast#ResourceNotFoundException"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "InvalidInputException" ->
          `InvalidInputException (Json_deserializers.invalid_input_exception_of_yojson tree path)
      | _, "ResourceNotFoundException" ->
          `ResourceNotFoundException
            (Json_deserializers.resource_not_found_exception_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : describe_dataset_group_request) =
    let input = Json_serializers.describe_dataset_group_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"AmazonForecast.DescribeDatasetGroup" ~service
      ~context ~input
      ~output_deserializer:Json_deserializers.describe_dataset_group_response_of_yojson
      ~error_deserializer

  let request_with_metadata context (request : describe_dataset_group_request) =
    let input = Json_serializers.describe_dataset_group_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata
      ~shape_name:"AmazonForecast.DescribeDatasetGroup" ~service ~context ~input
      ~output_deserializer:Json_deserializers.describe_dataset_group_response_of_yojson
      ~error_deserializer
end

module DescribeDatasetImportJob = struct
  let error_to_string = function
    | `InvalidInputException _ -> "com.amazonaws.forecast#InvalidInputException"
    | `ResourceNotFoundException _ -> "com.amazonaws.forecast#ResourceNotFoundException"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "InvalidInputException" ->
          `InvalidInputException (Json_deserializers.invalid_input_exception_of_yojson tree path)
      | _, "ResourceNotFoundException" ->
          `ResourceNotFoundException
            (Json_deserializers.resource_not_found_exception_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : describe_dataset_import_job_request) =
    let input = Json_serializers.describe_dataset_import_job_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"AmazonForecast.DescribeDatasetImportJob"
      ~service ~context ~input
      ~output_deserializer:Json_deserializers.describe_dataset_import_job_response_of_yojson
      ~error_deserializer

  let request_with_metadata context (request : describe_dataset_import_job_request) =
    let input = Json_serializers.describe_dataset_import_job_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata
      ~shape_name:"AmazonForecast.DescribeDatasetImportJob" ~service ~context ~input
      ~output_deserializer:Json_deserializers.describe_dataset_import_job_response_of_yojson
      ~error_deserializer
end

module DescribeExplainability = struct
  let error_to_string = function
    | `InvalidInputException _ -> "com.amazonaws.forecast#InvalidInputException"
    | `ResourceNotFoundException _ -> "com.amazonaws.forecast#ResourceNotFoundException"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "InvalidInputException" ->
          `InvalidInputException (Json_deserializers.invalid_input_exception_of_yojson tree path)
      | _, "ResourceNotFoundException" ->
          `ResourceNotFoundException
            (Json_deserializers.resource_not_found_exception_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : describe_explainability_request) =
    let input = Json_serializers.describe_explainability_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"AmazonForecast.DescribeExplainability" ~service
      ~context ~input
      ~output_deserializer:Json_deserializers.describe_explainability_response_of_yojson
      ~error_deserializer

  let request_with_metadata context (request : describe_explainability_request) =
    let input = Json_serializers.describe_explainability_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata
      ~shape_name:"AmazonForecast.DescribeExplainability" ~service ~context ~input
      ~output_deserializer:Json_deserializers.describe_explainability_response_of_yojson
      ~error_deserializer
end

module DescribeExplainabilityExport = struct
  let error_to_string = function
    | `InvalidInputException _ -> "com.amazonaws.forecast#InvalidInputException"
    | `ResourceNotFoundException _ -> "com.amazonaws.forecast#ResourceNotFoundException"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "InvalidInputException" ->
          `InvalidInputException (Json_deserializers.invalid_input_exception_of_yojson tree path)
      | _, "ResourceNotFoundException" ->
          `ResourceNotFoundException
            (Json_deserializers.resource_not_found_exception_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : describe_explainability_export_request) =
    let input = Json_serializers.describe_explainability_export_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"AmazonForecast.DescribeExplainabilityExport"
      ~service ~context ~input
      ~output_deserializer:Json_deserializers.describe_explainability_export_response_of_yojson
      ~error_deserializer

  let request_with_metadata context (request : describe_explainability_export_request) =
    let input = Json_serializers.describe_explainability_export_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata
      ~shape_name:"AmazonForecast.DescribeExplainabilityExport" ~service ~context ~input
      ~output_deserializer:Json_deserializers.describe_explainability_export_response_of_yojson
      ~error_deserializer
end

module DescribeForecast = struct
  let error_to_string = function
    | `InvalidInputException _ -> "com.amazonaws.forecast#InvalidInputException"
    | `ResourceNotFoundException _ -> "com.amazonaws.forecast#ResourceNotFoundException"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "InvalidInputException" ->
          `InvalidInputException (Json_deserializers.invalid_input_exception_of_yojson tree path)
      | _, "ResourceNotFoundException" ->
          `ResourceNotFoundException
            (Json_deserializers.resource_not_found_exception_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : describe_forecast_request) =
    let input = Json_serializers.describe_forecast_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"AmazonForecast.DescribeForecast" ~service
      ~context ~input ~output_deserializer:Json_deserializers.describe_forecast_response_of_yojson
      ~error_deserializer

  let request_with_metadata context (request : describe_forecast_request) =
    let input = Json_serializers.describe_forecast_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata ~shape_name:"AmazonForecast.DescribeForecast"
      ~service ~context ~input
      ~output_deserializer:Json_deserializers.describe_forecast_response_of_yojson
      ~error_deserializer
end

module DescribeForecastExportJob = struct
  let error_to_string = function
    | `InvalidInputException _ -> "com.amazonaws.forecast#InvalidInputException"
    | `ResourceNotFoundException _ -> "com.amazonaws.forecast#ResourceNotFoundException"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "InvalidInputException" ->
          `InvalidInputException (Json_deserializers.invalid_input_exception_of_yojson tree path)
      | _, "ResourceNotFoundException" ->
          `ResourceNotFoundException
            (Json_deserializers.resource_not_found_exception_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : describe_forecast_export_job_request) =
    let input = Json_serializers.describe_forecast_export_job_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"AmazonForecast.DescribeForecastExportJob"
      ~service ~context ~input
      ~output_deserializer:Json_deserializers.describe_forecast_export_job_response_of_yojson
      ~error_deserializer

  let request_with_metadata context (request : describe_forecast_export_job_request) =
    let input = Json_serializers.describe_forecast_export_job_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata
      ~shape_name:"AmazonForecast.DescribeForecastExportJob" ~service ~context ~input
      ~output_deserializer:Json_deserializers.describe_forecast_export_job_response_of_yojson
      ~error_deserializer
end

module DescribeMonitor = struct
  let error_to_string = function
    | `InvalidInputException _ -> "com.amazonaws.forecast#InvalidInputException"
    | `ResourceNotFoundException _ -> "com.amazonaws.forecast#ResourceNotFoundException"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "InvalidInputException" ->
          `InvalidInputException (Json_deserializers.invalid_input_exception_of_yojson tree path)
      | _, "ResourceNotFoundException" ->
          `ResourceNotFoundException
            (Json_deserializers.resource_not_found_exception_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : describe_monitor_request) =
    let input = Json_serializers.describe_monitor_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"AmazonForecast.DescribeMonitor" ~service
      ~context ~input ~output_deserializer:Json_deserializers.describe_monitor_response_of_yojson
      ~error_deserializer

  let request_with_metadata context (request : describe_monitor_request) =
    let input = Json_serializers.describe_monitor_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata ~shape_name:"AmazonForecast.DescribeMonitor"
      ~service ~context ~input
      ~output_deserializer:Json_deserializers.describe_monitor_response_of_yojson
      ~error_deserializer
end

module DescribePredictor = struct
  let error_to_string = function
    | `InvalidInputException _ -> "com.amazonaws.forecast#InvalidInputException"
    | `ResourceNotFoundException _ -> "com.amazonaws.forecast#ResourceNotFoundException"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "InvalidInputException" ->
          `InvalidInputException (Json_deserializers.invalid_input_exception_of_yojson tree path)
      | _, "ResourceNotFoundException" ->
          `ResourceNotFoundException
            (Json_deserializers.resource_not_found_exception_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : describe_predictor_request) =
    let input = Json_serializers.describe_predictor_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"AmazonForecast.DescribePredictor" ~service
      ~context ~input ~output_deserializer:Json_deserializers.describe_predictor_response_of_yojson
      ~error_deserializer

  let request_with_metadata context (request : describe_predictor_request) =
    let input = Json_serializers.describe_predictor_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata ~shape_name:"AmazonForecast.DescribePredictor"
      ~service ~context ~input
      ~output_deserializer:Json_deserializers.describe_predictor_response_of_yojson
      ~error_deserializer
end

module DescribePredictorBacktestExportJob = struct
  let error_to_string = function
    | `InvalidInputException _ -> "com.amazonaws.forecast#InvalidInputException"
    | `ResourceNotFoundException _ -> "com.amazonaws.forecast#ResourceNotFoundException"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "InvalidInputException" ->
          `InvalidInputException (Json_deserializers.invalid_input_exception_of_yojson tree path)
      | _, "ResourceNotFoundException" ->
          `ResourceNotFoundException
            (Json_deserializers.resource_not_found_exception_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : describe_predictor_backtest_export_job_request) =
    let input = Json_serializers.describe_predictor_backtest_export_job_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request
      ~shape_name:"AmazonForecast.DescribePredictorBacktestExportJob" ~service ~context ~input
      ~output_deserializer:
        Json_deserializers.describe_predictor_backtest_export_job_response_of_yojson
      ~error_deserializer

  let request_with_metadata context (request : describe_predictor_backtest_export_job_request) =
    let input = Json_serializers.describe_predictor_backtest_export_job_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata
      ~shape_name:"AmazonForecast.DescribePredictorBacktestExportJob" ~service ~context ~input
      ~output_deserializer:
        Json_deserializers.describe_predictor_backtest_export_job_response_of_yojson
      ~error_deserializer
end

module DescribeWhatIfAnalysis = struct
  let error_to_string = function
    | `InvalidInputException _ -> "com.amazonaws.forecast#InvalidInputException"
    | `ResourceNotFoundException _ -> "com.amazonaws.forecast#ResourceNotFoundException"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "InvalidInputException" ->
          `InvalidInputException (Json_deserializers.invalid_input_exception_of_yojson tree path)
      | _, "ResourceNotFoundException" ->
          `ResourceNotFoundException
            (Json_deserializers.resource_not_found_exception_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : describe_what_if_analysis_request) =
    let input = Json_serializers.describe_what_if_analysis_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"AmazonForecast.DescribeWhatIfAnalysis" ~service
      ~context ~input
      ~output_deserializer:Json_deserializers.describe_what_if_analysis_response_of_yojson
      ~error_deserializer

  let request_with_metadata context (request : describe_what_if_analysis_request) =
    let input = Json_serializers.describe_what_if_analysis_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata
      ~shape_name:"AmazonForecast.DescribeWhatIfAnalysis" ~service ~context ~input
      ~output_deserializer:Json_deserializers.describe_what_if_analysis_response_of_yojson
      ~error_deserializer
end

module DescribeWhatIfForecast = struct
  let error_to_string = function
    | `InvalidInputException _ -> "com.amazonaws.forecast#InvalidInputException"
    | `ResourceNotFoundException _ -> "com.amazonaws.forecast#ResourceNotFoundException"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "InvalidInputException" ->
          `InvalidInputException (Json_deserializers.invalid_input_exception_of_yojson tree path)
      | _, "ResourceNotFoundException" ->
          `ResourceNotFoundException
            (Json_deserializers.resource_not_found_exception_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : describe_what_if_forecast_request) =
    let input = Json_serializers.describe_what_if_forecast_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"AmazonForecast.DescribeWhatIfForecast" ~service
      ~context ~input
      ~output_deserializer:Json_deserializers.describe_what_if_forecast_response_of_yojson
      ~error_deserializer

  let request_with_metadata context (request : describe_what_if_forecast_request) =
    let input = Json_serializers.describe_what_if_forecast_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata
      ~shape_name:"AmazonForecast.DescribeWhatIfForecast" ~service ~context ~input
      ~output_deserializer:Json_deserializers.describe_what_if_forecast_response_of_yojson
      ~error_deserializer
end

module DescribeWhatIfForecastExport = struct
  let error_to_string = function
    | `InvalidInputException _ -> "com.amazonaws.forecast#InvalidInputException"
    | `ResourceNotFoundException _ -> "com.amazonaws.forecast#ResourceNotFoundException"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "InvalidInputException" ->
          `InvalidInputException (Json_deserializers.invalid_input_exception_of_yojson tree path)
      | _, "ResourceNotFoundException" ->
          `ResourceNotFoundException
            (Json_deserializers.resource_not_found_exception_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : describe_what_if_forecast_export_request) =
    let input = Json_serializers.describe_what_if_forecast_export_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"AmazonForecast.DescribeWhatIfForecastExport"
      ~service ~context ~input
      ~output_deserializer:Json_deserializers.describe_what_if_forecast_export_response_of_yojson
      ~error_deserializer

  let request_with_metadata context (request : describe_what_if_forecast_export_request) =
    let input = Json_serializers.describe_what_if_forecast_export_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata
      ~shape_name:"AmazonForecast.DescribeWhatIfForecastExport" ~service ~context ~input
      ~output_deserializer:Json_deserializers.describe_what_if_forecast_export_response_of_yojson
      ~error_deserializer
end

module GetAccuracyMetrics = struct
  let error_to_string = function
    | `InvalidInputException _ -> "com.amazonaws.forecast#InvalidInputException"
    | `ResourceInUseException _ -> "com.amazonaws.forecast#ResourceInUseException"
    | `ResourceNotFoundException _ -> "com.amazonaws.forecast#ResourceNotFoundException"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "InvalidInputException" ->
          `InvalidInputException (Json_deserializers.invalid_input_exception_of_yojson tree path)
      | _, "ResourceInUseException" ->
          `ResourceInUseException (Json_deserializers.resource_in_use_exception_of_yojson tree path)
      | _, "ResourceNotFoundException" ->
          `ResourceNotFoundException
            (Json_deserializers.resource_not_found_exception_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : get_accuracy_metrics_request) =
    let input = Json_serializers.get_accuracy_metrics_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"AmazonForecast.GetAccuracyMetrics" ~service
      ~context ~input
      ~output_deserializer:Json_deserializers.get_accuracy_metrics_response_of_yojson
      ~error_deserializer

  let request_with_metadata context (request : get_accuracy_metrics_request) =
    let input = Json_serializers.get_accuracy_metrics_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata
      ~shape_name:"AmazonForecast.GetAccuracyMetrics" ~service ~context ~input
      ~output_deserializer:Json_deserializers.get_accuracy_metrics_response_of_yojson
      ~error_deserializer
end

module ListDatasetGroups = struct
  let error_to_string = function
    | `InvalidNextTokenException _ -> "com.amazonaws.forecast#InvalidNextTokenException"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "InvalidNextTokenException" ->
          `InvalidNextTokenException
            (Json_deserializers.invalid_next_token_exception_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : list_dataset_groups_request) =
    let input = Json_serializers.list_dataset_groups_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"AmazonForecast.ListDatasetGroups" ~service
      ~context ~input ~output_deserializer:Json_deserializers.list_dataset_groups_response_of_yojson
      ~error_deserializer

  let request_with_metadata context (request : list_dataset_groups_request) =
    let input = Json_serializers.list_dataset_groups_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata ~shape_name:"AmazonForecast.ListDatasetGroups"
      ~service ~context ~input
      ~output_deserializer:Json_deserializers.list_dataset_groups_response_of_yojson
      ~error_deserializer
end

module ListDatasetImportJobs = struct
  let error_to_string = function
    | `InvalidInputException _ -> "com.amazonaws.forecast#InvalidInputException"
    | `InvalidNextTokenException _ -> "com.amazonaws.forecast#InvalidNextTokenException"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "InvalidInputException" ->
          `InvalidInputException (Json_deserializers.invalid_input_exception_of_yojson tree path)
      | _, "InvalidNextTokenException" ->
          `InvalidNextTokenException
            (Json_deserializers.invalid_next_token_exception_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : list_dataset_import_jobs_request) =
    let input = Json_serializers.list_dataset_import_jobs_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"AmazonForecast.ListDatasetImportJobs" ~service
      ~context ~input
      ~output_deserializer:Json_deserializers.list_dataset_import_jobs_response_of_yojson
      ~error_deserializer

  let request_with_metadata context (request : list_dataset_import_jobs_request) =
    let input = Json_serializers.list_dataset_import_jobs_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata
      ~shape_name:"AmazonForecast.ListDatasetImportJobs" ~service ~context ~input
      ~output_deserializer:Json_deserializers.list_dataset_import_jobs_response_of_yojson
      ~error_deserializer
end

module ListDatasets = struct
  let error_to_string = function
    | `InvalidNextTokenException _ -> "com.amazonaws.forecast#InvalidNextTokenException"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "InvalidNextTokenException" ->
          `InvalidNextTokenException
            (Json_deserializers.invalid_next_token_exception_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : list_datasets_request) =
    let input = Json_serializers.list_datasets_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"AmazonForecast.ListDatasets" ~service ~context
      ~input ~output_deserializer:Json_deserializers.list_datasets_response_of_yojson
      ~error_deserializer

  let request_with_metadata context (request : list_datasets_request) =
    let input = Json_serializers.list_datasets_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata ~shape_name:"AmazonForecast.ListDatasets"
      ~service ~context ~input
      ~output_deserializer:Json_deserializers.list_datasets_response_of_yojson ~error_deserializer
end

module ListExplainabilities = struct
  let error_to_string = function
    | `InvalidInputException _ -> "com.amazonaws.forecast#InvalidInputException"
    | `InvalidNextTokenException _ -> "com.amazonaws.forecast#InvalidNextTokenException"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "InvalidInputException" ->
          `InvalidInputException (Json_deserializers.invalid_input_exception_of_yojson tree path)
      | _, "InvalidNextTokenException" ->
          `InvalidNextTokenException
            (Json_deserializers.invalid_next_token_exception_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : list_explainabilities_request) =
    let input = Json_serializers.list_explainabilities_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"AmazonForecast.ListExplainabilities" ~service
      ~context ~input
      ~output_deserializer:Json_deserializers.list_explainabilities_response_of_yojson
      ~error_deserializer

  let request_with_metadata context (request : list_explainabilities_request) =
    let input = Json_serializers.list_explainabilities_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata
      ~shape_name:"AmazonForecast.ListExplainabilities" ~service ~context ~input
      ~output_deserializer:Json_deserializers.list_explainabilities_response_of_yojson
      ~error_deserializer
end

module ListExplainabilityExports = struct
  let error_to_string = function
    | `InvalidInputException _ -> "com.amazonaws.forecast#InvalidInputException"
    | `InvalidNextTokenException _ -> "com.amazonaws.forecast#InvalidNextTokenException"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "InvalidInputException" ->
          `InvalidInputException (Json_deserializers.invalid_input_exception_of_yojson tree path)
      | _, "InvalidNextTokenException" ->
          `InvalidNextTokenException
            (Json_deserializers.invalid_next_token_exception_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : list_explainability_exports_request) =
    let input = Json_serializers.list_explainability_exports_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"AmazonForecast.ListExplainabilityExports"
      ~service ~context ~input
      ~output_deserializer:Json_deserializers.list_explainability_exports_response_of_yojson
      ~error_deserializer

  let request_with_metadata context (request : list_explainability_exports_request) =
    let input = Json_serializers.list_explainability_exports_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata
      ~shape_name:"AmazonForecast.ListExplainabilityExports" ~service ~context ~input
      ~output_deserializer:Json_deserializers.list_explainability_exports_response_of_yojson
      ~error_deserializer
end

module ListForecastExportJobs = struct
  let error_to_string = function
    | `InvalidInputException _ -> "com.amazonaws.forecast#InvalidInputException"
    | `InvalidNextTokenException _ -> "com.amazonaws.forecast#InvalidNextTokenException"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "InvalidInputException" ->
          `InvalidInputException (Json_deserializers.invalid_input_exception_of_yojson tree path)
      | _, "InvalidNextTokenException" ->
          `InvalidNextTokenException
            (Json_deserializers.invalid_next_token_exception_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : list_forecast_export_jobs_request) =
    let input = Json_serializers.list_forecast_export_jobs_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"AmazonForecast.ListForecastExportJobs" ~service
      ~context ~input
      ~output_deserializer:Json_deserializers.list_forecast_export_jobs_response_of_yojson
      ~error_deserializer

  let request_with_metadata context (request : list_forecast_export_jobs_request) =
    let input = Json_serializers.list_forecast_export_jobs_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata
      ~shape_name:"AmazonForecast.ListForecastExportJobs" ~service ~context ~input
      ~output_deserializer:Json_deserializers.list_forecast_export_jobs_response_of_yojson
      ~error_deserializer
end

module ListForecasts = struct
  let error_to_string = function
    | `InvalidInputException _ -> "com.amazonaws.forecast#InvalidInputException"
    | `InvalidNextTokenException _ -> "com.amazonaws.forecast#InvalidNextTokenException"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "InvalidInputException" ->
          `InvalidInputException (Json_deserializers.invalid_input_exception_of_yojson tree path)
      | _, "InvalidNextTokenException" ->
          `InvalidNextTokenException
            (Json_deserializers.invalid_next_token_exception_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : list_forecasts_request) =
    let input = Json_serializers.list_forecasts_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"AmazonForecast.ListForecasts" ~service ~context
      ~input ~output_deserializer:Json_deserializers.list_forecasts_response_of_yojson
      ~error_deserializer

  let request_with_metadata context (request : list_forecasts_request) =
    let input = Json_serializers.list_forecasts_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata ~shape_name:"AmazonForecast.ListForecasts"
      ~service ~context ~input
      ~output_deserializer:Json_deserializers.list_forecasts_response_of_yojson ~error_deserializer
end

module ListMonitorEvaluations = struct
  let error_to_string = function
    | `InvalidInputException _ -> "com.amazonaws.forecast#InvalidInputException"
    | `InvalidNextTokenException _ -> "com.amazonaws.forecast#InvalidNextTokenException"
    | `ResourceNotFoundException _ -> "com.amazonaws.forecast#ResourceNotFoundException"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "InvalidInputException" ->
          `InvalidInputException (Json_deserializers.invalid_input_exception_of_yojson tree path)
      | _, "InvalidNextTokenException" ->
          `InvalidNextTokenException
            (Json_deserializers.invalid_next_token_exception_of_yojson tree path)
      | _, "ResourceNotFoundException" ->
          `ResourceNotFoundException
            (Json_deserializers.resource_not_found_exception_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : list_monitor_evaluations_request) =
    let input = Json_serializers.list_monitor_evaluations_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"AmazonForecast.ListMonitorEvaluations" ~service
      ~context ~input
      ~output_deserializer:Json_deserializers.list_monitor_evaluations_response_of_yojson
      ~error_deserializer

  let request_with_metadata context (request : list_monitor_evaluations_request) =
    let input = Json_serializers.list_monitor_evaluations_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata
      ~shape_name:"AmazonForecast.ListMonitorEvaluations" ~service ~context ~input
      ~output_deserializer:Json_deserializers.list_monitor_evaluations_response_of_yojson
      ~error_deserializer
end

module ListMonitors = struct
  let error_to_string = function
    | `InvalidInputException _ -> "com.amazonaws.forecast#InvalidInputException"
    | `InvalidNextTokenException _ -> "com.amazonaws.forecast#InvalidNextTokenException"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "InvalidInputException" ->
          `InvalidInputException (Json_deserializers.invalid_input_exception_of_yojson tree path)
      | _, "InvalidNextTokenException" ->
          `InvalidNextTokenException
            (Json_deserializers.invalid_next_token_exception_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : list_monitors_request) =
    let input = Json_serializers.list_monitors_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"AmazonForecast.ListMonitors" ~service ~context
      ~input ~output_deserializer:Json_deserializers.list_monitors_response_of_yojson
      ~error_deserializer

  let request_with_metadata context (request : list_monitors_request) =
    let input = Json_serializers.list_monitors_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata ~shape_name:"AmazonForecast.ListMonitors"
      ~service ~context ~input
      ~output_deserializer:Json_deserializers.list_monitors_response_of_yojson ~error_deserializer
end

module ListPredictorBacktestExportJobs = struct
  let error_to_string = function
    | `InvalidInputException _ -> "com.amazonaws.forecast#InvalidInputException"
    | `InvalidNextTokenException _ -> "com.amazonaws.forecast#InvalidNextTokenException"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "InvalidInputException" ->
          `InvalidInputException (Json_deserializers.invalid_input_exception_of_yojson tree path)
      | _, "InvalidNextTokenException" ->
          `InvalidNextTokenException
            (Json_deserializers.invalid_next_token_exception_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : list_predictor_backtest_export_jobs_request) =
    let input = Json_serializers.list_predictor_backtest_export_jobs_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"AmazonForecast.ListPredictorBacktestExportJobs"
      ~service ~context ~input
      ~output_deserializer:Json_deserializers.list_predictor_backtest_export_jobs_response_of_yojson
      ~error_deserializer

  let request_with_metadata context (request : list_predictor_backtest_export_jobs_request) =
    let input = Json_serializers.list_predictor_backtest_export_jobs_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata
      ~shape_name:"AmazonForecast.ListPredictorBacktestExportJobs" ~service ~context ~input
      ~output_deserializer:Json_deserializers.list_predictor_backtest_export_jobs_response_of_yojson
      ~error_deserializer
end

module ListPredictors = struct
  let error_to_string = function
    | `InvalidInputException _ -> "com.amazonaws.forecast#InvalidInputException"
    | `InvalidNextTokenException _ -> "com.amazonaws.forecast#InvalidNextTokenException"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "InvalidInputException" ->
          `InvalidInputException (Json_deserializers.invalid_input_exception_of_yojson tree path)
      | _, "InvalidNextTokenException" ->
          `InvalidNextTokenException
            (Json_deserializers.invalid_next_token_exception_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : list_predictors_request) =
    let input = Json_serializers.list_predictors_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"AmazonForecast.ListPredictors" ~service
      ~context ~input ~output_deserializer:Json_deserializers.list_predictors_response_of_yojson
      ~error_deserializer

  let request_with_metadata context (request : list_predictors_request) =
    let input = Json_serializers.list_predictors_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata ~shape_name:"AmazonForecast.ListPredictors"
      ~service ~context ~input
      ~output_deserializer:Json_deserializers.list_predictors_response_of_yojson ~error_deserializer
end

module ListTagsForResource = struct
  let error_to_string = function
    | `InvalidInputException _ -> "com.amazonaws.forecast#InvalidInputException"
    | `ResourceNotFoundException _ -> "com.amazonaws.forecast#ResourceNotFoundException"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "InvalidInputException" ->
          `InvalidInputException (Json_deserializers.invalid_input_exception_of_yojson tree path)
      | _, "ResourceNotFoundException" ->
          `ResourceNotFoundException
            (Json_deserializers.resource_not_found_exception_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : list_tags_for_resource_request) =
    let input = Json_serializers.list_tags_for_resource_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"AmazonForecast.ListTagsForResource" ~service
      ~context ~input
      ~output_deserializer:Json_deserializers.list_tags_for_resource_response_of_yojson
      ~error_deserializer

  let request_with_metadata context (request : list_tags_for_resource_request) =
    let input = Json_serializers.list_tags_for_resource_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata
      ~shape_name:"AmazonForecast.ListTagsForResource" ~service ~context ~input
      ~output_deserializer:Json_deserializers.list_tags_for_resource_response_of_yojson
      ~error_deserializer
end

module ListWhatIfAnalyses = struct
  let error_to_string = function
    | `InvalidInputException _ -> "com.amazonaws.forecast#InvalidInputException"
    | `InvalidNextTokenException _ -> "com.amazonaws.forecast#InvalidNextTokenException"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "InvalidInputException" ->
          `InvalidInputException (Json_deserializers.invalid_input_exception_of_yojson tree path)
      | _, "InvalidNextTokenException" ->
          `InvalidNextTokenException
            (Json_deserializers.invalid_next_token_exception_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : list_what_if_analyses_request) =
    let input = Json_serializers.list_what_if_analyses_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"AmazonForecast.ListWhatIfAnalyses" ~service
      ~context ~input
      ~output_deserializer:Json_deserializers.list_what_if_analyses_response_of_yojson
      ~error_deserializer

  let request_with_metadata context (request : list_what_if_analyses_request) =
    let input = Json_serializers.list_what_if_analyses_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata
      ~shape_name:"AmazonForecast.ListWhatIfAnalyses" ~service ~context ~input
      ~output_deserializer:Json_deserializers.list_what_if_analyses_response_of_yojson
      ~error_deserializer
end

module ListWhatIfForecastExports = struct
  let error_to_string = function
    | `InvalidInputException _ -> "com.amazonaws.forecast#InvalidInputException"
    | `InvalidNextTokenException _ -> "com.amazonaws.forecast#InvalidNextTokenException"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "InvalidInputException" ->
          `InvalidInputException (Json_deserializers.invalid_input_exception_of_yojson tree path)
      | _, "InvalidNextTokenException" ->
          `InvalidNextTokenException
            (Json_deserializers.invalid_next_token_exception_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : list_what_if_forecast_exports_request) =
    let input = Json_serializers.list_what_if_forecast_exports_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"AmazonForecast.ListWhatIfForecastExports"
      ~service ~context ~input
      ~output_deserializer:Json_deserializers.list_what_if_forecast_exports_response_of_yojson
      ~error_deserializer

  let request_with_metadata context (request : list_what_if_forecast_exports_request) =
    let input = Json_serializers.list_what_if_forecast_exports_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata
      ~shape_name:"AmazonForecast.ListWhatIfForecastExports" ~service ~context ~input
      ~output_deserializer:Json_deserializers.list_what_if_forecast_exports_response_of_yojson
      ~error_deserializer
end

module ListWhatIfForecasts = struct
  let error_to_string = function
    | `InvalidInputException _ -> "com.amazonaws.forecast#InvalidInputException"
    | `InvalidNextTokenException _ -> "com.amazonaws.forecast#InvalidNextTokenException"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "InvalidInputException" ->
          `InvalidInputException (Json_deserializers.invalid_input_exception_of_yojson tree path)
      | _, "InvalidNextTokenException" ->
          `InvalidNextTokenException
            (Json_deserializers.invalid_next_token_exception_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : list_what_if_forecasts_request) =
    let input = Json_serializers.list_what_if_forecasts_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"AmazonForecast.ListWhatIfForecasts" ~service
      ~context ~input
      ~output_deserializer:Json_deserializers.list_what_if_forecasts_response_of_yojson
      ~error_deserializer

  let request_with_metadata context (request : list_what_if_forecasts_request) =
    let input = Json_serializers.list_what_if_forecasts_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata
      ~shape_name:"AmazonForecast.ListWhatIfForecasts" ~service ~context ~input
      ~output_deserializer:Json_deserializers.list_what_if_forecasts_response_of_yojson
      ~error_deserializer
end

module ResumeResource = struct
  let error_to_string = function
    | `InvalidInputException _ -> "com.amazonaws.forecast#InvalidInputException"
    | `LimitExceededException _ -> "com.amazonaws.forecast#LimitExceededException"
    | `ResourceInUseException _ -> "com.amazonaws.forecast#ResourceInUseException"
    | `ResourceNotFoundException _ -> "com.amazonaws.forecast#ResourceNotFoundException"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "InvalidInputException" ->
          `InvalidInputException (Json_deserializers.invalid_input_exception_of_yojson tree path)
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

  let request context (request : resume_resource_request) =
    let input = Json_serializers.resume_resource_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"AmazonForecast.ResumeResource" ~service
      ~context ~input ~output_deserializer:Smaws_Lib.Smithy_api.Json_deserializers.unit__of_yojson
      ~error_deserializer

  let request_with_metadata context (request : resume_resource_request) =
    let input = Json_serializers.resume_resource_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata ~shape_name:"AmazonForecast.ResumeResource"
      ~service ~context ~input
      ~output_deserializer:Smaws_Lib.Smithy_api.Json_deserializers.unit__of_yojson
      ~error_deserializer
end

module StopResource = struct
  let error_to_string = function
    | `InvalidInputException _ -> "com.amazonaws.forecast#InvalidInputException"
    | `LimitExceededException _ -> "com.amazonaws.forecast#LimitExceededException"
    | `ResourceNotFoundException _ -> "com.amazonaws.forecast#ResourceNotFoundException"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "InvalidInputException" ->
          `InvalidInputException (Json_deserializers.invalid_input_exception_of_yojson tree path)
      | _, "LimitExceededException" ->
          `LimitExceededException (Json_deserializers.limit_exceeded_exception_of_yojson tree path)
      | _, "ResourceNotFoundException" ->
          `ResourceNotFoundException
            (Json_deserializers.resource_not_found_exception_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : stop_resource_request) =
    let input = Json_serializers.stop_resource_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"AmazonForecast.StopResource" ~service ~context
      ~input ~output_deserializer:Smaws_Lib.Smithy_api.Json_deserializers.unit__of_yojson
      ~error_deserializer

  let request_with_metadata context (request : stop_resource_request) =
    let input = Json_serializers.stop_resource_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata ~shape_name:"AmazonForecast.StopResource"
      ~service ~context ~input
      ~output_deserializer:Smaws_Lib.Smithy_api.Json_deserializers.unit__of_yojson
      ~error_deserializer
end

module TagResource = struct
  let error_to_string = function
    | `InvalidInputException _ -> "com.amazonaws.forecast#InvalidInputException"
    | `LimitExceededException _ -> "com.amazonaws.forecast#LimitExceededException"
    | `ResourceNotFoundException _ -> "com.amazonaws.forecast#ResourceNotFoundException"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "InvalidInputException" ->
          `InvalidInputException (Json_deserializers.invalid_input_exception_of_yojson tree path)
      | _, "LimitExceededException" ->
          `LimitExceededException (Json_deserializers.limit_exceeded_exception_of_yojson tree path)
      | _, "ResourceNotFoundException" ->
          `ResourceNotFoundException
            (Json_deserializers.resource_not_found_exception_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : tag_resource_request) =
    let input = Json_serializers.tag_resource_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"AmazonForecast.TagResource" ~service ~context
      ~input ~output_deserializer:Json_deserializers.tag_resource_response_of_yojson
      ~error_deserializer

  let request_with_metadata context (request : tag_resource_request) =
    let input = Json_serializers.tag_resource_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata ~shape_name:"AmazonForecast.TagResource"
      ~service ~context ~input
      ~output_deserializer:Json_deserializers.tag_resource_response_of_yojson ~error_deserializer
end

module UntagResource = struct
  let error_to_string = function
    | `InvalidInputException _ -> "com.amazonaws.forecast#InvalidInputException"
    | `ResourceNotFoundException _ -> "com.amazonaws.forecast#ResourceNotFoundException"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "InvalidInputException" ->
          `InvalidInputException (Json_deserializers.invalid_input_exception_of_yojson tree path)
      | _, "ResourceNotFoundException" ->
          `ResourceNotFoundException
            (Json_deserializers.resource_not_found_exception_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : untag_resource_request) =
    let input = Json_serializers.untag_resource_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"AmazonForecast.UntagResource" ~service ~context
      ~input ~output_deserializer:Json_deserializers.untag_resource_response_of_yojson
      ~error_deserializer

  let request_with_metadata context (request : untag_resource_request) =
    let input = Json_serializers.untag_resource_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata ~shape_name:"AmazonForecast.UntagResource"
      ~service ~context ~input
      ~output_deserializer:Json_deserializers.untag_resource_response_of_yojson ~error_deserializer
end

module UpdateDatasetGroup = struct
  let error_to_string = function
    | `InvalidInputException _ -> "com.amazonaws.forecast#InvalidInputException"
    | `ResourceInUseException _ -> "com.amazonaws.forecast#ResourceInUseException"
    | `ResourceNotFoundException _ -> "com.amazonaws.forecast#ResourceNotFoundException"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "InvalidInputException" ->
          `InvalidInputException (Json_deserializers.invalid_input_exception_of_yojson tree path)
      | _, "ResourceInUseException" ->
          `ResourceInUseException (Json_deserializers.resource_in_use_exception_of_yojson tree path)
      | _, "ResourceNotFoundException" ->
          `ResourceNotFoundException
            (Json_deserializers.resource_not_found_exception_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : update_dataset_group_request) =
    let input = Json_serializers.update_dataset_group_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"AmazonForecast.UpdateDatasetGroup" ~service
      ~context ~input
      ~output_deserializer:Json_deserializers.update_dataset_group_response_of_yojson
      ~error_deserializer

  let request_with_metadata context (request : update_dataset_group_request) =
    let input = Json_serializers.update_dataset_group_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata
      ~shape_name:"AmazonForecast.UpdateDatasetGroup" ~service ~context ~input
      ~output_deserializer:Json_deserializers.update_dataset_group_response_of_yojson
      ~error_deserializer
end
