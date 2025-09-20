open Types
open Service_metadata

module AssociateEntitiesToExperience = struct
  let error_to_string = function
    | `AccessDeniedException _ -> "com.amazonaws.kendra#AccessDeniedException"
    | `InternalServerException _ -> "com.amazonaws.kendra#InternalServerException"
    | `ResourceAlreadyExistException _ -> "com.amazonaws.kendra#ResourceAlreadyExistException"
    | `ResourceNotFoundException _ -> "com.amazonaws.kendra#ResourceNotFoundException"
    | `ThrottlingException _ -> "com.amazonaws.kendra#ThrottlingException"
    | `ValidationException _ -> "com.amazonaws.kendra#ValidationException"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "AccessDeniedException" ->
          `AccessDeniedException (Json_deserializers.access_denied_exception_of_yojson tree path)
      | _, "InternalServerException" ->
          `InternalServerException
            (Json_deserializers.internal_server_exception_of_yojson tree path)
      | _, "ResourceAlreadyExistException" ->
          `ResourceAlreadyExistException
            (Json_deserializers.resource_already_exist_exception_of_yojson tree path)
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

  let request context (request : associate_entities_to_experience_request) =
    let input = Json_serializers.associate_entities_to_experience_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request
      ~shape_name:"AWSKendraFrontendService.AssociateEntitiesToExperience" ~service ~context ~input
      ~output_deserializer:Json_deserializers.associate_entities_to_experience_response_of_yojson
      ~error_deserializer
end

module AssociatePersonasToEntities = struct
  let error_to_string = function
    | `AccessDeniedException _ -> "com.amazonaws.kendra#AccessDeniedException"
    | `InternalServerException _ -> "com.amazonaws.kendra#InternalServerException"
    | `ResourceAlreadyExistException _ -> "com.amazonaws.kendra#ResourceAlreadyExistException"
    | `ResourceNotFoundException _ -> "com.amazonaws.kendra#ResourceNotFoundException"
    | `ThrottlingException _ -> "com.amazonaws.kendra#ThrottlingException"
    | `ValidationException _ -> "com.amazonaws.kendra#ValidationException"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "AccessDeniedException" ->
          `AccessDeniedException (Json_deserializers.access_denied_exception_of_yojson tree path)
      | _, "InternalServerException" ->
          `InternalServerException
            (Json_deserializers.internal_server_exception_of_yojson tree path)
      | _, "ResourceAlreadyExistException" ->
          `ResourceAlreadyExistException
            (Json_deserializers.resource_already_exist_exception_of_yojson tree path)
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

  let request context (request : associate_personas_to_entities_request) =
    let input = Json_serializers.associate_personas_to_entities_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request
      ~shape_name:"AWSKendraFrontendService.AssociatePersonasToEntities" ~service ~context ~input
      ~output_deserializer:Json_deserializers.associate_personas_to_entities_response_of_yojson
      ~error_deserializer
end

module BatchDeleteDocument = struct
  let error_to_string = function
    | `AccessDeniedException _ -> "com.amazonaws.kendra#AccessDeniedException"
    | `ConflictException _ -> "com.amazonaws.kendra#ConflictException"
    | `InternalServerException _ -> "com.amazonaws.kendra#InternalServerException"
    | `ResourceNotFoundException _ -> "com.amazonaws.kendra#ResourceNotFoundException"
    | `ThrottlingException _ -> "com.amazonaws.kendra#ThrottlingException"
    | `ValidationException _ -> "com.amazonaws.kendra#ValidationException"
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

  let request context (request : batch_delete_document_request) =
    let input = Json_serializers.batch_delete_document_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"AWSKendraFrontendService.BatchDeleteDocument"
      ~service ~context ~input
      ~output_deserializer:Json_deserializers.batch_delete_document_response_of_yojson
      ~error_deserializer
end

module BatchDeleteFeaturedResultsSet = struct
  let error_to_string = function
    | `AccessDeniedException _ -> "com.amazonaws.kendra#AccessDeniedException"
    | `InternalServerException _ -> "com.amazonaws.kendra#InternalServerException"
    | `ResourceNotFoundException _ -> "com.amazonaws.kendra#ResourceNotFoundException"
    | `ThrottlingException _ -> "com.amazonaws.kendra#ThrottlingException"
    | `ValidationException _ -> "com.amazonaws.kendra#ValidationException"
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

  let request context (request : batch_delete_featured_results_set_request) =
    let input = Json_serializers.batch_delete_featured_results_set_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request
      ~shape_name:"AWSKendraFrontendService.BatchDeleteFeaturedResultsSet" ~service ~context ~input
      ~output_deserializer:Json_deserializers.batch_delete_featured_results_set_response_of_yojson
      ~error_deserializer
end

module BatchGetDocumentStatus = struct
  let error_to_string = function
    | `AccessDeniedException _ -> "com.amazonaws.kendra#AccessDeniedException"
    | `ConflictException _ -> "com.amazonaws.kendra#ConflictException"
    | `InternalServerException _ -> "com.amazonaws.kendra#InternalServerException"
    | `ResourceNotFoundException _ -> "com.amazonaws.kendra#ResourceNotFoundException"
    | `ThrottlingException _ -> "com.amazonaws.kendra#ThrottlingException"
    | `ValidationException _ -> "com.amazonaws.kendra#ValidationException"
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

  let request context (request : batch_get_document_status_request) =
    let input = Json_serializers.batch_get_document_status_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request
      ~shape_name:"AWSKendraFrontendService.BatchGetDocumentStatus" ~service ~context ~input
      ~output_deserializer:Json_deserializers.batch_get_document_status_response_of_yojson
      ~error_deserializer
end

module BatchPutDocument = struct
  let error_to_string = function
    | `AccessDeniedException _ -> "com.amazonaws.kendra#AccessDeniedException"
    | `ConflictException _ -> "com.amazonaws.kendra#ConflictException"
    | `InternalServerException _ -> "com.amazonaws.kendra#InternalServerException"
    | `ResourceNotFoundException _ -> "com.amazonaws.kendra#ResourceNotFoundException"
    | `ServiceQuotaExceededException _ -> "com.amazonaws.kendra#ServiceQuotaExceededException"
    | `ThrottlingException _ -> "com.amazonaws.kendra#ThrottlingException"
    | `ValidationException _ -> "com.amazonaws.kendra#ValidationException"
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

  let request context (request : batch_put_document_request) =
    let input = Json_serializers.batch_put_document_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"AWSKendraFrontendService.BatchPutDocument"
      ~service ~context ~input
      ~output_deserializer:Json_deserializers.batch_put_document_response_of_yojson
      ~error_deserializer
end

module ClearQuerySuggestions = struct
  let error_to_string = function
    | `AccessDeniedException _ -> "com.amazonaws.kendra#AccessDeniedException"
    | `ConflictException _ -> "com.amazonaws.kendra#ConflictException"
    | `InternalServerException _ -> "com.amazonaws.kendra#InternalServerException"
    | `ResourceNotFoundException _ -> "com.amazonaws.kendra#ResourceNotFoundException"
    | `ThrottlingException _ -> "com.amazonaws.kendra#ThrottlingException"
    | `ValidationException _ -> "com.amazonaws.kendra#ValidationException"
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

  let request context (request : clear_query_suggestions_request) =
    let input = Json_serializers.clear_query_suggestions_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"AWSKendraFrontendService.ClearQuerySuggestions"
      ~service ~context ~input
      ~output_deserializer:Smaws_Lib.Smithy_api.Json_deserializers.unit__of_yojson
      ~error_deserializer
end

