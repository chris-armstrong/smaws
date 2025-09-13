open Types
open Service_metadata

module CreateCallAnalyticsCategory = struct
  let error_to_string = function
    | `BadRequestException _ -> "com.amazonaws.transcribe#BadRequestException"
    | `ConflictException _ -> "com.amazonaws.transcribe#ConflictException"
    | `InternalFailureException _ -> "com.amazonaws.transcribe#InternalFailureException"
    | `LimitExceededException _ -> "com.amazonaws.transcribe#LimitExceededException"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "BadRequestException" ->
          `BadRequestException (Json_deserializers.bad_request_exception_of_yojson tree path)
      | _, "ConflictException" ->
          `ConflictException (Json_deserializers.conflict_exception_of_yojson tree path)
      | _, "InternalFailureException" ->
          `InternalFailureException
            (Json_deserializers.internal_failure_exception_of_yojson tree path)
      | _, "LimitExceededException" ->
          `LimitExceededException (Json_deserializers.limit_exceeded_exception_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : create_call_analytics_category_request) =
    let input = Json_serializers.create_call_analytics_category_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"Transcribe.CreateCallAnalyticsCategory"
      ~service ~context ~input
      ~output_deserializer:Json_deserializers.create_call_analytics_category_response_of_yojson
      ~error_deserializer
end

module CreateLanguageModel = struct
  let error_to_string = function
    | `BadRequestException _ -> "com.amazonaws.transcribe#BadRequestException"
    | `ConflictException _ -> "com.amazonaws.transcribe#ConflictException"
    | `InternalFailureException _ -> "com.amazonaws.transcribe#InternalFailureException"
    | `LimitExceededException _ -> "com.amazonaws.transcribe#LimitExceededException"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "BadRequestException" ->
          `BadRequestException (Json_deserializers.bad_request_exception_of_yojson tree path)
      | _, "ConflictException" ->
          `ConflictException (Json_deserializers.conflict_exception_of_yojson tree path)
      | _, "InternalFailureException" ->
          `InternalFailureException
            (Json_deserializers.internal_failure_exception_of_yojson tree path)
      | _, "LimitExceededException" ->
          `LimitExceededException (Json_deserializers.limit_exceeded_exception_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : create_language_model_request) =
    let input = Json_serializers.create_language_model_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"Transcribe.CreateLanguageModel" ~service
      ~context ~input
      ~output_deserializer:Json_deserializers.create_language_model_response_of_yojson
      ~error_deserializer
end

module CreateMedicalVocabulary = struct
  let error_to_string = function
    | `BadRequestException _ -> "com.amazonaws.transcribe#BadRequestException"
    | `ConflictException _ -> "com.amazonaws.transcribe#ConflictException"
    | `InternalFailureException _ -> "com.amazonaws.transcribe#InternalFailureException"
    | `LimitExceededException _ -> "com.amazonaws.transcribe#LimitExceededException"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "BadRequestException" ->
          `BadRequestException (Json_deserializers.bad_request_exception_of_yojson tree path)
      | _, "ConflictException" ->
          `ConflictException (Json_deserializers.conflict_exception_of_yojson tree path)
      | _, "InternalFailureException" ->
          `InternalFailureException
            (Json_deserializers.internal_failure_exception_of_yojson tree path)
      | _, "LimitExceededException" ->
          `LimitExceededException (Json_deserializers.limit_exceeded_exception_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : create_medical_vocabulary_request) =
    let input = Json_serializers.create_medical_vocabulary_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"Transcribe.CreateMedicalVocabulary" ~service
      ~context ~input
      ~output_deserializer:Json_deserializers.create_medical_vocabulary_response_of_yojson
      ~error_deserializer
end

module CreateVocabulary = struct
  let error_to_string = function
    | `BadRequestException _ -> "com.amazonaws.transcribe#BadRequestException"
    | `ConflictException _ -> "com.amazonaws.transcribe#ConflictException"
    | `InternalFailureException _ -> "com.amazonaws.transcribe#InternalFailureException"
    | `LimitExceededException _ -> "com.amazonaws.transcribe#LimitExceededException"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "BadRequestException" ->
          `BadRequestException (Json_deserializers.bad_request_exception_of_yojson tree path)
      | _, "ConflictException" ->
          `ConflictException (Json_deserializers.conflict_exception_of_yojson tree path)
      | _, "InternalFailureException" ->
          `InternalFailureException
            (Json_deserializers.internal_failure_exception_of_yojson tree path)
      | _, "LimitExceededException" ->
          `LimitExceededException (Json_deserializers.limit_exceeded_exception_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : create_vocabulary_request) =
    let input = Json_serializers.create_vocabulary_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"Transcribe.CreateVocabulary" ~service ~context
      ~input ~output_deserializer:Json_deserializers.create_vocabulary_response_of_yojson
      ~error_deserializer
end

module CreateVocabularyFilter = struct
  let error_to_string = function
    | `BadRequestException _ -> "com.amazonaws.transcribe#BadRequestException"
    | `ConflictException _ -> "com.amazonaws.transcribe#ConflictException"
    | `InternalFailureException _ -> "com.amazonaws.transcribe#InternalFailureException"
    | `LimitExceededException _ -> "com.amazonaws.transcribe#LimitExceededException"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "BadRequestException" ->
          `BadRequestException (Json_deserializers.bad_request_exception_of_yojson tree path)
      | _, "ConflictException" ->
          `ConflictException (Json_deserializers.conflict_exception_of_yojson tree path)
      | _, "InternalFailureException" ->
          `InternalFailureException
            (Json_deserializers.internal_failure_exception_of_yojson tree path)
      | _, "LimitExceededException" ->
          `LimitExceededException (Json_deserializers.limit_exceeded_exception_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : create_vocabulary_filter_request) =
    let input = Json_serializers.create_vocabulary_filter_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"Transcribe.CreateVocabularyFilter" ~service
      ~context ~input
      ~output_deserializer:Json_deserializers.create_vocabulary_filter_response_of_yojson
      ~error_deserializer
end

