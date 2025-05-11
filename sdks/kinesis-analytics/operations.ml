open Types
module AddApplicationCloudWatchLoggingOption =
  struct
    let error_deserializer tree path =
      let open Deserializers in
        let handler handler tree path =
          function
          | (_, "ConcurrentModificationException") ->
              `ConcurrentModificationException
                (concurrent_modification_exception_of_yojson tree path)
          | (_, "InvalidArgumentException") ->
              `InvalidArgumentException
                (invalid_argument_exception_of_yojson tree path)
          | (_, "ResourceInUseException") ->
              `ResourceInUseException
                (resource_in_use_exception_of_yojson tree path)
          | (_, "ResourceNotFoundException") ->
              `ResourceNotFoundException
                (resource_not_found_exception_of_yojson tree path)
          | (_, "UnsupportedOperationException") ->
              `UnsupportedOperationException
                (unsupported_operation_exception_of_yojson tree path)
          | _type -> handler tree path _type in
        Smaws_Lib.Protocols.AwsJson.(error_deserializer
                                       (handler
                                          Smaws_Lib.Protocols.AwsJson.Errors.default_handler)
                                       tree path)
    let request context
      (request : add_application_cloud_watch_logging_option_request) =
      let open Smaws_Lib.Context in
        let open Deserializers in
          let input =
            Serializers.add_application_cloud_watch_logging_option_request_to_yojson
              request in
          Smaws_Lib.Protocols.AwsJson.request
            ~shape_name:"KinesisAnalytics_20150814AddApplicationCloudWatchLoggingOption"
            ~service ~config:context.config ~http:context.http ~input
            ~output_deserializer:add_application_cloud_watch_logging_option_response_of_yojson
            ~error_deserializer
  end
module AddApplicationInput =
  struct
    let error_deserializer tree path =
      let open Deserializers in
        let handler handler tree path =
          function
          | (_, "CodeValidationException") ->
              `CodeValidationException
                (code_validation_exception_of_yojson tree path)
          | (_, "ConcurrentModificationException") ->
              `ConcurrentModificationException
                (concurrent_modification_exception_of_yojson tree path)
          | (_, "InvalidArgumentException") ->
              `InvalidArgumentException
                (invalid_argument_exception_of_yojson tree path)
          | (_, "ResourceInUseException") ->
              `ResourceInUseException
                (resource_in_use_exception_of_yojson tree path)
          | (_, "ResourceNotFoundException") ->
              `ResourceNotFoundException
                (resource_not_found_exception_of_yojson tree path)
          | (_, "UnsupportedOperationException") ->
              `UnsupportedOperationException
                (unsupported_operation_exception_of_yojson tree path)
          | _type -> handler tree path _type in
        Smaws_Lib.Protocols.AwsJson.(error_deserializer
                                       (handler
                                          Smaws_Lib.Protocols.AwsJson.Errors.default_handler)
                                       tree path)
    let request context (request : add_application_input_request) =
      let open Smaws_Lib.Context in
        let open Deserializers in
          let input =
            Serializers.add_application_input_request_to_yojson request in
          Smaws_Lib.Protocols.AwsJson.request
            ~shape_name:"KinesisAnalytics_20150814AddApplicationInput"
            ~service ~config:context.config ~http:context.http ~input
            ~output_deserializer:add_application_input_response_of_yojson
            ~error_deserializer
  end
module AddApplicationInputProcessingConfiguration =
  struct
    let error_deserializer tree path =
      let open Deserializers in
        let handler handler tree path =
          function
          | (_, "ConcurrentModificationException") ->
              `ConcurrentModificationException
                (concurrent_modification_exception_of_yojson tree path)
          | (_, "InvalidArgumentException") ->
              `InvalidArgumentException
                (invalid_argument_exception_of_yojson tree path)
          | (_, "ResourceInUseException") ->
              `ResourceInUseException
                (resource_in_use_exception_of_yojson tree path)
          | (_, "ResourceNotFoundException") ->
              `ResourceNotFoundException
                (resource_not_found_exception_of_yojson tree path)
          | (_, "UnsupportedOperationException") ->
              `UnsupportedOperationException
                (unsupported_operation_exception_of_yojson tree path)
          | _type -> handler tree path _type in
        Smaws_Lib.Protocols.AwsJson.(error_deserializer
                                       (handler
                                          Smaws_Lib.Protocols.AwsJson.Errors.default_handler)
                                       tree path)
    let request context
      (request : add_application_input_processing_configuration_request) =
      let open Smaws_Lib.Context in
        let open Deserializers in
          let input =
            Serializers.add_application_input_processing_configuration_request_to_yojson
              request in
          Smaws_Lib.Protocols.AwsJson.request
            ~shape_name:"KinesisAnalytics_20150814AddApplicationInputProcessingConfiguration"
            ~service ~config:context.config ~http:context.http ~input
            ~output_deserializer:add_application_input_processing_configuration_response_of_yojson
            ~error_deserializer
  end
