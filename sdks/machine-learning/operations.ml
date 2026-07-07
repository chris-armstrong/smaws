open Types
open Service_metadata

module AddTags = struct
  let error_to_string = function
    | `InternalServerException _ -> "com.amazonaws.machinelearning#InternalServerException"
    | `InvalidInputException _ -> "com.amazonaws.machinelearning#InvalidInputException"
    | `InvalidTagException _ -> "com.amazonaws.machinelearning#InvalidTagException"
    | `ResourceNotFoundException _ -> "com.amazonaws.machinelearning#ResourceNotFoundException"
    | `TagLimitExceededException _ -> "com.amazonaws.machinelearning#TagLimitExceededException"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "InternalServerException" ->
          `InternalServerException
            (Json_deserializers.internal_server_exception_of_yojson tree path)
      | _, "InvalidInputException" ->
          `InvalidInputException (Json_deserializers.invalid_input_exception_of_yojson tree path)
      | _, "InvalidTagException" ->
          `InvalidTagException (Json_deserializers.invalid_tag_exception_of_yojson tree path)
      | _, "ResourceNotFoundException" ->
          `ResourceNotFoundException
            (Json_deserializers.resource_not_found_exception_of_yojson tree path)
      | _, "TagLimitExceededException" ->
          `TagLimitExceededException
            (Json_deserializers.tag_limit_exceeded_exception_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : add_tags_input) =
    let input = Json_serializers.add_tags_input_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"AmazonML_20141212.AddTags" ~service ~context
      ~input ~output_deserializer:Json_deserializers.add_tags_output_of_yojson ~error_deserializer

  let request_with_metadata context (request : add_tags_input) =
    let input = Json_serializers.add_tags_input_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata ~shape_name:"AmazonML_20141212.AddTags"
      ~service ~context ~input ~output_deserializer:Json_deserializers.add_tags_output_of_yojson
      ~error_deserializer
end

module CreateBatchPrediction = struct
  let error_to_string = function
    | `IdempotentParameterMismatchException _ ->
        "com.amazonaws.machinelearning#IdempotentParameterMismatchException"
    | `InternalServerException _ -> "com.amazonaws.machinelearning#InternalServerException"
    | `InvalidInputException _ -> "com.amazonaws.machinelearning#InvalidInputException"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "IdempotentParameterMismatchException" ->
          `IdempotentParameterMismatchException
            (Json_deserializers.idempotent_parameter_mismatch_exception_of_yojson tree path)
      | _, "InternalServerException" ->
          `InternalServerException
            (Json_deserializers.internal_server_exception_of_yojson tree path)
      | _, "InvalidInputException" ->
          `InvalidInputException (Json_deserializers.invalid_input_exception_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : create_batch_prediction_input) =
    let input = Json_serializers.create_batch_prediction_input_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"AmazonML_20141212.CreateBatchPrediction"
      ~service ~context ~input
      ~output_deserializer:Json_deserializers.create_batch_prediction_output_of_yojson
      ~error_deserializer

  let request_with_metadata context (request : create_batch_prediction_input) =
    let input = Json_serializers.create_batch_prediction_input_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata
      ~shape_name:"AmazonML_20141212.CreateBatchPrediction" ~service ~context ~input
      ~output_deserializer:Json_deserializers.create_batch_prediction_output_of_yojson
      ~error_deserializer
end

module CreateDataSourceFromRDS = struct
  let error_to_string = function
    | `IdempotentParameterMismatchException _ ->
        "com.amazonaws.machinelearning#IdempotentParameterMismatchException"
    | `InternalServerException _ -> "com.amazonaws.machinelearning#InternalServerException"
    | `InvalidInputException _ -> "com.amazonaws.machinelearning#InvalidInputException"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "IdempotentParameterMismatchException" ->
          `IdempotentParameterMismatchException
            (Json_deserializers.idempotent_parameter_mismatch_exception_of_yojson tree path)
      | _, "InternalServerException" ->
          `InternalServerException
            (Json_deserializers.internal_server_exception_of_yojson tree path)
      | _, "InvalidInputException" ->
          `InvalidInputException (Json_deserializers.invalid_input_exception_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : create_data_source_from_rds_input) =
    let input = Json_serializers.create_data_source_from_rds_input_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"AmazonML_20141212.CreateDataSourceFromRDS"
      ~service ~context ~input
      ~output_deserializer:Json_deserializers.create_data_source_from_rds_output_of_yojson
      ~error_deserializer

  let request_with_metadata context (request : create_data_source_from_rds_input) =
    let input = Json_serializers.create_data_source_from_rds_input_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata
      ~shape_name:"AmazonML_20141212.CreateDataSourceFromRDS" ~service ~context ~input
      ~output_deserializer:Json_deserializers.create_data_source_from_rds_output_of_yojson
      ~error_deserializer
