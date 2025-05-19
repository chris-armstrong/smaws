open Smaws_Lib
val service : Smaws_Lib.Service.descriptor
type nonrec validation_exception = {
  message: string option }[@@ocaml.doc
                            "Specifies that you tried to invoke this API for a data stream with the on-demand capacity mode. This API is only supported for data streams with the provisioned capacity mode. \n"]
type nonrec stream_mode =
  | ON_DEMAND 
  | PROVISIONED [@@ocaml.doc ""]
type nonrec stream_mode_details = {
  stream_mode: stream_mode }[@@ocaml.doc
                              " Specifies the capacity mode to which you want to set your data stream. Currently, in Kinesis Data Streams, you can choose between an {b on-demand} capacity mode and a {b provisioned} capacity mode for your data streams. \n"]
type nonrec update_stream_mode_input =
  {
  stream_mode_details: stream_mode_details ;
  stream_ar_n: string }[@@ocaml.doc ""]
type nonrec resource_not_found_exception = {
  message: string option }[@@ocaml.doc
                            "The requested resource could not be found. The stream might not be specified correctly.\n"]
type nonrec resource_in_use_exception = {
  message: string option }[@@ocaml.doc
                            "The resource is not available for this operation. For successful operation, the resource must be in the [ACTIVE] state.\n"]
type nonrec limit_exceeded_exception = {
  message: string option }[@@ocaml.doc
                            "The requested resource exceeds the maximum number allowed, or the number of concurrent stream requests exceeds the maximum number allowed. \n"]
type nonrec invalid_argument_exception = {
  message: string option }[@@ocaml.doc
                            "A specified parameter exceeds its restrictions, is not supported, or can't be used. For more information, see the returned message.\n"]
type nonrec update_shard_count_output =
  {
  stream_ar_n: string option ;
  target_shard_count: int option ;
  current_shard_count: int option ;
  stream_name: string option }[@@ocaml.doc ""]
type nonrec scaling_type =
  | UNIFORM_SCALING [@@ocaml.doc ""]
type nonrec update_shard_count_input =
  {
  stream_ar_n: string option ;
  scaling_type: scaling_type ;
  target_shard_count: int ;
  stream_name: string option }[@@ocaml.doc ""]
type nonrec access_denied_exception = {
  message: string option }[@@ocaml.doc
                            "Specifies that you do not have the permissions required to perform this operation.\n"]
type nonrec tag_map = (string * string) list[@@ocaml.doc ""]
type nonrec tag = {
  value: string option ;
  key: string }[@@ocaml.doc
                 "Metadata assigned to the stream, consisting of a key-value pair.\n"]
type nonrec encryption_type =
  | KMS 
  | NONE [@@ocaml.doc ""]
type nonrec record =
  {
  encryption_type: encryption_type option ;
  partition_key: string ;
  data: bytes ;
  approximate_arrival_timestamp: CoreTypes.Timestamp.t option ;
  sequence_number: string }[@@ocaml.doc
                             "The unit of data of the Kinesis data stream, which is composed of a sequence number, a partition key, and a data blob.\n"]
type nonrec hash_key_range =
  {
  ending_hash_key: string ;
  starting_hash_key: string }[@@ocaml.doc
                               "The range of possible hash key values for the shard, which is a set of ordered contiguous positive integers.\n"]
type nonrec child_shard =
  {
  hash_key_range: hash_key_range ;
  parent_shards: string list ;
  shard_id: string }[@@ocaml.doc
                      "Output parameter of the GetRecords API. The existing child shard of the current shard.\n"]
type nonrec subscribe_to_shard_event =
  {
  child_shards: child_shard list option ;
  millis_behind_latest: int ;
  continuation_sequence_number: string ;
  records: record list }[@@ocaml.doc
                          "After you call [SubscribeToShard], Kinesis Data Streams sends events of this type over an HTTP/2 connection to your consumer.\n"]
type nonrec kms_disabled_exception = {
  message: string option }[@@ocaml.doc
                            "The request was rejected because the specified customer master key (CMK) isn't enabled.\n"]
