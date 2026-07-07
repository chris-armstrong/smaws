open Types
open Service_metadata

module GetDataAutomationStatus = struct
  let error_to_string = function
    | `AccessDeniedException _ -> "com.amazonaws.bedrockdataautomationruntime#AccessDeniedException"
    | `InternalServerException _ ->
        "com.amazonaws.bedrockdataautomationruntime#InternalServerException"
    | `ResourceNotFoundException _ ->
        "com.amazonaws.bedrockdataautomationruntime#ResourceNotFoundException"
    | `ThrottlingException _ -> "com.amazonaws.bedrockdataautomationruntime#ThrottlingException"
    | `ValidationException _ -> "com.amazonaws.bedrockdataautomationruntime#ValidationException"
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

  let request context (request : get_data_automation_status_request) =
    let input = Json_serializers.get_data_automation_status_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request
      ~shape_name:"AmazonBedrockKeystoneRuntimeService.GetDataAutomationStatus" ~service ~context
      ~input ~output_deserializer:Json_deserializers.get_data_automation_status_response_of_yojson
      ~error_deserializer

  let request_with_metadata context (request : get_data_automation_status_request) =
    let input = Json_serializers.get_data_automation_status_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata
      ~shape_name:"AmazonBedrockKeystoneRuntimeService.GetDataAutomationStatus" ~service ~context
      ~input ~output_deserializer:Json_deserializers.get_data_automation_status_response_of_yojson
      ~error_deserializer
end

module InvokeDataAutomation = struct
  let error_to_string = function
    | `AccessDeniedException _ -> "com.amazonaws.bedrockdataautomationruntime#AccessDeniedException"
    | `InternalServerException _ ->
        "com.amazonaws.bedrockdataautomationruntime#InternalServerException"
    | `ServiceUnavailableException _ ->
        "com.amazonaws.bedrockdataautomationruntime#ServiceUnavailableException"
    | `ThrottlingException _ -> "com.amazonaws.bedrockdataautomationruntime#ThrottlingException"
    | `ValidationException _ -> "com.amazonaws.bedrockdataautomationruntime#ValidationException"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "AccessDeniedException" ->
          `AccessDeniedException (Json_deserializers.access_denied_exception_of_yojson tree path)
      | _, "InternalServerException" ->
          `InternalServerException
            (Json_deserializers.internal_server_exception_of_yojson tree path)
      | _, "ServiceUnavailableException" ->
          `ServiceUnavailableException
            (Json_deserializers.service_unavailable_exception_of_yojson tree path)
      | _, "ThrottlingException" ->
          `ThrottlingException (Json_deserializers.throttling_exception_of_yojson tree path)
      | _, "ValidationException" ->
          `ValidationException (Json_deserializers.validation_exception_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : invoke_data_automation_request) =
    let input = Json_serializers.invoke_data_automation_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request
      ~shape_name:"AmazonBedrockKeystoneRuntimeService.InvokeDataAutomation" ~service ~context
      ~input ~output_deserializer:Json_deserializers.invoke_data_automation_response_of_yojson
      ~error_deserializer

  let request_with_metadata context (request : invoke_data_automation_request) =
    let input = Json_serializers.invoke_data_automation_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata
      ~shape_name:"AmazonBedrockKeystoneRuntimeService.InvokeDataAutomation" ~service ~context
      ~input ~output_deserializer:Json_deserializers.invoke_data_automation_response_of_yojson
      ~error_deserializer
end

module InvokeDataAutomationAsync = struct
  let error_to_string = function
    | `AccessDeniedException _ -> "com.amazonaws.bedrockdataautomationruntime#AccessDeniedException"
    | `InternalServerException _ ->
        "com.amazonaws.bedrockdataautomationruntime#InternalServerException"
    | `ServiceQuotaExceededException _ ->
        "com.amazonaws.bedrockdataautomationruntime#ServiceQuotaExceededException"
    | `ThrottlingException _ -> "com.amazonaws.bedrockdataautomationruntime#ThrottlingException"
    | `ValidationException _ -> "com.amazonaws.bedrockdataautomationruntime#ValidationException"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "AccessDeniedException" ->
          `AccessDeniedException (Json_deserializers.access_denied_exception_of_yojson tree path)
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

  let request context (request : invoke_data_automation_async_request) =
    let input = Json_serializers.invoke_data_automation_async_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request
      ~shape_name:"AmazonBedrockKeystoneRuntimeService.InvokeDataAutomationAsync" ~service ~context
      ~input ~output_deserializer:Json_deserializers.invoke_data_automation_async_response_of_yojson
      ~error_deserializer

  let request_with_metadata context (request : invoke_data_automation_async_request) =
    let input = Json_serializers.invoke_data_automation_async_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata
      ~shape_name:"AmazonBedrockKeystoneRuntimeService.InvokeDataAutomationAsync" ~service ~context
      ~input ~output_deserializer:Json_deserializers.invoke_data_automation_async_response_of_yojson
      ~error_deserializer
end

module ListTagsForResource = struct
  let error_to_string = function
    | `AccessDeniedException _ -> "com.amazonaws.bedrockdataautomationruntime#AccessDeniedException"
    | `InternalServerException _ ->
        "com.amazonaws.bedrockdataautomationruntime#InternalServerException"
    | `ResourceNotFoundException _ ->
        "com.amazonaws.bedrockdataautomationruntime#ResourceNotFoundException"
    | `ThrottlingException _ -> "com.amazonaws.bedrockdataautomationruntime#ThrottlingException"
    | `ValidationException _ -> "com.amazonaws.bedrockdataautomationruntime#ValidationException"
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
      ~shape_name:"AmazonBedrockKeystoneRuntimeService.ListTagsForResource" ~service ~context ~input
      ~output_deserializer:Json_deserializers.list_tags_for_resource_response_of_yojson
      ~error_deserializer

  let request_with_metadata context (request : list_tags_for_resource_request) =
    let input = Json_serializers.list_tags_for_resource_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata
      ~shape_name:"AmazonBedrockKeystoneRuntimeService.ListTagsForResource" ~service ~context ~input
      ~output_deserializer:Json_deserializers.list_tags_for_resource_response_of_yojson
      ~error_deserializer
