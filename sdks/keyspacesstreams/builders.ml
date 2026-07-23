open Types

let make_iterator_description ?iterator_position:(iterator_position_ : iterator_position option) ()
    =
  ({ iterator_position = iterator_position_ } : iterator_description)

let make_keyspaces_metadata
    ?expiration_time:(expiration_time_ : Smaws_Lib.Smithy_api.Types.string_ option)
    ?write_time:(write_time_ : Smaws_Lib.Smithy_api.Types.string_ option) () =
  ({ expiration_time = expiration_time_; write_time = write_time_ } : keyspaces_metadata)

let make_keyspaces_cell_map_definition ?key:(key_ : keyspaces_cell_value option)
    ?value:(value_ : keyspaces_cell_value option) ?metadata:(metadata_ : keyspaces_metadata option)
    () =
  ({ key = key_; value = value_; metadata = metadata_ } : keyspaces_cell_map_definition)

let make_keyspaces_cell ?value:(value_ : keyspaces_cell_value option)
    ?metadata:(metadata_ : keyspaces_metadata option) () =
  ({ value = value_; metadata = metadata_ } : keyspaces_cell)

let make_keyspaces_row ?value_cells:(value_cells_ : keyspaces_cells option)
    ?static_cells:(static_cells_ : keyspaces_cells option)
    ?row_metadata:(row_metadata_ : keyspaces_metadata option) () =
  ({ value_cells = value_cells_; static_cells = static_cells_; row_metadata = row_metadata_ }
    : keyspaces_row)

let make_record ?event_version:(event_version_ : Smaws_Lib.Smithy_api.Types.string_ option)
    ?created_at:(created_at_ : date option) ?origin:(origin_ : origin_type option)
    ?partition_keys:(partition_keys_ : keyspaces_keys_map option)
    ?clustering_keys:(clustering_keys_ : keyspaces_keys_map option)
    ?new_image:(new_image_ : keyspaces_row option) ?old_image:(old_image_ : keyspaces_row option)
    ?sequence_number:(sequence_number_ : sequence_number option) () =
  ({
     event_version = event_version_;
     created_at = created_at_;
     origin = origin_;
     partition_keys = partition_keys_;
     clustering_keys = clustering_keys_;
     new_image = new_image_;
     old_image = old_image_;
     sequence_number = sequence_number_;
   }
    : record)

let make_get_records_output ?change_records:(change_records_ : record_list option)
    ?next_shard_iterator:(next_shard_iterator_ : shard_iterator option)
    ?iterator_description:(iterator_description_ : iterator_description option) () =
  ({
     change_records = change_records_;
     next_shard_iterator = next_shard_iterator_;
     iterator_description = iterator_description_;
   }
    : get_records_output)

let make_get_records_input ?max_results:(max_results_ : Smaws_Lib.Smithy_api.Types.integer option)
    ~shard_iterator:(shard_iterator_ : shard_iterator) () =
  ({ shard_iterator = shard_iterator_; max_results = max_results_ } : get_records_input)

let make_get_shard_iterator_output ?shard_iterator:(shard_iterator_ : shard_iterator option) () =
  ({ shard_iterator = shard_iterator_ } : get_shard_iterator_output)

let make_get_shard_iterator_input ?sequence_number:(sequence_number_ : sequence_number option)
    ~stream_arn:(stream_arn_ : stream_arn) ~shard_id:(shard_id_ : shard_id)
    ~shard_iterator_type:(shard_iterator_type_ : shard_iterator_type) () =
  ({
     stream_arn = stream_arn_;
     shard_id = shard_id_;
     shard_iterator_type = shard_iterator_type_;
     sequence_number = sequence_number_;
   }
    : get_shard_iterator_input)

let make_sequence_number_range
    ?starting_sequence_number:(starting_sequence_number_ : sequence_number option)
    ?ending_sequence_number:(ending_sequence_number_ : sequence_number option) () =
  ({
     starting_sequence_number = starting_sequence_number_;
     ending_sequence_number = ending_sequence_number_;
   }
    : sequence_number_range)

let make_shard ?shard_id:(shard_id_ : shard_id option)
    ?sequence_number_range:(sequence_number_range_ : sequence_number_range option)
    ?parent_shard_ids:(parent_shard_ids_ : shard_id_list option) () =
  ({
     shard_id = shard_id_;
     sequence_number_range = sequence_number_range_;
     parent_shard_ids = parent_shard_ids_;
   }
    : shard)

let make_get_stream_output ?shards:(shards_ : shard_description_list option)
    ?next_token:(next_token_ : shard_id_token option) ~stream_arn:(stream_arn_ : stream_arn)
    ~stream_label:(stream_label_ : Smaws_Lib.Smithy_api.Types.string_)
    ~stream_status:(stream_status_ : stream_status)
    ~stream_view_type:(stream_view_type_ : stream_view_type)
    ~creation_request_date_time:(creation_request_date_time_ : date)
    ~keyspace_name:(keyspace_name_ : keyspace_name) ~table_name:(table_name_ : table_name) () =
  ({
     stream_arn = stream_arn_;
     stream_label = stream_label_;
     stream_status = stream_status_;
     stream_view_type = stream_view_type_;
     creation_request_date_time = creation_request_date_time_;
     keyspace_name = keyspace_name_;
     table_name = table_name_;
     shards = shards_;
     next_token = next_token_;
   }
    : get_stream_output)

let make_shard_filter ?type_:(type__ : shard_filter_type option)
    ?shard_id:(shard_id_ : shard_id option) () =
  ({ type_ = type__; shard_id = shard_id_ } : shard_filter)

let make_get_stream_input ?max_results:(max_results_ : Smaws_Lib.Smithy_api.Types.integer option)
    ?shard_filter:(shard_filter_ : shard_filter option)
    ?next_token:(next_token_ : shard_id_token option) ~stream_arn:(stream_arn_ : stream_arn) () =
  ({
     stream_arn = stream_arn_;
     max_results = max_results_;
     shard_filter = shard_filter_;
     next_token = next_token_;
   }
    : get_stream_input)

let make_stream ~stream_arn:(stream_arn_ : stream_arn)
    ~keyspace_name:(keyspace_name_ : keyspace_name) ~table_name:(table_name_ : table_name)
    ~stream_label:(stream_label_ : Smaws_Lib.Smithy_api.Types.string_) () =
  ({
     stream_arn = stream_arn_;
     keyspace_name = keyspace_name_;
     table_name = table_name_;
     stream_label = stream_label_;
   }
    : stream)

let make_list_streams_output ?streams:(streams_ : stream_list option)
    ?next_token:(next_token_ : stream_arn_token option) () =
  ({ streams = streams_; next_token = next_token_ } : list_streams_output)

let make_list_streams_input ?keyspace_name:(keyspace_name_ : keyspace_name option)
    ?table_name:(table_name_ : table_name option)
    ?max_results:(max_results_ : Smaws_Lib.Smithy_api.Types.integer option)
    ?next_token:(next_token_ : stream_arn_token option) () =
  ({
     keyspace_name = keyspace_name_;
     table_name = table_name_;
     max_results = max_results_;
     next_token = next_token_;
   }
    : list_streams_input)