end

module CreateDataSourceFromRedshift = struct
  let error_to_string = function
    | `IdempotentParameterMismatchException _ ->
        "com.amazonaws.machinelearning#IdempotentParameterMismatchException"
    | `InternalServerException _ -> "com.amazonaws.machinelearning#InternalServerException"
    | `InvalidInputException _ -> "com.amazonaws.machinelearning#InvalidInputException"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "IdempotentParameterMismatchException" ->
          `IdempotentParameterMismatchException
            (Json_deserializers.idempotent_parameter_mismatch_exception_of_yojson tree path)
      | _, "InternalServerException" ->
          `InternalServerException
            (Json_deserializers.internal_server_exception_of_yojson tree path)
      | _, "InvalidInputException" ->
          `InvalidInputException (Json_deserializers.invalid_input_exception_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : create_data_source_from_redshift_input) =
    let input = Json_serializers.create_data_source_from_redshift_input_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"AmazonML_20141212.CreateDataSourceFromRedshift"
      ~service ~context ~input
      ~output_deserializer:Json_deserializers.create_data_source_from_redshift_output_of_yojson
      ~error_deserializer

  let request_with_metadata context (request : create_data_source_from_redshift_input) =
    let input = Json_serializers.create_data_source_from_redshift_input_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata
      ~shape_name:"AmazonML_20141212.CreateDataSourceFromRedshift" ~service ~context ~input
      ~output_deserializer:Json_deserializers.create_data_source_from_redshift_output_of_yojson
      ~error_deserializer
end

module CreateDataSourceFromS3 = struct
  let error_to_string = function
    | `IdempotentParameterMismatchException _ ->
        "com.amazonaws.machinelearning#IdempotentParameterMismatchException"
    | `InternalServerException _ -> "com.amazonaws.machinelearning#InternalServerException"
    | `InvalidInputException _ -> "com.amazonaws.machinelearning#InvalidInputException"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "IdempotentParameterMismatchException" ->
          `IdempotentParameterMismatchException
            (Json_deserializers.idempotent_parameter_mismatch_exception_of_yojson tree path)
      | _, "InternalServerException" ->
          `InternalServerException
            (Json_deserializers.internal_server_exception_of_yojson tree path)
      | _, "InvalidInputException" ->
          `InvalidInputException (Json_deserializers.invalid_input_exception_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : create_data_source_from_s3_input) =
    let input = Json_serializers.create_data_source_from_s3_input_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"AmazonML_20141212.CreateDataSourceFromS3"
      ~service ~context ~input
      ~output_deserializer:Json_deserializers.create_data_source_from_s3_output_of_yojson
      ~error_deserializer

  let request_with_metadata context (request : create_data_source_from_s3_input) =
    let input = Json_serializers.create_data_source_from_s3_input_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata
      ~shape_name:"AmazonML_20141212.CreateDataSourceFromS3" ~service ~context ~input
      ~output_deserializer:Json_deserializers.create_data_source_from_s3_output_of_yojson
      ~error_deserializer
end

module CreateEvaluation = struct
  let error_to_string = function
    | `IdempotentParameterMismatchException _ ->
        "com.amazonaws.machinelearning#IdempotentParameterMismatchException"
    | `InternalServerException _ -> "com.amazonaws.machinelearning#InternalServerException"
    | `InvalidInputException _ -> "com.amazonaws.machinelearning#InvalidInputException"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "IdempotentParameterMismatchException" ->
          `IdempotentParameterMismatchException
            (Json_deserializers.idempotent_parameter_mismatch_exception_of_yojson tree path)
      | _, "InternalServerException" ->
          `InternalServerException
            (Json_deserializers.internal_server_exception_of_yojson tree path)
      | _, "InvalidInputException" ->
          `InvalidInputException (Json_deserializers.invalid_input_exception_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : create_evaluation_input) =
    let input = Json_serializers.create_evaluation_input_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"AmazonML_20141212.CreateEvaluation" ~service
      ~context ~input ~output_deserializer:Json_deserializers.create_evaluation_output_of_yojson
      ~error_deserializer

  let request_with_metadata context (request : create_evaluation_input) =
    let input = Json_serializers.create_evaluation_input_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata
      ~shape_name:"AmazonML_20141212.CreateEvaluation" ~service ~context ~input
      ~output_deserializer:Json_deserializers.create_evaluation_output_of_yojson ~error_deserializer
end

