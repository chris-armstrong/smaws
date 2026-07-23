open Smaws_Lib.Json.SerializeHelpers
open Types

let access_denied_exception_to_yojson (x : access_denied_exception) =
  assoc_to_yojson
    [
      ("message", option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.string__to_yojson x.message);
    ]

let date_to_yojson = timestamp_epoch_seconds_to_yojson

let validation_exception_type_to_yojson (x : validation_exception_type) =
  match x with
  | InvalidFormat -> `String "InvalidFormat"
  | TrimmedDataAccess -> `String "TrimmedDataAccess"
  | ExpiredIterator -> `String "ExpiredIterator"
  | ExpiredNextToken -> `String "ExpiredNextToken"

let validation_exception_to_yojson (x : validation_exception) =
  assoc_to_yojson
    [
      ("message", option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.string__to_yojson x.message);
      ("errorCode", option_to_yojson validation_exception_type_to_yojson x.error_code);
    ]

let throttling_exception_to_yojson (x : throttling_exception) =
  assoc_to_yojson
    [
      ("message", option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.string__to_yojson x.message);
    ]

let resource_not_found_exception_to_yojson (x : resource_not_found_exception) =
  assoc_to_yojson
    [
      ("message", option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.string__to_yojson x.message);
    ]

let internal_server_exception_to_yojson (x : internal_server_exception) =
  assoc_to_yojson
    [
      ("message", option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.string__to_yojson x.message);
    ]

let iterator_position_to_yojson (x : iterator_position) =
  match x with AT_TIP -> `String "AT_TIP" | BEHIND_TIP -> `String "BEHIND_TIP"

let iterator_description_to_yojson (x : iterator_description) =
  assoc_to_yojson
    [ ("iteratorPosition", option_to_yojson iterator_position_to_yojson x.iterator_position) ]

let shard_iterator_to_yojson = string_to_yojson
let sequence_number_to_yojson = string_to_yojson

let keyspaces_metadata_to_yojson (x : keyspaces_metadata) =
  assoc_to_yojson
    [
      ( "expirationTime",
        option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.string__to_yojson x.expiration_time
      );
      ( "writeTime",
        option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.string__to_yojson x.write_time );
    ]

let rec keyspaces_udt_map_to_yojson tree =
  map_to_yojson Smaws_Lib.Smithy_api.Json_serializers.string__to_yojson keyspaces_cell_to_yojson
    tree

