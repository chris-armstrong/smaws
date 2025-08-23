open Types
open Service_metadata
module AssociateEntitiesToExperience =
  struct
    let error_deserializer tree path =
      let open Deserializers in
        let handler handler tree path =
          function
          | (_, "AccessDeniedException") ->
              `AccessDeniedException
                (access_denied_exception_of_yojson tree path)
          | (_, "InternalServerException") ->
              `InternalServerException
                (internal_server_exception_of_yojson tree path)
          | (_, "ResourceAlreadyExistException") ->
              `ResourceAlreadyExistException
                (resource_already_exist_exception_of_yojson tree path)
          | (_, "ResourceNotFoundException") ->
              `ResourceNotFoundException
                (resource_not_found_exception_of_yojson tree path)
          | (_, "ThrottlingException") ->
              `ThrottlingException (throttling_exception_of_yojson tree path)
          | (_, "ValidationException") ->
              `ValidationException (validation_exception_of_yojson tree path)
          | _type -> handler tree path _type in
        Smaws_Lib.Protocols.AwsJson.(error_deserializer
                                       (handler
                                          Smaws_Lib.Protocols.AwsJson.Errors.default_handler)
                                       tree path)
    let request context (request : associate_entities_to_experience_request)
      =
      let open Smaws_Lib.Context in
        let open Deserializers in
          let input =
            Serializers.associate_entities_to_experience_request_to_yojson
              request in
          Smaws_Lib.Protocols.AwsJson.request
            ~shape_name:"AWSKendraFrontendServiceAssociateEntitiesToExperience"
            ~service ~config:context.config ~http:context.http ~input
            ~output_deserializer:associate_entities_to_experience_response_of_yojson
            ~error_deserializer
  end
module AssociatePersonasToEntities =
  struct
    let error_deserializer tree path =
      let open Deserializers in
        let handler handler tree path =
          function
          | (_, "AccessDeniedException") ->
              `AccessDeniedException
                (access_denied_exception_of_yojson tree path)
          | (_, "InternalServerException") ->
              `InternalServerException
                (internal_server_exception_of_yojson tree path)
          | (_, "ResourceAlreadyExistException") ->
              `ResourceAlreadyExistException
                (resource_already_exist_exception_of_yojson tree path)
          | (_, "ResourceNotFoundException") ->
              `ResourceNotFoundException
                (resource_not_found_exception_of_yojson tree path)
          | (_, "ThrottlingException") ->
              `ThrottlingException (throttling_exception_of_yojson tree path)
          | (_, "ValidationException") ->
              `ValidationException (validation_exception_of_yojson tree path)
          | _type -> handler tree path _type in
        Smaws_Lib.Protocols.AwsJson.(error_deserializer
                                       (handler
                                          Smaws_Lib.Protocols.AwsJson.Errors.default_handler)
                                       tree path)
    let request context (request : associate_personas_to_entities_request) =
      let open Smaws_Lib.Context in
        let open Deserializers in
          let input =
            Serializers.associate_personas_to_entities_request_to_yojson
              request in
          Smaws_Lib.Protocols.AwsJson.request
            ~shape_name:"AWSKendraFrontendServiceAssociatePersonasToEntities"
            ~service ~config:context.config ~http:context.http ~input
            ~output_deserializer:associate_personas_to_entities_response_of_yojson
            ~error_deserializer
  end
module BatchDeleteDocument =
  struct
    let error_deserializer tree path =
      let open Deserializers in
        let handler handler tree path =
          function
          | (_, "AccessDeniedException") ->
              `AccessDeniedException
                (access_denied_exception_of_yojson tree path)
          | (_, "ConflictException") ->
              `ConflictException (conflict_exception_of_yojson tree path)
          | (_, "InternalServerException") ->
              `InternalServerException
                (internal_server_exception_of_yojson tree path)
          | (_, "ResourceNotFoundException") ->
              `ResourceNotFoundException
                (resource_not_found_exception_of_yojson tree path)
          | (_, "ThrottlingException") ->
              `ThrottlingException (throttling_exception_of_yojson tree path)
          | (_, "ValidationException") ->
              `ValidationException (validation_exception_of_yojson tree path)
          | _type -> handler tree path _type in
        Smaws_Lib.Protocols.AwsJson.(error_deserializer
                                       (handler
                                          Smaws_Lib.Protocols.AwsJson.Errors.default_handler)
                                       tree path)
    let request context (request : batch_delete_document_request) =
      let open Smaws_Lib.Context in
        let open Deserializers in
          let input =
            Serializers.batch_delete_document_request_to_yojson request in
          Smaws_Lib.Protocols.AwsJson.request
            ~shape_name:"AWSKendraFrontendServiceBatchDeleteDocument"
            ~service ~config:context.config ~http:context.http ~input
            ~output_deserializer:batch_delete_document_response_of_yojson
            ~error_deserializer
  end
module BatchDeleteFeaturedResultsSet =
  struct
    let error_deserializer tree path =
      let open Deserializers in
        let handler handler tree path =
          function
          | (_, "AccessDeniedException") ->
              `AccessDeniedException
                (access_denied_exception_of_yojson tree path)
          | (_, "InternalServerException") ->
              `InternalServerException
                (internal_server_exception_of_yojson tree path)
          | (_, "ResourceNotFoundException") ->
              `ResourceNotFoundException
                (resource_not_found_exception_of_yojson tree path)
          | (_, "ThrottlingException") ->
              `ThrottlingException (throttling_exception_of_yojson tree path)
          | (_, "ValidationException") ->
              `ValidationException (validation_exception_of_yojson tree path)
          | _type -> handler tree path _type in
        Smaws_Lib.Protocols.AwsJson.(error_deserializer
                                       (handler
                                          Smaws_Lib.Protocols.AwsJson.Errors.default_handler)
                                       tree path)
    let request context (request : batch_delete_featured_results_set_request)
      =
      let open Smaws_Lib.Context in
        let open Deserializers in
          let input =
            Serializers.batch_delete_featured_results_set_request_to_yojson
              request in
          Smaws_Lib.Protocols.AwsJson.request
            ~shape_name:"AWSKendraFrontendServiceBatchDeleteFeaturedResultsSet"
            ~service ~config:context.config ~http:context.http ~input
            ~output_deserializer:batch_delete_featured_results_set_response_of_yojson
            ~error_deserializer
  end
module BatchGetDocumentStatus =
  struct
    let error_deserializer tree path =
      let open Deserializers in
        let handler handler tree path =
          function
          | (_, "AccessDeniedException") ->
              `AccessDeniedException
                (access_denied_exception_of_yojson tree path)
          | (_, "ConflictException") ->
              `ConflictException (conflict_exception_of_yojson tree path)
          | (_, "InternalServerException") ->
              `InternalServerException
                (internal_server_exception_of_yojson tree path)
          | (_, "ResourceNotFoundException") ->
              `ResourceNotFoundException
                (resource_not_found_exception_of_yojson tree path)
          | (_, "ThrottlingException") ->
              `ThrottlingException (throttling_exception_of_yojson tree path)
          | (_, "ValidationException") ->
              `ValidationException (validation_exception_of_yojson tree path)
          | _type -> handler tree path _type in
        Smaws_Lib.Protocols.AwsJson.(error_deserializer
                                       (handler
                                          Smaws_Lib.Protocols.AwsJson.Errors.default_handler)
                                       tree path)
    let request context (request : batch_get_document_status_request) =
      let open Smaws_Lib.Context in
        let open Deserializers in
          let input =
            Serializers.batch_get_document_status_request_to_yojson request in
          Smaws_Lib.Protocols.AwsJson.request
            ~shape_name:"AWSKendraFrontendServiceBatchGetDocumentStatus"
            ~service ~config:context.config ~http:context.http ~input
            ~output_deserializer:batch_get_document_status_response_of_yojson
            ~error_deserializer
  end
module BatchPutDocument =
  struct
    let error_deserializer tree path =
      let open Deserializers in
        let handler handler tree path =
          function
          | (_, "AccessDeniedException") ->
              `AccessDeniedException
                (access_denied_exception_of_yojson tree path)
          | (_, "ConflictException") ->
              `ConflictException (conflict_exception_of_yojson tree path)
          | (_, "InternalServerException") ->
              `InternalServerException
                (internal_server_exception_of_yojson tree path)
          | (_, "ResourceNotFoundException") ->
              `ResourceNotFoundException
                (resource_not_found_exception_of_yojson tree path)
          | (_, "ServiceQuotaExceededException") ->
              `ServiceQuotaExceededException
                (service_quota_exceeded_exception_of_yojson tree path)
          | (_, "ThrottlingException") ->
              `ThrottlingException (throttling_exception_of_yojson tree path)
          | (_, "ValidationException") ->
              `ValidationException (validation_exception_of_yojson tree path)
          | _type -> handler tree path _type in
        Smaws_Lib.Protocols.AwsJson.(error_deserializer
                                       (handler
                                          Smaws_Lib.Protocols.AwsJson.Errors.default_handler)
                                       tree path)
    let request context (request : batch_put_document_request) =
      let open Smaws_Lib.Context in
        let open Deserializers in
          let input =
            Serializers.batch_put_document_request_to_yojson request in
          Smaws_Lib.Protocols.AwsJson.request
            ~shape_name:"AWSKendraFrontendServiceBatchPutDocument" ~service
            ~config:context.config ~http:context.http ~input
            ~output_deserializer:batch_put_document_response_of_yojson
            ~error_deserializer
  end
module ClearQuerySuggestions =
  struct
    let error_deserializer tree path =
      let open Deserializers in
        let handler handler tree path =
          function
          | (_, "AccessDeniedException") ->
              `AccessDeniedException
                (access_denied_exception_of_yojson tree path)
          | (_, "ConflictException") ->
              `ConflictException (conflict_exception_of_yojson tree path)
          | (_, "InternalServerException") ->
              `InternalServerException
                (internal_server_exception_of_yojson tree path)
          | (_, "ResourceNotFoundException") ->
              `ResourceNotFoundException
                (resource_not_found_exception_of_yojson tree path)
          | (_, "ThrottlingException") ->
              `ThrottlingException (throttling_exception_of_yojson tree path)
          | (_, "ValidationException") ->
              `ValidationException (validation_exception_of_yojson tree path)
          | _type -> handler tree path _type in
        Smaws_Lib.Protocols.AwsJson.(error_deserializer
                                       (handler
                                          Smaws_Lib.Protocols.AwsJson.Errors.default_handler)
                                       tree path)
    let request context (request : clear_query_suggestions_request) =
      let open Smaws_Lib.Context in
        let open Deserializers in
          let input =
            Serializers.clear_query_suggestions_request_to_yojson request in
          Smaws_Lib.Protocols.AwsJson.request
            ~shape_name:"AWSKendraFrontendServiceClearQuerySuggestions"
            ~service ~config:context.config ~http:context.http ~input
            ~output_deserializer:base_unit_of_yojson ~error_deserializer
  end
