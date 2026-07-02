open Types

module AddTagsToStream : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `AccessDeniedException of access_denied_exception
    | `InvalidArgumentException of invalid_argument_exception
    | `LimitExceededException of limit_exceeded_exception
    | `ResourceInUseException of resource_in_use_exception
    | `ResourceNotFoundException of resource_not_found_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    add_tags_to_stream_input ->
    ( Smaws_Lib.Smithy_api.Types.unit_,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `AccessDeniedException of access_denied_exception
      | `InvalidArgumentException of invalid_argument_exception
      | `LimitExceededException of limit_exceeded_exception
      | `ResourceInUseException of resource_in_use_exception
      | `ResourceNotFoundException of resource_not_found_exception ] )
    result
end
[@@ocaml.doc
  "Adds or updates tags for the specified Kinesis data stream. You can assign up to 50 tags to a \
   data stream.\n\n\
  \  When invoking this API, you must use either the [StreamARN] or the [StreamName] parameter, or \
   both. It is recommended that you use the [StreamARN] input parameter when you invoke this API.\n\
  \  \n\
  \    If tags have already been assigned to the stream, [AddTagsToStream] overwrites any existing \
   tags that correspond to the specified tag keys.\n\
  \    \n\
  \      [AddTagsToStream] has a limit of five transactions per second per account.\n\
  \     "]

module CreateStream : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `InvalidArgumentException of invalid_argument_exception
    | `LimitExceededException of limit_exceeded_exception
    | `ResourceInUseException of resource_in_use_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    create_stream_input ->
    ( Smaws_Lib.Smithy_api.Types.unit_,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `InvalidArgumentException of invalid_argument_exception
      | `LimitExceededException of limit_exceeded_exception
      | `ResourceInUseException of resource_in_use_exception ] )
    result
end
[@@ocaml.doc
  "Creates a Kinesis data stream. A stream captures and transports data records that are \
   continuously emitted from different data sources or {i producers}. Scale-out within a stream is \
   explicitly supported by means of shards, which are uniquely identified groups of data records \
   in a stream.\n\n\
  \ You can create your data stream using either on-demand or provisioned capacity mode. Data \
   streams with an on-demand mode require no capacity planning and automatically scale to handle \
   gigabytes of write and read throughput per minute. With the on-demand mode, Kinesis Data \
   Streams automatically manages the shards in order to provide the necessary throughput. For the \
   data streams with a provisioned mode, you must specify the number of shards for the data \
   stream. Each shard can support reads up to five transactions per second, up to a maximum data \
   read total of 2 MiB per second. Each shard can support writes up to 1,000 records per second, \
   up to a maximum data write total of 1 MiB per second. If the amount of data input increases or \
   decreases, you can add or remove shards.\n\
  \ \n\
  \  The stream name identifies the stream. The name is scoped to the Amazon Web Services account \
   used by the application. It is also scoped by Amazon Web Services Region. That is, two streams \
   in two different accounts can have the same name, and two streams in the same account, but in \
   two different Regions, can have the same name.\n\
  \  \n\
  \    [CreateStream] is an asynchronous operation. Upon receiving a [CreateStream] request, \
   Kinesis Data Streams immediately returns and sets the stream status to [CREATING]. After the \
   stream is created, Kinesis Data Streams sets the stream status to [ACTIVE]. You should perform \
   read and write operations only on an [ACTIVE] stream. \n\
  \   \n\
  \    You receive a [LimitExceededException] when making a [CreateStream] request when you try to \
   do one of the following:\n\
  \    \n\
  \     {ul\n\
  \           {-  Have more than five streams in the [CREATING] state at any point in time.\n\
  \               \n\
  \                }\n\
  \           {-  Create more shards than are authorized for your account.\n\
  \               \n\
  \                }\n\
  \           }\n\
  \   For the default shard limit for an Amazon Web Services account, see \
   {{:https://docs.aws.amazon.com/kinesis/latest/dev/service-sizes-and-limits.html}Amazon Kinesis \
   Data Streams Limits} in the {i Amazon Kinesis Data Streams Developer Guide}. To increase this \
   limit, {{:https://docs.aws.amazon.com/general/latest/gr/aws_service_limits.html}contact Amazon \
   Web Services Support}.\n\
  \   \n\
  \    You can use [DescribeStreamSummary] to check the stream status, which is returned in \
   [StreamStatus].\n\
  \    \n\
  \      [CreateStream] has a limit of five transactions per second per account.\n\
  \     \n\
  \      You can add tags to the stream when making a [CreateStream] request by setting the [Tags] \
   parameter. If you pass the [Tags] parameter, in addition to having the [kinesis:CreateStream] \
   permission, you must also have the [kinesis:AddTagsToStream] permission for the stream that \
   will be created. The [kinesis:TagResource] permission won\226\128\153t work to tag streams on \
   creation. Tags will take effect from the [CREATING] status of the stream, but you can't make \
   any updates to the tags until the stream is in [ACTIVE] state.\n\
  \      "]

module DecreaseStreamRetentionPeriod : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `AccessDeniedException of access_denied_exception
    | `InvalidArgumentException of invalid_argument_exception
    | `LimitExceededException of limit_exceeded_exception
    | `ResourceInUseException of resource_in_use_exception
    | `ResourceNotFoundException of resource_not_found_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    decrease_stream_retention_period_input ->
    ( Smaws_Lib.Smithy_api.Types.unit_,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `AccessDeniedException of access_denied_exception
      | `InvalidArgumentException of invalid_argument_exception
      | `LimitExceededException of limit_exceeded_exception
      | `ResourceInUseException of resource_in_use_exception
      | `ResourceNotFoundException of resource_not_found_exception ] )
    result
end
[@@ocaml.doc
  "Decreases the Kinesis data stream's retention period, which is the length of time data records \
   are accessible after they are added to the stream. The minimum value of a stream's retention \
   period is 24 hours.\n\n\
  \  When invoking this API, you must use either the [StreamARN] or the [StreamName] parameter, or \
   both. It is recommended that you use the [StreamARN] input parameter when you invoke this API.\n\
  \  \n\
  \    This operation may result in lost data. For example, if the stream's retention period is 48 \
   hours and is decreased to 24 hours, any data already in the stream that is older than 24 hours \
   is inaccessible.\n\
  \    "]

module DeleteResourcePolicy : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `AccessDeniedException of access_denied_exception
    | `InvalidArgumentException of invalid_argument_exception
    | `LimitExceededException of limit_exceeded_exception
    | `ResourceInUseException of resource_in_use_exception
    | `ResourceNotFoundException of resource_not_found_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    delete_resource_policy_input ->
    ( Smaws_Lib.Smithy_api.Types.unit_,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `AccessDeniedException of access_denied_exception
      | `InvalidArgumentException of invalid_argument_exception
      | `LimitExceededException of limit_exceeded_exception
      | `ResourceInUseException of resource_in_use_exception
      | `ResourceNotFoundException of resource_not_found_exception ] )
    result
end
[@@ocaml.doc
  "Delete a policy for the specified data stream or consumer. Request patterns can be one of the \
   following:\n\n\
  \ {ul\n\
  \       {-  Data stream pattern: [arn:aws.*:kinesis:.*:\\d{12}:.*stream/\\S+] \n\
  \           \n\
  \            }\n\
  \       {-  Consumer pattern: \
   [^(arn):aws.*:kinesis:.*:\\d{12}:.*stream\\/\\[a-zA-Z0-9_.-\\]+\\/consumer\\/\\[a-zA-Z0-9_.-\\]+:\\[0-9\\]+] \n\
  \           \n\
  \            }\n\
  \       }\n\
  \  "]

module DeleteStream : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `AccessDeniedException of access_denied_exception
    | `InvalidArgumentException of invalid_argument_exception
    | `LimitExceededException of limit_exceeded_exception
    | `ResourceInUseException of resource_in_use_exception
    | `ResourceNotFoundException of resource_not_found_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    delete_stream_input ->
    ( Smaws_Lib.Smithy_api.Types.unit_,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `AccessDeniedException of access_denied_exception
      | `InvalidArgumentException of invalid_argument_exception
      | `LimitExceededException of limit_exceeded_exception
      | `ResourceInUseException of resource_in_use_exception
      | `ResourceNotFoundException of resource_not_found_exception ] )
    result
