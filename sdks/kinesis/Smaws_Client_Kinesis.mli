(** 
    Kinesis client library built on EIO.
    
*)

open Smaws_Lib

(** {1:types Types} *)

type nonrec validation_exception = {
  message: string option [@ocaml.doc ""]}[@@ocaml.doc
                                           "Specifies that you tried to invoke this API for a data stream with the on-demand capacity mode. This API is only supported for data streams with the provisioned capacity mode. \n"]
type nonrec stream_mode =
  | ON_DEMAND [@ocaml.doc ""]
  | PROVISIONED [@ocaml.doc ""][@@ocaml.doc ""]
type nonrec stream_mode_details =
  {
  stream_mode: stream_mode
    [@ocaml.doc
      " Specifies the capacity mode to which you want to set your data stream. Currently, in Kinesis Data Streams, you can choose between an {b on-demand} capacity mode and a {b provisioned} capacity mode for your data streams. \n"]}
[@@ocaml.doc
  " Specifies the capacity mode to which you want to set your data stream. Currently, in Kinesis Data Streams, you can choose between an {b on-demand} capacity mode and a {b provisioned} capacity mode for your data streams. \n"]
type nonrec update_stream_mode_input =
  {
  stream_mode_details: stream_mode_details
    [@ocaml.doc
      " Specifies the capacity mode to which you want to set your data stream. Currently, in Kinesis Data Streams, you can choose between an {b on-demand} capacity mode and a {b provisioned} capacity mode for your data streams. \n"];
  stream_ar_n: string
    [@ocaml.doc
      " Specifies the ARN of the data stream whose capacity mode you want to update. \n"]}
[@@ocaml.doc ""]
type nonrec resource_not_found_exception =
  {
  message: string option
    [@ocaml.doc "A message that provides information about the error.\n"]}
[@@ocaml.doc
  "The requested resource could not be found. The stream might not be specified correctly.\n"]
type nonrec resource_in_use_exception =
  {
  message: string option
    [@ocaml.doc "A message that provides information about the error.\n"]}
[@@ocaml.doc
  "The resource is not available for this operation. For successful operation, the resource must be in the [ACTIVE] state.\n"]
type nonrec limit_exceeded_exception =
  {
  message: string option
    [@ocaml.doc "A message that provides information about the error.\n"]}
[@@ocaml.doc
  "The requested resource exceeds the maximum number allowed, or the number of concurrent stream requests exceeds the maximum number allowed. \n"]
type nonrec invalid_argument_exception =
  {
  message: string option
    [@ocaml.doc "A message that provides information about the error.\n"]}
[@@ocaml.doc
  "A specified parameter exceeds its restrictions, is not supported, or can't be used. For more information, see the returned message.\n"]
type nonrec update_shard_count_output =
  {
  stream_ar_n: string option [@ocaml.doc "The ARN of the stream.\n"];
  target_shard_count: int option
    [@ocaml.doc "The updated number of shards.\n"];
  current_shard_count: int option
    [@ocaml.doc "The current number of shards.\n"];
  stream_name: string option [@ocaml.doc "The name of the stream.\n"]}
[@@ocaml.doc ""]
type nonrec scaling_type =
  | UNIFORM_SCALING [@ocaml.doc ""][@@ocaml.doc ""]
type nonrec update_shard_count_input =
  {
  stream_ar_n: string option [@ocaml.doc "The ARN of the stream.\n"];
  scaling_type: scaling_type
    [@ocaml.doc
      "The scaling type. Uniform scaling creates shards of equal size.\n"];
  target_shard_count: int
    [@ocaml.doc
      "The new number of shards. This value has the following default limits. By default, you cannot do the following: \n\n {ul\n       {-  Set this value to more than double your current shard count for a stream.\n           \n            }\n       {-  Set this value below half your current shard count for a stream.\n           \n            }\n       {-  Set this value to more than 10000 shards in a stream (the default limit for shard count per stream is 10000 per account per region), unless you request a limit increase.\n           \n            }\n       {-  Scale a stream with more than 10000 shards down unless you set this value to less than 10000 shards.\n           \n            }\n       }\n  "];
  stream_name: string option [@ocaml.doc "The name of the stream.\n"]}
[@@ocaml.doc ""]
type nonrec access_denied_exception =
  {
  message: string option [@ocaml.doc ""]}[@@ocaml.doc
                                           "Specifies that you do not have the permissions required to perform this operation.\n"]
type nonrec untag_resource_input =
  {
  resource_ar_n: string
    [@ocaml.doc
      "The Amazon Resource Name (ARN) of the Kinesis resource from which to remove tags.\n"];
  tag_keys: string list
    [@ocaml.doc
      "A list of tag key-value pairs. Existing tags of the resource whose keys are members of this list will be removed from the Kinesis resource.\n"]}
[@@ocaml.doc ""]
type nonrec tag_map = (string * string) list[@@ocaml.doc ""]
type nonrec tag_resource_input =
  {
  resource_ar_n: string
    [@ocaml.doc
      "The Amazon Resource Name (ARN) of the Kinesis resource to which to add tags.\n"];
  tags: tag_map
    [@ocaml.doc
      "An array of tags to be added to the Kinesis resource. A tag consists of a required key and an optional value. You can add up to 50 tags per resource.\n\n Tags may only contain Unicode letters, digits, white space, or these symbols: _ . : / = + - \\@.\n "]}
[@@ocaml.doc ""]
type nonrec tag =
  {
  value: string option
    [@ocaml.doc
      "An optional string, typically used to describe or define the tag. Maximum length: 256 characters. Valid characters: Unicode letters, digits, white space, _ . / = + - % \\@\n"];
  key: string
    [@ocaml.doc
      "A unique identifier for the tag. Maximum length: 128 characters. Valid characters: Unicode letters, digits, white space, _ . / = + - % \\@\n"]}
[@@ocaml.doc
  "Metadata assigned to the stream or consumer, consisting of a key-value pair.\n"]
type nonrec encryption_type =
  | KMS [@ocaml.doc ""]
  | NONE [@ocaml.doc ""][@@ocaml.doc ""]
type nonrec record =
  {
  encryption_type: encryption_type option
    [@ocaml.doc
      "The encryption type used on the record. This parameter can be one of the following values:\n\n {ul\n       {-   [NONE]: Do not encrypt the records in the stream.\n           \n            }\n       {-   [KMS]: Use server-side encryption on the records in the stream using a customer-managed Amazon Web Services KMS key.\n           \n            }\n       }\n  "];
  partition_key: string
    [@ocaml.doc
      "Identifies which shard in the stream the data record is assigned to.\n"];
  data: bytes
    [@ocaml.doc
      "The data blob. The data in the blob is both opaque and immutable to Kinesis Data Streams, which does not inspect, interpret, or change the data in the blob in any way. When the data blob (the payload before base64-encoding) is added to the partition key size, the total size must not exceed the maximum record size (1 MiB).\n"];
  approximate_arrival_timestamp: CoreTypes.Timestamp.t option
    [@ocaml.doc
      "The approximate time that the record was inserted into the stream.\n"];
  sequence_number: string
    [@ocaml.doc "The unique identifier of the record within its shard.\n"]}
[@@ocaml.doc
  "The unit of data of the Kinesis data stream, which is composed of a sequence number, a partition key, and a data blob.\n"]
type nonrec hash_key_range =
  {
  ending_hash_key: string
    [@ocaml.doc "The ending hash key of the hash key range.\n"];
  starting_hash_key: string
    [@ocaml.doc "The starting hash key of the hash key range.\n"]}[@@ocaml.doc
                                                                    "The range of possible hash key values for the shard, which is a set of ordered contiguous positive integers.\n"]
type nonrec child_shard =
  {
  hash_key_range: hash_key_range [@ocaml.doc ""];
  parent_shards: string list
    [@ocaml.doc
      "The current shard that is the parent of the existing child shard.\n"];
  shard_id: string
    [@ocaml.doc
      "The shard ID of the existing child shard of the current shard.\n"]}
[@@ocaml.doc
  "Output parameter of the GetRecords API. The existing child shard of the current shard.\n"]
type nonrec subscribe_to_shard_event =
  {
  child_shards: child_shard list option
    [@ocaml.doc
      "The list of the child shards of the current shard, returned only at the end of the current shard.\n"];
  millis_behind_latest: int
    [@ocaml.doc
      "The number of milliseconds the read records are from the tip of the stream, indicating how far behind current time the consumer is. A value of zero indicates that record processing is caught up, and there are no new records to process at this moment.\n"];
  continuation_sequence_number: string
    [@ocaml.doc
      "Use this as [SequenceNumber] in the next call to [SubscribeToShard], with [StartingPosition] set to [AT_SEQUENCE_NUMBER] or [AFTER_SEQUENCE_NUMBER]. Use [ContinuationSequenceNumber] for checkpointing because it captures your shard progress even when no data is written to the shard.\n"];
  records: record list [@ocaml.doc "\n"]}[@@ocaml.doc
                                           "After you call [SubscribeToShard], Kinesis Data Streams sends events of this type over an HTTP/2 connection to your consumer.\n"]
type nonrec kms_disabled_exception =
  {
  message: string option
    [@ocaml.doc "A message that provides information about the error.\n"]}
[@@ocaml.doc
  "The request was rejected because the specified customer master key (CMK) isn't enabled.\n"]
type nonrec kms_invalid_state_exception =
  {
  message: string option
    [@ocaml.doc "A message that provides information about the error.\n"]}
[@@ocaml.doc
  "The request was rejected because the state of the specified resource isn't valid for this request. For more information, see {{:https://docs.aws.amazon.com/kms/latest/developerguide/key-state.html}How Key State Affects Use of a Customer Master Key} in the {i Amazon Web Services Key Management Service Developer Guide}.\n"]
type nonrec kms_access_denied_exception =
  {
  message: string option
    [@ocaml.doc "A message that provides information about the error.\n"]}
[@@ocaml.doc
  "The ciphertext references a key that doesn't exist or that you don't have access to.\n"]
type nonrec kms_not_found_exception =
  {
  message: string option
    [@ocaml.doc "A message that provides information about the error.\n"]}
[@@ocaml.doc
  "The request was rejected because the specified entity or resource can't be found.\n"]
type nonrec kms_opt_in_required =
  {
  message: string option
    [@ocaml.doc "A message that provides information about the error.\n"]}
[@@ocaml.doc
  "The Amazon Web Services access key ID needs a subscription for the service.\n"]
type nonrec kms_throttling_exception =
  {
  message: string option
    [@ocaml.doc "A message that provides information about the error.\n"]}
[@@ocaml.doc
  "The request was denied due to request throttling. For more information about throttling, see {{:https://docs.aws.amazon.com/kms/latest/developerguide/limits.html#requests-per-second}Limits} in the {i Amazon Web Services Key Management Service Developer Guide}.\n"]
type nonrec internal_failure_exception =
  {
  message: string option [@ocaml.doc ""]}[@@ocaml.doc
                                           "The processing of the request failed because of an unknown error, exception, or failure.\n"]
type nonrec subscribe_to_shard_event_stream =
  | InternalFailureException of internal_failure_exception
  [@ocaml.doc
    "The processing of the request failed because of an unknown error, exception, or failure.\n"]
  | KMSThrottlingException of kms_throttling_exception [@ocaml.doc ""]
  | KMSOptInRequired of kms_opt_in_required [@ocaml.doc ""]
  | KMSNotFoundException of kms_not_found_exception [@ocaml.doc ""]
  | KMSAccessDeniedException of kms_access_denied_exception [@ocaml.doc ""]
  | KMSInvalidStateException of kms_invalid_state_exception [@ocaml.doc ""]
  | KMSDisabledException of kms_disabled_exception [@ocaml.doc ""]
  | ResourceInUseException of resource_in_use_exception [@ocaml.doc ""]
  | ResourceNotFoundException of resource_not_found_exception
  [@ocaml.doc ""]
  | SubscribeToShardEvent of subscribe_to_shard_event
  [@ocaml.doc
    "After you call [SubscribeToShard], Kinesis Data Streams sends events of this type to your consumer. For an example of how to handle these events, see {{:/streams/latest/dev/building-enhanced-consumers-api.html}Enhanced Fan-Out Using the Kinesis Data Streams API}.\n"]
[@@ocaml.doc
  "This is a tagged union for all of the types of events an enhanced fan-out consumer can receive over HTTP/2 after a call to [SubscribeToShard].\n"]
type nonrec subscribe_to_shard_output =
  {
  event_stream: subscribe_to_shard_event_stream
    [@ocaml.doc
      "The event stream that your consumer can use to read records from the shard.\n"]}
[@@ocaml.doc ""]
type nonrec shard_iterator_type =
  | AT_TIMESTAMP [@ocaml.doc ""]
  | LATEST [@ocaml.doc ""]
  | TRIM_HORIZON [@ocaml.doc ""]
  | AFTER_SEQUENCE_NUMBER [@ocaml.doc ""]
  | AT_SEQUENCE_NUMBER [@ocaml.doc ""][@@ocaml.doc ""]
type nonrec starting_position =
  {
  timestamp_: CoreTypes.Timestamp.t option
    [@ocaml.doc
      "The time stamp of the data record from which to start reading. To specify a time stamp, set [StartingPosition] to [Type AT_TIMESTAMP]. A time stamp is the Unix epoch date with precision in milliseconds. For example, [2016-04-04T19:58:46.480-00:00] or [1459799926.480]. If a record with this exact time stamp does not exist, records will be streamed from the next (later) record. If the time stamp is older than the current trim horizon, records will be streamed from the oldest untrimmed data record ([TRIM_HORIZON]).\n"];
  sequence_number: string option
    [@ocaml.doc
      "The sequence number of the data record in the shard from which to start streaming. To specify a sequence number, set [StartingPosition] to [AT_SEQUENCE_NUMBER] or [AFTER_SEQUENCE_NUMBER].\n"];
  type_: shard_iterator_type
    [@ocaml.doc
      "You can set the starting position to one of the following values:\n\n  [AT_SEQUENCE_NUMBER]: Start streaming from the position denoted by the sequence number specified in the [SequenceNumber] field.\n \n   [AFTER_SEQUENCE_NUMBER]: Start streaming right after the position denoted by the sequence number specified in the [SequenceNumber] field.\n  \n    [AT_TIMESTAMP]: Start streaming from the position denoted by the time stamp specified in the [Timestamp] field.\n   \n     [TRIM_HORIZON]: Start streaming at the last untrimmed record in the shard, which is the oldest data record in the shard.\n    \n      [LATEST]: Start streaming just after the most recent record in the shard, so that you always read the most recent data in the shard.\n     "]}
[@@ocaml.doc
  "The starting position in the data stream from which to start streaming.\n"]
type nonrec subscribe_to_shard_input =
  {
  starting_position: starting_position
    [@ocaml.doc
      "The starting position in the data stream from which to start streaming.\n"];
  shard_id: string
    [@ocaml.doc
      "The ID of the shard you want to subscribe to. To see a list of all the shards for a given stream, use [ListShards].\n"];
  consumer_ar_n: string
    [@ocaml.doc
      "For this parameter, use the value you obtained when you called [RegisterStreamConsumer].\n"]}
[@@ocaml.doc ""]
type nonrec stream_status =
  | UPDATING [@ocaml.doc ""]
  | ACTIVE [@ocaml.doc ""]
  | DELETING [@ocaml.doc ""]
  | CREATING [@ocaml.doc ""][@@ocaml.doc ""]
type nonrec stream_summary =
  {
  stream_creation_timestamp: CoreTypes.Timestamp.t option
    [@ocaml.doc "The timestamp at which the stream was created.\n"];
  stream_mode_details: stream_mode_details option [@ocaml.doc ""];
  stream_status: stream_status [@ocaml.doc "The status of the stream.\n"];
  stream_ar_n: string [@ocaml.doc "The ARN of the stream.\n"];
  stream_name: string [@ocaml.doc "The name of a stream.\n"]}[@@ocaml.doc
                                                               "The summary of a stream.\n"]
type nonrec metrics_name =
  | ALL [@ocaml.doc ""]
  | ITERATOR_AGE_MILLISECONDS [@ocaml.doc ""]
  | READ_PROVISIONED_THROUGHPUT_EXCEEDED [@ocaml.doc ""]
  | WRITE_PROVISIONED_THROUGHPUT_EXCEEDED [@ocaml.doc ""]
  | OUTGOING_RECORDS [@ocaml.doc ""]
  | OUTGOING_BYTES [@ocaml.doc ""]
  | INCOMING_RECORDS [@ocaml.doc ""]
  | INCOMING_BYTES [@ocaml.doc ""][@@ocaml.doc ""]
type nonrec enhanced_metrics =
  {
  shard_level_metrics: metrics_name list option
    [@ocaml.doc
      "List of shard-level metrics.\n\n The following are the valid shard-level metrics. The value \"[ALL]\" enhances every metric.\n \n  {ul\n        {-   [IncomingBytes] \n            \n             }\n        {-   [IncomingRecords] \n            \n             }\n        {-   [OutgoingBytes] \n            \n             }\n        {-   [OutgoingRecords] \n            \n             }\n        {-   [WriteProvisionedThroughputExceeded] \n            \n             }\n        {-   [ReadProvisionedThroughputExceeded] \n            \n             }\n        {-   [IteratorAgeMilliseconds] \n            \n             }\n        {-   [ALL] \n            \n             }\n        }\n   For more information, see {{:https://docs.aws.amazon.com/kinesis/latest/dev/monitoring-with-cloudwatch.html}Monitoring the Amazon Kinesis Data Streams Service with Amazon CloudWatch} in the {i Amazon Kinesis Data Streams Developer Guide}.\n   "]}
