open Types
open Service_metadata

module CreateDataset = struct
  let error_to_string = function
    | `AccessDeniedException _ -> "com.amazonaws.lookoutequipment#AccessDeniedException"
    | `ConflictException _ -> "com.amazonaws.lookoutequipment#ConflictException"
    | `InternalServerException _ -> "com.amazonaws.lookoutequipment#InternalServerException"
    | `ServiceQuotaExceededException _ ->
        "com.amazonaws.lookoutequipment#ServiceQuotaExceededException"
    | `ThrottlingException _ -> "com.amazonaws.lookoutequipment#ThrottlingException"
    | `ValidationException _ -> "com.amazonaws.lookoutequipment#ValidationException"
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

  let request context (request : create_dataset_request) =
    let input = Json_serializers.create_dataset_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request
      ~shape_name:"AWSLookoutEquipmentFrontendService.CreateDataset" ~service ~context ~input
      ~output_deserializer:Json_deserializers.create_dataset_response_of_yojson ~error_deserializer

  let request_with_metadata context (request : create_dataset_request) =
    let input = Json_serializers.create_dataset_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata
      ~shape_name:"AWSLookoutEquipmentFrontendService.CreateDataset" ~service ~context ~input
      ~output_deserializer:Json_deserializers.create_dataset_response_of_yojson ~error_deserializer
end

module CreateInferenceScheduler = struct
  let error_to_string = function
    | `AccessDeniedException _ -> "com.amazonaws.lookoutequipment#AccessDeniedException"
    | `ConflictException _ -> "com.amazonaws.lookoutequipment#ConflictException"
    | `InternalServerException _ -> "com.amazonaws.lookoutequipment#InternalServerException"
    | `ResourceNotFoundException _ -> "com.amazonaws.lookoutequipment#ResourceNotFoundException"
    | `ServiceQuotaExceededException _ ->
        "com.amazonaws.lookoutequipment#ServiceQuotaExceededException"
    | `ThrottlingException _ -> "com.amazonaws.lookoutequipment#ThrottlingException"
    | `ValidationException _ -> "com.amazonaws.lookoutequipment#ValidationException"
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

  let request context (request : create_inference_scheduler_request) =
    let input = Json_serializers.create_inference_scheduler_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request
      ~shape_name:"AWSLookoutEquipmentFrontendService.CreateInferenceScheduler" ~service ~context
      ~input ~output_deserializer:Json_deserializers.create_inference_scheduler_response_of_yojson
      ~error_deserializer

  let request_with_metadata context (request : create_inference_scheduler_request) =
    let input = Json_serializers.create_inference_scheduler_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata
      ~shape_name:"AWSLookoutEquipmentFrontendService.CreateInferenceScheduler" ~service ~context
      ~input ~output_deserializer:Json_deserializers.create_inference_scheduler_response_of_yojson
      ~error_deserializer
end

module CreateLabel = struct
  let error_to_string = function
    | `AccessDeniedException _ -> "com.amazonaws.lookoutequipment#AccessDeniedException"
    | `ConflictException _ -> "com.amazonaws.lookoutequipment#ConflictException"
    | `InternalServerException _ -> "com.amazonaws.lookoutequipment#InternalServerException"
    | `ResourceNotFoundException _ -> "com.amazonaws.lookoutequipment#ResourceNotFoundException"
    | `ServiceQuotaExceededException _ ->
        "com.amazonaws.lookoutequipment#ServiceQuotaExceededException"
    | `ThrottlingException _ -> "com.amazonaws.lookoutequipment#ThrottlingException"
    | `ValidationException _ -> "com.amazonaws.lookoutequipment#ValidationException"
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

  let request context (request : create_label_request) =
    let input = Json_serializers.create_label_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"AWSLookoutEquipmentFrontendService.CreateLabel"
      ~service ~context ~input
      ~output_deserializer:Json_deserializers.create_label_response_of_yojson ~error_deserializer

  let request_with_metadata context (request : create_label_request) =
    let input = Json_serializers.create_label_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata
      ~shape_name:"AWSLookoutEquipmentFrontendService.CreateLabel" ~service ~context ~input
      ~output_deserializer:Json_deserializers.create_label_response_of_yojson ~error_deserializer
end

module CreateLabelGroup = struct
  let error_to_string = function
    | `AccessDeniedException _ -> "com.amazonaws.lookoutequipment#AccessDeniedException"
    | `ConflictException _ -> "com.amazonaws.lookoutequipment#ConflictException"
    | `InternalServerException _ -> "com.amazonaws.lookoutequipment#InternalServerException"
    | `ServiceQuotaExceededException _ ->
        "com.amazonaws.lookoutequipment#ServiceQuotaExceededException"
    | `ThrottlingException _ -> "com.amazonaws.lookoutequipment#ThrottlingException"
    | `ValidationException _ -> "com.amazonaws.lookoutequipment#ValidationException"
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

  let request context (request : create_label_group_request) =
    let input = Json_serializers.create_label_group_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request
      ~shape_name:"AWSLookoutEquipmentFrontendService.CreateLabelGroup" ~service ~context ~input
      ~output_deserializer:Json_deserializers.create_label_group_response_of_yojson
      ~error_deserializer

  let request_with_metadata context (request : create_label_group_request) =
    let input = Json_serializers.create_label_group_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata
      ~shape_name:"AWSLookoutEquipmentFrontendService.CreateLabelGroup" ~service ~context ~input
      ~output_deserializer:Json_deserializers.create_label_group_response_of_yojson
      ~error_deserializer
end

