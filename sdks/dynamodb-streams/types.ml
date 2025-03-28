open Smaws_Lib.CoreTypes
let service =
  let open Smaws_Lib.Service in
    {
      namespace = "dynamodb";
      endpointPrefix = "streams.dynamodb";
      version = "2012-08-10";
      protocol = Smaws_Lib.Service.AwsJson_1_0
    }
type nonrec error_message = string
type nonrec trimmed_data_access_exception = {
  message: string option }
type nonrec table_name = string
type nonrec string_attribute_value = string
type nonrec string_set_attribute_value = string list option list
type nonrec string_ = string
type nonrec base_unit = unit
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
type nonrec date = Timestamp.t
type nonrec number_attribute_value = string
type nonrec binary_attribute_value = bytes
type nonrec number_set_attribute_value = string list option list
type nonrec binary_set_attribute_value = bytes list option list
type nonrec attribute_name = string
type nonrec null_attribute_value = bool
type nonrec boolean_attribute_value = bool
type attribute_value = unit
and list_attribute_value = attribute_value list option list
and map_attribute_value = (string_ option * attribute_value option) list
type nonrec attribute_map = (string_ option * attribute_value option) list
type nonrec sequence_number = string
type nonrec positive_long_object = int
type nonrec stream_record =
  {
  stream_view_type: stream_view_type option ;
  size_bytes: int option ;
  sequence_number: string option ;
  old_image: (string * attribute_value) list option ;
  new_image: (string * attribute_value) list option ;
  keys: (string * attribute_value) list option ;
  approximate_creation_date_time: float option }
type nonrec stream_arn = string
type nonrec stream =
  {
  stream_label: string option ;
  table_name: string option ;
  stream_arn: string option }
type nonrec stream_list = stream list option list
type nonrec key_schema_attribute_name = string
type nonrec key_type =
  | RANGE 
  | HASH 
type nonrec key_schema_element =
  {
  key_type: key_type ;
  attribute_name: string }
type nonrec key_schema = key_schema_element list option list
type nonrec shard_id = string
type nonrec sequence_number_range =
  {
  ending_sequence_number: string option ;
  starting_sequence_number: string option }
type nonrec shard =
  {
  parent_shard_id: string option ;
  sequence_number_range: sequence_number_range option ;
  shard_id: string option }
type nonrec shard_description_list = shard list option list
type nonrec stream_description =
  {
  last_evaluated_shard_id: string option ;
  shards: shard list option ;
  key_schema: key_schema_element list option ;
  table_name: string option ;
  creation_request_date_time: float option ;
  stream_view_type: stream_view_type option ;
  stream_status: stream_status option ;
  stream_label: string option ;
  stream_arn: string option }
type nonrec shard_iterator_type =
  | AFTER_SEQUENCE_NUMBER 
  | AT_SEQUENCE_NUMBER 
  | LATEST 
  | TRIM_HORIZON 
type nonrec shard_iterator = string
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
type nonrec record_list = record list option list
type nonrec positive_integer_object = int
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
type nonrec dynamo_db_streams_20120810 = unit
type nonrec base_string = string
type nonrec base_boolean = bool
type nonrec base_integer = int
type nonrec base_timestamp = Timestamp.t
type nonrec base_long = int
type nonrec base_document = Document.t