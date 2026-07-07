open Types
open Service_metadata

module DescribeEntitiesDetectionV2Job = struct
  let error_to_string = function
    | `InternalServerException _ -> "com.amazonaws.comprehendmedical#InternalServerException"
    | `InvalidRequestException _ -> "com.amazonaws.comprehendmedical#InvalidRequestException"
    | `ResourceNotFoundException _ -> "com.amazonaws.comprehendmedical#ResourceNotFoundException"
    | `TooManyRequestsException _ -> "com.amazonaws.comprehendmedical#TooManyRequestsException"
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

  let request context (request : describe_entities_detection_v2_job_request) =
    let input = Json_serializers.describe_entities_detection_v2_job_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request
      ~shape_name:"ComprehendMedical_20181030.DescribeEntitiesDetectionV2Job" ~service ~context
      ~input
      ~output_deserializer:Json_deserializers.describe_entities_detection_v2_job_response_of_yojson
      ~error_deserializer

  let request_with_metadata context (request : describe_entities_detection_v2_job_request) =
    let input = Json_serializers.describe_entities_detection_v2_job_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata
      ~shape_name:"ComprehendMedical_20181030.DescribeEntitiesDetectionV2Job" ~service ~context
      ~input
      ~output_deserializer:Json_deserializers.describe_entities_detection_v2_job_response_of_yojson
      ~error_deserializer
end

module DescribeICD10CMInferenceJob = struct
  let error_to_string = function
    | `InternalServerException _ -> "com.amazonaws.comprehendmedical#InternalServerException"
    | `InvalidRequestException _ -> "com.amazonaws.comprehendmedical#InvalidRequestException"
    | `ResourceNotFoundException _ -> "com.amazonaws.comprehendmedical#ResourceNotFoundException"
    | `TooManyRequestsException _ -> "com.amazonaws.comprehendmedical#TooManyRequestsException"
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

  let request context (request : describe_icd10cm_inference_job_request) =
    let input = Json_serializers.describe_icd10cm_inference_job_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request
      ~shape_name:"ComprehendMedical_20181030.DescribeICD10CMInferenceJob" ~service ~context ~input
      ~output_deserializer:Json_deserializers.describe_icd10cm_inference_job_response_of_yojson
      ~error_deserializer

  let request_with_metadata context (request : describe_icd10cm_inference_job_request) =
    let input = Json_serializers.describe_icd10cm_inference_job_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata
      ~shape_name:"ComprehendMedical_20181030.DescribeICD10CMInferenceJob" ~service ~context ~input
      ~output_deserializer:Json_deserializers.describe_icd10cm_inference_job_response_of_yojson
      ~error_deserializer
end

module DescribePHIDetectionJob = struct
  let error_to_string = function
    | `InternalServerException _ -> "com.amazonaws.comprehendmedical#InternalServerException"
    | `InvalidRequestException _ -> "com.amazonaws.comprehendmedical#InvalidRequestException"
    | `ResourceNotFoundException _ -> "com.amazonaws.comprehendmedical#ResourceNotFoundException"
    | `TooManyRequestsException _ -> "com.amazonaws.comprehendmedical#TooManyRequestsException"
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

  let request context (request : describe_phi_detection_job_request) =
    let input = Json_serializers.describe_phi_detection_job_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request
      ~shape_name:"ComprehendMedical_20181030.DescribePHIDetectionJob" ~service ~context ~input
      ~output_deserializer:Json_deserializers.describe_phi_detection_job_response_of_yojson
      ~error_deserializer

  let request_with_metadata context (request : describe_phi_detection_job_request) =
    let input = Json_serializers.describe_phi_detection_job_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata
      ~shape_name:"ComprehendMedical_20181030.DescribePHIDetectionJob" ~service ~context ~input
      ~output_deserializer:Json_deserializers.describe_phi_detection_job_response_of_yojson
      ~error_deserializer
end

module DescribeRxNormInferenceJob = struct
  let error_to_string = function
    | `InternalServerException _ -> "com.amazonaws.comprehendmedical#InternalServerException"
    | `InvalidRequestException _ -> "com.amazonaws.comprehendmedical#InvalidRequestException"
    | `ResourceNotFoundException _ -> "com.amazonaws.comprehendmedical#ResourceNotFoundException"
    | `TooManyRequestsException _ -> "com.amazonaws.comprehendmedical#TooManyRequestsException"
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

  let request context (request : describe_rx_norm_inference_job_request) =
    let input = Json_serializers.describe_rx_norm_inference_job_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request
      ~shape_name:"ComprehendMedical_20181030.DescribeRxNormInferenceJob" ~service ~context ~input
      ~output_deserializer:Json_deserializers.describe_rx_norm_inference_job_response_of_yojson
      ~error_deserializer

  let request_with_metadata context (request : describe_rx_norm_inference_job_request) =
    let input = Json_serializers.describe_rx_norm_inference_job_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata
      ~shape_name:"ComprehendMedical_20181030.DescribeRxNormInferenceJob" ~service ~context ~input
      ~output_deserializer:Json_deserializers.describe_rx_norm_inference_job_response_of_yojson
      ~error_deserializer
