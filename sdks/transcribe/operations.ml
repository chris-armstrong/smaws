open Types
open Service_metadata
module CreateCallAnalyticsCategory =
  struct
    let error_deserializer tree path =
      let open Deserializers in
        let handler handler tree path =
          function
          | (_, "BadRequestException") ->
              `BadRequestException
                (bad_request_exception_of_yojson tree path)
          | (_, "ConflictException") ->
              `ConflictException (conflict_exception_of_yojson tree path)
          | (_, "InternalFailureException") ->
              `InternalFailureException
                (internal_failure_exception_of_yojson tree path)
          | (_, "LimitExceededException") ->
              `LimitExceededException
                (limit_exceeded_exception_of_yojson tree path)
          | _type -> handler tree path _type in
        Smaws_Lib.Protocols.AwsJson.(error_deserializer
                                       (handler
                                          Smaws_Lib.Protocols.AwsJson.Errors.default_handler)
                                       tree path)
    let request context (request : create_call_analytics_category_request) =
      let open Smaws_Lib.Context in
        let open Deserializers in
          let input =
            Serializers.create_call_analytics_category_request_to_yojson
              request in
          Smaws_Lib.Protocols.AwsJson.request
            ~shape_name:"TranscribeCreateCallAnalyticsCategory" ~service
            ~config:context.config ~http:context.http ~input
            ~output_deserializer:create_call_analytics_category_response_of_yojson
            ~error_deserializer
  end
module CreateLanguageModel =
  struct
    let error_deserializer tree path =
      let open Deserializers in
        let handler handler tree path =
          function
          | (_, "BadRequestException") ->
              `BadRequestException
                (bad_request_exception_of_yojson tree path)
          | (_, "ConflictException") ->
              `ConflictException (conflict_exception_of_yojson tree path)
          | (_, "InternalFailureException") ->
              `InternalFailureException
                (internal_failure_exception_of_yojson tree path)
          | (_, "LimitExceededException") ->
              `LimitExceededException
                (limit_exceeded_exception_of_yojson tree path)
          | _type -> handler tree path _type in
        Smaws_Lib.Protocols.AwsJson.(error_deserializer
                                       (handler
                                          Smaws_Lib.Protocols.AwsJson.Errors.default_handler)
                                       tree path)
    let request context (request : create_language_model_request) =
      let open Smaws_Lib.Context in
        let open Deserializers in
          let input =
            Serializers.create_language_model_request_to_yojson request in
          Smaws_Lib.Protocols.AwsJson.request
            ~shape_name:"TranscribeCreateLanguageModel" ~service
            ~config:context.config ~http:context.http ~input
            ~output_deserializer:create_language_model_response_of_yojson
            ~error_deserializer
  end
module CreateMedicalVocabulary =
  struct
    let error_deserializer tree path =
      let open Deserializers in
        let handler handler tree path =
          function
          | (_, "BadRequestException") ->
              `BadRequestException
                (bad_request_exception_of_yojson tree path)
          | (_, "ConflictException") ->
              `ConflictException (conflict_exception_of_yojson tree path)
          | (_, "InternalFailureException") ->
              `InternalFailureException
                (internal_failure_exception_of_yojson tree path)
          | (_, "LimitExceededException") ->
              `LimitExceededException
                (limit_exceeded_exception_of_yojson tree path)
          | _type -> handler tree path _type in
        Smaws_Lib.Protocols.AwsJson.(error_deserializer
                                       (handler
                                          Smaws_Lib.Protocols.AwsJson.Errors.default_handler)
                                       tree path)
    let request context (request : create_medical_vocabulary_request) =
      let open Smaws_Lib.Context in
        let open Deserializers in
          let input =
            Serializers.create_medical_vocabulary_request_to_yojson request in
          Smaws_Lib.Protocols.AwsJson.request
            ~shape_name:"TranscribeCreateMedicalVocabulary" ~service
            ~config:context.config ~http:context.http ~input
            ~output_deserializer:create_medical_vocabulary_response_of_yojson
            ~error_deserializer
  end
module CreateVocabulary =
  struct
    let error_deserializer tree path =
      let open Deserializers in
        let handler handler tree path =
          function
          | (_, "BadRequestException") ->
              `BadRequestException
                (bad_request_exception_of_yojson tree path)
          | (_, "ConflictException") ->
              `ConflictException (conflict_exception_of_yojson tree path)
          | (_, "InternalFailureException") ->
              `InternalFailureException
                (internal_failure_exception_of_yojson tree path)
          | (_, "LimitExceededException") ->
              `LimitExceededException
                (limit_exceeded_exception_of_yojson tree path)
          | _type -> handler tree path _type in
        Smaws_Lib.Protocols.AwsJson.(error_deserializer
                                       (handler
                                          Smaws_Lib.Protocols.AwsJson.Errors.default_handler)
                                       tree path)
    let request context (request : create_vocabulary_request) =
      let open Smaws_Lib.Context in
        let open Deserializers in
          let input = Serializers.create_vocabulary_request_to_yojson request in
          Smaws_Lib.Protocols.AwsJson.request
            ~shape_name:"TranscribeCreateVocabulary" ~service
            ~config:context.config ~http:context.http ~input
            ~output_deserializer:create_vocabulary_response_of_yojson
            ~error_deserializer
  end
module CreateVocabularyFilter =
  struct
    let error_deserializer tree path =
      let open Deserializers in
        let handler handler tree path =
          function
          | (_, "BadRequestException") ->
              `BadRequestException
                (bad_request_exception_of_yojson tree path)
          | (_, "ConflictException") ->
              `ConflictException (conflict_exception_of_yojson tree path)
          | (_, "InternalFailureException") ->
              `InternalFailureException
                (internal_failure_exception_of_yojson tree path)
          | (_, "LimitExceededException") ->
              `LimitExceededException
                (limit_exceeded_exception_of_yojson tree path)
          | _type -> handler tree path _type in
        Smaws_Lib.Protocols.AwsJson.(error_deserializer
                                       (handler
                                          Smaws_Lib.Protocols.AwsJson.Errors.default_handler)
                                       tree path)
    let request context (request : create_vocabulary_filter_request) =
      let open Smaws_Lib.Context in
        let open Deserializers in
          let input =
            Serializers.create_vocabulary_filter_request_to_yojson request in
          Smaws_Lib.Protocols.AwsJson.request
            ~shape_name:"TranscribeCreateVocabularyFilter" ~service
            ~config:context.config ~http:context.http ~input
            ~output_deserializer:create_vocabulary_filter_response_of_yojson
            ~error_deserializer
  end
