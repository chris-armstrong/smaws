open Types
open Service_metadata

module AssociateFaces = struct
  let error_to_string = function
    | `AccessDeniedException _ -> "com.amazonaws.rekognition#AccessDeniedException"
    | `ConflictException _ -> "com.amazonaws.rekognition#ConflictException"
    | `IdempotentParameterMismatchException _ ->
        "com.amazonaws.rekognition#IdempotentParameterMismatchException"
    | `InternalServerError _ -> "com.amazonaws.rekognition#InternalServerError"
    | `InvalidParameterException _ -> "com.amazonaws.rekognition#InvalidParameterException"
    | `ProvisionedThroughputExceededException _ ->
        "com.amazonaws.rekognition#ProvisionedThroughputExceededException"
    | `ResourceNotFoundException _ -> "com.amazonaws.rekognition#ResourceNotFoundException"
    | `ServiceQuotaExceededException _ -> "com.amazonaws.rekognition#ServiceQuotaExceededException"
    | `ThrottlingException _ -> "com.amazonaws.rekognition#ThrottlingException"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "AccessDeniedException" ->
          `AccessDeniedException (Json_deserializers.access_denied_exception_of_yojson tree path)
      | _, "ConflictException" ->
          `ConflictException (Json_deserializers.conflict_exception_of_yojson tree path)
      | _, "IdempotentParameterMismatchException" ->
          `IdempotentParameterMismatchException
            (Json_deserializers.idempotent_parameter_mismatch_exception_of_yojson tree path)
      | _, "InternalServerError" ->
          `InternalServerError (Json_deserializers.internal_server_error_of_yojson tree path)
      | _, "InvalidParameterException" ->
          `InvalidParameterException
            (Json_deserializers.invalid_parameter_exception_of_yojson tree path)
      | _, "ProvisionedThroughputExceededException" ->
          `ProvisionedThroughputExceededException
            (Json_deserializers.provisioned_throughput_exceeded_exception_of_yojson tree path)
      | _, "ResourceNotFoundException" ->
          `ResourceNotFoundException
            (Json_deserializers.resource_not_found_exception_of_yojson tree path)
      | _, "ServiceQuotaExceededException" ->
          `ServiceQuotaExceededException
            (Json_deserializers.service_quota_exceeded_exception_of_yojson tree path)
      | _, "ThrottlingException" ->
          `ThrottlingException (Json_deserializers.throttling_exception_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : associate_faces_request) =
    let input = Json_serializers.associate_faces_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"RekognitionService.AssociateFaces" ~service
      ~context ~input ~output_deserializer:Json_deserializers.associate_faces_response_of_yojson
      ~error_deserializer

  let request_with_metadata context (request : associate_faces_request) =
    let input = Json_serializers.associate_faces_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata
      ~shape_name:"RekognitionService.AssociateFaces" ~service ~context ~input
      ~output_deserializer:Json_deserializers.associate_faces_response_of_yojson ~error_deserializer
end

module CompareFaces = struct
  let error_to_string = function
    | `AccessDeniedException _ -> "com.amazonaws.rekognition#AccessDeniedException"
    | `ImageTooLargeException _ -> "com.amazonaws.rekognition#ImageTooLargeException"
    | `InternalServerError _ -> "com.amazonaws.rekognition#InternalServerError"
    | `InvalidImageFormatException _ -> "com.amazonaws.rekognition#InvalidImageFormatException"
    | `InvalidParameterException _ -> "com.amazonaws.rekognition#InvalidParameterException"
    | `InvalidS3ObjectException _ -> "com.amazonaws.rekognition#InvalidS3ObjectException"
    | `ProvisionedThroughputExceededException _ ->
        "com.amazonaws.rekognition#ProvisionedThroughputExceededException"
    | `ThrottlingException _ -> "com.amazonaws.rekognition#ThrottlingException"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "AccessDeniedException" ->
          `AccessDeniedException (Json_deserializers.access_denied_exception_of_yojson tree path)
      | _, "ImageTooLargeException" ->
          `ImageTooLargeException (Json_deserializers.image_too_large_exception_of_yojson tree path)
      | _, "InternalServerError" ->
          `InternalServerError (Json_deserializers.internal_server_error_of_yojson tree path)
      | _, "InvalidImageFormatException" ->
          `InvalidImageFormatException
            (Json_deserializers.invalid_image_format_exception_of_yojson tree path)
      | _, "InvalidParameterException" ->
          `InvalidParameterException
            (Json_deserializers.invalid_parameter_exception_of_yojson tree path)
      | _, "InvalidS3ObjectException" ->
          `InvalidS3ObjectException
            (Json_deserializers.invalid_s3_object_exception_of_yojson tree path)
      | _, "ProvisionedThroughputExceededException" ->
          `ProvisionedThroughputExceededException
            (Json_deserializers.provisioned_throughput_exceeded_exception_of_yojson tree path)
      | _, "ThrottlingException" ->
          `ThrottlingException (Json_deserializers.throttling_exception_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : compare_faces_request) =
    let input = Json_serializers.compare_faces_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"RekognitionService.CompareFaces" ~service
      ~context ~input ~output_deserializer:Json_deserializers.compare_faces_response_of_yojson
      ~error_deserializer

  let request_with_metadata context (request : compare_faces_request) =
    let input = Json_serializers.compare_faces_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata ~shape_name:"RekognitionService.CompareFaces"
      ~service ~context ~input
      ~output_deserializer:Json_deserializers.compare_faces_response_of_yojson ~error_deserializer
end

module CopyProjectVersion = struct
  let error_to_string = function
    | `AccessDeniedException _ -> "com.amazonaws.rekognition#AccessDeniedException"
    | `InternalServerError _ -> "com.amazonaws.rekognition#InternalServerError"
    | `InvalidParameterException _ -> "com.amazonaws.rekognition#InvalidParameterException"
    | `LimitExceededException _ -> "com.amazonaws.rekognition#LimitExceededException"
    | `ProvisionedThroughputExceededException _ ->
        "com.amazonaws.rekognition#ProvisionedThroughputExceededException"
    | `ResourceInUseException _ -> "com.amazonaws.rekognition#ResourceInUseException"
    | `ResourceNotFoundException _ -> "com.amazonaws.rekognition#ResourceNotFoundException"
    | `ServiceQuotaExceededException _ -> "com.amazonaws.rekognition#ServiceQuotaExceededException"
    | `ThrottlingException _ -> "com.amazonaws.rekognition#ThrottlingException"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "AccessDeniedException" ->
          `AccessDeniedException (Json_deserializers.access_denied_exception_of_yojson tree path)
      | _, "InternalServerError" ->
          `InternalServerError (Json_deserializers.internal_server_error_of_yojson tree path)
      | _, "InvalidParameterException" ->
          `InvalidParameterException
            (Json_deserializers.invalid_parameter_exception_of_yojson tree path)
      | _, "LimitExceededException" ->
          `LimitExceededException (Json_deserializers.limit_exceeded_exception_of_yojson tree path)
      | _, "ProvisionedThroughputExceededException" ->
          `ProvisionedThroughputExceededException
            (Json_deserializers.provisioned_throughput_exceeded_exception_of_yojson tree path)
      | _, "ResourceInUseException" ->
          `ResourceInUseException (Json_deserializers.resource_in_use_exception_of_yojson tree path)
      | _, "ResourceNotFoundException" ->
          `ResourceNotFoundException
            (Json_deserializers.resource_not_found_exception_of_yojson tree path)
      | _, "ServiceQuotaExceededException" ->
          `ServiceQuotaExceededException
            (Json_deserializers.service_quota_exceeded_exception_of_yojson tree path)
      | _, "ThrottlingException" ->
          `ThrottlingException (Json_deserializers.throttling_exception_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : copy_project_version_request) =
    let input = Json_serializers.copy_project_version_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"RekognitionService.CopyProjectVersion" ~service
      ~context ~input
      ~output_deserializer:Json_deserializers.copy_project_version_response_of_yojson
      ~error_deserializer

  let request_with_metadata context (request : copy_project_version_request) =
    let input = Json_serializers.copy_project_version_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata
      ~shape_name:"RekognitionService.CopyProjectVersion" ~service ~context ~input
      ~output_deserializer:Json_deserializers.copy_project_version_response_of_yojson
      ~error_deserializer
end

module CreateCollection = struct
  let error_to_string = function
    | `AccessDeniedException _ -> "com.amazonaws.rekognition#AccessDeniedException"
    | `InternalServerError _ -> "com.amazonaws.rekognition#InternalServerError"
    | `InvalidParameterException _ -> "com.amazonaws.rekognition#InvalidParameterException"
    | `ProvisionedThroughputExceededException _ ->
        "com.amazonaws.rekognition#ProvisionedThroughputExceededException"
    | `ResourceAlreadyExistsException _ ->
        "com.amazonaws.rekognition#ResourceAlreadyExistsException"
    | `ServiceQuotaExceededException _ -> "com.amazonaws.rekognition#ServiceQuotaExceededException"
    | `ThrottlingException _ -> "com.amazonaws.rekognition#ThrottlingException"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "AccessDeniedException" ->
          `AccessDeniedException (Json_deserializers.access_denied_exception_of_yojson tree path)
      | _, "InternalServerError" ->
          `InternalServerError (Json_deserializers.internal_server_error_of_yojson tree path)
      | _, "InvalidParameterException" ->
          `InvalidParameterException
            (Json_deserializers.invalid_parameter_exception_of_yojson tree path)
      | _, "ProvisionedThroughputExceededException" ->
          `ProvisionedThroughputExceededException
            (Json_deserializers.provisioned_throughput_exceeded_exception_of_yojson tree path)
      | _, "ResourceAlreadyExistsException" ->
          `ResourceAlreadyExistsException
            (Json_deserializers.resource_already_exists_exception_of_yojson tree path)
      | _, "ServiceQuotaExceededException" ->
          `ServiceQuotaExceededException
            (Json_deserializers.service_quota_exceeded_exception_of_yojson tree path)
      | _, "ThrottlingException" ->
          `ThrottlingException (Json_deserializers.throttling_exception_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : create_collection_request) =
    let input = Json_serializers.create_collection_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"RekognitionService.CreateCollection" ~service
      ~context ~input ~output_deserializer:Json_deserializers.create_collection_response_of_yojson
      ~error_deserializer

  let request_with_metadata context (request : create_collection_request) =
    let input = Json_serializers.create_collection_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata
      ~shape_name:"RekognitionService.CreateCollection" ~service ~context ~input
      ~output_deserializer:Json_deserializers.create_collection_response_of_yojson
      ~error_deserializer
end

module CreateDataset = struct
  let error_to_string = function
    | `AccessDeniedException _ -> "com.amazonaws.rekognition#AccessDeniedException"
    | `InternalServerError _ -> "com.amazonaws.rekognition#InternalServerError"
    | `InvalidParameterException _ -> "com.amazonaws.rekognition#InvalidParameterException"
    | `InvalidS3ObjectException _ -> "com.amazonaws.rekognition#InvalidS3ObjectException"
    | `LimitExceededException _ -> "com.amazonaws.rekognition#LimitExceededException"
    | `ProvisionedThroughputExceededException _ ->
        "com.amazonaws.rekognition#ProvisionedThroughputExceededException"
    | `ResourceAlreadyExistsException _ ->
        "com.amazonaws.rekognition#ResourceAlreadyExistsException"
    | `ResourceNotFoundException _ -> "com.amazonaws.rekognition#ResourceNotFoundException"
    | `ThrottlingException _ -> "com.amazonaws.rekognition#ThrottlingException"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "AccessDeniedException" ->
          `AccessDeniedException (Json_deserializers.access_denied_exception_of_yojson tree path)
      | _, "InternalServerError" ->
          `InternalServerError (Json_deserializers.internal_server_error_of_yojson tree path)
      | _, "InvalidParameterException" ->
          `InvalidParameterException
            (Json_deserializers.invalid_parameter_exception_of_yojson tree path)
      | _, "InvalidS3ObjectException" ->
          `InvalidS3ObjectException
            (Json_deserializers.invalid_s3_object_exception_of_yojson tree path)
      | _, "LimitExceededException" ->
          `LimitExceededException (Json_deserializers.limit_exceeded_exception_of_yojson tree path)
      | _, "ProvisionedThroughputExceededException" ->
          `ProvisionedThroughputExceededException
            (Json_deserializers.provisioned_throughput_exceeded_exception_of_yojson tree path)
      | _, "ResourceAlreadyExistsException" ->
          `ResourceAlreadyExistsException
            (Json_deserializers.resource_already_exists_exception_of_yojson tree path)
      | _, "ResourceNotFoundException" ->
          `ResourceNotFoundException
            (Json_deserializers.resource_not_found_exception_of_yojson tree path)
      | _, "ThrottlingException" ->
          `ThrottlingException (Json_deserializers.throttling_exception_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : create_dataset_request) =
    let input = Json_serializers.create_dataset_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"RekognitionService.CreateDataset" ~service
      ~context ~input ~output_deserializer:Json_deserializers.create_dataset_response_of_yojson
      ~error_deserializer

  let request_with_metadata context (request : create_dataset_request) =
    let input = Json_serializers.create_dataset_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata ~shape_name:"RekognitionService.CreateDataset"
      ~service ~context ~input
      ~output_deserializer:Json_deserializers.create_dataset_response_of_yojson ~error_deserializer
end

module CreateFaceLivenessSession = struct
  let error_to_string = function
    | `AccessDeniedException _ -> "com.amazonaws.rekognition#AccessDeniedException"
    | `InternalServerError _ -> "com.amazonaws.rekognition#InternalServerError"
    | `InvalidParameterException _ -> "com.amazonaws.rekognition#InvalidParameterException"
    | `ProvisionedThroughputExceededException _ ->
        "com.amazonaws.rekognition#ProvisionedThroughputExceededException"
    | `ThrottlingException _ -> "com.amazonaws.rekognition#ThrottlingException"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "AccessDeniedException" ->
          `AccessDeniedException (Json_deserializers.access_denied_exception_of_yojson tree path)
      | _, "InternalServerError" ->
          `InternalServerError (Json_deserializers.internal_server_error_of_yojson tree path)
      | _, "InvalidParameterException" ->
          `InvalidParameterException
            (Json_deserializers.invalid_parameter_exception_of_yojson tree path)
      | _, "ProvisionedThroughputExceededException" ->
          `ProvisionedThroughputExceededException
            (Json_deserializers.provisioned_throughput_exceeded_exception_of_yojson tree path)
      | _, "ThrottlingException" ->
          `ThrottlingException (Json_deserializers.throttling_exception_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : create_face_liveness_session_request) =
    let input = Json_serializers.create_face_liveness_session_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"RekognitionService.CreateFaceLivenessSession"
      ~service ~context ~input
      ~output_deserializer:Json_deserializers.create_face_liveness_session_response_of_yojson
      ~error_deserializer

  let request_with_metadata context (request : create_face_liveness_session_request) =
    let input = Json_serializers.create_face_liveness_session_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata
      ~shape_name:"RekognitionService.CreateFaceLivenessSession" ~service ~context ~input
      ~output_deserializer:Json_deserializers.create_face_liveness_session_response_of_yojson
      ~error_deserializer
end

module CreateProject = struct
  let error_to_string = function
    | `AccessDeniedException _ -> "com.amazonaws.rekognition#AccessDeniedException"
    | `InternalServerError _ -> "com.amazonaws.rekognition#InternalServerError"
    | `InvalidParameterException _ -> "com.amazonaws.rekognition#InvalidParameterException"
    | `LimitExceededException _ -> "com.amazonaws.rekognition#LimitExceededException"
    | `ProvisionedThroughputExceededException _ ->
        "com.amazonaws.rekognition#ProvisionedThroughputExceededException"
    | `ResourceInUseException _ -> "com.amazonaws.rekognition#ResourceInUseException"
    | `ThrottlingException _ -> "com.amazonaws.rekognition#ThrottlingException"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "AccessDeniedException" ->
          `AccessDeniedException (Json_deserializers.access_denied_exception_of_yojson tree path)
      | _, "InternalServerError" ->
          `InternalServerError (Json_deserializers.internal_server_error_of_yojson tree path)
      | _, "InvalidParameterException" ->
          `InvalidParameterException
            (Json_deserializers.invalid_parameter_exception_of_yojson tree path)
      | _, "LimitExceededException" ->
          `LimitExceededException (Json_deserializers.limit_exceeded_exception_of_yojson tree path)
      | _, "ProvisionedThroughputExceededException" ->
          `ProvisionedThroughputExceededException
            (Json_deserializers.provisioned_throughput_exceeded_exception_of_yojson tree path)
      | _, "ResourceInUseException" ->
          `ResourceInUseException (Json_deserializers.resource_in_use_exception_of_yojson tree path)
      | _, "ThrottlingException" ->
          `ThrottlingException (Json_deserializers.throttling_exception_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : create_project_request) =
    let input = Json_serializers.create_project_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"RekognitionService.CreateProject" ~service
      ~context ~input ~output_deserializer:Json_deserializers.create_project_response_of_yojson
      ~error_deserializer

  let request_with_metadata context (request : create_project_request) =
    let input = Json_serializers.create_project_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata ~shape_name:"RekognitionService.CreateProject"
      ~service ~context ~input
      ~output_deserializer:Json_deserializers.create_project_response_of_yojson ~error_deserializer
end

module CreateProjectVersion = struct
  let error_to_string = function
    | `AccessDeniedException _ -> "com.amazonaws.rekognition#AccessDeniedException"
    | `InternalServerError _ -> "com.amazonaws.rekognition#InternalServerError"
    | `InvalidParameterException _ -> "com.amazonaws.rekognition#InvalidParameterException"
    | `LimitExceededException _ -> "com.amazonaws.rekognition#LimitExceededException"
    | `ProvisionedThroughputExceededException _ ->
        "com.amazonaws.rekognition#ProvisionedThroughputExceededException"
    | `ResourceInUseException _ -> "com.amazonaws.rekognition#ResourceInUseException"
    | `ResourceNotFoundException _ -> "com.amazonaws.rekognition#ResourceNotFoundException"
    | `ServiceQuotaExceededException _ -> "com.amazonaws.rekognition#ServiceQuotaExceededException"
    | `ThrottlingException _ -> "com.amazonaws.rekognition#ThrottlingException"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "AccessDeniedException" ->
          `AccessDeniedException (Json_deserializers.access_denied_exception_of_yojson tree path)
      | _, "InternalServerError" ->
          `InternalServerError (Json_deserializers.internal_server_error_of_yojson tree path)
      | _, "InvalidParameterException" ->
          `InvalidParameterException
            (Json_deserializers.invalid_parameter_exception_of_yojson tree path)
      | _, "LimitExceededException" ->
          `LimitExceededException (Json_deserializers.limit_exceeded_exception_of_yojson tree path)
      | _, "ProvisionedThroughputExceededException" ->
          `ProvisionedThroughputExceededException
            (Json_deserializers.provisioned_throughput_exceeded_exception_of_yojson tree path)
      | _, "ResourceInUseException" ->
          `ResourceInUseException (Json_deserializers.resource_in_use_exception_of_yojson tree path)
      | _, "ResourceNotFoundException" ->
          `ResourceNotFoundException
            (Json_deserializers.resource_not_found_exception_of_yojson tree path)
      | _, "ServiceQuotaExceededException" ->
          `ServiceQuotaExceededException
            (Json_deserializers.service_quota_exceeded_exception_of_yojson tree path)
      | _, "ThrottlingException" ->
          `ThrottlingException (Json_deserializers.throttling_exception_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : create_project_version_request) =
    let input = Json_serializers.create_project_version_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"RekognitionService.CreateProjectVersion"
      ~service ~context ~input
      ~output_deserializer:Json_deserializers.create_project_version_response_of_yojson
      ~error_deserializer

  let request_with_metadata context (request : create_project_version_request) =
    let input = Json_serializers.create_project_version_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata
      ~shape_name:"RekognitionService.CreateProjectVersion" ~service ~context ~input
      ~output_deserializer:Json_deserializers.create_project_version_response_of_yojson
      ~error_deserializer
end

module CreateStreamProcessor = struct
  let error_to_string = function
    | `AccessDeniedException _ -> "com.amazonaws.rekognition#AccessDeniedException"
    | `InternalServerError _ -> "com.amazonaws.rekognition#InternalServerError"
    | `InvalidParameterException _ -> "com.amazonaws.rekognition#InvalidParameterException"
    | `LimitExceededException _ -> "com.amazonaws.rekognition#LimitExceededException"
    | `ProvisionedThroughputExceededException _ ->
        "com.amazonaws.rekognition#ProvisionedThroughputExceededException"
    | `ResourceInUseException _ -> "com.amazonaws.rekognition#ResourceInUseException"
    | `ServiceQuotaExceededException _ -> "com.amazonaws.rekognition#ServiceQuotaExceededException"
    | `ThrottlingException _ -> "com.amazonaws.rekognition#ThrottlingException"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "AccessDeniedException" ->
          `AccessDeniedException (Json_deserializers.access_denied_exception_of_yojson tree path)
      | _, "InternalServerError" ->
          `InternalServerError (Json_deserializers.internal_server_error_of_yojson tree path)
      | _, "InvalidParameterException" ->
          `InvalidParameterException
            (Json_deserializers.invalid_parameter_exception_of_yojson tree path)
      | _, "LimitExceededException" ->
          `LimitExceededException (Json_deserializers.limit_exceeded_exception_of_yojson tree path)
      | _, "ProvisionedThroughputExceededException" ->
          `ProvisionedThroughputExceededException
            (Json_deserializers.provisioned_throughput_exceeded_exception_of_yojson tree path)
      | _, "ResourceInUseException" ->
          `ResourceInUseException (Json_deserializers.resource_in_use_exception_of_yojson tree path)
      | _, "ServiceQuotaExceededException" ->
          `ServiceQuotaExceededException
            (Json_deserializers.service_quota_exceeded_exception_of_yojson tree path)
      | _, "ThrottlingException" ->
          `ThrottlingException (Json_deserializers.throttling_exception_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : create_stream_processor_request) =
    let input = Json_serializers.create_stream_processor_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"RekognitionService.CreateStreamProcessor"
      ~service ~context ~input
      ~output_deserializer:Json_deserializers.create_stream_processor_response_of_yojson
      ~error_deserializer

  let request_with_metadata context (request : create_stream_processor_request) =
    let input = Json_serializers.create_stream_processor_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata
      ~shape_name:"RekognitionService.CreateStreamProcessor" ~service ~context ~input
      ~output_deserializer:Json_deserializers.create_stream_processor_response_of_yojson
      ~error_deserializer
end