end
[@@ocaml.doc
  "Deletes a Kinesis data stream and all its shards and data. You must shut down any applications \
   that are operating on the stream before you delete the stream. If an application attempts to \
   operate on a deleted stream, it receives the exception [ResourceNotFoundException].\n\n\
  \  When invoking this API, you must use either the [StreamARN] or the [StreamName] parameter, or \
   both. It is recommended that you use the [StreamARN] input parameter when you invoke this API.\n\
  \  \n\
  \    If the stream is in the [ACTIVE] state, you can delete it. After a [DeleteStream] request, \
   the specified stream is in the [DELETING] state until Kinesis Data Streams completes the \
   deletion.\n\
  \    \n\
  \      {b Note:} Kinesis Data Streams might continue to accept data read and write operations, \
   such as [PutRecord], [PutRecords], and [GetRecords], on a stream in the [DELETING] state until \
   the stream deletion is complete.\n\
  \     \n\
  \      When you delete a stream, any shards in that stream are also deleted, and any tags are \
   dissociated from the stream.\n\
  \      \n\
  \       You can use the [DescribeStreamSummary] operation to check the state of the stream, \
   which is returned in [StreamStatus].\n\
  \       \n\
  \         [DeleteStream] has a limit of five transactions per second per account.\n\
  \        "]

module DeregisterStreamConsumer : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `InvalidArgumentException of invalid_argument_exception
    | `LimitExceededException of limit_exceeded_exception
    | `ResourceNotFoundException of resource_not_found_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    deregister_stream_consumer_input ->
    ( Smaws_Lib.Smithy_api.Types.unit_,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `InvalidArgumentException of invalid_argument_exception
      | `LimitExceededException of limit_exceeded_exception
      | `ResourceNotFoundException of resource_not_found_exception ] )
    result
end
[@@ocaml.doc
  "To deregister a consumer, provide its ARN. Alternatively, you can provide the ARN of the data \
   stream and the name you gave the consumer when you registered it. You may also provide all \
   three parameters, as long as they don't conflict with each other. If you don't know the name or \
   ARN of the consumer that you want to deregister, you can use the [ListStreamConsumers] \
   operation to get a list of the descriptions of all the consumers that are currently registered \
   with a given data stream. The description of a consumer contains its name and ARN.\n\n\
  \ This operation has a limit of five transactions per second per stream.\n\
  \ "]

module DescribeLimits : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error | `LimitExceededException of limit_exceeded_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    describe_limits_input ->
    ( describe_limits_output,
      [> Smaws_Lib.Protocols.AwsJson.error | `LimitExceededException of limit_exceeded_exception ]
    )
    result
end
[@@ocaml.doc
  "Describes the shard limits and usage for the account.\n\n\
  \ If you update your account limits, the old limits might be returned for a few minutes.\n\
  \ \n\
  \  This operation has a limit of one transaction per second per account.\n\
  \  "]

module DescribeStream : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `AccessDeniedException of access_denied_exception
    | `InvalidArgumentException of invalid_argument_exception
    | `LimitExceededException of limit_exceeded_exception
    | `ResourceNotFoundException of resource_not_found_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    describe_stream_input ->
    ( describe_stream_output,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `AccessDeniedException of access_denied_exception
      | `InvalidArgumentException of invalid_argument_exception
      | `LimitExceededException of limit_exceeded_exception
      | `ResourceNotFoundException of resource_not_found_exception ] )
    result
end
[@@ocaml.doc
  "Describes the specified Kinesis data stream.\n\n\
  \  This API has been revised. It's highly recommended that you use the [DescribeStreamSummary] \
   API to get a summarized description of the specified Kinesis data stream and the [ListShards] \
   API to list the shards in a specified data stream and obtain information about each shard. \n\
  \  \n\
  \     When invoking this API, you must use either the [StreamARN] or the [StreamName] parameter, \
   or both. It is recommended that you use the [StreamARN] input parameter when you invoke this \
   API.\n\
  \     \n\
  \       The information returned includes the stream name, Amazon Resource Name (ARN), creation \
   time, enhanced metric configuration, and shard map. The shard map is an array of shard objects. \
   For each shard object, there is the hash key and sequence number ranges that the shard spans, \
   and the IDs of any earlier shards that played in a role in creating the shard. Every record \
   ingested in the stream is identified by a sequence number, which is assigned when the record is \
   put into the stream.\n\
  \       \n\
  \        You can limit the number of shards returned by each call. For more information, see \
   {{:https://docs.aws.amazon.com/kinesis/latest/dev/kinesis-using-sdk-java-retrieve-shards.html}Retrieving \
   Shards from a Stream} in the {i Amazon Kinesis Data Streams Developer Guide}.\n\
  \        \n\
  \         There are no guarantees about the chronological order shards returned. To process \
   shards in chronological order, use the ID of the parent shard to track the lineage to the \
   oldest shard.\n\
  \         \n\
  \          This operation has a limit of 10 transactions per second per account.\n\
  \          "]

module DescribeStreamConsumer : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `InvalidArgumentException of invalid_argument_exception
    | `LimitExceededException of limit_exceeded_exception
    | `ResourceNotFoundException of resource_not_found_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    describe_stream_consumer_input ->
    ( describe_stream_consumer_output,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `InvalidArgumentException of invalid_argument_exception
      | `LimitExceededException of limit_exceeded_exception
      | `ResourceNotFoundException of resource_not_found_exception ] )
    result
end
[@@ocaml.doc
  "To get the description of a registered consumer, provide the ARN of the consumer. \
   Alternatively, you can provide the ARN of the data stream and the name you gave the consumer \
   when you registered it. You may also provide all three parameters, as long as they don't \
   conflict with each other. If you don't know the name or ARN of the consumer that you want to \
   describe, you can use the [ListStreamConsumers] operation to get a list of the descriptions of \
   all the consumers that are currently registered with a given data stream.\n\n\
  \ This operation has a limit of 20 transactions per second per stream.\n\
  \ \n\
  \   When making a cross-account call with [DescribeStreamConsumer], make sure to provide the ARN \
   of the consumer. \n\
  \   \n\
  \    "]

module DescribeStreamSummary : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `AccessDeniedException of access_denied_exception
    | `InvalidArgumentException of invalid_argument_exception
    | `LimitExceededException of limit_exceeded_exception
    | `ResourceNotFoundException of resource_not_found_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    describe_stream_summary_input ->
    ( describe_stream_summary_output,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `AccessDeniedException of access_denied_exception
      | `InvalidArgumentException of invalid_argument_exception
      | `LimitExceededException of limit_exceeded_exception
      | `ResourceNotFoundException of resource_not_found_exception ] )
    result
end
[@@ocaml.doc
  "Provides a summarized description of the specified Kinesis data stream without the shard list.\n\n\
  \  When invoking this API, you must use either the [StreamARN] or the [StreamName] parameter, or \
   both. It is recommended that you use the [StreamARN] input parameter when you invoke this API.\n\
  \  \n\
  \    The information returned includes the stream name, Amazon Resource Name (ARN), status, \
   record retention period, approximate creation time, monitoring, encryption details, and open \
   shard count. \n\
  \    \n\
  \      [DescribeStreamSummary] has a limit of 20 transactions per second per account.\n\
  \     "]

module DisableEnhancedMonitoring : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `AccessDeniedException of access_denied_exception
    | `InvalidArgumentException of invalid_argument_exception
    | `LimitExceededException of limit_exceeded_exception
    | `ResourceInUseException of resource_in_use_exception
    | `ResourceNotFoundException of resource_not_found_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    disable_enhanced_monitoring_input ->
    ( enhanced_monitoring_output,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `AccessDeniedException of access_denied_exception
      | `InvalidArgumentException of invalid_argument_exception
      | `LimitExceededException of limit_exceeded_exception
      | `ResourceInUseException of resource_in_use_exception
      | `ResourceNotFoundException of resource_not_found_exception ] )
    result
end
[@@ocaml.doc
  "Disables enhanced monitoring.\n\n\
  \  When invoking this API, you must use either the [StreamARN] or the [StreamName] parameter, or \
   both. It is recommended that you use the [StreamARN] input parameter when you invoke this API.\n\
  \  \n\
  \   "]

module EnableEnhancedMonitoring : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `AccessDeniedException of access_denied_exception
    | `InvalidArgumentException of invalid_argument_exception
    | `LimitExceededException of limit_exceeded_exception
    | `ResourceInUseException of resource_in_use_exception
    | `ResourceNotFoundException of resource_not_found_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    enable_enhanced_monitoring_input ->
    ( enhanced_monitoring_output,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `AccessDeniedException of access_denied_exception
      | `InvalidArgumentException of invalid_argument_exception
      | `LimitExceededException of limit_exceeded_exception
      | `ResourceInUseException of resource_in_use_exception
      | `ResourceNotFoundException of resource_not_found_exception ] )
    result
