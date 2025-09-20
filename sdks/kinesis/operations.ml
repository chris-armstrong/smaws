open Types
open Service_metadata

module AddTagsToStream = struct
  let error_to_string = function
    | `AccessDeniedException _ -> "com.amazonaws.kinesis#AccessDeniedException"
    | `InvalidArgumentException _ -> "com.amazonaws.kinesis#InvalidArgumentException"
    | `LimitExceededException _ -> "com.amazonaws.kinesis#LimitExceededException"
    | `ResourceInUseException _ -> "com.amazonaws.kinesis#ResourceInUseException"
    | `ResourceNotFoundException _ -> "com.amazonaws.kinesis#ResourceNotFoundException"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "AccessDeniedException" ->
          `AccessDeniedException (Json_deserializers.access_denied_exception_of_yojson tree path)
      | _, "InvalidArgumentException" ->
          `InvalidArgumentException
            (Json_deserializers.invalid_argument_exception_of_yojson tree path)
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

  let request context (request : add_tags_to_stream_input) =
    let input = Json_serializers.add_tags_to_stream_input_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"Kinesis_20131202.AddTagsToStream" ~service
      ~context ~input ~output_deserializer:Smaws_Lib.Smithy_api.Json_deserializers.unit__of_yojson
      ~error_deserializer
end

module CreateStream = struct
  let error_to_string = function
    | `InvalidArgumentException _ -> "com.amazonaws.kinesis#InvalidArgumentException"
    | `LimitExceededException _ -> "com.amazonaws.kinesis#LimitExceededException"
    | `ResourceInUseException _ -> "com.amazonaws.kinesis#ResourceInUseException"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "InvalidArgumentException" ->
          `InvalidArgumentException
            (Json_deserializers.invalid_argument_exception_of_yojson tree path)
      | _, "LimitExceededException" ->
          `LimitExceededException (Json_deserializers.limit_exceeded_exception_of_yojson tree path)
      | _, "ResourceInUseException" ->
          `ResourceInUseException (Json_deserializers.resource_in_use_exception_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : create_stream_input) =
    let input = Json_serializers.create_stream_input_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"Kinesis_20131202.CreateStream" ~service
      ~context ~input ~output_deserializer:Smaws_Lib.Smithy_api.Json_deserializers.unit__of_yojson
      ~error_deserializer
end

module DecreaseStreamRetentionPeriod = struct
  let error_to_string = function
    | `AccessDeniedException _ -> "com.amazonaws.kinesis#AccessDeniedException"
    | `InvalidArgumentException _ -> "com.amazonaws.kinesis#InvalidArgumentException"
    | `LimitExceededException _ -> "com.amazonaws.kinesis#LimitExceededException"
    | `ResourceInUseException _ -> "com.amazonaws.kinesis#ResourceInUseException"
    | `ResourceNotFoundException _ -> "com.amazonaws.kinesis#ResourceNotFoundException"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "AccessDeniedException" ->
          `AccessDeniedException (Json_deserializers.access_denied_exception_of_yojson tree path)
      | _, "InvalidArgumentException" ->
          `InvalidArgumentException
            (Json_deserializers.invalid_argument_exception_of_yojson tree path)
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

  let request context (request : decrease_stream_retention_period_input) =
    let input = Json_serializers.decrease_stream_retention_period_input_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"Kinesis_20131202.DecreaseStreamRetentionPeriod"
      ~service ~context ~input
      ~output_deserializer:Smaws_Lib.Smithy_api.Json_deserializers.unit__of_yojson
      ~error_deserializer
end

module DeleteResourcePolicy = struct
  let error_to_string = function
    | `AccessDeniedException _ -> "com.amazonaws.kinesis#AccessDeniedException"
    | `InvalidArgumentException _ -> "com.amazonaws.kinesis#InvalidArgumentException"
    | `LimitExceededException _ -> "com.amazonaws.kinesis#LimitExceededException"
    | `ResourceInUseException _ -> "com.amazonaws.kinesis#ResourceInUseException"
    | `ResourceNotFoundException _ -> "com.amazonaws.kinesis#ResourceNotFoundException"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "AccessDeniedException" ->
          `AccessDeniedException (Json_deserializers.access_denied_exception_of_yojson tree path)
      | _, "InvalidArgumentException" ->
          `InvalidArgumentException
            (Json_deserializers.invalid_argument_exception_of_yojson tree path)
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

  let request context (request : delete_resource_policy_input) =
    let input = Json_serializers.delete_resource_policy_input_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"Kinesis_20131202.DeleteResourcePolicy" ~service
      ~context ~input ~output_deserializer:Smaws_Lib.Smithy_api.Json_deserializers.unit__of_yojson
      ~error_deserializer
end

module DeleteStream = struct
  let error_to_string = function
    | `AccessDeniedException _ -> "com.amazonaws.kinesis#AccessDeniedException"
    | `InvalidArgumentException _ -> "com.amazonaws.kinesis#InvalidArgumentException"
    | `LimitExceededException _ -> "com.amazonaws.kinesis#LimitExceededException"
    | `ResourceInUseException _ -> "com.amazonaws.kinesis#ResourceInUseException"
    | `ResourceNotFoundException _ -> "com.amazonaws.kinesis#ResourceNotFoundException"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "AccessDeniedException" ->
          `AccessDeniedException (Json_deserializers.access_denied_exception_of_yojson tree path)
      | _, "InvalidArgumentException" ->
          `InvalidArgumentException
            (Json_deserializers.invalid_argument_exception_of_yojson tree path)
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

  let request context (request : delete_stream_input) =
    let input = Json_serializers.delete_stream_input_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"Kinesis_20131202.DeleteStream" ~service
      ~context ~input ~output_deserializer:Smaws_Lib.Smithy_api.Json_deserializers.unit__of_yojson
      ~error_deserializer
end