module CreateUser = struct
  let error_to_string = function
    | `AccessDeniedException _ -> "com.amazonaws.rekognition#AccessDeniedException"
    | `ConflictException _ -> "com.amazonaws.rekognition#ConflictException"
    | `IdempotentParameterMismatchException _ ->
        "com.amazonaws.rekognition#IdempotentParameterMismatchException"
    | `InternalServerError _ -> "com.amazonaws.rekognition#InternalServerError"
    | `InvalidParameterException _ -> "com.amazonaws.rekognition#InvalidParameterException"
    | `ProvisionedThroughputExceededException _ ->
        "com.amazonaws.rekognition#ProvisionedThroughputExceededException"
    | `ResourceNotFoundException _ -> "com.amazonaws.rekognition#ResourceNotFoundException"
    | `ServiceQuotaExceededException _ -> "com.amazonaws.rekognition#ServiceQuotaExceededException"
    | `ThrottlingException _ -> "com.amazonaws.rekognition#ThrottlingException"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "AccessDeniedException" ->
          `AccessDeniedException (Json_deserializers.access_denied_exception_of_yojson tree path)
      | _, "ConflictException" ->
          `ConflictException (Json_deserializers.conflict_exception_of_yojson tree path)
      | _, "IdempotentParameterMismatchException" ->
          `IdempotentParameterMismatchException
            (Json_deserializers.idempotent_parameter_mismatch_exception_of_yojson tree path)
      | _, "InternalServerError" ->
          `InternalServerError (Json_deserializers.internal_server_error_of_yojson tree path)
      | _, "InvalidParameterException" ->
          `InvalidParameterException
            (Json_deserializers.invalid_parameter_exception_of_yojson tree path)
      | _, "ProvisionedThroughputExceededException" ->
          `ProvisionedThroughputExceededException
            (Json_deserializers.provisioned_throughput_exceeded_exception_of_yojson tree path)
      | _, "ResourceNotFoundException" ->
          `ResourceNotFoundException
            (Json_deserializers.resource_not_found_exception_of_yojson tree path)
      | _, "ServiceQuotaExceededException" ->
          `ServiceQuotaExceededException
            (Json_deserializers.service_quota_exceeded_exception_of_yojson tree path)
      | _, "ThrottlingException" ->
          `ThrottlingException (Json_deserializers.throttling_exception_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : create_user_request) =
    let input = Json_serializers.create_user_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"RekognitionService.CreateUser" ~service
      ~context ~input ~output_deserializer:Json_deserializers.create_user_response_of_yojson
      ~error_deserializer

  let request_with_metadata context (request : create_user_request) =
    let input = Json_serializers.create_user_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata ~shape_name:"RekognitionService.CreateUser"
      ~service ~context ~input
      ~output_deserializer:Json_deserializers.create_user_response_of_yojson ~error_deserializer
end

module DeleteCollection = struct
  let error_to_string = function
    | `AccessDeniedException _ -> "com.amazonaws.rekognition#AccessDeniedException"
    | `InternalServerError _ -> "com.amazonaws.rekognition#InternalServerError"
    | `InvalidParameterException _ -> "com.amazonaws.rekognition#InvalidParameterException"
    | `ProvisionedThroughputExceededException _ ->
        "com.amazonaws.rekognition#ProvisionedThroughputExceededException"
    | `ResourceNotFoundException _ -> "com.amazonaws.rekognition#ResourceNotFoundException"
    | `ThrottlingException _ -> "com.amazonaws.rekognition#ThrottlingException"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "AccessDeniedException" ->
          `AccessDeniedException (Json_deserializers.access_denied_exception_of_yojson tree path)
      | _, "InternalServerError" ->
          `InternalServerError (Json_deserializers.internal_server_error_of_yojson tree path)
      | _, "InvalidParameterException" ->
          `InvalidParameterException
            (Json_deserializers.invalid_parameter_exception_of_yojson tree path)
      | _, "ProvisionedThroughputExceededException" ->
          `ProvisionedThroughputExceededException
            (Json_deserializers.provisioned_throughput_exceeded_exception_of_yojson tree path)
      | _, "ResourceNotFoundException" ->
          `ResourceNotFoundException
            (Json_deserializers.resource_not_found_exception_of_yojson tree path)
      | _, "ThrottlingException" ->
          `ThrottlingException (Json_deserializers.throttling_exception_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : delete_collection_request) =
    let input = Json_serializers.delete_collection_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"RekognitionService.DeleteCollection" ~service
      ~context ~input ~output_deserializer:Json_deserializers.delete_collection_response_of_yojson
      ~error_deserializer

  let request_with_metadata context (request : delete_collection_request) =
    let input = Json_serializers.delete_collection_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata
      ~shape_name:"RekognitionService.DeleteCollection" ~service ~context ~input
      ~output_deserializer:Json_deserializers.delete_collection_response_of_yojson
      ~error_deserializer
end

module DeleteDataset = struct
  let error_to_string = function
    | `AccessDeniedException _ -> "com.amazonaws.rekognition#AccessDeniedException"
    | `InternalServerError _ -> "com.amazonaws.rekognition#InternalServerError"
    | `InvalidParameterException _ -> "com.amazonaws.rekognition#InvalidParameterException"
    | `LimitExceededException _ -> "com.amazonaws.rekognition#LimitExceededException"
    | `ProvisionedThroughputExceededException _ ->
        "com.amazonaws.rekognition#ProvisionedThroughputExceededException"
    | `ResourceInUseException _ -> "com.amazonaws.rekognition#ResourceInUseException"
    | `ResourceNotFoundException _ -> "com.amazonaws.rekognition#ResourceNotFoundException"
    | `ThrottlingException _ -> "com.amazonaws.rekognition#ThrottlingException"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "AccessDeniedException" ->
          `AccessDeniedException (Json_deserializers.access_denied_exception_of_yojson tree path)
      | _, "InternalServerError" ->
          `InternalServerError (Json_deserializers.internal_server_error_of_yojson tree path)
      | _, "InvalidParameterException" ->
          `InvalidParameterException
            (Json_deserializers.invalid_parameter_exception_of_yojson tree path)
      | _, "LimitExceededException" ->
          `LimitExceededException (Json_deserializers.limit_exceeded_exception_of_yojson tree path)
      | _, "ProvisionedThroughputExceededException" ->
          `ProvisionedThroughputExceededException
            (Json_deserializers.provisioned_throughput_exceeded_exception_of_yojson tree path)
      | _, "ResourceInUseException" ->
          `ResourceInUseException (Json_deserializers.resource_in_use_exception_of_yojson tree path)
      | _, "ResourceNotFoundException" ->
          `ResourceNotFoundException
            (Json_deserializers.resource_not_found_exception_of_yojson tree path)
      | _, "ThrottlingException" ->
          `ThrottlingException (Json_deserializers.throttling_exception_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : delete_dataset_request) =
    let input = Json_serializers.delete_dataset_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"RekognitionService.DeleteDataset" ~service
      ~context ~input ~output_deserializer:Json_deserializers.delete_dataset_response_of_yojson
      ~error_deserializer

  let request_with_metadata context (request : delete_dataset_request) =
    let input = Json_serializers.delete_dataset_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata ~shape_name:"RekognitionService.DeleteDataset"
      ~service ~context ~input
      ~output_deserializer:Json_deserializers.delete_dataset_response_of_yojson ~error_deserializer
end

module DeleteFaces = struct
  let error_to_string = function
    | `AccessDeniedException _ -> "com.amazonaws.rekognition#AccessDeniedException"
    | `InternalServerError _ -> "com.amazonaws.rekognition#InternalServerError"
    | `InvalidParameterException _ -> "com.amazonaws.rekognition#InvalidParameterException"
    | `ProvisionedThroughputExceededException _ ->
        "com.amazonaws.rekognition#ProvisionedThroughputExceededException"
    | `ResourceNotFoundException _ -> "com.amazonaws.rekognition#ResourceNotFoundException"
    | `ThrottlingException _ -> "com.amazonaws.rekognition#ThrottlingException"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "AccessDeniedException" ->
          `AccessDeniedException (Json_deserializers.access_denied_exception_of_yojson tree path)
      | _, "InternalServerError" ->
          `InternalServerError (Json_deserializers.internal_server_error_of_yojson tree path)
      | _, "InvalidParameterException" ->
          `InvalidParameterException
            (Json_deserializers.invalid_parameter_exception_of_yojson tree path)
      | _, "ProvisionedThroughputExceededException" ->
          `ProvisionedThroughputExceededException
            (Json_deserializers.provisioned_throughput_exceeded_exception_of_yojson tree path)
      | _, "ResourceNotFoundException" ->
          `ResourceNotFoundException
            (Json_deserializers.resource_not_found_exception_of_yojson tree path)
      | _, "ThrottlingException" ->
          `ThrottlingException (Json_deserializers.throttling_exception_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : delete_faces_request) =
    let input = Json_serializers.delete_faces_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"RekognitionService.DeleteFaces" ~service
      ~context ~input ~output_deserializer:Json_deserializers.delete_faces_response_of_yojson
      ~error_deserializer

  let request_with_metadata context (request : delete_faces_request) =
    let input = Json_serializers.delete_faces_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata ~shape_name:"RekognitionService.DeleteFaces"
      ~service ~context ~input
      ~output_deserializer:Json_deserializers.delete_faces_response_of_yojson ~error_deserializer
end

module DeleteProject = struct
  let error_to_string = function
    | `AccessDeniedException _ -> "com.amazonaws.rekognition#AccessDeniedException"
    | `InternalServerError _ -> "com.amazonaws.rekognition#InternalServerError"
    | `InvalidParameterException _ -> "com.amazonaws.rekognition#InvalidParameterException"
    | `ProvisionedThroughputExceededException _ ->
        "com.amazonaws.rekognition#ProvisionedThroughputExceededException"
    | `ResourceInUseException _ -> "com.amazonaws.rekognition#ResourceInUseException"
    | `ResourceNotFoundException _ -> "com.amazonaws.rekognition#ResourceNotFoundException"
    | `ThrottlingException _ -> "com.amazonaws.rekognition#ThrottlingException"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "AccessDeniedException" ->
          `AccessDeniedException (Json_deserializers.access_denied_exception_of_yojson tree path)
      | _, "InternalServerError" ->
          `InternalServerError (Json_deserializers.internal_server_error_of_yojson tree path)
      | _, "InvalidParameterException" ->
          `InvalidParameterException
            (Json_deserializers.invalid_parameter_exception_of_yojson tree path)
      | _, "ProvisionedThroughputExceededException" ->
          `ProvisionedThroughputExceededException
            (Json_deserializers.provisioned_throughput_exceeded_exception_of_yojson tree path)
      | _, "ResourceInUseException" ->
          `ResourceInUseException (Json_deserializers.resource_in_use_exception_of_yojson tree path)
      | _, "ResourceNotFoundException" ->
          `ResourceNotFoundException
            (Json_deserializers.resource_not_found_exception_of_yojson tree path)
      | _, "ThrottlingException" ->
          `ThrottlingException (Json_deserializers.throttling_exception_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : delete_project_request) =
    let input = Json_serializers.delete_project_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"RekognitionService.DeleteProject" ~service
      ~context ~input ~output_deserializer:Json_deserializers.delete_project_response_of_yojson
      ~error_deserializer

  let request_with_metadata context (request : delete_project_request) =
    let input = Json_serializers.delete_project_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata ~shape_name:"RekognitionService.DeleteProject"
      ~service ~context ~input
      ~output_deserializer:Json_deserializers.delete_project_response_of_yojson ~error_deserializer
end

module DeleteProjectPolicy = struct
  let error_to_string = function
    | `AccessDeniedException _ -> "com.amazonaws.rekognition#AccessDeniedException"
    | `InternalServerError _ -> "com.amazonaws.rekognition#InternalServerError"
    | `InvalidParameterException _ -> "com.amazonaws.rekognition#InvalidParameterException"
    | `InvalidPolicyRevisionIdException _ ->
        "com.amazonaws.rekognition#InvalidPolicyRevisionIdException"
    | `ProvisionedThroughputExceededException _ ->
        "com.amazonaws.rekognition#ProvisionedThroughputExceededException"
    | `ResourceNotFoundException _ -> "com.amazonaws.rekognition#ResourceNotFoundException"
    | `ThrottlingException _ -> "com.amazonaws.rekognition#ThrottlingException"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "AccessDeniedException" ->
          `AccessDeniedException (Json_deserializers.access_denied_exception_of_yojson tree path)
      | _, "InternalServerError" ->
          `InternalServerError (Json_deserializers.internal_server_error_of_yojson tree path)
      | _, "InvalidParameterException" ->
          `InvalidParameterException
            (Json_deserializers.invalid_parameter_exception_of_yojson tree path)
      | _, "InvalidPolicyRevisionIdException" ->
          `InvalidPolicyRevisionIdException
            (Json_deserializers.invalid_policy_revision_id_exception_of_yojson tree path)
      | _, "ProvisionedThroughputExceededException" ->
          `ProvisionedThroughputExceededException
            (Json_deserializers.provisioned_throughput_exceeded_exception_of_yojson tree path)
      | _, "ResourceNotFoundException" ->
          `ResourceNotFoundException
            (Json_deserializers.resource_not_found_exception_of_yojson tree path)
      | _, "ThrottlingException" ->
          `ThrottlingException (Json_deserializers.throttling_exception_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : delete_project_policy_request) =
    let input = Json_serializers.delete_project_policy_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"RekognitionService.DeleteProjectPolicy"
      ~service ~context ~input
      ~output_deserializer:Json_deserializers.delete_project_policy_response_of_yojson
      ~error_deserializer

  let request_with_metadata context (request : delete_project_policy_request) =
    let input = Json_serializers.delete_project_policy_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata
      ~shape_name:"RekognitionService.DeleteProjectPolicy" ~service ~context ~input
      ~output_deserializer:Json_deserializers.delete_project_policy_response_of_yojson
      ~error_deserializer
end

module DeleteProjectVersion = struct
  let error_to_string = function
    | `AccessDeniedException _ -> "com.amazonaws.rekognition#AccessDeniedException"
    | `InternalServerError _ -> "com.amazonaws.rekognition#InternalServerError"
    | `InvalidParameterException _ -> "com.amazonaws.rekognition#InvalidParameterException"
    | `ProvisionedThroughputExceededException _ ->
        "com.amazonaws.rekognition#ProvisionedThroughputExceededException"
    | `ResourceInUseException _ -> "com.amazonaws.rekognition#ResourceInUseException"
    | `ResourceNotFoundException _ -> "com.amazonaws.rekognition#ResourceNotFoundException"
    | `ThrottlingException _ -> "com.amazonaws.rekognition#ThrottlingException"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "AccessDeniedException" ->
          `AccessDeniedException (Json_deserializers.access_denied_exception_of_yojson tree path)
      | _, "InternalServerError" ->
          `InternalServerError (Json_deserializers.internal_server_error_of_yojson tree path)
      | _, "InvalidParameterException" ->
          `InvalidParameterException
            (Json_deserializers.invalid_parameter_exception_of_yojson tree path)
      | _, "ProvisionedThroughputExceededException" ->
          `ProvisionedThroughputExceededException
            (Json_deserializers.provisioned_throughput_exceeded_exception_of_yojson tree path)
      | _, "ResourceInUseException" ->
          `ResourceInUseException (Json_deserializers.resource_in_use_exception_of_yojson tree path)
      | _, "ResourceNotFoundException" ->
          `ResourceNotFoundException
            (Json_deserializers.resource_not_found_exception_of_yojson tree path)
      | _, "ThrottlingException" ->
          `ThrottlingException (Json_deserializers.throttling_exception_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : delete_project_version_request) =
    let input = Json_serializers.delete_project_version_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"RekognitionService.DeleteProjectVersion"
      ~service ~context ~input
      ~output_deserializer:Json_deserializers.delete_project_version_response_of_yojson
      ~error_deserializer

  let request_with_metadata context (request : delete_project_version_request) =
    let input = Json_serializers.delete_project_version_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata
      ~shape_name:"RekognitionService.DeleteProjectVersion" ~service ~context ~input
      ~output_deserializer:Json_deserializers.delete_project_version_response_of_yojson
      ~error_deserializer
end

module DeleteStreamProcessor = struct
  let error_to_string = function
    | `AccessDeniedException _ -> "com.amazonaws.rekognition#AccessDeniedException"
    | `InternalServerError _ -> "com.amazonaws.rekognition#InternalServerError"
    | `InvalidParameterException _ -> "com.amazonaws.rekognition#InvalidParameterException"
    | `ProvisionedThroughputExceededException _ ->
        "com.amazonaws.rekognition#ProvisionedThroughputExceededException"
    | `ResourceInUseException _ -> "com.amazonaws.rekognition#ResourceInUseException"
    | `ResourceNotFoundException _ -> "com.amazonaws.rekognition#ResourceNotFoundException"
    | `ThrottlingException _ -> "com.amazonaws.rekognition#ThrottlingException"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "AccessDeniedException" ->
          `AccessDeniedException (Json_deserializers.access_denied_exception_of_yojson tree path)
      | _, "InternalServerError" ->
          `InternalServerError (Json_deserializers.internal_server_error_of_yojson tree path)
      | _, "InvalidParameterException" ->
          `InvalidParameterException
            (Json_deserializers.invalid_parameter_exception_of_yojson tree path)
      | _, "ProvisionedThroughputExceededException" ->
          `ProvisionedThroughputExceededException
            (Json_deserializers.provisioned_throughput_exceeded_exception_of_yojson tree path)
      | _, "ResourceInUseException" ->
          `ResourceInUseException (Json_deserializers.resource_in_use_exception_of_yojson tree path)
      | _, "ResourceNotFoundException" ->
          `ResourceNotFoundException
            (Json_deserializers.resource_not_found_exception_of_yojson tree path)
      | _, "ThrottlingException" ->
          `ThrottlingException (Json_deserializers.throttling_exception_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : delete_stream_processor_request) =
    let input = Json_serializers.delete_stream_processor_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"RekognitionService.DeleteStreamProcessor"
      ~service ~context ~input
      ~output_deserializer:Json_deserializers.delete_stream_processor_response_of_yojson
      ~error_deserializer

  let request_with_metadata context (request : delete_stream_processor_request) =
    let input = Json_serializers.delete_stream_processor_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata
      ~shape_name:"RekognitionService.DeleteStreamProcessor" ~service ~context ~input
      ~output_deserializer:Json_deserializers.delete_stream_processor_response_of_yojson
      ~error_deserializer
end

module DeleteUser = struct
  let error_to_string = function
    | `AccessDeniedException _ -> "com.amazonaws.rekognition#AccessDeniedException"
    | `ConflictException _ -> "com.amazonaws.rekognition#ConflictException"
    | `IdempotentParameterMismatchException _ ->
        "com.amazonaws.rekognition#IdempotentParameterMismatchException"
    | `InternalServerError _ -> "com.amazonaws.rekognition#InternalServerError"
    | `InvalidParameterException _ -> "com.amazonaws.rekognition#InvalidParameterException"
    | `ProvisionedThroughputExceededException _ ->
        "com.amazonaws.rekognition#ProvisionedThroughputExceededException"
    | `ResourceNotFoundException _ -> "com.amazonaws.rekognition#ResourceNotFoundException"
    | `ThrottlingException _ -> "com.amazonaws.rekognition#ThrottlingException"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "AccessDeniedException" ->
          `AccessDeniedException (Json_deserializers.access_denied_exception_of_yojson tree path)
      | _, "ConflictException" ->
          `ConflictException (Json_deserializers.conflict_exception_of_yojson tree path)
      | _, "IdempotentParameterMismatchException" ->
          `IdempotentParameterMismatchException
            (Json_deserializers.idempotent_parameter_mismatch_exception_of_yojson tree path)
      | _, "InternalServerError" ->
          `InternalServerError (Json_deserializers.internal_server_error_of_yojson tree path)
      | _, "InvalidParameterException" ->
          `InvalidParameterException
            (Json_deserializers.invalid_parameter_exception_of_yojson tree path)
      | _, "ProvisionedThroughputExceededException" ->
          `ProvisionedThroughputExceededException
            (Json_deserializers.provisioned_throughput_exceeded_exception_of_yojson tree path)
      | _, "ResourceNotFoundException" ->
          `ResourceNotFoundException
            (Json_deserializers.resource_not_found_exception_of_yojson tree path)
      | _, "ThrottlingException" ->
          `ThrottlingException (Json_deserializers.throttling_exception_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : delete_user_request) =
    let input = Json_serializers.delete_user_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"RekognitionService.DeleteUser" ~service
      ~context ~input ~output_deserializer:Json_deserializers.delete_user_response_of_yojson
      ~error_deserializer

  let request_with_metadata context (request : delete_user_request) =
    let input = Json_serializers.delete_user_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata ~shape_name:"RekognitionService.DeleteUser"
      ~service ~context ~input
      ~output_deserializer:Json_deserializers.delete_user_response_of_yojson ~error_deserializer
end

module DescribeCollection = struct
  let error_to_string = function
    | `AccessDeniedException _ -> "com.amazonaws.rekognition#AccessDeniedException"
    | `InternalServerError _ -> "com.amazonaws.rekognition#InternalServerError"
    | `InvalidParameterException _ -> "com.amazonaws.rekognition#InvalidParameterException"
    | `ProvisionedThroughputExceededException _ ->
        "com.amazonaws.rekognition#ProvisionedThroughputExceededException"
    | `ResourceNotFoundException _ -> "com.amazonaws.rekognition#ResourceNotFoundException"
    | `ThrottlingException _ -> "com.amazonaws.rekognition#ThrottlingException"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "AccessDeniedException" ->
          `AccessDeniedException (Json_deserializers.access_denied_exception_of_yojson tree path)
      | _, "InternalServerError" ->
          `InternalServerError (Json_deserializers.internal_server_error_of_yojson tree path)
      | _, "InvalidParameterException" ->
          `InvalidParameterException
            (Json_deserializers.invalid_parameter_exception_of_yojson tree path)
      | _, "ProvisionedThroughputExceededException" ->
          `ProvisionedThroughputExceededException
            (Json_deserializers.provisioned_throughput_exceeded_exception_of_yojson tree path)
      | _, "ResourceNotFoundException" ->
          `ResourceNotFoundException
            (Json_deserializers.resource_not_found_exception_of_yojson tree path)
      | _, "ThrottlingException" ->
          `ThrottlingException (Json_deserializers.throttling_exception_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : describe_collection_request) =
    let input = Json_serializers.describe_collection_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"RekognitionService.DescribeCollection" ~service
      ~context ~input ~output_deserializer:Json_deserializers.describe_collection_response_of_yojson
      ~error_deserializer

  let request_with_metadata context (request : describe_collection_request) =
    let input = Json_serializers.describe_collection_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata
      ~shape_name:"RekognitionService.DescribeCollection" ~service ~context ~input
      ~output_deserializer:Json_deserializers.describe_collection_response_of_yojson
      ~error_deserializer
end

