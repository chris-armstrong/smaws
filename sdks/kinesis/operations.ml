open Types
module AddTagsToStream =
  struct
    let error_deserializer tree path =
      let open Deserializers in
        let handler handler tree path =
          function
          | (_, "AccessDeniedException") ->
              `AccessDeniedException
                (access_denied_exception_of_yojson tree path)
          | (_, "InvalidArgumentException") ->
              `InvalidArgumentException
                (invalid_argument_exception_of_yojson tree path)
          | (_, "LimitExceededException") ->
              `LimitExceededException
                (limit_exceeded_exception_of_yojson tree path)
          | (_, "ResourceInUseException") ->
              `ResourceInUseException
                (resource_in_use_exception_of_yojson tree path)
          | (_, "ResourceNotFoundException") ->
              `ResourceNotFoundException
                (resource_not_found_exception_of_yojson tree path)
          | _type -> handler tree path _type in
        Smaws_Lib.Protocols.AwsJson.(error_deserializer
                                       (handler
                                          Smaws_Lib.Protocols.AwsJson.Errors.default_handler)
                                       tree path)
    let request context (request : add_tags_to_stream_input) =
      let open Smaws_Lib.Context in
        let open Deserializers in
          let input = Serializers.add_tags_to_stream_input_to_yojson request in
          Smaws_Lib.Protocols.AwsJson.request
            ~shape_name:"Kinesis_20131202AddTagsToStream" ~service
            ~config:context.config ~http:context.http ~input
            ~output_deserializer:base_unit_of_yojson ~error_deserializer
  end
module CreateStream =
  struct
    let error_deserializer tree path =
      let open Deserializers in
        let handler handler tree path =
          function
          | (_, "InvalidArgumentException") ->
              `InvalidArgumentException
                (invalid_argument_exception_of_yojson tree path)
          | (_, "LimitExceededException") ->
              `LimitExceededException
                (limit_exceeded_exception_of_yojson tree path)
          | (_, "ResourceInUseException") ->
              `ResourceInUseException
                (resource_in_use_exception_of_yojson tree path)
          | _type -> handler tree path _type in
        Smaws_Lib.Protocols.AwsJson.(error_deserializer
                                       (handler
                                          Smaws_Lib.Protocols.AwsJson.Errors.default_handler)
                                       tree path)
    let request context (request : create_stream_input) =
      let open Smaws_Lib.Context in
        let open Deserializers in
          let input = Serializers.create_stream_input_to_yojson request in
          Smaws_Lib.Protocols.AwsJson.request
            ~shape_name:"Kinesis_20131202CreateStream" ~service
            ~config:context.config ~http:context.http ~input
            ~output_deserializer:base_unit_of_yojson ~error_deserializer
  end
module DecreaseStreamRetentionPeriod =
  struct
    let error_deserializer tree path =
      let open Deserializers in
        let handler handler tree path =
          function
          | (_, "AccessDeniedException") ->
              `AccessDeniedException
                (access_denied_exception_of_yojson tree path)
          | (_, "InvalidArgumentException") ->
              `InvalidArgumentException
                (invalid_argument_exception_of_yojson tree path)
          | (_, "LimitExceededException") ->
              `LimitExceededException
                (limit_exceeded_exception_of_yojson tree path)
          | (_, "ResourceInUseException") ->
              `ResourceInUseException
                (resource_in_use_exception_of_yojson tree path)
          | (_, "ResourceNotFoundException") ->
              `ResourceNotFoundException
                (resource_not_found_exception_of_yojson tree path)
          | _type -> handler tree path _type in
        Smaws_Lib.Protocols.AwsJson.(error_deserializer
                                       (handler
                                          Smaws_Lib.Protocols.AwsJson.Errors.default_handler)
                                       tree path)
    let request context (request : decrease_stream_retention_period_input) =
      let open Smaws_Lib.Context in
        let open Deserializers in
          let input =
            Serializers.decrease_stream_retention_period_input_to_yojson
              request in
          Smaws_Lib.Protocols.AwsJson.request
            ~shape_name:"Kinesis_20131202DecreaseStreamRetentionPeriod"
            ~service ~config:context.config ~http:context.http ~input
            ~output_deserializer:base_unit_of_yojson ~error_deserializer
  end
module DeleteResourcePolicy =
  struct
    let error_deserializer tree path =
      let open Deserializers in
        let handler handler tree path =
          function
          | (_, "AccessDeniedException") ->
              `AccessDeniedException
                (access_denied_exception_of_yojson tree path)
          | (_, "InvalidArgumentException") ->
              `InvalidArgumentException
                (invalid_argument_exception_of_yojson tree path)
          | (_, "LimitExceededException") ->
              `LimitExceededException
                (limit_exceeded_exception_of_yojson tree path)
          | (_, "ResourceInUseException") ->
              `ResourceInUseException
                (resource_in_use_exception_of_yojson tree path)
          | (_, "ResourceNotFoundException") ->
              `ResourceNotFoundException
                (resource_not_found_exception_of_yojson tree path)
          | _type -> handler tree path _type in
        Smaws_Lib.Protocols.AwsJson.(error_deserializer
                                       (handler
                                          Smaws_Lib.Protocols.AwsJson.Errors.default_handler)
                                       tree path)
    let request context (request : delete_resource_policy_input) =
      let open Smaws_Lib.Context in
        let open Deserializers in
          let input =
            Serializers.delete_resource_policy_input_to_yojson request in
          Smaws_Lib.Protocols.AwsJson.request
            ~shape_name:"Kinesis_20131202DeleteResourcePolicy" ~service
            ~config:context.config ~http:context.http ~input
            ~output_deserializer:base_unit_of_yojson ~error_deserializer
  end
