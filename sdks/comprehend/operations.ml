open Types
open Service_metadata

module BatchDetectDominantLanguage = struct
  let error_to_string = function
    | `BatchSizeLimitExceededException _ ->
        "com.amazonaws.comprehend#BatchSizeLimitExceededException"
    | `InternalServerException _ -> "com.amazonaws.comprehend#InternalServerException"
    | `InvalidRequestException _ -> "com.amazonaws.comprehend#InvalidRequestException"
    | `TextSizeLimitExceededException _ -> "com.amazonaws.comprehend#TextSizeLimitExceededException"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "BatchSizeLimitExceededException" ->
          `BatchSizeLimitExceededException
            (Json_deserializers.batch_size_limit_exceeded_exception_of_yojson tree path)
      | _, "InternalServerException" ->
          `InternalServerException
            (Json_deserializers.internal_server_exception_of_yojson tree path)
      | _, "InvalidRequestException" ->
          `InvalidRequestException
            (Json_deserializers.invalid_request_exception_of_yojson tree path)
      | _, "TextSizeLimitExceededException" ->
          `TextSizeLimitExceededException
            (Json_deserializers.text_size_limit_exceeded_exception_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : batch_detect_dominant_language_request) =
    let input = Json_serializers.batch_detect_dominant_language_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request
      ~shape_name:"Comprehend_20171127.BatchDetectDominantLanguage" ~service ~context ~input
      ~output_deserializer:Json_deserializers.batch_detect_dominant_language_response_of_yojson
      ~error_deserializer

  let request_with_metadata context (request : batch_detect_dominant_language_request) =
    let input = Json_serializers.batch_detect_dominant_language_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata
      ~shape_name:"Comprehend_20171127.BatchDetectDominantLanguage" ~service ~context ~input
      ~output_deserializer:Json_deserializers.batch_detect_dominant_language_response_of_yojson
      ~error_deserializer
end

module BatchDetectEntities = struct
  let error_to_string = function
    | `BatchSizeLimitExceededException _ ->
        "com.amazonaws.comprehend#BatchSizeLimitExceededException"
    | `InternalServerException _ -> "com.amazonaws.comprehend#InternalServerException"
    | `InvalidRequestException _ -> "com.amazonaws.comprehend#InvalidRequestException"
    | `TextSizeLimitExceededException _ -> "com.amazonaws.comprehend#TextSizeLimitExceededException"
    | `UnsupportedLanguageException _ -> "com.amazonaws.comprehend#UnsupportedLanguageException"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "BatchSizeLimitExceededException" ->
          `BatchSizeLimitExceededException
            (Json_deserializers.batch_size_limit_exceeded_exception_of_yojson tree path)
      | _, "InternalServerException" ->
          `InternalServerException
            (Json_deserializers.internal_server_exception_of_yojson tree path)
      | _, "InvalidRequestException" ->
          `InvalidRequestException
            (Json_deserializers.invalid_request_exception_of_yojson tree path)
      | _, "TextSizeLimitExceededException" ->
          `TextSizeLimitExceededException
            (Json_deserializers.text_size_limit_exceeded_exception_of_yojson tree path)
      | _, "UnsupportedLanguageException" ->
          `UnsupportedLanguageException
            (Json_deserializers.unsupported_language_exception_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : batch_detect_entities_request) =
    let input = Json_serializers.batch_detect_entities_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"Comprehend_20171127.BatchDetectEntities"
      ~service ~context ~input
      ~output_deserializer:Json_deserializers.batch_detect_entities_response_of_yojson
      ~error_deserializer

  let request_with_metadata context (request : batch_detect_entities_request) =
    let input = Json_serializers.batch_detect_entities_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata
      ~shape_name:"Comprehend_20171127.BatchDetectEntities" ~service ~context ~input
      ~output_deserializer:Json_deserializers.batch_detect_entities_response_of_yojson
      ~error_deserializer
end

module BatchDetectKeyPhrases = struct
  let error_to_string = function
    | `BatchSizeLimitExceededException _ ->
        "com.amazonaws.comprehend#BatchSizeLimitExceededException"
    | `InternalServerException _ -> "com.amazonaws.comprehend#InternalServerException"
    | `InvalidRequestException _ -> "com.amazonaws.comprehend#InvalidRequestException"
    | `TextSizeLimitExceededException _ -> "com.amazonaws.comprehend#TextSizeLimitExceededException"
    | `UnsupportedLanguageException _ -> "com.amazonaws.comprehend#UnsupportedLanguageException"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "BatchSizeLimitExceededException" ->
          `BatchSizeLimitExceededException
            (Json_deserializers.batch_size_limit_exceeded_exception_of_yojson tree path)
      | _, "InternalServerException" ->
          `InternalServerException
            (Json_deserializers.internal_server_exception_of_yojson tree path)
      | _, "InvalidRequestException" ->
          `InvalidRequestException
            (Json_deserializers.invalid_request_exception_of_yojson tree path)
      | _, "TextSizeLimitExceededException" ->
          `TextSizeLimitExceededException
            (Json_deserializers.text_size_limit_exceeded_exception_of_yojson tree path)
      | _, "UnsupportedLanguageException" ->
          `UnsupportedLanguageException
            (Json_deserializers.unsupported_language_exception_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : batch_detect_key_phrases_request) =
    let input = Json_serializers.batch_detect_key_phrases_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"Comprehend_20171127.BatchDetectKeyPhrases"
      ~service ~context ~input
      ~output_deserializer:Json_deserializers.batch_detect_key_phrases_response_of_yojson
      ~error_deserializer

  let request_with_metadata context (request : batch_detect_key_phrases_request) =
    let input = Json_serializers.batch_detect_key_phrases_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata
      ~shape_name:"Comprehend_20171127.BatchDetectKeyPhrases" ~service ~context ~input
      ~output_deserializer:Json_deserializers.batch_detect_key_phrases_response_of_yojson
      ~error_deserializer
end

module BatchDetectSentiment = struct
  let error_to_string = function
    | `BatchSizeLimitExceededException _ ->
        "com.amazonaws.comprehend#BatchSizeLimitExceededException"
    | `InternalServerException _ -> "com.amazonaws.comprehend#InternalServerException"
    | `InvalidRequestException _ -> "com.amazonaws.comprehend#InvalidRequestException"
    | `TextSizeLimitExceededException _ -> "com.amazonaws.comprehend#TextSizeLimitExceededException"
    | `UnsupportedLanguageException _ -> "com.amazonaws.comprehend#UnsupportedLanguageException"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "BatchSizeLimitExceededException" ->
          `BatchSizeLimitExceededException
            (Json_deserializers.batch_size_limit_exceeded_exception_of_yojson tree path)
      | _, "InternalServerException" ->
          `InternalServerException
            (Json_deserializers.internal_server_exception_of_yojson tree path)
      | _, "InvalidRequestException" ->
          `InvalidRequestException
            (Json_deserializers.invalid_request_exception_of_yojson tree path)
      | _, "TextSizeLimitExceededException" ->
          `TextSizeLimitExceededException
            (Json_deserializers.text_size_limit_exceeded_exception_of_yojson tree path)
      | _, "UnsupportedLanguageException" ->
          `UnsupportedLanguageException
            (Json_deserializers.unsupported_language_exception_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : batch_detect_sentiment_request) =
    let input = Json_serializers.batch_detect_sentiment_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"Comprehend_20171127.BatchDetectSentiment"
      ~service ~context ~input
      ~output_deserializer:Json_deserializers.batch_detect_sentiment_response_of_yojson
      ~error_deserializer

  let request_with_metadata context (request : batch_detect_sentiment_request) =
    let input = Json_serializers.batch_detect_sentiment_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata
      ~shape_name:"Comprehend_20171127.BatchDetectSentiment" ~service ~context ~input
      ~output_deserializer:Json_deserializers.batch_detect_sentiment_response_of_yojson
      ~error_deserializer
end

module BatchDetectSyntax = struct
  let error_to_string = function
    | `BatchSizeLimitExceededException _ ->
        "com.amazonaws.comprehend#BatchSizeLimitExceededException"
    | `InternalServerException _ -> "com.amazonaws.comprehend#InternalServerException"
    | `InvalidRequestException _ -> "com.amazonaws.comprehend#InvalidRequestException"
    | `TextSizeLimitExceededException _ -> "com.amazonaws.comprehend#TextSizeLimitExceededException"
    | `UnsupportedLanguageException _ -> "com.amazonaws.comprehend#UnsupportedLanguageException"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "BatchSizeLimitExceededException" ->
          `BatchSizeLimitExceededException
            (Json_deserializers.batch_size_limit_exceeded_exception_of_yojson tree path)
      | _, "InternalServerException" ->
          `InternalServerException
            (Json_deserializers.internal_server_exception_of_yojson tree path)
      | _, "InvalidRequestException" ->
          `InvalidRequestException
            (Json_deserializers.invalid_request_exception_of_yojson tree path)
      | _, "TextSizeLimitExceededException" ->
          `TextSizeLimitExceededException
            (Json_deserializers.text_size_limit_exceeded_exception_of_yojson tree path)
      | _, "UnsupportedLanguageException" ->
          `UnsupportedLanguageException
            (Json_deserializers.unsupported_language_exception_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : batch_detect_syntax_request) =
    let input = Json_serializers.batch_detect_syntax_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"Comprehend_20171127.BatchDetectSyntax" ~service
      ~context ~input ~output_deserializer:Json_deserializers.batch_detect_syntax_response_of_yojson
      ~error_deserializer

  let request_with_metadata context (request : batch_detect_syntax_request) =
    let input = Json_serializers.batch_detect_syntax_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata
      ~shape_name:"Comprehend_20171127.BatchDetectSyntax" ~service ~context ~input
      ~output_deserializer:Json_deserializers.batch_detect_syntax_response_of_yojson
      ~error_deserializer
end

module BatchDetectTargetedSentiment = struct
  let error_to_string = function
    | `BatchSizeLimitExceededException _ ->
        "com.amazonaws.comprehend#BatchSizeLimitExceededException"
    | `InternalServerException _ -> "com.amazonaws.comprehend#InternalServerException"
    | `InvalidRequestException _ -> "com.amazonaws.comprehend#InvalidRequestException"
    | `TextSizeLimitExceededException _ -> "com.amazonaws.comprehend#TextSizeLimitExceededException"
    | `UnsupportedLanguageException _ -> "com.amazonaws.comprehend#UnsupportedLanguageException"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "BatchSizeLimitExceededException" ->
          `BatchSizeLimitExceededException
            (Json_deserializers.batch_size_limit_exceeded_exception_of_yojson tree path)
      | _, "InternalServerException" ->
          `InternalServerException
            (Json_deserializers.internal_server_exception_of_yojson tree path)
      | _, "InvalidRequestException" ->
          `InvalidRequestException
            (Json_deserializers.invalid_request_exception_of_yojson tree path)
      | _, "TextSizeLimitExceededException" ->
          `TextSizeLimitExceededException
            (Json_deserializers.text_size_limit_exceeded_exception_of_yojson tree path)
      | _, "UnsupportedLanguageException" ->
          `UnsupportedLanguageException
            (Json_deserializers.unsupported_language_exception_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : batch_detect_targeted_sentiment_request) =
    let input = Json_serializers.batch_detect_targeted_sentiment_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request
      ~shape_name:"Comprehend_20171127.BatchDetectTargetedSentiment" ~service ~context ~input
      ~output_deserializer:Json_deserializers.batch_detect_targeted_sentiment_response_of_yojson
      ~error_deserializer

  let request_with_metadata context (request : batch_detect_targeted_sentiment_request) =
    let input = Json_serializers.batch_detect_targeted_sentiment_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata
      ~shape_name:"Comprehend_20171127.BatchDetectTargetedSentiment" ~service ~context ~input
      ~output_deserializer:Json_deserializers.batch_detect_targeted_sentiment_response_of_yojson
      ~error_deserializer
end

module ClassifyDocument = struct
  let error_to_string = function
    | `InternalServerException _ -> "com.amazonaws.comprehend#InternalServerException"
    | `InvalidRequestException _ -> "com.amazonaws.comprehend#InvalidRequestException"
    | `ResourceUnavailableException _ -> "com.amazonaws.comprehend#ResourceUnavailableException"
    | `TextSizeLimitExceededException _ -> "com.amazonaws.comprehend#TextSizeLimitExceededException"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "InternalServerException" ->
          `InternalServerException
            (Json_deserializers.internal_server_exception_of_yojson tree path)
      | _, "InvalidRequestException" ->
          `InvalidRequestException
            (Json_deserializers.invalid_request_exception_of_yojson tree path)
      | _, "ResourceUnavailableException" ->
          `ResourceUnavailableException
            (Json_deserializers.resource_unavailable_exception_of_yojson tree path)
      | _, "TextSizeLimitExceededException" ->
          `TextSizeLimitExceededException
            (Json_deserializers.text_size_limit_exceeded_exception_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : classify_document_request) =
    let input = Json_serializers.classify_document_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"Comprehend_20171127.ClassifyDocument" ~service
      ~context ~input ~output_deserializer:Json_deserializers.classify_document_response_of_yojson
      ~error_deserializer

  let request_with_metadata context (request : classify_document_request) =
    let input = Json_serializers.classify_document_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata
      ~shape_name:"Comprehend_20171127.ClassifyDocument" ~service ~context ~input
      ~output_deserializer:Json_deserializers.classify_document_response_of_yojson
      ~error_deserializer
end

module ContainsPiiEntities = struct
  let error_to_string = function
    | `InternalServerException _ -> "com.amazonaws.comprehend#InternalServerException"
    | `InvalidRequestException _ -> "com.amazonaws.comprehend#InvalidRequestException"
    | `TextSizeLimitExceededException _ -> "com.amazonaws.comprehend#TextSizeLimitExceededException"
    | `UnsupportedLanguageException _ -> "com.amazonaws.comprehend#UnsupportedLanguageException"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "InternalServerException" ->
          `InternalServerException
            (Json_deserializers.internal_server_exception_of_yojson tree path)
      | _, "InvalidRequestException" ->
          `InvalidRequestException
            (Json_deserializers.invalid_request_exception_of_yojson tree path)
      | _, "TextSizeLimitExceededException" ->
          `TextSizeLimitExceededException
            (Json_deserializers.text_size_limit_exceeded_exception_of_yojson tree path)
      | _, "UnsupportedLanguageException" ->
          `UnsupportedLanguageException
            (Json_deserializers.unsupported_language_exception_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : contains_pii_entities_request) =
    let input = Json_serializers.contains_pii_entities_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"Comprehend_20171127.ContainsPiiEntities"
      ~service ~context ~input
      ~output_deserializer:Json_deserializers.contains_pii_entities_response_of_yojson
      ~error_deserializer

  let request_with_metadata context (request : contains_pii_entities_request) =
    let input = Json_serializers.contains_pii_entities_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata
      ~shape_name:"Comprehend_20171127.ContainsPiiEntities" ~service ~context ~input
      ~output_deserializer:Json_deserializers.contains_pii_entities_response_of_yojson
      ~error_deserializer
end

module CreateDataset = struct
  let error_to_string = function
    | `InternalServerException _ -> "com.amazonaws.comprehend#InternalServerException"
    | `InvalidRequestException _ -> "com.amazonaws.comprehend#InvalidRequestException"
    | `ResourceInUseException _ -> "com.amazonaws.comprehend#ResourceInUseException"
    | `ResourceLimitExceededException _ -> "com.amazonaws.comprehend#ResourceLimitExceededException"
    | `ResourceNotFoundException _ -> "com.amazonaws.comprehend#ResourceNotFoundException"
    | `TooManyRequestsException _ -> "com.amazonaws.comprehend#TooManyRequestsException"
    | `TooManyTagsException _ -> "com.amazonaws.comprehend#TooManyTagsException"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "InternalServerException" ->
          `InternalServerException
            (Json_deserializers.internal_server_exception_of_yojson tree path)
      | _, "InvalidRequestException" ->
          `InvalidRequestException
            (Json_deserializers.invalid_request_exception_of_yojson tree path)
      | _, "ResourceInUseException" ->
          `ResourceInUseException (Json_deserializers.resource_in_use_exception_of_yojson tree path)
      | _, "ResourceLimitExceededException" ->
          `ResourceLimitExceededException
            (Json_deserializers.resource_limit_exceeded_exception_of_yojson tree path)
      | _, "ResourceNotFoundException" ->
          `ResourceNotFoundException
            (Json_deserializers.resource_not_found_exception_of_yojson tree path)
      | _, "TooManyRequestsException" ->
          `TooManyRequestsException
            (Json_deserializers.too_many_requests_exception_of_yojson tree path)
      | _, "TooManyTagsException" ->
          `TooManyTagsException (Json_deserializers.too_many_tags_exception_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : create_dataset_request) =
    let input = Json_serializers.create_dataset_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"Comprehend_20171127.CreateDataset" ~service
      ~context ~input ~output_deserializer:Json_deserializers.create_dataset_response_of_yojson
      ~error_deserializer

  let request_with_metadata context (request : create_dataset_request) =
    let input = Json_serializers.create_dataset_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata
      ~shape_name:"Comprehend_20171127.CreateDataset" ~service ~context ~input
      ~output_deserializer:Json_deserializers.create_dataset_response_of_yojson ~error_deserializer
end

module CreateDocumentClassifier = struct
  let error_to_string = function
    | `InternalServerException _ -> "com.amazonaws.comprehend#InternalServerException"
    | `InvalidRequestException _ -> "com.amazonaws.comprehend#InvalidRequestException"
    | `KmsKeyValidationException _ -> "com.amazonaws.comprehend#KmsKeyValidationException"
    | `ResourceInUseException _ -> "com.amazonaws.comprehend#ResourceInUseException"
    | `ResourceLimitExceededException _ -> "com.amazonaws.comprehend#ResourceLimitExceededException"
    | `TooManyRequestsException _ -> "com.amazonaws.comprehend#TooManyRequestsException"
    | `TooManyTagsException _ -> "com.amazonaws.comprehend#TooManyTagsException"
    | `UnsupportedLanguageException _ -> "com.amazonaws.comprehend#UnsupportedLanguageException"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "InternalServerException" ->
          `InternalServerException
            (Json_deserializers.internal_server_exception_of_yojson tree path)
      | _, "InvalidRequestException" ->
          `InvalidRequestException
            (Json_deserializers.invalid_request_exception_of_yojson tree path)
      | _, "KmsKeyValidationException" ->
          `KmsKeyValidationException
            (Json_deserializers.kms_key_validation_exception_of_yojson tree path)
      | _, "ResourceInUseException" ->
          `ResourceInUseException (Json_deserializers.resource_in_use_exception_of_yojson tree path)
      | _, "ResourceLimitExceededException" ->
          `ResourceLimitExceededException
            (Json_deserializers.resource_limit_exceeded_exception_of_yojson tree path)
      | _, "TooManyRequestsException" ->
          `TooManyRequestsException
            (Json_deserializers.too_many_requests_exception_of_yojson tree path)
      | _, "TooManyTagsException" ->
          `TooManyTagsException (Json_deserializers.too_many_tags_exception_of_yojson tree path)
      | _, "UnsupportedLanguageException" ->
          `UnsupportedLanguageException
            (Json_deserializers.unsupported_language_exception_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : create_document_classifier_request) =
    let input = Json_serializers.create_document_classifier_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"Comprehend_20171127.CreateDocumentClassifier"
      ~service ~context ~input
      ~output_deserializer:Json_deserializers.create_document_classifier_response_of_yojson
      ~error_deserializer

  let request_with_metadata context (request : create_document_classifier_request) =
    let input = Json_serializers.create_document_classifier_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata
      ~shape_name:"Comprehend_20171127.CreateDocumentClassifier" ~service ~context ~input
      ~output_deserializer:Json_deserializers.create_document_classifier_response_of_yojson
      ~error_deserializer
