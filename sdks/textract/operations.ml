open Types
open Service_metadata

module AnalyzeDocument = struct
  let error_to_string = function
    | `AccessDeniedException _ -> "com.amazonaws.textract#AccessDeniedException"
    | `BadDocumentException _ -> "com.amazonaws.textract#BadDocumentException"
    | `DocumentTooLargeException _ -> "com.amazonaws.textract#DocumentTooLargeException"
    | `HumanLoopQuotaExceededException _ -> "com.amazonaws.textract#HumanLoopQuotaExceededException"
    | `InternalServerError _ -> "com.amazonaws.textract#InternalServerError"
    | `InvalidParameterException _ -> "com.amazonaws.textract#InvalidParameterException"
    | `InvalidS3ObjectException _ -> "com.amazonaws.textract#InvalidS3ObjectException"
    | `ProvisionedThroughputExceededException _ ->
        "com.amazonaws.textract#ProvisionedThroughputExceededException"
    | `ThrottlingException _ -> "com.amazonaws.textract#ThrottlingException"
    | `UnsupportedDocumentException _ -> "com.amazonaws.textract#UnsupportedDocumentException"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "AccessDeniedException" ->
          `AccessDeniedException (Json_deserializers.access_denied_exception_of_yojson tree path)
      | _, "BadDocumentException" ->
          `BadDocumentException (Json_deserializers.bad_document_exception_of_yojson tree path)
      | _, "DocumentTooLargeException" ->
          `DocumentTooLargeException
            (Json_deserializers.document_too_large_exception_of_yojson tree path)
      | _, "HumanLoopQuotaExceededException" ->
          `HumanLoopQuotaExceededException
            (Json_deserializers.human_loop_quota_exceeded_exception_of_yojson tree path)
      | _, "InternalServerError" ->
          `InternalServerError (Json_deserializers.internal_server_error_of_yojson tree path)
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
      | _, "UnsupportedDocumentException" ->
          `UnsupportedDocumentException
            (Json_deserializers.unsupported_document_exception_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : analyze_document_request) =
    let input = Json_serializers.analyze_document_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"Textract.AnalyzeDocument" ~service ~context
      ~input ~output_deserializer:Json_deserializers.analyze_document_response_of_yojson
      ~error_deserializer

  let request_with_metadata context (request : analyze_document_request) =
    let input = Json_serializers.analyze_document_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata ~shape_name:"Textract.AnalyzeDocument"
      ~service ~context ~input
      ~output_deserializer:Json_deserializers.analyze_document_response_of_yojson
      ~error_deserializer
end

module AnalyzeExpense = struct
  let error_to_string = function
    | `AccessDeniedException _ -> "com.amazonaws.textract#AccessDeniedException"
    | `BadDocumentException _ -> "com.amazonaws.textract#BadDocumentException"
    | `DocumentTooLargeException _ -> "com.amazonaws.textract#DocumentTooLargeException"
    | `InternalServerError _ -> "com.amazonaws.textract#InternalServerError"
    | `InvalidParameterException _ -> "com.amazonaws.textract#InvalidParameterException"
    | `InvalidS3ObjectException _ -> "com.amazonaws.textract#InvalidS3ObjectException"
    | `ProvisionedThroughputExceededException _ ->
        "com.amazonaws.textract#ProvisionedThroughputExceededException"
    | `ThrottlingException _ -> "com.amazonaws.textract#ThrottlingException"
    | `UnsupportedDocumentException _ -> "com.amazonaws.textract#UnsupportedDocumentException"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "AccessDeniedException" ->
          `AccessDeniedException (Json_deserializers.access_denied_exception_of_yojson tree path)
      | _, "BadDocumentException" ->
          `BadDocumentException (Json_deserializers.bad_document_exception_of_yojson tree path)
      | _, "DocumentTooLargeException" ->
          `DocumentTooLargeException
            (Json_deserializers.document_too_large_exception_of_yojson tree path)
      | _, "InternalServerError" ->
          `InternalServerError (Json_deserializers.internal_server_error_of_yojson tree path)
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
      | _, "UnsupportedDocumentException" ->
          `UnsupportedDocumentException
            (Json_deserializers.unsupported_document_exception_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : analyze_expense_request) =
    let input = Json_serializers.analyze_expense_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"Textract.AnalyzeExpense" ~service ~context
      ~input ~output_deserializer:Json_deserializers.analyze_expense_response_of_yojson
      ~error_deserializer

  let request_with_metadata context (request : analyze_expense_request) =
    let input = Json_serializers.analyze_expense_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata ~shape_name:"Textract.AnalyzeExpense" ~service
      ~context ~input ~output_deserializer:Json_deserializers.analyze_expense_response_of_yojson
      ~error_deserializer
end

module AnalyzeID = struct
  let error_to_string = function
    | `AccessDeniedException _ -> "com.amazonaws.textract#AccessDeniedException"
    | `BadDocumentException _ -> "com.amazonaws.textract#BadDocumentException"
    | `DocumentTooLargeException _ -> "com.amazonaws.textract#DocumentTooLargeException"
    | `InternalServerError _ -> "com.amazonaws.textract#InternalServerError"
    | `InvalidParameterException _ -> "com.amazonaws.textract#InvalidParameterException"
    | `InvalidS3ObjectException _ -> "com.amazonaws.textract#InvalidS3ObjectException"
    | `ProvisionedThroughputExceededException _ ->
        "com.amazonaws.textract#ProvisionedThroughputExceededException"
    | `ThrottlingException _ -> "com.amazonaws.textract#ThrottlingException"
    | `UnsupportedDocumentException _ -> "com.amazonaws.textract#UnsupportedDocumentException"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "AccessDeniedException" ->
          `AccessDeniedException (Json_deserializers.access_denied_exception_of_yojson tree path)
      | _, "BadDocumentException" ->
          `BadDocumentException (Json_deserializers.bad_document_exception_of_yojson tree path)
      | _, "DocumentTooLargeException" ->
          `DocumentTooLargeException
            (Json_deserializers.document_too_large_exception_of_yojson tree path)
      | _, "InternalServerError" ->
          `InternalServerError (Json_deserializers.internal_server_error_of_yojson tree path)
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
      | _, "UnsupportedDocumentException" ->
          `UnsupportedDocumentException
            (Json_deserializers.unsupported_document_exception_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : analyze_id_request) =
    let input = Json_serializers.analyze_id_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"Textract.AnalyzeID" ~service ~context ~input
      ~output_deserializer:Json_deserializers.analyze_id_response_of_yojson ~error_deserializer

  let request_with_metadata context (request : analyze_id_request) =
    let input = Json_serializers.analyze_id_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata ~shape_name:"Textract.AnalyzeID" ~service
      ~context ~input ~output_deserializer:Json_deserializers.analyze_id_response_of_yojson
      ~error_deserializer