[@@ocaml.doc "Represents enhanced metrics types.\n"]
type nonrec stream_description_summary =
  {
  consumer_count: int option
    [@ocaml.doc
      "The number of enhanced fan-out consumers registered with the stream.\n"];
  open_shard_count: int
    [@ocaml.doc "The number of open shards in the stream.\n"];
  key_id: string option
    [@ocaml.doc
      "The GUID for the customer-managed Amazon Web Services KMS key to use for encryption. This value can be a globally unique identifier, a fully specified ARN to either an alias or a key, or an alias name prefixed by \"alias/\".You can also use a master key owned by Kinesis Data Streams by specifying the alias [aws/kinesis].\n\n {ul\n       {-  Key ARN example: [arn:aws:kms:us-east-1:123456789012:key/12345678-1234-1234-1234-123456789012] \n           \n            }\n       {-  Alias ARN example: [\n                        arn:aws:kms:us-east-1:123456789012:alias/MyAliasName] \n           \n            }\n       {-  Globally unique key ID example: [12345678-1234-1234-1234-123456789012] \n           \n            }\n       {-  Alias name example: [alias/MyAliasName] \n           \n            }\n       {-  Master key owned by Kinesis Data Streams: [alias/aws/kinesis] \n           \n            }\n       }\n  "];
  encryption_type: encryption_type option
    [@ocaml.doc
      "The encryption type used. This value is one of the following:\n\n {ul\n       {-   [KMS] \n           \n            }\n       {-   [NONE] \n           \n            }\n       }\n  "];
  enhanced_monitoring: enhanced_metrics list
    [@ocaml.doc
      "Represents the current enhanced monitoring settings of the stream.\n"];
  stream_creation_timestamp: CoreTypes.Timestamp.t
    [@ocaml.doc "The approximate time that the stream was created.\n"];
  retention_period_hours: int
    [@ocaml.doc "The current retention period, in hours.\n"];
  stream_mode_details: stream_mode_details option
    [@ocaml.doc
      " Specifies the capacity mode to which you want to set your data stream. Currently, in Kinesis Data Streams, you can choose between an {b on-demand} ycapacity mode and a {b provisioned} capacity mode for your data streams. \n"];
  stream_status: stream_status
    [@ocaml.doc
      "The current status of the stream being described. The stream status is one of the following states:\n\n {ul\n       {-   [CREATING] - The stream is being created. Kinesis Data Streams immediately returns and sets [StreamStatus] to [CREATING].\n           \n            }\n       {-   [DELETING] - The stream is being deleted. The specified stream is in the [DELETING] state until Kinesis Data Streams completes the deletion.\n           \n            }\n       {-   [ACTIVE] - The stream exists and is ready for read and write operations or deletion. You should perform read and write operations only on an [ACTIVE] stream.\n           \n            }\n       {-   [UPDATING] - Shards in the stream are being merged or split. Read and write operations continue to work while the stream is in the [UPDATING] state.\n           \n            }\n       }\n  "];
  stream_ar_n: string
    [@ocaml.doc
      "The Amazon Resource Name (ARN) for the stream being described.\n"];
  stream_name: string
    [@ocaml.doc "The name of the stream being described.\n"]}[@@ocaml.doc
                                                               "Represents the output for [DescribeStreamSummary] \n"]
type nonrec sequence_number_range =
  {
  ending_sequence_number: string option
    [@ocaml.doc
      "The ending sequence number for the range. Shards that are in the OPEN state have an ending sequence number of [null].\n"];
  starting_sequence_number: string
    [@ocaml.doc "The starting sequence number for the range.\n"]}[@@ocaml.doc
                                                                   "The range of possible sequence numbers for the shard.\n"]
type nonrec shard =
  {
  sequence_number_range: sequence_number_range
    [@ocaml.doc "The range of possible sequence numbers for the shard.\n"];
  hash_key_range: hash_key_range
    [@ocaml.doc
      "The range of possible hash key values for the shard, which is a set of ordered contiguous positive integers.\n"];
  adjacent_parent_shard_id: string option
    [@ocaml.doc
      "The shard ID of the shard adjacent to the shard's parent.\n"];
  parent_shard_id: string option
    [@ocaml.doc "The shard ID of the shard's parent.\n"];
  shard_id: string
    [@ocaml.doc "The unique identifier of the shard within the stream.\n"]}
[@@ocaml.doc
  "A uniquely identified group of data records in a Kinesis data stream.\n"]
type nonrec stream_description =
  {
  key_id: string option
    [@ocaml.doc
      "The GUID for the customer-managed Amazon Web Services KMS key to use for encryption. This value can be a globally unique identifier, a fully specified ARN to either an alias or a key, or an alias name prefixed by \"alias/\".You can also use a master key owned by Kinesis Data Streams by specifying the alias [aws/kinesis].\n\n {ul\n       {-  Key ARN example: [arn:aws:kms:us-east-1:123456789012:key/12345678-1234-1234-1234-123456789012] \n           \n            }\n       {-  Alias ARN example: [arn:aws:kms:us-east-1:123456789012:alias/MyAliasName] \n           \n            }\n       {-  Globally unique key ID example: [12345678-1234-1234-1234-123456789012] \n           \n            }\n       {-  Alias name example: [alias/MyAliasName] \n           \n            }\n       {-  Master key owned by Kinesis Data Streams: [alias/aws/kinesis] \n           \n            }\n       }\n  "];
  encryption_type: encryption_type option
    [@ocaml.doc
      "The server-side encryption type used on the stream. This parameter can be one of the following values:\n\n {ul\n       {-   [NONE]: Do not encrypt the records in the stream.\n           \n            }\n       {-   [KMS]: Use server-side encryption on the records in the stream using a customer-managed Amazon Web Services KMS key.\n           \n            }\n       }\n  "];
  enhanced_monitoring: enhanced_metrics list
    [@ocaml.doc
      "Represents the current enhanced monitoring settings of the stream.\n"];
  stream_creation_timestamp: CoreTypes.Timestamp.t
    [@ocaml.doc "The approximate time that the stream was created.\n"];
  retention_period_hours: int
    [@ocaml.doc
      "The current retention period, in hours. Minimum value of 24. Maximum value of 168.\n"];
  has_more_shards: bool
    [@ocaml.doc
      "If set to [true], more shards in the stream are available to describe.\n"];
  shards: shard list [@ocaml.doc "The shards that comprise the stream.\n"];
  stream_mode_details: stream_mode_details option
    [@ocaml.doc
      " Specifies the capacity mode to which you want to set your data stream. Currently, in Kinesis Data Streams, you can choose between an {b on-demand} capacity mode and a {b provisioned} capacity mode for your data streams. \n"];
  stream_status: stream_status
    [@ocaml.doc
      "The current status of the stream being described. The stream status is one of the following states:\n\n {ul\n       {-   [CREATING] - The stream is being created. Kinesis Data Streams immediately returns and sets [StreamStatus] to [CREATING].\n           \n            }\n       {-   [DELETING] - The stream is being deleted. The specified stream is in the [DELETING] state until Kinesis Data Streams completes the deletion.\n           \n            }\n       {-   [ACTIVE] - The stream exists and is ready for read and write operations or deletion. You should perform read and write operations only on an [ACTIVE] stream.\n           \n            }\n       {-   [UPDATING] - Shards in the stream are being merged or split. Read and write operations continue to work while the stream is in the [UPDATING] state.\n           \n            }\n       }\n  "];
  stream_ar_n: string
    [@ocaml.doc
      "The Amazon Resource Name (ARN) for the stream being described.\n"];
  stream_name: string
    [@ocaml.doc "The name of the stream being described.\n"]}[@@ocaml.doc
                                                               "Represents the output for [DescribeStream].\n"]
type nonrec stop_stream_encryption_input =
  {
  stream_ar_n: string option [@ocaml.doc "The ARN of the stream.\n"];
  key_id: string
    [@ocaml.doc
      "The GUID for the customer-managed Amazon Web Services KMS key to use for encryption. This value can be a globally unique identifier, a fully specified Amazon Resource Name (ARN) to either an alias or a key, or an alias name prefixed by \"alias/\".You can also use a master key owned by Kinesis Data Streams by specifying the alias [aws/kinesis].\n\n {ul\n       {-  Key ARN example: [arn:aws:kms:us-east-1:123456789012:key/12345678-1234-1234-1234-123456789012] \n           \n            }\n       {-  Alias ARN example: [arn:aws:kms:us-east-1:123456789012:alias/MyAliasName] \n           \n            }\n       {-  Globally unique key ID example: [12345678-1234-1234-1234-123456789012] \n           \n            }\n       {-  Alias name example: [alias/MyAliasName] \n           \n            }\n       {-  Master key owned by Kinesis Data Streams: [alias/aws/kinesis] \n           \n            }\n       }\n  "];
  encryption_type: encryption_type
    [@ocaml.doc "The encryption type. The only valid value is [KMS].\n"];
  stream_name: string option
    [@ocaml.doc
      "The name of the stream on which to stop encrypting records.\n"]}
[@@ocaml.doc ""]
type nonrec start_stream_encryption_input =
  {
  stream_ar_n: string option [@ocaml.doc "The ARN of the stream.\n"];
  key_id: string
    [@ocaml.doc
      "The GUID for the customer-managed Amazon Web Services KMS key to use for encryption. This value can be a globally unique identifier, a fully specified Amazon Resource Name (ARN) to either an alias or a key, or an alias name prefixed by \"alias/\".You can also use a master key owned by Kinesis Data Streams by specifying the alias [aws/kinesis].\n\n {ul\n       {-  Key ARN example: [arn:aws:kms:us-east-1:123456789012:key/12345678-1234-1234-1234-123456789012] \n           \n            }\n       {-  Alias ARN example: [arn:aws:kms:us-east-1:123456789012:alias/MyAliasName] \n           \n            }\n       {-  Globally unique key ID example: [12345678-1234-1234-1234-123456789012] \n           \n            }\n       {-  Alias name example: [alias/MyAliasName] \n           \n            }\n       {-  Master key owned by Kinesis Data Streams: [alias/aws/kinesis] \n           \n            }\n       }\n  "];
  encryption_type: encryption_type
    [@ocaml.doc
      "The encryption type to use. The only valid value is [KMS].\n"];
  stream_name: string option
    [@ocaml.doc
      "The name of the stream for which to start encrypting records.\n"]}
[@@ocaml.doc ""]
type nonrec split_shard_input =
  {
  stream_ar_n: string option [@ocaml.doc "The ARN of the stream.\n"];
  new_starting_hash_key: string
    [@ocaml.doc
      "A hash key value for the starting hash key of one of the child shards created by the split. The hash key range for a given shard constitutes a set of ordered contiguous positive integers. The value for [NewStartingHashKey] must be in the range of hash keys being mapped into the shard. The [NewStartingHashKey] hash key value and all higher hash key values in hash key range are distributed to one of the child shards. All the lower hash key values in the range are distributed to the other child shard.\n"];
  shard_to_split: string [@ocaml.doc "The shard ID of the shard to split.\n"];
  stream_name: string option
    [@ocaml.doc "The name of the stream for the shard split.\n"]}[@@ocaml.doc
                                                                   "Represents the input for [SplitShard].\n"]
type nonrec shard_filter_type =
  | FROM_TIMESTAMP [@ocaml.doc ""]
  | AT_TIMESTAMP [@ocaml.doc ""]
  | AT_LATEST [@ocaml.doc ""]
  | FROM_TRIM_HORIZON [@ocaml.doc ""]
  | AT_TRIM_HORIZON [@ocaml.doc ""]
  | AFTER_SHARD_ID [@ocaml.doc ""][@@ocaml.doc ""]
type nonrec shard_filter =
  {
  timestamp_: CoreTypes.Timestamp.t option
    [@ocaml.doc
      "The timestamps specified in the [ShardFilter] parameter. A timestamp is a Unix epoch date with precision in milliseconds. For example, 2016-04-04T19:58:46.480-00:00 or 1459799926.480. This property can only be used if [FROM_TIMESTAMP] or [AT_TIMESTAMP] shard types are specified.\n"];
  shard_id: string option
    [@ocaml.doc
      "The exclusive start [shardID] speified in the [ShardFilter] parameter. This property can only be used if the [AFTER_SHARD_ID] shard type is specified.\n"];
  type_: shard_filter_type
    [@ocaml.doc
      "The shard type specified in the [ShardFilter] parameter. This is a required property of the [ShardFilter] parameter.\n\n You can specify the following valid values: \n \n  {ul\n        {-   [AFTER_SHARD_ID] - the response includes all the shards, starting with the shard whose ID immediately follows the [ShardId] that you provided. \n            \n             }\n        {-   [AT_TRIM_HORIZON] - the response includes all the shards that were open at [TRIM_HORIZON].\n            \n             }\n        {-   [FROM_TRIM_HORIZON] - (default), the response includes all the shards within the retention period of the data stream (trim to tip).\n            \n             }\n        {-   [AT_LATEST] - the response includes only the currently open shards of the data stream.\n            \n             }\n        {-   [AT_TIMESTAMP] - the response includes all shards whose start timestamp is less than or equal to the given timestamp and end timestamp is greater than or equal to the given timestamp or still open. \n            \n             }\n        {-   [FROM_TIMESTAMP] - the response incldues all closed shards whose end timestamp is greater than or equal to the given timestamp and also all open shards. Corrected to [TRIM_HORIZON] of the data stream if [FROM_TIMESTAMP] is less than the [TRIM_HORIZON] value.\n            \n             }\n        }\n  "]}
[@@ocaml.doc
  "The request parameter used to filter out the response of the [ListShards] API.\n"]
type nonrec remove_tags_from_stream_input =
  {
  stream_ar_n: string option [@ocaml.doc "The ARN of the stream.\n"];
  tag_keys: string list
    [@ocaml.doc
      "A list of tag keys. Each corresponding tag is removed from the stream.\n"];
  stream_name: string option [@ocaml.doc "The name of the stream.\n"]}
[@@ocaml.doc "Represents the input for [RemoveTagsFromStream].\n"]
type nonrec consumer_status =
  | ACTIVE [@ocaml.doc ""]
  | DELETING [@ocaml.doc ""]
  | CREATING [@ocaml.doc ""][@@ocaml.doc ""]
type nonrec consumer =
  {
  consumer_creation_timestamp: CoreTypes.Timestamp.t [@ocaml.doc "\n"];
  consumer_status: consumer_status
    [@ocaml.doc
      "A consumer can't read data while in the [CREATING] or [DELETING] states.\n"];
  consumer_ar_n: string
    [@ocaml.doc
      "When you register a consumer, Kinesis Data Streams generates an ARN for it. You need this ARN to be able to call [SubscribeToShard].\n\n If you delete a consumer and then create a new one with the same name, it won't have the same ARN. That's because consumer ARNs contain the creation timestamp. This is important to keep in mind if you have IAM policies that reference consumer ARNs.\n "];
  consumer_name: string
    [@ocaml.doc
      "The name of the consumer is something you choose when you register the consumer.\n"]}
[@@ocaml.doc
  "An object that represents the details of the consumer you registered. This type of object is returned by [RegisterStreamConsumer].\n"]
type nonrec register_stream_consumer_output =
  {
  consumer: consumer
    [@ocaml.doc
      "An object that represents the details of the consumer you registered. When you register a consumer, it gets an ARN that is generated by Kinesis Data Streams.\n"]}
[@@ocaml.doc ""]
type nonrec register_stream_consumer_input =
  {
  tags: tag_map option
    [@ocaml.doc
      "A set of up to 50 key-value pairs. A tag consists of a required key and an optional value.\n"];
  consumer_name: string
    [@ocaml.doc
      "For a given Kinesis data stream, each consumer must have a unique name. However, consumer names don't have to be unique across data streams.\n"];
  stream_ar_n: string
    [@ocaml.doc
      "The ARN of the Kinesis data stream that you want to register the consumer with. For more info, see {{:https://docs.aws.amazon.com/general/latest/gr/aws-arns-and-namespaces.html#arn-syntax-kinesis-streams}Amazon Resource Names (ARNs) and Amazon Web Services Service Namespaces}.\n"]}
[@@ocaml.doc ""]
type nonrec put_resource_policy_input =
  {
  policy: string
    [@ocaml.doc
      "Details of the resource policy. It must include the identity of the principal and the actions allowed on this resource. This is formatted as a JSON string.\n"];
  resource_ar_n: string
    [@ocaml.doc
      "The Amazon Resource Name (ARN) of the data stream or consumer.\n"]}
