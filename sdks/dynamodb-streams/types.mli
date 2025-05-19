open Smaws_Lib
val service : Smaws_Lib.Service.descriptor
type nonrec trimmed_data_access_exception = {
  message: string option }[@@ocaml.doc
                            "The operation attempted to read past the oldest stream record in a shard.\n\n In DynamoDB Streams, there is a 24 hour limit on data retention. Stream records whose age exceeds this limit are subject to removal (trimming) from the stream. You might receive a TrimmedDataAccessException if:\n \n  {ul\n        {-  You request a shard iterator with a sequence number older than the trim point (24 hours).\n            \n             }\n        {-  You obtain a shard iterator, but before you use the iterator in a [GetRecords] request, a stream record in the shard exceeds the 24 hour period and is trimmed. This causes the iterator to access a record that no longer exists.\n            \n             }\n        }\n  "]
type nonrec stream_view_type =
  | KEYS_ONLY 
  | NEW_AND_OLD_IMAGES 
  | OLD_IMAGE 
  | NEW_IMAGE [@@ocaml.doc ""]
type nonrec stream_status =
  | DISABLED 
  | DISABLING 
  | ENABLED 
  | ENABLING [@@ocaml.doc ""]
type attribute_value =
  | BOOL of bool 
  | NULL of bool 
  | L of attribute_value list 
  | M of map_attribute_value 
  | BS of bytes list 
  | NS of string list 
  | SS of string list 
  | B of bytes 
  | N of string 
  | S of string [@@ocaml.doc
                  "Represents the data for an attribute.\n\n Each attribute value is described as a name-value pair. The name is the data type, and the value is the data itself.\n \n  For more information, see {{:https://docs.aws.amazon.com/amazondynamodb/latest/developerguide/HowItWorks.NamingRulesDataTypes.html#HowItWorks.DataTypes}Data Types} in the {i Amazon DynamoDB Developer Guide}.\n  "]
and map_attribute_value = (string * attribute_value) list[@@ocaml.doc ""]
type nonrec attribute_map = (string * attribute_value) list[@@ocaml.doc ""]
type nonrec stream_record =
  {
  stream_view_type: stream_view_type option ;
  size_bytes: int option ;
  sequence_number: string option ;
  old_image: attribute_map option ;
  new_image: attribute_map option ;
  keys: attribute_map option ;
  approximate_creation_date_time: CoreTypes.Timestamp.t option }[@@ocaml.doc
                                                                  "A description of a single data modification that was performed on an item in a DynamoDB table.\n"]
type nonrec stream =
  {
  stream_label: string option ;
  table_name: string option ;
  stream_arn: string option }[@@ocaml.doc
                               "Represents all of the data describing a particular stream.\n"]
type nonrec key_type =
  | RANGE 
  | HASH [@@ocaml.doc ""]
type nonrec key_schema_element =
  {
  key_type: key_type ;
  attribute_name: string }[@@ocaml.doc
                            "Represents {i a single element} of a key schema. A key schema specifies the attributes that make up the primary key of a table, or the key attributes of an index.\n\n A [KeySchemaElement] represents exactly one attribute of the primary key. For example, a simple primary key would be represented by one [KeySchemaElement] (for the partition key). A composite primary key would require one [KeySchemaElement] for the partition key, and another [KeySchemaElement] for the sort key.\n \n  A [KeySchemaElement] must be a scalar, top-level attribute (not a nested attribute). The data type must be one of String, Number, or Binary. The attribute cannot be nested within a List or a Map.\n  "]
type nonrec sequence_number_range =
  {
  ending_sequence_number: string option ;
  starting_sequence_number: string option }[@@ocaml.doc
                                             "The beginning and ending sequence numbers for the stream records contained within a shard.\n"]
type nonrec shard =
  {
  parent_shard_id: string option ;
  sequence_number_range: sequence_number_range option ;
  shard_id: string option }[@@ocaml.doc
                             "A uniquely identified group of stream records within a stream.\n"]
type nonrec stream_description =
  {
  last_evaluated_shard_id: string option ;
  shards: shard list option ;
  key_schema: key_schema_element list option ;
  table_name: string option ;
  creation_request_date_time: CoreTypes.Timestamp.t option ;
  stream_view_type: stream_view_type option ;
  stream_status: stream_status option ;
  stream_label: string option ;
  stream_arn: string option }[@@ocaml.doc
                               "Represents all of the data describing a particular stream.\n"]