module CreateModel = struct
  let error_to_string = function
    | `AccessDeniedException _ -> "com.amazonaws.lookoutequipment#AccessDeniedException"
    | `ConflictException _ -> "com.amazonaws.lookoutequipment#ConflictException"
    | `InternalServerException _ -> "com.amazonaws.lookoutequipment#InternalServerException"
    | `ResourceNotFoundException _ -> "com.amazonaws.lookoutequipment#ResourceNotFoundException"
    | `ServiceQuotaExceededException _ ->
        "com.amazonaws.lookoutequipment#ServiceQuotaExceededException"
    | `ThrottlingException _ -> "com.amazonaws.lookoutequipment#ThrottlingException"
    | `ValidationException _ -> "com.amazonaws.lookoutequipment#ValidationException"
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

  let request context (request : create_model_request) =
    let input = Json_serializers.create_model_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"AWSLookoutEquipmentFrontendService.CreateModel"
      ~service ~context ~input
      ~output_deserializer:Json_deserializers.create_model_response_of_yojson ~error_deserializer

  let request_with_metadata context (request : create_model_request) =
    let input = Json_serializers.create_model_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata
      ~shape_name:"AWSLookoutEquipmentFrontendService.CreateModel" ~service ~context ~input
      ~output_deserializer:Json_deserializers.create_model_response_of_yojson ~error_deserializer
end

module CreateRetrainingScheduler = struct
  let error_to_string = function
    | `AccessDeniedException _ -> "com.amazonaws.lookoutequipment#AccessDeniedException"
    | `ConflictException _ -> "com.amazonaws.lookoutequipment#ConflictException"
    | `InternalServerException _ -> "com.amazonaws.lookoutequipment#InternalServerException"
    | `ResourceNotFoundException _ -> "com.amazonaws.lookoutequipment#ResourceNotFoundException"
    | `ThrottlingException _ -> "com.amazonaws.lookoutequipment#ThrottlingException"
    | `ValidationException _ -> "com.amazonaws.lookoutequipment#ValidationException"
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

  let request context (request : create_retraining_scheduler_request) =
    let input = Json_serializers.create_retraining_scheduler_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request
      ~shape_name:"AWSLookoutEquipmentFrontendService.CreateRetrainingScheduler" ~service ~context
      ~input ~output_deserializer:Json_deserializers.create_retraining_scheduler_response_of_yojson
      ~error_deserializer

  let request_with_metadata context (request : create_retraining_scheduler_request) =
    let input = Json_serializers.create_retraining_scheduler_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata
      ~shape_name:"AWSLookoutEquipmentFrontendService.CreateRetrainingScheduler" ~service ~context
      ~input ~output_deserializer:Json_deserializers.create_retraining_scheduler_response_of_yojson
      ~error_deserializer
end

module DeleteDataset = struct
  let error_to_string = function
    | `AccessDeniedException _ -> "com.amazonaws.lookoutequipment#AccessDeniedException"
    | `ConflictException _ -> "com.amazonaws.lookoutequipment#ConflictException"
    | `InternalServerException _ -> "com.amazonaws.lookoutequipment#InternalServerException"
    | `ResourceNotFoundException _ -> "com.amazonaws.lookoutequipment#ResourceNotFoundException"
    | `ThrottlingException _ -> "com.amazonaws.lookoutequipment#ThrottlingException"
    | `ValidationException _ -> "com.amazonaws.lookoutequipment#ValidationException"
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

  let request context (request : delete_dataset_request) =
    let input = Json_serializers.delete_dataset_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request
      ~shape_name:"AWSLookoutEquipmentFrontendService.DeleteDataset" ~service ~context ~input
      ~output_deserializer:Smaws_Lib.Smithy_api.Json_deserializers.unit__of_yojson
      ~error_deserializer

  let request_with_metadata context (request : delete_dataset_request) =
    let input = Json_serializers.delete_dataset_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata
      ~shape_name:"AWSLookoutEquipmentFrontendService.DeleteDataset" ~service ~context ~input
      ~output_deserializer:Smaws_Lib.Smithy_api.Json_deserializers.unit__of_yojson
      ~error_deserializer
end

module DeleteInferenceScheduler = struct
  let error_to_string = function
    | `AccessDeniedException _ -> "com.amazonaws.lookoutequipment#AccessDeniedException"
    | `ConflictException _ -> "com.amazonaws.lookoutequipment#ConflictException"
    | `InternalServerException _ -> "com.amazonaws.lookoutequipment#InternalServerException"
    | `ResourceNotFoundException _ -> "com.amazonaws.lookoutequipment#ResourceNotFoundException"
    | `ThrottlingException _ -> "com.amazonaws.lookoutequipment#ThrottlingException"
    | `ValidationException _ -> "com.amazonaws.lookoutequipment#ValidationException"
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

  let request context (request : delete_inference_scheduler_request) =
    let input = Json_serializers.delete_inference_scheduler_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request
      ~shape_name:"AWSLookoutEquipmentFrontendService.DeleteInferenceScheduler" ~service ~context
      ~input ~output_deserializer:Smaws_Lib.Smithy_api.Json_deserializers.unit__of_yojson
      ~error_deserializer

  let request_with_metadata context (request : delete_inference_scheduler_request) =
    let input = Json_serializers.delete_inference_scheduler_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata
      ~shape_name:"AWSLookoutEquipmentFrontendService.DeleteInferenceScheduler" ~service ~context
      ~input ~output_deserializer:Smaws_Lib.Smithy_api.Json_deserializers.unit__of_yojson
      ~error_deserializer
end

module DeleteLabel = struct
  let error_to_string = function
    | `AccessDeniedException _ -> "com.amazonaws.lookoutequipment#AccessDeniedException"
    | `ConflictException _ -> "com.amazonaws.lookoutequipment#ConflictException"
    | `InternalServerException _ -> "com.amazonaws.lookoutequipment#InternalServerException"
    | `ResourceNotFoundException _ -> "com.amazonaws.lookoutequipment#ResourceNotFoundException"
    | `ThrottlingException _ -> "com.amazonaws.lookoutequipment#ThrottlingException"
    | `ValidationException _ -> "com.amazonaws.lookoutequipment#ValidationException"
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

  let request context (request : delete_label_request) =
    let input = Json_serializers.delete_label_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"AWSLookoutEquipmentFrontendService.DeleteLabel"
      ~service ~context ~input
      ~output_deserializer:Smaws_Lib.Smithy_api.Json_deserializers.unit__of_yojson
      ~error_deserializer

  let request_with_metadata context (request : delete_label_request) =
    let input = Json_serializers.delete_label_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata
      ~shape_name:"AWSLookoutEquipmentFrontendService.DeleteLabel" ~service ~context ~input
      ~output_deserializer:Smaws_Lib.Smithy_api.Json_deserializers.unit__of_yojson
      ~error_deserializer
end

module DeleteLabelGroup = struct
  let error_to_string = function
    | `AccessDeniedException _ -> "com.amazonaws.lookoutequipment#AccessDeniedException"
    | `ConflictException _ -> "com.amazonaws.lookoutequipment#ConflictException"
    | `InternalServerException _ -> "com.amazonaws.lookoutequipment#InternalServerException"
    | `ResourceNotFoundException _ -> "com.amazonaws.lookoutequipment#ResourceNotFoundException"
    | `ThrottlingException _ -> "com.amazonaws.lookoutequipment#ThrottlingException"
    | `ValidationException _ -> "com.amazonaws.lookoutequipment#ValidationException"
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

  let request context (request : delete_label_group_request) =
    let input = Json_serializers.delete_label_group_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request
      ~shape_name:"AWSLookoutEquipmentFrontendService.DeleteLabelGroup" ~service ~context ~input
      ~output_deserializer:Smaws_Lib.Smithy_api.Json_deserializers.unit__of_yojson
      ~error_deserializer

  let request_with_metadata context (request : delete_label_group_request) =
    let input = Json_serializers.delete_label_group_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata
      ~shape_name:"AWSLookoutEquipmentFrontendService.DeleteLabelGroup" ~service ~context ~input
      ~output_deserializer:Smaws_Lib.Smithy_api.Json_deserializers.unit__of_yojson
      ~error_deserializer
end

module DeleteModel = struct
  let error_to_string = function
    | `AccessDeniedException _ -> "com.amazonaws.lookoutequipment#AccessDeniedException"
    | `ConflictException _ -> "com.amazonaws.lookoutequipment#ConflictException"
    | `InternalServerException _ -> "com.amazonaws.lookoutequipment#InternalServerException"
    | `ResourceNotFoundException _ -> "com.amazonaws.lookoutequipment#ResourceNotFoundException"
    | `ThrottlingException _ -> "com.amazonaws.lookoutequipment#ThrottlingException"
    | `ValidationException _ -> "com.amazonaws.lookoutequipment#ValidationException"
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

  let request context (request : delete_model_request) =
    let input = Json_serializers.delete_model_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"AWSLookoutEquipmentFrontendService.DeleteModel"
      ~service ~context ~input
      ~output_deserializer:Smaws_Lib.Smithy_api.Json_deserializers.unit__of_yojson
      ~error_deserializer

  let request_with_metadata context (request : delete_model_request) =
    let input = Json_serializers.delete_model_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata
      ~shape_name:"AWSLookoutEquipmentFrontendService.DeleteModel" ~service ~context ~input
      ~output_deserializer:Smaws_Lib.Smithy_api.Json_deserializers.unit__of_yojson
      ~error_deserializer
end

module DeleteResourcePolicy = struct
  let error_to_string = function
    | `AccessDeniedException _ -> "com.amazonaws.lookoutequipment#AccessDeniedException"
    | `ConflictException _ -> "com.amazonaws.lookoutequipment#ConflictException"
    | `InternalServerException _ -> "com.amazonaws.lookoutequipment#InternalServerException"
    | `ResourceNotFoundException _ -> "com.amazonaws.lookoutequipment#ResourceNotFoundException"
    | `ThrottlingException _ -> "com.amazonaws.lookoutequipment#ThrottlingException"
    | `ValidationException _ -> "com.amazonaws.lookoutequipment#ValidationException"
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

  let request context (request : delete_resource_policy_request) =
    let input = Json_serializers.delete_resource_policy_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request
      ~shape_name:"AWSLookoutEquipmentFrontendService.DeleteResourcePolicy" ~service ~context ~input
      ~output_deserializer:Smaws_Lib.Smithy_api.Json_deserializers.unit__of_yojson
      ~error_deserializer

  let request_with_metadata context (request : delete_resource_policy_request) =
    let input = Json_serializers.delete_resource_policy_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata
      ~shape_name:"AWSLookoutEquipmentFrontendService.DeleteResourcePolicy" ~service ~context ~input
      ~output_deserializer:Smaws_Lib.Smithy_api.Json_deserializers.unit__of_yojson
      ~error_deserializer
end

module DeleteRetrainingScheduler = struct
  let error_to_string = function
    | `AccessDeniedException _ -> "com.amazonaws.lookoutequipment#AccessDeniedException"
    | `ConflictException _ -> "com.amazonaws.lookoutequipment#ConflictException"
    | `InternalServerException _ -> "com.amazonaws.lookoutequipment#InternalServerException"
    | `ResourceNotFoundException _ -> "com.amazonaws.lookoutequipment#ResourceNotFoundException"
    | `ThrottlingException _ -> "com.amazonaws.lookoutequipment#ThrottlingException"
    | `ValidationException _ -> "com.amazonaws.lookoutequipment#ValidationException"
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

  let request context (request : delete_retraining_scheduler_request) =
    let input = Json_serializers.delete_retraining_scheduler_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request
      ~shape_name:"AWSLookoutEquipmentFrontendService.DeleteRetrainingScheduler" ~service ~context
      ~input ~output_deserializer:Smaws_Lib.Smithy_api.Json_deserializers.unit__of_yojson
      ~error_deserializer

  let request_with_metadata context (request : delete_retraining_scheduler_request) =
    let input = Json_serializers.delete_retraining_scheduler_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata
      ~shape_name:"AWSLookoutEquipmentFrontendService.DeleteRetrainingScheduler" ~service ~context
      ~input ~output_deserializer:Smaws_Lib.Smithy_api.Json_deserializers.unit__of_yojson
      ~error_deserializer
end

module DescribeDataIngestionJob = struct
  let error_to_string = function
    | `AccessDeniedException _ -> "com.amazonaws.lookoutequipment#AccessDeniedException"
    | `InternalServerException _ -> "com.amazonaws.lookoutequipment#InternalServerException"
    | `ResourceNotFoundException _ -> "com.amazonaws.lookoutequipment#ResourceNotFoundException"
    | `ThrottlingException _ -> "com.amazonaws.lookoutequipment#ThrottlingException"
    | `ValidationException _ -> "com.amazonaws.lookoutequipment#ValidationException"
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

  let request context (request : describe_data_ingestion_job_request) =
    let input = Json_serializers.describe_data_ingestion_job_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request
      ~shape_name:"AWSLookoutEquipmentFrontendService.DescribeDataIngestionJob" ~service ~context
      ~input ~output_deserializer:Json_deserializers.describe_data_ingestion_job_response_of_yojson
      ~error_deserializer

  let request_with_metadata context (request : describe_data_ingestion_job_request) =
    let input = Json_serializers.describe_data_ingestion_job_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata
      ~shape_name:"AWSLookoutEquipmentFrontendService.DescribeDataIngestionJob" ~service ~context
      ~input ~output_deserializer:Json_deserializers.describe_data_ingestion_job_response_of_yojson
      ~error_deserializer
