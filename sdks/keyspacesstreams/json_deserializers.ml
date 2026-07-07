open Smaws_Lib.Json.DeserializeHelpers
open Types

let validation_exception_type_of_yojson (tree : t) path =
  ((match tree with
    | `String "ExpiredNextToken" -> ExpiredNextToken
    | `String "ExpiredIterator" -> ExpiredIterator
    | `String "TrimmedDataAccess" -> TrimmedDataAccess
    | `String "InvalidFormat" -> InvalidFormat
    | `String value ->
        raise (deserialize_unknown_enum_value_error path "ValidationExceptionType" value)
    | _ -> raise (deserialize_wrong_type_error path "ValidationExceptionType")
     : validation_exception_type)
    : validation_exception_type)

let validation_exception_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     error_code =
       option_of_yojson (value_for_key validation_exception_type_of_yojson "errorCode") _list path;
     message =
       option_of_yojson
         (value_for_key Smaws_Lib.Smithy_api.Json_deserializers.string__of_yojson "message")
         _list path;
   }
    : validation_exception)

let throttling_exception_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     message =
       option_of_yojson
         (value_for_key Smaws_Lib.Smithy_api.Json_deserializers.string__of_yojson "message")
         _list path;
   }
    : throttling_exception)

let table_name_of_yojson = string_of_yojson

let stream_view_type_of_yojson (tree : t) path =
  ((match tree with
    | `String "KEYS_ONLY" -> KEYS_ONLY
    | `String "NEW_AND_OLD_IMAGES" -> NEW_AND_OLD_IMAGES
    | `String "OLD_IMAGE" -> OLD_IMAGE
    | `String "NEW_IMAGE" -> NEW_IMAGE
    | `String value -> raise (deserialize_unknown_enum_value_error path "StreamViewType" value)
    | _ -> raise (deserialize_wrong_type_error path "StreamViewType")
     : stream_view_type)
    : stream_view_type)

let stream_status_of_yojson (tree : t) path =
  ((match tree with
    | `String "DISABLED" -> DISABLED
    | `String "DISABLING" -> DISABLING
    | `String "ENABLED" -> ENABLED
    | `String "ENABLING" -> ENABLING
    | `String value -> raise (deserialize_unknown_enum_value_error path "StreamStatus" value)
    | _ -> raise (deserialize_wrong_type_error path "StreamStatus")
     : stream_status)
    : stream_status)

let stream_arn_of_yojson = string_of_yojson
let keyspace_name_of_yojson = string_of_yojson

let stream_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     stream_label =
       value_for_key Smaws_Lib.Smithy_api.Json_deserializers.string__of_yojson "streamLabel" _list
         path;
     table_name = value_for_key table_name_of_yojson "tableName" _list path;
     keyspace_name = value_for_key keyspace_name_of_yojson "keyspaceName" _list path;
     stream_arn = value_for_key stream_arn_of_yojson "streamArn" _list path;
   }
    : stream)

let stream_list_of_yojson tree path = list_of_yojson stream_of_yojson tree path
let stream_arn_token_of_yojson = string_of_yojson

let shard_iterator_type_of_yojson (tree : t) path =
  ((match tree with
    | `String "AFTER_SEQUENCE_NUMBER" -> AFTER_SEQUENCE_NUMBER
    | `String "AT_SEQUENCE_NUMBER" -> AT_SEQUENCE_NUMBER
    | `String "LATEST" -> LATEST
    | `String "TRIM_HORIZON" -> TRIM_HORIZON
    | `String value -> raise (deserialize_unknown_enum_value_error path "ShardIteratorType" value)
    | _ -> raise (deserialize_wrong_type_error path "ShardIteratorType")
     : shard_iterator_type)
    : shard_iterator_type)

let shard_iterator_of_yojson = string_of_yojson
let shard_id_token_of_yojson = string_of_yojson
let shard_id_of_yojson = string_of_yojson
let shard_id_list_of_yojson tree path = list_of_yojson shard_id_of_yojson tree path

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
     shard_id = option_of_yojson (value_for_key shard_id_of_yojson "shardId") _list path;
     type_ = option_of_yojson (value_for_key shard_filter_type_of_yojson "type") _list path;
   }
    : shard_filter)

let sequence_number_of_yojson = string_of_yojson

