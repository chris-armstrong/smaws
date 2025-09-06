type nonrec error_message = string [@@ocaml.doc ""]

type nonrec trimmed_data_access_exception = {
  message : error_message option;
      [@ocaml.doc "\"The data you are trying to access has been trimmed.\n"]
}
[@@ocaml.doc
  "The operation attempted to read past the oldest stream record in a shard.\n\n\
  \ In DynamoDB Streams, there is a 24 hour limit on data retention. Stream records whose age \
   exceeds this limit are subject to removal (trimming) from the stream. You might receive a \
   TrimmedDataAccessException if:\n\
  \ \n\
  \  {ul\n\
  \        {-  You request a shard iterator with a sequence number older than the trim point (24 \
   hours).\n\
  \            \n\
  \             }\n\
  \        {-  You obtain a shard iterator, but before you use the iterator in a [GetRecords] \
   request, a stream record in the shard exceeds the 24 hour period and is trimmed. This causes \
   the iterator to access a record that no longer exists.\n\
  \            \n\
  \             }\n\
  \        }\n\
  \  "]

type nonrec table_name = string [@@ocaml.doc ""]

type nonrec string_attribute_value = string [@@ocaml.doc ""]

type nonrec string_set_attribute_value = string_attribute_value list [@@ocaml.doc ""]

type nonrec string_ = string [@@ocaml.doc ""]

type nonrec stream_view_type =
  | KEYS_ONLY [@ocaml.doc ""]
  | NEW_AND_OLD_IMAGES [@ocaml.doc ""]
  | OLD_IMAGE [@ocaml.doc ""]
  | NEW_IMAGE [@ocaml.doc ""]
[@@ocaml.doc ""]

type nonrec stream_status =
  | DISABLED [@ocaml.doc ""]
  | DISABLING [@ocaml.doc ""]
  | ENABLED [@ocaml.doc ""]
  | ENABLING [@ocaml.doc ""]
[@@ocaml.doc ""]

type nonrec date = Smaws_Lib.CoreTypes.Timestamp.t [@@ocaml.doc ""]

type nonrec number_attribute_value = string [@@ocaml.doc ""]

type nonrec binary_attribute_value = bytes [@@ocaml.doc ""]

type nonrec number_set_attribute_value = number_attribute_value list [@@ocaml.doc ""]

type nonrec binary_set_attribute_value = binary_attribute_value list [@@ocaml.doc ""]

type nonrec attribute_name = string [@@ocaml.doc ""]

type nonrec null_attribute_value = bool [@@ocaml.doc ""]

type nonrec boolean_attribute_value = bool [@@ocaml.doc ""]

type attribute_value =
  | BOOL of boolean_attribute_value
      [@ocaml.doc "An attribute of type Boolean. For example:\n\n  [\"BOOL\": true] \n "]
  | NULL of null_attribute_value
      [@ocaml.doc "An attribute of type Null. For example:\n\n  [\"NULL\": true] \n "]
  | L of list_attribute_value
      [@ocaml.doc
        "An attribute of type List. For example:\n\n\
        \  [\"L\": \\[ {\"S\": \"Cookies\"} , {\"S\": \"Coffee\"}, {\"N\": \"3.14159\"}\\]] \n\
        \ "]
  | M of map_attribute_value
      [@ocaml.doc
        "An attribute of type Map. For example:\n\n\
        \  [\"M\": {\"Name\": {\"S\": \"Joe\"}, \"Age\": {\"N\": \"35\"}}] \n\
        \ "]
  | BS of binary_set_attribute_value
      [@ocaml.doc
        "An attribute of type Binary Set. For example:\n\n\
        \  [\"BS\": \\[\"U3Vubnk=\", \"UmFpbnk=\", \"U25vd3k=\"\\]] \n\
        \ "]
  | NS of number_set_attribute_value
      [@ocaml.doc
        "An attribute of type Number Set. For example:\n\n\
        \  [\"NS\": \\[\"42.2\", \"-19\", \"7.5\", \"3.14\"\\]] \n\
        \ \n\
        \  Numbers are sent across the network to DynamoDB as strings, to maximize compatibility \
         across languages and libraries. However, DynamoDB treats them as number type attributes \
         for mathematical operations.\n\
        \  "]
  | SS of string_set_attribute_value
      [@ocaml.doc
        "An attribute of type String Set. For example:\n\n\
        \  [\"SS\": \\[\"Giraffe\", \"Hippo\" ,\"Zebra\"\\]] \n\
        \ "]
  | B of binary_attribute_value
      [@ocaml.doc
        "An attribute of type Binary. For example:\n\n\
        \  [\"B\": \"dGhpcyB0ZXh0IGlzIGJhc2U2NC1lbmNvZGVk\"] \n\
        \ "]
  | N of number_attribute_value
      [@ocaml.doc
        "An attribute of type Number. For example:\n\n\
        \  [\"N\": \"123.45\"] \n\
        \ \n\
        \  Numbers are sent across the network to DynamoDB as strings, to maximize compatibility \
         across languages and libraries. However, DynamoDB treats them as number type attributes \
         for mathematical operations.\n\
        \  "]
  | S of string_attribute_value
      [@ocaml.doc "An attribute of type String. For example:\n\n  [\"S\": \"Hello\"] \n "]