module CreateMLModel = struct
  let error_to_string = function
    | `IdempotentParameterMismatchException _ ->
        "com.amazonaws.machinelearning#IdempotentParameterMismatchException"
    | `InternalServerException _ -> "com.amazonaws.machinelearning#InternalServerException"
    | `InvalidInputException _ -> "com.amazonaws.machinelearning#InvalidInputException"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "IdempotentParameterMismatchException" ->
          `IdempotentParameterMismatchException
            (Json_deserializers.idempotent_parameter_mismatch_exception_of_yojson tree path)
      | _, "InternalServerException" ->
          `InternalServerException
            (Json_deserializers.internal_server_exception_of_yojson tree path)
      | _, "InvalidInputException" ->
          `InvalidInputException (Json_deserializers.invalid_input_exception_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : create_ml_model_input) =
    let input = Json_serializers.create_ml_model_input_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"AmazonML_20141212.CreateMLModel" ~service
      ~context ~input ~output_deserializer:Json_deserializers.create_ml_model_output_of_yojson
      ~error_deserializer

  let request_with_metadata context (request : create_ml_model_input) =
    let input = Json_serializers.create_ml_model_input_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata ~shape_name:"AmazonML_20141212.CreateMLModel"
      ~service ~context ~input
      ~output_deserializer:Json_deserializers.create_ml_model_output_of_yojson ~error_deserializer
end

module CreateRealtimeEndpoint = struct
  let error_to_string = function
    | `InternalServerException _ -> "com.amazonaws.machinelearning#InternalServerException"
    | `InvalidInputException _ -> "com.amazonaws.machinelearning#InvalidInputException"
    | `ResourceNotFoundException _ -> "com.amazonaws.machinelearning#ResourceNotFoundException"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "InternalServerException" ->
          `InternalServerException
            (Json_deserializers.internal_server_exception_of_yojson tree path)
      | _, "InvalidInputException" ->
          `InvalidInputException (Json_deserializers.invalid_input_exception_of_yojson tree path)
      | _, "ResourceNotFoundException" ->
          `ResourceNotFoundException
            (Json_deserializers.resource_not_found_exception_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : create_realtime_endpoint_input) =
    let input = Json_serializers.create_realtime_endpoint_input_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"AmazonML_20141212.CreateRealtimeEndpoint"
      ~service ~context ~input
      ~output_deserializer:Json_deserializers.create_realtime_endpoint_output_of_yojson
      ~error_deserializer

  let request_with_metadata context (request : create_realtime_endpoint_input) =
    let input = Json_serializers.create_realtime_endpoint_input_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata
      ~shape_name:"AmazonML_20141212.CreateRealtimeEndpoint" ~service ~context ~input
      ~output_deserializer:Json_deserializers.create_realtime_endpoint_output_of_yojson
      ~error_deserializer
end

module DeleteBatchPrediction = struct
  let error_to_string = function
    | `InternalServerException _ -> "com.amazonaws.machinelearning#InternalServerException"
    | `InvalidInputException _ -> "com.amazonaws.machinelearning#InvalidInputException"
    | `ResourceNotFoundException _ -> "com.amazonaws.machinelearning#ResourceNotFoundException"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "InternalServerException" ->
          `InternalServerException
            (Json_deserializers.internal_server_exception_of_yojson tree path)
      | _, "InvalidInputException" ->
          `InvalidInputException (Json_deserializers.invalid_input_exception_of_yojson tree path)
      | _, "ResourceNotFoundException" ->
          `ResourceNotFoundException
            (Json_deserializers.resource_not_found_exception_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : delete_batch_prediction_input) =
    let input = Json_serializers.delete_batch_prediction_input_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"AmazonML_20141212.DeleteBatchPrediction"
      ~service ~context ~input
      ~output_deserializer:Json_deserializers.delete_batch_prediction_output_of_yojson
      ~error_deserializer

  let request_with_metadata context (request : delete_batch_prediction_input) =
    let input = Json_serializers.delete_batch_prediction_input_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata
      ~shape_name:"AmazonML_20141212.DeleteBatchPrediction" ~service ~context ~input
      ~output_deserializer:Json_deserializers.delete_batch_prediction_output_of_yojson
      ~error_deserializer
end

module DeleteDataSource = struct
  let error_to_string = function
    | `InternalServerException _ -> "com.amazonaws.machinelearning#InternalServerException"
    | `InvalidInputException _ -> "com.amazonaws.machinelearning#InvalidInputException"
    | `ResourceNotFoundException _ -> "com.amazonaws.machinelearning#ResourceNotFoundException"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "InternalServerException" ->
          `InternalServerException
            (Json_deserializers.internal_server_exception_of_yojson tree path)
      | _, "InvalidInputException" ->
          `InvalidInputException (Json_deserializers.invalid_input_exception_of_yojson tree path)
      | _, "ResourceNotFoundException" ->
          `ResourceNotFoundException
            (Json_deserializers.resource_not_found_exception_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : delete_data_source_input) =
    let input = Json_serializers.delete_data_source_input_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"AmazonML_20141212.DeleteDataSource" ~service
      ~context ~input ~output_deserializer:Json_deserializers.delete_data_source_output_of_yojson
      ~error_deserializer

  let request_with_metadata context (request : delete_data_source_input) =
    let input = Json_serializers.delete_data_source_input_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata
      ~shape_name:"AmazonML_20141212.DeleteDataSource" ~service ~context ~input
      ~output_deserializer:Json_deserializers.delete_data_source_output_of_yojson
      ~error_deserializer