end

module CreateEndpoint = struct
  let error_to_string = function
    | `InternalServerException _ -> "com.amazonaws.comprehend#InternalServerException"
    | `InvalidRequestException _ -> "com.amazonaws.comprehend#InvalidRequestException"
    | `ResourceInUseException _ -> "com.amazonaws.comprehend#ResourceInUseException"
    | `ResourceLimitExceededException _ -> "com.amazonaws.comprehend#ResourceLimitExceededException"
    | `ResourceNotFoundException _ -> "com.amazonaws.comprehend#ResourceNotFoundException"
    | `ResourceUnavailableException _ -> "com.amazonaws.comprehend#ResourceUnavailableException"
    | `TooManyRequestsException _ -> "com.amazonaws.comprehend#TooManyRequestsException"
    | `TooManyTagsException _ -> "com.amazonaws.comprehend#TooManyTagsException"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "InternalServerException" ->
          `InternalServerException
            (Json_deserializers.internal_server_exception_of_yojson tree path)
      | _, "InvalidRequestException" ->
          `InvalidRequestException
            (Json_deserializers.invalid_request_exception_of_yojson tree path)
      | _, "ResourceInUseException" ->
          `ResourceInUseException (Json_deserializers.resource_in_use_exception_of_yojson tree path)
      | _, "ResourceLimitExceededException" ->
          `ResourceLimitExceededException
            (Json_deserializers.resource_limit_exceeded_exception_of_yojson tree path)
      | _, "ResourceNotFoundException" ->
          `ResourceNotFoundException
            (Json_deserializers.resource_not_found_exception_of_yojson tree path)
      | _, "ResourceUnavailableException" ->
          `ResourceUnavailableException
            (Json_deserializers.resource_unavailable_exception_of_yojson tree path)
      | _, "TooManyRequestsException" ->
          `TooManyRequestsException
            (Json_deserializers.too_many_requests_exception_of_yojson tree path)
      | _, "TooManyTagsException" ->
          `TooManyTagsException (Json_deserializers.too_many_tags_exception_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : create_endpoint_request) =
    let input = Json_serializers.create_endpoint_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"Comprehend_20171127.CreateEndpoint" ~service
      ~context ~input ~output_deserializer:Json_deserializers.create_endpoint_response_of_yojson
      ~error_deserializer

  let request_with_metadata context (request : create_endpoint_request) =
    let input = Json_serializers.create_endpoint_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata
      ~shape_name:"Comprehend_20171127.CreateEndpoint" ~service ~context ~input
      ~output_deserializer:Json_deserializers.create_endpoint_response_of_yojson ~error_deserializer
end

module CreateEntityRecognizer = struct
  let error_to_string = function
    | `InternalServerException _ -> "com.amazonaws.comprehend#InternalServerException"
    | `InvalidRequestException _ -> "com.amazonaws.comprehend#InvalidRequestException"
    | `KmsKeyValidationException _ -> "com.amazonaws.comprehend#KmsKeyValidationException"
    | `ResourceInUseException _ -> "com.amazonaws.comprehend#ResourceInUseException"
    | `ResourceLimitExceededException _ -> "com.amazonaws.comprehend#ResourceLimitExceededException"
    | `TooManyRequestsException _ -> "com.amazonaws.comprehend#TooManyRequestsException"
    | `TooManyTagsException _ -> "com.amazonaws.comprehend#TooManyTagsException"
    | `UnsupportedLanguageException _ -> "com.amazonaws.comprehend#UnsupportedLanguageException"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "InternalServerException" ->
          `InternalServerException
            (Json_deserializers.internal_server_exception_of_yojson tree path)
      | _, "InvalidRequestException" ->
          `InvalidRequestException
            (Json_deserializers.invalid_request_exception_of_yojson tree path)
      | _, "KmsKeyValidationException" ->
          `KmsKeyValidationException
            (Json_deserializers.kms_key_validation_exception_of_yojson tree path)
      | _, "ResourceInUseException" ->
          `ResourceInUseException (Json_deserializers.resource_in_use_exception_of_yojson tree path)
      | _, "ResourceLimitExceededException" ->
          `ResourceLimitExceededException
            (Json_deserializers.resource_limit_exceeded_exception_of_yojson tree path)
      | _, "TooManyRequestsException" ->
          `TooManyRequestsException
            (Json_deserializers.too_many_requests_exception_of_yojson tree path)
      | _, "TooManyTagsException" ->
          `TooManyTagsException (Json_deserializers.too_many_tags_exception_of_yojson tree path)
      | _, "UnsupportedLanguageException" ->
          `UnsupportedLanguageException
            (Json_deserializers.unsupported_language_exception_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : create_entity_recognizer_request) =
    let input = Json_serializers.create_entity_recognizer_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"Comprehend_20171127.CreateEntityRecognizer"
      ~service ~context ~input
      ~output_deserializer:Json_deserializers.create_entity_recognizer_response_of_yojson
      ~error_deserializer

  let request_with_metadata context (request : create_entity_recognizer_request) =
    let input = Json_serializers.create_entity_recognizer_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata
      ~shape_name:"Comprehend_20171127.CreateEntityRecognizer" ~service ~context ~input
      ~output_deserializer:Json_deserializers.create_entity_recognizer_response_of_yojson
      ~error_deserializer
end

module CreateFlywheel = struct
  let error_to_string = function
    | `InternalServerException _ -> "com.amazonaws.comprehend#InternalServerException"
    | `InvalidRequestException _ -> "com.amazonaws.comprehend#InvalidRequestException"
    | `KmsKeyValidationException _ -> "com.amazonaws.comprehend#KmsKeyValidationException"
    | `ResourceInUseException _ -> "com.amazonaws.comprehend#ResourceInUseException"
    | `ResourceLimitExceededException _ -> "com.amazonaws.comprehend#ResourceLimitExceededException"
    | `ResourceNotFoundException _ -> "com.amazonaws.comprehend#ResourceNotFoundException"
    | `ResourceUnavailableException _ -> "com.amazonaws.comprehend#ResourceUnavailableException"
    | `TooManyRequestsException _ -> "com.amazonaws.comprehend#TooManyRequestsException"
    | `TooManyTagsException _ -> "com.amazonaws.comprehend#TooManyTagsException"
    | `UnsupportedLanguageException _ -> "com.amazonaws.comprehend#UnsupportedLanguageException"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "InternalServerException" ->
          `InternalServerException
            (Json_deserializers.internal_server_exception_of_yojson tree path)
      | _, "InvalidRequestException" ->
          `InvalidRequestException
            (Json_deserializers.invalid_request_exception_of_yojson tree path)
      | _, "KmsKeyValidationException" ->
          `KmsKeyValidationException
            (Json_deserializers.kms_key_validation_exception_of_yojson tree path)
      | _, "ResourceInUseException" ->
          `ResourceInUseException (Json_deserializers.resource_in_use_exception_of_yojson tree path)
      | _, "ResourceLimitExceededException" ->
          `ResourceLimitExceededException
            (Json_deserializers.resource_limit_exceeded_exception_of_yojson tree path)
      | _, "ResourceNotFoundException" ->
          `ResourceNotFoundException
            (Json_deserializers.resource_not_found_exception_of_yojson tree path)
      | _, "ResourceUnavailableException" ->
          `ResourceUnavailableException
            (Json_deserializers.resource_unavailable_exception_of_yojson tree path)
      | _, "TooManyRequestsException" ->
          `TooManyRequestsException
            (Json_deserializers.too_many_requests_exception_of_yojson tree path)
      | _, "TooManyTagsException" ->
          `TooManyTagsException (Json_deserializers.too_many_tags_exception_of_yojson tree path)
      | _, "UnsupportedLanguageException" ->
          `UnsupportedLanguageException
            (Json_deserializers.unsupported_language_exception_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : create_flywheel_request) =
    let input = Json_serializers.create_flywheel_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"Comprehend_20171127.CreateFlywheel" ~service
      ~context ~input ~output_deserializer:Json_deserializers.create_flywheel_response_of_yojson
      ~error_deserializer

  let request_with_metadata context (request : create_flywheel_request) =
    let input = Json_serializers.create_flywheel_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata
      ~shape_name:"Comprehend_20171127.CreateFlywheel" ~service ~context ~input
      ~output_deserializer:Json_deserializers.create_flywheel_response_of_yojson ~error_deserializer
end

module DeleteDocumentClassifier = struct
  let error_to_string = function
    | `InternalServerException _ -> "com.amazonaws.comprehend#InternalServerException"
    | `InvalidRequestException _ -> "com.amazonaws.comprehend#InvalidRequestException"
    | `ResourceInUseException _ -> "com.amazonaws.comprehend#ResourceInUseException"
    | `ResourceNotFoundException _ -> "com.amazonaws.comprehend#ResourceNotFoundException"
    | `ResourceUnavailableException _ -> "com.amazonaws.comprehend#ResourceUnavailableException"
    | `TooManyRequestsException _ -> "com.amazonaws.comprehend#TooManyRequestsException"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "InternalServerException" ->
          `InternalServerException
            (Json_deserializers.internal_server_exception_of_yojson tree path)
      | _, "InvalidRequestException" ->
          `InvalidRequestException
            (Json_deserializers.invalid_request_exception_of_yojson tree path)
      | _, "ResourceInUseException" ->
          `ResourceInUseException (Json_deserializers.resource_in_use_exception_of_yojson tree path)
      | _, "ResourceNotFoundException" ->
          `ResourceNotFoundException
            (Json_deserializers.resource_not_found_exception_of_yojson tree path)
      | _, "ResourceUnavailableException" ->
          `ResourceUnavailableException
            (Json_deserializers.resource_unavailable_exception_of_yojson tree path)
      | _, "TooManyRequestsException" ->
          `TooManyRequestsException
            (Json_deserializers.too_many_requests_exception_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : delete_document_classifier_request) =
    let input = Json_serializers.delete_document_classifier_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"Comprehend_20171127.DeleteDocumentClassifier"
      ~service ~context ~input
      ~output_deserializer:Json_deserializers.delete_document_classifier_response_of_yojson
      ~error_deserializer

  let request_with_metadata context (request : delete_document_classifier_request) =
    let input = Json_serializers.delete_document_classifier_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata
      ~shape_name:"Comprehend_20171127.DeleteDocumentClassifier" ~service ~context ~input
      ~output_deserializer:Json_deserializers.delete_document_classifier_response_of_yojson
      ~error_deserializer
end

module DeleteEndpoint = struct
  let error_to_string = function
    | `InternalServerException _ -> "com.amazonaws.comprehend#InternalServerException"
    | `InvalidRequestException _ -> "com.amazonaws.comprehend#InvalidRequestException"
    | `ResourceInUseException _ -> "com.amazonaws.comprehend#ResourceInUseException"
    | `ResourceNotFoundException _ -> "com.amazonaws.comprehend#ResourceNotFoundException"
    | `TooManyRequestsException _ -> "com.amazonaws.comprehend#TooManyRequestsException"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "InternalServerException" ->
          `InternalServerException
            (Json_deserializers.internal_server_exception_of_yojson tree path)
      | _, "InvalidRequestException" ->
          `InvalidRequestException
            (Json_deserializers.invalid_request_exception_of_yojson tree path)
      | _, "ResourceInUseException" ->
          `ResourceInUseException (Json_deserializers.resource_in_use_exception_of_yojson tree path)
      | _, "ResourceNotFoundException" ->
          `ResourceNotFoundException
            (Json_deserializers.resource_not_found_exception_of_yojson tree path)
      | _, "TooManyRequestsException" ->
          `TooManyRequestsException
            (Json_deserializers.too_many_requests_exception_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : delete_endpoint_request) =
    let input = Json_serializers.delete_endpoint_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"Comprehend_20171127.DeleteEndpoint" ~service
      ~context ~input ~output_deserializer:Json_deserializers.delete_endpoint_response_of_yojson
      ~error_deserializer

  let request_with_metadata context (request : delete_endpoint_request) =
    let input = Json_serializers.delete_endpoint_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata
      ~shape_name:"Comprehend_20171127.DeleteEndpoint" ~service ~context ~input
      ~output_deserializer:Json_deserializers.delete_endpoint_response_of_yojson ~error_deserializer
end

module DeleteEntityRecognizer = struct
  let error_to_string = function
    | `InternalServerException _ -> "com.amazonaws.comprehend#InternalServerException"
    | `InvalidRequestException _ -> "com.amazonaws.comprehend#InvalidRequestException"
    | `ResourceInUseException _ -> "com.amazonaws.comprehend#ResourceInUseException"
    | `ResourceNotFoundException _ -> "com.amazonaws.comprehend#ResourceNotFoundException"
    | `ResourceUnavailableException _ -> "com.amazonaws.comprehend#ResourceUnavailableException"
    | `TooManyRequestsException _ -> "com.amazonaws.comprehend#TooManyRequestsException"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "InternalServerException" ->
          `InternalServerException
            (Json_deserializers.internal_server_exception_of_yojson tree path)
      | _, "InvalidRequestException" ->
          `InvalidRequestException
            (Json_deserializers.invalid_request_exception_of_yojson tree path)
      | _, "ResourceInUseException" ->
          `ResourceInUseException (Json_deserializers.resource_in_use_exception_of_yojson tree path)
      | _, "ResourceNotFoundException" ->
          `ResourceNotFoundException
            (Json_deserializers.resource_not_found_exception_of_yojson tree path)
      | _, "ResourceUnavailableException" ->
          `ResourceUnavailableException
            (Json_deserializers.resource_unavailable_exception_of_yojson tree path)
      | _, "TooManyRequestsException" ->
          `TooManyRequestsException
            (Json_deserializers.too_many_requests_exception_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : delete_entity_recognizer_request) =
    let input = Json_serializers.delete_entity_recognizer_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"Comprehend_20171127.DeleteEntityRecognizer"
      ~service ~context ~input
      ~output_deserializer:Json_deserializers.delete_entity_recognizer_response_of_yojson
      ~error_deserializer

  let request_with_metadata context (request : delete_entity_recognizer_request) =
    let input = Json_serializers.delete_entity_recognizer_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata
      ~shape_name:"Comprehend_20171127.DeleteEntityRecognizer" ~service ~context ~input
      ~output_deserializer:Json_deserializers.delete_entity_recognizer_response_of_yojson
      ~error_deserializer
end

module DeleteFlywheel = struct
  let error_to_string = function
    | `InternalServerException _ -> "com.amazonaws.comprehend#InternalServerException"
    | `InvalidRequestException _ -> "com.amazonaws.comprehend#InvalidRequestException"
    | `ResourceInUseException _ -> "com.amazonaws.comprehend#ResourceInUseException"
    | `ResourceNotFoundException _ -> "com.amazonaws.comprehend#ResourceNotFoundException"
    | `ResourceUnavailableException _ -> "com.amazonaws.comprehend#ResourceUnavailableException"
    | `TooManyRequestsException _ -> "com.amazonaws.comprehend#TooManyRequestsException"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "InternalServerException" ->
          `InternalServerException
            (Json_deserializers.internal_server_exception_of_yojson tree path)
      | _, "InvalidRequestException" ->
          `InvalidRequestException
            (Json_deserializers.invalid_request_exception_of_yojson tree path)
      | _, "ResourceInUseException" ->
          `ResourceInUseException (Json_deserializers.resource_in_use_exception_of_yojson tree path)
      | _, "ResourceNotFoundException" ->
          `ResourceNotFoundException
            (Json_deserializers.resource_not_found_exception_of_yojson tree path)
      | _, "ResourceUnavailableException" ->
          `ResourceUnavailableException
            (Json_deserializers.resource_unavailable_exception_of_yojson tree path)
      | _, "TooManyRequestsException" ->
          `TooManyRequestsException
            (Json_deserializers.too_many_requests_exception_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : delete_flywheel_request) =
    let input = Json_serializers.delete_flywheel_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"Comprehend_20171127.DeleteFlywheel" ~service
      ~context ~input ~output_deserializer:Json_deserializers.delete_flywheel_response_of_yojson
      ~error_deserializer

  let request_with_metadata context (request : delete_flywheel_request) =
    let input = Json_serializers.delete_flywheel_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata
      ~shape_name:"Comprehend_20171127.DeleteFlywheel" ~service ~context ~input
      ~output_deserializer:Json_deserializers.delete_flywheel_response_of_yojson ~error_deserializer
end

