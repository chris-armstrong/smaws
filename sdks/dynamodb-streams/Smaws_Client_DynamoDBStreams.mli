(** 
    DynamoDB Streams client library built on EIO.
    
*)

open Types

(** {1:types Types} *)

module Types = Types

(** {1:builders Builders} *)

val make_stream_record :
  ?stream_view_type:stream_view_type ->
    ?size_bytes:positive_long_object ->
      ?sequence_number:sequence_number ->
        ?old_image:attribute_map ->
          ?new_image:attribute_map ->
            ?keys:attribute_map ->
              ?approximate_creation_date_time:date -> unit -> stream_record
val make_stream :
  ?stream_label:string_ ->
    ?table_name:table_name -> ?stream_arn:stream_arn -> unit -> stream
val make_key_schema_element :
  key_type:key_type ->
    attribute_name:key_schema_attribute_name -> unit -> key_schema_element
val make_sequence_number_range :
  ?ending_sequence_number:sequence_number ->
    ?starting_sequence_number:sequence_number ->
      unit -> sequence_number_range
val make_shard :
  ?parent_shard_id:shard_id ->
    ?sequence_number_range:sequence_number_range ->
      ?shard_id:shard_id -> unit -> shard
val make_stream_description :
  ?last_evaluated_shard_id:shard_id ->
    ?shards:shard_description_list ->
      ?key_schema:key_schema ->
        ?table_name:table_name ->
          ?creation_request_date_time:date ->
            ?stream_view_type:stream_view_type ->
              ?stream_status:stream_status ->
                ?stream_label:string_ ->
                  ?stream_arn:stream_arn -> unit -> stream_description
val make_identity :
  ?type_:string_ -> ?principal_id:string_ -> unit -> identity
val make_record :
  ?user_identity:identity ->
    ?dynamodb:stream_record ->
      ?aws_region:string_ ->
        ?event_source:string_ ->
          ?event_version:string_ ->
            ?event_name:operation_type ->
              ?event_i_d:string_ -> unit -> record
val make_list_streams_output :
  ?last_evaluated_stream_arn:stream_arn ->
    ?streams:stream_list -> unit -> list_streams_output
val make_list_streams_input :
  ?exclusive_start_stream_arn:stream_arn ->
    ?limit:positive_integer_object ->
      ?table_name:table_name -> unit -> list_streams_input
val make_get_shard_iterator_output :
  ?shard_iterator:shard_iterator -> unit -> get_shard_iterator_output
val make_get_shard_iterator_input :
  ?sequence_number:sequence_number ->
    shard_iterator_type:shard_iterator_type ->
      shard_id:shard_id ->
        stream_arn:stream_arn -> unit -> get_shard_iterator_input
val make_get_records_output :
  ?next_shard_iterator:shard_iterator ->
    ?records:record_list -> unit -> get_records_output
val make_get_records_input :
  ?limit:positive_integer_object ->
    shard_iterator:shard_iterator -> unit -> get_records_input
val make_describe_stream_output :
  ?stream_description:stream_description -> unit -> describe_stream_output
val make_describe_stream_input :
  ?exclusive_start_shard_id:shard_id ->
    ?limit:positive_integer_object ->
      stream_arn:stream_arn -> unit -> describe_stream_input
(** {1:operations Operations} *)

module DescribeStream :
sig
  val request :
    Smaws_Lib.Context.t ->
      describe_stream_input ->
        (describe_stream_output,
          [> Smaws_Lib.Protocols.AwsJson.error
          | `InternalServerError of internal_server_error 
          | `ResourceNotFoundException of resource_not_found_exception ])
          result
end[@@ocaml.doc
     "Returns information about a stream, including the current status of the stream, its Amazon Resource Name (ARN), the composition of its shards, and its corresponding DynamoDB table.\n\n  You can call [DescribeStream] at a maximum rate of 10 times per second.\n  \n    Each shard in the stream has a [SequenceNumberRange] associated with it. If the [SequenceNumberRange] has a [StartingSequenceNumber] but no [EndingSequenceNumber], then the shard is still open (able to receive more stream records). If both [StartingSequenceNumber] and [EndingSequenceNumber] are present, then that shard is closed and can no longer receive more data.\n    "]
module GetRecords :
sig
  val request :
    Smaws_Lib.Context.t ->
      get_records_input ->
        (get_records_output,
          [> Smaws_Lib.Protocols.AwsJson.error
          | `ExpiredIteratorException of expired_iterator_exception 
          | `InternalServerError of internal_server_error 
          | `LimitExceededException of limit_exceeded_exception 
          | `ResourceNotFoundException of resource_not_found_exception 
          | `TrimmedDataAccessException of trimmed_data_access_exception ])
          result
end[@@ocaml.doc
     "Retrieves the stream records from a given shard.\n\n Specify a shard iterator using the [ShardIterator] parameter. The shard iterator specifies the position in the shard from which you want to start reading stream records sequentially. If there are no stream records available in the portion of the shard that the iterator points to, [GetRecords] returns an empty list. Note that it might take multiple calls to get to a portion of the shard that contains stream records.\n \n    [GetRecords] can retrieve a maximum of 1 MB of data or 1000 stream records, whichever comes first.\n   \n    "]
module GetShardIterator :
sig
  val request :
    Smaws_Lib.Context.t ->
      get_shard_iterator_input ->
        (get_shard_iterator_output,
          [> Smaws_Lib.Protocols.AwsJson.error
          | `InternalServerError of internal_server_error 
          | `ResourceNotFoundException of resource_not_found_exception 
          | `TrimmedDataAccessException of trimmed_data_access_exception ])
          result
end[@@ocaml.doc
     "Returns a shard iterator. A shard iterator provides information about how to retrieve the stream records from within a shard. Use the shard iterator in a subsequent [GetRecords] request to read the stream records from the shard.\n\n  A shard iterator expires 15 minutes after it is returned to the requester.\n  \n   "]
module ListStreams :
sig
  val request :
    Smaws_Lib.Context.t ->
      list_streams_input ->
        (list_streams_output,
          [> Smaws_Lib.Protocols.AwsJson.error
          | `InternalServerError of internal_server_error 
          | `ResourceNotFoundException of resource_not_found_exception ])
          result
end[@@ocaml.doc
     "Returns an array of stream ARNs associated with the current account and endpoint. If the [TableName] parameter is present, then [ListStreams] will return only the streams ARNs for that table.\n\n  You can call [ListStreams] at a maximum rate of 5 times per second.\n  \n   "](** {1:Serialization and Deserialization} *)

module Json_serializers = Json_serializers
module Json_deserializers = Json_deserializers