module DeleteStream =
  struct
    let error_deserializer tree path =
      let open Deserializers in
        let handler handler tree path =
          function
          | (_, "AccessDeniedException") ->
              `AccessDeniedException
                (access_denied_exception_of_yojson tree path)
          | (_, "InvalidArgumentException") ->
              `InvalidArgumentException
                (invalid_argument_exception_of_yojson tree path)
          | (_, "LimitExceededException") ->
              `LimitExceededException
                (limit_exceeded_exception_of_yojson tree path)
          | (_, "ResourceInUseException") ->
              `ResourceInUseException
                (resource_in_use_exception_of_yojson tree path)
          | (_, "ResourceNotFoundException") ->
              `ResourceNotFoundException
                (resource_not_found_exception_of_yojson tree path)
          | _type -> handler tree path _type in
        Smaws_Lib.Protocols.AwsJson.(error_deserializer
                                       (handler
                                          Smaws_Lib.Protocols.AwsJson.Errors.default_handler)
                                       tree path)
    let request context (request : delete_stream_input) =
      let open Smaws_Lib.Context in
        let open Deserializers in
          let input = Serializers.delete_stream_input_to_yojson request in
          Smaws_Lib.Protocols.AwsJson.request
            ~shape_name:"Kinesis_20131202DeleteStream" ~service
            ~config:context.config ~http:context.http ~input
            ~output_deserializer:base_unit_of_yojson ~error_deserializer
  end
module DeregisterStreamConsumer =
  struct
    let error_deserializer tree path =
      let open Deserializers in
        let handler handler tree path =
          function
          | (_, "InvalidArgumentException") ->
              `InvalidArgumentException
                (invalid_argument_exception_of_yojson tree path)
          | (_, "LimitExceededException") ->
              `LimitExceededException
                (limit_exceeded_exception_of_yojson tree path)
          | (_, "ResourceNotFoundException") ->
              `ResourceNotFoundException
                (resource_not_found_exception_of_yojson tree path)
          | _type -> handler tree path _type in
        Smaws_Lib.Protocols.AwsJson.(error_deserializer
                                       (handler
                                          Smaws_Lib.Protocols.AwsJson.Errors.default_handler)
                                       tree path)
    let request context (request : deregister_stream_consumer_input) =
      let open Smaws_Lib.Context in
        let open Deserializers in
          let input =
            Serializers.deregister_stream_consumer_input_to_yojson request in
          Smaws_Lib.Protocols.AwsJson.request
            ~shape_name:"Kinesis_20131202DeregisterStreamConsumer" ~service
            ~config:context.config ~http:context.http ~input
            ~output_deserializer:base_unit_of_yojson ~error_deserializer
  end
module DescribeLimits =
  struct
    let error_deserializer tree path =
      let open Deserializers in
        let handler handler tree path =
          function
          | (_, "LimitExceededException") ->
              `LimitExceededException
                (limit_exceeded_exception_of_yojson tree path)
          | _type -> handler tree path _type in
        Smaws_Lib.Protocols.AwsJson.(error_deserializer
                                       (handler
                                          Smaws_Lib.Protocols.AwsJson.Errors.default_handler)
                                       tree path)
    let request context (request : describe_limits_input) =
      let open Smaws_Lib.Context in
        let open Deserializers in
          let input = Serializers.describe_limits_input_to_yojson request in
          Smaws_Lib.Protocols.AwsJson.request
            ~shape_name:"Kinesis_20131202DescribeLimits" ~service
            ~config:context.config ~http:context.http ~input
            ~output_deserializer:describe_limits_output_of_yojson
            ~error_deserializer
  end
module DescribeStream =
  struct
    let error_deserializer tree path =
      let open Deserializers in
        let handler handler tree path =
          function
          | (_, "AccessDeniedException") ->
              `AccessDeniedException
                (access_denied_exception_of_yojson tree path)
          | (_, "InvalidArgumentException") ->
              `InvalidArgumentException
                (invalid_argument_exception_of_yojson tree path)
          | (_, "LimitExceededException") ->
              `LimitExceededException
                (limit_exceeded_exception_of_yojson tree path)
          | (_, "ResourceNotFoundException") ->
              `ResourceNotFoundException
                (resource_not_found_exception_of_yojson tree path)
          | _type -> handler tree path _type in
        Smaws_Lib.Protocols.AwsJson.(error_deserializer
                                       (handler
                                          Smaws_Lib.Protocols.AwsJson.Errors.default_handler)
                                       tree path)
    let request context (request : describe_stream_input) =
      let open Smaws_Lib.Context in
        let open Deserializers in
          let input = Serializers.describe_stream_input_to_yojson request in
          Smaws_Lib.Protocols.AwsJson.request
            ~shape_name:"Kinesis_20131202DescribeStream" ~service
            ~config:context.config ~http:context.http ~input
            ~output_deserializer:describe_stream_output_of_yojson
            ~error_deserializer
  end
module DescribeStreamConsumer =
  struct
    let error_deserializer tree path =
      let open Deserializers in
        let handler handler tree path =
          function
          | (_, "InvalidArgumentException") ->
              `InvalidArgumentException
                (invalid_argument_exception_of_yojson tree path)
          | (_, "LimitExceededException") ->
              `LimitExceededException
                (limit_exceeded_exception_of_yojson tree path)
          | (_, "ResourceNotFoundException") ->
              `ResourceNotFoundException
                (resource_not_found_exception_of_yojson tree path)
          | _type -> handler tree path _type in
        Smaws_Lib.Protocols.AwsJson.(error_deserializer
                                       (handler
                                          Smaws_Lib.Protocols.AwsJson.Errors.default_handler)
                                       tree path)
    let request context (request : describe_stream_consumer_input) =
      let open Smaws_Lib.Context in
        let open Deserializers in
          let input =
            Serializers.describe_stream_consumer_input_to_yojson request in
          Smaws_Lib.Protocols.AwsJson.request
            ~shape_name:"Kinesis_20131202DescribeStreamConsumer" ~service
            ~config:context.config ~http:context.http ~input
            ~output_deserializer:describe_stream_consumer_output_of_yojson
            ~error_deserializer
  end