end

module CreateAdapter = struct
  let error_to_string = function
    | `AccessDeniedException _ -> "com.amazonaws.textract#AccessDeniedException"
    | `ConflictException _ -> "com.amazonaws.textract#ConflictException"
    | `IdempotentParameterMismatchException _ ->
        "com.amazonaws.textract#IdempotentParameterMismatchException"
    | `InternalServerError _ -> "com.amazonaws.textract#InternalServerError"
    | `InvalidParameterException _ -> "com.amazonaws.textract#InvalidParameterException"
    | `LimitExceededException _ -> "com.amazonaws.textract#LimitExceededException"
    | `ProvisionedThroughputExceededException _ ->
        "com.amazonaws.textract#ProvisionedThroughputExceededException"
    | `ServiceQuotaExceededException _ -> "com.amazonaws.textract#ServiceQuotaExceededException"
    | `ThrottlingException _ -> "com.amazonaws.textract#ThrottlingException"
    | `ValidationException _ -> "com.amazonaws.textract#ValidationException"
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
      | _, "LimitExceededException" ->
          `LimitExceededException (Json_deserializers.limit_exceeded_exception_of_yojson tree path)
      | _, "ProvisionedThroughputExceededException" ->
          `ProvisionedThroughputExceededException
            (Json_deserializers.provisioned_throughput_exceeded_exception_of_yojson tree path)
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

  let request context (request : create_adapter_request) =
    let input = Json_serializers.create_adapter_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"Textract.CreateAdapter" ~service ~context
      ~input ~output_deserializer:Json_deserializers.create_adapter_response_of_yojson
      ~error_deserializer

  let request_with_metadata context (request : create_adapter_request) =
    let input = Json_serializers.create_adapter_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata ~shape_name:"Textract.CreateAdapter" ~service
      ~context ~input ~output_deserializer:Json_deserializers.create_adapter_response_of_yojson
      ~error_deserializer
end

module CreateAdapterVersion = struct
  let error_to_string = function
    | `AccessDeniedException _ -> "com.amazonaws.textract#AccessDeniedException"
    | `ConflictException _ -> "com.amazonaws.textract#ConflictException"
    | `IdempotentParameterMismatchException _ ->
        "com.amazonaws.textract#IdempotentParameterMismatchException"
    | `InternalServerError _ -> "com.amazonaws.textract#InternalServerError"
    | `InvalidKMSKeyException _ -> "com.amazonaws.textract#InvalidKMSKeyException"
    | `InvalidParameterException _ -> "com.amazonaws.textract#InvalidParameterException"
    | `InvalidS3ObjectException _ -> "com.amazonaws.textract#InvalidS3ObjectException"
    | `LimitExceededException _ -> "com.amazonaws.textract#LimitExceededException"
    | `ProvisionedThroughputExceededException _ ->
        "com.amazonaws.textract#ProvisionedThroughputExceededException"
    | `ResourceNotFoundException _ -> "com.amazonaws.textract#ResourceNotFoundException"
    | `ServiceQuotaExceededException _ -> "com.amazonaws.textract#ServiceQuotaExceededException"
    | `ThrottlingException _ -> "com.amazonaws.textract#ThrottlingException"
    | `ValidationException _ -> "com.amazonaws.textract#ValidationException"
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
      | _, "InvalidKMSKeyException" ->
          `InvalidKMSKeyException (Json_deserializers.invalid_kms_key_exception_of_yojson tree path)
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

  let request context (request : create_adapter_version_request) =
    let input = Json_serializers.create_adapter_version_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"Textract.CreateAdapterVersion" ~service
      ~context ~input
      ~output_deserializer:Json_deserializers.create_adapter_version_response_of_yojson
      ~error_deserializer

  let request_with_metadata context (request : create_adapter_version_request) =
    let input = Json_serializers.create_adapter_version_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata ~shape_name:"Textract.CreateAdapterVersion"
      ~service ~context ~input
      ~output_deserializer:Json_deserializers.create_adapter_version_response_of_yojson
      ~error_deserializer
end