[@@ocaml.doc ""]
type nonrec put_records_result_entry =
  {
  error_message: string option
    [@ocaml.doc
      "The error message for an individual record result. An [ErrorCode] value of [ProvisionedThroughputExceededException] has an error message that includes the account ID, stream name, and shard ID. An [ErrorCode] value of [InternalFailure] has the error message [\"Internal Service\n                Failure\"].\n"];
  error_code: string option
    [@ocaml.doc
      "The error code for an individual record result. [ErrorCodes] can be either [ProvisionedThroughputExceededException] or [InternalFailure].\n"];
  shard_id: string option
    [@ocaml.doc "The shard ID for an individual record result.\n"];
  sequence_number: string option
    [@ocaml.doc "The sequence number for an individual record result.\n"]}
[@@ocaml.doc
  "Represents the result of an individual record from a [PutRecords] request. A record that is successfully added to a stream includes [SequenceNumber] and [ShardId] in the result. A record that fails to be added to the stream includes [ErrorCode] and [ErrorMessage] in the result.\n"]
type nonrec put_records_request_entry =
  {
  partition_key: string
    [@ocaml.doc
      "Determines which shard in the stream the data record is assigned to. Partition keys are Unicode strings with a maximum length limit of 256 characters for each key. Amazon Kinesis Data Streams uses the partition key as input to a hash function that maps the partition key and associated data to a specific shard. Specifically, an MD5 hash function is used to map partition keys to 128-bit integer values and to map associated data records to shards. As a result of this hashing mechanism, all data records with the same partition key map to the same shard within the stream.\n"];
  explicit_hash_key: string option
    [@ocaml.doc
      "The hash value used to determine explicitly the shard that the data record is assigned to by overriding the partition key hash.\n"];
  data: bytes
    [@ocaml.doc
      "The data blob to put into the record, which is base64-encoded when the blob is serialized. When the data blob (the payload before base64-encoding) is added to the partition key size, the total size must not exceed the maximum record size (1 MiB).\n"]}
[@@ocaml.doc "Represents the output for [PutRecords].\n"]
type nonrec put_records_output =
  {
  encryption_type: encryption_type option
    [@ocaml.doc
      "The encryption type used on the records. This parameter can be one of the following values:\n\n {ul\n       {-   [NONE]: Do not encrypt the records.\n           \n            }\n       {-   [KMS]: Use server-side encryption on the records using a customer-managed Amazon Web Services KMS key.\n           \n            }\n       }\n  "];
  records: put_records_result_entry list
    [@ocaml.doc
      "An array of successfully and unsuccessfully processed record results. A record that is successfully added to a stream includes [SequenceNumber] and [ShardId] in the result. A record that fails to be added to a stream includes [ErrorCode] and [ErrorMessage] in the result.\n"];
  failed_record_count: int option
    [@ocaml.doc
      "The number of unsuccessfully processed records in a [PutRecords] request.\n"]}
[@@ocaml.doc " [PutRecords] results.\n"]
type nonrec put_records_input =
  {
  stream_ar_n: string option [@ocaml.doc "The ARN of the stream.\n"];
  stream_name: string option
    [@ocaml.doc "The stream name associated with the request.\n"];
  records: put_records_request_entry list
    [@ocaml.doc "The records associated with the request.\n"]}[@@ocaml.doc
                                                                "A [PutRecords] request.\n"]
type nonrec provisioned_throughput_exceeded_exception =
  {
  message: string option
    [@ocaml.doc "A message that provides information about the error.\n"]}
[@@ocaml.doc
  "The request rate for the stream is too high, or the requested data is too large for the available throughput. Reduce the frequency or size of your requests. For more information, see {{:https://docs.aws.amazon.com/kinesis/latest/dev/service-sizes-and-limits.html}Streams Limits} in the {i Amazon Kinesis Data Streams Developer Guide}, and {{:https://docs.aws.amazon.com/general/latest/gr/api-retries.html}Error Retries and Exponential Backoff in Amazon Web Services} in the {i Amazon Web Services General Reference}.\n"]
type nonrec put_record_output =
  {
  encryption_type: encryption_type option
    [@ocaml.doc
      "The encryption type to use on the record. This parameter can be one of the following values:\n\n {ul\n       {-   [NONE]: Do not encrypt the records in the stream.\n           \n            }\n       {-   [KMS]: Use server-side encryption on the records in the stream using a customer-managed Amazon Web Services KMS key.\n           \n            }\n       }\n  "];
  sequence_number: string
    [@ocaml.doc
      "The sequence number identifier that was assigned to the put data record. The sequence number for the record is unique across all records in the stream. A sequence number is the identifier associated with every record put into the stream.\n"];
  shard_id: string
    [@ocaml.doc
      "The shard ID of the shard where the data record was placed.\n"]}
[@@ocaml.doc "Represents the output for [PutRecord].\n"]
type nonrec put_record_input =
  {
  stream_ar_n: string option [@ocaml.doc "The ARN of the stream.\n"];
  sequence_number_for_ordering: string option
    [@ocaml.doc
      "Guarantees strictly increasing sequence numbers, for puts from the same client and to the same partition key. Usage: set the [SequenceNumberForOrdering] of record {i n} to the sequence number of record {i n-1} (as returned in the result when putting record {i n-1}). If this parameter is not set, records are coarsely ordered based on arrival time.\n"];
  explicit_hash_key: string option
    [@ocaml.doc
      "The hash value used to explicitly determine the shard the data record is assigned to by overriding the partition key hash.\n"];
  partition_key: string
    [@ocaml.doc
      "Determines which shard in the stream the data record is assigned to. Partition keys are Unicode strings with a maximum length limit of 256 characters for each key. Amazon Kinesis Data Streams uses the partition key as input to a hash function that maps the partition key and associated data to a specific shard. Specifically, an MD5 hash function is used to map partition keys to 128-bit integer values and to map associated data records to shards. As a result of this hashing mechanism, all data records with the same partition key map to the same shard within the stream.\n"];
  data: bytes
    [@ocaml.doc
      "The data blob to put into the record, which is base64-encoded when the blob is serialized. When the data blob (the payload before base64-encoding) is added to the partition key size, the total size must not exceed the maximum record size (1 MiB).\n"];
  stream_name: string option
    [@ocaml.doc "The name of the stream to put the data record into.\n"]}
[@@ocaml.doc "Represents the input for [PutRecord].\n"]
type nonrec merge_shards_input =
  {
  stream_ar_n: string option [@ocaml.doc "The ARN of the stream.\n"];
  adjacent_shard_to_merge: string
    [@ocaml.doc "The shard ID of the adjacent shard for the merge.\n"];
  shard_to_merge: string
    [@ocaml.doc
      "The shard ID of the shard to combine with the adjacent shard for the merge.\n"];
  stream_name: string option
    [@ocaml.doc "The name of the stream for the merge.\n"]}[@@ocaml.doc
                                                             "Represents the input for [MergeShards].\n"]
type nonrec list_tags_for_stream_output =
  {
  has_more_tags: bool
    [@ocaml.doc
      "If set to [true], more tags are available. To request additional tags, set [ExclusiveStartTagKey] to the key of the last tag returned.\n"];
  tags: tag list
    [@ocaml.doc
      "A list of tags associated with [StreamName], starting with the first tag after [ExclusiveStartTagKey] and up to the specified [Limit]. \n"]}
[@@ocaml.doc "Represents the output for [ListTagsForStream].\n"]
type nonrec list_tags_for_stream_input =
  {
  stream_ar_n: string option [@ocaml.doc "The ARN of the stream.\n"];
  limit: int option
    [@ocaml.doc
      "The number of tags to return. If this number is less than the total number of tags associated with the stream, [HasMoreTags] is set to [true]. To list additional tags, set [ExclusiveStartTagKey] to the last key in the response.\n"];
  exclusive_start_tag_key: string option
    [@ocaml.doc
      "The key to use as the starting point for the list of tags. If this parameter is set, [ListTagsForStream] gets all tags that occur after [ExclusiveStartTagKey]. \n"];
  stream_name: string option [@ocaml.doc "The name of the stream.\n"]}
[@@ocaml.doc "Represents the input for [ListTagsForStream].\n"]
type nonrec list_tags_for_resource_output =
  {
  tags: tag list option
    [@ocaml.doc
      "An array of tags associated with the specified Kinesis resource.\n"]}
[@@ocaml.doc ""]
type nonrec list_tags_for_resource_input =
  {
  resource_ar_n: string
    [@ocaml.doc
      "The Amazon Resource Name (ARN) of the Kinesis resource for which to list tags.\n"]}
[@@ocaml.doc ""]
type nonrec list_streams_output =
  {
  stream_summaries: stream_summary list option [@ocaml.doc "\n"];
  next_token: string option [@ocaml.doc "\n"];
  has_more_streams: bool
    [@ocaml.doc
      "If set to [true], there are more streams available to list.\n"];
  stream_names: string list
    [@ocaml.doc
      "The names of the streams that are associated with the Amazon Web Services account making the [ListStreams] request.\n"]}
[@@ocaml.doc "Represents the output for [ListStreams].\n"]
type nonrec list_streams_input =
  {
  next_token: string option [@ocaml.doc "\n"];
  exclusive_start_stream_name: string option
    [@ocaml.doc "The name of the stream to start the list with.\n"];
  limit: int option
    [@ocaml.doc
      "The maximum number of streams to list. The default value is 100. If you specify a value greater than 100, at most 100 results are returned.\n"]}
[@@ocaml.doc "Represents the input for [ListStreams].\n"]
type nonrec expired_next_token_exception =
  {
  message: string option [@ocaml.doc ""]}[@@ocaml.doc
                                           "The pagination token passed to the operation is expired.\n"]
type nonrec list_stream_consumers_output =
  {
  next_token: string option
    [@ocaml.doc
      "When the number of consumers that are registered with the data stream is greater than the default value for the [MaxResults] parameter, or if you explicitly specify a value for [MaxResults] that is less than the number of registered consumers, the response includes a pagination token named [NextToken]. You can specify this [NextToken] value in a subsequent call to [ListStreamConsumers] to list the next set of registered consumers. For more information about the use of this pagination token when calling the [ListStreamConsumers] operation, see [ListStreamConsumersInput$NextToken].\n\n  Tokens expire after 300 seconds. When you obtain a value for [NextToken] in the response to a call to [ListStreamConsumers], you have 300 seconds to use that value. If you specify an expired token in a call to [ListStreamConsumers], you get [ExpiredNextTokenException].\n  \n   "];
  consumers: consumer list option
    [@ocaml.doc
      "An array of JSON objects. Each object represents one registered consumer.\n"]}
[@@ocaml.doc ""]
type nonrec list_stream_consumers_input =
  {
  stream_creation_timestamp: CoreTypes.Timestamp.t option
    [@ocaml.doc
      "Specify this input parameter to distinguish data streams that have the same name. For example, if you create a data stream and then delete it, and you later create another data stream with the same name, you can use this input parameter to specify which of the two streams you want to list the consumers for. \n\n You can't specify this parameter if you specify the NextToken parameter. \n "];
  max_results: int option
    [@ocaml.doc
      "The maximum number of consumers that you want a single call of [ListStreamConsumers] to return. The default value is 100. If you specify a value greater than 100, at most 100 results are returned. \n"];
  next_token: string option
    [@ocaml.doc
      "When the number of consumers that are registered with the data stream is greater than the default value for the [MaxResults] parameter, or if you explicitly specify a value for [MaxResults] that is less than the number of consumers that are registered with the data stream, the response includes a pagination token named [NextToken]. You can specify this [NextToken] value in a subsequent call to [ListStreamConsumers] to list the next set of registered consumers.\n\n Don't specify [StreamName] or [StreamCreationTimestamp] if you specify [NextToken] because the latter unambiguously identifies the stream.\n \n  You can optionally specify a value for the [MaxResults] parameter when you specify [NextToken]. If you specify a [MaxResults] value that is less than the number of consumers that the operation returns if you don't specify [MaxResults], the response will contain a new [NextToken] value. You can use the new [NextToken] value in a subsequent call to the [ListStreamConsumers] operation to list the next set of consumers.\n  \n    Tokens expire after 300 seconds. When you obtain a value for [NextToken] in the response to a call to [ListStreamConsumers], you have 300 seconds to use that value. If you specify an expired token in a call to [ListStreamConsumers], you get [ExpiredNextTokenException].\n    \n     "];
  stream_ar_n: string
    [@ocaml.doc
      "The ARN of the Kinesis data stream for which you want to list the registered consumers. For more information, see {{:https://docs.aws.amazon.com/general/latest/gr/aws-arns-and-namespaces.html#arn-syntax-kinesis-streams}Amazon Resource Names (ARNs) and Amazon Web Services Service Namespaces}.\n"]}
[@@ocaml.doc ""]
type nonrec list_shards_output =
  {
  next_token: string option
    [@ocaml.doc
      "When the number of shards in the data stream is greater than the default value for the [MaxResults] parameter, or if you explicitly specify a value for [MaxResults] that is less than the number of shards in the data stream, the response includes a pagination token named [NextToken]. You can specify this [NextToken] value in a subsequent call to [ListShards] to list the next set of shards. For more information about the use of this pagination token when calling the [ListShards] operation, see [ListShardsInput$NextToken].\n\n  Tokens expire after 300 seconds. When you obtain a value for [NextToken] in the response to a call to [ListShards], you have 300 seconds to use that value. If you specify an expired token in a call to [ListShards], you get [ExpiredNextTokenException].\n  \n   "];
  shards: shard list option
    [@ocaml.doc
      "An array of JSON objects. Each object represents one shard and specifies the IDs of the shard, the shard's parent, and the shard that's adjacent to the shard's parent. Each object also contains the starting and ending hash keys and the starting and ending sequence numbers for the shard.\n"]}
[@@ocaml.doc ""]
type nonrec list_shards_input =
  {
  stream_ar_n: string option [@ocaml.doc "The ARN of the stream.\n"];
  shard_filter: shard_filter option
    [@ocaml.doc
      "Enables you to filter out the response of the [ListShards] API. You can only specify one filter at a time. \n\n If you use the [ShardFilter] parameter when invoking the ListShards API, the [Type] is the required property and must be specified. If you specify the [AT_TRIM_HORIZON], [FROM_TRIM_HORIZON], or [AT_LATEST] types, you do not need to specify either the [ShardId] or the [Timestamp] optional properties. \n \n  If you specify the [AFTER_SHARD_ID] type, you must also provide the value for the optional [ShardId] property. The [ShardId] property is identical in fuctionality to the [ExclusiveStartShardId] parameter of the [ListShards] API. When [ShardId] property is specified, the response includes the shards starting with the shard whose ID immediately follows the [ShardId] that you provided. \n  \n   If you specify the [AT_TIMESTAMP] or [FROM_TIMESTAMP_ID] type, you must also provide the value for the optional [Timestamp] property. If you specify the AT_TIMESTAMP type, then all shards that were open at the provided timestamp are returned. If you specify the FROM_TIMESTAMP type, then all shards starting from the provided timestamp to TIP are returned. \n   "];
  stream_creation_timestamp: CoreTypes.Timestamp.t option
    [@ocaml.doc
      "Specify this input parameter to distinguish data streams that have the same name. For example, if you create a data stream and then delete it, and you later create another data stream with the same name, you can use this input parameter to specify which of the two streams you want to list the shards for.\n\n You cannot specify this parameter if you specify the [NextToken] parameter.\n "];
  max_results: int option
    [@ocaml.doc
      "The maximum number of shards to return in a single call to [ListShards]. The maximum number of shards to return in a single call. The default value is 1000. If you specify a value greater than 1000, at most 1000 results are returned. \n\n When the number of shards to be listed is greater than the value of [MaxResults], the response contains a [NextToken] value that you can use in a subsequent call to [ListShards] to list the next set of shards.\n "];
  exclusive_start_shard_id: string option
    [@ocaml.doc
      "Specify this parameter to indicate that you want to list the shards starting with the shard whose ID immediately follows [ExclusiveStartShardId].\n\n If you don't specify this parameter, the default behavior is for [ListShards] to list the shards starting with the first one in the stream.\n \n  You cannot specify this parameter if you specify [NextToken].\n  "];
  next_token: string option
    [@ocaml.doc
      "When the number of shards in the data stream is greater than the default value for the [MaxResults] parameter, or if you explicitly specify a value for [MaxResults] that is less than the number of shards in the data stream, the response includes a pagination token named [NextToken]. You can specify this [NextToken] value in a subsequent call to [ListShards] to list the next set of shards.\n\n Don't specify [StreamName] or [StreamCreationTimestamp] if you specify [NextToken] because the latter unambiguously identifies the stream.\n \n  You can optionally specify a value for the [MaxResults] parameter when you specify [NextToken]. If you specify a [MaxResults] value that is less than the number of shards that the operation returns if you don't specify [MaxResults], the response will contain a new [NextToken] value. You can use the new [NextToken] value in a subsequent call to the [ListShards] operation.\n  \n    Tokens expire after 300 seconds. When you obtain a value for [NextToken] in the response to a call to [ListShards], you have 300 seconds to use that value. If you specify an expired token in a call to [ListShards], you get [ExpiredNextTokenException].\n    \n     "];
  stream_name: string option
    [@ocaml.doc
      "The name of the data stream whose shards you want to list. \n\n You cannot specify this parameter if you specify the [NextToken] parameter.\n "]}
