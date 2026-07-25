open Smaws_Lib.Json.SerializeHelpers
open Types

let error_message_to_yojson = string_to_yojson

let access_denied_exception_to_yojson (x : access_denied_exception) =
  assoc_to_yojson [ ("message", option_to_yojson error_message_to_yojson x.message) ]

let resource_not_found_exception_to_yojson (x : resource_not_found_exception) =
  assoc_to_yojson [ ("message", option_to_yojson error_message_to_yojson x.message) ]

let resource_in_use_exception_to_yojson (x : resource_in_use_exception) =
  assoc_to_yojson [ ("message", option_to_yojson error_message_to_yojson x.message) ]

let limit_exceeded_exception_to_yojson (x : limit_exceeded_exception) =
  assoc_to_yojson [ ("message", option_to_yojson error_message_to_yojson x.message) ]

let invalid_argument_exception_to_yojson (x : invalid_argument_exception) =
  assoc_to_yojson [ ("message", option_to_yojson error_message_to_yojson x.message) ]

let stream_id_to_yojson = string_to_yojson
let stream_ar_n_to_yojson = string_to_yojson
let tag_value_to_yojson = string_to_yojson
let tag_key_to_yojson = string_to_yojson
let tag_map_to_yojson tree = map_to_yojson tag_key_to_yojson tag_value_to_yojson tree
let stream_name_to_yojson = string_to_yojson

let add_tags_to_stream_input_to_yojson (x : add_tags_to_stream_input) =
  assoc_to_yojson
    [
      ("StreamName", option_to_yojson stream_name_to_yojson x.stream_name);
      ("Tags", Some (tag_map_to_yojson x.tags));
      ("StreamARN", option_to_yojson stream_ar_n_to_yojson x.stream_ar_n);
      ("StreamId", option_to_yojson stream_id_to_yojson x.stream_id);
    ]

let boolean_object_to_yojson = bool_to_yojson
let hash_key_to_yojson = string_to_yojson

let hash_key_range_to_yojson (x : hash_key_range) =
  assoc_to_yojson
    [
      ("StartingHashKey", Some (hash_key_to_yojson x.starting_hash_key));
      ("EndingHashKey", Some (hash_key_to_yojson x.ending_hash_key));
    ]

let shard_id_to_yojson = string_to_yojson
let shard_id_list_to_yojson tree = list_to_yojson shard_id_to_yojson tree

let child_shard_to_yojson (x : child_shard) =
  assoc_to_yojson
    [
      ("ShardId", Some (shard_id_to_yojson x.shard_id));
      ("ParentShards", Some (shard_id_list_to_yojson x.parent_shards));
      ("HashKeyRange", Some (hash_key_range_to_yojson x.hash_key_range));
    ]

let child_shard_list_to_yojson tree = list_to_yojson child_shard_to_yojson tree
let timestamp_to_yojson = timestamp_epoch_seconds_to_yojson

let consumer_status_to_yojson (x : consumer_status) =
  match x with
  | CREATING -> `String "CREATING"
  | DELETING -> `String "DELETING"
  | ACTIVE -> `String "ACTIVE"

let consumer_ar_n_to_yojson = string_to_yojson
let consumer_name_to_yojson = string_to_yojson

let consumer_to_yojson (x : consumer) =
  assoc_to_yojson
    [
      ("ConsumerName", Some (consumer_name_to_yojson x.consumer_name));
      ("ConsumerARN", Some (consumer_ar_n_to_yojson x.consumer_ar_n));
      ("ConsumerStatus", Some (consumer_status_to_yojson x.consumer_status));
      ("ConsumerCreationTimestamp", Some (timestamp_to_yojson x.consumer_creation_timestamp));
    ]

let consumer_count_object_to_yojson = int_to_yojson

let consumer_description_to_yojson (x : consumer_description) =
  assoc_to_yojson
    [
      ("ConsumerName", Some (consumer_name_to_yojson x.consumer_name));
      ("ConsumerARN", Some (consumer_ar_n_to_yojson x.consumer_ar_n));
      ("ConsumerStatus", Some (consumer_status_to_yojson x.consumer_status));
      ("ConsumerCreationTimestamp", Some (timestamp_to_yojson x.consumer_creation_timestamp));
      ("StreamARN", Some (stream_ar_n_to_yojson x.stream_ar_n));
    ]

let consumer_list_to_yojson tree = list_to_yojson consumer_to_yojson tree

let validation_exception_to_yojson (x : validation_exception) =
  assoc_to_yojson [ ("message", option_to_yojson error_message_to_yojson x.message) ]

let max_record_size_in_ki_b_to_yojson = int_to_yojson
let natural_integer_object_to_yojson = int_to_yojson

let stream_mode_to_yojson (x : stream_mode) =
  match x with PROVISIONED -> `String "PROVISIONED" | ON_DEMAND -> `String "ON_DEMAND"

let stream_mode_details_to_yojson (x : stream_mode_details) =
  assoc_to_yojson [ ("StreamMode", Some (stream_mode_to_yojson x.stream_mode)) ]

let positive_integer_object_to_yojson = int_to_yojson

let create_stream_input_to_yojson (x : create_stream_input) =
  assoc_to_yojson
    [
      ("StreamName", Some (stream_name_to_yojson x.stream_name));
      ("ShardCount", option_to_yojson positive_integer_object_to_yojson x.shard_count);
      ("StreamModeDetails", option_to_yojson stream_mode_details_to_yojson x.stream_mode_details);
      ("Tags", option_to_yojson tag_map_to_yojson x.tags);
      ( "WarmThroughputMiBps",
        option_to_yojson natural_integer_object_to_yojson x.warm_throughput_mi_bps );
      ( "MaxRecordSizeInKiB",
        option_to_yojson max_record_size_in_ki_b_to_yojson x.max_record_size_in_ki_b );
    ]

let data_to_yojson = blob_to_yojson
let retention_period_hours_to_yojson = int_to_yojson

let decrease_stream_retention_period_input_to_yojson (x : decrease_stream_retention_period_input) =
  assoc_to_yojson
    [
      ("StreamName", option_to_yojson stream_name_to_yojson x.stream_name);
      ("RetentionPeriodHours", Some (retention_period_hours_to_yojson x.retention_period_hours));
      ("StreamARN", option_to_yojson stream_ar_n_to_yojson x.stream_ar_n);
      ("StreamId", option_to_yojson stream_id_to_yojson x.stream_id);
    ]

let resource_ar_n_to_yojson = string_to_yojson

let delete_resource_policy_input_to_yojson (x : delete_resource_policy_input) =
  assoc_to_yojson
    [
      ("ResourceARN", Some (resource_ar_n_to_yojson x.resource_ar_n));
      ("StreamId", option_to_yojson stream_id_to_yojson x.stream_id);
    ]

let delete_stream_input_to_yojson (x : delete_stream_input) =
  assoc_to_yojson
    [
      ("StreamName", option_to_yojson stream_name_to_yojson x.stream_name);
      ( "EnforceConsumerDeletion",
        option_to_yojson boolean_object_to_yojson x.enforce_consumer_deletion );
      ("StreamARN", option_to_yojson stream_ar_n_to_yojson x.stream_ar_n);
      ("StreamId", option_to_yojson stream_id_to_yojson x.stream_id);
    ]

let deregister_stream_consumer_input_to_yojson (x : deregister_stream_consumer_input) =
  assoc_to_yojson
    [
      ("StreamARN", option_to_yojson stream_ar_n_to_yojson x.stream_ar_n);
      ("ConsumerName", option_to_yojson consumer_name_to_yojson x.consumer_name);
      ("ConsumerARN", option_to_yojson consumer_ar_n_to_yojson x.consumer_ar_n);
      ("StreamId", option_to_yojson stream_id_to_yojson x.stream_id);
    ]

let minimum_throughput_billing_commitment_output_status_to_yojson
    (x : minimum_throughput_billing_commitment_output_status) =
  match x with
  | ENABLED -> `String "ENABLED"
  | DISABLED -> `String "DISABLED"
  | ENABLED_UNTIL_EARLIEST_ALLOWED_END -> `String "ENABLED_UNTIL_EARLIEST_ALLOWED_END"