module DeleteAdapter = struct
  let error_to_string = function
    | `AccessDeniedException _ -> "com.amazonaws.textract#AccessDeniedException"
    | `ConflictException _ -> "com.amazonaws.textract#ConflictException"
    | `InternalServerError _ -> "com.amazonaws.textract#InternalServerError"
    | `InvalidParameterException _ -> "com.amazonaws.textract#InvalidParameterException"
    | `ProvisionedThroughputExceededException _ ->
        "com.amazonaws.textract#ProvisionedThroughputExceededException"
    | `ResourceNotFoundException _ -> "com.amazonaws.textract#ResourceNotFoundException"
    | `ThrottlingException _ -> "com.amazonaws.textract#ThrottlingException"
    | `ValidationException _ -> "com.amazonaws.textract#ValidationException"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "AccessDeniedException" ->
          `AccessDeniedException (Json_deserializers.access_denied_exception_of_yojson tree path)
      | _, "ConflictException" ->
          `ConflictException (Json_deserializers.conflict_exception_of_yojson tree path)
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
      | _, "ValidationException" ->
          `ValidationException (Json_deserializers.validation_exception_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : delete_adapter_request) =
    let input = Json_serializers.delete_adapter_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"Textract.DeleteAdapter" ~service ~context
      ~input ~output_deserializer:Json_deserializers.delete_adapter_response_of_yojson
      ~error_deserializer

  let request_with_metadata context (request : delete_adapter_request) =
    let input = Json_serializers.delete_adapter_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata ~shape_name:"Textract.DeleteAdapter" ~service
      ~context ~input ~output_deserializer:Json_deserializers.delete_adapter_response_of_yojson
      ~error_deserializer
end

module DeleteAdapterVersion = struct
  let error_to_string = function
    | `AccessDeniedException _ -> "com.amazonaws.textract#AccessDeniedException"
    | `ConflictException _ -> "com.amazonaws.textract#ConflictException"
    | `InternalServerError _ -> "com.amazonaws.textract#InternalServerError"
    | `InvalidParameterException _ -> "com.amazonaws.textract#InvalidParameterException"
    | `ProvisionedThroughputExceededException _ ->
        "com.amazonaws.textract#ProvisionedThroughputExceededException"
    | `ResourceNotFoundException _ -> "com.amazonaws.textract#ResourceNotFoundException"
    | `ThrottlingException _ -> "com.amazonaws.textract#ThrottlingException"
    | `ValidationException _ -> "com.amazonaws.textract#ValidationException"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "AccessDeniedException" ->
          `AccessDeniedException (Json_deserializers.access_denied_exception_of_yojson tree path)
      | _, "ConflictException" ->
          `ConflictException (Json_deserializers.conflict_exception_of_yojson tree path)
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
      | _, "ValidationException" ->
          `ValidationException (Json_deserializers.validation_exception_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : delete_adapter_version_request) =
    let input = Json_serializers.delete_adapter_version_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"Textract.DeleteAdapterVersion" ~service
      ~context ~input
      ~output_deserializer:Json_deserializers.delete_adapter_version_response_of_yojson
      ~error_deserializer

  let request_with_metadata context (request : delete_adapter_version_request) =
    let input = Json_serializers.delete_adapter_version_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata ~shape_name:"Textract.DeleteAdapterVersion"
      ~service ~context ~input
      ~output_deserializer:Json_deserializers.delete_adapter_version_response_of_yojson
      ~error_deserializer
end

module DetectDocumentText = struct
  let error_to_string = function
    | `AccessDeniedException _ -> "com.amazonaws.textract#AccessDeniedException"
    | `BadDocumentException _ -> "com.amazonaws.textract#BadDocumentException"
    | `DocumentTooLargeException _ -> "com.amazonaws.textract#DocumentTooLargeException"
    | `InternalServerError _ -> "com.amazonaws.textract#InternalServerError"
    | `InvalidParameterException _ -> "com.amazonaws.textract#InvalidParameterException"
    | `InvalidS3ObjectException _ -> "com.amazonaws.textract#InvalidS3ObjectException"
    | `ProvisionedThroughputExceededException _ ->
        "com.amazonaws.textract#ProvisionedThroughputExceededException"
    | `ThrottlingException _ -> "com.amazonaws.textract#ThrottlingException"
    | `UnsupportedDocumentException _ -> "com.amazonaws.textract#UnsupportedDocumentException"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "AccessDeniedException" ->
          `AccessDeniedException (Json_deserializers.access_denied_exception_of_yojson tree path)
      | _, "BadDocumentException" ->
          `BadDocumentException (Json_deserializers.bad_document_exception_of_yojson tree path)
      | _, "DocumentTooLargeException" ->
          `DocumentTooLargeException
            (Json_deserializers.document_too_large_exception_of_yojson tree path)
      | _, "InternalServerError" ->
          `InternalServerError (Json_deserializers.internal_server_error_of_yojson tree path)
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
      | _, "UnsupportedDocumentException" ->
          `UnsupportedDocumentException
            (Json_deserializers.unsupported_document_exception_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : detect_document_text_request) =
    let input = Json_serializers.detect_document_text_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"Textract.DetectDocumentText" ~service ~context
      ~input ~output_deserializer:Json_deserializers.detect_document_text_response_of_yojson
      ~error_deserializer

  let request_with_metadata context (request : detect_document_text_request) =
    let input = Json_serializers.detect_document_text_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata ~shape_name:"Textract.DetectDocumentText"
      ~service ~context ~input
      ~output_deserializer:Json_deserializers.detect_document_text_response_of_yojson
      ~error_deserializer
end

module GetAdapter = struct
  let error_to_string = function
    | `AccessDeniedException _ -> "com.amazonaws.textract#AccessDeniedException"
    | `InternalServerError _ -> "com.amazonaws.textract#InternalServerError"
    | `InvalidParameterException _ -> "com.amazonaws.textract#InvalidParameterException"
    | `ProvisionedThroughputExceededException _ ->
        "com.amazonaws.textract#ProvisionedThroughputExceededException"
    | `ResourceNotFoundException _ -> "com.amazonaws.textract#ResourceNotFoundException"
    | `ThrottlingException _ -> "com.amazonaws.textract#ThrottlingException"
    | `ValidationException _ -> "com.amazonaws.textract#ValidationException"
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
      | _, "ValidationException" ->
          `ValidationException (Json_deserializers.validation_exception_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : get_adapter_request) =
    let input = Json_serializers.get_adapter_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"Textract.GetAdapter" ~service ~context ~input
      ~output_deserializer:Json_deserializers.get_adapter_response_of_yojson ~error_deserializer

  let request_with_metadata context (request : get_adapter_request) =
    let input = Json_serializers.get_adapter_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata ~shape_name:"Textract.GetAdapter" ~service
      ~context ~input ~output_deserializer:Json_deserializers.get_adapter_response_of_yojson
      ~error_deserializer
end

module GetAdapterVersion = struct
  let error_to_string = function
    | `AccessDeniedException _ -> "com.amazonaws.textract#AccessDeniedException"
    | `InternalServerError _ -> "com.amazonaws.textract#InternalServerError"
    | `InvalidParameterException _ -> "com.amazonaws.textract#InvalidParameterException"
    | `ProvisionedThroughputExceededException _ ->
        "com.amazonaws.textract#ProvisionedThroughputExceededException"
    | `ResourceNotFoundException _ -> "com.amazonaws.textract#ResourceNotFoundException"
    | `ThrottlingException _ -> "com.amazonaws.textract#ThrottlingException"
    | `ValidationException _ -> "com.amazonaws.textract#ValidationException"
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
      | _, "ValidationException" ->
          `ValidationException (Json_deserializers.validation_exception_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : get_adapter_version_request) =
    let input = Json_serializers.get_adapter_version_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"Textract.GetAdapterVersion" ~service ~context
      ~input ~output_deserializer:Json_deserializers.get_adapter_version_response_of_yojson
      ~error_deserializer

  let request_with_metadata context (request : get_adapter_version_request) =
    let input = Json_serializers.get_adapter_version_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata ~shape_name:"Textract.GetAdapterVersion"
      ~service ~context ~input
      ~output_deserializer:Json_deserializers.get_adapter_version_response_of_yojson
      ~error_deserializer