module AddApplicationOutput =
  struct
    let error_deserializer tree path =
      let open Deserializers in
        let handler handler tree path =
          function
          | (_, "ConcurrentModificationException") ->
              `ConcurrentModificationException
                (concurrent_modification_exception_of_yojson tree path)
          | (_, "InvalidArgumentException") ->
              `InvalidArgumentException
                (invalid_argument_exception_of_yojson tree path)
          | (_, "ResourceInUseException") ->
              `ResourceInUseException
                (resource_in_use_exception_of_yojson tree path)
          | (_, "ResourceNotFoundException") ->
              `ResourceNotFoundException
                (resource_not_found_exception_of_yojson tree path)
          | (_, "UnsupportedOperationException") ->
              `UnsupportedOperationException
                (unsupported_operation_exception_of_yojson tree path)
          | _type -> handler tree path _type in
        Smaws_Lib.Protocols.AwsJson.(error_deserializer
                                       (handler
                                          Smaws_Lib.Protocols.AwsJson.Errors.default_handler)
                                       tree path)
    let request context (request : add_application_output_request) =
      let open Smaws_Lib.Context in
        let open Deserializers in
          let input =
            Serializers.add_application_output_request_to_yojson request in
          Smaws_Lib.Protocols.AwsJson.request
            ~shape_name:"KinesisAnalytics_20150814AddApplicationOutput"
            ~service ~config:context.config ~http:context.http ~input
            ~output_deserializer:add_application_output_response_of_yojson
            ~error_deserializer
  end
module AddApplicationReferenceDataSource =
  struct
    let error_deserializer tree path =
      let open Deserializers in
        let handler handler tree path =
          function
          | (_, "ConcurrentModificationException") ->
              `ConcurrentModificationException
                (concurrent_modification_exception_of_yojson tree path)
          | (_, "InvalidArgumentException") ->
              `InvalidArgumentException
                (invalid_argument_exception_of_yojson tree path)
          | (_, "ResourceInUseException") ->
              `ResourceInUseException
                (resource_in_use_exception_of_yojson tree path)
          | (_, "ResourceNotFoundException") ->
              `ResourceNotFoundException
                (resource_not_found_exception_of_yojson tree path)
          | (_, "UnsupportedOperationException") ->
              `UnsupportedOperationException
                (unsupported_operation_exception_of_yojson tree path)
          | _type -> handler tree path _type in
        Smaws_Lib.Protocols.AwsJson.(error_deserializer
                                       (handler
                                          Smaws_Lib.Protocols.AwsJson.Errors.default_handler)
                                       tree path)
    let request context
      (request : add_application_reference_data_source_request) =
      let open Smaws_Lib.Context in
        let open Deserializers in
          let input =
            Serializers.add_application_reference_data_source_request_to_yojson
              request in
          Smaws_Lib.Protocols.AwsJson.request
            ~shape_name:"KinesisAnalytics_20150814AddApplicationReferenceDataSource"
            ~service ~config:context.config ~http:context.http ~input
            ~output_deserializer:add_application_reference_data_source_response_of_yojson
            ~error_deserializer
  end