module DeleteCallAnalyticsCategory =
  struct
    let error_deserializer tree path =
      let open Deserializers in
        let handler handler tree path =
          function
          | (_, "BadRequestException") ->
              `BadRequestException
                (bad_request_exception_of_yojson tree path)
          | (_, "InternalFailureException") ->
              `InternalFailureException
                (internal_failure_exception_of_yojson tree path)
          | (_, "LimitExceededException") ->
              `LimitExceededException
                (limit_exceeded_exception_of_yojson tree path)
          | (_, "NotFoundException") ->
              `NotFoundException (not_found_exception_of_yojson tree path)
          | _type -> handler tree path _type in
        Smaws_Lib.Protocols.AwsJson.(error_deserializer
                                       (handler
                                          Smaws_Lib.Protocols.AwsJson.Errors.default_handler)
                                       tree path)
    let request context (request : delete_call_analytics_category_request) =
      let open Smaws_Lib.Context in
        let open Deserializers in
          let input =
            Serializers.delete_call_analytics_category_request_to_yojson
              request in
          Smaws_Lib.Protocols.AwsJson.request
            ~shape_name:"TranscribeDeleteCallAnalyticsCategory" ~service
            ~config:context.config ~http:context.http ~input
            ~output_deserializer:delete_call_analytics_category_response_of_yojson
            ~error_deserializer
  end
module DeleteCallAnalyticsJob =
  struct
    let error_deserializer tree path =
      let open Deserializers in
        let handler handler tree path =
          function
          | (_, "BadRequestException") ->
              `BadRequestException
                (bad_request_exception_of_yojson tree path)
          | (_, "InternalFailureException") ->
              `InternalFailureException
                (internal_failure_exception_of_yojson tree path)
          | (_, "LimitExceededException") ->
              `LimitExceededException
                (limit_exceeded_exception_of_yojson tree path)
          | _type -> handler tree path _type in
        Smaws_Lib.Protocols.AwsJson.(error_deserializer
                                       (handler
                                          Smaws_Lib.Protocols.AwsJson.Errors.default_handler)
                                       tree path)
    let request context (request : delete_call_analytics_job_request) =
      let open Smaws_Lib.Context in
        let open Deserializers in
          let input =
            Serializers.delete_call_analytics_job_request_to_yojson request in
          Smaws_Lib.Protocols.AwsJson.request
            ~shape_name:"TranscribeDeleteCallAnalyticsJob" ~service
            ~config:context.config ~http:context.http ~input
            ~output_deserializer:delete_call_analytics_job_response_of_yojson
            ~error_deserializer
  end
module DeleteLanguageModel =
  struct
    let error_deserializer tree path =
      let open Deserializers in
        let handler handler tree path =
          function
          | (_, "BadRequestException") ->
              `BadRequestException
                (bad_request_exception_of_yojson tree path)
          | (_, "InternalFailureException") ->
              `InternalFailureException
                (internal_failure_exception_of_yojson tree path)
          | (_, "LimitExceededException") ->
              `LimitExceededException
                (limit_exceeded_exception_of_yojson tree path)
          | _type -> handler tree path _type in
        Smaws_Lib.Protocols.AwsJson.(error_deserializer
                                       (handler
                                          Smaws_Lib.Protocols.AwsJson.Errors.default_handler)
                                       tree path)
    let request context (request : delete_language_model_request) =
      let open Smaws_Lib.Context in
        let open Deserializers in
          let input =
            Serializers.delete_language_model_request_to_yojson request in
          Smaws_Lib.Protocols.AwsJson.request
            ~shape_name:"TranscribeDeleteLanguageModel" ~service
            ~config:context.config ~http:context.http ~input
            ~output_deserializer:base_unit_of_yojson ~error_deserializer
  end
module DeleteMedicalScribeJob =
  struct
    let error_deserializer tree path =
      let open Deserializers in
        let handler handler tree path =
          function
          | (_, "BadRequestException") ->
              `BadRequestException
                (bad_request_exception_of_yojson tree path)
          | (_, "InternalFailureException") ->
              `InternalFailureException
                (internal_failure_exception_of_yojson tree path)
          | (_, "LimitExceededException") ->
              `LimitExceededException
                (limit_exceeded_exception_of_yojson tree path)
          | _type -> handler tree path _type in
        Smaws_Lib.Protocols.AwsJson.(error_deserializer
                                       (handler
                                          Smaws_Lib.Protocols.AwsJson.Errors.default_handler)
                                       tree path)
    let request context (request : delete_medical_scribe_job_request) =
      let open Smaws_Lib.Context in
        let open Deserializers in
          let input =
            Serializers.delete_medical_scribe_job_request_to_yojson request in
          Smaws_Lib.Protocols.AwsJson.request
            ~shape_name:"TranscribeDeleteMedicalScribeJob" ~service
            ~config:context.config ~http:context.http ~input
            ~output_deserializer:base_unit_of_yojson ~error_deserializer
  end
module DeleteMedicalTranscriptionJob =
  struct
    let error_deserializer tree path =
      let open Deserializers in
        let handler handler tree path =
          function
          | (_, "BadRequestException") ->
              `BadRequestException
                (bad_request_exception_of_yojson tree path)
          | (_, "InternalFailureException") ->
              `InternalFailureException
                (internal_failure_exception_of_yojson tree path)
          | (_, "LimitExceededException") ->
              `LimitExceededException
                (limit_exceeded_exception_of_yojson tree path)
          | _type -> handler tree path _type in
        Smaws_Lib.Protocols.AwsJson.(error_deserializer
                                       (handler
                                          Smaws_Lib.Protocols.AwsJson.Errors.default_handler)
                                       tree path)
    let request context (request : delete_medical_transcription_job_request)
      =
      let open Smaws_Lib.Context in
        let open Deserializers in
          let input =
            Serializers.delete_medical_transcription_job_request_to_yojson
              request in
          Smaws_Lib.Protocols.AwsJson.request
            ~shape_name:"TranscribeDeleteMedicalTranscriptionJob" ~service
            ~config:context.config ~http:context.http ~input
            ~output_deserializer:base_unit_of_yojson ~error_deserializer
  end
