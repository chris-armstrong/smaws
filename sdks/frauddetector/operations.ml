open Types
open Service_metadata

module BatchCreateVariable = struct
  let error_to_string = function
    | `AccessDeniedException _ -> "com.amazonaws.frauddetector#AccessDeniedException"
    | `InternalServerException _ -> "com.amazonaws.frauddetector#InternalServerException"
    | `ThrottlingException _ -> "com.amazonaws.frauddetector#ThrottlingException"
    | `ValidationException _ -> "com.amazonaws.frauddetector#ValidationException"
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

  let request context (request : batch_create_variable_request) =
    let input = Json_serializers.batch_create_variable_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"AWSHawksNestServiceFacade.BatchCreateVariable"
      ~service ~context ~input
      ~output_deserializer:Json_deserializers.batch_create_variable_result_of_yojson
      ~error_deserializer

  let request_with_metadata context (request : batch_create_variable_request) =
    let input = Json_serializers.batch_create_variable_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata
      ~shape_name:"AWSHawksNestServiceFacade.BatchCreateVariable" ~service ~context ~input
      ~output_deserializer:Json_deserializers.batch_create_variable_result_of_yojson
      ~error_deserializer
end

module BatchGetVariable = struct
  let error_to_string = function
    | `AccessDeniedException _ -> "com.amazonaws.frauddetector#AccessDeniedException"
    | `InternalServerException _ -> "com.amazonaws.frauddetector#InternalServerException"
    | `ThrottlingException _ -> "com.amazonaws.frauddetector#ThrottlingException"
    | `ValidationException _ -> "com.amazonaws.frauddetector#ValidationException"
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

  let request context (request : batch_get_variable_request) =
    let input = Json_serializers.batch_get_variable_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"AWSHawksNestServiceFacade.BatchGetVariable"
      ~service ~context ~input
      ~output_deserializer:Json_deserializers.batch_get_variable_result_of_yojson
      ~error_deserializer

  let request_with_metadata context (request : batch_get_variable_request) =
    let input = Json_serializers.batch_get_variable_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata
      ~shape_name:"AWSHawksNestServiceFacade.BatchGetVariable" ~service ~context ~input
      ~output_deserializer:Json_deserializers.batch_get_variable_result_of_yojson
      ~error_deserializer
end

module CancelBatchImportJob = struct
  let error_to_string = function
    | `AccessDeniedException _ -> "com.amazonaws.frauddetector#AccessDeniedException"
    | `InternalServerException _ -> "com.amazonaws.frauddetector#InternalServerException"
    | `ResourceNotFoundException _ -> "com.amazonaws.frauddetector#ResourceNotFoundException"
    | `ThrottlingException _ -> "com.amazonaws.frauddetector#ThrottlingException"
    | `ValidationException _ -> "com.amazonaws.frauddetector#ValidationException"
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

  let request context (request : cancel_batch_import_job_request) =
    let input = Json_serializers.cancel_batch_import_job_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"AWSHawksNestServiceFacade.CancelBatchImportJob"
      ~service ~context ~input
      ~output_deserializer:Json_deserializers.cancel_batch_import_job_result_of_yojson
      ~error_deserializer

  let request_with_metadata context (request : cancel_batch_import_job_request) =
    let input = Json_serializers.cancel_batch_import_job_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata
      ~shape_name:"AWSHawksNestServiceFacade.CancelBatchImportJob" ~service ~context ~input
      ~output_deserializer:Json_deserializers.cancel_batch_import_job_result_of_yojson
      ~error_deserializer
end

module CancelBatchPredictionJob = struct
  let error_to_string = function
    | `AccessDeniedException _ -> "com.amazonaws.frauddetector#AccessDeniedException"
    | `InternalServerException _ -> "com.amazonaws.frauddetector#InternalServerException"
    | `ResourceNotFoundException _ -> "com.amazonaws.frauddetector#ResourceNotFoundException"
    | `ThrottlingException _ -> "com.amazonaws.frauddetector#ThrottlingException"
    | `ValidationException _ -> "com.amazonaws.frauddetector#ValidationException"
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

  let request context (request : cancel_batch_prediction_job_request) =
    let input = Json_serializers.cancel_batch_prediction_job_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request
      ~shape_name:"AWSHawksNestServiceFacade.CancelBatchPredictionJob" ~service ~context ~input
      ~output_deserializer:Json_deserializers.cancel_batch_prediction_job_result_of_yojson
      ~error_deserializer

  let request_with_metadata context (request : cancel_batch_prediction_job_request) =
    let input = Json_serializers.cancel_batch_prediction_job_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata
      ~shape_name:"AWSHawksNestServiceFacade.CancelBatchPredictionJob" ~service ~context ~input
      ~output_deserializer:Json_deserializers.cancel_batch_prediction_job_result_of_yojson
      ~error_deserializer
end

module CreateBatchImportJob = struct
  let error_to_string = function
    | `AccessDeniedException _ -> "com.amazonaws.frauddetector#AccessDeniedException"
    | `InternalServerException _ -> "com.amazonaws.frauddetector#InternalServerException"
    | `ResourceNotFoundException _ -> "com.amazonaws.frauddetector#ResourceNotFoundException"
    | `ThrottlingException _ -> "com.amazonaws.frauddetector#ThrottlingException"
    | `ValidationException _ -> "com.amazonaws.frauddetector#ValidationException"
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

  let request context (request : create_batch_import_job_request) =
    let input = Json_serializers.create_batch_import_job_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"AWSHawksNestServiceFacade.CreateBatchImportJob"
      ~service ~context ~input
      ~output_deserializer:Json_deserializers.create_batch_import_job_result_of_yojson
      ~error_deserializer

  let request_with_metadata context (request : create_batch_import_job_request) =
    let input = Json_serializers.create_batch_import_job_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata
      ~shape_name:"AWSHawksNestServiceFacade.CreateBatchImportJob" ~service ~context ~input
      ~output_deserializer:Json_deserializers.create_batch_import_job_result_of_yojson
      ~error_deserializer
end

module CreateBatchPredictionJob = struct
  let error_to_string = function
    | `AccessDeniedException _ -> "com.amazonaws.frauddetector#AccessDeniedException"
    | `InternalServerException _ -> "com.amazonaws.frauddetector#InternalServerException"
    | `ResourceNotFoundException _ -> "com.amazonaws.frauddetector#ResourceNotFoundException"
    | `ThrottlingException _ -> "com.amazonaws.frauddetector#ThrottlingException"
    | `ValidationException _ -> "com.amazonaws.frauddetector#ValidationException"
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

  let request context (request : create_batch_prediction_job_request) =
    let input = Json_serializers.create_batch_prediction_job_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request
      ~shape_name:"AWSHawksNestServiceFacade.CreateBatchPredictionJob" ~service ~context ~input
      ~output_deserializer:Json_deserializers.create_batch_prediction_job_result_of_yojson
      ~error_deserializer

  let request_with_metadata context (request : create_batch_prediction_job_request) =
    let input = Json_serializers.create_batch_prediction_job_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata
      ~shape_name:"AWSHawksNestServiceFacade.CreateBatchPredictionJob" ~service ~context ~input
      ~output_deserializer:Json_deserializers.create_batch_prediction_job_result_of_yojson
      ~error_deserializer
end

module CreateDetectorVersion = struct
  let error_to_string = function
    | `AccessDeniedException _ -> "com.amazonaws.frauddetector#AccessDeniedException"
    | `InternalServerException _ -> "com.amazonaws.frauddetector#InternalServerException"
    | `ResourceNotFoundException _ -> "com.amazonaws.frauddetector#ResourceNotFoundException"
    | `ThrottlingException _ -> "com.amazonaws.frauddetector#ThrottlingException"
    | `ValidationException _ -> "com.amazonaws.frauddetector#ValidationException"
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

  let request context (request : create_detector_version_request) =
    let input = Json_serializers.create_detector_version_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request
      ~shape_name:"AWSHawksNestServiceFacade.CreateDetectorVersion" ~service ~context ~input
      ~output_deserializer:Json_deserializers.create_detector_version_result_of_yojson
      ~error_deserializer

  let request_with_metadata context (request : create_detector_version_request) =
    let input = Json_serializers.create_detector_version_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata
      ~shape_name:"AWSHawksNestServiceFacade.CreateDetectorVersion" ~service ~context ~input
      ~output_deserializer:Json_deserializers.create_detector_version_result_of_yojson
      ~error_deserializer
end

module CreateList = struct
  let error_to_string = function
    | `AccessDeniedException _ -> "com.amazonaws.frauddetector#AccessDeniedException"
    | `InternalServerException _ -> "com.amazonaws.frauddetector#InternalServerException"
    | `ThrottlingException _ -> "com.amazonaws.frauddetector#ThrottlingException"
    | `ValidationException _ -> "com.amazonaws.frauddetector#ValidationException"
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

  let request context (request : create_list_request) =
    let input = Json_serializers.create_list_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"AWSHawksNestServiceFacade.CreateList" ~service
      ~context ~input ~output_deserializer:Json_deserializers.create_list_result_of_yojson
      ~error_deserializer

  let request_with_metadata context (request : create_list_request) =
    let input = Json_serializers.create_list_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata
      ~shape_name:"AWSHawksNestServiceFacade.CreateList" ~service ~context ~input
      ~output_deserializer:Json_deserializers.create_list_result_of_yojson ~error_deserializer
end

module CreateModel = struct
  let error_to_string = function
    | `AccessDeniedException _ -> "com.amazonaws.frauddetector#AccessDeniedException"
    | `InternalServerException _ -> "com.amazonaws.frauddetector#InternalServerException"
    | `ThrottlingException _ -> "com.amazonaws.frauddetector#ThrottlingException"
    | `ValidationException _ -> "com.amazonaws.frauddetector#ValidationException"
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

  let request context (request : create_model_request) =
    let input = Json_serializers.create_model_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"AWSHawksNestServiceFacade.CreateModel" ~service
      ~context ~input ~output_deserializer:Json_deserializers.create_model_result_of_yojson
      ~error_deserializer

  let request_with_metadata context (request : create_model_request) =
    let input = Json_serializers.create_model_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata
      ~shape_name:"AWSHawksNestServiceFacade.CreateModel" ~service ~context ~input
      ~output_deserializer:Json_deserializers.create_model_result_of_yojson ~error_deserializer
end

module CreateModelVersion = struct
  let error_to_string = function
    | `AccessDeniedException _ -> "com.amazonaws.frauddetector#AccessDeniedException"
    | `InternalServerException _ -> "com.amazonaws.frauddetector#InternalServerException"
    | `ResourceNotFoundException _ -> "com.amazonaws.frauddetector#ResourceNotFoundException"
    | `ThrottlingException _ -> "com.amazonaws.frauddetector#ThrottlingException"
    | `ValidationException _ -> "com.amazonaws.frauddetector#ValidationException"
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

  let request context (request : create_model_version_request) =
    let input = Json_serializers.create_model_version_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"AWSHawksNestServiceFacade.CreateModelVersion"
      ~service ~context ~input
      ~output_deserializer:Json_deserializers.create_model_version_result_of_yojson
      ~error_deserializer

  let request_with_metadata context (request : create_model_version_request) =
    let input = Json_serializers.create_model_version_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata
      ~shape_name:"AWSHawksNestServiceFacade.CreateModelVersion" ~service ~context ~input
      ~output_deserializer:Json_deserializers.create_model_version_result_of_yojson
      ~error_deserializer
