open Types
open Service_metadata

module AddApplicationCloudWatchLoggingOption = struct
  let error_to_string = function
    | `ConcurrentModificationException _ ->
        "com.amazonaws.kinesisanalyticsv2#ConcurrentModificationException"
    | `InvalidApplicationConfigurationException _ ->
        "com.amazonaws.kinesisanalyticsv2#InvalidApplicationConfigurationException"
    | `InvalidArgumentException _ -> "com.amazonaws.kinesisanalyticsv2#InvalidArgumentException"
    | `InvalidRequestException _ -> "com.amazonaws.kinesisanalyticsv2#InvalidRequestException"
    | `ResourceInUseException _ -> "com.amazonaws.kinesisanalyticsv2#ResourceInUseException"
    | `ResourceNotFoundException _ -> "com.amazonaws.kinesisanalyticsv2#ResourceNotFoundException"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "ConcurrentModificationException" ->
          `ConcurrentModificationException
            (Json_deserializers.concurrent_modification_exception_of_yojson tree path)
      | _, "InvalidApplicationConfigurationException" ->
          `InvalidApplicationConfigurationException
            (Json_deserializers.invalid_application_configuration_exception_of_yojson tree path)
      | _, "InvalidArgumentException" ->
          `InvalidArgumentException
            (Json_deserializers.invalid_argument_exception_of_yojson tree path)
      | _, "InvalidRequestException" ->
          `InvalidRequestException
            (Json_deserializers.invalid_request_exception_of_yojson tree path)
      | _, "ResourceInUseException" ->
          `ResourceInUseException (Json_deserializers.resource_in_use_exception_of_yojson tree path)
      | _, "ResourceNotFoundException" ->
          `ResourceNotFoundException
            (Json_deserializers.resource_not_found_exception_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : add_application_cloud_watch_logging_option_request) =
    let input =
      Json_serializers.add_application_cloud_watch_logging_option_request_to_yojson request
    in
    Smaws_Lib.Protocols.AwsJson.request
      ~shape_name:"KinesisAnalytics_20180523.AddApplicationCloudWatchLoggingOption" ~service
      ~context ~input
      ~output_deserializer:
        Json_deserializers.add_application_cloud_watch_logging_option_response_of_yojson
      ~error_deserializer
end

module AddApplicationInput = struct
  let error_to_string = function
    | `CodeValidationException _ -> "com.amazonaws.kinesisanalyticsv2#CodeValidationException"
    | `ConcurrentModificationException _ ->
        "com.amazonaws.kinesisanalyticsv2#ConcurrentModificationException"
    | `InvalidArgumentException _ -> "com.amazonaws.kinesisanalyticsv2#InvalidArgumentException"
    | `InvalidRequestException _ -> "com.amazonaws.kinesisanalyticsv2#InvalidRequestException"
    | `ResourceInUseException _ -> "com.amazonaws.kinesisanalyticsv2#ResourceInUseException"
    | `ResourceNotFoundException _ -> "com.amazonaws.kinesisanalyticsv2#ResourceNotFoundException"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "CodeValidationException" ->
          `CodeValidationException
            (Json_deserializers.code_validation_exception_of_yojson tree path)
      | _, "ConcurrentModificationException" ->
          `ConcurrentModificationException
            (Json_deserializers.concurrent_modification_exception_of_yojson tree path)
      | _, "InvalidArgumentException" ->
          `InvalidArgumentException
            (Json_deserializers.invalid_argument_exception_of_yojson tree path)
      | _, "InvalidRequestException" ->
          `InvalidRequestException
            (Json_deserializers.invalid_request_exception_of_yojson tree path)
      | _, "ResourceInUseException" ->
          `ResourceInUseException (Json_deserializers.resource_in_use_exception_of_yojson tree path)
      | _, "ResourceNotFoundException" ->
          `ResourceNotFoundException
            (Json_deserializers.resource_not_found_exception_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : add_application_input_request) =
    let input = Json_serializers.add_application_input_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"KinesisAnalytics_20180523.AddApplicationInput"
      ~service ~context ~input
      ~output_deserializer:Json_deserializers.add_application_input_response_of_yojson
      ~error_deserializer
end

module AddApplicationInputProcessingConfiguration = struct
  let error_to_string = function
    | `ConcurrentModificationException _ ->
        "com.amazonaws.kinesisanalyticsv2#ConcurrentModificationException"
    | `InvalidArgumentException _ -> "com.amazonaws.kinesisanalyticsv2#InvalidArgumentException"
    | `InvalidRequestException _ -> "com.amazonaws.kinesisanalyticsv2#InvalidRequestException"
    | `ResourceInUseException _ -> "com.amazonaws.kinesisanalyticsv2#ResourceInUseException"
    | `ResourceNotFoundException _ -> "com.amazonaws.kinesisanalyticsv2#ResourceNotFoundException"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "ConcurrentModificationException" ->
          `ConcurrentModificationException
            (Json_deserializers.concurrent_modification_exception_of_yojson tree path)
      | _, "InvalidArgumentException" ->
          `InvalidArgumentException
            (Json_deserializers.invalid_argument_exception_of_yojson tree path)
      | _, "InvalidRequestException" ->
          `InvalidRequestException
            (Json_deserializers.invalid_request_exception_of_yojson tree path)
      | _, "ResourceInUseException" ->
          `ResourceInUseException (Json_deserializers.resource_in_use_exception_of_yojson tree path)
      | _, "ResourceNotFoundException" ->
          `ResourceNotFoundException
            (Json_deserializers.resource_not_found_exception_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : add_application_input_processing_configuration_request) =
    let input =
      Json_serializers.add_application_input_processing_configuration_request_to_yojson request
    in
    Smaws_Lib.Protocols.AwsJson.request
      ~shape_name:"KinesisAnalytics_20180523.AddApplicationInputProcessingConfiguration" ~service
      ~context ~input
      ~output_deserializer:
        Json_deserializers.add_application_input_processing_configuration_response_of_yojson
      ~error_deserializer
end

module AddApplicationOutput = struct
  let error_to_string = function
    | `ConcurrentModificationException _ ->
        "com.amazonaws.kinesisanalyticsv2#ConcurrentModificationException"
    | `InvalidArgumentException _ -> "com.amazonaws.kinesisanalyticsv2#InvalidArgumentException"
    | `InvalidRequestException _ -> "com.amazonaws.kinesisanalyticsv2#InvalidRequestException"
    | `ResourceInUseException _ -> "com.amazonaws.kinesisanalyticsv2#ResourceInUseException"
    | `ResourceNotFoundException _ -> "com.amazonaws.kinesisanalyticsv2#ResourceNotFoundException"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "ConcurrentModificationException" ->
          `ConcurrentModificationException
            (Json_deserializers.concurrent_modification_exception_of_yojson tree path)
      | _, "InvalidArgumentException" ->
          `InvalidArgumentException
            (Json_deserializers.invalid_argument_exception_of_yojson tree path)
      | _, "InvalidRequestException" ->
          `InvalidRequestException
            (Json_deserializers.invalid_request_exception_of_yojson tree path)
      | _, "ResourceInUseException" ->
          `ResourceInUseException (Json_deserializers.resource_in_use_exception_of_yojson tree path)
      | _, "ResourceNotFoundException" ->
          `ResourceNotFoundException
            (Json_deserializers.resource_not_found_exception_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : add_application_output_request) =
    let input = Json_serializers.add_application_output_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"KinesisAnalytics_20180523.AddApplicationOutput"
      ~service ~context ~input
      ~output_deserializer:Json_deserializers.add_application_output_response_of_yojson
      ~error_deserializer