module CreateAccessControlConfiguration =
  struct
    let error_deserializer tree path =
      let open Deserializers in
        let handler handler tree path =
          function
          | (_, "AccessDeniedException") ->
              `AccessDeniedException
                (access_denied_exception_of_yojson tree path)
          | (_, "ConflictException") ->
              `ConflictException (conflict_exception_of_yojson tree path)
          | (_, "InternalServerException") ->
              `InternalServerException
                (internal_server_exception_of_yojson tree path)
          | (_, "ResourceNotFoundException") ->
              `ResourceNotFoundException
                (resource_not_found_exception_of_yojson tree path)
          | (_, "ServiceQuotaExceededException") ->
              `ServiceQuotaExceededException
                (service_quota_exceeded_exception_of_yojson tree path)
          | (_, "ThrottlingException") ->
              `ThrottlingException (throttling_exception_of_yojson tree path)
          | (_, "ValidationException") ->
              `ValidationException (validation_exception_of_yojson tree path)
          | _type -> handler tree path _type in
        Smaws_Lib.Protocols.AwsJson.(error_deserializer
                                       (handler
                                          Smaws_Lib.Protocols.AwsJson.Errors.default_handler)
                                       tree path)
    let request context
      (request : create_access_control_configuration_request) =
      let open Smaws_Lib.Context in
        let open Deserializers in
          let input =
            Serializers.create_access_control_configuration_request_to_yojson
              request in
          Smaws_Lib.Protocols.AwsJson.request
            ~shape_name:"AWSKendraFrontendServiceCreateAccessControlConfiguration"
            ~service ~config:context.config ~http:context.http ~input
            ~output_deserializer:create_access_control_configuration_response_of_yojson
            ~error_deserializer
  end
module CreateDataSource =
  struct
    let error_deserializer tree path =
      let open Deserializers in
        let handler handler tree path =
          function
          | (_, "AccessDeniedException") ->
              `AccessDeniedException
                (access_denied_exception_of_yojson tree path)
          | (_, "ConflictException") ->
              `ConflictException (conflict_exception_of_yojson tree path)
          | (_, "InternalServerException") ->
              `InternalServerException
                (internal_server_exception_of_yojson tree path)
          | (_, "ResourceAlreadyExistException") ->
              `ResourceAlreadyExistException
                (resource_already_exist_exception_of_yojson tree path)
          | (_, "ResourceNotFoundException") ->
              `ResourceNotFoundException
                (resource_not_found_exception_of_yojson tree path)
          | (_, "ServiceQuotaExceededException") ->
              `ServiceQuotaExceededException
                (service_quota_exceeded_exception_of_yojson tree path)
          | (_, "ThrottlingException") ->
              `ThrottlingException (throttling_exception_of_yojson tree path)
          | (_, "ValidationException") ->
              `ValidationException (validation_exception_of_yojson tree path)
          | _type -> handler tree path _type in
        Smaws_Lib.Protocols.AwsJson.(error_deserializer
                                       (handler
                                          Smaws_Lib.Protocols.AwsJson.Errors.default_handler)
                                       tree path)
    let request context (request : create_data_source_request) =
      let open Smaws_Lib.Context in
        let open Deserializers in
          let input =
            Serializers.create_data_source_request_to_yojson request in
          Smaws_Lib.Protocols.AwsJson.request
            ~shape_name:"AWSKendraFrontendServiceCreateDataSource" ~service
            ~config:context.config ~http:context.http ~input
            ~output_deserializer:create_data_source_response_of_yojson
            ~error_deserializer
  end
module CreateExperience =
  struct
    let error_deserializer tree path =
      let open Deserializers in
        let handler handler tree path =
          function
          | (_, "AccessDeniedException") ->
              `AccessDeniedException
                (access_denied_exception_of_yojson tree path)
          | (_, "ConflictException") ->
              `ConflictException (conflict_exception_of_yojson tree path)
          | (_, "InternalServerException") ->
              `InternalServerException
                (internal_server_exception_of_yojson tree path)
          | (_, "ResourceNotFoundException") ->
              `ResourceNotFoundException
                (resource_not_found_exception_of_yojson tree path)
          | (_, "ServiceQuotaExceededException") ->
              `ServiceQuotaExceededException
                (service_quota_exceeded_exception_of_yojson tree path)
          | (_, "ThrottlingException") ->
              `ThrottlingException (throttling_exception_of_yojson tree path)
          | (_, "ValidationException") ->
              `ValidationException (validation_exception_of_yojson tree path)
          | _type -> handler tree path _type in
        Smaws_Lib.Protocols.AwsJson.(error_deserializer
                                       (handler
                                          Smaws_Lib.Protocols.AwsJson.Errors.default_handler)
                                       tree path)
    let request context (request : create_experience_request) =
      let open Smaws_Lib.Context in
        let open Deserializers in
          let input = Serializers.create_experience_request_to_yojson request in
          Smaws_Lib.Protocols.AwsJson.request
            ~shape_name:"AWSKendraFrontendServiceCreateExperience" ~service
            ~config:context.config ~http:context.http ~input
            ~output_deserializer:create_experience_response_of_yojson
            ~error_deserializer
  end
module CreateFaq =
  struct
    let error_deserializer tree path =
      let open Deserializers in
        let handler handler tree path =
          function
          | (_, "AccessDeniedException") ->
              `AccessDeniedException
                (access_denied_exception_of_yojson tree path)
          | (_, "ConflictException") ->
              `ConflictException (conflict_exception_of_yojson tree path)
          | (_, "InternalServerException") ->
              `InternalServerException
                (internal_server_exception_of_yojson tree path)
          | (_, "ResourceNotFoundException") ->
              `ResourceNotFoundException
                (resource_not_found_exception_of_yojson tree path)
          | (_, "ServiceQuotaExceededException") ->
              `ServiceQuotaExceededException
                (service_quota_exceeded_exception_of_yojson tree path)
          | (_, "ThrottlingException") ->
              `ThrottlingException (throttling_exception_of_yojson tree path)
          | (_, "ValidationException") ->
              `ValidationException (validation_exception_of_yojson tree path)
          | _type -> handler tree path _type in
        Smaws_Lib.Protocols.AwsJson.(error_deserializer
                                       (handler
                                          Smaws_Lib.Protocols.AwsJson.Errors.default_handler)
                                       tree path)
    let request context (request : create_faq_request) =
      let open Smaws_Lib.Context in
        let open Deserializers in
          let input = Serializers.create_faq_request_to_yojson request in
          Smaws_Lib.Protocols.AwsJson.request
            ~shape_name:"AWSKendraFrontendServiceCreateFaq" ~service
            ~config:context.config ~http:context.http ~input
            ~output_deserializer:create_faq_response_of_yojson
            ~error_deserializer
  end
module CreateFeaturedResultsSet =
  struct
    let error_deserializer tree path =
      let open Deserializers in
        let handler handler tree path =
          function
          | (_, "AccessDeniedException") ->
              `AccessDeniedException
                (access_denied_exception_of_yojson tree path)
          | (_, "ConflictException") ->
              `ConflictException (conflict_exception_of_yojson tree path)
          | (_, "FeaturedResultsConflictException") ->
              `FeaturedResultsConflictException
                (featured_results_conflict_exception_of_yojson tree path)
          | (_, "InternalServerException") ->
              `InternalServerException
                (internal_server_exception_of_yojson tree path)
          | (_, "ResourceNotFoundException") ->
              `ResourceNotFoundException
                (resource_not_found_exception_of_yojson tree path)
          | (_, "ThrottlingException") ->
              `ThrottlingException (throttling_exception_of_yojson tree path)
          | (_, "ValidationException") ->
              `ValidationException (validation_exception_of_yojson tree path)
          | _type -> handler tree path _type in
        Smaws_Lib.Protocols.AwsJson.(error_deserializer
                                       (handler
                                          Smaws_Lib.Protocols.AwsJson.Errors.default_handler)
                                       tree path)
    let request context (request : create_featured_results_set_request) =
      let open Smaws_Lib.Context in
        let open Deserializers in
          let input =
            Serializers.create_featured_results_set_request_to_yojson request in
          Smaws_Lib.Protocols.AwsJson.request
            ~shape_name:"AWSKendraFrontendServiceCreateFeaturedResultsSet"
            ~service ~config:context.config ~http:context.http ~input
            ~output_deserializer:create_featured_results_set_response_of_yojson
            ~error_deserializer
  end
module CreateIndex =
  struct
    let error_deserializer tree path =
      let open Deserializers in
        let handler handler tree path =
          function
          | (_, "AccessDeniedException") ->
              `AccessDeniedException
                (access_denied_exception_of_yojson tree path)
          | (_, "ConflictException") ->
              `ConflictException (conflict_exception_of_yojson tree path)
          | (_, "InternalServerException") ->
              `InternalServerException
                (internal_server_exception_of_yojson tree path)
          | (_, "ResourceAlreadyExistException") ->
              `ResourceAlreadyExistException
                (resource_already_exist_exception_of_yojson tree path)
          | (_, "ServiceQuotaExceededException") ->
              `ServiceQuotaExceededException
                (service_quota_exceeded_exception_of_yojson tree path)
          | (_, "ThrottlingException") ->
              `ThrottlingException (throttling_exception_of_yojson tree path)
          | (_, "ValidationException") ->
              `ValidationException (validation_exception_of_yojson tree path)
          | _type -> handler tree path _type in
        Smaws_Lib.Protocols.AwsJson.(error_deserializer
                                       (handler
                                          Smaws_Lib.Protocols.AwsJson.Errors.default_handler)
                                       tree path)
    let request context (request : create_index_request) =
      let open Smaws_Lib.Context in
        let open Deserializers in
          let input = Serializers.create_index_request_to_yojson request in
          Smaws_Lib.Protocols.AwsJson.request
            ~shape_name:"AWSKendraFrontendServiceCreateIndex" ~service
            ~config:context.config ~http:context.http ~input
            ~output_deserializer:create_index_response_of_yojson
            ~error_deserializer
  end
module CreateQuerySuggestionsBlockList =
  struct
    let error_deserializer tree path =
      let open Deserializers in
        let handler handler tree path =
          function
          | (_, "AccessDeniedException") ->
              `AccessDeniedException
                (access_denied_exception_of_yojson tree path)
          | (_, "ConflictException") ->
              `ConflictException (conflict_exception_of_yojson tree path)
          | (_, "InternalServerException") ->
              `InternalServerException
                (internal_server_exception_of_yojson tree path)
          | (_, "ResourceNotFoundException") ->
              `ResourceNotFoundException
                (resource_not_found_exception_of_yojson tree path)
          | (_, "ServiceQuotaExceededException") ->
              `ServiceQuotaExceededException
                (service_quota_exceeded_exception_of_yojson tree path)
          | (_, "ThrottlingException") ->
              `ThrottlingException (throttling_exception_of_yojson tree path)
          | (_, "ValidationException") ->
              `ValidationException (validation_exception_of_yojson tree path)
          | _type -> handler tree path _type in
        Smaws_Lib.Protocols.AwsJson.(error_deserializer
                                       (handler
                                          Smaws_Lib.Protocols.AwsJson.Errors.default_handler)
                                       tree path)
    let request context
      (request : create_query_suggestions_block_list_request) =
      let open Smaws_Lib.Context in
        let open Deserializers in
          let input =
            Serializers.create_query_suggestions_block_list_request_to_yojson
              request in
          Smaws_Lib.Protocols.AwsJson.request
            ~shape_name:"AWSKendraFrontendServiceCreateQuerySuggestionsBlockList"
            ~service ~config:context.config ~http:context.http ~input
            ~output_deserializer:create_query_suggestions_block_list_response_of_yojson
            ~error_deserializer
  end