module DeleteCallAnalyticsCategory = struct
  let error_to_string = function
    | `BadRequestException _ -> "com.amazonaws.transcribe#BadRequestException"
    | `InternalFailureException _ -> "com.amazonaws.transcribe#InternalFailureException"
    | `LimitExceededException _ -> "com.amazonaws.transcribe#LimitExceededException"
    | `NotFoundException _ -> "com.amazonaws.transcribe#NotFoundException"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "BadRequestException" ->
          `BadRequestException (Json_deserializers.bad_request_exception_of_yojson tree path)
      | _, "InternalFailureException" ->
          `InternalFailureException
            (Json_deserializers.internal_failure_exception_of_yojson tree path)
      | _, "LimitExceededException" ->
          `LimitExceededException (Json_deserializers.limit_exceeded_exception_of_yojson tree path)
      | _, "NotFoundException" ->
          `NotFoundException (Json_deserializers.not_found_exception_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : delete_call_analytics_category_request) =
    let input = Json_serializers.delete_call_analytics_category_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"Transcribe.DeleteCallAnalyticsCategory"
      ~service ~context ~input
      ~output_deserializer:Json_deserializers.delete_call_analytics_category_response_of_yojson
      ~error_deserializer
end

module DeleteCallAnalyticsJob = struct
  let error_to_string = function
    | `BadRequestException _ -> "com.amazonaws.transcribe#BadRequestException"
    | `InternalFailureException _ -> "com.amazonaws.transcribe#InternalFailureException"
    | `LimitExceededException _ -> "com.amazonaws.transcribe#LimitExceededException"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "BadRequestException" ->
          `BadRequestException (Json_deserializers.bad_request_exception_of_yojson tree path)
      | _, "InternalFailureException" ->
          `InternalFailureException
            (Json_deserializers.internal_failure_exception_of_yojson tree path)
      | _, "LimitExceededException" ->
          `LimitExceededException (Json_deserializers.limit_exceeded_exception_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : delete_call_analytics_job_request) =
    let input = Json_serializers.delete_call_analytics_job_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"Transcribe.DeleteCallAnalyticsJob" ~service
      ~context ~input
      ~output_deserializer:Json_deserializers.delete_call_analytics_job_response_of_yojson
      ~error_deserializer
end

module DeleteLanguageModel = struct
  let error_to_string = function
    | `BadRequestException _ -> "com.amazonaws.transcribe#BadRequestException"
    | `InternalFailureException _ -> "com.amazonaws.transcribe#InternalFailureException"
    | `LimitExceededException _ -> "com.amazonaws.transcribe#LimitExceededException"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "BadRequestException" ->
          `BadRequestException (Json_deserializers.bad_request_exception_of_yojson tree path)
      | _, "InternalFailureException" ->
          `InternalFailureException
            (Json_deserializers.internal_failure_exception_of_yojson tree path)
      | _, "LimitExceededException" ->
          `LimitExceededException (Json_deserializers.limit_exceeded_exception_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : delete_language_model_request) =
    let input = Json_serializers.delete_language_model_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"Transcribe.DeleteLanguageModel" ~service
      ~context ~input ~output_deserializer:Smaws_Lib.Smithy_api.Json_deserializers.unit__of_yojson
      ~error_deserializer
end

module DeleteMedicalScribeJob = struct
  let error_to_string = function
    | `BadRequestException _ -> "com.amazonaws.transcribe#BadRequestException"
    | `InternalFailureException _ -> "com.amazonaws.transcribe#InternalFailureException"
    | `LimitExceededException _ -> "com.amazonaws.transcribe#LimitExceededException"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "BadRequestException" ->
          `BadRequestException (Json_deserializers.bad_request_exception_of_yojson tree path)
      | _, "InternalFailureException" ->
          `InternalFailureException
            (Json_deserializers.internal_failure_exception_of_yojson tree path)
      | _, "LimitExceededException" ->
          `LimitExceededException (Json_deserializers.limit_exceeded_exception_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : delete_medical_scribe_job_request) =
    let input = Json_serializers.delete_medical_scribe_job_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"Transcribe.DeleteMedicalScribeJob" ~service
      ~context ~input ~output_deserializer:Smaws_Lib.Smithy_api.Json_deserializers.unit__of_yojson
      ~error_deserializer
end

module DeleteMedicalTranscriptionJob = struct
  let error_to_string = function
    | `BadRequestException _ -> "com.amazonaws.transcribe#BadRequestException"
    | `InternalFailureException _ -> "com.amazonaws.transcribe#InternalFailureException"
    | `LimitExceededException _ -> "com.amazonaws.transcribe#LimitExceededException"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "BadRequestException" ->
          `BadRequestException (Json_deserializers.bad_request_exception_of_yojson tree path)
      | _, "InternalFailureException" ->
          `InternalFailureException
            (Json_deserializers.internal_failure_exception_of_yojson tree path)
      | _, "LimitExceededException" ->
          `LimitExceededException (Json_deserializers.limit_exceeded_exception_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : delete_medical_transcription_job_request) =
    let input = Json_serializers.delete_medical_transcription_job_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"Transcribe.DeleteMedicalTranscriptionJob"
      ~service ~context ~input
      ~output_deserializer:Smaws_Lib.Smithy_api.Json_deserializers.unit__of_yojson
      ~error_deserializer
end

module DeleteMedicalVocabulary = struct
  let error_to_string = function
    | `BadRequestException _ -> "com.amazonaws.transcribe#BadRequestException"
    | `InternalFailureException _ -> "com.amazonaws.transcribe#InternalFailureException"
    | `LimitExceededException _ -> "com.amazonaws.transcribe#LimitExceededException"
    | `NotFoundException _ -> "com.amazonaws.transcribe#NotFoundException"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "BadRequestException" ->
          `BadRequestException (Json_deserializers.bad_request_exception_of_yojson tree path)
      | _, "InternalFailureException" ->
          `InternalFailureException
            (Json_deserializers.internal_failure_exception_of_yojson tree path)
      | _, "LimitExceededException" ->
          `LimitExceededException (Json_deserializers.limit_exceeded_exception_of_yojson tree path)
      | _, "NotFoundException" ->
          `NotFoundException (Json_deserializers.not_found_exception_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : delete_medical_vocabulary_request) =
    let input = Json_serializers.delete_medical_vocabulary_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"Transcribe.DeleteMedicalVocabulary" ~service
      ~context ~input ~output_deserializer:Smaws_Lib.Smithy_api.Json_deserializers.unit__of_yojson
      ~error_deserializer
