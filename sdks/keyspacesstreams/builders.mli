open Types

val make_iterator_description : ?iterator_position:iterator_position -> unit -> iterator_description

val make_keyspaces_metadata :
  ?expiration_time:Smaws_Lib.Smithy_api.Types.string_ ->
  ?write_time:Smaws_Lib.Smithy_api.Types.string_ ->
  unit ->
  keyspaces_metadata

val make_keyspaces_cell_map_definition :
  ?key:keyspaces_cell_value ->
  ?value:keyspaces_cell_value ->
  ?metadata:keyspaces_metadata ->
  unit ->
  keyspaces_cell_map_definition

val make_keyspaces_cell :
  ?value:keyspaces_cell_value -> ?metadata:keyspaces_metadata -> unit -> keyspaces_cell

val make_keyspaces_row :
  ?value_cells:keyspaces_cells ->
  ?static_cells:keyspaces_cells ->
  ?row_metadata:keyspaces_metadata ->
  unit ->
  keyspaces_row

val make_record :
  ?event_version:Smaws_Lib.Smithy_api.Types.string_ ->
  ?created_at:date ->
  ?origin:origin_type ->
  ?partition_keys:keyspaces_keys_map ->
  ?clustering_keys:keyspaces_keys_map ->
  ?new_image:keyspaces_row ->
  ?old_image:keyspaces_row ->
  ?sequence_number:sequence_number ->
  unit ->
  record

val make_get_records_output :
  ?change_records:record_list ->
  ?next_shard_iterator:shard_iterator ->
  ?iterator_description:iterator_description ->
  unit ->
  get_records_output

val make_get_records_input :
  ?max_results:Smaws_Lib.Smithy_api.Types.integer ->
  shard_iterator:shard_iterator ->
  unit ->
  get_records_input

val make_get_shard_iterator_output :
  ?shard_iterator:shard_iterator -> unit -> get_shard_iterator_output

val make_get_shard_iterator_input :
  ?sequence_number:sequence_number ->
  stream_arn:stream_arn ->
  shard_id:shard_id ->
  shard_iterator_type:shard_iterator_type ->
  unit ->
  get_shard_iterator_input

val make_sequence_number_range :
  ?starting_sequence_number:sequence_number ->
  ?ending_sequence_number:sequence_number ->
  unit ->
  sequence_number_range

val make_shard :
  ?shard_id:shard_id ->
  ?sequence_number_range:sequence_number_range ->
  ?parent_shard_ids:shard_id_list ->
  unit ->
  shard

val make_get_stream_output :
  ?shards:shard_description_list ->
  ?next_token:shard_id_token ->
  stream_arn:stream_arn ->
  stream_label:Smaws_Lib.Smithy_api.Types.string_ ->
  stream_status:stream_status ->
  stream_view_type:stream_view_type ->
  creation_request_date_time:date ->
  keyspace_name:keyspace_name ->
  table_name:table_name ->
  unit ->
  get_stream_output

val make_shard_filter : ?type_:shard_filter_type -> ?shard_id:shard_id -> unit -> shard_filter

val make_get_stream_input :
  ?max_results:Smaws_Lib.Smithy_api.Types.integer ->
  ?shard_filter:shard_filter ->
  ?next_token:shard_id_token ->
  stream_arn:stream_arn ->
  unit ->
  get_stream_input

val make_stream :
  stream_arn:stream_arn ->
  keyspace_name:keyspace_name ->
  table_name:table_name ->
  stream_label:Smaws_Lib.Smithy_api.Types.string_ ->
  unit ->
  stream

val make_list_streams_output :
  ?streams:stream_list -> ?next_token:stream_arn_token -> unit -> list_streams_output

val make_list_streams_input :
  ?keyspace_name:keyspace_name ->
  ?table_name:table_name ->
  ?max_results:Smaws_Lib.Smithy_api.Types.integer ->
  ?next_token:stream_arn_token ->
  unit ->
  list_streams_input