end

module GetDocumentAnalysis = struct
  let error_to_string = function
    | `AccessDeniedException _ -> "com.amazonaws.textract#AccessDeniedException"
    | `InternalServerError _ -> "com.amazonaws.textract#InternalServerError"
    | `InvalidJobIdException _ -> "com.amazonaws.textract#InvalidJobIdException"
    | `InvalidKMSKeyException _ -> "com.amazonaws.textract#InvalidKMSKeyException"
    | `InvalidParameterException _ -> "com.amazonaws.textract#InvalidParameterException"
    | `InvalidS3ObjectException _ -> "com.amazonaws.textract#InvalidS3ObjectException"
    | `ProvisionedThroughputExceededException _ ->
        "com.amazonaws.textract#ProvisionedThroughputExceededException"
    | `ThrottlingException _ -> "com.amazonaws.textract#ThrottlingException"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "AccessDeniedException" ->
          `AccessDeniedException (Json_deserializers.access_denied_exception_of_yojson tree path)
      | _, "InternalServerError" ->
          `InternalServerError (Json_deserializers.internal_server_error_of_yojson tree path)
      | _, "InvalidJobIdException" ->
          `InvalidJobIdException (Json_deserializers.invalid_job_id_exception_of_yojson tree path)
      | _, "InvalidKMSKeyException" ->
          `InvalidKMSKeyException (Json_deserializers.invalid_kms_key_exception_of_yojson tree path)
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

  let request context (request : get_document_analysis_request) =
    let input = Json_serializers.get_document_analysis_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"Textract.GetDocumentAnalysis" ~service ~context
      ~input ~output_deserializer:Json_deserializers.get_document_analysis_response_of_yojson
      ~error_deserializer

  let request_with_metadata context (request : get_document_analysis_request) =
    let input = Json_serializers.get_document_analysis_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata ~shape_name:"Textract.GetDocumentAnalysis"
      ~service ~context ~input
      ~output_deserializer:Json_deserializers.get_document_analysis_response_of_yojson
      ~error_deserializer
end

module GetDocumentTextDetection = struct
  let error_to_string = function
    | `AccessDeniedException _ -> "com.amazonaws.textract#AccessDeniedException"
    | `InternalServerError _ -> "com.amazonaws.textract#InternalServerError"
    | `InvalidJobIdException _ -> "com.amazonaws.textract#InvalidJobIdException"
    | `InvalidKMSKeyException _ -> "com.amazonaws.textract#InvalidKMSKeyException"
    | `InvalidParameterException _ -> "com.amazonaws.textract#InvalidParameterException"
    | `InvalidS3ObjectException _ -> "com.amazonaws.textract#InvalidS3ObjectException"
    | `ProvisionedThroughputExceededException _ ->
        "com.amazonaws.textract#ProvisionedThroughputExceededException"
    | `ThrottlingException _ -> "com.amazonaws.textract#ThrottlingException"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "AccessDeniedException" ->
          `AccessDeniedException (Json_deserializers.access_denied_exception_of_yojson tree path)
      | _, "InternalServerError" ->
          `InternalServerError (Json_deserializers.internal_server_error_of_yojson tree path)
      | _, "InvalidJobIdException" ->
          `InvalidJobIdException (Json_deserializers.invalid_job_id_exception_of_yojson tree path)
      | _, "InvalidKMSKeyException" ->
          `InvalidKMSKeyException (Json_deserializers.invalid_kms_key_exception_of_yojson tree path)
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

  let request context (request : get_document_text_detection_request) =
    let input = Json_serializers.get_document_text_detection_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"Textract.GetDocumentTextDetection" ~service
      ~context ~input
      ~output_deserializer:Json_deserializers.get_document_text_detection_response_of_yojson
      ~error_deserializer

  let request_with_metadata context (request : get_document_text_detection_request) =
    let input = Json_serializers.get_document_text_detection_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata
      ~shape_name:"Textract.GetDocumentTextDetection" ~service ~context ~input
      ~output_deserializer:Json_deserializers.get_document_text_detection_response_of_yojson
      ~error_deserializer
end

module GetExpenseAnalysis = struct
  let error_to_string = function
    | `AccessDeniedException _ -> "com.amazonaws.textract#AccessDeniedException"
    | `InternalServerError _ -> "com.amazonaws.textract#InternalServerError"
    | `InvalidJobIdException _ -> "com.amazonaws.textract#InvalidJobIdException"
    | `InvalidKMSKeyException _ -> "com.amazonaws.textract#InvalidKMSKeyException"
    | `InvalidParameterException _ -> "com.amazonaws.textract#InvalidParameterException"
    | `InvalidS3ObjectException _ -> "com.amazonaws.textract#InvalidS3ObjectException"
    | `ProvisionedThroughputExceededException _ ->
        "com.amazonaws.textract#ProvisionedThroughputExceededException"
    | `ThrottlingException _ -> "com.amazonaws.textract#ThrottlingException"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "AccessDeniedException" ->
          `AccessDeniedException (Json_deserializers.access_denied_exception_of_yojson tree path)
      | _, "InternalServerError" ->
          `InternalServerError (Json_deserializers.internal_server_error_of_yojson tree path)
      | _, "InvalidJobIdException" ->
          `InvalidJobIdException (Json_deserializers.invalid_job_id_exception_of_yojson tree path)
      | _, "InvalidKMSKeyException" ->
          `InvalidKMSKeyException (Json_deserializers.invalid_kms_key_exception_of_yojson tree path)
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

  let request context (request : get_expense_analysis_request) =
    let input = Json_serializers.get_expense_analysis_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"Textract.GetExpenseAnalysis" ~service ~context
      ~input ~output_deserializer:Json_deserializers.get_expense_analysis_response_of_yojson
      ~error_deserializer

  let request_with_metadata context (request : get_expense_analysis_request) =
    let input = Json_serializers.get_expense_analysis_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata ~shape_name:"Textract.GetExpenseAnalysis"
      ~service ~context ~input
      ~output_deserializer:Json_deserializers.get_expense_analysis_response_of_yojson
      ~error_deserializer