[@@ocaml.doc
  "Represents the data for an attribute.\n\n\
  \ Each attribute value is described as a name-value pair. The name is the data type, and the \
   value is the data itself.\n\
  \ \n\
  \  For more information, see \
   {{:https://docs.aws.amazon.com/amazondynamodb/latest/developerguide/HowItWorks.NamingRulesDataTypes.html#HowItWorks.DataTypes}Data \
   Types} in the {i Amazon DynamoDB Developer Guide}.\n\
  \  "]

and list_attribute_value = attribute_value list [@@ocaml.doc ""]

and map_attribute_value = (attribute_name * attribute_value) list [@@ocaml.doc ""]

type nonrec attribute_map = (attribute_name * attribute_value) list [@@ocaml.doc ""]

type nonrec sequence_number = string [@@ocaml.doc ""]

type nonrec positive_long_object = int [@@ocaml.doc ""]

type nonrec stream_record = {
  stream_view_type : stream_view_type option;
      [@ocaml.doc
        "The type of data from the modified DynamoDB item that was captured in this stream record:\n\n\
        \ {ul\n\
        \       {-   [KEYS_ONLY] - only the key attributes of the modified item.\n\
        \           \n\
        \            }\n\
        \       {-   [NEW_IMAGE] - the entire item, as it appeared after it was modified.\n\
        \           \n\
        \            }\n\
        \       {-   [OLD_IMAGE] - the entire item, as it appeared before it was modified.\n\
        \           \n\
        \            }\n\
        \       {-   [NEW_AND_OLD_IMAGES] - both the new and the old item images of the item.\n\
        \           \n\
        \            }\n\
        \       }\n\
        \  "]
  size_bytes : positive_long_object option;
      [@ocaml.doc "The size of the stream record, in bytes.\n"]
  sequence_number : sequence_number option;
      [@ocaml.doc "The sequence number of the stream record.\n"]
  old_image : attribute_map option;
      [@ocaml.doc "The item in the DynamoDB table as it appeared before it was modified.\n"]
  new_image : attribute_map option;
      [@ocaml.doc "The item in the DynamoDB table as it appeared after it was modified.\n"]
  keys : attribute_map option;
      [@ocaml.doc "The primary key attribute(s) for the DynamoDB item that was modified.\n"]
  approximate_creation_date_time : date option;
      [@ocaml.doc
        "The approximate date and time when the stream record was created, in \
         {{:http://www.epochconverter.com/}UNIX epoch time} format and rounded down to the closest \
         second.\n"]
}
[@@ocaml.doc
  "A description of a single data modification that was performed on an item in a DynamoDB table.\n"]

type nonrec stream_arn = string [@@ocaml.doc ""]

type nonrec stream = {
  stream_label : string_ option;
      [@ocaml.doc
        "A timestamp, in ISO 8601 format, for this stream.\n\n\
        \ Note that [LatestStreamLabel] is not a unique identifier for the stream, because it is \
         possible that a stream from another table might have the same timestamp. However, the \
         combination of the following three elements is guaranteed to be unique:\n\
        \ \n\
        \  {ul\n\
        \        {-  the Amazon Web Services customer ID.\n\
        \            \n\
        \             }\n\
        \        {-  the table name\n\
        \            \n\
        \             }\n\
        \        {-  the [StreamLabel] \n\
        \            \n\
        \             }\n\
        \        }\n\
        \  "]
  table_name : table_name option;
      [@ocaml.doc "The DynamoDB table with which the stream is associated.\n"]
  stream_arn : stream_arn option; [@ocaml.doc "The Amazon Resource Name (ARN) for the stream.\n"]
}
[@@ocaml.doc "Represents all of the data describing a particular stream.\n"]

