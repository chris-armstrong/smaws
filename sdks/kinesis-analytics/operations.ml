open Types
open Service_metadata

module AddApplicationCloudWatchLoggingOption = struct
  let error_to_string = function
    | `ConcurrentModificationException _ ->
        "com.amazonaws.kinesisanalytics#ConcurrentModificationException"
    | `InvalidArgumentException _ -> "com.amazonaws.kinesisanalytics#InvalidArgumentException"
    | `ResourceInUseException _ -> "com.amazonaws.kinesisanalytics#ResourceInUseException"
    | `ResourceNotFoundException _ -> "com.amazonaws.kinesisanalytics#ResourceNotFoundException"
    | `UnsupportedOperationException _ ->
        "com.amazonaws.kinesisanalytics#UnsupportedOperationException"
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

  let request context (request : add_application_cloud_watch_logging_option_request) =
    let input =
      Json_serializers.add_application_cloud_watch_logging_option_request_to_yojson request
    in
    Smaws_Lib.Protocols.AwsJson.request
      ~shape_name:"KinesisAnalytics_20150814.AddApplicationCloudWatchLoggingOption" ~service
      ~context ~input
      ~output_deserializer:
        Json_deserializers.add_application_cloud_watch_logging_option_response_of_yojson
      ~error_deserializer
end

module AddApplicationInput = struct
  let error_to_string = function
    | `CodeValidationException _ -> "com.amazonaws.kinesisanalytics#CodeValidationException"
    | `ConcurrentModificationException _ ->
        "com.amazonaws.kinesisanalytics#ConcurrentModificationException"
    | `InvalidArgumentException _ -> "com.amazonaws.kinesisanalytics#InvalidArgumentException"
    | `ResourceInUseException _ -> "com.amazonaws.kinesisanalytics#ResourceInUseException"
    | `ResourceNotFoundException _ -> "com.amazonaws.kinesisanalytics#ResourceNotFoundException"
    | `UnsupportedOperationException _ ->
        "com.amazonaws.kinesisanalytics#UnsupportedOperationException"
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

  let request context (request : add_application_input_request) =
    let input = Json_serializers.add_application_input_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"KinesisAnalytics_20150814.AddApplicationInput"
      ~service ~context ~input
      ~output_deserializer:Json_deserializers.add_application_input_response_of_yojson
      ~error_deserializer
end

module AddApplicationInputProcessingConfiguration = struct
  let error_to_string = function
    | `ConcurrentModificationException _ ->
        "com.amazonaws.kinesisanalytics#ConcurrentModificationException"
    | `InvalidArgumentException _ -> "com.amazonaws.kinesisanalytics#InvalidArgumentException"
    | `ResourceInUseException _ -> "com.amazonaws.kinesisanalytics#ResourceInUseException"
    | `ResourceNotFoundException _ -> "com.amazonaws.kinesisanalytics#ResourceNotFoundException"
    | `UnsupportedOperationException _ ->
        "com.amazonaws.kinesisanalytics#UnsupportedOperationException"
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

  let request context (request : add_application_input_processing_configuration_request) =
    let input =
      Json_serializers.add_application_input_processing_configuration_request_to_yojson request
    in
    Smaws_Lib.Protocols.AwsJson.request
      ~shape_name:"KinesisAnalytics_20150814.AddApplicationInputProcessingConfiguration" ~service
      ~context ~input
      ~output_deserializer:
        Json_deserializers.add_application_input_processing_configuration_response_of_yojson
      ~error_deserializer
end