end

module CreateRule = struct
  let error_to_string = function
    | `AccessDeniedException _ -> "com.amazonaws.frauddetector#AccessDeniedException"
    | `InternalServerException _ -> "com.amazonaws.frauddetector#InternalServerException"
    | `ThrottlingException _ -> "com.amazonaws.frauddetector#ThrottlingException"
    | `ValidationException _ -> "com.amazonaws.frauddetector#ValidationException"
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

  let request context (request : create_rule_request) =
    let input = Json_serializers.create_rule_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"AWSHawksNestServiceFacade.CreateRule" ~service
      ~context ~input ~output_deserializer:Json_deserializers.create_rule_result_of_yojson
      ~error_deserializer

  let request_with_metadata context (request : create_rule_request) =
    let input = Json_serializers.create_rule_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata
      ~shape_name:"AWSHawksNestServiceFacade.CreateRule" ~service ~context ~input
      ~output_deserializer:Json_deserializers.create_rule_result_of_yojson ~error_deserializer
end

module CreateVariable = struct
  let error_to_string = function
    | `AccessDeniedException _ -> "com.amazonaws.frauddetector#AccessDeniedException"
    | `InternalServerException _ -> "com.amazonaws.frauddetector#InternalServerException"
    | `ThrottlingException _ -> "com.amazonaws.frauddetector#ThrottlingException"
    | `ValidationException _ -> "com.amazonaws.frauddetector#ValidationException"
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

  let request context (request : create_variable_request) =
    let input = Json_serializers.create_variable_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"AWSHawksNestServiceFacade.CreateVariable"
      ~service ~context ~input
      ~output_deserializer:Json_deserializers.create_variable_result_of_yojson ~error_deserializer

  let request_with_metadata context (request : create_variable_request) =
    let input = Json_serializers.create_variable_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata
      ~shape_name:"AWSHawksNestServiceFacade.CreateVariable" ~service ~context ~input
      ~output_deserializer:Json_deserializers.create_variable_result_of_yojson ~error_deserializer
end

module DeleteBatchImportJob = struct
  let error_to_string = function
    | `AccessDeniedException _ -> "com.amazonaws.frauddetector#AccessDeniedException"
    | `InternalServerException _ -> "com.amazonaws.frauddetector#InternalServerException"
    | `ThrottlingException _ -> "com.amazonaws.frauddetector#ThrottlingException"
    | `ValidationException _ -> "com.amazonaws.frauddetector#ValidationException"
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

  let request context (request : delete_batch_import_job_request) =
    let input = Json_serializers.delete_batch_import_job_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"AWSHawksNestServiceFacade.DeleteBatchImportJob"
      ~service ~context ~input
      ~output_deserializer:Json_deserializers.delete_batch_import_job_result_of_yojson
      ~error_deserializer

  let request_with_metadata context (request : delete_batch_import_job_request) =
    let input = Json_serializers.delete_batch_import_job_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata
      ~shape_name:"AWSHawksNestServiceFacade.DeleteBatchImportJob" ~service ~context ~input
      ~output_deserializer:Json_deserializers.delete_batch_import_job_result_of_yojson
      ~error_deserializer
end

module DeleteBatchPredictionJob = struct
  let error_to_string = function
    | `AccessDeniedException _ -> "com.amazonaws.frauddetector#AccessDeniedException"
    | `InternalServerException _ -> "com.amazonaws.frauddetector#InternalServerException"
    | `ThrottlingException _ -> "com.amazonaws.frauddetector#ThrottlingException"
    | `ValidationException _ -> "com.amazonaws.frauddetector#ValidationException"
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

  let request context (request : delete_batch_prediction_job_request) =
    let input = Json_serializers.delete_batch_prediction_job_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request
      ~shape_name:"AWSHawksNestServiceFacade.DeleteBatchPredictionJob" ~service ~context ~input
      ~output_deserializer:Json_deserializers.delete_batch_prediction_job_result_of_yojson
      ~error_deserializer

  let request_with_metadata context (request : delete_batch_prediction_job_request) =
    let input = Json_serializers.delete_batch_prediction_job_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata
      ~shape_name:"AWSHawksNestServiceFacade.DeleteBatchPredictionJob" ~service ~context ~input
      ~output_deserializer:Json_deserializers.delete_batch_prediction_job_result_of_yojson
      ~error_deserializer
end

module DeleteDetector = struct
  let error_to_string = function
    | `AccessDeniedException _ -> "com.amazonaws.frauddetector#AccessDeniedException"
    | `ConflictException _ -> "com.amazonaws.frauddetector#ConflictException"
    | `InternalServerException _ -> "com.amazonaws.frauddetector#InternalServerException"
    | `ThrottlingException _ -> "com.amazonaws.frauddetector#ThrottlingException"
    | `ValidationException _ -> "com.amazonaws.frauddetector#ValidationException"
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
      | _, "ThrottlingException" ->
          `ThrottlingException (Json_deserializers.throttling_exception_of_yojson tree path)
      | _, "ValidationException" ->
          `ValidationException (Json_deserializers.validation_exception_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : delete_detector_request) =
    let input = Json_serializers.delete_detector_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"AWSHawksNestServiceFacade.DeleteDetector"
      ~service ~context ~input
      ~output_deserializer:Json_deserializers.delete_detector_result_of_yojson ~error_deserializer

  let request_with_metadata context (request : delete_detector_request) =
    let input = Json_serializers.delete_detector_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata
      ~shape_name:"AWSHawksNestServiceFacade.DeleteDetector" ~service ~context ~input
      ~output_deserializer:Json_deserializers.delete_detector_result_of_yojson ~error_deserializer
end

module DeleteDetectorVersion = struct
  let error_to_string = function
    | `AccessDeniedException _ -> "com.amazonaws.frauddetector#AccessDeniedException"
    | `ConflictException _ -> "com.amazonaws.frauddetector#ConflictException"
    | `InternalServerException _ -> "com.amazonaws.frauddetector#InternalServerException"
    | `ResourceNotFoundException _ -> "com.amazonaws.frauddetector#ResourceNotFoundException"
    | `ThrottlingException _ -> "com.amazonaws.frauddetector#ThrottlingException"
    | `ValidationException _ -> "com.amazonaws.frauddetector#ValidationException"
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

  let request context (request : delete_detector_version_request) =
    let input = Json_serializers.delete_detector_version_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request
      ~shape_name:"AWSHawksNestServiceFacade.DeleteDetectorVersion" ~service ~context ~input
      ~output_deserializer:Json_deserializers.delete_detector_version_result_of_yojson
      ~error_deserializer

  let request_with_metadata context (request : delete_detector_version_request) =
    let input = Json_serializers.delete_detector_version_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata
      ~shape_name:"AWSHawksNestServiceFacade.DeleteDetectorVersion" ~service ~context ~input
      ~output_deserializer:Json_deserializers.delete_detector_version_result_of_yojson
      ~error_deserializer
end

module DeleteEntityType = struct
  let error_to_string = function
    | `AccessDeniedException _ -> "com.amazonaws.frauddetector#AccessDeniedException"
    | `ConflictException _ -> "com.amazonaws.frauddetector#ConflictException"
    | `InternalServerException _ -> "com.amazonaws.frauddetector#InternalServerException"
    | `ThrottlingException _ -> "com.amazonaws.frauddetector#ThrottlingException"
    | `ValidationException _ -> "com.amazonaws.frauddetector#ValidationException"
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
      | _, "ThrottlingException" ->
          `ThrottlingException (Json_deserializers.throttling_exception_of_yojson tree path)
      | _, "ValidationException" ->
          `ValidationException (Json_deserializers.validation_exception_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : delete_entity_type_request) =
    let input = Json_serializers.delete_entity_type_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"AWSHawksNestServiceFacade.DeleteEntityType"
      ~service ~context ~input
      ~output_deserializer:Json_deserializers.delete_entity_type_result_of_yojson
      ~error_deserializer

  let request_with_metadata context (request : delete_entity_type_request) =
    let input = Json_serializers.delete_entity_type_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata
      ~shape_name:"AWSHawksNestServiceFacade.DeleteEntityType" ~service ~context ~input
      ~output_deserializer:Json_deserializers.delete_entity_type_result_of_yojson
      ~error_deserializer
end

module DeleteEvent = struct
  let error_to_string = function
    | `AccessDeniedException _ -> "com.amazonaws.frauddetector#AccessDeniedException"
    | `InternalServerException _ -> "com.amazonaws.frauddetector#InternalServerException"
    | `ThrottlingException _ -> "com.amazonaws.frauddetector#ThrottlingException"
    | `ValidationException _ -> "com.amazonaws.frauddetector#ValidationException"
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

  let request context (request : delete_event_request) =
    let input = Json_serializers.delete_event_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"AWSHawksNestServiceFacade.DeleteEvent" ~service
      ~context ~input ~output_deserializer:Json_deserializers.delete_event_result_of_yojson
      ~error_deserializer

  let request_with_metadata context (request : delete_event_request) =
    let input = Json_serializers.delete_event_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata
      ~shape_name:"AWSHawksNestServiceFacade.DeleteEvent" ~service ~context ~input
      ~output_deserializer:Json_deserializers.delete_event_result_of_yojson ~error_deserializer
end

module DeleteEventsByEventType = struct
  let error_to_string = function
    | `AccessDeniedException _ -> "com.amazonaws.frauddetector#AccessDeniedException"
    | `ConflictException _ -> "com.amazonaws.frauddetector#ConflictException"
    | `InternalServerException _ -> "com.amazonaws.frauddetector#InternalServerException"
    | `ResourceNotFoundException _ -> "com.amazonaws.frauddetector#ResourceNotFoundException"
    | `ThrottlingException _ -> "com.amazonaws.frauddetector#ThrottlingException"
    | `ValidationException _ -> "com.amazonaws.frauddetector#ValidationException"
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

  let request context (request : delete_events_by_event_type_request) =
    let input = Json_serializers.delete_events_by_event_type_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request
      ~shape_name:"AWSHawksNestServiceFacade.DeleteEventsByEventType" ~service ~context ~input
      ~output_deserializer:Json_deserializers.delete_events_by_event_type_result_of_yojson
      ~error_deserializer

  let request_with_metadata context (request : delete_events_by_event_type_request) =
    let input = Json_serializers.delete_events_by_event_type_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata
      ~shape_name:"AWSHawksNestServiceFacade.DeleteEventsByEventType" ~service ~context ~input
      ~output_deserializer:Json_deserializers.delete_events_by_event_type_result_of_yojson
      ~error_deserializer