let sequence_number_range_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     ending_sequence_number =
       option_of_yojson (value_for_key sequence_number_of_yojson "endingSequenceNumber") _list path;
     starting_sequence_number =
       option_of_yojson
         (value_for_key sequence_number_of_yojson "startingSequenceNumber")
         _list path;
   }
    : sequence_number_range)

let shard_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     parent_shard_ids =
       option_of_yojson (value_for_key shard_id_list_of_yojson "parentShardIds") _list path;
     sequence_number_range =
       option_of_yojson
         (value_for_key sequence_number_range_of_yojson "sequenceNumberRange")
         _list path;
     shard_id = option_of_yojson (value_for_key shard_id_of_yojson "shardId") _list path;
   }
    : shard)

let shard_description_list_of_yojson tree path = list_of_yojson shard_of_yojson tree path

let resource_not_found_exception_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     message =
       option_of_yojson
         (value_for_key Smaws_Lib.Smithy_api.Json_deserializers.string__of_yojson "message")
         _list path;
   }
    : resource_not_found_exception)

let date_of_yojson = timestamp_epoch_seconds_of_yojson

let origin_type_of_yojson (tree : t) path =
  ((match tree with
    | `String "TTL" -> TTL
    | `String "REPLICATION" -> REPLICATION
    | `String "USER" -> USER
    | `String value -> raise (deserialize_unknown_enum_value_error path "OriginType" value)
    | _ -> raise (deserialize_wrong_type_error path "OriginType")
     : origin_type)
    : origin_type)

let keyspaces_metadata_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     write_time =
       option_of_yojson
         (value_for_key Smaws_Lib.Smithy_api.Json_deserializers.string__of_yojson "writeTime")
         _list path;
     expiration_time =
       option_of_yojson
         (value_for_key Smaws_Lib.Smithy_api.Json_deserializers.string__of_yojson "expirationTime")
         _list path;
   }
    : keyspaces_metadata)

let rec keyspaces_cell_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     metadata = option_of_yojson (value_for_key keyspaces_metadata_of_yojson "metadata") _list path;
     value = option_of_yojson (value_for_key keyspaces_cell_value_of_yojson "value") _list path;
   }
    : keyspaces_cell)

and keyspaces_cell_list_of_yojson tree path = list_of_yojson keyspaces_cell_of_yojson tree path

and keyspaces_cell_map_of_yojson tree path =
  list_of_yojson keyspaces_cell_map_definition_of_yojson tree path

and keyspaces_cell_map_definition_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     metadata = option_of_yojson (value_for_key keyspaces_metadata_of_yojson "metadata") _list path;
     value = option_of_yojson (value_for_key keyspaces_cell_value_of_yojson "value") _list path;
     key = option_of_yojson (value_for_key keyspaces_cell_value_of_yojson "key") _list path;
   }
    : keyspaces_cell_map_definition)