end

module AddApplicationReferenceDataSource = struct
  let error_to_string = function
    | `ConcurrentModificationException _ ->
        "com.amazonaws.kinesisanalyticsv2#ConcurrentModificationException"
    | `InvalidArgumentException _ -> "com.amazonaws.kinesisanalyticsv2#InvalidArgumentException"
    | `InvalidRequestException _ -> "com.amazonaws.kinesisanalyticsv2#InvalidRequestException"
    | `ResourceInUseException _ -> "com.amazonaws.kinesisanalyticsv2#ResourceInUseException"
    | `ResourceNotFoundException _ -> "com.amazonaws.kinesisanalyticsv2#ResourceNotFoundException"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "ConcurrentModificationException" ->
          `ConcurrentModificationException
            (Json_deserializers.concurrent_modification_exception_of_yojson tree path)
      | _, "InvalidArgumentException" ->
          `InvalidArgumentException
            (Json_deserializers.invalid_argument_exception_of_yojson tree path)
      | _, "InvalidRequestException" ->
          `InvalidRequestException
            (Json_deserializers.invalid_request_exception_of_yojson tree path)
      | _, "ResourceInUseException" ->
          `ResourceInUseException (Json_deserializers.resource_in_use_exception_of_yojson tree path)
      | _, "ResourceNotFoundException" ->
          `ResourceNotFoundException
            (Json_deserializers.resource_not_found_exception_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : add_application_reference_data_source_request) =
    let input = Json_serializers.add_application_reference_data_source_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request
      ~shape_name:"KinesisAnalytics_20180523.AddApplicationReferenceDataSource" ~service ~context
      ~input
      ~output_deserializer:
        Json_deserializers.add_application_reference_data_source_response_of_yojson
      ~error_deserializer
end

module AddApplicationVpcConfiguration = struct
  let error_to_string = function
    | `ConcurrentModificationException _ ->
        "com.amazonaws.kinesisanalyticsv2#ConcurrentModificationException"
    | `InvalidApplicationConfigurationException _ ->
        "com.amazonaws.kinesisanalyticsv2#InvalidApplicationConfigurationException"
    | `InvalidArgumentException _ -> "com.amazonaws.kinesisanalyticsv2#InvalidArgumentException"
    | `ResourceInUseException _ -> "com.amazonaws.kinesisanalyticsv2#ResourceInUseException"
    | `ResourceNotFoundException _ -> "com.amazonaws.kinesisanalyticsv2#ResourceNotFoundException"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "ConcurrentModificationException" ->
          `ConcurrentModificationException
            (Json_deserializers.concurrent_modification_exception_of_yojson tree path)
      | _, "InvalidApplicationConfigurationException" ->
          `InvalidApplicationConfigurationException
            (Json_deserializers.invalid_application_configuration_exception_of_yojson tree path)
      | _, "InvalidArgumentException" ->
          `InvalidArgumentException
            (Json_deserializers.invalid_argument_exception_of_yojson tree path)
      | _, "ResourceInUseException" ->
          `ResourceInUseException (Json_deserializers.resource_in_use_exception_of_yojson tree path)
      | _, "ResourceNotFoundException" ->
          `ResourceNotFoundException
            (Json_deserializers.resource_not_found_exception_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : add_application_vpc_configuration_request) =
    let input = Json_serializers.add_application_vpc_configuration_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request
      ~shape_name:"KinesisAnalytics_20180523.AddApplicationVpcConfiguration" ~service ~context
      ~input
      ~output_deserializer:Json_deserializers.add_application_vpc_configuration_response_of_yojson
      ~error_deserializer
end

module CreateApplication = struct
  let error_to_string = function
    | `CodeValidationException _ -> "com.amazonaws.kinesisanalyticsv2#CodeValidationException"
    | `ConcurrentModificationException _ ->
        "com.amazonaws.kinesisanalyticsv2#ConcurrentModificationException"
    | `InvalidArgumentException _ -> "com.amazonaws.kinesisanalyticsv2#InvalidArgumentException"
    | `InvalidRequestException _ -> "com.amazonaws.kinesisanalyticsv2#InvalidRequestException"
    | `LimitExceededException _ -> "com.amazonaws.kinesisanalyticsv2#LimitExceededException"
    | `ResourceInUseException _ -> "com.amazonaws.kinesisanalyticsv2#ResourceInUseException"
    | `TooManyTagsException _ -> "com.amazonaws.kinesisanalyticsv2#TooManyTagsException"
    | `UnsupportedOperationException _ ->
        "com.amazonaws.kinesisanalyticsv2#UnsupportedOperationException"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "CodeValidationException" ->
          `CodeValidationException
            (Json_deserializers.code_validation_exception_of_yojson tree path)
      | _, "ConcurrentModificationException" ->
          `ConcurrentModificationException
            (Json_deserializers.concurrent_modification_exception_of_yojson tree path)
      | _, "InvalidArgumentException" ->
          `InvalidArgumentException
            (Json_deserializers.invalid_argument_exception_of_yojson tree path)
      | _, "InvalidRequestException" ->
          `InvalidRequestException
            (Json_deserializers.invalid_request_exception_of_yojson tree path)
      | _, "LimitExceededException" ->
          `LimitExceededException (Json_deserializers.limit_exceeded_exception_of_yojson tree path)
      | _, "ResourceInUseException" ->
          `ResourceInUseException (Json_deserializers.resource_in_use_exception_of_yojson tree path)
      | _, "TooManyTagsException" ->
          `TooManyTagsException (Json_deserializers.too_many_tags_exception_of_yojson tree path)
      | _, "UnsupportedOperationException" ->
          `UnsupportedOperationException
            (Json_deserializers.unsupported_operation_exception_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : create_application_request) =
    let input = Json_serializers.create_application_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"KinesisAnalytics_20180523.CreateApplication"
      ~service ~context ~input
      ~output_deserializer:Json_deserializers.create_application_response_of_yojson
      ~error_deserializer
end

