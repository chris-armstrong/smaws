open Smaws_Lib
let service =
  let open Smaws_Lib.Service in
    {
      namespace = "sqs";
      endpointPrefix = "sqs";
      version = "2012-11-05";
      protocol = Smaws_Lib.Service.AwsJson_1_0
    }
type nonrec untag_queue_request = {
  tag_keys: string list ;
  queue_url: string }
type nonrec unsupported_operation = {
  message: string option }
type nonrec request_throttled = {
  message: string option }
type nonrec queue_does_not_exist = {
  message: string option }
type nonrec invalid_security = {
  message: string option }
type nonrec invalid_address = {
  message: string option }
type nonrec too_many_entries_in_batch_request = {
  message: string option }
type nonrec tag_map = (string * string) list
type nonrec tag_queue_request = {
  tags: tag_map ;
  queue_url: string }
type nonrec start_message_move_task_result = {
  task_handle: string option }
type nonrec start_message_move_task_request =
  {
  max_number_of_messages_per_second: int option ;
  destination_arn: string option ;
  source_arn: string }
type nonrec resource_not_found_exception = {
  message: string option }
type nonrec queue_attribute_name =
  | SqsManagedSseEnabled 
  | RedriveAllowPolicy 
  | FifoThroughputLimit 
  | DeduplicationScope 
  | KmsDataKeyReusePeriodSeconds 
  | KmsMasterKeyId 
  | ContentBasedDeduplication 
  | FifoQueue 
  | RedrivePolicy 
  | ReceiveMessageWaitTimeSeconds 
  | DelaySeconds 
  | ApproximateNumberOfMessagesDelayed 
  | QueueArn 
  | LastModifiedTimestamp 
  | CreatedTimestamp 
  | ApproximateNumberOfMessagesNotVisible 
  | ApproximateNumberOfMessages 
  | MessageRetentionPeriod 
  | MaximumMessageSize 
  | VisibilityTimeout 
  | Policy 
  | All 
type nonrec queue_attribute_map = (queue_attribute_name * string) list
type nonrec set_queue_attributes_request =
  {
  attributes: queue_attribute_map ;
  queue_url: string }
type nonrec over_limit = {
  message: string option }
type nonrec invalid_attribute_value = {
  message: string option }
type nonrec invalid_attribute_name = {
  message: string option }
type nonrec send_message_result =
  {
  sequence_number: string option ;
  message_id: string option ;
  md5_of_message_system_attributes: string option ;
  md5_of_message_attributes: string option ;
  md5_of_message_body: string option }
type nonrec message_attribute_value =
  {
  data_type: string ;
  binary_list_values: bytes list option ;
  string_list_values: string list option ;
  binary_value: bytes option ;
  string_value: string option }
type nonrec message_body_attribute_map =
  (string * message_attribute_value) list
type nonrec message_system_attribute_value =
  {
  data_type: string ;
  binary_list_values: bytes list option ;
  string_list_values: string list option ;
  binary_value: bytes option ;
  string_value: string option }
type nonrec message_system_attribute_name_for_sends =
  | AWSTraceHeader 
type nonrec message_body_system_attribute_map =
  (message_system_attribute_name_for_sends * message_system_attribute_value)
    list
type nonrec send_message_request =
  {
  message_group_id: string option ;
  message_deduplication_id: string option ;
  message_system_attributes: message_body_system_attribute_map option ;
  message_attributes: message_body_attribute_map option ;
  delay_seconds: int option ;
  message_body: string ;
  queue_url: string }
type nonrec send_message_batch_result_entry =
  {
  sequence_number: string option ;
  md5_of_message_system_attributes: string option ;
  md5_of_message_attributes: string option ;
  md5_of_message_body: string ;
  message_id: string ;
  id: string }
type nonrec batch_result_error_entry =
  {
  message: string option ;
  code: string ;
  sender_fault: bool ;
  id: string }
type nonrec send_message_batch_result =
  {
  failed: batch_result_error_entry list ;
  successful: send_message_batch_result_entry list }
type nonrec send_message_batch_request_entry =
  {
  message_group_id: string option ;
  message_deduplication_id: string option ;
  message_system_attributes: message_body_system_attribute_map option ;
  message_attributes: message_body_attribute_map option ;
  delay_seconds: int option ;
  message_body: string ;
  id: string }
type nonrec send_message_batch_request =
  {
  entries: send_message_batch_request_entry list ;
  queue_url: string }
type nonrec kms_throttled = {
  message: string option }
type nonrec kms_opt_in_required = {
  message: string option }
type nonrec kms_not_found = {
  message: string option }
type nonrec kms_invalid_state = {
  message: string option }
type nonrec kms_invalid_key_usage = {
  message: string option }
type nonrec kms_disabled = {
  message: string option }
type nonrec kms_access_denied = {
  message: string option }
type nonrec invalid_batch_entry_id = {
  message: string option }
type nonrec empty_batch_request = {
  message: string option }
type nonrec batch_request_too_long = {
  message: string option }