end

module GetLendingAnalysis = struct
  let error_to_string = function
    | `AccessDeniedException _ -> "com.amazonaws.textract#AccessDeniedException"
    | `InternalServerError _ -> "com.amazonaws.textract#InternalServerError"
    | `InvalidJobIdException _ -> "com.amazonaws.textract#InvalidJobIdException"
    | `InvalidKMSKeyException _ -> "com.amazonaws.textract#InvalidKMSKeyException"
    | `InvalidParameterException _ -> "com.amazonaws.textract#InvalidParameterException"
    | `InvalidS3ObjectException _ -> "com.amazonaws.textract#InvalidS3ObjectException"
    | `ProvisionedThroughputExceededException _ ->
        "com.amazonaws.textract#ProvisionedThroughputExceededException"
    | `ThrottlingException _ -> "com.amazonaws.textract#ThrottlingException"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "AccessDeniedException" ->
          `AccessDeniedException (Json_deserializers.access_denied_exception_of_yojson tree path)
      | _, "InternalServerError" ->
          `InternalServerError (Json_deserializers.internal_server_error_of_yojson tree path)
      | _, "InvalidJobIdException" ->
          `InvalidJobIdException (Json_deserializers.invalid_job_id_exception_of_yojson tree path)
      | _, "InvalidKMSKeyException" ->
          `InvalidKMSKeyException (Json_deserializers.invalid_kms_key_exception_of_yojson tree path)
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

  let request context (request : get_lending_analysis_request) =
    let input = Json_serializers.get_lending_analysis_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"Textract.GetLendingAnalysis" ~service ~context
      ~input ~output_deserializer:Json_deserializers.get_lending_analysis_response_of_yojson
      ~error_deserializer

  let request_with_metadata context (request : get_lending_analysis_request) =
    let input = Json_serializers.get_lending_analysis_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata ~shape_name:"Textract.GetLendingAnalysis"
      ~service ~context ~input
      ~output_deserializer:Json_deserializers.get_lending_analysis_response_of_yojson
      ~error_deserializer
end

module GetLendingAnalysisSummary = struct
  let error_to_string = function
    | `AccessDeniedException _ -> "com.amazonaws.textract#AccessDeniedException"
    | `InternalServerError _ -> "com.amazonaws.textract#InternalServerError"
    | `InvalidJobIdException _ -> "com.amazonaws.textract#InvalidJobIdException"
    | `InvalidKMSKeyException _ -> "com.amazonaws.textract#InvalidKMSKeyException"
    | `InvalidParameterException _ -> "com.amazonaws.textract#InvalidParameterException"
    | `InvalidS3ObjectException _ -> "com.amazonaws.textract#InvalidS3ObjectException"
    | `ProvisionedThroughputExceededException _ ->
        "com.amazonaws.textract#ProvisionedThroughputExceededException"
    | `ThrottlingException _ -> "com.amazonaws.textract#ThrottlingException"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "AccessDeniedException" ->
          `AccessDeniedException (Json_deserializers.access_denied_exception_of_yojson tree path)
      | _, "InternalServerError" ->
          `InternalServerError (Json_deserializers.internal_server_error_of_yojson tree path)
      | _, "InvalidJobIdException" ->
          `InvalidJobIdException (Json_deserializers.invalid_job_id_exception_of_yojson tree path)
      | _, "InvalidKMSKeyException" ->
          `InvalidKMSKeyException (Json_deserializers.invalid_kms_key_exception_of_yojson tree path)
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

  let request context (request : get_lending_analysis_summary_request) =
    let input = Json_serializers.get_lending_analysis_summary_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"Textract.GetLendingAnalysisSummary" ~service
      ~context ~input
      ~output_deserializer:Json_deserializers.get_lending_analysis_summary_response_of_yojson
      ~error_deserializer

  let request_with_metadata context (request : get_lending_analysis_summary_request) =
    let input = Json_serializers.get_lending_analysis_summary_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata
      ~shape_name:"Textract.GetLendingAnalysisSummary" ~service ~context ~input
      ~output_deserializer:Json_deserializers.get_lending_analysis_summary_response_of_yojson
      ~error_deserializer
end