module DeleteResourcePolicy = struct
  let error_to_string = function
    | `InternalServerException _ -> "com.amazonaws.comprehend#InternalServerException"
    | `InvalidRequestException _ -> "com.amazonaws.comprehend#InvalidRequestException"
    | `ResourceNotFoundException _ -> "com.amazonaws.comprehend#ResourceNotFoundException"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
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

  let request context (request : delete_resource_policy_request) =
    let input = Json_serializers.delete_resource_policy_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"Comprehend_20171127.DeleteResourcePolicy"
      ~service ~context ~input
      ~output_deserializer:Json_deserializers.delete_resource_policy_response_of_yojson
      ~error_deserializer

  let request_with_metadata context (request : delete_resource_policy_request) =
    let input = Json_serializers.delete_resource_policy_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata
      ~shape_name:"Comprehend_20171127.DeleteResourcePolicy" ~service ~context ~input
      ~output_deserializer:Json_deserializers.delete_resource_policy_response_of_yojson
      ~error_deserializer
end

module DescribeDataset = struct
  let error_to_string = function
    | `InternalServerException _ -> "com.amazonaws.comprehend#InternalServerException"
    | `InvalidRequestException _ -> "com.amazonaws.comprehend#InvalidRequestException"
    | `ResourceNotFoundException _ -> "com.amazonaws.comprehend#ResourceNotFoundException"
    | `TooManyRequestsException _ -> "com.amazonaws.comprehend#TooManyRequestsException"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "InternalServerException" ->
          `InternalServerException
            (Json_deserializers.internal_server_exception_of_yojson tree path)
      | _, "InvalidRequestException" ->
          `InvalidRequestException
            (Json_deserializers.invalid_request_exception_of_yojson tree path)
      | _, "ResourceNotFoundException" ->
          `ResourceNotFoundException
            (Json_deserializers.resource_not_found_exception_of_yojson tree path)
      | _, "TooManyRequestsException" ->
          `TooManyRequestsException
            (Json_deserializers.too_many_requests_exception_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : describe_dataset_request) =
    let input = Json_serializers.describe_dataset_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"Comprehend_20171127.DescribeDataset" ~service
      ~context ~input ~output_deserializer:Json_deserializers.describe_dataset_response_of_yojson
      ~error_deserializer

  let request_with_metadata context (request : describe_dataset_request) =
    let input = Json_serializers.describe_dataset_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata
      ~shape_name:"Comprehend_20171127.DescribeDataset" ~service ~context ~input
      ~output_deserializer:Json_deserializers.describe_dataset_response_of_yojson
      ~error_deserializer
end

module DescribeDocumentClassificationJob = struct
  let error_to_string = function
    | `InternalServerException _ -> "com.amazonaws.comprehend#InternalServerException"
    | `InvalidRequestException _ -> "com.amazonaws.comprehend#InvalidRequestException"
    | `JobNotFoundException _ -> "com.amazonaws.comprehend#JobNotFoundException"
    | `TooManyRequestsException _ -> "com.amazonaws.comprehend#TooManyRequestsException"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "InternalServerException" ->
          `InternalServerException
            (Json_deserializers.internal_server_exception_of_yojson tree path)
      | _, "InvalidRequestException" ->
          `InvalidRequestException
            (Json_deserializers.invalid_request_exception_of_yojson tree path)
      | _, "JobNotFoundException" ->
          `JobNotFoundException (Json_deserializers.job_not_found_exception_of_yojson tree path)
      | _, "TooManyRequestsException" ->
          `TooManyRequestsException
            (Json_deserializers.too_many_requests_exception_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : describe_document_classification_job_request) =
    let input = Json_serializers.describe_document_classification_job_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request
      ~shape_name:"Comprehend_20171127.DescribeDocumentClassificationJob" ~service ~context ~input
      ~output_deserializer:
        Json_deserializers.describe_document_classification_job_response_of_yojson
      ~error_deserializer

  let request_with_metadata context (request : describe_document_classification_job_request) =
    let input = Json_serializers.describe_document_classification_job_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata
      ~shape_name:"Comprehend_20171127.DescribeDocumentClassificationJob" ~service ~context ~input
      ~output_deserializer:
        Json_deserializers.describe_document_classification_job_response_of_yojson
      ~error_deserializer
end

module DescribeDocumentClassifier = struct
  let error_to_string = function
    | `InternalServerException _ -> "com.amazonaws.comprehend#InternalServerException"
    | `InvalidRequestException _ -> "com.amazonaws.comprehend#InvalidRequestException"
    | `ResourceNotFoundException _ -> "com.amazonaws.comprehend#ResourceNotFoundException"
    | `TooManyRequestsException _ -> "com.amazonaws.comprehend#TooManyRequestsException"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "InternalServerException" ->
          `InternalServerException
            (Json_deserializers.internal_server_exception_of_yojson tree path)
      | _, "InvalidRequestException" ->
          `InvalidRequestException
            (Json_deserializers.invalid_request_exception_of_yojson tree path)
      | _, "ResourceNotFoundException" ->
          `ResourceNotFoundException
            (Json_deserializers.resource_not_found_exception_of_yojson tree path)
      | _, "TooManyRequestsException" ->
          `TooManyRequestsException
            (Json_deserializers.too_many_requests_exception_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : describe_document_classifier_request) =
    let input = Json_serializers.describe_document_classifier_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"Comprehend_20171127.DescribeDocumentClassifier"
      ~service ~context ~input
      ~output_deserializer:Json_deserializers.describe_document_classifier_response_of_yojson
      ~error_deserializer

  let request_with_metadata context (request : describe_document_classifier_request) =
    let input = Json_serializers.describe_document_classifier_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata
      ~shape_name:"Comprehend_20171127.DescribeDocumentClassifier" ~service ~context ~input
      ~output_deserializer:Json_deserializers.describe_document_classifier_response_of_yojson
      ~error_deserializer
end

module DescribeDominantLanguageDetectionJob = struct
  let error_to_string = function
    | `InternalServerException _ -> "com.amazonaws.comprehend#InternalServerException"
    | `InvalidRequestException _ -> "com.amazonaws.comprehend#InvalidRequestException"
    | `JobNotFoundException _ -> "com.amazonaws.comprehend#JobNotFoundException"
    | `TooManyRequestsException _ -> "com.amazonaws.comprehend#TooManyRequestsException"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "InternalServerException" ->
          `InternalServerException
            (Json_deserializers.internal_server_exception_of_yojson tree path)
      | _, "InvalidRequestException" ->
          `InvalidRequestException
            (Json_deserializers.invalid_request_exception_of_yojson tree path)
      | _, "JobNotFoundException" ->
          `JobNotFoundException (Json_deserializers.job_not_found_exception_of_yojson tree path)
      | _, "TooManyRequestsException" ->
          `TooManyRequestsException
            (Json_deserializers.too_many_requests_exception_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : describe_dominant_language_detection_job_request) =
    let input =
      Json_serializers.describe_dominant_language_detection_job_request_to_yojson request
    in
    Smaws_Lib.Protocols.AwsJson.request
      ~shape_name:"Comprehend_20171127.DescribeDominantLanguageDetectionJob" ~service ~context
      ~input
      ~output_deserializer:
        Json_deserializers.describe_dominant_language_detection_job_response_of_yojson
      ~error_deserializer

  let request_with_metadata context (request : describe_dominant_language_detection_job_request) =
    let input =
      Json_serializers.describe_dominant_language_detection_job_request_to_yojson request
    in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata
      ~shape_name:"Comprehend_20171127.DescribeDominantLanguageDetectionJob" ~service ~context
      ~input
      ~output_deserializer:
        Json_deserializers.describe_dominant_language_detection_job_response_of_yojson
      ~error_deserializer
end

module DescribeEndpoint = struct
  let error_to_string = function
    | `InternalServerException _ -> "com.amazonaws.comprehend#InternalServerException"
    | `InvalidRequestException _ -> "com.amazonaws.comprehend#InvalidRequestException"
    | `ResourceNotFoundException _ -> "com.amazonaws.comprehend#ResourceNotFoundException"
    | `TooManyRequestsException _ -> "com.amazonaws.comprehend#TooManyRequestsException"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "InternalServerException" ->
          `InternalServerException
            (Json_deserializers.internal_server_exception_of_yojson tree path)
      | _, "InvalidRequestException" ->
          `InvalidRequestException
            (Json_deserializers.invalid_request_exception_of_yojson tree path)
      | _, "ResourceNotFoundException" ->
          `ResourceNotFoundException
            (Json_deserializers.resource_not_found_exception_of_yojson tree path)
      | _, "TooManyRequestsException" ->
          `TooManyRequestsException
            (Json_deserializers.too_many_requests_exception_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : describe_endpoint_request) =
    let input = Json_serializers.describe_endpoint_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"Comprehend_20171127.DescribeEndpoint" ~service
      ~context ~input ~output_deserializer:Json_deserializers.describe_endpoint_response_of_yojson
      ~error_deserializer

  let request_with_metadata context (request : describe_endpoint_request) =
    let input = Json_serializers.describe_endpoint_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata
      ~shape_name:"Comprehend_20171127.DescribeEndpoint" ~service ~context ~input
      ~output_deserializer:Json_deserializers.describe_endpoint_response_of_yojson
      ~error_deserializer
end

module DescribeEntitiesDetectionJob = struct
  let error_to_string = function
    | `InternalServerException _ -> "com.amazonaws.comprehend#InternalServerException"
    | `InvalidRequestException _ -> "com.amazonaws.comprehend#InvalidRequestException"
    | `JobNotFoundException _ -> "com.amazonaws.comprehend#JobNotFoundException"
    | `TooManyRequestsException _ -> "com.amazonaws.comprehend#TooManyRequestsException"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "InternalServerException" ->
          `InternalServerException
            (Json_deserializers.internal_server_exception_of_yojson tree path)
      | _, "InvalidRequestException" ->
          `InvalidRequestException
            (Json_deserializers.invalid_request_exception_of_yojson tree path)
      | _, "JobNotFoundException" ->
          `JobNotFoundException (Json_deserializers.job_not_found_exception_of_yojson tree path)
      | _, "TooManyRequestsException" ->
          `TooManyRequestsException
            (Json_deserializers.too_many_requests_exception_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : describe_entities_detection_job_request) =
    let input = Json_serializers.describe_entities_detection_job_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request
      ~shape_name:"Comprehend_20171127.DescribeEntitiesDetectionJob" ~service ~context ~input
      ~output_deserializer:Json_deserializers.describe_entities_detection_job_response_of_yojson
      ~error_deserializer

  let request_with_metadata context (request : describe_entities_detection_job_request) =
    let input = Json_serializers.describe_entities_detection_job_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata
      ~shape_name:"Comprehend_20171127.DescribeEntitiesDetectionJob" ~service ~context ~input
      ~output_deserializer:Json_deserializers.describe_entities_detection_job_response_of_yojson
      ~error_deserializer
end

module DescribeEntityRecognizer = struct
  let error_to_string = function
    | `InternalServerException _ -> "com.amazonaws.comprehend#InternalServerException"
    | `InvalidRequestException _ -> "com.amazonaws.comprehend#InvalidRequestException"
    | `ResourceNotFoundException _ -> "com.amazonaws.comprehend#ResourceNotFoundException"
    | `TooManyRequestsException _ -> "com.amazonaws.comprehend#TooManyRequestsException"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "InternalServerException" ->
          `InternalServerException
            (Json_deserializers.internal_server_exception_of_yojson tree path)
      | _, "InvalidRequestException" ->
          `InvalidRequestException
            (Json_deserializers.invalid_request_exception_of_yojson tree path)
      | _, "ResourceNotFoundException" ->
          `ResourceNotFoundException
            (Json_deserializers.resource_not_found_exception_of_yojson tree path)
      | _, "TooManyRequestsException" ->
          `TooManyRequestsException
            (Json_deserializers.too_many_requests_exception_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : describe_entity_recognizer_request) =
    let input = Json_serializers.describe_entity_recognizer_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"Comprehend_20171127.DescribeEntityRecognizer"
      ~service ~context ~input
      ~output_deserializer:Json_deserializers.describe_entity_recognizer_response_of_yojson
      ~error_deserializer

  let request_with_metadata context (request : describe_entity_recognizer_request) =
    let input = Json_serializers.describe_entity_recognizer_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata
      ~shape_name:"Comprehend_20171127.DescribeEntityRecognizer" ~service ~context ~input
      ~output_deserializer:Json_deserializers.describe_entity_recognizer_response_of_yojson
      ~error_deserializer
end

module DescribeEventsDetectionJob = struct
  let error_to_string = function
    | `InternalServerException _ -> "com.amazonaws.comprehend#InternalServerException"
    | `InvalidRequestException _ -> "com.amazonaws.comprehend#InvalidRequestException"
    | `JobNotFoundException _ -> "com.amazonaws.comprehend#JobNotFoundException"
    | `TooManyRequestsException _ -> "com.amazonaws.comprehend#TooManyRequestsException"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "InternalServerException" ->
          `InternalServerException
            (Json_deserializers.internal_server_exception_of_yojson tree path)
      | _, "InvalidRequestException" ->
          `InvalidRequestException
            (Json_deserializers.invalid_request_exception_of_yojson tree path)
      | _, "JobNotFoundException" ->
          `JobNotFoundException (Json_deserializers.job_not_found_exception_of_yojson tree path)
      | _, "TooManyRequestsException" ->
          `TooManyRequestsException
            (Json_deserializers.too_many_requests_exception_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : describe_events_detection_job_request) =
    let input = Json_serializers.describe_events_detection_job_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"Comprehend_20171127.DescribeEventsDetectionJob"
      ~service ~context ~input
      ~output_deserializer:Json_deserializers.describe_events_detection_job_response_of_yojson
      ~error_deserializer

  let request_with_metadata context (request : describe_events_detection_job_request) =
    let input = Json_serializers.describe_events_detection_job_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata
      ~shape_name:"Comprehend_20171127.DescribeEventsDetectionJob" ~service ~context ~input
      ~output_deserializer:Json_deserializers.describe_events_detection_job_response_of_yojson
      ~error_deserializer
end

module DescribeFlywheel = struct
  let error_to_string = function
    | `InternalServerException _ -> "com.amazonaws.comprehend#InternalServerException"
    | `InvalidRequestException _ -> "com.amazonaws.comprehend#InvalidRequestException"
    | `ResourceNotFoundException _ -> "com.amazonaws.comprehend#ResourceNotFoundException"
    | `TooManyRequestsException _ -> "com.amazonaws.comprehend#TooManyRequestsException"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "InternalServerException" ->
          `InternalServerException
            (Json_deserializers.internal_server_exception_of_yojson tree path)
      | _, "InvalidRequestException" ->
          `InvalidRequestException
            (Json_deserializers.invalid_request_exception_of_yojson tree path)
      | _, "ResourceNotFoundException" ->
          `ResourceNotFoundException
            (Json_deserializers.resource_not_found_exception_of_yojson tree path)
      | _, "TooManyRequestsException" ->
          `TooManyRequestsException
            (Json_deserializers.too_many_requests_exception_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : describe_flywheel_request) =
    let input = Json_serializers.describe_flywheel_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"Comprehend_20171127.DescribeFlywheel" ~service
      ~context ~input ~output_deserializer:Json_deserializers.describe_flywheel_response_of_yojson
      ~error_deserializer

  let request_with_metadata context (request : describe_flywheel_request) =
    let input = Json_serializers.describe_flywheel_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata
      ~shape_name:"Comprehend_20171127.DescribeFlywheel" ~service ~context ~input
      ~output_deserializer:Json_deserializers.describe_flywheel_response_of_yojson
      ~error_deserializer
end

module DescribeFlywheelIteration = struct
  let error_to_string = function
    | `InternalServerException _ -> "com.amazonaws.comprehend#InternalServerException"
    | `InvalidRequestException _ -> "com.amazonaws.comprehend#InvalidRequestException"
    | `ResourceNotFoundException _ -> "com.amazonaws.comprehend#ResourceNotFoundException"
    | `TooManyRequestsException _ -> "com.amazonaws.comprehend#TooManyRequestsException"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "InternalServerException" ->
          `InternalServerException
            (Json_deserializers.internal_server_exception_of_yojson tree path)
      | _, "InvalidRequestException" ->
          `InvalidRequestException
            (Json_deserializers.invalid_request_exception_of_yojson tree path)
      | _, "ResourceNotFoundException" ->
          `ResourceNotFoundException
            (Json_deserializers.resource_not_found_exception_of_yojson tree path)
      | _, "TooManyRequestsException" ->
          `TooManyRequestsException
            (Json_deserializers.too_many_requests_exception_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : describe_flywheel_iteration_request) =
    let input = Json_serializers.describe_flywheel_iteration_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"Comprehend_20171127.DescribeFlywheelIteration"
      ~service ~context ~input
      ~output_deserializer:Json_deserializers.describe_flywheel_iteration_response_of_yojson
      ~error_deserializer

  let request_with_metadata context (request : describe_flywheel_iteration_request) =
    let input = Json_serializers.describe_flywheel_iteration_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata
      ~shape_name:"Comprehend_20171127.DescribeFlywheelIteration" ~service ~context ~input
      ~output_deserializer:Json_deserializers.describe_flywheel_iteration_response_of_yojson
      ~error_deserializer
end

module DescribeKeyPhrasesDetectionJob = struct
  let error_to_string = function
    | `InternalServerException _ -> "com.amazonaws.comprehend#InternalServerException"
    | `InvalidRequestException _ -> "com.amazonaws.comprehend#InvalidRequestException"
    | `JobNotFoundException _ -> "com.amazonaws.comprehend#JobNotFoundException"
    | `TooManyRequestsException _ -> "com.amazonaws.comprehend#TooManyRequestsException"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "InternalServerException" ->
          `InternalServerException
            (Json_deserializers.internal_server_exception_of_yojson tree path)
      | _, "InvalidRequestException" ->
          `InvalidRequestException
            (Json_deserializers.invalid_request_exception_of_yojson tree path)
      | _, "JobNotFoundException" ->
          `JobNotFoundException (Json_deserializers.job_not_found_exception_of_yojson tree path)
      | _, "TooManyRequestsException" ->
          `TooManyRequestsException
            (Json_deserializers.too_many_requests_exception_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : describe_key_phrases_detection_job_request) =
    let input = Json_serializers.describe_key_phrases_detection_job_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request
      ~shape_name:"Comprehend_20171127.DescribeKeyPhrasesDetectionJob" ~service ~context ~input
      ~output_deserializer:Json_deserializers.describe_key_phrases_detection_job_response_of_yojson
      ~error_deserializer

  let request_with_metadata context (request : describe_key_phrases_detection_job_request) =
    let input = Json_serializers.describe_key_phrases_detection_job_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata
      ~shape_name:"Comprehend_20171127.DescribeKeyPhrasesDetectionJob" ~service ~context ~input
      ~output_deserializer:Json_deserializers.describe_key_phrases_detection_job_response_of_yojson
      ~error_deserializer
end

module DescribePiiEntitiesDetectionJob = struct
  let error_to_string = function
    | `InternalServerException _ -> "com.amazonaws.comprehend#InternalServerException"
    | `InvalidRequestException _ -> "com.amazonaws.comprehend#InvalidRequestException"
    | `JobNotFoundException _ -> "com.amazonaws.comprehend#JobNotFoundException"
    | `TooManyRequestsException _ -> "com.amazonaws.comprehend#TooManyRequestsException"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "InternalServerException" ->
          `InternalServerException
            (Json_deserializers.internal_server_exception_of_yojson tree path)
      | _, "InvalidRequestException" ->
          `InvalidRequestException
            (Json_deserializers.invalid_request_exception_of_yojson tree path)
      | _, "JobNotFoundException" ->
          `JobNotFoundException (Json_deserializers.job_not_found_exception_of_yojson tree path)
      | _, "TooManyRequestsException" ->
          `TooManyRequestsException
            (Json_deserializers.too_many_requests_exception_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : describe_pii_entities_detection_job_request) =
    let input = Json_serializers.describe_pii_entities_detection_job_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request
      ~shape_name:"Comprehend_20171127.DescribePiiEntitiesDetectionJob" ~service ~context ~input
      ~output_deserializer:Json_deserializers.describe_pii_entities_detection_job_response_of_yojson
      ~error_deserializer

  let request_with_metadata context (request : describe_pii_entities_detection_job_request) =
    let input = Json_serializers.describe_pii_entities_detection_job_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata
      ~shape_name:"Comprehend_20171127.DescribePiiEntitiesDetectionJob" ~service ~context ~input
      ~output_deserializer:Json_deserializers.describe_pii_entities_detection_job_response_of_yojson
      ~error_deserializer
end

module DescribeResourcePolicy = struct
  let error_to_string = function
    | `InternalServerException _ -> "com.amazonaws.comprehend#InternalServerException"
    | `InvalidRequestException _ -> "com.amazonaws.comprehend#InvalidRequestException"
    | `ResourceNotFoundException _ -> "com.amazonaws.comprehend#ResourceNotFoundException"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
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

  let request context (request : describe_resource_policy_request) =
    let input = Json_serializers.describe_resource_policy_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"Comprehend_20171127.DescribeResourcePolicy"
      ~service ~context ~input
      ~output_deserializer:Json_deserializers.describe_resource_policy_response_of_yojson
      ~error_deserializer

  let request_with_metadata context (request : describe_resource_policy_request) =
    let input = Json_serializers.describe_resource_policy_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata
      ~shape_name:"Comprehend_20171127.DescribeResourcePolicy" ~service ~context ~input
      ~output_deserializer:Json_deserializers.describe_resource_policy_response_of_yojson
      ~error_deserializer
