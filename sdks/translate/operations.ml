open Types
open Service_metadata

module CreateParallelData = struct
  let error_to_string = function
    | `ConcurrentModificationException _ ->
        "com.amazonaws.translate#ConcurrentModificationException"
    | `ConflictException _ -> "com.amazonaws.translate#ConflictException"
    | `InternalServerException _ -> "com.amazonaws.translate#InternalServerException"
    | `InvalidParameterValueException _ -> "com.amazonaws.translate#InvalidParameterValueException"
    | `InvalidRequestException _ -> "com.amazonaws.translate#InvalidRequestException"
    | `LimitExceededException _ -> "com.amazonaws.translate#LimitExceededException"
    | `TooManyRequestsException _ -> "com.amazonaws.translate#TooManyRequestsException"
    | `TooManyTagsException _ -> "com.amazonaws.translate#TooManyTagsException"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "ConcurrentModificationException" ->
          `ConcurrentModificationException
            (Json_deserializers.concurrent_modification_exception_of_yojson tree path)
      | _, "ConflictException" ->
          `ConflictException (Json_deserializers.conflict_exception_of_yojson tree path)
      | _, "InternalServerException" ->
          `InternalServerException
            (Json_deserializers.internal_server_exception_of_yojson tree path)
      | _, "InvalidParameterValueException" ->
          `InvalidParameterValueException
            (Json_deserializers.invalid_parameter_value_exception_of_yojson tree path)
      | _, "InvalidRequestException" ->
          `InvalidRequestException
            (Json_deserializers.invalid_request_exception_of_yojson tree path)
      | _, "LimitExceededException" ->
          `LimitExceededException (Json_deserializers.limit_exceeded_exception_of_yojson tree path)
      | _, "TooManyRequestsException" ->
          `TooManyRequestsException
            (Json_deserializers.too_many_requests_exception_of_yojson tree path)
      | _, "TooManyTagsException" ->
          `TooManyTagsException (Json_deserializers.too_many_tags_exception_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : create_parallel_data_request) =
    let input = Json_serializers.create_parallel_data_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request
      ~shape_name:"AWSShineFrontendService_20170701.CreateParallelData" ~service ~context ~input
      ~output_deserializer:Json_deserializers.create_parallel_data_response_of_yojson
      ~error_deserializer

  let request_with_metadata context (request : create_parallel_data_request) =
    let input = Json_serializers.create_parallel_data_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata
      ~shape_name:"AWSShineFrontendService_20170701.CreateParallelData" ~service ~context ~input
      ~output_deserializer:Json_deserializers.create_parallel_data_response_of_yojson
      ~error_deserializer
end

module DeleteParallelData = struct
  let error_to_string = function
    | `ConcurrentModificationException _ ->
        "com.amazonaws.translate#ConcurrentModificationException"
    | `InternalServerException _ -> "com.amazonaws.translate#InternalServerException"
    | `ResourceNotFoundException _ -> "com.amazonaws.translate#ResourceNotFoundException"
    | `TooManyRequestsException _ -> "com.amazonaws.translate#TooManyRequestsException"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "ConcurrentModificationException" ->
          `ConcurrentModificationException
            (Json_deserializers.concurrent_modification_exception_of_yojson tree path)
      | _, "InternalServerException" ->
          `InternalServerException
            (Json_deserializers.internal_server_exception_of_yojson tree path)
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

  let request context (request : delete_parallel_data_request) =
    let input = Json_serializers.delete_parallel_data_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request
      ~shape_name:"AWSShineFrontendService_20170701.DeleteParallelData" ~service ~context ~input
      ~output_deserializer:Json_deserializers.delete_parallel_data_response_of_yojson
      ~error_deserializer

  let request_with_metadata context (request : delete_parallel_data_request) =
    let input = Json_serializers.delete_parallel_data_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata
      ~shape_name:"AWSShineFrontendService_20170701.DeleteParallelData" ~service ~context ~input
      ~output_deserializer:Json_deserializers.delete_parallel_data_response_of_yojson
      ~error_deserializer
end