module CreateThesaurus =
  struct
    let error_deserializer tree path =
      let open Deserializers in
        let handler handler tree path =
          function
          | (_, "AccessDeniedException") ->
              `AccessDeniedException
                (access_denied_exception_of_yojson tree path)
          | (_, "ConflictException") ->
              `ConflictException (conflict_exception_of_yojson tree path)
          | (_, "InternalServerException") ->
              `InternalServerException
                (internal_server_exception_of_yojson tree path)
          | (_, "ResourceNotFoundException") ->
              `ResourceNotFoundException
                (resource_not_found_exception_of_yojson tree path)
          | (_, "ServiceQuotaExceededException") ->
              `ServiceQuotaExceededException
                (service_quota_exceeded_exception_of_yojson tree path)
          | (_, "ThrottlingException") ->
              `ThrottlingException (throttling_exception_of_yojson tree path)
          | (_, "ValidationException") ->
              `ValidationException (validation_exception_of_yojson tree path)
          | _type -> handler tree path _type in
        Smaws_Lib.Protocols.AwsJson.(error_deserializer
                                       (handler
                                          Smaws_Lib.Protocols.AwsJson.Errors.default_handler)
                                       tree path)
    let request context (request : create_thesaurus_request) =
      let open Smaws_Lib.Context in
        let open Deserializers in
          let input = Serializers.create_thesaurus_request_to_yojson request in
          Smaws_Lib.Protocols.AwsJson.request
            ~shape_name:"AWSKendraFrontendServiceCreateThesaurus" ~service
            ~config:context.config ~http:context.http ~input
            ~output_deserializer:create_thesaurus_response_of_yojson
            ~error_deserializer
  end
module DeleteAccessControlConfiguration =
  struct
    let error_deserializer tree path =
      let open Deserializers in
        let handler handler tree path =
          function
          | (_, "AccessDeniedException") ->
              `AccessDeniedException
                (access_denied_exception_of_yojson tree path)
          | (_, "ConflictException") ->
              `ConflictException (conflict_exception_of_yojson tree path)
          | (_, "InternalServerException") ->
              `InternalServerException
                (internal_server_exception_of_yojson tree path)
          | (_, "ResourceNotFoundException") ->
              `ResourceNotFoundException
                (resource_not_found_exception_of_yojson tree path)
          | (_, "ThrottlingException") ->
              `ThrottlingException (throttling_exception_of_yojson tree path)
          | (_, "ValidationException") ->
              `ValidationException (validation_exception_of_yojson tree path)
          | _type -> handler tree path _type in
        Smaws_Lib.Protocols.AwsJson.(error_deserializer
                                       (handler
                                          Smaws_Lib.Protocols.AwsJson.Errors.default_handler)
                                       tree path)
    let request context
      (request : delete_access_control_configuration_request) =
      let open Smaws_Lib.Context in
        let open Deserializers in
          let input =
            Serializers.delete_access_control_configuration_request_to_yojson
              request in
          Smaws_Lib.Protocols.AwsJson.request
            ~shape_name:"AWSKendraFrontendServiceDeleteAccessControlConfiguration"
            ~service ~config:context.config ~http:context.http ~input
            ~output_deserializer:delete_access_control_configuration_response_of_yojson
            ~error_deserializer
  end
module DeleteDataSource =
  struct
    let error_deserializer tree path =
      let open Deserializers in
        let handler handler tree path =
          function
          | (_, "AccessDeniedException") ->
              `AccessDeniedException
                (access_denied_exception_of_yojson tree path)
          | (_, "ConflictException") ->
              `ConflictException (conflict_exception_of_yojson tree path)
          | (_, "InternalServerException") ->
              `InternalServerException
                (internal_server_exception_of_yojson tree path)
          | (_, "ResourceNotFoundException") ->
              `ResourceNotFoundException
                (resource_not_found_exception_of_yojson tree path)
          | (_, "ThrottlingException") ->
              `ThrottlingException (throttling_exception_of_yojson tree path)
          | (_, "ValidationException") ->
              `ValidationException (validation_exception_of_yojson tree path)
          | _type -> handler tree path _type in
        Smaws_Lib.Protocols.AwsJson.(error_deserializer
                                       (handler
                                          Smaws_Lib.Protocols.AwsJson.Errors.default_handler)
                                       tree path)
    let request context (request : delete_data_source_request) =
      let open Smaws_Lib.Context in
        let open Deserializers in
          let input =
            Serializers.delete_data_source_request_to_yojson request in
          Smaws_Lib.Protocols.AwsJson.request
            ~shape_name:"AWSKendraFrontendServiceDeleteDataSource" ~service
            ~config:context.config ~http:context.http ~input
            ~output_deserializer:base_unit_of_yojson ~error_deserializer
  end
module DeleteExperience =
  struct
    let error_deserializer tree path =
      let open Deserializers in
        let handler handler tree path =
          function
          | (_, "AccessDeniedException") ->
              `AccessDeniedException
                (access_denied_exception_of_yojson tree path)
          | (_, "ConflictException") ->
              `ConflictException (conflict_exception_of_yojson tree path)
          | (_, "InternalServerException") ->
              `InternalServerException
                (internal_server_exception_of_yojson tree path)
          | (_, "ResourceNotFoundException") ->
              `ResourceNotFoundException
                (resource_not_found_exception_of_yojson tree path)
          | (_, "ThrottlingException") ->
              `ThrottlingException (throttling_exception_of_yojson tree path)
          | (_, "ValidationException") ->
              `ValidationException (validation_exception_of_yojson tree path)
          | _type -> handler tree path _type in
        Smaws_Lib.Protocols.AwsJson.(error_deserializer
                                       (handler
                                          Smaws_Lib.Protocols.AwsJson.Errors.default_handler)
                                       tree path)
    let request context (request : delete_experience_request) =
      let open Smaws_Lib.Context in
        let open Deserializers in
          let input = Serializers.delete_experience_request_to_yojson request in
          Smaws_Lib.Protocols.AwsJson.request
            ~shape_name:"AWSKendraFrontendServiceDeleteExperience" ~service
            ~config:context.config ~http:context.http ~input
            ~output_deserializer:delete_experience_response_of_yojson
            ~error_deserializer
  end
module DeleteFaq =
  struct
    let error_deserializer tree path =
      let open Deserializers in
        let handler handler tree path =
          function
          | (_, "AccessDeniedException") ->
              `AccessDeniedException
                (access_denied_exception_of_yojson tree path)
          | (_, "ConflictException") ->
              `ConflictException (conflict_exception_of_yojson tree path)
          | (_, "InternalServerException") ->
              `InternalServerException
                (internal_server_exception_of_yojson tree path)
          | (_, "ResourceNotFoundException") ->
              `ResourceNotFoundException
                (resource_not_found_exception_of_yojson tree path)
          | (_, "ThrottlingException") ->
              `ThrottlingException (throttling_exception_of_yojson tree path)
          | (_, "ValidationException") ->
              `ValidationException (validation_exception_of_yojson tree path)
          | _type -> handler tree path _type in
        Smaws_Lib.Protocols.AwsJson.(error_deserializer
                                       (handler
                                          Smaws_Lib.Protocols.AwsJson.Errors.default_handler)
                                       tree path)
    let request context (request : delete_faq_request) =
      let open Smaws_Lib.Context in
        let open Deserializers in
          let input = Serializers.delete_faq_request_to_yojson request in
          Smaws_Lib.Protocols.AwsJson.request
            ~shape_name:"AWSKendraFrontendServiceDeleteFaq" ~service
            ~config:context.config ~http:context.http ~input
            ~output_deserializer:base_unit_of_yojson ~error_deserializer
  end
module DeleteIndex =
  struct
    let error_deserializer tree path =
      let open Deserializers in
        let handler handler tree path =
          function
          | (_, "AccessDeniedException") ->
              `AccessDeniedException
                (access_denied_exception_of_yojson tree path)
          | (_, "ConflictException") ->
              `ConflictException (conflict_exception_of_yojson tree path)
          | (_, "InternalServerException") ->
              `InternalServerException
                (internal_server_exception_of_yojson tree path)
          | (_, "ResourceNotFoundException") ->
              `ResourceNotFoundException
                (resource_not_found_exception_of_yojson tree path)
          | (_, "ThrottlingException") ->
              `ThrottlingException (throttling_exception_of_yojson tree path)
          | (_, "ValidationException") ->
              `ValidationException (validation_exception_of_yojson tree path)
          | _type -> handler tree path _type in
        Smaws_Lib.Protocols.AwsJson.(error_deserializer
                                       (handler
                                          Smaws_Lib.Protocols.AwsJson.Errors.default_handler)
                                       tree path)
    let request context (request : delete_index_request) =
      let open Smaws_Lib.Context in
        let open Deserializers in
          let input = Serializers.delete_index_request_to_yojson request in
          Smaws_Lib.Protocols.AwsJson.request
            ~shape_name:"AWSKendraFrontendServiceDeleteIndex" ~service
            ~config:context.config ~http:context.http ~input
            ~output_deserializer:base_unit_of_yojson ~error_deserializer
  end
module DeletePrincipalMapping =
  struct
    let error_deserializer tree path =
      let open Deserializers in
        let handler handler tree path =
          function
          | (_, "AccessDeniedException") ->
              `AccessDeniedException
                (access_denied_exception_of_yojson tree path)
          | (_, "ConflictException") ->
              `ConflictException (conflict_exception_of_yojson tree path)
          | (_, "InternalServerException") ->
              `InternalServerException
                (internal_server_exception_of_yojson tree path)
          | (_, "ResourceNotFoundException") ->
              `ResourceNotFoundException
                (resource_not_found_exception_of_yojson tree path)
          | (_, "ThrottlingException") ->
              `ThrottlingException (throttling_exception_of_yojson tree path)
          | (_, "ValidationException") ->
              `ValidationException (validation_exception_of_yojson tree path)
          | _type -> handler tree path _type in
        Smaws_Lib.Protocols.AwsJson.(error_deserializer
                                       (handler
                                          Smaws_Lib.Protocols.AwsJson.Errors.default_handler)
                                       tree path)
    let request context (request : delete_principal_mapping_request) =
      let open Smaws_Lib.Context in
        let open Deserializers in
          let input =
            Serializers.delete_principal_mapping_request_to_yojson request in
          Smaws_Lib.Protocols.AwsJson.request
            ~shape_name:"AWSKendraFrontendServiceDeletePrincipalMapping"
            ~service ~config:context.config ~http:context.http ~input
            ~output_deserializer:base_unit_of_yojson ~error_deserializer
  end
module DeleteQuerySuggestionsBlockList =
  struct
    let error_deserializer tree path =
      let open Deserializers in
        let handler handler tree path =
          function
          | (_, "AccessDeniedException") ->
              `AccessDeniedException
                (access_denied_exception_of_yojson tree path)
          | (_, "ConflictException") ->
              `ConflictException (conflict_exception_of_yojson tree path)
          | (_, "InternalServerException") ->
              `InternalServerException
                (internal_server_exception_of_yojson tree path)
          | (_, "ResourceNotFoundException") ->
              `ResourceNotFoundException
                (resource_not_found_exception_of_yojson tree path)
          | (_, "ThrottlingException") ->
              `ThrottlingException (throttling_exception_of_yojson tree path)
          | (_, "ValidationException") ->
              `ValidationException (validation_exception_of_yojson tree path)
          | _type -> handler tree path _type in
        Smaws_Lib.Protocols.AwsJson.(error_deserializer
                                       (handler
                                          Smaws_Lib.Protocols.AwsJson.Errors.default_handler)
                                       tree path)
    let request context
      (request : delete_query_suggestions_block_list_request) =
      let open Smaws_Lib.Context in
        let open Deserializers in
          let input =
            Serializers.delete_query_suggestions_block_list_request_to_yojson
              request in
          Smaws_Lib.Protocols.AwsJson.request
            ~shape_name:"AWSKendraFrontendServiceDeleteQuerySuggestionsBlockList"
            ~service ~config:context.config ~http:context.http ~input
            ~output_deserializer:base_unit_of_yojson ~error_deserializer
  end
module DeleteThesaurus =
  struct
    let error_deserializer tree path =
      let open Deserializers in
        let handler handler tree path =
          function
          | (_, "AccessDeniedException") ->
              `AccessDeniedException
                (access_denied_exception_of_yojson tree path)
          | (_, "ConflictException") ->
              `ConflictException (conflict_exception_of_yojson tree path)
          | (_, "InternalServerException") ->
              `InternalServerException
                (internal_server_exception_of_yojson tree path)
          | (_, "ResourceNotFoundException") ->
              `ResourceNotFoundException
                (resource_not_found_exception_of_yojson tree path)
          | (_, "ThrottlingException") ->
              `ThrottlingException (throttling_exception_of_yojson tree path)
          | (_, "ValidationException") ->
              `ValidationException (validation_exception_of_yojson tree path)
          | _type -> handler tree path _type in
        Smaws_Lib.Protocols.AwsJson.(error_deserializer
                                       (handler
                                          Smaws_Lib.Protocols.AwsJson.Errors.default_handler)
                                       tree path)
    let request context (request : delete_thesaurus_request) =
      let open Smaws_Lib.Context in
        let open Deserializers in
          let input = Serializers.delete_thesaurus_request_to_yojson request in
          Smaws_Lib.Protocols.AwsJson.request
            ~shape_name:"AWSKendraFrontendServiceDeleteThesaurus" ~service
            ~config:context.config ~http:context.http ~input
            ~output_deserializer:base_unit_of_yojson ~error_deserializer
  end
module DescribeAccessControlConfiguration =
  struct
    let error_deserializer tree path =
      let open Deserializers in
        let handler handler tree path =
          function
          | (_, "AccessDeniedException") ->
              `AccessDeniedException
                (access_denied_exception_of_yojson tree path)
          | (_, "InternalServerException") ->
              `InternalServerException
                (internal_server_exception_of_yojson tree path)
          | (_, "ResourceNotFoundException") ->
              `ResourceNotFoundException
                (resource_not_found_exception_of_yojson tree path)
          | (_, "ThrottlingException") ->
              `ThrottlingException (throttling_exception_of_yojson tree path)
          | (_, "ValidationException") ->
              `ValidationException (validation_exception_of_yojson tree path)
          | _type -> handler tree path _type in
        Smaws_Lib.Protocols.AwsJson.(error_deserializer
                                       (handler
                                          Smaws_Lib.Protocols.AwsJson.Errors.default_handler)
                                       tree path)
    let request context
      (request : describe_access_control_configuration_request) =
      let open Smaws_Lib.Context in
        let open Deserializers in
          let input =
            Serializers.describe_access_control_configuration_request_to_yojson
              request in
          Smaws_Lib.Protocols.AwsJson.request
            ~shape_name:"AWSKendraFrontendServiceDescribeAccessControlConfiguration"
            ~service ~config:context.config ~http:context.http ~input
            ~output_deserializer:describe_access_control_configuration_response_of_yojson
            ~error_deserializer
  end