module DeleteMedicalVocabulary =
  struct
    let error_deserializer tree path =
      let open Deserializers in
        let handler handler tree path =
          function
          | (_, "BadRequestException") ->
              `BadRequestException
                (bad_request_exception_of_yojson tree path)
          | (_, "InternalFailureException") ->
              `InternalFailureException
                (internal_failure_exception_of_yojson tree path)
          | (_, "LimitExceededException") ->
              `LimitExceededException
                (limit_exceeded_exception_of_yojson tree path)
          | (_, "NotFoundException") ->
              `NotFoundException (not_found_exception_of_yojson tree path)
          | _type -> handler tree path _type in
        Smaws_Lib.Protocols.AwsJson.(error_deserializer
                                       (handler
                                          Smaws_Lib.Protocols.AwsJson.Errors.default_handler)
                                       tree path)
    let request context (request : delete_medical_vocabulary_request) =
      let open Smaws_Lib.Context in
        let open Deserializers in
          let input =
            Serializers.delete_medical_vocabulary_request_to_yojson request in
          Smaws_Lib.Protocols.AwsJson.request
            ~shape_name:"TranscribeDeleteMedicalVocabulary" ~service
            ~config:context.config ~http:context.http ~input
            ~output_deserializer:base_unit_of_yojson ~error_deserializer
  end