end

module DescribeSNOMEDCTInferenceJob = struct
  let error_to_string = function
    | `InternalServerException _ -> "com.amazonaws.comprehendmedical#InternalServerException"
    | `InvalidRequestException _ -> "com.amazonaws.comprehendmedical#InvalidRequestException"
    | `ResourceNotFoundException _ -> "com.amazonaws.comprehendmedical#ResourceNotFoundException"
    | `TooManyRequestsException _ -> "com.amazonaws.comprehendmedical#TooManyRequestsException"
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

  let request context (request : describe_snomedct_inference_job_request) =
    let input = Json_serializers.describe_snomedct_inference_job_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request
      ~shape_name:"ComprehendMedical_20181030.DescribeSNOMEDCTInferenceJob" ~service ~context ~input
      ~output_deserializer:Json_deserializers.describe_snomedct_inference_job_response_of_yojson
      ~error_deserializer

  let request_with_metadata context (request : describe_snomedct_inference_job_request) =
    let input = Json_serializers.describe_snomedct_inference_job_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata
      ~shape_name:"ComprehendMedical_20181030.DescribeSNOMEDCTInferenceJob" ~service ~context ~input
      ~output_deserializer:Json_deserializers.describe_snomedct_inference_job_response_of_yojson
      ~error_deserializer
end

module DetectEntities = struct
  let error_to_string = function
    | `InternalServerException _ -> "com.amazonaws.comprehendmedical#InternalServerException"
    | `InvalidEncodingException _ -> "com.amazonaws.comprehendmedical#InvalidEncodingException"
    | `InvalidRequestException _ -> "com.amazonaws.comprehendmedical#InvalidRequestException"
    | `ServiceUnavailableException _ ->
        "com.amazonaws.comprehendmedical#ServiceUnavailableException"
    | `TextSizeLimitExceededException _ ->
        "com.amazonaws.comprehendmedical#TextSizeLimitExceededException"
    | `TooManyRequestsException _ -> "com.amazonaws.comprehendmedical#TooManyRequestsException"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "InternalServerException" ->
          `InternalServerException
            (Json_deserializers.internal_server_exception_of_yojson tree path)
      | _, "InvalidEncodingException" ->
          `InvalidEncodingException
            (Json_deserializers.invalid_encoding_exception_of_yojson tree path)
      | _, "InvalidRequestException" ->
          `InvalidRequestException
            (Json_deserializers.invalid_request_exception_of_yojson tree path)
      | _, "ServiceUnavailableException" ->
          `ServiceUnavailableException
            (Json_deserializers.service_unavailable_exception_of_yojson tree path)
      | _, "TextSizeLimitExceededException" ->
          `TextSizeLimitExceededException
            (Json_deserializers.text_size_limit_exceeded_exception_of_yojson tree path)
      | _, "TooManyRequestsException" ->
          `TooManyRequestsException
            (Json_deserializers.too_many_requests_exception_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : detect_entities_request) =
    let input = Json_serializers.detect_entities_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"ComprehendMedical_20181030.DetectEntities"
      ~service ~context ~input
      ~output_deserializer:Json_deserializers.detect_entities_response_of_yojson ~error_deserializer

  let request_with_metadata context (request : detect_entities_request) =
    let input = Json_serializers.detect_entities_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata
      ~shape_name:"ComprehendMedical_20181030.DetectEntities" ~service ~context ~input
      ~output_deserializer:Json_deserializers.detect_entities_response_of_yojson ~error_deserializer
end