end

module DeleteTranscriptionJob = struct
  let error_to_string = function
    | `BadRequestException _ -> "com.amazonaws.transcribe#BadRequestException"
    | `InternalFailureException _ -> "com.amazonaws.transcribe#InternalFailureException"
    | `LimitExceededException _ -> "com.amazonaws.transcribe#LimitExceededException"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "BadRequestException" ->
          `BadRequestException (Json_deserializers.bad_request_exception_of_yojson tree path)
      | _, "InternalFailureException" ->
          `InternalFailureException
            (Json_deserializers.internal_failure_exception_of_yojson tree path)
      | _, "LimitExceededException" ->
          `LimitExceededException (Json_deserializers.limit_exceeded_exception_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : delete_transcription_job_request) =
    let input = Json_serializers.delete_transcription_job_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"Transcribe.DeleteTranscriptionJob" ~service
      ~context ~input ~output_deserializer:Smaws_Lib.Smithy_api.Json_deserializers.unit__of_yojson
      ~error_deserializer
end

module DeleteVocabulary = struct
  let error_to_string = function
    | `BadRequestException _ -> "com.amazonaws.transcribe#BadRequestException"
    | `InternalFailureException _ -> "com.amazonaws.transcribe#InternalFailureException"
    | `LimitExceededException _ -> "com.amazonaws.transcribe#LimitExceededException"
    | `NotFoundException _ -> "com.amazonaws.transcribe#NotFoundException"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "BadRequestException" ->
          `BadRequestException (Json_deserializers.bad_request_exception_of_yojson tree path)
      | _, "InternalFailureException" ->
          `InternalFailureException
            (Json_deserializers.internal_failure_exception_of_yojson tree path)
      | _, "LimitExceededException" ->
          `LimitExceededException (Json_deserializers.limit_exceeded_exception_of_yojson tree path)
      | _, "NotFoundException" ->
          `NotFoundException (Json_deserializers.not_found_exception_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : delete_vocabulary_request) =
    let input = Json_serializers.delete_vocabulary_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"Transcribe.DeleteVocabulary" ~service ~context
      ~input ~output_deserializer:Smaws_Lib.Smithy_api.Json_deserializers.unit__of_yojson
      ~error_deserializer
end

module DeleteVocabularyFilter = struct
  let error_to_string = function
    | `BadRequestException _ -> "com.amazonaws.transcribe#BadRequestException"
    | `InternalFailureException _ -> "com.amazonaws.transcribe#InternalFailureException"
    | `LimitExceededException _ -> "com.amazonaws.transcribe#LimitExceededException"
    | `NotFoundException _ -> "com.amazonaws.transcribe#NotFoundException"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "BadRequestException" ->
          `BadRequestException (Json_deserializers.bad_request_exception_of_yojson tree path)
      | _, "InternalFailureException" ->
          `InternalFailureException
            (Json_deserializers.internal_failure_exception_of_yojson tree path)
      | _, "LimitExceededException" ->
          `LimitExceededException (Json_deserializers.limit_exceeded_exception_of_yojson tree path)
      | _, "NotFoundException" ->
          `NotFoundException (Json_deserializers.not_found_exception_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : delete_vocabulary_filter_request) =
    let input = Json_serializers.delete_vocabulary_filter_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"Transcribe.DeleteVocabularyFilter" ~service
      ~context ~input ~output_deserializer:Smaws_Lib.Smithy_api.Json_deserializers.unit__of_yojson
      ~error_deserializer
end

module DescribeLanguageModel = struct
  let error_to_string = function
    | `BadRequestException _ -> "com.amazonaws.transcribe#BadRequestException"
    | `InternalFailureException _ -> "com.amazonaws.transcribe#InternalFailureException"
    | `LimitExceededException _ -> "com.amazonaws.transcribe#LimitExceededException"
    | `NotFoundException _ -> "com.amazonaws.transcribe#NotFoundException"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "BadRequestException" ->
          `BadRequestException (Json_deserializers.bad_request_exception_of_yojson tree path)
      | _, "InternalFailureException" ->
          `InternalFailureException
            (Json_deserializers.internal_failure_exception_of_yojson tree path)
      | _, "LimitExceededException" ->
          `LimitExceededException (Json_deserializers.limit_exceeded_exception_of_yojson tree path)
      | _, "NotFoundException" ->
          `NotFoundException (Json_deserializers.not_found_exception_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : describe_language_model_request) =
    let input = Json_serializers.describe_language_model_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"Transcribe.DescribeLanguageModel" ~service
      ~context ~input
      ~output_deserializer:Json_deserializers.describe_language_model_response_of_yojson
      ~error_deserializer
end

module GetCallAnalyticsCategory = struct
  let error_to_string = function
    | `BadRequestException _ -> "com.amazonaws.transcribe#BadRequestException"
    | `InternalFailureException _ -> "com.amazonaws.transcribe#InternalFailureException"
    | `LimitExceededException _ -> "com.amazonaws.transcribe#LimitExceededException"
    | `NotFoundException _ -> "com.amazonaws.transcribe#NotFoundException"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "BadRequestException" ->
          `BadRequestException (Json_deserializers.bad_request_exception_of_yojson tree path)
      | _, "InternalFailureException" ->
          `InternalFailureException
            (Json_deserializers.internal_failure_exception_of_yojson tree path)
      | _, "LimitExceededException" ->
          `LimitExceededException (Json_deserializers.limit_exceeded_exception_of_yojson tree path)
      | _, "NotFoundException" ->
          `NotFoundException (Json_deserializers.not_found_exception_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : get_call_analytics_category_request) =
    let input = Json_serializers.get_call_analytics_category_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"Transcribe.GetCallAnalyticsCategory" ~service
      ~context ~input
      ~output_deserializer:Json_deserializers.get_call_analytics_category_response_of_yojson
      ~error_deserializer
end