module DescribeStreamSummary =
  struct
    let error_deserializer tree path =
      let open Deserializers in
        let handler handler tree path =
          function
          | (_, "AccessDeniedException") ->
              `AccessDeniedException
                (access_denied_exception_of_yojson tree path)
          | (_, "InvalidArgumentException") ->
              `InvalidArgumentException
                (invalid_argument_exception_of_yojson tree path)
          | (_, "LimitExceededException") ->
              `LimitExceededException
                (limit_exceeded_exception_of_yojson tree path)
          | (_, "ResourceNotFoundException") ->
              `ResourceNotFoundException
                (resource_not_found_exception_of_yojson tree path)
          | _type -> handler tree path _type in
        Smaws_Lib.Protocols.AwsJson.(error_deserializer
                                       (handler
                                          Smaws_Lib.Protocols.AwsJson.Errors.default_handler)
                                       tree path)
    let request context (request : describe_stream_summary_input) =
      let open Smaws_Lib.Context in
        let open Deserializers in
          let input =
            Serializers.describe_stream_summary_input_to_yojson request in
          Smaws_Lib.Protocols.AwsJson.request
            ~shape_name:"Kinesis_20131202DescribeStreamSummary" ~service
            ~config:context.config ~http:context.http ~input
            ~output_deserializer:describe_stream_summary_output_of_yojson
            ~error_deserializer
  end
module DisableEnhancedMonitoring =
  struct
    let error_deserializer tree path =
      let open Deserializers in
        let handler handler tree path =
          function
          | (_, "AccessDeniedException") ->
              `AccessDeniedException
                (access_denied_exception_of_yojson tree path)
          | (_, "InvalidArgumentException") ->
              `InvalidArgumentException
                (invalid_argument_exception_of_yojson tree path)
          | (_, "LimitExceededException") ->
              `LimitExceededException
                (limit_exceeded_exception_of_yojson tree path)
          | (_, "ResourceInUseException") ->
              `ResourceInUseException
                (resource_in_use_exception_of_yojson tree path)
          | (_, "ResourceNotFoundException") ->
              `ResourceNotFoundException
                (resource_not_found_exception_of_yojson tree path)
          | _type -> handler tree path _type in
        Smaws_Lib.Protocols.AwsJson.(error_deserializer
                                       (handler
                                          Smaws_Lib.Protocols.AwsJson.Errors.default_handler)
                                       tree path)
    let request context (request : disable_enhanced_monitoring_input) =
      let open Smaws_Lib.Context in
        let open Deserializers in
          let input =
            Serializers.disable_enhanced_monitoring_input_to_yojson request in
          Smaws_Lib.Protocols.AwsJson.request
            ~shape_name:"Kinesis_20131202DisableEnhancedMonitoring" ~service
            ~config:context.config ~http:context.http ~input
            ~output_deserializer:enhanced_monitoring_output_of_yojson
            ~error_deserializer
  end
module EnableEnhancedMonitoring =
  struct
    let error_deserializer tree path =
      let open Deserializers in
        let handler handler tree path =
          function
          | (_, "AccessDeniedException") ->
              `AccessDeniedException
                (access_denied_exception_of_yojson tree path)
          | (_, "InvalidArgumentException") ->
              `InvalidArgumentException
                (invalid_argument_exception_of_yojson tree path)
          | (_, "LimitExceededException") ->
              `LimitExceededException
                (limit_exceeded_exception_of_yojson tree path)
          | (_, "ResourceInUseException") ->
              `ResourceInUseException
                (resource_in_use_exception_of_yojson tree path)
          | (_, "ResourceNotFoundException") ->
              `ResourceNotFoundException
                (resource_not_found_exception_of_yojson tree path)
          | _type -> handler tree path _type in
        Smaws_Lib.Protocols.AwsJson.(error_deserializer
                                       (handler
                                          Smaws_Lib.Protocols.AwsJson.Errors.default_handler)
                                       tree path)
    let request context (request : enable_enhanced_monitoring_input) =
      let open Smaws_Lib.Context in
        let open Deserializers in
          let input =
            Serializers.enable_enhanced_monitoring_input_to_yojson request in
          Smaws_Lib.Protocols.AwsJson.request
            ~shape_name:"Kinesis_20131202EnableEnhancedMonitoring" ~service
            ~config:context.config ~http:context.http ~input
            ~output_deserializer:enhanced_monitoring_output_of_yojson
            ~error_deserializer
  end