end

module DescribeDataset = struct
  let error_to_string = function
    | `AccessDeniedException _ -> "com.amazonaws.lookoutequipment#AccessDeniedException"
    | `InternalServerException _ -> "com.amazonaws.lookoutequipment#InternalServerException"
    | `ResourceNotFoundException _ -> "com.amazonaws.lookoutequipment#ResourceNotFoundException"
    | `ThrottlingException _ -> "com.amazonaws.lookoutequipment#ThrottlingException"
    | `ValidationException _ -> "com.amazonaws.lookoutequipment#ValidationException"
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

  let request context (request : describe_dataset_request) =
    let input = Json_serializers.describe_dataset_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request
      ~shape_name:"AWSLookoutEquipmentFrontendService.DescribeDataset" ~service ~context ~input
      ~output_deserializer:Json_deserializers.describe_dataset_response_of_yojson
      ~error_deserializer

  let request_with_metadata context (request : describe_dataset_request) =
    let input = Json_serializers.describe_dataset_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata
      ~shape_name:"AWSLookoutEquipmentFrontendService.DescribeDataset" ~service ~context ~input
      ~output_deserializer:Json_deserializers.describe_dataset_response_of_yojson
      ~error_deserializer
end

module DescribeInferenceScheduler = struct
  let error_to_string = function
    | `AccessDeniedException _ -> "com.amazonaws.lookoutequipment#AccessDeniedException"
    | `InternalServerException _ -> "com.amazonaws.lookoutequipment#InternalServerException"
    | `ResourceNotFoundException _ -> "com.amazonaws.lookoutequipment#ResourceNotFoundException"
    | `ThrottlingException _ -> "com.amazonaws.lookoutequipment#ThrottlingException"
    | `ValidationException _ -> "com.amazonaws.lookoutequipment#ValidationException"
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

  let request context (request : describe_inference_scheduler_request) =
    let input = Json_serializers.describe_inference_scheduler_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request
      ~shape_name:"AWSLookoutEquipmentFrontendService.DescribeInferenceScheduler" ~service ~context
      ~input ~output_deserializer:Json_deserializers.describe_inference_scheduler_response_of_yojson
      ~error_deserializer

  let request_with_metadata context (request : describe_inference_scheduler_request) =
    let input = Json_serializers.describe_inference_scheduler_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata
      ~shape_name:"AWSLookoutEquipmentFrontendService.DescribeInferenceScheduler" ~service ~context
      ~input ~output_deserializer:Json_deserializers.describe_inference_scheduler_response_of_yojson
      ~error_deserializer
end

module DescribeLabel = struct
  let error_to_string = function
    | `AccessDeniedException _ -> "com.amazonaws.lookoutequipment#AccessDeniedException"
    | `InternalServerException _ -> "com.amazonaws.lookoutequipment#InternalServerException"
    | `ResourceNotFoundException _ -> "com.amazonaws.lookoutequipment#ResourceNotFoundException"
    | `ThrottlingException _ -> "com.amazonaws.lookoutequipment#ThrottlingException"
    | `ValidationException _ -> "com.amazonaws.lookoutequipment#ValidationException"
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

  let request context (request : describe_label_request) =
    let input = Json_serializers.describe_label_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request
      ~shape_name:"AWSLookoutEquipmentFrontendService.DescribeLabel" ~service ~context ~input
      ~output_deserializer:Json_deserializers.describe_label_response_of_yojson ~error_deserializer

  let request_with_metadata context (request : describe_label_request) =
    let input = Json_serializers.describe_label_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata
      ~shape_name:"AWSLookoutEquipmentFrontendService.DescribeLabel" ~service ~context ~input
      ~output_deserializer:Json_deserializers.describe_label_response_of_yojson ~error_deserializer
end

module DescribeLabelGroup = struct
  let error_to_string = function
    | `AccessDeniedException _ -> "com.amazonaws.lookoutequipment#AccessDeniedException"
    | `InternalServerException _ -> "com.amazonaws.lookoutequipment#InternalServerException"
    | `ResourceNotFoundException _ -> "com.amazonaws.lookoutequipment#ResourceNotFoundException"
    | `ThrottlingException _ -> "com.amazonaws.lookoutequipment#ThrottlingException"
    | `ValidationException _ -> "com.amazonaws.lookoutequipment#ValidationException"
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

  let request context (request : describe_label_group_request) =
    let input = Json_serializers.describe_label_group_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request
      ~shape_name:"AWSLookoutEquipmentFrontendService.DescribeLabelGroup" ~service ~context ~input
      ~output_deserializer:Json_deserializers.describe_label_group_response_of_yojson
      ~error_deserializer

  let request_with_metadata context (request : describe_label_group_request) =
    let input = Json_serializers.describe_label_group_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata
      ~shape_name:"AWSLookoutEquipmentFrontendService.DescribeLabelGroup" ~service ~context ~input
      ~output_deserializer:Json_deserializers.describe_label_group_response_of_yojson
      ~error_deserializer
