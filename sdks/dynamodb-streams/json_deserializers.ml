open Smaws_Lib.Json.DeserializeHelpers
open Types

let boolean_attribute_value_of_yojson = bool_of_yojson
let null_attribute_value_of_yojson = bool_of_yojson
let attribute_name_of_yojson = string_of_yojson
let binary_attribute_value_of_yojson = blob_of_yojson

let binary_set_attribute_value_of_yojson tree path =
  list_of_yojson binary_attribute_value_of_yojson tree path

let number_attribute_value_of_yojson = string_of_yojson

let number_set_attribute_value_of_yojson tree path =
  list_of_yojson number_attribute_value_of_yojson tree path

let string_attribute_value_of_yojson = string_of_yojson

let string_set_attribute_value_of_yojson tree path =
  list_of_yojson string_attribute_value_of_yojson tree path

let rec map_attribute_value_of_yojson tree path =
  map_of_yojson attribute_name_of_yojson attribute_value_of_yojson tree path

and list_attribute_value_of_yojson tree path = list_of_yojson attribute_value_of_yojson tree path

and attribute_value_of_yojson (tree : t) path =
  let _list = assoc_of_yojson tree path in
  let key, value_ =
    match _list with
    | (key, value_) :: _ -> (key, value_)
    | _ -> raise (deserialize_wrong_type_error path "union")
  in
  (match key with
   | "S" -> S (string_attribute_value_of_yojson value_ path)
   | "N" -> N (number_attribute_value_of_yojson value_ path)
   | "B" -> B (binary_attribute_value_of_yojson value_ path)
   | "SS" -> SS (string_set_attribute_value_of_yojson value_ path)
   | "NS" -> NS (number_set_attribute_value_of_yojson value_ path)
   | "BS" -> BS (binary_set_attribute_value_of_yojson value_ path)
   | "M" -> M (map_attribute_value_of_yojson value_ path)
   | "L" -> L (list_attribute_value_of_yojson value_ path)
   | "NULL" -> NULL (null_attribute_value_of_yojson value_ path)
   | "BOOL" -> BOOL (boolean_attribute_value_of_yojson value_ path)
   | _ as unknown -> raise (deserialize_unknown_enum_value_error path "AttributeValue" unknown)
    : attribute_value)

let attribute_map_of_yojson tree path =
  map_of_yojson attribute_name_of_yojson attribute_value_of_yojson tree path

let date_of_yojson = timestamp_epoch_seconds_of_yojson
let error_message_of_yojson = string_of_yojson

let resource_not_found_exception_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({ message = option_of_yojson (value_for_key error_message_of_yojson "message") _list path }
    : resource_not_found_exception)

let internal_server_error_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({ message = option_of_yojson (value_for_key error_message_of_yojson "message") _list path }
    : internal_server_error)

let shard_id_of_yojson = string_of_yojson
let sequence_number_of_yojson = string_of_yojson

let sequence_number_range_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     starting_sequence_number =
       option_of_yojson
         (value_for_key sequence_number_of_yojson "StartingSequenceNumber")
         _list path;
     ending_sequence_number =
       option_of_yojson (value_for_key sequence_number_of_yojson "EndingSequenceNumber") _list path;
   }
    : sequence_number_range)

let shard_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     shard_id = option_of_yojson (value_for_key shard_id_of_yojson "ShardId") _list path;
     sequence_number_range =
       option_of_yojson
         (value_for_key sequence_number_range_of_yojson "SequenceNumberRange")
         _list path;
     parent_shard_id =
       option_of_yojson (value_for_key shard_id_of_yojson "ParentShardId") _list path;
   }
    : shard)

let shard_description_list_of_yojson tree path = list_of_yojson shard_of_yojson tree path

let key_type_of_yojson (tree : t) path =
  ((match tree with
    | `String "HASH" -> HASH
    | `String "RANGE" -> RANGE
    | `String value -> raise (deserialize_unknown_enum_value_error path "KeyType" value)
    | _ -> raise (deserialize_wrong_type_error path "KeyType")
     : key_type)
    : key_type)

let key_schema_attribute_name_of_yojson = string_of_yojson

let key_schema_element_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     attribute_name = value_for_key key_schema_attribute_name_of_yojson "AttributeName" _list path;
     key_type = value_for_key key_type_of_yojson "KeyType" _list path;
   }
    : key_schema_element)

let key_schema_of_yojson tree path = list_of_yojson key_schema_element_of_yojson tree path
let table_name_of_yojson = string_of_yojson

let stream_view_type_of_yojson (tree : t) path =
  ((match tree with
    | `String "NEW_IMAGE" -> NEW_IMAGE
    | `String "OLD_IMAGE" -> OLD_IMAGE
    | `String "NEW_AND_OLD_IMAGES" -> NEW_AND_OLD_IMAGES
    | `String "KEYS_ONLY" -> KEYS_ONLY
    | `String value -> raise (deserialize_unknown_enum_value_error path "StreamViewType" value)
    | _ -> raise (deserialize_wrong_type_error path "StreamViewType")
     : stream_view_type)
    : stream_view_type)

