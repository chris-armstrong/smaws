type nonrec validation_exception_type =
  | ExpiredNextToken [@ocaml.doc ""]
  | ExpiredIterator [@ocaml.doc ""]
  | TrimmedDataAccess [@ocaml.doc ""]
  | InvalidFormat [@ocaml.doc ""]
[@@ocaml.doc ""]

type nonrec validation_exception = {
  error_code : validation_exception_type option;
      [@ocaml.doc "An error occurred validating your request. See the error message for details.\n"]
  message : Smaws_Lib.Smithy_api.Types.string_ option;
      [@ocaml.doc
        "The input fails to satisfy the constraints specified by the service. Check the error \
         details and modify your request.\n"]
}
[@@ocaml.doc
  "The request validation failed because one or more input parameters failed validation. \n\n\
  \ This exception occurs when there are syntax errors in the request, field constraints are \
   violated, or required parameters are missing. To help you fix the issue, the exception message \
   provides details about which parameter failed and why.\n\
  \ "]

type nonrec throttling_exception = {
  message : Smaws_Lib.Smithy_api.Types.string_ option;
      [@ocaml.doc
        "The request was denied due to request throttling. Reduce the frequency of requests and \
         try again.\n"]
}
[@@ocaml.doc
  "The request rate is too high and exceeds the service's throughput limits. \n\n\
  \ This exception occurs when you send too many requests in a short period of time. Implement \
   exponential backoff in your retry strategy to handle this exception. Reducing your request \
   frequency or distributing requests more evenly can help avoid throughput exceptions.\n\
  \ \n\
  \  This exception can also occur when more than two processes are reading from the same stream \
   shard at the same time. Ensure that only one process reads from a stream shard at the same \
   time. \n\
  \  "]

type nonrec table_name = string [@@ocaml.doc ""]

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

type nonrec stream_arn = string [@@ocaml.doc ""]

type nonrec keyspace_name = string [@@ocaml.doc ""]

type nonrec stream = {
  stream_label : Smaws_Lib.Smithy_api.Types.string_;
      [@ocaml.doc "A unique identifier for this stream that can be used in stream operations.\n"]
  table_name : table_name; [@ocaml.doc "The name of the table associated with this stream.\n"]
  keyspace_name : keyspace_name;
      [@ocaml.doc "The name of the keyspace containing the table associated with this stream.\n"]
  stream_arn : stream_arn;
      [@ocaml.doc "The Amazon Resource Name (ARN) that uniquely identifies this stream.\n"]
}
[@@ocaml.doc
  "Represents a change data capture stream for an Amazon Keyspaces table, which enables tracking \
   and processing of data changes.\n"]

type nonrec stream_list = stream list [@@ocaml.doc ""]

type nonrec stream_arn_token = string [@@ocaml.doc ""]

type nonrec shard_iterator_type =
  | AFTER_SEQUENCE_NUMBER [@ocaml.doc ""]
  | AT_SEQUENCE_NUMBER [@ocaml.doc ""]
  | LATEST [@ocaml.doc ""]
  | TRIM_HORIZON [@ocaml.doc ""]
[@@ocaml.doc ""]

type nonrec shard_iterator = string [@@ocaml.doc ""]

type nonrec shard_id_token = string [@@ocaml.doc ""]

type nonrec shard_id = string [@@ocaml.doc ""]

type nonrec shard_id_list = shard_id list [@@ocaml.doc ""]

type nonrec shard_filter_type = CHILD_SHARDS [@ocaml.doc ""] [@@ocaml.doc ""]

type nonrec shard_filter = {
  shard_id : shard_id option;
      [@ocaml.doc
        "The identifier of a specific shard used to filter results based on the specified filter \
         type.\n"]
  type_ : shard_filter_type option;
      [@ocaml.doc
        "The type of shard filter to use, which determines how the shardId parameter is interpreted.\n"]
}
[@@ocaml.doc "A filter used to limit the shards returned by a [GetStream] operation.\n"]

type nonrec sequence_number = string [@@ocaml.doc ""]

