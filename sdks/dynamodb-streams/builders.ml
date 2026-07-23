open Types

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
    ?parent_shard_id:(parent_shard_id_ : shard_id option) () =
  ({
     shard_id = shard_id_;
     sequence_number_range = sequence_number_range_;
     parent_shard_id = parent_shard_id_;
   }
    : shard)

let make_key_schema_element ~attribute_name:(attribute_name_ : key_schema_attribute_name)
    ~key_type:(key_type_ : key_type) () =
  ({ attribute_name = attribute_name_; key_type = key_type_ } : key_schema_element)

let make_stream_description ?stream_arn:(stream_arn_ : stream_arn option)
    ?stream_label:(stream_label_ : string_ option)
    ?stream_status:(stream_status_ : stream_status option)
    ?stream_view_type:(stream_view_type_ : stream_view_type option)
    ?creation_request_date_time:(creation_request_date_time_ : date option)
    ?table_name:(table_name_ : table_name option) ?key_schema:(key_schema_ : key_schema option)
    ?shards:(shards_ : shard_description_list option)
    ?last_evaluated_shard_id:(last_evaluated_shard_id_ : shard_id option) () =
  ({
     stream_arn = stream_arn_;
     stream_label = stream_label_;
     stream_status = stream_status_;
     stream_view_type = stream_view_type_;
     creation_request_date_time = creation_request_date_time_;
     table_name = table_name_;
     key_schema = key_schema_;
     shards = shards_;
     last_evaluated_shard_id = last_evaluated_shard_id_;
   }
    : stream_description)

let make_describe_stream_output
    ?stream_description:(stream_description_ : stream_description option) () =
  ({ stream_description = stream_description_ } : describe_stream_output)

let make_shard_filter ?type_:(type__ : shard_filter_type option)
    ?shard_id:(shard_id_ : shard_id option) () =
  ({ type_ = type__; shard_id = shard_id_ } : shard_filter)

let make_describe_stream_input ?limit:(limit_ : positive_integer_object option)
    ?exclusive_start_shard_id:(exclusive_start_shard_id_ : shard_id option)
    ?shard_filter:(shard_filter_ : shard_filter option) ~stream_arn:(stream_arn_ : stream_arn) () =
  ({
     stream_arn = stream_arn_;
     limit = limit_;
     exclusive_start_shard_id = exclusive_start_shard_id_;
     shard_filter = shard_filter_;
   }
    : describe_stream_input)

let make_stream ?stream_arn:(stream_arn_ : stream_arn option)
    ?table_name:(table_name_ : table_name option) ?stream_label:(stream_label_ : string_ option) ()
    =
  ({ stream_arn = stream_arn_; table_name = table_name_; stream_label = stream_label_ } : stream)

let make_list_streams_output ?streams:(streams_ : stream_list option)
    ?last_evaluated_stream_arn:(last_evaluated_stream_arn_ : stream_arn option) () =
  ({ streams = streams_; last_evaluated_stream_arn = last_evaluated_stream_arn_ }
    : list_streams_output)

let make_list_streams_input ?table_name:(table_name_ : table_name option)
    ?limit:(limit_ : positive_integer_object option)
    ?exclusive_start_stream_arn:(exclusive_start_stream_arn_ : stream_arn option) () =
  ({
     table_name = table_name_;
     limit = limit_;
     exclusive_start_stream_arn = exclusive_start_stream_arn_;
   }
    : list_streams_input)

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

let make_identity ?principal_id:(principal_id_ : string_ option) ?type_:(type__ : string_ option) ()
    =
  ({ principal_id = principal_id_; type_ = type__ } : identity)

let make_stream_record
    ?approximate_creation_date_time:(approximate_creation_date_time_ : date option)
    ?keys:(keys_ : attribute_map option) ?new_image:(new_image_ : attribute_map option)
    ?old_image:(old_image_ : attribute_map option)
    ?sequence_number:(sequence_number_ : sequence_number option)
    ?size_bytes:(size_bytes_ : positive_long_object option)
    ?stream_view_type:(stream_view_type_ : stream_view_type option) () =
  ({
     approximate_creation_date_time = approximate_creation_date_time_;
     keys = keys_;
     new_image = new_image_;
     old_image = old_image_;
     sequence_number = sequence_number_;
     size_bytes = size_bytes_;
     stream_view_type = stream_view_type_;
   }
    : stream_record)

let make_record ?event_i_d:(event_i_d_ : string_ option)
    ?event_name:(event_name_ : operation_type option)
    ?event_version:(event_version_ : string_ option) ?event_source:(event_source_ : string_ option)
    ?aws_region:(aws_region_ : string_ option) ?dynamodb:(dynamodb_ : stream_record option)
    ?user_identity:(user_identity_ : identity option) () =
  ({
     event_i_d = event_i_d_;
     event_name = event_name_;
     event_version = event_version_;
     event_source = event_source_;
     aws_region = aws_region_;
     dynamodb = dynamodb_;
     user_identity = user_identity_;
   }
    : record)

let make_get_records_output ?records:(records_ : record_list option)
    ?next_shard_iterator:(next_shard_iterator_ : shard_iterator option) () =
  ({ records = records_; next_shard_iterator = next_shard_iterator_ } : get_records_output)

let make_get_records_input ?limit:(limit_ : positive_integer_object option)
    ~shard_iterator:(shard_iterator_ : shard_iterator) () =
  ({ shard_iterator = shard_iterator_; limit = limit_ } : get_records_input)