end

module DescribeModel = struct
  let error_to_string = function
    | `AccessDeniedException _ -> "com.amazonaws.lookoutequipment#AccessDeniedException"
    | `InternalServerException _ -> "com.amazonaws.lookoutequipment#InternalServerException"
    | `ResourceNotFoundException _ -> "com.amazonaws.lookoutequipment#ResourceNotFoundException"
    | `ThrottlingException _ -> "com.amazonaws.lookoutequipment#ThrottlingException"
    | `ValidationException _ -> "com.amazonaws.lookoutequipment#ValidationException"
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

  let request context (request : describe_model_request) =
    let input = Json_serializers.describe_model_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request
      ~shape_name:"AWSLookoutEquipmentFrontendService.DescribeModel" ~service ~context ~input
      ~output_deserializer:Json_deserializers.describe_model_response_of_yojson ~error_deserializer

  let request_with_metadata context (request : describe_model_request) =
    let input = Json_serializers.describe_model_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata
      ~shape_name:"AWSLookoutEquipmentFrontendService.DescribeModel" ~service ~context ~input
      ~output_deserializer:Json_deserializers.describe_model_response_of_yojson ~error_deserializer
end

module DescribeModelVersion = struct
  let error_to_string = function
    | `AccessDeniedException _ -> "com.amazonaws.lookoutequipment#AccessDeniedException"
    | `InternalServerException _ -> "com.amazonaws.lookoutequipment#InternalServerException"
    | `ResourceNotFoundException _ -> "com.amazonaws.lookoutequipment#ResourceNotFoundException"
    | `ThrottlingException _ -> "com.amazonaws.lookoutequipment#ThrottlingException"
    | `ValidationException _ -> "com.amazonaws.lookoutequipment#ValidationException"
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

  let request context (request : describe_model_version_request) =
    let input = Json_serializers.describe_model_version_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request
      ~shape_name:"AWSLookoutEquipmentFrontendService.DescribeModelVersion" ~service ~context ~input
      ~output_deserializer:Json_deserializers.describe_model_version_response_of_yojson
      ~error_deserializer

  let request_with_metadata context (request : describe_model_version_request) =
    let input = Json_serializers.describe_model_version_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata
      ~shape_name:"AWSLookoutEquipmentFrontendService.DescribeModelVersion" ~service ~context ~input
      ~output_deserializer:Json_deserializers.describe_model_version_response_of_yojson
      ~error_deserializer
end

module DescribeResourcePolicy = struct
  let error_to_string = function
    | `AccessDeniedException _ -> "com.amazonaws.lookoutequipment#AccessDeniedException"
    | `InternalServerException _ -> "com.amazonaws.lookoutequipment#InternalServerException"
    | `ResourceNotFoundException _ -> "com.amazonaws.lookoutequipment#ResourceNotFoundException"
    | `ThrottlingException _ -> "com.amazonaws.lookoutequipment#ThrottlingException"
    | `ValidationException _ -> "com.amazonaws.lookoutequipment#ValidationException"
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

  let request context (request : describe_resource_policy_request) =
    let input = Json_serializers.describe_resource_policy_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request
      ~shape_name:"AWSLookoutEquipmentFrontendService.DescribeResourcePolicy" ~service ~context
      ~input ~output_deserializer:Json_deserializers.describe_resource_policy_response_of_yojson
      ~error_deserializer

  let request_with_metadata context (request : describe_resource_policy_request) =
    let input = Json_serializers.describe_resource_policy_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata
      ~shape_name:"AWSLookoutEquipmentFrontendService.DescribeResourcePolicy" ~service ~context
      ~input ~output_deserializer:Json_deserializers.describe_resource_policy_response_of_yojson
      ~error_deserializer
end

module DescribeRetrainingScheduler = struct
  let error_to_string = function
    | `AccessDeniedException _ -> "com.amazonaws.lookoutequipment#AccessDeniedException"
    | `InternalServerException _ -> "com.amazonaws.lookoutequipment#InternalServerException"
    | `ResourceNotFoundException _ -> "com.amazonaws.lookoutequipment#ResourceNotFoundException"
    | `ThrottlingException _ -> "com.amazonaws.lookoutequipment#ThrottlingException"
    | `ValidationException _ -> "com.amazonaws.lookoutequipment#ValidationException"
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

  let request context (request : describe_retraining_scheduler_request) =
    let input = Json_serializers.describe_retraining_scheduler_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request
      ~shape_name:"AWSLookoutEquipmentFrontendService.DescribeRetrainingScheduler" ~service ~context
      ~input
      ~output_deserializer:Json_deserializers.describe_retraining_scheduler_response_of_yojson
      ~error_deserializer

  let request_with_metadata context (request : describe_retraining_scheduler_request) =
    let input = Json_serializers.describe_retraining_scheduler_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata
      ~shape_name:"AWSLookoutEquipmentFrontendService.DescribeRetrainingScheduler" ~service ~context
      ~input
      ~output_deserializer:Json_deserializers.describe_retraining_scheduler_response_of_yojson
      ~error_deserializer
end

module ImportDataset = struct
  let error_to_string = function
    | `AccessDeniedException _ -> "com.amazonaws.lookoutequipment#AccessDeniedException"
    | `ConflictException _ -> "com.amazonaws.lookoutequipment#ConflictException"
    | `InternalServerException _ -> "com.amazonaws.lookoutequipment#InternalServerException"
    | `ResourceNotFoundException _ -> "com.amazonaws.lookoutequipment#ResourceNotFoundException"
    | `ServiceQuotaExceededException _ ->
        "com.amazonaws.lookoutequipment#ServiceQuotaExceededException"
    | `ThrottlingException _ -> "com.amazonaws.lookoutequipment#ThrottlingException"
    | `ValidationException _ -> "com.amazonaws.lookoutequipment#ValidationException"
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

  let request context (request : import_dataset_request) =
    let input = Json_serializers.import_dataset_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request
      ~shape_name:"AWSLookoutEquipmentFrontendService.ImportDataset" ~service ~context ~input
      ~output_deserializer:Json_deserializers.import_dataset_response_of_yojson ~error_deserializer

  let request_with_metadata context (request : import_dataset_request) =
    let input = Json_serializers.import_dataset_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata
      ~shape_name:"AWSLookoutEquipmentFrontendService.ImportDataset" ~service ~context ~input
      ~output_deserializer:Json_deserializers.import_dataset_response_of_yojson ~error_deserializer
end

module ImportModelVersion = struct
  let error_to_string = function
    | `AccessDeniedException _ -> "com.amazonaws.lookoutequipment#AccessDeniedException"
    | `ConflictException _ -> "com.amazonaws.lookoutequipment#ConflictException"
    | `InternalServerException _ -> "com.amazonaws.lookoutequipment#InternalServerException"
    | `ResourceNotFoundException _ -> "com.amazonaws.lookoutequipment#ResourceNotFoundException"
    | `ServiceQuotaExceededException _ ->
        "com.amazonaws.lookoutequipment#ServiceQuotaExceededException"
    | `ThrottlingException _ -> "com.amazonaws.lookoutequipment#ThrottlingException"
    | `ValidationException _ -> "com.amazonaws.lookoutequipment#ValidationException"
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

  let request context (request : import_model_version_request) =
    let input = Json_serializers.import_model_version_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request
      ~shape_name:"AWSLookoutEquipmentFrontendService.ImportModelVersion" ~service ~context ~input
      ~output_deserializer:Json_deserializers.import_model_version_response_of_yojson
      ~error_deserializer

  let request_with_metadata context (request : import_model_version_request) =
    let input = Json_serializers.import_model_version_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata
      ~shape_name:"AWSLookoutEquipmentFrontendService.ImportModelVersion" ~service ~context ~input
      ~output_deserializer:Json_deserializers.import_model_version_response_of_yojson
      ~error_deserializer