[@@ocaml.doc ""]
type nonrec increase_stream_retention_period_input =
  {
  stream_ar_n: string option [@ocaml.doc "The ARN of the stream.\n"];
  retention_period_hours: int
    [@ocaml.doc
      "The new retention period of the stream, in hours. Must be more than the current retention period.\n"];
  stream_name: string option
    [@ocaml.doc "The name of the stream to modify.\n"]}[@@ocaml.doc
                                                         "Represents the input for [IncreaseStreamRetentionPeriod].\n"]
type nonrec get_shard_iterator_output =
  {
  shard_iterator: string option
    [@ocaml.doc
      "The position in the shard from which to start reading data records sequentially. A shard iterator specifies this position using the sequence number of a data record in a shard.\n"]}
[@@ocaml.doc "Represents the output for [GetShardIterator].\n"]
type nonrec get_shard_iterator_input =
  {
  stream_ar_n: string option [@ocaml.doc "The ARN of the stream.\n"];
  timestamp_: CoreTypes.Timestamp.t option
    [@ocaml.doc
      "The time stamp of the data record from which to start reading. Used with shard iterator type AT_TIMESTAMP. A time stamp is the Unix epoch date with precision in milliseconds. For example, [2016-04-04T19:58:46.480-00:00] or [1459799926.480]. If a record with this exact time stamp does not exist, the iterator returned is for the next (later) record. If the time stamp is older than the current trim horizon, the iterator returned is for the oldest untrimmed data record (TRIM_HORIZON).\n"];
  starting_sequence_number: string option
    [@ocaml.doc
      "The sequence number of the data record in the shard from which to start reading. Used with shard iterator type AT_SEQUENCE_NUMBER and AFTER_SEQUENCE_NUMBER.\n"];
  shard_iterator_type: shard_iterator_type
    [@ocaml.doc
      "Determines how the shard iterator is used to start reading data records from the shard.\n\n The following are the valid Amazon Kinesis shard iterator types:\n \n  {ul\n        {-  AT_SEQUENCE_NUMBER - Start reading from the position denoted by a specific sequence number, provided in the value [StartingSequenceNumber].\n            \n             }\n        {-  AFTER_SEQUENCE_NUMBER - Start reading right after the position denoted by a specific sequence number, provided in the value [StartingSequenceNumber].\n            \n             }\n        {-  AT_TIMESTAMP - Start reading from the position denoted by a specific time stamp, provided in the value [Timestamp].\n            \n             }\n        {-  TRIM_HORIZON - Start reading at the last untrimmed record in the shard in the system, which is the oldest data record in the shard.\n            \n             }\n        {-  LATEST - Start reading just after the most recent record in the shard, so that you always read the most recent data in the shard.\n            \n             }\n        }\n  "];
  shard_id: string
    [@ocaml.doc
      "The shard ID of the Kinesis Data Streams shard to get the iterator for.\n"];
  stream_name: string option
    [@ocaml.doc "The name of the Amazon Kinesis data stream.\n"]}[@@ocaml.doc
                                                                   "Represents the input for [GetShardIterator].\n"]
type nonrec get_resource_policy_output =
  {
  policy: string
    [@ocaml.doc
      "Details of the resource policy. This is formatted as a JSON string.\n"]}
[@@ocaml.doc ""]
type nonrec get_resource_policy_input =
  {
  resource_ar_n: string
    [@ocaml.doc
      "The Amazon Resource Name (ARN) of the data stream or consumer.\n"]}
[@@ocaml.doc ""]
type nonrec expired_iterator_exception =
  {
  message: string option
    [@ocaml.doc "A message that provides information about the error.\n"]}
[@@ocaml.doc "The provided iterator exceeds the maximum age allowed.\n"]
type nonrec get_records_output =
  {
  child_shards: child_shard list option
    [@ocaml.doc
      "The list of the current shard's child shards, returned in the [GetRecords] API's response only when the end of the current shard is reached.\n"];
  millis_behind_latest: int option
    [@ocaml.doc
      "The number of milliseconds the [GetRecords] response is from the tip of the stream, indicating how far behind current time the consumer is. A value of zero indicates that record processing is caught up, and there are no new records to process at this moment.\n"];
  next_shard_iterator: string option
    [@ocaml.doc
      "The next position in the shard from which to start sequentially reading data records. If set to [null], the shard has been closed and the requested iterator does not return any more data. \n"];
  records: record list
    [@ocaml.doc "The data records retrieved from the shard.\n"]}[@@ocaml.doc
                                                                  "Represents the output for [GetRecords].\n"]
type nonrec get_records_input =
  {
  stream_ar_n: string option [@ocaml.doc "The ARN of the stream.\n"];
  limit: int option
    [@ocaml.doc
      "The maximum number of records to return. Specify a value of up to 10,000. If you specify a value that is greater than 10,000, [GetRecords] throws [InvalidArgumentException]. The default value is 10,000.\n"];
  shard_iterator: string
    [@ocaml.doc
      "The position in the shard from which you want to start sequentially reading data records. A shard iterator specifies this position using the sequence number of a data record in the shard.\n"]}
[@@ocaml.doc "Represents the input for [GetRecords].\n"]
type nonrec enhanced_monitoring_output =
  {
  stream_ar_n: string option [@ocaml.doc "The ARN of the stream.\n"];
  desired_shard_level_metrics: metrics_name list option
    [@ocaml.doc
      "Represents the list of all the metrics that would be in the enhanced state after the operation.\n"];
  current_shard_level_metrics: metrics_name list option
    [@ocaml.doc
      "Represents the current state of the metrics that are in the enhanced state before the operation.\n"];
  stream_name: string option
    [@ocaml.doc "The name of the Kinesis data stream.\n"]}[@@ocaml.doc
                                                            "Represents the output for [EnableEnhancedMonitoring] and [DisableEnhancedMonitoring].\n"]
type nonrec enable_enhanced_monitoring_input =
  {
  stream_ar_n: string option [@ocaml.doc "The ARN of the stream.\n"];
  shard_level_metrics: metrics_name list
    [@ocaml.doc
      "List of shard-level metrics to enable.\n\n The following are the valid shard-level metrics. The value \"[ALL]\" enables every metric.\n \n  {ul\n        {-   [IncomingBytes] \n            \n             }\n        {-   [IncomingRecords] \n            \n             }\n        {-   [OutgoingBytes] \n            \n             }\n        {-   [OutgoingRecords] \n            \n             }\n        {-   [WriteProvisionedThroughputExceeded] \n            \n             }\n        {-   [ReadProvisionedThroughputExceeded] \n            \n             }\n        {-   [IteratorAgeMilliseconds] \n            \n             }\n        {-   [ALL] \n            \n             }\n        }\n   For more information, see {{:https://docs.aws.amazon.com/kinesis/latest/dev/monitoring-with-cloudwatch.html}Monitoring the Amazon Kinesis Data Streams Service with Amazon CloudWatch} in the {i Amazon Kinesis Data Streams Developer Guide}.\n   "];
  stream_name: string option
    [@ocaml.doc
      "The name of the stream for which to enable enhanced monitoring.\n"]}
[@@ocaml.doc "Represents the input for [EnableEnhancedMonitoring].\n"]
type nonrec disable_enhanced_monitoring_input =
  {
  stream_ar_n: string option [@ocaml.doc "The ARN of the stream.\n"];
  shard_level_metrics: metrics_name list
    [@ocaml.doc
      "List of shard-level metrics to disable.\n\n The following are the valid shard-level metrics. The value \"[ALL]\" disables every metric.\n \n  {ul\n        {-   [IncomingBytes] \n            \n             }\n        {-   [IncomingRecords] \n            \n             }\n        {-   [OutgoingBytes] \n            \n             }\n        {-   [OutgoingRecords] \n            \n             }\n        {-   [WriteProvisionedThroughputExceeded] \n            \n             }\n        {-   [ReadProvisionedThroughputExceeded] \n            \n             }\n        {-   [IteratorAgeMilliseconds] \n            \n             }\n        {-   [ALL] \n            \n             }\n        }\n   For more information, see {{:https://docs.aws.amazon.com/kinesis/latest/dev/monitoring-with-cloudwatch.html}Monitoring the Amazon Kinesis Data Streams Service with Amazon CloudWatch} in the {i Amazon Kinesis Data Streams Developer Guide}.\n   "];
  stream_name: string option
    [@ocaml.doc
      "The name of the Kinesis data stream for which to disable enhanced monitoring.\n"]}
[@@ocaml.doc "Represents the input for [DisableEnhancedMonitoring].\n"]
type nonrec describe_stream_summary_output =
  {
  stream_description_summary: stream_description_summary
    [@ocaml.doc
      "A [StreamDescriptionSummary] containing information about the stream.\n"]}
[@@ocaml.doc ""]
type nonrec describe_stream_summary_input =
  {
  stream_ar_n: string option [@ocaml.doc "The ARN of the stream.\n"];
  stream_name: string option
    [@ocaml.doc "The name of the stream to describe.\n"]}[@@ocaml.doc ""]
type nonrec consumer_description =
  {
  stream_ar_n: string
    [@ocaml.doc
      "The ARN of the stream with which you registered the consumer.\n"];
  consumer_creation_timestamp: CoreTypes.Timestamp.t [@ocaml.doc "\n"];
  consumer_status: consumer_status
    [@ocaml.doc
      "A consumer can't read data while in the [CREATING] or [DELETING] states.\n"];
  consumer_ar_n: string
    [@ocaml.doc
      "When you register a consumer, Kinesis Data Streams generates an ARN for it. You need this ARN to be able to call [SubscribeToShard].\n\n If you delete a consumer and then create a new one with the same name, it won't have the same ARN. That's because consumer ARNs contain the creation timestamp. This is important to keep in mind if you have IAM policies that reference consumer ARNs.\n "];
  consumer_name: string
    [@ocaml.doc
      "The name of the consumer is something you choose when you register the consumer.\n"]}
[@@ocaml.doc
  "An object that represents the details of a registered consumer. This type of object is returned by [DescribeStreamConsumer].\n"]
type nonrec describe_stream_consumer_output =
  {
  consumer_description: consumer_description
    [@ocaml.doc "An object that represents the details of the consumer.\n"]}
[@@ocaml.doc ""]
type nonrec describe_stream_consumer_input =
  {
  consumer_ar_n: string option
    [@ocaml.doc
      "The ARN returned by Kinesis Data Streams when you registered the consumer.\n"];
  consumer_name: string option
    [@ocaml.doc "The name that you gave to the consumer.\n"];
  stream_ar_n: string option
    [@ocaml.doc
      "The ARN of the Kinesis data stream that the consumer is registered with. For more information, see {{:https://docs.aws.amazon.com/general/latest/gr/aws-arns-and-namespaces.html#arn-syntax-kinesis-streams}Amazon Resource Names (ARNs) and Amazon Web Services Service Namespaces}.\n"]}
[@@ocaml.doc ""]
type nonrec describe_stream_output =
  {
  stream_description: stream_description
    [@ocaml.doc
      "The current status of the stream, the stream Amazon Resource Name (ARN), an array of shard objects that comprise the stream, and whether there are more shards available.\n"]}
[@@ocaml.doc "Represents the output for [DescribeStream].\n"]
type nonrec describe_stream_input =
  {
  stream_ar_n: string option [@ocaml.doc "The ARN of the stream.\n"];
  exclusive_start_shard_id: string option
    [@ocaml.doc
      "The shard ID of the shard to start with.\n\n Specify this parameter to indicate that you want to describe the stream starting with the shard whose ID immediately follows [ExclusiveStartShardId].\n \n  If you don't specify this parameter, the default behavior for [DescribeStream] is to describe the stream starting with the first shard in the stream.\n  "];
  limit: int option
    [@ocaml.doc
      "The maximum number of shards to return in a single call. The default value is 100. If you specify a value greater than 100, at most 100 results are returned.\n"];
  stream_name: string option
    [@ocaml.doc "The name of the stream to describe.\n"]}[@@ocaml.doc
                                                           "Represents the input for [DescribeStream].\n"]
type nonrec describe_limits_output =
  {
  on_demand_stream_count_limit: int
    [@ocaml.doc
      " The maximum number of data streams with the on-demand capacity mode. \n"];
  on_demand_stream_count: int
    [@ocaml.doc
      " Indicates the number of data streams with the on-demand capacity mode.\n"];
  open_shard_count: int [@ocaml.doc "The number of open shards.\n"];
  shard_limit: int [@ocaml.doc "The maximum number of shards.\n"]}[@@ocaml.doc
                                                                    ""]
type nonrec deregister_stream_consumer_input =
  {
  consumer_ar_n: string option
    [@ocaml.doc
      "The ARN returned by Kinesis Data Streams when you registered the consumer. If you don't know the ARN of the consumer that you want to deregister, you can use the ListStreamConsumers operation to get a list of the descriptions of all the consumers that are currently registered with a given data stream. The description of a consumer contains its ARN.\n"];
  consumer_name: string option
    [@ocaml.doc "The name that you gave to the consumer.\n"];
  stream_ar_n: string option
    [@ocaml.doc
      "The ARN of the Kinesis data stream that the consumer is registered with. For more information, see {{:https://docs.aws.amazon.com/general/latest/gr/aws-arns-and-namespaces.html#arn-syntax-kinesis-streams}Amazon Resource Names (ARNs) and Amazon Web Services Service Namespaces}.\n"]}
[@@ocaml.doc ""]
type nonrec delete_stream_input =
  {
  stream_ar_n: string option [@ocaml.doc "The ARN of the stream.\n"];
  enforce_consumer_deletion: bool option
    [@ocaml.doc
      "If this parameter is unset ([null]) or if you set it to [false], and the stream has registered consumers, the call to [DeleteStream] fails with a [ResourceInUseException]. \n"];
  stream_name: string option
    [@ocaml.doc "The name of the stream to delete.\n"]}[@@ocaml.doc
                                                         "Represents the input for [DeleteStream].\n"]
type nonrec delete_resource_policy_input =
  {
  resource_ar_n: string
    [@ocaml.doc
      "The Amazon Resource Name (ARN) of the data stream or consumer.\n"]}
[@@ocaml.doc ""]
type nonrec decrease_stream_retention_period_input =
  {
  stream_ar_n: string option [@ocaml.doc "The ARN of the stream.\n"];
  retention_period_hours: int
    [@ocaml.doc
      "The new retention period of the stream, in hours. Must be less than the current retention period.\n"];
  stream_name: string option
    [@ocaml.doc "The name of the stream to modify.\n"]}[@@ocaml.doc
                                                         "Represents the input for [DecreaseStreamRetentionPeriod].\n"]
type nonrec create_stream_input =
  {
  tags: tag_map option
    [@ocaml.doc
      "A set of up to 50 key-value pairs to use to create the tags. A tag consists of a required key and an optional value.\n"];
  stream_mode_details: stream_mode_details option
    [@ocaml.doc
      " Indicates the capacity mode of the data stream. Currently, in Kinesis Data Streams, you can choose between an {b on-demand} capacity mode and a {b provisioned} capacity mode for your data streams.\n"];
  shard_count: int option
    [@ocaml.doc
      "The number of shards that the stream will use. The throughput of the stream is a function of the number of shards; more shards are required for greater provisioned throughput.\n"];
  stream_name: string
    [@ocaml.doc
      "A name to identify the stream. The stream name is scoped to the Amazon Web Services account used by the application that creates the stream. It is also scoped by Amazon Web Services Region. That is, two streams in two different Amazon Web Services accounts can have the same name. Two streams in the same Amazon Web Services account but in two different Regions can also have the same name.\n"]}
[@@ocaml.doc "Represents the input for [CreateStream].\n"]
type nonrec add_tags_to_stream_input =
  {
  stream_ar_n: string option [@ocaml.doc "The ARN of the stream.\n"];
  tags: tag_map
    [@ocaml.doc
      "A set of up to 50 key-value pairs to use to create the tags. A tag consists of a required key and an optional value. You can add up to 50 tags per resource.\n"];
  stream_name: string option [@ocaml.doc "The name of the stream.\n"]}
[@@ocaml.doc "Represents the input for [AddTagsToStream].\n"](** {1:builders Builders} *)

val make_stream_mode_details :
  stream_mode:stream_mode -> unit -> stream_mode_details
val make_update_stream_mode_input :
  stream_mode_details:stream_mode_details ->
    stream_ar_n:string -> unit -> update_stream_mode_input
val make_update_shard_count_output :
  ?stream_ar_n:string ->
    ?target_shard_count:int ->
      ?current_shard_count:int ->
        ?stream_name:string -> unit -> update_shard_count_output
val make_update_shard_count_input :
  ?stream_ar_n:string ->
    ?stream_name:string ->
      scaling_type:scaling_type ->
        target_shard_count:int -> unit -> update_shard_count_input
val make_untag_resource_input :
  resource_ar_n:string ->
    tag_keys:string list -> unit -> untag_resource_input
val make_tag_resource_input :
  resource_ar_n:string -> tags:tag_map -> unit -> tag_resource_input
val make_tag : ?value:string -> key:string -> unit -> tag
val make_record :
  ?encryption_type:encryption_type ->
    ?approximate_arrival_timestamp:CoreTypes.Timestamp.t ->
      partition_key:string ->
        data:bytes -> sequence_number:string -> unit -> record