type nonrec batch_entry_ids_not_distinct = {
  message: string option }
type nonrec invalid_message_contents = {
  message: string option }
type nonrec remove_permission_request = {
  label: string ;
  queue_url: string }
type nonrec message_system_attribute_name =
  | DeadLetterQueueSourceArn 
  | AWSTraceHeader 
  | MessageGroupId 
  | MessageDeduplicationId 
  | SequenceNumber 
  | ApproximateFirstReceiveTimestamp 
  | ApproximateReceiveCount 
  | SentTimestamp 
  | SenderId 
  | All 
type nonrec message_system_attribute_map =
  (message_system_attribute_name * string) list
type nonrec message =
  {
  message_attributes: message_body_attribute_map option ;
  md5_of_message_attributes: string option ;
  attributes: message_system_attribute_map option ;
  body: string option ;
  md5_of_body: string option ;
  receipt_handle: string option ;
  message_id: string option }
type nonrec receive_message_result = {
  messages: message list option }
type nonrec receive_message_request =
  {
  receive_request_attempt_id: string option ;
  wait_time_seconds: int option ;
  visibility_timeout: int option ;
  max_number_of_messages: int option ;
  message_attribute_names: string list option ;
  message_system_attribute_names: message_system_attribute_name list option ;
  attribute_names: queue_attribute_name list option ;
  queue_url: string }
type nonrec receipt_handle_is_invalid = {
  message: string option }
type nonrec queue_name_exists = {
  message: string option }
type nonrec queue_deleted_recently = {
  message: string option }
type nonrec purge_queue_request = {
  queue_url: string }
type nonrec purge_queue_in_progress = {
  message: string option }
type nonrec message_not_inflight = unit
type nonrec list_queues_result =
  {
  next_token: string option ;
  queue_urls: string list option }
type nonrec list_queues_request =
  {
  max_results: int option ;
  next_token: string option ;
  queue_name_prefix: string option }
type nonrec list_queue_tags_result = {
  tags: tag_map option }
type nonrec list_queue_tags_request = {
  queue_url: string }
type nonrec list_message_move_tasks_result_entry =
  {
  started_timestamp: int option ;
  failure_reason: string option ;
  approximate_number_of_messages_to_move: int option ;
  approximate_number_of_messages_moved: int option ;
  max_number_of_messages_per_second: int option ;
  destination_arn: string option ;
  source_arn: string option ;
  status: string option ;
  task_handle: string option }
type nonrec list_message_move_tasks_result =
  {
  results: list_message_move_tasks_result_entry list option }
type nonrec list_message_move_tasks_request =
  {
  max_results: int option ;
  source_arn: string }
type nonrec list_dead_letter_source_queues_result =
  {
  next_token: string option ;
  queue_urls: string list }
type nonrec list_dead_letter_source_queues_request =
  {
  max_results: int option ;
  next_token: string option ;
  queue_url: string }
type nonrec invalid_id_format = unit
type nonrec get_queue_url_result = {
  queue_url: string option }
type nonrec get_queue_url_request =
  {
  queue_owner_aws_account_id: string option ;
  queue_name: string }
type nonrec get_queue_attributes_result =
  {
  attributes: queue_attribute_map option }
type nonrec get_queue_attributes_request =
  {
  attribute_names: queue_attribute_name list option ;
  queue_url: string }
type nonrec delete_queue_request = {
  queue_url: string }
type nonrec delete_message_request =
  {
  receipt_handle: string ;
  queue_url: string }
type nonrec delete_message_batch_result_entry = {
  id: string }
type nonrec delete_message_batch_result =
  {
  failed: batch_result_error_entry list ;
  successful: delete_message_batch_result_entry list }
type nonrec delete_message_batch_request_entry =
  {
  receipt_handle: string ;
  id: string }
type nonrec delete_message_batch_request =
  {
  entries: delete_message_batch_request_entry list ;
  queue_url: string }
type nonrec create_queue_result = {
  queue_url: string option }
type nonrec create_queue_request =
  {
  tags: tag_map option ;
  attributes: queue_attribute_map option ;
  queue_name: string }
type nonrec change_message_visibility_request =
  {
  visibility_timeout: int ;
  receipt_handle: string ;
  queue_url: string }
type nonrec change_message_visibility_batch_result_entry = {
  id: string }
type nonrec change_message_visibility_batch_result =
  {
  failed: batch_result_error_entry list ;
  successful: change_message_visibility_batch_result_entry list }
type nonrec change_message_visibility_batch_request_entry =
  {
  visibility_timeout: int option ;
  receipt_handle: string ;
  id: string }
type nonrec change_message_visibility_batch_request =
  {
  entries: change_message_visibility_batch_request_entry list ;
  queue_url: string }
type nonrec cancel_message_move_task_result =
  {
  approximate_number_of_messages_moved: int option }
type nonrec cancel_message_move_task_request = {
  task_handle: string }
type nonrec add_permission_request =
  {
  actions: string list ;
  aws_account_ids: string list ;
  label: string ;
  queue_url: string }