module CreateAccessControlConfiguration = struct
  let error_to_string = function
    | `AccessDeniedException _ -> "com.amazonaws.kendra#AccessDeniedException"
    | `ConflictException _ -> "com.amazonaws.kendra#ConflictException"
    | `InternalServerException _ -> "com.amazonaws.kendra#InternalServerException"
    | `ResourceNotFoundException _ -> "com.amazonaws.kendra#ResourceNotFoundException"
    | `ServiceQuotaExceededException _ -> "com.amazonaws.kendra#ServiceQuotaExceededException"
    | `ThrottlingException _ -> "com.amazonaws.kendra#ThrottlingException"
    | `ValidationException _ -> "com.amazonaws.kendra#ValidationException"
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

  let request context (request : create_access_control_configuration_request) =
    let input = Json_serializers.create_access_control_configuration_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request
      ~shape_name:"AWSKendraFrontendService.CreateAccessControlConfiguration" ~service ~context
      ~input
      ~output_deserializer:Json_deserializers.create_access_control_configuration_response_of_yojson
      ~error_deserializer
end

module CreateDataSource = struct
  let error_to_string = function
    | `AccessDeniedException _ -> "com.amazonaws.kendra#AccessDeniedException"
    | `ConflictException _ -> "com.amazonaws.kendra#ConflictException"
    | `InternalServerException _ -> "com.amazonaws.kendra#InternalServerException"
    | `ResourceAlreadyExistException _ -> "com.amazonaws.kendra#ResourceAlreadyExistException"
    | `ResourceNotFoundException _ -> "com.amazonaws.kendra#ResourceNotFoundException"
    | `ServiceQuotaExceededException _ -> "com.amazonaws.kendra#ServiceQuotaExceededException"
    | `ThrottlingException _ -> "com.amazonaws.kendra#ThrottlingException"
    | `ValidationException _ -> "com.amazonaws.kendra#ValidationException"
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
      | _, "ResourceAlreadyExistException" ->
          `ResourceAlreadyExistException
            (Json_deserializers.resource_already_exist_exception_of_yojson tree path)
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

  let request context (request : create_data_source_request) =
    let input = Json_serializers.create_data_source_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"AWSKendraFrontendService.CreateDataSource"
      ~service ~context ~input
      ~output_deserializer:Json_deserializers.create_data_source_response_of_yojson
      ~error_deserializer
end

module CreateExperience = struct
  let error_to_string = function
    | `AccessDeniedException _ -> "com.amazonaws.kendra#AccessDeniedException"
    | `ConflictException _ -> "com.amazonaws.kendra#ConflictException"
    | `InternalServerException _ -> "com.amazonaws.kendra#InternalServerException"
    | `ResourceNotFoundException _ -> "com.amazonaws.kendra#ResourceNotFoundException"
    | `ServiceQuotaExceededException _ -> "com.amazonaws.kendra#ServiceQuotaExceededException"
    | `ThrottlingException _ -> "com.amazonaws.kendra#ThrottlingException"
    | `ValidationException _ -> "com.amazonaws.kendra#ValidationException"
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

  let request context (request : create_experience_request) =
    let input = Json_serializers.create_experience_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"AWSKendraFrontendService.CreateExperience"
      ~service ~context ~input
      ~output_deserializer:Json_deserializers.create_experience_response_of_yojson
      ~error_deserializer
end

module CreateFaq = struct
  let error_to_string = function
    | `AccessDeniedException _ -> "com.amazonaws.kendra#AccessDeniedException"
    | `ConflictException _ -> "com.amazonaws.kendra#ConflictException"
    | `InternalServerException _ -> "com.amazonaws.kendra#InternalServerException"
    | `ResourceNotFoundException _ -> "com.amazonaws.kendra#ResourceNotFoundException"
    | `ServiceQuotaExceededException _ -> "com.amazonaws.kendra#ServiceQuotaExceededException"
    | `ThrottlingException _ -> "com.amazonaws.kendra#ThrottlingException"
    | `ValidationException _ -> "com.amazonaws.kendra#ValidationException"
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

  let request context (request : create_faq_request) =
    let input = Json_serializers.create_faq_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"AWSKendraFrontendService.CreateFaq" ~service
      ~context ~input ~output_deserializer:Json_deserializers.create_faq_response_of_yojson
      ~error_deserializer
end

module CreateFeaturedResultsSet = struct
  let error_to_string = function
    | `AccessDeniedException _ -> "com.amazonaws.kendra#AccessDeniedException"
    | `ConflictException _ -> "com.amazonaws.kendra#ConflictException"
    | `FeaturedResultsConflictException _ -> "com.amazonaws.kendra#FeaturedResultsConflictException"
    | `InternalServerException _ -> "com.amazonaws.kendra#InternalServerException"
    | `ResourceNotFoundException _ -> "com.amazonaws.kendra#ResourceNotFoundException"
    | `ThrottlingException _ -> "com.amazonaws.kendra#ThrottlingException"
    | `ValidationException _ -> "com.amazonaws.kendra#ValidationException"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "AccessDeniedException" ->
          `AccessDeniedException (Json_deserializers.access_denied_exception_of_yojson tree path)
      | _, "ConflictException" ->
          `ConflictException (Json_deserializers.conflict_exception_of_yojson tree path)
      | _, "FeaturedResultsConflictException" ->
          `FeaturedResultsConflictException
            (Json_deserializers.featured_results_conflict_exception_of_yojson tree path)
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

  let request context (request : create_featured_results_set_request) =
    let input = Json_serializers.create_featured_results_set_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request
      ~shape_name:"AWSKendraFrontendService.CreateFeaturedResultsSet" ~service ~context ~input
      ~output_deserializer:Json_deserializers.create_featured_results_set_response_of_yojson
      ~error_deserializer
end

module CreateIndex = struct
  let error_to_string = function
    | `AccessDeniedException _ -> "com.amazonaws.kendra#AccessDeniedException"
    | `ConflictException _ -> "com.amazonaws.kendra#ConflictException"
    | `InternalServerException _ -> "com.amazonaws.kendra#InternalServerException"
    | `ResourceAlreadyExistException _ -> "com.amazonaws.kendra#ResourceAlreadyExistException"
    | `ServiceQuotaExceededException _ -> "com.amazonaws.kendra#ServiceQuotaExceededException"
    | `ThrottlingException _ -> "com.amazonaws.kendra#ThrottlingException"
    | `ValidationException _ -> "com.amazonaws.kendra#ValidationException"
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
      | _, "ResourceAlreadyExistException" ->
          `ResourceAlreadyExistException
            (Json_deserializers.resource_already_exist_exception_of_yojson tree path)
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

  let request context (request : create_index_request) =
    let input = Json_serializers.create_index_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"AWSKendraFrontendService.CreateIndex" ~service
      ~context ~input ~output_deserializer:Json_deserializers.create_index_response_of_yojson
      ~error_deserializer
end

module CreateQuerySuggestionsBlockList = struct
  let error_to_string = function
    | `AccessDeniedException _ -> "com.amazonaws.kendra#AccessDeniedException"
    | `ConflictException _ -> "com.amazonaws.kendra#ConflictException"
    | `InternalServerException _ -> "com.amazonaws.kendra#InternalServerException"
    | `ResourceNotFoundException _ -> "com.amazonaws.kendra#ResourceNotFoundException"
    | `ServiceQuotaExceededException _ -> "com.amazonaws.kendra#ServiceQuotaExceededException"
    | `ThrottlingException _ -> "com.amazonaws.kendra#ThrottlingException"
    | `ValidationException _ -> "com.amazonaws.kendra#ValidationException"
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

  let request context (request : create_query_suggestions_block_list_request) =
    let input = Json_serializers.create_query_suggestions_block_list_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request
      ~shape_name:"AWSKendraFrontendService.CreateQuerySuggestionsBlockList" ~service ~context
      ~input
      ~output_deserializer:Json_deserializers.create_query_suggestions_block_list_response_of_yojson
      ~error_deserializer
end

module CreateThesaurus = struct
  let error_to_string = function
    | `AccessDeniedException _ -> "com.amazonaws.kendra#AccessDeniedException"
    | `ConflictException _ -> "com.amazonaws.kendra#ConflictException"
    | `InternalServerException _ -> "com.amazonaws.kendra#InternalServerException"
    | `ResourceNotFoundException _ -> "com.amazonaws.kendra#ResourceNotFoundException"
    | `ServiceQuotaExceededException _ -> "com.amazonaws.kendra#ServiceQuotaExceededException"
    | `ThrottlingException _ -> "com.amazonaws.kendra#ThrottlingException"
    | `ValidationException _ -> "com.amazonaws.kendra#ValidationException"
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

  let request context (request : create_thesaurus_request) =
    let input = Json_serializers.create_thesaurus_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"AWSKendraFrontendService.CreateThesaurus"
      ~service ~context ~input
      ~output_deserializer:Json_deserializers.create_thesaurus_response_of_yojson
      ~error_deserializer
