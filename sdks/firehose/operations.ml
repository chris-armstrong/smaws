open Types
open Service_metadata

module ListDeliveryStreams = struct
  let error_to_string = Smaws_Lib.Protocols.AwsJson.error_to_string

  let error_deserializer tree path =
    let handler a = a in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : list_delivery_streams_input) =
    let input = Json_serializers.list_delivery_streams_input_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"Firehose_20150804.ListDeliveryStreams" ~service
      ~context ~input ~output_deserializer:Json_deserializers.list_delivery_streams_output_of_yojson
      ~error_deserializer

  let request_with_metadata context (request : list_delivery_streams_input) =
    let input = Json_serializers.list_delivery_streams_input_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata
      ~shape_name:"Firehose_20150804.ListDeliveryStreams" ~service ~context ~input
      ~output_deserializer:Json_deserializers.list_delivery_streams_output_of_yojson
      ~error_deserializer
end

module ListTagsForDeliveryStream = struct
  let error_to_string = function
    | `InvalidArgumentException _ -> "com.amazonaws.firehose#InvalidArgumentException"
    | `LimitExceededException _ -> "com.amazonaws.firehose#LimitExceededException"
    | `ResourceNotFoundException _ -> "com.amazonaws.firehose#ResourceNotFoundException"
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

  let request context (request : list_tags_for_delivery_stream_input) =
    let input = Json_serializers.list_tags_for_delivery_stream_input_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"Firehose_20150804.ListTagsForDeliveryStream"
      ~service ~context ~input
      ~output_deserializer:Json_deserializers.list_tags_for_delivery_stream_output_of_yojson
      ~error_deserializer

  let request_with_metadata context (request : list_tags_for_delivery_stream_input) =
    let input = Json_serializers.list_tags_for_delivery_stream_input_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata
      ~shape_name:"Firehose_20150804.ListTagsForDeliveryStream" ~service ~context ~input
      ~output_deserializer:Json_deserializers.list_tags_for_delivery_stream_output_of_yojson
      ~error_deserializer
end

module PutRecord = struct
  let error_to_string = function
    | `InvalidArgumentException _ -> "com.amazonaws.firehose#InvalidArgumentException"
    | `InvalidKMSResourceException _ -> "com.amazonaws.firehose#InvalidKMSResourceException"
    | `InvalidSourceException _ -> "com.amazonaws.firehose#InvalidSourceException"
    | `ResourceNotFoundException _ -> "com.amazonaws.firehose#ResourceNotFoundException"
    | `ServiceUnavailableException _ -> "com.amazonaws.firehose#ServiceUnavailableException"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "InvalidArgumentException" ->
          `InvalidArgumentException
            (Json_deserializers.invalid_argument_exception_of_yojson tree path)
      | _, "InvalidKMSResourceException" ->
          `InvalidKMSResourceException
            (Json_deserializers.invalid_kms_resource_exception_of_yojson tree path)
      | _, "InvalidSourceException" ->
          `InvalidSourceException (Json_deserializers.invalid_source_exception_of_yojson tree path)
      | _, "ResourceNotFoundException" ->
          `ResourceNotFoundException
            (Json_deserializers.resource_not_found_exception_of_yojson tree path)
      | _, "ServiceUnavailableException" ->
          `ServiceUnavailableException
            (Json_deserializers.service_unavailable_exception_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : put_record_input) =
    let input = Json_serializers.put_record_input_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"Firehose_20150804.PutRecord" ~service ~context
      ~input ~output_deserializer:Json_deserializers.put_record_output_of_yojson ~error_deserializer

  let request_with_metadata context (request : put_record_input) =
    let input = Json_serializers.put_record_input_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata ~shape_name:"Firehose_20150804.PutRecord"
      ~service ~context ~input ~output_deserializer:Json_deserializers.put_record_output_of_yojson
      ~error_deserializer
end

module PutRecordBatch = struct
  let error_to_string = function
    | `InvalidArgumentException _ -> "com.amazonaws.firehose#InvalidArgumentException"
    | `InvalidKMSResourceException _ -> "com.amazonaws.firehose#InvalidKMSResourceException"
    | `InvalidSourceException _ -> "com.amazonaws.firehose#InvalidSourceException"
    | `ResourceNotFoundException _ -> "com.amazonaws.firehose#ResourceNotFoundException"
    | `ServiceUnavailableException _ -> "com.amazonaws.firehose#ServiceUnavailableException"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "InvalidArgumentException" ->
          `InvalidArgumentException
            (Json_deserializers.invalid_argument_exception_of_yojson tree path)
      | _, "InvalidKMSResourceException" ->
          `InvalidKMSResourceException
            (Json_deserializers.invalid_kms_resource_exception_of_yojson tree path)
      | _, "InvalidSourceException" ->
          `InvalidSourceException (Json_deserializers.invalid_source_exception_of_yojson tree path)
      | _, "ResourceNotFoundException" ->
          `ResourceNotFoundException
            (Json_deserializers.resource_not_found_exception_of_yojson tree path)
      | _, "ServiceUnavailableException" ->
          `ServiceUnavailableException
            (Json_deserializers.service_unavailable_exception_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : put_record_batch_input) =
    let input = Json_serializers.put_record_batch_input_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"Firehose_20150804.PutRecordBatch" ~service
      ~context ~input ~output_deserializer:Json_deserializers.put_record_batch_output_of_yojson
      ~error_deserializer

  let request_with_metadata context (request : put_record_batch_input) =
    let input = Json_serializers.put_record_batch_input_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata ~shape_name:"Firehose_20150804.PutRecordBatch"
      ~service ~context ~input
      ~output_deserializer:Json_deserializers.put_record_batch_output_of_yojson ~error_deserializer
end

module StartDeliveryStreamEncryption = struct
  let error_to_string = function
    | `InvalidArgumentException _ -> "com.amazonaws.firehose#InvalidArgumentException"
    | `InvalidKMSResourceException _ -> "com.amazonaws.firehose#InvalidKMSResourceException"
    | `LimitExceededException _ -> "com.amazonaws.firehose#LimitExceededException"
    | `ResourceInUseException _ -> "com.amazonaws.firehose#ResourceInUseException"
    | `ResourceNotFoundException _ -> "com.amazonaws.firehose#ResourceNotFoundException"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "InvalidArgumentException" ->
          `InvalidArgumentException
            (Json_deserializers.invalid_argument_exception_of_yojson tree path)
      | _, "InvalidKMSResourceException" ->
          `InvalidKMSResourceException
            (Json_deserializers.invalid_kms_resource_exception_of_yojson tree path)
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

  let request context (request : start_delivery_stream_encryption_input) =
    let input = Json_serializers.start_delivery_stream_encryption_input_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request
      ~shape_name:"Firehose_20150804.StartDeliveryStreamEncryption" ~service ~context ~input
      ~output_deserializer:Json_deserializers.start_delivery_stream_encryption_output_of_yojson
      ~error_deserializer

  let request_with_metadata context (request : start_delivery_stream_encryption_input) =
    let input = Json_serializers.start_delivery_stream_encryption_input_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata
      ~shape_name:"Firehose_20150804.StartDeliveryStreamEncryption" ~service ~context ~input
      ~output_deserializer:Json_deserializers.start_delivery_stream_encryption_output_of_yojson
      ~error_deserializer