val make_hash_key_range :
  ending_hash_key:string ->
    starting_hash_key:string -> unit -> hash_key_range
val make_child_shard :
  hash_key_range:hash_key_range ->
    parent_shards:string list -> shard_id:string -> unit -> child_shard
val make_subscribe_to_shard_event :
  ?child_shards:child_shard list ->
    millis_behind_latest:int ->
      continuation_sequence_number:string ->
        records:record list -> unit -> subscribe_to_shard_event
val make_subscribe_to_shard_output :
  event_stream:subscribe_to_shard_event_stream ->
    unit -> subscribe_to_shard_output
val make_starting_position :
  ?timestamp_:CoreTypes.Timestamp.t ->
    ?sequence_number:string ->
      type_:shard_iterator_type -> unit -> starting_position
val make_subscribe_to_shard_input :
  starting_position:starting_position ->
    shard_id:string ->
      consumer_ar_n:string -> unit -> subscribe_to_shard_input
val make_stream_summary :
  ?stream_creation_timestamp:CoreTypes.Timestamp.t ->
    ?stream_mode_details:stream_mode_details ->
      stream_status:stream_status ->
        stream_ar_n:string -> stream_name:string -> unit -> stream_summary
val make_enhanced_metrics :
  ?shard_level_metrics:metrics_name list -> unit -> enhanced_metrics
val make_stream_description_summary :
  ?consumer_count:int ->
    ?key_id:string ->
      ?encryption_type:encryption_type ->
        ?stream_mode_details:stream_mode_details ->
          open_shard_count:int ->
            enhanced_monitoring:enhanced_metrics list ->
              stream_creation_timestamp:CoreTypes.Timestamp.t ->
                retention_period_hours:int ->
                  stream_status:stream_status ->
                    stream_ar_n:string ->
                      stream_name:string ->
                        unit -> stream_description_summary
val make_sequence_number_range :
  ?ending_sequence_number:string ->
    starting_sequence_number:string -> unit -> sequence_number_range
val make_shard :
  ?adjacent_parent_shard_id:string ->
    ?parent_shard_id:string ->
      sequence_number_range:sequence_number_range ->
        hash_key_range:hash_key_range -> shard_id:string -> unit -> shard
val make_stream_description :
  ?key_id:string ->
    ?encryption_type:encryption_type ->
      ?stream_mode_details:stream_mode_details ->
        enhanced_monitoring:enhanced_metrics list ->
          stream_creation_timestamp:CoreTypes.Timestamp.t ->
            retention_period_hours:int ->
              has_more_shards:bool ->
                shards:shard list ->
                  stream_status:stream_status ->
                    stream_ar_n:string ->
                      stream_name:string -> unit -> stream_description
val make_stop_stream_encryption_input :
  ?stream_ar_n:string ->
    ?stream_name:string ->
      key_id:string ->
        encryption_type:encryption_type ->
          unit -> stop_stream_encryption_input
val make_start_stream_encryption_input :
  ?stream_ar_n:string ->
    ?stream_name:string ->
      key_id:string ->
        encryption_type:encryption_type ->
          unit -> start_stream_encryption_input
val make_split_shard_input :
  ?stream_ar_n:string ->
    ?stream_name:string ->
      new_starting_hash_key:string ->
        shard_to_split:string -> unit -> split_shard_input
val make_shard_filter :
  ?timestamp_:CoreTypes.Timestamp.t ->
    ?shard_id:string -> type_:shard_filter_type -> unit -> shard_filter
val make_remove_tags_from_stream_input :
  ?stream_ar_n:string ->
    ?stream_name:string ->
      tag_keys:string list -> unit -> remove_tags_from_stream_input
val make_consumer :
  consumer_creation_timestamp:CoreTypes.Timestamp.t ->
    consumer_status:consumer_status ->
      consumer_ar_n:string -> consumer_name:string -> unit -> consumer
val make_register_stream_consumer_output :
  consumer:consumer -> unit -> register_stream_consumer_output
val make_register_stream_consumer_input :
  ?tags:tag_map ->
    consumer_name:string ->
      stream_ar_n:string -> unit -> register_stream_consumer_input
val make_put_resource_policy_input :
  policy:string -> resource_ar_n:string -> unit -> put_resource_policy_input
val make_put_records_result_entry :
  ?error_message:string ->
    ?error_code:string ->
      ?shard_id:string ->
        ?sequence_number:string -> unit -> put_records_result_entry
val make_put_records_request_entry :
  ?explicit_hash_key:string ->
    partition_key:string -> data:bytes -> unit -> put_records_request_entry
val make_put_records_output :
  ?encryption_type:encryption_type ->
    ?failed_record_count:int ->
      records:put_records_result_entry list -> unit -> put_records_output
val make_put_records_input :
  ?stream_ar_n:string ->
    ?stream_name:string ->
      records:put_records_request_entry list -> unit -> put_records_input
val make_put_record_output :
  ?encryption_type:encryption_type ->
    sequence_number:string -> shard_id:string -> unit -> put_record_output
val make_put_record_input :
  ?stream_ar_n:string ->
    ?sequence_number_for_ordering:string ->
      ?explicit_hash_key:string ->
        ?stream_name:string ->
          partition_key:string -> data:bytes -> unit -> put_record_input
val make_merge_shards_input :
  ?stream_ar_n:string ->
    ?stream_name:string ->
      adjacent_shard_to_merge:string ->
        shard_to_merge:string -> unit -> merge_shards_input
val make_list_tags_for_stream_output :
  has_more_tags:bool -> tags:tag list -> unit -> list_tags_for_stream_output
val make_list_tags_for_stream_input :
  ?stream_ar_n:string ->
    ?limit:int ->
      ?exclusive_start_tag_key:string ->
        ?stream_name:string -> unit -> list_tags_for_stream_input
val make_list_tags_for_resource_output :
  ?tags:tag list -> unit -> list_tags_for_resource_output
val make_list_tags_for_resource_input :
  resource_ar_n:string -> unit -> list_tags_for_resource_input
val make_list_streams_output :
  ?stream_summaries:stream_summary list ->
    ?next_token:string ->
      has_more_streams:bool ->
        stream_names:string list -> unit -> list_streams_output
val make_list_streams_input :
  ?next_token:string ->
    ?exclusive_start_stream_name:string ->
      ?limit:int -> unit -> list_streams_input
val make_list_stream_consumers_output :
  ?next_token:string ->
    ?consumers:consumer list -> unit -> list_stream_consumers_output
val make_list_stream_consumers_input :
  ?stream_creation_timestamp:CoreTypes.Timestamp.t ->
    ?max_results:int ->
      ?next_token:string ->
        stream_ar_n:string -> unit -> list_stream_consumers_input
val make_list_shards_output :
  ?next_token:string -> ?shards:shard list -> unit -> list_shards_output
val make_list_shards_input :
  ?stream_ar_n:string ->
    ?shard_filter:shard_filter ->
      ?stream_creation_timestamp:CoreTypes.Timestamp.t ->
        ?max_results:int ->
          ?exclusive_start_shard_id:string ->
            ?next_token:string ->
              ?stream_name:string -> unit -> list_shards_input
val make_increase_stream_retention_period_input :
  ?stream_ar_n:string ->
    ?stream_name:string ->
      retention_period_hours:int ->
        unit -> increase_stream_retention_period_input
val make_get_shard_iterator_output :
  ?shard_iterator:string -> unit -> get_shard_iterator_output
val make_get_shard_iterator_input :
  ?stream_ar_n:string ->
    ?timestamp_:CoreTypes.Timestamp.t ->
      ?starting_sequence_number:string ->
        ?stream_name:string ->
          shard_iterator_type:shard_iterator_type ->
            shard_id:string -> unit -> get_shard_iterator_input
val make_get_resource_policy_output :
  policy:string -> unit -> get_resource_policy_output
val make_get_resource_policy_input :
  resource_ar_n:string -> unit -> get_resource_policy_input
val make_get_records_output :
  ?child_shards:child_shard list ->
    ?millis_behind_latest:int ->
      ?next_shard_iterator:string ->
        records:record list -> unit -> get_records_output
val make_get_records_input :
  ?stream_ar_n:string ->
    ?limit:int -> shard_iterator:string -> unit -> get_records_input
val make_enhanced_monitoring_output :
  ?stream_ar_n:string ->
    ?desired_shard_level_metrics:metrics_name list ->
      ?current_shard_level_metrics:metrics_name list ->
        ?stream_name:string -> unit -> enhanced_monitoring_output
val make_enable_enhanced_monitoring_input :
  ?stream_ar_n:string ->
    ?stream_name:string ->
      shard_level_metrics:metrics_name list ->
        unit -> enable_enhanced_monitoring_input
val make_disable_enhanced_monitoring_input :
  ?stream_ar_n:string ->
    ?stream_name:string ->
      shard_level_metrics:metrics_name list ->
        unit -> disable_enhanced_monitoring_input
val make_describe_stream_summary_output :
  stream_description_summary:stream_description_summary ->
    unit -> describe_stream_summary_output
val make_describe_stream_summary_input :
  ?stream_ar_n:string ->
    ?stream_name:string -> unit -> describe_stream_summary_input
val make_consumer_description :
  stream_ar_n:string ->
    consumer_creation_timestamp:CoreTypes.Timestamp.t ->
      consumer_status:consumer_status ->
        consumer_ar_n:string ->
          consumer_name:string -> unit -> consumer_description
val make_describe_stream_consumer_output :
  consumer_description:consumer_description ->
    unit -> describe_stream_consumer_output
val make_describe_stream_consumer_input :
  ?consumer_ar_n:string ->
    ?consumer_name:string ->
      ?stream_ar_n:string -> unit -> describe_stream_consumer_input
val make_describe_stream_output :
  stream_description:stream_description -> unit -> describe_stream_output
val make_describe_stream_input :
  ?stream_ar_n:string ->
    ?exclusive_start_shard_id:string ->
      ?limit:int -> ?stream_name:string -> unit -> describe_stream_input
val make_describe_limits_output :
  on_demand_stream_count_limit:int ->
    on_demand_stream_count:int ->
      open_shard_count:int ->
        shard_limit:int -> unit -> describe_limits_output
val make_describe_limits_input : unit -> unit
val make_deregister_stream_consumer_input :
  ?consumer_ar_n:string ->
    ?consumer_name:string ->
      ?stream_ar_n:string -> unit -> deregister_stream_consumer_input
val make_delete_stream_input :
  ?stream_ar_n:string ->
    ?enforce_consumer_deletion:bool ->
      ?stream_name:string -> unit -> delete_stream_input
val make_delete_resource_policy_input :
  resource_ar_n:string -> unit -> delete_resource_policy_input
val make_decrease_stream_retention_period_input :
  ?stream_ar_n:string ->
    ?stream_name:string ->
      retention_period_hours:int ->
        unit -> decrease_stream_retention_period_input
val make_create_stream_input :
  ?tags:tag_map ->
    ?stream_mode_details:stream_mode_details ->
      ?shard_count:int -> stream_name:string -> unit -> create_stream_input
val make_add_tags_to_stream_input :
  ?stream_ar_n:string ->
    ?stream_name:string -> tags:tag_map -> unit -> add_tags_to_stream_input(** {1:operations Operations} *)

module AddTagsToStream :
sig
  val request :
    Smaws_Lib.Context.t ->
      add_tags_to_stream_input ->
        (unit,
          [> Smaws_Lib.Protocols.AwsJson.error
          | `AccessDeniedException of access_denied_exception 
          | `InvalidArgumentException of invalid_argument_exception 
          | `LimitExceededException of limit_exceeded_exception 
          | `ResourceInUseException of resource_in_use_exception 
          | `ResourceNotFoundException of resource_not_found_exception ])
          result
end[@@ocaml.doc
     "Adds or updates tags for the specified Kinesis data stream. You can assign up to 50 tags to a data stream.\n\n  When invoking this API, you must use either the [StreamARN] or the [StreamName] parameter, or both. It is recommended that you use the [StreamARN] input parameter when you invoke this API.\n  \n    If tags have already been assigned to the stream, [AddTagsToStream] overwrites any existing tags that correspond to the specified tag keys.\n    \n      [AddTagsToStream] has a limit of five transactions per second per account.\n     "]
module CreateStream :
sig
  val request :
    Smaws_Lib.Context.t ->
      create_stream_input ->
        (unit,
          [> Smaws_Lib.Protocols.AwsJson.error
          | `InvalidArgumentException of invalid_argument_exception 
          | `LimitExceededException of limit_exceeded_exception 
          | `ResourceInUseException of resource_in_use_exception ]) result
end[@@ocaml.doc
     "Creates a Kinesis data stream. A stream captures and transports data records that are continuously emitted from different data sources or {i producers}. Scale-out within a stream is explicitly supported by means of shards, which are uniquely identified groups of data records in a stream.\n\n You can create your data stream using either on-demand or provisioned capacity mode. Data streams with an on-demand mode require no capacity planning and automatically scale to handle gigabytes of write and read throughput per minute. With the on-demand mode, Kinesis Data Streams automatically manages the shards in order to provide the necessary throughput. For the data streams with a provisioned mode, you must specify the number of shards for the data stream. Each shard can support reads up to five transactions per second, up to a maximum data read total of 2 MiB per second. Each shard can support writes up to 1,000 records per second, up to a maximum data write total of 1 MiB per second. If the amount of data input increases or decreases, you can add or remove shards.\n \n  The stream name identifies the stream. The name is scoped to the Amazon Web Services account used by the application. It is also scoped by Amazon Web Services Region. That is, two streams in two different accounts can have the same name, and two streams in the same account, but in two different Regions, can have the same name.\n  \n    [CreateStream] is an asynchronous operation. Upon receiving a [CreateStream] request, Kinesis Data Streams immediately returns and sets the stream status to [CREATING]. After the stream is created, Kinesis Data Streams sets the stream status to [ACTIVE]. You should perform read and write operations only on an [ACTIVE] stream. \n   \n    You receive a [LimitExceededException] when making a [CreateStream] request when you try to do one of the following:\n    \n     {ul\n           {-  Have more than five streams in the [CREATING] state at any point in time.\n               \n                }\n           {-  Create more shards than are authorized for your account.\n               \n                }\n           }\n   For the default shard limit for an Amazon Web Services account, see {{:https://docs.aws.amazon.com/kinesis/latest/dev/service-sizes-and-limits.html}Amazon Kinesis Data Streams Limits} in the {i Amazon Kinesis Data Streams Developer Guide}. To increase this limit, {{:https://docs.aws.amazon.com/general/latest/gr/aws_service_limits.html}contact Amazon Web Services Support}.\n   \n    You can use [DescribeStreamSummary] to check the stream status, which is returned in [StreamStatus].\n    \n      [CreateStream] has a limit of five transactions per second per account.\n     \n      You can add tags to the stream when making a [CreateStream] request by setting the [Tags] parameter. If you pass the [Tags] parameter, in addition to having the [kinesis:CreateStream] permission, you must also have the [kinesis:AddTagsToStream] permission for the stream that will be created. The [kinesis:TagResource] permission won\226\128\153t work to tag streams on creation. Tags will take effect from the [CREATING] status of the stream, but you can't make any updates to the tags until the stream is in [ACTIVE] state.\n      "]
module DecreaseStreamRetentionPeriod :
sig
  val request :
    Smaws_Lib.Context.t ->
      decrease_stream_retention_period_input ->
        (unit,
          [> Smaws_Lib.Protocols.AwsJson.error
          | `AccessDeniedException of access_denied_exception 
          | `InvalidArgumentException of invalid_argument_exception 
          | `LimitExceededException of limit_exceeded_exception 
          | `ResourceInUseException of resource_in_use_exception 
          | `ResourceNotFoundException of resource_not_found_exception ])
          result
end[@@ocaml.doc
     "Decreases the Kinesis data stream's retention period, which is the length of time data records are accessible after they are added to the stream. The minimum value of a stream's retention period is 24 hours.\n\n  When invoking this API, you must use either the [StreamARN] or the [StreamName] parameter, or both. It is recommended that you use the [StreamARN] input parameter when you invoke this API.\n  \n    This operation may result in lost data. For example, if the stream's retention period is 48 hours and is decreased to 24 hours, any data already in the stream that is older than 24 hours is inaccessible.\n    "]
module DeleteResourcePolicy :
sig
  val request :
    Smaws_Lib.Context.t ->
      delete_resource_policy_input ->
        (unit,
          [> Smaws_Lib.Protocols.AwsJson.error
          | `AccessDeniedException of access_denied_exception 
          | `InvalidArgumentException of invalid_argument_exception 
          | `LimitExceededException of limit_exceeded_exception 
          | `ResourceInUseException of resource_in_use_exception 
          | `ResourceNotFoundException of resource_not_found_exception ])
          result
end[@@ocaml.doc
     "Delete a policy for the specified data stream or consumer. Request patterns can be one of the following:\n\n {ul\n       {-  Data stream pattern: [arn:aws.*:kinesis:.*:\\d{12}:.*stream/\\S+] \n           \n            }\n       {-  Consumer pattern: [^(arn):aws.*:kinesis:.*:\\d{12}:.*stream\\/\\[a-zA-Z0-9_.-\\]+\\/consumer\\/\\[a-zA-Z0-9_.-\\]+:\\[0-9\\]+] \n           \n            }\n       }\n  "]