module GetRecords =
  struct
    let error_deserializer tree path =
      let open Deserializers in
        let handler handler tree path =
          function
          | (_, "AccessDeniedException") ->
              `AccessDeniedException
                (access_denied_exception_of_yojson tree path)
          | (_, "ExpiredIteratorException") ->
              `ExpiredIteratorException
                (expired_iterator_exception_of_yojson tree path)
          | (_, "InvalidArgumentException") ->
              `InvalidArgumentException
                (invalid_argument_exception_of_yojson tree path)
          | (_, "KMSAccessDeniedException") ->
              `KMSAccessDeniedException
                (kms_access_denied_exception_of_yojson tree path)
          | (_, "KMSDisabledException") ->
              `KMSDisabledException
                (kms_disabled_exception_of_yojson tree path)
          | (_, "KMSInvalidStateException") ->
              `KMSInvalidStateException
                (kms_invalid_state_exception_of_yojson tree path)
          | (_, "KMSNotFoundException") ->
              `KMSNotFoundException
                (kms_not_found_exception_of_yojson tree path)
          | (_, "KMSOptInRequired") ->
              `KMSOptInRequired (kms_opt_in_required_of_yojson tree path)
          | (_, "KMSThrottlingException") ->
              `KMSThrottlingException
                (kms_throttling_exception_of_yojson tree path)
          | (_, "ProvisionedThroughputExceededException") ->
              `ProvisionedThroughputExceededException
                (provisioned_throughput_exceeded_exception_of_yojson tree
                   path)
          | (_, "ResourceNotFoundException") ->
              `ResourceNotFoundException
                (resource_not_found_exception_of_yojson tree path)
          | _type -> handler tree path _type in
        Smaws_Lib.Protocols.AwsJson.(error_deserializer
                                       (handler
                                          Smaws_Lib.Protocols.AwsJson.Errors.default_handler)
                                       tree path)
    let request context (request : get_records_input) =
      let open Smaws_Lib.Context in
        let open Deserializers in
          let input = Serializers.get_records_input_to_yojson request in
          Smaws_Lib.Protocols.AwsJson.request
            ~shape_name:"Kinesis_20131202GetRecords" ~service
            ~config:context.config ~http:context.http ~input
            ~output_deserializer:get_records_output_of_yojson
            ~error_deserializer
  end
module GetResourcePolicy =
  struct
    let error_deserializer tree path =
      let open Deserializers in
        let handler handler tree path =
          function
          | (_, "AccessDeniedException") ->
              `AccessDeniedException
                (access_denied_exception_of_yojson tree path)
          | (_, "InvalidArgumentException") ->
              `InvalidArgumentException
                (invalid_argument_exception_of_yojson tree path)
          | (_, "LimitExceededException") ->
              `LimitExceededException
                (limit_exceeded_exception_of_yojson tree path)
          | (_, "ResourceNotFoundException") ->
              `ResourceNotFoundException
                (resource_not_found_exception_of_yojson tree path)
          | _type -> handler tree path _type in
        Smaws_Lib.Protocols.AwsJson.(error_deserializer
                                       (handler
                                          Smaws_Lib.Protocols.AwsJson.Errors.default_handler)
                                       tree path)
    let request context (request : get_resource_policy_input) =
      let open Smaws_Lib.Context in
        let open Deserializers in
          let input = Serializers.get_resource_policy_input_to_yojson request in
          Smaws_Lib.Protocols.AwsJson.request
            ~shape_name:"Kinesis_20131202GetResourcePolicy" ~service
            ~config:context.config ~http:context.http ~input
            ~output_deserializer:get_resource_policy_output_of_yojson
            ~error_deserializer
  end
module GetShardIterator =
  struct
    let error_deserializer tree path =
      let open Deserializers in
        let handler handler tree path =
          function
          | (_, "AccessDeniedException") ->
              `AccessDeniedException
                (access_denied_exception_of_yojson tree path)
          | (_, "InvalidArgumentException") ->
              `InvalidArgumentException
                (invalid_argument_exception_of_yojson tree path)
          | (_, "ProvisionedThroughputExceededException") ->
              `ProvisionedThroughputExceededException
                (provisioned_throughput_exceeded_exception_of_yojson tree
                   path)
          | (_, "ResourceNotFoundException") ->
              `ResourceNotFoundException
                (resource_not_found_exception_of_yojson tree path)
          | _type -> handler tree path _type in
        Smaws_Lib.Protocols.AwsJson.(error_deserializer
                                       (handler
                                          Smaws_Lib.Protocols.AwsJson.Errors.default_handler)
                                       tree path)
    let request context (request : get_shard_iterator_input) =
      let open Smaws_Lib.Context in
        let open Deserializers in
          let input = Serializers.get_shard_iterator_input_to_yojson request in
          Smaws_Lib.Protocols.AwsJson.request
            ~shape_name:"Kinesis_20131202GetShardIterator" ~service
            ~config:context.config ~http:context.http ~input
            ~output_deserializer:get_shard_iterator_output_of_yojson
            ~error_deserializer
  end
module IncreaseStreamRetentionPeriod =
  struct
    let error_deserializer tree path =
      let open Deserializers in
        let handler handler tree path =
          function
          | (_, "AccessDeniedException") ->
              `AccessDeniedException
                (access_denied_exception_of_yojson tree path)
          | (_, "InvalidArgumentException") ->
              `InvalidArgumentException
                (invalid_argument_exception_of_yojson tree path)
          | (_, "LimitExceededException") ->
              `LimitExceededException
                (limit_exceeded_exception_of_yojson tree path)
          | (_, "ResourceInUseException") ->
              `ResourceInUseException
                (resource_in_use_exception_of_yojson tree path)
          | (_, "ResourceNotFoundException") ->
              `ResourceNotFoundException
                (resource_not_found_exception_of_yojson tree path)
          | _type -> handler tree path _type in
        Smaws_Lib.Protocols.AwsJson.(error_deserializer
                                       (handler
                                          Smaws_Lib.Protocols.AwsJson.Errors.default_handler)
                                       tree path)
    let request context (request : increase_stream_retention_period_input) =
      let open Smaws_Lib.Context in
        let open Deserializers in
          let input =
            Serializers.increase_stream_retention_period_input_to_yojson
              request in
          Smaws_Lib.Protocols.AwsJson.request
            ~shape_name:"Kinesis_20131202IncreaseStreamRetentionPeriod"
            ~service ~config:context.config ~http:context.http ~input
            ~output_deserializer:base_unit_of_yojson ~error_deserializer
  end
module ListShards =
  struct
    let error_deserializer tree path =
      let open Deserializers in
        let handler handler tree path =
          function
          | (_, "AccessDeniedException") ->
              `AccessDeniedException
                (access_denied_exception_of_yojson tree path)
          | (_, "ExpiredNextTokenException") ->
              `ExpiredNextTokenException
                (expired_next_token_exception_of_yojson tree path)
          | (_, "InvalidArgumentException") ->
              `InvalidArgumentException
                (invalid_argument_exception_of_yojson tree path)
          | (_, "LimitExceededException") ->
              `LimitExceededException
                (limit_exceeded_exception_of_yojson tree path)
          | (_, "ResourceInUseException") ->
              `ResourceInUseException
                (resource_in_use_exception_of_yojson tree path)
          | (_, "ResourceNotFoundException") ->
              `ResourceNotFoundException
                (resource_not_found_exception_of_yojson tree path)
          | _type -> handler tree path _type in
        Smaws_Lib.Protocols.AwsJson.(error_deserializer
                                       (handler
                                          Smaws_Lib.Protocols.AwsJson.Errors.default_handler)
                                       tree path)
    let request context (request : list_shards_input) =
      let open Smaws_Lib.Context in
        let open Deserializers in
          let input = Serializers.list_shards_input_to_yojson request in
          Smaws_Lib.Protocols.AwsJson.request
            ~shape_name:"Kinesis_20131202ListShards" ~service
            ~config:context.config ~http:context.http ~input
            ~output_deserializer:list_shards_output_of_yojson
            ~error_deserializer
  end