type nonrec stream_list = stream list [@@ocaml.doc ""]

type nonrec key_schema_attribute_name = string [@@ocaml.doc ""]

type nonrec key_type = RANGE [@ocaml.doc ""] | HASH [@ocaml.doc ""] [@@ocaml.doc ""]

type nonrec key_schema_element = {
  key_type : key_type;
      [@ocaml.doc
        "The role that this key attribute will assume:\n\n\
        \ {ul\n\
        \       {-   [HASH] - partition key\n\
        \           \n\
        \            }\n\
        \       {-   [RANGE] - sort key\n\
        \           \n\
        \            }\n\
        \       }\n\
        \    The partition key of an item is also known as its {i hash attribute}. The term \"hash \
         attribute\" derives from DynamoDB's usage of an internal hash function to evenly \
         distribute data items across partitions, based on their partition key values.\n\
        \    \n\
        \     The sort key of an item is also known as its {i range attribute}. The term \"range \
         attribute\" derives from the way DynamoDB stores items with the same partition key \
         physically close together, in sorted order by the sort key value.\n\
        \     \n\
        \      "]
  attribute_name : key_schema_attribute_name; [@ocaml.doc "The name of a key attribute.\n"]
}
[@@ocaml.doc
  "Represents {i a single element} of a key schema. A key schema specifies the attributes that \
   make up the primary key of a table, or the key attributes of an index.\n\n\
  \ A [KeySchemaElement] represents exactly one attribute of the primary key. For example, a \
   simple primary key would be represented by one [KeySchemaElement] (for the partition key). A \
   composite primary key would require one [KeySchemaElement] for the partition key, and another \
   [KeySchemaElement] for the sort key.\n\
  \ \n\
  \  A [KeySchemaElement] must be a scalar, top-level attribute (not a nested attribute). The data \
   type must be one of String, Number, or Binary. The attribute cannot be nested within a List or \
   a Map.\n\
  \  "]

type nonrec key_schema = key_schema_element list [@@ocaml.doc ""]

type nonrec shard_id = string [@@ocaml.doc ""]

type nonrec sequence_number_range = {
  ending_sequence_number : sequence_number option;
      [@ocaml.doc
        "The last sequence number for the stream records contained within a shard. String contains \
         numeric characters only.\n"]
  starting_sequence_number : sequence_number option;
      [@ocaml.doc
        "The first sequence number for the stream records contained within a shard. String \
         contains numeric characters only.\n"]
}
[@@ocaml.doc
  "The beginning and ending sequence numbers for the stream records contained within a shard.\n"]

type nonrec shard = {
  parent_shard_id : shard_id option; [@ocaml.doc "The shard ID of the current shard's parent.\n"]
  sequence_number_range : sequence_number_range option;
      [@ocaml.doc "The range of possible sequence numbers for the shard.\n"]
  shard_id : shard_id option; [@ocaml.doc "The system-generated identifier for this shard.\n"]
}
[@@ocaml.doc "A uniquely identified group of stream records within a stream.\n"]

type nonrec shard_description_list = shard list [@@ocaml.doc ""]