module DetectEntitiesV2 = struct
  let error_to_string = function
    | `InternalServerException _ -> "com.amazonaws.comprehendmedical#InternalServerException"
    | `InvalidEncodingException _ -> "com.amazonaws.comprehendmedical#InvalidEncodingException"
    | `InvalidRequestException _ -> "com.amazonaws.comprehendmedical#InvalidRequestException"
    | `ServiceUnavailableException _ ->
        "com.amazonaws.comprehendmedical#ServiceUnavailableException"
    | `TextSizeLimitExceededException _ ->
        "com.amazonaws.comprehendmedical#TextSizeLimitExceededException"
    | `TooManyRequestsException _ -> "com.amazonaws.comprehendmedical#TooManyRequestsException"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "InternalServerException" ->
          `InternalServerException
            (Json_deserializers.internal_server_exception_of_yojson tree path)
      | _, "InvalidEncodingException" ->
          `InvalidEncodingException
            (Json_deserializers.invalid_encoding_exception_of_yojson tree path)
      | _, "InvalidRequestException" ->
          `InvalidRequestException
            (Json_deserializers.invalid_request_exception_of_yojson tree path)
      | _, "ServiceUnavailableException" ->
          `ServiceUnavailableException
            (Json_deserializers.service_unavailable_exception_of_yojson tree path)
      | _, "TextSizeLimitExceededException" ->
          `TextSizeLimitExceededException
            (Json_deserializers.text_size_limit_exceeded_exception_of_yojson tree path)
      | _, "TooManyRequestsException" ->
          `TooManyRequestsException
            (Json_deserializers.too_many_requests_exception_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : detect_entities_v2_request) =
    let input = Json_serializers.detect_entities_v2_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"ComprehendMedical_20181030.DetectEntitiesV2"
      ~service ~context ~input
      ~output_deserializer:Json_deserializers.detect_entities_v2_response_of_yojson
      ~error_deserializer

  let request_with_metadata context (request : detect_entities_v2_request) =
    let input = Json_serializers.detect_entities_v2_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata
      ~shape_name:"ComprehendMedical_20181030.DetectEntitiesV2" ~service ~context ~input
      ~output_deserializer:Json_deserializers.detect_entities_v2_response_of_yojson
      ~error_deserializer
end

module DetectPHI = struct
  let error_to_string = function
    | `InternalServerException _ -> "com.amazonaws.comprehendmedical#InternalServerException"
    | `InvalidEncodingException _ -> "com.amazonaws.comprehendmedical#InvalidEncodingException"
    | `InvalidRequestException _ -> "com.amazonaws.comprehendmedical#InvalidRequestException"
    | `ServiceUnavailableException _ ->
        "com.amazonaws.comprehendmedical#ServiceUnavailableException"
    | `TextSizeLimitExceededException _ ->
        "com.amazonaws.comprehendmedical#TextSizeLimitExceededException"
    | `TooManyRequestsException _ -> "com.amazonaws.comprehendmedical#TooManyRequestsException"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "InternalServerException" ->
          `InternalServerException
            (Json_deserializers.internal_server_exception_of_yojson tree path)
      | _, "InvalidEncodingException" ->
          `InvalidEncodingException
            (Json_deserializers.invalid_encoding_exception_of_yojson tree path)
      | _, "InvalidRequestException" ->
          `InvalidRequestException
            (Json_deserializers.invalid_request_exception_of_yojson tree path)
      | _, "ServiceUnavailableException" ->
          `ServiceUnavailableException
            (Json_deserializers.service_unavailable_exception_of_yojson tree path)
      | _, "TextSizeLimitExceededException" ->
          `TextSizeLimitExceededException
            (Json_deserializers.text_size_limit_exceeded_exception_of_yojson tree path)
      | _, "TooManyRequestsException" ->
          `TooManyRequestsException
            (Json_deserializers.too_many_requests_exception_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : detect_phi_request) =
    let input = Json_serializers.detect_phi_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"ComprehendMedical_20181030.DetectPHI" ~service
      ~context ~input ~output_deserializer:Json_deserializers.detect_phi_response_of_yojson
      ~error_deserializer

  let request_with_metadata context (request : detect_phi_request) =
    let input = Json_serializers.detect_phi_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata
      ~shape_name:"ComprehendMedical_20181030.DetectPHI" ~service ~context ~input
      ~output_deserializer:Json_deserializers.detect_phi_response_of_yojson ~error_deserializer
end

module InferICD10CM = struct
  let error_to_string = function
    | `InternalServerException _ -> "com.amazonaws.comprehendmedical#InternalServerException"
    | `InvalidEncodingException _ -> "com.amazonaws.comprehendmedical#InvalidEncodingException"
    | `InvalidRequestException _ -> "com.amazonaws.comprehendmedical#InvalidRequestException"
    | `ServiceUnavailableException _ ->
        "com.amazonaws.comprehendmedical#ServiceUnavailableException"
    | `TextSizeLimitExceededException _ ->
        "com.amazonaws.comprehendmedical#TextSizeLimitExceededException"
    | `TooManyRequestsException _ -> "com.amazonaws.comprehendmedical#TooManyRequestsException"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "InternalServerException" ->
          `InternalServerException
            (Json_deserializers.internal_server_exception_of_yojson tree path)
      | _, "InvalidEncodingException" ->
          `InvalidEncodingException
            (Json_deserializers.invalid_encoding_exception_of_yojson tree path)
      | _, "InvalidRequestException" ->
          `InvalidRequestException
            (Json_deserializers.invalid_request_exception_of_yojson tree path)
      | _, "ServiceUnavailableException" ->
          `ServiceUnavailableException
            (Json_deserializers.service_unavailable_exception_of_yojson tree path)
      | _, "TextSizeLimitExceededException" ->
          `TextSizeLimitExceededException
            (Json_deserializers.text_size_limit_exceeded_exception_of_yojson tree path)
      | _, "TooManyRequestsException" ->
          `TooManyRequestsException
            (Json_deserializers.too_many_requests_exception_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : infer_icd10cm_request) =
    let input = Json_serializers.infer_icd10cm_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"ComprehendMedical_20181030.InferICD10CM"
      ~service ~context ~input
      ~output_deserializer:Json_deserializers.infer_icd10cm_response_of_yojson ~error_deserializer

  let request_with_metadata context (request : infer_icd10cm_request) =
    let input = Json_serializers.infer_icd10cm_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata
      ~shape_name:"ComprehendMedical_20181030.InferICD10CM" ~service ~context ~input
      ~output_deserializer:Json_deserializers.infer_icd10cm_response_of_yojson ~error_deserializer