and keyspaces_cell_value_to_yojson (x : keyspaces_cell_value) =
  match x with
  | AsciiT arg ->
      assoc_to_yojson
        [ ("asciiT", Some (Smaws_Lib.Smithy_api.Json_serializers.string__to_yojson arg)) ]
  | BigintT arg ->
      assoc_to_yojson
        [ ("bigintT", Some (Smaws_Lib.Smithy_api.Json_serializers.string__to_yojson arg)) ]
  | BlobT arg ->
      assoc_to_yojson [ ("blobT", Some (Smaws_Lib.Smithy_api.Json_serializers.blob_to_yojson arg)) ]
  | BoolT arg ->
      assoc_to_yojson
        [ ("boolT", Some (Smaws_Lib.Smithy_api.Json_serializers.boolean__to_yojson arg)) ]
  | CounterT arg ->
      assoc_to_yojson
        [ ("counterT", Some (Smaws_Lib.Smithy_api.Json_serializers.string__to_yojson arg)) ]
  | DateT arg ->
      assoc_to_yojson
        [ ("dateT", Some (Smaws_Lib.Smithy_api.Json_serializers.string__to_yojson arg)) ]
  | DecimalT arg ->
      assoc_to_yojson
        [ ("decimalT", Some (Smaws_Lib.Smithy_api.Json_serializers.string__to_yojson arg)) ]
  | DoubleT arg ->
      assoc_to_yojson
        [ ("doubleT", Some (Smaws_Lib.Smithy_api.Json_serializers.string__to_yojson arg)) ]
  | DurationT arg ->
      assoc_to_yojson
        [ ("durationT", Some (Smaws_Lib.Smithy_api.Json_serializers.string__to_yojson arg)) ]
  | FloatT arg ->
      assoc_to_yojson
        [ ("floatT", Some (Smaws_Lib.Smithy_api.Json_serializers.string__to_yojson arg)) ]
  | InetT arg ->
      assoc_to_yojson
        [ ("inetT", Some (Smaws_Lib.Smithy_api.Json_serializers.string__to_yojson arg)) ]
  | IntT arg ->
      assoc_to_yojson
        [ ("intT", Some (Smaws_Lib.Smithy_api.Json_serializers.string__to_yojson arg)) ]
  | ListT arg -> assoc_to_yojson [ ("listT", Some (keyspaces_cell_list_to_yojson arg)) ]
  | MapT arg -> assoc_to_yojson [ ("mapT", Some (keyspaces_cell_map_to_yojson arg)) ]
  | SetT arg -> assoc_to_yojson [ ("setT", Some (keyspaces_cell_list_to_yojson arg)) ]
  | SmallintT arg ->
      assoc_to_yojson
        [ ("smallintT", Some (Smaws_Lib.Smithy_api.Json_serializers.string__to_yojson arg)) ]
  | TextT arg ->
      assoc_to_yojson
        [ ("textT", Some (Smaws_Lib.Smithy_api.Json_serializers.string__to_yojson arg)) ]
  | TimeT arg ->
      assoc_to_yojson
        [ ("timeT", Some (Smaws_Lib.Smithy_api.Json_serializers.string__to_yojson arg)) ]
  | TimestampT arg ->
      assoc_to_yojson
        [ ("timestampT", Some (Smaws_Lib.Smithy_api.Json_serializers.string__to_yojson arg)) ]
  | TimeuuidT arg ->
      assoc_to_yojson
        [ ("timeuuidT", Some (Smaws_Lib.Smithy_api.Json_serializers.string__to_yojson arg)) ]
  | TinyintT arg ->
      assoc_to_yojson
        [ ("tinyintT", Some (Smaws_Lib.Smithy_api.Json_serializers.string__to_yojson arg)) ]
  | TupleT arg -> assoc_to_yojson [ ("tupleT", Some (keyspaces_cell_list_to_yojson arg)) ]
  | UuidT arg ->
      assoc_to_yojson
        [ ("uuidT", Some (Smaws_Lib.Smithy_api.Json_serializers.string__to_yojson arg)) ]
  | VarcharT arg ->
      assoc_to_yojson
        [ ("varcharT", Some (Smaws_Lib.Smithy_api.Json_serializers.string__to_yojson arg)) ]
  | VarintT arg ->
      assoc_to_yojson
        [ ("varintT", Some (Smaws_Lib.Smithy_api.Json_serializers.string__to_yojson arg)) ]
  | UdtT arg -> assoc_to_yojson [ ("udtT", Some (keyspaces_udt_map_to_yojson arg)) ]

and keyspaces_cell_map_definition_to_yojson (x : keyspaces_cell_map_definition) =
  assoc_to_yojson
    [
      ("key", option_to_yojson keyspaces_cell_value_to_yojson x.key);
      ("value", option_to_yojson keyspaces_cell_value_to_yojson x.value);
      ("metadata", option_to_yojson keyspaces_metadata_to_yojson x.metadata);
    ]

and keyspaces_cell_map_to_yojson tree = list_to_yojson keyspaces_cell_map_definition_to_yojson tree
and keyspaces_cell_list_to_yojson tree = list_to_yojson keyspaces_cell_to_yojson tree

and keyspaces_cell_to_yojson (x : keyspaces_cell) =
  assoc_to_yojson
    [
      ("value", option_to_yojson keyspaces_cell_value_to_yojson x.value);
      ("metadata", option_to_yojson keyspaces_metadata_to_yojson x.metadata);
    ]

let keyspaces_cells_to_yojson tree =
  map_to_yojson Smaws_Lib.Smithy_api.Json_serializers.string__to_yojson keyspaces_cell_to_yojson
    tree