end

module DeleteEventType = struct
  let error_to_string = function
    | `AccessDeniedException _ -> "com.amazonaws.frauddetector#AccessDeniedException"
    | `ConflictException _ -> "com.amazonaws.frauddetector#ConflictException"
    | `InternalServerException _ -> "com.amazonaws.frauddetector#InternalServerException"
    | `ThrottlingException _ -> "com.amazonaws.frauddetector#ThrottlingException"
    | `ValidationException _ -> "com.amazonaws.frauddetector#ValidationException"
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
      | _, "ThrottlingException" ->
          `ThrottlingException (Json_deserializers.throttling_exception_of_yojson tree path)
      | _, "ValidationException" ->
          `ValidationException (Json_deserializers.validation_exception_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : delete_event_type_request) =
    let input = Json_serializers.delete_event_type_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"AWSHawksNestServiceFacade.DeleteEventType"
      ~service ~context ~input
      ~output_deserializer:Json_deserializers.delete_event_type_result_of_yojson ~error_deserializer

  let request_with_metadata context (request : delete_event_type_request) =
    let input = Json_serializers.delete_event_type_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata
      ~shape_name:"AWSHawksNestServiceFacade.DeleteEventType" ~service ~context ~input
      ~output_deserializer:Json_deserializers.delete_event_type_result_of_yojson ~error_deserializer
end

module DeleteExternalModel = struct
  let error_to_string = function
    | `AccessDeniedException _ -> "com.amazonaws.frauddetector#AccessDeniedException"
    | `ConflictException _ -> "com.amazonaws.frauddetector#ConflictException"
    | `InternalServerException _ -> "com.amazonaws.frauddetector#InternalServerException"
    | `ThrottlingException _ -> "com.amazonaws.frauddetector#ThrottlingException"
    | `ValidationException _ -> "com.amazonaws.frauddetector#ValidationException"
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
      | _, "ThrottlingException" ->
          `ThrottlingException (Json_deserializers.throttling_exception_of_yojson tree path)
      | _, "ValidationException" ->
          `ValidationException (Json_deserializers.validation_exception_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : delete_external_model_request) =
    let input = Json_serializers.delete_external_model_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"AWSHawksNestServiceFacade.DeleteExternalModel"
      ~service ~context ~input
      ~output_deserializer:Json_deserializers.delete_external_model_result_of_yojson
      ~error_deserializer

  let request_with_metadata context (request : delete_external_model_request) =
    let input = Json_serializers.delete_external_model_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata
      ~shape_name:"AWSHawksNestServiceFacade.DeleteExternalModel" ~service ~context ~input
      ~output_deserializer:Json_deserializers.delete_external_model_result_of_yojson
      ~error_deserializer
end

module DeleteLabel = struct
  let error_to_string = function
    | `ConflictException _ -> "com.amazonaws.frauddetector#ConflictException"
    | `InternalServerException _ -> "com.amazonaws.frauddetector#InternalServerException"
    | `ThrottlingException _ -> "com.amazonaws.frauddetector#ThrottlingException"
    | `ValidationException _ -> "com.amazonaws.frauddetector#ValidationException"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "ConflictException" ->
          `ConflictException (Json_deserializers.conflict_exception_of_yojson tree path)
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

  let request context (request : delete_label_request) =
    let input = Json_serializers.delete_label_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"AWSHawksNestServiceFacade.DeleteLabel" ~service
      ~context ~input ~output_deserializer:Json_deserializers.delete_label_result_of_yojson
      ~error_deserializer

  let request_with_metadata context (request : delete_label_request) =
    let input = Json_serializers.delete_label_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata
      ~shape_name:"AWSHawksNestServiceFacade.DeleteLabel" ~service ~context ~input
      ~output_deserializer:Json_deserializers.delete_label_result_of_yojson ~error_deserializer
end

module DeleteList = struct
  let error_to_string = function
    | `AccessDeniedException _ -> "com.amazonaws.frauddetector#AccessDeniedException"
    | `ConflictException _ -> "com.amazonaws.frauddetector#ConflictException"
    | `InternalServerException _ -> "com.amazonaws.frauddetector#InternalServerException"
    | `ThrottlingException _ -> "com.amazonaws.frauddetector#ThrottlingException"
    | `ValidationException _ -> "com.amazonaws.frauddetector#ValidationException"
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
      | _, "ThrottlingException" ->
          `ThrottlingException (Json_deserializers.throttling_exception_of_yojson tree path)
      | _, "ValidationException" ->
          `ValidationException (Json_deserializers.validation_exception_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : delete_list_request) =
    let input = Json_serializers.delete_list_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"AWSHawksNestServiceFacade.DeleteList" ~service
      ~context ~input ~output_deserializer:Json_deserializers.delete_list_result_of_yojson
      ~error_deserializer

  let request_with_metadata context (request : delete_list_request) =
    let input = Json_serializers.delete_list_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata
      ~shape_name:"AWSHawksNestServiceFacade.DeleteList" ~service ~context ~input
      ~output_deserializer:Json_deserializers.delete_list_result_of_yojson ~error_deserializer
end

module DeleteModel = struct
  let error_to_string = function
    | `AccessDeniedException _ -> "com.amazonaws.frauddetector#AccessDeniedException"
    | `ConflictException _ -> "com.amazonaws.frauddetector#ConflictException"
    | `InternalServerException _ -> "com.amazonaws.frauddetector#InternalServerException"
    | `ThrottlingException _ -> "com.amazonaws.frauddetector#ThrottlingException"
    | `ValidationException _ -> "com.amazonaws.frauddetector#ValidationException"
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
      | _, "ThrottlingException" ->
          `ThrottlingException (Json_deserializers.throttling_exception_of_yojson tree path)
      | _, "ValidationException" ->
          `ValidationException (Json_deserializers.validation_exception_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : delete_model_request) =
    let input = Json_serializers.delete_model_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"AWSHawksNestServiceFacade.DeleteModel" ~service
      ~context ~input ~output_deserializer:Json_deserializers.delete_model_result_of_yojson
      ~error_deserializer

  let request_with_metadata context (request : delete_model_request) =
    let input = Json_serializers.delete_model_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata
      ~shape_name:"AWSHawksNestServiceFacade.DeleteModel" ~service ~context ~input
      ~output_deserializer:Json_deserializers.delete_model_result_of_yojson ~error_deserializer
end

module DeleteModelVersion = struct
  let error_to_string = function
    | `AccessDeniedException _ -> "com.amazonaws.frauddetector#AccessDeniedException"
    | `ConflictException _ -> "com.amazonaws.frauddetector#ConflictException"
    | `InternalServerException _ -> "com.amazonaws.frauddetector#InternalServerException"
    | `ThrottlingException _ -> "com.amazonaws.frauddetector#ThrottlingException"
    | `ValidationException _ -> "com.amazonaws.frauddetector#ValidationException"
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
      | _, "ThrottlingException" ->
          `ThrottlingException (Json_deserializers.throttling_exception_of_yojson tree path)
      | _, "ValidationException" ->
          `ValidationException (Json_deserializers.validation_exception_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : delete_model_version_request) =
    let input = Json_serializers.delete_model_version_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"AWSHawksNestServiceFacade.DeleteModelVersion"
      ~service ~context ~input
      ~output_deserializer:Json_deserializers.delete_model_version_result_of_yojson
      ~error_deserializer

  let request_with_metadata context (request : delete_model_version_request) =
    let input = Json_serializers.delete_model_version_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata
      ~shape_name:"AWSHawksNestServiceFacade.DeleteModelVersion" ~service ~context ~input
      ~output_deserializer:Json_deserializers.delete_model_version_result_of_yojson
      ~error_deserializer
end

module DeleteOutcome = struct
  let error_to_string = function
    | `AccessDeniedException _ -> "com.amazonaws.frauddetector#AccessDeniedException"
    | `ConflictException _ -> "com.amazonaws.frauddetector#ConflictException"
    | `InternalServerException _ -> "com.amazonaws.frauddetector#InternalServerException"
    | `ThrottlingException _ -> "com.amazonaws.frauddetector#ThrottlingException"
    | `ValidationException _ -> "com.amazonaws.frauddetector#ValidationException"
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
      | _, "ThrottlingException" ->
          `ThrottlingException (Json_deserializers.throttling_exception_of_yojson tree path)
      | _, "ValidationException" ->
          `ValidationException (Json_deserializers.validation_exception_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : delete_outcome_request) =
    let input = Json_serializers.delete_outcome_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"AWSHawksNestServiceFacade.DeleteOutcome"
      ~service ~context ~input
      ~output_deserializer:Json_deserializers.delete_outcome_result_of_yojson ~error_deserializer

  let request_with_metadata context (request : delete_outcome_request) =
    let input = Json_serializers.delete_outcome_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata
      ~shape_name:"AWSHawksNestServiceFacade.DeleteOutcome" ~service ~context ~input
      ~output_deserializer:Json_deserializers.delete_outcome_result_of_yojson ~error_deserializer
end

module DeleteRule = struct
  let error_to_string = function
    | `AccessDeniedException _ -> "com.amazonaws.frauddetector#AccessDeniedException"
    | `ConflictException _ -> "com.amazonaws.frauddetector#ConflictException"
    | `InternalServerException _ -> "com.amazonaws.frauddetector#InternalServerException"
    | `ThrottlingException _ -> "com.amazonaws.frauddetector#ThrottlingException"
    | `ValidationException _ -> "com.amazonaws.frauddetector#ValidationException"
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
      | _, "ThrottlingException" ->
          `ThrottlingException (Json_deserializers.throttling_exception_of_yojson tree path)
      | _, "ValidationException" ->
          `ValidationException (Json_deserializers.validation_exception_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : delete_rule_request) =
    let input = Json_serializers.delete_rule_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"AWSHawksNestServiceFacade.DeleteRule" ~service
      ~context ~input ~output_deserializer:Json_deserializers.delete_rule_result_of_yojson
      ~error_deserializer

  let request_with_metadata context (request : delete_rule_request) =
    let input = Json_serializers.delete_rule_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata
      ~shape_name:"AWSHawksNestServiceFacade.DeleteRule" ~service ~context ~input
      ~output_deserializer:Json_deserializers.delete_rule_result_of_yojson ~error_deserializer
end