let minimum_throughput_billing_commitment_output_to_yojson
    (x : minimum_throughput_billing_commitment_output) =
  assoc_to_yojson
    [
      ("Status", Some (minimum_throughput_billing_commitment_output_status_to_yojson x.status));
      ("StartedAt", option_to_yojson timestamp_to_yojson x.started_at);
      ("EndedAt", option_to_yojson timestamp_to_yojson x.ended_at);
      ("EarliestAllowedEndAt", option_to_yojson timestamp_to_yojson x.earliest_allowed_end_at);
    ]

let describe_account_settings_output_to_yojson (x : describe_account_settings_output) =
  assoc_to_yojson
    [
      ( "MinimumThroughputBillingCommitment",
        option_to_yojson minimum_throughput_billing_commitment_output_to_yojson
          x.minimum_throughput_billing_commitment );
    ]

let describe_account_settings_input_to_yojson = unit_to_yojson
let on_demand_stream_count_limit_object_to_yojson = int_to_yojson
let on_demand_stream_count_object_to_yojson = int_to_yojson
let shard_count_object_to_yojson = int_to_yojson

let describe_limits_output_to_yojson (x : describe_limits_output) =
  assoc_to_yojson
    [
      ("ShardLimit", Some (shard_count_object_to_yojson x.shard_limit));
      ("OpenShardCount", Some (shard_count_object_to_yojson x.open_shard_count));
      ( "OnDemandStreamCount",
        Some (on_demand_stream_count_object_to_yojson x.on_demand_stream_count) );
      ( "OnDemandStreamCountLimit",
        Some (on_demand_stream_count_limit_object_to_yojson x.on_demand_stream_count_limit) );
    ]

let describe_limits_input_to_yojson = unit_to_yojson
let key_id_to_yojson = string_to_yojson

let encryption_type_to_yojson (x : encryption_type) =
  match x with NONE -> `String "NONE" | KMS -> `String "KMS"

let metrics_name_to_yojson (x : metrics_name) =
  match x with
  | INCOMING_BYTES -> `String "IncomingBytes"
  | INCOMING_RECORDS -> `String "IncomingRecords"
  | OUTGOING_BYTES -> `String "OutgoingBytes"
  | OUTGOING_RECORDS -> `String "OutgoingRecords"
  | WRITE_PROVISIONED_THROUGHPUT_EXCEEDED -> `String "WriteProvisionedThroughputExceeded"
  | READ_PROVISIONED_THROUGHPUT_EXCEEDED -> `String "ReadProvisionedThroughputExceeded"
  | ITERATOR_AGE_MILLISECONDS -> `String "IteratorAgeMilliseconds"
  | ALL -> `String "ALL"

let metrics_name_list_to_yojson tree = list_to_yojson metrics_name_to_yojson tree

let enhanced_metrics_to_yojson (x : enhanced_metrics) =
  assoc_to_yojson
    [ ("ShardLevelMetrics", option_to_yojson metrics_name_list_to_yojson x.shard_level_metrics) ]

let enhanced_monitoring_list_to_yojson tree = list_to_yojson enhanced_metrics_to_yojson tree
let sequence_number_to_yojson = string_to_yojson

let sequence_number_range_to_yojson (x : sequence_number_range) =
  assoc_to_yojson
    [
      ("StartingSequenceNumber", Some (sequence_number_to_yojson x.starting_sequence_number));
      ("EndingSequenceNumber", option_to_yojson sequence_number_to_yojson x.ending_sequence_number);
    ]