type nonrec stream_description = {
  last_evaluated_shard_id : shard_id option;
      [@ocaml.doc
        "The shard ID of the item where the operation stopped, inclusive of the previous result \
         set. Use this value to start a new operation, excluding this value in the new request.\n\n\
        \ If [LastEvaluatedShardId] is empty, then the \"last page\" of results has been processed \
         and there is currently no more data to be retrieved.\n\
        \ \n\
        \  If [LastEvaluatedShardId] is not empty, it does not necessarily mean that there is more \
         data in the result set. The only way to know when you have reached the end of the result \
         set is when [LastEvaluatedShardId] is empty.\n\
        \  "]
  shards : shard_description_list option; [@ocaml.doc "The shards that comprise the stream.\n"]
  key_schema : key_schema option;
      [@ocaml.doc "The key attribute(s) of the stream's DynamoDB table.\n"]
  table_name : table_name option;
      [@ocaml.doc "The DynamoDB table with which the stream is associated.\n"]
  creation_request_date_time : date option;
      [@ocaml.doc "The date and time when the request to create this stream was issued.\n"]
  stream_view_type : stream_view_type option;
      [@ocaml.doc
        "Indicates the format of the records within this stream:\n\n\
        \ {ul\n\
        \       {-   [KEYS_ONLY] - only the key attributes of items that were modified in the \
         DynamoDB table.\n\
        \           \n\
        \            }\n\
        \       {-   [NEW_IMAGE] - entire items from the table, as they appeared after they were \
         modified.\n\
        \           \n\
        \            }\n\
        \       {-   [OLD_IMAGE] - entire items from the table, as they appeared before they were \
         modified.\n\
        \           \n\
        \            }\n\
        \       {-   [NEW_AND_OLD_IMAGES] - both the new and the old images of the items from the \
         table.\n\
        \           \n\
        \            }\n\
        \       }\n\
        \  "]
  stream_status : stream_status option;
      [@ocaml.doc
        "Indicates the current status of the stream:\n\n\
        \ {ul\n\
        \       {-   [ENABLING] - Streams is currently being enabled on the DynamoDB table.\n\
        \           \n\
        \            }\n\
        \       {-   [ENABLED] - the stream is enabled.\n\
        \           \n\
        \            }\n\
        \       {-   [DISABLING] - Streams is currently being disabled on the DynamoDB table.\n\
        \           \n\
        \            }\n\
        \       {-   [DISABLED] - the stream is disabled.\n\
        \           \n\
        \            }\n\
        \       }\n\
        \  "]
  stream_label : string_ option;
      [@ocaml.doc
        "A timestamp, in ISO 8601 format, for this stream.\n\n\
        \ Note that [LatestStreamLabel] is not a unique identifier for the stream, because it is \
         possible that a stream from another table might have the same timestamp. However, the \
         combination of the following three elements is guaranteed to be unique:\n\
        \ \n\
        \  {ul\n\
        \        {-  the Amazon Web Services customer ID.\n\
        \            \n\
        \             }\n\
        \        {-  the table name\n\
        \            \n\
        \             }\n\
        \        {-  the [StreamLabel] \n\
        \            \n\
        \             }\n\
        \        }\n\
        \  "]
  stream_arn : stream_arn option; [@ocaml.doc "The Amazon Resource Name (ARN) for the stream.\n"]
}
[@@ocaml.doc "Represents all of the data describing a particular stream.\n"]

type nonrec shard_iterator_type =
  | AFTER_SEQUENCE_NUMBER [@ocaml.doc ""]
  | AT_SEQUENCE_NUMBER [@ocaml.doc ""]
  | LATEST [@ocaml.doc ""]
  | TRIM_HORIZON [@ocaml.doc ""]
[@@ocaml.doc ""]

type nonrec shard_iterator = string [@@ocaml.doc ""]

type nonrec resource_not_found_exception = {
  message : error_message option;
      [@ocaml.doc "The resource which is being requested does not exist.\n"]
}
[@@ocaml.doc
  "The operation tried to access a nonexistent table or index. The resource might not be specified \
   correctly, or its status might not be [ACTIVE].\n"]

type nonrec operation_type =
  | REMOVE [@ocaml.doc ""]
  | MODIFY [@ocaml.doc ""]
  | INSERT [@ocaml.doc ""]
[@@ocaml.doc ""]

type nonrec identity = {
  type_ : string_ option;
      [@ocaml.doc "The type of the identity. For Time To Live, the type is \"Service\".\n"]
  principal_id : string_ option;
      [@ocaml.doc
        "A unique identifier for the entity that made the call. For Time To Live, the principalId \
         is \"dynamodb.amazonaws.com\".\n"]
}
[@@ocaml.doc "Contains details about the type of identity that made the request.\n"]