module DescribeDataSource =
  struct
    let error_deserializer tree path =
      let open Deserializers in
        let handler handler tree path =
          function
          | (_, "AccessDeniedException") ->
              `AccessDeniedException
                (access_denied_exception_of_yojson tree path)
          | (_, "InternalServerException") ->
              `InternalServerException
                (internal_server_exception_of_yojson tree path)
          | (_, "ResourceNotFoundException") ->
              `ResourceNotFoundException
                (resource_not_found_exception_of_yojson tree path)
          | (_, "ThrottlingException") ->
              `ThrottlingException (throttling_exception_of_yojson tree path)
          | (_, "ValidationException") ->
              `ValidationException (validation_exception_of_yojson tree path)
          | _type -> handler tree path _type in
        Smaws_Lib.Protocols.AwsJson.(error_deserializer
                                       (handler
                                          Smaws_Lib.Protocols.AwsJson.Errors.default_handler)
                                       tree path)
    let request context (request : describe_data_source_request) =
      let open Smaws_Lib.Context in
        let open Deserializers in
          let input =
            Serializers.describe_data_source_request_to_yojson request in
          Smaws_Lib.Protocols.AwsJson.request
            ~shape_name:"AWSKendraFrontendServiceDescribeDataSource" ~service
            ~config:context.config ~http:context.http ~input
            ~output_deserializer:describe_data_source_response_of_yojson
            ~error_deserializer
  end
module DescribeExperience =
  struct
    let error_deserializer tree path =
      let open Deserializers in
        let handler handler tree path =
          function
          | (_, "AccessDeniedException") ->
              `AccessDeniedException
                (access_denied_exception_of_yojson tree path)
          | (_, "InternalServerException") ->
              `InternalServerException
                (internal_server_exception_of_yojson tree path)
          | (_, "ResourceNotFoundException") ->
              `ResourceNotFoundException
                (resource_not_found_exception_of_yojson tree path)
          | (_, "ThrottlingException") ->
              `ThrottlingException (throttling_exception_of_yojson tree path)
          | (_, "ValidationException") ->
              `ValidationException (validation_exception_of_yojson tree path)
          | _type -> handler tree path _type in
        Smaws_Lib.Protocols.AwsJson.(error_deserializer
                                       (handler
                                          Smaws_Lib.Protocols.AwsJson.Errors.default_handler)
                                       tree path)
    let request context (request : describe_experience_request) =
      let open Smaws_Lib.Context in
        let open Deserializers in
          let input =
            Serializers.describe_experience_request_to_yojson request in
          Smaws_Lib.Protocols.AwsJson.request
            ~shape_name:"AWSKendraFrontendServiceDescribeExperience" ~service
            ~config:context.config ~http:context.http ~input
            ~output_deserializer:describe_experience_response_of_yojson
            ~error_deserializer
  end
module DescribeFaq =
  struct
    let error_deserializer tree path =
      let open Deserializers in
        let handler handler tree path =
          function
          | (_, "AccessDeniedException") ->
              `AccessDeniedException
                (access_denied_exception_of_yojson tree path)
          | (_, "InternalServerException") ->
              `InternalServerException
                (internal_server_exception_of_yojson tree path)
          | (_, "ResourceNotFoundException") ->
              `ResourceNotFoundException
                (resource_not_found_exception_of_yojson tree path)
          | (_, "ThrottlingException") ->
              `ThrottlingException (throttling_exception_of_yojson tree path)
          | (_, "ValidationException") ->
              `ValidationException (validation_exception_of_yojson tree path)
          | _type -> handler tree path _type in
        Smaws_Lib.Protocols.AwsJson.(error_deserializer
                                       (handler
                                          Smaws_Lib.Protocols.AwsJson.Errors.default_handler)
                                       tree path)
    let request context (request : describe_faq_request) =
      let open Smaws_Lib.Context in
        let open Deserializers in
          let input = Serializers.describe_faq_request_to_yojson request in
          Smaws_Lib.Protocols.AwsJson.request
            ~shape_name:"AWSKendraFrontendServiceDescribeFaq" ~service
            ~config:context.config ~http:context.http ~input
            ~output_deserializer:describe_faq_response_of_yojson
            ~error_deserializer
  end
module DescribeFeaturedResultsSet =
  struct
    let error_deserializer tree path =
      let open Deserializers in
        let handler handler tree path =
          function
          | (_, "AccessDeniedException") ->
              `AccessDeniedException
                (access_denied_exception_of_yojson tree path)
          | (_, "InternalServerException") ->
              `InternalServerException
                (internal_server_exception_of_yojson tree path)
          | (_, "ResourceNotFoundException") ->
              `ResourceNotFoundException
                (resource_not_found_exception_of_yojson tree path)
          | (_, "ThrottlingException") ->
              `ThrottlingException (throttling_exception_of_yojson tree path)
          | (_, "ValidationException") ->
              `ValidationException (validation_exception_of_yojson tree path)
          | _type -> handler tree path _type in
        Smaws_Lib.Protocols.AwsJson.(error_deserializer
                                       (handler
                                          Smaws_Lib.Protocols.AwsJson.Errors.default_handler)
                                       tree path)
    let request context (request : describe_featured_results_set_request) =
      let open Smaws_Lib.Context in
        let open Deserializers in
          let input =
            Serializers.describe_featured_results_set_request_to_yojson
              request in
          Smaws_Lib.Protocols.AwsJson.request
            ~shape_name:"AWSKendraFrontendServiceDescribeFeaturedResultsSet"
            ~service ~config:context.config ~http:context.http ~input
            ~output_deserializer:describe_featured_results_set_response_of_yojson
            ~error_deserializer
  end
module DescribeIndex =
  struct
    let error_deserializer tree path =
      let open Deserializers in
        let handler handler tree path =
          function
          | (_, "AccessDeniedException") ->
              `AccessDeniedException
                (access_denied_exception_of_yojson tree path)
          | (_, "InternalServerException") ->
              `InternalServerException
                (internal_server_exception_of_yojson tree path)
          | (_, "ResourceNotFoundException") ->
              `ResourceNotFoundException
                (resource_not_found_exception_of_yojson tree path)
          | (_, "ThrottlingException") ->
              `ThrottlingException (throttling_exception_of_yojson tree path)
          | (_, "ValidationException") ->
              `ValidationException (validation_exception_of_yojson tree path)
          | _type -> handler tree path _type in
        Smaws_Lib.Protocols.AwsJson.(error_deserializer
                                       (handler
                                          Smaws_Lib.Protocols.AwsJson.Errors.default_handler)
                                       tree path)
    let request context (request : describe_index_request) =
      let open Smaws_Lib.Context in
        let open Deserializers in
          let input = Serializers.describe_index_request_to_yojson request in
          Smaws_Lib.Protocols.AwsJson.request
            ~shape_name:"AWSKendraFrontendServiceDescribeIndex" ~service
            ~config:context.config ~http:context.http ~input
            ~output_deserializer:describe_index_response_of_yojson
            ~error_deserializer
  end
module DescribePrincipalMapping =
  struct
    let error_deserializer tree path =
      let open Deserializers in
        let handler handler tree path =
          function
          | (_, "AccessDeniedException") ->
              `AccessDeniedException
                (access_denied_exception_of_yojson tree path)
          | (_, "InternalServerException") ->
              `InternalServerException
                (internal_server_exception_of_yojson tree path)
          | (_, "ResourceNotFoundException") ->
              `ResourceNotFoundException
                (resource_not_found_exception_of_yojson tree path)
          | (_, "ThrottlingException") ->
              `ThrottlingException (throttling_exception_of_yojson tree path)
          | (_, "ValidationException") ->
              `ValidationException (validation_exception_of_yojson tree path)
          | _type -> handler tree path _type in
        Smaws_Lib.Protocols.AwsJson.(error_deserializer
                                       (handler
                                          Smaws_Lib.Protocols.AwsJson.Errors.default_handler)
                                       tree path)
    let request context (request : describe_principal_mapping_request) =
      let open Smaws_Lib.Context in
        let open Deserializers in
          let input =
            Serializers.describe_principal_mapping_request_to_yojson request in
          Smaws_Lib.Protocols.AwsJson.request
            ~shape_name:"AWSKendraFrontendServiceDescribePrincipalMapping"
            ~service ~config:context.config ~http:context.http ~input
            ~output_deserializer:describe_principal_mapping_response_of_yojson
            ~error_deserializer
  end
module DescribeQuerySuggestionsBlockList =
  struct
    let error_deserializer tree path =
      let open Deserializers in
        let handler handler tree path =
          function
          | (_, "AccessDeniedException") ->
              `AccessDeniedException
                (access_denied_exception_of_yojson tree path)
          | (_, "InternalServerException") ->
              `InternalServerException
                (internal_server_exception_of_yojson tree path)
          | (_, "ResourceNotFoundException") ->
              `ResourceNotFoundException
                (resource_not_found_exception_of_yojson tree path)
          | (_, "ThrottlingException") ->
              `ThrottlingException (throttling_exception_of_yojson tree path)
          | (_, "ValidationException") ->
              `ValidationException (validation_exception_of_yojson tree path)
          | _type -> handler tree path _type in
        Smaws_Lib.Protocols.AwsJson.(error_deserializer
                                       (handler
                                          Smaws_Lib.Protocols.AwsJson.Errors.default_handler)
                                       tree path)
    let request context
      (request : describe_query_suggestions_block_list_request) =
      let open Smaws_Lib.Context in
        let open Deserializers in
          let input =
            Serializers.describe_query_suggestions_block_list_request_to_yojson
              request in
          Smaws_Lib.Protocols.AwsJson.request
            ~shape_name:"AWSKendraFrontendServiceDescribeQuerySuggestionsBlockList"
            ~service ~config:context.config ~http:context.http ~input
            ~output_deserializer:describe_query_suggestions_block_list_response_of_yojson
            ~error_deserializer
  end
module DescribeQuerySuggestionsConfig =
  struct
    let error_deserializer tree path =
      let open Deserializers in
        let handler handler tree path =
          function
          | (_, "AccessDeniedException") ->
              `AccessDeniedException
                (access_denied_exception_of_yojson tree path)
          | (_, "InternalServerException") ->
              `InternalServerException
                (internal_server_exception_of_yojson tree path)
          | (_, "ResourceNotFoundException") ->
              `ResourceNotFoundException
                (resource_not_found_exception_of_yojson tree path)
          | (_, "ThrottlingException") ->
              `ThrottlingException (throttling_exception_of_yojson tree path)
          | (_, "ValidationException") ->
              `ValidationException (validation_exception_of_yojson tree path)
          | _type -> handler tree path _type in
        Smaws_Lib.Protocols.AwsJson.(error_deserializer
                                       (handler
                                          Smaws_Lib.Protocols.AwsJson.Errors.default_handler)
                                       tree path)
    let request context (request : describe_query_suggestions_config_request)
      =
      let open Smaws_Lib.Context in
        let open Deserializers in
          let input =
            Serializers.describe_query_suggestions_config_request_to_yojson
              request in
          Smaws_Lib.Protocols.AwsJson.request
            ~shape_name:"AWSKendraFrontendServiceDescribeQuerySuggestionsConfig"
            ~service ~config:context.config ~http:context.http ~input
            ~output_deserializer:describe_query_suggestions_config_response_of_yojson
            ~error_deserializer
  end
