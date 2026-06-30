open Types
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