module DeleteTranscriptionJob =
  struct
    let error_deserializer tree path =
      let open Deserializers in
        let handler handler tree path =
          function
          | (_, "BadRequestException") ->
              `BadRequestException
                (bad_request_exception_of_yojson tree path)
          | (_, "InternalFailureException") ->
              `InternalFailureException
                (internal_failure_exception_of_yojson tree path)
          | (_, "LimitExceededException") ->
              `LimitExceededException
                (limit_exceeded_exception_of_yojson tree path)
          | _type -> handler tree path _type in
        Smaws_Lib.Protocols.AwsJson.(error_deserializer
                                       (handler
                                          Smaws_Lib.Protocols.AwsJson.Errors.default_handler)
                                       tree path)
    let request context (request : delete_transcription_job_request) =
      let open Smaws_Lib.Context in
        let open Deserializers in
          let input =
            Serializers.delete_transcription_job_request_to_yojson request in
          Smaws_Lib.Protocols.AwsJson.request
            ~shape_name:"TranscribeDeleteTranscriptionJob" ~service
            ~config:context.config ~http:context.http ~input
            ~output_deserializer:base_unit_of_yojson ~error_deserializer
  end
module DeleteVocabulary =
  struct
    let error_deserializer tree path =
      let open Deserializers in
        let handler handler tree path =
          function
          | (_, "BadRequestException") ->
              `BadRequestException
                (bad_request_exception_of_yojson tree path)
          | (_, "InternalFailureException") ->
              `InternalFailureException
                (internal_failure_exception_of_yojson tree path)
          | (_, "LimitExceededException") ->
              `LimitExceededException
                (limit_exceeded_exception_of_yojson tree path)
          | (_, "NotFoundException") ->
              `NotFoundException (not_found_exception_of_yojson tree path)
          | _type -> handler tree path _type in
        Smaws_Lib.Protocols.AwsJson.(error_deserializer
                                       (handler
                                          Smaws_Lib.Protocols.AwsJson.Errors.default_handler)
                                       tree path)
    let request context (request : delete_vocabulary_request) =
      let open Smaws_Lib.Context in
        let open Deserializers in
          let input = Serializers.delete_vocabulary_request_to_yojson request in
          Smaws_Lib.Protocols.AwsJson.request
            ~shape_name:"TranscribeDeleteVocabulary" ~service
            ~config:context.config ~http:context.http ~input
            ~output_deserializer:base_unit_of_yojson ~error_deserializer
  end
module DeleteVocabularyFilter =
  struct
    let error_deserializer tree path =
      let open Deserializers in
        let handler handler tree path =
          function
          | (_, "BadRequestException") ->
              `BadRequestException
                (bad_request_exception_of_yojson tree path)
          | (_, "InternalFailureException") ->
              `InternalFailureException
                (internal_failure_exception_of_yojson tree path)
          | (_, "LimitExceededException") ->
              `LimitExceededException
                (limit_exceeded_exception_of_yojson tree path)
          | (_, "NotFoundException") ->
              `NotFoundException (not_found_exception_of_yojson tree path)
          | _type -> handler tree path _type in
        Smaws_Lib.Protocols.AwsJson.(error_deserializer
                                       (handler
                                          Smaws_Lib.Protocols.AwsJson.Errors.default_handler)
                                       tree path)
    let request context (request : delete_vocabulary_filter_request) =
      let open Smaws_Lib.Context in
        let open Deserializers in
          let input =
            Serializers.delete_vocabulary_filter_request_to_yojson request in
          Smaws_Lib.Protocols.AwsJson.request
            ~shape_name:"TranscribeDeleteVocabularyFilter" ~service
            ~config:context.config ~http:context.http ~input
            ~output_deserializer:base_unit_of_yojson ~error_deserializer
  end
module DescribeLanguageModel =
  struct
    let error_deserializer tree path =
      let open Deserializers in
        let handler handler tree path =
          function
          | (_, "BadRequestException") ->
              `BadRequestException
                (bad_request_exception_of_yojson tree path)
          | (_, "InternalFailureException") ->
              `InternalFailureException
                (internal_failure_exception_of_yojson tree path)
          | (_, "LimitExceededException") ->
              `LimitExceededException
                (limit_exceeded_exception_of_yojson tree path)
          | (_, "NotFoundException") ->
              `NotFoundException (not_found_exception_of_yojson tree path)
          | _type -> handler tree path _type in
        Smaws_Lib.Protocols.AwsJson.(error_deserializer
                                       (handler
                                          Smaws_Lib.Protocols.AwsJson.Errors.default_handler)
                                       tree path)
    let request context (request : describe_language_model_request) =
      let open Smaws_Lib.Context in
        let open Deserializers in
          let input =
            Serializers.describe_language_model_request_to_yojson request in
          Smaws_Lib.Protocols.AwsJson.request
            ~shape_name:"TranscribeDescribeLanguageModel" ~service
            ~config:context.config ~http:context.http ~input
            ~output_deserializer:describe_language_model_response_of_yojson
            ~error_deserializer
  end
module GetCallAnalyticsCategory =
  struct
    let error_deserializer tree path =
      let open Deserializers in
        let handler handler tree path =
          function
          | (_, "BadRequestException") ->
              `BadRequestException
                (bad_request_exception_of_yojson tree path)
          | (_, "InternalFailureException") ->
              `InternalFailureException
                (internal_failure_exception_of_yojson tree path)
          | (_, "LimitExceededException") ->
              `LimitExceededException
                (limit_exceeded_exception_of_yojson tree path)
          | (_, "NotFoundException") ->
              `NotFoundException (not_found_exception_of_yojson tree path)
          | _type -> handler tree path _type in
        Smaws_Lib.Protocols.AwsJson.(error_deserializer
                                       (handler
                                          Smaws_Lib.Protocols.AwsJson.Errors.default_handler)
                                       tree path)
    let request context (request : get_call_analytics_category_request) =
      let open Smaws_Lib.Context in
        let open Deserializers in
          let input =
            Serializers.get_call_analytics_category_request_to_yojson request in
          Smaws_Lib.Protocols.AwsJson.request
            ~shape_name:"TranscribeGetCallAnalyticsCategory" ~service
            ~config:context.config ~http:context.http ~input
            ~output_deserializer:get_call_analytics_category_response_of_yojson
            ~error_deserializer
  end
module GetCallAnalyticsJob =
  struct
    let error_deserializer tree path =
      let open Deserializers in
        let handler handler tree path =
          function
          | (_, "BadRequestException") ->
              `BadRequestException
                (bad_request_exception_of_yojson tree path)
          | (_, "InternalFailureException") ->
              `InternalFailureException
                (internal_failure_exception_of_yojson tree path)
          | (_, "LimitExceededException") ->
              `LimitExceededException
                (limit_exceeded_exception_of_yojson tree path)
          | (_, "NotFoundException") ->
              `NotFoundException (not_found_exception_of_yojson tree path)
          | _type -> handler tree path _type in
        Smaws_Lib.Protocols.AwsJson.(error_deserializer
                                       (handler
                                          Smaws_Lib.Protocols.AwsJson.Errors.default_handler)
                                       tree path)
    let request context (request : get_call_analytics_job_request) =
      let open Smaws_Lib.Context in
        let open Deserializers in
          let input =
            Serializers.get_call_analytics_job_request_to_yojson request in
          Smaws_Lib.Protocols.AwsJson.request
            ~shape_name:"TranscribeGetCallAnalyticsJob" ~service
            ~config:context.config ~http:context.http ~input
            ~output_deserializer:get_call_analytics_job_response_of_yojson
            ~error_deserializer
  end
module GetMedicalScribeJob =
  struct
    let error_deserializer tree path =
      let open Deserializers in
        let handler handler tree path =
          function
          | (_, "BadRequestException") ->
              `BadRequestException
                (bad_request_exception_of_yojson tree path)
          | (_, "InternalFailureException") ->
              `InternalFailureException
                (internal_failure_exception_of_yojson tree path)
          | (_, "LimitExceededException") ->
              `LimitExceededException
                (limit_exceeded_exception_of_yojson tree path)
          | (_, "NotFoundException") ->
              `NotFoundException (not_found_exception_of_yojson tree path)
          | _type -> handler tree path _type in
        Smaws_Lib.Protocols.AwsJson.(error_deserializer
                                       (handler
                                          Smaws_Lib.Protocols.AwsJson.Errors.default_handler)
                                       tree path)
    let request context (request : get_medical_scribe_job_request) =
      let open Smaws_Lib.Context in
        let open Deserializers in
          let input =
            Serializers.get_medical_scribe_job_request_to_yojson request in
          Smaws_Lib.Protocols.AwsJson.request
            ~shape_name:"TranscribeGetMedicalScribeJob" ~service
            ~config:context.config ~http:context.http ~input
            ~output_deserializer:get_medical_scribe_job_response_of_yojson
            ~error_deserializer
  end
module GetMedicalTranscriptionJob =
  struct
    let error_deserializer tree path =
      let open Deserializers in
        let handler handler tree path =
          function
          | (_, "BadRequestException") ->
              `BadRequestException
                (bad_request_exception_of_yojson tree path)
          | (_, "InternalFailureException") ->
              `InternalFailureException
                (internal_failure_exception_of_yojson tree path)
          | (_, "LimitExceededException") ->
              `LimitExceededException
                (limit_exceeded_exception_of_yojson tree path)
          | (_, "NotFoundException") ->
              `NotFoundException (not_found_exception_of_yojson tree path)
          | _type -> handler tree path _type in
        Smaws_Lib.Protocols.AwsJson.(error_deserializer
                                       (handler
                                          Smaws_Lib.Protocols.AwsJson.Errors.default_handler)
                                       tree path)
    let request context (request : get_medical_transcription_job_request) =
      let open Smaws_Lib.Context in
        let open Deserializers in
          let input =
            Serializers.get_medical_transcription_job_request_to_yojson
              request in
          Smaws_Lib.Protocols.AwsJson.request
            ~shape_name:"TranscribeGetMedicalTranscriptionJob" ~service
            ~config:context.config ~http:context.http ~input
            ~output_deserializer:get_medical_transcription_job_response_of_yojson
            ~error_deserializer
  end
module GetMedicalVocabulary =
  struct
    let error_deserializer tree path =
      let open Deserializers in
        let handler handler tree path =
          function
          | (_, "BadRequestException") ->
              `BadRequestException
                (bad_request_exception_of_yojson tree path)
          | (_, "InternalFailureException") ->
              `InternalFailureException
                (internal_failure_exception_of_yojson tree path)
          | (_, "LimitExceededException") ->
              `LimitExceededException
                (limit_exceeded_exception_of_yojson tree path)
          | (_, "NotFoundException") ->
              `NotFoundException (not_found_exception_of_yojson tree path)
          | _type -> handler tree path _type in
        Smaws_Lib.Protocols.AwsJson.(error_deserializer
                                       (handler
                                          Smaws_Lib.Protocols.AwsJson.Errors.default_handler)
                                       tree path)
    let request context (request : get_medical_vocabulary_request) =
      let open Smaws_Lib.Context in
        let open Deserializers in
          let input =
            Serializers.get_medical_vocabulary_request_to_yojson request in
          Smaws_Lib.Protocols.AwsJson.request
            ~shape_name:"TranscribeGetMedicalVocabulary" ~service
            ~config:context.config ~http:context.http ~input
            ~output_deserializer:get_medical_vocabulary_response_of_yojson
            ~error_deserializer
  end
module GetTranscriptionJob =
  struct
    let error_deserializer tree path =
      let open Deserializers in
        let handler handler tree path =
          function
          | (_, "BadRequestException") ->
              `BadRequestException
                (bad_request_exception_of_yojson tree path)
          | (_, "InternalFailureException") ->
              `InternalFailureException
                (internal_failure_exception_of_yojson tree path)
          | (_, "LimitExceededException") ->
              `LimitExceededException
                (limit_exceeded_exception_of_yojson tree path)
          | (_, "NotFoundException") ->
              `NotFoundException (not_found_exception_of_yojson tree path)
          | _type -> handler tree path _type in
        Smaws_Lib.Protocols.AwsJson.(error_deserializer
                                       (handler
                                          Smaws_Lib.Protocols.AwsJson.Errors.default_handler)
                                       tree path)
    let request context (request : get_transcription_job_request) =
      let open Smaws_Lib.Context in
        let open Deserializers in
          let input =
            Serializers.get_transcription_job_request_to_yojson request in
          Smaws_Lib.Protocols.AwsJson.request
            ~shape_name:"TranscribeGetTranscriptionJob" ~service
            ~config:context.config ~http:context.http ~input
            ~output_deserializer:get_transcription_job_response_of_yojson
            ~error_deserializer
  end
module GetVocabulary =
  struct
    let error_deserializer tree path =
      let open Deserializers in
        let handler handler tree path =
          function
          | (_, "BadRequestException") ->
              `BadRequestException
                (bad_request_exception_of_yojson tree path)
          | (_, "InternalFailureException") ->
              `InternalFailureException
                (internal_failure_exception_of_yojson tree path)
          | (_, "LimitExceededException") ->
              `LimitExceededException
                (limit_exceeded_exception_of_yojson tree path)
          | (_, "NotFoundException") ->
              `NotFoundException (not_found_exception_of_yojson tree path)
          | _type -> handler tree path _type in
        Smaws_Lib.Protocols.AwsJson.(error_deserializer
                                       (handler
                                          Smaws_Lib.Protocols.AwsJson.Errors.default_handler)
                                       tree path)
    let request context (request : get_vocabulary_request) =
      let open Smaws_Lib.Context in
        let open Deserializers in
          let input = Serializers.get_vocabulary_request_to_yojson request in
          Smaws_Lib.Protocols.AwsJson.request
            ~shape_name:"TranscribeGetVocabulary" ~service
            ~config:context.config ~http:context.http ~input
            ~output_deserializer:get_vocabulary_response_of_yojson
            ~error_deserializer
  end
module GetVocabularyFilter =
  struct
    let error_deserializer tree path =
      let open Deserializers in
        let handler handler tree path =
          function
          | (_, "BadRequestException") ->
              `BadRequestException
                (bad_request_exception_of_yojson tree path)
          | (_, "InternalFailureException") ->
              `InternalFailureException
                (internal_failure_exception_of_yojson tree path)
          | (_, "LimitExceededException") ->
              `LimitExceededException
                (limit_exceeded_exception_of_yojson tree path)
          | (_, "NotFoundException") ->
              `NotFoundException (not_found_exception_of_yojson tree path)
          | _type -> handler tree path _type in
        Smaws_Lib.Protocols.AwsJson.(error_deserializer
                                       (handler
                                          Smaws_Lib.Protocols.AwsJson.Errors.default_handler)
                                       tree path)
    let request context (request : get_vocabulary_filter_request) =
      let open Smaws_Lib.Context in
        let open Deserializers in
          let input =
            Serializers.get_vocabulary_filter_request_to_yojson request in
          Smaws_Lib.Protocols.AwsJson.request
            ~shape_name:"TranscribeGetVocabularyFilter" ~service
            ~config:context.config ~http:context.http ~input
            ~output_deserializer:get_vocabulary_filter_response_of_yojson
            ~error_deserializer
  end
module ListCallAnalyticsCategories =
  struct
    let error_deserializer tree path =
      let open Deserializers in
        let handler handler tree path =
          function
          | (_, "BadRequestException") ->
              `BadRequestException
                (bad_request_exception_of_yojson tree path)
          | (_, "InternalFailureException") ->
              `InternalFailureException
                (internal_failure_exception_of_yojson tree path)
          | (_, "LimitExceededException") ->
              `LimitExceededException
                (limit_exceeded_exception_of_yojson tree path)
          | _type -> handler tree path _type in
        Smaws_Lib.Protocols.AwsJson.(error_deserializer
                                       (handler
                                          Smaws_Lib.Protocols.AwsJson.Errors.default_handler)
                                       tree path)
    let request context (request : list_call_analytics_categories_request) =
      let open Smaws_Lib.Context in
        let open Deserializers in
          let input =
            Serializers.list_call_analytics_categories_request_to_yojson
              request in
          Smaws_Lib.Protocols.AwsJson.request
            ~shape_name:"TranscribeListCallAnalyticsCategories" ~service
            ~config:context.config ~http:context.http ~input
            ~output_deserializer:list_call_analytics_categories_response_of_yojson
            ~error_deserializer
  end