module DeleteStream :
sig
  val request :
    Smaws_Lib.Context.t ->
      delete_stream_input ->
        (unit,
          [> Smaws_Lib.Protocols.AwsJson.error
          | `AccessDeniedException of access_denied_exception 
          | `InvalidArgumentException of invalid_argument_exception 
          | `LimitExceededException of limit_exceeded_exception 
          | `ResourceInUseException of resource_in_use_exception 
          | `ResourceNotFoundException of resource_not_found_exception ])
          result
end[@@ocaml.doc
     "Deletes a Kinesis data stream and all its shards and data. You must shut down any applications that are operating on the stream before you delete the stream. If an application attempts to operate on a deleted stream, it receives the exception [ResourceNotFoundException].\n\n  When invoking this API, you must use either the [StreamARN] or the [StreamName] parameter, or both. It is recommended that you use the [StreamARN] input parameter when you invoke this API.\n  \n    If the stream is in the [ACTIVE] state, you can delete it. After a [DeleteStream] request, the specified stream is in the [DELETING] state until Kinesis Data Streams completes the deletion.\n    \n      {b Note:} Kinesis Data Streams might continue to accept data read and write operations, such as [PutRecord], [PutRecords], and [GetRecords], on a stream in the [DELETING] state until the stream deletion is complete.\n     \n      When you delete a stream, any shards in that stream are also deleted, and any tags are dissociated from the stream.\n      \n       You can use the [DescribeStreamSummary] operation to check the state of the stream, which is returned in [StreamStatus].\n       \n         [DeleteStream] has a limit of five transactions per second per account.\n        "]
module DeregisterStreamConsumer :
sig
  val request :
    Smaws_Lib.Context.t ->
      deregister_stream_consumer_input ->
        (unit,
          [> Smaws_Lib.Protocols.AwsJson.error
          | `InvalidArgumentException of invalid_argument_exception 
          | `LimitExceededException of limit_exceeded_exception 
          | `ResourceNotFoundException of resource_not_found_exception ])
          result
end[@@ocaml.doc
     "To deregister a consumer, provide its ARN. Alternatively, you can provide the ARN of the data stream and the name you gave the consumer when you registered it. You may also provide all three parameters, as long as they don't conflict with each other. If you don't know the name or ARN of the consumer that you want to deregister, you can use the [ListStreamConsumers] operation to get a list of the descriptions of all the consumers that are currently registered with a given data stream. The description of a consumer contains its name and ARN.\n\n This operation has a limit of five transactions per second per stream.\n "]
module DescribeLimits :
sig
  val request :
    Smaws_Lib.Context.t ->
      unit ->
        (describe_limits_output,
          [> Smaws_Lib.Protocols.AwsJson.error
          | `LimitExceededException of limit_exceeded_exception ]) result
end[@@ocaml.doc
     "Describes the shard limits and usage for the account.\n\n If you update your account limits, the old limits might be returned for a few minutes.\n \n  This operation has a limit of one transaction per second per account.\n  "]
module DescribeStream :
sig
  val request :
    Smaws_Lib.Context.t ->
      describe_stream_input ->
        (describe_stream_output,
          [> Smaws_Lib.Protocols.AwsJson.error
          | `AccessDeniedException of access_denied_exception 
          | `InvalidArgumentException of invalid_argument_exception 
          | `LimitExceededException of limit_exceeded_exception 
          | `ResourceNotFoundException of resource_not_found_exception ])
          result
end[@@ocaml.doc
     "Describes the specified Kinesis data stream.\n\n  This API has been revised. It's highly recommended that you use the [DescribeStreamSummary] API to get a summarized description of the specified Kinesis data stream and the [ListShards] API to list the shards in a specified data stream and obtain information about each shard. \n  \n     When invoking this API, you must use either the [StreamARN] or the [StreamName] parameter, or both. It is recommended that you use the [StreamARN] input parameter when you invoke this API.\n     \n       The information returned includes the stream name, Amazon Resource Name (ARN), creation time, enhanced metric configuration, and shard map. The shard map is an array of shard objects. For each shard object, there is the hash key and sequence number ranges that the shard spans, and the IDs of any earlier shards that played in a role in creating the shard. Every record ingested in the stream is identified by a sequence number, which is assigned when the record is put into the stream.\n       \n        You can limit the number of shards returned by each call. For more information, see {{:https://docs.aws.amazon.com/kinesis/latest/dev/kinesis-using-sdk-java-retrieve-shards.html}Retrieving Shards from a Stream} in the {i Amazon Kinesis Data Streams Developer Guide}.\n        \n         There are no guarantees about the chronological order shards returned. To process shards in chronological order, use the ID of the parent shard to track the lineage to the oldest shard.\n         \n          This operation has a limit of 10 transactions per second per account.\n          "]
module DescribeStreamConsumer :
sig
  val request :
    Smaws_Lib.Context.t ->
      describe_stream_consumer_input ->
        (describe_stream_consumer_output,
          [> Smaws_Lib.Protocols.AwsJson.error
          | `InvalidArgumentException of invalid_argument_exception 
          | `LimitExceededException of limit_exceeded_exception 
          | `ResourceNotFoundException of resource_not_found_exception ])
          result
end[@@ocaml.doc
     "To get the description of a registered consumer, provide the ARN of the consumer. Alternatively, you can provide the ARN of the data stream and the name you gave the consumer when you registered it. You may also provide all three parameters, as long as they don't conflict with each other. If you don't know the name or ARN of the consumer that you want to describe, you can use the [ListStreamConsumers] operation to get a list of the descriptions of all the consumers that are currently registered with a given data stream.\n\n This operation has a limit of 20 transactions per second per stream.\n \n   When making a cross-account call with [DescribeStreamConsumer], make sure to provide the ARN of the consumer. \n   \n    "]
module DescribeStreamSummary :
sig
  val request :
    Smaws_Lib.Context.t ->
      describe_stream_summary_input ->
        (describe_stream_summary_output,
          [> Smaws_Lib.Protocols.AwsJson.error
          | `AccessDeniedException of access_denied_exception 
          | `InvalidArgumentException of invalid_argument_exception 
          | `LimitExceededException of limit_exceeded_exception 
          | `ResourceNotFoundException of resource_not_found_exception ])
          result
end[@@ocaml.doc
     "Provides a summarized description of the specified Kinesis data stream without the shard list.\n\n  When invoking this API, you must use either the [StreamARN] or the [StreamName] parameter, or both. It is recommended that you use the [StreamARN] input parameter when you invoke this API.\n  \n    The information returned includes the stream name, Amazon Resource Name (ARN), status, record retention period, approximate creation time, monitoring, encryption details, and open shard count. \n    \n      [DescribeStreamSummary] has a limit of 20 transactions per second per account.\n     "]
module DisableEnhancedMonitoring :
sig
  val request :
    Smaws_Lib.Context.t ->
      disable_enhanced_monitoring_input ->
        (enhanced_monitoring_output,
          [> Smaws_Lib.Protocols.AwsJson.error
          | `AccessDeniedException of access_denied_exception 
          | `InvalidArgumentException of invalid_argument_exception 
          | `LimitExceededException of limit_exceeded_exception 
          | `ResourceInUseException of resource_in_use_exception 
          | `ResourceNotFoundException of resource_not_found_exception ])
          result
end[@@ocaml.doc
     "Disables enhanced monitoring.\n\n  When invoking this API, you must use either the [StreamARN] or the [StreamName] parameter, or both. It is recommended that you use the [StreamARN] input parameter when you invoke this API.\n  \n   "]
module EnableEnhancedMonitoring :
sig
  val request :
    Smaws_Lib.Context.t ->
      enable_enhanced_monitoring_input ->
        (enhanced_monitoring_output,
          [> Smaws_Lib.Protocols.AwsJson.error
          | `AccessDeniedException of access_denied_exception 
          | `InvalidArgumentException of invalid_argument_exception 
          | `LimitExceededException of limit_exceeded_exception 
          | `ResourceInUseException of resource_in_use_exception 
          | `ResourceNotFoundException of resource_not_found_exception ])
          result
end[@@ocaml.doc
     "Enables enhanced Kinesis data stream monitoring for shard-level metrics.\n\n  When invoking this API, you must use either the [StreamARN] or the [StreamName] parameter, or both. It is recommended that you use the [StreamARN] input parameter when you invoke this API.\n  \n   "]
module GetRecords :
sig
  val request :
    Smaws_Lib.Context.t ->
      get_records_input ->
        (get_records_output,
          [> Smaws_Lib.Protocols.AwsJson.error
          | `AccessDeniedException of access_denied_exception 
          | `ExpiredIteratorException of expired_iterator_exception 
          | `InternalFailureException of internal_failure_exception 
          | `InvalidArgumentException of invalid_argument_exception 
          | `KMSAccessDeniedException of kms_access_denied_exception 
          | `KMSDisabledException of kms_disabled_exception 
          | `KMSInvalidStateException of kms_invalid_state_exception 
          | `KMSNotFoundException of kms_not_found_exception 
          | `KMSOptInRequired of kms_opt_in_required 
          | `KMSThrottlingException of kms_throttling_exception 
          | `ProvisionedThroughputExceededException of
              provisioned_throughput_exceeded_exception 
          | `ResourceNotFoundException of resource_not_found_exception ])
          result
end[@@ocaml.doc
     "Gets data records from a Kinesis data stream's shard.\n\n  When invoking this API, you must use either the [StreamARN] or the [StreamName] parameter, or both. It is recommended that you use the [StreamARN] input parameter when you invoke this API.\n  \n    Specify a shard iterator using the [ShardIterator] parameter. The shard iterator specifies the position in the shard from which you want to start reading data records sequentially. If there are no records available in the portion of the shard that the iterator points to, [GetRecords] returns an empty list. It might take multiple calls to get to a portion of the shard that contains records.\n    \n     You can scale by provisioning multiple shards per stream while considering service limits (for more information, see {{:https://docs.aws.amazon.com/kinesis/latest/dev/service-sizes-and-limits.html}Amazon Kinesis Data Streams Limits} in the {i Amazon Kinesis Data Streams Developer Guide}). Your application should have one thread per shard, each reading continuously from its stream. To read from a stream continually, call [GetRecords] in a loop. Use [GetShardIterator] to get the shard iterator to specify in the first [GetRecords] call. [GetRecords] returns a new shard iterator in [NextShardIterator]. Specify the shard iterator returned in [NextShardIterator] in subsequent calls to [GetRecords]. If the shard has been closed, the shard iterator can't return more data and [GetRecords] returns [null] in [NextShardIterator]. You can terminate the loop when the shard is closed, or when the shard iterator reaches the record with the sequence number or other attribute that marks it as the last record to process.\n     \n      Each data record can be up to 1 MiB in size, and each shard can read up to 2 MiB per second. You can ensure that your calls don't exceed the maximum supported size or throughput by using the [Limit] parameter to specify the maximum number of records that [GetRecords] can return. Consider your average record size when determining this limit. The maximum number of records that can be returned per call is 10,000.\n      \n       The size of the data returned by [GetRecords] varies depending on the utilization of the shard. It is recommended that consumer applications retrieve records via the [GetRecords] command using the 5 TPS limit to remain caught up. Retrieving records less frequently can lead to consumer applications falling behind. The maximum size of data that [GetRecords] can return is 10 MiB. If a call returns this amount of data, subsequent calls made within the next 5 seconds throw [ProvisionedThroughputExceededException]. If there is insufficient provisioned throughput on the stream, subsequent calls made within the next 1 second throw [ProvisionedThroughputExceededException]. [GetRecords] doesn't return any data when it throws an exception. For this reason, we recommend that you wait 1 second between calls to [GetRecords]. However, it's possible that the application will get exceptions for longer than 1 second.\n       \n        To detect whether the application is falling behind in processing, you can use the [MillisBehindLatest] response attribute. You can also monitor the stream using CloudWatch metrics and other mechanisms (see {{:https://docs.aws.amazon.com/kinesis/latest/dev/monitoring.html}Monitoring} in the {i Amazon Kinesis Data Streams Developer Guide}).\n        \n         Each Amazon Kinesis record includes a value, [ApproximateArrivalTimestamp], that is set when a stream successfully receives and stores a record. This is commonly referred to as a server-side time stamp, whereas a client-side time stamp is set when a data producer creates or sends the record to a stream (a data producer is any data source putting data records into a stream, for example with [PutRecords]). The time stamp has millisecond precision. There are no guarantees about the time stamp accuracy, or that the time stamp is always increasing. For example, records in a shard or across a stream might have time stamps that are out of order.\n         \n          This operation has a limit of five transactions per second per shard.\n          "]
module GetResourcePolicy :
sig
  val request :
    Smaws_Lib.Context.t ->
      get_resource_policy_input ->
        (get_resource_policy_output,
          [> Smaws_Lib.Protocols.AwsJson.error
          | `AccessDeniedException of access_denied_exception 
          | `InvalidArgumentException of invalid_argument_exception 
          | `LimitExceededException of limit_exceeded_exception 
          | `ResourceInUseException of resource_in_use_exception 
          | `ResourceNotFoundException of resource_not_found_exception ])
          result
end[@@ocaml.doc
     "Returns a policy attached to the specified data stream or consumer. Request patterns can be one of the following:\n\n {ul\n       {-  Data stream pattern: [arn:aws.*:kinesis:.*:\\d{12}:.*stream/\\S+] \n           \n            }\n       {-   Consumer pattern: [^(arn):aws.*:kinesis:.*:\\d{12}:.*stream\\/\\[a-zA-Z0-9_.-\\]+\\/consumer\\/\\[a-zA-Z0-9_.-\\]+:\\[0-9\\]+] \n           \n            }\n       }\n  "]
module GetShardIterator :
sig
  val request :
    Smaws_Lib.Context.t ->
      get_shard_iterator_input ->
        (get_shard_iterator_output,
          [> Smaws_Lib.Protocols.AwsJson.error
          | `AccessDeniedException of access_denied_exception 
          | `InternalFailureException of internal_failure_exception 
          | `InvalidArgumentException of invalid_argument_exception 
          | `ProvisionedThroughputExceededException of
              provisioned_throughput_exceeded_exception 
          | `ResourceNotFoundException of resource_not_found_exception ])
          result
end[@@ocaml.doc
     "Gets an Amazon Kinesis shard iterator. A shard iterator expires 5 minutes after it is returned to the requester.\n\n  When invoking this API, you must use either the [StreamARN] or the [StreamName] parameter, or both. It is recommended that you use the [StreamARN] input parameter when you invoke this API.\n  \n    A shard iterator specifies the shard position from which to start reading data records sequentially. The position is specified using the sequence number of a data record in a shard. A sequence number is the identifier associated with every record ingested in the stream, and is assigned when a record is put into the stream. Each stream has one or more shards.\n    \n     You must specify the shard iterator type. For example, you can set the [ShardIteratorType] parameter to read exactly from the position denoted by a specific sequence number by using the [AT_SEQUENCE_NUMBER] shard iterator type. Alternatively, the parameter can read right after the sequence number by using the [AFTER_SEQUENCE_NUMBER] shard iterator type, using sequence numbers returned by earlier calls to [PutRecord], [PutRecords], [GetRecords], or [DescribeStream]. In the request, you can specify the shard iterator type [AT_TIMESTAMP] to read records from an arbitrary point in time, [TRIM_HORIZON] to cause [ShardIterator] to point to the last untrimmed record in the shard in the system (the oldest data record in the shard), or [LATEST] so that you always read the most recent data in the shard. \n     \n      When you read repeatedly from a stream, use a [GetShardIterator] request to get the first shard iterator for use in your first [GetRecords] request and for subsequent reads use the shard iterator returned by the [GetRecords] request in [NextShardIterator]. A new shard iterator is returned by every [GetRecords] request in [NextShardIterator], which you use in the [ShardIterator] parameter of the next [GetRecords] request. \n      \n       If a [GetShardIterator] request is made too often, you receive a [ProvisionedThroughputExceededException]. For more information about throughput limits, see [GetRecords], and {{:https://docs.aws.amazon.com/kinesis/latest/dev/service-sizes-and-limits.html}Streams Limits} in the {i Amazon Kinesis Data Streams Developer Guide}.\n       \n        If the shard is closed, [GetShardIterator] returns a valid iterator for the last sequence number of the shard. A shard can be closed as a result of using [SplitShard] or [MergeShards].\n        \n          [GetShardIterator] has a limit of five transactions per second per account per open shard.\n         "]