module DescribeThesaurus =
  struct
    let error_deserializer tree path =
      let open Deserializers in
        let handler handler tree path =
          function
          | (_, "AccessDeniedException") ->
              `AccessDeniedException
                (access_denied_exception_of_yojson tree path)
          | (_, "InternalServerException") ->
              `InternalServerException
                (internal_server_exception_of_yojson tree path)
          | (_, "ResourceNotFoundException") ->
              `ResourceNotFoundException
                (resource_not_found_exception_of_yojson tree path)
          | (_, "ThrottlingException") ->
              `ThrottlingException (throttling_exception_of_yojson tree path)
          | (_, "ValidationException") ->
              `ValidationException (validation_exception_of_yojson tree path)
          | _type -> handler tree path _type in
        Smaws_Lib.Protocols.AwsJson.(error_deserializer
                                       (handler
                                          Smaws_Lib.Protocols.AwsJson.Errors.default_handler)
                                       tree path)
    let request context (request : describe_thesaurus_request) =
      let open Smaws_Lib.Context in
        let open Deserializers in
          let input =
            Serializers.describe_thesaurus_request_to_yojson request in
          Smaws_Lib.Protocols.AwsJson.request
            ~shape_name:"AWSKendraFrontendServiceDescribeThesaurus" ~service
            ~config:context.config ~http:context.http ~input
            ~output_deserializer:describe_thesaurus_response_of_yojson
            ~error_deserializer
  end
module DisassociateEntitiesFromExperience =
  struct
    let error_deserializer tree path =
      let open Deserializers in
        let handler handler tree path =
          function
          | (_, "AccessDeniedException") ->
              `AccessDeniedException
                (access_denied_exception_of_yojson tree path)
          | (_, "InternalServerException") ->
              `InternalServerException
                (internal_server_exception_of_yojson tree path)
          | (_, "ResourceNotFoundException") ->
              `ResourceNotFoundException
                (resource_not_found_exception_of_yojson tree path)
          | (_, "ThrottlingException") ->
              `ThrottlingException (throttling_exception_of_yojson tree path)
          | (_, "ValidationException") ->
              `ValidationException (validation_exception_of_yojson tree path)
          | _type -> handler tree path _type in
        Smaws_Lib.Protocols.AwsJson.(error_deserializer
                                       (handler
                                          Smaws_Lib.Protocols.AwsJson.Errors.default_handler)
                                       tree path)
    let request context
      (request : disassociate_entities_from_experience_request) =
      let open Smaws_Lib.Context in
        let open Deserializers in
          let input =
            Serializers.disassociate_entities_from_experience_request_to_yojson
              request in
          Smaws_Lib.Protocols.AwsJson.request
            ~shape_name:"AWSKendraFrontendServiceDisassociateEntitiesFromExperience"
            ~service ~config:context.config ~http:context.http ~input
            ~output_deserializer:disassociate_entities_from_experience_response_of_yojson
            ~error_deserializer
  end
module DisassociatePersonasFromEntities =
  struct
    let error_deserializer tree path =
      let open Deserializers in
        let handler handler tree path =
          function
          | (_, "AccessDeniedException") ->
              `AccessDeniedException
                (access_denied_exception_of_yojson tree path)
          | (_, "InternalServerException") ->
              `InternalServerException
                (internal_server_exception_of_yojson tree path)
          | (_, "ResourceNotFoundException") ->
              `ResourceNotFoundException
                (resource_not_found_exception_of_yojson tree path)
          | (_, "ThrottlingException") ->
              `ThrottlingException (throttling_exception_of_yojson tree path)
          | (_, "ValidationException") ->
              `ValidationException (validation_exception_of_yojson tree path)
          | _type -> handler tree path _type in
        Smaws_Lib.Protocols.AwsJson.(error_deserializer
                                       (handler
                                          Smaws_Lib.Protocols.AwsJson.Errors.default_handler)
                                       tree path)
    let request context
      (request : disassociate_personas_from_entities_request) =
      let open Smaws_Lib.Context in
        let open Deserializers in
          let input =
            Serializers.disassociate_personas_from_entities_request_to_yojson
              request in
          Smaws_Lib.Protocols.AwsJson.request
            ~shape_name:"AWSKendraFrontendServiceDisassociatePersonasFromEntities"
            ~service ~config:context.config ~http:context.http ~input
            ~output_deserializer:disassociate_personas_from_entities_response_of_yojson
            ~error_deserializer
  end
module GetQuerySuggestions =
  struct
    let error_deserializer tree path =
      let open Deserializers in
        let handler handler tree path =
          function
          | (_, "AccessDeniedException") ->
              `AccessDeniedException
                (access_denied_exception_of_yojson tree path)
          | (_, "ConflictException") ->
              `ConflictException (conflict_exception_of_yojson tree path)
          | (_, "InternalServerException") ->
              `InternalServerException
                (internal_server_exception_of_yojson tree path)
          | (_, "ResourceNotFoundException") ->
              `ResourceNotFoundException
                (resource_not_found_exception_of_yojson tree path)
          | (_, "ServiceQuotaExceededException") ->
              `ServiceQuotaExceededException
                (service_quota_exceeded_exception_of_yojson tree path)
          | (_, "ThrottlingException") ->
              `ThrottlingException (throttling_exception_of_yojson tree path)
          | (_, "ValidationException") ->
              `ValidationException (validation_exception_of_yojson tree path)
          | _type -> handler tree path _type in
        Smaws_Lib.Protocols.AwsJson.(error_deserializer
                                       (handler
                                          Smaws_Lib.Protocols.AwsJson.Errors.default_handler)
                                       tree path)
    let request context (request : get_query_suggestions_request) =
      let open Smaws_Lib.Context in
        let open Deserializers in
          let input =
            Serializers.get_query_suggestions_request_to_yojson request in
          Smaws_Lib.Protocols.AwsJson.request
            ~shape_name:"AWSKendraFrontendServiceGetQuerySuggestions"
            ~service ~config:context.config ~http:context.http ~input
            ~output_deserializer:get_query_suggestions_response_of_yojson
            ~error_deserializer
  end
module GetSnapshots =
  struct
    let error_deserializer tree path =
      let open Deserializers in
        let handler handler tree path =
          function
          | (_, "AccessDeniedException") ->
              `AccessDeniedException
                (access_denied_exception_of_yojson tree path)
          | (_, "InternalServerException") ->
              `InternalServerException
                (internal_server_exception_of_yojson tree path)
          | (_, "InvalidRequestException") ->
              `InvalidRequestException
                (invalid_request_exception_of_yojson tree path)
          | (_, "ResourceNotFoundException") ->
              `ResourceNotFoundException
                (resource_not_found_exception_of_yojson tree path)
          | _type -> handler tree path _type in
        Smaws_Lib.Protocols.AwsJson.(error_deserializer
                                       (handler
                                          Smaws_Lib.Protocols.AwsJson.Errors.default_handler)
                                       tree path)
    let request context (request : get_snapshots_request) =
      let open Smaws_Lib.Context in
        let open Deserializers in
          let input = Serializers.get_snapshots_request_to_yojson request in
          Smaws_Lib.Protocols.AwsJson.request
            ~shape_name:"AWSKendraFrontendServiceGetSnapshots" ~service
            ~config:context.config ~http:context.http ~input
            ~output_deserializer:get_snapshots_response_of_yojson
            ~error_deserializer
  end
module ListAccessControlConfigurations =
  struct
    let error_deserializer tree path =
      let open Deserializers in
        let handler handler tree path =
          function
          | (_, "AccessDeniedException") ->
              `AccessDeniedException
                (access_denied_exception_of_yojson tree path)
          | (_, "InternalServerException") ->
              `InternalServerException
                (internal_server_exception_of_yojson tree path)
          | (_, "ResourceNotFoundException") ->
              `ResourceNotFoundException
                (resource_not_found_exception_of_yojson tree path)
          | (_, "ThrottlingException") ->
              `ThrottlingException (throttling_exception_of_yojson tree path)
          | (_, "ValidationException") ->
              `ValidationException (validation_exception_of_yojson tree path)
          | _type -> handler tree path _type in
        Smaws_Lib.Protocols.AwsJson.(error_deserializer
                                       (handler
                                          Smaws_Lib.Protocols.AwsJson.Errors.default_handler)
                                       tree path)
    let request context
      (request : list_access_control_configurations_request) =
      let open Smaws_Lib.Context in
        let open Deserializers in
          let input =
            Serializers.list_access_control_configurations_request_to_yojson
              request in
          Smaws_Lib.Protocols.AwsJson.request
            ~shape_name:"AWSKendraFrontendServiceListAccessControlConfigurations"
            ~service ~config:context.config ~http:context.http ~input
            ~output_deserializer:list_access_control_configurations_response_of_yojson
            ~error_deserializer
  end
module ListDataSourceSyncJobs =
  struct
    let error_deserializer tree path =
      let open Deserializers in
        let handler handler tree path =
          function
          | (_, "AccessDeniedException") ->
              `AccessDeniedException
                (access_denied_exception_of_yojson tree path)
          | (_, "ConflictException") ->
              `ConflictException (conflict_exception_of_yojson tree path)
          | (_, "InternalServerException") ->
              `InternalServerException
                (internal_server_exception_of_yojson tree path)
          | (_, "ResourceNotFoundException") ->
              `ResourceNotFoundException
                (resource_not_found_exception_of_yojson tree path)
          | (_, "ThrottlingException") ->
              `ThrottlingException (throttling_exception_of_yojson tree path)
          | (_, "ValidationException") ->
              `ValidationException (validation_exception_of_yojson tree path)
          | _type -> handler tree path _type in
        Smaws_Lib.Protocols.AwsJson.(error_deserializer
                                       (handler
                                          Smaws_Lib.Protocols.AwsJson.Errors.default_handler)
                                       tree path)
    let request context (request : list_data_source_sync_jobs_request) =
      let open Smaws_Lib.Context in
        let open Deserializers in
          let input =
            Serializers.list_data_source_sync_jobs_request_to_yojson request in
          Smaws_Lib.Protocols.AwsJson.request
            ~shape_name:"AWSKendraFrontendServiceListDataSourceSyncJobs"
            ~service ~config:context.config ~http:context.http ~input
            ~output_deserializer:list_data_source_sync_jobs_response_of_yojson
            ~error_deserializer
  end
module ListDataSources =
  struct
    let error_deserializer tree path =
      let open Deserializers in
        let handler handler tree path =
          function
          | (_, "AccessDeniedException") ->
              `AccessDeniedException
                (access_denied_exception_of_yojson tree path)
          | (_, "InternalServerException") ->
              `InternalServerException
                (internal_server_exception_of_yojson tree path)
          | (_, "ResourceNotFoundException") ->
              `ResourceNotFoundException
                (resource_not_found_exception_of_yojson tree path)
          | (_, "ThrottlingException") ->
              `ThrottlingException (throttling_exception_of_yojson tree path)
          | (_, "ValidationException") ->
              `ValidationException (validation_exception_of_yojson tree path)
          | _type -> handler tree path _type in
        Smaws_Lib.Protocols.AwsJson.(error_deserializer
                                       (handler
                                          Smaws_Lib.Protocols.AwsJson.Errors.default_handler)
                                       tree path)
    let request context (request : list_data_sources_request) =
      let open Smaws_Lib.Context in
        let open Deserializers in
          let input = Serializers.list_data_sources_request_to_yojson request in
          Smaws_Lib.Protocols.AwsJson.request
            ~shape_name:"AWSKendraFrontendServiceListDataSources" ~service
            ~config:context.config ~http:context.http ~input
            ~output_deserializer:list_data_sources_response_of_yojson
            ~error_deserializer
  end