module DeleteVariable = struct
  let error_to_string = function
    | `AccessDeniedException _ -> "com.amazonaws.frauddetector#AccessDeniedException"
    | `ConflictException _ -> "com.amazonaws.frauddetector#ConflictException"
    | `InternalServerException _ -> "com.amazonaws.frauddetector#InternalServerException"
    | `ThrottlingException _ -> "com.amazonaws.frauddetector#ThrottlingException"
    | `ValidationException _ -> "com.amazonaws.frauddetector#ValidationException"
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
      | _, "ThrottlingException" ->
          `ThrottlingException (Json_deserializers.throttling_exception_of_yojson tree path)
      | _, "ValidationException" ->
          `ValidationException (Json_deserializers.validation_exception_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : delete_variable_request) =
    let input = Json_serializers.delete_variable_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"AWSHawksNestServiceFacade.DeleteVariable"
      ~service ~context ~input
      ~output_deserializer:Json_deserializers.delete_variable_result_of_yojson ~error_deserializer

  let request_with_metadata context (request : delete_variable_request) =
    let input = Json_serializers.delete_variable_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata
      ~shape_name:"AWSHawksNestServiceFacade.DeleteVariable" ~service ~context ~input
      ~output_deserializer:Json_deserializers.delete_variable_result_of_yojson ~error_deserializer
end

module DescribeDetector = struct
  let error_to_string = function
    | `AccessDeniedException _ -> "com.amazonaws.frauddetector#AccessDeniedException"
    | `InternalServerException _ -> "com.amazonaws.frauddetector#InternalServerException"
    | `ResourceNotFoundException _ -> "com.amazonaws.frauddetector#ResourceNotFoundException"
    | `ThrottlingException _ -> "com.amazonaws.frauddetector#ThrottlingException"
    | `ValidationException _ -> "com.amazonaws.frauddetector#ValidationException"
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

  let request context (request : describe_detector_request) =
    let input = Json_serializers.describe_detector_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"AWSHawksNestServiceFacade.DescribeDetector"
      ~service ~context ~input
      ~output_deserializer:Json_deserializers.describe_detector_result_of_yojson ~error_deserializer

  let request_with_metadata context (request : describe_detector_request) =
    let input = Json_serializers.describe_detector_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata
      ~shape_name:"AWSHawksNestServiceFacade.DescribeDetector" ~service ~context ~input
      ~output_deserializer:Json_deserializers.describe_detector_result_of_yojson ~error_deserializer
end

module DescribeModelVersions = struct
  let error_to_string = function
    | `AccessDeniedException _ -> "com.amazonaws.frauddetector#AccessDeniedException"
    | `InternalServerException _ -> "com.amazonaws.frauddetector#InternalServerException"
    | `ResourceNotFoundException _ -> "com.amazonaws.frauddetector#ResourceNotFoundException"
    | `ThrottlingException _ -> "com.amazonaws.frauddetector#ThrottlingException"
    | `ValidationException _ -> "com.amazonaws.frauddetector#ValidationException"
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

  let request context (request : describe_model_versions_request) =
    let input = Json_serializers.describe_model_versions_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request
      ~shape_name:"AWSHawksNestServiceFacade.DescribeModelVersions" ~service ~context ~input
      ~output_deserializer:Json_deserializers.describe_model_versions_result_of_yojson
      ~error_deserializer

  let request_with_metadata context (request : describe_model_versions_request) =
    let input = Json_serializers.describe_model_versions_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata
      ~shape_name:"AWSHawksNestServiceFacade.DescribeModelVersions" ~service ~context ~input
      ~output_deserializer:Json_deserializers.describe_model_versions_result_of_yojson
      ~error_deserializer
end

module GetBatchImportJobs = struct
  let error_to_string = function
    | `AccessDeniedException _ -> "com.amazonaws.frauddetector#AccessDeniedException"
    | `InternalServerException _ -> "com.amazonaws.frauddetector#InternalServerException"
    | `ResourceNotFoundException _ -> "com.amazonaws.frauddetector#ResourceNotFoundException"
    | `ThrottlingException _ -> "com.amazonaws.frauddetector#ThrottlingException"
    | `ValidationException _ -> "com.amazonaws.frauddetector#ValidationException"
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

  let request context (request : get_batch_import_jobs_request) =
    let input = Json_serializers.get_batch_import_jobs_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"AWSHawksNestServiceFacade.GetBatchImportJobs"
      ~service ~context ~input
      ~output_deserializer:Json_deserializers.get_batch_import_jobs_result_of_yojson
      ~error_deserializer

  let request_with_metadata context (request : get_batch_import_jobs_request) =
    let input = Json_serializers.get_batch_import_jobs_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata
      ~shape_name:"AWSHawksNestServiceFacade.GetBatchImportJobs" ~service ~context ~input
      ~output_deserializer:Json_deserializers.get_batch_import_jobs_result_of_yojson
      ~error_deserializer
end

module GetBatchPredictionJobs = struct
  let error_to_string = function
    | `AccessDeniedException _ -> "com.amazonaws.frauddetector#AccessDeniedException"
    | `InternalServerException _ -> "com.amazonaws.frauddetector#InternalServerException"
    | `ResourceNotFoundException _ -> "com.amazonaws.frauddetector#ResourceNotFoundException"
    | `ThrottlingException _ -> "com.amazonaws.frauddetector#ThrottlingException"
    | `ValidationException _ -> "com.amazonaws.frauddetector#ValidationException"
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

  let request context (request : get_batch_prediction_jobs_request) =
    let input = Json_serializers.get_batch_prediction_jobs_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request
      ~shape_name:"AWSHawksNestServiceFacade.GetBatchPredictionJobs" ~service ~context ~input
      ~output_deserializer:Json_deserializers.get_batch_prediction_jobs_result_of_yojson
      ~error_deserializer

  let request_with_metadata context (request : get_batch_prediction_jobs_request) =
    let input = Json_serializers.get_batch_prediction_jobs_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata
      ~shape_name:"AWSHawksNestServiceFacade.GetBatchPredictionJobs" ~service ~context ~input
      ~output_deserializer:Json_deserializers.get_batch_prediction_jobs_result_of_yojson
      ~error_deserializer
end

module GetDeleteEventsByEventTypeStatus = struct
  let error_to_string = function
    | `AccessDeniedException _ -> "com.amazonaws.frauddetector#AccessDeniedException"
    | `InternalServerException _ -> "com.amazonaws.frauddetector#InternalServerException"
    | `ResourceNotFoundException _ -> "com.amazonaws.frauddetector#ResourceNotFoundException"
    | `ThrottlingException _ -> "com.amazonaws.frauddetector#ThrottlingException"
    | `ValidationException _ -> "com.amazonaws.frauddetector#ValidationException"
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

  let request context (request : get_delete_events_by_event_type_status_request) =
    let input = Json_serializers.get_delete_events_by_event_type_status_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request
      ~shape_name:"AWSHawksNestServiceFacade.GetDeleteEventsByEventTypeStatus" ~service ~context
      ~input
      ~output_deserializer:
        Json_deserializers.get_delete_events_by_event_type_status_result_of_yojson
      ~error_deserializer

  let request_with_metadata context (request : get_delete_events_by_event_type_status_request) =
    let input = Json_serializers.get_delete_events_by_event_type_status_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata
      ~shape_name:"AWSHawksNestServiceFacade.GetDeleteEventsByEventTypeStatus" ~service ~context
      ~input
      ~output_deserializer:
        Json_deserializers.get_delete_events_by_event_type_status_result_of_yojson
      ~error_deserializer
end

module GetDetectors = struct
  let error_to_string = function
    | `AccessDeniedException _ -> "com.amazonaws.frauddetector#AccessDeniedException"
    | `InternalServerException _ -> "com.amazonaws.frauddetector#InternalServerException"
    | `ResourceNotFoundException _ -> "com.amazonaws.frauddetector#ResourceNotFoundException"
    | `ThrottlingException _ -> "com.amazonaws.frauddetector#ThrottlingException"
    | `ValidationException _ -> "com.amazonaws.frauddetector#ValidationException"
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

  let request context (request : get_detectors_request) =
    let input = Json_serializers.get_detectors_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"AWSHawksNestServiceFacade.GetDetectors"
      ~service ~context ~input
      ~output_deserializer:Json_deserializers.get_detectors_result_of_yojson ~error_deserializer

  let request_with_metadata context (request : get_detectors_request) =
    let input = Json_serializers.get_detectors_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata
      ~shape_name:"AWSHawksNestServiceFacade.GetDetectors" ~service ~context ~input
      ~output_deserializer:Json_deserializers.get_detectors_result_of_yojson ~error_deserializer
end

module GetDetectorVersion = struct
  let error_to_string = function
    | `AccessDeniedException _ -> "com.amazonaws.frauddetector#AccessDeniedException"
    | `InternalServerException _ -> "com.amazonaws.frauddetector#InternalServerException"
    | `ResourceNotFoundException _ -> "com.amazonaws.frauddetector#ResourceNotFoundException"
    | `ThrottlingException _ -> "com.amazonaws.frauddetector#ThrottlingException"
    | `ValidationException _ -> "com.amazonaws.frauddetector#ValidationException"
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

  let request context (request : get_detector_version_request) =
    let input = Json_serializers.get_detector_version_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"AWSHawksNestServiceFacade.GetDetectorVersion"
      ~service ~context ~input
      ~output_deserializer:Json_deserializers.get_detector_version_result_of_yojson
      ~error_deserializer

  let request_with_metadata context (request : get_detector_version_request) =
    let input = Json_serializers.get_detector_version_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata
      ~shape_name:"AWSHawksNestServiceFacade.GetDetectorVersion" ~service ~context ~input
      ~output_deserializer:Json_deserializers.get_detector_version_result_of_yojson
      ~error_deserializer
end

module GetEntityTypes = struct
  let error_to_string = function
    | `AccessDeniedException _ -> "com.amazonaws.frauddetector#AccessDeniedException"
    | `InternalServerException _ -> "com.amazonaws.frauddetector#InternalServerException"
    | `ResourceNotFoundException _ -> "com.amazonaws.frauddetector#ResourceNotFoundException"
    | `ThrottlingException _ -> "com.amazonaws.frauddetector#ThrottlingException"
    | `ValidationException _ -> "com.amazonaws.frauddetector#ValidationException"
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

  let request context (request : get_entity_types_request) =
    let input = Json_serializers.get_entity_types_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"AWSHawksNestServiceFacade.GetEntityTypes"
      ~service ~context ~input
      ~output_deserializer:Json_deserializers.get_entity_types_result_of_yojson ~error_deserializer

  let request_with_metadata context (request : get_entity_types_request) =
    let input = Json_serializers.get_entity_types_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata
      ~shape_name:"AWSHawksNestServiceFacade.GetEntityTypes" ~service ~context ~input
      ~output_deserializer:Json_deserializers.get_entity_types_result_of_yojson ~error_deserializer
end

module GetEvent = struct
  let error_to_string = function
    | `AccessDeniedException _ -> "com.amazonaws.frauddetector#AccessDeniedException"
    | `InternalServerException _ -> "com.amazonaws.frauddetector#InternalServerException"
    | `ResourceNotFoundException _ -> "com.amazonaws.frauddetector#ResourceNotFoundException"
    | `ThrottlingException _ -> "com.amazonaws.frauddetector#ThrottlingException"
    | `ValidationException _ -> "com.amazonaws.frauddetector#ValidationException"
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

  let request context (request : get_event_request) =
    let input = Json_serializers.get_event_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"AWSHawksNestServiceFacade.GetEvent" ~service
      ~context ~input ~output_deserializer:Json_deserializers.get_event_result_of_yojson
      ~error_deserializer

  let request_with_metadata context (request : get_event_request) =
    let input = Json_serializers.get_event_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata
      ~shape_name:"AWSHawksNestServiceFacade.GetEvent" ~service ~context ~input
      ~output_deserializer:Json_deserializers.get_event_result_of_yojson ~error_deserializer