end

module ListDataIngestionJobs = struct
  let error_to_string = function
    | `AccessDeniedException _ -> "com.amazonaws.lookoutequipment#AccessDeniedException"
    | `InternalServerException _ -> "com.amazonaws.lookoutequipment#InternalServerException"
    | `ThrottlingException _ -> "com.amazonaws.lookoutequipment#ThrottlingException"
    | `ValidationException _ -> "com.amazonaws.lookoutequipment#ValidationException"
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

  let request context (request : list_data_ingestion_jobs_request) =
    let input = Json_serializers.list_data_ingestion_jobs_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request
      ~shape_name:"AWSLookoutEquipmentFrontendService.ListDataIngestionJobs" ~service ~context
      ~input ~output_deserializer:Json_deserializers.list_data_ingestion_jobs_response_of_yojson
      ~error_deserializer

  let request_with_metadata context (request : list_data_ingestion_jobs_request) =
    let input = Json_serializers.list_data_ingestion_jobs_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata
      ~shape_name:"AWSLookoutEquipmentFrontendService.ListDataIngestionJobs" ~service ~context
      ~input ~output_deserializer:Json_deserializers.list_data_ingestion_jobs_response_of_yojson
      ~error_deserializer
end

module ListDatasets = struct
  let error_to_string = function
    | `AccessDeniedException _ -> "com.amazonaws.lookoutequipment#AccessDeniedException"
    | `InternalServerException _ -> "com.amazonaws.lookoutequipment#InternalServerException"
    | `ThrottlingException _ -> "com.amazonaws.lookoutequipment#ThrottlingException"
    | `ValidationException _ -> "com.amazonaws.lookoutequipment#ValidationException"
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

  let request context (request : list_datasets_request) =
    let input = Json_serializers.list_datasets_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request
      ~shape_name:"AWSLookoutEquipmentFrontendService.ListDatasets" ~service ~context ~input
      ~output_deserializer:Json_deserializers.list_datasets_response_of_yojson ~error_deserializer

  let request_with_metadata context (request : list_datasets_request) =
    let input = Json_serializers.list_datasets_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata
      ~shape_name:"AWSLookoutEquipmentFrontendService.ListDatasets" ~service ~context ~input
      ~output_deserializer:Json_deserializers.list_datasets_response_of_yojson ~error_deserializer
end

module ListInferenceEvents = struct
  let error_to_string = function
    | `AccessDeniedException _ -> "com.amazonaws.lookoutequipment#AccessDeniedException"
    | `InternalServerException _ -> "com.amazonaws.lookoutequipment#InternalServerException"
    | `ResourceNotFoundException _ -> "com.amazonaws.lookoutequipment#ResourceNotFoundException"
    | `ThrottlingException _ -> "com.amazonaws.lookoutequipment#ThrottlingException"
    | `ValidationException _ -> "com.amazonaws.lookoutequipment#ValidationException"
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

  let request context (request : list_inference_events_request) =
    let input = Json_serializers.list_inference_events_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request
      ~shape_name:"AWSLookoutEquipmentFrontendService.ListInferenceEvents" ~service ~context ~input
      ~output_deserializer:Json_deserializers.list_inference_events_response_of_yojson
      ~error_deserializer

  let request_with_metadata context (request : list_inference_events_request) =
    let input = Json_serializers.list_inference_events_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata
      ~shape_name:"AWSLookoutEquipmentFrontendService.ListInferenceEvents" ~service ~context ~input
      ~output_deserializer:Json_deserializers.list_inference_events_response_of_yojson
      ~error_deserializer
end

module ListInferenceExecutions = struct
  let error_to_string = function
    | `AccessDeniedException _ -> "com.amazonaws.lookoutequipment#AccessDeniedException"
    | `InternalServerException _ -> "com.amazonaws.lookoutequipment#InternalServerException"
    | `ResourceNotFoundException _ -> "com.amazonaws.lookoutequipment#ResourceNotFoundException"
    | `ThrottlingException _ -> "com.amazonaws.lookoutequipment#ThrottlingException"
    | `ValidationException _ -> "com.amazonaws.lookoutequipment#ValidationException"
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

  let request context (request : list_inference_executions_request) =
    let input = Json_serializers.list_inference_executions_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request
      ~shape_name:"AWSLookoutEquipmentFrontendService.ListInferenceExecutions" ~service ~context
      ~input ~output_deserializer:Json_deserializers.list_inference_executions_response_of_yojson
      ~error_deserializer

  let request_with_metadata context (request : list_inference_executions_request) =
    let input = Json_serializers.list_inference_executions_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata
      ~shape_name:"AWSLookoutEquipmentFrontendService.ListInferenceExecutions" ~service ~context
      ~input ~output_deserializer:Json_deserializers.list_inference_executions_response_of_yojson
      ~error_deserializer
end

module ListInferenceSchedulers = struct
  let error_to_string = function
    | `AccessDeniedException _ -> "com.amazonaws.lookoutequipment#AccessDeniedException"
    | `InternalServerException _ -> "com.amazonaws.lookoutequipment#InternalServerException"
    | `ThrottlingException _ -> "com.amazonaws.lookoutequipment#ThrottlingException"
    | `ValidationException _ -> "com.amazonaws.lookoutequipment#ValidationException"
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

  let request context (request : list_inference_schedulers_request) =
    let input = Json_serializers.list_inference_schedulers_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request
      ~shape_name:"AWSLookoutEquipmentFrontendService.ListInferenceSchedulers" ~service ~context
      ~input ~output_deserializer:Json_deserializers.list_inference_schedulers_response_of_yojson
      ~error_deserializer

  let request_with_metadata context (request : list_inference_schedulers_request) =
    let input = Json_serializers.list_inference_schedulers_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata
      ~shape_name:"AWSLookoutEquipmentFrontendService.ListInferenceSchedulers" ~service ~context
      ~input ~output_deserializer:Json_deserializers.list_inference_schedulers_response_of_yojson
      ~error_deserializer
end

module ListLabelGroups = struct
  let error_to_string = function
    | `AccessDeniedException _ -> "com.amazonaws.lookoutequipment#AccessDeniedException"
    | `InternalServerException _ -> "com.amazonaws.lookoutequipment#InternalServerException"
    | `ThrottlingException _ -> "com.amazonaws.lookoutequipment#ThrottlingException"
    | `ValidationException _ -> "com.amazonaws.lookoutequipment#ValidationException"
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

  let request context (request : list_label_groups_request) =
    let input = Json_serializers.list_label_groups_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request
      ~shape_name:"AWSLookoutEquipmentFrontendService.ListLabelGroups" ~service ~context ~input
      ~output_deserializer:Json_deserializers.list_label_groups_response_of_yojson
      ~error_deserializer

  let request_with_metadata context (request : list_label_groups_request) =
    let input = Json_serializers.list_label_groups_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata
      ~shape_name:"AWSLookoutEquipmentFrontendService.ListLabelGroups" ~service ~context ~input
      ~output_deserializer:Json_deserializers.list_label_groups_response_of_yojson
      ~error_deserializer
end

module ListLabels = struct
  let error_to_string = function
    | `AccessDeniedException _ -> "com.amazonaws.lookoutequipment#AccessDeniedException"
    | `InternalServerException _ -> "com.amazonaws.lookoutequipment#InternalServerException"
    | `ThrottlingException _ -> "com.amazonaws.lookoutequipment#ThrottlingException"
    | `ValidationException _ -> "com.amazonaws.lookoutequipment#ValidationException"
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

  let request context (request : list_labels_request) =
    let input = Json_serializers.list_labels_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"AWSLookoutEquipmentFrontendService.ListLabels"
      ~service ~context ~input
      ~output_deserializer:Json_deserializers.list_labels_response_of_yojson ~error_deserializer

  let request_with_metadata context (request : list_labels_request) =
    let input = Json_serializers.list_labels_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata
      ~shape_name:"AWSLookoutEquipmentFrontendService.ListLabels" ~service ~context ~input
      ~output_deserializer:Json_deserializers.list_labels_response_of_yojson ~error_deserializer