module DeleteTerminology = struct
  let error_to_string = function
    | `InternalServerException _ -> "com.amazonaws.translate#InternalServerException"
    | `InvalidParameterValueException _ -> "com.amazonaws.translate#InvalidParameterValueException"
    | `ResourceNotFoundException _ -> "com.amazonaws.translate#ResourceNotFoundException"
    | `TooManyRequestsException _ -> "com.amazonaws.translate#TooManyRequestsException"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "InternalServerException" ->
          `InternalServerException
            (Json_deserializers.internal_server_exception_of_yojson tree path)
      | _, "InvalidParameterValueException" ->
          `InvalidParameterValueException
            (Json_deserializers.invalid_parameter_value_exception_of_yojson tree path)
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

  let request context (request : delete_terminology_request) =
    let input = Json_serializers.delete_terminology_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request
      ~shape_name:"AWSShineFrontendService_20170701.DeleteTerminology" ~service ~context ~input
      ~output_deserializer:Smaws_Lib.Smithy_api.Json_deserializers.unit__of_yojson
      ~error_deserializer

  let request_with_metadata context (request : delete_terminology_request) =
    let input = Json_serializers.delete_terminology_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata
      ~shape_name:"AWSShineFrontendService_20170701.DeleteTerminology" ~service ~context ~input
      ~output_deserializer:Smaws_Lib.Smithy_api.Json_deserializers.unit__of_yojson
      ~error_deserializer
end

module DescribeTextTranslationJob = struct
  let error_to_string = function
    | `InternalServerException _ -> "com.amazonaws.translate#InternalServerException"
    | `ResourceNotFoundException _ -> "com.amazonaws.translate#ResourceNotFoundException"
    | `TooManyRequestsException _ -> "com.amazonaws.translate#TooManyRequestsException"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "InternalServerException" ->
          `InternalServerException
            (Json_deserializers.internal_server_exception_of_yojson tree path)
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

  let request context (request : describe_text_translation_job_request) =
    let input = Json_serializers.describe_text_translation_job_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request
      ~shape_name:"AWSShineFrontendService_20170701.DescribeTextTranslationJob" ~service ~context
      ~input
      ~output_deserializer:Json_deserializers.describe_text_translation_job_response_of_yojson
      ~error_deserializer

  let request_with_metadata context (request : describe_text_translation_job_request) =
    let input = Json_serializers.describe_text_translation_job_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata
      ~shape_name:"AWSShineFrontendService_20170701.DescribeTextTranslationJob" ~service ~context
      ~input
      ~output_deserializer:Json_deserializers.describe_text_translation_job_response_of_yojson
      ~error_deserializer
end

module GetParallelData = struct
  let error_to_string = function
    | `InternalServerException _ -> "com.amazonaws.translate#InternalServerException"
    | `InvalidParameterValueException _ -> "com.amazonaws.translate#InvalidParameterValueException"
    | `ResourceNotFoundException _ -> "com.amazonaws.translate#ResourceNotFoundException"
    | `TooManyRequestsException _ -> "com.amazonaws.translate#TooManyRequestsException"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "InternalServerException" ->
          `InternalServerException
            (Json_deserializers.internal_server_exception_of_yojson tree path)
      | _, "InvalidParameterValueException" ->
          `InvalidParameterValueException
            (Json_deserializers.invalid_parameter_value_exception_of_yojson tree path)
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

  let request context (request : get_parallel_data_request) =
    let input = Json_serializers.get_parallel_data_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request
      ~shape_name:"AWSShineFrontendService_20170701.GetParallelData" ~service ~context ~input
      ~output_deserializer:Json_deserializers.get_parallel_data_response_of_yojson
      ~error_deserializer

  let request_with_metadata context (request : get_parallel_data_request) =
    let input = Json_serializers.get_parallel_data_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata
      ~shape_name:"AWSShineFrontendService_20170701.GetParallelData" ~service ~context ~input
      ~output_deserializer:Json_deserializers.get_parallel_data_response_of_yojson
      ~error_deserializer
end