end

module DescribeSentimentDetectionJob = struct
  let error_to_string = function
    | `InternalServerException _ -> "com.amazonaws.comprehend#InternalServerException"
    | `InvalidRequestException _ -> "com.amazonaws.comprehend#InvalidRequestException"
    | `JobNotFoundException _ -> "com.amazonaws.comprehend#JobNotFoundException"
    | `TooManyRequestsException _ -> "com.amazonaws.comprehend#TooManyRequestsException"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "InternalServerException" ->
          `InternalServerException
            (Json_deserializers.internal_server_exception_of_yojson tree path)
      | _, "InvalidRequestException" ->
          `InvalidRequestException
            (Json_deserializers.invalid_request_exception_of_yojson tree path)
      | _, "JobNotFoundException" ->
          `JobNotFoundException (Json_deserializers.job_not_found_exception_of_yojson tree path)
      | _, "TooManyRequestsException" ->
          `TooManyRequestsException
            (Json_deserializers.too_many_requests_exception_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : describe_sentiment_detection_job_request) =
    let input = Json_serializers.describe_sentiment_detection_job_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request
      ~shape_name:"Comprehend_20171127.DescribeSentimentDetectionJob" ~service ~context ~input
      ~output_deserializer:Json_deserializers.describe_sentiment_detection_job_response_of_yojson
      ~error_deserializer

  let request_with_metadata context (request : describe_sentiment_detection_job_request) =
    let input = Json_serializers.describe_sentiment_detection_job_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata
      ~shape_name:"Comprehend_20171127.DescribeSentimentDetectionJob" ~service ~context ~input
      ~output_deserializer:Json_deserializers.describe_sentiment_detection_job_response_of_yojson
      ~error_deserializer
end

module DescribeTargetedSentimentDetectionJob = struct
  let error_to_string = function
    | `InternalServerException _ -> "com.amazonaws.comprehend#InternalServerException"
    | `InvalidRequestException _ -> "com.amazonaws.comprehend#InvalidRequestException"
    | `JobNotFoundException _ -> "com.amazonaws.comprehend#JobNotFoundException"
    | `TooManyRequestsException _ -> "com.amazonaws.comprehend#TooManyRequestsException"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "InternalServerException" ->
          `InternalServerException
            (Json_deserializers.internal_server_exception_of_yojson tree path)
      | _, "InvalidRequestException" ->
          `InvalidRequestException
            (Json_deserializers.invalid_request_exception_of_yojson tree path)
      | _, "JobNotFoundException" ->
          `JobNotFoundException (Json_deserializers.job_not_found_exception_of_yojson tree path)
      | _, "TooManyRequestsException" ->
          `TooManyRequestsException
            (Json_deserializers.too_many_requests_exception_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : describe_targeted_sentiment_detection_job_request) =
    let input =
      Json_serializers.describe_targeted_sentiment_detection_job_request_to_yojson request
    in
    Smaws_Lib.Protocols.AwsJson.request
      ~shape_name:"Comprehend_20171127.DescribeTargetedSentimentDetectionJob" ~service ~context
      ~input
      ~output_deserializer:
        Json_deserializers.describe_targeted_sentiment_detection_job_response_of_yojson
      ~error_deserializer

  let request_with_metadata context (request : describe_targeted_sentiment_detection_job_request) =
    let input =
      Json_serializers.describe_targeted_sentiment_detection_job_request_to_yojson request
    in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata
      ~shape_name:"Comprehend_20171127.DescribeTargetedSentimentDetectionJob" ~service ~context
      ~input
      ~output_deserializer:
        Json_deserializers.describe_targeted_sentiment_detection_job_response_of_yojson
      ~error_deserializer
end

module DescribeTopicsDetectionJob = struct
  let error_to_string = function
    | `InternalServerException _ -> "com.amazonaws.comprehend#InternalServerException"
    | `InvalidRequestException _ -> "com.amazonaws.comprehend#InvalidRequestException"
    | `JobNotFoundException _ -> "com.amazonaws.comprehend#JobNotFoundException"
    | `TooManyRequestsException _ -> "com.amazonaws.comprehend#TooManyRequestsException"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "InternalServerException" ->
          `InternalServerException
            (Json_deserializers.internal_server_exception_of_yojson tree path)
      | _, "InvalidRequestException" ->
          `InvalidRequestException
            (Json_deserializers.invalid_request_exception_of_yojson tree path)
      | _, "JobNotFoundException" ->
          `JobNotFoundException (Json_deserializers.job_not_found_exception_of_yojson tree path)
      | _, "TooManyRequestsException" ->
          `TooManyRequestsException
            (Json_deserializers.too_many_requests_exception_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : describe_topics_detection_job_request) =
    let input = Json_serializers.describe_topics_detection_job_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"Comprehend_20171127.DescribeTopicsDetectionJob"
      ~service ~context ~input
      ~output_deserializer:Json_deserializers.describe_topics_detection_job_response_of_yojson
      ~error_deserializer

  let request_with_metadata context (request : describe_topics_detection_job_request) =
    let input = Json_serializers.describe_topics_detection_job_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata
      ~shape_name:"Comprehend_20171127.DescribeTopicsDetectionJob" ~service ~context ~input
      ~output_deserializer:Json_deserializers.describe_topics_detection_job_response_of_yojson
      ~error_deserializer
end

module DetectDominantLanguage = struct
  let error_to_string = function
    | `InternalServerException _ -> "com.amazonaws.comprehend#InternalServerException"
    | `InvalidRequestException _ -> "com.amazonaws.comprehend#InvalidRequestException"
    | `TextSizeLimitExceededException _ -> "com.amazonaws.comprehend#TextSizeLimitExceededException"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "InternalServerException" ->
          `InternalServerException
            (Json_deserializers.internal_server_exception_of_yojson tree path)
      | _, "InvalidRequestException" ->
          `InvalidRequestException
            (Json_deserializers.invalid_request_exception_of_yojson tree path)
      | _, "TextSizeLimitExceededException" ->
          `TextSizeLimitExceededException
            (Json_deserializers.text_size_limit_exceeded_exception_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : detect_dominant_language_request) =
    let input = Json_serializers.detect_dominant_language_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"Comprehend_20171127.DetectDominantLanguage"
      ~service ~context ~input
      ~output_deserializer:Json_deserializers.detect_dominant_language_response_of_yojson
      ~error_deserializer

  let request_with_metadata context (request : detect_dominant_language_request) =
    let input = Json_serializers.detect_dominant_language_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata
      ~shape_name:"Comprehend_20171127.DetectDominantLanguage" ~service ~context ~input
      ~output_deserializer:Json_deserializers.detect_dominant_language_response_of_yojson
      ~error_deserializer
end

module DetectEntities = struct
  let error_to_string = function
    | `InternalServerException _ -> "com.amazonaws.comprehend#InternalServerException"
    | `InvalidRequestException _ -> "com.amazonaws.comprehend#InvalidRequestException"
    | `ResourceUnavailableException _ -> "com.amazonaws.comprehend#ResourceUnavailableException"
    | `TextSizeLimitExceededException _ -> "com.amazonaws.comprehend#TextSizeLimitExceededException"
    | `UnsupportedLanguageException _ -> "com.amazonaws.comprehend#UnsupportedLanguageException"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "InternalServerException" ->
          `InternalServerException
            (Json_deserializers.internal_server_exception_of_yojson tree path)
      | _, "InvalidRequestException" ->
          `InvalidRequestException
            (Json_deserializers.invalid_request_exception_of_yojson tree path)
      | _, "ResourceUnavailableException" ->
          `ResourceUnavailableException
            (Json_deserializers.resource_unavailable_exception_of_yojson tree path)
      | _, "TextSizeLimitExceededException" ->
          `TextSizeLimitExceededException
            (Json_deserializers.text_size_limit_exceeded_exception_of_yojson tree path)
      | _, "UnsupportedLanguageException" ->
          `UnsupportedLanguageException
            (Json_deserializers.unsupported_language_exception_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : detect_entities_request) =
    let input = Json_serializers.detect_entities_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"Comprehend_20171127.DetectEntities" ~service
      ~context ~input ~output_deserializer:Json_deserializers.detect_entities_response_of_yojson
      ~error_deserializer

  let request_with_metadata context (request : detect_entities_request) =
    let input = Json_serializers.detect_entities_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata
      ~shape_name:"Comprehend_20171127.DetectEntities" ~service ~context ~input
      ~output_deserializer:Json_deserializers.detect_entities_response_of_yojson ~error_deserializer
end

module DetectKeyPhrases = struct
  let error_to_string = function
    | `InternalServerException _ -> "com.amazonaws.comprehend#InternalServerException"
    | `InvalidRequestException _ -> "com.amazonaws.comprehend#InvalidRequestException"
    | `TextSizeLimitExceededException _ -> "com.amazonaws.comprehend#TextSizeLimitExceededException"
    | `UnsupportedLanguageException _ -> "com.amazonaws.comprehend#UnsupportedLanguageException"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "InternalServerException" ->
          `InternalServerException
            (Json_deserializers.internal_server_exception_of_yojson tree path)
      | _, "InvalidRequestException" ->
          `InvalidRequestException
            (Json_deserializers.invalid_request_exception_of_yojson tree path)
      | _, "TextSizeLimitExceededException" ->
          `TextSizeLimitExceededException
            (Json_deserializers.text_size_limit_exceeded_exception_of_yojson tree path)
      | _, "UnsupportedLanguageException" ->
          `UnsupportedLanguageException
            (Json_deserializers.unsupported_language_exception_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : detect_key_phrases_request) =
    let input = Json_serializers.detect_key_phrases_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"Comprehend_20171127.DetectKeyPhrases" ~service
      ~context ~input ~output_deserializer:Json_deserializers.detect_key_phrases_response_of_yojson
      ~error_deserializer

  let request_with_metadata context (request : detect_key_phrases_request) =
    let input = Json_serializers.detect_key_phrases_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata
      ~shape_name:"Comprehend_20171127.DetectKeyPhrases" ~service ~context ~input
      ~output_deserializer:Json_deserializers.detect_key_phrases_response_of_yojson
      ~error_deserializer
end

module DetectPiiEntities = struct
  let error_to_string = function
    | `InternalServerException _ -> "com.amazonaws.comprehend#InternalServerException"
    | `InvalidRequestException _ -> "com.amazonaws.comprehend#InvalidRequestException"
    | `TextSizeLimitExceededException _ -> "com.amazonaws.comprehend#TextSizeLimitExceededException"
    | `UnsupportedLanguageException _ -> "com.amazonaws.comprehend#UnsupportedLanguageException"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "InternalServerException" ->
          `InternalServerException
            (Json_deserializers.internal_server_exception_of_yojson tree path)
      | _, "InvalidRequestException" ->
          `InvalidRequestException
            (Json_deserializers.invalid_request_exception_of_yojson tree path)
      | _, "TextSizeLimitExceededException" ->
          `TextSizeLimitExceededException
            (Json_deserializers.text_size_limit_exceeded_exception_of_yojson tree path)
      | _, "UnsupportedLanguageException" ->
          `UnsupportedLanguageException
            (Json_deserializers.unsupported_language_exception_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : detect_pii_entities_request) =
    let input = Json_serializers.detect_pii_entities_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"Comprehend_20171127.DetectPiiEntities" ~service
      ~context ~input ~output_deserializer:Json_deserializers.detect_pii_entities_response_of_yojson
      ~error_deserializer

  let request_with_metadata context (request : detect_pii_entities_request) =
    let input = Json_serializers.detect_pii_entities_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata
      ~shape_name:"Comprehend_20171127.DetectPiiEntities" ~service ~context ~input
      ~output_deserializer:Json_deserializers.detect_pii_entities_response_of_yojson
      ~error_deserializer
end

module DetectSentiment = struct
  let error_to_string = function
    | `InternalServerException _ -> "com.amazonaws.comprehend#InternalServerException"
    | `InvalidRequestException _ -> "com.amazonaws.comprehend#InvalidRequestException"
    | `TextSizeLimitExceededException _ -> "com.amazonaws.comprehend#TextSizeLimitExceededException"
    | `UnsupportedLanguageException _ -> "com.amazonaws.comprehend#UnsupportedLanguageException"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "InternalServerException" ->
          `InternalServerException
            (Json_deserializers.internal_server_exception_of_yojson tree path)
      | _, "InvalidRequestException" ->
          `InvalidRequestException
            (Json_deserializers.invalid_request_exception_of_yojson tree path)
      | _, "TextSizeLimitExceededException" ->
          `TextSizeLimitExceededException
            (Json_deserializers.text_size_limit_exceeded_exception_of_yojson tree path)
      | _, "UnsupportedLanguageException" ->
          `UnsupportedLanguageException
            (Json_deserializers.unsupported_language_exception_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : detect_sentiment_request) =
    let input = Json_serializers.detect_sentiment_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"Comprehend_20171127.DetectSentiment" ~service
      ~context ~input ~output_deserializer:Json_deserializers.detect_sentiment_response_of_yojson
      ~error_deserializer

  let request_with_metadata context (request : detect_sentiment_request) =
    let input = Json_serializers.detect_sentiment_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata
      ~shape_name:"Comprehend_20171127.DetectSentiment" ~service ~context ~input
      ~output_deserializer:Json_deserializers.detect_sentiment_response_of_yojson
      ~error_deserializer
end

module DetectSyntax = struct
  let error_to_string = function
    | `InternalServerException _ -> "com.amazonaws.comprehend#InternalServerException"
    | `InvalidRequestException _ -> "com.amazonaws.comprehend#InvalidRequestException"
    | `TextSizeLimitExceededException _ -> "com.amazonaws.comprehend#TextSizeLimitExceededException"
    | `UnsupportedLanguageException _ -> "com.amazonaws.comprehend#UnsupportedLanguageException"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "InternalServerException" ->
          `InternalServerException
            (Json_deserializers.internal_server_exception_of_yojson tree path)
      | _, "InvalidRequestException" ->
          `InvalidRequestException
            (Json_deserializers.invalid_request_exception_of_yojson tree path)
      | _, "TextSizeLimitExceededException" ->
          `TextSizeLimitExceededException
            (Json_deserializers.text_size_limit_exceeded_exception_of_yojson tree path)
      | _, "UnsupportedLanguageException" ->
          `UnsupportedLanguageException
            (Json_deserializers.unsupported_language_exception_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : detect_syntax_request) =
    let input = Json_serializers.detect_syntax_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"Comprehend_20171127.DetectSyntax" ~service
      ~context ~input ~output_deserializer:Json_deserializers.detect_syntax_response_of_yojson
      ~error_deserializer

  let request_with_metadata context (request : detect_syntax_request) =
    let input = Json_serializers.detect_syntax_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata ~shape_name:"Comprehend_20171127.DetectSyntax"
      ~service ~context ~input
      ~output_deserializer:Json_deserializers.detect_syntax_response_of_yojson ~error_deserializer
end

module DetectTargetedSentiment = struct
  let error_to_string = function
    | `InternalServerException _ -> "com.amazonaws.comprehend#InternalServerException"
    | `InvalidRequestException _ -> "com.amazonaws.comprehend#InvalidRequestException"
    | `TextSizeLimitExceededException _ -> "com.amazonaws.comprehend#TextSizeLimitExceededException"
    | `UnsupportedLanguageException _ -> "com.amazonaws.comprehend#UnsupportedLanguageException"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "InternalServerException" ->
          `InternalServerException
            (Json_deserializers.internal_server_exception_of_yojson tree path)
      | _, "InvalidRequestException" ->
          `InvalidRequestException
            (Json_deserializers.invalid_request_exception_of_yojson tree path)
      | _, "TextSizeLimitExceededException" ->
          `TextSizeLimitExceededException
            (Json_deserializers.text_size_limit_exceeded_exception_of_yojson tree path)
      | _, "UnsupportedLanguageException" ->
          `UnsupportedLanguageException
            (Json_deserializers.unsupported_language_exception_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : detect_targeted_sentiment_request) =
    let input = Json_serializers.detect_targeted_sentiment_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"Comprehend_20171127.DetectTargetedSentiment"
      ~service ~context ~input
      ~output_deserializer:Json_deserializers.detect_targeted_sentiment_response_of_yojson
      ~error_deserializer

  let request_with_metadata context (request : detect_targeted_sentiment_request) =
    let input = Json_serializers.detect_targeted_sentiment_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata
      ~shape_name:"Comprehend_20171127.DetectTargetedSentiment" ~service ~context ~input
      ~output_deserializer:Json_deserializers.detect_targeted_sentiment_response_of_yojson
      ~error_deserializer
end

module DetectToxicContent = struct
  let error_to_string = function
    | `InternalServerException _ -> "com.amazonaws.comprehend#InternalServerException"
    | `InvalidRequestException _ -> "com.amazonaws.comprehend#InvalidRequestException"
    | `TextSizeLimitExceededException _ -> "com.amazonaws.comprehend#TextSizeLimitExceededException"
    | `UnsupportedLanguageException _ -> "com.amazonaws.comprehend#UnsupportedLanguageException"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "InternalServerException" ->
          `InternalServerException
            (Json_deserializers.internal_server_exception_of_yojson tree path)
      | _, "InvalidRequestException" ->
          `InvalidRequestException
            (Json_deserializers.invalid_request_exception_of_yojson tree path)
      | _, "TextSizeLimitExceededException" ->
          `TextSizeLimitExceededException
            (Json_deserializers.text_size_limit_exceeded_exception_of_yojson tree path)
      | _, "UnsupportedLanguageException" ->
          `UnsupportedLanguageException
            (Json_deserializers.unsupported_language_exception_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : detect_toxic_content_request) =
    let input = Json_serializers.detect_toxic_content_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"Comprehend_20171127.DetectToxicContent"
      ~service ~context ~input
      ~output_deserializer:Json_deserializers.detect_toxic_content_response_of_yojson
      ~error_deserializer

  let request_with_metadata context (request : detect_toxic_content_request) =
    let input = Json_serializers.detect_toxic_content_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata
      ~shape_name:"Comprehend_20171127.DetectToxicContent" ~service ~context ~input
      ~output_deserializer:Json_deserializers.detect_toxic_content_response_of_yojson
      ~error_deserializer
