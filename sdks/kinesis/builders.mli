open Types

val make_stream_mode_details : stream_mode:stream_mode -> unit -> stream_mode_details

val make_update_stream_mode_input :
  stream_mode_details:stream_mode_details ->
  stream_ar_n:stream_ar_n ->
  unit ->
  update_stream_mode_input

val make_update_shard_count_output :
  ?stream_ar_n:stream_ar_n ->
  ?target_shard_count:positive_integer_object ->
  ?current_shard_count:positive_integer_object ->
  ?stream_name:stream_name ->
  unit ->
  update_shard_count_output

val make_update_shard_count_input :
  ?stream_ar_n:stream_ar_n ->
  ?stream_name:stream_name ->
  scaling_type:scaling_type ->
  target_shard_count:positive_integer_object ->
  unit ->
  update_shard_count_input

val make_untag_resource_input :
  resource_ar_n:resource_ar_n -> tag_keys:tag_key_list -> unit -> untag_resource_input

val make_tag_resource_input :
  resource_ar_n:resource_ar_n -> tags:tag_map -> unit -> tag_resource_input

val make_tag : ?value:tag_value -> key:tag_key -> unit -> tag

val make_record :
  ?encryption_type:encryption_type ->
  ?approximate_arrival_timestamp:timestamp ->
  partition_key:partition_key ->
  data:data ->
  sequence_number:sequence_number ->
  unit ->
  record

val make_hash_key_range :
  ending_hash_key:hash_key -> starting_hash_key:hash_key -> unit -> hash_key_range

val make_child_shard :
  hash_key_range:hash_key_range ->
  parent_shards:shard_id_list ->
  shard_id:shard_id ->
  unit ->
  child_shard

val make_subscribe_to_shard_event :
  ?child_shards:child_shard_list ->
  millis_behind_latest:millis_behind_latest ->
  continuation_sequence_number:sequence_number ->
  records:record_list ->
  unit ->
  subscribe_to_shard_event

val make_subscribe_to_shard_output :
  event_stream:subscribe_to_shard_event_stream -> unit -> subscribe_to_shard_output

val make_starting_position :
  ?timestamp:timestamp ->
  ?sequence_number:sequence_number ->
  type_:shard_iterator_type ->
  unit ->
  starting_position

val make_subscribe_to_shard_input :
  starting_position:starting_position ->
  shard_id:shard_id ->
  consumer_ar_n:consumer_ar_n ->
  unit ->
  subscribe_to_shard_input

val make_stream_summary :
  ?stream_creation_timestamp:timestamp ->
  ?stream_mode_details:stream_mode_details ->
  stream_status:stream_status ->
  stream_ar_n:stream_ar_n ->
  stream_name:stream_name ->
  unit ->
  stream_summary

val make_enhanced_metrics : ?shard_level_metrics:metrics_name_list -> unit -> enhanced_metrics

val make_stream_description_summary :
  ?consumer_count:consumer_count_object ->
  ?key_id:key_id ->
  ?encryption_type:encryption_type ->
  ?stream_mode_details:stream_mode_details ->
  open_shard_count:shard_count_object ->
  enhanced_monitoring:enhanced_monitoring_list ->
  stream_creation_timestamp:timestamp ->
  retention_period_hours:retention_period_hours ->
  stream_status:stream_status ->
  stream_ar_n:stream_ar_n ->
  stream_name:stream_name ->
  unit ->
  stream_description_summary

val make_sequence_number_range :
  ?ending_sequence_number:sequence_number ->
  starting_sequence_number:sequence_number ->
  unit ->
  sequence_number_range

val make_shard :
  ?adjacent_parent_shard_id:shard_id ->
  ?parent_shard_id:shard_id ->
  sequence_number_range:sequence_number_range ->
  hash_key_range:hash_key_range ->
  shard_id:shard_id ->
  unit ->
  shard

val make_stream_description :
  ?key_id:key_id ->
  ?encryption_type:encryption_type ->
  ?stream_mode_details:stream_mode_details ->
  enhanced_monitoring:enhanced_monitoring_list ->
  stream_creation_timestamp:timestamp ->
  retention_period_hours:retention_period_hours ->
  has_more_shards:boolean_object ->
  shards:shard_list ->
  stream_status:stream_status ->
  stream_ar_n:stream_ar_n ->
  stream_name:stream_name ->
  unit ->
  stream_description

val make_stop_stream_encryption_input :
  ?stream_ar_n:stream_ar_n ->
  ?stream_name:stream_name ->
  key_id:key_id ->
  encryption_type:encryption_type ->
  unit ->
  stop_stream_encryption_input

val make_start_stream_encryption_input :
  ?stream_ar_n:stream_ar_n ->
  ?stream_name:stream_name ->
  key_id:key_id ->
  encryption_type:encryption_type ->
  unit ->
  start_stream_encryption_input