type nonrec kms_invalid_state_exception = {
  message: string option }[@@ocaml.doc
                            "The request was rejected because the state of the specified resource isn't valid for this request. For more information, see {{:https://docs.aws.amazon.com/kms/latest/developerguide/key-state.html}How Key State Affects Use of a Customer Master Key} in the {i Amazon Web Services Key Management Service Developer Guide}.\n"]
type nonrec kms_access_denied_exception = {
  message: string option }[@@ocaml.doc
                            "The ciphertext references a key that doesn't exist or that you don't have access to.\n"]
type nonrec kms_not_found_exception = {
  message: string option }[@@ocaml.doc
                            "The request was rejected because the specified entity or resource can't be found.\n"]
type nonrec kms_opt_in_required = {
  message: string option }[@@ocaml.doc
                            "The Amazon Web Services access key ID needs a subscription for the service.\n"]
type nonrec kms_throttling_exception = {
  message: string option }[@@ocaml.doc
                            "The request was denied due to request throttling. For more information about throttling, see {{:https://docs.aws.amazon.com/kms/latest/developerguide/limits.html#requests-per-second}Limits} in the {i Amazon Web Services Key Management Service Developer Guide}.\n"]
type nonrec internal_failure_exception = {
  message: string option }[@@ocaml.doc
                            "The processing of the request failed because of an unknown error, exception, or failure.\n"]
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
  | SubscribeToShardEvent of subscribe_to_shard_event [@@ocaml.doc
                                                        "This is a tagged union for all of the types of events an enhanced fan-out consumer can receive over HTTP/2 after a call to [SubscribeToShard].\n"]
type nonrec subscribe_to_shard_output =
  {
  event_stream: subscribe_to_shard_event_stream }[@@ocaml.doc ""]
type nonrec shard_iterator_type =
  | AT_TIMESTAMP 
  | LATEST 
  | TRIM_HORIZON 
  | AFTER_SEQUENCE_NUMBER 
  | AT_SEQUENCE_NUMBER [@@ocaml.doc ""]
type nonrec starting_position =
  {
  timestamp_: CoreTypes.Timestamp.t option ;
  sequence_number: string option ;
  type_: shard_iterator_type }[@@ocaml.doc
                                "The starting position in the data stream from which to start streaming.\n"]
type nonrec subscribe_to_shard_input =
  {
  starting_position: starting_position ;
  shard_id: string ;
  consumer_ar_n: string }[@@ocaml.doc ""]
type nonrec stream_status =
  | UPDATING 
  | ACTIVE 
  | DELETING 
  | CREATING [@@ocaml.doc ""]
type nonrec stream_summary =
  {
  stream_creation_timestamp: CoreTypes.Timestamp.t option ;
  stream_mode_details: stream_mode_details option ;
  stream_status: stream_status ;
  stream_ar_n: string ;
  stream_name: string }[@@ocaml.doc "The summary of a stream.\n"]
type nonrec metrics_name =
  | ALL 
  | ITERATOR_AGE_MILLISECONDS 
  | READ_PROVISIONED_THROUGHPUT_EXCEEDED 
  | WRITE_PROVISIONED_THROUGHPUT_EXCEEDED 
  | OUTGOING_RECORDS 
  | OUTGOING_BYTES 
  | INCOMING_RECORDS 
  | INCOMING_BYTES [@@ocaml.doc ""]
type nonrec enhanced_metrics =
  {
  shard_level_metrics: metrics_name list option }[@@ocaml.doc
                                                   "Represents enhanced metrics types.\n"]
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
  stream_name: string }[@@ocaml.doc
                         "Represents the output for [DescribeStreamSummary] \n"]
type nonrec sequence_number_range =
  {
  ending_sequence_number: string option ;
  starting_sequence_number: string }[@@ocaml.doc
                                      "The range of possible sequence numbers for the shard.\n"]
type nonrec shard =
  {
  sequence_number_range: sequence_number_range ;
  hash_key_range: hash_key_range ;
  adjacent_parent_shard_id: string option ;
  parent_shard_id: string option ;
  shard_id: string }[@@ocaml.doc
                      "A uniquely identified group of data records in a Kinesis data stream.\n"]
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
  stream_name: string }[@@ocaml.doc
                         "Represents the output for [DescribeStream].\n"]