end

module InferRxNorm = struct
  let error_to_string = function
    | `InternalServerException _ -> "com.amazonaws.comprehendmedical#InternalServerException"
    | `InvalidEncodingException _ -> "com.amazonaws.comprehendmedical#InvalidEncodingException"
    | `InvalidRequestException _ -> "com.amazonaws.comprehendmedical#InvalidRequestException"
    | `ServiceUnavailableException _ ->
        "com.amazonaws.comprehendmedical#ServiceUnavailableException"
    | `TextSizeLimitExceededException _ ->
        "com.amazonaws.comprehendmedical#TextSizeLimitExceededException"
    | `TooManyRequestsException _ -> "com.amazonaws.comprehendmedical#TooManyRequestsException"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "InternalServerException" ->
          `InternalServerException
            (Json_deserializers.internal_server_exception_of_yojson tree path)
      | _, "InvalidEncodingException" ->
          `InvalidEncodingException
            (Json_deserializers.invalid_encoding_exception_of_yojson tree path)
      | _, "InvalidRequestException" ->
          `InvalidRequestException
            (Json_deserializers.invalid_request_exception_of_yojson tree path)
      | _, "ServiceUnavailableException" ->
          `ServiceUnavailableException
            (Json_deserializers.service_unavailable_exception_of_yojson tree path)
      | _, "TextSizeLimitExceededException" ->
          `TextSizeLimitExceededException
            (Json_deserializers.text_size_limit_exceeded_exception_of_yojson tree path)
      | _, "TooManyRequestsException" ->
          `TooManyRequestsException
            (Json_deserializers.too_many_requests_exception_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : infer_rx_norm_request) =
    let input = Json_serializers.infer_rx_norm_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"ComprehendMedical_20181030.InferRxNorm"
      ~service ~context ~input
      ~output_deserializer:Json_deserializers.infer_rx_norm_response_of_yojson ~error_deserializer

  let request_with_metadata context (request : infer_rx_norm_request) =
    let input = Json_serializers.infer_rx_norm_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata
      ~shape_name:"ComprehendMedical_20181030.InferRxNorm" ~service ~context ~input
      ~output_deserializer:Json_deserializers.infer_rx_norm_response_of_yojson ~error_deserializer
end

module InferSNOMEDCT = struct
  let error_to_string = function
    | `InternalServerException _ -> "com.amazonaws.comprehendmedical#InternalServerException"
    | `InvalidEncodingException _ -> "com.amazonaws.comprehendmedical#InvalidEncodingException"
    | `InvalidRequestException _ -> "com.amazonaws.comprehendmedical#InvalidRequestException"
    | `ServiceUnavailableException _ ->
        "com.amazonaws.comprehendmedical#ServiceUnavailableException"
    | `TextSizeLimitExceededException _ ->
        "com.amazonaws.comprehendmedical#TextSizeLimitExceededException"
    | `TooManyRequestsException _ -> "com.amazonaws.comprehendmedical#TooManyRequestsException"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "InternalServerException" ->
          `InternalServerException
            (Json_deserializers.internal_server_exception_of_yojson tree path)
      | _, "InvalidEncodingException" ->
          `InvalidEncodingException
            (Json_deserializers.invalid_encoding_exception_of_yojson tree path)
      | _, "InvalidRequestException" ->
          `InvalidRequestException
            (Json_deserializers.invalid_request_exception_of_yojson tree path)
      | _, "ServiceUnavailableException" ->
          `ServiceUnavailableException
            (Json_deserializers.service_unavailable_exception_of_yojson tree path)
      | _, "TextSizeLimitExceededException" ->
          `TextSizeLimitExceededException
            (Json_deserializers.text_size_limit_exceeded_exception_of_yojson tree path)
      | _, "TooManyRequestsException" ->
          `TooManyRequestsException
            (Json_deserializers.too_many_requests_exception_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : infer_snomedct_request) =
    let input = Json_serializers.infer_snomedct_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"ComprehendMedical_20181030.InferSNOMEDCT"
      ~service ~context ~input
      ~output_deserializer:Json_deserializers.infer_snomedct_response_of_yojson ~error_deserializer

  let request_with_metadata context (request : infer_snomedct_request) =
    let input = Json_serializers.infer_snomedct_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata
      ~shape_name:"ComprehendMedical_20181030.InferSNOMEDCT" ~service ~context ~input
      ~output_deserializer:Json_deserializers.infer_snomedct_response_of_yojson ~error_deserializer