end
[@@ocaml.doc
  "Enables enhanced Kinesis data stream monitoring for shard-level metrics.\n\n\
  \  When invoking this API, you must use either the [StreamARN] or the [StreamName] parameter, or \
   both. It is recommended that you use the [StreamARN] input parameter when you invoke this API.\n\
  \  \n\
  \   "]

module GetRecords : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
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
    | `ProvisionedThroughputExceededException of provisioned_throughput_exceeded_exception
    | `ResourceNotFoundException of resource_not_found_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    get_records_input ->
    ( get_records_output,
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
      | `ProvisionedThroughputExceededException of provisioned_throughput_exceeded_exception
      | `ResourceNotFoundException of resource_not_found_exception ] )
    result
end
[@@ocaml.doc
  "Gets data records from a Kinesis data stream's shard.\n\n\
  \  When invoking this API, you must use either the [StreamARN] or the [StreamName] parameter, or \
   both. It is recommended that you use the [StreamARN] input parameter when you invoke this API.\n\
  \  \n\
  \    Specify a shard iterator using the [ShardIterator] parameter. The shard iterator specifies \
   the position in the shard from which you want to start reading data records sequentially. If \
   there are no records available in the portion of the shard that the iterator points to, \
   [GetRecords] returns an empty list. It might take multiple calls to get to a portion of the \
   shard that contains records.\n\
  \    \n\
  \     You can scale by provisioning multiple shards per stream while considering service limits \
   (for more information, see \
   {{:https://docs.aws.amazon.com/kinesis/latest/dev/service-sizes-and-limits.html}Amazon Kinesis \
   Data Streams Limits} in the {i Amazon Kinesis Data Streams Developer Guide}). Your application \
   should have one thread per shard, each reading continuously from its stream. To read from a \
   stream continually, call [GetRecords] in a loop. Use [GetShardIterator] to get the shard \
   iterator to specify in the first [GetRecords] call. [GetRecords] returns a new shard iterator \
   in [NextShardIterator]. Specify the shard iterator returned in [NextShardIterator] in \
   subsequent calls to [GetRecords]. If the shard has been closed, the shard iterator can't return \
   more data and [GetRecords] returns [null] in [NextShardIterator]. You can terminate the loop \
   when the shard is closed, or when the shard iterator reaches the record with the sequence \
   number or other attribute that marks it as the last record to process.\n\
  \     \n\
  \      Each data record can be up to 1 MiB in size, and each shard can read up to 2 MiB per \
   second. You can ensure that your calls don't exceed the maximum supported size or throughput by \
   using the [Limit] parameter to specify the maximum number of records that [GetRecords] can \
   return. Consider your average record size when determining this limit. The maximum number of \
   records that can be returned per call is 10,000.\n\
  \      \n\
  \       The size of the data returned by [GetRecords] varies depending on the utilization of the \
   shard. It is recommended that consumer applications retrieve records via the [GetRecords] \
   command using the 5 TPS limit to remain caught up. Retrieving records less frequently can lead \
   to consumer applications falling behind. The maximum size of data that [GetRecords] can return \
   is 10 MiB. If a call returns this amount of data, subsequent calls made within the next 5 \
   seconds throw [ProvisionedThroughputExceededException]. If there is insufficient provisioned \
   throughput on the stream, subsequent calls made within the next 1 second throw \
   [ProvisionedThroughputExceededException]. [GetRecords] doesn't return any data when it throws \
   an exception. For this reason, we recommend that you wait 1 second between calls to \
   [GetRecords]. However, it's possible that the application will get exceptions for longer than 1 \
   second.\n\
  \       \n\
  \        To detect whether the application is falling behind in processing, you can use the \
   [MillisBehindLatest] response attribute. You can also monitor the stream using CloudWatch \
   metrics and other mechanisms (see \
   {{:https://docs.aws.amazon.com/kinesis/latest/dev/monitoring.html}Monitoring} in the {i Amazon \
   Kinesis Data Streams Developer Guide}).\n\
  \        \n\
  \         Each Amazon Kinesis record includes a value, [ApproximateArrivalTimestamp], that is \
   set when a stream successfully receives and stores a record. This is commonly referred to as a \
   server-side time stamp, whereas a client-side time stamp is set when a data producer creates or \
   sends the record to a stream (a data producer is any data source putting data records into a \
   stream, for example with [PutRecords]). The time stamp has millisecond precision. There are no \
   guarantees about the time stamp accuracy, or that the time stamp is always increasing. For \
   example, records in a shard or across a stream might have time stamps that are out of order.\n\
  \         \n\
  \          This operation has a limit of five transactions per second per shard.\n\
  \          "]

module GetResourcePolicy : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `AccessDeniedException of access_denied_exception
    | `InvalidArgumentException of invalid_argument_exception
    | `LimitExceededException of limit_exceeded_exception
    | `ResourceInUseException of resource_in_use_exception
    | `ResourceNotFoundException of resource_not_found_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    get_resource_policy_input ->
    ( get_resource_policy_output,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `AccessDeniedException of access_denied_exception
      | `InvalidArgumentException of invalid_argument_exception
      | `LimitExceededException of limit_exceeded_exception
      | `ResourceInUseException of resource_in_use_exception
      | `ResourceNotFoundException of resource_not_found_exception ] )
    result
end
[@@ocaml.doc
  "Returns a policy attached to the specified data stream or consumer. Request patterns can be one \
   of the following:\n\n\
  \ {ul\n\
  \       {-  Data stream pattern: [arn:aws.*:kinesis:.*:\\d{12}:.*stream/\\S+] \n\
  \           \n\
  \            }\n\
  \       {-   Consumer pattern: \
   [^(arn):aws.*:kinesis:.*:\\d{12}:.*stream\\/\\[a-zA-Z0-9_.-\\]+\\/consumer\\/\\[a-zA-Z0-9_.-\\]+:\\[0-9\\]+] \n\
  \           \n\
  \            }\n\
  \       }\n\
  \  "]

module GetShardIterator : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `AccessDeniedException of access_denied_exception
    | `InternalFailureException of internal_failure_exception
    | `InvalidArgumentException of invalid_argument_exception
    | `ProvisionedThroughputExceededException of provisioned_throughput_exceeded_exception
    | `ResourceNotFoundException of resource_not_found_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    get_shard_iterator_input ->
    ( get_shard_iterator_output,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `AccessDeniedException of access_denied_exception
      | `InternalFailureException of internal_failure_exception
      | `InvalidArgumentException of invalid_argument_exception
      | `ProvisionedThroughputExceededException of provisioned_throughput_exceeded_exception
      | `ResourceNotFoundException of resource_not_found_exception ] )
    result
end
[@@ocaml.doc
  "Gets an Amazon Kinesis shard iterator. A shard iterator expires 5 minutes after it is returned \
   to the requester.\n\n\
  \  When invoking this API, you must use either the [StreamARN] or the [StreamName] parameter, or \
   both. It is recommended that you use the [StreamARN] input parameter when you invoke this API.\n\
  \  \n\
  \    A shard iterator specifies the shard position from which to start reading data records \
   sequentially. The position is specified using the sequence number of a data record in a shard. \
   A sequence number is the identifier associated with every record ingested in the stream, and is \
   assigned when a record is put into the stream. Each stream has one or more shards.\n\
  \    \n\
  \     You must specify the shard iterator type. For example, you can set the [ShardIteratorType] \
   parameter to read exactly from the position denoted by a specific sequence number by using the \
   [AT_SEQUENCE_NUMBER] shard iterator type. Alternatively, the parameter can read right after the \
   sequence number by using the [AFTER_SEQUENCE_NUMBER] shard iterator type, using sequence \
   numbers returned by earlier calls to [PutRecord], [PutRecords], [GetRecords], or \
   [DescribeStream]. In the request, you can specify the shard iterator type [AT_TIMESTAMP] to \
   read records from an arbitrary point in time, [TRIM_HORIZON] to cause [ShardIterator] to point \
   to the last untrimmed record in the shard in the system (the oldest data record in the shard), \
   or [LATEST] so that you always read the most recent data in the shard. \n\
  \     \n\
  \      When you read repeatedly from a stream, use a [GetShardIterator] request to get the first \
   shard iterator for use in your first [GetRecords] request and for subsequent reads use the \
   shard iterator returned by the [GetRecords] request in [NextShardIterator]. A new shard \
   iterator is returned by every [GetRecords] request in [NextShardIterator], which you use in the \
   [ShardIterator] parameter of the next [GetRecords] request. \n\
  \      \n\
  \       If a [GetShardIterator] request is made too often, you receive a \
   [ProvisionedThroughputExceededException]. For more information about throughput limits, see \
   [GetRecords], and \
   {{:https://docs.aws.amazon.com/kinesis/latest/dev/service-sizes-and-limits.html}Streams Limits} \
   in the {i Amazon Kinesis Data Streams Developer Guide}.\n\
  \       \n\
  \        If the shard is closed, [GetShardIterator] returns a valid iterator for the last \
   sequence number of the shard. A shard can be closed as a result of using [SplitShard] or \
   [MergeShards].\n\
  \        \n\
  \          [GetShardIterator] has a limit of five transactions per second per account per open \
   shard.\n\
  \         "]