module ListCallAnalyticsJobs =
  struct
    let error_deserializer tree path =
      let open Deserializers in
        let handler handler tree path =
          function
          | (_, "BadRequestException") ->
              `BadRequestException
                (bad_request_exception_of_yojson tree path)
          | (_, "InternalFailureException") ->
              `InternalFailureException
                (internal_failure_exception_of_yojson tree path)
          | (_, "LimitExceededException") ->
              `LimitExceededException
                (limit_exceeded_exception_of_yojson tree path)
          | _type -> handler tree path _type in
        Smaws_Lib.Protocols.AwsJson.(error_deserializer
                                       (handler
                                          Smaws_Lib.Protocols.AwsJson.Errors.default_handler)
                                       tree path)
    let request context (request : list_call_analytics_jobs_request) =
      let open Smaws_Lib.Context in
        let open Deserializers in
          let input =
            Serializers.list_call_analytics_jobs_request_to_yojson request in
          Smaws_Lib.Protocols.AwsJson.request
            ~shape_name:"TranscribeListCallAnalyticsJobs" ~service
            ~config:context.config ~http:context.http ~input
            ~output_deserializer:list_call_analytics_jobs_response_of_yojson
            ~error_deserializer
  end
module ListLanguageModels =
  struct
    let error_deserializer tree path =
      let open Deserializers in
        let handler handler tree path =
          function
          | (_, "BadRequestException") ->
              `BadRequestException
                (bad_request_exception_of_yojson tree path)
          | (_, "InternalFailureException") ->
              `InternalFailureException
                (internal_failure_exception_of_yojson tree path)
          | (_, "LimitExceededException") ->
              `LimitExceededException
                (limit_exceeded_exception_of_yojson tree path)
          | _type -> handler tree path _type in
        Smaws_Lib.Protocols.AwsJson.(error_deserializer
                                       (handler
                                          Smaws_Lib.Protocols.AwsJson.Errors.default_handler)
                                       tree path)
    let request context (request : list_language_models_request) =
      let open Smaws_Lib.Context in
        let open Deserializers in
          let input =
            Serializers.list_language_models_request_to_yojson request in
          Smaws_Lib.Protocols.AwsJson.request
            ~shape_name:"TranscribeListLanguageModels" ~service
            ~config:context.config ~http:context.http ~input
            ~output_deserializer:list_language_models_response_of_yojson
            ~error_deserializer
  end