end

module DeleteAccessControlConfiguration = struct
  let error_to_string = function
    | `AccessDeniedException _ -> "com.amazonaws.kendra#AccessDeniedException"
    | `ConflictException _ -> "com.amazonaws.kendra#ConflictException"
    | `InternalServerException _ -> "com.amazonaws.kendra#InternalServerException"
    | `ResourceNotFoundException _ -> "com.amazonaws.kendra#ResourceNotFoundException"
    | `ThrottlingException _ -> "com.amazonaws.kendra#ThrottlingException"
    | `ValidationException _ -> "com.amazonaws.kendra#ValidationException"
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

  let request context (request : delete_access_control_configuration_request) =
    let input = Json_serializers.delete_access_control_configuration_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request
      ~shape_name:"AWSKendraFrontendService.DeleteAccessControlConfiguration" ~service ~context
      ~input
      ~output_deserializer:Json_deserializers.delete_access_control_configuration_response_of_yojson
      ~error_deserializer
end

module DeleteDataSource = struct
  let error_to_string = function
    | `AccessDeniedException _ -> "com.amazonaws.kendra#AccessDeniedException"
    | `ConflictException _ -> "com.amazonaws.kendra#ConflictException"
    | `InternalServerException _ -> "com.amazonaws.kendra#InternalServerException"
    | `ResourceNotFoundException _ -> "com.amazonaws.kendra#ResourceNotFoundException"
    | `ThrottlingException _ -> "com.amazonaws.kendra#ThrottlingException"
    | `ValidationException _ -> "com.amazonaws.kendra#ValidationException"
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

  let request context (request : delete_data_source_request) =
    let input = Json_serializers.delete_data_source_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"AWSKendraFrontendService.DeleteDataSource"
      ~service ~context ~input
      ~output_deserializer:Smaws_Lib.Smithy_api.Json_deserializers.unit__of_yojson
      ~error_deserializer
end

module DeleteExperience = struct
  let error_to_string = function
    | `AccessDeniedException _ -> "com.amazonaws.kendra#AccessDeniedException"
    | `ConflictException _ -> "com.amazonaws.kendra#ConflictException"
    | `InternalServerException _ -> "com.amazonaws.kendra#InternalServerException"
    | `ResourceNotFoundException _ -> "com.amazonaws.kendra#ResourceNotFoundException"
    | `ThrottlingException _ -> "com.amazonaws.kendra#ThrottlingException"
    | `ValidationException _ -> "com.amazonaws.kendra#ValidationException"
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

  let request context (request : delete_experience_request) =
    let input = Json_serializers.delete_experience_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"AWSKendraFrontendService.DeleteExperience"
      ~service ~context ~input
      ~output_deserializer:Json_deserializers.delete_experience_response_of_yojson
      ~error_deserializer
end

module DeleteFaq = struct
  let error_to_string = function
    | `AccessDeniedException _ -> "com.amazonaws.kendra#AccessDeniedException"
    | `ConflictException _ -> "com.amazonaws.kendra#ConflictException"
    | `InternalServerException _ -> "com.amazonaws.kendra#InternalServerException"
    | `ResourceNotFoundException _ -> "com.amazonaws.kendra#ResourceNotFoundException"
    | `ThrottlingException _ -> "com.amazonaws.kendra#ThrottlingException"
    | `ValidationException _ -> "com.amazonaws.kendra#ValidationException"
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

  let request context (request : delete_faq_request) =
    let input = Json_serializers.delete_faq_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"AWSKendraFrontendService.DeleteFaq" ~service
      ~context ~input ~output_deserializer:Smaws_Lib.Smithy_api.Json_deserializers.unit__of_yojson
      ~error_deserializer
end

module DeleteIndex = struct
  let error_to_string = function
    | `AccessDeniedException _ -> "com.amazonaws.kendra#AccessDeniedException"
    | `ConflictException _ -> "com.amazonaws.kendra#ConflictException"
    | `InternalServerException _ -> "com.amazonaws.kendra#InternalServerException"
    | `ResourceNotFoundException _ -> "com.amazonaws.kendra#ResourceNotFoundException"
    | `ThrottlingException _ -> "com.amazonaws.kendra#ThrottlingException"
    | `ValidationException _ -> "com.amazonaws.kendra#ValidationException"
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

  let request context (request : delete_index_request) =
    let input = Json_serializers.delete_index_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"AWSKendraFrontendService.DeleteIndex" ~service
      ~context ~input ~output_deserializer:Smaws_Lib.Smithy_api.Json_deserializers.unit__of_yojson
      ~error_deserializer
end

module DeletePrincipalMapping = struct
  let error_to_string = function
    | `AccessDeniedException _ -> "com.amazonaws.kendra#AccessDeniedException"
    | `ConflictException _ -> "com.amazonaws.kendra#ConflictException"
    | `InternalServerException _ -> "com.amazonaws.kendra#InternalServerException"
    | `ResourceNotFoundException _ -> "com.amazonaws.kendra#ResourceNotFoundException"
    | `ThrottlingException _ -> "com.amazonaws.kendra#ThrottlingException"
    | `ValidationException _ -> "com.amazonaws.kendra#ValidationException"
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

  let request context (request : delete_principal_mapping_request) =
    let input = Json_serializers.delete_principal_mapping_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request
      ~shape_name:"AWSKendraFrontendService.DeletePrincipalMapping" ~service ~context ~input
      ~output_deserializer:Smaws_Lib.Smithy_api.Json_deserializers.unit__of_yojson
      ~error_deserializer
end

module DeleteQuerySuggestionsBlockList = struct
  let error_to_string = function
    | `AccessDeniedException _ -> "com.amazonaws.kendra#AccessDeniedException"
    | `ConflictException _ -> "com.amazonaws.kendra#ConflictException"
    | `InternalServerException _ -> "com.amazonaws.kendra#InternalServerException"
    | `ResourceNotFoundException _ -> "com.amazonaws.kendra#ResourceNotFoundException"
    | `ThrottlingException _ -> "com.amazonaws.kendra#ThrottlingException"
    | `ValidationException _ -> "com.amazonaws.kendra#ValidationException"
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

  let request context (request : delete_query_suggestions_block_list_request) =
    let input = Json_serializers.delete_query_suggestions_block_list_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request
      ~shape_name:"AWSKendraFrontendService.DeleteQuerySuggestionsBlockList" ~service ~context
      ~input ~output_deserializer:Smaws_Lib.Smithy_api.Json_deserializers.unit__of_yojson
      ~error_deserializer
end

module DeleteThesaurus = struct
  let error_to_string = function
    | `AccessDeniedException _ -> "com.amazonaws.kendra#AccessDeniedException"
    | `ConflictException _ -> "com.amazonaws.kendra#ConflictException"
    | `InternalServerException _ -> "com.amazonaws.kendra#InternalServerException"
    | `ResourceNotFoundException _ -> "com.amazonaws.kendra#ResourceNotFoundException"
    | `ThrottlingException _ -> "com.amazonaws.kendra#ThrottlingException"
    | `ValidationException _ -> "com.amazonaws.kendra#ValidationException"
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

  let request context (request : delete_thesaurus_request) =
    let input = Json_serializers.delete_thesaurus_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"AWSKendraFrontendService.DeleteThesaurus"
      ~service ~context ~input
      ~output_deserializer:Smaws_Lib.Smithy_api.Json_deserializers.unit__of_yojson
      ~error_deserializer