let keyspaces_row_to_yojson (x : keyspaces_row) =
  assoc_to_yojson
    [
      ("valueCells", option_to_yojson keyspaces_cells_to_yojson x.value_cells);
      ("staticCells", option_to_yojson keyspaces_cells_to_yojson x.static_cells);
      ("rowMetadata", option_to_yojson keyspaces_metadata_to_yojson x.row_metadata);
    ]

let keyspaces_keys_map_to_yojson tree =
  map_to_yojson Smaws_Lib.Smithy_api.Json_serializers.string__to_yojson
    keyspaces_cell_value_to_yojson tree

let origin_type_to_yojson (x : origin_type) =
  match x with
  | USER -> `String "USER"
  | REPLICATION -> `String "REPLICATION"
  | TTL -> `String "TTL"

let record_to_yojson (x : record) =
  assoc_to_yojson
    [
      ( "eventVersion",
        option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.string__to_yojson x.event_version );
      ("createdAt", option_to_yojson date_to_yojson x.created_at);
      ("origin", option_to_yojson origin_type_to_yojson x.origin);
      ("partitionKeys", option_to_yojson keyspaces_keys_map_to_yojson x.partition_keys);
      ("clusteringKeys", option_to_yojson keyspaces_keys_map_to_yojson x.clustering_keys);
      ("newImage", option_to_yojson keyspaces_row_to_yojson x.new_image);
      ("oldImage", option_to_yojson keyspaces_row_to_yojson x.old_image);
      ("sequenceNumber", option_to_yojson sequence_number_to_yojson x.sequence_number);
    ]

let record_list_to_yojson tree = list_to_yojson record_to_yojson tree

let get_records_output_to_yojson (x : get_records_output) =
  assoc_to_yojson
    [
      ("changeRecords", option_to_yojson record_list_to_yojson x.change_records);
      ("nextShardIterator", option_to_yojson shard_iterator_to_yojson x.next_shard_iterator);
      ("iteratorDescription", option_to_yojson iterator_description_to_yojson x.iterator_description);
    ]

let get_records_input_to_yojson (x : get_records_input) =
  assoc_to_yojson
    [
      ("shardIterator", Some (shard_iterator_to_yojson x.shard_iterator));
      ( "maxResults",
        option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.integer_to_yojson x.max_results );
    ]

let get_shard_iterator_output_to_yojson (x : get_shard_iterator_output) =
  assoc_to_yojson [ ("shardIterator", option_to_yojson shard_iterator_to_yojson x.shard_iterator) ]

let shard_iterator_type_to_yojson (x : shard_iterator_type) =
  match x with
  | TRIM_HORIZON -> `String "TRIM_HORIZON"
  | LATEST -> `String "LATEST"
  | AT_SEQUENCE_NUMBER -> `String "AT_SEQUENCE_NUMBER"
  | AFTER_SEQUENCE_NUMBER -> `String "AFTER_SEQUENCE_NUMBER"

let shard_id_to_yojson = string_to_yojson
let stream_arn_to_yojson = string_to_yojson

let get_shard_iterator_input_to_yojson (x : get_shard_iterator_input) =
  assoc_to_yojson
    [
      ("streamArn", Some (stream_arn_to_yojson x.stream_arn));
      ("shardId", Some (shard_id_to_yojson x.shard_id));
      ("shardIteratorType", Some (shard_iterator_type_to_yojson x.shard_iterator_type));
      ("sequenceNumber", option_to_yojson sequence_number_to_yojson x.sequence_number);
    ]

let shard_id_token_to_yojson = string_to_yojson
let shard_id_list_to_yojson tree = list_to_yojson shard_id_to_yojson tree

let sequence_number_range_to_yojson (x : sequence_number_range) =
  assoc_to_yojson
    [
      ( "startingSequenceNumber",
        option_to_yojson sequence_number_to_yojson x.starting_sequence_number );
      ("endingSequenceNumber", option_to_yojson sequence_number_to_yojson x.ending_sequence_number);
    ]

let shard_to_yojson (x : shard) =
  assoc_to_yojson
    [
      ("shardId", option_to_yojson shard_id_to_yojson x.shard_id);
      ( "sequenceNumberRange",
        option_to_yojson sequence_number_range_to_yojson x.sequence_number_range );
      ("parentShardIds", option_to_yojson shard_id_list_to_yojson x.parent_shard_ids);
    ]

let shard_description_list_to_yojson tree = list_to_yojson shard_to_yojson tree
let table_name_to_yojson = string_to_yojson
let keyspace_name_to_yojson = string_to_yojson

let stream_view_type_to_yojson (x : stream_view_type) =
  match x with
  | NEW_IMAGE -> `String "NEW_IMAGE"
  | OLD_IMAGE -> `String "OLD_IMAGE"
  | NEW_AND_OLD_IMAGES -> `String "NEW_AND_OLD_IMAGES"
  | KEYS_ONLY -> `String "KEYS_ONLY"

let stream_status_to_yojson (x : stream_status) =
  match x with
  | ENABLING -> `String "ENABLING"
  | ENABLED -> `String "ENABLED"
  | DISABLING -> `String "DISABLING"
  | DISABLED -> `String "DISABLED"

let get_stream_output_to_yojson (x : get_stream_output) =
  assoc_to_yojson
    [
      ("streamArn", Some (stream_arn_to_yojson x.stream_arn));
      ("streamLabel", Some (Smaws_Lib.Smithy_api.Json_serializers.string__to_yojson x.stream_label));
      ("streamStatus", Some (stream_status_to_yojson x.stream_status));
      ("streamViewType", Some (stream_view_type_to_yojson x.stream_view_type));
      ("creationRequestDateTime", Some (date_to_yojson x.creation_request_date_time));
      ("keyspaceName", Some (keyspace_name_to_yojson x.keyspace_name));
      ("tableName", Some (table_name_to_yojson x.table_name));
      ("shards", option_to_yojson shard_description_list_to_yojson x.shards);
      ("nextToken", option_to_yojson shard_id_token_to_yojson x.next_token);
    ]

let shard_filter_type_to_yojson (x : shard_filter_type) =
  match x with CHILD_SHARDS -> `String "CHILD_SHARDS"