module ListAdapters = struct
  let error_to_string = function
    | `AccessDeniedException _ -> "com.amazonaws.textract#AccessDeniedException"
    | `InternalServerError _ -> "com.amazonaws.textract#InternalServerError"
    | `InvalidParameterException _ -> "com.amazonaws.textract#InvalidParameterException"
    | `ProvisionedThroughputExceededException _ ->
        "com.amazonaws.textract#ProvisionedThroughputExceededException"
    | `ThrottlingException _ -> "com.amazonaws.textract#ThrottlingException"
    | `ValidationException _ -> "com.amazonaws.textract#ValidationException"
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
      | _, "ValidationException" ->
          `ValidationException (Json_deserializers.validation_exception_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : list_adapters_request) =
    let input = Json_serializers.list_adapters_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"Textract.ListAdapters" ~service ~context ~input
      ~output_deserializer:Json_deserializers.list_adapters_response_of_yojson ~error_deserializer

  let request_with_metadata context (request : list_adapters_request) =
    let input = Json_serializers.list_adapters_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata ~shape_name:"Textract.ListAdapters" ~service
      ~context ~input ~output_deserializer:Json_deserializers.list_adapters_response_of_yojson
      ~error_deserializer
end

module ListAdapterVersions = struct
  let error_to_string = function
    | `AccessDeniedException _ -> "com.amazonaws.textract#AccessDeniedException"
    | `InternalServerError _ -> "com.amazonaws.textract#InternalServerError"
    | `InvalidParameterException _ -> "com.amazonaws.textract#InvalidParameterException"
    | `ProvisionedThroughputExceededException _ ->
        "com.amazonaws.textract#ProvisionedThroughputExceededException"
    | `ResourceNotFoundException _ -> "com.amazonaws.textract#ResourceNotFoundException"
    | `ThrottlingException _ -> "com.amazonaws.textract#ThrottlingException"
    | `ValidationException _ -> "com.amazonaws.textract#ValidationException"
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
      | _, "ValidationException" ->
          `ValidationException (Json_deserializers.validation_exception_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : list_adapter_versions_request) =
    let input = Json_serializers.list_adapter_versions_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"Textract.ListAdapterVersions" ~service ~context
      ~input ~output_deserializer:Json_deserializers.list_adapter_versions_response_of_yojson
      ~error_deserializer

  let request_with_metadata context (request : list_adapter_versions_request) =
    let input = Json_serializers.list_adapter_versions_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata ~shape_name:"Textract.ListAdapterVersions"
      ~service ~context ~input
      ~output_deserializer:Json_deserializers.list_adapter_versions_response_of_yojson
      ~error_deserializer
end

module ListTagsForResource = struct
  let error_to_string = function
    | `AccessDeniedException _ -> "com.amazonaws.textract#AccessDeniedException"
    | `InternalServerError _ -> "com.amazonaws.textract#InternalServerError"
    | `InvalidParameterException _ -> "com.amazonaws.textract#InvalidParameterException"
    | `ProvisionedThroughputExceededException _ ->
        "com.amazonaws.textract#ProvisionedThroughputExceededException"
    | `ResourceNotFoundException _ -> "com.amazonaws.textract#ResourceNotFoundException"
    | `ThrottlingException _ -> "com.amazonaws.textract#ThrottlingException"
    | `ValidationException _ -> "com.amazonaws.textract#ValidationException"
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
      | _, "ValidationException" ->
          `ValidationException (Json_deserializers.validation_exception_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : list_tags_for_resource_request) =
    let input = Json_serializers.list_tags_for_resource_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"Textract.ListTagsForResource" ~service ~context
      ~input ~output_deserializer:Json_deserializers.list_tags_for_resource_response_of_yojson
      ~error_deserializer

  let request_with_metadata context (request : list_tags_for_resource_request) =
    let input = Json_serializers.list_tags_for_resource_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata ~shape_name:"Textract.ListTagsForResource"
      ~service ~context ~input
      ~output_deserializer:Json_deserializers.list_tags_for_resource_response_of_yojson
      ~error_deserializer
end

module StartDocumentAnalysis = struct
  let error_to_string = function
    | `AccessDeniedException _ -> "com.amazonaws.textract#AccessDeniedException"
    | `BadDocumentException _ -> "com.amazonaws.textract#BadDocumentException"
    | `DocumentTooLargeException _ -> "com.amazonaws.textract#DocumentTooLargeException"
    | `IdempotentParameterMismatchException _ ->
        "com.amazonaws.textract#IdempotentParameterMismatchException"
    | `InternalServerError _ -> "com.amazonaws.textract#InternalServerError"
    | `InvalidKMSKeyException _ -> "com.amazonaws.textract#InvalidKMSKeyException"
    | `InvalidParameterException _ -> "com.amazonaws.textract#InvalidParameterException"
    | `InvalidS3ObjectException _ -> "com.amazonaws.textract#InvalidS3ObjectException"
    | `LimitExceededException _ -> "com.amazonaws.textract#LimitExceededException"
    | `ProvisionedThroughputExceededException _ ->
        "com.amazonaws.textract#ProvisionedThroughputExceededException"
    | `ThrottlingException _ -> "com.amazonaws.textract#ThrottlingException"
    | `UnsupportedDocumentException _ -> "com.amazonaws.textract#UnsupportedDocumentException"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "AccessDeniedException" ->
          `AccessDeniedException (Json_deserializers.access_denied_exception_of_yojson tree path)
      | _, "BadDocumentException" ->
          `BadDocumentException (Json_deserializers.bad_document_exception_of_yojson tree path)
      | _, "DocumentTooLargeException" ->
          `DocumentTooLargeException
            (Json_deserializers.document_too_large_exception_of_yojson tree path)
      | _, "IdempotentParameterMismatchException" ->
          `IdempotentParameterMismatchException
            (Json_deserializers.idempotent_parameter_mismatch_exception_of_yojson tree path)
      | _, "InternalServerError" ->
          `InternalServerError (Json_deserializers.internal_server_error_of_yojson tree path)
      | _, "InvalidKMSKeyException" ->
          `InvalidKMSKeyException (Json_deserializers.invalid_kms_key_exception_of_yojson tree path)
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
      | _, "UnsupportedDocumentException" ->
          `UnsupportedDocumentException
            (Json_deserializers.unsupported_document_exception_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : start_document_analysis_request) =
    let input = Json_serializers.start_document_analysis_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"Textract.StartDocumentAnalysis" ~service
      ~context ~input
      ~output_deserializer:Json_deserializers.start_document_analysis_response_of_yojson
      ~error_deserializer

  let request_with_metadata context (request : start_document_analysis_request) =
    let input = Json_serializers.start_document_analysis_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata ~shape_name:"Textract.StartDocumentAnalysis"
      ~service ~context ~input
      ~output_deserializer:Json_deserializers.start_document_analysis_response_of_yojson
      ~error_deserializer
end