end

module ListEntitiesDetectionV2Jobs = struct
  let error_to_string = function
    | `InternalServerException _ -> "com.amazonaws.comprehendmedical#InternalServerException"
    | `InvalidRequestException _ -> "com.amazonaws.comprehendmedical#InvalidRequestException"
    | `TooManyRequestsException _ -> "com.amazonaws.comprehendmedical#TooManyRequestsException"
    | `ValidationException _ -> "com.amazonaws.comprehendmedical#ValidationException"
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
      | _, "ValidationException" ->
          `ValidationException (Json_deserializers.validation_exception_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : list_entities_detection_v2_jobs_request) =
    let input = Json_serializers.list_entities_detection_v2_jobs_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request
      ~shape_name:"ComprehendMedical_20181030.ListEntitiesDetectionV2Jobs" ~service ~context ~input
      ~output_deserializer:Json_deserializers.list_entities_detection_v2_jobs_response_of_yojson
      ~error_deserializer

  let request_with_metadata context (request : list_entities_detection_v2_jobs_request) =
    let input = Json_serializers.list_entities_detection_v2_jobs_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata
      ~shape_name:"ComprehendMedical_20181030.ListEntitiesDetectionV2Jobs" ~service ~context ~input
      ~output_deserializer:Json_deserializers.list_entities_detection_v2_jobs_response_of_yojson
      ~error_deserializer
end

module ListICD10CMInferenceJobs = struct
  let error_to_string = function
    | `InternalServerException _ -> "com.amazonaws.comprehendmedical#InternalServerException"
    | `InvalidRequestException _ -> "com.amazonaws.comprehendmedical#InvalidRequestException"
    | `TooManyRequestsException _ -> "com.amazonaws.comprehendmedical#TooManyRequestsException"
    | `ValidationException _ -> "com.amazonaws.comprehendmedical#ValidationException"
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
      | _, "ValidationException" ->
          `ValidationException (Json_deserializers.validation_exception_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : list_icd10cm_inference_jobs_request) =
    let input = Json_serializers.list_icd10cm_inference_jobs_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request
      ~shape_name:"ComprehendMedical_20181030.ListICD10CMInferenceJobs" ~service ~context ~input
      ~output_deserializer:Json_deserializers.list_icd10cm_inference_jobs_response_of_yojson
      ~error_deserializer

  let request_with_metadata context (request : list_icd10cm_inference_jobs_request) =
    let input = Json_serializers.list_icd10cm_inference_jobs_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata
      ~shape_name:"ComprehendMedical_20181030.ListICD10CMInferenceJobs" ~service ~context ~input
      ~output_deserializer:Json_deserializers.list_icd10cm_inference_jobs_response_of_yojson
      ~error_deserializer
end

module ListPHIDetectionJobs = struct
  let error_to_string = function
    | `InternalServerException _ -> "com.amazonaws.comprehendmedical#InternalServerException"
    | `InvalidRequestException _ -> "com.amazonaws.comprehendmedical#InvalidRequestException"
    | `TooManyRequestsException _ -> "com.amazonaws.comprehendmedical#TooManyRequestsException"
    | `ValidationException _ -> "com.amazonaws.comprehendmedical#ValidationException"
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
      | _, "ValidationException" ->
          `ValidationException (Json_deserializers.validation_exception_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : list_phi_detection_jobs_request) =
    let input = Json_serializers.list_phi_detection_jobs_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request
      ~shape_name:"ComprehendMedical_20181030.ListPHIDetectionJobs" ~service ~context ~input
      ~output_deserializer:Json_deserializers.list_phi_detection_jobs_response_of_yojson
      ~error_deserializer

  let request_with_metadata context (request : list_phi_detection_jobs_request) =
    let input = Json_serializers.list_phi_detection_jobs_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata
      ~shape_name:"ComprehendMedical_20181030.ListPHIDetectionJobs" ~service ~context ~input
      ~output_deserializer:Json_deserializers.list_phi_detection_jobs_response_of_yojson
      ~error_deserializer
end

module ListRxNormInferenceJobs = struct
  let error_to_string = function
    | `InternalServerException _ -> "com.amazonaws.comprehendmedical#InternalServerException"
    | `InvalidRequestException _ -> "com.amazonaws.comprehendmedical#InvalidRequestException"
    | `TooManyRequestsException _ -> "com.amazonaws.comprehendmedical#TooManyRequestsException"
    | `ValidationException _ -> "com.amazonaws.comprehendmedical#ValidationException"
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
      | _, "ValidationException" ->
          `ValidationException (Json_deserializers.validation_exception_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : list_rx_norm_inference_jobs_request) =
    let input = Json_serializers.list_rx_norm_inference_jobs_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request
      ~shape_name:"ComprehendMedical_20181030.ListRxNormInferenceJobs" ~service ~context ~input
      ~output_deserializer:Json_deserializers.list_rx_norm_inference_jobs_response_of_yojson
      ~error_deserializer

  let request_with_metadata context (request : list_rx_norm_inference_jobs_request) =
    let input = Json_serializers.list_rx_norm_inference_jobs_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata
      ~shape_name:"ComprehendMedical_20181030.ListRxNormInferenceJobs" ~service ~context ~input
      ~output_deserializer:Json_deserializers.list_rx_norm_inference_jobs_response_of_yojson
      ~error_deserializer