and keyspaces_cell_value_of_yojson (tree : t) path =
  let _list = assoc_of_yojson tree path in
  let key, value_ =
    match _list with
    | (key, value_) :: _ -> (key, value_)
    | _ -> raise (deserialize_wrong_type_error path "union")
  in
  (match key with
   | "udtT" -> UdtT (keyspaces_udt_map_of_yojson value_ path)
   | "varintT" -> VarintT (Smaws_Lib.Smithy_api.Json_deserializers.string__of_yojson value_ path)
   | "varcharT" -> VarcharT (Smaws_Lib.Smithy_api.Json_deserializers.string__of_yojson value_ path)
   | "uuidT" -> UuidT (Smaws_Lib.Smithy_api.Json_deserializers.string__of_yojson value_ path)
   | "tupleT" -> TupleT (keyspaces_cell_list_of_yojson value_ path)
   | "tinyintT" -> TinyintT (Smaws_Lib.Smithy_api.Json_deserializers.string__of_yojson value_ path)
   | "timeuuidT" ->
       TimeuuidT (Smaws_Lib.Smithy_api.Json_deserializers.string__of_yojson value_ path)
   | "timestampT" ->
       TimestampT (Smaws_Lib.Smithy_api.Json_deserializers.string__of_yojson value_ path)
   | "timeT" -> TimeT (Smaws_Lib.Smithy_api.Json_deserializers.string__of_yojson value_ path)
   | "textT" -> TextT (Smaws_Lib.Smithy_api.Json_deserializers.string__of_yojson value_ path)
   | "smallintT" ->
       SmallintT (Smaws_Lib.Smithy_api.Json_deserializers.string__of_yojson value_ path)
   | "setT" -> SetT (keyspaces_cell_list_of_yojson value_ path)
   | "mapT" -> MapT (keyspaces_cell_map_of_yojson value_ path)
   | "listT" -> ListT (keyspaces_cell_list_of_yojson value_ path)
   | "intT" -> IntT (Smaws_Lib.Smithy_api.Json_deserializers.string__of_yojson value_ path)
   | "inetT" -> InetT (Smaws_Lib.Smithy_api.Json_deserializers.string__of_yojson value_ path)
   | "floatT" -> FloatT (Smaws_Lib.Smithy_api.Json_deserializers.string__of_yojson value_ path)
   | "durationT" ->
       DurationT (Smaws_Lib.Smithy_api.Json_deserializers.string__of_yojson value_ path)
   | "doubleT" -> DoubleT (Smaws_Lib.Smithy_api.Json_deserializers.string__of_yojson value_ path)
   | "decimalT" -> DecimalT (Smaws_Lib.Smithy_api.Json_deserializers.string__of_yojson value_ path)
   | "dateT" -> DateT (Smaws_Lib.Smithy_api.Json_deserializers.string__of_yojson value_ path)
   | "counterT" -> CounterT (Smaws_Lib.Smithy_api.Json_deserializers.string__of_yojson value_ path)
   | "boolT" -> BoolT (Smaws_Lib.Smithy_api.Json_deserializers.boolean__of_yojson value_ path)
   | "blobT" -> BlobT (Smaws_Lib.Smithy_api.Json_deserializers.blob_of_yojson value_ path)
   | "bigintT" -> BigintT (Smaws_Lib.Smithy_api.Json_deserializers.string__of_yojson value_ path)
   | "asciiT" -> AsciiT (Smaws_Lib.Smithy_api.Json_deserializers.string__of_yojson value_ path)
   | _ as unknown -> raise (deserialize_unknown_enum_value_error path "KeyspacesCellValue" unknown)
    : keyspaces_cell_value)

and keyspaces_udt_map_of_yojson tree path =
  map_of_yojson Smaws_Lib.Smithy_api.Json_deserializers.string__of_yojson keyspaces_cell_of_yojson
    tree path

let keyspaces_keys_map_of_yojson tree path =
  map_of_yojson Smaws_Lib.Smithy_api.Json_deserializers.string__of_yojson
    keyspaces_cell_value_of_yojson tree path

let keyspaces_cells_of_yojson tree path =
  map_of_yojson Smaws_Lib.Smithy_api.Json_deserializers.string__of_yojson keyspaces_cell_of_yojson
    tree path

let keyspaces_row_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     row_metadata =
       option_of_yojson (value_for_key keyspaces_metadata_of_yojson "rowMetadata") _list path;
     static_cells =
       option_of_yojson (value_for_key keyspaces_cells_of_yojson "staticCells") _list path;
     value_cells =
       option_of_yojson (value_for_key keyspaces_cells_of_yojson "valueCells") _list path;
   }
    : keyspaces_row)

let record_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     sequence_number =
       option_of_yojson (value_for_key sequence_number_of_yojson "sequenceNumber") _list path;
     old_image = option_of_yojson (value_for_key keyspaces_row_of_yojson "oldImage") _list path;
     new_image = option_of_yojson (value_for_key keyspaces_row_of_yojson "newImage") _list path;
     clustering_keys =
       option_of_yojson (value_for_key keyspaces_keys_map_of_yojson "clusteringKeys") _list path;
     partition_keys =
       option_of_yojson (value_for_key keyspaces_keys_map_of_yojson "partitionKeys") _list path;
     origin = option_of_yojson (value_for_key origin_type_of_yojson "origin") _list path;
     created_at = option_of_yojson (value_for_key date_of_yojson "createdAt") _list path;
     event_version =
       option_of_yojson
         (value_for_key Smaws_Lib.Smithy_api.Json_deserializers.string__of_yojson "eventVersion")
         _list path;
   }
    : record)

let record_list_of_yojson tree path = list_of_yojson record_of_yojson tree path

let list_streams_output_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     next_token = option_of_yojson (value_for_key stream_arn_token_of_yojson "nextToken") _list path;
     streams = option_of_yojson (value_for_key stream_list_of_yojson "streams") _list path;
   }
    : list_streams_output)

