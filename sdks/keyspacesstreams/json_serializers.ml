open Smaws_Lib.Json.SerializeHelpers
open Types

let validation_exception_type_to_yojson (x : validation_exception_type) =
  match x with
  | ExpiredNextToken -> `String "ExpiredNextToken"
  | ExpiredIterator -> `String "ExpiredIterator"
  | TrimmedDataAccess -> `String "TrimmedDataAccess"
  | InvalidFormat -> `String "InvalidFormat"

let validation_exception_to_yojson (x : validation_exception) =
  assoc_to_yojson
    [
      ("errorCode", option_to_yojson validation_exception_type_to_yojson x.error_code);
      ("message", option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.string__to_yojson x.message);
    ]

let throttling_exception_to_yojson (x : throttling_exception) =
  assoc_to_yojson
    [
      ("message", option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.string__to_yojson x.message);
    ]

let table_name_to_yojson = string_to_yojson

let stream_view_type_to_yojson (x : stream_view_type) =
  match x with
  | KEYS_ONLY -> `String "KEYS_ONLY"
  | NEW_AND_OLD_IMAGES -> `String "NEW_AND_OLD_IMAGES"
  | OLD_IMAGE -> `String "OLD_IMAGE"
  | NEW_IMAGE -> `String "NEW_IMAGE"

let stream_status_to_yojson (x : stream_status) =
  match x with
  | DISABLED -> `String "DISABLED"
  | DISABLING -> `String "DISABLING"
  | ENABLED -> `String "ENABLED"
  | ENABLING -> `String "ENABLING"

let stream_arn_to_yojson = string_to_yojson
let keyspace_name_to_yojson = string_to_yojson

let stream_to_yojson (x : stream) =
  assoc_to_yojson
    [
      ("streamLabel", Some (Smaws_Lib.Smithy_api.Json_serializers.string__to_yojson x.stream_label));
      ("tableName", Some (table_name_to_yojson x.table_name));
      ("keyspaceName", Some (keyspace_name_to_yojson x.keyspace_name));
      ("streamArn", Some (stream_arn_to_yojson x.stream_arn));
    ]

let stream_list_to_yojson tree = list_to_yojson stream_to_yojson tree
let stream_arn_token_to_yojson = string_to_yojson

let shard_iterator_type_to_yojson (x : shard_iterator_type) =
  match x with
  | AFTER_SEQUENCE_NUMBER -> `String "AFTER_SEQUENCE_NUMBER"
  | AT_SEQUENCE_NUMBER -> `String "AT_SEQUENCE_NUMBER"
  | LATEST -> `String "LATEST"
  | TRIM_HORIZON -> `String "TRIM_HORIZON"

let shard_iterator_to_yojson = string_to_yojson
let shard_id_token_to_yojson = string_to_yojson
let shard_id_to_yojson = string_to_yojson
let shard_id_list_to_yojson tree = list_to_yojson shard_id_to_yojson tree

let shard_filter_type_to_yojson (x : shard_filter_type) =
  match x with CHILD_SHARDS -> `String "CHILD_SHARDS"

let shard_filter_to_yojson (x : shard_filter) =
  assoc_to_yojson
    [
      ("shardId", option_to_yojson shard_id_to_yojson x.shard_id);
      ("type", option_to_yojson shard_filter_type_to_yojson x.type_);
    ]

let sequence_number_to_yojson = string_to_yojson

let sequence_number_range_to_yojson (x : sequence_number_range) =
  assoc_to_yojson
    [
      ("endingSequenceNumber", option_to_yojson sequence_number_to_yojson x.ending_sequence_number);
      ( "startingSequenceNumber",
        option_to_yojson sequence_number_to_yojson x.starting_sequence_number );
    ]

let shard_to_yojson (x : shard) =
  assoc_to_yojson
    [
      ("parentShardIds", option_to_yojson shard_id_list_to_yojson x.parent_shard_ids);
      ( "sequenceNumberRange",
        option_to_yojson sequence_number_range_to_yojson x.sequence_number_range );
      ("shardId", option_to_yojson shard_id_to_yojson x.shard_id);
    ]

let shard_description_list_to_yojson tree = list_to_yojson shard_to_yojson tree

let resource_not_found_exception_to_yojson (x : resource_not_found_exception) =
  assoc_to_yojson
    [
      ("message", option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.string__to_yojson x.message);
    ]

let date_to_yojson = timestamp_epoch_seconds_to_yojson

let origin_type_to_yojson (x : origin_type) =
  match x with
  | TTL -> `String "TTL"
  | REPLICATION -> `String "REPLICATION"
  | USER -> `String "USER"