end

module GetEventPrediction = struct
  let error_to_string = function
    | `AccessDeniedException _ -> "com.amazonaws.frauddetector#AccessDeniedException"
    | `ConflictException _ -> "com.amazonaws.frauddetector#ConflictException"
    | `InternalServerException _ -> "com.amazonaws.frauddetector#InternalServerException"
    | `ResourceNotFoundException _ -> "com.amazonaws.frauddetector#ResourceNotFoundException"
    | `ResourceUnavailableException _ -> "com.amazonaws.frauddetector#ResourceUnavailableException"
    | `ThrottlingException _ -> "com.amazonaws.frauddetector#ThrottlingException"
    | `ValidationException _ -> "com.amazonaws.frauddetector#ValidationException"
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

  let request context (request : get_event_prediction_request) =
    let input = Json_serializers.get_event_prediction_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"AWSHawksNestServiceFacade.GetEventPrediction"
      ~service ~context ~input
      ~output_deserializer:Json_deserializers.get_event_prediction_result_of_yojson
      ~error_deserializer

  let request_with_metadata context (request : get_event_prediction_request) =
    let input = Json_serializers.get_event_prediction_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata
      ~shape_name:"AWSHawksNestServiceFacade.GetEventPrediction" ~service ~context ~input
      ~output_deserializer:Json_deserializers.get_event_prediction_result_of_yojson
      ~error_deserializer
end

module GetEventPredictionMetadata = struct
  let error_to_string = function
    | `AccessDeniedException _ -> "com.amazonaws.frauddetector#AccessDeniedException"
    | `InternalServerException _ -> "com.amazonaws.frauddetector#InternalServerException"
    | `ResourceNotFoundException _ -> "com.amazonaws.frauddetector#ResourceNotFoundException"
    | `ThrottlingException _ -> "com.amazonaws.frauddetector#ThrottlingException"
    | `ValidationException _ -> "com.amazonaws.frauddetector#ValidationException"
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

  let request context (request : get_event_prediction_metadata_request) =
    let input = Json_serializers.get_event_prediction_metadata_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request
      ~shape_name:"AWSHawksNestServiceFacade.GetEventPredictionMetadata" ~service ~context ~input
      ~output_deserializer:Json_deserializers.get_event_prediction_metadata_result_of_yojson
      ~error_deserializer

  let request_with_metadata context (request : get_event_prediction_metadata_request) =
    let input = Json_serializers.get_event_prediction_metadata_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata
      ~shape_name:"AWSHawksNestServiceFacade.GetEventPredictionMetadata" ~service ~context ~input
      ~output_deserializer:Json_deserializers.get_event_prediction_metadata_result_of_yojson
      ~error_deserializer
end

module GetEventTypes = struct
  let error_to_string = function
    | `AccessDeniedException _ -> "com.amazonaws.frauddetector#AccessDeniedException"
    | `InternalServerException _ -> "com.amazonaws.frauddetector#InternalServerException"
    | `ResourceNotFoundException _ -> "com.amazonaws.frauddetector#ResourceNotFoundException"
    | `ThrottlingException _ -> "com.amazonaws.frauddetector#ThrottlingException"
    | `ValidationException _ -> "com.amazonaws.frauddetector#ValidationException"
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

  let request context (request : get_event_types_request) =
    let input = Json_serializers.get_event_types_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"AWSHawksNestServiceFacade.GetEventTypes"
      ~service ~context ~input
      ~output_deserializer:Json_deserializers.get_event_types_result_of_yojson ~error_deserializer

  let request_with_metadata context (request : get_event_types_request) =
    let input = Json_serializers.get_event_types_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata
      ~shape_name:"AWSHawksNestServiceFacade.GetEventTypes" ~service ~context ~input
      ~output_deserializer:Json_deserializers.get_event_types_result_of_yojson ~error_deserializer
end

module GetExternalModels = struct
  let error_to_string = function
    | `AccessDeniedException _ -> "com.amazonaws.frauddetector#AccessDeniedException"
    | `InternalServerException _ -> "com.amazonaws.frauddetector#InternalServerException"
    | `ResourceNotFoundException _ -> "com.amazonaws.frauddetector#ResourceNotFoundException"
    | `ThrottlingException _ -> "com.amazonaws.frauddetector#ThrottlingException"
    | `ValidationException _ -> "com.amazonaws.frauddetector#ValidationException"
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

  let request context (request : get_external_models_request) =
    let input = Json_serializers.get_external_models_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"AWSHawksNestServiceFacade.GetExternalModels"
      ~service ~context ~input
      ~output_deserializer:Json_deserializers.get_external_models_result_of_yojson
      ~error_deserializer

  let request_with_metadata context (request : get_external_models_request) =
    let input = Json_serializers.get_external_models_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata
      ~shape_name:"AWSHawksNestServiceFacade.GetExternalModels" ~service ~context ~input
      ~output_deserializer:Json_deserializers.get_external_models_result_of_yojson
      ~error_deserializer
end

module GetKMSEncryptionKey = struct
  let error_to_string = function
    | `AccessDeniedException _ -> "com.amazonaws.frauddetector#AccessDeniedException"
    | `InternalServerException _ -> "com.amazonaws.frauddetector#InternalServerException"
    | `ResourceNotFoundException _ -> "com.amazonaws.frauddetector#ResourceNotFoundException"
    | `ThrottlingException _ -> "com.amazonaws.frauddetector#ThrottlingException"
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
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : Smaws_Lib.Smithy_api.Types.unit_) =
    let input = Smaws_Lib.Smithy_api.Json_serializers.unit__to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"AWSHawksNestServiceFacade.GetKMSEncryptionKey"
      ~service ~context ~input
      ~output_deserializer:Json_deserializers.get_kms_encryption_key_result_of_yojson
      ~error_deserializer

  let request_with_metadata context (request : Smaws_Lib.Smithy_api.Types.unit_) =
    let input = Smaws_Lib.Smithy_api.Json_serializers.unit__to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata
      ~shape_name:"AWSHawksNestServiceFacade.GetKMSEncryptionKey" ~service ~context ~input
      ~output_deserializer:Json_deserializers.get_kms_encryption_key_result_of_yojson
      ~error_deserializer
end

module GetLabels = struct
  let error_to_string = function
    | `AccessDeniedException _ -> "com.amazonaws.frauddetector#AccessDeniedException"
    | `InternalServerException _ -> "com.amazonaws.frauddetector#InternalServerException"
    | `ResourceNotFoundException _ -> "com.amazonaws.frauddetector#ResourceNotFoundException"
    | `ThrottlingException _ -> "com.amazonaws.frauddetector#ThrottlingException"
    | `ValidationException _ -> "com.amazonaws.frauddetector#ValidationException"
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

  let request context (request : get_labels_request) =
    let input = Json_serializers.get_labels_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"AWSHawksNestServiceFacade.GetLabels" ~service
      ~context ~input ~output_deserializer:Json_deserializers.get_labels_result_of_yojson
      ~error_deserializer

  let request_with_metadata context (request : get_labels_request) =
    let input = Json_serializers.get_labels_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata
      ~shape_name:"AWSHawksNestServiceFacade.GetLabels" ~service ~context ~input
      ~output_deserializer:Json_deserializers.get_labels_result_of_yojson ~error_deserializer
end

module GetListElements = struct
  let error_to_string = function
    | `AccessDeniedException _ -> "com.amazonaws.frauddetector#AccessDeniedException"
    | `InternalServerException _ -> "com.amazonaws.frauddetector#InternalServerException"
    | `ResourceNotFoundException _ -> "com.amazonaws.frauddetector#ResourceNotFoundException"
    | `ThrottlingException _ -> "com.amazonaws.frauddetector#ThrottlingException"
    | `ValidationException _ -> "com.amazonaws.frauddetector#ValidationException"
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

  let request context (request : get_list_elements_request) =
    let input = Json_serializers.get_list_elements_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"AWSHawksNestServiceFacade.GetListElements"
      ~service ~context ~input
      ~output_deserializer:Json_deserializers.get_list_elements_result_of_yojson ~error_deserializer

  let request_with_metadata context (request : get_list_elements_request) =
    let input = Json_serializers.get_list_elements_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata
      ~shape_name:"AWSHawksNestServiceFacade.GetListElements" ~service ~context ~input
      ~output_deserializer:Json_deserializers.get_list_elements_result_of_yojson ~error_deserializer
end

module GetListsMetadata = struct
  let error_to_string = function
    | `AccessDeniedException _ -> "com.amazonaws.frauddetector#AccessDeniedException"
    | `InternalServerException _ -> "com.amazonaws.frauddetector#InternalServerException"
    | `ResourceNotFoundException _ -> "com.amazonaws.frauddetector#ResourceNotFoundException"
    | `ThrottlingException _ -> "com.amazonaws.frauddetector#ThrottlingException"
    | `ValidationException _ -> "com.amazonaws.frauddetector#ValidationException"
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

  let request context (request : get_lists_metadata_request) =
    let input = Json_serializers.get_lists_metadata_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"AWSHawksNestServiceFacade.GetListsMetadata"
      ~service ~context ~input
      ~output_deserializer:Json_deserializers.get_lists_metadata_result_of_yojson
      ~error_deserializer

  let request_with_metadata context (request : get_lists_metadata_request) =
    let input = Json_serializers.get_lists_metadata_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata
      ~shape_name:"AWSHawksNestServiceFacade.GetListsMetadata" ~service ~context ~input
      ~output_deserializer:Json_deserializers.get_lists_metadata_result_of_yojson
      ~error_deserializer
end

module GetModels = struct
  let error_to_string = function
    | `AccessDeniedException _ -> "com.amazonaws.frauddetector#AccessDeniedException"
    | `InternalServerException _ -> "com.amazonaws.frauddetector#InternalServerException"
    | `ResourceNotFoundException _ -> "com.amazonaws.frauddetector#ResourceNotFoundException"
    | `ThrottlingException _ -> "com.amazonaws.frauddetector#ThrottlingException"
    | `ValidationException _ -> "com.amazonaws.frauddetector#ValidationException"
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

  let request context (request : get_models_request) =
    let input = Json_serializers.get_models_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"AWSHawksNestServiceFacade.GetModels" ~service
      ~context ~input ~output_deserializer:Json_deserializers.get_models_result_of_yojson
      ~error_deserializer

  let request_with_metadata context (request : get_models_request) =
    let input = Json_serializers.get_models_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata
      ~shape_name:"AWSHawksNestServiceFacade.GetModels" ~service ~context ~input
      ~output_deserializer:Json_deserializers.get_models_result_of_yojson ~error_deserializer
end