module GetCallAnalyticsJob = struct
  let error_to_string = function
    | `BadRequestException _ -> "com.amazonaws.transcribe#BadRequestException"
    | `InternalFailureException _ -> "com.amazonaws.transcribe#InternalFailureException"
    | `LimitExceededException _ -> "com.amazonaws.transcribe#LimitExceededException"
    | `NotFoundException _ -> "com.amazonaws.transcribe#NotFoundException"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "BadRequestException" ->
          `BadRequestException (Json_deserializers.bad_request_exception_of_yojson tree path)
      | _, "InternalFailureException" ->
          `InternalFailureException
            (Json_deserializers.internal_failure_exception_of_yojson tree path)
      | _, "LimitExceededException" ->
          `LimitExceededException (Json_deserializers.limit_exceeded_exception_of_yojson tree path)
      | _, "NotFoundException" ->
          `NotFoundException (Json_deserializers.not_found_exception_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : get_call_analytics_job_request) =
    let input = Json_serializers.get_call_analytics_job_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"Transcribe.GetCallAnalyticsJob" ~service
      ~context ~input
      ~output_deserializer:Json_deserializers.get_call_analytics_job_response_of_yojson
      ~error_deserializer
end

module GetMedicalScribeJob = struct
  let error_to_string = function
    | `BadRequestException _ -> "com.amazonaws.transcribe#BadRequestException"
    | `InternalFailureException _ -> "com.amazonaws.transcribe#InternalFailureException"
    | `LimitExceededException _ -> "com.amazonaws.transcribe#LimitExceededException"
    | `NotFoundException _ -> "com.amazonaws.transcribe#NotFoundException"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "BadRequestException" ->
          `BadRequestException (Json_deserializers.bad_request_exception_of_yojson tree path)
      | _, "InternalFailureException" ->
          `InternalFailureException
            (Json_deserializers.internal_failure_exception_of_yojson tree path)
      | _, "LimitExceededException" ->
          `LimitExceededException (Json_deserializers.limit_exceeded_exception_of_yojson tree path)
      | _, "NotFoundException" ->
          `NotFoundException (Json_deserializers.not_found_exception_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : get_medical_scribe_job_request) =
    let input = Json_serializers.get_medical_scribe_job_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"Transcribe.GetMedicalScribeJob" ~service
      ~context ~input
      ~output_deserializer:Json_deserializers.get_medical_scribe_job_response_of_yojson
      ~error_deserializer
end

module GetMedicalTranscriptionJob = struct
  let error_to_string = function
    | `BadRequestException _ -> "com.amazonaws.transcribe#BadRequestException"
    | `InternalFailureException _ -> "com.amazonaws.transcribe#InternalFailureException"
    | `LimitExceededException _ -> "com.amazonaws.transcribe#LimitExceededException"
    | `NotFoundException _ -> "com.amazonaws.transcribe#NotFoundException"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "BadRequestException" ->
          `BadRequestException (Json_deserializers.bad_request_exception_of_yojson tree path)
      | _, "InternalFailureException" ->
          `InternalFailureException
            (Json_deserializers.internal_failure_exception_of_yojson tree path)
      | _, "LimitExceededException" ->
          `LimitExceededException (Json_deserializers.limit_exceeded_exception_of_yojson tree path)
      | _, "NotFoundException" ->
          `NotFoundException (Json_deserializers.not_found_exception_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : get_medical_transcription_job_request) =
    let input = Json_serializers.get_medical_transcription_job_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"Transcribe.GetMedicalTranscriptionJob" ~service
      ~context ~input
      ~output_deserializer:Json_deserializers.get_medical_transcription_job_response_of_yojson
      ~error_deserializer
end

module GetMedicalVocabulary = struct
  let error_to_string = function
    | `BadRequestException _ -> "com.amazonaws.transcribe#BadRequestException"
    | `InternalFailureException _ -> "com.amazonaws.transcribe#InternalFailureException"
    | `LimitExceededException _ -> "com.amazonaws.transcribe#LimitExceededException"
    | `NotFoundException _ -> "com.amazonaws.transcribe#NotFoundException"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "BadRequestException" ->
          `BadRequestException (Json_deserializers.bad_request_exception_of_yojson tree path)
      | _, "InternalFailureException" ->
          `InternalFailureException
            (Json_deserializers.internal_failure_exception_of_yojson tree path)
      | _, "LimitExceededException" ->
          `LimitExceededException (Json_deserializers.limit_exceeded_exception_of_yojson tree path)
      | _, "NotFoundException" ->
          `NotFoundException (Json_deserializers.not_found_exception_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : get_medical_vocabulary_request) =
    let input = Json_serializers.get_medical_vocabulary_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"Transcribe.GetMedicalVocabulary" ~service
      ~context ~input
      ~output_deserializer:Json_deserializers.get_medical_vocabulary_response_of_yojson
      ~error_deserializer
end

module GetTranscriptionJob = struct
  let error_to_string = function
    | `BadRequestException _ -> "com.amazonaws.transcribe#BadRequestException"
    | `InternalFailureException _ -> "com.amazonaws.transcribe#InternalFailureException"
    | `LimitExceededException _ -> "com.amazonaws.transcribe#LimitExceededException"
    | `NotFoundException _ -> "com.amazonaws.transcribe#NotFoundException"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "BadRequestException" ->
          `BadRequestException (Json_deserializers.bad_request_exception_of_yojson tree path)
      | _, "InternalFailureException" ->
          `InternalFailureException
            (Json_deserializers.internal_failure_exception_of_yojson tree path)
      | _, "LimitExceededException" ->
          `LimitExceededException (Json_deserializers.limit_exceeded_exception_of_yojson tree path)
      | _, "NotFoundException" ->
          `NotFoundException (Json_deserializers.not_found_exception_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : get_transcription_job_request) =
    let input = Json_serializers.get_transcription_job_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"Transcribe.GetTranscriptionJob" ~service
      ~context ~input
      ~output_deserializer:Json_deserializers.get_transcription_job_response_of_yojson
      ~error_deserializer
end