module GetTerminology = struct
  let error_to_string = function
    | `InternalServerException _ -> "com.amazonaws.translate#InternalServerException"
    | `InvalidParameterValueException _ -> "com.amazonaws.translate#InvalidParameterValueException"
    | `ResourceNotFoundException _ -> "com.amazonaws.translate#ResourceNotFoundException"
    | `TooManyRequestsException _ -> "com.amazonaws.translate#TooManyRequestsException"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "InternalServerException" ->
          `InternalServerException
            (Json_deserializers.internal_server_exception_of_yojson tree path)
      | _, "InvalidParameterValueException" ->
          `InvalidParameterValueException
            (Json_deserializers.invalid_parameter_value_exception_of_yojson tree path)
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

  let request context (request : get_terminology_request) =
    let input = Json_serializers.get_terminology_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request
      ~shape_name:"AWSShineFrontendService_20170701.GetTerminology" ~service ~context ~input
      ~output_deserializer:Json_deserializers.get_terminology_response_of_yojson ~error_deserializer

  let request_with_metadata context (request : get_terminology_request) =
    let input = Json_serializers.get_terminology_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata
      ~shape_name:"AWSShineFrontendService_20170701.GetTerminology" ~service ~context ~input
      ~output_deserializer:Json_deserializers.get_terminology_response_of_yojson ~error_deserializer
end

module ImportTerminology = struct
  let error_to_string = function
    | `ConcurrentModificationException _ ->
        "com.amazonaws.translate#ConcurrentModificationException"
    | `InternalServerException _ -> "com.amazonaws.translate#InternalServerException"
    | `InvalidParameterValueException _ -> "com.amazonaws.translate#InvalidParameterValueException"
    | `LimitExceededException _ -> "com.amazonaws.translate#LimitExceededException"
    | `TooManyRequestsException _ -> "com.amazonaws.translate#TooManyRequestsException"
    | `TooManyTagsException _ -> "com.amazonaws.translate#TooManyTagsException"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "ConcurrentModificationException" ->
          `ConcurrentModificationException
            (Json_deserializers.concurrent_modification_exception_of_yojson tree path)
      | _, "InternalServerException" ->
          `InternalServerException
            (Json_deserializers.internal_server_exception_of_yojson tree path)
      | _, "InvalidParameterValueException" ->
          `InvalidParameterValueException
            (Json_deserializers.invalid_parameter_value_exception_of_yojson tree path)
      | _, "LimitExceededException" ->
          `LimitExceededException (Json_deserializers.limit_exceeded_exception_of_yojson tree path)
      | _, "TooManyRequestsException" ->
          `TooManyRequestsException
            (Json_deserializers.too_many_requests_exception_of_yojson tree path)
      | _, "TooManyTagsException" ->
          `TooManyTagsException (Json_deserializers.too_many_tags_exception_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : import_terminology_request) =
    let input = Json_serializers.import_terminology_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request
      ~shape_name:"AWSShineFrontendService_20170701.ImportTerminology" ~service ~context ~input
      ~output_deserializer:Json_deserializers.import_terminology_response_of_yojson
      ~error_deserializer

  let request_with_metadata context (request : import_terminology_request) =
    let input = Json_serializers.import_terminology_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata
      ~shape_name:"AWSShineFrontendService_20170701.ImportTerminology" ~service ~context ~input
      ~output_deserializer:Json_deserializers.import_terminology_response_of_yojson
      ~error_deserializer
end