end

module DeleteEvaluation = struct
  let error_to_string = function
    | `InternalServerException _ -> "com.amazonaws.machinelearning#InternalServerException"
    | `InvalidInputException _ -> "com.amazonaws.machinelearning#InvalidInputException"
    | `ResourceNotFoundException _ -> "com.amazonaws.machinelearning#ResourceNotFoundException"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "InternalServerException" ->
          `InternalServerException
            (Json_deserializers.internal_server_exception_of_yojson tree path)
      | _, "InvalidInputException" ->
          `InvalidInputException (Json_deserializers.invalid_input_exception_of_yojson tree path)
      | _, "ResourceNotFoundException" ->
          `ResourceNotFoundException
            (Json_deserializers.resource_not_found_exception_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : delete_evaluation_input) =
    let input = Json_serializers.delete_evaluation_input_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"AmazonML_20141212.DeleteEvaluation" ~service
      ~context ~input ~output_deserializer:Json_deserializers.delete_evaluation_output_of_yojson
      ~error_deserializer

  let request_with_metadata context (request : delete_evaluation_input) =
    let input = Json_serializers.delete_evaluation_input_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata
      ~shape_name:"AmazonML_20141212.DeleteEvaluation" ~service ~context ~input
      ~output_deserializer:Json_deserializers.delete_evaluation_output_of_yojson ~error_deserializer
end

module DeleteMLModel = struct
  let error_to_string = function
    | `InternalServerException _ -> "com.amazonaws.machinelearning#InternalServerException"
    | `InvalidInputException _ -> "com.amazonaws.machinelearning#InvalidInputException"
    | `ResourceNotFoundException _ -> "com.amazonaws.machinelearning#ResourceNotFoundException"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "InternalServerException" ->
          `InternalServerException
            (Json_deserializers.internal_server_exception_of_yojson tree path)
      | _, "InvalidInputException" ->
          `InvalidInputException (Json_deserializers.invalid_input_exception_of_yojson tree path)
      | _, "ResourceNotFoundException" ->
          `ResourceNotFoundException
            (Json_deserializers.resource_not_found_exception_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : delete_ml_model_input) =
    let input = Json_serializers.delete_ml_model_input_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"AmazonML_20141212.DeleteMLModel" ~service
      ~context ~input ~output_deserializer:Json_deserializers.delete_ml_model_output_of_yojson
      ~error_deserializer

  let request_with_metadata context (request : delete_ml_model_input) =
    let input = Json_serializers.delete_ml_model_input_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata ~shape_name:"AmazonML_20141212.DeleteMLModel"
      ~service ~context ~input
      ~output_deserializer:Json_deserializers.delete_ml_model_output_of_yojson ~error_deserializer
end

module DeleteRealtimeEndpoint = struct
  let error_to_string = function
    | `InternalServerException _ -> "com.amazonaws.machinelearning#InternalServerException"
    | `InvalidInputException _ -> "com.amazonaws.machinelearning#InvalidInputException"
    | `ResourceNotFoundException _ -> "com.amazonaws.machinelearning#ResourceNotFoundException"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "InternalServerException" ->
          `InternalServerException
            (Json_deserializers.internal_server_exception_of_yojson tree path)
      | _, "InvalidInputException" ->
          `InvalidInputException (Json_deserializers.invalid_input_exception_of_yojson tree path)
      | _, "ResourceNotFoundException" ->
          `ResourceNotFoundException
            (Json_deserializers.resource_not_found_exception_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : delete_realtime_endpoint_input) =
    let input = Json_serializers.delete_realtime_endpoint_input_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"AmazonML_20141212.DeleteRealtimeEndpoint"
      ~service ~context ~input
      ~output_deserializer:Json_deserializers.delete_realtime_endpoint_output_of_yojson
      ~error_deserializer

  let request_with_metadata context (request : delete_realtime_endpoint_input) =
    let input = Json_serializers.delete_realtime_endpoint_input_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata
      ~shape_name:"AmazonML_20141212.DeleteRealtimeEndpoint" ~service ~context ~input
      ~output_deserializer:Json_deserializers.delete_realtime_endpoint_output_of_yojson
      ~error_deserializer
end