module DeregisterStreamConsumer = struct
  let error_to_string = function
    | `InvalidArgumentException _ -> "com.amazonaws.kinesis#InvalidArgumentException"
    | `LimitExceededException _ -> "com.amazonaws.kinesis#LimitExceededException"
    | `ResourceNotFoundException _ -> "com.amazonaws.kinesis#ResourceNotFoundException"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "InvalidArgumentException" ->
          `InvalidArgumentException
            (Json_deserializers.invalid_argument_exception_of_yojson tree path)
      | _, "LimitExceededException" ->
          `LimitExceededException (Json_deserializers.limit_exceeded_exception_of_yojson tree path)
      | _, "ResourceNotFoundException" ->
          `ResourceNotFoundException
            (Json_deserializers.resource_not_found_exception_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : deregister_stream_consumer_input) =
    let input = Json_serializers.deregister_stream_consumer_input_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"Kinesis_20131202.DeregisterStreamConsumer"
      ~service ~context ~input
      ~output_deserializer:Smaws_Lib.Smithy_api.Json_deserializers.unit__of_yojson
      ~error_deserializer
end

module DescribeLimits = struct
  let error_to_string = function
    | `LimitExceededException _ -> "com.amazonaws.kinesis#LimitExceededException"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "LimitExceededException" ->
          `LimitExceededException (Json_deserializers.limit_exceeded_exception_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : describe_limits_input) =
    let input = Json_serializers.describe_limits_input_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"Kinesis_20131202.DescribeLimits" ~service
      ~context ~input ~output_deserializer:Json_deserializers.describe_limits_output_of_yojson
      ~error_deserializer
end

module DescribeStream = struct
  let error_to_string = function
    | `AccessDeniedException _ -> "com.amazonaws.kinesis#AccessDeniedException"
    | `InvalidArgumentException _ -> "com.amazonaws.kinesis#InvalidArgumentException"
    | `LimitExceededException _ -> "com.amazonaws.kinesis#LimitExceededException"
    | `ResourceNotFoundException _ -> "com.amazonaws.kinesis#ResourceNotFoundException"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "AccessDeniedException" ->
          `AccessDeniedException (Json_deserializers.access_denied_exception_of_yojson tree path)
      | _, "InvalidArgumentException" ->
          `InvalidArgumentException
            (Json_deserializers.invalid_argument_exception_of_yojson tree path)
      | _, "LimitExceededException" ->
          `LimitExceededException (Json_deserializers.limit_exceeded_exception_of_yojson tree path)
      | _, "ResourceNotFoundException" ->
          `ResourceNotFoundException
            (Json_deserializers.resource_not_found_exception_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : describe_stream_input) =
    let input = Json_serializers.describe_stream_input_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"Kinesis_20131202.DescribeStream" ~service
      ~context ~input ~output_deserializer:Json_deserializers.describe_stream_output_of_yojson
      ~error_deserializer
end

module DescribeStreamConsumer = struct
  let error_to_string = function
    | `InvalidArgumentException _ -> "com.amazonaws.kinesis#InvalidArgumentException"
    | `LimitExceededException _ -> "com.amazonaws.kinesis#LimitExceededException"
    | `ResourceNotFoundException _ -> "com.amazonaws.kinesis#ResourceNotFoundException"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "InvalidArgumentException" ->
          `InvalidArgumentException
            (Json_deserializers.invalid_argument_exception_of_yojson tree path)
      | _, "LimitExceededException" ->
          `LimitExceededException (Json_deserializers.limit_exceeded_exception_of_yojson tree path)
      | _, "ResourceNotFoundException" ->
          `ResourceNotFoundException
            (Json_deserializers.resource_not_found_exception_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : describe_stream_consumer_input) =
    let input = Json_serializers.describe_stream_consumer_input_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"Kinesis_20131202.DescribeStreamConsumer"
      ~service ~context ~input
      ~output_deserializer:Json_deserializers.describe_stream_consumer_output_of_yojson
      ~error_deserializer
end

module DescribeStreamSummary = struct
  let error_to_string = function
    | `AccessDeniedException _ -> "com.amazonaws.kinesis#AccessDeniedException"
    | `InvalidArgumentException _ -> "com.amazonaws.kinesis#InvalidArgumentException"
    | `LimitExceededException _ -> "com.amazonaws.kinesis#LimitExceededException"
    | `ResourceNotFoundException _ -> "com.amazonaws.kinesis#ResourceNotFoundException"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "AccessDeniedException" ->
          `AccessDeniedException (Json_deserializers.access_denied_exception_of_yojson tree path)
      | _, "InvalidArgumentException" ->
          `InvalidArgumentException
            (Json_deserializers.invalid_argument_exception_of_yojson tree path)
      | _, "LimitExceededException" ->
          `LimitExceededException (Json_deserializers.limit_exceeded_exception_of_yojson tree path)
      | _, "ResourceNotFoundException" ->
          `ResourceNotFoundException
            (Json_deserializers.resource_not_found_exception_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : describe_stream_summary_input) =
    let input = Json_serializers.describe_stream_summary_input_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"Kinesis_20131202.DescribeStreamSummary"
      ~service ~context ~input
      ~output_deserializer:Json_deserializers.describe_stream_summary_output_of_yojson
      ~error_deserializer
end

module DisableEnhancedMonitoring = struct
  let error_to_string = function
    | `AccessDeniedException _ -> "com.amazonaws.kinesis#AccessDeniedException"
    | `InvalidArgumentException _ -> "com.amazonaws.kinesis#InvalidArgumentException"
    | `LimitExceededException _ -> "com.amazonaws.kinesis#LimitExceededException"
    | `ResourceInUseException _ -> "com.amazonaws.kinesis#ResourceInUseException"
    | `ResourceNotFoundException _ -> "com.amazonaws.kinesis#ResourceNotFoundException"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "AccessDeniedException" ->
          `AccessDeniedException (Json_deserializers.access_denied_exception_of_yojson tree path)
      | _, "InvalidArgumentException" ->
          `InvalidArgumentException
            (Json_deserializers.invalid_argument_exception_of_yojson tree path)
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

  let request context (request : disable_enhanced_monitoring_input) =
    let input = Json_serializers.disable_enhanced_monitoring_input_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"Kinesis_20131202.DisableEnhancedMonitoring"
      ~service ~context ~input
      ~output_deserializer:Json_deserializers.enhanced_monitoring_output_of_yojson
      ~error_deserializer
end

module EnableEnhancedMonitoring = struct
  let error_to_string = function
    | `AccessDeniedException _ -> "com.amazonaws.kinesis#AccessDeniedException"
    | `InvalidArgumentException _ -> "com.amazonaws.kinesis#InvalidArgumentException"
    | `LimitExceededException _ -> "com.amazonaws.kinesis#LimitExceededException"
    | `ResourceInUseException _ -> "com.amazonaws.kinesis#ResourceInUseException"
    | `ResourceNotFoundException _ -> "com.amazonaws.kinesis#ResourceNotFoundException"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "AccessDeniedException" ->
          `AccessDeniedException (Json_deserializers.access_denied_exception_of_yojson tree path)
      | _, "InvalidArgumentException" ->
          `InvalidArgumentException
            (Json_deserializers.invalid_argument_exception_of_yojson tree path)
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

  let request context (request : enable_enhanced_monitoring_input) =
    let input = Json_serializers.enable_enhanced_monitoring_input_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"Kinesis_20131202.EnableEnhancedMonitoring"
      ~service ~context ~input
      ~output_deserializer:Json_deserializers.enhanced_monitoring_output_of_yojson
      ~error_deserializer