let shard_to_yojson (x : shard) =
  assoc_to_yojson
    [
      ("ShardId", Some (shard_id_to_yojson x.shard_id));
      ("ParentShardId", option_to_yojson shard_id_to_yojson x.parent_shard_id);
      ("AdjacentParentShardId", option_to_yojson shard_id_to_yojson x.adjacent_parent_shard_id);
      ("HashKeyRange", Some (hash_key_range_to_yojson x.hash_key_range));
      ("SequenceNumberRange", Some (sequence_number_range_to_yojson x.sequence_number_range));
    ]

let shard_list_to_yojson tree = list_to_yojson shard_to_yojson tree

let stream_status_to_yojson (x : stream_status) =
  match x with
  | CREATING -> `String "CREATING"
  | DELETING -> `String "DELETING"
  | ACTIVE -> `String "ACTIVE"
  | UPDATING -> `String "UPDATING"

let stream_description_to_yojson (x : stream_description) =
  assoc_to_yojson
    [
      ("StreamName", Some (stream_name_to_yojson x.stream_name));
      ("StreamARN", Some (stream_ar_n_to_yojson x.stream_ar_n));
      ("StreamStatus", Some (stream_status_to_yojson x.stream_status));
      ("StreamModeDetails", option_to_yojson stream_mode_details_to_yojson x.stream_mode_details);
      ("Shards", Some (shard_list_to_yojson x.shards));
      ("HasMoreShards", Some (boolean_object_to_yojson x.has_more_shards));
      ("RetentionPeriodHours", Some (retention_period_hours_to_yojson x.retention_period_hours));
      ("StreamCreationTimestamp", Some (timestamp_to_yojson x.stream_creation_timestamp));
      ("EnhancedMonitoring", Some (enhanced_monitoring_list_to_yojson x.enhanced_monitoring));
      ("EncryptionType", option_to_yojson encryption_type_to_yojson x.encryption_type);
      ("KeyId", option_to_yojson key_id_to_yojson x.key_id);
    ]

let describe_stream_output_to_yojson (x : describe_stream_output) =
  assoc_to_yojson
    [ ("StreamDescription", Some (stream_description_to_yojson x.stream_description)) ]

let describe_stream_input_limit_to_yojson = int_to_yojson

let describe_stream_input_to_yojson (x : describe_stream_input) =
  assoc_to_yojson
    [
      ("StreamName", option_to_yojson stream_name_to_yojson x.stream_name);
      ("Limit", option_to_yojson describe_stream_input_limit_to_yojson x.limit);
      ("ExclusiveStartShardId", option_to_yojson shard_id_to_yojson x.exclusive_start_shard_id);
      ("StreamARN", option_to_yojson stream_ar_n_to_yojson x.stream_ar_n);
      ("StreamId", option_to_yojson stream_id_to_yojson x.stream_id);
    ]

let describe_stream_consumer_output_to_yojson (x : describe_stream_consumer_output) =
  assoc_to_yojson
    [ ("ConsumerDescription", Some (consumer_description_to_yojson x.consumer_description)) ]

let describe_stream_consumer_input_to_yojson (x : describe_stream_consumer_input) =
  assoc_to_yojson
    [
      ("StreamARN", option_to_yojson stream_ar_n_to_yojson x.stream_ar_n);
      ("ConsumerName", option_to_yojson consumer_name_to_yojson x.consumer_name);
      ("ConsumerARN", option_to_yojson consumer_ar_n_to_yojson x.consumer_ar_n);
      ("StreamId", option_to_yojson stream_id_to_yojson x.stream_id);
    ]

let warm_throughput_object_to_yojson (x : warm_throughput_object) =
  assoc_to_yojson
    [
      ("TargetMiBps", option_to_yojson natural_integer_object_to_yojson x.target_mi_bps);
      ("CurrentMiBps", option_to_yojson natural_integer_object_to_yojson x.current_mi_bps);
    ]

let stream_description_summary_to_yojson (x : stream_description_summary) =
  assoc_to_yojson
    [
      ("StreamName", Some (stream_name_to_yojson x.stream_name));
      ("StreamARN", Some (stream_ar_n_to_yojson x.stream_ar_n));
      ("StreamId", option_to_yojson stream_id_to_yojson x.stream_id);
      ("StreamStatus", Some (stream_status_to_yojson x.stream_status));
      ("StreamModeDetails", option_to_yojson stream_mode_details_to_yojson x.stream_mode_details);
      ("RetentionPeriodHours", Some (retention_period_hours_to_yojson x.retention_period_hours));
      ("StreamCreationTimestamp", Some (timestamp_to_yojson x.stream_creation_timestamp));
      ("EnhancedMonitoring", Some (enhanced_monitoring_list_to_yojson x.enhanced_monitoring));
      ("EncryptionType", option_to_yojson encryption_type_to_yojson x.encryption_type);
      ("KeyId", option_to_yojson key_id_to_yojson x.key_id);
      ("OpenShardCount", Some (shard_count_object_to_yojson x.open_shard_count));
      ("ConsumerCount", option_to_yojson consumer_count_object_to_yojson x.consumer_count);
      ("WarmThroughput", option_to_yojson warm_throughput_object_to_yojson x.warm_throughput);
      ( "MaxRecordSizeInKiB",
        option_to_yojson max_record_size_in_ki_b_to_yojson x.max_record_size_in_ki_b );
    ]

let describe_stream_summary_output_to_yojson (x : describe_stream_summary_output) =
  assoc_to_yojson
    [
      ( "StreamDescriptionSummary",
        Some (stream_description_summary_to_yojson x.stream_description_summary) );
    ]

let describe_stream_summary_input_to_yojson (x : describe_stream_summary_input) =
  assoc_to_yojson
    [
      ("StreamName", option_to_yojson stream_name_to_yojson x.stream_name);
      ("StreamARN", option_to_yojson stream_ar_n_to_yojson x.stream_ar_n);
      ("StreamId", option_to_yojson stream_id_to_yojson x.stream_id);
    ]