module DeleteTags = struct
  let error_to_string = function
    | `InternalServerException _ -> "com.amazonaws.machinelearning#InternalServerException"
    | `InvalidInputException _ -> "com.amazonaws.machinelearning#InvalidInputException"
    | `InvalidTagException _ -> "com.amazonaws.machinelearning#InvalidTagException"
    | `ResourceNotFoundException _ -> "com.amazonaws.machinelearning#ResourceNotFoundException"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "InternalServerException" ->
          `InternalServerException
            (Json_deserializers.internal_server_exception_of_yojson tree path)
      | _, "InvalidInputException" ->
          `InvalidInputException (Json_deserializers.invalid_input_exception_of_yojson tree path)
      | _, "InvalidTagException" ->
          `InvalidTagException (Json_deserializers.invalid_tag_exception_of_yojson tree path)
      | _, "ResourceNotFoundException" ->
          `ResourceNotFoundException
            (Json_deserializers.resource_not_found_exception_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : delete_tags_input) =
    let input = Json_serializers.delete_tags_input_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"AmazonML_20141212.DeleteTags" ~service ~context
      ~input ~output_deserializer:Json_deserializers.delete_tags_output_of_yojson
      ~error_deserializer

  let request_with_metadata context (request : delete_tags_input) =
    let input = Json_serializers.delete_tags_input_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata ~shape_name:"AmazonML_20141212.DeleteTags"
      ~service ~context ~input ~output_deserializer:Json_deserializers.delete_tags_output_of_yojson
      ~error_deserializer
end

module DescribeBatchPredictions = struct
  let error_to_string = function
    | `InternalServerException _ -> "com.amazonaws.machinelearning#InternalServerException"
    | `InvalidInputException _ -> "com.amazonaws.machinelearning#InvalidInputException"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "InternalServerException" ->
          `InternalServerException
            (Json_deserializers.internal_server_exception_of_yojson tree path)
      | _, "InvalidInputException" ->
          `InvalidInputException (Json_deserializers.invalid_input_exception_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : describe_batch_predictions_input) =
    let input = Json_serializers.describe_batch_predictions_input_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"AmazonML_20141212.DescribeBatchPredictions"
      ~service ~context ~input
      ~output_deserializer:Json_deserializers.describe_batch_predictions_output_of_yojson
      ~error_deserializer

  let request_with_metadata context (request : describe_batch_predictions_input) =
    let input = Json_serializers.describe_batch_predictions_input_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata
      ~shape_name:"AmazonML_20141212.DescribeBatchPredictions" ~service ~context ~input
      ~output_deserializer:Json_deserializers.describe_batch_predictions_output_of_yojson
      ~error_deserializer
end

module DescribeDataSources = struct
  let error_to_string = function
    | `InternalServerException _ -> "com.amazonaws.machinelearning#InternalServerException"
    | `InvalidInputException _ -> "com.amazonaws.machinelearning#InvalidInputException"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "InternalServerException" ->
          `InternalServerException
            (Json_deserializers.internal_server_exception_of_yojson tree path)
      | _, "InvalidInputException" ->
          `InvalidInputException (Json_deserializers.invalid_input_exception_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : describe_data_sources_input) =
    let input = Json_serializers.describe_data_sources_input_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"AmazonML_20141212.DescribeDataSources" ~service
      ~context ~input ~output_deserializer:Json_deserializers.describe_data_sources_output_of_yojson
      ~error_deserializer

  let request_with_metadata context (request : describe_data_sources_input) =
    let input = Json_serializers.describe_data_sources_input_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata
      ~shape_name:"AmazonML_20141212.DescribeDataSources" ~service ~context ~input
      ~output_deserializer:Json_deserializers.describe_data_sources_output_of_yojson
      ~error_deserializer
end

module DescribeEvaluations = struct
  let error_to_string = function
    | `InternalServerException _ -> "com.amazonaws.machinelearning#InternalServerException"
    | `InvalidInputException _ -> "com.amazonaws.machinelearning#InvalidInputException"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "InternalServerException" ->
          `InternalServerException
            (Json_deserializers.internal_server_exception_of_yojson tree path)
      | _, "InvalidInputException" ->
          `InvalidInputException (Json_deserializers.invalid_input_exception_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : describe_evaluations_input) =
    let input = Json_serializers.describe_evaluations_input_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"AmazonML_20141212.DescribeEvaluations" ~service
      ~context ~input ~output_deserializer:Json_deserializers.describe_evaluations_output_of_yojson
      ~error_deserializer

  let request_with_metadata context (request : describe_evaluations_input) =
    let input = Json_serializers.describe_evaluations_input_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata
      ~shape_name:"AmazonML_20141212.DescribeEvaluations" ~service ~context ~input
      ~output_deserializer:Json_deserializers.describe_evaluations_output_of_yojson
      ~error_deserializer
end