module AddApplicationOutput = struct
  let error_to_string = function
    | `ConcurrentModificationException _ ->
        "com.amazonaws.kinesisanalytics#ConcurrentModificationException"
    | `InvalidArgumentException _ -> "com.amazonaws.kinesisanalytics#InvalidArgumentException"
    | `ResourceInUseException _ -> "com.amazonaws.kinesisanalytics#ResourceInUseException"
    | `ResourceNotFoundException _ -> "com.amazonaws.kinesisanalytics#ResourceNotFoundException"
    | `UnsupportedOperationException _ ->
        "com.amazonaws.kinesisanalytics#UnsupportedOperationException"
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

  let request context (request : add_application_output_request) =
    let input = Json_serializers.add_application_output_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"KinesisAnalytics_20150814.AddApplicationOutput"
      ~service ~context ~input
      ~output_deserializer:Json_deserializers.add_application_output_response_of_yojson
      ~error_deserializer
end

module AddApplicationReferenceDataSource = struct
  let error_to_string = function
    | `ConcurrentModificationException _ ->
        "com.amazonaws.kinesisanalytics#ConcurrentModificationException"
    | `InvalidArgumentException _ -> "com.amazonaws.kinesisanalytics#InvalidArgumentException"
    | `ResourceInUseException _ -> "com.amazonaws.kinesisanalytics#ResourceInUseException"
    | `ResourceNotFoundException _ -> "com.amazonaws.kinesisanalytics#ResourceNotFoundException"
    | `UnsupportedOperationException _ ->
        "com.amazonaws.kinesisanalytics#UnsupportedOperationException"
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

  let request context (request : add_application_reference_data_source_request) =
    let input = Json_serializers.add_application_reference_data_source_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request
      ~shape_name:"KinesisAnalytics_20150814.AddApplicationReferenceDataSource" ~service ~context
      ~input
      ~output_deserializer:
        Json_deserializers.add_application_reference_data_source_response_of_yojson
      ~error_deserializer
end

module CreateApplication = struct
  let error_to_string = function
    | `CodeValidationException _ -> "com.amazonaws.kinesisanalytics#CodeValidationException"
    | `ConcurrentModificationException _ ->
        "com.amazonaws.kinesisanalytics#ConcurrentModificationException"
    | `InvalidArgumentException _ -> "com.amazonaws.kinesisanalytics#InvalidArgumentException"
    | `LimitExceededException _ -> "com.amazonaws.kinesisanalytics#LimitExceededException"
    | `ResourceInUseException _ -> "com.amazonaws.kinesisanalytics#ResourceInUseException"
    | `TooManyTagsException _ -> "com.amazonaws.kinesisanalytics#TooManyTagsException"
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
      | _, "LimitExceededException" ->
          `LimitExceededException (Json_deserializers.limit_exceeded_exception_of_yojson tree path)
      | _, "ResourceInUseException" ->
          `ResourceInUseException (Json_deserializers.resource_in_use_exception_of_yojson tree path)
      | _, "TooManyTagsException" ->
          `TooManyTagsException (Json_deserializers.too_many_tags_exception_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : create_application_request) =
    let input = Json_serializers.create_application_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"KinesisAnalytics_20150814.CreateApplication"
      ~service ~context ~input
      ~output_deserializer:Json_deserializers.create_application_response_of_yojson
      ~error_deserializer
end

module DeleteApplication = struct
  let error_to_string = function
    | `ConcurrentModificationException _ ->
        "com.amazonaws.kinesisanalytics#ConcurrentModificationException"
    | `ResourceInUseException _ -> "com.amazonaws.kinesisanalytics#ResourceInUseException"
    | `ResourceNotFoundException _ -> "com.amazonaws.kinesisanalytics#ResourceNotFoundException"
    | `UnsupportedOperationException _ ->
        "com.amazonaws.kinesisanalytics#UnsupportedOperationException"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "ConcurrentModificationException" ->
          `ConcurrentModificationException
            (Json_deserializers.concurrent_modification_exception_of_yojson tree path)
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

  let request context (request : delete_application_request) =
    let input = Json_serializers.delete_application_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"KinesisAnalytics_20150814.DeleteApplication"
      ~service ~context ~input
      ~output_deserializer:Json_deserializers.delete_application_response_of_yojson
      ~error_deserializer