module GetVocabulary = struct
  let error_to_string = function
    | `BadRequestException _ -> "com.amazonaws.transcribe#BadRequestException"
    | `InternalFailureException _ -> "com.amazonaws.transcribe#InternalFailureException"
    | `LimitExceededException _ -> "com.amazonaws.transcribe#LimitExceededException"
    | `NotFoundException _ -> "com.amazonaws.transcribe#NotFoundException"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "BadRequestException" ->
          `BadRequestException (Json_deserializers.bad_request_exception_of_yojson tree path)
      | _, "InternalFailureException" ->
          `InternalFailureException
            (Json_deserializers.internal_failure_exception_of_yojson tree path)
      | _, "LimitExceededException" ->
          `LimitExceededException (Json_deserializers.limit_exceeded_exception_of_yojson tree path)
      | _, "NotFoundException" ->
          `NotFoundException (Json_deserializers.not_found_exception_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : get_vocabulary_request) =
    let input = Json_serializers.get_vocabulary_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"Transcribe.GetVocabulary" ~service ~context
      ~input ~output_deserializer:Json_deserializers.get_vocabulary_response_of_yojson
      ~error_deserializer
end

module GetVocabularyFilter = struct
  let error_to_string = function
    | `BadRequestException _ -> "com.amazonaws.transcribe#BadRequestException"
    | `InternalFailureException _ -> "com.amazonaws.transcribe#InternalFailureException"
    | `LimitExceededException _ -> "com.amazonaws.transcribe#LimitExceededException"
    | `NotFoundException _ -> "com.amazonaws.transcribe#NotFoundException"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "BadRequestException" ->
          `BadRequestException (Json_deserializers.bad_request_exception_of_yojson tree path)
      | _, "InternalFailureException" ->
          `InternalFailureException
            (Json_deserializers.internal_failure_exception_of_yojson tree path)
      | _, "LimitExceededException" ->
          `LimitExceededException (Json_deserializers.limit_exceeded_exception_of_yojson tree path)
      | _, "NotFoundException" ->
          `NotFoundException (Json_deserializers.not_found_exception_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : get_vocabulary_filter_request) =
    let input = Json_serializers.get_vocabulary_filter_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"Transcribe.GetVocabularyFilter" ~service
      ~context ~input
      ~output_deserializer:Json_deserializers.get_vocabulary_filter_response_of_yojson
      ~error_deserializer
end

module ListCallAnalyticsCategories = struct
  let error_to_string = function
    | `BadRequestException _ -> "com.amazonaws.transcribe#BadRequestException"
    | `InternalFailureException _ -> "com.amazonaws.transcribe#InternalFailureException"
    | `LimitExceededException _ -> "com.amazonaws.transcribe#LimitExceededException"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "BadRequestException" ->
          `BadRequestException (Json_deserializers.bad_request_exception_of_yojson tree path)
      | _, "InternalFailureException" ->
          `InternalFailureException
            (Json_deserializers.internal_failure_exception_of_yojson tree path)
      | _, "LimitExceededException" ->
          `LimitExceededException (Json_deserializers.limit_exceeded_exception_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : list_call_analytics_categories_request) =
    let input = Json_serializers.list_call_analytics_categories_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"Transcribe.ListCallAnalyticsCategories"
      ~service ~context ~input
      ~output_deserializer:Json_deserializers.list_call_analytics_categories_response_of_yojson
      ~error_deserializer
end

module ListCallAnalyticsJobs = struct
  let error_to_string = function
    | `BadRequestException _ -> "com.amazonaws.transcribe#BadRequestException"
    | `InternalFailureException _ -> "com.amazonaws.transcribe#InternalFailureException"
    | `LimitExceededException _ -> "com.amazonaws.transcribe#LimitExceededException"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "BadRequestException" ->
          `BadRequestException (Json_deserializers.bad_request_exception_of_yojson tree path)
      | _, "InternalFailureException" ->
          `InternalFailureException
            (Json_deserializers.internal_failure_exception_of_yojson tree path)
      | _, "LimitExceededException" ->
          `LimitExceededException (Json_deserializers.limit_exceeded_exception_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : list_call_analytics_jobs_request) =
    let input = Json_serializers.list_call_analytics_jobs_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"Transcribe.ListCallAnalyticsJobs" ~service
      ~context ~input
      ~output_deserializer:Json_deserializers.list_call_analytics_jobs_response_of_yojson
      ~error_deserializer
end

module ListLanguageModels = struct
  let error_to_string = function
    | `BadRequestException _ -> "com.amazonaws.transcribe#BadRequestException"
    | `InternalFailureException _ -> "com.amazonaws.transcribe#InternalFailureException"
    | `LimitExceededException _ -> "com.amazonaws.transcribe#LimitExceededException"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "BadRequestException" ->
          `BadRequestException (Json_deserializers.bad_request_exception_of_yojson tree path)
      | _, "InternalFailureException" ->
          `InternalFailureException
            (Json_deserializers.internal_failure_exception_of_yojson tree path)
      | _, "LimitExceededException" ->
          `LimitExceededException (Json_deserializers.limit_exceeded_exception_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : list_language_models_request) =
    let input = Json_serializers.list_language_models_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"Transcribe.ListLanguageModels" ~service
      ~context ~input
      ~output_deserializer:Json_deserializers.list_language_models_response_of_yojson
      ~error_deserializer
end

module ListMedicalScribeJobs = struct
  let error_to_string = function
    | `BadRequestException _ -> "com.amazonaws.transcribe#BadRequestException"
    | `InternalFailureException _ -> "com.amazonaws.transcribe#InternalFailureException"
    | `LimitExceededException _ -> "com.amazonaws.transcribe#LimitExceededException"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "BadRequestException" ->
          `BadRequestException (Json_deserializers.bad_request_exception_of_yojson tree path)
      | _, "InternalFailureException" ->
          `InternalFailureException
            (Json_deserializers.internal_failure_exception_of_yojson tree path)
      | _, "LimitExceededException" ->
          `LimitExceededException (Json_deserializers.limit_exceeded_exception_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : list_medical_scribe_jobs_request) =
    let input = Json_serializers.list_medical_scribe_jobs_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"Transcribe.ListMedicalScribeJobs" ~service
      ~context ~input
      ~output_deserializer:Json_deserializers.list_medical_scribe_jobs_response_of_yojson
      ~error_deserializer
end