type nonrec sequence_number_range = {
  ending_sequence_number : sequence_number option;
      [@ocaml.doc
        "The ending sequence number of the range, which may be null for open-ended ranges.\n"]
  starting_sequence_number : sequence_number option;
      [@ocaml.doc "The starting sequence number of the range.\n"]
}
[@@ocaml.doc
  "Defines a range of sequence numbers within a change data capture stream's shard for Amazon \
   Keyspaces.\n"]

type nonrec shard = {
  parent_shard_ids : shard_id_list option;
      [@ocaml.doc
        "The identifiers of parent shards that this shard evolved from, if this shard was created \
         through resharding.\n"]
  sequence_number_range : sequence_number_range option;
      [@ocaml.doc "The range of sequence numbers contained within this shard.\n"]
  shard_id : shard_id option; [@ocaml.doc "A unique identifier for this shard within the stream.\n"]
}
[@@ocaml.doc
  "Represents a uniquely identified group of change records within a change data capture stream \
   for Amazon Keyspaces.\n"]

type nonrec shard_description_list = shard list [@@ocaml.doc ""]

type nonrec resource_not_found_exception = {
  message : Smaws_Lib.Smithy_api.Types.string_ option;
      [@ocaml.doc
        "The requested resource wasn't found. Verify that the resource exists and try again.\n"]
}
[@@ocaml.doc
  "The requested resource doesn't exist or could not be found. \n\n\
  \ This exception occurs when you attempt to access a keyspace, table, stream, or other Amazon \
   Keyspaces resource that doesn't exist or that has been deleted. Verify that the resource \
   identifier is correct and that the resource exists in your account.\n\
  \ "]

type nonrec date = Smaws_Lib.CoreTypes.Timestamp.t [@@ocaml.doc ""]

type nonrec origin_type = TTL [@ocaml.doc ""] | REPLICATION [@ocaml.doc ""] | USER [@ocaml.doc ""]
[@@ocaml.doc ""]

type nonrec keyspaces_metadata = {
  write_time : Smaws_Lib.Smithy_api.Types.string_ option;
      [@ocaml.doc "The timestamp at which the associated data was written to the database.\n"]
  expiration_time : Smaws_Lib.Smithy_api.Types.string_ option;
      [@ocaml.doc
        "The time at which the associated data will expire, based on the time-to-live (TTL) setting.\n"]
}
[@@ocaml.doc "Contains metadata information associated with Amazon Keyspaces cells and rows.\n"]

type keyspaces_cell = {
  metadata : keyspaces_metadata option;
      [@ocaml.doc
        "Metadata associated with this cell, such as time-to-live (TTL) expiration time and write \
         timestamp.\n"]
  value : keyspaces_cell_value option;
      [@ocaml.doc
        "The value stored in this cell, which can be of various data types supported by Amazon \
         Keyspaces.\n"]
}
[@@ocaml.doc
  "Represents a cell in an Amazon Keyspaces table, containing both the value and metadata about \
   the cell.\n"]

and keyspaces_cell_list = keyspaces_cell list [@@ocaml.doc ""]

and keyspaces_cell_map = keyspaces_cell_map_definition list [@@ocaml.doc ""]

and keyspaces_cell_map_definition = {
  metadata : keyspaces_metadata option;
      [@ocaml.doc
        "Metadata for this specific key-value pair within the map, such as timestamps and TTL \
         information.\n"]
  value : keyspaces_cell_value option;
      [@ocaml.doc "The value associated with the key in this map entry.\n"]
  key : keyspaces_cell_value option;
      [@ocaml.doc "The key of this map entry in the Amazon Keyspaces cell.\n"]
}
[@@ocaml.doc
  "Represents a key-value pair within a map data type in Amazon Keyspaces, including the \
   associated metadata.\n"]