end

module DeleteApplicationCloudWatchLoggingOption = struct
  let error_to_string = function
    | `ConcurrentModificationException _ ->
        "com.amazonaws.kinesisanalytics#ConcurrentModificationException"
    | `InvalidArgumentException _ -> "com.amazonaws.kinesisanalytics#InvalidArgumentException"
    | `ResourceInUseException _ -> "com.amazonaws.kinesisanalytics#ResourceInUseException"
    | `ResourceNotFoundException _ -> "com.amazonaws.kinesisanalytics#ResourceNotFoundException"
    | `UnsupportedOperationException _ ->
        "com.amazonaws.kinesisanalytics#UnsupportedOperationException"
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

  let request context (request : delete_application_cloud_watch_logging_option_request) =
    let input =
      Json_serializers.delete_application_cloud_watch_logging_option_request_to_yojson request
    in
    Smaws_Lib.Protocols.AwsJson.request
      ~shape_name:"KinesisAnalytics_20150814.DeleteApplicationCloudWatchLoggingOption" ~service
      ~context ~input
      ~output_deserializer:
        Json_deserializers.delete_application_cloud_watch_logging_option_response_of_yojson
      ~error_deserializer
end

module DeleteApplicationInputProcessingConfiguration = struct
  let error_to_string = function
    | `ConcurrentModificationException _ ->
        "com.amazonaws.kinesisanalytics#ConcurrentModificationException"
    | `InvalidArgumentException _ -> "com.amazonaws.kinesisanalytics#InvalidArgumentException"
    | `ResourceInUseException _ -> "com.amazonaws.kinesisanalytics#ResourceInUseException"
    | `ResourceNotFoundException _ -> "com.amazonaws.kinesisanalytics#ResourceNotFoundException"
    | `UnsupportedOperationException _ ->
        "com.amazonaws.kinesisanalytics#UnsupportedOperationException"
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

  let request context (request : delete_application_input_processing_configuration_request) =
    let input =
      Json_serializers.delete_application_input_processing_configuration_request_to_yojson request
    in
    Smaws_Lib.Protocols.AwsJson.request
      ~shape_name:"KinesisAnalytics_20150814.DeleteApplicationInputProcessingConfiguration" ~service
      ~context ~input
      ~output_deserializer:
        Json_deserializers.delete_application_input_processing_configuration_response_of_yojson
      ~error_deserializer
end

module DeleteApplicationOutput = struct
  let error_to_string = function
    | `ConcurrentModificationException _ ->
        "com.amazonaws.kinesisanalytics#ConcurrentModificationException"
    | `InvalidArgumentException _ -> "com.amazonaws.kinesisanalytics#InvalidArgumentException"
    | `ResourceInUseException _ -> "com.amazonaws.kinesisanalytics#ResourceInUseException"
    | `ResourceNotFoundException _ -> "com.amazonaws.kinesisanalytics#ResourceNotFoundException"
    | `UnsupportedOperationException _ ->
        "com.amazonaws.kinesisanalytics#UnsupportedOperationException"
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

  let request context (request : delete_application_output_request) =
    let input = Json_serializers.delete_application_output_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request
      ~shape_name:"KinesisAnalytics_20150814.DeleteApplicationOutput" ~service ~context ~input
      ~output_deserializer:Json_deserializers.delete_application_output_response_of_yojson
      ~error_deserializer
end

module DeleteApplicationReferenceDataSource = struct
  let error_to_string = function
    | `ConcurrentModificationException _ ->
        "com.amazonaws.kinesisanalytics#ConcurrentModificationException"
    | `InvalidArgumentException _ -> "com.amazonaws.kinesisanalytics#InvalidArgumentException"
    | `ResourceInUseException _ -> "com.amazonaws.kinesisanalytics#ResourceInUseException"
    | `ResourceNotFoundException _ -> "com.amazonaws.kinesisanalytics#ResourceNotFoundException"
    | `UnsupportedOperationException _ ->
        "com.amazonaws.kinesisanalytics#UnsupportedOperationException"
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

  let request context (request : delete_application_reference_data_source_request) =
    let input =
      Json_serializers.delete_application_reference_data_source_request_to_yojson request
    in
    Smaws_Lib.Protocols.AwsJson.request
      ~shape_name:"KinesisAnalytics_20150814.DeleteApplicationReferenceDataSource" ~service ~context
      ~input
      ~output_deserializer:
        Json_deserializers.delete_application_reference_data_source_response_of_yojson
      ~error_deserializer