val make_split_shard_input :
  ?stream_ar_n:stream_ar_n ->
  ?stream_name:stream_name ->
  new_starting_hash_key:hash_key ->
  shard_to_split:shard_id ->
  unit ->
  split_shard_input

val make_shard_filter :
  ?timestamp:timestamp -> ?shard_id:shard_id -> type_:shard_filter_type -> unit -> shard_filter

val make_remove_tags_from_stream_input :
  ?stream_ar_n:stream_ar_n ->
  ?stream_name:stream_name ->
  tag_keys:tag_key_list ->
  unit ->
  remove_tags_from_stream_input

val make_consumer :
  consumer_creation_timestamp:timestamp ->
  consumer_status:consumer_status ->
  consumer_ar_n:consumer_ar_n ->
  consumer_name:consumer_name ->
  unit ->
  consumer

val make_register_stream_consumer_output :
  consumer:consumer -> unit -> register_stream_consumer_output

val make_register_stream_consumer_input :
  ?tags:tag_map ->
  consumer_name:consumer_name ->
  stream_ar_n:stream_ar_n ->
  unit ->
  register_stream_consumer_input

val make_put_resource_policy_input :
  policy:policy -> resource_ar_n:resource_ar_n -> unit -> put_resource_policy_input

val make_put_records_result_entry :
  ?error_message:error_message ->
  ?error_code:error_code ->
  ?shard_id:shard_id ->
  ?sequence_number:sequence_number ->
  unit ->
  put_records_result_entry

val make_put_records_request_entry :
  ?explicit_hash_key:hash_key ->
  partition_key:partition_key ->
  data:data ->
  unit ->
  put_records_request_entry

val make_put_records_output :
  ?encryption_type:encryption_type ->
  ?failed_record_count:positive_integer_object ->
  records:put_records_result_entry_list ->
  unit ->
  put_records_output

val make_put_records_input :
  ?stream_ar_n:stream_ar_n ->
  ?stream_name:stream_name ->
  records:put_records_request_entry_list ->
  unit ->
  put_records_input

val make_put_record_output :
  ?encryption_type:encryption_type ->
  sequence_number:sequence_number ->
  shard_id:shard_id ->
  unit ->
  put_record_output

val make_put_record_input :
  ?stream_ar_n:stream_ar_n ->
  ?sequence_number_for_ordering:sequence_number ->
  ?explicit_hash_key:hash_key ->
  ?stream_name:stream_name ->
  partition_key:partition_key ->
  data:data ->
  unit ->
  put_record_input

val make_merge_shards_input :
  ?stream_ar_n:stream_ar_n ->
  ?stream_name:stream_name ->
  adjacent_shard_to_merge:shard_id ->
  shard_to_merge:shard_id ->
  unit ->
  merge_shards_input

val make_list_tags_for_stream_output :
  has_more_tags:boolean_object -> tags:tag_list -> unit -> list_tags_for_stream_output

val make_list_tags_for_stream_input :
  ?stream_ar_n:stream_ar_n ->
  ?limit:list_tags_for_stream_input_limit ->
  ?exclusive_start_tag_key:tag_key ->
  ?stream_name:stream_name ->
  unit ->
  list_tags_for_stream_input

val make_list_tags_for_resource_output : ?tags:tag_list -> unit -> list_tags_for_resource_output

val make_list_tags_for_resource_input :
  resource_ar_n:resource_ar_n -> unit -> list_tags_for_resource_input

val make_list_streams_output :
  ?stream_summaries:stream_summary_list ->
  ?next_token:next_token ->
  has_more_streams:boolean_object ->
  stream_names:stream_name_list ->
  unit ->
  list_streams_output

val make_list_streams_input :
  ?next_token:next_token ->
  ?exclusive_start_stream_name:stream_name ->
  ?limit:list_streams_input_limit ->
  unit ->
  list_streams_input

val make_list_stream_consumers_output :
  ?next_token:next_token -> ?consumers:consumer_list -> unit -> list_stream_consumers_output

val make_list_stream_consumers_input :
  ?stream_creation_timestamp:timestamp ->
  ?max_results:list_stream_consumers_input_limit ->
  ?next_token:next_token ->
  stream_ar_n:stream_ar_n ->
  unit ->
  list_stream_consumers_input

val make_list_shards_output :
  ?next_token:next_token -> ?shards:shard_list -> unit -> list_shards_output

val make_list_shards_input :
  ?stream_ar_n:stream_ar_n ->
  ?shard_filter:shard_filter ->
  ?stream_creation_timestamp:timestamp ->
  ?max_results:list_shards_input_limit ->
  ?exclusive_start_shard_id:shard_id ->
  ?next_token:next_token ->
  ?stream_name:stream_name ->
  unit ->
  list_shards_input

val make_increase_stream_retention_period_input :
  ?stream_ar_n:stream_ar_n ->
  ?stream_name:stream_name ->
  retention_period_hours:retention_period_hours ->
  unit ->
  increase_stream_retention_period_input