end

module StopDeliveryStreamEncryption = struct
  let error_to_string = function
    | `InvalidArgumentException _ -> "com.amazonaws.firehose#InvalidArgumentException"
    | `LimitExceededException _ -> "com.amazonaws.firehose#LimitExceededException"
    | `ResourceInUseException _ -> "com.amazonaws.firehose#ResourceInUseException"
    | `ResourceNotFoundException _ -> "com.amazonaws.firehose#ResourceNotFoundException"
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

  let request context (request : stop_delivery_stream_encryption_input) =
    let input = Json_serializers.stop_delivery_stream_encryption_input_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"Firehose_20150804.StopDeliveryStreamEncryption"
      ~service ~context ~input
      ~output_deserializer:Json_deserializers.stop_delivery_stream_encryption_output_of_yojson
      ~error_deserializer

  let request_with_metadata context (request : stop_delivery_stream_encryption_input) =
    let input = Json_serializers.stop_delivery_stream_encryption_input_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata
      ~shape_name:"Firehose_20150804.StopDeliveryStreamEncryption" ~service ~context ~input
      ~output_deserializer:Json_deserializers.stop_delivery_stream_encryption_output_of_yojson
      ~error_deserializer
end

module TagDeliveryStream = struct
  let error_to_string = function
    | `InvalidArgumentException _ -> "com.amazonaws.firehose#InvalidArgumentException"
    | `LimitExceededException _ -> "com.amazonaws.firehose#LimitExceededException"
    | `ResourceInUseException _ -> "com.amazonaws.firehose#ResourceInUseException"
    | `ResourceNotFoundException _ -> "com.amazonaws.firehose#ResourceNotFoundException"
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

  let request context (request : tag_delivery_stream_input) =
    let input = Json_serializers.tag_delivery_stream_input_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"Firehose_20150804.TagDeliveryStream" ~service
      ~context ~input ~output_deserializer:Json_deserializers.tag_delivery_stream_output_of_yojson
      ~error_deserializer

  let request_with_metadata context (request : tag_delivery_stream_input) =
    let input = Json_serializers.tag_delivery_stream_input_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata
      ~shape_name:"Firehose_20150804.TagDeliveryStream" ~service ~context ~input
      ~output_deserializer:Json_deserializers.tag_delivery_stream_output_of_yojson
      ~error_deserializer