module ListMedicalTranscriptionJobs = struct
  let error_to_string = function
    | `BadRequestException _ -> "com.amazonaws.transcribe#BadRequestException"
    | `InternalFailureException _ -> "com.amazonaws.transcribe#InternalFailureException"
    | `LimitExceededException _ -> "com.amazonaws.transcribe#LimitExceededException"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "BadRequestException" ->
          `BadRequestException (Json_deserializers.bad_request_exception_of_yojson tree path)
      | _, "InternalFailureException" ->
          `InternalFailureException
            (Json_deserializers.internal_failure_exception_of_yojson tree path)
      | _, "LimitExceededException" ->
          `LimitExceededException (Json_deserializers.limit_exceeded_exception_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : list_medical_transcription_jobs_request) =
    let input = Json_serializers.list_medical_transcription_jobs_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"Transcribe.ListMedicalTranscriptionJobs"
      ~service ~context ~input
      ~output_deserializer:Json_deserializers.list_medical_transcription_jobs_response_of_yojson
      ~error_deserializer
end

module ListMedicalVocabularies = struct
  let error_to_string = function
    | `BadRequestException _ -> "com.amazonaws.transcribe#BadRequestException"
    | `InternalFailureException _ -> "com.amazonaws.transcribe#InternalFailureException"
    | `LimitExceededException _ -> "com.amazonaws.transcribe#LimitExceededException"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "BadRequestException" ->
          `BadRequestException (Json_deserializers.bad_request_exception_of_yojson tree path)
      | _, "InternalFailureException" ->
          `InternalFailureException
            (Json_deserializers.internal_failure_exception_of_yojson tree path)
      | _, "LimitExceededException" ->
          `LimitExceededException (Json_deserializers.limit_exceeded_exception_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : list_medical_vocabularies_request) =
    let input = Json_serializers.list_medical_vocabularies_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"Transcribe.ListMedicalVocabularies" ~service
      ~context ~input
      ~output_deserializer:Json_deserializers.list_medical_vocabularies_response_of_yojson
      ~error_deserializer
end

module ListTagsForResource = struct
  let error_to_string = function
    | `BadRequestException _ -> "com.amazonaws.transcribe#BadRequestException"
    | `InternalFailureException _ -> "com.amazonaws.transcribe#InternalFailureException"
    | `LimitExceededException _ -> "com.amazonaws.transcribe#LimitExceededException"
    | `NotFoundException _ -> "com.amazonaws.transcribe#NotFoundException"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "BadRequestException" ->
          `BadRequestException (Json_deserializers.bad_request_exception_of_yojson tree path)
      | _, "InternalFailureException" ->
          `InternalFailureException
            (Json_deserializers.internal_failure_exception_of_yojson tree path)
      | _, "LimitExceededException" ->
          `LimitExceededException (Json_deserializers.limit_exceeded_exception_of_yojson tree path)
      | _, "NotFoundException" ->
          `NotFoundException (Json_deserializers.not_found_exception_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : list_tags_for_resource_request) =
    let input = Json_serializers.list_tags_for_resource_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"Transcribe.ListTagsForResource" ~service
      ~context ~input
      ~output_deserializer:Json_deserializers.list_tags_for_resource_response_of_yojson
      ~error_deserializer
end

module ListTranscriptionJobs = struct
  let error_to_string = function
    | `BadRequestException _ -> "com.amazonaws.transcribe#BadRequestException"
    | `InternalFailureException _ -> "com.amazonaws.transcribe#InternalFailureException"
    | `LimitExceededException _ -> "com.amazonaws.transcribe#LimitExceededException"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "BadRequestException" ->
          `BadRequestException (Json_deserializers.bad_request_exception_of_yojson tree path)
      | _, "InternalFailureException" ->
          `InternalFailureException
            (Json_deserializers.internal_failure_exception_of_yojson tree path)
      | _, "LimitExceededException" ->
          `LimitExceededException (Json_deserializers.limit_exceeded_exception_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : list_transcription_jobs_request) =
    let input = Json_serializers.list_transcription_jobs_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"Transcribe.ListTranscriptionJobs" ~service
      ~context ~input
      ~output_deserializer:Json_deserializers.list_transcription_jobs_response_of_yojson
      ~error_deserializer
end

module ListVocabularies = struct
  let error_to_string = function
    | `BadRequestException _ -> "com.amazonaws.transcribe#BadRequestException"
    | `InternalFailureException _ -> "com.amazonaws.transcribe#InternalFailureException"
    | `LimitExceededException _ -> "com.amazonaws.transcribe#LimitExceededException"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "BadRequestException" ->
          `BadRequestException (Json_deserializers.bad_request_exception_of_yojson tree path)
      | _, "InternalFailureException" ->
          `InternalFailureException
            (Json_deserializers.internal_failure_exception_of_yojson tree path)
      | _, "LimitExceededException" ->
          `LimitExceededException (Json_deserializers.limit_exceeded_exception_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : list_vocabularies_request) =
    let input = Json_serializers.list_vocabularies_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"Transcribe.ListVocabularies" ~service ~context
      ~input ~output_deserializer:Json_deserializers.list_vocabularies_response_of_yojson
      ~error_deserializer
end

module ListVocabularyFilters = struct
  let error_to_string = function
    | `BadRequestException _ -> "com.amazonaws.transcribe#BadRequestException"
    | `InternalFailureException _ -> "com.amazonaws.transcribe#InternalFailureException"
    | `LimitExceededException _ -> "com.amazonaws.transcribe#LimitExceededException"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "BadRequestException" ->
          `BadRequestException (Json_deserializers.bad_request_exception_of_yojson tree path)
      | _, "InternalFailureException" ->
          `InternalFailureException
            (Json_deserializers.internal_failure_exception_of_yojson tree path)
      | _, "LimitExceededException" ->
          `LimitExceededException (Json_deserializers.limit_exceeded_exception_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : list_vocabulary_filters_request) =
    let input = Json_serializers.list_vocabulary_filters_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"Transcribe.ListVocabularyFilters" ~service
      ~context ~input
      ~output_deserializer:Json_deserializers.list_vocabulary_filters_response_of_yojson
      ~error_deserializer
end