module CreateApplication =
  struct
    let error_deserializer tree path =
      let open Deserializers in
        let handler handler tree path =
          function
          | (_, "CodeValidationException") ->
              `CodeValidationException
                (code_validation_exception_of_yojson tree path)
          | (_, "ConcurrentModificationException") ->
              `ConcurrentModificationException
                (concurrent_modification_exception_of_yojson tree path)
          | (_, "InvalidArgumentException") ->
              `InvalidArgumentException
                (invalid_argument_exception_of_yojson tree path)
          | (_, "LimitExceededException") ->
              `LimitExceededException
                (limit_exceeded_exception_of_yojson tree path)
          | (_, "ResourceInUseException") ->
              `ResourceInUseException
                (resource_in_use_exception_of_yojson tree path)
          | (_, "TooManyTagsException") ->
              `TooManyTagsException
                (too_many_tags_exception_of_yojson tree path)
          | _type -> handler tree path _type in
        Smaws_Lib.Protocols.AwsJson.(error_deserializer
                                       (handler
                                          Smaws_Lib.Protocols.AwsJson.Errors.default_handler)
                                       tree path)
    let request context (request : create_application_request) =
      let open Smaws_Lib.Context in
        let open Deserializers in
          let input =
            Serializers.create_application_request_to_yojson request in
          Smaws_Lib.Protocols.AwsJson.request
            ~shape_name:"KinesisAnalytics_20150814CreateApplication" ~service
            ~config:context.config ~http:context.http ~input
            ~output_deserializer:create_application_response_of_yojson
            ~error_deserializer
  end
module DeleteApplication =
  struct
    let error_deserializer tree path =
      let open Deserializers in
        let handler handler tree path =
          function
          | (_, "ConcurrentModificationException") ->
              `ConcurrentModificationException
                (concurrent_modification_exception_of_yojson tree path)
          | (_, "ResourceInUseException") ->
              `ResourceInUseException
                (resource_in_use_exception_of_yojson tree path)
          | (_, "ResourceNotFoundException") ->
              `ResourceNotFoundException
                (resource_not_found_exception_of_yojson tree path)
          | (_, "UnsupportedOperationException") ->
              `UnsupportedOperationException
                (unsupported_operation_exception_of_yojson tree path)
          | _type -> handler tree path _type in
        Smaws_Lib.Protocols.AwsJson.(error_deserializer
                                       (handler
                                          Smaws_Lib.Protocols.AwsJson.Errors.default_handler)
                                       tree path)
    let request context (request : delete_application_request) =
      let open Smaws_Lib.Context in
        let open Deserializers in
          let input =
            Serializers.delete_application_request_to_yojson request in
          Smaws_Lib.Protocols.AwsJson.request
            ~shape_name:"KinesisAnalytics_20150814DeleteApplication" ~service
            ~config:context.config ~http:context.http ~input
            ~output_deserializer:delete_application_response_of_yojson
            ~error_deserializer
  end