end

module ListSNOMEDCTInferenceJobs = struct
  let error_to_string = function
    | `InternalServerException _ -> "com.amazonaws.comprehendmedical#InternalServerException"
    | `InvalidRequestException _ -> "com.amazonaws.comprehendmedical#InvalidRequestException"
    | `TooManyRequestsException _ -> "com.amazonaws.comprehendmedical#TooManyRequestsException"
    | `ValidationException _ -> "com.amazonaws.comprehendmedical#ValidationException"
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
      | _, "ValidationException" ->
          `ValidationException (Json_deserializers.validation_exception_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : list_snomedct_inference_jobs_request) =
    let input = Json_serializers.list_snomedct_inference_jobs_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request
      ~shape_name:"ComprehendMedical_20181030.ListSNOMEDCTInferenceJobs" ~service ~context ~input
      ~output_deserializer:Json_deserializers.list_snomedct_inference_jobs_response_of_yojson
      ~error_deserializer

  let request_with_metadata context (request : list_snomedct_inference_jobs_request) =
    let input = Json_serializers.list_snomedct_inference_jobs_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata
      ~shape_name:"ComprehendMedical_20181030.ListSNOMEDCTInferenceJobs" ~service ~context ~input
      ~output_deserializer:Json_deserializers.list_snomedct_inference_jobs_response_of_yojson
      ~error_deserializer
end

module StartEntitiesDetectionV2Job = struct
  let error_to_string = function
    | `InternalServerException _ -> "com.amazonaws.comprehendmedical#InternalServerException"
    | `InvalidRequestException _ -> "com.amazonaws.comprehendmedical#InvalidRequestException"
    | `ResourceNotFoundException _ -> "com.amazonaws.comprehendmedical#ResourceNotFoundException"
    | `TooManyRequestsException _ -> "com.amazonaws.comprehendmedical#TooManyRequestsException"
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

  let request context (request : start_entities_detection_v2_job_request) =
    let input = Json_serializers.start_entities_detection_v2_job_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request
      ~shape_name:"ComprehendMedical_20181030.StartEntitiesDetectionV2Job" ~service ~context ~input
      ~output_deserializer:Json_deserializers.start_entities_detection_v2_job_response_of_yojson
      ~error_deserializer

  let request_with_metadata context (request : start_entities_detection_v2_job_request) =
    let input = Json_serializers.start_entities_detection_v2_job_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata
      ~shape_name:"ComprehendMedical_20181030.StartEntitiesDetectionV2Job" ~service ~context ~input
      ~output_deserializer:Json_deserializers.start_entities_detection_v2_job_response_of_yojson
      ~error_deserializer
end

module StartICD10CMInferenceJob = struct
  let error_to_string = function
    | `InternalServerException _ -> "com.amazonaws.comprehendmedical#InternalServerException"
    | `InvalidRequestException _ -> "com.amazonaws.comprehendmedical#InvalidRequestException"
    | `ResourceNotFoundException _ -> "com.amazonaws.comprehendmedical#ResourceNotFoundException"
    | `TooManyRequestsException _ -> "com.amazonaws.comprehendmedical#TooManyRequestsException"
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

  let request context (request : start_icd10cm_inference_job_request) =
    let input = Json_serializers.start_icd10cm_inference_job_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request
      ~shape_name:"ComprehendMedical_20181030.StartICD10CMInferenceJob" ~service ~context ~input
      ~output_deserializer:Json_deserializers.start_icd10cm_inference_job_response_of_yojson
      ~error_deserializer

  let request_with_metadata context (request : start_icd10cm_inference_job_request) =
    let input = Json_serializers.start_icd10cm_inference_job_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata
      ~shape_name:"ComprehendMedical_20181030.StartICD10CMInferenceJob" ~service ~context ~input
      ~output_deserializer:Json_deserializers.start_icd10cm_inference_job_response_of_yojson
      ~error_deserializer
end

module StartPHIDetectionJob = struct
  let error_to_string = function
    | `InternalServerException _ -> "com.amazonaws.comprehendmedical#InternalServerException"
    | `InvalidRequestException _ -> "com.amazonaws.comprehendmedical#InvalidRequestException"
    | `ResourceNotFoundException _ -> "com.amazonaws.comprehendmedical#ResourceNotFoundException"
    | `TooManyRequestsException _ -> "com.amazonaws.comprehendmedical#TooManyRequestsException"
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

  let request context (request : start_phi_detection_job_request) =
    let input = Json_serializers.start_phi_detection_job_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request
      ~shape_name:"ComprehendMedical_20181030.StartPHIDetectionJob" ~service ~context ~input
      ~output_deserializer:Json_deserializers.start_phi_detection_job_response_of_yojson
      ~error_deserializer

  let request_with_metadata context (request : start_phi_detection_job_request) =
    let input = Json_serializers.start_phi_detection_job_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata
      ~shape_name:"ComprehendMedical_20181030.StartPHIDetectionJob" ~service ~context ~input
      ~output_deserializer:Json_deserializers.start_phi_detection_job_response_of_yojson
      ~error_deserializer
end

module StartRxNormInferenceJob = struct
  let error_to_string = function
    | `InternalServerException _ -> "com.amazonaws.comprehendmedical#InternalServerException"
    | `InvalidRequestException _ -> "com.amazonaws.comprehendmedical#InvalidRequestException"
    | `ResourceNotFoundException _ -> "com.amazonaws.comprehendmedical#ResourceNotFoundException"
    | `TooManyRequestsException _ -> "com.amazonaws.comprehendmedical#TooManyRequestsException"
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

  let request context (request : start_rx_norm_inference_job_request) =
    let input = Json_serializers.start_rx_norm_inference_job_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request
      ~shape_name:"ComprehendMedical_20181030.StartRxNormInferenceJob" ~service ~context ~input
      ~output_deserializer:Json_deserializers.start_rx_norm_inference_job_response_of_yojson
      ~error_deserializer

  let request_with_metadata context (request : start_rx_norm_inference_job_request) =
    let input = Json_serializers.start_rx_norm_inference_job_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata
      ~shape_name:"ComprehendMedical_20181030.StartRxNormInferenceJob" ~service ~context ~input
      ~output_deserializer:Json_deserializers.start_rx_norm_inference_job_response_of_yojson
      ~error_deserializer
end

module StartSNOMEDCTInferenceJob = struct
  let error_to_string = function
    | `InternalServerException _ -> "com.amazonaws.comprehendmedical#InternalServerException"
    | `InvalidRequestException _ -> "com.amazonaws.comprehendmedical#InvalidRequestException"
    | `ResourceNotFoundException _ -> "com.amazonaws.comprehendmedical#ResourceNotFoundException"
    | `TooManyRequestsException _ -> "com.amazonaws.comprehendmedical#TooManyRequestsException"
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

  let request context (request : start_snomedct_inference_job_request) =
    let input = Json_serializers.start_snomedct_inference_job_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request
      ~shape_name:"ComprehendMedical_20181030.StartSNOMEDCTInferenceJob" ~service ~context ~input
      ~output_deserializer:Json_deserializers.start_snomedct_inference_job_response_of_yojson
      ~error_deserializer

  let request_with_metadata context (request : start_snomedct_inference_job_request) =
    let input = Json_serializers.start_snomedct_inference_job_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata
      ~shape_name:"ComprehendMedical_20181030.StartSNOMEDCTInferenceJob" ~service ~context ~input
      ~output_deserializer:Json_deserializers.start_snomedct_inference_job_response_of_yojson
      ~error_deserializer
end

module StopEntitiesDetectionV2Job = struct
  let error_to_string = function
    | `InternalServerException _ -> "com.amazonaws.comprehendmedical#InternalServerException"
    | `InvalidRequestException _ -> "com.amazonaws.comprehendmedical#InvalidRequestException"
    | `ResourceNotFoundException _ -> "com.amazonaws.comprehendmedical#ResourceNotFoundException"
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

  let request context (request : stop_entities_detection_v2_job_request) =
    let input = Json_serializers.stop_entities_detection_v2_job_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request
      ~shape_name:"ComprehendMedical_20181030.StopEntitiesDetectionV2Job" ~service ~context ~input
      ~output_deserializer:Json_deserializers.stop_entities_detection_v2_job_response_of_yojson
      ~error_deserializer

  let request_with_metadata context (request : stop_entities_detection_v2_job_request) =
    let input = Json_serializers.stop_entities_detection_v2_job_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata
      ~shape_name:"ComprehendMedical_20181030.StopEntitiesDetectionV2Job" ~service ~context ~input
      ~output_deserializer:Json_deserializers.stop_entities_detection_v2_job_response_of_yojson
      ~error_deserializer