val make_get_shard_iterator_output :
  ?shard_iterator:shard_iterator -> unit -> get_shard_iterator_output

val make_get_shard_iterator_input :
  ?stream_ar_n:stream_ar_n ->
  ?timestamp:timestamp ->
  ?starting_sequence_number:sequence_number ->
  ?stream_name:stream_name ->
  shard_iterator_type:shard_iterator_type ->
  shard_id:shard_id ->
  unit ->
  get_shard_iterator_input

val make_get_resource_policy_output : policy:policy -> unit -> get_resource_policy_output

val make_get_resource_policy_input :
  resource_ar_n:resource_ar_n -> unit -> get_resource_policy_input

val make_get_records_output :
  ?child_shards:child_shard_list ->
  ?millis_behind_latest:millis_behind_latest ->
  ?next_shard_iterator:shard_iterator ->
  records:record_list ->
  unit ->
  get_records_output

val make_get_records_input :
  ?stream_ar_n:stream_ar_n ->
  ?limit:get_records_input_limit ->
  shard_iterator:shard_iterator ->
  unit ->
  get_records_input

val make_enhanced_monitoring_output :
  ?stream_ar_n:stream_ar_n ->
  ?desired_shard_level_metrics:metrics_name_list ->
  ?current_shard_level_metrics:metrics_name_list ->
  ?stream_name:stream_name ->
  unit ->
  enhanced_monitoring_output

val make_enable_enhanced_monitoring_input :
  ?stream_ar_n:stream_ar_n ->
  ?stream_name:stream_name ->
  shard_level_metrics:metrics_name_list ->
  unit ->
  enable_enhanced_monitoring_input

val make_disable_enhanced_monitoring_input :
  ?stream_ar_n:stream_ar_n ->
  ?stream_name:stream_name ->
  shard_level_metrics:metrics_name_list ->
  unit ->
  disable_enhanced_monitoring_input

val make_describe_stream_summary_output :
  stream_description_summary:stream_description_summary -> unit -> describe_stream_summary_output

val make_describe_stream_summary_input :
  ?stream_ar_n:stream_ar_n -> ?stream_name:stream_name -> unit -> describe_stream_summary_input

val make_consumer_description :
  stream_ar_n:stream_ar_n ->
  consumer_creation_timestamp:timestamp ->
  consumer_status:consumer_status ->
  consumer_ar_n:consumer_ar_n ->
  consumer_name:consumer_name ->
  unit ->
  consumer_description

val make_describe_stream_consumer_output :
  consumer_description:consumer_description -> unit -> describe_stream_consumer_output

val make_describe_stream_consumer_input :
  ?consumer_ar_n:consumer_ar_n ->
  ?consumer_name:consumer_name ->
  ?stream_ar_n:stream_ar_n ->
  unit ->
  describe_stream_consumer_input

val make_describe_stream_output :
  stream_description:stream_description -> unit -> describe_stream_output

val make_describe_stream_input :
  ?stream_ar_n:stream_ar_n ->
  ?exclusive_start_shard_id:shard_id ->
  ?limit:describe_stream_input_limit ->
  ?stream_name:stream_name ->
  unit ->
  describe_stream_input

val make_describe_limits_output :
  on_demand_stream_count_limit:on_demand_stream_count_limit_object ->
  on_demand_stream_count:on_demand_stream_count_object ->
  open_shard_count:shard_count_object ->
  shard_limit:shard_count_object ->
  unit ->
  describe_limits_output

val make_describe_limits_input : unit -> unit

val make_deregister_stream_consumer_input :
  ?consumer_ar_n:consumer_ar_n ->
  ?consumer_name:consumer_name ->
  ?stream_ar_n:stream_ar_n ->
  unit ->
  deregister_stream_consumer_input

val make_delete_stream_input :
  ?stream_ar_n:stream_ar_n ->
  ?enforce_consumer_deletion:boolean_object ->
  ?stream_name:stream_name ->
  unit ->
  delete_stream_input

val make_delete_resource_policy_input :
  resource_ar_n:resource_ar_n -> unit -> delete_resource_policy_input

val make_decrease_stream_retention_period_input :
  ?stream_ar_n:stream_ar_n ->
  ?stream_name:stream_name ->
  retention_period_hours:retention_period_hours ->
  unit ->
  decrease_stream_retention_period_input

val make_create_stream_input :
  ?tags:tag_map ->
  ?stream_mode_details:stream_mode_details ->
  ?shard_count:positive_integer_object ->
  stream_name:stream_name ->
  unit ->
  create_stream_input

val make_add_tags_to_stream_input :
  ?stream_ar_n:stream_ar_n ->
  ?stream_name:stream_name ->
  tags:tag_map ->
  unit ->
  add_tags_to_stream_input