let list_streams_input_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     next_token = option_of_yojson (value_for_key stream_arn_token_of_yojson "nextToken") _list path;
     max_results =
       option_of_yojson
         (value_for_key Smaws_Lib.Smithy_api.Json_deserializers.integer_of_yojson "maxResults")
         _list path;
     table_name = option_of_yojson (value_for_key table_name_of_yojson "tableName") _list path;
     keyspace_name =
       option_of_yojson (value_for_key keyspace_name_of_yojson "keyspaceName") _list path;
   }
    : list_streams_input)

let internal_server_exception_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     message =
       option_of_yojson
         (value_for_key Smaws_Lib.Smithy_api.Json_deserializers.string__of_yojson "message")
         _list path;
   }
    : internal_server_exception)

let access_denied_exception_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     message =
       option_of_yojson
         (value_for_key Smaws_Lib.Smithy_api.Json_deserializers.string__of_yojson "message")
         _list path;
   }
    : access_denied_exception)

let get_stream_output_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     next_token = option_of_yojson (value_for_key shard_id_token_of_yojson "nextToken") _list path;
     shards = option_of_yojson (value_for_key shard_description_list_of_yojson "shards") _list path;
     table_name = value_for_key table_name_of_yojson "tableName" _list path;
     keyspace_name = value_for_key keyspace_name_of_yojson "keyspaceName" _list path;
     creation_request_date_time = value_for_key date_of_yojson "creationRequestDateTime" _list path;
     stream_view_type = value_for_key stream_view_type_of_yojson "streamViewType" _list path;
     stream_status = value_for_key stream_status_of_yojson "streamStatus" _list path;
     stream_label =
       value_for_key Smaws_Lib.Smithy_api.Json_deserializers.string__of_yojson "streamLabel" _list
         path;
     stream_arn = value_for_key stream_arn_of_yojson "streamArn" _list path;
   }
    : get_stream_output)

let get_stream_input_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     next_token = option_of_yojson (value_for_key shard_id_token_of_yojson "nextToken") _list path;
     shard_filter = option_of_yojson (value_for_key shard_filter_of_yojson "shardFilter") _list path;
     max_results =
       option_of_yojson
         (value_for_key Smaws_Lib.Smithy_api.Json_deserializers.integer_of_yojson "maxResults")
         _list path;
     stream_arn = value_for_key stream_arn_of_yojson "streamArn" _list path;
   }
    : get_stream_input)

let get_shard_iterator_output_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     shard_iterator =
       option_of_yojson (value_for_key shard_iterator_of_yojson "shardIterator") _list path;
   }
    : get_shard_iterator_output)

let get_shard_iterator_input_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     sequence_number =
       option_of_yojson (value_for_key sequence_number_of_yojson "sequenceNumber") _list path;
     shard_iterator_type =
       value_for_key shard_iterator_type_of_yojson "shardIteratorType" _list path;
     shard_id = value_for_key shard_id_of_yojson "shardId" _list path;
     stream_arn = value_for_key stream_arn_of_yojson "streamArn" _list path;
   }
    : get_shard_iterator_input)

let iterator_position_of_yojson (tree : t) path =
  ((match tree with
    | `String "BEHIND_TIP" -> BEHIND_TIP
    | `String "AT_TIP" -> AT_TIP
    | `String value -> raise (deserialize_unknown_enum_value_error path "IteratorPosition" value)
    | _ -> raise (deserialize_wrong_type_error path "IteratorPosition")
     : iterator_position)
    : iterator_position)

let iterator_description_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     iterator_position =
       option_of_yojson (value_for_key iterator_position_of_yojson "iteratorPosition") _list path;
   }
    : iterator_description)

let get_records_output_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     iterator_description =
       option_of_yojson
         (value_for_key iterator_description_of_yojson "iteratorDescription")
         _list path;
     next_shard_iterator =
       option_of_yojson (value_for_key shard_iterator_of_yojson "nextShardIterator") _list path;
     change_records =
       option_of_yojson (value_for_key record_list_of_yojson "changeRecords") _list path;
   }
    : get_records_output)

let get_records_input_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     max_results =
       option_of_yojson
         (value_for_key Smaws_Lib.Smithy_api.Json_deserializers.integer_of_yojson "maxResults")
         _list path;
     shard_iterator = value_for_key shard_iterator_of_yojson "shardIterator" _list path;
   }
    : get_records_input)