module ListStreamConsumers =
  struct
    let error_deserializer tree path =
      let open Deserializers in
        let handler handler tree path =
          function
          | (_, "ExpiredNextTokenException") ->
              `ExpiredNextTokenException
                (expired_next_token_exception_of_yojson tree path)
          | (_, "InvalidArgumentException") ->
              `InvalidArgumentException
                (invalid_argument_exception_of_yojson tree path)
          | (_, "LimitExceededException") ->
              `LimitExceededException
                (limit_exceeded_exception_of_yojson tree path)
          | (_, "ResourceInUseException") ->
              `ResourceInUseException
                (resource_in_use_exception_of_yojson tree path)
          | (_, "ResourceNotFoundException") ->
              `ResourceNotFoundException
                (resource_not_found_exception_of_yojson tree path)
          | _type -> handler tree path _type in
        Smaws_Lib.Protocols.AwsJson.(error_deserializer
                                       (handler
                                          Smaws_Lib.Protocols.AwsJson.Errors.default_handler)
                                       tree path)
    let request context (request : list_stream_consumers_input) =
      let open Smaws_Lib.Context in
        let open Deserializers in
          let input =
            Serializers.list_stream_consumers_input_to_yojson request in
          Smaws_Lib.Protocols.AwsJson.request
            ~shape_name:"Kinesis_20131202ListStreamConsumers" ~service
            ~config:context.config ~http:context.http ~input
            ~output_deserializer:list_stream_consumers_output_of_yojson
            ~error_deserializer
  end
module ListStreams =
  struct
    let error_deserializer tree path =
      let open Deserializers in
        let handler handler tree path =
          function
          | (_, "ExpiredNextTokenException") ->
              `ExpiredNextTokenException
                (expired_next_token_exception_of_yojson tree path)
          | (_, "InvalidArgumentException") ->
              `InvalidArgumentException
                (invalid_argument_exception_of_yojson tree path)
          | (_, "LimitExceededException") ->
              `LimitExceededException
                (limit_exceeded_exception_of_yojson tree path)
          | _type -> handler tree path _type in
        Smaws_Lib.Protocols.AwsJson.(error_deserializer
                                       (handler
                                          Smaws_Lib.Protocols.AwsJson.Errors.default_handler)
                                       tree path)
    let request context (request : list_streams_input) =
      let open Smaws_Lib.Context in
        let open Deserializers in
          let input = Serializers.list_streams_input_to_yojson request in
          Smaws_Lib.Protocols.AwsJson.request
            ~shape_name:"Kinesis_20131202ListStreams" ~service
            ~config:context.config ~http:context.http ~input
            ~output_deserializer:list_streams_output_of_yojson
            ~error_deserializer
  end
module ListTagsForStream =
  struct
    let error_deserializer tree path =
      let open Deserializers in
        let handler handler tree path =
          function
          | (_, "AccessDeniedException") ->
              `AccessDeniedException
                (access_denied_exception_of_yojson tree path)
          | (_, "InvalidArgumentException") ->
              `InvalidArgumentException
                (invalid_argument_exception_of_yojson tree path)
          | (_, "LimitExceededException") ->
              `LimitExceededException
                (limit_exceeded_exception_of_yojson tree path)
          | (_, "ResourceNotFoundException") ->
              `ResourceNotFoundException
                (resource_not_found_exception_of_yojson tree path)
          | _type -> handler tree path _type in
        Smaws_Lib.Protocols.AwsJson.(error_deserializer
                                       (handler
                                          Smaws_Lib.Protocols.AwsJson.Errors.default_handler)
                                       tree path)
    let request context (request : list_tags_for_stream_input) =
      let open Smaws_Lib.Context in
        let open Deserializers in
          let input =
            Serializers.list_tags_for_stream_input_to_yojson request in
          Smaws_Lib.Protocols.AwsJson.request
            ~shape_name:"Kinesis_20131202ListTagsForStream" ~service
            ~config:context.config ~http:context.http ~input
            ~output_deserializer:list_tags_for_stream_output_of_yojson
            ~error_deserializer
  end
module MergeShards =
  struct
    let error_deserializer tree path =
      let open Deserializers in
        let handler handler tree path =
          function
          | (_, "AccessDeniedException") ->
              `AccessDeniedException
                (access_denied_exception_of_yojson tree path)
          | (_, "InvalidArgumentException") ->
              `InvalidArgumentException
                (invalid_argument_exception_of_yojson tree path)
          | (_, "LimitExceededException") ->
              `LimitExceededException
                (limit_exceeded_exception_of_yojson tree path)
          | (_, "ResourceInUseException") ->
              `ResourceInUseException
                (resource_in_use_exception_of_yojson tree path)
          | (_, "ResourceNotFoundException") ->
              `ResourceNotFoundException
                (resource_not_found_exception_of_yojson tree path)
          | (_, "ValidationException") ->
              `ValidationException (validation_exception_of_yojson tree path)
          | _type -> handler tree path _type in
        Smaws_Lib.Protocols.AwsJson.(error_deserializer
                                       (handler
                                          Smaws_Lib.Protocols.AwsJson.Errors.default_handler)
                                       tree path)
    let request context (request : merge_shards_input) =
      let open Smaws_Lib.Context in
        let open Deserializers in
          let input = Serializers.merge_shards_input_to_yojson request in
          Smaws_Lib.Protocols.AwsJson.request
            ~shape_name:"Kinesis_20131202MergeShards" ~service
            ~config:context.config ~http:context.http ~input
            ~output_deserializer:base_unit_of_yojson ~error_deserializer
  end