module ListEntityPersonas =
  struct
    let error_deserializer tree path =
      let open Deserializers in
        let handler handler tree path =
          function
          | (_, "AccessDeniedException") ->
              `AccessDeniedException
                (access_denied_exception_of_yojson tree path)
          | (_, "InternalServerException") ->
              `InternalServerException
                (internal_server_exception_of_yojson tree path)
          | (_, "ResourceNotFoundException") ->
              `ResourceNotFoundException
                (resource_not_found_exception_of_yojson tree path)
          | (_, "ThrottlingException") ->
              `ThrottlingException (throttling_exception_of_yojson tree path)
          | (_, "ValidationException") ->
              `ValidationException (validation_exception_of_yojson tree path)
          | _type -> handler tree path _type in
        Smaws_Lib.Protocols.AwsJson.(error_deserializer
                                       (handler
                                          Smaws_Lib.Protocols.AwsJson.Errors.default_handler)
                                       tree path)
    let request context (request : list_entity_personas_request) =
      let open Smaws_Lib.Context in
        let open Deserializers in
          let input =
            Serializers.list_entity_personas_request_to_yojson request in
          Smaws_Lib.Protocols.AwsJson.request
            ~shape_name:"AWSKendraFrontendServiceListEntityPersonas" ~service
            ~config:context.config ~http:context.http ~input
            ~output_deserializer:list_entity_personas_response_of_yojson
            ~error_deserializer
  end
module ListExperienceEntities =
  struct
    let error_deserializer tree path =
      let open Deserializers in
        let handler handler tree path =
          function
          | (_, "AccessDeniedException") ->
              `AccessDeniedException
                (access_denied_exception_of_yojson tree path)
          | (_, "InternalServerException") ->
              `InternalServerException
                (internal_server_exception_of_yojson tree path)
          | (_, "ResourceNotFoundException") ->
              `ResourceNotFoundException
                (resource_not_found_exception_of_yojson tree path)
          | (_, "ThrottlingException") ->
              `ThrottlingException (throttling_exception_of_yojson tree path)
          | (_, "ValidationException") ->
              `ValidationException (validation_exception_of_yojson tree path)
          | _type -> handler tree path _type in
        Smaws_Lib.Protocols.AwsJson.(error_deserializer
                                       (handler
                                          Smaws_Lib.Protocols.AwsJson.Errors.default_handler)
                                       tree path)
    let request context (request : list_experience_entities_request) =
      let open Smaws_Lib.Context in
        let open Deserializers in
          let input =
            Serializers.list_experience_entities_request_to_yojson request in
          Smaws_Lib.Protocols.AwsJson.request
            ~shape_name:"AWSKendraFrontendServiceListExperienceEntities"
            ~service ~config:context.config ~http:context.http ~input
            ~output_deserializer:list_experience_entities_response_of_yojson
            ~error_deserializer
  end
module ListExperiences =
  struct
    let error_deserializer tree path =
      let open Deserializers in
        let handler handler tree path =
          function
          | (_, "AccessDeniedException") ->
              `AccessDeniedException
                (access_denied_exception_of_yojson tree path)
          | (_, "InternalServerException") ->
              `InternalServerException
                (internal_server_exception_of_yojson tree path)
          | (_, "ResourceNotFoundException") ->
              `ResourceNotFoundException
                (resource_not_found_exception_of_yojson tree path)
          | (_, "ThrottlingException") ->
              `ThrottlingException (throttling_exception_of_yojson tree path)
          | (_, "ValidationException") ->
              `ValidationException (validation_exception_of_yojson tree path)
          | _type -> handler tree path _type in
        Smaws_Lib.Protocols.AwsJson.(error_deserializer
                                       (handler
                                          Smaws_Lib.Protocols.AwsJson.Errors.default_handler)
                                       tree path)
    let request context (request : list_experiences_request) =
      let open Smaws_Lib.Context in
        let open Deserializers in
          let input = Serializers.list_experiences_request_to_yojson request in
          Smaws_Lib.Protocols.AwsJson.request
            ~shape_name:"AWSKendraFrontendServiceListExperiences" ~service
            ~config:context.config ~http:context.http ~input
            ~output_deserializer:list_experiences_response_of_yojson
            ~error_deserializer
  end
module ListFaqs =
  struct
    let error_deserializer tree path =
      let open Deserializers in
        let handler handler tree path =
          function
          | (_, "AccessDeniedException") ->
              `AccessDeniedException
                (access_denied_exception_of_yojson tree path)
          | (_, "InternalServerException") ->
              `InternalServerException
                (internal_server_exception_of_yojson tree path)
          | (_, "ResourceNotFoundException") ->
              `ResourceNotFoundException
                (resource_not_found_exception_of_yojson tree path)
          | (_, "ThrottlingException") ->
              `ThrottlingException (throttling_exception_of_yojson tree path)
          | (_, "ValidationException") ->
              `ValidationException (validation_exception_of_yojson tree path)
          | _type -> handler tree path _type in
        Smaws_Lib.Protocols.AwsJson.(error_deserializer
                                       (handler
                                          Smaws_Lib.Protocols.AwsJson.Errors.default_handler)
                                       tree path)
    let request context (request : list_faqs_request) =
      let open Smaws_Lib.Context in
        let open Deserializers in
          let input = Serializers.list_faqs_request_to_yojson request in
          Smaws_Lib.Protocols.AwsJson.request
            ~shape_name:"AWSKendraFrontendServiceListFaqs" ~service
            ~config:context.config ~http:context.http ~input
            ~output_deserializer:list_faqs_response_of_yojson
            ~error_deserializer
  end
module ListFeaturedResultsSets =
  struct
    let error_deserializer tree path =
      let open Deserializers in
        let handler handler tree path =
          function
          | (_, "AccessDeniedException") ->
              `AccessDeniedException
                (access_denied_exception_of_yojson tree path)
          | (_, "InternalServerException") ->
              `InternalServerException
                (internal_server_exception_of_yojson tree path)
          | (_, "ResourceNotFoundException") ->
              `ResourceNotFoundException
                (resource_not_found_exception_of_yojson tree path)
          | (_, "ThrottlingException") ->
              `ThrottlingException (throttling_exception_of_yojson tree path)
          | (_, "ValidationException") ->
              `ValidationException (validation_exception_of_yojson tree path)
          | _type -> handler tree path _type in
        Smaws_Lib.Protocols.AwsJson.(error_deserializer
                                       (handler
                                          Smaws_Lib.Protocols.AwsJson.Errors.default_handler)
                                       tree path)
    let request context (request : list_featured_results_sets_request) =
      let open Smaws_Lib.Context in
        let open Deserializers in
          let input =
            Serializers.list_featured_results_sets_request_to_yojson request in
          Smaws_Lib.Protocols.AwsJson.request
            ~shape_name:"AWSKendraFrontendServiceListFeaturedResultsSets"
            ~service ~config:context.config ~http:context.http ~input
            ~output_deserializer:list_featured_results_sets_response_of_yojson
            ~error_deserializer
  end
module ListGroupsOlderThanOrderingId =
  struct
    let error_deserializer tree path =
      let open Deserializers in
        let handler handler tree path =
          function
          | (_, "AccessDeniedException") ->
              `AccessDeniedException
                (access_denied_exception_of_yojson tree path)
          | (_, "ConflictException") ->
              `ConflictException (conflict_exception_of_yojson tree path)
          | (_, "InternalServerException") ->
              `InternalServerException
                (internal_server_exception_of_yojson tree path)
          | (_, "ResourceNotFoundException") ->
              `ResourceNotFoundException
                (resource_not_found_exception_of_yojson tree path)
          | (_, "ThrottlingException") ->
              `ThrottlingException (throttling_exception_of_yojson tree path)
          | (_, "ValidationException") ->
              `ValidationException (validation_exception_of_yojson tree path)
          | _type -> handler tree path _type in
        Smaws_Lib.Protocols.AwsJson.(error_deserializer
                                       (handler
                                          Smaws_Lib.Protocols.AwsJson.Errors.default_handler)
                                       tree path)
    let request context
      (request : list_groups_older_than_ordering_id_request) =
      let open Smaws_Lib.Context in
        let open Deserializers in
          let input =
            Serializers.list_groups_older_than_ordering_id_request_to_yojson
              request in
          Smaws_Lib.Protocols.AwsJson.request
            ~shape_name:"AWSKendraFrontendServiceListGroupsOlderThanOrderingId"
            ~service ~config:context.config ~http:context.http ~input
            ~output_deserializer:list_groups_older_than_ordering_id_response_of_yojson
            ~error_deserializer
  end
module ListIndices =
  struct
    let error_deserializer tree path =
      let open Deserializers in
        let handler handler tree path =
          function
          | (_, "AccessDeniedException") ->
              `AccessDeniedException
                (access_denied_exception_of_yojson tree path)
          | (_, "InternalServerException") ->
              `InternalServerException
                (internal_server_exception_of_yojson tree path)
          | (_, "ThrottlingException") ->
              `ThrottlingException (throttling_exception_of_yojson tree path)
          | (_, "ValidationException") ->
              `ValidationException (validation_exception_of_yojson tree path)
          | _type -> handler tree path _type in
        Smaws_Lib.Protocols.AwsJson.(error_deserializer
                                       (handler
                                          Smaws_Lib.Protocols.AwsJson.Errors.default_handler)
                                       tree path)
    let request context (request : list_indices_request) =
      let open Smaws_Lib.Context in
        let open Deserializers in
          let input = Serializers.list_indices_request_to_yojson request in
          Smaws_Lib.Protocols.AwsJson.request
            ~shape_name:"AWSKendraFrontendServiceListIndices" ~service
            ~config:context.config ~http:context.http ~input
            ~output_deserializer:list_indices_response_of_yojson
            ~error_deserializer
  end
module ListQuerySuggestionsBlockLists =
  struct
    let error_deserializer tree path =
      let open Deserializers in
        let handler handler tree path =
          function
          | (_, "AccessDeniedException") ->
              `AccessDeniedException
                (access_denied_exception_of_yojson tree path)
          | (_, "InternalServerException") ->
              `InternalServerException
                (internal_server_exception_of_yojson tree path)
          | (_, "ResourceNotFoundException") ->
              `ResourceNotFoundException
                (resource_not_found_exception_of_yojson tree path)
          | (_, "ThrottlingException") ->
              `ThrottlingException (throttling_exception_of_yojson tree path)
          | (_, "ValidationException") ->
              `ValidationException (validation_exception_of_yojson tree path)
          | _type -> handler tree path _type in
        Smaws_Lib.Protocols.AwsJson.(error_deserializer
                                       (handler
                                          Smaws_Lib.Protocols.AwsJson.Errors.default_handler)
                                       tree path)
    let request context
      (request : list_query_suggestions_block_lists_request) =
      let open Smaws_Lib.Context in
        let open Deserializers in
          let input =
            Serializers.list_query_suggestions_block_lists_request_to_yojson
              request in
          Smaws_Lib.Protocols.AwsJson.request
            ~shape_name:"AWSKendraFrontendServiceListQuerySuggestionsBlockLists"
            ~service ~config:context.config ~http:context.http ~input
            ~output_deserializer:list_query_suggestions_block_lists_response_of_yojson
            ~error_deserializer
  end
module ListTagsForResource =
  struct
    let error_deserializer tree path =
      let open Deserializers in
        let handler handler tree path =
          function
          | (_, "AccessDeniedException") ->
              `AccessDeniedException
                (access_denied_exception_of_yojson tree path)
          | (_, "InternalServerException") ->
              `InternalServerException
                (internal_server_exception_of_yojson tree path)
          | (_, "ResourceUnavailableException") ->
              `ResourceUnavailableException
                (resource_unavailable_exception_of_yojson tree path)
          | (_, "ThrottlingException") ->
              `ThrottlingException (throttling_exception_of_yojson tree path)
          | (_, "ValidationException") ->
              `ValidationException (validation_exception_of_yojson tree path)
          | _type -> handler tree path _type in
        Smaws_Lib.Protocols.AwsJson.(error_deserializer
                                       (handler
                                          Smaws_Lib.Protocols.AwsJson.Errors.default_handler)
                                       tree path)
    let request context (request : list_tags_for_resource_request) =
      let open Smaws_Lib.Context in
        let open Deserializers in
          let input =
            Serializers.list_tags_for_resource_request_to_yojson request in
          Smaws_Lib.Protocols.AwsJson.request
            ~shape_name:"AWSKendraFrontendServiceListTagsForResource"
            ~service ~config:context.config ~http:context.http ~input
            ~output_deserializer:list_tags_for_resource_response_of_yojson
            ~error_deserializer
  end
module ListThesauri =
  struct
    let error_deserializer tree path =
      let open Deserializers in
        let handler handler tree path =
          function
          | (_, "AccessDeniedException") ->
              `AccessDeniedException
                (access_denied_exception_of_yojson tree path)
          | (_, "InternalServerException") ->
              `InternalServerException
                (internal_server_exception_of_yojson tree path)
          | (_, "ResourceNotFoundException") ->
              `ResourceNotFoundException
                (resource_not_found_exception_of_yojson tree path)
          | (_, "ThrottlingException") ->
              `ThrottlingException (throttling_exception_of_yojson tree path)
          | (_, "ValidationException") ->
              `ValidationException (validation_exception_of_yojson tree path)
          | _type -> handler tree path _type in
        Smaws_Lib.Protocols.AwsJson.(error_deserializer
                                       (handler
                                          Smaws_Lib.Protocols.AwsJson.Errors.default_handler)
                                       tree path)
    let request context (request : list_thesauri_request) =
      let open Smaws_Lib.Context in
        let open Deserializers in
          let input = Serializers.list_thesauri_request_to_yojson request in
          Smaws_Lib.Protocols.AwsJson.request
            ~shape_name:"AWSKendraFrontendServiceListThesauri" ~service
            ~config:context.config ~http:context.http ~input
            ~output_deserializer:list_thesauri_response_of_yojson
            ~error_deserializer
  end