module DescribeDataset = struct
  let error_to_string = function
    | `AccessDeniedException _ -> "com.amazonaws.rekognition#AccessDeniedException"
    | `InternalServerError _ -> "com.amazonaws.rekognition#InternalServerError"
    | `InvalidParameterException _ -> "com.amazonaws.rekognition#InvalidParameterException"
    | `ProvisionedThroughputExceededException _ ->
        "com.amazonaws.rekognition#ProvisionedThroughputExceededException"
    | `ResourceNotFoundException _ -> "com.amazonaws.rekognition#ResourceNotFoundException"
    | `ThrottlingException _ -> "com.amazonaws.rekognition#ThrottlingException"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "AccessDeniedException" ->
          `AccessDeniedException (Json_deserializers.access_denied_exception_of_yojson tree path)
      | _, "InternalServerError" ->
          `InternalServerError (Json_deserializers.internal_server_error_of_yojson tree path)
      | _, "InvalidParameterException" ->
          `InvalidParameterException
            (Json_deserializers.invalid_parameter_exception_of_yojson tree path)
      | _, "ProvisionedThroughputExceededException" ->
          `ProvisionedThroughputExceededException
            (Json_deserializers.provisioned_throughput_exceeded_exception_of_yojson tree path)
      | _, "ResourceNotFoundException" ->
          `ResourceNotFoundException
            (Json_deserializers.resource_not_found_exception_of_yojson tree path)
      | _, "ThrottlingException" ->
          `ThrottlingException (Json_deserializers.throttling_exception_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : describe_dataset_request) =
    let input = Json_serializers.describe_dataset_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"RekognitionService.DescribeDataset" ~service
      ~context ~input ~output_deserializer:Json_deserializers.describe_dataset_response_of_yojson
      ~error_deserializer

  let request_with_metadata context (request : describe_dataset_request) =
    let input = Json_serializers.describe_dataset_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata
      ~shape_name:"RekognitionService.DescribeDataset" ~service ~context ~input
      ~output_deserializer:Json_deserializers.describe_dataset_response_of_yojson
      ~error_deserializer
end

module DescribeProjects = struct
  let error_to_string = function
    | `AccessDeniedException _ -> "com.amazonaws.rekognition#AccessDeniedException"
    | `InternalServerError _ -> "com.amazonaws.rekognition#InternalServerError"
    | `InvalidPaginationTokenException _ ->
        "com.amazonaws.rekognition#InvalidPaginationTokenException"
    | `InvalidParameterException _ -> "com.amazonaws.rekognition#InvalidParameterException"
    | `ProvisionedThroughputExceededException _ ->
        "com.amazonaws.rekognition#ProvisionedThroughputExceededException"
    | `ThrottlingException _ -> "com.amazonaws.rekognition#ThrottlingException"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "AccessDeniedException" ->
          `AccessDeniedException (Json_deserializers.access_denied_exception_of_yojson tree path)
      | _, "InternalServerError" ->
          `InternalServerError (Json_deserializers.internal_server_error_of_yojson tree path)
      | _, "InvalidPaginationTokenException" ->
          `InvalidPaginationTokenException
            (Json_deserializers.invalid_pagination_token_exception_of_yojson tree path)
      | _, "InvalidParameterException" ->
          `InvalidParameterException
            (Json_deserializers.invalid_parameter_exception_of_yojson tree path)
      | _, "ProvisionedThroughputExceededException" ->
          `ProvisionedThroughputExceededException
            (Json_deserializers.provisioned_throughput_exceeded_exception_of_yojson tree path)
      | _, "ThrottlingException" ->
          `ThrottlingException (Json_deserializers.throttling_exception_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : describe_projects_request) =
    let input = Json_serializers.describe_projects_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"RekognitionService.DescribeProjects" ~service
      ~context ~input ~output_deserializer:Json_deserializers.describe_projects_response_of_yojson
      ~error_deserializer

  let request_with_metadata context (request : describe_projects_request) =
    let input = Json_serializers.describe_projects_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata
      ~shape_name:"RekognitionService.DescribeProjects" ~service ~context ~input
      ~output_deserializer:Json_deserializers.describe_projects_response_of_yojson
      ~error_deserializer
end

module DescribeProjectVersions = struct
  let error_to_string = function
    | `AccessDeniedException _ -> "com.amazonaws.rekognition#AccessDeniedException"
    | `InternalServerError _ -> "com.amazonaws.rekognition#InternalServerError"
    | `InvalidPaginationTokenException _ ->
        "com.amazonaws.rekognition#InvalidPaginationTokenException"
    | `InvalidParameterException _ -> "com.amazonaws.rekognition#InvalidParameterException"
    | `ProvisionedThroughputExceededException _ ->
        "com.amazonaws.rekognition#ProvisionedThroughputExceededException"
    | `ResourceNotFoundException _ -> "com.amazonaws.rekognition#ResourceNotFoundException"
    | `ThrottlingException _ -> "com.amazonaws.rekognition#ThrottlingException"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "AccessDeniedException" ->
          `AccessDeniedException (Json_deserializers.access_denied_exception_of_yojson tree path)
      | _, "InternalServerError" ->
          `InternalServerError (Json_deserializers.internal_server_error_of_yojson tree path)
      | _, "InvalidPaginationTokenException" ->
          `InvalidPaginationTokenException
            (Json_deserializers.invalid_pagination_token_exception_of_yojson tree path)
      | _, "InvalidParameterException" ->
          `InvalidParameterException
            (Json_deserializers.invalid_parameter_exception_of_yojson tree path)
      | _, "ProvisionedThroughputExceededException" ->
          `ProvisionedThroughputExceededException
            (Json_deserializers.provisioned_throughput_exceeded_exception_of_yojson tree path)
      | _, "ResourceNotFoundException" ->
          `ResourceNotFoundException
            (Json_deserializers.resource_not_found_exception_of_yojson tree path)
      | _, "ThrottlingException" ->
          `ThrottlingException (Json_deserializers.throttling_exception_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : describe_project_versions_request) =
    let input = Json_serializers.describe_project_versions_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"RekognitionService.DescribeProjectVersions"
      ~service ~context ~input
      ~output_deserializer:Json_deserializers.describe_project_versions_response_of_yojson
      ~error_deserializer

  let request_with_metadata context (request : describe_project_versions_request) =
    let input = Json_serializers.describe_project_versions_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata
      ~shape_name:"RekognitionService.DescribeProjectVersions" ~service ~context ~input
      ~output_deserializer:Json_deserializers.describe_project_versions_response_of_yojson
      ~error_deserializer
end

module DescribeStreamProcessor = struct
  let error_to_string = function
    | `AccessDeniedException _ -> "com.amazonaws.rekognition#AccessDeniedException"
    | `InternalServerError _ -> "com.amazonaws.rekognition#InternalServerError"
    | `InvalidParameterException _ -> "com.amazonaws.rekognition#InvalidParameterException"
    | `ProvisionedThroughputExceededException _ ->
        "com.amazonaws.rekognition#ProvisionedThroughputExceededException"
    | `ResourceNotFoundException _ -> "com.amazonaws.rekognition#ResourceNotFoundException"
    | `ThrottlingException _ -> "com.amazonaws.rekognition#ThrottlingException"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "AccessDeniedException" ->
          `AccessDeniedException (Json_deserializers.access_denied_exception_of_yojson tree path)
      | _, "InternalServerError" ->
          `InternalServerError (Json_deserializers.internal_server_error_of_yojson tree path)
      | _, "InvalidParameterException" ->
          `InvalidParameterException
            (Json_deserializers.invalid_parameter_exception_of_yojson tree path)
      | _, "ProvisionedThroughputExceededException" ->
          `ProvisionedThroughputExceededException
            (Json_deserializers.provisioned_throughput_exceeded_exception_of_yojson tree path)
      | _, "ResourceNotFoundException" ->
          `ResourceNotFoundException
            (Json_deserializers.resource_not_found_exception_of_yojson tree path)
      | _, "ThrottlingException" ->
          `ThrottlingException (Json_deserializers.throttling_exception_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : describe_stream_processor_request) =
    let input = Json_serializers.describe_stream_processor_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"RekognitionService.DescribeStreamProcessor"
      ~service ~context ~input
      ~output_deserializer:Json_deserializers.describe_stream_processor_response_of_yojson
      ~error_deserializer

  let request_with_metadata context (request : describe_stream_processor_request) =
    let input = Json_serializers.describe_stream_processor_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata
      ~shape_name:"RekognitionService.DescribeStreamProcessor" ~service ~context ~input
      ~output_deserializer:Json_deserializers.describe_stream_processor_response_of_yojson
      ~error_deserializer
end

module DetectCustomLabels = struct
  let error_to_string = function
    | `AccessDeniedException _ -> "com.amazonaws.rekognition#AccessDeniedException"
    | `ImageTooLargeException _ -> "com.amazonaws.rekognition#ImageTooLargeException"
    | `InternalServerError _ -> "com.amazonaws.rekognition#InternalServerError"
    | `InvalidImageFormatException _ -> "com.amazonaws.rekognition#InvalidImageFormatException"
    | `InvalidParameterException _ -> "com.amazonaws.rekognition#InvalidParameterException"
    | `InvalidS3ObjectException _ -> "com.amazonaws.rekognition#InvalidS3ObjectException"
    | `LimitExceededException _ -> "com.amazonaws.rekognition#LimitExceededException"
    | `ProvisionedThroughputExceededException _ ->
        "com.amazonaws.rekognition#ProvisionedThroughputExceededException"
    | `ResourceNotFoundException _ -> "com.amazonaws.rekognition#ResourceNotFoundException"
    | `ResourceNotReadyException _ -> "com.amazonaws.rekognition#ResourceNotReadyException"
    | `ThrottlingException _ -> "com.amazonaws.rekognition#ThrottlingException"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "AccessDeniedException" ->
          `AccessDeniedException (Json_deserializers.access_denied_exception_of_yojson tree path)
      | _, "ImageTooLargeException" ->
          `ImageTooLargeException (Json_deserializers.image_too_large_exception_of_yojson tree path)
      | _, "InternalServerError" ->
          `InternalServerError (Json_deserializers.internal_server_error_of_yojson tree path)
      | _, "InvalidImageFormatException" ->
          `InvalidImageFormatException
            (Json_deserializers.invalid_image_format_exception_of_yojson tree path)
      | _, "InvalidParameterException" ->
          `InvalidParameterException
            (Json_deserializers.invalid_parameter_exception_of_yojson tree path)
      | _, "InvalidS3ObjectException" ->
          `InvalidS3ObjectException
            (Json_deserializers.invalid_s3_object_exception_of_yojson tree path)
      | _, "LimitExceededException" ->
          `LimitExceededException (Json_deserializers.limit_exceeded_exception_of_yojson tree path)
      | _, "ProvisionedThroughputExceededException" ->
          `ProvisionedThroughputExceededException
            (Json_deserializers.provisioned_throughput_exceeded_exception_of_yojson tree path)
      | _, "ResourceNotFoundException" ->
          `ResourceNotFoundException
            (Json_deserializers.resource_not_found_exception_of_yojson tree path)
      | _, "ResourceNotReadyException" ->
          `ResourceNotReadyException
            (Json_deserializers.resource_not_ready_exception_of_yojson tree path)
      | _, "ThrottlingException" ->
          `ThrottlingException (Json_deserializers.throttling_exception_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : detect_custom_labels_request) =
    let input = Json_serializers.detect_custom_labels_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"RekognitionService.DetectCustomLabels" ~service
      ~context ~input
      ~output_deserializer:Json_deserializers.detect_custom_labels_response_of_yojson
      ~error_deserializer

  let request_with_metadata context (request : detect_custom_labels_request) =
    let input = Json_serializers.detect_custom_labels_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata
      ~shape_name:"RekognitionService.DetectCustomLabels" ~service ~context ~input
      ~output_deserializer:Json_deserializers.detect_custom_labels_response_of_yojson
      ~error_deserializer
end

module DetectFaces = struct
  let error_to_string = function
    | `AccessDeniedException _ -> "com.amazonaws.rekognition#AccessDeniedException"
    | `ImageTooLargeException _ -> "com.amazonaws.rekognition#ImageTooLargeException"
    | `InternalServerError _ -> "com.amazonaws.rekognition#InternalServerError"
    | `InvalidImageFormatException _ -> "com.amazonaws.rekognition#InvalidImageFormatException"
    | `InvalidParameterException _ -> "com.amazonaws.rekognition#InvalidParameterException"
    | `InvalidS3ObjectException _ -> "com.amazonaws.rekognition#InvalidS3ObjectException"
    | `ProvisionedThroughputExceededException _ ->
        "com.amazonaws.rekognition#ProvisionedThroughputExceededException"
    | `ThrottlingException _ -> "com.amazonaws.rekognition#ThrottlingException"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "AccessDeniedException" ->
          `AccessDeniedException (Json_deserializers.access_denied_exception_of_yojson tree path)
      | _, "ImageTooLargeException" ->
          `ImageTooLargeException (Json_deserializers.image_too_large_exception_of_yojson tree path)
      | _, "InternalServerError" ->
          `InternalServerError (Json_deserializers.internal_server_error_of_yojson tree path)
      | _, "InvalidImageFormatException" ->
          `InvalidImageFormatException
            (Json_deserializers.invalid_image_format_exception_of_yojson tree path)
      | _, "InvalidParameterException" ->
          `InvalidParameterException
            (Json_deserializers.invalid_parameter_exception_of_yojson tree path)
      | _, "InvalidS3ObjectException" ->
          `InvalidS3ObjectException
            (Json_deserializers.invalid_s3_object_exception_of_yojson tree path)
      | _, "ProvisionedThroughputExceededException" ->
          `ProvisionedThroughputExceededException
            (Json_deserializers.provisioned_throughput_exceeded_exception_of_yojson tree path)
      | _, "ThrottlingException" ->
          `ThrottlingException (Json_deserializers.throttling_exception_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : detect_faces_request) =
    let input = Json_serializers.detect_faces_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"RekognitionService.DetectFaces" ~service
      ~context ~input ~output_deserializer:Json_deserializers.detect_faces_response_of_yojson
      ~error_deserializer

  let request_with_metadata context (request : detect_faces_request) =
    let input = Json_serializers.detect_faces_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata ~shape_name:"RekognitionService.DetectFaces"
      ~service ~context ~input
      ~output_deserializer:Json_deserializers.detect_faces_response_of_yojson ~error_deserializer
end

module DetectLabels = struct
  let error_to_string = function
    | `AccessDeniedException _ -> "com.amazonaws.rekognition#AccessDeniedException"
    | `ImageTooLargeException _ -> "com.amazonaws.rekognition#ImageTooLargeException"
    | `InternalServerError _ -> "com.amazonaws.rekognition#InternalServerError"
    | `InvalidImageFormatException _ -> "com.amazonaws.rekognition#InvalidImageFormatException"
    | `InvalidParameterException _ -> "com.amazonaws.rekognition#InvalidParameterException"
    | `InvalidS3ObjectException _ -> "com.amazonaws.rekognition#InvalidS3ObjectException"
    | `ProvisionedThroughputExceededException _ ->
        "com.amazonaws.rekognition#ProvisionedThroughputExceededException"
    | `ThrottlingException _ -> "com.amazonaws.rekognition#ThrottlingException"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "AccessDeniedException" ->
          `AccessDeniedException (Json_deserializers.access_denied_exception_of_yojson tree path)
      | _, "ImageTooLargeException" ->
          `ImageTooLargeException (Json_deserializers.image_too_large_exception_of_yojson tree path)
      | _, "InternalServerError" ->
          `InternalServerError (Json_deserializers.internal_server_error_of_yojson tree path)
      | _, "InvalidImageFormatException" ->
          `InvalidImageFormatException
            (Json_deserializers.invalid_image_format_exception_of_yojson tree path)
      | _, "InvalidParameterException" ->
          `InvalidParameterException
            (Json_deserializers.invalid_parameter_exception_of_yojson tree path)
      | _, "InvalidS3ObjectException" ->
          `InvalidS3ObjectException
            (Json_deserializers.invalid_s3_object_exception_of_yojson tree path)
      | _, "ProvisionedThroughputExceededException" ->
          `ProvisionedThroughputExceededException
            (Json_deserializers.provisioned_throughput_exceeded_exception_of_yojson tree path)
      | _, "ThrottlingException" ->
          `ThrottlingException (Json_deserializers.throttling_exception_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : detect_labels_request) =
    let input = Json_serializers.detect_labels_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"RekognitionService.DetectLabels" ~service
      ~context ~input ~output_deserializer:Json_deserializers.detect_labels_response_of_yojson
      ~error_deserializer

  let request_with_metadata context (request : detect_labels_request) =
    let input = Json_serializers.detect_labels_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata ~shape_name:"RekognitionService.DetectLabels"
      ~service ~context ~input
      ~output_deserializer:Json_deserializers.detect_labels_response_of_yojson ~error_deserializer
end

module DetectModerationLabels = struct
  let error_to_string = function
    | `AccessDeniedException _ -> "com.amazonaws.rekognition#AccessDeniedException"
    | `HumanLoopQuotaExceededException _ ->
        "com.amazonaws.rekognition#HumanLoopQuotaExceededException"
    | `ImageTooLargeException _ -> "com.amazonaws.rekognition#ImageTooLargeException"
    | `InternalServerError _ -> "com.amazonaws.rekognition#InternalServerError"
    | `InvalidImageFormatException _ -> "com.amazonaws.rekognition#InvalidImageFormatException"
    | `InvalidParameterException _ -> "com.amazonaws.rekognition#InvalidParameterException"
    | `InvalidS3ObjectException _ -> "com.amazonaws.rekognition#InvalidS3ObjectException"
    | `ProvisionedThroughputExceededException _ ->
        "com.amazonaws.rekognition#ProvisionedThroughputExceededException"
    | `ResourceNotFoundException _ -> "com.amazonaws.rekognition#ResourceNotFoundException"
    | `ResourceNotReadyException _ -> "com.amazonaws.rekognition#ResourceNotReadyException"
    | `ThrottlingException _ -> "com.amazonaws.rekognition#ThrottlingException"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "AccessDeniedException" ->
          `AccessDeniedException (Json_deserializers.access_denied_exception_of_yojson tree path)
      | _, "HumanLoopQuotaExceededException" ->
          `HumanLoopQuotaExceededException
            (Json_deserializers.human_loop_quota_exceeded_exception_of_yojson tree path)
      | _, "ImageTooLargeException" ->
          `ImageTooLargeException (Json_deserializers.image_too_large_exception_of_yojson tree path)
      | _, "InternalServerError" ->
          `InternalServerError (Json_deserializers.internal_server_error_of_yojson tree path)
      | _, "InvalidImageFormatException" ->
          `InvalidImageFormatException
            (Json_deserializers.invalid_image_format_exception_of_yojson tree path)
      | _, "InvalidParameterException" ->
          `InvalidParameterException
            (Json_deserializers.invalid_parameter_exception_of_yojson tree path)
      | _, "InvalidS3ObjectException" ->
          `InvalidS3ObjectException
            (Json_deserializers.invalid_s3_object_exception_of_yojson tree path)
      | _, "ProvisionedThroughputExceededException" ->
          `ProvisionedThroughputExceededException
            (Json_deserializers.provisioned_throughput_exceeded_exception_of_yojson tree path)
      | _, "ResourceNotFoundException" ->
          `ResourceNotFoundException
            (Json_deserializers.resource_not_found_exception_of_yojson tree path)
      | _, "ResourceNotReadyException" ->
          `ResourceNotReadyException
            (Json_deserializers.resource_not_ready_exception_of_yojson tree path)
      | _, "ThrottlingException" ->
          `ThrottlingException (Json_deserializers.throttling_exception_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : detect_moderation_labels_request) =
    let input = Json_serializers.detect_moderation_labels_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"RekognitionService.DetectModerationLabels"
      ~service ~context ~input
      ~output_deserializer:Json_deserializers.detect_moderation_labels_response_of_yojson
      ~error_deserializer

  let request_with_metadata context (request : detect_moderation_labels_request) =
    let input = Json_serializers.detect_moderation_labels_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata
      ~shape_name:"RekognitionService.DetectModerationLabels" ~service ~context ~input
      ~output_deserializer:Json_deserializers.detect_moderation_labels_response_of_yojson
      ~error_deserializer
end

module DetectProtectiveEquipment = struct
  let error_to_string = function
    | `AccessDeniedException _ -> "com.amazonaws.rekognition#AccessDeniedException"
    | `ImageTooLargeException _ -> "com.amazonaws.rekognition#ImageTooLargeException"
    | `InternalServerError _ -> "com.amazonaws.rekognition#InternalServerError"
    | `InvalidImageFormatException _ -> "com.amazonaws.rekognition#InvalidImageFormatException"
    | `InvalidParameterException _ -> "com.amazonaws.rekognition#InvalidParameterException"
    | `InvalidS3ObjectException _ -> "com.amazonaws.rekognition#InvalidS3ObjectException"
    | `ProvisionedThroughputExceededException _ ->
        "com.amazonaws.rekognition#ProvisionedThroughputExceededException"
    | `ThrottlingException _ -> "com.amazonaws.rekognition#ThrottlingException"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "AccessDeniedException" ->
          `AccessDeniedException (Json_deserializers.access_denied_exception_of_yojson tree path)
      | _, "ImageTooLargeException" ->
          `ImageTooLargeException (Json_deserializers.image_too_large_exception_of_yojson tree path)
      | _, "InternalServerError" ->
          `InternalServerError (Json_deserializers.internal_server_error_of_yojson tree path)
      | _, "InvalidImageFormatException" ->
          `InvalidImageFormatException
            (Json_deserializers.invalid_image_format_exception_of_yojson tree path)
      | _, "InvalidParameterException" ->
          `InvalidParameterException
            (Json_deserializers.invalid_parameter_exception_of_yojson tree path)
      | _, "InvalidS3ObjectException" ->
          `InvalidS3ObjectException
            (Json_deserializers.invalid_s3_object_exception_of_yojson tree path)
      | _, "ProvisionedThroughputExceededException" ->
          `ProvisionedThroughputExceededException
            (Json_deserializers.provisioned_throughput_exceeded_exception_of_yojson tree path)
      | _, "ThrottlingException" ->
          `ThrottlingException (Json_deserializers.throttling_exception_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : detect_protective_equipment_request) =
    let input = Json_serializers.detect_protective_equipment_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"RekognitionService.DetectProtectiveEquipment"
      ~service ~context ~input
      ~output_deserializer:Json_deserializers.detect_protective_equipment_response_of_yojson
      ~error_deserializer

  let request_with_metadata context (request : detect_protective_equipment_request) =
    let input = Json_serializers.detect_protective_equipment_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata
      ~shape_name:"RekognitionService.DetectProtectiveEquipment" ~service ~context ~input
      ~output_deserializer:Json_deserializers.detect_protective_equipment_response_of_yojson
      ~error_deserializer
end