module IncreaseStreamRetentionPeriod :
sig
  val request :
    Smaws_Lib.Context.t ->
      increase_stream_retention_period_input ->
        (unit,
          [> Smaws_Lib.Protocols.AwsJson.error
          | `AccessDeniedException of access_denied_exception 
          | `InvalidArgumentException of invalid_argument_exception 
          | `LimitExceededException of limit_exceeded_exception 
          | `ResourceInUseException of resource_in_use_exception 
          | `ResourceNotFoundException of resource_not_found_exception ])
          result
end[@@ocaml.doc
     "Increases the Kinesis data stream's retention period, which is the length of time data records are accessible after they are added to the stream. The maximum value of a stream's retention period is 8760 hours (365 days).\n\n  When invoking this API, you must use either the [StreamARN] or the [StreamName] parameter, or both. It is recommended that you use the [StreamARN] input parameter when you invoke this API.\n  \n    If you choose a longer stream retention period, this operation increases the time period during which records that have not yet expired are accessible. However, it does not make previous, expired data (older than the stream's previous retention period) accessible after the operation has been called. For example, if a stream's retention period is set to 24 hours and is increased to 168 hours, any data that is older than 24 hours remains inaccessible to consumer applications.\n    "]
module ListShards :
sig
  val request :
    Smaws_Lib.Context.t ->
      list_shards_input ->
        (list_shards_output,
          [> Smaws_Lib.Protocols.AwsJson.error
          | `AccessDeniedException of access_denied_exception 
          | `ExpiredNextTokenException of expired_next_token_exception 
          | `InvalidArgumentException of invalid_argument_exception 
          | `LimitExceededException of limit_exceeded_exception 
          | `ResourceInUseException of resource_in_use_exception 
          | `ResourceNotFoundException of resource_not_found_exception ])
          result
end[@@ocaml.doc
     "Lists the shards in a stream and provides information about each shard. This operation has a limit of 1000 transactions per second per data stream.\n\n  When invoking this API, you must use either the [StreamARN] or the [StreamName] parameter, or both. It is recommended that you use the [StreamARN] input parameter when you invoke this API.\n  \n    This action does not list expired shards. For information about expired shards, see {{:https://docs.aws.amazon.com/streams/latest/dev/kinesis-using-sdk-java-after-resharding.html#kinesis-using-sdk-java-resharding-data-routing}Data Routing, Data Persistence, and Shard State after a Reshard}. \n    \n      This API is a new operation that is used by the Amazon Kinesis Client Library (KCL). If you have a fine-grained IAM policy that only allows specific operations, you must update your policy to allow calls to this API. For more information, see {{:https://docs.aws.amazon.com/streams/latest/dev/controlling-access.html}Controlling Access to Amazon Kinesis Data Streams Resources Using IAM}.\n      \n       "]
module ListStreamConsumers :
sig
  val request :
    Smaws_Lib.Context.t ->
      list_stream_consumers_input ->
        (list_stream_consumers_output,
          [> Smaws_Lib.Protocols.AwsJson.error
          | `ExpiredNextTokenException of expired_next_token_exception 
          | `InvalidArgumentException of invalid_argument_exception 
          | `LimitExceededException of limit_exceeded_exception 
          | `ResourceInUseException of resource_in_use_exception 
          | `ResourceNotFoundException of resource_not_found_exception ])
          result
end[@@ocaml.doc
     "Lists the consumers registered to receive data from a stream using enhanced fan-out, and provides information about each consumer.\n\n This operation has a limit of 5 transactions per second per stream.\n "]
module ListStreams :
sig
  val request :
    Smaws_Lib.Context.t ->
      list_streams_input ->
        (list_streams_output,
          [> Smaws_Lib.Protocols.AwsJson.error
          | `ExpiredNextTokenException of expired_next_token_exception 
          | `InvalidArgumentException of invalid_argument_exception 
          | `LimitExceededException of limit_exceeded_exception ]) result
end[@@ocaml.doc
     "Lists your Kinesis data streams.\n\n The number of streams may be too large to return from a single call to [ListStreams]. You can limit the number of returned streams using the [Limit] parameter. If you do not specify a value for the [Limit] parameter, Kinesis Data Streams uses the default limit, which is currently 100.\n \n  You can detect if there are more streams available to list by using the [HasMoreStreams] flag from the returned output. If there are more streams available, you can request more streams by using the name of the last stream returned by the [ListStreams] request in the [ExclusiveStartStreamName] parameter in a subsequent request to [ListStreams]. The group of stream names returned by the subsequent request is then added to the list. You can continue this process until all the stream names have been collected in the list. \n  \n    [ListStreams] has a limit of five transactions per second per account.\n   "]
module ListTagsForResource :
sig
  val request :
    Smaws_Lib.Context.t ->
      list_tags_for_resource_input ->
        (list_tags_for_resource_output,
          [> Smaws_Lib.Protocols.AwsJson.error
          | `AccessDeniedException of access_denied_exception 
          | `InvalidArgumentException of invalid_argument_exception 
          | `LimitExceededException of limit_exceeded_exception 
          | `ResourceInUseException of resource_in_use_exception 
          | `ResourceNotFoundException of resource_not_found_exception ])
          result
end[@@ocaml.doc
     "List all tags added to the specified Kinesis resource. Each tag is a label consisting of a user-defined key and value. Tags can help you manage, identify, organize, search for, and filter resources.\n\n For more information about tagging Kinesis resources, see {{:https://docs.aws.amazon.com/streams/latest/dev/tagging.html}Tag your Amazon Kinesis Data Streams resources}.\n "]
module ListTagsForStream :
sig
  val request :
    Smaws_Lib.Context.t ->
      list_tags_for_stream_input ->
        (list_tags_for_stream_output,
          [> Smaws_Lib.Protocols.AwsJson.error
          | `AccessDeniedException of access_denied_exception 
          | `InvalidArgumentException of invalid_argument_exception 
          | `LimitExceededException of limit_exceeded_exception 
          | `ResourceNotFoundException of resource_not_found_exception ])
          result
end[@@ocaml.doc
     "Lists the tags for the specified Kinesis data stream. This operation has a limit of five transactions per second per account.\n\n  When invoking this API, you must use either the [StreamARN] or the [StreamName] parameter, or both. It is recommended that you use the [StreamARN] input parameter when you invoke this API.\n  \n   "]
module MergeShards :
sig
  val request :
    Smaws_Lib.Context.t ->
      merge_shards_input ->
        (unit,
          [> Smaws_Lib.Protocols.AwsJson.error
          | `AccessDeniedException of access_denied_exception 
          | `InvalidArgumentException of invalid_argument_exception 
          | `LimitExceededException of limit_exceeded_exception 
          | `ResourceInUseException of resource_in_use_exception 
          | `ResourceNotFoundException of resource_not_found_exception 
          | `ValidationException of validation_exception ]) result
end[@@ocaml.doc
     "Merges two adjacent shards in a Kinesis data stream and combines them into a single shard to reduce the stream's capacity to ingest and transport data. This API is only supported for the data streams with the provisioned capacity mode. Two shards are considered adjacent if the union of the hash key ranges for the two shards form a contiguous set with no gaps. For example, if you have two shards, one with a hash key range of 276...381 and the other with a hash key range of 382...454, then you could merge these two shards into a single shard that would have a hash key range of 276...454. After the merge, the single child shard receives data for all hash key values covered by the two parent shards.\n\n  When invoking this API, you must use either the [StreamARN] or the [StreamName] parameter, or both. It is recommended that you use the [StreamARN] input parameter when you invoke this API.\n  \n     [MergeShards] is called when there is a need to reduce the overall capacity of a stream because of excess capacity that is not being used. You must specify the shard to be merged and the adjacent shard for a stream. For more information about merging shards, see {{:https://docs.aws.amazon.com/kinesis/latest/dev/kinesis-using-sdk-java-resharding-merge.html}Merge Two Shards} in the {i Amazon Kinesis Data Streams Developer Guide}.\n    \n     If the stream is in the [ACTIVE] state, you can call [MergeShards]. If a stream is in the [CREATING], [UPDATING], or [DELETING] state, [MergeShards] returns a [ResourceInUseException]. If the specified stream does not exist, [MergeShards] returns a [ResourceNotFoundException]. \n     \n      You can use [DescribeStreamSummary] to check the state of the stream, which is returned in [StreamStatus].\n      \n        [MergeShards] is an asynchronous operation. Upon receiving a [MergeShards] request, Amazon Kinesis Data Streams immediately returns a response and sets the [StreamStatus] to [UPDATING]. After the operation is completed, Kinesis Data Streams sets the [StreamStatus] to [ACTIVE]. Read and write operations continue to work while the stream is in the [UPDATING] state. \n       \n        You use [DescribeStreamSummary] and the [ListShards] APIs to determine the shard IDs that are specified in the [MergeShards] request. \n        \n         If you try to operate on too many streams in parallel using [CreateStream], [DeleteStream], [MergeShards], or [SplitShard], you receive a [LimitExceededException]. \n         \n           [MergeShards] has a limit of five transactions per second per account.\n          "]
module PutRecord :
sig
  val request :
    Smaws_Lib.Context.t ->
      put_record_input ->
        (put_record_output,
          [> Smaws_Lib.Protocols.AwsJson.error
          | `AccessDeniedException of access_denied_exception 
          | `InternalFailureException of internal_failure_exception 
          | `InvalidArgumentException of invalid_argument_exception 
          | `KMSAccessDeniedException of kms_access_denied_exception 
          | `KMSDisabledException of kms_disabled_exception 
          | `KMSInvalidStateException of kms_invalid_state_exception 
          | `KMSNotFoundException of kms_not_found_exception 
          | `KMSOptInRequired of kms_opt_in_required 
          | `KMSThrottlingException of kms_throttling_exception 
          | `ProvisionedThroughputExceededException of
              provisioned_throughput_exceeded_exception 
          | `ResourceNotFoundException of resource_not_found_exception ])
          result
end[@@ocaml.doc
     "Writes a single data record into an Amazon Kinesis data stream. Call [PutRecord] to send data into the stream for real-time ingestion and subsequent processing, one record at a time. Each shard can support writes up to 1,000 records per second, up to a maximum data write total of 1 MiB per second.\n\n  When invoking this API, you must use either the [StreamARN] or the [StreamName] parameter, or both. It is recommended that you use the [StreamARN] input parameter when you invoke this API.\n  \n    You must specify the name of the stream that captures, stores, and transports the data; a partition key; and the data blob itself.\n    \n     The data blob can be any type of data; for example, a segment from a log file, geographic/location data, website clickstream data, and so on.\n     \n      The partition key is used by Kinesis Data Streams to distribute data across shards. Kinesis Data Streams segregates the data records that belong to a stream into multiple shards, using the partition key associated with each data record to determine the shard to which a given data record belongs.\n      \n       Partition keys are Unicode strings, with a maximum length limit of 256 characters for each key. An MD5 hash function is used to map partition keys to 128-bit integer values and to map associated data records to shards using the hash key ranges of the shards. You can override hashing the partition key to determine the shard by explicitly specifying a hash value using the [ExplicitHashKey] parameter. For more information, see {{:https://docs.aws.amazon.com/kinesis/latest/dev/developing-producers-with-sdk.html#kinesis-using-sdk-java-add-data-to-stream}Adding Data to a Stream} in the {i Amazon Kinesis Data Streams Developer Guide}.\n       \n         [PutRecord] returns the shard ID of where the data record was placed and the sequence number that was assigned to the data record.\n        \n         Sequence numbers increase over time and are specific to a shard within a stream, not across all shards within a stream. To guarantee strictly increasing ordering, write serially to a shard and use the [SequenceNumberForOrdering] parameter. For more information, see {{:https://docs.aws.amazon.com/kinesis/latest/dev/developing-producers-with-sdk.html#kinesis-using-sdk-java-add-data-to-stream}Adding Data to a Stream} in the {i Amazon Kinesis Data Streams Developer Guide}.\n         \n           After you write a record to a stream, you cannot modify that record or its order within the stream.\n           \n             If a [PutRecord] request cannot be processed because of insufficient provisioned throughput on the shard involved in the request, [PutRecord] throws [ProvisionedThroughputExceededException]. \n             \n              By default, data records are accessible for 24 hours from the time that they are added to a stream. You can use [IncreaseStreamRetentionPeriod] or [DecreaseStreamRetentionPeriod] to modify this retention period.\n              "]
module PutRecords :
sig
  val request :
    Smaws_Lib.Context.t ->
      put_records_input ->
        (put_records_output,
          [> Smaws_Lib.Protocols.AwsJson.error
          | `AccessDeniedException of access_denied_exception 
          | `InternalFailureException of internal_failure_exception 
          | `InvalidArgumentException of invalid_argument_exception 
          | `KMSAccessDeniedException of kms_access_denied_exception 
          | `KMSDisabledException of kms_disabled_exception 
          | `KMSInvalidStateException of kms_invalid_state_exception 
          | `KMSNotFoundException of kms_not_found_exception 
          | `KMSOptInRequired of kms_opt_in_required 
          | `KMSThrottlingException of kms_throttling_exception 
          | `ProvisionedThroughputExceededException of
              provisioned_throughput_exceeded_exception 
          | `ResourceNotFoundException of resource_not_found_exception ])
          result
end[@@ocaml.doc
     "Writes multiple data records into a Kinesis data stream in a single call (also referred to as a [PutRecords] request). Use this operation to send data into the stream for data ingestion and processing. \n\n  When invoking this API, you must use either the [StreamARN] or the [StreamName] parameter, or both. It is recommended that you use the [StreamARN] input parameter when you invoke this API.\n  \n    Each [PutRecords] request can support up to 500 records. Each record in the request can be as large as 1 MiB, up to a limit of 5 MiB for the entire request, including partition keys. Each shard can support writes up to 1,000 records per second, up to a maximum data write total of 1 MiB per second.\n    \n     You must specify the name of the stream that captures, stores, and transports the data; and an array of request [Records], with each record in the array requiring a partition key and data blob. The record size limit applies to the total size of the partition key and data blob.\n     \n      The data blob can be any type of data; for example, a segment from a log file, geographic/location data, website clickstream data, and so on.\n      \n       The partition key is used by Kinesis Data Streams as input to a hash function that maps the partition key and associated data to a specific shard. An MD5 hash function is used to map partition keys to 128-bit integer values and to map associated data records to shards. As a result of this hashing mechanism, all data records with the same partition key map to the same shard within the stream. For more information, see {{:https://docs.aws.amazon.com/kinesis/latest/dev/developing-producers-with-sdk.html#kinesis-using-sdk-java-add-data-to-stream}Adding Data to a Stream} in the {i Amazon Kinesis Data Streams Developer Guide}.\n       \n        Each record in the [Records] array may include an optional parameter, [ExplicitHashKey], which overrides the partition key to shard mapping. This parameter allows a data producer to determine explicitly the shard where the record is stored. For more information, see {{:https://docs.aws.amazon.com/kinesis/latest/dev/developing-producers-with-sdk.html#kinesis-using-sdk-java-putrecords}Adding Multiple Records with PutRecords} in the {i Amazon Kinesis Data Streams Developer Guide}.\n        \n         The [PutRecords] response includes an array of response [Records]. Each record in the response array directly correlates with a record in the request array using natural ordering, from the top to the bottom of the request and response. The response [Records] array always includes the same number of records as the request array.\n         \n          The response [Records] array includes both successfully and unsuccessfully processed records. Kinesis Data Streams attempts to process all records in each [PutRecords] request. A single record failure does not stop the processing of subsequent records. As a result, PutRecords doesn't guarantee the ordering of records. If you need to read records in the same order they are written to the stream, use [PutRecord] instead of [PutRecords], and write to the same shard.\n          \n           A successfully processed record includes [ShardId] and [SequenceNumber] values. The [ShardId] parameter identifies the shard in the stream where the record is stored. The [SequenceNumber] parameter is an identifier assigned to the put record, unique to all records in the stream.\n           \n            An unsuccessfully processed record includes [ErrorCode] and [ErrorMessage] values. [ErrorCode] reflects the type of error and can be one of the following values: [ProvisionedThroughputExceededException] or [InternalFailure]. [ErrorMessage] provides more detailed information about the [ProvisionedThroughputExceededException] exception including the account ID, stream name, and shard ID of the record that was throttled. For more information about partially successful responses, see {{:https://docs.aws.amazon.com/kinesis/latest/dev/kinesis-using-sdk-java-add-data-to-stream.html#kinesis-using-sdk-java-putrecords}Adding Multiple Records with PutRecords} in the {i Amazon Kinesis Data Streams Developer Guide}.\n            \n              After you write a record to a stream, you cannot modify that record or its order within the stream.\n              \n                By default, data records are accessible for 24 hours from the time that they are added to a stream. You can use [IncreaseStreamRetentionPeriod] or [DecreaseStreamRetentionPeriod] to modify this retention period.\n                "]
