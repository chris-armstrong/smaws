open Smaws_Lib.Json.SerializeHelpers
open Types

let boolean_attribute_value_to_yojson = bool_to_yojson
let null_attribute_value_to_yojson = bool_to_yojson
let attribute_name_to_yojson = string_to_yojson
let binary_attribute_value_to_yojson = blob_to_yojson
let binary_set_attribute_value_to_yojson tree = list_to_yojson binary_attribute_value_to_yojson tree
let number_attribute_value_to_yojson = string_to_yojson
let number_set_attribute_value_to_yojson tree = list_to_yojson number_attribute_value_to_yojson tree
let string_attribute_value_to_yojson = string_to_yojson
let string_set_attribute_value_to_yojson tree = list_to_yojson string_attribute_value_to_yojson tree

let rec map_attribute_value_to_yojson tree =
  map_to_yojson attribute_name_to_yojson attribute_value_to_yojson tree

and list_attribute_value_to_yojson tree = list_to_yojson attribute_value_to_yojson tree

and attribute_value_to_yojson (x : attribute_value) =
  match x with
  | S arg -> assoc_to_yojson [ ("S", Some (string_attribute_value_to_yojson arg)) ]
  | N arg -> assoc_to_yojson [ ("N", Some (number_attribute_value_to_yojson arg)) ]
  | B arg -> assoc_to_yojson [ ("B", Some (binary_attribute_value_to_yojson arg)) ]
  | SS arg -> assoc_to_yojson [ ("SS", Some (string_set_attribute_value_to_yojson arg)) ]
  | NS arg -> assoc_to_yojson [ ("NS", Some (number_set_attribute_value_to_yojson arg)) ]
  | BS arg -> assoc_to_yojson [ ("BS", Some (binary_set_attribute_value_to_yojson arg)) ]
  | M arg -> assoc_to_yojson [ ("M", Some (map_attribute_value_to_yojson arg)) ]
  | L arg -> assoc_to_yojson [ ("L", Some (list_attribute_value_to_yojson arg)) ]
  | NULL arg -> assoc_to_yojson [ ("NULL", Some (null_attribute_value_to_yojson arg)) ]
  | BOOL arg -> assoc_to_yojson [ ("BOOL", Some (boolean_attribute_value_to_yojson arg)) ]

let attribute_map_to_yojson tree =
  map_to_yojson attribute_name_to_yojson attribute_value_to_yojson tree

let date_to_yojson = timestamp_epoch_seconds_to_yojson
let error_message_to_yojson = string_to_yojson

let resource_not_found_exception_to_yojson (x : resource_not_found_exception) =
  assoc_to_yojson [ ("message", option_to_yojson error_message_to_yojson x.message) ]

let internal_server_error_to_yojson (x : internal_server_error) =
  assoc_to_yojson [ ("message", option_to_yojson error_message_to_yojson x.message) ]

let shard_id_to_yojson = string_to_yojson
let sequence_number_to_yojson = string_to_yojson

let sequence_number_range_to_yojson (x : sequence_number_range) =
  assoc_to_yojson
    [
      ( "StartingSequenceNumber",
        option_to_yojson sequence_number_to_yojson x.starting_sequence_number );
      ("EndingSequenceNumber", option_to_yojson sequence_number_to_yojson x.ending_sequence_number);
    ]

let shard_to_yojson (x : shard) =
  assoc_to_yojson
    [
      ("ShardId", option_to_yojson shard_id_to_yojson x.shard_id);
      ( "SequenceNumberRange",
        option_to_yojson sequence_number_range_to_yojson x.sequence_number_range );
      ("ParentShardId", option_to_yojson shard_id_to_yojson x.parent_shard_id);
    ]

let shard_description_list_to_yojson tree = list_to_yojson shard_to_yojson tree

let key_type_to_yojson (x : key_type) =
  match x with HASH -> `String "HASH" | RANGE -> `String "RANGE"

let key_schema_attribute_name_to_yojson = string_to_yojson