end

module TagResource = struct
  let error_to_string = function
    | `AccessDeniedException _ -> "com.amazonaws.bedrockdataautomationruntime#AccessDeniedException"
    | `InternalServerException _ ->
        "com.amazonaws.bedrockdataautomationruntime#InternalServerException"
    | `ResourceNotFoundException _ ->
        "com.amazonaws.bedrockdataautomationruntime#ResourceNotFoundException"
    | `ServiceQuotaExceededException _ ->
        "com.amazonaws.bedrockdataautomationruntime#ServiceQuotaExceededException"
    | `ThrottlingException _ -> "com.amazonaws.bedrockdataautomationruntime#ThrottlingException"
    | `ValidationException _ -> "com.amazonaws.bedrockdataautomationruntime#ValidationException"
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
    Smaws_Lib.Protocols.AwsJson.request
      ~shape_name:"AmazonBedrockKeystoneRuntimeService.TagResource" ~service ~context ~input
      ~output_deserializer:Json_deserializers.tag_resource_response_of_yojson ~error_deserializer

  let request_with_metadata context (request : tag_resource_request) =
    let input = Json_serializers.tag_resource_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata
      ~shape_name:"AmazonBedrockKeystoneRuntimeService.TagResource" ~service ~context ~input
      ~output_deserializer:Json_deserializers.tag_resource_response_of_yojson ~error_deserializer
end

module UntagResource = struct
  let error_to_string = function
    | `AccessDeniedException _ -> "com.amazonaws.bedrockdataautomationruntime#AccessDeniedException"
    | `InternalServerException _ ->
        "com.amazonaws.bedrockdataautomationruntime#InternalServerException"
    | `ResourceNotFoundException _ ->
        "com.amazonaws.bedrockdataautomationruntime#ResourceNotFoundException"
    | `ThrottlingException _ -> "com.amazonaws.bedrockdataautomationruntime#ThrottlingException"
    | `ValidationException _ -> "com.amazonaws.bedrockdataautomationruntime#ValidationException"
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
      ~shape_name:"AmazonBedrockKeystoneRuntimeService.UntagResource" ~service ~context ~input
      ~output_deserializer:Json_deserializers.untag_resource_response_of_yojson ~error_deserializer

  let request_with_metadata context (request : untag_resource_request) =
    let input = Json_serializers.untag_resource_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata
      ~shape_name:"AmazonBedrockKeystoneRuntimeService.UntagResource" ~service ~context ~input
      ~output_deserializer:Json_deserializers.untag_resource_response_of_yojson ~error_deserializer
end