module CreateApplicationPresignedUrl = struct
  let error_to_string = function
    | `InvalidArgumentException _ -> "com.amazonaws.kinesisanalyticsv2#InvalidArgumentException"
    | `ResourceInUseException _ -> "com.amazonaws.kinesisanalyticsv2#ResourceInUseException"
    | `ResourceNotFoundException _ -> "com.amazonaws.kinesisanalyticsv2#ResourceNotFoundException"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "InvalidArgumentException" ->
          `InvalidArgumentException
            (Json_deserializers.invalid_argument_exception_of_yojson tree path)
      | _, "ResourceInUseException" ->
          `ResourceInUseException (Json_deserializers.resource_in_use_exception_of_yojson tree path)
      | _, "ResourceNotFoundException" ->
          `ResourceNotFoundException
            (Json_deserializers.resource_not_found_exception_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : create_application_presigned_url_request) =
    let input = Json_serializers.create_application_presigned_url_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request
      ~shape_name:"KinesisAnalytics_20180523.CreateApplicationPresignedUrl" ~service ~context ~input
      ~output_deserializer:Json_deserializers.create_application_presigned_url_response_of_yojson
      ~error_deserializer
end

module CreateApplicationSnapshot = struct
  let error_to_string = function
    | `InvalidApplicationConfigurationException _ ->
        "com.amazonaws.kinesisanalyticsv2#InvalidApplicationConfigurationException"
    | `InvalidArgumentException _ -> "com.amazonaws.kinesisanalyticsv2#InvalidArgumentException"
    | `InvalidRequestException _ -> "com.amazonaws.kinesisanalyticsv2#InvalidRequestException"
    | `LimitExceededException _ -> "com.amazonaws.kinesisanalyticsv2#LimitExceededException"
    | `ResourceInUseException _ -> "com.amazonaws.kinesisanalyticsv2#ResourceInUseException"
    | `ResourceNotFoundException _ -> "com.amazonaws.kinesisanalyticsv2#ResourceNotFoundException"
    | `UnsupportedOperationException _ ->
        "com.amazonaws.kinesisanalyticsv2#UnsupportedOperationException"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "InvalidApplicationConfigurationException" ->
          `InvalidApplicationConfigurationException
            (Json_deserializers.invalid_application_configuration_exception_of_yojson tree path)
      | _, "InvalidArgumentException" ->
          `InvalidArgumentException
            (Json_deserializers.invalid_argument_exception_of_yojson tree path)
      | _, "InvalidRequestException" ->
          `InvalidRequestException
            (Json_deserializers.invalid_request_exception_of_yojson tree path)
      | _, "LimitExceededException" ->
          `LimitExceededException (Json_deserializers.limit_exceeded_exception_of_yojson tree path)
      | _, "ResourceInUseException" ->
          `ResourceInUseException (Json_deserializers.resource_in_use_exception_of_yojson tree path)
      | _, "ResourceNotFoundException" ->
          `ResourceNotFoundException
            (Json_deserializers.resource_not_found_exception_of_yojson tree path)
      | _, "UnsupportedOperationException" ->
          `UnsupportedOperationException
            (Json_deserializers.unsupported_operation_exception_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : create_application_snapshot_request) =
    let input = Json_serializers.create_application_snapshot_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request
      ~shape_name:"KinesisAnalytics_20180523.CreateApplicationSnapshot" ~service ~context ~input
      ~output_deserializer:Json_deserializers.create_application_snapshot_response_of_yojson
      ~error_deserializer
end

module DeleteApplication = struct
  let error_to_string = function
    | `ConcurrentModificationException _ ->
        "com.amazonaws.kinesisanalyticsv2#ConcurrentModificationException"
    | `InvalidApplicationConfigurationException _ ->
        "com.amazonaws.kinesisanalyticsv2#InvalidApplicationConfigurationException"
    | `InvalidArgumentException _ -> "com.amazonaws.kinesisanalyticsv2#InvalidArgumentException"
    | `InvalidRequestException _ -> "com.amazonaws.kinesisanalyticsv2#InvalidRequestException"
    | `ResourceInUseException _ -> "com.amazonaws.kinesisanalyticsv2#ResourceInUseException"
    | `ResourceNotFoundException _ -> "com.amazonaws.kinesisanalyticsv2#ResourceNotFoundException"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "ConcurrentModificationException" ->
          `ConcurrentModificationException
            (Json_deserializers.concurrent_modification_exception_of_yojson tree path)
      | _, "InvalidApplicationConfigurationException" ->
          `InvalidApplicationConfigurationException
            (Json_deserializers.invalid_application_configuration_exception_of_yojson tree path)
      | _, "InvalidArgumentException" ->
          `InvalidArgumentException
            (Json_deserializers.invalid_argument_exception_of_yojson tree path)
      | _, "InvalidRequestException" ->
          `InvalidRequestException
            (Json_deserializers.invalid_request_exception_of_yojson tree path)
      | _, "ResourceInUseException" ->
          `ResourceInUseException (Json_deserializers.resource_in_use_exception_of_yojson tree path)
      | _, "ResourceNotFoundException" ->
          `ResourceNotFoundException
            (Json_deserializers.resource_not_found_exception_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : delete_application_request) =
    let input = Json_serializers.delete_application_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"KinesisAnalytics_20180523.DeleteApplication"
      ~service ~context ~input
      ~output_deserializer:Json_deserializers.delete_application_response_of_yojson
      ~error_deserializer
end

module DeleteApplicationCloudWatchLoggingOption = struct
  let error_to_string = function
    | `ConcurrentModificationException _ ->
        "com.amazonaws.kinesisanalyticsv2#ConcurrentModificationException"
    | `InvalidApplicationConfigurationException _ ->
        "com.amazonaws.kinesisanalyticsv2#InvalidApplicationConfigurationException"
    | `InvalidArgumentException _ -> "com.amazonaws.kinesisanalyticsv2#InvalidArgumentException"
    | `InvalidRequestException _ -> "com.amazonaws.kinesisanalyticsv2#InvalidRequestException"
    | `ResourceInUseException _ -> "com.amazonaws.kinesisanalyticsv2#ResourceInUseException"
    | `ResourceNotFoundException _ -> "com.amazonaws.kinesisanalyticsv2#ResourceNotFoundException"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "ConcurrentModificationException" ->
          `ConcurrentModificationException
            (Json_deserializers.concurrent_modification_exception_of_yojson tree path)
      | _, "InvalidApplicationConfigurationException" ->
          `InvalidApplicationConfigurationException
            (Json_deserializers.invalid_application_configuration_exception_of_yojson tree path)
      | _, "InvalidArgumentException" ->
          `InvalidArgumentException
            (Json_deserializers.invalid_argument_exception_of_yojson tree path)
      | _, "InvalidRequestException" ->
          `InvalidRequestException
            (Json_deserializers.invalid_request_exception_of_yojson tree path)
      | _, "ResourceInUseException" ->
          `ResourceInUseException (Json_deserializers.resource_in_use_exception_of_yojson tree path)
      | _, "ResourceNotFoundException" ->
          `ResourceNotFoundException
            (Json_deserializers.resource_not_found_exception_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : delete_application_cloud_watch_logging_option_request) =
    let input =
      Json_serializers.delete_application_cloud_watch_logging_option_request_to_yojson request
    in
    Smaws_Lib.Protocols.AwsJson.request
      ~shape_name:"KinesisAnalytics_20180523.DeleteApplicationCloudWatchLoggingOption" ~service
      ~context ~input
      ~output_deserializer:
        Json_deserializers.delete_application_cloud_watch_logging_option_response_of_yojson
      ~error_deserializer