module ListLanguages = struct
  let error_to_string = function
    | `InternalServerException _ -> "com.amazonaws.translate#InternalServerException"
    | `InvalidParameterValueException _ -> "com.amazonaws.translate#InvalidParameterValueException"
    | `TooManyRequestsException _ -> "com.amazonaws.translate#TooManyRequestsException"
    | `UnsupportedDisplayLanguageCodeException _ ->
        "com.amazonaws.translate#UnsupportedDisplayLanguageCodeException"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "InternalServerException" ->
          `InternalServerException
            (Json_deserializers.internal_server_exception_of_yojson tree path)
      | _, "InvalidParameterValueException" ->
          `InvalidParameterValueException
            (Json_deserializers.invalid_parameter_value_exception_of_yojson tree path)
      | _, "TooManyRequestsException" ->
          `TooManyRequestsException
            (Json_deserializers.too_many_requests_exception_of_yojson tree path)
      | _, "UnsupportedDisplayLanguageCodeException" ->
          `UnsupportedDisplayLanguageCodeException
            (Json_deserializers.unsupported_display_language_code_exception_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : list_languages_request) =
    let input = Json_serializers.list_languages_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"AWSShineFrontendService_20170701.ListLanguages"
      ~service ~context ~input
      ~output_deserializer:Json_deserializers.list_languages_response_of_yojson ~error_deserializer

  let request_with_metadata context (request : list_languages_request) =
    let input = Json_serializers.list_languages_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata
      ~shape_name:"AWSShineFrontendService_20170701.ListLanguages" ~service ~context ~input
      ~output_deserializer:Json_deserializers.list_languages_response_of_yojson ~error_deserializer
end

module ListParallelData = struct
  let error_to_string = function
    | `InternalServerException _ -> "com.amazonaws.translate#InternalServerException"
    | `InvalidParameterValueException _ -> "com.amazonaws.translate#InvalidParameterValueException"
    | `TooManyRequestsException _ -> "com.amazonaws.translate#TooManyRequestsException"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "InternalServerException" ->
          `InternalServerException
            (Json_deserializers.internal_server_exception_of_yojson tree path)
      | _, "InvalidParameterValueException" ->
          `InvalidParameterValueException
            (Json_deserializers.invalid_parameter_value_exception_of_yojson tree path)
      | _, "TooManyRequestsException" ->
          `TooManyRequestsException
            (Json_deserializers.too_many_requests_exception_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : list_parallel_data_request) =
    let input = Json_serializers.list_parallel_data_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request
      ~shape_name:"AWSShineFrontendService_20170701.ListParallelData" ~service ~context ~input
      ~output_deserializer:Json_deserializers.list_parallel_data_response_of_yojson
      ~error_deserializer

  let request_with_metadata context (request : list_parallel_data_request) =
    let input = Json_serializers.list_parallel_data_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata
      ~shape_name:"AWSShineFrontendService_20170701.ListParallelData" ~service ~context ~input
      ~output_deserializer:Json_deserializers.list_parallel_data_response_of_yojson
      ~error_deserializer
end

module ListTagsForResource = struct
  let error_to_string = function
    | `InternalServerException _ -> "com.amazonaws.translate#InternalServerException"
    | `InvalidParameterValueException _ -> "com.amazonaws.translate#InvalidParameterValueException"
    | `ResourceNotFoundException _ -> "com.amazonaws.translate#ResourceNotFoundException"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "InternalServerException" ->
          `InternalServerException
            (Json_deserializers.internal_server_exception_of_yojson tree path)
      | _, "InvalidParameterValueException" ->
          `InvalidParameterValueException
            (Json_deserializers.invalid_parameter_value_exception_of_yojson tree path)
      | _, "ResourceNotFoundException" ->
          `ResourceNotFoundException
            (Json_deserializers.resource_not_found_exception_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : list_tags_for_resource_request) =
    let input = Json_serializers.list_tags_for_resource_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request
      ~shape_name:"AWSShineFrontendService_20170701.ListTagsForResource" ~service ~context ~input
      ~output_deserializer:Json_deserializers.list_tags_for_resource_response_of_yojson
      ~error_deserializer

  let request_with_metadata context (request : list_tags_for_resource_request) =
    let input = Json_serializers.list_tags_for_resource_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata
      ~shape_name:"AWSShineFrontendService_20170701.ListTagsForResource" ~service ~context ~input
      ~output_deserializer:Json_deserializers.list_tags_for_resource_response_of_yojson
      ~error_deserializer
end