module GetModelVersion = struct
  let error_to_string = function
    | `AccessDeniedException _ -> "com.amazonaws.frauddetector#AccessDeniedException"
    | `InternalServerException _ -> "com.amazonaws.frauddetector#InternalServerException"
    | `ResourceNotFoundException _ -> "com.amazonaws.frauddetector#ResourceNotFoundException"
    | `ThrottlingException _ -> "com.amazonaws.frauddetector#ThrottlingException"
    | `ValidationException _ -> "com.amazonaws.frauddetector#ValidationException"
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

  let request context (request : get_model_version_request) =
    let input = Json_serializers.get_model_version_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"AWSHawksNestServiceFacade.GetModelVersion"
      ~service ~context ~input
      ~output_deserializer:Json_deserializers.get_model_version_result_of_yojson ~error_deserializer

  let request_with_metadata context (request : get_model_version_request) =
    let input = Json_serializers.get_model_version_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata
      ~shape_name:"AWSHawksNestServiceFacade.GetModelVersion" ~service ~context ~input
      ~output_deserializer:Json_deserializers.get_model_version_result_of_yojson ~error_deserializer
end

module GetOutcomes = struct
  let error_to_string = function
    | `AccessDeniedException _ -> "com.amazonaws.frauddetector#AccessDeniedException"
    | `InternalServerException _ -> "com.amazonaws.frauddetector#InternalServerException"
    | `ResourceNotFoundException _ -> "com.amazonaws.frauddetector#ResourceNotFoundException"
    | `ThrottlingException _ -> "com.amazonaws.frauddetector#ThrottlingException"
    | `ValidationException _ -> "com.amazonaws.frauddetector#ValidationException"
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

  let request context (request : get_outcomes_request) =
    let input = Json_serializers.get_outcomes_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"AWSHawksNestServiceFacade.GetOutcomes" ~service
      ~context ~input ~output_deserializer:Json_deserializers.get_outcomes_result_of_yojson
      ~error_deserializer

  let request_with_metadata context (request : get_outcomes_request) =
    let input = Json_serializers.get_outcomes_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata
      ~shape_name:"AWSHawksNestServiceFacade.GetOutcomes" ~service ~context ~input
      ~output_deserializer:Json_deserializers.get_outcomes_result_of_yojson ~error_deserializer
end

module GetRules = struct
  let error_to_string = function
    | `AccessDeniedException _ -> "com.amazonaws.frauddetector#AccessDeniedException"
    | `InternalServerException _ -> "com.amazonaws.frauddetector#InternalServerException"
    | `ResourceNotFoundException _ -> "com.amazonaws.frauddetector#ResourceNotFoundException"
    | `ThrottlingException _ -> "com.amazonaws.frauddetector#ThrottlingException"
    | `ValidationException _ -> "com.amazonaws.frauddetector#ValidationException"
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

  let request context (request : get_rules_request) =
    let input = Json_serializers.get_rules_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"AWSHawksNestServiceFacade.GetRules" ~service
      ~context ~input ~output_deserializer:Json_deserializers.get_rules_result_of_yojson
      ~error_deserializer

  let request_with_metadata context (request : get_rules_request) =
    let input = Json_serializers.get_rules_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata
      ~shape_name:"AWSHawksNestServiceFacade.GetRules" ~service ~context ~input
      ~output_deserializer:Json_deserializers.get_rules_result_of_yojson ~error_deserializer
end

module GetVariables = struct
  let error_to_string = function
    | `AccessDeniedException _ -> "com.amazonaws.frauddetector#AccessDeniedException"
    | `InternalServerException _ -> "com.amazonaws.frauddetector#InternalServerException"
    | `ResourceNotFoundException _ -> "com.amazonaws.frauddetector#ResourceNotFoundException"
    | `ThrottlingException _ -> "com.amazonaws.frauddetector#ThrottlingException"
    | `ValidationException _ -> "com.amazonaws.frauddetector#ValidationException"
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

  let request context (request : get_variables_request) =
    let input = Json_serializers.get_variables_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"AWSHawksNestServiceFacade.GetVariables"
      ~service ~context ~input
      ~output_deserializer:Json_deserializers.get_variables_result_of_yojson ~error_deserializer

  let request_with_metadata context (request : get_variables_request) =
    let input = Json_serializers.get_variables_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata
      ~shape_name:"AWSHawksNestServiceFacade.GetVariables" ~service ~context ~input
      ~output_deserializer:Json_deserializers.get_variables_result_of_yojson ~error_deserializer
end

module ListEventPredictions = struct
  let error_to_string = function
    | `AccessDeniedException _ -> "com.amazonaws.frauddetector#AccessDeniedException"
    | `InternalServerException _ -> "com.amazonaws.frauddetector#InternalServerException"
    | `ThrottlingException _ -> "com.amazonaws.frauddetector#ThrottlingException"
    | `ValidationException _ -> "com.amazonaws.frauddetector#ValidationException"
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

  let request context (request : list_event_predictions_request) =
    let input = Json_serializers.list_event_predictions_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"AWSHawksNestServiceFacade.ListEventPredictions"
      ~service ~context ~input
      ~output_deserializer:Json_deserializers.list_event_predictions_result_of_yojson
      ~error_deserializer

  let request_with_metadata context (request : list_event_predictions_request) =
    let input = Json_serializers.list_event_predictions_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata
      ~shape_name:"AWSHawksNestServiceFacade.ListEventPredictions" ~service ~context ~input
      ~output_deserializer:Json_deserializers.list_event_predictions_result_of_yojson
      ~error_deserializer
end

module ListTagsForResource = struct
  let error_to_string = function
    | `AccessDeniedException _ -> "com.amazonaws.frauddetector#AccessDeniedException"
    | `ResourceNotFoundException _ -> "com.amazonaws.frauddetector#ResourceNotFoundException"
    | `ThrottlingException _ -> "com.amazonaws.frauddetector#ThrottlingException"
    | `ValidationException _ -> "com.amazonaws.frauddetector#ValidationException"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "AccessDeniedException" ->
          `AccessDeniedException (Json_deserializers.access_denied_exception_of_yojson tree path)
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

  let request context (request : list_tags_for_resource_request) =
    let input = Json_serializers.list_tags_for_resource_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"AWSHawksNestServiceFacade.ListTagsForResource"
      ~service ~context ~input
      ~output_deserializer:Json_deserializers.list_tags_for_resource_result_of_yojson
      ~error_deserializer

  let request_with_metadata context (request : list_tags_for_resource_request) =
    let input = Json_serializers.list_tags_for_resource_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata
      ~shape_name:"AWSHawksNestServiceFacade.ListTagsForResource" ~service ~context ~input
      ~output_deserializer:Json_deserializers.list_tags_for_resource_result_of_yojson
      ~error_deserializer
end

module PutDetector = struct
  let error_to_string = function
    | `AccessDeniedException _ -> "com.amazonaws.frauddetector#AccessDeniedException"
    | `ConflictException _ -> "com.amazonaws.frauddetector#ConflictException"
    | `InternalServerException _ -> "com.amazonaws.frauddetector#InternalServerException"
    | `ThrottlingException _ -> "com.amazonaws.frauddetector#ThrottlingException"
    | `ValidationException _ -> "com.amazonaws.frauddetector#ValidationException"
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
      | _, "ThrottlingException" ->
          `ThrottlingException (Json_deserializers.throttling_exception_of_yojson tree path)
      | _, "ValidationException" ->
          `ValidationException (Json_deserializers.validation_exception_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : put_detector_request) =
    let input = Json_serializers.put_detector_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"AWSHawksNestServiceFacade.PutDetector" ~service
      ~context ~input ~output_deserializer:Json_deserializers.put_detector_result_of_yojson
      ~error_deserializer

  let request_with_metadata context (request : put_detector_request) =
    let input = Json_serializers.put_detector_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata
      ~shape_name:"AWSHawksNestServiceFacade.PutDetector" ~service ~context ~input
      ~output_deserializer:Json_deserializers.put_detector_result_of_yojson ~error_deserializer
end

module PutEntityType = struct
  let error_to_string = function
    | `AccessDeniedException _ -> "com.amazonaws.frauddetector#AccessDeniedException"
    | `ConflictException _ -> "com.amazonaws.frauddetector#ConflictException"
    | `InternalServerException _ -> "com.amazonaws.frauddetector#InternalServerException"
    | `ThrottlingException _ -> "com.amazonaws.frauddetector#ThrottlingException"
    | `ValidationException _ -> "com.amazonaws.frauddetector#ValidationException"
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
      | _, "ThrottlingException" ->
          `ThrottlingException (Json_deserializers.throttling_exception_of_yojson tree path)
      | _, "ValidationException" ->
          `ValidationException (Json_deserializers.validation_exception_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : put_entity_type_request) =
    let input = Json_serializers.put_entity_type_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"AWSHawksNestServiceFacade.PutEntityType"
      ~service ~context ~input
      ~output_deserializer:Json_deserializers.put_entity_type_result_of_yojson ~error_deserializer

  let request_with_metadata context (request : put_entity_type_request) =
    let input = Json_serializers.put_entity_type_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata
      ~shape_name:"AWSHawksNestServiceFacade.PutEntityType" ~service ~context ~input
      ~output_deserializer:Json_deserializers.put_entity_type_result_of_yojson ~error_deserializer
end

module PutEventType = struct
  let error_to_string = function
    | `AccessDeniedException _ -> "com.amazonaws.frauddetector#AccessDeniedException"
    | `ConflictException _ -> "com.amazonaws.frauddetector#ConflictException"
    | `InternalServerException _ -> "com.amazonaws.frauddetector#InternalServerException"
    | `ThrottlingException _ -> "com.amazonaws.frauddetector#ThrottlingException"
    | `ValidationException _ -> "com.amazonaws.frauddetector#ValidationException"
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
      | _, "ThrottlingException" ->
          `ThrottlingException (Json_deserializers.throttling_exception_of_yojson tree path)
      | _, "ValidationException" ->
          `ValidationException (Json_deserializers.validation_exception_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : put_event_type_request) =
    let input = Json_serializers.put_event_type_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"AWSHawksNestServiceFacade.PutEventType"
      ~service ~context ~input
      ~output_deserializer:Json_deserializers.put_event_type_result_of_yojson ~error_deserializer

  let request_with_metadata context (request : put_event_type_request) =
    let input = Json_serializers.put_event_type_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata
      ~shape_name:"AWSHawksNestServiceFacade.PutEventType" ~service ~context ~input
      ~output_deserializer:Json_deserializers.put_event_type_result_of_yojson ~error_deserializer
end