module ListMedicalScribeJobs =
  struct
    let error_deserializer tree path =
      let open Deserializers in
        let handler handler tree path =
          function
          | (_, "BadRequestException") ->
              `BadRequestException
                (bad_request_exception_of_yojson tree path)
          | (_, "InternalFailureException") ->
              `InternalFailureException
                (internal_failure_exception_of_yojson tree path)
          | (_, "LimitExceededException") ->
              `LimitExceededException
                (limit_exceeded_exception_of_yojson tree path)
          | _type -> handler tree path _type in
        Smaws_Lib.Protocols.AwsJson.(error_deserializer
                                       (handler
                                          Smaws_Lib.Protocols.AwsJson.Errors.default_handler)
                                       tree path)
    let request context (request : list_medical_scribe_jobs_request) =
      let open Smaws_Lib.Context in
        let open Deserializers in
          let input =
            Serializers.list_medical_scribe_jobs_request_to_yojson request in
          Smaws_Lib.Protocols.AwsJson.request
            ~shape_name:"TranscribeListMedicalScribeJobs" ~service
            ~config:context.config ~http:context.http ~input
            ~output_deserializer:list_medical_scribe_jobs_response_of_yojson
            ~error_deserializer
  end
module ListMedicalTranscriptionJobs =
  struct
    let error_deserializer tree path =
      let open Deserializers in
        let handler handler tree path =
          function
          | (_, "BadRequestException") ->
              `BadRequestException
                (bad_request_exception_of_yojson tree path)
          | (_, "InternalFailureException") ->
              `InternalFailureException
                (internal_failure_exception_of_yojson tree path)
          | (_, "LimitExceededException") ->
              `LimitExceededException
                (limit_exceeded_exception_of_yojson tree path)
          | _type -> handler tree path _type in
        Smaws_Lib.Protocols.AwsJson.(error_deserializer
                                       (handler
                                          Smaws_Lib.Protocols.AwsJson.Errors.default_handler)
                                       tree path)
    let request context (request : list_medical_transcription_jobs_request) =
      let open Smaws_Lib.Context in
        let open Deserializers in
          let input =
            Serializers.list_medical_transcription_jobs_request_to_yojson
              request in
          Smaws_Lib.Protocols.AwsJson.request
            ~shape_name:"TranscribeListMedicalTranscriptionJobs" ~service
            ~config:context.config ~http:context.http ~input
            ~output_deserializer:list_medical_transcription_jobs_response_of_yojson
            ~error_deserializer
  end
module ListMedicalVocabularies =
  struct
    let error_deserializer tree path =
      let open Deserializers in
        let handler handler tree path =
          function
          | (_, "BadRequestException") ->
              `BadRequestException
                (bad_request_exception_of_yojson tree path)
          | (_, "InternalFailureException") ->
              `InternalFailureException
                (internal_failure_exception_of_yojson tree path)
          | (_, "LimitExceededException") ->
              `LimitExceededException
                (limit_exceeded_exception_of_yojson tree path)
          | _type -> handler tree path _type in
        Smaws_Lib.Protocols.AwsJson.(error_deserializer
                                       (handler
                                          Smaws_Lib.Protocols.AwsJson.Errors.default_handler)
                                       tree path)
    let request context (request : list_medical_vocabularies_request) =
      let open Smaws_Lib.Context in
        let open Deserializers in
          let input =
            Serializers.list_medical_vocabularies_request_to_yojson request in
          Smaws_Lib.Protocols.AwsJson.request
            ~shape_name:"TranscribeListMedicalVocabularies" ~service
            ~config:context.config ~http:context.http ~input
            ~output_deserializer:list_medical_vocabularies_response_of_yojson
            ~error_deserializer
  end
module ListTagsForResource =
  struct
    let error_deserializer tree path =
      let open Deserializers in
        let handler handler tree path =
          function
          | (_, "BadRequestException") ->
              `BadRequestException
                (bad_request_exception_of_yojson tree path)
          | (_, "InternalFailureException") ->
              `InternalFailureException
                (internal_failure_exception_of_yojson tree path)
          | (_, "LimitExceededException") ->
              `LimitExceededException
                (limit_exceeded_exception_of_yojson tree path)
          | (_, "NotFoundException") ->
              `NotFoundException (not_found_exception_of_yojson tree path)
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
            ~shape_name:"TranscribeListTagsForResource" ~service
            ~config:context.config ~http:context.http ~input
            ~output_deserializer:list_tags_for_resource_response_of_yojson
            ~error_deserializer
  end
module ListTranscriptionJobs =
  struct
    let error_deserializer tree path =
      let open Deserializers in
        let handler handler tree path =
          function
          | (_, "BadRequestException") ->
              `BadRequestException
                (bad_request_exception_of_yojson tree path)
          | (_, "InternalFailureException") ->
              `InternalFailureException
                (internal_failure_exception_of_yojson tree path)
          | (_, "LimitExceededException") ->
              `LimitExceededException
                (limit_exceeded_exception_of_yojson tree path)
          | _type -> handler tree path _type in
        Smaws_Lib.Protocols.AwsJson.(error_deserializer
                                       (handler
                                          Smaws_Lib.Protocols.AwsJson.Errors.default_handler)
                                       tree path)
    let request context (request : list_transcription_jobs_request) =
      let open Smaws_Lib.Context in
        let open Deserializers in
          let input =
            Serializers.list_transcription_jobs_request_to_yojson request in
          Smaws_Lib.Protocols.AwsJson.request
            ~shape_name:"TranscribeListTranscriptionJobs" ~service
            ~config:context.config ~http:context.http ~input
            ~output_deserializer:list_transcription_jobs_response_of_yojson
            ~error_deserializer
  end
module ListVocabularies =
  struct
    let error_deserializer tree path =
      let open Deserializers in
        let handler handler tree path =
          function
          | (_, "BadRequestException") ->
              `BadRequestException
                (bad_request_exception_of_yojson tree path)
          | (_, "InternalFailureException") ->
              `InternalFailureException
                (internal_failure_exception_of_yojson tree path)
          | (_, "LimitExceededException") ->
              `LimitExceededException
                (limit_exceeded_exception_of_yojson tree path)
          | _type -> handler tree path _type in
        Smaws_Lib.Protocols.AwsJson.(error_deserializer
                                       (handler
                                          Smaws_Lib.Protocols.AwsJson.Errors.default_handler)
                                       tree path)
    let request context (request : list_vocabularies_request) =
      let open Smaws_Lib.Context in
        let open Deserializers in
          let input = Serializers.list_vocabularies_request_to_yojson request in
          Smaws_Lib.Protocols.AwsJson.request
            ~shape_name:"TranscribeListVocabularies" ~service
            ~config:context.config ~http:context.http ~input
            ~output_deserializer:list_vocabularies_response_of_yojson
            ~error_deserializer
  end
module ListVocabularyFilters =
  struct
    let error_deserializer tree path =
      let open Deserializers in
        let handler handler tree path =
          function
          | (_, "BadRequestException") ->
              `BadRequestException
                (bad_request_exception_of_yojson tree path)
          | (_, "InternalFailureException") ->
              `InternalFailureException
                (internal_failure_exception_of_yojson tree path)
          | (_, "LimitExceededException") ->
              `LimitExceededException
                (limit_exceeded_exception_of_yojson tree path)
          | _type -> handler tree path _type in
        Smaws_Lib.Protocols.AwsJson.(error_deserializer
                                       (handler
                                          Smaws_Lib.Protocols.AwsJson.Errors.default_handler)
                                       tree path)
    let request context (request : list_vocabulary_filters_request) =
      let open Smaws_Lib.Context in
        let open Deserializers in
          let input =
            Serializers.list_vocabulary_filters_request_to_yojson request in
          Smaws_Lib.Protocols.AwsJson.request
            ~shape_name:"TranscribeListVocabularyFilters" ~service
            ~config:context.config ~http:context.http ~input
            ~output_deserializer:list_vocabulary_filters_response_of_yojson
            ~error_deserializer
  end