module ListTerminologies = struct
  let error_to_string = function
    | `InternalServerException _ -> "com.amazonaws.translate#InternalServerException"
    | `InvalidParameterValueException _ -> "com.amazonaws.translate#InvalidParameterValueException"
    | `TooManyRequestsException _ -> "com.amazonaws.translate#TooManyRequestsException"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "InternalServerException" ->
          `InternalServerException
            (Json_deserializers.internal_server_exception_of_yojson tree path)
      | _, "InvalidParameterValueException" ->
          `InvalidParameterValueException
            (Json_deserializers.invalid_parameter_value_exception_of_yojson tree path)
      | _, "TooManyRequestsException" ->
          `TooManyRequestsException
            (Json_deserializers.too_many_requests_exception_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : list_terminologies_request) =
    let input = Json_serializers.list_terminologies_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request
      ~shape_name:"AWSShineFrontendService_20170701.ListTerminologies" ~service ~context ~input
      ~output_deserializer:Json_deserializers.list_terminologies_response_of_yojson
      ~error_deserializer

  let request_with_metadata context (request : list_terminologies_request) =
    let input = Json_serializers.list_terminologies_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata
      ~shape_name:"AWSShineFrontendService_20170701.ListTerminologies" ~service ~context ~input
      ~output_deserializer:Json_deserializers.list_terminologies_response_of_yojson
      ~error_deserializer
end

module ListTextTranslationJobs = struct
  let error_to_string = function
    | `InternalServerException _ -> "com.amazonaws.translate#InternalServerException"
    | `InvalidFilterException _ -> "com.amazonaws.translate#InvalidFilterException"
    | `InvalidRequestException _ -> "com.amazonaws.translate#InvalidRequestException"
    | `TooManyRequestsException _ -> "com.amazonaws.translate#TooManyRequestsException"
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

  let request context (request : list_text_translation_jobs_request) =
    let input = Json_serializers.list_text_translation_jobs_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request
      ~shape_name:"AWSShineFrontendService_20170701.ListTextTranslationJobs" ~service ~context
      ~input ~output_deserializer:Json_deserializers.list_text_translation_jobs_response_of_yojson
      ~error_deserializer

  let request_with_metadata context (request : list_text_translation_jobs_request) =
    let input = Json_serializers.list_text_translation_jobs_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata
      ~shape_name:"AWSShineFrontendService_20170701.ListTextTranslationJobs" ~service ~context
      ~input ~output_deserializer:Json_deserializers.list_text_translation_jobs_response_of_yojson
      ~error_deserializer
end

module StartTextTranslationJob = struct
  let error_to_string = function
    | `InternalServerException _ -> "com.amazonaws.translate#InternalServerException"
    | `InvalidParameterValueException _ -> "com.amazonaws.translate#InvalidParameterValueException"
    | `InvalidRequestException _ -> "com.amazonaws.translate#InvalidRequestException"
    | `ResourceNotFoundException _ -> "com.amazonaws.translate#ResourceNotFoundException"
    | `TooManyRequestsException _ -> "com.amazonaws.translate#TooManyRequestsException"
    | `UnsupportedLanguagePairException _ ->
        "com.amazonaws.translate#UnsupportedLanguagePairException"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "InternalServerException" ->
          `InternalServerException
            (Json_deserializers.internal_server_exception_of_yojson tree path)
      | _, "InvalidParameterValueException" ->
          `InvalidParameterValueException
            (Json_deserializers.invalid_parameter_value_exception_of_yojson tree path)
      | _, "InvalidRequestException" ->
          `InvalidRequestException
            (Json_deserializers.invalid_request_exception_of_yojson tree path)
      | _, "ResourceNotFoundException" ->
          `ResourceNotFoundException
            (Json_deserializers.resource_not_found_exception_of_yojson tree path)
      | _, "TooManyRequestsException" ->
          `TooManyRequestsException
            (Json_deserializers.too_many_requests_exception_of_yojson tree path)
      | _, "UnsupportedLanguagePairException" ->
          `UnsupportedLanguagePairException
            (Json_deserializers.unsupported_language_pair_exception_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : start_text_translation_job_request) =
    let input = Json_serializers.start_text_translation_job_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request
      ~shape_name:"AWSShineFrontendService_20170701.StartTextTranslationJob" ~service ~context
      ~input ~output_deserializer:Json_deserializers.start_text_translation_job_response_of_yojson
      ~error_deserializer

  let request_with_metadata context (request : start_text_translation_job_request) =
    let input = Json_serializers.start_text_translation_job_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata
      ~shape_name:"AWSShineFrontendService_20170701.StartTextTranslationJob" ~service ~context
      ~input ~output_deserializer:Json_deserializers.start_text_translation_job_response_of_yojson
      ~error_deserializer