module StartDocumentTextDetection = struct
  let error_to_string = function
    | `AccessDeniedException _ -> "com.amazonaws.textract#AccessDeniedException"
    | `BadDocumentException _ -> "com.amazonaws.textract#BadDocumentException"
    | `DocumentTooLargeException _ -> "com.amazonaws.textract#DocumentTooLargeException"
    | `IdempotentParameterMismatchException _ ->
        "com.amazonaws.textract#IdempotentParameterMismatchException"
    | `InternalServerError _ -> "com.amazonaws.textract#InternalServerError"
    | `InvalidKMSKeyException _ -> "com.amazonaws.textract#InvalidKMSKeyException"
    | `InvalidParameterException _ -> "com.amazonaws.textract#InvalidParameterException"
    | `InvalidS3ObjectException _ -> "com.amazonaws.textract#InvalidS3ObjectException"
    | `LimitExceededException _ -> "com.amazonaws.textract#LimitExceededException"
    | `ProvisionedThroughputExceededException _ ->
        "com.amazonaws.textract#ProvisionedThroughputExceededException"
    | `ThrottlingException _ -> "com.amazonaws.textract#ThrottlingException"
    | `UnsupportedDocumentException _ -> "com.amazonaws.textract#UnsupportedDocumentException"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "AccessDeniedException" ->
          `AccessDeniedException (Json_deserializers.access_denied_exception_of_yojson tree path)
      | _, "BadDocumentException" ->
          `BadDocumentException (Json_deserializers.bad_document_exception_of_yojson tree path)
      | _, "DocumentTooLargeException" ->
          `DocumentTooLargeException
            (Json_deserializers.document_too_large_exception_of_yojson tree path)
      | _, "IdempotentParameterMismatchException" ->
          `IdempotentParameterMismatchException
            (Json_deserializers.idempotent_parameter_mismatch_exception_of_yojson tree path)
      | _, "InternalServerError" ->
          `InternalServerError (Json_deserializers.internal_server_error_of_yojson tree path)
      | _, "InvalidKMSKeyException" ->
          `InvalidKMSKeyException (Json_deserializers.invalid_kms_key_exception_of_yojson tree path)
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
      | _, "UnsupportedDocumentException" ->
          `UnsupportedDocumentException
            (Json_deserializers.unsupported_document_exception_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : start_document_text_detection_request) =
    let input = Json_serializers.start_document_text_detection_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"Textract.StartDocumentTextDetection" ~service
      ~context ~input
      ~output_deserializer:Json_deserializers.start_document_text_detection_response_of_yojson
      ~error_deserializer

  let request_with_metadata context (request : start_document_text_detection_request) =
    let input = Json_serializers.start_document_text_detection_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata
      ~shape_name:"Textract.StartDocumentTextDetection" ~service ~context ~input
      ~output_deserializer:Json_deserializers.start_document_text_detection_response_of_yojson
      ~error_deserializer
end

module StartExpenseAnalysis = struct
  let error_to_string = function
    | `AccessDeniedException _ -> "com.amazonaws.textract#AccessDeniedException"
    | `BadDocumentException _ -> "com.amazonaws.textract#BadDocumentException"
    | `DocumentTooLargeException _ -> "com.amazonaws.textract#DocumentTooLargeException"
    | `IdempotentParameterMismatchException _ ->
        "com.amazonaws.textract#IdempotentParameterMismatchException"
    | `InternalServerError _ -> "com.amazonaws.textract#InternalServerError"
    | `InvalidKMSKeyException _ -> "com.amazonaws.textract#InvalidKMSKeyException"
    | `InvalidParameterException _ -> "com.amazonaws.textract#InvalidParameterException"
    | `InvalidS3ObjectException _ -> "com.amazonaws.textract#InvalidS3ObjectException"
    | `LimitExceededException _ -> "com.amazonaws.textract#LimitExceededException"
    | `ProvisionedThroughputExceededException _ ->
        "com.amazonaws.textract#ProvisionedThroughputExceededException"
    | `ThrottlingException _ -> "com.amazonaws.textract#ThrottlingException"
    | `UnsupportedDocumentException _ -> "com.amazonaws.textract#UnsupportedDocumentException"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "AccessDeniedException" ->
          `AccessDeniedException (Json_deserializers.access_denied_exception_of_yojson tree path)
      | _, "BadDocumentException" ->
          `BadDocumentException (Json_deserializers.bad_document_exception_of_yojson tree path)
      | _, "DocumentTooLargeException" ->
          `DocumentTooLargeException
            (Json_deserializers.document_too_large_exception_of_yojson tree path)
      | _, "IdempotentParameterMismatchException" ->
          `IdempotentParameterMismatchException
            (Json_deserializers.idempotent_parameter_mismatch_exception_of_yojson tree path)
      | _, "InternalServerError" ->
          `InternalServerError (Json_deserializers.internal_server_error_of_yojson tree path)
      | _, "InvalidKMSKeyException" ->
          `InvalidKMSKeyException (Json_deserializers.invalid_kms_key_exception_of_yojson tree path)
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
      | _, "UnsupportedDocumentException" ->
          `UnsupportedDocumentException
            (Json_deserializers.unsupported_document_exception_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : start_expense_analysis_request) =
    let input = Json_serializers.start_expense_analysis_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"Textract.StartExpenseAnalysis" ~service
      ~context ~input
      ~output_deserializer:Json_deserializers.start_expense_analysis_response_of_yojson
      ~error_deserializer

  let request_with_metadata context (request : start_expense_analysis_request) =
    let input = Json_serializers.start_expense_analysis_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata ~shape_name:"Textract.StartExpenseAnalysis"
      ~service ~context ~input
      ~output_deserializer:Json_deserializers.start_expense_analysis_response_of_yojson
      ~error_deserializer
end