end

module DescribeAccessControlConfiguration = struct
  let error_to_string = function
    | `AccessDeniedException _ -> "com.amazonaws.kendra#AccessDeniedException"
    | `InternalServerException _ -> "com.amazonaws.kendra#InternalServerException"
    | `ResourceNotFoundException _ -> "com.amazonaws.kendra#ResourceNotFoundException"
    | `ThrottlingException _ -> "com.amazonaws.kendra#ThrottlingException"
    | `ValidationException _ -> "com.amazonaws.kendra#ValidationException"
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

  let request context (request : describe_access_control_configuration_request) =
    let input = Json_serializers.describe_access_control_configuration_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request
      ~shape_name:"AWSKendraFrontendService.DescribeAccessControlConfiguration" ~service ~context
      ~input
      ~output_deserializer:
        Json_deserializers.describe_access_control_configuration_response_of_yojson
      ~error_deserializer
end

module DescribeDataSource = struct
  let error_to_string = function
    | `AccessDeniedException _ -> "com.amazonaws.kendra#AccessDeniedException"
    | `InternalServerException _ -> "com.amazonaws.kendra#InternalServerException"
    | `ResourceNotFoundException _ -> "com.amazonaws.kendra#ResourceNotFoundException"
    | `ThrottlingException _ -> "com.amazonaws.kendra#ThrottlingException"
    | `ValidationException _ -> "com.amazonaws.kendra#ValidationException"
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

  let request context (request : describe_data_source_request) =
    let input = Json_serializers.describe_data_source_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"AWSKendraFrontendService.DescribeDataSource"
      ~service ~context ~input
      ~output_deserializer:Json_deserializers.describe_data_source_response_of_yojson
      ~error_deserializer
end

module DescribeExperience = struct
  let error_to_string = function
    | `AccessDeniedException _ -> "com.amazonaws.kendra#AccessDeniedException"
    | `InternalServerException _ -> "com.amazonaws.kendra#InternalServerException"
    | `ResourceNotFoundException _ -> "com.amazonaws.kendra#ResourceNotFoundException"
    | `ThrottlingException _ -> "com.amazonaws.kendra#ThrottlingException"
    | `ValidationException _ -> "com.amazonaws.kendra#ValidationException"
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

  let request context (request : describe_experience_request) =
    let input = Json_serializers.describe_experience_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"AWSKendraFrontendService.DescribeExperience"
      ~service ~context ~input
      ~output_deserializer:Json_deserializers.describe_experience_response_of_yojson
      ~error_deserializer
end

module DescribeFaq = struct
  let error_to_string = function
    | `AccessDeniedException _ -> "com.amazonaws.kendra#AccessDeniedException"
    | `InternalServerException _ -> "com.amazonaws.kendra#InternalServerException"
    | `ResourceNotFoundException _ -> "com.amazonaws.kendra#ResourceNotFoundException"
    | `ThrottlingException _ -> "com.amazonaws.kendra#ThrottlingException"
    | `ValidationException _ -> "com.amazonaws.kendra#ValidationException"
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

  let request context (request : describe_faq_request) =
    let input = Json_serializers.describe_faq_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"AWSKendraFrontendService.DescribeFaq" ~service
      ~context ~input ~output_deserializer:Json_deserializers.describe_faq_response_of_yojson
      ~error_deserializer
end

module DescribeFeaturedResultsSet = struct
  let error_to_string = function
    | `AccessDeniedException _ -> "com.amazonaws.kendra#AccessDeniedException"
    | `InternalServerException _ -> "com.amazonaws.kendra#InternalServerException"
    | `ResourceNotFoundException _ -> "com.amazonaws.kendra#ResourceNotFoundException"
    | `ThrottlingException _ -> "com.amazonaws.kendra#ThrottlingException"
    | `ValidationException _ -> "com.amazonaws.kendra#ValidationException"
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

  let request context (request : describe_featured_results_set_request) =
    let input = Json_serializers.describe_featured_results_set_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request
      ~shape_name:"AWSKendraFrontendService.DescribeFeaturedResultsSet" ~service ~context ~input
      ~output_deserializer:Json_deserializers.describe_featured_results_set_response_of_yojson
      ~error_deserializer
end

module DescribeIndex = struct
  let error_to_string = function
    | `AccessDeniedException _ -> "com.amazonaws.kendra#AccessDeniedException"
    | `InternalServerException _ -> "com.amazonaws.kendra#InternalServerException"
    | `ResourceNotFoundException _ -> "com.amazonaws.kendra#ResourceNotFoundException"
    | `ThrottlingException _ -> "com.amazonaws.kendra#ThrottlingException"
    | `ValidationException _ -> "com.amazonaws.kendra#ValidationException"
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

  let request context (request : describe_index_request) =
    let input = Json_serializers.describe_index_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"AWSKendraFrontendService.DescribeIndex"
      ~service ~context ~input
      ~output_deserializer:Json_deserializers.describe_index_response_of_yojson ~error_deserializer
end

module DescribePrincipalMapping = struct
  let error_to_string = function
    | `AccessDeniedException _ -> "com.amazonaws.kendra#AccessDeniedException"
    | `InternalServerException _ -> "com.amazonaws.kendra#InternalServerException"
    | `ResourceNotFoundException _ -> "com.amazonaws.kendra#ResourceNotFoundException"
    | `ThrottlingException _ -> "com.amazonaws.kendra#ThrottlingException"
    | `ValidationException _ -> "com.amazonaws.kendra#ValidationException"
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

  let request context (request : describe_principal_mapping_request) =
    let input = Json_serializers.describe_principal_mapping_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request
      ~shape_name:"AWSKendraFrontendService.DescribePrincipalMapping" ~service ~context ~input
      ~output_deserializer:Json_deserializers.describe_principal_mapping_response_of_yojson
      ~error_deserializer
end

module DescribeQuerySuggestionsBlockList = struct
  let error_to_string = function
    | `AccessDeniedException _ -> "com.amazonaws.kendra#AccessDeniedException"
    | `InternalServerException _ -> "com.amazonaws.kendra#InternalServerException"
    | `ResourceNotFoundException _ -> "com.amazonaws.kendra#ResourceNotFoundException"
    | `ThrottlingException _ -> "com.amazonaws.kendra#ThrottlingException"
    | `ValidationException _ -> "com.amazonaws.kendra#ValidationException"
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

  let request context (request : describe_query_suggestions_block_list_request) =
    let input = Json_serializers.describe_query_suggestions_block_list_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request
      ~shape_name:"AWSKendraFrontendService.DescribeQuerySuggestionsBlockList" ~service ~context
      ~input
      ~output_deserializer:
        Json_deserializers.describe_query_suggestions_block_list_response_of_yojson
      ~error_deserializer
end

module DescribeQuerySuggestionsConfig = struct
  let error_to_string = function
    | `AccessDeniedException _ -> "com.amazonaws.kendra#AccessDeniedException"
    | `InternalServerException _ -> "com.amazonaws.kendra#InternalServerException"
    | `ResourceNotFoundException _ -> "com.amazonaws.kendra#ResourceNotFoundException"
    | `ThrottlingException _ -> "com.amazonaws.kendra#ThrottlingException"
    | `ValidationException _ -> "com.amazonaws.kendra#ValidationException"
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

  let request context (request : describe_query_suggestions_config_request) =
    let input = Json_serializers.describe_query_suggestions_config_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request
      ~shape_name:"AWSKendraFrontendService.DescribeQuerySuggestionsConfig" ~service ~context ~input
      ~output_deserializer:Json_deserializers.describe_query_suggestions_config_response_of_yojson
      ~error_deserializer
end

module DescribeThesaurus = struct
  let error_to_string = function
    | `AccessDeniedException _ -> "com.amazonaws.kendra#AccessDeniedException"
    | `InternalServerException _ -> "com.amazonaws.kendra#InternalServerException"
    | `ResourceNotFoundException _ -> "com.amazonaws.kendra#ResourceNotFoundException"
    | `ThrottlingException _ -> "com.amazonaws.kendra#ThrottlingException"
    | `ValidationException _ -> "com.amazonaws.kendra#ValidationException"
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

  let request context (request : describe_thesaurus_request) =
    let input = Json_serializers.describe_thesaurus_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"AWSKendraFrontendService.DescribeThesaurus"
      ~service ~context ~input
      ~output_deserializer:Json_deserializers.describe_thesaurus_response_of_yojson
      ~error_deserializer