type nonrec record = {
  user_identity : identity option;
      [@ocaml.doc
        "Items that are deleted by the Time to Live process after expiration have the following \
         fields: \n\n\
        \ {ul\n\
        \       {-  Records\\[\\].userIdentity.type\n\
        \           \n\
        \            \"Service\"\n\
        \            \n\
        \             }\n\
        \       {-  Records\\[\\].userIdentity.principalId\n\
        \           \n\
        \            \"dynamodb.amazonaws.com\"\n\
        \            \n\
        \             }\n\
        \       }\n\
        \  "]
  dynamodb : stream_record option;
      [@ocaml.doc
        "The main body of the stream record, containing all of the DynamoDB-specific fields.\n"]
  aws_region : string_ option;
      [@ocaml.doc "The region in which the [GetRecords] request was received.\n"]
  event_source : string_ option;
      [@ocaml.doc
        "The Amazon Web Services service from which the stream record originated. For DynamoDB \
         Streams, this is [aws:dynamodb].\n"]
  event_version : string_ option;
      [@ocaml.doc
        "The version number of the stream record format. This number is updated whenever the \
         structure of [Record] is modified.\n\n\
        \ Client applications must not assume that [eventVersion] will remain at a particular \
         value, as this number is subject to change at any time. In general, [eventVersion] will \
         only increase as the low-level DynamoDB Streams API evolves.\n\
        \ "]
  event_name : operation_type option;
      [@ocaml.doc
        "The type of data modification that was performed on the DynamoDB table:\n\n\
        \ {ul\n\
        \       {-   [INSERT] - a new item was added to the table.\n\
        \           \n\
        \            }\n\
        \       {-   [MODIFY] - one or more of an existing item's attributes were modified.\n\
        \           \n\
        \            }\n\
        \       {-   [REMOVE] - the item was deleted from the table\n\
        \           \n\
        \            }\n\
        \       }\n\
        \  "]
  event_i_d : string_ option;
      [@ocaml.doc
        "A globally unique identifier for the event that was recorded in this stream record.\n"]
}
[@@ocaml.doc "A description of a unique event within a stream.\n"]

type nonrec record_list = record list [@@ocaml.doc ""]

type nonrec positive_integer_object = int [@@ocaml.doc ""]

type nonrec list_streams_output = {
  last_evaluated_stream_arn : stream_arn option;
      [@ocaml.doc
        "The stream ARN of the item where the operation stopped, inclusive of the previous result \
         set. Use this value to start a new operation, excluding this value in the new request.\n\n\
        \ If [LastEvaluatedStreamArn] is empty, then the \"last page\" of results has been \
         processed and there is no more data to be retrieved.\n\
        \ \n\
        \  If [LastEvaluatedStreamArn] is not empty, it does not necessarily mean that there is \
         more data in the result set. The only way to know when you have reached the end of the \
         result set is when [LastEvaluatedStreamArn] is empty.\n\
        \  "]
  streams : stream_list option;
      [@ocaml.doc
        "A list of stream descriptors associated with the current account and endpoint.\n"]
}
[@@ocaml.doc "Represents the output of a [ListStreams] operation.\n"]

type nonrec list_streams_input = {
  exclusive_start_stream_arn : stream_arn option;
      [@ocaml.doc
        "The ARN (Amazon Resource Name) of the first item that this operation will evaluate. Use \
         the value that was returned for [LastEvaluatedStreamArn] in the previous operation. \n"]
  limit : positive_integer_object option;
      [@ocaml.doc "The maximum number of streams to return. The upper limit is 100.\n"]
  table_name : table_name option;
      [@ocaml.doc
        "If this parameter is provided, then only the streams associated with this table name are \
         returned.\n"]
}
[@@ocaml.doc "Represents the input of a [ListStreams] operation.\n"]

type nonrec internal_server_error = {
  message : error_message option;
      [@ocaml.doc "The server encountered an internal error trying to fulfill the request.\n"]
}
[@@ocaml.doc "An error occurred on the server side.\n"]

type nonrec limit_exceeded_exception = {
  message : error_message option; [@ocaml.doc "Too many operations for a given subscriber.\n"]
}
[@@ocaml.doc
  "There is no limit to the number of daily on-demand backups that can be taken. \n\n\
  \ For most purposes, up to 500 simultaneous table operations are allowed per account. These \
   operations include [CreateTable], [UpdateTable], [DeleteTable],[UpdateTimeToLive], \
   [RestoreTableFromBackup], and [RestoreTableToPointInTime]. \n\
  \ \n\
  \  When you are creating a table with one or more secondary indexes, you can have up to 250 such \
   requests running at a time. However, if the table or index specifications are complex, then \
   DynamoDB might temporarily reduce the number of concurrent operations.\n\
  \  \n\
  \   When importing into DynamoDB, up to 50 simultaneous import table operations are allowed per \
   account.\n\
  \   \n\
  \    There is a soft account quota of 2,500 tables.\n\
  \    \n\
  \     GetRecords was called with a value of more than 1000 for the limit request parameter.\n\
  \     \n\
  \      More than 2 processes are reading from the same streams shard at the same time. Exceeding \
   this limit may result in request throttling.\n\
  \      "]