let key_schema_element_to_yojson (x : key_schema_element) =
  assoc_to_yojson
    [
      ("AttributeName", Some (key_schema_attribute_name_to_yojson x.attribute_name));
      ("KeyType", Some (key_type_to_yojson x.key_type));
    ]

let key_schema_to_yojson tree = list_to_yojson key_schema_element_to_yojson tree
let table_name_to_yojson = string_to_yojson

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

let string__to_yojson = string_to_yojson
let stream_arn_to_yojson = string_to_yojson

let stream_description_to_yojson (x : stream_description) =
  assoc_to_yojson
    [
      ("StreamArn", option_to_yojson stream_arn_to_yojson x.stream_arn);
      ("StreamLabel", option_to_yojson string__to_yojson x.stream_label);
      ("StreamStatus", option_to_yojson stream_status_to_yojson x.stream_status);
      ("StreamViewType", option_to_yojson stream_view_type_to_yojson x.stream_view_type);
      ("CreationRequestDateTime", option_to_yojson date_to_yojson x.creation_request_date_time);
      ("TableName", option_to_yojson table_name_to_yojson x.table_name);
      ("KeySchema", option_to_yojson key_schema_to_yojson x.key_schema);
      ("Shards", option_to_yojson shard_description_list_to_yojson x.shards);
      ("LastEvaluatedShardId", option_to_yojson shard_id_to_yojson x.last_evaluated_shard_id);
    ]

let describe_stream_output_to_yojson (x : describe_stream_output) =
  assoc_to_yojson
    [ ("StreamDescription", option_to_yojson stream_description_to_yojson x.stream_description) ]