end

module ListModels = struct
  let error_to_string = function
    | `AccessDeniedException _ -> "com.amazonaws.lookoutequipment#AccessDeniedException"
    | `InternalServerException _ -> "com.amazonaws.lookoutequipment#InternalServerException"
    | `ThrottlingException _ -> "com.amazonaws.lookoutequipment#ThrottlingException"
    | `ValidationException _ -> "com.amazonaws.lookoutequipment#ValidationException"
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

  let request context (request : list_models_request) =
    let input = Json_serializers.list_models_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"AWSLookoutEquipmentFrontendService.ListModels"
      ~service ~context ~input
      ~output_deserializer:Json_deserializers.list_models_response_of_yojson ~error_deserializer

  let request_with_metadata context (request : list_models_request) =
    let input = Json_serializers.list_models_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata
      ~shape_name:"AWSLookoutEquipmentFrontendService.ListModels" ~service ~context ~input
      ~output_deserializer:Json_deserializers.list_models_response_of_yojson ~error_deserializer
end

module ListModelVersions = struct
  let error_to_string = function
    | `AccessDeniedException _ -> "com.amazonaws.lookoutequipment#AccessDeniedException"
    | `InternalServerException _ -> "com.amazonaws.lookoutequipment#InternalServerException"
    | `ResourceNotFoundException _ -> "com.amazonaws.lookoutequipment#ResourceNotFoundException"
    | `ThrottlingException _ -> "com.amazonaws.lookoutequipment#ThrottlingException"
    | `ValidationException _ -> "com.amazonaws.lookoutequipment#ValidationException"
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

  let request context (request : list_model_versions_request) =
    let input = Json_serializers.list_model_versions_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request
      ~shape_name:"AWSLookoutEquipmentFrontendService.ListModelVersions" ~service ~context ~input
      ~output_deserializer:Json_deserializers.list_model_versions_response_of_yojson
      ~error_deserializer

  let request_with_metadata context (request : list_model_versions_request) =
    let input = Json_serializers.list_model_versions_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata
      ~shape_name:"AWSLookoutEquipmentFrontendService.ListModelVersions" ~service ~context ~input
      ~output_deserializer:Json_deserializers.list_model_versions_response_of_yojson
      ~error_deserializer
end

module ListRetrainingSchedulers = struct
  let error_to_string = function
    | `AccessDeniedException _ -> "com.amazonaws.lookoutequipment#AccessDeniedException"
    | `InternalServerException _ -> "com.amazonaws.lookoutequipment#InternalServerException"
    | `ThrottlingException _ -> "com.amazonaws.lookoutequipment#ThrottlingException"
    | `ValidationException _ -> "com.amazonaws.lookoutequipment#ValidationException"
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

  let request context (request : list_retraining_schedulers_request) =
    let input = Json_serializers.list_retraining_schedulers_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request
      ~shape_name:"AWSLookoutEquipmentFrontendService.ListRetrainingSchedulers" ~service ~context
      ~input ~output_deserializer:Json_deserializers.list_retraining_schedulers_response_of_yojson
      ~error_deserializer

  let request_with_metadata context (request : list_retraining_schedulers_request) =
    let input = Json_serializers.list_retraining_schedulers_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata
      ~shape_name:"AWSLookoutEquipmentFrontendService.ListRetrainingSchedulers" ~service ~context
      ~input ~output_deserializer:Json_deserializers.list_retraining_schedulers_response_of_yojson
      ~error_deserializer
end

module ListSensorStatistics = struct
  let error_to_string = function
    | `AccessDeniedException _ -> "com.amazonaws.lookoutequipment#AccessDeniedException"
    | `InternalServerException _ -> "com.amazonaws.lookoutequipment#InternalServerException"
    | `ResourceNotFoundException _ -> "com.amazonaws.lookoutequipment#ResourceNotFoundException"
    | `ThrottlingException _ -> "com.amazonaws.lookoutequipment#ThrottlingException"
    | `ValidationException _ -> "com.amazonaws.lookoutequipment#ValidationException"
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

  let request context (request : list_sensor_statistics_request) =
    let input = Json_serializers.list_sensor_statistics_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request
      ~shape_name:"AWSLookoutEquipmentFrontendService.ListSensorStatistics" ~service ~context ~input
      ~output_deserializer:Json_deserializers.list_sensor_statistics_response_of_yojson
      ~error_deserializer

  let request_with_metadata context (request : list_sensor_statistics_request) =
    let input = Json_serializers.list_sensor_statistics_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata
      ~shape_name:"AWSLookoutEquipmentFrontendService.ListSensorStatistics" ~service ~context ~input
      ~output_deserializer:Json_deserializers.list_sensor_statistics_response_of_yojson
      ~error_deserializer
end

module ListTagsForResource = struct
  let error_to_string = function
    | `AccessDeniedException _ -> "com.amazonaws.lookoutequipment#AccessDeniedException"
    | `InternalServerException _ -> "com.amazonaws.lookoutequipment#InternalServerException"
    | `ResourceNotFoundException _ -> "com.amazonaws.lookoutequipment#ResourceNotFoundException"
    | `ThrottlingException _ -> "com.amazonaws.lookoutequipment#ThrottlingException"
    | `ValidationException _ -> "com.amazonaws.lookoutequipment#ValidationException"
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

  let request context (request : list_tags_for_resource_request) =
    let input = Json_serializers.list_tags_for_resource_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request
      ~shape_name:"AWSLookoutEquipmentFrontendService.ListTagsForResource" ~service ~context ~input
      ~output_deserializer:Json_deserializers.list_tags_for_resource_response_of_yojson
      ~error_deserializer

  let request_with_metadata context (request : list_tags_for_resource_request) =
    let input = Json_serializers.list_tags_for_resource_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata
      ~shape_name:"AWSLookoutEquipmentFrontendService.ListTagsForResource" ~service ~context ~input
      ~output_deserializer:Json_deserializers.list_tags_for_resource_response_of_yojson
      ~error_deserializer
end

module PutResourcePolicy = struct
  let error_to_string = function
    | `AccessDeniedException _ -> "com.amazonaws.lookoutequipment#AccessDeniedException"
    | `ConflictException _ -> "com.amazonaws.lookoutequipment#ConflictException"
    | `InternalServerException _ -> "com.amazonaws.lookoutequipment#InternalServerException"
    | `ResourceNotFoundException _ -> "com.amazonaws.lookoutequipment#ResourceNotFoundException"
    | `ServiceQuotaExceededException _ ->
        "com.amazonaws.lookoutequipment#ServiceQuotaExceededException"
    | `ThrottlingException _ -> "com.amazonaws.lookoutequipment#ThrottlingException"
    | `ValidationException _ -> "com.amazonaws.lookoutequipment#ValidationException"
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

  let request context (request : put_resource_policy_request) =
    let input = Json_serializers.put_resource_policy_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request
      ~shape_name:"AWSLookoutEquipmentFrontendService.PutResourcePolicy" ~service ~context ~input
      ~output_deserializer:Json_deserializers.put_resource_policy_response_of_yojson
      ~error_deserializer

  let request_with_metadata context (request : put_resource_policy_request) =
    let input = Json_serializers.put_resource_policy_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata
      ~shape_name:"AWSLookoutEquipmentFrontendService.PutResourcePolicy" ~service ~context ~input
      ~output_deserializer:Json_deserializers.put_resource_policy_response_of_yojson
      ~error_deserializer
end