end

module GetRecords = struct
  let error_to_string = function
    | `AccessDeniedException _ -> "com.amazonaws.kinesis#AccessDeniedException"
    | `ExpiredIteratorException _ -> "com.amazonaws.kinesis#ExpiredIteratorException"
    | `InternalFailureException _ -> "com.amazonaws.kinesis#InternalFailureException"
    | `InvalidArgumentException _ -> "com.amazonaws.kinesis#InvalidArgumentException"
    | `KMSAccessDeniedException _ -> "com.amazonaws.kinesis#KMSAccessDeniedException"
    | `KMSDisabledException _ -> "com.amazonaws.kinesis#KMSDisabledException"
    | `KMSInvalidStateException _ -> "com.amazonaws.kinesis#KMSInvalidStateException"
    | `KMSNotFoundException _ -> "com.amazonaws.kinesis#KMSNotFoundException"
    | `KMSOptInRequired _ -> "com.amazonaws.kinesis#KMSOptInRequired"
    | `KMSThrottlingException _ -> "com.amazonaws.kinesis#KMSThrottlingException"
    | `ProvisionedThroughputExceededException _ ->
        "com.amazonaws.kinesis#ProvisionedThroughputExceededException"
    | `ResourceNotFoundException _ -> "com.amazonaws.kinesis#ResourceNotFoundException"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "AccessDeniedException" ->
          `AccessDeniedException (Json_deserializers.access_denied_exception_of_yojson tree path)
      | _, "ExpiredIteratorException" ->
          `ExpiredIteratorException
            (Json_deserializers.expired_iterator_exception_of_yojson tree path)
      | _, "InternalFailureException" ->
          `InternalFailureException
            (Json_deserializers.internal_failure_exception_of_yojson tree path)
      | _, "InvalidArgumentException" ->
          `InvalidArgumentException
            (Json_deserializers.invalid_argument_exception_of_yojson tree path)
      | _, "KMSAccessDeniedException" ->
          `KMSAccessDeniedException
            (Json_deserializers.kms_access_denied_exception_of_yojson tree path)
      | _, "KMSDisabledException" ->
          `KMSDisabledException (Json_deserializers.kms_disabled_exception_of_yojson tree path)
      | _, "KMSInvalidStateException" ->
          `KMSInvalidStateException
            (Json_deserializers.kms_invalid_state_exception_of_yojson tree path)
      | _, "KMSNotFoundException" ->
          `KMSNotFoundException (Json_deserializers.kms_not_found_exception_of_yojson tree path)
      | _, "KMSOptInRequired" ->
          `KMSOptInRequired (Json_deserializers.kms_opt_in_required_of_yojson tree path)
      | _, "KMSThrottlingException" ->
          `KMSThrottlingException (Json_deserializers.kms_throttling_exception_of_yojson tree path)
      | _, "ProvisionedThroughputExceededException" ->
          `ProvisionedThroughputExceededException
            (Json_deserializers.provisioned_throughput_exceeded_exception_of_yojson tree path)
      | _, "ResourceNotFoundException" ->
          `ResourceNotFoundException
            (Json_deserializers.resource_not_found_exception_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : get_records_input) =
    let input = Json_serializers.get_records_input_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"Kinesis_20131202.GetRecords" ~service ~context
      ~input ~output_deserializer:Json_deserializers.get_records_output_of_yojson
      ~error_deserializer
end