end

module DisassociateEntitiesFromExperience = struct
  let error_to_string = function
    | `AccessDeniedException _ -> "com.amazonaws.kendra#AccessDeniedException"
    | `InternalServerException _ -> "com.amazonaws.kendra#InternalServerException"
    | `ResourceNotFoundException _ -> "com.amazonaws.kendra#ResourceNotFoundException"
    | `ThrottlingException _ -> "com.amazonaws.kendra#ThrottlingException"
    | `ValidationException _ -> "com.amazonaws.kendra#ValidationException"
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

  let request context (request : disassociate_entities_from_experience_request) =
    let input = Json_serializers.disassociate_entities_from_experience_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request
      ~shape_name:"AWSKendraFrontendService.DisassociateEntitiesFromExperience" ~service ~context
      ~input
      ~output_deserializer:
        Json_deserializers.disassociate_entities_from_experience_response_of_yojson
      ~error_deserializer
end

module DisassociatePersonasFromEntities = struct
  let error_to_string = function
    | `AccessDeniedException _ -> "com.amazonaws.kendra#AccessDeniedException"
    | `InternalServerException _ -> "com.amazonaws.kendra#InternalServerException"
    | `ResourceNotFoundException _ -> "com.amazonaws.kendra#ResourceNotFoundException"
    | `ThrottlingException _ -> "com.amazonaws.kendra#ThrottlingException"
    | `ValidationException _ -> "com.amazonaws.kendra#ValidationException"
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

  let request context (request : disassociate_personas_from_entities_request) =
    let input = Json_serializers.disassociate_personas_from_entities_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request
      ~shape_name:"AWSKendraFrontendService.DisassociatePersonasFromEntities" ~service ~context
      ~input
      ~output_deserializer:Json_deserializers.disassociate_personas_from_entities_response_of_yojson
      ~error_deserializer
end

module GetQuerySuggestions = struct
  let error_to_string = function
    | `AccessDeniedException _ -> "com.amazonaws.kendra#AccessDeniedException"
    | `ConflictException _ -> "com.amazonaws.kendra#ConflictException"
    | `InternalServerException _ -> "com.amazonaws.kendra#InternalServerException"
    | `ResourceNotFoundException _ -> "com.amazonaws.kendra#ResourceNotFoundException"
    | `ServiceQuotaExceededException _ -> "com.amazonaws.kendra#ServiceQuotaExceededException"
    | `ThrottlingException _ -> "com.amazonaws.kendra#ThrottlingException"
    | `ValidationException _ -> "com.amazonaws.kendra#ValidationException"
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

  let request context (request : get_query_suggestions_request) =
    let input = Json_serializers.get_query_suggestions_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"AWSKendraFrontendService.GetQuerySuggestions"
      ~service ~context ~input
      ~output_deserializer:Json_deserializers.get_query_suggestions_response_of_yojson
      ~error_deserializer
end

module GetSnapshots = struct
  let error_to_string = function
    | `AccessDeniedException _ -> "com.amazonaws.kendra#AccessDeniedException"
    | `InternalServerException _ -> "com.amazonaws.kendra#InternalServerException"
    | `InvalidRequestException _ -> "com.amazonaws.kendra#InvalidRequestException"
    | `ResourceNotFoundException _ -> "com.amazonaws.kendra#ResourceNotFoundException"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "AccessDeniedException" ->
          `AccessDeniedException (Json_deserializers.access_denied_exception_of_yojson tree path)
      | _, "InternalServerException" ->
          `InternalServerException
            (Json_deserializers.internal_server_exception_of_yojson tree path)
      | _, "InvalidRequestException" ->
          `InvalidRequestException
            (Json_deserializers.invalid_request_exception_of_yojson tree path)
      | _, "ResourceNotFoundException" ->
          `ResourceNotFoundException
            (Json_deserializers.resource_not_found_exception_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : get_snapshots_request) =
    let input = Json_serializers.get_snapshots_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"AWSKendraFrontendService.GetSnapshots" ~service
      ~context ~input ~output_deserializer:Json_deserializers.get_snapshots_response_of_yojson
      ~error_deserializer
end

module ListAccessControlConfigurations = struct
  let error_to_string = function
    | `AccessDeniedException _ -> "com.amazonaws.kendra#AccessDeniedException"
    | `InternalServerException _ -> "com.amazonaws.kendra#InternalServerException"
    | `ResourceNotFoundException _ -> "com.amazonaws.kendra#ResourceNotFoundException"
    | `ThrottlingException _ -> "com.amazonaws.kendra#ThrottlingException"
    | `ValidationException _ -> "com.amazonaws.kendra#ValidationException"
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

  let request context (request : list_access_control_configurations_request) =
    let input = Json_serializers.list_access_control_configurations_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request
      ~shape_name:"AWSKendraFrontendService.ListAccessControlConfigurations" ~service ~context
      ~input
      ~output_deserializer:Json_deserializers.list_access_control_configurations_response_of_yojson
      ~error_deserializer
end

module ListDataSourceSyncJobs = struct
  let error_to_string = function
    | `AccessDeniedException _ -> "com.amazonaws.kendra#AccessDeniedException"
    | `ConflictException _ -> "com.amazonaws.kendra#ConflictException"
    | `InternalServerException _ -> "com.amazonaws.kendra#InternalServerException"
    | `ResourceNotFoundException _ -> "com.amazonaws.kendra#ResourceNotFoundException"
    | `ThrottlingException _ -> "com.amazonaws.kendra#ThrottlingException"
    | `ValidationException _ -> "com.amazonaws.kendra#ValidationException"
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

  let request context (request : list_data_source_sync_jobs_request) =
    let input = Json_serializers.list_data_source_sync_jobs_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request
      ~shape_name:"AWSKendraFrontendService.ListDataSourceSyncJobs" ~service ~context ~input
      ~output_deserializer:Json_deserializers.list_data_source_sync_jobs_response_of_yojson
      ~error_deserializer
end

module ListDataSources = struct
  let error_to_string = function
    | `AccessDeniedException _ -> "com.amazonaws.kendra#AccessDeniedException"
    | `InternalServerException _ -> "com.amazonaws.kendra#InternalServerException"
    | `ResourceNotFoundException _ -> "com.amazonaws.kendra#ResourceNotFoundException"
    | `ThrottlingException _ -> "com.amazonaws.kendra#ThrottlingException"
    | `ValidationException _ -> "com.amazonaws.kendra#ValidationException"
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

  let request context (request : list_data_sources_request) =
    let input = Json_serializers.list_data_sources_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"AWSKendraFrontendService.ListDataSources"
      ~service ~context ~input
      ~output_deserializer:Json_deserializers.list_data_sources_response_of_yojson
      ~error_deserializer
end

module ListEntityPersonas = struct
  let error_to_string = function
    | `AccessDeniedException _ -> "com.amazonaws.kendra#AccessDeniedException"
    | `InternalServerException _ -> "com.amazonaws.kendra#InternalServerException"
    | `ResourceNotFoundException _ -> "com.amazonaws.kendra#ResourceNotFoundException"
    | `ThrottlingException _ -> "com.amazonaws.kendra#ThrottlingException"
    | `ValidationException _ -> "com.amazonaws.kendra#ValidationException"
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

  let request context (request : list_entity_personas_request) =
    let input = Json_serializers.list_entity_personas_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"AWSKendraFrontendService.ListEntityPersonas"
      ~service ~context ~input
      ~output_deserializer:Json_deserializers.list_entity_personas_response_of_yojson
      ~error_deserializer