module StartDataIngestionJob = struct
  let error_to_string = function
    | `AccessDeniedException _ -> "com.amazonaws.lookoutequipment#AccessDeniedException"
    | `ConflictException _ -> "com.amazonaws.lookoutequipment#ConflictException"
    | `InternalServerException _ -> "com.amazonaws.lookoutequipment#InternalServerException"
    | `ResourceNotFoundException _ -> "com.amazonaws.lookoutequipment#ResourceNotFoundException"
    | `ServiceQuotaExceededException _ ->
        "com.amazonaws.lookoutequipment#ServiceQuotaExceededException"
    | `ThrottlingException _ -> "com.amazonaws.lookoutequipment#ThrottlingException"
    | `ValidationException _ -> "com.amazonaws.lookoutequipment#ValidationException"
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

  let request context (request : start_data_ingestion_job_request) =
    let input = Json_serializers.start_data_ingestion_job_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request
      ~shape_name:"AWSLookoutEquipmentFrontendService.StartDataIngestionJob" ~service ~context
      ~input ~output_deserializer:Json_deserializers.start_data_ingestion_job_response_of_yojson
      ~error_deserializer

  let request_with_metadata context (request : start_data_ingestion_job_request) =
    let input = Json_serializers.start_data_ingestion_job_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata
      ~shape_name:"AWSLookoutEquipmentFrontendService.StartDataIngestionJob" ~service ~context
      ~input ~output_deserializer:Json_deserializers.start_data_ingestion_job_response_of_yojson
      ~error_deserializer
end

module StartInferenceScheduler = struct
  let error_to_string = function
    | `AccessDeniedException _ -> "com.amazonaws.lookoutequipment#AccessDeniedException"
    | `ConflictException _ -> "com.amazonaws.lookoutequipment#ConflictException"
    | `InternalServerException _ -> "com.amazonaws.lookoutequipment#InternalServerException"
    | `ResourceNotFoundException _ -> "com.amazonaws.lookoutequipment#ResourceNotFoundException"
    | `ThrottlingException _ -> "com.amazonaws.lookoutequipment#ThrottlingException"
    | `ValidationException _ -> "com.amazonaws.lookoutequipment#ValidationException"
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

  let request context (request : start_inference_scheduler_request) =
    let input = Json_serializers.start_inference_scheduler_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request
      ~shape_name:"AWSLookoutEquipmentFrontendService.StartInferenceScheduler" ~service ~context
      ~input ~output_deserializer:Json_deserializers.start_inference_scheduler_response_of_yojson
      ~error_deserializer

  let request_with_metadata context (request : start_inference_scheduler_request) =
    let input = Json_serializers.start_inference_scheduler_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata
      ~shape_name:"AWSLookoutEquipmentFrontendService.StartInferenceScheduler" ~service ~context
      ~input ~output_deserializer:Json_deserializers.start_inference_scheduler_response_of_yojson
      ~error_deserializer
end

module StartRetrainingScheduler = struct
  let error_to_string = function
    | `AccessDeniedException _ -> "com.amazonaws.lookoutequipment#AccessDeniedException"
    | `ConflictException _ -> "com.amazonaws.lookoutequipment#ConflictException"
    | `InternalServerException _ -> "com.amazonaws.lookoutequipment#InternalServerException"
    | `ResourceNotFoundException _ -> "com.amazonaws.lookoutequipment#ResourceNotFoundException"
    | `ThrottlingException _ -> "com.amazonaws.lookoutequipment#ThrottlingException"
    | `ValidationException _ -> "com.amazonaws.lookoutequipment#ValidationException"
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

  let request context (request : start_retraining_scheduler_request) =
    let input = Json_serializers.start_retraining_scheduler_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request
      ~shape_name:"AWSLookoutEquipmentFrontendService.StartRetrainingScheduler" ~service ~context
      ~input ~output_deserializer:Json_deserializers.start_retraining_scheduler_response_of_yojson
      ~error_deserializer

  let request_with_metadata context (request : start_retraining_scheduler_request) =
    let input = Json_serializers.start_retraining_scheduler_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata
      ~shape_name:"AWSLookoutEquipmentFrontendService.StartRetrainingScheduler" ~service ~context
      ~input ~output_deserializer:Json_deserializers.start_retraining_scheduler_response_of_yojson
      ~error_deserializer
end

module StopInferenceScheduler = struct
  let error_to_string = function
    | `AccessDeniedException _ -> "com.amazonaws.lookoutequipment#AccessDeniedException"
    | `ConflictException _ -> "com.amazonaws.lookoutequipment#ConflictException"
    | `InternalServerException _ -> "com.amazonaws.lookoutequipment#InternalServerException"
    | `ResourceNotFoundException _ -> "com.amazonaws.lookoutequipment#ResourceNotFoundException"
    | `ThrottlingException _ -> "com.amazonaws.lookoutequipment#ThrottlingException"
    | `ValidationException _ -> "com.amazonaws.lookoutequipment#ValidationException"
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

  let request context (request : stop_inference_scheduler_request) =
    let input = Json_serializers.stop_inference_scheduler_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request
      ~shape_name:"AWSLookoutEquipmentFrontendService.StopInferenceScheduler" ~service ~context
      ~input ~output_deserializer:Json_deserializers.stop_inference_scheduler_response_of_yojson
      ~error_deserializer

  let request_with_metadata context (request : stop_inference_scheduler_request) =
    let input = Json_serializers.stop_inference_scheduler_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata
      ~shape_name:"AWSLookoutEquipmentFrontendService.StopInferenceScheduler" ~service ~context
      ~input ~output_deserializer:Json_deserializers.stop_inference_scheduler_response_of_yojson
      ~error_deserializer
end

module StopRetrainingScheduler = struct
  let error_to_string = function
    | `AccessDeniedException _ -> "com.amazonaws.lookoutequipment#AccessDeniedException"
    | `ConflictException _ -> "com.amazonaws.lookoutequipment#ConflictException"
    | `InternalServerException _ -> "com.amazonaws.lookoutequipment#InternalServerException"
    | `ResourceNotFoundException _ -> "com.amazonaws.lookoutequipment#ResourceNotFoundException"
    | `ThrottlingException _ -> "com.amazonaws.lookoutequipment#ThrottlingException"
    | `ValidationException _ -> "com.amazonaws.lookoutequipment#ValidationException"
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

  let request context (request : stop_retraining_scheduler_request) =
    let input = Json_serializers.stop_retraining_scheduler_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request
      ~shape_name:"AWSLookoutEquipmentFrontendService.StopRetrainingScheduler" ~service ~context
      ~input ~output_deserializer:Json_deserializers.stop_retraining_scheduler_response_of_yojson
      ~error_deserializer

  let request_with_metadata context (request : stop_retraining_scheduler_request) =
    let input = Json_serializers.stop_retraining_scheduler_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata
      ~shape_name:"AWSLookoutEquipmentFrontendService.StopRetrainingScheduler" ~service ~context
      ~input ~output_deserializer:Json_deserializers.stop_retraining_scheduler_response_of_yojson
      ~error_deserializer
end

module TagResource = struct
  let error_to_string = function
    | `AccessDeniedException _ -> "com.amazonaws.lookoutequipment#AccessDeniedException"
    | `InternalServerException _ -> "com.amazonaws.lookoutequipment#InternalServerException"
    | `ResourceNotFoundException _ -> "com.amazonaws.lookoutequipment#ResourceNotFoundException"
    | `ServiceQuotaExceededException _ ->
        "com.amazonaws.lookoutequipment#ServiceQuotaExceededException"
    | `ThrottlingException _ -> "com.amazonaws.lookoutequipment#ThrottlingException"
    | `ValidationException _ -> "com.amazonaws.lookoutequipment#ValidationException"
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

  let request context (request : tag_resource_request) =
    let input = Json_serializers.tag_resource_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"AWSLookoutEquipmentFrontendService.TagResource"
      ~service ~context ~input
      ~output_deserializer:Json_deserializers.tag_resource_response_of_yojson ~error_deserializer

  let request_with_metadata context (request : tag_resource_request) =
    let input = Json_serializers.tag_resource_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata
      ~shape_name:"AWSLookoutEquipmentFrontendService.TagResource" ~service ~context ~input
      ~output_deserializer:Json_deserializers.tag_resource_response_of_yojson ~error_deserializer
end

module UntagResource = struct
  let error_to_string = function
    | `AccessDeniedException _ -> "com.amazonaws.lookoutequipment#AccessDeniedException"
    | `InternalServerException _ -> "com.amazonaws.lookoutequipment#InternalServerException"
    | `ResourceNotFoundException _ -> "com.amazonaws.lookoutequipment#ResourceNotFoundException"
    | `ThrottlingException _ -> "com.amazonaws.lookoutequipment#ThrottlingException"
    | `ValidationException _ -> "com.amazonaws.lookoutequipment#ValidationException"
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

  let request context (request : untag_resource_request) =
    let input = Json_serializers.untag_resource_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request
      ~shape_name:"AWSLookoutEquipmentFrontendService.UntagResource" ~service ~context ~input
      ~output_deserializer:Json_deserializers.untag_resource_response_of_yojson ~error_deserializer

  let request_with_metadata context (request : untag_resource_request) =
    let input = Json_serializers.untag_resource_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata
      ~shape_name:"AWSLookoutEquipmentFrontendService.UntagResource" ~service ~context ~input
      ~output_deserializer:Json_deserializers.untag_resource_response_of_yojson ~error_deserializer