end

module DeleteApplicationInputProcessingConfiguration = struct
  let error_to_string = function
    | `ConcurrentModificationException _ ->
        "com.amazonaws.kinesisanalyticsv2#ConcurrentModificationException"
    | `InvalidArgumentException _ -> "com.amazonaws.kinesisanalyticsv2#InvalidArgumentException"
    | `InvalidRequestException _ -> "com.amazonaws.kinesisanalyticsv2#InvalidRequestException"
    | `ResourceInUseException _ -> "com.amazonaws.kinesisanalyticsv2#ResourceInUseException"
    | `ResourceNotFoundException _ -> "com.amazonaws.kinesisanalyticsv2#ResourceNotFoundException"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "ConcurrentModificationException" ->
          `ConcurrentModificationException
            (Json_deserializers.concurrent_modification_exception_of_yojson tree path)
      | _, "InvalidArgumentException" ->
          `InvalidArgumentException
            (Json_deserializers.invalid_argument_exception_of_yojson tree path)
      | _, "InvalidRequestException" ->
          `InvalidRequestException
            (Json_deserializers.invalid_request_exception_of_yojson tree path)
      | _, "ResourceInUseException" ->
          `ResourceInUseException (Json_deserializers.resource_in_use_exception_of_yojson tree path)
      | _, "ResourceNotFoundException" ->
          `ResourceNotFoundException
            (Json_deserializers.resource_not_found_exception_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : delete_application_input_processing_configuration_request) =
    let input =
      Json_serializers.delete_application_input_processing_configuration_request_to_yojson request
    in
    Smaws_Lib.Protocols.AwsJson.request
      ~shape_name:"KinesisAnalytics_20180523.DeleteApplicationInputProcessingConfiguration" ~service
      ~context ~input
      ~output_deserializer:
        Json_deserializers.delete_application_input_processing_configuration_response_of_yojson
      ~error_deserializer
end

module DeleteApplicationOutput = struct
  let error_to_string = function
    | `ConcurrentModificationException _ ->
        "com.amazonaws.kinesisanalyticsv2#ConcurrentModificationException"
    | `InvalidArgumentException _ -> "com.amazonaws.kinesisanalyticsv2#InvalidArgumentException"
    | `InvalidRequestException _ -> "com.amazonaws.kinesisanalyticsv2#InvalidRequestException"
    | `ResourceInUseException _ -> "com.amazonaws.kinesisanalyticsv2#ResourceInUseException"
    | `ResourceNotFoundException _ -> "com.amazonaws.kinesisanalyticsv2#ResourceNotFoundException"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "ConcurrentModificationException" ->
          `ConcurrentModificationException
            (Json_deserializers.concurrent_modification_exception_of_yojson tree path)
      | _, "InvalidArgumentException" ->
          `InvalidArgumentException
            (Json_deserializers.invalid_argument_exception_of_yojson tree path)
      | _, "InvalidRequestException" ->
          `InvalidRequestException
            (Json_deserializers.invalid_request_exception_of_yojson tree path)
      | _, "ResourceInUseException" ->
          `ResourceInUseException (Json_deserializers.resource_in_use_exception_of_yojson tree path)
      | _, "ResourceNotFoundException" ->
          `ResourceNotFoundException
            (Json_deserializers.resource_not_found_exception_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : delete_application_output_request) =
    let input = Json_serializers.delete_application_output_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request
      ~shape_name:"KinesisAnalytics_20180523.DeleteApplicationOutput" ~service ~context ~input
      ~output_deserializer:Json_deserializers.delete_application_output_response_of_yojson
      ~error_deserializer
end

module DeleteApplicationReferenceDataSource = struct
  let error_to_string = function
    | `ConcurrentModificationException _ ->
        "com.amazonaws.kinesisanalyticsv2#ConcurrentModificationException"
    | `InvalidArgumentException _ -> "com.amazonaws.kinesisanalyticsv2#InvalidArgumentException"
    | `InvalidRequestException _ -> "com.amazonaws.kinesisanalyticsv2#InvalidRequestException"
    | `ResourceInUseException _ -> "com.amazonaws.kinesisanalyticsv2#ResourceInUseException"
    | `ResourceNotFoundException _ -> "com.amazonaws.kinesisanalyticsv2#ResourceNotFoundException"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "ConcurrentModificationException" ->
          `ConcurrentModificationException
            (Json_deserializers.concurrent_modification_exception_of_yojson tree path)
      | _, "InvalidArgumentException" ->
          `InvalidArgumentException
            (Json_deserializers.invalid_argument_exception_of_yojson tree path)
      | _, "InvalidRequestException" ->
          `InvalidRequestException
            (Json_deserializers.invalid_request_exception_of_yojson tree path)
      | _, "ResourceInUseException" ->
          `ResourceInUseException (Json_deserializers.resource_in_use_exception_of_yojson tree path)
      | _, "ResourceNotFoundException" ->
          `ResourceNotFoundException
            (Json_deserializers.resource_not_found_exception_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : delete_application_reference_data_source_request) =
    let input =
      Json_serializers.delete_application_reference_data_source_request_to_yojson request
    in
    Smaws_Lib.Protocols.AwsJson.request
      ~shape_name:"KinesisAnalytics_20180523.DeleteApplicationReferenceDataSource" ~service ~context
      ~input
      ~output_deserializer:
        Json_deserializers.delete_application_reference_data_source_response_of_yojson
      ~error_deserializer
end