module DetectText = struct
  let error_to_string = function
    | `AccessDeniedException _ -> "com.amazonaws.rekognition#AccessDeniedException"
    | `ImageTooLargeException _ -> "com.amazonaws.rekognition#ImageTooLargeException"
    | `InternalServerError _ -> "com.amazonaws.rekognition#InternalServerError"
    | `InvalidImageFormatException _ -> "com.amazonaws.rekognition#InvalidImageFormatException"
    | `InvalidParameterException _ -> "com.amazonaws.rekognition#InvalidParameterException"
    | `InvalidS3ObjectException _ -> "com.amazonaws.rekognition#InvalidS3ObjectException"
    | `ProvisionedThroughputExceededException _ ->
        "com.amazonaws.rekognition#ProvisionedThroughputExceededException"
    | `ThrottlingException _ -> "com.amazonaws.rekognition#ThrottlingException"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "AccessDeniedException" ->
          `AccessDeniedException (Json_deserializers.access_denied_exception_of_yojson tree path)
      | _, "ImageTooLargeException" ->
          `ImageTooLargeException (Json_deserializers.image_too_large_exception_of_yojson tree path)
      | _, "InternalServerError" ->
          `InternalServerError (Json_deserializers.internal_server_error_of_yojson tree path)
      | _, "InvalidImageFormatException" ->
          `InvalidImageFormatException
            (Json_deserializers.invalid_image_format_exception_of_yojson tree path)
      | _, "InvalidParameterException" ->
          `InvalidParameterException
            (Json_deserializers.invalid_parameter_exception_of_yojson tree path)
      | _, "InvalidS3ObjectException" ->
          `InvalidS3ObjectException
            (Json_deserializers.invalid_s3_object_exception_of_yojson tree path)
      | _, "ProvisionedThroughputExceededException" ->
          `ProvisionedThroughputExceededException
            (Json_deserializers.provisioned_throughput_exceeded_exception_of_yojson tree path)
      | _, "ThrottlingException" ->
          `ThrottlingException (Json_deserializers.throttling_exception_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : detect_text_request) =
    let input = Json_serializers.detect_text_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"RekognitionService.DetectText" ~service
      ~context ~input ~output_deserializer:Json_deserializers.detect_text_response_of_yojson
      ~error_deserializer

  let request_with_metadata context (request : detect_text_request) =
    let input = Json_serializers.detect_text_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata ~shape_name:"RekognitionService.DetectText"
      ~service ~context ~input
      ~output_deserializer:Json_deserializers.detect_text_response_of_yojson ~error_deserializer
end

module DisassociateFaces = struct
  let error_to_string = function
    | `AccessDeniedException _ -> "com.amazonaws.rekognition#AccessDeniedException"
    | `ConflictException _ -> "com.amazonaws.rekognition#ConflictException"
    | `IdempotentParameterMismatchException _ ->
        "com.amazonaws.rekognition#IdempotentParameterMismatchException"
    | `InternalServerError _ -> "com.amazonaws.rekognition#InternalServerError"
    | `InvalidParameterException _ -> "com.amazonaws.rekognition#InvalidParameterException"
    | `ProvisionedThroughputExceededException _ ->
        "com.amazonaws.rekognition#ProvisionedThroughputExceededException"
    | `ResourceNotFoundException _ -> "com.amazonaws.rekognition#ResourceNotFoundException"
    | `ThrottlingException _ -> "com.amazonaws.rekognition#ThrottlingException"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "AccessDeniedException" ->
          `AccessDeniedException (Json_deserializers.access_denied_exception_of_yojson tree path)
      | _, "ConflictException" ->
          `ConflictException (Json_deserializers.conflict_exception_of_yojson tree path)
      | _, "IdempotentParameterMismatchException" ->
          `IdempotentParameterMismatchException
            (Json_deserializers.idempotent_parameter_mismatch_exception_of_yojson tree path)
      | _, "InternalServerError" ->
          `InternalServerError (Json_deserializers.internal_server_error_of_yojson tree path)
      | _, "InvalidParameterException" ->
          `InvalidParameterException
            (Json_deserializers.invalid_parameter_exception_of_yojson tree path)
      | _, "ProvisionedThroughputExceededException" ->
          `ProvisionedThroughputExceededException
            (Json_deserializers.provisioned_throughput_exceeded_exception_of_yojson tree path)
      | _, "ResourceNotFoundException" ->
          `ResourceNotFoundException
            (Json_deserializers.resource_not_found_exception_of_yojson tree path)
      | _, "ThrottlingException" ->
          `ThrottlingException (Json_deserializers.throttling_exception_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : disassociate_faces_request) =
    let input = Json_serializers.disassociate_faces_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"RekognitionService.DisassociateFaces" ~service
      ~context ~input ~output_deserializer:Json_deserializers.disassociate_faces_response_of_yojson
      ~error_deserializer

  let request_with_metadata context (request : disassociate_faces_request) =
    let input = Json_serializers.disassociate_faces_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata
      ~shape_name:"RekognitionService.DisassociateFaces" ~service ~context ~input
      ~output_deserializer:Json_deserializers.disassociate_faces_response_of_yojson
      ~error_deserializer
end

module DistributeDatasetEntries = struct
  let error_to_string = function
    | `AccessDeniedException _ -> "com.amazonaws.rekognition#AccessDeniedException"
    | `InternalServerError _ -> "com.amazonaws.rekognition#InternalServerError"
    | `InvalidParameterException _ -> "com.amazonaws.rekognition#InvalidParameterException"
    | `ProvisionedThroughputExceededException _ ->
        "com.amazonaws.rekognition#ProvisionedThroughputExceededException"
    | `ResourceNotFoundException _ -> "com.amazonaws.rekognition#ResourceNotFoundException"
    | `ResourceNotReadyException _ -> "com.amazonaws.rekognition#ResourceNotReadyException"
    | `ThrottlingException _ -> "com.amazonaws.rekognition#ThrottlingException"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "AccessDeniedException" ->
          `AccessDeniedException (Json_deserializers.access_denied_exception_of_yojson tree path)
      | _, "InternalServerError" ->
          `InternalServerError (Json_deserializers.internal_server_error_of_yojson tree path)
      | _, "InvalidParameterException" ->
          `InvalidParameterException
            (Json_deserializers.invalid_parameter_exception_of_yojson tree path)
      | _, "ProvisionedThroughputExceededException" ->
          `ProvisionedThroughputExceededException
            (Json_deserializers.provisioned_throughput_exceeded_exception_of_yojson tree path)
      | _, "ResourceNotFoundException" ->
          `ResourceNotFoundException
            (Json_deserializers.resource_not_found_exception_of_yojson tree path)
      | _, "ResourceNotReadyException" ->
          `ResourceNotReadyException
            (Json_deserializers.resource_not_ready_exception_of_yojson tree path)
      | _, "ThrottlingException" ->
          `ThrottlingException (Json_deserializers.throttling_exception_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : distribute_dataset_entries_request) =
    let input = Json_serializers.distribute_dataset_entries_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"RekognitionService.DistributeDatasetEntries"
      ~service ~context ~input
      ~output_deserializer:Json_deserializers.distribute_dataset_entries_response_of_yojson
      ~error_deserializer

  let request_with_metadata context (request : distribute_dataset_entries_request) =
    let input = Json_serializers.distribute_dataset_entries_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata
      ~shape_name:"RekognitionService.DistributeDatasetEntries" ~service ~context ~input
      ~output_deserializer:Json_deserializers.distribute_dataset_entries_response_of_yojson
      ~error_deserializer
end

module GetCelebrityInfo = struct
  let error_to_string = function
    | `AccessDeniedException _ -> "com.amazonaws.rekognition#AccessDeniedException"
    | `InternalServerError _ -> "com.amazonaws.rekognition#InternalServerError"
    | `InvalidParameterException _ -> "com.amazonaws.rekognition#InvalidParameterException"
    | `ProvisionedThroughputExceededException _ ->
        "com.amazonaws.rekognition#ProvisionedThroughputExceededException"
    | `ResourceNotFoundException _ -> "com.amazonaws.rekognition#ResourceNotFoundException"
    | `ThrottlingException _ -> "com.amazonaws.rekognition#ThrottlingException"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "AccessDeniedException" ->
          `AccessDeniedException (Json_deserializers.access_denied_exception_of_yojson tree path)
      | _, "InternalServerError" ->
          `InternalServerError (Json_deserializers.internal_server_error_of_yojson tree path)
      | _, "InvalidParameterException" ->
          `InvalidParameterException
            (Json_deserializers.invalid_parameter_exception_of_yojson tree path)
      | _, "ProvisionedThroughputExceededException" ->
          `ProvisionedThroughputExceededException
            (Json_deserializers.provisioned_throughput_exceeded_exception_of_yojson tree path)
      | _, "ResourceNotFoundException" ->
          `ResourceNotFoundException
            (Json_deserializers.resource_not_found_exception_of_yojson tree path)
      | _, "ThrottlingException" ->
          `ThrottlingException (Json_deserializers.throttling_exception_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : get_celebrity_info_request) =
    let input = Json_serializers.get_celebrity_info_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"RekognitionService.GetCelebrityInfo" ~service
      ~context ~input ~output_deserializer:Json_deserializers.get_celebrity_info_response_of_yojson
      ~error_deserializer

  let request_with_metadata context (request : get_celebrity_info_request) =
    let input = Json_serializers.get_celebrity_info_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata
      ~shape_name:"RekognitionService.GetCelebrityInfo" ~service ~context ~input
      ~output_deserializer:Json_deserializers.get_celebrity_info_response_of_yojson
      ~error_deserializer
end

module GetCelebrityRecognition = struct
  let error_to_string = function
    | `AccessDeniedException _ -> "com.amazonaws.rekognition#AccessDeniedException"
    | `InternalServerError _ -> "com.amazonaws.rekognition#InternalServerError"
    | `InvalidPaginationTokenException _ ->
        "com.amazonaws.rekognition#InvalidPaginationTokenException"
    | `InvalidParameterException _ -> "com.amazonaws.rekognition#InvalidParameterException"
    | `ProvisionedThroughputExceededException _ ->
        "com.amazonaws.rekognition#ProvisionedThroughputExceededException"
    | `ResourceNotFoundException _ -> "com.amazonaws.rekognition#ResourceNotFoundException"
    | `ThrottlingException _ -> "com.amazonaws.rekognition#ThrottlingException"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "AccessDeniedException" ->
          `AccessDeniedException (Json_deserializers.access_denied_exception_of_yojson tree path)
      | _, "InternalServerError" ->
          `InternalServerError (Json_deserializers.internal_server_error_of_yojson tree path)
      | _, "InvalidPaginationTokenException" ->
          `InvalidPaginationTokenException
            (Json_deserializers.invalid_pagination_token_exception_of_yojson tree path)
      | _, "InvalidParameterException" ->
          `InvalidParameterException
            (Json_deserializers.invalid_parameter_exception_of_yojson tree path)
      | _, "ProvisionedThroughputExceededException" ->
          `ProvisionedThroughputExceededException
            (Json_deserializers.provisioned_throughput_exceeded_exception_of_yojson tree path)
      | _, "ResourceNotFoundException" ->
          `ResourceNotFoundException
            (Json_deserializers.resource_not_found_exception_of_yojson tree path)
      | _, "ThrottlingException" ->
          `ThrottlingException (Json_deserializers.throttling_exception_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : get_celebrity_recognition_request) =
    let input = Json_serializers.get_celebrity_recognition_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"RekognitionService.GetCelebrityRecognition"
      ~service ~context ~input
      ~output_deserializer:Json_deserializers.get_celebrity_recognition_response_of_yojson
      ~error_deserializer

  let request_with_metadata context (request : get_celebrity_recognition_request) =
    let input = Json_serializers.get_celebrity_recognition_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata
      ~shape_name:"RekognitionService.GetCelebrityRecognition" ~service ~context ~input
      ~output_deserializer:Json_deserializers.get_celebrity_recognition_response_of_yojson
      ~error_deserializer
end

module GetContentModeration = struct
  let error_to_string = function
    | `AccessDeniedException _ -> "com.amazonaws.rekognition#AccessDeniedException"
    | `InternalServerError _ -> "com.amazonaws.rekognition#InternalServerError"
    | `InvalidPaginationTokenException _ ->
        "com.amazonaws.rekognition#InvalidPaginationTokenException"
    | `InvalidParameterException _ -> "com.amazonaws.rekognition#InvalidParameterException"
    | `ProvisionedThroughputExceededException _ ->
        "com.amazonaws.rekognition#ProvisionedThroughputExceededException"
    | `ResourceNotFoundException _ -> "com.amazonaws.rekognition#ResourceNotFoundException"
    | `ThrottlingException _ -> "com.amazonaws.rekognition#ThrottlingException"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "AccessDeniedException" ->
          `AccessDeniedException (Json_deserializers.access_denied_exception_of_yojson tree path)
      | _, "InternalServerError" ->
          `InternalServerError (Json_deserializers.internal_server_error_of_yojson tree path)
      | _, "InvalidPaginationTokenException" ->
          `InvalidPaginationTokenException
            (Json_deserializers.invalid_pagination_token_exception_of_yojson tree path)
      | _, "InvalidParameterException" ->
          `InvalidParameterException
            (Json_deserializers.invalid_parameter_exception_of_yojson tree path)
      | _, "ProvisionedThroughputExceededException" ->
          `ProvisionedThroughputExceededException
            (Json_deserializers.provisioned_throughput_exceeded_exception_of_yojson tree path)
      | _, "ResourceNotFoundException" ->
          `ResourceNotFoundException
            (Json_deserializers.resource_not_found_exception_of_yojson tree path)
      | _, "ThrottlingException" ->
          `ThrottlingException (Json_deserializers.throttling_exception_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : get_content_moderation_request) =
    let input = Json_serializers.get_content_moderation_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"RekognitionService.GetContentModeration"
      ~service ~context ~input
      ~output_deserializer:Json_deserializers.get_content_moderation_response_of_yojson
      ~error_deserializer

  let request_with_metadata context (request : get_content_moderation_request) =
    let input = Json_serializers.get_content_moderation_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata
      ~shape_name:"RekognitionService.GetContentModeration" ~service ~context ~input
      ~output_deserializer:Json_deserializers.get_content_moderation_response_of_yojson
      ~error_deserializer
end

module GetFaceDetection = struct
  let error_to_string = function
    | `AccessDeniedException _ -> "com.amazonaws.rekognition#AccessDeniedException"
    | `InternalServerError _ -> "com.amazonaws.rekognition#InternalServerError"
    | `InvalidPaginationTokenException _ ->
        "com.amazonaws.rekognition#InvalidPaginationTokenException"
    | `InvalidParameterException _ -> "com.amazonaws.rekognition#InvalidParameterException"
    | `ProvisionedThroughputExceededException _ ->
        "com.amazonaws.rekognition#ProvisionedThroughputExceededException"
    | `ResourceNotFoundException _ -> "com.amazonaws.rekognition#ResourceNotFoundException"
    | `ThrottlingException _ -> "com.amazonaws.rekognition#ThrottlingException"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "AccessDeniedException" ->
          `AccessDeniedException (Json_deserializers.access_denied_exception_of_yojson tree path)
      | _, "InternalServerError" ->
          `InternalServerError (Json_deserializers.internal_server_error_of_yojson tree path)
      | _, "InvalidPaginationTokenException" ->
          `InvalidPaginationTokenException
            (Json_deserializers.invalid_pagination_token_exception_of_yojson tree path)
      | _, "InvalidParameterException" ->
          `InvalidParameterException
            (Json_deserializers.invalid_parameter_exception_of_yojson tree path)
      | _, "ProvisionedThroughputExceededException" ->
          `ProvisionedThroughputExceededException
            (Json_deserializers.provisioned_throughput_exceeded_exception_of_yojson tree path)
      | _, "ResourceNotFoundException" ->
          `ResourceNotFoundException
            (Json_deserializers.resource_not_found_exception_of_yojson tree path)
      | _, "ThrottlingException" ->
          `ThrottlingException (Json_deserializers.throttling_exception_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : get_face_detection_request) =
    let input = Json_serializers.get_face_detection_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"RekognitionService.GetFaceDetection" ~service
      ~context ~input ~output_deserializer:Json_deserializers.get_face_detection_response_of_yojson
      ~error_deserializer

  let request_with_metadata context (request : get_face_detection_request) =
    let input = Json_serializers.get_face_detection_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata
      ~shape_name:"RekognitionService.GetFaceDetection" ~service ~context ~input
      ~output_deserializer:Json_deserializers.get_face_detection_response_of_yojson
      ~error_deserializer
end

module GetFaceLivenessSessionResults = struct
  let error_to_string = function
    | `AccessDeniedException _ -> "com.amazonaws.rekognition#AccessDeniedException"
    | `InternalServerError _ -> "com.amazonaws.rekognition#InternalServerError"
    | `InvalidParameterException _ -> "com.amazonaws.rekognition#InvalidParameterException"
    | `ProvisionedThroughputExceededException _ ->
        "com.amazonaws.rekognition#ProvisionedThroughputExceededException"
    | `SessionNotFoundException _ -> "com.amazonaws.rekognition#SessionNotFoundException"
    | `ThrottlingException _ -> "com.amazonaws.rekognition#ThrottlingException"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "AccessDeniedException" ->
          `AccessDeniedException (Json_deserializers.access_denied_exception_of_yojson tree path)
      | _, "InternalServerError" ->
          `InternalServerError (Json_deserializers.internal_server_error_of_yojson tree path)
      | _, "InvalidParameterException" ->
          `InvalidParameterException
            (Json_deserializers.invalid_parameter_exception_of_yojson tree path)
      | _, "ProvisionedThroughputExceededException" ->
          `ProvisionedThroughputExceededException
            (Json_deserializers.provisioned_throughput_exceeded_exception_of_yojson tree path)
      | _, "SessionNotFoundException" ->
          `SessionNotFoundException
            (Json_deserializers.session_not_found_exception_of_yojson tree path)
      | _, "ThrottlingException" ->
          `ThrottlingException (Json_deserializers.throttling_exception_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : get_face_liveness_session_results_request) =
    let input = Json_serializers.get_face_liveness_session_results_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request
      ~shape_name:"RekognitionService.GetFaceLivenessSessionResults" ~service ~context ~input
      ~output_deserializer:Json_deserializers.get_face_liveness_session_results_response_of_yojson
      ~error_deserializer

  let request_with_metadata context (request : get_face_liveness_session_results_request) =
    let input = Json_serializers.get_face_liveness_session_results_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata
      ~shape_name:"RekognitionService.GetFaceLivenessSessionResults" ~service ~context ~input
      ~output_deserializer:Json_deserializers.get_face_liveness_session_results_response_of_yojson
      ~error_deserializer
end

module GetFaceSearch = struct
  let error_to_string = function
    | `AccessDeniedException _ -> "com.amazonaws.rekognition#AccessDeniedException"
    | `InternalServerError _ -> "com.amazonaws.rekognition#InternalServerError"
    | `InvalidPaginationTokenException _ ->
        "com.amazonaws.rekognition#InvalidPaginationTokenException"
    | `InvalidParameterException _ -> "com.amazonaws.rekognition#InvalidParameterException"
    | `ProvisionedThroughputExceededException _ ->
        "com.amazonaws.rekognition#ProvisionedThroughputExceededException"
    | `ResourceNotFoundException _ -> "com.amazonaws.rekognition#ResourceNotFoundException"
    | `ThrottlingException _ -> "com.amazonaws.rekognition#ThrottlingException"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "AccessDeniedException" ->
          `AccessDeniedException (Json_deserializers.access_denied_exception_of_yojson tree path)
      | _, "InternalServerError" ->
          `InternalServerError (Json_deserializers.internal_server_error_of_yojson tree path)
      | _, "InvalidPaginationTokenException" ->
          `InvalidPaginationTokenException
            (Json_deserializers.invalid_pagination_token_exception_of_yojson tree path)
      | _, "InvalidParameterException" ->
          `InvalidParameterException
            (Json_deserializers.invalid_parameter_exception_of_yojson tree path)
      | _, "ProvisionedThroughputExceededException" ->
          `ProvisionedThroughputExceededException
            (Json_deserializers.provisioned_throughput_exceeded_exception_of_yojson tree path)
      | _, "ResourceNotFoundException" ->
          `ResourceNotFoundException
            (Json_deserializers.resource_not_found_exception_of_yojson tree path)
      | _, "ThrottlingException" ->
          `ThrottlingException (Json_deserializers.throttling_exception_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : get_face_search_request) =
    let input = Json_serializers.get_face_search_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"RekognitionService.GetFaceSearch" ~service
      ~context ~input ~output_deserializer:Json_deserializers.get_face_search_response_of_yojson
      ~error_deserializer

  let request_with_metadata context (request : get_face_search_request) =
    let input = Json_serializers.get_face_search_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata ~shape_name:"RekognitionService.GetFaceSearch"
      ~service ~context ~input
      ~output_deserializer:Json_deserializers.get_face_search_response_of_yojson ~error_deserializer
end

module GetLabelDetection = struct
  let error_to_string = function
    | `AccessDeniedException _ -> "com.amazonaws.rekognition#AccessDeniedException"
    | `InternalServerError _ -> "com.amazonaws.rekognition#InternalServerError"
    | `InvalidPaginationTokenException _ ->
        "com.amazonaws.rekognition#InvalidPaginationTokenException"
    | `InvalidParameterException _ -> "com.amazonaws.rekognition#InvalidParameterException"
    | `ProvisionedThroughputExceededException _ ->
        "com.amazonaws.rekognition#ProvisionedThroughputExceededException"
    | `ResourceNotFoundException _ -> "com.amazonaws.rekognition#ResourceNotFoundException"
    | `ThrottlingException _ -> "com.amazonaws.rekognition#ThrottlingException"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "AccessDeniedException" ->
          `AccessDeniedException (Json_deserializers.access_denied_exception_of_yojson tree path)
      | _, "InternalServerError" ->
          `InternalServerError (Json_deserializers.internal_server_error_of_yojson tree path)
      | _, "InvalidPaginationTokenException" ->
          `InvalidPaginationTokenException
            (Json_deserializers.invalid_pagination_token_exception_of_yojson tree path)
      | _, "InvalidParameterException" ->
          `InvalidParameterException
            (Json_deserializers.invalid_parameter_exception_of_yojson tree path)
      | _, "ProvisionedThroughputExceededException" ->
          `ProvisionedThroughputExceededException
            (Json_deserializers.provisioned_throughput_exceeded_exception_of_yojson tree path)
      | _, "ResourceNotFoundException" ->
          `ResourceNotFoundException
            (Json_deserializers.resource_not_found_exception_of_yojson tree path)
      | _, "ThrottlingException" ->
          `ThrottlingException (Json_deserializers.throttling_exception_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : get_label_detection_request) =
    let input = Json_serializers.get_label_detection_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"RekognitionService.GetLabelDetection" ~service
      ~context ~input ~output_deserializer:Json_deserializers.get_label_detection_response_of_yojson
      ~error_deserializer

  let request_with_metadata context (request : get_label_detection_request) =
    let input = Json_serializers.get_label_detection_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata
      ~shape_name:"RekognitionService.GetLabelDetection" ~service ~context ~input
      ~output_deserializer:Json_deserializers.get_label_detection_response_of_yojson
      ~error_deserializer
end

