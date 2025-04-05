open Smaws_Lib
val service : Smaws_Lib.Service.descriptor
type nonrec trimmed_data_access_exception = {
  message: string option }
type nonrec stream_view_type =
  | KEYS_ONLY 
  | NEW_AND_OLD_IMAGES 
  | OLD_IMAGE 
  | NEW_IMAGE 
type nonrec stream_status =
  | DISABLED 
  | DISABLING 
  | ENABLED 
  | ENABLING 
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
  | S of string 
and map_attribute_value = (string * attribute_value) list
type nonrec attribute_map = (string * attribute_value) list
type nonrec stream_record =
  {
  stream_view_type: stream_view_type option ;
  size_bytes: int option ;
  sequence_number: string option ;
  old_image: attribute_map option ;
  new_image: attribute_map option ;
  keys: attribute_map option ;
  approximate_creation_date_time: CoreTypes.Timestamp.t option }
type nonrec stream =
  {
  stream_label: string option ;
  table_name: string option ;
  stream_arn: string option }
type nonrec key_type =
  | RANGE 
  | HASH 
type nonrec key_schema_element =
  {
  key_type: key_type ;
  attribute_name: string }
type nonrec sequence_number_range =
  {
  ending_sequence_number: string option ;
  starting_sequence_number: string option }
type nonrec shard =
  {
  parent_shard_id: string option ;
  sequence_number_range: sequence_number_range option ;
  shard_id: string option }
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
  stream_arn: string option }
type nonrec shard_iterator_type =
  | AFTER_SEQUENCE_NUMBER 
  | AT_SEQUENCE_NUMBER 
  | LATEST 
  | TRIM_HORIZON 
type nonrec resource_not_found_exception = {
  message: string option }
type nonrec operation_type =
  | REMOVE 
  | MODIFY 
  | INSERT 
type nonrec identity = {
  type_: string option ;
  principal_id: string option }
type nonrec record =
  {
  user_identity: identity option ;
  dynamodb: stream_record option ;
  aws_region: string option ;
  event_source: string option ;
  event_version: string option ;
  event_name: operation_type option ;
  event_i_d: string option }
type nonrec list_streams_output =
  {
  last_evaluated_stream_arn: string option ;
  streams: stream list option }
type nonrec list_streams_input =
  {
  exclusive_start_stream_arn: string option ;
  limit: int option ;
  table_name: string option }
type nonrec internal_server_error = {
  message: string option }
type nonrec limit_exceeded_exception = {
  message: string option }
type nonrec get_shard_iterator_output = {
  shard_iterator: string option }
type nonrec get_shard_iterator_input =
  {
  sequence_number: string option ;
  shard_iterator_type: shard_iterator_type ;
  shard_id: string ;
  stream_arn: string }
type nonrec get_records_output =
  {
  next_shard_iterator: string option ;
  records: record list option }
type nonrec get_records_input = {
  limit: int option ;
  shard_iterator: string }
type nonrec expired_iterator_exception = {
  message: string option }
type nonrec describe_stream_output =
  {
  stream_description: stream_description option }
type nonrec describe_stream_input =
  {
  exclusive_start_shard_id: string option ;
  limit: int option ;
  stream_arn: string }