module IncreaseStreamRetentionPeriod : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `AccessDeniedException of access_denied_exception
    | `InvalidArgumentException of invalid_argument_exception
    | `LimitExceededException of limit_exceeded_exception
    | `ResourceInUseException of resource_in_use_exception
    | `ResourceNotFoundException of resource_not_found_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    increase_stream_retention_period_input ->
    ( Smaws_Lib.Smithy_api.Types.unit_,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `AccessDeniedException of access_denied_exception
      | `InvalidArgumentException of invalid_argument_exception
      | `LimitExceededException of limit_exceeded_exception
      | `ResourceInUseException of resource_in_use_exception
      | `ResourceNotFoundException of resource_not_found_exception ] )
    result
end
[@@ocaml.doc
  "Increases the Kinesis data stream's retention period, which is the length of time data records \
   are accessible after they are added to the stream. The maximum value of a stream's retention \
   period is 8760 hours (365 days).\n\n\
  \  When invoking this API, you must use either the [StreamARN] or the [StreamName] parameter, or \
   both. It is recommended that you use the [StreamARN] input parameter when you invoke this API.\n\
  \  \n\
  \    If you choose a longer stream retention period, this operation increases the time period \
   during which records that have not yet expired are accessible. However, it does not make \
   previous, expired data (older than the stream's previous retention period) accessible after the \
   operation has been called. For example, if a stream's retention period is set to 24 hours and \
   is increased to 168 hours, any data that is older than 24 hours remains inaccessible to \
   consumer applications.\n\
  \    "]

module ListShards : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `AccessDeniedException of access_denied_exception
    | `ExpiredNextTokenException of expired_next_token_exception
    | `InvalidArgumentException of invalid_argument_exception
    | `LimitExceededException of limit_exceeded_exception
    | `ResourceInUseException of resource_in_use_exception
    | `ResourceNotFoundException of resource_not_found_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    list_shards_input ->
    ( list_shards_output,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `AccessDeniedException of access_denied_exception
      | `ExpiredNextTokenException of expired_next_token_exception
      | `InvalidArgumentException of invalid_argument_exception
      | `LimitExceededException of limit_exceeded_exception
      | `ResourceInUseException of resource_in_use_exception
      | `ResourceNotFoundException of resource_not_found_exception ] )
    result
end
[@@ocaml.doc
  "Lists the shards in a stream and provides information about each shard. This operation has a \
   limit of 1000 transactions per second per data stream.\n\n\
  \  When invoking this API, you must use either the [StreamARN] or the [StreamName] parameter, or \
   both. It is recommended that you use the [StreamARN] input parameter when you invoke this API.\n\
  \  \n\
  \    This action does not list expired shards. For information about expired shards, see \
   {{:https://docs.aws.amazon.com/streams/latest/dev/kinesis-using-sdk-java-after-resharding.html#kinesis-using-sdk-java-resharding-data-routing}Data \
   Routing, Data Persistence, and Shard State after a Reshard}. \n\
  \    \n\
  \      This API is a new operation that is used by the Amazon Kinesis Client Library (KCL). If \
   you have a fine-grained IAM policy that only allows specific operations, you must update your \
   policy to allow calls to this API. For more information, see \
   {{:https://docs.aws.amazon.com/streams/latest/dev/controlling-access.html}Controlling Access to \
   Amazon Kinesis Data Streams Resources Using IAM}.\n\
  \      \n\
  \       "]

module ListStreamConsumers : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `ExpiredNextTokenException of expired_next_token_exception
    | `InvalidArgumentException of invalid_argument_exception
    | `LimitExceededException of limit_exceeded_exception
    | `ResourceInUseException of resource_in_use_exception
    | `ResourceNotFoundException of resource_not_found_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    list_stream_consumers_input ->
    ( list_stream_consumers_output,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `ExpiredNextTokenException of expired_next_token_exception
      | `InvalidArgumentException of invalid_argument_exception
      | `LimitExceededException of limit_exceeded_exception
      | `ResourceInUseException of resource_in_use_exception
      | `ResourceNotFoundException of resource_not_found_exception ] )
    result
end
[@@ocaml.doc
  "Lists the consumers registered to receive data from a stream using enhanced fan-out, and \
   provides information about each consumer.\n\n\
  \ This operation has a limit of 5 transactions per second per stream.\n\
  \ "]

module ListStreams : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `ExpiredNextTokenException of expired_next_token_exception
    | `InvalidArgumentException of invalid_argument_exception
    | `LimitExceededException of limit_exceeded_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    list_streams_input ->
    ( list_streams_output,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `ExpiredNextTokenException of expired_next_token_exception
      | `InvalidArgumentException of invalid_argument_exception
      | `LimitExceededException of limit_exceeded_exception ] )
    result
end
[@@ocaml.doc
  "Lists your Kinesis data streams.\n\n\
  \ The number of streams may be too large to return from a single call to [ListStreams]. You can \
   limit the number of returned streams using the [Limit] parameter. If you do not specify a value \
   for the [Limit] parameter, Kinesis Data Streams uses the default limit, which is currently 100.\n\
  \ \n\
  \  You can detect if there are more streams available to list by using the [HasMoreStreams] flag \
   from the returned output. If there are more streams available, you can request more streams by \
   using the name of the last stream returned by the [ListStreams] request in the \
   [ExclusiveStartStreamName] parameter in a subsequent request to [ListStreams]. The group of \
   stream names returned by the subsequent request is then added to the list. You can continue \
   this process until all the stream names have been collected in the list. \n\
  \  \n\
  \    [ListStreams] has a limit of five transactions per second per account.\n\
  \   "]

module ListTagsForResource : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `AccessDeniedException of access_denied_exception
    | `InvalidArgumentException of invalid_argument_exception
    | `LimitExceededException of limit_exceeded_exception
    | `ResourceInUseException of resource_in_use_exception
    | `ResourceNotFoundException of resource_not_found_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    list_tags_for_resource_input ->
    ( list_tags_for_resource_output,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `AccessDeniedException of access_denied_exception
      | `InvalidArgumentException of invalid_argument_exception
      | `LimitExceededException of limit_exceeded_exception
      | `ResourceInUseException of resource_in_use_exception
      | `ResourceNotFoundException of resource_not_found_exception ] )
    result
end
[@@ocaml.doc
  "List all tags added to the specified Kinesis resource. Each tag is a label consisting of a \
   user-defined key and value. Tags can help you manage, identify, organize, search for, and \
   filter resources.\n\n\
  \ For more information about tagging Kinesis resources, see \
   {{:https://docs.aws.amazon.com/streams/latest/dev/tagging.html}Tag your Amazon Kinesis Data \
   Streams resources}.\n\
  \ "]

module ListTagsForStream : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `AccessDeniedException of access_denied_exception
    | `InvalidArgumentException of invalid_argument_exception
    | `LimitExceededException of limit_exceeded_exception
    | `ResourceNotFoundException of resource_not_found_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    list_tags_for_stream_input ->
    ( list_tags_for_stream_output,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `AccessDeniedException of access_denied_exception
      | `InvalidArgumentException of invalid_argument_exception
      | `LimitExceededException of limit_exceeded_exception
      | `ResourceNotFoundException of resource_not_found_exception ] )
    result
