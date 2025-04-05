open Smaws_Lib
let service =
  let open Smaws_Lib.Service in
    {
      namespace = "kinesis";
      endpointPrefix = "kinesis";
      version = "2013-12-02";
      protocol = Smaws_Lib.Service.AwsJson_1_1
    }
type nonrec validation_exception = {
  message: string option }
type nonrec stream_mode =
  | ON_DEMAND 
  | PROVISIONED 
type nonrec stream_mode_details = {
  stream_mode: stream_mode }
type nonrec update_stream_mode_input =
  {
  stream_mode_details: stream_mode_details ;
  stream_ar_n: string }
type nonrec resource_not_found_exception = {
  message: string option }
type nonrec resource_in_use_exception = {
  message: string option }
type nonrec limit_exceeded_exception = {
  message: string option }
type nonrec invalid_argument_exception = {
  message: string option }
type nonrec update_shard_count_output =
  {
  stream_ar_n: string option ;
  target_shard_count: int option ;
  current_shard_count: int option ;
  stream_name: string option }
type nonrec scaling_type =
  | UNIFORM_SCALING 
type nonrec update_shard_count_input =
  {
  stream_ar_n: string option ;
  scaling_type: scaling_type ;
  target_shard_count: int ;
  stream_name: string option }
type nonrec access_denied_exception = {
  message: string option }
type nonrec tag_map = (string * string) list
type nonrec tag = {
  value: string option ;
  key: string }
type nonrec encryption_type =
  | KMS 
  | NONE 
type nonrec record =
  {
  encryption_type: encryption_type option ;
  partition_key: string ;
  data: bytes ;
  approximate_arrival_timestamp: CoreTypes.Timestamp.t option ;
  sequence_number: string }
type nonrec hash_key_range =
  {
  ending_hash_key: string ;
  starting_hash_key: string }
type nonrec child_shard =
  {
  hash_key_range: hash_key_range ;
  parent_shards: string list ;
  shard_id: string }
type nonrec subscribe_to_shard_event =
  {
  child_shards: child_shard list option ;
  millis_behind_latest: int ;
  continuation_sequence_number: string ;
  records: record list }
type nonrec kms_disabled_exception = {
  message: string option }
type nonrec kms_invalid_state_exception = {
  message: string option }
type nonrec kms_access_denied_exception = {
  message: string option }
type nonrec kms_not_found_exception = {
  message: string option }
type nonrec kms_opt_in_required = {
  message: string option }
type nonrec kms_throttling_exception = {
  message: string option }
type nonrec internal_failure_exception = {
  message: string option }
type nonrec subscribe_to_shard_event_stream =
  | InternalFailureException of internal_failure_exception 
  | KMSThrottlingException of kms_throttling_exception 
  | KMSOptInRequired of kms_opt_in_required 
  | KMSNotFoundException of kms_not_found_exception 
  | KMSAccessDeniedException of kms_access_denied_exception 
  | KMSInvalidStateException of kms_invalid_state_exception 
  | KMSDisabledException of kms_disabled_exception 
  | ResourceInUseException of resource_in_use_exception 
  | ResourceNotFoundException of resource_not_found_exception 
  | SubscribeToShardEvent of subscribe_to_shard_event 
type nonrec subscribe_to_shard_output =
  {
  event_stream: subscribe_to_shard_event_stream }
type nonrec shard_iterator_type =
  | AT_TIMESTAMP 
  | LATEST 
  | TRIM_HORIZON 
  | AFTER_SEQUENCE_NUMBER 
  | AT_SEQUENCE_NUMBER 
type nonrec starting_position =
  {
  timestamp_: CoreTypes.Timestamp.t option ;
  sequence_number: string option ;
  type_: shard_iterator_type }
type nonrec subscribe_to_shard_input =
  {
  starting_position: starting_position ;
  shard_id: string ;
  consumer_ar_n: string }
type nonrec stream_status =
  | UPDATING 
  | ACTIVE 
  | DELETING 
  | CREATING 
type nonrec stream_summary =
  {
  stream_creation_timestamp: CoreTypes.Timestamp.t option ;
  stream_mode_details: stream_mode_details option ;
  stream_status: stream_status ;
  stream_ar_n: string ;
  stream_name: string }
type nonrec metrics_name =
  | ALL 
  | ITERATOR_AGE_MILLISECONDS 
  | READ_PROVISIONED_THROUGHPUT_EXCEEDED 
  | WRITE_PROVISIONED_THROUGHPUT_EXCEEDED 
  | OUTGOING_RECORDS 
  | OUTGOING_BYTES 
  | INCOMING_RECORDS 
  | INCOMING_BYTES 