module DeleteApplicationSnapshot = struct
  let error_to_string = function
    | `ConcurrentModificationException _ ->
        "com.amazonaws.kinesisanalyticsv2#ConcurrentModificationException"
    | `InvalidArgumentException _ -> "com.amazonaws.kinesisanalyticsv2#InvalidArgumentException"
    | `InvalidRequestException _ -> "com.amazonaws.kinesisanalyticsv2#InvalidRequestException"
    | `ResourceInUseException _ -> "com.amazonaws.kinesisanalyticsv2#ResourceInUseException"
    | `ResourceNotFoundException _ -> "com.amazonaws.kinesisanalyticsv2#ResourceNotFoundException"
    | `UnsupportedOperationException _ ->
        "com.amazonaws.kinesisanalyticsv2#UnsupportedOperationException"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "ConcurrentModificationException" ->
          `ConcurrentModificationException
            (Json_deserializers.concurrent_modification_exception_of_yojson tree path)
      | _, "InvalidArgumentException" ->
          `InvalidArgumentException
            (Json_deserializers.invalid_argument_exception_of_yojson tree path)
      | _, "InvalidRequestException" ->
          `InvalidRequestException
            (Json_deserializers.invalid_request_exception_of_yojson tree path)
      | _, "ResourceInUseException" ->
          `ResourceInUseException (Json_deserializers.resource_in_use_exception_of_yojson tree path)
      | _, "ResourceNotFoundException" ->
          `ResourceNotFoundException
            (Json_deserializers.resource_not_found_exception_of_yojson tree path)
      | _, "UnsupportedOperationException" ->
          `UnsupportedOperationException
            (Json_deserializers.unsupported_operation_exception_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : delete_application_snapshot_request) =
    let input = Json_serializers.delete_application_snapshot_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request
      ~shape_name:"KinesisAnalytics_20180523.DeleteApplicationSnapshot" ~service ~context ~input
      ~output_deserializer:Json_deserializers.delete_application_snapshot_response_of_yojson
      ~error_deserializer
end

module DeleteApplicationVpcConfiguration = struct
  let error_to_string = function
    | `ConcurrentModificationException _ ->
        "com.amazonaws.kinesisanalyticsv2#ConcurrentModificationException"
    | `InvalidApplicationConfigurationException _ ->
        "com.amazonaws.kinesisanalyticsv2#InvalidApplicationConfigurationException"
    | `InvalidArgumentException _ -> "com.amazonaws.kinesisanalyticsv2#InvalidArgumentException"
    | `ResourceInUseException _ -> "com.amazonaws.kinesisanalyticsv2#ResourceInUseException"
    | `ResourceNotFoundException _ -> "com.amazonaws.kinesisanalyticsv2#ResourceNotFoundException"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "ConcurrentModificationException" ->
          `ConcurrentModificationException
            (Json_deserializers.concurrent_modification_exception_of_yojson tree path)
      | _, "InvalidApplicationConfigurationException" ->
          `InvalidApplicationConfigurationException
            (Json_deserializers.invalid_application_configuration_exception_of_yojson tree path)
      | _, "InvalidArgumentException" ->
          `InvalidArgumentException
            (Json_deserializers.invalid_argument_exception_of_yojson tree path)
      | _, "ResourceInUseException" ->
          `ResourceInUseException (Json_deserializers.resource_in_use_exception_of_yojson tree path)
      | _, "ResourceNotFoundException" ->
          `ResourceNotFoundException
            (Json_deserializers.resource_not_found_exception_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : delete_application_vpc_configuration_request) =
    let input = Json_serializers.delete_application_vpc_configuration_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request
      ~shape_name:"KinesisAnalytics_20180523.DeleteApplicationVpcConfiguration" ~service ~context
      ~input
      ~output_deserializer:
        Json_deserializers.delete_application_vpc_configuration_response_of_yojson
      ~error_deserializer
end

module DescribeApplication = struct
  let error_to_string = function
    | `InvalidArgumentException _ -> "com.amazonaws.kinesisanalyticsv2#InvalidArgumentException"
    | `InvalidRequestException _ -> "com.amazonaws.kinesisanalyticsv2#InvalidRequestException"
    | `ResourceNotFoundException _ -> "com.amazonaws.kinesisanalyticsv2#ResourceNotFoundException"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "InvalidArgumentException" ->
          `InvalidArgumentException
            (Json_deserializers.invalid_argument_exception_of_yojson tree path)
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

  let request context (request : describe_application_request) =
    let input = Json_serializers.describe_application_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"KinesisAnalytics_20180523.DescribeApplication"
      ~service ~context ~input
      ~output_deserializer:Json_deserializers.describe_application_response_of_yojson
      ~error_deserializer
end

module DescribeApplicationOperation = struct
  let error_to_string = function
    | `InvalidArgumentException _ -> "com.amazonaws.kinesisanalyticsv2#InvalidArgumentException"
    | `ResourceNotFoundException _ -> "com.amazonaws.kinesisanalyticsv2#ResourceNotFoundException"
    | `UnsupportedOperationException _ ->
        "com.amazonaws.kinesisanalyticsv2#UnsupportedOperationException"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "InvalidArgumentException" ->
          `InvalidArgumentException
            (Json_deserializers.invalid_argument_exception_of_yojson tree path)
      | _, "ResourceNotFoundException" ->
          `ResourceNotFoundException
            (Json_deserializers.resource_not_found_exception_of_yojson tree path)
      | _, "UnsupportedOperationException" ->
          `UnsupportedOperationException
            (Json_deserializers.unsupported_operation_exception_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : describe_application_operation_request) =
    let input = Json_serializers.describe_application_operation_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request
      ~shape_name:"KinesisAnalytics_20180523.DescribeApplicationOperation" ~service ~context ~input
      ~output_deserializer:Json_deserializers.describe_application_operation_response_of_yojson
      ~error_deserializer
end

module DescribeApplicationSnapshot = struct
  let error_to_string = function
    | `InvalidArgumentException _ -> "com.amazonaws.kinesisanalyticsv2#InvalidArgumentException"
    | `ResourceNotFoundException _ -> "com.amazonaws.kinesisanalyticsv2#ResourceNotFoundException"
    | `UnsupportedOperationException _ ->
        "com.amazonaws.kinesisanalyticsv2#UnsupportedOperationException"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "InvalidArgumentException" ->
          `InvalidArgumentException
            (Json_deserializers.invalid_argument_exception_of_yojson tree path)
      | _, "ResourceNotFoundException" ->
          `ResourceNotFoundException
            (Json_deserializers.resource_not_found_exception_of_yojson tree path)
      | _, "UnsupportedOperationException" ->
          `UnsupportedOperationException
            (Json_deserializers.unsupported_operation_exception_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : describe_application_snapshot_request) =
    let input = Json_serializers.describe_application_snapshot_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request
      ~shape_name:"KinesisAnalytics_20180523.DescribeApplicationSnapshot" ~service ~context ~input
      ~output_deserializer:Json_deserializers.describe_application_snapshot_response_of_yojson
      ~error_deserializer
end