module PutRecord =
  struct
    let error_deserializer tree path =
      let open Deserializers in
        let handler handler tree path =
          function
          | (_, "AccessDeniedException") ->
              `AccessDeniedException
                (access_denied_exception_of_yojson tree path)
          | (_, "InvalidArgumentException") ->
              `InvalidArgumentException
                (invalid_argument_exception_of_yojson tree path)
          | (_, "KMSAccessDeniedException") ->
              `KMSAccessDeniedException
                (kms_access_denied_exception_of_yojson tree path)
          | (_, "KMSDisabledException") ->
              `KMSDisabledException
                (kms_disabled_exception_of_yojson tree path)
          | (_, "KMSInvalidStateException") ->
              `KMSInvalidStateException
                (kms_invalid_state_exception_of_yojson tree path)
          | (_, "KMSNotFoundException") ->
              `KMSNotFoundException
                (kms_not_found_exception_of_yojson tree path)
          | (_, "KMSOptInRequired") ->
              `KMSOptInRequired (kms_opt_in_required_of_yojson tree path)
          | (_, "KMSThrottlingException") ->
              `KMSThrottlingException
                (kms_throttling_exception_of_yojson tree path)
          | (_, "ProvisionedThroughputExceededException") ->
              `ProvisionedThroughputExceededException
                (provisioned_throughput_exceeded_exception_of_yojson tree
                   path)
          | (_, "ResourceNotFoundException") ->
              `ResourceNotFoundException
                (resource_not_found_exception_of_yojson tree path)
          | _type -> handler tree path _type in
        Smaws_Lib.Protocols.AwsJson.(error_deserializer
                                       (handler
                                          Smaws_Lib.Protocols.AwsJson.Errors.default_handler)
                                       tree path)
    let request context (request : put_record_input) =
      let open Smaws_Lib.Context in
        let open Deserializers in
          let input = Serializers.put_record_input_to_yojson request in
          Smaws_Lib.Protocols.AwsJson.request
            ~shape_name:"Kinesis_20131202PutRecord" ~service
            ~config:context.config ~http:context.http ~input
            ~output_deserializer:put_record_output_of_yojson
            ~error_deserializer
  end
module PutRecords =
  struct
    let error_deserializer tree path =
      let open Deserializers in
        let handler handler tree path =
          function
          | (_, "AccessDeniedException") ->
              `AccessDeniedException
                (access_denied_exception_of_yojson tree path)
          | (_, "InvalidArgumentException") ->
              `InvalidArgumentException
                (invalid_argument_exception_of_yojson tree path)
          | (_, "KMSAccessDeniedException") ->
              `KMSAccessDeniedException
                (kms_access_denied_exception_of_yojson tree path)
          | (_, "KMSDisabledException") ->
              `KMSDisabledException
                (kms_disabled_exception_of_yojson tree path)
          | (_, "KMSInvalidStateException") ->
              `KMSInvalidStateException
                (kms_invalid_state_exception_of_yojson tree path)
          | (_, "KMSNotFoundException") ->
              `KMSNotFoundException
                (kms_not_found_exception_of_yojson tree path)
          | (_, "KMSOptInRequired") ->
              `KMSOptInRequired (kms_opt_in_required_of_yojson tree path)
          | (_, "KMSThrottlingException") ->
              `KMSThrottlingException
                (kms_throttling_exception_of_yojson tree path)
          | (_, "ProvisionedThroughputExceededException") ->
              `ProvisionedThroughputExceededException
                (provisioned_throughput_exceeded_exception_of_yojson tree
                   path)
          | (_, "ResourceNotFoundException") ->
              `ResourceNotFoundException
                (resource_not_found_exception_of_yojson tree path)
          | _type -> handler tree path _type in
        Smaws_Lib.Protocols.AwsJson.(error_deserializer
                                       (handler
                                          Smaws_Lib.Protocols.AwsJson.Errors.default_handler)
                                       tree path)
    let request context (request : put_records_input) =
      let open Smaws_Lib.Context in
        let open Deserializers in
          let input = Serializers.put_records_input_to_yojson request in
          Smaws_Lib.Protocols.AwsJson.request
            ~shape_name:"Kinesis_20131202PutRecords" ~service
            ~config:context.config ~http:context.http ~input
            ~output_deserializer:put_records_output_of_yojson
            ~error_deserializer
  end
