open Types

let make_stream ~stream_label:(stream_label_ : Smaws_Lib.Smithy_api.Types.string_)
    ~table_name:(table_name_ : table_name) ~keyspace_name:(keyspace_name_ : keyspace_name)
    ~stream_arn:(stream_arn_ : stream_arn) () =
  ({
     stream_label = stream_label_;
     table_name = table_name_;
     keyspace_name = keyspace_name_;
     stream_arn = stream_arn_;
   }
    : stream)

let make_shard_filter ?shard_id:(shard_id_ : shard_id option)
    ?type_:(type__ : shard_filter_type option) () =
  ({ shard_id = shard_id_; type_ = type__ } : shard_filter)

let make_sequence_number_range
    ?ending_sequence_number:(ending_sequence_number_ : sequence_number option)
    ?starting_sequence_number:(starting_sequence_number_ : sequence_number option) () =
  ({
     ending_sequence_number = ending_sequence_number_;
     starting_sequence_number = starting_sequence_number_;
   }
    : sequence_number_range)

let make_shard ?parent_shard_ids:(parent_shard_ids_ : shard_id_list option)
    ?sequence_number_range:(sequence_number_range_ : sequence_number_range option)
    ?shard_id:(shard_id_ : shard_id option) () =
  ({
     parent_shard_ids = parent_shard_ids_;
     sequence_number_range = sequence_number_range_;
     shard_id = shard_id_;
   }
    : shard)

let make_keyspaces_metadata ?write_time:(write_time_ : Smaws_Lib.Smithy_api.Types.string_ option)
    ?expiration_time:(expiration_time_ : Smaws_Lib.Smithy_api.Types.string_ option) () =
  ({ write_time = write_time_; expiration_time = expiration_time_ } : keyspaces_metadata)

let make_keyspaces_cell ?metadata:(metadata_ : keyspaces_metadata option)
    ?value:(value_ : keyspaces_cell_value option) () =
  ({ metadata = metadata_; value = value_ } : keyspaces_cell)

let make_keyspaces_cell_map_definition ?metadata:(metadata_ : keyspaces_metadata option)
    ?value:(value_ : keyspaces_cell_value option) ?key:(key_ : keyspaces_cell_value option) () =
  ({ metadata = metadata_; value = value_; key = key_ } : keyspaces_cell_map_definition)

let make_keyspaces_row ?row_metadata:(row_metadata_ : keyspaces_metadata option)
    ?static_cells:(static_cells_ : keyspaces_cells option)
    ?value_cells:(value_cells_ : keyspaces_cells option) () =
  ({ row_metadata = row_metadata_; static_cells = static_cells_; value_cells = value_cells_ }
    : keyspaces_row)

let make_record ?sequence_number:(sequence_number_ : sequence_number option)
    ?old_image:(old_image_ : keyspaces_row option) ?new_image:(new_image_ : keyspaces_row option)
    ?clustering_keys:(clustering_keys_ : keyspaces_keys_map option)
    ?partition_keys:(partition_keys_ : keyspaces_keys_map option)
    ?origin:(origin_ : origin_type option) ?created_at:(created_at_ : date option)
    ?event_version:(event_version_ : Smaws_Lib.Smithy_api.Types.string_ option) () =
  ({
     sequence_number = sequence_number_;
     old_image = old_image_;
     new_image = new_image_;
     clustering_keys = clustering_keys_;
     partition_keys = partition_keys_;
     origin = origin_;
     created_at = created_at_;
     event_version = event_version_;
   }
    : record)

let make_list_streams_output ?next_token:(next_token_ : stream_arn_token option)
    ?streams:(streams_ : stream_list option) () =
  ({ next_token = next_token_; streams = streams_ } : list_streams_output)

let make_list_streams_input ?next_token:(next_token_ : stream_arn_token option)
    ?max_results:(max_results_ : Smaws_Lib.Smithy_api.Types.integer option)
    ?table_name:(table_name_ : table_name option)
    ?keyspace_name:(keyspace_name_ : keyspace_name option) () =
  ({
     next_token = next_token_;
     max_results = max_results_;
     table_name = table_name_;
     keyspace_name = keyspace_name_;
   }
    : list_streams_input)

let make_get_stream_output ?next_token:(next_token_ : shard_id_token option)
    ?shards:(shards_ : shard_description_list option) ~table_name:(table_name_ : table_name)
    ~keyspace_name:(keyspace_name_ : keyspace_name)
    ~creation_request_date_time:(creation_request_date_time_ : date)
    ~stream_view_type:(stream_view_type_ : stream_view_type)
    ~stream_status:(stream_status_ : stream_status)
    ~stream_label:(stream_label_ : Smaws_Lib.Smithy_api.Types.string_)
    ~stream_arn:(stream_arn_ : stream_arn) () =
  ({
     next_token = next_token_;
     shards = shards_;
     table_name = table_name_;
     keyspace_name = keyspace_name_;
     creation_request_date_time = creation_request_date_time_;
     stream_view_type = stream_view_type_;
     stream_status = stream_status_;
     stream_label = stream_label_;
     stream_arn = stream_arn_;
   }
    : get_stream_output)

let make_get_stream_input ?next_token:(next_token_ : shard_id_token option)
    ?shard_filter:(shard_filter_ : shard_filter option)
    ?max_results:(max_results_ : Smaws_Lib.Smithy_api.Types.integer option)
    ~stream_arn:(stream_arn_ : stream_arn) () =
  ({
     next_token = next_token_;
     shard_filter = shard_filter_;
     max_results = max_results_;
     stream_arn = stream_arn_;
   }
    : get_stream_input)

let make_get_shard_iterator_output ?shard_iterator:(shard_iterator_ : shard_iterator option) () =
  ({ shard_iterator = shard_iterator_ } : get_shard_iterator_output)

let make_get_shard_iterator_input ?sequence_number:(sequence_number_ : sequence_number option)
    ~shard_iterator_type:(shard_iterator_type_ : shard_iterator_type)
    ~shard_id:(shard_id_ : shard_id) ~stream_arn:(stream_arn_ : stream_arn) () =
  ({
     sequence_number = sequence_number_;
     shard_iterator_type = shard_iterator_type_;
     shard_id = shard_id_;
     stream_arn = stream_arn_;
   }
    : get_shard_iterator_input)

let make_iterator_description ?iterator_position:(iterator_position_ : iterator_position option) ()
    =
  ({ iterator_position = iterator_position_ } : iterator_description)

let make_get_records_output
    ?iterator_description:(iterator_description_ : iterator_description option)
    ?next_shard_iterator:(next_shard_iterator_ : shard_iterator option)
    ?change_records:(change_records_ : record_list option) () =
  ({
     iterator_description = iterator_description_;
     next_shard_iterator = next_shard_iterator_;
     change_records = change_records_;
   }
    : get_records_output)

let make_get_records_input ?max_results:(max_results_ : Smaws_Lib.Smithy_api.Types.integer option)
    ~shard_iterator:(shard_iterator_ : shard_iterator) () =
  ({ max_results = max_results_; shard_iterator = shard_iterator_ } : get_records_input)