end

module ListExperienceEntities = struct
  let error_to_string = function
    | `AccessDeniedException _ -> "com.amazonaws.kendra#AccessDeniedException"
    | `InternalServerException _ -> "com.amazonaws.kendra#InternalServerException"
    | `ResourceNotFoundException _ -> "com.amazonaws.kendra#ResourceNotFoundException"
    | `ThrottlingException _ -> "com.amazonaws.kendra#ThrottlingException"
    | `ValidationException _ -> "com.amazonaws.kendra#ValidationException"
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

  let request context (request : list_experience_entities_request) =
    let input = Json_serializers.list_experience_entities_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request
      ~shape_name:"AWSKendraFrontendService.ListExperienceEntities" ~service ~context ~input
      ~output_deserializer:Json_deserializers.list_experience_entities_response_of_yojson
      ~error_deserializer
end

module ListExperiences = struct
  let error_to_string = function
    | `AccessDeniedException _ -> "com.amazonaws.kendra#AccessDeniedException"
    | `InternalServerException _ -> "com.amazonaws.kendra#InternalServerException"
    | `ResourceNotFoundException _ -> "com.amazonaws.kendra#ResourceNotFoundException"
    | `ThrottlingException _ -> "com.amazonaws.kendra#ThrottlingException"
    | `ValidationException _ -> "com.amazonaws.kendra#ValidationException"
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

  let request context (request : list_experiences_request) =
    let input = Json_serializers.list_experiences_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"AWSKendraFrontendService.ListExperiences"
      ~service ~context ~input
      ~output_deserializer:Json_deserializers.list_experiences_response_of_yojson
      ~error_deserializer
end

module ListFaqs = struct
  let error_to_string = function
    | `AccessDeniedException _ -> "com.amazonaws.kendra#AccessDeniedException"
    | `InternalServerException _ -> "com.amazonaws.kendra#InternalServerException"
    | `ResourceNotFoundException _ -> "com.amazonaws.kendra#ResourceNotFoundException"
    | `ThrottlingException _ -> "com.amazonaws.kendra#ThrottlingException"
    | `ValidationException _ -> "com.amazonaws.kendra#ValidationException"
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

  let request context (request : list_faqs_request) =
    let input = Json_serializers.list_faqs_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"AWSKendraFrontendService.ListFaqs" ~service
      ~context ~input ~output_deserializer:Json_deserializers.list_faqs_response_of_yojson
      ~error_deserializer
end

module ListFeaturedResultsSets = struct
  let error_to_string = function
    | `AccessDeniedException _ -> "com.amazonaws.kendra#AccessDeniedException"
    | `InternalServerException _ -> "com.amazonaws.kendra#InternalServerException"
    | `ResourceNotFoundException _ -> "com.amazonaws.kendra#ResourceNotFoundException"
    | `ThrottlingException _ -> "com.amazonaws.kendra#ThrottlingException"
    | `ValidationException _ -> "com.amazonaws.kendra#ValidationException"
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

  let request context (request : list_featured_results_sets_request) =
    let input = Json_serializers.list_featured_results_sets_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request
      ~shape_name:"AWSKendraFrontendService.ListFeaturedResultsSets" ~service ~context ~input
      ~output_deserializer:Json_deserializers.list_featured_results_sets_response_of_yojson
      ~error_deserializer
end

module ListGroupsOlderThanOrderingId = struct
  let error_to_string = function
    | `AccessDeniedException _ -> "com.amazonaws.kendra#AccessDeniedException"
    | `ConflictException _ -> "com.amazonaws.kendra#ConflictException"
    | `InternalServerException _ -> "com.amazonaws.kendra#InternalServerException"
    | `ResourceNotFoundException _ -> "com.amazonaws.kendra#ResourceNotFoundException"
    | `ThrottlingException _ -> "com.amazonaws.kendra#ThrottlingException"
    | `ValidationException _ -> "com.amazonaws.kendra#ValidationException"
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

  let request context (request : list_groups_older_than_ordering_id_request) =
    let input = Json_serializers.list_groups_older_than_ordering_id_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request
      ~shape_name:"AWSKendraFrontendService.ListGroupsOlderThanOrderingId" ~service ~context ~input
      ~output_deserializer:Json_deserializers.list_groups_older_than_ordering_id_response_of_yojson
      ~error_deserializer
end

module ListIndices = struct
  let error_to_string = function
    | `AccessDeniedException _ -> "com.amazonaws.kendra#AccessDeniedException"
    | `InternalServerException _ -> "com.amazonaws.kendra#InternalServerException"
    | `ThrottlingException _ -> "com.amazonaws.kendra#ThrottlingException"
    | `ValidationException _ -> "com.amazonaws.kendra#ValidationException"
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

  let request context (request : list_indices_request) =
    let input = Json_serializers.list_indices_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"AWSKendraFrontendService.ListIndices" ~service
      ~context ~input ~output_deserializer:Json_deserializers.list_indices_response_of_yojson
      ~error_deserializer
end

module ListQuerySuggestionsBlockLists = struct
  let error_to_string = function
    | `AccessDeniedException _ -> "com.amazonaws.kendra#AccessDeniedException"
    | `InternalServerException _ -> "com.amazonaws.kendra#InternalServerException"
    | `ResourceNotFoundException _ -> "com.amazonaws.kendra#ResourceNotFoundException"
    | `ThrottlingException _ -> "com.amazonaws.kendra#ThrottlingException"
    | `ValidationException _ -> "com.amazonaws.kendra#ValidationException"
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

  let request context (request : list_query_suggestions_block_lists_request) =
    let input = Json_serializers.list_query_suggestions_block_lists_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request
      ~shape_name:"AWSKendraFrontendService.ListQuerySuggestionsBlockLists" ~service ~context ~input
      ~output_deserializer:Json_deserializers.list_query_suggestions_block_lists_response_of_yojson
      ~error_deserializer
end

module ListTagsForResource = struct
  let error_to_string = function
    | `AccessDeniedException _ -> "com.amazonaws.kendra#AccessDeniedException"
    | `InternalServerException _ -> "com.amazonaws.kendra#InternalServerException"
    | `ResourceUnavailableException _ -> "com.amazonaws.kendra#ResourceUnavailableException"
    | `ThrottlingException _ -> "com.amazonaws.kendra#ThrottlingException"
    | `ValidationException _ -> "com.amazonaws.kendra#ValidationException"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "AccessDeniedException" ->
          `AccessDeniedException (Json_deserializers.access_denied_exception_of_yojson tree path)
      | _, "InternalServerException" ->
          `InternalServerException
            (Json_deserializers.internal_server_exception_of_yojson tree path)
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

  let request context (request : list_tags_for_resource_request) =
    let input = Json_serializers.list_tags_for_resource_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"AWSKendraFrontendService.ListTagsForResource"
      ~service ~context ~input
      ~output_deserializer:Json_deserializers.list_tags_for_resource_response_of_yojson
      ~error_deserializer
end