end

module StopTextTranslationJob = struct
  let error_to_string = function
    | `InternalServerException _ -> "com.amazonaws.translate#InternalServerException"
    | `ResourceNotFoundException _ -> "com.amazonaws.translate#ResourceNotFoundException"
    | `TooManyRequestsException _ -> "com.amazonaws.translate#TooManyRequestsException"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "InternalServerException" ->
          `InternalServerException
            (Json_deserializers.internal_server_exception_of_yojson tree path)
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

  let request context (request : stop_text_translation_job_request) =
    let input = Json_serializers.stop_text_translation_job_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request
      ~shape_name:"AWSShineFrontendService_20170701.StopTextTranslationJob" ~service ~context ~input
      ~output_deserializer:Json_deserializers.stop_text_translation_job_response_of_yojson
      ~error_deserializer

  let request_with_metadata context (request : stop_text_translation_job_request) =
    let input = Json_serializers.stop_text_translation_job_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata
      ~shape_name:"AWSShineFrontendService_20170701.StopTextTranslationJob" ~service ~context ~input
      ~output_deserializer:Json_deserializers.stop_text_translation_job_response_of_yojson
      ~error_deserializer
end

module TagResource = struct
  let error_to_string = function
    | `ConcurrentModificationException _ ->
        "com.amazonaws.translate#ConcurrentModificationException"
    | `InternalServerException _ -> "com.amazonaws.translate#InternalServerException"
    | `InvalidParameterValueException _ -> "com.amazonaws.translate#InvalidParameterValueException"
    | `ResourceNotFoundException _ -> "com.amazonaws.translate#ResourceNotFoundException"
    | `TooManyTagsException _ -> "com.amazonaws.translate#TooManyTagsException"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "ConcurrentModificationException" ->
          `ConcurrentModificationException
            (Json_deserializers.concurrent_modification_exception_of_yojson tree path)
      | _, "InternalServerException" ->
          `InternalServerException
            (Json_deserializers.internal_server_exception_of_yojson tree path)
      | _, "InvalidParameterValueException" ->
          `InvalidParameterValueException
            (Json_deserializers.invalid_parameter_value_exception_of_yojson tree path)
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
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"AWSShineFrontendService_20170701.TagResource"
      ~service ~context ~input
      ~output_deserializer:Json_deserializers.tag_resource_response_of_yojson ~error_deserializer

  let request_with_metadata context (request : tag_resource_request) =
    let input = Json_serializers.tag_resource_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata
      ~shape_name:"AWSShineFrontendService_20170701.TagResource" ~service ~context ~input
      ~output_deserializer:Json_deserializers.tag_resource_response_of_yojson ~error_deserializer
end