module PutPrincipalMapping =
  struct
    let error_deserializer tree path =
      let open Deserializers in
        let handler handler tree path =
          function
          | (_, "AccessDeniedException") ->
              `AccessDeniedException
                (access_denied_exception_of_yojson tree path)
          | (_, "ConflictException") ->
              `ConflictException (conflict_exception_of_yojson tree path)
          | (_, "InternalServerException") ->
              `InternalServerException
                (internal_server_exception_of_yojson tree path)
          | (_, "ResourceNotFoundException") ->
              `ResourceNotFoundException
                (resource_not_found_exception_of_yojson tree path)
          | (_, "ServiceQuotaExceededException") ->
              `ServiceQuotaExceededException
                (service_quota_exceeded_exception_of_yojson tree path)
          | (_, "ThrottlingException") ->
              `ThrottlingException (throttling_exception_of_yojson tree path)
          | (_, "ValidationException") ->
              `ValidationException (validation_exception_of_yojson tree path)
          | _type -> handler tree path _type in
        Smaws_Lib.Protocols.AwsJson.(error_deserializer
                                       (handler
                                          Smaws_Lib.Protocols.AwsJson.Errors.default_handler)
                                       tree path)
    let request context (request : put_principal_mapping_request) =
      let open Smaws_Lib.Context in
        let open Deserializers in
          let input =
            Serializers.put_principal_mapping_request_to_yojson request in
          Smaws_Lib.Protocols.AwsJson.request
            ~shape_name:"AWSKendraFrontendServicePutPrincipalMapping"
            ~service ~config:context.config ~http:context.http ~input
            ~output_deserializer:base_unit_of_yojson ~error_deserializer
  end
module Query =
  struct
    let error_deserializer tree path =
      let open Deserializers in
        let handler handler tree path =
          function
          | (_, "AccessDeniedException") ->
              `AccessDeniedException
                (access_denied_exception_of_yojson tree path)
          | (_, "ConflictException") ->
              `ConflictException (conflict_exception_of_yojson tree path)
          | (_, "InternalServerException") ->
              `InternalServerException
                (internal_server_exception_of_yojson tree path)
          | (_, "ResourceNotFoundException") ->
              `ResourceNotFoundException
                (resource_not_found_exception_of_yojson tree path)
          | (_, "ServiceQuotaExceededException") ->
              `ServiceQuotaExceededException
                (service_quota_exceeded_exception_of_yojson tree path)
          | (_, "ThrottlingException") ->
              `ThrottlingException (throttling_exception_of_yojson tree path)
          | (_, "ValidationException") ->
              `ValidationException (validation_exception_of_yojson tree path)
          | _type -> handler tree path _type in
        Smaws_Lib.Protocols.AwsJson.(error_deserializer
                                       (handler
                                          Smaws_Lib.Protocols.AwsJson.Errors.default_handler)
                                       tree path)
    let request context (request : query_request) =
      let open Smaws_Lib.Context in
        let open Deserializers in
          let input = Serializers.query_request_to_yojson request in
          Smaws_Lib.Protocols.AwsJson.request
            ~shape_name:"AWSKendraFrontendServiceQuery" ~service
            ~config:context.config ~http:context.http ~input
            ~output_deserializer:query_result_of_yojson ~error_deserializer
  end
module Retrieve =
  struct
    let error_deserializer tree path =
      let open Deserializers in
        let handler handler tree path =
          function
          | (_, "AccessDeniedException") ->
              `AccessDeniedException
                (access_denied_exception_of_yojson tree path)
          | (_, "ConflictException") ->
              `ConflictException (conflict_exception_of_yojson tree path)
          | (_, "InternalServerException") ->
              `InternalServerException
                (internal_server_exception_of_yojson tree path)
          | (_, "ResourceNotFoundException") ->
              `ResourceNotFoundException
                (resource_not_found_exception_of_yojson tree path)
          | (_, "ServiceQuotaExceededException") ->
              `ServiceQuotaExceededException
                (service_quota_exceeded_exception_of_yojson tree path)
          | (_, "ThrottlingException") ->
              `ThrottlingException (throttling_exception_of_yojson tree path)
          | (_, "ValidationException") ->
              `ValidationException (validation_exception_of_yojson tree path)
          | _type -> handler tree path _type in
        Smaws_Lib.Protocols.AwsJson.(error_deserializer
                                       (handler
                                          Smaws_Lib.Protocols.AwsJson.Errors.default_handler)
                                       tree path)
    let request context (request : retrieve_request) =
      let open Smaws_Lib.Context in
        let open Deserializers in
          let input = Serializers.retrieve_request_to_yojson request in
          Smaws_Lib.Protocols.AwsJson.request
            ~shape_name:"AWSKendraFrontendServiceRetrieve" ~service
            ~config:context.config ~http:context.http ~input
            ~output_deserializer:retrieve_result_of_yojson
            ~error_deserializer
  end
module StartDataSourceSyncJob =
  struct
    let error_deserializer tree path =
      let open Deserializers in
        let handler handler tree path =
          function
          | (_, "AccessDeniedException") ->
              `AccessDeniedException
                (access_denied_exception_of_yojson tree path)
          | (_, "ConflictException") ->
              `ConflictException (conflict_exception_of_yojson tree path)
          | (_, "InternalServerException") ->
              `InternalServerException
                (internal_server_exception_of_yojson tree path)
          | (_, "ResourceInUseException") ->
              `ResourceInUseException
                (resource_in_use_exception_of_yojson tree path)
          | (_, "ResourceNotFoundException") ->
              `ResourceNotFoundException
                (resource_not_found_exception_of_yojson tree path)
          | (_, "ThrottlingException") ->
              `ThrottlingException (throttling_exception_of_yojson tree path)
          | (_, "ValidationException") ->
              `ValidationException (validation_exception_of_yojson tree path)
          | _type -> handler tree path _type in
        Smaws_Lib.Protocols.AwsJson.(error_deserializer
                                       (handler
                                          Smaws_Lib.Protocols.AwsJson.Errors.default_handler)
                                       tree path)
    let request context (request : start_data_source_sync_job_request) =
      let open Smaws_Lib.Context in
        let open Deserializers in
          let input =
            Serializers.start_data_source_sync_job_request_to_yojson request in
          Smaws_Lib.Protocols.AwsJson.request
            ~shape_name:"AWSKendraFrontendServiceStartDataSourceSyncJob"
            ~service ~config:context.config ~http:context.http ~input
            ~output_deserializer:start_data_source_sync_job_response_of_yojson
            ~error_deserializer
  end
module StopDataSourceSyncJob =
  struct
    let error_deserializer tree path =
      let open Deserializers in
        let handler handler tree path =
          function
          | (_, "AccessDeniedException") ->
              `AccessDeniedException
                (access_denied_exception_of_yojson tree path)
          | (_, "InternalServerException") ->
              `InternalServerException
                (internal_server_exception_of_yojson tree path)
          | (_, "ResourceNotFoundException") ->
              `ResourceNotFoundException
                (resource_not_found_exception_of_yojson tree path)
          | (_, "ThrottlingException") ->
              `ThrottlingException (throttling_exception_of_yojson tree path)
          | (_, "ValidationException") ->
              `ValidationException (validation_exception_of_yojson tree path)
          | _type -> handler tree path _type in
        Smaws_Lib.Protocols.AwsJson.(error_deserializer
                                       (handler
                                          Smaws_Lib.Protocols.AwsJson.Errors.default_handler)
                                       tree path)
    let request context (request : stop_data_source_sync_job_request) =
      let open Smaws_Lib.Context in
        let open Deserializers in
          let input =
            Serializers.stop_data_source_sync_job_request_to_yojson request in
          Smaws_Lib.Protocols.AwsJson.request
            ~shape_name:"AWSKendraFrontendServiceStopDataSourceSyncJob"
            ~service ~config:context.config ~http:context.http ~input
            ~output_deserializer:base_unit_of_yojson ~error_deserializer
  end
module SubmitFeedback =
  struct
    let error_deserializer tree path =
      let open Deserializers in
        let handler handler tree path =
          function
          | (_, "AccessDeniedException") ->
              `AccessDeniedException
                (access_denied_exception_of_yojson tree path)
          | (_, "InternalServerException") ->
              `InternalServerException
                (internal_server_exception_of_yojson tree path)
          | (_, "ResourceNotFoundException") ->
              `ResourceNotFoundException
                (resource_not_found_exception_of_yojson tree path)
          | (_, "ResourceUnavailableException") ->
              `ResourceUnavailableException
                (resource_unavailable_exception_of_yojson tree path)
          | (_, "ThrottlingException") ->
              `ThrottlingException (throttling_exception_of_yojson tree path)
          | (_, "ValidationException") ->
              `ValidationException (validation_exception_of_yojson tree path)
          | _type -> handler tree path _type in
        Smaws_Lib.Protocols.AwsJson.(error_deserializer
                                       (handler
                                          Smaws_Lib.Protocols.AwsJson.Errors.default_handler)
                                       tree path)
    let request context (request : submit_feedback_request) =
      let open Smaws_Lib.Context in
        let open Deserializers in
          let input = Serializers.submit_feedback_request_to_yojson request in
          Smaws_Lib.Protocols.AwsJson.request
            ~shape_name:"AWSKendraFrontendServiceSubmitFeedback" ~service
            ~config:context.config ~http:context.http ~input
            ~output_deserializer:base_unit_of_yojson ~error_deserializer
  end
module TagResource =
  struct
    let error_deserializer tree path =
      let open Deserializers in
        let handler handler tree path =
          function
          | (_, "AccessDeniedException") ->
              `AccessDeniedException
                (access_denied_exception_of_yojson tree path)
          | (_, "InternalServerException") ->
              `InternalServerException
                (internal_server_exception_of_yojson tree path)
          | (_, "ResourceUnavailableException") ->
              `ResourceUnavailableException
                (resource_unavailable_exception_of_yojson tree path)
          | (_, "ThrottlingException") ->
              `ThrottlingException (throttling_exception_of_yojson tree path)
          | (_, "ValidationException") ->
              `ValidationException (validation_exception_of_yojson tree path)
          | _type -> handler tree path _type in
        Smaws_Lib.Protocols.AwsJson.(error_deserializer
                                       (handler
                                          Smaws_Lib.Protocols.AwsJson.Errors.default_handler)
                                       tree path)
    let request context (request : tag_resource_request) =
      let open Smaws_Lib.Context in
        let open Deserializers in
          let input = Serializers.tag_resource_request_to_yojson request in
          Smaws_Lib.Protocols.AwsJson.request
            ~shape_name:"AWSKendraFrontendServiceTagResource" ~service
            ~config:context.config ~http:context.http ~input
            ~output_deserializer:tag_resource_response_of_yojson
            ~error_deserializer
  end
