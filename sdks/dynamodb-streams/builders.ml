open Smaws_Lib
open Types
let make_stream_record
  ?stream_view_type:(stream_view_type_ : stream_view_type option)
  ?size_bytes:(size_bytes_ : int option)
  ?sequence_number:(sequence_number_ : string option)
  ?old_image:(old_image_ : attribute_map option)
  ?new_image:(new_image_ : attribute_map option)
  ?keys:(keys_ : attribute_map option)
  ?approximate_creation_date_time:(approximate_creation_date_time_ :
                                    CoreTypes.Timestamp.t option)
  () =
  ({
     stream_view_type = stream_view_type_;
     size_bytes = size_bytes_;
     sequence_number = sequence_number_;
     old_image = old_image_;
     new_image = new_image_;
     keys = keys_;
     approximate_creation_date_time = approximate_creation_date_time_
   } : stream_record)
let make_stream ?stream_label:(stream_label_ : string option)
  ?table_name:(table_name_ : string option)
  ?stream_arn:(stream_arn_ : string option) () =
  ({
     stream_label = stream_label_;
     table_name = table_name_;
     stream_arn = stream_arn_
   } : stream)
let make_key_schema_element ~key_type:(key_type_ : key_type)
  ~attribute_name:(attribute_name_ : string) () =
  ({ key_type = key_type_; attribute_name = attribute_name_ } : key_schema_element)
let make_sequence_number_range
  ?ending_sequence_number:(ending_sequence_number_ : string option)
  ?starting_sequence_number:(starting_sequence_number_ : string option) () =
  ({
     ending_sequence_number = ending_sequence_number_;
     starting_sequence_number = starting_sequence_number_
   } : sequence_number_range)
let make_shard ?parent_shard_id:(parent_shard_id_ : string option)
  ?sequence_number_range:(sequence_number_range_ :
                           sequence_number_range option)
  ?shard_id:(shard_id_ : string option) () =
  ({
     parent_shard_id = parent_shard_id_;
     sequence_number_range = sequence_number_range_;
     shard_id = shard_id_
   } : shard)
let make_stream_description
  ?last_evaluated_shard_id:(last_evaluated_shard_id_ : string option)
  ?shards:(shards_ : shard list option)
  ?key_schema:(key_schema_ : key_schema_element list option)
  ?table_name:(table_name_ : string option)
  ?creation_request_date_time:(creation_request_date_time_ :
                                CoreTypes.Timestamp.t option)
  ?stream_view_type:(stream_view_type_ : stream_view_type option)
  ?stream_status:(stream_status_ : stream_status option)
  ?stream_label:(stream_label_ : string option)
  ?stream_arn:(stream_arn_ : string option) () =
  ({
     last_evaluated_shard_id = last_evaluated_shard_id_;
     shards = shards_;
     key_schema = key_schema_;
     table_name = table_name_;
     creation_request_date_time = creation_request_date_time_;
     stream_view_type = stream_view_type_;
     stream_status = stream_status_;
     stream_label = stream_label_;
     stream_arn = stream_arn_
   } : stream_description)
let make_identity ?type_:(type__ : string option)
  ?principal_id:(principal_id_ : string option) () =
  ({ type_ = type__; principal_id = principal_id_ } : identity)
let make_record ?user_identity:(user_identity_ : identity option)
  ?dynamodb:(dynamodb_ : stream_record option)
  ?aws_region:(aws_region_ : string option)
  ?event_source:(event_source_ : string option)
  ?event_version:(event_version_ : string option)
  ?event_name:(event_name_ : operation_type option)
  ?event_i_d:(event_i_d_ : string option) () =
  ({
     user_identity = user_identity_;
     dynamodb = dynamodb_;
     aws_region = aws_region_;
     event_source = event_source_;
     event_version = event_version_;
     event_name = event_name_;
     event_i_d = event_i_d_
   } : record)
let make_list_streams_output
  ?last_evaluated_stream_arn:(last_evaluated_stream_arn_ : string option)
  ?streams:(streams_ : stream list option) () =
  ({
     last_evaluated_stream_arn = last_evaluated_stream_arn_;
     streams = streams_
   } : list_streams_output)
let make_list_streams_input
  ?exclusive_start_stream_arn:(exclusive_start_stream_arn_ : string option)
  ?limit:(limit_ : int option) ?table_name:(table_name_ : string option) () =
  ({
     exclusive_start_stream_arn = exclusive_start_stream_arn_;
     limit = limit_;
     table_name = table_name_
   } : list_streams_input)
let make_get_shard_iterator_output
  ?shard_iterator:(shard_iterator_ : string option) () =
  ({ shard_iterator = shard_iterator_ } : get_shard_iterator_output)
let make_get_shard_iterator_input
  ?sequence_number:(sequence_number_ : string option)
  ~shard_iterator_type:(shard_iterator_type_ : shard_iterator_type)
  ~shard_id:(shard_id_ : string) ~stream_arn:(stream_arn_ : string) () =
  ({
     sequence_number = sequence_number_;
     shard_iterator_type = shard_iterator_type_;
     shard_id = shard_id_;
     stream_arn = stream_arn_
   } : get_shard_iterator_input)
let make_get_records_output
  ?next_shard_iterator:(next_shard_iterator_ : string option)
  ?records:(records_ : record list option) () =
  ({ next_shard_iterator = next_shard_iterator_; records = records_ } : 
  get_records_output)
let make_get_records_input ?limit:(limit_ : int option)
  ~shard_iterator:(shard_iterator_ : string) () =
  ({ limit = limit_; shard_iterator = shard_iterator_ } : get_records_input)
let make_describe_stream_output
  ?stream_description:(stream_description_ : stream_description option) () =
  ({ stream_description = stream_description_ } : describe_stream_output)
let make_describe_stream_input
  ?exclusive_start_shard_id:(exclusive_start_shard_id_ : string option)
  ?limit:(limit_ : int option) ~stream_arn:(stream_arn_ : string) () =
  ({
     exclusive_start_shard_id = exclusive_start_shard_id_;
     limit = limit_;
     stream_arn = stream_arn_
   } : describe_stream_input)