end

module ImportModel = struct
  let error_to_string = function
    | `InternalServerException _ -> "com.amazonaws.comprehend#InternalServerException"
    | `InvalidRequestException _ -> "com.amazonaws.comprehend#InvalidRequestException"
    | `KmsKeyValidationException _ -> "com.amazonaws.comprehend#KmsKeyValidationException"
    | `ResourceInUseException _ -> "com.amazonaws.comprehend#ResourceInUseException"
    | `ResourceLimitExceededException _ -> "com.amazonaws.comprehend#ResourceLimitExceededException"
    | `ResourceNotFoundException _ -> "com.amazonaws.comprehend#ResourceNotFoundException"
    | `ResourceUnavailableException _ -> "com.amazonaws.comprehend#ResourceUnavailableException"
    | `TooManyRequestsException _ -> "com.amazonaws.comprehend#TooManyRequestsException"
    | `TooManyTagsException _ -> "com.amazonaws.comprehend#TooManyTagsException"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "InternalServerException" ->
          `InternalServerException
            (Json_deserializers.internal_server_exception_of_yojson tree path)
      | _, "InvalidRequestException" ->
          `InvalidRequestException
            (Json_deserializers.invalid_request_exception_of_yojson tree path)
      | _, "KmsKeyValidationException" ->
          `KmsKeyValidationException
            (Json_deserializers.kms_key_validation_exception_of_yojson tree path)
      | _, "ResourceInUseException" ->
          `ResourceInUseException (Json_deserializers.resource_in_use_exception_of_yojson tree path)
      | _, "ResourceLimitExceededException" ->
          `ResourceLimitExceededException
            (Json_deserializers.resource_limit_exceeded_exception_of_yojson tree path)
      | _, "ResourceNotFoundException" ->
          `ResourceNotFoundException
            (Json_deserializers.resource_not_found_exception_of_yojson tree path)
      | _, "ResourceUnavailableException" ->
          `ResourceUnavailableException
            (Json_deserializers.resource_unavailable_exception_of_yojson tree path)
      | _, "TooManyRequestsException" ->
          `TooManyRequestsException
            (Json_deserializers.too_many_requests_exception_of_yojson tree path)
      | _, "TooManyTagsException" ->
          `TooManyTagsException (Json_deserializers.too_many_tags_exception_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : import_model_request) =
    let input = Json_serializers.import_model_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"Comprehend_20171127.ImportModel" ~service
      ~context ~input ~output_deserializer:Json_deserializers.import_model_response_of_yojson
      ~error_deserializer

  let request_with_metadata context (request : import_model_request) =
    let input = Json_serializers.import_model_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata ~shape_name:"Comprehend_20171127.ImportModel"
      ~service ~context ~input
      ~output_deserializer:Json_deserializers.import_model_response_of_yojson ~error_deserializer
end

module ListDatasets = struct
  let error_to_string = function
    | `InternalServerException _ -> "com.amazonaws.comprehend#InternalServerException"
    | `InvalidFilterException _ -> "com.amazonaws.comprehend#InvalidFilterException"
    | `InvalidRequestException _ -> "com.amazonaws.comprehend#InvalidRequestException"
    | `ResourceNotFoundException _ -> "com.amazonaws.comprehend#ResourceNotFoundException"
    | `TooManyRequestsException _ -> "com.amazonaws.comprehend#TooManyRequestsException"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "InternalServerException" ->
          `InternalServerException
            (Json_deserializers.internal_server_exception_of_yojson tree path)
      | _, "InvalidFilterException" ->
          `InvalidFilterException (Json_deserializers.invalid_filter_exception_of_yojson tree path)
      | _, "InvalidRequestException" ->
          `InvalidRequestException
            (Json_deserializers.invalid_request_exception_of_yojson tree path)
      | _, "ResourceNotFoundException" ->
          `ResourceNotFoundException
            (Json_deserializers.resource_not_found_exception_of_yojson tree path)
      | _, "TooManyRequestsException" ->
          `TooManyRequestsException
            (Json_deserializers.too_many_requests_exception_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : list_datasets_request) =
    let input = Json_serializers.list_datasets_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"Comprehend_20171127.ListDatasets" ~service
      ~context ~input ~output_deserializer:Json_deserializers.list_datasets_response_of_yojson
      ~error_deserializer

  let request_with_metadata context (request : list_datasets_request) =
    let input = Json_serializers.list_datasets_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata ~shape_name:"Comprehend_20171127.ListDatasets"
      ~service ~context ~input
      ~output_deserializer:Json_deserializers.list_datasets_response_of_yojson ~error_deserializer
end

module ListDocumentClassificationJobs = struct
  let error_to_string = function
    | `InternalServerException _ -> "com.amazonaws.comprehend#InternalServerException"
    | `InvalidFilterException _ -> "com.amazonaws.comprehend#InvalidFilterException"
    | `InvalidRequestException _ -> "com.amazonaws.comprehend#InvalidRequestException"
    | `TooManyRequestsException _ -> "com.amazonaws.comprehend#TooManyRequestsException"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "InternalServerException" ->
          `InternalServerException
            (Json_deserializers.internal_server_exception_of_yojson tree path)
      | _, "InvalidFilterException" ->
          `InvalidFilterException (Json_deserializers.invalid_filter_exception_of_yojson tree path)
      | _, "InvalidRequestException" ->
          `InvalidRequestException
            (Json_deserializers.invalid_request_exception_of_yojson tree path)
      | _, "TooManyRequestsException" ->
          `TooManyRequestsException
            (Json_deserializers.too_many_requests_exception_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : list_document_classification_jobs_request) =
    let input = Json_serializers.list_document_classification_jobs_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request
      ~shape_name:"Comprehend_20171127.ListDocumentClassificationJobs" ~service ~context ~input
      ~output_deserializer:Json_deserializers.list_document_classification_jobs_response_of_yojson
      ~error_deserializer

  let request_with_metadata context (request : list_document_classification_jobs_request) =
    let input = Json_serializers.list_document_classification_jobs_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata
      ~shape_name:"Comprehend_20171127.ListDocumentClassificationJobs" ~service ~context ~input
      ~output_deserializer:Json_deserializers.list_document_classification_jobs_response_of_yojson
      ~error_deserializer
end

module ListDocumentClassifierSummaries = struct
  let error_to_string = function
    | `InternalServerException _ -> "com.amazonaws.comprehend#InternalServerException"
    | `InvalidRequestException _ -> "com.amazonaws.comprehend#InvalidRequestException"
    | `TooManyRequestsException _ -> "com.amazonaws.comprehend#TooManyRequestsException"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "InternalServerException" ->
          `InternalServerException
            (Json_deserializers.internal_server_exception_of_yojson tree path)
      | _, "InvalidRequestException" ->
          `InvalidRequestException
            (Json_deserializers.invalid_request_exception_of_yojson tree path)
      | _, "TooManyRequestsException" ->
          `TooManyRequestsException
            (Json_deserializers.too_many_requests_exception_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : list_document_classifier_summaries_request) =
    let input = Json_serializers.list_document_classifier_summaries_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request
      ~shape_name:"Comprehend_20171127.ListDocumentClassifierSummaries" ~service ~context ~input
      ~output_deserializer:Json_deserializers.list_document_classifier_summaries_response_of_yojson
      ~error_deserializer

  let request_with_metadata context (request : list_document_classifier_summaries_request) =
    let input = Json_serializers.list_document_classifier_summaries_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata
      ~shape_name:"Comprehend_20171127.ListDocumentClassifierSummaries" ~service ~context ~input
      ~output_deserializer:Json_deserializers.list_document_classifier_summaries_response_of_yojson
      ~error_deserializer
end

module ListDocumentClassifiers = struct
  let error_to_string = function
    | `InternalServerException _ -> "com.amazonaws.comprehend#InternalServerException"
    | `InvalidFilterException _ -> "com.amazonaws.comprehend#InvalidFilterException"
    | `InvalidRequestException _ -> "com.amazonaws.comprehend#InvalidRequestException"
    | `TooManyRequestsException _ -> "com.amazonaws.comprehend#TooManyRequestsException"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "InternalServerException" ->
          `InternalServerException
            (Json_deserializers.internal_server_exception_of_yojson tree path)
      | _, "InvalidFilterException" ->
          `InvalidFilterException (Json_deserializers.invalid_filter_exception_of_yojson tree path)
      | _, "InvalidRequestException" ->
          `InvalidRequestException
            (Json_deserializers.invalid_request_exception_of_yojson tree path)
      | _, "TooManyRequestsException" ->
          `TooManyRequestsException
            (Json_deserializers.too_many_requests_exception_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : list_document_classifiers_request) =
    let input = Json_serializers.list_document_classifiers_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"Comprehend_20171127.ListDocumentClassifiers"
      ~service ~context ~input
      ~output_deserializer:Json_deserializers.list_document_classifiers_response_of_yojson
      ~error_deserializer

  let request_with_metadata context (request : list_document_classifiers_request) =
    let input = Json_serializers.list_document_classifiers_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata
      ~shape_name:"Comprehend_20171127.ListDocumentClassifiers" ~service ~context ~input
      ~output_deserializer:Json_deserializers.list_document_classifiers_response_of_yojson
      ~error_deserializer
end

module ListDominantLanguageDetectionJobs = struct
  let error_to_string = function
    | `InternalServerException _ -> "com.amazonaws.comprehend#InternalServerException"
    | `InvalidFilterException _ -> "com.amazonaws.comprehend#InvalidFilterException"
    | `InvalidRequestException _ -> "com.amazonaws.comprehend#InvalidRequestException"
    | `TooManyRequestsException _ -> "com.amazonaws.comprehend#TooManyRequestsException"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "InternalServerException" ->
          `InternalServerException
            (Json_deserializers.internal_server_exception_of_yojson tree path)
      | _, "InvalidFilterException" ->
          `InvalidFilterException (Json_deserializers.invalid_filter_exception_of_yojson tree path)
      | _, "InvalidRequestException" ->
          `InvalidRequestException
            (Json_deserializers.invalid_request_exception_of_yojson tree path)
      | _, "TooManyRequestsException" ->
          `TooManyRequestsException
            (Json_deserializers.too_many_requests_exception_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : list_dominant_language_detection_jobs_request) =
    let input = Json_serializers.list_dominant_language_detection_jobs_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request
      ~shape_name:"Comprehend_20171127.ListDominantLanguageDetectionJobs" ~service ~context ~input
      ~output_deserializer:
        Json_deserializers.list_dominant_language_detection_jobs_response_of_yojson
      ~error_deserializer

  let request_with_metadata context (request : list_dominant_language_detection_jobs_request) =
    let input = Json_serializers.list_dominant_language_detection_jobs_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata
      ~shape_name:"Comprehend_20171127.ListDominantLanguageDetectionJobs" ~service ~context ~input
      ~output_deserializer:
        Json_deserializers.list_dominant_language_detection_jobs_response_of_yojson
      ~error_deserializer
end

module ListEndpoints = struct
  let error_to_string = function
    | `InternalServerException _ -> "com.amazonaws.comprehend#InternalServerException"
    | `InvalidRequestException _ -> "com.amazonaws.comprehend#InvalidRequestException"
    | `TooManyRequestsException _ -> "com.amazonaws.comprehend#TooManyRequestsException"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "InternalServerException" ->
          `InternalServerException
            (Json_deserializers.internal_server_exception_of_yojson tree path)
      | _, "InvalidRequestException" ->
          `InvalidRequestException
            (Json_deserializers.invalid_request_exception_of_yojson tree path)
      | _, "TooManyRequestsException" ->
          `TooManyRequestsException
            (Json_deserializers.too_many_requests_exception_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : list_endpoints_request) =
    let input = Json_serializers.list_endpoints_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"Comprehend_20171127.ListEndpoints" ~service
      ~context ~input ~output_deserializer:Json_deserializers.list_endpoints_response_of_yojson
      ~error_deserializer

  let request_with_metadata context (request : list_endpoints_request) =
    let input = Json_serializers.list_endpoints_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata
      ~shape_name:"Comprehend_20171127.ListEndpoints" ~service ~context ~input
      ~output_deserializer:Json_deserializers.list_endpoints_response_of_yojson ~error_deserializer
end

module ListEntitiesDetectionJobs = struct
  let error_to_string = function
    | `InternalServerException _ -> "com.amazonaws.comprehend#InternalServerException"
    | `InvalidFilterException _ -> "com.amazonaws.comprehend#InvalidFilterException"
    | `InvalidRequestException _ -> "com.amazonaws.comprehend#InvalidRequestException"
    | `TooManyRequestsException _ -> "com.amazonaws.comprehend#TooManyRequestsException"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "InternalServerException" ->
          `InternalServerException
            (Json_deserializers.internal_server_exception_of_yojson tree path)
      | _, "InvalidFilterException" ->
          `InvalidFilterException (Json_deserializers.invalid_filter_exception_of_yojson tree path)
      | _, "InvalidRequestException" ->
          `InvalidRequestException
            (Json_deserializers.invalid_request_exception_of_yojson tree path)
      | _, "TooManyRequestsException" ->
          `TooManyRequestsException
            (Json_deserializers.too_many_requests_exception_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : list_entities_detection_jobs_request) =
    let input = Json_serializers.list_entities_detection_jobs_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"Comprehend_20171127.ListEntitiesDetectionJobs"
      ~service ~context ~input
      ~output_deserializer:Json_deserializers.list_entities_detection_jobs_response_of_yojson
      ~error_deserializer

  let request_with_metadata context (request : list_entities_detection_jobs_request) =
    let input = Json_serializers.list_entities_detection_jobs_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata
      ~shape_name:"Comprehend_20171127.ListEntitiesDetectionJobs" ~service ~context ~input
      ~output_deserializer:Json_deserializers.list_entities_detection_jobs_response_of_yojson
      ~error_deserializer
end

module ListEntityRecognizerSummaries = struct
  let error_to_string = function
    | `InternalServerException _ -> "com.amazonaws.comprehend#InternalServerException"
    | `InvalidRequestException _ -> "com.amazonaws.comprehend#InvalidRequestException"
    | `TooManyRequestsException _ -> "com.amazonaws.comprehend#TooManyRequestsException"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "InternalServerException" ->
          `InternalServerException
            (Json_deserializers.internal_server_exception_of_yojson tree path)
      | _, "InvalidRequestException" ->
          `InvalidRequestException
            (Json_deserializers.invalid_request_exception_of_yojson tree path)
      | _, "TooManyRequestsException" ->
          `TooManyRequestsException
            (Json_deserializers.too_many_requests_exception_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : list_entity_recognizer_summaries_request) =
    let input = Json_serializers.list_entity_recognizer_summaries_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request
      ~shape_name:"Comprehend_20171127.ListEntityRecognizerSummaries" ~service ~context ~input
      ~output_deserializer:Json_deserializers.list_entity_recognizer_summaries_response_of_yojson
      ~error_deserializer

  let request_with_metadata context (request : list_entity_recognizer_summaries_request) =
    let input = Json_serializers.list_entity_recognizer_summaries_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata
      ~shape_name:"Comprehend_20171127.ListEntityRecognizerSummaries" ~service ~context ~input
      ~output_deserializer:Json_deserializers.list_entity_recognizer_summaries_response_of_yojson
      ~error_deserializer
end

module ListEntityRecognizers = struct
  let error_to_string = function
    | `InternalServerException _ -> "com.amazonaws.comprehend#InternalServerException"
    | `InvalidFilterException _ -> "com.amazonaws.comprehend#InvalidFilterException"
    | `InvalidRequestException _ -> "com.amazonaws.comprehend#InvalidRequestException"
    | `TooManyRequestsException _ -> "com.amazonaws.comprehend#TooManyRequestsException"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "InternalServerException" ->
          `InternalServerException
            (Json_deserializers.internal_server_exception_of_yojson tree path)
      | _, "InvalidFilterException" ->
          `InvalidFilterException (Json_deserializers.invalid_filter_exception_of_yojson tree path)
      | _, "InvalidRequestException" ->
          `InvalidRequestException
            (Json_deserializers.invalid_request_exception_of_yojson tree path)
      | _, "TooManyRequestsException" ->
          `TooManyRequestsException
            (Json_deserializers.too_many_requests_exception_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : list_entity_recognizers_request) =
    let input = Json_serializers.list_entity_recognizers_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"Comprehend_20171127.ListEntityRecognizers"
      ~service ~context ~input
      ~output_deserializer:Json_deserializers.list_entity_recognizers_response_of_yojson
      ~error_deserializer

  let request_with_metadata context (request : list_entity_recognizers_request) =
    let input = Json_serializers.list_entity_recognizers_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata
      ~shape_name:"Comprehend_20171127.ListEntityRecognizers" ~service ~context ~input
      ~output_deserializer:Json_deserializers.list_entity_recognizers_response_of_yojson
      ~error_deserializer
end

module ListEventsDetectionJobs = struct
  let error_to_string = function
    | `InternalServerException _ -> "com.amazonaws.comprehend#InternalServerException"
    | `InvalidFilterException _ -> "com.amazonaws.comprehend#InvalidFilterException"
    | `InvalidRequestException _ -> "com.amazonaws.comprehend#InvalidRequestException"
    | `TooManyRequestsException _ -> "com.amazonaws.comprehend#TooManyRequestsException"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "InternalServerException" ->
          `InternalServerException
            (Json_deserializers.internal_server_exception_of_yojson tree path)
      | _, "InvalidFilterException" ->
          `InvalidFilterException (Json_deserializers.invalid_filter_exception_of_yojson tree path)
      | _, "InvalidRequestException" ->
          `InvalidRequestException
            (Json_deserializers.invalid_request_exception_of_yojson tree path)
      | _, "TooManyRequestsException" ->
          `TooManyRequestsException
            (Json_deserializers.too_many_requests_exception_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : list_events_detection_jobs_request) =
    let input = Json_serializers.list_events_detection_jobs_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"Comprehend_20171127.ListEventsDetectionJobs"
      ~service ~context ~input
      ~output_deserializer:Json_deserializers.list_events_detection_jobs_response_of_yojson
      ~error_deserializer

  let request_with_metadata context (request : list_events_detection_jobs_request) =
    let input = Json_serializers.list_events_detection_jobs_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata
      ~shape_name:"Comprehend_20171127.ListEventsDetectionJobs" ~service ~context ~input
      ~output_deserializer:Json_deserializers.list_events_detection_jobs_response_of_yojson
      ~error_deserializer
end