and keyspaces_cell_value =
  | UdtT of keyspaces_udt_map
      [@ocaml.doc
        "A user-defined type (UDT) value consisting of named fields, each with its own data type. \n"]
  | VarintT of Smaws_Lib.Smithy_api.Types.string_
      [@ocaml.doc "An integer value within the +/-10^38 range. \n"]
  | VarcharT of Smaws_Lib.Smithy_api.Types.string_
      [@ocaml.doc "A UTF-8 encoded string value, functionally equivalent to text type. \n"]
  | UuidT of Smaws_Lib.Smithy_api.Types.string_
      [@ocaml.doc "A universally unique identifier (UUID) value. \n"]
  | TupleT of keyspaces_cell_list
      [@ocaml.doc
        "A fixed-length ordered list of elements, where each element can be of a different data \
         type. \n"]
  | TinyintT of Smaws_Lib.Smithy_api.Types.string_ [@ocaml.doc "An 8-bit signed integer value. \n"]
  | TimeuuidT of Smaws_Lib.Smithy_api.Types.string_
      [@ocaml.doc
        "A universally unique identifier (UUID) that includes a timestamp component, ensuring both \
         uniqueness and time ordering. \n"]
  | TimestampT of Smaws_Lib.Smithy_api.Types.string_
      [@ocaml.doc "A timestamp value representing date and time with millisecond precision. \n"]
  | TimeT of Smaws_Lib.Smithy_api.Types.string_
      [@ocaml.doc "A time value without a date component, with nanosecond precision. \n"]
  | TextT of Smaws_Lib.Smithy_api.Types.string_ [@ocaml.doc "A UTF-8 encoded string value. \n"]
  | SmallintT of Smaws_Lib.Smithy_api.Types.string_ [@ocaml.doc "A 16-bit signed integer value. \n"]
  | SetT of keyspaces_cell_list [@ocaml.doc "An unordered collection of unique elements. \n"]
  | MapT of keyspaces_cell_map
      [@ocaml.doc "A collection of key-value pairs where each key is unique. \n"]
  | ListT of keyspaces_cell_list
      [@ocaml.doc "An ordered collection of elements that can contain duplicate values. \n"]
  | IntT of Smaws_Lib.Smithy_api.Types.string_ [@ocaml.doc "A 32-bit signed integer value. \n"]
  | InetT of Smaws_Lib.Smithy_api.Types.string_
      [@ocaml.doc "An IP address value, either IPv4 or IPv6 format. \n"]
  | FloatT of Smaws_Lib.Smithy_api.Types.string_
      [@ocaml.doc "A 32-bit single-precision floating point value. \n"]
  | DurationT of Smaws_Lib.Smithy_api.Types.string_
      [@ocaml.doc
        "A duration value with nanosecond precision, representing a period of time encoded as \
         32-bit months, 32-bit days, and 64-bit nanoseconds. \n"]
  | DoubleT of Smaws_Lib.Smithy_api.Types.string_
      [@ocaml.doc "A 64-bit double-precision floating point value. \n"]
  | DecimalT of Smaws_Lib.Smithy_api.Types.string_
      [@ocaml.doc "A variable-precision decimal number value. \n"]
  | DateT of Smaws_Lib.Smithy_api.Types.string_
      [@ocaml.doc
        "A date value without a time component, represented as days since epoch (January 1, 1970). \n"]
  | CounterT of Smaws_Lib.Smithy_api.Types.string_
      [@ocaml.doc "A distributed counter value that can be incremented and decremented. \n"]
  | BoolT of Smaws_Lib.Smithy_api.Types.boolean_
      [@ocaml.doc "A Boolean value, either [true] or [false]. \n"]
  | BlobT of Smaws_Lib.Smithy_api.Types.blob
      [@ocaml.doc "A binary large object (BLOB) value stored as a Base64-encoded string. \n"]
  | BigintT of Smaws_Lib.Smithy_api.Types.string_ [@ocaml.doc "A 64-bit signed integer value. \n"]
  | AsciiT of Smaws_Lib.Smithy_api.Types.string_
      [@ocaml.doc "A value of ASCII text type, containing US-ASCII characters. \n"]
[@@ocaml.doc
  "Represents the value of a cell in an Amazon Keyspaces table, supporting various data types with \
   type-specific fields.\n"]

and keyspaces_udt_map = (Smaws_Lib.Smithy_api.Types.string_ * keyspaces_cell) list [@@ocaml.doc ""]

type nonrec keyspaces_keys_map = (Smaws_Lib.Smithy_api.Types.string_ * keyspaces_cell_value) list
[@@ocaml.doc ""]

type nonrec keyspaces_cells = (Smaws_Lib.Smithy_api.Types.string_ * keyspaces_cell) list
[@@ocaml.doc ""]

