open Types

val make_sequence_number_range :
  ?starting_sequence_number:sequence_number ->
  ?ending_sequence_number:sequence_number ->
  unit ->
  sequence_number_range

val make_shard :
  ?shard_id:shard_id ->
  ?sequence_number_range:sequence_number_range ->
  ?parent_shard_id:shard_id ->
  unit ->
  shard

val make_key_schema_element :
  attribute_name:key_schema_attribute_name -> key_type:key_type -> unit -> key_schema_element

val make_stream_description :
  ?stream_arn:stream_arn ->
  ?stream_label:string_ ->
  ?stream_status:stream_status ->
  ?stream_view_type:stream_view_type ->
  ?creation_request_date_time:date ->
  ?table_name:table_name ->
  ?key_schema:key_schema ->
  ?shards:shard_description_list ->
  ?last_evaluated_shard_id:shard_id ->
  unit ->
  stream_description

val make_describe_stream_output :
  ?stream_description:stream_description -> unit -> describe_stream_output

val make_shard_filter : ?type_:shard_filter_type -> ?shard_id:shard_id -> unit -> shard_filter

val make_describe_stream_input :
  ?limit:positive_integer_object ->
  ?exclusive_start_shard_id:shard_id ->
  ?shard_filter:shard_filter ->
  stream_arn:stream_arn ->
  unit ->
  describe_stream_input

val make_stream :
  ?stream_arn:stream_arn -> ?table_name:table_name -> ?stream_label:string_ -> unit -> stream

val make_list_streams_output :
  ?streams:stream_list -> ?last_evaluated_stream_arn:stream_arn -> unit -> list_streams_output

val make_list_streams_input :
  ?table_name:table_name ->
  ?limit:positive_integer_object ->
  ?exclusive_start_stream_arn:stream_arn ->
  unit ->
  list_streams_input

val make_get_shard_iterator_output :
  ?shard_iterator:shard_iterator -> unit -> get_shard_iterator_output

val make_get_shard_iterator_input :
  ?sequence_number:sequence_number ->
  stream_arn:stream_arn ->
  shard_id:shard_id ->
  shard_iterator_type:shard_iterator_type ->
  unit ->
  get_shard_iterator_input

val make_identity : ?principal_id:string_ -> ?type_:string_ -> unit -> identity

val make_stream_record :
  ?approximate_creation_date_time:date ->
  ?keys:attribute_map ->
  ?new_image:attribute_map ->
  ?old_image:attribute_map ->
  ?sequence_number:sequence_number ->
  ?size_bytes:positive_long_object ->
  ?stream_view_type:stream_view_type ->
  unit ->
  stream_record

val make_record :
  ?event_i_d:string_ ->
  ?event_name:operation_type ->
  ?event_version:string_ ->
  ?event_source:string_ ->
  ?aws_region:string_ ->
  ?dynamodb:stream_record ->
  ?user_identity:identity ->
  unit ->
  record

val make_get_records_output :
  ?records:record_list -> ?next_shard_iterator:shard_iterator -> unit -> get_records_output

val make_get_records_input :
  ?limit:positive_integer_object -> shard_iterator:shard_iterator -> unit -> get_records_input