let keyspaces_metadata_to_yojson (x : keyspaces_metadata) =
  assoc_to_yojson
    [
      ( "writeTime",
        option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.string__to_yojson x.write_time );
      ( "expirationTime",
        option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.string__to_yojson x.expiration_time
      );
    ]

let rec keyspaces_cell_to_yojson (x : keyspaces_cell) =
  assoc_to_yojson
    [
      ("metadata", option_to_yojson keyspaces_metadata_to_yojson x.metadata);
      ("value", option_to_yojson keyspaces_cell_value_to_yojson x.value);
    ]

and keyspaces_cell_list_to_yojson tree = list_to_yojson keyspaces_cell_to_yojson tree
and keyspaces_cell_map_to_yojson tree = list_to_yojson keyspaces_cell_map_definition_to_yojson tree

and keyspaces_cell_map_definition_to_yojson (x : keyspaces_cell_map_definition) =
  assoc_to_yojson
    [
      ("metadata", option_to_yojson keyspaces_metadata_to_yojson x.metadata);
      ("value", option_to_yojson keyspaces_cell_value_to_yojson x.value);
      ("key", option_to_yojson keyspaces_cell_value_to_yojson x.key);
    ]

and keyspaces_cell_value_to_yojson (x : keyspaces_cell_value) =
  match x with
  | UdtT arg -> assoc_to_yojson [ ("udtT", Some (keyspaces_udt_map_to_yojson arg)) ]
  | VarintT arg ->
      assoc_to_yojson
        [ ("varintT", Some (Smaws_Lib.Smithy_api.Json_serializers.string__to_yojson arg)) ]
  | VarcharT arg ->
      assoc_to_yojson
        [ ("varcharT", Some (Smaws_Lib.Smithy_api.Json_serializers.string__to_yojson arg)) ]
  | UuidT arg ->
      assoc_to_yojson
        [ ("uuidT", Some (Smaws_Lib.Smithy_api.Json_serializers.string__to_yojson arg)) ]
  | TupleT arg -> assoc_to_yojson [ ("tupleT", Some (keyspaces_cell_list_to_yojson arg)) ]
  | TinyintT arg ->
      assoc_to_yojson
        [ ("tinyintT", Some (Smaws_Lib.Smithy_api.Json_serializers.string__to_yojson arg)) ]
  | TimeuuidT arg ->
      assoc_to_yojson
        [ ("timeuuidT", Some (Smaws_Lib.Smithy_api.Json_serializers.string__to_yojson arg)) ]
  | TimestampT arg ->
      assoc_to_yojson
        [ ("timestampT", Some (Smaws_Lib.Smithy_api.Json_serializers.string__to_yojson arg)) ]
  | TimeT arg ->
      assoc_to_yojson
        [ ("timeT", Some (Smaws_Lib.Smithy_api.Json_serializers.string__to_yojson arg)) ]
  | TextT arg ->
      assoc_to_yojson
        [ ("textT", Some (Smaws_Lib.Smithy_api.Json_serializers.string__to_yojson arg)) ]
  | SmallintT arg ->
      assoc_to_yojson
        [ ("smallintT", Some (Smaws_Lib.Smithy_api.Json_serializers.string__to_yojson arg)) ]
  | SetT arg -> assoc_to_yojson [ ("setT", Some (keyspaces_cell_list_to_yojson arg)) ]
  | MapT arg -> assoc_to_yojson [ ("mapT", Some (keyspaces_cell_map_to_yojson arg)) ]
  | ListT arg -> assoc_to_yojson [ ("listT", Some (keyspaces_cell_list_to_yojson arg)) ]
  | IntT arg ->
      assoc_to_yojson
        [ ("intT", Some (Smaws_Lib.Smithy_api.Json_serializers.string__to_yojson arg)) ]
  | InetT arg ->
      assoc_to_yojson
        [ ("inetT", Some (Smaws_Lib.Smithy_api.Json_serializers.string__to_yojson arg)) ]
  | FloatT arg ->
      assoc_to_yojson
        [ ("floatT", Some (Smaws_Lib.Smithy_api.Json_serializers.string__to_yojson arg)) ]
  | DurationT arg ->
      assoc_to_yojson
        [ ("durationT", Some (Smaws_Lib.Smithy_api.Json_serializers.string__to_yojson arg)) ]
  | DoubleT arg ->
      assoc_to_yojson
        [ ("doubleT", Some (Smaws_Lib.Smithy_api.Json_serializers.string__to_yojson arg)) ]
  | DecimalT arg ->
      assoc_to_yojson
        [ ("decimalT", Some (Smaws_Lib.Smithy_api.Json_serializers.string__to_yojson arg)) ]
  | DateT arg ->
      assoc_to_yojson
        [ ("dateT", Some (Smaws_Lib.Smithy_api.Json_serializers.string__to_yojson arg)) ]
  | CounterT arg ->
      assoc_to_yojson
        [ ("counterT", Some (Smaws_Lib.Smithy_api.Json_serializers.string__to_yojson arg)) ]
  | BoolT arg ->
      assoc_to_yojson
        [ ("boolT", Some (Smaws_Lib.Smithy_api.Json_serializers.boolean__to_yojson arg)) ]
  | BlobT arg ->
      assoc_to_yojson [ ("blobT", Some (Smaws_Lib.Smithy_api.Json_serializers.blob_to_yojson arg)) ]
  | BigintT arg ->
      assoc_to_yojson
        [ ("bigintT", Some (Smaws_Lib.Smithy_api.Json_serializers.string__to_yojson arg)) ]
  | AsciiT arg ->
      assoc_to_yojson
        [ ("asciiT", Some (Smaws_Lib.Smithy_api.Json_serializers.string__to_yojson arg)) ]