module ListFlywheelIterationHistory = struct
  let error_to_string = function
    | `InternalServerException _ -> "com.amazonaws.comprehend#InternalServerException"
    | `InvalidFilterException _ -> "com.amazonaws.comprehend#InvalidFilterException"
    | `InvalidRequestException _ -> "com.amazonaws.comprehend#InvalidRequestException"
    | `ResourceNotFoundException _ -> "com.amazonaws.comprehend#ResourceNotFoundException"
    | `TooManyRequestsException _ -> "com.amazonaws.comprehend#TooManyRequestsException"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "InternalServerException" ->
          `InternalServerException
            (Json_deserializers.internal_server_exception_of_yojson tree path)
      | _, "InvalidFilterException" ->
          `InvalidFilterException (Json_deserializers.invalid_filter_exception_of_yojson tree path)
      | _, "InvalidRequestException" ->
          `InvalidRequestException
            (Json_deserializers.invalid_request_exception_of_yojson tree path)
      | _, "ResourceNotFoundException" ->
          `ResourceNotFoundException
            (Json_deserializers.resource_not_found_exception_of_yojson tree path)
      | _, "TooManyRequestsException" ->
          `TooManyRequestsException
            (Json_deserializers.too_many_requests_exception_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : list_flywheel_iteration_history_request) =
    let input = Json_serializers.list_flywheel_iteration_history_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request
      ~shape_name:"Comprehend_20171127.ListFlywheelIterationHistory" ~service ~context ~input
      ~output_deserializer:Json_deserializers.list_flywheel_iteration_history_response_of_yojson
      ~error_deserializer

  let request_with_metadata context (request : list_flywheel_iteration_history_request) =
    let input = Json_serializers.list_flywheel_iteration_history_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata
      ~shape_name:"Comprehend_20171127.ListFlywheelIterationHistory" ~service ~context ~input
      ~output_deserializer:Json_deserializers.list_flywheel_iteration_history_response_of_yojson
      ~error_deserializer
end

module ListFlywheels = struct
  let error_to_string = function
    | `InternalServerException _ -> "com.amazonaws.comprehend#InternalServerException"
    | `InvalidFilterException _ -> "com.amazonaws.comprehend#InvalidFilterException"
    | `InvalidRequestException _ -> "com.amazonaws.comprehend#InvalidRequestException"
    | `TooManyRequestsException _ -> "com.amazonaws.comprehend#TooManyRequestsException"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "InternalServerException" ->
          `InternalServerException
            (Json_deserializers.internal_server_exception_of_yojson tree path)
      | _, "InvalidFilterException" ->
          `InvalidFilterException (Json_deserializers.invalid_filter_exception_of_yojson tree path)
      | _, "InvalidRequestException" ->
          `InvalidRequestException
            (Json_deserializers.invalid_request_exception_of_yojson tree path)
      | _, "TooManyRequestsException" ->
          `TooManyRequestsException
            (Json_deserializers.too_many_requests_exception_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : list_flywheels_request) =
    let input = Json_serializers.list_flywheels_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"Comprehend_20171127.ListFlywheels" ~service
      ~context ~input ~output_deserializer:Json_deserializers.list_flywheels_response_of_yojson
      ~error_deserializer

  let request_with_metadata context (request : list_flywheels_request) =
    let input = Json_serializers.list_flywheels_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata
      ~shape_name:"Comprehend_20171127.ListFlywheels" ~service ~context ~input
      ~output_deserializer:Json_deserializers.list_flywheels_response_of_yojson ~error_deserializer
end

module ListKeyPhrasesDetectionJobs = struct
  let error_to_string = function
    | `InternalServerException _ -> "com.amazonaws.comprehend#InternalServerException"
    | `InvalidFilterException _ -> "com.amazonaws.comprehend#InvalidFilterException"
    | `InvalidRequestException _ -> "com.amazonaws.comprehend#InvalidRequestException"
    | `TooManyRequestsException _ -> "com.amazonaws.comprehend#TooManyRequestsException"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "InternalServerException" ->
          `InternalServerException
            (Json_deserializers.internal_server_exception_of_yojson tree path)
      | _, "InvalidFilterException" ->
          `InvalidFilterException (Json_deserializers.invalid_filter_exception_of_yojson tree path)
      | _, "InvalidRequestException" ->
          `InvalidRequestException
            (Json_deserializers.invalid_request_exception_of_yojson tree path)
      | _, "TooManyRequestsException" ->
          `TooManyRequestsException
            (Json_deserializers.too_many_requests_exception_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : list_key_phrases_detection_jobs_request) =
    let input = Json_serializers.list_key_phrases_detection_jobs_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request
      ~shape_name:"Comprehend_20171127.ListKeyPhrasesDetectionJobs" ~service ~context ~input
      ~output_deserializer:Json_deserializers.list_key_phrases_detection_jobs_response_of_yojson
      ~error_deserializer

  let request_with_metadata context (request : list_key_phrases_detection_jobs_request) =
    let input = Json_serializers.list_key_phrases_detection_jobs_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata
      ~shape_name:"Comprehend_20171127.ListKeyPhrasesDetectionJobs" ~service ~context ~input
      ~output_deserializer:Json_deserializers.list_key_phrases_detection_jobs_response_of_yojson
      ~error_deserializer
end

module ListPiiEntitiesDetectionJobs = struct
  let error_to_string = function
    | `InternalServerException _ -> "com.amazonaws.comprehend#InternalServerException"
    | `InvalidFilterException _ -> "com.amazonaws.comprehend#InvalidFilterException"
    | `InvalidRequestException _ -> "com.amazonaws.comprehend#InvalidRequestException"
    | `TooManyRequestsException _ -> "com.amazonaws.comprehend#TooManyRequestsException"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "InternalServerException" ->
          `InternalServerException
            (Json_deserializers.internal_server_exception_of_yojson tree path)
      | _, "InvalidFilterException" ->
          `InvalidFilterException (Json_deserializers.invalid_filter_exception_of_yojson tree path)
      | _, "InvalidRequestException" ->
          `InvalidRequestException
            (Json_deserializers.invalid_request_exception_of_yojson tree path)
      | _, "TooManyRequestsException" ->
          `TooManyRequestsException
            (Json_deserializers.too_many_requests_exception_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : list_pii_entities_detection_jobs_request) =
    let input = Json_serializers.list_pii_entities_detection_jobs_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request
      ~shape_name:"Comprehend_20171127.ListPiiEntitiesDetectionJobs" ~service ~context ~input
      ~output_deserializer:Json_deserializers.list_pii_entities_detection_jobs_response_of_yojson
      ~error_deserializer

  let request_with_metadata context (request : list_pii_entities_detection_jobs_request) =
    let input = Json_serializers.list_pii_entities_detection_jobs_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata
      ~shape_name:"Comprehend_20171127.ListPiiEntitiesDetectionJobs" ~service ~context ~input
      ~output_deserializer:Json_deserializers.list_pii_entities_detection_jobs_response_of_yojson
      ~error_deserializer
end

module ListSentimentDetectionJobs = struct
  let error_to_string = function
    | `InternalServerException _ -> "com.amazonaws.comprehend#InternalServerException"
    | `InvalidFilterException _ -> "com.amazonaws.comprehend#InvalidFilterException"
    | `InvalidRequestException _ -> "com.amazonaws.comprehend#InvalidRequestException"
    | `TooManyRequestsException _ -> "com.amazonaws.comprehend#TooManyRequestsException"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "InternalServerException" ->
          `InternalServerException
            (Json_deserializers.internal_server_exception_of_yojson tree path)
      | _, "InvalidFilterException" ->
          `InvalidFilterException (Json_deserializers.invalid_filter_exception_of_yojson tree path)
      | _, "InvalidRequestException" ->
          `InvalidRequestException
            (Json_deserializers.invalid_request_exception_of_yojson tree path)
      | _, "TooManyRequestsException" ->
          `TooManyRequestsException
            (Json_deserializers.too_many_requests_exception_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : list_sentiment_detection_jobs_request) =
    let input = Json_serializers.list_sentiment_detection_jobs_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"Comprehend_20171127.ListSentimentDetectionJobs"
      ~service ~context ~input
      ~output_deserializer:Json_deserializers.list_sentiment_detection_jobs_response_of_yojson
      ~error_deserializer

  let request_with_metadata context (request : list_sentiment_detection_jobs_request) =
    let input = Json_serializers.list_sentiment_detection_jobs_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata
      ~shape_name:"Comprehend_20171127.ListSentimentDetectionJobs" ~service ~context ~input
      ~output_deserializer:Json_deserializers.list_sentiment_detection_jobs_response_of_yojson
      ~error_deserializer
end

module ListTagsForResource = struct
  let error_to_string = function
    | `InternalServerException _ -> "com.amazonaws.comprehend#InternalServerException"
    | `InvalidRequestException _ -> "com.amazonaws.comprehend#InvalidRequestException"
    | `ResourceNotFoundException _ -> "com.amazonaws.comprehend#ResourceNotFoundException"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
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

  let request context (request : list_tags_for_resource_request) =
    let input = Json_serializers.list_tags_for_resource_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"Comprehend_20171127.ListTagsForResource"
      ~service ~context ~input
      ~output_deserializer:Json_deserializers.list_tags_for_resource_response_of_yojson
      ~error_deserializer

  let request_with_metadata context (request : list_tags_for_resource_request) =
    let input = Json_serializers.list_tags_for_resource_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata
      ~shape_name:"Comprehend_20171127.ListTagsForResource" ~service ~context ~input
      ~output_deserializer:Json_deserializers.list_tags_for_resource_response_of_yojson
      ~error_deserializer
end

module ListTargetedSentimentDetectionJobs = struct
  let error_to_string = function
    | `InternalServerException _ -> "com.amazonaws.comprehend#InternalServerException"
    | `InvalidFilterException _ -> "com.amazonaws.comprehend#InvalidFilterException"
    | `InvalidRequestException _ -> "com.amazonaws.comprehend#InvalidRequestException"
    | `TooManyRequestsException _ -> "com.amazonaws.comprehend#TooManyRequestsException"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "InternalServerException" ->
          `InternalServerException
            (Json_deserializers.internal_server_exception_of_yojson tree path)
      | _, "InvalidFilterException" ->
          `InvalidFilterException (Json_deserializers.invalid_filter_exception_of_yojson tree path)
      | _, "InvalidRequestException" ->
          `InvalidRequestException
            (Json_deserializers.invalid_request_exception_of_yojson tree path)
      | _, "TooManyRequestsException" ->
          `TooManyRequestsException
            (Json_deserializers.too_many_requests_exception_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : list_targeted_sentiment_detection_jobs_request) =
    let input = Json_serializers.list_targeted_sentiment_detection_jobs_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request
      ~shape_name:"Comprehend_20171127.ListTargetedSentimentDetectionJobs" ~service ~context ~input
      ~output_deserializer:
        Json_deserializers.list_targeted_sentiment_detection_jobs_response_of_yojson
      ~error_deserializer

  let request_with_metadata context (request : list_targeted_sentiment_detection_jobs_request) =
    let input = Json_serializers.list_targeted_sentiment_detection_jobs_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata
      ~shape_name:"Comprehend_20171127.ListTargetedSentimentDetectionJobs" ~service ~context ~input
      ~output_deserializer:
        Json_deserializers.list_targeted_sentiment_detection_jobs_response_of_yojson
      ~error_deserializer
end

module ListTopicsDetectionJobs = struct
  let error_to_string = function
    | `InternalServerException _ -> "com.amazonaws.comprehend#InternalServerException"
    | `InvalidFilterException _ -> "com.amazonaws.comprehend#InvalidFilterException"
    | `InvalidRequestException _ -> "com.amazonaws.comprehend#InvalidRequestException"
    | `TooManyRequestsException _ -> "com.amazonaws.comprehend#TooManyRequestsException"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "InternalServerException" ->
          `InternalServerException
            (Json_deserializers.internal_server_exception_of_yojson tree path)
      | _, "InvalidFilterException" ->
          `InvalidFilterException (Json_deserializers.invalid_filter_exception_of_yojson tree path)
      | _, "InvalidRequestException" ->
          `InvalidRequestException
            (Json_deserializers.invalid_request_exception_of_yojson tree path)
      | _, "TooManyRequestsException" ->
          `TooManyRequestsException
            (Json_deserializers.too_many_requests_exception_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : list_topics_detection_jobs_request) =
    let input = Json_serializers.list_topics_detection_jobs_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"Comprehend_20171127.ListTopicsDetectionJobs"
      ~service ~context ~input
      ~output_deserializer:Json_deserializers.list_topics_detection_jobs_response_of_yojson
      ~error_deserializer

  let request_with_metadata context (request : list_topics_detection_jobs_request) =
    let input = Json_serializers.list_topics_detection_jobs_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata
      ~shape_name:"Comprehend_20171127.ListTopicsDetectionJobs" ~service ~context ~input
      ~output_deserializer:Json_deserializers.list_topics_detection_jobs_response_of_yojson
      ~error_deserializer
end

module PutResourcePolicy = struct
  let error_to_string = function
    | `InternalServerException _ -> "com.amazonaws.comprehend#InternalServerException"
    | `InvalidRequestException _ -> "com.amazonaws.comprehend#InvalidRequestException"
    | `ResourceNotFoundException _ -> "com.amazonaws.comprehend#ResourceNotFoundException"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
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

  let request context (request : put_resource_policy_request) =
    let input = Json_serializers.put_resource_policy_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"Comprehend_20171127.PutResourcePolicy" ~service
      ~context ~input ~output_deserializer:Json_deserializers.put_resource_policy_response_of_yojson
      ~error_deserializer

  let request_with_metadata context (request : put_resource_policy_request) =
    let input = Json_serializers.put_resource_policy_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata
      ~shape_name:"Comprehend_20171127.PutResourcePolicy" ~service ~context ~input
      ~output_deserializer:Json_deserializers.put_resource_policy_response_of_yojson
      ~error_deserializer
end

module StartDocumentClassificationJob = struct
  let error_to_string = function
    | `InternalServerException _ -> "com.amazonaws.comprehend#InternalServerException"
    | `InvalidRequestException _ -> "com.amazonaws.comprehend#InvalidRequestException"
    | `KmsKeyValidationException _ -> "com.amazonaws.comprehend#KmsKeyValidationException"
    | `ResourceInUseException _ -> "com.amazonaws.comprehend#ResourceInUseException"
    | `ResourceNotFoundException _ -> "com.amazonaws.comprehend#ResourceNotFoundException"
    | `ResourceUnavailableException _ -> "com.amazonaws.comprehend#ResourceUnavailableException"
    | `TooManyRequestsException _ -> "com.amazonaws.comprehend#TooManyRequestsException"
    | `TooManyTagsException _ -> "com.amazonaws.comprehend#TooManyTagsException"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "InternalServerException" ->
          `InternalServerException
            (Json_deserializers.internal_server_exception_of_yojson tree path)
      | _, "InvalidRequestException" ->
          `InvalidRequestException
            (Json_deserializers.invalid_request_exception_of_yojson tree path)
      | _, "KmsKeyValidationException" ->
          `KmsKeyValidationException
            (Json_deserializers.kms_key_validation_exception_of_yojson tree path)
      | _, "ResourceInUseException" ->
          `ResourceInUseException (Json_deserializers.resource_in_use_exception_of_yojson tree path)
      | _, "ResourceNotFoundException" ->
          `ResourceNotFoundException
            (Json_deserializers.resource_not_found_exception_of_yojson tree path)
      | _, "ResourceUnavailableException" ->
          `ResourceUnavailableException
            (Json_deserializers.resource_unavailable_exception_of_yojson tree path)
      | _, "TooManyRequestsException" ->
          `TooManyRequestsException
            (Json_deserializers.too_many_requests_exception_of_yojson tree path)
      | _, "TooManyTagsException" ->
          `TooManyTagsException (Json_deserializers.too_many_tags_exception_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : start_document_classification_job_request) =
    let input = Json_serializers.start_document_classification_job_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request
      ~shape_name:"Comprehend_20171127.StartDocumentClassificationJob" ~service ~context ~input
      ~output_deserializer:Json_deserializers.start_document_classification_job_response_of_yojson
      ~error_deserializer

  let request_with_metadata context (request : start_document_classification_job_request) =
    let input = Json_serializers.start_document_classification_job_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata
      ~shape_name:"Comprehend_20171127.StartDocumentClassificationJob" ~service ~context ~input
      ~output_deserializer:Json_deserializers.start_document_classification_job_response_of_yojson
      ~error_deserializer
end

module StartDominantLanguageDetectionJob = struct
  let error_to_string = function
    | `InternalServerException _ -> "com.amazonaws.comprehend#InternalServerException"
    | `InvalidRequestException _ -> "com.amazonaws.comprehend#InvalidRequestException"
    | `KmsKeyValidationException _ -> "com.amazonaws.comprehend#KmsKeyValidationException"
    | `ResourceInUseException _ -> "com.amazonaws.comprehend#ResourceInUseException"
    | `TooManyRequestsException _ -> "com.amazonaws.comprehend#TooManyRequestsException"
    | `TooManyTagsException _ -> "com.amazonaws.comprehend#TooManyTagsException"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "InternalServerException" ->
          `InternalServerException
            (Json_deserializers.internal_server_exception_of_yojson tree path)
      | _, "InvalidRequestException" ->
          `InvalidRequestException
            (Json_deserializers.invalid_request_exception_of_yojson tree path)
      | _, "KmsKeyValidationException" ->
          `KmsKeyValidationException
            (Json_deserializers.kms_key_validation_exception_of_yojson tree path)
      | _, "ResourceInUseException" ->
          `ResourceInUseException (Json_deserializers.resource_in_use_exception_of_yojson tree path)
      | _, "TooManyRequestsException" ->
          `TooManyRequestsException
            (Json_deserializers.too_many_requests_exception_of_yojson tree path)
      | _, "TooManyTagsException" ->
          `TooManyTagsException (Json_deserializers.too_many_tags_exception_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : start_dominant_language_detection_job_request) =
    let input = Json_serializers.start_dominant_language_detection_job_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request
      ~shape_name:"Comprehend_20171127.StartDominantLanguageDetectionJob" ~service ~context ~input
      ~output_deserializer:
        Json_deserializers.start_dominant_language_detection_job_response_of_yojson
      ~error_deserializer

  let request_with_metadata context (request : start_dominant_language_detection_job_request) =
    let input = Json_serializers.start_dominant_language_detection_job_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata
      ~shape_name:"Comprehend_20171127.StartDominantLanguageDetectionJob" ~service ~context ~input
      ~output_deserializer:
        Json_deserializers.start_dominant_language_detection_job_response_of_yojson
      ~error_deserializer
end