module GetMediaAnalysisJob = struct
  let error_to_string = function
    | `AccessDeniedException _ -> "com.amazonaws.rekognition#AccessDeniedException"
    | `InternalServerError _ -> "com.amazonaws.rekognition#InternalServerError"
    | `InvalidParameterException _ -> "com.amazonaws.rekognition#InvalidParameterException"
    | `ProvisionedThroughputExceededException _ ->
        "com.amazonaws.rekognition#ProvisionedThroughputExceededException"
    | `ResourceNotFoundException _ -> "com.amazonaws.rekognition#ResourceNotFoundException"
    | `ThrottlingException _ -> "com.amazonaws.rekognition#ThrottlingException"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "AccessDeniedException" ->
          `AccessDeniedException (Json_deserializers.access_denied_exception_of_yojson tree path)
      | _, "InternalServerError" ->
          `InternalServerError (Json_deserializers.internal_server_error_of_yojson tree path)
      | _, "InvalidParameterException" ->
          `InvalidParameterException
            (Json_deserializers.invalid_parameter_exception_of_yojson tree path)
      | _, "ProvisionedThroughputExceededException" ->
          `ProvisionedThroughputExceededException
            (Json_deserializers.provisioned_throughput_exceeded_exception_of_yojson tree path)
      | _, "ResourceNotFoundException" ->
          `ResourceNotFoundException
            (Json_deserializers.resource_not_found_exception_of_yojson tree path)
      | _, "ThrottlingException" ->
          `ThrottlingException (Json_deserializers.throttling_exception_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : get_media_analysis_job_request) =
    let input = Json_serializers.get_media_analysis_job_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"RekognitionService.GetMediaAnalysisJob"
      ~service ~context ~input
      ~output_deserializer:Json_deserializers.get_media_analysis_job_response_of_yojson
      ~error_deserializer

  let request_with_metadata context (request : get_media_analysis_job_request) =
    let input = Json_serializers.get_media_analysis_job_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata
      ~shape_name:"RekognitionService.GetMediaAnalysisJob" ~service ~context ~input
      ~output_deserializer:Json_deserializers.get_media_analysis_job_response_of_yojson
      ~error_deserializer
end

module GetPersonTracking = struct
  let error_to_string = function
    | `AccessDeniedException _ -> "com.amazonaws.rekognition#AccessDeniedException"
    | `InternalServerError _ -> "com.amazonaws.rekognition#InternalServerError"
    | `InvalidPaginationTokenException _ ->
        "com.amazonaws.rekognition#InvalidPaginationTokenException"
    | `InvalidParameterException _ -> "com.amazonaws.rekognition#InvalidParameterException"
    | `ProvisionedThroughputExceededException _ ->
        "com.amazonaws.rekognition#ProvisionedThroughputExceededException"
    | `ResourceNotFoundException _ -> "com.amazonaws.rekognition#ResourceNotFoundException"
    | `ThrottlingException _ -> "com.amazonaws.rekognition#ThrottlingException"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "AccessDeniedException" ->
          `AccessDeniedException (Json_deserializers.access_denied_exception_of_yojson tree path)
      | _, "InternalServerError" ->
          `InternalServerError (Json_deserializers.internal_server_error_of_yojson tree path)
      | _, "InvalidPaginationTokenException" ->
          `InvalidPaginationTokenException
            (Json_deserializers.invalid_pagination_token_exception_of_yojson tree path)
      | _, "InvalidParameterException" ->
          `InvalidParameterException
            (Json_deserializers.invalid_parameter_exception_of_yojson tree path)
      | _, "ProvisionedThroughputExceededException" ->
          `ProvisionedThroughputExceededException
            (Json_deserializers.provisioned_throughput_exceeded_exception_of_yojson tree path)
      | _, "ResourceNotFoundException" ->
          `ResourceNotFoundException
            (Json_deserializers.resource_not_found_exception_of_yojson tree path)
      | _, "ThrottlingException" ->
          `ThrottlingException (Json_deserializers.throttling_exception_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : get_person_tracking_request) =
    let input = Json_serializers.get_person_tracking_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"RekognitionService.GetPersonTracking" ~service
      ~context ~input ~output_deserializer:Json_deserializers.get_person_tracking_response_of_yojson
      ~error_deserializer

  let request_with_metadata context (request : get_person_tracking_request) =
    let input = Json_serializers.get_person_tracking_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata
      ~shape_name:"RekognitionService.GetPersonTracking" ~service ~context ~input
      ~output_deserializer:Json_deserializers.get_person_tracking_response_of_yojson
      ~error_deserializer
end

module GetSegmentDetection = struct
  let error_to_string = function
    | `AccessDeniedException _ -> "com.amazonaws.rekognition#AccessDeniedException"
    | `InternalServerError _ -> "com.amazonaws.rekognition#InternalServerError"
    | `InvalidPaginationTokenException _ ->
        "com.amazonaws.rekognition#InvalidPaginationTokenException"
    | `InvalidParameterException _ -> "com.amazonaws.rekognition#InvalidParameterException"
    | `ProvisionedThroughputExceededException _ ->
        "com.amazonaws.rekognition#ProvisionedThroughputExceededException"
    | `ResourceNotFoundException _ -> "com.amazonaws.rekognition#ResourceNotFoundException"
    | `ThrottlingException _ -> "com.amazonaws.rekognition#ThrottlingException"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "AccessDeniedException" ->
          `AccessDeniedException (Json_deserializers.access_denied_exception_of_yojson tree path)
      | _, "InternalServerError" ->
          `InternalServerError (Json_deserializers.internal_server_error_of_yojson tree path)
      | _, "InvalidPaginationTokenException" ->
          `InvalidPaginationTokenException
            (Json_deserializers.invalid_pagination_token_exception_of_yojson tree path)
      | _, "InvalidParameterException" ->
          `InvalidParameterException
            (Json_deserializers.invalid_parameter_exception_of_yojson tree path)
      | _, "ProvisionedThroughputExceededException" ->
          `ProvisionedThroughputExceededException
            (Json_deserializers.provisioned_throughput_exceeded_exception_of_yojson tree path)
      | _, "ResourceNotFoundException" ->
          `ResourceNotFoundException
            (Json_deserializers.resource_not_found_exception_of_yojson tree path)
      | _, "ThrottlingException" ->
          `ThrottlingException (Json_deserializers.throttling_exception_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : get_segment_detection_request) =
    let input = Json_serializers.get_segment_detection_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"RekognitionService.GetSegmentDetection"
      ~service ~context ~input
      ~output_deserializer:Json_deserializers.get_segment_detection_response_of_yojson
      ~error_deserializer

  let request_with_metadata context (request : get_segment_detection_request) =
    let input = Json_serializers.get_segment_detection_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata
      ~shape_name:"RekognitionService.GetSegmentDetection" ~service ~context ~input
      ~output_deserializer:Json_deserializers.get_segment_detection_response_of_yojson
      ~error_deserializer
end

module GetTextDetection = struct
  let error_to_string = function
    | `AccessDeniedException _ -> "com.amazonaws.rekognition#AccessDeniedException"
    | `InternalServerError _ -> "com.amazonaws.rekognition#InternalServerError"
    | `InvalidPaginationTokenException _ ->
        "com.amazonaws.rekognition#InvalidPaginationTokenException"
    | `InvalidParameterException _ -> "com.amazonaws.rekognition#InvalidParameterException"
    | `ProvisionedThroughputExceededException _ ->
        "com.amazonaws.rekognition#ProvisionedThroughputExceededException"
    | `ResourceNotFoundException _ -> "com.amazonaws.rekognition#ResourceNotFoundException"
    | `ThrottlingException _ -> "com.amazonaws.rekognition#ThrottlingException"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "AccessDeniedException" ->
          `AccessDeniedException (Json_deserializers.access_denied_exception_of_yojson tree path)
      | _, "InternalServerError" ->
          `InternalServerError (Json_deserializers.internal_server_error_of_yojson tree path)
      | _, "InvalidPaginationTokenException" ->
          `InvalidPaginationTokenException
            (Json_deserializers.invalid_pagination_token_exception_of_yojson tree path)
      | _, "InvalidParameterException" ->
          `InvalidParameterException
            (Json_deserializers.invalid_parameter_exception_of_yojson tree path)
      | _, "ProvisionedThroughputExceededException" ->
          `ProvisionedThroughputExceededException
            (Json_deserializers.provisioned_throughput_exceeded_exception_of_yojson tree path)
      | _, "ResourceNotFoundException" ->
          `ResourceNotFoundException
            (Json_deserializers.resource_not_found_exception_of_yojson tree path)
      | _, "ThrottlingException" ->
          `ThrottlingException (Json_deserializers.throttling_exception_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : get_text_detection_request) =
    let input = Json_serializers.get_text_detection_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"RekognitionService.GetTextDetection" ~service
      ~context ~input ~output_deserializer:Json_deserializers.get_text_detection_response_of_yojson
      ~error_deserializer

  let request_with_metadata context (request : get_text_detection_request) =
    let input = Json_serializers.get_text_detection_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata
      ~shape_name:"RekognitionService.GetTextDetection" ~service ~context ~input
      ~output_deserializer:Json_deserializers.get_text_detection_response_of_yojson
      ~error_deserializer
end

module IndexFaces = struct
  let error_to_string = function
    | `AccessDeniedException _ -> "com.amazonaws.rekognition#AccessDeniedException"
    | `ImageTooLargeException _ -> "com.amazonaws.rekognition#ImageTooLargeException"
    | `InternalServerError _ -> "com.amazonaws.rekognition#InternalServerError"
    | `InvalidImageFormatException _ -> "com.amazonaws.rekognition#InvalidImageFormatException"
    | `InvalidParameterException _ -> "com.amazonaws.rekognition#InvalidParameterException"
    | `InvalidS3ObjectException _ -> "com.amazonaws.rekognition#InvalidS3ObjectException"
    | `ProvisionedThroughputExceededException _ ->
        "com.amazonaws.rekognition#ProvisionedThroughputExceededException"
    | `ResourceNotFoundException _ -> "com.amazonaws.rekognition#ResourceNotFoundException"
    | `ServiceQuotaExceededException _ -> "com.amazonaws.rekognition#ServiceQuotaExceededException"
    | `ThrottlingException _ -> "com.amazonaws.rekognition#ThrottlingException"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "AccessDeniedException" ->
          `AccessDeniedException (Json_deserializers.access_denied_exception_of_yojson tree path)
      | _, "ImageTooLargeException" ->
          `ImageTooLargeException (Json_deserializers.image_too_large_exception_of_yojson tree path)
      | _, "InternalServerError" ->
          `InternalServerError (Json_deserializers.internal_server_error_of_yojson tree path)
      | _, "InvalidImageFormatException" ->
          `InvalidImageFormatException
            (Json_deserializers.invalid_image_format_exception_of_yojson tree path)
      | _, "InvalidParameterException" ->
          `InvalidParameterException
            (Json_deserializers.invalid_parameter_exception_of_yojson tree path)
      | _, "InvalidS3ObjectException" ->
          `InvalidS3ObjectException
            (Json_deserializers.invalid_s3_object_exception_of_yojson tree path)
      | _, "ProvisionedThroughputExceededException" ->
          `ProvisionedThroughputExceededException
            (Json_deserializers.provisioned_throughput_exceeded_exception_of_yojson tree path)
      | _, "ResourceNotFoundException" ->
          `ResourceNotFoundException
            (Json_deserializers.resource_not_found_exception_of_yojson tree path)
      | _, "ServiceQuotaExceededException" ->
          `ServiceQuotaExceededException
            (Json_deserializers.service_quota_exceeded_exception_of_yojson tree path)
      | _, "ThrottlingException" ->
          `ThrottlingException (Json_deserializers.throttling_exception_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : index_faces_request) =
    let input = Json_serializers.index_faces_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"RekognitionService.IndexFaces" ~service
      ~context ~input ~output_deserializer:Json_deserializers.index_faces_response_of_yojson
      ~error_deserializer

  let request_with_metadata context (request : index_faces_request) =
    let input = Json_serializers.index_faces_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata ~shape_name:"RekognitionService.IndexFaces"
      ~service ~context ~input
      ~output_deserializer:Json_deserializers.index_faces_response_of_yojson ~error_deserializer
end

module ListCollections = struct
  let error_to_string = function
    | `AccessDeniedException _ -> "com.amazonaws.rekognition#AccessDeniedException"
    | `InternalServerError _ -> "com.amazonaws.rekognition#InternalServerError"
    | `InvalidPaginationTokenException _ ->
        "com.amazonaws.rekognition#InvalidPaginationTokenException"
    | `InvalidParameterException _ -> "com.amazonaws.rekognition#InvalidParameterException"
    | `ProvisionedThroughputExceededException _ ->
        "com.amazonaws.rekognition#ProvisionedThroughputExceededException"
    | `ResourceNotFoundException _ -> "com.amazonaws.rekognition#ResourceNotFoundException"
    | `ThrottlingException _ -> "com.amazonaws.rekognition#ThrottlingException"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "AccessDeniedException" ->
          `AccessDeniedException (Json_deserializers.access_denied_exception_of_yojson tree path)
      | _, "InternalServerError" ->
          `InternalServerError (Json_deserializers.internal_server_error_of_yojson tree path)
      | _, "InvalidPaginationTokenException" ->
          `InvalidPaginationTokenException
            (Json_deserializers.invalid_pagination_token_exception_of_yojson tree path)
      | _, "InvalidParameterException" ->
          `InvalidParameterException
            (Json_deserializers.invalid_parameter_exception_of_yojson tree path)
      | _, "ProvisionedThroughputExceededException" ->
          `ProvisionedThroughputExceededException
            (Json_deserializers.provisioned_throughput_exceeded_exception_of_yojson tree path)
      | _, "ResourceNotFoundException" ->
          `ResourceNotFoundException
            (Json_deserializers.resource_not_found_exception_of_yojson tree path)
      | _, "ThrottlingException" ->
          `ThrottlingException (Json_deserializers.throttling_exception_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : list_collections_request) =
    let input = Json_serializers.list_collections_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"RekognitionService.ListCollections" ~service
      ~context ~input ~output_deserializer:Json_deserializers.list_collections_response_of_yojson
      ~error_deserializer

  let request_with_metadata context (request : list_collections_request) =
    let input = Json_serializers.list_collections_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata
      ~shape_name:"RekognitionService.ListCollections" ~service ~context ~input
      ~output_deserializer:Json_deserializers.list_collections_response_of_yojson
      ~error_deserializer
end

module ListDatasetEntries = struct
  let error_to_string = function
    | `AccessDeniedException _ -> "com.amazonaws.rekognition#AccessDeniedException"
    | `InternalServerError _ -> "com.amazonaws.rekognition#InternalServerError"
    | `InvalidPaginationTokenException _ ->
        "com.amazonaws.rekognition#InvalidPaginationTokenException"
    | `InvalidParameterException _ -> "com.amazonaws.rekognition#InvalidParameterException"
    | `ProvisionedThroughputExceededException _ ->
        "com.amazonaws.rekognition#ProvisionedThroughputExceededException"
    | `ResourceInUseException _ -> "com.amazonaws.rekognition#ResourceInUseException"
    | `ResourceNotFoundException _ -> "com.amazonaws.rekognition#ResourceNotFoundException"
    | `ResourceNotReadyException _ -> "com.amazonaws.rekognition#ResourceNotReadyException"
    | `ThrottlingException _ -> "com.amazonaws.rekognition#ThrottlingException"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "AccessDeniedException" ->
          `AccessDeniedException (Json_deserializers.access_denied_exception_of_yojson tree path)
      | _, "InternalServerError" ->
          `InternalServerError (Json_deserializers.internal_server_error_of_yojson tree path)
      | _, "InvalidPaginationTokenException" ->
          `InvalidPaginationTokenException
            (Json_deserializers.invalid_pagination_token_exception_of_yojson tree path)
      | _, "InvalidParameterException" ->
          `InvalidParameterException
            (Json_deserializers.invalid_parameter_exception_of_yojson tree path)
      | _, "ProvisionedThroughputExceededException" ->
          `ProvisionedThroughputExceededException
            (Json_deserializers.provisioned_throughput_exceeded_exception_of_yojson tree path)
      | _, "ResourceInUseException" ->
          `ResourceInUseException (Json_deserializers.resource_in_use_exception_of_yojson tree path)
      | _, "ResourceNotFoundException" ->
          `ResourceNotFoundException
            (Json_deserializers.resource_not_found_exception_of_yojson tree path)
      | _, "ResourceNotReadyException" ->
          `ResourceNotReadyException
            (Json_deserializers.resource_not_ready_exception_of_yojson tree path)
      | _, "ThrottlingException" ->
          `ThrottlingException (Json_deserializers.throttling_exception_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : list_dataset_entries_request) =
    let input = Json_serializers.list_dataset_entries_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"RekognitionService.ListDatasetEntries" ~service
      ~context ~input
      ~output_deserializer:Json_deserializers.list_dataset_entries_response_of_yojson
      ~error_deserializer

  let request_with_metadata context (request : list_dataset_entries_request) =
    let input = Json_serializers.list_dataset_entries_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata
      ~shape_name:"RekognitionService.ListDatasetEntries" ~service ~context ~input
      ~output_deserializer:Json_deserializers.list_dataset_entries_response_of_yojson
      ~error_deserializer
end

module ListDatasetLabels = struct
  let error_to_string = function
    | `AccessDeniedException _ -> "com.amazonaws.rekognition#AccessDeniedException"
    | `InternalServerError _ -> "com.amazonaws.rekognition#InternalServerError"
    | `InvalidPaginationTokenException _ ->
        "com.amazonaws.rekognition#InvalidPaginationTokenException"
    | `InvalidParameterException _ -> "com.amazonaws.rekognition#InvalidParameterException"
    | `ProvisionedThroughputExceededException _ ->
        "com.amazonaws.rekognition#ProvisionedThroughputExceededException"
    | `ResourceInUseException _ -> "com.amazonaws.rekognition#ResourceInUseException"
    | `ResourceNotFoundException _ -> "com.amazonaws.rekognition#ResourceNotFoundException"
    | `ResourceNotReadyException _ -> "com.amazonaws.rekognition#ResourceNotReadyException"
    | `ThrottlingException _ -> "com.amazonaws.rekognition#ThrottlingException"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "AccessDeniedException" ->
          `AccessDeniedException (Json_deserializers.access_denied_exception_of_yojson tree path)
      | _, "InternalServerError" ->
          `InternalServerError (Json_deserializers.internal_server_error_of_yojson tree path)
      | _, "InvalidPaginationTokenException" ->
          `InvalidPaginationTokenException
            (Json_deserializers.invalid_pagination_token_exception_of_yojson tree path)
      | _, "InvalidParameterException" ->
          `InvalidParameterException
            (Json_deserializers.invalid_parameter_exception_of_yojson tree path)
      | _, "ProvisionedThroughputExceededException" ->
          `ProvisionedThroughputExceededException
            (Json_deserializers.provisioned_throughput_exceeded_exception_of_yojson tree path)
      | _, "ResourceInUseException" ->
          `ResourceInUseException (Json_deserializers.resource_in_use_exception_of_yojson tree path)
      | _, "ResourceNotFoundException" ->
          `ResourceNotFoundException
            (Json_deserializers.resource_not_found_exception_of_yojson tree path)
      | _, "ResourceNotReadyException" ->
          `ResourceNotReadyException
            (Json_deserializers.resource_not_ready_exception_of_yojson tree path)
      | _, "ThrottlingException" ->
          `ThrottlingException (Json_deserializers.throttling_exception_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : list_dataset_labels_request) =
    let input = Json_serializers.list_dataset_labels_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"RekognitionService.ListDatasetLabels" ~service
      ~context ~input ~output_deserializer:Json_deserializers.list_dataset_labels_response_of_yojson
      ~error_deserializer

  let request_with_metadata context (request : list_dataset_labels_request) =
    let input = Json_serializers.list_dataset_labels_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata
      ~shape_name:"RekognitionService.ListDatasetLabels" ~service ~context ~input
      ~output_deserializer:Json_deserializers.list_dataset_labels_response_of_yojson
      ~error_deserializer
end

module ListFaces = struct
  let error_to_string = function
    | `AccessDeniedException _ -> "com.amazonaws.rekognition#AccessDeniedException"
    | `InternalServerError _ -> "com.amazonaws.rekognition#InternalServerError"
    | `InvalidPaginationTokenException _ ->
        "com.amazonaws.rekognition#InvalidPaginationTokenException"
    | `InvalidParameterException _ -> "com.amazonaws.rekognition#InvalidParameterException"
    | `ProvisionedThroughputExceededException _ ->
        "com.amazonaws.rekognition#ProvisionedThroughputExceededException"
    | `ResourceNotFoundException _ -> "com.amazonaws.rekognition#ResourceNotFoundException"
    | `ThrottlingException _ -> "com.amazonaws.rekognition#ThrottlingException"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "AccessDeniedException" ->
          `AccessDeniedException (Json_deserializers.access_denied_exception_of_yojson tree path)
      | _, "InternalServerError" ->
          `InternalServerError (Json_deserializers.internal_server_error_of_yojson tree path)
      | _, "InvalidPaginationTokenException" ->
          `InvalidPaginationTokenException
            (Json_deserializers.invalid_pagination_token_exception_of_yojson tree path)
      | _, "InvalidParameterException" ->
          `InvalidParameterException
            (Json_deserializers.invalid_parameter_exception_of_yojson tree path)
      | _, "ProvisionedThroughputExceededException" ->
          `ProvisionedThroughputExceededException
            (Json_deserializers.provisioned_throughput_exceeded_exception_of_yojson tree path)
      | _, "ResourceNotFoundException" ->
          `ResourceNotFoundException
            (Json_deserializers.resource_not_found_exception_of_yojson tree path)
      | _, "ThrottlingException" ->
          `ThrottlingException (Json_deserializers.throttling_exception_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : list_faces_request) =
    let input = Json_serializers.list_faces_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"RekognitionService.ListFaces" ~service ~context
      ~input ~output_deserializer:Json_deserializers.list_faces_response_of_yojson
      ~error_deserializer

  let request_with_metadata context (request : list_faces_request) =
    let input = Json_serializers.list_faces_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata ~shape_name:"RekognitionService.ListFaces"
      ~service ~context ~input ~output_deserializer:Json_deserializers.list_faces_response_of_yojson
      ~error_deserializer
end

module ListMediaAnalysisJobs = struct
  let error_to_string = function
    | `AccessDeniedException _ -> "com.amazonaws.rekognition#AccessDeniedException"
    | `InternalServerError _ -> "com.amazonaws.rekognition#InternalServerError"
    | `InvalidPaginationTokenException _ ->
        "com.amazonaws.rekognition#InvalidPaginationTokenException"
    | `InvalidParameterException _ -> "com.amazonaws.rekognition#InvalidParameterException"
    | `ProvisionedThroughputExceededException _ ->
        "com.amazonaws.rekognition#ProvisionedThroughputExceededException"
    | `ThrottlingException _ -> "com.amazonaws.rekognition#ThrottlingException"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "AccessDeniedException" ->
          `AccessDeniedException (Json_deserializers.access_denied_exception_of_yojson tree path)
      | _, "InternalServerError" ->
          `InternalServerError (Json_deserializers.internal_server_error_of_yojson tree path)
      | _, "InvalidPaginationTokenException" ->
          `InvalidPaginationTokenException
            (Json_deserializers.invalid_pagination_token_exception_of_yojson tree path)
      | _, "InvalidParameterException" ->
          `InvalidParameterException
            (Json_deserializers.invalid_parameter_exception_of_yojson tree path)
      | _, "ProvisionedThroughputExceededException" ->
          `ProvisionedThroughputExceededException
            (Json_deserializers.provisioned_throughput_exceeded_exception_of_yojson tree path)
      | _, "ThrottlingException" ->
          `ThrottlingException (Json_deserializers.throttling_exception_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : list_media_analysis_jobs_request) =
    let input = Json_serializers.list_media_analysis_jobs_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"RekognitionService.ListMediaAnalysisJobs"
      ~service ~context ~input
      ~output_deserializer:Json_deserializers.list_media_analysis_jobs_response_of_yojson
      ~error_deserializer

  let request_with_metadata context (request : list_media_analysis_jobs_request) =
    let input = Json_serializers.list_media_analysis_jobs_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata
      ~shape_name:"RekognitionService.ListMediaAnalysisJobs" ~service ~context ~input
      ~output_deserializer:Json_deserializers.list_media_analysis_jobs_response_of_yojson
      ~error_deserializer