module PutResourcePolicy :
sig
  val request :
    Smaws_Lib.Context.t ->
      put_resource_policy_input ->
        (unit,
          [> Smaws_Lib.Protocols.AwsJson.error
          | `AccessDeniedException of access_denied_exception 
          | `InvalidArgumentException of invalid_argument_exception 
          | `LimitExceededException of limit_exceeded_exception 
          | `ResourceInUseException of resource_in_use_exception 
          | `ResourceNotFoundException of resource_not_found_exception ])
          result
end[@@ocaml.doc
     "Attaches a resource-based policy to a data stream or registered consumer. If you are using an identity other than the root user of the Amazon Web Services account that owns the resource, the calling identity must have the [PutResourcePolicy] permissions on the specified Kinesis Data Streams resource and belong to the owner's account in order to use this operation. If you don't have [PutResourcePolicy] permissions, Amazon Kinesis Data Streams returns a [403 Access Denied error]. If you receive a [ResourceNotFoundException], check to see if you passed a valid stream or consumer resource. \n\n  Request patterns can be one of the following:\n \n  {ul\n        {-  Data stream pattern: [arn:aws.*:kinesis:.*:\\d{12}:.*stream/\\S+] \n            \n             }\n        {-  Consumer pattern: [^(arn):aws.*:kinesis:.*:\\d{12}:.*stream\\/\\[a-zA-Z0-9_.-\\]+\\/consumer\\/\\[a-zA-Z0-9_.-\\]+:\\[0-9\\]+] \n            \n             }\n        }\n   For more information, see {{:https://docs.aws.amazon.com/streams/latest/dev/controlling-access.html}Controlling Access to Amazon Kinesis Data Streams Resources Using IAM}.\n   "]
module RegisterStreamConsumer :
sig
  val request :
    Smaws_Lib.Context.t ->
      register_stream_consumer_input ->
        (register_stream_consumer_output,
          [> Smaws_Lib.Protocols.AwsJson.error
          | `InvalidArgumentException of invalid_argument_exception 
          | `LimitExceededException of limit_exceeded_exception 
          | `ResourceInUseException of resource_in_use_exception 
          | `ResourceNotFoundException of resource_not_found_exception ])
          result
end[@@ocaml.doc
     "Registers a consumer with a Kinesis data stream. When you use this operation, the consumer you register can then call [SubscribeToShard] to receive data from the stream using enhanced fan-out, at a rate of up to 2 MiB per second for every shard you subscribe to. This rate is unaffected by the total number of consumers that read from the same stream.\n\n You can add tags to the registered consumer when making a [RegisterStreamConsumer] request by setting the [Tags] parameter. If you pass the [Tags] parameter, in addition to having the [kinesis:RegisterStreamConsumer] permission, you must also have the [kinesis:TagResource] permission for the consumer that will be registered. Tags will take effect from the [CREATING] status of the consumer.\n \n  You can register up to 20 consumers per stream. A given consumer can only be registered with one stream at a time.\n  \n   For an example of how to use this operation, see {{:https://docs.aws.amazon.com/streams/latest/dev/building-enhanced-consumers-api.html}Enhanced Fan-Out Using the Kinesis Data Streams API}.\n   \n    The use of this operation has a limit of five transactions per second per account. Also, only 5 consumers can be created simultaneously. In other words, you cannot have more than 5 consumers in a [CREATING] status at the same time. Registering a 6th consumer while there are 5 in a [CREATING] status results in a [LimitExceededException].\n    "]
module RemoveTagsFromStream :
sig
  val request :
    Smaws_Lib.Context.t ->
      remove_tags_from_stream_input ->
        (unit,
          [> Smaws_Lib.Protocols.AwsJson.error
          | `AccessDeniedException of access_denied_exception 
          | `InvalidArgumentException of invalid_argument_exception 
          | `LimitExceededException of limit_exceeded_exception 
          | `ResourceInUseException of resource_in_use_exception 
          | `ResourceNotFoundException of resource_not_found_exception ])
          result
end[@@ocaml.doc
     "Removes tags from the specified Kinesis data stream. Removed tags are deleted and cannot be recovered after this operation successfully completes.\n\n  When invoking this API, you must use either the [StreamARN] or the [StreamName] parameter, or both. It is recommended that you use the [StreamARN] input parameter when you invoke this API.\n  \n    If you specify a tag that does not exist, it is ignored.\n    \n      [RemoveTagsFromStream] has a limit of five transactions per second per account.\n     "]
module SplitShard :
sig
  val request :
    Smaws_Lib.Context.t ->
      split_shard_input ->
        (unit,
          [> Smaws_Lib.Protocols.AwsJson.error
          | `AccessDeniedException of access_denied_exception 
          | `InvalidArgumentException of invalid_argument_exception 
          | `LimitExceededException of limit_exceeded_exception 
          | `ResourceInUseException of resource_in_use_exception 
          | `ResourceNotFoundException of resource_not_found_exception 
          | `ValidationException of validation_exception ]) result
end[@@ocaml.doc
     "Splits a shard into two new shards in the Kinesis data stream, to increase the stream's capacity to ingest and transport data. [SplitShard] is called when there is a need to increase the overall capacity of a stream because of an expected increase in the volume of data records being ingested. This API is only supported for the data streams with the provisioned capacity mode.\n\n  When invoking this API, you must use either the [StreamARN] or the [StreamName] parameter, or both. It is recommended that you use the [StreamARN] input parameter when you invoke this API.\n  \n    You can also use [SplitShard] when a shard appears to be approaching its maximum utilization; for example, the producers sending data into the specific shard are suddenly sending more than previously anticipated. You can also call [SplitShard] to increase stream capacity, so that more Kinesis Data Streams applications can simultaneously read data from the stream for real-time processing. \n    \n     You must specify the shard to be split and the new hash key, which is the position in the shard where the shard gets split in two. In many cases, the new hash key might be the average of the beginning and ending hash key, but it can be any hash key value in the range being mapped into the shard. For more information, see {{:https://docs.aws.amazon.com/kinesis/latest/dev/kinesis-using-sdk-java-resharding-split.html}Split a Shard} in the {i Amazon Kinesis Data Streams Developer Guide}.\n     \n      You can use [DescribeStreamSummary] and the [ListShards] APIs to determine the shard ID and hash key values for the [ShardToSplit] and [NewStartingHashKey] parameters that are specified in the [SplitShard] request.\n      \n        [SplitShard] is an asynchronous operation. Upon receiving a [SplitShard] request, Kinesis Data Streams immediately returns a response and sets the stream status to [UPDATING]. After the operation is completed, Kinesis Data Streams sets the stream status to [ACTIVE]. Read and write operations continue to work while the stream is in the [UPDATING] state. \n       \n        You can use [DescribeStreamSummary] to check the status of the stream, which is returned in [StreamStatus]. If the stream is in the [ACTIVE] state, you can call [SplitShard]. \n        \n         If the specified stream does not exist, [DescribeStreamSummary] returns a [ResourceNotFoundException]. If you try to create more shards than are authorized for your account, you receive a [LimitExceededException]. \n         \n          For the default shard limit for an Amazon Web Services account, see {{:https://docs.aws.amazon.com/kinesis/latest/dev/service-sizes-and-limits.html}Kinesis Data Streams Limits} in the {i Amazon Kinesis Data Streams Developer Guide}. To increase this limit, {{:https://docs.aws.amazon.com/general/latest/gr/aws_service_limits.html}contact Amazon Web Services Support}.\n          \n           If you try to operate on too many streams simultaneously using [CreateStream], [DeleteStream], [MergeShards], and/or [SplitShard], you receive a [LimitExceededException]. \n           \n             [SplitShard] has a limit of five transactions per second per account.\n            "]
module StartStreamEncryption :
sig
  val request :
    Smaws_Lib.Context.t ->
      start_stream_encryption_input ->
        (unit,
          [> Smaws_Lib.Protocols.AwsJson.error
          | `AccessDeniedException of access_denied_exception 
          | `InvalidArgumentException of invalid_argument_exception 
          | `KMSAccessDeniedException of kms_access_denied_exception 
          | `KMSDisabledException of kms_disabled_exception 
          | `KMSInvalidStateException of kms_invalid_state_exception 
          | `KMSNotFoundException of kms_not_found_exception 
          | `KMSOptInRequired of kms_opt_in_required 
          | `KMSThrottlingException of kms_throttling_exception 
          | `LimitExceededException of limit_exceeded_exception 
          | `ResourceInUseException of resource_in_use_exception 
          | `ResourceNotFoundException of resource_not_found_exception ])
          result
end[@@ocaml.doc
     "Enables or updates server-side encryption using an Amazon Web Services KMS key for a specified stream. \n\n  When invoking this API, you must use either the [StreamARN] or the [StreamName] parameter, or both. It is recommended that you use the [StreamARN] input parameter when you invoke this API.\n  \n    Starting encryption is an asynchronous operation. Upon receiving the request, Kinesis Data Streams returns immediately and sets the status of the stream to [UPDATING]. After the update is complete, Kinesis Data Streams sets the status of the stream back to [ACTIVE]. Updating or applying encryption normally takes a few seconds to complete, but it can take minutes. You can continue to read and write data to your stream while its status is [UPDATING]. Once the status of the stream is [ACTIVE], encryption begins for records written to the stream. \n    \n     API Limits: You can successfully apply a new Amazon Web Services KMS key for server-side encryption 25 times in a rolling 24-hour period.\n     \n      Note: It can take up to 5 seconds after the stream is in an [ACTIVE] status before all records written to the stream are encrypted. After you enable encryption, you can verify that encryption is applied by inspecting the API response from [PutRecord] or [PutRecords].\n      "]
module StopStreamEncryption :
sig
  val request :
    Smaws_Lib.Context.t ->
      stop_stream_encryption_input ->
        (unit,
          [> Smaws_Lib.Protocols.AwsJson.error
          | `AccessDeniedException of access_denied_exception 
          | `InvalidArgumentException of invalid_argument_exception 
          | `LimitExceededException of limit_exceeded_exception 
          | `ResourceInUseException of resource_in_use_exception 
          | `ResourceNotFoundException of resource_not_found_exception ])
          result
end[@@ocaml.doc
     "Disables server-side encryption for a specified stream. \n\n  When invoking this API, you must use either the [StreamARN] or the [StreamName] parameter, or both. It is recommended that you use the [StreamARN] input parameter when you invoke this API.\n  \n    Stopping encryption is an asynchronous operation. Upon receiving the request, Kinesis Data Streams returns immediately and sets the status of the stream to [UPDATING]. After the update is complete, Kinesis Data Streams sets the status of the stream back to [ACTIVE]. Stopping encryption normally takes a few seconds to complete, but it can take minutes. You can continue to read and write data to your stream while its status is [UPDATING]. Once the status of the stream is [ACTIVE], records written to the stream are no longer encrypted by Kinesis Data Streams. \n    \n     API Limits: You can successfully disable server-side encryption 25 times in a rolling 24-hour period. \n     \n      Note: It can take up to 5 seconds after the stream is in an [ACTIVE] status before all records written to the stream are no longer subject to encryption. After you disabled encryption, you can verify that encryption is not applied by inspecting the API response from [PutRecord] or [PutRecords].\n      "]
module SubscribeToShard :
sig
  val request :
    Smaws_Lib.Context.t ->
      subscribe_to_shard_input ->
        (subscribe_to_shard_output,
          [> Smaws_Lib.Protocols.AwsJson.error
          | `AccessDeniedException of access_denied_exception 
          | `InvalidArgumentException of invalid_argument_exception 
          | `LimitExceededException of limit_exceeded_exception 
          | `ResourceInUseException of resource_in_use_exception 
          | `ResourceNotFoundException of resource_not_found_exception ])
          result
end[@@ocaml.doc
     "This operation establishes an HTTP/2 connection between the consumer you specify in the [ConsumerARN] parameter and the shard you specify in the [ShardId] parameter. After the connection is successfully established, Kinesis Data Streams pushes records from the shard to the consumer over this connection. Before you call this operation, call [RegisterStreamConsumer] to register the consumer with Kinesis Data Streams.\n\n When the [SubscribeToShard] call succeeds, your consumer starts receiving events of type [SubscribeToShardEvent] over the HTTP/2 connection for up to 5 minutes, after which time you need to call [SubscribeToShard] again to renew the subscription if you want to continue to receive records.\n \n  You can make one call to [SubscribeToShard] per second per registered consumer per shard. For example, if you have a 4000 shard stream and two registered stream consumers, you can make one [SubscribeToShard] request per second for each combination of shard and registered consumer, allowing you to subscribe both consumers to all 4000 shards in one second. \n  \n   If you call [SubscribeToShard] again with the same [ConsumerARN] and [ShardId] within 5 seconds of a successful call, you'll get a [ResourceInUseException]. If you call [SubscribeToShard] 5 seconds or more after a successful call, the second call takes over the subscription and the previous connection expires or fails with a [ResourceInUseException].\n   \n    For an example of how to use this operation, see {{:https://docs.aws.amazon.com/streams/latest/dev/building-enhanced-consumers-api.html}Enhanced Fan-Out Using the Kinesis Data Streams API}.\n    "]
module TagResource :
sig
  val request :
    Smaws_Lib.Context.t ->
      tag_resource_input ->
        (unit,
          [> Smaws_Lib.Protocols.AwsJson.error
          | `AccessDeniedException of access_denied_exception 
          | `InvalidArgumentException of invalid_argument_exception 
          | `LimitExceededException of limit_exceeded_exception 
          | `ResourceInUseException of resource_in_use_exception 
          | `ResourceNotFoundException of resource_not_found_exception ])
          result
end[@@ocaml.doc
     "Adds or updates tags for the specified Kinesis resource. Each tag is a label consisting of a user-defined key and value. Tags can help you manage, identify, organize, search for, and filter resources. You can assign up to 50 tags to a Kinesis resource.\n"]
module UntagResource :
sig
  val request :
    Smaws_Lib.Context.t ->
      untag_resource_input ->
        (unit,
          [> Smaws_Lib.Protocols.AwsJson.error
          | `AccessDeniedException of access_denied_exception 
          | `InvalidArgumentException of invalid_argument_exception 
          | `LimitExceededException of limit_exceeded_exception 
          | `ResourceInUseException of resource_in_use_exception 
          | `ResourceNotFoundException of resource_not_found_exception ])
          result
end[@@ocaml.doc
     "Removes tags from the specified Kinesis resource. Removed tags are deleted and can't be recovered after this operation completes successfully.\n"]
module UpdateShardCount :
sig
  val request :
    Smaws_Lib.Context.t ->
      update_shard_count_input ->
        (update_shard_count_output,
          [> Smaws_Lib.Protocols.AwsJson.error
          | `AccessDeniedException of access_denied_exception 
          | `InvalidArgumentException of invalid_argument_exception 
          | `LimitExceededException of limit_exceeded_exception 
          | `ResourceInUseException of resource_in_use_exception 
          | `ResourceNotFoundException of resource_not_found_exception 
          | `ValidationException of validation_exception ]) result
end[@@ocaml.doc
     "Updates the shard count of the specified stream to the specified number of shards. This API is only supported for the data streams with the provisioned capacity mode.\n\n  When invoking this API, you must use either the [StreamARN] or the [StreamName] parameter, or both. It is recommended that you use the [StreamARN] input parameter when you invoke this API.\n  \n    Updating the shard count is an asynchronous operation. Upon receiving the request, Kinesis Data Streams returns immediately and sets the status of the stream to [UPDATING]. After the update is complete, Kinesis Data Streams sets the status of the stream back to [ACTIVE]. Depending on the size of the stream, the scaling action could take a few minutes to complete. You can continue to read and write data to your stream while its status is [UPDATING].\n    \n     To update the shard count, Kinesis Data Streams performs splits or merges on individual shards. This can cause short-lived shards to be created, in addition to the final shards. These short-lived shards count towards your total shard limit for your account in the Region.\n     \n      When using this operation, we recommend that you specify a target shard count that is a multiple of 25% (25%, 50%, 75%, 100%). You can specify any target value within your shard limit. However, if you specify a target that isn't a multiple of 25%, the scaling action might take longer to complete. \n      \n       This operation has the following default limits. By default, you cannot do the following:\n       \n        {ul\n              {-  Scale more than ten times per rolling 24-hour period per stream\n                  \n                   }\n              {-  Scale up to more than double your current shard count for a stream\n                  \n                   }\n              {-  Scale down below half your current shard count for a stream\n                  \n                   }\n              {-  Scale up to more than 10000 shards in a stream\n                  \n                   }\n              {-  Scale a stream with more than 10000 shards down unless the result is less than 10000 shards\n                  \n                   }\n              {-  Scale up to more than the shard limit for your account\n                  \n                   }\n              {-  Make over 10 TPS. TPS over 10 will trigger the LimitExceededException\n                  \n                   }\n              }\n   For the default limits for an Amazon Web Services account, see {{:https://docs.aws.amazon.com/kinesis/latest/dev/service-sizes-and-limits.html}Streams Limits} in the {i Amazon Kinesis Data Streams Developer Guide}. To request an increase in the call rate limit, the shard limit for this API, or your overall shard limit, use the {{:https://console.aws.amazon.com/support/v1#/case/create?issueType=service-limit-increase&limitType=service-code-kinesis}limits form}.\n   "]
module UpdateStreamMode :
sig
  val request :
    Smaws_Lib.Context.t ->
      update_stream_mode_input ->
        (unit,
          [> Smaws_Lib.Protocols.AwsJson.error
          | `InvalidArgumentException of invalid_argument_exception 
          | `LimitExceededException of limit_exceeded_exception 
          | `ResourceInUseException of resource_in_use_exception 
          | `ResourceNotFoundException of resource_not_found_exception ])
          result
end[@@ocaml.doc
     " Updates the capacity mode of the data stream. Currently, in Kinesis Data Streams, you can choose between an {b on-demand} capacity mode and a {b provisioned} capacity mode for your data stream. \n"]