module PutResourcePolicy =
  struct
    let error_deserializer tree path =
      let open Deserializers in
        let handler handler tree path =
          function
          | (_, "AccessDeniedException") ->
              `AccessDeniedException
                (access_denied_exception_of_yojson tree path)
          | (_, "InvalidArgumentException") ->
              `InvalidArgumentException
                (invalid_argument_exception_of_yojson tree path)
          | (_, "LimitExceededException") ->
              `LimitExceededException
                (limit_exceeded_exception_of_yojson tree path)
          | (_, "ResourceInUseException") ->
              `ResourceInUseException
                (resource_in_use_exception_of_yojson tree path)
          | (_, "ResourceNotFoundException") ->
              `ResourceNotFoundException
                (resource_not_found_exception_of_yojson tree path)
          | _type -> handler tree path _type in
        Smaws_Lib.Protocols.AwsJson.(error_deserializer
                                       (handler
                                          Smaws_Lib.Protocols.AwsJson.Errors.default_handler)
                                       tree path)
    let request context (request : put_resource_policy_input) =
      let open Smaws_Lib.Context in
        let open Deserializers in
          let input = Serializers.put_resource_policy_input_to_yojson request in
          Smaws_Lib.Protocols.AwsJson.request
            ~shape_name:"Kinesis_20131202PutResourcePolicy" ~service
            ~config:context.config ~http:context.http ~input
            ~output_deserializer:base_unit_of_yojson ~error_deserializer
  end
module RegisterStreamConsumer =
  struct
    let error_deserializer tree path =
      let open Deserializers in
        let handler handler tree path =
          function
          | (_, "InvalidArgumentException") ->
              `InvalidArgumentException
                (invalid_argument_exception_of_yojson tree path)
          | (_, "LimitExceededException") ->
              `LimitExceededException
                (limit_exceeded_exception_of_yojson tree path)
          | (_, "ResourceInUseException") ->
              `ResourceInUseException
                (resource_in_use_exception_of_yojson tree path)
          | (_, "ResourceNotFoundException") ->
              `ResourceNotFoundException
                (resource_not_found_exception_of_yojson tree path)
          | _type -> handler tree path _type in
        Smaws_Lib.Protocols.AwsJson.(error_deserializer
                                       (handler
                                          Smaws_Lib.Protocols.AwsJson.Errors.default_handler)
                                       tree path)
    let request context (request : register_stream_consumer_input) =
      let open Smaws_Lib.Context in
        let open Deserializers in
          let input =
            Serializers.register_stream_consumer_input_to_yojson request in
          Smaws_Lib.Protocols.AwsJson.request
            ~shape_name:"Kinesis_20131202RegisterStreamConsumer" ~service
            ~config:context.config ~http:context.http ~input
            ~output_deserializer:register_stream_consumer_output_of_yojson
            ~error_deserializer
  end
module RemoveTagsFromStream =
  struct
    let error_deserializer tree path =
      let open Deserializers in
        let handler handler tree path =
          function
          | (_, "AccessDeniedException") ->
              `AccessDeniedException
                (access_denied_exception_of_yojson tree path)
          | (_, "InvalidArgumentException") ->
              `InvalidArgumentException
                (invalid_argument_exception_of_yojson tree path)
          | (_, "LimitExceededException") ->
              `LimitExceededException
                (limit_exceeded_exception_of_yojson tree path)
          | (_, "ResourceInUseException") ->
              `ResourceInUseException
                (resource_in_use_exception_of_yojson tree path)
          | (_, "ResourceNotFoundException") ->
              `ResourceNotFoundException
                (resource_not_found_exception_of_yojson tree path)
          | _type -> handler tree path _type in
        Smaws_Lib.Protocols.AwsJson.(error_deserializer
                                       (handler
                                          Smaws_Lib.Protocols.AwsJson.Errors.default_handler)
                                       tree path)
    let request context (request : remove_tags_from_stream_input) =
      let open Smaws_Lib.Context in
        let open Deserializers in
          let input =
            Serializers.remove_tags_from_stream_input_to_yojson request in
          Smaws_Lib.Protocols.AwsJson.request
            ~shape_name:"Kinesis_20131202RemoveTagsFromStream" ~service
            ~config:context.config ~http:context.http ~input
            ~output_deserializer:base_unit_of_yojson ~error_deserializer
  end
module SplitShard =
  struct
    let error_deserializer tree path =
      let open Deserializers in
        let handler handler tree path =
          function
          | (_, "AccessDeniedException") ->
              `AccessDeniedException
                (access_denied_exception_of_yojson tree path)
          | (_, "InvalidArgumentException") ->
              `InvalidArgumentException
                (invalid_argument_exception_of_yojson tree path)
          | (_, "LimitExceededException") ->
              `LimitExceededException
                (limit_exceeded_exception_of_yojson tree path)
          | (_, "ResourceInUseException") ->
              `ResourceInUseException
                (resource_in_use_exception_of_yojson tree path)
          | (_, "ResourceNotFoundException") ->
              `ResourceNotFoundException
                (resource_not_found_exception_of_yojson tree path)
          | (_, "ValidationException") ->
              `ValidationException (validation_exception_of_yojson tree path)
          | _type -> handler tree path _type in
        Smaws_Lib.Protocols.AwsJson.(error_deserializer
                                       (handler
                                          Smaws_Lib.Protocols.AwsJson.Errors.default_handler)
                                       tree path)
    let request context (request : split_shard_input) =
      let open Smaws_Lib.Context in
        let open Deserializers in
          let input = Serializers.split_shard_input_to_yojson request in
          Smaws_Lib.Protocols.AwsJson.request
            ~shape_name:"Kinesis_20131202SplitShard" ~service
            ~config:context.config ~http:context.http ~input
            ~output_deserializer:base_unit_of_yojson ~error_deserializer
  end
module StartStreamEncryption =
  struct
    let error_deserializer tree path =
      let open Deserializers in
        let handler handler tree path =
          function
          | (_, "AccessDeniedException") ->
              `AccessDeniedException
                (access_denied_exception_of_yojson tree path)
          | (_, "InvalidArgumentException") ->
              `InvalidArgumentException
                (invalid_argument_exception_of_yojson tree path)
          | (_, "KMSAccessDeniedException") ->
              `KMSAccessDeniedException
                (kms_access_denied_exception_of_yojson tree path)
          | (_, "KMSDisabledException") ->
              `KMSDisabledException
                (kms_disabled_exception_of_yojson tree path)
          | (_, "KMSInvalidStateException") ->
              `KMSInvalidStateException
                (kms_invalid_state_exception_of_yojson tree path)
          | (_, "KMSNotFoundException") ->
              `KMSNotFoundException
                (kms_not_found_exception_of_yojson tree path)
          | (_, "KMSOptInRequired") ->
              `KMSOptInRequired (kms_opt_in_required_of_yojson tree path)
          | (_, "KMSThrottlingException") ->
              `KMSThrottlingException
                (kms_throttling_exception_of_yojson tree path)
          | (_, "LimitExceededException") ->
              `LimitExceededException
                (limit_exceeded_exception_of_yojson tree path)
          | (_, "ResourceInUseException") ->
              `ResourceInUseException
                (resource_in_use_exception_of_yojson tree path)
          | (_, "ResourceNotFoundException") ->
              `ResourceNotFoundException
                (resource_not_found_exception_of_yojson tree path)
          | _type -> handler tree path _type in
        Smaws_Lib.Protocols.AwsJson.(error_deserializer
                                       (handler
                                          Smaws_Lib.Protocols.AwsJson.Errors.default_handler)
                                       tree path)
    let request context (request : start_stream_encryption_input) =
      let open Smaws_Lib.Context in
        let open Deserializers in
          let input =
            Serializers.start_stream_encryption_input_to_yojson request in
          Smaws_Lib.Protocols.AwsJson.request
            ~shape_name:"Kinesis_20131202StartStreamEncryption" ~service
            ~config:context.config ~http:context.http ~input
            ~output_deserializer:base_unit_of_yojson ~error_deserializer
  end
module StopStreamEncryption =
  struct
    let error_deserializer tree path =
      let open Deserializers in
        let handler handler tree path =
          function
          | (_, "AccessDeniedException") ->
              `AccessDeniedException
                (access_denied_exception_of_yojson tree path)
          | (_, "InvalidArgumentException") ->
              `InvalidArgumentException
                (invalid_argument_exception_of_yojson tree path)
          | (_, "LimitExceededException") ->
              `LimitExceededException
                (limit_exceeded_exception_of_yojson tree path)
          | (_, "ResourceInUseException") ->
              `ResourceInUseException
                (resource_in_use_exception_of_yojson tree path)
          | (_, "ResourceNotFoundException") ->
              `ResourceNotFoundException
                (resource_not_found_exception_of_yojson tree path)
          | _type -> handler tree path _type in
        Smaws_Lib.Protocols.AwsJson.(error_deserializer
                                       (handler
                                          Smaws_Lib.Protocols.AwsJson.Errors.default_handler)
                                       tree path)
    let request context (request : stop_stream_encryption_input) =
      let open Smaws_Lib.Context in
        let open Deserializers in
          let input =
            Serializers.stop_stream_encryption_input_to_yojson request in
          Smaws_Lib.Protocols.AwsJson.request
            ~shape_name:"Kinesis_20131202StopStreamEncryption" ~service
            ~config:context.config ~http:context.http ~input
            ~output_deserializer:base_unit_of_yojson ~error_deserializer
  end