end

module ListProjectPolicies = struct
  let error_to_string = function
    | `AccessDeniedException _ -> "com.amazonaws.rekognition#AccessDeniedException"
    | `InternalServerError _ -> "com.amazonaws.rekognition#InternalServerError"
    | `InvalidPaginationTokenException _ ->
        "com.amazonaws.rekognition#InvalidPaginationTokenException"
    | `InvalidParameterException _ -> "com.amazonaws.rekognition#InvalidParameterException"
    | `ProvisionedThroughputExceededException _ ->
        "com.amazonaws.rekognition#ProvisionedThroughputExceededException"
    | `ResourceNotFoundException _ -> "com.amazonaws.rekognition#ResourceNotFoundException"
    | `ThrottlingException _ -> "com.amazonaws.rekognition#ThrottlingException"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "AccessDeniedException" ->
          `AccessDeniedException (Json_deserializers.access_denied_exception_of_yojson tree path)
      | _, "InternalServerError" ->
          `InternalServerError (Json_deserializers.internal_server_error_of_yojson tree path)
      | _, "InvalidPaginationTokenException" ->
          `InvalidPaginationTokenException
            (Json_deserializers.invalid_pagination_token_exception_of_yojson tree path)
      | _, "InvalidParameterException" ->
          `InvalidParameterException
            (Json_deserializers.invalid_parameter_exception_of_yojson tree path)
      | _, "ProvisionedThroughputExceededException" ->
          `ProvisionedThroughputExceededException
            (Json_deserializers.provisioned_throughput_exceeded_exception_of_yojson tree path)
      | _, "ResourceNotFoundException" ->
          `ResourceNotFoundException
            (Json_deserializers.resource_not_found_exception_of_yojson tree path)
      | _, "ThrottlingException" ->
          `ThrottlingException (Json_deserializers.throttling_exception_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : list_project_policies_request) =
    let input = Json_serializers.list_project_policies_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"RekognitionService.ListProjectPolicies"
      ~service ~context ~input
      ~output_deserializer:Json_deserializers.list_project_policies_response_of_yojson
      ~error_deserializer

  let request_with_metadata context (request : list_project_policies_request) =
    let input = Json_serializers.list_project_policies_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata
      ~shape_name:"RekognitionService.ListProjectPolicies" ~service ~context ~input
      ~output_deserializer:Json_deserializers.list_project_policies_response_of_yojson
      ~error_deserializer
end

module ListStreamProcessors = struct
  let error_to_string = function
    | `AccessDeniedException _ -> "com.amazonaws.rekognition#AccessDeniedException"
    | `InternalServerError _ -> "com.amazonaws.rekognition#InternalServerError"
    | `InvalidPaginationTokenException _ ->
        "com.amazonaws.rekognition#InvalidPaginationTokenException"
    | `InvalidParameterException _ -> "com.amazonaws.rekognition#InvalidParameterException"
    | `ProvisionedThroughputExceededException _ ->
        "com.amazonaws.rekognition#ProvisionedThroughputExceededException"
    | `ThrottlingException _ -> "com.amazonaws.rekognition#ThrottlingException"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "AccessDeniedException" ->
          `AccessDeniedException (Json_deserializers.access_denied_exception_of_yojson tree path)
      | _, "InternalServerError" ->
          `InternalServerError (Json_deserializers.internal_server_error_of_yojson tree path)
      | _, "InvalidPaginationTokenException" ->
          `InvalidPaginationTokenException
            (Json_deserializers.invalid_pagination_token_exception_of_yojson tree path)
      | _, "InvalidParameterException" ->
          `InvalidParameterException
            (Json_deserializers.invalid_parameter_exception_of_yojson tree path)
      | _, "ProvisionedThroughputExceededException" ->
          `ProvisionedThroughputExceededException
            (Json_deserializers.provisioned_throughput_exceeded_exception_of_yojson tree path)
      | _, "ThrottlingException" ->
          `ThrottlingException (Json_deserializers.throttling_exception_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : list_stream_processors_request) =
    let input = Json_serializers.list_stream_processors_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"RekognitionService.ListStreamProcessors"
      ~service ~context ~input
      ~output_deserializer:Json_deserializers.list_stream_processors_response_of_yojson
      ~error_deserializer

  let request_with_metadata context (request : list_stream_processors_request) =
    let input = Json_serializers.list_stream_processors_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata
      ~shape_name:"RekognitionService.ListStreamProcessors" ~service ~context ~input
      ~output_deserializer:Json_deserializers.list_stream_processors_response_of_yojson
      ~error_deserializer
end

module ListTagsForResource = struct
  let error_to_string = function
    | `AccessDeniedException _ -> "com.amazonaws.rekognition#AccessDeniedException"
    | `InternalServerError _ -> "com.amazonaws.rekognition#InternalServerError"
    | `InvalidParameterException _ -> "com.amazonaws.rekognition#InvalidParameterException"
    | `ProvisionedThroughputExceededException _ ->
        "com.amazonaws.rekognition#ProvisionedThroughputExceededException"
    | `ResourceNotFoundException _ -> "com.amazonaws.rekognition#ResourceNotFoundException"
    | `ThrottlingException _ -> "com.amazonaws.rekognition#ThrottlingException"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "AccessDeniedException" ->
          `AccessDeniedException (Json_deserializers.access_denied_exception_of_yojson tree path)
      | _, "InternalServerError" ->
          `InternalServerError (Json_deserializers.internal_server_error_of_yojson tree path)
      | _, "InvalidParameterException" ->
          `InvalidParameterException
            (Json_deserializers.invalid_parameter_exception_of_yojson tree path)
      | _, "ProvisionedThroughputExceededException" ->
          `ProvisionedThroughputExceededException
            (Json_deserializers.provisioned_throughput_exceeded_exception_of_yojson tree path)
      | _, "ResourceNotFoundException" ->
          `ResourceNotFoundException
            (Json_deserializers.resource_not_found_exception_of_yojson tree path)
      | _, "ThrottlingException" ->
          `ThrottlingException (Json_deserializers.throttling_exception_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : list_tags_for_resource_request) =
    let input = Json_serializers.list_tags_for_resource_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"RekognitionService.ListTagsForResource"
      ~service ~context ~input
      ~output_deserializer:Json_deserializers.list_tags_for_resource_response_of_yojson
      ~error_deserializer

  let request_with_metadata context (request : list_tags_for_resource_request) =
    let input = Json_serializers.list_tags_for_resource_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata
      ~shape_name:"RekognitionService.ListTagsForResource" ~service ~context ~input
      ~output_deserializer:Json_deserializers.list_tags_for_resource_response_of_yojson
      ~error_deserializer
end

module ListUsers = struct
  let error_to_string = function
    | `AccessDeniedException _ -> "com.amazonaws.rekognition#AccessDeniedException"
    | `InternalServerError _ -> "com.amazonaws.rekognition#InternalServerError"
    | `InvalidPaginationTokenException _ ->
        "com.amazonaws.rekognition#InvalidPaginationTokenException"
    | `InvalidParameterException _ -> "com.amazonaws.rekognition#InvalidParameterException"
    | `ProvisionedThroughputExceededException _ ->
        "com.amazonaws.rekognition#ProvisionedThroughputExceededException"
    | `ResourceNotFoundException _ -> "com.amazonaws.rekognition#ResourceNotFoundException"
    | `ThrottlingException _ -> "com.amazonaws.rekognition#ThrottlingException"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "AccessDeniedException" ->
          `AccessDeniedException (Json_deserializers.access_denied_exception_of_yojson tree path)
      | _, "InternalServerError" ->
          `InternalServerError (Json_deserializers.internal_server_error_of_yojson tree path)
      | _, "InvalidPaginationTokenException" ->
          `InvalidPaginationTokenException
            (Json_deserializers.invalid_pagination_token_exception_of_yojson tree path)
      | _, "InvalidParameterException" ->
          `InvalidParameterException
            (Json_deserializers.invalid_parameter_exception_of_yojson tree path)
      | _, "ProvisionedThroughputExceededException" ->
          `ProvisionedThroughputExceededException
            (Json_deserializers.provisioned_throughput_exceeded_exception_of_yojson tree path)
      | _, "ResourceNotFoundException" ->
          `ResourceNotFoundException
            (Json_deserializers.resource_not_found_exception_of_yojson tree path)
      | _, "ThrottlingException" ->
          `ThrottlingException (Json_deserializers.throttling_exception_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : list_users_request) =
    let input = Json_serializers.list_users_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"RekognitionService.ListUsers" ~service ~context
      ~input ~output_deserializer:Json_deserializers.list_users_response_of_yojson
      ~error_deserializer

  let request_with_metadata context (request : list_users_request) =
    let input = Json_serializers.list_users_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata ~shape_name:"RekognitionService.ListUsers"
      ~service ~context ~input ~output_deserializer:Json_deserializers.list_users_response_of_yojson
      ~error_deserializer
end

module PutProjectPolicy = struct
  let error_to_string = function
    | `AccessDeniedException _ -> "com.amazonaws.rekognition#AccessDeniedException"
    | `InternalServerError _ -> "com.amazonaws.rekognition#InternalServerError"
    | `InvalidParameterException _ -> "com.amazonaws.rekognition#InvalidParameterException"
    | `InvalidPolicyRevisionIdException _ ->
        "com.amazonaws.rekognition#InvalidPolicyRevisionIdException"
    | `LimitExceededException _ -> "com.amazonaws.rekognition#LimitExceededException"
    | `MalformedPolicyDocumentException _ ->
        "com.amazonaws.rekognition#MalformedPolicyDocumentException"
    | `ProvisionedThroughputExceededException _ ->
        "com.amazonaws.rekognition#ProvisionedThroughputExceededException"
    | `ResourceAlreadyExistsException _ ->
        "com.amazonaws.rekognition#ResourceAlreadyExistsException"
    | `ResourceNotFoundException _ -> "com.amazonaws.rekognition#ResourceNotFoundException"
    | `ServiceQuotaExceededException _ -> "com.amazonaws.rekognition#ServiceQuotaExceededException"
    | `ThrottlingException _ -> "com.amazonaws.rekognition#ThrottlingException"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "AccessDeniedException" ->
          `AccessDeniedException (Json_deserializers.access_denied_exception_of_yojson tree path)
      | _, "InternalServerError" ->
          `InternalServerError (Json_deserializers.internal_server_error_of_yojson tree path)
      | _, "InvalidParameterException" ->
          `InvalidParameterException
            (Json_deserializers.invalid_parameter_exception_of_yojson tree path)
      | _, "InvalidPolicyRevisionIdException" ->
          `InvalidPolicyRevisionIdException
            (Json_deserializers.invalid_policy_revision_id_exception_of_yojson tree path)
      | _, "LimitExceededException" ->
          `LimitExceededException (Json_deserializers.limit_exceeded_exception_of_yojson tree path)
      | _, "MalformedPolicyDocumentException" ->
          `MalformedPolicyDocumentException
            (Json_deserializers.malformed_policy_document_exception_of_yojson tree path)
      | _, "ProvisionedThroughputExceededException" ->
          `ProvisionedThroughputExceededException
            (Json_deserializers.provisioned_throughput_exceeded_exception_of_yojson tree path)
      | _, "ResourceAlreadyExistsException" ->
          `ResourceAlreadyExistsException
            (Json_deserializers.resource_already_exists_exception_of_yojson tree path)
      | _, "ResourceNotFoundException" ->
          `ResourceNotFoundException
            (Json_deserializers.resource_not_found_exception_of_yojson tree path)
      | _, "ServiceQuotaExceededException" ->
          `ServiceQuotaExceededException
            (Json_deserializers.service_quota_exceeded_exception_of_yojson tree path)
      | _, "ThrottlingException" ->
          `ThrottlingException (Json_deserializers.throttling_exception_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : put_project_policy_request) =
    let input = Json_serializers.put_project_policy_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"RekognitionService.PutProjectPolicy" ~service
      ~context ~input ~output_deserializer:Json_deserializers.put_project_policy_response_of_yojson
      ~error_deserializer

  let request_with_metadata context (request : put_project_policy_request) =
    let input = Json_serializers.put_project_policy_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata
      ~shape_name:"RekognitionService.PutProjectPolicy" ~service ~context ~input
      ~output_deserializer:Json_deserializers.put_project_policy_response_of_yojson
      ~error_deserializer
end

module RecognizeCelebrities = struct
  let error_to_string = function
    | `AccessDeniedException _ -> "com.amazonaws.rekognition#AccessDeniedException"
    | `ImageTooLargeException _ -> "com.amazonaws.rekognition#ImageTooLargeException"
    | `InternalServerError _ -> "com.amazonaws.rekognition#InternalServerError"
    | `InvalidImageFormatException _ -> "com.amazonaws.rekognition#InvalidImageFormatException"
    | `InvalidParameterException _ -> "com.amazonaws.rekognition#InvalidParameterException"
    | `InvalidS3ObjectException _ -> "com.amazonaws.rekognition#InvalidS3ObjectException"
    | `ProvisionedThroughputExceededException _ ->
        "com.amazonaws.rekognition#ProvisionedThroughputExceededException"
    | `ThrottlingException _ -> "com.amazonaws.rekognition#ThrottlingException"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "AccessDeniedException" ->
          `AccessDeniedException (Json_deserializers.access_denied_exception_of_yojson tree path)
      | _, "ImageTooLargeException" ->
          `ImageTooLargeException (Json_deserializers.image_too_large_exception_of_yojson tree path)
      | _, "InternalServerError" ->
          `InternalServerError (Json_deserializers.internal_server_error_of_yojson tree path)
      | _, "InvalidImageFormatException" ->
          `InvalidImageFormatException
            (Json_deserializers.invalid_image_format_exception_of_yojson tree path)
      | _, "InvalidParameterException" ->
          `InvalidParameterException
            (Json_deserializers.invalid_parameter_exception_of_yojson tree path)
      | _, "InvalidS3ObjectException" ->
          `InvalidS3ObjectException
            (Json_deserializers.invalid_s3_object_exception_of_yojson tree path)
      | _, "ProvisionedThroughputExceededException" ->
          `ProvisionedThroughputExceededException
            (Json_deserializers.provisioned_throughput_exceeded_exception_of_yojson tree path)
      | _, "ThrottlingException" ->
          `ThrottlingException (Json_deserializers.throttling_exception_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : recognize_celebrities_request) =
    let input = Json_serializers.recognize_celebrities_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"RekognitionService.RecognizeCelebrities"
      ~service ~context ~input
      ~output_deserializer:Json_deserializers.recognize_celebrities_response_of_yojson
      ~error_deserializer

  let request_with_metadata context (request : recognize_celebrities_request) =
    let input = Json_serializers.recognize_celebrities_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata
      ~shape_name:"RekognitionService.RecognizeCelebrities" ~service ~context ~input
      ~output_deserializer:Json_deserializers.recognize_celebrities_response_of_yojson
      ~error_deserializer
end

module SearchFaces = struct
  let error_to_string = function
    | `AccessDeniedException _ -> "com.amazonaws.rekognition#AccessDeniedException"
    | `InternalServerError _ -> "com.amazonaws.rekognition#InternalServerError"
    | `InvalidParameterException _ -> "com.amazonaws.rekognition#InvalidParameterException"
    | `ProvisionedThroughputExceededException _ ->
        "com.amazonaws.rekognition#ProvisionedThroughputExceededException"
    | `ResourceNotFoundException _ -> "com.amazonaws.rekognition#ResourceNotFoundException"
    | `ThrottlingException _ -> "com.amazonaws.rekognition#ThrottlingException"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "AccessDeniedException" ->
          `AccessDeniedException (Json_deserializers.access_denied_exception_of_yojson tree path)
      | _, "InternalServerError" ->
          `InternalServerError (Json_deserializers.internal_server_error_of_yojson tree path)
      | _, "InvalidParameterException" ->
          `InvalidParameterException
            (Json_deserializers.invalid_parameter_exception_of_yojson tree path)
      | _, "ProvisionedThroughputExceededException" ->
          `ProvisionedThroughputExceededException
            (Json_deserializers.provisioned_throughput_exceeded_exception_of_yojson tree path)
      | _, "ResourceNotFoundException" ->
          `ResourceNotFoundException
            (Json_deserializers.resource_not_found_exception_of_yojson tree path)
      | _, "ThrottlingException" ->
          `ThrottlingException (Json_deserializers.throttling_exception_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : search_faces_request) =
    let input = Json_serializers.search_faces_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"RekognitionService.SearchFaces" ~service
      ~context ~input ~output_deserializer:Json_deserializers.search_faces_response_of_yojson
      ~error_deserializer

  let request_with_metadata context (request : search_faces_request) =
    let input = Json_serializers.search_faces_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata ~shape_name:"RekognitionService.SearchFaces"
      ~service ~context ~input
      ~output_deserializer:Json_deserializers.search_faces_response_of_yojson ~error_deserializer
end

module SearchFacesByImage = struct
  let error_to_string = function
    | `AccessDeniedException _ -> "com.amazonaws.rekognition#AccessDeniedException"
    | `ImageTooLargeException _ -> "com.amazonaws.rekognition#ImageTooLargeException"
    | `InternalServerError _ -> "com.amazonaws.rekognition#InternalServerError"
    | `InvalidImageFormatException _ -> "com.amazonaws.rekognition#InvalidImageFormatException"
    | `InvalidParameterException _ -> "com.amazonaws.rekognition#InvalidParameterException"
    | `InvalidS3ObjectException _ -> "com.amazonaws.rekognition#InvalidS3ObjectException"
    | `ProvisionedThroughputExceededException _ ->
        "com.amazonaws.rekognition#ProvisionedThroughputExceededException"
    | `ResourceNotFoundException _ -> "com.amazonaws.rekognition#ResourceNotFoundException"
    | `ThrottlingException _ -> "com.amazonaws.rekognition#ThrottlingException"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "AccessDeniedException" ->
          `AccessDeniedException (Json_deserializers.access_denied_exception_of_yojson tree path)
      | _, "ImageTooLargeException" ->
          `ImageTooLargeException (Json_deserializers.image_too_large_exception_of_yojson tree path)
      | _, "InternalServerError" ->
          `InternalServerError (Json_deserializers.internal_server_error_of_yojson tree path)
      | _, "InvalidImageFormatException" ->
          `InvalidImageFormatException
            (Json_deserializers.invalid_image_format_exception_of_yojson tree path)
      | _, "InvalidParameterException" ->
          `InvalidParameterException
            (Json_deserializers.invalid_parameter_exception_of_yojson tree path)
      | _, "InvalidS3ObjectException" ->
          `InvalidS3ObjectException
            (Json_deserializers.invalid_s3_object_exception_of_yojson tree path)
      | _, "ProvisionedThroughputExceededException" ->
          `ProvisionedThroughputExceededException
            (Json_deserializers.provisioned_throughput_exceeded_exception_of_yojson tree path)
      | _, "ResourceNotFoundException" ->
          `ResourceNotFoundException
            (Json_deserializers.resource_not_found_exception_of_yojson tree path)
      | _, "ThrottlingException" ->
          `ThrottlingException (Json_deserializers.throttling_exception_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : search_faces_by_image_request) =
    let input = Json_serializers.search_faces_by_image_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"RekognitionService.SearchFacesByImage" ~service
      ~context ~input
      ~output_deserializer:Json_deserializers.search_faces_by_image_response_of_yojson
      ~error_deserializer

  let request_with_metadata context (request : search_faces_by_image_request) =
    let input = Json_serializers.search_faces_by_image_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata
      ~shape_name:"RekognitionService.SearchFacesByImage" ~service ~context ~input
      ~output_deserializer:Json_deserializers.search_faces_by_image_response_of_yojson
      ~error_deserializer
end

module SearchUsers = struct
  let error_to_string = function
    | `AccessDeniedException _ -> "com.amazonaws.rekognition#AccessDeniedException"
    | `InternalServerError _ -> "com.amazonaws.rekognition#InternalServerError"
    | `InvalidParameterException _ -> "com.amazonaws.rekognition#InvalidParameterException"
    | `ProvisionedThroughputExceededException _ ->
        "com.amazonaws.rekognition#ProvisionedThroughputExceededException"
    | `ResourceNotFoundException _ -> "com.amazonaws.rekognition#ResourceNotFoundException"
    | `ThrottlingException _ -> "com.amazonaws.rekognition#ThrottlingException"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "AccessDeniedException" ->
          `AccessDeniedException (Json_deserializers.access_denied_exception_of_yojson tree path)
      | _, "InternalServerError" ->
          `InternalServerError (Json_deserializers.internal_server_error_of_yojson tree path)
      | _, "InvalidParameterException" ->
          `InvalidParameterException
            (Json_deserializers.invalid_parameter_exception_of_yojson tree path)
      | _, "ProvisionedThroughputExceededException" ->
          `ProvisionedThroughputExceededException
            (Json_deserializers.provisioned_throughput_exceeded_exception_of_yojson tree path)
      | _, "ResourceNotFoundException" ->
          `ResourceNotFoundException
            (Json_deserializers.resource_not_found_exception_of_yojson tree path)
      | _, "ThrottlingException" ->
          `ThrottlingException (Json_deserializers.throttling_exception_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : search_users_request) =
    let input = Json_serializers.search_users_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"RekognitionService.SearchUsers" ~service
      ~context ~input ~output_deserializer:Json_deserializers.search_users_response_of_yojson
      ~error_deserializer

  let request_with_metadata context (request : search_users_request) =
    let input = Json_serializers.search_users_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata ~shape_name:"RekognitionService.SearchUsers"
      ~service ~context ~input
      ~output_deserializer:Json_deserializers.search_users_response_of_yojson ~error_deserializer
end

