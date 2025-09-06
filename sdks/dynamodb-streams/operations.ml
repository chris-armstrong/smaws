open Types
open Service_metadata
module DescribeStream =
  struct
    let error_deserializer tree path =
      let handler handler tree path =
        function
        | (_, "InternalServerError") ->
            `InternalServerError
              (Json_deserializers.internal_server_error_of_yojson tree path)
        | (_, "ResourceNotFoundException") ->
            `ResourceNotFoundException
              (Json_deserializers.resource_not_found_exception_of_yojson tree
                 path)
        | _type -> handler tree path _type in
      Smaws_Lib.Protocols.AwsJson.(error_deserializer
                                     (handler
                                        Smaws_Lib.Protocols.AwsJson.Errors.default_handler)
                                     tree path)
    let request context (request : describe_stream_input) =
      let open Smaws_Lib.Context in
        let input = Json_serializers.describe_stream_input_to_yojson request in
        Smaws_Lib.Protocols.AwsJson.request
          ~shape_name:"DynamoDBStreams_20120810DescribeStream" ~service
          ~config:context.config ~http:context.http ~input
          ~output_deserializer:Json_deserializers.describe_stream_output_of_yojson
          ~error_deserializer
  end
module GetRecords =
  struct
    let error_deserializer tree path =
      let handler handler tree path =
        function
        | (_, "ExpiredIteratorException") ->
            `ExpiredIteratorException
              (Json_deserializers.expired_iterator_exception_of_yojson tree
                 path)
        | (_, "InternalServerError") ->
            `InternalServerError
              (Json_deserializers.internal_server_error_of_yojson tree path)
        | (_, "LimitExceededException") ->
            `LimitExceededException
              (Json_deserializers.limit_exceeded_exception_of_yojson tree
                 path)
        | (_, "ResourceNotFoundException") ->
            `ResourceNotFoundException
              (Json_deserializers.resource_not_found_exception_of_yojson tree
                 path)
        | (_, "TrimmedDataAccessException") ->
            `TrimmedDataAccessException
              (Json_deserializers.trimmed_data_access_exception_of_yojson
                 tree path)
        | _type -> handler tree path _type in
      Smaws_Lib.Protocols.AwsJson.(error_deserializer
                                     (handler
                                        Smaws_Lib.Protocols.AwsJson.Errors.default_handler)
                                     tree path)
    let request context (request : get_records_input) =
      let open Smaws_Lib.Context in
        let input = Json_serializers.get_records_input_to_yojson request in
        Smaws_Lib.Protocols.AwsJson.request
          ~shape_name:"DynamoDBStreams_20120810GetRecords" ~service
          ~config:context.config ~http:context.http ~input
          ~output_deserializer:Json_deserializers.get_records_output_of_yojson
          ~error_deserializer
  end
module GetShardIterator =
  struct
    let error_deserializer tree path =
      let handler handler tree path =
        function
        | (_, "InternalServerError") ->
            `InternalServerError
              (Json_deserializers.internal_server_error_of_yojson tree path)
        | (_, "ResourceNotFoundException") ->
            `ResourceNotFoundException
              (Json_deserializers.resource_not_found_exception_of_yojson tree
                 path)
        | (_, "TrimmedDataAccessException") ->
            `TrimmedDataAccessException
              (Json_deserializers.trimmed_data_access_exception_of_yojson
                 tree path)
        | _type -> handler tree path _type in
      Smaws_Lib.Protocols.AwsJson.(error_deserializer
                                     (handler
                                        Smaws_Lib.Protocols.AwsJson.Errors.default_handler)
                                     tree path)
    let request context (request : get_shard_iterator_input) =
      let open Smaws_Lib.Context in
        let input =
          Json_serializers.get_shard_iterator_input_to_yojson request in
        Smaws_Lib.Protocols.AwsJson.request
          ~shape_name:"DynamoDBStreams_20120810GetShardIterator" ~service
          ~config:context.config ~http:context.http ~input
          ~output_deserializer:Json_deserializers.get_shard_iterator_output_of_yojson
          ~error_deserializer
  end
module ListStreams =
  struct
    let error_deserializer tree path =
      let handler handler tree path =
        function
        | (_, "InternalServerError") ->
            `InternalServerError
              (Json_deserializers.internal_server_error_of_yojson tree path)
        | (_, "ResourceNotFoundException") ->
            `ResourceNotFoundException
              (Json_deserializers.resource_not_found_exception_of_yojson tree
                 path)
        | _type -> handler tree path _type in
      Smaws_Lib.Protocols.AwsJson.(error_deserializer
                                     (handler
                                        Smaws_Lib.Protocols.AwsJson.Errors.default_handler)
                                     tree path)
    let request context (request : list_streams_input) =
      let open Smaws_Lib.Context in
        let input = Json_serializers.list_streams_input_to_yojson request in
        Smaws_Lib.Protocols.AwsJson.request
          ~shape_name:"DynamoDBStreams_20120810ListStreams" ~service
          ~config:context.config ~http:context.http ~input
          ~output_deserializer:Json_deserializers.list_streams_output_of_yojson
          ~error_deserializer
  end