let enhanced_monitoring_output_to_yojson (x : enhanced_monitoring_output) =
  assoc_to_yojson
    [
      ("StreamName", option_to_yojson stream_name_to_yojson x.stream_name);
      ( "CurrentShardLevelMetrics",
        option_to_yojson metrics_name_list_to_yojson x.current_shard_level_metrics );
      ( "DesiredShardLevelMetrics",
        option_to_yojson metrics_name_list_to_yojson x.desired_shard_level_metrics );
      ("StreamARN", option_to_yojson stream_ar_n_to_yojson x.stream_ar_n);
    ]

let disable_enhanced_monitoring_input_to_yojson (x : disable_enhanced_monitoring_input) =
  assoc_to_yojson
    [
      ("StreamName", option_to_yojson stream_name_to_yojson x.stream_name);
      ("ShardLevelMetrics", Some (metrics_name_list_to_yojson x.shard_level_metrics));
      ("StreamARN", option_to_yojson stream_ar_n_to_yojson x.stream_ar_n);
      ("StreamId", option_to_yojson stream_id_to_yojson x.stream_id);
    ]

let enable_enhanced_monitoring_input_to_yojson (x : enable_enhanced_monitoring_input) =
  assoc_to_yojson
    [
      ("StreamName", option_to_yojson stream_name_to_yojson x.stream_name);
      ("ShardLevelMetrics", Some (metrics_name_list_to_yojson x.shard_level_metrics));
      ("StreamARN", option_to_yojson stream_ar_n_to_yojson x.stream_ar_n);
      ("StreamId", option_to_yojson stream_id_to_yojson x.stream_id);
    ]

let error_code_to_yojson = string_to_yojson

let expired_iterator_exception_to_yojson (x : expired_iterator_exception) =
  assoc_to_yojson [ ("message", option_to_yojson error_message_to_yojson x.message) ]

let expired_next_token_exception_to_yojson (x : expired_next_token_exception) =
  assoc_to_yojson [ ("message", option_to_yojson error_message_to_yojson x.message) ]

let provisioned_throughput_exceeded_exception_to_yojson
    (x : provisioned_throughput_exceeded_exception) =
  assoc_to_yojson [ ("message", option_to_yojson error_message_to_yojson x.message) ]

let kms_throttling_exception_to_yojson (x : kms_throttling_exception) =
  assoc_to_yojson [ ("message", option_to_yojson error_message_to_yojson x.message) ]

let kms_opt_in_required_to_yojson (x : kms_opt_in_required) =
  assoc_to_yojson [ ("message", option_to_yojson error_message_to_yojson x.message) ]

let kms_not_found_exception_to_yojson (x : kms_not_found_exception) =
  assoc_to_yojson [ ("message", option_to_yojson error_message_to_yojson x.message) ]

let kms_invalid_state_exception_to_yojson (x : kms_invalid_state_exception) =
  assoc_to_yojson [ ("message", option_to_yojson error_message_to_yojson x.message) ]

let kms_disabled_exception_to_yojson (x : kms_disabled_exception) =
  assoc_to_yojson [ ("message", option_to_yojson error_message_to_yojson x.message) ]

let kms_access_denied_exception_to_yojson (x : kms_access_denied_exception) =
  assoc_to_yojson [ ("message", option_to_yojson error_message_to_yojson x.message) ]

let internal_failure_exception_to_yojson (x : internal_failure_exception) =
  assoc_to_yojson [ ("message", option_to_yojson error_message_to_yojson x.message) ]

let millis_behind_latest_to_yojson = long_to_yojson
let shard_iterator_to_yojson = string_to_yojson
let partition_key_to_yojson = string_to_yojson

let record_to_yojson (x : record) =
  assoc_to_yojson
    [
      ("SequenceNumber", Some (sequence_number_to_yojson x.sequence_number));
      ( "ApproximateArrivalTimestamp",
        option_to_yojson timestamp_to_yojson x.approximate_arrival_timestamp );
      ("Data", Some (data_to_yojson x.data));
      ("PartitionKey", Some (partition_key_to_yojson x.partition_key));
      ("EncryptionType", option_to_yojson encryption_type_to_yojson x.encryption_type);
    ]

let record_list_to_yojson tree = list_to_yojson record_to_yojson tree

let get_records_output_to_yojson (x : get_records_output) =
  assoc_to_yojson
    [
      ("Records", Some (record_list_to_yojson x.records));
      ("NextShardIterator", option_to_yojson shard_iterator_to_yojson x.next_shard_iterator);
      ("MillisBehindLatest", option_to_yojson millis_behind_latest_to_yojson x.millis_behind_latest);
      ("ChildShards", option_to_yojson child_shard_list_to_yojson x.child_shards);
    ]

let get_records_input_limit_to_yojson = int_to_yojson

let get_records_input_to_yojson (x : get_records_input) =
  assoc_to_yojson
    [
      ("ShardIterator", Some (shard_iterator_to_yojson x.shard_iterator));
      ("Limit", option_to_yojson get_records_input_limit_to_yojson x.limit);
      ("StreamARN", option_to_yojson stream_ar_n_to_yojson x.stream_ar_n);
      ("StreamId", option_to_yojson stream_id_to_yojson x.stream_id);
    ]

let policy_to_yojson = string_to_yojson

let get_resource_policy_output_to_yojson (x : get_resource_policy_output) =
  assoc_to_yojson [ ("Policy", Some (policy_to_yojson x.policy)) ]

let get_resource_policy_input_to_yojson (x : get_resource_policy_input) =
  assoc_to_yojson
    [
      ("ResourceARN", Some (resource_ar_n_to_yojson x.resource_ar_n));
      ("StreamId", option_to_yojson stream_id_to_yojson x.stream_id);
    ]