let stream_status_of_yojson (tree : t) path =
  ((match tree with
    | `String "ENABLING" -> ENABLING
    | `String "ENABLED" -> ENABLED
    | `String "DISABLING" -> DISABLING
    | `String "DISABLED" -> DISABLED
    | `String value -> raise (deserialize_unknown_enum_value_error path "StreamStatus" value)
    | _ -> raise (deserialize_wrong_type_error path "StreamStatus")
     : stream_status)
    : stream_status)

let string__of_yojson = string_of_yojson
let stream_arn_of_yojson = string_of_yojson

let stream_description_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     stream_arn = option_of_yojson (value_for_key stream_arn_of_yojson "StreamArn") _list path;
     stream_label = option_of_yojson (value_for_key string__of_yojson "StreamLabel") _list path;
     stream_status =
       option_of_yojson (value_for_key stream_status_of_yojson "StreamStatus") _list path;
     stream_view_type =
       option_of_yojson (value_for_key stream_view_type_of_yojson "StreamViewType") _list path;
     creation_request_date_time =
       option_of_yojson (value_for_key date_of_yojson "CreationRequestDateTime") _list path;
     table_name = option_of_yojson (value_for_key table_name_of_yojson "TableName") _list path;
     key_schema = option_of_yojson (value_for_key key_schema_of_yojson "KeySchema") _list path;
     shards = option_of_yojson (value_for_key shard_description_list_of_yojson "Shards") _list path;
     last_evaluated_shard_id =
       option_of_yojson (value_for_key shard_id_of_yojson "LastEvaluatedShardId") _list path;
   }
    : stream_description)

let describe_stream_output_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     stream_description =
       option_of_yojson (value_for_key stream_description_of_yojson "StreamDescription") _list path;
   }
    : describe_stream_output)

let shard_filter_type_of_yojson (tree : t) path =
  ((match tree with
    | `String "CHILD_SHARDS" -> CHILD_SHARDS
    | `String value -> raise (deserialize_unknown_enum_value_error path "ShardFilterType" value)
    | _ -> raise (deserialize_wrong_type_error path "ShardFilterType")
     : shard_filter_type)
    : shard_filter_type)

let shard_filter_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     type_ = option_of_yojson (value_for_key shard_filter_type_of_yojson "Type") _list path;
     shard_id = option_of_yojson (value_for_key shard_id_of_yojson "ShardId") _list path;
   }
    : shard_filter)

let positive_integer_object_of_yojson = int_of_yojson

let describe_stream_input_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     stream_arn = value_for_key stream_arn_of_yojson "StreamArn" _list path;
     limit = option_of_yojson (value_for_key positive_integer_object_of_yojson "Limit") _list path;
     exclusive_start_shard_id =
       option_of_yojson (value_for_key shard_id_of_yojson "ExclusiveStartShardId") _list path;
     shard_filter = option_of_yojson (value_for_key shard_filter_of_yojson "ShardFilter") _list path;
   }
    : describe_stream_input)

let stream_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     stream_arn = option_of_yojson (value_for_key stream_arn_of_yojson "StreamArn") _list path;
     table_name = option_of_yojson (value_for_key table_name_of_yojson "TableName") _list path;
     stream_label = option_of_yojson (value_for_key string__of_yojson "StreamLabel") _list path;
   }
    : stream)

let stream_list_of_yojson tree path = list_of_yojson stream_of_yojson tree path

let list_streams_output_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     streams = option_of_yojson (value_for_key stream_list_of_yojson "Streams") _list path;
     last_evaluated_stream_arn =
       option_of_yojson (value_for_key stream_arn_of_yojson "LastEvaluatedStreamArn") _list path;
   }
    : list_streams_output)

let list_streams_input_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     table_name = option_of_yojson (value_for_key table_name_of_yojson "TableName") _list path;
     limit = option_of_yojson (value_for_key positive_integer_object_of_yojson "Limit") _list path;
     exclusive_start_stream_arn =
       option_of_yojson (value_for_key stream_arn_of_yojson "ExclusiveStartStreamArn") _list path;
   }
    : list_streams_input)

let trimmed_data_access_exception_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({ message = option_of_yojson (value_for_key error_message_of_yojson "message") _list path }
    : trimmed_data_access_exception)

let shard_iterator_of_yojson = string_of_yojson

let get_shard_iterator_output_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     shard_iterator =
       option_of_yojson (value_for_key shard_iterator_of_yojson "ShardIterator") _list path;
   }
    : get_shard_iterator_output)

let shard_iterator_type_of_yojson (tree : t) path =
  ((match tree with
    | `String "TRIM_HORIZON" -> TRIM_HORIZON
    | `String "LATEST" -> LATEST
    | `String "AT_SEQUENCE_NUMBER" -> AT_SEQUENCE_NUMBER
    | `String "AFTER_SEQUENCE_NUMBER" -> AFTER_SEQUENCE_NUMBER
    | `String value -> raise (deserialize_unknown_enum_value_error path "ShardIteratorType" value)
    | _ -> raise (deserialize_wrong_type_error path "ShardIteratorType")
     : shard_iterator_type)
    : shard_iterator_type)