module GetResourcePolicy = struct
  let error_to_string = function
    | `AccessDeniedException _ -> "com.amazonaws.kinesis#AccessDeniedException"
    | `InvalidArgumentException _ -> "com.amazonaws.kinesis#InvalidArgumentException"
    | `LimitExceededException _ -> "com.amazonaws.kinesis#LimitExceededException"
    | `ResourceInUseException _ -> "com.amazonaws.kinesis#ResourceInUseException"
    | `ResourceNotFoundException _ -> "com.amazonaws.kinesis#ResourceNotFoundException"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "AccessDeniedException" ->
          `AccessDeniedException (Json_deserializers.access_denied_exception_of_yojson tree path)
      | _, "InvalidArgumentException" ->
          `InvalidArgumentException
            (Json_deserializers.invalid_argument_exception_of_yojson tree path)
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

  let request context (request : get_resource_policy_input) =
    let input = Json_serializers.get_resource_policy_input_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"Kinesis_20131202.GetResourcePolicy" ~service
      ~context ~input ~output_deserializer:Json_deserializers.get_resource_policy_output_of_yojson
      ~error_deserializer
end

module GetShardIterator = struct
  let error_to_string = function
    | `AccessDeniedException _ -> "com.amazonaws.kinesis#AccessDeniedException"
    | `InternalFailureException _ -> "com.amazonaws.kinesis#InternalFailureException"
    | `InvalidArgumentException _ -> "com.amazonaws.kinesis#InvalidArgumentException"
    | `ProvisionedThroughputExceededException _ ->
        "com.amazonaws.kinesis#ProvisionedThroughputExceededException"
    | `ResourceNotFoundException _ -> "com.amazonaws.kinesis#ResourceNotFoundException"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "AccessDeniedException" ->
          `AccessDeniedException (Json_deserializers.access_denied_exception_of_yojson tree path)
      | _, "InternalFailureException" ->
          `InternalFailureException
            (Json_deserializers.internal_failure_exception_of_yojson tree path)
      | _, "InvalidArgumentException" ->
          `InvalidArgumentException
            (Json_deserializers.invalid_argument_exception_of_yojson tree path)
      | _, "ProvisionedThroughputExceededException" ->
          `ProvisionedThroughputExceededException
            (Json_deserializers.provisioned_throughput_exceeded_exception_of_yojson tree path)
      | _, "ResourceNotFoundException" ->
          `ResourceNotFoundException
            (Json_deserializers.resource_not_found_exception_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : get_shard_iterator_input) =
    let input = Json_serializers.get_shard_iterator_input_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"Kinesis_20131202.GetShardIterator" ~service
      ~context ~input ~output_deserializer:Json_deserializers.get_shard_iterator_output_of_yojson
      ~error_deserializer
end

module IncreaseStreamRetentionPeriod = struct
  let error_to_string = function
    | `AccessDeniedException _ -> "com.amazonaws.kinesis#AccessDeniedException"
    | `InvalidArgumentException _ -> "com.amazonaws.kinesis#InvalidArgumentException"
    | `LimitExceededException _ -> "com.amazonaws.kinesis#LimitExceededException"
    | `ResourceInUseException _ -> "com.amazonaws.kinesis#ResourceInUseException"
    | `ResourceNotFoundException _ -> "com.amazonaws.kinesis#ResourceNotFoundException"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "AccessDeniedException" ->
          `AccessDeniedException (Json_deserializers.access_denied_exception_of_yojson tree path)
      | _, "InvalidArgumentException" ->
          `InvalidArgumentException
            (Json_deserializers.invalid_argument_exception_of_yojson tree path)
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

  let request context (request : increase_stream_retention_period_input) =
    let input = Json_serializers.increase_stream_retention_period_input_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"Kinesis_20131202.IncreaseStreamRetentionPeriod"
      ~service ~context ~input
      ~output_deserializer:Smaws_Lib.Smithy_api.Json_deserializers.unit__of_yojson
      ~error_deserializer
end

module ListShards = struct
  let error_to_string = function
    | `AccessDeniedException _ -> "com.amazonaws.kinesis#AccessDeniedException"
    | `ExpiredNextTokenException _ -> "com.amazonaws.kinesis#ExpiredNextTokenException"
    | `InvalidArgumentException _ -> "com.amazonaws.kinesis#InvalidArgumentException"
    | `LimitExceededException _ -> "com.amazonaws.kinesis#LimitExceededException"
    | `ResourceInUseException _ -> "com.amazonaws.kinesis#ResourceInUseException"
    | `ResourceNotFoundException _ -> "com.amazonaws.kinesis#ResourceNotFoundException"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "AccessDeniedException" ->
          `AccessDeniedException (Json_deserializers.access_denied_exception_of_yojson tree path)
      | _, "ExpiredNextTokenException" ->
          `ExpiredNextTokenException
            (Json_deserializers.expired_next_token_exception_of_yojson tree path)
      | _, "InvalidArgumentException" ->
          `InvalidArgumentException
            (Json_deserializers.invalid_argument_exception_of_yojson tree path)
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

  let request context (request : list_shards_input) =
    let input = Json_serializers.list_shards_input_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"Kinesis_20131202.ListShards" ~service ~context
      ~input ~output_deserializer:Json_deserializers.list_shards_output_of_yojson
      ~error_deserializer
end

module ListStreamConsumers = struct
  let error_to_string = function
    | `ExpiredNextTokenException _ -> "com.amazonaws.kinesis#ExpiredNextTokenException"
    | `InvalidArgumentException _ -> "com.amazonaws.kinesis#InvalidArgumentException"
    | `LimitExceededException _ -> "com.amazonaws.kinesis#LimitExceededException"
    | `ResourceInUseException _ -> "com.amazonaws.kinesis#ResourceInUseException"
    | `ResourceNotFoundException _ -> "com.amazonaws.kinesis#ResourceNotFoundException"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "ExpiredNextTokenException" ->
          `ExpiredNextTokenException
            (Json_deserializers.expired_next_token_exception_of_yojson tree path)
      | _, "InvalidArgumentException" ->
          `InvalidArgumentException
            (Json_deserializers.invalid_argument_exception_of_yojson tree path)
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

  let request context (request : list_stream_consumers_input) =
    let input = Json_serializers.list_stream_consumers_input_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"Kinesis_20131202.ListStreamConsumers" ~service
      ~context ~input ~output_deserializer:Json_deserializers.list_stream_consumers_output_of_yojson
      ~error_deserializer
end

module ListStreams = struct
  let error_to_string = function
    | `ExpiredNextTokenException _ -> "com.amazonaws.kinesis#ExpiredNextTokenException"
    | `InvalidArgumentException _ -> "com.amazonaws.kinesis#InvalidArgumentException"
    | `LimitExceededException _ -> "com.amazonaws.kinesis#LimitExceededException"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "ExpiredNextTokenException" ->
          `ExpiredNextTokenException
            (Json_deserializers.expired_next_token_exception_of_yojson tree path)
      | _, "InvalidArgumentException" ->
          `InvalidArgumentException
            (Json_deserializers.invalid_argument_exception_of_yojson tree path)
      | _, "LimitExceededException" ->
          `LimitExceededException (Json_deserializers.limit_exceeded_exception_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : list_streams_input) =
    let input = Json_serializers.list_streams_input_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"Kinesis_20131202.ListStreams" ~service ~context
      ~input ~output_deserializer:Json_deserializers.list_streams_output_of_yojson
      ~error_deserializer
end