type nonrec enhanced_metrics =
  {
  shard_level_metrics: metrics_name list option }
type nonrec stream_description_summary =
  {
  consumer_count: int option ;
  open_shard_count: int ;
  key_id: string option ;
  encryption_type: encryption_type option ;
  enhanced_monitoring: enhanced_metrics list ;
  stream_creation_timestamp: CoreTypes.Timestamp.t ;
  retention_period_hours: int ;
  stream_mode_details: stream_mode_details option ;
  stream_status: stream_status ;
  stream_ar_n: string ;
  stream_name: string }
type nonrec sequence_number_range =
  {
  ending_sequence_number: string option ;
  starting_sequence_number: string }
type nonrec shard =
  {
  sequence_number_range: sequence_number_range ;
  hash_key_range: hash_key_range ;
  adjacent_parent_shard_id: string option ;
  parent_shard_id: string option ;
  shard_id: string }
type nonrec stream_description =
  {
  key_id: string option ;
  encryption_type: encryption_type option ;
  enhanced_monitoring: enhanced_metrics list ;
  stream_creation_timestamp: CoreTypes.Timestamp.t ;
  retention_period_hours: int ;
  has_more_shards: bool ;
  shards: shard list ;
  stream_mode_details: stream_mode_details option ;
  stream_status: stream_status ;
  stream_ar_n: string ;
  stream_name: string }
type nonrec stop_stream_encryption_input =
  {
  stream_ar_n: string option ;
  key_id: string ;
  encryption_type: encryption_type ;
  stream_name: string option }
type nonrec start_stream_encryption_input =
  {
  stream_ar_n: string option ;
  key_id: string ;
  encryption_type: encryption_type ;
  stream_name: string option }
type nonrec split_shard_input =
  {
  stream_ar_n: string option ;
  new_starting_hash_key: string ;
  shard_to_split: string ;
  stream_name: string option }
type nonrec shard_filter_type =
  | FROM_TIMESTAMP 
  | AT_TIMESTAMP 
  | AT_LATEST 
  | FROM_TRIM_HORIZON 
  | AT_TRIM_HORIZON 
  | AFTER_SHARD_ID 
type nonrec shard_filter =
  {
  timestamp_: CoreTypes.Timestamp.t option ;
  shard_id: string option ;
  type_: shard_filter_type }
type nonrec remove_tags_from_stream_input =
  {
  stream_ar_n: string option ;
  tag_keys: string list ;
  stream_name: string option }
type nonrec consumer_status =
  | ACTIVE 
  | DELETING 
  | CREATING 
type nonrec consumer =
  {
  consumer_creation_timestamp: CoreTypes.Timestamp.t ;
  consumer_status: consumer_status ;
  consumer_ar_n: string ;
  consumer_name: string }
type nonrec register_stream_consumer_output = {
  consumer: consumer }
type nonrec register_stream_consumer_input =
  {
  consumer_name: string ;
  stream_ar_n: string }
type nonrec put_resource_policy_input =
  {
  policy: string ;
  resource_ar_n: string }
type nonrec put_records_result_entry =
  {
  error_message: string option ;
  error_code: string option ;
  shard_id: string option ;
  sequence_number: string option }
type nonrec put_records_request_entry =
  {
  partition_key: string ;
  explicit_hash_key: string option ;
  data: bytes }
type nonrec put_records_output =
  {
  encryption_type: encryption_type option ;
  records: put_records_result_entry list ;
  failed_record_count: int option }
type nonrec put_records_input =
  {
  stream_ar_n: string option ;
  stream_name: string option ;
  records: put_records_request_entry list }
type nonrec provisioned_throughput_exceeded_exception =
  {
  message: string option }
type nonrec put_record_output =
  {
  encryption_type: encryption_type option ;
  sequence_number: string ;
  shard_id: string }
type nonrec put_record_input =
  {
  stream_ar_n: string option ;
  sequence_number_for_ordering: string option ;
  explicit_hash_key: string option ;
  partition_key: string ;
  data: bytes ;
  stream_name: string option }
type nonrec merge_shards_input =
  {
  stream_ar_n: string option ;
  adjacent_shard_to_merge: string ;
  shard_to_merge: string ;
  stream_name: string option }
type nonrec list_tags_for_stream_output =
  {
  has_more_tags: bool ;
  tags: tag list }
type nonrec list_tags_for_stream_input =
  {
  stream_ar_n: string option ;
  limit: int option ;
  exclusive_start_tag_key: string option ;
  stream_name: string option }