let get_shard_iterator_input_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     stream_arn = value_for_key stream_arn_of_yojson "StreamArn" _list path;
     shard_id = value_for_key shard_id_of_yojson "ShardId" _list path;
     shard_iterator_type =
       value_for_key shard_iterator_type_of_yojson "ShardIteratorType" _list path;
     sequence_number =
       option_of_yojson (value_for_key sequence_number_of_yojson "SequenceNumber") _list path;
   }
    : get_shard_iterator_input)

let limit_exceeded_exception_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({ message = option_of_yojson (value_for_key error_message_of_yojson "message") _list path }
    : limit_exceeded_exception)

let expired_iterator_exception_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({ message = option_of_yojson (value_for_key error_message_of_yojson "message") _list path }
    : expired_iterator_exception)

let identity_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     principal_id = option_of_yojson (value_for_key string__of_yojson "PrincipalId") _list path;
     type_ = option_of_yojson (value_for_key string__of_yojson "Type") _list path;
   }
    : identity)

let positive_long_object_of_yojson = long_of_yojson

let stream_record_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     approximate_creation_date_time =
       option_of_yojson (value_for_key date_of_yojson "ApproximateCreationDateTime") _list path;
     keys = option_of_yojson (value_for_key attribute_map_of_yojson "Keys") _list path;
     new_image = option_of_yojson (value_for_key attribute_map_of_yojson "NewImage") _list path;
     old_image = option_of_yojson (value_for_key attribute_map_of_yojson "OldImage") _list path;
     sequence_number =
       option_of_yojson (value_for_key sequence_number_of_yojson "SequenceNumber") _list path;
     size_bytes =
       option_of_yojson (value_for_key positive_long_object_of_yojson "SizeBytes") _list path;
     stream_view_type =
       option_of_yojson (value_for_key stream_view_type_of_yojson "StreamViewType") _list path;
   }
    : stream_record)

let operation_type_of_yojson (tree : t) path =
  ((match tree with
    | `String "INSERT" -> INSERT
    | `String "MODIFY" -> MODIFY
    | `String "REMOVE" -> REMOVE
    | `String value -> raise (deserialize_unknown_enum_value_error path "OperationType" value)
    | _ -> raise (deserialize_wrong_type_error path "OperationType")
     : operation_type)
    : operation_type)

let record_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     event_i_d = option_of_yojson (value_for_key string__of_yojson "eventID") _list path;
     event_name = option_of_yojson (value_for_key operation_type_of_yojson "eventName") _list path;
     event_version = option_of_yojson (value_for_key string__of_yojson "eventVersion") _list path;
     event_source = option_of_yojson (value_for_key string__of_yojson "eventSource") _list path;
     aws_region = option_of_yojson (value_for_key string__of_yojson "awsRegion") _list path;
     dynamodb = option_of_yojson (value_for_key stream_record_of_yojson "dynamodb") _list path;
     user_identity = option_of_yojson (value_for_key identity_of_yojson "userIdentity") _list path;
   }
    : record)

let record_list_of_yojson tree path = list_of_yojson record_of_yojson tree path

let get_records_output_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     records = option_of_yojson (value_for_key record_list_of_yojson "Records") _list path;
     next_shard_iterator =
       option_of_yojson (value_for_key shard_iterator_of_yojson "NextShardIterator") _list path;
   }
    : get_records_output)

let get_records_input_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     shard_iterator = value_for_key shard_iterator_of_yojson "ShardIterator" _list path;
     limit = option_of_yojson (value_for_key positive_integer_object_of_yojson "Limit") _list path;
   }
    : get_records_input)