let shard_filter_to_yojson (x : shard_filter) =
  assoc_to_yojson
    [
      ("type", option_to_yojson shard_filter_type_to_yojson x.type_);
      ("shardId", option_to_yojson shard_id_to_yojson x.shard_id);
    ]

let get_stream_input_to_yojson (x : get_stream_input) =
  assoc_to_yojson
    [
      ("streamArn", Some (stream_arn_to_yojson x.stream_arn));
      ( "maxResults",
        option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.integer_to_yojson x.max_results );
      ("shardFilter", option_to_yojson shard_filter_to_yojson x.shard_filter);
      ("nextToken", option_to_yojson shard_id_token_to_yojson x.next_token);
    ]

let stream_arn_token_to_yojson = string_to_yojson

let stream_to_yojson (x : stream) =
  assoc_to_yojson
    [
      ("streamArn", Some (stream_arn_to_yojson x.stream_arn));
      ("keyspaceName", Some (keyspace_name_to_yojson x.keyspace_name));
      ("tableName", Some (table_name_to_yojson x.table_name));
      ("streamLabel", Some (Smaws_Lib.Smithy_api.Json_serializers.string__to_yojson x.stream_label));
    ]

let stream_list_to_yojson tree = list_to_yojson stream_to_yojson tree

let list_streams_output_to_yojson (x : list_streams_output) =
  assoc_to_yojson
    [
      ("streams", option_to_yojson stream_list_to_yojson x.streams);
      ("nextToken", option_to_yojson stream_arn_token_to_yojson x.next_token);
    ]

let list_streams_input_to_yojson (x : list_streams_input) =
  assoc_to_yojson
    [
      ("keyspaceName", option_to_yojson keyspace_name_to_yojson x.keyspace_name);
      ("tableName", option_to_yojson table_name_to_yojson x.table_name);
      ( "maxResults",
        option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.integer_to_yojson x.max_results );
      ("nextToken", option_to_yojson stream_arn_token_to_yojson x.next_token);
    ]