module StartLendingAnalysis = struct
  let error_to_string = function
    | `AccessDeniedException _ -> "com.amazonaws.textract#AccessDeniedException"
    | `BadDocumentException _ -> "com.amazonaws.textract#BadDocumentException"
    | `DocumentTooLargeException _ -> "com.amazonaws.textract#DocumentTooLargeException"
    | `IdempotentParameterMismatchException _ ->
        "com.amazonaws.textract#IdempotentParameterMismatchException"
    | `InternalServerError _ -> "com.amazonaws.textract#InternalServerError"
    | `InvalidKMSKeyException _ -> "com.amazonaws.textract#InvalidKMSKeyException"
    | `InvalidParameterException _ -> "com.amazonaws.textract#InvalidParameterException"
    | `InvalidS3ObjectException _ -> "com.amazonaws.textract#InvalidS3ObjectException"
    | `LimitExceededException _ -> "com.amazonaws.textract#LimitExceededException"
    | `ProvisionedThroughputExceededException _ ->
        "com.amazonaws.textract#ProvisionedThroughputExceededException"
    | `ThrottlingException _ -> "com.amazonaws.textract#ThrottlingException"
    | `UnsupportedDocumentException _ -> "com.amazonaws.textract#UnsupportedDocumentException"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "AccessDeniedException" ->
          `AccessDeniedException (Json_deserializers.access_denied_exception_of_yojson tree path)
      | _, "BadDocumentException" ->
          `BadDocumentException (Json_deserializers.bad_document_exception_of_yojson tree path)
      | _, "DocumentTooLargeException" ->
          `DocumentTooLargeException
            (Json_deserializers.document_too_large_exception_of_yojson tree path)
      | _, "IdempotentParameterMismatchException" ->
          `IdempotentParameterMismatchException
            (Json_deserializers.idempotent_parameter_mismatch_exception_of_yojson tree path)
      | _, "InternalServerError" ->
          `InternalServerError (Json_deserializers.internal_server_error_of_yojson tree path)
      | _, "InvalidKMSKeyException" ->
          `InvalidKMSKeyException (Json_deserializers.invalid_kms_key_exception_of_yojson tree path)
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
      | _, "UnsupportedDocumentException" ->
          `UnsupportedDocumentException
            (Json_deserializers.unsupported_document_exception_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : start_lending_analysis_request) =
    let input = Json_serializers.start_lending_analysis_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"Textract.StartLendingAnalysis" ~service
      ~context ~input
      ~output_deserializer:Json_deserializers.start_lending_analysis_response_of_yojson
      ~error_deserializer

  let request_with_metadata context (request : start_lending_analysis_request) =
    let input = Json_serializers.start_lending_analysis_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata ~shape_name:"Textract.StartLendingAnalysis"
      ~service ~context ~input
      ~output_deserializer:Json_deserializers.start_lending_analysis_response_of_yojson
      ~error_deserializer
end

module TagResource = struct
  let error_to_string = function
    | `AccessDeniedException _ -> "com.amazonaws.textract#AccessDeniedException"
    | `InternalServerError _ -> "com.amazonaws.textract#InternalServerError"
    | `InvalidParameterException _ -> "com.amazonaws.textract#InvalidParameterException"
    | `ProvisionedThroughputExceededException _ ->
        "com.amazonaws.textract#ProvisionedThroughputExceededException"
    | `ResourceNotFoundException _ -> "com.amazonaws.textract#ResourceNotFoundException"
    | `ServiceQuotaExceededException _ -> "com.amazonaws.textract#ServiceQuotaExceededException"
    | `ThrottlingException _ -> "com.amazonaws.textract#ThrottlingException"
    | `ValidationException _ -> "com.amazonaws.textract#ValidationException"
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
      | _, "ValidationException" ->
          `ValidationException (Json_deserializers.validation_exception_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : tag_resource_request) =
    let input = Json_serializers.tag_resource_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"Textract.TagResource" ~service ~context ~input
      ~output_deserializer:Json_deserializers.tag_resource_response_of_yojson ~error_deserializer

  let request_with_metadata context (request : tag_resource_request) =
    let input = Json_serializers.tag_resource_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata ~shape_name:"Textract.TagResource" ~service
      ~context ~input ~output_deserializer:Json_deserializers.tag_resource_response_of_yojson
      ~error_deserializer
end

module UntagResource = struct
  let error_to_string = function
    | `AccessDeniedException _ -> "com.amazonaws.textract#AccessDeniedException"
    | `InternalServerError _ -> "com.amazonaws.textract#InternalServerError"
    | `InvalidParameterException _ -> "com.amazonaws.textract#InvalidParameterException"
    | `ProvisionedThroughputExceededException _ ->
        "com.amazonaws.textract#ProvisionedThroughputExceededException"
    | `ResourceNotFoundException _ -> "com.amazonaws.textract#ResourceNotFoundException"
    | `ThrottlingException _ -> "com.amazonaws.textract#ThrottlingException"
    | `ValidationException _ -> "com.amazonaws.textract#ValidationException"
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
      | _, "ValidationException" ->
          `ValidationException (Json_deserializers.validation_exception_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : untag_resource_request) =
    let input = Json_serializers.untag_resource_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"Textract.UntagResource" ~service ~context
      ~input ~output_deserializer:Json_deserializers.untag_resource_response_of_yojson
      ~error_deserializer

  let request_with_metadata context (request : untag_resource_request) =
    let input = Json_serializers.untag_resource_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata ~shape_name:"Textract.UntagResource" ~service
      ~context ~input ~output_deserializer:Json_deserializers.untag_resource_response_of_yojson
      ~error_deserializer
end

module UpdateAdapter = struct
  let error_to_string = function
    | `AccessDeniedException _ -> "com.amazonaws.textract#AccessDeniedException"
    | `ConflictException _ -> "com.amazonaws.textract#ConflictException"
    | `InternalServerError _ -> "com.amazonaws.textract#InternalServerError"
    | `InvalidParameterException _ -> "com.amazonaws.textract#InvalidParameterException"
    | `ProvisionedThroughputExceededException _ ->
        "com.amazonaws.textract#ProvisionedThroughputExceededException"
    | `ResourceNotFoundException _ -> "com.amazonaws.textract#ResourceNotFoundException"
    | `ThrottlingException _ -> "com.amazonaws.textract#ThrottlingException"
    | `ValidationException _ -> "com.amazonaws.textract#ValidationException"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "AccessDeniedException" ->
          `AccessDeniedException (Json_deserializers.access_denied_exception_of_yojson tree path)
      | _, "ConflictException" ->
          `ConflictException (Json_deserializers.conflict_exception_of_yojson tree path)
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
      | _, "ValidationException" ->
          `ValidationException (Json_deserializers.validation_exception_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : update_adapter_request) =
    let input = Json_serializers.update_adapter_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"Textract.UpdateAdapter" ~service ~context
      ~input ~output_deserializer:Json_deserializers.update_adapter_response_of_yojson
      ~error_deserializer

  let request_with_metadata context (request : update_adapter_request) =
    let input = Json_serializers.update_adapter_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata ~shape_name:"Textract.UpdateAdapter" ~service
      ~context ~input ~output_deserializer:Json_deserializers.update_adapter_response_of_yojson
      ~error_deserializer
end