module StartCallAnalyticsJob =
  struct
    let error_deserializer tree path =
      let open Deserializers in
        let handler handler tree path =
          function
          | (_, "BadRequestException") ->
              `BadRequestException
                (bad_request_exception_of_yojson tree path)
          | (_, "ConflictException") ->
              `ConflictException (conflict_exception_of_yojson tree path)
          | (_, "InternalFailureException") ->
              `InternalFailureException
                (internal_failure_exception_of_yojson tree path)
          | (_, "LimitExceededException") ->
              `LimitExceededException
                (limit_exceeded_exception_of_yojson tree path)
          | _type -> handler tree path _type in
        Smaws_Lib.Protocols.AwsJson.(error_deserializer
                                       (handler
                                          Smaws_Lib.Protocols.AwsJson.Errors.default_handler)
                                       tree path)
    let request context (request : start_call_analytics_job_request) =
      let open Smaws_Lib.Context in
        let open Deserializers in
          let input =
            Serializers.start_call_analytics_job_request_to_yojson request in
          Smaws_Lib.Protocols.AwsJson.request
            ~shape_name:"TranscribeStartCallAnalyticsJob" ~service
            ~config:context.config ~http:context.http ~input
            ~output_deserializer:start_call_analytics_job_response_of_yojson
            ~error_deserializer
  end
module StartMedicalScribeJob =
  struct
    let error_deserializer tree path =
      let open Deserializers in
        let handler handler tree path =
          function
          | (_, "BadRequestException") ->
              `BadRequestException
                (bad_request_exception_of_yojson tree path)
          | (_, "ConflictException") ->
              `ConflictException (conflict_exception_of_yojson tree path)
          | (_, "InternalFailureException") ->
              `InternalFailureException
                (internal_failure_exception_of_yojson tree path)
          | (_, "LimitExceededException") ->
              `LimitExceededException
                (limit_exceeded_exception_of_yojson tree path)
          | _type -> handler tree path _type in
        Smaws_Lib.Protocols.AwsJson.(error_deserializer
                                       (handler
                                          Smaws_Lib.Protocols.AwsJson.Errors.default_handler)
                                       tree path)
    let request context (request : start_medical_scribe_job_request) =
      let open Smaws_Lib.Context in
        let open Deserializers in
          let input =
            Serializers.start_medical_scribe_job_request_to_yojson request in
          Smaws_Lib.Protocols.AwsJson.request
            ~shape_name:"TranscribeStartMedicalScribeJob" ~service
            ~config:context.config ~http:context.http ~input
            ~output_deserializer:start_medical_scribe_job_response_of_yojson
            ~error_deserializer
  end
module StartMedicalTranscriptionJob =
  struct
    let error_deserializer tree path =
      let open Deserializers in
        let handler handler tree path =
          function
          | (_, "BadRequestException") ->
              `BadRequestException
                (bad_request_exception_of_yojson tree path)
          | (_, "ConflictException") ->
              `ConflictException (conflict_exception_of_yojson tree path)
          | (_, "InternalFailureException") ->
              `InternalFailureException
                (internal_failure_exception_of_yojson tree path)
          | (_, "LimitExceededException") ->
              `LimitExceededException
                (limit_exceeded_exception_of_yojson tree path)
          | _type -> handler tree path _type in
        Smaws_Lib.Protocols.AwsJson.(error_deserializer
                                       (handler
                                          Smaws_Lib.Protocols.AwsJson.Errors.default_handler)
                                       tree path)
    let request context (request : start_medical_transcription_job_request) =
      let open Smaws_Lib.Context in
        let open Deserializers in
          let input =
            Serializers.start_medical_transcription_job_request_to_yojson
              request in
          Smaws_Lib.Protocols.AwsJson.request
            ~shape_name:"TranscribeStartMedicalTranscriptionJob" ~service
            ~config:context.config ~http:context.http ~input
            ~output_deserializer:start_medical_transcription_job_response_of_yojson
            ~error_deserializer
  end
module StartTranscriptionJob =
  struct
    let error_deserializer tree path =
      let open Deserializers in
        let handler handler tree path =
          function
          | (_, "BadRequestException") ->
              `BadRequestException
                (bad_request_exception_of_yojson tree path)
          | (_, "ConflictException") ->
              `ConflictException (conflict_exception_of_yojson tree path)
          | (_, "InternalFailureException") ->
              `InternalFailureException
                (internal_failure_exception_of_yojson tree path)
          | (_, "LimitExceededException") ->
              `LimitExceededException
                (limit_exceeded_exception_of_yojson tree path)
          | _type -> handler tree path _type in
        Smaws_Lib.Protocols.AwsJson.(error_deserializer
                                       (handler
                                          Smaws_Lib.Protocols.AwsJson.Errors.default_handler)
                                       tree path)
    let request context (request : start_transcription_job_request) =
      let open Smaws_Lib.Context in
        let open Deserializers in
          let input =
            Serializers.start_transcription_job_request_to_yojson request in
          Smaws_Lib.Protocols.AwsJson.request
            ~shape_name:"TranscribeStartTranscriptionJob" ~service
            ~config:context.config ~http:context.http ~input
            ~output_deserializer:start_transcription_job_response_of_yojson
            ~error_deserializer
  end