module ListTagsForResource = struct
  let error_to_string = function
    | `AccessDeniedException _ -> "com.amazonaws.kinesis#AccessDeniedException"
    | `InvalidArgumentException _ -> "com.amazonaws.kinesis#InvalidArgumentException"
    | `LimitExceededException _ -> "com.amazonaws.kinesis#LimitExceededException"
    | `ResourceInUseException _ -> "com.amazonaws.kinesis#ResourceInUseException"
    | `ResourceNotFoundException _ -> "com.amazonaws.kinesis#ResourceNotFoundException"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "AccessDeniedException" ->
          `AccessDeniedException (Json_deserializers.access_denied_exception_of_yojson tree path)
      | _, "InvalidArgumentException" ->
          `InvalidArgumentException
            (Json_deserializers.invalid_argument_exception_of_yojson tree path)
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

  let request context (request : list_tags_for_resource_input) =
    let input = Json_serializers.list_tags_for_resource_input_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"Kinesis_20131202.ListTagsForResource" ~service
      ~context ~input
      ~output_deserializer:Json_deserializers.list_tags_for_resource_output_of_yojson
      ~error_deserializer
end

module ListTagsForStream = struct
  let error_to_string = function
    | `AccessDeniedException _ -> "com.amazonaws.kinesis#AccessDeniedException"
    | `InvalidArgumentException _ -> "com.amazonaws.kinesis#InvalidArgumentException"
    | `LimitExceededException _ -> "com.amazonaws.kinesis#LimitExceededException"
    | `ResourceNotFoundException _ -> "com.amazonaws.kinesis#ResourceNotFoundException"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "AccessDeniedException" ->
          `AccessDeniedException (Json_deserializers.access_denied_exception_of_yojson tree path)
      | _, "InvalidArgumentException" ->
          `InvalidArgumentException
            (Json_deserializers.invalid_argument_exception_of_yojson tree path)
      | _, "LimitExceededException" ->
          `LimitExceededException (Json_deserializers.limit_exceeded_exception_of_yojson tree path)
      | _, "ResourceNotFoundException" ->
          `ResourceNotFoundException
            (Json_deserializers.resource_not_found_exception_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : list_tags_for_stream_input) =
    let input = Json_serializers.list_tags_for_stream_input_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"Kinesis_20131202.ListTagsForStream" ~service
      ~context ~input ~output_deserializer:Json_deserializers.list_tags_for_stream_output_of_yojson
      ~error_deserializer
end

module MergeShards = struct
  let error_to_string = function
    | `AccessDeniedException _ -> "com.amazonaws.kinesis#AccessDeniedException"
    | `InvalidArgumentException _ -> "com.amazonaws.kinesis#InvalidArgumentException"
    | `LimitExceededException _ -> "com.amazonaws.kinesis#LimitExceededException"
    | `ResourceInUseException _ -> "com.amazonaws.kinesis#ResourceInUseException"
    | `ResourceNotFoundException _ -> "com.amazonaws.kinesis#ResourceNotFoundException"
    | `ValidationException _ -> "com.amazonaws.kinesis#ValidationException"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "AccessDeniedException" ->
          `AccessDeniedException (Json_deserializers.access_denied_exception_of_yojson tree path)
      | _, "InvalidArgumentException" ->
          `InvalidArgumentException
            (Json_deserializers.invalid_argument_exception_of_yojson tree path)
      | _, "LimitExceededException" ->
          `LimitExceededException (Json_deserializers.limit_exceeded_exception_of_yojson tree path)
      | _, "ResourceInUseException" ->
          `ResourceInUseException (Json_deserializers.resource_in_use_exception_of_yojson tree path)
      | _, "ResourceNotFoundException" ->
          `ResourceNotFoundException
            (Json_deserializers.resource_not_found_exception_of_yojson tree path)
      | _, "ValidationException" ->
          `ValidationException (Json_deserializers.validation_exception_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : merge_shards_input) =
    let input = Json_serializers.merge_shards_input_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"Kinesis_20131202.MergeShards" ~service ~context
      ~input ~output_deserializer:Smaws_Lib.Smithy_api.Json_deserializers.unit__of_yojson
      ~error_deserializer
end

module PutRecord = struct
  let error_to_string = function
    | `AccessDeniedException _ -> "com.amazonaws.kinesis#AccessDeniedException"
    | `InternalFailureException _ -> "com.amazonaws.kinesis#InternalFailureException"
    | `InvalidArgumentException _ -> "com.amazonaws.kinesis#InvalidArgumentException"
    | `KMSAccessDeniedException _ -> "com.amazonaws.kinesis#KMSAccessDeniedException"
    | `KMSDisabledException _ -> "com.amazonaws.kinesis#KMSDisabledException"
    | `KMSInvalidStateException _ -> "com.amazonaws.kinesis#KMSInvalidStateException"
    | `KMSNotFoundException _ -> "com.amazonaws.kinesis#KMSNotFoundException"
    | `KMSOptInRequired _ -> "com.amazonaws.kinesis#KMSOptInRequired"
    | `KMSThrottlingException _ -> "com.amazonaws.kinesis#KMSThrottlingException"
    | `ProvisionedThroughputExceededException _ ->
        "com.amazonaws.kinesis#ProvisionedThroughputExceededException"
    | `ResourceNotFoundException _ -> "com.amazonaws.kinesis#ResourceNotFoundException"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "AccessDeniedException" ->
          `AccessDeniedException (Json_deserializers.access_denied_exception_of_yojson tree path)
      | _, "InternalFailureException" ->
          `InternalFailureException
            (Json_deserializers.internal_failure_exception_of_yojson tree path)
      | _, "InvalidArgumentException" ->
          `InvalidArgumentException
            (Json_deserializers.invalid_argument_exception_of_yojson tree path)
      | _, "KMSAccessDeniedException" ->
          `KMSAccessDeniedException
            (Json_deserializers.kms_access_denied_exception_of_yojson tree path)
      | _, "KMSDisabledException" ->
          `KMSDisabledException (Json_deserializers.kms_disabled_exception_of_yojson tree path)
      | _, "KMSInvalidStateException" ->
          `KMSInvalidStateException
            (Json_deserializers.kms_invalid_state_exception_of_yojson tree path)
      | _, "KMSNotFoundException" ->
          `KMSNotFoundException (Json_deserializers.kms_not_found_exception_of_yojson tree path)
      | _, "KMSOptInRequired" ->
          `KMSOptInRequired (Json_deserializers.kms_opt_in_required_of_yojson tree path)
      | _, "KMSThrottlingException" ->
          `KMSThrottlingException (Json_deserializers.kms_throttling_exception_of_yojson tree path)
      | _, "ProvisionedThroughputExceededException" ->
          `ProvisionedThroughputExceededException
            (Json_deserializers.provisioned_throughput_exceeded_exception_of_yojson tree path)
      | _, "ResourceNotFoundException" ->
          `ResourceNotFoundException
            (Json_deserializers.resource_not_found_exception_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : put_record_input) =
    let input = Json_serializers.put_record_input_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"Kinesis_20131202.PutRecord" ~service ~context
      ~input ~output_deserializer:Json_deserializers.put_record_output_of_yojson ~error_deserializer
end

module PutRecords = struct
  let error_to_string = function
    | `AccessDeniedException _ -> "com.amazonaws.kinesis#AccessDeniedException"
    | `InternalFailureException _ -> "com.amazonaws.kinesis#InternalFailureException"
    | `InvalidArgumentException _ -> "com.amazonaws.kinesis#InvalidArgumentException"
    | `KMSAccessDeniedException _ -> "com.amazonaws.kinesis#KMSAccessDeniedException"
    | `KMSDisabledException _ -> "com.amazonaws.kinesis#KMSDisabledException"
    | `KMSInvalidStateException _ -> "com.amazonaws.kinesis#KMSInvalidStateException"
    | `KMSNotFoundException _ -> "com.amazonaws.kinesis#KMSNotFoundException"
    | `KMSOptInRequired _ -> "com.amazonaws.kinesis#KMSOptInRequired"
    | `KMSThrottlingException _ -> "com.amazonaws.kinesis#KMSThrottlingException"
    | `ProvisionedThroughputExceededException _ ->
        "com.amazonaws.kinesis#ProvisionedThroughputExceededException"
    | `ResourceNotFoundException _ -> "com.amazonaws.kinesis#ResourceNotFoundException"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "AccessDeniedException" ->
          `AccessDeniedException (Json_deserializers.access_denied_exception_of_yojson tree path)
      | _, "InternalFailureException" ->
          `InternalFailureException
            (Json_deserializers.internal_failure_exception_of_yojson tree path)
      | _, "InvalidArgumentException" ->
          `InvalidArgumentException
            (Json_deserializers.invalid_argument_exception_of_yojson tree path)
      | _, "KMSAccessDeniedException" ->
          `KMSAccessDeniedException
            (Json_deserializers.kms_access_denied_exception_of_yojson tree path)
      | _, "KMSDisabledException" ->
          `KMSDisabledException (Json_deserializers.kms_disabled_exception_of_yojson tree path)
      | _, "KMSInvalidStateException" ->
          `KMSInvalidStateException
            (Json_deserializers.kms_invalid_state_exception_of_yojson tree path)
      | _, "KMSNotFoundException" ->
          `KMSNotFoundException (Json_deserializers.kms_not_found_exception_of_yojson tree path)
      | _, "KMSOptInRequired" ->
          `KMSOptInRequired (Json_deserializers.kms_opt_in_required_of_yojson tree path)
      | _, "KMSThrottlingException" ->
          `KMSThrottlingException (Json_deserializers.kms_throttling_exception_of_yojson tree path)
      | _, "ProvisionedThroughputExceededException" ->
          `ProvisionedThroughputExceededException
            (Json_deserializers.provisioned_throughput_exceeded_exception_of_yojson tree path)
      | _, "ResourceNotFoundException" ->
          `ResourceNotFoundException
            (Json_deserializers.resource_not_found_exception_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : put_records_input) =
    let input = Json_serializers.put_records_input_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"Kinesis_20131202.PutRecords" ~service ~context
      ~input ~output_deserializer:Json_deserializers.put_records_output_of_yojson
      ~error_deserializer
end

module PutResourcePolicy = struct
  let error_to_string = function
    | `AccessDeniedException _ -> "com.amazonaws.kinesis#AccessDeniedException"
    | `InvalidArgumentException _ -> "com.amazonaws.kinesis#InvalidArgumentException"
    | `LimitExceededException _ -> "com.amazonaws.kinesis#LimitExceededException"
    | `ResourceInUseException _ -> "com.amazonaws.kinesis#ResourceInUseException"
    | `ResourceNotFoundException _ -> "com.amazonaws.kinesis#ResourceNotFoundException"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "AccessDeniedException" ->
          `AccessDeniedException (Json_deserializers.access_denied_exception_of_yojson tree path)
      | _, "InvalidArgumentException" ->
          `InvalidArgumentException
            (Json_deserializers.invalid_argument_exception_of_yojson tree path)
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

  let request context (request : put_resource_policy_input) =
    let input = Json_serializers.put_resource_policy_input_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"Kinesis_20131202.PutResourcePolicy" ~service
      ~context ~input ~output_deserializer:Smaws_Lib.Smithy_api.Json_deserializers.unit__of_yojson
      ~error_deserializer