let get_shard_iterator_output_to_yojson (x : get_shard_iterator_output) =
  assoc_to_yojson [ ("ShardIterator", option_to_yojson shard_iterator_to_yojson x.shard_iterator) ]

let shard_iterator_type_to_yojson (x : shard_iterator_type) =
  match x with
  | AT_SEQUENCE_NUMBER -> `String "AT_SEQUENCE_NUMBER"
  | AFTER_SEQUENCE_NUMBER -> `String "AFTER_SEQUENCE_NUMBER"
  | TRIM_HORIZON -> `String "TRIM_HORIZON"
  | LATEST -> `String "LATEST"
  | AT_TIMESTAMP -> `String "AT_TIMESTAMP"

let get_shard_iterator_input_to_yojson (x : get_shard_iterator_input) =
  assoc_to_yojson
    [
      ("StreamName", option_to_yojson stream_name_to_yojson x.stream_name);
      ("ShardId", Some (shard_id_to_yojson x.shard_id));
      ("ShardIteratorType", Some (shard_iterator_type_to_yojson x.shard_iterator_type));
      ( "StartingSequenceNumber",
        option_to_yojson sequence_number_to_yojson x.starting_sequence_number );
      ("Timestamp", option_to_yojson timestamp_to_yojson x.timestamp);
      ("StreamARN", option_to_yojson stream_ar_n_to_yojson x.stream_ar_n);
      ("StreamId", option_to_yojson stream_id_to_yojson x.stream_id);
    ]

let increase_stream_retention_period_input_to_yojson (x : increase_stream_retention_period_input) =
  assoc_to_yojson
    [
      ("StreamName", option_to_yojson stream_name_to_yojson x.stream_name);
      ("RetentionPeriodHours", Some (retention_period_hours_to_yojson x.retention_period_hours));
      ("StreamARN", option_to_yojson stream_ar_n_to_yojson x.stream_ar_n);
      ("StreamId", option_to_yojson stream_id_to_yojson x.stream_id);
    ]

let update_stream_warm_throughput_output_to_yojson (x : update_stream_warm_throughput_output) =
  assoc_to_yojson
    [
      ("StreamARN", option_to_yojson stream_ar_n_to_yojson x.stream_ar_n);
      ("StreamName", option_to_yojson stream_name_to_yojson x.stream_name);
      ("WarmThroughput", option_to_yojson warm_throughput_object_to_yojson x.warm_throughput);
    ]

let update_stream_warm_throughput_input_to_yojson (x : update_stream_warm_throughput_input) =
  assoc_to_yojson
    [
      ("StreamARN", option_to_yojson stream_ar_n_to_yojson x.stream_ar_n);
      ("StreamName", option_to_yojson stream_name_to_yojson x.stream_name);
      ("StreamId", option_to_yojson stream_id_to_yojson x.stream_id);
      ("WarmThroughputMiBps", Some (natural_integer_object_to_yojson x.warm_throughput_mi_bps));
    ]

let update_stream_mode_input_to_yojson (x : update_stream_mode_input) =
  assoc_to_yojson
    [
      ("StreamARN", Some (stream_ar_n_to_yojson x.stream_ar_n));
      ("StreamId", option_to_yojson stream_id_to_yojson x.stream_id);
      ("StreamModeDetails", Some (stream_mode_details_to_yojson x.stream_mode_details));
      ( "WarmThroughputMiBps",
        option_to_yojson natural_integer_object_to_yojson x.warm_throughput_mi_bps );
    ]

let update_shard_count_output_to_yojson (x : update_shard_count_output) =
  assoc_to_yojson
    [
      ("StreamName", option_to_yojson stream_name_to_yojson x.stream_name);
      ("CurrentShardCount", option_to_yojson positive_integer_object_to_yojson x.current_shard_count);
      ("TargetShardCount", option_to_yojson positive_integer_object_to_yojson x.target_shard_count);
      ("StreamARN", option_to_yojson stream_ar_n_to_yojson x.stream_ar_n);
    ]

let scaling_type_to_yojson (x : scaling_type) =
  match x with UNIFORM_SCALING -> `String "UNIFORM_SCALING"

let update_shard_count_input_to_yojson (x : update_shard_count_input) =
  assoc_to_yojson
    [
      ("StreamName", option_to_yojson stream_name_to_yojson x.stream_name);
      ("TargetShardCount", Some (positive_integer_object_to_yojson x.target_shard_count));
      ("ScalingType", Some (scaling_type_to_yojson x.scaling_type));
      ("StreamARN", option_to_yojson stream_ar_n_to_yojson x.stream_ar_n);
      ("StreamId", option_to_yojson stream_id_to_yojson x.stream_id);
    ]

let update_max_record_size_input_to_yojson (x : update_max_record_size_input) =
  assoc_to_yojson
    [
      ("StreamARN", option_to_yojson stream_ar_n_to_yojson x.stream_ar_n);
      ("StreamId", option_to_yojson stream_id_to_yojson x.stream_id);
      ("MaxRecordSizeInKiB", Some (max_record_size_in_ki_b_to_yojson x.max_record_size_in_ki_b));
    ]

let update_account_settings_output_to_yojson (x : update_account_settings_output) =
  assoc_to_yojson
    [
      ( "MinimumThroughputBillingCommitment",
        option_to_yojson minimum_throughput_billing_commitment_output_to_yojson
          x.minimum_throughput_billing_commitment );
    ]

let minimum_throughput_billing_commitment_input_status_to_yojson
    (x : minimum_throughput_billing_commitment_input_status) =
  match x with ENABLED -> `String "ENABLED" | DISABLED -> `String "DISABLED"

let minimum_throughput_billing_commitment_input_to_yojson
    (x : minimum_throughput_billing_commitment_input) =
  assoc_to_yojson
    [ ("Status", Some (minimum_throughput_billing_commitment_input_status_to_yojson x.status)) ]