module StartEntitiesDetectionJob = struct
  let error_to_string = function
    | `InternalServerException _ -> "com.amazonaws.comprehend#InternalServerException"
    | `InvalidRequestException _ -> "com.amazonaws.comprehend#InvalidRequestException"
    | `KmsKeyValidationException _ -> "com.amazonaws.comprehend#KmsKeyValidationException"
    | `ResourceInUseException _ -> "com.amazonaws.comprehend#ResourceInUseException"
    | `ResourceNotFoundException _ -> "com.amazonaws.comprehend#ResourceNotFoundException"
    | `ResourceUnavailableException _ -> "com.amazonaws.comprehend#ResourceUnavailableException"
    | `TooManyRequestsException _ -> "com.amazonaws.comprehend#TooManyRequestsException"
    | `TooManyTagsException _ -> "com.amazonaws.comprehend#TooManyTagsException"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "InternalServerException" ->
          `InternalServerException
            (Json_deserializers.internal_server_exception_of_yojson tree path)
      | _, "InvalidRequestException" ->
          `InvalidRequestException
            (Json_deserializers.invalid_request_exception_of_yojson tree path)
      | _, "KmsKeyValidationException" ->
          `KmsKeyValidationException
            (Json_deserializers.kms_key_validation_exception_of_yojson tree path)
      | _, "ResourceInUseException" ->
          `ResourceInUseException (Json_deserializers.resource_in_use_exception_of_yojson tree path)
      | _, "ResourceNotFoundException" ->
          `ResourceNotFoundException
            (Json_deserializers.resource_not_found_exception_of_yojson tree path)
      | _, "ResourceUnavailableException" ->
          `ResourceUnavailableException
            (Json_deserializers.resource_unavailable_exception_of_yojson tree path)
      | _, "TooManyRequestsException" ->
          `TooManyRequestsException
            (Json_deserializers.too_many_requests_exception_of_yojson tree path)
      | _, "TooManyTagsException" ->
          `TooManyTagsException (Json_deserializers.too_many_tags_exception_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : start_entities_detection_job_request) =
    let input = Json_serializers.start_entities_detection_job_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"Comprehend_20171127.StartEntitiesDetectionJob"
      ~service ~context ~input
      ~output_deserializer:Json_deserializers.start_entities_detection_job_response_of_yojson
      ~error_deserializer

  let request_with_metadata context (request : start_entities_detection_job_request) =
    let input = Json_serializers.start_entities_detection_job_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata
      ~shape_name:"Comprehend_20171127.StartEntitiesDetectionJob" ~service ~context ~input
      ~output_deserializer:Json_deserializers.start_entities_detection_job_response_of_yojson
      ~error_deserializer
end

module StartEventsDetectionJob = struct
  let error_to_string = function
    | `InternalServerException _ -> "com.amazonaws.comprehend#InternalServerException"
    | `InvalidRequestException _ -> "com.amazonaws.comprehend#InvalidRequestException"
    | `KmsKeyValidationException _ -> "com.amazonaws.comprehend#KmsKeyValidationException"
    | `ResourceInUseException _ -> "com.amazonaws.comprehend#ResourceInUseException"
    | `TooManyRequestsException _ -> "com.amazonaws.comprehend#TooManyRequestsException"
    | `TooManyTagsException _ -> "com.amazonaws.comprehend#TooManyTagsException"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "InternalServerException" ->
          `InternalServerException
            (Json_deserializers.internal_server_exception_of_yojson tree path)
      | _, "InvalidRequestException" ->
          `InvalidRequestException
            (Json_deserializers.invalid_request_exception_of_yojson tree path)
      | _, "KmsKeyValidationException" ->
          `KmsKeyValidationException
            (Json_deserializers.kms_key_validation_exception_of_yojson tree path)
      | _, "ResourceInUseException" ->
          `ResourceInUseException (Json_deserializers.resource_in_use_exception_of_yojson tree path)
      | _, "TooManyRequestsException" ->
          `TooManyRequestsException
            (Json_deserializers.too_many_requests_exception_of_yojson tree path)
      | _, "TooManyTagsException" ->
          `TooManyTagsException (Json_deserializers.too_many_tags_exception_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : start_events_detection_job_request) =
    let input = Json_serializers.start_events_detection_job_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"Comprehend_20171127.StartEventsDetectionJob"
      ~service ~context ~input
      ~output_deserializer:Json_deserializers.start_events_detection_job_response_of_yojson
      ~error_deserializer

  let request_with_metadata context (request : start_events_detection_job_request) =
    let input = Json_serializers.start_events_detection_job_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata
      ~shape_name:"Comprehend_20171127.StartEventsDetectionJob" ~service ~context ~input
      ~output_deserializer:Json_deserializers.start_events_detection_job_response_of_yojson
      ~error_deserializer
end

module StartFlywheelIteration = struct
  let error_to_string = function
    | `InternalServerException _ -> "com.amazonaws.comprehend#InternalServerException"
    | `InvalidRequestException _ -> "com.amazonaws.comprehend#InvalidRequestException"
    | `ResourceInUseException _ -> "com.amazonaws.comprehend#ResourceInUseException"
    | `ResourceNotFoundException _ -> "com.amazonaws.comprehend#ResourceNotFoundException"
    | `TooManyRequestsException _ -> "com.amazonaws.comprehend#TooManyRequestsException"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "InternalServerException" ->
          `InternalServerException
            (Json_deserializers.internal_server_exception_of_yojson tree path)
      | _, "InvalidRequestException" ->
          `InvalidRequestException
            (Json_deserializers.invalid_request_exception_of_yojson tree path)
      | _, "ResourceInUseException" ->
          `ResourceInUseException (Json_deserializers.resource_in_use_exception_of_yojson tree path)
      | _, "ResourceNotFoundException" ->
          `ResourceNotFoundException
            (Json_deserializers.resource_not_found_exception_of_yojson tree path)
      | _, "TooManyRequestsException" ->
          `TooManyRequestsException
            (Json_deserializers.too_many_requests_exception_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : start_flywheel_iteration_request) =
    let input = Json_serializers.start_flywheel_iteration_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"Comprehend_20171127.StartFlywheelIteration"
      ~service ~context ~input
      ~output_deserializer:Json_deserializers.start_flywheel_iteration_response_of_yojson
      ~error_deserializer

  let request_with_metadata context (request : start_flywheel_iteration_request) =
    let input = Json_serializers.start_flywheel_iteration_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata
      ~shape_name:"Comprehend_20171127.StartFlywheelIteration" ~service ~context ~input
      ~output_deserializer:Json_deserializers.start_flywheel_iteration_response_of_yojson
      ~error_deserializer
end

module StartKeyPhrasesDetectionJob = struct
  let error_to_string = function
    | `InternalServerException _ -> "com.amazonaws.comprehend#InternalServerException"
    | `InvalidRequestException _ -> "com.amazonaws.comprehend#InvalidRequestException"
    | `KmsKeyValidationException _ -> "com.amazonaws.comprehend#KmsKeyValidationException"
    | `ResourceInUseException _ -> "com.amazonaws.comprehend#ResourceInUseException"
    | `TooManyRequestsException _ -> "com.amazonaws.comprehend#TooManyRequestsException"
    | `TooManyTagsException _ -> "com.amazonaws.comprehend#TooManyTagsException"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "InternalServerException" ->
          `InternalServerException
            (Json_deserializers.internal_server_exception_of_yojson tree path)
      | _, "InvalidRequestException" ->
          `InvalidRequestException
            (Json_deserializers.invalid_request_exception_of_yojson tree path)
      | _, "KmsKeyValidationException" ->
          `KmsKeyValidationException
            (Json_deserializers.kms_key_validation_exception_of_yojson tree path)
      | _, "ResourceInUseException" ->
          `ResourceInUseException (Json_deserializers.resource_in_use_exception_of_yojson tree path)
      | _, "TooManyRequestsException" ->
          `TooManyRequestsException
            (Json_deserializers.too_many_requests_exception_of_yojson tree path)
      | _, "TooManyTagsException" ->
          `TooManyTagsException (Json_deserializers.too_many_tags_exception_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : start_key_phrases_detection_job_request) =
    let input = Json_serializers.start_key_phrases_detection_job_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request
      ~shape_name:"Comprehend_20171127.StartKeyPhrasesDetectionJob" ~service ~context ~input
      ~output_deserializer:Json_deserializers.start_key_phrases_detection_job_response_of_yojson
      ~error_deserializer

  let request_with_metadata context (request : start_key_phrases_detection_job_request) =
    let input = Json_serializers.start_key_phrases_detection_job_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata
      ~shape_name:"Comprehend_20171127.StartKeyPhrasesDetectionJob" ~service ~context ~input
      ~output_deserializer:Json_deserializers.start_key_phrases_detection_job_response_of_yojson
      ~error_deserializer
end

module StartPiiEntitiesDetectionJob = struct
  let error_to_string = function
    | `InternalServerException _ -> "com.amazonaws.comprehend#InternalServerException"
    | `InvalidRequestException _ -> "com.amazonaws.comprehend#InvalidRequestException"
    | `KmsKeyValidationException _ -> "com.amazonaws.comprehend#KmsKeyValidationException"
    | `ResourceInUseException _ -> "com.amazonaws.comprehend#ResourceInUseException"
    | `TooManyRequestsException _ -> "com.amazonaws.comprehend#TooManyRequestsException"
    | `TooManyTagsException _ -> "com.amazonaws.comprehend#TooManyTagsException"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "InternalServerException" ->
          `InternalServerException
            (Json_deserializers.internal_server_exception_of_yojson tree path)
      | _, "InvalidRequestException" ->
          `InvalidRequestException
            (Json_deserializers.invalid_request_exception_of_yojson tree path)
      | _, "KmsKeyValidationException" ->
          `KmsKeyValidationException
            (Json_deserializers.kms_key_validation_exception_of_yojson tree path)
      | _, "ResourceInUseException" ->
          `ResourceInUseException (Json_deserializers.resource_in_use_exception_of_yojson tree path)
      | _, "TooManyRequestsException" ->
          `TooManyRequestsException
            (Json_deserializers.too_many_requests_exception_of_yojson tree path)
      | _, "TooManyTagsException" ->
          `TooManyTagsException (Json_deserializers.too_many_tags_exception_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : start_pii_entities_detection_job_request) =
    let input = Json_serializers.start_pii_entities_detection_job_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request
      ~shape_name:"Comprehend_20171127.StartPiiEntitiesDetectionJob" ~service ~context ~input
      ~output_deserializer:Json_deserializers.start_pii_entities_detection_job_response_of_yojson
      ~error_deserializer

  let request_with_metadata context (request : start_pii_entities_detection_job_request) =
    let input = Json_serializers.start_pii_entities_detection_job_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata
      ~shape_name:"Comprehend_20171127.StartPiiEntitiesDetectionJob" ~service ~context ~input
      ~output_deserializer:Json_deserializers.start_pii_entities_detection_job_response_of_yojson
      ~error_deserializer
end

module StartSentimentDetectionJob = struct
  let error_to_string = function
    | `InternalServerException _ -> "com.amazonaws.comprehend#InternalServerException"
    | `InvalidRequestException _ -> "com.amazonaws.comprehend#InvalidRequestException"
    | `KmsKeyValidationException _ -> "com.amazonaws.comprehend#KmsKeyValidationException"
    | `ResourceInUseException _ -> "com.amazonaws.comprehend#ResourceInUseException"
    | `TooManyRequestsException _ -> "com.amazonaws.comprehend#TooManyRequestsException"
    | `TooManyTagsException _ -> "com.amazonaws.comprehend#TooManyTagsException"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "InternalServerException" ->
          `InternalServerException
            (Json_deserializers.internal_server_exception_of_yojson tree path)
      | _, "InvalidRequestException" ->
          `InvalidRequestException
            (Json_deserializers.invalid_request_exception_of_yojson tree path)
      | _, "KmsKeyValidationException" ->
          `KmsKeyValidationException
            (Json_deserializers.kms_key_validation_exception_of_yojson tree path)
      | _, "ResourceInUseException" ->
          `ResourceInUseException (Json_deserializers.resource_in_use_exception_of_yojson tree path)
      | _, "TooManyRequestsException" ->
          `TooManyRequestsException
            (Json_deserializers.too_many_requests_exception_of_yojson tree path)
      | _, "TooManyTagsException" ->
          `TooManyTagsException (Json_deserializers.too_many_tags_exception_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : start_sentiment_detection_job_request) =
    let input = Json_serializers.start_sentiment_detection_job_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"Comprehend_20171127.StartSentimentDetectionJob"
      ~service ~context ~input
      ~output_deserializer:Json_deserializers.start_sentiment_detection_job_response_of_yojson
      ~error_deserializer

  let request_with_metadata context (request : start_sentiment_detection_job_request) =
    let input = Json_serializers.start_sentiment_detection_job_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata
      ~shape_name:"Comprehend_20171127.StartSentimentDetectionJob" ~service ~context ~input
      ~output_deserializer:Json_deserializers.start_sentiment_detection_job_response_of_yojson
      ~error_deserializer
end

module StartTargetedSentimentDetectionJob = struct
  let error_to_string = function
    | `InternalServerException _ -> "com.amazonaws.comprehend#InternalServerException"
    | `InvalidRequestException _ -> "com.amazonaws.comprehend#InvalidRequestException"
    | `KmsKeyValidationException _ -> "com.amazonaws.comprehend#KmsKeyValidationException"
    | `ResourceInUseException _ -> "com.amazonaws.comprehend#ResourceInUseException"
    | `TooManyRequestsException _ -> "com.amazonaws.comprehend#TooManyRequestsException"
    | `TooManyTagsException _ -> "com.amazonaws.comprehend#TooManyTagsException"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "InternalServerException" ->
          `InternalServerException
            (Json_deserializers.internal_server_exception_of_yojson tree path)
      | _, "InvalidRequestException" ->
          `InvalidRequestException
            (Json_deserializers.invalid_request_exception_of_yojson tree path)
      | _, "KmsKeyValidationException" ->
          `KmsKeyValidationException
            (Json_deserializers.kms_key_validation_exception_of_yojson tree path)
      | _, "ResourceInUseException" ->
          `ResourceInUseException (Json_deserializers.resource_in_use_exception_of_yojson tree path)
      | _, "TooManyRequestsException" ->
          `TooManyRequestsException
            (Json_deserializers.too_many_requests_exception_of_yojson tree path)
      | _, "TooManyTagsException" ->
          `TooManyTagsException (Json_deserializers.too_many_tags_exception_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : start_targeted_sentiment_detection_job_request) =
    let input = Json_serializers.start_targeted_sentiment_detection_job_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request
      ~shape_name:"Comprehend_20171127.StartTargetedSentimentDetectionJob" ~service ~context ~input
      ~output_deserializer:
        Json_deserializers.start_targeted_sentiment_detection_job_response_of_yojson
      ~error_deserializer

  let request_with_metadata context (request : start_targeted_sentiment_detection_job_request) =
    let input = Json_serializers.start_targeted_sentiment_detection_job_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata
      ~shape_name:"Comprehend_20171127.StartTargetedSentimentDetectionJob" ~service ~context ~input
      ~output_deserializer:
        Json_deserializers.start_targeted_sentiment_detection_job_response_of_yojson
      ~error_deserializer
end

module StartTopicsDetectionJob = struct
  let error_to_string = function
    | `InternalServerException _ -> "com.amazonaws.comprehend#InternalServerException"
    | `InvalidRequestException _ -> "com.amazonaws.comprehend#InvalidRequestException"
    | `KmsKeyValidationException _ -> "com.amazonaws.comprehend#KmsKeyValidationException"
    | `ResourceInUseException _ -> "com.amazonaws.comprehend#ResourceInUseException"
    | `TooManyRequestsException _ -> "com.amazonaws.comprehend#TooManyRequestsException"
    | `TooManyTagsException _ -> "com.amazonaws.comprehend#TooManyTagsException"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "InternalServerException" ->
          `InternalServerException
            (Json_deserializers.internal_server_exception_of_yojson tree path)
      | _, "InvalidRequestException" ->
          `InvalidRequestException
            (Json_deserializers.invalid_request_exception_of_yojson tree path)
      | _, "KmsKeyValidationException" ->
          `KmsKeyValidationException
            (Json_deserializers.kms_key_validation_exception_of_yojson tree path)
      | _, "ResourceInUseException" ->
          `ResourceInUseException (Json_deserializers.resource_in_use_exception_of_yojson tree path)
      | _, "TooManyRequestsException" ->
          `TooManyRequestsException
            (Json_deserializers.too_many_requests_exception_of_yojson tree path)
      | _, "TooManyTagsException" ->
          `TooManyTagsException (Json_deserializers.too_many_tags_exception_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : start_topics_detection_job_request) =
    let input = Json_serializers.start_topics_detection_job_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"Comprehend_20171127.StartTopicsDetectionJob"
      ~service ~context ~input
      ~output_deserializer:Json_deserializers.start_topics_detection_job_response_of_yojson
      ~error_deserializer

  let request_with_metadata context (request : start_topics_detection_job_request) =
    let input = Json_serializers.start_topics_detection_job_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata
      ~shape_name:"Comprehend_20171127.StartTopicsDetectionJob" ~service ~context ~input
      ~output_deserializer:Json_deserializers.start_topics_detection_job_response_of_yojson
      ~error_deserializer
end

module StopDominantLanguageDetectionJob = struct
  let error_to_string = function
    | `InternalServerException _ -> "com.amazonaws.comprehend#InternalServerException"
    | `InvalidRequestException _ -> "com.amazonaws.comprehend#InvalidRequestException"
    | `JobNotFoundException _ -> "com.amazonaws.comprehend#JobNotFoundException"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "InternalServerException" ->
          `InternalServerException
            (Json_deserializers.internal_server_exception_of_yojson tree path)
      | _, "InvalidRequestException" ->
          `InvalidRequestException
            (Json_deserializers.invalid_request_exception_of_yojson tree path)
      | _, "JobNotFoundException" ->
          `JobNotFoundException (Json_deserializers.job_not_found_exception_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : stop_dominant_language_detection_job_request) =
    let input = Json_serializers.stop_dominant_language_detection_job_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request
      ~shape_name:"Comprehend_20171127.StopDominantLanguageDetectionJob" ~service ~context ~input
      ~output_deserializer:
        Json_deserializers.stop_dominant_language_detection_job_response_of_yojson
      ~error_deserializer

  let request_with_metadata context (request : stop_dominant_language_detection_job_request) =
    let input = Json_serializers.stop_dominant_language_detection_job_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata
      ~shape_name:"Comprehend_20171127.StopDominantLanguageDetectionJob" ~service ~context ~input
      ~output_deserializer:
        Json_deserializers.stop_dominant_language_detection_job_response_of_yojson
      ~error_deserializer
end