type nonrec stop_stream_encryption_input =
  {
  stream_ar_n: string option ;
  key_id: string ;
  encryption_type: encryption_type ;
  stream_name: string option }[@@ocaml.doc ""]
type nonrec start_stream_encryption_input =
  {
  stream_ar_n: string option ;
  key_id: string ;
  encryption_type: encryption_type ;
  stream_name: string option }[@@ocaml.doc ""]
type nonrec split_shard_input =
  {
  stream_ar_n: string option ;
  new_starting_hash_key: string ;
  shard_to_split: string ;
  stream_name: string option }[@@ocaml.doc
                                "Represents the input for [SplitShard].\n"]
type nonrec shard_filter_type =
  | FROM_TIMESTAMP 
  | AT_TIMESTAMP 
  | AT_LATEST 
  | FROM_TRIM_HORIZON 
  | AT_TRIM_HORIZON 
  | AFTER_SHARD_ID [@@ocaml.doc ""]
type nonrec shard_filter =
  {
  timestamp_: CoreTypes.Timestamp.t option ;
  shard_id: string option ;
  type_: shard_filter_type }[@@ocaml.doc
                              "The request parameter used to filter out the response of the [ListShards] API.\n"]
type nonrec remove_tags_from_stream_input =
  {
  stream_ar_n: string option ;
  tag_keys: string list ;
  stream_name: string option }[@@ocaml.doc
                                "Represents the input for [RemoveTagsFromStream].\n"]
type nonrec consumer_status =
  | ACTIVE 
  | DELETING 
  | CREATING [@@ocaml.doc ""]
type nonrec consumer =
  {
  consumer_creation_timestamp: CoreTypes.Timestamp.t ;
  consumer_status: consumer_status ;
  consumer_ar_n: string ;
  consumer_name: string }[@@ocaml.doc
                           "An object that represents the details of the consumer you registered. This type of object is returned by [RegisterStreamConsumer].\n"]
type nonrec register_stream_consumer_output = {
  consumer: consumer }[@@ocaml.doc ""]
type nonrec register_stream_consumer_input =
  {
  consumer_name: string ;
  stream_ar_n: string }[@@ocaml.doc ""]
type nonrec put_resource_policy_input =
  {
  policy: string ;
  resource_ar_n: string }[@@ocaml.doc ""]
type nonrec put_records_result_entry =
  {
  error_message: string option ;
  error_code: string option ;
  shard_id: string option ;
  sequence_number: string option }[@@ocaml.doc
                                    "Represents the result of an individual record from a [PutRecords] request. A record that is successfully added to a stream includes [SequenceNumber] and [ShardId] in the result. A record that fails to be added to the stream includes [ErrorCode] and [ErrorMessage] in the result.\n"]
type nonrec put_records_request_entry =
  {
  partition_key: string ;
  explicit_hash_key: string option ;
  data: bytes }[@@ocaml.doc "Represents the output for [PutRecords].\n"]
type nonrec put_records_output =
  {
  encryption_type: encryption_type option ;
  records: put_records_result_entry list ;
  failed_record_count: int option }[@@ocaml.doc " [PutRecords] results.\n"]
type nonrec put_records_input =
  {
  stream_ar_n: string option ;
  stream_name: string option ;
  records: put_records_request_entry list }[@@ocaml.doc
                                             "A [PutRecords] request.\n"]
type nonrec provisioned_throughput_exceeded_exception =
  {
  message: string option }[@@ocaml.doc
                            "The request rate for the stream is too high, or the requested data is too large for the available throughput. Reduce the frequency or size of your requests. For more information, see {{:https://docs.aws.amazon.com/kinesis/latest/dev/service-sizes-and-limits.html}Streams Limits} in the {i Amazon Kinesis Data Streams Developer Guide}, and {{:https://docs.aws.amazon.com/general/latest/gr/api-retries.html}Error Retries and Exponential Backoff in Amazon Web Services} in the {i Amazon Web Services General Reference}.\n"]
