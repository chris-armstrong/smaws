open Smaws_Lib
val service : Smaws_Lib.Service.descriptor
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
type nonrec tag_map = (string * string) list[@@ocaml.doc ""]
type nonrec tag =
  {
  value: string option
    [@ocaml.doc
      "An optional string, typically used to describe or define the tag. Maximum length: 256 characters. Valid characters: Unicode letters, digits, white space, _ . / = + - % \\@\n"];
  key: string
    [@ocaml.doc
      "A unique identifier for the tag. Maximum length: 128 characters. Valid characters: Unicode letters, digits, white space, _ . / = + - % \\@\n"]}
[@@ocaml.doc
  "Metadata assigned to the stream, consisting of a key-value pair.\n"]
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
      "A set of up to 10 key-value pairs to use to create the tags.\n"];
  stream_name: string option [@ocaml.doc "The name of the stream.\n"]}
[@@ocaml.doc "Represents the input for [AddTagsToStream].\n"]