module StopEntitiesDetectionJob = struct
  let error_to_string = function
    | `InternalServerException _ -> "com.amazonaws.comprehend#InternalServerException"
    | `InvalidRequestException _ -> "com.amazonaws.comprehend#InvalidRequestException"
    | `JobNotFoundException _ -> "com.amazonaws.comprehend#JobNotFoundException"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "InternalServerException" ->
          `InternalServerException
            (Json_deserializers.internal_server_exception_of_yojson tree path)
      | _, "InvalidRequestException" ->
          `InvalidRequestException
            (Json_deserializers.invalid_request_exception_of_yojson tree path)
      | _, "JobNotFoundException" ->
          `JobNotFoundException (Json_deserializers.job_not_found_exception_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : stop_entities_detection_job_request) =
    let input = Json_serializers.stop_entities_detection_job_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"Comprehend_20171127.StopEntitiesDetectionJob"
      ~service ~context ~input
      ~output_deserializer:Json_deserializers.stop_entities_detection_job_response_of_yojson
      ~error_deserializer

  let request_with_metadata context (request : stop_entities_detection_job_request) =
    let input = Json_serializers.stop_entities_detection_job_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata
      ~shape_name:"Comprehend_20171127.StopEntitiesDetectionJob" ~service ~context ~input
      ~output_deserializer:Json_deserializers.stop_entities_detection_job_response_of_yojson
      ~error_deserializer
end

module StopEventsDetectionJob = struct
  let error_to_string = function
    | `InternalServerException _ -> "com.amazonaws.comprehend#InternalServerException"
    | `InvalidRequestException _ -> "com.amazonaws.comprehend#InvalidRequestException"
    | `JobNotFoundException _ -> "com.amazonaws.comprehend#JobNotFoundException"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "InternalServerException" ->
          `InternalServerException
            (Json_deserializers.internal_server_exception_of_yojson tree path)
      | _, "InvalidRequestException" ->
          `InvalidRequestException
            (Json_deserializers.invalid_request_exception_of_yojson tree path)
      | _, "JobNotFoundException" ->
          `JobNotFoundException (Json_deserializers.job_not_found_exception_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : stop_events_detection_job_request) =
    let input = Json_serializers.stop_events_detection_job_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"Comprehend_20171127.StopEventsDetectionJob"
      ~service ~context ~input
      ~output_deserializer:Json_deserializers.stop_events_detection_job_response_of_yojson
      ~error_deserializer

  let request_with_metadata context (request : stop_events_detection_job_request) =
    let input = Json_serializers.stop_events_detection_job_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata
      ~shape_name:"Comprehend_20171127.StopEventsDetectionJob" ~service ~context ~input
      ~output_deserializer:Json_deserializers.stop_events_detection_job_response_of_yojson
      ~error_deserializer
end

module StopKeyPhrasesDetectionJob = struct
  let error_to_string = function
    | `InternalServerException _ -> "com.amazonaws.comprehend#InternalServerException"
    | `InvalidRequestException _ -> "com.amazonaws.comprehend#InvalidRequestException"
    | `JobNotFoundException _ -> "com.amazonaws.comprehend#JobNotFoundException"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "InternalServerException" ->
          `InternalServerException
            (Json_deserializers.internal_server_exception_of_yojson tree path)
      | _, "InvalidRequestException" ->
          `InvalidRequestException
            (Json_deserializers.invalid_request_exception_of_yojson tree path)
      | _, "JobNotFoundException" ->
          `JobNotFoundException (Json_deserializers.job_not_found_exception_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : stop_key_phrases_detection_job_request) =
    let input = Json_serializers.stop_key_phrases_detection_job_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"Comprehend_20171127.StopKeyPhrasesDetectionJob"
      ~service ~context ~input
      ~output_deserializer:Json_deserializers.stop_key_phrases_detection_job_response_of_yojson
      ~error_deserializer

  let request_with_metadata context (request : stop_key_phrases_detection_job_request) =
    let input = Json_serializers.stop_key_phrases_detection_job_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata
      ~shape_name:"Comprehend_20171127.StopKeyPhrasesDetectionJob" ~service ~context ~input
      ~output_deserializer:Json_deserializers.stop_key_phrases_detection_job_response_of_yojson
      ~error_deserializer
end

module StopPiiEntitiesDetectionJob = struct
  let error_to_string = function
    | `InternalServerException _ -> "com.amazonaws.comprehend#InternalServerException"
    | `InvalidRequestException _ -> "com.amazonaws.comprehend#InvalidRequestException"
    | `JobNotFoundException _ -> "com.amazonaws.comprehend#JobNotFoundException"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "InternalServerException" ->
          `InternalServerException
            (Json_deserializers.internal_server_exception_of_yojson tree path)
      | _, "InvalidRequestException" ->
          `InvalidRequestException
            (Json_deserializers.invalid_request_exception_of_yojson tree path)
      | _, "JobNotFoundException" ->
          `JobNotFoundException (Json_deserializers.job_not_found_exception_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : stop_pii_entities_detection_job_request) =
    let input = Json_serializers.stop_pii_entities_detection_job_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request
      ~shape_name:"Comprehend_20171127.StopPiiEntitiesDetectionJob" ~service ~context ~input
      ~output_deserializer:Json_deserializers.stop_pii_entities_detection_job_response_of_yojson
      ~error_deserializer

  let request_with_metadata context (request : stop_pii_entities_detection_job_request) =
    let input = Json_serializers.stop_pii_entities_detection_job_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata
      ~shape_name:"Comprehend_20171127.StopPiiEntitiesDetectionJob" ~service ~context ~input
      ~output_deserializer:Json_deserializers.stop_pii_entities_detection_job_response_of_yojson
      ~error_deserializer
end

module StopSentimentDetectionJob = struct
  let error_to_string = function
    | `InternalServerException _ -> "com.amazonaws.comprehend#InternalServerException"
    | `InvalidRequestException _ -> "com.amazonaws.comprehend#InvalidRequestException"
    | `JobNotFoundException _ -> "com.amazonaws.comprehend#JobNotFoundException"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "InternalServerException" ->
          `InternalServerException
            (Json_deserializers.internal_server_exception_of_yojson tree path)
      | _, "InvalidRequestException" ->
          `InvalidRequestException
            (Json_deserializers.invalid_request_exception_of_yojson tree path)
      | _, "JobNotFoundException" ->
          `JobNotFoundException (Json_deserializers.job_not_found_exception_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : stop_sentiment_detection_job_request) =
    let input = Json_serializers.stop_sentiment_detection_job_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"Comprehend_20171127.StopSentimentDetectionJob"
      ~service ~context ~input
      ~output_deserializer:Json_deserializers.stop_sentiment_detection_job_response_of_yojson
      ~error_deserializer

  let request_with_metadata context (request : stop_sentiment_detection_job_request) =
    let input = Json_serializers.stop_sentiment_detection_job_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata
      ~shape_name:"Comprehend_20171127.StopSentimentDetectionJob" ~service ~context ~input
      ~output_deserializer:Json_deserializers.stop_sentiment_detection_job_response_of_yojson
      ~error_deserializer
end

module StopTargetedSentimentDetectionJob = struct
  let error_to_string = function
    | `InternalServerException _ -> "com.amazonaws.comprehend#InternalServerException"
    | `InvalidRequestException _ -> "com.amazonaws.comprehend#InvalidRequestException"
    | `JobNotFoundException _ -> "com.amazonaws.comprehend#JobNotFoundException"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "InternalServerException" ->
          `InternalServerException
            (Json_deserializers.internal_server_exception_of_yojson tree path)
      | _, "InvalidRequestException" ->
          `InvalidRequestException
            (Json_deserializers.invalid_request_exception_of_yojson tree path)
      | _, "JobNotFoundException" ->
          `JobNotFoundException (Json_deserializers.job_not_found_exception_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : stop_targeted_sentiment_detection_job_request) =
    let input = Json_serializers.stop_targeted_sentiment_detection_job_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request
      ~shape_name:"Comprehend_20171127.StopTargetedSentimentDetectionJob" ~service ~context ~input
      ~output_deserializer:
        Json_deserializers.stop_targeted_sentiment_detection_job_response_of_yojson
      ~error_deserializer

  let request_with_metadata context (request : stop_targeted_sentiment_detection_job_request) =
    let input = Json_serializers.stop_targeted_sentiment_detection_job_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata
      ~shape_name:"Comprehend_20171127.StopTargetedSentimentDetectionJob" ~service ~context ~input
      ~output_deserializer:
        Json_deserializers.stop_targeted_sentiment_detection_job_response_of_yojson
      ~error_deserializer
end

module StopTrainingDocumentClassifier = struct
  let error_to_string = function
    | `InternalServerException _ -> "com.amazonaws.comprehend#InternalServerException"
    | `InvalidRequestException _ -> "com.amazonaws.comprehend#InvalidRequestException"
    | `ResourceNotFoundException _ -> "com.amazonaws.comprehend#ResourceNotFoundException"
    | `TooManyRequestsException _ -> "com.amazonaws.comprehend#TooManyRequestsException"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "InternalServerException" ->
          `InternalServerException
            (Json_deserializers.internal_server_exception_of_yojson tree path)
      | _, "InvalidRequestException" ->
          `InvalidRequestException
            (Json_deserializers.invalid_request_exception_of_yojson tree path)
      | _, "ResourceNotFoundException" ->
          `ResourceNotFoundException
            (Json_deserializers.resource_not_found_exception_of_yojson tree path)
      | _, "TooManyRequestsException" ->
          `TooManyRequestsException
            (Json_deserializers.too_many_requests_exception_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : stop_training_document_classifier_request) =
    let input = Json_serializers.stop_training_document_classifier_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request
      ~shape_name:"Comprehend_20171127.StopTrainingDocumentClassifier" ~service ~context ~input
      ~output_deserializer:Json_deserializers.stop_training_document_classifier_response_of_yojson
      ~error_deserializer

  let request_with_metadata context (request : stop_training_document_classifier_request) =
    let input = Json_serializers.stop_training_document_classifier_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata
      ~shape_name:"Comprehend_20171127.StopTrainingDocumentClassifier" ~service ~context ~input
      ~output_deserializer:Json_deserializers.stop_training_document_classifier_response_of_yojson
      ~error_deserializer
end

module StopTrainingEntityRecognizer = struct
  let error_to_string = function
    | `InternalServerException _ -> "com.amazonaws.comprehend#InternalServerException"
    | `InvalidRequestException _ -> "com.amazonaws.comprehend#InvalidRequestException"
    | `ResourceNotFoundException _ -> "com.amazonaws.comprehend#ResourceNotFoundException"
    | `TooManyRequestsException _ -> "com.amazonaws.comprehend#TooManyRequestsException"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "InternalServerException" ->
          `InternalServerException
            (Json_deserializers.internal_server_exception_of_yojson tree path)
      | _, "InvalidRequestException" ->
          `InvalidRequestException
            (Json_deserializers.invalid_request_exception_of_yojson tree path)
      | _, "ResourceNotFoundException" ->
          `ResourceNotFoundException
            (Json_deserializers.resource_not_found_exception_of_yojson tree path)
      | _, "TooManyRequestsException" ->
          `TooManyRequestsException
            (Json_deserializers.too_many_requests_exception_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : stop_training_entity_recognizer_request) =
    let input = Json_serializers.stop_training_entity_recognizer_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request
      ~shape_name:"Comprehend_20171127.StopTrainingEntityRecognizer" ~service ~context ~input
      ~output_deserializer:Json_deserializers.stop_training_entity_recognizer_response_of_yojson
      ~error_deserializer

  let request_with_metadata context (request : stop_training_entity_recognizer_request) =
    let input = Json_serializers.stop_training_entity_recognizer_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata
      ~shape_name:"Comprehend_20171127.StopTrainingEntityRecognizer" ~service ~context ~input
      ~output_deserializer:Json_deserializers.stop_training_entity_recognizer_response_of_yojson
      ~error_deserializer
end

module TagResource = struct
  let error_to_string = function
    | `ConcurrentModificationException _ ->
        "com.amazonaws.comprehend#ConcurrentModificationException"
    | `InternalServerException _ -> "com.amazonaws.comprehend#InternalServerException"
    | `InvalidRequestException _ -> "com.amazonaws.comprehend#InvalidRequestException"
    | `ResourceNotFoundException _ -> "com.amazonaws.comprehend#ResourceNotFoundException"
    | `TooManyTagsException _ -> "com.amazonaws.comprehend#TooManyTagsException"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "ConcurrentModificationException" ->
          `ConcurrentModificationException
            (Json_deserializers.concurrent_modification_exception_of_yojson tree path)
      | _, "InternalServerException" ->
          `InternalServerException
            (Json_deserializers.internal_server_exception_of_yojson tree path)
      | _, "InvalidRequestException" ->
          `InvalidRequestException
            (Json_deserializers.invalid_request_exception_of_yojson tree path)
      | _, "ResourceNotFoundException" ->
          `ResourceNotFoundException
            (Json_deserializers.resource_not_found_exception_of_yojson tree path)
      | _, "TooManyTagsException" ->
          `TooManyTagsException (Json_deserializers.too_many_tags_exception_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : tag_resource_request) =
    let input = Json_serializers.tag_resource_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"Comprehend_20171127.TagResource" ~service
      ~context ~input ~output_deserializer:Json_deserializers.tag_resource_response_of_yojson
      ~error_deserializer

  let request_with_metadata context (request : tag_resource_request) =
    let input = Json_serializers.tag_resource_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata ~shape_name:"Comprehend_20171127.TagResource"
      ~service ~context ~input
      ~output_deserializer:Json_deserializers.tag_resource_response_of_yojson ~error_deserializer
end

module UntagResource = struct
  let error_to_string = function
    | `ConcurrentModificationException _ ->
        "com.amazonaws.comprehend#ConcurrentModificationException"
    | `InternalServerException _ -> "com.amazonaws.comprehend#InternalServerException"
    | `InvalidRequestException _ -> "com.amazonaws.comprehend#InvalidRequestException"
    | `ResourceNotFoundException _ -> "com.amazonaws.comprehend#ResourceNotFoundException"
    | `TooManyTagKeysException _ -> "com.amazonaws.comprehend#TooManyTagKeysException"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "ConcurrentModificationException" ->
          `ConcurrentModificationException
            (Json_deserializers.concurrent_modification_exception_of_yojson tree path)
      | _, "InternalServerException" ->
          `InternalServerException
            (Json_deserializers.internal_server_exception_of_yojson tree path)
      | _, "InvalidRequestException" ->
          `InvalidRequestException
            (Json_deserializers.invalid_request_exception_of_yojson tree path)
      | _, "ResourceNotFoundException" ->
          `ResourceNotFoundException
            (Json_deserializers.resource_not_found_exception_of_yojson tree path)
      | _, "TooManyTagKeysException" ->
          `TooManyTagKeysException
            (Json_deserializers.too_many_tag_keys_exception_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : untag_resource_request) =
    let input = Json_serializers.untag_resource_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"Comprehend_20171127.UntagResource" ~service
      ~context ~input ~output_deserializer:Json_deserializers.untag_resource_response_of_yojson
      ~error_deserializer

  let request_with_metadata context (request : untag_resource_request) =
    let input = Json_serializers.untag_resource_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata
      ~shape_name:"Comprehend_20171127.UntagResource" ~service ~context ~input
      ~output_deserializer:Json_deserializers.untag_resource_response_of_yojson ~error_deserializer
end

module UpdateEndpoint = struct
  let error_to_string = function
    | `InternalServerException _ -> "com.amazonaws.comprehend#InternalServerException"
    | `InvalidRequestException _ -> "com.amazonaws.comprehend#InvalidRequestException"
    | `ResourceInUseException _ -> "com.amazonaws.comprehend#ResourceInUseException"
    | `ResourceLimitExceededException _ -> "com.amazonaws.comprehend#ResourceLimitExceededException"
    | `ResourceNotFoundException _ -> "com.amazonaws.comprehend#ResourceNotFoundException"
    | `ResourceUnavailableException _ -> "com.amazonaws.comprehend#ResourceUnavailableException"
    | `TooManyRequestsException _ -> "com.amazonaws.comprehend#TooManyRequestsException"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "InternalServerException" ->
          `InternalServerException
            (Json_deserializers.internal_server_exception_of_yojson tree path)
      | _, "InvalidRequestException" ->
          `InvalidRequestException
            (Json_deserializers.invalid_request_exception_of_yojson tree path)
      | _, "ResourceInUseException" ->
          `ResourceInUseException (Json_deserializers.resource_in_use_exception_of_yojson tree path)
      | _, "ResourceLimitExceededException" ->
          `ResourceLimitExceededException
            (Json_deserializers.resource_limit_exceeded_exception_of_yojson tree path)
      | _, "ResourceNotFoundException" ->
          `ResourceNotFoundException
            (Json_deserializers.resource_not_found_exception_of_yojson tree path)
      | _, "ResourceUnavailableException" ->
          `ResourceUnavailableException
            (Json_deserializers.resource_unavailable_exception_of_yojson tree path)
      | _, "TooManyRequestsException" ->
          `TooManyRequestsException
            (Json_deserializers.too_many_requests_exception_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : update_endpoint_request) =
    let input = Json_serializers.update_endpoint_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"Comprehend_20171127.UpdateEndpoint" ~service
      ~context ~input ~output_deserializer:Json_deserializers.update_endpoint_response_of_yojson
      ~error_deserializer

  let request_with_metadata context (request : update_endpoint_request) =
    let input = Json_serializers.update_endpoint_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata
      ~shape_name:"Comprehend_20171127.UpdateEndpoint" ~service ~context ~input
      ~output_deserializer:Json_deserializers.update_endpoint_response_of_yojson ~error_deserializer
end

module UpdateFlywheel = struct
  let error_to_string = function
    | `InternalServerException _ -> "com.amazonaws.comprehend#InternalServerException"
    | `InvalidRequestException _ -> "com.amazonaws.comprehend#InvalidRequestException"
    | `KmsKeyValidationException _ -> "com.amazonaws.comprehend#KmsKeyValidationException"
    | `ResourceNotFoundException _ -> "com.amazonaws.comprehend#ResourceNotFoundException"
    | `TooManyRequestsException _ -> "com.amazonaws.comprehend#TooManyRequestsException"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "InternalServerException" ->
          `InternalServerException
            (Json_deserializers.internal_server_exception_of_yojson tree path)
      | _, "InvalidRequestException" ->
          `InvalidRequestException
            (Json_deserializers.invalid_request_exception_of_yojson tree path)
      | _, "KmsKeyValidationException" ->
          `KmsKeyValidationException
            (Json_deserializers.kms_key_validation_exception_of_yojson tree path)
      | _, "ResourceNotFoundException" ->
          `ResourceNotFoundException
            (Json_deserializers.resource_not_found_exception_of_yojson tree path)
      | _, "TooManyRequestsException" ->
          `TooManyRequestsException
            (Json_deserializers.too_many_requests_exception_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : update_flywheel_request) =
    let input = Json_serializers.update_flywheel_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"Comprehend_20171127.UpdateFlywheel" ~service
      ~context ~input ~output_deserializer:Json_deserializers.update_flywheel_response_of_yojson
      ~error_deserializer

  let request_with_metadata context (request : update_flywheel_request) =
    let input = Json_serializers.update_flywheel_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata
      ~shape_name:"Comprehend_20171127.UpdateFlywheel" ~service ~context ~input
      ~output_deserializer:Json_deserializers.update_flywheel_response_of_yojson ~error_deserializer
end
