open Types
open Service_metadata
module DescribeStream =
  struct
    let error_deserializer tree path =
      let open Deserializers in
        let handler handler tree path =
          function
          | (_, "InternalServerError") ->
              `InternalServerError
                (internal_server_error_of_yojson tree path)
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
          Smaws_Lib.Protocols.AwsJson.request_with_http_module
            ~http_module:(Smaws_Lib.Context.http_module context)
            ~http:context.http
            ~shape_name:"DynamoDBStreams_20120810DescribeStream" ~service
            ~config:context.config ~input
            ~output_deserializer:describe_stream_output_of_yojson
            ~error_deserializer
  end
module GetRecords =
  struct
    let error_deserializer tree path =
      let open Deserializers in
        let handler handler tree path =
          function
          | (_, "ExpiredIteratorException") ->
              `ExpiredIteratorException
                (expired_iterator_exception_of_yojson tree path)
          | (_, "InternalServerError") ->
              `InternalServerError
                (internal_server_error_of_yojson tree path)
          | (_, "LimitExceededException") ->
              `LimitExceededException
                (limit_exceeded_exception_of_yojson tree path)
          | (_, "ResourceNotFoundException") ->
              `ResourceNotFoundException
                (resource_not_found_exception_of_yojson tree path)
          | (_, "TrimmedDataAccessException") ->
              `TrimmedDataAccessException
                (trimmed_data_access_exception_of_yojson tree path)
          | _type -> handler tree path _type in
        Smaws_Lib.Protocols.AwsJson.(error_deserializer
                                       (handler
                                          Smaws_Lib.Protocols.AwsJson.Errors.default_handler)
                                       tree path)
    let request context (request : get_records_input) =
      let open Smaws_Lib.Context in
        let open Deserializers in
          let input = Serializers.get_records_input_to_yojson request in
          Smaws_Lib.Protocols.AwsJson.request_with_http_module
            ~http_module:(Smaws_Lib.Context.http_module context)
            ~http:context.http
            ~shape_name:"DynamoDBStreams_20120810GetRecords" ~service
            ~config:context.config ~input
            ~output_deserializer:get_records_output_of_yojson
            ~error_deserializer
  end
module GetShardIterator =
  struct
    let error_deserializer tree path =
      let open Deserializers in
        let handler handler tree path =
          function
          | (_, "InternalServerError") ->
              `InternalServerError
                (internal_server_error_of_yojson tree path)
          | (_, "ResourceNotFoundException") ->
              `ResourceNotFoundException
                (resource_not_found_exception_of_yojson tree path)
          | (_, "TrimmedDataAccessException") ->
              `TrimmedDataAccessException
                (trimmed_data_access_exception_of_yojson tree path)
          | _type -> handler tree path _type in
        Smaws_Lib.Protocols.AwsJson.(error_deserializer
                                       (handler
                                          Smaws_Lib.Protocols.AwsJson.Errors.default_handler)
                                       tree path)
    let request context (request : get_shard_iterator_input) =
      let open Smaws_Lib.Context in
        let open Deserializers in
          let input = Serializers.get_shard_iterator_input_to_yojson request in
          Smaws_Lib.Protocols.AwsJson.request_with_http_module
            ~http_module:(Smaws_Lib.Context.http_module context)
            ~http:context.http
            ~shape_name:"DynamoDBStreams_20120810GetShardIterator" ~service
            ~config:context.config ~input
            ~output_deserializer:get_shard_iterator_output_of_yojson
            ~error_deserializer
  end
module ListStreams =
  struct
    let error_deserializer tree path =
      let open Deserializers in
        let handler handler tree path =
          function
          | (_, "InternalServerError") ->
              `InternalServerError
                (internal_server_error_of_yojson tree path)
          | (_, "ResourceNotFoundException") ->
              `ResourceNotFoundException
                (resource_not_found_exception_of_yojson tree path)
          | _type -> handler tree path _type in
        Smaws_Lib.Protocols.AwsJson.(error_deserializer
                                       (handler
                                          Smaws_Lib.Protocols.AwsJson.Errors.default_handler)
                                       tree path)
    let request context (request : list_streams_input) =
      let open Smaws_Lib.Context in
        let open Deserializers in
          let input = Serializers.list_streams_input_to_yojson request in
          Smaws_Lib.Protocols.AwsJson.request_with_http_module
            ~http_module:(Smaws_Lib.Context.http_module context)
            ~http:context.http
            ~shape_name:"DynamoDBStreams_20120810ListStreams" ~service
            ~config:context.config ~input
            ~output_deserializer:list_streams_output_of_yojson
            ~error_deserializer
  end