module StartCallAnalyticsJob = struct
  let error_to_string = function
    | `BadRequestException _ -> "com.amazonaws.transcribe#BadRequestException"
    | `ConflictException _ -> "com.amazonaws.transcribe#ConflictException"
    | `InternalFailureException _ -> "com.amazonaws.transcribe#InternalFailureException"
    | `LimitExceededException _ -> "com.amazonaws.transcribe#LimitExceededException"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "BadRequestException" ->
          `BadRequestException (Json_deserializers.bad_request_exception_of_yojson tree path)
      | _, "ConflictException" ->
          `ConflictException (Json_deserializers.conflict_exception_of_yojson tree path)
      | _, "InternalFailureException" ->
          `InternalFailureException
            (Json_deserializers.internal_failure_exception_of_yojson tree path)
      | _, "LimitExceededException" ->
          `LimitExceededException (Json_deserializers.limit_exceeded_exception_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : start_call_analytics_job_request) =
    let input = Json_serializers.start_call_analytics_job_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"Transcribe.StartCallAnalyticsJob" ~service
      ~context ~input
      ~output_deserializer:Json_deserializers.start_call_analytics_job_response_of_yojson
      ~error_deserializer
end

module StartMedicalScribeJob = struct
  let error_to_string = function
    | `BadRequestException _ -> "com.amazonaws.transcribe#BadRequestException"
    | `ConflictException _ -> "com.amazonaws.transcribe#ConflictException"
    | `InternalFailureException _ -> "com.amazonaws.transcribe#InternalFailureException"
    | `LimitExceededException _ -> "com.amazonaws.transcribe#LimitExceededException"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "BadRequestException" ->
          `BadRequestException (Json_deserializers.bad_request_exception_of_yojson tree path)
      | _, "ConflictException" ->
          `ConflictException (Json_deserializers.conflict_exception_of_yojson tree path)
      | _, "InternalFailureException" ->
          `InternalFailureException
            (Json_deserializers.internal_failure_exception_of_yojson tree path)
      | _, "LimitExceededException" ->
          `LimitExceededException (Json_deserializers.limit_exceeded_exception_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : start_medical_scribe_job_request) =
    let input = Json_serializers.start_medical_scribe_job_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"Transcribe.StartMedicalScribeJob" ~service
      ~context ~input
      ~output_deserializer:Json_deserializers.start_medical_scribe_job_response_of_yojson
      ~error_deserializer
end

module StartMedicalTranscriptionJob = struct
  let error_to_string = function
    | `BadRequestException _ -> "com.amazonaws.transcribe#BadRequestException"
    | `ConflictException _ -> "com.amazonaws.transcribe#ConflictException"
    | `InternalFailureException _ -> "com.amazonaws.transcribe#InternalFailureException"
    | `LimitExceededException _ -> "com.amazonaws.transcribe#LimitExceededException"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "BadRequestException" ->
          `BadRequestException (Json_deserializers.bad_request_exception_of_yojson tree path)
      | _, "ConflictException" ->
          `ConflictException (Json_deserializers.conflict_exception_of_yojson tree path)
      | _, "InternalFailureException" ->
          `InternalFailureException
            (Json_deserializers.internal_failure_exception_of_yojson tree path)
      | _, "LimitExceededException" ->
          `LimitExceededException (Json_deserializers.limit_exceeded_exception_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : start_medical_transcription_job_request) =
    let input = Json_serializers.start_medical_transcription_job_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"Transcribe.StartMedicalTranscriptionJob"
      ~service ~context ~input
      ~output_deserializer:Json_deserializers.start_medical_transcription_job_response_of_yojson
      ~error_deserializer
end

module StartTranscriptionJob = struct
  let error_to_string = function
    | `BadRequestException _ -> "com.amazonaws.transcribe#BadRequestException"
    | `ConflictException _ -> "com.amazonaws.transcribe#ConflictException"
    | `InternalFailureException _ -> "com.amazonaws.transcribe#InternalFailureException"
    | `LimitExceededException _ -> "com.amazonaws.transcribe#LimitExceededException"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "BadRequestException" ->
          `BadRequestException (Json_deserializers.bad_request_exception_of_yojson tree path)
      | _, "ConflictException" ->
          `ConflictException (Json_deserializers.conflict_exception_of_yojson tree path)
      | _, "InternalFailureException" ->
          `InternalFailureException
            (Json_deserializers.internal_failure_exception_of_yojson tree path)
      | _, "LimitExceededException" ->
          `LimitExceededException (Json_deserializers.limit_exceeded_exception_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : start_transcription_job_request) =
    let input = Json_serializers.start_transcription_job_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"Transcribe.StartTranscriptionJob" ~service
      ~context ~input
      ~output_deserializer:Json_deserializers.start_transcription_job_response_of_yojson
      ~error_deserializer
end

module TagResource = struct
  let error_to_string = function
    | `BadRequestException _ -> "com.amazonaws.transcribe#BadRequestException"
    | `ConflictException _ -> "com.amazonaws.transcribe#ConflictException"
    | `InternalFailureException _ -> "com.amazonaws.transcribe#InternalFailureException"
    | `LimitExceededException _ -> "com.amazonaws.transcribe#LimitExceededException"
    | `NotFoundException _ -> "com.amazonaws.transcribe#NotFoundException"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "BadRequestException" ->
          `BadRequestException (Json_deserializers.bad_request_exception_of_yojson tree path)
      | _, "ConflictException" ->
          `ConflictException (Json_deserializers.conflict_exception_of_yojson tree path)
      | _, "InternalFailureException" ->
          `InternalFailureException
            (Json_deserializers.internal_failure_exception_of_yojson tree path)
      | _, "LimitExceededException" ->
          `LimitExceededException (Json_deserializers.limit_exceeded_exception_of_yojson tree path)
      | _, "NotFoundException" ->
          `NotFoundException (Json_deserializers.not_found_exception_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : tag_resource_request) =
    let input = Json_serializers.tag_resource_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"Transcribe.TagResource" ~service ~context
      ~input ~output_deserializer:Json_deserializers.tag_resource_response_of_yojson
      ~error_deserializer
end