module DeleteApplicationCloudWatchLoggingOption =
  struct
    let error_deserializer tree path =
      let open Deserializers in
        let handler handler tree path =
          function
          | (_, "ConcurrentModificationException") ->
              `ConcurrentModificationException
                (concurrent_modification_exception_of_yojson tree path)
          | (_, "InvalidArgumentException") ->
              `InvalidArgumentException
                (invalid_argument_exception_of_yojson tree path)
          | (_, "ResourceInUseException") ->
              `ResourceInUseException
                (resource_in_use_exception_of_yojson tree path)
          | (_, "ResourceNotFoundException") ->
              `ResourceNotFoundException
                (resource_not_found_exception_of_yojson tree path)
          | (_, "UnsupportedOperationException") ->
              `UnsupportedOperationException
                (unsupported_operation_exception_of_yojson tree path)
          | _type -> handler tree path _type in
        Smaws_Lib.Protocols.AwsJson.(error_deserializer
                                       (handler
                                          Smaws_Lib.Protocols.AwsJson.Errors.default_handler)
                                       tree path)
    let request context
      (request : delete_application_cloud_watch_logging_option_request) =
      let open Smaws_Lib.Context in
        let open Deserializers in
          let input =
            Serializers.delete_application_cloud_watch_logging_option_request_to_yojson
              request in
          Smaws_Lib.Protocols.AwsJson.request
            ~shape_name:"KinesisAnalytics_20150814DeleteApplicationCloudWatchLoggingOption"
            ~service ~config:context.config ~http:context.http ~input
            ~output_deserializer:delete_application_cloud_watch_logging_option_response_of_yojson
            ~error_deserializer
  end
module DeleteApplicationInputProcessingConfiguration =
  struct
    let error_deserializer tree path =
      let open Deserializers in
        let handler handler tree path =
          function
          | (_, "ConcurrentModificationException") ->
              `ConcurrentModificationException
                (concurrent_modification_exception_of_yojson tree path)
          | (_, "InvalidArgumentException") ->
              `InvalidArgumentException
                (invalid_argument_exception_of_yojson tree path)
          | (_, "ResourceInUseException") ->
              `ResourceInUseException
                (resource_in_use_exception_of_yojson tree path)
          | (_, "ResourceNotFoundException") ->
              `ResourceNotFoundException
                (resource_not_found_exception_of_yojson tree path)
          | (_, "UnsupportedOperationException") ->
              `UnsupportedOperationException
                (unsupported_operation_exception_of_yojson tree path)
          | _type -> handler tree path _type in
        Smaws_Lib.Protocols.AwsJson.(error_deserializer
                                       (handler
                                          Smaws_Lib.Protocols.AwsJson.Errors.default_handler)
                                       tree path)
    let request context
      (request : delete_application_input_processing_configuration_request) =
      let open Smaws_Lib.Context in
        let open Deserializers in
          let input =
            Serializers.delete_application_input_processing_configuration_request_to_yojson
              request in
          Smaws_Lib.Protocols.AwsJson.request
            ~shape_name:"KinesisAnalytics_20150814DeleteApplicationInputProcessingConfiguration"
            ~service ~config:context.config ~http:context.http ~input
            ~output_deserializer:delete_application_input_processing_configuration_response_of_yojson
            ~error_deserializer
  end