end

module UntagDeliveryStream = struct
  let error_to_string = function
    | `InvalidArgumentException _ -> "com.amazonaws.firehose#InvalidArgumentException"
    | `LimitExceededException _ -> "com.amazonaws.firehose#LimitExceededException"
    | `ResourceInUseException _ -> "com.amazonaws.firehose#ResourceInUseException"
    | `ResourceNotFoundException _ -> "com.amazonaws.firehose#ResourceNotFoundException"
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

  let request context (request : untag_delivery_stream_input) =
    let input = Json_serializers.untag_delivery_stream_input_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"Firehose_20150804.UntagDeliveryStream" ~service
      ~context ~input ~output_deserializer:Json_deserializers.untag_delivery_stream_output_of_yojson
      ~error_deserializer

  let request_with_metadata context (request : untag_delivery_stream_input) =
    let input = Json_serializers.untag_delivery_stream_input_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata
      ~shape_name:"Firehose_20150804.UntagDeliveryStream" ~service ~context ~input
      ~output_deserializer:Json_deserializers.untag_delivery_stream_output_of_yojson
      ~error_deserializer
end

module UpdateDestination = struct
  let error_to_string = function
    | `ConcurrentModificationException _ -> "com.amazonaws.firehose#ConcurrentModificationException"
    | `InvalidArgumentException _ -> "com.amazonaws.firehose#InvalidArgumentException"
    | `ResourceInUseException _ -> "com.amazonaws.firehose#ResourceInUseException"
    | `ResourceNotFoundException _ -> "com.amazonaws.firehose#ResourceNotFoundException"
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
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : update_destination_input) =
    let input = Json_serializers.update_destination_input_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"Firehose_20150804.UpdateDestination" ~service
      ~context ~input ~output_deserializer:Json_deserializers.update_destination_output_of_yojson
      ~error_deserializer

  let request_with_metadata context (request : update_destination_input) =
    let input = Json_serializers.update_destination_input_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata
      ~shape_name:"Firehose_20150804.UpdateDestination" ~service ~context ~input
      ~output_deserializer:Json_deserializers.update_destination_output_of_yojson
      ~error_deserializer