let update_account_settings_input_to_yojson (x : update_account_settings_input) =
  assoc_to_yojson
    [
      ( "MinimumThroughputBillingCommitment",
        Some
          (minimum_throughput_billing_commitment_input_to_yojson
             x.minimum_throughput_billing_commitment) );
    ]

let tag_key_list_to_yojson tree = list_to_yojson tag_key_to_yojson tree

let untag_resource_input_to_yojson (x : untag_resource_input) =
  assoc_to_yojson
    [
      ("TagKeys", Some (tag_key_list_to_yojson x.tag_keys));
      ("ResourceARN", Some (resource_ar_n_to_yojson x.resource_ar_n));
      ("StreamId", option_to_yojson stream_id_to_yojson x.stream_id);
    ]

let tag_resource_input_to_yojson (x : tag_resource_input) =
  assoc_to_yojson
    [
      ("Tags", Some (tag_map_to_yojson x.tags));
      ("ResourceARN", Some (resource_ar_n_to_yojson x.resource_ar_n));
      ("StreamId", option_to_yojson stream_id_to_yojson x.stream_id);
    ]

let subscribe_to_shard_event_to_yojson (x : subscribe_to_shard_event) =
  assoc_to_yojson
    [
      ("Records", Some (record_list_to_yojson x.records));
      ("ContinuationSequenceNumber", Some (sequence_number_to_yojson x.continuation_sequence_number));
      ("MillisBehindLatest", Some (millis_behind_latest_to_yojson x.millis_behind_latest));
      ("ChildShards", option_to_yojson child_shard_list_to_yojson x.child_shards);
    ]

let subscribe_to_shard_event_stream_to_yojson (x : subscribe_to_shard_event_stream) =
  match x with
  | SubscribeToShardEvent arg ->
      assoc_to_yojson [ ("SubscribeToShardEvent", Some (subscribe_to_shard_event_to_yojson arg)) ]
  | ResourceNotFoundException arg ->
      assoc_to_yojson
        [ ("ResourceNotFoundException", Some (resource_not_found_exception_to_yojson arg)) ]
  | ResourceInUseException arg ->
      assoc_to_yojson [ ("ResourceInUseException", Some (resource_in_use_exception_to_yojson arg)) ]
  | KMSDisabledException arg ->
      assoc_to_yojson [ ("KMSDisabledException", Some (kms_disabled_exception_to_yojson arg)) ]
  | KMSInvalidStateException arg ->
      assoc_to_yojson
        [ ("KMSInvalidStateException", Some (kms_invalid_state_exception_to_yojson arg)) ]
  | KMSAccessDeniedException arg ->
      assoc_to_yojson
        [ ("KMSAccessDeniedException", Some (kms_access_denied_exception_to_yojson arg)) ]
  | KMSNotFoundException arg ->
      assoc_to_yojson [ ("KMSNotFoundException", Some (kms_not_found_exception_to_yojson arg)) ]
  | KMSOptInRequired arg ->
      assoc_to_yojson [ ("KMSOptInRequired", Some (kms_opt_in_required_to_yojson arg)) ]
  | KMSThrottlingException arg ->
      assoc_to_yojson [ ("KMSThrottlingException", Some (kms_throttling_exception_to_yojson arg)) ]
  | InternalFailureException arg ->
      assoc_to_yojson
        [ ("InternalFailureException", Some (internal_failure_exception_to_yojson arg)) ]

let subscribe_to_shard_output_to_yojson (x : subscribe_to_shard_output) =
  assoc_to_yojson
    [ ("EventStream", Some (subscribe_to_shard_event_stream_to_yojson x.event_stream)) ]

let starting_position_to_yojson (x : starting_position) =
  assoc_to_yojson
    [
      ("Type", Some (shard_iterator_type_to_yojson x.type_));
      ("SequenceNumber", option_to_yojson sequence_number_to_yojson x.sequence_number);
      ("Timestamp", option_to_yojson timestamp_to_yojson x.timestamp);
    ]

let subscribe_to_shard_input_to_yojson (x : subscribe_to_shard_input) =
  assoc_to_yojson
    [
      ("ConsumerARN", Some (consumer_ar_n_to_yojson x.consumer_ar_n));
      ("StreamId", option_to_yojson stream_id_to_yojson x.stream_id);
      ("ShardId", Some (shard_id_to_yojson x.shard_id));
      ("StartingPosition", Some (starting_position_to_yojson x.starting_position));
    ]

let stop_stream_encryption_input_to_yojson (x : stop_stream_encryption_input) =
  assoc_to_yojson
    [
      ("StreamName", option_to_yojson stream_name_to_yojson x.stream_name);
      ("EncryptionType", Some (encryption_type_to_yojson x.encryption_type));
      ("KeyId", Some (key_id_to_yojson x.key_id));
      ("StreamARN", option_to_yojson stream_ar_n_to_yojson x.stream_ar_n);
      ("StreamId", option_to_yojson stream_id_to_yojson x.stream_id);
    ]

let start_stream_encryption_input_to_yojson (x : start_stream_encryption_input) =
  assoc_to_yojson
    [
      ("StreamName", option_to_yojson stream_name_to_yojson x.stream_name);
      ("EncryptionType", Some (encryption_type_to_yojson x.encryption_type));
      ("KeyId", Some (key_id_to_yojson x.key_id));
      ("StreamARN", option_to_yojson stream_ar_n_to_yojson x.stream_ar_n);
      ("StreamId", option_to_yojson stream_id_to_yojson x.stream_id);
    ]

let split_shard_input_to_yojson (x : split_shard_input) =
  assoc_to_yojson
    [
      ("StreamName", option_to_yojson stream_name_to_yojson x.stream_name);
      ("ShardToSplit", Some (shard_id_to_yojson x.shard_to_split));
      ("NewStartingHashKey", Some (hash_key_to_yojson x.new_starting_hash_key));
      ("StreamARN", option_to_yojson stream_ar_n_to_yojson x.stream_ar_n);
      ("StreamId", option_to_yojson stream_id_to_yojson x.stream_id);
    ]