type nonrec keyspaces_row = {
  row_metadata : keyspaces_metadata option;
      [@ocaml.doc
        "Metadata that applies to the entire row, such as timestamps and TTL information.\n"]
  static_cells : keyspaces_cells option;
      [@ocaml.doc
        "A map of static column cells shared by all rows with the same partition key, where keys \
         are column names and values are the corresponding cells.\n"]
  value_cells : keyspaces_cells option;
      [@ocaml.doc
        "A map of regular (non-static) column cells in the row, where keys are column names and \
         values are the corresponding cells.\n"]
}
[@@ocaml.doc
  "Represents a row in an Amazon Keyspaces table, containing regular column values, static column \
   values, and row-level metadata.\n"]

type nonrec record = {
  sequence_number : sequence_number option;
      [@ocaml.doc
        "A unique identifier assigned to this record within the shard, used for ordering and \
         tracking purposes.\n"]
  old_image : keyspaces_row option;
      [@ocaml.doc "The state of the row before the change operation that generated this record.\n"]
  new_image : keyspaces_row option;
      [@ocaml.doc "The state of the row after the change operation that generated this record.\n"]
  clustering_keys : keyspaces_keys_map option;
      [@ocaml.doc
        "The clustering key columns and their values for the affected row, which determine the \
         order of rows within a partition.\n"]
  partition_keys : keyspaces_keys_map option;
      [@ocaml.doc "The partition key columns and their values for the affected row.\n"]
  origin : origin_type option;
      [@ocaml.doc "The origin or source of this change data capture record.\n"]
  created_at : date option;
      [@ocaml.doc "The timestamp indicating when this change data capture record was created.\n"]
  event_version : Smaws_Lib.Smithy_api.Types.string_ option;
      [@ocaml.doc
        "The version of the record format, used to track the evolution of the record structure \
         over time.\n"]
}
[@@ocaml.doc
  "Represents a change data capture record for a row in an Amazon Keyspaces table, containing both \
   the new and old states of the row.\n"]

type nonrec record_list = record list [@@ocaml.doc ""]

type nonrec list_streams_output = {
  next_token : stream_arn_token option;
      [@ocaml.doc
        " A pagination token that can be used in a subsequent [ListStreams] request. This token is \
         returned if the response contains more streams than can be returned in a single response \
         based on the [maxResults] parameter. \n"]
  streams : stream_list option;
      [@ocaml.doc
        " An array of stream objects, each containing summary information about a stream including \
         its ARN, status, and associated table information. This list includes all streams that \
         match the request criteria. \n"]
}
[@@ocaml.doc ""]

type nonrec list_streams_input = {
  next_token : stream_arn_token option;
      [@ocaml.doc
        " An optional pagination token provided by a previous [ListStreams] operation. If this \
         parameter is specified, the response includes only records beyond the token, up to the \
         value specified by [maxResults]. \n"]
  max_results : Smaws_Lib.Smithy_api.Types.integer option;
      [@ocaml.doc
        " The maximum number of streams to return in a single [ListStreams] request. The default \
         value is 100. The minimum value is 1 and the maximum value is 100. \n"]
  table_name : table_name option;
      [@ocaml.doc
        " The name of the table for which to list streams. Must be used together with \
         [keyspaceName]. If specified, only streams associated with this specific table are \
         returned. \n"]
  keyspace_name : keyspace_name option;
      [@ocaml.doc
        " The name of the keyspace for which to list streams. If specified, only streams \
         associated with tables in this keyspace are returned. If omitted, streams from all \
         keyspaces are included in the results. \n"]
}
[@@ocaml.doc ""]

type nonrec internal_server_exception = {
  message : Smaws_Lib.Smithy_api.Types.string_ option;
      [@ocaml.doc "The service encountered an internal error. Try your request again.\n"]
}
[@@ocaml.doc
  "The Amazon Keyspaces service encountered an unexpected error while processing the request. \n\n\
  \ This internal server error is not related to your request parameters. Retry your request after \
   a brief delay. If the issue persists, contact Amazon Web Services Support with details of your \
   request to help identify and resolve the problem.\n\
  \ "]