module UntagResource = struct
  let error_to_string = function
    | `BadRequestException _ -> "com.amazonaws.transcribe#BadRequestException"
    | `ConflictException _ -> "com.amazonaws.transcribe#ConflictException"
    | `InternalFailureException _ -> "com.amazonaws.transcribe#InternalFailureException"
    | `LimitExceededException _ -> "com.amazonaws.transcribe#LimitExceededException"
    | `NotFoundException _ -> "com.amazonaws.transcribe#NotFoundException"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "BadRequestException" ->
          `BadRequestException (Json_deserializers.bad_request_exception_of_yojson tree path)
      | _, "ConflictException" ->
          `ConflictException (Json_deserializers.conflict_exception_of_yojson tree path)
      | _, "InternalFailureException" ->
          `InternalFailureException
            (Json_deserializers.internal_failure_exception_of_yojson tree path)
      | _, "LimitExceededException" ->
          `LimitExceededException (Json_deserializers.limit_exceeded_exception_of_yojson tree path)
      | _, "NotFoundException" ->
          `NotFoundException (Json_deserializers.not_found_exception_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : untag_resource_request) =
    let input = Json_serializers.untag_resource_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"Transcribe.UntagResource" ~service ~context
      ~input ~output_deserializer:Json_deserializers.untag_resource_response_of_yojson
      ~error_deserializer
end

module UpdateCallAnalyticsCategory = struct
  let error_to_string = function
    | `BadRequestException _ -> "com.amazonaws.transcribe#BadRequestException"
    | `ConflictException _ -> "com.amazonaws.transcribe#ConflictException"
    | `InternalFailureException _ -> "com.amazonaws.transcribe#InternalFailureException"
    | `LimitExceededException _ -> "com.amazonaws.transcribe#LimitExceededException"
    | `NotFoundException _ -> "com.amazonaws.transcribe#NotFoundException"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "BadRequestException" ->
          `BadRequestException (Json_deserializers.bad_request_exception_of_yojson tree path)
      | _, "ConflictException" ->
          `ConflictException (Json_deserializers.conflict_exception_of_yojson tree path)
      | _, "InternalFailureException" ->
          `InternalFailureException
            (Json_deserializers.internal_failure_exception_of_yojson tree path)
      | _, "LimitExceededException" ->
          `LimitExceededException (Json_deserializers.limit_exceeded_exception_of_yojson tree path)
      | _, "NotFoundException" ->
          `NotFoundException (Json_deserializers.not_found_exception_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : update_call_analytics_category_request) =
    let input = Json_serializers.update_call_analytics_category_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"Transcribe.UpdateCallAnalyticsCategory"
      ~service ~context ~input
      ~output_deserializer:Json_deserializers.update_call_analytics_category_response_of_yojson
      ~error_deserializer
end

module UpdateMedicalVocabulary = struct
  let error_to_string = function
    | `BadRequestException _ -> "com.amazonaws.transcribe#BadRequestException"
    | `ConflictException _ -> "com.amazonaws.transcribe#ConflictException"
    | `InternalFailureException _ -> "com.amazonaws.transcribe#InternalFailureException"
    | `LimitExceededException _ -> "com.amazonaws.transcribe#LimitExceededException"
    | `NotFoundException _ -> "com.amazonaws.transcribe#NotFoundException"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "BadRequestException" ->
          `BadRequestException (Json_deserializers.bad_request_exception_of_yojson tree path)
      | _, "ConflictException" ->
          `ConflictException (Json_deserializers.conflict_exception_of_yojson tree path)
      | _, "InternalFailureException" ->
          `InternalFailureException
            (Json_deserializers.internal_failure_exception_of_yojson tree path)
      | _, "LimitExceededException" ->
          `LimitExceededException (Json_deserializers.limit_exceeded_exception_of_yojson tree path)
      | _, "NotFoundException" ->
          `NotFoundException (Json_deserializers.not_found_exception_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : update_medical_vocabulary_request) =
    let input = Json_serializers.update_medical_vocabulary_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"Transcribe.UpdateMedicalVocabulary" ~service
      ~context ~input
      ~output_deserializer:Json_deserializers.update_medical_vocabulary_response_of_yojson
      ~error_deserializer
end

module UpdateVocabulary = struct
  let error_to_string = function
    | `BadRequestException _ -> "com.amazonaws.transcribe#BadRequestException"
    | `ConflictException _ -> "com.amazonaws.transcribe#ConflictException"
    | `InternalFailureException _ -> "com.amazonaws.transcribe#InternalFailureException"
    | `LimitExceededException _ -> "com.amazonaws.transcribe#LimitExceededException"
    | `NotFoundException _ -> "com.amazonaws.transcribe#NotFoundException"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "BadRequestException" ->
          `BadRequestException (Json_deserializers.bad_request_exception_of_yojson tree path)
      | _, "ConflictException" ->
          `ConflictException (Json_deserializers.conflict_exception_of_yojson tree path)
      | _, "InternalFailureException" ->
          `InternalFailureException
            (Json_deserializers.internal_failure_exception_of_yojson tree path)
      | _, "LimitExceededException" ->
          `LimitExceededException (Json_deserializers.limit_exceeded_exception_of_yojson tree path)
      | _, "NotFoundException" ->
          `NotFoundException (Json_deserializers.not_found_exception_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : update_vocabulary_request) =
    let input = Json_serializers.update_vocabulary_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"Transcribe.UpdateVocabulary" ~service ~context
      ~input ~output_deserializer:Json_deserializers.update_vocabulary_response_of_yojson
      ~error_deserializer
end

module UpdateVocabularyFilter = struct
  let error_to_string = function
    | `BadRequestException _ -> "com.amazonaws.transcribe#BadRequestException"
    | `InternalFailureException _ -> "com.amazonaws.transcribe#InternalFailureException"
    | `LimitExceededException _ -> "com.amazonaws.transcribe#LimitExceededException"
    | `NotFoundException _ -> "com.amazonaws.transcribe#NotFoundException"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "BadRequestException" ->
          `BadRequestException (Json_deserializers.bad_request_exception_of_yojson tree path)
      | _, "InternalFailureException" ->
          `InternalFailureException
            (Json_deserializers.internal_failure_exception_of_yojson tree path)
      | _, "LimitExceededException" ->
          `LimitExceededException (Json_deserializers.limit_exceeded_exception_of_yojson tree path)
      | _, "NotFoundException" ->
          `NotFoundException (Json_deserializers.not_found_exception_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : update_vocabulary_filter_request) =
    let input = Json_serializers.update_vocabulary_filter_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"Transcribe.UpdateVocabularyFilter" ~service
      ~context ~input
      ~output_deserializer:Json_deserializers.update_vocabulary_filter_response_of_yojson
      ~error_deserializer
end