end

module RegisterStreamConsumer = struct
  let error_to_string = function
    | `InvalidArgumentException _ -> "com.amazonaws.kinesis#InvalidArgumentException"
    | `LimitExceededException _ -> "com.amazonaws.kinesis#LimitExceededException"
    | `ResourceInUseException _ -> "com.amazonaws.kinesis#ResourceInUseException"
    | `ResourceNotFoundException _ -> "com.amazonaws.kinesis#ResourceNotFoundException"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "InvalidArgumentException" ->
          `InvalidArgumentException
            (Json_deserializers.invalid_argument_exception_of_yojson tree path)
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

  let request context (request : register_stream_consumer_input) =
    let input = Json_serializers.register_stream_consumer_input_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"Kinesis_20131202.RegisterStreamConsumer"
      ~service ~context ~input
      ~output_deserializer:Json_deserializers.register_stream_consumer_output_of_yojson
      ~error_deserializer
end

module RemoveTagsFromStream = struct
  let error_to_string = function
    | `AccessDeniedException _ -> "com.amazonaws.kinesis#AccessDeniedException"
    | `InvalidArgumentException _ -> "com.amazonaws.kinesis#InvalidArgumentException"
    | `LimitExceededException _ -> "com.amazonaws.kinesis#LimitExceededException"
    | `ResourceInUseException _ -> "com.amazonaws.kinesis#ResourceInUseException"
    | `ResourceNotFoundException _ -> "com.amazonaws.kinesis#ResourceNotFoundException"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "AccessDeniedException" ->
          `AccessDeniedException (Json_deserializers.access_denied_exception_of_yojson tree path)
      | _, "InvalidArgumentException" ->
          `InvalidArgumentException
            (Json_deserializers.invalid_argument_exception_of_yojson tree path)
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

  let request context (request : remove_tags_from_stream_input) =
    let input = Json_serializers.remove_tags_from_stream_input_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"Kinesis_20131202.RemoveTagsFromStream" ~service
      ~context ~input ~output_deserializer:Smaws_Lib.Smithy_api.Json_deserializers.unit__of_yojson
      ~error_deserializer
