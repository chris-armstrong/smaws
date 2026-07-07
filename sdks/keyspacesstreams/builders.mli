open Types

val make_stream :
  stream_label:Smaws_Lib.Smithy_api.Types.string_ ->
  table_name:table_name ->
  keyspace_name:keyspace_name ->
  stream_arn:stream_arn ->
  unit ->
  stream

val make_shard_filter : ?shard_id:shard_id -> ?type_:shard_filter_type -> unit -> shard_filter

val make_sequence_number_range :
  ?ending_sequence_number:sequence_number ->
  ?starting_sequence_number:sequence_number ->
  unit ->
  sequence_number_range

val make_shard :
  ?parent_shard_ids:shard_id_list ->
  ?sequence_number_range:sequence_number_range ->
  ?shard_id:shard_id ->
  unit ->
  shard

val make_keyspaces_metadata :
  ?write_time:Smaws_Lib.Smithy_api.Types.string_ ->
  ?expiration_time:Smaws_Lib.Smithy_api.Types.string_ ->
  unit ->
  keyspaces_metadata

val make_keyspaces_cell :
  ?metadata:keyspaces_metadata -> ?value:keyspaces_cell_value -> unit -> keyspaces_cell

val make_keyspaces_cell_map_definition :
  ?metadata:keyspaces_metadata ->
  ?value:keyspaces_cell_value ->
  ?key:keyspaces_cell_value ->
  unit ->
  keyspaces_cell_map_definition

val make_keyspaces_row :
  ?row_metadata:keyspaces_metadata ->
  ?static_cells:keyspaces_cells ->
  ?value_cells:keyspaces_cells ->
  unit ->
  keyspaces_row

val make_record :
  ?sequence_number:sequence_number ->
  ?old_image:keyspaces_row ->
  ?new_image:keyspaces_row ->
  ?clustering_keys:keyspaces_keys_map ->
  ?partition_keys:keyspaces_keys_map ->
  ?origin:origin_type ->
  ?created_at:date ->
  ?event_version:Smaws_Lib.Smithy_api.Types.string_ ->
  unit ->
  record

val make_list_streams_output :
  ?next_token:stream_arn_token -> ?streams:stream_list -> unit -> list_streams_output

val make_list_streams_input :
  ?next_token:stream_arn_token ->
  ?max_results:Smaws_Lib.Smithy_api.Types.integer ->
  ?table_name:table_name ->
  ?keyspace_name:keyspace_name ->
  unit ->
  list_streams_input

val make_get_stream_output :
  ?next_token:shard_id_token ->
  ?shards:shard_description_list ->
  table_name:table_name ->
  keyspace_name:keyspace_name ->
  creation_request_date_time:date ->
  stream_view_type:stream_view_type ->
  stream_status:stream_status ->
  stream_label:Smaws_Lib.Smithy_api.Types.string_ ->
  stream_arn:stream_arn ->
  unit ->
  get_stream_output

val make_get_stream_input :
  ?next_token:shard_id_token ->
  ?shard_filter:shard_filter ->
  ?max_results:Smaws_Lib.Smithy_api.Types.integer ->
  stream_arn:stream_arn ->
  unit ->
  get_stream_input

val make_get_shard_iterator_output :
  ?shard_iterator:shard_iterator -> unit -> get_shard_iterator_output

val make_get_shard_iterator_input :
  ?sequence_number:sequence_number ->
  shard_iterator_type:shard_iterator_type ->
  shard_id:shard_id ->
  stream_arn:stream_arn ->
  unit ->
  get_shard_iterator_input

val make_iterator_description : ?iterator_position:iterator_position -> unit -> iterator_description

val make_get_records_output :
  ?iterator_description:iterator_description ->
  ?next_shard_iterator:shard_iterator ->
  ?change_records:record_list ->
  unit ->
  get_records_output

val make_get_records_input :
  ?max_results:Smaws_Lib.Smithy_api.Types.integer ->
  shard_iterator:shard_iterator ->
  unit ->
  get_records_input