type nonrec put_record_output =
  {
  encryption_type: encryption_type option ;
  sequence_number: string ;
  shard_id: string }[@@ocaml.doc "Represents the output for [PutRecord].\n"]
type nonrec put_record_input =
  {
  stream_ar_n: string option ;
  sequence_number_for_ordering: string option ;
  explicit_hash_key: string option ;
  partition_key: string ;
  data: bytes ;
  stream_name: string option }[@@ocaml.doc
                                "Represents the input for [PutRecord].\n"]
type nonrec merge_shards_input =
  {
  stream_ar_n: string option ;
  adjacent_shard_to_merge: string ;
  shard_to_merge: string ;
  stream_name: string option }[@@ocaml.doc
                                "Represents the input for [MergeShards].\n"]
type nonrec list_tags_for_stream_output =
  {
  has_more_tags: bool ;
  tags: tag list }[@@ocaml.doc
                    "Represents the output for [ListTagsForStream].\n"]
type nonrec list_tags_for_stream_input =
  {
  stream_ar_n: string option ;
  limit: int option ;
  exclusive_start_tag_key: string option ;
  stream_name: string option }[@@ocaml.doc
                                "Represents the input for [ListTagsForStream].\n"]
type nonrec list_streams_output =
  {
  stream_summaries: stream_summary list option ;
  next_token: string option ;
  has_more_streams: bool ;
  stream_names: string list }[@@ocaml.doc
                               "Represents the output for [ListStreams].\n"]
type nonrec list_streams_input =
  {
  next_token: string option ;
  exclusive_start_stream_name: string option ;
  limit: int option }[@@ocaml.doc
                       "Represents the input for [ListStreams].\n"]
type nonrec expired_next_token_exception = {
  message: string option }[@@ocaml.doc
                            "The pagination token passed to the operation is expired.\n"]
type nonrec list_stream_consumers_output =
  {
  next_token: string option ;
  consumers: consumer list option }[@@ocaml.doc ""]
type nonrec list_stream_consumers_input =
  {
  stream_creation_timestamp: CoreTypes.Timestamp.t option ;
  max_results: int option ;
  next_token: string option ;
  stream_ar_n: string }[@@ocaml.doc ""]
type nonrec list_shards_output =
  {
  next_token: string option ;
  shards: shard list option }[@@ocaml.doc ""]
type nonrec list_shards_input =
  {
  stream_ar_n: string option ;
  shard_filter: shard_filter option ;
  stream_creation_timestamp: CoreTypes.Timestamp.t option ;
  max_results: int option ;
  exclusive_start_shard_id: string option ;
  next_token: string option ;
  stream_name: string option }[@@ocaml.doc ""]
type nonrec increase_stream_retention_period_input =
  {
  stream_ar_n: string option ;
  retention_period_hours: int ;
  stream_name: string option }[@@ocaml.doc
                                "Represents the input for [IncreaseStreamRetentionPeriod].\n"]
type nonrec get_shard_iterator_output = {
  shard_iterator: string option }[@@ocaml.doc
                                   "Represents the output for [GetShardIterator].\n"]
type nonrec get_shard_iterator_input =
  {
  stream_ar_n: string option ;
  timestamp_: CoreTypes.Timestamp.t option ;
  starting_sequence_number: string option ;
  shard_iterator_type: shard_iterator_type ;
  shard_id: string ;
  stream_name: string option }[@@ocaml.doc
                                "Represents the input for [GetShardIterator].\n"]
type nonrec get_resource_policy_output = {
  policy: string }[@@ocaml.doc ""]
type nonrec get_resource_policy_input = {
  resource_ar_n: string }[@@ocaml.doc ""]
type nonrec expired_iterator_exception = {
  message: string option }[@@ocaml.doc
                            "The provided iterator exceeds the maximum age allowed.\n"]
type nonrec get_records_output =
  {
  child_shards: child_shard list option ;
  millis_behind_latest: int option ;
  next_shard_iterator: string option ;
  records: record list }[@@ocaml.doc
                          "Represents the output for [GetRecords].\n"]