module DeleteApplicationOutput =
  struct
    let error_deserializer tree path =
      let open Deserializers in
        let handler handler tree path =
          function
          | (_, "ConcurrentModificationException") ->
              `ConcurrentModificationException
                (concurrent_modification_exception_of_yojson tree path)
          | (_, "InvalidArgumentException") ->
              `InvalidArgumentException
                (invalid_argument_exception_of_yojson tree path)
          | (_, "ResourceInUseException") ->
              `ResourceInUseException
                (resource_in_use_exception_of_yojson tree path)
          | (_, "ResourceNotFoundException") ->
              `ResourceNotFoundException
                (resource_not_found_exception_of_yojson tree path)
          | (_, "UnsupportedOperationException") ->
              `UnsupportedOperationException
                (unsupported_operation_exception_of_yojson tree path)
          | _type -> handler tree path _type in
        Smaws_Lib.Protocols.AwsJson.(error_deserializer
                                       (handler
                                          Smaws_Lib.Protocols.AwsJson.Errors.default_handler)
                                       tree path)
    let request context (request : delete_application_output_request) =
      let open Smaws_Lib.Context in
        let open Deserializers in
          let input =
            Serializers.delete_application_output_request_to_yojson request in
          Smaws_Lib.Protocols.AwsJson.request
            ~shape_name:"KinesisAnalytics_20150814DeleteApplicationOutput"
            ~service ~config:context.config ~http:context.http ~input
            ~output_deserializer:delete_application_output_response_of_yojson
            ~error_deserializer
  end
module DeleteApplicationReferenceDataSource =
  struct
    let error_deserializer tree path =
      let open Deserializers in
        let handler handler tree path =
          function
          | (_, "ConcurrentModificationException") ->
              `ConcurrentModificationException
                (concurrent_modification_exception_of_yojson tree path)
          | (_, "InvalidArgumentException") ->
              `InvalidArgumentException
                (invalid_argument_exception_of_yojson tree path)
          | (_, "ResourceInUseException") ->
              `ResourceInUseException
                (resource_in_use_exception_of_yojson tree path)
          | (_, "ResourceNotFoundException") ->
              `ResourceNotFoundException
                (resource_not_found_exception_of_yojson tree path)
          | (_, "UnsupportedOperationException") ->
              `UnsupportedOperationException
                (unsupported_operation_exception_of_yojson tree path)
          | _type -> handler tree path _type in
        Smaws_Lib.Protocols.AwsJson.(error_deserializer
                                       (handler
                                          Smaws_Lib.Protocols.AwsJson.Errors.default_handler)
                                       tree path)
    let request context
      (request : delete_application_reference_data_source_request) =
      let open Smaws_Lib.Context in
        let open Deserializers in
          let input =
            Serializers.delete_application_reference_data_source_request_to_yojson
              request in
          Smaws_Lib.Protocols.AwsJson.request
            ~shape_name:"KinesisAnalytics_20150814DeleteApplicationReferenceDataSource"
            ~service ~config:context.config ~http:context.http ~input
            ~output_deserializer:delete_application_reference_data_source_response_of_yojson
            ~error_deserializer
  end
module DescribeApplication =
  struct
    let error_deserializer tree path =
      let open Deserializers in
        let handler handler tree path =
          function
          | (_, "ResourceNotFoundException") ->
              `ResourceNotFoundException
                (resource_not_found_exception_of_yojson tree path)
          | (_, "UnsupportedOperationException") ->
              `UnsupportedOperationException
                (unsupported_operation_exception_of_yojson tree path)
          | _type -> handler tree path _type in
        Smaws_Lib.Protocols.AwsJson.(error_deserializer
                                       (handler
                                          Smaws_Lib.Protocols.AwsJson.Errors.default_handler)
                                       tree path)
    let request context (request : describe_application_request) =
      let open Smaws_Lib.Context in
        let open Deserializers in
          let input =
            Serializers.describe_application_request_to_yojson request in
          Smaws_Lib.Protocols.AwsJson.request
            ~shape_name:"KinesisAnalytics_20150814DescribeApplication"
            ~service ~config:context.config ~http:context.http ~input
            ~output_deserializer:describe_application_response_of_yojson
            ~error_deserializer
  end
module DiscoverInputSchema =
  struct
    let error_deserializer tree path =
      let open Deserializers in
        let handler handler tree path =
          function
          | (_, "InvalidArgumentException") ->
              `InvalidArgumentException
                (invalid_argument_exception_of_yojson tree path)
          | (_, "ResourceProvisionedThroughputExceededException") ->
              `ResourceProvisionedThroughputExceededException
                (resource_provisioned_throughput_exceeded_exception_of_yojson
                   tree path)
          | (_, "ServiceUnavailableException") ->
              `ServiceUnavailableException
                (service_unavailable_exception_of_yojson tree path)
          | (_, "UnableToDetectSchemaException") ->
              `UnableToDetectSchemaException
                (unable_to_detect_schema_exception_of_yojson tree path)
          | _type -> handler tree path _type in
        Smaws_Lib.Protocols.AwsJson.(error_deserializer
                                       (handler
                                          Smaws_Lib.Protocols.AwsJson.Errors.default_handler)
                                       tree path)
    let request context (request : discover_input_schema_request) =
      let open Smaws_Lib.Context in
        let open Deserializers in
          let input =
            Serializers.discover_input_schema_request_to_yojson request in
          Smaws_Lib.Protocols.AwsJson.request
            ~shape_name:"KinesisAnalytics_20150814DiscoverInputSchema"
            ~service ~config:context.config ~http:context.http ~input
            ~output_deserializer:discover_input_schema_response_of_yojson
            ~error_deserializer
  end