let shard_filter_type_to_yojson (x : shard_filter_type) =
  match x with CHILD_SHARDS -> `String "CHILD_SHARDS"

let shard_filter_to_yojson (x : shard_filter) =
  assoc_to_yojson
    [
      ("Type", option_to_yojson shard_filter_type_to_yojson x.type_);
      ("ShardId", option_to_yojson shard_id_to_yojson x.shard_id);
    ]

let positive_integer_object_to_yojson = int_to_yojson

let describe_stream_input_to_yojson (x : describe_stream_input) =
  assoc_to_yojson
    [
      ("StreamArn", Some (stream_arn_to_yojson x.stream_arn));
      ("Limit", option_to_yojson positive_integer_object_to_yojson x.limit);
      ("ExclusiveStartShardId", option_to_yojson shard_id_to_yojson x.exclusive_start_shard_id);
      ("ShardFilter", option_to_yojson shard_filter_to_yojson x.shard_filter);
    ]

let stream_to_yojson (x : stream) =
  assoc_to_yojson
    [
      ("StreamArn", option_to_yojson stream_arn_to_yojson x.stream_arn);
      ("TableName", option_to_yojson table_name_to_yojson x.table_name);
      ("StreamLabel", option_to_yojson string__to_yojson x.stream_label);
    ]

let stream_list_to_yojson tree = list_to_yojson stream_to_yojson tree

let list_streams_output_to_yojson (x : list_streams_output) =
  assoc_to_yojson
    [
      ("Streams", option_to_yojson stream_list_to_yojson x.streams);
      ("LastEvaluatedStreamArn", option_to_yojson stream_arn_to_yojson x.last_evaluated_stream_arn);
    ]

let list_streams_input_to_yojson (x : list_streams_input) =
  assoc_to_yojson
    [
      ("TableName", option_to_yojson table_name_to_yojson x.table_name);
      ("Limit", option_to_yojson positive_integer_object_to_yojson x.limit);
      ("ExclusiveStartStreamArn", option_to_yojson stream_arn_to_yojson x.exclusive_start_stream_arn);
    ]

let trimmed_data_access_exception_to_yojson (x : trimmed_data_access_exception) =
  assoc_to_yojson [ ("message", option_to_yojson error_message_to_yojson x.message) ]

let shard_iterator_to_yojson = string_to_yojson

let get_shard_iterator_output_to_yojson (x : get_shard_iterator_output) =
  assoc_to_yojson [ ("ShardIterator", option_to_yojson shard_iterator_to_yojson x.shard_iterator) ]

let shard_iterator_type_to_yojson (x : shard_iterator_type) =
  match x with
  | TRIM_HORIZON -> `String "TRIM_HORIZON"
  | LATEST -> `String "LATEST"
  | AT_SEQUENCE_NUMBER -> `String "AT_SEQUENCE_NUMBER"
  | AFTER_SEQUENCE_NUMBER -> `String "AFTER_SEQUENCE_NUMBER"

let get_shard_iterator_input_to_yojson (x : get_shard_iterator_input) =
  assoc_to_yojson
    [
      ("StreamArn", Some (stream_arn_to_yojson x.stream_arn));
      ("ShardId", Some (shard_id_to_yojson x.shard_id));
      ("ShardIteratorType", Some (shard_iterator_type_to_yojson x.shard_iterator_type));
      ("SequenceNumber", option_to_yojson sequence_number_to_yojson x.sequence_number);
    ]

let limit_exceeded_exception_to_yojson (x : limit_exceeded_exception) =
  assoc_to_yojson [ ("message", option_to_yojson error_message_to_yojson x.message) ]

let expired_iterator_exception_to_yojson (x : expired_iterator_exception) =
  assoc_to_yojson [ ("message", option_to_yojson error_message_to_yojson x.message) ]

let identity_to_yojson (x : identity) =
  assoc_to_yojson
    [
      ("PrincipalId", option_to_yojson string__to_yojson x.principal_id);
      ("Type", option_to_yojson string__to_yojson x.type_);
    ]

let positive_long_object_to_yojson = long_to_yojson

let stream_record_to_yojson (x : stream_record) =
  assoc_to_yojson
    [
      ( "ApproximateCreationDateTime",
        option_to_yojson date_to_yojson x.approximate_creation_date_time );
      ("Keys", option_to_yojson attribute_map_to_yojson x.keys);
      ("NewImage", option_to_yojson attribute_map_to_yojson x.new_image);
      ("OldImage", option_to_yojson attribute_map_to_yojson x.old_image);
      ("SequenceNumber", option_to_yojson sequence_number_to_yojson x.sequence_number);
      ("SizeBytes", option_to_yojson positive_long_object_to_yojson x.size_bytes);
      ("StreamViewType", option_to_yojson stream_view_type_to_yojson x.stream_view_type);
    ]

let operation_type_to_yojson (x : operation_type) =
  match x with
  | INSERT -> `String "INSERT"
  | MODIFY -> `String "MODIFY"
  | REMOVE -> `String "REMOVE"

let record_to_yojson (x : record) =
  assoc_to_yojson
    [
      ("eventID", option_to_yojson string__to_yojson x.event_i_d);
      ("eventName", option_to_yojson operation_type_to_yojson x.event_name);
      ("eventVersion", option_to_yojson string__to_yojson x.event_version);
      ("eventSource", option_to_yojson string__to_yojson x.event_source);
      ("awsRegion", option_to_yojson string__to_yojson x.aws_region);
      ("dynamodb", option_to_yojson stream_record_to_yojson x.dynamodb);
      ("userIdentity", option_to_yojson identity_to_yojson x.user_identity);
    ]

let record_list_to_yojson tree = list_to_yojson record_to_yojson tree

let get_records_output_to_yojson (x : get_records_output) =
  assoc_to_yojson
    [
      ("Records", option_to_yojson record_list_to_yojson x.records);
      ("NextShardIterator", option_to_yojson shard_iterator_to_yojson x.next_shard_iterator);
    ]

let get_records_input_to_yojson (x : get_records_input) =
  assoc_to_yojson
    [
      ("ShardIterator", Some (shard_iterator_to_yojson x.shard_iterator));
      ("Limit", option_to_yojson positive_integer_object_to_yojson x.limit);
    ]