end

module DescribeDeliveryStream = struct
  let error_to_string = function
    | `ResourceNotFoundException _ -> "com.amazonaws.firehose#ResourceNotFoundException"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "ResourceNotFoundException" ->
          `ResourceNotFoundException
            (Json_deserializers.resource_not_found_exception_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : describe_delivery_stream_input) =
    let input = Json_serializers.describe_delivery_stream_input_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"Firehose_20150804.DescribeDeliveryStream"
      ~service ~context ~input
      ~output_deserializer:Json_deserializers.describe_delivery_stream_output_of_yojson
      ~error_deserializer

  let request_with_metadata context (request : describe_delivery_stream_input) =
    let input = Json_serializers.describe_delivery_stream_input_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata
      ~shape_name:"Firehose_20150804.DescribeDeliveryStream" ~service ~context ~input
      ~output_deserializer:Json_deserializers.describe_delivery_stream_output_of_yojson
      ~error_deserializer
end

module DeleteDeliveryStream = struct
  let error_to_string = function
    | `ResourceInUseException _ -> "com.amazonaws.firehose#ResourceInUseException"
    | `ResourceNotFoundException _ -> "com.amazonaws.firehose#ResourceNotFoundException"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "ResourceInUseException" ->
          `ResourceInUseException (Json_deserializers.resource_in_use_exception_of_yojson tree path)
      | _, "ResourceNotFoundException" ->
          `ResourceNotFoundException
            (Json_deserializers.resource_not_found_exception_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : delete_delivery_stream_input) =
    let input = Json_serializers.delete_delivery_stream_input_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"Firehose_20150804.DeleteDeliveryStream"
      ~service ~context ~input
      ~output_deserializer:Json_deserializers.delete_delivery_stream_output_of_yojson
      ~error_deserializer

  let request_with_metadata context (request : delete_delivery_stream_input) =
    let input = Json_serializers.delete_delivery_stream_input_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata
      ~shape_name:"Firehose_20150804.DeleteDeliveryStream" ~service ~context ~input
      ~output_deserializer:Json_deserializers.delete_delivery_stream_output_of_yojson
      ~error_deserializer
end

module CreateDeliveryStream = struct
  let error_to_string = function
    | `InvalidArgumentException _ -> "com.amazonaws.firehose#InvalidArgumentException"
    | `InvalidKMSResourceException _ -> "com.amazonaws.firehose#InvalidKMSResourceException"
    | `LimitExceededException _ -> "com.amazonaws.firehose#LimitExceededException"
    | `ResourceInUseException _ -> "com.amazonaws.firehose#ResourceInUseException"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "InvalidArgumentException" ->
          `InvalidArgumentException
            (Json_deserializers.invalid_argument_exception_of_yojson tree path)
      | _, "InvalidKMSResourceException" ->
          `InvalidKMSResourceException
            (Json_deserializers.invalid_kms_resource_exception_of_yojson tree path)
      | _, "LimitExceededException" ->
          `LimitExceededException (Json_deserializers.limit_exceeded_exception_of_yojson tree path)
      | _, "ResourceInUseException" ->
          `ResourceInUseException (Json_deserializers.resource_in_use_exception_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : create_delivery_stream_input) =
    let input = Json_serializers.create_delivery_stream_input_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"Firehose_20150804.CreateDeliveryStream"
      ~service ~context ~input
      ~output_deserializer:Json_deserializers.create_delivery_stream_output_of_yojson
      ~error_deserializer

  let request_with_metadata context (request : create_delivery_stream_input) =
    let input = Json_serializers.create_delivery_stream_input_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata
      ~shape_name:"Firehose_20150804.CreateDeliveryStream" ~service ~context ~input
      ~output_deserializer:Json_deserializers.create_delivery_stream_output_of_yojson
      ~error_deserializer
end