module DescribeMLModels = struct
  let error_to_string = function
    | `InternalServerException _ -> "com.amazonaws.machinelearning#InternalServerException"
    | `InvalidInputException _ -> "com.amazonaws.machinelearning#InvalidInputException"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "InternalServerException" ->
          `InternalServerException
            (Json_deserializers.internal_server_exception_of_yojson tree path)
      | _, "InvalidInputException" ->
          `InvalidInputException (Json_deserializers.invalid_input_exception_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : describe_ml_models_input) =
    let input = Json_serializers.describe_ml_models_input_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"AmazonML_20141212.DescribeMLModels" ~service
      ~context ~input ~output_deserializer:Json_deserializers.describe_ml_models_output_of_yojson
      ~error_deserializer

  let request_with_metadata context (request : describe_ml_models_input) =
    let input = Json_serializers.describe_ml_models_input_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata
      ~shape_name:"AmazonML_20141212.DescribeMLModels" ~service ~context ~input
      ~output_deserializer:Json_deserializers.describe_ml_models_output_of_yojson
      ~error_deserializer
end

module DescribeTags = struct
  let error_to_string = function
    | `InternalServerException _ -> "com.amazonaws.machinelearning#InternalServerException"
    | `InvalidInputException _ -> "com.amazonaws.machinelearning#InvalidInputException"
    | `ResourceNotFoundException _ -> "com.amazonaws.machinelearning#ResourceNotFoundException"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "InternalServerException" ->
          `InternalServerException
            (Json_deserializers.internal_server_exception_of_yojson tree path)
      | _, "InvalidInputException" ->
          `InvalidInputException (Json_deserializers.invalid_input_exception_of_yojson tree path)
      | _, "ResourceNotFoundException" ->
          `ResourceNotFoundException
            (Json_deserializers.resource_not_found_exception_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : describe_tags_input) =
    let input = Json_serializers.describe_tags_input_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"AmazonML_20141212.DescribeTags" ~service
      ~context ~input ~output_deserializer:Json_deserializers.describe_tags_output_of_yojson
      ~error_deserializer

  let request_with_metadata context (request : describe_tags_input) =
    let input = Json_serializers.describe_tags_input_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata ~shape_name:"AmazonML_20141212.DescribeTags"
      ~service ~context ~input
      ~output_deserializer:Json_deserializers.describe_tags_output_of_yojson ~error_deserializer
end

module GetBatchPrediction = struct
  let error_to_string = function
    | `InternalServerException _ -> "com.amazonaws.machinelearning#InternalServerException"
    | `InvalidInputException _ -> "com.amazonaws.machinelearning#InvalidInputException"
    | `ResourceNotFoundException _ -> "com.amazonaws.machinelearning#ResourceNotFoundException"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "InternalServerException" ->
          `InternalServerException
            (Json_deserializers.internal_server_exception_of_yojson tree path)
      | _, "InvalidInputException" ->
          `InvalidInputException (Json_deserializers.invalid_input_exception_of_yojson tree path)
      | _, "ResourceNotFoundException" ->
          `ResourceNotFoundException
            (Json_deserializers.resource_not_found_exception_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : get_batch_prediction_input) =
    let input = Json_serializers.get_batch_prediction_input_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"AmazonML_20141212.GetBatchPrediction" ~service
      ~context ~input ~output_deserializer:Json_deserializers.get_batch_prediction_output_of_yojson
      ~error_deserializer

  let request_with_metadata context (request : get_batch_prediction_input) =
    let input = Json_serializers.get_batch_prediction_input_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata
      ~shape_name:"AmazonML_20141212.GetBatchPrediction" ~service ~context ~input
      ~output_deserializer:Json_deserializers.get_batch_prediction_output_of_yojson
      ~error_deserializer
end

module GetDataSource = struct
  let error_to_string = function
    | `InternalServerException _ -> "com.amazonaws.machinelearning#InternalServerException"
    | `InvalidInputException _ -> "com.amazonaws.machinelearning#InvalidInputException"
    | `ResourceNotFoundException _ -> "com.amazonaws.machinelearning#ResourceNotFoundException"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "InternalServerException" ->
          `InternalServerException
            (Json_deserializers.internal_server_exception_of_yojson tree path)
      | _, "InvalidInputException" ->
          `InvalidInputException (Json_deserializers.invalid_input_exception_of_yojson tree path)
      | _, "ResourceNotFoundException" ->
          `ResourceNotFoundException
            (Json_deserializers.resource_not_found_exception_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : get_data_source_input) =
    let input = Json_serializers.get_data_source_input_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"AmazonML_20141212.GetDataSource" ~service
      ~context ~input ~output_deserializer:Json_deserializers.get_data_source_output_of_yojson
      ~error_deserializer

  let request_with_metadata context (request : get_data_source_input) =
    let input = Json_serializers.get_data_source_input_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata ~shape_name:"AmazonML_20141212.GetDataSource"
      ~service ~context ~input
      ~output_deserializer:Json_deserializers.get_data_source_output_of_yojson ~error_deserializer
end