end
[@@ocaml.doc
  "Lists the tags for the specified Kinesis data stream. This operation has a limit of five \
   transactions per second per account.\n\n\
  \  When invoking this API, you must use either the [StreamARN] or the [StreamName] parameter, or \
   both. It is recommended that you use the [StreamARN] input parameter when you invoke this API.\n\
  \  \n\
  \   "]

module MergeShards : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `AccessDeniedException of access_denied_exception
    | `InvalidArgumentException of invalid_argument_exception
    | `LimitExceededException of limit_exceeded_exception
    | `ResourceInUseException of resource_in_use_exception
    | `ResourceNotFoundException of resource_not_found_exception
    | `ValidationException of validation_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    merge_shards_input ->
    ( Smaws_Lib.Smithy_api.Types.unit_,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `AccessDeniedException of access_denied_exception
      | `InvalidArgumentException of invalid_argument_exception
      | `LimitExceededException of limit_exceeded_exception
      | `ResourceInUseException of resource_in_use_exception
      | `ResourceNotFoundException of resource_not_found_exception
      | `ValidationException of validation_exception ] )
    result
end
[@@ocaml.doc
  "Merges two adjacent shards in a Kinesis data stream and combines them into a single shard to \
   reduce the stream's capacity to ingest and transport data. This API is only supported for the \
   data streams with the provisioned capacity mode. Two shards are considered adjacent if the \
   union of the hash key ranges for the two shards form a contiguous set with no gaps. For \
   example, if you have two shards, one with a hash key range of 276...381 and the other with a \
   hash key range of 382...454, then you could merge these two shards into a single shard that \
   would have a hash key range of 276...454. After the merge, the single child shard receives data \
   for all hash key values covered by the two parent shards.\n\n\
  \  When invoking this API, you must use either the [StreamARN] or the [StreamName] parameter, or \
   both. It is recommended that you use the [StreamARN] input parameter when you invoke this API.\n\
  \  \n\
  \     [MergeShards] is called when there is a need to reduce the overall capacity of a stream \
   because of excess capacity that is not being used. You must specify the shard to be merged and \
   the adjacent shard for a stream. For more information about merging shards, see \
   {{:https://docs.aws.amazon.com/kinesis/latest/dev/kinesis-using-sdk-java-resharding-merge.html}Merge \
   Two Shards} in the {i Amazon Kinesis Data Streams Developer Guide}.\n\
  \    \n\
  \     If the stream is in the [ACTIVE] state, you can call [MergeShards]. If a stream is in the \
   [CREATING], [UPDATING], or [DELETING] state, [MergeShards] returns a [ResourceInUseException]. \
   If the specified stream does not exist, [MergeShards] returns a [ResourceNotFoundException]. \n\
  \     \n\
  \      You can use [DescribeStreamSummary] to check the state of the stream, which is returned \
   in [StreamStatus].\n\
  \      \n\
  \        [MergeShards] is an asynchronous operation. Upon receiving a [MergeShards] request, \
   Amazon Kinesis Data Streams immediately returns a response and sets the [StreamStatus] to \
   [UPDATING]. After the operation is completed, Kinesis Data Streams sets the [StreamStatus] to \
   [ACTIVE]. Read and write operations continue to work while the stream is in the [UPDATING] \
   state. \n\
  \       \n\
  \        You use [DescribeStreamSummary] and the [ListShards] APIs to determine the shard IDs \
   that are specified in the [MergeShards] request. \n\
  \        \n\
  \         If you try to operate on too many streams in parallel using [CreateStream], \
   [DeleteStream], [MergeShards], or [SplitShard], you receive a [LimitExceededException]. \n\
  \         \n\
  \           [MergeShards] has a limit of five transactions per second per account.\n\
  \          "]

module PutRecord : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `AccessDeniedException of access_denied_exception
    | `InternalFailureException of internal_failure_exception
    | `InvalidArgumentException of invalid_argument_exception
    | `KMSAccessDeniedException of kms_access_denied_exception
    | `KMSDisabledException of kms_disabled_exception
    | `KMSInvalidStateException of kms_invalid_state_exception
    | `KMSNotFoundException of kms_not_found_exception
    | `KMSOptInRequired of kms_opt_in_required
    | `KMSThrottlingException of kms_throttling_exception
    | `ProvisionedThroughputExceededException of provisioned_throughput_exceeded_exception
    | `ResourceNotFoundException of resource_not_found_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    put_record_input ->
    ( put_record_output,
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
      | `ProvisionedThroughputExceededException of provisioned_throughput_exceeded_exception
      | `ResourceNotFoundException of resource_not_found_exception ] )
    result
end
[@@ocaml.doc
  "Writes a single data record into an Amazon Kinesis data stream. Call [PutRecord] to send data \
   into the stream for real-time ingestion and subsequent processing, one record at a time. Each \
   shard can support writes up to 1,000 records per second, up to a maximum data write total of 1 \
   MiB per second.\n\n\
  \  When invoking this API, you must use either the [StreamARN] or the [StreamName] parameter, or \
   both. It is recommended that you use the [StreamARN] input parameter when you invoke this API.\n\
  \  \n\
  \    You must specify the name of the stream that captures, stores, and transports the data; a \
   partition key; and the data blob itself.\n\
  \    \n\
  \     The data blob can be any type of data; for example, a segment from a log file, \
   geographic/location data, website clickstream data, and so on.\n\
  \     \n\
  \      The partition key is used by Kinesis Data Streams to distribute data across shards. \
   Kinesis Data Streams segregates the data records that belong to a stream into multiple shards, \
   using the partition key associated with each data record to determine the shard to which a \
   given data record belongs.\n\
  \      \n\
  \       Partition keys are Unicode strings, with a maximum length limit of 256 characters for \
   each key. An MD5 hash function is used to map partition keys to 128-bit integer values and to \
   map associated data records to shards using the hash key ranges of the shards. You can override \
   hashing the partition key to determine the shard by explicitly specifying a hash value using \
   the [ExplicitHashKey] parameter. For more information, see \
   {{:https://docs.aws.amazon.com/kinesis/latest/dev/developing-producers-with-sdk.html#kinesis-using-sdk-java-add-data-to-stream}Adding \
   Data to a Stream} in the {i Amazon Kinesis Data Streams Developer Guide}.\n\
  \       \n\
  \         [PutRecord] returns the shard ID of where the data record was placed and the sequence \
   number that was assigned to the data record.\n\
  \        \n\
  \         Sequence numbers increase over time and are specific to a shard within a stream, not \
   across all shards within a stream. To guarantee strictly increasing ordering, write serially to \
   a shard and use the [SequenceNumberForOrdering] parameter. For more information, see \
   {{:https://docs.aws.amazon.com/kinesis/latest/dev/developing-producers-with-sdk.html#kinesis-using-sdk-java-add-data-to-stream}Adding \
   Data to a Stream} in the {i Amazon Kinesis Data Streams Developer Guide}.\n\
  \         \n\
  \           After you write a record to a stream, you cannot modify that record or its order \
   within the stream.\n\
  \           \n\
  \             If a [PutRecord] request cannot be processed because of insufficient provisioned \
   throughput on the shard involved in the request, [PutRecord] throws \
   [ProvisionedThroughputExceededException]. \n\
  \             \n\
  \              By default, data records are accessible for 24 hours from the time that they are \
   added to a stream. You can use [IncreaseStreamRetentionPeriod] or \
   [DecreaseStreamRetentionPeriod] to modify this retention period.\n\
  \              "]

module PutRecords : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `AccessDeniedException of access_denied_exception
    | `InternalFailureException of internal_failure_exception
    | `InvalidArgumentException of invalid_argument_exception
    | `KMSAccessDeniedException of kms_access_denied_exception
    | `KMSDisabledException of kms_disabled_exception
    | `KMSInvalidStateException of kms_invalid_state_exception
    | `KMSNotFoundException of kms_not_found_exception
    | `KMSOptInRequired of kms_opt_in_required
    | `KMSThrottlingException of kms_throttling_exception
    | `ProvisionedThroughputExceededException of provisioned_throughput_exceeded_exception
    | `ResourceNotFoundException of resource_not_found_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    put_records_input ->
    ( put_records_output,
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
      | `ProvisionedThroughputExceededException of provisioned_throughput_exceeded_exception
      | `ResourceNotFoundException of resource_not_found_exception ] )
    result