end

module StopICD10CMInferenceJob = struct
  let error_to_string = function
    | `InternalServerException _ -> "com.amazonaws.comprehendmedical#InternalServerException"
    | `InvalidRequestException _ -> "com.amazonaws.comprehendmedical#InvalidRequestException"
    | `ResourceNotFoundException _ -> "com.amazonaws.comprehendmedical#ResourceNotFoundException"
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

  let request context (request : stop_icd10cm_inference_job_request) =
    let input = Json_serializers.stop_icd10cm_inference_job_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request
      ~shape_name:"ComprehendMedical_20181030.StopICD10CMInferenceJob" ~service ~context ~input
      ~output_deserializer:Json_deserializers.stop_icd10cm_inference_job_response_of_yojson
      ~error_deserializer

  let request_with_metadata context (request : stop_icd10cm_inference_job_request) =
    let input = Json_serializers.stop_icd10cm_inference_job_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata
      ~shape_name:"ComprehendMedical_20181030.StopICD10CMInferenceJob" ~service ~context ~input
      ~output_deserializer:Json_deserializers.stop_icd10cm_inference_job_response_of_yojson
      ~error_deserializer
end

module StopPHIDetectionJob = struct
  let error_to_string = function
    | `InternalServerException _ -> "com.amazonaws.comprehendmedical#InternalServerException"
    | `InvalidRequestException _ -> "com.amazonaws.comprehendmedical#InvalidRequestException"
    | `ResourceNotFoundException _ -> "com.amazonaws.comprehendmedical#ResourceNotFoundException"
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

  let request context (request : stop_phi_detection_job_request) =
    let input = Json_serializers.stop_phi_detection_job_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"ComprehendMedical_20181030.StopPHIDetectionJob"
      ~service ~context ~input
      ~output_deserializer:Json_deserializers.stop_phi_detection_job_response_of_yojson
      ~error_deserializer

  let request_with_metadata context (request : stop_phi_detection_job_request) =
    let input = Json_serializers.stop_phi_detection_job_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata
      ~shape_name:"ComprehendMedical_20181030.StopPHIDetectionJob" ~service ~context ~input
      ~output_deserializer:Json_deserializers.stop_phi_detection_job_response_of_yojson
      ~error_deserializer
