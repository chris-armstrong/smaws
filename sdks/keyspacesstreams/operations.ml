open Types
open Service_metadata

module ListStreams = struct
  let error_to_string = function
    | `AccessDeniedException _ -> "com.amazonaws.keyspacesstreams#AccessDeniedException"
    | `InternalServerException _ -> "com.amazonaws.keyspacesstreams#InternalServerException"
    | `ResourceNotFoundException _ -> "com.amazonaws.keyspacesstreams#ResourceNotFoundException"
    | `ThrottlingException _ -> "com.amazonaws.keyspacesstreams#ThrottlingException"
    | `ValidationException _ -> "com.amazonaws.keyspacesstreams#ValidationException"
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

  let request context (request : list_streams_input) =
    let input = Json_serializers.list_streams_input_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"KeyspacesStreams.ListStreams" ~service ~context
      ~input ~output_deserializer:Json_deserializers.list_streams_output_of_yojson
      ~error_deserializer

  let request_with_metadata context (request : list_streams_input) =
    let input = Json_serializers.list_streams_input_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata ~shape_name:"KeyspacesStreams.ListStreams"
      ~service ~context ~input ~output_deserializer:Json_deserializers.list_streams_output_of_yojson
      ~error_deserializer
end

module GetStream = struct
  let error_to_string = function
    | `AccessDeniedException _ -> "com.amazonaws.keyspacesstreams#AccessDeniedException"
    | `InternalServerException _ -> "com.amazonaws.keyspacesstreams#InternalServerException"
    | `ResourceNotFoundException _ -> "com.amazonaws.keyspacesstreams#ResourceNotFoundException"
    | `ThrottlingException _ -> "com.amazonaws.keyspacesstreams#ThrottlingException"
    | `ValidationException _ -> "com.amazonaws.keyspacesstreams#ValidationException"
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

  let request context (request : get_stream_input) =
    let input = Json_serializers.get_stream_input_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"KeyspacesStreams.GetStream" ~service ~context
      ~input ~output_deserializer:Json_deserializers.get_stream_output_of_yojson ~error_deserializer

  let request_with_metadata context (request : get_stream_input) =
    let input = Json_serializers.get_stream_input_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata ~shape_name:"KeyspacesStreams.GetStream"
      ~service ~context ~input ~output_deserializer:Json_deserializers.get_stream_output_of_yojson
      ~error_deserializer
end

module GetShardIterator = struct
  let error_to_string = function
    | `AccessDeniedException _ -> "com.amazonaws.keyspacesstreams#AccessDeniedException"
    | `InternalServerException _ -> "com.amazonaws.keyspacesstreams#InternalServerException"
    | `ResourceNotFoundException _ -> "com.amazonaws.keyspacesstreams#ResourceNotFoundException"
    | `ThrottlingException _ -> "com.amazonaws.keyspacesstreams#ThrottlingException"
    | `ValidationException _ -> "com.amazonaws.keyspacesstreams#ValidationException"
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

  let request context (request : get_shard_iterator_input) =
    let input = Json_serializers.get_shard_iterator_input_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"KeyspacesStreams.GetShardIterator" ~service
      ~context ~input ~output_deserializer:Json_deserializers.get_shard_iterator_output_of_yojson
      ~error_deserializer

  let request_with_metadata context (request : get_shard_iterator_input) =
    let input = Json_serializers.get_shard_iterator_input_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata
      ~shape_name:"KeyspacesStreams.GetShardIterator" ~service ~context ~input
      ~output_deserializer:Json_deserializers.get_shard_iterator_output_of_yojson
      ~error_deserializer
end

module GetRecords = struct
  let error_to_string = function
    | `AccessDeniedException _ -> "com.amazonaws.keyspacesstreams#AccessDeniedException"
    | `InternalServerException _ -> "com.amazonaws.keyspacesstreams#InternalServerException"
    | `ResourceNotFoundException _ -> "com.amazonaws.keyspacesstreams#ResourceNotFoundException"
    | `ThrottlingException _ -> "com.amazonaws.keyspacesstreams#ThrottlingException"
    | `ValidationException _ -> "com.amazonaws.keyspacesstreams#ValidationException"
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

  let request context (request : get_records_input) =
    let input = Json_serializers.get_records_input_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"KeyspacesStreams.GetRecords" ~service ~context
      ~input ~output_deserializer:Json_deserializers.get_records_output_of_yojson
      ~error_deserializer

  let request_with_metadata context (request : get_records_input) =
    let input = Json_serializers.get_records_input_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata ~shape_name:"KeyspacesStreams.GetRecords"
      ~service ~context ~input ~output_deserializer:Json_deserializers.get_records_output_of_yojson
      ~error_deserializer
end