module ListApplications =
  struct
    let error_deserializer tree path =
      let handler a = a in
      Smaws_Lib.Protocols.AwsJson.(error_deserializer
                                     (handler
                                        Smaws_Lib.Protocols.AwsJson.Errors.default_handler)
                                     tree path)
    let request context (request : list_applications_request) =
      let open Smaws_Lib.Context in
        let open Deserializers in
          let input = Serializers.list_applications_request_to_yojson request in
          Smaws_Lib.Protocols.AwsJson.request
            ~shape_name:"KinesisAnalytics_20150814ListApplications" ~service
            ~config:context.config ~http:context.http ~input
            ~output_deserializer:list_applications_response_of_yojson
            ~error_deserializer
  end
module ListTagsForResource =
  struct
    let error_deserializer tree path =
      let open Deserializers in
        let handler handler tree path =
          function
          | (_, "ConcurrentModificationException") ->
              `ConcurrentModificationException
                (concurrent_modification_exception_of_yojson tree path)
          | (_, "InvalidArgumentException") ->
              `InvalidArgumentException
                (invalid_argument_exception_of_yojson tree path)
          | (_, "ResourceNotFoundException") ->
              `ResourceNotFoundException
                (resource_not_found_exception_of_yojson tree path)
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
            ~shape_name:"KinesisAnalytics_20150814ListTagsForResource"
            ~service ~config:context.config ~http:context.http ~input
            ~output_deserializer:list_tags_for_resource_response_of_yojson
            ~error_deserializer
  end
module StartApplication =
  struct
    let error_deserializer tree path =
      let open Deserializers in
        let handler handler tree path =
          function
          | (_, "InvalidApplicationConfigurationException") ->
              `InvalidApplicationConfigurationException
                (invalid_application_configuration_exception_of_yojson tree
                   path)
          | (_, "InvalidArgumentException") ->
              `InvalidArgumentException
                (invalid_argument_exception_of_yojson tree path)
          | (_, "ResourceInUseException") ->
              `ResourceInUseException
                (resource_in_use_exception_of_yojson tree path)
          | (_, "ResourceNotFoundException") ->
              `ResourceNotFoundException
                (resource_not_found_exception_of_yojson tree path)
          | (_, "UnsupportedOperationException") ->
              `UnsupportedOperationException
                (unsupported_operation_exception_of_yojson tree path)
          | _type -> handler tree path _type in
        Smaws_Lib.Protocols.AwsJson.(error_deserializer
                                       (handler
                                          Smaws_Lib.Protocols.AwsJson.Errors.default_handler)
                                       tree path)
    let request context (request : start_application_request) =
      let open Smaws_Lib.Context in
        let open Deserializers in
          let input = Serializers.start_application_request_to_yojson request in
          Smaws_Lib.Protocols.AwsJson.request
            ~shape_name:"KinesisAnalytics_20150814StartApplication" ~service
            ~config:context.config ~http:context.http ~input
            ~output_deserializer:start_application_response_of_yojson
            ~error_deserializer
  end