end

module DescribeApplication = struct
  let error_to_string = function
    | `ResourceNotFoundException _ -> "com.amazonaws.kinesisanalytics#ResourceNotFoundException"
    | `UnsupportedOperationException _ ->
        "com.amazonaws.kinesisanalytics#UnsupportedOperationException"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
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

  let request context (request : describe_application_request) =
    let input = Json_serializers.describe_application_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"KinesisAnalytics_20150814.DescribeApplication"
      ~service ~context ~input
      ~output_deserializer:Json_deserializers.describe_application_response_of_yojson
      ~error_deserializer
end

module DiscoverInputSchema = struct
  let error_to_string = function
    | `InvalidArgumentException _ -> "com.amazonaws.kinesisanalytics#InvalidArgumentException"
    | `ResourceProvisionedThroughputExceededException _ ->
        "com.amazonaws.kinesisanalytics#ResourceProvisionedThroughputExceededException"
    | `ServiceUnavailableException _ -> "com.amazonaws.kinesisanalytics#ServiceUnavailableException"
    | `UnableToDetectSchemaException _ ->
        "com.amazonaws.kinesisanalytics#UnableToDetectSchemaException"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "InvalidArgumentException" ->
          `InvalidArgumentException
            (Json_deserializers.invalid_argument_exception_of_yojson tree path)
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
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : discover_input_schema_request) =
    let input = Json_serializers.discover_input_schema_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"KinesisAnalytics_20150814.DiscoverInputSchema"
      ~service ~context ~input
      ~output_deserializer:Json_deserializers.discover_input_schema_response_of_yojson
      ~error_deserializer
end

module ListApplications = struct
  let error_to_string = Smaws_Lib.Protocols.AwsJson.error_to_string

  let error_deserializer tree path =
    let handler a = a in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : list_applications_request) =
    let input = Json_serializers.list_applications_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"KinesisAnalytics_20150814.ListApplications"
      ~service ~context ~input
      ~output_deserializer:Json_deserializers.list_applications_response_of_yojson
      ~error_deserializer
end

module ListTagsForResource = struct
  let error_to_string = function
    | `ConcurrentModificationException _ ->
        "com.amazonaws.kinesisanalytics#ConcurrentModificationException"
    | `InvalidArgumentException _ -> "com.amazonaws.kinesisanalytics#InvalidArgumentException"
    | `ResourceNotFoundException _ -> "com.amazonaws.kinesisanalytics#ResourceNotFoundException"
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
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"KinesisAnalytics_20150814.ListTagsForResource"
      ~service ~context ~input
      ~output_deserializer:Json_deserializers.list_tags_for_resource_response_of_yojson
      ~error_deserializer
end