module TranslateDocument = struct
  let error_to_string = function
    | `InternalServerException _ -> "com.amazonaws.translate#InternalServerException"
    | `InvalidRequestException _ -> "com.amazonaws.translate#InvalidRequestException"
    | `LimitExceededException _ -> "com.amazonaws.translate#LimitExceededException"
    | `ResourceNotFoundException _ -> "com.amazonaws.translate#ResourceNotFoundException"
    | `ServiceUnavailableException _ -> "com.amazonaws.translate#ServiceUnavailableException"
    | `TooManyRequestsException _ -> "com.amazonaws.translate#TooManyRequestsException"
    | `UnsupportedLanguagePairException _ ->
        "com.amazonaws.translate#UnsupportedLanguagePairException"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "InternalServerException" ->
          `InternalServerException
            (Json_deserializers.internal_server_exception_of_yojson tree path)
      | _, "InvalidRequestException" ->
          `InvalidRequestException
            (Json_deserializers.invalid_request_exception_of_yojson tree path)
      | _, "LimitExceededException" ->
          `LimitExceededException (Json_deserializers.limit_exceeded_exception_of_yojson tree path)
      | _, "ResourceNotFoundException" ->
          `ResourceNotFoundException
            (Json_deserializers.resource_not_found_exception_of_yojson tree path)
      | _, "ServiceUnavailableException" ->
          `ServiceUnavailableException
            (Json_deserializers.service_unavailable_exception_of_yojson tree path)
      | _, "TooManyRequestsException" ->
          `TooManyRequestsException
            (Json_deserializers.too_many_requests_exception_of_yojson tree path)
      | _, "UnsupportedLanguagePairException" ->
          `UnsupportedLanguagePairException
            (Json_deserializers.unsupported_language_pair_exception_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : translate_document_request) =
    let input = Json_serializers.translate_document_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request
      ~shape_name:"AWSShineFrontendService_20170701.TranslateDocument" ~service ~context ~input
      ~output_deserializer:Json_deserializers.translate_document_response_of_yojson
      ~error_deserializer

  let request_with_metadata context (request : translate_document_request) =
    let input = Json_serializers.translate_document_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata
      ~shape_name:"AWSShineFrontendService_20170701.TranslateDocument" ~service ~context ~input
      ~output_deserializer:Json_deserializers.translate_document_response_of_yojson
      ~error_deserializer
end

module TranslateText = struct
  let error_to_string = function
    | `DetectedLanguageLowConfidenceException _ ->
        "com.amazonaws.translate#DetectedLanguageLowConfidenceException"
    | `InternalServerException _ -> "com.amazonaws.translate#InternalServerException"
    | `InvalidRequestException _ -> "com.amazonaws.translate#InvalidRequestException"
    | `ResourceNotFoundException _ -> "com.amazonaws.translate#ResourceNotFoundException"
    | `ServiceUnavailableException _ -> "com.amazonaws.translate#ServiceUnavailableException"
    | `TextSizeLimitExceededException _ -> "com.amazonaws.translate#TextSizeLimitExceededException"
    | `TooManyRequestsException _ -> "com.amazonaws.translate#TooManyRequestsException"
    | `UnsupportedLanguagePairException _ ->
        "com.amazonaws.translate#UnsupportedLanguagePairException"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "DetectedLanguageLowConfidenceException" ->
          `DetectedLanguageLowConfidenceException
            (Json_deserializers.detected_language_low_confidence_exception_of_yojson tree path)
      | _, "InternalServerException" ->
          `InternalServerException
            (Json_deserializers.internal_server_exception_of_yojson tree path)
      | _, "InvalidRequestException" ->
          `InvalidRequestException
            (Json_deserializers.invalid_request_exception_of_yojson tree path)
      | _, "ResourceNotFoundException" ->
          `ResourceNotFoundException
            (Json_deserializers.resource_not_found_exception_of_yojson tree path)
      | _, "ServiceUnavailableException" ->
          `ServiceUnavailableException
            (Json_deserializers.service_unavailable_exception_of_yojson tree path)
      | _, "TextSizeLimitExceededException" ->
          `TextSizeLimitExceededException
            (Json_deserializers.text_size_limit_exceeded_exception_of_yojson tree path)
      | _, "TooManyRequestsException" ->
          `TooManyRequestsException
            (Json_deserializers.too_many_requests_exception_of_yojson tree path)
      | _, "UnsupportedLanguagePairException" ->
          `UnsupportedLanguagePairException
            (Json_deserializers.unsupported_language_pair_exception_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : translate_text_request) =
    let input = Json_serializers.translate_text_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"AWSShineFrontendService_20170701.TranslateText"
      ~service ~context ~input
      ~output_deserializer:Json_deserializers.translate_text_response_of_yojson ~error_deserializer

  let request_with_metadata context (request : translate_text_request) =
    let input = Json_serializers.translate_text_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata
      ~shape_name:"AWSShineFrontendService_20170701.TranslateText" ~service ~context ~input
      ~output_deserializer:Json_deserializers.translate_text_response_of_yojson ~error_deserializer