module SearchUsersByImage = struct
  let error_to_string = function
    | `AccessDeniedException _ -> "com.amazonaws.rekognition#AccessDeniedException"
    | `ImageTooLargeException _ -> "com.amazonaws.rekognition#ImageTooLargeException"
    | `InternalServerError _ -> "com.amazonaws.rekognition#InternalServerError"
    | `InvalidImageFormatException _ -> "com.amazonaws.rekognition#InvalidImageFormatException"
    | `InvalidParameterException _ -> "com.amazonaws.rekognition#InvalidParameterException"
    | `InvalidS3ObjectException _ -> "com.amazonaws.rekognition#InvalidS3ObjectException"
    | `ProvisionedThroughputExceededException _ ->
        "com.amazonaws.rekognition#ProvisionedThroughputExceededException"
    | `ResourceNotFoundException _ -> "com.amazonaws.rekognition#ResourceNotFoundException"
    | `ThrottlingException _ -> "com.amazonaws.rekognition#ThrottlingException"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "AccessDeniedException" ->
          `AccessDeniedException (Json_deserializers.access_denied_exception_of_yojson tree path)
      | _, "ImageTooLargeException" ->
          `ImageTooLargeException (Json_deserializers.image_too_large_exception_of_yojson tree path)
      | _, "InternalServerError" ->
          `InternalServerError (Json_deserializers.internal_server_error_of_yojson tree path)
      | _, "InvalidImageFormatException" ->
          `InvalidImageFormatException
            (Json_deserializers.invalid_image_format_exception_of_yojson tree path)
      | _, "InvalidParameterException" ->
          `InvalidParameterException
            (Json_deserializers.invalid_parameter_exception_of_yojson tree path)
      | _, "InvalidS3ObjectException" ->
          `InvalidS3ObjectException
            (Json_deserializers.invalid_s3_object_exception_of_yojson tree path)
      | _, "ProvisionedThroughputExceededException" ->
          `ProvisionedThroughputExceededException
            (Json_deserializers.provisioned_throughput_exceeded_exception_of_yojson tree path)
      | _, "ResourceNotFoundException" ->
          `ResourceNotFoundException
            (Json_deserializers.resource_not_found_exception_of_yojson tree path)
      | _, "ThrottlingException" ->
          `ThrottlingException (Json_deserializers.throttling_exception_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : search_users_by_image_request) =
    let input = Json_serializers.search_users_by_image_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"RekognitionService.SearchUsersByImage" ~service
      ~context ~input
      ~output_deserializer:Json_deserializers.search_users_by_image_response_of_yojson
      ~error_deserializer

  let request_with_metadata context (request : search_users_by_image_request) =
    let input = Json_serializers.search_users_by_image_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata
      ~shape_name:"RekognitionService.SearchUsersByImage" ~service ~context ~input
      ~output_deserializer:Json_deserializers.search_users_by_image_response_of_yojson
      ~error_deserializer
end

module StartCelebrityRecognition = struct
  let error_to_string = function
    | `AccessDeniedException _ -> "com.amazonaws.rekognition#AccessDeniedException"
    | `IdempotentParameterMismatchException _ ->
        "com.amazonaws.rekognition#IdempotentParameterMismatchException"
    | `InternalServerError _ -> "com.amazonaws.rekognition#InternalServerError"
    | `InvalidParameterException _ -> "com.amazonaws.rekognition#InvalidParameterException"
    | `InvalidS3ObjectException _ -> "com.amazonaws.rekognition#InvalidS3ObjectException"
    | `LimitExceededException _ -> "com.amazonaws.rekognition#LimitExceededException"
    | `ProvisionedThroughputExceededException _ ->
        "com.amazonaws.rekognition#ProvisionedThroughputExceededException"
    | `ThrottlingException _ -> "com.amazonaws.rekognition#ThrottlingException"
    | `VideoTooLargeException _ -> "com.amazonaws.rekognition#VideoTooLargeException"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "AccessDeniedException" ->
          `AccessDeniedException (Json_deserializers.access_denied_exception_of_yojson tree path)
      | _, "IdempotentParameterMismatchException" ->
          `IdempotentParameterMismatchException
            (Json_deserializers.idempotent_parameter_mismatch_exception_of_yojson tree path)
      | _, "InternalServerError" ->
          `InternalServerError (Json_deserializers.internal_server_error_of_yojson tree path)
      | _, "InvalidParameterException" ->
          `InvalidParameterException
            (Json_deserializers.invalid_parameter_exception_of_yojson tree path)
      | _, "InvalidS3ObjectException" ->
          `InvalidS3ObjectException
            (Json_deserializers.invalid_s3_object_exception_of_yojson tree path)
      | _, "LimitExceededException" ->
          `LimitExceededException (Json_deserializers.limit_exceeded_exception_of_yojson tree path)
      | _, "ProvisionedThroughputExceededException" ->
          `ProvisionedThroughputExceededException
            (Json_deserializers.provisioned_throughput_exceeded_exception_of_yojson tree path)
      | _, "ThrottlingException" ->
          `ThrottlingException (Json_deserializers.throttling_exception_of_yojson tree path)
      | _, "VideoTooLargeException" ->
          `VideoTooLargeException (Json_deserializers.video_too_large_exception_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : start_celebrity_recognition_request) =
    let input = Json_serializers.start_celebrity_recognition_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"RekognitionService.StartCelebrityRecognition"
      ~service ~context ~input
      ~output_deserializer:Json_deserializers.start_celebrity_recognition_response_of_yojson
      ~error_deserializer

  let request_with_metadata context (request : start_celebrity_recognition_request) =
    let input = Json_serializers.start_celebrity_recognition_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata
      ~shape_name:"RekognitionService.StartCelebrityRecognition" ~service ~context ~input
      ~output_deserializer:Json_deserializers.start_celebrity_recognition_response_of_yojson
      ~error_deserializer
end

module StartContentModeration = struct
  let error_to_string = function
    | `AccessDeniedException _ -> "com.amazonaws.rekognition#AccessDeniedException"
    | `IdempotentParameterMismatchException _ ->
        "com.amazonaws.rekognition#IdempotentParameterMismatchException"
    | `InternalServerError _ -> "com.amazonaws.rekognition#InternalServerError"
    | `InvalidParameterException _ -> "com.amazonaws.rekognition#InvalidParameterException"
    | `InvalidS3ObjectException _ -> "com.amazonaws.rekognition#InvalidS3ObjectException"
    | `LimitExceededException _ -> "com.amazonaws.rekognition#LimitExceededException"
    | `ProvisionedThroughputExceededException _ ->
        "com.amazonaws.rekognition#ProvisionedThroughputExceededException"
    | `ThrottlingException _ -> "com.amazonaws.rekognition#ThrottlingException"
    | `VideoTooLargeException _ -> "com.amazonaws.rekognition#VideoTooLargeException"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "AccessDeniedException" ->
          `AccessDeniedException (Json_deserializers.access_denied_exception_of_yojson tree path)
      | _, "IdempotentParameterMismatchException" ->
          `IdempotentParameterMismatchException
            (Json_deserializers.idempotent_parameter_mismatch_exception_of_yojson tree path)
      | _, "InternalServerError" ->
          `InternalServerError (Json_deserializers.internal_server_error_of_yojson tree path)
      | _, "InvalidParameterException" ->
          `InvalidParameterException
            (Json_deserializers.invalid_parameter_exception_of_yojson tree path)
      | _, "InvalidS3ObjectException" ->
          `InvalidS3ObjectException
            (Json_deserializers.invalid_s3_object_exception_of_yojson tree path)
      | _, "LimitExceededException" ->
          `LimitExceededException (Json_deserializers.limit_exceeded_exception_of_yojson tree path)
      | _, "ProvisionedThroughputExceededException" ->
          `ProvisionedThroughputExceededException
            (Json_deserializers.provisioned_throughput_exceeded_exception_of_yojson tree path)
      | _, "ThrottlingException" ->
          `ThrottlingException (Json_deserializers.throttling_exception_of_yojson tree path)
      | _, "VideoTooLargeException" ->
          `VideoTooLargeException (Json_deserializers.video_too_large_exception_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : start_content_moderation_request) =
    let input = Json_serializers.start_content_moderation_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"RekognitionService.StartContentModeration"
      ~service ~context ~input
      ~output_deserializer:Json_deserializers.start_content_moderation_response_of_yojson
      ~error_deserializer

  let request_with_metadata context (request : start_content_moderation_request) =
    let input = Json_serializers.start_content_moderation_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata
      ~shape_name:"RekognitionService.StartContentModeration" ~service ~context ~input
      ~output_deserializer:Json_deserializers.start_content_moderation_response_of_yojson
      ~error_deserializer
end

module StartFaceDetection = struct
  let error_to_string = function
    | `AccessDeniedException _ -> "com.amazonaws.rekognition#AccessDeniedException"
    | `IdempotentParameterMismatchException _ ->
        "com.amazonaws.rekognition#IdempotentParameterMismatchException"
    | `InternalServerError _ -> "com.amazonaws.rekognition#InternalServerError"
    | `InvalidParameterException _ -> "com.amazonaws.rekognition#InvalidParameterException"
    | `InvalidS3ObjectException _ -> "com.amazonaws.rekognition#InvalidS3ObjectException"
    | `LimitExceededException _ -> "com.amazonaws.rekognition#LimitExceededException"
    | `ProvisionedThroughputExceededException _ ->
        "com.amazonaws.rekognition#ProvisionedThroughputExceededException"
    | `ThrottlingException _ -> "com.amazonaws.rekognition#ThrottlingException"
    | `VideoTooLargeException _ -> "com.amazonaws.rekognition#VideoTooLargeException"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "AccessDeniedException" ->
          `AccessDeniedException (Json_deserializers.access_denied_exception_of_yojson tree path)
      | _, "IdempotentParameterMismatchException" ->
          `IdempotentParameterMismatchException
            (Json_deserializers.idempotent_parameter_mismatch_exception_of_yojson tree path)
      | _, "InternalServerError" ->
          `InternalServerError (Json_deserializers.internal_server_error_of_yojson tree path)
      | _, "InvalidParameterException" ->
          `InvalidParameterException
            (Json_deserializers.invalid_parameter_exception_of_yojson tree path)
      | _, "InvalidS3ObjectException" ->
          `InvalidS3ObjectException
            (Json_deserializers.invalid_s3_object_exception_of_yojson tree path)
      | _, "LimitExceededException" ->
          `LimitExceededException (Json_deserializers.limit_exceeded_exception_of_yojson tree path)
      | _, "ProvisionedThroughputExceededException" ->
          `ProvisionedThroughputExceededException
            (Json_deserializers.provisioned_throughput_exceeded_exception_of_yojson tree path)
      | _, "ThrottlingException" ->
          `ThrottlingException (Json_deserializers.throttling_exception_of_yojson tree path)
      | _, "VideoTooLargeException" ->
          `VideoTooLargeException (Json_deserializers.video_too_large_exception_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : start_face_detection_request) =
    let input = Json_serializers.start_face_detection_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"RekognitionService.StartFaceDetection" ~service
      ~context ~input
      ~output_deserializer:Json_deserializers.start_face_detection_response_of_yojson
      ~error_deserializer

  let request_with_metadata context (request : start_face_detection_request) =
    let input = Json_serializers.start_face_detection_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata
      ~shape_name:"RekognitionService.StartFaceDetection" ~service ~context ~input
      ~output_deserializer:Json_deserializers.start_face_detection_response_of_yojson
      ~error_deserializer
end

module StartFaceSearch = struct
  let error_to_string = function
    | `AccessDeniedException _ -> "com.amazonaws.rekognition#AccessDeniedException"
    | `IdempotentParameterMismatchException _ ->
        "com.amazonaws.rekognition#IdempotentParameterMismatchException"
    | `InternalServerError _ -> "com.amazonaws.rekognition#InternalServerError"
    | `InvalidParameterException _ -> "com.amazonaws.rekognition#InvalidParameterException"
    | `InvalidS3ObjectException _ -> "com.amazonaws.rekognition#InvalidS3ObjectException"
    | `LimitExceededException _ -> "com.amazonaws.rekognition#LimitExceededException"
    | `ProvisionedThroughputExceededException _ ->
        "com.amazonaws.rekognition#ProvisionedThroughputExceededException"
    | `ResourceNotFoundException _ -> "com.amazonaws.rekognition#ResourceNotFoundException"
    | `ThrottlingException _ -> "com.amazonaws.rekognition#ThrottlingException"
    | `VideoTooLargeException _ -> "com.amazonaws.rekognition#VideoTooLargeException"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "AccessDeniedException" ->
          `AccessDeniedException (Json_deserializers.access_denied_exception_of_yojson tree path)
      | _, "IdempotentParameterMismatchException" ->
          `IdempotentParameterMismatchException
            (Json_deserializers.idempotent_parameter_mismatch_exception_of_yojson tree path)
      | _, "InternalServerError" ->
          `InternalServerError (Json_deserializers.internal_server_error_of_yojson tree path)
      | _, "InvalidParameterException" ->
          `InvalidParameterException
            (Json_deserializers.invalid_parameter_exception_of_yojson tree path)
      | _, "InvalidS3ObjectException" ->
          `InvalidS3ObjectException
            (Json_deserializers.invalid_s3_object_exception_of_yojson tree path)
      | _, "LimitExceededException" ->
          `LimitExceededException (Json_deserializers.limit_exceeded_exception_of_yojson tree path)
      | _, "ProvisionedThroughputExceededException" ->
          `ProvisionedThroughputExceededException
            (Json_deserializers.provisioned_throughput_exceeded_exception_of_yojson tree path)
      | _, "ResourceNotFoundException" ->
          `ResourceNotFoundException
            (Json_deserializers.resource_not_found_exception_of_yojson tree path)
      | _, "ThrottlingException" ->
          `ThrottlingException (Json_deserializers.throttling_exception_of_yojson tree path)
      | _, "VideoTooLargeException" ->
          `VideoTooLargeException (Json_deserializers.video_too_large_exception_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : start_face_search_request) =
    let input = Json_serializers.start_face_search_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"RekognitionService.StartFaceSearch" ~service
      ~context ~input ~output_deserializer:Json_deserializers.start_face_search_response_of_yojson
      ~error_deserializer

  let request_with_metadata context (request : start_face_search_request) =
    let input = Json_serializers.start_face_search_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata
      ~shape_name:"RekognitionService.StartFaceSearch" ~service ~context ~input
      ~output_deserializer:Json_deserializers.start_face_search_response_of_yojson
      ~error_deserializer
end

module StartLabelDetection = struct
  let error_to_string = function
    | `AccessDeniedException _ -> "com.amazonaws.rekognition#AccessDeniedException"
    | `IdempotentParameterMismatchException _ ->
        "com.amazonaws.rekognition#IdempotentParameterMismatchException"
    | `InternalServerError _ -> "com.amazonaws.rekognition#InternalServerError"
    | `InvalidParameterException _ -> "com.amazonaws.rekognition#InvalidParameterException"
    | `InvalidS3ObjectException _ -> "com.amazonaws.rekognition#InvalidS3ObjectException"
    | `LimitExceededException _ -> "com.amazonaws.rekognition#LimitExceededException"
    | `ProvisionedThroughputExceededException _ ->
        "com.amazonaws.rekognition#ProvisionedThroughputExceededException"
    | `ThrottlingException _ -> "com.amazonaws.rekognition#ThrottlingException"
    | `VideoTooLargeException _ -> "com.amazonaws.rekognition#VideoTooLargeException"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "AccessDeniedException" ->
          `AccessDeniedException (Json_deserializers.access_denied_exception_of_yojson tree path)
      | _, "IdempotentParameterMismatchException" ->
          `IdempotentParameterMismatchException
            (Json_deserializers.idempotent_parameter_mismatch_exception_of_yojson tree path)
      | _, "InternalServerError" ->
          `InternalServerError (Json_deserializers.internal_server_error_of_yojson tree path)
      | _, "InvalidParameterException" ->
          `InvalidParameterException
            (Json_deserializers.invalid_parameter_exception_of_yojson tree path)
      | _, "InvalidS3ObjectException" ->
          `InvalidS3ObjectException
            (Json_deserializers.invalid_s3_object_exception_of_yojson tree path)
      | _, "LimitExceededException" ->
          `LimitExceededException (Json_deserializers.limit_exceeded_exception_of_yojson tree path)
      | _, "ProvisionedThroughputExceededException" ->
          `ProvisionedThroughputExceededException
            (Json_deserializers.provisioned_throughput_exceeded_exception_of_yojson tree path)
      | _, "ThrottlingException" ->
          `ThrottlingException (Json_deserializers.throttling_exception_of_yojson tree path)
      | _, "VideoTooLargeException" ->
          `VideoTooLargeException (Json_deserializers.video_too_large_exception_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : start_label_detection_request) =
    let input = Json_serializers.start_label_detection_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"RekognitionService.StartLabelDetection"
      ~service ~context ~input
      ~output_deserializer:Json_deserializers.start_label_detection_response_of_yojson
      ~error_deserializer

  let request_with_metadata context (request : start_label_detection_request) =
    let input = Json_serializers.start_label_detection_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata
      ~shape_name:"RekognitionService.StartLabelDetection" ~service ~context ~input
      ~output_deserializer:Json_deserializers.start_label_detection_response_of_yojson
      ~error_deserializer
end

module StartMediaAnalysisJob = struct
  let error_to_string = function
    | `AccessDeniedException _ -> "com.amazonaws.rekognition#AccessDeniedException"
    | `IdempotentParameterMismatchException _ ->
        "com.amazonaws.rekognition#IdempotentParameterMismatchException"
    | `InternalServerError _ -> "com.amazonaws.rekognition#InternalServerError"
    | `InvalidManifestException _ -> "com.amazonaws.rekognition#InvalidManifestException"
    | `InvalidParameterException _ -> "com.amazonaws.rekognition#InvalidParameterException"
    | `InvalidS3ObjectException _ -> "com.amazonaws.rekognition#InvalidS3ObjectException"
    | `LimitExceededException _ -> "com.amazonaws.rekognition#LimitExceededException"
    | `ProvisionedThroughputExceededException _ ->
        "com.amazonaws.rekognition#ProvisionedThroughputExceededException"
    | `ResourceNotFoundException _ -> "com.amazonaws.rekognition#ResourceNotFoundException"
    | `ResourceNotReadyException _ -> "com.amazonaws.rekognition#ResourceNotReadyException"
    | `ThrottlingException _ -> "com.amazonaws.rekognition#ThrottlingException"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "AccessDeniedException" ->
          `AccessDeniedException (Json_deserializers.access_denied_exception_of_yojson tree path)
      | _, "IdempotentParameterMismatchException" ->
          `IdempotentParameterMismatchException
            (Json_deserializers.idempotent_parameter_mismatch_exception_of_yojson tree path)
      | _, "InternalServerError" ->
          `InternalServerError (Json_deserializers.internal_server_error_of_yojson tree path)
      | _, "InvalidManifestException" ->
          `InvalidManifestException
            (Json_deserializers.invalid_manifest_exception_of_yojson tree path)
      | _, "InvalidParameterException" ->
          `InvalidParameterException
            (Json_deserializers.invalid_parameter_exception_of_yojson tree path)
      | _, "InvalidS3ObjectException" ->
          `InvalidS3ObjectException
            (Json_deserializers.invalid_s3_object_exception_of_yojson tree path)
      | _, "LimitExceededException" ->
          `LimitExceededException (Json_deserializers.limit_exceeded_exception_of_yojson tree path)
      | _, "ProvisionedThroughputExceededException" ->
          `ProvisionedThroughputExceededException
            (Json_deserializers.provisioned_throughput_exceeded_exception_of_yojson tree path)
      | _, "ResourceNotFoundException" ->
          `ResourceNotFoundException
            (Json_deserializers.resource_not_found_exception_of_yojson tree path)
      | _, "ResourceNotReadyException" ->
          `ResourceNotReadyException
            (Json_deserializers.resource_not_ready_exception_of_yojson tree path)
      | _, "ThrottlingException" ->
          `ThrottlingException (Json_deserializers.throttling_exception_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : start_media_analysis_job_request) =
    let input = Json_serializers.start_media_analysis_job_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"RekognitionService.StartMediaAnalysisJob"
      ~service ~context ~input
      ~output_deserializer:Json_deserializers.start_media_analysis_job_response_of_yojson
      ~error_deserializer

  let request_with_metadata context (request : start_media_analysis_job_request) =
    let input = Json_serializers.start_media_analysis_job_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata
      ~shape_name:"RekognitionService.StartMediaAnalysisJob" ~service ~context ~input
      ~output_deserializer:Json_deserializers.start_media_analysis_job_response_of_yojson
      ~error_deserializer
end

module StartPersonTracking = struct
  let error_to_string = function
    | `AccessDeniedException _ -> "com.amazonaws.rekognition#AccessDeniedException"
    | `IdempotentParameterMismatchException _ ->
        "com.amazonaws.rekognition#IdempotentParameterMismatchException"
    | `InternalServerError _ -> "com.amazonaws.rekognition#InternalServerError"
    | `InvalidParameterException _ -> "com.amazonaws.rekognition#InvalidParameterException"
    | `InvalidS3ObjectException _ -> "com.amazonaws.rekognition#InvalidS3ObjectException"
    | `LimitExceededException _ -> "com.amazonaws.rekognition#LimitExceededException"
    | `ProvisionedThroughputExceededException _ ->
        "com.amazonaws.rekognition#ProvisionedThroughputExceededException"
    | `ThrottlingException _ -> "com.amazonaws.rekognition#ThrottlingException"
    | `VideoTooLargeException _ -> "com.amazonaws.rekognition#VideoTooLargeException"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "AccessDeniedException" ->
          `AccessDeniedException (Json_deserializers.access_denied_exception_of_yojson tree path)
      | _, "IdempotentParameterMismatchException" ->
          `IdempotentParameterMismatchException
            (Json_deserializers.idempotent_parameter_mismatch_exception_of_yojson tree path)
      | _, "InternalServerError" ->
          `InternalServerError (Json_deserializers.internal_server_error_of_yojson tree path)
      | _, "InvalidParameterException" ->
          `InvalidParameterException
            (Json_deserializers.invalid_parameter_exception_of_yojson tree path)
      | _, "InvalidS3ObjectException" ->
          `InvalidS3ObjectException
            (Json_deserializers.invalid_s3_object_exception_of_yojson tree path)
      | _, "LimitExceededException" ->
          `LimitExceededException (Json_deserializers.limit_exceeded_exception_of_yojson tree path)
      | _, "ProvisionedThroughputExceededException" ->
          `ProvisionedThroughputExceededException
            (Json_deserializers.provisioned_throughput_exceeded_exception_of_yojson tree path)
      | _, "ThrottlingException" ->
          `ThrottlingException (Json_deserializers.throttling_exception_of_yojson tree path)
      | _, "VideoTooLargeException" ->
          `VideoTooLargeException (Json_deserializers.video_too_large_exception_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : start_person_tracking_request) =
    let input = Json_serializers.start_person_tracking_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"RekognitionService.StartPersonTracking"
      ~service ~context ~input
      ~output_deserializer:Json_deserializers.start_person_tracking_response_of_yojson
      ~error_deserializer

  let request_with_metadata context (request : start_person_tracking_request) =
    let input = Json_serializers.start_person_tracking_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata
      ~shape_name:"RekognitionService.StartPersonTracking" ~service ~context ~input
      ~output_deserializer:Json_deserializers.start_person_tracking_response_of_yojson
      ~error_deserializer
end