end
[@@ocaml.doc
  "Writes multiple data records into a Kinesis data stream in a single call (also referred to as a \
   [PutRecords] request). Use this operation to send data into the stream for data ingestion and \
   processing. \n\n\
  \  When invoking this API, you must use either the [StreamARN] or the [StreamName] parameter, or \
   both. It is recommended that you use the [StreamARN] input parameter when you invoke this API.\n\
  \  \n\
  \    Each [PutRecords] request can support up to 500 records. Each record in the request can be \
   as large as 1 MiB, up to a limit of 5 MiB for the entire request, including partition keys. \
   Each shard can support writes up to 1,000 records per second, up to a maximum data write total \
   of 1 MiB per second.\n\
  \    \n\
  \     You must specify the name of the stream that captures, stores, and transports the data; \
   and an array of request [Records], with each record in the array requiring a partition key and \
   data blob. The record size limit applies to the total size of the partition key and data blob.\n\
  \     \n\
  \      The data blob can be any type of data; for example, a segment from a log file, \
   geographic/location data, website clickstream data, and so on.\n\
  \      \n\
  \       The partition key is used by Kinesis Data Streams as input to a hash function that maps \
   the partition key and associated data to a specific shard. An MD5 hash function is used to map \
   partition keys to 128-bit integer values and to map associated data records to shards. As a \
   result of this hashing mechanism, all data records with the same partition key map to the same \
   shard within the stream. For more information, see \
   {{:https://docs.aws.amazon.com/kinesis/latest/dev/developing-producers-with-sdk.html#kinesis-using-sdk-java-add-data-to-stream}Adding \
   Data to a Stream} in the {i Amazon Kinesis Data Streams Developer Guide}.\n\
  \       \n\
  \        Each record in the [Records] array may include an optional parameter, \
   [ExplicitHashKey], which overrides the partition key to shard mapping. This parameter allows a \
   data producer to determine explicitly the shard where the record is stored. For more \
   information, see \
   {{:https://docs.aws.amazon.com/kinesis/latest/dev/developing-producers-with-sdk.html#kinesis-using-sdk-java-putrecords}Adding \
   Multiple Records with PutRecords} in the {i Amazon Kinesis Data Streams Developer Guide}.\n\
  \        \n\
  \         The [PutRecords] response includes an array of response [Records]. Each record in the \
   response array directly correlates with a record in the request array using natural ordering, \
   from the top to the bottom of the request and response. The response [Records] array always \
   includes the same number of records as the request array.\n\
  \         \n\
  \          The response [Records] array includes both successfully and unsuccessfully processed \
   records. Kinesis Data Streams attempts to process all records in each [PutRecords] request. A \
   single record failure does not stop the processing of subsequent records. As a result, \
   PutRecords doesn't guarantee the ordering of records. If you need to read records in the same \
   order they are written to the stream, use [PutRecord] instead of [PutRecords], and write to the \
   same shard.\n\
  \          \n\
  \           A successfully processed record includes [ShardId] and [SequenceNumber] values. The \
   [ShardId] parameter identifies the shard in the stream where the record is stored. The \
   [SequenceNumber] parameter is an identifier assigned to the put record, unique to all records \
   in the stream.\n\
  \           \n\
  \            An unsuccessfully processed record includes [ErrorCode] and [ErrorMessage] values. \
   [ErrorCode] reflects the type of error and can be one of the following values: \
   [ProvisionedThroughputExceededException] or [InternalFailure]. [ErrorMessage] provides more \
   detailed information about the [ProvisionedThroughputExceededException] exception including the \
   account ID, stream name, and shard ID of the record that was throttled. For more information \
   about partially successful responses, see \
   {{:https://docs.aws.amazon.com/kinesis/latest/dev/kinesis-using-sdk-java-add-data-to-stream.html#kinesis-using-sdk-java-putrecords}Adding \
   Multiple Records with PutRecords} in the {i Amazon Kinesis Data Streams Developer Guide}.\n\
  \            \n\
  \              After you write a record to a stream, you cannot modify that record or its order \
   within the stream.\n\
  \              \n\
  \                By default, data records are accessible for 24 hours from the time that they \
   are added to a stream. You can use [IncreaseStreamRetentionPeriod] or \
   [DecreaseStreamRetentionPeriod] to modify this retention period.\n\
  \                "]

module PutResourcePolicy : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `AccessDeniedException of access_denied_exception
    | `InvalidArgumentException of invalid_argument_exception
    | `LimitExceededException of limit_exceeded_exception
    | `ResourceInUseException of resource_in_use_exception
    | `ResourceNotFoundException of resource_not_found_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    put_resource_policy_input ->
    ( Smaws_Lib.Smithy_api.Types.unit_,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `AccessDeniedException of access_denied_exception
      | `InvalidArgumentException of invalid_argument_exception
      | `LimitExceededException of limit_exceeded_exception
      | `ResourceInUseException of resource_in_use_exception
      | `ResourceNotFoundException of resource_not_found_exception ] )
    result
end
[@@ocaml.doc
  "Attaches a resource-based policy to a data stream or registered consumer. If you are using an \
   identity other than the root user of the Amazon Web Services account that owns the resource, \
   the calling identity must have the [PutResourcePolicy] permissions on the specified Kinesis \
   Data Streams resource and belong to the owner's account in order to use this operation. If you \
   don't have [PutResourcePolicy] permissions, Amazon Kinesis Data Streams returns a [403 Access \
   Denied error]. If you receive a [ResourceNotFoundException], check to see if you passed a valid \
   stream or consumer resource. \n\n\
  \  Request patterns can be one of the following:\n\
  \ \n\
  \  {ul\n\
  \        {-  Data stream pattern: [arn:aws.*:kinesis:.*:\\d{12}:.*stream/\\S+] \n\
  \            \n\
  \             }\n\
  \        {-  Consumer pattern: \
   [^(arn):aws.*:kinesis:.*:\\d{12}:.*stream\\/\\[a-zA-Z0-9_.-\\]+\\/consumer\\/\\[a-zA-Z0-9_.-\\]+:\\[0-9\\]+] \n\
  \            \n\
  \             }\n\
  \        }\n\
  \   For more information, see \
   {{:https://docs.aws.amazon.com/streams/latest/dev/controlling-access.html}Controlling Access to \
   Amazon Kinesis Data Streams Resources Using IAM}.\n\
  \   "]

module RegisterStreamConsumer : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `InvalidArgumentException of invalid_argument_exception
    | `LimitExceededException of limit_exceeded_exception
    | `ResourceInUseException of resource_in_use_exception
    | `ResourceNotFoundException of resource_not_found_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    register_stream_consumer_input ->
    ( register_stream_consumer_output,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `InvalidArgumentException of invalid_argument_exception
      | `LimitExceededException of limit_exceeded_exception
      | `ResourceInUseException of resource_in_use_exception
      | `ResourceNotFoundException of resource_not_found_exception ] )
    result
end
[@@ocaml.doc
  "Registers a consumer with a Kinesis data stream. When you use this operation, the consumer you \
   register can then call [SubscribeToShard] to receive data from the stream using enhanced \
   fan-out, at a rate of up to 2 MiB per second for every shard you subscribe to. This rate is \
   unaffected by the total number of consumers that read from the same stream.\n\n\
  \ You can add tags to the registered consumer when making a [RegisterStreamConsumer] request by \
   setting the [Tags] parameter. If you pass the [Tags] parameter, in addition to having the \
   [kinesis:RegisterStreamConsumer] permission, you must also have the [kinesis:TagResource] \
   permission for the consumer that will be registered. Tags will take effect from the [CREATING] \
   status of the consumer.\n\
  \ \n\
  \  You can register up to 20 consumers per stream. A given consumer can only be registered with \
   one stream at a time.\n\
  \  \n\
  \   For an example of how to use this operation, see \
   {{:https://docs.aws.amazon.com/streams/latest/dev/building-enhanced-consumers-api.html}Enhanced \
   Fan-Out Using the Kinesis Data Streams API}.\n\
  \   \n\
  \    The use of this operation has a limit of five transactions per second per account. Also, \
   only 5 consumers can be created simultaneously. In other words, you cannot have more than 5 \
   consumers in a [CREATING] status at the same time. Registering a 6th consumer while there are 5 \
   in a [CREATING] status results in a [LimitExceededException].\n\
  \    "]