type nonrec access_denied_exception = {
  message : Smaws_Lib.Smithy_api.Types.string_ option;
      [@ocaml.doc "You don't have sufficient permissions to perform this action.\n"]
}
[@@ocaml.doc
  "You don't have sufficient access permissions to perform this operation. \n\n\
  \ This exception occurs when your IAM user or role lacks the required permissions to access the \
   Amazon Keyspaces resource or perform the requested action. Check your IAM policies and ensure \
   they grant the necessary permissions.\n\
  \ "]

type nonrec get_stream_output = {
  next_token : shard_id_token option;
      [@ocaml.doc
        " A pagination token that can be used in a subsequent [GetStream] request. This token is \
         returned if the response contains more shards than can be returned in a single response. \n"]
  shards : shard_description_list option;
      [@ocaml.doc
        " An array of shard objects associated with this stream. Each shard contains a subset of \
         the stream's data records and has its own unique identifier. The collection of shards \
         represents the complete stream data. \n"]
  table_name : table_name;
      [@ocaml.doc
        " The name of the table associated with this stream. The stream captures changes to rows \
         in this Amazon Keyspaces table. \n"]
  keyspace_name : keyspace_name;
      [@ocaml.doc
        " The name of the keyspace containing the table associated with this stream. The keyspace \
         name is part of the table's hierarchical identifier in Amazon Keyspaces. \n"]
  creation_request_date_time : date;
      [@ocaml.doc
        " The date and time when the request to create this stream was issued. The value is \
         represented in ISO 8601 format. \n"]
  stream_view_type : stream_view_type;
      [@ocaml.doc
        " The format of the data records in this stream. Currently, this can be one of the \
         following options: \n\n\
        \ {ul\n\
        \       {-   [NEW_AND_OLD_IMAGES] - both versions of the row, before and after the change. \
         This is the default.\n\
        \           \n\
        \            }\n\
        \       {-   [NEW_IMAGE] - the version of the row after the change.\n\
        \           \n\
        \            }\n\
        \       {-   [OLD_IMAGE] - the version of the row before the change.\n\
        \           \n\
        \            }\n\
        \       {-   [KEYS_ONLY] - the partition and clustering keys of the row that was changed.\n\
        \           \n\
        \            }\n\
        \       }\n\
        \  "]
  stream_status : stream_status;
      [@ocaml.doc
        " The current status of the stream. Values can be [ENABLING], [ENABLED], [DISABLING], or \
         [DISABLED]. Operations on the stream depend on its current status. \n"]
  stream_label : Smaws_Lib.Smithy_api.Types.string_;
      [@ocaml.doc
        " A timestamp that serves as a unique identifier for this stream, used for debugging and \
         monitoring purposes. The stream label represents the point in time when the stream was \
         created. \n"]
  stream_arn : stream_arn;
      [@ocaml.doc
        " The Amazon Resource Name (ARN) that uniquely identifies the stream within Amazon \
         Keyspaces. This ARN can be used in other API operations to reference this specific \
         stream. \n"]
}
[@@ocaml.doc ""]

type nonrec get_stream_input = {
  next_token : shard_id_token option;
      [@ocaml.doc
        " An optional pagination token provided by a previous [GetStream] operation. If this \
         parameter is specified, the response includes only records beyond the token, up to the \
         value specified by [MaxResults]. \n"]
  shard_filter : shard_filter option;
      [@ocaml.doc
        " Optional filter criteria to apply when retrieving shards. You can filter shards based on \
         their parent [shardID] to get a list of children shards to narrow down the results \
         returned by the [GetStream] operation. \n"]
  max_results : Smaws_Lib.Smithy_api.Types.integer option;
      [@ocaml.doc
        " The maximum number of shard objects to return in a single [GetStream] request. The \
         default value is 100. The minimum value is 1 and the maximum value is 100. \n"]
  stream_arn : stream_arn;
      [@ocaml.doc
        " The Amazon Resource Name (ARN) of the stream for which detailed information is \
         requested. This uniquely identifies the specific stream you want to get information \
         about. \n"]
}
[@@ocaml.doc ""]

type nonrec get_shard_iterator_output = {
  shard_iterator : shard_iterator option;
      [@ocaml.doc
        " The unique identifier for the shard iterator. This value is used in the [GetRecords] \
         operation to retrieve data records from the specified shard. Each shard iterator expires \
         15 minutes after it is returned to the requester. \n"]
}
[@@ocaml.doc ""]