module GetEvaluation = struct
  let error_to_string = function
    | `InternalServerException _ -> "com.amazonaws.machinelearning#InternalServerException"
    | `InvalidInputException _ -> "com.amazonaws.machinelearning#InvalidInputException"
    | `ResourceNotFoundException _ -> "com.amazonaws.machinelearning#ResourceNotFoundException"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "InternalServerException" ->
          `InternalServerException
            (Json_deserializers.internal_server_exception_of_yojson tree path)
      | _, "InvalidInputException" ->
          `InvalidInputException (Json_deserializers.invalid_input_exception_of_yojson tree path)
      | _, "ResourceNotFoundException" ->
          `ResourceNotFoundException
            (Json_deserializers.resource_not_found_exception_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : get_evaluation_input) =
    let input = Json_serializers.get_evaluation_input_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"AmazonML_20141212.GetEvaluation" ~service
      ~context ~input ~output_deserializer:Json_deserializers.get_evaluation_output_of_yojson
      ~error_deserializer

  let request_with_metadata context (request : get_evaluation_input) =
    let input = Json_serializers.get_evaluation_input_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata ~shape_name:"AmazonML_20141212.GetEvaluation"
      ~service ~context ~input
      ~output_deserializer:Json_deserializers.get_evaluation_output_of_yojson ~error_deserializer
end

module GetMLModel = struct
  let error_to_string = function
    | `InternalServerException _ -> "com.amazonaws.machinelearning#InternalServerException"
    | `InvalidInputException _ -> "com.amazonaws.machinelearning#InvalidInputException"
    | `ResourceNotFoundException _ -> "com.amazonaws.machinelearning#ResourceNotFoundException"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "InternalServerException" ->
          `InternalServerException
            (Json_deserializers.internal_server_exception_of_yojson tree path)
      | _, "InvalidInputException" ->
          `InvalidInputException (Json_deserializers.invalid_input_exception_of_yojson tree path)
      | _, "ResourceNotFoundException" ->
          `ResourceNotFoundException
            (Json_deserializers.resource_not_found_exception_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : get_ml_model_input) =
    let input = Json_serializers.get_ml_model_input_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"AmazonML_20141212.GetMLModel" ~service ~context
      ~input ~output_deserializer:Json_deserializers.get_ml_model_output_of_yojson
      ~error_deserializer

  let request_with_metadata context (request : get_ml_model_input) =
    let input = Json_serializers.get_ml_model_input_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata ~shape_name:"AmazonML_20141212.GetMLModel"
      ~service ~context ~input ~output_deserializer:Json_deserializers.get_ml_model_output_of_yojson
      ~error_deserializer
end

module Predict = struct
  let error_to_string = function
    | `InternalServerException _ -> "com.amazonaws.machinelearning#InternalServerException"
    | `InvalidInputException _ -> "com.amazonaws.machinelearning#InvalidInputException"
    | `LimitExceededException _ -> "com.amazonaws.machinelearning#LimitExceededException"
    | `PredictorNotMountedException _ ->
        "com.amazonaws.machinelearning#PredictorNotMountedException"
    | `ResourceNotFoundException _ -> "com.amazonaws.machinelearning#ResourceNotFoundException"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "InternalServerException" ->
          `InternalServerException
            (Json_deserializers.internal_server_exception_of_yojson tree path)
      | _, "InvalidInputException" ->
          `InvalidInputException (Json_deserializers.invalid_input_exception_of_yojson tree path)
      | _, "LimitExceededException" ->
          `LimitExceededException (Json_deserializers.limit_exceeded_exception_of_yojson tree path)
      | _, "PredictorNotMountedException" ->
          `PredictorNotMountedException
            (Json_deserializers.predictor_not_mounted_exception_of_yojson tree path)
      | _, "ResourceNotFoundException" ->
          `ResourceNotFoundException
            (Json_deserializers.resource_not_found_exception_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : predict_input) =
    let input = Json_serializers.predict_input_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"AmazonML_20141212.Predict" ~service ~context
      ~input ~output_deserializer:Json_deserializers.predict_output_of_yojson ~error_deserializer

  let request_with_metadata context (request : predict_input) =
    let input = Json_serializers.predict_input_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata ~shape_name:"AmazonML_20141212.Predict"
      ~service ~context ~input ~output_deserializer:Json_deserializers.predict_output_of_yojson
      ~error_deserializer
end