module StartProjectVersion = struct
  let error_to_string = function
    | `AccessDeniedException _ -> "com.amazonaws.rekognition#AccessDeniedException"
    | `InternalServerError _ -> "com.amazonaws.rekognition#InternalServerError"
    | `InvalidParameterException _ -> "com.amazonaws.rekognition#InvalidParameterException"
    | `LimitExceededException _ -> "com.amazonaws.rekognition#LimitExceededException"
    | `ProvisionedThroughputExceededException _ ->
        "com.amazonaws.rekognition#ProvisionedThroughputExceededException"
    | `ResourceInUseException _ -> "com.amazonaws.rekognition#ResourceInUseException"
    | `ResourceNotFoundException _ -> "com.amazonaws.rekognition#ResourceNotFoundException"
    | `ThrottlingException _ -> "com.amazonaws.rekognition#ThrottlingException"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "AccessDeniedException" ->
          `AccessDeniedException (Json_deserializers.access_denied_exception_of_yojson tree path)
      | _, "InternalServerError" ->
          `InternalServerError (Json_deserializers.internal_server_error_of_yojson tree path)
      | _, "InvalidParameterException" ->
          `InvalidParameterException
            (Json_deserializers.invalid_parameter_exception_of_yojson tree path)
      | _, "LimitExceededException" ->
          `LimitExceededException (Json_deserializers.limit_exceeded_exception_of_yojson tree path)
      | _, "ProvisionedThroughputExceededException" ->
          `ProvisionedThroughputExceededException
            (Json_deserializers.provisioned_throughput_exceeded_exception_of_yojson tree path)
      | _, "ResourceInUseException" ->
          `ResourceInUseException (Json_deserializers.resource_in_use_exception_of_yojson tree path)
      | _, "ResourceNotFoundException" ->
          `ResourceNotFoundException
            (Json_deserializers.resource_not_found_exception_of_yojson tree path)
      | _, "ThrottlingException" ->
          `ThrottlingException (Json_deserializers.throttling_exception_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : start_project_version_request) =
    let input = Json_serializers.start_project_version_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"RekognitionService.StartProjectVersion"
      ~service ~context ~input
      ~output_deserializer:Json_deserializers.start_project_version_response_of_yojson
      ~error_deserializer

  let request_with_metadata context (request : start_project_version_request) =
    let input = Json_serializers.start_project_version_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata
      ~shape_name:"RekognitionService.StartProjectVersion" ~service ~context ~input
      ~output_deserializer:Json_deserializers.start_project_version_response_of_yojson
      ~error_deserializer
end

module StartSegmentDetection = struct
  let error_to_string = function
    | `AccessDeniedException _ -> "com.amazonaws.rekognition#AccessDeniedException"
    | `IdempotentParameterMismatchException _ ->
        "com.amazonaws.rekognition#IdempotentParameterMismatchException"
    | `InternalServerError _ -> "com.amazonaws.rekognition#InternalServerError"
    | `InvalidParameterException _ -> "com.amazonaws.rekognition#InvalidParameterException"
    | `InvalidS3ObjectException _ -> "com.amazonaws.rekognition#InvalidS3ObjectException"
    | `LimitExceededException _ -> "com.amazonaws.rekognition#LimitExceededException"
    | `ProvisionedThroughputExceededException _ ->
        "com.amazonaws.rekognition#ProvisionedThroughputExceededException"
    | `ThrottlingException _ -> "com.amazonaws.rekognition#ThrottlingException"
    | `VideoTooLargeException _ -> "com.amazonaws.rekognition#VideoTooLargeException"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "AccessDeniedException" ->
          `AccessDeniedException (Json_deserializers.access_denied_exception_of_yojson tree path)
      | _, "IdempotentParameterMismatchException" ->
          `IdempotentParameterMismatchException
            (Json_deserializers.idempotent_parameter_mismatch_exception_of_yojson tree path)
      | _, "InternalServerError" ->
          `InternalServerError (Json_deserializers.internal_server_error_of_yojson tree path)
      | _, "InvalidParameterException" ->
          `InvalidParameterException
            (Json_deserializers.invalid_parameter_exception_of_yojson tree path)
      | _, "InvalidS3ObjectException" ->
          `InvalidS3ObjectException
            (Json_deserializers.invalid_s3_object_exception_of_yojson tree path)
      | _, "LimitExceededException" ->
          `LimitExceededException (Json_deserializers.limit_exceeded_exception_of_yojson tree path)
      | _, "ProvisionedThroughputExceededException" ->
          `ProvisionedThroughputExceededException
            (Json_deserializers.provisioned_throughput_exceeded_exception_of_yojson tree path)
      | _, "ThrottlingException" ->
          `ThrottlingException (Json_deserializers.throttling_exception_of_yojson tree path)
      | _, "VideoTooLargeException" ->
          `VideoTooLargeException (Json_deserializers.video_too_large_exception_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : start_segment_detection_request) =
    let input = Json_serializers.start_segment_detection_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"RekognitionService.StartSegmentDetection"
      ~service ~context ~input
      ~output_deserializer:Json_deserializers.start_segment_detection_response_of_yojson
      ~error_deserializer

  let request_with_metadata context (request : start_segment_detection_request) =
    let input = Json_serializers.start_segment_detection_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata
      ~shape_name:"RekognitionService.StartSegmentDetection" ~service ~context ~input
      ~output_deserializer:Json_deserializers.start_segment_detection_response_of_yojson
      ~error_deserializer
end

module StartStreamProcessor = struct
  let error_to_string = function
    | `AccessDeniedException _ -> "com.amazonaws.rekognition#AccessDeniedException"
    | `InternalServerError _ -> "com.amazonaws.rekognition#InternalServerError"
    | `InvalidParameterException _ -> "com.amazonaws.rekognition#InvalidParameterException"
    | `ProvisionedThroughputExceededException _ ->
        "com.amazonaws.rekognition#ProvisionedThroughputExceededException"
    | `ResourceInUseException _ -> "com.amazonaws.rekognition#ResourceInUseException"
    | `ResourceNotFoundException _ -> "com.amazonaws.rekognition#ResourceNotFoundException"
    | `ThrottlingException _ -> "com.amazonaws.rekognition#ThrottlingException"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "AccessDeniedException" ->
          `AccessDeniedException (Json_deserializers.access_denied_exception_of_yojson tree path)
      | _, "InternalServerError" ->
          `InternalServerError (Json_deserializers.internal_server_error_of_yojson tree path)
      | _, "InvalidParameterException" ->
          `InvalidParameterException
            (Json_deserializers.invalid_parameter_exception_of_yojson tree path)
      | _, "ProvisionedThroughputExceededException" ->
          `ProvisionedThroughputExceededException
            (Json_deserializers.provisioned_throughput_exceeded_exception_of_yojson tree path)
      | _, "ResourceInUseException" ->
          `ResourceInUseException (Json_deserializers.resource_in_use_exception_of_yojson tree path)
      | _, "ResourceNotFoundException" ->
          `ResourceNotFoundException
            (Json_deserializers.resource_not_found_exception_of_yojson tree path)
      | _, "ThrottlingException" ->
          `ThrottlingException (Json_deserializers.throttling_exception_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : start_stream_processor_request) =
    let input = Json_serializers.start_stream_processor_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"RekognitionService.StartStreamProcessor"
      ~service ~context ~input
      ~output_deserializer:Json_deserializers.start_stream_processor_response_of_yojson
      ~error_deserializer

  let request_with_metadata context (request : start_stream_processor_request) =
    let input = Json_serializers.start_stream_processor_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata
      ~shape_name:"RekognitionService.StartStreamProcessor" ~service ~context ~input
      ~output_deserializer:Json_deserializers.start_stream_processor_response_of_yojson
      ~error_deserializer
end

module StartTextDetection = struct
  let error_to_string = function
    | `AccessDeniedException _ -> "com.amazonaws.rekognition#AccessDeniedException"
    | `IdempotentParameterMismatchException _ ->
        "com.amazonaws.rekognition#IdempotentParameterMismatchException"
    | `InternalServerError _ -> "com.amazonaws.rekognition#InternalServerError"
    | `InvalidParameterException _ -> "com.amazonaws.rekognition#InvalidParameterException"
    | `InvalidS3ObjectException _ -> "com.amazonaws.rekognition#InvalidS3ObjectException"
    | `LimitExceededException _ -> "com.amazonaws.rekognition#LimitExceededException"
    | `ProvisionedThroughputExceededException _ ->
        "com.amazonaws.rekognition#ProvisionedThroughputExceededException"
    | `ThrottlingException _ -> "com.amazonaws.rekognition#ThrottlingException"
    | `VideoTooLargeException _ -> "com.amazonaws.rekognition#VideoTooLargeException"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "AccessDeniedException" ->
          `AccessDeniedException (Json_deserializers.access_denied_exception_of_yojson tree path)
      | _, "IdempotentParameterMismatchException" ->
          `IdempotentParameterMismatchException
            (Json_deserializers.idempotent_parameter_mismatch_exception_of_yojson tree path)
      | _, "InternalServerError" ->
          `InternalServerError (Json_deserializers.internal_server_error_of_yojson tree path)
      | _, "InvalidParameterException" ->
          `InvalidParameterException
            (Json_deserializers.invalid_parameter_exception_of_yojson tree path)
      | _, "InvalidS3ObjectException" ->
          `InvalidS3ObjectException
            (Json_deserializers.invalid_s3_object_exception_of_yojson tree path)
      | _, "LimitExceededException" ->
          `LimitExceededException (Json_deserializers.limit_exceeded_exception_of_yojson tree path)
      | _, "ProvisionedThroughputExceededException" ->
          `ProvisionedThroughputExceededException
            (Json_deserializers.provisioned_throughput_exceeded_exception_of_yojson tree path)
      | _, "ThrottlingException" ->
          `ThrottlingException (Json_deserializers.throttling_exception_of_yojson tree path)
      | _, "VideoTooLargeException" ->
          `VideoTooLargeException (Json_deserializers.video_too_large_exception_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : start_text_detection_request) =
    let input = Json_serializers.start_text_detection_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"RekognitionService.StartTextDetection" ~service
      ~context ~input
      ~output_deserializer:Json_deserializers.start_text_detection_response_of_yojson
      ~error_deserializer

  let request_with_metadata context (request : start_text_detection_request) =
    let input = Json_serializers.start_text_detection_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata
      ~shape_name:"RekognitionService.StartTextDetection" ~service ~context ~input
      ~output_deserializer:Json_deserializers.start_text_detection_response_of_yojson
      ~error_deserializer
end

module StopProjectVersion = struct
  let error_to_string = function
    | `AccessDeniedException _ -> "com.amazonaws.rekognition#AccessDeniedException"
    | `InternalServerError _ -> "com.amazonaws.rekognition#InternalServerError"
    | `InvalidParameterException _ -> "com.amazonaws.rekognition#InvalidParameterException"
    | `ProvisionedThroughputExceededException _ ->
        "com.amazonaws.rekognition#ProvisionedThroughputExceededException"
    | `ResourceInUseException _ -> "com.amazonaws.rekognition#ResourceInUseException"
    | `ResourceNotFoundException _ -> "com.amazonaws.rekognition#ResourceNotFoundException"
    | `ThrottlingException _ -> "com.amazonaws.rekognition#ThrottlingException"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "AccessDeniedException" ->
          `AccessDeniedException (Json_deserializers.access_denied_exception_of_yojson tree path)
      | _, "InternalServerError" ->
          `InternalServerError (Json_deserializers.internal_server_error_of_yojson tree path)
      | _, "InvalidParameterException" ->
          `InvalidParameterException
            (Json_deserializers.invalid_parameter_exception_of_yojson tree path)
      | _, "ProvisionedThroughputExceededException" ->
          `ProvisionedThroughputExceededException
            (Json_deserializers.provisioned_throughput_exceeded_exception_of_yojson tree path)
      | _, "ResourceInUseException" ->
          `ResourceInUseException (Json_deserializers.resource_in_use_exception_of_yojson tree path)
      | _, "ResourceNotFoundException" ->
          `ResourceNotFoundException
            (Json_deserializers.resource_not_found_exception_of_yojson tree path)
      | _, "ThrottlingException" ->
          `ThrottlingException (Json_deserializers.throttling_exception_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : stop_project_version_request) =
    let input = Json_serializers.stop_project_version_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"RekognitionService.StopProjectVersion" ~service
      ~context ~input
      ~output_deserializer:Json_deserializers.stop_project_version_response_of_yojson
      ~error_deserializer

  let request_with_metadata context (request : stop_project_version_request) =
    let input = Json_serializers.stop_project_version_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata
      ~shape_name:"RekognitionService.StopProjectVersion" ~service ~context ~input
      ~output_deserializer:Json_deserializers.stop_project_version_response_of_yojson
      ~error_deserializer
end

module StopStreamProcessor = struct
  let error_to_string = function
    | `AccessDeniedException _ -> "com.amazonaws.rekognition#AccessDeniedException"
    | `InternalServerError _ -> "com.amazonaws.rekognition#InternalServerError"
    | `InvalidParameterException _ -> "com.amazonaws.rekognition#InvalidParameterException"
    | `ProvisionedThroughputExceededException _ ->
        "com.amazonaws.rekognition#ProvisionedThroughputExceededException"
    | `ResourceInUseException _ -> "com.amazonaws.rekognition#ResourceInUseException"
    | `ResourceNotFoundException _ -> "com.amazonaws.rekognition#ResourceNotFoundException"
    | `ThrottlingException _ -> "com.amazonaws.rekognition#ThrottlingException"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "AccessDeniedException" ->
          `AccessDeniedException (Json_deserializers.access_denied_exception_of_yojson tree path)
      | _, "InternalServerError" ->
          `InternalServerError (Json_deserializers.internal_server_error_of_yojson tree path)
      | _, "InvalidParameterException" ->
          `InvalidParameterException
            (Json_deserializers.invalid_parameter_exception_of_yojson tree path)
      | _, "ProvisionedThroughputExceededException" ->
          `ProvisionedThroughputExceededException
            (Json_deserializers.provisioned_throughput_exceeded_exception_of_yojson tree path)
      | _, "ResourceInUseException" ->
          `ResourceInUseException (Json_deserializers.resource_in_use_exception_of_yojson tree path)
      | _, "ResourceNotFoundException" ->
          `ResourceNotFoundException
            (Json_deserializers.resource_not_found_exception_of_yojson tree path)
      | _, "ThrottlingException" ->
          `ThrottlingException (Json_deserializers.throttling_exception_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : stop_stream_processor_request) =
    let input = Json_serializers.stop_stream_processor_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"RekognitionService.StopStreamProcessor"
      ~service ~context ~input
      ~output_deserializer:Json_deserializers.stop_stream_processor_response_of_yojson
      ~error_deserializer

  let request_with_metadata context (request : stop_stream_processor_request) =
    let input = Json_serializers.stop_stream_processor_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata
      ~shape_name:"RekognitionService.StopStreamProcessor" ~service ~context ~input
      ~output_deserializer:Json_deserializers.stop_stream_processor_response_of_yojson
      ~error_deserializer
end

module TagResource = struct
  let error_to_string = function
    | `AccessDeniedException _ -> "com.amazonaws.rekognition#AccessDeniedException"
    | `InternalServerError _ -> "com.amazonaws.rekognition#InternalServerError"
    | `InvalidParameterException _ -> "com.amazonaws.rekognition#InvalidParameterException"
    | `ProvisionedThroughputExceededException _ ->
        "com.amazonaws.rekognition#ProvisionedThroughputExceededException"
    | `ResourceNotFoundException _ -> "com.amazonaws.rekognition#ResourceNotFoundException"
    | `ServiceQuotaExceededException _ -> "com.amazonaws.rekognition#ServiceQuotaExceededException"
    | `ThrottlingException _ -> "com.amazonaws.rekognition#ThrottlingException"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "AccessDeniedException" ->
          `AccessDeniedException (Json_deserializers.access_denied_exception_of_yojson tree path)
      | _, "InternalServerError" ->
          `InternalServerError (Json_deserializers.internal_server_error_of_yojson tree path)
      | _, "InvalidParameterException" ->
          `InvalidParameterException
            (Json_deserializers.invalid_parameter_exception_of_yojson tree path)
      | _, "ProvisionedThroughputExceededException" ->
          `ProvisionedThroughputExceededException
            (Json_deserializers.provisioned_throughput_exceeded_exception_of_yojson tree path)
      | _, "ResourceNotFoundException" ->
          `ResourceNotFoundException
            (Json_deserializers.resource_not_found_exception_of_yojson tree path)
      | _, "ServiceQuotaExceededException" ->
          `ServiceQuotaExceededException
            (Json_deserializers.service_quota_exceeded_exception_of_yojson tree path)
      | _, "ThrottlingException" ->
          `ThrottlingException (Json_deserializers.throttling_exception_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : tag_resource_request) =
    let input = Json_serializers.tag_resource_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"RekognitionService.TagResource" ~service
      ~context ~input ~output_deserializer:Json_deserializers.tag_resource_response_of_yojson
      ~error_deserializer

  let request_with_metadata context (request : tag_resource_request) =
    let input = Json_serializers.tag_resource_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata ~shape_name:"RekognitionService.TagResource"
      ~service ~context ~input
      ~output_deserializer:Json_deserializers.tag_resource_response_of_yojson ~error_deserializer
end

module UntagResource = struct
  let error_to_string = function
    | `AccessDeniedException _ -> "com.amazonaws.rekognition#AccessDeniedException"
    | `InternalServerError _ -> "com.amazonaws.rekognition#InternalServerError"
    | `InvalidParameterException _ -> "com.amazonaws.rekognition#InvalidParameterException"
    | `ProvisionedThroughputExceededException _ ->
        "com.amazonaws.rekognition#ProvisionedThroughputExceededException"
    | `ResourceNotFoundException _ -> "com.amazonaws.rekognition#ResourceNotFoundException"
    | `ThrottlingException _ -> "com.amazonaws.rekognition#ThrottlingException"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "AccessDeniedException" ->
          `AccessDeniedException (Json_deserializers.access_denied_exception_of_yojson tree path)
      | _, "InternalServerError" ->
          `InternalServerError (Json_deserializers.internal_server_error_of_yojson tree path)
      | _, "InvalidParameterException" ->
          `InvalidParameterException
            (Json_deserializers.invalid_parameter_exception_of_yojson tree path)
      | _, "ProvisionedThroughputExceededException" ->
          `ProvisionedThroughputExceededException
            (Json_deserializers.provisioned_throughput_exceeded_exception_of_yojson tree path)
      | _, "ResourceNotFoundException" ->
          `ResourceNotFoundException
            (Json_deserializers.resource_not_found_exception_of_yojson tree path)
      | _, "ThrottlingException" ->
          `ThrottlingException (Json_deserializers.throttling_exception_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : untag_resource_request) =
    let input = Json_serializers.untag_resource_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"RekognitionService.UntagResource" ~service
      ~context ~input ~output_deserializer:Json_deserializers.untag_resource_response_of_yojson
      ~error_deserializer

  let request_with_metadata context (request : untag_resource_request) =
    let input = Json_serializers.untag_resource_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata ~shape_name:"RekognitionService.UntagResource"
      ~service ~context ~input
      ~output_deserializer:Json_deserializers.untag_resource_response_of_yojson ~error_deserializer
end

module UpdateDatasetEntries = struct
  let error_to_string = function
    | `AccessDeniedException _ -> "com.amazonaws.rekognition#AccessDeniedException"
    | `InternalServerError _ -> "com.amazonaws.rekognition#InternalServerError"
    | `InvalidParameterException _ -> "com.amazonaws.rekognition#InvalidParameterException"
    | `LimitExceededException _ -> "com.amazonaws.rekognition#LimitExceededException"
    | `ProvisionedThroughputExceededException _ ->
        "com.amazonaws.rekognition#ProvisionedThroughputExceededException"
    | `ResourceInUseException _ -> "com.amazonaws.rekognition#ResourceInUseException"
    | `ResourceNotFoundException _ -> "com.amazonaws.rekognition#ResourceNotFoundException"
    | `ThrottlingException _ -> "com.amazonaws.rekognition#ThrottlingException"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "AccessDeniedException" ->
          `AccessDeniedException (Json_deserializers.access_denied_exception_of_yojson tree path)
      | _, "InternalServerError" ->
          `InternalServerError (Json_deserializers.internal_server_error_of_yojson tree path)
      | _, "InvalidParameterException" ->
          `InvalidParameterException
            (Json_deserializers.invalid_parameter_exception_of_yojson tree path)
      | _, "LimitExceededException" ->
          `LimitExceededException (Json_deserializers.limit_exceeded_exception_of_yojson tree path)
      | _, "ProvisionedThroughputExceededException" ->
          `ProvisionedThroughputExceededException
            (Json_deserializers.provisioned_throughput_exceeded_exception_of_yojson tree path)
      | _, "ResourceInUseException" ->
          `ResourceInUseException (Json_deserializers.resource_in_use_exception_of_yojson tree path)
      | _, "ResourceNotFoundException" ->
          `ResourceNotFoundException
            (Json_deserializers.resource_not_found_exception_of_yojson tree path)
      | _, "ThrottlingException" ->
          `ThrottlingException (Json_deserializers.throttling_exception_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : update_dataset_entries_request) =
    let input = Json_serializers.update_dataset_entries_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"RekognitionService.UpdateDatasetEntries"
      ~service ~context ~input
      ~output_deserializer:Json_deserializers.update_dataset_entries_response_of_yojson
      ~error_deserializer

  let request_with_metadata context (request : update_dataset_entries_request) =
    let input = Json_serializers.update_dataset_entries_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata
      ~shape_name:"RekognitionService.UpdateDatasetEntries" ~service ~context ~input
      ~output_deserializer:Json_deserializers.update_dataset_entries_response_of_yojson
      ~error_deserializer
end

module UpdateStreamProcessor = struct
  let error_to_string = function
    | `AccessDeniedException _ -> "com.amazonaws.rekognition#AccessDeniedException"
    | `InternalServerError _ -> "com.amazonaws.rekognition#InternalServerError"
    | `InvalidParameterException _ -> "com.amazonaws.rekognition#InvalidParameterException"
    | `ProvisionedThroughputExceededException _ ->
        "com.amazonaws.rekognition#ProvisionedThroughputExceededException"
    | `ResourceInUseException _ -> "com.amazonaws.rekognition#ResourceInUseException"
    | `ResourceNotFoundException _ -> "com.amazonaws.rekognition#ResourceNotFoundException"
    | `ThrottlingException _ -> "com.amazonaws.rekognition#ThrottlingException"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "AccessDeniedException" ->
          `AccessDeniedException (Json_deserializers.access_denied_exception_of_yojson tree path)
      | _, "InternalServerError" ->
          `InternalServerError (Json_deserializers.internal_server_error_of_yojson tree path)
      | _, "InvalidParameterException" ->
          `InvalidParameterException
            (Json_deserializers.invalid_parameter_exception_of_yojson tree path)
      | _, "ProvisionedThroughputExceededException" ->
          `ProvisionedThroughputExceededException
            (Json_deserializers.provisioned_throughput_exceeded_exception_of_yojson tree path)
      | _, "ResourceInUseException" ->
          `ResourceInUseException (Json_deserializers.resource_in_use_exception_of_yojson tree path)
      | _, "ResourceNotFoundException" ->
          `ResourceNotFoundException
            (Json_deserializers.resource_not_found_exception_of_yojson tree path)
      | _, "ThrottlingException" ->
          `ThrottlingException (Json_deserializers.throttling_exception_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : update_stream_processor_request) =
    let input = Json_serializers.update_stream_processor_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"RekognitionService.UpdateStreamProcessor"
      ~service ~context ~input
      ~output_deserializer:Json_deserializers.update_stream_processor_response_of_yojson
      ~error_deserializer

  let request_with_metadata context (request : update_stream_processor_request) =
    let input = Json_serializers.update_stream_processor_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata
      ~shape_name:"RekognitionService.UpdateStreamProcessor" ~service ~context ~input
      ~output_deserializer:Json_deserializers.update_stream_processor_response_of_yojson
      ~error_deserializer
end