type nonrec list_streams_output =
  {
  stream_summaries: stream_summary list option ;
  next_token: string option ;
  has_more_streams: bool ;
  stream_names: string list }
type nonrec list_streams_input =
  {
  next_token: string option ;
  exclusive_start_stream_name: string option ;
  limit: int option }
type nonrec expired_next_token_exception = {
  message: string option }
type nonrec list_stream_consumers_output =
  {
  next_token: string option ;
  consumers: consumer list option }
type nonrec list_stream_consumers_input =
  {
  stream_creation_timestamp: CoreTypes.Timestamp.t option ;
  max_results: int option ;
  next_token: string option ;
  stream_ar_n: string }
type nonrec list_shards_output =
  {
  next_token: string option ;
  shards: shard list option }
type nonrec list_shards_input =
  {
  stream_ar_n: string option ;
  shard_filter: shard_filter option ;
  stream_creation_timestamp: CoreTypes.Timestamp.t option ;
  max_results: int option ;
  exclusive_start_shard_id: string option ;
  next_token: string option ;
  stream_name: string option }
type nonrec increase_stream_retention_period_input =
  {
  stream_ar_n: string option ;
  retention_period_hours: int ;
  stream_name: string option }
type nonrec get_shard_iterator_output = {
  shard_iterator: string option }
type nonrec get_shard_iterator_input =
  {
  stream_ar_n: string option ;
  timestamp_: CoreTypes.Timestamp.t option ;
  starting_sequence_number: string option ;
  shard_iterator_type: shard_iterator_type ;
  shard_id: string ;
  stream_name: string option }
type nonrec get_resource_policy_output = {
  policy: string }
type nonrec get_resource_policy_input = {
  resource_ar_n: string }
type nonrec expired_iterator_exception = {
  message: string option }
type nonrec get_records_output =
  {
  child_shards: child_shard list option ;
  millis_behind_latest: int option ;
  next_shard_iterator: string option ;
  records: record list }
type nonrec get_records_input =
  {
  stream_ar_n: string option ;
  limit: int option ;
  shard_iterator: string }
type nonrec enhanced_monitoring_output =
  {
  stream_ar_n: string option ;
  desired_shard_level_metrics: metrics_name list option ;
  current_shard_level_metrics: metrics_name list option ;
  stream_name: string option }
type nonrec enable_enhanced_monitoring_input =
  {
  stream_ar_n: string option ;
  shard_level_metrics: metrics_name list ;
  stream_name: string option }
type nonrec disable_enhanced_monitoring_input =
  {
  stream_ar_n: string option ;
  shard_level_metrics: metrics_name list ;
  stream_name: string option }
type nonrec describe_stream_summary_output =
  {
  stream_description_summary: stream_description_summary }
type nonrec describe_stream_summary_input =
  {
  stream_ar_n: string option ;
  stream_name: string option }
type nonrec consumer_description =
  {
  stream_ar_n: string ;
  consumer_creation_timestamp: CoreTypes.Timestamp.t ;
  consumer_status: consumer_status ;
  consumer_ar_n: string ;
  consumer_name: string }
type nonrec describe_stream_consumer_output =
  {
  consumer_description: consumer_description }
type nonrec describe_stream_consumer_input =
  {
  consumer_ar_n: string option ;
  consumer_name: string option ;
  stream_ar_n: string option }
type nonrec describe_stream_output =
  {
  stream_description: stream_description }
type nonrec describe_stream_input =
  {
  stream_ar_n: string option ;
  exclusive_start_shard_id: string option ;
  limit: int option ;
  stream_name: string option }
type nonrec describe_limits_output =
  {
  on_demand_stream_count_limit: int ;
  on_demand_stream_count: int ;
  open_shard_count: int ;
  shard_limit: int }
type nonrec describe_limits_input = unit
type nonrec deregister_stream_consumer_input =
  {
  consumer_ar_n: string option ;
  consumer_name: string option ;
  stream_ar_n: string option }
type nonrec delete_stream_input =
  {
  stream_ar_n: string option ;
  enforce_consumer_deletion: bool option ;
  stream_name: string option }
type nonrec delete_resource_policy_input = {
  resource_ar_n: string }
type nonrec decrease_stream_retention_period_input =
  {
  stream_ar_n: string option ;
  retention_period_hours: int ;
  stream_name: string option }
type nonrec create_stream_input =
  {
  stream_mode_details: stream_mode_details option ;
  shard_count: int option ;
  stream_name: string }
type nonrec add_tags_to_stream_input =
  {
  stream_ar_n: string option ;
  tags: tag_map ;
  stream_name: string option }