module SubscribeToShard =
  struct
    let error_deserializer tree path =
      let open Deserializers in
        let handler handler tree path =
          function
          | (_, "AccessDeniedException") ->
              `AccessDeniedException
                (access_denied_exception_of_yojson tree path)
          | (_, "InvalidArgumentException") ->
              `InvalidArgumentException
                (invalid_argument_exception_of_yojson tree path)
          | (_, "LimitExceededException") ->
              `LimitExceededException
                (limit_exceeded_exception_of_yojson tree path)
          | (_, "ResourceInUseException") ->
              `ResourceInUseException
                (resource_in_use_exception_of_yojson tree path)
          | (_, "ResourceNotFoundException") ->
              `ResourceNotFoundException
                (resource_not_found_exception_of_yojson tree path)
          | _type -> handler tree path _type in
        Smaws_Lib.Protocols.AwsJson.(error_deserializer
                                       (handler
                                          Smaws_Lib.Protocols.AwsJson.Errors.default_handler)
                                       tree path)
    let request context (request : subscribe_to_shard_input) =
      let open Smaws_Lib.Context in
        let open Deserializers in
          let input = Serializers.subscribe_to_shard_input_to_yojson request in
          Smaws_Lib.Protocols.AwsJson.request
            ~shape_name:"Kinesis_20131202SubscribeToShard" ~service
            ~config:context.config ~http:context.http ~input
            ~output_deserializer:subscribe_to_shard_output_of_yojson
            ~error_deserializer
  end
module UpdateShardCount =
  struct
    let error_deserializer tree path =
      let open Deserializers in
        let handler handler tree path =
          function
          | (_, "AccessDeniedException") ->
              `AccessDeniedException
                (access_denied_exception_of_yojson tree path)
          | (_, "InvalidArgumentException") ->
              `InvalidArgumentException
                (invalid_argument_exception_of_yojson tree path)
          | (_, "LimitExceededException") ->
              `LimitExceededException
                (limit_exceeded_exception_of_yojson tree path)
          | (_, "ResourceInUseException") ->
              `ResourceInUseException
                (resource_in_use_exception_of_yojson tree path)
          | (_, "ResourceNotFoundException") ->
              `ResourceNotFoundException
                (resource_not_found_exception_of_yojson tree path)
          | (_, "ValidationException") ->
              `ValidationException (validation_exception_of_yojson tree path)
          | _type -> handler tree path _type in
        Smaws_Lib.Protocols.AwsJson.(error_deserializer
                                       (handler
                                          Smaws_Lib.Protocols.AwsJson.Errors.default_handler)
                                       tree path)
    let request context (request : update_shard_count_input) =
      let open Smaws_Lib.Context in
        let open Deserializers in
          let input = Serializers.update_shard_count_input_to_yojson request in
          Smaws_Lib.Protocols.AwsJson.request
            ~shape_name:"Kinesis_20131202UpdateShardCount" ~service
            ~config:context.config ~http:context.http ~input
            ~output_deserializer:update_shard_count_output_of_yojson
            ~error_deserializer
  end
module UpdateStreamMode =
  struct
    let error_deserializer tree path =
      let open Deserializers in
        let handler handler tree path =
          function
          | (_, "InvalidArgumentException") ->
              `InvalidArgumentException
                (invalid_argument_exception_of_yojson tree path)
          | (_, "LimitExceededException") ->
              `LimitExceededException
                (limit_exceeded_exception_of_yojson tree path)
          | (_, "ResourceInUseException") ->
              `ResourceInUseException
                (resource_in_use_exception_of_yojson tree path)
          | (_, "ResourceNotFoundException") ->
              `ResourceNotFoundException
                (resource_not_found_exception_of_yojson tree path)
          | _type -> handler tree path _type in
        Smaws_Lib.Protocols.AwsJson.(error_deserializer
                                       (handler
                                          Smaws_Lib.Protocols.AwsJson.Errors.default_handler)
                                       tree path)
    let request context (request : update_stream_mode_input) =
      let open Smaws_Lib.Context in
        let open Deserializers in
          let input = Serializers.update_stream_mode_input_to_yojson request in
          Smaws_Lib.Protocols.AwsJson.request
            ~shape_name:"Kinesis_20131202UpdateStreamMode" ~service
            ~config:context.config ~http:context.http ~input
            ~output_deserializer:base_unit_of_yojson ~error_deserializer
  end