type nonrec shard_iterator_type =
  | AFTER_SEQUENCE_NUMBER 
  | AT_SEQUENCE_NUMBER 
  | LATEST 
  | TRIM_HORIZON [@@ocaml.doc ""]
type nonrec resource_not_found_exception = {
  message: string option }[@@ocaml.doc
                            "The operation tried to access a nonexistent table or index. The resource might not be specified correctly, or its status might not be [ACTIVE].\n"]
type nonrec operation_type =
  | REMOVE 
  | MODIFY 
  | INSERT [@@ocaml.doc ""]
type nonrec identity = {
  type_: string option ;
  principal_id: string option }[@@ocaml.doc
                                 "Contains details about the type of identity that made the request.\n"]
type nonrec record =
  {
  user_identity: identity option ;
  dynamodb: stream_record option ;
  aws_region: string option ;
  event_source: string option ;
  event_version: string option ;
  event_name: operation_type option ;
  event_i_d: string option }[@@ocaml.doc
                              "A description of a unique event within a stream.\n"]
type nonrec list_streams_output =
  {
  last_evaluated_stream_arn: string option ;
  streams: stream list option }[@@ocaml.doc
                                 "Represents the output of a [ListStreams] operation.\n"]
type nonrec list_streams_input =
  {
  exclusive_start_stream_arn: string option ;
  limit: int option ;
  table_name: string option }[@@ocaml.doc
                               "Represents the input of a [ListStreams] operation.\n"]
type nonrec internal_server_error = {
  message: string option }[@@ocaml.doc
                            "An error occurred on the server side.\n"]
type nonrec limit_exceeded_exception = {
  message: string option }[@@ocaml.doc
                            "There is no limit to the number of daily on-demand backups that can be taken. \n\n For most purposes, up to 500 simultaneous table operations are allowed per account. These operations include [CreateTable], [UpdateTable], [DeleteTable],[UpdateTimeToLive], [RestoreTableFromBackup], and [RestoreTableToPointInTime]. \n \n  When you are creating a table with one or more secondary indexes, you can have up to 250 such requests running at a time. However, if the table or index specifications are complex, then DynamoDB might temporarily reduce the number of concurrent operations.\n  \n   When importing into DynamoDB, up to 50 simultaneous import table operations are allowed per account.\n   \n    There is a soft account quota of 2,500 tables.\n    \n     GetRecords was called with a value of more than 1000 for the limit request parameter.\n     \n      More than 2 processes are reading from the same streams shard at the same time. Exceeding this limit may result in request throttling.\n      "]
type nonrec get_shard_iterator_output = {
  shard_iterator: string option }[@@ocaml.doc
                                   "Represents the output of a [GetShardIterator] operation.\n"]
type nonrec get_shard_iterator_input =
  {
  sequence_number: string option ;
  shard_iterator_type: shard_iterator_type ;
  shard_id: string ;
  stream_arn: string }[@@ocaml.doc
                        "Represents the input of a [GetShardIterator] operation.\n"]
type nonrec get_records_output =
  {
  next_shard_iterator: string option ;
  records: record list option }[@@ocaml.doc
                                 "Represents the output of a [GetRecords] operation.\n"]
type nonrec get_records_input = {
  limit: int option ;
  shard_iterator: string }[@@ocaml.doc
                            "Represents the input of a [GetRecords] operation.\n"]
type nonrec expired_iterator_exception = {
  message: string option }[@@ocaml.doc
                            "The shard iterator has expired and can no longer be used to retrieve stream records. A shard iterator expires 15 minutes after it is retrieved using the [GetShardIterator] action.\n"]
type nonrec describe_stream_output =
  {
  stream_description: stream_description option }[@@ocaml.doc
                                                   "Represents the output of a [DescribeStream] operation.\n"]
type nonrec describe_stream_input =
  {
  exclusive_start_shard_id: string option ;
  limit: int option ;
  stream_arn: string }[@@ocaml.doc
                        "Represents the input of a [DescribeStream] operation.\n"]