module DescribeApplicationVersion = struct
  let error_to_string = function
    | `InvalidArgumentException _ -> "com.amazonaws.kinesisanalyticsv2#InvalidArgumentException"
    | `ResourceNotFoundException _ -> "com.amazonaws.kinesisanalyticsv2#ResourceNotFoundException"
    | `UnsupportedOperationException _ ->
        "com.amazonaws.kinesisanalyticsv2#UnsupportedOperationException"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "InvalidArgumentException" ->
          `InvalidArgumentException
            (Json_deserializers.invalid_argument_exception_of_yojson tree path)
      | _, "ResourceNotFoundException" ->
          `ResourceNotFoundException
            (Json_deserializers.resource_not_found_exception_of_yojson tree path)
      | _, "UnsupportedOperationException" ->
          `UnsupportedOperationException
            (Json_deserializers.unsupported_operation_exception_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : describe_application_version_request) =
    let input = Json_serializers.describe_application_version_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request
      ~shape_name:"KinesisAnalytics_20180523.DescribeApplicationVersion" ~service ~context ~input
      ~output_deserializer:Json_deserializers.describe_application_version_response_of_yojson
      ~error_deserializer
end

module DiscoverInputSchema = struct
  let error_to_string = function
    | `InvalidArgumentException _ -> "com.amazonaws.kinesisanalyticsv2#InvalidArgumentException"
    | `InvalidRequestException _ -> "com.amazonaws.kinesisanalyticsv2#InvalidRequestException"
    | `ResourceProvisionedThroughputExceededException _ ->
        "com.amazonaws.kinesisanalyticsv2#ResourceProvisionedThroughputExceededException"
    | `ServiceUnavailableException _ ->
        "com.amazonaws.kinesisanalyticsv2#ServiceUnavailableException"
    | `UnableToDetectSchemaException _ ->
        "com.amazonaws.kinesisanalyticsv2#UnableToDetectSchemaException"
    | `UnsupportedOperationException _ ->
        "com.amazonaws.kinesisanalyticsv2#UnsupportedOperationException"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "InvalidArgumentException" ->
          `InvalidArgumentException
            (Json_deserializers.invalid_argument_exception_of_yojson tree path)
      | _, "InvalidRequestException" ->
          `InvalidRequestException
            (Json_deserializers.invalid_request_exception_of_yojson tree path)
      | _, "ResourceProvisionedThroughputExceededException" ->
          `ResourceProvisionedThroughputExceededException
            (Json_deserializers.resource_provisioned_throughput_exceeded_exception_of_yojson tree
               path)
      | _, "ServiceUnavailableException" ->
          `ServiceUnavailableException
            (Json_deserializers.service_unavailable_exception_of_yojson tree path)
      | _, "UnableToDetectSchemaException" ->
          `UnableToDetectSchemaException
            (Json_deserializers.unable_to_detect_schema_exception_of_yojson tree path)
      | _, "UnsupportedOperationException" ->
          `UnsupportedOperationException
            (Json_deserializers.unsupported_operation_exception_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : discover_input_schema_request) =
    let input = Json_serializers.discover_input_schema_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"KinesisAnalytics_20180523.DiscoverInputSchema"
      ~service ~context ~input
      ~output_deserializer:Json_deserializers.discover_input_schema_response_of_yojson
      ~error_deserializer
end

module ListApplicationOperations = struct
  let error_to_string = function
    | `InvalidArgumentException _ -> "com.amazonaws.kinesisanalyticsv2#InvalidArgumentException"
    | `ResourceNotFoundException _ -> "com.amazonaws.kinesisanalyticsv2#ResourceNotFoundException"
    | `UnsupportedOperationException _ ->
        "com.amazonaws.kinesisanalyticsv2#UnsupportedOperationException"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "InvalidArgumentException" ->
          `InvalidArgumentException
            (Json_deserializers.invalid_argument_exception_of_yojson tree path)
      | _, "ResourceNotFoundException" ->
          `ResourceNotFoundException
            (Json_deserializers.resource_not_found_exception_of_yojson tree path)
      | _, "UnsupportedOperationException" ->
          `UnsupportedOperationException
            (Json_deserializers.unsupported_operation_exception_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : list_application_operations_request) =
    let input = Json_serializers.list_application_operations_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request
      ~shape_name:"KinesisAnalytics_20180523.ListApplicationOperations" ~service ~context ~input
      ~output_deserializer:Json_deserializers.list_application_operations_response_of_yojson
      ~error_deserializer
end

module ListApplicationSnapshots = struct
  let error_to_string = function
    | `InvalidArgumentException _ -> "com.amazonaws.kinesisanalyticsv2#InvalidArgumentException"
    | `UnsupportedOperationException _ ->
        "com.amazonaws.kinesisanalyticsv2#UnsupportedOperationException"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "InvalidArgumentException" ->
          `InvalidArgumentException
            (Json_deserializers.invalid_argument_exception_of_yojson tree path)
      | _, "UnsupportedOperationException" ->
          `UnsupportedOperationException
            (Json_deserializers.unsupported_operation_exception_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : list_application_snapshots_request) =
    let input = Json_serializers.list_application_snapshots_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request
      ~shape_name:"KinesisAnalytics_20180523.ListApplicationSnapshots" ~service ~context ~input
      ~output_deserializer:Json_deserializers.list_application_snapshots_response_of_yojson
      ~error_deserializer
end

module ListApplicationVersions = struct
  let error_to_string = function
    | `InvalidArgumentException _ -> "com.amazonaws.kinesisanalyticsv2#InvalidArgumentException"
    | `ResourceNotFoundException _ -> "com.amazonaws.kinesisanalyticsv2#ResourceNotFoundException"
    | `UnsupportedOperationException _ ->
        "com.amazonaws.kinesisanalyticsv2#UnsupportedOperationException"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "InvalidArgumentException" ->
          `InvalidArgumentException
            (Json_deserializers.invalid_argument_exception_of_yojson tree path)
      | _, "ResourceNotFoundException" ->
          `ResourceNotFoundException
            (Json_deserializers.resource_not_found_exception_of_yojson tree path)
      | _, "UnsupportedOperationException" ->
          `UnsupportedOperationException
            (Json_deserializers.unsupported_operation_exception_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : list_application_versions_request) =
    let input = Json_serializers.list_application_versions_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request
      ~shape_name:"KinesisAnalytics_20180523.ListApplicationVersions" ~service ~context ~input
      ~output_deserializer:Json_deserializers.list_application_versions_response_of_yojson
      ~error_deserializer
end

module ListApplications = struct
  let error_to_string = function
    | `InvalidRequestException _ -> "com.amazonaws.kinesisanalyticsv2#InvalidRequestException"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "InvalidRequestException" ->
          `InvalidRequestException
            (Json_deserializers.invalid_request_exception_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : list_applications_request) =
    let input = Json_serializers.list_applications_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"KinesisAnalytics_20180523.ListApplications"
      ~service ~context ~input
      ~output_deserializer:Json_deserializers.list_applications_response_of_yojson
      ~error_deserializer
end