module UntagResource =
  struct
    let error_deserializer tree path =
      let open Deserializers in
        let handler handler tree path =
          function
          | (_, "AccessDeniedException") ->
              `AccessDeniedException
                (access_denied_exception_of_yojson tree path)
          | (_, "InternalServerException") ->
              `InternalServerException
                (internal_server_exception_of_yojson tree path)
          | (_, "ResourceUnavailableException") ->
              `ResourceUnavailableException
                (resource_unavailable_exception_of_yojson tree path)
          | (_, "ThrottlingException") ->
              `ThrottlingException (throttling_exception_of_yojson tree path)
          | (_, "ValidationException") ->
              `ValidationException (validation_exception_of_yojson tree path)
          | _type -> handler tree path _type in
        Smaws_Lib.Protocols.AwsJson.(error_deserializer
                                       (handler
                                          Smaws_Lib.Protocols.AwsJson.Errors.default_handler)
                                       tree path)
    let request context (request : untag_resource_request) =
      let open Smaws_Lib.Context in
        let open Deserializers in
          let input = Serializers.untag_resource_request_to_yojson request in
          Smaws_Lib.Protocols.AwsJson.request
            ~shape_name:"AWSKendraFrontendServiceUntagResource" ~service
            ~config:context.config ~http:context.http ~input
            ~output_deserializer:untag_resource_response_of_yojson
            ~error_deserializer
  end
module UpdateAccessControlConfiguration =
  struct
    let error_deserializer tree path =
      let open Deserializers in
        let handler handler tree path =
          function
          | (_, "AccessDeniedException") ->
              `AccessDeniedException
                (access_denied_exception_of_yojson tree path)
          | (_, "ConflictException") ->
              `ConflictException (conflict_exception_of_yojson tree path)
          | (_, "InternalServerException") ->
              `InternalServerException
                (internal_server_exception_of_yojson tree path)
          | (_, "ResourceNotFoundException") ->
              `ResourceNotFoundException
                (resource_not_found_exception_of_yojson tree path)
          | (_, "ServiceQuotaExceededException") ->
              `ServiceQuotaExceededException
                (service_quota_exceeded_exception_of_yojson tree path)
          | (_, "ThrottlingException") ->
              `ThrottlingException (throttling_exception_of_yojson tree path)
          | (_, "ValidationException") ->
              `ValidationException (validation_exception_of_yojson tree path)
          | _type -> handler tree path _type in
        Smaws_Lib.Protocols.AwsJson.(error_deserializer
                                       (handler
                                          Smaws_Lib.Protocols.AwsJson.Errors.default_handler)
                                       tree path)
    let request context
      (request : update_access_control_configuration_request) =
      let open Smaws_Lib.Context in
        let open Deserializers in
          let input =
            Serializers.update_access_control_configuration_request_to_yojson
              request in
          Smaws_Lib.Protocols.AwsJson.request
            ~shape_name:"AWSKendraFrontendServiceUpdateAccessControlConfiguration"
            ~service ~config:context.config ~http:context.http ~input
            ~output_deserializer:update_access_control_configuration_response_of_yojson
            ~error_deserializer
  end
module UpdateDataSource =
  struct
    let error_deserializer tree path =
      let open Deserializers in
        let handler handler tree path =
          function
          | (_, "AccessDeniedException") ->
              `AccessDeniedException
                (access_denied_exception_of_yojson tree path)
          | (_, "ConflictException") ->
              `ConflictException (conflict_exception_of_yojson tree path)
          | (_, "InternalServerException") ->
              `InternalServerException
                (internal_server_exception_of_yojson tree path)
          | (_, "ResourceNotFoundException") ->
              `ResourceNotFoundException
                (resource_not_found_exception_of_yojson tree path)
          | (_, "ThrottlingException") ->
              `ThrottlingException (throttling_exception_of_yojson tree path)
          | (_, "ValidationException") ->
              `ValidationException (validation_exception_of_yojson tree path)
          | _type -> handler tree path _type in
        Smaws_Lib.Protocols.AwsJson.(error_deserializer
                                       (handler
                                          Smaws_Lib.Protocols.AwsJson.Errors.default_handler)
                                       tree path)
    let request context (request : update_data_source_request) =
      let open Smaws_Lib.Context in
        let open Deserializers in
          let input =
            Serializers.update_data_source_request_to_yojson request in
          Smaws_Lib.Protocols.AwsJson.request
            ~shape_name:"AWSKendraFrontendServiceUpdateDataSource" ~service
            ~config:context.config ~http:context.http ~input
            ~output_deserializer:base_unit_of_yojson ~error_deserializer
  end
module UpdateExperience =
  struct
    let error_deserializer tree path =
      let open Deserializers in
        let handler handler tree path =
          function
          | (_, "AccessDeniedException") ->
              `AccessDeniedException
                (access_denied_exception_of_yojson tree path)
          | (_, "ConflictException") ->
              `ConflictException (conflict_exception_of_yojson tree path)
          | (_, "InternalServerException") ->
              `InternalServerException
                (internal_server_exception_of_yojson tree path)
          | (_, "ResourceNotFoundException") ->
              `ResourceNotFoundException
                (resource_not_found_exception_of_yojson tree path)
          | (_, "ThrottlingException") ->
              `ThrottlingException (throttling_exception_of_yojson tree path)
          | (_, "ValidationException") ->
              `ValidationException (validation_exception_of_yojson tree path)
          | _type -> handler tree path _type in
        Smaws_Lib.Protocols.AwsJson.(error_deserializer
                                       (handler
                                          Smaws_Lib.Protocols.AwsJson.Errors.default_handler)
                                       tree path)
    let request context (request : update_experience_request) =
      let open Smaws_Lib.Context in
        let open Deserializers in
          let input = Serializers.update_experience_request_to_yojson request in
          Smaws_Lib.Protocols.AwsJson.request
            ~shape_name:"AWSKendraFrontendServiceUpdateExperience" ~service
            ~config:context.config ~http:context.http ~input
            ~output_deserializer:base_unit_of_yojson ~error_deserializer
  end
module UpdateFeaturedResultsSet =
  struct
    let error_deserializer tree path =
      let open Deserializers in
        let handler handler tree path =
          function
          | (_, "AccessDeniedException") ->
              `AccessDeniedException
                (access_denied_exception_of_yojson tree path)
          | (_, "FeaturedResultsConflictException") ->
              `FeaturedResultsConflictException
                (featured_results_conflict_exception_of_yojson tree path)
          | (_, "InternalServerException") ->
              `InternalServerException
                (internal_server_exception_of_yojson tree path)
          | (_, "ResourceNotFoundException") ->
              `ResourceNotFoundException
                (resource_not_found_exception_of_yojson tree path)
          | (_, "ThrottlingException") ->
              `ThrottlingException (throttling_exception_of_yojson tree path)
          | (_, "ValidationException") ->
              `ValidationException (validation_exception_of_yojson tree path)
          | _type -> handler tree path _type in
        Smaws_Lib.Protocols.AwsJson.(error_deserializer
                                       (handler
                                          Smaws_Lib.Protocols.AwsJson.Errors.default_handler)
                                       tree path)
    let request context (request : update_featured_results_set_request) =
      let open Smaws_Lib.Context in
        let open Deserializers in
          let input =
            Serializers.update_featured_results_set_request_to_yojson request in
          Smaws_Lib.Protocols.AwsJson.request
            ~shape_name:"AWSKendraFrontendServiceUpdateFeaturedResultsSet"
            ~service ~config:context.config ~http:context.http ~input
            ~output_deserializer:update_featured_results_set_response_of_yojson
            ~error_deserializer
  end
module UpdateIndex =
  struct
    let error_deserializer tree path =
      let open Deserializers in
        let handler handler tree path =
          function
          | (_, "AccessDeniedException") ->
              `AccessDeniedException
                (access_denied_exception_of_yojson tree path)
          | (_, "ConflictException") ->
              `ConflictException (conflict_exception_of_yojson tree path)
          | (_, "InternalServerException") ->
              `InternalServerException
                (internal_server_exception_of_yojson tree path)
          | (_, "ResourceNotFoundException") ->
              `ResourceNotFoundException
                (resource_not_found_exception_of_yojson tree path)
          | (_, "ServiceQuotaExceededException") ->
              `ServiceQuotaExceededException
                (service_quota_exceeded_exception_of_yojson tree path)
          | (_, "ThrottlingException") ->
              `ThrottlingException (throttling_exception_of_yojson tree path)
          | (_, "ValidationException") ->
              `ValidationException (validation_exception_of_yojson tree path)
          | _type -> handler tree path _type in
        Smaws_Lib.Protocols.AwsJson.(error_deserializer
                                       (handler
                                          Smaws_Lib.Protocols.AwsJson.Errors.default_handler)
                                       tree path)
    let request context (request : update_index_request) =
      let open Smaws_Lib.Context in
        let open Deserializers in
          let input = Serializers.update_index_request_to_yojson request in
          Smaws_Lib.Protocols.AwsJson.request
            ~shape_name:"AWSKendraFrontendServiceUpdateIndex" ~service
            ~config:context.config ~http:context.http ~input
            ~output_deserializer:base_unit_of_yojson ~error_deserializer
  end
module UpdateQuerySuggestionsBlockList =
  struct
    let error_deserializer tree path =
      let open Deserializers in
        let handler handler tree path =
          function
          | (_, "AccessDeniedException") ->
              `AccessDeniedException
                (access_denied_exception_of_yojson tree path)
          | (_, "ConflictException") ->
              `ConflictException (conflict_exception_of_yojson tree path)
          | (_, "InternalServerException") ->
              `InternalServerException
                (internal_server_exception_of_yojson tree path)
          | (_, "ResourceNotFoundException") ->
              `ResourceNotFoundException
                (resource_not_found_exception_of_yojson tree path)
          | (_, "ThrottlingException") ->
              `ThrottlingException (throttling_exception_of_yojson tree path)
          | (_, "ValidationException") ->
              `ValidationException (validation_exception_of_yojson tree path)
          | _type -> handler tree path _type in
        Smaws_Lib.Protocols.AwsJson.(error_deserializer
                                       (handler
                                          Smaws_Lib.Protocols.AwsJson.Errors.default_handler)
                                       tree path)
    let request context
      (request : update_query_suggestions_block_list_request) =
      let open Smaws_Lib.Context in
        let open Deserializers in
          let input =
            Serializers.update_query_suggestions_block_list_request_to_yojson
              request in
          Smaws_Lib.Protocols.AwsJson.request
            ~shape_name:"AWSKendraFrontendServiceUpdateQuerySuggestionsBlockList"
            ~service ~config:context.config ~http:context.http ~input
            ~output_deserializer:base_unit_of_yojson ~error_deserializer
  end
module UpdateQuerySuggestionsConfig =
  struct
    let error_deserializer tree path =
      let open Deserializers in
        let handler handler tree path =
          function
          | (_, "AccessDeniedException") ->
              `AccessDeniedException
                (access_denied_exception_of_yojson tree path)
          | (_, "ConflictException") ->
              `ConflictException (conflict_exception_of_yojson tree path)
          | (_, "InternalServerException") ->
              `InternalServerException
                (internal_server_exception_of_yojson tree path)
          | (_, "ResourceNotFoundException") ->
              `ResourceNotFoundException
                (resource_not_found_exception_of_yojson tree path)
          | (_, "ThrottlingException") ->
              `ThrottlingException (throttling_exception_of_yojson tree path)
          | (_, "ValidationException") ->
              `ValidationException (validation_exception_of_yojson tree path)
          | _type -> handler tree path _type in
        Smaws_Lib.Protocols.AwsJson.(error_deserializer
                                       (handler
                                          Smaws_Lib.Protocols.AwsJson.Errors.default_handler)
                                       tree path)
    let request context (request : update_query_suggestions_config_request) =
      let open Smaws_Lib.Context in
        let open Deserializers in
          let input =
            Serializers.update_query_suggestions_config_request_to_yojson
              request in
          Smaws_Lib.Protocols.AwsJson.request
            ~shape_name:"AWSKendraFrontendServiceUpdateQuerySuggestionsConfig"
            ~service ~config:context.config ~http:context.http ~input
            ~output_deserializer:base_unit_of_yojson ~error_deserializer
  end
module UpdateThesaurus =
  struct
    let error_deserializer tree path =
      let open Deserializers in
        let handler handler tree path =
          function
          | (_, "AccessDeniedException") ->
              `AccessDeniedException
                (access_denied_exception_of_yojson tree path)
          | (_, "ConflictException") ->
              `ConflictException (conflict_exception_of_yojson tree path)
          | (_, "InternalServerException") ->
              `InternalServerException
                (internal_server_exception_of_yojson tree path)
          | (_, "ResourceNotFoundException") ->
              `ResourceNotFoundException
                (resource_not_found_exception_of_yojson tree path)
          | (_, "ThrottlingException") ->
              `ThrottlingException (throttling_exception_of_yojson tree path)
          | (_, "ValidationException") ->
              `ValidationException (validation_exception_of_yojson tree path)
          | _type -> handler tree path _type in
        Smaws_Lib.Protocols.AwsJson.(error_deserializer
                                       (handler
                                          Smaws_Lib.Protocols.AwsJson.Errors.default_handler)
                                       tree path)
    let request context (request : update_thesaurus_request) =
      let open Smaws_Lib.Context in
        let open Deserializers in
          let input = Serializers.update_thesaurus_request_to_yojson request in
          Smaws_Lib.Protocols.AwsJson.request
            ~shape_name:"AWSKendraFrontendServiceUpdateThesaurus" ~service
            ~config:context.config ~http:context.http ~input
            ~output_deserializer:base_unit_of_yojson ~error_deserializer
  end