end

module SplitShard = struct
  let error_to_string = function
    | `AccessDeniedException _ -> "com.amazonaws.kinesis#AccessDeniedException"
    | `InvalidArgumentException _ -> "com.amazonaws.kinesis#InvalidArgumentException"
    | `LimitExceededException _ -> "com.amazonaws.kinesis#LimitExceededException"
    | `ResourceInUseException _ -> "com.amazonaws.kinesis#ResourceInUseException"
    | `ResourceNotFoundException _ -> "com.amazonaws.kinesis#ResourceNotFoundException"
    | `ValidationException _ -> "com.amazonaws.kinesis#ValidationException"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "AccessDeniedException" ->
          `AccessDeniedException (Json_deserializers.access_denied_exception_of_yojson tree path)
      | _, "InvalidArgumentException" ->
          `InvalidArgumentException
            (Json_deserializers.invalid_argument_exception_of_yojson tree path)
      | _, "LimitExceededException" ->
          `LimitExceededException (Json_deserializers.limit_exceeded_exception_of_yojson tree path)
      | _, "ResourceInUseException" ->
          `ResourceInUseException (Json_deserializers.resource_in_use_exception_of_yojson tree path)
      | _, "ResourceNotFoundException" ->
          `ResourceNotFoundException
            (Json_deserializers.resource_not_found_exception_of_yojson tree path)
      | _, "ValidationException" ->
          `ValidationException (Json_deserializers.validation_exception_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : split_shard_input) =
    let input = Json_serializers.split_shard_input_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"Kinesis_20131202.SplitShard" ~service ~context
      ~input ~output_deserializer:Smaws_Lib.Smithy_api.Json_deserializers.unit__of_yojson
      ~error_deserializer
end

module StartStreamEncryption = struct
  let error_to_string = function
    | `AccessDeniedException _ -> "com.amazonaws.kinesis#AccessDeniedException"
    | `InvalidArgumentException _ -> "com.amazonaws.kinesis#InvalidArgumentException"
    | `KMSAccessDeniedException _ -> "com.amazonaws.kinesis#KMSAccessDeniedException"
    | `KMSDisabledException _ -> "com.amazonaws.kinesis#KMSDisabledException"
    | `KMSInvalidStateException _ -> "com.amazonaws.kinesis#KMSInvalidStateException"
    | `KMSNotFoundException _ -> "com.amazonaws.kinesis#KMSNotFoundException"
    | `KMSOptInRequired _ -> "com.amazonaws.kinesis#KMSOptInRequired"
    | `KMSThrottlingException _ -> "com.amazonaws.kinesis#KMSThrottlingException"
    | `LimitExceededException _ -> "com.amazonaws.kinesis#LimitExceededException"
    | `ResourceInUseException _ -> "com.amazonaws.kinesis#ResourceInUseException"
    | `ResourceNotFoundException _ -> "com.amazonaws.kinesis#ResourceNotFoundException"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "AccessDeniedException" ->
          `AccessDeniedException (Json_deserializers.access_denied_exception_of_yojson tree path)
      | _, "InvalidArgumentException" ->
          `InvalidArgumentException
            (Json_deserializers.invalid_argument_exception_of_yojson tree path)
      | _, "KMSAccessDeniedException" ->
          `KMSAccessDeniedException
            (Json_deserializers.kms_access_denied_exception_of_yojson tree path)
      | _, "KMSDisabledException" ->
          `KMSDisabledException (Json_deserializers.kms_disabled_exception_of_yojson tree path)
      | _, "KMSInvalidStateException" ->
          `KMSInvalidStateException
            (Json_deserializers.kms_invalid_state_exception_of_yojson tree path)
      | _, "KMSNotFoundException" ->
          `KMSNotFoundException (Json_deserializers.kms_not_found_exception_of_yojson tree path)
      | _, "KMSOptInRequired" ->
          `KMSOptInRequired (Json_deserializers.kms_opt_in_required_of_yojson tree path)
      | _, "KMSThrottlingException" ->
          `KMSThrottlingException (Json_deserializers.kms_throttling_exception_of_yojson tree path)
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

  let request context (request : start_stream_encryption_input) =
    let input = Json_serializers.start_stream_encryption_input_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"Kinesis_20131202.StartStreamEncryption"
      ~service ~context ~input
      ~output_deserializer:Smaws_Lib.Smithy_api.Json_deserializers.unit__of_yojson
      ~error_deserializer
end

module StopStreamEncryption = struct
  let error_to_string = function
    | `AccessDeniedException _ -> "com.amazonaws.kinesis#AccessDeniedException"
    | `InvalidArgumentException _ -> "com.amazonaws.kinesis#InvalidArgumentException"
    | `LimitExceededException _ -> "com.amazonaws.kinesis#LimitExceededException"
    | `ResourceInUseException _ -> "com.amazonaws.kinesis#ResourceInUseException"
    | `ResourceNotFoundException _ -> "com.amazonaws.kinesis#ResourceNotFoundException"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "AccessDeniedException" ->
          `AccessDeniedException (Json_deserializers.access_denied_exception_of_yojson tree path)
      | _, "InvalidArgumentException" ->
          `InvalidArgumentException
            (Json_deserializers.invalid_argument_exception_of_yojson tree path)
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

  let request context (request : stop_stream_encryption_input) =
    let input = Json_serializers.stop_stream_encryption_input_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"Kinesis_20131202.StopStreamEncryption" ~service
      ~context ~input ~output_deserializer:Smaws_Lib.Smithy_api.Json_deserializers.unit__of_yojson
      ~error_deserializer