and keyspaces_udt_map_to_yojson tree =
  map_to_yojson Smaws_Lib.Smithy_api.Json_serializers.string__to_yojson keyspaces_cell_to_yojson
    tree

let keyspaces_keys_map_to_yojson tree =
  map_to_yojson Smaws_Lib.Smithy_api.Json_serializers.string__to_yojson
    keyspaces_cell_value_to_yojson tree

let keyspaces_cells_to_yojson tree =
  map_to_yojson Smaws_Lib.Smithy_api.Json_serializers.string__to_yojson keyspaces_cell_to_yojson
    tree

let keyspaces_row_to_yojson (x : keyspaces_row) =
  assoc_to_yojson
    [
      ("rowMetadata", option_to_yojson keyspaces_metadata_to_yojson x.row_metadata);
      ("staticCells", option_to_yojson keyspaces_cells_to_yojson x.static_cells);
      ("valueCells", option_to_yojson keyspaces_cells_to_yojson x.value_cells);
    ]

let record_to_yojson (x : record) =
  assoc_to_yojson
    [
      ("sequenceNumber", option_to_yojson sequence_number_to_yojson x.sequence_number);
      ("oldImage", option_to_yojson keyspaces_row_to_yojson x.old_image);
      ("newImage", option_to_yojson keyspaces_row_to_yojson x.new_image);
      ("clusteringKeys", option_to_yojson keyspaces_keys_map_to_yojson x.clustering_keys);
      ("partitionKeys", option_to_yojson keyspaces_keys_map_to_yojson x.partition_keys);
      ("origin", option_to_yojson origin_type_to_yojson x.origin);
      ("createdAt", option_to_yojson date_to_yojson x.created_at);
      ( "eventVersion",
        option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.string__to_yojson x.event_version );
    ]

let record_list_to_yojson tree = list_to_yojson record_to_yojson tree