end

module UpdateActiveModelVersion = struct
  let error_to_string = function
    | `AccessDeniedException _ -> "com.amazonaws.lookoutequipment#AccessDeniedException"
    | `ConflictException _ -> "com.amazonaws.lookoutequipment#ConflictException"
    | `InternalServerException _ -> "com.amazonaws.lookoutequipment#InternalServerException"
    | `ResourceNotFoundException _ -> "com.amazonaws.lookoutequipment#ResourceNotFoundException"
    | `ThrottlingException _ -> "com.amazonaws.lookoutequipment#ThrottlingException"
    | `ValidationException _ -> "com.amazonaws.lookoutequipment#ValidationException"
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

  let request context (request : update_active_model_version_request) =
    let input = Json_serializers.update_active_model_version_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request
      ~shape_name:"AWSLookoutEquipmentFrontendService.UpdateActiveModelVersion" ~service ~context
      ~input ~output_deserializer:Json_deserializers.update_active_model_version_response_of_yojson
      ~error_deserializer

  let request_with_metadata context (request : update_active_model_version_request) =
    let input = Json_serializers.update_active_model_version_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata
      ~shape_name:"AWSLookoutEquipmentFrontendService.UpdateActiveModelVersion" ~service ~context
      ~input ~output_deserializer:Json_deserializers.update_active_model_version_response_of_yojson
      ~error_deserializer
end

module UpdateInferenceScheduler = struct
  let error_to_string = function
    | `AccessDeniedException _ -> "com.amazonaws.lookoutequipment#AccessDeniedException"
    | `ConflictException _ -> "com.amazonaws.lookoutequipment#ConflictException"
    | `InternalServerException _ -> "com.amazonaws.lookoutequipment#InternalServerException"
    | `ResourceNotFoundException _ -> "com.amazonaws.lookoutequipment#ResourceNotFoundException"
    | `ThrottlingException _ -> "com.amazonaws.lookoutequipment#ThrottlingException"
    | `ValidationException _ -> "com.amazonaws.lookoutequipment#ValidationException"
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

  let request context (request : update_inference_scheduler_request) =
    let input = Json_serializers.update_inference_scheduler_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request
      ~shape_name:"AWSLookoutEquipmentFrontendService.UpdateInferenceScheduler" ~service ~context
      ~input ~output_deserializer:Smaws_Lib.Smithy_api.Json_deserializers.unit__of_yojson
      ~error_deserializer

  let request_with_metadata context (request : update_inference_scheduler_request) =
    let input = Json_serializers.update_inference_scheduler_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata
      ~shape_name:"AWSLookoutEquipmentFrontendService.UpdateInferenceScheduler" ~service ~context
      ~input ~output_deserializer:Smaws_Lib.Smithy_api.Json_deserializers.unit__of_yojson
      ~error_deserializer
end

module UpdateLabelGroup = struct
  let error_to_string = function
    | `AccessDeniedException _ -> "com.amazonaws.lookoutequipment#AccessDeniedException"
    | `ConflictException _ -> "com.amazonaws.lookoutequipment#ConflictException"
    | `InternalServerException _ -> "com.amazonaws.lookoutequipment#InternalServerException"
    | `ResourceNotFoundException _ -> "com.amazonaws.lookoutequipment#ResourceNotFoundException"
    | `ThrottlingException _ -> "com.amazonaws.lookoutequipment#ThrottlingException"
    | `ValidationException _ -> "com.amazonaws.lookoutequipment#ValidationException"
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

  let request context (request : update_label_group_request) =
    let input = Json_serializers.update_label_group_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request
      ~shape_name:"AWSLookoutEquipmentFrontendService.UpdateLabelGroup" ~service ~context ~input
      ~output_deserializer:Smaws_Lib.Smithy_api.Json_deserializers.unit__of_yojson
      ~error_deserializer

  let request_with_metadata context (request : update_label_group_request) =
    let input = Json_serializers.update_label_group_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata
      ~shape_name:"AWSLookoutEquipmentFrontendService.UpdateLabelGroup" ~service ~context ~input
      ~output_deserializer:Smaws_Lib.Smithy_api.Json_deserializers.unit__of_yojson
      ~error_deserializer
end

module UpdateModel = struct
  let error_to_string = function
    | `AccessDeniedException _ -> "com.amazonaws.lookoutequipment#AccessDeniedException"
    | `ConflictException _ -> "com.amazonaws.lookoutequipment#ConflictException"
    | `InternalServerException _ -> "com.amazonaws.lookoutequipment#InternalServerException"
    | `ResourceNotFoundException _ -> "com.amazonaws.lookoutequipment#ResourceNotFoundException"
    | `ThrottlingException _ -> "com.amazonaws.lookoutequipment#ThrottlingException"
    | `ValidationException _ -> "com.amazonaws.lookoutequipment#ValidationException"
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
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"AWSLookoutEquipmentFrontendService.UpdateModel"
      ~service ~context ~input
      ~output_deserializer:Smaws_Lib.Smithy_api.Json_deserializers.unit__of_yojson
      ~error_deserializer

  let request_with_metadata context (request : update_model_request) =
    let input = Json_serializers.update_model_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata
      ~shape_name:"AWSLookoutEquipmentFrontendService.UpdateModel" ~service ~context ~input
      ~output_deserializer:Smaws_Lib.Smithy_api.Json_deserializers.unit__of_yojson
      ~error_deserializer
end

module UpdateRetrainingScheduler = struct
  let error_to_string = function
    | `AccessDeniedException _ -> "com.amazonaws.lookoutequipment#AccessDeniedException"
    | `ConflictException _ -> "com.amazonaws.lookoutequipment#ConflictException"
    | `InternalServerException _ -> "com.amazonaws.lookoutequipment#InternalServerException"
    | `ResourceNotFoundException _ -> "com.amazonaws.lookoutequipment#ResourceNotFoundException"
    | `ThrottlingException _ -> "com.amazonaws.lookoutequipment#ThrottlingException"
    | `ValidationException _ -> "com.amazonaws.lookoutequipment#ValidationException"
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

  let request context (request : update_retraining_scheduler_request) =
    let input = Json_serializers.update_retraining_scheduler_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request
      ~shape_name:"AWSLookoutEquipmentFrontendService.UpdateRetrainingScheduler" ~service ~context
      ~input ~output_deserializer:Smaws_Lib.Smithy_api.Json_deserializers.unit__of_yojson
      ~error_deserializer

  let request_with_metadata context (request : update_retraining_scheduler_request) =
    let input = Json_serializers.update_retraining_scheduler_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata
      ~shape_name:"AWSLookoutEquipmentFrontendService.UpdateRetrainingScheduler" ~service ~context
      ~input ~output_deserializer:Smaws_Lib.Smithy_api.Json_deserializers.unit__of_yojson
      ~error_deserializer
end