module TagResource =
  struct
    let error_deserializer tree path =
      let open Deserializers in
        let handler handler tree path =
          function
          | (_, "BadRequestException") ->
              `BadRequestException
                (bad_request_exception_of_yojson tree path)
          | (_, "ConflictException") ->
              `ConflictException (conflict_exception_of_yojson tree path)
          | (_, "InternalFailureException") ->
              `InternalFailureException
                (internal_failure_exception_of_yojson tree path)
          | (_, "LimitExceededException") ->
              `LimitExceededException
                (limit_exceeded_exception_of_yojson tree path)
          | (_, "NotFoundException") ->
              `NotFoundException (not_found_exception_of_yojson tree path)
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
            ~shape_name:"TranscribeTagResource" ~service
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
          | (_, "BadRequestException") ->
              `BadRequestException
                (bad_request_exception_of_yojson tree path)
          | (_, "ConflictException") ->
              `ConflictException (conflict_exception_of_yojson tree path)
          | (_, "InternalFailureException") ->
              `InternalFailureException
                (internal_failure_exception_of_yojson tree path)
          | (_, "LimitExceededException") ->
              `LimitExceededException
                (limit_exceeded_exception_of_yojson tree path)
          | (_, "NotFoundException") ->
              `NotFoundException (not_found_exception_of_yojson tree path)
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
            ~shape_name:"TranscribeUntagResource" ~service
            ~config:context.config ~http:context.http ~input
            ~output_deserializer:untag_resource_response_of_yojson
            ~error_deserializer
  end
module UpdateCallAnalyticsCategory =
  struct
    let error_deserializer tree path =
      let open Deserializers in
        let handler handler tree path =
          function
          | (_, "BadRequestException") ->
              `BadRequestException
                (bad_request_exception_of_yojson tree path)
          | (_, "ConflictException") ->
              `ConflictException (conflict_exception_of_yojson tree path)
          | (_, "InternalFailureException") ->
              `InternalFailureException
                (internal_failure_exception_of_yojson tree path)
          | (_, "LimitExceededException") ->
              `LimitExceededException
                (limit_exceeded_exception_of_yojson tree path)
          | (_, "NotFoundException") ->
              `NotFoundException (not_found_exception_of_yojson tree path)
          | _type -> handler tree path _type in
        Smaws_Lib.Protocols.AwsJson.(error_deserializer
                                       (handler
                                          Smaws_Lib.Protocols.AwsJson.Errors.default_handler)
                                       tree path)
    let request context (request : update_call_analytics_category_request) =
      let open Smaws_Lib.Context in
        let open Deserializers in
          let input =
            Serializers.update_call_analytics_category_request_to_yojson
              request in
          Smaws_Lib.Protocols.AwsJson.request
            ~shape_name:"TranscribeUpdateCallAnalyticsCategory" ~service
            ~config:context.config ~http:context.http ~input
            ~output_deserializer:update_call_analytics_category_response_of_yojson
            ~error_deserializer
  end
module UpdateMedicalVocabulary =
  struct
    let error_deserializer tree path =
      let open Deserializers in
        let handler handler tree path =
          function
          | (_, "BadRequestException") ->
              `BadRequestException
                (bad_request_exception_of_yojson tree path)
          | (_, "ConflictException") ->
              `ConflictException (conflict_exception_of_yojson tree path)
          | (_, "InternalFailureException") ->
              `InternalFailureException
                (internal_failure_exception_of_yojson tree path)
          | (_, "LimitExceededException") ->
              `LimitExceededException
                (limit_exceeded_exception_of_yojson tree path)
          | (_, "NotFoundException") ->
              `NotFoundException (not_found_exception_of_yojson tree path)
          | _type -> handler tree path _type in
        Smaws_Lib.Protocols.AwsJson.(error_deserializer
                                       (handler
                                          Smaws_Lib.Protocols.AwsJson.Errors.default_handler)
                                       tree path)
    let request context (request : update_medical_vocabulary_request) =
      let open Smaws_Lib.Context in
        let open Deserializers in
          let input =
            Serializers.update_medical_vocabulary_request_to_yojson request in
          Smaws_Lib.Protocols.AwsJson.request
            ~shape_name:"TranscribeUpdateMedicalVocabulary" ~service
            ~config:context.config ~http:context.http ~input
            ~output_deserializer:update_medical_vocabulary_response_of_yojson
            ~error_deserializer
  end
module UpdateVocabulary =
  struct
    let error_deserializer tree path =
      let open Deserializers in
        let handler handler tree path =
          function
          | (_, "BadRequestException") ->
              `BadRequestException
                (bad_request_exception_of_yojson tree path)
          | (_, "ConflictException") ->
              `ConflictException (conflict_exception_of_yojson tree path)
          | (_, "InternalFailureException") ->
              `InternalFailureException
                (internal_failure_exception_of_yojson tree path)
          | (_, "LimitExceededException") ->
              `LimitExceededException
                (limit_exceeded_exception_of_yojson tree path)
          | (_, "NotFoundException") ->
              `NotFoundException (not_found_exception_of_yojson tree path)
          | _type -> handler tree path _type in
        Smaws_Lib.Protocols.AwsJson.(error_deserializer
                                       (handler
                                          Smaws_Lib.Protocols.AwsJson.Errors.default_handler)
                                       tree path)
    let request context (request : update_vocabulary_request) =
      let open Smaws_Lib.Context in
        let open Deserializers in
          let input = Serializers.update_vocabulary_request_to_yojson request in
          Smaws_Lib.Protocols.AwsJson.request
            ~shape_name:"TranscribeUpdateVocabulary" ~service
            ~config:context.config ~http:context.http ~input
            ~output_deserializer:update_vocabulary_response_of_yojson
            ~error_deserializer
  end
module UpdateVocabularyFilter =
  struct
    let error_deserializer tree path =
      let open Deserializers in
        let handler handler tree path =
          function
          | (_, "BadRequestException") ->
              `BadRequestException
                (bad_request_exception_of_yojson tree path)
          | (_, "InternalFailureException") ->
              `InternalFailureException
                (internal_failure_exception_of_yojson tree path)
          | (_, "LimitExceededException") ->
              `LimitExceededException
                (limit_exceeded_exception_of_yojson tree path)
          | (_, "NotFoundException") ->
              `NotFoundException (not_found_exception_of_yojson tree path)
          | _type -> handler tree path _type in
        Smaws_Lib.Protocols.AwsJson.(error_deserializer
                                       (handler
                                          Smaws_Lib.Protocols.AwsJson.Errors.default_handler)
                                       tree path)
    let request context (request : update_vocabulary_filter_request) =
      let open Smaws_Lib.Context in
        let open Deserializers in
          let input =
            Serializers.update_vocabulary_filter_request_to_yojson request in
          Smaws_Lib.Protocols.AwsJson.request
            ~shape_name:"TranscribeUpdateVocabularyFilter" ~service
            ~config:context.config ~http:context.http ~input
            ~output_deserializer:update_vocabulary_filter_response_of_yojson
            ~error_deserializer
  end