type nonrec get_shard_iterator_input = {
  sequence_number : sequence_number option;
      [@ocaml.doc
        " The sequence number of the data record in the shard from which to start reading. \
         Required if [ShardIteratorType] is [AT_SEQUENCE_NUMBER] or [AFTER_SEQUENCE_NUMBER]. This \
         parameter is ignored for other iterator types. \n"]
  shard_iterator_type : shard_iterator_type;
      [@ocaml.doc
        " Determines how the shard iterator is positioned. Must be one of the following: \n\n\
        \ {ul\n\
        \       {-   [TRIM_HORIZON] - Start reading at the last untrimmed record in the shard, \
         which is the oldest data record in the shard.\n\
        \           \n\
        \            }\n\
        \       {-   [AT_SEQUENCE_NUMBER] - Start reading exactly from the specified sequence \
         number.\n\
        \           \n\
        \            }\n\
        \       {-   [AFTER_SEQUENCE_NUMBER] - Start reading right after the specified sequence \
         number. \n\
        \           \n\
        \            }\n\
        \       {-   [LATEST] - Start reading just after the most recent record in the shard, so \
         that you always read the most recent data. \n\
        \           \n\
        \            }\n\
        \       }\n\
        \  "]
  shard_id : shard_id;
      [@ocaml.doc
        " The identifier of the shard within the stream. The shard ID uniquely identifies a subset \
         of the stream's data records that you want to access. \n"]
  stream_arn : stream_arn;
      [@ocaml.doc
        " The Amazon Resource Name (ARN) of the stream for which to get the shard iterator. The \
         ARN uniquely identifies the stream within Amazon Keyspaces. \n"]
}
[@@ocaml.doc ""]

type nonrec iterator_position = BEHIND_TIP [@ocaml.doc ""] | AT_TIP [@ocaml.doc ""]
[@@ocaml.doc ""]

type nonrec iterator_description = {
  iterator_position : iterator_position option;
      [@ocaml.doc
        " Indicates the current iterator's position within the shard. The possible values are: \n\n\
        \ {ul\n\
        \       {-   [AT_TIP] - No more records are currently available.\n\
        \           \n\
        \            }\n\
        \       {-   [BEHIND_TIP] - Additional records may be available.\n\
        \           \n\
        \            }\n\
        \       }\n\
        \   Stream progresses in absence of customer records. [BEHIND_TIP] with an empty \
         [changeRecords] list indicates the stream is progressing but no customer records are \
         available at this position. Continue polling normally.\n\
        \   "]
}
[@@ocaml.doc "Provides information about the current iterator.\n"]

type nonrec get_records_output = {
  iterator_description : iterator_description option;
      [@ocaml.doc
        " Provides information about the current iterator at the time GetRecords request was \
         processed by Keyspaces. \n"]
  next_shard_iterator : shard_iterator option;
      [@ocaml.doc
        " The next position in the shard from which to start sequentially reading data records. If \
         null, the shard has been closed and the requested iterator will not return any more data. \n"]
  change_records : record_list option;
      [@ocaml.doc
        " An array of change data records retrieved from the specified shard. Each record \
         represents a single data modification (insert, update, or delete) to a row in the Amazon \
         Keyspaces table. Records include the primary key columns and information about what data \
         was modified. \n"]
}
[@@ocaml.doc ""]

type nonrec get_records_input = {
  max_results : Smaws_Lib.Smithy_api.Types.integer option;
      [@ocaml.doc
        " The maximum number of records to return in a single [GetRecords] request. The default \
         value is 100. You can specify a limit between 1 and 1000, but the actual number returned \
         might be less than the specified maximum if the size of the data for the returned records \
         exceeds the internal size limit. \n"]
  shard_iterator : shard_iterator;
      [@ocaml.doc
        " The unique identifier of the shard iterator. A shard iterator specifies the position in \
         the shard from which you want to start reading data records sequentially. You obtain this \
         value by calling the [GetShardIterator ] operation. Each shard iterator is valid for 15 \
         minutes after creation. \n"]
}
[@@ocaml.doc ""]