module ListThesauri = struct
  let error_to_string = function
    | `AccessDeniedException _ -> "com.amazonaws.kendra#AccessDeniedException"
    | `InternalServerException _ -> "com.amazonaws.kendra#InternalServerException"
    | `ResourceNotFoundException _ -> "com.amazonaws.kendra#ResourceNotFoundException"
    | `ThrottlingException _ -> "com.amazonaws.kendra#ThrottlingException"
    | `ValidationException _ -> "com.amazonaws.kendra#ValidationException"
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

  let request context (request : list_thesauri_request) =
    let input = Json_serializers.list_thesauri_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"AWSKendraFrontendService.ListThesauri" ~service
      ~context ~input ~output_deserializer:Json_deserializers.list_thesauri_response_of_yojson
      ~error_deserializer
end

module PutPrincipalMapping = struct
  let error_to_string = function
    | `AccessDeniedException _ -> "com.amazonaws.kendra#AccessDeniedException"
    | `ConflictException _ -> "com.amazonaws.kendra#ConflictException"
    | `InternalServerException _ -> "com.amazonaws.kendra#InternalServerException"
    | `ResourceNotFoundException _ -> "com.amazonaws.kendra#ResourceNotFoundException"
    | `ServiceQuotaExceededException _ -> "com.amazonaws.kendra#ServiceQuotaExceededException"
    | `ThrottlingException _ -> "com.amazonaws.kendra#ThrottlingException"
    | `ValidationException _ -> "com.amazonaws.kendra#ValidationException"
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

  let request context (request : put_principal_mapping_request) =
    let input = Json_serializers.put_principal_mapping_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"AWSKendraFrontendService.PutPrincipalMapping"
      ~service ~context ~input
      ~output_deserializer:Smaws_Lib.Smithy_api.Json_deserializers.unit__of_yojson
      ~error_deserializer
end

module Query = struct
  let error_to_string = function
    | `AccessDeniedException _ -> "com.amazonaws.kendra#AccessDeniedException"
    | `ConflictException _ -> "com.amazonaws.kendra#ConflictException"
    | `InternalServerException _ -> "com.amazonaws.kendra#InternalServerException"
    | `ResourceNotFoundException _ -> "com.amazonaws.kendra#ResourceNotFoundException"
    | `ServiceQuotaExceededException _ -> "com.amazonaws.kendra#ServiceQuotaExceededException"
    | `ThrottlingException _ -> "com.amazonaws.kendra#ThrottlingException"
    | `ValidationException _ -> "com.amazonaws.kendra#ValidationException"
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

  let request context (request : query_request) =
    let input = Json_serializers.query_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"AWSKendraFrontendService.Query" ~service
      ~context ~input ~output_deserializer:Json_deserializers.query_result_of_yojson
      ~error_deserializer
end

module Retrieve = struct
  let error_to_string = function
    | `AccessDeniedException _ -> "com.amazonaws.kendra#AccessDeniedException"
    | `ConflictException _ -> "com.amazonaws.kendra#ConflictException"
    | `InternalServerException _ -> "com.amazonaws.kendra#InternalServerException"
    | `ResourceNotFoundException _ -> "com.amazonaws.kendra#ResourceNotFoundException"
    | `ServiceQuotaExceededException _ -> "com.amazonaws.kendra#ServiceQuotaExceededException"
    | `ThrottlingException _ -> "com.amazonaws.kendra#ThrottlingException"
    | `ValidationException _ -> "com.amazonaws.kendra#ValidationException"
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

  let request context (request : retrieve_request) =
    let input = Json_serializers.retrieve_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"AWSKendraFrontendService.Retrieve" ~service
      ~context ~input ~output_deserializer:Json_deserializers.retrieve_result_of_yojson
      ~error_deserializer
end

module StartDataSourceSyncJob = struct
  let error_to_string = function
    | `AccessDeniedException _ -> "com.amazonaws.kendra#AccessDeniedException"
    | `ConflictException _ -> "com.amazonaws.kendra#ConflictException"
    | `InternalServerException _ -> "com.amazonaws.kendra#InternalServerException"
    | `ResourceInUseException _ -> "com.amazonaws.kendra#ResourceInUseException"
    | `ResourceNotFoundException _ -> "com.amazonaws.kendra#ResourceNotFoundException"
    | `ThrottlingException _ -> "com.amazonaws.kendra#ThrottlingException"
    | `ValidationException _ -> "com.amazonaws.kendra#ValidationException"
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
      | _, "ResourceInUseException" ->
          `ResourceInUseException (Json_deserializers.resource_in_use_exception_of_yojson tree path)
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

  let request context (request : start_data_source_sync_job_request) =
    let input = Json_serializers.start_data_source_sync_job_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request
      ~shape_name:"AWSKendraFrontendService.StartDataSourceSyncJob" ~service ~context ~input
      ~output_deserializer:Json_deserializers.start_data_source_sync_job_response_of_yojson
      ~error_deserializer
end

module StopDataSourceSyncJob = struct
  let error_to_string = function
    | `AccessDeniedException _ -> "com.amazonaws.kendra#AccessDeniedException"
    | `InternalServerException _ -> "com.amazonaws.kendra#InternalServerException"
    | `ResourceNotFoundException _ -> "com.amazonaws.kendra#ResourceNotFoundException"
    | `ThrottlingException _ -> "com.amazonaws.kendra#ThrottlingException"
    | `ValidationException _ -> "com.amazonaws.kendra#ValidationException"
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

  let request context (request : stop_data_source_sync_job_request) =
    let input = Json_serializers.stop_data_source_sync_job_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"AWSKendraFrontendService.StopDataSourceSyncJob"
      ~service ~context ~input
      ~output_deserializer:Smaws_Lib.Smithy_api.Json_deserializers.unit__of_yojson
      ~error_deserializer
end

module SubmitFeedback = struct
  let error_to_string = function
    | `AccessDeniedException _ -> "com.amazonaws.kendra#AccessDeniedException"
    | `InternalServerException _ -> "com.amazonaws.kendra#InternalServerException"
    | `ResourceNotFoundException _ -> "com.amazonaws.kendra#ResourceNotFoundException"
    | `ResourceUnavailableException _ -> "com.amazonaws.kendra#ResourceUnavailableException"
    | `ThrottlingException _ -> "com.amazonaws.kendra#ThrottlingException"
    | `ValidationException _ -> "com.amazonaws.kendra#ValidationException"
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

  let request context (request : submit_feedback_request) =
    let input = Json_serializers.submit_feedback_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"AWSKendraFrontendService.SubmitFeedback"
      ~service ~context ~input
      ~output_deserializer:Smaws_Lib.Smithy_api.Json_deserializers.unit__of_yojson
      ~error_deserializer
end

module TagResource = struct
  let error_to_string = function
    | `AccessDeniedException _ -> "com.amazonaws.kendra#AccessDeniedException"
    | `InternalServerException _ -> "com.amazonaws.kendra#InternalServerException"
    | `ResourceUnavailableException _ -> "com.amazonaws.kendra#ResourceUnavailableException"
    | `ThrottlingException _ -> "com.amazonaws.kendra#ThrottlingException"
    | `ValidationException _ -> "com.amazonaws.kendra#ValidationException"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "AccessDeniedException" ->
          `AccessDeniedException (Json_deserializers.access_denied_exception_of_yojson tree path)
      | _, "InternalServerException" ->
          `InternalServerException
            (Json_deserializers.internal_server_exception_of_yojson tree path)
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

  let request context (request : tag_resource_request) =
    let input = Json_serializers.tag_resource_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"AWSKendraFrontendService.TagResource" ~service
      ~context ~input ~output_deserializer:Json_deserializers.tag_resource_response_of_yojson
      ~error_deserializer
end

module UntagResource = struct
  let error_to_string = function
    | `AccessDeniedException _ -> "com.amazonaws.kendra#AccessDeniedException"
    | `InternalServerException _ -> "com.amazonaws.kendra#InternalServerException"
    | `ResourceUnavailableException _ -> "com.amazonaws.kendra#ResourceUnavailableException"
    | `ThrottlingException _ -> "com.amazonaws.kendra#ThrottlingException"
    | `ValidationException _ -> "com.amazonaws.kendra#ValidationException"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "AccessDeniedException" ->
          `AccessDeniedException (Json_deserializers.access_denied_exception_of_yojson tree path)
      | _, "InternalServerException" ->
          `InternalServerException
            (Json_deserializers.internal_server_exception_of_yojson tree path)
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

  let request context (request : untag_resource_request) =
    let input = Json_serializers.untag_resource_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"AWSKendraFrontendService.UntagResource"
      ~service ~context ~input
      ~output_deserializer:Json_deserializers.untag_resource_response_of_yojson ~error_deserializer
end

module UpdateAccessControlConfiguration = struct
  let error_to_string = function
    | `AccessDeniedException _ -> "com.amazonaws.kendra#AccessDeniedException"
    | `ConflictException _ -> "com.amazonaws.kendra#ConflictException"
    | `InternalServerException _ -> "com.amazonaws.kendra#InternalServerException"
    | `ResourceNotFoundException _ -> "com.amazonaws.kendra#ResourceNotFoundException"
    | `ServiceQuotaExceededException _ -> "com.amazonaws.kendra#ServiceQuotaExceededException"
    | `ThrottlingException _ -> "com.amazonaws.kendra#ThrottlingException"
    | `ValidationException _ -> "com.amazonaws.kendra#ValidationException"
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

  let request context (request : update_access_control_configuration_request) =
    let input = Json_serializers.update_access_control_configuration_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request
      ~shape_name:"AWSKendraFrontendService.UpdateAccessControlConfiguration" ~service ~context
      ~input
      ~output_deserializer:Json_deserializers.update_access_control_configuration_response_of_yojson
      ~error_deserializer