module PutExternalModel = struct
  let error_to_string = function
    | `AccessDeniedException _ -> "com.amazonaws.frauddetector#AccessDeniedException"
    | `ConflictException _ -> "com.amazonaws.frauddetector#ConflictException"
    | `InternalServerException _ -> "com.amazonaws.frauddetector#InternalServerException"
    | `ThrottlingException _ -> "com.amazonaws.frauddetector#ThrottlingException"
    | `ValidationException _ -> "com.amazonaws.frauddetector#ValidationException"
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
      | _, "ThrottlingException" ->
          `ThrottlingException (Json_deserializers.throttling_exception_of_yojson tree path)
      | _, "ValidationException" ->
          `ValidationException (Json_deserializers.validation_exception_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : put_external_model_request) =
    let input = Json_serializers.put_external_model_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"AWSHawksNestServiceFacade.PutExternalModel"
      ~service ~context ~input
      ~output_deserializer:Json_deserializers.put_external_model_result_of_yojson
      ~error_deserializer

  let request_with_metadata context (request : put_external_model_request) =
    let input = Json_serializers.put_external_model_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata
      ~shape_name:"AWSHawksNestServiceFacade.PutExternalModel" ~service ~context ~input
      ~output_deserializer:Json_deserializers.put_external_model_result_of_yojson
      ~error_deserializer
end

module PutKMSEncryptionKey = struct
  let error_to_string = function
    | `AccessDeniedException _ -> "com.amazonaws.frauddetector#AccessDeniedException"
    | `ConflictException _ -> "com.amazonaws.frauddetector#ConflictException"
    | `InternalServerException _ -> "com.amazonaws.frauddetector#InternalServerException"
    | `ResourceNotFoundException _ -> "com.amazonaws.frauddetector#ResourceNotFoundException"
    | `ThrottlingException _ -> "com.amazonaws.frauddetector#ThrottlingException"
    | `ValidationException _ -> "com.amazonaws.frauddetector#ValidationException"
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

  let request context (request : put_kms_encryption_key_request) =
    let input = Json_serializers.put_kms_encryption_key_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"AWSHawksNestServiceFacade.PutKMSEncryptionKey"
      ~service ~context ~input
      ~output_deserializer:Json_deserializers.put_kms_encryption_key_result_of_yojson
      ~error_deserializer

  let request_with_metadata context (request : put_kms_encryption_key_request) =
    let input = Json_serializers.put_kms_encryption_key_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata
      ~shape_name:"AWSHawksNestServiceFacade.PutKMSEncryptionKey" ~service ~context ~input
      ~output_deserializer:Json_deserializers.put_kms_encryption_key_result_of_yojson
      ~error_deserializer
end

module PutLabel = struct
  let error_to_string = function
    | `AccessDeniedException _ -> "com.amazonaws.frauddetector#AccessDeniedException"
    | `ConflictException _ -> "com.amazonaws.frauddetector#ConflictException"
    | `InternalServerException _ -> "com.amazonaws.frauddetector#InternalServerException"
    | `ThrottlingException _ -> "com.amazonaws.frauddetector#ThrottlingException"
    | `ValidationException _ -> "com.amazonaws.frauddetector#ValidationException"
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
      | _, "ThrottlingException" ->
          `ThrottlingException (Json_deserializers.throttling_exception_of_yojson tree path)
      | _, "ValidationException" ->
          `ValidationException (Json_deserializers.validation_exception_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : put_label_request) =
    let input = Json_serializers.put_label_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"AWSHawksNestServiceFacade.PutLabel" ~service
      ~context ~input ~output_deserializer:Json_deserializers.put_label_result_of_yojson
      ~error_deserializer

  let request_with_metadata context (request : put_label_request) =
    let input = Json_serializers.put_label_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata
      ~shape_name:"AWSHawksNestServiceFacade.PutLabel" ~service ~context ~input
      ~output_deserializer:Json_deserializers.put_label_result_of_yojson ~error_deserializer
end

module PutOutcome = struct
  let error_to_string = function
    | `AccessDeniedException _ -> "com.amazonaws.frauddetector#AccessDeniedException"
    | `ConflictException _ -> "com.amazonaws.frauddetector#ConflictException"
    | `InternalServerException _ -> "com.amazonaws.frauddetector#InternalServerException"
    | `ThrottlingException _ -> "com.amazonaws.frauddetector#ThrottlingException"
    | `ValidationException _ -> "com.amazonaws.frauddetector#ValidationException"
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
      | _, "ThrottlingException" ->
          `ThrottlingException (Json_deserializers.throttling_exception_of_yojson tree path)
      | _, "ValidationException" ->
          `ValidationException (Json_deserializers.validation_exception_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : put_outcome_request) =
    let input = Json_serializers.put_outcome_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"AWSHawksNestServiceFacade.PutOutcome" ~service
      ~context ~input ~output_deserializer:Json_deserializers.put_outcome_result_of_yojson
      ~error_deserializer

  let request_with_metadata context (request : put_outcome_request) =
    let input = Json_serializers.put_outcome_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata
      ~shape_name:"AWSHawksNestServiceFacade.PutOutcome" ~service ~context ~input
      ~output_deserializer:Json_deserializers.put_outcome_result_of_yojson ~error_deserializer
end

module SendEvent = struct
  let error_to_string = function
    | `AccessDeniedException _ -> "com.amazonaws.frauddetector#AccessDeniedException"
    | `ConflictException _ -> "com.amazonaws.frauddetector#ConflictException"
    | `InternalServerException _ -> "com.amazonaws.frauddetector#InternalServerException"
    | `ResourceNotFoundException _ -> "com.amazonaws.frauddetector#ResourceNotFoundException"
    | `ThrottlingException _ -> "com.amazonaws.frauddetector#ThrottlingException"
    | `ValidationException _ -> "com.amazonaws.frauddetector#ValidationException"
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

  let request context (request : send_event_request) =
    let input = Json_serializers.send_event_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"AWSHawksNestServiceFacade.SendEvent" ~service
      ~context ~input ~output_deserializer:Json_deserializers.send_event_result_of_yojson
      ~error_deserializer

  let request_with_metadata context (request : send_event_request) =
    let input = Json_serializers.send_event_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata
      ~shape_name:"AWSHawksNestServiceFacade.SendEvent" ~service ~context ~input
      ~output_deserializer:Json_deserializers.send_event_result_of_yojson ~error_deserializer
end

module TagResource = struct
  let error_to_string = function
    | `AccessDeniedException _ -> "com.amazonaws.frauddetector#AccessDeniedException"
    | `ResourceNotFoundException _ -> "com.amazonaws.frauddetector#ResourceNotFoundException"
    | `ThrottlingException _ -> "com.amazonaws.frauddetector#ThrottlingException"
    | `ValidationException _ -> "com.amazonaws.frauddetector#ValidationException"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "AccessDeniedException" ->
          `AccessDeniedException (Json_deserializers.access_denied_exception_of_yojson tree path)
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

  let request context (request : tag_resource_request) =
    let input = Json_serializers.tag_resource_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"AWSHawksNestServiceFacade.TagResource" ~service
      ~context ~input ~output_deserializer:Json_deserializers.tag_resource_result_of_yojson
      ~error_deserializer

  let request_with_metadata context (request : tag_resource_request) =
    let input = Json_serializers.tag_resource_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata
      ~shape_name:"AWSHawksNestServiceFacade.TagResource" ~service ~context ~input
      ~output_deserializer:Json_deserializers.tag_resource_result_of_yojson ~error_deserializer
end

module UntagResource = struct
  let error_to_string = function
    | `AccessDeniedException _ -> "com.amazonaws.frauddetector#AccessDeniedException"
    | `ResourceNotFoundException _ -> "com.amazonaws.frauddetector#ResourceNotFoundException"
    | `ThrottlingException _ -> "com.amazonaws.frauddetector#ThrottlingException"
    | `ValidationException _ -> "com.amazonaws.frauddetector#ValidationException"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "AccessDeniedException" ->
          `AccessDeniedException (Json_deserializers.access_denied_exception_of_yojson tree path)
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

  let request context (request : untag_resource_request) =
    let input = Json_serializers.untag_resource_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"AWSHawksNestServiceFacade.UntagResource"
      ~service ~context ~input
      ~output_deserializer:Json_deserializers.untag_resource_result_of_yojson ~error_deserializer

  let request_with_metadata context (request : untag_resource_request) =
    let input = Json_serializers.untag_resource_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata
      ~shape_name:"AWSHawksNestServiceFacade.UntagResource" ~service ~context ~input
      ~output_deserializer:Json_deserializers.untag_resource_result_of_yojson ~error_deserializer
end

module UpdateDetectorVersion = struct
  let error_to_string = function
    | `AccessDeniedException _ -> "com.amazonaws.frauddetector#AccessDeniedException"
    | `ConflictException _ -> "com.amazonaws.frauddetector#ConflictException"
    | `InternalServerException _ -> "com.amazonaws.frauddetector#InternalServerException"
    | `ResourceNotFoundException _ -> "com.amazonaws.frauddetector#ResourceNotFoundException"
    | `ThrottlingException _ -> "com.amazonaws.frauddetector#ThrottlingException"
    | `ValidationException _ -> "com.amazonaws.frauddetector#ValidationException"
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

  let request context (request : update_detector_version_request) =
    let input = Json_serializers.update_detector_version_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request
      ~shape_name:"AWSHawksNestServiceFacade.UpdateDetectorVersion" ~service ~context ~input
      ~output_deserializer:Json_deserializers.update_detector_version_result_of_yojson
      ~error_deserializer

  let request_with_metadata context (request : update_detector_version_request) =
    let input = Json_serializers.update_detector_version_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata
      ~shape_name:"AWSHawksNestServiceFacade.UpdateDetectorVersion" ~service ~context ~input
      ~output_deserializer:Json_deserializers.update_detector_version_result_of_yojson
      ~error_deserializer
end

module UpdateDetectorVersionMetadata = struct
  let error_to_string = function
    | `AccessDeniedException _ -> "com.amazonaws.frauddetector#AccessDeniedException"
    | `ConflictException _ -> "com.amazonaws.frauddetector#ConflictException"
    | `InternalServerException _ -> "com.amazonaws.frauddetector#InternalServerException"
    | `ThrottlingException _ -> "com.amazonaws.frauddetector#ThrottlingException"
    | `ValidationException _ -> "com.amazonaws.frauddetector#ValidationException"
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
      | _, "ThrottlingException" ->
          `ThrottlingException (Json_deserializers.throttling_exception_of_yojson tree path)
      | _, "ValidationException" ->
          `ValidationException (Json_deserializers.validation_exception_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : update_detector_version_metadata_request) =
    let input = Json_serializers.update_detector_version_metadata_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request
      ~shape_name:"AWSHawksNestServiceFacade.UpdateDetectorVersionMetadata" ~service ~context ~input
      ~output_deserializer:Json_deserializers.update_detector_version_metadata_result_of_yojson
      ~error_deserializer

  let request_with_metadata context (request : update_detector_version_metadata_request) =
    let input = Json_serializers.update_detector_version_metadata_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata
      ~shape_name:"AWSHawksNestServiceFacade.UpdateDetectorVersionMetadata" ~service ~context ~input
      ~output_deserializer:Json_deserializers.update_detector_version_metadata_result_of_yojson
      ~error_deserializer
end