end

module StopRxNormInferenceJob = struct
  let error_to_string = function
    | `InternalServerException _ -> "com.amazonaws.comprehendmedical#InternalServerException"
    | `InvalidRequestException _ -> "com.amazonaws.comprehendmedical#InvalidRequestException"
    | `ResourceNotFoundException _ -> "com.amazonaws.comprehendmedical#ResourceNotFoundException"
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

  let request context (request : stop_rx_norm_inference_job_request) =
    let input = Json_serializers.stop_rx_norm_inference_job_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request
      ~shape_name:"ComprehendMedical_20181030.StopRxNormInferenceJob" ~service ~context ~input
      ~output_deserializer:Json_deserializers.stop_rx_norm_inference_job_response_of_yojson
      ~error_deserializer

  let request_with_metadata context (request : stop_rx_norm_inference_job_request) =
    let input = Json_serializers.stop_rx_norm_inference_job_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata
      ~shape_name:"ComprehendMedical_20181030.StopRxNormInferenceJob" ~service ~context ~input
      ~output_deserializer:Json_deserializers.stop_rx_norm_inference_job_response_of_yojson
      ~error_deserializer
end

module StopSNOMEDCTInferenceJob = struct
  let error_to_string = function
    | `InternalServerException _ -> "com.amazonaws.comprehendmedical#InternalServerException"
    | `InvalidRequestException _ -> "com.amazonaws.comprehendmedical#InvalidRequestException"
    | `ResourceNotFoundException _ -> "com.amazonaws.comprehendmedical#ResourceNotFoundException"
    | `TooManyRequestsException _ -> "com.amazonaws.comprehendmedical#TooManyRequestsException"
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

  let request context (request : stop_snomedct_inference_job_request) =
    let input = Json_serializers.stop_snomedct_inference_job_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request
      ~shape_name:"ComprehendMedical_20181030.StopSNOMEDCTInferenceJob" ~service ~context ~input
      ~output_deserializer:Json_deserializers.stop_snomedct_inference_job_response_of_yojson
      ~error_deserializer

  let request_with_metadata context (request : stop_snomedct_inference_job_request) =
    let input = Json_serializers.stop_snomedct_inference_job_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata
      ~shape_name:"ComprehendMedical_20181030.StopSNOMEDCTInferenceJob" ~service ~context ~input
      ~output_deserializer:Json_deserializers.stop_snomedct_inference_job_response_of_yojson
      ~error_deserializer
end