module StartApplication = struct
  let error_to_string = function
    | `InvalidApplicationConfigurationException _ ->
        "com.amazonaws.kinesisanalytics#InvalidApplicationConfigurationException"
    | `InvalidArgumentException _ -> "com.amazonaws.kinesisanalytics#InvalidArgumentException"
    | `ResourceInUseException _ -> "com.amazonaws.kinesisanalytics#ResourceInUseException"
    | `ResourceNotFoundException _ -> "com.amazonaws.kinesisanalytics#ResourceNotFoundException"
    | `UnsupportedOperationException _ ->
        "com.amazonaws.kinesisanalytics#UnsupportedOperationException"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
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
      | _, "UnsupportedOperationException" ->
          `UnsupportedOperationException
            (Json_deserializers.unsupported_operation_exception_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : start_application_request) =
    let input = Json_serializers.start_application_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"KinesisAnalytics_20150814.StartApplication"
      ~service ~context ~input
      ~output_deserializer:Json_deserializers.start_application_response_of_yojson
      ~error_deserializer
end

module StopApplication = struct
  let error_to_string = function
    | `ResourceInUseException _ -> "com.amazonaws.kinesisanalytics#ResourceInUseException"
    | `ResourceNotFoundException _ -> "com.amazonaws.kinesisanalytics#ResourceNotFoundException"
    | `UnsupportedOperationException _ ->
        "com.amazonaws.kinesisanalytics#UnsupportedOperationException"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
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

  let request context (request : stop_application_request) =
    let input = Json_serializers.stop_application_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"KinesisAnalytics_20150814.StopApplication"
      ~service ~context ~input
      ~output_deserializer:Json_deserializers.stop_application_response_of_yojson
      ~error_deserializer
end

module TagResource = struct
  let error_to_string = function
    | `ConcurrentModificationException _ ->
        "com.amazonaws.kinesisanalytics#ConcurrentModificationException"
    | `InvalidArgumentException _ -> "com.amazonaws.kinesisanalytics#InvalidArgumentException"
    | `ResourceInUseException _ -> "com.amazonaws.kinesisanalytics#ResourceInUseException"
    | `ResourceNotFoundException _ -> "com.amazonaws.kinesisanalytics#ResourceNotFoundException"
    | `TooManyTagsException _ -> "com.amazonaws.kinesisanalytics#TooManyTagsException"
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
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"KinesisAnalytics_20150814.TagResource" ~service
      ~context ~input ~output_deserializer:Json_deserializers.tag_resource_response_of_yojson
      ~error_deserializer
end

module UntagResource = struct
  let error_to_string = function
    | `ConcurrentModificationException _ ->
        "com.amazonaws.kinesisanalytics#ConcurrentModificationException"
    | `InvalidArgumentException _ -> "com.amazonaws.kinesisanalytics#InvalidArgumentException"
    | `ResourceInUseException _ -> "com.amazonaws.kinesisanalytics#ResourceInUseException"
    | `ResourceNotFoundException _ -> "com.amazonaws.kinesisanalytics#ResourceNotFoundException"
    | `TooManyTagsException _ -> "com.amazonaws.kinesisanalytics#TooManyTagsException"
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
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"KinesisAnalytics_20150814.UntagResource"
      ~service ~context ~input
      ~output_deserializer:Json_deserializers.untag_resource_response_of_yojson ~error_deserializer
end

module UpdateApplication = struct
  let error_to_string = function
    | `CodeValidationException _ -> "com.amazonaws.kinesisanalytics#CodeValidationException"
    | `ConcurrentModificationException _ ->
        "com.amazonaws.kinesisanalytics#ConcurrentModificationException"
    | `InvalidArgumentException _ -> "com.amazonaws.kinesisanalytics#InvalidArgumentException"
    | `ResourceInUseException _ -> "com.amazonaws.kinesisanalytics#ResourceInUseException"
    | `ResourceNotFoundException _ -> "com.amazonaws.kinesisanalytics#ResourceNotFoundException"
    | `UnsupportedOperationException _ ->
        "com.amazonaws.kinesisanalytics#UnsupportedOperationException"
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

  let request context (request : update_application_request) =
    let input = Json_serializers.update_application_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"KinesisAnalytics_20150814.UpdateApplication"
      ~service ~context ~input
      ~output_deserializer:Json_deserializers.update_application_response_of_yojson
      ~error_deserializer
end