end

module SubscribeToShard = struct
  let error_to_string = function
    | `AccessDeniedException _ -> "com.amazonaws.kinesis#AccessDeniedException"
    | `InvalidArgumentException _ -> "com.amazonaws.kinesis#InvalidArgumentException"
    | `LimitExceededException _ -> "com.amazonaws.kinesis#LimitExceededException"
    | `ResourceInUseException _ -> "com.amazonaws.kinesis#ResourceInUseException"
    | `ResourceNotFoundException _ -> "com.amazonaws.kinesis#ResourceNotFoundException"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "AccessDeniedException" ->
          `AccessDeniedException (Json_deserializers.access_denied_exception_of_yojson tree path)
      | _, "InvalidArgumentException" ->
          `InvalidArgumentException
            (Json_deserializers.invalid_argument_exception_of_yojson tree path)
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

  let request context (request : subscribe_to_shard_input) =
    let input = Json_serializers.subscribe_to_shard_input_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"Kinesis_20131202.SubscribeToShard" ~service
      ~context ~input ~output_deserializer:Json_deserializers.subscribe_to_shard_output_of_yojson
      ~error_deserializer
end

module TagResource = struct
  let error_to_string = function
    | `AccessDeniedException _ -> "com.amazonaws.kinesis#AccessDeniedException"
    | `InvalidArgumentException _ -> "com.amazonaws.kinesis#InvalidArgumentException"
    | `LimitExceededException _ -> "com.amazonaws.kinesis#LimitExceededException"
    | `ResourceInUseException _ -> "com.amazonaws.kinesis#ResourceInUseException"
    | `ResourceNotFoundException _ -> "com.amazonaws.kinesis#ResourceNotFoundException"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "AccessDeniedException" ->
          `AccessDeniedException (Json_deserializers.access_denied_exception_of_yojson tree path)
      | _, "InvalidArgumentException" ->
          `InvalidArgumentException
            (Json_deserializers.invalid_argument_exception_of_yojson tree path)
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

  let request context (request : tag_resource_input) =
    let input = Json_serializers.tag_resource_input_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"Kinesis_20131202.TagResource" ~service ~context
      ~input ~output_deserializer:Smaws_Lib.Smithy_api.Json_deserializers.unit__of_yojson
      ~error_deserializer
end

module UntagResource = struct
  let error_to_string = function
    | `AccessDeniedException _ -> "com.amazonaws.kinesis#AccessDeniedException"
    | `InvalidArgumentException _ -> "com.amazonaws.kinesis#InvalidArgumentException"
    | `LimitExceededException _ -> "com.amazonaws.kinesis#LimitExceededException"
    | `ResourceInUseException _ -> "com.amazonaws.kinesis#ResourceInUseException"
    | `ResourceNotFoundException _ -> "com.amazonaws.kinesis#ResourceNotFoundException"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "AccessDeniedException" ->
          `AccessDeniedException (Json_deserializers.access_denied_exception_of_yojson tree path)
      | _, "InvalidArgumentException" ->
          `InvalidArgumentException
            (Json_deserializers.invalid_argument_exception_of_yojson tree path)
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

  let request context (request : untag_resource_input) =
    let input = Json_serializers.untag_resource_input_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"Kinesis_20131202.UntagResource" ~service
      ~context ~input ~output_deserializer:Smaws_Lib.Smithy_api.Json_deserializers.unit__of_yojson
      ~error_deserializer
end

module UpdateShardCount = struct
  let error_to_string = function
    | `AccessDeniedException _ -> "com.amazonaws.kinesis#AccessDeniedException"
    | `InvalidArgumentException _ -> "com.amazonaws.kinesis#InvalidArgumentException"
    | `LimitExceededException _ -> "com.amazonaws.kinesis#LimitExceededException"
    | `ResourceInUseException _ -> "com.amazonaws.kinesis#ResourceInUseException"
    | `ResourceNotFoundException _ -> "com.amazonaws.kinesis#ResourceNotFoundException"
    | `ValidationException _ -> "com.amazonaws.kinesis#ValidationException"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "AccessDeniedException" ->
          `AccessDeniedException (Json_deserializers.access_denied_exception_of_yojson tree path)
      | _, "InvalidArgumentException" ->
          `InvalidArgumentException
            (Json_deserializers.invalid_argument_exception_of_yojson tree path)
      | _, "LimitExceededException" ->
          `LimitExceededException (Json_deserializers.limit_exceeded_exception_of_yojson tree path)
      | _, "ResourceInUseException" ->
          `ResourceInUseException (Json_deserializers.resource_in_use_exception_of_yojson tree path)
      | _, "ResourceNotFoundException" ->
          `ResourceNotFoundException
            (Json_deserializers.resource_not_found_exception_of_yojson tree path)
      | _, "ValidationException" ->
          `ValidationException (Json_deserializers.validation_exception_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : update_shard_count_input) =
    let input = Json_serializers.update_shard_count_input_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"Kinesis_20131202.UpdateShardCount" ~service
      ~context ~input ~output_deserializer:Json_deserializers.update_shard_count_output_of_yojson
      ~error_deserializer
end

module UpdateStreamMode = struct
  let error_to_string = function
    | `InvalidArgumentException _ -> "com.amazonaws.kinesis#InvalidArgumentException"
    | `LimitExceededException _ -> "com.amazonaws.kinesis#LimitExceededException"
    | `ResourceInUseException _ -> "com.amazonaws.kinesis#ResourceInUseException"
    | `ResourceNotFoundException _ -> "com.amazonaws.kinesis#ResourceNotFoundException"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "InvalidArgumentException" ->
          `InvalidArgumentException
            (Json_deserializers.invalid_argument_exception_of_yojson tree path)
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

  let request context (request : update_stream_mode_input) =
    let input = Json_serializers.update_stream_mode_input_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"Kinesis_20131202.UpdateStreamMode" ~service
      ~context ~input ~output_deserializer:Smaws_Lib.Smithy_api.Json_deserializers.unit__of_yojson
      ~error_deserializer
end