let remove_tags_from_stream_input_to_yojson (x : remove_tags_from_stream_input) =
  assoc_to_yojson
    [
      ("StreamName", option_to_yojson stream_name_to_yojson x.stream_name);
      ("TagKeys", Some (tag_key_list_to_yojson x.tag_keys));
      ("StreamARN", option_to_yojson stream_ar_n_to_yojson x.stream_ar_n);
      ("StreamId", option_to_yojson stream_id_to_yojson x.stream_id);
    ]

let register_stream_consumer_output_to_yojson (x : register_stream_consumer_output) =
  assoc_to_yojson [ ("Consumer", Some (consumer_to_yojson x.consumer)) ]

let register_stream_consumer_input_to_yojson (x : register_stream_consumer_input) =
  assoc_to_yojson
    [
      ("StreamARN", Some (stream_ar_n_to_yojson x.stream_ar_n));
      ("ConsumerName", Some (consumer_name_to_yojson x.consumer_name));
      ("StreamId", option_to_yojson stream_id_to_yojson x.stream_id);
      ("Tags", option_to_yojson tag_map_to_yojson x.tags);
    ]

let put_resource_policy_input_to_yojson (x : put_resource_policy_input) =
  assoc_to_yojson
    [
      ("ResourceARN", Some (resource_ar_n_to_yojson x.resource_ar_n));
      ("StreamId", option_to_yojson stream_id_to_yojson x.stream_id);
      ("Policy", Some (policy_to_yojson x.policy));
    ]

let put_records_result_entry_to_yojson (x : put_records_result_entry) =
  assoc_to_yojson
    [
      ("SequenceNumber", option_to_yojson sequence_number_to_yojson x.sequence_number);
      ("ShardId", option_to_yojson shard_id_to_yojson x.shard_id);
      ("ErrorCode", option_to_yojson error_code_to_yojson x.error_code);
      ("ErrorMessage", option_to_yojson error_message_to_yojson x.error_message);
    ]

let put_records_result_entry_list_to_yojson tree =
  list_to_yojson put_records_result_entry_to_yojson tree

let put_records_output_to_yojson (x : put_records_output) =
  assoc_to_yojson
    [
      ("FailedRecordCount", option_to_yojson positive_integer_object_to_yojson x.failed_record_count);
      ("Records", Some (put_records_result_entry_list_to_yojson x.records));
      ("EncryptionType", option_to_yojson encryption_type_to_yojson x.encryption_type);
    ]

let put_records_request_entry_to_yojson (x : put_records_request_entry) =
  assoc_to_yojson
    [
      ("Data", Some (data_to_yojson x.data));
      ("ExplicitHashKey", option_to_yojson hash_key_to_yojson x.explicit_hash_key);
      ("PartitionKey", Some (partition_key_to_yojson x.partition_key));
    ]

let put_records_request_entry_list_to_yojson tree =
  list_to_yojson put_records_request_entry_to_yojson tree

let put_records_input_to_yojson (x : put_records_input) =
  assoc_to_yojson
    [
      ("Records", Some (put_records_request_entry_list_to_yojson x.records));
      ("StreamName", option_to_yojson stream_name_to_yojson x.stream_name);
      ("StreamARN", option_to_yojson stream_ar_n_to_yojson x.stream_ar_n);
      ("StreamId", option_to_yojson stream_id_to_yojson x.stream_id);
    ]

let put_record_output_to_yojson (x : put_record_output) =
  assoc_to_yojson
    [
      ("ShardId", Some (shard_id_to_yojson x.shard_id));
      ("SequenceNumber", Some (sequence_number_to_yojson x.sequence_number));
      ("EncryptionType", option_to_yojson encryption_type_to_yojson x.encryption_type);
    ]

let put_record_input_to_yojson (x : put_record_input) =
  assoc_to_yojson
    [
      ("StreamName", option_to_yojson stream_name_to_yojson x.stream_name);
      ("Data", Some (data_to_yojson x.data));
      ("PartitionKey", Some (partition_key_to_yojson x.partition_key));
      ("ExplicitHashKey", option_to_yojson hash_key_to_yojson x.explicit_hash_key);
      ( "SequenceNumberForOrdering",
        option_to_yojson sequence_number_to_yojson x.sequence_number_for_ordering );
      ("StreamARN", option_to_yojson stream_ar_n_to_yojson x.stream_ar_n);
      ("StreamId", option_to_yojson stream_id_to_yojson x.stream_id);
    ]

let merge_shards_input_to_yojson (x : merge_shards_input) =
  assoc_to_yojson
    [
      ("StreamName", option_to_yojson stream_name_to_yojson x.stream_name);
      ("ShardToMerge", Some (shard_id_to_yojson x.shard_to_merge));
      ("AdjacentShardToMerge", Some (shard_id_to_yojson x.adjacent_shard_to_merge));
      ("StreamARN", option_to_yojson stream_ar_n_to_yojson x.stream_ar_n);
      ("StreamId", option_to_yojson stream_id_to_yojson x.stream_id);
    ]

let tag_to_yojson (x : tag) =
  assoc_to_yojson
    [
      ("Key", Some (tag_key_to_yojson x.key));
      ("Value", option_to_yojson tag_value_to_yojson x.value);
    ]

let tag_list_to_yojson tree = list_to_yojson tag_to_yojson tree

let list_tags_for_stream_output_to_yojson (x : list_tags_for_stream_output) =
  assoc_to_yojson
    [
      ("Tags", Some (tag_list_to_yojson x.tags));
      ("HasMoreTags", Some (boolean_object_to_yojson x.has_more_tags));
    ]

let list_tags_for_stream_input_limit_to_yojson = int_to_yojson