module ListTagsForResource = struct
  let error_to_string = function
    | `ConcurrentModificationException _ ->
        "com.amazonaws.kinesisanalyticsv2#ConcurrentModificationException"
    | `InvalidArgumentException _ -> "com.amazonaws.kinesisanalyticsv2#InvalidArgumentException"
    | `ResourceNotFoundException _ -> "com.amazonaws.kinesisanalyticsv2#ResourceNotFoundException"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "ConcurrentModificationException" ->
          `ConcurrentModificationException
            (Json_deserializers.concurrent_modification_exception_of_yojson tree path)
      | _, "InvalidArgumentException" ->
          `InvalidArgumentException
            (Json_deserializers.invalid_argument_exception_of_yojson tree path)
      | _, "ResourceNotFoundException" ->
          `ResourceNotFoundException
            (Json_deserializers.resource_not_found_exception_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : list_tags_for_resource_request) =
    let input = Json_serializers.list_tags_for_resource_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"KinesisAnalytics_20180523.ListTagsForResource"
      ~service ~context ~input
      ~output_deserializer:Json_deserializers.list_tags_for_resource_response_of_yojson
      ~error_deserializer
end

module RollbackApplication = struct
  let error_to_string = function
    | `ConcurrentModificationException _ ->
        "com.amazonaws.kinesisanalyticsv2#ConcurrentModificationException"
    | `InvalidArgumentException _ -> "com.amazonaws.kinesisanalyticsv2#InvalidArgumentException"
    | `InvalidRequestException _ -> "com.amazonaws.kinesisanalyticsv2#InvalidRequestException"
    | `ResourceInUseException _ -> "com.amazonaws.kinesisanalyticsv2#ResourceInUseException"
    | `ResourceNotFoundException _ -> "com.amazonaws.kinesisanalyticsv2#ResourceNotFoundException"
    | `UnsupportedOperationException _ ->
        "com.amazonaws.kinesisanalyticsv2#UnsupportedOperationException"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "ConcurrentModificationException" ->
          `ConcurrentModificationException
            (Json_deserializers.concurrent_modification_exception_of_yojson tree path)
      | _, "InvalidArgumentException" ->
          `InvalidArgumentException
            (Json_deserializers.invalid_argument_exception_of_yojson tree path)
      | _, "InvalidRequestException" ->
          `InvalidRequestException
            (Json_deserializers.invalid_request_exception_of_yojson tree path)
      | _, "ResourceInUseException" ->
          `ResourceInUseException (Json_deserializers.resource_in_use_exception_of_yojson tree path)
      | _, "ResourceNotFoundException" ->
          `ResourceNotFoundException
            (Json_deserializers.resource_not_found_exception_of_yojson tree path)
      | _, "UnsupportedOperationException" ->
          `UnsupportedOperationException
            (Json_deserializers.unsupported_operation_exception_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : rollback_application_request) =
    let input = Json_serializers.rollback_application_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"KinesisAnalytics_20180523.RollbackApplication"
      ~service ~context ~input
      ~output_deserializer:Json_deserializers.rollback_application_response_of_yojson
      ~error_deserializer
end

module StartApplication = struct
  let error_to_string = function
    | `InvalidApplicationConfigurationException _ ->
        "com.amazonaws.kinesisanalyticsv2#InvalidApplicationConfigurationException"
    | `InvalidArgumentException _ -> "com.amazonaws.kinesisanalyticsv2#InvalidArgumentException"
    | `InvalidRequestException _ -> "com.amazonaws.kinesisanalyticsv2#InvalidRequestException"
    | `ResourceInUseException _ -> "com.amazonaws.kinesisanalyticsv2#ResourceInUseException"
    | `ResourceNotFoundException _ -> "com.amazonaws.kinesisanalyticsv2#ResourceNotFoundException"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "InvalidApplicationConfigurationException" ->
          `InvalidApplicationConfigurationException
            (Json_deserializers.invalid_application_configuration_exception_of_yojson tree path)
      | _, "InvalidArgumentException" ->
          `InvalidArgumentException
            (Json_deserializers.invalid_argument_exception_of_yojson tree path)
      | _, "InvalidRequestException" ->
          `InvalidRequestException
            (Json_deserializers.invalid_request_exception_of_yojson tree path)
      | _, "ResourceInUseException" ->
          `ResourceInUseException (Json_deserializers.resource_in_use_exception_of_yojson tree path)
      | _, "ResourceNotFoundException" ->
          `ResourceNotFoundException
            (Json_deserializers.resource_not_found_exception_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : start_application_request) =
    let input = Json_serializers.start_application_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"KinesisAnalytics_20180523.StartApplication"
      ~service ~context ~input
      ~output_deserializer:Json_deserializers.start_application_response_of_yojson
      ~error_deserializer
end

module StopApplication = struct
  let error_to_string = function
    | `ConcurrentModificationException _ ->
        "com.amazonaws.kinesisanalyticsv2#ConcurrentModificationException"
    | `InvalidApplicationConfigurationException _ ->
        "com.amazonaws.kinesisanalyticsv2#InvalidApplicationConfigurationException"
    | `InvalidArgumentException _ -> "com.amazonaws.kinesisanalyticsv2#InvalidArgumentException"
    | `InvalidRequestException _ -> "com.amazonaws.kinesisanalyticsv2#InvalidRequestException"
    | `ResourceInUseException _ -> "com.amazonaws.kinesisanalyticsv2#ResourceInUseException"
    | `ResourceNotFoundException _ -> "com.amazonaws.kinesisanalyticsv2#ResourceNotFoundException"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "ConcurrentModificationException" ->
          `ConcurrentModificationException
            (Json_deserializers.concurrent_modification_exception_of_yojson tree path)
      | _, "InvalidApplicationConfigurationException" ->
          `InvalidApplicationConfigurationException
            (Json_deserializers.invalid_application_configuration_exception_of_yojson tree path)
      | _, "InvalidArgumentException" ->
          `InvalidArgumentException
            (Json_deserializers.invalid_argument_exception_of_yojson tree path)
      | _, "InvalidRequestException" ->
          `InvalidRequestException
            (Json_deserializers.invalid_request_exception_of_yojson tree path)
      | _, "ResourceInUseException" ->
          `ResourceInUseException (Json_deserializers.resource_in_use_exception_of_yojson tree path)
      | _, "ResourceNotFoundException" ->
          `ResourceNotFoundException
            (Json_deserializers.resource_not_found_exception_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : stop_application_request) =
    let input = Json_serializers.stop_application_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"KinesisAnalytics_20180523.StopApplication"
      ~service ~context ~input
      ~output_deserializer:Json_deserializers.stop_application_response_of_yojson
      ~error_deserializer
end