end

module UntagResource = struct
  let error_to_string = function
    | `ConcurrentModificationException _ ->
        "com.amazonaws.translate#ConcurrentModificationException"
    | `InternalServerException _ -> "com.amazonaws.translate#InternalServerException"
    | `InvalidParameterValueException _ -> "com.amazonaws.translate#InvalidParameterValueException"
    | `ResourceNotFoundException _ -> "com.amazonaws.translate#ResourceNotFoundException"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "ConcurrentModificationException" ->
          `ConcurrentModificationException
            (Json_deserializers.concurrent_modification_exception_of_yojson tree path)
      | _, "InternalServerException" ->
          `InternalServerException
            (Json_deserializers.internal_server_exception_of_yojson tree path)
      | _, "InvalidParameterValueException" ->
          `InvalidParameterValueException
            (Json_deserializers.invalid_parameter_value_exception_of_yojson tree path)
      | _, "ResourceNotFoundException" ->
          `ResourceNotFoundException
            (Json_deserializers.resource_not_found_exception_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : untag_resource_request) =
    let input = Json_serializers.untag_resource_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"AWSShineFrontendService_20170701.UntagResource"
      ~service ~context ~input
      ~output_deserializer:Json_deserializers.untag_resource_response_of_yojson ~error_deserializer

  let request_with_metadata context (request : untag_resource_request) =
    let input = Json_serializers.untag_resource_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata
      ~shape_name:"AWSShineFrontendService_20170701.UntagResource" ~service ~context ~input
      ~output_deserializer:Json_deserializers.untag_resource_response_of_yojson ~error_deserializer
end

module UpdateParallelData = struct
  let error_to_string = function
    | `ConcurrentModificationException _ ->
        "com.amazonaws.translate#ConcurrentModificationException"
    | `ConflictException _ -> "com.amazonaws.translate#ConflictException"
    | `InternalServerException _ -> "com.amazonaws.translate#InternalServerException"
    | `InvalidParameterValueException _ -> "com.amazonaws.translate#InvalidParameterValueException"
    | `InvalidRequestException _ -> "com.amazonaws.translate#InvalidRequestException"
    | `LimitExceededException _ -> "com.amazonaws.translate#LimitExceededException"
    | `ResourceNotFoundException _ -> "com.amazonaws.translate#ResourceNotFoundException"
    | `TooManyRequestsException _ -> "com.amazonaws.translate#TooManyRequestsException"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "ConcurrentModificationException" ->
          `ConcurrentModificationException
            (Json_deserializers.concurrent_modification_exception_of_yojson tree path)
      | _, "ConflictException" ->
          `ConflictException (Json_deserializers.conflict_exception_of_yojson tree path)
      | _, "InternalServerException" ->
          `InternalServerException
            (Json_deserializers.internal_server_exception_of_yojson tree path)
      | _, "InvalidParameterValueException" ->
          `InvalidParameterValueException
            (Json_deserializers.invalid_parameter_value_exception_of_yojson tree path)
      | _, "InvalidRequestException" ->
          `InvalidRequestException
            (Json_deserializers.invalid_request_exception_of_yojson tree path)
      | _, "LimitExceededException" ->
          `LimitExceededException (Json_deserializers.limit_exceeded_exception_of_yojson tree path)
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

  let request context (request : update_parallel_data_request) =
    let input = Json_serializers.update_parallel_data_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request
      ~shape_name:"AWSShineFrontendService_20170701.UpdateParallelData" ~service ~context ~input
      ~output_deserializer:Json_deserializers.update_parallel_data_response_of_yojson
      ~error_deserializer

  let request_with_metadata context (request : update_parallel_data_request) =
    let input = Json_serializers.update_parallel_data_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata
      ~shape_name:"AWSShineFrontendService_20170701.UpdateParallelData" ~service ~context ~input
      ~output_deserializer:Json_deserializers.update_parallel_data_response_of_yojson
      ~error_deserializer
end