let list_tags_for_stream_input_to_yojson (x : list_tags_for_stream_input) =
  assoc_to_yojson
    [
      ("StreamName", option_to_yojson stream_name_to_yojson x.stream_name);
      ("ExclusiveStartTagKey", option_to_yojson tag_key_to_yojson x.exclusive_start_tag_key);
      ("Limit", option_to_yojson list_tags_for_stream_input_limit_to_yojson x.limit);
      ("StreamARN", option_to_yojson stream_ar_n_to_yojson x.stream_ar_n);
      ("StreamId", option_to_yojson stream_id_to_yojson x.stream_id);
    ]

let list_tags_for_resource_output_to_yojson (x : list_tags_for_resource_output) =
  assoc_to_yojson [ ("Tags", option_to_yojson tag_list_to_yojson x.tags) ]

let list_tags_for_resource_input_to_yojson (x : list_tags_for_resource_input) =
  assoc_to_yojson
    [
      ("ResourceARN", Some (resource_ar_n_to_yojson x.resource_ar_n));
      ("StreamId", option_to_yojson stream_id_to_yojson x.stream_id);
    ]

let stream_summary_to_yojson (x : stream_summary) =
  assoc_to_yojson
    [
      ("StreamName", Some (stream_name_to_yojson x.stream_name));
      ("StreamARN", Some (stream_ar_n_to_yojson x.stream_ar_n));
      ("StreamStatus", Some (stream_status_to_yojson x.stream_status));
      ("StreamModeDetails", option_to_yojson stream_mode_details_to_yojson x.stream_mode_details);
      ("StreamCreationTimestamp", option_to_yojson timestamp_to_yojson x.stream_creation_timestamp);
    ]

let stream_summary_list_to_yojson tree = list_to_yojson stream_summary_to_yojson tree
let next_token_to_yojson = string_to_yojson
let stream_name_list_to_yojson tree = list_to_yojson stream_name_to_yojson tree

let list_streams_output_to_yojson (x : list_streams_output) =
  assoc_to_yojson
    [
      ("StreamNames", Some (stream_name_list_to_yojson x.stream_names));
      ("HasMoreStreams", Some (boolean_object_to_yojson x.has_more_streams));
      ("NextToken", option_to_yojson next_token_to_yojson x.next_token);
      ("StreamSummaries", option_to_yojson stream_summary_list_to_yojson x.stream_summaries);
    ]

let list_streams_input_limit_to_yojson = int_to_yojson

let list_streams_input_to_yojson (x : list_streams_input) =
  assoc_to_yojson
    [
      ("Limit", option_to_yojson list_streams_input_limit_to_yojson x.limit);
      ( "ExclusiveStartStreamName",
        option_to_yojson stream_name_to_yojson x.exclusive_start_stream_name );
      ("NextToken", option_to_yojson next_token_to_yojson x.next_token);
    ]

let list_stream_consumers_output_to_yojson (x : list_stream_consumers_output) =
  assoc_to_yojson
    [
      ("Consumers", option_to_yojson consumer_list_to_yojson x.consumers);
      ("NextToken", option_to_yojson next_token_to_yojson x.next_token);
    ]

let list_stream_consumers_input_limit_to_yojson = int_to_yojson

let list_stream_consumers_input_to_yojson (x : list_stream_consumers_input) =
  assoc_to_yojson
    [
      ("StreamARN", Some (stream_ar_n_to_yojson x.stream_ar_n));
      ("NextToken", option_to_yojson next_token_to_yojson x.next_token);
      ("MaxResults", option_to_yojson list_stream_consumers_input_limit_to_yojson x.max_results);
      ("StreamCreationTimestamp", option_to_yojson timestamp_to_yojson x.stream_creation_timestamp);
      ("StreamId", option_to_yojson stream_id_to_yojson x.stream_id);
    ]

let list_shards_output_to_yojson (x : list_shards_output) =
  assoc_to_yojson
    [
      ("Shards", option_to_yojson shard_list_to_yojson x.shards);
      ("NextToken", option_to_yojson next_token_to_yojson x.next_token);
    ]

let shard_filter_type_to_yojson (x : shard_filter_type) =
  match x with
  | AFTER_SHARD_ID -> `String "AFTER_SHARD_ID"
  | AT_TRIM_HORIZON -> `String "AT_TRIM_HORIZON"
  | FROM_TRIM_HORIZON -> `String "FROM_TRIM_HORIZON"
  | AT_LATEST -> `String "AT_LATEST"
  | AT_TIMESTAMP -> `String "AT_TIMESTAMP"
  | FROM_TIMESTAMP -> `String "FROM_TIMESTAMP"

let shard_filter_to_yojson (x : shard_filter) =
  assoc_to_yojson
    [
      ("Type", Some (shard_filter_type_to_yojson x.type_));
      ("ShardId", option_to_yojson shard_id_to_yojson x.shard_id);
      ("Timestamp", option_to_yojson timestamp_to_yojson x.timestamp);
    ]

let list_shards_input_limit_to_yojson = int_to_yojson

let list_shards_input_to_yojson (x : list_shards_input) =
  assoc_to_yojson
    [
      ("StreamName", option_to_yojson stream_name_to_yojson x.stream_name);
      ("NextToken", option_to_yojson next_token_to_yojson x.next_token);
      ("ExclusiveStartShardId", option_to_yojson shard_id_to_yojson x.exclusive_start_shard_id);
      ("MaxResults", option_to_yojson list_shards_input_limit_to_yojson x.max_results);
      ("StreamCreationTimestamp", option_to_yojson timestamp_to_yojson x.stream_creation_timestamp);
      ("ShardFilter", option_to_yojson shard_filter_to_yojson x.shard_filter);
      ("StreamARN", option_to_yojson stream_ar_n_to_yojson x.stream_ar_n);
      ("StreamId", option_to_yojson stream_id_to_yojson x.stream_id);
    ]