module TagResource = struct
  let error_to_string = function
    | `ConcurrentModificationException _ ->
        "com.amazonaws.kinesisanalyticsv2#ConcurrentModificationException"
    | `InvalidArgumentException _ -> "com.amazonaws.kinesisanalyticsv2#InvalidArgumentException"
    | `ResourceInUseException _ -> "com.amazonaws.kinesisanalyticsv2#ResourceInUseException"
    | `ResourceNotFoundException _ -> "com.amazonaws.kinesisanalyticsv2#ResourceNotFoundException"
    | `TooManyTagsException _ -> "com.amazonaws.kinesisanalyticsv2#TooManyTagsException"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "ConcurrentModificationException" ->
          `ConcurrentModificationException
            (Json_deserializers.concurrent_modification_exception_of_yojson tree path)
      | _, "InvalidArgumentException" ->
          `InvalidArgumentException
            (Json_deserializers.invalid_argument_exception_of_yojson tree path)
      | _, "ResourceInUseException" ->
          `ResourceInUseException (Json_deserializers.resource_in_use_exception_of_yojson tree path)
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
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"KinesisAnalytics_20180523.TagResource" ~service
      ~context ~input ~output_deserializer:Json_deserializers.tag_resource_response_of_yojson
      ~error_deserializer
end

module UntagResource = struct
  let error_to_string = function
    | `ConcurrentModificationException _ ->
        "com.amazonaws.kinesisanalyticsv2#ConcurrentModificationException"
    | `InvalidArgumentException _ -> "com.amazonaws.kinesisanalyticsv2#InvalidArgumentException"
    | `ResourceInUseException _ -> "com.amazonaws.kinesisanalyticsv2#ResourceInUseException"
    | `ResourceNotFoundException _ -> "com.amazonaws.kinesisanalyticsv2#ResourceNotFoundException"
    | `TooManyTagsException _ -> "com.amazonaws.kinesisanalyticsv2#TooManyTagsException"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "ConcurrentModificationException" ->
          `ConcurrentModificationException
            (Json_deserializers.concurrent_modification_exception_of_yojson tree path)
      | _, "InvalidArgumentException" ->
          `InvalidArgumentException
            (Json_deserializers.invalid_argument_exception_of_yojson tree path)
      | _, "ResourceInUseException" ->
          `ResourceInUseException (Json_deserializers.resource_in_use_exception_of_yojson tree path)
      | _, "ResourceNotFoundException" ->
          `ResourceNotFoundException
            (Json_deserializers.resource_not_found_exception_of_yojson tree path)
      | _, "TooManyTagsException" ->
          `TooManyTagsException (Json_deserializers.too_many_tags_exception_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : untag_resource_request) =
    let input = Json_serializers.untag_resource_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"KinesisAnalytics_20180523.UntagResource"
      ~service ~context ~input
      ~output_deserializer:Json_deserializers.untag_resource_response_of_yojson ~error_deserializer
end

module UpdateApplication = struct
  let error_to_string = function
    | `CodeValidationException _ -> "com.amazonaws.kinesisanalyticsv2#CodeValidationException"
    | `ConcurrentModificationException _ ->
        "com.amazonaws.kinesisanalyticsv2#ConcurrentModificationException"
    | `InvalidApplicationConfigurationException _ ->
        "com.amazonaws.kinesisanalyticsv2#InvalidApplicationConfigurationException"
    | `InvalidArgumentException _ -> "com.amazonaws.kinesisanalyticsv2#InvalidArgumentException"
    | `InvalidRequestException _ -> "com.amazonaws.kinesisanalyticsv2#InvalidRequestException"
    | `LimitExceededException _ -> "com.amazonaws.kinesisanalyticsv2#LimitExceededException"
    | `ResourceInUseException _ -> "com.amazonaws.kinesisanalyticsv2#ResourceInUseException"
    | `ResourceNotFoundException _ -> "com.amazonaws.kinesisanalyticsv2#ResourceNotFoundException"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "CodeValidationException" ->
          `CodeValidationException
            (Json_deserializers.code_validation_exception_of_yojson tree path)
      | _, "ConcurrentModificationException" ->
          `ConcurrentModificationException
            (Json_deserializers.concurrent_modification_exception_of_yojson tree path)
      | _, "InvalidApplicationConfigurationException" ->
          `InvalidApplicationConfigurationException
            (Json_deserializers.invalid_application_configuration_exception_of_yojson tree path)
      | _, "InvalidArgumentException" ->
          `InvalidArgumentException
            (Json_deserializers.invalid_argument_exception_of_yojson tree path)
      | _, "InvalidRequestException" ->
          `InvalidRequestException
            (Json_deserializers.invalid_request_exception_of_yojson tree path)
      | _, "LimitExceededException" ->
          `LimitExceededException (Json_deserializers.limit_exceeded_exception_of_yojson tree path)
      | _, "ResourceInUseException" ->
          `ResourceInUseException (Json_deserializers.resource_in_use_exception_of_yojson tree path)
      | _, "ResourceNotFoundException" ->
          `ResourceNotFoundException
            (Json_deserializers.resource_not_found_exception_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : update_application_request) =
    let input = Json_serializers.update_application_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"KinesisAnalytics_20180523.UpdateApplication"
      ~service ~context ~input
      ~output_deserializer:Json_deserializers.update_application_response_of_yojson
      ~error_deserializer
end

module UpdateApplicationMaintenanceConfiguration = struct
  let error_to_string = function
    | `ConcurrentModificationException _ ->
        "com.amazonaws.kinesisanalyticsv2#ConcurrentModificationException"
    | `InvalidArgumentException _ -> "com.amazonaws.kinesisanalyticsv2#InvalidArgumentException"
    | `ResourceInUseException _ -> "com.amazonaws.kinesisanalyticsv2#ResourceInUseException"
    | `ResourceNotFoundException _ -> "com.amazonaws.kinesisanalyticsv2#ResourceNotFoundException"
    | `UnsupportedOperationException _ ->
        "com.amazonaws.kinesisanalyticsv2#UnsupportedOperationException"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "ConcurrentModificationException" ->
          `ConcurrentModificationException
            (Json_deserializers.concurrent_modification_exception_of_yojson tree path)
      | _, "InvalidArgumentException" ->
          `InvalidArgumentException
            (Json_deserializers.invalid_argument_exception_of_yojson tree path)
      | _, "ResourceInUseException" ->
          `ResourceInUseException (Json_deserializers.resource_in_use_exception_of_yojson tree path)
      | _, "ResourceNotFoundException" ->
          `ResourceNotFoundException
            (Json_deserializers.resource_not_found_exception_of_yojson tree path)
      | _, "UnsupportedOperationException" ->
          `UnsupportedOperationException
            (Json_deserializers.unsupported_operation_exception_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : update_application_maintenance_configuration_request) =
    let input =
      Json_serializers.update_application_maintenance_configuration_request_to_yojson request
    in
    Smaws_Lib.Protocols.AwsJson.request
      ~shape_name:"KinesisAnalytics_20180523.UpdateApplicationMaintenanceConfiguration" ~service
      ~context ~input
      ~output_deserializer:
        Json_deserializers.update_application_maintenance_configuration_response_of_yojson
      ~error_deserializer
end