type nonrec get_records_input =
  {
  stream_ar_n: string option ;
  limit: int option ;
  shard_iterator: string }[@@ocaml.doc
                            "Represents the input for [GetRecords].\n"]
type nonrec enhanced_monitoring_output =
  {
  stream_ar_n: string option ;
  desired_shard_level_metrics: metrics_name list option ;
  current_shard_level_metrics: metrics_name list option ;
  stream_name: string option }[@@ocaml.doc
                                "Represents the output for [EnableEnhancedMonitoring] and [DisableEnhancedMonitoring].\n"]
type nonrec enable_enhanced_monitoring_input =
  {
  stream_ar_n: string option ;
  shard_level_metrics: metrics_name list ;
  stream_name: string option }[@@ocaml.doc
                                "Represents the input for [EnableEnhancedMonitoring].\n"]
type nonrec disable_enhanced_monitoring_input =
  {
  stream_ar_n: string option ;
  shard_level_metrics: metrics_name list ;
  stream_name: string option }[@@ocaml.doc
                                "Represents the input for [DisableEnhancedMonitoring].\n"]
type nonrec describe_stream_summary_output =
  {
  stream_description_summary: stream_description_summary }[@@ocaml.doc ""]
type nonrec describe_stream_summary_input =
  {
  stream_ar_n: string option ;
  stream_name: string option }[@@ocaml.doc ""]
type nonrec consumer_description =
  {
  stream_ar_n: string ;
  consumer_creation_timestamp: CoreTypes.Timestamp.t ;
  consumer_status: consumer_status ;
  consumer_ar_n: string ;
  consumer_name: string }[@@ocaml.doc
                           "An object that represents the details of a registered consumer. This type of object is returned by [DescribeStreamConsumer].\n"]
type nonrec describe_stream_consumer_output =
  {
  consumer_description: consumer_description }[@@ocaml.doc ""]
type nonrec describe_stream_consumer_input =
  {
  consumer_ar_n: string option ;
  consumer_name: string option ;
  stream_ar_n: string option }[@@ocaml.doc ""]
type nonrec describe_stream_output =
  {
  stream_description: stream_description }[@@ocaml.doc
                                            "Represents the output for [DescribeStream].\n"]
type nonrec describe_stream_input =
  {
  stream_ar_n: string option ;
  exclusive_start_shard_id: string option ;
  limit: int option ;
  stream_name: string option }[@@ocaml.doc
                                "Represents the input for [DescribeStream].\n"]
type nonrec describe_limits_output =
  {
  on_demand_stream_count_limit: int ;
  on_demand_stream_count: int ;
  open_shard_count: int ;
  shard_limit: int }[@@ocaml.doc ""]
type nonrec describe_limits_input = unit
type nonrec deregister_stream_consumer_input =
  {
  consumer_ar_n: string option ;
  consumer_name: string option ;
  stream_ar_n: string option }[@@ocaml.doc ""]
type nonrec delete_stream_input =
  {
  stream_ar_n: string option ;
  enforce_consumer_deletion: bool option ;
  stream_name: string option }[@@ocaml.doc
                                "Represents the input for [DeleteStream].\n"]
type nonrec delete_resource_policy_input = {
  resource_ar_n: string }[@@ocaml.doc ""]
type nonrec decrease_stream_retention_period_input =
  {
  stream_ar_n: string option ;
  retention_period_hours: int ;
  stream_name: string option }[@@ocaml.doc
                                "Represents the input for [DecreaseStreamRetentionPeriod].\n"]
type nonrec create_stream_input =
  {
  stream_mode_details: stream_mode_details option ;
  shard_count: int option ;
  stream_name: string }[@@ocaml.doc
                         "Represents the input for [CreateStream].\n"]
type nonrec add_tags_to_stream_input =
  {
  stream_ar_n: string option ;
  tags: tag_map ;
  stream_name: string option }[@@ocaml.doc
                                "Represents the input for [AddTagsToStream].\n"]