module StopApplication =
  struct
    let error_deserializer tree path =
      let open Deserializers in
        let handler handler tree path =
          function
          | (_, "ResourceInUseException") ->
              `ResourceInUseException
                (resource_in_use_exception_of_yojson tree path)
          | (_, "ResourceNotFoundException") ->
              `ResourceNotFoundException
                (resource_not_found_exception_of_yojson tree path)
          | (_, "UnsupportedOperationException") ->
              `UnsupportedOperationException
                (unsupported_operation_exception_of_yojson tree path)
          | _type -> handler tree path _type in
        Smaws_Lib.Protocols.AwsJson.(error_deserializer
                                       (handler
                                          Smaws_Lib.Protocols.AwsJson.Errors.default_handler)
                                       tree path)
    let request context (request : stop_application_request) =
      let open Smaws_Lib.Context in
        let open Deserializers in
          let input = Serializers.stop_application_request_to_yojson request in
          Smaws_Lib.Protocols.AwsJson.request
            ~shape_name:"KinesisAnalytics_20150814StopApplication" ~service
            ~config:context.config ~http:context.http ~input
            ~output_deserializer:stop_application_response_of_yojson
            ~error_deserializer
  end
module TagResource =
  struct
    let error_deserializer tree path =
      let open Deserializers in
        let handler handler tree path =
          function
          | (_, "ConcurrentModificationException") ->
              `ConcurrentModificationException
                (concurrent_modification_exception_of_yojson tree path)
          | (_, "InvalidArgumentException") ->
              `InvalidArgumentException
                (invalid_argument_exception_of_yojson tree path)
          | (_, "ResourceInUseException") ->
              `ResourceInUseException
                (resource_in_use_exception_of_yojson tree path)
          | (_, "ResourceNotFoundException") ->
              `ResourceNotFoundException
                (resource_not_found_exception_of_yojson tree path)
          | (_, "TooManyTagsException") ->
              `TooManyTagsException
                (too_many_tags_exception_of_yojson tree path)
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
            ~shape_name:"KinesisAnalytics_20150814TagResource" ~service
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
          | (_, "ConcurrentModificationException") ->
              `ConcurrentModificationException
                (concurrent_modification_exception_of_yojson tree path)
          | (_, "InvalidArgumentException") ->
              `InvalidArgumentException
                (invalid_argument_exception_of_yojson tree path)
          | (_, "ResourceInUseException") ->
              `ResourceInUseException
                (resource_in_use_exception_of_yojson tree path)
          | (_, "ResourceNotFoundException") ->
              `ResourceNotFoundException
                (resource_not_found_exception_of_yojson tree path)
          | (_, "TooManyTagsException") ->
              `TooManyTagsException
                (too_many_tags_exception_of_yojson tree path)
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
            ~shape_name:"KinesisAnalytics_20150814UntagResource" ~service
            ~config:context.config ~http:context.http ~input
            ~output_deserializer:untag_resource_response_of_yojson
            ~error_deserializer
  end
module UpdateApplication =
  struct
    let error_deserializer tree path =
      let open Deserializers in
        let handler handler tree path =
          function
          | (_, "CodeValidationException") ->
              `CodeValidationException
                (code_validation_exception_of_yojson tree path)
          | (_, "ConcurrentModificationException") ->
              `ConcurrentModificationException
                (concurrent_modification_exception_of_yojson tree path)
          | (_, "InvalidArgumentException") ->
              `InvalidArgumentException
                (invalid_argument_exception_of_yojson tree path)
          | (_, "ResourceInUseException") ->
              `ResourceInUseException
                (resource_in_use_exception_of_yojson tree path)
          | (_, "ResourceNotFoundException") ->
              `ResourceNotFoundException
                (resource_not_found_exception_of_yojson tree path)
          | (_, "UnsupportedOperationException") ->
              `UnsupportedOperationException
                (unsupported_operation_exception_of_yojson tree path)
          | _type -> handler tree path _type in
        Smaws_Lib.Protocols.AwsJson.(error_deserializer
                                       (handler
                                          Smaws_Lib.Protocols.AwsJson.Errors.default_handler)
                                       tree path)
    let request context (request : update_application_request) =
      let open Smaws_Lib.Context in
        let open Deserializers in
          let input =
            Serializers.update_application_request_to_yojson request in
          Smaws_Lib.Protocols.AwsJson.request
            ~shape_name:"KinesisAnalytics_20150814UpdateApplication" ~service
            ~config:context.config ~http:context.http ~input
            ~output_deserializer:update_application_response_of_yojson
            ~error_deserializer
  end