type nonrec get_shard_iterator_output = {
  shard_iterator : shard_iterator option;
      [@ocaml.doc
        "The position in the shard from which to start reading stream records sequentially. A \
         shard iterator specifies this position using the sequence number of a stream record in a \
         shard.\n"]
}
[@@ocaml.doc "Represents the output of a [GetShardIterator] operation.\n"]

type nonrec get_shard_iterator_input = {
  sequence_number : sequence_number option;
      [@ocaml.doc
        "The sequence number of a stream record in the shard from which to start reading.\n"]
  shard_iterator_type : shard_iterator_type;
      [@ocaml.doc
        "Determines how the shard iterator is used to start reading stream records from the shard:\n\n\
        \ {ul\n\
        \       {-   [AT_SEQUENCE_NUMBER] - Start reading exactly from the position denoted by a \
         specific sequence number.\n\
        \           \n\
        \            }\n\
        \       {-   [AFTER_SEQUENCE_NUMBER] - Start reading right after the position denoted by a \
         specific sequence number.\n\
        \           \n\
        \            }\n\
        \       {-   [TRIM_HORIZON] - Start reading at the last (untrimmed) stream record, which \
         is the oldest record in the shard. In DynamoDB Streams, there is a 24 hour limit on data \
         retention. Stream records whose age exceeds this limit are subject to removal (trimming) \
         from the stream.\n\
        \           \n\
        \            }\n\
        \       {-   [LATEST] - Start reading just after the most recent stream record in the \
         shard, so that you always read the most recent data in the shard.\n\
        \           \n\
        \            }\n\
        \       }\n\
        \  "]
  shard_id : shard_id;
      [@ocaml.doc "The identifier of the shard. The iterator will be returned for this shard ID.\n"]
  stream_arn : stream_arn; [@ocaml.doc "The Amazon Resource Name (ARN) for the stream.\n"]
}
[@@ocaml.doc "Represents the input of a [GetShardIterator] operation.\n"]

type nonrec get_records_output = {
  next_shard_iterator : shard_iterator option;
      [@ocaml.doc
        "The next position in the shard from which to start sequentially reading stream records. \
         If set to [null], the shard has been closed and the requested iterator will not return \
         any more data.\n"]
  records : record_list option;
      [@ocaml.doc
        "The stream records from the shard, which were retrieved using the shard iterator.\n"]
}
[@@ocaml.doc "Represents the output of a [GetRecords] operation.\n"]

type nonrec get_records_input = {
  limit : positive_integer_object option;
      [@ocaml.doc
        "The maximum number of records to return from the shard. The upper limit is 1000.\n"]
  shard_iterator : shard_iterator;
      [@ocaml.doc
        "A shard iterator that was retrieved from a previous GetShardIterator operation. This \
         iterator can be used to access the stream records in this shard.\n"]
}
[@@ocaml.doc "Represents the input of a [GetRecords] operation.\n"]

type nonrec expired_iterator_exception = {
  message : error_message option;
      [@ocaml.doc "The provided iterator exceeds the maximum age allowed.\n"]
}
[@@ocaml.doc
  "The shard iterator has expired and can no longer be used to retrieve stream records. A shard \
   iterator expires 15 minutes after it is retrieved using the [GetShardIterator] action.\n"]

type nonrec describe_stream_output = {
  stream_description : stream_description option;
      [@ocaml.doc
        "A complete description of the stream, including its creation date and time, the DynamoDB \
         table associated with the stream, the shard IDs within the stream, and the beginning and \
         ending sequence numbers of stream records within the shards.\n"]
}
[@@ocaml.doc "Represents the output of a [DescribeStream] operation.\n"]

type nonrec describe_stream_input = {
  exclusive_start_shard_id : shard_id option;
      [@ocaml.doc
        "The shard ID of the first item that this operation will evaluate. Use the value that was \
         returned for [LastEvaluatedShardId] in the previous operation. \n"]
  limit : positive_integer_object option;
      [@ocaml.doc "The maximum number of shard objects to return. The upper limit is 100.\n"]
  stream_arn : stream_arn; [@ocaml.doc "The Amazon Resource Name (ARN) for the stream.\n"]
}
[@@ocaml.doc "Represents the input of a [DescribeStream] operation.\n"]