module RemoveTagsFromStream : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `AccessDeniedException of access_denied_exception
    | `InvalidArgumentException of invalid_argument_exception
    | `LimitExceededException of limit_exceeded_exception
    | `ResourceInUseException of resource_in_use_exception
    | `ResourceNotFoundException of resource_not_found_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    remove_tags_from_stream_input ->
    ( Smaws_Lib.Smithy_api.Types.unit_,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `AccessDeniedException of access_denied_exception
      | `InvalidArgumentException of invalid_argument_exception
      | `LimitExceededException of limit_exceeded_exception
      | `ResourceInUseException of resource_in_use_exception
      | `ResourceNotFoundException of resource_not_found_exception ] )
    result
end
[@@ocaml.doc
  "Removes tags from the specified Kinesis data stream. Removed tags are deleted and cannot be \
   recovered after this operation successfully completes.\n\n\
  \  When invoking this API, you must use either the [StreamARN] or the [StreamName] parameter, or \
   both. It is recommended that you use the [StreamARN] input parameter when you invoke this API.\n\
  \  \n\
  \    If you specify a tag that does not exist, it is ignored.\n\
  \    \n\
  \      [RemoveTagsFromStream] has a limit of five transactions per second per account.\n\
  \     "]

module SplitShard : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `AccessDeniedException of access_denied_exception
    | `InvalidArgumentException of invalid_argument_exception
    | `LimitExceededException of limit_exceeded_exception
    | `ResourceInUseException of resource_in_use_exception
    | `ResourceNotFoundException of resource_not_found_exception
    | `ValidationException of validation_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    split_shard_input ->
    ( Smaws_Lib.Smithy_api.Types.unit_,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `AccessDeniedException of access_denied_exception
      | `InvalidArgumentException of invalid_argument_exception
      | `LimitExceededException of limit_exceeded_exception
      | `ResourceInUseException of resource_in_use_exception
      | `ResourceNotFoundException of resource_not_found_exception
      | `ValidationException of validation_exception ] )
    result
end
[@@ocaml.doc
  "Splits a shard into two new shards in the Kinesis data stream, to increase the stream's \
   capacity to ingest and transport data. [SplitShard] is called when there is a need to increase \
   the overall capacity of a stream because of an expected increase in the volume of data records \
   being ingested. This API is only supported for the data streams with the provisioned capacity \
   mode.\n\n\
  \  When invoking this API, you must use either the [StreamARN] or the [StreamName] parameter, or \
   both. It is recommended that you use the [StreamARN] input parameter when you invoke this API.\n\
  \  \n\
  \    You can also use [SplitShard] when a shard appears to be approaching its maximum \
   utilization; for example, the producers sending data into the specific shard are suddenly \
   sending more than previously anticipated. You can also call [SplitShard] to increase stream \
   capacity, so that more Kinesis Data Streams applications can simultaneously read data from the \
   stream for real-time processing. \n\
  \    \n\
  \     You must specify the shard to be split and the new hash key, which is the position in the \
   shard where the shard gets split in two. In many cases, the new hash key might be the average \
   of the beginning and ending hash key, but it can be any hash key value in the range being \
   mapped into the shard. For more information, see \
   {{:https://docs.aws.amazon.com/kinesis/latest/dev/kinesis-using-sdk-java-resharding-split.html}Split \
   a Shard} in the {i Amazon Kinesis Data Streams Developer Guide}.\n\
  \     \n\
  \      You can use [DescribeStreamSummary] and the [ListShards] APIs to determine the shard ID \
   and hash key values for the [ShardToSplit] and [NewStartingHashKey] parameters that are \
   specified in the [SplitShard] request.\n\
  \      \n\
  \        [SplitShard] is an asynchronous operation. Upon receiving a [SplitShard] request, \
   Kinesis Data Streams immediately returns a response and sets the stream status to [UPDATING]. \
   After the operation is completed, Kinesis Data Streams sets the stream status to [ACTIVE]. Read \
   and write operations continue to work while the stream is in the [UPDATING] state. \n\
  \       \n\
  \        You can use [DescribeStreamSummary] to check the status of the stream, which is \
   returned in [StreamStatus]. If the stream is in the [ACTIVE] state, you can call [SplitShard]. \n\
  \        \n\
  \         If the specified stream does not exist, [DescribeStreamSummary] returns a \
   [ResourceNotFoundException]. If you try to create more shards than are authorized for your \
   account, you receive a [LimitExceededException]. \n\
  \         \n\
  \          For the default shard limit for an Amazon Web Services account, see \
   {{:https://docs.aws.amazon.com/kinesis/latest/dev/service-sizes-and-limits.html}Kinesis Data \
   Streams Limits} in the {i Amazon Kinesis Data Streams Developer Guide}. To increase this limit, \
   {{:https://docs.aws.amazon.com/general/latest/gr/aws_service_limits.html}contact Amazon Web \
   Services Support}.\n\
  \          \n\
  \           If you try to operate on too many streams simultaneously using [CreateStream], \
   [DeleteStream], [MergeShards], and/or [SplitShard], you receive a [LimitExceededException]. \n\
  \           \n\
  \             [SplitShard] has a limit of five transactions per second per account.\n\
  \            "]

module StartStreamEncryption : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
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
    | `ResourceNotFoundException of resource_not_found_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    start_stream_encryption_input ->
    ( Smaws_Lib.Smithy_api.Types.unit_,
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
      | `ResourceNotFoundException of resource_not_found_exception ] )
    result
end
[@@ocaml.doc
  "Enables or updates server-side encryption using an Amazon Web Services KMS key for a specified \
   stream. \n\n\
  \  When invoking this API, you must use either the [StreamARN] or the [StreamName] parameter, or \
   both. It is recommended that you use the [StreamARN] input parameter when you invoke this API.\n\
  \  \n\
  \    Starting encryption is an asynchronous operation. Upon receiving the request, Kinesis Data \
   Streams returns immediately and sets the status of the stream to [UPDATING]. After the update \
   is complete, Kinesis Data Streams sets the status of the stream back to [ACTIVE]. Updating or \
   applying encryption normally takes a few seconds to complete, but it can take minutes. You can \
   continue to read and write data to your stream while its status is [UPDATING]. Once the status \
   of the stream is [ACTIVE], encryption begins for records written to the stream. \n\
  \    \n\
  \     API Limits: You can successfully apply a new Amazon Web Services KMS key for server-side \
   encryption 25 times in a rolling 24-hour period.\n\
  \     \n\
  \      Note: It can take up to 5 seconds after the stream is in an [ACTIVE] status before all \
   records written to the stream are encrypted. After you enable encryption, you can verify that \
   encryption is applied by inspecting the API response from [PutRecord] or [PutRecords].\n\
  \      "]

module StopStreamEncryption : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `AccessDeniedException of access_denied_exception
    | `InvalidArgumentException of invalid_argument_exception
    | `LimitExceededException of limit_exceeded_exception
    | `ResourceInUseException of resource_in_use_exception
    | `ResourceNotFoundException of resource_not_found_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    stop_stream_encryption_input ->
    ( Smaws_Lib.Smithy_api.Types.unit_,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `AccessDeniedException of access_denied_exception
      | `InvalidArgumentException of invalid_argument_exception
      | `LimitExceededException of limit_exceeded_exception
      | `ResourceInUseException of resource_in_use_exception
      | `ResourceNotFoundException of resource_not_found_exception ] )
    result
end
[@@ocaml.doc
  "Disables server-side encryption for a specified stream. \n\n\
  \  When invoking this API, you must use either the [StreamARN] or the [StreamName] parameter, or \
   both. It is recommended that you use the [StreamARN] input parameter when you invoke this API.\n\
  \  \n\
  \    Stopping encryption is an asynchronous operation. Upon receiving the request, Kinesis Data \
   Streams returns immediately and sets the status of the stream to [UPDATING]. After the update \
   is complete, Kinesis Data Streams sets the status of the stream back to [ACTIVE]. Stopping \
   encryption normally takes a few seconds to complete, but it can take minutes. You can continue \
   to read and write data to your stream while its status is [UPDATING]. Once the status of the \
   stream is [ACTIVE], records written to the stream are no longer encrypted by Kinesis Data \
   Streams. \n\
  \    \n\
  \     API Limits: You can successfully disable server-side encryption 25 times in a rolling \
   24-hour period. \n\
  \     \n\
  \      Note: It can take up to 5 seconds after the stream is in an [ACTIVE] status before all \
   records written to the stream are no longer subject to encryption. After you disabled \
   encryption, you can verify that encryption is not applied by inspecting the API response from \
   [PutRecord] or [PutRecords].\n\
  \      "]