end

module UpdateDataSource = struct
  let error_to_string = function
    | `AccessDeniedException _ -> "com.amazonaws.kendra#AccessDeniedException"
    | `ConflictException _ -> "com.amazonaws.kendra#ConflictException"
    | `InternalServerException _ -> "com.amazonaws.kendra#InternalServerException"
    | `ResourceNotFoundException _ -> "com.amazonaws.kendra#ResourceNotFoundException"
    | `ThrottlingException _ -> "com.amazonaws.kendra#ThrottlingException"
    | `ValidationException _ -> "com.amazonaws.kendra#ValidationException"
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

  let request context (request : update_data_source_request) =
    let input = Json_serializers.update_data_source_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"AWSKendraFrontendService.UpdateDataSource"
      ~service ~context ~input
      ~output_deserializer:Smaws_Lib.Smithy_api.Json_deserializers.unit__of_yojson
      ~error_deserializer
end

module UpdateExperience = struct
  let error_to_string = function
    | `AccessDeniedException _ -> "com.amazonaws.kendra#AccessDeniedException"
    | `ConflictException _ -> "com.amazonaws.kendra#ConflictException"
    | `InternalServerException _ -> "com.amazonaws.kendra#InternalServerException"
    | `ResourceNotFoundException _ -> "com.amazonaws.kendra#ResourceNotFoundException"
    | `ThrottlingException _ -> "com.amazonaws.kendra#ThrottlingException"
    | `ValidationException _ -> "com.amazonaws.kendra#ValidationException"
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

  let request context (request : update_experience_request) =
    let input = Json_serializers.update_experience_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"AWSKendraFrontendService.UpdateExperience"
      ~service ~context ~input
      ~output_deserializer:Smaws_Lib.Smithy_api.Json_deserializers.unit__of_yojson
      ~error_deserializer
end

module UpdateFeaturedResultsSet = struct
  let error_to_string = function
    | `AccessDeniedException _ -> "com.amazonaws.kendra#AccessDeniedException"
    | `FeaturedResultsConflictException _ -> "com.amazonaws.kendra#FeaturedResultsConflictException"
    | `InternalServerException _ -> "com.amazonaws.kendra#InternalServerException"
    | `ResourceNotFoundException _ -> "com.amazonaws.kendra#ResourceNotFoundException"
    | `ThrottlingException _ -> "com.amazonaws.kendra#ThrottlingException"
    | `ValidationException _ -> "com.amazonaws.kendra#ValidationException"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "AccessDeniedException" ->
          `AccessDeniedException (Json_deserializers.access_denied_exception_of_yojson tree path)
      | _, "FeaturedResultsConflictException" ->
          `FeaturedResultsConflictException
            (Json_deserializers.featured_results_conflict_exception_of_yojson tree path)
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

  let request context (request : update_featured_results_set_request) =
    let input = Json_serializers.update_featured_results_set_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request
      ~shape_name:"AWSKendraFrontendService.UpdateFeaturedResultsSet" ~service ~context ~input
      ~output_deserializer:Json_deserializers.update_featured_results_set_response_of_yojson
      ~error_deserializer
end

module UpdateIndex = struct
  let error_to_string = function
    | `AccessDeniedException _ -> "com.amazonaws.kendra#AccessDeniedException"
    | `ConflictException _ -> "com.amazonaws.kendra#ConflictException"
    | `InternalServerException _ -> "com.amazonaws.kendra#InternalServerException"
    | `ResourceNotFoundException _ -> "com.amazonaws.kendra#ResourceNotFoundException"
    | `ServiceQuotaExceededException _ -> "com.amazonaws.kendra#ServiceQuotaExceededException"
    | `ThrottlingException _ -> "com.amazonaws.kendra#ThrottlingException"
    | `ValidationException _ -> "com.amazonaws.kendra#ValidationException"
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

  let request context (request : update_index_request) =
    let input = Json_serializers.update_index_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"AWSKendraFrontendService.UpdateIndex" ~service
      ~context ~input ~output_deserializer:Smaws_Lib.Smithy_api.Json_deserializers.unit__of_yojson
      ~error_deserializer
end

module UpdateQuerySuggestionsBlockList = struct
  let error_to_string = function
    | `AccessDeniedException _ -> "com.amazonaws.kendra#AccessDeniedException"
    | `ConflictException _ -> "com.amazonaws.kendra#ConflictException"
    | `InternalServerException _ -> "com.amazonaws.kendra#InternalServerException"
    | `ResourceNotFoundException _ -> "com.amazonaws.kendra#ResourceNotFoundException"
    | `ThrottlingException _ -> "com.amazonaws.kendra#ThrottlingException"
    | `ValidationException _ -> "com.amazonaws.kendra#ValidationException"
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

  let request context (request : update_query_suggestions_block_list_request) =
    let input = Json_serializers.update_query_suggestions_block_list_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request
      ~shape_name:"AWSKendraFrontendService.UpdateQuerySuggestionsBlockList" ~service ~context
      ~input ~output_deserializer:Smaws_Lib.Smithy_api.Json_deserializers.unit__of_yojson
      ~error_deserializer
end

module UpdateQuerySuggestionsConfig = struct
  let error_to_string = function
    | `AccessDeniedException _ -> "com.amazonaws.kendra#AccessDeniedException"
    | `ConflictException _ -> "com.amazonaws.kendra#ConflictException"
    | `InternalServerException _ -> "com.amazonaws.kendra#InternalServerException"
    | `ResourceNotFoundException _ -> "com.amazonaws.kendra#ResourceNotFoundException"
    | `ThrottlingException _ -> "com.amazonaws.kendra#ThrottlingException"
    | `ValidationException _ -> "com.amazonaws.kendra#ValidationException"
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

  let request context (request : update_query_suggestions_config_request) =
    let input = Json_serializers.update_query_suggestions_config_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request
      ~shape_name:"AWSKendraFrontendService.UpdateQuerySuggestionsConfig" ~service ~context ~input
      ~output_deserializer:Smaws_Lib.Smithy_api.Json_deserializers.unit__of_yojson
      ~error_deserializer
end

module UpdateThesaurus = struct
  let error_to_string = function
    | `AccessDeniedException _ -> "com.amazonaws.kendra#AccessDeniedException"
    | `ConflictException _ -> "com.amazonaws.kendra#ConflictException"
    | `InternalServerException _ -> "com.amazonaws.kendra#InternalServerException"
    | `ResourceNotFoundException _ -> "com.amazonaws.kendra#ResourceNotFoundException"
    | `ThrottlingException _ -> "com.amazonaws.kendra#ThrottlingException"
    | `ValidationException _ -> "com.amazonaws.kendra#ValidationException"
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

  let request context (request : update_thesaurus_request) =
    let input = Json_serializers.update_thesaurus_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"AWSKendraFrontendService.UpdateThesaurus"
      ~service ~context ~input
      ~output_deserializer:Smaws_Lib.Smithy_api.Json_deserializers.unit__of_yojson
      ~error_deserializer
end