let list_streams_output_to_yojson (x : list_streams_output) =
  assoc_to_yojson
    [
      ("nextToken", option_to_yojson stream_arn_token_to_yojson x.next_token);
      ("streams", option_to_yojson stream_list_to_yojson x.streams);
    ]

let list_streams_input_to_yojson (x : list_streams_input) =
  assoc_to_yojson
    [
      ("nextToken", option_to_yojson stream_arn_token_to_yojson x.next_token);
      ( "maxResults",
        option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.integer_to_yojson x.max_results );
      ("tableName", option_to_yojson table_name_to_yojson x.table_name);
      ("keyspaceName", option_to_yojson keyspace_name_to_yojson x.keyspace_name);
    ]

let internal_server_exception_to_yojson (x : internal_server_exception) =
  assoc_to_yojson
    [
      ("message", option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.string__to_yojson x.message);
    ]

let access_denied_exception_to_yojson (x : access_denied_exception) =
  assoc_to_yojson
    [
      ("message", option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.string__to_yojson x.message);
    ]

let get_stream_output_to_yojson (x : get_stream_output) =
  assoc_to_yojson
    [
      ("nextToken", option_to_yojson shard_id_token_to_yojson x.next_token);
      ("shards", option_to_yojson shard_description_list_to_yojson x.shards);
      ("tableName", Some (table_name_to_yojson x.table_name));
      ("keyspaceName", Some (keyspace_name_to_yojson x.keyspace_name));
      ("creationRequestDateTime", Some (date_to_yojson x.creation_request_date_time));
      ("streamViewType", Some (stream_view_type_to_yojson x.stream_view_type));
      ("streamStatus", Some (stream_status_to_yojson x.stream_status));
      ("streamLabel", Some (Smaws_Lib.Smithy_api.Json_serializers.string__to_yojson x.stream_label));
      ("streamArn", Some (stream_arn_to_yojson x.stream_arn));
    ]

let get_stream_input_to_yojson (x : get_stream_input) =
  assoc_to_yojson
    [
      ("nextToken", option_to_yojson shard_id_token_to_yojson x.next_token);
      ("shardFilter", option_to_yojson shard_filter_to_yojson x.shard_filter);
      ( "maxResults",
        option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.integer_to_yojson x.max_results );
      ("streamArn", Some (stream_arn_to_yojson x.stream_arn));
    ]

let get_shard_iterator_output_to_yojson (x : get_shard_iterator_output) =
  assoc_to_yojson [ ("shardIterator", option_to_yojson shard_iterator_to_yojson x.shard_iterator) ]

let get_shard_iterator_input_to_yojson (x : get_shard_iterator_input) =
  assoc_to_yojson
    [
      ("sequenceNumber", option_to_yojson sequence_number_to_yojson x.sequence_number);
      ("shardIteratorType", Some (shard_iterator_type_to_yojson x.shard_iterator_type));
      ("shardId", Some (shard_id_to_yojson x.shard_id));
      ("streamArn", Some (stream_arn_to_yojson x.stream_arn));
    ]

let iterator_position_to_yojson (x : iterator_position) =
  match x with BEHIND_TIP -> `String "BEHIND_TIP" | AT_TIP -> `String "AT_TIP"

let iterator_description_to_yojson (x : iterator_description) =
  assoc_to_yojson
    [ ("iteratorPosition", option_to_yojson iterator_position_to_yojson x.iterator_position) ]

let get_records_output_to_yojson (x : get_records_output) =
  assoc_to_yojson
    [
      ("iteratorDescription", option_to_yojson iterator_description_to_yojson x.iterator_description);
      ("nextShardIterator", option_to_yojson shard_iterator_to_yojson x.next_shard_iterator);
      ("changeRecords", option_to_yojson record_list_to_yojson x.change_records);
    ]

let get_records_input_to_yojson (x : get_records_input) =
  assoc_to_yojson
    [
      ( "maxResults",
        option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.integer_to_yojson x.max_results );
      ("shardIterator", Some (shard_iterator_to_yojson x.shard_iterator));
    ]