module SubscribeToShard : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `AccessDeniedException of access_denied_exception
    | `InvalidArgumentException of invalid_argument_exception
    | `LimitExceededException of limit_exceeded_exception
    | `ResourceInUseException of resource_in_use_exception
    | `ResourceNotFoundException of resource_not_found_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    subscribe_to_shard_input ->
    ( subscribe_to_shard_output,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `AccessDeniedException of access_denied_exception
      | `InvalidArgumentException of invalid_argument_exception
      | `LimitExceededException of limit_exceeded_exception
      | `ResourceInUseException of resource_in_use_exception
      | `ResourceNotFoundException of resource_not_found_exception ] )
    result
end
[@@ocaml.doc
  "This operation establishes an HTTP/2 connection between the consumer you specify in the \
   [ConsumerARN] parameter and the shard you specify in the [ShardId] parameter. After the \
   connection is successfully established, Kinesis Data Streams pushes records from the shard to \
   the consumer over this connection. Before you call this operation, call \
   [RegisterStreamConsumer] to register the consumer with Kinesis Data Streams.\n\n\
  \ When the [SubscribeToShard] call succeeds, your consumer starts receiving events of type \
   [SubscribeToShardEvent] over the HTTP/2 connection for up to 5 minutes, after which time you \
   need to call [SubscribeToShard] again to renew the subscription if you want to continue to \
   receive records.\n\
  \ \n\
  \  You can make one call to [SubscribeToShard] per second per registered consumer per shard. For \
   example, if you have a 4000 shard stream and two registered stream consumers, you can make one \
   [SubscribeToShard] request per second for each combination of shard and registered consumer, \
   allowing you to subscribe both consumers to all 4000 shards in one second. \n\
  \  \n\
  \   If you call [SubscribeToShard] again with the same [ConsumerARN] and [ShardId] within 5 \
   seconds of a successful call, you'll get a [ResourceInUseException]. If you call \
   [SubscribeToShard] 5 seconds or more after a successful call, the second call takes over the \
   subscription and the previous connection expires or fails with a [ResourceInUseException].\n\
  \   \n\
  \    For an example of how to use this operation, see \
   {{:https://docs.aws.amazon.com/streams/latest/dev/building-enhanced-consumers-api.html}Enhanced \
   Fan-Out Using the Kinesis Data Streams API}.\n\
  \    "]

module TagResource : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `AccessDeniedException of access_denied_exception
    | `InvalidArgumentException of invalid_argument_exception
    | `LimitExceededException of limit_exceeded_exception
    | `ResourceInUseException of resource_in_use_exception
    | `ResourceNotFoundException of resource_not_found_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    tag_resource_input ->
    ( Smaws_Lib.Smithy_api.Types.unit_,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `AccessDeniedException of access_denied_exception
      | `InvalidArgumentException of invalid_argument_exception
      | `LimitExceededException of limit_exceeded_exception
      | `ResourceInUseException of resource_in_use_exception
      | `ResourceNotFoundException of resource_not_found_exception ] )
    result
end
[@@ocaml.doc
  "Adds or updates tags for the specified Kinesis resource. Each tag is a label consisting of a \
   user-defined key and value. Tags can help you manage, identify, organize, search for, and \
   filter resources. You can assign up to 50 tags to a Kinesis resource.\n"]

module UntagResource : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `AccessDeniedException of access_denied_exception
    | `InvalidArgumentException of invalid_argument_exception
    | `LimitExceededException of limit_exceeded_exception
    | `ResourceInUseException of resource_in_use_exception
    | `ResourceNotFoundException of resource_not_found_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    untag_resource_input ->
    ( Smaws_Lib.Smithy_api.Types.unit_,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `AccessDeniedException of access_denied_exception
      | `InvalidArgumentException of invalid_argument_exception
      | `LimitExceededException of limit_exceeded_exception
      | `ResourceInUseException of resource_in_use_exception
      | `ResourceNotFoundException of resource_not_found_exception ] )
    result
end
[@@ocaml.doc
  "Removes tags from the specified Kinesis resource. Removed tags are deleted and can't be \
   recovered after this operation completes successfully.\n"]

module UpdateShardCount : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `AccessDeniedException of access_denied_exception
    | `InvalidArgumentException of invalid_argument_exception
    | `LimitExceededException of limit_exceeded_exception
    | `ResourceInUseException of resource_in_use_exception
    | `ResourceNotFoundException of resource_not_found_exception
    | `ValidationException of validation_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    update_shard_count_input ->
    ( update_shard_count_output,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `AccessDeniedException of access_denied_exception
      | `InvalidArgumentException of invalid_argument_exception
      | `LimitExceededException of limit_exceeded_exception
      | `ResourceInUseException of resource_in_use_exception
      | `ResourceNotFoundException of resource_not_found_exception
      | `ValidationException of validation_exception ] )
    result
end
[@@ocaml.doc
  "Updates the shard count of the specified stream to the specified number of shards. This API is \
   only supported for the data streams with the provisioned capacity mode.\n\n\
  \  When invoking this API, you must use either the [StreamARN] or the [StreamName] parameter, or \
   both. It is recommended that you use the [StreamARN] input parameter when you invoke this API.\n\
  \  \n\
  \    Updating the shard count is an asynchronous operation. Upon receiving the request, Kinesis \
   Data Streams returns immediately and sets the status of the stream to [UPDATING]. After the \
   update is complete, Kinesis Data Streams sets the status of the stream back to [ACTIVE]. \
   Depending on the size of the stream, the scaling action could take a few minutes to complete. \
   You can continue to read and write data to your stream while its status is [UPDATING].\n\
  \    \n\
  \     To update the shard count, Kinesis Data Streams performs splits or merges on individual \
   shards. This can cause short-lived shards to be created, in addition to the final shards. These \
   short-lived shards count towards your total shard limit for your account in the Region.\n\
  \     \n\
  \      When using this operation, we recommend that you specify a target shard count that is a \
   multiple of 25% (25%, 50%, 75%, 100%). You can specify any target value within your shard \
   limit. However, if you specify a target that isn't a multiple of 25%, the scaling action might \
   take longer to complete. \n\
  \      \n\
  \       This operation has the following default limits. By default, you cannot do the following:\n\
  \       \n\
  \        {ul\n\
  \              {-  Scale more than ten times per rolling 24-hour period per stream\n\
  \                  \n\
  \                   }\n\
  \              {-  Scale up to more than double your current shard count for a stream\n\
  \                  \n\
  \                   }\n\
  \              {-  Scale down below half your current shard count for a stream\n\
  \                  \n\
  \                   }\n\
  \              {-  Scale up to more than 10000 shards in a stream\n\
  \                  \n\
  \                   }\n\
  \              {-  Scale a stream with more than 10000 shards down unless the result is less \
   than 10000 shards\n\
  \                  \n\
  \                   }\n\
  \              {-  Scale up to more than the shard limit for your account\n\
  \                  \n\
  \                   }\n\
  \              {-  Make over 10 TPS. TPS over 10 will trigger the LimitExceededException\n\
  \                  \n\
  \                   }\n\
  \              }\n\
  \   For the default limits for an Amazon Web Services account, see \
   {{:https://docs.aws.amazon.com/kinesis/latest/dev/service-sizes-and-limits.html}Streams Limits} \
   in the {i Amazon Kinesis Data Streams Developer Guide}. To request an increase in the call rate \
   limit, the shard limit for this API, or your overall shard limit, use the \
   {{:https://console.aws.amazon.com/support/v1#/case/create?issueType=service-limit-increase&limitType=service-code-kinesis}limits \
   form}.\n\
  \   "]

module UpdateStreamMode : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `InvalidArgumentException of invalid_argument_exception
    | `LimitExceededException of limit_exceeded_exception
    | `ResourceInUseException of resource_in_use_exception
    | `ResourceNotFoundException of resource_not_found_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    update_stream_mode_input ->
    ( Smaws_Lib.Smithy_api.Types.unit_,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `InvalidArgumentException of invalid_argument_exception
      | `LimitExceededException of limit_exceeded_exception
      | `ResourceInUseException of resource_in_use_exception
      | `ResourceNotFoundException of resource_not_found_exception ] )
    result
end
[@@ocaml.doc
  " Updates the capacity mode of the data stream. Currently, in Kinesis Data Streams, you can \
   choose between an {b on-demand} capacity mode and a {b provisioned} capacity mode for your data \
   stream. \n"]