module UpdateBatchPrediction = struct
  let error_to_string = function
    | `InternalServerException _ -> "com.amazonaws.machinelearning#InternalServerException"
    | `InvalidInputException _ -> "com.amazonaws.machinelearning#InvalidInputException"
    | `ResourceNotFoundException _ -> "com.amazonaws.machinelearning#ResourceNotFoundException"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "InternalServerException" ->
          `InternalServerException
            (Json_deserializers.internal_server_exception_of_yojson tree path)
      | _, "InvalidInputException" ->
          `InvalidInputException (Json_deserializers.invalid_input_exception_of_yojson tree path)
      | _, "ResourceNotFoundException" ->
          `ResourceNotFoundException
            (Json_deserializers.resource_not_found_exception_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : update_batch_prediction_input) =
    let input = Json_serializers.update_batch_prediction_input_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"AmazonML_20141212.UpdateBatchPrediction"
      ~service ~context ~input
      ~output_deserializer:Json_deserializers.update_batch_prediction_output_of_yojson
      ~error_deserializer

  let request_with_metadata context (request : update_batch_prediction_input) =
    let input = Json_serializers.update_batch_prediction_input_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata
      ~shape_name:"AmazonML_20141212.UpdateBatchPrediction" ~service ~context ~input
      ~output_deserializer:Json_deserializers.update_batch_prediction_output_of_yojson
      ~error_deserializer
end

module UpdateDataSource = struct
  let error_to_string = function
    | `InternalServerException _ -> "com.amazonaws.machinelearning#InternalServerException"
    | `InvalidInputException _ -> "com.amazonaws.machinelearning#InvalidInputException"
    | `ResourceNotFoundException _ -> "com.amazonaws.machinelearning#ResourceNotFoundException"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "InternalServerException" ->
          `InternalServerException
            (Json_deserializers.internal_server_exception_of_yojson tree path)
      | _, "InvalidInputException" ->
          `InvalidInputException (Json_deserializers.invalid_input_exception_of_yojson tree path)
      | _, "ResourceNotFoundException" ->
          `ResourceNotFoundException
            (Json_deserializers.resource_not_found_exception_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : update_data_source_input) =
    let input = Json_serializers.update_data_source_input_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"AmazonML_20141212.UpdateDataSource" ~service
      ~context ~input ~output_deserializer:Json_deserializers.update_data_source_output_of_yojson
      ~error_deserializer

  let request_with_metadata context (request : update_data_source_input) =
    let input = Json_serializers.update_data_source_input_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata
      ~shape_name:"AmazonML_20141212.UpdateDataSource" ~service ~context ~input
      ~output_deserializer:Json_deserializers.update_data_source_output_of_yojson
      ~error_deserializer
end

module UpdateEvaluation = struct
  let error_to_string = function
    | `InternalServerException _ -> "com.amazonaws.machinelearning#InternalServerException"
    | `InvalidInputException _ -> "com.amazonaws.machinelearning#InvalidInputException"
    | `ResourceNotFoundException _ -> "com.amazonaws.machinelearning#ResourceNotFoundException"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "InternalServerException" ->
          `InternalServerException
            (Json_deserializers.internal_server_exception_of_yojson tree path)
      | _, "InvalidInputException" ->
          `InvalidInputException (Json_deserializers.invalid_input_exception_of_yojson tree path)
      | _, "ResourceNotFoundException" ->
          `ResourceNotFoundException
            (Json_deserializers.resource_not_found_exception_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : update_evaluation_input) =
    let input = Json_serializers.update_evaluation_input_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"AmazonML_20141212.UpdateEvaluation" ~service
      ~context ~input ~output_deserializer:Json_deserializers.update_evaluation_output_of_yojson
      ~error_deserializer

  let request_with_metadata context (request : update_evaluation_input) =
    let input = Json_serializers.update_evaluation_input_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata
      ~shape_name:"AmazonML_20141212.UpdateEvaluation" ~service ~context ~input
      ~output_deserializer:Json_deserializers.update_evaluation_output_of_yojson ~error_deserializer
end

module UpdateMLModel = struct
  let error_to_string = function
    | `InternalServerException _ -> "com.amazonaws.machinelearning#InternalServerException"
    | `InvalidInputException _ -> "com.amazonaws.machinelearning#InvalidInputException"
    | `ResourceNotFoundException _ -> "com.amazonaws.machinelearning#ResourceNotFoundException"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "InternalServerException" ->
          `InternalServerException
            (Json_deserializers.internal_server_exception_of_yojson tree path)
      | _, "InvalidInputException" ->
          `InvalidInputException (Json_deserializers.invalid_input_exception_of_yojson tree path)
      | _, "ResourceNotFoundException" ->
          `ResourceNotFoundException
            (Json_deserializers.resource_not_found_exception_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : update_ml_model_input) =
    let input = Json_serializers.update_ml_model_input_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"AmazonML_20141212.UpdateMLModel" ~service
      ~context ~input ~output_deserializer:Json_deserializers.update_ml_model_output_of_yojson
      ~error_deserializer

  let request_with_metadata context (request : update_ml_model_input) =
    let input = Json_serializers.update_ml_model_input_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata ~shape_name:"AmazonML_20141212.UpdateMLModel"
      ~service ~context ~input
      ~output_deserializer:Json_deserializers.update_ml_model_output_of_yojson ~error_deserializer
end