module UpdateDetectorVersionStatus = struct
  let error_to_string = function
    | `AccessDeniedException _ -> "com.amazonaws.frauddetector#AccessDeniedException"
    | `ConflictException _ -> "com.amazonaws.frauddetector#ConflictException"
    | `InternalServerException _ -> "com.amazonaws.frauddetector#InternalServerException"
    | `ResourceNotFoundException _ -> "com.amazonaws.frauddetector#ResourceNotFoundException"
    | `ThrottlingException _ -> "com.amazonaws.frauddetector#ThrottlingException"
    | `ValidationException _ -> "com.amazonaws.frauddetector#ValidationException"
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

  let request context (request : update_detector_version_status_request) =
    let input = Json_serializers.update_detector_version_status_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request
      ~shape_name:"AWSHawksNestServiceFacade.UpdateDetectorVersionStatus" ~service ~context ~input
      ~output_deserializer:Json_deserializers.update_detector_version_status_result_of_yojson
      ~error_deserializer

  let request_with_metadata context (request : update_detector_version_status_request) =
    let input = Json_serializers.update_detector_version_status_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata
      ~shape_name:"AWSHawksNestServiceFacade.UpdateDetectorVersionStatus" ~service ~context ~input
      ~output_deserializer:Json_deserializers.update_detector_version_status_result_of_yojson
      ~error_deserializer
end

module UpdateEventLabel = struct
  let error_to_string = function
    | `AccessDeniedException _ -> "com.amazonaws.frauddetector#AccessDeniedException"
    | `ConflictException _ -> "com.amazonaws.frauddetector#ConflictException"
    | `InternalServerException _ -> "com.amazonaws.frauddetector#InternalServerException"
    | `ResourceNotFoundException _ -> "com.amazonaws.frauddetector#ResourceNotFoundException"
    | `ThrottlingException _ -> "com.amazonaws.frauddetector#ThrottlingException"
    | `ValidationException _ -> "com.amazonaws.frauddetector#ValidationException"
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

  let request context (request : update_event_label_request) =
    let input = Json_serializers.update_event_label_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"AWSHawksNestServiceFacade.UpdateEventLabel"
      ~service ~context ~input
      ~output_deserializer:Json_deserializers.update_event_label_result_of_yojson
      ~error_deserializer

  let request_with_metadata context (request : update_event_label_request) =
    let input = Json_serializers.update_event_label_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata
      ~shape_name:"AWSHawksNestServiceFacade.UpdateEventLabel" ~service ~context ~input
      ~output_deserializer:Json_deserializers.update_event_label_result_of_yojson
      ~error_deserializer
end

module UpdateList = struct
  let error_to_string = function
    | `AccessDeniedException _ -> "com.amazonaws.frauddetector#AccessDeniedException"
    | `ConflictException _ -> "com.amazonaws.frauddetector#ConflictException"
    | `InternalServerException _ -> "com.amazonaws.frauddetector#InternalServerException"
    | `ResourceNotFoundException _ -> "com.amazonaws.frauddetector#ResourceNotFoundException"
    | `ThrottlingException _ -> "com.amazonaws.frauddetector#ThrottlingException"
    | `ValidationException _ -> "com.amazonaws.frauddetector#ValidationException"
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

  let request context (request : update_list_request) =
    let input = Json_serializers.update_list_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"AWSHawksNestServiceFacade.UpdateList" ~service
      ~context ~input ~output_deserializer:Json_deserializers.update_list_result_of_yojson
      ~error_deserializer

  let request_with_metadata context (request : update_list_request) =
    let input = Json_serializers.update_list_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata
      ~shape_name:"AWSHawksNestServiceFacade.UpdateList" ~service ~context ~input
      ~output_deserializer:Json_deserializers.update_list_result_of_yojson ~error_deserializer
end

module UpdateModel = struct
  let error_to_string = function
    | `AccessDeniedException _ -> "com.amazonaws.frauddetector#AccessDeniedException"
    | `ConflictException _ -> "com.amazonaws.frauddetector#ConflictException"
    | `InternalServerException _ -> "com.amazonaws.frauddetector#InternalServerException"
    | `ResourceNotFoundException _ -> "com.amazonaws.frauddetector#ResourceNotFoundException"
    | `ThrottlingException _ -> "com.amazonaws.frauddetector#ThrottlingException"
    | `ValidationException _ -> "com.amazonaws.frauddetector#ValidationException"
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

  let request context (request : update_model_request) =
    let input = Json_serializers.update_model_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"AWSHawksNestServiceFacade.UpdateModel" ~service
      ~context ~input ~output_deserializer:Json_deserializers.update_model_result_of_yojson
      ~error_deserializer

  let request_with_metadata context (request : update_model_request) =
    let input = Json_serializers.update_model_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata
      ~shape_name:"AWSHawksNestServiceFacade.UpdateModel" ~service ~context ~input
      ~output_deserializer:Json_deserializers.update_model_result_of_yojson ~error_deserializer
end

module UpdateModelVersion = struct
  let error_to_string = function
    | `AccessDeniedException _ -> "com.amazonaws.frauddetector#AccessDeniedException"
    | `ConflictException _ -> "com.amazonaws.frauddetector#ConflictException"
    | `InternalServerException _ -> "com.amazonaws.frauddetector#InternalServerException"
    | `ResourceNotFoundException _ -> "com.amazonaws.frauddetector#ResourceNotFoundException"
    | `ThrottlingException _ -> "com.amazonaws.frauddetector#ThrottlingException"
    | `ValidationException _ -> "com.amazonaws.frauddetector#ValidationException"
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

  let request context (request : update_model_version_request) =
    let input = Json_serializers.update_model_version_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"AWSHawksNestServiceFacade.UpdateModelVersion"
      ~service ~context ~input
      ~output_deserializer:Json_deserializers.update_model_version_result_of_yojson
      ~error_deserializer

  let request_with_metadata context (request : update_model_version_request) =
    let input = Json_serializers.update_model_version_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata
      ~shape_name:"AWSHawksNestServiceFacade.UpdateModelVersion" ~service ~context ~input
      ~output_deserializer:Json_deserializers.update_model_version_result_of_yojson
      ~error_deserializer
end

module UpdateModelVersionStatus = struct
  let error_to_string = function
    | `AccessDeniedException _ -> "com.amazonaws.frauddetector#AccessDeniedException"
    | `ConflictException _ -> "com.amazonaws.frauddetector#ConflictException"
    | `InternalServerException _ -> "com.amazonaws.frauddetector#InternalServerException"
    | `ResourceNotFoundException _ -> "com.amazonaws.frauddetector#ResourceNotFoundException"
    | `ThrottlingException _ -> "com.amazonaws.frauddetector#ThrottlingException"
    | `ValidationException _ -> "com.amazonaws.frauddetector#ValidationException"
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

  let request context (request : update_model_version_status_request) =
    let input = Json_serializers.update_model_version_status_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request
      ~shape_name:"AWSHawksNestServiceFacade.UpdateModelVersionStatus" ~service ~context ~input
      ~output_deserializer:Json_deserializers.update_model_version_status_result_of_yojson
      ~error_deserializer

  let request_with_metadata context (request : update_model_version_status_request) =
    let input = Json_serializers.update_model_version_status_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata
      ~shape_name:"AWSHawksNestServiceFacade.UpdateModelVersionStatus" ~service ~context ~input
      ~output_deserializer:Json_deserializers.update_model_version_status_result_of_yojson
      ~error_deserializer
end

module UpdateRuleMetadata = struct
  let error_to_string = function
    | `AccessDeniedException _ -> "com.amazonaws.frauddetector#AccessDeniedException"
    | `ConflictException _ -> "com.amazonaws.frauddetector#ConflictException"
    | `InternalServerException _ -> "com.amazonaws.frauddetector#InternalServerException"
    | `ResourceNotFoundException _ -> "com.amazonaws.frauddetector#ResourceNotFoundException"
    | `ThrottlingException _ -> "com.amazonaws.frauddetector#ThrottlingException"
    | `ValidationException _ -> "com.amazonaws.frauddetector#ValidationException"
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

  let request context (request : update_rule_metadata_request) =
    let input = Json_serializers.update_rule_metadata_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"AWSHawksNestServiceFacade.UpdateRuleMetadata"
      ~service ~context ~input
      ~output_deserializer:Json_deserializers.update_rule_metadata_result_of_yojson
      ~error_deserializer

  let request_with_metadata context (request : update_rule_metadata_request) =
    let input = Json_serializers.update_rule_metadata_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata
      ~shape_name:"AWSHawksNestServiceFacade.UpdateRuleMetadata" ~service ~context ~input
      ~output_deserializer:Json_deserializers.update_rule_metadata_result_of_yojson
      ~error_deserializer
end

module UpdateRuleVersion = struct
  let error_to_string = function
    | `AccessDeniedException _ -> "com.amazonaws.frauddetector#AccessDeniedException"
    | `ConflictException _ -> "com.amazonaws.frauddetector#ConflictException"
    | `InternalServerException _ -> "com.amazonaws.frauddetector#InternalServerException"
    | `ResourceNotFoundException _ -> "com.amazonaws.frauddetector#ResourceNotFoundException"
    | `ThrottlingException _ -> "com.amazonaws.frauddetector#ThrottlingException"
    | `ValidationException _ -> "com.amazonaws.frauddetector#ValidationException"
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

  let request context (request : update_rule_version_request) =
    let input = Json_serializers.update_rule_version_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"AWSHawksNestServiceFacade.UpdateRuleVersion"
      ~service ~context ~input
      ~output_deserializer:Json_deserializers.update_rule_version_result_of_yojson
      ~error_deserializer

  let request_with_metadata context (request : update_rule_version_request) =
    let input = Json_serializers.update_rule_version_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata
      ~shape_name:"AWSHawksNestServiceFacade.UpdateRuleVersion" ~service ~context ~input
      ~output_deserializer:Json_deserializers.update_rule_version_result_of_yojson
      ~error_deserializer
end

module UpdateVariable = struct
  let error_to_string = function
    | `AccessDeniedException _ -> "com.amazonaws.frauddetector#AccessDeniedException"
    | `ConflictException _ -> "com.amazonaws.frauddetector#ConflictException"
    | `InternalServerException _ -> "com.amazonaws.frauddetector#InternalServerException"
    | `ResourceNotFoundException _ -> "com.amazonaws.frauddetector#ResourceNotFoundException"
    | `ThrottlingException _ -> "com.amazonaws.frauddetector#ThrottlingException"
    | `ValidationException _ -> "com.amazonaws.frauddetector#ValidationException"
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

  let request context (request : update_variable_request) =
    let input = Json_serializers.update_variable_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"AWSHawksNestServiceFacade.UpdateVariable"
      ~service ~context ~input
      ~output_deserializer:Json_deserializers.update_variable_result_of_yojson ~error_deserializer

  let request_with_metadata context (request : update_variable_request) =
    let input = Json_serializers.update_variable_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata
      ~shape_name:"AWSHawksNestServiceFacade.UpdateVariable" ~service ~context ~input
      ~output_deserializer:Json_deserializers.update_variable_result_of_yojson ~error_deserializer
end
